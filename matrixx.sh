#!/bin/bash
# fix eror
rm -rf prebuilts/clang/host/linux-x86
# repo init rom
repo init -u https://github.com/AbuRider/android_manifest_matrixx.git -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="
# sync
/opt/crave/resync.sh || repo sync
echo "============="
echo "Sync success"
echo "============="
# Cloning trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Matrixx-14 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth
# Other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b main vendor/lineage-priv/keys
# Export
export BUILD_USERNAME=mugis
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta
# initiate build setup
. build/envsetup.sh
brunch earth
