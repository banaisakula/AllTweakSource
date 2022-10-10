include $(THEOS)/makefiles/common.mk
ARCHS = arm64 arm64e
TARGET = iphone:clang:13.0:12.4
GO_EASY_ON_ME=1

BUNDLE_NAME = PlayingPrefs

PlayingPrefs_FILES = PLRootListController.m
PlayingPrefs_INSTALL_PATH = /Library/PreferenceBundles
PlayingPrefs_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
PlayingPrefs_FRAMEWORKS = UIKit
PlayingPrefs_PRIVATE_FRAMEWORKS = Preferences
PlayingPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/PlayingPrefs.plist$(ECHO_END)
