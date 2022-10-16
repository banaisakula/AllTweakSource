TARGET := iphone:clang:latest:7.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TOOL_NAME = lighter

lighter_FILES = main.m
lighter_CFLAGS = -fobjc-arc
lighter_CODESIGN_FLAGS = -Sentitlements.plist
lighter_INSTALL_PATH = /usr/libexec/

include $(THEOS_MAKE_PATH)/tool.mk

after-stage::
	$(FAKEROOT) chmod 6755 $(THEOS_STAGING_DIR)/usr/libexec/lighter
	$(FAKEROOT) chmod 755 $(THEOS_STAGING_DIR)/usr/libexec/lighter