INSTALL_TARGET_PROCESSES = SpringBoard
PACKAGE_VERSION=$(THEOS_PACKAGE_BASE_VERSION)
ARCHS =  arm64 arm64e
TARGET = iphone:clang:13.7:13.0
SYSROOT = $(THEOS)/sdks/iPhoneOS13.7.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DeadRinger

DeadRinger_FILES = Tweak.xm
DeadRinger_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
