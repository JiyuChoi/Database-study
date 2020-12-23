-- 10장 데이터 조작어 DML: Insert, Update, Delete ==> Rollback 가능
-- 11장 DDL Table 생성 (auto commit) ==> Rollback 불가능

-- 프로젝트 ==> CURD : Insert, Update, Select, Delete
-- SQL: DML, DDL, DTL, DCL, Qurey문 (select)

-----------------------------------------------------------------------------------

/* Book 테이블 */
-- title, author, pubdate, ...

DROP table book; --> 테이블 삭제, Rollback 불가능

<-- 테이블 생성 -->
CREATE TABLE book(
    bookno NUMBER(5),
    title VARCHAR2(30),
    author VARCHAR2(30),
    pubdate DATE
);

ROLLBACK; -- 이전 명령 취소 (앞의 rollback, commit까지 취소)
COMMIT; --확정

<-- 데이터 삽입 -->
INSERT INTO book values( 2, 'sql', '홍길동', sysdate, 900 );
<-- 데이터 삭제 -->
DELETE from book where pubdate is null;
<-- 데이터 갱신 -->
UPDATE book SET pubdate = sysdate;

<-- col 추가: add -->
ALTER table book add(price number(7));
<-- col 제거: drop column -->
ALTER table book drop column price;
<-- col의 데이터 형 변환: modify -->
ALTER table book modify(price number(9,2)); -- 소수 2번째 자리까지 출력

<-- 데이터 삭제 -->
DELETE FROM book; -- roll back 가능 (테이블 데이터만 삭제, 구조는 남김)
TRUNCATE table book; -- auto commit (테이블 데이터만 삭제, 구조는 남김)
DROP table book; -- auto commit (테이블 자체가 사라짐)

<-- 이름 변경 -->
rename book to book2;

-----------------------------------------------------------------------------------

-- sqlplus에서 col book for a14로 열 너비를 줄일 수 있다.

DESC book;


/* 데이터 Insert 하는 방법 */
-- 1)
INSERT INTO book(bookno, title, author, pubdate)
            values( 1, 'java', '홍길동', sysdate );
COMMIT;

-- 2)
INSERT INTO book values( 2, 'sql', '홍길동', sysdate );

-- 3)
INSERT INTO book (bookno, title) values( 3, 'spring');

-- col 명시하지 않고 3개의 데이터만 넣으면 오류남
INSERT INTO book values( 3, 'HTML', '홍길동');
-- NULL로 처리해주면 오류 해결
INSERT INTO book values( 3, 'HTML', '홍길동', NULL);

select * from book where author is null;

ROLLBACK; -- 마지막 commit 명령 전까지 취소 (1, java만 나옴)



-- 기존 날짜 형식에 맞춰 자동으로 형변환되어 insert 됨
INSERT INTO book values( 3, 'HTML', '홍길동', '2017/1/5');
INSERT INTO book values( 3, 'HTML', '홍길동', '17/1/5');

-- 형 변환에 문제가 생김
INSERT INTO book values( 3, 'HTML', '홍길동', '12/30/2017');
-- 형식을 직접 정해줘서 오류해결
INSERT INTO book values( 3, 'HTML', '홍길동', to_date('12/30/2017', 'mm/dd/yyyy'));



/* 데이터 삭제 */
delete 해버리면 모든 데이터가 삭제되므로 where절로 조건을 명시해주어야함
-- pubdate 데이터가 비어있는 행만 삭제
delete from book where pubdate is null;

delete from book where bookno = 3;



/* 데이터 갱신 */
update book set pubdate = sysdate;
update book set pubdate = '20/1/1', title = '...';



/* Alter table: 테이블 구조 변경 ==> auto commit */

<-- col 추가: add -->
alter table book add(price number(7));

desc book;

<-- col 제거: drop column -->
alter table book drop column price;

<-- col의 데이터 형 변환: modify -->
alter table book modify(price number(9,2)); -- 소수 2번째 자리까지 출력

<-- modify하는 경우 오류를 줄이기 위해 데이터 값을 null로 비워놓고 수정한다 -->
update book set price = null;




<-- price가 null인 곳을 0으로 바꾸자>
Update book set price = 0 where price is null;

INSERT INTO book values( 2, 'sql', '홍길동', sysdate, 900 );
INSERT INTO book values( 3, 'HTML', '홍길동', sysdate, 900.99 ); -- 반올림 처리되어 결과 나옴



/* 삭제 기능 */
DELETE FROM book; -- roll back 가능 (테이블 데이터만 삭제, 구조는 남김)
TRUNCATE table book; -- auto commit (테이블 데이터만 삭제, 구조는 남김)
DROP table book; -- auto commit (테이블 자체가 사라짐)


-------------------------------------------------------------------------------------
/* 제약 조건 유무의 차이 */
select * from emp;
select * from dept;

-- 복사한 테이블 생성
Create table emp2 as select * from emp;
Create table dept2 as select * from dept; -- 데이터만 복사되므로 관계 설정(pk, fk)이 없다

Insert into dept values(50, 'EDU', 'SEOUL');
Insert into dept2 values(50, 'EDU', 'SEOUL');

commit;

-- pk: unique, not null 위반해서 오류남
Insert into dept values(10, 'EDU', 'SEOUL');
Insert into dept values(Null, 'EDU', 'SEOUL');

-- pk 설정이 안되어 있어서 오류 안남
Insert into dept2 values(10, 'EDU', 'SEOUL');
Insert into dept2 values(Null, 'EDU', 'SEOUL');

-- fk 제약조건 위반해서 오류 남
Insert into emp (empno, ename, hiredate, sal, deptno)
        values(999, '홍길동', sysdate, 0, 90);
Insert into emp2 (empno, ename, hiredate, sal, deptno)
        values(999, '홍길동', sysdate, 0, 90);





/* 제약 조건 설정 */
CREATE TABLE book(
    bookno NUMBER(5) primary key, -- unique + not null, index 생성
    title VARCHAR2(30) unique, -- index 생성
    author VARCHAR2(30) not null,
    price number(7,2) check(price>0), -- price < 0이면 체크 옵션에 걸림
    pubdate DATE default sysdate -- 값 설정 안하면 기본값 들어감
);

-- Alter로 제약 조건 추가
Alter table add book constraint book_bookno_pk primary key(book_no);



<-- emp, dept 제약 조건 설정 실습>
Select * from dept;
delete from dept where deptno = 50;

drop table depnt2 purge;
create table dept2 as select * from dept;
desc dept2;
alter table dept2 add constraint dept2_deptno_pk primary key(deptno);

drop table emp2 purge;
create table emp2 as select * from emp;
desc emp2;
alter table emp2 add constraint emp2_empno_pk primary key(empno);

-- FK: emp2 테이블에 있는 deptno는 dept2 테이블에 있는 deptno를 ref
alter table emp2 add constraint emp2_deptno_fk foreign key(deptno) references dept2;
-- FK: emp2 테이블에 있는 mgr는 emp2 테이블을 ref
alter table emp2 add constraint emp2_mgr_fk foreign key(mgr) references emp2;

-- 설정한 규칙 지우기
alter table emp2 drop constraint emp2_deptno_fk;




/* 데이터 삭제도 제약 조건을 고려하여 단계적으로 수행해야함*/

-- 이렇게 되면 오류남
delete from dept2 where deptno = 20;

-- 부모가 삭제되면 자식들을 NULL로 만들어주고 DELECT 수행해야함
Alter table emp2
add constraint emp2_deptno_fk
foreign key(deptno) references dept2 ON DELETE SET NULL; -- NULL로 세팅
Delete from dept2 where deptno = 20;

-- CASCADE 자식도 같이 삭제
Alter table emp2
add constraint emp2_deptno_fk
foreign key(deptno) references dept2 ON DELETE CASCADE;
Delete from dept2 where deptno = 20;

SELECT * FROM DEPT2;
SELECT * FROM EMP2;




/* 트랜젝션 */

-- 자식을 먼저 삭제하고 부모를 삭제
drop table dept2 CASCADE CONSTRAINT purge;
create table dept2 as select * from dept;
delete from dept2 where deptno = 10;

-- 여러 유저가 사용할 경우 한쪽에서 commit을 해주어야 block이 되지 않는다




/* savepoint 설정 */
delete from dept2 where deptno = 10;
savepoint aa1;
delete from dept2 where deptno = 20;
delete from dep2t where deptno = 30;

update dept2 set loc='....' where deptno = 10;
rollback to savepoint aa1;




/* drop table한 것이 휴지통에 있다면 복구 가능 */
drop table emp;
select * from recyclebin;
FLASHBACK table emp2 to before drop;
purge recyclebin; -- 휴지통 비우기


