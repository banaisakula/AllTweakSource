ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:13.0
INSTALL_TARGET_PROCESSES = SpringBoard


TWEAK_NAME = NoKeyboardSettings

NoKeyboardSettings_FILES = Tweak.xm
NoKeyboardSettings_CFLAGS = -fobjc-arc -Wno-error=unused-variable -Wno-error=unused-function -include Prefix.pch

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
