
DROP FUNCTION norminv;
CREATE OR REPLACE FUNCTION norminv(
	p     IN NUMBER,
	mu    IN NUMBER, 
	sigma IN NUMBER
) RETURN NUMBER
IS
	q   NUMBER;
	r   NUMBER;
	val NUMBER;
BEGIN
	IF p < 0 OR p > 1 THEN
		raise_application_error(-20100, 'The probality p must be bigger than 0 and smaller than 1');
	END IF;
	IF sigma < 0 THEN
		raise_application_error(-20100, 'The standard deviation sigma must be positive');
	END IF;
	IF p = 0 THEN 
		RETURN to_binary_double('-INF');	
	END IF;
	IF p = 1 THEN
		RETURN to_binary_double('INF');
	END IF;
	IF sigma = 0 THEN
		RETURN mu;
	END IF;
 
	q := p - 0.5;
 
	IF(ABS(q) <= .425) THEN
			r := .180625 - q * q;
			val :=
		         q * (((((((r * 2509.0809287301226727 +
		                    33430.575583588128105) * r + 67265.770927008700853) * r +
		                  45921.953931549871457) * r + 13731.693765509461125) * r +
		                1971.5909503065514427) * r + 133.14166789178437745) * r +
		              3.387132872796366608)
		         / (((((((r * 5226.495278852854561 +
		                  28729.085735721942674) * r + 39307.89580009271061) * r +
		                21213.794301586595867) * r + 5394.1960214247511077) * r +
		              687.1870074920579083) * r + 42.313330701600911252) * r + 1);
	ELSE
		/* r = min(p, 1-p) < 0.075 */
		IF q > 0 THEN
			r := 1 - p;
		ELSE
			r := p;
		END IF;
 
		r := SQRT(-LN(r));
		/* r = sqrt(-log(r))  <==>  min(p, 1-p) = exp( - r^2 ) */
 
		IF (r <= 5) THEN
			r := r - 1.6;
			val := (((((((r * 7.7454501427834140764e-4 +
		                 .0227238449892691845833) * r + .24178072517745061177) *
		               r + 1.27045825245236838258) * r +
		              3.64784832476320460504) * r + 5.7694972214606914055) *
		            r + 4.6303378461565452959) * r +
		           1.42343711074968357734)
		          / (((((((r *
		                   1.05075007164441684324e-9 + 5.475938084995344946e-4) *
		                  r + .0151986665636164571966) * r +
		                 .14810397642748007459) * r + .68976733498510000455) *
		               r + 1.6763848301838038494) * r +
		              2.05319162663775882187) * r + 1);
		ELSE /* very close to  0 or 1 */
			r := r - 5;
			val := (((((((r * 2.01033439929228813265e-7 +
		                 2.71155556874348757815e-5) * r +
		                .0012426609473880784386) * r + .026532189526576123093) *
		              r + .29656057182850489123) * r +
		             1.7848265399172913358) * r + 5.4637849111641143699) *
		           r + 6.6579046435011037772)
		          / (((((((r *
		                   2.04426310338993978564e-15 + 1.4215117583164458887e-7) *
		                  r + 1.8463183175100546818e-5) * r +
		                 7.868691311456132591e-4) * r + .0148753612908506148525)
		               * r + .13692988092273580531) * r +
		              .59983220655588793769) * r + 1);
		END IF;
 
		IF q < 0.0 THEN
			val := -val;
		END IF;
	END IF;
 
	RETURN mu + sigma * val;
END;
/

DROP TABLE sound_init;
CREATE TABLE sound_init (
  datetime DATE
, device   VARCHAR2(20)
, s01_freq NUMBER(5,2)
, s01_ener NUMBER(5,2)
, s02_freq NUMBER(5,2)
, s02_ener NUMBER(5,2)
, s03_freq NUMBER(5,2)
, s03_ener NUMBER(5,2)
, anomary  NUMBER(1)
);
ALTER TABLE sound_init ADD CONSTRAINT sound_init_pk PRIMARY KEY (datetime, device);

DROP TABLE sound_test;
CREATE TABLE sound_test (
  datetime DATE
, device   VARCHAR2(20)
, s01_freq NUMBER(5,2)
, s01_ener NUMBER(5,2)
, s02_freq NUMBER(5,2)
, s02_ener NUMBER(5,2)
, s03_freq NUMBER(5,2)
, s03_ener NUMBER(5,2)
);
ALTER TABLE sound_test ADD CONSTRAINT sound_test_pk PRIMARY KEY (datetime, device);


TRUNCATE TABLE sound_init;

BEGIN
  FOR i IN 1..3600 LOOP
    INSERT INTO sound_init
    SELECT
      TO_DATE('2017/08/01 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i, 'SECOND')
    , 'D101'
    , norminv(DBMS_RANDOM.VALUE(), 120, 1)
    , norminv(DBMS_RANDOM.VALUE(), 60, 1)
    , norminv(DBMS_RANDOM.VALUE(), 130, 1)
    , norminv(DBMS_RANDOM.VALUE(), 70, 1)
    , norminv(DBMS_RANDOM.VALUE(), 120, 1)
    , norminv(DBMS_RANDOM.VALUE(), 80, 1)
    , 0
    FROM 
      DUAL;
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..3600 LOOP
    INSERT INTO sound_init
    SELECT
      TO_DATE('2017/08/01 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i, 'SECOND')
    , 'D102'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 61, 1)
    , norminv(DBMS_RANDOM.VALUE(), 131, 1)
    , norminv(DBMS_RANDOM.VALUE(), 71, 1)
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 81, 1)
    , 0
    FROM 
      DUAL;
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..3000 LOOP
    INSERT INTO sound_init
    SELECT
      TO_DATE('2017/08/01 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i, 'SECOND')
    , 'D103'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 59, 1)
    , norminv(DBMS_RANDOM.VALUE(), 131, 1)
    , norminv(DBMS_RANDOM.VALUE(), 69, 1)
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 79, 1)
    , 0
    FROM 
      DUAL;
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..600 LOOP
    INSERT INTO sound_init
    SELECT
      TO_DATE('2017/08/01 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i + 3000, 'SECOND')
    , 'D103'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 58, 1)
    , norminv(DBMS_RANDOM.VALUE(), 130, 1) -- -1
    , norminv(DBMS_RANDOM.VALUE(), 68, 1)
    , norminv(DBMS_RANDOM.VALUE(), 118, 1) -- -3
    , norminv(DBMS_RANDOM.VALUE(), 81, 1) -- +2
    , 1
    FROM 
      DUAL;
  END LOOP;
END;
/

COMMIT;

-- TEST DATA

TRUNCATE TABLE sound_test;

BEGIN
  FOR i IN 1..600 LOOP
    INSERT INTO sound_test
    SELECT
      TO_DATE('2017/08/02 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i, 'SECOND')
    , 'D104'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 58, 1)
    , norminv(DBMS_RANDOM.VALUE(), 131, 1)
    , norminv(DBMS_RANDOM.VALUE(), 68, 1)
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 78, 1)
    FROM 
      DUAL;
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..120 LOOP
    INSERT INTO sound_test
    SELECT
      TO_DATE('2017/08/02 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i + 600, 'SECOND')
    , 'D101'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 58, 1)
    , norminv(DBMS_RANDOM.VALUE(), 131, 1) -- 0
    , norminv(DBMS_RANDOM.VALUE(), 68, 1)
    , norminv(DBMS_RANDOM.VALUE(), 120, 1) -- -1
    , norminv(DBMS_RANDOM.VALUE(), 79, 1) -- +1
    FROM 
      DUAL;
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..120 LOOP
    INSERT INTO sound_test
    SELECT
      TO_DATE('2017/08/02 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i + 720, 'SECOND')
    , 'D101'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 58, 1)
    , norminv(DBMS_RANDOM.VALUE(), 130, 1) -- -1
    , norminv(DBMS_RANDOM.VALUE(), 68, 1)
    , norminv(DBMS_RANDOM.VALUE(), 119, 1) -- -2
    , norminv(DBMS_RANDOM.VALUE(), 79, 1) -- +1
    FROM 
      DUAL;
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..120 LOOP
    INSERT INTO sound_test
    SELECT
      TO_DATE('2017/08/02 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i + 840, 'SECOND')
    , 'D101'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 58, 1)
    , norminv(DBMS_RANDOM.VALUE(), 130, 1) -- -1
    , norminv(DBMS_RANDOM.VALUE(), 68, 1)
    , norminv(DBMS_RANDOM.VALUE(), 118, 1) -- -3
    , norminv(DBMS_RANDOM.VALUE(), 80, 1) -- +2
    FROM 
      DUAL;
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..120 LOOP
    INSERT INTO sound_test
    SELECT
      TO_DATE('2017/08/02 08', 'YYYY/MM/DD HH24') + NUMTODSINTERVAL(i + 960, 'SECOND')
    , 'D101'
    , norminv(DBMS_RANDOM.VALUE(), 121, 1)
    , norminv(DBMS_RANDOM.VALUE(), 58, 1)
    , norminv(DBMS_RANDOM.VALUE(), 129, 1) -- -2
    , norminv(DBMS_RANDOM.VALUE(), 68, 1)
    , norminv(DBMS_RANDOM.VALUE(), 117, 1) -- -4
    , norminv(DBMS_RANDOM.VALUE(), 81, 1) -- +3
    FROM 
      DUAL;
  END LOOP;
END;
/

COMMIT;

SELECT * FROM sound_init WHERE ROWNUM <= 10 ORDER BY datetime;

SELECT COUNT(*) FROM sound_init;
SELECT COUNT(*) FROM sound_test;
  