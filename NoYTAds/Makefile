ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:13.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoYTAds

NoYTAds_FILES = Tweak.x
NoYTAds_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
