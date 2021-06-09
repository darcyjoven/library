--! 查询采购凭证
select abb01 ,
sum(case abb06 when '1' then abb07 else -1*abb07 end)  
from aba_file,abb_file 
where abb01 = aba01 and aba03=2021 and aba04=5
and abb03 in (
'140301',
--'140302',
'140501',
'140502',
'140503',
'140601',
'141001',
'141002',
'141003'
) and abapost='Y' and aba06 = 'AP'  
group by abb01;

-- 本月各项目异动

select 
sum(ccc12) 期初金额,
sum(ccc221) 采购入库,
sum(ccc222) 委外入库,
sum(ccc42) 杂项领用,
sum(ccc224)杂项入库,
sum(ccc28 + ccc223) 工单入库,
sum(ccc26 + ccc32) 工单领用,
sum(ccc62) 销售,
sum(ccc92) 期末金额,
sum(ccc93) 月底结存,
sum(ccc225)
from ccc_file
where ccc02 = 2021
    and ccc03 = 5


-- 采购入库成本

select tlf01,tlf905,tlf906,tlf907*tlf21 tlf21
create table lixwz_ccc2105 as 
select tlf01, tlf905,tlf906,tlf10, tlf907*tlf21  tlf21
 from tlf_file 
where YEAR(tlf06)=2021 and MONTH(tlf06)=5
and tlf13 in('apmt150','apmt1072','apmt230')

-- 立账汇总

select apa01,apa44,apb21,apb22,sum(
case when apa00 like '2%' then -1 *apb10 else apb10 end ) apb10
 from apb_file,apa_file 
where apb01 =apa01 and apa02 >=to_date('210501','yymmdd')
and ( apb34 ='N' OR apb34 is null) 
 group by apa01,apb21,apb22,apa44;


--- 上面两个sql组合起来可以和总账核对

select apa44, sum(apb10)   from lixwz_ccc2105,lixwz_apb2105
where  apb21 = tlf905 and apb22 =tlf906
group by apa44

lixwz_ccc2105 为成本 lixwz_apb2105 为立账

因为直接查很卡，所以用中间表


--- 采购明细


SELECT apa01 apa44,sum(CASE WHEN apa00 LIKE '2%' THEN -1*apb10 ELSE apb10 END ) FROM apa_file,apb_file,ima_file WHERE apa01=apb01
AND  apa02  BETWEEN to_date('210501','yymmdd') AND to_date ('210531','yymmdd')
AND( apb34 ='N' OR apa34 IS null) AND ima01 = apb12 AND ima39='1403' AND apa41='Y'  
AND apa44 NOT IN (
'2911-210500155',
'2911-210500301',
'2911-210500302',
'2911-210500304',
'2911-210500306',
'2911-210500307') 
GROUP BY apa01, apa44 HAVING sum(CASE WHEN apa00 LIKE '2%' THEN -1*apb10 ELSE apb10 END ) <>0


 