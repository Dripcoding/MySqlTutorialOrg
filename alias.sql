-- assign a column alias for the following query
-- SELECT 
--     CONCAT_WS(', ', lastName, firstname)
-- FROM
--     employees;

SELECT
    CONCAT_WS(', ', lastname, firstname) AS fullname
FROM
    employees
ORDER BY fullname;

-- assign a column alias for the following query
-- SELECT
-- 	orderNumber `Order no.`,
-- 	SUM(priceEach * quantityOrdered) total
-- FROM
-- 	orderDetails
-- GROUP BY
-- 	`Order no.`
-- HAVING
-- 	total > 60000;

SELECT
    ordernumber AS 'order #',
    SUM(priceEach * quantityOrdered) AS total
FROM orderDetails
GROUP BY
    'order #'
HAVING
    total > 60000;


-- use table aliases when selecting customername and number of orders from the customers and orders tables
-- use c as a table alias for customers table
-- use o as a table alias for orders table
-- don't use table aliases for the above query

SELECT
    customername,
    COUNT(o.ordernumber) AS ordercount
FROM
    customers AS c
INNER JOIN orders AS o ON c.customernumber = o.customernumber
GROUP BY
    customername
ORDER BY
    ordercount DESC;