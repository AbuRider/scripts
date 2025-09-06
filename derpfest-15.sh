#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86
rm -rf prebuilts/rust

# repo init rom
repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "==========================="
echo " sync repository success..."
echo "==========================="

# dontol kucai
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Derpfest-16 device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/signing_keys.git -b main vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=yusup
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
mka derp -j$(nproc --all)
