include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e
TARGET = iphone:clang:13.7:12.4

MAKEFLAGS = --no-print-directory

LIBRARY_NAME = liblockwidgets

liblockwidgets_FILES = LockWidgetsView.mm LockWidgetsConfig.m MRYIPCCenter.m
liblockwidgets_CFLAGS = -fobjc-arc
liblockwidgets_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/library.mk

