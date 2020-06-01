INSERT INTO Reservation(customer_id, room_id, total_days, total_cost)
VALUES (1, 1, 5, 5 * (SELECT price from Room where room_id = 1)),
(2, 3, 12, 12 * (SELECT price from Room where room_id = 3)),
(3, 4, 2, 2 * (SELECT price from Room where room_id = 4))