#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/AndroidOne-Experience/manifest.git -b 15 --git-lfs
/opt/crave/resync.sh # sync source 

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b AO-15 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch aosp_earth-bp1a-userdebug
mka bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*.zip ]; then
    wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
    chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "hame"
