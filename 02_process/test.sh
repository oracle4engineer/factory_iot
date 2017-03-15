#!/bin/bash

sqlplus factory_iot/welcome1@orcl @sql/training_table.sql
sqlplus factory_iot/welcome1@orcl @sql/training_data.sql

sqlplus factory_iot/welcome1@orcl @sql/process_tables.sql
