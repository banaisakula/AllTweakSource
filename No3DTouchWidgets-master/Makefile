export ARCHS = armv7 arm64 arm64e
export TARGET = iphone:clang:13.0:10

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = No3DTouchWidgets
No3DTouchWidgets_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

