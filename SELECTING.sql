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