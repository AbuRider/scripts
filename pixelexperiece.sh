#!/bin/bash

# Fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/AbuRider/lmodroid_manifest.git -b fifteen-qpr2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "============="
echo "Sync success"
echo "============="

# clone trees bg
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lmodroid-15 device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/sign_keys_priv.git -b lmaodroid vendor/lmodroid-priv/keys 

# Fix eror
rm -rf frameworks/base
rm -rf packages/services/Car
git clone --depth=1 https://github.com/AbuRider/platform_frameworks_base.git -b fifteen-qpr1 frameworks/base

# Export
export BUILD_USERNAME=yusup
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

# initiate build setup
. build/envsetup.sh
breakfast earth userdebug
mka bacon -j$(nproc --all)
