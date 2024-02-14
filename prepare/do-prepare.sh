#!/bin/bash
# wait for database to come up
sleep 10

echo Preparing Testdata
mariadb  -h 127.0.0.1 -u $DBUSER --password=${DBPW} ${DB} <<_EOF
DROP TABLE if exists mytest;
CREATE TABLE mytest ( name varchar(255) primary key, value varchar(255));
insert into mytest (name, value) values ('Test1', 'Testwert 1');
insert into mytest (name, value) values ('Test2', 'Testwert 2');
insert into mytest (name, value) values ('Test3', 'Testwert 3');
select * from mytest;
_EOF
echo Testdata prepared
