TARGET := iphone:clang:latest:7.1
INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e armv7 armv7s

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TimeJump

TimeJump_FILES = Tweak.x
TimeJump_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += timejumpprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
