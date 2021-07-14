-- ! abmm200
drop table lixwz_abmm200;
create table lixwz_abmm200 as
 select t.*, level lvl, CONNECT_BY_ROOT(bmba001) bmba001_root
  from (select bmba001,bmba003,bmba009 from bmba_t,bmaa_t  where   
  (bmba006 is null or bmba006 >to_date('210618','yymmdd'))
and bmba005 <= to_date('210618','yymmdd' ) and bmbasite='RK01' 
and bmba001 = bmaa001 and bmbasite = bmaasite and bmaastus='Y') t
 start with t.bmba001 like '1AC0%'
connect by prior t.bmba003 = t.bmba001
 order by level,bmba001,bmba009;

--!去掉不是A的BOM
drop table lixwz_abmm200A;
 create table lixwz_abmm200A as 
select lixwz_abmm200.* from lixwz_abmm200,imaa_t  a ,imaa_t b
where BMBA001_ROOT = a.imaa001  and a.imaa004 = 'A'
and bmba003 = b.imaa001 and b.imaa004 <>'X';


-- ! axci004
drop table lixwz_axci004;
create table lixwz_axci004 as
 select t.*, level lvl, CONNECT_BY_ROOT(bmba001) bmba001_root
  from (
  select xcad002 bmba001,xcad003 bmba003, xcadseq bmba009 from xcad_t  where   
  (xcad013 is null or xcad013 >to_date('210618','yymmdd'))
and xcad012 <= to_date('210618','yymmdd' ) and xcadsite='RK01' and xcad001 ='1AC0 '
) t
 start with t.bmba001 like '1AC0%'
connect by prior t.bmba003 = t.bmba001
 order by level,bmba001,bmba009;




--!  对比差异 
-- 1.axci004 中没有的
select UNIQUE  a.*   FROM lixwz_abmm200A a
left join lixwz_axci004 b
on b.bmba001_root = a.bmba001_root
and b.bmba003 = a.bmba003
where  b.bmba001 is null  ; 

--2. axci004中多的
select UNIQUE  a.*  FROM lixwz_axci004 a
left join  lixwz_abmm200A b
on b.bmba001_root = a.bmba001_root
and b.bmba003 = a.bmba003
where  b.bmba001 is null  ;



--! 检查上阶料

select t.*, level, CONNECT_BY_ROOT(bmba003)
  from bmba_t t where   bmbasite ='ALL'
 start with t.bmba003 ='VR07030244A0'
connect by prior t.bmba001 = t.bmba003; 