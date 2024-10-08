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
