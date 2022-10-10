include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Accent
TARGET := iphone:clang:13.7:13.0
Accent_FILES = Tweak.x
Accent_CFLAGS = -fobjc-arc
Accent_EXTRA_FRAMEWORKS += Cephei
Accent_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += accentpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk

