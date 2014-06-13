#!/bin/bash

# Constants.
BASE_DIR=`pwd`
MIN_JAVA_VER=18
LOG_DIR=$BASE_DIR/log

declare -a core=(
        "maven-parent"
        "bukkit-parent"
        "type-safe-collections"
    )
declare -a primary=(
        "mbapi"
        "mc-minerap"
        "mc-chimera"
    )
declare -a secondary=(
        "block-saver"
        "book-dupe"
        "dueler"
        "insight-jdbc"
        "insight-web"
        "pearl-nerf"
        "radio"
    )

# Functions.
install_lib() {
    echo "--- Compiling $1"
    cd $1/
    rc=$?
    if [[ $rc != 0 ]]; then 
        echo "[ERROR] Failed to enter directory $1. Check $2 for more info."; exit $rc
    fi
    mvn clean compile package install >>$2 2>&1
    rc=$?
    cd $BASE_DIR/
    if [[ $rc != 0 ]]; then 
        echo "[ERROR] Failed to compile $1. Check $2 for more info."; exit $rc
    fi
    echo "--- Compiled successfully"
}

clean() {
    echo "--- Removing log/ directory"
    rm -rf $BASE_DIR/log/
    echo "--- Removing target/ directory"
    rm -rf $BASE_DIR/target/
}

setup() {
    # Initial setup.
    echo "--- Creating log/ directory"
    mkdir -p $BASE_DIR/log/
    echo "--- Creating target/ directory"
    mkdir -p $BASE_DIR/target/
}

check_java_executable() {
    # Check that Java is present.
    if type -p java >/dev/null; then
        echo "--- Java executable found in PATH"
        _java=java
    elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
        echo "--- Java executable found in JAVA_HOME"
        _java="$JAVA_HOME/bin/java"
    else
        echo "[ERROR] Java executable not found!"
        exit 1
    fi
}

# Ensure that the Java version is above the required minimum.
check_java_ver() {
    JAVA_VER=$(java -version 2>&1 | sed 's/java version "\(.*\)\.\(.*\)\..*"/\1\2/; 1q')

    if [[ "$JAVA_VER" -ge $1 ]]; then
        echo "--- Java version is $JAVA_VER"
    else
        echo "[ERROR] Java version ($JAVA_VER) is less than the minimum: $1"
        exit 1
    fi
}

# Check that Maven is present.
check_maven() {
    if hash mvn >&2; then
        echo "--- Found maven"
    else
        echo "[ERROR] Maven not found!"
        exit 1
    fi
}

main() {
    echo "Performing clean..."
    clean

    echo
    echo "Performing initial setup..."
    setup
    
    echo
    echo "Performing initial checks..."
    check_java_executable
    check_java_ver $MIN_JAVA_VER
    check_maven

    echo
    echo "Building MinerAp core"
    for lib in "${core[@]}"
    do
        install_lib $lib $LOG_DIR/core.log
    done
    
    echo
    echo "Building MinerAp primary"
    for lib in "${primary[@]}"
    do
        install_lib $lib $LOG_DIR/primary.log
    done

    echo
    echo "Building MinerAp secondary"
    for lib in "${secondary[@]}"
    do
        install_lib $lib $LOG_DIR/secondary.log
    done
}

main

