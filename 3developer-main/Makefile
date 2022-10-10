TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_DEVICE_IP=10.0.0.131
THEOS_DEVICE_PORT=2222

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 3Developer

3Developer_FILES = Tweak.x
3Developer_CFLAGS = -fobjc-arc
3Developer_PRIVATE_FRAMEWORKS = SpringBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
