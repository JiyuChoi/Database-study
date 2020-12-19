select * from tab; -- ctrl + enter
--@c:\lib\datatable.sql;

select
*
FROM emp; -- 오라클에서는 반드시 FROM을 써야한다

select user from dual; --하나의 값만 보려면

Describe dept; -- table의 구조 확인
DESC dual;

SELECT
    empno, ename, job, sal, deptno
FROM
    emp;
    
SELECT ename, sal, comm, deptno, job
FROM emp;

SELECT ename, sal as "월 급", sal*12 "연 봉" -- col(identifier)명 수정 (as 생략해도 가능)
FROM emp;

-- 자바 문자열 ==> ""    오라클 문자열 ==> '' (유일하게 col명에서만 "" 사용 가능)

SELECT FIRST_NAME, SALARY||'원' as "월 급", SALARY *12 "연 봉"
FROM employees;

-- nvl 함수: Null값 바꾸는 함수 (comm 값이 Null이라면 0으로 처리)
SELECT ename 사원명, sal, nvl(comm, 0) 영업수당 , sal + nvl(comm, 0) as "월 급"
FROM emp;

-- A + 10 ==> ? (더하는 것의 타입을 맞춰야함)
-- 문자열로 바꾸는 함수: to_char (숫자는 오른쪽 정렬, 문자는 왼쪽 정렬)
SELECT empno, ename, nvl(to_char(mgr), '<<TOP>>') 상사
FROM emp;

-- 문자열 연결 연산자: ||
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME as 사원명, nvl(to_char(MANAGER_ID), '<<TOP>>') 상사
FROM employees;

-- 중복 제거: DISTINCT
SELECT job FROM emp;
SELECT DISTINCT job FROM emp;
SELECT DISTINCT deptno, job FROM emp;

-- sysdate: 현재시간, user: 사용자 이름
SELECT sysdate, user FROM dual;
-- sysdate: RR/MM/DD



