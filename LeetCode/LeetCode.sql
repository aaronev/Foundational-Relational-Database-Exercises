-- https://leetcode.com/problemset/database/

-- 182 Duplicate Email

SELECT Email FROM person GROUP BY email HAVING COUNT(email) > 1

-- 183 Customers Who Never Order

SELECT name AS Customers FROM customers WHERE id NOT IN (SELECT customerId FROM orders)

-- 175 Combine two tables

SELECT FirstName, LastName, City, State FROM person LEFT JOIN address ON person.personID = address.personID

-- 176 Second Highest Salary

SELECT max(Salary) AS SecondHighestSalary FROM Employee WHERE Salary < (SELECT max(Salary) FROM Employee)

-- 177 Nth Highest Salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
    SELECT DISTINCT salary FROM employee ORDER BY salary DESC LIMIT 1 OFFSET M
  );
END


