---2014 ~2015�� ������ 4�� ȸ�� ���� ������
SELECT COUNT(*) FROM PURPROD;
-- �� �Ӽ����� : 28593030��
SELECT * FROM CUSTDEMO;
SELECT * FROM COMPET;
SELECT * FROM CHANNEL;
SELECT * FROM MEMBERSHIP;
SELECT * FROM PRODCL;
SELECT * FROM PURPROD;

--���� �м� (���� �м�)
SELECT YEAR, ROUND(SUM(���űݾ�)/1000000) �ѱ��ž�, ROUND(AVG(���űݾ�)) ��ձ��ž�
FROM PURPROD
GROUP BY YEAR;

--�� �Ӽ�
--����, ���ɺ�, ��������,

SELECT 




SELECT * FROM CUSTDEMO;
SELECT COUNT (*) FROM PURPROD;
SELECT * FROM PURPROD;

2014 ~2015�� ������ 4�� ȸ�� ���� ������

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR=substr(��������,1,4);
COMMIT;


CREATE TABLE PURBYYEAR AS
SELECT ����ȣ, YEAR sum(���űݾ�) ���ž�
FROM PURPROD
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ;




CREATE TABLE pur_amt AS
SELECT ����ȣ cusno, sum(���űݾ�) puramt
FROM PURPROD
GROUP BY ����ȣ
ORDER BY ����ȣ;

SELECT * FROM PRODCL WHERE ���޻� = 'B';

SELECT * FROM PRODCL WHERE ���޻� = 'A' AND ��з��ڵ� IN(4,5) ORDER BY ��з��ڵ�;

SELECT * FROM PRODCL WHERE ���޻� = 'B' AND �Һз��� LIKE '%���%' ORDER BY ��з��ڵ�;
SELECT * FROM PRODCL WHERE ���޻� = 'A' AND �Һз��� LIKE '%���%' ORDER BY ��з��ڵ�;

select PURPROD.����ȣ, ���ɴ� from custdemo
full outer join purprod
on custdemo.����ȣ=purprod.����ȣ;

CREATE TABLE PUR_AREA AS SELECT ��������, COUNT(CUSTDEMO.����ȣ) ���ŰǼ�, SUM(���űݾ�) �����Ѿ� FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ��������;
SELECT * FROM PUR_AREA;

create table age_s as
select ���ɴ�, count(purprod.����ȣ) ���ŰǼ�, SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" from purprod
full outer join custdemo
on custdemo.����ȣ=purprod.����ȣ
group by ���ɴ�;
SELECT * FROM age_s;

create table age1_s as
select ���ɴ�, count(purprod.����ȣ) ���ŰǼ�, SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�" from purprod
full outer join custdemo
on custdemo.����ȣ=purprod.����ȣ
group by ���ɴ�;
SELECT * FROM age1_s;

drop table age1_s;
drop table age_s;
drop table PUR_AREA;
---����   
--- ������Ʈ 

-- ��������
CREATE TABLE PUR_AREA AS SELECT ��������,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.����ȣ END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ��������;
SELECT * FROM PUR_AREA;

--���ɴ� �Ǽ���
CREATE TABLE PUR_AREA1 AS SELECT ���ɴ�,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.����ȣ END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ���ɴ�;
SELECT * FROM PUR_AREA1;
drop table PUR_AREA1;

SELECT * FROM MEMBERSHIP;

-- ������ �ڷ�
CREATE TABLE PURBYYEAR2 AS
SELECT ����ȣ,
COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�"
FROM PURPROD
GROUP BY ����ȣ
ORDER BY ����ȣ;
SELECT * FROM PURBYYEAR2;
SELECT * FROM PURBYYEAR2 WHERE "14�ⱸ�ŰǼ�" > "15�ⱸ�ŰǼ�";


--����ʺ�
CREATE TABLE PUR_AREA3 AS SELECT membership.����ʸ�,
COUNT(CASE WHEN YEAR=2014 THEN membership.����ȣ END) "14�Ⱑ�԰Ǽ�", 
COUNT(CASE WHEN YEAR=2015 THEN membership.����ȣ END) "15�Ⱑ�԰Ǽ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�Ⱑ���Ѱ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�Ⱑ���Ѱ�" FROM purprod
LEFT OUTER JOIN membership ON PURPROD.����ȣ = membership.����ȣ
GROUP BY membership.����ʸ�;
SELECT * FROM PUR_AREA3;
drop table PUR_AREA3;

-- �ٵ��� �Ǽ��� ���� ������ ����

SELECT * FROM PURPROD;

select *
from membership
where ����ʸ�='�ٵ���';
-- �ٵ��̿�  PURPROD ����ȣ ��ġ �� ���޻�
select A.*,B.���޻�

from membership A, PURPROD B

where A.����ʸ�='�ٵ���'

and A.����ȣ = B.����ȣ
order by ���޻�;

select *
from membership
where ����ʸ�='���̸�Ʈ';
-- ����� �̿�ǿ� B�� �� �� ����翡 ����  ����� 
SELECT ���޻�, count(����ȣ) FROM compet group by ���޻� order by ���޻�;
-- A����� �̿��  
SELECT ����ȣ, count(case when ���޻�='A' then ����ȣ end) A������̿��
FROM compet group by ����ȣ  order by ����ȣ;
-- A ����� �̿�� 10���̻� 
SELECT ����ȣ, count(case when ���޻�='A' then ����ȣ end) A������̿��
FROM compet group by ����ȣ having count(case when ���޻�='A' then ����ȣ end) > 10 order by ����ȣ;

--2015�⿡ b�� ����� �� ���
SELECT ���޻�,count(case when year=2015 then ���űݾ� end)from PURPROD group by ���޻�;

ALTER TABLE PURPROD ADD MONTH NUMBER;
UPDATE PURPROD SET MONTH = substr(��������,5,2);
COMMIT;
--����� + �����?
SELECT ����ȣ, ���޻�, count(����ȣ) FROM COMPET group by ����ȣ, ���޻� order by ����ȣ, ���޻�;

----A���޻�
SELECT ����ȣ, count(CASE WHEN ���޻�='A' THEN ����ȣ END) A������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
----A���޻�, 10���̻�
SELECT ����ȣ, count(CASE WHEN ���޻�='A' THEN ����ȣ END) A������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='A' THEN ����ȣ END) > 10
order by ����ȣ;
--����翡�� �ؿ� ����ȣ�� ���� ���� ����� �� Ž��
SELECT ����ȣ FROM MEMBERSHIP GROUP BY ����ȣ ORDER BY ����ȣ;
--B ����� 
SELECT ����ȣ, count(CASE WHEN ���޻�='B' THEN ����ȣ END) B������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
--B ����� 10�� (224��)  (15 = 23)
SELECT ����ȣ, count(CASE WHEN ���޻�='B' THEN ����ȣ END) B������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='B' THEN ����ȣ END) > 15
order by ����ȣ;

--C����� 
SELECT ����ȣ, count(CASE WHEN ���޻�='C' THEN ����ȣ END) C������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
--c������ 10 �ʰ� =78��  (5 = 266��)  
SELECT ����ȣ, count(CASE WHEN ���޻�='C' THEN ����ȣ END) C������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='C' THEN ����ȣ END) > 10
order by ����ȣ;
-- D ����� 
SELECT ����ȣ, count(CASE WHEN ���޻�='D' THEN ����ȣ END) D������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
--D ����� 10 = 12  (5 = 102��)
SELECT ����ȣ, count(CASE WHEN ���޻�='D' THEN ����ȣ END) D������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='D' THEN ����ȣ END) > 5
order by ����ȣ;


--����Ʈ
SELECT ��ǰ�з�, COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.�Һз��ڵ� = PRODCL2.�Һз��ڵ�
GROUP BY ��ǰ�з�;