#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init --depth=1 -u https://github.com/Kitauji-High-School/pixelos_manifest.git -b sixteen-qpr2 --git-lfs
/opt/crave/resync.sh # sync source 

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b PixelOS-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
breakfast earth userdebug
m pixelos

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "hame"
