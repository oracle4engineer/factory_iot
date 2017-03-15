DROP TABLE training;
CREATE TABLE training (
  id      NUMBER(10) NOT NULL
, value01 VARCHAR2(10)
, value02 NUMBER(8)
, value03 NUMBER(7,1)
, value04 VARCHAR2(10)
, value05 NUMBER(6,2)
, value06 NUMBER(6,2)
, value07 NUMBER(6,2)
, defect NUMBER(1)
);
ALTER TABLE training ADD CONSTRAINT training_pk PRIMARY KEY (id);

EXIT
