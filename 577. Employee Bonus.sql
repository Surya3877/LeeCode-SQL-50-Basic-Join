# 577. Employee Bonus

/*
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+
empId is the column with unique values for this table.
Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
 

Table: Bonus

+-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+
empId is the column of unique values for this table.
empId is a foreign key (reference column) to empId from the Employee table.
Each row of this table contains the id of an employee and their respective bonus.
 

Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+
Bonus table:
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
Output: 
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+
*/

CREATE DATABASE IF NOT EXISTS 577_Employee_Bonus;
USE 577_Employee_Bonus;

CREATE TABLE Employee (
     empId INT,
     name VARCHAR(250),
     supervisor INT,
     salary INT
);

INSERT INTO Employee VALUES ('3', 'Brad', NULL, '4000');
INSERT INTO Employee VALUES ('1', 'John', '3', '1000');
INSERT INTO Employee VALUES ('2', 'Dan', '3', '2000');
INSERT INTO Employee VALUES ('4', 'Thomas', '3', '4000');

CREATE TABLE Bonus (
    empId INT,
    bonus INT
);

INSERT INTO Bonus (empid, bonus) VALUES ('2', '500');
INSERT INTO Bonus (empId, bonus) VALUES ('4', '2000');

# SQL Query

SELECT
    Employee.name,
    Bonus.bonus
FROM
    Employee
LEFT JOIN
    Bonus
ON
    Employee.empId = Bonus.empId
WHERE
    bonus < 1000
OR
    bonus is NULL;




    