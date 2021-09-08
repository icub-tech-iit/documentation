# Using `iCub` with ROS

This page's goal is to centralise different resources showing how to control `iCub` using ROS.

# Required setup

Make sure that you read [YARP's documentation about ROS](http://www.yarp.it/latest/yarp_with_ros.html). More specifically, you need to [configure YARP to interact with ROS](http://www.yarp.it/latest/yarp_with_ros_nameservers.html).

# Using ROS TF to manage the coordinate transforms

## What is ROS TF?
[ROS TF](http://wiki.ros.org/tf) (and its more recent version [TF2](http://wiki.ros.org/tf2)) is a package used to keep track of the different sets of coordinates in a robot, and easily switch between them. It can for instance be used to transform the coordinates of an object in `iCub`'s depth image to coordinates that can be used by the `cartesianInterface`. 

To keep track of the various sets of coordinates, ROS TF requires 2 things:
- a `URDF` file that describes the physical properties and the agencement of all the pieces ("links") that make up the robot. This can be found in [the icub-model repository](https://github.com/robotology/icub-models/)
- something to periodically publish the state of all the joints (in `iCub`'s case, that means the angles that all the motors are currently at). This is provided by the `controlboardwrapper2` or `controlBoard_nws_ros` modules.

## Publishing `iCub`'s joints state: the `controlboardwrapper2` and `controlBoard_nws_ros` modules

### Modules description 
The piece of software that can be used to publish the joint position information exposed by a YARP device for YARP <= 3.4 (so for any robotology distro <= 2021.08) is the `controlboardwrapper2` (see [this page](http://www.yarp.it/v3.4/classControlBoardWrapper.html#details)). This is exactly the same device used to publish joint information on YARP ports, but that can be configured also to publish on ROS topics via the ROS group.

However, notice that `controlboardwrapper2` device is deprecated in the new YARP 3.5 relese (that will be use in robotology distros from >= 2021.11), and its functionality is going to be replaced by middleware-specific devices. In particular [`controlBoard_nws_yarp`](http://www.yarp.it/v3.5/classControlBoard__nws__yarp.html) for YARP, [`controlBoard_nws_ros`](http://www.yarp.it/v3.5/classControlBoard__nws__ros.html) for ROS(1) and [`controlBoard_nws_ros2`](https://github.com/robotology-playground/yarp-ros2/tree/master/src/devices/controlBoard_nws_ros2) for ROS2 (still unreleased work in progress). See [this page](http://www.yarp.it/latest/nws_and_nwc_architecture.html) and [this issue](https://github.com/robotology/yarp/discussions/2441) for architecture details on the changes in YARP 3.5 .

### Using `controlboardwrapper2`
The module can be activated using an `xml` file such as [`icub_ros_wrapper.xml`](https://github.com/robotology/robots-configuration/blob/v1.21.0/iCubLondon01/wrappers/motorControl/icub_ros_wrapper.xml). In general all the `xml` configuration files related to YARP devices are only meant to be used by applications that use the `libYARP_robotinterface` YARP library, i.e. either the `yarprobotinteface` tool (unfortunaly docs are missing for this tool, see [this issue](https://github.com/robotology/yarp/issues/870)) or the `gazebo_yarp_robotinterface` Gazebo plugin.

More in particular, the `icub_ros_wrapper.xml` file is meant to be used as part of the same `yarprobotinterface` with which you launch the robot. To include it among the devices that you launch with it, you should modify the `icub_all.xml` (or any file that is launched with your `yarprobotinterface` when you launch the iCub) to include the line:

```xml
<xi:include href="wrappers/motorControl/icub_ros_wrapper.xml" />
```
see for example [this file](https://github.com/robotology/robots-configuration/blob/v1.21.0/iCubGenova04/icub_wbd.xml#L120).

If this does not work, there may be two main pitfalls to be aware of:

To make sure that the `controlboardwrapper2` is able to publish correctly on ROS, you need to make the `yarpserver` aware of the ROS name server, as described in the `Required setup` section. This can be done in several ways, but the most common way is to launch `yarpserver` with the `--ros` option (after making sure that `ROS_MASTER_URI` is set on the machine in which you launch `yarpserver --ros`).

The joint values are read directly via `C++` YARP devices interfaces from the `controlboard` YARP devices, and which devices are connected to the `controlboardwrapper2` devices are specified in the child elements of the `<action phase="startup" level="5" type="attach">` tag (see [this line](https://github.com/robotology/robots-configuration/blob/v1.21.0/iCubLondon01/wrappers/motorControl/icub_ros_wrapper.xml#L25)). In particular, the value of each `elem` tag (such as `head_mc` in `<elem name="head_joints"> head_mc </elem>`) should correspond to a device instantance name instantiated earlier by the `yarprobotinterface`. For example, `head_mc` corresponds to the instance created by [this file](https://github.com/robotology/robots-configuration/blob/v1.21.0/iCubLondon01/hardware/motorControl/icub_head.xml#L4). If some devices are not found, it is possible that some of this names need to be fixed.
