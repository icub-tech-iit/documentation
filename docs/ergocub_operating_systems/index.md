# Introduction

This manual describes how to install and customize the linux operating systems required to run on machines in the ergoCub enviroment. 

The ergoCub robot relies on two machines: `ergocub-head`, a [`NVIDIA Jetson Xavier AGX`](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-xavier-series/) used to control the realsense camera, the lidar and the OLED display, and `ergocub-torso`, which is a [`COM express type 10`](https://www.advantech.com/en-eu/products/0a009637-4f9d-4541-8624-a55de3ffb2a6/som-7583/mod_17ca9251-bdf5-4f74-9256-edd63a373b39) that controls the motors.

# OS configurations

The following guides will help you to properly configure the OS for the specific board.

- [ergocub-head](../icub_operating_systems/icubos/jetpack.md)
- [ergocub-torso](ergocub_torso/install_from_scratch.md)

Alternatively, you can download the OS pre-built images [here](../icub_operating_systems/download.md).
