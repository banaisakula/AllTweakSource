ARCHS =  arm64 arm64e
TARGET := iphone:clang:13.7:11.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DismissProgress
DismissProgress_FRAMEWORKS = UIKit
DismissProgress_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
