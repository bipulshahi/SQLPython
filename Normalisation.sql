-- Example 1: First Normal Form (1NF)

-- 1NF: Each table cell should contain a single value, and each record needs to be unique.

-- Problem:
-- A table with multiple values in a single column.

-- Denormalized Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
);

-- Sample Data
INSERT INTO Orders (OrderID, CustomerName, Products) VALUES
(1, 'Alice', 'Product1, Product2'),
(2, 'Bob', 'Product3, Product4, Product5');

-- Solution:
-- Separate the products into different rows.

-- Normalized Table (1NF)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Sample Data
INSERT INTO Orders (OrderID, CustomerName) VALUES
(1, 'Alice'),
(2, 'Bob');

INSERT INTO OrderProducts (OrderID, Product) VALUES
(1, 'Product1'),
(1, 'Product2'),
(2, 'Product3'),
(2, 'Product4'),
(2, 'Product5');

-- Example 2: Second Normal Form (2NF)

-- 2NF: Achieve 1NF and remove partial dependencies (i.e., no non-prime attribute should be dependent on any subset of any candidate key).

-- Problem:
-- A table where non-key attributes depend on part of a composite key.

-- Denormalized Table
CREATE TABLE Sales (
    SaleID INT,
    ProductID INT,
    ProductName VARCHAR(100),
    CustomerName VARCHAR(100),
    PRIMARY KEY (SaleID, ProductID)
);

-- Sample Data
INSERT INTO Sales (SaleID, ProductID, ProductName, CustomerName) VALUES
(1, 101, 'Product1', 'Alice'),
(1, 102, 'Product2', 'Alice'),
(2, 103, 'Product3', 'Bob');

-- Solution:
-- Separate the product information into its own table.

-- Normalized Table (2NF)
CREATE TABLE Sales (
    SaleID INT,
    ProductID INT,
    CustomerName VARCHAR(100),
    PRIMARY KEY (SaleID, ProductID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

-- Sample Data
INSERT INTO Sales (SaleID, ProductID, CustomerName) VALUES
(1, 101, 'Alice'),
(1, 102, 'Alice'),
(2, 103, 'Bob');

INSERT INTO Products (ProductID, ProductName) VALUES
(101, 'Product1'),
(102, 'Product2'),
(103, 'Product3');

-- Example 3: Third Normal Form (3NF)

-- 3NF: Achieve 2NF and remove transitive dependencies (i.e., non-key attributes should not depend on other non-key attributes).

-- Problem:
-- A table where non-key attributes depend on other non-key attributes.

-- Denormalized Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    DepartmentName VARCHAR(100)
);

-- Sample Data
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID, DepartmentName) VALUES
(1, 'Alice', 10, 'HR'),
(2, 'Bob', 20, 'Sales'),
(3, 'Charlie', 10, 'HR');

-- Solution:
-- Separate the department information into its own table.

-- Normalized Table (3NF)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Sample Data
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 10);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(10, 'HR'),
(20, 'Sales');
