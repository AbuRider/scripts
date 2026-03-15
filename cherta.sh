#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init --depth=1 -u https://github.com/Project-CHerta/android_manifest.git -b 25h2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Cherta-25h2 device/xiaomi/earth
git clone https://github.com/AbuRider/vendor_xiaomi_earth.git -b 16.2 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b cip-staging kernel/xiaomi/earth

git clone https://github.com/AbuRider/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b keys2 vendor/lineage-priv/keys
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen-qpr2 vendor/mediatek/ims

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet

. build/envsetup.sh
breakfast earth userdebug
m cherta
