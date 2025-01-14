ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifneq ($(filter msm8996,$(TARGET_BOARD_PLATFORM)),)
  LOCAL_CFLAGS := -DPLATFORM_MSM8996
endif

LOCAL_CFLAGS += -Wno-macro-redefined

LOCAL_HEADER_LIBRARIES := libhardware_headers

LOCAL_SRC_FILES := \
	audio_hw.c \
	voice.c \
	platform_info.c \
	msm8974/platform.c \
        acdb.c

LOCAL_SRC_FILES += audio_extn/audio_extn.c \
                   audio_extn/utils.c

LOCAL_HEADER_LIBRARIES += qti_kernel_headers

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)),true)
  LOCAL_CFLAGS += -DENABLE_EXTENDED_COMPRESS_FORMAT
endif

LOCAL_CFLAGS += -DUSE_VENDOR_EXTN

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_HDMI_EDID)),true)
    LOCAL_CFLAGS += -DHDMI_EDID
    LOCAL_SRC_FILES += edid.c
endif

ifeq ($(strip $(AUDIO_USE_LL_AS_PRIMARY_OUTPUT)),true)
    LOCAL_CFLAGS += -DUSE_LL_AS_PRIMARY_OUTPUT
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_PCM_OFFLOAD)),true)
    LOCAL_CFLAGS += -DPCM_OFFLOAD_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_ANC_HEADSET)),true)
    LOCAL_CFLAGS += -DANC_HEADSET_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_HIFI_AUDIO)),true)
    LOCAL_CFLAGS += -DHIFI_AUDIO_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_RAS)),true)
    LOCAL_CFLAGS += -DRAS_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_VBAT_MONITOR)),true)
    LOCAL_CFLAGS += -DVBAT_MONITOR_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_FLUENCE)),true)
    LOCAL_CFLAGS += -DFLUENCE_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_PROXY_DEVICE)),true)
    LOCAL_CFLAGS += -DAFE_PROXY_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE)),true)
    LOCAL_CFLAGS += -DKPI_OPTIMIZE_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_FM_POWER_OPT)),true)
    LOCAL_CFLAGS += -DFM_POWER_OPT
    LOCAL_SRC_FILES += audio_extn/fm.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_USB_TUNNEL_AUDIO)),true)
    LOCAL_CFLAGS += -DUSB_HEADSET_ENABLED
    LOCAL_SRC_FILES += audio_extn/usb.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_HFP)),true)
    LOCAL_CFLAGS += -DHFP_ENABLED
    LOCAL_SRC_FILES += audio_extn/hfp.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_CUSTOMSTEREO)),true)
    LOCAL_CFLAGS += -DCUSTOM_STEREO_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SSR)),true)
    LOCAL_CFLAGS += -DSSR_ENABLED
    LOCAL_SRC_FILES += audio_extn/ssr.c
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/surround_sound_3mic/
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/common/inc/
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS)),true)
    LOCAL_CFLAGS += -DMULTI_VOICE_SESSION_ENABLED
    LOCAL_SRC_FILES += voice_extn/voice_extn.c

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_INCALL_MUSIC)),true)
    LOCAL_CFLAGS += -DINCALL_MUSIC_ENABLED
endif
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_COMPRESS_VOIP)),true)
    LOCAL_CFLAGS += -DCOMPRESS_VOIP_ENABLED
    LOCAL_SRC_FILES += voice_extn/compress_voip.c
endif

endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTN_FORMATS)),true)
LOCAL_CFLAGS += -DAUDIO_EXTN_FORMATS_ENABLED
endif


ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SPKR_PROTECTION)),true)
    LOCAL_CFLAGS += -DSPKR_PROT_ENABLED
    LOCAL_SRC_FILES += audio_extn/spkr_protection.c
endif

LOCAL_CFLAGS += -DHW_VARIANTS_ENABLED
LOCAL_SRC_FILES += msm8974/hw_info.c

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE)),true)
    LOCAL_CFLAGS += -DCOMPRESS_CAPTURE_ENABLED
    LOCAL_SRC_FILES += audio_extn/compress_capture.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD)),true)
    LOCAL_CFLAGS += -DFLAC_OFFLOAD_ENABLED
    LOCAL_CFLAGS += -DCOMPRESS_METADATA_NEEDED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER)),true)
    LOCAL_CFLAGS += -DFLAC_OFFLOAD_ENABLED
    LOCAL_CFLAGS += -DCOMPRESS_METADATA_NEEDED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD)),true)
    LOCAL_CFLAGS += -DVORBIS_OFFLOAD_ENABLED
    LOCAL_CFLAGS += -DCOMPRESS_METADATA_NEEDED

endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_WMA_OFFLOAD)),true)
    LOCAL_CFLAGS += -DWMA_OFFLOAD_ENABLED
    LOCAL_CFLAGS += -DCOMPRESS_METADATA_NEEDED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD)),true)
    LOCAL_CFLAGS += -DALAC_OFFLOAD_ENABLED
    LOCAL_CFLAGS += -DCOMPRESS_METADATA_NEEDED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_APE_OFFLOAD)),true)
    LOCAL_CFLAGS += -DAPE_OFFLOAD_ENABLED
    LOCAL_CFLAGS += -DCOMPRESS_METADATA_NEEDED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24)),true)
       LOCAL_CFLAGS += -DPCM_OFFLOAD_ENABLED_24
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD)),true)
    LOCAL_CFLAGS += -DAAC_ADTS_OFFLOAD_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DEV_ARBI)),true)
    LOCAL_CFLAGS += -DDEV_ARBI_ENABLED
    LOCAL_SRC_FILES += audio_extn/dev_arbi.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_RECORD_PLAY_CONCURRENCY)),true)
    LOCAL_CFLAGS += -DRECORD_PLAY_CONCURRENCY
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_ACDB_LICENSE)), true)
    LOCAL_CFLAGS += -DDOLBY_ACDB_LICENSE
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_KEEP_ALIVE)),true)
    LOCAL_CFLAGS += -DKEEP_ALIVE_ENABLED
    LOCAL_SRC_FILES += audio_extn/keep_alive.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SOURCE_TRACKING)),true)
    LOCAL_CFLAGS += -DSOURCE_TRACKING_ENABLED
    LOCAL_SRC_FILES += audio_extn/source_track.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SPLIT_A2DP)),true)
    LOCAL_CFLAGS += -DSPLIT_A2DP_ENABLED
    LOCAL_SRC_FILES += audio_extn/a2dp.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_COMPRESS_INPUT)),true)
    LOCAL_CFLAGS += -DCOMPRESS_INPUT_ENABLED
    LOCAL_SRC_FILES += audio_extn/compress_in.c
endif

ifeq ($(strip $(BOARD_SUPPORTS_QAHW)),true)
    LOCAL_CFLAGS += -DAUDIO_HW_EXTN_API_ENABLED
    LOCAL_SRC_FILES += audio_hw_extn_api.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_BT_HAL)),true)
    LOCAL_CFLAGS += -DAUDIO_EXTN_BT_HAL_ENABLED
    LOCAL_SRC_FILES += audio_extn/bt_hal.c
endif

LOCAL_SHARED_LIBRARIES := \
        liblog \
        libcutils \
        libtinyalsa \
        libhardware \
        libtinycompress \
        libaudioroute \
        libdl \
        libaudioutils \
        libexpat \
        libhidlbase \
        libprocessgroup

ifneq ($(strip $(AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER)),false)
    LOCAL_CFLAGS += -DEXT_AMPLIFIER_ENABLED
    LOCAL_SRC_FILES += audio_extn/audio_amplifier.c
endif

LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	external/tinycompress/include \
	system/media/audio_utils/include \
	external/expat/lib \
	hardware/libhardware/include \
	$(call include-path-for, audio-route) \
	$(call include-path-for, audio-effects) \
	$(LOCAL_PATH)/msm8974 \
	$(LOCAL_PATH)/audio_extn \
	$(LOCAL_PATH)/voice_extn

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_LISTEN)),true)
    LOCAL_CFLAGS += -DAUDIO_LISTEN_ENABLED
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/audio-listen
    LOCAL_SRC_FILES += audio_extn/listen.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXT_HDMI)),true)
    LOCAL_CFLAGS += -DAUDIO_EXTERNAL_HDMI_ENABLED
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH)),true)
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/audio-parsers
    LOCAL_SHARED_LIBRARIES += libaudioparsers
endif
endif

ifeq ($(strip $(BOARD_SUPPORTS_SOUND_TRIGGER)),true)
    ST_FEATURE_ENABLE := true
endif

ifeq ($(strip $(BOARD_SUPPORTS_SOUND_TRIGGER_HAL)),true)
    ST_FEATURE_ENABLE := true
endif

ifeq ($(ST_FEATURE_ENABLE), true)
    LOCAL_CFLAGS += -DSOUND_TRIGGER_ENABLED
    LOCAL_CFLAGS += -DSOUND_TRIGGER_PLATFORM_NAME=$(TARGET_BOARD_PLATFORM)
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/sound_trigger
    LOCAL_SRC_FILES += audio_extn/soundtrigger.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_AUXPCM_BT)),true)
    LOCAL_CFLAGS += -DAUXPCM_BT_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DISPLAY_PORT)),true)
    LOCAL_CFLAGS += -DDISPLAY_PORT_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_GEF_SUPPORT)),true)
    LOCAL_CFLAGS += -DAUDIO_GENERIC_EFFECT_FRAMEWORK_ENABLED
    LOCAL_SRC_FILES += audio_extn/gef.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DYNAMIC_LOG)), true)
    LOCAL_CFLAGS += -DDYNAMIC_LOG_ENABLED
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/audio-log-utils
    LOCAL_SHARED_LIBRARIES += libaudio_log_utils
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DYNAMIC_ECNS)),true)
    LOCAL_CFLAGS += -DDYNAMIC_ECNS_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_INSTANCE_ID)), true)
    LOCAL_CFLAGS += -DINSTANCE_ID_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_USB_BURST_MODE)), true)
    LOCAL_CFLAGS += -DUSB_BURST_MODE_ENABLED
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_BATTERY_LISTENER)), true)
    LOCAL_CFLAGS += -DBATTERY_LISTENER_ENABLED
    LOCAL_SRC_FILES += audio_extn/battery_listener.cpp
    LOCAL_SHARED_LIBRARIES += android.hardware.health@1.0 android.hardware.health@2.0 \
                              libbase libhidlbase \
                              libutils android.hardware.power@1.2
    LOCAL_STATIC_LIBRARIES := libhealthhalutils
endif

ifeq ($(strip $(AUDIO_FEATURE_ELLIPTIC_ULTRASOUND_SUPPORT)),true)
    LOCAL_CFLAGS += -DELLIPTIC_ULTRASOUND_ENABLED
    LOCAL_SRC_FILES += audio_extn/ultrasound.c
endif

LOCAL_CFLAGS += -D_GNU_SOURCE
LOCAL_CFLAGS += -Wall -Werror
LOCAL_CLANG_CFLAGS += -Wno-unused-variable -Wno-unused-function -Wno-missing-field-initializers

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SND_MONITOR)), true)
    LOCAL_CFLAGS += -DSND_MONITOR_ENABLED
    LOCAL_SRC_FILES += audio_extn/sndmonitor.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXT_HW_PLUGIN)),true)
    LOCAL_CFLAGS += -DEXT_HW_PLUGIN_ENABLED
    LOCAL_SRC_FILES += audio_extn/ext_hw_plugin.c
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_GCOV)),true)
    LOCAL_CFLAGS += --coverage -fprofile-arcs -ftest-coverage
    LOCAL_CPPFLAGS += --coverage -fprofile-arcs -ftest-coverage
    LOCAL_STATIC_LIBRARIES += libprofile_rt
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_A2DP_DECODERS)), true)
    LOCAL_CFLAGS += -DAPTX_DECODER_ENABLED
endif

LOCAL_MODULE := audio.primary.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_MODULE_TAGS := optional

LOCAL_VENDOR_MODULE := true
LOCAL_CFLAGS += -DANDROID_PLATFORM_SDK_VERSION=$(PLATFORM_SDK_VERSION)

include $(BUILD_SHARED_LIBRARY)

LOCAL_CFLAGS += -Wno-unused-variable
LOCAL_CFLAGS += -Wno-sign-compare
LOCAL_CFLAGS += -Wno-unused-parameter
LOCAL_CFLAGS += -Wno-unused-label
LOCAL_CFLAGS += -Wno-gnu-designator
LOCAL_CFLAGS += -Wno-typedef-redefinition
LOCAL_CFLAGS += -Wno-shorten-64-to-32
LOCAL_CFLAGS += -Wno-tautological-compare
LOCAL_CFLAGS += -Wno-unused-function
LOCAL_CFLAGS += -Wno-unused-local-typedef

endif
