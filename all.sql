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


INSERT INTO Customer(first_name, last_name)
VALUES
("Barba", "Alex"),
("Nico", "babl"),
("David", "Malaan"),
("Frid", "Mike"),
("John", "smith");

INSERT INTO Employee (first_name, last_name, salary) 
VALUES 
("Ahmed", "Mohamed", 2048),
("Seif", "Ahmed", 4096),
("Omar", "Mostafa", 8192),
("David", "Mike", 16384),
("John", "smith", 32768);

INSERT INTO Room (number_of_rooms, price) 
VALUES 
(3, 75),
(3, 100),
(3, 125),
(4, 150),
(4, 185);


INSERT INTO Reservation(customer_id, room_id, total_days, total_cost)
VALUES (1, 1, 5, 5 * (SELECT price from Room where room_id = 1)),
(2, 3, 12, 12 * (SELECT price from Room where room_id = 3)),
(3, 4, 2, 2 * (SELECT price from Room where room_id = 4));



-- selecting all rooms
SELECT * FROM Room ;

-- selecting rooms with pirce > 50
SELECT * FROM Room WHERE price > 50 ;

-- order rooms by price in descending order
SELECT * FROM Room ORDER BY price DESC ;

-- select customers having room with price > 50
SELECT * FROM Customer WHERE room_id in (SELECT room_id FROM Room WHERE price > 50) ;

-- select customers having room with number of rooms > 2
SELECT * FROM Customer WHERE room_id in (SELECT room_id FROM Room WHERE number_of_rooms > 2) ;

-- selecting employee having promotion raise
SELECT * FROM Employee WHERE employee_id in (SELECT employee_id FROM Promotion WHERE promotion_raise IS NOT NULL) ;

-- print maximum number of room
SELECT MAX(number_of_rooms) FROM Room ;

-- selecting customer have room greater than 100 and have 2 rooms
SELECT * FROM Customer WHERE room_id in (SELECT room_id FROM Room WHERE price > 100 or number_of_rooms > 2) ;

-- print room with maximum price
SELECT MAX(price) FROM Room ;

-- print count of all rooms
SELECT COUNT(number_of_rooms) AS Total_number_of_rooms_in_all FROM Room ;

-- selecting empylee which having salary more than 100 and less than 200
SELECT * FROM Employee WHERE salary BETWEEN 100 AND 200 ;

-- selecting top 3 empylee having biggest salaray 
SELECT * FROM Employee ORDER BY salary DESC LIMIT 3;

-- selecting customers that having reservation in hotel
SELECT * FROM Customer WHERE reservation_id iS NOT NULL ;

-- selecting customer his first name starts with a
SELECT first_name FROM Customer WHERE first_name LIKE "a%" ;

-- selecting customer his first name ends with a
SELECT first_name FROM Customer WHERE first_name LIKE "%a" ;

-- grouping customer by roomd id
SELECT room_id FROM Customer GROUP BY room_id ;

-- selecting customer with descing order of the price
SELECT * FROM Customer WHERE customer_id in (SELECT customer_id FROM Room ORDER BY price DESC);

-- selecting customer with the same name as employee
SELECT * FROM Employee JOIN Customer on Employee.first_name = Customer.first_name;

-- getting the max salary of employee
SELECT max(salary) FROM Employee;

-- Selecting rooms which a customer reservated more than 5 days
SELECT * FROM Room WHERE room_id in (
SELECT room_id FROM Reservation WHERE total_days > 5);



SELECT * FROM Customer
WHERE room_id in (SELECT room_id FROM Room WHERE price > 50);

SELECT * FROM Room
WHERE room_id in (SELECT room_id FROM Reservation WHERE room_id IS NOT NULL);

SELECT * FROM Reservation
WHERE room_id in (SELECT room_id FROM Room WHERE number_of_rooms > 2);


SELECT number_of_rooms, avg(price) FROM Room
GROUP BY number_of_rooms;

SELECT COUNT(number_of_rooms) FROM Room
GROUP BY number_of_rooms;


SELECT * FROM Customer 
JOIN Room
ON (Customer.room_id = Room.room_id);

SELECT first_name, last_name, Customer.room_id, total_days, total_cost FROM Customer 
JOIN Reservation
ON (Customer.reservation_id = Reservation.reservation_id);

SELECT * FROM Room
LEFT JOIN Reservation
ON (Room.room_id = Reservation.room_id)
RIGHT JOIN Customer
ON Reservation.customer_id = Customer.customer_id

SELECT * FROM Customer A
JOIN Customer B
ON A.room_id = B.room_id
ORDER BY A.room_id

SELECT * FROM Room R
JOIN Customer C
ON R.room_id = C.room_id AND (R.number_of_rooms > 2 OR R.price > 10)
ORDER BY R.price DESC;

USE hotel;

UPDATE Customer
set room_id = 1, reservation_id = 1
where customer_id = 1;

UPDATE Customer
set room_id = 3, reservation_id = 2
where customer_id = 2;

UPDATE Customer
set room_id = 4, reservation_id = 3
where customer_id = 3;


UPDATE Reservation
set total_days = 11, total_cost = 11 * (SELECT price from Room Where room_id = 1)
WHERE reservation_id = 4;

UPDATE Reservation
set total_days = 25, total_cost = 25 * (SELECT price from Room Where room_id = 3)
WHERE reservation_id = 5;


DELETE FROM Room WHERE room_id = 7;
DELETE FROM Room WHERE room_id = 5;
DELETE FROM Customer WHERE customer_id = 4;
DELETE FROM Employee WHERE employee_id = 3;
DELETE FROM Employee WHERE employee_id = 1;
