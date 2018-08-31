#!/bin/sh
set -e

if [ ! -e minorGems ]
then
	git clone https://github.com/jasonrohrer/minorGems.git
fi

if [ ! -e OneLife ]
then
	git clone https://github.com/jasonrohrer/OneLife.git
fi

if [ ! -e OneLifeData7 ]
then
	git clone https://github.com/jasonrohrer/OneLifeData7.git
fi


cd minorGems
git fetch --tags
minorGemsVersion=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//'`
git checkout -q OneLife_v$minorGemsVersion

for patch in /opt/patches/minorGems/*.patch
do
	if [ -e $patch ]
	then
		echo Applying minorGems patch: $patch
		git apply $patch
	fi
done

cd ../OneLife
git fetch --tags
oneLifeVersion=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//'`
git checkout -q OneLife_v$oneLifeVersion

for patch in /opt/patches/OneLife/*.patch
do
	if [ -e $patch ]
	then
		echo Applying OneLife patch: $patch
		git apply $patch
	fi
done

cd ../OneLifeData7
git fetch --tags
oneLifeDataVersion=`git for-each-ref --sort=-creatordate --format '%(refname:short)' --count=1 refs/tags/OneLife_v* | sed -e 's/OneLife_v//'`
git checkout -q OneLife_v$oneLifeDataVersion

for patch in /opt/patches/OneLifeData/*.patch
do
	if [ -e $patch ]
	then
		echo Applying OneLifeData patch: $patch
		git apply $patch
	fi
done

latestVersion=$oneLifeVersion


if [ $oneLifeDataVersion -gt $oneLifeVersion ]
then
	latestVersion=$oneLifeDataVersion
fi


cd ../OneLife/server

./configure 1
make
./makeDBConvert

echo $oneLifeVersion > serverCodeVersionNumber.txt
echo $latestVersion > /opt/versionNumber.txt

mkdir data
mkdir data/settings
