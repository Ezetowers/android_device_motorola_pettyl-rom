# SPDX-FileCopyrightText: 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := pettyl_symlinks
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_POST_INSTALL_CMD := \
    ln -sf /vendor/firmware $(TARGET_OUT)/firmware; \
    ln -sf /mnt/vendor/persist $(TARGET_OUT)/persist; \
    ln -sf /vendor/dsp $(TARGET_OUT)/dsp
include $(BUILD_PHONY_PACKAGE)
