# Building a 32 bits version of iCub LIVE

Since the first versions of the PC-10 boards are ony 32 bits, the prebuilt images for versions above 4.x cannot be used to upgrade the OS. An alternative solution is to build a slightly modified version of the image, using the scripts from [this repo](https://github.com/icub-tech-iit/icub-os-files).

Here are the steps to follow to build an iCub LIVE image based on Debian Buster (7.10):
- Get a Debian environment
- Clone the icus-os-files repository
- Build the image
- Flash the image on a USB stick

The process described here is very similar to the one used to build 64 bits images. Feel free to take a look at [the iCub LIVE presentation](./icub-live.md), [installation procedure](./the-icub-live-installation.md) and [details](./the-icub-live-details.md) to fully understand what we are doing.

# Get a Debian environment
You can use a PC with Debian installed, but using a Virtualbox VM enables you to isolate your build fron everything else running on the computer.
To set up your VM:

- [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Download a 32bits Debian ISO](https://www.debian.org/distrib/index.html), preferably the version that you want to build
- Launch VirtualBox
- Create a new Debian 32bits VM. Make sure you give enough cores / RAM for the VM to work properly (e.g. 2 cores and 4-8 GB RAM)
- Select the VM you just created; click on "Settings > Storage", and mount a new CD/DVD. WHen asked, select the file you just downloaded.
- Turn the VM on; follow the usual Debian installation steps
- You will probably need to install the VirtualBox Extension Pack to give the guest VM USB 2/3 access. The pack can be downloaded on [the same page as VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Once this is done, you have a working Debian environment. We can now build the iCub LIVE image

# Clone the icus-os-files repository
The image we want to create is based on Debian LIVE build. However, a number of iCub-specific modifications are then applied. To make the process easier, everything is scripted and the code is available [here](https://github.com/icub-tech-iit/icub-os-files). To get ready to build the image:

- Open a terminal in your Debian environment
- Install git: `sudo apt install git`
- Clone the repository: `git clone https://github.com/icub-tech-iit/icub-os-files.git`
- Go to the folder containing our scripts: `cd icub-os-files/scripts/icub-live`
- Make the scripts executable: `chmod u+x ./*.sh`
- Adapt the files for a 32 bits architecture based on the changes pointed out from within [this PR](https://github.com/icub-tech-iit/icub-os-files/pull/4). To this end, you may cherry-pick the commit.

# Build and flash the image
From there, you can follow the procedure described at the bottom of [the iCub LIVE details page](./the-icub-live-details.md). In short:

- Run `./icub_create-live.sh -s all`; this will give you a `.iso` file.
- Switch to Windows (you can use VirtualBox for that too, but you'll have to install the extension pack again), install Rufus and burn the `.iso` file on a USB stick. Don't forget to set a persistent partition, use FAT32 and a MBR partition scheme.

You can then boot the PC104 using the USB stick. Please note that:

- You should not try to boot on the stick with any other hardware than the PC104
- The default linux boot menu may get stuck if you do not press the enter key. In that case, plug the USB stick in a computer, mount the partitions, open the file `/usr/lib/live/mount/persistence/sda1/isolinux/isolinux.cfg`, and change `timeout 0` to `timeout 5` (you can change the number depending on how long you want the boot menu to wait). Unmount the partition, plug the USB stick in PC104, and it should be fixed.
- You may need to rebuild the cfw002 driver; you can just build it [from source](https://github.com/robotology/cfw002)

