# The OS on icub-head - Installation from pre-built image

!!! warning

    The instructions for installing a pre-built images are currently outdated. Please, refer to the other modes of installation.

This method uses a pre-built disk image to install the icub-head, this image is a 1:1 copy of a working system: once the image is written on the icub-head disk (**erasing any data currently on the disk!**) you get a working system, with only a few customiztion required.
If you prefer to install the system from scratch, please check the [_appropriate guide_](installation-from-scratch.md).

# Installation procedure

This procedure involves the following steps:

1. Create the bootable USB with the imaging tool (CloneZilla)
2. Download the latest iCubOS image
3. Connect the icub-head
4. Boot the USB disk
5. Write the image
6. Reboot icub-head
7. Customize the system

## Create the bootable USB with the imaging tool (CloneZilla)

The imaging tool used to create and restore icub-head disk images is [CloneZilla LIVE](https://clonezilla.org/clonezilla-live.php).

1. Download clonezilla from this [link](https://clonezilla.org/downloads.php)
2. Get a USB 3 drive (at least 4 GB of size)
3. Create the live USB following [this guide](https://clonezilla.org/liveusb.php)

## Download the latest iCubOS image

Get the lastest iCubOS image from [this page](../download.md) and put it on an external USB drive (not the same where the CloneZilla LIVE is).

The iCubOS archive contains a directory; just copy the directory itself (not its contents) on the external USB drive. 
The USB drive can be formatted in any filesystem that can be natively read by Linux.

## Connect the icub-head

You need:

- USB 3 hub
- USB keyboard
- The Bootlabe USB with the imaging tool (see above)
- The external USB drive with the iCubOS disk image
- A monitor with DisplayPort input

Connect the keyboard, the USB with clonezilla to the hub and the USB disk with the iCubOS disk image. Then connect the hub to a USB port in the iCub head.
Connect the monitor to the DisplayPort socket in the iCub head.

## Boot the USB disk

Power on the icub-head and enter BIOS, the select drive with CloneZilla as first in boot order, then boot from that drive.

## Write the image

Follow the steps below to write the image on the icub-head HD (detailed instruction about how to use CloneZilla can be found [here](https://clonezilla.org/clonezilla-usage/clonezilla-live-usage.php) ).
Please, note that the instructions below refers to the lastest clonezilla release available at the time of writing (2.6.6)

1. In boot menu, select the option `Clonezilla live (Defaut, To RAM)`
2. choose your language
3. choose your keyboard layout
4. select the `Start_clonezilla` option
5. select the `device-image` option
6. select the `local_dev` option
7. do **NOT** remove the USB drive with Clonezilla live form the USB hub
8. connect the USB with the disk image to the USB hub
9. wait for the USB drive (as in step 8) is shown and press `CTRL-C`
10. select the correct drive and partition for the USB drive (as in step 8) (usually partition is n.1)

## Restart icub-head

Power down the icub-head and unplug the USB hub, then restart.

## Customize and update the system

What you need now to do is to customize the installation with your hardware and enviroment; in particular, see the "_Required configuration_" section in [_Networking_](networking.md).

After you correctly set up your network, it is necessary to update the system by entering in a terminal `sudo apt update` and `sudo apt upgrade`. This will update all packages and tools needed later to compile the superbuild.

If you need to connect the icub-head to any Bluetooth device, please check the steps described in [_Bluetooth_](bluetooth.md).

Now you can proceed with installing the required YARP and iCub software by following the guide on [Superbuild installation on icub-head](../../sw_installation/icub_head_superbuild.md).
