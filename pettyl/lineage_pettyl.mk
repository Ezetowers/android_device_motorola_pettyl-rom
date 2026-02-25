# Version: 1
# Changelog:
# - Se movieron las definiciones de PRODUCT antes de las herencias comunes para asegurar consistencia.
# - Se ajustó el orden de herencia de Lineage para evitar sobreescritura de variables de identidad.

# Identidad del Producto (Definir antes de heredar de Lineage)
PRODUCT_DEVICE := pettyl
PRODUCT_NAME := lineage_pettyl
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto e5 play
PRODUCT_MANUFACTURER := motorola

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from pettyl device
$(call inherit-product, device/motorola/pettyl/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="pettyl-user 8.1.0 OPGS28.54-53-8-20 90aa7 release-keys" \
    BuildFingerprint=motorola/pettyl/pettyl:8.1.0/OPGS28.54-53-8-20/90aa7:user/release-keys
