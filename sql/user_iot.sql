--
-- This script is based on execises/setup/setup_cdb.sql of Big Data Hands-on.
--

connect / as SYSDBA

alter session set container=orcl;



drop user iot cascade;

drop tablespace iot;

CREATE TABLESPACE iot DATAFILE '/u01/app/oracle/oradata/cdb/orcl/iot.dbf' SIZE 250M reuse AUTOEXTEND ON nologging;
CREATE USER iot
      IDENTIFIED BY welcome1
      CONTAINER=CURRENT
      DEFAULT TABLESPACE iot
      QUOTA UNLIMITED ON iot;
  
GRANT create procedure, create session, advisor, olap_user, unlimited tablespace to iot CONTAINER=CURRENT; 


grant execute on SYS.UTL_FILE to iot;
create or replace directory OSCH_BIN_PATH as '/u01/connectors/osch/bin';

grant CREATE ANY DIRECTORY to iot;
grant read, execute on directory OSCH_BIN_PATH to iot;

GRANT CREATE MINING MODEL TO iot;
GRANT RQADMIN to iot;


connect iot/welcome1@orcl

create or replace directory EXTERNAL_DIR as '/home/oracle/exercises/OSCH/etc';

--@ORA_CRM

exit

