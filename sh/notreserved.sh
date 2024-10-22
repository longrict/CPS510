#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
SET PAGESIZE 50
SET LINESIZE 200
SET FEEDBACK OFF
SET HEADING ON
SET TRIMSPOOL ON
SET WRAP OFF

SELECT car.registration_number, model.model_name, car.car_type, car.rental_price
FROM car
JOIN model ON car.model_number = model.model_number
WHERE car.availability = 1
MINUS
SELECT r.registration_number, m.model_name, c.car_type, c.rental_price
FROM reservation r
JOIN car c ON r.registration_number = c.registration_number
JOIN model m ON c.model_number = m.model_number
WHERE r.rental_status = 'Confirmed';

EXIT;
           
