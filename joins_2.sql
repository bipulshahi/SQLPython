USE hr_emp;

-- Cross Join
-- Cross Join returns the Cartesian product of the two tables, meaning all possible combinations of rows.
SELECT e.first_name, d.department_name
FROM employees e
CROSS JOIN departments d;
/* 
Explanation: 
Each employee is paired with every department, resulting in a table that combines every row from employees with every row from departments.
*/

-- Join with Aggregate Function
-- Using joins to aggregate data from related tables.
SELECT d.department_name, COUNT(e.employee_id) AS number_of_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
/*
Explanation:
This query returns the number of employees in each department. The LEFT JOIN ensures that even departments with no employees are included in the result.
*/

-- Join with Subquery
-- Joining a table with the result of a subquery.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN (
    SELECT department_id, department_name
    FROM departments
    WHERE location_id IN (SELECT location_id FROM locations WHERE city = 'Lucknow')
) d ON e.department_id = d.department_id;
/*
Explanation:
This query returns employees who work in departments located in the city 'Lucknow'. The subquery first finds the department IDs of departments in 'Lucknow'.
*/

-- Self Join to Find Employees with the Same Manager
-- Using a self join to find employees who share the same manager.
SELECT e1.first_name AS Employee1, e2.first_name AS Employee2, m.first_name AS Manager
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.manager_id
INNER JOIN employees m ON e1.manager_id = m.employee_id
WHERE e1.employee_id <> e2.employee_id;
/*
Explanation:
This query finds pairs of employees who have the same manager. It joins the employees table to itself to match employees with the same manager ID.
*/

-- Left Outer Join with Condition
-- Using an outer join with additional conditions in the WHERE clause.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name IS NULL;
/*
Explanation:
This query finds employees who are not assigned to any department. The LEFT JOIN ensures all employees are included, and the WHERE clause filters out those with a department.
*/

-- Multiple Joins
-- Joining multiple tables to gather comprehensive data.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
WHERE l.state_province = 'California';
/*
Explanation:
This query returns employees who work in departments located in California. It joins the employees, departments, and locations tables to gather comprehensive data.
*/

-- Join and Filter on Joined Table
-- Joining tables and applying a filter on the joined table.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT';
/*
Explanation:
This query returns employees who work in the 'IT' department. The INNER JOIN combines the employees and departments tables, and the WHERE clause filters for the 'IT' department.
*/

-- Join with USING Clause
-- Using the USING clause to simplify join conditions.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d USING(department_id);
/*
Explanation:
This query returns employees with their department names using the USING clause to simplify the join condition when the column names are the same in both tables.
*/

-- Full Outer Join to Find Differences
-- Using a full outer join to find differences between two tables.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
UNION
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IS NULL OR d.department_id IS NULL;
/*
Explanation:
This query finds differences between the employees and departments tables. It uses a full outer join to include all rows from both tables and identifies rows with no match.
*/

-- Join with Different Columns
-- Joining tables on columns other than the primary key and foreign key.
SELECT e.first_name, e.last_name, j.job_title
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id;
/*
Explanation:
This query returns employees with their job titles by joining the employees and jobs tables on the job_id column, which is not a primary key.
*/

-- Summary
/*
1. Cross Join: Returns all combinations of rows from two tables.
2. Join with Aggregate Functions: Aggregates data from related tables.
3. Join with Subquery: Joins a table with the result of a subquery.
4. Self Join to Find Employees with the Same Manager: Uses a self join to find employees sharing the same manager.
5. Left Outer Join with Condition: Applies conditions to the result of an outer join.
6. Multiple Joins: Joins multiple tables to gather comprehensive data.
7. Join and Filter on Joined Table: Applies a filter on the joined table after joining.
8. Join with Using Clause: Simplifies join conditions using the USING clause.
9. Full Outer Join to Find Differences: Finds differences between two tables using a full outer join.
10. Join with Different Columns: Joins tables on non-primary key columns.
*/
