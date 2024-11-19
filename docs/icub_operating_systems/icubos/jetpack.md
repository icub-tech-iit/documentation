# The NVIDIA JetPack - Introduction

This guide is intended for developers who want to flash and set up the [Nvidia Jetson boards](https://www.nvidia.com/it-it/autonomous-machines/). These units use a [ConnectTech carrier board](https://connecttech.com/products/), so the preliminary instructions will be focused on that specific hardware. The table below shows _as an example_ the tested setup for each Nvidia board currently in use.

|Nvidia board|OS|JetPack |ConnectTech carrier board|BSP|
|:---:|:---:|:---:|:---:|:---:|
|Xavier AGX|Ubuntu 20.04|5.0.2|[Rogue](https://connecttech.com/product/rogue-carrier-nvidia-jetson-agx-xavier/)| [r35.0.1](https://connecttech.com/ftp/Drivers/L4T-Release-Notes/Jetson-AGX-Xavier/AGX-35.1.0.pdf)|
|Xavier NX|Ubuntu 18.04|4.6.2|[Quark](https://connecttech.com/product/quark-carrier-nvidia-jetson-xavier-nx/)|[r32.7.2](https://connecttech.com/ftp/Drivers/L4T-Release-Notes/Jetson-Xavier-NX/XAVIER-NX-32.7.2.pdf) |
|Orin NX|Ubuntu 20.04|5.1.2|[Boson for FRAMOS](https://connecttech.com/product/boson-for-framos-carrier-board-for-nvidia-jetson-orin-nx/)|[r35.4.1](https://connecttech.com/ftp/Drivers/L4T-Release-Notes/Jetson-Orin-NX-Orin-Nano/ORIN-NX-NANO-35.4.1_.pdf) |

# Requirements

## Hardware
- x86 PC/laptop for downloading Jetpack and flashing the OS
- USB-C to USB-A (or USB-C to USB-C) cable to connect the PC to the ConnectTech carrier
- Power supply cable
- Bench/System/ATE programmable DC power supply, capable of supplying 20V/2A
- (optional) Ethernet cable to connect the board to access it with SSH

To use the Jetson board directly without SSHing into it:
- HDMI cable to connect to an external display
- USB mouse and keyboard

## Software
On the developer's host PC:

- Ubuntu 18.04-20.04 (depending on the version of the JetPack)
- Nvidia JetPack installed through SDK Manager (instructions below)
- [Connecttech BSP](https://connecttech.com/product/) **specific** for the `board_type` board (e.g. Xavier AGX, Orin NX) and JetPack `jetpack_ver` (e.g. 5.0.2, 5.1.2). (Not required if you already have the image ready to flash)

# Instructions

## Carrier hardware configuration
Each carrier board could be equipped with different switches that should be set at the startup. For example, for the `Rogue` carrier, make sure that the switches on the carrier are set like in the picture below, so that the unit can boot manually when pressing the power (PWR) button. DO NOT power on the unit until instructed.

![](../img/switches.jpg)

## Hardware connection
1. Connect the carrier to the power supply through the provided cable, and set the power supply to 16V/2A.
2. Keep the power supply OFF.
3. Connect the HDMI cable, and the mouse/keyboard to the carrier.
4. Use the USB-C cable to connect the PC to the OTG USB port on the carrier.

![](../img/usbotg.jpg)

## Flash a new image from scratch

If you need to install an new JetPack image from scratch please follow the following steps.

### Jetpack setup on the host 

1. Download the Nvidia SDK manager from the [official website](https://developer.nvidia.com/embedded/jetpack) by clicking *Download Nvidia SDK Manager*
2. Run SDKManager and login with developer.nvidia.com credentials, and follow these steps:
   1. Set the following options:
      - Target Hardware: Jetson `board_type`
      - Target operating system: *Linux Jetpack `jetpack_ver`*.
   2. Check that everything is selected and continue
   3. The SDKManager will ask the user password to download all the components and it will install them into a local folder on the host (~12Gb of free space required); remember: this is the password of the local Ubuntu host, not the Jetson one.
   4. After the installation, the SDK Manager will be ready to flash the OS image on the Nvidia board; **Do not preceed further!** Press SKIP to abort the operation and quit from the SDK Manager
3. Download the ConnectTech board support package from the [official website](https://connecttech.com/product/): under Downloads click on the BSP you need, it will be downloaded as `.tgz` archive.
4. At this point the `SDKManager` should have created a folder tree in `~/nvidia` containing all the files needed for the flash. Copy the `.tgz` package downloaded from ConnectTech website into `~/nvidia/nvidia_sdk/JetPack_<jetpack_ver>_Linux_<board_type>/Linux_for_Tegra/`
5. Extract the BSP: `tar -xzf CTI-<*>.tgz`
6. Now, go into the CTI-L4T directory: `cd ./CTI-L4T`
7. Run the install script (as root or sudo) to automatically install the BSP files to the correct locations: `sudo ./install.sh`

Before flashing the image, we need first to put the board in recovery mode.

### Booting the Nvidia Jetson board in Recovery mode

With the **Nvidia Jetson Xavier AGX**:

1. Press the Force Recovery (FR) button on the carrier and keep it pressed
2. Turn on the power supply (16V)
3. Wait for several seconds, keeping the FR button pressed
4. Press the power (PWR) button for at least one second. Wait for several seconds
5. Release the FR button.

Now the board is in programming mode.

With a **Nvidia Jetson Xavier NX**, instead, keep the button RST/RECOVERY pressed for several seconds and then, when released, the board will be in recovery mode.

With the **Nvidia Jetson Orin NX**, the procedure is quite the same. The recovery mode could be achieved by pressing the Force Recovery and the Reset buttons simultaneously, then release the reset and, after ~2 sec, release the FR button too. The fan should starts.

In order to check that the board went in recovery mode, run on a terminal in the host

```bash
watch lsusb
```

The board is in recovery mode if it appears something like this

![](../img/lsusb.png)

### Flash the image

At this point we are ready to flash.

!!! warning

    If you want to configure your `Jetson Orin NX` to be used with `FRAMOS-IMX415` cameras, please refer to the [specific procedure](./setup-framos-imx415.md) from hereinafter.

1. From the previously folder, do `cd ..` to return to the Linux_for_Tegra directory
2. Flash the image by running `sudo ./cti-flash.sh` script (otherwise you can use the manual flashing procedure).

!!! note

    For the `Jetson Orin NX` board, since it is equipped with the nvme disk, the flashing script to be launched is: `sudo ./cti-nvme-flash.sh cti/orin-nx/boson/base`

!!! tip

    Check out the [ConnectTech tutorial](https://connecttech.com/resource-center/kdb373/) explaining the complete procedure.

### Verify the installation
After the reboot process, you should be greeted with the OS configuration wizard.
After configuring the system, the Jetson board should boot normally and be ready to use.

### Post-flashing operations

#### Complete the OEM installation
After booting into the OS, follow the OEM installation with the following options:

1. Accept the license agreement
2. Select English language
3. Select the English (US) keyboard layout
4. Select the preferred time zone
5. Set the user name to `icub` with the hostname `icub-head-cam` or `ergocub` with hostname `ergocub-head`, depending on the robot the board will be mounted on
6. Allow login without password
7. Let the installation process finish

After rebooting into the graphical OS, run the following commands in a terminal to update the system:

```bash
sudo apt install -f
sudo apt update && sudo apt upgrade
```

# Post-flashing operations

After successfully flashing your NVIDIA board by following the dedicated procedure, it is optional to perform a series of post-flashing operations to ensure the system is configured correctly and ready for use. The following steps will help finalize the setup.

- [Install CUDA libraries](./install-cuda-libraries.md)
- [Install librealsense](./install-librealsense.md)
- [Install jtop](./install-jtop.md)
- [Install CMake (only for Ubuntu 20.04)](./install-cmake.md)
- [Setup Orin NX for FRAMOS-IMX415 (only for `iCub head v2.10`)](./setup-framos-imx415.md)
