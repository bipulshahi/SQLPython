USE hr_emp;

-- Create test table
CREATE TABLE test(
    val INTEGER
);

-- Insert data into test table
INSERT INTO test (val) VALUES
(20), (30), (15), (30), (80), (35), (35), (42), (67), (67);

-- Select all data from test table
SELECT * FROM test;
-- Result: Displays all values in the test table.

-- Rank Function
SELECT val, RANK() OVER (ORDER BY val DESC) AS rank
FROM test;
-- Explanation: RANK() assigns a unique rank to each distinct value, with gaps for ties.

-- Dense Rank Function
SELECT val, RANK() OVER (ORDER BY val DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY val DESC) AS dense_rank
FROM test;
-- Explanation: DENSE_RANK() assigns ranks to distinct values without gaps for ties.

-- Row Number Function
SELECT val, ROW_NUMBER() OVER (ORDER BY val DESC) AS row_number
FROM test;
-- Explanation: ROW_NUMBER() assigns a unique sequential integer to rows within the result set.

-- First Value Function
SELECT val, FIRST_VALUE(val) OVER (ORDER BY val DESC) AS first_value
FROM test;
-- Explanation: FIRST_VALUE() returns the first value in the order specified.

-- Last Value Function
SELECT val, LAST_VALUE(val) OVER (ORDER BY val DESC
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value
FROM test;
-- Explanation: LAST_VALUE() returns the last value in the order specified.

-- Lag Function
SELECT val, LAG(val, 1) OVER (ORDER BY val DESC) AS lag_val
FROM test;
-- Explanation: LAG() provides access to a row at a given physical offset prior to the current row.

-- Lead Function
SELECT val, LEAD(val, 1) OVER (ORDER BY val DESC) AS lead_val
FROM test;
-- Explanation: LEAD() provides access to a row at a given physical offset after the current row.

-- Create emp_payment table for further examples
CREATE TABLE emp_payment (
    employee_id INT,
    date_of_payment DATE,
    salary INT
);

-- Insert sample data into emp_payment table
INSERT INTO emp_payment (employee_id, date_of_payment, salary) VALUES
(1, '2023-01-01', 5000),
(1, '2023-02-01', 5500),
(1, '2023-03-01', 6000),
(2, '2023-01-01', 7000),
(2, '2023-02-01', 7500),
(2, '2023-03-01', 8000);

-- Select all data from emp_payment table
SELECT * FROM emp_payment;
-- Result: Displays all entries in the emp_payment table.

-- Lag function with emp_payment
SELECT employee_id, date_of_payment, salary,
       LAG(salary, 1) OVER (PARTITION BY employee_id ORDER BY employee_id) AS previous_salary,
       salary - LAG(salary, 1) OVER (PARTITION BY employee_id ORDER BY employee_id) AS salary_difference
FROM emp_payment;
-- Explanation: Calculates the difference between the current salary and the previous salary for each employee.

-- Lead function with emp_payment
SELECT employee_id, date_of_payment, salary,
       LEAD(salary, 1) OVER (PARTITION BY employee_id ORDER BY employee_id) AS next_salary,
       LEAD(salary, 1) OVER (PARTITION BY employee_id ORDER BY employee_id) - salary AS salary_difference
FROM emp_payment;
-- Explanation: Calculates the difference between the current salary and the next salary for each employee.

-- Ntile Function
SELECT val, NTILE(2) OVER (ORDER BY val DESC) AS ntile_2
FROM test;
-- Explanation: NTILE() distributes the rows into a specified number of groups, in this case, 2 groups.

SELECT val, NTILE(5) OVER (ORDER BY val DESC) AS ntile_5
FROM test;
-- Explanation: NTILE() distributes the rows into a specified number of groups, in this case, 5 groups.

SELECT val, NTILE(4) OVER (ORDER BY val DESC) AS ntile_4
FROM test;
-- Explanation: NTILE() distributes the rows into a specified number of groups, in this case, 4 groups.

SELECT val, NTILE(3) OVER (ORDER BY val DESC) AS ntile_3
FROM test;
-- Explanation: NTILE() distributes the rows into a specified number of groups, in this case, 3 groups.

-- Cumulative Distribution Function
SELECT val, CUME_DIST() OVER (ORDER BY val) AS cumulative_distribution
FROM test;
-- Explanation: CUME_DIST() calculates the cumulative distribution of a value within a set of values.

-- Aggregate Functions
SELECT AVG(val) AS avg_value FROM test;
-- Explanation: AVG() calculates the average of the values in the specified column.

-- Analytical Functions with Aggregate
SELECT val, AVG(val) OVER () AS avg_value
FROM test;
-- Explanation: AVG() as an analytical function provides the average of the entire result set for each row.

SELECT val, MIN(val) OVER () AS min_value FROM test;
-- Explanation: MIN() as an analytical function provides the minimum value of the entire result set for each row.

SELECT val, MAX(val) OVER () AS max_value FROM test;
-- Explanation: MAX() as an analytical function provides the maximum value of the entire result set for each row.
