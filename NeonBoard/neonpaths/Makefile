TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NeonPaths
NeonPaths_FILES = Tweak.x
NeonPaths_FRAMEWORKS = CoreGraphics ImageIO
NeonPaths_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
