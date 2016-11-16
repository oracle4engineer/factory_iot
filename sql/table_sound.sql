DROP TABLE sound;

CREATE TABLE sound (
  id          NUMBER(20)
, device      VARCHAR2(255)
, time_start  VARCHAR2(255)
, time_end    VARCHAR2(255)
, ff          NUMBER(10,2)
, energy      NUMBER(10,2)
, temperature NUMBER(10,2)
, humidity    NUMBER(10,2)
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
COL ff FOR a20

SELECT device, time_start, ff
FROM sound
WHERE device = 'device01'
AND ROWNUM <= 10;

EXIT
