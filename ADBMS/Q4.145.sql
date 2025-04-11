mysql> CREATE TABLE BORROW (
    ->     LOANNO VARCHAR(10) PRIMARY KEY,
    ->     CNAME VARCHAR(25),
    ->     BNAME VARCHAR(25) REFERENCES BRANCH(BNAME),
    ->     AMOUNT DECIMAL(10,2));
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO BORROW (LOANNO, CNAME, BNAME, AMOUNT) VALUES
    -> ('L001', 'John Doe', 'SBT CALICUT', 20000.00),
    -> ('L002', 'Jane Smith', 'SBT NEW DELHI', 35000.00),
    -> ('L003', 'Alice Brown', 'SBT CALICUT', 18000.00),
    -> ('L004', 'Bob Johnson', 'SBT MUMBAI', 40000.00),
    -> ('L005', 'Eve Adams', 'SBT NEW DELHI', 25000.00);
Query OK, 5 rows affected (0.01 sec)
mysql> SELECT DISTINCT CNAME
    -> FROM BORROW
    -> WHERE BNAME = 'SBT CALICUT';
+-------------+
| CNAME       |
+-------------+
| John Doe    |
| Alice Brown |
+-------------+
2 rows in set (0.02 sec)

mysql> SELECT COUNT(DISTINCT CNAME) AS Total_Customers
    -> FROM BORROW;
+-----------------+
| Total_Customers |
+-----------------+
|               5 |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT CNAME) AS Customers_Calicut
    -> FROM BORROW
    -> WHERE BNAME = 'SBT CALICUT';
+-------------------+
| Customers_Calicut |
+-------------------+
|                 2 |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT CNAME, SUM(AMOUNT) AS Total_Loan
    -> FROM BORROW
    -> GROUP BY CNAME
    -> ORDER BY CNAME;
+-------------+------------+
| CNAME       | Total_Loan |
+-------------+------------+
| Alice Brown |   18000.00 |
| Bob Johnson |   40000.00 |
| Eve Adams   |   25000.00 |
| Jane Smith  |   35000.00 |
| John Doe    |   20000.00 |
+-------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT CNAME, AMOUNT
    -> FROM BORROW
    -> ORDER BY AMOUNT DESC
    -> LIMIT 1;
+-------------+----------+
| CNAME       | AMOUNT   |
+-------------+----------+
| Bob Johnson | 40000.00 |
+-------------+----------+
1 row in set (0.00 sec)

mysql> SELECT CNAME, SUM(AMOUNT) AS Total_Loan
    -> FROM BORROW
    -> GROUP BY CNAME
    -> ORDER BY Total_Loan DESC
    -> LIMIT 1;
+-------------+------------+
| CNAME       | Total_Loan |
+-------------+------------+
| Bob Johnson |   40000.00 |
+-------------+------------+
1 row in set (0.00 sec)
