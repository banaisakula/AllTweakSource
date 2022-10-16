TARGET = iphone:clang:latest:7.0
ARCHS = arm64e arm64 armv7

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Regreddit

Regreddit_FILES = Tweak.x $(wildcard *.m)
Regreddit_CFLAGS = -fobjc-arc -include macros.h

include $(THEOS_MAKE_PATH)/tweak.mk
