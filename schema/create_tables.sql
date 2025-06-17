-- 🎛️ Table 1: Employee Demographics
CREATE TABLE EmployeeDemographics (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10)
);

-- 🎚️ Table 2: Employee Salary & Roles
CREATE TABLE EmployeeSalary (
    EmployeeID INT,
    JobTitle VARCHAR(100),
    Salary INT,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeDemographics(EmployeeID)
);

