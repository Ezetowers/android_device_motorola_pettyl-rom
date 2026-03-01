#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: 2026 elmendezz
# SPDX-License-Identifier: Apache-2.0
#

# API levels
PRODUCT_SHIPPING_API_LEVEL := 27

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    apanic_annotate.sh \
    apanic_copy.sh \
    apanic_save.sh \
    hardware_revisions.sh \
    init.class_main.sh \
    init.crda.sh \
    init.gbmods.sh \
    init.mdm.sh \
    init.mmi.audio.sh \
    init.mmi.block_perm.sh \
    init.mmi.boot.sh \
    init.mmi.carrier.sh \
    init.mmi.mdlog-getlogs.sh \
    init.mmi.touch.sh \
    init.mmi.usb.sh \
    init.oem.hw.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.crashdata.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.wifi.sh \
    init.qti.fm.sh \
    init.qti.ims.sh \
    modem_erase_modemst12.sh \
    pstore_annotate.sh \
    qca6234-service.sh \
    wlan_carrier_bin.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.mmi.chipset.rc \
    init.mmi.common.rc \
    init.mmi.debug.rc \
    init.mmi.diag.rc \
    init.mmi.diag_mdlog.rc \
    init.mmi.nonab.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.mmi.sensor.rc \
    init.mmi.usb.rc \
    init.mmi.volte.rc \
    init.oem.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.target.rc \

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/pettyl/pettyl-vendor.mk)

# =================================================================
# =================================================================
# =================================================================
# ======================    elmendezz    ==========================
# =================================================================
# =================================================================
# =================================================================
