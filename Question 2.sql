/* 
Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. 
Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

a. How many orders were shipped by Speedy Express in total?
b. What is the last name of the employee with the most orders?
c. What product was ordered the most by customers in Germany?

https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL
*/

-- a. How many orders were shipped by Speedy Express in total?

SELECT shi.ShipperName, COUNT(shi.ShipperName) AS OrderShipment
FROM Orders AS ord
JOIN Shippers shi ON shi.ShipperID = ord.ShipperID
GROUP BY shi.ShipperName

SELECT COUNT(shi.ShipperName) AS OrderShipment
FROM Orders AS ord
JOIN Shippers shi ON shi.ShipperID = ord.ShipperID
WHERE shi.ShipperName = 'Speedy Express'

-- ANSWER: 54

-- b. What is the last name of the employee with the most orders?

SELECT emp.LastName, COUNT(emp.LastName) AS Occurrences 
FROM Orders AS ord
JOIN Employees emp ON emp.EmployeeID = ord.EmployeeID
GROUP BY emp.LastName
ORDER BY Occurrences DESC


SELECT emp.LastName, COUNT(emp.LastName) AS Occurrences 
FROM Orders AS ord
JOIN Employees emp ON emp.EmployeeID = ord.EmployeeID
GROUP BY emp.LastName
ORDER BY Occurrences DESC
LIMIT 1

-- ANSWER: Peacock |  40 orders

--c. What product was ordered the most by customers in Germany?

SELECT pro.ProductName, SUM(det.Quantity) AS TotalQuantity
FROM OrderDetails AS det
JOIN Orders ord ON ord.OrderID = det.OrderID
JOIN Customers cus ON cus.CustomerID = ord.CustomerID
JOIN Products pro ON pro.ProductID = det.ProductID
WHERE cus.Country = 'Germany'
GROUP BY ProductName
ORDER BY TotalQuantity DESC

SELECT pro.ProductName, SUM(det.Quantity) AS TotalQuantity
FROM OrderDetails AS det
JOIN Orders ord ON ord.OrderID = det.OrderID
JOIN Customers cus ON cus.CustomerID = ord.CustomerID
JOIN Products pro ON pro.ProductID = det.ProductID
WHERE cus.Country = 'Germany'
GROUP BY ProductName
ORDER BY TotalQuantity DESC
LIMIT 1

-- Boston Crab Meat | QuantitySold 160