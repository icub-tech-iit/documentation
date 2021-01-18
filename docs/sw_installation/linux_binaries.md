# Install iCub software from pre-compiled binaries on Linux (Debian/Ubuntu)

We provide binaries apt binary packages for the software contained in the [`ycm`](https://github.com/robotology/ycm), [`yarp`](https://github.com/robotology/yarp) and [`icub-main`](https://github.com/robotology/icub-main) repositories.

**Warning: this Linux apt packages do not support the installation of the packages required for Gazebo simulations. If you want to simulate the iCub with Gazebo, please follow the instructions on how to install the [iCub software from source using the robotology-superbuild](linux_from_sources_superbuild.md).**

## Instructions

### Setting up your source list

Add `www.icub.org` to your `sources.list`. Below, replace `ubuntu` with `debian`, depending on your system.

~~~
sudo sh -c 'echo "deb http://www.icub.org/ubuntu `lsb_release -cs` contrib/science" > /etc/apt/sources.list.d/icub.list'
sudo apt update
~~~

Update the list of packages.

~~~
sudo apt update
~~~

Import the repository public key (this needs to be done only once)

~~~
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 57A5ACB6110576A6`
~~~

### Dependencies

iCub packages needs a recent version of cmake (at least 3.12). Where this
version is not available (such as Ubuntu 18.04 Bionic) when you try to
install the icub-common package you'll see the following error:

~~~
The following packages have unmet dependencies:
 icub-common : Depends: ycm-cmake-modules but it is not going to be installed
              Depends: cmake (>= 3.12.0)
E: Unable to correct problems, you have held broken packages.
~~~

To solve the above issue, you need to add the [official Kitware APT
repository](https://apt.kitware.com/).

### Install the binaries

The following command
~~~
sudo apt install icub
~~~

installs the latest version of the software contained in [`icub-main`](https://github.com/robotology/icub-main) and all the required dependencies (including YARP).


## Check your installation
After you followed the installation instructions, you can check if your installation was successful by following the instructions in the [Check your installation](sw_installation/check_your_installation.md) page.


## Uninstall

If you just want to remove the yarp and icub binary packages and keep
the `icub-common` package to compile iCub software from sources,
just use `apt remove` and remove the installed packages:
~~~
sudo apt remove yarp icub
~~~

If you want to remove everything installed with this guide, please
also remove the `icub.list` file from the `/etc/apt/sources.list.d` directory:

~~~
sudo rm /etc/apt/sources.list.d/icub.list
~~~
