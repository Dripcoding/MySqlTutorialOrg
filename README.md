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