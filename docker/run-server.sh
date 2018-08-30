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
unbuffer ../OneLifeServer
