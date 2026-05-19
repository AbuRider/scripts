#!/bin/bash
cd frameworks/base
git restore .
cd ../..

repo init -u https://github.com/Kitauji-High-School/matrixx_manifest -b 15.0 --git-lfs
/opt/crave/resync.sh || repo sync

# git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Matrixx-15 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch lineage_earth-bp1a-userdebug
make installclean
mka bacon
