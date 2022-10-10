include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BanAvoider

BanAvoider_FILES = BAPRootListController.m
BanAvoider_INSTALL_PATH = /Library/PreferenceBundles
BanAvoider_FRAMEWORKS = UIKit
BanAvoider_LIBRARIES =  applist
BanAvoider_PRIVATE_FRAMEWORKS = Preferences
BanAvoider_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BanAvoider.plist$(ECHO_END)
