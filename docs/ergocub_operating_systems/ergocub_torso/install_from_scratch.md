# Install from scratch

`ergocub-torso` OS is based on Ubuntu server 22.04, we will install it from the default installer and the we manually customize it.

# Create the USB installer

The first step is to download the official Ubuntu 22.04 LTS Server install media from the [release page](https://releases.ubuntu.com/jammy/).

Then please create the USB installer using an USB memory and a tool like [Balena Etcher](https://etcher.balena.io/) or [Rufus](https://rufus.ie/it/). On Ubuntu website, you can find further informations about creating a bootable USB stick on Windows, Ubuntu or macOS.

# Install Ubuntu

Install the system by choosing the default options, except the follow steps:

### Storage configuration

- _**Disable** the following option_ : `Setup this disk as an LVM group`

### Identity

- **Your name** : `ergocub`
- **Your Server's name** : `ergocub-torso`
- **Pick a username** : `ergocub`
- **Choose a password** : `ergocub`

### SSH

- _**Enable** the following option_ : `Install SSH server`


# Post installation procedures

Install the following packages:
```
sudo apt install nfs-common python-tk libopencv-dev ntpdate vim ssh cmake-curses-gui iperf libportaudio2 portaudio19-dev linux-sound-base alsa-base alsa-utils gdb meld bmon libi2c-dev expect libgfortran10-dev qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings
```

## Network performances tweaks

1. Install the following packages
```
sudo apt install linux-image-lowlatency linux-headers-lowlatency
```
2. Modify the real time priority of process, add the file  `/etc/security/limits.d/ergocub.conf ` as follows
  ```
  ergocub    soft    rtprio    99
  ergocub    hard    rtprio    99
  ```
3. Set the max OS receive buffer size for all types of connections, by adding the file `/etc/sysctl.d/20-net-rbuffer.conf` as follows
  ```
  # This sets the max OS receive buffer size for all types of connections
  net.core.rmem_max=8388608
  ```

## NTP

Edit the file `/etc/default/ntpdate` by changing the following lines
```
NTPDATE_USE_NTP_CONF="no"
...
NTPSERVERS="10.0.2.1 ntp.ubuntu.com"
```

