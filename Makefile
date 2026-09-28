export THEOS = $(HOME)/.theos

TARGET := iphone:clang:16.5:14.0
INSTALL_TARGET_PROCESSES = AlightMotion

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AlightTweak

AlightTweak_FILES = Tweak.x
AlightTweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
