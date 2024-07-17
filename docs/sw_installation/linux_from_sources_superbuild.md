# Install iCub software from source using the robotology-superbuild on Linux

The basic software packages of the iCub software can be easily installed using the [robotology-superbuild](https://github.com/robotology/robotology-superbuild).

In particular, they are contained in the **core profile** of the superbuild, that is enabled by default.

To install the robotology-superbuild in Linux, first download the robotology-superbuild repo with [git](https://git-scm.com/) and checkout the specific [distro version](../sw_versioning_table/index.md) that you want to use:
~~~
git clone https://github.com/robotology/robotology-superbuild
cd robotology-superbuild
git checkout v<YYYY.MM>
~~~

If you are installing the superbuild on an [**iCub robot laptop** following the official iCub instructions](../icub_operating_systems/other-machines/generic-machine.md), you should clone it in the `/usr/local/src/robot` directory.

Then follow the Linux instructions in [robotology-superbuild documentation](https://github.com/robotology/robotology-superbuild?tab=readme-ov-file#linux-from-source-with-dependencies-provided-by-apt).

## Check your installation
After you followed the installation instructions, you can check if your installation was successful by following the instructions in the [Check your installation](./check_your_installation.md) page.
