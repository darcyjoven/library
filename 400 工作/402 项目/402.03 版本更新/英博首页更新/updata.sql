
INSERT INTO gzzn_t(gzzn001,gzzn002,gzzn003,gzzn004) VALUES ('LIB','cl_resource','Y','N') ;
INSERT INTO gzzn_t(gzzn001,gzzn002,gzzn003,gzzn004) VALUES ('SUB','s_aooi350','Y','N') ;
INSERT INTO gzzn_t(gzzn001,gzzn002,gzzn003,gzzn004) VALUES ('LIB','cl_aws','Y','N') ;
INSERT INTO gzde_t (gzde001,gzde002,gzde003,gzde008,gzde009,gzdestus) VALUES('cl_resource','LIB','B','s','sd','Y');
INSERT INTO gzde_t (gzde001,gzde002,gzde003,gzde008,gzde009,gzdestus) VALUES('cl_aws','LIB','B','s','sd','Y');
INSERT INTO gzde_t (gzde001,gzde002,gzde003,gzde008,gzde009,gzdestus) VALUES('s_aooi350','SUB','B','s','sd','Y');
INSERT INTO gzzn_t(gzzn001,gzzn002,gzzn003,gzzn004) VALUES ('LIB','cl_fr','Y','N') ;
INSERT INTO gzde_t (gzde001,gzde002,gzde003,gzde008,gzde009,gzdestus) VALUES('cl_fr','LIB','B','s','sd','Y');

				  
INSERT INTO gzzn_t(gzzn001,gzzn002,gzzn003,gzzn004) VALUES ('LIB','cl_portal','Y','N') ;
INSERT INTO gzzn_t(gzzn001,gzzn002,gzzn003,gzzn004) VALUES ('LIB','cl_s_aooi350','Y','N') ;
INSERT INTO gzde_t (gzde001,gzde002,gzde003,gzde008,gzde009,gzdestus) VALUES('cl_portal','LIB','B','s','sd','Y');
INSERT INTO gzde_t (gzde001,gzde002,gzde003,gzde008,gzde009,gzdestus) VALUES('cl_s_aooi350','LIB','B','s','sd','Y');


insert into gzzn_t (GZZN001, GZZN002, GZZN003, GZZN004) values ('LIB', 'cl_aws_prod', 'Y', 'N');
--insert into gzde_t (GZDESTUS, GZDE001, GZDE002, GZDE003, GZDE004, GZDE005, GZDE006, GZDE007, GZDE008, GZDE009, GZDE010) values ('Y', 'cl_aws_prod', 'LIB', 'B', '', 'I', 'a', 'Y', 's', 'sd', '');

INSERT INTO gzde_t (gzde001,gzde002,gzde003,gzde008,gzde009,gzdestus) VALUES('cl_aws_prod','LIB','B','s','sd','Y');

update gzxa_t set gzxa003 = 'TOPSTD' where gzxa001 = 'topstd' and gzxaent = 99;
update gzxa_t set gzxa007 = 'SITE-01' where gzxa001 = 'topstd' and gzxaent = 99;
--#分別insert gzxb_t gzxc_t
INSERT INTO gzxb_t(gzxbstus,gzxbent,gzxb001,gzxb002,gzxb003,gzxb004,gzxb005)
    VALUES('Y',99,'TOPSTD','1','admin-01',NULL,NULL);
INSERT INTO gzxc_t(gzxcstus,gzxcent,gzxc001,gzxc002,gzxc003,gzxc004,gzxc005,gzxc006,gzxc007)
   VALUES('Y',99,'TOPSTD','1','admin-01','DSCTC',NULL,NULL,'Y');

INSERT INTO gzxc_t(gzxcstus,gzxcent,gzxc001,gzxc002,gzxc003,gzxc004,gzxc005,gzxc006,gzxc007)
   VALUES('Y',99,'TOPSTD','1','admin-01','DSCNJ',NULL,NULL,'Y');

INSERT INTO gzxc_t(gzxcstus,gzxcent,gzxc001,gzxc002,gzxc003,gzxc004,gzxc005,gzxc006,gzxc007)
   VALUES('Y',99,'TOPSTD','1','admin-01','SITE-01',NULL,NULL,'Y');
   
   
update gzza_t set gzza012 = '2';   
   

