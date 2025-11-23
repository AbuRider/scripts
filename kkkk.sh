#!/bin/bash

# Remove Clang
rm -rf external/chromium-webview/prebuilt/arm 
rm -rf external/chromium-webview/prebuilt/arm64
rm -rf external/chromium-webview/prebuilt/x86
rm -rf external/chromium-webview/prebuilt/x86_64
rm -rf prebuilts/clang/host/linux-x86

# repo init
repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs
# sync
/opt/crave/resync.sh || repo sync

# Clone trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b lineage-22.2 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth
# other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b matrixx vendor/lineage-priv/keys

# Oke
rm -rf vendor/lineage
rm -rf frameworks/base
rm -rf hardware/lineage/interfaces
git clone https://github.com/AbuRider/android_vendor_matrixx.git -b 15.0 vendor/lineage
git clone https://github.com/AbuRider/android_frameworks_base_A15_metrik.git -b 15.0 frameworks/base
git clone https://github.com/LineageOS/android_hardware_lineage_interfaces.git -b lineage-22.2 hardware/lineage/interfaces

# Export
export BUILD_USERNAME=oumae
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"

# starts build setup !
. build/envsetup.sh
brunch earth 
