#!/bin/bash
# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/laineageos/android.git -b lineage-22.2 --git-lfs
/opt/crave/resync.sh || repo sync

# Cloning Trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b lineage-22.2 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth
git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b main vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=altosaxophone

# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp1a-userdebug
mka bacon
