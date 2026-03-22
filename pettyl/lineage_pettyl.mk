#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: 2026 elmendezz
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from pettyl device
$(call inherit-product, device/motorola/pettyl/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := pettyl
PRODUCT_NAME := lineage_pettyl
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto e5 play
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="pettyl-user 8.1.0 OPGS28.54-53-8-20 90aa7 release-keys" \
    BuildFingerprint=motorola/pettyl/pettyl:8.1.0/OPGS28.54-53-8-20/90aa7:user/release-keys

# Forzar explícitamente el esquema No-SAR
PRODUCT_BUILD_SYSTEM_ROOT_IMAGE := false
PRODUCT_USE_DYNAMIC_PARTITIONS := false

# Importante para dispositivos de 1GB RAM (Android Go)
(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)

# =================================================================
# =================================================================
# =================================================================
# ======================    elmendezz    ==========================
# =================================================================
# =================================================================
# =================================================================
