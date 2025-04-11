mysql> CREATE TABLE BRANCH(BNAME VARCHAR(25) PRIMARY KEY,PLACE VARCHAR(25));
Query OK, 0 rows affected (0.04 sec)


mysql> create table DEPOSIT (ACCNO VARCHAR(10) PRIMARY KEY ,CNAME VARCHAR(25),BNAME VARCHAR(25) REFERENCES BRANCH(BNAME),AMOUNT DECIMAL(10,2),ACCDATE DATE);
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO BRANCH VALUES('SBT','CALICUT'),('CANARA','KOCHI'),('FEDERAL','PALAKKAD');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> INSERT INTO DEPOSIT
    -> VALUES
    ->     (1101, 'DAWD', 'SBT', 2345, '2034-03-22'),
    ->     (1102, 'ADDS', 'CANARA', 2367, '2034-04-22'),
    ->     (1103, 'DFSD', 'SBT', 234567, '2034-03-20'),
    ->     (1104, 'DFGHD', 'CANARA', 22340, '2034-03-25'),
    ->     (1105, 'DADZX', 'SBT', 23427, '2034-03-19');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPOSIT JOIN BRANCH WHERE BRANCH.BNAME='SBT' AND BRANCH.PLACE='CALICUT';
+-------+-------+--------+-----------+------------+-------+---------+
| ACCNO | CNAME | BNAME  | AMOUNT    | ACCDATE    | BNAME | PLACE   |
+-------+-------+--------+-----------+------------+-------+---------+
| 1101  | DAWD  | SBT    |   2345.00 | 2034-03-22 | SBT   | CALICUT |
| 1102  | ADDS  | CANARA |   2367.00 | 2034-04-22 | SBT   | CALICUT |
| 1103  | DFSD  | SBT    | 234567.00 | 2034-03-20 | SBT   | CALICUT |
| 1104  | DFGHD | CANARA |  22340.00 | 2034-03-25 | SBT   | CALICUT |
| 1105  | DADZX | SBT    |  23427.00 | 2034-03-19 | SBT   | CALICUT |
+-------+-------+--------+-----------+------------+-------+---------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM BRANCH;
+---------+----------+
| BNAME   | PLACE    |
+---------+----------+
| CANARA  | KOCHI    |
| FEDERAL | PALAKKAD |
| SBT     | CALICUT  |
+---------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT,BRANCH WHERE BRANCH.BNAME='SBT';
+-------+-------+--------+-----------+------------+-------+---------+
| ACCNO | CNAME | BNAME  | AMOUNT    | ACCDATE    | BNAME | PLACE   |
+-------+-------+--------+-----------+------------+-------+---------+
| 1101  | DAWD  | SBT    |   2345.00 | 2034-03-22 | SBT   | CALICUT |
| 1102  | ADDS  | CANARA |   2367.00 | 2034-04-22 | SBT   | CALICUT |
| 1103  | DFSD  | SBT    | 234567.00 | 2034-03-20 | SBT   | CALICUT |
| 1104  | DFGHD | CANARA |  22340.00 | 2034-03-25 | SBT   | CALICUT |
| 1105  | DADZX | SBT    |  23427.00 | 2034-03-19 | SBT   | CALICUT |
+-------+-------+--------+-----------+------------+-------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT,BRANCH WHERE BRANCH.BNAME=DEPOSIT.BNAME;
+-------+-------+--------+-----------+------------+--------+---------+
| ACCNO | CNAME | BNAME  | AMOUNT    | ACCDATE    | BNAME  | PLACE   |
+-------+-------+--------+-----------+------------+--------+---------+
| 1101  | DAWD  | SBT    |   2345.00 | 2034-03-22 | SBT    | CALICUT |
| 1102  | ADDS  | CANARA |   2367.00 | 2034-04-22 | CANARA | KOCHI   |
| 1103  | DFSD  | SBT    | 234567.00 | 2034-03-20 | SBT    | CALICUT |
| 1104  | DFGHD | CANARA |  22340.00 | 2034-03-25 | CANARA | KOCHI   |
| 1105  | DADZX | SBT    |  23427.00 | 2034-03-19 | SBT    | CALICUT |
+-------+-------+--------+-----------+------------+--------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT JOIN BRANCH WHERE BRANCH.BNAME=DEPOSIT.BNAME;
+-------+-------+--------+-----------+------------+--------+---------+
| ACCNO | CNAME | BNAME  | AMOUNT    | ACCDATE    | BNAME  | PLACE   |
+-------+-------+--------+-----------+------------+--------+---------+
| 1101  | DAWD  | SBT    |   2345.00 | 2034-03-22 | SBT    | CALICUT |
| 1102  | ADDS  | CANARA |   2367.00 | 2034-04-22 | CANARA | KOCHI   |
| 1103  | DFSD  | SBT    | 234567.00 | 2034-03-20 | SBT    | CALICUT |
| 1104  | DFGHD | CANARA |  22340.00 | 2034-03-25 | CANARA | KOCHI   |
| 1105  | DADZX | SBT    |  23427.00 | 2034-03-19 | SBT    | CALICUT |
+-------+-------+--------+-----------+------------+--------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT NATURAL JOIN BRANCH BNAME;
+--------+-------+-------+-----------+------------+---------+
| BNAME  | ACCNO | CNAME | AMOUNT    | ACCDATE    | PLACE   |
+--------+-------+-------+-----------+------------+---------+
| SBT    | 1101  | DAWD  |   2345.00 | 2034-03-22 | CALICUT |
| CANARA | 1102  | ADDS  |   2367.00 | 2034-04-22 | KOCHI   |
| SBT    | 1103  | DFSD  | 234567.00 | 2034-03-20 | CALICUT |
| CANARA | 1104  | DFGHD |  22340.00 | 2034-03-25 | KOCHI   |
| SBT    | 1105  | DADZX |  23427.00 | 2034-03-19 | CALICUT |
+--------+-------+-------+-----------+------------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT NATURAL JOIN BRANCH BNAME WHERE BNAME='SBT';
+-------+-------+-------+-----------+------------+---------+
| BNAME | ACCNO | CNAME | AMOUNT    | ACCDATE    | PLACE   |
+-------+-------+-------+-----------+------------+---------+
| SBT   | 1101  | DAWD  |   2345.00 | 2034-03-22 | CALICUT |
| SBT   | 1103  | DFSD  | 234567.00 | 2034-03-20 | CALICUT |
| SBT   | 1105  | DADZX |  23427.00 | 2034-03-19 | CALICUT |
+-------+-------+-------+-----------+------------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT NATURAL JOIN BRANCH BNAME COUNT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'COUNT' at line 1
mysql> SELECT COUNT FROM DEPOSIT NATURAL JOIN BRANCH BNAME WHERE BNAME='SBT';
ERROR 1054 (42S22): Unknown column 'COUNT' in 'field list'
mysql> SELECT COUNT(BNAME) FROM DEPOSIT NATURAL JOIN BRANCH BNAME WHERE BNAME='SBT';
+--------------+
| COUNT(BNAME) |
+--------------+
|            3 |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(AMOUNT) FROM DEPOSIT NATURAL JOIN BRANCH BNAME ;
+-------------+
| MAX(AMOUNT) |
+-------------+
|   234567.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT *,MAX(AMOUNT) FROM DEPOSIT NATURAL JOIN BRANCH BNAME ;
+-------+-------+-------+---------+------------+---------+-------------+
| BNAME | ACCNO | CNAME | AMOUNT  | ACCDATE    | PLACE   | MAX(AMOUNT) |
+-------+-------+-------+---------+------------+---------+-------------+
| SBT   | 1101  | DAWD  | 2345.00 | 2034-03-22 | CALICUT |   234567.00 |
+-------+-------+-------+---------+------------+---------+-------------+
1 row in set (0.00 sec)

mysql> SELECT *,MAX(AMOUNT) FROM DEPOSIT NATURAL JOIN BRANCH BNAME WHERE BNAME='CANARA';
+--------+-------+-------+---------+------------+-------+-------------+
| BNAME  | ACCNO | CNAME | AMOUNT  | ACCDATE    | PLACE | MAX(AMOUNT) |
+--------+-------+-------+---------+------------+-------+-------------+
| CANARA | 1102  | ADDS  | 2367.00 | 2034-04-22 | KOCHI |    22340.00 |
+--------+-------+-------+---------+------------+-------+-------------+
1 row in set (0.00 sec)

mysql> SELECT *,MAX(AMOUNT) FROM DEPOSIT NATURAL JOIN BRANCH BNAME WHERE BNAME='SBT';
+-------+-------+-------+---------+------------+---------+-------------+
| BNAME | ACCNO | CNAME | AMOUNT  | ACCDATE    | PLACE   | MAX(AMOUNT) |
+-------+-------+-------+---------+------------+---------+-------------+
| SBT   | 1101  | DAWD  | 2345.00 | 2034-03-22 | CALICUT |   234567.00 |
+-------+-------+-------+---------+------------+---------+-------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT ORDER BY (AMOUNT) DESC;
+-------+-------+--------+-----------+------------+
| ACCNO | CNAME | BNAME  | AMOUNT    | ACCDATE    |
+-------+-------+--------+-----------+------------+
| 1103  | DFSD  | SBT    | 234567.00 | 2034-03-20 |
| 1105  | DADZX | SBT    |  23427.00 | 2034-03-19 |
| 1104  | DFGHD | CANARA |  22340.00 | 2034-03-25 |
| 1102  | ADDS  | CANARA |   2367.00 | 2034-04-22 |
| 1101  | DAWD  | SBT    |   2345.00 | 2034-03-22 |
+-------+-------+--------+-----------+------------+
5 rows in set (0.00 sec)

mysql> PROJECT CNAME FROM DEPOSIT WHERE BNAME='SBT';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'PROJECT CNAME FROM DEPOSIT WHERE BNAME='SBT'' at line 1
mysql> SELECT CNAME FROM DEPOSIT WHERE BNAME='SBT';
+-------+
| CNAME |
+-------+
| DAWD  |
| DFSD  |
| DADZX |
+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT WHERE ACCDATE>2009-01-01;
+-------+-------+--------+-----------+------------+
| ACCNO | CNAME | BNAME  | AMOUNT    | ACCDATE    |
+-------+-------+--------+-----------+------------+
| 1101  | DAWD  | SBT    |   2345.00 | 2034-03-22 |
| 1102  | ADDS  | CANARA |   2367.00 | 2034-04-22 |
| 1103  | DFSD  | SBT    | 234567.00 | 2034-03-20 |
| 1104  | DFGHD | CANARA |  22340.00 | 2034-03-25 |
| 1105  | DADZX | SBT    |  23427.00 | 2034-03-19 |
+-------+-------+--------+-----------+------------+
5 rows in set, 1 warning (0.00 sec)

mysql> SHOW TABLES
    -> ;
+---------------+
| Tables_in_new |
+---------------+
| branch        |
| deposit       |
+---------------+
2 rows in set (0.02 sec)

mysql> SELECT 8 FROM BRANCH;
+---+
| 8 |
+---+
| 8 |
| 8 |
| 8 |
+---+
3 rows in set (0.00 sec)

mysql> SELECT * FROM BRANCH;
+---------+----------+
| BNAME   | PLACE    |
+---------+----------+
| CANARA  | KOCHI    |
| FEDERAL | PALAKKAD |
| SBT     | CALICUT  |
+---------+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT WHERE BNAME='SBT';
+-------+-------+-------+-----------+------------+
| ACCNO | CNAME | BNAME | AMOUNT    | ACCDATE    |
+-------+-------+-------+-----------+------------+
| 1101  | DAWD  | SBT   |   2345.00 | 2034-03-22 |
| 1103  | DFSD  | SBT   | 234567.00 | 2034-03-20 |
| 1105  | DADZX | SBT   |  23427.00 | 2034-03-19 |
+-------+-------+-------+-----------+------------+
3 rows in set (0.00 sec)

mysql> SELECT CNAME,MAX(AMOUNT) FROM DEPOSIT
    -> ;
+-------+-------------+
| CNAME | MAX(AMOUNT) |
+-------+-------------+
| DAWD  |   234567.00 |
+-------+-------------+
1 row in set (0.00 sec)

mysql> SELECT CNAME FROM DEPOSIT WHERE MAX(AMOUNT)=AMOUNT;
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT CNAME FROM DEPOSIT WHERE (SELECT MAX(AMOUNT)=AMOUNT);
+-------+
| CNAME |
+-------+
| DAWD  |
| ADDS  |
| DFSD  |
| DFGHD |
| DADZX |
+-------+
5 rows in set (0.00 sec)

mysql> SELECT CNAME FROM DEPOSIT WHERE AMOUNT=(SELECT MAX(AMOUNT) FROM DEPOSIT);
+-------+
| CNAME |
+-------+
| DFSD  |
+-------+
1 row in set (0.00 sec)

mysql> SELECT CNAME,AMOUNT FROM DEPOSIT WHERE AMOUNT=(SELECT MAX(AMOUNT) FROM DEPOSIT);
+-------+-----------+
| CNAME | AMOUNT    |
+-------+-----------+
| DFSD  | 234567.00 |
+-------+-----------+
1 row in set (0.00 sec)

mysql> SELECT CNAME,AMOUNT FROM DEPOSIT WHERE AMOUNT=(SELECT MAX(AMOUNT) FROM DEPOSIT) AND BNAME='SBT';
+-------+-----------+
| CNAME | AMOUNT    |
+-------+-----------+
| DFSD  | 234567.00 |
+-------+-----------+
1 row in set (0.00 sec)

mysql> SELECT CNAME,AMOUNT FROM DEPOSIT WHERE AMOUNT=(SELECT MAX(AMOUNT) FROM DEPOSIT) AND BNAME='CANARA';
Empty set (0.00 sec)

mysql> SELECT CNAME,AMOUNT FROM DEPOSIT WHERE AMOUNT=(SELECT MAX(AMOUNT) FROM DEPOSIT WHERE BNAME='SBT');
+-------+-----------+
| CNAME | AMOUNT    |
+-------+-----------+
| DFSD  | 234567.00 |
+-------+-----------+
1 row in set (0.00 sec)

mysql> SELECT CNAME,AMOUNT FROM DEPOSIT WHERE AMOUNT=(SELECT MAX(AMOUNT) FROM DEPOSIT WHERE BNAME='CANARA');
+-------+----------+
| CNAME | AMOUNT   |
+-------+----------+
| DFGHD | 22340.00 |
+-------+----------+
1 row in set (0.00 sec)

mysql> SELECT CNAME,AMOUNT FROM DEPOSIT WHERE AMOUNT=(SELECT MIN(AMOUNT) FROM DEPOSIT WHERE BNAME='SBT');
+-------+---------+
| CNAME | AMOUNT  |
+-------+---------+
| DAWD  | 2345.00 |
+-------+---------+
1 row in set (0.00 sec)

mysql> SELECT * FROM DEPOSIT
    -> ;
+-------+-------+--------+-----------+------------+
| ACCNO | CNAME | BNAME  | AMOUNT    | ACCDATE    |
+-------+-------+--------+-----------+------------+
| 1101  | DAWD  | SBT    |   2345.00 | 2034-03-22 |
| 1102  | ADDS  | CANARA |   2367.00 | 2034-04-22 |
| 1103  | DFSD  | SBT    | 234567.00 | 2034-03-20 |
| 1104  | DFGHD | CANARA |  22340.00 | 2034-03-25 |
| 1105  | DADZX | SBT    |  23427.00 | 2034-03-19 |
+-------+-------+--------+-----------+------------+
5 rows in set (0.00 sec)
