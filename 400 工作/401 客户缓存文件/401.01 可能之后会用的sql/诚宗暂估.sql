merge into apcc_t a 
using (
select apcadocno,apcc118 ,apcc119,apcf113,apcf103  from apca_t,apcc_t 
left join (select apcfent,apcf008,apcf009,apcf010,sum(apcf113) apcf113 ,sum(apcf103) apcf103 from apcf_t,apca_t 
where apcadocno = apcfdocno and apcaent = apcfent and apcastus ='Y'
 group by apcfent,apcf008,apcf009,apcf010) 
on apcfent = apccent  and apcf008 = apccdocno and apcf009= apccseq  and apcf010 = apcc001 

where --apcadocno ='21-AP01-210330048' and
 apca001='01'
and apccdocno = apcadocno  and apccent = apcaent 
and apcaent =8 and apcasite='21'
and apcastus ='Y' and apcf113 <> NVL(apcc119,0) and apcadocdt >to_date('180101','yymmdd') )b
on ( a.apccdocno = b.apcadocno and a.apccent =8  )
when matched then update set a.apcc109 = b.apcf103 , a.apcc119 = b.apcf113