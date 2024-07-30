-- Example 1: Simple CASE Expression
-- Returns department description based on department value
SELECT employee_id, 
       CASE department
           WHEN 'Sales' THEN 'Sales Department'
           WHEN 'HR' THEN 'Human Resources'
           ELSE 'Other Department'
       END AS department_description
FROM employees;

-- Example 2: Searched CASE Expression
-- Categorizes salary into ranges
SELECT employee_id, salary,
       CASE
           WHEN salary < 30000 THEN 'Low'
           WHEN salary BETWEEN 30000 AND 60000 THEN 'Medium'
           ELSE 'High'
       END AS salary_range
FROM employees;

-- Example 3: Basic IF Function
-- Classifies salary as 'High Salary' or 'Low Salary'
SELECT employee_id, salary,
       IF(salary > 50000, 'High Salary', 'Low Salary') AS salary_status
FROM employees;

-- Example 4: IFNULL Function
-- Replaces NULL phone numbers with 'No Phone'
SELECT employee_id, IFNULL(phone_number, 'No Phone') AS contact_number
FROM employees;

-- Example 5: NULLIF Function
-- Avoids division by zero by returning NULL if bonus is zero
SELECT employee_id, salary / NULLIF(bonus, 0) AS adjusted_salary
FROM employees;

-- Example 6: COALESCE Function
-- Returns the first non-null contact info
SELECT employee_id, COALESCE(phone_number, email_address, 'No Contact Info') AS contact_info
FROM employees;

-- Example 7: ELSE Clause in CASE
-- Provides a default department description
SELECT employee_id, department,
       CASE 
           WHEN department = 'Sales' THEN 'Sales Department'
           WHEN department = 'HR' THEN 'Human Resources'
           ELSE 'Other Department'
       END AS department_description
FROM employees;

-- Example 8: IF in WHERE Clause
-- Filters rows based on condition
SELECT * FROM employees
WHERE IF(department = 'Sales', salary > 50000, salary > 40000);

-- Example 9: CASE in ORDER BY
-- Sorts by salary only for Sales department
SELECT employee_id, department, salary
FROM employees
ORDER BY CASE
             WHEN department = 'Sales' THEN salary
             ELSE 0
         END DESC;

-- Example 10: IFNULL with CASE
-- Handles NULL departments with a default value
SELECT employee_id, 
       CASE
           WHEN department IS NULL THEN 'Unknown'
           ELSE department
       END AS department_name
FROM employees;
