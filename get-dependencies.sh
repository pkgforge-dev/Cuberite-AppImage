#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm lua51

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Getting app..."
echo "---------------------------------------------------------------"
wget https://download.cuberite.org/linux-$ARCH/Cuberite.tar.gz
mkdir -p ./cuberite
bsdtar -xvf Cuberite.tar.gz -C cuberite
rm -rf cuberite/favicon.png cuberite/LICENSE cuberite/ThirdPartyLicenses
VERSION="r$(grep -oP '#\K\d+' cuberite/buildinfo.txt)"
echo "$VERSION" > ~/version

mkdir -p ./AppDir/bin
mv -v cuberite/* ./AppDir/bin
