# aglq510 差异
## 发出商品
```sql
SELECT SUM(xckc014)
  FROM xckc_t, xcbb_t
 WHERE xckcent = xcbbent
   AND xckc001 = xcbb001
   AND xckc002 = xcbb002
   AND xckc004 = xcbb003
   AND xckcent = 70
   AND xckcld = 'AG'
   AND xckc001 = 2021
   AND xckc002 = 5
   AND xcbbcomp = 'AG'
   AND 1 = 1
   --AND xcbb010 = '003'
   AND (xcbb003 NOT IN (SELECT DISTINCT glcc016
                          FROM glcc_t
                         WHERE glccent = 70
                           AND glccld = 'AG'
                           and glccstus = 'Y'))  

```

## 应付
```sql
SELECT DISTINCT xrea003,
                xrea019,
                xrea100,
                SUM(CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea103 - xrea107) * -1
                      ELSE
                       (xrea103 - xrea107)
                    END),
                SUM(CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea113 - xrea117) * -1
                      ELSE
                       (xrea113 - xrea117)
                    END)
  FROM xrea_t
 WHERE xreaent = 70
   AND xreald = 'AG'
   AND xrea001 = 2021
   AND xrea002 = 5
   AND xrea003 IN ('AR', 'AP')
   AND xrea019 = '220201'
 GROUP BY xrea003, xrea019, xrea100
 ORDER BY xrea003, xrea019, xrea100  

``` 

<!-- ！应付凭证sql -->
(

select  glaqdocno,glaqent,glaqcomp,sum(glaq003-glaq004) glaq010-- glaqdocno,apcadocno 
from glaq_t ,glap_t
--left join apca_t on apca038 =  glapdocno and apcaent = glapent and glapcomp = apcacomp
where glaqdocno = glapdocno and glaqent = glapent and glaqcomp=glapcomp
and glapstus='S' and glap002=2021 and glap004=5 and glaq002 ='220201' and glapcomp='AG'
and glap008 ='P10'
group by glaqdocno,glaqent,glaqcomp) 


5月新增单据
```sql

select a.xrea005,a.xrea103,b.xrea103 from (
SELECT  xrea003,apca038,
xrea005,
xreaent,xreacomp,
                xrea019,
                xrea100,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea103 - xrea107) * -1
                      ELSE
                       (xrea103 - xrea107)
                    END) xrea103,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea113 - xrea117) * -1
                      ELSE
                       (xrea113 - xrea117)
                    END) xrea113
  FROM xrea_t
  left join apca_t on apcadocno = xrea005 and xreaent = apcaent and xreacomp=apcacomp
 WHERE xreaent = 70
   AND xreald = 'AG'
   AND xrea001 = 2021
   AND xrea002 = 5
   AND xrea003 IN ('AR', 'AP')
   AND xrea019 = '220201' )a
   left join ( SELECT  xrea003,apca038,
xrea005,
xreaent,xreacomp,
                xrea019,
                xrea100,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea103 - xrea107) * -1
                      ELSE
                       (xrea103 - xrea107)
                    END) xrea103,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea113 - xrea117) * -1
                      ELSE
                       (xrea113 - xrea117)
                    END) xrea113
  FROM xrea_t
  left join apca_t on apcadocno = xrea005 and xreaent = apcaent and xreacomp=apcacomp
 WHERE xreaent = 70
   AND xreald = 'AG'
   AND xrea001 = 2021
   AND xrea002 = 4
   AND xrea003 IN ('AR', 'AP')
   AND xrea019 = '220201') b
   on a.xrea005 = b.xrea005 
   where b.xrea005 is null
```

5月冲账金额
```sql

select a.xrea005,a.xrea103-NVL(b.xrea103,0) from (
SELECT   xrea003,apca038,
xrea005,
xreaent,xreacomp,
                xrea019,
                xrea100,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea103 - xrea107) * -1
                      ELSE
                       (xrea103 - xrea107)
                    END) xrea103,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea113 - xrea117) * -1
                      ELSE
                       (xrea113 - xrea117)
                    END) xrea113
  FROM xrea_t
  left join apca_t on apcadocno = xrea005 and xreaent = apcaent and xreacomp=apcacomp
 WHERE xreaent = 70
   AND xreald = 'AG'
   AND xrea001 = 2021
   AND xrea002 = 4
   AND xrea003 IN ('AR', 'AP')
   AND xrea019 = '220201' )a
   left join ( 
SELECT  xrea003,apca038,
xrea005,
xreaent,xreacomp,
                xrea019,
                xrea100,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea103 - xrea107) * -1
                      ELSE
                       (xrea103 - xrea107)
                    END) xrea103,
                (CASE
                      WHEN xrea004 LIKE '2%' OR xrea004 = '02' OR xrea004 = '04' OR
                           xrea004 = '06' THEN
                       (xrea113 - xrea117) * -1
                      ELSE
                       (xrea113 - xrea117)
                    END) xrea113
  FROM xrea_t
  left join apca_t on apcadocno = xrea005 and xreaent = apcaent and xreacomp=apcacomp
 WHERE xreaent = 70
   AND xreald = 'AG'
   AND xrea001 = 2021
   AND xrea002 = 5
   AND xrea003 IN ('AR', 'AP')
   AND xrea019 = '220201') b
   on a.xrea005 = b.xrea005 
  -- where b.xrea005 is null
```
aapt420
select apda014,sum(apce119) from apce_t ,apda_t
where apcedocno = apdadocno
and apceent = apdaent and apcecomp = apdacomp
and apdadocdt between to_date('210501','yymmdd') and to_date('210531','yymmdd')
and apce002 ='40' and apce016 ='220201' 
 group by apda014



本月冲本月单据
 select * from (

 select  glaqdocno,glaqent,glaqcomp,sum(glaq003-glaq004) glaq010-- glaqdocno,apcadocno 
from glaq_t ,glap_t
--left join apca_t on apca038 =  glapdocno and apcaent = glapent and glapcomp = apcacomp
where glaqdocno = glapdocno and glaqent = glapent and glaqcomp=glapcomp
and glapstus='S' and glap002=2021 and glap004=5 and glaq002 ='220201' and glapcomp='AG'
and glap008 ='P10'
group by glaqdocno,glaqent,glaqcomp
) left join (
select apca038,sum(xrea103) xrea103 from new5_lixwz group by apca038
) on  apca038  = glaqdocno
where glaq010 <> -1*NVL(xrea103,0)



 
select * from (

 select  glaqdocno,glaqent,glap008,glaqcomp,sum(glaq003-glaq004) glaq010-- glaqdocno,apcadocno 
from glaq_t ,glap_t
--left join apca_t on apca038 =  glapdocno and apcaent = glapent and glapcomp = apcacomp
where glaqdocno = glapdocno and glaqent = glapent and glaqcomp=glapcomp
and glapstus='S' and glap002=2021 and glap004=5 and glaq002 ='220201' and glapcomp='AG'
and glap008 <>'P10'
group by glaqdocno,glaqent,glaqcomp,glap008
)  left join (
select apda014,sum(case apce015 when 'C' then -1*apce119 else apce119 end ) apce119 from apce_t ,apda_t
where apcedocno = apdadocno
and apceent = apdaent and apcecomp = apdacomp
and apdadocdt between to_date('210501','yymmdd') and to_date('210531','yymmdd')
 and apce016 ='220201' 
 group by apda014
) on apda014=glaqdocno
where GLAQ010 <> NVL(apce119,0)