#!/bin/bash

# Clean up old directory (Notes: Use it if necessary!)
rm -rf .repo/local_manifests
rm -rf device/xiaomi/earth vendor/lineage-priv/keys # vendor/xiaomi/earth kernel/xiaomi/earth
# rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr

# init rom source 
# repo init --depth=1 -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs
# /opt/crave/resync.sh # sync source

# Device sources
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth

# Edited sources 
# rm -rf vendor/lineage
# git clone --depth=1 https://github.com/SilverEuphonium/vendor_lineage.git -b 16.2 vendor/lineage

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean 
m bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*202607*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/boot.img ; ./upload.sh out/target/product/earth/*202607*.zip
fi
echo "kkkkk"
