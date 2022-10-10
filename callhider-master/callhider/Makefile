TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CallHider

CallHider_FILES = CHPRootListController.m
CallHider_FRAMEWORKS = UIKit
CallHider_LIBRARIES = applist
CallHider_PRIVATE_FRAMEWORKS = Preferences
CallHider_INSTALL_PATH = /Library/PreferenceBundles
CallHider_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
