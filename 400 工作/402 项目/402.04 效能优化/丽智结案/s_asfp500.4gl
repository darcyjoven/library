#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_asfp500.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0002(1900-01-01 00:00:00), PR版次:0002(2019-05-24 14:25:55)
#+ Customerized Version.: SD版次:0001(1900-01-01 00:00:00), PR版次:0002(2019-06-01 20:10:49)
#+ Build......: 000161
#+ Filename...: s_asfp500
#+ Description: 工單結案應用元件集合
#+ Creator....: 00378(2014-03-24 15:05:20)
#+ Modifier...: 00000 -SD/PR- 02159
 
{</section>}
 
{<section id="s_asfp500.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#160104-00009#1   2016/01/08 By tsungyung 自动结案需抓取aooi200的设定值
#151207-00017#2   2016/01/08 By shiun     結案時，若是MPS計劃，則更新已開工單量
#160111-00024#2   2016/01/28 By Ann_Huang 取得最大日期時增加記錄單據來源
#160129-00002#4   2016/02/17 By Jessica   當工單結案批次作業時,需通知MES
#160728-00019#1   2016/07/28 By Ann_Huang 修正若無單據的資料會無法結案
#161116-00008#3   2016/11/16 By Jessica   舊版MES整合接口與新版中台標準接口相容修改
#161109-00085#50  2016/11/22 By 08993     整批調整系統星號寫法
#161231-00004#1   2017/01/06 By fionchen  調整工單設預結案日,若無相關單據則結案日預設為作業日,作業日小於工單單據日期,則預設為工單單據日期
#170116-00058#1   2017/01/23 By shiun     工單來源為6.獨立需求單時，更新已耗需求數量
#170301-00021#7   2017/03/02 By 09263     g_prog整批調整
#170320-00018#1   2017/03/21 By 02111     調整改成抓sffbdocdt(單據日期)和sffb012(完工日期)來做比對，抓最大的日期來更新結案日期。
#170222-00022#1   2017/03/27 By Jessica   調整信息差異
#170331-00039#1   2017/03/31 By Whitney   更新單頭資訊時一併紀錄修改人員和修改時間
#170222-00022#7   2017/03/31 By Jessica   修改訊息顯示
#170509-00087#1   2017/05/11 By xujing      未完成單據應增加顯示工單變更單
#170817-00007#1   2017/08/17 By zhaoqya   g_cnt从num5->num10
#170807-00020#8   2017/08/25 By Mars      增加ERP拋轉MES單據別判斷
#170816-00007#80  2017/10/20 By 10042     調整公用元件錯誤訊息,顯示更明確的資訊內容
#170105-00051#6   2017/12/13 By 10046     單據異動成功後，將異動資料寫入logc_t中，以利後續查看
#171211-00028#16  2018/02/09 By 05423     工单结案时，产生差异数据到xcna/xcnb/xcnc
#180503-00021#1   2018/05/29 By 07423     新增工單結案檢查sub function,供其他作業可執行
#180622-00027#1   2018/06/22 By 01366     MES報工單及發料單沒有拋給ERP時，不允許ERP工單結案，MES回饋錯誤訊息，但ERP沒有顯示錯誤訊息內容
#180823-00024#1   2018/08/23 By 10042     "MERGE INTO s_asfp500_xcnb" 的地方增加產品特徵不能為NULL的防呆，SELECT的條件多增加KEY值'xcnbseq'
#180914-00009#1   2018/09/14 By 10042     有一行被180823-00024#1 mark掉， 但忘記註記修改單號，補上該行的單號註記
#180914-00028#1   2018/09/14 By 10042     FOREACH s_asfp500_xcnc_c2 中 xcnc016應改為xcnc012
#180928-00024#1   2018/09/29 By 02295     工单产生差异数据的s_asfp500_ins_xcna()位置写的不对,这样会导致sqlca.sqlcode记录值,事务会回滚
#190107-00069#1   2019/01/09 By 10046     修正拋轉MES時，錯誤訊息顯示的工單單號錯誤
#190115-00046#1   2019/01/15 By 10046     修正#190107-00069#1錯誤訊息重複顯示
#190523-00038#1   2019/05/24 By 02159     需將採購單單身都結案完後,再跑整張結案
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"
#C20190123-09421#1 2019/01/23 By wangll   收集报错信息工单号错误
#C190601-06857#   备注移到单头    #add by shengbiao180514   
#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util   #170105-00051#6 add
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_asfp500.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_asfp500.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
#170222-00022#7-S
GLOBALS
DEFINE g_err_collect BOOLEAN
DEFINE g_cnt         LIKE type_t.num10 #170817-00007#1 g_cnt从num5->num10
END GLOBALS
#170222-00022#7-E
#170105-00051#6 add --s
PRIVATE TYPE type_g_sfaa_m    RECORD 											
             sfaaent     LIKE sfaa_t.sfaaent,											
             sfaasite    LIKE sfaa_t.sfaasite, 											
             sfaadocno   LIKE sfaa_t.sfaadocno, 											
             sfaastus    LIKE sfaa_t.sfaastus,											
             sfaa047     LIKE sfaa_t.sfaa047,											
             sfaa065     LIKE sfaa_t.sfaa065
               END RECORD	
DEFINE g_log1      STRING              #log用											
DEFINE g_log2      STRING              #log用
DEFINE g_pid       STRING              #lixwz add
#170105-00051#6 add --e
#end add-point
 
{</section>}
 
{<section id="s_asfp500.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_asfp500.other_function" readonly="Y" type="s" >}
################################################################################
# Descriptions...: 工单相关单据是否均已经完成判断
# Memo...........:
# Usage..........: CALL s_asfp500_unfinished_chk(p_sfaadocno)
#                       RETURNING r_success
# Input parameter: p_sfaadocno    工单编号
# Return code....: r_success      未完成否标识符 TRUE有未完成单据  FALSE无未完成单据
# Date & Author..: 2014-03-24 By Carrier
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_unfinished_chk(p_sfaadocno)
   DEFINE p_sfaadocno    LIKE sfaa_t.sfaadocno
   DEFINE r_success      LIKE type_t.num5
   DEFINE l_cnt          LIKE type_t.num10   

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   #1.发料单/退料单(sfdadocno):工单存在sfdb001、sfdc001，状态不等于作废或过账的都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt 
     FROM sfda_t,sfdc_t
     WHERE sfdaent = sfdcent AND sfdaent = g_enterprise
       AND sfdadocno = sfdcdocno
       AND sfdc001 = p_sfaadocno
       AND sfdastus <> 'X' AND sfdastus <> 'S'   
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF
      
   #2.报工单(sffbdocno):工单存在sffb005,状态不等于已确认或已作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM sffb_t
     WHERE sffbent = g_enterprise
       AND sffb005 = p_sfaadocno
       AND sffbstus <> 'X' AND sffbstus <> 'Y'  
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF

   #3.当站报废(sfgadocno):工单存在sfga004，状态不等于过账或作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM sfga_t
     WHERE sfgaent = g_enterprise
       AND sfga004 = p_sfaadocno
       AND sfgastus <> 'X' AND sfgastus <> 'S'   
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF
   
   #4.当站下线(sfhadocno):工单存在sfha004，状态不等于过账或作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM sfha_t
     WHERE sfhaent = g_enterprise
       AND sfha004 = p_sfaadocno
       AND sfhastus <> 'X' AND sfhastus <> 'S'
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF

   #5.重工转出单(sfiadoccno):工单存在sfia003，状态不等于确认或作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM sfia_t
     WHERE sfiaent = g_enterprise
       AND sfia003 = p_sfaadocno
       AND sfiastus <> 'X' AND sfiastus <> 'Y'  
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF
   
   #6.下阶料报废(sfjadocno):工单存在sfjb001，状态不等于已过账、已作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM sfja_t,sfjb_t
     WHERE sfjaent = sfjbent AND sfjaent = g_enterprise
       AND sfjadocno = sfjbdocno
       AND sfjb001 = p_sfaadocno
       AND sfjastus <> 'X' AND sfjastus <> 'S' 
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF

   #7.完工入库单(sfeadocno):工单存在sfeb001，状态不等于己过账、已作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM sfea_t,sfeb_t
     WHERE sfeaent = sfebent AND sfeaent = g_enterprise
       AND sfeadocno = sfebdocno
       AND sfeb001 = p_sfaadocno
       AND sfeastus <> 'X' AND sfeastus <> 'S' 
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF


   #8.FQC(qbadocno):用QC单上的来源单号qcba003找完工入库单sfebdocno,
   #如果QC单状态不等于已确认、已作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM qcba_t
     WHERE qcbaent = g_enterprise
       AND qcba003 = p_sfaadocno
       AND qcbastus <> 'X' AND qcbastus <> 'Y'
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF
   
   #9. 委外采购单(pmdldocno):工单存在pmdp003，状态不等于确认的数据
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM pmdl_t,pmdp_t
     WHERE pmdlent = pmdpent AND pmdlent = g_enterprise
       AND pmdldocno = pmdpdocno
       AND pmdp003 = p_sfaadocno
#       AND pmdlstus <> 'X' AND pmdlstus <> 'Y'  #160203-00005 by whitney mark
       AND pmdlstus NOT IN ('X','Y','C')  #160203-00005 by whitney add
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF
   
   #10.委外收货单、验退(pmdsdocno):工单存在pmdv014，状态不等于确认、作废的数据
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM pmds_t,pmdv_t
    WHERE pmdsent   = pmdvent AND pmdsent = g_enterprise
      AND pmdsdocno = pmdvdocno
      AND pmdv014   = p_sfaadocno
      AND pmdsstus <> 'X' AND pmdsstus <> 'Y' 
      AND pmds000 IN ('1','5')  
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF

   #11.委外入库单、仓退单(pmdsdocno):工单存在pmdv014，状态不等于过帐、作废的数据
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt  
     FROM pmds_t,pmdv_t
    WHERE pmdsent   = pmdvent AND pmdsent = g_enterprise
      AND pmdsdocno = pmdvdocno
      AND pmdv014   = p_sfaadocno
      AND pmdsstus <> 'X' AND pmdsstus <> 'S' 
      AND pmds000 IN ('3','6','7')  
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF

   #12.IQC(qbadocno):用QC单上的来源单号qcba001、项次qcba002，找委外收货单对内的工单pmdv014，如果QC单状态不等于已确认、已作废的数据都显示
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt 
     FROM qcba_t,pmdv_t
    WHERE qcbaent = pmdvent   AND qcbaent = g_enterprise
      AND qcba001 = pmdvdocno AND qcba002 = pmdvseq
      AND pmdv014 = p_sfaadocno
      AND qcbastus <> 'X' AND qcbastus <> 'Y'    
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      RETURN r_success
   END IF
   
   LET r_success = FALSE
   RETURN r_success
   
END FUNCTION
################################################################################
# Descriptions...: 与工单相关的未完成单据收集
# Memo...........:
# Usage..........: CALL s_asfp500_unfinished_reference(p_sfaadocno,p_close_dd,p_flag)
#                       RETURNING r_success,r_cnt,r_arr
# Input parameter: p_sfaadocno    工单编号
#                : p_close_dd     工单结案日期
#                : p_flag         '1' 未完成单据收集  '2'大于工单结案日期的相关单据收集
# Return code....: r_success      成功否标识符 'N' 有异常错误  ‘A’ 有未完单据 ‘Y’ 无未完单据
#                : r_cnt          未完成的单据笔数
#                : r_arr          未完成的单据清单
# Date & Author..: 2014-04-04 By Carrier
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_unfinished_reference(p_sfaadocno,p_close_dd,p_flag)
   DEFINE p_sfaadocno    LIKE sfaa_t.sfaadocno
   DEFINE p_close_dd     LIKE type_t.dat
   DEFINE p_flag         LIKE type_t.chr1
   DEFINE r_success      LIKE type_t.chr1
   DEFINE r_arr          DYNAMIC ARRAY OF RECORD
                         sdocno        LIKE sfaa_t.sfaadocno,
                         prog          LIKE gzza_t.gzza001, 
                         prog_desc     LIKE type_t.chr50, 
                         docno         LIKE sfaa_t.sfaadocno, 
                         stus          LIKE sfaa_t.sfaastus, 
                         crtid         LIKE sfaa_t.sfaacrtid, 
                         crtid_desc    LIKE type_t.chr50,  
                         crtdp         LIKE sfaa_t.sfaacrtdp, 
                         crtdp_desc    LIKE type_t.chr50,
                         opendd        LIKE type_t.dat,
                         postdd        LIKE type_t.dat,                         
                         errno         LIKE gzze_t.gzze001,
                         err_desc      LIKE type_t.chr200
                         END RECORD 
   DEFINE l_arr          RECORD
                         prog          LIKE gzza_t.gzza001,
                         docno         LIKE sfaa_t.sfaadocno,
                         stus          LIKE sfaa_t.sfaastus,
                         crtid         LIKE sfaa_t.sfaacrtid,
                         crtdp         LIKE sfaa_t.sfaacrtdp,
                         opendd        LIKE type_t.dat,
                         postdd        LIKE type_t.dat,                         
                         errno         LIKE gzze_t.gzze001
                         END RECORD 
   DEFINE l_arr_tmp      DYNAMIC ARRAY OF RECORD
                         prog          LIKE gzza_t.gzza001,
                         docno         LIKE sfaa_t.sfaadocno,
                         stus          LIKE sfaa_t.sfaastus,
                         crtid         LIKE sfaa_t.sfaacrtid,
                         crtdp         LIKE sfaa_t.sfaacrtdp,
                         opendd        LIKE type_t.dat,
                         postdd        LIKE type_t.dat,                         
                         errno         LIKE gzze_t.gzze001
                         END RECORD
   DEFINE r_cnt          LIKE type_t.num10
   DEFINE l_idx          LIKE type_t.num10 
   DEFINE l_i            LIKE type_t.num10       
   DEFINE l_pass         LIKE type_t.chr1
   DEFINE l_cols         LIKE type_t.chr500
   DEFINE l_tabs         LIKE type_t.chr100
   DEFINE l_cond1        LIKE type_t.chr1000
   DEFINE l_cond2        LIKE type_t.chr1000
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_type         LIKE type_t.chr10

   WHENEVER ERROR CONTINUE
   
   LET r_success = 'N'
   CALL l_arr_tmp.clear()
   LET r_cnt = 0   
   LET l_pass = 'Y'
   LET l_idx = 0
   
   #1.发料/退料单状态检查:状态不等于作废或过账
   DECLARE s_asfp500_unfinished_reference_sfdc_cs1 CURSOR FOR
    SELECT UNIQUE sfda002,'asft310',sfdadocno,sfdastus,sfdacrtid,sfdacrtdp,sfdadocdt,sfda001,'' FROM sfda_t,sfdc_t
     WHERE sfdaent = sfdcent AND sfdaent = g_enterprise
       AND sfdadocno = sfdcdocno
       AND sfdc001 = p_sfaadocno
       AND sfdastus <> 'X' AND sfdastus <> 'S'  
       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfdc_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

  FOREACH s_asfp500_unfinished_reference_sfdc_cs1 INTO l_type,l_arr.*   

 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfdc_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      CASE l_type
           WHEN '11'  LET l_arr.prog = 'asft311'
           WHEN '12'  LET l_arr.prog = 'asft312'
           WHEN '13'  LET l_arr.prog = 'asft313'
           WHEN '14'  LET l_arr.prog = 'asft314'
           WHEN '15'  LET l_arr.prog = 'asft315'
           WHEN '21'  LET l_arr.prog = 'asft321'
           WHEN '22'  LET l_arr.prog = 'asft322'
           WHEN '23'  LET l_arr.prog = 'asft323'
           WHEN '24'  LET l_arr.prog = 'asft324'
           WHEN '25'  LET l_arr.prog = 'asft325'      
      END CASE
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00204'
   END FOREACH

   #2.报工单状态检查:状态不等于已确认或已作废
   DECLARE s_asfp500_unfinished_reference_sffb_cs CURSOR FOR
    #SELECT UNIQUE 'asft335',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,'','' FROM sffb_t #170320-00018#1 mark
    SELECT UNIQUE 'asft335',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,sffb012,'' FROM sffb_t #170320-00018#1 add
     WHERE sffbent = g_enterprise
       AND sffb005 = p_sfaadocno
       AND sffbstus <> 'X' AND sffbstus <> 'Y'
       AND sffbseq = 0    #asft335报工时,sffbseq =0
    UNION
    #SELECT UNIQUE 'asft330',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,'','' FROM sffb_t     #170320-00018#1 mark
    SELECT UNIQUE 'asft330',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,sffb012,'' FROM sffb_t #170320-00018#1 add    
     WHERE sffbent = g_enterprise
       AND sffb005 = p_sfaadocno
       AND sffbstus <> 'X' AND sffbstus <> 'Y'
       AND sffbseq > 0    #asft330报工时,sffbseq >0    
       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sffb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

  
   FOREACH s_asfp500_unfinished_reference_sffb_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sffb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH

   #3.当站报废单状态检查:状态不等于过账或作废
   DECLARE s_asfp500_unfinished_reference_sfga_cs CURSOR FOR
    SELECT UNIQUE 'asft336',sfgadocno,sfgastus,sfgacrtid,sfgacrtdp,sfgadocdt,sfga001,'' FROM sfga_t
     WHERE sfgaent = g_enterprise
       AND sfga004 = p_sfaadocno
       AND sfgastus <> 'X' AND sfgastus <> 'S'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfga_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

   FOREACH s_asfp500_unfinished_reference_sfga_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfga_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00204'      
   END FOREACH

   #4.当站下线单状态检查:状态不等于过账或作废
   DECLARE s_asfp500_unfinished_reference_sfha_cs CURSOR FOR
    SELECT UNIQUE 'asft337',sfhadocno,sfhastus,sfhacrtid,sfhacrtdp,sfhadocdt,sfha001,'' FROM sfha_t
     WHERE sfhaent = g_enterprise
       AND sfha004 = p_sfaadocno
       AND sfhastus <> 'X' AND sfhastus <> 'S'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfha_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

   FOREACH s_asfp500_unfinished_reference_sfha_cs INTO l_arr.* 
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfha_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00204'      
   END FOREACH

   #5.重工转出单状态检查:状态不等于确认或作废
   DECLARE s_asfp500_unfinished_reference_sfia_cs CURSOR FOR
    SELECT UNIQUE 'asft338',sfiadocno,sfiastus,sfiacrtid,sfiacrtdp,sfiadocdt,'','' FROM sfia_t
     WHERE sfiaent = g_enterprise
       AND sfia003 = p_sfaadocno
       AND sfiastus <> 'X' AND sfiastus <> 'Y'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfia_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF


   FOREACH s_asfp500_unfinished_reference_sfia_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfia_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH

   #6.下阶料报废单状态检查:状态不等于已过账或作废
   DECLARE s_asfp500_unfinished_reference_sfjb_cs CURSOR FOR
    SELECT UNIQUE 'asft339',sfjadocno,sfjastus,sfjacrtid,sfjacrtdp,sfjadocdt,'','' FROM sfja_t,sfjb_t
     WHERE sfjaent = sfjbent AND sfjaent = g_enterprise
       AND sfjadocno = sfjbdocno
       AND sfjb001 = p_sfaadocno
       AND sfjastus <> 'X' AND sfjastus <> 'S'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfjb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

  FOREACH s_asfp500_unfinished_reference_sfjb_cs INTO l_arr.*   
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfjb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00204'      
   END FOREACH

   #7.完工入库单状态检查:状态不等于已过账或作废
   DECLARE s_asfp500_unfinished_reference_sfeb_cs CURSOR FOR
    SELECT UNIQUE 'asft340',sfeadocno,sfeastus,sfeacrtid,sfeacrtdp,sfeadocdt,sfea001,'' FROM sfea_t,sfeb_t
     WHERE sfeaent = sfebent AND sfeaent = g_enterprise
       AND sfeadocno = sfebdocno
       AND sfeb001 = p_sfaadocno
       AND sfeastus <> 'X' AND sfeastus <> 'S'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfeb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF


   FOREACH s_asfp500_unfinished_reference_sfeb_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfeb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00204'      
   END FOREACH

   #8.FQC单状态检查:状态不等于确认或作废
   DECLARE s_asfp500_unfinished_reference_qcba_cs1 CURSOR FOR
    SELECT UNIQUE 'aqct300',qcbadocno,qcbastus,qcbacrtid,qcbacrtdp,qcbadocdt,'','' FROM qcba_t
     WHERE qcbaent = g_enterprise
       AND qcba003 = p_sfaadocno
       AND qcbastus <> 'X' AND qcbastus <> 'Y'
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_qcba_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

   FOREACH s_asfp500_unfinished_reference_qcba_cs1 INTO l_arr.* 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_qcba_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH

   #9.委外采购单状态检查:状态不等于已确认或作废
   DECLARE s_asfp500_unfinished_reference_pmdl_cs CURSOR FOR
    SELECT UNIQUE 'apmt501',pmdldocno,pmdlstus,pmdlcrtid,pmdlcrtdp,pmdldocdt,'','' FROM pmdl_t,pmdp_t
     WHERE pmdlent = pmdpent AND pmdlent = g_enterprise
       AND pmdldocno = pmdpdocno
       AND pmdp003 = p_sfaadocno
#       AND pmdlstus <> 'X' AND pmdlstus <> 'Y'  #160203-00005 by whitney mark
       AND pmdlstus NOT IN ('X','Y','C')  #160203-00005 by whitney add
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_pmdl_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

   FOREACH s_asfp500_unfinished_reference_pmdl_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_pmdl_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH

   #10.委外收货单、验退单 状态检查:状态不等于已确认或作废
   #委外收货单、验退单(pmdsdocno):工单存在pmdv014，状态不等于确认、作废的数据      
   DECLARE s_asfp500_unfinished_reference_pmds_cs1 CURSOR FOR
    SELECT UNIQUE pmds000,'apmt521',pmdsdocno,pmdsstus,pmdscrtid,pmdscrtdp,pmdsdocdt,pmds001,'' FROM pmds_t,pmdv_t
    WHERE pmdsent   = pmdvent AND pmdsent = g_enterprise
      AND pmdsdocno = pmdvdocno
      AND pmdv014   = p_sfaadocno
      AND pmdsstus <> 'X' AND pmdsstus <> 'Y'  
      AND pmds000 IN ('1','5')      

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

   FOREACH s_asfp500_unfinished_reference_pmds_cs1 INTO l_type,l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      CASE l_type
           WHEN '1'  LET l_arr.prog = 'apmt521'
           WHEN '5'  LET l_arr.prog = 'apmt561'
      END CASE
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH

   #11.委外入库、仓退单状态检查:状态不等于已过帐或作废
   #委外入库、仓退单(pmdsdocno):工单存在pmdv014，状态不等于已过帐、作废的数据      
   DECLARE s_asfp500_unfinished_reference_pmds_cs2 CURSOR FOR
    SELECT UNIQUE pmds000,'apmt521',pmdsdocno,pmdsstus,pmdscrtid,pmdscrtdp,pmdsdocdt,pmds001,'' FROM pmds_t,pmdv_t
    WHERE pmdsent   = pmdvent AND pmdsent = g_enterprise
      AND pmdsdocno = pmdvdocno
      AND pmdv014   = p_sfaadocno
      AND pmdsstus <> 'X' AND pmdsstus <> 'S'  
      AND pmds000 IN ('3','6','7')      

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF


   FOREACH s_asfp500_unfinished_reference_pmds_cs2 INTO l_type,l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      CASE l_type
           WHEN '3'  LET l_arr.prog = 'apmt531'
           WHEN '6'  LET l_arr.prog = 'apmt571'
           WHEN '7'  LET l_arr.prog = 'apmt581'
      END CASE
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH


   #12.IQC单状态检查:状态不等于已确认或作废
   #IQC(qbadocno):用QC单上的来源单号qcba001、项次qcba002，找委外收货单对内的工单pmdv014，如果QC单状态不等于已确认、已作废的数据都显示
   DECLARE s_asfp500_unfinished_reference_qcba_cs2 CURSOR FOR
    SELECT UNIQUE 'aqct300',qcbadocno,qcbastus,qcbacrtid,qcbacrtdp,qcbadocdt,'','' FROM qcba_t,pmdv_t
    WHERE qcbaent = pmdvent   AND qcbaent = g_enterprise
      AND qcba001 = pmdvdocno AND qcba002 = pmdvseq
      AND pmdv014 = p_sfaadocno
      AND qcbastus <> 'X' AND qcbastus <> 'Y' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_qcba_cs2'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF


   FOREACH s_asfp500_unfinished_reference_qcba_cs2 INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_qcba_cs2'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH
    
   #170509-00087#1 add(s)
   #13.工单变更单 状态检查:状态不等于已确认或作废的单据  
   DECLARE s_asfp500_unfinished_reference_sfka_cs1 CURSOR FOR
    SELECT UNIQUE 'asft800',sfkadocno,sfkastus,sfkacrtid,sfkacrtdp,sfkadocdt,'','' FROM sfka_t,sfkg_t
    WHERE sfkaent   = sfkgent AND sfkaent = g_enterprise
      AND sfkadocno = sfkgdocno AND sfkadocno = p_sfaadocno
      AND sfkastus <> 'X' AND sfkastus <> 'Y'       

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfka_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,l_arr_tmp
   END IF

   FOREACH s_asfp500_unfinished_reference_sfka_cs1 INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'declare s_asfp500_unfinished_reference_sfka_cs1'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,r_cnt,l_arr_tmp
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      LET l_arr_tmp[l_idx].errno = 'asf-00205'      
   END FOREACH
   #170509-00087#1 add(e)

   LET r_cnt = l_idx
   CALL r_arr.clear()
   FOR l_i = 1 TO r_cnt
       LET r_arr[l_i].sdocno = p_sfaadocno
       LET r_arr[l_i].prog  = l_arr_tmp[l_i].prog  
       LET r_arr[l_i].docno = l_arr_tmp[l_i].docno      
       LET r_arr[l_i].stus  = l_arr_tmp[l_i].stus       
       LET r_arr[l_i].crtid = l_arr_tmp[l_i].crtid
       LET r_arr[l_i].crtdp = l_arr_tmp[l_i].crtdp  
       LET r_arr[l_i].errno = l_arr_tmp[l_i].errno 
       LET r_arr[l_i].opendd= l_arr_tmp[l_i].opendd    
       LET r_arr[l_i].postdd= l_arr_tmp[l_i].postdd        
       CALL s_desc_get_prog_desc(r_arr[l_i].prog) 
            RETURNING r_arr[l_i].prog_desc       
       CALL s_desc_get_person_desc(r_arr[l_i].crtid) 
            RETURNING r_arr[l_i].crtid_desc             
       CALL s_desc_get_department_desc(r_arr[l_i].crtdp) 
            RETURNING r_arr[l_i].crtdp_desc  
       CALL s_desc_get_error_desc(r_arr[l_i].errno)
            RETURNING r_arr[l_i].err_desc       
   END FOR
   
   LET r_success = 'Y' 
   
   IF l_pass = 'N' THEN
      LET r_success = 'A'
   END IF
  
   RETURN r_success,r_cnt,r_arr

END FUNCTION
 
################################################################################
# Descriptions...: 工单结案
# Memo...........:
# Usage..........: CALL s_asfp500_close_wo(p_sfaadocno,p_close_dd,p_auto_flag)
#                       RETURNING r_success
# Input parameter: p_sfaadocno    工单单号
#                : p_close_dd     结案日期
#                : p_auto_flag    自动结案标识
#                : p_prog         asft340/asfp500
# Return code....: r_success      成功否标识符  Y.成功   N.失败  A.未达结案条件
#                : r_arr          错误原因汇总
# Date & Author..: 2014-04-03 By Carrier
# Modify.........: 160104-00009#1 By tsungyung
################################################################################
PUBLIC FUNCTION s_asfp500_close_wo(p_sfaadocno,p_close_dd,p_auto_flag,p_prog)
   DEFINE p_sfaadocno           LIKE sfaa_t.sfaadocno
   DEFINE p_close_dd            LIKE type_t.dat         
   DEFINE p_auto_flag           LIKE type_t.chr1
   DEFINE p_prog                LIKE type_t.chr10     #160104-00009#1 add   
   DEFINE r_success             LIKE type_t.chr1   
   DEFINE l_success1            LIKE type_t.chr1 
   DEFINE l_success             LIKE type_t.chr1      #160129-00002#4 add
   DEFINE l_success2            LIKE type_t.num5   
   DEFINE l_cnt1                LIKE type_t.num10
   DEFINE l_cnt2                LIKE type_t.num10
   DEFINE l_i                   LIKE type_t.num10
   DEFINE l_j                   LIKE type_t.num10
   DEFINE l_tot_cnt             LIKE type_t.num10
   DEFINE l_diff_qty            LIKE sfaa_t.sfaa012   #差异数量
   DEFINE l_doc_type            LIKE ooba_t.ooba002
   DEFINE l_diff_rate1          LIKE type_t.num26_10
   DEFINE l_diff_rate2          LIKE type_t.num26_10
   DEFINE l_xmda050             LIKE xmda_t.xmda050 #add by shengbiao180514   
   #161109-00085#60-s mod   
#   DEFINE l_sfaa                RECORD LIKE sfaa_t.*   #161109-00085#60 mark 
   DEFINE l_sfaa                RECORD  #工單單頭檔
       sfaastus LIKE sfaa_t.sfaastus, #狀態碼
       sfaa012 LIKE sfaa_t.sfaa012, #生產數量
       sfaa050 LIKE sfaa_t.sfaa050, #已入庫合格量
       sfaa051 LIKE sfaa_t.sfaa051, #已入庫不合格量
       sfaa055 LIKE sfaa_t.sfaa055, #下線數量
       sfaa056 LIKE sfaa_t.sfaa056, #報廢數量
       sfaa065 LIKE sfaa_t.sfaa065  #生管結案狀態
               END RECORD
   #161109-00085#60-e mod
   DEFINE l_arr1                DYNAMIC ARRAY OF RECORD
                                sdocno        LIKE sfaa_t.sfaadocno,
                                prog          LIKE gzza_t.gzza001, 
                                prog_desc     LIKE type_t.chr50, 
                                docno         LIKE sfaa_t.sfaadocno, 
                                stus          LIKE sfaa_t.sfaastus, 
                                crtid         LIKE sfaa_t.sfaacrtid, 
                                crtid_desc    LIKE type_t.chr50,  
                                crtdp         LIKE sfaa_t.sfaacrtdp, 
                                crtdp_desc    LIKE type_t.chr50,
                                opendd        LIKE type_t.dat,
                                postdd        LIKE type_t.dat,
                                errno         LIKE gzze_t.gzze001,
                                err_desc      LIKE type_t.chr200
                                END RECORD  
   DEFINE l_arr2                DYNAMIC ARRAY OF RECORD
                                sdocno        LIKE sfaa_t.sfaadocno,
                                prog          LIKE gzza_t.gzza001, 
                                prog_desc     LIKE type_t.chr50, 
                                docno         LIKE sfaa_t.sfaadocno, 
                                stus          LIKE sfaa_t.sfaastus, 
                                crtid         LIKE sfaa_t.sfaacrtid, 
                                crtid_desc    LIKE type_t.chr50,  
                                crtdp         LIKE sfaa_t.sfaacrtdp, 
                                crtdp_desc    LIKE type_t.chr50,
                                opendd        LIKE type_t.dat,
                                postdd        LIKE type_t.dat,
                                errno         LIKE gzze_t.gzze001,
                                err_desc      LIKE type_t.chr200
                                END RECORD                                   
   DEFINE r_arr                 DYNAMIC ARRAY OF RECORD
                                sdocno        LIKE sfaa_t.sfaadocno,
                                prog          LIKE gzza_t.gzza001, 
                                prog_desc     LIKE type_t.chr50, 
                                docno         LIKE sfaa_t.sfaadocno, 
                                stus          LIKE sfaa_t.sfaastus, 
                                crtid         LIKE sfaa_t.sfaacrtid, 
                                crtid_desc    LIKE type_t.chr50,  
                                crtdp         LIKE sfaa_t.sfaacrtdp, 
                                crtdp_desc    LIKE type_t.chr50,
                                opendd        LIKE type_t.dat,
                                postdd        LIKE type_t.dat,
                                errno         LIKE gzze_t.gzze001,
                                err_desc      LIKE type_t.chr200
                                END RECORD 
   DEFINE l_sfaamoddt           DATETIME YEAR TO SECOND  #170331-00039#1
   
   #170816-00007#80 -S add
   DEFINE l_colname_1   STRING   
   DEFINE l_comment_1   STRING       
   DEFINE l_msg         STRING   #錯誤訊息
   #170816-00007#80 -E add
   #170105-00051#6 add --s
   DEFINE l_sfaa_m    type_g_sfaa_m											
   DEFINE l_sfaa_m_t  type_g_sfaa_m	
   #170105-00051#6 add --e
   
   WHENEVER ERROR CONTINUE
   LET r_success = 'Y'
   CALL r_arr.clear()
   CALL l_arr1.clear()
   CALL l_arr2.clear()
   LET l_cnt1 = 0
   LET l_cnt2 = 0

   #检查:应在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = 'N'
      RETURN r_success,r_arr
   END IF

   #1.检查参数
  #170816-00007#80 -S mark
  #IF cl_null(p_sfaadocno) OR cl_null(p_close_dd) THEN
  #   #传入参数为空或传入值不正确!
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.code = 'sub-00280'
  #   LET g_errparam.extend = ''
  #   LET g_errparam.popup = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = 'N'      
  #   RETURN r_success,r_arr
  #END IF
  #170816-00007#80 -E mark
  
  #170816-00007#80 -S add
  #修改錯誤訊息報錯內容
   LET l_msg = ''
   LET l_colname_1 = ''
   LET l_comment_1 = ''
   IF cl_null(p_sfaadocno) THEN
      CALL s_azzi902_get_gzzd("asfp500","lbl_sfaadocno") RETURNING l_colname_1,l_comment_1   #工單單號
      LET l_msg = l_colname_1   
   END IF
   IF cl_null(p_close_dd) THEN
      LET l_colname_1 = ''
      LET l_comment_1 = ''   
      CALL s_azzi902_get_gzzd("asfp500","lbl_close_dd") RETURNING l_colname_1,l_comment_1   #结案日期
      IF l_msg IS NULL THEN   
         LET l_msg = l_colname_1   
      ELSE   
         LET l_msg = l_msg,",",l_colname_1
      END IF
   END IF
   IF NOT cl_null(l_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = l_msg 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_arr
   END IF
  #170816-00007#80 -E add 

   #2.检查单号是否存在
   #161109-00085#60-s mod
#   SELECT * INTO l_sfaa.* FROM sfaa_t   #161109-00085#60 mark
   SELECT sfaastus,sfaa012,sfaa050,sfaa051,sfaa055,sfaa056,sfaa065
     INTO l_sfaa.sfaastus,l_sfaa.sfaa012,l_sfaa.sfaa050,l_sfaa.sfaa051,l_sfaa.sfaa055,
          l_sfaa.sfaa056,l_sfaa.sfaa065
     FROM sfaa_t
   #161109-00085#60-e mod
    WHERE sfaaent   = g_enterprise
      AND sfaadocno = p_sfaadocno
   IF SQLCA.sqlcode THEN
      #不存在符合條件的工單！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00002'
      LET g_errparam.extend = p_sfaadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = 'N'      
      RETURN r_success,r_arr
   END IF

   #3.检查状态是否为'发放'
   IF cl_null(l_sfaa.sfaastus) OR l_sfaa.sfaastus <> 'F' THEN
      #工单状态非 F.发放
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00022'
      LET g_errparam.extend = l_sfaa.sfaastus
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = 'N'      
      RETURN r_success,r_arr
   END IF
  
   #4.检查是否有未完的相关单据
   CALL s_asfp500_unfinished_reference(p_sfaadocno,'','1')
        RETURNING l_success1,l_cnt1,l_arr1   
   FOR l_i = 1 TO l_cnt1
       LET r_arr[l_i].* = l_arr1[l_i].*
   END FOR      
   CASE l_success1 
        WHEN 'N'  LET r_success = 'N'
                  RETURN r_success,r_arr
        WHEN 'A'  LET r_success = 'A'
   END CASE

   #5.检查相关单据，单据开立日期或过帐日期大于工单结案日期
   CALL s_asfp500_chk_reference_date(p_sfaadocno,p_close_dd)
        RETURNING l_success1,l_cnt2,l_arr2        
   FOR l_j = 1 TO l_cnt2
       LET r_arr[l_cnt1 + l_j].* = l_arr2[l_j].*
   END FOR
   CASE l_success1 
        WHEN 'N'  LET r_success = 'N'
                  RETURN r_success,r_arr
        WHEN 'A'  LET r_success = 'A'
   END CASE

   #6.如果自動結案=Y，檢查完工入庫數量與工單生產數量短少的差異比率在工單單別參數"自動結案差異比率"設定範圍內，符合條件才結案
   #例如生產數量100，差異比率設定為2，代表只要完成98以上即可自動結案
   IF p_auto_flag = 'Y' THEN
      #完工差異數diff_qty:生產數量sfaa012-入庫合格量sfaa050-入庫不合格量sfaa051-下線量sfaa055-報廢量sfaa056      
      LET l_diff_qty = l_sfaa.sfaa012 - l_sfaa.sfaa050 - l_sfaa.sfaa051 - l_sfaa.sfaa055 - l_sfaa.sfaa056
      
      CALL s_aooi200_get_slip(p_sfaadocno)
           RETURNING l_success2,l_doc_type
      IF NOT l_success2 THEN
         LET r_success = 'N'
         RETURN r_success,r_arr
      END IF  
      LET l_diff_rate1 = cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0069')
      IF NOT s_num_isnum(l_diff_rate1) THEN
         #系统参数获取有异常！
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00310'
         LET g_errparam.extend = l_diff_rate1
         LET g_errparam.popup = FALSE
         CALL cl_err()
   
         LET r_success = 'N'
         RETURN r_success,r_arr
      END IF   
      
      #add by shengbiao180514 ---s--
      SELECT xmda050 INTO l_xmda050 FROM xmda_t
      LEFT JOIN sfaa_t ON sfaaent = xmdaent 
            AND sfaadocno = p_sfaadocno            
          WHERE xmdaent = g_enterprise 
            AND xmdadocno = sfaa006
      IF cl_null(l_xmda050) THEN
         LET l_diff_rate2 = l_diff_qty / l_sfaa.sfaa012 * 100
         IF l_diff_rate2 > l_diff_rate1 THEN
            #生产数量短少的差异比率 %1 大于“自动结案差异比率 %2”，工单不可结案
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asf-00212'
            LET g_errparam.extend = ''
            LET g_errparam.popup = FALSE
            LET g_errparam.replace[1] = l_diff_rate1 
            LET g_errparam.replace[2] =  l_diff_rate2
            CALL cl_err()
          
            LET r_success = 'A'
            RETURN r_success,r_arr      
         END IF      
      END IF
      #add by shengbiao180514 ---e--
      #mark by shengbiao180514 ---s--
#      LET l_diff_rate2 = l_diff_qty / l_sfaa.sfaa012 * 100
#      IF l_diff_rate2 > l_diff_rate1 THEN
#         #生产数量短少的差异比率 %1 大于“自动结案差异比率 %2”，工单不可结案
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'asf-00212'
#         LET g_errparam.extend = ''
#         LET g_errparam.popup = FALSE
#         LET g_errparam.replace[1] = l_diff_rate1 
#         LET g_errparam.replace[2] =  l_diff_rate2
#         CALL cl_err()
#   
#         LET r_success = 'A'
#         RETURN r_success,r_arr      
#      END IF
     #mark by shengbiao180514 ---e--
   END IF
   
   IF r_success MATCHES '[NA]' THEN
      RETURN r_success,r_arr      
   END IF
   
   #7.生管結案日(sfaa047)=參數的結案日
   IF p_auto_flag = 'Y' THEN
      LET l_sfaa.sfaa065 = '1'
   ELSE
      LET l_sfaa.sfaa065 = '2'
   END IF
   
   LET l_sfaamoddt = cl_get_current()  #170331-00039#1
   #160104-00009#1 --- add start ---
   #170105-00051#6 add --s
   INITIALIZE l_sfaa_m TO NULL											
   INITIALIZE l_sfaa_m_t TO NULL																
   SELECT sfaastus,sfaa047,sfaa065											
     INTO l_sfaa_m_t.sfaastus,l_sfaa_m_t.sfaa047,l_sfaa_m_t.sfaa065											
     FROM sfaa_t											
    WHERE sfaaent = g_enterprise											
      AND sfaadocno = p_sfaadocno
   #170105-00051#6 add --e
   #IF p_prog = 'asft340' THEN   #程式從asft340執行   #170301-00021#7 by 09263 --mark
   IF p_prog MATCHES 'asft340*' THEN   #程式從asft340執行   #170301-00021#7 by 09263 --add
      IF p_auto_flag = 'Y' THEN
   #160104-00009#1 --- add end   ---
         UPDATE sfaa_t SET sfaa047 = p_close_dd,sfaa065 = l_sfaa.sfaa065,sfaastus = 'C'
                          ,sfaamodid = g_user,sfaamoddt = l_sfaamoddt  #170331-00039#1
          WHERE sfaaent   = g_enterprise
            AND sfaadocno = p_sfaadocno
   #160104-00009#1 --- add start ---
         #180928-00024#1---mark---s
         ##171211-00028#16 add-S
         #IF NOT s_asfp500_ins_xcna(p_sfaadocno) THEN
         #END IF
         ##171211-00028#16 add-E
         #180928-00024#1---mark---e
      END IF
   ELSE   #程式從asfp500執行
      UPDATE sfaa_t SET sfaa047 = p_close_dd,sfaa065 = l_sfaa.sfaa065,sfaastus = 'C'
                       ,sfaamodid = g_user,sfaamoddt = l_sfaamoddt  #170331-00039#1
       WHERE sfaaent   = g_enterprise
         AND sfaadocno = p_sfaadocno   
      #180928-00024#1---mark---s
      ##171211-00028#16 add-S
      #IF NOT s_asfp500_ins_xcna(p_sfaadocno) THEN
      #END IF
      ##171211-00028#16 add-E
      #180928-00024#1---mark---e
   END IF
   #160104-00009#1 --- add end   ---
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'xxxx'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = 'N'
      RETURN r_success,r_arr 
   #170105-00051#6 add --s
   ELSE		
      CALL g_pk_array.clear()      
      LET g_pk_array[1].values = p_sfaadocno											
      LET g_pk_array[1].column = 'sfaadocno'											
      #單頭修改前資料											
      LET l_sfaa_m_t.sfaaent = g_enterprise											
      LET l_sfaa_m_t.sfaasite = g_site											
      LET l_sfaa_m_t.sfaadocno = p_sfaadocno	      
      #單頭修改後資料											
      LET l_sfaa_m.sfaaent = g_enterprise											
      LET l_sfaa_m.sfaasite = g_site											
      LET l_sfaa_m.sfaadocno = p_sfaadocno											
      LET l_sfaa_m.sfaastus = 'C'											
      LET l_sfaa_m.sfaa047 = p_close_dd											
      LET l_sfaa_m.sfaa065 = l_sfaa.sfaa065											
      #修改歷程記錄(單頭修改)											
      LET g_log1 = util.JSON.stringify(l_sfaa_m_t)											
      LET g_log2 = util.JSON.stringify(l_sfaa_m)											
      CALL cl_log_modified_record(g_log1,g_log2) RETURNING l_success2
   #170105-00051#6 add --e      
   END IF
   #180928-00024#1---mark---s
   IF NOT s_asfp500_ins_xcna(p_sfaadocno) THEN
   END IF
   #180928-00024#1---mark---e
         
   #add--151207-00017#2 By shiun--(S)
   IF NOT s_asfp500_upd_psad006(p_sfaadocno) THEN
      LET r_success = 'N'
      RETURN r_success,r_arr
   END IF
   #add--151207-00017#2 By shiun--(E)
   
   #170116-00058#1-s-add
   IF NOT s_asfp500_upd_psab006(p_sfaadocno) THEN
      LET r_success = 'N'
      RETURN r_success,r_arr
   END IF
   #170116-00058#1-e-add
   
   #160129-00002#4-S
   CALL s_aooi200_get_slip(p_sfaadocno) RETURNING l_success,l_doc_type
   #161116-00008#3-S
   #IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' AND cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0079') = 'Y' THEN 
   IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' THEN 
      IF cl_aws_prod_para(g_enterprise,"mes-0001") = 'Y' THEN
         #170222-00022#1-S   
         #IF s_aws_mes2_wo_status_process(p_sfaadocno,'2') THEN
         #   CALL cl_ask_end1()  
         #ELSE
         IF cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0079') = 'Y' THEN  #170807-00020#8 add
            LET g_err_collect = 1   #170222-00022#7         
            IF NOT (s_aws_mes2_wo_status_process(p_sfaadocno,'2')) THEN
            #   CALL cl_err()
            #170222-00022#1-E  
               #190107-00069#1 mark --s
               ##170222-00022#7-S
               #LET g_cnt = g_cnt + 1
               #CALL r_arr.clear()
               #LET r_arr[1].sdocno   = p_sfaadocno  
               #LET r_arr[1].errno    = g_errcollect[g_cnt].code       
              ##LET r_arr[1].err_desc = g_errcollect[g_cnt].message                             #180622-00027#1 mark
               #LET r_arr[1].err_desc = g_errcollect[g_cnt].message,g_errcollect[g_cnt].gzze006 #180622-00027#1 add
               ##170222-00022#7-E
               #190107-00069#1 mark --e
               #190107-00069#1 add --s
               CALL r_arr.clear()
               FOR g_cnt = 1 TO g_errcollect.getLength()
                  IF NOT cl_null(g_errcollect[g_cnt].code) THEN
                     #C20190123-09421#1---add---s
                     IF g_errcollect[g_cnt].code ! = 'lib-00046' THEN                     
                        LET r_arr[g_cnt].sdocno   = g_errcollect[g_cnt].message.substring(1,16)
                     ELSE
                     #C20190123-09421#1---add---e
                        LET r_arr[g_cnt].sdocno   = p_sfaadocno 
                     END IF  #C20190123-09421#1---add
                     LET r_arr[g_cnt].errno    = g_errcollect[g_cnt].code       
                     LET r_arr[g_cnt].err_desc = g_errcollect[g_cnt].message,g_errcollect[g_cnt].gzze006
                  END IF
               END FOR
              #CALL g_errcollect.deleteElement(g_cnt)   #190115-00046#1 mark
               CALL g_errcollect.clear()                #190115-00046#1 add
               #190107-00069#1 add --e
               LET r_success = 'N'       
               RETURN r_success,r_arr
            END IF
            LET g_err_collect = 0   #170222-00022#7
         END IF  #170807-00020#8 add
      ELSE
         IF cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0079') = 'Y' THEN 
   #161116-00008#3-E
            IF NOT (s_aws_mes_ins('asfp500','close', p_sfaadocno ) = 1) THEN    
               LET r_success = 'N'
               RETURN r_success,r_arr
            #170222-00022#1-S 
            #   CALL cl_err()  
            #ELSE
            #   CALL cl_ask_end1()    
            #170222-00022#1-E           
            END IF 
   #161116-00008#3-S
         END IF   
      END IF 
   #161116-00008#3-E
   END IF
   #160129-00002#4-E    
  
   LET r_success = 'Y'
   
   RETURN r_success,r_arr  
                                
                                
END FUNCTION

################################################################################
# Descriptions...: 日期值比较后，取最大日期
# Memo...........:
# Usage..........: s_asfp500_compare_date(p_date1,p_date2,p_date3)
#                       RETURNING r_max_date
# Input parameter: p_date1        日期值1
#                : p_date2        日期值2
#                : p_date3        日期值3
# Return code....: r_max_date     最大日期值
# Date & Author..: 2014-04-04 By Carrier
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_compare_date(p_date1,p_date2,p_date3)
   DEFINE p_date1       LIKE type_t.dat
   DEFINE p_date2       LIKE type_t.dat
   DEFINE p_date3       LIKE type_t.dat
   DEFINE r_max_date    LIKE type_t.dat
   
   IF cl_null(p_date1) THEN LET p_date1 = '0001/01/01' END IF
   IF cl_null(p_date2) THEN LET p_date2 = '0001/01/01' END IF
   IF cl_null(p_date3) THEN LET p_date3 = '0001/01/01' END IF

   IF p_date1 > p_date2 THEN
      LET r_max_date = p_date1
   ELSE
      LET r_max_date = p_date2
   END IF

   IF p_date3 > r_max_date THEN
      LET r_max_date = p_date3
   END IF
   
   RETURN r_max_date
END FUNCTION

################################################################################
# Descriptions...: 与工单相关的单据，且单据日期/过帐小于工单结案日期
# Memo...........:
# Usage..........: CALL s_asfp500_chk_reference_date(p_sfaadocno,p_close_dd)
#                       RETURNING r_success,r_cnt,r_arr
# Input parameter: p_sfaadocno    工单编号
#                : p_close_dd     工单结案日期
# Return code....: r_success      成功否标识符 'N'有异常错误  'A'有大于工单结案日期的单据 ‘Y’一切正常
#                : r_cnt          未完成的单据笔数
#                : r_arr          未完成的单据清单
# Date & Author..: 2014-04-04 By Carrier
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_chk_reference_date(p_sfaadocno,p_close_dd)
   DEFINE p_sfaadocno    LIKE sfaa_t.sfaadocno
   DEFINE p_close_dd     LIKE type_t.dat
   DEFINE r_success      LIKE type_t.chr1
   DEFINE r_arr          DYNAMIC ARRAY OF RECORD
                         sdocno        LIKE sfaa_t.sfaadocno,
                         prog          LIKE gzza_t.gzza001, 
                         prog_desc     LIKE type_t.chr50, 
                         docno         LIKE sfaa_t.sfaadocno, 
                         stus          LIKE sfaa_t.sfaastus, 
                         crtid         LIKE sfaa_t.sfaacrtid, 
                         crtid_desc    LIKE type_t.chr50,  
                         crtdp         LIKE sfaa_t.sfaacrtdp, 
                         crtdp_desc    LIKE type_t.chr50,
                         opendd        LIKE type_t.dat,
                         postdd        LIKE type_t.dat,
                         errno         LIKE gzze_t.gzze001,
                         err_desc      LIKE type_t.chr200
                         END RECORD 
   DEFINE l_arr          RECORD
                         prog          LIKE gzza_t.gzza001,
                         docno         LIKE sfaa_t.sfaadocno,
                         stus          LIKE sfaa_t.sfaastus,
                         crtid         LIKE sfaa_t.sfaacrtid,
                         crtdp         LIKE sfaa_t.sfaacrtdp,
                         opendd        LIKE type_t.dat,
                         postdd        LIKE type_t.dat
                         END RECORD 
   DEFINE l_arr_tmp      DYNAMIC ARRAY OF RECORD
                         prog          LIKE gzza_t.gzza001,
                         docno         LIKE sfaa_t.sfaadocno,
                         stus          LIKE sfaa_t.sfaastus,
                         crtid         LIKE sfaa_t.sfaacrtid,
                         crtdp         LIKE sfaa_t.sfaacrtdp,
                         opendd        LIKE type_t.dat,
                         postdd        LIKE type_t.dat
                         END RECORD
   DEFINE r_cnt          LIKE type_t.num10
   DEFINE l_idx          LIKE type_t.num10 
   DEFINE l_i            LIKE type_t.num10       
   DEFINE l_pass         LIKE type_t.chr1
   DEFINE l_cols         LIKE type_t.chr500
   DEFINE l_tabs         LIKE type_t.chr100
   DEFINE l_cond1        LIKE type_t.chr1000
   DEFINE l_cond2        LIKE type_t.chr1000
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_type         LIKE type_t.chr10
   DEFINE l_sfaadocdt    LIKE sfaa_t.sfaadocdt

   WHENEVER ERROR CONTINUE
   
   LET r_success = 'N'
   CALL r_arr.clear()   
   LET r_cnt = 0   

   CALL l_arr_tmp.clear()
   LET l_pass = 'Y'
   LET l_idx = 0
   
   IF cl_null(p_sfaadocno) OR cl_null(p_close_dd) THEN
      RETURN r_success,r_cnt,r_arr  
   END IF
   
   #1.发料/退料单日期值检查
   DECLARE s_asfp500_chk_reference_date_sfdc_cs1 CURSOR FOR
    SELECT UNIQUE sfda002,'asft310',sfdadocno,sfdastus,sfdacrtid,sfdacrtdp,sfdadocdt,sfda001 FROM sfda_t,sfdc_t
     WHERE sfdaent   = sfdcent   AND sfdaent = g_enterprise
       AND sfdadocno = sfdcdocno
       AND sfdc001   = p_sfaadocno
       AND (sfdadocdt > p_close_dd OR sfda001 > p_close_dd)
       AND sfdastus <> 'X' 
       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfdc_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_sfdc_cs1 INTO l_type,l_arr.*  
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfdc_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      CASE l_type
           WHEN '11'  LET l_arr.prog = 'asft311'
           WHEN '12'  LET l_arr.prog = 'asft312'
           WHEN '13'  LET l_arr.prog = 'asft313'
           WHEN '14'  LET l_arr.prog = 'asft314'
           WHEN '15'  LET l_arr.prog = 'asft315'
           WHEN '21'  LET l_arr.prog = 'asft321'
           WHEN '22'  LET l_arr.prog = 'asft322'
           WHEN '23'  LET l_arr.prog = 'asft323'
           WHEN '24'  LET l_arr.prog = 'asft324'
           WHEN '25'  LET l_arr.prog = 'asft325'      
      END CASE
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
      
   END FOREACH

   #2.报工单日期值检查
   DECLARE s_asfp500_chk_reference_date_sffb_cs CURSOR FOR
    #SELECT UNIQUE 'asft335',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,'' FROM sffb_t #170320-00018#1 mark
    SELECT UNIQUE 'asft335',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,sffb012 FROM sffb_t #170320-00018#1 add
     WHERE sffbent = g_enterprise
       AND sffb005 = p_sfaadocno
       #AND sffbdocdt > p_close_dd #170320-00018#1 mark
       AND (sffbdocdt > p_close_dd OR sffb012 > p_close_dd)   #170320-00018#1 add       
       AND sffbstus <> 'X' 
       AND sffbseq = 0    #asft335报工时,sffbseq =0
    UNION
    #SELECT UNIQUE 'asft330',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,'' FROM sffb_t #170320-00018#1 mark
    SELECT UNIQUE 'asft330',sffbdocno,sffbstus,sffbcrtid,sffbcrtdp,sffbdocdt,sffb012 FROM sffb_t #170320-00018#1 add
     WHERE sffbent = g_enterprise
       AND sffb005 = p_sfaadocno
       #AND sffbdocdt > p_close_dd #170320-00018#1 mark 
       AND (sffbdocdt > p_close_dd OR sffb012 > p_close_dd)   #170320-00018#1#1 add       
       AND sffbstus <> 'X' 
       AND sffbseq > 0    #asft330报工时,sffbseq >0    
       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sffb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_sffb_cs INTO l_arr.* 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sffb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #3.当站报废单日期值检查:状态不等于过账或作废
   DECLARE s_asfp500_chk_reference_date_sfga_cs CURSOR FOR
    SELECT UNIQUE 'asft336',sfgadocno,sfgastus,sfgacrtid,sfgacrtdp,sfgadocdt,sfga001 FROM sfga_t
     WHERE sfgaent = g_enterprise
       AND sfga004 = p_sfaadocno
       AND (sfgadocdt > p_close_dd OR sfga001 > p_close_dd)
       AND sfgastus <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfga_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_sfga_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfga_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #4.当站下线单日期值检查
   DECLARE s_asfp500_chk_reference_date_sfha_cs CURSOR FOR
    SELECT UNIQUE 'asft337',sfhadocno,sfhastus,sfhacrtid,sfhacrtdp,sfhadocdt,sfha001 FROM sfha_t
     WHERE sfhaent = g_enterprise
       AND sfha004 = p_sfaadocno
       AND (sfhadocdt > p_close_dd OR sfha001 > p_close_dd)
       AND sfhastus <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfha_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_sfha_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfha_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #5.重工转出单日期值检查
   DECLARE s_asfp500_chk_reference_date_sfia_cs CURSOR FOR
    SELECT UNIQUE 'asft338',sfiadocno,sfiastus,sfiacrtid,sfiacrtdp,sfiadocdt,'' FROM sfia_t
     WHERE sfiaent = g_enterprise
       AND sfia003 = p_sfaadocno
       AND sfiadocdt > p_close_dd
       AND sfiastus <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfia_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF

   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_sfia_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfia_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #6.下阶料报废单日期值检查
   DECLARE s_asfp500_chk_reference_date_sfjb_cs CURSOR FOR
    SELECT UNIQUE 'asft339',sfjadocno,sfjastus,sfjacrtid,sfjacrtdp,sfjadocdt,'' FROM sfja_t,sfjb_t
     WHERE sfjaent = sfjbent AND sfjaent = g_enterprise
       AND sfjadocno = sfjbdocno
       AND sfjb001 = p_sfaadocno
       AND sfjadocdt > p_close_dd
       AND sfjastus <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfjb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF

   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_sfjb_cs INTO l_arr.*   

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfjb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #7.完工入库单日期值检查
   DECLARE s_asfp500_chk_reference_date_sfeb_cs CURSOR FOR
    SELECT UNIQUE 'asft340',sfeadocno,sfeastus,sfeacrtid,sfeacrtdp,sfeadocdt,sfea001 FROM sfea_t,sfeb_t
     WHERE sfeaent   = sfebent   AND sfeaent = g_enterprise
       AND sfeadocno = sfebdocno
       AND sfeb001   = p_sfaadocno
       AND (sfeadocdt > p_close_dd OR sfea001 > p_close_dd )
       AND sfeastus <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfeb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_sfeb_cs INTO l_arr.*   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_sfeb_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #8.FQC单日期值检查
   DECLARE s_asfp500_chk_reference_date_qcba_cs1 CURSOR FOR
    SELECT UNIQUE 'aqct300',qcbadocno,qcbastus,qcbacrtid,qcbacrtdp,qcbadocdt,'' FROM qcba_t
     WHERE qcbaent = g_enterprise
       AND qcba003 = p_sfaadocno 
       AND qcbadocdt > p_close_dd
       AND qcbastus <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_qcba_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_qcba_cs1 INTO l_arr.*  
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_qcba_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #9.委外采购单日期值检查
   DECLARE s_asfp500_chk_reference_date_pmdl_cs CURSOR FOR
    SELECT UNIQUE 'apmt501',pmdldocno,pmdlstus,pmdlcrtid,pmdlcrtdp,pmdldocdt,'' FROM pmdl_t,pmdp_t
     WHERE pmdlent   = pmdpent   AND pmdlent = g_enterprise
       AND pmdldocno = pmdpdocno
       AND pmdp003   = p_sfaadocno
       AND pmdldocdt > p_close_dd
       AND pmdlstus  <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_pmdl_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF

   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_pmdl_cs INTO l_arr.* 

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_pmdl_cs'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #10.委外收货单、验退单 日期值检查
   DECLARE s_asfp500_chk_reference_date_pmds_cs1 CURSOR FOR
    SELECT UNIQUE pmds000,'apmt521',pmdsdocno,pmdsstus,pmdscrtid,pmdscrtdp,pmdsdocdt,pmds001 FROM pmds_t,pmdv_t
    WHERE pmdsent   = pmdvent AND pmdsent = g_enterprise
      AND pmdsdocno = pmdvdocno
      AND pmdv014   = p_sfaadocno
      AND (pmdsdocdt > p_close_dd OR pmds001 > p_close_dd)
      AND pmdsstus <> 'X' 
      AND pmds000 IN ('1','5')      

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF

   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_pmds_cs1 INTO l_type,l_arr.*   

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      CASE l_type
           WHEN '1'  LET l_arr.prog = 'apmt521'
           WHEN '5'  LET l_arr.prog = 'apmt561'
      END CASE
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH

   #11.委外入库、仓退单日期值检查
   DECLARE s_asfp500_chk_reference_date_pmds_cs2 CURSOR FOR
    SELECT UNIQUE pmds000,'apmt521',pmdsdocno,pmdsstus,pmdscrtid,pmdscrtdp,pmdsdocdt,pmds001 FROM pmds_t,pmdv_t
    WHERE pmdsent   = pmdvent   AND pmdsent = g_enterprise
      AND pmdsdocno = pmdvdocno
      AND pmdv014   = p_sfaadocno
      AND (pmdsdocdt > p_close_dd OR pmds001 > p_close_dd) 
      AND pmdsstus   <> 'X' 
      AND pmds000    IN ('3','6','7')      

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_pmds_cs2 INTO l_type,l_arr.*  
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_pmds_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      CASE l_type
           WHEN '3'  LET l_arr.prog = 'apmt531'
           WHEN '6'  LET l_arr.prog = 'apmt571'
           WHEN '7'  LET l_arr.prog = 'apmt581'
      END CASE
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH


   #12.IQC单日期值检查
   #IQC(qbadocno):用QC单上的来源单号qcba001、项次qcba002，找委外收货单对内的工单pmdv014
   DECLARE s_asfp500_chk_reference_date_qcba_cs2 CURSOR FOR
    SELECT UNIQUE 'aqct300',qcbadocno,qcbastus,qcbacrtid,qcbacrtdp,qcbadocdt,'' FROM qcba_t,pmdv_t
    WHERE qcbaent = pmdvent   AND qcbaent = g_enterprise
      AND qcba001 = pmdvdocno AND qcba002 = pmdvseq
      AND pmdv014 = p_sfaadocno
      AND qcbadocdt > p_close_dd
      AND qcbastus  <> 'X' 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_qcba_cs2'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_cnt,r_arr
   END IF
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   FOREACH s_asfp500_chk_reference_date_qcba_cs2 INTO l_arr.*   

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare s_asfp500_chk_reference_date_qcba_cs2'
      LET g_errparam.popup = TRUE
      CALL cl_err()

         RETURN r_success,r_cnt,r_arr
      END IF   
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*
            
   END FOREACH
   
   #13.与工单开单日期比较
   INITIALIZE l_arr.* TO NULL #C20190123-09421#1---add
   SELECT sfaadocdt,'asft300',sfaadocno,sfaastus,sfaacrtid,sfaacrtdp,sfaadocdt,sfaacnfdt 
     INTO l_sfaadocdt,l_arr.* FROM sfaa_t
    WHERE sfaaent   = g_enterprise
      AND sfaadocno = p_sfaadocno 
   IF l_sfaadocdt > p_close_dd THEN
      LET l_pass = 'N'
      LET l_idx = l_idx + 1
      LET l_arr_tmp[l_idx].* = l_arr.*    
   END IF
   
      
   LET r_cnt = l_idx
   CALL r_arr.clear()
   FOR l_i = 1 TO r_cnt
   #    LET r_arr[l_i].sdocno    = p_sfaadocno      #C20190123-09421#1---add
       LET r_arr[l_i].sdocno    = l_arr_tmp[l_i].docno    #C20190123-09421#1---add
       LET r_arr[l_i].prog      = l_arr_tmp[l_i].prog  
       LET r_arr[l_i].docno     = l_arr_tmp[l_i].docno      
       LET r_arr[l_i].stus      = l_arr_tmp[l_i].stus       
       LET r_arr[l_i].crtid     = l_arr_tmp[l_i].crtid
       LET r_arr[l_i].crtdp     = l_arr_tmp[l_i].crtdp     
       LET r_arr[l_i].opendd    = l_arr_tmp[l_i].opendd    
       LET r_arr[l_i].postdd    = l_arr_tmp[l_i].postdd  
       #单据异动日期大于工单结案日期       
       LET r_arr[l_i].errno     = 'asf-00213'
       CALL s_desc_get_prog_desc(r_arr[l_i].prog) 
            RETURNING r_arr[l_i].prog_desc       
       CALL s_desc_get_person_desc(r_arr[l_i].crtid) 
            RETURNING r_arr[l_i].crtid_desc             
       CALL s_desc_get_department_desc(r_arr[l_i].crtdp) 
            RETURNING r_arr[l_i].crtdp_desc  
       CALL s_desc_get_error_desc(r_arr[l_i].errno)
            RETURNING r_arr[l_i].err_desc       
   END FOR
   
   LET r_success = 'Y'
   IF l_pass = 'N' THEN
      LET r_success = 'A'
   END IF
   
   RETURN r_success,r_cnt,r_arr
END FUNCTION

################################################################################
# Descriptions...: 使用工单的所有单据中，取得日期值最大的那笔日期值
# Memo...........:
# Usage..........: CALL s_asfp500_get_max_reference_date(p_sfaadocno)
#                       RETURNING r_max_date,r_flag
# Input parameter: p_sfaadocno    工单编号
# Return code....: r_max_date     最大日期值
#                  r_flag         單據來源
# Date & Author..: 2014-04-04 By Carrier
# Modify.........: 2016-01-28 By Ann_Huang
################################################################################
PUBLIC FUNCTION s_asfp500_get_max_reference_date(p_sfaadocno)
   DEFINE p_sfaadocno         LIKE sfaa_t.sfaadocno
   DEFINE r_max_date          LIKE type_t.dat
   DEFINE l_max_date          LIKE type_t.dat  
   DEFINE l_sfaadocdt         LIKE sfaa_t.sfaadocdt   
   DEFINE l_arr               RECORD
                              date1  LIKE type_t.dat,
                              date2  LIKE type_t.dat
                              END RECORD
   DEFINE l_flag              LIKE type_t.chr1     #160111-00024#2 by Ann_Huang --- add 
   DEFINE r_flag              LIKE type_t.chr1     #160111-00024#2 by Ann_Huang --- add
   DEFINE l_max_date_o        LIKE type_t.dat      #160111-00024#2 by Ann_Huang --- add

   WHENEVER ERROR CONTINUE
   
   LET l_flag = '0'        #160111-00024#2 by Ann_Huang --- add
   LET l_max_date_o = ''   #160111-00024#2 by Ann_Huang --- add
   LET l_max_date   = ''   #161231-00004#1 add
   #1.发料/退料单
   SELECT MAX(sfdadocdt),MAX(sfda001) INTO l_arr.date1,l_arr.date2 
     FROM sfda_t,sfdc_t
    WHERE sfdaent   = sfdcent    AND sfdaent = g_enterprise
      AND sfdadocno = sfdcdocno
      AND sfdc001   = p_sfaadocno
      AND sfdastus <> 'X' 
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='1'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add
   
   #2.报工单状态检查
   #SELECT MAX(sffbdocdt),MAX(sffbdocdt) INTO l_arr.date1,l_arr.date2   #170320-00018#1 mark
   SELECT MAX(sffbdocdt),MAX(sffb012) INTO l_arr.date1,l_arr.date2     #170320-00018#1 add   
     FROM sffb_t
    WHERE sffbent = g_enterprise
      AND sffb005 = p_sfaadocno
      AND sffbstus <> 'X'     
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add      
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date    
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='2'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add   

   #3.当站报废单
   SELECT MAX(sfgadocdt),MAX(sfga001) INTO l_arr.date1,l_arr.date2 
     FROM sfga_t
    WHERE sfgaent = g_enterprise
      AND sfga004 = p_sfaadocno
      AND sfgastus <> 'X'    
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add      
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='3'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---   
   END IF                                                                 #161231-00004#1 add   
   
   #4.当站下线单
   SELECT MAX(sfhadocdt),MAX(sfha001) INTO l_arr.date1,l_arr.date2 
     FROM sfha_t
    WHERE sfhaent = g_enterprise
      AND sfha004 = p_sfaadocno
      AND sfhastus <> 'X'    
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add        
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='4'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add   

   #5.重工转出单
   SELECT MAX(sfiadocdt),MAX(sfiadocdt) INTO l_arr.date1,l_arr.date2 
     FROM sfia_t
    WHERE sfiaent = g_enterprise
      AND sfia003 = p_sfaadocno
      AND sfiastus <> 'X'       
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add    
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='5'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---     
   END IF                                                                 #161231-00004#1 add   
        
   #6.下阶料报废单
   SELECT MAX(sfjadocdt),MAX(sfjadocdt) INTO l_arr.date1,l_arr.date2 
     FROM sfja_t,sfjb_t
    WHERE sfjaent   = sfjbent   AND sfjaent = g_enterprise
      AND sfjadocno = sfjbdocno
      AND sfjb001   = p_sfaadocno
      AND sfjastus <> 'X'       
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add   
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date        
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='6'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add   
   
   #7.完工入库单
   SELECT MAX(sfeadocdt),MAX(sfea001) INTO l_arr.date1,l_arr.date2 
     FROM sfea_t,sfeb_t
    WHERE sfeaent   = sfebent   AND sfeaent = g_enterprise
      AND sfeadocno = sfebdocno
      AND sfeb001   = p_sfaadocno
      AND sfeastus <> 'X' 
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add   
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='7'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add   

   #8.FQC单
   SELECT MAX(qcbadocdt),MAX(qcbadocdt) INTO l_arr.date1,l_arr.date2 
     FROM qcba_t
    WHERE qcbaent = g_enterprise
      AND qcba003 = p_sfaadocno
      AND qcbastus <> 'X' 
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add   
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date  
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='8'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add   

   #9.委外采购单
   SELECT MAX(pmdldocdt),MAX(pmdldocdt) INTO l_arr.date1,l_arr.date2 
     FROM pmdl_t,pmdp_t
    WHERE pmdlent   = pmdpent   AND pmdlent = g_enterprise
      AND pmdldocno = pmdpdocno
      AND pmdp003   = p_sfaadocno
      AND pmdlstus  <> 'X' 
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add    
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date  
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='9'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add    

   #10.委外收货单、验退单、委外入库、仓退单 
   SELECT MAX(pmdsdocdt),MAX(pmds001) INTO l_arr.date1,l_arr.date2 
     FROM pmds_t,pmdv_t
    WHERE pmdsent   = pmdvent AND pmdsent = g_enterprise
      AND pmdsdocno = pmdvdocno
      AND pmdv014   = p_sfaadocno
      AND pmdsstus <> 'X' 
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add   
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date 
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='10'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add    

   #11.IQC单
   #IQC(qbadocno):用QC单上的来源单号qcba001、项次qcba002，找委外收货单对内的工单pmdv014
    SELECT MAX(qcbadocdt),MAX(qcbadocdt) INTO l_arr.date1,l_arr.date2 
      FROM qcba_t,pmdv_t
     WHERE qcbaent = pmdvent   AND qcbaent = g_enterprise
       AND qcba001 = pmdvdocno AND qcba002 = pmdvseq
       AND pmdv014 = p_sfaadocno
       AND qcbastus  <> 'X' 
   IF NOT cl_null(l_arr.date1) OR NOT cl_null(l_arr.date2) THEN           #161231-00004#1 add    
      #CALL s_asfp500_compare_date(l_max_date,l_arr.date1,l_arr.date2)    #160111-00024#2 by Ann_Huang --- mark
      CALL s_asfp500_compare_date(l_max_date_o,l_arr.date1,l_arr.date2)   #160111-00024#2 by Ann_Huang --- add
           RETURNING l_max_date 
      #160111-00024#2 by Ann_Huang --- add Start ---
      IF l_max_date = l_arr.date1 OR l_max_date = l_arr.date2 THEN
         LET l_flag ='11'
         LET l_max_date_o = l_max_date
      ELSE 
         LET l_max_date_o = l_max_date_o
      END IF
      #160111-00024#2 by Ann_Huang --- add End ---
   END IF                                                                 #161231-00004#1 add   

   SELECT sfaadocdt INTO l_sfaadocdt FROM sfaa_t
    WHERE sfaaent   = g_enterprise
      AND sfaadocno = p_sfaadocno 
   #161231-00004#1  -- remark start --   
   #160728-00019#1  --- mark Start ---
   IF cl_null(l_max_date) OR l_max_date = '1899/12/31' THEN
      LET l_max_date = cl_get_today()
   END IF
   #160728-00019#1  --- mark End ---
   #161231-00004#1  -- remark end --
   
   IF l_max_date > l_sfaadocdt THEN
      LET r_max_date = l_max_date
   ELSE
      LET r_max_date = l_sfaadocdt
   END IF
   
  #LET r_max_date = l_max_date #161231-00004#1 mark
   LET r_flag = l_flag         #160111-00024#2 by Ann_Huang --- add
   RETURN r_max_date,r_flag    #160111-00024#2 by Ann_Huang --- add
   #RETURN r_max_date          #160111-00024#2 by Ann_Huang --- mark
END FUNCTION
################################################################################
# Descriptions...:結案時，若是MPS計劃，則更新已開工單量
# Memo...........:
# Usage..........: CALL s_asfp500_upd_psad006(p_sfaadocno)
#                  RETURNING r_success
# Input parameter: p_sfaadocno    工單單號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2016/01/08 By shiun
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_upd_psad006(p_sfaadocno)
DEFINE p_sfaadocno       LIKE sfaa_t.sfaadocno
DEFINE r_success         LIKE type_t.num5
DEFINE l_count           LIKE type_t.num5
DEFINE l_psad004         LIKE psad_t.psad004
DEFINE l_psad006         LIKE psad_t.psad006
DEFINE l_psaddocno       LIKE psad_t.psaddocno
DEFINE l_psadseq         LIKE psad_t.psadseq
DEFINE l_sfaa005         LIKE sfaa_t.sfaa005
DEFINE l_sfaa006         LIKE sfaa_t.sfaa006
DEFINE l_sfaa007         LIKE sfaa_t.sfaa007
DEFINE l_sfaa010         LIKE sfaa_t.sfaa010
DEFINE l_sfaa012         LIKE sfaa_t.sfaa012
DEFINE l_sfaa013         LIKE sfaa_t.sfaa013
DEFINE l_sfaa022         LIKE sfaa_t.sfaa022
DEFINE l_sfaa023         LIKE sfaa_t.sfaa023
DEFINE l_sfaa050         LIKE sfaa_t.sfaa050
DEFINE l_success         LIKE type_t.num5

   LET r_success = TRUE
   
   IF cl_null(p_sfaadocno) THEN
      RETURN r_success
   END IF
   
   SELECT sfaa005,sfaa006,sfaa007,sfaa010,sfaa012,sfaa013,sfaa022,sfaa023,sfaa050
     INTO l_sfaa005,l_sfaa006,l_sfaa007,l_sfaa010,l_sfaa012,l_sfaa013,l_sfaa022,l_sfaa023,l_sfaa050
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaadocno = p_sfaadocno
   
   IF l_sfaa005 = '7' THEN
      LET l_psaddocno = l_sfaa006
      LET l_psadseq = l_sfaa007
   ELSE
      LET l_psaddocno = l_sfaa022
      LET l_psadseq = l_sfaa023
   END IF
   
   IF cl_null(l_psaddocno) OR cl_null(l_psadseq) THEN
      RETURN r_success
   END IF
   
   #檢查是否有MPS計劃單
   LET l_count = 0
   SELECT COUNT(1) INTO l_count 
     FROM psad_t
    WHERE psadent = g_enterprise
      AND psaddocno = l_psaddocno
      AND psadseq = l_psadseq
      AND psad001 = l_sfaa010
   IF cl_null(l_count) OR l_count <= 0 THEN
      RETURN r_success
   END IF
   
   #抓取已開工單量
   LET l_psad006 = 0
   SELECT psad004,psad006 INTO l_psad004,l_psad006
     FROM psad_t
    WHERE psadent = g_enterprise
      AND psaddocno = l_psaddocno
      AND psadseq = l_psadseq
      AND psad001 = l_sfaa010
   IF cl_null(l_psad006) THEN LET l_psad006 = 0 END IF
   
   #單位換算                   
   CALL s_aooi250_convert_qty(l_sfaa010,l_sfaa013,l_psad004,l_sfaa050)
        RETURNING l_success,l_sfaa050
        
   #單位換算                   
   CALL s_aooi250_convert_qty(l_sfaa010,l_sfaa013,l_psad004,l_sfaa012)
        RETURNING l_success,l_sfaa012
   
   #已開工單量=原已開工單量-欲減少的已開工單量+欲增加的已開工單量
   LET l_psad006 = l_psad006 - l_sfaa012 + l_sfaa050
   
   #更新已開工單量
   UPDATE psad_t SET psad006 = l_psad006
    WHERE psadent = g_enterprise
      AND psaddocno = l_psaddocno
      AND psadseq = l_psadseq
      AND psad001 = l_sfaa010
   IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'upd psad006'
      LET g_errparam.popup = TRUE
      
      CALL cl_err() 
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 結案時，若是獨立需求，則更新已耗數量
# Memo...........:
# Usage..........: CALL s_asfp500_upd_psab006(p_sfaadocno)
#                  RETURNING r_success
# Input parameter: p_sfaadocno    工單單號
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2017/01/23 By shiun   #170116-00058#1
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_upd_psab006(p_sfaadocno)
DEFINE p_sfaadocno       LIKE sfaa_t.sfaadocno
DEFINE r_success         LIKE type_t.num5
DEFINE l_count           LIKE type_t.num5
DEFINE l_psab004         LIKE psab_t.psab004
DEFINE l_psab006         LIKE psab_t.psab006
DEFINE l_psabdocno       LIKE psab_t.psabdocno
DEFINE l_psabseq         LIKE psab_t.psabseq
DEFINE l_sfaa005         LIKE sfaa_t.sfaa005
DEFINE l_sfaa006         LIKE sfaa_t.sfaa006
DEFINE l_sfaa007         LIKE sfaa_t.sfaa007
DEFINE l_sfaa010         LIKE sfaa_t.sfaa010
DEFINE l_sfaa012         LIKE sfaa_t.sfaa012
DEFINE l_sfaa013         LIKE sfaa_t.sfaa013
DEFINE l_sfaa022         LIKE sfaa_t.sfaa022
DEFINE l_sfaa023         LIKE sfaa_t.sfaa023
DEFINE l_sfaa050         LIKE sfaa_t.sfaa050
DEFINE l_success         LIKE type_t.num5

   LET r_success = TRUE
   
   IF cl_null(p_sfaadocno) THEN
      RETURN r_success
   END IF
   
   SELECT sfaa005,sfaa006,sfaa007,sfaa010,sfaa012,sfaa013,sfaa022,sfaa023,sfaa050
     INTO l_sfaa005,l_sfaa006,l_sfaa007,l_sfaa010,l_sfaa012,l_sfaa013,l_sfaa022,l_sfaa023,l_sfaa050
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaadocno = p_sfaadocno
   
   IF l_sfaa005 = '6' THEN
      LET l_psabdocno = l_sfaa006
      LET l_psabseq = l_sfaa007
   ELSE
      LET l_psabdocno = l_sfaa022
      LET l_psabseq = l_sfaa023
   END IF
   
   IF cl_null(l_psabdocno) OR cl_null(l_psabseq) THEN
      RETURN r_success
   END IF
   
   #檢查是否有獨立需求單
   LET l_count = 0
   SELECT COUNT(*) INTO l_count 
     FROM psab_t
    WHERE psabent = g_enterprise
      AND psabdocno = l_psabdocno
      AND psabseq = l_psabseq
      AND psab001 = l_sfaa010
   IF cl_null(l_count) OR l_count <= 0 THEN
      RETURN r_success
   END IF
   
   #抓取已耗需求數量
   LET l_psab006 = 0
   SELECT psab004,psab006 INTO l_psab004,l_psab006
     FROM psab_t
    WHERE psabent = g_enterprise
      AND psabdocno = l_psabdocno
      AND psabseq = l_psabseq
      AND psab001 = l_sfaa010
   IF cl_null(l_psab006) THEN LET l_psab006 = 0 END IF
   
   #單位換算                   
   CALL s_aooi250_convert_qty(l_sfaa010,l_sfaa013,l_psab004,l_sfaa050)
        RETURNING l_success,l_sfaa050
        
   #單位換算                   
   CALL s_aooi250_convert_qty(l_sfaa010,l_sfaa013,l_psab004,l_sfaa012)
        RETURNING l_success,l_sfaa012
   
   #已耗需求數量=原已耗需求數量-欲增加的已耗需求數量+欲減少的已耗需求數量
   LET l_psab006 = l_psab006 - l_sfaa012 + l_sfaa050
   
   #更新已耗需求數量
   UPDATE psab_t SET psab006 = l_psab006
    WHERE psabent = g_enterprise
      AND psabdocno = l_psabdocno
      AND psabseq = l_psabseq
      AND psab001 = l_sfaa010
   IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'upd psab006'
      LET g_errparam.popup = TRUE
      
      CALL cl_err() 
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 工单结案时，产生差异数据到xcna_t
# Memo...........: #171211-00028#16 add
# Date & Author..: 180212 By 05423
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_ins_xcna(p_docno)
DEFINE p_docno    LIKE sfaa_t.sfaadocno
DEFINE l_xcna RECORD  #工单差异单头档
       xcnaent LIKE xcna_t.xcnaent, #企业代码
       xcnasite LIKE xcna_t.xcnasite, #营运据点
       xcnacomp LIKE xcna_t.xcnacomp, #法人组织
       xcnadocno LIKE xcna_t.xcnadocno, #工单编号
       xcnadocdt LIKE xcna_t.xcnadocdt, #单据日期
       xcna001 LIKE xcna_t.xcna001, #工单类型
       xcna002 LIKE xcna_t.xcna002, #主件编号
       xcna003 LIKE xcna_t.xcna003, #产品特征
       xcna004 LIKE xcna_t.xcna004, #生管结案日
       xcna005 LIKE xcna_t.xcna005, #成本单位
       xcna006 LIKE xcna_t.xcna006, #生产数量
       xcna007 LIKE xcna_t.xcna007, #入库数量
       xcna008 LIKE xcna_t.xcna008, #成本BOM需求量
       xcna009 LIKE xcna_t.xcna009, #工单应发数量
       xcna010 LIKE xcna_t.xcna010, #工单已发数量
       xcna011 LIKE xcna_t.xcna011, #实际已发与标准差
       xcna012 LIKE xcna_t.xcna012, #实际已发与应发差
       xcna013 LIKE xcna_t.xcna013, #实际已发与标准差异金额
       xcna014 LIKE xcna_t.xcna014, #实际已发与应发差异金额
       xcna015 LIKE xcna_t.xcna015, #标准工时耗用量
       xcna016 LIKE xcna_t.xcna016, #标准工时耗用金额
       xcna017 LIKE xcna_t.xcna017, #实际总报工工时
       xcna018 LIKE xcna_t.xcna018, #实际工时标准工费额
       xcna019 LIKE xcna_t.xcna019, #工时耗用差异
       xcna020 LIKE xcna_t.xcna020, #工时耗用差异金额
       xcna021 LIKE xcna_t.xcna021, #成本中心
       xcna022 LIKE xcna_t.xcna022, #标准机时耗用量
       xcna023 LIKE xcna_t.xcna023, #标准机时耗用金额
       xcna024 LIKE xcna_t.xcna024, #实际总报工机时
       xcna025 LIKE xcna_t.xcna025, #实际机时标准工费额
       xcna026 LIKE xcna_t.xcna026, #机时耗用差异
       xcna027 LIKE xcna_t.xcna027,  #机时耗用差异金额
       xcnacrtdt  LIKE xcna_t.xcnacrtdt
END RECORD
DEFINE l_imaa006  LIKE imaa_t.imaa006
DEFINE l_rate          LIKE type_t.num26_10
DEFINE r_success  LIKE type_t.num5
DEFINE l_success  LIKE type_t.num5
DEFINE l_sql      STRING
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   IF cl_null(p_docno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = 'N'
      RETURN r_success
   END IF
   #从工单单头取出所有的主件+产品特征组合
   LET l_sql = " SELECT DISTINCT sfaaent,sfaasite,ooef017,sfaadocno,sfaadocdt,",
               "                 sfaa003,sfaa010,sfac006,sfaa047,sfac004,",
               "                 (SELECT imaa006 FROM imaa_t WHERE imaaent = sfaaent AND imaa001 = sfaa010) imaa006, ",
               "                 sfac003,sfac005,sfaa068, ",
               "                 0,0,0,0,0,",
               "                 0,0,0,0,0,",
               "                 0,0,0,0,0,",
               "                 0,0,0,0 ",
               "   FROM sfaa_t LEFT OUTER JOIN ooef_t ON sfaaent = ooefent AND sfaasite = ooef001,sfac_t",
               "  WHERE sfaadocno = sfacdocno AND sfaaent = sfacent AND sfac002 = '1' ",
               "    AND sfaaent = ",g_enterprise,
               "    AND sfaadocno = '",p_docno,"' ",
               "  ORDER BY sfaadocno,sfaa010,sfac006 "
   PREPARE s_asfp500_sfaa_pre FROM l_sql
   DECLARE s_asfp500_sfaa_curs CURSOR FOR s_asfp500_sfaa_pre
   
   LET l_sql = " INSERT INTO s_asfp500_xcna VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,? ,?) " #mod by lixwz
   DECLARE s_asfp500_xcna_ins_curs CURSOR FROM l_sql
   
   LET l_sql = " INSERT INTO s_asfp500_xcnb VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,? ,?) "    #mod by lixwz
   DECLARE s_asfp500_xcnb_ins_curs CURSOR FROM l_sql
   
   LET l_sql = " INSERT INTO s_asfp500_xcnc VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,? ,?) "  #mod by lixwz
   DECLARE s_asfp500_xcnc_ins_curs CURSOR FROM l_sql
   
   FOREACH s_asfp500_sfaa_curs INTO l_xcna.xcnaent,l_xcna.xcnasite,l_xcna.xcnacomp,l_xcna.xcnadocno,l_xcna.xcnadocdt,
                                    l_xcna.xcna001,l_xcna.xcna002,l_xcna.xcna003,l_xcna.xcna004,l_xcna.xcna005,
                                    l_imaa006,l_xcna.xcna006,l_xcna.xcna007,l_xcna.xcna021,
                                    l_xcna.xcna008,l_xcna.xcna009,l_xcna.xcna010,l_xcna.xcna011,l_xcna.xcna012,
                                    l_xcna.xcna013,l_xcna.xcna014,l_xcna.xcna015,l_xcna.xcna016,l_xcna.xcna017,
                                    l_xcna.xcna018,l_xcna.xcna019,l_xcna.xcna020,l_xcna.xcna022,l_xcna.xcna023,
                                    l_xcna.xcna024,l_xcna.xcna025,l_xcna.xcna026,l_xcna.xcna027
      LET l_xcna.xcnacrtdt = cl_get_current()
      #若成本单位与生产数量不同，则进行数量换算：
      IF l_imaa006 <> l_xcna.xcna005 THEN
         LET l_rate = 0
         CALL s_aooi250_convert_qty1(l_xcna.xcna002,l_xcna.xcna005,l_imaa006,1)
            RETURNING l_success,l_rate
         IF cl_null(l_rate) OR l_rate = 0 THEN
            LET l_rate = 1
         END IF
         LET l_xcna.xcna005 = l_imaa006
         LET l_xcna.xcna006 = l_xcna.xcna006 * l_rate
         LET l_xcna.xcna007 = l_xcna.xcna007 * l_rate
      END IF
      EXECUTE s_asfp500_xcna_ins_curs USING l_xcna.*,g_pid  #将单头档资料插入暂存档 #mod by lixwz
      IF NOT s_asfp500_ins_xcnb(l_xcna.xcnadocno,l_xcna.xcna002,l_xcna.xcna003) THEN
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      IF NOT s_asfp500_ins_xcnc(l_xcna.xcnadocno,l_xcna.xcna002,l_xcna.xcna003) THEN
         LET r_success = FALSE
         EXIT FOREACH
      END IF
   END FOREACH
   
   #xcnb数量分摊计算:当前备料+产品特征的需求量=当前备料总需求量*当前备料对应主件的主件生产数量/SUM(使用到当前备料的主料的总生产数量)
   #xcnb数量分摊计算:当前备料+产品特征的已发量=当前备料总已发量*当前备料对应主件的主件实际入库数量/SUM(使用到当前备料的主料的总入库数量)
   LET l_sql = " MERGE INTO s_asfp500_xcnb t1 ",
               " USING (SELECT A.xcnaent,A.xcnadocno,A.xcna002,A.xcna003,A.xcna006,A.xcna007,B.xcnb003,B.xcnb004,B.xcnb012,B.xcnb013,",
              #"               C.xcna006 xcna006_sum,C.xcna007 xcna007_sum ",            #180823-00024#1 mark
               "               C.xcna006 xcna006_sum,C.xcna007 xcna007_sum,B.xcnbseq ",  #180823-00024#1 add
               "          FROM s_asfp500_xcna A,s_asfp500_xcnb B,",
               "               (SELECT xcnbent,xcnbdocno,xcnb003,xcnb004,SUM(xcna006) xcna006,SUM(xcna007) xcna007 ",
               "                  FROM s_asfp500_xcna,s_asfp500_xcnb ", 
               "                 WHERE xcnbdocno = '",p_docno,"' AND xcnbent = ",g_enterprise," AND xcnadocno = xcnbdocno AND xcnaent = xcnbent AND xcna003 = xcnb002 ",
               "                       AND s_asfp500_xcna.pid = '",g_pid,"' and s_asfp500_xcnb.pid = '",g_pid,"'", #lixwz
               "                 GROUP BY xcnbent,xcnbdocno,xcnb003,xcnb004 ) C ",
               "         WHERE A.xcnadocno = B.xcnbdocno AND A.xcnaent = B.xcnbent AND A.xcna002 = B.xcnb001 AND A.xcna003 = B.xcnb002 ",
               "           AND A.pid  = '",g_pid,"' AND B.pid= '",g_pid,"'" , #lixwz add
               "           AND A.xcnadocno = C.xcnbdocno AND A.xcnaent = C.xcnbent AND B.xcnb003 = C.xcnb003 AND B.xcnb004 = C.xcnb004 ",
               "           AND A.xcnaent = ",g_enterprise," AND A.xcnadocno = '",p_docno,"' ) t2 ",
              #"    ON (t1.xcnbdocno = t2.xcnadocno AND t1.xcnbent = t2.xcnaent AND t1.xcnb002 = t2.xcna003 AND t1.xcnb003 = t2.xcnb003 AND t1.xcnb004 = t2.xcnb004 )",  #180823-00024#1 mark
               #180823-00024#1 -S add
               "    ON (t1.xcnbdocno = t2.xcnadocno AND t1.xcnbent = t2.xcnaent AND t1.xcnb001 = t2.xcna002 AND COALESCE(t1.xcnb002,' ') = COALESCE(t2.xcna003,' ') ",
               "    AND t1.xcnb003 = t2.xcnb003 AND COALESCE(t1.xcnb004,' ') = COALESCE(t2.xcnb004,' ') AND t1.xcnbseq = t2.xcnbseq ",
               "    AND  t1.pid = '",g_pid,"')", #lixwz210630 add
               #180823-00024#1 -E add
               "  WHEN MATCHED THEN ",
               " UPDATE SET t1.xcnb012 = CASE WHEN t2.xcna006_sum = 0 THEN 0 ELSE NVL(t1.xcnb012*t2.xcna006/t2.xcna006_sum,0) END , ",
               "            t1.xcnb013 = CASE WHEN t2.xcna006_sum = 0 THEN 0 ELSE NVL(t1.xcnb013*t2.xcna006/t2.xcna006_sum,0) END  "
   PREPARE s_asfp500_xcnb_p1 FROM l_sql
   EXECUTE s_asfp500_xcnb_p1  #lixwz
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asfp500_xcnb_p1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success      
   END IF
   LET l_sql = " UPDATE s_asfp500_xcnb ",
               "    SET xcnb014 = NVL(xcnb013,0)-NVL(xcnb010,0),",
               "        xcnb015 = NVL(xcnb013,0)-NVL(xcnb012,0) "
               ,"   WHERE pid = '",g_pid,"'"  #lixwz add
   PREPARE s_asfp500_xcnb_p2 FROM l_sql
   EXECUTE s_asfp500_xcnb_p2   #lixwz
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asfp500_xcnb_p2"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success      
   END IF
       
   LET l_sql = " UPDATE s_asfp500_xcnb ",
               "    SET xcnb016 = NVL(xcnb014,0)*NVL(xcnb011,0),",
               "        xcnb017 = NVL(xcnb015,0)*NVL(xcnb011,0) "
               ,"   WHERE pid = '",g_pid,"'"  #lixwz add
   PREPARE s_asfp500_xcnb_p3 FROM l_sql
   EXECUTE s_asfp500_xcnb_p3   #lixwz
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asfp500_xcnb_p3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success      
   END IF
               
   #根据xcnb的值，回写xcna
   LET l_sql = " MERGE INTO s_asfp500_xcna t1 ",
               " USING (SELECT xcnbdocno,xcnbent,xcnb001,xcnb002,SUM(NVL(xcnb010,0)) xcnb010,SUM(NVL(xcnb012,0)) xcnb012,",
               "               SUM(NVL(xcnb013,0)) xcnb013,SUM(NVL(xcnb014,0)) xcnb014,SUM(NVL(xcnb015,0)) xcnb015,SUM(NVL(xcnb016,0)) xcnb016,SUM(NVL(xcnb017,0)) xcnb017 ",
               "          FROM s_asfp500_xcnb ",
               "         WHERE xcnbent = ",g_enterprise," AND xcnbdocno = '",p_docno,"' ",
               "           AND pid = '",g_pid,"'",  #lixwz add
               "         GROUP BY xcnbdocno,xcnbent,xcnb001,xcnb002 ) t2 ",
               "    ON (t1.xcnadocno = t2.xcnbdocno AND t1.xcnaent = t2.xcnbent AND t1.xcna002 = t2.xcnb001 AND t1.xcna003 = t2.xcnb002",
               "        AND t1.pid =  '",g_pid,"' )", #lixwz add
               "  WHEN MATCHED THEN ",
               " UPDATE SET t1.xcna008 = t2.xcnb010, ",
               "            t1.xcna009 = t2.xcnb012, ",
               "            t1.xcna010 = t2.xcnb013, ",
               "            t1.xcna011 = t2.xcnb014, ",
               "            t1.xcna012 = t2.xcnb015, ",
               "            t1.xcna013 = t2.xcnb016, ",
               "            t1.xcna014 = t2.xcnb017 "
   PREPARE s_asfp500_xcna_p1 FROM l_sql
   EXECUTE s_asfp500_xcna_p1  #lixwz
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asfp500_xcna_p1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success      
   END IF
   #根据xcnc的值，回写xcna
   LET l_sql = " MERGE INTO s_asfp500_xcna t1 ",
               " USING (SELECT xcnc001,xcncent,xcnc003,SUM(xcnc013) xcnc013,SUM(xcnc013*xcnc005) xcnc013_1,",
               "               SUM(xcnc017) xcnc017,SUM(xcnc017*xcnc005) xcnc017_1,SUM(xcnc017-xcnc013) xcnc017_2,SUM((xcnc017-xcnc013)*xcnc005) xcnc017_3,",
               "               SUM(xcnc014) xcnc014,SUM(xcnc014*xcnc009) xcnc014_1,",
               "               SUM(xcnc018) xcnc018,SUM(xcnc018*xcnc009) xcnc018_1,SUM(xcnc018-xcnc014) xcnc018_2,SUM((xcnc018-xcnc014)*xcnc009) xcnc018_3  ",
               "          FROM s_asfp500_xcnc ",
               "         WHERE xcncent = ",g_enterprise," AND xcnc001 = '",p_docno,"' ",
               "           AND pid = '",g_pid,"'",  #lixwz add
               "         GROUP BY xcnc001,xcncent,xcnc003) t2 ",
               "    ON (t1.xcnadocno = t2.xcnc001 AND t1.xcnaent = t2.xcncent AND t1.xcna003 = t2.xcnc003  ",
               "        AND t1.pid =  '",g_pid,"' )", #lixwz add
               "  WHEN MATCHED THEN ",
               " UPDATE SET t1.xcna015 = t2.xcnc013, ",
               "            t1.xcna016 = t2.xcnc013_1, ",
               "            t1.xcna017 = t2.xcnc017, ",
               "            t1.xcna018 = t2.xcnc017_1, ",
               "            t1.xcna019 = t2.xcnc017_2, ",
               "            t1.xcna020 = t2.xcnc017_3, ",
               "            t1.xcna022 = t2.xcnc014, ",
               "            t1.xcna023 = t2.xcnc014_1, ",
               "            t1.xcna024 = t2.xcnc018, ",
               "            t1.xcna025 = t2.xcnc018_1, ",
               "            t1.xcna026 = t2.xcnc018_2, ",
               "            t1.xcna027 = t2.xcnc018_3 "
   PREPARE s_asfp500_xcna_p2 FROM l_sql
   EXECUTE s_asfp500_xcna_p2  #lixwz
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE s_asfp500_xcna_p2"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success      
   END IF      
   
   INSERT INTO xcna_t(xcnaent,xcnasite,xcnacomp,xcnadocno,xcnadocdt,
                      xcna001,xcna002,xcna003,xcna004,xcna005,
                      xcna006,xcna007,xcna008,xcna009,xcna010,
                      xcna011,xcna012,xcna013,xcna014,xcna015,
                      xcna016,xcna017,xcna018,xcna019,xcna020,
                      xcna021,xcna022,xcna023,xcna024,xcna025,
                      xcna026,xcna027,xcnacrtdt)
     SELECT xcnaent,xcnasite,xcnacomp,xcnadocno,xcnadocdt,
            xcna001,xcna002,xcna003,xcna004,xcna005,
            xcna006,xcna007,xcna008,xcna009,xcna010,
            xcna011,xcna012,xcna013,xcna014,xcna015,
            xcna016,xcna017,xcna018,xcna019,xcna020,
            xcna021,xcna022,xcna023,xcna024,xcna025,
            xcna026,xcna027,xcnacrtdt
       FROM s_asfp500_xcna  #lixwz
     WHERE pid = g_pid #lixwz add
       
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins xcna_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE   
      RETURN r_success                      
   END IF
      
   INSERT INTO xcnb_t(xcnbent,xcnbsite,xcnbdocno,xcnb001,xcnb002,
                      xcnbseq,xcnbseq1,xcnb003,xcnb004,xcnb005,
                      xcnb006,xcnb007,xcnb008,xcnb009,xcnb010,
                      xcnb011,xcnb012,xcnb013,xcnb014,xcnb015,
                      xcnb016,xcnb017,xcnbcrtdt)
     SELECT xcnbent,xcnbsite,xcnbdocno,xcnb001,xcnb002,
            xcnbseq,xcnbseq1,xcnb003,xcnb004,xcnb005,
            xcnb006,xcnb007,xcnb008,xcnb009,xcnb010,
            xcnb011,xcnb012,xcnb013,xcnb014,xcnb015,
            xcnb016,xcnb017,xcnbcrtdt
       FROM s_asfp500_xcnb  #lixwz
       WHERE pid = g_pid #lixwz add
       
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins xcnb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE   
      RETURN r_success                      
   END IF
   
   INSERT INTO xcnc_t(xcncent,xcncsite,xcnc001,xcncseq,xcnc002,
                      xcnc003,xcnc004,xcnc005,xcnc006,xcnc007,
                      xcnc008,xcnc009,xcnc010,xcnc011,xcnc012,
                      xcnc013,xcnc014,xcnc015,xcnc016,xcnc017,
                      xcnc018,xcnc019,xcnc020,xcnc021,xcnc022,xcnc023,xcnc024,xcnc025,xcnc026,xcnccrtdt)
     SELECT xcncent,xcncsite,xcnc001,xcncseq,xcnc002,
            xcnc003,xcnc004,xcnc005,xcnc006,xcnc007,
            xcnc008,xcnc009,xcnc010,xcnc011,xcnc012,
            xcnc013,xcnc014,xcnc015,xcnc016,xcnc017,
            xcnc018,xcnc019,xcnc020,xcnc021,xcnc022,xcnc023,xcnc024,xcnc025,xcnc026,xcnccrtdt
       FROM s_asfp500_xcnc   #lixwz
       WHERE pid = g_pid #lixwz add
       
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins xcnc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE   
      RETURN r_success                      
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 量差明细档插入
# Memo...........: #171211-00028#16 add
################################################################################
PUBLIC FUNCTION s_asfp500_ins_xcnb(p_docno,p_item,p_feature)
DEFINE p_docno    LIKE sfaa_t.sfaadocno
DEFINE p_item     LIKE sfaa_t.sfaa010
DEFINE p_feature  LIKE sfac_t.sfac006
DEFINE r_success  LIKE type_t.num5
DEFINE l_xcnb  RECORD
       xcnbent LIKE xcnb_t.xcnbent, #企业代码
       xcnbsite LIKE xcnb_t.xcnbsite, #营运据点
       xcnbdocno LIKE xcnb_t.xcnbdocno, #工单编号
       xcnb001 LIKE xcnb_t.xcnb001, #主件编号
       xcnb002 LIKE xcnb_t.xcnb002, #产品特征
       xcnbseq LIKE xcnb_t.xcnbseq, #项次
       xcnbseq1 LIKE xcnb_t.xcnbseq1, #项序
       xcnb003 LIKE xcnb_t.xcnb003, #元件编号
       xcnb004 LIKE xcnb_t.xcnb004, #元件产品特征
       xcnb005 LIKE xcnb_t.xcnb005, #成本单位
       xcnb006 LIKE xcnb_t.xcnb006, #主成本要素
       xcnb007 LIKE xcnb_t.xcnb007, #次成本要素
       xcnb008 LIKE xcnb_t.xcnb008, #成本BOM组成用量
       xcnb009 LIKE xcnb_t.xcnb009, #成本BOM主件底数
       xcnb010 LIKE xcnb_t.xcnb010, #成本BOM需求量
       xcnb011 LIKE xcnb_t.xcnb011, #标准成本单价
       xcnb012 LIKE xcnb_t.xcnb012, #工单应发数量
       xcnb013 LIKE xcnb_t.xcnb013, #工单已发数量
       xcnb014 LIKE xcnb_t.xcnb014, #实际已发与标准差
       xcnb015 LIKE xcnb_t.xcnb015, #实际已发与应发差
       xcnb016 LIKE xcnb_t.xcnb016, #实际已发与标准差异金额
       xcnb017 LIKE xcnb_t.xcnb017,  #实际已发与应发差异金额
       xcnbcrtdt LIKE xcnb_t.xcnbcrtdt
END RECORD
DEFINE l_imaa006  LIKE imaa_t.imaa006
DEFINE l_amt      LIKE type_t.num10
DEFINE l_sql      STRING
DEFINE l_rate     LIKE type_t.num26_10
DEFINE l_success  LIKE type_t.num5
DEFINE l_xcaa001  LIKE xcaa_t.xcaa001  #标准成本分类
DEFINE l_bmba014  LIKE bmba_t.bmba014  #产品特征管理
DEFINE l_bmba005  LIKE bmba_t.bmba005  #生效日期
DEFINE l_feature  LIKE xcnb_t.xcnb004  #根据产品特征管理的设定，获取的产品特征
DEFINE l_date     STRING
DEFINE l_imaa005  LIKE imaa_t.imaa005  #主件产品特征组别
DEFINE l_sfaa011  LIKE sfaa_t.sfaa011  #特性
DEFINE l_sfba002  LIKE sfba_t.sfba002  #部位
DEFINE l_sfba003  LIKE sfba_t.sfba003  #作业编号
DEFINE l_sfba004  LIKE sfba_t.sfba004  #作业序   
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
       
   SELECT xcaa001 INTO l_xcaa001 FROM xcaa_t WHERE xcaaent = g_enterprise AND xcaa002 = 'Y' AND xcaastus = 'Y'
   
   LET l_date = cl_get_current()
   
   LET l_sql = " SELECT DISTINCT sfaaent,sfaasite,sfaadocno,sfaa010,sfac006, ",
               "                 sfbaseq,sfbaseq1,sfba006,sfba021,sfba014, ",
               "                 (SELECT imaa006 FROM imaa_t WHERE imaaent = sfbaent AND imaa001 = sfba006) imaa006,",
               "                 (SELECT imaa005 FROM imaa_t WHERE imaaent = sfbaent AND imaa001 = sfaa010) imaa005, ",
               "                 xcah101,xcah102,NVL(xcah043,0),NVL(xcah042,0),NVL(sfac003,0), ",
               "                 xcah030,NVL(sfba013,0),NVL(sfba016,0)+NVL(sfba025,0),0,0,0,0, ",
               "                 (SELECT bmba014 FROM bmba_t WHERE bmbaent = sfaaent AND bmbasite = sfaasite AND bmba001 = sfaa010 ",
               "                                               AND bmba002 = sfaa011 AND bmba003 = sfba005 AND bmba004 = sfba002 AND bmba007 = sfba003 AND bmba008 = sfba004 ",
               "                                               AND (bmba005 <= to_date('",l_date,"','YY/MM/DD hh24:mi:ss')) ",
               "                                               AND (bmba006 >  to_date('",l_date,"','YY/MM/DD hh24:mi:ss') OR bmba006 IS NULL )) bmba014,",
               "                 (SELECT bmba005 FROM bmba_t WHERE bmbaent = sfaaent AND bmbasite = sfaasite AND bmba001 = sfaa010 ",
               "                                               AND bmba002 = sfaa011 AND bmba003 = sfba005 AND bmba004 = sfba002 AND bmba007 = sfba003 AND bmba008 = sfba004 ",
               "                                               AND (bmba005 <= to_date('",l_date,"','YY/MM/DD hh24:mi:ss')) ",
               "                                               AND (bmba006 >  to_date('",l_date,"','YY/MM/DD hh24:mi:ss') OR bmba006 IS NULL )) bmba005,",
               "                 sfaa011,sfba002,sfba003,sfba004 ",
               "   FROM sfaa_t LEFT OUTER JOIN sfac_t ON sfaaent = sfacent AND sfaadocno = sfacdocno AND sfac002 = '1' ",
               "               LEFT OUTER JOIN sfba_t ON sfaaent = sfbaent AND sfaadocno = sfbadocno ",
               "               LEFT OUTER JOIN xcah_t ON sfaaent = xcahent AND xcah004 = sfaa010 AND xcah022 = sfba006 AND xcah005 = sfac006 AND xcah045 = sfba021 ",
               "                                  AND xcah001 = '",l_xcaa001,"' AND xcahsite = sfaasite ",
               "                                  AND (xcah002 <= to_date('",l_date,"','YY/MM/DD hh24:mi:ss')) ",
               "                                  AND (xcah003 >  to_date('",l_date,"','YY/MM/DD hh24:mi:ss') OR xcah003 IS NULL )",
               "  WHERE sfaaent = sfacent AND sfaaent = sfbaent ",
               "    AND sfaadocno = sfacdocno AND sfaadocno = sfbadocno ",
               "    AND sfaaent = ",g_enterprise,
               "    AND sfaadocno = '",p_docno,"' ",
               "    AND sfac001 = '",p_item,"' AND sfac006 = '",p_feature,"' ",
               "  ORDER BY sfaadocno,sfbaseq,sfbaseq1 "
   PREPARE s_asfp500_sfba_pre FROM l_sql
   DECLARE s_asfp500_sfba_curs CURSOR FOR s_asfp500_sfba_pre
   FOREACH s_asfp500_sfba_curs INTO l_xcnb.xcnbent,l_xcnb.xcnbsite,l_xcnb.xcnbdocno,l_xcnb.xcnb001,l_xcnb.xcnb002,
                                    l_xcnb.xcnbseq,l_xcnb.xcnbseq1,l_xcnb.xcnb003,l_xcnb.xcnb004,l_xcnb.xcnb005,
                                    l_imaa006,l_imaa005,
                                    l_xcnb.xcnb006,l_xcnb.xcnb007,l_xcnb.xcnb008,l_xcnb.xcnb009,l_xcnb.xcnb010,
                                    l_xcnb.xcnb011,l_xcnb.xcnb012,l_xcnb.xcnb013,l_xcnb.xcnb014,l_xcnb.xcnb015,l_xcnb.xcnb016,l_xcnb.xcnb017,
                                    l_bmba014,l_bmba005,l_sfaa011,l_sfba002,l_sfba003,l_sfba004
      LET l_xcnb.xcnbcrtdt = l_date
      #如果有特征管理，则检查元件的产品特征是否属于当前的主料下，若不在，则不插入
      IF l_bmba014 = 'Y' THEN
         CALL s_asfp500_bom_feature(p_item,l_sfaa011,l_xcnb.xcnb003,l_sfba002,l_bmba005,l_sfba003,l_sfba004,p_feature,l_imaa005)
            RETURNING l_success,l_feature
         IF l_feature <> l_xcnb.xcnb004 THEN
            CONTINUE FOREACH
         END IF
      END IF
      #数量根据成本单位进行转换
      IF l_imaa006 <> l_xcnb.xcnb005 THEN
         LET l_rate = 0
         CALL s_aooi250_convert_qty1(l_xcnb.xcnb003,l_xcnb.xcnb005,l_imaa006,1)
            RETURNING l_success,l_rate
         IF cl_null(l_rate) OR l_rate = 0 THEN
            LET l_rate = 1
         END IF
         LET l_xcnb.xcnb005 = l_imaa006
         LET l_xcnb.xcnb010 = l_xcnb.xcnb010 * l_rate #此时xcnb010 = sfac003,还需要根据组成数量/主件底数进行计算
         LET l_xcnb.xcnb012 = l_xcnb.xcnb012 * l_rate #工单应发数量
         LET l_xcnb.xcnb013 = l_xcnb.xcnb013 * l_rate #工单已发数量
      END IF
      IF l_xcnb.xcnb009 = 0 THEN
         LET l_xcnb.xcnb010 = 0
      ELSE
         LET l_xcnb.xcnb010 = l_xcnb.xcnb010 * l_xcnb.xcnb008 / l_xcnb.xcnb009
      END IF
      #先不处理单身的数量，foreach结束后，进行分摊。因为这样会过滤掉单头主件有些不使用的备料
      #比如：生产料号A001,特征：R 10个，B 20个，单身备料：B001,特征：R 20个(只被A001[R]使用到)，B 40个(只被A001[B]使用到)  
      #插入到xcnb中
      EXECUTE s_asfp500_xcnb_ins_curs USING l_xcnb.*,g_pid #mod lixwz
   END FOREACH
   #主件还没有全部新增完成，所以这边还是没法分摊
   #xcnb数量分摊计算:当前备料+产品特征的需求量=当前备料总需求量*当前备料对应主件的主件生产数量/SUM(使用到当前备料的主料的总生产数量)
   #xcnb数量分摊计算:当前备料+产品特征的已发量=当前备料总已发量*当前备料对应主件的主件实际入库数量/SUM(使用到当前备料的主料的总入库数量)
   #根据xcnb的值，回写xcna
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 效率差明细档插入
# Memo...........: #171211-00028#16 add
################################################################################
PUBLIC FUNCTION s_asfp500_ins_xcnc(p_docno,p_item,p_feature)
DEFINE p_docno    LIKE sfaa_t.sfaadocno
DEFINE p_item     LIKE sfaa_t.sfaa010
DEFINE p_feature  LIKE sfac_t.sfac006
DEFINE r_success  LIKE type_t.num5
DEFINE l_xcnc RECORD  #工单差异效率差明细档
       xcncent LIKE xcnc_t.xcncent, #企业代码
       xcncsite LIKE xcnc_t.xcncsite, #营运据点
       xcnc001 LIKE xcnc_t.xcnc001, #工单单号
       xcncseq LIKE xcnc_t.xcncseq, #项次
       xcnc002 LIKE xcnc_t.xcnc002, #BOM特性
       xcnc003 LIKE xcnc_t.xcnc003, #产品特征
       xcnc004 LIKE xcnc_t.xcnc004, #作业编号
       xcnc005 LIKE xcnc_t.xcnc005, #人工工时标准费率
       xcnc006 LIKE xcnc_t.xcnc006, #工作站
       xcnc007 LIKE xcnc_t.xcnc007, #归属主成本要素
       xcnc008 LIKE xcnc_t.xcnc008, #归属次成本要素
       xcnc009 LIKE xcnc_t.xcnc009, #机器工时标准费率
       xcnc010 LIKE xcnc_t.xcnc010, #标准人工工时单位耗用量
       xcnc011 LIKE xcnc_t.xcnc011, #良品数量
       xcnc012 LIKE xcnc_t.xcnc012, #成本单位
       xcnc013 LIKE xcnc_t.xcnc013, #标准人工工时耗用量
       xcnc014 LIKE xcnc_t.xcnc014, #标准机器工时耗用量
       xcnc015 LIKE xcnc_t.xcnc015, #标准总报工工时
       xcnc016 LIKE xcnc_t.xcnc016, #委外否
       xcnc017 LIKE xcnc_t.xcnc017, #实际报工工时
       xcnc018 LIKE xcnc_t.xcnc018, #实际报工机时
       xcnc019 LIKE xcnc_t.xcnc019, #实际总报工工时
       xcnc020 LIKE xcnc_t.xcnc020, #实际工时标准工费额
       xcnc021 LIKE xcnc_t.xcnc021, #人工工时耗用差异
       xcnc022 LIKE xcnc_t.xcnc022, #人工工时耗用差异金额
       xcnc023 LIKE xcnc_t.xcnc023, #标准工时标准工费额
       xcnc024 LIKE xcnc_t.xcnc024, #标准机器工时单位耗用量
       xcnc025 LIKE xcnc_t.xcnc025, #机器工时耗用差异
       xcnc026 LIKE xcnc_t.xcnc026, #机器工时耗用差异金额
       xcnccrtdt LIKE xcnc_t.xcnccrtdt #资料创建日
END RECORD
DEFINE l_sql      STRING
DEFINE l_success  LIKE type_t.num5
DEFINE l_xcaa001  LIKE xcaa_t.xcaa001  #标准成本分类
DEFINE l_imaa006  LIKE imaa_t.imaa006
DEFINE l_imaa001  LIKE imaa_t.imaa001
DEFINE l_rate     LIKE type_t.num26_10
DEFINE l_amt1     LIKE xcnc_t.xcnc011  #良品数量计算
DEFINE l_amt2     LIKE xcnc_t.xcnc017  #报工工时累加
DEFINE l_amt3     LIKE xcnc_t.xcnc018  #报工机时累加
DEFINE l_seq      LIKE type_t.num10    #计算项次
DEFINE l_sfaa050  LIKE sfaa_t.sfaa050  #已入库数量
DEFINE l_sfaa013  LIKE sfaa_t.sfaa013  #单位
DEFINE l_sffb017  LIKE sffb_t.sffb017  #良品数量
DEFINE l_xcai111_1  LIKE xcai_t.xcai111  #固定机器工时
DEFINE l_xcai112_1  LIKE xcai_t.xcai112  #变动机器工时=变动工时/耗用批量
DEFINE l_xcai111_2  LIKE xcai_t.xcai111  #固定人工工时
DEFINE l_xcai112_2  LIKE xcai_t.xcai112  #变动人工工时=变动工时/耗用批量
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   SELECT xcaa001 INTO l_xcaa001 FROM xcaa_t WHERE xcaaent = g_enterprise AND xcaa002 = 'Y' AND xcaastus = 'Y'
   #三种情况都需要带到xcnc中。1.只有报工数据；2.只有标准数据；3.报工+标准中都有此数据
   #报工单的机时工时根据作业编号+工作站进行sum
   #1.获取sffb中不同的作业编号+工作站，xcai中的标准资料
   #成本主要素、次要素待补充，先给空值
   LET l_sql = " SELECT DISTINCT sfaadocno,sfaa011,sfac006,sffb007,sffb009,'','',",
#               "                 A.xcai105,B.xcai105,A.xcai106,B.xcai106,A.xcai108, ",
               "                 NVL((SELECT SUM(NVL(xcai105,0)) FROM xcai_t WHERE xcaient = sfaaent AND xcaisite = sfaasite AND xcai001 = '",l_xcaa001,"' AND sffb007 = xcai102 AND sffb009 = xcai103 AND xcai002 <= sfaadocdt AND (xcai003 IS NULL OR xcai003 > sfaadocdt) AND xcai004 = sfaa010 AND xcai100 = sffb029 AND xcai110 = '2'),0) xcai105_1,",#人工
               "                 NVL((SELECT SUM(NVL(xcai105,0)) FROM xcai_t WHERE xcaient = sfaaent AND xcaisite = sfaasite AND xcai001 = '",l_xcaa001,"' AND sffb007 = xcai102 AND sffb009 = xcai103 AND xcai002 <= sfaadocdt AND (xcai003 IS NULL OR xcai003 > sfaadocdt) AND xcai004 = sfaa010 AND xcai100 = sffb029 AND xcai110 = '1'),0) xcai105_2,",#机器
               "                 NVL((SELECT MAX(NVL(xcai111,0)) FROM xcai_t WHERE xcaient = sfaaent AND xcaisite = sfaasite AND xcai001 = '",l_xcaa001,"' AND sffb007 = xcai102 AND sffb009 = xcai103 AND xcai002 <= sfaadocdt AND (xcai003 IS NULL OR xcai003 > sfaadocdt) AND xcai004 = sfaa010 AND xcai100 = sffb029 AND xcai110 = '2'),0) xcai111_2,",#人工
               "                 NVL((SELECT MAX(NVL(xcai111,0)) FROM xcai_t WHERE xcaient = sfaaent AND xcaisite = sfaasite AND xcai001 = '",l_xcaa001,"' AND sffb007 = xcai102 AND sffb009 = xcai103 AND xcai002 <= sfaadocdt AND (xcai003 IS NULL OR xcai003 > sfaadocdt) AND xcai004 = sfaa010 AND xcai100 = sffb029 AND xcai110 = '1'),0) xcai111_1,",#机器
               "                 NVL((SELECT MAX((CASE WHEN NVL(xcai113,0) = 0 THEN 0 ELSE NVL(xcai112,0)/xcai113 END)) FROM xcai_t WHERE xcaient = sfaaent AND xcaisite = sfaasite AND xcai001 = '",l_xcaa001,"' AND sffb007 = xcai102 AND sffb009 = xcai103 AND xcai002 <= sfaadocdt AND xcai004 = sfaa010 AND xcai100 = sffb029 AND xcai110 = '2'),0) xcai112_2,",#人工
               "                 NVL((SELECT MAX((CASE WHEN NVL(xcai113,0) = 0 THEN 0 ELSE NVL(xcai112,0)/xcai113 END)) FROM xcai_t WHERE xcaient = sfaaent AND xcaisite = sfaasite AND xcai001 = '",l_xcaa001,"' AND sffb007 = xcai102 AND sffb009 = xcai103 AND xcai002 <= sfaadocdt AND xcai004 = sfaa010 AND xcai100 = sffb029 AND xcai110 = '1'),0) xcai112_1,",#机器
               "                 (SELECT MAX(xcai108) FROM xcai_t WHERE xcaient = sfaaent AND xcaisite = sfaasite AND xcai001 = '",l_xcaa001,"' AND sffb007 = xcai102 AND sffb009 = xcai103 AND xcai002 <= sfaadocdt AND xcai004 = sfaa010 AND xcai100 = sffb029 AND xcai110 = '2') xcai108,",#人工
               "                 sffb029,(SELECT imaa006 FROM imaa_t WHERE imaaent = sffbent AND imaa001 = sfaa010) imaa006,sfaasite ",  #获取报工料号的成本单位
               "   FROM sfaa_t LEFT OUTER JOIN sfac_t ON sfaadocno = sfacdocno AND sfaaent = sfacent AND sfac002 = '1' ",
               "               LEFT OUTER JOIN sffb_t ON sffb005 = sfaadocno AND sffbent = sfaaent AND sffb029 = sfaa010 ",
#               "               LEFT OUTER JOIN xcai_t A ON A.xcaient = sfaaent AND A.xcaisite = sfaasite AND A.xcai001 = '",l_xcaa001,"' AND sffb007 = A.xcai102 AND sffb009 = A.xcai103 AND A.xcai002 <= sfaadocdt AND A.xcai004 = sfaa010 AND A.xcai100 = sffb029 AND A.xcai110 = '2' ",#人工
#               "               LEFT OUTER JOIN xcai_t B ON B.xcaient = sfaaent AND B.xcaisite = sfaasite AND B.xcai001 = '",l_xcaa001,"' AND sffb007 = B.xcai102 AND sffb009 = B.xcai103 AND B.xcai002 <= sfaadocdt AND B.xcai004 = sfaa010 AND B.xcai100 = sffb029 AND B.xcai110 = '1' ",#机器
               "  WHERE sfaaent = ",g_enterprise," AND sfaadocno = '",p_docno,"' AND sfac006 = '",p_feature,"' AND sffbent = sfaaent ",
               "  ORDER BY sfaadocno,sfac006,sffb007,sffb009 "
   PREPARE s_asfp500_xcnc_p1 FROM l_sql
   DECLARE s_asfp500_xcnc_c1 CURSOR FOR s_asfp500_xcnc_p1
   #1-1.根据作业编号，工作站，合计良品数量，单位（转换成成本单位的数量），报工工时，报工机时
   LET l_sql = " SELECT DISTINCT sffb016,SUM(NVL(sffb017,0)),SUM(NVL(sffb014,0)),SUM(NVL(sffb015,0)) ",
               "   FROM sffb_t ",
               "  WHERE sffbent = ",g_enterprise," AND sffb005 = '",p_docno,"' AND sffb007 = ? AND sffb009 = ? ",
               "  GROUP BY sffb016 "
   PREPARE s_asfp500_xcnc_p2 FROM l_sql
   DECLARE s_asfp500_xcnc_c2 CURSOR FOR s_asfp500_xcnc_p2
   LET l_sql = " SELECT DISTINCT sfaadocno,sfaa011,sfac006,e.xcai102,e.xcai103,e.xcai108,'','',sfaa010,",
               "                 (SELECT imaa006 FROM imaa_t WHERE imaaent = e.xcaient AND imaa001 = e.xcai100) imaa006,sfaasite,sfaa050,sfaa013, ",
               "                 (SELECT MIN(sffb017) FROM sffb_t WHERE sffb005 = sfaadocno AND sffbent = sfaaent) sffb017, ",
               "                 NVL((SELECT SUM(NVL(a.xcai105,0)) FROM xcai_t a WHERE a.xcaient = e.xcaient AND a.xcaisite = e.xcaisite AND a.xcai001 = e.xcai001 AND a.xcai002 = e.xcai002 AND a.xcai004 = e.xcai004 AND a.xcai100 = e.xcai100 AND a.xcai102 = e.xcai102 AND a.xcai103 = e.xcai103 AND a.xcai110 = '1'),0) xcai105_1,",
               "                 NVL((SELECT SUM(NVL(b.xcai105,0)) FROM xcai_t b WHERE b.xcaient = e.xcaient AND b.xcaisite = e.xcaisite AND b.xcai001 = e.xcai001 AND b.xcai002 = e.xcai002 AND b.xcai004 = e.xcai004 AND b.xcai100 = e.xcai100 AND b.xcai102 = e.xcai102 AND b.xcai103 = e.xcai103 AND b.xcai110 = '2'),0) xcai105_2,",
#               "                 NVL((SELECT MAX(NVL(c.xcai106,0)) FROM xcai_t c WHERE c.xcaient = e.xcaient AND c.xcaisite = e.xcaisite AND c.xcai001 = e.xcai001 AND c.xcai002 = e.xcai002 AND c.xcai004 = e.xcai004 AND c.xcai100 = e.xcai100 AND c.xcai102 = e.xcai102 AND c.xcai103 = e.xcai103 AND c.xcai110 = '1'),0) xcai106_1,",
#               "                 NVL((SELECT MAX(NVL(d.xcai106,0)) FROM xcai_t d WHERE d.xcaient = e.xcaient AND d.xcaisite = e.xcaisite AND d.xcai001 = e.xcai001 AND d.xcai002 = e.xcai002 AND d.xcai004 = e.xcai004 AND d.xcai100 = e.xcai100 AND d.xcai102 = e.xcai102 AND d.xcai103 = e.xcai103 AND d.xcai110 = '2'),0) xcai106_2 ",
               "                 NVL((SELECT MAX(NVL(c.xcai111,0)) FROM xcai_t c WHERE c.xcaient = e.xcaient AND c.xcaisite = e.xcaisite AND c.xcai001 = e.xcai001 AND c.xcai002 = e.xcai002 AND c.xcai004 = e.xcai004 AND c.xcai100 = e.xcai100 AND c.xcai102 = e.xcai102 AND c.xcai103 = e.xcai103 AND c.xcai110 = '1'),0) xcai111_1,",
               "                 NVL((SELECT MAX(NVL(d.xcai111,0)) FROM xcai_t d WHERE d.xcaient = e.xcaient AND d.xcaisite = e.xcaisite AND d.xcai001 = e.xcai001 AND d.xcai002 = e.xcai002 AND d.xcai004 = e.xcai004 AND d.xcai100 = e.xcai100 AND d.xcai102 = e.xcai102 AND d.xcai103 = e.xcai103 AND d.xcai110 = '2'),0) xcai111_2, ",
               "                 NVL((SELECT MAX((CASE WHEN NVL(f.xcai113,0) = 0 THEN 0 ELSE NVL(f.xcai112,0)/f.xcai113 END)) FROM xcai_t f WHERE f.xcaient = e.xcaient AND f.xcaisite = e.xcaisite AND f.xcai001 = e.xcai001 AND f.xcai002 = e.xcai002 AND f.xcai004 = e.xcai004 AND f.xcai100 = e.xcai100 AND f.xcai102 = e.xcai102 AND f.xcai103 = e.xcai103 AND f.xcai110 = '1'),0) xcai112_1,",
               "                 NVL((SELECT MAX((CASE WHEN NVL(g.xcai113,0) = 0 THEN 0 ELSE NVL(g.xcai112,0)/g.xcai113 END)) FROM xcai_t g WHERE g.xcaient = e.xcaient AND g.xcaisite = e.xcaisite AND g.xcai001 = e.xcai001 AND g.xcai002 = e.xcai002 AND g.xcai004 = e.xcai004 AND g.xcai100 = e.xcai100 AND g.xcai102 = e.xcai102 AND g.xcai103 = e.xcai103 AND g.xcai110 = '2'),0) xcai112_2 ",
               "   FROM sfaa_t LEFT OUTER JOIN sfac_t ON sfaadocno = sfacdocno AND sfaaent = sfacent AND sfac002 = '1' ",
               "               LEFT OUTER JOIN xcai_t e ON e.xcaient = sfaaent AND e.xcaisite = sfaasite AND e.xcai001 = '",l_xcaa001,"' AND e.xcai002 <= sfaadocdt AND (e.xcai003 IS NULL OR e.xcai003 > sfaadocdt) AND e.xcai100 = sfaa010 ",
               "  WHERE sfaaent = ",g_enterprise," AND sfaadocno = '",p_docno,"' AND sfac006 = '",p_feature,"' AND xcaient = sfaaent ",
               "    AND NOT EXISTS(SELECT 1 FROM sffb_t WHERE sffbent = sfaaent AND sffb005 = sfaadocno AND sffb029 = e.xcai100 AND sffb007 = e.xcai102 AND sffb009 = e.xcai103) "
   PREPARE s_asfp500_xcnc_p3 FROM l_sql
   DECLARE s_asfp500_xcnc_c3 CURSOR FOR s_asfp500_xcnc_p3
   LET l_seq = 0
   LET l_amt1 = 0
   LET l_amt2 = 0
   LET l_amt3 = 0
   FOREACH s_asfp500_xcnc_c1 INTO l_xcnc.xcnc001,l_xcnc.xcnc002,l_xcnc.xcnc003,l_xcnc.xcnc004,l_xcnc.xcnc006,
                                  l_xcnc.xcnc007,l_xcnc.xcnc008,l_xcnc.xcnc005,l_xcnc.xcnc009,l_xcai111_2,l_xcai111_1,l_xcai112_2,l_xcai112_1,
                                  l_xcnc.xcnc016,l_imaa001,l_imaa006,l_xcnc.xcncsite
      LET l_xcnc.xcncent = g_enterprise
      LET l_xcnc.xcnccrtdt = cl_get_current()
      LET l_seq = l_seq + 1
      LET l_xcnc.xcncseq = l_seq
      #换算出良品数量
      FOREACH s_asfp500_xcnc_c2 USING l_xcnc.xcnc004,l_xcnc.xcnc006
                                #INTO l_xcnc.xcnc016,l_xcnc.xcnc011,l_xcnc.xcnc017,l_xcnc.xcnc018  #180914-00028#1 mark
                                INTO l_xcnc.xcnc012,l_xcnc.xcnc011,l_xcnc.xcnc017,l_xcnc.xcnc018   #180914-00028#1 add
         #IF l_xcnc.xcnc016 <> l_imaa006 THEN  #180914-00028#1 mark
         IF l_xcnc.xcnc012 <> l_imaa006 THEN   #180914-00028#1 add
            LET l_rate = 0
            #CALL s_aooi250_convert_qty1(l_imaa001,l_xcnc.xcnc016,l_imaa006,1)  #180914-00028#1 mark
            CALL s_aooi250_convert_qty1(l_imaa001,l_xcnc.xcnc012,l_imaa006,1)   #180914-00028#1 add
               RETURNING l_success,l_rate
            IF cl_null(l_rate) OR l_rate = 0 THEN
               LET l_rate = 1
            END IF
            LET l_xcnc.xcnc011 = l_xcnc.xcnc011 * l_rate
         END IF
         LET l_amt1 = l_amt1 + l_xcnc.xcnc011
         LET l_amt2 = l_amt2 + l_xcnc.xcnc017
         LET l_amt3 = l_amt3 + l_xcnc.xcnc018
      END FOREACH
      LET l_xcnc.xcnc012 = l_imaa006
      LET l_xcnc.xcnc011 = l_amt1
      LET l_xcnc.xcnc017 = l_amt2
      LET l_xcnc.xcnc018 = l_amt3
      #计算标准及实际数量
      #标准
      #标准人工工时耗用量=固定工时+良品数量*变动工时/变动批量
      LET l_xcnc.xcnc013 = l_xcai111_2+l_xcnc.xcnc011*l_xcai112_2
      #标准机器工时耗用量=固定工时+良品数量*变动工时/变动批量
      LET l_xcnc.xcnc014 = l_xcai111_1+l_xcnc.xcnc011*l_xcai112_1
      #单位耗用量=耗用量/良品数量
      IF NOT cl_null(l_xcnc.xcnc011) THEN
         LET l_xcnc.xcnc010 = l_xcnc.xcnc013/l_xcnc.xcnc011
         LET l_xcnc.xcnc024 = l_xcnc.xcnc014/l_xcnc.xcnc011
      ELSE
         LET l_xcnc.xcnc010 = 0
         LET l_xcnc.xcnc024 = 0
      END IF
#      LET l_xcnc.xcnc013 = l_xcnc.xcnc011 * l_xcnc.xcnc010  #标准人工工时耗用量=良品数量*标准人工工时单位耗用量
#      LET l_xcnc.xcnc014 = l_xcnc.xcnc011 * l_xcnc.xcnc024  #标准机器工时耗用量=良品数量*标准机器工时单位耗用量
      LET l_xcnc.xcnc015 = l_xcnc.xcnc013 + l_xcnc.xcnc014  #标准总报工工时=标准人工工时耗用量+标准机器工时耗用量
      LET l_xcnc.xcnc023 = l_xcnc.xcnc013*l_xcnc.xcnc005 + l_xcnc.xcnc014*l_xcnc.xcnc009 #标准人工工时标准工费额=标准人工工时耗用量*人工工时标准费率+标准机器工时耗用量*机器工时标准费率
      #实际
      #l_xcnc.xcnc017 实际报工工时
      #l_xcnc.xcnc018 实际报工机时
      LET l_xcnc.xcnc019 = l_xcnc.xcnc017 + l_xcnc.xcnc018  #实际总报工工时
      LET l_xcnc.xcnc020 = l_xcnc.xcnc017*l_xcnc.xcnc005 + l_xcnc.xcnc018*l_xcnc.xcnc009 #实际工时标准工费额=实际报工工时*人工工时标准费率+实际报工机时*机器工时标准费率
      LET l_xcnc.xcnc021 = l_xcnc.xcnc017 - l_xcnc.xcnc013 #人工工时耗用差异 = 实际人工工时-标准人工工时
      LET l_xcnc.xcnc025 = l_xcnc.xcnc018 - l_xcnc.xcnc014 #机器工时耗用差异 = 实际机器工时-标准机器工时
      LET l_xcnc.xcnc022 = l_xcnc.xcnc021*l_xcnc.xcnc005   #人工工时耗用差异金额 = 人工工时耗用差异*人工工时标准费率
      LET l_xcnc.xcnc026 = l_xcnc.xcnc025*l_xcnc.xcnc009   #机器工时耗用差异金额 = 机器工时耗用差异*机器工时标准费率
      #1-2.累计后插入到暂存档
      EXECUTE s_asfp500_xcnc_ins_curs USING l_xcnc.*,g_pid  #mod lixwz
   END FOREACH
   
   #2.获取xcai中不存在sffb中的作业编号+工作站，插入到暂存档-->实际的工时资料皆给0
   FOREACH s_asfp500_xcnc_c3 INTO l_xcnc.xcnc001,l_xcnc.xcnc002,l_xcnc.xcnc003,l_xcnc.xcnc004,l_xcnc.xcnc006,l_xcnc.xcnc016,l_xcnc.xcnc007,l_xcnc.xcnc008,
                                  l_imaa001,l_imaa006,l_xcnc.xcncsite,l_sfaa050,l_sfaa013,l_sffb017,l_xcnc.xcnc009,l_xcnc.xcnc005,
                                  l_xcai111_1,l_xcai111_2,l_xcai112_1,l_xcai112_2
      LET l_xcnc.xcncent = g_enterprise
      LET l_xcnc.xcnccrtdt = cl_get_current()
      LET l_seq = l_seq + 1
      LET l_xcnc.xcncseq = l_seq
      LET l_xcnc.xcnc011 = 0 
      LET l_xcnc.xcnc012 = l_imaa006
      LET l_xcnc.xcnc017 = 0
      LET l_xcnc.xcnc018 = 0
      #如果工单有其他报工单，则以最小的良品数量，作为当前的良品数量
      IF NOT cl_null(l_sffb017) AND l_sffb017 <> 0 THEN
         LET l_xcnc.xcnc011 = l_sffb017
      ELSE
         #如果工单没有其他报工单，则以入库数量，作为良品数量
         IF NOT cl_null(l_sfaa050) AND l_sfaa050 <> 0 THEN
            LET l_xcnc.xcnc011 = l_sfaa050
         END IF
      END IF
      IF l_imaa006 <> l_sfaa013 THEN
         LET l_rate = 1
         CALL s_aooi250_convert_qty1(l_imaa001,l_sfaa013,l_imaa006,1)
            RETURNING l_success,l_rate
         IF cl_null(l_rate) OR l_rate = 0 THEN
            LET l_rate = 1
         END IF
         LET l_xcnc.xcnc011 = l_xcnc.xcnc011 * l_rate
      END IF
      #标准
      #标准人工工时耗用量=固定工时+良品数量*变动工时/变动批量
      LET l_xcnc.xcnc013 = l_xcai111_2+l_xcnc.xcnc011*l_xcai112_2
      #标准机器工时耗用量=固定工时+良品数量*变动工时/变动批量
      LET l_xcnc.xcnc014 = l_xcai111_1+l_xcnc.xcnc011*l_xcai112_1
      #单位耗用量=耗用量/良品数量
      IF NOT cl_null(l_xcnc.xcnc011) THEN
         LET l_xcnc.xcnc010 = l_xcnc.xcnc013/l_xcnc.xcnc011
         LET l_xcnc.xcnc024 = l_xcnc.xcnc014/l_xcnc.xcnc011
      ELSE
         LET l_xcnc.xcnc010 = 0
         LET l_xcnc.xcnc024 = 0
      END IF
#      LET l_xcnc.xcnc013 = l_xcnc.xcnc011 * l_xcnc.xcnc010  #标准人工工时耗用量=良品数量*标准人工工时单位耗用量
#      LET l_xcnc.xcnc014 = l_xcnc.xcnc011 * l_xcnc.xcnc024  #标准机器工时耗用量=良品数量*标准机器工时单位耗用量
      LET l_xcnc.xcnc015 = l_xcnc.xcnc013 + l_xcnc.xcnc014  #标准总报工工时=标准人工工时耗用量+标准机器工时耗用量
      LET l_xcnc.xcnc023 = l_xcnc.xcnc013*l_xcnc.xcnc005 + l_xcnc.xcnc014*l_xcnc.xcnc009 #标准人工工时标准工费额=标准人工工时耗用量*人工工时标准费率+标准机器工时耗用量*机器工时标准费率
      #实际
      #l_xcnc.xcnc017 实际报工工时
      #l_xcnc.xcnc018 实际报工机时
      LET l_xcnc.xcnc019 = l_xcnc.xcnc017 + l_xcnc.xcnc018  #实际总报工工时
      LET l_xcnc.xcnc020 = l_xcnc.xcnc017*l_xcnc.xcnc005 + l_xcnc.xcnc018*l_xcnc.xcnc009 #实际工时标准工费额=实际报工工时*人工工时标准费率+实际报工机时*机器工时标准费率
      LET l_xcnc.xcnc021 = l_xcnc.xcnc017 - l_xcnc.xcnc013 #人工工时耗用差异 = 实际人工工时-标准人工工时
      LET l_xcnc.xcnc025 = l_xcnc.xcnc018 - l_xcnc.xcnc014 #机器工时耗用差异 = 实际机器工时-标准机器工时
      LET l_xcnc.xcnc022 = l_xcnc.xcnc021*l_xcnc.xcnc005   #人工工时耗用差异金额 = 人工工时耗用差异*人工工时标准费率
      LET l_xcnc.xcnc026 = l_xcnc.xcnc025*l_xcnc.xcnc009   #机器工时耗用差异金额 = 机器工时耗用差异*机器工时标准费率
      #1-2.累计后插入到暂存档
      EXECUTE s_asfp500_xcnc_ins_curs USING l_xcnc.*,g_pid #mod by lixwz 
   END FOREACH
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 工单差异相关暂存档建立
# Memo...........: #171211-00028#16 add
################################################################################
PUBLIC FUNCTION s_asfp500_create_tmp()
DEFINE r_success  LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE

   #检查事务中
   IF NOT s_transaction_chk('N',1) THEN
      RETURN r_success
   END IF 
   #add by lixwz210630 s---
   IF cl_null(g_pid) THEN 
      LET g_pid = FGL_GETPID()
   END IF
   CALL s_asfp500_drop_tmp()
   RETURN 
   #add by lixwz210630 e---

   DROP TABLE s_asfp500_xcna;
   DROP TABLE s_asfp500_xcnb;
   DROP TABLE s_asfp500_xcnc;
   
   CREATE TEMP TABLE s_asfp500_xcna(
       xcnaent LIKE xcna_t.xcnaent, #企业代码
       xcnasite LIKE xcna_t.xcnasite, #营运据点
       xcnacomp LIKE xcna_t.xcnacomp, #法人组织
       xcnadocno LIKE xcna_t.xcnadocno, #工单编号
       xcnadocdt LIKE xcna_t.xcnadocdt, #单据日期
       xcna001 LIKE xcna_t.xcna001, #工单类型
       xcna002 LIKE xcna_t.xcna002, #主件编号
       xcna003 LIKE xcna_t.xcna003, #产品特征
       xcna004 LIKE xcna_t.xcna004, #生管结案日
       xcna005 LIKE xcna_t.xcna005, #成本单位
       xcna006 LIKE xcna_t.xcna006, #生产数量
       xcna007 LIKE xcna_t.xcna007, #入库数量
       xcna008 LIKE xcna_t.xcna008, #成本BOM需求量
       xcna009 LIKE xcna_t.xcna009, #工单应发数量
       xcna010 LIKE xcna_t.xcna010, #工单已发数量
       xcna011 LIKE xcna_t.xcna011, #实际已发与标准差
       xcna012 LIKE xcna_t.xcna012, #实际已发与应发差
       xcna013 LIKE xcna_t.xcna013, #实际已发与标准差异金额
       xcna014 LIKE xcna_t.xcna014, #实际已发与应发差异金额
       xcna015 LIKE xcna_t.xcna015, #标准工时耗用量
       xcna016 LIKE xcna_t.xcna016, #标准工时耗用金额
       xcna017 LIKE xcna_t.xcna017, #实际总报工工时
       xcna018 LIKE xcna_t.xcna018, #实际工时标准工费额
       xcna019 LIKE xcna_t.xcna019, #工时耗用差异
       xcna020 LIKE xcna_t.xcna020, #工时耗用差异金额
       xcna021 LIKE xcna_t.xcna021, #成本中心
       xcna022 LIKE xcna_t.xcna022, #标准机时耗用量
       xcna023 LIKE xcna_t.xcna023, #标准机时耗用金额
       xcna024 LIKE xcna_t.xcna024, #实际总报工机时
       xcna025 LIKE xcna_t.xcna025, #实际机时标准工费额
       xcna026 LIKE xcna_t.xcna026, #机时耗用差异
       xcna027 LIKE xcna_t.xcna027,  #机时耗用差异金额
       xcnacrtdt  LIKE xcna_t.xcnacrtdt
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create s_asfp500_xcna'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   CREATE TEMP TABLE s_asfp500_xcnb(
       xcnbent LIKE xcnb_t.xcnbent, #企业代码
       xcnbsite LIKE xcnb_t.xcnbsite, #营运据点
       xcnbdocno LIKE xcnb_t.xcnbdocno, #工单编号
       xcnb001 LIKE xcnb_t.xcnb001, #主件编号
       xcnb002 LIKE xcnb_t.xcnb002, #产品特征
       xcnbseq LIKE xcnb_t.xcnbseq, #项次
       xcnbseq1 LIKE xcnb_t.xcnbseq1, #项序
       xcnb003 LIKE xcnb_t.xcnb003, #元件编号
       xcnb004 LIKE xcnb_t.xcnb004, #元件产品特征
       xcnb005 LIKE xcnb_t.xcnb005, #成本单位
       xcnb006 LIKE xcnb_t.xcnb006, #主成本要素
       xcnb007 LIKE xcnb_t.xcnb007, #次成本要素
       xcnb008 LIKE xcnb_t.xcnb008, #成本BOM组成用量
       xcnb009 LIKE xcnb_t.xcnb009, #成本BOM主件底数
       xcnb010 LIKE xcnb_t.xcnb010, #成本BOM需求量
       xcnb011 LIKE xcnb_t.xcnb011, #标准成本单价
       xcnb012 LIKE xcnb_t.xcnb012, #工单应发数量
       xcnb013 LIKE xcnb_t.xcnb013, #工单已发数量
       xcnb014 LIKE xcnb_t.xcnb014, #实际已发与标准差
       xcnb015 LIKE xcnb_t.xcnb015, #实际已发与应发差
       xcnb016 LIKE xcnb_t.xcnb016, #实际已发与标准差异金额
       xcnb017 LIKE xcnb_t.xcnb017, #实际已发与应发差异金额
       xcnbcrtdt LIKE xcnb_t.xcnbcrtdt
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create s_asfp500_xcnb'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   CREATE TEMP TABLE s_asfp500_xcnc(
       xcncent LIKE xcnc_t.xcncent, #企业代码
       xcncsite LIKE xcnc_t.xcncsite, #营运据点
       xcnc001 LIKE xcnc_t.xcnc001, #工单单号
       xcncseq LIKE xcnc_t.xcncseq, #项次
       xcnc002 LIKE xcnc_t.xcnc002, #BOM特性
       xcnc003 LIKE xcnc_t.xcnc003, #产品特征
       xcnc004 LIKE xcnc_t.xcnc004, #作业编号
       xcnc005 LIKE xcnc_t.xcnc005, #人工工时标准费率
       xcnc006 LIKE xcnc_t.xcnc006, #工作站
       xcnc007 LIKE xcnc_t.xcnc007, #归属主成本要素
       xcnc008 LIKE xcnc_t.xcnc008, #归属次成本要素
       xcnc009 LIKE xcnc_t.xcnc009, #机器工时标准费率
       xcnc010 LIKE xcnc_t.xcnc010, #标准人工工时单位耗用量
       xcnc011 LIKE xcnc_t.xcnc011, #良品数量
       xcnc012 LIKE xcnc_t.xcnc012, #成本单位
       xcnc013 LIKE xcnc_t.xcnc013, #标准人工工时耗用量
       xcnc014 LIKE xcnc_t.xcnc014, #标准机器工时耗用量
       xcnc015 LIKE xcnc_t.xcnc015, #标准总报工工时
       xcnc016 LIKE xcnc_t.xcnc016, #委外否
       xcnc017 LIKE xcnc_t.xcnc017, #实际报工工时
       xcnc018 LIKE xcnc_t.xcnc018, #实际报工机时
       xcnc019 LIKE xcnc_t.xcnc019, #实际总报工工时
       xcnc020 LIKE xcnc_t.xcnc020, #实际工时标准工费额
       xcnc021 LIKE xcnc_t.xcnc021, #人工工时耗用差异
       xcnc022 LIKE xcnc_t.xcnc022, #人工工时耗用差异金额
       xcnc023 LIKE xcnc_t.xcnc023, #标准工时标准工费额
       xcnc024 LIKE xcnc_t.xcnc024, #标准机器工时单位耗用量
       xcnc025 LIKE xcnc_t.xcnc025, #机器工时耗用差异
       xcnc026 LIKE xcnc_t.xcnc026, #机器工时耗用差异金额
       xcnccrtdt LIKE xcnc_t.xcnccrtdt #资料创建日
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create s_asfp500_xcnc'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 工单差异相关暂存档DROP
# Memo...........: #171211-00028#16 add
################################################################################
PUBLIC FUNCTION s_asfp500_drop_tmp()

   #add by lixwz210630 s---
   DELETE FROM s_asfp500_xcna WHERE pid = g_pid
   DELETE FROM s_asfp500_xcna WHERE pid = g_pid
   DELETE FROM s_asfp500_xcna WHERE pid = g_pid
   RETURN 
   #add by lixwz210630 e---
   
   DROP TABLE s_asfp500_xcna;
   DROP TABLE s_asfp500_xcnb;
   DROP TABLE s_asfp500_xcnc;
   
   
END FUNCTION

################################################################################
# Descriptions...: 产品特征限定用料
# Memo...........: #171211-00028#16 add
################################################################################
PUBLIC FUNCTION s_asfp500_bom_feature(p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008,p_feature,p_imaa005)
DEFINE p_bmca001    LIKE bmca_t.bmca001
DEFINE p_bmca002    LIKE bmca_t.bmca002
DEFINE p_bmca003    LIKE bmca_t.bmca003
DEFINE p_bmca004    LIKE bmca_t.bmca004
DEFINE p_bmca005    LIKE bmca_t.bmca005
DEFINE p_bmca007    LIKE bmca_t.bmca007
DEFINE p_bmca008    LIKE bmca_t.bmca008
DEFINE p_feature    LIKE inam_t.inam002
DEFINE p_imaa005    LIKE imaa_t.imaa005
DEFINE r_success    LIKE type_t.num5
DEFINE r_feature    LIKE inam_t.inam002
DEFINE l_inam       RECORD
    inam011    LIKE inam_t.inam011,
    inam012    LIKE inam_t.inam012,
    inam013    LIKE inam_t.inam013,
    inam014    LIKE inam_t.inam014,
    inam015    LIKE inam_t.inam015,
    inam016    LIKE inam_t.inam016,
    inam017    LIKE inam_t.inam017,
    inam018    LIKE inam_t.inam018,
    inam019    LIKE inam_t.inam019,
    inam020    LIKE inam_t.inam020,
    inam021    LIKE inam_t.inam021,
    inam022    LIKE inam_t.inam022,
    inam023    LIKE inam_t.inam023,
    inam024    LIKE inam_t.inam024,
    inam025    LIKE inam_t.inam025,
    inam026    LIKE inam_t.inam026,
    inam027    LIKE inam_t.inam027,
    inam028    LIKE inam_t.inam028,
    inam029    LIKE inam_t.inam029,
    inam030    LIKE inam_t.inam030,
    inam031    LIKE inam_t.inam031,
    inam032    LIKE inam_t.inam032,
    inam033    LIKE inam_t.inam033,
    inam034    LIKE inam_t.inam034,
    inam035    LIKE inam_t.inam035,
    inam036    LIKE inam_t.inam036,
    inam037    LIKE inam_t.inam037,
    inam038    LIKE inam_t.inam038,
    inam039    LIKE inam_t.inam039,
    inam040    LIKE inam_t.inam040,
    inam041    LIKE inam_t.inam041,
    inam042    LIKE inam_t.inam042,
    inam043    LIKE inam_t.inam043,
    inam044    LIKE inam_t.inam044,
    inam045    LIKE inam_t.inam045,
    inam046    LIKE inam_t.inam046,
    inam047    LIKE inam_t.inam047,
    inam048    LIKE inam_t.inam048,
    inam049    LIKE inam_t.inam049,
    inam050    LIKE inam_t.inam050
                END RECORD
DEFINE l_bmcb  RECORD
    bmcb009    LIKE bmcb_t.bmcb009,
    bmcb010    LIKE bmcb_t.bmcb010,
    bmcb011    LIKE bmcb_t.bmcb011,
    bmcb012    LIKE bmcb_t.bmcb012
           END RECORD
DEFINE l_flag       LIKE type_t.chr1
DEFINE l_bmcb009_t  LIKE bmcb_t.bmcb009
DEFINE l_ac         LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5
DEFINE l_bmcc  RECORD
    bmcc009    LIKE bmcc_t.bmcc009,
    bmcc010    LIKE bmcc_t.bmcc010
           END RECORD
DEFINE l_bmcd  RECORD
    bmcd010    LIKE bmcd_t.bmcd010,
    bmcd011    LIKE bmcd_t.bmcd011
           END RECORD
DEFINE l_bmce  RECORD
    bmce009    LIKE bmce_t.bmce009,
    bmce010    LIKE bmce_t.bmce010
           END RECORD
DEFINE l_imeb  DYNAMIC ARRAY OF RECORD
    imeb002    LIKE imeb_t.imeb002,    #特徵項次:記錄是哪一個特徵項次
    imeb004    LIKE imeb_t.imeb004,    #特徵類型:記錄該特徵類型
    imec003    LIKE imec_t.imec003     #特徵值:記錄該特徵項次的內容值
           END RECORD
DEFINE l_success    LIKE type_t.num5
DEFINE l_sql      STRING

   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   LET r_feature = ' '
   
   
   #主件特征对应特征类型特征值
   LET l_sql = " SELECT inam011,inam012,inam013,inam014,inam015,inam016,inam017,inam018,inam019,inam020, ",
               "        inam021,inam022,inam023,inam024,inam025,inam026,inam027,inam028,inam029,inam030, ",
               "        inam031,inam032,inam033,inam034,inam035,inam036,inam037,inam038,inam039,inam040, ",
               "        inam041,inam042,inam043,inam044,inam045,inam046,inam047,inam048,inam049,inam050  ",
               "   FROM inam_t ",
               "  WHERE inament = ? AND inam001 = ? AND inam002 = ? "
   PREPARE s_asfp500_feature_p1 FROM l_sql
   
   #主件产品特征限定用料
   LET l_sql = " SELECT COUNT(1) FROM bmca_t ",
               "  WHERE bmcaent=? AND bmcasite=? ",
               "    AND bmca001=? AND bmca002=? AND bmca003=? AND bmca004=? AND bmca005=? AND bmca007=? AND bmca008=? "
   PREPARE s_asfp500_feature_p2 FROM l_sql
   
   LET l_sql = " SELECT bmcb009,bmcb010,bmcb011,bmcb012 ",
               "   FROM bmcb_t ",
               "  WHERE bmcbent=? AND bmcbsite=? ",
               "    AND bmcb001=? AND bmcb002=? AND bmcb003=? AND bmcb004=? AND bmcb005=? AND bmcb007=? AND bmcb008=? ",
               "  ORDER BY bmcb009,bmcb010 "
   PREPARE s_asfp500_feature_p3 FROM l_sql
   DECLARE s_asfp500_feature_c3 CURSOR FOR s_asfp500_feature_p3
   
   #主件与元件产品特征对应
   LET l_sql = " SELECT COUNT(1) FROM bmcc_t ",
               "  WHERE bmccent=? AND bmccsite=? ",
               "    AND bmcc001=? AND bmcc002=? AND bmcc003=? AND bmcc004=? AND bmcc005=? AND bmcc007=? AND bmcc008=? "
   PREPARE s_asfp500_feature_p4 FROM l_sql
   
   LET l_sql = " SELECT bmcc009,bmcc010",
               "   FROM bmcc_t", 
               "  WHERE bmccent=? AND bmccsite=? ",   #161214-00023#1 去第一个AND
               "    AND bmcc001=? AND bmcc002=? AND bmcc003=? AND bmcc004=? AND bmcc005=? AND bmcc007=? AND bmcc008=? ",
               "  ORDER BY bmcc009 "
   PREPARE s_asfp500_feature_p5 FROM l_sql
   DECLARE s_asfp500_feature_c5 CURSOR FOR s_asfp500_feature_p5
   
   LET l_sql = " SELECT bmcd010,bmcd011 ",
               "   FROM bmcd_t ",
               "  WHERE  bmcdent=? AND bmcdsite=?",
               "    AND bmcd001=? AND bmcd002=? AND bmcd003=? AND bmcd004=? AND bmcd005=? AND bmcd007=? AND bmcd008=? AND bmcd009=? ",
               "  ORDER BY bmcd009 "
   PREPARE s_asfp500_feature_pcd FROM l_sql
   DECLARE s_asfp500_feature_ccd CURSOR FOR s_asfp500_feature_pcd  

   #限定元件特征
   LET l_sql = " SELECT bmce009,bmce010 ",
               "   FROM bmce_t ",
               "  WHERE bmceent=? AND bmcesite=? ",
               "    AND bmce001=? AND bmce002=? AND bmce003=? AND bmce004=? AND bmce005=? AND bmce007=? AND bmce008=? ",
               "  ORDER BY bmce009 "
   PREPARE s_asfp500_feature_p6 FROM l_sql
   DECLARE s_asfp500_feature_c6 CURSOR FOR s_asfp500_feature_p6
   
   #料件特徵群組單身檔–屬性類型
   LET l_sql = " SELECT imeb006 FROM imaa_t,imeb_t ",
               "  WHERE imaaent = ? AND imaa001 = ? ",
               "    AND imebent = imaaent AND imeb001 = imaa005 AND imeb004 = ? "
   PREPARE s_asfp500_feature_check_p1 FROM l_sql   
   
   #主件特征对应特征类型特征值
   INITIALIZE l_inam.* TO NULL
   EXECUTE s_asfp500_feature_p1
     USING g_enterprise,p_bmca001,p_feature
      INTO l_inam.inam011,l_inam.inam012,l_inam.inam013,l_inam.inam014,l_inam.inam015,
           l_inam.inam016,l_inam.inam017,l_inam.inam018,l_inam.inam019,l_inam.inam020,
           l_inam.inam021,l_inam.inam022,l_inam.inam023,l_inam.inam024,l_inam.inam025,
           l_inam.inam026,l_inam.inam027,l_inam.inam028,l_inam.inam029,l_inam.inam030,
           l_inam.inam031,l_inam.inam032,l_inam.inam033,l_inam.inam034,l_inam.inam035,
           l_inam.inam036,l_inam.inam037,l_inam.inam038,l_inam.inam039,l_inam.inam040,
           l_inam.inam041,l_inam.inam042,l_inam.inam043,l_inam.inam044,l_inam.inam045,
           l_inam.inam046,l_inam.inam047,l_inam.inam048,l_inam.inam049,l_inam.inam050
   
   #主件产品特征限定用料
   LET l_n = 0
   EXECUTE s_asfp500_feature_p2
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
      INTO l_n
   IF l_n > 0 THEN
      LET l_flag = 'Y'
      LET l_bmcb009_t = ' '
      INITIALIZE l_bmcb.* TO NULL
      FOREACH s_asfp500_feature_c3
        USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
         INTO l_bmcb.bmcb009,l_bmcb.bmcb010,l_bmcb.bmcb011,l_bmcb.bmcb012
         #同特征类型的限定特征满足其中一项---》检查通过，直接检查下一特征类型
         IF l_flag = 'Y' AND l_bmcb009_t = l_bmcb.bmcb009 THEN
            CONTINUE FOREACH
         END IF
         #同特征类型的限定特征都不满足---》检查不通过，返回
         IF l_flag = 'N' AND l_bmcb009_t != l_bmcb.bmcb009 THEN
            RETURN r_success,r_feature
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam012) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam014) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam016) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam018) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam020) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam022) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam024) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam026) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam028) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam030) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam032) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam034) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam036) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam038) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam040) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam042) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam044) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam046) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam048) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
            CALL s_asfp500_feature_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam050) RETURNING l_flag
         END IF
         LET l_bmcb009_t = l_bmcb.bmcb009
      END FOREACH
      IF l_flag = 'N' THEN
         RETURN r_success,r_feature
      END IF
   END IF
   
   IF cl_null(p_imaa005) THEN
      LET r_success = TRUE
      RETURN r_success,r_feature
   END IF
   
   LET l_ac = 1
   
   #主件与元件产品特征对应
   LET l_n = 0
   EXECUTE s_asfp500_feature_p4
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
     INTO l_n
   IF l_n > 0 THEN
      LET l_flag = 'Y'
      INITIALIZE l_bmcc.* TO NULL
      INITIALIZE l_bmcd.* TO NULL
      FOREACH s_asfp500_feature_c5
        USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
         INTO l_bmcc.bmcc009,l_bmcc.bmcc010 
         IF l_bmcc.bmcc010 = '2' THEN
            FOREACH s_asfp500_feature_ccd
            USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008,l_bmcc.bmcc009
            INTO l_bmcd.bmcd010,l_bmcd.bmcd011
               IF l_bmcc.bmcc009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam012 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam014 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam016 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam018 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN    
                  IF l_bmcd.bmcd010 = l_inam.inam020 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam022 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam024 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam026 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam028 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam030 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN 
                  IF l_bmcd.bmcd010 = l_inam.inam032 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN 
                  IF l_bmcd.bmcd010 = l_inam.inam034 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam036 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1 
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam038 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam040 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam042 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam044 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam046 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF

               END IF
               IF l_bmcc.bmcc009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam048 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam050 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF            
            
            END FOREACH
            CONTINUE FOREACH
         END IF
                 
         IF l_bmcc.bmcc009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam012
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam012 AND NOT cl_null(l_bmcd.bmcd011) THEN
               
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam014
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam014 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam016
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam016 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam018
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam018 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam020
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam020 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam022
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam022 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam024
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam024 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam026
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam026 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam028
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam028 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam030
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam030 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam032
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam032 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam034
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam034 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam036
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam036 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam038
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam038 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam040
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam040 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam042
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam042 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam044
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam044 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam046
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam046 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam048
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam048 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam050
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam050 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
      END FOREACH
   END IF
   
   #限定元件特征
   INITIALIZE l_bmce.* TO NULL
   FOREACH s_asfp500_feature_c6
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
      INTO l_bmce.bmce009,l_bmce.bmce010
      LET l_imeb[l_ac].imeb004 = l_bmce.bmce009
      LET l_imeb[l_ac].imec003 = l_bmce.bmce010
      LET l_ac = l_ac + 1
   END FOREACH
   
   CALL l_imeb.deleteElement(l_ac)
   LET l_ac = l_ac - 1
   
   CALL s_feature_multi_create_string(p_bmca003,p_imaa005,l_imeb,'',g_site) RETURNING l_success,r_feature
   IF NOT l_success THEN
      RETURN r_success,r_feature
   END IF
   
   LET r_success = TRUE
   RETURN r_success,r_feature
END FUNCTION

################################################################################
# Descriptions...: 特征检查是否有限定用料
# Memo...........: #171211-00028#16 add
################################################################################
PUBLIC FUNCTION s_asfp500_feature_check(p_bmcb001,p_bmcb009,p_bmcb011,p_bmcb012,p_inam012)
DEFINE p_bmcb001    LIKE bmcb_t.bmcb001
DEFINE p_bmcb009    LIKE bmcb_t.bmcb009
DEFINE p_bmcb011    LIKE bmcb_t.bmcb011
DEFINE p_bmcb012    LIKE bmcb_t.bmcb012
DEFINE p_inam012    LIKE inam_t.inam012
DEFINE r_flag       LIKE type_t.chr1
DEFINE l_imeb006    LIKE imeb_t.imeb006

   LET r_flag = 'N'
   
   IF cl_null(p_bmcb011) AND cl_null(p_bmcb012) THEN
      LET r_flag = 'Y'
      RETURN r_flag
   END IF
   
   LET l_imeb006 = ''
   EXECUTE s_asfp500_feature_check_p1 USING g_enterprise,p_bmcb001,p_bmcb009 INTO l_imeb006
   
   IF cl_null(l_imeb006) THEN
      RETURN r_flag
   END IF
   
   IF NOT cl_null(p_bmcb011) AND cl_null(p_bmcb012) THEN
      IF l_imeb006 = '1' THEN
         IF p_inam012 = p_bmcb011 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      ELSE
         IF p_inam012 >= p_bmcb011 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      END IF
   END IF
   IF cl_null(p_bmcb011) AND NOT cl_null(p_bmcb012) THEN
      IF l_imeb006 = '1' THEN
         IF p_inam012 = p_bmcb012 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      ELSE
         IF p_inam012 <= p_bmcb012 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      END IF
   END IF
   #起讫都有值，则说明是数值类型的
   IF NOT cl_null(p_bmcb011) AND NOT cl_null(p_bmcb012) THEN
      IF p_inam012 >= p_bmcb011 AND p_inam012 <= p_bmcb012 THEN
         LET r_flag = 'Y'
         RETURN r_flag
      END IF
   END IF
   
   RETURN r_flag
END FUNCTION

################################################################################
# Descriptions...: 工單是否可結案檢核
# Memo...........:
# Usage..........: CALL s_asfp500_woclose_chk(p_sfaadocno,p_sfaa047)
#                  RETURNING r_success
# Input parameter: p_sfaadocno    工單單號
#                : p_sfaa047      生管結案日
# Return code....: r_success      檢核結果
# Date & Author..: 18/05/29 By 07423 (#180503-00021#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_woclose_chk(p_sfaadocno,p_sfaa047)
   DEFINE p_sfaadocno         LIKE sfaa_t.sfaadocno   #工單單號
   DEFINE p_sfaa047           LIKE sfaa_t.sfaa047     #生管結案日
   DEFINE r_success           LIKE type_t.num5 
   DEFINE l_sfaa047           LIKE sfaa_t.sfaa047
   
   LET r_success = FALSE
   
   #結案日期檢查
   IF NOT s_asfp500_close_dd_chk(p_sfaadocno,p_sfaa047) THEN
      RETURN r_success
   END IF
   
   #检查是否有未完的相关单据
   IF s_asfp500_unfinished_chk(p_sfaadocno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code  = 'asf-00926'
      LET g_errparam.extend= p_sfaadocno
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN r_success
   END IF     

   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 結案日期檢查
# Memo...........:
# Usage..........: CALL s_asfp500_close_dd_chk(p_sfaadocno,p_close_dd)
#                  RETURNING r_success
# Input parameter: p_sfaadocno    工單單號
#                : p_close_dd     結案日期
# Return code....: r_success      檢核結果
# Date & Author..: 18/05/29 By 07423 (#180503-00021#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asfp500_close_dd_chk(p_sfaadocno,p_close_dd)
   DEFINE p_sfaadocno     LIKE sfaa_t.sfaadocno
   DEFINE p_close_dd      LIKE type_t.dat
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_mfg_close     LIKE type_t.dat
   DEFINE l_fin_close     LIKE type_t.dat
   DEFINE l_date          LIKE type_t.dat
   DEFINE l_flag          LIKE type_t.chr1
   
   LET r_success = FALSE
   
   LET l_mfg_close = cl_get_para(g_enterprise,g_site,'S-MFG-0031')
   LET l_fin_close = cl_get_para(g_enterprise,g_site,'S-FIN-6012')
   
   #檢查結案日期不可小於等於庫存關帳日期
   IF p_close_dd <= l_mfg_close THEN
      #結案日期%1不可小於等於庫存關帳日期%2！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code  = 'asf-00698'
      LET g_errparam.replace[1] = p_close_dd 
      LET g_errparam.replace[2] = l_mfg_close
      LET g_errparam.extend= p_sfaadocno
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN r_success
   END IF
   
   #檢查結案日期不可小於等於成本關帳日
   IF p_close_dd <= l_fin_close THEN
      #結案日期%1不可小於等於成本關帳日期%2！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code  = 'asf-00869'
      LET g_errparam.replace[1] = p_close_dd 
      LET g_errparam.replace[2] = l_fin_close
      LET g_errparam.extend= p_sfaadocno
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN r_success
   END IF
   
   #該工单的所有相關单据中，取得日期值最大的那笔日期值
   CALL s_asfp500_get_max_reference_date(p_sfaadocno)
        RETURNING l_date,l_flag
   
   IF p_close_dd < l_date THEN
      #其他作业有使用此工单单号，工单的结案日期不可小于这些单据中的单据日期或是过帐日期 或 工单本身的开立日期！
      INITIALIZE g_errparam TO NULL
      CASE l_flag
           WHEN '1'  LET g_errparam.code = 'asf-00704'   #發料/退料單
           WHEN '2'  LET g_errparam.code = 'asf-00705'   #報工單
           WHEN '3'  LET g_errparam.code = 'asf-00706'   #當站報廢單
           WHEN '4'  LET g_errparam.code = 'asf-00707'   #當站下線單
           WHEN '5'  LET g_errparam.code = 'asf-00708'   #重工轉出單
           WHEN '6'  LET g_errparam.code = 'asf-00709'   #下階料報廢單
           WHEN '7'  LET g_errparam.code = 'asf-00710'   #完工入庫單
           WHEN '8'  LET g_errparam.code = 'asf-00711'   #FQC單
           WHEN '9'  LET g_errparam.code = 'asf-00712'   #委外採購單
           WHEN '10' LET g_errparam.code = 'asf-00713'   #委外收貨單、驗退單、委外入庫、倉退單
           WHEN '11' LET g_errparam.code = 'asf-00714'   #IQC單
      END CASE
      LET g_errparam.extend = l_date
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 委外採購單結案作業
# Memo...........:
# Usage..........: CALL s_asfp500_po_close(p_sfaadocno)
#                  RETURNING r_success
# Input parameter: p_sfaadocno    工單單號
# Return code....: r_success      成功否标识符
# Date & Author..: 18/05/29 By 07423 (#180503-00021#1 add)
# Modify.........: 18/05/24 By 02159  #190523-00038#1
################################################################################
PUBLIC FUNCTION s_asfp500_po_close(p_sfaadocno)
   DEFINE p_sfaadocno      LIKE sfaa_t.sfaadocno
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_pmdndocno      LIKE pmdn_t.pmdndocno
   DEFINE l_pmdnseq        LIKE pmdn_t.pmdnseq
   DEFINE l_pmdl006        LIKE pmdl_t.pmdl006
   DEFINE l_pmdl031        LIKE pmdl_t.pmdl031
   DEFINE l_pmdl051        LIKE pmdl_t.pmdl051
   DEFINE l_pmdlsite       LIKE pmdl_t.pmdlsite
   DEFINE l_pmdlstus       LIKE pmdl_t.pmdlstus
   DEFINE l_pmdlcrtid      LIKE pmdl_t.pmdlcrtid
   DEFINE l_pmdlcrtdp      LIKE pmdl_t.pmdlcrtdp
   DEFINE l_pmdldocdt      LIKE pmdl_t.pmdldocdt   
   DEFINE l_flag           LIKE type_t.chr1
   DEFINE l_x              LIKE type_t.num10
   DEFINE ls_sql           STRING
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   
   LET ls_sql = " SELECT UNIQUE pmdldocno,pmdnseq,pmdl006,pmdl031,pmdl051,pmdlsite,",
                "               pmdlstus,pmdlcrtid,pmdlcrtdp,pmdldocdt",
                "   FROM pmdl_t,pmdn_t,pmdp_t ",
                "  WHERE pmdlent   = pmdpent   AND pmdlent   = pmdnent ",
                "    AND pmdldocno = pmdpdocno AND pmdldocno = pmdndocno",
                "    AND pmdnseq   = pmdpseq ",
                "    AND pmdl005   = '2' ",           #委外采购
                "    AND pmdl007   = '4' ",           #资料来源4.一般工单
                "    AND pmdp003   = ?   ",           #工单号
                "    AND pmdlstus  <>'X' ",           #剔除作废单据 
                "    AND pmdlent   = ",g_enterprise     
                
   PREPARE s_asfp500_sel_po_p1 FROM ls_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "prepare s_asfp500_sel_po_p1"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success
   END IF

   DECLARE s_asfp500_sel_po_cs CURSOR FOR s_asfp500_sel_po_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "declare s_asfp500_sel_po_cs"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err() 
      RETURN r_success
   END IF
   
   #190523-00038#1 by 02159 add(S)
   LET ls_sql = " SELECT UNIQUE pmdldocno,pmdlsite,pmdlstus",
                "   FROM pmdl_t,pmdn_t,pmdp_t ",
                "  WHERE pmdlent   = pmdpent   AND pmdlent   = pmdnent ",
                "    AND pmdldocno = pmdpdocno AND pmdldocno = pmdndocno",
                "    AND pmdnseq   = pmdpseq ",
                "    AND pmdl005   = '2' ",
                "    AND pmdl007   = '4' ",
                "    AND pmdp003   = ?   ",
                "    AND pmdlstus <>'X' ",
                "    AND pmdlent = '",g_enterprise,"' " 
                
   PREPARE s_asfp500_sel_po_p FROM ls_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "prepare s_asfp500_sel_po_p"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success 
   END IF

   DECLARE s_asfp500_sel_po1_cs CURSOR FOR s_asfp500_sel_po_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "declare s_asfp500_sel_po1_cs"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success
   END IF   
   #190523-00038#1 by 02159 add(E)
   
   LET l_flag = 'Y'
   FOREACH s_asfp500_sel_po_cs USING p_sfaadocno
                                INTO l_pmdndocno,l_pmdnseq,l_pmdl006,l_pmdl031,l_pmdl051,l_pmdlsite,
                                     l_pmdlstus,l_pmdlcrtid,l_pmdlcrtdp,l_pmdldocdt
        
       IF l_pmdlstus = 'C' THEN CONTINUE FOREACH END IF  
       
       #單身狀態結案
       IF NOT s_apmp510_pmdn045_closed('2',l_pmdndocno,l_pmdnseq,'',l_pmdlsite) THEN
          LET l_flag = 'N'
       END IF
       
       #190523-00038#1 by 02159 mark(S)
       ##物流結案
       #IF NOT s_apmp510_pmdl047_closed(l_pmdndocno,l_pmdlsite) THEN
       #   LET l_flag = 'N'
       #END IF
       #
       ##帳流結案
       #IF NOT s_apmp510_pmdl048_closed(l_pmdndocno,g_site) THEN
       #   LET l_flag = 'N'
       #END IF
       ##金流結案
       #IF NOT s_apmp510_pmdl049_closed(l_pmdndocno,g_site) THEN
       #   LET l_flag = 'N'
       #END IF
       ##狀態結案
       #IF NOT s_apmp510_pmdlstus_closed('2',l_pmdndocno,g_site) THEN
       #   LET l_flag = 'N'
       #END IF
       #190523-00038#1 by 02159 mark(E)       
    
       IF l_flag = 'N' THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = l_pmdndocno 
          LET g_errparam.code = 'asf-00690' 
          LET g_errparam.popup = TRUE 
          CALL cl_err() 
       END IF
   END FOREACH   
   
   #190523-00038#1 by 02159 add(S)
   LET l_pmdndocno = ''
   LET l_pmdlsite = ''
   LET l_pmdlstus = ''
   FOREACH s_asfp500_sel_po1_cs USING p_sfaadocno 
                                 INTO l_pmdndocno,l_pmdlsite,l_pmdlstus
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_flag = 'N'
         EXIT FOREACH
      END IF

      IF l_pmdlstus = 'C' THEN CONTINUE FOREACH END IF

      #物流結案
      IF NOT s_apmp510_pmdl047_closed(l_pmdndocno,l_pmdlsite) THEN
         LET l_flag = 'N'
      END IF

      #帳流結案
      IF NOT s_apmp510_pmdl048_closed(l_pmdndocno,g_site) THEN
         LET l_flag = 'N'
      END IF
            #金流結案
      IF NOT s_apmp510_pmdl049_closed(l_pmdndocno,g_site) THEN
         LET l_flag = 'N'
      END IF
      #狀態結案
      IF NOT s_apmp510_pmdlstus_closed('2',l_pmdndocno,g_site) THEN
         LET l_flag = 'N'
      END IF

       IF l_flag = 'N' THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = l_pmdndocno 
          LET g_errparam.code = 'asf-00690' 
          LET g_errparam.popup = TRUE 
          CALL cl_err() 
       END IF
   END FOREACH   
   #190523-00038#1 by 02159 add(E)
   
   IF l_flag = 'N' THEN
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

 
{</section>}
 
