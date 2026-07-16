#!/bin/bash
rm -rf device/xiaomi/earth vendor/xiaomi/earth kernel/xiaomi/earth
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr

# init rom source 
repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-24.0 --git-lfs
/opt/crave/resync.sh # sync source

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b lineage-24.0 device/xiaomi/earth
git clone --depth=1 https://github.com/Kitauji-High-School/vendor_xiaomi_earth.git -b lineage-24.0 vendor/xiaomi/earth
git clone --depth=1 https://github.com/Kitauji-High-School/android_kernel_xiaomi_earth.git -b staging kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-24.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-24.0 device/mediatek/sepolicy_vndr
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen-qpr2 vendor/mediatek/ims

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug
make installclean
m bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*202607*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/boot.img ; ./upload.sh out/target/product/earth/*202607*.zip
fi
echo "kkkkk"
