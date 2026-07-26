#!/bin/bash

# init rom source 
repo init -u https://github.com/Pixelify-AOSP/platform_manifest -b 17 --git-lfs --depth=1
/opt/crave/resync.sh # sync source

# Device sources
rm -rf device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b ASCP-17 device/xiaomi/earth
# git clone https://github.com/LineageOS/android_packages_apps_FMRadio.git -b lineage-23.2 packages/apps/FMRadio

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch earth-cp2a-userdebug
mka bacon 

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*202607*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/boot.img ; ./upload.sh out/target/product/earth/*202607*.zip
fi
echo "kkkkk"
