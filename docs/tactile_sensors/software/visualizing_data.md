## Visualizing Tactile Data
There exist two ways to visualize tactile data:

1. [**`iCubSkinGui`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__iCubSkinGui.html)
2. [**`iCubGui`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__gui.html)

The `iCubSkinGui` visualizes a 2D representation of one or more patches of tactile sensors. The GUI reads the tactile data from an input YARP port, hence it can visualize both raw data and compensated data.

The `iCubGui` visualizes a 3D model of the iCub. To visualize the tactile data with this GUI you need to launch the [**`skinManager`**](https://robotology.github.io/robotology-documentation/doc/html/group__icub__skinManager.html) module and connect the `skinManager` output port `/skinManager/skin_events:o` to the `iCubGui` input port `/iCubGui/forces`. Then, this GUI visualizes a red arrow for each contact detected by the tactile sensors. The length of the arrow is proportional to the sum of the outputs of the tactile sensors.

Alternatively, if the robot is equipped with force/torque sensors and [**`wholeBodyDynamics`**](https://robotology.github.io/robotology-documentation/doc/html/group__wholeBodyDynamics.html) is running, the `iCubGui` can be connected to the port `/wholeBodyDynamics/contacts:o`. In this case, the tactile data are integrated with the force/torque data to estimate the external contact forces. This means that the length of the arrows displayed in the `iCubGui` would be proportional to the estimated force magnitude (rather than the tactile sensor outputs). To make this system work, you need to connect the `skinManager` port `/skinManager/skin_events:o` to the `wholeBodyDynamics` port `/wholeBodyDynamics/skin_contacts:i`.
