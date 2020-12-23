# Introduction

The iCubOS operating system is a customized version of [Ubuntu GNU/Linux](https://ubuntu.com/server) in the [Server flavour](https://ubuntu.com/server).

## Latest version

The latest version is 18.04_20200114 based on [Ubuntu 18.04 LTS (Bionic Beaver)](https://releases.ubuntu.com/bionic).

## Users and Passwords

The default user account is

**Username** : `icub`
**Password** : `icub`

If you want to change the default password simply execute (*this works only if you are using persistence*)

`passwd icub`

**NOTE**: As in any Ubuntu installation, the root user has no password, this means that the direct login (i.e. *ssh root\@icub-head*) is disabled, but you can always do

`sudo su - `
