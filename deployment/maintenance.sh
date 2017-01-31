#!/bin/bash -x

# if the DB already exist, we assume that we should run the update/maintenance
existingTable=$(mysql --host=$DBHOST --user=$DBUSERNAME --password=$DBPASSWORD -N -B --execute="SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$DBNAME'")
if [ "$existingTable" == "$DBNAME" ]; then
  pushd /var/www/html
  drush vset --exact maintenance_mode 1 drush cache-clear all
  drush pm-update drupal
  drush vset --exact maintenance_mode 0 drush cache-clear all
  popd
fi


