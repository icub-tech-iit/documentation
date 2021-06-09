# Introduction

This manual describes how to install and customize the linux operating systems required to run on machines in the iCub enviroment. You can also find here the correct procedure required to statup all machines that belongs to an iCub Setup enviroment.

# The iCub Operative Systems

## Robot OS

There are two versions of the customized OS running on the machine inside the iCub head:

- [_The iCub LIVE for PC104_](./pc104/icub-live.md) - based on Debian LIVE environment, it is for old iCub version with a PC104 board (without onboard Hard Drive) and it is distribuited usign a pre-built image.
- [_The iCub OS_](./icubos/icubos.md) - based on Ubuntu Server, it is for latest iCub versions with a COM-Express board (with onboard Hard Drive) and can be installed starting from a pre-built image or we provide instructions to install and custommize a standard Ubuntu server installation.

!!! note
    For further details, please refer to the [iCub CPU boards](../icub_cpu_boards/icub_cpu_boards.md).

## OS for other machines in the iCub enviroment

[_Here_](./other-machines/generic-machine.md) you can find instruction needed to custommize a generic machine, such as a laptop or a desktop, making all the changes required to add it to the iCub enviroment, starting from a default Ubuntu or Debian installation.

Once you customized your machine, you can proceed with further setup for special machines, such as:

- [_CUDA workstation_](./other-machines/cuda-workstation.md) - a GPU-equipped machine with CUDA software installed
- [_The iCub Server_](./other-machines/icub-server-from-scratch.md) - a machine acting only as server (for Network gateway, NTP, NFS, DHCP and DNS services)
- [_The iCub Laptop Server_](./other-machines/icub-server-laptop.md) - a single machine, usually a laptop, acting both as server (for Network Gateway, ntp and NFS serviceas) as well as robot console

# The iCub setup startup procedure

[Here](./startup-procedure.md) you can find the correct procedure required to startup the whole iCub setup (robot, server, laptop and workstations), so all machines and services can operate correctly.
