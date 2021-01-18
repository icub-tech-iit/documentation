Software Installation
===

This sections contains detailed instructions for installing the iCub software. The iCub software includes both the software that runs inside the iCub robot and in the machines that are part of the iCub setup, and the software that can be installed on external machines to simulate or communicate with the iCub robot. The majority of the base iCub software is written in the [C++ programming language](https://en.wikipedia.org/wiki/C%2B%2B).

As of 2020, the most common way of consuming the iCub software is by compiling it from source code. There are two possible methods to compile the iCub software from source code. The first one (**"superbuild"**) is to install the software via the [`robotology-superbuild`](https://github.com/robotology/robotology-superbuild), a distribution of software mantained at IIT and other related software. The second one (**"manual"**) is to manually install each software package required for iCub software on its own. The recommended way to consume iCub software for users that are not part of the iCub development is to stick to **released** versions of the iCub software, in particular to the **distributions** of software released every three months, as described in [Software Distros](../sw_versioning_table/index.md). Documentation for compiling the iCub software from source
are available in the **Installation from sources** menu section.

Depending on the operating system you want to use, it may be available also the possibilities of installing the iCub software via pre-compiled binaries instead of manually compiling the source code. Documentation for this workflow is available in the
**Installation from pre-compiled binaries** menu section.

Regardless of how you installed your software, you can check if it has been installed correctly by following the instructions in the [Check your installation](./check_your_installation.md) page.

The standard installation procedure is appropriate for normal developers system, but some machines on the iCub setup, in particular the `icub-head` system that is installed in the head of the iCub robot, require specific software installation instructions. You may find those in the "Installation on specific systems on iCub setup" menu section.

Finally, if you are not not interested in developing new applications, but rather to deploy existing applications on the iCub check out the [Robot Bazaar](https://robot-bazaar.iit.it) website and the [RAPID docker-based deployment system](https://github.com/icub-tech-iit/appsAway).

