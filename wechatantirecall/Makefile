ARCHS = arm64 arm64e
TARGET = iphone:clang:13.7:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = tweak

tweak_FILES =tmp.xm WCHLSettingViewController.m WCHLOptions.m 
tweak_CFLAGS = -fobjc-arc 
tweak_PRIVATE_FRAMEWORKS =  OnBoardingKit
include $(THEOS_MAKE_PATH)/tweak.mk
