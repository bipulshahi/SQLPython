-- Setup: Create and Populate the test Table

-- First, let's create a table named test and insert some sample data.

-- Create test table
CREATE TABLE test(
    val INTEGER
);

-- Insert data into test table
INSERT INTO test (val) VALUES
(20), (30), (15), (30), (80), (35), (35), (42), (67), (67);

-- Select all data from test table
SELECT * FROM test;
-- Expected Output: Displays all values in the test table.

-- Analytical Functions
-- 1. Rank Function

-- Rank Function
SELECT val, RANK() OVER (ORDER BY val DESC) AS rank
FROM test;
-- Explanation: RANK() assigns a unique rank to each distinct value, with gaps for ties.
-- Expected Output:
-- val | rank
--  80 |  1
--  67 |  2
--  67 |  2
--  42 |  4
--  35 |  5
--  35 |  5
--  30 |  7
--  30 |  7
--  20 |  9
--  15 | 10

-- 2. Dense Rank Function

-- Dense Rank Function
SELECT val, DENSE_RANK() OVER (ORDER BY val DESC) AS dense_rank
FROM test;
-- Explanation: DENSE_RANK() assigns ranks to distinct values without gaps for ties.
-- Expected Output:
-- val | dense_rank
--  80 |  1
--  67 |  2
--  67 |  2
--  42 |  3
--  35 |  4
--  35 |  4
--  30 |  5
--  30 |  5
--  20 |  6
--  15 |  7

-- 3. Row Number Function

-- Row Number Function
SELECT val, ROW_NUMBER() OVER (ORDER BY val DESC) AS row_number
FROM test;
-- Explanation: ROW_NUMBER() assigns a unique sequential integer to rows within the result set.
-- Expected Output:
-- val | row_number
--  80 |  1
--  67 |  2
--  67 |  3
--  42 |  4
--  35 |  5
--  35 |  6
--  30 |  7
--  30 |  8
--  20 |  9
--  15 | 10

-- 4. First Value Function

-- First Value Function
SELECT val, FIRST_VALUE(val) OVER (ORDER BY val DESC) AS first_value
FROM test;
-- Explanation: FIRST_VALUE() returns the first value in the order specified.
-- Expected Output:
-- val | first_value
--  80 |  80
--  67 |  80
--  67 |  80
--  42 |  80
--  35 |  80
--  35 |  80
--  30 |  80
--  30 |  80
--  20 |  80
--  15 |  80

-- 5. Last Value Function

-- Last Value Function
SELECT val, LAST_VALUE(val) OVER (ORDER BY val DESC
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value
FROM test;
-- Explanation: LAST_VALUE() returns the last value in the order specified.
-- Expected Output:
-- val | last_value
--  80 |  15
--  67 |  15
--  67 |  15
--  42 |  15
--  35 |  15
--  35 |  15
--  30 |  15
--  30 |  15
--  20 |  15
--  15 |  15

-- 6. Lag Function

-- Lag Function
SELECT val, LAG(val, 1) OVER (ORDER BY val DESC) AS lag_val
FROM test;
-- Explanation: LAG() provides access to a row at a given physical offset prior to the current row.
-- Expected Output:
-- val | lag_val
--  80 |  NULL
--  67 |  80
--  67 |  67
--  42 |  67
--  35 |  42
--  35 |  35
--  30 |  35
--  30 |  30
--  20 |  30
--  15 |  20

-- 7. Lead Function

-- Lead Function
SELECT val, LEAD(val, 1) OVER (ORDER BY val DESC) AS lead_val
FROM test;
-- Explanation: LEAD() provides access to a row at a given physical offset after the current row.
-- Expected Output:
-- val | lead_val
--  80 |  67
--  67 |  67
--  67 |  42
--  42 |  35
--  35 |  35
--  35 |  30
--  30 |  30
--  30 |  20
--  20 |  15
--  15 |  NULL

-- 8. Ntile Function

-- Ntile Function (2 groups)
SELECT val, NTILE(2) OVER (ORDER BY val DESC) AS ntile_2
FROM test;
-- Explanation: NTILE() distributes the rows into a specified number of groups, in this case, 2 groups.
-- Expected Output:
-- val | ntile_2
--  80 |  1
--  67 |  1
--  67 |  1
--  42 |  1
--  35 |  1
--  35 |  2
--  30 |  2
--  30 |  2
--  20 |  2
--  15 |  2

-- Ntile Function (4 groups)
SELECT val, NTILE(4) OVER (ORDER BY val DESC) AS ntile_4
FROM test;
-- Explanation: NTILE() distributes the rows into a specified number of groups, in this case, 4 groups.
-- Expected Output:
-- val | ntile_4
--  80 |  1
--  67 |  1
--  67 |  2
--  42 |  2
--  35 |  2
--  35 |  3
--  30 |  3
--  30 |  4
--  20 |  4
--  15 |  4

-- 9. Cumulative Distribution Function

-- Cumulative Distribution Function
SELECT val, CUME_DIST() OVER (ORDER BY val) AS cumulative_distribution
FROM test;
-- Explanation: CUME_DIST() calculates the cumulative distribution of a value within a set of values.
-- Expected Output:
-- val | cumulative_distribution
--  15 | 0.1
--  20 | 0.2
--  30 | 0.4
--  30 | 0.4
--  35 | 0.6
--  35 | 0.6
--  42 | 0.7
--  67 | 0.9
--  67 | 0.9
--  80 | 1.0

-- Aggregate Functions
-- 10. Average, Minimum, Maximum Values

-- Average Value
SELECT AVG(val) AS avg_value FROM test;
-- Explanation: AVG() calculates the average of the values in the specified column.
-- Expected Output:
-- avg_value
--  42.1

-- Minimum Value
SELECT MIN(val) AS min_value FROM test;
-- Explanation: MIN() calculates the minimum value in the specified column.
-- Expected Output:
-- min_value
--  15

-- Maximum Value
SELECT MAX(val) AS max_value FROM test;
-- Explanation: MAX() calculates the maximum value in the specified column.
-- Expected Output:
-- max_value
--  80
