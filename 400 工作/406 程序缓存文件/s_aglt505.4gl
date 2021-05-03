#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_aglt505.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0014(1900-01-01 00:00:00), PR版次:0014(2021-03-05 16:37:33)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000278
#+ Filename...: s_aglt505
#+ Description: 合併報表調整項目-長期投資成本法轉權益法應用元件
#+ Creator....: 04152(2015-12-11 09:55:38)
#+ Modifier...: 00000 -SD/PR- 05795
 
{</section>}
 
{<section id="s_aglt505.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#160201-00014#1      2016/03/03   By 03538      無單別的單據類程式,目前不支援BPM整合,ws_confirm FUNC移除
#161128-00061#7      2016/12/09   By 02481      标准程式定义采用宣告模式,弃用.*写法
#170324-00118#1      2017/03/25   By 02114      投资比率赋值有误
#170325-00019#1      2017/03/25   By 02114      1.aglt505 的第一單身應為上層公司，第二單身為下層 不考慮是否為分層合併
#                                               2.屬於不分層合併時，最下層公司會取不到gldn科餘，應去除上層公司的條件
#170614-00006#1      2017/06/14   By Sabrina    無法自動產生單身
#170724-00063#5      2017/07/26   By Sabrina    修改單身金額計算邏輯
#170814-00021#9      2017/08/23   By Sabrina    若合併帳套為不分層合併時，第一單身的個體帳套會和第二單身個體帳套不一致
#170817-00040#6      2017/08/23   By Sabrina    (1)確認時需檢核第一單身和第二單身子公司借/貸方合計金額是否一致
#                                               (2)修改第二單身金額抓取邏輯
#180614-00018#1      2018/06/14   By 10554      修正「長期股權損益調整科目」未設定造成以空值寫入失敗的問題
#180820-00022#1      2018/08/27   By 10554      修正自動產生單身時報錯sub-00788的問題
#180829-00033#1      2018/08/31   By 10554      aglt505單身「投資公司股權科目」改為必要欄位,確認段增加對應檢核
#190527-00008#1      2019/05/30   By 07804      取得aglt511資料須補上gler001年度條件
#191101-00022#1      2019/11/04   By 05795      #投资收益取得方法做了修改，取消股本及公积类科目
#210305-00027#1      2021/03/05   By 05795      在查找gldc_t数据的时候s_aglt505_sel_gldc_p这个sql需要加一个条件gldc005 = 'Y' 排除N状态的
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_aglt505.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_aglt505.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="s_aglt505.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_aglt505.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 確認前檢查
# Memo...........:
# Usage..........: CALL s_aglt505_conf_chk()
#                  RETURNING r_success
# Date & Author..: 2015/12/11 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aglt505_conf_chk(p_glfild,p_glfi001,p_glfi002,p_glfi003)
DEFINE p_glfild         LIKE glfi_t.glfild
DEFINE p_glfi001        LIKE glfi_t.glfi001
DEFINE p_glfi002        LIKE glfi_t.glfi002
DEFINE p_glfi003        LIKE glfi_t.glfi003
DEFINE r_success        LIKE type_t.num5
#170817-00040#6---add---start---
DEFINE l_sql            STRING
DEFINE l_gldr004        LIKE gldr_t.gldr004
DEFINE l_gldr008        LIKE gldr_t.gldr008
DEFINE l_gldr009        LIKE gldr_t.gldr009
DEFINE l_gldr010        LIKE gldr_t.gldr010
DEFINE l_gldr011        LIKE gldr_t.gldr011
DEFINE l_gldr012        LIKE gldr_t.gldr012
DEFINE l_gldr013        LIKE gldr_t.gldr013
DEFINE l_glds016        LIKE glds_t.glds016
DEFINE l_glds018        LIKE glds_t.glds018
DEFINE l_glds020        LIKE glds_t.glds020
#170817-00040#6---add---end---
DEFINE l_cnt            LIKE type_t.num5    #180829-00033#1 add
DEFINE l_colname        STRING              #180829-00033#1 add 
DEFINE l_comment        STRING              #180829-00033#1 add

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   #180829-00033#1---add---(S)
   LET l_cnt = 0
   SELECT COUNT(1) FROM glds_t
    WHERE gldsent = g_enterprise
      AND gldsld = p_glfild
      AND glds001 = p_glfi001
      AND glds002 = p_glfi002
      AND glds003 = p_glfi003
      AND glds004 IS NULL
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      CALL s_azzi902_get_gzzd("aglt505","lbl_glds014") RETURNING l_colname, l_comment
      LET g_errparam.extend = l_colname
      LET g_errparam.code   = 'aap-00216'
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET r_success = FALSE
   END IF
   #180829-00033#1---add---(E)
   #170817-00040#6---add---start---
   LET l_sql = "SELECT DISTINCT gldr004 FROM gldr_t",
               " WHERE gldrent = ",g_enterprise,
               "   AND gldrld = '",p_glfild,"'",
               "   AND gldr001 = '",p_glfi001,"'",
               "   AND gldr002 = ",p_glfi002,
               "   AND gldr003 = ",p_glfi003,
               " UNION ",
               "SELECT DISTINCT glds004 FROM glds_t",
               " WHERE gldsent = ",g_enterprise,
               "   AND gldsld = '",p_glfild,"'",
               "   AND glds001 = '",p_glfi001,"'",
               "   AND glds002 = ",p_glfi002,
               "   AND glds003 = ",p_glfi003
   PREPARE s_aglt505_gldr004_p FROM l_sql
   DECLARE s_aglt505_gldr004_c CURSOR FOR s_aglt505_gldr004_p
   
   LET l_sql = "SELECT SUM(gldr008),SUM(gldr009),SUM(gldr010),SUM(gldr011),SUM(gldr012),SUM(gldr013)",
               "  FROM gldr_t",
               " WHERE gldrent = ",g_enterprise,
               "   AND gldrld = '",p_glfild,"'",
               "   AND gldr001 = '",p_glfi001,"'",
               "   AND gldr002 = ",p_glfi002,
               "   AND gldr003 = ",p_glfi003,
               "   AND gldr004 = ?"
   PREPARE s_aglt505_gldr004_amt FROM l_sql
   
   LET l_sql = "SELECT SUM(glds016-glds015),SUM(glds018-glds017),SUM(glds020-glds019)",
               "  FROM glds_t",
               " WHERE gldsent = ",g_enterprise,
               "   AND gldsld = '",p_glfild,"'",
               "   AND glds001 = '",p_glfi001,"'",
               "   AND glds002 = ",p_glfi002,
               "   AND glds003 = ",p_glfi003,
               "   AND glds004 = ?"
   PREPARE s_aglt505_glds004_amt FROM l_sql   
   
   FOREACH s_aglt505_gldr004_c INTO l_gldr004
   
       LET l_gldr008 = 0
       LET l_gldr009 = 0
       LET l_gldr010 = 0
       LET l_gldr011 = 0
       LET l_gldr012 = 0
       LET l_gldr013 = 0
       EXECUTE s_aglt505_gldr004_amt USING l_gldr004
          INTO l_gldr008,l_gldr009,l_gldr010,l_gldr011,l_gldr012,l_gldr013
       IF cl_null(l_gldr008) THEN LET l_gldr008 = 0 END IF
       IF cl_null(l_gldr009) THEN LET l_gldr009 = 0 END IF
       IF cl_null(l_gldr010) THEN LET l_gldr010 = 0 END IF
       IF cl_null(l_gldr011) THEN LET l_gldr011 = 0 END IF
       IF cl_null(l_gldr012) THEN LET l_gldr012 = 0 END IF
       IF cl_null(l_gldr013) THEN LET l_gldr013 = 0 END IF  

       LET l_glds016 = 0
       LET l_glds018 = 0
       LET l_glds020 = 0
       EXECUTE s_aglt505_glds004_amt USING l_gldr004
          INTO l_glds016,l_glds018,l_glds020
       IF cl_null(l_glds016) THEN LET l_glds016 = 0 END IF
       IF cl_null(l_glds018) THEN LET l_glds018 = 0 END IF
       IF cl_null(l_glds020) THEN LET l_glds020 = 0 END IF
         
       #記帳幣         
       IF l_glds016 > 0 THEN
          IF l_glds016 != l_gldr008 OR l_gldr009 != 0 THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.extend = ''
             LET g_errparam.code   = 'agl-00265'
             LET g_errparam.replace[1] = l_gldr004
             LET g_errparam.popup  = TRUE
             CALL cl_err()   
             LET r_success = FALSE           
          END IF
       ELSE
          LET l_glds016 = l_glds016 * -1
          IF l_glds016 != l_gldr009 OR l_gldr008 != 0 THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.extend = ''
             LET g_errparam.code   = 'agl-00265'
             LET g_errparam.replace[1] = l_gldr004
             LET g_errparam.popup  = TRUE
             CALL cl_err()         
             LET r_success = FALSE  
          END IF
       END IF   
       #功能幣
       IF l_glds018 > 0 THEN
          IF l_glds018 != l_gldr010 OR l_gldr011 != 0 THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.extend = ''
             LET g_errparam.code   = 'agl-00265'
             LET g_errparam.replace[1] = l_gldr004
             LET g_errparam.popup  = TRUE
             CALL cl_err()     
             LET r_success = FALSE      
          END IF
       ELSE
          LET l_glds018 = l_glds018 * -1
          IF l_glds018 != l_gldr011 OR l_gldr010 != 0 THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.extend = ''
             LET g_errparam.code   = 'agl-00265'
             LET g_errparam.replace[1] = l_gldr004
             LET g_errparam.popup  = TRUE
             CALL cl_err()     
             LET r_success = FALSE      
          END IF
       END IF
       #報告幣
       IF l_glds020 > 0 THEN
          IF l_glds020 != l_gldr012 OR l_gldr013 != 0 THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.extend = ''
             LET g_errparam.code   = 'agl-00265'
             LET g_errparam.replace[1] = l_gldr004
             LET g_errparam.popup  = TRUE
             CALL cl_err()      
             LET r_success = FALSE     
          END IF
       ELSE
          LET l_glds020 = l_glds020 * -1
          IF l_glds020 != l_gldr013 OR l_gldr012 != 0 THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.extend = ''
             LET g_errparam.code   = 'agl-00265'
             LET g_errparam.replace[1] = l_gldr004
             LET g_errparam.popup  = TRUE
             CALL cl_err()      
             LET r_success = FALSE     
          END IF
       END IF       
   END FOREACH
   #170817-00040#6---add---end---
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 確認資訊回寫
# Memo...........:
# Usage..........: CALL s_aglt505_conf_upd()
#                  RETURNING r_success
# Date & Author..: 2015/12/11 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aglt505_conf_upd(p_glfild,p_glfi001,p_glfi002,p_glfi003)
DEFINE p_glfild         LIKE glfi_t.glfild
DEFINE p_glfi001        LIKE glfi_t.glfi001
DEFINE p_glfi002        LIKE glfi_t.glfi002
DEFINE p_glfi003        LIKE glfi_t.glfi003
DEFINE r_success        LIKE type_t.num5
DEFINE l_date           DATETIME YEAR TO SECOND

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   LET l_date = cl_get_current()
   
   UPDATE glfi_t SET glfistus = 'Y',
                     glficnfid = g_user,glficnfdt = l_date,
                     glfimodid = g_user,glfimoddt = l_date
    WHERE glfient = g_enterprise
      AND glfild  = p_glfild
      AND glfi001 = p_glfi001
      AND glfi002 = p_glfi002
      AND glfi003 = p_glfi003
   IF SQLCA.SQLCODE THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取消確認
# Memo...........:
# Usage..........: CALL s_aglt505_unconf_chk()
#                  RETURNING r_success
# Date & Author..: 2015/12/11 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aglt505_unconf_chk(p_glfild,p_glfi001,p_glfi002,p_glfi003)
DEFINE p_glfild         LIKE glfi_t.glfild
DEFINE p_glfi001        LIKE glfi_t.glfi001
DEFINE p_glfi002        LIKE glfi_t.glfi002
DEFINE p_glfi003        LIKE glfi_t.glfi003
DEFINE r_success        LIKE type_t.num5
DEFINE l_glfi004        LIKE glfi_t.glfi004

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   SELECT glfi004 INTO l_glfi004
     FROM glfi_t
    WHERE glfient = g_enterprise
      AND glfild  = p_glfild
      AND glfi001 = p_glfi001
      AND glfi002 = p_glfi002
      AND glfi003 = p_glfi003
   IF NOT cl_null(l_glfi004)THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00404'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取消確認
# Memo...........:
# Usage..........: CALL s_aglt505_unconf_upd()
#                  RETURNING r_success
# Date & Author..: 2015/12/11 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aglt505_unconf_upd(p_glfild,p_glfi001,p_glfi002,p_glfi003)
DEFINE p_glfild         LIKE glfi_t.glfild
DEFINE p_glfi001        LIKE glfi_t.glfi001
DEFINE p_glfi002        LIKE glfi_t.glfi002
DEFINE p_glfi003        LIKE glfi_t.glfi003
DEFINE r_success        LIKE type_t.num5
DEFINE l_date           DATETIME YEAR TO SECOND

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE

   LET l_date = cl_get_current()
   
   UPDATE glfi_t SET glfistus = 'N',
                     glficnfid = '',glficnfdt = '',
                     glfimodid = g_user,glfimoddt = l_date
    WHERE glfient = g_enterprise
      AND glfild  = p_glfild
      AND glfi001 = p_glfi001
      AND glfi002 = p_glfi002
      AND glfi003 = p_glfi003
   IF SQLCA.SQLCODE THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 刪除單身資料
# Memo...........:
# Usage..........: CALL s_aglt505_del_gldr_glds()
# Date & Author..: 2015/12/11 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aglt505_del_gldr_glds(p_glfild,p_glfi001,p_glfi002,p_glfi003)
DEFINE p_glfild         LIKE glfi_t.glfild  #合併帳別
DEFINE p_glfi001        LIKE glfi_t.glfi001 #上層公司
DEFINE p_glfi002        LIKE glfi_t.glfi002 #年度
DEFINE p_glfi003        LIKE glfi_t.glfi003 #期別
DEFINE r_success        LIKE type_t.num5
DEFINE l_glaa004        LIKE glaa_t.glaa004
DEFINE l_sql            STRING
DEFINE l_cnt            LIKE type_t.chr10
DEFINE l_cnt2           LIKE type_t.chr10
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   LET l_cnt = 0
   LET l_cnt2 = 0
   SELECT COUNT(*) INTO l_cnt
     FROM gldr_t
    WHERE gldrent = g_enterprise
      AND gldrld  = p_glfild
      AND gldr001 = p_glfi001
      AND gldr002 = p_glfi002
      AND gldr003 = p_glfi003
   SELECT COUNT(*) INTO l_cnt2
     FROM glds_t
    WHERE gldsent = g_enterprise
      AND gldsld  = p_glfild
      AND glds001 = p_glfi001
      AND glds002 = p_glfi002
      AND glds003 = p_glfi003
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF cl_null(l_cnt2) THEN LET l_cnt2 = 0 END IF
   IF (l_cnt+l_cnt2) = 0 THEN
      RETURN r_success
   ELSE
      IF NOT cl_ask_confirm('aap-00366') THEN
         LET r_success = FALSE
         RETURN r_success
      ELSE
         #刪除長投單身
         DELETE FROM gldr_t
          WHERE gldrent = g_enterprise
            AND gldrld  = p_glfild
            AND gldr001 = p_glfi001
            AND gldr002 = p_glfi002
            AND gldr003 = p_glfi003
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'del gldr_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
         #刪除權益單身
         DELETE FROM glds_t
          WHERE gldsent = g_enterprise
            AND gldsld  = p_glfild
            AND glds001 = p_glfi001
            AND glds002 = p_glfi002
            AND glds003 = p_glfi003
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'del glds_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 整批產生長投單身
# Memo...........:
# Usage..........: CALL s_aglt505_ins_gldr()
# Date & Author..: 2015/12/11 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aglt505_ins_gldr(p_glfild,p_glfi001,p_glfi002,p_glfi003)
DEFINE p_glfild         LIKE glfi_t.glfild  #合併帳別
DEFINE p_glfi001        LIKE glfi_t.glfi001 #上層公司
DEFINE p_glfi002        LIKE glfi_t.glfi002 #年度
DEFINE p_glfi003        LIKE glfi_t.glfi003 #期別
DEFINE r_success        LIKE type_t.num5
DEFINE l_glaa004        LIKE glaa_t.glaa004
DEFINE l_sql            STRING
DEFINE l_gldc002        LIKE gldc_t.gldc002
DEFINE l_gldc003        LIKE gldc_t.gldc003
DEFINE l_gldn007        LIKE gldn_t.gldn007
DEFINE l_gldn010        LIKE gldn_t.gldn010
DEFINE l_gldn011        LIKE gldn_t.gldn011
DEFINE l_gldn027        LIKE gldn_t.gldn027
DEFINE l_gldn028        LIKE gldn_t.gldn028
DEFINE l_gldn030        LIKE gldn_t.gldn030
DEFINE l_gldn031        LIKE gldn_t.gldn031
#DEFINE l_gldb002_u     LIKE gldb_t.gldb002        #170614-00006#1 add  #170724-00063#5 mark
DEFINE l_gldb002_d      LIKE gldb_t.gldb002        #170614-00006#1 add  #170724-00063#5 mark  #170814-00021#9 undo mark
#DEFINE l_glda004       LIKE glda_t.glda004        #170614-00006#1 add  #170724-00063#5 mark
DEFINE l_glab005        LIKE glab_t.glab005
DEFINE l_glaa131        LIKE glaa_t.glaa131        #170814-00021#9 add
#161128-00061#7----add----begin-------------------
#DEFINE l_gldr           RECORD LIKE gldr_t.*
DEFINE l_gldr RECORD  #合併報表長期投資成本法轉權益法維護單身檔
       gldrent LIKE gldr_t.gldrent, #企業編號
       gldrld LIKE gldr_t.gldrld, #合併帳套
       gldr001 LIKE gldr_t.gldr001, #投資公司
       gldr002 LIKE gldr_t.gldr002, #年度
       gldr003 LIKE gldr_t.gldr003, #期別
       gldr004 LIKE gldr_t.gldr004, #被投資公司
       gldr005 LIKE gldr_t.gldr005, #個體帳套
       gldr006 LIKE gldr_t.gldr006, #長期股權投資科目編號
       gldr008 LIKE gldr_t.gldr008, #借方金額(記帳幣)
       gldr009 LIKE gldr_t.gldr009, #貸方金額(記帳幣)
       gldr010 LIKE gldr_t.gldr010, #借方金額(功能幣)
       gldr011 LIKE gldr_t.gldr011, #貸方金額(功能幣)
       gldr012 LIKE gldr_t.gldr012, #借方金額(報告幣)
       gldr013 LIKE gldr_t.gldr013, #貸方金額(報告幣)
       gldrud001 LIKE gldr_t.gldrud001, #自定義欄位(文字)001
       gldrud002 LIKE gldr_t.gldrud002, #自定義欄位(文字)002
       gldrud003 LIKE gldr_t.gldrud003, #自定義欄位(文字)003
       gldrud004 LIKE gldr_t.gldrud004, #自定義欄位(文字)004
       gldrud005 LIKE gldr_t.gldrud005, #自定義欄位(文字)005
       gldrud006 LIKE gldr_t.gldrud006, #自定義欄位(文字)006
       gldrud007 LIKE gldr_t.gldrud007, #自定義欄位(文字)007
       gldrud008 LIKE gldr_t.gldrud008, #自定義欄位(文字)008
       gldrud009 LIKE gldr_t.gldrud009, #自定義欄位(文字)009
       gldrud010 LIKE gldr_t.gldrud010, #自定義欄位(文字)010
       gldrud011 LIKE gldr_t.gldrud011, #自定義欄位(數字)011
       gldrud012 LIKE gldr_t.gldrud012, #自定義欄位(數字)012
       gldrud013 LIKE gldr_t.gldrud013, #自定義欄位(數字)013
       gldrud014 LIKE gldr_t.gldrud014, #自定義欄位(數字)014
       gldrud015 LIKE gldr_t.gldrud015, #自定義欄位(數字)015
       gldrud016 LIKE gldr_t.gldrud016, #自定義欄位(數字)016
       gldrud017 LIKE gldr_t.gldrud017, #自定義欄位(數字)017
       gldrud018 LIKE gldr_t.gldrud018, #自定義欄位(數字)018
       gldrud019 LIKE gldr_t.gldrud019, #自定義欄位(數字)019
       gldrud020 LIKE gldr_t.gldrud020, #自定義欄位(數字)020
       gldrud021 LIKE gldr_t.gldrud021, #自定義欄位(日期時間)021
       gldrud022 LIKE gldr_t.gldrud022, #自定義欄位(日期時間)022
       gldrud023 LIKE gldr_t.gldrud023, #自定義欄位(日期時間)023
       gldrud024 LIKE gldr_t.gldrud024, #自定義欄位(日期時間)024
       gldrud025 LIKE gldr_t.gldrud025, #自定義欄位(日期時間)025
       gldrud026 LIKE gldr_t.gldrud026, #自定義欄位(日期時間)026
       gldrud027 LIKE gldr_t.gldrud027, #自定義欄位(日期時間)027
       gldrud028 LIKE gldr_t.gldrud028, #自定義欄位(日期時間)028
       gldrud029 LIKE gldr_t.gldrud029, #自定義欄位(日期時間)029
       gldrud030 LIKE gldr_t.gldrud030  #自定義欄位(日期時間)030
       END RECORD
#161128-00061#7----add----end-------------------
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE

#2.自動產生單身一：
#2-1 先取得屬於單頭合併帳別(gldrld)對應公司結構檔(glbc_t)的下層公司(gldc002)及帳別(gldc003) 作為後續取gldn_t的條件值
#2-2 條件：合併帳別(gldrld)+ 公司編號(glbc002) + 公司帳別(glbc003) + 年度(gldr002)+ 期別(gldr003) + 科目基本資料的財務比率分析類別(glac011)=(10:基金及長期投資-長期投資) 的科目
#2-3 取值：依上述條件取得合併報表個體公司會計科目餘額檔(gldn_t)(有分為記帳/功能/報告)
#2-4 將2-3點取得的資料寫入第一單身
#    被投資公司(gldr004) =下層公司(gldc002)
#    公司名稱 =至agli500取得
#    帳別(gldr005) =gldc003
#    長期股權投資科目(gldr006) =以gldn007寫入
#    借方金額(gldr008) = gldn010
#    貸方金額(gldr009) = gldn011
   
   #取得合併帳套的會計科目參照表號
  #CALL s_ld_sel_glaa(p_glfild,'glaa004') RETURNING g_sub_success,l_glaa004                    #170814-00021#9 mark
   CALL s_ld_sel_glaa(p_glfild,'glaa004|glaa131') RETURNING g_sub_success,l_glaa004,l_glaa131  #170814-00021#9 add
   
   LET l_sql = "SELECT gldc002,gldc003",
               "  FROM gldc_t ",
               " WHERE gldcent = ",g_enterprise,
               "   AND gldcld = '",p_glfild,"'",
               "   AND gldc001 = '",p_glfi001,"'",
              #"   AND gldc009 = 'Y' "       #170325-00019#1 add lujh   #170614-00006#1 mark
               "   AND gldc005 = 'Y' ",#210305-00027#1---add
               "   AND gldc009 = 'N' "       #170614-00006#1 add 
   PREPARE s_aglt505_sel_gldc_p FROM l_sql
   DECLARE s_aglt505_sel_gldc_c CURSOR FOR s_aglt505_sel_gldc_p
   
   #170724-00063#5---mark---strat---
   #長投金額由權益單身推算
   ##LET l_sql = "SELECT gldn007,gldn010,gldn011,gldn027,gldn028,",                      #170614-00006#1 mark
   #            #"       gldn030,gldn031",                                               #170614-00006#1 mark
   # LET l_sql = "SELECT gldn007,sum(gldn010),sum(gldn011),sum(gldn027),sum(gldn028),",  #170614-00006#1 add 
   #             "       sum(gldn030),sum(gldn031)",                                     #170614-00006#1 add 
   #             "  FROM gldn_t ",
   #             "  LEFT JOIN glac_t ON gldnent = glacent AND gldn007 = glac002 AND glac001 = '",l_glaa004,"'",
   #             " WHERE gldnent = ",g_enterprise,
   #             "   AND gldnld = '",p_glfild,"'",
   #             #"   AND gldn001 = '",p_glfi001,"'",  #上層公司編號   #170325-00019#1 mark lujh
   #             "   AND gldn005 = ",p_glfi002,       #合併年度
   #             "   AND gldn006 = ",p_glfi003,       #合併期別
   #             #"   AND gldn040 = ?",                #下層公司      #170614-00006#1 mark
   #             "   AND gldn040 = '",p_glfi001,"'",  #下層公司       #170614-00006#1 add
   #             "   AND gldn041 = ?",                #下層公司帳別
   #             "   AND gldn019 = ?",                #帳款客商       #170614-00006#1 add 
   #             "   AND glac011 = '10'"
   #            ," GROUP BY gldn001,gldn002,gldn003,gldn004,gldn007"  #170614-00006#1 add 
   # PREPARE s_aglt505_sel_gldn_p FROM l_sql
   # DECLARE s_aglt505_sel_gldn_c CURSOR FOR s_aglt505_sel_gldn_p
   #170724-00063#5---mark---end---   
   #170724-00063#5---add---start---
   SELECT glab005 INTO l_glab005
     FROM glab_t
    WHERE glabent = g_enterprise
      AND glabld = p_glfild
      AND glab001 = '12'
      AND glab002 = '9929'
      AND glab003 = '9929_12'
   #170724-00063#5---add---end---
   #180614-00018#1---add---(S) l_glab005若為空則報錯跳出func
   IF cl_null(l_glab005) THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00822'
      LET g_errparam.extend = '帳套',p_glfild
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   #180614-00018#1---add---(E)
   FOREACH s_aglt505_sel_gldc_c INTO l_gldc002,l_gldc003
      IF SQLCA.sqlcode THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 's_aglt505_sel_gldc_c'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      #170814-00021#9---add---start---
      IF l_glaa131 = 'N' THEN
         LET l_gldb002_d = ''
         SELECT gldb002 INTO l_gldb002_d
           FROM gldb_t
          WHERE gldbent = g_enterprise
            AND gldbld = l_gldc003 AND gldb001 = l_gldc002
         IF NOT cl_null(l_gldb002_d) THEN LET l_gldc003 = l_gldb002_d END IF
      END IF
      #170814-00021#9---add---end---
      #170724-00063#5---mark---start--- 
      ##170614-00006#1---add---start---
      ##上層公司個體帳套
      #SELECT gldb002 INTO l_gldb002_u
      #  FROM gldb_t
      # WHERE gldbent = g_enterprise
      #   AND gldbld = p_glfild AND gldb001 = p_glfi001  
      ##下層公司個體帳套         
      #SELECT gldb002 INTO l_gldb002_d
      #  FROM gldb_t
      # WHERE gldbent = g_enterprise
      #   AND gldbld = l_gldc003 AND gldb001 = l_gldc002
      #IF NOT cl_null(l_gldb002_d) THEN LET l_gldc003 = l_gldb002_d END IF 
      ##下層公司關係人
      #SELECT glda004 INTO l_glda004
      #  FROM glda_t
      # WHERE gldaent = 99
      #   AND glda001 = l_gldc002
      #170614-00006#1---add---end---
      ##FOREACH s_aglt505_sel_gldn_c USING l_gldc002,l_gldc003            #170614-00006#1 mark
      # FOREACH s_aglt505_sel_gldn_c USING l_gldb002_u,l_glda004          #170614-00006#1 add 
      #                               INTO l_gldn007,l_gldn010,l_gldn011,l_gldn027,l_gldn028,
      #                                    l_gldn030,l_gldn031
      #    IF SQLCA.sqlcode THEN
      #       LET r_success = FALSE
      #       INITIALIZE g_errparam TO NULL
      #       LET g_errparam.code = SQLCA.sqlcode
      #       LET g_errparam.extend = 's_aglt505_sel_gldn_c'
      #       LET g_errparam.popup = TRUE
      #       CALL cl_err()
      #       RETURN r_success
      #    END IF
      #    INITIALIZE l_gldr.* TO NULL
      #170724-00063#5---mark---end---   
         LET l_gldr.gldrent = g_enterprise  #企業編號
         LET l_gldr.gldrld  = p_glfild      #合併帳套
         LET l_gldr.gldr001 = p_glfi001     #投資公司
         LET l_gldr.gldr002 = p_glfi002     #年度
         LET l_gldr.gldr003 = p_glfi003     #期別
         LET l_gldr.gldr004 = l_gldc002     #被投資公司
         LET l_gldr.gldr005 = l_gldc003     #帳別
         #170724-00063#5---mark---start--- 
         #LET l_gldr.gldr006 = l_gldn007     #長期股權投資科目編號
         #LET l_gldr.gldr008 = l_gldn010     #借方金額(記帳幣)
         #LET l_gldr.gldr009 = l_gldn011     #貸方金額(記帳幣)
         #LET l_gldr.gldr010 = l_gldn027     #借方金額(功能幣)
         #LET l_gldr.gldr011 = l_gldn028     #貸方金額(功能幣)
         #LET l_gldr.gldr012 = l_gldn030     #借方金額(報告幣)
         #LET l_gldr.gldr013 = l_gldn031     #貸方金額(報告幣)
         #170724-00063#5---mark---start--- 
         #170724-00063#5---add---start--- 
         LET l_gldr.gldr006 = l_glab005     #長期股權投資科目編號
         #金額先給0，正確金額由權益單身回推
         LET l_gldr.gldr008 = 0     #借方金額(記帳幣)
         LET l_gldr.gldr009 = 0     #貸方金額(記帳幣)
         LET l_gldr.gldr010 = 0     #借方金額(功能幣)
         LET l_gldr.gldr011 = 0     #貸方金額(功能幣)
         LET l_gldr.gldr012 = 0     #借方金額(報告幣)
         LET l_gldr.gldr013 = 0     #貸方金額(報告幣)
         #170724-00063#5---add---start--- 
       
         #161128-00061#7----add----begin-------------------
         #INSERT INTO gldr_t VALUES(l_gldr.*)
         INSERT INTO gldr_t (gldrent,gldrld,gldr001,gldr002,gldr003,gldr004,gldr005,gldr006,gldr008,gldr009,
                             gldr010,gldr011,gldr012,gldr013,gldrud001,gldrud002,gldrud003,gldrud004,gldrud005,
                             gldrud006,gldrud007,gldrud008,gldrud009,gldrud010,gldrud011,gldrud012,gldrud013,
                             gldrud014,gldrud015,gldrud016,gldrud017,gldrud018,gldrud019,gldrud020,gldrud021,
                             gldrud022,gldrud023,gldrud024,gldrud025,gldrud026,gldrud027,gldrud028,gldrud029,gldrud030)
          VALUES(l_gldr.gldrent,l_gldr.gldrld,l_gldr.gldr001,l_gldr.gldr002,l_gldr.gldr003,l_gldr.gldr004,l_gldr.gldr005,l_gldr.gldr006,l_gldr.gldr008,l_gldr.gldr009,
                 l_gldr.gldr010,l_gldr.gldr011,l_gldr.gldr012,l_gldr.gldr013,l_gldr.gldrud001,l_gldr.gldrud002,l_gldr.gldrud003,l_gldr.gldrud004,l_gldr.gldrud005,
                 l_gldr.gldrud006,l_gldr.gldrud007,l_gldr.gldrud008,l_gldr.gldrud009,l_gldr.gldrud010,l_gldr.gldrud011,l_gldr.gldrud012,l_gldr.gldrud013,
                 l_gldr.gldrud014,l_gldr.gldrud015,l_gldr.gldrud016,l_gldr.gldrud017,l_gldr.gldrud018,l_gldr.gldrud019,l_gldr.gldrud020,l_gldr.gldrud021,
                 l_gldr.gldrud022,l_gldr.gldrud023,l_gldr.gldrud024,l_gldr.gldrud025,l_gldr.gldrud026,l_gldr.gldrud027,l_gldr.gldrud028,l_gldr.gldrud029,l_gldr.gldrud030)
         #161128-00061#7----add----end-------------------
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'ins gldr_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      
     #END FOREACH       #170724-00063#5 mark
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 整批產生權益單身
# Memo...........:
# Usage..........: CALL s_aglt505_ins_glds()
# Date & Author..: 2015/12/11 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aglt505_ins_glds(p_glfild,p_glfi001,p_glfi002,p_glfi003)
DEFINE p_glfild         LIKE glfi_t.glfild  #合併帳別
DEFINE p_glfi001        LIKE glfi_t.glfi001 #上層公司
DEFINE p_glfi002        LIKE glfi_t.glfi002 #年度
DEFINE p_glfi003        LIKE glfi_t.glfi003 #期別
DEFINE r_success        LIKE type_t.num5
DEFINE l_glaa001        LIKE glaa_t.glaa001
DEFINE l_glaa004        LIKE glaa_t.glaa004
DEFINE l_glaa016        LIKE glaa_t.glaa016
DEFINE l_glaa020        LIKE glaa_t.glaa020
DEFINE l_sql            STRING
DEFINE l_gldc002        LIKE gldc_t.gldc002
DEFINE l_gldc003        LIKE gldc_t.gldc003
DEFINE l_gldc004        LIKE gldc_t.gldc004       #170324-00118#1 add lujh
DEFINE l_gldc005        LIKE gldc_t.gldc005
DEFINE l_gldn007        LIKE gldn_t.gldn007
DEFINE l_gldn010        LIKE gldn_t.gldn010
DEFINE l_gldn011        LIKE gldn_t.gldn011
DEFINE l_gldn027        LIKE gldn_t.gldn027
DEFINE l_gldn028        LIKE gldn_t.gldn028
DEFINE l_gldn030        LIKE gldn_t.gldn030
DEFINE l_gldn031        LIKE gldn_t.gldn031
DEFINE l_gldb002_d      LIKE gldb_t.gldb002       #170614-00006#1 add
DEFINE l_sum_glds016    LIKE glds_t.glds016       #170724-00063#5 add
DEFINE l_sum_glds018    LIKE glds_t.glds018       #170724-00063#5 add
DEFINE l_sum_glds020    LIKE glds_t.glds020       #170724-00063#5 add
DEFINE l_glaa131        LIKE glaa_t.glaa131       #170814-00021#9 add
#170817-00040#6---add---start---
DEFINE l_gler005        LIKE gler_t.gler005       
DEFINE l_gler006        LIKE gler_t.gler006
DEFINE l_gler008        LIKE gler_t.gler008
DEFINE l_gler009        LIKE gler_t.gler009
DEFINE l_gler011        LIKE gler_t.gler011
DEFINE l_gler012        LIKE gler_t.gler012
DEFINE l_flag           LIKE type_t.chr1          
#170817-00040#6---add---end---
#161128-00061#7----add----begin-------------------
#DEFINE l_glds           RECORD LIKE glds_t.*
DEFINE l_glds RECORD  #合併報表長期投資成本法轉權益法維護單身檔
       gldsent LIKE glds_t.gldsent, #企業編號
       gldsld LIKE glds_t.gldsld, #合併帳套
       glds001 LIKE glds_t.glds001, #投資公司
       glds002 LIKE glds_t.glds002, #年度
       glds003 LIKE glds_t.glds003, #期別
       glds004 LIKE glds_t.glds004, #被投資公司
       glds005 LIKE glds_t.glds005, #個體帳套
       glds006 LIKE glds_t.glds006, #所有者權益科目
       glds007 LIKE glds_t.glds007, #借方總額(記帳幣)
       glds008 LIKE glds_t.glds008, #貸方總額(記帳幣)
       glds009 LIKE glds_t.glds009, #借方總額(功能幣)
       glds010 LIKE glds_t.glds010, #貸方總額(功能幣)
       glds011 LIKE glds_t.glds011, #借方總額(報告幣)
       glds012 LIKE glds_t.glds012, #貸方總額(報告幣)
       glds013 LIKE glds_t.glds013, #投資比例
       glds014 LIKE glds_t.glds014, #投資公司股權科目
       glds015 LIKE glds_t.glds015, #投資公司權益借方總額(記帳幣)
       glds016 LIKE glds_t.glds016, #投資公司權益貸方總額(記帳幣)
       glds017 LIKE glds_t.glds017, #投資公司權益借方總額(功能幣)
       glds018 LIKE glds_t.glds018, #投資公司權益貸方總額(功能幣)
       glds019 LIKE glds_t.glds019, #投資公司權益借方總額(報告幣)
       glds020 LIKE glds_t.glds020, #投資公司權益貸方總額(報告幣)
       gldsud001 LIKE glds_t.gldsud001, #自定義欄位(文字)001
       gldsud002 LIKE glds_t.gldsud002, #自定義欄位(文字)002
       gldsud003 LIKE glds_t.gldsud003, #自定義欄位(文字)003
       gldsud004 LIKE glds_t.gldsud004, #自定義欄位(文字)004
       gldsud005 LIKE glds_t.gldsud005, #自定義欄位(文字)005
       gldsud006 LIKE glds_t.gldsud006, #自定義欄位(文字)006
       gldsud007 LIKE glds_t.gldsud007, #自定義欄位(文字)007
       gldsud008 LIKE glds_t.gldsud008, #自定義欄位(文字)008
       gldsud009 LIKE glds_t.gldsud009, #自定義欄位(文字)009
       gldsud010 LIKE glds_t.gldsud010, #自定義欄位(文字)010
       gldsud011 LIKE glds_t.gldsud011, #自定義欄位(數字)011
       gldsud012 LIKE glds_t.gldsud012, #自定義欄位(數字)012
       gldsud013 LIKE glds_t.gldsud013, #自定義欄位(數字)013
       gldsud014 LIKE glds_t.gldsud014, #自定義欄位(數字)014
       gldsud015 LIKE glds_t.gldsud015, #自定義欄位(數字)015
       gldsud016 LIKE glds_t.gldsud016, #自定義欄位(數字)016
       gldsud017 LIKE glds_t.gldsud017, #自定義欄位(數字)017
       gldsud018 LIKE glds_t.gldsud018, #自定義欄位(數字)018
       gldsud019 LIKE glds_t.gldsud019, #自定義欄位(數字)019
       gldsud020 LIKE glds_t.gldsud020, #自定義欄位(數字)020
       gldsud021 LIKE glds_t.gldsud021, #自定義欄位(日期時間)021
       gldsud022 LIKE glds_t.gldsud022, #自定義欄位(日期時間)022
       gldsud023 LIKE glds_t.gldsud023, #自定義欄位(日期時間)023
       gldsud024 LIKE glds_t.gldsud024, #自定義欄位(日期時間)024
       gldsud025 LIKE glds_t.gldsud025, #自定義欄位(日期時間)025
       gldsud026 LIKE glds_t.gldsud026, #自定義欄位(日期時間)026
       gldsud027 LIKE glds_t.gldsud027, #自定義欄位(日期時間)027
       gldsud028 LIKE glds_t.gldsud028, #自定義欄位(日期時間)028
       gldsud029 LIKE glds_t.gldsud029, #自定義欄位(日期時間)029
       gldsud030 LIKE glds_t.gldsud030  #自定義欄位(日期時間)030
       END RECORD
#161128-00061#7----add----end-------------------


   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
#3-1 條件：合併帳別(gldrld)+ 公司編號(gldc002) +公司帳別(gldc003) + 年度(gldr002)+ 期別(gldr003) + 科目:屬於「股東權益類」相關科目
#    註.股東權益類科目=>glac011 = ('21','22','23','24')
#3-2 取值：依上述條件取得合併報表個體公司會計科目餘額檔(gldn_t) 之金額 (有分為記帳/功能/報告)
#    被投資公司(glds004):下層公司(gldc002)
#    帳別(glds005):下層公司帳別(gldc003)
#    所有者權益科目(glds006)：gldn007
#   
#    投資比率(glds013)：gldc005(以下層公司編號至agli510取得)
#    投資公司股權科目(glds014):agli160 設置科目-「本期損益(長期投資)」
#    以借方金額為例:
#    投資公司權益金額glds015(記帳幣) = 金額glds007(記帳幣) * 投資比率
#    投資公司權益金額glds017(功能幣) = 金額glds009(功能幣) * 投資比率
#    投資公司權益金額glds019(報告幣) = 金額glds011(報告幣) * 投資比率
   
   #取得合併帳套的會計科目參照表號
   CALL s_ld_sel_glaa(p_glfild,'glaa001|glaa004|glaa016|glaa020|glaa131')           #170814-00021#9 add glaa131
        RETURNING g_sub_success,l_glaa001,l_glaa004,l_glaa016,l_glaa020,l_glaa131   #170814-00021#9 add l_glaa131
   
   LET l_sql = "SELECT gldc002,gldc003,gldc004",    ##170324-00118#1#1 change gldc005 to gldc004
               "  FROM gldc_t ",
               " WHERE gldcent = ",g_enterprise,
               "   AND gldcld = '",p_glfild,"'",
               "   AND gldc001 = '",p_glfi001,"'",
               "   AND gldc005 = 'Y' ",#210305-00027#1---add
               "   AND gldc009 = 'N'"            #170325-00019#1 add lujh
   PREPARE s_aglt505_sel_gldc_p2 FROM l_sql
   DECLARE s_aglt505_sel_gldc_c2 CURSOR FOR s_aglt505_sel_gldc_p2
   
   #LET l_sql = "SELECT gldn007,gldn010,gldn011,gldn027,gldn028,",                     #170614-00006#1 mark
   #            "       gldn030,gldn031",                                              #170614-00006#1 mark
   LET l_sql = "SELECT gldn007,sum(gldn010),sum(gldn011),sum(gldn027),sum(gldn028),",  #170614-00006#1 add 
              #"       sum(gldn030),sum(gldn031)",                                     #170614-00006#1 add    #170817-00040#6 mark
               "       sum(gldn030),sum(gldn031),'N'",                                 #170817-00040#6 add            
               "  FROM gldn_t ",
               "  LEFT JOIN glac_t ON gldnent = glacent AND gldn007 = glac002 AND glac001 = '",l_glaa004,"'",
               " WHERE gldnent = ",g_enterprise,
               "   AND gldnld = '",p_glfild,"'",
               #"   AND gldn001 = '",p_glfi001,"'",  #上層公司編號   #170325-00019#1 mark lujh
               "   AND gldn005 = ",p_glfi002,       #合併年度
               "   AND gldn006 = ",p_glfi003,       #合併期別
               "   AND gldn040 = ?",                #下層公司
               "   AND gldn041 = ?",                #下層公司帳別
#               "   AND glac011 IN ('21','22','23','24')"          #191101-00022#1---mark  #投资收益取得方法做了修改，取消股本及公积类科目
               "   AND glac011 IN ('23','24')"          #191101-00022#1---add
              ," GROUP BY gldn001,gldn002,gldn003,gldn004,gldn007"  #170614-00006#1 add 
               #170817-00040#6---add---start---
              ," UNION  ",
               "SELECT gler003,SUM(gler005),SUM(gler006),SUM(gler008),SUM(gler009),SUM(gler011),SUM(gler012),'Y' ",
               "  FROM gler_t",
               " WHERE glerent = ",g_enterprise,
               "   AND gler013 = '",p_glfild,"'",
               "   AND glerld = ? AND gler002 = ?",
               "   AND gler001 = ",p_glfi002,        #合併年度 #190527-00008#1 add
               "   AND gler003 NOT IN (SELECT gldn007 FROM gldn_t",
               "                          WHERE gldnent = ",g_enterprise,
               "                            AND gldnld = '",p_glfild,"'",
               "                            AND gldn005 = ",p_glfi002," AND gldn006 = ",p_glfi003,
               "                            AND gldn040 = ? AND gldn041 = ?)",
               " GROUP BY gler001,gler003"
               #170817-00040#6---add---end---
   PREPARE s_aglt505_sel_gldn_p2 FROM l_sql
   DECLARE s_aglt505_sel_gldn_c2 CURSOR FOR s_aglt505_sel_gldn_p2

   #170817-00040#6---add---start---
   LET l_sql = "SELECT gler005,gler006,gler008,gler009,gler011,gler012", 
               "  FROM gler_t",
               " WHERE glerent = ",g_enterprise,
               "   AND gler001 = ",p_glfi002,
               "   AND gler013 = '",p_glfild,"'",
               "   AND glerld = ?",
               "   AND gler002 = ?",
               "   AND gler003 = ?"
   PREPARE s_aglt505_gler FROM l_sql            
   #170817-00040#6---add---end---
   FOREACH s_aglt505_sel_gldc_c2 INTO l_gldc002,l_gldc003,l_gldc004    #170324-00118#1 change gldc005 to gldc004
      IF SQLCA.sqlcode THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 's_aglt505_sel_gldc_c2'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      IF cl_null(l_gldc004) THEN LET l_gldc004 = 0 END IF          #170324-00118#1 change gldc005 to gldc004
      IF l_glaa131 = 'N' THEN      #170814-00021#9 add
         LET l_gldb002_d = ''      #170814-00021#9 add
         #170614-00006#1---add---start---
         #下層公司個體帳套
         SELECT gldb002 INTO l_gldb002_d
           FROM gldb_t
          WHERE gldbent = g_enterprise
            AND gldbld = l_gldc003 AND gldb001 = l_gldc002
         IF NOT cl_null(l_gldb002_d) THEN LET l_gldc003 = l_gldb002_d END IF         
      #170614-00006#1---add---end---    
      END IF      #170814-00021#9 add 
      LET l_sum_glds016 = 0          #170724-00063#5 add  
      LET l_sum_glds018 = 0          #170724-00063#5 add 
      LET l_sum_glds020 = 0          #170724-00063#5 add     
     #FOREACH s_aglt505_sel_gldn_c2 USING l_gldc002,l_gldc003       #170817-00040#6 mark
      FOREACH s_aglt505_sel_gldn_c2 USING l_gldc002,l_gldc003,l_gldc003,l_gldc002,l_gldc002,l_gldc003  #170817-00040#6 add   
                                     INTO l_gldn007,l_gldn010,l_gldn011,l_gldn027,l_gldn028,
                                          l_gldn030,l_gldn031
                                         ,l_flag                   #170817-00040#6 add
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 's_aglt505_sel_gldn_c2'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
         IF cl_null(l_gldn010) THEN LET l_gldn010 = 0 END IF
         IF cl_null(l_gldn011) THEN LET l_gldn011 = 0 END IF
         IF cl_null(l_gldn027) THEN LET l_gldn027 = 0 END IF
         IF cl_null(l_gldn028) THEN LET l_gldn028 = 0 END IF
         IF cl_null(l_gldn030) THEN LET l_gldn030 = 0 END IF
         IF cl_null(l_gldn031) THEN LET l_gldn031 = 0 END IF
         
         INITIALIZE l_glds.* TO NULL
         #170817-00040#6---add---start---
         IF l_flag = 'N' THEN
            LET l_gler005 = 0
            LET l_gler006 = 0
            LET l_gler008 = 0
            LET l_gler009 = 0            
            LET l_gler011 = 0           
            LET l_gler012 = 0
            EXECUTE s_aglt505_gler USING l_gldc003,l_gldc002,l_gldn007 
               INTO l_gler005,l_gler006,l_gler008,l_gler009,l_gler011,l_gler012
            IF cl_null(l_gler005) THEN LET l_gler005 = 0 END IF
            IF cl_null(l_gler006) THEN LET l_gler006 = 0 END IF
            IF cl_null(l_gler008) THEN LET l_gler008 = 0 END IF
            IF cl_null(l_gler009) THEN LET l_gler009 = 0 END IF
            IF cl_null(l_gler011) THEN LET l_gler011 = 0 END IF
            IF cl_null(l_gler012) THEN LET l_gler012 = 0 END IF
            LET l_gldn010 = l_gldn010 - l_gler005
            LET l_gldn011 = l_gldn011 - l_gler006
            LET l_gldn027 = l_gldn027 - l_gler008
            LET l_gldn028 = l_gldn028 - l_gler009
            LET l_gldn030 = l_gldn030 - l_gler011
            LET l_gldn031 = l_gldn031 - l_gler012
         END IF   
         #170817-00040#6---add---end---  
         
         LET l_glds.gldsent = g_enterprise  #企業編號
         LET l_glds.gldsld  = p_glfild      #合併帳套
         LET l_glds.glds001 = p_glfi001     #投資公司
         LET l_glds.glds002 = p_glfi002     #年度
         LET l_glds.glds003 = p_glfi003     #期別
         LET l_glds.glds004 = l_gldc002     #被投資公司
         LET l_glds.glds005 = l_gldc003     #帳別
         LET l_glds.glds006 = l_gldn007     #所有者權益科目
         LET l_glds.glds007 = l_gldn010     #借方金額(記帳幣)
         LET l_glds.glds008 = l_gldn011     #貸方金額(記帳幣)
         LET l_glds.glds009 = l_gldn027     #借方金額(功能幣)
         LET l_glds.glds010 = l_gldn028     #貸方金額(功能幣)
         LET l_glds.glds011 = l_gldn030     #借方金額(報告幣)
         LET l_glds.glds012 = l_gldn031     #貸方金額(報告幣)
         
         LET l_glds.glds013 = l_gldc004     #投資比例      #170324-00118#1 change gldc005 to gldc004

         SELECT DISTINCT glab005 INTO l_glds.glds014  #投資公司股權科目
           FROM glab_t
          WHERE glabent = g_enterprise
            AND glabld = p_glfild
            AND glab001 = '12'
            AND glab002 = '9929'
           #AND glab003 = '9929_10'     #170724-00063#5 mark
            AND glab003 = '9929_11'     #170724-00063#5 add
         
         LET l_glds.glds015 = l_glds.glds007 * l_glds.glds013 / 100  #投資公司權益借方總額(記帳幣)
         LET l_glds.glds016 = l_glds.glds008 * l_glds.glds013 / 100  #投資公司權益貸方總額(記帳幣)
         LET l_glds.glds017 = l_glds.glds009 * l_glds.glds013 / 100  #投資公司權益借方總額(功能幣)
         LET l_glds.glds018 = l_glds.glds010 * l_glds.glds013 / 100  #投資公司權益貸方總額(功能幣)
         LET l_glds.glds019 = l_glds.glds011 * l_glds.glds013 / 100  #投資公司權益借方總額(報告幣)
         LET l_glds.glds020 = l_glds.glds012 * l_glds.glds013 / 100  #投資公司權益貸方總額(報告幣)
         
         CALL s_curr_round_ld('1',p_glfild,l_glaa001,l_glds.glds015,2) RETURNING g_sub_success,g_errno,l_glds.glds015
         CALL s_curr_round_ld('1',p_glfild,l_glaa001,l_glds.glds016,2) RETURNING g_sub_success,g_errno,l_glds.glds016
         IF NOT cl_null(l_glaa016) THEN #180820-00022#1 add
            CALL s_curr_round_ld('1',p_glfild,l_glaa016,l_glds.glds017,2) RETURNING g_sub_success,g_errno,l_glds.glds017
            CALL s_curr_round_ld('1',p_glfild,l_glaa016,l_glds.glds018,2) RETURNING g_sub_success,g_errno,l_glds.glds018
         END IF #180820-00022#1 add
         IF NOT cl_null(l_glaa020) THEN #180820-00022#1 add
            CALL s_curr_round_ld('1',p_glfild,l_glaa020,l_glds.glds019,2) RETURNING g_sub_success,g_errno,l_glds.glds019
            CALL s_curr_round_ld('1',p_glfild,l_glaa020,l_glds.glds020,2) RETURNING g_sub_success,g_errno,l_glds.glds020
         END IF #180820-00022#1 add
         LET l_sum_glds016 = l_sum_glds016 + (l_glds.glds016 - l_glds.glds015)    #170724-00063#5 add
         LET l_sum_glds018 = l_sum_glds018 + (l_glds.glds018 - l_glds.glds017)    #170724-00063#5 add
         LET l_sum_glds020 = l_sum_glds020 + (l_glds.glds020 - l_glds.glds019)    #170724-00063#5 add
         #161128-00061#7----add----begin-------------------
         #INSERT INTO glds_t VALUES(l_glds.*)
         INSERT INTO glds_t (gldsent,gldsld,glds001,glds002,glds003,glds004,glds005,glds006,glds007,glds008,glds009,
                             glds010,glds011,glds012,glds013,glds014,glds015,glds016,glds017,glds018,glds019,glds020,
                             gldsud001,gldsud002,gldsud003,gldsud004,gldsud005,gldsud006,gldsud007,gldsud008,gldsud009,
                             gldsud010,gldsud011,gldsud012,gldsud013,gldsud014,gldsud015,gldsud016,gldsud017,gldsud018,
                             gldsud019,gldsud020,gldsud021,gldsud022,gldsud023,gldsud024,gldsud025,gldsud026,gldsud027,
                             gldsud028,gldsud029,gldsud030)
          VALUES(l_glds.gldsent,l_glds.gldsld,l_glds.glds001,l_glds.glds002,l_glds.glds003,l_glds.glds004,l_glds.glds005,l_glds.glds006,l_glds.glds007,l_glds.glds008,l_glds.glds009,
                 l_glds.glds010,l_glds.glds011,l_glds.glds012,l_glds.glds013,l_glds.glds014,l_glds.glds015,l_glds.glds016,l_glds.glds017,l_glds.glds018,l_glds.glds019,l_glds.glds020,
                 l_glds.gldsud001,l_glds.gldsud002,l_glds.gldsud003,l_glds.gldsud004,l_glds.gldsud005,l_glds.gldsud006,l_glds.gldsud007,l_glds.gldsud008,l_glds.gldsud009,
                 l_glds.gldsud010,l_glds.gldsud011,l_glds.gldsud012,l_glds.gldsud013,l_glds.gldsud014,l_glds.gldsud015,l_glds.gldsud016,l_glds.gldsud017,l_glds.gldsud018,
                 l_glds.gldsud019,l_glds.gldsud020,l_glds.gldsud021,l_glds.gldsud022,l_glds.gldsud023,l_glds.gldsud024,l_glds.gldsud025,l_glds.gldsud026,l_glds.gldsud027,
                 l_glds.gldsud028,l_glds.gldsud029,l_glds.gldsud030)
         #161128-00061#7----add----end-------------------
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'ins glds_t'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      
      END FOREACH
      #170724-00063#5---add---start---
      #第二單身權益金額貸-借後的金額更新到第一單身
      #金額大於0更新第一單身借方
      #金額小於0更新第一單身貸方
      IF l_sum_glds016 > 0 THEN
         UPDATE gldr_t
            SET gldr008 = l_sum_glds016
          WHERE gldrent = g_enterprise
            AND gldrld = p_glfild
            AND gldr001 = p_glfi001
            AND gldr002 = p_glfi002
            AND gldr003 = p_glfi003             
            AND gldr004 = l_gldc002
            AND gldr005 = l_gldc003             
      ELSE
         LET l_sum_glds016 = l_sum_glds016 * -1
         UPDATE gldr_t
            SET gldr009 = l_sum_glds016
          WHERE gldrent = g_enterprise
            AND gldrld = p_glfild
            AND gldr001 = p_glfi001
            AND gldr002 = p_glfi002
            AND gldr003 = p_glfi003             
            AND gldr004 = l_gldc002
            AND gldr005 = l_gldc003    
      END IF
      IF l_sum_glds018 > 0 THEN
         UPDATE gldr_t
            SET gldr010 = l_sum_glds018
          WHERE gldrent = g_enterprise
            AND gldrld = p_glfild
            AND gldr001 = p_glfi001
            AND gldr002 = p_glfi002
            AND gldr003 = p_glfi003             
            AND gldr004 = l_gldc002
            AND gldr005 = l_gldc003             
      ELSE
         LET l_sum_glds018 = l_sum_glds018 * -1
         UPDATE gldr_t
            SET gldr011 = l_sum_glds018
          WHERE gldrent = g_enterprise
            AND gldrld = p_glfild
            AND gldr001 = p_glfi001
            AND gldr002 = p_glfi002
            AND gldr003 = p_glfi003             
            AND gldr004 = l_gldc002
            AND gldr005 = l_gldc003    
      END IF
      IF l_sum_glds020 > 0 THEN
         UPDATE gldr_t
            SET gldr012 = l_sum_glds020
          WHERE gldrent = g_enterprise
            AND gldrld = p_glfild
            AND gldr001 = p_glfi001
            AND gldr002 = p_glfi002
            AND gldr003 = p_glfi003             
            AND gldr004 = l_gldc002
            AND gldr005 = l_gldc003             
      ELSE
         LET l_sum_glds020 = l_sum_glds020 * -1
         UPDATE gldr_t
            SET gldr013 = l_sum_glds020
          WHERE gldrent = g_enterprise
            AND gldrld = p_glfild
            AND gldr001 = p_glfi001
            AND gldr002 = p_glfi002
            AND gldr003 = p_glfi003             
            AND gldr004 = l_gldc002
            AND gldr005 = l_gldc003    
      END IF      
      #170724-00063#5---add---end---
   END FOREACH
   
   RETURN r_success
END FUNCTION

 
{</section>}
 
