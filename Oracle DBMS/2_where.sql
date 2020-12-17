-- �α��� ���� Ȯ��
SELECT user FROM dual;

SELECT
    empno,
    ename,
    job,
    mgr,
    hiredate �Ի���,
    sal + nvl(comm,0) as �޿�,
    deptno
FROM
    emp;
    
    
<-- ������ WHERE (deptno = 20)>
SELECT
    empno,
    ename,
    job,
    mgr,
    hiredate �Ի���,
    sal + nvl(comm,0) as �޿�,
    deptno
FROM
    emp
WHERE deptno = 20;


-- �޿� 3000 �̻� (Where �޿� >= 3000; ���� ������)
SELECT
    empno, ename, job, mgr, hiredate �Ի���, sal + nvl(comm,0) as �޿�, deptno
FROM
    emp
WHERE sal + nvl(comm,0) >= 3000;


<-- ����: Order by>
SELECT
    empno, ename, job, mgr, hiredate �Ի���, sal + nvl(comm,0) as �޿�, deptno
FROM
    emp
ORDER BY �޿� DESC;


-- select, from�� �ʼ��� where, order by�� ����
SELECT
FROM
WHERE
ORDER BY;


SELECT deptno, empno, ename, job, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE sal+nvl(comm,0) > 900
ORDER BY deptno asc, �޿� desc;


-- sal�� ������ ���� ���� (���� �ȳ�)
SELECT deptno, empno, ename, job, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE sal > 900
ORDER BY 1 asc, �޿� desc;
-- col num���ε� ���İ���


SELECT
    employee_id, first_name ||' '|| last_name �̸�, email, hire_date, salary + nvl(commission_pct,0) �޿�, department_id
FROM
    employees
WHERE department_id = 90
ORDER BY �޿�;


-- & ġȯ�Լ� (�� �Է� �ޱ�, �� ������)
SELECT deptno, empno, ename, job, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE deptno = &deptno;


-- ������ ��ҹ��� �������� ������, ���� ������ ��ҹ��� ������
SELECT deptno, empno, ename, job, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE job = 'MANAGER'; --'manager'�� ������


-- ���� ���� ������ ������ Ÿ���� ���ƾ���
-- ���ڿ��� �ٲ��־���� --> ' '
SELECT deptno, empno, ename, job, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE job = '&job';


<-- ���� ��ȯ (��ҹ���)>
SELECT 'aaa', upper('aaa'), lower('AAA') FROM dual;


-- ��ҹ��� ���� ���� �˻��ϴ� �� (���� �� ��ȯ)
SELECT deptno, empno, ename, job, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE UPPER(job) = UPPER('&job');


-- Show parameter nls;





<-- ��¥ ������>
SELECT deptno, job, ename, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE to_date(hiredate) = '80/12/27';

select sysdate from dual;


<-- not equal (!=, <>)>
SELECT deptno, job, ename, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE hiredate != '81/09/28';

SELECT deptno, job, ename, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE hiredate <> '81/09/28';


<-- to-date: RR/MM/DD ���·� �ٲپ� �־�� ��>
SELECT deptno, job, ename, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE hiredate = to_date('22-02-1981', 'dd-mm-yyyy');

SELECT deptno, job, ename, hiredate �Ի���, sal + nvl(comm,0) as �޿�
FROM emp
WHERE hiredate < to_date('22-2-1981', 'dd-mm-yyyy');


-- to_char�� �̿��� ���ϴ� ��¥ �����͸� ���� �� �ִ�
SELECT ename, hiredate, to_char(hiredate,'YYYY') �Ի�⵵, to_char(hiredate,'MM') �Ի��, to_char(hiredate,'DD') �Ի���,
        to_char(hiredate,'DAY') �Ի����
FROM emp;


-- '82/2/1'
SELECT to_date('82/2/1', 'RR/MM/DD'), to_char(to_date('82/2/1', 'RR/MM/DD'),'YYYY') FROM dual; --1982
SELECT to_date('82/2/1', 'YY/MM/DD'), to_char(to_date('82/2/1', 'YY/MM/DD'),'YYYY') FROM dual; --2082



<-- ���� ������ (and, or)>
-- and ������
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE sal >= 3000 and sal <= 5000
ORDER BY �޿� DESC;

-- between and ������
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE sal between 3000 and 5000
ORDER BY �޿� DESC;

-- not between and (�ش� ������ ����)
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE sal not between 3000 and 5000
ORDER BY �޿� DESC;

-- or ������
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE deptno = 10 or deptno = 20
ORDER BY deptno, �޿� DESC;


<-- ���� ������>
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE deptno in (10, 20) -- 10 �Ǵ� 20
ORDER BY deptno, �޿� DESC;

-- (����) ���� ������
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE deptno not in (10, 20) -- 10 �Ǵ� 20
ORDER BY deptno, �޿� DESC;

- (deptno, loc): (,)�� and�� ���δ� (�� ������ �� �����ؾ���)
SELECT *
FROM dept
WHERE (deptno, loc) in ((10,'NEW YORK'),(30,'NEW YORK'));




<-- Like ������ (% _ �� �ٿ��� ���)>

-- 'A%' �̸� A�� �����ϴ� �� , '%A%' �߰��� A�� ���� ��
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE ename like '%A%'
ORDER BY deptno, �޿� DESC;

SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE upper(ename) like upper('a%') -- ��ҹ��� ���� ó��
ORDER BY deptno, �޿� DESC;

SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE upper(ename) like upper('%a_s%') -- ��ҹ��� ���� ó��
ORDER BY deptno, �޿� DESC;


-- emp ���̺� 81�⵵ �Ի��� ���
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE to_char(hiredate, 'RR') in '81'

SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE hiredate like '81%'


-- emp ���̺� 9�� �Ի��� ���
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE to_char(hiredate, 'MM') in '09'

SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE hiredate like '__/09/__'

SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE to_char(hiredate, 'MM') like '%9%'

-- �̸��� A, B, C, D�� �����ϴ� ��� ���
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE ename like 'A%' or  ename like 'B%' or  ename like 'C%' or  ename like 'D%';



<-- ���Խ� ���>
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE REGEXP_LIKE (ename, 'A|B|C|D');

-- A, B, C, D�� �����ϴ�
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE REGEXP_LIKE (ename, '^[A-D]');

-- A, B, C, D�� ������
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE REGEXP_LIKE (ename, '[A-D]$');


<-- null�� ���� ����>
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�, comm
FROM emp
WHERE comm is null
ORDER BY 1;

SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�, comm
FROM emp
WHERE comm is not null
ORDER BY 1;

SELECT * FROM dept;

SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE mgr is null
ORDER BY 1;


<-- MYSQL������ �������� ���� >
-- = any: �� �߿� �ϳ� �ƹ��ų� (= in X)
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE deptno = any(10,30)
ORDER BY deptno, �޿� DESC;

-- != all (10, 30 ��� �ƴ� ��)
SELECT deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
WHERE deptno != all(10,30)
ORDER BY deptno, �޿� DESC;


<-- Oracle paging ó��>
SELECT rownum, deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp;

-- ������ �ϸ� rownum�� ������
SELECT rownum, deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM emp
ORDER BY sal;

-- sal �������� ������ �ϰ� rownum�� �ְڴ�
SELECT rownum, deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM (Select * from emp order by sal desc);

-- �޿� TOP-3�� �̾ƺ���
SELECT rownum, deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM (Select * from emp order by sal desc)
WHERE rownum < 4;

-- where�� ���� ����ǰ� rownum�� �����Ǳ� ������ ������ ��
SELECT rownum, deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM (Select * from emp order by sal desc)
WHERE rownum > 4;


<-- paging ó���� �̷���!>
-- 1page ==> 1~5,  2page ==> 6~10
select * from
(SELECT rownum row#, deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM (Select * from emp order by sal desc))
WHERE row# between 6 and 10;

<-- ���� ���ε�--!>
select * from
(SELECT rownum row#, deptno, job, ename, hiredate �Ի���, sal as �޿�
FROM (Select * from emp order by sal desc))
WHERE row# between &start and &end;



<-- �ǽ� -->
select employee_id, last_name, job_id, &column_name -- � col �����Ұǵ�
From employees
where &condition -- ������ ����
order by &order_colun; -- ���� ������

-- ���� ���ۻ��� &&
select employee_id, last_name, job_id, &&column_name -- ���⼭ ����Ѱ�
From employees
where &condition
order by &column_name; -- ���Է� ���� ���⼭ ���ž�

-- �̸��� ����° ���ڰ� 'A'�� ��� ����� �̸��� ǥ��
SELECT ename
FROM emp
where ename like '__A%';


-- Chapter 4.
<-- �����Լ� : single row function (������ �ϳ��� �ϳ��� ��) >
<-- ����ȯ, ������(�ڵ�) �����(���� ���)

-- ������
SELECT 3+4.5 FROM dual;
SELECT 1/2 FROM dual;
SELECT '3'+4 FROM dual; -- 7�� ���� (�ڵ����� ����ȯ ��)

-- 4���� 2�ڸ��� �̴´�
SELECT employee_id, hire_date, job_id, substr(job_id, 4, 2)
FROM employees;

-- ��¥ �����Ϳ��� ������ ���� �� to_char(hire_date, 'YY')�� ����� �� ��õ
-- ��¥�� ���ڷ� �� ��ȯ to_char()
SELECT employee_id, to_char(hire_date, 'YY') "�Ի翬�� ���1", substr(hire_date, 1, 2) "�Ի翬�� ���2", job_id, substr(job_id, 4, 2)
FROM employees;

SELECT round(15.193, 2), trunc(45.567, 2) FROM dual;

-- ���� ��¥�� ���� ��
SELECT sysdate, sysdate+1 FROM dual;

SELECT sysdate, to_char(sysdate+30, 'day') FROM dual;

-- ��¥�� �� ��ȯ
SELECT sysdate, to_date('20/12/15'), to_date('20-12-15'), to_date('20-12-2015', 'dd-mm-yyyy') FROM dual;


<-- nvl>
-- comm�� �����̰� '_'�� ���� --> �� ��ȯ�� �������
SELECT ename, mgr, nvl(comm,0), nvl(to_char(comm), '_')
FROM emp;

-- nvl2
SELECT ename, nvl2(mgr,'O','X'), nvl(comm,0)
FROM emp;

-- coalesce(a,b,c): a�� null�̸� b, b�� null�̸� c 
SELECT ename, sal, comm, coalesce(sal+comm, sal, 0) �Ǳ޿�
FROM emp;

<-- decode �Լ�>
SELECT ename, sal, decode(deptno, 10, sal*0.5, 20, sal*0.7, sal) ���ʽ�, deptno
FROM emp
order by deptno;

<-- Case ����>
SELECT ename, deptno, sal,
case
when deptno = 10 then sal*0.5
when deptno = 20 then sal*0.7
else sal
end ���ʽ�
From emp;
