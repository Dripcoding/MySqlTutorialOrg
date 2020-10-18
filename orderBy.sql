-- sort customers by their last name in ascending order A-Z
SELECT
    contactLastName,
    contactFirstName
FROM
    customers
ORDER By
    contactLastName;

-- sort customers by last name in descending order Z-A
SELECT
    contactLastName,
    contactFirstName
FROM
    customers
ORDER By
    contactLastName DESC;

-- sort customers by last name descending and then
-- sort customers by first name ascending
SELECT
    contactLastName,
    contactFirstName
FROM
    customers
ORDER By
    contactLastName DESC,
    contactFirstName ASC;

-- sort order details by descending subtotal
-- subtotal = quantityOrdered * priceEach
SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderDetails
ORDER By
    subtotal DESC;

-- sort sales orders based on their status in order
SELECT
    orderNumber,
    status
FROM
    orders
ORDER By
    FIELD(
        status,
        'In Process', -- index 1
        'On Hold', -- 2
        'Cancelled', -- 3
        'Resolved', -- 4
        'Disputed', -- 5
        'Shipped' -- 6
    );