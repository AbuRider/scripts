#!/bin/bash

# Fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/PixelExperience-LEGACY-edition/manifest.git -b thirteen-plus --depth=1 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "============="
echo "Sync success"
echo "============="

# clone trees bg
rm -rf device/xiaomi/earth
rm -rf kernel/xiaomi/earth
rm -rf vendor/xiaomi/earth
rm -rf hardware/xiaomiearthrf hardware/mediatek
rm -rf device/mediatek/sepolicy_vndr
rm -rf vendor/priv-keys

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b pixelexp device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-20 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/AbuRider/android_hardware_xiaomi.git -b lineage-20 hardware/xiaomi

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-20 hardware/mediatek

git clone https://github.com/AbuRider/android_device_mediatek_sepolicy_vndr.git -b lineage-20 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/sign_keys_priv.git -b pissel vendor/priv-keys

# sepol 
rm -rf system/sepolicy
git clone --depth=1 https://github.com/AbuRider/system_sepolicy.git -b thirteen system/sepolicy

# Export
export BUILD_USERNAME=yusup
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= ExpExportne ======"

# initiate build setup
. build/envsetup.sh
lunch aosp_earth-userdebug
mka bacon -j$(nproc --all)
