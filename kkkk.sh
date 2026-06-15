#!/bin/bash

# init source
repo init --depth=1 -u https://github.com/LumineDroid/platform_manifest.git -b bellflower --git-lfs
/opt/crave/resync.sh # sync source 

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lumine-16.2 device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/vendor_xiaomi_earth.git -b 16.2 vendor/xiaomi/earth
git clone --depth=1 https://github.com/Kitauji-High-School/android_kernel_xiaomi_earth.git -b 16.2 kernel/xiaomi/earth
git clone https://github.com/AbuRider/sign.git -b keys2 vendor/lineage-priv/keys

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.2 device/mediatek/sepolicy_vndr
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen-qpr2 vendor/mediatek/ims

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch earth-bp4a-userdebug
mka bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*bellflower*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "kkkkk"
