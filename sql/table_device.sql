DROP TABLE device;

CREATE TABLE device (
  device VARCHAR2(255)
, model  VARCHAR2(255)
);

INSERT into DEVICE (DEVICE,MODEL) values ('device01','modelA');
INSERT into DEVICE (DEVICE,MODEL) values ('device02','modelA');
INSERT into DEVICE (DEVICE,MODEL) values ('device03','modelA');
INSERT into DEVICE (DEVICE,MODEL) values ('device04','modelB');
INSERT into DEVICE (DEVICE,MODEL) values ('device05','modelB');

SET LINES 100
COL model FOR a20
COL device FOR a20
COL time_start FOR a20
COL ff FOR a20

SELECT model, d.device, time_start, ff
FROM sound s, device d
WHERE s.device = d.device AND model = 'modelA'
AND ROWNUM <= 10;

EXIT
