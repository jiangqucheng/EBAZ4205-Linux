# EBAZ4205-Linux

## Environment setup
First, `make env`. The environment place at `<ProjectFolder>/opt/poky/<yocto-version>`

Additional step: 
1. `git submodule add -b <branch_name> git://git.yoctoproject.org/poky`, here the `<branch_name>` is related to the release version you downloaded. 
For example, `YOCTO_VERSION=4.1` matches with release version `langdale`.
2. `mkdir meta/ && cd meta/` , make another folder called meta, go inside to get more repos downloaded. 
3. `git clone -b langdale --depth=1 https://github.com/Xilinx/meta-xilinx.git`
4. `git clone -b langdale --depth=1 https://github.com/openembedded/meta-openembedded.git`
5. `git clone -b langdale --depth=1 https://github.com/Xilinx/meta-xilinx-tools.git`
6. `git clone -b langdale --depth=1 https://github.com/jiangqucheng/meta-ebaz4205.git`, now only support langdale


