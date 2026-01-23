#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf vendor/lineage-priv/keys device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr

repo init -u https://github.com/Mnzz-Prjkt/android_manifest.git -b sixteen-qpr1 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b PixelOS-16.1 device/xiaomi/earth
git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23.1 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.1 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.1 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.1 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b keys vendor/lineage-priv/keys
git clone https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
breakfast earth userdebug
m pixelos
