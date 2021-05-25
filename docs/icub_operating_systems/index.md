# Introduction

This manual describes how to install and customize the linux operating systems required to run on machines in the iCub enviroment.

## Robot OS

There are two versions of the customized OS that runs on the machine inside iCub head:

- [_The iCub LIVE for PC104_](./pc104/icub-live.md) - based on Debian LIVE environment, it is for old iCub version with a PC104 board (without onboard Hard Drive) and it is distribuited usign a pre-built image.
- [_The iCub OS_](./icubos/icubos.md) - based on Ubuntu Server, it is for latest iCub versions with a COM-Express board (with onboard Hard Drive) and can be installed starting from a pre-built image or we provide instructions to install and custommize a standard Ubuntu server installation.

## Other machines

[_Here_](./other-machines/generic-machine.md) you can find instruction needed to custommize a generic machine, such as a laptop or a desktop, making all the changes required to add it to the iCub enviroment, starting from a default Ubuntu or Debian installation.

Once you customized your machine, you can proceed with further setup for special machines, such as:

- [_CUDA workstation_](./other-machines/cuda-workstation.md) - a GPU-equipped machine with CUDA software installed
- [_The iCub Server_](./other-machines/icub-server-from-scratch.md) - a machine acting only as server (for Network gateway, NTP, NFS, DHCP and DNS services)
- [_The iCub Laptop Server_](./other-machines/icub-server-laptop.md) - a single machine, usually a laptop, acting both as server (for Network Gateway, ntp and NFS serviceas) as well as robot console

## iCub CPUs

| Internal name    |   | Vendor Model            | Vendor         | Description                                                                                              | Board Form factor   | iCub version              | CPU                       | RAM       | HardDisk            | OTHER / BIOS                                                              |
|------------------|---|-------------------------|----------------|----------------------------------------------------------------------------------------------------------|---------------------|---------------------------|---------------------------|-----------|---------------------|---------------------------------------------------------------------------|
| PC104 PB-855+    |   | PB-855+ 1400PM          | Embedded Logic | PC104plus Motherboard PB855+, with Intel M processor 1,8 GHz                                             | PC104 Plus Standard | iCub 1.0                  | Intel M processor 1,8 GHz |           | n.a. (*) USB pen           |                                                                           |
| PC104 PB945+     |   | PB945+ T7400            | Embedded Logic | PC104 Motherboard PB945+, with Intel Core 2Duo 2,16 Ghz                                                  | PC104 Plus Standard | iCub 1.0 and iCub 2.0     | Intel Core 2Duo 2,16 Ghz  |           | n.a. (*) USB pen           |                                                                           |
| ATOM             |   | PB-ATOM-L_D525          | Embedded Logic | PC104 Motherboard PB-ATOM-L+, with Intel ATOM D525                                                       | PC104 Plus Standard | iCub 1.0 and iCub 2.0     | Intel ATOM D525           |           | n.a. (*) USB pen           |                                                                           |
| CM2-BT2-E3825    |   | ATOM E3825              | Advantech      | DUAL CORE ATOM E3825 To be tested                                                                        | PC104 Plus Standard | iCub 1.0 and iCub 2.0     | Intel ATOM E3825          | 4GB       | mSATA drive                |  [Manual](https://www.mouser.it/datasheet/2/452/CM1-BT1_Datasheet_en_1-347744.pdf) Disable UEFI boot from BIOS to boot from iCub LIVE USB |
| COMEXPRESS CONGATEC  |   | conga-TC87/i7-4650U     | Congatec       | COM-Express Type6, Congatec TC87/i7-4650U (Core i7-4650U 1.7GHz) p/n 46901                               | COM-Express Type6   | iCub 2.5, iCub 3.0    | Core i7-4650U             | 8GB       | external SATA 32GB  |                                                                           |
| COMEXPRESS KONTRON   |   | COMe-cKL6i7-7600 8GB32S | Kontron        | COM-Express Type6, Kontron COMe-cKL6i7-7600 8GB RAM onboard and 32GB SLC eMMC 5.0 (Core i7-7600U 1.7GHz) | COM-Express Type6   | iCub 2.5-2.6 and 2.7  | Core i7-7600U             | 8+8GB RAM | onboard 32GB        |                                                                           |
|                  |   |                         |                |                                                                                                          |                     |                           |                           |           |                     |                                                                           |





<center> <img src ="../img/atom.png" width=300>       
</center>

ATOM board 

<center> <img src ="../img/congatec.png" width=300>       
</center>

CONGATEC

<center> <img src ="../img/kontron.png" width=300>       
</center>

KONTRON