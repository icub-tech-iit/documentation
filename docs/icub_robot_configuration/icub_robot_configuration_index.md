# Robot configuration
The aim of this page is to explain the configuration of a Ethernet based robot and how it is structured in various files. It can be useful both who approaches robot configuration for the first time and for expert user: the first finds here explanation of the structure of configuration data set and which are the parameter he/she can change, while the second find rules how to filling configuration files of a new robot.

## Introduction
[Yarprobotinterface](https://www.yarp.it/latest/group__yarprobotinterface.html) application starts all devices and modules required by a robot to work properly. Any device needs a configuration data set that could differs from robot to robot, so each robot has own configuration, saved in xml files contained in a folder called with robot's name in the repository robots-configuration.

Each robot has a main configuration file, usually named icub_all.xml, that contains the list of all devices and other modules, like Calibrators and Cartesian, that [Yarprobotinterface](https://www.yarp.it/latest/group__yarprobotinterface.html) starts.



[**Structure of robot configuration data set**](./structure_robot_configuration_data_set/structure_robot_configuration_data_set.md)


[**Naming convention**](./naming_convention/naming_convention.md)





3.1	1.Rules for naming devices
3.2	2.Rules for naming wrapper file
3.3	3.Rules for naming joints
4	Configuration of devices
4.1	Motor control device
4.2	Motor Control on iCub
4.3	FT sensor device
4.4	Mais device
4.5	Skin device
4.6	Inertial device
5	Configuration of calibrator module
6	Cartesian controller module
7	Note for robots in iCub Facility (iit Genoa, Italy)

