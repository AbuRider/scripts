#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Infinity-16.2 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.2 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16.2-staging kernel/xiaomi/earth

git clone https://github.com/AbuRider/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b infinity vendor/infinity-priv/keys

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

. build/envsetup.sh
lunch infinity_earth-userdebug
m bacon
