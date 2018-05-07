CREATE KEYSPACE IF NOT EXISTS pluralsight
WITH replication = {'class':'SimpleStrategy','replication_factor':1};

USE pluralsight;


-- Create courses table
CREATE TABLE courses_tags (
  tag varchar,
  course_id varchar,
  primary key (tag, course_id)
);

insert into courses_tags (tag, course_id)
values ('developer', 'node-intro');

insert into courses_tags (tag, course_id)
values ('open-source', 'node-intro');