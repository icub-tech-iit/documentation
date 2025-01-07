# Introduction

This manual describes how to install and customize the Linux operating systems required to run on machines in the ergoCub environment. 

The ergoCub robot relies on two machines: `ergocub-head`, a [`NVIDIA Jetson Xavier AGX`](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-xavier-series/) used to control the realsense camera, the lidar and the OLED display, and `ergocub-torso`, which is a [`COM express type 10`](https://www.advantech.com/en-eu/products/0a009637-4f9d-4541-8624-a55de3ffb2a6/som-7583/mod_17ca9251-bdf5-4f74-9256-edd63a373b39) that controls the motors.

These machines are nodes of the [ergoCub network](network.md).

# OS configurations

The following guides will help you properly configure the OS for the specific board.

- [ergocub-head](../icub_operating_systems/icubos/jetpack.md)
- [ergocub-torso](ergocub_torso/install_from_scratch.md)

Alternatively, you can download the OS pre-built images [here](../icub_operating_systems/download.md).

# Setup tmux Infinite Scroll

Sometimes it is useful to run the `yarprobotinterface` directly from the terminal. By using `tmux`, you can detach from the SSH session. However, by default, the scrollback is not infinite, and not all messages are streamed to the logger.

To overcome this limitation:

1. Install xclip with:
  ```console
  sudo apt install xclip
  ```
2. Create a configuration file with:
  ```console
  touch ~/.tmux.conf
  ```
3. Set the following content in the configuration file:
  ```
  set -g mouse on
  set -g history-limit 100000
  ```
