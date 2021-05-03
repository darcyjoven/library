--  根据sfcb 新增sfcc

 insert into sfcc_t (sfccent ,sfccsite,sfccdocno,sfcc001,sfcc002,sfcc003,sfcc004)
 select sfcbent ,sfcbsite,sfcbdocno,sfcb001,sfcb002,sfcb003,sfcb008 from sfcb_t 
 where sfcbdocno in (
 '005-SF34-2103290003','005-SF34-2103290005'
 )

-- 差异查询
 select count(1) from (
 select  unique sfcbdocno from sfcb_t 
 left join sfcc_t on sfccdocno = sfcbdocno and sfccent = sfcbent and sfcbsite = sfccsite
 left join sfaa_t on sfaadocno = sfcbdocno and sfcbent = sfaaent and sfaasite = sfcbsite
 where sfcbent =1958 and sfcbsite='005'
 --and sfcbdocno='005-SF34-2103290003'
 and sfccdocno is null)


    DECLARE s_asft335_ins_sfcb_next CURSOR FOR s_asft335_ins_sfcb_next_pb


    p_sfcbdocno = "005-SF34-2103290003"
p_sfcb001 = 0
p_sfcb003 = "XQ12"
p_sfcb004 = "1"



create table sfcc_log (
 sfccdocno varchar(40),
 sfcccnt  number(20,6),
 sfccmark varchar(1000),
 sfcctime timestamp
)



'005-SF02-2103260297',
'005-SF02-2103260298',
'005-SF02-2103260299',
'005-SF02-2103260300',
'005-SF02-2103260301',
'005-SF02-2103260302',
'005-SF02-2103260303',
'005-SF02-2103260304',
'005-SF02-2103260305',
'005-SF02-2103260306',
'005-SF02-2103260307',
'005-SF02-2103260308',
'005-SF02-2103260309',
'005-SF02-2103290257',
'005-SF02-2103290258',
'005-SF02-2103290259',
'005-SF02-2103290260',
'005-SF34-2103290006',
'005-SF34-2103290008',
