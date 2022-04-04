---2014 ~2015년 사이의 4개 회사 구매 데이터
SELECT COUNT(*) FROM PURPROD;
-- 고객 속성정보 : 28593030명
SELECT * FROM CUSTDEMO;
SELECT * FROM COMPET;
SELECT * FROM CHANNEL;
SELECT * FROM MEMBERSHIP;
SELECT * FROM PRODCL;
SELECT * FROM PURPROD;

--구매 분석 (매출 분석)
SELECT YEAR, ROUND(SUM(구매금액)/1000000) 총구매액, ROUND(AVG(구매금액)) 평균구매액
FROM PURPROD
GROUP BY YEAR;

--고객 속성
--성별, 연령별, 거주지별,

SELECT 




SELECT * FROM CUSTDEMO;
SELECT COUNT (*) FROM PURPROD;
SELECT * FROM PURPROD;

2014 ~2015년 사이의 4개 회사 구매 데이터

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR=substr(구매일자,1,4);
COMMIT;


CREATE TABLE PURBYYEAR AS
SELECT 고객번호, YEAR sum(구매금액) 구매액
FROM PURPROD
GROUP BY 고객번호, YEAR
ORDER BY 고객번호;




CREATE TABLE pur_amt AS
SELECT 고객번호 cusno, sum(구매금액) puramt
FROM PURPROD
GROUP BY 고객번호
ORDER BY 고객번호;

SELECT * FROM PRODCL WHERE 제휴사 = 'B';

SELECT * FROM PRODCL WHERE 제휴사 = 'A' AND 대분류코드 IN(4,5) ORDER BY 대분류코드;

SELECT * FROM PRODCL WHERE 제휴사 = 'B' AND 소분류명 LIKE '%행사%' ORDER BY 대분류코드;
SELECT * FROM PRODCL WHERE 제휴사 = 'A' AND 소분류명 LIKE '%행사%' ORDER BY 대분류코드;

select PURPROD.고객번호, 연령대 from custdemo
full outer join purprod
on custdemo.고객번호=purprod.고객번호;

CREATE TABLE PUR_AREA AS SELECT 거주지역, COUNT(CUSTDEMO.고객번호) 구매건수, SUM(구매금액) 구매총액 FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 거주지역;
SELECT * FROM PUR_AREA;

create table age_s as
select 연령대, count(purprod.고객번호) 구매건수, SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액" from purprod
full outer join custdemo
on custdemo.고객번호=purprod.고객번호
group by 연령대;
SELECT * FROM age_s;

create table age1_s as
select 연령대, count(purprod.고객번호) 구매건수, SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액" from purprod
full outer join custdemo
on custdemo.고객번호=purprod.고객번호
group by 연령대;
SELECT * FROM age1_s;

drop table age1_s;
drop table age_s;
drop table PUR_AREA;
---수업   
--- 프로젝트 

-- 거주지역
CREATE TABLE PUR_AREA AS SELECT 거주지역,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.고객번호 END) "14년구매건수", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.고객번호 END) "15년구매건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 거주지역;
SELECT * FROM PUR_AREA;

--연령대 건수비교
CREATE TABLE PUR_AREA1 AS SELECT 연령대,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.고객번호 END) "14년구매건수", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.고객번호 END) "15년구매건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 연령대;
SELECT * FROM PUR_AREA1;
drop table PUR_AREA1;

SELECT * FROM MEMBERSHIP;

-- 남현이 자료
CREATE TABLE PURBYYEAR2 AS
SELECT 고객번호,
COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "14년구매건수", 
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "15년구매건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액"
FROM PURPROD
GROUP BY 고객번호
ORDER BY 고객번호;
SELECT * FROM PURBYYEAR2;
SELECT * FROM PURBYYEAR2 WHERE "14년구매건수" > "15년구매건수";


--멤버십별
CREATE TABLE PUR_AREA3 AS SELECT membership.멤버십명,
COUNT(CASE WHEN YEAR=2014 THEN membership.고객번호 END) "14년가입건수", 
COUNT(CASE WHEN YEAR=2015 THEN membership.고객번호 END) "15년가입건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년가입총건",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년가입총건" FROM purprod
LEFT OUTER JOIN membership ON PURPROD.고객번호 = membership.고객번호
GROUP BY membership.멤버십명;
SELECT * FROM PUR_AREA3;
drop table PUR_AREA3;

-- 다둥이 건수는 증가 매출은 감소

SELECT * FROM PURPROD;

select *
from membership
where 멤버십명='다둥이';
-- 다둥이와  PURPROD 고객번호 일치 및 제휴사
select A.*,B.제휴사

from membership A, PURPROD B

where A.멤버십명='다둥이'

and A.고객번호 = B.고객번호
order by 제휴사;

select *
from membership
where 멤버십명='하이마트';
-- 경쟁사 이용건에 B가 더 더 경쟁사에 많이  쓴경우 
SELECT 제휴사, count(고객번호) FROM compet group by 제휴사 order by 제휴사;
-- A경쟁사 이용건  
SELECT 고객번호, count(case when 제휴사='A' then 고객번호 end) A경쟁사이용건
FROM compet group by 고객번호  order by 고객번호;
-- A 경쟁사 이용건 10개이상 
SELECT 고객번호, count(case when 제휴사='A' then 고객번호 end) A경쟁사이용건
FROM compet group by 고객번호 having count(case when 제휴사='A' then 고객번호 end) > 10 order by 고객번호;

--2015년에 b가 경쟁사 쓴 경우
SELECT 제휴사,count(case when year=2015 then 구매금액 end)from PURPROD group by 제휴사;

ALTER TABLE PURPROD ADD MONTH NUMBER;
UPDATE PURPROD SET MONTH = substr(구매일자,5,2);
COMMIT;
--멤버십 + 경쟁사?
SELECT 고객번호, 제휴사, count(고객번호) FROM COMPET group by 고객번호, 제휴사 order by 고객번호, 제휴사;

----A제휴사
SELECT 고객번호, count(CASE WHEN 제휴사='A' THEN 고객번호 END) A경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
----A제휴사, 10건이상
SELECT 고객번호, count(CASE WHEN 제휴사='A' THEN 고객번호 END) A경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='A' THEN 고객번호 END) > 10
order by 고객번호;
--경쟁사에서 밑에 고객번호를 가진 고객이 사용한 건 탐색
SELECT 고객번호 FROM MEMBERSHIP GROUP BY 고객번호 ORDER BY 고객번호;
--B 경쟁사 
SELECT 고객번호, count(CASE WHEN 제휴사='B' THEN 고객번호 END) B경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
--B 경쟁사 10건 (224건)  (15 = 23)
SELECT 고객번호, count(CASE WHEN 제휴사='B' THEN 고객번호 END) B경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='B' THEN 고객번호 END) > 15
order by 고객번호;

--C경쟁사 
SELECT 고객번호, count(CASE WHEN 제휴사='C' THEN 고객번호 END) C경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
--c경정새 10 초과 =78건  (5 = 266건)  
SELECT 고객번호, count(CASE WHEN 제휴사='C' THEN 고객번호 END) C경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='C' THEN 고객번호 END) > 10
order by 고객번호;
-- D 경쟁사 
SELECT 고객번호, count(CASE WHEN 제휴사='D' THEN 고객번호 END) D경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
--D 경쟁사 10 = 12  (5 = 102건)
SELECT 고객번호, count(CASE WHEN 제휴사='D' THEN 고객번호 END) D경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='D' THEN 고객번호 END) > 5
order by 고객번호;


--임포트
SELECT 상품분류, COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD, PRODCL2 WHERE PURPROD.소분류코드 = PRODCL2.소분류코드
GROUP BY 상품분류;