-- report the second highest salary from the Employee table.

SELECT 
    IFNULL((
        SELECT DISTINCT Salary
        FROM Employee
        WHERE Salary < (SELECT MAX(Salary) FROM Employee) 
        ORDER BY Salary DESC
        LIMIT 1), NULL)  AS SecondHighestSalary