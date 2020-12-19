-- 1번 문제
SELECT
    last_name, salary
FROM
    employees
WHERE salary > 12000;

-- 2번 문제
SELECT
    last_name, department_id
FROM
    employees
WHERE employee_id = 176;

-- 3번 문제
SELECT
    last_name, salary
FROM
    employees
WHERE salary not between 5000 and 12000;

-- 4번 문제
SELECT
    last_name, job_id, hire_date
FROM
    employees
WHERE last_name in ('Matos', 'Taylor')
ORDER BY hire_date;

-- 5번 문제
SELECT
    last_name Employee, salary "Monthly Salary"
FROM
    employees
WHERE department_id in(20, 50);

-- 6번 문제
SELECT
    last_name Employee, salary "Monthly Salary"
FROM
    employees
WHERE (salary between 5000 and 12000)
and department_id in(20, 50);

-- 7번 문제
SELECT last_name, hire_date
FROM employees
WHERE to_char(hire_date, 'YYYY') = '2006';

-- 8번 문제
SELECT last_name, job_id
FROM employees
WHERE manager_id is Null;

-- 9번 문제
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct is not Null
ORDER BY 2 desc, 3 desc;

-- 10번
SELECT last_name, salary
FROM employees
WHERE salary > &salary;

-- 11번
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE manager_id = &manager
ORDER BY &order_col;

-- 12번
SELECT last_name
FROM employees
WHERE last_name like '__a%';

-- 13번
SELECT last_name
FROM employees
WHERE last_name like '%a%' and last_name like '%e%';

-- 14번
SELECT last_name, job_id, salary
FROM employees
WHERE job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000);

-- 15번
SELECT last_name "Employee" , salary "Monthly Salary", commission_pct
FROM employees
WHERE commission_pct = 0.2;