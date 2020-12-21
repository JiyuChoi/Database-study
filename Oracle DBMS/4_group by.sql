/* 입력 순서*/
select
from
where
group by
having
order by

/* 구문 처리 순서 */
from - where - select - order by
from - where - group by - having - select - rownum이 만들어지는 위치 - order by
-- rownum이 먼저 생성 그리고 order by 되기 때문에 order by 먼저 설정해주고 rownum 해줘야지 깨지지 않음 



/* 집계함수, 그룹함수 */
Select ename, lower(ename), hiredate, to_char(hiredate, 'MM')
from emp;

Select round(avg(sal),2) 평균급여
from emp;

<-- single, multi function 같이 사용 불가능-->
-- lower은 결과값 여러개 (single row function)
-- avg는 한 개 (multi row function)
Select lower(ename), avg(sal) -- 오류 남
from emp;


Select sum(sal), count(sal), sum(sal)/count(sal), avg(sal), max(sal), min(sal)
from emp;

-- 전체 row의 개수
Select count(*) from emp;

-- 중복 제거하고 출력
Select count(distinct job) from emp;

-- 전체 sal 평균
Select round(avg(sal)) from emp;
-- deptno = 10 인 sal 평균
Select round(avg(sal)) from emp Where deptno = 10;


/* Group by: ~~별 */
-- 부서별 (select에는 group by에 있는 열과 집계함수만 쓸 수 있다: ename 쓰면 오류남)
Select deptno 부서번호, round(avg(sal)) 평균급여, max(sal) 최대급여, min(sal) 최소급여
From emp
group by deptno
order by 1;

Select emp.deptno 부서번호, dname, round(avg(sal)) 평균급여, max(sal) 최대급여, min(sal) 최소급여
From emp join dept
on emp.deptno = dept.deptno
group by emp.deptno, dname
order by 1;

-- loc 도시 이름별 평균 급여를 구하세요.
Select loc, round(avg(sal)) 평균급여
From emp join dept
on emp.deptno = dept.deptno
group by loc
order by 2;

-- emp 월별 입사자 수
Select to_char(hiredate, 'MM') 월, count(*) "입사자 수"
From emp
group by to_char(hiredate, 'MM')
order by 1;

-- emp 요일별 입사자 수
Select to_char(hiredate, 'Day') 요일, count(*) "입사자 수"
From emp
group by to_char(hiredate, 'Day')
order by 1;


<-- 집계 함수를 조건에 사용하려면 where이 아니라 having으로 해주어야함>
-- 부서이름별 평균 급여가 2000 이상인 리스트
Select dname 부서명, round(avg(sal)) "평균 급여"
From emp join dept
on emp.deptno = dept.deptno
where sal > 2000 -- 급여가 2000보다 큰 사람만 집계
group by dname
having round(avg(sal)) > 2000
order by 2;

-- roll up cube (중간 집계)
Select deptno, job, sum(sal)
from emp
group by rollup(deptno, job)
order by 1, 2; 



/* SubQuery */

<-- Ford 사원보다 급여를 많이 받는 사원 리스트>
-- Ford 연봉은 얼마야?
Select sal
From emp
Where ename = upper('Ford');

-- Ford 연봉이 바뀔 수도 있는데?
Select ename, sal
From emp
where sal > (Select sal From emp Where ename = upper('Ford'));


<-- 회사의 평균 급여보다 적게 받는 사원 리스트>
Select ename, sal
From emp
Where sal < (Select avg(sal) From emp)
Order by 2;

<-- 급여가 제일 작은 사원>
Select ename
From emp
Where sal = (Select min(sal) From emp);

/* 스칼라 = 단일값, 벡터 = 다중값 */
Select min(sal) From emp;
Select min(sal) From emp group by deptno;

<-- 부서별 값(다중값)이 와서 오류 발생>
Select *
from emp
where sal = (Select min(sal) from emp group by deptno);


<-- 부서별 최소 급여 목록>
Select deptno, ename, sal
from emp
where sal in (Select min(sal) from emp group by deptno);

<--이것을 풀어쓴다면>
-- set으로 표현 가능
Select deptno, ename, sal
from emp
where sal in (800, 950, 1300);

-- or로 표현가능
Select deptno, ename, sal
from emp
where sal=800 or sal=950 or sal=1300;


<-- 부서별 최대 급여 목록>
Select deptno, ename, sal
from emp
where (deptno, sal) in (Select deptno, max(sal) from emp group by deptno);

-- set으로 풀어쓰기 가능
Select deptno, ename, sal
from emp
where (deptno, sal) in ((30, 2850), (20, 3000), (10,5000));

-- or로 풀어쓰기
Select deptno, ename, sal
from emp
where (deptno=30 and sal=2850) or (deptno=20 and sal=3000) or (deptno=10 and sal=5000);


Select deptno, ename, sal
from emp
where deptno < all(10, 20);

Select deptno, ename, sal
from emp
where deptno > any(10, 20);



/* 상관관계 쿼리문 */
-- 자신이 속한 부서의 평균 급여보다 적은 사원 리스트
Select deptno, ename, sal
from emp e
where sal < (Select avg(sal) From emp where deptno = e.deptno);



/* 9장 집합연산자 */

-- 두 개의 값을 합하는데 중복은 제거
Select job From emp Where deptno = 10
union
Select job From emp Where deptno = 20;

-- union을 쓰려면 컬럼의 수가 같게 맞춰주어야함
Select job, 'aa' From emp Where deptno = 10
union
Select job, null From emp Where deptno = 20;

-- union all
Select job From emp Where deptno = 10
union all
Select job From emp Where deptno = 20;

-- 교차 되는 값
Select job From emp Where deptno = 10
intersect
Select job From emp Where deptno = 20;

-- 두 개의 값의 차 (A-B)
Select job From emp Where deptno = 10
minus
Select job From emp Where deptno = 20;
