# The OS on PC104 (live USB) - Installation

Here you can find the instruction on how to create a new USB memory stick with the lastest version of the OS running on the PC104.

## System Description
The image contains a LIVE Debian GNU/Linux OS with iCub customizations, drivers and a RT kernel.

The system supports _persistence_, this means that (unlike normal LIVE system) any modification on file system is permanent.

## Which version do I need?
This question is quite common whenever the number of versions and revisions start to become... more than one.

The Debian image to use depends on the iCub version:

- iCub up to version 1.1 ***must*** use a Etch and a Half distribution (image version 1.x). Persistent filesystem allows deep system configuration; if you are happy with the current configuration you can skip this update, while if you really need to change system configuration now you can by applying this update.
- iCub from version 1.2 on use the latest version: we kindly recommend you to keep Debian system updated to the last version (at the time of writing it means the 10.x @ May 2021). For persistent filesystem this configuration can be changed without re-burning a new image, you can just edit the configuration files of the network as you would normally do with Linux system.

!!! note
  For further details, please refer to the [iCub Versions](../../icub_versions/index.md).

## Warning
### Before you create the bootable USB
When you install (or "_burn_") the new PC104 image, _the installation procedure will overwrite the data already present on the USB disk your are using_, so all data will be deleted.

### Just after you create the bootable USB
This image has persistence activate, this means that the written or modified files are written on the USB, in a separate partition. Since the first time it boots on a system, some hardware-related files are written in order to speedup the process, this means that, if you insert a just created USB memory on a different system from iCub's PC104 when you'll plug it on iCub the system could not work (due to potential differences in hardware). So _please do not connect an USB with a just burned image on any system other system_

# Burn the Debian image version 7.x (latest)
Starting from version 6.0 images come in a compressed archive file containing the USB image to write to an USB memory.

## Download the latest iCubLive image

Get the lastest iCubLive image on [this page](../download.md)

## How to create the bootable USB drive with the live image

1.  Download the latest image from the [above link](../download.md)
2.  Extract the image
3.  Take an USB-2 drive at least of 16 GB size (please note that using an USB3 disk or a huge disk, eg. 32 GB, may not work depending on the version of your PC104)
4. burn the image file (it has the .img extension), you can use the follwing tools:

### Windows
Please use [Win32 Disk Imager](http://sourceforge.net/projects/win32diskimager/)

### Linux (command line)
Linux users can  use the dd command to directly write an IMG file’s contents to a removable media device. Insert the removable media and run the following command on Ubuntu:

`sudo dd if=/home/user/icub-live_7.10-201126_rt-amd64.img of=/dev/sdX bs=1M`

Replace `/home/user/icub-live_7.10-201126_rt-amd64.img` with the correct name of USB image and `/dev/sdX` with the path to your USB or SD card device.

!!! note
  **Be very careful to specify the correct disk path here — if you specify the path to your system drive instead, you’ll write the contents of the image to your operating system drive and corrupt it**

### Linux (GUI tool)
There is a GUI available in Ubuntu, called _"Disks"_ (gnome-disks) and comes default in later Ubuntu: connect the USB drive and just right-click on the image file and select _"Open with Disk Image Writer"_, then select the drive USB drive you just inserted.


See also [this guide](https://www.howtogeek.com/191054/how-to-create-bootable-usb-drives-and-sd-cards-for-every-operating-system/#:~:text=From%20an%20IMG%20File&text=Use%20Win32%20Disk%20Imager%20to,USB%20drives%20and%20SD%20cards)

# Required customizations

## Set RobotName variable

Edit the file:

`/home/icub/.bashrc_iCub`

replace the line:

`export YARP_ROBOT_NAME=myiCubRobotName00`

with the name of your robot e.g. iCubGenova01

## clean the CMakeCache before compiling

When upgrading the usb key to a different version, remember to clean the CMakeCache before compiling!! This is because some path are likely to be changed in the meanwhile

## SSH passwordless login

User authentication credentials are stored inside the `/home/icub/.ssh/authorized_key` file; each line in this file is related to a different entry user\@host. User credentials can be added also by using this command for each user\@machine you want to log from :

`ssh-copy-id -i /home/user/.ssh/id_rsa.pub icub@pc104`

## Startup scripts

**Important**: these instructions apply to the recent *persistent* images of the Linux (starting from 1.7 and 3.0).

There are some scripts that customize the Linux when the pc104 boots up; those scripts are inside /etc/rciCub.d folder. Normally, you don\'t need to modify them, but be aware of them.

## Other Customizations

The persistent version of the Debian distribution is now writable so any
customization can be done. Please be aware of what you do, because any
changes in configuration file can lead to malfunction.

# Common Problems and how to solve them

## I used an USB3 and/or 32 GB disk and the system does not boot

Try with a USB2 smaller ( 16GB or better 8 GB) drive. Some PC104 have problems in reading those recent USB drives.

## The `icub_iso2usb.sh` script asks me _"The closest location we can manage is.. Is this still acceptable to you?"_

Simply press "Y" and forget about the warning _"Information: You may need to update /etc/fstab."_ :)

## Once I created a new USB memory with the PC104 image, ssh complains that _"Remote host identification has changed"_ and does not connect to the PC104

This is normal: for security reasons when a new iCub live is executed for the first time, a new SSH Key is created for the PC104 host. Please remove all the entries in the file

`~/.ssh/known_hosts`

that refers to pc104 or 10.0.0.2 and login again.

This must be done from each machine you want to connect to the PC104.

*Check also [this resource](https://askubuntu.com/a/9804).*

## I used the live USB first on a computer, then when I plugged it into the PC104 it does not work anymore
Probably the PC104 booted correctly, but the network is not reachable (you can check it by connecting a VGA cable to the PC104 inside iCub's head).

Live systems write some info about the network card the first time they boot on a machine. This implies that if you boot the live on a desktop and then you plug it to a different machine the network may not work (since the network card is different).

To fix this you have two options:

1. **quick and dirty** - on the live USB, open the file `/etc/udev/rules.d/70-presisten-net.rules` and remove any pair of lines like the following:
```
# PCI device 0x8086:0x10f5 (e1000e)
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:1f:16:0b:47:4d", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
```
(of course attributes like *address*, *name* or *device* may not exactly the same in your file)

2. **clean and easy** - burn another USB and FIRST install it on the PC104

# Detailed information

If you want to get detailed information about the iCub LIVE image (i.e. the differences from a standard Debian LIVE) please read [this page](the-icub-live-details.md)
