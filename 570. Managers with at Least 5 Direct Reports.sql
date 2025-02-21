# 570. Managers with at Least 5 Direct Reports

/*
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+
*/
 
CREATE DATABASE IF NOT EXISTS Managers_with_at_Least_5_Direct_Reports;
USE Managers_with_at_Least_5_Direct_Reports;

CREATE TABLE Employee (
    id int,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);
INSERT INTO Employee (id, name, department, managerId) VALUES ('101', 'John', 'A', NULL);
INSERT INTO Employee (id, name, department, managerId) VALUES ('102', 'Dan', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('103', 'James', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('104', 'Amy', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('105', 'Anne', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('106', 'Ron', 'B', '101');

/*
Write a solution to find managerId with at least five direct reports.

Return the result table in any order.
*/

# SQL Query

SELECT
    e.name
FROM
    Employee e
join
    employee m
ON
    e.id = m.managerId
GROUP BY
    e.name
HAVING
    count(m.managerId) >= 5;
