TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = datebar

datebar_FILES = DBCRootListController.m
datebar_FRAMEWORKS = UIKit
datebar_PRIVATE_FRAMEWORKS = Preferences
datebar_INSTALL_PATH = /Library/PreferenceBundles
datebar_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
