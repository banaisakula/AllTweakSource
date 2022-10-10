TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FlashNotify

FlashNotify_FILES = FNPRootListController.m PFHeaderCell.mm
FlashNotify_FRAMEWORKS = UIKit
FlashNotify_PRIVATE_FRAMEWORKS = Preferences
FlashNotify_INSTALL_PATH = /Library/PreferenceBundles
FlashNotify_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
