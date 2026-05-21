#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs
/opt/crave/resync.sh # sync source 

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth

rm -rf packages/apps/Launcher3
git clone https://github.com/AbuRider/packages_apps_Launcher3.git -b 16.2 packages/apps/Launcher3

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
m bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*.zip ]; then
    wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
    chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "hame"
