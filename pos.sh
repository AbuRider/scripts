#!/bin/bash

repo init -u https://github.com/Kitauji-High-School/pixelos_manifest.git -b sixteen-qpr2 --git-lfs
/opt/crave/resync.sh || repo sync

rm -rf device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b PixelOS-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
breakfast earth userdebug
make installclean
m pixelos
