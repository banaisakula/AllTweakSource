TARGET= iphone:clang:13.0:13.0
ARCHS= arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HoneyBadger

HoneyBadger_FILES = Tweak.x
HoneyBadger_CFLAGS = -fobjc-arc
HoneyBadger_FRAMEWORKS = UIKit
HoneyBadger_PRIVATE_FRAMEWORKS = SpringBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk
