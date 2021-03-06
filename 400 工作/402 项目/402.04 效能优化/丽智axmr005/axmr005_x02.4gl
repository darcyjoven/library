#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axmr005_x02.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:4(), PR版次:0004(2017-11-09 14:28:35)
#+ Customerized Version.: SD版次:(), PR版次:0004(2020-08-19 13:56:28)
#+ Build......: 000155
#+ Filename...: axmr005_x02
#+ Description: ...
#+ Creator....: 04441(2014-10-30 10:22:02)
#+ Modifier...:  -SD/PR- 08734
 
{</section>}
 
{<section id="axmr005_x02.global" readonly="Y" type="s" >}
#報表 x01 樣板自動產生(Version:9)
#add-point:填寫註解說明 name="global.memo"
#161207-00033#5 2016/12/21 By 08993    一次性交易對象名稱顯示要改抓pmak003
#170103-00035#1 2017/01/03 By 07024    1.多顯示xmdkdocdt  2.更改azzi300，xmdk026顯示的名稱
#                                      3.改欄位顯示順序:xmdk026->xmdk001  換成  xmdk001->xmdk026 
#170531-00047#1 2017/06/03 By 08993    報表增加抓取單頭匯率、幣別、單身稅額欄位，並增加本幣含稅金額(含稅金額*匯率，依設定取位)、本幣未稅金額(未稅金額*匯率，依設定取位)本幣稅額(稅額*匯率，依設定取位)
#171108-00064#1 2017/11/09 By 08734    修正当下“客户订购单号”条件时，SQL会出现语法错误，无报表产生。
#end add-point
#add-point:填寫註解說明 name="global.memo_customerization"

#end add-point
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
 
IMPORT os
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_report.inc"                  #報表使用的global
 
#報表 type 宣告
DEFINE tm RECORD
       wc STRING,                  #where condition 
       chk LIKE type_t.chr1,         #簽收狀況 
       chk1 LIKE type_t.chr1          #列印多庫儲批
       END RECORD
 
DEFINE g_str           STRING,                      #列印條件回傳值              
       g_sql           STRING  
 
#add-point:自定義環境變數(Global Variable)(客製用) name="global.variable_customerization"

#end add-point
#add-point:自定義環境變數(Global Variable)(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="axmr005_x02.main" readonly="Y" type="s" >}
PUBLIC FUNCTION axmr005_x02(p_arg1,p_arg2,p_arg3)
DEFINE  p_arg1 STRING                  #tm.wc  where condition 
DEFINE  p_arg2 LIKE type_t.chr1         #tm.chk  簽收狀況 
DEFINE  p_arg3 LIKE type_t.chr1         #tm.chk1  列印多庫儲批
#add-point:init段define(客製用) name="component.define_customerization"

#end add-point
#add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="component.define"

#end add-point
 
   LET tm.wc = p_arg1
   LET tm.chk = p_arg2
   LET tm.chk1 = p_arg3
 
   #add-point:報表元件參數準備 name="component.arg.prep"
   
   #end add-point
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   ##報表元件執行期間是否有錯誤代碼
   LET g_rep_success = 'Y'
   
   #報表元件代號      
   LET g_rep_code = "axmr005_x02"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #create 暫存檔
   CALL axmr005_x02_create_tmptable()
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF
   #報表select欄位準備
   CALL axmr005_x02_sel_prep()
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
   #報表insert的prepare
   CALL axmr005_x02_ins_prep()  
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF
   #將資料存入tmptable
   CALL axmr005_x02_ins_data() 
 
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
   #將tmptable資料印出
   CALL axmr005_x02_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="axmr005_x02.create_tmptable" readonly="Y" type="s" >}
PRIVATE FUNCTION axmr005_x02_create_tmptable()
 
   #清除temptable 陣列
   CALL g_rep_tmpname.clear()
   
   #可切換資料庫，避免大量資料佔資源及空間
   #add-point:create_tmp.before name="create_tmp.before"
   
   #end add-point:create_tmp.before
 
   #主報表TEMP TABLE的欄位SQL   
   LET g_sql = "l_xmdk.type_t.chr200,xmdkdocno.xmdk_t.xmdkdocno,xmdkdocdt.xmdk_t.xmdkdocdt,xmdk001.xmdk_t.xmdk001,xmdk026.xmdk_t.xmdk026,l_xmdk002_desc.type_t.chr100,l_xmdkstus_desc.type_t.chr100,xmdk003.xmdk_t.xmdk003,l_xmdk003_desc.type_t.chr100,xmdk004.xmdk_t.xmdk004,l_xmdk004_desc.type_t.chr100,xmdk007.xmdk_t.xmdk007,l_xmdk007_desc.type_t.chr100,xmdk009.xmdk_t.xmdk009,l_xmdk009_desc.type_t.chr100,xmdk008.xmdk_t.xmdk008,l_xmdk008_desc.type_t.chr100,xmdlseq.xmdl_t.xmdlseq,xmdl003.xmdl_t.xmdl003,xmdl004.xmdl_t.xmdl004,xmdl005.xmdl_t.xmdl005,xmdl006.xmdl_t.xmdl006,xmdk005.xmdk_t.xmdk005,l_xmda033.type_t.chr20,l_xmdl007_desc.type_t.chr100,l_imaa009.imaa_t.imaa009,l_imaa009_rtaxl003.rtaxl_t.rtaxl003,l_imaf111.imaf_t.imaf111,l_imaf111_oocql004.oocql_t.oocql004,xmdl008.xmdl_t.xmdl008,x_imaal_t_imaal003.imaal_t.imaal003,x_imaal_t_imaal004.imaal_t.imaal004,xmdl009.xmdl_t.xmdl009,l_xmdl009_desc.type_t.chr30,xmdl018.xmdl_t.xmdl018,xmdl017.xmdl_t.xmdl017,xmdl035.xmdl_t.xmdl035,xmdl036.xmdl_t.xmdl036,l_qty_1.type_t.num20_6,xmdl014.xmdl_t.xmdl014,l_xmdl014_desc.type_t.chr100,xmdl015.xmdl_t.xmdl015,l_xmdl015_desc.type_t.chr100,xmdl016.xmdl_t.xmdl016,xmdl052.xmdl_t.xmdl052,xmdl051.xmdl_t.xmdl051,xmdl022.xmdl_t.xmdl022,xmdl021.xmdl_t.xmdl021,xmdl024.xmdl_t.xmdl024,xmdl025.xmdl_t.xmdl025,l_oodbl004.type_t.chr30,xmdl026.xmdl_t.xmdl026,xmdl027.xmdl_t.xmdl027,xmdl028.xmdl_t.xmdl028,l_imaa127.type_t.chr50,l_imaa127_desc.type_t.chr30,xmdl029.xmdl_t.xmdl029,xmdk016.xmdk_t.xmdk016,xmdk017.xmdk_t.xmdk017,l_xmdl027.xmdl_t.xmdl027,l_xmdl028.xmdl_t.xmdl028,l_xmdl029.xmdl_t.xmdl029,l_imaa134.imaa_t.imaa134,l_imaa134_desc.type_t.chr30" 
   
   #建立TEMP TABLE,主報表序號1 
   IF NOT cl_xg_create_tmptable(g_sql,1) THEN
      LET g_rep_success = 'N'            
   END IF
   #可切換資料庫，避免大量資料佔資源及空間
   #add-point:create_tmp.after name="create_tmp.after"
   LET g_sql = "xmdm009.xmdm_t.xmdm009,",
               "xmdm008.xmdm_t.xmdm008,",
               "xmdm012.xmdm_t.xmdm012,",
               "xmdm013.xmdm_t.xmdm013,",
               "l_qty_2.xmdm_t.xmdm013,",
               "xmdm005.xmdm_t.xmdm005,",
               "l_xmdm005_desc.type_t.chr100,",
               "xmdm006.xmdm_t.xmdm006,",
               "l_xmdm006_desc.type_t.chr100,",
               "xmdm007.xmdm_t.xmdm007,",
               "xmdm033.xmdm_t.xmdm033,",
               "xmdmdocno.xmdm_t.xmdmdocno,",
               "xmdmseq.xmdm_t.xmdmseq"
   IF NOT cl_xg_create_tmptable(g_sql,2) THEN
      LET g_rep_success = 'N'
   END IF

   #end add-point:create_tmp.after
END FUNCTION
 
{</section>}
 
{<section id="axmr005_x02.ins_prep" readonly="Y" type="s" >}
PRIVATE FUNCTION axmr005_x02_ins_prep()
DEFINE i              INTEGER
DEFINE l_prep_str     STRING
#add-point:ins_prep.define (客製用) name="ins_prep.define_customerization"

#end add-point:ins_prep.define
#add-point:ins_prep.define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_prep.define"

#end add-point:ins_prep.define
 
   FOR i = 1 TO g_rep_tmpname.getLength()
      CALL cl_xg_del_data(g_rep_tmpname[i])
      #LET g_sql = g_rep_ins_prep[i]              #透過此lib取得prepare字串 lib精簡
      CASE i
         WHEN 1
         #INSERT INTO PREP
         LET g_sql = " INSERT INTO ",g_rep_db CLIPPED,g_rep_tmpname[1] CLIPPED," VALUES(?,?,?,?,?,?, 
             ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, 
             ?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
         PREPARE insert_prep FROM g_sql
         IF STATUS THEN
            LET l_prep_str ="insert_prep",i
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_prep_str
            LET g_errparam.code = status
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL cl_xg_drop_tmptable()
            LET g_rep_success = 'N'           
         END IF 
         #add-point:insert_prep段 name="insert_prep"
         WHEN 2
         LET g_sql = " INSERT INTO ",g_rep_db CLIPPED,g_rep_tmpname[2] CLIPPED," VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)"
         PREPARE insert_prep1 FROM g_sql
         IF STATUS THEN
            LET l_prep_str ="insert_prep1",i
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = l_prep_str
            LET g_errparam.code   = status
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            CALL cl_xg_drop_tmptable()
            LET g_rep_success = 'N'
         END IF
         #end add-point                  
 
 
      END CASE
   END FOR
END FUNCTION
 
{</section>}
 
{<section id="axmr005_x02.sel_prep" readonly="Y" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION axmr005_x02_sel_prep()
DEFINE g_select      STRING
DEFINE g_from        STRING
DEFINE g_where       STRING
#add-point:sel_prep段define(客製用) name="sel_prep.define_customerization"

#end add-point
#add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
DEFINE l_ooaj004  LIKE ooaj_t.ooaj004   #170531-00047#1 add
#end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   #170531-00047#1-s add
   SELECT ooaj004 INTO l_ooaj004
     FROM ooaj_t
    WHERE ooajent = g_enterprise
      AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=ooajent AND ooef014=ooaj001 AND ooef016=ooaj002 AND ooef001=g_site)
   #170531-00047#1-e add
   #end add-point
 
   #add-point:sel_prep g_select name="sel_prep.g_select"
#160411-00027 by whitney mark start
#   LET g_select = 
#   " SELECT ",
#   " xmdkent,xmdksite,xmdkunit,xmdkdocno,xmdkdocdt,xmdk026,xmdk001,xmdk002,g1.gzcbl004,",
#   " xmdkstus,g2.gzcbl004,xmdk003,ooag_t.ooag011,xmdk004,ooefl_t.ooefl003,xmdk007,t5.pmaal004,",
#   " xmdk009,t7.pmaal004,xmdk008,t6.pmaal004,xmdlseq,xmdl003,xmdl004,xmdl005,xmdl006,x.xmda033,",
#   " xmdl007,x.xmdl007_desc,x.imaa009,x.rtaxl003,x.imaf111,x.imaf111_desc,xmdl008, ",
#   " x.imaal_t_imaal003,x.imaal_t_imaal004,xmdl009,'',xmdl018,xmdl017,",
#   " xmdl035,xmdl036,'',xmdl014,x.inayl003,xmdl015,x.inab003,xmdl016,xmdl052,xmdl051,xmdl022, ",
#   " xmdl021,xmdl024,xmdl027,xmdl028,xmdl013,xmdk005,xmdk006,xmdk010,xmdk011,xmdk012,xmdk013, ",
#   " xmdk015,xmdk016,xmdk017,xmdk018,xmdk019,xmdk020,xmdk021,xmdk022,xmdk023,xmdk024,xmdk025, ",
#   " xmdk027,xmdk028,xmdk029,xmdk030,xmdk031,xmdk032,xmdk033,xmdk034,xmdk035,xmdk036,xmdk037, ",
#   " xmdk038,xmdk039,xmdk040,xmdk042,xmdk043,xmdk044,xmdk045,xmdk054,xmdk055,xmdk202,",
#   " xmdl001,xmdl002,xmdl023,xmdl030,xmdl031,xmdl032,xmdl033,xmdl037,xmdl041,xmdl050,xmdl056,",
#   " t3.oocql004,t2.oocql004,t1.inayl003,inayl_t.inayl003,t13.pmaal004,pmaal_t.pmaal004,oofb_t.oofb011,",
#   " t4.oocql004,",
#   " CASE WHEN t14.oocq019='1' OR t14.oocq019='4' THEN oockl_t.oockl005",
#   "      WHEN t14.oocq019='2' THEN t15.oocql004 ",
#   "      WHEN t14.oocq019='3' THEN t16.oocql004 END,",
#   " CASE WHEN t14.oocq019='1' OR t14.oocq019='4' THEN t17.oockl005 ",
#   "      WHEN t14.oocq019='2' THEN t18.oocql004 ",
#   "      WHEN t14.oocq019='3' THEN t19.oocql004 END,",
#   " xmaol_t.xmaol004,oocql_t.oocql004,'',ooibl_t.ooibl004,t8.oocql004,oodbl_t.oodbl004,isacl_t.isacl004,",
#   " ooail_t.ooail003,xmahl_t.xmahl003,ooidl_t.ooidl003,t20.oocql004,t21.oocql004,x.pjbal003,x.pjbbl004,",
#   " x.pjbml004,x.xmdl050_desc,g3.gzcbl004,g4.gzcbl004,g5.gzcbl004,x.imaa127_desc,x.imaa127,",
#   " REPLACE(g6.xmeldocno,'',g7.xmeldocno),REPLACE(g8.xmdodocno,'',g9.xmdodocno),t22.pmaa091,t23.oocql004,'' "
#160411-00027 by whitney mark end
   #160411-00027 by whitney add start
   #LET g_select = " SELECT xmdkent,xmdksite,xmdkunit,xmdkdocno,xmdkdocdt,xmdk026,xmdk001,xmdk002, ",  #170103-00035#1-s-mod
   LET g_select = " SELECT ooba002,xmdkent,xmdksite,xmdkunit,xmdkdocno,xmdkdocdt,xmdk001,xmdk026,xmdk002, ",   #170103-00035#1-e-mod
                  "(SELECT gzcbl004 FROM gzcbl_t WHERE gzcbl001='2063' AND gzcbl002=xmdk002 AND gzcbl003='"||g_dlang||"') gzcbl004, ",
                  "        xmdkstus, ",
                  "(SELECT gzcbl004 FROM gzcbl_t WHERE gzcbl001='13' AND gzcbl002=xmdkstus AND gzcbl003='"||g_dlang||"') gzcbl004, ",
                  "        xmdk003, ",
                  "(SELECT ooag011 FROM ooag_t WHERE ooag001=xmdk003 AND ooagent=xmdkent) ooag011, ",
                  "        xmdk004, ",
                  "(SELECT ooefl003 FROM ooefl_t WHERE ooefl001=xmdk004 AND ooeflent=xmdkent AND ooefl002='"||g_dlang||"') ooefl003, ",
                  "        xmdk007, ",
                  "(SELECT pmaal004 FROM pmaal_t WHERE pmaal001=xmdk007 AND pmaalent=xmdkent AND pmaal002='"||g_dlang||"') pmaal004, ",
                  "        xmdk009, ",
                  "(SELECT pmaal004 FROM pmaal_t WHERE pmaal001=xmdk009 AND pmaalent=xmdkent AND pmaal002='"||g_dlang||"') pmaal004, ",
                  "        xmdk008, ",
                  "(SELECT pmaal004 FROM pmaal_t WHERE pmaal001=xmdk008 AND pmaalent=xmdkent AND pmaal002='"||g_dlang||"') pmaal004, ",
                  "        xmdlseq,xmdl003,xmdl004,xmdl005,xmdl006,xmdk005, ",
                  "(SELECT xmda033 FROM xmda_t WHERE xmdadocno = xmdl003 AND xmdaent = xmdlent) xmda033, ",
                  "        xmdl007, ",
                  "(SELECT gzcbl004 FROM gzcbl_t WHERE gzcbl001='2055' AND gzcbl002=xmdl007 AND gzcbl003='"||g_dlang||"') gzcbl004, ",
                  "        t1.imaa009,t1.rtaxl003,t2.imaf111,t2.oocql004,xmdl008,t3.imaal003,t3.imaal004,xmdl009, ",
                  "(SELECT inaml004 FROM inaml_t WHERE inamlent=xmdlent AND inaml001=xmdl008 AND inaml002=xmdl009 AND inaml003='"||g_dlang||"') inaml004, ",
                  "        xmdl018,xmdl017,xmdl035,xmdl036,0,xmdl014, ",
                  "(SELECT inayl003 FROM inayl_t WHERE inaylent=xmdlent AND inayl001=xmdl014 AND inayl002='"||g_dlang||"') inayl003, ",
                  "        xmdl015, ",
                  "(SELECT inab003 FROM inab_t WHERE inabent=xmdlent AND inabsite=xmdlsite AND inab001=xmdl014 AND inab002=xmdl015) inab003, ",
                  "        xmdl016,xmdl052,xmdl051,xmdl022,xmdl021,xmdl024 ,xmdl025, ",
                  " (SELECT oodbl004 FROM oodbl_t WHERE oodbl002=xmdl025 AND oodblent=xmdlent AND oodbl003='"||g_dlang||"') oodbl004 ",
                  " ,xmdl026/100 as xmdl026,xmdl027,xmdl028,xmdl013, ",
                  "        t1.imaa127,t1.oocql004 "   
   #160411-00027 by whitney add end
                  #170531-00047#1-s add
                  ,"       ,xmdl029,xmdk016,xmdk017,         ",
                  "        round((COALESCE(xmdl027,0)*COALESCE(xmdk017,0)),",l_ooaj004,"),",
                  "        round((COALESCE(xmdl028,0)*COALESCE(xmdk017,0)),",l_ooaj004,"),",
                  "        round((COALESCE(xmdl029,0)*COALESCE(xmdk017,0)),",l_ooaj004,"), ",
                  "imaa134,(SELECT oocql004 FROM oocql_t WHERE  oocqlent= '",g_enterprise,"'  AND imaa134 = oocql002 AND oocql001 = '2008' AND oocql003 =  '",g_dlang,"')  as l_imaa134_desc"
                  #20200819 add imaa134,l_imaa134_desc by jiyan
                  #170531-00047#1-e add            
#   #end add-point
#   LET g_select = " SELECT NULL,xmdkent,xmdksite,xmdkunit,xmdkdocno,xmdkdocdt,xmdk001,xmdk026,xmdk002, 
#       '',xmdkstus,'',xmdk003,'',xmdk004,'',xmdk007,'',xmdk009,'',xmdk008,'',xmdlseq,xmdl003,xmdl004, 
#       xmdl005,xmdl006,xmdk005,'',xmdl007,'','','','','',xmdl008,x.imaal_t_imaal003,x.imaal_t_imaal004, 
#       xmdl009,NULL,xmdl018,xmdl017,xmdl035,xmdl036,'',xmdl014,'',xmdl015,'',xmdl016,xmdl052,xmdl051, 
#       xmdl022,xmdl021,xmdl024,xmdl025,'',xmdl026,xmdl027,xmdl028,xmdl013,'','',xmdl029,xmdk016,xmdk017, 
#       NULL,NULL,NULL,'',''"
# 
#   #add-point:sel_prep g_from name="sel_prep.g_from"
#160411-00027 by whitney mark start
#   LET g_from = " FROM xmdk_t",
#                " LEFT OUTER JOIN gzcbl_t g1 ON g1.gzcbl001 = 2063 AND g1.gzcbl002 = xmdk_t.xmdk002 AND g1.gzcbl003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN gzcbl_t g2 ON g2.gzcbl001 = 13 AND g2.gzcbl002 = xmdk_t.xmdkstus AND g2.gzcbl003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN gzcbl_t g3 ON g3.gzcbl001 = 2064 AND g3.gzcbl002 = xmdk_t.xmdk045 AND g3.gzcbl003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN gzcbl_t g4 ON g4.gzcbl001 = 2085 AND g4.gzcbl002 = xmdk_t.xmdk042 AND g4.gzcbl003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN gzcbl_t g5 ON g5.gzcbl001 = 2084 AND g5.gzcbl002 = xmdk_t.xmdk043 AND g5.gzcbl003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN ooag_t ON ooag_t.ooag001 = xmdk_t.xmdk003 AND ooag_t.ooagent = xmdk_t.xmdkent" ,
#                " LEFT OUTER JOIN inayl_t ON inayl_t.inayl001 = xmdk_t.xmdk040 AND inayl_t.inaylent = xmdk_t.xmdkent AND inayl_t.inayl002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN inayl_t t1 ON t1.inayl001 = xmdk_t.xmdk039 AND t1.inaylent = xmdk_t.xmdkent AND t1.inayl002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t ON oocql_t.oocql001 = 299 AND oocql_t.oocql002 = xmdk_t.xmdk038 AND oocql_t.oocqlent = xmdk_t.xmdkent AND oocql_t.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t2 ON t2.oocql001 = 297 AND t2.oocql002 = xmdk_t.xmdk034 AND t2.oocqlent = xmdk_t.xmdkent AND t2.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t3 ON t3.oocql001 = 275 AND t3.oocql002 = xmdk_t.xmdk030 AND t3.oocqlent = xmdk_t.xmdkent AND t3.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t4 ON t4.oocql001 = 263 AND t4.oocql002 = xmdk_t.xmdk022 AND t4.oocqlent = xmdk_t.xmdkent AND t4.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN pmaal_t ON pmaal_t.pmaal001 = xmdk_t.xmdk020 AND pmaal_t.pmaalent = xmdk_t.xmdkent AND pmaal_t.pmaal002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN ooefl_t ON ooefl_t.ooefl001 = xmdk_t.xmdk004 AND ooefl_t.ooeflent = xmdk_t.xmdkent AND ooefl_t.ooefl002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN pmaal_t t5 ON t5.pmaal001 = xmdk_t.xmdk007 AND t5.pmaalent = xmdk_t.xmdkent AND t5.pmaal002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN pmaal_t t6 ON t6.pmaal001 = xmdk_t.xmdk008 AND t6.pmaalent = xmdk_t.xmdkent AND t6.pmaal002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN pmaal_t t7 ON t7.pmaal001 = xmdk_t.xmdk009 AND t7.pmaalent = xmdk_t.xmdkent AND t7.pmaal002 = '" ,   
#   g_dlang,"'" ," LEFT OUTER JOIN pmaal_t t13 ON t13.pmaal001 = xmdk_t.xmdk202 AND t13.pmaalent = xmdk_t.xmdkent AND t13.pmaal002 = '" ,   
#   g_dlang,"'" ," LEFT OUTER JOIN ooibl_t ON ooibl_t.ooibl002 = xmdk_t.xmdk010 AND ooibl_t.ooiblent = xmdk_t.xmdkent AND ooibl_t.ooibl003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t8 ON t8.oocql001 = 238 AND t8.oocql002 = xmdk_t.xmdk011 AND t8.oocqlent = xmdk_t.xmdkent AND t8.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN pmaa_t ON pmaa_t.pmaa001 = xmdk_t.xmdk009 AND pmaa_t.pmaaent = xmdk_t.xmdkent" ,
#                " LEFT OUTER JOIN oofb_t ON oofb_t.oofb002 = pmaa_t.pmaa027 AND oofb_t.oofbent = pmaa_t.pmaaent AND oofb_t.oofb019 = xmdk_t.xmdk021" ,
#                " LEFT OUTER JOIN oocq_t t14 ON t14.oocq001 = 263 AND t14.oocq002 = xmdk_t.xmdk022 AND t14.oocqent = xmdk_t.xmdkent" , 
#                " LEFT OUTER JOIN oockl_t ON oockl_t.oockl003 = xmdk_t.xmdk023 AND oockl_t.oocklent = xmdk_t.xmdkent AND oockl_t.oockl004 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t15 ON t15.oocql001 = 262 AND t15.oocql002 = xmdk_t.xmdk023 AND t15.oocqlent = xmdk_t.xmdkent AND t15.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t16 ON t16.oocql001 = 276 AND t16.oocql002 = xmdk_t.xmdk023 AND t16.oocqlent = xmdk_t.xmdkent AND t16.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oockl_t t17 ON t17.oockl003 = xmdk_t.xmdk024 AND t17.oocklent = xmdk_t.xmdkent AND t17.oockl004 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t18 ON t18.oocql001 = 262 AND t18.oocql002 = xmdk_t.xmdk024 AND t18.oocqlent = xmdk_t.xmdkent AND t18.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t19 ON t19.oocql001 = 276 AND t19.oocql002 = xmdk_t.xmdk024 AND t19.oocqlent = xmdk_t.xmdkent AND t19.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN xmaol_t ON xmaol_t.xmaol001 = xmdk_t.xmdk007 AND xmaol_t.xmaol002 = xmdk_t.xmdk027 AND xmaol_t.xmaolent = xmdk_t.xmdkent AND xmaol_t.xmaol003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN ooef_t ON ooef_t.ooef001 = xmdk_t.xmdksite AND ooef_t.ooefent = xmdk_t.xmdkent",
#                " LEFT OUTER JOIN oodbl_t ON oodbl_t.oodbl001 = ooef_t.ooef019 AND oodbl_t.oodbl002 = xmdk_t.xmdk012 AND oodbl_t.oodblent = xmdk_t.xmdkent AND oodbl_t.oodbl003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN isacl_t ON isacl_t.isacl001 = ooef_t.ooef019 AND isacl_t.isacl002 = xmdk_t.xmdk015 AND isacl_t.isaclent = xmdk_t.xmdkent AND isacl_t.isacl003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN ooail_t ON ooail_t.ooail001 = xmdk_t.xmdk016 AND ooail_t.ooailent = xmdk_t.xmdkent AND ooail_t.ooail002= '",
#   g_dlang,"'" ," LEFT OUTER JOIN xmahl_t ON xmahl_t.xmahl001 = xmdk_t.xmdk018 AND xmahl_t.xmahlent = xmdk_t.xmdkent AND xmahl_t.xmahl002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN ooidl_t ON ooidl_t.ooidl001 = xmdk_t.xmdk019 AND ooidl_t.ooidlent = xmdk_t.xmdkent AND ooidl_t.ooidl002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t20 ON t20.oocql001 = 295 AND t20.oocql002 = xmdk_t.xmdk031 AND t20.oocqlent = xmdk_t.xmdkent AND t20.oocql003 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t21 ON t21.oocql001 = 209 AND t21.oocql002 = xmdk_t.xmdk033 AND t21.oocqlent = xmdk_t.xmdkent AND t21.oocql003 = '" , 
#   g_dlang,"'" ,"LEFT OUTER JOIN pmaa_t t22 ON t22.pmaa001 = xmdk_t.xmdk007 AND t22.pmaaent = xmdk_t.xmdkent AND t22.pmaa002 IN ('2','3') ",
#                " LEFT OUTER JOIN oocql_t t23 ON t23.oocql001 = 283 AND t23.oocql002 = t22.pmaa091 AND t23.oocqlent = t22.pmaaent AND t23.oocql003 = '" , 
#   g_dlang,"'" ,
#                " LEFT OUTER JOIN xmel_t g6 ON g6.xmel005 = xmdk_t.xmdkdocno AND g6.xmelent = xmdk_t.xmdkent",
#                " LEFT OUTER JOIN xmel_t g7 ON g7.xmel005 = xmdk_t.xmdk005 AND g7.xmelent = xmdk_t.xmdkent",
#                " LEFT OUTER JOIN xmdo_t g8 ON g8.xmdo005 = xmdk_t.xmdkdocno AND g8.xmdoent = xmdk_t.xmdkent",
#                " LEFT OUTER JOIN xmdo_t g9 ON g9.xmdo005 = xmdk_t.xmdk005 AND g9.xmdoent = xmdk_t.xmdkent",
#                " LEFT OUTER JOIN (",
#                " SELECT xmdlent,xmdldocno,xmdlseq,xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,",
#                "        xmdl006,xmdl007,xmdl008,xmdl009,",
#                "        xmdl013,xmdl014,xmdl015,xmdl016,xmdl017,xmdl018,xmdl019,xmdl020,",
#                "        xmdl021,xmdl022,xmdl023,xmdl024,xmdl027,xmdl028,xmdl030,",
#                "        xmdl031,xmdl032,xmdl033,xmdl035,xmdl036,xmdl037,",
#                "        xmdl041,xmdl050,xmdl051,xmdl052,xmdl056,",
#                "xmda033,g10.gzcbl004 xmdl007_desc,imaa009,rtaxl003,inayl003,inab003,",
#                "imaal_t.imaal003 imaal_t_imaal003,imaal_t.imaal004 imaal_t_imaal004,",              
#                "imaa126,t41.oocql004 imaa126_desc,imaa127,t42.oocql004 imaa127_desc,",
#                "imaa131,t43.oocql004 imaa131_desc,imaa128,t44.oocql004 imaa128_desc,",
#                "imaa129,t45.oocql004 imaa129_desc,imaa132,t46.oocql004 imaa132_desc,",
#                "imaa133,t47.oocql004 imaa133_desc,imaa134,t48.oocql004 imaa134_desc,",
#                "imaa135,t49.oocql004 imaa135_desc,imaa136,t50.oocql004 imaa136_desc,",
#                "imaa137,t51.oocql004 imaa137_desc,imaa138,t52.oocql004 imaa138_desc,",
#                "imaa139,t53.oocql004 imaa139_desc,imaa140,t54.oocql004 imaa140_desc,",
#                "imaa141,t55.oocql004 imaa141_desc,imaa003,t56.oocql004 imaa003_desc,",
#                "imaf051,t31.oocql004 imaf051_desc,imaf111,t32.oocql004 imaf111_desc,",
#                "imaf141,t33.oocql004 imaf141_desc,imae011,t34.oocql004 imae011_desc,",
#                "imae111,t35.oocql004 imae111_desc,imag011,t36.oocql004 imag011_desc,",
#                "pjbal003,pjbbl004,pjbml004,t37.oocql004 xmdl050_desc",
#                " FROM xmdl_t",
#                " LEFT OUTER JOIN xmda_t ON xmda_t.xmdadocno = xmdl_t.xmdl003 AND xmda_t.xmdaent = xmdl_t.xmdlent",
#                " LEFT OUTER JOIN gzcbl_t g10 ON g10.gzcbl001 = 2055 AND g10.gzcbl002 = xmdl_t.xmdl007 AND g10.gzcbl003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN imaa_t ON imaa_t.imaa001 = xmdl_t.xmdl008 AND imaa_t.imaaent = xmdl_t.xmdlent",
#                " LEFT OUTER JOIN rtaxl_t ON rtaxl_t.rtaxlent = imaa_t.imaaent AND rtaxl_t.rtaxl001 = imaa_t.imaa009 AND rtaxl_t.rtaxl002 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN inayl_t t11 ON t11.inayl001 = xmdl_t.xmdl014 AND t11.inaylent = xmdl_t.xmdlent AND t11.inayl002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN inab_t ON inab_t.inabsite = xmdl_t.xmdlsite AND inab_t.inab001 = xmdl_t.xmdl014 AND inab_t.inab002 = xmdl_t.xmdl015 AND inab_t.inabent = xmdl_t.xmdlent",
#                " LEFT OUTER JOIN imaal_t ON imaal_t.imaal001 = xmdl_t.xmdl008 AND imaal_t.imaalent = xmdl_t.xmdlent AND imaal_t.imaal002 = '" , 
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t41 ON t41.oocql002 = imaa_t.imaa126 AND t41.oocql001 = 2002 AND t41.oocqlent = imaa_t.imaaent AND t41.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t42 ON t42.oocql002 = imaa_t.imaa127 AND t42.oocql001 = 2003 AND t42.oocqlent = imaa_t.imaaent AND t42.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t43 ON t43.oocql002 = imaa_t.imaa131 AND t43.oocql001 = 2001 AND t43.oocqlent = imaa_t.imaaent AND t43.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t44 ON t44.oocql002 = imaa_t.imaa128 AND t44.oocql001 = 2004 AND t44.oocqlent = imaa_t.imaaent AND t44.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t45 ON t45.oocql002 = imaa_t.imaa129 AND t45.oocql001 = 2005 AND t45.oocqlent = imaa_t.imaaent AND t45.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t46 ON t46.oocql002 = imaa_t.imaa132 AND t46.oocql001 = 2006 AND t46.oocqlent = imaa_t.imaaent AND t46.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t47 ON t47.oocql002 = imaa_t.imaa133 AND t47.oocql001 = 2007 AND t47.oocqlent = imaa_t.imaaent AND t47.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t48 ON t48.oocql002 = imaa_t.imaa134 AND t48.oocql001 = 2008 AND t48.oocqlent = imaa_t.imaaent AND t48.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t49 ON t49.oocql002 = imaa_t.imaa135 AND t49.oocql001 = 2009 AND t49.oocqlent = imaa_t.imaaent AND t49.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t50 ON t50.oocql002 = imaa_t.imaa136 AND t50.oocql001 = 2010 AND t50.oocqlent = imaa_t.imaaent AND t50.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t51 ON t51.oocql002 = imaa_t.imaa137 AND t51.oocql001 = 2011 AND t51.oocqlent = imaa_t.imaaent AND t51.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t52 ON t52.oocql002 = imaa_t.imaa138 AND t52.oocql001 = 2012 AND t52.oocqlent = imaa_t.imaaent AND t52.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t53 ON t53.oocql002 = imaa_t.imaa139 AND t53.oocql001 = 2013 AND t53.oocqlent = imaa_t.imaaent AND t53.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t54 ON t54.oocql002 = imaa_t.imaa140 AND t54.oocql001 = 2014 AND t54.oocqlent = imaa_t.imaaent AND t54.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t55 ON t55.oocql002 = imaa_t.imaa141 AND t55.oocql001 = 2015 AND t55.oocqlent = imaa_t.imaaent AND t55.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t56 ON t56.oocql002 = imaa_t.imaa003 AND t56.oocql001 = 200  AND t56.oocqlent = imaa_t.imaaent AND t56.oocql003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN imaf_t ON imaf_t.imaf001 = xmdl_t.xmdl008 AND imaf_t.imafent = xmdl_t.xmdlent AND imaf_t.imafsite = '" , 
#   g_site,"'"  ," LEFT OUTER JOIN oocql_t t31 ON t31.oocqlent = imaf_t.imafent AND t31.oocql001 = 201 AND t31.oocql002 = imaf_t.imaf051 AND t31.oocql003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t32 ON t32.oocqlent = imaf_t.imafent AND t32.oocql001 = 202 AND t32.oocql002 = imaf_t.imaf111 AND t32.oocql003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t33 ON t33.oocqlent = imaf_t.imafent AND t33.oocql001 = 203 AND t33.oocql002 = imaf_t.imaf141 AND t33.oocql003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN imae_t ON imae_t.imae001 = xmdl_t.xmdl008 AND imae_t.imaeent = xmdl_t.xmdlent AND imae_t.imaesite = '" , 
#   g_site,"'"  ," LEFT OUTER JOIN oocql_t t34 ON t34.oocqlent = imae_t.imaeent AND t34.oocql001 = 204 AND t34.oocql002 = imae_t.imae011 AND t34.oocql003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t35 ON t35.oocqlent = imae_t.imaeent AND t35.oocql001 = 205 AND t35.oocql002 = imae_t.imae111 AND t35.oocql003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN ooef_t ON ooef_t.ooef001 =xmdl_t.xmdlsite AND ooef_t.ooefent = xmdl_t.xmdlent" ,
#                " LEFT OUTER JOIN imag_t ON imag_t.imag001 = xmdl_t.xmdl008 AND imag_t.imagsite = ooef_t.ooef017 AND imag_t.imagent = xmdl_t.xmdlent",                
#                " LEFT OUTER JOIN oocql_t t36 ON t36.oocqlent = imag_t.imagent AND t36.oocql001 = 206 AND t36.oocql002 = imag_t.imag011 AND t36.oocql003 = '",
#   g_dlang,"'" ," LEFT OUTER JOIN pjbal_t ON pjbal_t.pjbal001 = xmdl_t.xmdl030 AND pjbal_t.pjbalent = xmdl_t.xmdlent AND pjbal_t.pjbal002 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN pjbbl_t ON pjbbl_t.pjbbl001 = xmdl_t.xmdl030 AND pjbbl_t.pjbbl002 = xmdl_t.xmdl031 AND pjbbl_t.pjbblent = xmdl_t.xmdlent AND pjbbl_t.pjbbl003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN pjbml_t ON pjbml_t.pjbml001 = xmdl_t.xmdl030 AND pjbml_t.pjbml002 = xmdl_t.xmdl032 AND pjbml_t.pjbmlent = xmdl_t.xmdlent AND pjbml_t.pjbml003 = '" ,
#   g_dlang,"'" ," LEFT OUTER JOIN oocql_t t37 ON t37.oocql001 = (SELECT gzcb004 FROM gzcb_t WHERE gzcb001 = '24' AND gzcb002 = 'axmt540') AND t37.oocql002 = xmdl_t.xmdl050 AND t37.oocqlent = xmdl_t.xmdlent AND t37.oocql003 = '",
#   g_dlang,"' ) x ON xmdk_t.xmdkent = x.xmdlent AND xmdk_t.xmdkdocno = x.xmdldocno"
#160411-00027 by whitney mark end
   #160411-00027 by whitney add start
   LET g_from = " FROM xmdk_t LEFT OUTER JOIN OOBA_T ON OOBAENT=XMDKENT AND OOBA002= SUBSTR (xmdkdocno, 4, 3) ",
                " ,xmdl_t ",
                " LEFT JOIN xmda_t ON xmdadocno = xmdl003 AND xmdaent = xmdlent",   #171108-00064#1 add
                " LEFT JOIN (SELECT imaaent,imaa001,imaa009,rtaxl003,imaa127,oocql004,imaa_t.imaa134 FROM imaa_t ",#20200819 add imaa_t.imaa134 by jiyan
                " LEFT JOIN rtaxl_t ON rtaxlent=imaaent AND rtaxl001=imaa009 AND rtaxl002='"||g_dlang||"' ",
                " LEFT JOIN oocql_t ON oocqlent=imaaent AND oocql001='2003' AND oocql002=imaa127 AND oocql003='"||g_dlang||"') t1 ",
                "   ON t1.imaaent=xmdlent AND t1.imaa001=xmdl008 ",
                " LEFT JOIN (SELECT imafent,imafsite,imaf001,imaf111,oocql004 FROM imaf_t ",        
                " LEFT JOIN oocql_t ON oocqlent=imafent AND oocql001='202' AND oocql002=imaf111 AND oocql003='"||g_dlang||"') t2 ",
                "   ON t2.imafent=xmdlent AND t2.imafsite=xmdlsite AND t2.imaf001=xmdl008 ",
                " LEFT JOIN imaal_t t3 ON t3.imaalent=xmdlent AND t3.imaal001=xmdl008 AND t3.imaal002='"||g_dlang||"' "
                 
                
              
   #160411-00027 by whitney add end
#   #end add-point
#    LET g_from = " FROM xmdk_t LEFT OUTER JOIN ( SELECT xmdl_t.*,( SELECT imaal003 FROM imaal_t WHERE imaal_t.imaal001 = xmdl_t.xmdl008 AND imaal_t.imaalent = xmdl_t.xmdlent AND imaal_t.imaal002 = '" , 
#        g_dlang,"'" ,") imaal_t_imaal003,( SELECT imaal004 FROM imaal_t WHERE imaal_t.imaal001 = xmdl_t.xmdl008 AND imaal_t.imaalent = xmdl_t.xmdlent AND imaal_t.imaal002 = '" , 
#        g_dlang,"'" ,") imaal_t_imaal004 FROM xmdl_t ) x  ON xmdk_t.xmdkent = x.xmdlent AND xmdk_t.xmdkdocno  
#        = x.xmdldocno"
# 
#   #add-point:sel_prep g_where name="sel_prep.g_where"
   #160411-00027 by whitney add start
   LET g_where = " WHERE xmdkent = ",g_enterprise,
                 "   AND xmdlent = xmdkent ",
                 "   AND xmdldocno = xmdkdocno ",
                 "   AND ",tm.wc CLIPPED
   #160411-00027 by whitney add end
#   #end add-point
#    LET g_where = " WHERE " ,tm.wc CLIPPED
# 
#   #add-point:sel_prep g_order name="sel_prep.g_order"
   
   #end add-point
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
   
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("xmdk_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   
   #end add-point
   PREPARE axmr005_x02_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code = STATUS
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET g_rep_success = 'N' 
   END IF
   DECLARE axmr005_x02_curs CURSOR FOR axmr005_x02_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="axmr005_x02.ins_data" readonly="Y" type="s" >}
PRIVATE FUNCTION axmr005_x02_ins_data()
DEFINE sr RECORD 
   l_xmdk LIKE type_t.chr200, 
   xmdkent LIKE xmdk_t.xmdkent, 
   xmdksite LIKE xmdk_t.xmdksite, 
   xmdkunit LIKE xmdk_t.xmdkunit, 
   xmdkdocno LIKE xmdk_t.xmdkdocno, 
   xmdkdocdt LIKE xmdk_t.xmdkdocdt, 
   xmdk001 LIKE xmdk_t.xmdk001, 
   xmdk026 LIKE xmdk_t.xmdk026, 
   xmdk002 LIKE xmdk_t.xmdk002, 
   l_xmdk002_desc LIKE type_t.chr100, 
   xmdkstus LIKE xmdk_t.xmdkstus, 
   l_xmdkstus_desc LIKE type_t.chr100, 
   xmdk003 LIKE xmdk_t.xmdk003, 
   l_xmdk003_desc LIKE type_t.chr100, 
   xmdk004 LIKE xmdk_t.xmdk004, 
   l_xmdk004_desc LIKE type_t.chr100, 
   xmdk007 LIKE xmdk_t.xmdk007, 
   l_xmdk007_desc LIKE type_t.chr100, 
   xmdk009 LIKE xmdk_t.xmdk009, 
   l_xmdk009_desc LIKE type_t.chr100, 
   xmdk008 LIKE xmdk_t.xmdk008, 
   l_xmdk008_desc LIKE type_t.chr100, 
   xmdlseq LIKE xmdl_t.xmdlseq, 
   xmdl003 LIKE xmdl_t.xmdl003, 
   xmdl004 LIKE xmdl_t.xmdl004, 
   xmdl005 LIKE xmdl_t.xmdl005, 
   xmdl006 LIKE xmdl_t.xmdl006, 
   xmdk005 LIKE xmdk_t.xmdk005, 
   l_xmda033 LIKE type_t.chr20, 
   xmdl007 LIKE xmdl_t.xmdl007, 
   l_xmdl007_desc LIKE type_t.chr100, 
   l_imaa009 LIKE imaa_t.imaa009, 
   l_imaa009_rtaxl003 LIKE rtaxl_t.rtaxl003, 
   l_imaf111 LIKE imaf_t.imaf111, 
   l_imaf111_oocql004 LIKE oocql_t.oocql004, 
   xmdl008 LIKE xmdl_t.xmdl008, 
   x_imaal_t_imaal003 LIKE imaal_t.imaal003, 
   x_imaal_t_imaal004 LIKE imaal_t.imaal004, 
   xmdl009 LIKE xmdl_t.xmdl009, 
   l_xmdl009_desc LIKE type_t.chr30, 
   xmdl018 LIKE xmdl_t.xmdl018, 
   xmdl017 LIKE xmdl_t.xmdl017, 
   xmdl035 LIKE xmdl_t.xmdl035, 
   xmdl036 LIKE xmdl_t.xmdl036, 
   l_qty_1 LIKE type_t.num20_6, 
   xmdl014 LIKE xmdl_t.xmdl014, 
   l_xmdl014_desc LIKE type_t.chr100, 
   xmdl015 LIKE xmdl_t.xmdl015, 
   l_xmdl015_desc LIKE type_t.chr100, 
   xmdl016 LIKE xmdl_t.xmdl016, 
   xmdl052 LIKE xmdl_t.xmdl052, 
   xmdl051 LIKE xmdl_t.xmdl051, 
   xmdl022 LIKE xmdl_t.xmdl022, 
   xmdl021 LIKE xmdl_t.xmdl021, 
   xmdl024 LIKE xmdl_t.xmdl024, 
   xmdl025 LIKE xmdl_t.xmdl025, 
   l_oodbl004 LIKE type_t.chr30, 
   xmdl026 LIKE xmdl_t.xmdl026, 
   xmdl027 LIKE xmdl_t.xmdl027, 
   xmdl028 LIKE xmdl_t.xmdl028, 
   xmdl013 LIKE xmdl_t.xmdl013, 
   l_imaa127 LIKE type_t.chr50, 
   l_imaa127_desc LIKE type_t.chr30, 
   xmdl029 LIKE xmdl_t.xmdl029, 
   xmdk016 LIKE xmdk_t.xmdk016, 
   xmdk017 LIKE xmdk_t.xmdk017, 
   l_xmdl027 LIKE xmdl_t.xmdl027, 
   l_xmdl028 LIKE xmdl_t.xmdl028, 
   l_xmdl029 LIKE xmdl_t.xmdl029, 
   l_imaa134 LIKE imaa_t.imaa134, 
   l_imaa134_desc LIKE type_t.chr30
 END RECORD
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"
DEFINE sr1  RECORD
    xmdm009    LIKE xmdm_t.xmdm009,
    xmdm008    LIKE xmdm_t.xmdm008,
    xmdm012    LIKE xmdm_t.xmdm012,
    xmdm013    LIKE xmdm_t.xmdm013,
    l_qty_2    LIKE xmdm_t.xmdm013,
    xmdm005         LIKE xmdm_t.xmdm005,
    l_xmdm005_desc  LIKE type_t.chr100,
    xmdm006         LIKE xmdm_t.xmdm006,
    l_xmdm006_desc  LIKE type_t.chr100,
    xmdm007    LIKE xmdm_t.xmdm007,
    xmdm033    LIKE xmdm_t.xmdm033,
    xmdmdocno  LIKE xmdm_t.xmdmdocno,
    xmdmseq    LIKE xmdm_t.xmdmseq
           END RECORD
DEFINE l_desc     LIKE type_t.chr100
DEFINE l_sql      STRING
DEFINE l_success  LIKE type_t.num5
DEFINE l_pmaa027  LIKE pmaa_t.pmaa027  #聯絡對象識別碼     dorislai-20150720-add----(S)
DEFINE l_oocq019  LIKE oocq_t.oocq019  #參考欄位
DEFINE l_gzcb004  LIKE gzcb_t.gzcb004  #系統應用欄位二     dorislai-20150720-add----(E)  
DEFINE r_pmak003  LIKE pmak_t.pmak003   #一次性交易對象名稱   #161207-00033#5 add
DEFINE l_pmaa004  LIKE pmaa_t.pmaa004   #法人類型            #161207-00033#5 add
#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    LET l_sql = " SELECT xmdm009,xmdm008,xmdm012,xmdm013,(xmdm009-xmdm012-xmdm013),xmdm005, ",
                "(SELECT inayl003 FROM inayl_t WHERE inaylent=xmdment AND inayl001=xmdm005 AND inayl002='"||g_dlang||"') inayl003, ",
                "       xmdm006, ",
                  "(SELECT inab003 FROM inab_t WHERE inabent=xmdment AND inabsite=xmdmsite AND inab001=xmdm005 AND inab002=xmdm006) inab003, ",
                "       xmdm007,xmdm033,xmdmdocno,xmdmseq ",
                "   FROM xmdm_t ",
                "  WHERE xmdment = ? ",
                "    AND xmdmdocno = ? ",
                "    AND xmdmseq = ? "
   PREPARE axmr005_x01_rep FROM l_sql
   DECLARE axmr005_x01_cur CURSOR FOR axmr005_x01_rep
   #161207-00033#5-s add
   LET l_sql = "SELECT pmaa004 FROM pmaa_t        ",
               " WHERE pmaaent ='",g_enterprise,"'",
               "   AND pmaa001 = ?                "
   PREPARE axmr005_x02_rep2 FROM l_sql
   #161207-00033#5-e add
    #end add-point
 
    LET g_rep_success = 'Y'
 
    FOREACH axmr005_x02_curs INTO sr.*                               
       IF STATUS THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = 'foreach:'
          LET g_errparam.code = STATUS
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET g_rep_success = 'N'
          EXIT FOREACH
       END IF
 
       #add-point:ins_data段foreach name="ins_data.foreach"
       #161207-00033#5-s add
       EXECUTE axmr005_x02_rep2 USING sr.xmdk007 INTO l_pmaa004
       IF l_pmaa004 = '2' THEN   #2.一次性交易對象
          #一次性交易對象全名
          CALL s_desc_axm_get_oneturn_guest_desc('3',sr.xmdkdocno)
               RETURNING r_pmak003
          
         IF NOT cl_null(r_pmak003) THEN
            LET sr.l_xmdk007_desc = r_pmak003
            IF sr.xmdk009 = sr.xmdk007 THEN   #收貨客戶
               LET sr.l_xmdk009_desc = sr.l_xmdk007_desc
            END IF
            IF sr.xmdk008 = sr.xmdk007 THEN   #收款客戶
               LET sr.l_xmdk008_desc = sr.l_xmdk007_desc
            END IF
         END IF
       END IF
       #161207-00033#5-e add 
       #當出貨單的出貨類行為'簽收訂單'時，未簽收量 = xmdl018-xmdl035-xmdl036，反之則未簽收量=0
       IF cl_null(sr.xmdl018) THEN LET sr.xmdl018 = 0 END IF
       IF cl_null(sr.xmdl035) THEN LET sr.xmdl035 = 0 END IF
       IF cl_null(sr.xmdl036) THEN LET sr.xmdl036 = 0 END IF
       IF sr.xmdk002 = '3' THEN
          LET sr.l_qty_1 = sr.xmdl018 - sr.xmdl035 - sr.xmdl036
          #選擇未簽收的只列印未簽收量（xmdl018-xmdl035-xmdl036)大於0的資料
          IF tm.chk = '1' AND sr.l_qty_1 <= 0 THEN
             CONTINUE FOREACH
          END IF
          #若是選擇已簽收則只列印未簽收量等於0的資料
          IF tm.chk = '2' AND sr.l_qty_1 > 0 THEN
             CONTINUE FOREACH
          END IF
       ELSE
          LET sr.l_qty_1 = 0
       END IF

#160411-00027 by whitney mark start
#       #add--2015/10/19 By shiun--(S)
#       SELECT xrcadocno INTO sr.l_xrcadocno
#         FROM xrca_t,xrcb_t
#        WHERE xrcaent = xrcbent
#          AND xrcadocno = xrcbdocno
#          AND xrcald = xrcbld
#          AND xrcb002 = sr.xmdkdocno
#          AND xrcb003 = sr.xmdlseq
#          AND ROWNUM = 1
#       #add--2015/10/19 By shiun--(E)
#160411-00027 by whitney mark end
#       #出貨性質
#       CALL s_desc_gzcbl004_desc('2063',sr.xmdk002) RETURNING sr.l_xmdk002_desc
#       #dorislai-20150804-add----(S)
#       LET sr.l_xmdk002desc = ''
#       IF NOT cl_null(sr.l_xmdk002_desc) THEN
#          LET sr.l_xmdk002desc = sr.xmdk002,'.',sr.l_xmdk002_desc
#       END IF
#       #dorislai-20150804-add----(E)
#       #狀態
#       CALL s_desc_gzcbl004_desc('13',sr.xmdkstus) RETURNING sr.l_xmdkstus_desc
#       #dorislai-20150804-add----(S)
#       LET sr.l_xmdkstusdesc = ''
#       IF NOT cl_null(sr.l_xmdkstus_desc) THEN
#          LET sr.l_xmdkstusdesc = sr.xmdkstus,'.',sr.l_xmdkstus_desc
#       END IF
#       #dorislai-20150804-add----(E)
#       #業務人員
#       CALL s_desc_get_person_desc(sr.xmdk003) RETURNING sr.l_xmdk003_desc
#       #dorislai-20150804-add----(S)
#       LET sr.l_xmdk003desc = ''
#       IF NOT cl_null(sr.l_xmdk003_desc) THEN
#          LET sr.l_xmdk003desc = sr.xmdk003,'.',sr.l_xmdk003_desc
#       END IF
#       #dorislai-20150804-add----(E)
#       #業務部門
#       CALL s_desc_get_department_desc(sr.xmdk004) RETURNING sr.l_xmdk004_desc
#       #dorislai-20150804-add----(S)
#       LET sr.l_xmdk004desc = ''
#       IF NOT cl_null(sr.l_xmdk004_desc) THEN
#          LET sr.l_xmdk004desc = sr.xmdk004,'.',sr.l_xmdk004_desc
#       END IF
#       #dorislai-20150804-add----(E)
#       #客戶編號
#       CALL s_desc_get_trading_partner_abbr_desc(sr.xmdk007) RETURNING sr.l_xmdk007_desc
#       #dorislai-20150728-add----(S)
#       LET sr.l_xmdk007desc = ''
#       IF NOT cl_null(sr.l_xmdk007_desc) THEN
#          LET sr.l_xmdk007desc = sr.xmdk007,'.',sr.l_xmdk007_desc
#       END IF
#       #dorislai-20150728-add----(E)
#       #收貨客戶
#       CALL s_desc_get_trading_partner_abbr_desc(sr.xmdk009) RETURNING sr.l_xmdk009_desc
#       #dorislai-20150728-add----(S)
#       LET sr.l_xmdk009desc = ''
#       IF NOT cl_null(sr.l_xmdk009_desc) THEN
#          LET sr.l_xmdk009desc = sr.xmdk009,'.',sr.l_xmdk009_desc
#       END IF
#       #dorislai-20150728-add----(E)
#       #收款客戶
#       CALL s_desc_get_trading_partner_abbr_desc(sr.xmdk008) RETURNING sr.l_xmdk008_desc
#       #dorislai-20150728-add----(S)
#       LET sr.l_xmdk008desc = ''
#       IF NOT cl_null(sr.l_xmdk008_desc) THEN
#          LET sr.l_xmdk008desc = sr.xmdk008,'.',sr.l_xmdk008_desc
#       END IF
#       #dorislai-20150728-add----(E)
#       #子件特性
#       CALL s_desc_gzcbl004_desc('2055',sr.xmdl007) RETURNING sr.l_xmdl007_desc
#       #dorislai-20150804-add----(S)
#       LET sr.l_xmdl007desc = ''
#       IF NOT cl_null(sr.l_xmdl007_desc) THEN
#          LET sr.l_xmdl007desc = sr.xmdl007,'.',sr.l_xmdl007_desc
#       END IF
#       #dorislai-20150804-add----(E)
#       #產品分類
#       SELECT imaa009 INTO sr.l_imaa009_rtaxl003 FROM imaa_t
#        WHERE imaaent = g_enterprise AND imaa001 = sr.xmdl008
#       CALL s_desc_get_rtaxl003_desc(sr.l_imaa009_rtaxl003) RETURNING sr.l_imaa009_rtaxl003
#       #銷售分群
#       SELECT imaf141 INTO sr.l_imaf111_oocql004 FROM imaf_t
#        WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = sr.xmdl008
#       CALL s_desc_gzcbl004_desc('202',sr.l_imaf111_oocql004) RETURNING sr.l_imaf111_oocql004
#       #限定庫位
#       IF NOT cl_null(sr.xmdl014) THEN
#          CALL s_desc_get_stock_desc(sr.xmdksite,sr.xmdl014) RETURNING sr.l_xmdl014_desc
#          #20150720 by dorislai add----(S)
#          LET sr.l_xmdl014desc = ''
#          IF NOT cl_null(sr.l_xmdl014_desc) THEN
#             LET sr.l_xmdl014desc = sr.xmdl014,'.',sr.l_xmdl014_desc 
#          END IF
#          #20150720 by dorislai add----(E)
#       END IF
#       #限定儲位
#       IF NOT cl_null(sr.xmdl015) THEN
#          CALL s_desc_get_locator_desc(sr.xmdksite,sr.xmdl014,sr.xmdl015) RETURNING sr.l_xmdl015_desc
#          #20150720 by dorislai add----(S)
#          LET sr.l_xmdl015desc = ''
#          IF NOT cl_null(sr.l_xmdl015_desc) THEN
#             LET sr.l_xmdl015desc = sr.xmdl015,'.',sr.l_xmdl015_desc 
#          END IF
#          #20150720 by dorislai add----(E)
#       END IF
#160411-00027 by whitney mark start
#       #產品特徵
#       CALL s_feature_description(sr.xmdl008,sr.xmdl009) RETURNING l_success,sr.l_xmdl009_desc
#160411-00027 by whitney mark end
#       #20150720 by dorislai add----(S)
#       LET sr.l_xmdl009desc = ''
#       IF NOT cl_null(sr.l_xmdl009_desc) THEN
#          LET sr.l_xmdl009desc = sr.xmdl009,'.',sr.l_xmdl009_desc 
#       END IF
#       #20150720 by dorislai add----(E)
#       #客戶訂購單號
#       SELECT xmda033 INTO sr.l_xmda033 FROM xmda_t
#        WHERE xmdaent = g_enterprise AND xmdadocno = sr.xmdl003
#
#       #dorislai-20150720-add----(S)
#       #銷售通路
#       LET sr.l_xmdk030_desc = ''
#       LET sr.l_xmdk030desc = ''
#       CALL s_desc_get_acc_desc('275',sr.xmdk030) RETURNING sr.l_xmdk030_desc
#       IF NOT cl_null(sr.l_xmdk030_desc) THEN
#          LET sr.l_xmdk030desc = sr.xmdk030,'.',sr.l_xmdk030_desc
#       END IF
#       #留置原因
#       LET sr.l_xmdk034_desc = ''
#       LET sr.l_xmdk034desc = ''
#       CALL s_desc_get_acc_desc('297',sr.xmdk034) RETURNING sr.l_xmdk034_desc
#       IF NOT cl_null(sr.l_xmdk034_desc) THEN
#          LET sr.l_xmdk034desc = sr.xmdk034,'.',sr.l_xmdk034_desc
#       END IF
#       #在途成本庫位       
#       LET sr.l_xmdk039_desc = ''
#       LET sr.l_xmdk039desc = ''
#       CALL s_desc_get_stock_desc(g_site,sr.xmdk039) RETURNING sr.l_xmdk039_desc
#       IF NOT cl_null(sr.l_xmdk039_desc) THEN
#          LET sr.l_xmdk039desc = sr.xmdk039,'.',sr.l_xmdk039_desc
#       END IF
#       #在途非成本庫位       
#       LET sr.l_xmdk040_desc = ''
#       LET sr.l_xmdk040desc = ''       
#       CALL s_desc_get_stock_desc(g_site,sr.xmdk040) RETURNING sr.l_xmdk040_desc
#       IF NOT cl_null(sr.l_xmdk040_desc) THEN
#          LET sr.l_xmdk040desc = sr.xmdk040,'.',sr.l_xmdk040_desc
#       END IF
#       #發票客戶
#       LET sr.l_xmdk202_desc = ''	
#       LET sr.l_xmdk202desc = ''
#       CALL s_desc_get_trading_partner_abbr_desc(sr.xmdk202) RETURNING sr.l_xmdk202_desc
#       IF NOT cl_null(sr.l_xmdk202_desc) THEN
#          LET sr.l_xmdk202desc = sr.xmdk202,'.',sr.l_xmdk202_desc
#       END IF
#       #送貨供應商
#       LET sr.l_xmdk020_desc = ''	
#       LET sr.l_xmdk020desc = ''
#       CALL s_desc_get_trading_partner_full_desc(sr.xmdk020) RETURNING sr.l_xmdk020_desc
#       IF NOT cl_null(sr.l_xmdk020_desc) THEN
#          LET sr.l_xmdk020desc = sr.xmdk020,'.',sr.l_xmdk020_desc
#       END IF
#       #送貨地址類型
#       LET sr.l_xmdk021_desc = ''
#       LET sr.l_xmdk021desc = ''       
#       CALL s_axmt500_get_pmaa027(sr.xmdk009) RETURNING l_pmaa027
#       SELECT oofb011 INTO sr.l_xmdk021_desc FROM oofb_t 
#       WHERE oofbent = g_enterprise AND oofb002 = l_pmaa027
#         AND oofbstus = 'Y' AND oofb019 = sr.xmdk021
#       IF NOT cl_null(sr.l_xmdk021_desc) THEN
#          LET sr.l_xmdk021desc = sr.xmdk021,'.',sr.l_xmdk021_desc
#       END IF
#160411-00027 by whitney mark start
#       #送貨地址      
#       LET sr.l_address = ''	
#       CALL s_aooi350_get_address(l_pmaa027,sr.xmdk021,g_dlang) RETURNING l_success,sr.l_address
#       IF NOT l_success THEN
#          LET sr.l_address = ''
#       END IF 
#160411-00027 by whitney mark end
#       #運輸方式
#       LET sr.l_xmdk022_desc = ''	
#       LET sr.l_xmdk022desc = ''
#       CALL s_desc_get_acc_desc('263',sr.xmdk022) RETURNING sr.l_xmdk022_desc
#       IF NOT cl_null(sr.l_xmdk022_desc) THEN
#          LET sr.l_xmdk022desc = sr.xmdk022,'.',sr.l_xmdk022_desc
#       END IF
#       #起運地
#       LET sr.l_xmdk023_desc = ''	
#       LET sr.l_xmdk023desc = ''       
#       SELECT oocq019 INTO l_oocq019
#         FROM oocq_t
#        WHERE oocqent = g_enterprise
#          AND oocq001 = '263'
#          AND oocq002 = sr.xmdk022
#
#       CASE
#          WHEN l_oocq019 = '1' OR l_oocq019 = '4 '#1:陸運、4:其他           
#             SELECT oockl005 INTO sr.l_xmdk023_desc FROM oockl_t
#              WHERE oocklent = g_enterprise AND oockl003 = sr.xmdk023
#                AND oockl004 = g_dlang
#              ORDER BY oockl001,oockl002
#              
#          WHEN l_oocq019 = '2'     #海運
#             SELECT oocql004 INTO sr.l_xmdk023_desc FROM oocql_t 
#              WHERE oocqlent = g_enterprise AND oocql001 = '262' 
#                AND oocql002 = sr.xmdk023 AND oocql003 = g_dlang                                         
#       
#          WHEN l_oocq019 = '3'     #空運
#             SELECT oocql004 INTO sr.l_xmdk023_desc FROM oocql_t 
#              WHERE oocqlent = g_enterprise AND oocql001 = '276' 
#                AND oocql002 = sr.xmdk023 AND oocql003 = g_dlang
#               
#       END CASE
#       IF NOT cl_null(sr.l_xmdk023_desc) THEN
#          LET sr.l_xmdk023desc = sr.xmdk023,'.',sr.l_xmdk023_desc
#       END IF
#       #目的地
#       LET sr.l_xmdk024_desc = ''
#       LET sr.l_xmdk024desc = ''
#       SELECT oocq019 INTO l_oocq019
#         FROM oocq_t
#        WHERE oocqent = g_enterprise
#          AND oocq001 = '263'
#          AND oocq002 = sr.xmdk022
#
#       CASE
#          WHEN l_oocq019 = '1' OR l_oocq019 = '4 '#1:陸運、4:其他           
#             SELECT oockl005 INTO sr.l_xmdk024_desc FROM oockl_t
#              WHERE oocklent = g_enterprise AND oockl003 = sr.xmdk024
#                AND oockl004 = g_dlang
#              ORDER BY oockl001,oockl002
#              
#          WHEN l_oocq019 = '2'     #海運
#             SELECT oocql004 INTO sr.l_xmdk024_desc FROM oocql_t 
#              WHERE oocqlent = g_enterprise AND oocql001 = '262' 
#                AND oocql002 = sr.xmdk024 AND oocql003 = g_dlang                                         
#       
#          WHEN l_oocq019 = '3'     #空運
#             SELECT oocql004 INTO sr.l_xmdk024_desc FROM oocql_t 
#              WHERE oocqlent = g_enterprise AND oocql001 = '276' 
#                AND oocql002 = sr.xmdk024 AND oocql003 = g_dlang            
#       END CASE
#       IF NOT cl_null(sr.l_xmdk024_desc) THEN
#          LET sr.l_xmdk024desc = sr.xmdk024,'.',sr.l_xmdk024_desc
#       END IF
#       #嘜頭編號
#       LET sr.l_xmdk027_desc = ''	
#       LET sr.l_xmdk027desc = ''
#       SELECT xmaol004 INTO sr.l_xmdk027_desc FROM xmaol_t 
#        WHERE xmaolent = g_enterprise AND xmaol001 = r.xmdk007 
#          AND xmaol002 = r.xmdk027 AND xmaol003 = g_dlang
#       IF NOT cl_null(sr.l_xmdk024_desc) THEN
#          LET sr.l_xmdk027desc = sr.xmdk027,'.',sr.l_xmdk027_desc
#       END IF
#       #運輸狀態
#       LET sr.l_xmdk038_desc = ''
#       LET sr.l_xmdk038desc = ''       
#       CALL s_desc_get_acc_desc('299',sr.xmdk038) RETURNING sr.l_xmdk038_desc
#       IF NOT cl_null(sr.l_xmdk038_desc) THEN
#          LET sr.l_xmdk038desc = sr.xmdk038,'.',sr.l_xmdk038_desc
#       END IF
#       #收款條件
#       LET sr.l_xmdk010_desc = ''	
#       LET sr.l_xmdk010desc = ''
#       CALL s_desc_get_ooib002_desc(sr.xmdk010) RETURNING sr.l_xmdk010_desc
#       IF NOT cl_null(sr.l_xmdk010_desc) THEN
#          LET sr.l_xmdk010desc = sr.xmdk010,'.',sr.l_xmdk010_desc
#       END IF
#       #交易條件
#       LET sr.l_xmdk011_desc = ''
#       LET sr.l_xmdk011desc = ''       
#       CALL s_desc_get_acc_desc('238',sr.xmdk011) RETURNING sr.l_xmdk011_desc
#       IF NOT cl_null(sr.l_xmdk011_desc) THEN
#          LET sr.l_xmdk011desc = sr.xmdk011,'.',sr.l_xmdk011_desc
#       END IF
#       #稅別
#       LET sr.l_xmdk012_desc = ''	
#       LET sr.l_xmdk012desc = ''
#       CALL s_desc_get_tax_desc1(g_site,sr.xmdk012) RETURNING sr.l_xmdk012_desc
#       IF NOT cl_null(sr.l_xmdk012_desc) THEN
#          LET sr.l_xmdk012desc = sr.xmdk012,'.',sr.l_xmdk012_desc
#       END IF
#       #發票類型
#       LET sr.l_xmdk015_desc = ''	
#       LET sr.l_xmdk015desc = ''
#       CALL s_desc_get_invoice_type_desc1(g_site,sr.xmdk015) RETURNING sr.l_xmdk015_desc
#       IF NOT cl_null(sr.l_xmdk015_desc) THEN
#          LET sr.l_xmdk015desc = sr.xmdk015,'.',sr.l_xmdk015_desc
#       END IF
#       #幣別
#       LET sr.l_xmdk016_desc = ''	
#       LET sr.l_xmdk016desc = ''
#       CALL s_desc_get_currency_desc(sr.xmdk016) RETURNING sr.l_xmdk016_desc
#       IF NOT cl_null(sr.l_xmdk016_desc) THEN
#          LET sr.l_xmdk016desc = sr.xmdk016,'.',sr.l_xmdk016_desc
#       END IF
#       #取價方式
#       LET sr.l_xmdk018_desc = ''	
#       LET sr.l_xmdk018desc = ''	
#       SELECT xmahl003 INTO sr.l_xmdk018_desc FROM xmahl_t 
#        WHERE xmahlent = g_enterprise AND xmahl001 = sr.xmdk018 AND xmahl002 = g_dlang
#       IF NOT cl_null(sr.l_xmdk018_desc) THEN
#          LET sr.l_xmdk018desc = sr.xmdk018,'.',sr.l_xmdk018_desc
#       END IF
#       #優惠條件
#       LET sr.l_xmdk019_desc = ''	
#       LET sr.l_xmdk019desc = ''	
#       CALL s_desc_ooid001_desc(sr.xmdk019) RETURNING sr.l_xmdk019_desc
#       IF NOT cl_null(sr.l_xmdk019_desc) THEN
#          LET sr.l_xmdk019desc = sr.xmdk019,'.',sr.l_xmdk019_desc
#       END IF
#       #銷售分類
#       LET sr.l_xmdk031_desc = ''	
#       LET sr.l_xmdk031desc = ''	
#       CALL s_desc_get_acc_desc('295',sr.xmdk031) RETURNING sr.l_xmdk031_desc
#       IF NOT cl_null(sr.l_xmdk031_desc) THEN
#          LET sr.l_xmdk031desc = sr.xmdk031,'.',sr.l_xmdk031_desc
#       END IF
#       #額外品名規格
#       LET sr.l_xmdk033_desc = ''	
#       LET sr.l_xmdk033desc = ''
#       CALL s_desc_get_acc_desc('209',sr.xmdk033) RETURNING sr.l_xmdk033_desc
#       IF NOT cl_null(sr.l_xmdk033_desc) THEN
#          LET sr.l_xmdk033desc = sr.xmdk033,'.',sr.l_xmdk033_desc
#       END IF
#       #專案編號
#       LET sr.l_xmdl030_desc = ''	
#       LET sr.l_xmdl030desc = ''	
#       CALL s_desc_get_project_desc(sr.xmdl030) RETURNING sr.l_xmdl030_desc
#       IF NOT cl_null(sr.l_xmdl030_desc) THEN
#          LET sr.l_xmdl030desc = sr.xmdl030,'.',sr.l_xmdl030_desc
#       END IF
#       #WBS編號
#       LET sr.l_xmdl031_desc = ''	
#       LET sr.l_xmdl031desc = ''
#       CALL s_desc_get_wbs_desc(sr.xmdl030,sr.xmdl031) RETURNING sr.l_xmdl031_desc
#       IF NOT cl_null(sr.l_xmdl031_desc) THEN
#          LET sr.l_xmdl031desc = sr.xmdl031,'.',sr.l_xmdl031_desc
#       END IF
#       #活動編號
#       LET sr.l_xmdl032_desc = ''
#       LET sr.l_xmdl032desc = ''       
#       CALL s_desc_get_activity_desc(sr.xmdl030,sr.xmdl032) RETURNING sr.l_xmdl032_desc
#       IF NOT cl_null(sr.l_xmdl032_desc) THEN
#          LET sr.l_xmdl032desc = sr.xmdl032,'.',sr.l_xmdl032_desc
#       END IF
#       #理由碼	
#       LET l_gzcb004 = ''
#       SELECT gzcb004 INTO l_gzcb004 FROM gzcb_t
#        WHERE gzcb001 = '24' AND gzcb002 = 'axmt540'
#       LET sr.l_xmdl050_desc = ''  
#       LET sr.l_xmdl050desc = ''       
#       SELECT oocql004 INTO sr.l_xmdl050_desc FROM oocql_t 
#        WHERE oocqlent = g_enterprise AND oocql001 = l_gzcb004 
#          AND oocql002 = sr.xmdl050 AND oocql003 = g_dlang
#       IF NOT cl_null(sr.l_xmdl050_desc) THEN
#          LET sr.l_xmdl050desc = sr.xmdl050,'.',sr.l_xmdl050_desc
#       END IF
#       #出貨單號全名
#       LET sr.l_xmdkdocno_desc = ''
#       LET sr.l_xmdkdocnodesc = ''
#       CALL s_aooi200_get_slip_desc(sr.xmdkdocno) RETURNING sr.l_xmdkdocno_desc
#       IF NOT cl_null(sr.l_xmdkdocno_desc) THEN
#          LET sr.l_xmdkdocnodesc = sr.xmdkdocno,'.',sr.l_xmdkdocno_desc
#       END IF
#       #多角性質全名
#       LET sr.l_xmdk045_desc = '' 
#       LET sr.l_xmdk045desc = ''
#       CALL s_desc_gzcbl004_desc('2064',sr.xmdk045) RETURNING sr.l_xmdk045_desc
#       IF NOT cl_null(sr.l_xmdk045_desc) THEN
#          LET sr.l_xmdk045desc = sr.xmdk045,'.',sr.l_xmdk045_desc
#       END IF
#       #內外銷全名
#       LET sr.l_xmdk042_desc = ''
#       LET sr.l_xmdk042desc = ''
#       CALL s_desc_gzcbl004_desc('2085',sr.xmdk042) RETURNING sr.l_xmdk042_desc
#       IF NOT cl_null(sr.l_xmdk042_desc) THEN
#          LET sr.l_xmdk042_desc = sr.xmdk042,'.',sr.l_xmdk042_desc
#       END IF
#       #匯率計算基準全名
#       LET sr.l_xmdk043_desc = ''
#       LET sr.l_xmdk043desc = ''
#       CALL s_desc_gzcbl004_desc('2084',sr.xmdk043) RETURNING sr.l_xmdk043_desc
#       IF NOT cl_null(sr.l_xmdk043_desc) THEN
#          LET sr.l_xmdk043_desc = sr.xmdk043,'.',sr.l_xmdk043_desc
#       END IF 
#       #系列
#       LET sr.l_imaa127_desc = ''
#       LET sr.l_imaa127desc = ''
#          #用料號抓取系列
#       SELECT imaa127 INTO sr.l_imaa127 FROM imaa_t
#        WHERE imaa001 = sr.xmdl008
#          AND imaaent = g_enterprise
#         #抓取系列說明
#       CALL s_desc_get_acc_desc('2003',sr.l_imaa127)  RETURNING sr.l_imaa127_desc   
#       IF NOT cl_null(sr.l_imaa127_desc) THEN
#          LET sr.l_imaa127desc = sr.l_imaa127,'.',sr.l_imaa127_desc 
#       END IF
       #dorislai-20150720-add----(E)

      #150908 sarah add -----(S)
#       #將料件主檔中統計分類那個頁籤的欄位通通拉進來(成份不抓),還有各種分群也拉進來
#       LET sr.l_imaa126desc = ''  LET sr.l_imaa127desc = ''  LET sr.l_imaa131desc = ''
#       LET sr.l_imaa128desc = ''  LET sr.l_imaa129desc = ''  LET sr.l_imaa132desc = ''  
#       LET sr.l_imaa133desc = ''  LET sr.l_imaa134desc = ''  LET sr.l_imaa135desc = ''
#       LET sr.l_imaa136desc = ''  LET sr.l_imaa137desc = ''  LET sr.l_imaa138desc = ''
#       LET sr.l_imaa139desc = ''  LET sr.l_imaa140desc = ''  LET sr.l_imaa141desc = ''
#       LET sr.l_imaa003desc = ''  LET sr.l_imaf051desc = ''  LET sr.l_imaf111desc = ''
#       LET sr.l_imaf141desc = ''  LET sr.l_imae011desc = ''  LET sr.l_imae111desc = ''
#       LET sr.l_imag011desc = ''
#       SELECT trim(imaa126)||'.'||trim(t1.oocql004),trim(imaa127)||'.'||trim(t2.oocql004),
#              trim(imaa131)||'.'||trim(t3.oocql004),trim(imaa128)||'.'||trim(t4.oocql004),
#              trim(imaa129)||'.'||trim(t5.oocql004),trim(imaa132)||'.'||trim(t6.oocql004),
#              trim(imaa133)||'.'||trim(t7.oocql004),trim(imaa134)||'.'||trim(t8.oocql004),
#              trim(imaa135)||'.'||trim(t9.oocql004),trim(imaa136)||'.'||trim(t10.oocql004),
#              trim(imaa137)||'.'||trim(t11.oocql004),trim(imaa138)||'.'||trim(t12.oocql004),
#              trim(imaa139)||'.'||trim(t13.oocql004),trim(imaa140)||'.'||trim(t14.oocql004),
#              trim(imaa141)||'.'||trim(t15.oocql004),trim(imaa003)||'.'||trim(t16.oocql004)
#         INTO sr.l_imaa126desc,sr.l_imaa127desc,sr.l_imaa131desc,sr.l_imaa128desc,
#              sr.l_imaa129desc,sr.l_imaa132desc,sr.l_imaa133desc,sr.l_imaa134desc,
#              sr.l_imaa135desc,sr.l_imaa136desc,sr.l_imaa137desc,sr.l_imaa138desc,
#              sr.l_imaa139desc,sr.l_imaa140desc,sr.l_imaa141desc,sr.l_imaa003desc
#         FROM imaa_t
#         LEFT JOIN oocql_t t1  ON t1.oocqlent=imaaent  AND t1.oocql001=2002  AND t1.oocql002=imaa126  AND t1.oocql003=g_dlang
#         LEFT JOIN oocql_t t2  ON t2.oocqlent=imaaent  AND t2.oocql001=2003  AND t2.oocql002=imaa127  AND t2.oocql003=g_dlang
#         LEFT JOIN oocql_t t3  ON t3.oocqlent=imaaent  AND t3.oocql001=2001  AND t3.oocql002=imaa131  AND t3.oocql003=g_dlang
#         LEFT JOIN oocql_t t4  ON t4.oocqlent=imaaent  AND t4.oocql001=2004  AND t4.oocql002=imaa128  AND t4.oocql003=g_dlang
#         LEFT JOIN oocql_t t5  ON t5.oocqlent=imaaent  AND t5.oocql001=2005  AND t5.oocql002=imaa129  AND t5.oocql003=g_dlang
#         LEFT JOIN oocql_t t6  ON t6.oocqlent=imaaent  AND t6.oocql001=2006  AND t6.oocql002=imaa132  AND t6.oocql003=g_dlang
#         LEFT JOIN oocql_t t7  ON t7.oocqlent=imaaent  AND t7.oocql001=2007  AND t7.oocql002=imaa133  AND t7.oocql003=g_dlang
#         LEFT JOIN oocql_t t8  ON t8.oocqlent=imaaent  AND t8.oocql001=2008  AND t8.oocql002=imaa134  AND t8.oocql003=g_dlang
#         LEFT JOIN oocql_t t9  ON t9.oocqlent=imaaent  AND t9.oocql001=2009  AND t9.oocql002=imaa135  AND t9.oocql003=g_dlang
#         LEFT JOIN oocql_t t10 ON t10.oocqlent=imaaent AND t10.oocql001=2010 AND t10.oocql002=imaa136 AND t10.oocql003=g_dlang
#         LEFT JOIN oocql_t t11 ON t11.oocqlent=imaaent AND t11.oocql001=2011 AND t11.oocql002=imaa137 AND t11.oocql003=g_dlang
#         LEFT JOIN oocql_t t12 ON t12.oocqlent=imaaent AND t12.oocql001=2012 AND t12.oocql002=imaa138 AND t12.oocql003=g_dlang
#         LEFT JOIN oocql_t t13 ON t13.oocqlent=imaaent AND t13.oocql001=2013 AND t13.oocql002=imaa139 AND t13.oocql003=g_dlang
#         LEFT JOIN oocql_t t14 ON t14.oocqlent=imaaent AND t14.oocql001=2014 AND t14.oocql002=imaa140 AND t14.oocql003=g_dlang
#         LEFT JOIN oocql_t t15 ON t15.oocqlent=imaaent AND t15.oocql001=2015 AND t15.oocql002=imaa141 AND t15.oocql003=g_dlang
#         LEFT JOIN oocql_t t16 ON t16.oocqlent=imaaent AND t16.oocql001=200  AND t16.oocql002=imaa003 AND t16.oocql003=g_dlang
#        WHERE imaaent = g_enterprise
#          AND imaa001 = sr.xmdl008
#       IF sr.l_imaa126desc = '.' THEN LET sr.l_imaa126desc = '' END IF
#       IF sr.l_imaa127desc = '.' THEN LET sr.l_imaa127desc = '' END IF
#       IF sr.l_imaa131desc = '.' THEN LET sr.l_imaa131desc = '' END IF
#       IF sr.l_imaa128desc = '.' THEN LET sr.l_imaa128desc = '' END IF
#       IF sr.l_imaa129desc = '.' THEN LET sr.l_imaa129desc = '' END IF
#       IF sr.l_imaa132desc = '.' THEN LET sr.l_imaa132desc = '' END IF
#       IF sr.l_imaa133desc = '.' THEN LET sr.l_imaa133desc = '' END IF
#       IF sr.l_imaa134desc = '.' THEN LET sr.l_imaa134desc = '' END IF
#       IF sr.l_imaa135desc = '.' THEN LET sr.l_imaa135desc = '' END IF
#       IF sr.l_imaa136desc = '.' THEN LET sr.l_imaa136desc = '' END IF
#       IF sr.l_imaa137desc = '.' THEN LET sr.l_imaa137desc = '' END IF
#       IF sr.l_imaa138desc = '.' THEN LET sr.l_imaa138desc = '' END IF
#       IF sr.l_imaa139desc = '.' THEN LET sr.l_imaa139desc = '' END IF
#       IF sr.l_imaa140desc = '.' THEN LET sr.l_imaa140desc = '' END IF
#       IF sr.l_imaa141desc = '.' THEN LET sr.l_imaa141desc = '' END IF
#       IF sr.l_imaa003desc = '.' THEN LET sr.l_imaa003desc = '' END IF
#       
#       #庫存分群、銷售分群、採購分群
#       SELECT trim(imaf051)||'.'||trim(t1.oocql004),trim(imaf111)||'.'||trim(t2.oocql004),
#              trim(imaf141)||'.'||trim(t3.oocql004)
#         INTO sr.l_imaf051desc,sr.l_imaf111desc,sr.l_imaf141desc
#         FROM imaf_t
#         LEFT JOIN oocql_t t1 ON t1.oocqlent=imafent AND t1.oocql001=201 AND t1.oocql002=imaf051 AND t1.oocql003=g_dlang
#         LEFT JOIN oocql_t t2 ON t2.oocqlent=imafent AND t2.oocql001=202 AND t2.oocql002=imaf111 AND t2.oocql003=g_dlang
#         LEFT JOIN oocql_t t3 ON t3.oocqlent=imafent AND t3.oocql001=203 AND t3.oocql002=imaf141 AND t3.oocql003=g_dlang
#        WHERE imafent = g_enterprise
#          AND imafsite= g_site
#          AND imaf001 = sr.xmdl008
#       IF sr.l_imaf051desc = '.' THEN LET sr.l_imaf051desc = '' END IF
#       IF sr.l_imaf111desc = '.' THEN LET sr.l_imaf111desc = '' END IF
#       IF sr.l_imaf141desc = '.' THEN LET sr.l_imaf141desc = '' END IF
#       
#       #生管分群、品管分群
#       SELECT trim(imae011)||'.'||trim(t1.oocql004),trim(imae111)||'.'||trim(t2.oocql004)                   
#         INTO sr.l_imae011desc,sr.l_imae111desc
#         FROM imae_t
#         LEFT JOIN oocql_t t1 ON t1.oocqlent=imaeent AND t1.oocql001=204 AND t1.oocql002=imae011 AND t1.oocql003=g_dlang
#         LEFT JOIN oocql_t t2 ON t2.oocqlent=imaeent AND t2.oocql001=205 AND t2.oocql002=imae111 AND t2.oocql003=g_dlang                
#        WHERE imaaent = g_enterprise
#          AND imaesite= g_site
#          AND imae001 = sr.xmdl008
#       IF sr.l_imae011desc = '.' THEN LET sr.l_imae011desc = '' END IF
#       IF sr.l_imae111desc = '.' THEN LET sr.l_imae111desc = '' END IF
#          
#       #財務(成本)分群
#       SELECT trim(imag011)||'.'||trim(oocql004)
#         INTO sr.l_imag011desc
#         FROM imag_t
#         LEFT JOIN oocql_t ON oocqlent=imagent AND oocql001=206 AND oocql002=imag011 AND oocql003=g_dlang
#        WHERE imagent = g_enterprise
#          AND imagsite= (SELECT ooef017 FROM ooef_t WHERE ooefent=g_enterprise AND ooef001=g_site)
#          AND imag001 = sr.xmdl008
#       IF sr.l_imag011desc = '.' THEN LET sr.l_imag011desc = '' END IF
#       
#       #包裝單號
#       SELECT xmeldocno INTO sr.l_xmeldocno FROM xmel_t
#        WHERE xmelent = g_enterprise AND (xmel005 = sr.xmdkdocno OR xmel005 = sr.xmdk005)
#       #Invoice單號
#       SELECT xmdodocno INTO sr.l_xmdodocno FROM xmdo_t
#        WHERE xmdoent = g_enterprise AND (xmdo005 = sr.xmdkdocno OR xmdo005 = sr.xmdk005)
#      #150908 sarah add -----(E)

       #end add-point
 
       #add-point:ins_data段before.save name="ins_data.before.save"
 
       #end add-point
 
       #EXECUTE
       EXECUTE insert_prep USING sr.l_xmdk,sr.xmdkdocno,sr.xmdkdocdt,sr.xmdk001,sr.xmdk026,sr.l_xmdk002_desc,sr.l_xmdkstus_desc,sr.xmdk003,sr.l_xmdk003_desc,sr.xmdk004,sr.l_xmdk004_desc,sr.xmdk007,sr.l_xmdk007_desc,sr.xmdk009,sr.l_xmdk009_desc,sr.xmdk008,sr.l_xmdk008_desc,sr.xmdlseq,sr.xmdl003,sr.xmdl004,sr.xmdl005,sr.xmdl006,sr.xmdk005,sr.l_xmda033,sr.l_xmdl007_desc,sr.l_imaa009,sr.l_imaa009_rtaxl003,sr.l_imaf111,sr.l_imaf111_oocql004,sr.xmdl008,sr.x_imaal_t_imaal003,sr.x_imaal_t_imaal004,sr.xmdl009,sr.l_xmdl009_desc,sr.xmdl018,sr.xmdl017,sr.xmdl035,sr.xmdl036,sr.l_qty_1,sr.xmdl014,sr.l_xmdl014_desc,sr.xmdl015,sr.l_xmdl015_desc,sr.xmdl016,sr.xmdl052,sr.xmdl051,sr.xmdl022,sr.xmdl021,sr.xmdl024,sr.xmdl025,sr.l_oodbl004,sr.xmdl026,sr.xmdl027,sr.xmdl028,sr.l_imaa127,sr.l_imaa127_desc,sr.xmdl029,sr.xmdk016,sr.xmdk017,sr.l_xmdl027,sr.l_xmdl028,sr.l_xmdl029,sr.l_imaa134,sr.l_imaa134_desc
 
       IF SQLCA.SQLCODE THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = "axmr005_x02_execute"
          LET g_errparam.code = SQLCA.SQLCODE
          LET g_errparam.popup = FALSE
          CALL cl_err()       
          LET g_rep_success = 'N'
          EXIT FOREACH
       END IF
 
       #add-point:ins_data段after_save name="ins_data.after.save"
       IF tm.chk1 = 'Y' AND sr.xmdl013 = 'Y' THEN
          FOREACH axmr005_x01_cur USING sr.xmdkent,sr.xmdkdocno,sr.xmdlseq
             INTO sr1.xmdm009,sr1.xmdm008,sr1.xmdm012,sr1.xmdm013,sr1.l_qty_2,sr1.xmdm005,sr1.l_xmdm005_desc,
                  sr1.xmdm006,sr1.l_xmdm006_desc,sr1.xmdm007,sr1.xmdm033,sr1.xmdmdocno,sr1.xmdmseq
             IF STATUS THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.extend = 'foreach:'
                LET g_errparam.code   = STATUS
                LET g_errparam.popup  = TRUE
                CALL cl_err()
                LET g_rep_success = 'N'
                EXIT FOREACH
             END IF
          
             EXECUTE insert_prep1 USING sr1.xmdm009,sr1.xmdm008,sr1.xmdm012,sr1.xmdm013,sr1.l_qty_2,
                                        sr1.xmdm005,sr1.l_xmdm005_desc,sr1.xmdm006,sr1.l_xmdm006_desc,
                                        sr1.xmdm007,sr1.xmdm033,sr1.xmdmdocno,sr1.xmdmseq
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.extend = "axmr005_x01_execute1"
                LET g_errparam.code   = SQLCA.sqlcode
                LET g_errparam.popup  = FALSE
                CALL cl_err()
                LET g_rep_success = 'N'
                EXIT FOREACH
             END IF
          END FOREACH
       END IF

       #end add-point
       
    END FOREACH
    
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axmr005_x02.rep_data" readonly="Y" type="s" >}
PRIVATE FUNCTION axmr005_x02_rep_data()
#add-point:rep_data.define (客製用) name="rep_data.define_customerization"

#end add-point:rep_data.define
#add-point:rep_data.define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="rep_data.define"

#end add-point:rep_data.define
 
    #add-point:rep_data.before name="rep_data.before"
    
    #end add-point:rep_data.before
    
    CALL cl_xg_view()
    #add-point:rep_data.after name="rep_data.after"
    
    #end add-point:rep_data.after
END FUNCTION
 
{</section>}
 
{<section id="axmr005_x02.other_function" readonly="Y" type="s" >}

 
{</section>}
 
