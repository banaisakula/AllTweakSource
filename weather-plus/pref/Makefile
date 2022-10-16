ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = WPPPref
WPPPref_FILES = $(wildcard *.m)
WPPPref_INSTALL_PATH = /Library/PreferenceBundles
WPPPref_PRIVATE_FRAMEWORKS = Preferences
WPPPref_EXTRA_FRAMEWORKS = libhdev
WPPPref_FRAMEWORKS = UIKit
WPPPref_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/WPPPref.plist$(ECHO_END)
