SELECT * FROM Customer
WHERE room_id in (SELECT room_id FROM Room WHERE price > 50);

SELECT * FROM Room
WHERE room_id in (SELECT room_id FROM Reservation WHERE room_id IS NOT NULL);

SELECT * FROM Reservation
WHERE room_id in (SELECT room_id FROM Room WHERE number_of_rooms > 2);