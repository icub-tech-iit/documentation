# Standalone installation on icub-head

The `icub-head` (also known as `pc104` on older iCubs) is a Linux system, so the
installation procedure follows the one described in [the installation for Linux systems](linux_from_sources_superbuild.md).

The main difference is that in addition you need to enable certain flags in CMake that enable compilation of specific
software modules.

## Prepare your system
**Warning: if your iCub robot is not currently using the robotology-superbuild, do not attempt to migrate it
without coordinating with the iCub support.  For any doubt, please open an issue at https://github.com/robotology/icub-tech-support.**

This page only covers the software installation on the icub-head. To prepare the operating system for the icub-head system,
please refer to Section on [iCub Operating Systems](icub_operating_systems/index.md).

### Getting robotology-superbuild

Depending on your configuration, you may already have the required source code git repositories cloned in these directories:

~~~
/usr/local/src/robot/robotology-superbuild
~~~

If for some reasons you do not have these directories you have to
download the repositories from git:

~~~
cd /usr/local/src/robot
git clone https://github.com/robotology/robotology-superbuild.git
cd robotology-superbuild
git checkout v<YYYY.MM>
~~~

Importantly, you should use a given release, see [Software Versioning
Table](../sw_versioning_table/index.md) for more info.

Do not change the location of the repositories because the icub
environment on the icub-head is already configured by assuming the above
directories.


## Compile robotology-superbuild
~~~sh
cd /usr/local/src/robot/robotology-superbuild
mkdir build
cmake -DROBOTOLOGY_USES_GAZEBO:BOOL=OFF -DROBOTOLOGY_ENABLE_ICUB_HEAD:BOOL=ON ..
make
~~~
The main difference over the standard installation of the robotology-superbuild, is that the `ROBOTOLOGY_USES_GAZEBO` option
is disabled (as the Gazebo is tipically not installed in the `icub-head`/`pc104` machine) and the `ROBOTOLOGY_ENABLE_ICUB_HEAD` option
is enabled, to enable all the YARP devices that are necessary to interface with the internal communication bus of the iCub robot.
The `make` command in this case will download, compile and install all the software necessary to run the robot itself.

If you need to use other *superbuild profiles*, they can be easily enabled with the corresponding CMake option.

**Important: do not run `make install` for the superbuild: the superbuild already installs all the software in
`/usr/local/src/robot/robotology-superbuild/build/install`, and installing the software elsewhere on the robot is not currently supported.**

**Important: If you are using an old iCub that still uses the CAN internal bus, you also need to enable the `ROBOTOLOGY_USES_CFW2CAN` CMake option. Note that in this case the `.bashrc_iCub` file should also contain the definition of the
`CFW2CANAPI_DIR` environmental variables, in addition to all the environmental variable already defined  in that file.
See the main robotology-superbuild README for more detailed information.**

After the compilation finished, you can check that the compilation ended correctly by opening a new terminal and executing:
~~~
yarpdev --list
~~~

The command should work correctly, and among the others the list should contain several devices:

~~~
Device "serial", C++ class ServerInertial, is a network wrapper,
Device "serialport", C++ class SerialDeviceDriver, wrapped by "serial"
Device "portaudio", C++ class ...
~~~


## Configuring your Robot

In case you want to tune/modify any robot parameters, remember to create first your local copies:

~~~
yarp-config robot --import $YARP_ROBOT_NAME
~~~

Now you should have editable copies in
~~~
~/.local/share/yarp/robots/$YARP_ROBOT_NAME
~~~

Further documentation is available in [`robots-configuration` repository](https://github.com/robotology/robots-configuration).
