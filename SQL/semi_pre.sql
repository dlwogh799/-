-- �� ���õ��߼�������(5��) �߰����� ��

--��ǰ�� �м���
---- ����: ������
------ ����: �����

SELECT * FROM PRODCL2;
--�� �ð��� ������ �ǹ��ִ� �λ���Ʈ ������ �������
--�� �߰� �۾��� �ʿ��ϰ�, ��������

--���� �м���
---- ����: ������
------ ����: ����ȣ, ������
SELECT * FROM CUSTDEMO;

--�ܼ��� (���ǹ�)
CREATE TABLE PUR_GENDER AS SELECT ����,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.����ȣ END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ����;

SELECT * FROM PUR_GENDER;
SELECT * FROM PUR_GENDER where "14�ⱸ���Ѿ�" > "15�ⱸ���Ѿ�";

--�ܿ��ɴ�
CREATE TABLE PUR_AGE AS SELECT ���ɴ�,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.����ȣ END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ���ɴ�;

SELECT * FROM PUR_AGE;
SELECT * FROM PUR_AGE where "14�ⱸ���Ѿ�" > "15�ⱸ���Ѿ�";

--��������
CREATE TABLE PUR_AREA AS SELECT ��������,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.����ȣ END) "14�ⱸ�ŰǼ�", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.����ȣ END) "15�ⱸ�ŰǼ�",
SUM(CASE WHEN year=2014 THEN ���űݾ� END) "14�ⱸ���Ѿ�",
SUM(CASE WHEN year=2015 THEN ���űݾ� END) "15�ⱸ���Ѿ�" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.����ȣ = CUSTDEMO.����ȣ
GROUP BY ��������
ORDER BY ��������;

SELECT * FROM PUR_AREA;
SELECT * FROM PUR_AREA where "14�ⱸ���Ѿ�" > "15�ⱸ���Ѿ�";

--�ܿ���
CREATE TABLE PUR_MONTH AS SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN ���űݾ� END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN ���űݾ� END) "PP2015"
FROM PURPROD GROUP BY MONTH ORDER BY MONTH;
commit;

SELECT * FROM PUR_MONTH;