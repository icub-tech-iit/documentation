# Using `iCub` and `ergoCub` with ROS2
This page centralises different resources showing how to control `iCub` and `ergoCub` using ROS2.

!!! info
    As the last supported **ROS 1** distribution (ROS Noetic Ninjemys) is reaching its End of Life (EOL) on May 2025, with the distro release [`v2024.11.1`](../sw_versioning_table/2024.11.1.md) ROS1 support was deprecated.

## Overwiew
Make sure that you read [YARP's documentation about ROS](https://yarp.it/latest/group__nws__and__nwc__architecture.html#autotoc_md58).

All the YARP [Network Wrapper Server (NWS) and Network Wrapper Client (NWC)](https://www.yarp.it/latest//group__nws__and__nwc__architecture.html) devices that use ROS 2 can be found under [`yarp-devices-ros2`](https://github.com/robotology/yarp-devices-ros2) repository.

`yarp-devices-ros2` contains the devices and utilities for YARP-ROS2 compatibility. The devices are in the form of NWS/NWC that read and/or write information from ROS2 topics and make them available via the YARP API. Starting from the distro [`v2024.11.1`](../sw_versioning_table/2024.11.1.md), it could be compiled within the robotology-superbuild by enabling the `ROBOTOLOGY_USES_ROS2` CMake option .

## Publishing `iCub/ergoCub`'s joints state: the `controlBoard_nws_ros2` module

### Modules description

`controlBoard_nws_ros2` is the controlBoard network wrapper server for ROS2. As per the controlBoard_nws_yarp, this device can be used to publish the joint position information on ROS2 topics instead of YARP ports. The device uses the [yarpDeviceParamParserGenerator](https://yarp.it/latest/group__yarpDeviceParamParserGenerator.html) and [here](https://yarp.it/latest/classControlBoard__nws__ros2__ParamsParser.html) there is the list of the required parameters.

### Using `controlBoard_nws_ros2`

The module can be activated using an `xml` file, for example this `alljoints-mc_nws_ros2.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE devices PUBLIC "-//YARP//DTD yarprobotinterface 3.0//EN" "http://www.yarp.it/DTD/yarprobotinterfaceV3.0.dtd">

<device xmlns:xi="http://www.w3.org/2001/XInclude" name="alljoints-mc_nws_ros2" type="controlBoard_nws_ros2">
    <param name="node_name"> ergocub_cb_node </param>
    <param name="topic_name"> /joint_states </param>
    <action phase="startup" level="15" type="attach">
        <param name="device"> alljoints-mc_remapper </param>
    </action>
    <action phase="shutdown" level="20" type="detach" />
</device>
```

With this kind of file, the positions of all the joints specified in the `alljoints-mc_remapper` are published on the `/joint_states` ROS2 topic.

More in particular, this file is meant to be used as part of the same `yarprobotinterface` with which you launch the robot. To include it among the devices that you launch with it, you should modify the `ergocub_all.xml`/`icub_all.xml` (or any file that is launched with your `yarprobotinterface` when you launch the robot) to include the line:

```xml
<xi:include href="wrappers/motorControl/alljoints-mc_nws_ros2.xml" />
```

Moreover, the NWS/NWC for YARP and ROS2 are organized into separate wrappers. In this way, it is possible to attach multiple wrappers to the same device, so a `controlBoard_nws_yarp` for YARP and a `controlBoard_nws_ros2` for ROS2, and include them to the same configuration file used to launch the yarprobotinterface.

## xcub-moveit2

[`xcub-moveit2`](https://github.com/icub-tech-iit/xcub-moveit2) contains ROS2 packages to control a YARP-based robot (iCub/ergoCub) with MoveIt2 platform. Check it out [here](https://github.com/icub-tech-iit/xcub-moveit2/blob/master/README.md) for more details.
