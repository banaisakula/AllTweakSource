ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:11.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = diandian

diandian_FILES = diandian.xm
diandian_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
