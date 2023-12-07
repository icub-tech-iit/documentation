## Motor temperature Data Flow

Generally speaking the data flow related to the whole pipeline of the sensing of the motor temperature is quite simple and here a brief summary is proposed, whose main scope is to make the reader aware of how the temperature data are retrieved from the motor resistance thermometer and printed out to a yarp port. 

In a nutshell, as introduced in the [introductory section](../general/overview.md#temperature-sensors), most of the `ergoCub` motors are currently provided with a `PT100`, which is roughly a particular resistor able to correlate a value of temperature to a value of resistance in `Ohm`. This is then linked to a board called Temperature Detection Board (TDB), whose internal components are meaningless for our aim.
Anyways, its function is to evaluate the `Ohm` value given by the `PT100` (or `PT1000` for different types of motors) and streams out with a `I2C` protocol the raw data. This are then read by the `2FOC` board with a frequency of around 200Hz, which also checks if there's any `overHeating` error depending on the values set by the end-user in the configuration files at the parameter `hardwareTemperatureLimits`. The raw temperatures are sent over `CAN` to the `EMS` board, which stores them in the memory and sends to `embObjMotionControl` together all the other motor information. 

On reception of the motor temperature, `embObjMotionControl` converts the values from raw to Celsius and checks if the set `warningTemperatureLimit` is overcome. In that case it print a warning on the yarprobotinterface log just to advise the user. Any other actions are taken.

It is important to note that in the whole pipeline we are doing two different checks for the temperature:

1. when reading the raw temperature value the `2FOC` board checks that it is not higher than the `hardwareTemperatureLimits`, otherwise it triggers the `overHEating` error and sends the fault state to the robot
2. when the temperature is received and converted to Celsius degree by the `embObjMotionControl`, this checks that the passed value is not beyond the `warningTemperatureLimit`, otherwise it prints a warning log until the temperature drops. 

### Main Flow of Information

Here's a small yet exhaustive sequence diagram showing the whole dataflow as summarized above. In it, it is possible to observe how the different actors that takes part to the pipeline of this feature interact among each other, starting from the lower level up to the higher level.

<p align="center">
    <img  src="../img/MotorTemperature-Feature.png" width="700">
</p>

