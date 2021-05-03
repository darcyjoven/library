select apa01,
    a.oox09,
    a.oox10,
    apa34f - apa35f,
    a.oox10 +(
        select -1 * sum(b.oox10)
        from oox_file b
        where b.oox03 = a.oox03
            and not (
                oox01 = 2021
                and oox02 = 1
            )
    ),
    apa65 + oox10
from oox_file a
    left join apa_file on apa01 = a.oox03
where a.oox00 = 'AP'
    and a.oox01 = 2021
    and a.oox02 = 1
    and apa34f - apa35f = 0;

    create table apa_lixwz as select apa01,
    a.oox09,
    a.oox10,
    apa34f - apa35f apa35f ,
    a.oox10 +(
        select -1 * sum(b.oox10)
        from oox_file b
        where b.oox03 = a.oox03
            and not (
                oox01 = 2021
                and oox02 = 1
            )
    ) oox10sum ,
    apa65 + oox10 apa65
from oox_file a
    left join apa_file on apa01 = a.oox03
where a.oox00 = 'AP'
    and a.oox01 = 2021
    and a.oox02 = 1
    and apa34f - apa35f = 0;
    
  select * from oox_file where oox03 ='711-KT13120263' and oox01 =2021 and oox02 =1 for update ;
    select * from apc_file where apc01 ='711-KT13120263'  for update 
        select * from apa_file where apa01 ='711-KT13120263'  for update 

 

update apc_file 
set apc13 =0
where apc01 in(
select apa01 
from oox_file a
    left join apa_file on apa01 = a.oox03
where a.oox00 = 'AP'
    and a.oox01 = 2021
    and a.oox02 = 1
    and apa34f - apa35f = 0
) ;
update apa_file
set apa73 = 0
where apa01 in (
select apa01 
from oox_file a
    left join apa_file on apa01 = a.oox03
where a.oox00 = 'AP'
    and a.oox01 = 2021
    and a.oox02 = 1
    and apa34f - apa35f = 0
);

select * from apa_lixwz

merge into oox_file a
using  apa_lixwz b
on (b.apa01 = a.oox03 and a.oox01=2021 and a.oox02=1 )
when matched then update set
 a.oox08 = b.oox10*-1 ,
 a.oox09=0,
 a.oox10 = b.oox10;
 
  