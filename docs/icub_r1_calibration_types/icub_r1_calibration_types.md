# Calibration types available on iCub and R1 robots
The aims of this document is to provide expert users with some technical information about `joints` calibration types on `R1` and `iCub` robots based on Ethernet in order to set the desired `zero position` of the robot.

The type of calibration depends on the encoders and on the mechanics of the joints.

There exist currently **12 types** of calibrations that will be explained in detail in the following sections.
 
The calibration procedure is performed by the firmware each time the robot starts up and it makes use of the following calibration parameters written in calibration files:

- `Calibration type`: it is the type of calibration. Its values should be included in [1,12]. Based on its value the meaning of the parameters `calibration1`, `calibration2`, `calibration3`, `calibration4`, `calibration5` changes. Usually they are expressed in machine units.
- `calibrationZero`: for historical reasons, is the value in degree at `0.0 position`. Now for several calibrations it is not necessary, so its value is `0.0`.
- `calibrationDelta`: this parameter can be changed by user to tuning the calibration, in order to set the zero of joint in the correct position (fine calibration).

It is important to notice that the firmware does not deal with either `calibrationZero` or `calibrationDelta` parameters independently, but it has only the sum of the two: `calibrationZero + calibrationDelta`. 
For this reason, if the calibration needs a particular value of `calibrationZero`, please insert that value, because it is mandatory.

## General procedure for retrieving calibration parameters
1. First off, you need to make sure that the boards have been reset after last calibration. If not, please swich off and swich on the boards.

2. In the [general.xml](https://github.com/robotology/robots-configuration/blob/master/CER01/general.xml) file set both `useRawEncoderValue` and `skipCalibration` parameters to `true`

3. Press the fault button, so that you are sure that the procedure runs safely.

4. Launch `yarprobotinterface`. You will see that `yarprobotInterface` tells you to press fault button and wait until the user presses enter.

5. Start the calibration procedure depending on the calibration type.

## General rules for each calibration type
1. At the end of calibration, the joint has to be inside of user limits, if not the controller sets the joint in hardware fault.

2. If during calibration something goes wrong, then the controller sets the joint in `hardware fault` or leaves the joint in `not configured` state.

## The available calibrations in details
---
Here are described the usage of the various calibration types; the `param` are in the [calibrators files](https://github.com/robotology/robots-configuration/tree/master/iCubHongKong01/calibrators) where you'll find a file for each part of the robot and looks like :

```xml
 <group name="CALIBRATION">
        <param name="calibrationType">      12         12          12          12           5           5           </param>
        <param name="calibration1">   	    30600	31535       46239        6687	     3000        3000	        </param>
        <param name="calibration2">         0           0           0	        0        8192   	 8192           </param>
        <param name="calibration3">	        0	        0           0	        0	        0    	    0           </param> 
        <param name="calibration4">         0           0           0           0           0           0           </param>
        <param name="calibration5">         0           0           0           0           0           0           </param>                
        <param name="calibrationZero">      0           0           0           0           0           0           </param>
        <param name="calibrationDelta">     0           0           0           0           0           0           </param> 
      
        <param name="startupPosition">      0           0           0           0           0           0           </param>        
        <param name="startupVelocity">      10          10          20          20          20          20          </param>        
        <param name="startupMaxPwm">        3000        3000        3000        3000        0           0           </param>        
        <param name="startupPosThreshold">  90          90          2           2           2           2           </param>        
  </group> 

```

### Calibration 5
This calibration is used on joints with incremental encoder that needs to reach a hardware stop to take the reference position.

|   |   |
|---|---|
|`Calibration type`| 5|
|`calibration1`| the pwm used to reach the hardstop|
|`calibration2`| raw position at hardstop|
|`calibration3`| not used|
|`calibration4`| not used|
|`calibration5`| not used|
|`calibrationZero`| 0.0 (only correct value)|
|`calibrationDelta`| defined by user expressed in degree|

!!!note
    **The hardstop could be out of range of user limits, but it needs to be inside hardware limits; so the hardstop could be a hardware limit and the joint is calibrated after reaching it, but the controller verifies that the first received setpoint is inside user limits, else limits it to the nearest user limit.**

### Calibration 6
This calibration is used for joint with `MAIS` board encoders. On iCub robots, distal and proximal joints use this encoder.

|   |   |
|---|---|
|`Calibration type`| 6|
|`calibration1`| not used|
|`calibration2`| velocity expressed in iCubDegree/s|
|`calibration3`| 1 if distal joint, -1 if proximal joint. (Any other value is not accepted)|
|`calibration4`| mais raw value read with open hand|
|`calibration5`| mais raw value read with closed hand|
|`calibrationZero`| 0.0 (only value corrected)|
|`calibrationDelta`| defined by user expressed in degree|

!!!info
    **Calibration 6** uses mais raw values to calculate the joint encoder factor and the offset of 0.0 position.
    Moreover, it calibrates the motor encoder that is an incremental and for this joints needs to move: the target position depends on value of calibration3 parameter:
    if it is `-1` then the joint move to the position written in `calibration4` else to `calibration5`. 
    The movement is performed using the velocity specified in `calibration2` parameter. Only if the joint can reach the target position then the calibration ends successfully.

### Calibration 7
This calibration is used for joint with absolute analog sensor. On iCub robot, this encoder is mounted on abduction fingers and on abduction thumb joints.

|   |   |
|---|---|
|`Calibration type`| 7|
|`calibration1`| not used|
|`calibration2`| not used|
|`calibration3`| not used|
|`calibration4`| sensor raw value read with open hand|
|`calibration5`| sensor raw value read with closed hand|
|`calibrationZero`| 0.0 (only value corrected)|
|`calibrationDelta`| defined by user expressed in degree|

!!!info
      In order to guarantee the maximum possible resolution and to provide the simples calibration procedure to the user, this calibration calculates the joint encoder factors and the offset of 0.0 position, using the raw values.

### Calibration 8, 9
Calibration `type 8` and `type 9` are similar since they are used in R1 tripod joints, which are actuated by linear actuators with incremental encoders. 

They are both hard stop calibrations, but the difference is that `type 8` calibration (wrist) makes use of limit switches readable by the `MC4+` control board, while the torso tripod linear actuators (`type 9`) have limit switches as well, but they aren't readable by the control board. 

So, when the motor stops during the calibration, it is assumed that the hard stop is reached.

In both `type 8` and `type 9` hard stop calibration a counter reaction mechanism prevents some joints to move much farther than others in order to prevent damages to the structure.
So a joint is slowed down if it is going faster than the others. 
If for some reason it insn't enough, the calibration fails.

|   |   |
|---|---|
|`Calibration type`| 8 or 9|
|`calibration1`| pwm during calibration|
|`calibration2`| maximum encoder difference treshold between two calibrating motors (safety mechanism described above)|
|`calibration3`| not used|
|`calibration4`| not used|
|`calibration5`| not used|
|`calibrationZero`| 0.0 (only value corrected)|
|`calibrationDelta`| defined by user expressed in degree|


### Calibration 12
This calibration is used for joint with absolute encoder, it is the newest version of calibration 3 and it simplifies the calibration procedure for the user; in fact the user needs only to write in calibration1 parameter the raw value read when jont is in 0.0 position and the firmware calculates the correct offset.

|   |   |
|---|---|
|`Calibration type`| 12|
|`calibration1`| raw position at the zero position defined by user|
|`calibration2`| not used|
|`calibration3`| not used|
|`calibration4`| not used|
|`calibration5`| not used|
|`calibrationZero`| 0.0 (only value corrected)|
|`calibrationDelta`| defined by user expressed in degree|

## Legend
- `iCubDegree`: the firmware uses iCubDegree instead of degree in order to use more resolution.
      
!!!info
    1 Degree = 182.044 iCubDegree, where 182.044 is 65535/360; The value 182.044 is contained in the parameter “Encoder” of mechanicals configuration files of each robot.

- `Encoder conversion` factor: is the factor used by firmware to convert the value read from encoder to iCubDegree.


