export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.4:13.0
export SYSROOT = $(THEOS)/sdks/iPhoneOS13.7.sdk
export PREFIX = $(THEOS)/toolchain/XcodeDefault.xctoolchain/usr/bin/

INSTALL_TARGET_PROCESSES = SpringBoard
SUBPROJECTS = Tweak Preferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
