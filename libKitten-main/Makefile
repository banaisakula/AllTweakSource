export ARCHS = arm64 arm64e
export TARGET = iphone:clang:13.7:12.0
export SYSROOT = $(THEOS)/sdks/iPhoneOS13.7.sdk
export PREFIX = $(THEOS)/toolchain/XcodeDefault.xctoolchain/usr/bin/

LIBRARY_NAME = libkitten
$(LIBRARY_NAME)_FILES = Library/libKitten.m
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc -DTHEOS_LEAN_AND_MEAN
$(LIBRARY_NAME)_FRAMEWORKS = UIKit

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk

