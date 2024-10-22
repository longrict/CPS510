#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SET PAGESIZE 50
SET LINESIZE 200
SET FEEDBACK OFF
SET HEADING ON
SET TRIMSPOOL ON
SET WRAP OFF

SELECT DISTINCT e.employee_id, e.first_name, e.last_name, l.city, l.location_name
FROM employees e
JOIN location l ON e.location_number = l.location_number
WHERE l.city = 'Toronto'
UNION
SELECT DISTINCT e.employee_id, e.first_name, e.last_name, l.city, l.location_name
FROM employees e
JOIN location l ON e.location_number = l.location_number
WHERE l.city = 'Ottawa'
ORDER BY employee_id, city;

EXIT;
           
