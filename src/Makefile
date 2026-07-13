# SPDX-License-Identifier: GPL-2.0
obj-m := r8712u.o
r8712u-y :=				\
		rtl871x_cmd.o		\
		rtl8712_cmd.o		\
		rtl871x_security.o	\
		rtl871x_eeprom.o	\
		rtl8712_efuse.o		\
		hal_init.o		\
		usb_halinit.o		\
		usb_ops.o		\
		usb_ops_linux.o		\
		rtl871x_io.o		\
		rtl8712_io.o		\
		rtl871x_ioctl_linux.o	\
		rtl871x_ioctl_rtl.o	\
		rtl871x_ioctl_set.o	\
		rtl8712_led.o		\
		rtl871x_mlme.o		\
		ieee80211.o		\
		rtl871x_mp_ioctl.o	\
		rtl871x_mp.o		\
		mlme_linux.o		\
		recv_linux.o		\
		xmit_linux.o		\
		usb_intf.o		\
		os_intfs.o		\
		rtl871x_pwrctrl.o	\
		rtl8712_recv.o		\
		rtl871x_recv.o		\
		rtl871x_sta_mgt.o	\
		rtl871x_xmit.o		\
		rtl8712_xmit.o

ccflags-y += -I$(src)
ccflags-y += -fno-stack-protector

KVER ?= $(shell uname -r)
KSRC ?= /lib/modules/$(KVER)/build

all:
	$(MAKE) -C $(KSRC) M=$(shell pwd) modules

clean:
	$(MAKE) -C $(KSRC) M=$(shell pwd) clean

install:
	install -p -m 644 r8712u.ko /lib/modules/$(KVER)/kernel/drivers/net/wireless/
	depmod -a $(KVER)
