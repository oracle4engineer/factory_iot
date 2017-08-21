
CREATE OR REPLACE DIRECTORY EXTERNAL_DIR AS '/home/oracle/factory_iot';

DROP TABLE sound;

CREATE TABLE sound (
  device      VARCHAR2(255)
, time_serial NUMBER(20)
, time_start  VARCHAR2(255)
, time_end    VARCHAR2(255)
, frequency   NUMBER(10,2)
, energy      NUMBER(10,2)
, temperature NUMBER(10,2)
, humidity    NUMBER(10,2)
, anomaly     NUMBER(1)
)
ORGANIZATION EXTERNAL (
  TYPE ORACLE_HIVE
  DEFAULT DIRECTORY "EXTERNAL_DIR"
  ACCESS PARAMETERS (
    com.oracle.bigdata.tablename=default.sound
  )
);

COL device FOR a20
COL time_start FOR a20

SELECT device, time_start, frequency
FROM sound
WHERE device = 'device01'
AND ROWNUM <= 10;

EXIT
