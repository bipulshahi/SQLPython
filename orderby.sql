-- Example 1: Sorting in Ascending Order
SELECT * FROM employees
ORDER BY salary ASC;

-- Example 2: Sorting in Descending Order
SELECT * FROM employees
ORDER BY salary DESC;

-- Example 3: Sorting by Multiple Columns
SELECT * FROM employees
ORDER BY department ASC, salary DESC;

-- Example 4: Limit the Number of Rows
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Example 5: Limit with Offset (Pagination)
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5 OFFSET 10;

-- Example 6: Top N Results
SELECT * FROM products
ORDER BY price DESC
LIMIT 10;

-- Example 7: Pagination
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 10 OFFSET 20;

-- Example 8: Sorted and Limited Subset
SELECT * FROM customers
ORDER BY registration_date ASC
LIMIT 5;
