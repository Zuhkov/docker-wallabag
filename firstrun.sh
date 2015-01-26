#!/bin/bash

# Check if database  exists. If not, copy in the starter database
if [ -f /var/www/wallabag/db/poche.sqlite ]; then
  echo "Using existing sqlite database file."
else
  echo "Creating config from template."
  mv /var/www/wallabag/firstrun/poche.sqlite /var/www/wallabag/db/poche.sqlite
  chown www-data:www-data -R /var/www/wallabag/db
  chmod 755 -R /var/www/wallabag/db
fi