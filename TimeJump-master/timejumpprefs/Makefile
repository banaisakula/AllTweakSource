TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TimeJumpPrefs

TimeJumpPrefs_FILES = TJPRootListController.m
TimeJumpPrefs_FRAMEWORKS = UIKit
TimeJumpPrefs_PRIVATE_FRAMEWORKS = Preferences
TimeJumpPrefs_INSTALL_PATH = /Library/PreferenceBundles
TimeJumpPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
