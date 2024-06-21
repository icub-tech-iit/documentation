# Standard Calibration Types
The aims of this document is to provide expert users with some technical information about `joints` calibration types on our robots (e.g., `iCub`, `ergoCub`, `R1`) that are based on Ethernet, in order to set the desired `zero position` of the robot.

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

2. In the [general.xml](https://github.com/robotology/robots-configuration/blob/master/R1SN003/general.xml) file set both `useRawEncoderValue` and `skipCalibration` parameters to `true`

3. Press the fault button, so that you are sure that the procedure runs safely.

4. Launch `yarprobotinterface`. You will see that `yarprobotInterface` tells you to press fault button and wait until the user presses enter.

5. Start the calibration procedure depending on the calibration type.

## General rules for each calibration type
1. At the end of calibration, the joint has to be inside of user limits, if not the controller sets the joint in hardware fault.

2. If during calibration something goes wrong, then the controller sets the joint in `hardware fault` or leaves the joint in `not configured` state.

## The available calibrations in details
---
Here are described the usage of the various calibration types; the `param` are in the [calibrators files](https://github.com/robotology/robots-configuration/tree/master/robots-icebox/iCubHongKong01/calibrators) where you'll find a file for each part of the robot and looks like :

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
    The hardstop could be out of range of user limits, but it needs to be inside hardware limits; so the hardstop could be a hardware limit and the joint is calibrated after reaching it, but the controller verifies that the first received setpoint is inside user limits, else limits it to the nearest user limit.

### Calibration 6
This calibration can be used for joint with `MAIS` and `FAP` board encoders. On iCub robots, distal and proximal joints use `MAIS`, while `FAP` are employed on ergoCub fingers.
This calibration is used also to calibrate the motor encoder setting its zero to a given position. In this way, the motor controller engine can check that the joint moves inside the rotor limits specified in the mechanical configuration file avoiding dangerous situations like winding to much cable and pushing against the hardware limit.

|   |   |
|---|---|
|`Calibration type`| 6|
|`calibration1`| not used|
|`calibration2`| velocity expressed in iCubDegree/s|
|`calibration3`| 1 if distal joint, -1 if proximal joint. (Any other value is not accepted)|
|`calibration4`| mais/fap raw value read with open hand|
|`calibration5`| mais/fap raw value read with closed hand|
|`calibrationZero`| 0.0 (only value corrected)|
|`calibrationDelta`| defined by user expressed in degree|

!!!info
    **Calibration 6 MAIS** uses `mais` raw values to calculate the joint encoder factor and the offset of 0.0 position.
    Moreover, it calibrates the motor incremental encoder moving the joint toward a target position in a way specified by the parameter `calibration3`.
    If it is `-1`, then the joint moves to the position written in `calibration4`, otherwise the joint moves to `calibration5`.

    **Calibration 6 FAP**, instead, does not calculate either the joint encoder factor or the offset of the 0.0 position because the calibration of the FAP absolute encoder is performed manually. Therefore, the fingers are manually moved by checking the raw values and then the `offset`, the `rotation`, and the `invertDirection` parameters are specified in the POS service configuration file, in order to have the fingers rotation comprised in the range [~0, ~90] deg, in the desired direction.
    When the FAP is calibrated and works properly (the procedure described above shall be done just once, after the hand is mounted), the calibration 6 procedure can start. The steps are the same as those in `calibration6 mais`.
    Therefore, the motor encoder gets calibrated by moving the joint to the target position depending on the value of `calibration3` parameter: if it is `-1`, then the joint moves to the position written in `calibration4`, otherwise the position expressed in `calibration5` is used as target. Thereby, the rationale of this procedure is to find the zero as well as the offset of the motor incremental encoder.
    The movement is performed using the velocity specified in `calibration2` parameter. If the joint reaches the target position then the calibration ends successfully.

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

They are both hard-stop calibrations, but the difference is that `type 8` calibration (wrist) makes use of limit switches readable by the `MC4+` control board, while the torso tripod linear actuators (`type 9`) have limit switches as well, but they aren't readable by the control board. 

So, when the motor stops during the calibration, it is assumed that the hard-stop is reached.

In both `type 8` and `type 9` hard-stop calibration a counter reaction mechanism prevents some joints to move much farther than others in order to prevent damages to the structure.
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


### Calibration 10
This calibration is used for joints with relative encoders, which are calibrated by moving against the hard-stop limit. It is used for example in R1 lower arm pronosupination and in iCub 3 when AMO sensors are used as relative encoders.

Regarding iCub 3 and the AMO boards, the AMO magnetic target is subdivided into 64 or 32 sectors. The AMO sensor provides a 14-bit resolution per sector, for a total of 14+6=20 or 14+5=19 bits per revolution resolution, respectively. The `Gearbox_E2J` parameter must be configured with the number of sectors in the corresponding `mechanicals/part-mec.xml` file.

Further details of how the workflow of the whole calibration type 10 is managed are outlined on [this page](./amo_encoder_joint_calibration_10_details.md).

|   |   |
|---|---|
|`Calibration type`| 10|
|`calibration1`| PWM used to move to hard-stop limit|
|`calibration2`| not used|
|`calibration3`| not used|
|`calibration4`| not used|
|`calibration5`| not used|
|`calibrationZero`| position (in degrees) at the hard-stop limit|
|`calibrationDelta`| defined by user expressed in degree|

!!!note
    On AMO-based robots (e.g., iCub 3, ergoCub), the AMO sensors can be completely disabled to favor the use of the quadrature encoders only by changing the value of the `amo` parameter to `none` within the `hardware/motorControl/*service.html` files.

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

### Calibration 14
This calibration is used for joints with the absolute encoder at the joint (which currently works with POS service / FAP encoder sensor) and with incremental encoder at the motor. Moreover, it is applied to joints whose motor is provided with hard-stop mechanical limits. Specifically, this type of calibration is used when you need to reach one of the two mechanical limits on the joint motor, aiming at calibrating the incremental encoder at the motor and accurately setting the hardware limits between which the rotor can move.

Find below some steps aimed to help you determine the correct values of the parameters to be set in the calibration sections of the configuration files.
First, set to `true` the boolean variables `skipCalibration` and `useRawEncoderData` in the file `general.xml`. This is meant to disable calibration at `yarprobotinterface` startup. Also, this will make the port `/ergocub/left_arm/state:o` print the raw values (i.e., uncalibrated) for the finger joint encoders. 
Once done, you should check the values printed out by the port running in a terminal the command:

```console
yarp read ... /ergocub/left_arm/state:o
```

and by doing this you can observe which should be the raw value of the offset for the encoder joint when the finger is at the hard-stop position (ideally finger full open). Thus, you should set this value (with the same sign of the value printed by the port) as the value for the parameter `calibration5`.
After that, by observing how the values printed out by the port change, you would check if the `invert direction`, i.e. `calibration3` value, should be `1` or `0` and if a specific value of rotation should be added at `calibration4` in order to prevent the encoder from crossing the zero while finger joint is moving.

|   |   |
|---|---|
|`Calibration type`| 14|
|`calibration1`| PWM used to move to hard-stop limit |
|`calibration2`| Final position (in iCubDegrees) at the hard-stop limit [motor zero] |
|`calibration3`| Invert direction boolean parameter |
|`calibration4`| Rotation (in iCubDegrees) parameter |
|`calibration5`| Offset (in iCubDegrees) parameter |
|`calibrationZero`| 0.0 (only value corrected) |
|`calibrationDelta`| defined by user expressed in degree |

!!!note
    The `calibration14` rotation parameter cannot assume any value. Allowed values are: `0`, `32768`, `16384`, `-16384`, expressed in `iCubDegrees` as specified in the table above. Specifically, these values correspond to the following numbers in degrees: `0`, `180`, `90`, `-90`. Notice how these values are only accepted without decimals; therefore, only integer parts are checked. In fact, multiplying the degrees by the conversion factor, defined in the [Legend](#legend) section, generates outputs with decimals. Thus, it has been decided to round them up.

!!!info
      Considering that this calibration works in close relation with absolute encoders, it is necessary to keep in mind the following note.
      First, `calibration type 14` has been designed to work with finger joints and specifically it is currently tested on joints that use `FAP` encoders. However, it should work similarly with other types of absolute encoders. In particular, the parameters that should be modified are `calibration3`, `calibration4`, and `calibration5`.
      Another detail to cite is also related to the aforementioned `FAP` parameters. Specifically, it has been chosen to pass those data in `iCubDegree`, but it is known that `POS` service, which manages the `FAP` encoder, use different datatype, especially for the rotation parameter that is defined by an `enum type`. Therefore, in the firmware, this conversion is managed. 
      In this manner, during the calibration phase, the absolute encoder is calibrated first, by setting the `offset` and adjusting it using `invertdirection` and `rotation` if different than zero. 
      Then, the algorithm moves the incremental encoder at the motor to the `hard limit` (at open or closed finger based on the PWM sign) at setting `calibration2` as the `motor zero`. 
      After that, `rotorPosMin`, and `rotorPosMax` passed in the mechanical configuration file, are set as the rotor limits. Thus, the motor will move only between those limits (expressed in degrees at motor).

## Legend
- `iCubDegree`: the firmware uses iCubDegree instead of degree in order to use more resolution.
      
!!!info
    1 Degree = 182.044 iCubDegree, where 182.044 is 65535/360; The value 182.044 is contained in the parameter “Encoder” of mechanical configuration files of each robot.

- `Encoder conversion` factor: is the factor used by firmware to convert the value read from encoder to iCubDegree.


