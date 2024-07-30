-- 1. Total Salary by Job ID
-- Calculates the total salary for each job ID.
SELECT job_id, SUM(salary) AS total_salary
FROM employees
GROUP BY job_id;

-- 2. Average Salary by Job ID with a Condition
-- Calculates the average salary for each job ID where the department ID is 60.
SELECT job_id, AVG(salary) AS avg_salary
FROM employees
WHERE department_id = 60
GROUP BY job_id;

-- 3. Count of Employees by Manager
-- Counts the number of employees reporting to each manager.
SELECT manager_id, COUNT(*) AS employee_count
FROM employees
GROUP BY manager_id;

-- 4. Minimum Salary by Department with a Condition
-- Finds the minimum salary for each department where the job ID is 'IT_PROG'.
SELECT department_id, MIN(salary) AS min_salary
FROM employees
WHERE job_id = 'IT_PROG'
GROUP BY department_id;

-- 5. Maximum Salary by Job ID
-- Finds the maximum salary for each job ID.
SELECT job_id, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id;

-- 6. Total Salary by Department and Job ID
-- Calculates the total salary for each combination of department ID and job ID.
SELECT department_id, job_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id, job_id;

-- 7. Average Salary by Department with Having Clause
-- Finds the average salary for each department where the average salary is greater than 8000.
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000;

-- 8. Count of Employees by Department with a Condition
-- Counts the number of employees in each department where the salary is greater than 10000.
SELECT department_id, COUNT(*) AS employee_count
FROM employees
WHERE salary > 10000
GROUP BY department_id;

-- 9. Sum of Salaries by Manager with Having Clause
-- Calculates the total salary for each manager where the total salary is greater than 50000.
SELECT manager_id, SUM(salary) AS total_salary
FROM employees
GROUP BY manager_id
HAVING SUM(salary) > 50000;

-- 10. Average Salary by Job ID with Having Clause
-- Finds the average salary for each job ID where the average salary is between 5000 and 10000.
SELECT job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_id
HAVING AVG(salary) BETWEEN 5000 AND 10000;
