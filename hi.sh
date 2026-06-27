#!/bin/bash

# init source
# repo init --depth=1 -u https://github.com/Evolution-X/manifest -b cnb --git-lfs
# /opt/crave/resync.sh # crave repo sync

rm -rf hardware/mediatek
git clone https://github.com/Kitauji-High-School/android_hardware_mediatek.git -b lineage-24.0 hardware/mediatek

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug
make installclean
m evolution
