DROP TABLE input01;
DROP TABLE input02;
DROP TABLE proc01;
DROP TABLE proc02;
DROP TABLE proc03;
DROP TABLE proc04;
DROP TABLE proc05;

CREATE TABLE input01 (
  id    NUMBER(20)
, value VARCHAR2(10)
);

CREATE TABLE input02 (
  id    NUMBER(20)
, value VARCHAR2(10)
);

CREATE TABLE proc01 (
  in_id  NUMBER(20)
, value  NUMBER(8)
, out_id NUMBER(20)
);

CREATE TABLE proc02 (
  in_id  NUMBER(20)
, value  NUMBER(8)
, out_id NUMBER(20)
);

CREATE TABLE proc03 (
  in_id  NUMBER(20)
, value  NUMBER(8)
, out_id NUMBER(20)
);

CREATE TABLE proc04 (
  in1_id NUMBER(20)
, in2_id NUMBER(20)
, value  NUMBER(8)
, out_id NUMBER(20)
);

CREATE TABLE proc05 (
  in_id  NUMBER(20)
, value  NUMBER(8)
, out_id NUMBER(20)
);

EXIT
