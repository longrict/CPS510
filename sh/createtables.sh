#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib


sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
CREATE TABLE location (
    location_number INT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    country VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    street_address VARCHAR(100) NOT NULL
);

CREATE TABLE customer (
    license_number VARCHAR(15) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    apartment VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    street_address VARCHAR(100) NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL
);


CREATE TABLE model (
    model_number INT PRIMARY KEY,
    model_year INT NOT NULL,
    model_name VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    number_of_seats INT NOT NULL CHECK (number_of_seats > 0)
);

CREATE TABLE car (
    registration_number INT PRIMARY KEY,
    location_number INT NOT NULL,
    model_number INT NOT NULL,
    availability NUMBER(1) NOT NULL, 
    mileage INT NOT NULL CHECK (mileage >= 0),
    rental_price DECIMAL(10, 2) NOT NULL CHECK (rental_price >= 0),
    late_fee DECIMAL(10, 2) NOT NULL CHECK (late_fee >= 0),
    car_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (location_number) REFERENCES location(location_number) ON DELETE CASCADE,
    FOREIGN KEY (model_number) REFERENCES model(model_number) ON DELETE CASCADE
);

CREATE TABLE reservation (
    reservation_id INT PRIMARY KEY,
    license_number VARCHAR(15) NOT NULL,
    registration_number INT NOT NULL,
    pickup_location INT NOT NULL,
    return_location INT NOT NULL,
    rental_status VARCHAR(20) NOT NULL CHECK (rental_status IN ('Confirmed', 'Pending', 'Cancelled')),
    booking_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    returned_date DATE,
    FOREIGN KEY (license_number) REFERENCES customer(license_number) ON DELETE CASCADE,
    FOREIGN KEY (registration_number) REFERENCES car(registration_number) ON DELETE CASCADE,
    FOREIGN KEY (pickup_location) REFERENCES location(location_number),
    FOREIGN KEY (return_location) REFERENCES location(location_number),
    CONSTRAINT date_check CHECK (end_date > start_date)
);

CREATE TABLE protections_coverages (
    pc_code INT PRIMARY KEY,
    pc_name VARCHAR(50) NOT NULL,
    pc_price DECIMAL(10, 2) NOT NULL CHECK (pc_price >= 0)
);


CREATE TABLE billing (
    billing_id INT PRIMARY KEY,
    reservation_id INT NOT NULL,
    billing_date DATE NOT NULL,
    billing_status VARCHAR(20) NOT NULL CHECK (billing_status IN ('Paid', 'Unpaid')),
    tax DECIMAL(5, 2) NOT NULL CHECK (tax >= 0),
    car_rental_fees DECIMAL(10, 2) NOT NULL CHECK (car_rental_fees >= 0),
    car_late_fees DECIMAL(10, 2) CHECK (car_late_fees >= 0),
    pc_fees DECIMAL(10, 2) CHECK (pc_fees >= 0),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) ON DELETE 
    CASCADE
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    location_number INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL CHECK (salary >= 0),
    position VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (location_number) REFERENCES location(location_number) ON DELETE CASCADE
);




EXIT;
           
