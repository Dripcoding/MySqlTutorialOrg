-- find unique last names of employees
SELECT lastName from employees;
SELECT DISTINCT lastName from employees;

-- find unique state from customers table
SELECT state FROM customers WHERE state IS NOT NULL;
SELECT DISTINCT state FROM customers WHERE state IS NOT NULL;

-- find unique combination of city and state from customers
SELECT city, state FROM customers WHERE state IS NOT NULL ORDER BY city, state;
SELECT DISTINCT city, state FROM customers WHERE state IS NOT NULL ORDER BY city, state;

-- use GROUP BY to select unique states of customers
SELECT state FROM customers WHERE state IS NOT NULL GROUP BY state;
SELECT DISTINCT state FROM customers WHERE state IS NOT NULL ORDER BY state;

-- count unique states of customers in the US
SELECT COUNT(STATE) FROM customers WHERE country = 'USA';
SELECT COUNT(DISTINCT STATE) FROM customers WHERE country = 'USA';

-- find the first 5 non-null unique states of customers
SELECT state FROM customers WHERE state IS NOT NULL LIMIT 5;
SELECT DISTINCT state FROM customers WHERE state IS NOT NULL LIMIT 5;