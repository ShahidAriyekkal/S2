mysql> CREATE TABLE CUSTOMERS (
    ->     CNAME VARCHAR(25) PRIMARY KEY,
    ->     CITY VARCHAR(25)
    -> );
mysql> CREATE TABLE DEPOSIT (
    ->     LOANNO VARCHAR(10) PRIMARY KEY,
    ->     CNAME VARCHAR(25) REFERENCES CUSTOMERS(CNAME),
    ->     BNAME VARCHAR(25) REFERENCES BRANCH(BNAME),
    ->     AMOUNT DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO CUSTOMERS (CNAME, CITY) VALUES
    -> ('Anil', 'Calicut'),
    -> ('Sunil', 'Delhi'),
    -> ('Raj', 'Mumbai'),
    -> ('Vikram', 'Bangalore'),
    -> ('Priya', 'Chennai');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0
mysql> INSERT INTO DEPOSIT (LOANNO, CNAME, BNAME, AMOUNT) VALUES
    -> ('D001', 'Anil', 'SBT', 10000),
    -> ('D002', 'Sunil', 'HDFC', 25000),
    -> ('D003', 'Raj', 'ICICI', 5000),
    -> ('D004', 'Vikram', 'SBI', 70000),
    -> ('D005', 'Priya', 'Axis', 15000);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0
  
mysql> SELECT DISTINCT D.CNAME
    -> FROM DEPOSIT D
    -> JOIN CUSTOMERS C ON D.CNAME = C.CNAME
    -> WHERE C.CITY = (SELECT CITY FROM CUSTOMERS WHERE CNAME = 'ANIL')
    -> AND D.AMOUNT > 2000;
+-------+
| CNAME |
+-------+
| Anil  |
+-------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT D1.CNAME
    -> FROM DEPOSIT D1
    -> JOIN DEPOSIT D2 ON D1.BNAME = D2.BNAME
    -> WHERE D2.CNAME = 'Sunil';
+-------+
| CNAME |
+-------+
| Sunil |
+-------+
1 row in set (0.00 sec)

mysql> SELECT D.CNAME
FROM DEPOSIT D
JOIN CUSTOMERS C ON D.CNAME = C.CNAME
WHERE C.CITY = 'calicut';
+-------+
| CNAME |
+-------+
| Anil  |
+-------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT CITY FROM CUSTOMERS
    -> JOIN DEPOSIT ON CUSTOMERS.CNAME = DEPOSIT.CNAME
    -> WHERE BNAME = 'SBT' AND CITY = 'Calicut';
+---------+
| CITY    |
+---------+
| Calicut |
+---------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT D.CNAME
    -> FROM DEPOSIT D
    -> JOIN CUSTOMERS C ON D.CNAME = C.CNAME
    -> WHERE D.AMOUNT < 50000
    -> AND C.CITY = (SELECT CITY FROM CUSTOMERS WHERE CNAME = 'ANIL');
+-------+
| CNAME |
+-------+
| Anil  |
+-------+
1 row in set (0.00 sec)

mysql> SELECT SUM(AMOUNT) AS Total_Deposit FROM DEPOSIT
    -> JOIN CUSTOMERS ON DEPOSIT.CNAME = CUSTOMERS.CNAME
    -> WHERE CITY = 'Calicut';
+---------------+
| Total_Deposit |
+---------------+
|      10000.00 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(AMOUNT) AS Max_Deposit FROM DEPOSIT
    -> JOIN CUSTOMERS ON DEPOSIT.CNAME = CUSTOMERS.CNAME
    -> WHERE CITY = 'Calicut';
+-------------+
| Max_Deposit |
+-------------+
|    10000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(AMOUNT) AS Total_Deposit FROM DEPOSIT
    -> JOIN CUSTOMERS ON DEPOSIT.CNAME = CUSTOMERS.CNAME
    -> WHERE CITY = (SELECT CITY FROM CUSTOMERS WHERE CNAME = 'Sunil');
+---------------+
| Total_Deposit |
+---------------+
|      25000.00 |
+---------------+
1 row in set (0.00 sec)
