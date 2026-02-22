#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/LumineDroid/platform_manifest -b bellflower --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lumine-16.2 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.2 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16.2-staging kernel/xiaomi/earth

git clone https://github.com/AbuRider/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/AbuRider/android_device_mediatek_sepolicy_vndr.git -b Lumine device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b lumine vendor/lumine-priv/keys

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
lunch earth-bp4a-userdebug
mka bacon 
