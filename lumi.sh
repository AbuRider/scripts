#!/bin/bash
# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/LumineDroid/platform_manifest.git -b bynx --git-lfs
/opt/crave/resync.sh || repo sync

# Remove
rm -rf device/xiaomi/earth vendor/xiaomi/earth kernel/xiaomi/earth
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr
rm -rf vendor/lineage-priv/keys

# Clone Trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lumine-16 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.0 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

# Other Stuff's
git clone https://github.com/AbuRider/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b main vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=dnryd
export BUILD_HOSTNAME=pangokceria
export KBUILD_BUILD_USER=reina
export KBUILD_BUILD_HOST=zeroliner
export TZ="Asia/Jakarta"

# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
mka bacon
