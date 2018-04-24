CREATE KEYSPACE IF NOT EXISTS pluralsight
WITH replication = {'class':'SimpleStrategy','replication_factor':1};

USE pluralsight;

create table course_page_views (
  course_id varchar, 
  view_id timeuuid,
  last_view_id timeuuid static,
  primary key (course_id, view_id)
) with clustering order by (view_id desc);

insert into course_page_views(course_id, view_id, last_view_id) values ('node-intro', now(), now()) using TTL 31536000;
insert into course_page_views(course_id, view_id, last_view_id) values ('node-intro', now(), now()) using TTL 31536000;
insert into course_page_views(course_id, view_id, last_view_id) values ('docker-fundamentals', now(), now()) using TTL 31536000;
insert into course_page_views(course_id, view_id, last_view_id) values ('docker-fundamentals', now(), now()) using TTL 31536000;
insert into course_page_views(course_id, view_id, last_view_id) values ('node-intro', now(), now()) using TTL 31536000;

