-- 🌟 Top 3 Earners with Global Ranking

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
