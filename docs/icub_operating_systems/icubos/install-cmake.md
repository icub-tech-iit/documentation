# Install the latest CMake version (MANDATORY only for Ubuntu 18.04)
The latest Robotology superbuild version requires CMake >= 3.12, but Ubuntu 18.04 only provides CMake 3.10, so it needs to be upgraded.

To download the latest version, first remove CMake with:

```bash
sudo apt purge --auto-remove cmake
```

Get a copy of the signing key:

```bash
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
```

Add the repository:

```bash
sudo apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
```

Update the repo index and install CMake:

```bash
sudo apt update
sudo apt install cmake
```
