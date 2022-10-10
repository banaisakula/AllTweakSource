THEOS_DEVICE_IP = 192.168.99.102
THEOS_DEVICE_PORT = 22
ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang:13.5:10.0

DEBUG = 0
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BypassAlipay
$(TWEAK_NAME)_FILES = Tweak.xm fishhook.c
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 AlipayWallet"
