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


CREATE VIEW employee_performance AS
SELECT 
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    employees.position,
    location.location_name,
    COUNT(reservation.reservation_id) AS total_reservations
FROM 
    employees
JOIN location ON employees.location_number = location.location_number
LEFT JOIN reservation ON reservation.pickup_location = location.location_number
GROUP BY 
    employees.employee_id, employees.first_name, employees.last_name, employees.position, location.location_name
ORDER BY 
    total_reservations DESC;

