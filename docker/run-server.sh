#!/bin/sh

cd /opt/OneLife/server/

# check config
for f in $(ls default-settings); do
  if [ ! -e "settings/$f" ]; then
   echo "creating default config $f"
   cp "default-settings/$f" "settings/$f"
  fi
done

./OneLifeServer
