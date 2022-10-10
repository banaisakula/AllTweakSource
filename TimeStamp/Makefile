ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

PREFIX=$(THEOS)/toolchain/XcodeDefault.xctoolchain/usr/bin/

SYSROOT=$(THEOS)/sdks/iphoneos13.7.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Timestamp

Timestamp_FILES = Tweak.xm
Timestamp_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
