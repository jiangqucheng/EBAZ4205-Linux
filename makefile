
YOCTO_VERSION=4.1
YOCTO_VERSION_BRANCHNAME=langdale
YOCTO_SETUP_SCRIPT=x86_64-buildtools-nativesdk-standalone-$(YOCTO_VERSION).sh

META_PATH=meta

all: 

$(YOCTO_SETUP_SCRIPT): 
	wget http://downloads.yoctoproject.org/releases/yocto/yocto-$(YOCTO_VERSION)/buildtools/$(YOCTO_SETUP_SCRIPT)

env: $(YOCTO_SETUP_SCRIPT)
	chmod u+x $(YOCTO_SETUP_SCRIPT)
	./$(YOCTO_SETUP_SCRIPT) -d"./opt/poky/$(YOCTO_VERSION)" -y
	mkdir ./$(META_PATH)
	cd ./$(META_PATH)
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/Xilinx/meta-xilinx.git
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/openembedded/meta-openembedded.git
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/Xilinx/meta-xilinx-tools.git
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/jiangqucheng/meta-ebaz4205.git


.PHONY: env all

