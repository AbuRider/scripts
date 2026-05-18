#!/bin/bash

# repo init -u https://github.com/Kitauji-High-School/matrixx_manifest -b 15.0 --git-lfs
# /opt/crave/resync.sh || repo sync

# git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Matrixx-15 device/xiaomi/earth

cd frameworks/base
curl -LSs "https://github.com/LineageOS/android_frameworks_base/commit/bf9e58d7edb5b0a5a55baf9af47ff67a528109c3.patch" -o fwb.patch
patch -p1 < fwb.patch ; cd ../..

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch lineage_earth-bp1a-userdebug
make installclean
mka bacon
