-- find top 5 customers with the highest credit
SELECT customernumber, customername, creditlimit
FROM customers
ORDER BY creditlimit DESC;
LIMIT 5

-- find 5 customers who have the lowest credit 
SELECT customernumber, customername, creditlimit
FROM customers
ORDER BY creditlimit
LIMIT 5;

-- get rows of page 1 which contains the first 10 customers sorted by customer name;
SELECT customernumber, customername
FROM customers
ORDER BY customername
LIMIT 0, 10;

-- get rows of page 2 which contains row 11-20
SELECT customernumber, customername
FROM customers
ORDER BY customername
LIMIT 10, 10;

-- find customer who has the 2nd highest credit
SELECT customernumber, customername, creditlimit
FROM customers
ORDER BY creditlimit DESC;
LIMIT 1, 1;