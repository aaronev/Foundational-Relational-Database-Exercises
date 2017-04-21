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

--181 Employees Earning More Than Their Managers

SELECT 	e1.Name AS Employee
FROM 	Employee e1, Employee e2
WHERE 	e1.ManagerId = e2.Id AND e1.Salary > e2.Salary

--262 Trips and Users

SELECT Request_at as Day,
       ROUND(COUNT(IF(Status != 'completed', TRUE, NULL)) / COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips
WHERE (Request_at BETWEEN '2013-10-01' AND '2013-10-03')
      AND Client_id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
GROUP BY Request_at;

--196. Delete Duplicate Emails

DELETE FROM Person WHERE id NOT IN (SELECT t.id FROM (SELECT MIN(id) AS id FROM Person GROUP BY email) t)

