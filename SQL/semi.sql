SELECT * FROM PRODCL WHERE 제휴사 = 'A' AND 대분류코드 IN(4,5) ORDER BY 대분류코드;
SELECT * FROM PRODCL WHERE 제휴사 = 'B' ORDER BY 대분류코드;
SELECT * FROM PRODCL WHERE 제휴사 = 'C' ORDER BY 대분류코드;
SELECT * FROM PRODCL WHERE 제휴사 = 'D' ORDER BY 대분류코드;
SELECT * FROM PRODCL WHERE 제휴사 = 'A' AND 소분류명 LIKE '%행사%' ORDER BY 대분류코드;
SELECT * FROM PRODCL;
SELECT * FROM CHANNEL;
SELECT * FROM PURPROD where 소분류코드 = 'A060168';
SELECT * FROM CUSTDEMO;
SELECT 거주지역, COUNT(*) 인원수 FROM CUSTDEMO GROUP BY 거주지역;

SELECT * FROM COMPET;

-- 2015년 B제휴사 구매건이 A의 2.4배, C의 1.4배임
SELECT 제휴사, COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) FROM PURPROD GROUP BY 제휴사;
-- 2015년 경쟁사 이용건수를 보면, B제휴사가 A의 2.1배로 비슷, 하지만 C는 2.6배인 것으로 보아
-- C 제휴사가 매우 강점이 있거나 A제휴사가 매우 취약한 것으로 해석할 수 있음.
SELECT 제휴사, count(고객번호) FROM COMPET group by 제휴사 order by 제휴사;

--멤버십 + 경쟁사?
SELECT 고객번호, 제휴사, count(고객번호) FROM COMPET group by 고객번호, 제휴사 order by 고객번호, 제휴사;

----A제휴사
SELECT 고객번호, count(CASE WHEN 제휴사='A' THEN 고객번호 END) A경쟁사이용건수 FROM COMPET group by 고객번호
order by 고객번호;
----A제휴사, 10건이상
SELECT 고객번호, count(CASE WHEN 제휴사='A' THEN 고객번호 END) A경쟁사이용건수 FROM COMPET group by 고객번호
HAVING count(CASE WHEN 제휴사='A' THEN 고객번호 END) > 10
order by 고객번호;
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

--멤버십 있는 고객번호..?
SELECT 고객번호 FROM MEMBERSHIP GROUP BY 고객번호 ORDER BY 고객번호;

--SELECT CUSTDEMO.고객번호 FROM CUSTDEMO, WHERE 멤버십명 = '하이마트' ORDER BY 고객번호;

--지역별 구매량, 구매금액 변화
CREATE TABLE PUR_AREA AS SELECT 거주지역,
COUNT(CASE WHEN YEAR=2014 THEN CUSTDEMO.고객번호 END) "14년구매건수", 
COUNT(CASE WHEN YEAR=2015 THEN CUSTDEMO.고객번호 END) "15년구매건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액" FROM PURPROD
LEFT OUTER JOIN CUSTDEMO ON PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 거주지역
ORDER BY 거주지역;
COMMIT;

SELECT * FROM PUR_AREA;

SELECT * FROM PUR_AREA where "14년구매총액" > "15년구매총액";

--DROP TABLE PUR_AREA;

--14년 대비 구매횟수가 1.5배 이상 증가한 경우
CREATE TABLE PURBYYEAR2 AS
SELECT 고객번호,
COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "14년구매건수",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "15년구매건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액"
FROM PURPROD
GROUP BY 고객번호
ORDER BY 고객번호;

select * from prodcl where 제휴사 = 'B';

SELECT * FROM PURBYYEAR2;
SELECT * FROM PURBYYEAR2 WHERE "14년구매건수" > "15년구매건수";


SELECT * FROM PURBYYEAR2 WHERE "14년구매건수" * 1.5 < "15년구매건수";

-- 채널 이용횟수가 평균 이상인 고객들 집합
SELECT * FROM CHANNEL WHERE 이용횟수 > (SELECT AVG(이용횟수) FROM CHANNEL);
SELECT PURBYYEAR2.고객번호,제휴사,이용횟수 FROM CHANNEL, PURBYYEAR2 WHERE CHANNEL.고객번호 = PURBYYEAR2.고객번호;

--채널별
CREATE TABLE PUR_CHANNEL AS SELECT channel.제휴사,
COUNT(CASE WHEN YEAR=2014 THEN channel.고객번호 END) "14년구매건수",
COUNT(CASE WHEN YEAR=2015 THEN channel.고객번호 END) "15년구매건수",
SUM(CASE WHEN year=2014 THEN 구매금액 END) "14년구매총액",
SUM(CASE WHEN year=2015 THEN 구매금액 END) "15년구매총액" FROM purprod
LEFT OUTER JOIN channel ON PURPROD.고객번호 = channel.고객번호
GROUP BY channel.제휴사;

select * from pur_CHANNEL
order by 제휴사;

--월별 구매건수, 구매금액
CREATE TABLE PUR_MONTH AS SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD GROUP BY MONTH ORDER BY MONTH;

SELECT * FROM PUR_MONTH;

COMMIT;

--상품별
SELECT 상품분류, COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD, PRODCL WHERE PURPROD.소분류코드 = PRODCL.소분류코드
GROUP BY 상품분류;

SELECT 상품분류, 소비재분류, COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015"
FROM PURPROD, PRODCL WHERE PURPROD.소분류코드 = PRODCL.소분류코드
GROUP BY 상품분류, 소비재분류;

SELECT 소비재분류, COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD, PRODCL WHERE PURPROD.소분류코드 = PRODCL.소분류코드
GROUP BY 소비재분류;

CREATE TABLE PRODCL2 AS SELECT 제휴사, 대분류코드, 중분류코드, 소분류코드, 중분류명, 소분류명, 상품분류 FROM PRODCL;

--
SELECT a.제휴사 제휴사, a.영수증번호 영수증번호, a.대분류코드 대분류코드, a.중분류코드 중분류코드, b.공통분류, a.고객번호 고객번호, a.점포코드 점포코드, a.구매일자 구매일자, a.YEAR YEAR, a.구매시간 구매시간, a.구매금액 구매금액 FROM purprod a FULL OUTER JOIN prodcl b ON a.소분류코드=b.소분류코드 ORDER BY 고객번호;

--점포별

---------------------------------------------------------------------------------------------



--탐색용
SELECT 상품분류, COUNT(소분류코드) FROM PRODCL GROUP BY 상품분류;

SELECT COUNT(구매금액) FROM PURPROD WHERE 상품분류 = '웨딩' GROUP BY 상품분류;
select * from PRODCL;
SELECT * FROM CUSTDEMO;

-- 소비재분류별 건수와 총액 추이 확인
select 소비재분류,
count(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매건수_2014",
count(CASE WHEN YEAR = '2015' THEN 구매금액 END) "구매건수_2015",
SUM(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매총액_2014",
SUM(CASE WHEN YEAR = '2015' THEN 구매금액 END) "구매총액_2015"
from PURPROD, PRODCL
WHERE PURPROD.소분류코드 = PRODCL.소분류코드
group by 소비재분류;

--소비재 월별 구매건수, 구매총액 (미완)
SELECT MONTH,
COUNT(CASE WHEN YEAR=2014 THEN 구매금액 END) "PN2014",
COUNT(CASE WHEN YEAR=2015 THEN 구매금액 END) "PN2015",
SUM(CASE WHEN YEAR=2014 THEN 구매금액 END) "PP2014",
SUM(CASE WHEN YEAR=2015 THEN 구매금액 END) "PP2015"
FROM PURPROD GROUP BY MONTH ORDER BY MONTH;

select 소비재분류,
count(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매건수_2014",
count(CASE WHEN YEAR = '2015' THEN 구매금액 END) "구매건수_2015",
SUM(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매총액_2014",
SUM(CASE WHEN YEAR = '2015' THEN 구매금액 END) "구매총액_2015"
from PURPROD, PRODCL
WHERE PURPROD.소분류코드 = PRODCL.소분류코드
group by 소비재분류;

SELECT * FROM CUSTDEMO;
--제휴사별 주 타겟?
-- A 30~60세, 주 타겟은 35세 이상..?
SELECT 연령대,  COUNT(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매건수",
SUM(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매총액"
FROM PURPROD, CUSTDEMO
WHERE 제휴사 = 'A' AND PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 연령대 ORDER BY 구매총액;
-- B 35~55세
SELECT 연령대,  COUNT(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매건수",
SUM(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매총액"
FROM PURPROD, CUSTDEMO
WHERE 제휴사 = 'B' AND PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 연령대 ORDER BY 구매총액;
-- C 35~55세
SELECT 연령대,  COUNT(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매건수",
SUM(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매총액"
FROM PURPROD, CUSTDEMO
WHERE 제휴사 = 'C' AND PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 연령대 ORDER BY 구매총액;
-- D 20~35세
SELECT 연령대,  COUNT(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매건수",
SUM(CASE WHEN YEAR = '2014' THEN 구매금액 END) "구매총액"
FROM PURPROD, CUSTDEMO
WHERE 제휴사 = 'D' AND PURPROD.고객번호 = CUSTDEMO.고객번호
GROUP BY 연령대 ORDER BY 구매총액;

-- 감소고객 특성
SELECT * FROM PURBYYEAR2;
SELECT 고객번호 FROM PURBYYEAR2 WHERE "14년구매총액" * 0.8 > "15년구매총액";
SELECT 연령대, COUNT(고객번호) 고객수 FROM CUSTDEMO WHERE 고객번호 IN (SELECT 고객번호 FROM PURBYYEAR2 WHERE "14년구매총액" * 0.8 > "15년구매총액")
GROUP BY 연령대 ORDER BY 고객수 DESC;

SELECT 공통분류, COUNT(공통분류) 개수 FROM PRODCL GROUP BY 공통분류 ORDER BY 개수 DESC;

SELECT 소분류명, 공통분류 FROM PRODCL WHERE 공통분류 = '생활';
SELECT 소분류명, 공통분류 FROM PRODCL WHERE 공통분류 = '문화';
SELECT 소분류명, 공통분류 FROM PRODCL WHERE 공통분류 = '잡화';

---------------------------------------------------------------------------

CREATE TABLE PURBYYEAR2 AS select 고객번호, 
sum(case when year=2014 then 구매금액 end) "14년 매출",
sum(case when year=2015 then 구매금액 end) "15년 매출",
sum(구매금액) "총 매출",
round(SUM(CASE WHEN year=2015 THEN 구매금액 END)/SUM(CASE WHEN year=2014 THEN 구매금액 END),2) "매출 신장율",
count(case when year=2014 then 1 else null end) as "14년 구매건수",
count(case when year=2015 then 1 else null end) as "15년 구매건수",
count(*) as "총 구매건수"
from PURPROD group by 고객번호 order by 고객번호;

--------------------------------------------------------------------------

SELECT * FROM PURBYYEAR2;
SELECT * FROM CUSTDEMO;
SELECT * FROM PURPROD;

--구매감소고객의 연령대별 수 파악
--35세~50세 고객 주로 감소.
SELECT 연령대, COUNT(PURBYYEAR2.고객번호) 명수 FROM CUSTDEMO, PURBYYEAR2
WHERE CUSTDEMO.고객번호 = PURBYYEAR2.고객번호
GROUP BY 연령대;

SELECT 연령대, COUNT(CASE WHEN "매출 신장율" < 1 THEN PURBYYEAR2.고객번호 END) 명수 FROM CUSTDEMO, PURBYYEAR2
WHERE CUSTDEMO.고객번호 = PURBYYEAR2.고객번호
GROUP BY 연령대
ORDER BY 명수 DESC;

-- 이코드는 예시용으로 잘못된 코드임
SELECT 연령대, COUNT(CASE WHEN "매출 신장율" < 1 THEN PURBYYEAR2.고객번호 END) 명수 FROM CUSTDEMO, PURBYYEAR2
WHERE PURPROD.고객번호 IN (SELECT 고객번호 FROM CUSTDEMO WHERE 연령대 = '60세이상')
GROUP BY 연령대
ORDER BY 명수 DESC;
