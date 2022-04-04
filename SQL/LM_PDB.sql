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
where 제휴사='C';
-- 제휴사 A  1기 ~~6기
select 고객번호, 구매금액
from  s_pur_copy.order by 고객번호
where 구매일자  <20150701 and 제휴사='A';

select count(고객번호)
from  s_pur_copy
where 구매일자  <20150701 and 제휴사='A';

select 고객번호, count(영수증번호)
from  s_pur_copy group by 고객번호 order by 고객번호;

select count(영수증번호)
from  s_pur_copy;

select 고객번호, 구매금액
from  s_pur_copy
where 구매일자  <20150701 and 제휴사='B';

select count(영수증번호)
from  s_pur_copy
where 구매일자  <20150701 and 제휴사='B';

select count(영수증번호)
from  s_pur_copy
where 구매일자  <20150701 and 제휴사='C';

select count(영수증번호)
from  s_pur_copy
where 구매일자  <20150701 and 제휴사='D';
drop table price;
select 고객번호,sum(구매금액) from  s_pur_copy where 제휴사='A' group by 고객번호 order by 고객번호;
---  A제휴사를 1~6기까지 쓴 고객의 총 구매금액이 개인별로
create table price as select 고객번호 고객번호,count(영수증번호) 영수증번호 from  s_pur_copy where 제휴사='A' and 구매일자  <20150701 group by 고객번호 order by 고객번호;
select 고객번호 고객번호,count(영수증번호) 영수증번호 from  s_pur_copy where 제휴사='B' and 구매일자  <20150701 group by 고객번호 order by 고객번호;
select * from price;
SELECT count(고객번호)
FROM   price;

--전cp
select count(고객번호) from price;
drop table price1;
----B
create table price1 as select 고객번호 고객번호,sum(구매금액) 구매금액 from  s_pur_copy where 제휴사='B' and 구매일자  <20150701 group by 고객번호 order by 고객번호;
select * from price1;
-- B 전체 
select sum(구매금액) from price1;
select count(고객번호) from price1;
select count(고객번호) from price1;
--C
create table price2 as select 고객번호 고객번호,sum(구매금액) 구매금액 from  s_pur_copy where 제휴사='C' and 구매일자  <20150701 group by 고객번호 order by 고객번호;
select * from price2;

- c 전체
select count(고객번호) from price2;
--D
create table price3 as select 고객번호 고객번호,sum(구매금액) 구매금액 from  s_pur_copy where 제휴사='D' and 구매일자  <20150701 group by 고객번호 order by 고객번호;
select * from price3;
--D
select count(고객번호) from price3;