#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# dontol kucai
rm -rf device/xiaomi/earth
rm -rf kernel/xiaomi/earth
rm -rf hardware/xiaomi
rm -rf hardware/mediatek
rm -rf vendor/xiaomi/earth
rm -rf device/mediatek/sepolicy_vndr
rm -rf vendor/lineage-priv/keys

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Matrixx device/xiaomi/earth

git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/sign_keys_priv.git -b main vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=dnryd
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta

# initiate build setup
. build/envsetup.sh
brunch earth userdebug
