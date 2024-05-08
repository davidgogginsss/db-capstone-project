USE LittleLemonDM;

SHOW TABLES;


-- TASK 1
CREATE OR REPLACE VIEW OrdersView
AS
SELECT Orders.OrderID, Orders.OrderQuantity, Orders.TotalCost
FROM Orders
WHERE Orders.OrderQuantity > 1;

SELECT *
FROM OrdersView;

-- TASK 2
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.TotalCost, m.MenuName, mi.CourseName
FROM Orders AS o
         LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID
         LEFT JOIN Menus AS m ON o.MenuID = m.MenuID
         LEFT JOIN MenuItems AS mi ON m.MenuItemsID = mi.MenuItemsID
ORDER BY o.TotalCost;
;

-- TASK 3
SELECT MenuName
FROM Menus
WHERE menuid = ANY (SELECT MenuID FROM Orders WHERE OrderQuantity > 2);