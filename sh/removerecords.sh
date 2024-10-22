#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
DELETE FROM billing;
DELETE FROM reservation;
DELETE FROM car;
DELETE FROM model;
DELETE FROM protections_coverages;
DELETE FROM customer;
DELETE FROM employees;
DELETE FROM location;


EXIT;
           
