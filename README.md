# Factory IoT

The scripts are tested on [Big Data Lite VM 4.5.0](http://www.oracle.com/technetwork/database/bigdata-appliance/oracle-bigdatalite-450-3300689.html)

## Big Data SQL

Startup Oracle Database.

```sh
$ lsnrctl start
$ export $ORACLE_SID=cdb
$ sqlplus / as sysdba
```

```sql
SQL> startup
SQL> ALTER PLUGGABLE DATABASE orcl OPEN;
SQL> ALTER SESSION SET CONTAINER = orcl;
```

Create 'iot' user on the database.

```sql
SQL> sqlplus / as sysdba @sql/user_iot.sql
```

Run the test script.

```sh
$ export NLS_LANG=Japanese_Japan.AL32UTF8
$ sh test.sh
```

## Data Miner

Open SQL Developer

```sh
$ /opt/oracle/sqldeveloper/sqldeveloper.sh
```

* To create the connection for 'iot' user, import ./sqldeveloper/connection.xml (password: welcome1) at Connections tab.
* Create the connection for 'iot' user at Data Miner tab, and double click the new connection.
* Configure the required priviledges when the user connect to Data Miner first time.
* Create a project 'Factory IoT' and import the workflow selecting ./sqldeveloper/workflow.xml.

