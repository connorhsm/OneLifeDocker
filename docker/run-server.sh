#!/bin/sh

cd /opt/OneLife/server

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

ln -s /opt/OneLifeData7/objects .
ln -s /opt/OneLifeData7/transitions .
ln -s /opt/OneLifeData7/categories .
ln -s /opt/OneLifeData7/tutorialMaps .
ln -s /opt/OneLifeData7/dataVersionNumber.txt .
ln -s /opt/OneLife/server/serverCodeVersionNumber.txt .

../OneLifeServer
