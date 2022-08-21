LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),RMX2151)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
