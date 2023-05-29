# Install iCub software from pre-compiled binaries via conda package manager

We provide binary packages for Linux, macOS and Windows of the software contained in the robotology-superbuild via the [conda package manager](https://docs.conda.io), relying on the community-mantained [`conda-forge`](https://conda-forge.org/) channel and for some packages on on our own `robotology` conda channel.

## Install a conda distribution

If you do not have a conda distribution on your system, we suggest to use the minimal
[`mambaforge`](https://github.com/conda-forge/miniforge#mambaforge) distribution, that uses `conda-forge` packages by default and installs the [`mamba`](https://github.com/mamba-org/mamba) command by default.

To install `mambaforge`, please follow the instructions [`install-mambaforge`](https://github.com/robotology/robotology-superbuild/blob/master/doc/install-mambaforge.md) in robotology-superbuild documentation.

Even if you are not using `mambaforge` and you are using instead a different `conda` distribution, to follow the instructions on this document you need to install the `mamba` package in your `base` environment. [`mamba`](https://github.com/mamba-org/mamba) is a re-implementation of some functionalities of the `conda` package manager, that is much faster.


## Create an environment
Differently from `apt` and `homebrew`, the `conda` package manager is an `environment`-oriented package manager, meaning that packages are not
installed in some global location, but rather you install packages in an `environment` (that is just a directory in your filesystem), so that you
can easily have multiple different environments with different packages installed on your system. To read more about this, check https://docs.conda.io/projects/conda/en/4.6.1/user-guide/tasks/manage-environments.html .

For this reason, to use the robotology conda packages it is suggested to first create a conda environment, and then install in it all the packages you want to use. To create a new environment called `robotologyenv`, execute the following command:
~~~
mamba create -n robotologyenv
~~~

Once you created the `robotologyenv` environment, you can "activate" it for the current terminal (i.e. make sure that the installed packages can be found) by the command:
~~~
mamba activate robotologyenv
~~~

!!! note
    **IMPORTANT: if you open a new terminal, you need to manually activate the environment also there.**

!!! note
    **IMPORTANT: To avoid strange conflicts in environment variables, it is a good idea to remove from  the environment any variable that refers to libraries or software not installed with conda. For example, if you have a robotology-superbuild installed with apt dependencies, it is a good idea to remove the source of the `setup.sh` from the `.bashrc` before using conda environments, or in Windows it can make sense to check with [Rapid Environment Editor](https://www.rapidee.com) that the environment is clean.**

!!! note
    **IMPORTANT: On Windows, it is recommended to use Command Prompt to manage conda environments, as some packages (see https://github.com/conda-forge/gazebo-feedstock/issues/42 and https://github.com/RoboStack/ros-noetic/issues/21) have problems in activating environments on Powershell.**

## Install robotology packages

Once you are in an activated environment, you can install robotology packages by just running the command:
~~~
mamba install -c conda-forge -c robotology <packagename>
~~~

The list of available packages is available at https://anaconda.org/robotology/repo .

For example, if you want to install yarp and icub-main, you simple need to install:
~~~
mamba install -c conda-forge -c robotology yarp icub-main
~~~

In addition, if you want to simulate the iCub in Gazebo, you should also install `icub-models` and `gazebo-yarp-plugins`:
~~~
mamba install -c conda-forge -c robotology gazebo-yarp-plugins icub-models
~~~

If you want to develop some C++ code on the top of these libraries, it is recommended to also install the necessary compiler and development tools directly in the same environment:
~~~
mamba install -c conda-forge compilers cmake pkg-config make ninja
~~~

If you want instead install all the robotology distro just:

~~~
mamba install -c robotology robotology-distro
~~~
