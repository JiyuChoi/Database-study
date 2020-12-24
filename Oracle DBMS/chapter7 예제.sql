-- 1번
SELECT LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, COUNTRY_NAME
FROM LOCATIONS NATURAL JOIN COUNTRIES
ORDER BY LOCATION_ID;

-- 2번
SELECT LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS JOIN EMPLOYEES
using (department_id)
ORDER BY 1;

-- 3번
SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME
FROM  departments
    JOIN employees using (department_id)
    JOIN locations using (location_id)
Where city = 'Toronto';
    
-- 4번
SELECT e.last_name "Employee", e.employee_id "EMP#", m.Last_name "Manager", e.manager_id "Mgr#"
FROM employees e join employees m
    on e.manager_id = m.employee_id;
    
-- 5번
SELECT e.last_name "Employee", e.employee_id "EMP#", m.Last_name "Manager", e.manager_id "Mgr#"
FROM employees e left outer join employees m
    on e.manager_id = m.employee_id
ORDER by 2;

-- 6번
Select e.department_id "department", e.last_name "employee", c.last_name "colleague"
From employees e join employees c
on e.department_id = c.department_id
where e.last_name <> c.last_name -- 자기자신 빼줘야함
order by 1,2,3;

-- 7번
Select e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
From employees e
     join departments d
     using(department_id)
     join job_grades j
     on e.salary between j.lowest_sal and j.highest_sal;
     
-- 8번
Select last_name, hire_date
From employees
Where hire_date > (Select hire_date From employees Where last_name = 'Davies');

-- 9번
Select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e join employees m
on (e.manager_id = m.employee_id)
where e.hire_date < m.hire_date;
