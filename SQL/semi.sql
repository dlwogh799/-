SELECT * FROM PRODCL WHERE ���޻� = 'A' AND ��з��ڵ� IN(4,5) ORDER BY ��з��ڵ�;
SELECT * FROM PRODCL WHERE ���޻� = 'B' ORDER BY ��з��ڵ�;
SELECT * FROM PRODCL WHERE ���޻� = 'C' ORDER BY ��з��ڵ�;
SELECT * FROM PRODCL WHERE ���޻� = 'D' ORDER BY ��з��ڵ�;
SELECT * FROM PRODCL WHERE ���޻� = 'A' AND �Һз��� LIKE '%���%' ORDER BY ��з��ڵ�;
SELECT * FROM PRODCL;
SELECT * FROM CHANNEL;
SELECT * FROM PURPROD where �Һз��ڵ� = 'A060168';
SELECT * FROM CUSTDEMO;
SELECT ��������, COUNT(*) �ο��� FROM CUSTDEMO GROUP BY ��������;

SELECT * FROM COMPET;

-- 2015�� B���޻� ���Ű��� A�� 2.4��, C�� 1.4����
SELECT ���޻�, COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) FROM PURPROD GROUP BY ���޻�;
-- 2015�� ����� �̿�Ǽ��� ����, B���޻簡 A�� 2.1��� ���, ������ C�� 2.6���� ������ ����
-- C ���޻簡 �ſ� ������ �ְų� A���޻簡 �ſ� ����� ������ �ؼ��� �� ����.
SELECT ���޻�, count(����ȣ) FROM COMPET group by ���޻� order by ���޻�;

--����� + �����?
SELECT ����ȣ, ���޻�, count(����ȣ) FROM COMPET group by ����ȣ, ���޻� order by ����ȣ, ���޻�;

----A���޻�
SELECT ����ȣ, count(CASE WHEN ���޻�='A' THEN ����ȣ END) A������̿�Ǽ� FROM COMPET group by ����ȣ
order by ����ȣ;
----A���޻�, 10���̻�
SELECT ����ȣ, count(CASE WHEN ���޻�='A' THEN ����ȣ END) A������̿�Ǽ� FROM COMPET group by ����ȣ
HAVING count(CASE WHEN ���޻�='A' THEN ����ȣ END) > 10
order by ����ȣ;
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

--����� �ִ� ����ȣ..?
SELECT ����ȣ FROM MEMBERSHIP GROUP BY ����ȣ ORDER BY ����ȣ;

--SELECT CUSTDEMO.����ȣ FROM CUSTDEMO, WHERE ����ʸ� = '���̸�Ʈ' ORDER BY ����ȣ;

--������ ���ŷ�, ���űݾ� ��ȭ
CREATE TABLE PUR_AREA AS SELECT ��������,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.����ȣ END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ��������
ORDER BY ��������;
COMMIT;

SELECT * FROM PUR_AREA;

SELECT * FROM PUR_AREA where "14�ⱸ���Ѿ�" > "15�ⱸ���Ѿ�";

--DROP TABLE PUR_AREA;

--14�� ��� ����Ƚ���� 1.5�� �̻� ������ ���
CREATE TABLE PURBYYEAR2 AS
SELECT ����ȣ,
COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "14�ⱸ�ŰǼ�",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�"
FROM PURPROD
GROUP BY ����ȣ
ORDER BY ����ȣ;

select * from prodcl where ���޻� = 'B';

SELECT * FROM PURBYYEAR2;
SELECT * FROM PURBYYEAR2 WHERE "14�ⱸ�ŰǼ�" > "15�ⱸ�ŰǼ�";


SELECT * FROM PURBYYEAR2 WHERE "14�ⱸ�ŰǼ�" * 1.5 < "15�ⱸ�ŰǼ�";

-- ä�� �̿�Ƚ���� ��� �̻��� ���� ����
SELECT * FROM CHANNEL WHERE �̿�Ƚ�� > (SELECT AVG(�̿�Ƚ��) FROM CHANNEL);
SELECT PURBYYEAR2.����ȣ,���޻�,�̿�Ƚ�� FROM CHANNEL, PURBYYEAR2 WHERE CHANNEL.����ȣ = PURBYYEAR2.����ȣ;

--ä�κ�
CREATE TABLE PUR_CHANNEL AS SELECT channel.���޻�,
COUNT(CASE WHEN YEAR=2014 THEN channel.����ȣ END) "14�ⱸ�ŰǼ�",
COUNT(CASE WHEN YEAR=2015 THEN channel.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM purprod
LEFT OUTER JOIN channel ON PURPROD.����ȣ = channel.����ȣ
GROUP BY channel.���޻�;

select * from pur_CHANNEL
order by ���޻�;

--���� ���ŰǼ�, ���űݾ�
CREATE TABLE PUR_MONTH AS SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD GROUP BY MONTH ORDER BY MONTH;

SELECT * FROM PUR_MONTH;

COMMIT;

--��ǰ��
SELECT ��ǰ�з�, COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD, PRODCL WHERE PURPROD.�Һз��ڵ� = PRODCL.�Һз��ڵ�
GROUP BY ��ǰ�з�;

SELECT ��ǰ�з�, �Һ���з�, COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015"
FROM PURPROD, PRODCL WHERE PURPROD.�Һз��ڵ� = PRODCL.�Һз��ڵ�
GROUP BY ��ǰ�з�, �Һ���з�;

SELECT �Һ���з�, COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD, PRODCL WHERE PURPROD.�Һз��ڵ� = PRODCL.�Һз��ڵ�
GROUP BY �Һ���з�;

CREATE TABLE PRODCL2 AS SELECT ���޻�, ��з��ڵ�, �ߺз��ڵ�, �Һз��ڵ�, �ߺз���, �Һз���, ��ǰ�з� FROM PRODCL;

--
SELECT a.���޻� ���޻�, a.��������ȣ ��������ȣ, a.��з��ڵ� ��з��ڵ�, a.�ߺз��ڵ� �ߺз��ڵ�, b.����з�, a.����ȣ ����ȣ, a.�����ڵ� �����ڵ�, a.�������� ��������, a.YEAR YEAR, a.���Žð� ���Žð�, a.���űݾ� ���űݾ� FROM purprod a FULL OUTER JOIN prodcl b ON a.�Һз��ڵ�=b.�Һз��ڵ� ORDER BY ����ȣ;

--������

---------------------------------------------------------------------------------------------



--Ž����
SELECT ��ǰ�з�, COUNT(�Һз��ڵ�) FROM PRODCL GROUP BY ��ǰ�з�;

SELECT COUNT(���űݾ�) FROM PURPROD WHERE ��ǰ�з� = '����' GROUP BY ��ǰ�з�;
select * from PRODCL;
SELECT * FROM CUSTDEMO;

-- �Һ���з��� �Ǽ��� �Ѿ� ���� Ȯ��
select �Һ���з�,
count(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "���ŰǼ�_2014",
count(CASE WHEN YEAR = '2015' THEN ���űݾ� END) "���ŰǼ�_2015",
SUM(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "�����Ѿ�_2014",
SUM(CASE WHEN YEAR = '2015' THEN ���űݾ� END) "�����Ѿ�_2015"
from PURPROD, PRODCL
WHERE PURPROD.�Һз��ڵ� = PRODCL.�Һз��ڵ�
group by �Һ���з�;

--�Һ��� ���� ���ŰǼ�, �����Ѿ� (�̿�)
SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD GROUP BY MONTH ORDER BY MONTH;

select �Һ���з�,
count(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "���ŰǼ�_2014",
count(CASE WHEN YEAR = '2015' THEN ���űݾ� END) "���ŰǼ�_2015",
SUM(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "�����Ѿ�_2014",
SUM(CASE WHEN YEAR = '2015' THEN ���űݾ� END) "�����Ѿ�_2015"
from PURPROD, PRODCL
WHERE PURPROD.�Һз��ڵ� = PRODCL.�Һз��ڵ�
group by �Һ���з�;

SELECT * FROM CUSTDEMO;
--���޻纰 �� Ÿ��?
-- A 30~60��, �� Ÿ���� 35�� �̻�..?
SELECT ���ɴ�,  COUNT(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "���ŰǼ�",
SUM(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "�����Ѿ�"
FROM PURPROD, CUSTDEMO
WHERE ���޻� = 'A' AND PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ���ɴ� ORDER BY �����Ѿ�;
-- B 35~55��
SELECT ���ɴ�,  COUNT(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "���ŰǼ�",
SUM(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "�����Ѿ�"
FROM PURPROD, CUSTDEMO
WHERE ���޻� = 'B' AND PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ���ɴ� ORDER BY �����Ѿ�;
-- C 35~55��
SELECT ���ɴ�,  COUNT(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "���ŰǼ�",
SUM(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "�����Ѿ�"
FROM PURPROD, CUSTDEMO
WHERE ���޻� = 'C' AND PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ���ɴ� ORDER BY �����Ѿ�;
-- D 20~35��
SELECT ���ɴ�,  COUNT(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "���ŰǼ�",
SUM(CASE WHEN YEAR = '2014' THEN ���űݾ� END) "�����Ѿ�"
FROM PURPROD, CUSTDEMO
WHERE ���޻� = 'D' AND PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ���ɴ� ORDER BY �����Ѿ�;

-- ���Ұ� Ư��
SELECT * FROM PURBYYEAR2;
SELECT ����ȣ FROM PURBYYEAR2 WHERE "14�ⱸ���Ѿ�" * 0.8 > "15�ⱸ���Ѿ�";
SELECT ���ɴ�, COUNT(����ȣ) ���� FROM CUSTDEMO WHERE ����ȣ IN (SELECT ����ȣ FROM PURBYYEAR2 WHERE "14�ⱸ���Ѿ�" * 0.8 > "15�ⱸ���Ѿ�")
GROUP BY ���ɴ� ORDER BY ���� DESC;

SELECT ����з�, COUNT(����з�) ���� FROM PRODCL GROUP BY ����з� ORDER BY ���� DESC;

SELECT �Һз���, ����з� FROM PRODCL WHERE ����з� = '��Ȱ';
SELECT �Һз���, ����з� FROM PRODCL WHERE ����з� = '��ȭ';
SELECT �Һз���, ����з� FROM PRODCL WHERE ����з� = '��ȭ';

---------------------------------------------------------------------------

CREATE TABLE PURBYYEAR2 AS select ����ȣ, 
sum(case when year=2014 then ���űݾ� end) "14�� ����",
sum(case when year=2015 then ���űݾ� end) "15�� ����",
sum(���űݾ�) "�� ����",
round(SUM(CASE WHEN year=2015 THEN ���űݾ� END)/SUM(CASE WHEN year=2014 THEN ���űݾ� END),2) "���� ������",
count(case when year=2014 then 1 else null end) as "14�� ���ŰǼ�",
count(case when year=2015 then 1 else null end) as "15�� ���ŰǼ�",
count(*) as "�� ���ŰǼ�"
from PURPROD group by ����ȣ order by ����ȣ;

--------------------------------------------------------------------------

SELECT * FROM PURBYYEAR2;
SELECT * FROM CUSTDEMO;
SELECT * FROM PURPROD;

--���Ű��Ұ��� ���ɴ뺰 �� �ľ�
--35��~50�� �� �ַ� ����.
SELECT ���ɴ�, COUNT(PURBYYEAR2.����ȣ) ��� FROM CUSTDEMO, PURBYYEAR2
WHERE CUSTDEMO.����ȣ = PURBYYEAR2.����ȣ
GROUP BY ���ɴ�;

SELECT ���ɴ�, COUNT(CASE WHEN "���� ������" < 1 THEN PURBYYEAR2.����ȣ END) ��� FROM CUSTDEMO, PURBYYEAR2
WHERE CUSTDEMO.����ȣ = PURBYYEAR2.����ȣ
GROUP BY ���ɴ�
ORDER BY ��� DESC;

-- ���ڵ�� ���ÿ����� �߸��� �ڵ���
SELECT ���ɴ�, COUNT(CASE WHEN "���� ������" < 1 THEN PURBYYEAR2.����ȣ END) ��� FROM CUSTDEMO, PURBYYEAR2
WHERE PURPROD.����ȣ IN (SELECT ����ȣ FROM CUSTDEMO WHERE ���ɴ� = '60���̻�')
GROUP BY ���ɴ�
ORDER BY ��� DESC;
