#!/bin/bash

# init source
# repo init --depth=1 -u https://github.com/Evolution-X/manifest -b cnb --git-lfs
# /opt/crave/resync.sh # crave repo sync

# rm -rf hardware/mediatek
# git clone https://github.com/Kitauji-High-School/android_hardware_mediatek.git -b lineage-24.0 hardware/mediatek

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug
m evolution

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/*202606*.zip
fi
echo "kkkkk"
