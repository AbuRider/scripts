#!/bin/bash

# init rom source 
repo init --depth=1 -u https://github.com/Evolution-X/manifest -b cnb --git-lfs
/opt/crave/resync.sh # sync source

# Device sources
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b EvolutionX-17.0 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug 
m evolution

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*202607*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/boot.img ; ./upload.sh out/target/product/earth/*202607*.zip
fi
echo "kkkkk"
