load data inpath '/user/oracle/sound' into table sound;
select time_start, frequency from sound where device = 'device01' limit 10;
