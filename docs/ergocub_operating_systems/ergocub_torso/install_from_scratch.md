# Install from scratch

`ergocub-torso` is based on Ubuntu server 22.04, we will install it from the default installer and then we manually customize it.

To install the OS from scratch, please follow [this guide](../../icub_operating_systems/icubos/installation-from-scratch.md), being carefull to install the [**Ubuntu 22.04 LTS Server**](https://releases.ubuntu.com/focal).

!!!note
    Remember to substitute the references to **`icub`** and  **`icub-head`** respectively with **`ergocub`** and **`ergocub-torso`**.

To synchronize the system date and time, edit the file `/etc/default/ntpdate` by changing the following lines:

```
NTPDATE_USE_NTP_CONF="no"
NTPSERVERS="10.0.2.1 ntp.ubuntu.com"
```
