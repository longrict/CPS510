#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SET PAGESIZE 50
SET LINESIZE 200
SET FEEDBACK OFF
SET HEADING ON
SET TRIMSPOOL ON
SET WRAP OFF

COLUMN location_name FORMAT A5

SELECT 
    customer.first_name, 
    customer.last_name, 
    COUNT(reservation.reservation_id) AS reservation_count
FROM 
    reservation
JOIN customer ON reservation.license_number = customer.license_number
GROUP BY 
    customer.first_name, customer.last_name
HAVING 
    COUNT(reservation.reservation_id) > 1  -- Only customers with more than one reservation
ORDER BY 
    reservation_count DESC;


EXIT;
           
