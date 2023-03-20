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


# Credit
This work is based on a marvelous but out-dated instruction [ebaz4205-recycle-cheap-crypto-miner](https://embed-me.com/ebaz4205-recycle-cheap-crypto-miner-part-3/). 

