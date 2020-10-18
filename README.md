# MySql Tutorial  

Notes and work from following the course at [mysqltutorial.org](https://mysqltutorial.org/)  

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