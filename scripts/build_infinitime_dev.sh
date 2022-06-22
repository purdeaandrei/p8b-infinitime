#!/usr/bin/env bash

TARGET=${1:-pinetime}
echo "Using target $TARGET"
cd "${0%/*}"

cd ../InfiniTime
mkdir -p build
cd build

COMMON_OPTIONS="-DCMAKE_BUILD_TYPE=Release -DARM_NONE_EABI_TOOLCHAIN_PATH=$ARM_NONE_EABI_TOOLCHAIN_PATH -DNRF5_SDK_PATH=$NRF5_SDK_PATH -DUSE_JLINK=1 -DNRFJPROG=/usr/bin/nrfjprog -DBUILD_DFU=1"
if [ "$TARGET" = "pinetime" ]; then
    cmake -DTARGET_DEVICE=PINETIME $COMMON_OPTIONS ..
elif [ "$TARGET" = "p8" ] || [ "$TARGET" = "p8b" ]; then
    cmake -DTARGET_DEVICE=P8B $COMMON_OPTIONS ..
elif [ "$TARGET" = "p8a" ]; then
    cmake -DTARGET_DEVICE=P8A $COMMON_OPTIONS ..
fi

make -j$(nproc) pinetime-app