include $(THEOS)/makefiles/common.mk
TARGET := iphone:clang:13.7:11.0
ARCHS = arm64 arm64e
TWEAK_NAME = BTPower
BTPower_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
