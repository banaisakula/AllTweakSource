include $(THEOS)/makefiles/common.mk
ARCHS = arm64 arm64e
TARGET = iphone:clang::13.0
INSTALL_TARGET_PROCESSES = SpringBoard
BUNDLE_NAME = HiddenLockPreferences

HiddenLockPreferences_FILES = HLPRootListController.m
HiddenLockPreferences_FRAMEWORKS = UIKit OnBoardingKit
HiddenLockPreferences_PRIVATE_FRAMEWORKS = Preferences
HiddenLockPreferences_INSTALL_PATH = /Library/PreferenceBundles
HiddenLockPreferences_CFLAGS = -fobjc-arc
HiddenLockPreferences_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/$(BUNDLE_NAME).plist$(ECHO_END)