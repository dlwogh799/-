select *from prodcl;
select * from purprod;
--A -1 
select sum(구매금액) from purprod
where (구매일자 between 20150101 and 20150331) 
and (제휴사 = 'A' and 소분류코드 between 'A010101' and 'A010624'
or 제휴사 = 'A' and 소분류코드 between 'A010656'  and 'A011004'
or 제휴사 = 'A' and 소분류코드 between 'A090101'  and 'A090105'
or 제휴사 = 'A' and 소분류코드 = 'A030110'
or 제휴사 = 'A' and 소분류코드 between 'A090107'  and 'A090310'
or 제휴사 = 'A' and 소분류코드 = 'A030112');
--A - 2
select sum(구매금액) from purprod
where (구매일자 between 20151001 and 20151231) 
and (제휴사 = 'A' and 소분류코드 between 'A020101'  and 'A020603'
or 제휴사 = 'A' and 소분류코드 between 'A020607'  and 'A030109'
or 제휴사 = 'A' and 소분류코드 = 'A030111'
or 제휴사 = 'A' and 소분류코드 between 'A040201'  and 'A070304'
or 제휴사 = 'A' and 소분류코드 between 'A070501'  and 'A070608'
or 제휴사 = 'A' and 소분류코드 between 'A090311'  and 'A090610'
or 제휴사 = 'A' and 소분류코드 = 'A030113');
---A -2
select sum(구매금액) from purprod
where 제휴사 = 'A' and 소분류코드 between 'A020101'  and 'A020603'
or 제휴사 = 'A' and 소분류코드 between 'A020607'  and 'A030109'
or 제휴사 = 'A' and 소분류코드 = 'A030111'
or 제휴사 = 'A' and 소분류코드 between 'A040201'  and 'A070304'
or 제휴사 = 'A' and 소분류코드 between 'A070501'  and 'A070608'
or 제휴사 = 'A' and 소분류코드 between 'A090311'  and 'A090610'
or 제휴사 = 'A' and 소분류코드 = 'A030113';

--A --3
select sum(구매금액) from purprod
where 제휴사 = 'A' and 소분류코드 between 'A070401'  and 'A070403'
or 제휴사 = 'A' and 소분류코드 between 'A080101'  and 'A080125'
or 제휴사 = 'A' and 소분류코드 = 'A090701' ;

--A--3
select sum(구매금액) from purprod
where (구매일자 between 20151001 and 20151231)
and (제휴사 = 'A' and 소분류코드 between 'A070401'  and 'A070403'
or 제휴사 = 'A' and 소분류코드 between 'A080101'  and 'A080125'
or 제휴사 = 'A' and 소분류코드 = 'A090701') ;

--A --4
select sum(구매일자) from purprod
where 제휴사 = 'A' and 소분류코드 between 'A010625'  and 'A010655'
or 제휴사 = 'A' and 소분류코드 between 'A011101'  and 'A011109'
or 제휴사 = 'A' and 소분류코드 = 'A030114'
or 제휴사 = 'A' and 소분류코드 between 'A020604'  and 'A020606'
or 제휴사 = 'A' and 소분류코드 = 'A011101'
or 제휴사 = 'A' and 소분류코드 = 'A090106';

--A --4
select sum(구매일자) from purprod
where (구매일자 between 20140101 and 20140331)
and 제휴사 = 'A' and 소분류코드 between 'A010625'  and 'A010655'
or 제휴사 = 'A' and 소분류코드 between 'A011101'  and 'A011109'
or 제휴사 = 'A' and 소분류코드 = 'A030114'
or 제휴사 = 'A' and 소분류코드 between 'A020604'  and 'A020606'
or 제휴사 = 'A' and 소분류코드 = 'A011101'
or 제휴사 = 'A' and 소분류코드 = 'A090106';


Select * from div14;
select * from div15;

create table s_pur_copy as
select * from purprod;

select * from s_pur_copy;

update s_pur_copy set 구매금액 = 구매금액/1.01620302175834
where 구매일자 between 20140101 and 20140331; --3,217,669

update s_pur_copy set 구매금액 = 구매금액/0.970792475064181
where 구매일자 between 20140401 and 20140630; --3,491,713개

update s_pur_copy set 구매금액 = 구매금액/0.885105845713564
where 구매일자 between 20140701 and 20140930; --3,563,754

update s_pur_copy set 구매금액 = 구매금액/1.12760405706831
where 구매일자 between 20141001 and 20141231; -- 3,598,378

update s_pur_copy set 구매금액 = 구매금액/0.988770710623332
where 구매일자 between 20150101 and 20150331; --3,619,223

update s_pur_copy set 구매금액 = 구매금액/0.932539514386203
where 구매일자 between 20150401 and 20150630;  --3,854,875

update s_pur_copy set 구매금액 = 구매금액/0.88791897961778
where 구매일자 between 20150701 and 20150930;  --3,795,633

update s_pur_copy set 구매금액 = 구매금액/1.2103055214204
where 구매일자 between 20151001 and 20151231; --

select * from s_pur_copy;