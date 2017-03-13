DROP SEQUENCE seq;
CREATE SEQUENCE seq;

TRUNCATE TABLE training;
PROMPT **********************************************
PROMPT Generating data. This operation takes a while.
PROMPT **********************************************
DECLARE
  value01 VARCHAR2(20);
  value02 NUMBER(8);
  value03 NUMBER(7,1);
  value04 VARCHAR2(20);
  value05 NUMBER(6,2);
  value06 NUMBER(6,2);
  value07 NUMBER(6,2);
BEGIN
  FOR i IN 1..100000 LOOP
    SELECT 'a' ||        FLOOR(DBMS_RANDOM.VALUE(0, 10)) INTO value01 FROM DUAL; -- a0 - a9
    SELECT 60 + 1 *      FLOOR(DBMS_RANDOM.VALUE(0, 10)) INTO value02 FROM DUAL; -- 60 - 69
    SELECT 1 + 0.1 *     FLOOR(DBMS_RANDOM.VALUE(0, 10)) INTO value03 FROM DUAL; -- 1 - 1.9
    SELECT 'b' ||        FLOOR(DBMS_RANDOM.VALUE(0, 10)) INTO value04 FROM DUAL; -- b0 - b9
    SELECT 0.3 + 0.01 *  FLOOR(DBMS_RANDOM.VALUE(0, 10)) INTO value05 FROM DUAL; -- 0.30 - 0.39
    SELECT 0.94 + 0.01 * FLOOR(DBMS_RANDOM.VALUE(0, 10)) INTO value06 FROM DUAL; -- 0.94 - 1.03
    SELECT 0.5 + 0.01 *  FLOOR(DBMS_RANDOM.VALUE(0, 10)) INTO value07 FROM DUAL; -- 0.50 - 0.59
    FOR i IN 1..1 LOOP
      INSERT INTO training VALUES (
        seq.nextval, value01, value02, value03, value04, value05, value06, value07, 0
      );
    END LOOP;
  END LOOP;
END;
/

SET PAGESIZE 50000
SET LINESIZE 200 

SELECT COUNT(*) FROM training;
SELECT * FROM training WHERE ROWNUM <= 10;

-- Random failure (0.1%)

INSERT INTO training
SELECT seq.nextval, value01, value02, value03, value04, value05, value06, 0.49, 1
FROM training SAMPLE(0.1);
COMMIT;

-- Artificial failure (10% when value06 = 0.94)

INSERT INTO training
SELECT seq.nextval, value01, value02, value03, value04, value05, value06, 0.49, 1
FROM training SAMPLE(10) WHERE value06 = 0.94;
COMMIT;

EXIT
