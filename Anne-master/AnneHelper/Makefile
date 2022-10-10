TARGET := iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = AnneHelper

AnneHelper_FILES = main.m
AnneHelper_CFLAGS = -fobjc-arc
AnneHelper_CODESIGN_FLAGS = -Sentitlements.plist
AnneHelper_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
