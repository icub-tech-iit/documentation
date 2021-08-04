# The OS on icub-head - Installation from pre-built image

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

Get the lastest iCubOS image on [this page](../download.md) and put it on a external USB drive (not the same were is CloneZilla LIVE)

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
7. remove the USB drive with Clonezilla live form the USB hub
8. ensure that the USB with the disk image is connected to the USB hub
9. wait for the USB drive (as in step 8) is shown and press `CTRL-C`
10. select the correct drive and partition for the USB drive (as in step 8) (usually partition is n.1)

## Restart icub-head

Power down the icub-head and unplug the USB hub, then restart.

## Customize the system

What now you need to do is to customize the installation with your hardware and enviroment, in particular see the "_Required configuration_" section in [_Networking_](networking.md).

If you need to connect the icub-head to any Bluetooth device, please check the steps described in [_Bluetooth_](bluetooth.md).

After you correctly setup your network, you can proceed in installing the required YARP and iCub software by following the guide on [Superbuild installation on icub-head](../../sw_installation/icub_head_superbuild.md).
