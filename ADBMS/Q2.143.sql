create table deposit(accno varchar(10) primary key,cname varchar(25),bname varchar(25) references branch(bname),amount decimal(10,2),accdate date);
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO DEPOSIT (ACCNO, CNAME, BNAME, AMOUNT, ACCDATE) VALUES
    -> ('D001', 'John Doe', 'SBT CALICUT', 5000.00, '2008-05-12'),
    -> ('D002', 'Jane Smith', 'SBT NEW DELHI', 7500.00, '2009-11-25'),
    -> ('D003', 'Alice Brown', 'SBT CALICUT', 8200.00, '2010-03-15'),
    -> ('D004', 'Bob Johnson', 'SBT MUMBAI', 10000.00, '2007-08-22'),
    -> ('D005', 'Eve Adams', 'SBT NEW DELHI', 6400.00, '2009-07-18');

mysql> SELECT SUM(AMOUNT) AS Total_Deposits FROM DEPOSIT;
+----------------+
| Total_Deposits |
+----------------+
|       37100.00 |
+----------------+
1 row in set (0.01 sec)

mysql> SELECT SUM(AMOUNT) AS Total_Deposits_Calicut
    -> FROM DEPOSIT
    -> WHERE BNAME = 'SBT CALICUT';
+------------------------+
| Total_Deposits_Calicut |
+------------------------+
|               13200.00 |
+------------------------+
1 row in set (0.00 sec)

mysql> SELECT BNAME, SUM(AMOUNT) AS Total_Deposits
    -> FROM DEPOSIT
    -> WHERE BNAME IN ('SBT CALICUT', 'SBT NEW DELHI')
    -> GROUP BY BNAME;
+---------------+----------------+
| BNAME         | Total_Deposits |
+---------------+----------------+
| SBT CALICUT   |       13200.00 |
| SBT NEW DELHI |       13900.00 |
+---------------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT BNAME, SUM(AMOUNT) AS Total_Deposits
    -> FROM DEPOSIT
    -> GROUP BY BNAME
    -> ORDER BY Total_Deposits DESC
    -> LIMIT 1;
+---------------+----------------+
| BNAME         | Total_Deposits |
+---------------+----------------+
| SBT NEW DELHI |       13900.00 |
+---------------+----------------+
1 row in set (0.00 sec)

mysql> SELECT BNAME, ACCNO, AMOUNT
    -> FROM DEPOSIT
    -> ORDER BY AMOUNT DESC
    -> LIMIT 1;
+------------+-------+----------+
| BNAME      | ACCNO | AMOUNT   |
+------------+-------+----------+
| SBT MUMBAI | D004  | 10000.00 |
+------------+-------+----------+
1 row in set (0.00 sec)

mysql> SELECT BNAME, SUM(AMOUNT) AS Total_Deposits
    -> FROM DEPOSIT
    -> GROUP BY BNAME;
+---------------+----------------+
| BNAME         | Total_Deposits |
+---------------+----------------+
| SBT CALICUT   |       13200.00 |
| SBT NEW DELHI |       13900.00 |
| SBT MUMBAI    |       10000.00 |
+---------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT SUM(AMOUNT) AS Total_Deposits
    -> FROM DEPOSIT
    -> WHERE ACCDATE BETWEEN '2008-01-01' AND '2009-12-01';
+----------------+
| Total_Deposits |
+----------------+
|       18900.00 |
+----------------+
1 row in set (0.00 sec)
