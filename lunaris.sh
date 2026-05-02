#!/bin/bash

rm -rf device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
m bacon
