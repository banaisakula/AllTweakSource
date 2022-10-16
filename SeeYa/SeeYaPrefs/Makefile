include $(THEOS)/makefiles/common.mk

TARGET = iphone:clang:13.5
ARCHS = arm64 arm64e

BUNDLE_NAME = SeeYaPrefs

SeeYaPrefs_FILES = SYPRootListController.m
SeeYaPrefs_INSTALL_PATH = /Library/PreferenceBundles
SeeYaPrefs_FRAMEWORKS = UIKit
SeeYaPrefs_PRIVATE_FRAMEWORKS = Preferences
SeeYaPrefs_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
SeeYaPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SeeYaPrefs.plist$(ECHO_END)
