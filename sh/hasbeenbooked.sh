#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SET PAGESIZE 50
SET LINESIZE 200
SET FEEDBACK OFF
SET HEADING ON
SET TRIMSPOOL ON
SET WRAP OFF

SELECT car.registration_number, model.model_name, car.car_type, car.rental_price, l.location_name
FROM car
JOIN model ON car.model_number = model.model_number
JOIN location l ON car.location_number = l.location_number
WHERE EXISTS (
    SELECT 1
    FROM reservation r
    WHERE r.registration_number = car.registration_number
);


EXIT;
           
