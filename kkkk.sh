#!/bin/bash

git clone https://github.com/LineageOS/android_packages_apps_FMRadio.git -b lineage-23.2 packages/apps/FMRadio

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch earth-bp4a-userdebug
make installclean
mka bacon

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*bellflower*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "kkkkk"
