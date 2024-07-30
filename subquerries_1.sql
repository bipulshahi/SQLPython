-- Single Row Subquery

-- A single row subquery returns one row. It can be used in comparisons like = or >, etc.

-- Example:
-- Find the employee who works in the same department as the 'HR' department.
-- Main query to find the employee in the 'HR' department.
SELECT * FROM employees
WHERE department_id = (
    -- Subquery to find the department_id for 'HR'
    SELECT department_id FROM departments
    WHERE department_name = 'HR'
);

-- Multiple Row Subquery

-- A multiple row subquery returns more than one row and can be used with operators like IN, ANY, ALL.

-- Example:
-- Find employees who work in the 'Marketing' or 'Sales' departments.

-- Main query to find employees in 'Marketing' or 'Sales' departments.
SELECT * FROM employees
WHERE department_id IN (
    -- Subquery to find department_ids for 'Marketing' and 'Sales'
    SELECT department_id FROM departments
    WHERE department_name IN ('Marketing', 'Sales')
);

-- Correlated Subquery

-- A correlated subquery is a subquery that refers to a column from the outer query. It runs once for each row in the outer query.

-- Example:
-- Find employees who earn more than the average salary of their respective department.

-- Main query to find employees who earn more than the average salary in their department.
SELECT * FROM employees e1
WHERE salary > (
    -- Subquery to calculate average salary for the department of each employee
    SELECT AVG(salary) FROM employees e2
    WHERE e2.department_id = e1.department_id
);

-- Nested Subquery

-- A nested subquery is a subquery within another subquery or within a main query. It can be multi-level.

-- Example:
-- Find employees who work in a location where the headquarters is located.

-- Main query to find employees working in specific locations.
SELECT * FROM employees
WHERE location_id IN (
    -- Subquery to find location_ids in a specific country
    SELECT location_id FROM locations
    WHERE country_id IN (
        -- Innermost subquery to find the country_id for 'United States'
        SELECT country_id FROM countries
        WHERE country_name = 'United States'
    )
);
