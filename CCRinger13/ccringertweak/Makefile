TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CCRingerTweak

CCRingerTweak_FILES = Tweak.x
CCRingerTweak_CFLAGS = -fobjc-arc
CCRingerTweak_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
