TAGET = iphone:clang:latest:8.0
ARCHS =  arm64 arm64e
PACKAGE_VERSION = 1.2.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SwipeForMore
$(TWEAK_NAME)_FILES = SwipeActionController.m Tweak.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp -R Resources $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SwipeForMore$(ECHO_END)
