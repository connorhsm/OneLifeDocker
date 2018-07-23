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
ln -s ../../OneLifeData7/objects .
ln -s ../../OneLifeData7/transitions .
ln -s ../../OneLifeData7/categories .
ln -s ../../OneLifeData7/tutorialMaps .
ln -s ../../OneLifeData7/dataVersionNumber.txt .
echo $oneLifeVersion > serverCodeVersionNumber.txt
echo $latestVersion > versionNumber.txt

mkdir db

ln -s db/biome.db .
ln -s db/eve.db .
ln -s db/floor.db .
ln -s db/floorTime.db .
ln -s db/lookTime.db .
ln -s db/map.db .
ln -s db/mapTime.db .
ln -s db/playerStats.db .
ln -s db/recentPlacements.txt .
ln -s db/settings/nextPlayerID.ini .
ln -s db/settings/sequenceNumber.ini .

cp -r settings default-settings
