#!/bin/bash
# Remove Clang
rm -rf prebuilts/clang/host/linux-x86
# repo init
repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs
# sync
/opt/crave/resync.sh || repo sync
# rm
rm -rf device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr
rm -rf vendor/lineage-priv/keys
# Clone trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Matrixx device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b upstream kernel/xiaomi/earth
# other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b matrixx vendor/lineage-priv/keys
# Fix eror
rm -rf hardware/lineage/interfaces
git clone https://github.com/LineageOS/android_hardware_lineage_interfaces.git -b lineage-22.2 hardware/lineage/interfaces
# Export
export BUILD_USERNAME=rion
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"
# starts build setup !
. build/envsetup.sh
brunch earth userdebug
