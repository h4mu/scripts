#!/bin/bash

ZIPFILE=/tmp/ndk.zip
if [ $# -eq 0 ]
then
    echo "Usage ./custom-ndk.sh <toolchain> <platform> [keepzip]"
    echo "Example: ./custom-ndk.sh x86-4.9 android-12"
    if [[ -f "$ZIPFILE" ]]; then
        echo "Available:"
        unzip -l "$ZIPFILE" | grep 'android-ndk-r12b\/\(toolchains\|platforms\)\/.' | awk -F / '{ print $2 ": " $3 }' | uniq
    fi
    exit
fi
TOOLCHAIN=$1
PLATFORM=$2

if [[ ! -f "$ZIPFILE" ]]; then
    wget http://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip -O "$ZIPFILE"
fi

unzip $ZIPFILE \
android-ndk-r12b/toolchains/$TOOLCHAIN/* \
android-ndk-r12b/prebuilt/* \
android-ndk-r12b/ndk-depends \
android-ndk-r12b/shader-tools/* \
android-ndk-r12b/ndk-stack \
android-ndk-r12b/ndk-which \
android-ndk-r12b/build/awk/* \
android-ndk-r12b/build/core/toolchains/$TOOLCHAIN/* \
android-ndk-r12b/build/core/*.mk \
android-ndk-r12b/build/lib/* \
android-ndk-r12b/build/tools/* \
android-ndk-r12b/build/__init__.py \
android-ndk-r12b/build/NOTICE \
android-ndk-r12b/build/gmsl/* \
android-ndk-r12b/build/repo.prop \
android-ndk-r12b/build/ndk-build \
android-ndk-r12b/ndk-gdb \
android-ndk-r12b/platforms/$PLATFORM/* \
android-ndk-r12b/sources/cxx-stl/stlport/* \
android-ndk-r12b/sources/cxx-stl/gnu-libstdc++/* \
android-ndk-r12b/sources/cxx-stl/system/* \
android-ndk-r12b/sources/cxx-stl/gabi++/* \
android-ndk-r12b/source.properties \
android-ndk-r12b/python-packages/* \
android-ndk-r12b/ndk-build

if [[ -z "$3" ]]; then
    rm "$ZIPFILE"
fi

#curl https://dl.google.com/android/android-sdk_r22.3-linux.tgz | tar xz
#cd android-sdk-linux/
#./tools/android update sdk -t 2,3,12 --no-ui
#sudo apt-get update
#sudo apt-get install zlib1g:i386 default-jdk
#wget https://dl-ssl.google.com/android/repository/sys-img/android/sysimg_x86-17_r02.zip
