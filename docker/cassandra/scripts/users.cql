CREATE KEYSPACE IF NOT EXISTS pluralsight
WITH replication = {'class':'SimpleStrategy','replication_factor':1};

USE pluralsight;

create table users (
    id varchar primary key,
    first_name varchar,
    last_name varchar,
    email varchar,
    company varchar,
    password varchar,
    reset_token varchar,
    last_login frozen<tuple<timestamp,inet>>
) with comment = 'A table of users';

create index on users(company);

insert into users (id, first_name, last_name, email)
values ('john-doe', 'John', 'Doe', 'john@doe.com');

insert into users (id, first_name, last_name, email)
values ('jane-doe', 'Jane', 'Doe', 'jane@doe.com');

insert into users (id, first_name, last_name, email, company)
values ('ana-doe', 'Ana', 'Doe', 'ana@doe.com', 'doe-corp');

