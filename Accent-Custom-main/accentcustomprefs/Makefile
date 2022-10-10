ARCHS = arm64 arm64e
TARGET = iphone:clang::13.0
INSTALL_TARGET_PROCESSES = SpringBoard

GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AccentCustomPrefs
AccentCustomPrefs_FILES = ACPRootListController.m
AccentCustomPrefs_FRAMEWORKS = UIKit Foundation
AccentCustomPrefs_PRIVATE_FRAMEWORKS = Preferences
AccentCustomPrefs_LIBRARIES = sparkcolourpicker sparkapplist
AccentCustomPrefs_INSTALL_PATH = /Library/PreferenceBundles
AccentCustomPrefs_CFLAGS = -fobjc-arc
ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/bundle.mk
