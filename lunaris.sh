#!/bin/bash

rm -rf device/xiaomi/earth vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth
git clone https://github.com/AbuRider/vendor_xiaomi_earth.git -b 16.2 vendor/xiaomi/earth
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen-qpr2 vendor/mediatek/ims

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
m bacon
