ARCHS = arm64 arm64e
TARGET = iphone:clang::13.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ZZAccentCustom
ZZAccentCustom_FILES = Tweak.xm
ZZAccentCustom_CFLAGS = -fobjc-arc
ZZAccentCustom_FRAMEWORKS = UIKit Foundation
ZZAccentCustom_LIBRARIES = sparkcolourpicker sparkapplist
ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += accentcustomprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
