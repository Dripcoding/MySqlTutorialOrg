-- find customers who do not have a sales representative
SELECT customername, salesrepemployeenumber
FROM customers
WHERE salesrepemployeenumber IS NULL
ORDER BY customerName;

-- find customers who have a sales representative
SELECT customername, salesrepemployeenumber
FROM customers
WHERE salesrepemployeenumber IS NOT NULL
ORDER BY customername;