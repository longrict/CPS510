#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SET PAGESIZE 50
SET LINESIZE 200
SET FEEDBACK OFF
SET HEADING ON
SET TRIMSPOOL ON
SET WRAP OFF


SELECT c.license_number, c.first_name, c.last_name, l.location_name
FROM customer c
JOIN reservation r on c.license_number = r.license_number
JOIN location l on r.pickup_location = l.location_number
WHERE EXISTS (
    SELECT 1
    FROM reservation r1
    WHERE r1.license_number = c.license_number
    GROUP BY r1.license_number
    HAVING COUNT(DISTINCT r1.pickup_location) > 1
)
ORDER BY c.license_number, l.location_name;

EXIT;
           
