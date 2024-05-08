USE LittleLemonDM;

SHOW TABLES;


-- TASK 1
INSERT INTO Bookings(BookingID, BookingDate, BookingTable, CustomerID)
VALUES (1, '2022-10-10', 5, 1),
       (2, '2022-11-12', 3, 3),
       (3, '2022-10-11', 2, 2),
       (4, '2022-10-13', 2, 1);

SELECT *
FROM bookings;


-- TASK 2
DELIMITER //
DROP PROCEDURE IF EXISTS CheckBooking;
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_num INT)
BEGIN
    SELECT IF(COUNT(*) > 0, CONCAT("Table ", table_num, " is already booked"),
              CONCAT("Table ", table_num, " is not booked")) AS `Booking status`
    FROM Bookings
    WHERE Bookings.BookingDate = booking_date
      AND Bookings.BookingTable = table_num;
END //

DELIMITER ;

CALL CheckBooking('2022-11-12', 3);


-- TASK 3
-- Since CustomerID is undetermined, we set customerid to 0 arbitrarily.
DELIMITER //
DROP PROCEDURE IF EXISTS AddValidBooking;
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_num INT)
BEGIN
    SET @booked = TRUE;
    SET @booking_id = (SELECT MAX(BookingID) + 1 FROM Bookings);

    SELECT IF(COUNT(*) > 0, @booked := TRUE, @booked := FALSE)

    FROM Bookings
    WHERE Bookings.BookingDate = booking_date
      AND Bookings.BookingTable = table_num;

    START TRANSACTION;
    INSERT INTO Bookings (BookingID, BookingDate, BookingTable, CustomerID)
    VALUES (@booking_id, booking_date, table_num, 0);

    SELECT CONCAT(@booked, " ");

    IF @booked = FALSE THEN
        SELECT CONCAT("Table ", table_num, " booked.");
        COMMIT;
    ELSE
        SELECT CONCAT("Table ", table_num, " is already booked - booking cancelled");
        ROLLBACK;
    END IF;

END //

DELIMITER ;

SELECT *
FROM bookings;

# First Booking
CALL AddValidBooking('2022-12-17', 6);

# Check for bookings
SELECT *
FROM bookings;

# Second Booking with same date and table number
CALL AddValidBooking('2022-12-17', 6);

# Check for bookings
SELECT *
FROM bookings;

# Third Booking with new one
CALL AddValidBooking('2022-12-17', 7);

# Check for bookings
SELECT *
FROM bookings;
