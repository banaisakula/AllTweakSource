ARCHS = arm64 arm64e
TARGET = iphone:clang:13.7:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeChatHookLite

learn_FILES = WCHLAboutMeViewController.m WCHLOptions.m WCHLSettingViewController.m WCHLViewController.m Tweak.xm



WeChatHookLite_CFLAGS = -fobjc-arc
WeChatHookLite_FRAMEWORKS = UIKit
WeChatHookLite_PRIVATE_FRAMEWORKS = SpringBoardServices
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
