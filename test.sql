--  They require the full name and contact details for every customer
-- that has placed an order greater than $60 for a promotional campaign.

SELECT C.CustomerName, C.CustomerEmail, C.CustomerPhone, O.TotalCost
FROM Orders as O
left join Customers as C on O.CustomerID = C.CustomerID
WHERE O.TotalCost > 60
;
