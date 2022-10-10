export ARCHS = arm64 arm64e
export TARGET = iphone:clang::13.0
export INSTALL_TARGET_PROCESSES = MobileSlideShow
export FINALPACKAGE = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Anne

Anne_FILES = $(wildcard src/**/*.swift) $(wildcard src/Hooks/*.mm) $(wildcard src/**/*.m)
Anne_CFLAGS = -fobjc-arc

ADDITIONAL_CFLAGS += -DTHEOS_LEAN_AND_MEAN -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += AnneHelper
include $(THEOS_MAKE_PATH)/aggregate.mk
