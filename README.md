# EBAZ4205-Linux

## Environment setup

### Step 0 - Clone all stuff
```bash
git clone https://github.com/jiangqucheng/EBAZ4205-Linux.git
cd EBAZ4205-Linux
git submodule update --init
```
### Step 1 - Start docker env 
```powershell
cd env
.\build_container.cmd  # windows
.\start_terminal.cmd
apt update
apt install cpio diffstat gawk  # required by bitbake
```

```powershell
# make case sensitive for windows wsl environment
fsutil.exe file queryCaseSensitiveInfo <path>  # to check if <path> folder in windows is case sensitive. 
fsutil.exe file setCaseSensitiveInfo <path> [enable|disable]
# example:
fsutil.exe file setCaseSensitiveInfo build enable
```


```shell
# for env that report /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
sudo apt install locales
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
```


### Step 2 - General setup use make
First, `make env`. The environment place at `<ProjectFolder>/opt/poky/<yocto-version>`

Check the link to find out [yocto-version - release-name relationship](https://wiki.yoctoproject.org/wiki/Releases).

### Step 3 - Additional check info
The following lines have integrated into `make env`, check if you want. 
1. `git submodule add -b <branch_name> git://git.yoctoproject.org/poky`, here the `<branch_name>` is related to the release version you downloaded. 
For example, `YOCTO_VERSION=4.1` matches with release version `langdale`.
2. `mkdir meta/ && cd meta/` , make another folder called meta, go inside to get more repos downloaded. 
3. `git clone -b langdale --depth=1 https://github.com/Xilinx/meta-xilinx.git`
4. `git clone -b langdale --depth=1 https://github.com/openembedded/meta-openembedded.git`
5. `git clone -b langdale --depth=1 https://github.com/Xilinx/meta-xilinx-tools.git`
6. `git clone -b langdale --depth=1 https://github.com/jiangqucheng/meta-ebaz4205.git`, now only support langdale


## Build Sequence
Use the template configuration file provided by [Lukas Lichtl](https://embed-me.com/about/) for easy setup.
To ensure it’s usage, copy it to the poky root.
```
cp poky/meta-ebaz4205/conf/.templateconf poky/
```

Source command defined by yocto. 
``` bash
source ./opt/poky/<yocto-version>/environment-setup-x86_64-pokysdk-linux
# source ./opt/poky/3.0.4/environment-setup-x86_64-pokysdk-linux
source poky/oe-init-build-env
```

Build
```bash
bitbake ebaz4205-image-standard-wic
bitbake ebaz4205-image-standard-wic --continue  # if stopped accidently
```

Some recipy may cause resource exausting, need to be rebuild paciently, change `make -j <number>` to 1.


# Credit
This work is based on a marvelous but out-dated instruction [ebaz4205-recycle-cheap-crypto-miner](https://embed-me.com/ebaz4205-recycle-cheap-crypto-miner-part-3/). 

