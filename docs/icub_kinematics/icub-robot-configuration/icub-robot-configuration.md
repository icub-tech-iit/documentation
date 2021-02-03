# **Robot configuration**
---
The aim of this page is to explain the configuration of a Ethernet based robot and how it is structured in various files. It can be useful both who approaches robot configuration for the first time and for expert user: the first finds here explanation of the structure of configuration data set and which are the parameter he/she can change, while the second find rules how to filling configuration files of a new robot.

## Introduction
---
[Yarprobotinterface](http://www.yarp.it/git-master/yarprobotinterface.html) application starts all devices and modules required by a robot to work properly. Any device needs a configuration data set that could differs from robot to robot, so each robot has own configuration, saved in xml files contained in a folder called with robot's name in the repository [robots-configuration](https://github.com/robotology/robots-configuration).

Each robot has a main configuration file, usually named icub_all.xml, that contains the list of all devices and other modules, like Calibrators and Cartesian, that [Yarprobotinterface](http://www.yarp.it/git-master/yarprobotinterface.html) starts.

(Note: here "device" means DeviceDriver of Yarp. The reader is supposed to have knowledge about a driver and a wrapper of yarp. If not, please see [YARP documentation](http://www.yarp.it/).)

## Structure of robot configuration data set
---
The data set contains configuration for software modules, robot hardware and wrappers.

The hardware configuration structure depends on the mechanical-electronic architecture of the robot heavily. Each device represents a sensor or a motor controller of group of joints. A device refers to an ethernet board mounted on the robot, but an ethernet board can be referred to by more devices: for example if a board controls 4 motors and reads the FT sensor, then both the motor control device and FT device have a reference to the board in question.

Each robot configuration folder has following structure:

RobotNameFolder:

- Calibrators: each robot body part has a calibration file bodyPart_calib.xml with calibration data, that are robot dependent.
- Camera: configuration about cameras mounted on robot
- Cartesian: configuration about the cartesian module
- Hardware: here there are descriptions of all devices available on robot
    - Mais: description of analog mais devices
    - FT: description of Force-Torque devices
    - Inertials : description of inertials devices
    - Skin: description of skin devices
    - Motorcontrol: description of motor control devices
    - Electronics: description of embedded Ethernet boards mounted on robot.
    - Mechanicals: description of mechanical features involved in motion control
- Wrappers: configuration of yarp wrappers of devices
- Some .ini files. Among .ini files, there is yarprobotinterface.ini that specifies which is the file containing list of devices to start, usually its name is [icub_all.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV3_0/icub_all.xml).
- [general.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV3_0/general.xml): contains some flags that change behavior of [Yarprobotinterface](http://www.yarp.it/git-master/yarprobotinterface.html).

In the following snippet there is typical main configuration file: it shows the configuration of left arm only. If you desire to have look at the entire file, see icub_all.xml in a robot folder.


IMPORTANT==> It is important to notice that names of each files follow specific rules. It is very important following the naming convention because the file name can give you some information about the device or wrapper. Please see the section [Naming convention](#naming-convention)
```xml
    <!-- LEFT ARM -->
    <devices file="hardware/motorControl/left_arm-eb1-j0_3-mc.xml" />         <!-- motion control device that controls joints numbered from 0 to 3 -->
    <devices file="hardware/motorControl/left_arm-eb24-j4_7-mc.xml" />        <!-- motion control device that controls joints numbered from 4 to 7 -->
    <devices file="hardware/motorControl/left_arm-eb25-j8_11-mc.xml" />       <!-- motion control device that controls joints numbered from 8 to 11 -->
    <devices file="hardware/motorControl/left_arm-eb26-j12_15-mc.xml" />      <!-- motion control device that controls joints numbered from 12 to 15 -->
    <devices file="wrappers/motorControl/left_arm-mc_wrapper.xml" />          <!-- wrapper of motion control devices -->

    <!-- LEFT ARM MAIS:device and its wrapper -->
    <devices file="hardware/MAIS/left_arm-eb26-j12_15-mais.xml" />
    <devices file="wrappers/MAIS/left_arm-mais_wrapper.xml" /> 

    <!-- LEFT ARM SKIN :device and its wrapper--> 
    <devices file="hardware/skin/left_arm-eb24-j4_7-skin.xml" />
    <devices file="wrappers/skin/left_arm-skin_wrapper.xml" />

    <!-- LEFT ARM FT device and its wrapper -->
    <devices file="wrappers/FT/left_arm-FT_wrapper.xml" /> 
    <devices file="hardware/FT/left_arm-eb1-j0_3-strain.xml" />

    <!--  CALIBRATOR -->
    <devices file="calibrators/left_arm-calib.xml" />
```

## Naming convention
---
To help maintenance of configuration files, it is necessary to include the following information in the names of each single file:

- robot body parts;
- type of device or type of information contained in the file, like mechanicals or electronic or motor control data;
- the electronics board number: in case of configuration file of device, it is useful to know which is the electronic board to refer to.
- number of joints connected to the board.

### Rules for naming devices
This is the pattern of name of each device and its configuration file: body_part-ebX-jA_B-type_of_device. In details, each name is make up of 4 parts:

- body_part: head, face, left_arm, right_arm, torso, left_leg, right_leg;
- ebX: where X is the number of electronic board written on schematics document. Usually, but not always, X is also the last number of board’s ip address;
- jA_B: this indicates that the board ebX controls joints from A to B. This information let you know if board is in upper or lower part.
- type_of_device: skin, mais, strain, mc, intertials.

For example, the configuration file of motor control device of joint 0 and 1 of head is named head-eb20-j0_1-mc.xml and inside it there is the name of device head-eb20-j0_1-mc:
```xml
<devices robot="robotName" build="1">
    <device name="head-eb20-j0_1-mc" type="embObjMotionControl">
        <params ....... />
	………………………………….
        …………………………….
    </device>
</devices>
```
### Rules for naming wrapper file
The wrapper name and its configuration files should have the same name and its pattern is : body_part-type_of_device_wrapper.xml. In details, each file name is make up of 2 parts:

- body_part: head, face, left_arm, right_arm, torso, left_leg, right_leg, left_foot, right_foot;
- type_of_device_wrapper: skin_wrapper, mais_wrapper, FT_wrapper, VFT_wrapper, mc_wrapper.

### Rules for naming joints
Each joint has a name that follows the naming convention explained [here](./../icub-joints/icub-joints.md).

## Configuration of devices
---
To configure a device it is necessary some specific data depending on device type and information of electronic board it refers to. So, more devices can refer to the same electronic board: for example a motion control device and a skin device could share the same electronic board, this mean that the board can controller some joints and can read skin values at the same time. In following sections, you can find an overview of configuration of each device type, while the meaning of each parameter is describes in respective template file in folder iCubTemplates/iCubTemplateVx_y in this [repository](https://github.com/robotology/robots-configuration). Currently the most recent version is iCubTemplateV5_0.

### Motor control device
Configuration of a motor control device is composed by the wiring, mechanicals and obviously by motor control specification related to joints it manages. In Ethernet robots, a motor control device corresponds to a motor control electronic board that manages from one up to twelve joints.

The entry point of motor control device configuration is the file named [body_part-ebX-jA_B-mc.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/motorControl/body_part--ebX-jA_B-mc.xml), that is included in icub_all.xml. This file contains all parameters that the robot's user can modify, for example PID and joints limits, and links other 4 files that only maintainers should modify. These other four files are:

- [general.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/general.xml): contains some flags that change behavior of the device
- [body_part-ebX-jA_B-eln.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/electronics/body_part--ebX-jA_B-eln.xml): contains description of electronic board , such as ip address, and specific parameters of communication protocol used by firmware and yarp devices.
- [body_part-ebX-jA_B-mec.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/mechanicals/body_part-ebX-jA_B-mec.xml): contains specific information about mechanics. Usually this file should be equal for all robots of same version.
- [body_part-ebX-jA_B-mc_service.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/motorControl/body_part--ebX-jA_B-mc-service.xml): contains all the information necessary for the firmware to initialize the motion control service: it needs to know for each joint which is its pwm port, which is its encoder and where is connected.

It is important to notice that each parameter inside mechanicals, motion-control and motion-control-service files needs to have the same number of values of number of joints to configure.


One of the major changes started from version 3.0 and consists of introduction of CONTROLS tag: it allows the user to save in file different PID configurations and he/she can choose which configuration he/she wants to use depending on the experiment he/she wants to run on the robot. To do this, the user writes one or more sections of PID within the file and indicates the selected PID in the "CONTROLS" group. Below there is just a snippet of an example of a head movement control device configuration file: the example only refers to the configuration of the control PID in the position mode, but the same concept can be extended to other modalities.

```xml
<group name="CONTROLS">
   <param name="positionControl">      JOINT_PID_EXPERIM_1    JOINT_PID_EXPERIM_1      </param> 
   <param name="velocityControl">      none                   none                     </param> 
   <param name="torqueControl">        none                   none                     </param>
    <param name="currentPid">          none                   none                     </param> 
</group>


<group name="JOINT_PID_EXPERIM_1">
    <param name="controlLaw">    Pid_inPos_outPwm   </param> 
    <param name="controlUnits">  metric_units       </param> 
    <param name="pos_kp">               1100.00             -1000                       </param>       
    <param name="pos_kd">                  0.0                  0.0                     </param>     
    <param name="pos_ki">                  0.0               -100                       </param>          
    <param name="pos_maxOutput">        3360                 3360                       </param>  
    <param name="pos_maxInt">           3360                 3360                       </param> 
    <param name="pos_shift">               0                    0                       </param>       
    <param name="pos_ko">                  0                    0                       </param>  
    <param name="pos_stictionUp">          0                    0                       </param> 
    <param name="pos_stictionDwn">         0                    0                       </param> 
    <param name="pos_kff">                 0                    0                       </param> 
</group>

<group name="JOINT_PID_EXPERIM_2">
    <param name="controlLaw">   Pid_inPos_outPwm  </param> 
    <param name="controlUnits"> metric_units      </param> 
    <param name="pos_kp">                800.00               -600                       </param>
    <param name="pos_kd">                  0.0                   0.0                     </param>
    <param name="pos_ki">                  0.0                -100                       </param>
    <param name="pos_maxOutput">        1000                  1000                       </param>  
    <param name="pos_maxInt">            500                   500                       </param> 
    <param name="pos_shift">               0                     0                       </param>       
    <param name="pos_ko">                  0                     0                       </param>  
    <param name="pos_stictionUp">          0                     0                       </param> 
    <param name="pos_stictionDwn">         0                     0                       </param> 
    <param name="pos_kff">                 0                     0                       </param>
</group>
```
In this configuration, the user has selected PID with tag "JOINT_PID_EXPERIM_1". If he/she want use a different setup, he/she needs to set "JOINT_PID_EXPERIM_2" in "CONTROL" group instead of "JOINT_PID_EXPERIM_1". Moreover, it is possible to select "JOINT_PID_EXPERIM_1" for some joints and "JOINT_PID_EXPERIM_2" for the others, but the user should be sure that "JOINT_PID_EXPERIM_1" and "JOINT_PID_EXPERIM_2" has the same value of controlLaw parameter.

### FT sensor device
This device represents a Force-Torque sensor mounted on robot, so in its configuration there are information about its CAN address, to which Ethernet board it is connected, etc. See the [template file](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/FT/body_part-ebX-strain.xml) for more details.

### Mais device
This device represents a mais sensor mounted on robot, so in its configuration there are information about its CAN address, to which Ethernet board it is connected, etc. See the [template file](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/MAIS/body_part-ebX-mais.xml) for more details.

### Skin device
A skin device represents a part of skin of robot; usually the part corresponds to a body part of robot. To configure this device, its is necessary the list of mtb boards that belong to this part and some data to configure each tactile point. Since almost all tactile points uses the same configuration values, there is a parameter called “DefaultCfg”, that is the default configuration, but there is also a “SpecialCfg” parameter by which the user can specified different configuration value for some tactile points.

The configuration of this device is in two files: the entry point is body_part-ebX-skin.xml, where there are information about the location of mtb board and it includes body_part-ebX-skinSpec.xml, that contains tactile points configuration.

Please, see [template file](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/skin/body_part-ebX-skin.xml) for more details.

### Inertial device
This device represents inertial sensors mounted on mtb boards connected to a Ethernet board. See [template](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV5_0/hardware/inertials/body_part-ebX-inertials.xml) for more details.

## Configuration of calibrator module
---
The calibrator module for Ethernet robots is parametricCalibratorEth; it uses the parameters written in [body_part-calib.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV3_0/calibrators/body_part-calib.xml) file. Please follow the link to get the meaning of each parameter.

Here is reported a brief description of calibrator module and the role of some parameters are involved in calibration and parking procedures.

The calibrator in the startup phase launches the calibration procedure: after a motor control devices has been configured, it tries to calibrate its joints. The calibration procedure is composed by three steps:

- Sets a safe pwm limit: uses value of parameter “startupMaxPwm”, like the maximum pwm applicable to the motor;
- If the parameter “skipCalibration” in [general.xml](https://github.com/robotology/robots-configuration/blob/master/iCubTemplates/iCubTemplateV3_0/general.xml) is false, it sends the calibrate command to each joint with the parameters written in the calibration file, else skips following steps leaving joints in not configured state and exits. If you are interested in details information about calibration and its parameter see here. (The link will be available asap, sorry for the incovenience).
- If the joint completes the calibration sucessfully, then it tries to move it to the “startupPosition” using “startupVelocity” specified in calibration file. If an error occurred in calibration phase, the joint is in fault error.
- If the “startupPosition” is reached, then the joint is ready, else is in fault error.

When the user shuts down [Yarprobotinterface](http://www.yarp.it/git-master/yarprobotinterface.html), the calibrator moves all joints to the park position, that is the position specified in “positionHome” parameter using “velocityHome”.

## Note for robots in iCub Tech (IIT Genoa, Italy)
---
Usually the robots in iCub Facility run developing software, that is, they use the same software modules, but on the development branch instead of the stable one (master).


For these robots, the most recent configuration is available on development branch of robots configuration repository in the folder [iCubTemplates/iCubTemplateV5_0](https://github.com/robotology/robots-configuration/tree/devel/iCubTemplates/iCubTemplateV5_0).

This mean that in the newest version may be available new parameters or there are some changes that are not described in the last stable version.

If you are interesting in the meaning of this changes, please check [iCubTemplates/iCubTemplateV5_0](https://github.com/robotology/robots-configuration/tree/devel/iCubTemplates/iCubTemplateV5_0).