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