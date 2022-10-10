ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:12.0
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NoTodayView13Prefs

NoTodayView13Prefs_FILES = NTVRootListController.m SPPPrivacyListController.m appcarackListController.m AccLicenseViewController.m homoscreenhookController.m
NoTodayView13Prefs_FRAMEWORKS = UIKit
NoTodayView13Prefs_PRIVATE_FRAMEWORKS = Preferences OnBoardingKit
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
NoTodayView13Prefs_INSTALL_PATH = /Library/PreferenceBundles
NoTodayView13Prefs_CFLAGS = -fobjc-arc
NoTodayView13Prefs_LIBRARIES += sparkcolourpicker sparkapplist

include $(THEOS_MAKE_PATH)/bundle.mk
