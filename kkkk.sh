#!/bin/bash

# init source
repo init --depth=1 -u https://github.com/ProjectMatrixx/android -b 16.2 --git-lfs
/opt/crave/resync.sh # sync source 

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Matrixx-16.2 device/xiaomi/earth

# Custom source 
rm -rf packages/apps/Launcher3
git clone https://github.com/AbuRider/packages_apps_Launcher3-Matrixx.git -b 16.2 packages/apps/Launcher3

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch matrixx_earth-bp4a-userdebug
mka matrixx

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*12.4*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "kkkkk"
