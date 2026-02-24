# Motorola Moto E5 Play GO (pettyl) - LineageOS 17.1

![Motorola Moto E5 Play GO](https://cdn2.gsmarena.com/vv/pics/motorola/motorola-moto-e5-play-android-go-edition-2.jpg "Moto E5 Play GO")

This repository contains the device configuration and sources for the **Motorola Moto E5 Play GO** (codenamed pettyl).

## Device Specifications

| Component | Specification |
|:----------|:--------------|
| SoC | Qualcomm MSM8917 Snapdragon 425 |
| CPU | Quad-core (4x1.4 GHz Cortex-A53) |
| GPU | Adreno 308 |
| Memory | 1 GB RAM |
| Storage | 16 GB |
| Battery | Li-Ion 2100 mAh |
| Display | 960 x 480 pixels, 18:9 ratio (5.34") |
| Camera | 8 MP, LED flash |
| Shipped Android | 8.0 (Oreo) |

---

## Source Structure

To build LineageOS 17.1 for this device, you need to set up your workspace as follows:

* Device Tree: device/motorola/pettyl
* Vendor Tree: vendor/motorola/pettyl

## How to Build

1. Initialize the LineageOS source:
   repo init -u https://github.com/LineageOS/android.git -b lineage-17.1 --depth=1

2. Sync the source code:
   repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

3. Set up the environment:
   source build/envsetup.sh
   lunch lineage_pettyl-userdebug

4. Start the build:
   mka bacon -j$(nproc --all)

---

## License & Copyright
* Copyright (C) 2019 - 2026: The LineageOS Project.
* Device Maintainer: elmendezz (https://github.com/elmendezz)
