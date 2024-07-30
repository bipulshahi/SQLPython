-- Create countries table
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50)
);

-- Insert data into countries table
INSERT INTO countries (country_id, country_name) VALUES
('US', 'United States'),
('IN', 'India'),
('AU', 'Australia');

-- Create locations table
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(100),
    postal_code VARCHAR(20),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id CHAR(2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- Insert data into locations table
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES
(1000, '123 Main St', '12345', 'New York', 'NY', 'US'),
(1001, '456 Maple Dr', '54321', 'San Francisco', 'CA', 'US'),
(1002, '789 Oak Ln', '67890', 'Sydney', 'NSW', 'AU'),
(1003, '101 Pine St', '98765', 'Mumbai', 'MH', 'IN');

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Insert data into departments table
INSERT INTO departments (department_id, department_name, location_id) VALUES
(10, 'Administration', 1000),
(20, 'Marketing', 1001),
(30, 'IT', 1002),
(40, 'HR', 1003),
(50, 'Finance', 1000),
(60, 'Sales', 1001),
(70, 'Executive', 1002),
(80, 'R&D', 1003);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(10),
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert data into employees table
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2020-01-01', 'IT_PROG', 6000.00, NULL, 30),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '2020-02-01', 'IT_PROG', 8000.00, 1, 30),
(3, 'Jim', 'Brown', 'jim.brown@example.com', '123-456-7892', '2020-03-01', 'MKT_MGR', 7000.00, NULL, 20),
(4, 'Jake', 'White', 'jake.white@example.com', '123-456-7893', '2020-04-01', 'MKT_CLERK', 4000.00, 3, 20),
(5, 'Jill', 'Green', 'jill.green@example.com', '123-456-7894', '2020-05-01', 'HR_REP', 5000.00, NULL, 40),
(6, 'Jerry', 'Black', 'jerry.black@example.com', '123-456-7895', '2020-06-01', 'FIN_ANALYST', 9000.00, NULL, 50),
(7, 'Janet', 'Gray', 'janet.gray@example.com', '123-456-7896', '2020-07-01', 'SALES_MGR', 9500.00, NULL, 60),
(8, 'Jason', 'Blue', 'jason.blue@example.com', '123-456-7897', '2020-08-01', 'SALES_REP', 3000.00, 7, 60),
(9, 'Julie', 'Red', 'julie.red@example.com', '123-456-7898', '2020-09-01', 'EXEC_DIR', 12000.00, NULL, 70),
(10, 'Jordan', 'Orange', 'jordan.orange@example.com', '123-456-7899', '2020-10-01', 'R&D_MGR', 11000.00, NULL, 80);

-- Verify the data
SELECT * FROM countries;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM employees;
