load data inpath '/user/oracle/sound' into table sound;
select time_start, ff from sound where device = 'device01' limit 10;
