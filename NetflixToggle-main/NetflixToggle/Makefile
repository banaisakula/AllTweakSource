TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NetflixToggle

NetflixToggle_FILES = NetflixToggle.m
NetflixToggle_CFLAGS = -fobjc-arc
NetflixToggle_INSTALL_PATH = /Library/ControlCenter/Bundles/
NetflixToggle_BUNDLE_EXTENSION = bundle
NetflixToggle_PRIVATE_FRAMEWORKS = ControlCenterUIKit

include $(THEOS_MAKE_PATH)/bundle.mk
