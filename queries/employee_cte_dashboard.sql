-- 📊 Salary Tiers + CTE + RANK
WITH SalaryRanks AS (
    SELECT
        d.EmployeeID,
        d.FirstName,
        d.LastName,
        s.JobTitle,
        s.Salary,
        CASE
            WHEN s.Salary < 50000 THEN 'Junior'
            WHEN s.Salary BETWEEN 50000 AND 65000 THEN 'Mid-Level'
            ELSE 'Senior'
        END AS SalaryTier,
        RANK() OVER (PARTITION BY s.JobTitle ORDER BY s.Salary DESC) AS RankWithinRole
    FROM EmployeeDemographics d
    JOIN EmployeeSalary s ON d.EmployeeID = s.EmployeeID
)
SELECT * FROM SalaryRanks;
