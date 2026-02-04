#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf vendor/lineage-priv/keys device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/xiaomi hardware/xiaomi device/mediatek/sepolicy_vndr vendor/mediatek/ims

repo init -u https://github.com/The-Clover-Project/manifest.git -b 16-qpr2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Clover-16.2 device/xiaomi/earth
git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23.2 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16.2-staging kernel/xiaomi/earth

git clone https://github.com/AbuRider/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/AbuRider/android_device_mediatek_sepolicy_vndr.git -b Clover device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b clover vendor/clover-priv/keys
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen vendor/mediatek/ims
git clone https://github.com/LineageOS/android_packages_apps_EuiccPolicy.git -b lineage-23.2 packages/apps/EuiccPolicy

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra
export TARGET_INCLUDE_PIXEL_LAUNCHER=true
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

. build/envsetup.sh
lunch clover_earth-bp4a-userdebug
mka clover
