#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SET PAGESIZE 50
SET LINESIZE 200
SET FEEDBACK OFF
SET HEADING ON
SET TRIMSPOOL ON
SET WRAP OFF

SELECT DISTINCT 
    customer.first_name, 
    customer.last_name, 
    model.model_name
FROM 
    reservation
JOIN customer ON reservation.license_number = customer.license_number
JOIN car ON reservation.registration_number = car.registration_number
JOIN model ON car.model_number = model.model_number
ORDER BY 
    customer.last_name, customer.first_name, model.model_name;

EXIT;
           
