# iCub 3 - Stator/Rotor auto-calibration
This page shows how to run the autocalibration procedure of the rotor/stator alignement on iCub 3.

## Prepare the `XML` files
In order to get the values to put in the `XML` files, we need to modify the file enabling the autocalibration.

The files are located in [`robots-configuration/iCubGenova09/hardware/mechanicals`](https://github.com/robotology/robots-configuration/tree/master/iCubGenova09/hardware/mechanicals).

Accordingly to the joint you have to calibrate, select the corresponding file and set `AutoCalibration` param to 1 and `RotorIndexOffset` to 0:

```xml
 <group name="2FOC">
        <param name="AutoCalibration">       1             1       </param>
        <param name="Verbose">               0             0       </param>
        <param name="HasHallSensor">         0             0       </param>
        <param name="HasTempSensor">         0             0       </param>
        <param name="HasRotorEncoder">       1             1       </param>
        <param name="HasRotorEncoderIndex">  1             1       </param>
        <param name="HasSpeedEncoder">       0             0       </param>
        <param name="RotorIndexOffset">      0             0      </param>
        <param name="MotorPoles">            12            8      </param>
   </group>
```

## Run `yarprobotinterface` 
In order to get the value to be written in the `XML` file above, `yarprobotinterface` needs to be launched.

!!!info
    In order to get less messages from the `yarprobotinterface` log, better off enabling the calibration only for the joint that needs to be calibrated.
    To do that in the corresponding [calibration file](https://github.com/robotology/robots-configuration/tree/master/iCubGenova09/calibrators), edit the `CALIB_ORDER` param to contain only the number of the joint you need:
    ```xml
                <param name="CALIB_ORDER"> (0) (1) (2) (3) (4) (5) </param>
    ```

## Retrieve the offset from the log messages
Once `yarprobotinterface` is running, check the log messages and look for a `DEBUG` message regarding the joint being under calibration as below:

```
[DEBUG]  from BOARD 10.0.1.10 (right_leg-eb10-j0_1), src CAN1, adr 1, time 92s 891m 994u: (code 0x04000002, par16 0x8119 par64 0xffcc0042ffff0079) -> DEBUG: tag02 + .
```

Looking at par64, the rightmost 4 digits are the offset: `0x0079` = `121` degrees; this is the value to save in the file (see next steps). 

!!!warning
    The 8 leftmost digits (in the example `0xffcc0042`) must be not `0`!<br>
    Otherwise the calibration is failed/not completed. 

!!!note
    The joint number is determined by its `2FOC` CAN address, considering that `adr` can be in [1-4]: 
    
    Example 1
    `(right_leg-eb10-j0_1), src CAN1, adr 1` -> adr 1 is the first joint defined in `right_leg-eb10-j0_1`, so `joint 0`

    Example 2
    `(right_leg-eb11-j2_3), src CAN1, adr 2` -> adr 2 is the second joint defined in `right_leg-eb11-j2_3`, so `joint 3`


## Put the values in the `XML` files
Once the value of the autocalibration is retrieved, just put it in the corresponding [`XML`](https://github.com/robotology/robots-configuration/tree/master/iCubGenova09/hardware/mechanicals) file.

For the value retrieved above we need to modify the `joint 0` column of [file](https://github.com/davidetome/robots-configuration/blob/master/iCubGenova09/hardware/mechanicals/right_leg-eb10-j0_1-mec.xml) and set `AutoCalibration` back to `0`:

The column order in the file follows the joint order in the file-name; in the case of `right_leg-eb10-j0_1-mec.xml`, the first column is for `joint 0` and the second one is for `joint 1`.

```xml
<group name="2FOC">
        <param name="AutoCalibration">       0             0          </param>
        <param name="Verbose">               0             0          </param>
        <param name="HasHallSensor">         0             0          </param>
        <param name="HasTempSensor">         0             0          </param>
        <param name="HasRotorEncoder">       1             1          </param>
        <param name="HasRotorEncoderIndex">  1             1          </param>
        <param name="HasSpeedEncoder">       0             0          </param>
        <param name="RotorIndexOffset">      121           358        </param>
        <param name="MotorPoles">            12            8        </param>
   </group>
```

!!!warning
    In order to have the modification working, reboot the control boards before running `yarprobotinterface` again. 
