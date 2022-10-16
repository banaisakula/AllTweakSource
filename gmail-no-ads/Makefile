ARCHS = arm64 arm64e
TARGET = iphone:clang:13.6:12.0
INSTALL_TARGET_PROCESSES = Gmail Preferences

# https://gist.github.com/haoict/96710faf0524f0ec48c13e405b124222
PREFIX = "$(THEOS)/toolchain/XcodeDefault.xctoolchain/usr/bin/"

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = gmailnoads
gmailnoads_FILES = $(wildcard *.xm *.m)
gmailnoads_EXTRA_FRAMEWORKS = libhdev
gmailnoads_CFLAGS = -fobjc-arc -std=c++11
gmailnoads_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += pref

include $(THEOS_MAKE_PATH)/aggregate.mk

clean::
	rm -rf .theos packages