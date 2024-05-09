USE LittleLemonDM;

SHOW TABLES;

-- TASK 1
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //

CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN table_number INT, IN booking_date DATE)
BEGIN
    INSERT INTO Bookings (BookingID, BookingDate, BookingTable, CustomerID)
    VALUES (booking_id, booking_date, table_number, customer_id);

    SELECT "New booking added" AS Confirmation;

END //

DELIMITER ;

SELECT *
FROM Bookings;

CALL AddBooking(9, 3, 4, "2022-12-30");

SELECT *
FROM Bookings;

-- TASK 2
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
    UPDATE Bookings
    SET BookingDate = booking_date
    WHERE BookingID = booking_id;

END //

DELIMITER ;

CALL UpdateBooking(9, '2022-12-27');

SELECT *
FROM bookings;

-- TASK 3
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = booking_id;
END //

DELIMITER ;

SELECT *
FROM bookings;
CALL CancelBooking(9);

SELECT *
FROM Bookings;