#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init --depth=1 -u https://github.com/AfterlifeOS/android_manifest.git -b 14 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "============="
echo "Sync success"
echo "============="

# Delete some stuff
echo "yahahahaha"

# Clone Trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Afterlife-14 device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/AbuRider/android_device_mediatek_sepolicy_vndr.git -b after-14 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/signing_keys.git -b afterlife vendor/after-priv/keys

# Export
export BUILD_USERNAME=dnryd
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta

# initiate build setup
. build/envsetup.sh
goafterlife earth
