TARGET := iphone:clang:latest:latest
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PrysmHook

PrysmHook_FILES = PrysmHook.m
PrysmHook_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
