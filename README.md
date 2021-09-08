# Antone Evans Jr.
## Winter 2022 Data Science Intern Challenge

<b> All working for the work presented can be found below: </b>
- Question 1: [Jupyter Notebook](https://github.com/antoneev/ShopifyTechnicalChallenge/blob/main/Question%201.ipynb)
- Question 2: [SQL File](https://github.com/antoneev/ShopifyTechnicalChallenge/blob/main/Question%202.sql)

# Answer in Photo
<b> Please scroll below to see answers in plain text. </b> 
![Question 1]((Question-1.jpg))
![Question 2](Question-2.jpg)

# Answers Plain Text
## Question 1
### a. 
```python
# Order Sum
orderAmountSum = question1_dataset['order_amount'].sum()
orderSum
5725640

# Total # of rows
totalItemsRowCount = question1_dataset['total_items'].count()
rowsCount
5000

# Calculate Incorect AOV
incorrectAOV = orderAmountSum / totalItemsRowCount
incorrectAOV = str(round(incorrectAOV, 2))
incorrectAOV
3145.13
```

The incorrect calculation is found by dividing by the total number of rows. The AOV should be calculated by dividing the sum of sales by the sum of items sold.

### b.

As this report simply asked for the AOV, I would only report the 'order_amount' and 'total_items' columns. More specifically I would report the sums of both. The AOV can be calculated through the use of these sums as followed:

AOV = orderAmountSum/totalItemsSum

In an article wrote by Shopify surrounding AOV, it was also stated that businesses could get a better view when the median and mode are calculated. Therefore, along with returning the mean, I would report the median and mode as well.
Source: https://www.shopify.com/blog/average-order-value

### c. 

```python
# Total Items Sum
totalItemsSum = question1_dataset['total_items'].sum()
totalItemsSum
43936

# Calculate AOV
AOV = orderAmountSum / totalItemsSum
AOV = str(round(AOV, 2))
AOV
357.92
```


## Question 2
### a.
```sql
SELECT shi.ShipperName, COUNT(shi.ShipperName) AS OrderShipment
FROM Orders AS ord
JOIN Shippers shi ON shi.ShipperID = ord.ShipperID
GROUP BY shi.ShipperName
```
<b> ANSWER: 54 </b>

### b.
```sql
SELECT emp.LastName, COUNT(emp.LastName) AS Occurrences 
FROM Orders AS ord
JOIN Employees emp ON emp.EmployeeID = ord.EmployeeID
GROUP BY emp.LastName
ORDER BY Occurrences DESC
```
<b> ANSWER: Peacock |  40 orders </b>

### c.
```sql
SELECT pro.ProductName, SUM(det.Quantity) AS TotalQuantity
FROM OrderDetails AS det
JOIN Orders ord ON ord.OrderID = det.OrderID
JOIN Customers cus ON cus.CustomerID = ord.CustomerID
JOIN Products pro ON pro.ProductID = det.ProductID
WHERE cus.Country = 'Germany'
GROUP BY ProductName
ORDER BY TotalQuantity DESC
```
<b> ANSWER: Boston Crab Meat | QuantitySold 160 </b>
