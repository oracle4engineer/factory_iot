#!/bin/bash

hadoop fs -copyFromLocal sample/sound_0001.csv /user/oracle/sound
hadoop fs -ls /user/oracle/sound

hive -f hql/table_sound.hql
hive -f hql/load_data.hql

export NLS_LANG=Japanese_Japan.AL32UTF8

sqlplus iot/welcome1@orcl @sql/table_sound.sql
sqlplus iot/welcome1@orcl @sql/table_device.sql

