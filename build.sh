#!/bin/bash

# Constants.
BASE_DIR=`pwd`
MIN_JAVA_VER=18
LOG_DIR=$BASE_DIR/log
TARGET_DIR=$BASE_DIR/target

declare -a core=(
        "maven-parent"
        "bukkit-parent"
        "type-safe-collections"
    )
declare -a primary=(
        "mbapi"
        "mc-minerap"
        "mc-chimera"
        "insight-api"
    )
declare -a secondary=(
        "prism"
        "block-saver"
        "book-dupe"
        "dueler"
        "pearl-nerf"
        "radio"
        "insight-jdbc"
        "insight-web"
    )

# Functions.
install_lib() {
    echo "--- Compiling $1"
    
    cd $BASE_DIR/$1/
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
    if [ -d "$BASE_DIR/$1/target/" ]; then
        echo "--- Copying jars to target/ "
        cp $BASE_DIR/$1/target/*.jar $TARGET_DIR
    fi
    
    echo "--- Compiled successfully"
}

clean() {
    echo "--- Removing log/ directory"
    rm -rf $LOG_DIR
    echo "--- Removing target/ directory"
    rm -rf $TARGET_DIR
}

setup() {
    # Initial setup.
    echo "--- Creating log/ directory"
    mkdir -p $LOG_DIR
    echo "--- Creating target/ directory"
    mkdir -p $TARGET_DIR
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

make_group() {
    echo
    echo "Building MinerAp $1"

    looparray="$1[@]"
    for lib in "${!looparray}"
    do
        install_lib $lib $LOG_DIR/$1.log
    done
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

    BUILD_LEVEL=$1

    if [ -z $BUILD_LEVEL ]; then
        echo
        echo "Building entire workspace"

        make_group "core"
        make_group "primary"
        make_group "secondary"

        return
    fi

    echo
    echo "Build level $BUILD_LEVEL selected."

    if [ $BUILD_LEVEL -ge 1 ]; then
        make_group "core"
    else
        echo
        echo "Failed to build anything."
        echo "Specify a build level greater than 0."
        exit 1
    fi

    if [ $BUILD_LEVEL -ge 2 ]; then
        make_group "primary"
    else
        echo "Finished!"
        return
    fi

    if [ $BUILD_LEVEL -ge 3 ]; then
        make_group "secondary"
    else
        return
    fi
}

install_combat_tag() {
    echo
    echo "Installing Combat Tag to maven repo..."

    echo "--- Entering combat-tag/ directory"
    cd $BASE_DIR/combat-tag/ >>$1 2>&1
    rc=$?
    if [[ $rc != 0 ]]; then 
        echo "[ERROR] Failed to enter combat-tag/ directory. Check $1 for more info."; exit $rc
    fi
    
    echo "--- Installing jar into maven repo"
    mvn install:install-file \
        -DpomFile=combat-tag-6.1.3.pom \
        -Dfile=combat-tag-6.1.3.jar >>$1 2>&1
    rc=$?
    if [[ $rc != 0 ]]; then 
        echo "[ERROR] Failed to install Combat Tag into maven repo. Check $1 for more info."; exit $rc
    fi

    echo "--- Combat Tag installation complete!"
}

if [[ "$1" == "install_combat_tag" ]]; then
    install_combat_tag $LOG_DIR/combat_tag.log
else
    main $1
fi

echo "Finished!"
