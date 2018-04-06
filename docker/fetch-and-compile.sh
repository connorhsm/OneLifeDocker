#!/bin/sh
set -e

minorGemsVersion=OneLife_v72
oneLifeVersion=OneLife_v72
oneLifeDataVersion=OneLife_v73

echo "Version ${oneLifeVersion}.${minorGemsVersion}.${oneLifeDataVersion}"

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
git fetch
git checkout -q $minorGemsVersion


cd ../OneLife
git fetch
git checkout -q $oneLifeVersion


cd ../OneLifeData7
git fetch
git checkout -q $oneLifeDataVersion



cd ../OneLife/server

./configure 1
make
ln -s ../../OneLifeData7/objects .
ln -s ../../OneLifeData7/transitions .
ln -s ../../OneLifeData7/categories .
ln -s ../../OneLifeData7/dataVersionNumber.txt .

mkdir db

ln -s db/biome.db .
ln -s db/eve.db .
ln -s db/floor.db .
ln -s db/floorTime.db .
ln -s db/map.db .
ln -s db/mapTime.db .
ln -s db/playerStats.db .
ln -s db/recentPlacements.txt .
ln -s db/settings/nextPlayerID.ini .
ln -s db/settings/sequenceNumber.ini .
