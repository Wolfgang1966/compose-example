#!/bin/bash
echo starting test
mariadb  -h 127.0.0.1 -u $DBUSER --password=${DBPW} ${DB} <<_EOF
select * from mytest;
_EOF
echo Test 1 done
mariadb  -h 127.0.0.1 -u $DBUSER --password=${DBPW} ${DB} <<_EOF
delete from mytest;
_EOF
echo Test 2 done
mariadb  -h 127.0.0.1 -u $DBUSER --password=${DBPW} ${DB} <<_EOF
select * from mytest;
_EOF
