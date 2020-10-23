-- find employees whose first names start with 'a'
SELECT firstname, lastname
FROM employees
WHERE firstname LIKE 'a%';

-- find employees whose last names ends with 'on'
SELECT firstname, lastname
FROM employees
WHERE lastname LIKE '%on';

-- find employees whose last names contain 'on'
SELECT firstname, lastname
FROM employees
WHERE lastname LIKE '%on%';

-- find employees whose first names start with 'T' and end with 'm'
SELECT firstname, lastname
FROM employees
WHERE firstname LIKE 'T%m';

-- find employees whose last names don't start with 'B'
SElECT firstname, lastname
FROM employees
WHERE lastname NOT LIKE 'B%';

-- find products whose product codes contain the string '_20'
SELECT productcode, productname
FROM products
WHERE productcode LIKE '%\_20%';
