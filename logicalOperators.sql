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

