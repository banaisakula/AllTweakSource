ARCHS = arm64 arm64e
TARGET = iphone:clang::13.0
INSTALL_TARGET_PROCESSES = SpringBoard
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MobileGooseModule
MobileGooseModule_FILES = MobileGooseModule.m
MobileGooseModule_INSTALL_PATH = /Library/ControlCenter/Bundles
MobileGooseModule_CFLAGS = -fobjc-arc
MobileGooseModule_FRAMEWORKS = UIKit
MobileGooseModule_PRIVATE_FRAMEWORKS = ControlCenterUIKit

include $(THEOS_MAKE_PATH)/bundle.mk

before-stage::
	find . -name ".DS_Store" -type f -delete
