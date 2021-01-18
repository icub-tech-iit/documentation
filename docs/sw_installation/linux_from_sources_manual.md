# Install iCub software from source manually installing each software package

The page contains instructions for compiling YARP and the iCub software. We recommend you get the required dependencies from the binary packages.

## Getting all dependencies

Add `www.icub.org` to your sources.list.

Below, replace `ubuntu` with `debian`, depending on your system.

~~~
sudo sh -c 'echo "deb http://www.icub.org/ubuntu `lsb_release -cs` contrib/science" > /etc/apt/sources.list.d/icub.list'
sudo apt update
~~~

**NOTE** : if apt complains about missing public key, please import the
repository public key (this needs to be done only once) as follows

~~~
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 57A5ACB6110576A6`
~~~

Install only the package icub-common:
~~~
sudo apt install icub-common
~~~

## Setting up revision control systems

To download sources from our repositories you need to set up a revision
control system client. The git client was already installed with the
icub-common package.

## Compile YCM (optional)

Although [YCM](https://github.com/robotology/ycm) is already contained in `icub-common`, you might want to get
the latest release. To do so, clone and build the tag associated with
the distro at hand as specified in [Software Versioning
Table](../sw_versioning_table/index.md).

~~~
git clone https://github.com/robotology/ycm.git -b vxx.yy.zz
cd ycm && mkdir -p build && cd build
ccmake ../
sudo make install
~~~

## Compile YARP

Follow instructions provided in the [official YARP documentatipn](http://www.yarp.it/install_yarp_linux.html),
follow the section **Install from sources -- Compiling YARP** (skip
installation of packages).

Importantly, for use with the iCub robot when compiling YARP make sure
that:
* you check out the correct tag of YARP according to the [Software Versioning
Table](../sw_versioning_table/index.md).
* you set to on the CMake options `CREATE_OPTIONAL_CARRIERS` and `ENABLE_yarpcar_bayer`.

## Compile icub-main

### Download icub-main source code

In the rest of the tutorial, it will be assumed that you will downloaded
the code in the `/home/user`.

To download the `icub-main` source code, just use git:

~~~
cd /home/user
git clone https://github.com/robotology/icub-main.git
~~~

This command will create the `/home/user/icub-main` directory,
containing the `icub-main` source code.

### Checkout the correct tag

Pick up the correct tag vxx.yy.zz from [Software Versioning
Table](../sw_versioning_table/index.md) that is compatible with the
compiled version of YARP and do:

~~~
cd icub-main
git checkout vxx.yy.zz
~~~

### Create iCub makefiles

Pick a *build* directory to store makefiles and binaries, e.g.
`/home/user/icub-main/build` .

Run CMake to generate makefiles:
~~~
cd  /home/user/icub-main
mkdir build
cd build
ccmake ../
~~~

Hit 'c' to configure the project.

Select options:

~~~
CMAKE_BUILD_TYPE to "Release"
ENABLE_icubmod_cartesiancontrollerclient ON
ENABLE_icubmod_cartesiancontrollerserver ON
ENABLE_icubmod_gazecontrollerclient      ON
~~~

Leave all other options to default (unless you know what you are doing).

Note : You can optionally change `CMAKE_INSTALL_PREFIX`, this is the
directory where you would like to install icub-main (default is `/usr/local`).
If you set it to a different prefix than YARP's, you will then need to
set up the environment accordingly (see *Configure your environment* section below).

### Compile icub-main

~~~
cd  /home/user/icub-main/build
make
sudo make install
~~~

## Setup ICUBcontrib (optional)

First, you need to download the sources.

~~~
cd /home/user/
git clone https://github.com/robotology/icub-contrib-common.git
~~~

Second, make sure you have the correct release according to  [Software Versioning
Table](../sw_versioning_table/index.md).

~~~
cd /home/user/icub-contrib-common/
git checkout <tag>
~~~
Set up the ICUBcontrib meta-package, which allows to properly configure
your modules/libraries so that they share the same installation prefix.

~~~
cd /home/user/icub-contrib-common/
mkdir build && cd build
ccmake ../
~~~

At this stage you must change CMAKE\_INSTALL\_PREFIX entry here to the
path of your liking, preferably in your home; hit 'g' to generate the
project. If you do not change the CMAKE\_INSTALL\_PREFIX you will need
to constantly use sudo for any subsequent action, eg: run module with
administrative rights.

Finally,

~~~
make install
~~~

Once you have installed the ICUBcontrib package you can compile the
other modules individually.

## Configure your environment

If you installed YARP and/or iCub or ICUBcontrib to non-default
directories, you need to set your environment.

* Set the `ICUBcontrib_DIR` env var to point to the installation directory.
* Append `$ICUBcontrib_DIR/bin` to your PATH.
* Set the `CMAKE_PREFIX_PATH` env var to point to the installation directory `$ICUBcontrib_DIR`.
* Modify the variable `YARP_DATA_DIRS` accordingly, i.e.: `YARP_DATA_DIRS=`<YARP_INSTALL_PREFIX>`/share/yarp:`<ICUB_INSTALL_PREFIX>`/share/iCub:`<ICUBCONTRIB_INSTALL_PREFIX>`/share/ICUBcontrib`.

## Check your installation
After you followed the installation instructions, you can check if your installation was successful by following the instructions in the [Check your installation](./check_your_installation.md) page.
