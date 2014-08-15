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

Name|Build Status|Coverage
----|------------|--------
[insight-parent][insight-parent_repo]|[![Travis CI][insight-parent_status]][insight-parent_build]|[![Coverage Status][insight-parent_coverage]][insight-parent_coveralls]
[insight-api][insight-api_repo]|[![Travis CI][insight-api_status]][insight-api_build]|[![Coverage Status][insight-api_coverage]][insight-api_coveralls]
[insight-jdbc][insight-jdbc_repo]|[![Travis CI][insight-jdbc_status]][insight-jdbc_build]|[![Coverage Status][insight-jdbc_coverage]][insight-jdbc_coveralls]
[insight-web][insight-web_repo]|[![Travis CI][insight-web_status]][insight-web_build]|[![Coverage Status][insight-web_coverage]][insight-web_coveralls]
[insight-cb][insight-cb_repo]|[![Travis CI][insight-cb_status]][insight-cb_build]|[![Coverage Status][insight-cb_coverage]][insight-cb_coveralls]
[insight-common][insight-common_repo]|[![Travis CI][insight-common_status]][insight-common_build]|[![Coverage Status][insight-common_coverage]][insight-common_coveralls]
[insight-sql][insight-sql_repo]|[![Travis CI][insight-sql_status]][insight-sql_build]|[![Coverage Status][insight-sql_coverage]][insight-sql_coveralls]
[insight-parser][insight-parser_repo]|[![Travis CI][insight-parser_status]][insight-parser_build]|[![Coverage Status][insight-parser_coverage]][insight-parser_coveralls]

## Misc. Plugins
Name|Build Status|Coverage
----|------------|--------
[block-saver][block-saver_repo]|[![Travis CI][block-saver_status]][block-saver_build]|[![Coverage Status][block-saver_coverage]][block-saver_coveralls]
[book-dupe][book-dupe_repo]|[![Travis CI][book-dupe_status]][book-dupe_build]|[![Coverage Status][book-dupe_coverage]][book-dupe_coveralls]
[dueler][dueler_repo]|[![Travis CI][dueler_status]][dueler_build]|[![Coverage Status][dueler_coverage]][dueler_coveralls]
[expbottles][expbottles_repo]|[![Travis CI][expbottles_status]][expbottles_build]|[![Coverage Status][expbottles_coverage]][expbottles_coveralls]
[pearl-nerf][pearl-nerf_repo]|[![Travis CI][pearl-nerf_status]][pearl-nerf_build]|[![Coverage Status][pearl-nerf_coverage]][pearl-nerf_coveralls]
[radio][radio_repo]|[![Travis CI][radio_status]][radio_build]|[![Coverage Status][radio_coverage]][radio_coveralls]

# LICENSE

The scripts involved in building this workspace are released under the [BSD (3-clause) license](https://github.com/MinerAp/minerap-workspace/blob/master/LICENSE) found at the root of this project.

All **Github-hosted** projects found in the submodules are licensed according to their included licenses.

**The submodules hosted on Bitbucket are proprietary, closed-source, and are not to be released, re-distributed, or re-licensed without explicit authorization from the owners of the [MinerApocalypse server](https://minerap.com) and the collaborators of this project.**

[insight-parent_repo]: https://github.com/MinerAp/insight-parent "insight-parent repository"
[insight-api_repo]:    https://github.com/MinerAp/insight-api    "insight-api repository"
[insight-jdbc_repo]:   https://github.com/MinerAp/insight-jdbc   "insight-jdbc repository"
[insight-web_repo]:    https://github.com/MinerAp/insight-web    "insight-web repository"
[insight-cb_repo]:     https://github.com/MinerAp/insight-cb     "insight-cb repository"
[insight-common_repo]: https://github.com/MinerAp/insight-common "insight-common repository"
[block-saver_repo]:    https://github.com/MinerAp/block-saver    "block-saver repository"
[book-dupe_repo]:      https://github.com/MinerAp/book-dupe      "book-dupe repository"
[dueler_repo]:         https://github.com/MinerAp/dueler         "dueler repository"
[expbottles_repo]:     https://github.com/MinerAp/expbottles     "expbottles repository"
[pearl-nerf_repo]:     https://github.com/MinerAp/pearl-nerf     "pearl-nerf repository"
[radio_repo]:          https://github.com/MinerAp/radio          "radio repository"

[insight-parent_status]: https://secure.travis-ci.org/MinerAp/insight-parent.png "insight-parent status"
[insight-api_status]:    https://secure.travis-ci.org/MinerAp/insight-api.png    "insight-api status"
[insight-jdbc_status]:   https://secure.travis-ci.org/MinerAp/insight-jdbc.png   "insight-jdbc status"
[insight-web_status]:    https://secure.travis-ci.org/MinerAp/insight-web.png    "insight-web status"
[insight-cb_status]:     https://secure.travis-ci.org/MinerAp/insight-cb.png     "insight-cb status"
[insight-common_status]: https://secure.travis-ci.org/MinerAp/insight-common.png "insight-common status"
[block-saver_status]:    https://secure.travis-ci.org/MinerAp/block-saver.png    "block-saver status"
[book-dupe_status]:      https://secure.travis-ci.org/MinerAp/book-dupe.png      "book-dupe status"
[dueler_status]:         https://secure.travis-ci.org/MinerAp/dueler.png         "dueler status"
[expbottles_status]:     https://secure.travis-ci.org/MinerAp/expbottles.png     "expbottles status"
[pearl-nerf_status]:     https://secure.travis-ci.org/MinerAp/pearl-nerf.png     "pearl-nerf status"
[radio_status]:          https://secure.travis-ci.org/MinerAp/radio.png          "radio status"

[insight-parent_build]: http://travis-ci.org/#!/MinerAp/insight-parent "insight-parent build"
[insight-api_build]:    http://travis-ci.org/#!/MinerAp/insight-api    "insight-api build"
[insight-jdbc_build]:   http://travis-ci.org/#!/MinerAp/insight-jdbc   "insight-jdbc build"
[insight-web_build]:    http://travis-ci.org/#!/MinerAp/insight-web    "insight-web build"
[insight-cb_build]:     http://travis-ci.org/#!/MinerAp/insight-cb     "insight-cb build"
[insight-common_build]: http://travis-ci.org/#!/MinerAp/insight-common "insight-common build"
[block-saver_build]:    http://travis-ci.org/#!/MinerAp/block-saver    "block-saver build"
[book-dupe_build]:      http://travis-ci.org/#!/MinerAp/book-dupe      "book-dupe build"
[dueler_build]:         http://travis-ci.org/#!/MinerAp/dueler         "dueler build"
[expbottles_build]:     http://travis-ci.org/#!/MinerAp/expbottles     "expbottles build"
[pearl-nerf_build]:     http://travis-ci.org/#!/MinerAp/pearl-nerf     "pearl-nerf build"
[radio_build]:          http://travis-ci.org/#!/MinerAp/radio          "radio build"

[insight-parent_coverage]: https://img.shields.io/coveralls/MinerAp/nsight-parent.svg  "insight-parent coverage"
[insight-api_coverage]:    https://img.shields.io/coveralls/MinerAp/insight-api.svg    "insight-api coverage"
[insight-jdbc_coverage]:   https://img.shields.io/coveralls/MinerAp/insight-jdbc.svg   "insight-jdbc coverage"
[insight-web_coverage]:    https://img.shields.io/coveralls/MinerAp/insight-web.svg    "insight-web coverage"
[insight-cb_coverage]:     https://img.shields.io/coveralls/MinerAp/insight-cb.svg     "insight-cb coverage"
[insight-common_coverage]: https://img.shields.io/coveralls/MinerAp/insight-common.svg "insight-common coverage"
[block-saver_coverage]:    https://img.shields.io/coveralls/MinerAp/block-saver.svg    "block-saver coverage"
[book-dupe_coverage]:      https://img.shields.io/coveralls/MinerAp/book-dupe.svg      "book-dupe coverage"
[dueler_coverage]:         https://img.shields.io/coveralls/MinerAp/dueler.svg         "dueler coverage"
[expbottles_coverage]:     https://img.shields.io/coveralls/MinerAp/expbottles.svg     "expbottles coverage"
[pearl-nerf_coverage]:     https://img.shields.io/coveralls/MinerAp/pearl-nerf.svg     "pearl-nerf coverage"
[radio_coverage]:          https://img.shields.io/coveralls/MinerAp/radio.svg          "radio coverage"

[insight-parent_coveralls]: https://coveralls.io/r/MinerAp/insight-parent?branch=master "insight-parent coveralls"
[insight-api_coveralls]:    https://coveralls.io/r/MinerAp/insight-api?branch=master    "insight-api coveralls"
[insight-jdbc_coveralls]:   https://coveralls.io/r/MinerAp/insight-jdbc?branch=master   "insight-jdbc coveralls"
[insight-web_coveralls]:    https://coveralls.io/r/MinerAp/insight-web?branch=master    "insight-web coveralls"
[insight-cb_coveralls]:     https://coveralls.io/r/MinerAp/insight-cb?branch=master     "insight-cb coveralls"
[insight-common_coveralls]: https://coveralls.io/r/MinerAp/insight-common?branch=master "insight-common coveralls"
[block-saver_coveralls]:    https://coveralls.io/r/MinerAp/block-saver?branch=master    "block-saver coveralls"
[book-dupe_coveralls]:      https://coveralls.io/r/MinerAp/book-dupe?branch=master      "book-dupe coveralls"
[dueler_coveralls]:         https://coveralls.io/r/MinerAp/dueler?branch=master         "dueler coveralls"
[expbottles_coveralls]:     https://coveralls.io/r/MinerAp/expbottles?branch=master     "expbottles coveralls"
[pearl-nerf_coveralls]:     https://coveralls.io/r/MinerAp/pearl-nerf?branch=master     "pearl-nerf coveralls"
[radio_coveralls]:          https://coveralls.io/r/MinerAp/radio?branch=master          "radio coveralls"
