--LeetCode.com




--Combine two tables

SELECT FirstName, LastName, City, State FROM person LEFT JOIN address ON person.personID = address.personID
SELECT max(Salary) AS SecondHighestSalary FROM Employee WHERE Salary < (SELECT max(Salary) FROM Employee)
