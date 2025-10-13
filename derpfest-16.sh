#!/bin/bash
# fix eror
rm -rf prebuilts/clang/host/linux-x86
# repo init rom
repo init -u https://github.com/AviumUI/android_manifests -b avium-15 --git-lfs
# sync
/opt/crave/resync.sh || repo sync
# Clone Trees
git clone https://github.com/AbuRider/device_xiaomi_earth.git -b Avium device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-23.0 kernel/xiaomi/earth
# Other Stuff's
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys -b main vendor/lineage-priv/keys
# Export
export BUILD_USERNAME=dnryd
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta
# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp1a-userdebug
mka bacon -j$(nproc --all)
