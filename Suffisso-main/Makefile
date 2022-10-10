TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Discord, Preferences

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Suffisso

Suffisso_FILES = Tweak.x
Suffisso_CFLAGS = -fobjc-arc
Suffisso_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += suffissoprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
