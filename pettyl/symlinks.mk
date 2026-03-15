# SPDX-FileCopyrightText: 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

$(call add-symlink,$(TARGET_OUT)/firmware, /vendor/firmware)
$(call add-symlink,$(TARGET_OUT)/persist, /mnt/vendor/persist)
$(call add-symlink,$(TARGET_OUT)/dsp, /vendor/dsp)
