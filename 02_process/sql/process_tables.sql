DROP TABLE proc01;
DROP TABLE proc02;
DROP TABLE proc03;
DROP TABLE proc04;
DROP TABLE proc05;

CREATE TABLE proc01 (
  input VARCHAR2(10)
, value NUMBER(8)
, out_id NUMBER(10)
);

CREATE TABLE proc02 (
  in_id  NUMBER(10)
, value  NUMBER(1)
, out_id NUMBER(10)
);

CREATE TABLE proc03 (
  input  NUMBER(10)
, value NUMBER(1)
, out_id NUMBER(10)
);

CREATE TABLE proc04 (
  in01_id NUMBER(10)
, in02_id NUMBER(10)
, value NUMBER(1)
, out_id NUMBER(10)
);

CREATE TABLE proc05 (
  in_id  NUMBER(10)
, value NUMBER(1)
, out_id NUMBER(10)
);

EXIT
