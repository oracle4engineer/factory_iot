drop table sound;
create table sound (
  id int
, device string
, time_start string
, time_end string
, frequency float
, energy float
, temperature float
, humidity float
, anomaly int
) ROW FORMAT delimited fields terminated by ',';

