select *from prodcl;
select * from purprod;
--A -1 
select sum(���űݾ�) from purprod
where (�������� between 20150101 and 20150331) 
and (���޻� = 'A' and �Һз��ڵ� between 'A010101' and 'A010624'
or ���޻� = 'A' and �Һз��ڵ� between 'A010656'  and 'A011004'
or ���޻� = 'A' and �Һз��ڵ� between 'A090101'  and 'A090105'
or ���޻� = 'A' and �Һз��ڵ� = 'A030110'
or ���޻� = 'A' and �Һз��ڵ� between 'A090107'  and 'A090310'
or ���޻� = 'A' and �Һз��ڵ� = 'A030112');
--A - 2
select sum(���űݾ�) from purprod
where (�������� between 20151001 and 20151231) 
and (���޻� = 'A' and �Һз��ڵ� between 'A020101'  and 'A020603'
or ���޻� = 'A' and �Һз��ڵ� between 'A020607'  and 'A030109'
or ���޻� = 'A' and �Һз��ڵ� = 'A030111'
or ���޻� = 'A' and �Һз��ڵ� between 'A040201'  and 'A070304'
or ���޻� = 'A' and �Һз��ڵ� between 'A070501'  and 'A070608'
or ���޻� = 'A' and �Һз��ڵ� between 'A090311'  and 'A090610'
or ���޻� = 'A' and �Һз��ڵ� = 'A030113');
---A -2
select sum(���űݾ�) from purprod
where ���޻� = 'A' and �Һз��ڵ� between 'A020101'  and 'A020603'
or ���޻� = 'A' and �Һз��ڵ� between 'A020607'  and 'A030109'
or ���޻� = 'A' and �Һз��ڵ� = 'A030111'
or ���޻� = 'A' and �Һз��ڵ� between 'A040201'  and 'A070304'
or ���޻� = 'A' and �Һз��ڵ� between 'A070501'  and 'A070608'
or ���޻� = 'A' and �Һз��ڵ� between 'A090311'  and 'A090610'
or ���޻� = 'A' and �Һз��ڵ� = 'A030113';

--A --3
select sum(���űݾ�) from purprod
where ���޻� = 'A' and �Һз��ڵ� between 'A070401'  and 'A070403'
or ���޻� = 'A' and �Һз��ڵ� between 'A080101'  and 'A080125'
or ���޻� = 'A' and �Һз��ڵ� = 'A090701' ;

--A--3
select sum(���űݾ�) from purprod
where (�������� between 20151001 and 20151231)
and (���޻� = 'A' and �Һз��ڵ� between 'A070401'  and 'A070403'
or ���޻� = 'A' and �Һз��ڵ� between 'A080101'  and 'A080125'
or ���޻� = 'A' and �Һз��ڵ� = 'A090701') ;

--A --4
select sum(��������) from purprod
where ���޻� = 'A' and �Һз��ڵ� between 'A010625'  and 'A010655'
or ���޻� = 'A' and �Һз��ڵ� between 'A011101'  and 'A011109'
or ���޻� = 'A' and �Һз��ڵ� = 'A030114'
or ���޻� = 'A' and �Һз��ڵ� between 'A020604'  and 'A020606'
or ���޻� = 'A' and �Һз��ڵ� = 'A011101'
or ���޻� = 'A' and �Һз��ڵ� = 'A090106';

--A --4
select sum(��������) from purprod
where (�������� between 20140101 and 20140331)
and ���޻� = 'A' and �Һз��ڵ� between 'A010625'  and 'A010655'
or ���޻� = 'A' and �Һз��ڵ� between 'A011101'  and 'A011109'
or ���޻� = 'A' and �Һз��ڵ� = 'A030114'
or ���޻� = 'A' and �Һз��ڵ� between 'A020604'  and 'A020606'
or ���޻� = 'A' and �Һз��ڵ� = 'A011101'
or ���޻� = 'A' and �Һз��ڵ� = 'A090106';


Select * from div14;
select * from div15;

create table s_pur_copy as
select * from purprod;

select * from s_pur_copy;

update s_pur_copy set ���űݾ� = ���űݾ�/1.01620302175834
where �������� between 20140101 and 20140331; --3,217,669

update s_pur_copy set ���űݾ� = ���űݾ�/0.970792475064181
where �������� between 20140401 and 20140630; --3,491,713��

update s_pur_copy set ���űݾ� = ���űݾ�/0.885105845713564
where �������� between 20140701 and 20140930; --3,563,754

update s_pur_copy set ���űݾ� = ���űݾ�/1.12760405706831
where �������� between 20141001 and 20141231; -- 3,598,378

update s_pur_copy set ���űݾ� = ���űݾ�/0.988770710623332
where �������� between 20150101 and 20150331; --3,619,223

update s_pur_copy set ���űݾ� = ���űݾ�/0.932539514386203
where �������� between 20150401 and 20150630;  --3,854,875

update s_pur_copy set ���űݾ� = ���űݾ�/0.88791897961778
where �������� between 20150701 and 20150930;  --3,795,633

update s_pur_copy set ���űݾ� = ���űݾ�/1.2103055214204
where �������� between 20151001 and 20151231; --

select * from s_pur_copy;