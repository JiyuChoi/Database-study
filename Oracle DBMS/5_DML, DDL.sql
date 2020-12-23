-- 10�� ������ ���۾� DML: Insert, Update, Delete ==> Rollback ����
-- 11�� DDL Table ���� (auto commit) ==> Rollback �Ұ���

-- ������Ʈ ==> CURD : Insert, Update, Select, Delete
-- SQL: DML, DDL, DTL, DCL, Qurey�� (select)

-----------------------------------------------------------------------------------

/* Book ���̺� */
-- title, author, pubdate, ...

DROP table book; --> ���̺� ����, Rollback �Ұ���

<-- ���̺� ���� -->
CREATE TABLE book(
    bookno NUMBER(5),
    title VARCHAR2(30),
    author VARCHAR2(30),
    pubdate DATE
);

ROLLBACK; -- ���� ��� ��� (���� rollback, commit���� ���)
COMMIT; --Ȯ��

<-- ������ ���� -->
INSERT INTO book values( 2, 'sql', 'ȫ�浿', sysdate, 900 );
<-- ������ ���� -->
DELETE from book where pubdate is null;
<-- ������ ���� -->
UPDATE book SET pubdate = sysdate;

<-- col �߰�: add -->
ALTER table book add(price number(7));
<-- col ����: drop column -->
ALTER table book drop column price;
<-- col�� ������ �� ��ȯ: modify -->
ALTER table book modify(price number(9,2)); -- �Ҽ� 2��° �ڸ����� ���

<-- ������ ���� -->
DELETE FROM book; -- roll back ���� (���̺� �����͸� ����, ������ ����)
TRUNCATE table book; -- auto commit (���̺� �����͸� ����, ������ ����)
DROP table book; -- auto commit (���̺� ��ü�� �����)

<-- �̸� ���� -->
rename book to book2;

-----------------------------------------------------------------------------------

-- sqlplus���� col book for a14�� �� �ʺ� ���� �� �ִ�.

DESC book;


/* ������ Insert �ϴ� ��� */
-- 1)
INSERT INTO book(bookno, title, author, pubdate)
            values( 1, 'java', 'ȫ�浿', sysdate );
COMMIT;

-- 2)
INSERT INTO book values( 2, 'sql', 'ȫ�浿', sysdate );

-- 3)
INSERT INTO book (bookno, title) values( 3, 'spring');

-- col ������� �ʰ� 3���� �����͸� ������ ������
INSERT INTO book values( 3, 'HTML', 'ȫ�浿');
-- NULL�� ó�����ָ� ���� �ذ�
INSERT INTO book values( 3, 'HTML', 'ȫ�浿', NULL);

select * from book where author is null;

ROLLBACK; -- ������ commit ��� ������ ��� (1, java�� ����)



-- ���� ��¥ ���Ŀ� ���� �ڵ����� ����ȯ�Ǿ� insert ��
INSERT INTO book values( 3, 'HTML', 'ȫ�浿', '2017/1/5');
INSERT INTO book values( 3, 'HTML', 'ȫ�浿', '17/1/5');

-- �� ��ȯ�� ������ ����
INSERT INTO book values( 3, 'HTML', 'ȫ�浿', '12/30/2017');
-- ������ ���� �����༭ �����ذ�
INSERT INTO book values( 3, 'HTML', 'ȫ�浿', to_date('12/30/2017', 'mm/dd/yyyy'));



/* ������ ���� */
delete �ع����� ��� �����Ͱ� �����ǹǷ� where���� ������ ������־����
-- pubdate �����Ͱ� ����ִ� �ุ ����
delete from book where pubdate is null;

delete from book where bookno = 3;



/* ������ ���� */
update book set pubdate = sysdate;
update book set pubdate = '20/1/1', title = '...';



/* Alter table: ���̺� ���� ���� ==> auto commit */

<-- col �߰�: add -->
alter table book add(price number(7));

desc book;

<-- col ����: drop column -->
alter table book drop column price;

<-- col�� ������ �� ��ȯ: modify -->
alter table book modify(price number(9,2)); -- �Ҽ� 2��° �ڸ����� ���

<-- modify�ϴ� ��� ������ ���̱� ���� ������ ���� null�� ������� �����Ѵ� -->
update book set price = null;




<-- price�� null�� ���� 0���� �ٲ���>
Update book set price = 0 where price is null;

INSERT INTO book values( 2, 'sql', 'ȫ�浿', sysdate, 900 );
INSERT INTO book values( 3, 'HTML', 'ȫ�浿', sysdate, 900.99 ); -- �ݿø� ó���Ǿ� ��� ����



/* ���� ��� */
DELETE FROM book; -- roll back ���� (���̺� �����͸� ����, ������ ����)
TRUNCATE table book; -- auto commit (���̺� �����͸� ����, ������ ����)
DROP table book; -- auto commit (���̺� ��ü�� �����)


-------------------------------------------------------------------------------------
/* ���� ���� ������ ���� */
select * from emp;
select * from dept;

-- ������ ���̺� ����
Create table emp2 as select * from emp;
Create table dept2 as select * from dept; -- �����͸� ����ǹǷ� ���� ����(pk, fk)�� ����

Insert into dept values(50, 'EDU', 'SEOUL');
Insert into dept2 values(50, 'EDU', 'SEOUL');

commit;

-- pk: unique, not null �����ؼ� ������
Insert into dept values(10, 'EDU', 'SEOUL');
Insert into dept values(Null, 'EDU', 'SEOUL');

-- pk ������ �ȵǾ� �־ ���� �ȳ�
Insert into dept2 values(10, 'EDU', 'SEOUL');
Insert into dept2 values(Null, 'EDU', 'SEOUL');

-- fk �������� �����ؼ� ���� ��
Insert into emp (empno, ename, hiredate, sal, deptno)
        values(999, 'ȫ�浿', sysdate, 0, 90);
Insert into emp2 (empno, ename, hiredate, sal, deptno)
        values(999, 'ȫ�浿', sysdate, 0, 90);





/* ���� ���� ���� */
CREATE TABLE book(
    bookno NUMBER(5) primary key, -- unique + not null, index ����
    title VARCHAR2(30) unique, -- index ����
    author VARCHAR2(30) not null,
    price number(7,2) check(price>0), -- price < 0�̸� üũ �ɼǿ� �ɸ�
    pubdate DATE default sysdate -- �� ���� ���ϸ� �⺻�� ��
);

-- Alter�� ���� ���� �߰�
Alter table add book constraint book_bookno_pk primary key(book_no);



<-- emp, dept ���� ���� ���� �ǽ�>
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

-- FK: emp2 ���̺� �ִ� deptno�� dept2 ���̺� �ִ� deptno�� ref
alter table emp2 add constraint emp2_deptno_fk foreign key(deptno) references dept2;
-- FK: emp2 ���̺� �ִ� mgr�� emp2 ���̺��� ref
alter table emp2 add constraint emp2_mgr_fk foreign key(mgr) references emp2;

-- ������ ��Ģ �����
alter table emp2 drop constraint emp2_deptno_fk;




/* ������ ������ ���� ������ ����Ͽ� �ܰ������� �����ؾ���*/

-- �̷��� �Ǹ� ������
delete from dept2 where deptno = 20;

-- �θ� �����Ǹ� �ڽĵ��� NULL�� ������ְ� DELECT �����ؾ���
Alter table emp2
add constraint emp2_deptno_fk
foreign key(deptno) references dept2 ON DELETE SET NULL; -- NULL�� ����
Delete from dept2 where deptno = 20;

-- CASCADE �ڽĵ� ���� ����
Alter table emp2
add constraint emp2_deptno_fk
foreign key(deptno) references dept2 ON DELETE CASCADE;
Delete from dept2 where deptno = 20;

SELECT * FROM DEPT2;
SELECT * FROM EMP2;




/* Ʈ������ */

-- �ڽ��� ���� �����ϰ� �θ� ����
drop table dept2 CASCADE CONSTRAINT purge;
create table dept2 as select * from dept;
delete from dept2 where deptno = 10;

-- ���� ������ ����� ��� ���ʿ��� commit�� ���־�� block�� ���� �ʴ´�




/* savepoint ���� */
delete from dept2 where deptno = 10;
savepoint aa1;
delete from dept2 where deptno = 20;
delete from dep2t where deptno = 30;

update dept2 set loc='....' where deptno = 10;
rollback to savepoint aa1;




/* drop table�� ���� �����뿡 �ִٸ� ���� ���� */
drop table emp;
select * from recyclebin;
FLASHBACK table emp2 to before drop;
purge recyclebin; -- ������ ����


