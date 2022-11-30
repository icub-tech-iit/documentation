# Structure of robot configuration data set

The data set contains configuration for software modules, robot hardware and wrappers.

The hardware configuration structure depends on the mechanical-electronic architecture of the robot heavily. Each device represents a sensor or a motor controller of group of joints. A device refers to an ethernet board mounted on the robot, but an ethernet board can be referred to by more devices: for example if a board controls 4 motors and reads the FT sensor, then both the motor control device and FT device have a reference to the board under consideration.

Each robot configuration folder has following structure:

**RobotNameFolder**:

 - **Calibrators**: each robot body part has a calibration file `bodyPart_calib.xml` with calibration data, that are robot dependent.
 - **Camera**: configuration about cameras mounted on robot
 - **Cartesian**: configuration about the cartesian module
 - **Hardware**: here there are descriptions of all devices available on robot
 - **Mais**: description of analog `mais` devices
 - **FT**: description of Force-Torque devices
 - **Inertials** : description of inertials devices
 - **Skin**: description of skin devices
 - **Motorcontrol**: description of motor control devices
 - **Electronics**: description of embedded Ethernet boards mounted on robot.
 - **Mechanicals**: description of mechanical features involved in motion control
 - **Wrappers**: configuration of yarp wrappers of devices
 - **Some .ini files.** Among .ini files, there is `yarprobotinterface.ini` that specifies which is the file containing list of devices to start, usually its name is `icub_all.xml`.
 - **general.xml**: contains some flags that change behavior of Yarprobotinterface.

 In the following snippet there is typical main configuration file: it shows the configuration of left arm only. If you desire to have look at the entire file, see `icub_all.xml` in a robot folder.

**IMPORTANT**: it is important to notice that names of each files follow specific rules. It is very important following the naming convention because the file name can give you some information about the device or wrapper. Please see the section [Naming convention](../naming_convention/naming_convention.md)



```xml
    <devices file="hardware/motorControl/left_arm-eb1-j0_3-mc.xml" />         <!-- motion control device that controls joints numbered from 0 to 3 -->
    <devices file="hardware/motorControl/left_arm-eb1-j0_3-mc.xml" />         <!-- motion control device that controls joints numbered from 0 to 3 -->
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