1. ANSI ���� ����
    inner join
        - on ���� �̿��� join
        - using ���� �̿��� join
        - natural join
    outer join
        - left / rigth / full
    cross join(catesian product)
    
2. Oracle ���� ����
    equi join: �����Ϸ��� ���̺� ������ ������� = �� ��� (FK = PK)
    non equi join: �����Ϸ��� ���̺� ������ ������� = �� �ƴ� ��� (between and)
    Self join:
    Outer join: equi �������� �� �� ���� ����� �� ��� (+)
    Catesian Product: ���� ���� ���� ���� ���� (N*N)

-------------------------------------------------------------------------------

@c:\lib\datatable.sql

/* join�� �Ϸ��� ���̺� �м��� ���� �Ǿ���� */
-- JOIN �Ϸ��� col�� ������ ������ ���ƾ���
select * from dept;
select * from emp;



/* Oracle ����� equi join */

-- �⺻���� join ���� --
select ename, dname
from emp,dept
where emp.deptno = dept.deptno;


-- deptno�� ��� ���̺� ����: ���� �߻�
select ename, dname, deptno -- 2���� ���̺� ��� ���� / ���� �߻�
from emp,dept
where emp.deptno = dept.deptno;

-- ��ŷ���� �ذ� --
select ename, dname, dept.deptno
from emp, dept
where emp.deptno = dept.deptno; -- ��������: fk = pk

-- ���� �ǽ�
select employee_id, employees.job_id, job_title
from employees, jobs
where employees.job_id = jobs.job_id;


--table�� aline �ɾ���--
select ename, dname, d.deptno
from emp e, dept d
where e.deptno = d.deptno;

-- sal�� 2500 �̻��� ����� �̸��� �μ��̸�, sal, �μ���ȣ�� ����ϼ���.
select ename, dname, d.deptno, sal
from emp e, dept d
where e.deptno = d.deptno and sal >= 2500;




/* ANSI ���� (ǥ��), from���� , => join���� ���� where���� �������� => on */

<-- inner join ��� ==> ���� ���̺� ��� �ִ� ������ ���>
select ename, dname, d.deptno
from emp e join dept d
on e.deptno = d.deptno;

select ename, dname, d.deptno, sal
from emp e join dept d
on e.deptno = d.deptno
where sal >= 2500;



<-- outer join ��� ((+) �߰������� ��ŷ)>

-- Oracle ���� ���
select ename, dname, d.deptno
from emp e, dept d
where e.deptno(+) = d.deptno;

-- ANSI ���� ��� (�̰��� �� ��ȣ)
select ename, dname, d.deptno
from emp e right outer join dept d  --dept ���̺��� master�� ��
on e.deptno = d.deptno;

select ename, dname, d.deptno
from emp e left outer join dept d  --emp ���̺��� master�� ��
on e.deptno = d.deptno;

select ename, dname, d.deptno
from emp e full outer join dept d
on e.deptno = d.deptno;


-- ���� �ǽ�
select employee_id, e.department_id, department_name
from employees e full outer join departments d
on e.department_id = d.department_id;




/* non-equi join: pk�� fk ���� ��� �������� ����*/
(-- equi join => fk=pk)

-- Oracle ���� ���
Select ename, sal, grade, losal, hisal
From emp, salgrade
Where sal between losal and hisal
Order by ename;

-- ANSI ���� ���
Select ename, sal, grade, losal, hisal
From emp join salgrade
on sal between losal and hisal
Order by ename;

-- losal, hisal ���� col�� ���
Select emp.*, salgrade.grade -- emp�� ��� ���, salgrade�� grade�� ���
From emp join salgrade
on sal between losal and hisal
Order by ename;




/* 3�� ���̺� ���� */
-- ename, dname, loc, sal, grade ���

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
where sal >= 2000   -- where ��� and ����
Order by dept.deptno;




/* Self join */

<-- oracel join���� ǥ��>

-- ����� �̸��� ����� �̸�
Select e.ename "����� �̸�" , m.ename "����� �̸�"
From emp e, emp m
Where e.mgr = m.empno -- e�� mgr�� FK / m�� empno�� PK
ORder by 1;

-- ����� �̸��� ����� �̸�
Select e.ename "����� �̸�" , m.ename "����� �̸�"
From emp e, emp m
Where e.mgr = m.empno(+) -- outer �������� ��ü ��� ���
ORder by 1;

-- and�� ���� �߰� ����
Select e.ename "����� �̸�" , m.ename "����� �̸�"
From emp e, emp m
Where e.mgr = m.empno and upper(e.ename) = upper('&name')
ORder by e.sal;


<-- ANSI join���� ǥ��>

-- ANSI inner join
Select e.ename "����� �̸�" , m.ename "����� �̸�"
From emp e outer join emp m
on e.mgr = m.empno;

-- ANSI outer join (left, right, full)
Select e.ename "����� �̸�" , m.ename "����� �̸�"
From emp e left outer join emp m
on e.mgr = m.empno;




/* ����: ����� �޿��� ����� �޿����� ���� ��� ��� ����Ʈ */
<-- Oracle>
Select e.ename "���", e.sal "��� �޿�", m.ename "���", m.sal "��� �޿�"
From emp e, emp m
Where e.mgr = m.empno and e.sal > m.sal; 

<-- ANSI>
Select e.ename "���", e.sal "��� �޿�", m.sal "��� �޿�"
From emp e join emp m
on e.mgr = m.empno
Where e.sal > m.sal; 

/* ����: ��纸�� �Ի����� ���� ��� */
Select e.ename, e.hiredate "��� �Ի���", m.hiredate "��� �Ի���"
From emp e, emp m
Where e.mgr = m.empno and e.hiredate < m.hiredate;

Select e.ename
From emp e join emp m
on e.mgr = m.empno and e.hiredate < m.hiredate;

/* ����: KING���Դ� CEO �Է� */
Select e.ename "����� �̸�" , nvl(m.ename, '<CEO>') "����� �̸�"
From emp e left outer join emp m
on e.mgr = m.empno;

/* ����: dept�� �ִ� �� �� �������*/
Select empno, ename, dname, loc, sal
From emp right outer join dept
on emp.deptno = dept.deptno
Where sal > 2000; -- outer join�� ��� ���� ��

-- �̰��� �ذ��Ϸ��� and �������� ����
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




/* join: col�� ���� */
/* union: row�� ���� */
