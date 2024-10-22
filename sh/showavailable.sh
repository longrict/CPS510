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

SELECT DISTINCT 
    location.location_name, 
    COUNT(car.registration_number) AS available_cars_count
FROM 
    car
JOIN location ON car.location_number = location.location_number
WHERE 
    car.availability = 1  -- Only available cars
GROUP BY 
    location.location_name
ORDER BY 
    available_cars_count DESC;

EXIT;
           
