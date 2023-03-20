
YOCTO_VERSION=4.1
YOCTO_SETUP_SCRIPT=x86_64-buildtools-nativesdk-standalone-$(YOCTO_VERSION).sh

all: 

$(YOCTO_SETUP_SCRIPT): 
	wget http://downloads.yoctoproject.org/releases/yocto/yocto-$(YOCTO_VERSION)/buildtools/$(YOCTO_SETUP_SCRIPT)

env: $(YOCTO_SETUP_SCRIPT)
	chmod u+x $(YOCTO_SETUP_SCRIPT)
	./$(YOCTO_SETUP_SCRIPT) -d"./opt/poky/$(YOCTO_VERSION)" -y
	
.PHONY: env all

