#!/bin/bash

# init rom source 
repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-24.0 --git-lfs
/opt/crave/resync.sh # sync source

# Device sources
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b lineage-24.0 device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/vendor_xiaomi_earth.git -b lineage-24.0 vendor/xiaomi/earth --depth=1
git clone https://github.com/Kitauji-High-School/android_kernel_xiaomi_earth.git -b staging kernel/xiaomi/earth --depth=1
git clone https://github.com/AbuRider/sign.git -b keys3 vendor/lineage-priv/keys

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-24.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-24.0 device/mediatek/sepolicy_vndr
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen-qpr2 vendor/mediatek/ims

# Patching build/soong
cd build/soong
curl -LSs "https://github.com/Kitauji-High-School/android_build_soong_lineage/commit/0187e50b176d2fa7d13d9a9e058694b5e0e06e6d.patch" -o soong1.patch ; patch -p1 < soong1.patch
curl -LSs "https://github.com/Kitauji-High-School/android_build_soong_lineage/commit/df4d2597f4aec5740ed3576ef95b674b9ea7be84.patch" -o soong2.patch ; patch -p1 < soong2.patch
cd ../..

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug 
m bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*202607*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/boot.img ; ./upload.sh out/target/product/earth/*202607*.zip
fi
echo "kkkkk"
