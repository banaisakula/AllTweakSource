ARCHS = arm64 arm64e

TARGET := iphone:clang:13.7:13.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = datebar
datebar_FRAMEWORKS = UIKit
datebar_FILES = Tweak.x
datebar_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += datebar
include $(THEOS_MAKE_PATH)/aggregate.mk
