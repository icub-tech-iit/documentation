# Robot configuration
The aim of this page is to explain the configuration of a Ethernet based robot and how it is structured in various files. It can be useful both who approaches robot configuration for the first time and for expert user: the first finds here explanation of the structure of configuration data set and which are the parameter he/she can change, while the second find rules how to filling configuration files of a new robot.

## Introduction
[Yarprobotinterface](https://www.yarp.it/latest/group__yarprobotinterface.html) application starts all devices and modules required by a robot to work properly. Any device needs a configuration data set that could differs from robot to robot, so each robot has own configuration, saved in xml files contained in a folder called with robot's name in the repository [robots-configuration](https://github.com/robotology/robots-configuration).

Each robot has a main configuration file, usually named `icub_all.xml`, that contains the list of all devices and other modules, like Calibrators and Cartesian, that [Yarprobotinterface](https://yarp.it/latest/group__yarprobotinterface.html) starts.

## Contents

[**Structure of robot configuration data set**](./structure_robot_configuration_data_set/structure_robot_configuration_data_set.md)

[**Naming convention**](./naming_convention/naming_convention.md)

 - [Rules for naming devices](./naming_convention/naming_convention.md#1-rules-for-naming-devices)

 - [Rules for naming wrappers](./naming_convention/naming_convention.md#2rules-for-naming-wrapper-file)

 - [Rules for naming joints](./naming_convention/naming_convention.md#3rules-for-naming-joints)

[**Configuration of devices**](./devices_configuration/devices_configuration.md)

 - [Motor control device](./devices_configuration/devices_configuration.md#motor-control-device)

 - [Motor Control on iCub](./devices_configuration/devices_configuration.md#motor-control-on-icub)

 - [FT sensor device](./devices_configuration/devices_configuration.md#ft-sensor-device)

 - [Mais device](./devices_configuration/devices_configuration.md#mais-device)

 - [Skin device](./devices_configuration/devices_configuration.md#skin-device)

 - [Inertial device](./devices_configuration/devices_configuration.md#inertial-device)

[**Configuration of calibrator module**](./calibrator_configuration/calibrator_configuration.md)

## Note for robots hosted at the iCub Tech Facility
Robots hosted at the iCub Tech Facility often run developing software, that is, they use the same software modules, but on the development branch instead of stable (master).
This means that in the newest version new parameters may be available or there might be some changes that are not described in the latest stable version. You can find these differences in the changelog.

If you are interested in the rationale underlying these changes, please check the files `[iCubTemplates](https://github.com/robotology/robots-configuration/tree/devel/iCubTemplates)/iCubTemplateVX_0`, where `X` identifies the latest version in the devel branch.
