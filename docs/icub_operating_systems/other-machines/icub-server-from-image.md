# Introduction

This method uses a pre-built disk image to install the icub-server, this image is a 1:1 copy of a working system: once the image is written on the icub-server disk (**erasing any data currently on the disk!**) you get a working system, with only a few customiztion required.
If you prefer to install the system from scratch, please check the [_appropriate guide_](icub-server-from-scratch.md).

# Prerequisite
Please check that the BIOS configuration allows to boot from USB drive.

# Installation procedure

This procedure involves the following steps:

1. Create the bootable USB with the imaging tool (CloneZilla)
2. Download the latest iCub server image
3. Connect the icub-server
4. Boot the USB disk
5. Write the image
6. Reboot icub-server
7. Customize the system

## Create the bootable USB with the imaging tool (CloneZilla)

The imaging tool used to create and restore icub-head disk images is [CloneZilla LIVE](https://clonezilla.org/clonezilla-live.php).

1. Download clonezilla from this [link](https://clonezilla.org/downloads.php)
2. Get a USB 3 USB drive (at least 4 GB of size)
3. Create the live USB following [this guide](https://clonezilla.org/liveusb.php)

## Download the latest iCub server image

Get the lastest iCubServerOS image on [this page](../download.md) and put it on a external USB drive (not the same were is CloneZilla LIVE)

## Connect the icub-server

You need:

- USB 3 hub
- USB keyboard
- The Bootlabe USB with the imaging tool (see above)
- The external USB drive with the iCubOS disk image
- A monitor with DisplayPort input

Connect the keyboard, the USB with clonezilla to the hub and the USB disk with the iCubOS disk image. Then connect the hub to a USB port in the iCub head.
Connect the monitor to the DisplayPort socket in the iCub head.

## Boot the USB disk

Power on the icub-server and enter BIOS, the select drive with CloneZilla as first in boot order, then boot from that drive.

## Write the image

Follow the steps below to write the image on the icub-head HD (detailed instruction about how to use CloneZilla can be found [here](https://clonezilla.org/clonezilla-usage/clonezilla-live-usage.php) ).
_Please note that the instructions below refers to the lastest clonezilla release available at the time of writing (2.6.6)

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

## Restart icub-server

Power down the server, then restart.

## Users and Passwords

The default user account is

**Username** : `icub`
**Password** : `icub`

If you want to change the default password simply execute (*this works only if you are using persistence*)

`passwd icub`

**NOTE**: As in any Ubuntu installation, the root user has no password, this means that the direct login (i.e. *ssh root\@icub-head*) is disabled, but you can always do

`sudo su - `

## Customize the system

What now yoo need to do is to customize the installation with your hardware and enviroment
