ARCHS = arm64 arm64e
TARGET = iphone:clang::11.0
include $(THEOS)/makefiles/common.mk

TOOL_NAME = wallpaper
wallpaper_FILES = main.m
wallpaper_CFLAGS = -fobjc-arc
wallpaper_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tool.mk
