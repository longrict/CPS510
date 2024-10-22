#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

DROP TABLE billing;
DROP TABLE reservation;
DROP TABLE car;
DROP TABLE model;
DROP TABLE protections_coverages;
DROP TABLE customer;
DROP TABLE employees;
DROP TABLE location;

EXIT;
           
