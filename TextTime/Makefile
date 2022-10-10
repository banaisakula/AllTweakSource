export DEBUG = 0
export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:12.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TextTime

TextTime_FILES = Tweak.xm
TextTime_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += TextTimePrefs

include $(THEOS_MAKE_PATH)/aggregate.mk
