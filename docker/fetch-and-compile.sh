#!/bin/sh
set -e

minorGemsVersion=70
oneLifeVersion=70
oneLifeDataVersion=71

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
git checkout -q OneLife_v$minorGemsVersion


cd ../OneLife
git fetch
git checkout -q OneLife_v$oneLifeVersion


cd ../OneLifeData7
git fetch
git checkout -q OneLife_v$oneLifeDataVersion



cd ..


if [ ! -h animations ]
then
	ln -s OneLifeData7/animations .
fi


if [ ! -h categories ]
then
	ln -s OneLifeData7/categories .
fi


if [ ! -h ground ]
then
	ln -s OneLifeData7/ground .
fi


if [ ! -h music ]
then
	ln -s OneLifeData7/music .
fi


if [ ! -h objects ]
then
	ln -s OneLifeData7/objects .
fi


if [ ! -h sounds ]
then
	ln -s OneLifeData7/sounds .
fi


if [ ! -h sprites ]
then
	ln -s OneLifeData7/sprites .
fi


if [ ! -h transitions ]
then
	ln -s OneLifeData7/transitions .
fi


if [ ! -h dataVersionNumber.txt ]
then
	ln -s OneLifeData7/dataVersionNumber.txt .
fi


cd OneLife/server

./configure 1
make
ln -s ../../OneLifeData7/objects .
ln -s ../../OneLifeData7/transitions .
ln -s ../../OneLifeData7/categories .

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
