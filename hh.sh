#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/genesisosfork/manifest.git -b verve-qpr2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Genesis-15 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b keys vendor/lineage-priv/keys

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
breakfast earth userdebug
mka genesis 
