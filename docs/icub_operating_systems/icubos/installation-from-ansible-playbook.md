## Create the USB installer

The first step is to download the **official Ubuntu 22.04 LTS Server install media** from the [release page](https://releases.ubuntu.com/jammy). Search for `ubuntu-22.04.x-live-server-amd64.iso`.

Then, please create the USB installer using a USB memory and a tool like [Balena Etcher](https://www.balena.io/etcher/).

Find further information about creating a bootable USB stick on [Windows](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview), [Ubuntu](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview) or [macOS](https://support.apple.com/en-us/101578).

## Install Ubuntu

Follow the below steps to install the Ubuntu server on icub-head.

Please, note that the installation procedure can be slightly different in each release, you can see the [Ubuntu server official install guide](https://ubuntu.com/tutorials/tutorial-install-ubuntu-server)

!!! warning

    The installation procedure will overwrite the disk of your icub-head, so all data will be deleted.

## Launch the playbook

Once the basic OS has been installed it is time to download and launch our playbook:

The Playbook covers the steps decribed in [iCubOS installation from scratch](https://icub-tech-iit.github.io/documentation/icub_operating_systems/icubos/installation-from-scratch/), [iCub user enviroment](https://icub-tech-iit.github.io/documentation/icub_operating_systems/icubos/user-env/) and [further tasks](https://icub-tech-iit.github.io/documentation/icub_operating_systems/icubos/further-tasks/).

How to run:

- clone the repository 
- Check the README file for further instructions
- launch as `sudo` the `start.sh` file
```
git clone https://github.com/icub-tech-iit/iCubOS-playbook.git

cd iCubOS-playbook/

sudo ./start.sh

```
A reboot is recommended in order to load the Lowlatency kernel instead of the Generic.

Once the installation is completed  follow the [Networking](https://icub-tech-iit.github.io/documentation/icub_operating_systems/icubos/networking/#external-network-configurations) chapter of the guide to configure the network using netplan or your favourite network manager system.