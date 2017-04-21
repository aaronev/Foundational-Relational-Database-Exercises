-- https://leetcode.com/problemset/database/

-- 182 Duplicate Email

SELECT Email 
FROM person 
GROUP BY email 
HAVING COUNT(email) > 1

-- 183 Customers Who Never Order

SELECT name AS Customers 
FROM customers 
WHERE id NOT IN (SELECT customerId FROM orders)

-- 175 Combine two tables

SELECT FirstName, LastName, City, State 
FROM person 
LEFT JOIN address 
ON person.personID = address.personID

-- 176 Second Highest Salary

SELECT max(Salary) AS SecondHighestSalary 
FROM Employee 
WHERE Salary < (SELECT max(Salary) FROM Employee)

-- 177 Nth Highest Salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
    SELECT DISTINCT salary FROM employee ORDER BY salary DESC LIMIT 1 OFFSET M
  );
END 

--197 Rising Temperature

SELECT a.Id 
FROM weather a, weather b 
WHERE (DATEDIFF(a.date, b.date) = 1) AND a.temperature > b.temperature


--185 Department Top Three Salaries

SELECT dep.Name AS Department, emp.Name AS Employee, emp.Salary FROM Department dep, 
Employee emp WHERE emp.DepartmentId=dep.Id AND 
(SELECT COUNT(DISTINCT Salary) FROM Employee WHERE DepartmentId=dep.Id AND Salary>emp.Salary)<3


--NOTE: some specs are unclear it requires knowledge that were not covered such as CREATE FUNCTION