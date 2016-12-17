#!/bin/bash

export ARCH=arm
export CROSS_COMPILE="/home/sattarvoybek/dev/kernel/Prebuilts/arm-eabi-4.9/bin/arm-eabi-"


make msm8926-NX404J_defconfig
make -j16

make INSTALL_MOD_STRIP=--strip-unneeded INSTALL_MOD_PATH=out/system INSTALL_MOD_DIR=out/system android_modules_install

./dtbToolCM -2 -o ./out/dt.img -s 2048 -p ./scripts/dtc/ ./arch/arm/boot/

cp ./arch/arm/boot/zImage ./out/zImage

