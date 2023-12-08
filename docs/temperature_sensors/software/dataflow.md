## Motor temperature Data Flow

Generally, the data flow related to the whole pipeline of the sensing of the motor temperature is quite simple and a brief summary is proposed here below, whose main purpose is to make the reader aware of how the temperature data is retrieved from the motor resistance thermometer and printed out to a YARP port. 

In a nutshell, as introduced in the [introductory section](../general/overview.md#temperature-sensors), most of the `ergoCub` motors are currently provided with a `PT100`, which is a particular resistor able to correlate a value of temperature to a value of resistance in `Ohm`. The resistor is connected to a board called **Temperature Detection Board **(TDB).
The TBD receives the `Ohm` value from the `PT100` (or `PT1000` for different types of motors) and streams out with the raw data using the `I2C` protocol. This raw data is then read by the `2FOC` board with a frequency of 200Hz. The `2FOC` also checks if there is any `overHeating` error, relying on the user-defined configuration parameter `hardwareTemperatureLimits`. The raw temperatures are sent over `CAN` to the `EMS` board, which stores them in memory and sends to `embObjMotionControl` together with all the other motor information. 

Upon reception of the motor temperature, `embObjMotionControl` converts the values from raw to Celsius and checks if the `warningTemperatureLimit` is overcome. In that case, it prints out a warning on the yarprobotinterface log. No other actions are taken.

It is important to note that in the whole pipeline we are doing two different checks for the temperature:

1. when reading the raw temperature value, the `2FOC` board checks that it is not higher than the `hardwareTemperatureLimits`, otherwise it triggers the `overHeating` error and sends the fault state to the robot.
2. when the temperature is received, `embObjMotionControl` converts it to Celsius degree and checks that the result is not beyond the `warningTemperatureLimit`, otherwise it prints a warning log until the temperature drops. 

### Main Flow of Information

Here's a small yet exhaustive sequence diagram showing the whole dataflow as summarized above. In it, it is possible to observe how the different actors that takes part to the pipeline of this feature interact among each other, starting from the lower level up to the higher level.

<p align="center">
    <img  src="../img/MotorTemperature-Feature.png" width="700">
</p>

