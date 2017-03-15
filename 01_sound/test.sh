#!/bin/bash

echo "*******************************"
echo "Loading sample data into HDFS.."
echo "*******************************"

hadoop fs -copyFromLocal sample/sound_0001.csv /user/oracle/sound
hadoop fs -ls /user/oracle/sound

echo "*********************"
echo "Creating Hive table.."
echo "*********************"

hive -f hql/table_sound.hql
hive -f hql/load_data.hql

echo "**************************"
echo "Creating database tables.."
echo "**************************"

export NLS_LANG=Japanese_Japan.AL32UTF8

sqlplus factory_iot/welcome1@orcl @sql/table_sound.sql
sqlplus factory_iot/welcome1@orcl @sql/table_device.sql

