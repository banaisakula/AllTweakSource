ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = GNAPref
GNAPref_FILES = $(wildcard *.m)
GNAPref_INSTALL_PATH = /Library/PreferenceBundles
GNAPref_PRIVATE_FRAMEWORKS = Preferences
GNAPref_EXTRA_FRAMEWORKS = libhdev
GNAPref_CFLAGS = -fobjc-arc
GNAPref_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/GNAPref.plist$(ECHO_END)
