USE hr_emp;

-- Single row subquery
-- Finds employees who work in the same location as the 'IT' department.
SELECT * FROM employees
WHERE location_id = (
    SELECT location_id FROM departments
    WHERE department_name = 'IT'
);

-- Multiple row subquery
-- Finds employees who work in the 'Marketing' or 'Sales' departments.
SELECT * FROM employees
WHERE department_id IN (
    SELECT department_id FROM departments
    WHERE department_name IN ('Marketing', 'Sales')
);

-- Multiple row subquery with a condition
-- Finds employees whose job title is the same as anyone working in department 90.
SELECT * FROM employees
WHERE job_id IN (
    SELECT job_id FROM employees
    WHERE department_id = 90
);

-- Correlated subquery
-- Finds employees who earn more than the average salary of their respective department.
SELECT * FROM employees e1
WHERE salary > (
    SELECT AVG(salary) FROM employees e2
    WHERE e2.department_id = e1.department_id
);

-- Correlated subquery with EXISTS
-- Finds employees who work in a department that has more than 5 employees.
SELECT * FROM employees e
WHERE EXISTS (
    SELECT 1 FROM employees
    WHERE department_id = e.department_id
    GROUP BY department_id
    HAVING COUNT(*) > 5
);

-- Nested subquery
-- Finds employees who work in a country where the headquarter is located.
SELECT * FROM employees
WHERE location_id IN (
    SELECT location_id FROM locations
    WHERE country_id IN (
        SELECT country_id FROM countries
        WHERE country_name = 'United States'
    )
);

-- Nested subquery with multiple levels
-- Finds employees who work in a region that includes the city 'New York'.
SELECT * FROM employees
WHERE department_id IN (
    SELECT department_id FROM departments
    WHERE location_id IN (
        SELECT location_id FROM locations
        WHERE city = 'New York'
    )
);

-- Nested subquery with complex condition
-- Finds employees who work in a department located in cities that start with 'S'.
SELECT * FROM employees
WHERE department_id IN (
    SELECT department_id FROM departments
    WHERE location_id IN (
        SELECT location_id FROM locations
        WHERE city LIKE 'S%'
    )
);

-- Nested subquery with arithmetic operations
-- Finds employees whose salary is above the average salary of employees in the same country.
SELECT * FROM employees e
WHERE salary > (
    SELECT AVG(e1.salary) FROM employees e1
    JOIN departments d ON e1.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
    WHERE l.country_id = (
        SELECT country_id FROM locations l1
        JOIN departments d1 ON l1.location_id = d1.location_id
        WHERE d1.department_id = e.department_id
    )
);

-- Multiple row subquery with JOIN
-- Finds employees who work in departments that have the same name as any department in another country.
SELECT * FROM employees
WHERE department_id IN (
    SELECT d1.department_id FROM departments d1
    JOIN departments d2 ON d1.department_name = d2.department_name
    WHERE d1.location_id != d2.location_id
);
