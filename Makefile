LIB_PATH := /usr/lib/aml_libs

all:
	mkdir -p $(LIB_PATH)
	mkdir -p /usr/lib/libplayer
	-$(MAKE) -C amadec all
	-${MAKE} -C audio_codec all
	-$(MAKE) -C amavutils all
	-$(MAKE) -C amcodec all
	-$(MAKE) -C example all

install:
	-$(MAKE) -C amadec install
	-$(MAKE) -C amavutils install
	-$(MAKE) -C amcodec install
	-$(MAKE) -C example install
	-${MAKE} -C audio_codec install
	install -D -m 0644 amadec/firmware/*.bin /lib/firmware
	-cp aml.conf /etc/ld.so.conf.d
