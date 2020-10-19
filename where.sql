-- find employees whose jobtitle is sales rep
SELECT
    lastName,
    firstName,
    jobTitle
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';

-- find employees whose jobtitle is sales rep and office code is 1
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle = 'Sales Rep' AND officeCode = 1
ORDER BY
    officeCode,
    jobTitle;

-- find employees whose jobtitle is sales rep or office code is 1
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle = 'Sales Rep' OR officeCode = 1
ORDER BY
    officeCode,
    jobTitle;

-- find employees whose office code is between 1 and 3
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY
    officeCode;

-- find employees whose last names en with 'son'
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    lastName LIKE "%son"
ORDER BY
    firstName;

-- find employees who are in office 1, 2, and 3
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    officeCode IN (1, 2, 3)
ORDER BY
    officeCode;

-- find employees whose reportsTo value is null
SELECT
    lastName,
    firstName,
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;

-- find employees who are not sales reps
SELECT
    lastName,
    firstName,
    jobTitle
FROM
    employees
WHERE
    jobTitle <> 'Sales Rep';

-- find employees whose office code is greater than 5
SELECT
    lastName,
    firstName,
    officeCode
FROM
    employees
WHERE
    officeCode > 5
ORDER BY
    officeCode;

-- find employees with office code less than or equal to 4
SELECT
    lastName,
    firstName,
    officeCode
FROM
    employees
WHERE
    officeCode <= 4
ORDER BY
    officeCode;