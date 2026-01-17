#!/bin/bash

# Export
export BUILD_USERNAME=miyazono
export BUILD_HOSTNAME=wind_orchestra
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export ALLOW_MISSING_DEPENDENCIES=true

# starts build setup !
. build/envsetup.sh
lunch clover_earth-bp4a-userdebug
make installclean
mka clover
