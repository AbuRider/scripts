#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 16-qpr0 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Sakura-16.0 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.0 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b sakura vendor/sakura-priv/keys

rm -rf hardware/lineage/interfaces
git clone https://github.com/LineageOS/android_hardware_lineage_interfaces.git -b lineage-23.0 hardware/lineage/interfaces

export BUILD_USERNAME=miyazono
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
mka bacon
