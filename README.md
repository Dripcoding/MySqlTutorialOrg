# MySql Tutorial  

Notes and work from following the course at [mysqltutorial.org](https://mysqltutorial.org/)  

</br>

# Table of Contents
* SELECT
</br>
</br>

# SELECT

* SELECT allows you to read data from one or more tables. 
* SELECT tells mysql to retrieve data
* FROM specifies which table to retrieve data from

```
SELECT column1, column2 column3, FROM table_name;
```

* FROM should be on a new line to make queries more maintainable

```
SELECT column1, column2, column3
FROM table_name;
```

* MySql evaluates FROM cirst and then the SELECT

```
FROM table_name ---> SELECT column1, column2, column3
```

* Use ```SELECT *``` for ad-hoc queries
  * returns data from all columns which you may not need
  * uses unnecessary I/O disk and network traffic between the application and MySql server
  * may expose sensitive information to unauthorized users
  * queries that specify specific columns are easier to maintain

```
SELECT * FROM employees
```
</br>

# ORDER BY
* results from ```SELECT``` queries are not sorted
* use ```ORDER BY``` to sort the result set
* ```ORDER BY``` defaults to ascending order

```
SELECT
    column1
FROM
    table_name
ORDER BY
    column1 [ASC|DESC]
    column2 [ASC|DESC]
```
* ASC = ASCENDING

```
ORDER BY column1 ASC;
```
* DESC = DESCENDING

```
ORDER BY column1 DESC;
```
* sort result by columns in different orders

```
ORDER BY
    column1 ASC,
    column2 DESC
```

* sort the result set by the values in column1 ascending
* sort the sorted result by the values in column2 descending
<br/>
<br/>
* MySql evaluates ```ORDER BY``` after from and select

```
FROM ---> SELECT ---> ORDER BY
```
<br/>

* you can sort result sets from expressions
* this query will sort the results by the calculated subtotal
  
```
SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderDetails
ORDER By
    subtotal DESC;
```

* subtotal can be use in ```ORDER BY``` since alias is defined in the ```SELECT``` clause
<br/>

* you can sort data using a custom list using the ```FIELD()``` function

```
sort the sales orders based on their status in this order:
1. In Process
2. On Hold
3. Canceled
4. Resolved
5. Disputed
6. Shipped
```

```
SELECT
    orderNumber,
    status
FROM
    orders
ORDER By
    FIELD(
        status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped'
    );
```

```
FIELD(search string/column, string1, string2, string3, ...)
```
* sorts orders according to the value of FIELD() on a string
    * 'In Process' orders listed first
    * 'Shipped' orders listed last

</br>
</br>

# WHERE
* allows you to specify a search condition for the rows returned

```
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
```

* ```search_condition``` is a combination of one or more predicates using logical operators

```
AND OR NOT LIKE IN BETWEEN
```
* rows that cause the search_condition to be true are returned in the final result set

<br/>

* MySql evaluates ```WHERE``` before SELECT

```
FROM ---> WHERE ---> SELECT ---> ORDER BY
```

* use wildcards to find rows matching a specified pattern
  * ```%``` matches any string of zero or more chars
  * ```_``` matches any single character

```
WHERE lastname LIKE '%son';
```

* use ```IN``` to find values that match a value in a given list

```
value IN (value1, value2)
```

* use ```IS NULL``` to check if a value is null
  * null is used to mark that a piece of info is missing or unknown

use comparison operators to form search expressions

```
 = equal to
 <> or != less than
< less than
> greater than
<= less than or equal to
>= greater than or equal to 
```

# DISTINCT
* use ```DISTINCT``` to remove duplicate rows when querying data
* use to select unique rows
  
```
SELECT DISTINCT
    select_list
FROM
    table_name;
```
* ```DISTINCT``` keeps one NULL value from many in a column
* find unique combinations when using ```DISTINCT``` from multiple columns
  
```
SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY
    state,
    city;
```

<br/>

* ```GROUP BY``` without aggregate functiones behave like ```DISTINCT```

```
SELECT
    state
FROM
    customers
GROUP BY state;
```
* ```DISTINCT``` does not sort the result set
* ```GROUP BY``` does sort the result set

<br/>

* use ```DISTINCT``` to remove duplicates before using ```AGGREGATES```

```
SUM AVG COUNT
```

```
SELECT
    COUNT(DISTINCT state)
FROM
    customers
WHERE
    country = 'USA';
```

<br/>

* use ```LIMIT``` to find the first X unique rows

```
SELECT DISTINCT
    state
FROM
    customers
WHERE
    state IS NOT NULL
LIMIT 5;
```

# AND
* logical operator that combines 2 or more boolean expressions
* returns ```true``` if all expressions eval to true

```
expression1 AND expression2
```

* multiple expressions form a ```condition```
* ```short-circuit evaluation``` mysql stops evaluating expression when it can determine the result

```
SELECT 1 = 0 and 1 / 0;
mysql only evaluates  1 = 0 and stops since it returns false (0)
```

<br/>

# OR
* logical operator that combines boolean expressions and returns true when either condition is true
* uses short-circuit evaluation 
* ```operator precedence``` - OR is evaluated after AND expressions

```
SELECT true OR false AND false;
mysql returns true (1)
```

* use parens to change order of operations

```
SELECT (true OR false) AND false;
mysql returns false (0)
```

<br/>

# IN
* allows you to determine if a specified value matches any value in a set or result set of a subquery

```
SELECT 
    column1,column2,...
FROM
    table_name
WHERE 
	(expr|column_1) IN ('value1','value2',...);
```

* when values in the lsit are all constants
  * evaluate values based on type of column1 or result of expr
  * sort values
  * search for the value using binary search algorithm (very fast)

* if expression or value in list is NULL then NULL is returned
* combine ```IN``` with ```NOT``` to find values not in list
  
<br/>

* ```IN``` is often used with subqueries
* subqueries get a list of values from 1 or more tables and uses them as input values of the ```IN``` operator

```
SELECT    
	orderNumber, 
	customerNumber, 
	status, 
	shippedDate
FROM    
	orders
WHERE orderNumber IN
(
	 SELECT 
		 orderNumber
	 FROM 
		 orderDetails
	 GROUP BY 
		 orderNumber
	 HAVING SUM(quantityOrdered * priceEach) > 60000
);
```
  
<br />

# BETWEEN
* use ```BETWEEN``` operator to specify whether a value is in range or not

```
expr [NOT] BETWEEN begin_expr AND end_expr;
```

* all three expressions must be of the same data type
* ```BETWEEN``` is inclusive
  * if expr is >= value of begin_expr and expr is <= end_expr, return true
  * return false otherwise
* use ```NOT BETWEEN``` to find values outside the specified range
* use ```> and <``` to specify an exclusive range

# LIKE
* tests whether a string contains a specified pattern or not

```
expression LIKE pattern ESCAPE escape_character
```

* used in ```WHERE``` clause of SELECT, DELETE, UPDATE statements to filter data based on patterns

<br />

* ```%``` wildcard matches any string of 0 or more chars


```
s% matches any string that starts with 's'

%on% matches a substring

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';
```

* ```_``` matches any single char

```
se_ matches any string that starts with 'se' and is followed by any char

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';
```

<br/>

* use ```ESCAPE``` clause to speicy escape chars to wildcard is interpreted as a literal char
* ```\``` is the default escape char