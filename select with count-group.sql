SELECT number_of_rooms, avg(price) FROM Room
GROUP BY number_of_rooms;

SELECT COUNT(number_of_rooms) FROM Room
GROUP BY number_of_rooms