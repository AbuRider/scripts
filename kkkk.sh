#!/bin/bash

# init source
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh # sync source 

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Infinity-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch infinity_earth-userdebug
m bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*3.11*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "hame"
