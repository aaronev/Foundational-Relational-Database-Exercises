-- https://leetcode.com/problemset/database/

-- 182 Duplicate Email

SELECT Email FROM person GROUP BY email HAVING COUNT(email) > 1

-- 183 Customers Who Never Order

SELECT name AS Customers FROM customers WHERE id not in(SELECT customerId FROM orders)

-- 175 Combine two tables

SELECT FirstName, LastName, City, State FROM person LEFT JOIN address ON person.personID = address.personID

-- 176 Second Highest Salary

SELECT max(Salary) AS SecondHighestSalary FROM Employee WHERE Salary < (SELECT max(Salary) FROM Employee)

-- 