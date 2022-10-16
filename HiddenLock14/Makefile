ARCHS = arm64 arm64e
TARGET = iphone:clang::13.0
INSTALL_TARGET_PROCESSES = MobileSlideShow
PACKAGE_VERSION = 1.1.3
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HiddenLock14
HiddenLock14_FRAMEWORKS = UIKit LocalAuthentication Security
HiddenLock14_FILES = Tweak.x
HiddenLock14_CFLAGS = -fobjc-arc
HiddenLock14_EXTRA_FRAMEWORKS += Cephei
SUBPROJECTS += lighter
SUBPROJECTS += hiddenlockpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
include $(THEOS_MAKE_PATH)/tweak.mk
