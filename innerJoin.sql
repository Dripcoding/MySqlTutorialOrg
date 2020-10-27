
-- find the productcode and productname from 'products' table
    -- textdescription of product line
SELECT productcode, productname, textdescription
FROM products AS t1 
INNER JOIN productlines AS t2
ON t1.productline = t2.productline;

SELECT productcode, productname
FROM products AS t1
INNER JOIN productlines as t2
USING productline;

-- find order number, order status, total sales from orders and orderdetails
SELECT t1.ordernumber, t1.status, SUM(quantityordered * priceeach) AS total
FROM orders AS t1
INNER JOIN orderdetails AS t2
ON t1.ordernumber = t2.ordernumber
GROUP BY ordernumber;

SELECT t1.ordernumber, t1.status, SUM(quantityordered * priceeach) AS total
FROM orders AS t1
INNER JOIN orderdetails AS t2
USING (ordernumber)
GROUP BY ordernumber;

-- find ordernumber, orderdate, orderlinenumber, productname, quantityordered, priceach for orders
SELECT ordernumber, orderdate, orderlinenumber, productname, quantityordered, priceeach
FROM orders
INNER JOIN orderdetails USING (ordernumber)
INNER JOIN products USING (productcode)
ORDER BY
    orderNumber,
    orderLineNumber;

-- find ordernumber, orderdate, customername, orderlinenumber, productname, quantityordered, priceeach for orders
SELECT ordernumber, orderdate, customername, orderlinenumber, productname, quantityordered, priceeach
FROM orders
INNER JOIN orderdetails USING (ordernumber)
INNER JOIN products USING (productcode)
INNER JOIN customers USING (customernumber)
ORDER BY
    ordernumber,
    orderlinenumber;

-- find sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product.
SELECT ordernumber, productname, msrp, priceeach
FROM products AS t1
INNER JOIN orderdetails AS t2
ON t1.productcode = t2.productcode
AND t1.msrp > t2.priceeach
WHERE t1.productcode = 'S10_1678';