-- 🔍 Top 3 Earners (Company-wide)
SELECT
    d.FirstName,
    d.LastName,
    s.JobTitle,
    s.Salary,
    RANK() OVER (ORDER BY s.Salary DESC) AS OverallRank
FROM EmployeeDemographics d
JOIN EmployeeSalary s ON d.EmployeeID = s.EmployeeID
WHERE RANK() OVER (ORDER BY s.Salary DESC) <= 3;

-- Clean version with subquery
WITH RankedSalaries AS (
    SELECT
        d.FirstName,
        d.LastName,
        s.JobTitle,
        s.Salary,
        RANK() OVER (ORDER BY s.Salary DESC) AS OverallRank
    FROM EmployeeDemographics d
    JOIN EmployeeSalary s ON d.EmployeeID = s.EmployeeID
)
SELECT * FROM RankedSalaries
WHERE OverallRank <= 3;

-- TOP 3 EARNERS — RANKED GLOBALLY

WITH RankedSalaries AS (
    SELECT
        d.FirstName,
        d.LastName,
        s.JobTitle,
        s.Salary,
        RANK() OVER (ORDER BY s.Salary DESC) AS OverallRank
    FROM EmployeeDemographics d
    JOIN EmployeeSalary s ON d.EmployeeID = s.EmployeeID
)
SELECT * FROM RankedSalaries
WHERE OverallRank <= 3;


