-- find customers who are located in CA, USA
SELECT contactfirstname, contactlastname, country, state
FROM customers 
WHERE state = 'CA' AND country = 'USA'
ORDER BY contactfirstname;

-- find customers who are located in CA, USA and have credit limit larger than 100k
SELECT customerName, contactfirstname, contactfirstname, country, state, creditLimit
FROM customers
WHERE state = 'CA' AND country = 'USA' AND creditLimit > 100000
ORDER BY creditLimit;

-- find customers that are located in the USA or FRANCE
SELECT customername, country
FROM customers 
WHERE country = 'USA' OR country = 'FRANCE'
ORDER BY customername;

-- find customers who are located in USA or FRANCE and have a credit limit larger than 100k
SELECT customername, country, creditLimit
FROM customers
WHERE (country != 'USA' OR country != 'FRANCE')
AND creditlimit > 10000
ORDER BY customername;

-- find offices that are located in the USA or FRANCE
SELECT officecode, city, phone, country
FROM offices
WHERE country IN ('USA', 'France');

-- find offices that are not located in the USA or FRANCE
SELECT officecode, city, phone, country
FROM offices
WHERE country NOT IN ('USA', 'France');

-- find orders whose total values are greater than 600000
SELECT ordernumber, customernumber, status, shippeddate
FROM orders
WHERE ordernumber IN
(
    SELECT DISTINCT ordernumber
    FROM orderdetails
    HAVING SUM(quantityOrdered * priceEach) > 60000
);

-- find products whose buy prices are between 90 and 100
SELECT productcode, productname, buyprice
FROM products
WHERE buyprice BETWEEN 90 AND 100; 

-- find products whose buy prices are not between 20 and 100
SELECT productcode, productname, buyprice
FROM products
WHERE buyprice NOT BETWEEN 20 AND 100;

-- find orders which have the required dates between 1/1/2003 and 1/31/20033
SELECT ordernumber, requireddate, status
FROM orders
WHERE requireddate
BETWEEN
    CAST('2003-01-01' AS DATE) AND
    CAST('2003-01-31' AS DATE);
