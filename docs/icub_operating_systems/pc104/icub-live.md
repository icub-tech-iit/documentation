# Introduction
The pc104 located inside the iCub head runs a full Debian distribution.
This version of Linux has been customized for the specific application and to boot from an USB key. As the iCub (project) grows up, many updates have been performed to this Linux usb-key image to follow the hardware as well as the Debian distribution changes. Stable versions are frozen into image files and uploaded to the iCub webserver.

At any time to determine the version of the image is running on your iCub, the following files in the root of the filesystem can be inspected:

- `VERSION_PC104`: contains the version of the image
- `ChangeLog_PC104`: list changes to the image

## Latest version
The latest version is 7.10 based on [Debian 10 (Buster)](https://www.debian.org/releases/buster/).

# Versioning

- 1.x This is an Etch'n'half based distribution, built on a Debian LIVE system.
- 2.x This is a Debian Lenny based distribution, built on a Debian LIVE system.
- 3.x This is a Debian Squeeze based distribution, contains a kernel with [Real-Time patch](https://rt.wiki.kernel.org/index.php/Main_Page)).
- 4.x This is a Debian Wheezy based distribution, this version contains an updated version of libportaudio.
- 5.x This is a Debian Wheezy based distribution, built on a Debian LIVE system with overlay persistence, compiled for kernel rt-amd64 (x86 64 bit with real time PREEMPT_RT patches)
- 6.x This is a Debian Jessie based distribution, built on a Debian LIVE system with overlay persistence, compiled for kernel rt-amd64 (x86 64 bit with real time PREEMPT_RT patches)
- 7.9.x This is a Debian Stretch (v9) based distribution, built on a Debian LIVE system with overlay persistence, compiled for kernel rt-amd64 (x86 64 bit with real time PREEMPT_RT patches)
- 7.10.x This is a Debian Buster (v10) based distribution, built on a Debian LIVE system with overlay persistence, compiled for kernel rt-amd64 (x86 64 bit with real time PREEMPT_RT patches)

Starting from version 5.0, the image file name is composed by four parts: a a *major release*, a *minor release*, a *build release* that is a string containing the build date and a *kernel flavor* string, which describes the kernel architecture the image is built for.

For example, `icub-live_5.0-14.11.12-rt-amd64.iso` is:

- **`5`** is the major release
- **`0`** is the minor release
- **`14.11.12`** is the build release (Year.Month.Day)
- **`rt-amd64`** is the kernel flavour

# Users and Passwords
Starting from version 5.0, the default user account is

**Username** : `icub`
**Password** : `live`

If you want to change the default password simply execute (*this works only if you are using persistence*)

` passwd icub`

**NOTE**: the root user has no password, this means that the direct login (i.e. *ssh root\@10.0.0.2*) is disabled, but you can always do

`sudo su - `

once connected as icub, to switch to the root user.
