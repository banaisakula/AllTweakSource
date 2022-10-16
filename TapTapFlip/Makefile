TARGET = :clang
ARCHS = armv7 arm64 arm64e
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TapTapFlip
TapTapFlip_FILES = TapTapFlip.xm
TapTapFlip_CFLAGS = -fobjc-arc
TWEAK_NAME_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete

after-stage::
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -iname '*.png' -exec pincrush-osx -i {} \;$(ECHO_END)

after-install::
	install.exec "killall -9 Camera Preferences"

SUBPROJECTS += taptapflip
include $(THEOS_MAKE_PATH)/aggregate.mk

