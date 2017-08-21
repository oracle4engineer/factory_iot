load data inpath '/user/oracle/sound' into table sound;
select time_start, frequency from sound where device = 'device01' and time_start like '2017-08-21%' limit 10;
