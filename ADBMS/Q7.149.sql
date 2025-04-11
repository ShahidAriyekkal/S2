mysql> CREATE TABLE BRANCH (
    ->     BNAME VARCHAR(25) PRIMARY KEY,
    ->     CITY VARCHAR(25)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE CUSTOMERS (
    ->     CNAME VARCHAR(25) PRIMARY KEY,
    ->     CITY VARCHAR(25)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> CREATE TABLE DEPOSIT (
    ->     LOANNO VARCHAR(10) PRIMARY KEY,
    ->     CNAME VARCHAR(25) REFERENCES CUSTOMERS(CNAME),
    ->     BNAME VARCHAR(25) REFERENCES BRANCH(BNAME),
    ->     AMOUNT DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> CREATE TABLE BORROW (
    ->     LOANNO VARCHAR(10) PRIMARY KEY,
    ->     CNAME VARCHAR(25) REFERENCES CUSTOMERS(CNAME),
    ->     BNAME VARCHAR(25) REFERENCES BRANCH(BNAME),
    ->     AMOUNT DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> -- Insert into BRANCH Table
mysql> INSERT INTO BRANCH (BNAME, CITY) VALUES
    -> ('SBI KOLKATA', 'KOLKATA'),
    -> ('SBT NEW DELHI', 'NEW DELHI'),
    -> ('ICICI MUMBAI', 'MUMBAI'),
    -> ('HDFC CHENNAI', 'CHENNAI'),
    -> ('PNB CALICUT', 'CALICUT');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert into CUSTOMERS Table
mysql> INSERT INTO CUSTOMERS (CNAME, CITY) VALUES
    -> ('RAHUL', 'KOLKATA'),
    -> ('ANIL', 'MUMBAI'),
    -> ('SUNIL', 'NEW DELHI'),
    -> ('PRIYA', 'CHENNAI'),
    -> ('KAVYA', 'CALICUT'),
    -> ('VIKRAM', 'CALICUT');  -- Added Vikram to satisfy question (c)
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert into DEPOSIT Table
mysql> INSERT INTO DEPOSIT (LOANNO, CNAME, BNAME, AMOUNT) VALUES
    -> ('D001', 'RAHUL', 'SBI KOLKATA', 5000),
    -> ('D002', 'ANIL', 'ICICI MUMBAI', 12000),
    -> ('D003', 'SUNIL', 'SBT NEW DELHI', 8000),
    -> ('D004', 'PRIYA', 'HDFC CHENNAI', 20000),
    -> ('D005', 'KAVYA', 'PNB CALICUT', 7000),
    -> ('D006', 'VIKRAM', 'SBT NEW DELHI', 10000);  -- Vikram is from CALICUT but has an account in SBT NEW DELHI
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert into BORROW Table
mysql> INSERT INTO BORROW (LOANNO, CNAME, BNAME, AMOUNT) VALUES
    -> ('B001', 'RAHUL', 'SBI KOLKATA', 25000),
    -> ('B002', 'ANIL', 'ICICI MUMBAI', 10000),
    -> ('B003', 'SUNIL', 'SBT NEW DELHI', 15000),
    -> ('B004', 'PRIYA', 'HDFC CHENNAI', 30000),
    -> ('B005', 'KAVYA', 'PNB CALICUT', 5000);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT C.CNAME
    -> FROM CUSTOMERS C
    -> JOIN DEPOSIT D ON C.CNAME = D.CNAME
    -> WHERE C.CITY = 'CALICUT' AND D.BNAME = 'SBT NEW DELHI';
+--------+
| CNAME  |
+--------+
| VIKRAM |
+--------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT D.CNAME
    -> FROM DEPOSIT D
    -> JOIN BORROW B ON D.CNAME = B.CNAME
    -> WHERE D.BNAME = 'SBT NEW DELHI' AND B.BNAME = 'SBT NEW DELHI';
+-------+
| CNAME |
+-------+
| SUNIL |
+-------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT D.CNAME
    -> FROM DEPOSIT D
    -> WHERE D.CNAME NOT IN (SELECT CNAME FROM BORROW);
+--------+
| CNAME  |
+--------+
| VIKRAM |
+--------+
1 row in set (0.00 sec)

mysql> SELECT C.CNAME,
    ->        COALESCE(D.AMOUNT, 0) AS DEPOSIT_AMOUNT,
    ->        COALESCE(B.AMOUNT, 0) AS LOAN_AMOUNT
    -> FROM CUSTOMERS C
    -> LEFT JOIN DEPOSIT D ON C.CNAME = D.CNAME
    -> LEFT JOIN BORROW B ON C.CNAME = B.CNAME;
+--------+----------------+-------------+
| CNAME  | DEPOSIT_AMOUNT | LOAN_AMOUNT |
+--------+----------------+-------------+
| RAHUL  |        5000.00 |    25000.00 |
| ANIL   |       12000.00 |    10000.00 |
| SUNIL  |        8000.00 |    15000.00 |
| PRIYA  |       20000.00 |    30000.00 |
| KAVYA  |        7000.00 |     5000.00 |
| VIKRAM |       10000.00 |        0.00 |
+--------+----------------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT D.CNAME
    -> FROM DEPOSIT D
    -> JOIN CUSTOMERS C ON D.CNAME = C.CNAME
    -> WHERE D.AMOUNT < 50000
    -> AND C.CITY = (SELECT CITY FROM CUSTOMERS WHERE CNAME = 'ANIL');
+-------+
| CNAME |
+-------+
| ANIL  |
+-------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT C.CNAME
    -> FROM CUSTOMERS C
    -> JOIN DEPOSIT D ON C.CNAME = D.CNAME
    -> JOIN BORROW B ON C.CNAME = B.CNAME
    -> WHERE D.AMOUNT > B.AMOUNT;
+-------+
| CNAME |
+-------+
| ANIL  |
| KAVYA |
+-------+
2 rows in set (0.00 sec)

mysql> SELECT C.CITY, SUM(D.AMOUNT) AS TOTAL_DEPOSIT
    -> FROM CUSTOMERS C
    -> JOIN DEPOSIT D ON C.CNAME = D.CNAME
    -> GROUP BY C.CITY;
+-----------+---------------+
| CITY      | TOTAL_DEPOSIT |
+-----------+---------------+
| KOLKATA   |       5000.00 |
| MUMBAI    |      12000.00 |
| NEW DELHI |       8000.00 |
| CHENNAI   |      20000.00 |
| CALICUT   |      17000.00 |
+-----------+---------------+
5 rows in set (0.00 sec)
