-- 로그인 계정 확인
SELECT user FROM dual;

SELECT
    empno,
    ename,
    job,
    mgr,
    hiredate 입사일,
    sal + nvl(comm,0) as 급여,
    deptno
FROM
    emp;
    
    
<-- 조건절 WHERE (deptno = 20)>
SELECT
    empno,
    ename,
    job,
    mgr,
    hiredate 입사일,
    sal + nvl(comm,0) as 급여,
    deptno
FROM
    emp
WHERE deptno = 20;


-- 급여 3000 이상 (Where 급여 >= 3000; 쓰면 오류남)
SELECT
    empno, ename, job, mgr, hiredate 입사일, sal + nvl(comm,0) as 급여, deptno
FROM
    emp
WHERE sal + nvl(comm,0) >= 3000;


<-- 정렬: Order by>
SELECT
    empno, ename, job, mgr, hiredate 입사일, sal + nvl(comm,0) as 급여, deptno
FROM
    emp
ORDER BY 급여 DESC;


-- select, from은 필수로 where, order by는 선택
SELECT
FROM
WHERE
ORDER BY;


SELECT deptno, empno, ename, job, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE sal+nvl(comm,0) > 900
ORDER BY deptno asc, 급여 desc;


-- sal만 가지고도 조건 가능 (오류 안남)
SELECT deptno, empno, ename, job, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE sal > 900
ORDER BY 1 asc, 급여 desc;
-- col num으로도 정렬가능


SELECT
    employee_id, first_name ||' '|| last_name 이름, email, hire_date, salary + nvl(commission_pct,0) 급여, department_id
FROM
    employees
WHERE department_id = 90
ORDER BY 급여;


-- & 치환함수 (값 입력 받기, 비교 연산자)
SELECT deptno, empno, ename, job, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE deptno = &deptno;


-- 원래는 대소문자 구분하지 않지만, 내부 값들은 대소문자 구분함
SELECT deptno, empno, ename, job, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE job = 'MANAGER'; --'manager'는 오류남


-- 비교할 때는 양쪽의 데이터 타입이 같아야함
-- 문자열로 바꿔주어야함 --> ' '
SELECT deptno, empno, ename, job, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE job = '&job';


<-- 문자 변환 (대소문자)>
SELECT 'aaa', upper('aaa'), lower('AAA') FROM dual;


-- 대소문자 구분 없이 검색하는 법 (양쪽 다 변환)
SELECT deptno, empno, ename, job, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE UPPER(job) = UPPER('&job');


-- Show parameter nls;





<-- 날짜 연산자>
SELECT deptno, job, ename, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE to_date(hiredate) = '80/12/27';

select sysdate from dual;


<-- not equal (!=, <>)>
SELECT deptno, job, ename, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE hiredate != '81/09/28';

SELECT deptno, job, ename, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE hiredate <> '81/09/28';


<-- to-date: RR/MM/DD 형태로 바꾸어 주어야 함>
SELECT deptno, job, ename, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE hiredate = to_date('22-02-1981', 'dd-mm-yyyy');

SELECT deptno, job, ename, hiredate 입사일, sal + nvl(comm,0) as 급여
FROM emp
WHERE hiredate < to_date('22-2-1981', 'dd-mm-yyyy');


-- to_char를 이용해 원하는 날짜 데이터만 뽑을 수 있다
SELECT ename, hiredate, to_char(hiredate,'YYYY') 입사년도, to_char(hiredate,'MM') 입사월, to_char(hiredate,'DD') 입사일,
        to_char(hiredate,'DAY') 입사요일
FROM emp;


-- '82/2/1'
SELECT to_date('82/2/1', 'RR/MM/DD'), to_char(to_date('82/2/1', 'RR/MM/DD'),'YYYY') FROM dual; --1982
SELECT to_date('82/2/1', 'YY/MM/DD'), to_char(to_date('82/2/1', 'YY/MM/DD'),'YYYY') FROM dual; --2082



<-- 관계 연산자 (and, or)>
-- and 연산자
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE sal >= 3000 and sal <= 5000
ORDER BY 급여 DESC;

-- between and 연산자
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE sal between 3000 and 5000
ORDER BY 급여 DESC;

-- not between and (해당 범위를 제외)
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE sal not between 3000 and 5000
ORDER BY 급여 DESC;

-- or 연산자
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE deptno = 10 or deptno = 20
ORDER BY deptno, 급여 DESC;


<-- 집합 연산자>
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE deptno in (10, 20) -- 10 또는 20
ORDER BY deptno, 급여 DESC;

-- (부정) 집합 연산자
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE deptno not in (10, 20) -- 10 또는 20
ORDER BY deptno, 급여 DESC;

- (deptno, loc): (,)는 and로 묶인다 (두 조건을 다 만족해야함)
SELECT *
FROM dept
WHERE (deptno, loc) in ((10,'NEW YORK'),(30,'NEW YORK'));




<-- Like 연산자 (% _ 를 붙여서 사용)>

-- 'A%' 이면 A로 시작하는 것 , '%A%' 중간에 A가 들어가는 것
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE ename like '%A%'
ORDER BY deptno, 급여 DESC;

SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE upper(ename) like upper('a%') -- 대소문자 구분 처리
ORDER BY deptno, 급여 DESC;

SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE upper(ename) like upper('%a_s%') -- 대소문자 구분 처리
ORDER BY deptno, 급여 DESC;


-- emp 테이블 81년도 입사자 목록
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE to_char(hiredate, 'RR') in '81'

SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE hiredate like '81%'


-- emp 테이블 9월 입사자 목록
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE to_char(hiredate, 'MM') in '09'

SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE hiredate like '__/09/__'

SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE to_char(hiredate, 'MM') like '%9%'

-- 이름이 A, B, C, D로 시작하는 사원 목록
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE ename like 'A%' or  ename like 'B%' or  ename like 'C%' or  ename like 'D%';



<-- 정규식 사용>
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE REGEXP_LIKE (ename, 'A|B|C|D');

-- A, B, C, D로 시작하는
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE REGEXP_LIKE (ename, '^[A-D]');

-- A, B, C, D로 끝나는
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE REGEXP_LIKE (ename, '[A-D]$');


<-- null인 값만 추출>
SELECT deptno, job, ename, hiredate 입사일, sal as 급여, comm
FROM emp
WHERE comm is null
ORDER BY 1;

SELECT deptno, job, ename, hiredate 입사일, sal as 급여, comm
FROM emp
WHERE comm is not null
ORDER BY 1;

SELECT * FROM dept;

SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE mgr is null
ORDER BY 1;


<-- MYSQL에서는 동작하지 않음 >
-- = any: 둘 중에 하나 아무거나 (= in X)
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE deptno = any(10,30)
ORDER BY deptno, 급여 DESC;

-- != all (10, 30 모두 아닌 것)
SELECT deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
WHERE deptno != all(10,30)
ORDER BY deptno, 급여 DESC;


<-- Oracle paging 처리>
SELECT rownum, deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp;

-- 정렬을 하면 rownum이 깨진다
SELECT rownum, deptno, job, ename, hiredate 입사일, sal as 급여
FROM emp
ORDER BY sal;

-- sal 기준으로 정렬을 하고 rownum을 주겠다
SELECT rownum, deptno, job, ename, hiredate 입사일, sal as 급여
FROM (Select * from emp order by sal desc);

-- 급여 TOP-3를 뽑아보자
SELECT rownum, deptno, job, ename, hiredate 입사일, sal as 급여
FROM (Select * from emp order by sal desc)
WHERE rownum < 4;

-- where가 먼저 적용되고 rownum이 생성되기 때문에 오류가 남
SELECT rownum, deptno, job, ename, hiredate 입사일, sal as 급여
FROM (Select * from emp order by sal desc)
WHERE rownum > 4;


<-- paging 처리는 이렇게!>
-- 1page ==> 1~5,  2page ==> 6~10
select * from
(SELECT rownum row#, deptno, job, ename, hiredate 입사일, sal as 급여
FROM (Select * from emp order by sal desc))
WHERE row# between 6 and 10;

<-- 변수 바인딩--!>
select * from
(SELECT rownum row#, deptno, job, ename, hiredate 입사일, sal as 급여
FROM (Select * from emp order by sal desc))
WHERE row# between &start and &end;



<-- 실습 -->
select employee_id, last_name, job_id, &column_name -- 어떤 col 추출할건데
From employees
where &condition -- 조건이 뭔데
order by &order_colun; -- 정렬 기준은

-- 이중 앰퍼샌드 &&
select employee_id, last_name, job_id, &&column_name -- 여기서 사용한거
From employees
where &condition
order by &column_name; -- 재입력 없이 여기서 쓸거야

-- 이름의 세번째 문자가 'A'인 모든 사원의 이름을 표시
SELECT ename
FROM emp
where ename like '__A%';


-- Chapter 4.
<-- 내장함수 : single row function (데이터 하나에 하나의 값) >
<-- 형변환, 묵시적(자동) 명시적(수동 명시)

-- 묵시적
SELECT 3+4.5 FROM dual;
SELECT 1/2 FROM dual;
SELECT '3'+4 FROM dual; -- 7이 나옴 (자동으로 형변환 됨)

-- 4부터 2자리를 뽑는다
SELECT employee_id, hire_date, job_id, substr(job_id, 4, 2)
FROM employees;

-- 날짜 데이터에서 연도를 뽑을 때 to_char(hire_date, 'YY')이 방법을 더 추천
-- 날짜를 문자로 형 변환 to_char()
SELECT employee_id, to_char(hire_date, 'YY') "입사연도 방법1", substr(hire_date, 1, 2) "입사연도 방법2", job_id, substr(job_id, 4, 2)
FROM employees;

SELECT round(15.193, 2), trunc(45.567, 2) FROM dual;

-- 현재 날짜와 다음 날
SELECT sysdate, sysdate+1 FROM dual;

SELECT sysdate, to_char(sysdate+30, 'day') FROM dual;

-- 날짜로 형 변환
SELECT sysdate, to_date('20/12/15'), to_date('20-12-15'), to_date('20-12-2015', 'dd-mm-yyyy') FROM dual;


<-- nvl>
-- comm는 숫자이고 '_'은 문자 --> 형 변환을 해줘야함
SELECT ename, mgr, nvl(comm,0), nvl(to_char(comm), '_')
FROM emp;

-- nvl2
SELECT ename, nvl2(mgr,'O','X'), nvl(comm,0)
FROM emp;

-- coalesce(a,b,c): a가 null이면 b, b가 null이면 c 
SELECT ename, sal, comm, coalesce(sal+comm, sal, 0) 실급여
FROM emp;

<-- decode 함수>
SELECT ename, sal, decode(deptno, 10, sal*0.5, 20, sal*0.7, sal) 보너스, deptno
FROM emp
order by deptno;

<-- Case 구문>
SELECT ename, deptno, sal,
case
when deptno = 10 then sal*0.5
when deptno = 20 then sal*0.7
else sal
end 보너스
From emp;
