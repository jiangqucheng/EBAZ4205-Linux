
YOCTO_VERSION=3.0.4
YOCTO_VERSION_BRANCHNAME?=zeus
YOCTO_SETUP_SCRIPT=x86_64-buildtools-nativesdk-standalone-$(YOCTO_VERSION).sh
YOCTO_SETUP_PATH=./opt/poky/$(YOCTO_VERSION)

META_PATH=meta
META_LIST=$(patsubst $(META_PATH)/%,%,$(wildcard $(META_PATH)/meta-*))

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

poky/meta-%: $(META_PATH)/meta-%
	ln -s ../$< $@

env: $(YOCTO_SETUP_PATH) $(patsubst %,poky/%,$(META_LIST))
	git submodule update --init  # update the metas


.PHONY: all env 

clean: 
	-rm -rf $(YOCTO_SETUP_PATH)
	-rm $(patsubst %,poky/%,$(META_LIST))

