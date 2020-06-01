UPDATE Reservation
set total_days = 11, total_cost = 11 * (SELECT price from Room Where room_id = 1)
WHERE reservation_id = 4;

UPDATE Reservation
set total_days = 25, total_cost = 25 * (SELECT price from Room Where room_id = 3)
WHERE reservation_id = 5;