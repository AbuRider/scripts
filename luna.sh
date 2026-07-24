#!/bin/bash

# init rom source 
repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs --depth=1
/opt/crave/resync.sh # sync source

# Device sources
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth

# Pathing Frameworks base
cd frameworks/base
curl -LSs "https://github.com/Kitauji-High-School/frameworks_base_lunaris/commit/6e3c8d137395ab002ae7060a6ead8678749d3430.patch" -o fwb.patch ; patch -p1 < fwb.patch
cd ../..

# Patching vendor/lineage
cd vendor/lineage
curl -LSs "https://github.com/Kitauji-High-School/vendor_lineage/commit/2a627f812f97556ef9222d9b3b3a3259db936303.patch" -o vendor.patch ; patch -p1 < vendor.patch
cd ../..

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
