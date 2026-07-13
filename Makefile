KVER ?= $(shell uname -r)
KSRC ?= /lib/modules/$(KVER)/build

all:
	$(MAKE) -C src KVER=$(KVER) KSRC=$(KSRC)
	mkdir -p build
	cp src/r8712u.ko build/

clean:
	$(MAKE) -C src clean KVER=$(KVER) KSRC=$(KSRC)
	rm -rf build/

install:
	mkdir -p /lib/modules/$(KVER)/kernel/drivers/net/wireless/
	cp -p build/r8712u.ko /lib/modules/$(KVER)/kernel/drivers/net/wireless/
	depmod -a $(KVER)
