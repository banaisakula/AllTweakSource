export ARCHS = arm64 arm64e
export DEBUG = 0
export FINALPACKAGE = 0

export PREFIX = $(THEOS)/toolchain/XcodeDefault.xctoolchain/usr/bin/

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Truecuts

Truecuts_FILES = Tweak.xm
Truecuts_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
