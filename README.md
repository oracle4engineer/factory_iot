# Factory IoT

The scripts are tested on [Big Data Lite VM 4.9.0](http://www.oracle.com/technetwork/database/bigdata-appliance/oracle-bigdatalite-2104726.html)

Clone this repository, and move to the directory.

    $ git clone https://github.com/oracle4engineer/factory_iot.git
    $ cd factory_iot

Startup Oracle Database.

    $ lsnrctl start
    $ export ORACLE_SID=cdb
    $ sqlplus / as sysdba

    SQL> startup
    SQL> ALTER PLUGGABLE DATABASE orcl OPEN; -- if not open yet
    SQL> ALTER SESSION SET CONTAINER = orcl;

Create 'factory_iot' user on the database.

    $ sqlplus / as sysdba @00_common/sql/user.sql

Open SQL Developer

    $ /opt/oracle/sqldeveloper/sqldeveloper.sh

* To create the connection for 'factory_iot' user, import 00_common/sqldeveloper/connection.xml (password: welcome1) at Connections tab.
* Create the connection for 'factory_iot' user at Data Miner tab, and double click the new connection.
* Configure the required priviledges when the user connect to Data Miner first time.
* Create a project 'Factory IoT'.

## #01 Sound

Run the test script.

    $ cd 01_sound
    $ export NLS_LANG=Japanese_Japan.AL32UTF8
    $ sh test.sh

Import and run the workflow "Detect Anomaly with Sound" on Data Miner GUI.

    01_sound/sqldeveloper/workflow.xml

## #02 Process

Run the test script.

    $ cd 02_process
    $ sh test.sh

Import and run the workflow "Detect Causing Processes" on Data Miner GUI.

    02_process/sqldeveloper/workflow.xml
