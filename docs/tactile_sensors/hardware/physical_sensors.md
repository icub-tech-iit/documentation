## Physical Sensors
The tactile sensor network of iCub is organized into patches. A patch is a set of tactile sensors that are physically connected one to the other and that are read by the same microcontroller. In particular, 18 patches are mounted on the robot:
- 1 in each hand
- 2 in each forearm
- 4 in each upper arm
- 4 in the torso

<p align="center">
    <img  src="../img/skin-triangles.png" width="500">
</p>

Each patch is composed by (at most 16) triangular modules, each consisting of 10 tactile sensors (aka taxels), with two additional small ones that are thermal pads (7th and 11th element). The 4th value corresponds to the taxel in the center of the triangle.

!!! note "Note"
    Older skin version contained 12 taxels per triangle.