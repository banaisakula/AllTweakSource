TARGET := iphone:clang:latest:7.0

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = suffissoprefs

suffissoprefs_FILES = DSXRootListController.m
suffissoprefs_FRAMEWORKS = UIKit
suffissoprefs_PRIVATE_FRAMEWORKS = Preferences
suffissoprefs_INSTALL_PATH = /Library/PreferenceBundles
suffissoprefs_CFLAGS = -fobjc-arc
suffissoprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk
