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
