# Configuration of calibrator module
The calibrator module for Ethernet robots is `parametricCalibratorEth`; it uses the parameters written in `body_part-calib.xml` file. Please follow the link to get the meaning of each parameter.

Here is reported a brief description of calibrator module and the role of some parameters are involved in calibration and parking procedures.

The calibrator in the startup phase launches the calibration procedure: after a motor control devices has been configured, it tries to calibrate its joints. The calibration procedure is composed by three steps:

 1. Sets a safe pwm limit: uses value of parameter `startupMaxPwm`, like the maximum pwm applicable to the motor;
 2. If the parameter `skipCalibration` in `general.xml` is false, it sends the calibrate command to each joint with the parameters written in the calibration file, else skips following steps leaving joints in not configured state and exits. If you are interested in details information about calibration and its parameter see here. (The link will be available asap, sorry for the incovenience).
 3. If the joint completes the calibration sucessfully, then it tries to move it to the `startupPosition` using `startupVelocity` specified in calibration file. If an error occurred in calibration phase, the joint is in fault error.
 4. If the `startupPosition` is reached, then the joint is ready, else is in fault error.

When the user shuts down Yarprobotinterface, the calibrator moves all joints to the park position, that is the position specified in `positionHome` parameter using `velocityHome`.