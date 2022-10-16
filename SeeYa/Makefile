TARGET = iphone:clang:13.5
ARCHS = arm64 arm64e

FINALPACKAGE = 1

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SeeYa

SeeYa_FILES = Tweak.xm FolderFinder.m
SeeYa_FRAMEWORKS = UIKit
SeeYa_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += SeeYaPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
