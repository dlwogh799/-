SELECT * FROM PRODCL;
SELECT * FROM PURPROD;
select *from prodcl;
select * from purprod;
select * from s_pur_copy;
SELECT * FROM CUSTDEMO;
SELECT * FROM COMPET;
SELECT * FROM CHANNEL;
SELECT * FROM MEMBERSHIP;

select *
from  s_pur_copy;
where ���޻�='C';
-- ���޻� A  1�� ~~6��
select ����ȣ, ���űݾ�
from  s_pur_copy.order by ����ȣ
where ��������  <20150701 and ���޻�='A';

select count(����ȣ)
from  s_pur_copy
where ��������  <20150701 and ���޻�='A';

select ����ȣ, count(��������ȣ)
from  s_pur_copy group by ����ȣ order by ����ȣ;

select count(��������ȣ)
from  s_pur_copy;

select ����ȣ, ���űݾ�
from  s_pur_copy
where ��������  <20150701 and ���޻�='B';

select count(��������ȣ)
from  s_pur_copy
where ��������  <20150701 and ���޻�='B';

select count(��������ȣ)
from  s_pur_copy
where ��������  <20150701 and ���޻�='C';

select count(��������ȣ)
from  s_pur_copy
where ��������  <20150701 and ���޻�='D';
drop table price;
select ����ȣ,sum(���űݾ�) from  s_pur_copy where ���޻�='A' group by ����ȣ order by ����ȣ;
---  A���޻縦 1~6����� �� ���� �� ���űݾ��� ���κ���
create table price as select ����ȣ ����ȣ,count(��������ȣ) ��������ȣ from  s_pur_copy where ���޻�='A' and ��������  <20150701 group by ����ȣ order by ����ȣ;
select ����ȣ ����ȣ,count(��������ȣ) ��������ȣ from  s_pur_copy where ���޻�='B' and ��������  <20150701 group by ����ȣ order by ����ȣ;
select * from price;
SELECT count(����ȣ)
FROM   price;

--��cp
select count(����ȣ) from price;
drop table price1;
----B
create table price1 as select ����ȣ ����ȣ,sum(���űݾ�) ���űݾ� from  s_pur_copy where ���޻�='B' and ��������  <20150701 group by ����ȣ order by ����ȣ;
select * from price1;
-- B ��ü 
select sum(���űݾ�) from price1;
select count(����ȣ) from price1;
select count(����ȣ) from price1;
--C
create table price2 as select ����ȣ ����ȣ,sum(���űݾ�) ���űݾ� from  s_pur_copy where ���޻�='C' and ��������  <20150701 group by ����ȣ order by ����ȣ;
select * from price2;

- c ��ü
select count(����ȣ) from price2;
--D
create table price3 as select ����ȣ ����ȣ,sum(���űݾ�) ���űݾ� from  s_pur_copy where ���޻�='D' and ��������  <20150701 group by ����ȣ order by ����ȣ;
select * from price3;
--D
select count(����ȣ) from price3;