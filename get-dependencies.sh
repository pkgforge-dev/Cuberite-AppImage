#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm lua

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package cuberite-git

# If the application needs to be manually built that has to be done down here

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
echo "Getting app..."
echo "---------------------------------------------------------------"
wget https://download.cuberite.org/linux-$ARCH/Cuberite.tar.gz
mkdir -p ./cuberite
bsdtar -xvf Cuberite.tar.gz -C cuberite
rm -rf cuberite/favicon.png cuberite/LICENSE cuberite/ThirdPartyLicenses

mkdir -p ./AppDir/bin
mv -v cuberite/* ./AppDir/bin
