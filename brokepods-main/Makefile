TARGET := iphone:clang:latest:10.0
INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BrokePods

BrokePods_FILES = Tweak.x
BrokePods_CFLAGS = -fobjc-arc
BrokePods_PRIVATE_FRAMEWORKS = Celestial

include $(THEOS_MAKE_PATH)/tweak.mk
