CREATE KEYSPACE IF NOT EXISTS pluralsight
WITH replication = {'class':'SimpleStrategy','replication_factor':1};

USE pluralsight;

create table clickstream (
               year int, 
               month int,
               click_id timeuuid,
               ip inet, 
               url text,
               primary key((year, month), click_id)
               ) with clustering order by (click_id desc);

insert into clickstream (year, month, click_id, ip, url) values (2017,1,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,2,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,3,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,4,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,5,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,6,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,7,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,8,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,9,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,10,now(),'98.203.191.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,11,now(),'98.203.196.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2017,12,now(),'98.203.196.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2018,6,now(),'98.203.196.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2018,1,now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2018,1,now(),'98.203.196.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2018,2,now(),'98.203.196.32', 'https://www.awesome.com');
insert into clickstream (year, month, click_id, ip, url) values (2018,2,now(),'98.203.153.32', 'https://www.awesome.com');



create table clickstream_bucket (
               bucket_id varchar,
               click_id timeuuid,
               ip inet,
               url text,
               primary key (bucket_id, click_id) 
               ) with clustering order by (click_id desc);


insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-1',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-2',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-3',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-4',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-5',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-6',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-7',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-8',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-9',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-10',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-11',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2017-12',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2018-1',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2018-1',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2018-2',now(),'98.203.153.32', 'https://www.awesome.com');
insert into clickstream_bucket (bucket_id, click_id, ip, url) values ('2018-3',now(),'98.203.153.32', 'https://www.awesome.com');
