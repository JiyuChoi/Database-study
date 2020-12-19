1. ANSI 조인 유형
    inner join
        - on 절을 이용한 join
        - using 절을 이용한 join
        - natural join
    outer join
        - left / rigth / full
    cross join(catesian product)
    
2. Oracle 조인 유형
    equi join: 조인하려는 테이블 사이의 연결고리가 = 인 경우 (FK = PK)
    non equi join: 조인하려는 테이블 사이의 연결고리가 = 이 아닌 경우 (between and)
    Self join:
    Outer join: equi 조인으로 볼 수 없는 결과를 볼 경우 (+)
    Catesian Product: 조인 조건 없을 때의 조인 (N*N)

-------------------------------------------------------------------------------

@c:\lib\datatable.sql

/* join을 하려면 테이블 분석이 선행 되어야함 */
-- JOIN 하려는 col의 데이터 형식이 같아야함
select * from dept;
select * from emp;



/* Oracle 방식의 equi join */

-- 기본적인 join 문법 --
select ename, dname
from emp,dept
where emp.deptno = dept.deptno;


-- deptno는 모든 테이블에 있음: 오류 발생
select ename, dname, deptno -- 2개의 테이블에 모두 존재 / 오류 발생
from emp,dept
where emp.deptno = dept.deptno;

-- 마킹으로 해결 --
select ename, dname, dept.deptno
from emp, dept
where emp.deptno = dept.deptno; -- 조인조건: fk = pk

-- 예제 실습
select employee_id, employees.job_id, job_title
from employees, jobs
where employees.job_id = jobs.job_id;


--table에 aline 걸어줌--
select ename, dname, d.deptno
from emp e, dept d
where e.deptno = d.deptno;

-- sal이 2500 이상인 사원의 이름과 부서이름, sal, 부서번호를 출력하세요.
select ename, dname, d.deptno, sal
from emp e, dept d
where e.deptno = d.deptno and sal >= 2500;




/* ANSI 조인 (표준), from절에 , => join으로 변경 where절에 조인조건 => on */

<-- inner join 방식 ==> 양쪽 테이블에 모두 있는 내용이 출력>
select ename, dname, d.deptno
from emp e join dept d
on e.deptno = d.deptno;

select ename, dname, d.deptno, sal
from emp e join dept d
on e.deptno = d.deptno
where sal >= 2500;



<-- outer join 방식 ((+) 추가적으로 마킹)>

-- Oracle 조인 방식
select ename, dname, d.deptno
from emp e, dept d
where e.deptno(+) = d.deptno;

-- ANSI 조인 방식 (이것을 더 선호)
select ename, dname, d.deptno
from emp e right outer join dept d  --dept 테이블이 master가 됨
on e.deptno = d.deptno;

select ename, dname, d.deptno
from emp e left outer join dept d  --emp 테이블이 master가 됨
on e.deptno = d.deptno;

select ename, dname, d.deptno
from emp e full outer join dept d
on e.deptno = d.deptno;


-- 예제 실습
select employee_id, e.department_id, department_name
from employees e full outer join departments d
on e.department_id = d.department_id;




/* non-equi join: pk와 fk 관계 없어도 구간으로 조인*/
(-- equi join => fk=pk)

-- Oracle 조인 방식
Select ename, sal, grade, losal, hisal
From emp, salgrade
Where sal between losal and hisal
Order by ename;

-- ANSI 조인 방식
Select ename, sal, grade, losal, hisal
From emp join salgrade
on sal between losal and hisal
Order by ename;

-- losal, hisal 외의 col만 출력
Select emp.*, salgrade.grade -- emp는 모두 출력, salgrade는 grade만 출력
From emp join salgrade
on sal between losal and hisal
Order by ename;




/* 3개 테이블 조인 */
-- ename, dname, loc, sal, grade 출력

<-- Oracle>
Select ename, dname, loc, sal, grade
From emp, dept, salgrade
Where emp.deptno = dept.deptno and sal between losal and hisal;

<-- ANSI>
Select ename, dname, loc, sal, grade
From emp
    join dept
    on emp.deptno = dept.deptno
    join salgrade
    on sal between losal and hisal
where sal >= 2000   -- where 대신 and 가능
Order by dept.deptno;




/* Self join */

<-- oracel join으로 표현>

-- 사원의 이름과 상사의 이름
Select e.ename "사원의 이름" , m.ename "상사의 이름"
From emp e, emp m
Where e.mgr = m.empno -- e의 mgr가 FK / m의 empno가 PK
ORder by 1;

-- 사원의 이름과 상사의 이름
Select e.ename "사원의 이름" , m.ename "상사의 이름"
From emp e, emp m
Where e.mgr = m.empno(+) -- outer 조인으로 전체 사원 출력
ORder by 1;

-- and로 조건 추가 가능
Select e.ename "사원의 이름" , m.ename "상사의 이름"
From emp e, emp m
Where e.mgr = m.empno and upper(e.ename) = upper('&name')
ORder by e.sal;


<-- ANSI join으로 표현>

-- ANSI inner join
Select e.ename "사원의 이름" , m.ename "상사의 이름"
From emp e outer join emp m
on e.mgr = m.empno;

-- ANSI outer join (left, right, full)
Select e.ename "사원의 이름" , m.ename "상사의 이름"
From emp e left outer join emp m
on e.mgr = m.empno;




/* 예제: 사원의 급여가 상사의 급여보다 많은 사원 목록 리스트 */
<-- Oracle>
Select e.ename "사원", e.sal "사원 급여", m.ename "상사", m.sal "상사 급여"
From emp e, emp m
Where e.mgr = m.empno and e.sal > m.sal; 

<-- ANSI>
Select e.ename "사원", e.sal "사원 급여", m.sal "상사 급여"
From emp e join emp m
on e.mgr = m.empno
Where e.sal > m.sal; 

/* 예제: 상사보다 입사일이 빠른 사원 */
Select e.ename, e.hiredate "사원 입사일", m.hiredate "상사 입사일"
From emp e, emp m
Where e.mgr = m.empno and e.hiredate < m.hiredate;

Select e.ename
From emp e join emp m
on e.mgr = m.empno and e.hiredate < m.hiredate;

/* 예제: KING에게는 CEO 입력 */
Select e.ename "사원의 이름" , nvl(m.ename, '<CEO>') "상사의 이름"
From emp e left outer join emp m
on e.mgr = m.empno;

/* 예제: dept에 있는 것 다 출력해줘*/
Select empno, ename, dname, loc, sal
From emp right outer join dept
on emp.deptno = dept.deptno
Where sal > 2000; -- outer join의 결과 제외 됨

-- 이것을 해결하려면 and 조건으로 연결
Select empno, ename, dname, loc, sal
From emp right outer join dept
on emp.deptno = dept.deptno and sal > 2000;




/* Natural join */
Select empno, ename, dname, loc, sal
From emp natural join dept;


/* Using join */
Select empno, ename, dname, loc, sal
From emp join dept
using(deptno);




/* join: col을 붙임 */
/* union: row를 붙임 */
