#!/bin/bash

repo init -u https://github.com/Evolution-X/manifest -b bq2 --git-lfs
/opt/crave/resync.sh || repo sync

rm -rf device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b EvolutionX-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
m evolution
