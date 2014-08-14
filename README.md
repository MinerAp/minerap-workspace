# minerap-workspace

`minerap-workspace` is used to store links to all MinerAp-related projects using git submodules.
It is intended to provide the functionality build all MinerAp-related projects with a single command.

It is intended for Linux and OS X (the central script is written in Bash), but can be used with full functionality under Cygwin. If you don't use any of those platforms, `minerap-workspace` can still be useful because it provides a useful way to centralize all of the relevant repositories on your machine, and keep them synchronized.

# Prerequisites

* Java JDK >= 1.8.0
* Maven >= 3

# Instructions

Open a terminal window and type:
    
    git clone --recursive https://github.com/MinerAp/minerap-workspace.git
    cd minerap-workspace/
    chmod +x build.sh
    ./build.sh

Build logs are stored in `log/`, which is created by the script.
After the build is complete, all of the submodules' `.jar`s will be available in `target/`.

Optionally, when running the script, you can specify the level of plugins you want to compile (e.g. just `core` and `primary`) by passing an integer argument (1 to 3) when running the build script:

    ./build.sh 2

Without the argument, everything in the workspace will be compiled.

If pearl-nerf compilation fails and everything else succeeds, it is most likely because you do not have Combat Tag installed in your local repo.
You should always check the logs first, but you can most likely resolve the issue by first running:

    ./build.sh install_combat_tag

# Status

Here you can find the Travis CI build status of all MinerAp-related repositories:

## Insight

Name|Build Status
----|------
[insight-parent](https://github.com/MinerAp/insight-parent)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-parent.png)](http://travis-ci.org/#!/MinerAp/insight-parent)
[insight-api](https://github.com/MinerAp/insight-api)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-api.png)](http://travis-ci.org/#!/MinerAp/insight-api)
[insight-jdbc](https://github.com/MinerAp/insight-jdbc)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-jdbc.png)](http://travis-ci.org/#!/MinerAp/insight-jdbc)
[insight-web](https://github.com/MinerAp/insight-web)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-web.png)](http://travis-ci.org/#!/MinerAp/insight-web)
[insight-cb](https://github.com/MinerAp/insight-cb)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-cb.png)](http://travis-ci.org/#!/MinerAp/insight-cb)
[insight-common](https://github.com/MinerAp/insight-common)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-common.png)](http://travis-ci.org/#!/MinerAp/insight-common)
[insight-sql](https://github.com/MinerAp/insight-sql)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-sql.png)](http://travis-ci.org/#!/MinerAp/insight-sql)
[insight-parser](https://github.com/MinerAp/insight-parser)|[![Travis CI](https://secure.travis-ci.org/MinerAp/insight-parser.png)](http://travis-ci.org/#!/MinerAp/insight-parser)

## Misc. Plugins
Name|Build Status
----|------
[block-saver](https://github.com/MinerAp/block-saver)|[![Travis CI](https://secure.travis-ci.org/MinerAp/block-saver.png)](http://travis-ci.org/#!/MinerAp/block-saver)
[book-dupe](https://github.com/MinerAp/book-dupe)|[![Travis CI](https://secure.travis-ci.org/MinerAp/book-dupe.png)](http://travis-ci.org/#!/MinerAp/book-dupe)
[dueler](https://github.com/MinerAp/dueler)|[![Travis CI](https://secure.travis-ci.org/MinerAp/dueler.png)](http://travis-ci.org/#!/MinerAp/dueler)
[expbottles](https://github.com/MinerAp/expbottles)|[![Travis CI](https://secure.travis-ci.org/MinerAp/expbottles.png)](http://travis-ci.org/#!/MinerAp/expbottles)
[pearl-nerf](https://github.com/MinerAp/pearl-nerf)|[![Travis CI](https://secure.travis-ci.org/MinerAp/pearl-nerf.png)](http://travis-ci.org/#!/MinerAp/pearl-nerf)
[radio](https://github.com/MinerAp/radio)|[![Travis CI](https://secure.travis-ci.org/MinerAp/radio.png)](http://travis-ci.org/#!/MinerAp/radio)

# LICENSE

The scripts involved in building this workspace are released under the [BSD (3-clause) license](https://github.com/MinerAp/minerap-workspace/blob/master/LICENSE) found at the root of this project.

All **Github-hosted** projects found in the submodules are licensed according to their included licenses.

**The submodules hosted on Bitbucket are proprietary, closed-source, and are not to be released, re-distributed, or re-licensed without explicit authorization from the owners of the [MinerApocalypse server](https://minerap.com) and the collaborators of this project.**
