select --* from gzcb_t where gzcb001 ='18123';
lixwz_t.*,
coalesce (
(select gzcb007 from gzcb_t where gzcb001 ='18123' 
and gzcb003 = d1 and gzcb004 =d2 and gzcb005= d3 and gzcb006 =d4), 
(select gzcb007 from gzcb_t where gzcb001 ='18123' 
and gzcb003 = d1 and gzcb004 =d2 and gzcb005 = d3  and gzcb006 is null),
(select gzcb007 from gzcb_t where gzcb001 ='18123' 
and gzcb003 = d1  and gzcb004 is  null and gzcb005 =d3 and gzcb006 =d4),
(select gzcb007 from gzcb_t where gzcb001 ='18123' 
and gzcb003 = d1  and gzcb004 is  null and gzcb005 =d3 and gzcb006 is null),
(select gzcb007 from gzcb_t where gzcb001 ='18123' 
and gzcb003 = d1 and gzcb004 is  null and gzcb005 is  null and gzcb006 is null  ) )  
from lixwz_t  