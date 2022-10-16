ARCHS = arm64 arm64e
TARGET = iphone:clang:13.7:10.0
INSTALL_TARGET_PROCESSES = Weather Preferences

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = weatherplus

weatherplus_FILES = $(wildcard *.xm *.m)
weatherplus_EXTRA_FRAMEWORKS = libhdev
weatherplus_FRAMEWORKS = UIKit
weatherplus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += pref

include $(THEOS_MAKE_PATH)/aggregate.mk
