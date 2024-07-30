-- Example 1: IS NULL and IS NOT NULL
SELECT *
FROM employees
WHERE department IS NULL;

SELECT *
FROM employees
WHERE department IS NOT NULL;

-- Example 2: COALESCE()
SELECT COALESCE(NULL, 'Default Value', 'Another Value') AS result;

-- Example 3: IFNULL()
SELECT IFNULL(NULL, 'Replacement Value') AS result;

-- Example 4: NULLIF()
SELECT NULLIF(10, 10) AS result, NULLIF(10, 20) AS result2;

-- Example 5: ISNULL() (Note: Prefer IFNULL() in MySQL)
SELECT ISNULL(NULL, 'Default Value') AS result;

-- Example 6: IF()
SELECT IF(department IS NULL, 'No Department', department) AS department_status
FROM employees;

-- Example 7: NVL() (Equivalent in MySQL is IFNULL())
SELECT IFNULL(salary, 0) AS salary
FROM employees;

-- Example 8: REPLACE() with COALESCE()
SELECT REPLACE(COALESCE(department, 'Unknown'), 'Unknown', 'No Department') AS department_status
FROM employees;

-- Example 9: GROUP_CONCAT()
SELECT GROUP_CONCAT(department) AS departments
FROM employees;

-- Example 10: CONCAT() with COALESCE()
SELECT CONCAT('Department: ', COALESCE(department, 'Unknown')) AS department_info
FROM employees;
