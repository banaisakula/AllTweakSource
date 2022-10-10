TARGET := iphone:clang:13.7:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = respring
respring_BUNDLE_EXTENSION = bundle
respring_FILES = respring.m
respring_CFLAGS = -fobjc-arc
respring_FRAMEWORKS = UIKit
respring_PRIVATE_FRAMEWORKS = ControlCenterUIKit
respring_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
