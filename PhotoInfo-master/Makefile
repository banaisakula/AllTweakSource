INSTALL_TARGET_PROCESSES = MobileSlideShow
export ARCHS = arm64 arm64e
DEBUG = 0
FINAL_PACKAGE = 1
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PhotoInfo

PhotoInfo_FILES = PhotoInfo.xm
PhotoInfo_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
