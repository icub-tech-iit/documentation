# Install iCub software from source using the robotology-superbuild on macOS

The basic software packages of the iCub software can be easily installed using the [robotology-superbuild](https://github.com/robotology/robotology-superbuild).

In particular, they are contained in the **core profile** of the superbuild, that is enabled by default.

To install the robotology-superbuild on macOS, first download the robotology-superbuild repo with [git](https://git-scm.com/) and checkout the specific [distro version](../sw_versioning_table/index.md) that you want to use:
~~~
git clone https://github.com/robotology/robotology-superbuild
cd robotology-superbuild
git checkout v<YYYY.MM>
~~~

Then follow the macOS instructions in [robotology-superbuild documentation](https://github.com/robotology/robotology-superbuild#macos-from-source).

## Check your installation
After you followed the installation instructions, you can check if your installation was successful by following the instructions in the [Check your installation](sw_installation/check_your_installation.md) page.
