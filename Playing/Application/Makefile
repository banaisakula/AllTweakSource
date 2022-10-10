include $(THEOS)/makefiles/common.mk
ARCHS = arm64 arm64e
TARGET = iphone:clang:13.0:12.4
GO_EASY_ON_ME=1

APPLICATION_NAME = PlayingApp

PlayingApp_FILES = main.m PLAppDelegate.m PLRootViewController.m
PlayingApp_FRAMEWORKS = UIKit CoreGraphics
PlayingApp_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"PlayingApp\"" || true
