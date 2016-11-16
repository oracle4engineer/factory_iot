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

# Data Miner

Open SQL Developer

```sh
$ /opt/oracle/sqldeveloper/sqldeveloper.sh
```

Create the connection for 'iot' user at Connections tab.

Create the connection for 'iot' user at Data Miner tab.

Configure the required priviledges.

Create a Project.

Import the workflow selecting 'sqldev/workflow.xml'.





