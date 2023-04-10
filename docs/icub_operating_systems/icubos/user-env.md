# iCub user environment

The main user configured on all iCub Setup machines is usually `icub` (SID: 1000 - GID 1000).

All the environment configurations required for this user are stored in a separate file that is loaded every time a bash session is started.

## Note
If you installed your system starting from an image (eg. the [iCubOS - Installation from image](installation-from-image.md) chapter), the steps below have already been added into the image.

# Users and Passwords

The default user account is

**Username** : `icub`
**Password** : `icub`

If you want to change the default password simply execute (*this works only if you are using persistence*)

`passwd icub`

**NOTE**: As in any Ubuntu installation, the root user has no password, this means that the direct login (i.e. *ssh root\@icub-head*) is disabled, but you can always do

`sudo su - `


# The bashrc

The user enviroment configurations (for bash sessions) are stored in the file

`~/.bashrc_iCub`

## Online updated version

You can find the updated default .bashrc_iCub file online.
There are two versions of the iCub environment file:

- [`bashrc_iCub_superbuild`](https://raw.githubusercontent.com/icub-tech-iit/icub-os-files/master/user-environment/bashrc_iCub_superbuild) - a special version of icub user environment, in case of compilation of the repository [ROBOTOLOGY SUPERBUILD](https://github.com/robotology/robotology-superbuild)
- [`bashrc_iCub`](https://raw.githubusercontent.com/icub-tech-iit/icub-os-files/master/user-environment/bashrc_iCub) - the standard version of icub user environment, if you DO NOT intend to use the repository ROBOTOLOGY-SUPERBUILD

the above files must be renamed to `.bashrc_iCub` and saved in the user home directory, along with the `.bashrc` file.

## How to setup the enviroment properly

To use the `~/.bashrc_iCub` file to setup the environment, the following lines:
```
#Load the iCub custom bashrc
if [ "$HOME" != "" ]; then
  ICUBRC_FILE="${HOME}/.bashrc_iCub"
else
  ICUBRC_FILE="/home/icub/.bashrc_iCub"
fi
if [ -f "$ICUBRC_FILE" ]; then
  source $ICUBRC_FILE
fi
```
should be added at the beginning of file `~/.bashrc` just _BEFORE_ the following lines:
```
# If not running interactively, don't do anything
case $- in
   *i*) ;;
     *) return;;
esac
```

The reason why the `.bashrc_iCub` needs to be added at the beginning of `~/.bashrc` is that file must be loaded every time a bash session is started, no matter if the session is interactive or not (this is required when we want to start our programs remotely), and the line of code after `# If not running interactively, don't do anything` make the `~/.bashrc` file exit if executed in a non-interactive shell.

## Required configuration

To customize the above user environment, you ought to manually make some changes:

- The **YARP_ROBOT_NAME** - you must insert your robot name, in the following line and remove the leading "#"
```
#export YARP_ROBOT_NAME=
```

# Groups

Add the user icub to the following groups

- video
- audio
- tty
- dialout
- i2c
- bluetooth

use the next command to perform that action
```
usermod -aG audio,video,tty,dialout,i2c,bluetooth icub
```

