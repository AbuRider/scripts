#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/AbuRided/bananadroid_manifest.git -b 13 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "============="
echo "Sync success"
echo "============="

# Delete some stuff
rm -rf device/mediatek/sepolicy_vndr

# Clone Trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b pisang device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-20 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-20 hardware/mediatek

git clone https://github.com/AbuRider/android_device_mediatek_sepolicy_vndr.git -b lineage-20 device/mediatek/sepolicy_vndr

# git clone https://github.com/AbuRider/sign_keys_priv.git -b main vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=dnryd
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta

# initiate build setup
. build/envsetup.sh
lunch banana_earth-userdebug
m banana -j$(nproc --all)
