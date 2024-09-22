#!/bin/sh
set -ex

cd /build

### Checkout and patch minorGems ###
cd /build
git clone https://github.com/jasonrohrer/minorGems.git
cd minorGems
git fetch --tags
minorGemsVersion=$(git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//')
git checkout -q OneLife_v$minorGemsVersion

for patch in /build/patches/minorGems/*.patch; do
	if [ -e $patch ]; then
		echo Applying minorGems patch: $patch
		git apply $patch
	fi
done

### Checkout and patch OneLife ###
cd /build
git clone https://github.com/jasonrohrer/OneLife.git
cd OneLife
git fetch --tags
oneLifeVersion=$(git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//')
git checkout -q OneLife_v$oneLifeVersion

for patch in /build/patches/OneLife/*.patch; do
	if [ -e $patch ]; then
		echo Applying OneLife patch: $patch
		git apply $patch
	fi
done

### Checkout and patch OneLifeData7 ###
cd /build
git clone https://github.com/jasonrohrer/OneLifeData7.git
cd OneLifeData7
git fetch --tags
oneLifeDataVersion=$(git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//')
git checkout -q OneLife_v$oneLifeDataVersion

for patch in /build/patches/OneLifeData/*.patch; do
	if [ -e $patch ]; then
		echo Applying OneLifeData patch: $patch
		git apply $patch
	fi
done

### Compile the server ###
cd /build/OneLife/server

./configure 1
make
./makeDBConvert

echo $oneLifeVersion >serverCodeVersionNumber.txt
mkdir data
mkdir data/settings

### Copy the files the server will actually need from /build to /dist ###
mkdir /dist
mkdir /dist/OneLife
cp -R /build/OneLife/server /dist/OneLife/server
cp -R /build/OneLifeData7/contentSettings /dist/OneLife/server

mkdir /dist/OneLifeData7
cp -R /build/OneLifeData7/categories /dist/OneLifeData7/categories
cp -R /build/OneLifeData7/objects /dist/OneLifeData7/objects
cp -R /build/OneLifeData7/transitions /dist/OneLifeData7/transitions
cp -R /build/OneLifeData7/dataVersionNumber.txt /dist/OneLifeData7/dataVersionNumber.txt

latestVersion=$oneLifeVersion
if [ $oneLifeDataVersion -gt $oneLifeVersion ]; then
	latestVersion=$oneLifeDataVersion
fi
echo $latestVersion >/dist/versionNumber.txt

mkdir /dist/lib
ldd /dist/OneLife/server/OneLifeServer | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' /dist/lib
