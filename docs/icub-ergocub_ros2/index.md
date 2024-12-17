# Using `iCub` and `ergoCub` with ROS 2

!!! note
    We illustrate in this documentation how to control `iCub` and `ergoCub` **real robots** using ROS 2 (simulation models are not covered).

!!! info
    As the last supported **ROS 1** distribution (ROS Noetic Ninjemys) is reaching its End of Life (EOL) on May 2025, with the distro release [`v2024.11.1`](../sw_versioning_table/2024.11.1.md) ROS 1 support was deprecated.

## Overwiew

All the YARP [Network Wrapper Server (NWS) and Network Wrapper Client (NWC)](https://www.yarp.it/latest//group__nws__and__nwc__architecture.html) devices that use ROS 2 can be found under [`yarp-devices-ros2`](https://github.com/robotology/yarp-devices-ros2) repository.

`yarp-devices-ros2` contains the devices and utilities for YARP-ROS 2 compatibility. The devices are in the form of NWS/NWC that read/write information from/to ROS 2 topics and make them available via the YARP API. Starting from the distro [`v2024.11.1`](../sw_versioning_table/2024.11.1.md), the devices can be built with `robotology-superbuild` by enabling the `ROBOTOLOGY_USES_ROS2` CMake option.

## Publishing `iCub/ergoCub`'s joints state: the `controlBoard_nws_ros2` module

### Modules description

`controlBoard_nws_ros2` is the controlBoard network wrapper server for ROS 2. As per the `controlBoard_nws_yarp`, this device can be used to publish the joint position information on ROS 2 topics instead of YARP ports. The device uses the [yarpDeviceParamParserGenerator](https://yarp.it/latest/group__yarpDeviceParamParserGenerator.html) and [here](https://yarp.it/latest/classControlBoard__nws__ros2__ParamsParser.html) there is the list of the required parameters.

### Using `controlBoard_nws_ros2`

The NWS/NWC for YARP and ROS 2 are organized into separate wrappers. In this way, it is possible to attach multiple wrappers to the same device, so a `controlBoard_nws_yarp` for YARP and a `controlBoard_nws_ros2` for ROS 2, and include them to the same configuration file used to launch the yarprobotinterface.

#### ergoCub

All ergoCub robots have the configuration files to enable this module under [robots-configuration](https://github.com/robotology/robots-configuration) repository. The way to activate them is to run the yarprobotinterface of the robot with the following option:

```sh
yarprobotinterface --enable_tags "(enable_ros2)"
```

#### iCub

For iCub robots, instead, the module can be activated using an `xml` file, for example this `alljoints-mc_nws_ros2.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE devices PUBLIC "-//YARP//DTD yarprobotinterface 3.0//EN" "http://www.yarp.it/DTD/yarprobotinterfaceV3.0.dtd">

<device xmlns:xi="http://www.w3.org/2001/XInclude" name="alljoints-mc_nws_ros2" type="controlBoard_nws_ros2">
    <param name="node_name"> icub_cb_node </param>
    <param name="topic_name"> /joint_states </param>
    <action phase="startup" level="15" type="attach">
        <param name="device"> alljoints-mc_remapper </param>
    </action>
    <action phase="shutdown" level="20" type="detach" />
</device>
```

!!! warning
    Not all iCub configuration files have been modified to support ROS 2. If you didn't find those files within your robot name folder under `robots-configuration`, please don't hesitate to open an issue [here](https://github.com/robotology/robots-configuration/issues).

With this kind of file, the positions of all the joints specified in the `alljoints-mc_remapper` are published on the `/joint_states` ROS 2 topic.

More in particular, this file is meant to be used as part of the same `yarprobotinterface` with which you launch the robot. To include it among the devices that you launch with it, you should modify the `icub_all.xml` (or any file that is launched with your `yarprobotinterface` when you launch the robot) to include the line:

```xml
<xi:include href="wrappers/motorControl/alljoints-mc_nws_ros2.xml" />
```

## xcub-moveit2

[`xcub-moveit2`](https://github.com/icub-tech-iit/xcub-moveit2) contains ROS 2 packages to control a YARP-based robot (iCub/ergoCub) with MoveIt2 platform. Check it out [here](https://github.com/icub-tech-iit/xcub-moveit2/blob/master/README.md) for more details.
