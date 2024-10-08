CREATE VIEW available_cars AS
SELECT 
    car.registration_number,
    model.model_name,
    model.model_year,
    location.location_name,
    car.rental_price,
    car.car_type
FROM 
    car
JOIN model ON car.model_number = model.model_number
JOIN location ON car.location_number = location.location_number
WHERE 
    car.availability = 1; -- 1 means available


CREATE VIEW high_earning_reservations AS
SELECT 
    reservation.reservation_id,
    customer.first_name,
    customer.last_name,
    car.registration_number,
    model.model_name,
    billing.car_rental_fees,
    billing.car_late_fees,
    billing.pc_fees
FROM 
    reservation
JOIN customer ON reservation.license_number = customer.license_number
JOIN car ON reservation.registration_number = car.registration_number
JOIN model ON car.model_number = model.model_number
JOIN billing ON reservation.reservation_id = billing.reservation_id
WHERE 
    billing.car_rental_fees > 500.00 -- Filter for high-earning rentals
ORDER BY 
    billing.car_rental_fees DESC;
    
    

