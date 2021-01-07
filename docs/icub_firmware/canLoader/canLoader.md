# CanLoader
The canLoader application allows to flash the firmware of the dsp boards using the canbus interface.
It can be also used to determine which boards are up and running.
The canLoader allows to either use plx canbus boards or esd canbus boards (actually any device implementing an ICanBus interface in YARP).
Detailed [CANLoader protocol](./assets/RC_DIST_100_D_15_01_CANLOADER_PROTOCOL.pdf).

## Steps
- Determine the type of device you want to use. If you are on the pc104 this will probably be the cfw2 device.
- Make sure you have compiled the appropriate canbus device (pcan,cfw2 or ecan) (read Compilation on the pc104).
- Make sure the canLoader program has been compiled. In the main iCub project, this is done automatically if you have the gtk/gtkmm libraries.
- Run the canLoader program. If you ssh into the pc104 make sure you use the -X option to redirect the graphic output to your local machine.
- Select the device you use (cfw2/pcan/ecan) in the text box (for historical reason default is ecan).
- Select the can network you want to probe (0 to 9), and hit connect. See below for a list of the can networks.

You should see a list of boards that are available in the network you have selected, their id, the version of the firmware, the build number and a text description. If a card is listed here it means that it was able to reply to the broadcast message from the canLoader (a good start).

## Device Type
The device type is the software module that wraps the can bus device you are using.

- On the first version of iCub the pc104 has a plx can bus device, wrapped by the pcan software module.
- On iCub 1.1 the pc104 also mounts two esd can bus devices, which are wrapped by the ecan software module. In this case the device module you use depends on  - The can bus network (or body part) your want to access.
- On iCub 1.1.1 (and later) the pc104 mounts up to 9 can bus devices, which are wrapped by the cfw2 software module.