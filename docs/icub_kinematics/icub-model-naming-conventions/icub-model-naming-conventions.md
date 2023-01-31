# **iCub Model naming conventions**
---
For sharing models of the iCub kinematics and dynamics structure (for example in URDF and SDF format) we try to agree on a a set of names for links, joints, degrees of freedom and frames. At the moment this convention does not handle the eyes and the hands, because this degrees of freedom are not currently modeled in the URDF/SDF models of the iCub.

For more info on the process used to generated URDF and SDF models of the iCub, please check this [page](https://github.com/robotology-playground/icub-model-generator)

## Joints
---

### 1-DOF Joints
Note: it could be useful to distinguish between the two different concepts of degree of freedom and joint. For simplicity we decide to ignore for the time being this difference, that is relevant for multi-DOF joints and closed kinematic structures.

The joints are mechanism that connect two different links (as defined in the following section) of the robot. 1-DOF joints allow motion only along one direction between the two connected links.

For joints an existing convention is introduced [here](../icub-joints/icub-joints.md) . 
For the models we adopt this existing convention, disregarding eyes and hands.

| Yarp ControlBoard name | Joint name         |
|------------------------|--------------------|
| left\_leg              | l\_hip\_pitch      |
| left\_leg              | l\_hip\_roll       |
| left\_leg              | l\_hip\_yaw        |
| left\_leg              | l\_knee            |
| left\_leg              | l\_ankle\_pitch    |
| left\_leg              | l\_ankle\_roll     |
| right\_leg             | r\_hip\_pitch      |
| right\_leg             | r\_hip\_roll       |
| right\_leg             | r\_hip\_yaw        |
| right\_leg             | r\_knee            |
| right\_leg             | r\_ankle\_pitch    |
| right\_leg             | r\_ankle\_roll     |
| torso                  | torso\_pitch       |
| torso                  | torso\_roll        |
| torso                  | torso\_yaw         |
| head                   | neck\_pitch        |
| head                   | neck\_roll         |
| head                   | neck\_yaw          |
| left\_arm              | l\_shoulder\_pitch |
| left\_arm              | l\_shoulder\_roll  |
| left\_arm              | l\_shoulder\_yaw   |
| left\_arm              | l\_elbow           |
| left\_arm              | l\_wrist\_prosup   |
| left\_arm              | l\_wrist\_pitch    |
| left\_arm              | l\_wrist\_yaw      |
| right\_arm             | r\_shoulder\_pitch |
| right\_arm             | r\_shoulder\_roll  |
| right\_arm             | r\_shoulder\_yaw   |
| right\_arm             | r\_elbow           |
| right\_arm             | r\_wrist\_prosup   |
| right\_arm             | r\_wrist\_pitch    |
| right\_arm             | r\_wrist\_yaw      |

### Fixed (0-DOFs) Joints
When dealing with 6-axis FT sensors, it is convenient to model them as joints that do not allow any motion between the two connected links.

In the iCub can be mounted up to 6 6-axis ft sensors.

| Yarp AnalogSensor name | Fixed joint name    |
|------------------------|---------------------|
| left\_arm              | l\_arm\_ft\_sensor  |
| right\_arm             | r\_arm\_ft\_sensor  |
| left\_leg              | l\_leg\_ft\_sensor  |
| left\_foot             | l\_foot\_ft\_sensor |
| right\_leg             | r\_leg\_ft\_sensor  |
| right\_foot            | r\_foot\_ft\_sensor |

## Links
---
The links are the physical rigid bodies that constitute the robot. Each link is characterised by a mass (represented in models by the inertial parameters) and a physical shape (represented in models by meshes).

For defining the links we are representing the robot as a directed tree, where the `root_link` is the body that can be attached to the pole, and the meaning of the other links can be deduced by their parent joint, as defined in the previous section.

The main idea behind this naming scheme is that “big” links (roughly speaking, the one that can reasonably interact with the user) are named with intuitive names such as `upper_arm`, `forearm`, `upper_leg`, `lower_leg`, `chest`, `head`, `foot`, `hand`. All the little links that instead are part of more complex linkages, take their name from the articulation, such as `torso_1`, `torso_2`.

| Link Name      | Parent Joint        | Parent Link    |
|----------------|---------------------|----------------|
| root\_link     |                     |                |
| l\_hip\_1      | l\_hip\_pitch       | root\_link     |
| l\_hip\_2      | l\_hip\_roll        | l\_hip\_1      |
| l\_hip\_3      | l\_leg\_ft\_sensor  | l\_hip\_2      |
| l\_upper\_leg  | l\_hip\_yaw         | l\_hip\_3      |
| l\_lower\_leg  | l\_knee             | l\_upper\_leg  |
| l\_ankle\_1    | l\_ankle\_pitch     | l\_lower\_leg  |
| l\_ankle\_2    | l\_ankle\_roll      | l\_ankle\_1    |
| l\_foot        | l\_foot\_ft\_sensor | l\_ankle\_2    |
| r\_hip\_1      | r\_hip\_pitch       | root\_link     |
| r\_hip\_2      | r\_hip\_roll        | r\_hip\_1      |
| r\_hip\_3      | r\_leg\_ft\_sensor  | r\_hip\_2      |
| r\_upper\_leg  | r\_hip\_yaw         | r\_hip\_3      |
| r\_lower\_leg  | r\_knee             | r\_upper\_leg  |
| r\_ankle\_1    | r\_ankle\_pitch     | r\_lower\_leg  |
| r\_ankle\_2    | r\_ankle\_roll      | r\_ankle\_1    |
| r\_foot        | r\_foot\_ft\_sensor | r\_ankle\_2    |
| torso\_1       | torso\_pitch        | root\_link     |
| torso\_2       | torso\_roll         | torso\_1       |
| chest          | torso\_yaw          | torso\_2       |
| l\_shoulder\_1 | l\_shoulder\_pitch  | chest          |
| l\_shoulder\_2 | l\_shoulder\_roll   | l\_shoulder\_1 |
| l\_shoulder\_3 | l\_shoulder\_yaw    | l\_shoulder\_2 |
| l\_upper\_arm  | l\_arm\_ft\_sensor  | l\_shoulder\_3 |
| l\_elbow\_1    | l\_elbow            | l\_upper\_arm  |
| l\_forearm     | l\_wrist\_prosup    | l\_elbow\_1    |
| l\_wrist\_1    | l\_wrist\_pitch     | l\_forearm     |
| l\_hand        | l\_wrist\_yaw       | l\_wrist\_1    |
| r\_shoulder\_1 | r\_shoulder\_pitch  | chest          |
| r\_shoulder\_2 | r\_shoulder\_roll   | r\_shoulder\_1 |
| r\_shoulder\_3 | r\_shoulder\_yaw    | r\_shoulder\_2 |
| r\_upper\_arm  | r\_arm\_ft\_sensor  | r\_shoulder\_3 |
| r\_elbow\_1    | r\_elbow            | r\_arm         |
| r\_forearm     | r\_wrist\_prosup    | r\_elbow\_1    |
| r\_wrist\_1    | r\_wrist\_pitch     | r\_forearm     |
| r\_hand        | r\_wrist\_yaw       | r\_wrist\_1    |

## Joint additional information
---
For some tasks (e.g. model building), it may be necessary to have additional joint information, such as the joint axis direction and the range of motion of the axis. To identify the axes' directions, however, a particular robot joint configuration must be set, since the positions of these axes depend upon the joint angles. To this purpose, we assume joint angles equal to zero (i.e. legs and arms straight down), implicitly assuming that the fine calibration has been carried on so that these zeros are properly defined [iCub Calibration](./../../icub_robot_calibration/icub-robot-calibration-v2.x.md). Then, in this configuration, the joint axis is expressed with respect to the iCub's root frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md). One shall observe that the arm joint axes with joint angles equal to zero do not coincide perfectly with any of the root frame axes. Yet, the directions listed below help the user understand the arm axis directions. The range of motion can be extracted from the configuration files of the iCubGenovaXX robot.

P.S. The parenthesis around some of the numbers in the table below are only for formatting concerns, and should be ignored.

| Joint name          | Joint type | Axis (x) | Axis (y) | Axis (z) | Min | Max |
|---------------------|------------|----------|----------|----------|-----|-----|
| l\_hip\_pitch       | Revolute   | 0        | 1        | 0        |     |     |
| l\_hip\_roll        | Revolute   | (-1)     | 0        | 0        |     |     |
| l\_leg\_ft\_sensor  | Fixed      | \*       | \*       | \*       | \*  | \*  |
| l\_hip\_yaw         | Revolute   | 0        | 0        | 1        |     |     |
| l\_knee             | Revolute   | 0        | 1        | 0        |     |     |
| l\_ankle\_pitch     | Revolute   | 0        | (-1)     | 0        |     |     |
| l\_ankle\_roll      | Revolute   | (-1)     | 0        | 0        |     |     |
| l\_foot\_ft\_sensor | Fixed      | \*       | \*       | \*       | \*  | \*  |
| r\_hip\_pitch       | Revolute   | 0        | 1        | 0        |     |     |
| r\_hip\_roll        | Revolute   | 1        | 0        | 0        |     |     |
| r\_leg\_ft\_sensor  | Fixed      | \*       | \*       | \*       | \*  | \*  |
| r\_hip\_yaw         | Revolute   | 0        | 0        | (-1)     |     |     |
| r\_knee             | Revolute   | 0        | 1        | 0        |     |     |
| r\_ankle\_pitch     | Revolute   | 0        | (-1)     | 0        |     |     |
| r\_ankle\_roll      | Revolute   | 1        | 0        | 0        |     |     |
| r\_foot\_ft\_sensor | Fixed      | \*       | \*       | \*       | \*  | \*  |
| torso\_pitch        | Revolute   | 0        | (-1)     | 0        |     |     |
| torso\_roll         | Revolute   | \(1\)    | 0        | 0        |     |     |
| torso\_yaw          | Revolute   | 0        | 0        | (-1)     |     |     |
| l\_shoulder\_pitch  | Revolute   | 0        | (-1)     | 0        |     |     |
| l\_shoulder\_roll   | Revolute   | (-1)     | 0        | 0        |     |     |
| l\_shoulder\_yaw    | Revolute   | 0        | 0        | (-1)     |     |     |
| l\_arm\_ft\_sensor  | Fixed      | \*       | \*       | \*       | \*  | \*  |
| l\_elbow            | Revolute   | 0        | 1        | 0        |     |     |
| l\_wrist\_prosup    | Revolute   | 0        | 0        | (-1)     |     |     |
| l\_wrist\_pitch     | Revolute   | 1        | 0        | 0        |     |     |
| l\_wrist\_yaw       | Revolute   | 0        | (-1)     | 0        |     |     |
| r\_shoulder\_pitch  | Revolute   | 0        | (-1)     | 0        |     |     |
| r\_shoulder\_roll   | Revolute   | 1        | 0        | 0        |     |     |
| r\_shoulder\_yaw    | Revolute   | 0        | 0        | 1        |     |     |
| r\_arm\_ft\_sensor  | Fixed      | \*       | \*       | \*       | \*  | \*  |
| r\_elbow            | Revolute   | 0        | 1        | 0        |     |     |
| r\_wrist\_prosup    | Revolute   | 0        | 0        | 1        |     |     |
| r\_wrist\_pitch     | Revolute   | (-1)     | 0        | 0        |     |     |
| r\_wrist\_yaw       | Revolute   | 0        | (-1)     | 0        |     |     |
| neck\_pitch         | Revolute   | 0        | \(1\)    | 0        |     |     |
| neck\_roll          | Revolute   | (-1)     | 0        | 0        |     |     |
| neck\_yaw           | Revolute   | 0        | 0        | \(1\)    |     |     |

## Sensors

The naming for the sensors mounted on `iCub` follows this naming convention:

`<link>_<type>_<nr>`

Where `link` is the name where the sensor is attached (e.g. `head`), `type` is the type of sensor (e.g. `imu`) and `nr` is a number starting from **0**.


## Frames
---
In literature and in robotics software, the links and frames concepts are often confused, because every link is usually associated with a frame rigidly attached to it. However this link frame definition is dependent on the formalism that one uses for describing the robot. For example, if the Denavit Hartenberg convention is used the link frame origin is required to be placed on the axis of the child joint, while if the Modified Denavit Hartenberg convention or the URDF format the link frame origin is required to be place on the axis of the parent joint. To avoid inconsistency, we clearly separate frame and link concepts.

### iKin Frames
For the iCub, it could be useful to explicitly state the frame used for defining the kinematic chains used in the iKin library. In particular a useful set of frames could be:

| Frame Name         | Link                      | Explanation                                                                                                    |
|--------------------|---------------------------|----------------------------------------------------------------------------------------------------------------|
| root\_frame        | root\_link                | Root reference frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md)                        |
| imu\_frame         | head                      | Inertial sensor (XSens MTx) reference frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md) |
| l\_hand\_dh\_frame | l\_hand                   | Left hand frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md)                             |
| r\_hand\_dh\_frame | r\_hand                   | Right hand frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md)                            |
| l\_foot\_dh\_frame | l\_foot                   | Left foot frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md)                             |
| r\_foot\_dh\_frame | r\_foot                   | Right foot frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md)                            |
| l\_eye\_frame      | — (missing at the moment) | Left eye frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md)                              |
| r\_eye\_frame      | — (missing at the moment) | Right eye frame, as defined in [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md)                             |
| l\_arm\_ft\_frame  | l\_upper\_arm,l\_arm      | Left Arm FT sensor frame, as defined in [FT_sesors](./../../ft_sensors/ft_sensors.md)                                   |
| r\_arm\_ft\_frame  | r\_upper\_arm,r\_arm      | Right Arm FT sensor frame, as defined in [FT_sesors](./../../ft_sensors/ft_sensors.md)                                 |
| l\_leg\_ft\_frame  | l\_hip\_2,l\_hip\_3       | Left Leg FT sensor frame, as defined in [FT_sesors](./../../ft_sensors/ft_sensors.md)                                  |
| l\_foot\_ft\_frame | l\_upper\_foot,l\_foot    | Left Foot FT sensor frame, as defined in [FT_sesors](./../../ft_sensors/ft_sensors.md)                                 |
| r\_leg\_ft\_frame  | r\_hip\_2,r\_hip\_3       | Right Leg FT sensor frame, as defined in [FT_sesors](./../../ft_sensors/ft_sensors.md)                                 |
| r\_foot\_ft\_frame | r\_upper\_foot,r\_foot    | Right Foot FT sensor frame, as defined in [FT_sesors](./../../ft_sensors/ft_sensors.md)                               |

### Skin Frames
An interesting set of frame is the frame defined by the iKin convention ( [ICubForwardKinematics](./../icub-forward-kinematics/icub-forward-kinematics.md) ). This reference frames are used by the skin system to express contact points, force and torques (in skinDynLib data structures) and taxel positions. The one currently used by the skin system are:

| Frame Name               | Link          | Explanation                              |
|--------------------------|---------------|------------------------------------------|
| l\_foot\_dh\_frame       | l\_foot       | Frame of `LEFT_FOOT` SkinPart            |
| r\_foot\_dh\_frame       | r\_foot       | Frame of `RIGHT_FOOT` SkinPart           |
| l\_upper\_arm\_dh\_frame | l\_upper\_arm | Frame of `SKIN_LEFT_UPPER_ARM` SkinPart  |
| l\_forearm\_dh\_frame    | l\_forearm    | Frame of `SKIN_LEFT_FOREARM` SkinPart    |
| l\_hand\_dh\_frame       | l\_hand       | Frame of `SKIN_LEFT_HAND` SkinPart       |
| r\_upper\_arm\_dh\_frame | r\_upper\_arm | Frame of `SKIN_RIGHT_UPPER_ARM` SkinPart |
| r\_forearm\_dh\_frame    | r\_forearm    | Frame of `SKIN_RIGHT_FOREARM` SkinPart   |
| r\_hand\_dh\_frame       | r\_hand       | Frame of `SKIN_RIGHT_HAND` SkinPart      |

### URDF frames
Some frames are defined to be compatible with certain convention used for URDF files, for example http://www.ros.org/reps/rep-0120.html .

| Frame Name                   | Link          | Explanation                                                                                                                                                                                                        |
|------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| l\_sole                      | l\_foot       | Frame oriented with X front, Y left, Z up. Origin placed on the intersection of the projection of l\_ankle\_roll and l\_ankle\_pitch axis on the plane of the lower side of metal sole (not the skin) of the foot. |
| r\_sole                      | r\_foot       | Frame oriented with X front, Y left, Z up. Origin placed on the intersection of the projection of r\_ankle\_roll and r\_ankle\_pitch axis on the plane of the lower side of metal sole (not the skin) of the foot. |
| l\_upper\_leg\_back\_contact | l\_upper\_leg | Frame oriented with Z front, Y left, X down. Origin placed on the back of the upper leg link. Useful to express the contact force between the leg and the chair for the \`sitting configuration\`.                 |
| r\_upper\_leg\_back\_contact | r\_upper\_leg | Frame oriented with Z front, Y left, X down. Origin placed on the back of the upper leg link. Useful to express the contact force between the leg and the chair for the \`sitting configuration\`.                 |
|                              |               |                                                                                                                                                                                                                    |
