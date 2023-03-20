
YOCTO_VERSION=4.1
YOCTO_VERSION_BRANCHNAME?=langdale
YOCTO_SETUP_SCRIPT=x86_64-buildtools-nativesdk-standalone-$(YOCTO_VERSION).sh
YOCTO_SETUP_PATH=./opt/poky/$(YOCTO_VERSION)

META_PATH=meta

PROJ_MK_PATH+=$(META_PATH)

all: 

$(YOCTO_SETUP_SCRIPT): 
	wget http://downloads.yoctoproject.org/releases/yocto/yocto-$(YOCTO_VERSION)/buildtools/$(YOCTO_SETUP_SCRIPT)
	chmod u+x $(YOCTO_SETUP_SCRIPT)

$(PROJ_MK_PATH):
	mkdir -p $@

$(YOCTO_SETUP_PATH): $(YOCTO_SETUP_SCRIPT)
	chmod u+x $(YOCTO_SETUP_SCRIPT)
	./$(YOCTO_SETUP_SCRIPT) -d"$(YOCTO_SETUP_PATH)" -y

env_meta: $(META_PATH)
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/Xilinx/meta-xilinx.git ./$(META_PATH)/meta-xilinx
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/openembedded/meta-openembedded.git ./$(META_PATH)/meta-openembedded
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/Xilinx/meta-xilinx-tools.git ./$(META_PATH)/meta-xilinx-tools
	git clone -b $(YOCTO_VERSION_BRANCHNAME) --depth=1 https://github.com/jiangqucheng/meta-ebaz4205.git ./$(META_PATH)/meta-ebaz4205

env: $(YOCTO_SETUP_PATH) env_meta

.PHONY: all env env_meta 

clean: 
	-rm -rf $(YOCTO_SETUP_PATH)
	-rm -rf $(META_PATH)/meta-xilinx $(META_PATH)/meta-openembedded $(META_PATH)/meta-xilinx-tools $(META_PATH)/meta-ebaz4205

