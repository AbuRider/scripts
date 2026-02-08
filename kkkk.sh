#!/bin/bash
rm -rf device/xiaomi/earth
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-16.2 device/xiaomi/earth

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
m evolution
