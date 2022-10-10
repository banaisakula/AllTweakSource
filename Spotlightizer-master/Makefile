ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = spotlightizer

spotlightizer_FILES = Tweak.xm
spotlightizer_CFLAGS = -fobjc-arc
spotlightizer_EXTRA_FRAMEWORKS += Cephei
spotlightizer_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += spotlightizer_pref
include $(THEOS_MAKE_PATH)/aggregate.mk
