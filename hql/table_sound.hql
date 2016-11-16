drop table sound;
create table sound (
  id int
, device string
, time_start string
, time_end string
, ff float
, energy float
, temperature float
, humidity float
) ROW FORMAT delimited fields terminated by ',';

