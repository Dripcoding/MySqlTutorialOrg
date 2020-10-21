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

-- find orders whose total values are greater than 60000