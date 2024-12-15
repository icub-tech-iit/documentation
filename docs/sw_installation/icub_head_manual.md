#  Installation on icub-head installing manually each package

The `icub-head` (also known as `pc104` on older iCubs) is a Linux system, so the
installation procedure follows the one described in [the installation for Linux systems](linux_from_sources_manual.md).

## Prepare your system
This page only covers the software installation on the `icub-head`. To prepare the operating system for the `icub-head` system,
please refer to Section on [iCub Operating Systems](../icub_operating_systems/index.md).

### Getting YARP, iCub sources, and Robots configurations

Depending on your configuration, you may already have the required source code git repositories cloned in these directories:

~~~
/usr/local/src/robot/ycm
/usr/local/src/robot/yarp
/usr/local/src/robot/icub-main
/usr/local/src/robot/icub-firmware-shared
/usr/local/src/robot/icub-contrib-common
/usr/local/src/robot/robots-configuration
~~~

If for some reason you do not have these directories you have to
download the repositories from git:

~~~
cd /usr/local/src/robot
git clone https://github.com/robotology/ycm.git
git clone https://github.com/robotology/yarp.git
git clone https://github.com/robotology/icub-main.git
git clone https://github.com/robotology/icub-firmware-shared.git
git clone https://github.com/robotology/icub-contrib-common.git
git clone https://github.com/robotology/robots-configuration.git
~~~

Importantly, the software release of each of the above repositories
shall match the YARP dependencies as per the [Software Versioning
Table](../sw_versioning_table/index.md).

Do not change the location of the repositories because the icub
environment on the `icub-head` is already configured by assuming the above
directories.

## Compile YCM
~~~
mkdir -p $YCM_DIR
cd $YCM_DIR
ccmake $YCM_SOURCE_DIR
make
~~~

**Do not** run make install, the current instructions assume that the
binaries are not installed in system directories.

## Compile YARP

Create the `$YARP_DIR` directory:

~~~
mkdir $YARP_DIR
cd $YARP_DIR
~~~

Clean the cache and generate makefiles:
~~~
rm CMakeCache.txt
ccmake $YARP_SOURCE_DIR
~~~

Do not forget to enable optimization, this will improve performance a
lot. In CMake for both YARP and icub-main set:

~~~
CMAKE_BUILD_TYPE: Release
CREATE_LIB_MATH, set to ON
CREATE_DEVICE_LIBRARY_MODULES:ON
~~~

Configure (hit c):

Now enable:

~~~
ENABLE_yarpmod_serial
ENABLE_yarpmod_serialport
ENABLE_yarpmod_portaudio
~~~

Configure and generate makefiles.

Compile YARP:

~~~
make
~~~

**Do not** run make install, the current instructions assume that the
binaries are not installed in system directories.

To verify the procedure type:

~~~
yarpdev --list
~~~

among the others the list should contains also the new devices:

~~~
Device "serial", C++ class ServerInertial, is a network wrapper,
Device "serialport", C++ class SerialDeviceDriver, wrapped by "serial"
Device "portaudio", C++ class ...
~~~

## Compile icub-firmware-shared

Create `$icub_firmware_shared_DIR` if it does not exist:

~~~
mkdir $icub_firmware_shared_DIR
~~~

Clean cache and generate makefiles:
~~~
cd $icub_firmware_shared_DIR
rm CMakeCache.txt
ccmake $icub_firmware_shared_SOURCE_DIR
~~~

Hit c to configure.

Hit g to generate.

Compile:

~~~
make
~~~

## Compile iCub

Create `$ICUB_DIR` if it does not exist:

~~~
mkdir $ICUB_DIR
~~~

Clean cache and generate makefiles:
~~~
cd $ICUB_DIR
rm CMakeCache.txt
ccmake $ICUB_SOURCE_DIR --preset robot
~~~

The following options are as usual:
~~~
CMAKE_BUILD_TYPE:Release
~~~

Hit c to configure. A long list of devices (in the form of `ENABLE_icubmod_*`) will appear.
Aside from those already enabled, you have to switch on also the following:

All iCub versions:
~~~
ENABLE_icubmod_dragonfly2
ENABLE_icubmod_xsensmtx
~~~

Versions equal to **iCub 1.1.1**:
~~~
ENABLE_icubmod_cfw2can
ENABLE_icubmod_skinprototype
~~~

Older versions (**iCub 1.0** and **1.1.0**):
~~~
ENABLE_icubmod_pcan (iCub 1.0 and 1.1.0)
ENABLE_icubmod_ecan (iCub 1.1.0)
~~~

CMake will generate make files. Possible errors:

  - pcan/ecan fails to detect API(s): check that you have unpacked
    plxCanApi/esdCanApi in `/usr/local/src/robot/drivers`. cmake uses the
    environment variables `PLXCANAPI_DIR`/`ESDCANAPI_DIR` to locate these
    libraries. If you the pc104 has a Debian Live image \>= 1.4 these
    should be already set, otherwise you have to do it manually.

compile:

~~~
make
~~~

**DO NOT** run make install, the current instructions assume that the
binaries are not installed in system directories.

To verify the procedure type:

~~~
yarpdev --list
~~~

among the others, the list should contain also the selected devices
like:

~~~
Device "dragonfly2", C++ class DragonflyDeviceDriver2, wrapped by "grabber"
Device "pcan", C++ class PlxCan, has no network wrapper
...
~~~

## Configuring your Robot

First off, prepare the contributing helpers:

~~~
cd $ROBOT_CODE/icub-contrib-common
mkdir build && cd build
ccmake ../
~~~

Make sure that `CMAKE_INSTALL_PREFIX` points to `$ICUBContrib_DIR` and
finally do:

~~~
make install
~~~

Further documentation is available in [`icub-contrib-common` documentation](https://github.com/robotology/icub-contrib-common).

Then, proceed to install your robot configuration files:

~~~
cd $ROBOT_CODE/robots-configuration
mkdir build && cd build
ccmake ../
make install
~~~

In case you want to tune/modify any robot parameters, remember to create
first your local copies:

~~~
yarp-config robot --import $YARP_ROBOT_NAME
~~~

Now you should have editable copies in
~~~
~/.local/share/yarp/robots/$YARP_ROBOT_NAME
~~~

Further documentation is available in [`robots-configuration` repository](https://github.com/robotology/robots-configuration).
