# Introduction

The iCubOS operating system is a customized version of [Ubuntu GNU/Linux](https://ubuntu.com/server) in the [Server flavour](https://ubuntu.com/server).

## Latest version

The latest version is 8.0.20.04_20210203 based on [Ubuntu 20.04.1 LTS (Focal Fossa)](https://releases.ubuntu.com/focal).

## Users and Passwords

The default user account is

**Username** : `icub`
**Password** : `icub`

If you want to change the default password simply execute (*this works only if you are using persistence*)

`passwd icub`

**NOTE**: As in any Ubuntu installation, the root user has no password, this means that the direct login (i.e. *ssh root\@icub-head*) is disabled, but you can always do

`sudo su - `
