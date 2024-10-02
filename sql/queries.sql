--   Retrieve all locations in Ontario along with their phone numbers.
SELECT location_name, phone_number 
   FROM location 
   WHERE province = 'Ontario';
   
--    Update the manufacturer name for a specific car model.
      UPDATE model 
   SET manufacturer = 'New Manufacturer' 
   WHERE model_number = 3;

/*
   Delete a car from the database if it has a registration number and mileage over 100,000.
*/
      DELETE FROM car 
   WHERE registration_number = 5001 AND mileage > 100000;

--   Retrieve the details of all reservations that were confirmed and completed in the last month.
      SELECT reservation_id, start_date, end_date, returned_date 
   FROM reservation 
   WHERE rental_status = 'Confirmed' 
   AND returned_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE;

--   List all available protection coverages that cost less than 15.
      SELECT pc_name, pc_code 
   FROM protections_coverages 
   WHERE pc_price < 15;

--Update the payment status of a reservation to "Paid" after a successful payment.
     UPDATE billing 
   SET payment_status = 'Paid' 
   WHERE reservation_id = 1;

--   Delete a customer who has not made any reservations in the past two years.
      DELETE FROM customer 
   WHERE license_number NOT IN (
       SELECT license_number 
       FROM reservation 
       WHERE booking_date > ADD_MONTHS(SYSDATE, -24)
   );

--   Mark a reservation as "Cancelled" if it has not yet started and the customer requested a cancellation.
      UPDATE reservation 
   SET rental_status = 'Cancelled' 
   WHERE reservation_id = 3022 AND start_date > SYSDATE;
   
      DELETE FROM protections_coverages 
   WHERE pc_code = 105;
   
   
   --   Remove a protection coverage from a reservation if the customer opted out before the reservation start date.
       SELECT SUM(TAX)+SUM(CAR_RENTAL_FEES)+SUM(CAR_LATE_FEES)+SUM(PC_FEES) AS total_billed 
    FROM billing b
    JOIN reservation r ON b.reservation_id = r.reservation_id
    WHERE r.license_number = 'B987654321' 
    AND r.end_date > ADD_MONTHS(SYSDATE, -12);

--    Change the phone number of a location.
        UPDATE location 
    SET phone_number = '123-456-7890' 
    WHERE location_number = 5;

--    Retrieve all cars of a specific type available at a location.
SELECT registration_number, mileage, rental_price,car_type,location_number,AVAILABILITY
    FROM car 
    WHERE car_type = 'SUV' AND location_number = 3 AND AVAILABILITY = 0;
