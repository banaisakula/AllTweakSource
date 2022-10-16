ARCHS =  arm64 arm64e
include $(THEOS)/makefiles/common.mk
TWEAK_NAME_FRAMEWORKS = UIKit
internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp TapTapFlip.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/TapTapFlip.plist$(ECHO_END)
	$(ECHO_NOTHING)cp TapTapFlip@3x.png $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/TapTapFlip@3x.png$(ECHO_END)
