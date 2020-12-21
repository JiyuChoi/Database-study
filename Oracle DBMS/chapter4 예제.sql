Chapter 4.

-- 1�� ����
Select sysdate "Date" From dual;

-- 2��, 3�� ����
SELECT
    employee_id,
    last_name,
    salary,
    round(salary*1.155,0) "NewSalary"
FROM
    employees;

-- 4�� ����
SELECT
    employee_id,
    last_name,
    salary,
    round(salary*1.155,0) "NewSalary",
    round(salary*1.155,0) - salary "Increase"
FROM
    employees;

-- 5��
-- a)
SELECT Initcap(last_name) "Name", Length(last_name) "Length"
FROM employees
WHERE last_name like 'J%' or last_name like 'A%' or last_name like 'M%'
ORDER by last_name;

-- b) Where aline�� like
SELECT Initcap(last_name) "Name", Length(last_name) "Length"
FROM employees
Where last_name like '&name%'
Order by last_name;

-- c) Where aline�� like
SELECT Initcap(last_name) "Name", Length(last_name) "Length"
FROM employees
Where upper(last_name) like upper('&name%')
Order by last_name;

-- 6��
SELECT last_name, round(sysdate-hire_date) as months_worked
FROM employees
ORDER BY months_worked;

-- 7��
SELECT last_name, LPAD(salary, 15, '$') salary
FROM employees;

-- 8��
SELECT last_name, RPAD(' ', salary/1000, '*') employees_and_their_salaries
FROM employees
ORDER BY salary desc;

-- 9��
SELECT last_name, trunc((sysdate-hire_date)/7) tenure
FROM employees
WHERE department_id = 90
ORDER BY tenure desc;