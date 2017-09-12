DROP TABLE device;

CREATE TABLE device (
  device VARCHAR2(255)
, model  VARCHAR2(255)
);

INSERT ALL
into DEVICE (DEVICE,MODEL) values ('device01','modelA')
into DEVICE (DEVICE,MODEL) values ('device02','modelA')
into DEVICE (DEVICE,MODEL) values ('device03','modelB')
into DEVICE (DEVICE,MODEL) values ('device04','modelB')
into DEVICE (DEVICE,MODEL) values ('device05','modelB')
into DEVICE (DEVICE,MODEL) values ('device06','modelB')
into DEVICE (DEVICE,MODEL) values ('device07','modelC')
into DEVICE (DEVICE,MODEL) values ('device08','modelC')
into DEVICE (DEVICE,MODEL) values ('device09','modelC')
SELECT * FROM dual;

COMMIT;

SET LINES 100
COL model FOR a20
COL device FOR a20
COL time_start FOR a20

SELECT model, d.device, time_start, frequency
FROM sound s, device d
WHERE s.device = d.device AND model = 'modelA'
AND ROWNUM <= 10;

EXIT
