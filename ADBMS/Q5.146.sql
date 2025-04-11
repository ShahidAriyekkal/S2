 CREATE TABLE BORROW (
    ->     LOANNO VARCHAR(10) PRIMARY KEY,
    ->     CNAME VARCHAR(25) REFERENCES CUSTOMERS(CNAME),
    ->     BNAME VARCHAR(25) REFERENCES BRANCH(BNAME),
    ->     AMOUNT DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO BORROW (LOANNO, CNAME, BNAME, AMOUNT) VALUES
    -> ('L001', 'Anil', 'SBT', 50000),
    -> ('L002', 'Sunil', 'HDFC', 70000),
    -> ('L003', 'Raj', 'ICICI', 45000),
    -> ('L004', 'Vikram', 'SBI', 30000),
    -> ('L005', 'Priya', 'Axis', 60000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT SUM(AMOUNT) AS Total_Loan FROM BORROW;
+------------+
| Total_Loan |
+------------+
|  255000.00 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(AMOUNT) AS Average_Loan FROM BORROW;
+--------------+
| Average_Loan |
+--------------+
| 51000.000000 |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT AMOUNT FROM BORROW WHERE CNAME = 'Anil';
+----------+
| AMOUNT   |
+----------+
| 50000.00 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT BNAME FROM BORROW GROUP BY BNAME HAVING COUNT(*) >= 3;
Empty set (0.00 sec)

mysql> SELECT BNAME FROM BORROW GROUP BY BNAME ORDER BY COUNT(*) DESC LIMIT 1;
+-------+
| BNAME |
+-------+
| SBT   |
+-------+
1 row in set (0.00 sec)

mysql> SELECT BNAME, COUNT(*) AS Loan_Count FROM BORROW GROUP BY BNAME;
+-------+------------+
| BNAME | Loan_Count |
+-------+------------+
| SBT   |          1 |
| HDFC  |          1 |
| ICICI |          1 |
| SBI   |          1 |
| Axis  |          1 |
+-------+------------+
5 rows in set (0.00 sec)
