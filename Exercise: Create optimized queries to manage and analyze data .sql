USE LittleLemonDM;

SHOW TABLES;


-- TASK 1
DELIMITER //

CREATE PROCEDURE IF NOT EXISTS GetMaxQuantity()
BEGIN
    SELECT MAX(Orders.OrderQuantity)
    FROM Orders;
END //

DELIMITER ;

CALL GetMaxQuantity();

-- TASK 2
PREPARE GetOrderDetail FROM 'SELECT Orders.OrderID, Orders.OrderQuantity, Orders.TotalCost FROM Orders WHERE Orders.CustomerID = ?';
SET @CustomerID = 1;
EXECUTE GetOrderDetail USING @CustomerID;

-- TASK 3
DELIMITER  //

CREATE PROCEDURE IF NOT EXISTS CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders WHERE OrderID = order_id;

END //

DELIMITER ;

CALL CancelOrder(1);