#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_aist310_api.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0003(1900-01-01 00:00:00), PR版次:0003(2021-01-27 14:17:40)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000051
#+ Filename...: s_aist310_api
#+ Description: 發票防偽稅控相關元件
#+ Creator....: 05488(2019-10-09 14:53:34)
#+ Modifier...: 00000 -SD/PR- TOPSTD
 
{</section>}
 
{<section id="s_aist310_api.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#180813-00030#1    2019/10/28  By 05488     防偽稅控相關功能
#200422-00011#1    2020/04/22  By 05488     若awsi100沒有設定要報錯
#210126-00006#1    2021/01/27  By 11234     超过8行时，不自动调用发票清单打印
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util
IMPORT com
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_aist310_api.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_aist310_api.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_isao006                LIKE isao_t.isao006              #防偽稅控否
DEFINE g_ooef019                LIKE ooef_t.ooef019              #稅區
DEFINE g_ooef011                LIKE ooef_t.ooef011              #專屬國家地區功能
DEFINE g_esys0739               LIKE type_t.chr1                 #防偽稅控API
DEFINE g_isao001                LIKE isao_t.isao001              #客戶身份識別號
DEFINE g_isao018                LIKE isao_t.isao018              #稅號
DEFINE g_isafdocno              LIKE isaf_t.isafdocno            #aist310單號
DEFINE g_isafsite               LIKE isaf_t.isafsite             #營運據點
DEFINE g_isafcomp               LIKE isaf_t.isafcomp             #法人
DEFINE g_isafdocdt              LIKE isaf_t.isafdocdt            #單據日期
DEFINE g_isaf008                LIKE isaf_t.isaf008              #發票類型
DEFINE g_isaf009                LIKE isaf_t.isaf009              #電子發票否
DEFINE g_isaf010                LIKE isaf_t.isaf010              #發票代碼
DEFINE g_isaf011                LIKE isaf_t.isaf011              #發票號碼
DEFINE g_isaf016                LIKE isaf_t.isaf016              #稅別
DEFINE g_isaf017                LIKE isaf_t.isaf017              #含稅否
DEFINE g_isaf018                LIKE isaf_t.isaf018              #稅率
DEFINE g_isaf021                LIKE isaf_t.isaf021              #購貨方名稱
DEFINE g_isaf022                LIKE isaf_t.isaf022              #購貨方統一編號
DEFINE g_isaf023                LIKE isaf_t.isaf023              #購貨方地址
DEFINE g_isaf051                LIKE isaf_t.isaf051              #稅盤號
DEFINE g_isaf053                LIKE isaf_t.isaf053              #發票分類
DEFINE g_isaf054                LIKE isaf_t.isaf054              #課稅別
DEFINE g_isaf100                LIKE isaf_t.isaf100              #幣別
DEFINE g_isaf101                LIKE isaf_t.isaf101              #匯率
DEFINE g_invoice_class          LIKE isaf_t.isaf053              #發票分類
DEFINE g_isaf056                LIKE isaf_t.isaf056              #發票性質
DEFINE g_base               RECORD
          l_type                LIKE type_t.chr1,                #執行功能
          app_id                LIKE isao_t.isao001,             #客戶身份識別號
          tax_id                LIKE isao_t.isao018,             #稅號
          machine_id            LIKE isaf_t.isaf051,             #稅盤號
          inv_class             LIKE isaf_t.isaf053,             #發票類型
          inv_code              LIKE isah_t.isah001,             #發票代碼
          inv_no                LIKE isah_t.isah002              #發票號碼
                            END RECORD
#end add-point
 
{</section>}
 
{<section id="s_aist310_api.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_aist310_api.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 與API串接
# Memo...........:
# Usage..........: CALL s_aist310_api(p_js)
#                  RETURNING r_success
# Input parameter: p_js               參數
# Return code....: r_success          處理結果
# Date & Author..: 2019/10/29   By 05488
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aist310_api(p_js)
DEFINE p_js                     STRING
DEFINE l_isaf               RECORD
          isafdocno             LIKE isaf_t.isafdocno,                   #aist310單號
          isafcomp              LIKE isaf_t.isafcomp,                    #法人
          l_type                LIKE type_t.chr1,                        #執行功能
          isah001               LIKE isah_t.isah001,                     #發票代碼
          isah002               LIKE isah_t.isah002                      #發票號碼
         ,isah011               LIKE isah_t.isah011                      #發票預開立張數  #200427-00029#1 add
                            END RECORD                                   
DEFINE r_success                LIKE type_t.num5                         
#200422-00011#1---add---start---                                         
DEFINE l_url                    STRING                                   #外聯API URL
DEFINE l_api0004                STRING                                   #稅控接口類型
DEFINE l_api_ip                 STRING                                   #外聯API IP
DEFINE l_error                  LIKE gzze_t.gzze001                      #錯誤訊息代號
#200422-00011#1---add---end---
DEFINE l_invoice_qty            LIKE type_t.num10                        #發票庫存數      #200427-00029#1 add

     
     LET r_success = TRUE
     
     #200422-00011#1---add---start---
     #執行前先判斷awsi100是否有設定
     LET l_url = cl_aws_prod_para(g_enterprise,"api-0002")               #外聯API URL
     LET l_api0004 = cl_aws_prod_para(g_enterprise,"api-0004")           #稅控接口
     LET l_api_ip   = cl_aws_prod_para(g_enterprise,"api-addr")          #外聯API IP
     LET l_error = ''
     CASE
       WHEN cl_null(l_url)
          LET l_error = 'ais-00539'           #外聯API接口URL未設定！！
       WHEN cl_null(l_api0004)
          LET l_error = 'ais-00540'           #外聯API防偽接口類型未設定！！
       WHEN cl_null(l_api_ip)
          LET l_error = 'ais-00541'           #外聯API接口URL未設定！！
       OTHERWISE
          LET l_error = ''
     END CASE
     IF NOT cl_null(l_error) THEN
        INITIALIZE g_errparam.* TO NULL
        LET g_errparam.code = l_error
        LET g_errparam.extend = ''
        LET g_errparam.popup = TRUE    
        CALL cl_err()
        LET r_success = FALSE       

        RETURN r_success
     END IF  
     #200422-00011#1---add---end---
     
     CALL util.JSON.parse(p_js,l_isaf) 
     SELECT isafdocno,isafsite,isafcomp,isafdocdt,isaf008,
            isaf009,isaf010,isaf011,isaf016,isaf017,
            isaf018,isaf021,isaf022,isaf023,isaf051,
            isaf053,isaf054,isaf100,isaf101,isaf056            
       INTO g_isafdocno,g_isafsite,g_isafcomp,g_isafdocdt,g_isaf008,
            g_isaf009,g_isaf010,g_isaf011,g_isaf016,g_isaf017,
            g_isaf018,g_isaf021,g_isaf022,g_isaf023,g_isaf051,
            g_isaf053,g_isaf054,g_isaf100,g_isaf101,g_isaf056
       FROM isaf_t
      WHERE isafent = g_enterprise
        AND isafdocno = l_isaf.isafdocno
        AND isafcomp = l_isaf.isafcomp

     IF cl_null(g_isaf009) THEN LET g_isaf009 = 'N' END IF
     
     SELECT isao001,isao006,isao018
       INTO g_isao001,g_isao006,g_isao018
       FROM isao_t
      WHERE isaoent = g_enterprise
        AND isaosite = g_isafsite
     CASE g_isaf053
       WHEN '2'
         LET g_base.inv_class = '2'
       WHEN '3'
         LET g_base.inv_class = '0'
     END CASE     
     
     
     LET g_base.l_type = l_isaf.l_type
     LET g_base.app_id = g_isao001
     LET g_base.tax_id = g_isao018
     LET g_base.inv_code = l_isaf.isah001
     LET g_base.inv_no = l_isaf.isah002
     LET g_base.machine_id = g_isaf051
     
     CALL s_aist310_api_cursor()
     
     CASE g_base.l_type
       WHEN '1'          #發票預覽
         CALL s_aist310_api_invoice1()
           RETURNING r_success
       WHEN '2'          #發票開立
         #200427-00029#1---add---start---
         CALL s_aist310_api_invoice2('Y')        
           RETURNING r_success,l_invoice_qty  
         #當發票庫存量小於要開立的發票數量時要報錯
         IF l_invoice_qty < l_isaf.isah011 THEN
            INITIALIZE g_errparam.* TO NULL
            LET g_errparam.code = 'ais-00430'
            LET g_errparam.extend = l_isaf.isah011,">",l_invoice_qty
            LET g_errparam.popup = TRUE    
            CALL cl_err()
            LET r_success = FALSE       
         ELSE
         #200427-00029#1---add---end--- 
            CALL s_aist310_api_invoice1()
              RETURNING r_success
         END IF
       WHEN '3'          #發票庫存查詢
         #CALL s_aist310_api_invoice2()        #200427-00029#1 mark
         #  RETURNING r_success                #200427-00029#1 mark
         CALL s_aist310_api_invoice2('N')        #200427-00029#1 add
           RETURNING r_success,l_invoice_qty     #200427-00029#1 add
       WHEN '4'          #發票列印
         CALL s_aist310_api_invoice3()
           RETURNING r_success
       WHEN '5'          #發票清單列印
         CALL s_aist310_api_invoice3()
           RETURNING r_success
       WHEN '6'          #發票作廢
         CALL s_aist310_api_invoice3()
           RETURNING r_success
       OTHERWISE
         RETURN r_success
     END CASE 
   
     RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: CURSOR
# Memo...........:
# Usage..........: CALL s_aist310_api_cursor()
# Input parameter: 
# Return code....: 
# Date & Author..: 2019/11/04    By 05488
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aist310_api_cursor()
DEFINE l_sql                     STRING


        LET l_sql = "UPDATE isah_t",
                    "   SET isah001 = ?,",
                    "       isah002 = ?",
                    " WHERE isahent = ",g_enterprise,
                    "   AND isahdocno = '",g_isafdocno,"'",
                    "   AND isahcomp = '",g_isafcomp,"'",
                    "   AND isah011 = ?"
        PREPARE upd_isah001 FROM l_sql
        
        
        LET l_sql = "INSERT INTO isat_t(isatent,isatcomp,isatdocno,isatseq,isat001,",
                    "                   isat002,isat003,isat004,isat005,isat006,",
                    "                   isat007,isat008,isat009,isat010,isat011,",
                    "                   isat012,isat013,isat014,isat015,isat016,",
                    "                   isat017,isat018,isat019,isat020,isat021,",
                    "                   isat022,isat023,isat024,isat100,isat101,",
                    "                   isat103,isat104,isat105,isat106,isat107,",
                    "                   isat113,isat114,isat115,isat201,isat202,",
                    "                   isat203,isat204,isat205,isat206,isat207,",
                    "                   isat208,isat209,isatud001,isatud002,isatud003,",
                    "                   isatud004,isatud005,isatud006,isatud007,isatud008,",
                    "                   isatud009,isatud010,isatud011,isatud012,isatud013,",
                    "                   isatud014,isatud015,isatud016,isatud017,isatud018,",
                    "                   isatud019,isatud020,isatud021,isatud022,isatud023,",
                    "                   isatud024,isatud025,isatud026,isatud027,isatud028,",
                    "                   isatud029,isatud030,isatsite,isatdocdt,isat025,",
                    "                   isat026,isat027,isat028,isat029,isat108,",
                    "                   isat118,isat030,isat031,isat032 ",
                    "                  )",
                    "            VALUES(?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
                    "                   ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
                    "                   ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
                    "                   ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,",
                    "                   ?,?,?,?,?,  ?,?,?,?     ",
                    "                   ) "   
        PREPARE ins_isat FROM l_sql  
        
        #取得項次(isatseq)
        LET l_sql = "SELECT MAX(isatseq) + 1 ",
                    "  FROM isat_t", 
                    " WHERE isatent = ",g_enterprise,
                    "   AND isatdocno = '",g_isafdocno,"'",     
                    "   AND isatcomp = '",g_isafcomp,"'",                    
                    "   AND isat003 = ?  AND isat004 = ?"
        PREPARE get_isatseq FROM l_sql
        
        #取得isah_t原幣金額
        LET l_sql = "SELECT SUM(isah103),SUM(isah104),SUM(isah105)",
                    "  FROM isah_t",
                    " WHERE isahent = ",g_enterprise,
                    "   AND isahdocno = '",g_isafdocno,"'",
                    "   AND isahcomp = '",g_isafcomp,"'",
                    "   AND isah011 = ?",
                    " GROUP BY isah011"
        PREPARE get_isah103 FROM l_sql 
        
        #取得發票明細筆數
        LET l_sql = "SELECT COUNT(1)",
                    "  FROM isah_t",
                    " WHERE isahent = ",g_enterprise,
                    "   AND isahdocno = '",g_isafdocno,"'",
                    "   AND isahcomp = '",g_isafcomp,"'",
                    "   AND isah001 = '",g_base.inv_code,"'",
                    "   AND isah002 = '",g_base.inv_no,"'"
        PREPARE get_count_isah FROM l_sql            
        
        #取得發票日期
        LET l_sql = "SELECT DISTINCT isat007",
                    "  FROM isat_t",
                    " WHERE isatent = ",g_enterprise,
                    "   AND isatdocno = '",g_isafdocno,"'",
                    "   AND isatcomp = '",g_isafcomp,"'",
                    "   AND isat003 = '",g_base.inv_code,"'",
                    "   AND isat004 = '",g_base.inv_no,"'",
                    "   AND isat025 IN ('11','21')"
        PREPARE get_isat007 FROM l_sql
        
        #抓取要作廢的發票資訊
        LET l_sql = "SELECT isatent,isatcomp,isatdocno,isatseq,isat001,",
                    "       isat002,isat003,isat004,isat005,isat006,",
                    "       isat007,isat008,isat009,isat010,isat011,",
                    "       isat012,isat013,isat014,isat015,isat016,",
                    "       isat017,isat018,isat019,isat020,isat021,",
                    "       isat022,isat023,isat024,isat100,isat101,",
                    "       isat103,isat104,isat105,isat106,isat107,",
                    "       isat113,isat114,isat115,isat201,isat202,",
                    "       isat203,isat204,isat205,isat206,isat207,",
                    "       isat208,isat209,isatud001,isatud002,isatud003,",
                    "       isatud004,isatud005,isatud006,isatud007,isatud008,",
                    "       isatud009,isatud010,isatud011,isatud012,isatud013,",
                    "       isatud014,isatud015,isatud016,isatud017,isatud018,",
                    "       isatud019,isatud020,isatud021,isatud022,isatud023,",
                    "       isatud024,isatud025,isatud026,isatud027,isatud028,",
                    "       isatud029,isatud030,isatsite,isatdocdt,isat025,",
                    "       isat026,isat027,isat028,isat029,isat030,",
                    "       isat031,isat032,isat108,isat118", 
                    "  FROM isat_t ", 
                    " WHERE isatent = ",g_enterprise,
                    "   AND isatcomp = '",g_isafcomp,"'",
                    "   AND isatdocno = '",g_isafdocno,"'",
                    "   AND isat003 = '",g_base.inv_code,"'",
                    "   AND isat004 = '",g_base.inv_no,"'",
                    "   AND isat025 IN ('11','21')"
        PREPARE get_isat FROM l_sql            
END FUNCTION

################################################################################
# Descriptions...: 發票預覽/開立
# Memo...........:
# Usage..........: CALL s_aist310_api_invoice1()
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 2019/10/29  By 05488
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aist310_api_invoice1()
DEFINE ls_jsin                            STRING   
DEFINE l_isah011                          LIKE isah_t.isah011                  #發票分群
DEFINE l_isah015                          LIKE isah_t.isah015                  #分群版本號
DEFINE l_invoice            RECORD          
            api_name                      STRING,                              #服務名稱 
            app_id                        LIKE isao_t.isao001,                 #客戶身份識別號
            tax_id                        LIKE isao_t.isao018,                 #稅號
            machine_id                    LIKE isaf_t.isaf051,                 #稅盤號
            invoice_no                    LIKE isaf_t.isafdocno,               #aist310單號
            comp                          LIKE isaf_t.isafcomp,                #法人
            isah011                       LIKE isah_t.isah011,                 #發票分群
            isah015                       LIKE isah_t.isah015,                 #分群版本號
            invoice_class                 LIKE isaf_t.isaf053                  #發票分類
                            END RECORD                             
DEFINE ls_jsout                           STRING   
DEFINE l_return             RECORD
            status_code                   STRING,                              #處理狀態碼
            description                   STRING,                              #處理描述
            billing_code                  LIKE isaf_t.isaf010,                 #發票代碼
            billing_no                    LIKE isaf_t.isaf011,                 #發票號碼
            billing_date                  LIKE isaf_t.isaf014,                 #發票開票日期
            is_preview                    LIKE type_t.chr1,                    #是否預覽 
            total_local_curr_tax_amount   LIKE isaf_t.isaf115,                 #發票價稅合計
            total_local_curr_tax          LIKE isaf_t.isaf114,                 #發票稅額合計
            is_tax_included               LIKE isaf_t.isaf017,                 #含?否   
            invoice_url                   LIKE isat_t.isat031                  #發票網址 
                            END RECORD                              
DEFINE l_sql                              STRING
DEFINE r_success                          LIKE type_t.num5
DEFINE l_success                          LIKE type_t.num5
DEFINE l_url                              LIKE isat_t.isat031
DEFINE l_res                              LIKE type_t.num10
DEFINE l_isat003                          LIKE isat_t.isat003                  #發票代碼
DEFINE l_isat004                          LIKE isat_t.isat004                  #發票號碼
DEFINE l_isat031                          LIKE isat_t.isat031                  #發票url
DEFINE l_cnt                              LIKE type_t.num5
                          
                          
       LET r_success = TRUE                 
       
       LET l_cnt = 0
       SELECT COUNT(1) INTO l_cnt
         FROM isat_t
        WHERE isatent = g_enterprise
          AND isatdocno = g_isafdocno
          AND isatcomp = g_isafcomp
       IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF      
       IF l_cnt > 0 AND g_base.l_type = '1' THEN
          #已開立發票抓發票url做預覽
          LET l_isat031 = ''
          LET l_sql = "SELECT isat031",
                      "  FROM isat_t",
                      " WHERE isatent = ",g_enterprise,
                      "   AND isatdocno = '",g_isafdocno,"'",
                      "   AND isatcomp = '",g_isafcomp,"'",
                      "   AND isat025 IN ('11','21')",
                      " ORDER BY isat004"
          PREPARE get_isat031_p FROM l_sql
          DECLARE get_isat031_c CURSOR FOR get_isat031_p
          FOREACH get_isat031_c INTO l_isat031
             CALL ui.Interface.frontCall("standard","shellexec",l_isat031,[l_res])
          END FOREACH                        
       ELSE       
          LET l_sql = "SELECT DISTINCT isah011,isah015",
                      "  FROM isah_t",
                      " WHERE isahent = ",g_enterprise,
                      "   AND isahdocno = '",g_isafdocno,"'",
                      "   AND isahcomp = '",g_isafcomp,"'",
                      "   AND isah001 IS NULL",
                      "   AND isah002 IS NULL",
                      " ORDER BY isah011"
          PREPARE get_isah011_p FROM l_sql            
          DECLARE get_isah011_c CURSOR FOR get_isah011_p

          FOREACH get_isah011_c INTO l_isah011,l_isah015
              CASE g_base.l_type
                WHEN '1'       #發票預覽
                  LET l_invoice.api_name = 'doapi.paper_invoice.preview'
                WHEN '2'       #發票開立
                  LET l_invoice.api_name = 'doapi.paper_invoice.issue'
                OTHERWISE
              END CASE
              LET l_invoice.app_id = g_base.app_id
              LET l_invoice.tax_id = g_base.tax_id
              LET l_invoice.machine_id = g_base.machine_id  
              LET l_invoice.invoice_no = g_isafdocno  
              LET l_invoice.isah011 = l_isah011    
              LET l_invoice.isah015 = l_isah015    
              LET l_invoice.invoice_class = g_base.inv_class
              LET l_invoice.comp = g_isafcomp           
              LET ls_jsin = util.JSON.stringify(l_invoice)
              #add by lixwz s---
              SELECT COUNT(1) INTO l_cnt FROM 
              #add by lixwz e---
              CALL s_jscli_doapi03(ls_jsin) RETURNING ls_jsout
              CALL util.JSON.parse(ls_jsout,l_return) 
              
              IF l_return.status_code = 0 THEN 
                 CASE g_base.l_type
                   WHEN '1'       #發票預覽
                     LET l_url = l_return.invoice_url
                     CALL ui.Interface.frontCall("standard","shellexec",l_url,[l_res])
                   WHEN '2'       #發票開立
                     CALL s_aist310_api_upd_invoice(l_isah011,ls_jsout)
                       RETURNING l_success
                       IF l_success THEN
                          INITIALIZE g_errparam.* TO NULL
                          LET g_errparam.code = 'ais-00523' 
                          LET g_errparam.replace[1] = l_isah011
                          LET g_errparam.replace[2] = l_return.billing_code
                          LET g_errparam.replace[3] = l_return.billing_no
                          LET g_errparam.extend = ''
                          LET g_errparam.popup = TRUE    
                          CALL cl_err()
                       END IF
                 END CASE
              ELSE
                 INITIALIZE g_errparam.* TO NULL
                 LET g_errparam.code = 'ais-00493' 
                 LET g_errparam.replace[1] = l_isah011
                 LET g_errparam.replace[2] = l_return.description
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE    
                 CALL cl_err()
                 LET r_success = FALSE
              END IF
          END FOREACH

          IF g_base.l_type = '2' THEN     #發票開立
             IF l_success THEN
                LET l_cnt = 0
                SELECT COUNT(DISTINCT isat004) INTO l_cnt
                  FROM isat_t
                 WHERE isatent = g_enterprise
                   AND isatdocno = g_isafdocno
                   AND isatcomp = g_isafcomp
                   AND isat025 IN ('11','21')
                IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                IF l_cnt = 0 THEN
                   LET r_success = FALSE
                   RETURN r_success
                ELSE
                   IF l_cnt > 1 THEN
                      #多張發票號碼時，單頭發票號碼給MULTI
                      LET l_isat003 = ''
                      SELECT DISTINCT isat003 INTO l_isat003
                        FROM isat_t
                       WHERE isatent = g_enterprise
                         AND isatdocno = g_isafdocno
                         AND isatcomp = g_isafcomp
                      LET l_isat004 = 'MULTI'
                   ELSE
                      LET l_isat003 = ''
                      LET l_isat004 = ''
                      SELECT isat003,isat004 
                        INTO l_isat003,l_isat004
                        FROM isat_t
                       WHERE isatent = g_enterprise
                         AND isatdocno = g_isafdocno
                         AND isatcomp = g_isafcomp
                         AND isat025 IN ('11','21')          #200427-00029#1 add
                   END IF
                   #更新單頭發票代碼/發票號碼
                   UPDATE isaf_t
                      SET isaf010 = l_isat003,
                          isaf011 = l_isat004
                    WHERE isafent = g_enterprise
                      AND isafdocno = g_isafdocno
                      AND isafcomp = g_isafcomp
                   IF SQLCA.SQLcode THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = "UPD isaf010/isaf011"
                      LET g_errparam.popup = TRUE
                      CALL cl_err()        
                      LET r_success = FALSE  
                      RETURN r_success           
                   END IF
                END IF
             ELSE
                LET r_success = FALSE
                RETURN r_success                
             END IF   
          END IF             
       END IF
       
       RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 發票庫存查詢
# Memo...........:
# Usage..........: CALL s_aist310_api_invoice2(p_bgjob)
#                  RETURNING r_success
# Input parameter: p_bgjob           #背景處理
# Return code....: r_success         #執行結果
#                  inventory_qty     #發票庫存數
# Date & Author..: 2019/10/28  By 05488
# Modify.........: 200427-00029#1      2020/05/20   By 05488
################################################################################
PUBLIC FUNCTION s_aist310_api_invoice2(p_bgjob)
DEFINE r_success                          LIKE type_t.num5
DEFINE ls_jsin                            STRING            
DEFINE l_stock              RECORD                                      
         app_id                           LIKE isao_t.isao001,                 #客戶身份識別號
         tax_id                           LIKE isaf_t.isaf028,                 #稅號
         machine_id                       LIKE isaf_t.isaf051,                 #稅盤號
         invoice_class                    LIKE isaf_t.isaf053                  #發票分類
                            END RECORD                                                     
DEFINE ls_jsout                           STRING       
#發票內容
TYPE type_billing           RECORD                                      
         billing_code                     LIKE isaf_t.isaf010,                 #發票代碼
         billing_no                       LIKE isaf_t.isaf011,                 #發票號碼
         inventory_qty                    LIKE type_t.num20,                   #發票庫存數量
         invoice_class                    LIKE isaf_t.isaf008                  #發票分類
                            END RECORD                                  
TYPE type_l_return          RECORD                                      
          status_code                     STRING,                              #處理狀態碼
          description                     STRING,                              #處理描述
          param                           DYNAMIC ARRAY OF  type_billing       #發票內容
                            END RECORD                         
DEFINE l_return                           type_l_return    
DEFINE l_isaf028                          LIKE isaf_t.isaf028                  
DEFINE l_isaf051                          LIKE isaf_t.isaf051                  
DEFINE l_isaf053                          LIKE isaf_t.isaf053                  
DEFINE l_class                            LIKE gzze_t.gzze003                  #發票分類
DEFINE p_bgjob                            LIKE type_t.chr1                     #背景處理否

       LET r_success = TRUE
       LET l_stock.app_id = g_base.app_id
       LET l_stock.tax_id = g_base.tax_id
       LET l_stock.machine_id = g_base.machine_id       
       LET l_stock.invoice_class = g_base.inv_class
       CASE l_stock.invoice_class  
         WHEN '2'            #普通發票        
           SELECT gzze003 INTO l_class
             FROM gzze_t
            WHERE gzze001 = 'ais-00492'
              AND gzze002 = g_dlang
         WHEN '3'            #專用發票     
           SELECT gzze003 INTO l_class
             FROM gzze_t
            WHERE gzze001 = 'ais-00491'
              AND gzze002 = g_dlang
         OTHERWISE
       END CASE
       
       LET ls_jsin = util.JSON.stringify(l_stock)
       CALL s_jscli_doapi01(ls_jsin) RETURNING ls_jsout
       CALL util.JSON.parse(ls_jsout,l_return)
       
       IF l_return.status_code = 0 THEN        
          IF p_bgjob = 'N' THEN         #200427-00029#1 add
             INITIALIZE g_errparam.* TO NULL
             LET g_errparam.code = 'ais-00490' 
             LET g_errparam.replace[1] = l_class
             LET g_errparam.replace[2] = l_return.param[1].billing_code        #發票代碼
             LET g_errparam.replace[3] = l_return.param[1].billing_no          #下次待開號碼
             LET g_errparam.replace[4] = l_return.param[1].inventory_qty       #發票庫存數量
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE    
             CALL cl_err()
          END IF                #200427-00029#1 add
       ELSE
          INITIALIZE g_errparam.* TO NULL
          LET g_errparam.code = 'ais-00508' 
          LET g_errparam.replace[1] = l_return.description
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE    
          CALL cl_err()
          LET r_success = FALSE
          LET l_return.param[1].inventory_qty = 0           #200427-00029#1 add
       END IF
        
       #RETURN r_success                                    #200427-00029#1 mark
       RETURN r_success,l_return.param[1].inventory_qty     #200427-00029#1 add
END FUNCTION

################################################################################
# Descriptions...: 發票作廢/發票列印/發票清單列印
# Memo...........:
# Usage..........: CALL s_aist310_api_invoice3()
#                  RETURNING r_success
# Input parameter: p_js         參數
# Return code....: 
# Date & Author..: 2019/10/29   By 05488
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aist310_api_invoice3()
DEFINE r_success                          LIKE type_t.num5
DEFINE ls_jsin                            STRING    
DEFINE l_invoice         RECORD           
            api_name                      STRING,                               #服務名稱 
            app_id                        LIKE isao_t.isao001,                  #客戶身份識別號
            tax_id                        LIKE isao_t.isao018,                  #稅號
            invoice_class                 LIKE isaf_t.isaf053,                  #發票分類
            billing_code                  LIKE isah_t.isah001,                  #發票代碼
            billing_no                    LIKE isah_t.isah002                   #發票號碼
                     END RECORD                       
DEFINE l_status                           LIKE type_t.chr1                      #api回傳狀態
DEFINE l_msg                              STRING                                #api回傳訊息
DEFINE l_success                          LIKE type_t.num5
DEFINE l_flag                             LIKE type_t.chr1


       LET r_success = TRUE
       LET l_invoice.app_id = g_base.app_id
       LET l_invoice.tax_id = g_base.tax_id
       LET l_invoice.invoice_class = g_base.inv_class
       LET l_invoice.billing_code = g_base.inv_code
       LET l_invoice.billing_no = g_base.inv_no
       
       CASE g_base.l_type
         WHEN '4'        #發票列印
           LET l_invoice.api_name = 'doapi.paper_invoice.print'
         WHEN '5'        #發票清單列印
           LET l_invoice.api_name = 'doapi.paper_invoice.printlist'
         WHEN '6'        #發票作廢
           LET l_invoice.api_name = 'doapi.paper_invoice.cancel'
         OTHERWISE
           RETURN 
       END CASE
       
       CALL s_aist310_api_chk_isat()
         RETURNING l_success,l_flag
         
         
       IF l_success THEN
          LET ls_jsin = util.JSON.stringify(l_invoice)   
          CALL s_jscli_doapi02(ls_jsin) RETURNING l_status,l_msg
          
          IF l_status = 0 THEN 
             #成功
             INITIALIZE g_errparam.* TO NULL
             CASE g_base.l_type
               WHEN '4'             #發票列印
                   #210126-00006#1 mark(s)
#                   IF l_flag = 'Y' THEN
#                      #發票明細超過八行，要一併列印發票清單
#                      LET l_invoice.api_name = 'doapi.paper_invoice.printlist'
#                      LET ls_jsin = util.JSON.stringify(l_invoice)   
#                      CALL s_jscli_doapi02(ls_jsin) RETURNING l_status,l_msg
#                   END IF
                   #210126-00006#1 mark(e)
                   IF l_status = 0 THEN
                      LET g_errparam.code = 'ais-00435'             #發票代碼%1+發票號碼%2列印成功！
                   ELSE                                             
                      LET g_errparam.code = 'ais-00509'             #發票代碼%1+發票號碼%2列印失敗！
                      LET g_errparam.replace[3] = l_msg             
                      LET r_success = FALSE                         
                   END IF                                           
               WHEN '5'             #發票清單列印                    
                   LET g_errparam.code = 'ais-00435'                #發票代碼%1+發票號碼%2列印成功！
               WHEN '6'             #發票作廢                            
                 LET g_errparam.code = 'ais-00437'                  #發票代碼%1+發票號碼%2作廢成功！
             END CASE
             LET g_errparam.replace[1] = g_base.inv_code
             LET g_errparam.replace[2] = g_base.inv_no
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE    
             CALL cl_err()
             CALL s_aist310_api_upd_isat()
               RETURNING l_success
             IF NOT l_success THEN
                LET r_success = FALSE
                RETURN r_success
             END IF
          ELSE
             #失敗
             INITIALIZE g_errparam.* TO NULL
             CASE
               WHEN g_base.l_type= '4' OR g_base.l_type= '5'   #發票列印&發票清單列印
                 LET g_errparam.code = 'ais-00509'                  #發票代碼%1+發票號碼%2列印失敗！
               WHEN g_base.l_type = '6'                        #發票作廢                              
                 LET g_errparam.code = 'ais-00510'                  #發票代碼%1+發票號碼%2作廢失敗！ 
             END CASE 
             LET g_errparam.replace[1] = g_base.inv_code
             LET g_errparam.replace[2] = g_base.inv_no
                 LET g_errparam.replace[3] = l_msg
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE    
             CALL cl_err()
             LET r_success = FALSE
          END IF        
       ELSE   
          LET r_success = FALSE
          RETURN r_success
       END IF
       
       RETURN r_success      
END FUNCTION

################################################################################
# Descriptions...: 更新發票號碼及寫入發票歷程檔
# Memo...........:
# Usage..........: CALL s_aist310_api_upd_invoice(p_isah011,p_js)
#                  RETURNING r_success
# Input parameter: p_isah011             #發票分群
#                  ls_js                 #發票相關資訊
# Return code....: 
# Date & Author..: 2019/11/04   By  05488
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aist310_api_upd_invoice(p_isah011,p_js)
DEFINE p_isah011                          LIKE isah_t.isah011          #發票分群       
DEFINE r_success                          LIKE type_t.num5                  
DEFINE p_js                              STRING   
DEFINE l_invoice          RECORD
            status_code                   STRING,                              #處理狀態碼
            description                   STRING,                              #處理描述
            billing_code                  LIKE isah_t.isah001,                 #發票代碼
            billing_no                    LIKE isah_t.isah002,                 #發票號碼
            billing_date                  LIKE isaf_t.isaf014,                 #發票開票日期
            is_preview                    LIKE type_t.chr1,                    #是否預覽 
            total_local_curr_tax_amount   LIKE isah_t.isah115,                 #發票價稅合計
            total_local_curr_tax          LIKE isah_t.isah114,                 #發票稅額合計
            is_tax_included               LIKE isaf_t.isaf017,                 #含?否   
            invoice_url                   LIKE isat_t.isat009                  #發票網址 
                          END RECORD                              
DEFINE l_isat             RECORD                                               #發票歷程檔
            isatent                       LIKE isat_t.isatent,                 #企業編碼
            isatcomp                      LIKE isat_t.isatcomp,                #法人
            isatdocno                     LIKE isat_t.isatdocno,               #開票單號
            isatseq                       LIKE isat_t.isatseq,                 #發票歷程項次
            isat001                       LIKE isat_t.isat001,                 #發票類型
            isat002                       LIKE isat_t.isat002,                 #電子發票否
            isat003                       LIKE isat_t.isat003,                 #發票代號
            isat004                       LIKE isat_t.isat004,                 #發票號碼
            isat005                       LIKE isat_t.isat005,                 #發票聯別
            isat006                       LIKE isat_t.isat006,                 #發票防偽隨機碼
            isat007                       LIKE isat_t.isat007,                 #發票日期
            isat008                       LIKE isat_t.isat008,                 #發票時間
            isat009                       LIKE isat_t.isat009,                 #發票客戶全名
            isat010                       LIKE isat_t.isat010,                 #購貨方統一編號
            isat011                       LIKE isat_t.isat011,                 #購貨方地址
            isat012                       LIKE isat_t.isat012,                 #銷方統一編號
            isat013                       LIKE isat_t.isat013,                 #POS單號
            isat014                       LIKE isat_t.isat014,                 #發票異動狀態
            isat015                       LIKE isat_t.isat015,                 #異動理由碼
            isat016                       LIKE isat_t.isat016,                 #異動備註
            isat017                       LIKE isat_t.isat017,                 #異動日期
            isat018                       LIKE isat_t.isat018,                 #異動時間
            isat019                       LIKE isat_t.isat019,                 #異動人員
            isat020                       LIKE isat_t.isat020,                 #專案作廢核准文號
            isat021                       LIKE isat_t.isat021,                 #列印次數
            isat022                       LIKE isat_t.isat022,                 #課稅別
            isat023                       LIKE isat_t.isat023,                 #稅率
            isat024                       LIKE isat_t.isat024,                 #檢查碼
            isat100                       LIKE isat_t.isat100,                 #幣別
            isat101                       LIKE isat_t.isat101,                 #匯率
            isat103                       LIKE isat_t.isat103,                 #發票原幣未稅金額
            isat104                       LIKE isat_t.isat104,                 #發票原幣稅額
            isat105                       LIKE isat_t.isat105,                 #發票原幣含稅金額
            isat106                       LIKE isat_t.isat106,                 #已折讓本幣未稅金額
            isat107                       LIKE isat_t.isat107,                 #已折讓本幣稅額
            isat113                       LIKE isat_t.isat113,                 #發票本幣未稅金額
            isat114                       LIKE isat_t.isat114,                 #發票本幣稅額
            isat115                       LIKE isat_t.isat115,                 #發票本幣含稅金額
            isat201                       LIKE isat_t.isat201,                 #帳款應稅金額
            isat202                       LIKE isat_t.isat202,                 #帳款零稅金額
            isat203                       LIKE isat_t.isat203,                 #帳款免稅金額
            isat204                       LIKE isat_t.isat204,                 #愛心碼
            isat205                       LIKE isat_t.isat205,                 #載具類別號碼
            isat206                       LIKE isat_t.isat206,                 #載具顯碼 ID
            isat207                       LIKE isat_t.isat207,                 #載具隱碼 ID
            isat208                       LIKE isat_t.isat208,                 #電子發票匯出狀態
            isat209                       LIKE isat_t.isat209,                 #電子發票匯出序號
            isatud001                     LIKE isat_t.isatud001,               #自定義欄位(文字)001
            isatud002                     LIKE isat_t.isatud002,               #自定義欄位(文字)002
            isatud003                     LIKE isat_t.isatud003,               #自定義欄位(文字)003
            isatud004                     LIKE isat_t.isatud004,               #自定義欄位(文字)004
            isatud005                     LIKE isat_t.isatud005,               #自定義欄位(文字)005
            isatud006                     LIKE isat_t.isatud006,               #自定義欄位(文字)006
            isatud007                     LIKE isat_t.isatud007,               #自定義欄位(文字)007
            isatud008                     LIKE isat_t.isatud008,               #自定義欄位(文字)008
            isatud009                     LIKE isat_t.isatud009,               #自定義欄位(文字)009
            isatud010                     LIKE isat_t.isatud010,               #自定義欄位(文字)010
            isatud011                     LIKE isat_t.isatud011,               #自定義欄位(數字)011
            isatud012                     LIKE isat_t.isatud012,               #自定義欄位(數字)012
            isatud013                     LIKE isat_t.isatud013,               #自定義欄位(數字)013
            isatud014                     LIKE isat_t.isatud014,               #自定義欄位(數字)014
            isatud015                     LIKE isat_t.isatud015,               #自定義欄位(數字)015
            isatud016                     LIKE isat_t.isatud016,               #自定義欄位(數字)016
            isatud017                     LIKE isat_t.isatud017,               #自定義欄位(數字)017
            isatud018                     LIKE isat_t.isatud018,               #自定義欄位(數字)018
            isatud019                     LIKE isat_t.isatud019,               #自定義欄位(數字)019
            isatud020                     LIKE isat_t.isatud020,               #自定義欄位(數字)020
            isatud021                     LIKE isat_t.isatud021,               #自定義欄位(日期時間)021
            isatud022                     LIKE isat_t.isatud022,               #自定義欄位(日期時間)022
            isatud023                     LIKE isat_t.isatud023,               #自定義欄位(日期時間)023
            isatud024                     LIKE isat_t.isatud024,               #自定義欄位(日期時間)024
            isatud025                     LIKE isat_t.isatud025,               #自定義欄位(日期時間)025
            isatud026                     LIKE isat_t.isatud026,               #自定義欄位(日期時間)026
            isatud027                     LIKE isat_t.isatud027,               #自定義欄位(日期時間)027
            isatud028                     LIKE isat_t.isatud028,               #自定義欄位(日期時間)028
            isatud029                     LIKE isat_t.isatud029,               #自定義欄位(日期時間)029
            isatud030                     LIKE isat_t.isatud030,               #自定義欄位(日期時間)030
            isatsite                      LIKE isat_t.isatsite,                #營運據點
            isatdocdt                     LIKE isat_t.isatdocdt,               #單據日期
            isat025                       LIKE isat_t.isat025,                 #發票最終狀態
            isat026                       LIKE isat_t.isat026,                 #電子發票類型
            isat027                       LIKE isat_t.isat027,                 #原發票日期
            isat028                       LIKE isat_t.isat028,                 #稅別
            isat029                       LIKE isat_t.isat029,                 #含稅否
            isat108                       LIKE isat_t.isat108,                 #留抵原幣稅額
            isat118                       LIKE isat_t.isat118,                 #留抵本幣稅額
            isat030                       LIKE isat_t.isat030,                 #發票簿號  
            isat031                       LIKE isat_t.isat031,                 #預覽發票URL
            isat032                       LIKE isat_t.isat032                  #電子發票URL
   END RECORD
        
        
        LET r_success = TRUE
        
        #更新發票代碼/發票號碼到isah_t
        CALL util.JSON.parse(p_js,l_invoice)                                   
        EXECUTE upd_isah001 USING l_invoice.billing_code,l_invoice.billing_no,p_isah011
        IF SQLCA.SQLcode THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.sqlcode
           LET g_errparam.extend = "UPD isah001/isah002"
           LET g_errparam.popup = TRUE
           CALL cl_err()        
           LET r_success = FALSE      
           RETURN r_success           
        END IF
        
        #寫入發票歷程檔isat_t
        LET l_isat.isatent = g_enterprise               #企業編碼
        LET l_isat.isatcomp = g_isafcomp                #法人
        LET l_isat.isatdocno = g_isafdocno              #開票號碼
        #項次
        EXECUTE get_isatseq USING l_invoice.billing_code,l_invoice.billing_no 
           INTO l_isat.isatseq
        IF cl_null(l_isat.isatseq) THEN 
           LET l_isat.isatseq = 1
        END IF
        LET l_isat.isat001 = g_isaf008                  #發票類型
        LET l_isat.isat002 = g_isaf009                  #電子發票否
        LET l_isat.isat003 = l_invoice.billing_code     #發票代碼
        LET l_isat.isat004 = l_invoice.billing_no       #發票號碼
        LET l_isat.isat005 = g_isaf053                  #發票聯別
        LET l_isat.isat006 = ''                         #發票防偽隨機碼
        LET l_isat.isat007 = l_invoice.billing_date     #發票日期
        LET l_isat.isat008 = cl_get_current()           #發票時間
        LET l_isat.isat009 = g_isaf021                  #發票客戶全名
        LET l_isat.isat010 = g_isaf022                  #購貨方統一編號
        LET l_isat.isat011 = g_isaf023                  #購貨方地址
        LET l_isat.isat012 = g_isao018                  #銷方統一編號
        LET l_isat.isat013 = ''                         #POS單號
        IF g_isaf056 = '1' THEN
           LET l_isat.isat014 = '11'                    #發票異動狀態   #11：發票開立
        ELSE
           LET l_isat.isat014 = '21'                    #發票異動狀態   #21：折讓開立   
        END IF
        LET l_isat.isat015 = ''                         #異動理由碼
        LET l_isat.isat016 = ''                         #異動備註
        LET l_isat.isat017 = l_invoice.billing_date     #異動日期
        LET l_isat.isat018 = cl_get_time()              #異動時間
        LET l_isat.isat019 = g_user                     #異動人員
        LET l_isat.isat020 = ''                         #專案作廢核准文號
        LET l_isat.isat021 = 0                          #列印次數
        LET l_isat.isat022 = g_isaf054                  #課稅別
        LET l_isat.isat023 = g_isaf018                  #稅率
        LET l_isat.isat024 = ''                         #檢查碼
        LET l_isat.isat100 = g_isaf100                  #幣別
        LET l_isat.isat101 = g_isaf101                  #匯率
        
        LET l_isat.isat103 = 0                          #發票原幣未稅金額                     
        LET l_isat.isat104 = 0                          #發票原幣稅額
        LET l_isat.isat105 = 0                          #發票原幣含稅金額
        EXECUTE get_isah103 USING p_isah011 INTO l_isat.isat103,l_isat.isat104,l_isat.isat105
        IF cl_null(l_isat.isat103) THEN LET l_isat.isat103 = 0 END IF
        IF cl_null(l_isat.isat104) THEN LET l_isat.isat104 = 0 END IF
        IF cl_null(l_isat.isat105) THEN LET l_isat.isat105 = 0 END IF
        
        LET l_isat.isat106 = 0                          #已折讓本幣未稅金額
        LET l_isat.isat107 = 0                          #已折讓本幣稅額
        LET l_isat.isat113 = l_invoice.total_local_curr_tax_amount - l_invoice.total_local_curr_tax       #發票本幣未稅金額
        LET l_isat.isat114 = l_invoice.total_local_curr_tax                                               #發票本幣稅額
        LET l_isat.isat115 = l_invoice.total_local_curr_tax_amount                                        #發票本幣含稅金額    
        #帳款應稅金額
        IF l_isat.isat022 = '1' THEN 
           LET l_isat.isat201 = l_isat.isat105
        ELSE
           LET l_isat.isat201 = 0
        END IF
        #帳款零稅金額
        IF l_isat.isat022 = '2' THEN 
           LET l_isat.isat202 = l_isat.isat105
        ELSE
           LET l_isat.isat202 = 0
        END IF
        #帳款免稅金額
        IF l_isat.isat022 = '3' THEN 
           LET l_isat.isat203 = l_isat.isat105
        ELSE
           LET l_isat.isat203 = 0
        END IF
        LET l_isat.isat204 = ''                         #愛心碼
        LET l_isat.isat205 = ''                         #載具類別號碼
        LET l_isat.isat206 = ''                         #載具顯碼 ID
        LET l_isat.isat207 = ''                         #載具隱碼 ID
        LET l_isat.isat208 = ''                         #電子發票匯出狀態
        LET l_isat.isat209 = ''                         #電子發票匯出序號
        LET l_isat.isatsite = g_isafsite                #營運據點
        LET l_isat.isatdocdt = g_isafdocdt              #單據日期
        LET l_isat.isat025 = l_isat.isat014             #發票最終狀態
        LET l_isat.isat026 = ''                         #電子發票類型
        LET l_isat.isat027 = ''                         #原發票日期
        LET l_isat.isat028 = g_isaf016                  #稅別
        LET l_isat.isat029 = g_isaf017                  #含稅否
        LET l_isat.isat108 = 0                          #留抵原幣稅額
        LET l_isat.isat118 = 0                          #留抵本幣稅額
        LET l_isat.isat030 = g_isaf051                  #發票簿號  
        IF  l_isat.isat002 = 'N' THEN
            LET l_isat.isat031 = l_invoice.invoice_url  #預覽發票URL
        ELSE                                            
            LET l_isat.isat032 = l_invoice.invoice_url  #電子發票URL   
        END IF  

        EXECUTE ins_isat
          USING l_isat.isatent,l_isat.isatcomp,l_isat.isatdocno,l_isat.isatseq,l_isat.isat001,
                l_isat.isat002,l_isat.isat003,l_isat.isat004,l_isat.isat005,l_isat.isat006,
                l_isat.isat007,l_isat.isat008,l_isat.isat009,l_isat.isat010,l_isat.isat011,
                l_isat.isat012,l_isat.isat013,l_isat.isat014,l_isat.isat015,l_isat.isat016,
                l_isat.isat017,l_isat.isat018,l_isat.isat019,l_isat.isat020,l_isat.isat021,
                l_isat.isat022,l_isat.isat023,l_isat.isat024,l_isat.isat100,l_isat.isat101,
                l_isat.isat103,l_isat.isat104,l_isat.isat105,l_isat.isat106,l_isat.isat107,
                l_isat.isat113,l_isat.isat114,l_isat.isat115,l_isat.isat201,l_isat.isat202,
                l_isat.isat203,l_isat.isat204,l_isat.isat205,l_isat.isat206,l_isat.isat207,
                l_isat.isat208,l_isat.isat209,l_isat.isatud001,l_isat.isatud002,l_isat.isatud003,
                l_isat.isatud004,l_isat.isatud005,l_isat.isatud006,l_isat.isatud007,l_isat.isatud008,
                l_isat.isatud009,l_isat.isatud010,l_isat.isatud011,l_isat.isatud012,l_isat.isatud013,
                l_isat.isatud014,l_isat.isatud015,l_isat.isatud016,l_isat.isatud017,l_isat.isatud018,
                l_isat.isatud019,l_isat.isatud020,l_isat.isatud021,l_isat.isatud022,l_isat.isatud023,
                l_isat.isatud024,l_isat.isatud025,l_isat.isatud026,l_isat.isatud027,l_isat.isatud028,
                l_isat.isatud029,l_isat.isatud030,l_isat.isatsite,l_isat.isatdocdt,l_isat.isat025,
                l_isat.isat026,l_isat.isat027,l_isat.isat028,l_isat.isat029,l_isat.isat108,
                l_isat.isat118,l_isat.isat030,l_isat.isat031,l_isat.isat032
        IF SQLCA.SQLcode THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.sqlcode
           LET g_errparam.extend = "ins isat_t"
           LET g_errparam.popup = TRUE
           CALL cl_err()        
           LET r_success = FALSE        
           RETURN r_success           
        END IF
        
        RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 發票相關檢核
# Memo...........:
# Usage..........: CALL s_aist310_api_chk_isat()
#                  RETURNING r_success,l_flag
# Input parameter: 
# Return code....: r_success              執行結果
#                  l_flag                 列印發票明細清單
# Date & Author..: 2019/11/06
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aist310_api_chk_isat()
DEFINE l_isat007                 LIKE isat_t.isat007                  #發票日期                            
DEFINE r_success                 LIKE type_t.num5
DEFINE l_flag                    LIKE type_t.chr1                     #是否列印清單
DEFINE l_isat_yyyy               LIKE type_t.num5                     #發票日期年度
DEFINE l_isat_mm                 LIKE type_t.num5                     #發票日期月份
DEFINE l_yyyy                    LIKE type_t.num5                     #當月年度
DEFINE l_mm                      LIKE type_t.num5                     #當月月份
DEFINE l_sql                     STRING
DEFINE l_cnt                     LIKE type_t.num5

        LET r_success = TRUE
        LET l_flag = 'N'
        
        CASE g_base.l_type
          WHEN '4'      #發票列印
                LET l_cnt = 0
                EXECUTE get_count_isah INTO l_cnt
                IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                IF l_cnt > 8 THEN
                   #一併呼叫發票明細列印
                   LET l_flag = 'Y'
                ELSE
                   LET l_flag = 'N'
                END IF                
          WHEN '5'      #明細列印
                LET l_cnt = 0
                EXECUTE get_count_isah INTO l_cnt
                IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                IF l_cnt <= 8 THEN
                   #明細資料未超過八行，不可執行發票清單列印！！
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'ais-00502'
                   LET g_errparam.replace[1] = g_base.inv_code
                   LET g_errparam.replace[2] = g_base.inv_no
                   LET g_errparam.extend = ''
                   LET g_errparam.popup = TRUE
                   CALL cl_err()        
                   LET r_success = FALSE        
                   RETURN r_success,l_flag           
                END IF                
          WHEN '6'      #作廢   
                EXECUTE get_isat007 INTO l_isat007              
                LET l_isat_mm = MONTH(l_isat007)
                LET l_isat_yyyy = YEAR(l_isat007)
                LET l_mm = MONTH(g_today)
                LET l_yyyy = YEAR(g_today)
                IF l_yyyy != l_isat_yyyy OR l_mm != l_isat_mm THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'ais-00507'
                   LET g_errparam.replace[1] = g_base.inv_code
                   LET g_errparam.replace[2] = g_base.inv_no
                   LET g_errparam.extend = ''
                   LET g_errparam.popup = TRUE
                   CALL cl_err()        
                   LET r_success = FALSE        
                   RETURN r_success,l_flag           
                END IF
        END CASE   
        
        RETURN r_success,l_flag
END FUNCTION

################################################################################
# Descriptions...: 更新發票歷程檔
# Memo...........:
# Usage..........: CALL s_aist310_api_upd_isat()
#                  RETURNING 
# Input parameter: 
# Return code....: 
# Date & Author..: 2019/11/06
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aist310_api_upd_isat()
DEFINE r_success                          LIKE type_t.num5
DEFINE l_cnt                              LIKE type_t.num5
DEFINE l_isat025                          LIKE isat_t.isat025                  #發票最終狀態
DEFINE l_isat018                          LIKE isat_t.isat025                  #異動時間
DEFINE l_isat003                          LIKE isat_t.isat003                  #發票代號
DEFINE l_isat004                          LIKE isat_t.isat004                  #發票號碼
DEFINE l_isat             RECORD                                               #發票歷程檔
            isatent                       LIKE isat_t.isatent,                 #企業編碼
            isatcomp                      LIKE isat_t.isatcomp,                #法人
            isatdocno                     LIKE isat_t.isatdocno,               #開票單號
            isatseq                       LIKE isat_t.isatseq,                 #發票歷程項次
            isat001                       LIKE isat_t.isat001,                 #發票類型
            isat002                       LIKE isat_t.isat002,                 #電子發票否
            isat003                       LIKE isat_t.isat003,                 #發票代號
            isat004                       LIKE isat_t.isat004,                 #發票號碼
            isat005                       LIKE isat_t.isat005,                 #發票聯別
            isat006                       LIKE isat_t.isat006,                 #發票防偽隨機碼
            isat007                       LIKE isat_t.isat007,                 #發票日期
            isat008                       LIKE isat_t.isat008,                 #發票時間
            isat009                       LIKE isat_t.isat009,                 #發票客戶全名
            isat010                       LIKE isat_t.isat010,                 #購貨方統一編號
            isat011                       LIKE isat_t.isat011,                 #購貨方地址
            isat012                       LIKE isat_t.isat012,                 #銷方統一編號
            isat013                       LIKE isat_t.isat013,                 #POS單號
            isat014                       LIKE isat_t.isat014,                 #發票異動狀態
            isat015                       LIKE isat_t.isat015,                 #異動理由碼
            isat016                       LIKE isat_t.isat016,                 #異動備註
            isat017                       LIKE isat_t.isat017,                 #異動日期
            isat018                       LIKE isat_t.isat018,                 #異動時間
            isat019                       LIKE isat_t.isat019,                 #異動人員
            isat020                       LIKE isat_t.isat020,                 #專案作廢核准文號
            isat021                       LIKE isat_t.isat021,                 #列印次數
            isat022                       LIKE isat_t.isat022,                 #課稅別
            isat023                       LIKE isat_t.isat023,                 #稅率
            isat024                       LIKE isat_t.isat024,                 #檢查碼
            isat100                       LIKE isat_t.isat100,                 #幣別
            isat101                       LIKE isat_t.isat101,                 #匯率
            isat103                       LIKE isat_t.isat103,                 #發票原幣未稅金額
            isat104                       LIKE isat_t.isat104,                 #發票原幣稅額
            isat105                       LIKE isat_t.isat105,                 #發票原幣含稅金額
            isat106                       LIKE isat_t.isat106,                 #已折讓本幣未稅金額
            isat107                       LIKE isat_t.isat107,                 #已折讓本幣稅額
            isat113                       LIKE isat_t.isat113,                 #發票本幣未稅金額
            isat114                       LIKE isat_t.isat114,                 #發票本幣稅額
            isat115                       LIKE isat_t.isat115,                 #發票本幣含稅金額
            isat201                       LIKE isat_t.isat201,                 #帳款應稅金額
            isat202                       LIKE isat_t.isat202,                 #帳款零稅金額
            isat203                       LIKE isat_t.isat203,                 #帳款免稅金額
            isat204                       LIKE isat_t.isat204,                 #愛心碼
            isat205                       LIKE isat_t.isat205,                 #載具類別號碼
            isat206                       LIKE isat_t.isat206,                 #載具顯碼 ID
            isat207                       LIKE isat_t.isat207,                 #載具隱碼 ID
            isat208                       LIKE isat_t.isat208,                 #電子發票匯出狀態
            isat209                       LIKE isat_t.isat209,                 #電子發票匯出序號
            isatud001                     LIKE isat_t.isatud001,               #自定義欄位(文字)001
            isatud002                     LIKE isat_t.isatud002,               #自定義欄位(文字)002
            isatud003                     LIKE isat_t.isatud003,               #自定義欄位(文字)003
            isatud004                     LIKE isat_t.isatud004,               #自定義欄位(文字)004
            isatud005                     LIKE isat_t.isatud005,               #自定義欄位(文字)005
            isatud006                     LIKE isat_t.isatud006,               #自定義欄位(文字)006
            isatud007                     LIKE isat_t.isatud007,               #自定義欄位(文字)007
            isatud008                     LIKE isat_t.isatud008,               #自定義欄位(文字)008
            isatud009                     LIKE isat_t.isatud009,               #自定義欄位(文字)009
            isatud010                     LIKE isat_t.isatud010,               #自定義欄位(文字)010
            isatud011                     LIKE isat_t.isatud011,               #自定義欄位(數字)011
            isatud012                     LIKE isat_t.isatud012,               #自定義欄位(數字)012
            isatud013                     LIKE isat_t.isatud013,               #自定義欄位(數字)013
            isatud014                     LIKE isat_t.isatud014,               #自定義欄位(數字)014
            isatud015                     LIKE isat_t.isatud015,               #自定義欄位(數字)015
            isatud016                     LIKE isat_t.isatud016,               #自定義欄位(數字)016
            isatud017                     LIKE isat_t.isatud017,               #自定義欄位(數字)017
            isatud018                     LIKE isat_t.isatud018,               #自定義欄位(數字)018
            isatud019                     LIKE isat_t.isatud019,               #自定義欄位(數字)019
            isatud020                     LIKE isat_t.isatud020,               #自定義欄位(數字)020
            isatud021                     LIKE isat_t.isatud021,               #自定義欄位(日期時間)021
            isatud022                     LIKE isat_t.isatud022,               #自定義欄位(日期時間)022
            isatud023                     LIKE isat_t.isatud023,               #自定義欄位(日期時間)023
            isatud024                     LIKE isat_t.isatud024,               #自定義欄位(日期時間)024
            isatud025                     LIKE isat_t.isatud025,               #自定義欄位(日期時間)025
            isatud026                     LIKE isat_t.isatud026,               #自定義欄位(日期時間)026
            isatud027                     LIKE isat_t.isatud027,               #自定義欄位(日期時間)027
            isatud028                     LIKE isat_t.isatud028,               #自定義欄位(日期時間)028
            isatud029                     LIKE isat_t.isatud029,               #自定義欄位(日期時間)029
            isatud030                     LIKE isat_t.isatud030,               #自定義欄位(日期時間)030
            isatsite                      LIKE isat_t.isatsite,                #營運據點
            isatdocdt                     LIKE isat_t.isatdocdt,               #單據日期
            isat025                       LIKE isat_t.isat025,                 #發票最終狀態
            isat026                       LIKE isat_t.isat026,                 #電子發票類型
            isat027                       LIKE isat_t.isat027,                 #原發票日期
            isat028                       LIKE isat_t.isat028,                 #稅別
            isat029                       LIKE isat_t.isat029,                 #含稅否
            isat108                       LIKE isat_t.isat108,                 #留抵原幣稅額
            isat118                       LIKE isat_t.isat118,                 #留抵本幣稅額
            isat030                       LIKE isat_t.isat030,                 #發票簿號  
            isat031                       LIKE isat_t.isat031,                 #預覽發票URL
            isat032                       LIKE isat_t.isat032                  #電子發票URL
   END RECORD

    LET r_success = TRUE
    
    LET l_isat018 = cl_get_time() 
    CASE g_base.l_type
      WHEN '4'        #發票列印
          UPDATE isat_t
             SET isat021 = isat021 + 1
           WHERE isatent = g_enterprise
             AND isatdocno = g_isafdocno
             AND isatcomp = g_isafcomp
             AND isat003 = g_base.inv_code
             AND isat004 = g_base.inv_no       
          IF SQLCA.SQLcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = "upd isat021"
             LET g_errparam.popup = TRUE
             CALL cl_err()        
             LET r_success = FALSE        
             RETURN r_success           
          END IF
      WHEN '6'        #發票作廢
        EXECUTE get_isat INTO l_isat.isatent,l_isat.isatcomp,l_isat.isatdocno,l_isat.isatseq,l_isat.isat001,
                              l_isat.isat002,l_isat.isat003,l_isat.isat004,l_isat.isat005,l_isat.isat006,
                              l_isat.isat007,l_isat.isat008,l_isat.isat009,l_isat.isat010,l_isat.isat011,
                              l_isat.isat012,l_isat.isat013,l_isat.isat014,l_isat.isat015,l_isat.isat016,
                              l_isat.isat017,l_isat.isat018,l_isat.isat019,l_isat.isat020,l_isat.isat021,
                              l_isat.isat022,l_isat.isat023,l_isat.isat024,l_isat.isat100,l_isat.isat101,
                              l_isat.isat103,l_isat.isat104,l_isat.isat105,l_isat.isat106,l_isat.isat107,
                              l_isat.isat113,l_isat.isat114,l_isat.isat115,l_isat.isat201,l_isat.isat202,
                              l_isat.isat203,l_isat.isat204,l_isat.isat205,l_isat.isat206,l_isat.isat207,
                              l_isat.isat208,l_isat.isat209,l_isat.isatud001,l_isat.isatud002,l_isat.isatud003,
                              l_isat.isatud004,l_isat.isatud005,l_isat.isatud006,l_isat.isatud007,l_isat.isatud008,
                              l_isat.isatud009,l_isat.isatud010,l_isat.isatud011,l_isat.isatud012,l_isat.isatud013,
                              l_isat.isatud014,l_isat.isatud015,l_isat.isatud016,l_isat.isatud017,l_isat.isatud018,
                              l_isat.isatud019,l_isat.isatud020,l_isat.isatud021,l_isat.isatud022,l_isat.isatud023,
                              l_isat.isatud024,l_isat.isatud025,l_isat.isatud026,l_isat.isatud027,l_isat.isatud028,
                              l_isat.isatud029,l_isat.isatud030,l_isat.isatsite,l_isat.isatdocdt,l_isat.isat025,
                              l_isat.isat026,l_isat.isat027,l_isat.isat028,l_isat.isat029,l_isat.isat030,
                              l_isat.isat031,l_isat.isat032,l_isat.isat108,l_isat.isat118 
                              
        IF g_isaf056 = '1' THEN
           LET l_isat025 = '12'     #發票作廢
        ELSE
           LET l_isat025 = '22'     #折讓作廢
        END IF
        #更新舊的發票最終狀態
        UPDATE isat_t
           SET isat018 = l_isat018,
               isat019 = g_user,
               isat025 = l_isat025
         WHERE isatent = g_enterprise
           AND isatcomp = g_isafcomp
           AND isatdocno = g_isafdocno
           AND isat003 = g_base.inv_code
           AND isat004 = g_base.inv_no     
           AND isat014 IN ('11','12')  
        IF SQLCA.SQLcode THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.sqlcode
           LET g_errparam.extend = "upd isat021"
           LET g_errparam.popup = TRUE
           CALL cl_err()        
           LET r_success = FALSE        
           RETURN r_success 
        ELSE   
           UPDATE isah_t
              SET isah001 = '',
                  isah002 = '',
                  isah015 = isah015 + 1
            WHERE isahent = g_enterprise
              AND isahcomp = g_isafcomp
              AND isahdocno = g_isafdocno
              AND isah001 = g_base.inv_code
              AND isah002 = g_base.inv_no     
           IF SQLCA.sqlcode THEN
              INITIALIZE g_errparam TO NULL
              LET g_errparam.code = SQLCA.sqlcode
              LET g_errparam.extend = 'UPDATE isah001/isah002 wrong'
              LET g_errparam.popup = TRUE
              LET g_errparam.sqlerr = SQLCA.SQLCODE
              CALL cl_err()
              LET r_success = FALSE
              RETURN r_success
           END IF           
        END IF
        #寫一筆作廢發票資料到isat_t
        LET l_isat.isatseq = ''                       #發票項次
        EXECUTE get_isatseq USING g_base.inv_code,g_base.inv_no  
           INTO l_isat.isatseq
        IF cl_null(l_isat.isatseq) THEN 
           LET l_isat.isatseq = 1
        END IF
        LET l_isat.isat003 = g_base.inv_code          #發票代碼
        IF cl_null(l_isat.isat003) THEN LET l_isat.isat003 = " " END IF
        LET l_isat.isat004 = g_base.inv_no            #發票號碼
        IF cl_null(l_isat.isat004) THEN LET l_isat.isat004 = " " END IF
        LET l_isat.isat014 = l_isat025                #發票狀態
        LET l_isat.isat025 = l_isat025                #發票最終狀態
        LET l_isat.isat017 = g_today                  #異動日期
        LET l_isat.isat018 = cl_get_time()            #異動時間
        LET l_isat.isat019 = g_user                   #異動人員
        EXECUTE ins_isat
          USING l_isat.isatent,l_isat.isatcomp,l_isat.isatdocno,l_isat.isatseq,l_isat.isat001,
                l_isat.isat002,l_isat.isat003,l_isat.isat004,l_isat.isat005,l_isat.isat006,
                l_isat.isat007,l_isat.isat008,l_isat.isat009,l_isat.isat010,l_isat.isat011,
                l_isat.isat012,l_isat.isat013,l_isat.isat014,l_isat.isat015,l_isat.isat016,
                l_isat.isat017,l_isat.isat018,l_isat.isat019,l_isat.isat020,l_isat.isat021,
                l_isat.isat022,l_isat.isat023,l_isat.isat024,l_isat.isat100,l_isat.isat101,
                l_isat.isat103,l_isat.isat104,l_isat.isat105,l_isat.isat106,l_isat.isat107,
                l_isat.isat113,l_isat.isat114,l_isat.isat115,l_isat.isat201,l_isat.isat202,
                l_isat.isat203,l_isat.isat204,l_isat.isat205,l_isat.isat206,l_isat.isat207,
                l_isat.isat208,l_isat.isat209,l_isat.isatud001,l_isat.isatud002,l_isat.isatud003,
                l_isat.isatud004,l_isat.isatud005,l_isat.isatud006,l_isat.isatud007,l_isat.isatud008,
                l_isat.isatud009,l_isat.isatud010,l_isat.isatud011,l_isat.isatud012,l_isat.isatud013,
                l_isat.isatud014,l_isat.isatud015,l_isat.isatud016,l_isat.isatud017,l_isat.isatud018,
                l_isat.isatud019,l_isat.isatud020,l_isat.isatud021,l_isat.isatud022,l_isat.isatud023,
                l_isat.isatud024,l_isat.isatud025,l_isat.isatud026,l_isat.isatud027,l_isat.isatud028,
                l_isat.isatud029,l_isat.isatud030,l_isat.isatsite,l_isat.isatdocdt,l_isat.isat025,
                l_isat.isat026,l_isat.isat027,l_isat.isat028,l_isat.isat029,l_isat.isat108,
                l_isat.isat118,l_isat.isat030,l_isat.isat031,l_isat.isat032
        IF SQLCA.SQLcode THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.sqlcode
           LET g_errparam.extend = "ins isat_t"
           LET g_errparam.popup = TRUE
           CALL cl_err()        
           LET r_success = FALSE        
           RETURN r_success         
        ELSE
           #更新單頭isaf_t發票代碼/發票號碼
           LET l_cnt = 0
           SELECT COUNT(DISTINCT isat004) INTO l_cnt
             FROM isat_t
            WHERE isatent = g_enterprise
              AND isatdocno = g_isafdocno
              AND isatcomp = g_isafcomp
              AND isat025 IN ('11','21')
           IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
           IF l_cnt = 0 THEN
              #發票歷程檔裡無"開立"發票時，要將單頭發票代碼/發票號碼清空
              LET l_isat003 = ''
              LET l_isat004 = ''
           ELSE
              IF l_cnt > 1 THEN
                 #多張發票號碼時，單頭發票號碼給MULTI
                 LET l_isat003 = ''
                 SELECT DISTINCT isat003 INTO l_isat003
                   FROM isat_t
                  WHERE isatent = g_enterprise
                    AND isatdocno = g_isafdocno
                    AND isatcomp = g_isafcomp
                 LET l_isat004 = 'MULTI'
              ELSE
                 LET l_isat003 = ''
                 LET l_isat004 = ''
                 SELECT isat003,isat004 
                   INTO l_isat003,l_isat004
                   FROM isat_t
                  WHERE isatent = g_enterprise
                    AND isatdocno = g_isafdocno
                    AND isatcomp = g_isafcomp
                    AND isat025 IN ('11','21')
              END IF
           END IF  
           #更新單頭發票代碼/發票號碼
           UPDATE isaf_t
              SET isaf010 = l_isat003,
                  isaf011 = l_isat004
            WHERE isafent = g_enterprise
              AND isafdocno = g_isafdocno
              AND isafcomp = g_isafcomp
           IF SQLCA.SQLcode THEN
              INITIALIZE g_errparam TO NULL
              LET g_errparam.code = SQLCA.sqlcode
              LET g_errparam.extend = "UPD isaf010/isaf011"
              LET g_errparam.popup = TRUE
              CALL cl_err()        
              LET r_success = FALSE  
              RETURN r_success           
           END IF        
        END IF
    END CASE
    
    RETURN r_success
END FUNCTION

 
{</section>}
 
