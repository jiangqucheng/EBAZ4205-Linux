
YOCTO_VERSION?=4.1
YOCTO_VERSION_BRANCHNAME?=langdale
YOCTO_SETUP_SCRIPT=x86_64-buildtools-nativesdk-standalone-$(YOCTO_VERSION).sh
YOCTO_SETUP_PATH?=./opt/poky/$(YOCTO_VERSION)

META_PATH=meta

PROJ_MK_PATH+=$(META_PATH)

all: 

$(YOCTO_SETUP_SCRIPT): 
	wget http://downloads.yoctoproject.org/releases/yocto/yocto-$(YOCTO_VERSION)/buildtools/$(YOCTO_SETUP_SCRIPT)
	chmod u+x $(YOCTO_SETUP_SCRIPT)

$(PROJ_MK_PATH):
	mkdir -p $@

env_yocto_toolchain: $(YOCTO_SETUP_SCRIPT)
	chmod u+x $(YOCTO_SETUP_SCRIPT)
	./$(YOCTO_SETUP_SCRIPT) -d"$(YOCTO_SETUP_PATH)" -y

env_meta: $(META_PATH)
	cd ./$(META_PATH)
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/Xilinx/meta-xilinx.git
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/openembedded/meta-openembedded.git
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/Xilinx/meta-xilinx-tools.git
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/jiangqucheng/meta-ebaz4205.git

env: env_yocto_toolchain env_meta

.PHONY: all env env_yocto_toolchain env_meta 

