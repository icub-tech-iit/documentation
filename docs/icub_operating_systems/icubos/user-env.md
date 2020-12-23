# Introduction
The main user configured on  icub-head is `icub` (SID: 1000 - GID 1000). All the enviroment configurations required for this user are stored in a separate file that is loaded every time a bash session is started.

# The bashrc
The user enviroment configurationsration (for bash sessions) are stored in the file

`~/.bashrc_iCub`

## Online updated
You can find the updated default .bashrc_iCub file online.
There are two versions of the iCub enviroment file:

- `bashrc_iCub_superbuild` - a special version of icub user environment, to use in case of [ROBOOLOGY SUPERBUILD](https://github.com/robotology/robotology-superbuild)
- `bashrc_iCub` - the standard version of icub user enviroment, needed if you do not use the Robotology SUPERBUID

the above files must be renamed to `.bashrc_iCub` and saved in the user home directory, along with the `.bashrc` file.

## How to setup the enviroment properly
This file must be loaded every time a bash session is started, no matter if the session is interactive or not (this is required when we want to start our programs remotely).
Usually the .bashrc is not executed for not-interactive session, that's why the default `.bashrc` file starts with the following lines:
```
# If not running interactively, don't do anything
case $- in
   *i*) ;;
     *) return;;
esac
```
These lines forces to skip execution of bashrc in case of not-interactive session, by exiting from the file.
So, if we want that our enviroment is loaded no matter if the session is interactive or not, we must put the following lines
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
at the beginning of file `~/.bashrc_iCub` just _BEFORE_ the following lines:
```
# If not running interactively, don't do anything
case $- in
   *i*) ;;
     *) return;;
esac
```

## Required configuration
In order to customize the above user enviroment you shuld manually make some changes:

- **The build path** - the folder name where you object are created by cmake, in the following line and remove the leading "#"
```
#export OBJ_SUBDIR="build"
```
- **The YARP_ROBOT_NAME** - you must insert your robot name, in the following line and remove the leading "#"
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
