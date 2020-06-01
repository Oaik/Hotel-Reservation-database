USE `hotel`;

CREATE TABLE Customer (
    customer_id int PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(255),
    last_name varchar(255),
    room_id int,
    reservation_id int
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(255),
    last_name varchar(255),
    salary INT NOT NULL
);

CREATE TABLE Promotion (
    employee_id int NOT NULL,
    promotion_raise INT
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    number_of_rooms INT NOT NULL,
    price INT NOT NULL
);

CREATE TABLE Reservation(
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    room_id INT NOT NULL,
    total_days INT NOT NULL,
    total_cost INT NOT NULL,
    start_date DATE
);


