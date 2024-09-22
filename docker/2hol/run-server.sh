#!/bin/sh

cd /usr/OneLife/server

# check config
if [ ! -d "data/settings" ]; then
	mkdir data/settings
fi

for f in $(ls settings/* *Names.txt); do
	if [ ! -e "data/$f" ]; then
		echo "creating default config $f"
		cp "$f" "data/$f"
	fi
done

cd data

ln -s /usr/OneLifeData7/objects .
ln -s /usr/OneLifeData7/transitions .
ln -s /usr/OneLifeData7/categories .
ln -s /usr/OneLifeData7/tutorialMaps .
ln -s /usr/OneLifeData7/dataVersionNumber.txt .
ln -s /usr/OneLife/server/serverCodeVersionNumber.txt .

../OneLifeServer
