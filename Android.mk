ifeq ($(call my-dir),$(call project-path-for,qcom-audio))

MY_LOCAL_PATH := $(call my-dir)

include $(MY_LOCAL_PATH)/hal/Android.mk

endif
