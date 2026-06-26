#!/bin/bash

# init source
repo init --depth=1 -u https://github.com/Evolution-X/manifest -b cnb --git-lfs
/opt/crave/resync.sh # crave repo sync

# Device stuff's
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b lineage-24.0 device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/vendor_xiaomi_earth.git -b 17.0 vendor/xiaomi/earth
git clone --depth=1 https://github.com/Kitauji-High-School/android_kernel_xiaomi_earth.git -b 16.2 kernel/xiaomi/earth

# Hardware & other stuff's
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.2 device/mediatek/sepolicy_vndr
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen-qpr2 vendor/mediatek/ims
git clone https://github.com/Kitauji-High-School/Ensemble.git -b evox vendor/evolution-priv/keys

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug
m evolution
