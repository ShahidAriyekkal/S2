CREATE TABLE customers (
    cname VARCHAR(25) PRIMARY KEY,
    city VARCHAR(25)
);
insert into customers values("rishal nil","calicut"),("nived","kannur"),("aswin","new delhi");
insert into customers values("sahnid","calicut"),("abhinav","kollam");


mysql> select *from customers;
+------------+-----------+
| cname      | city      |
+------------+-----------+
| abhinav    | kollam    |
| aswin      | new delhi |
| nived      | kannur    |
| rishal nil | calicut   |
| sahnid     | calicut   |
+------------+-----------+
5 rows in set (0.00 sec)

mysql> select *from customers order by cname;
+------------+-----------+
| cname      | city      |
+------------+-----------+
| abhinav    | kollam    |
| aswin      | new delhi |
| nived      | kannur    |
| rishal nil | calicut   |
| sahnid     | calicut   |
+------------+-----------+
5 rows in set (0.00 sec)

mysql> select count(*) from customers;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) from customers where city='calicut';
+----------+
| count(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

mysql> select * from customers where city in('calicut','new delhi');
+------------+-----------+
| cname      | city      |
+------------+-----------+
| aswin      | new delhi |
| rishal nil | calicut   |
| sahnid     | calicut   |
+------------+-----------+
3 rows in set (0.00 sec)

mysql> select * from customers where city in('calicut','new delhi') and cname like '%nil%';
+------------+---------+
| cname      | city    |
+------------+---------+
| rishal nil | calicut |
+------------+---------+
1 row in set (0.00 sec)

mysql> select count(*),city from customers group by city;
+----------+-----------+
| count(*) | city      |
+----------+-----------+
|        1 | kollam    |
|        1 | new delhi |
|        1 | kannur    |
|        2 | calicut   |
+----------+-----------+
4 rows in set (0.00 sec)
