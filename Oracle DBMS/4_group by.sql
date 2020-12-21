/* �Է� ����*/
select
from
where
group by
having
order by

/* ���� ó�� ���� */
from - where - select - order by
from - where - group by - having - select - rownum�� ��������� ��ġ - order by
-- rownum�� ���� ���� �׸��� order by �Ǳ� ������ order by ���� �������ְ� rownum ������� ������ ���� 



/* �����Լ�, �׷��Լ� */
Select ename, lower(ename), hiredate, to_char(hiredate, 'MM')
from emp;

Select round(avg(sal),2) ��ձ޿�
from emp;

<-- single, multi function ���� ��� �Ұ���-->
-- lower�� ����� ������ (single row function)
-- avg�� �� �� (multi row function)
Select lower(ename), avg(sal) -- ���� ��
from emp;


Select sum(sal), count(sal), sum(sal)/count(sal), avg(sal), max(sal), min(sal)
from emp;

-- ��ü row�� ����
Select count(*) from emp;

-- �ߺ� �����ϰ� ���
Select count(distinct job) from emp;

-- ��ü sal ���
Select round(avg(sal)) from emp;
-- deptno = 10 �� sal ���
Select round(avg(sal)) from emp Where deptno = 10;


/* Group by: ~~�� */
-- �μ��� (select���� group by�� �ִ� ���� �����Լ��� �� �� �ִ�: ename ���� ������)
Select deptno �μ���ȣ, round(avg(sal)) ��ձ޿�, max(sal) �ִ�޿�, min(sal) �ּұ޿�
From emp
group by deptno
order by 1;

Select emp.deptno �μ���ȣ, dname, round(avg(sal)) ��ձ޿�, max(sal) �ִ�޿�, min(sal) �ּұ޿�
From emp join dept
on emp.deptno = dept.deptno
group by emp.deptno, dname
order by 1;

-- loc ���� �̸��� ��� �޿��� ���ϼ���.
Select loc, round(avg(sal)) ��ձ޿�
From emp join dept
on emp.deptno = dept.deptno
group by loc
order by 2;

-- emp ���� �Ի��� ��
Select to_char(hiredate, 'MM') ��, count(*) "�Ի��� ��"
From emp
group by to_char(hiredate, 'MM')
order by 1;

-- emp ���Ϻ� �Ի��� ��
Select to_char(hiredate, 'Day') ����, count(*) "�Ի��� ��"
From emp
group by to_char(hiredate, 'Day')
order by 1;


<-- ���� �Լ��� ���ǿ� ����Ϸ��� where�� �ƴ϶� having���� ���־����>
-- �μ��̸��� ��� �޿��� 2000 �̻��� ����Ʈ
Select dname �μ���, round(avg(sal)) "��� �޿�"
From emp join dept
on emp.deptno = dept.deptno
where sal > 2000 -- �޿��� 2000���� ū ����� ����
group by dname
having round(avg(sal)) > 2000
order by 2;

-- roll up cube (�߰� ����)
Select deptno, job, sum(sal)
from emp
group by rollup(deptno, job)
order by 1, 2; 



/* SubQuery */

<-- Ford ������� �޿��� ���� �޴� ��� ����Ʈ>
-- Ford ������ �󸶾�?
Select sal
From emp
Where ename = upper('Ford');

-- Ford ������ �ٲ� ���� �ִµ�?
Select ename, sal
From emp
where sal > (Select sal From emp Where ename = upper('Ford'));


<-- ȸ���� ��� �޿����� ���� �޴� ��� ����Ʈ>
Select ename, sal
From emp
Where sal < (Select avg(sal) From emp)
Order by 2;

<-- �޿��� ���� ���� ���>
Select ename
From emp
Where sal = (Select min(sal) From emp);

/* ��Į�� = ���ϰ�, ���� = ���߰� */
Select min(sal) From emp;
Select min(sal) From emp group by deptno;

<-- �μ��� ��(���߰�)�� �ͼ� ���� �߻�>
Select *
from emp
where sal = (Select min(sal) from emp group by deptno);


<-- �μ��� �ּ� �޿� ���>
Select deptno, ename, sal
from emp
where sal in (Select min(sal) from emp group by deptno);

<--�̰��� Ǯ��ٸ�>
-- set���� ǥ�� ����
Select deptno, ename, sal
from emp
where sal in (800, 950, 1300);

-- or�� ǥ������
Select deptno, ename, sal
from emp
where sal=800 or sal=950 or sal=1300;


<-- �μ��� �ִ� �޿� ���>
Select deptno, ename, sal
from emp
where (deptno, sal) in (Select deptno, max(sal) from emp group by deptno);

-- set���� Ǯ��� ����
Select deptno, ename, sal
from emp
where (deptno, sal) in ((30, 2850), (20, 3000), (10,5000));

-- or�� Ǯ���
Select deptno, ename, sal
from emp
where (deptno=30 and sal=2850) or (deptno=20 and sal=3000) or (deptno=10 and sal=5000);


Select deptno, ename, sal
from emp
where deptno < all(10, 20);

Select deptno, ename, sal
from emp
where deptno > any(10, 20);



/* ������� ������ */
-- �ڽ��� ���� �μ��� ��� �޿����� ���� ��� ����Ʈ
Select deptno, ename, sal
from emp e
where sal < (Select avg(sal) From emp where deptno = e.deptno);



/* 9�� ���տ����� */

-- �� ���� ���� ���ϴµ� �ߺ��� ����
Select job From emp Where deptno = 10
union
Select job From emp Where deptno = 20;

-- union�� ������ �÷��� ���� ���� �����־����
Select job, 'aa' From emp Where deptno = 10
union
Select job, null From emp Where deptno = 20;

-- union all
Select job From emp Where deptno = 10
union all
Select job From emp Where deptno = 20;

-- ���� �Ǵ� ��
Select job From emp Where deptno = 10
intersect
Select job From emp Where deptno = 20;

-- �� ���� ���� �� (A-B)
Select job From emp Where deptno = 10
minus
Select job From emp Where deptno = 20;
