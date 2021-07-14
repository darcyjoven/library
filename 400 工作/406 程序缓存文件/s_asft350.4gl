#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_asft350.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0021(1900-01-01 00:00:00), PR版次:0021(2021-05-10 15:59:54)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000304
#+ Filename...: s_asft350
#+ Description: 耗料盤存倒扣分攤作業應用元件集合
#+ Creator....: 01258(2014-04-28 14:24:01)
#+ Modifier...: 00000 -SD/PR- 00272
 
{</section>}
 
{<section id="s_asft350.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#160122-00016#1.....2016/05/04 By ming       確認時回寫asft314/asft324的來源類型與來源單號 
#161005-00025#1.....2016/10/05 By ywtsai     修正取得耗料盤存明細資料時，若無分攤資料不處理
#161109-00085#58....2016/11/18 By lienjunqi  整批調整系統星號寫法
#161202-00012#1.....2016/12/22 By shiun      修正"传入参数为空或传入值不正确!"錯誤，給予sfdd014值
#170425-00017#1.....2017/04/25 By xujing     对审核段做效能优化,单据审核和产生发退料单拆为一个事务,产生发退料单单身拆为一个事务
#180116-00050#1.....2018/01/18 By 06978      修正確認時產生領料單後若設定自動扣帳，傳入扣帳日期為空造成系統認定99/12/31的問題
#180408-00009#1.....2018/04/08 By 06021      asft350取消审核将产生的发料单、退料单过账还原、取消确认并作废时增加判断状态;
#180817-00009#1.....2018/08/17 By 10046      倒扣領料單確認前及過帳前增加檢查
#181128-00027#1.....2018/11/29 By 00593      1.判斷有發退料單號的分攤明細才需要在取消確認時將產生的發退料單過帳還原、取消確認、作廢
#                                            2.將產生的發退料單過帳還原成功後要接著做取消確認
#181106-00010#1.....2019/01/19 By 01366      確認時增加檢核工單狀態需為F:已發出
#190304-00007#1     2020/01/16 By 10042      批序號明細同步產生至發退料單的批序號檔
#190314-00037#1     2020/03/05 By 10983      发料单做aooi200库存正向列表的检查
#200722-00013#1     2020/07/24 By 02295      asft350取消审核时,对已经产生倒扣料发料单取消过账时,调用倒扣料取消过账检查段
#201208-00036#1     2020/12/14 By 08734      asft350单据取消审核，小于等于关账日期都要检核
#210329-00022#1     2021/05/05 By 00272      效能優化:
#                                            以下三個FUNCTION:
#                                            (1)FUNCTION s_asft350_confirm_gen_sfde_sfdf()
#                                            (1-1)FOREACH 內的寫法往外搬
#                                            (1-2)INSERT INTO sfde_t/INSERT INTO sfdf_t改寫
#                                            
#                                            (2)FUNCTION s_asft350_confirm_gen_detail()
#                                            (2-1)FOREACH 內的寫法往外搬
#                                            (2-2)INSERT INTO sfdc_t/INSERT INTO sfdd_t 改寫
#                                            (2-3)#出庫單據考慮在揀量的s_asft310_confirm_chk()才需要重跑
#                                            
#                                            (3)FUNCTION s_asft350_confirm_split()
#                                            (3-1)asf-00931的檢核,改為一次性的寫法
#                                            (4)一併調整異常:當asft350 單身[盤點資料]page 的參考單位為空時,asft350確認時,產生的asft314 料號匯總page 沒有產生sfdf_t 的資料

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
 
{<section id="s_asft350.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
#161109-00085#58-s
#DEFINE g_sfma                RECORD LIKE sfma_t.*
DEFINE g_sfma RECORD  #耗料盤存倒扣分攤單頭檔
       sfmadocno LIKE sfma_t.sfmadocno, #盤點單號
       sfmadocdt LIKE sfma_t.sfmadocdt, #盤點日期
       sfma001 LIKE sfma_t.sfma001, #分攤方式
       sfma002 LIKE sfma_t.sfma002, #起始日期
       sfma003 LIKE sfma_t.sfma003, #截止日期
       sfma004 LIKE sfma_t.sfma004, #庫位
       sfma005 LIKE sfma_t.sfma005, #儲位
       sfmastus LIKE sfma_t.sfmastus    #狀態碼
END RECORD
#161109-00085#58-e
#end add-point
 
{</section>}
 
{<section id="s_asft350.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="s_asft350.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_asft350.other_function" readonly="Y" type="s" >}
################################################################################
# Descriptions...: 耗料盤存倒扣分攤確認元件
# Memo...........:
# Usage..........: CALL s_asft350_confirm(p_sfmadocno)
#                  RETURNING r_success
# Input parameter: 1.p_sfmadocno          LIKE sfma_t.sfmadocno
# Return code....: 1.r_success            LIKE type_t.num5
# Date & Author..: 2014/5/5 By wuxj
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft350_confirm(p_sfmadocno)
DEFINE p_sfmadocno          LIKE sfma_t.sfmadocno
DEFINE r_success            LIKE type_t.num5
DEFINE l_close_dd           LIKE sfma_t.sfmadocdt
DEFINE l_time               DATETIME YEAR TO SECOND
DEFINE l_sql                STRING 
#161109-00085#58-s
#DEFINE l_sfmb              RECORD LIKE sfmb_t.*
DEFINE l_sfmb RECORD  #耗料盤存檔點單身檔
       sfmbseq LIKE sfmb_t.sfmbseq, #項次
       sfmb008 LIKE sfmb_t.sfmb008, #帳面數量
       sfmb009 LIKE sfmb_t.sfmb009, #盤點數量
       sfmb011 LIKE sfmb_t.sfmb011, #參考帳面數量
       sfmb012 LIKE sfmb_t.sfmb012  #參考盤點數量
END RECORD
#161109-00085#58-e
DEFINE l_sfmc006            LIKE sfmc_t.sfmc006
DEFINE l_sfmc007            LIKE sfmc_t.sfmc007
DEFINE l_flag               LIKE type_t.chr1

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      RETURN r_success
   END IF
   
   #检查：盘点单号不可为空
   IF cl_null(p_sfmadocno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00534'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #161109-00085#58-s
   #SELECT * INTO g_sfma.* FROM sfma_t WHERE sfmaent=g_enterprise AND sfmasite=g_site AND sfmadocno=p_sfmadocno
   SELECT sfmadocno,sfmadocdt,sfma001,sfma002,sfma003,sfma004,sfma005,sfmastus
     INTO g_sfma.sfmadocno,g_sfma.sfmadocdt,g_sfma.sfma001,g_sfma.sfma002,g_sfma.sfma003,
          g_sfma.sfma004,g_sfma.sfma005,g_sfma.sfmastus
     FROM sfma_t
    WHERE sfmaent=g_enterprise AND sfmasite=g_site AND sfmadocno=p_sfmadocno
   #161109-00085#58-e
   #状态需为‘N’才可以确认
   IF g_sfma.sfmastus != 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00535'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #盘点日期不可小于关账日期
   LET l_close_dd = cl_get_para(g_enterprise,g_site,'S-MFG-0031')
   #IF g_sfma.sfmadocdt < l_close_dd OR g_sfma.sfma002 < l_close_dd OR g_sfma.sfma003 < l_close_dd THEN #201208-00036#1 mark
   IF g_sfma.sfmadocdt <= l_close_dd OR g_sfma.sfma002 <= l_close_dd OR g_sfma.sfma003 <= l_close_dd THEN #201208-00036#1 add
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00008'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #有盤點數量且差異數量不等於0的，分攤數需全部等於差異數
   #161109-00085#58-s
   #LET l_sql = "SELECT * FROM sfmb_t WHERE sfmbent=",g_enterprise," AND sfmbsite='",g_site,"'",
   LET l_sql = "SELECT sfmbseq,sfmb008,sfmb009,sfmb011,sfmb012 ",
               "  FROM sfmb_t ",
               " WHERE sfmbent=",g_enterprise,
               "   AND sfmbsite='",g_site,"'",
   #161109-00085#58-e
               "   AND sfmbdocno='",g_sfma.sfmadocno,"' AND sfmb008 IS NOT NULL AND sfmb009 IS NOT NULL AND sfmb008!=sfmb009"
   PREPARE s_asft350_confirm_pre FROM l_sql
   DECLARE s_asft350_confirm_cs CURSOR FOR s_asft350_confirm_pre
   LET l_flag = 'N'
   #161109-00085#58-s
   #FOREACH s_asft350_confirm_cs INTO l_sfmb.*
   FOREACH s_asft350_confirm_cs 
      INTO l_sfmb.sfmbseq,l_sfmb.sfmb008,l_sfmb.sfmb009,l_sfmb.sfmb011,l_sfmb.sfmb012
   #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF   
      LET l_flag = 'Y'
      SELECT SUM(sfmc006) INTO l_sfmc006 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site
         AND sfmcdocno=g_sfma.sfmadocno AND sfmcseq=l_sfmb.sfmbseq
      IF l_sfmb.sfmb008 - l_sfmb.sfmb009 != l_sfmc006 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00496'
         LET g_errparam.extend = l_sfmb.sfmbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      IF NOT cl_null(l_sfmb.sfmb011) AND NOT cl_null(l_sfmb.sfmb012) THEN
         SELECT SUM(sfmc007) INTO l_sfmc007 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site
            AND sfmcdocno=g_sfma.sfmadocno AND sfmcseq=l_sfmb.sfmbseq
         IF l_sfmb.sfmb011 - l_sfmb.sfmb012 != l_sfmc007 THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00496'
         LET g_errparam.extend = l_sfmb.sfmbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()

            RETURN r_success
         END IF
      END IF
   END FOREACH
   
   IF l_flag = 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00566'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #更新状态码为Y
   LET l_time = cl_get_current()
   UPDATE sfma_t SET sfmastus = 'Y',sfmacnfid = g_user,sfmacnfdt = l_time
    WHERE sfmaent = g_enterprise AND sfmasite = g_site AND sfmadocno = g_sfma.sfmadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00034'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #产生领料单或退料单及相关资料，并审核过账，最后更行sfmc008
   IF NOT s_asft350_confirm_gen() THEN
      RETURN r_success
   END IF

   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 产生发料单、退料单
# Memo...........:
# Usage..........: CALL s_asft350_confirm_gen()
#                  RETURNING r_success
# Return code....: 1.r_success               LIKE type_t.num5
# Date & Author..: 2014/5/5 By wuxja
# Modify.........: 160122-00016#1.....2016/05/04 By ming 確認時回寫asft314/asft324的來源類型與來源單號 
################################################################################
PUBLIC FUNCTION s_asft350_confirm_gen()
DEFINE r_success           LIKE type_t.num5
#161109-00085#58-s
#DEFINE l_sfda              RECORD LIKE sfda_t.*
DEFINE l_sfda RECORD  #發退料單頭檔
       sfdaent LIKE sfda_t.sfdaent, #企業編號
       sfdasite LIKE sfda_t.sfdasite, #營運據點
       sfdadocno LIKE sfda_t.sfdadocno, #發退料單號
       sfdadocdt LIKE sfda_t.sfdadocdt, #單據日期
       sfda001 LIKE sfda_t.sfda001, #過帳日期
       sfda002 LIKE sfda_t.sfda002, #發退料類別
       sfda003 LIKE sfda_t.sfda003, #生產部門
       sfda004 LIKE sfda_t.sfda004, #申請人
       sfda005 LIKE sfda_t.sfda005, #PBI編號
       sfda006 LIKE sfda_t.sfda006, #生產料號
       sfda007 LIKE sfda_t.sfda007, #BOM特性
       sfda008 LIKE sfda_t.sfda008, #產品特徵
       sfda009 LIKE sfda_t.sfda009, #生產控制組
       sfda010 LIKE sfda_t.sfda010, #作業編號
       sfda011 LIKE sfda_t.sfda011, #作業序
       sfda012 LIKE sfda_t.sfda012, #庫位
       sfda013 LIKE sfda_t.sfda013, #套數
       sfda014 LIKE sfda_t.sfda014, #來源單號
       sfda015 LIKE sfda_t.sfda015, #來源類型
       sfdaownid LIKE sfda_t.sfdaownid, #資料所有者
       sfdaowndp LIKE sfda_t.sfdaowndp, #資料所屬部門
       sfdacrtid LIKE sfda_t.sfdacrtid, #資料建立者
       sfdacrtdp LIKE sfda_t.sfdacrtdp, #資料建立部門
       sfdacrtdt LIKE sfda_t.sfdacrtdt, #資料創建日
       sfdamodid LIKE sfda_t.sfdamodid, #資料修改者
       sfdamoddt LIKE sfda_t.sfdamoddt, #最近修改日
       sfdacnfid LIKE sfda_t.sfdacnfid, #資料確認者
       sfdacnfdt LIKE sfda_t.sfdacnfdt, #資料確認日
       sfdapstid LIKE sfda_t.sfdapstid, #資料過帳者
       sfdapstdt LIKE sfda_t.sfdapstdt, #資料過帳日
       sfdastus LIKE sfda_t.sfdastus, #狀態碼
       sfdaud001 LIKE sfda_t.sfdaud001, #自定義欄位(文字)001
       sfdaud002 LIKE sfda_t.sfdaud002, #自定義欄位(文字)002
       sfdaud003 LIKE sfda_t.sfdaud003, #自定義欄位(文字)003
       sfdaud004 LIKE sfda_t.sfdaud004, #自定義欄位(文字)004
       sfdaud005 LIKE sfda_t.sfdaud005, #自定義欄位(文字)005
       sfdaud006 LIKE sfda_t.sfdaud006, #自定義欄位(文字)006
       sfdaud007 LIKE sfda_t.sfdaud007, #自定義欄位(文字)007
       sfdaud008 LIKE sfda_t.sfdaud008, #自定義欄位(文字)008
       sfdaud009 LIKE sfda_t.sfdaud009, #自定義欄位(文字)009
       sfdaud010 LIKE sfda_t.sfdaud010, #自定義欄位(文字)010
       sfdaud011 LIKE sfda_t.sfdaud011, #自定義欄位(數字)011
       sfdaud012 LIKE sfda_t.sfdaud012, #自定義欄位(數字)012
       sfdaud013 LIKE sfda_t.sfdaud013, #自定義欄位(數字)013
       sfdaud014 LIKE sfda_t.sfdaud014, #自定義欄位(數字)014
       sfdaud015 LIKE sfda_t.sfdaud015, #自定義欄位(數字)015
       sfdaud016 LIKE sfda_t.sfdaud016, #自定義欄位(數字)016
       sfdaud017 LIKE sfda_t.sfdaud017, #自定義欄位(數字)017
       sfdaud018 LIKE sfda_t.sfdaud018, #自定義欄位(數字)018
       sfdaud019 LIKE sfda_t.sfdaud019, #自定義欄位(數字)019
       sfdaud020 LIKE sfda_t.sfdaud020, #自定義欄位(數字)020
       sfdaud021 LIKE sfda_t.sfdaud021, #自定義欄位(日期時間)021
       sfdaud022 LIKE sfda_t.sfdaud022, #自定義欄位(日期時間)022
       sfdaud023 LIKE sfda_t.sfdaud023, #自定義欄位(日期時間)023
       sfdaud024 LIKE sfda_t.sfdaud024, #自定義欄位(日期時間)024
       sfdaud025 LIKE sfda_t.sfdaud025, #自定義欄位(日期時間)025
       sfdaud026 LIKE sfda_t.sfdaud026, #自定義欄位(日期時間)026
       sfdaud027 LIKE sfda_t.sfdaud027, #自定義欄位(日期時間)027
       sfdaud028 LIKE sfda_t.sfdaud028, #自定義欄位(日期時間)028
       sfdaud029 LIKE sfda_t.sfdaud029, #自定義欄位(日期時間)029
       sfdaud030 LIKE sfda_t.sfdaud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfdc              RECORD LIKE sfdc_t.*
DEFINE l_sfdc RECORD  #發退料需求檔
       sfdcent LIKE sfdc_t.sfdcent, #企業編號
       sfdcsite LIKE sfdc_t.sfdcsite, #營運據點
       sfdcdocno LIKE sfdc_t.sfdcdocno, #發退料單號
       sfdcseq LIKE sfdc_t.sfdcseq, #項次
       sfdc001 LIKE sfdc_t.sfdc001, #工單單號
       sfdc002 LIKE sfdc_t.sfdc002, #工單項次
       sfdc003 LIKE sfdc_t.sfdc003, #工單項序
       sfdc004 LIKE sfdc_t.sfdc004, #需求料號
       sfdc005 LIKE sfdc_t.sfdc005, #產品特徵
       sfdc006 LIKE sfdc_t.sfdc006, #單位
       sfdc007 LIKE sfdc_t.sfdc007, #申請數量
       sfdc008 LIKE sfdc_t.sfdc008, #實際數量
       sfdc009 LIKE sfdc_t.sfdc009, #參考單位
       sfdc010 LIKE sfdc_t.sfdc010, #參考單位需求數量
       sfdc011 LIKE sfdc_t.sfdc011, #參考單位實際數量
       sfdc012 LIKE sfdc_t.sfdc012, #指定庫位
       sfdc013 LIKE sfdc_t.sfdc013, #指定儲位
       sfdc014 LIKE sfdc_t.sfdc014, #指定批號
       sfdc015 LIKE sfdc_t.sfdc015, #理由碼
       sfdc016 LIKE sfdc_t.sfdc016, #庫存管理特徴
       sfdc017 LIKE sfdc_t.sfdc017, #正負
       sfdcud001 LIKE sfdc_t.sfdcud001, #自定義欄位(文字)001
       sfdcud002 LIKE sfdc_t.sfdcud002, #自定義欄位(文字)002
       sfdcud003 LIKE sfdc_t.sfdcud003, #自定義欄位(文字)003
       sfdcud004 LIKE sfdc_t.sfdcud004, #自定義欄位(文字)004
       sfdcud005 LIKE sfdc_t.sfdcud005, #自定義欄位(文字)005
       sfdcud006 LIKE sfdc_t.sfdcud006, #自定義欄位(文字)006
       sfdcud007 LIKE sfdc_t.sfdcud007, #自定義欄位(文字)007
       sfdcud008 LIKE sfdc_t.sfdcud008, #自定義欄位(文字)008
       sfdcud009 LIKE sfdc_t.sfdcud009, #自定義欄位(文字)009
       sfdcud010 LIKE sfdc_t.sfdcud010, #自定義欄位(文字)010
       sfdcud011 LIKE sfdc_t.sfdcud011, #自定義欄位(數字)011
       sfdcud012 LIKE sfdc_t.sfdcud012, #自定義欄位(數字)012
       sfdcud013 LIKE sfdc_t.sfdcud013, #自定義欄位(數字)013
       sfdcud014 LIKE sfdc_t.sfdcud014, #自定義欄位(數字)014
       sfdcud015 LIKE sfdc_t.sfdcud015, #自定義欄位(數字)015
       sfdcud016 LIKE sfdc_t.sfdcud016, #自定義欄位(數字)016
       sfdcud017 LIKE sfdc_t.sfdcud017, #自定義欄位(數字)017
       sfdcud018 LIKE sfdc_t.sfdcud018, #自定義欄位(數字)018
       sfdcud019 LIKE sfdc_t.sfdcud019, #自定義欄位(數字)019
       sfdcud020 LIKE sfdc_t.sfdcud020, #自定義欄位(數字)020
       sfdcud021 LIKE sfdc_t.sfdcud021, #自定義欄位(日期時間)021
       sfdcud022 LIKE sfdc_t.sfdcud022, #自定義欄位(日期時間)022
       sfdcud023 LIKE sfdc_t.sfdcud023, #自定義欄位(日期時間)023
       sfdcud024 LIKE sfdc_t.sfdcud024, #自定義欄位(日期時間)024
       sfdcud025 LIKE sfdc_t.sfdcud025, #自定義欄位(日期時間)025
       sfdcud026 LIKE sfdc_t.sfdcud026, #自定義欄位(日期時間)026
       sfdcud027 LIKE sfdc_t.sfdcud027, #自定義欄位(日期時間)027
       sfdcud028 LIKE sfdc_t.sfdcud028, #自定義欄位(日期時間)028
       sfdcud029 LIKE sfdc_t.sfdcud029, #自定義欄位(日期時間)029
       sfdcud030 LIKE sfdc_t.sfdcud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfdd              RECORD LIKE sfdd_t.*
DEFINE l_sfdd RECORD  #發退料明細檔
       sfddent LIKE sfdd_t.sfddent, #企業編號
       sfddsite LIKE sfdd_t.sfddsite, #營運據點
       sfdddocno LIKE sfdd_t.sfdddocno, #發退料單號
       sfddseq LIKE sfdd_t.sfddseq, #項次
       sfddseq1 LIKE sfdd_t.sfddseq1, #項序
       sfdd001 LIKE sfdd_t.sfdd001, #發退料料號
       sfdd002 LIKE sfdd_t.sfdd002, #替代率
       sfdd003 LIKE sfdd_t.sfdd003, #庫位
       sfdd004 LIKE sfdd_t.sfdd004, #儲位
       sfdd005 LIKE sfdd_t.sfdd005, #批號
       sfdd006 LIKE sfdd_t.sfdd006, #單位
       sfdd007 LIKE sfdd_t.sfdd007, #數量
       sfdd008 LIKE sfdd_t.sfdd008, #參考單位
       sfdd009 LIKE sfdd_t.sfdd009, #參考單位數量
       sfdd010 LIKE sfdd_t.sfdd010, #庫存管理特徵
       sfdd011 LIKE sfdd_t.sfdd011, #包裝容器
       sfdd012 LIKE sfdd_t.sfdd012, #正負
       sfdd013 LIKE sfdd_t.sfdd013, #產品特徵
       sfddud001 LIKE sfdd_t.sfddud001, #自定義欄位(文字)001
       sfddud002 LIKE sfdd_t.sfddud002, #自定義欄位(文字)002
       sfddud003 LIKE sfdd_t.sfddud003, #自定義欄位(文字)003
       sfddud004 LIKE sfdd_t.sfddud004, #自定義欄位(文字)004
       sfddud005 LIKE sfdd_t.sfddud005, #自定義欄位(文字)005
       sfddud006 LIKE sfdd_t.sfddud006, #自定義欄位(文字)006
       sfddud007 LIKE sfdd_t.sfddud007, #自定義欄位(文字)007
       sfddud008 LIKE sfdd_t.sfddud008, #自定義欄位(文字)008
       sfddud009 LIKE sfdd_t.sfddud009, #自定義欄位(文字)009
       sfddud010 LIKE sfdd_t.sfddud010, #自定義欄位(文字)010
       sfddud011 LIKE sfdd_t.sfddud011, #自定義欄位(數字)011
       sfddud012 LIKE sfdd_t.sfddud012, #自定義欄位(數字)012
       sfddud013 LIKE sfdd_t.sfddud013, #自定義欄位(數字)013
       sfddud014 LIKE sfdd_t.sfddud014, #自定義欄位(數字)014
       sfddud015 LIKE sfdd_t.sfddud015, #自定義欄位(數字)015
       sfddud016 LIKE sfdd_t.sfddud016, #自定義欄位(數字)016
       sfddud017 LIKE sfdd_t.sfddud017, #自定義欄位(數字)017
       sfddud018 LIKE sfdd_t.sfddud018, #自定義欄位(數字)018
       sfddud019 LIKE sfdd_t.sfddud019, #自定義欄位(數字)019
       sfddud020 LIKE sfdd_t.sfddud020, #自定義欄位(數字)020
       sfddud021 LIKE sfdd_t.sfddud021, #自定義欄位(日期時間)021
       sfddud022 LIKE sfdd_t.sfddud022, #自定義欄位(日期時間)022
       sfddud023 LIKE sfdd_t.sfddud023, #自定義欄位(日期時間)023
       sfddud024 LIKE sfdd_t.sfddud024, #自定義欄位(日期時間)024
       sfddud025 LIKE sfdd_t.sfddud025, #自定義欄位(日期時間)025
       sfddud026 LIKE sfdd_t.sfddud026, #自定義欄位(日期時間)026
       sfddud027 LIKE sfdd_t.sfddud027, #自定義欄位(日期時間)027
       sfddud028 LIKE sfdd_t.sfddud028, #自定義欄位(日期時間)028
       sfddud029 LIKE sfdd_t.sfddud029, #自定義欄位(日期時間)029
       sfddud030 LIKE sfdd_t.sfddud030, #自定義欄位(日期時間)030
       sfdd014 LIKE sfdd_t.sfdd014, #備置量
       sfdd015 LIKE sfdd_t.sfdd015  #在揀量
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfmb              RECORD LIKE sfmb_t.*
DEFINE l_sfmb RECORD  #耗料盤存檔點單身檔
       sfmb001 LIKE sfmb_t.sfmb001, #料件編號
       sfmb002 LIKE sfmb_t.sfmb002, #產品特徵
       sfmb003 LIKE sfmb_t.sfmb003, #庫位
       sfmb004 LIKE sfmb_t.sfmb004, #儲位
       sfmb005 LIKE sfmb_t.sfmb005, #批號
       sfmb006 LIKE sfmb_t.sfmb006, #庫存特徵
       sfmb007 LIKE sfmb_t.sfmb007, #單位
       sfmb010 LIKE sfmb_t.sfmb010  #參考單位
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfmc              RECORD LIKE sfmc_t.*
DEFINE l_sfmc RECORD  #耗料盤存分攤單身檔
       sfmcseq LIKE sfmc_t.sfmcseq, #項次
       sfmc001 LIKE sfmc_t.sfmc001, #工單單號
       sfmc003 LIKE sfmc_t.sfmc003, #工單項次
       sfmc004 LIKE sfmc_t.sfmc004, #工單項序
       sfmc006 LIKE sfmc_t.sfmc006, #分攤數量
       sfmc007 LIKE sfmc_t.sfmc007  #分攤參考數量
END RECORD
#161109-00085#58-e
DEFINE l_n1                LIKE type_t.num5
DEFINE l_n2                LIKE type_t.num5
DEFINE l_sql               STRING
DEFINE l_success           LIKE type_t.num5
DEFINE l_slip              LIKE ooba_t.ooba002
DEFINE l_sfdadocno_1       LIKE sfda_t.sfdadocno
DEFINE l_sfdadocno_2       LIKE sfda_t.sfdadocno
DEFINE l_sfdacrtdt         DATETIME YEAR TO SECOND  #资料建立日期
DEFINE l_qty               LIKE sfdd_t.sfdd014   #161202-00012#1-add
DEFINE l_flag              LIKE type_t.num5      #190314-00037#1---add

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE

   #161109-00085#58-s
   #LET l_sql = "SELECT * FROM sfmc_t WHERE sfmcent=",g_enterprise," AND sfmcsite='",g_site,"'",
   LET l_sql = "SELECT sfmcseq,sfmc001,sfmc003,sfmc004,sfmc006,sfmc007",
               "  FROM sfmc_t",
               " WHERE sfmcent=",g_enterprise," AND sfmcsite='",g_site,"'",
   #161109-00085#58-e
               "   AND sfmcdocno='",g_sfma.sfmadocno,"'"
   PREPARE s_asft350_confirm_gen_pre FROM l_sql
   DECLARE s_asft350_confirm_gen_cs CURSOR FOR s_asft350_confirm_gen_pre
   
   CALL s_aooi200_get_slip(g_sfma.sfmadocno) RETURNING l_success,l_slip
   IF NOT l_success THEN
      RETURN r_success
   END IF
     
   LET l_sfda.sfdaent = g_enterprise
   LET l_sfda.sfdasite = g_site
   LET l_sfda.sfdadocdt = g_sfma.sfmadocdt
   LET l_sfda.sfda001 = g_sfma.sfmadocdt
   LET l_sfda.sfda003 = g_dept
   LET l_sfda.sfda004 = g_user
   LET l_sfda.sfda012 = g_sfma.sfma004
   LET l_sfda.sfdaownid = g_user
   LET l_sfda.sfdaowndp = g_dept
   LET l_sfda.sfdacrtid = g_user
   LET l_sfda.sfdacrtdp = g_dept
   LET l_sfdacrtdt = cl_get_current()
   LET l_sfda.sfdamodid = ""
   LET l_sfda.sfdamoddt = ""
   LET l_sfda.sfdastus = "N" 
   
   #160122-00016#1 20160504 add by ming -----(S) 
   LET l_sfda.sfda014 = g_sfma.sfmadocno
   LET l_sfda.sfda015 = '03'               #03.盤點倒扣分攤作業 
   #160122-00016#1 20160504 add by ming -----(E) 
   
   #依盤點單別設定的參數"領料單單別"自動編碼
   SELECT COUNT(1) INTO l_n1 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=g_sfma.sfmadocno AND sfmc006>0
   SELECT COUNT(1) INTO l_n2 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=g_sfma.sfmadocno AND sfmc006<0 
   IF l_n1 > 0 THEN
      LET l_sfdadocno_1 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0063')
      IF cl_null(l_sfdadocno_1) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00551'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      IF NOT s_aooi200_chk_slip(g_site,'',l_sfdadocno_1,'asft314') THEN
         RETURN r_success
      END IF
      CALL s_aooi200_gen_docno(g_site,l_sfdadocno_1,l_sfda.sfdadocdt,'asft314')
           RETURNING l_success,l_sfdadocno_1
      IF NOT l_success THEN
         RETURN r_success
      END IF
      LET l_sfda.sfdadocno = l_sfdadocno_1
      LET l_sfda.sfda002 = '14'
      #190314-00037#1---add---s
      #檢核輸入的庫位是否在單據別限制範圍內，若不在限制內則不允許使用此庫位
      CALL s_control_chk_doc('6',l_sfda.sfdadocno,l_sfda.sfda012,'','','','')
           RETURNING l_success,l_flag
      IF NOT l_success OR NOT l_flag THEN
         #控制组检查错误,请检查单别设定的相关内容
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00122'
         LET g_errparam.extend = l_sfda.sfda012
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      #190314-00037#1---add---e
      #161109-00085#58-s
      #INSERT INTO sfda_t VALUES l_sfda.*
      INSERT INTO sfda_t(sfdaent,sfdasite,sfdadocno,sfdadocdt,sfda001,sfda002,sfda003,sfda004,sfda005,sfda006,
                         sfda007,sfda008,sfda009,sfda010,sfda011,sfda012,sfda013,sfda014,sfda015,sfdaownid,
                         sfdaowndp,sfdacrtid,sfdacrtdp,sfdacrtdt,sfdamodid,sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid,sfdapstdt,
                         sfdastus,sfdaud001,sfdaud002,sfdaud003,sfdaud004,sfdaud005,sfdaud006,sfdaud007,sfdaud008,sfdaud009,
                         sfdaud010,sfdaud011,sfdaud012,sfdaud013,sfdaud014,sfdaud015,sfdaud016,sfdaud017,sfdaud018,sfdaud019,
                         sfdaud020,sfdaud021,sfdaud022,sfdaud023,sfdaud024,sfdaud025,sfdaud026,sfdaud027,sfdaud028,sfdaud029,
                         sfdaud030) 
         VALUES (l_sfda.sfdaent,l_sfda.sfdasite,l_sfda.sfdadocno,l_sfda.sfdadocdt,l_sfda.sfda001,
                 l_sfda.sfda002,l_sfda.sfda003,l_sfda.sfda004,l_sfda.sfda005,l_sfda.sfda006,
                 l_sfda.sfda007,l_sfda.sfda008,l_sfda.sfda009,l_sfda.sfda010,l_sfda.sfda011,
                 l_sfda.sfda012,l_sfda.sfda013,l_sfda.sfda014,l_sfda.sfda015,l_sfda.sfdaownid,
                 l_sfda.sfdaowndp,l_sfda.sfdacrtid,l_sfda.sfdacrtdp,l_sfda.sfdacrtdt,l_sfda.sfdamodid,
                 l_sfda.sfdamoddt,l_sfda.sfdacnfid,l_sfda.sfdacnfdt,l_sfda.sfdapstid,l_sfda.sfdapstdt,
                 l_sfda.sfdastus,l_sfda.sfdaud001,l_sfda.sfdaud002,l_sfda.sfdaud003,l_sfda.sfdaud004,
                 l_sfda.sfdaud005,l_sfda.sfdaud006,l_sfda.sfdaud007,l_sfda.sfdaud008,l_sfda.sfdaud009,
                 l_sfda.sfdaud010,l_sfda.sfdaud011,l_sfda.sfdaud012,l_sfda.sfdaud013,l_sfda.sfdaud014,
                 l_sfda.sfdaud015,l_sfda.sfdaud016,l_sfda.sfdaud017,l_sfda.sfdaud018,l_sfda.sfdaud019,
                 l_sfda.sfdaud020,l_sfda.sfdaud021,l_sfda.sfdaud022,l_sfda.sfdaud023,l_sfda.sfdaud024,
                 l_sfda.sfdaud025,l_sfda.sfdaud026,l_sfda.sfdaud027,l_sfda.sfdaud028,l_sfda.sfdaud029,
                 l_sfda.sfdaud030)
      #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfda_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      UPDATE sfda_t SET sfdacrtdt=l_sfdacrtdt WHERE sfdaent=g_enterprise AND sfdadocno=l_sfdadocno_1
   END IF
   
   #依盤點單別設定的參數"退料單單別"自動編碼
   IF l_n2 > 0 THEN
      LET l_sfdadocno_2 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0064')
      IF cl_null(l_sfdadocno_2) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00551'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      IF NOT s_aooi200_chk_slip(g_site,'',l_sfdadocno_2,'asft324') THEN
         RETURN r_success
      END IF
      CALL s_aooi200_gen_docno(g_site,l_sfdadocno_2,l_sfda.sfdadocdt,'asft324')
           RETURNING l_success,l_sfdadocno_2
      IF NOT l_success THEN
         RETURN r_success
      END IF
      LET l_sfda.sfdadocno = l_sfdadocno_2
      LET l_sfda.sfda002 = '24'
      #161109-00085#58-s
      #INSERT INTO sfda_t VALUES l_sfda.*
      INSERT INTO sfda_t(sfdaent,sfdasite,sfdadocno,sfdadocdt,sfda001,sfda002,sfda003,sfda004,sfda005,sfda006,
                         sfda007,sfda008,sfda009,sfda010,sfda011,sfda012,sfda013,sfda014,sfda015,sfdaownid,
                         sfdaowndp,sfdacrtid,sfdacrtdp,sfdacrtdt,sfdamodid,sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid,sfdapstdt,
                         sfdastus,sfdaud001,sfdaud002,sfdaud003,sfdaud004,sfdaud005,sfdaud006,sfdaud007,sfdaud008,sfdaud009,
                         sfdaud010,sfdaud011,sfdaud012,sfdaud013,sfdaud014,sfdaud015,sfdaud016,sfdaud017,sfdaud018,sfdaud019,
                         sfdaud020,sfdaud021,sfdaud022,sfdaud023,sfdaud024,sfdaud025,sfdaud026,sfdaud027,sfdaud028,sfdaud029,
                         sfdaud030) 
         VALUES (l_sfda.sfdaent,l_sfda.sfdasite,l_sfda.sfdadocno,l_sfda.sfdadocdt,l_sfda.sfda001,
                 l_sfda.sfda002,l_sfda.sfda003,l_sfda.sfda004,l_sfda.sfda005,l_sfda.sfda006,
                 l_sfda.sfda007,l_sfda.sfda008,l_sfda.sfda009,l_sfda.sfda010,l_sfda.sfda011,
                 l_sfda.sfda012,l_sfda.sfda013,l_sfda.sfda014,l_sfda.sfda015,l_sfda.sfdaownid,
                 l_sfda.sfdaowndp,l_sfda.sfdacrtid,l_sfda.sfdacrtdp,l_sfda.sfdacrtdt,l_sfda.sfdamodid,
                 l_sfda.sfdamoddt,l_sfda.sfdacnfid,l_sfda.sfdacnfdt,l_sfda.sfdapstid,l_sfda.sfdapstdt,
                 l_sfda.sfdastus,l_sfda.sfdaud001,l_sfda.sfdaud002,l_sfda.sfdaud003,l_sfda.sfdaud004,
                 l_sfda.sfdaud005,l_sfda.sfdaud006,l_sfda.sfdaud007,l_sfda.sfdaud008,l_sfda.sfdaud009,
                 l_sfda.sfdaud010,l_sfda.sfdaud011,l_sfda.sfdaud012,l_sfda.sfdaud013,l_sfda.sfdaud014,
                 l_sfda.sfdaud015,l_sfda.sfdaud016,l_sfda.sfdaud017,l_sfda.sfdaud018,l_sfda.sfdaud019,
                 l_sfda.sfdaud020,l_sfda.sfdaud021,l_sfda.sfdaud022,l_sfda.sfdaud023,l_sfda.sfdaud024,
                 l_sfda.sfdaud025,l_sfda.sfdaud026,l_sfda.sfdaud027,l_sfda.sfdaud028,l_sfda.sfdaud029,
                 l_sfda.sfdaud030)
      #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfda_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      UPDATE sfda_t SET sfdacrtdt=l_sfdacrtdt WHERE sfdaent=g_enterprise AND sfdadocno=l_sfdadocno_2
   END IF   
  
   #161109-00085#58-s
   #FOREACH s_asft350_confirm_gen_cs INTO l_sfmc.* 
   FOREACH s_asft350_confirm_gen_cs 
      INTO l_sfmc.sfmcseq,l_sfmc.sfmc001,l_sfmc.sfmc003,l_sfmc.sfmc004,l_sfmc.sfmc006,l_sfmc.sfmc007
   #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      #161005-00025#1 add---start---
      IF l_sfmc.sfmc006 = 0 THEN
         CONTINUE FOREACH
      END IF
      #161005-00025#1 add---end---
      #161109-00085#58-s
      #SELECT * INTO l_sfmb.* FROM sfmb_t WHERE sfmbent=g_enterprise AND sfmbsite=g_site  
      SELECT sfmb001,sfmb002,sfmb003,sfmb004,sfmb005,sfmb006,sfmb007,sfmb010
        INTO l_sfmb.sfmb001,l_sfmb.sfmb002,l_sfmb.sfmb003,l_sfmb.sfmb004,l_sfmb.sfmb005,
             l_sfmb.sfmb006,l_sfmb.sfmb007,l_sfmb.sfmb010
        FROM sfmb_t WHERE sfmbent=g_enterprise AND sfmbsite=g_site       
      #161109-00085#58-e
         AND sfmbdocno=g_sfma.sfmadocno AND sfmbseq=l_sfmc.sfmcseq
      ##发料退料单sfdc_t
      LET l_sfdc.sfdcent = g_enterprise 
      LET l_sfdc.sfdcsite = g_site
      IF l_sfmc.sfmc006 > 0 THEN
         LET l_sfdc.sfdcdocno = l_sfdadocno_1
         #SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND srdcdocno=l_sfdc.sfdcdocno  #161005-00025#1 mark
         SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND sfdcdocno=l_sfdc.sfdcdocno   #161005-00025#1 add
         IF cl_null(l_sfdc.sfdcseq) OR l_sfdc.sfdcseq = 0 THEN
            LET l_sfdc.sfdcseq = 1
         ELSE
            LET l_sfdc.sfdcseq = l_sfdc.sfdcseq + 1
         END IF
         LET l_sfdc.sfdc017 = -1
      END IF
      IF l_sfmc.sfmc006 < 0 THEN
         LET l_sfdc.sfdcdocno = l_sfdadocno_2
         #SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND srdcdocno=l_sfdc.sfdcdocno  #161005-00025#1 mark
         SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND sfdcdocno=l_sfdc.sfdcdocno   #161005-00025#1 add
         IF cl_null(l_sfdc.sfdcseq) OR l_sfdc.sfdcseq = 0 THEN
            LET l_sfdc.sfdcseq = 1
         ELSE
            LET l_sfdc.sfdcseq = l_sfdc.sfdcseq + 1
         END IF
         LET l_sfdc.sfdc017 = 1
      END IF
      LET l_sfdc.sfdc001 = l_sfmc.sfmc001
      LET l_sfdc.sfdc002 = l_sfmc.sfmc003
      LET l_sfdc.sfdc003 = l_sfmc.sfmc004
      LET l_sfdc.sfdc004 = l_sfmb.sfmb001
      LET l_sfdc.sfdc005 = l_sfmb.sfmb002
      LET l_sfdc.sfdc006 = l_sfmb.sfmb007
      LET l_sfdc.sfdc007 = l_sfmc.sfmc006 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc008 = l_sfmc.sfmc006 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc009 = l_sfmb.sfmb010
      LET l_sfdc.sfdc010 = l_sfmc.sfmc007 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc011 = l_sfmc.sfmc007 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc012 = l_sfmb.sfmb003
      LET l_sfdc.sfdc013 = l_sfmb.sfmb004
      LET l_sfdc.sfdc014 = l_sfmb.sfmb005
      LET l_sfdc.sfdc015 = ''
      LET l_sfdc.sfdc016 = l_sfmb.sfmb006
      
      #161109-00085#58-s
      #INSERT INTO sfdc_t VALUES l_sfdc.*
      INSERT INTO sfdc_t(sfdcent,sfdcsite,sfdcdocno,sfdcseq,sfdc001,sfdc002,sfdc003,sfdc004,sfdc005,sfdc006,
                         sfdc007,sfdc008,sfdc009,sfdc010,sfdc011,sfdc012,sfdc013,sfdc014,sfdc015,sfdc016,
                         sfdc017,sfdcud001,sfdcud002,sfdcud003,sfdcud004,sfdcud005,sfdcud006,sfdcud007,sfdcud008,sfdcud009,
                         sfdcud010,sfdcud011,sfdcud012,sfdcud013,sfdcud014,sfdcud015,sfdcud016,sfdcud017,sfdcud018,sfdcud019,
                         sfdcud020,sfdcud021,sfdcud022,sfdcud023,sfdcud024,sfdcud025,sfdcud026,sfdcud027,sfdcud028,sfdcud029,
                         sfdcud030 )
      VALUES (l_sfdc.sfdcent,l_sfdc.sfdcsite,l_sfdc.sfdcdocno,l_sfdc.sfdcseq,l_sfdc.sfdc001,
              l_sfdc.sfdc002,l_sfdc.sfdc003,l_sfdc.sfdc004,l_sfdc.sfdc005,l_sfdc.sfdc006,
              l_sfdc.sfdc007,l_sfdc.sfdc008,l_sfdc.sfdc009,l_sfdc.sfdc010,l_sfdc.sfdc011,
              l_sfdc.sfdc012,l_sfdc.sfdc013,l_sfdc.sfdc014,l_sfdc.sfdc015,l_sfdc.sfdc016,
              l_sfdc.sfdc017,l_sfdc.sfdcud001,l_sfdc.sfdcud002,l_sfdc.sfdcud003,l_sfdc.sfdcud004,
              l_sfdc.sfdcud005,l_sfdc.sfdcud006,l_sfdc.sfdcud007,l_sfdc.sfdcud008,l_sfdc.sfdcud009,
              l_sfdc.sfdcud010,l_sfdc.sfdcud011,l_sfdc.sfdcud012,l_sfdc.sfdcud013,l_sfdc.sfdcud014,
              l_sfdc.sfdcud015,l_sfdc.sfdcud016,l_sfdc.sfdcud017,l_sfdc.sfdcud018,l_sfdc.sfdcud019,
              l_sfdc.sfdcud020,l_sfdc.sfdcud021,l_sfdc.sfdcud022,l_sfdc.sfdcud023,l_sfdc.sfdcud024,
              l_sfdc.sfdcud025,l_sfdc.sfdcud026,l_sfdc.sfdcud027,l_sfdc.sfdcud028,l_sfdc.sfdcud029,
              l_sfdc.sfdcud030)
      #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfdc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      
      #发料退料明细档sfdd_t
      LET l_sfdd.sfddent = g_enterprise
      LET l_sfdd.sfddsite = g_site
      LET l_sfdd.sfdddocno = l_sfdc.sfdcdocno
      LET l_sfdd.sfddseq = l_sfdc.sfdcseq
      LET l_sfdd.sfddseq1 = 1
      LET l_sfdd.sfdd001 = l_sfdc.sfdc004
      LET l_sfdd.sfdd013 = l_sfdc.sfdc005  #140930 add
      LET l_sfdd.sfdd002 = 1
      LET l_sfdd.sfdd003 = l_sfdc.sfdc012
      LET l_sfdd.sfdd004 = l_sfdc.sfdc013
      LET l_sfdd.sfdd005 = l_sfdc.sfdc014
      LET l_sfdd.sfdd006 = l_sfdc.sfdc006
      LET l_sfdd.sfdd007 = l_sfdc.sfdc008
      LET l_sfdd.sfdd008 = l_sfdc.sfdc009
      LET l_sfdd.sfdd009 = l_sfdc.sfdc011
      LET l_sfdd.sfdd010 = l_sfdc.sfdc016
      LET l_sfdd.sfdd011 = ''
      LET l_sfdd.sfdd012 = l_sfdc.sfdc017      
      #161202-00012#1-add-s
      CALL s_asft310_get_sfbb008_sfbb009(l_sfdc.sfdc001,l_sfdc.sfdc002,l_sfdc.sfdc003,l_sfdc.sfdc004,l_sfdc.sfdc005,l_sfdc.sfdc016,l_sfdc.sfdc012,l_sfdc.sfdc013,l_sfdc.sfdc014,l_sfdc.sfdc006)
           RETURNING l_qty
      IF l_sfdd.sfdd007 >= l_qty THEN 
         LET l_sfdd.sfdd014 = l_qty
      ELSE   
         LET l_sfdd.sfdd014 = l_sfdd.sfdd007 
      END IF
      LET l_sfdd.sfdd015 = l_sfdd.sfdd007 - l_sfdd.sfdd014
      #161202-00012#1-add-e
      #161109-00085#58-s
      #INSERT INTO sfdd_t VALUES l_sfdd.*
      INSERT INTO sfdd_t(sfddent,sfddsite,sfdddocno,sfddseq,sfddseq1,sfdd001,sfdd002,sfdd003,sfdd004,sfdd005,
                         sfdd006,sfdd007,sfdd008,sfdd009,sfdd010,sfdd011,sfdd012,sfdd013,sfddud001,sfddud002,
                         sfddud003,sfddud004,sfddud005,sfddud006,sfddud007,sfddud008,sfddud009,sfddud010,sfddud011,sfddud012,
                         sfddud013,sfddud014,sfddud015,sfddud016,sfddud017,sfddud018,sfddud019,sfddud020,sfddud021,sfddud022,
                         sfddud023,sfddud024,sfddud025,sfddud026,sfddud027,sfddud028,sfddud029,sfddud030,sfdd014,sfdd015 )
                 VALUES (l_sfdd.sfddent,l_sfdd.sfddsite,l_sfdd.sfdddocno,l_sfdd.sfddseq,l_sfdd.sfddseq1,
                         l_sfdd.sfdd001,l_sfdd.sfdd002,l_sfdd.sfdd003,l_sfdd.sfdd004,l_sfdd.sfdd005,
                         l_sfdd.sfdd006,l_sfdd.sfdd007,l_sfdd.sfdd008,l_sfdd.sfdd009,l_sfdd.sfdd010,
                         l_sfdd.sfdd011,l_sfdd.sfdd012,l_sfdd.sfdd013,l_sfdd.sfddud001,l_sfdd.sfddud002,
                         l_sfdd.sfddud003,l_sfdd.sfddud004,l_sfdd.sfddud005,l_sfdd.sfddud006,l_sfdd.sfddud007,
                         l_sfdd.sfddud008,l_sfdd.sfddud009,l_sfdd.sfddud010,l_sfdd.sfddud011,l_sfdd.sfddud012,
                         l_sfdd.sfddud013,l_sfdd.sfddud014,l_sfdd.sfddud015,l_sfdd.sfddud016,l_sfdd.sfddud017,
                         l_sfdd.sfddud018,l_sfdd.sfddud019,l_sfdd.sfddud020,l_sfdd.sfddud021,l_sfdd.sfddud022,
                         l_sfdd.sfddud023,l_sfdd.sfddud024,l_sfdd.sfddud025,l_sfdd.sfddud026,l_sfdd.sfddud027,
                         l_sfdd.sfddud028,l_sfdd.sfddud029,l_sfdd.sfddud030,l_sfdd.sfdd014,l_sfdd.sfdd015)
      #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfdd_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
   END FOREACH    
            
   IF NOT cl_null(l_sfdadocno_1) THEN
      IF NOT s_asft350_confirm_gen_sfde_sfdf(l_sfdadocno_1,-1) THEN
         RETURN r_success
      END IF
   END IF
   
   IF NOT cl_null(l_sfdadocno_2) THEN
      IF NOT s_asft350_confirm_gen_sfde_sfdf(l_sfdadocno_2,1) THEN
         RETURN r_success
      END IF
   END IF  

   IF NOT cl_null(l_sfdadocno_1) THEN
      #將產生的領料單、退料單做確認、過帳
      #180817-00009#1 add --s
      IF NOT s_asft310_confirm_chk(l_sfdadocno_1) THEN
         RETURN r_success
      END IF
      #180817-00009#1 add --e
      IF NOT s_asft310_confirm_upd(l_sfdadocno_1) THEN
         RETURN r_success
      END IF
      #180817-00009#1 add --s
      IF NOT s_asft310_post_chk(l_sfdadocno_1) THEN
         RETURN r_success
      END IF
      #180817-00009#1 add --e
      IF NOT s_asft310_post_upd(l_sfdadocno_1,l_sfda.sfda001) THEN
         RETURN r_success
      END IF
      #更新sfmc007，领退料单号
      UPDATE sfmc_t SET sfmc008=l_sfdadocno_1 WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=g_sfma.sfmadocno AND sfmc006>0
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfmc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
   END IF
      
   IF NOT cl_null(l_sfdadocno_2) THEN
      #將產生的領料單、退料單做確認、過帳
      #180817-00009#1 add --s
      IF NOT s_asft310_confirm_chk(l_sfdadocno_2) THEN
         RETURN r_success
      END IF
      #180817-00009#1 add --e
      IF NOT s_asft310_confirm_upd(l_sfdadocno_2) THEN
         RETURN r_success
      END IF
      #180817-00009#1 add --s
      IF NOT s_asft310_post_chk(l_sfdadocno_2) THEN
         RETURN r_success
      END IF
      #180817-00009#1 add --e
      IF NOT s_asft310_post_upd(l_sfdadocno_2,l_sfda.sfda001) THEN
         RETURN r_success
      END IF
      #更新sfmc007，领退料单号
      UPDATE sfmc_t SET sfmc008=l_sfdadocno_2 WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=g_sfma.sfmadocno AND sfmc006<0
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfmc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
   END IF      
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 产生sfde_t,sfdf_t
# Memo...........:
# Usage..........: CALL s_asft350_confirm_gen_sfde_sfdf(p_sfdedocno,p_sfde010)
#                  RETURNING r_success
# Input parameter: 1.p_sfdedocno              LIKE sfde_t.sfdedocno
#                : 2.p_sfde010                LIKE sfde_t.sfde010
# Return code....: 1.r_success                LIKE type_t.num5
# Date & Author..: 2014/5/5 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft350_confirm_gen_sfde_sfdf(p_sfdedocno,p_sfde010)
DEFINE p_sfdedocno         LIKE sfde_t.sfdedocno
DEFINE p_sfde010           LIKE sfde_t.sfde010
DEFINE r_success           LIKE type_t.num5
DEFINE l_sql               STRING
DEFINE l_sfdc004           LIKE sfdc_t.sfdc004
DEFINE l_sfdc005           LIKE sfdc_t.sfdc005
DEFINE l_sfdc006           LIKE sfdc_t.sfdc006
DEFINE l_sfdc007           LIKE sfdc_t.sfdc007
DEFINE l_sfdc008           LIKE sfdc_t.sfdc008
DEFINE l_sfdc009           LIKE sfdc_t.sfdc009
DEFINE l_sfdc010           LIKE sfdc_t.sfdc010
DEFINE l_sfdc011           LIKE sfdc_t.sfdc011
#161109-00085#58-s
#DEFINE l_sfde              RECORD LIKE sfde_t.*
DEFINE l_sfde RECORD  #發退料需求匯總檔
       sfdeent LIKE sfde_t.sfdeent, #企業編號
       sfdesite LIKE sfde_t.sfdesite, #營運據點
       sfdedocno LIKE sfde_t.sfdedocno, #發退料單號
       sfdeseq LIKE sfde_t.sfdeseq, #項次
       sfde001 LIKE sfde_t.sfde001, #需求料號
       sfde002 LIKE sfde_t.sfde002, #產品特徵
       sfde003 LIKE sfde_t.sfde003, #單位
       sfde004 LIKE sfde_t.sfde004, #申請數量
       sfde005 LIKE sfde_t.sfde005, #實際數量
       sfde006 LIKE sfde_t.sfde006, #參考單位
       sfde007 LIKE sfde_t.sfde007, #參考單位申請數量
       sfde008 LIKE sfde_t.sfde008, #參考單位實際數量
       sfde009 LIKE sfde_t.sfde009, #客供料
       sfde010 LIKE sfde_t.sfde010, #正負
       sfdeud001 LIKE sfde_t.sfdeud001, #自定義欄位(文字)001
       sfdeud002 LIKE sfde_t.sfdeud002, #自定義欄位(文字)002
       sfdeud003 LIKE sfde_t.sfdeud003, #自定義欄位(文字)003
       sfdeud004 LIKE sfde_t.sfdeud004, #自定義欄位(文字)004
       sfdeud005 LIKE sfde_t.sfdeud005, #自定義欄位(文字)005
       sfdeud006 LIKE sfde_t.sfdeud006, #自定義欄位(文字)006
       sfdeud007 LIKE sfde_t.sfdeud007, #自定義欄位(文字)007
       sfdeud008 LIKE sfde_t.sfdeud008, #自定義欄位(文字)008
       sfdeud009 LIKE sfde_t.sfdeud009, #自定義欄位(文字)009
       sfdeud010 LIKE sfde_t.sfdeud010, #自定義欄位(文字)010
       sfdeud011 LIKE sfde_t.sfdeud011, #自定義欄位(數字)011
       sfdeud012 LIKE sfde_t.sfdeud012, #自定義欄位(數字)012
       sfdeud013 LIKE sfde_t.sfdeud013, #自定義欄位(數字)013
       sfdeud014 LIKE sfde_t.sfdeud014, #自定義欄位(數字)014
       sfdeud015 LIKE sfde_t.sfdeud015, #自定義欄位(數字)015
       sfdeud016 LIKE sfde_t.sfdeud016, #自定義欄位(數字)016
       sfdeud017 LIKE sfde_t.sfdeud017, #自定義欄位(數字)017
       sfdeud018 LIKE sfde_t.sfdeud018, #自定義欄位(數字)018
       sfdeud019 LIKE sfde_t.sfdeud019, #自定義欄位(數字)019
       sfdeud020 LIKE sfde_t.sfdeud020, #自定義欄位(數字)020
       sfdeud021 LIKE sfde_t.sfdeud021, #自定義欄位(日期時間)021
       sfdeud022 LIKE sfde_t.sfdeud022, #自定義欄位(日期時間)022
       sfdeud023 LIKE sfde_t.sfdeud023, #自定義欄位(日期時間)023
       sfdeud024 LIKE sfde_t.sfdeud024, #自定義欄位(日期時間)024
       sfdeud025 LIKE sfde_t.sfdeud025, #自定義欄位(日期時間)025
       sfdeud026 LIKE sfde_t.sfdeud026, #自定義欄位(日期時間)026
       sfdeud027 LIKE sfde_t.sfdeud027, #自定義欄位(日期時間)027
       sfdeud028 LIKE sfde_t.sfdeud028, #自定義欄位(日期時間)028
       sfdeud029 LIKE sfde_t.sfdeud029, #自定義欄位(日期時間)029
       sfdeud030 LIKE sfde_t.sfdeud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfdf              RECORD LIKE sfdf_t.*
DEFINE l_sfdf RECORD  #發退料倉儲批匯總檔
       sfdfent LIKE sfdf_t.sfdfent, #企業編號
       sfdfsite LIKE sfdf_t.sfdfsite, #營運據點
       sfdfdocno LIKE sfdf_t.sfdfdocno, #發退料單號
       sfdfseq LIKE sfdf_t.sfdfseq, #項次
       sfdfseq1 LIKE sfdf_t.sfdfseq1, #項序
       sfdf001 LIKE sfdf_t.sfdf001, #發退料料號
       sfdf002 LIKE sfdf_t.sfdf002, #替代率
       sfdf003 LIKE sfdf_t.sfdf003, #庫位
       sfdf004 LIKE sfdf_t.sfdf004, #儲位
       sfdf005 LIKE sfdf_t.sfdf005, #批號
       sfdf006 LIKE sfdf_t.sfdf006, #單位
       sfdf007 LIKE sfdf_t.sfdf007, #數量
       sfdf008 LIKE sfdf_t.sfdf008, #參考單位
       sfdf009 LIKE sfdf_t.sfdf009, #參考單位數量
       sfdf010 LIKE sfdf_t.sfdf010, #庫存管理特徵
       sfdf011 LIKE sfdf_t.sfdf011, #包裝容器
       sfdf012 LIKE sfdf_t.sfdf012, #正負
       sfdf013 LIKE sfdf_t.sfdf013, #產品特徵
       sfdfud001 LIKE sfdf_t.sfdfud001, #自定義欄位(文字)001
       sfdfud002 LIKE sfdf_t.sfdfud002, #自定義欄位(文字)002
       sfdfud003 LIKE sfdf_t.sfdfud003, #自定義欄位(文字)003
       sfdfud004 LIKE sfdf_t.sfdfud004, #自定義欄位(文字)004
       sfdfud005 LIKE sfdf_t.sfdfud005, #自定義欄位(文字)005
       sfdfud006 LIKE sfdf_t.sfdfud006, #自定義欄位(文字)006
       sfdfud007 LIKE sfdf_t.sfdfud007, #自定義欄位(文字)007
       sfdfud008 LIKE sfdf_t.sfdfud008, #自定義欄位(文字)008
       sfdfud009 LIKE sfdf_t.sfdfud009, #自定義欄位(文字)009
       sfdfud010 LIKE sfdf_t.sfdfud010, #自定義欄位(文字)010
       sfdfud011 LIKE sfdf_t.sfdfud011, #自定義欄位(數字)011
       sfdfud012 LIKE sfdf_t.sfdfud012, #自定義欄位(數字)012
       sfdfud013 LIKE sfdf_t.sfdfud013, #自定義欄位(數字)013
       sfdfud014 LIKE sfdf_t.sfdfud014, #自定義欄位(數字)014
       sfdfud015 LIKE sfdf_t.sfdfud015, #自定義欄位(數字)015
       sfdfud016 LIKE sfdf_t.sfdfud016, #自定義欄位(數字)016
       sfdfud017 LIKE sfdf_t.sfdfud017, #自定義欄位(數字)017
       sfdfud018 LIKE sfdf_t.sfdfud018, #自定義欄位(數字)018
       sfdfud019 LIKE sfdf_t.sfdfud019, #自定義欄位(數字)019
       sfdfud020 LIKE sfdf_t.sfdfud020, #自定義欄位(數字)020
       sfdfud021 LIKE sfdf_t.sfdfud021, #自定義欄位(日期時間)021
       sfdfud022 LIKE sfdf_t.sfdfud022, #自定義欄位(日期時間)022
       sfdfud023 LIKE sfdf_t.sfdfud023, #自定義欄位(日期時間)023
       sfdfud024 LIKE sfdf_t.sfdfud024, #自定義欄位(日期時間)024
       sfdfud025 LIKE sfdf_t.sfdfud025, #自定義欄位(日期時間)025
       sfdfud026 LIKE sfdf_t.sfdfud026, #自定義欄位(日期時間)026
       sfdfud027 LIKE sfdf_t.sfdfud027, #自定義欄位(日期時間)027
       sfdfud028 LIKE sfdf_t.sfdfud028, #自定義欄位(日期時間)028
       sfdfud029 LIKE sfdf_t.sfdfud029, #自定義欄位(日期時間)029
       sfdfud030 LIKE sfdf_t.sfdfud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
DEFINE l_sfdd003           LIKE sfdd_t.sfdd003
DEFINE l_sfdd004           LIKE sfdd_t.sfdd004
DEFINE l_sfdd005           LIKE sfdd_t.sfdd005
DEFINE l_sfdd007           LIKE sfdd_t.sfdd007
DEFINE l_sfdd009           LIKE sfdd_t.sfdd008
DEFINE l_sfdd010           LIKE sfdd_t.sfdd010

   LET r_success = FALSE
   #210329-00022#1---add---str---
   #效能優化:
   LET l_sql = "INSERT INTO sfde_t(sfdeent,sfdesite,sfdedocno,sfdeseq,sfde001,sfde002,sfde003,sfde004,sfde005,sfde006, ",
               "                   sfde007,sfde008,sfde009,sfde010,sfdeud001,sfdeud002,sfdeud003,sfdeud004,sfdeud005,sfdeud006, ",
               "                   sfdeud007,sfdeud008,sfdeud009,sfdeud010,sfdeud011,sfdeud012,sfdeud013,sfdeud014,sfdeud015,sfdeud016, ",
               "                   sfdeud017,sfdeud018,sfdeud019,sfdeud020,sfdeud021,sfdeud022,sfdeud023,sfdeud024,sfdeud025,sfdeud026, ",
               "                   sfdeud027,sfdeud028,sfdeud029,sfdeud030) ",
               " VALUES( ",
               " ?,?,?,?,?,",#1
               " ?,?,?,?,?,",#2
               " ?,?,?,?,?,",#3
               " ?,?,?,?,?,",#4
               " ?,?,?,?,?,",#5
               " ?,?,?,?,?,",#6
               " ?,?,?,?,?,",#7
               " ?,?,?,?,?,",#8
               " ?,?,?,?   ",#9      
               " ) "
   PREPARE s_asft350_ins_sfde FROM l_sql   

   LET l_sql = "INSERT INTO sfdf_t (sfdfent,sfdfsite,sfdfdocno,sfdfseq,sfdfseq1,sfdf001,sfdf002,sfdf003,sfdf004,sfdf005, ",
               "                    sfdf006,sfdf007,sfdf008,sfdf009,sfdf010,sfdf011,sfdf012,sfdf013,sfdfud001,sfdfud002, ",
               "                    sfdfud003,sfdfud004,sfdfud005,sfdfud006,sfdfud007,sfdfud008,sfdfud009,sfdfud010,sfdfud011,sfdfud012, ",
               "                    sfdfud013,sfdfud014,sfdfud015,sfdfud016,sfdfud017,sfdfud018,sfdfud019,sfdfud020,sfdfud021,sfdfud022, ",
               "                    sfdfud023,sfdfud024,sfdfud025,sfdfud026,sfdfud027,sfdfud028,sfdfud029,sfdfud030 ) ",
               " VALUES( ",
               " ?,?,?,?,?,",#1
               " ?,?,?,?,?,",#2
               " ?,?,?,?,?,",#3
               " ?,?,?,?,?,",#4
               " ?,?,?,?,?,",#5
               " ?,?,?,?,?,",#6
               " ?,?,?,?,?,",#7
               " ?,?,?,?,?,",#8
               " ?,?,?,?,?,",#9      
               " ?,?,?     ",#10   
               " ) "
   PREPARE s_asft350_ins_sfdf FROM l_sql                                  
   #210329-00022#1---add---end---
   
   #發料需求匯總檔sfde_t(發退料明細檔內的需求料號、產品特徵、單位、參考單位相同的合併為同一筆資料)
   LET l_sql = "SELECT UNIQUE sfdc004,sfdc005,sfdc006,sfdc009,sum(sfdc007),sum(sfdc008),sum(sfdc010),sum(sfdc011) FROM sfdc_t",
               " WHERE sfdcent=",g_enterprise," AND sfdcsite='",g_site,"' AND sfdcdocno=? ",
               " GROUP BY sfdc004,sfdc005,sfdc006,sfdc009"
   PREPARE s_asft350_confirm_gen_pre2 FROM l_sql
   DECLARE s_asft350_confirm_gen_cs2 CURSOR FOR s_asft350_confirm_gen_pre2
   
   #發退料倉儲批匯總檔sfdf_t(此table是對應sfde_t,同一個料號、儲庫、儲位、批號、库存管理特徵、單位、參考單位为同一笔资料)
   LET l_sql = "SELECT UNIQUE sfdd003,sfdd004,sfdd005,sfdd010,SUM(sfdd007),SUM(sfdd009) FROM sfdd_t",
               "      ,sfde_t ", #210329-00022#1(4)add
              #" WHERE sfddent=",g_enterprise," AND sfddsite='",g_site,"' AND sfdddocno=? AND sfdd001=? AND sfdd013=? AND sfdd006=? AND sfdd008=?", #210329-00022#1(4) mark
               " WHERE sfddent=",g_enterprise," AND sfddsite='",g_site,"' AND sfdddocno=? AND sfdd001=? AND sfdd013=? AND sfdd006=? ",              #210329-00022#1(4) add
              #210329-00022#1(4)--add---str---    
               "   AND (sfdd008 = ? OR (sfdd008 IS NULL AND sfde006 IS NULL)) ", #参考单位       
               "   AND sfdeent   = sfddent ",
               "   AND sfdedocno = sfdddocno ",
               "   AND sfde001 = sfdd001 ",#料件
               "   AND sfdd013 = sfde002 ",#特征
               "   AND sfdd006 = sfde003 ",#单位
               "   AND sfdd012 = sfde010 ",#正负
              #210329-00022#1(4)--add---end--- 
               " GROUP BY sfdd003,sfdd004,sfdd005,sfdd010"
   PREPARE s_asft350_confirm_gen_pre3 FROM l_sql
   DECLARE s_asft350_confirm_gen_cs3 CURSOR FOR s_asft350_confirm_gen_pre3
      
   FOREACH s_asft350_confirm_gen_cs2 USING p_sfdedocno INTO l_sfdc004,l_sfdc005,l_sfdc006,l_sfdc009,l_sfdc007,l_sfdc008,l_sfdc010,l_sfdc011
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      LET l_sfde.sfdeent=g_enterprise
      LET l_sfde.sfdesite=g_site
      LET l_sfde.sfdedocno=p_sfdedocno
      SELECT MAX(sfdeseq)+1 INTO l_sfde.sfdeseq FROM sfde_t WHERE sfdeent=g_enterprise AND sfdesite=g_site AND sfdedocno=l_sfde.sfdedocno
      IF cl_null(l_sfde.sfdeseq) OR l_sfde.sfdeseq = 0 THEN
         LET l_sfde.sfdeseq = 1
      END IF
      LET l_sfde.sfde001=l_sfdc004
      LET l_sfde.sfde002=l_sfdc005
      LET l_sfde.sfde003=l_sfdc006
      LET l_sfde.sfde004=l_sfdc007
      LET l_sfde.sfde005=l_sfdc008
      LET l_sfde.sfde006=l_sfdc009
      LET l_sfde.sfde007=l_sfdc010
      LET l_sfde.sfde008=l_sfdc011
      LET l_sfde.sfde009='N'
      LET l_sfde.sfde010=p_sfde010
     #210329-00022#1---mark---str--- 
     ##161109-00085#58-s
     ##INSERT INTO sfde_t VALUES l_sfde.*
     #INSERT INTO sfde_t(sfdeent,sfdesite,sfdedocno,sfdeseq,sfde001,sfde002,sfde003,sfde004,sfde005,sfde006,
     #                   sfde007,sfde008,sfde009,sfde010,sfdeud001,sfdeud002,sfdeud003,sfdeud004,sfdeud005,sfdeud006,
     #                   sfdeud007,sfdeud008,sfdeud009,sfdeud010,sfdeud011,sfdeud012,sfdeud013,sfdeud014,sfdeud015,sfdeud016,
     #                   sfdeud017,sfdeud018,sfdeud019,sfdeud020,sfdeud021,sfdeud022,sfdeud023,sfdeud024,sfdeud025,sfdeud026,
     #                   sfdeud027,sfdeud028,sfdeud029,sfdeud030)
     #   VALUES (l_sfde.sfdeent,l_sfde.sfdesite,l_sfde.sfdedocno,l_sfde.sfdeseq,l_sfde.sfde001,
     #           l_sfde.sfde002,l_sfde.sfde003,l_sfde.sfde004,l_sfde.sfde005,l_sfde.sfde006,
     #           l_sfde.sfde007,l_sfde.sfde008,l_sfde.sfde009,l_sfde.sfde010,l_sfde.sfdeud001,
     #           l_sfde.sfdeud002,l_sfde.sfdeud003,l_sfde.sfdeud004,l_sfde.sfdeud005,l_sfde.sfdeud006,
     #           l_sfde.sfdeud007,l_sfde.sfdeud008,l_sfde.sfdeud009,l_sfde.sfdeud010,l_sfde.sfdeud011,
     #           l_sfde.sfdeud012,l_sfde.sfdeud013,l_sfde.sfdeud014,l_sfde.sfdeud015,l_sfde.sfdeud016,
     #           l_sfde.sfdeud017,l_sfde.sfdeud018,l_sfde.sfdeud019,l_sfde.sfdeud020,l_sfde.sfdeud021,
     #           l_sfde.sfdeud022,l_sfde.sfdeud023,l_sfde.sfdeud024,l_sfde.sfdeud025,l_sfde.sfdeud026,
     #           l_sfde.sfdeud027,l_sfde.sfdeud028,l_sfde.sfdeud029,l_sfde.sfdeud030)
     ##161109-00085#58-e
     #210329-00022#1---mark---end---  
     #210329-00022#1---add----str---
      EXECUTE s_asft350_ins_sfde USING 
                 l_sfde.sfdeent,l_sfde.sfdesite,l_sfde.sfdedocno,l_sfde.sfdeseq,l_sfde.sfde001,
                 l_sfde.sfde002,l_sfde.sfde003,l_sfde.sfde004,l_sfde.sfde005,l_sfde.sfde006,
                 l_sfde.sfde007,l_sfde.sfde008,l_sfde.sfde009,l_sfde.sfde010,l_sfde.sfdeud001,
                 l_sfde.sfdeud002,l_sfde.sfdeud003,l_sfde.sfdeud004,l_sfde.sfdeud005,l_sfde.sfdeud006,
                 l_sfde.sfdeud007,l_sfde.sfdeud008,l_sfde.sfdeud009,l_sfde.sfdeud010,l_sfde.sfdeud011,
                 l_sfde.sfdeud012,l_sfde.sfdeud013,l_sfde.sfdeud014,l_sfde.sfdeud015,l_sfde.sfdeud016,
                 l_sfde.sfdeud017,l_sfde.sfdeud018,l_sfde.sfdeud019,l_sfde.sfdeud020,l_sfde.sfdeud021,
                 l_sfde.sfdeud022,l_sfde.sfdeud023,l_sfde.sfdeud024,l_sfde.sfdeud025,l_sfde.sfdeud026,
                 l_sfde.sfdeud027,l_sfde.sfdeud028,l_sfde.sfdeud029,l_sfde.sfdeud030 
     #210329-00022#1---add----end---                 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfde_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      
      #發退料倉儲批匯總檔sfdf_t(此table是對應sfde_t)
      FOREACH s_asft350_confirm_gen_cs3 USING p_sfdedocno,l_sfde.sfde001,l_sfde.sfde002,l_sfde.sfde003,l_sfde.sfde006 INTO l_sfdd003,l_sfdd004,l_sfdd005,l_sfdd010,l_sfdd007,l_sfdd009
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

            RETURN r_success
         END IF
         LET l_sfdf.sfdfent=g_enterprise
         LET l_sfdf.sfdfsite=g_site
         LET l_sfdf.sfdfdocno=l_sfde.sfdedocno
         LET l_sfdf.sfdfseq=l_sfde.sfdeseq
         SELECT MAX(sfdfseq1)+1 INTO l_sfdf.sfdfseq1 FROM sfdf_t WHERE sfdfent=g_enterprise AND sfdfsite=g_site
            AND sfdfdocno=l_sfdf.sfdfdocno AND sfdfseq=l_sfdf.sfdfseq
         IF cl_null(l_sfdf.sfdfseq1) OR l_sfdf.sfdfseq1 = 0 THEN
            LET l_sfdf.sfdfseq1 = 1
         END IF
         LET l_sfdf.sfdf001=l_sfde.sfde001
         LET l_sfdf.sfdf013=l_sfde.sfde002  #140930 add
         LET l_sfdf.sfdf002=1
         LET l_sfdf.sfdf003=l_sfdd003
         LET l_sfdf.sfdf004=l_sfdd004
         LET l_sfdf.sfdf005=l_sfdd005
         LET l_sfdf.sfdf006=l_sfde.sfde003
         LET l_sfdf.sfdf007=l_sfdd007             #同一個料號、儲庫、儲位、批號、產品特徵、單位、參考單位的數量
         LET l_sfdf.sfdf008=l_sfde.sfde006
         LET l_sfdf.sfdf009=l_sfdd009             #同一個料號、儲庫、儲位、批號、產品特徵、單位、參考單位的數量
         LET l_sfdf.sfdf010=l_sfdd010
         LET l_sfdf.sfdf011=''
         LET l_sfdf.sfdf012=p_sfde010
        #210329-00022#1---mark---str--- 
        ##161109-00085#58-s
        ##INSERT INTO sfdf_t VALUES l_sfdf.*
        #INSERT INTO sfdf_t (sfdfent,sfdfsite,sfdfdocno,sfdfseq,sfdfseq1,sfdf001,sfdf002,sfdf003,sfdf004,sfdf005,
        #                    sfdf006,sfdf007,sfdf008,sfdf009,sfdf010,sfdf011,sfdf012,sfdf013,sfdfud001,sfdfud002,
        #                    sfdfud003,sfdfud004,sfdfud005,sfdfud006,sfdfud007,sfdfud008,sfdfud009,sfdfud010,sfdfud011,sfdfud012,
        #                    sfdfud013,sfdfud014,sfdfud015,sfdfud016,sfdfud017,sfdfud018,sfdfud019,sfdfud020,sfdfud021,sfdfud022,
        #                    sfdfud023,sfdfud024,sfdfud025,sfdfud026,sfdfud027,sfdfud028,sfdfud029,sfdfud030 )
        #   VALUES (l_sfdf.sfdfent,l_sfdf.sfdfsite,l_sfdf.sfdfdocno,l_sfdf.sfdfseq,l_sfdf.sfdfseq1,
        #           l_sfdf.sfdf001,l_sfdf.sfdf002,l_sfdf.sfdf003,l_sfdf.sfdf004,l_sfdf.sfdf005,
        #           l_sfdf.sfdf006,l_sfdf.sfdf007,l_sfdf.sfdf008,l_sfdf.sfdf009,l_sfdf.sfdf010,
        #           l_sfdf.sfdf011,l_sfdf.sfdf012,l_sfdf.sfdf013,l_sfdf.sfdfud001,l_sfdf.sfdfud002,
        #           l_sfdf.sfdfud003,l_sfdf.sfdfud004,l_sfdf.sfdfud005,l_sfdf.sfdfud006,l_sfdf.sfdfud007,
        #           l_sfdf.sfdfud008,l_sfdf.sfdfud009,l_sfdf.sfdfud010,l_sfdf.sfdfud011,l_sfdf.sfdfud012,
        #           l_sfdf.sfdfud013,l_sfdf.sfdfud014,l_sfdf.sfdfud015,l_sfdf.sfdfud016,l_sfdf.sfdfud017,
        #           l_sfdf.sfdfud018,l_sfdf.sfdfud019,l_sfdf.sfdfud020,l_sfdf.sfdfud021,l_sfdf.sfdfud022,
        #           l_sfdf.sfdfud023,l_sfdf.sfdfud024,l_sfdf.sfdfud025,l_sfdf.sfdfud026,l_sfdf.sfdfud027,
        #           l_sfdf.sfdfud028,l_sfdf.sfdfud029,l_sfdf.sfdfud030)
        ##161109-00085#58-e
        #210329-00022#1---mark---end---  
        #210329-00022#1---add----str---
         EXECUTE s_asft350_ins_sfdf USING 
                    l_sfdf.sfdfent,l_sfdf.sfdfsite,l_sfdf.sfdfdocno,l_sfdf.sfdfseq,l_sfdf.sfdfseq1,
                    l_sfdf.sfdf001,l_sfdf.sfdf002,l_sfdf.sfdf003,l_sfdf.sfdf004,l_sfdf.sfdf005,
                    l_sfdf.sfdf006,l_sfdf.sfdf007,l_sfdf.sfdf008,l_sfdf.sfdf009,l_sfdf.sfdf010,
                    l_sfdf.sfdf011,l_sfdf.sfdf012,l_sfdf.sfdf013,l_sfdf.sfdfud001,l_sfdf.sfdfud002,
                    l_sfdf.sfdfud003,l_sfdf.sfdfud004,l_sfdf.sfdfud005,l_sfdf.sfdfud006,l_sfdf.sfdfud007,
                    l_sfdf.sfdfud008,l_sfdf.sfdfud009,l_sfdf.sfdfud010,l_sfdf.sfdfud011,l_sfdf.sfdfud012,
                    l_sfdf.sfdfud013,l_sfdf.sfdfud014,l_sfdf.sfdfud015,l_sfdf.sfdfud016,l_sfdf.sfdfud017,
                    l_sfdf.sfdfud018,l_sfdf.sfdfud019,l_sfdf.sfdfud020,l_sfdf.sfdfud021,l_sfdf.sfdfud022,
                    l_sfdf.sfdfud023,l_sfdf.sfdfud024,l_sfdf.sfdfud025,l_sfdf.sfdfud026,l_sfdf.sfdfud027,
                    l_sfdf.sfdfud028,l_sfdf.sfdfud029,l_sfdf.sfdfud030 
        #210329-00022#1---add----end---            
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "INSERT sfdf_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            RETURN r_success
         END IF
      END FOREACH
   END FOREACH
   LET r_success = TRUE
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 耗料盤存倒扣分攤取消確認元件
# Memo...........:
# Usage..........: CALL s_asft350_unconfirm(p_sfmadocno)
#                  RETURNING r_success
# Input parameter: 1.p_sfmadocno          LIKE sfma_t.sfmadocno
# Return code....: 1.r_success            LIKE type_t.num5
# Date & Author..: 2014/5/5 By wuxj
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft350_unconfirm(p_sfmadocno)
DEFINE p_sfmadocno          LIKE sfma_t.sfmadocno
DEFINE r_success            LIKE type_t.num5
DEFINE l_close_dd           LIKE sfma_t.sfmadocdt
DEFINE l_sql                STRING 
#161109-00085#58-s
#DEFINE l_sfmb              RECORD LIKE sfmb_t.*
DEFINE l_sfmb RECORD  #耗料盤存檔點單身檔
       sfmbseq LIKE sfmb_t.sfmbseq, #項次
       sfmb008 LIKE sfmb_t.sfmb008, #帳面數量
       sfmb009 LIKE sfmb_t.sfmb009, #盤點數量
       sfmb011 LIKE sfmb_t.sfmb011, #參考帳面數量
       sfmb012 LIKE sfmb_t.sfmb012  #參考盤點數量
END RECORD
#161109-00085#58-e
DEFINE l_sfmc006            LIKE sfmc_t.sfmc006
DEFINE l_sfmc007            LIKE sfmc_t.sfmc007
DEFINE l_flag               LIKE type_t.chr1

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE

   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      RETURN r_success
   END IF
   
   #检查：盘点单号不可为空
   IF cl_null(p_sfmadocno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00534'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #161109-00085#58-s
   #SELECT * INTO g_sfma.* FROM sfma_t WHERE sfmaent=g_enterprise AND sfmasite=g_site AND sfmadocno=p_sfmadocno
   SELECT sfmadocno,sfmadocdt,sfma001,sfma002,sfma003,sfma004,sfma005,sfmastus
     INTO g_sfma.sfmadocno,g_sfma.sfmadocdt,g_sfma.sfma001,g_sfma.sfma002,g_sfma.sfma003,
          g_sfma.sfma004,g_sfma.sfma005,g_sfma.sfmastus
     FROM sfma_t
    WHERE sfmaent=g_enterprise AND sfmasite=g_site AND sfmadocno=p_sfmadocno
   #161109-00085#58-e
   #状态需为‘Y’才可以取消确认
   IF g_sfma.sfmastus != 'Y' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00536'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #盘点日期不可小于关账日期
   LET l_close_dd = cl_get_para(g_enterprise,g_site,'S-MFG-0031')
   #IF g_sfma.sfmadocdt < l_close_dd OR g_sfma.sfma002 < l_close_dd OR g_sfma.sfma003 < l_close_dd THEN #201208-00036#1 mark
   IF g_sfma.sfmadocdt <= l_close_dd OR g_sfma.sfma002 <= l_close_dd OR g_sfma.sfma003 <= l_close_dd THEN #201208-00036#1 add
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00008'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #有盤點數量且差異數量不等於0的，分攤數需全部等於差異數
   #161109-00085#58-s
   #LET l_sql = "SELECT * FROM sfmb_t WHERE sfmbent=",g_enterprise," AND sfmbsite='",g_site,"'",
   LET l_sql = "SELECT sfmbseq,sfmb008,sfmb009,sfmb011,sfmb012",
               "  FROM sfmb_t",
               " WHERE sfmbent=",g_enterprise, 
               "   AND sfmbsite='",g_site,"'",
   #161109-00085#58-e   
               "   AND sfmbdocno='",g_sfma.sfmadocno,"' AND sfmb008 IS NOT NULL AND sfmb009 IS NOT NULL AND sfmb008!=sfmb009"
   PREPARE s_asft350_unconfirm_pre FROM l_sql
   DECLARE s_asft350_unconfirm_cs CURSOR FOR s_asft350_unconfirm_pre
   LET l_flag = 'N'
   #161109-00085#58-s
   #FOREACH s_asft350_unconfirm_cs INTO l_sfmb.*
   FOREACH s_asft350_unconfirm_cs 
      INTO l_sfmb.sfmbseq,l_sfmb.sfmb008,l_sfmb.sfmb009,l_sfmb.sfmb011,l_sfmb.sfmb012
   #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF   
      LET l_flag = 'Y'
      SELECT SUM(sfmc006) INTO l_sfmc006 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site
         AND sfmcdocno=g_sfma.sfmadocno AND sfmcseq=l_sfmb.sfmbseq
      IF l_sfmb.sfmb008 - l_sfmb.sfmb009 != l_sfmc006 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00496'
         LET g_errparam.extend = l_sfmb.sfmbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      IF NOT cl_null(l_sfmb.sfmb011) AND NOT cl_null(l_sfmb.sfmb012) THEN
         SELECT SUM(sfmc007) INTO l_sfmc007 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site
            AND sfmcdocno=g_sfma.sfmadocno AND sfmcseq=l_sfmb.sfmbseq
         IF l_sfmb.sfmb011 - l_sfmb.sfmb012 != l_sfmc007 THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00496'
         LET g_errparam.extend = l_sfmb.sfmbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()

            RETURN r_success
         END IF
      END IF
   END FOREACH
   
   IF l_flag = 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00566'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #更新状态码为Y
   UPDATE sfma_t SET sfmastus = 'N',sfmacnfid = '',sfmacnfdt = ''
    WHERE sfmaent = g_enterprise AND sfmasite = g_site AND sfmadocno = g_sfma.sfmadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00034'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #將對應的發料單、退料單過帳還原、取消確認、並作廢
   IF NOT s_asft350_unconfirm_ungen() THEN
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 将产生的发料单、退料单过账还原、取消确认并作废
# Memo...........:
# Usage..........: CALL s_asft350_unconfirm_ungen()
#                  RETURNING r_success
# Return code....: 1.r_success               LIKE type_t.num5
# Date & Author..: 2014/5/5 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft350_unconfirm_ungen()
DEFINE r_success                     LIKE type_t.num5
DEFINE l_sql                         STRING
DEFINE l_sfmc008                     LIKE sfmc_t.sfmc008
DEFINE l_sfdastus                    LIKE sfda_t.sfdastus     #180408-00009#1 mod


   LET r_success = FALSE
   #180408-00009#1---mod---begin---
   LET l_sql = "SELECT DISTINCT sfmc008,sfdastus FROM sfmc_t,sfda_t WHERE ",
               " sfdaent = sfmcent AND sfdadocno = sfmc008 AND sfdastus <> 'X' ",
               " AND  sfmcent=",g_enterprise," AND sfmcsite='",g_site,"'",
               "   AND sfmcdocno='",g_sfma.sfmadocno,"'"
              ,"   AND sfmc008 IS NOT NULL"   #181128-00027#1 add  #有發退料單號的才需要處理
   PREPARE s_asft350_unconfirm_ungen_pre FROM l_sql
   DECLARE s_asft350_unconfirm_ungen_cs CURSOR FOR s_asft350_unconfirm_ungen_pre
   FOREACH s_asft350_unconfirm_ungen_cs INTO l_sfmc008,l_sfdastus
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF 
      #取消过账
      IF l_sfdastus = 'S' THEN
         #200722-00013#1---mark---s
         #IF NOT s_asft310_unpost_upd(l_sfmc008) THEN  
         #   RETURN r_success
         #ELSE  
         ##181128-00027#1 add-s
         #ELSE
         #   #過帳還原成功後繼續做取消確認
         #   IF NOT s_asft310_unconfirm_upd(l_sfmc008) THEN 
         #      RETURN r_success
         #   END IF
         ##181128-00027#1 add-e
         #END IF
         #200722-00013#1---mark---e
         #200722-00013#1---add---s
         IF s_asft310_unpost_chk(l_sfmc008) THEN
            IF s_asft310_unpost_upd(l_sfmc008) THEN
               IF s_asft310_unconfirm_chk(l_sfmc008) THEN
                  IF NOT s_asft310_unconfirm_upd(l_sfmc008) THEN
                     RETURN r_success
                  END IF
               ELSE
                  RETURN r_success               
               END IF
            ELSE
               RETURN r_success            
            END IF   
         ELSE
            RETURN r_success         
         END IF
         #200722-00013#1---add---e
      END IF    
      IF l_sfdastus = 'Y' THEN
         #取消确认
         #200722-00013#1---mark---s
         #IF NOT s_asft310_unconfirm_upd(l_sfmc008) THEN 
         #   RETURN r_success
         #END IF
         #200722-00013#1---mark---e
         #200722-00013#1---add---s
         IF s_asft310_unconfirm_chk(l_sfmc008) THEN
            IF NOT s_asft310_unconfirm_upd(l_sfmc008) THEN
               RETURN r_success
            END IF
         ELSE
            RETURN r_success               
         END IF
         #200722-00013#1---add---e         
      END IF 
      #180408-00009#1---mod---end---
      #作废产生的领退料单
      UPDATE sfda_t SET sfdastus = 'X' WHERE sfdaent = g_enterprise AND sfdasite = g_site AND sfdadocno = l_sfmc008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfda_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      #清空sfmc008 领退料单号
      UPDATE sfmc_t SET sfmc008='' WHERE sfmcent=g_enterprise AND sfmcsite=g_site 
         AND sfmcdocno=g_sfma.sfmadocno AND sfmc008=l_sfmc008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfmc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
   END FOREACH
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

PUBLIC FUNCTION s_asft350_ws_confirm(p_sfmadocno)
DEFINE p_sfmadocno     LIKE sfma_t.sfmadocno
DEFINE r_success       LIKE type_t.num5

   #確認前檢核段
   CALL s_asft350_confirm(p_sfmadocno) RETURNING r_success

RETURN r_success
END FUNCTION
#170425-00017#1 add
#产生发退料单单身
PUBLIC FUNCTION s_asft350_confirm_gen_detail(p_sfmadocno,p_sfdadocno_1,p_sfdadocno_2)
DEFINE p_sfdadocno_1  LIKE sfda_t.sfdadocno   #发料单号
DEFINE p_sfdadocno_2  LIKE sfda_t.sfdadocno   #退料单号
DEFINE p_sfmadocno LIKE sfma_t.sfmadocno
DEFINE r_success           LIKE type_t.num5
#161109-00085#58-s
#DEFINE l_sfda              RECORD LIKE sfda_t.*
DEFINE l_sfda RECORD  #發退料單頭檔
       sfdaent LIKE sfda_t.sfdaent, #企業編號
       sfdasite LIKE sfda_t.sfdasite, #營運據點
       sfdadocno LIKE sfda_t.sfdadocno, #發退料單號
       sfdadocdt LIKE sfda_t.sfdadocdt, #單據日期
       sfda001 LIKE sfda_t.sfda001, #過帳日期
       sfda002 LIKE sfda_t.sfda002, #發退料類別
       sfda003 LIKE sfda_t.sfda003, #生產部門
       sfda004 LIKE sfda_t.sfda004, #申請人
       sfda005 LIKE sfda_t.sfda005, #PBI編號
       sfda006 LIKE sfda_t.sfda006, #生產料號
       sfda007 LIKE sfda_t.sfda007, #BOM特性
       sfda008 LIKE sfda_t.sfda008, #產品特徵
       sfda009 LIKE sfda_t.sfda009, #生產控制組
       sfda010 LIKE sfda_t.sfda010, #作業編號
       sfda011 LIKE sfda_t.sfda011, #作業序
       sfda012 LIKE sfda_t.sfda012, #庫位
       sfda013 LIKE sfda_t.sfda013, #套數
       sfda014 LIKE sfda_t.sfda014, #來源單號
       sfda015 LIKE sfda_t.sfda015, #來源類型
       sfdaownid LIKE sfda_t.sfdaownid, #資料所有者
       sfdaowndp LIKE sfda_t.sfdaowndp, #資料所屬部門
       sfdacrtid LIKE sfda_t.sfdacrtid, #資料建立者
       sfdacrtdp LIKE sfda_t.sfdacrtdp, #資料建立部門
       sfdacrtdt LIKE sfda_t.sfdacrtdt, #資料創建日
       sfdamodid LIKE sfda_t.sfdamodid, #資料修改者
       sfdamoddt LIKE sfda_t.sfdamoddt, #最近修改日
       sfdacnfid LIKE sfda_t.sfdacnfid, #資料確認者
       sfdacnfdt LIKE sfda_t.sfdacnfdt, #資料確認日
       sfdapstid LIKE sfda_t.sfdapstid, #資料過帳者
       sfdapstdt LIKE sfda_t.sfdapstdt, #資料過帳日
       sfdastus LIKE sfda_t.sfdastus, #狀態碼
       sfdaud001 LIKE sfda_t.sfdaud001, #自定義欄位(文字)001
       sfdaud002 LIKE sfda_t.sfdaud002, #自定義欄位(文字)002
       sfdaud003 LIKE sfda_t.sfdaud003, #自定義欄位(文字)003
       sfdaud004 LIKE sfda_t.sfdaud004, #自定義欄位(文字)004
       sfdaud005 LIKE sfda_t.sfdaud005, #自定義欄位(文字)005
       sfdaud006 LIKE sfda_t.sfdaud006, #自定義欄位(文字)006
       sfdaud007 LIKE sfda_t.sfdaud007, #自定義欄位(文字)007
       sfdaud008 LIKE sfda_t.sfdaud008, #自定義欄位(文字)008
       sfdaud009 LIKE sfda_t.sfdaud009, #自定義欄位(文字)009
       sfdaud010 LIKE sfda_t.sfdaud010, #自定義欄位(文字)010
       sfdaud011 LIKE sfda_t.sfdaud011, #自定義欄位(數字)011
       sfdaud012 LIKE sfda_t.sfdaud012, #自定義欄位(數字)012
       sfdaud013 LIKE sfda_t.sfdaud013, #自定義欄位(數字)013
       sfdaud014 LIKE sfda_t.sfdaud014, #自定義欄位(數字)014
       sfdaud015 LIKE sfda_t.sfdaud015, #自定義欄位(數字)015
       sfdaud016 LIKE sfda_t.sfdaud016, #自定義欄位(數字)016
       sfdaud017 LIKE sfda_t.sfdaud017, #自定義欄位(數字)017
       sfdaud018 LIKE sfda_t.sfdaud018, #自定義欄位(數字)018
       sfdaud019 LIKE sfda_t.sfdaud019, #自定義欄位(數字)019
       sfdaud020 LIKE sfda_t.sfdaud020, #自定義欄位(數字)020
       sfdaud021 LIKE sfda_t.sfdaud021, #自定義欄位(日期時間)021
       sfdaud022 LIKE sfda_t.sfdaud022, #自定義欄位(日期時間)022
       sfdaud023 LIKE sfda_t.sfdaud023, #自定義欄位(日期時間)023
       sfdaud024 LIKE sfda_t.sfdaud024, #自定義欄位(日期時間)024
       sfdaud025 LIKE sfda_t.sfdaud025, #自定義欄位(日期時間)025
       sfdaud026 LIKE sfda_t.sfdaud026, #自定義欄位(日期時間)026
       sfdaud027 LIKE sfda_t.sfdaud027, #自定義欄位(日期時間)027
       sfdaud028 LIKE sfda_t.sfdaud028, #自定義欄位(日期時間)028
       sfdaud029 LIKE sfda_t.sfdaud029, #自定義欄位(日期時間)029
       sfdaud030 LIKE sfda_t.sfdaud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfdc              RECORD LIKE sfdc_t.*
DEFINE l_sfdc RECORD  #發退料需求檔
       sfdcent LIKE sfdc_t.sfdcent, #企業編號
       sfdcsite LIKE sfdc_t.sfdcsite, #營運據點
       sfdcdocno LIKE sfdc_t.sfdcdocno, #發退料單號
       sfdcseq LIKE sfdc_t.sfdcseq, #項次
       sfdc001 LIKE sfdc_t.sfdc001, #工單單號
       sfdc002 LIKE sfdc_t.sfdc002, #工單項次
       sfdc003 LIKE sfdc_t.sfdc003, #工單項序
       sfdc004 LIKE sfdc_t.sfdc004, #需求料號
       sfdc005 LIKE sfdc_t.sfdc005, #產品特徵
       sfdc006 LIKE sfdc_t.sfdc006, #單位
       sfdc007 LIKE sfdc_t.sfdc007, #申請數量
       sfdc008 LIKE sfdc_t.sfdc008, #實際數量
       sfdc009 LIKE sfdc_t.sfdc009, #參考單位
       sfdc010 LIKE sfdc_t.sfdc010, #參考單位需求數量
       sfdc011 LIKE sfdc_t.sfdc011, #參考單位實際數量
       sfdc012 LIKE sfdc_t.sfdc012, #指定庫位
       sfdc013 LIKE sfdc_t.sfdc013, #指定儲位
       sfdc014 LIKE sfdc_t.sfdc014, #指定批號
       sfdc015 LIKE sfdc_t.sfdc015, #理由碼
       sfdc016 LIKE sfdc_t.sfdc016, #庫存管理特徴
       sfdc017 LIKE sfdc_t.sfdc017, #正負
       sfdcud001 LIKE sfdc_t.sfdcud001, #自定義欄位(文字)001
       sfdcud002 LIKE sfdc_t.sfdcud002, #自定義欄位(文字)002
       sfdcud003 LIKE sfdc_t.sfdcud003, #自定義欄位(文字)003
       sfdcud004 LIKE sfdc_t.sfdcud004, #自定義欄位(文字)004
       sfdcud005 LIKE sfdc_t.sfdcud005, #自定義欄位(文字)005
       sfdcud006 LIKE sfdc_t.sfdcud006, #自定義欄位(文字)006
       sfdcud007 LIKE sfdc_t.sfdcud007, #自定義欄位(文字)007
       sfdcud008 LIKE sfdc_t.sfdcud008, #自定義欄位(文字)008
       sfdcud009 LIKE sfdc_t.sfdcud009, #自定義欄位(文字)009
       sfdcud010 LIKE sfdc_t.sfdcud010, #自定義欄位(文字)010
       sfdcud011 LIKE sfdc_t.sfdcud011, #自定義欄位(數字)011
       sfdcud012 LIKE sfdc_t.sfdcud012, #自定義欄位(數字)012
       sfdcud013 LIKE sfdc_t.sfdcud013, #自定義欄位(數字)013
       sfdcud014 LIKE sfdc_t.sfdcud014, #自定義欄位(數字)014
       sfdcud015 LIKE sfdc_t.sfdcud015, #自定義欄位(數字)015
       sfdcud016 LIKE sfdc_t.sfdcud016, #自定義欄位(數字)016
       sfdcud017 LIKE sfdc_t.sfdcud017, #自定義欄位(數字)017
       sfdcud018 LIKE sfdc_t.sfdcud018, #自定義欄位(數字)018
       sfdcud019 LIKE sfdc_t.sfdcud019, #自定義欄位(數字)019
       sfdcud020 LIKE sfdc_t.sfdcud020, #自定義欄位(數字)020
       sfdcud021 LIKE sfdc_t.sfdcud021, #自定義欄位(日期時間)021
       sfdcud022 LIKE sfdc_t.sfdcud022, #自定義欄位(日期時間)022
       sfdcud023 LIKE sfdc_t.sfdcud023, #自定義欄位(日期時間)023
       sfdcud024 LIKE sfdc_t.sfdcud024, #自定義欄位(日期時間)024
       sfdcud025 LIKE sfdc_t.sfdcud025, #自定義欄位(日期時間)025
       sfdcud026 LIKE sfdc_t.sfdcud026, #自定義欄位(日期時間)026
       sfdcud027 LIKE sfdc_t.sfdcud027, #自定義欄位(日期時間)027
       sfdcud028 LIKE sfdc_t.sfdcud028, #自定義欄位(日期時間)028
       sfdcud029 LIKE sfdc_t.sfdcud029, #自定義欄位(日期時間)029
       sfdcud030 LIKE sfdc_t.sfdcud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfdd              RECORD LIKE sfdd_t.*
DEFINE l_sfdd RECORD  #發退料明細檔
       sfddent LIKE sfdd_t.sfddent, #企業編號
       sfddsite LIKE sfdd_t.sfddsite, #營運據點
       sfdddocno LIKE sfdd_t.sfdddocno, #發退料單號
       sfddseq LIKE sfdd_t.sfddseq, #項次
       sfddseq1 LIKE sfdd_t.sfddseq1, #項序
       sfdd001 LIKE sfdd_t.sfdd001, #發退料料號
       sfdd002 LIKE sfdd_t.sfdd002, #替代率
       sfdd003 LIKE sfdd_t.sfdd003, #庫位
       sfdd004 LIKE sfdd_t.sfdd004, #儲位
       sfdd005 LIKE sfdd_t.sfdd005, #批號
       sfdd006 LIKE sfdd_t.sfdd006, #單位
       sfdd007 LIKE sfdd_t.sfdd007, #數量
       sfdd008 LIKE sfdd_t.sfdd008, #參考單位
       sfdd009 LIKE sfdd_t.sfdd009, #參考單位數量
       sfdd010 LIKE sfdd_t.sfdd010, #庫存管理特徵
       sfdd011 LIKE sfdd_t.sfdd011, #包裝容器
       sfdd012 LIKE sfdd_t.sfdd012, #正負
       sfdd013 LIKE sfdd_t.sfdd013, #產品特徵
       sfddud001 LIKE sfdd_t.sfddud001, #自定義欄位(文字)001
       sfddud002 LIKE sfdd_t.sfddud002, #自定義欄位(文字)002
       sfddud003 LIKE sfdd_t.sfddud003, #自定義欄位(文字)003
       sfddud004 LIKE sfdd_t.sfddud004, #自定義欄位(文字)004
       sfddud005 LIKE sfdd_t.sfddud005, #自定義欄位(文字)005
       sfddud006 LIKE sfdd_t.sfddud006, #自定義欄位(文字)006
       sfddud007 LIKE sfdd_t.sfddud007, #自定義欄位(文字)007
       sfddud008 LIKE sfdd_t.sfddud008, #自定義欄位(文字)008
       sfddud009 LIKE sfdd_t.sfddud009, #自定義欄位(文字)009
       sfddud010 LIKE sfdd_t.sfddud010, #自定義欄位(文字)010
       sfddud011 LIKE sfdd_t.sfddud011, #自定義欄位(數字)011
       sfddud012 LIKE sfdd_t.sfddud012, #自定義欄位(數字)012
       sfddud013 LIKE sfdd_t.sfddud013, #自定義欄位(數字)013
       sfddud014 LIKE sfdd_t.sfddud014, #自定義欄位(數字)014
       sfddud015 LIKE sfdd_t.sfddud015, #自定義欄位(數字)015
       sfddud016 LIKE sfdd_t.sfddud016, #自定義欄位(數字)016
       sfddud017 LIKE sfdd_t.sfddud017, #自定義欄位(數字)017
       sfddud018 LIKE sfdd_t.sfddud018, #自定義欄位(數字)018
       sfddud019 LIKE sfdd_t.sfddud019, #自定義欄位(數字)019
       sfddud020 LIKE sfdd_t.sfddud020, #自定義欄位(數字)020
       sfddud021 LIKE sfdd_t.sfddud021, #自定義欄位(日期時間)021
       sfddud022 LIKE sfdd_t.sfddud022, #自定義欄位(日期時間)022
       sfddud023 LIKE sfdd_t.sfddud023, #自定義欄位(日期時間)023
       sfddud024 LIKE sfdd_t.sfddud024, #自定義欄位(日期時間)024
       sfddud025 LIKE sfdd_t.sfddud025, #自定義欄位(日期時間)025
       sfddud026 LIKE sfdd_t.sfddud026, #自定義欄位(日期時間)026
       sfddud027 LIKE sfdd_t.sfddud027, #自定義欄位(日期時間)027
       sfddud028 LIKE sfdd_t.sfddud028, #自定義欄位(日期時間)028
       sfddud029 LIKE sfdd_t.sfddud029, #自定義欄位(日期時間)029
       sfddud030 LIKE sfdd_t.sfddud030, #自定義欄位(日期時間)030
       sfdd014 LIKE sfdd_t.sfdd014, #備置量
       sfdd015 LIKE sfdd_t.sfdd015  #在揀量
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfmb              RECORD LIKE sfmb_t.*
DEFINE l_sfmb RECORD  #耗料盤存檔點單身檔
       sfmb001 LIKE sfmb_t.sfmb001, #料件編號
       sfmb002 LIKE sfmb_t.sfmb002, #產品特徵
       sfmb003 LIKE sfmb_t.sfmb003, #庫位
       sfmb004 LIKE sfmb_t.sfmb004, #儲位
       sfmb005 LIKE sfmb_t.sfmb005, #批號
       sfmb006 LIKE sfmb_t.sfmb006, #庫存特徵
       sfmb007 LIKE sfmb_t.sfmb007, #單位
       sfmb010 LIKE sfmb_t.sfmb010  #參考單位
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfmc              RECORD LIKE sfmc_t.*
DEFINE l_sfmc RECORD  #耗料盤存分攤單身檔
       sfmcseq LIKE sfmc_t.sfmcseq, #項次
       sfmc001 LIKE sfmc_t.sfmc001, #工單單號
       sfmc003 LIKE sfmc_t.sfmc003, #工單項次
       sfmc004 LIKE sfmc_t.sfmc004, #工單項序
       sfmc006 LIKE sfmc_t.sfmc006, #分攤數量
       sfmc007 LIKE sfmc_t.sfmc007  #分攤參考數量
END RECORD
#161109-00085#58-e
DEFINE l_n1                LIKE type_t.num5
DEFINE l_n2                LIKE type_t.num5
DEFINE l_sql               STRING
DEFINE l_success           LIKE type_t.num5
DEFINE l_slip              LIKE ooba_t.ooba002
DEFINE l_sfdadocno_1       LIKE sfda_t.sfdadocno
DEFINE l_sfdadocno_2       LIKE sfda_t.sfdadocno
DEFINE l_sfdacrtdt         DATETIME YEAR TO SECOND  #资料建立日期
DEFINE l_qty               LIKE sfdd_t.sfdd014   #161202-00012#1-add
DEFINE l_para              LIKE type_t.chr1
DEFINE l_sfmcseq_o         LIKE sfmc_t.sfmcseq #210329-00022#1 add
DEFINE l_base0070          LIKE type_t.chr1    #210329-00022#1 add

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   #210329-00022#1---add----str---
   #效能優化 FOREACH內的改成EXECUTE
   #(1)
   LET l_sql = "SELECT sfmb001,sfmb002,sfmb003,sfmb004,sfmb005,sfmb006,sfmb007,sfmb010 ",
               "  FROM sfmb_t ",
               " WHERE sfmbent = ",g_enterprise,
               "   AND sfmbsite = '",g_site,"'",   
               "   AND sfmbdocno = '",p_sfmadocno,"'",
               "   AND sfmbseq = ? "
   PREPARE s_asft350_confirm_gen_pre5 FROM l_sql 
   LET l_sfmcseq_o = NULL   
   
   #(2)
   LET l_sql = "INSERT INTO sfdc_t(sfdcent,sfdcsite,sfdcdocno,sfdcseq,sfdc001,sfdc002,sfdc003,sfdc004,sfdc005,sfdc006, ",
               "                   sfdc007,sfdc008,sfdc009,sfdc010,sfdc011,sfdc012,sfdc013,sfdc014,sfdc015,sfdc016, ",
               "                   sfdc017,sfdcud001,sfdcud002,sfdcud003,sfdcud004,sfdcud005,sfdcud006,sfdcud007,sfdcud008,sfdcud009, ",
               "                   sfdcud010,sfdcud011,sfdcud012,sfdcud013,sfdcud014,sfdcud015,sfdcud016,sfdcud017,sfdcud018,sfdcud019, ",
               "                   sfdcud020,sfdcud021,sfdcud022,sfdcud023,sfdcud024,sfdcud025,sfdcud026,sfdcud027,sfdcud028,sfdcud029, ",
               "                   sfdcud030 ) ",
               " VALUES( ",
               " ?,?,?,?,?,",#1
               " ?,?,?,?,?,",#2
               " ?,?,?,?,?,",#3
               " ?,?,?,?,?,",#4
               " ?,?,?,?,?,",#5
               " ?,?,?,?,?,",#6
               " ?,?,?,?,?,",#7
               " ?,?,?,?,?,",#8
               " ?,?,?,?,?,",#9
               " ?,?,?,?,?,",#10
               " ? ",        
               " ) "
   PREPARE s_asft350_ins_sfdc FROM l_sql
   
   #(3)
   LET l_sql = "INSERT INTO sfdd_t(sfddent,sfddsite,sfdddocno,sfddseq,sfddseq1,sfdd001,sfdd002,sfdd003,sfdd004,sfdd005, ",
               "                   sfdd006,sfdd007,sfdd008,sfdd009,sfdd010,sfdd011,sfdd012,sfdd013,sfddud001,sfddud002, ",
               "                   sfddud003,sfddud004,sfddud005,sfddud006,sfddud007,sfddud008,sfddud009,sfddud010,sfddud011,sfddud012, ",
               "                   sfddud013,sfddud014,sfddud015,sfddud016,sfddud017,sfddud018,sfddud019,sfddud020,sfddud021,sfddud022, ",
               "                   sfddud023,sfddud024,sfddud025,sfddud026,sfddud027,sfddud028,sfddud029,sfddud030,sfdd014,sfdd015 ) ",
               " VALUES( ",
               " ?,?,?,?,?,",#1
               " ?,?,?,?,?,",#2
               " ?,?,?,?,?,",#3
               " ?,?,?,?,?,",#4
               " ?,?,?,?,?,",#5
               " ?,?,?,?,?,",#6
               " ?,?,?,?,?,",#7
               " ?,?,?,?,?,",#8
               " ?,?,?,?,?,",#9
               " ?,?,?,?,? ",#10       
               " ) "
    PREPARE s_asft350_ins_sfdd FROM l_sql

   #210329-00022#1---add----end---   


   LET l_sql = "SELECT sfmcseq,sfmc001,sfmc003,sfmc004,sfmc006,sfmc007",
               "  FROM sfmc_t",
               " WHERE sfmcent=",g_enterprise," AND sfmcsite='",g_site,"'",

               "   AND sfmcdocno='",p_sfmadocno,"' AND sfmc006 <> 0"
              ," ORDER BY sfmcseq " #210329-00022#1 add
   PREPARE s_asft350_confirm_gen_pre4 FROM l_sql
   DECLARE s_asft350_confirm_gen_cs4 CURSOR FOR s_asft350_confirm_gen_pre4
   
   FOREACH s_asft350_confirm_gen_cs4 
      INTO l_sfmc.sfmcseq,l_sfmc.sfmc001,l_sfmc.sfmc003,l_sfmc.sfmc004,l_sfmc.sfmc006,l_sfmc.sfmc007
   #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      #161005-00025#1 add---start---
#      IF l_sfmc.sfmc006 = 0 THEN
#         CONTINUE FOREACH
#      END IF
      #161005-00025#1 add---end---
     #210329-00022#1---mark---str---
     #效能優化:往FOREACH 外搬,且l_sfmc.sfmcseq <>時,再重取
     ##161109-00085#58-s
     ##SELECT * INTO l_sfmb.* FROM sfmb_t WHERE sfmbent=g_enterprise AND sfmbsite=g_site  
     #SELECT sfmb001,sfmb002,sfmb003,sfmb004,sfmb005,sfmb006,sfmb007,sfmb010
     #  INTO l_sfmb.sfmb001,l_sfmb.sfmb002,l_sfmb.sfmb003,l_sfmb.sfmb004,l_sfmb.sfmb005,
     #       l_sfmb.sfmb006,l_sfmb.sfmb007,l_sfmb.sfmb010
     #  FROM sfmb_t WHERE sfmbent=g_enterprise AND sfmbsite=g_site       
     ##161109-00085#58-e
     #   AND sfmbdocno=p_sfmadocno AND sfmbseq=l_sfmc.sfmcseq
     #210329-00022#1---mark---end---
     #210329-00022#1---add----str---
     IF cl_null(l_sfmcseq_o) OR l_sfmc.sfmcseq <> l_sfmcseq_o THEN
         INITIALIZE l_sfmb TO NULL
         EXECUTE s_asft350_confirm_gen_pre5 USING l_sfmc.sfmcseq
              INTO l_sfmb.sfmb001,l_sfmb.sfmb002,l_sfmb.sfmb003,l_sfmb.sfmb004,l_sfmb.sfmb005,
                   l_sfmb.sfmb006,l_sfmb.sfmb007,l_sfmb.sfmb010
     END IF
     LET l_sfmcseq_o = l_sfmc.sfmcseq
     #210329-00022#1---add----end---
      ##发料退料单sfdc_t
      LET l_sfdc.sfdcent = g_enterprise 
      LET l_sfdc.sfdcsite = g_site
      IF l_sfmc.sfmc006 > 0 THEN
         LET l_sfdc.sfdcdocno = p_sfdadocno_1
         #SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND srdcdocno=l_sfdc.sfdcdocno  #161005-00025#1 mark
         SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND sfdcdocno=l_sfdc.sfdcdocno   #161005-00025#1 add
         IF cl_null(l_sfdc.sfdcseq) OR l_sfdc.sfdcseq = 0 THEN
            LET l_sfdc.sfdcseq = 1
         ELSE
            LET l_sfdc.sfdcseq = l_sfdc.sfdcseq + 1
         END IF
         LET l_sfdc.sfdc017 = -1
      END IF
      IF l_sfmc.sfmc006 < 0 THEN
         LET l_sfdc.sfdcdocno = p_sfdadocno_2
         #SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND srdcdocno=l_sfdc.sfdcdocno  #161005-00025#1 mark
         SELECT MAX(sfdcseq) INTO l_sfdc.sfdcseq FROM sfdc_t WHERE sfdcent=g_enterprise AND sfdcsite=g_site AND sfdcdocno=l_sfdc.sfdcdocno   #161005-00025#1 add
         IF cl_null(l_sfdc.sfdcseq) OR l_sfdc.sfdcseq = 0 THEN
            LET l_sfdc.sfdcseq = 1
         ELSE
            LET l_sfdc.sfdcseq = l_sfdc.sfdcseq + 1
         END IF
         LET l_sfdc.sfdc017 = 1
      END IF
      LET l_sfdc.sfdc001 = l_sfmc.sfmc001
      LET l_sfdc.sfdc002 = l_sfmc.sfmc003
      LET l_sfdc.sfdc003 = l_sfmc.sfmc004
      LET l_sfdc.sfdc004 = l_sfmb.sfmb001
      LET l_sfdc.sfdc005 = l_sfmb.sfmb002
      LET l_sfdc.sfdc006 = l_sfmb.sfmb007
      LET l_sfdc.sfdc007 = l_sfmc.sfmc006 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc008 = l_sfmc.sfmc006 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc009 = l_sfmb.sfmb010
      LET l_sfdc.sfdc010 = l_sfmc.sfmc007 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc011 = l_sfmc.sfmc007 * l_sfdc.sfdc017 * (-1)
      LET l_sfdc.sfdc012 = l_sfmb.sfmb003
      LET l_sfdc.sfdc013 = l_sfmb.sfmb004
      LET l_sfdc.sfdc014 = l_sfmb.sfmb005
      LET l_sfdc.sfdc015 = ''
      LET l_sfdc.sfdc016 = l_sfmb.sfmb006
     
     #210329-00022#1---mark---str--- 
     #效能優化     
     ##161109-00085#58-s
     ##INSERT INTO sfdc_t VALUES l_sfdc.*
     #INSERT INTO sfdc_t(sfdcent,sfdcsite,sfdcdocno,sfdcseq,sfdc001,sfdc002,sfdc003,sfdc004,sfdc005,sfdc006,
     #                   sfdc007,sfdc008,sfdc009,sfdc010,sfdc011,sfdc012,sfdc013,sfdc014,sfdc015,sfdc016,
     #                   sfdc017,sfdcud001,sfdcud002,sfdcud003,sfdcud004,sfdcud005,sfdcud006,sfdcud007,sfdcud008,sfdcud009,
     #                   sfdcud010,sfdcud011,sfdcud012,sfdcud013,sfdcud014,sfdcud015,sfdcud016,sfdcud017,sfdcud018,sfdcud019,
     #                   sfdcud020,sfdcud021,sfdcud022,sfdcud023,sfdcud024,sfdcud025,sfdcud026,sfdcud027,sfdcud028,sfdcud029,
     #                   sfdcud030 )
     #VALUES (l_sfdc.sfdcent,l_sfdc.sfdcsite,l_sfdc.sfdcdocno,l_sfdc.sfdcseq,l_sfdc.sfdc001,
     #        l_sfdc.sfdc002,l_sfdc.sfdc003,l_sfdc.sfdc004,l_sfdc.sfdc005,l_sfdc.sfdc006,
     #        l_sfdc.sfdc007,l_sfdc.sfdc008,l_sfdc.sfdc009,l_sfdc.sfdc010,l_sfdc.sfdc011,
     #        l_sfdc.sfdc012,l_sfdc.sfdc013,l_sfdc.sfdc014,l_sfdc.sfdc015,l_sfdc.sfdc016,
     #        l_sfdc.sfdc017,l_sfdc.sfdcud001,l_sfdc.sfdcud002,l_sfdc.sfdcud003,l_sfdc.sfdcud004,
     #        l_sfdc.sfdcud005,l_sfdc.sfdcud006,l_sfdc.sfdcud007,l_sfdc.sfdcud008,l_sfdc.sfdcud009,
     #        l_sfdc.sfdcud010,l_sfdc.sfdcud011,l_sfdc.sfdcud012,l_sfdc.sfdcud013,l_sfdc.sfdcud014,
     #        l_sfdc.sfdcud015,l_sfdc.sfdcud016,l_sfdc.sfdcud017,l_sfdc.sfdcud018,l_sfdc.sfdcud019,
     #        l_sfdc.sfdcud020,l_sfdc.sfdcud021,l_sfdc.sfdcud022,l_sfdc.sfdcud023,l_sfdc.sfdcud024,
     #        l_sfdc.sfdcud025,l_sfdc.sfdcud026,l_sfdc.sfdcud027,l_sfdc.sfdcud028,l_sfdc.sfdcud029,
     #        l_sfdc.sfdcud030)
     ##161109-00085#58-e
     #210329-00022#1---mark---end---
     #210329-00022#1---add----str---
      EXECUTE s_asft350_ins_sfdc USING l_sfdc.sfdcent,l_sfdc.sfdcsite,l_sfdc.sfdcdocno,l_sfdc.sfdcseq,l_sfdc.sfdc001,
              l_sfdc.sfdc002,l_sfdc.sfdc003,l_sfdc.sfdc004,l_sfdc.sfdc005,l_sfdc.sfdc006,
              l_sfdc.sfdc007,l_sfdc.sfdc008,l_sfdc.sfdc009,l_sfdc.sfdc010,l_sfdc.sfdc011,
              l_sfdc.sfdc012,l_sfdc.sfdc013,l_sfdc.sfdc014,l_sfdc.sfdc015,l_sfdc.sfdc016,
              l_sfdc.sfdc017,l_sfdc.sfdcud001,l_sfdc.sfdcud002,l_sfdc.sfdcud003,l_sfdc.sfdcud004,
              l_sfdc.sfdcud005,l_sfdc.sfdcud006,l_sfdc.sfdcud007,l_sfdc.sfdcud008,l_sfdc.sfdcud009,
              l_sfdc.sfdcud010,l_sfdc.sfdcud011,l_sfdc.sfdcud012,l_sfdc.sfdcud013,l_sfdc.sfdcud014,
              l_sfdc.sfdcud015,l_sfdc.sfdcud016,l_sfdc.sfdcud017,l_sfdc.sfdcud018,l_sfdc.sfdcud019,
              l_sfdc.sfdcud020,l_sfdc.sfdcud021,l_sfdc.sfdcud022,l_sfdc.sfdcud023,l_sfdc.sfdcud024,
              l_sfdc.sfdcud025,l_sfdc.sfdcud026,l_sfdc.sfdcud027,l_sfdc.sfdcud028,l_sfdc.sfdcud029,
              l_sfdc.sfdcud030
     #210329-00022#1---add----end---
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfdc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
      
      #发料退料明细档sfdd_t
      LET l_sfdd.sfddent = g_enterprise
      LET l_sfdd.sfddsite = g_site
      LET l_sfdd.sfdddocno = l_sfdc.sfdcdocno
      LET l_sfdd.sfddseq = l_sfdc.sfdcseq
      LET l_sfdd.sfddseq1 = 1
      LET l_sfdd.sfdd001 = l_sfdc.sfdc004
      LET l_sfdd.sfdd013 = l_sfdc.sfdc005  #140930 add
      LET l_sfdd.sfdd002 = 1
      LET l_sfdd.sfdd003 = l_sfdc.sfdc012
      LET l_sfdd.sfdd004 = l_sfdc.sfdc013
      LET l_sfdd.sfdd005 = l_sfdc.sfdc014
      LET l_sfdd.sfdd006 = l_sfdc.sfdc006
      LET l_sfdd.sfdd007 = l_sfdc.sfdc008
      LET l_sfdd.sfdd008 = l_sfdc.sfdc009
      LET l_sfdd.sfdd009 = l_sfdc.sfdc011
      LET l_sfdd.sfdd010 = l_sfdc.sfdc016
      LET l_sfdd.sfdd011 = ''
      LET l_sfdd.sfdd012 = l_sfdc.sfdc017      
      #161202-00012#1-add-s
      CALL s_asft310_get_sfbb008_sfbb009(l_sfdc.sfdc001,l_sfdc.sfdc002,l_sfdc.sfdc003,l_sfdc.sfdc004,l_sfdc.sfdc005,l_sfdc.sfdc016,l_sfdc.sfdc012,l_sfdc.sfdc013,l_sfdc.sfdc014,l_sfdc.sfdc006)
           RETURNING l_qty
      IF l_sfdd.sfdd007 >= l_qty THEN 
         LET l_sfdd.sfdd014 = l_qty
      ELSE   
         LET l_sfdd.sfdd014 = l_sfdd.sfdd007 
      END IF
      LET l_sfdd.sfdd015 = l_sfdd.sfdd007 - l_sfdd.sfdd014
      #161202-00012#1-add-e
      
     #210329-00022#1---mark---str--- 
     #效能優化
     ##161109-00085#58-s
     ##INSERT INTO sfdd_t VALUES l_sfdd.*
     #INSERT INTO sfdd_t(sfddent,sfddsite,sfdddocno,sfddseq,sfddseq1,sfdd001,sfdd002,sfdd003,sfdd004,sfdd005,
     #                   sfdd006,sfdd007,sfdd008,sfdd009,sfdd010,sfdd011,sfdd012,sfdd013,sfddud001,sfddud002,
     #                   sfddud003,sfddud004,sfddud005,sfddud006,sfddud007,sfddud008,sfddud009,sfddud010,sfddud011,sfddud012,
     #                   sfddud013,sfddud014,sfddud015,sfddud016,sfddud017,sfddud018,sfddud019,sfddud020,sfddud021,sfddud022,
     #                   sfddud023,sfddud024,sfddud025,sfddud026,sfddud027,sfddud028,sfddud029,sfddud030,sfdd014,sfdd015 )
     #           VALUES (l_sfdd.sfddent,l_sfdd.sfddsite,l_sfdd.sfdddocno,l_sfdd.sfddseq,l_sfdd.sfddseq1,
     #                   l_sfdd.sfdd001,l_sfdd.sfdd002,l_sfdd.sfdd003,l_sfdd.sfdd004,l_sfdd.sfdd005,
     #                   l_sfdd.sfdd006,l_sfdd.sfdd007,l_sfdd.sfdd008,l_sfdd.sfdd009,l_sfdd.sfdd010,
     #                   l_sfdd.sfdd011,l_sfdd.sfdd012,l_sfdd.sfdd013,l_sfdd.sfddud001,l_sfdd.sfddud002,
     #                   l_sfdd.sfddud003,l_sfdd.sfddud004,l_sfdd.sfddud005,l_sfdd.sfddud006,l_sfdd.sfddud007,
     #                   l_sfdd.sfddud008,l_sfdd.sfddud009,l_sfdd.sfddud010,l_sfdd.sfddud011,l_sfdd.sfddud012,
     #                   l_sfdd.sfddud013,l_sfdd.sfddud014,l_sfdd.sfddud015,l_sfdd.sfddud016,l_sfdd.sfddud017,
     #                   l_sfdd.sfddud018,l_sfdd.sfddud019,l_sfdd.sfddud020,l_sfdd.sfddud021,l_sfdd.sfddud022,
     #                   l_sfdd.sfddud023,l_sfdd.sfddud024,l_sfdd.sfddud025,l_sfdd.sfddud026,l_sfdd.sfddud027,
     #                   l_sfdd.sfddud028,l_sfdd.sfddud029,l_sfdd.sfddud030,l_sfdd.sfdd014,l_sfdd.sfdd015)
     ##161109-00085#58-e
     #210329-00022#1---mark---end---
     #210329-00022#1---add----str---
      EXECUTE s_asft350_ins_sfdd USING l_sfdd.sfddent,l_sfdd.sfddsite,l_sfdd.sfdddocno,l_sfdd.sfddseq,l_sfdd.sfddseq1,
                         l_sfdd.sfdd001,l_sfdd.sfdd002,l_sfdd.sfdd003,l_sfdd.sfdd004,l_sfdd.sfdd005,
                         l_sfdd.sfdd006,l_sfdd.sfdd007,l_sfdd.sfdd008,l_sfdd.sfdd009,l_sfdd.sfdd010,
                         l_sfdd.sfdd011,l_sfdd.sfdd012,l_sfdd.sfdd013,l_sfdd.sfddud001,l_sfdd.sfddud002,
                         l_sfdd.sfddud003,l_sfdd.sfddud004,l_sfdd.sfddud005,l_sfdd.sfddud006,l_sfdd.sfddud007,
                         l_sfdd.sfddud008,l_sfdd.sfddud009,l_sfdd.sfddud010,l_sfdd.sfddud011,l_sfdd.sfddud012,
                         l_sfdd.sfddud013,l_sfdd.sfddud014,l_sfdd.sfddud015,l_sfdd.sfddud016,l_sfdd.sfddud017,
                         l_sfdd.sfddud018,l_sfdd.sfddud019,l_sfdd.sfddud020,l_sfdd.sfddud021,l_sfdd.sfddud022,
                         l_sfdd.sfddud023,l_sfdd.sfddud024,l_sfdd.sfddud025,l_sfdd.sfddud026,l_sfdd.sfddud027,
                         l_sfdd.sfddud028,l_sfdd.sfddud029,l_sfdd.sfddud030,l_sfdd.sfdd014,l_sfdd.sfdd015 
     #210329-00022#1---add----end---     
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfdd_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success
      END IF
   END FOREACH    
            
   IF NOT cl_null(p_sfdadocno_1) THEN
      IF NOT s_asft350_confirm_gen_sfde_sfdf(p_sfdadocno_1,-1) THEN
         RETURN r_success
      END IF
   END IF
   
   IF NOT cl_null(p_sfdadocno_2) THEN
      IF NOT s_asft350_confirm_gen_sfde_sfdf(p_sfdadocno_2,1) THEN
         RETURN r_success
      END IF
   END IF  

   
   IF NOT cl_null(p_sfdadocno_1) THEN
     #210329-00022#1--add---str---
      CALL s_aooi200_get_slip(p_sfdadocno_1) RETURNING l_success,l_slip
      IF NOT l_success THEN
         RETURN r_success
      END IF
      LET l_para = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0083')
      LET l_base0070 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0070') #出庫單據考慮在揀量
      IF cl_null(l_base0070) THEN
          LET l_base0070 = 'N'
      END IF
      IF l_base0070 = 'Y' THEN #出庫單據考慮在揀量的s_asft310_confirm_chk()才需要重跑,因為在揀要做s_inventory_check_inan(),不在揀的,在s_asft350_confirm_split()已check過
     #210329-00022#1--add---end--
         #將產生的領料單、退料單做確認、過帳
         #180817-00009#1 add --s
         IF NOT s_asft310_confirm_chk(p_sfdadocno_1) THEN
            RETURN r_success
         END IF
         #180817-00009#1 add --e
      END IF #210329-00022#1 add
      IF NOT s_asft310_confirm_upd(p_sfdadocno_1) THEN
         RETURN r_success
      END IF
     #210329-00022#1---mark---str---
     #往上搬
     #CALL s_aooi200_get_slip(p_sfdadocno_1) RETURNING l_success,l_slip
     #IF NOT l_success THEN
     #   RETURN r_success
     #END IF
     #LET l_para = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0083')
     #210329-00022#1---mark---end---
      #根据参数判断是否自动过账 
      IF l_para = 'Y' THEN
         #180116-00050#1 add---start---
         SELECT sfda001 INTO l_sfda.sfda001
           FROM sfda_t
          WHERE sfdaent = g_enterprise
            AND sfdasite = g_site
            AND sfdadocno = p_sfdadocno_1
         #180116-00050#1 add---end---
         #180817-00009#1 add --s
         IF NOT s_asft310_post_chk(p_sfdadocno_1) THEN
            RETURN r_success
         END IF
         #180817-00009#1 add --e
         IF NOT s_asft310_post_upd(p_sfdadocno_1,l_sfda.sfda001) THEN
            RETURN r_success
         END IF
      END IF
      #更新sfmc007，领退料单号
      UPDATE sfmc_t SET sfmc008=p_sfdadocno_1 WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=p_sfmadocno AND sfmc006>0
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfmc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
   
         RETURN r_success
      END IF
   END IF
      
   IF NOT cl_null(p_sfdadocno_2) THEN
      #將產生的領料單、退料單做確認、過帳
     #210329-00022#1--mark---str---
     #入庫與在揀無關,這邊不需要重覆
     ##180817-00009#1 add --s
     #IF NOT s_asft310_confirm_chk(p_sfdadocno_2) THEN
     #   RETURN r_success
     #END IF
     ##180817-00009#1 add --e
     #210329-00022#1--mark---end---
      IF NOT s_asft310_confirm_upd(p_sfdadocno_2) THEN
         RETURN r_success
      END IF
      CALL s_aooi200_get_slip(p_sfdadocno_2) RETURNING l_success,l_slip
      IF NOT l_success THEN
         RETURN r_success
      END IF
      LET l_para = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0083')
      #根据参数判断是否自动过账 
      IF l_para = 'Y' THEN
         #180116-00050#1 add---start---
         SELECT sfda001 INTO l_sfda.sfda001
           FROM sfda_t
          WHERE sfdaent = g_enterprise
            AND sfdasite = g_site
            AND sfdadocno = p_sfdadocno_2
         #180116-00050#1 add---end---
         #180817-00009#1 add --s
         IF NOT s_asft310_post_chk(p_sfdadocno_2) THEN
            RETURN r_success
         END IF
         #180817-00009#1 add --e
         IF NOT s_asft310_post_upd(p_sfdadocno_2,l_sfda.sfda001) THEN
            RETURN r_success
         END IF
      END IF
      #更新sfmc007，领退料单号
      UPDATE sfmc_t SET sfmc008=p_sfdadocno_2 WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=g_sfma.sfmadocno AND sfmc006<0
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfmc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
   
         RETURN r_success
      END IF
   END IF   
   
   CALL s_asft350_confirm_gen_inao(p_sfmadocno)  #190304-00007#1 add
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION
#170425-00017#1 add
#产生发退料单身失败,则删除单头资料,并且还原asft350本单据状态码
PUBLIC FUNCTION s_asft350_roll_back(p_sfmadocno,p_sfdadocno_1,p_sfdadocno_2)
DEFINE p_sfmadocno LIKE sfma_t.sfmadocno
DEFINE l_para  LIKE type_t.chr1
DEFINE p_sfdadocno_1 LIKE sfda_t.sfdadocno
DEFINE p_sfdadocno_2 LIKE sfda_t.sfdadocno
DEFINE r_success  LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   LET l_para = cl_get_para(g_enterprise,g_site,'S-COM-0002')
   #判断当前据点设定参数是否需要单据编号连号
   IF l_para = 'Y' THEN
      #作废发退料单
      UPDATE sfda_t SET sfdastus = 'X'
                  WHERE sfdaent = g_enterprise
                   AND (sfdadocno = p_sfdadocno_1 OR sfdadocno = p_sfdadocno_2)
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfda_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
   ELSE
      #删除发退料单
      DELETE FROM sfda_t 
       WHERE sfdaent = g_enterprise
         AND (sfdadocno = p_sfdadocno_1 OR sfdadocno = p_sfdadocno_2)
       IF SQLCA.SQLCODE THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "DELETE sfda_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()
          RETURN r_success
       END IF
   END IF
   
   #更新本单据状态码为'N'
   UPDATE sfma_t SET sfmastus = 'N'
               WHERE sfmaent = g_enterprise
                 AND sfmadocno = p_sfmadocno
   IF SQLCA.SQLCODE THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = "DELETE sfma_t"
       LET g_errparam.popup = TRUE
       CALL cl_err()
       RETURN r_success
    END IF
    
    LET r_success = TRUE
    RETURN r_success
END FUNCTION
#170425-00017#1 add
#审核效能问题,拆分出来的审核段
PUBLIC FUNCTION s_asft350_confirm_split(p_sfmadocno)
DEFINE p_sfmadocno          LIKE sfma_t.sfmadocno
DEFINE r_success            LIKE type_t.num5
DEFINE l_close_dd           LIKE sfma_t.sfmadocdt
DEFINE l_time               DATETIME YEAR TO SECOND
DEFINE l_sql                STRING 
#161109-00085#58-s
#DEFINE l_sfmb              RECORD LIKE sfmb_t.*
DEFINE l_sfmb RECORD  #耗料盤存檔點單身檔
       sfmbseq LIKE sfmb_t.sfmbseq, #項次
       sfmb008 LIKE sfmb_t.sfmb008, #帳面數量
       sfmb009 LIKE sfmb_t.sfmb009, #盤點數量
       sfmb011 LIKE sfmb_t.sfmb011, #參考帳面數量
       sfmb012 LIKE sfmb_t.sfmb012  #參考盤點數量
END RECORD
#161109-00085#58-e
DEFINE l_sfmc006            LIKE sfmc_t.sfmc006
DEFINE l_sfmc007            LIKE sfmc_t.sfmc007
DEFINE l_flag               LIKE type_t.chr1
DEFINE r_sfdadocno_1        LIKE sfda_t.sfdadocno 
DEFINE r_sfdadocno_2        LIKE sfda_t.sfdadocno 
#181106-00010#1 add --start--
DEFINE l_sfmc RECORD  #耗料盤存分攤單身檔
       sfmcseq1 LIKE sfmc_t.sfmcseq1, #項序
       sfmc001  LIKE sfmc_t.sfmc001,  #工單單號
       sfmc003  LIKE sfmc_t.sfmc003,  #工單項次
       sfmc004  LIKE sfmc_t.sfmc004   #工單項序
END RECORD
DEFINE l_sfaastus           LIKE sfaa_t.sfaastus
#181106-00010#1 add --end--
DEFINE l_max_sfmc001        LIKE sfmc_t.sfmc001 #210329-00022#1 add

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   LET r_sfdadocno_1 = '' 
   LET r_sfdadocno_2 = '' 
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
   END IF
   
   #检查：盘点单号不可为空
   IF cl_null(p_sfmadocno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00534'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
   END IF
   
   #161109-00085#58-s
   #SELECT * INTO g_sfma.* FROM sfma_t WHERE sfmaent=g_enterprise AND sfmasite=g_site AND sfmadocno=p_sfmadocno
   SELECT sfmadocno,sfmadocdt,sfma001,sfma002,sfma003,sfma004,sfma005,sfmastus
     INTO g_sfma.sfmadocno,g_sfma.sfmadocdt,g_sfma.sfma001,g_sfma.sfma002,g_sfma.sfma003,
          g_sfma.sfma004,g_sfma.sfma005,g_sfma.sfmastus
     FROM sfma_t
    WHERE sfmaent=g_enterprise AND sfmasite=g_site AND sfmadocno=p_sfmadocno
   #161109-00085#58-e
   #状态需为‘N’才可以确认
   IF g_sfma.sfmastus != 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00535'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
   END IF
   
   #盘点日期不可小于关账日期
   LET l_close_dd = cl_get_para(g_enterprise,g_site,'S-MFG-0031')
   #IF g_sfma.sfmadocdt < l_close_dd OR g_sfma.sfma002 < l_close_dd OR g_sfma.sfma003 < l_close_dd THEN #201208-00036#1 mark
   IF g_sfma.sfmadocdt <= l_close_dd OR g_sfma.sfma002 <= l_close_dd OR g_sfma.sfma003 <= l_close_dd THEN #201208-00036#1 add
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00008'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
   END IF
   
   #有盤點數量且差異數量不等於0的，分攤數需全部等於差異數
   #161109-00085#58-s
   #LET l_sql = "SELECT * FROM sfmb_t WHERE sfmbent=",g_enterprise," AND sfmbsite='",g_site,"'",
   LET l_sql = "SELECT sfmbseq,sfmb008,sfmb009,sfmb011,sfmb012 ",
               "  FROM sfmb_t ",
               " WHERE sfmbent=",g_enterprise,
               "   AND sfmbsite='",g_site,"'",
   #161109-00085#58-e
               "   AND sfmbdocno='",g_sfma.sfmadocno,"' AND sfmb008 IS NOT NULL AND sfmb009 IS NOT NULL AND sfmb008!=sfmb009"
   PREPARE s_asft350_confirm_pre2 FROM l_sql
   DECLARE s_asft350_confirm_cs2 CURSOR FOR s_asft350_confirm_pre2
  #210329-00022#1---mark---str---
  ##181106-00010#1 add --start--
  #LET l_sql = "SELECT sfmcseq1,sfmc001,sfmc003,sfmc004 ",
  #            "  FROM sfmc_t ",
  #            " WHERE sfmcent=",g_enterprise," AND sfmcsite='",g_site,"'",
  #            "   AND sfmcdocno='",g_sfma.sfmadocno,"'",
  #            "   AND sfmcseq=? "
  #PREPARE s_asft350_confirm_pre3 FROM l_sql
  #DECLARE s_asft350_confirm_cs3 CURSOR FOR s_asft350_confirm_pre3
  ##181106-00010#1 add --end--
  #210329-00022#1---mark---end--- 
  #210329-00022#1---add----str---
  #asf-00931的檢核,改為一次性的寫法
  #asf-00931:工單單號需存在於asft300，且為已發出的資料
   LET l_max_sfmc001 = NULL
   SELECT MAX(sfmc001)   #抓任一筆,只要有,就報錯
     INTO l_max_sfmc001
     FROM sfaa_t,sfmc_t
    WHERE sfaadocno = sfmc001
      AND sfaaent = g_enterprise
      AND sfaaent = sfmcent
      AND sfmcdocno = g_sfma.sfmadocno
      AND sfaastus <> 'F'      
   IF NOT cl_null(l_max_sfmc001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00931'
      LET g_errparam.extend = l_max_sfmc001
      LET g_errparam.popup = TRUE
      CALL cl_err()   
      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2      
   END IF
   #原本在s_asft310.4gl內#160905-00022#3 axc-00401的檢查,在此做一次性的檢查
   #後續可以省略s_asft310.4gl 的檢查
   LET l_max_sfmc001 = NULL
   SELECT MAX(sfmc001) #抓任一筆,只要有,就報錯
     INTO l_max_sfmc001
     FROM sfmc_t
    WHERE sfmcdocno = g_sfma.sfmadocno
      AND sfmcent = g_enterprise
      AND NOT EXISTS (SELECT 1 FROM sfaa_t
                       WHERE sfaaent = g_enterprise
                         AND sfaaent = sfmcent
                         AND sfaadocno = sfmc001
                      )
   IF NOT cl_null(l_max_sfmc001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'als-00083' #工單號不存在！
      LET g_errparam.extend = l_max_sfmc001
      LET g_errparam.coll_vals[4] = l_max_sfmc001
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
   END IF
    
  #210329-00022#1---add----end---
   LET l_flag = 'N'
   #161109-00085#58-s
   #FOREACH s_asft350_confirm_cs INTO l_sfmb.*
   FOREACH s_asft350_confirm_cs2 
      INTO l_sfmb.sfmbseq,l_sfmb.sfmb008,l_sfmb.sfmb009,l_sfmb.sfmb011,l_sfmb.sfmb012
   #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
      END IF   
      LET l_flag = 'Y'
     #210329-00022#1 mark---str---
     ##181106-00010#1 add --start--
     #FOREACH s_asft350_confirm_cs3 USING l_sfmb.sfmbseq
     #   INTO l_sfmc.sfmcseq1,l_sfmc.sfmc001,l_sfmc.sfmc003,l_sfmc.sfmc004
     #   IF SQLCA.sqlcode THEN
     #      INITIALIZE g_errparam TO NULL
     #      LET g_errparam.code = SQLCA.sqlcode
     #      LET g_errparam.extend = "FOREACH:s_asft350_confirm_cs3"
     #      LET g_errparam.popup = TRUE
     #      CALL cl_err()
     #  
     #      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
     #   END IF
     #   
     #   SELECT sfaastus 
     #     INTO l_sfaastus
     #     FROM sfaa_t,sfba_t
     #    WHERE sfaaent   = sfbaent 
     #      AND sfaadocno = sfbadocno
     #      AND sfaaent   = g_enterprise
     #      AND sfaasite  = g_site
     #      AND sfaadocno = l_sfmc.sfmc001
     #      AND sfbaseq   = l_sfmc.sfmc003
     #      AND sfbaseq1  = l_sfmc.sfmc004
     #   
     #   IF l_sfaastus <> 'F' THEN
     #      INITIALIZE g_errparam TO NULL
     #      LET g_errparam.code = 'asf-00931'
     #      LET g_errparam.extend = l_sfmc.sfmc001
     #      LET g_errparam.popup = TRUE
     #      CALL cl_err()
     #
     #      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2
     #   END IF
     #END FOREACH
     ##181106-00010#1 add --end--
     #210329-00022#1 mark---end---
      
      
      SELECT SUM(sfmc006) INTO l_sfmc006 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site
         AND sfmcdocno=g_sfma.sfmadocno AND sfmcseq=l_sfmb.sfmbseq
      IF l_sfmb.sfmb008 - l_sfmb.sfmb009 != l_sfmc006 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00496'
         LET g_errparam.extend = l_sfmb.sfmbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
      END IF
      IF NOT cl_null(l_sfmb.sfmb011) AND NOT cl_null(l_sfmb.sfmb012) THEN
         SELECT SUM(sfmc007) INTO l_sfmc007 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site
            AND sfmcdocno=g_sfma.sfmadocno AND sfmcseq=l_sfmb.sfmbseq
         IF l_sfmb.sfmb011 - l_sfmb.sfmb012 != l_sfmc007 THEN
            INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00496'
         LET g_errparam.extend = l_sfmb.sfmbseq
         LET g_errparam.popup = TRUE
         CALL cl_err()

            RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 #
         END IF
      END IF
   END FOREACH
   
   IF l_flag = 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00566'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
   END IF
   
   #更新状态码为Y
   LET l_time = cl_get_current()
   UPDATE sfma_t SET sfmastus = 'Y',sfmacnfid = g_user,sfmacnfdt = l_time
    WHERE sfmaent = g_enterprise AND sfmasite = g_site AND sfmadocno = g_sfma.sfmadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00034'
      LET g_errparam.extend = g_sfma.sfmadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
   END IF
   
   #产生领料单或退料单及相关资料，并审核过账，最后更行sfmc008
    CALL s_asft350_confirm_gen_split() RETURNING r_success,r_sfdadocno_1,r_sfdadocno_2
    IF NOT r_success THEN
       RETURN r_success,r_sfdadocno_1,r_sfdadocno_2
    END IF

   
   LET r_success = TRUE
   RETURN r_success,r_sfdadocno_1,r_sfdadocno_2 
END FUNCTION
#170425-00017#1 add
#产生发料单,退料单单头
PUBLIC FUNCTION s_asft350_confirm_gen_split()
DEFINE r_success           LIKE type_t.num5
#161109-00085#58-s
#DEFINE l_sfda              RECORD LIKE sfda_t.*
DEFINE l_sfda RECORD  #發退料單頭檔
       sfdaent LIKE sfda_t.sfdaent, #企業編號
       sfdasite LIKE sfda_t.sfdasite, #營運據點
       sfdadocno LIKE sfda_t.sfdadocno, #發退料單號
       sfdadocdt LIKE sfda_t.sfdadocdt, #單據日期
       sfda001 LIKE sfda_t.sfda001, #過帳日期
       sfda002 LIKE sfda_t.sfda002, #發退料類別
       sfda003 LIKE sfda_t.sfda003, #生產部門
       sfda004 LIKE sfda_t.sfda004, #申請人
       sfda005 LIKE sfda_t.sfda005, #PBI編號
       sfda006 LIKE sfda_t.sfda006, #生產料號
       sfda007 LIKE sfda_t.sfda007, #BOM特性
       sfda008 LIKE sfda_t.sfda008, #產品特徵
       sfda009 LIKE sfda_t.sfda009, #生產控制組
       sfda010 LIKE sfda_t.sfda010, #作業編號
       sfda011 LIKE sfda_t.sfda011, #作業序
       sfda012 LIKE sfda_t.sfda012, #庫位
       sfda013 LIKE sfda_t.sfda013, #套數
       sfda014 LIKE sfda_t.sfda014, #來源單號
       sfda015 LIKE sfda_t.sfda015, #來源類型
       sfdaownid LIKE sfda_t.sfdaownid, #資料所有者
       sfdaowndp LIKE sfda_t.sfdaowndp, #資料所屬部門
       sfdacrtid LIKE sfda_t.sfdacrtid, #資料建立者
       sfdacrtdp LIKE sfda_t.sfdacrtdp, #資料建立部門
       sfdacrtdt LIKE sfda_t.sfdacrtdt, #資料創建日
       sfdamodid LIKE sfda_t.sfdamodid, #資料修改者
       sfdamoddt LIKE sfda_t.sfdamoddt, #最近修改日
       sfdacnfid LIKE sfda_t.sfdacnfid, #資料確認者
       sfdacnfdt LIKE sfda_t.sfdacnfdt, #資料確認日
       sfdapstid LIKE sfda_t.sfdapstid, #資料過帳者
       sfdapstdt LIKE sfda_t.sfdapstdt, #資料過帳日
       sfdastus LIKE sfda_t.sfdastus, #狀態碼
       sfdaud001 LIKE sfda_t.sfdaud001, #自定義欄位(文字)001
       sfdaud002 LIKE sfda_t.sfdaud002, #自定義欄位(文字)002
       sfdaud003 LIKE sfda_t.sfdaud003, #自定義欄位(文字)003
       sfdaud004 LIKE sfda_t.sfdaud004, #自定義欄位(文字)004
       sfdaud005 LIKE sfda_t.sfdaud005, #自定義欄位(文字)005
       sfdaud006 LIKE sfda_t.sfdaud006, #自定義欄位(文字)006
       sfdaud007 LIKE sfda_t.sfdaud007, #自定義欄位(文字)007
       sfdaud008 LIKE sfda_t.sfdaud008, #自定義欄位(文字)008
       sfdaud009 LIKE sfda_t.sfdaud009, #自定義欄位(文字)009
       sfdaud010 LIKE sfda_t.sfdaud010, #自定義欄位(文字)010
       sfdaud011 LIKE sfda_t.sfdaud011, #自定義欄位(數字)011
       sfdaud012 LIKE sfda_t.sfdaud012, #自定義欄位(數字)012
       sfdaud013 LIKE sfda_t.sfdaud013, #自定義欄位(數字)013
       sfdaud014 LIKE sfda_t.sfdaud014, #自定義欄位(數字)014
       sfdaud015 LIKE sfda_t.sfdaud015, #自定義欄位(數字)015
       sfdaud016 LIKE sfda_t.sfdaud016, #自定義欄位(數字)016
       sfdaud017 LIKE sfda_t.sfdaud017, #自定義欄位(數字)017
       sfdaud018 LIKE sfda_t.sfdaud018, #自定義欄位(數字)018
       sfdaud019 LIKE sfda_t.sfdaud019, #自定義欄位(數字)019
       sfdaud020 LIKE sfda_t.sfdaud020, #自定義欄位(數字)020
       sfdaud021 LIKE sfda_t.sfdaud021, #自定義欄位(日期時間)021
       sfdaud022 LIKE sfda_t.sfdaud022, #自定義欄位(日期時間)022
       sfdaud023 LIKE sfda_t.sfdaud023, #自定義欄位(日期時間)023
       sfdaud024 LIKE sfda_t.sfdaud024, #自定義欄位(日期時間)024
       sfdaud025 LIKE sfda_t.sfdaud025, #自定義欄位(日期時間)025
       sfdaud026 LIKE sfda_t.sfdaud026, #自定義欄位(日期時間)026
       sfdaud027 LIKE sfda_t.sfdaud027, #自定義欄位(日期時間)027
       sfdaud028 LIKE sfda_t.sfdaud028, #自定義欄位(日期時間)028
       sfdaud029 LIKE sfda_t.sfdaud029, #自定義欄位(日期時間)029
       sfdaud030 LIKE sfda_t.sfdaud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfdc              RECORD LIKE sfdc_t.*
DEFINE l_sfdc RECORD  #發退料需求檔
       sfdcent LIKE sfdc_t.sfdcent, #企業編號
       sfdcsite LIKE sfdc_t.sfdcsite, #營運據點
       sfdcdocno LIKE sfdc_t.sfdcdocno, #發退料單號
       sfdcseq LIKE sfdc_t.sfdcseq, #項次
       sfdc001 LIKE sfdc_t.sfdc001, #工單單號
       sfdc002 LIKE sfdc_t.sfdc002, #工單項次
       sfdc003 LIKE sfdc_t.sfdc003, #工單項序
       sfdc004 LIKE sfdc_t.sfdc004, #需求料號
       sfdc005 LIKE sfdc_t.sfdc005, #產品特徵
       sfdc006 LIKE sfdc_t.sfdc006, #單位
       sfdc007 LIKE sfdc_t.sfdc007, #申請數量
       sfdc008 LIKE sfdc_t.sfdc008, #實際數量
       sfdc009 LIKE sfdc_t.sfdc009, #參考單位
       sfdc010 LIKE sfdc_t.sfdc010, #參考單位需求數量
       sfdc011 LIKE sfdc_t.sfdc011, #參考單位實際數量
       sfdc012 LIKE sfdc_t.sfdc012, #指定庫位
       sfdc013 LIKE sfdc_t.sfdc013, #指定儲位
       sfdc014 LIKE sfdc_t.sfdc014, #指定批號
       sfdc015 LIKE sfdc_t.sfdc015, #理由碼
       sfdc016 LIKE sfdc_t.sfdc016, #庫存管理特徴
       sfdc017 LIKE sfdc_t.sfdc017, #正負
       sfdcud001 LIKE sfdc_t.sfdcud001, #自定義欄位(文字)001
       sfdcud002 LIKE sfdc_t.sfdcud002, #自定義欄位(文字)002
       sfdcud003 LIKE sfdc_t.sfdcud003, #自定義欄位(文字)003
       sfdcud004 LIKE sfdc_t.sfdcud004, #自定義欄位(文字)004
       sfdcud005 LIKE sfdc_t.sfdcud005, #自定義欄位(文字)005
       sfdcud006 LIKE sfdc_t.sfdcud006, #自定義欄位(文字)006
       sfdcud007 LIKE sfdc_t.sfdcud007, #自定義欄位(文字)007
       sfdcud008 LIKE sfdc_t.sfdcud008, #自定義欄位(文字)008
       sfdcud009 LIKE sfdc_t.sfdcud009, #自定義欄位(文字)009
       sfdcud010 LIKE sfdc_t.sfdcud010, #自定義欄位(文字)010
       sfdcud011 LIKE sfdc_t.sfdcud011, #自定義欄位(數字)011
       sfdcud012 LIKE sfdc_t.sfdcud012, #自定義欄位(數字)012
       sfdcud013 LIKE sfdc_t.sfdcud013, #自定義欄位(數字)013
       sfdcud014 LIKE sfdc_t.sfdcud014, #自定義欄位(數字)014
       sfdcud015 LIKE sfdc_t.sfdcud015, #自定義欄位(數字)015
       sfdcud016 LIKE sfdc_t.sfdcud016, #自定義欄位(數字)016
       sfdcud017 LIKE sfdc_t.sfdcud017, #自定義欄位(數字)017
       sfdcud018 LIKE sfdc_t.sfdcud018, #自定義欄位(數字)018
       sfdcud019 LIKE sfdc_t.sfdcud019, #自定義欄位(數字)019
       sfdcud020 LIKE sfdc_t.sfdcud020, #自定義欄位(數字)020
       sfdcud021 LIKE sfdc_t.sfdcud021, #自定義欄位(日期時間)021
       sfdcud022 LIKE sfdc_t.sfdcud022, #自定義欄位(日期時間)022
       sfdcud023 LIKE sfdc_t.sfdcud023, #自定義欄位(日期時間)023
       sfdcud024 LIKE sfdc_t.sfdcud024, #自定義欄位(日期時間)024
       sfdcud025 LIKE sfdc_t.sfdcud025, #自定義欄位(日期時間)025
       sfdcud026 LIKE sfdc_t.sfdcud026, #自定義欄位(日期時間)026
       sfdcud027 LIKE sfdc_t.sfdcud027, #自定義欄位(日期時間)027
       sfdcud028 LIKE sfdc_t.sfdcud028, #自定義欄位(日期時間)028
       sfdcud029 LIKE sfdc_t.sfdcud029, #自定義欄位(日期時間)029
       sfdcud030 LIKE sfdc_t.sfdcud030  #自定義欄位(日期時間)030
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfdd              RECORD LIKE sfdd_t.*
DEFINE l_sfdd RECORD  #發退料明細檔
       sfddent LIKE sfdd_t.sfddent, #企業編號
       sfddsite LIKE sfdd_t.sfddsite, #營運據點
       sfdddocno LIKE sfdd_t.sfdddocno, #發退料單號
       sfddseq LIKE sfdd_t.sfddseq, #項次
       sfddseq1 LIKE sfdd_t.sfddseq1, #項序
       sfdd001 LIKE sfdd_t.sfdd001, #發退料料號
       sfdd002 LIKE sfdd_t.sfdd002, #替代率
       sfdd003 LIKE sfdd_t.sfdd003, #庫位
       sfdd004 LIKE sfdd_t.sfdd004, #儲位
       sfdd005 LIKE sfdd_t.sfdd005, #批號
       sfdd006 LIKE sfdd_t.sfdd006, #單位
       sfdd007 LIKE sfdd_t.sfdd007, #數量
       sfdd008 LIKE sfdd_t.sfdd008, #參考單位
       sfdd009 LIKE sfdd_t.sfdd009, #參考單位數量
       sfdd010 LIKE sfdd_t.sfdd010, #庫存管理特徵
       sfdd011 LIKE sfdd_t.sfdd011, #包裝容器
       sfdd012 LIKE sfdd_t.sfdd012, #正負
       sfdd013 LIKE sfdd_t.sfdd013, #產品特徵
       sfddud001 LIKE sfdd_t.sfddud001, #自定義欄位(文字)001
       sfddud002 LIKE sfdd_t.sfddud002, #自定義欄位(文字)002
       sfddud003 LIKE sfdd_t.sfddud003, #自定義欄位(文字)003
       sfddud004 LIKE sfdd_t.sfddud004, #自定義欄位(文字)004
       sfddud005 LIKE sfdd_t.sfddud005, #自定義欄位(文字)005
       sfddud006 LIKE sfdd_t.sfddud006, #自定義欄位(文字)006
       sfddud007 LIKE sfdd_t.sfddud007, #自定義欄位(文字)007
       sfddud008 LIKE sfdd_t.sfddud008, #自定義欄位(文字)008
       sfddud009 LIKE sfdd_t.sfddud009, #自定義欄位(文字)009
       sfddud010 LIKE sfdd_t.sfddud010, #自定義欄位(文字)010
       sfddud011 LIKE sfdd_t.sfddud011, #自定義欄位(數字)011
       sfddud012 LIKE sfdd_t.sfddud012, #自定義欄位(數字)012
       sfddud013 LIKE sfdd_t.sfddud013, #自定義欄位(數字)013
       sfddud014 LIKE sfdd_t.sfddud014, #自定義欄位(數字)014
       sfddud015 LIKE sfdd_t.sfddud015, #自定義欄位(數字)015
       sfddud016 LIKE sfdd_t.sfddud016, #自定義欄位(數字)016
       sfddud017 LIKE sfdd_t.sfddud017, #自定義欄位(數字)017
       sfddud018 LIKE sfdd_t.sfddud018, #自定義欄位(數字)018
       sfddud019 LIKE sfdd_t.sfddud019, #自定義欄位(數字)019
       sfddud020 LIKE sfdd_t.sfddud020, #自定義欄位(數字)020
       sfddud021 LIKE sfdd_t.sfddud021, #自定義欄位(日期時間)021
       sfddud022 LIKE sfdd_t.sfddud022, #自定義欄位(日期時間)022
       sfddud023 LIKE sfdd_t.sfddud023, #自定義欄位(日期時間)023
       sfddud024 LIKE sfdd_t.sfddud024, #自定義欄位(日期時間)024
       sfddud025 LIKE sfdd_t.sfddud025, #自定義欄位(日期時間)025
       sfddud026 LIKE sfdd_t.sfddud026, #自定義欄位(日期時間)026
       sfddud027 LIKE sfdd_t.sfddud027, #自定義欄位(日期時間)027
       sfddud028 LIKE sfdd_t.sfddud028, #自定義欄位(日期時間)028
       sfddud029 LIKE sfdd_t.sfddud029, #自定義欄位(日期時間)029
       sfddud030 LIKE sfdd_t.sfddud030, #自定義欄位(日期時間)030
       sfdd014 LIKE sfdd_t.sfdd014, #備置量
       sfdd015 LIKE sfdd_t.sfdd015  #在揀量
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfmb              RECORD LIKE sfmb_t.*
DEFINE l_sfmb RECORD  #耗料盤存檔點單身檔
       sfmb001 LIKE sfmb_t.sfmb001, #料件編號
       sfmb002 LIKE sfmb_t.sfmb002, #產品特徵
       sfmb003 LIKE sfmb_t.sfmb003, #庫位
       sfmb004 LIKE sfmb_t.sfmb004, #儲位
       sfmb005 LIKE sfmb_t.sfmb005, #批號
       sfmb006 LIKE sfmb_t.sfmb006, #庫存特徵
       sfmb007 LIKE sfmb_t.sfmb007, #單位
       sfmb010 LIKE sfmb_t.sfmb010  #參考單位
END RECORD
#161109-00085#58-e
#161109-00085#58-s
#DEFINE l_sfmc              RECORD LIKE sfmc_t.*
DEFINE l_sfmc RECORD  #耗料盤存分攤單身檔
       sfmcseq LIKE sfmc_t.sfmcseq, #項次
       sfmc001 LIKE sfmc_t.sfmc001, #工單單號
       sfmc003 LIKE sfmc_t.sfmc003, #工單項次
       sfmc004 LIKE sfmc_t.sfmc004, #工單項序
       sfmc006 LIKE sfmc_t.sfmc006, #分攤數量
       sfmc007 LIKE sfmc_t.sfmc007  #分攤參考數量
END RECORD
#161109-00085#58-e
DEFINE l_n1                LIKE type_t.num5
DEFINE l_n2                LIKE type_t.num5
DEFINE l_sql               STRING
DEFINE l_success           LIKE type_t.num5
DEFINE l_slip              LIKE ooba_t.ooba002
DEFINE l_sfdadocno_1       LIKE sfda_t.sfdadocno
DEFINE l_sfdadocno_2       LIKE sfda_t.sfdadocno
DEFINE l_sfdacrtdt         DATETIME YEAR TO SECOND  #资料建立日期
DEFINE l_qty               LIKE sfdd_t.sfdd014   #161202-00012#1-add
   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   CALL s_aooi200_get_slip(g_sfma.sfmadocno) RETURNING l_success,l_slip
   IF NOT l_success THEN
      RETURN r_success,l_sfdadocno_1,l_sfdadocno_2  
   END IF
     
   LET l_sfda.sfdaent = g_enterprise
   LET l_sfda.sfdasite = g_site
   LET l_sfda.sfdadocdt = g_sfma.sfmadocdt
   LET l_sfda.sfda001 = g_sfma.sfmadocdt
   LET l_sfda.sfda003 = g_dept
   LET l_sfda.sfda004 = g_user
   LET l_sfda.sfda012 = g_sfma.sfma004
   LET l_sfda.sfdaownid = g_user
   LET l_sfda.sfdaowndp = g_dept
   LET l_sfda.sfdacrtid = g_user
   LET l_sfda.sfdacrtdp = g_dept
   LET l_sfdacrtdt = cl_get_current()
   LET l_sfda.sfdamodid = ""
   LET l_sfda.sfdamoddt = ""
   LET l_sfda.sfdastus = "N" 
   
   #160122-00016#1 20160504 add by ming -----(S) 
   LET l_sfda.sfda014 = g_sfma.sfmadocno
   LET l_sfda.sfda015 = '03'               #03.盤點倒扣分攤作業 
   #160122-00016#1 20160504 add by ming -----(E) 
   
   #依盤點單別設定的參數"領料單單別"自動編碼
   SELECT COUNT(1) INTO l_n1 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=g_sfma.sfmadocno AND sfmc006>0
   SELECT COUNT(1) INTO l_n2 FROM sfmc_t WHERE sfmcent=g_enterprise AND sfmcsite=g_site AND sfmcdocno=g_sfma.sfmadocno AND sfmc006<0 
   IF l_n1 > 0 THEN
      LET l_sfdadocno_1 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0063')
      IF cl_null(l_sfdadocno_1) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00551'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2 
      END IF
      IF NOT s_aooi200_chk_slip(g_site,'',l_sfdadocno_1,'asft314') THEN
         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2  
      END IF
      CALL s_aooi200_gen_docno(g_site,l_sfdadocno_1,l_sfda.sfdadocdt,'asft314')
           RETURNING l_success,l_sfdadocno_1
      IF NOT l_success THEN
         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2  
      END IF
      LET l_sfda.sfdadocno = l_sfdadocno_1
      LET l_sfda.sfda002 = '14'
      #161109-00085#58-s
      #INSERT INTO sfda_t VALUES l_sfda.*
      INSERT INTO sfda_t(sfdaent,sfdasite,sfdadocno,sfdadocdt,sfda001,sfda002,sfda003,sfda004,sfda005,sfda006,
                         sfda007,sfda008,sfda009,sfda010,sfda011,sfda012,sfda013,sfda014,sfda015,sfdaownid,
                         sfdaowndp,sfdacrtid,sfdacrtdp,sfdacrtdt,sfdamodid,sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid,sfdapstdt,
                         sfdastus,sfdaud001,sfdaud002,sfdaud003,sfdaud004,sfdaud005,sfdaud006,sfdaud007,sfdaud008,sfdaud009,
                         sfdaud010,sfdaud011,sfdaud012,sfdaud013,sfdaud014,sfdaud015,sfdaud016,sfdaud017,sfdaud018,sfdaud019,
                         sfdaud020,sfdaud021,sfdaud022,sfdaud023,sfdaud024,sfdaud025,sfdaud026,sfdaud027,sfdaud028,sfdaud029,
                         sfdaud030) 
         VALUES (l_sfda.sfdaent,l_sfda.sfdasite,l_sfda.sfdadocno,l_sfda.sfdadocdt,l_sfda.sfda001,
                 l_sfda.sfda002,l_sfda.sfda003,l_sfda.sfda004,l_sfda.sfda005,l_sfda.sfda006,
                 l_sfda.sfda007,l_sfda.sfda008,l_sfda.sfda009,l_sfda.sfda010,l_sfda.sfda011,
                 l_sfda.sfda012,l_sfda.sfda013,l_sfda.sfda014,l_sfda.sfda015,l_sfda.sfdaownid,
                 l_sfda.sfdaowndp,l_sfda.sfdacrtid,l_sfda.sfdacrtdp,l_sfda.sfdacrtdt,l_sfda.sfdamodid,
                 l_sfda.sfdamoddt,l_sfda.sfdacnfid,l_sfda.sfdacnfdt,l_sfda.sfdapstid,l_sfda.sfdapstdt,
                 l_sfda.sfdastus,l_sfda.sfdaud001,l_sfda.sfdaud002,l_sfda.sfdaud003,l_sfda.sfdaud004,
                 l_sfda.sfdaud005,l_sfda.sfdaud006,l_sfda.sfdaud007,l_sfda.sfdaud008,l_sfda.sfdaud009,
                 l_sfda.sfdaud010,l_sfda.sfdaud011,l_sfda.sfdaud012,l_sfda.sfdaud013,l_sfda.sfdaud014,
                 l_sfda.sfdaud015,l_sfda.sfdaud016,l_sfda.sfdaud017,l_sfda.sfdaud018,l_sfda.sfdaud019,
                 l_sfda.sfdaud020,l_sfda.sfdaud021,l_sfda.sfdaud022,l_sfda.sfdaud023,l_sfda.sfdaud024,
                 l_sfda.sfdaud025,l_sfda.sfdaud026,l_sfda.sfdaud027,l_sfda.sfdaud028,l_sfda.sfdaud029,
                 l_sfda.sfdaud030)
      #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfda_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2 
      END IF
      UPDATE sfda_t SET sfdacrtdt=l_sfdacrtdt WHERE sfdaent=g_enterprise AND sfdadocno=l_sfdadocno_1
   END IF
   
   #依盤點單別設定的參數"退料單單別"自動編碼
   IF l_n2 > 0 THEN
      LET l_sfdadocno_2 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0064')
      IF cl_null(l_sfdadocno_2) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00551'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2 
      END IF
      IF NOT s_aooi200_chk_slip(g_site,'',l_sfdadocno_2,'asft324') THEN
         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2  
      END IF
      CALL s_aooi200_gen_docno(g_site,l_sfdadocno_2,l_sfda.sfdadocdt,'asft324')
           RETURNING l_success,l_sfdadocno_2
      IF NOT l_success THEN
         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2 
      END IF
      LET l_sfda.sfdadocno = l_sfdadocno_2
      LET l_sfda.sfda002 = '24'
      #161109-00085#58-s
      #INSERT INTO sfda_t VALUES l_sfda.*
      INSERT INTO sfda_t(sfdaent,sfdasite,sfdadocno,sfdadocdt,sfda001,sfda002,sfda003,sfda004,sfda005,sfda006,
                         sfda007,sfda008,sfda009,sfda010,sfda011,sfda012,sfda013,sfda014,sfda015,sfdaownid,
                         sfdaowndp,sfdacrtid,sfdacrtdp,sfdacrtdt,sfdamodid,sfdamoddt,sfdacnfid,sfdacnfdt,sfdapstid,sfdapstdt,
                         sfdastus,sfdaud001,sfdaud002,sfdaud003,sfdaud004,sfdaud005,sfdaud006,sfdaud007,sfdaud008,sfdaud009,
                         sfdaud010,sfdaud011,sfdaud012,sfdaud013,sfdaud014,sfdaud015,sfdaud016,sfdaud017,sfdaud018,sfdaud019,
                         sfdaud020,sfdaud021,sfdaud022,sfdaud023,sfdaud024,sfdaud025,sfdaud026,sfdaud027,sfdaud028,sfdaud029,
                         sfdaud030) 
         VALUES (l_sfda.sfdaent,l_sfda.sfdasite,l_sfda.sfdadocno,l_sfda.sfdadocdt,l_sfda.sfda001,
                 l_sfda.sfda002,l_sfda.sfda003,l_sfda.sfda004,l_sfda.sfda005,l_sfda.sfda006,
                 l_sfda.sfda007,l_sfda.sfda008,l_sfda.sfda009,l_sfda.sfda010,l_sfda.sfda011,
                 l_sfda.sfda012,l_sfda.sfda013,l_sfda.sfda014,l_sfda.sfda015,l_sfda.sfdaownid,
                 l_sfda.sfdaowndp,l_sfda.sfdacrtid,l_sfda.sfdacrtdp,l_sfda.sfdacrtdt,l_sfda.sfdamodid,
                 l_sfda.sfdamoddt,l_sfda.sfdacnfid,l_sfda.sfdacnfdt,l_sfda.sfdapstid,l_sfda.sfdapstdt,
                 l_sfda.sfdastus,l_sfda.sfdaud001,l_sfda.sfdaud002,l_sfda.sfdaud003,l_sfda.sfdaud004,
                 l_sfda.sfdaud005,l_sfda.sfdaud006,l_sfda.sfdaud007,l_sfda.sfdaud008,l_sfda.sfdaud009,
                 l_sfda.sfdaud010,l_sfda.sfdaud011,l_sfda.sfdaud012,l_sfda.sfdaud013,l_sfda.sfdaud014,
                 l_sfda.sfdaud015,l_sfda.sfdaud016,l_sfda.sfdaud017,l_sfda.sfdaud018,l_sfda.sfdaud019,
                 l_sfda.sfdaud020,l_sfda.sfdaud021,l_sfda.sfdaud022,l_sfda.sfdaud023,l_sfda.sfdaud024,
                 l_sfda.sfdaud025,l_sfda.sfdaud026,l_sfda.sfdaud027,l_sfda.sfdaud028,l_sfda.sfdaud029,
                 l_sfda.sfdaud030)
      #161109-00085#58-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfda_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN r_success,l_sfdadocno_1,l_sfdadocno_2  
      END IF
      UPDATE sfda_t SET sfdacrtdt=l_sfdacrtdt WHERE sfdaent=g_enterprise AND sfdadocno=l_sfdadocno_2
   END IF   
   LET r_success = TRUE
   RETURN r_success,l_sfdadocno_1,l_sfdadocno_2  
END FUNCTION

################################################################################
# Descriptions...: 批序號明細同步產生至發退料單的批序號檔
# Memo...........:
# Usage..........: CALL s_asft350_confirm_gen_inao(p_sfmadocno)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2020/01/16 By 10042
# Modify.........: #190304-00007#1 add
################################################################################
PUBLIC FUNCTION s_asft350_confirm_gen_inao(p_sfmadocno)
DEFINE p_sfmadocno  LIKE sfma_t.sfmadocno
DEFINE l_sql        STRING
DEFINE l_sfdcdocno  LIKE sfdc_t.sfdcdocno
DEFINE l_sfdcseq    LIKE sfdc_t.sfdcseq
DEFINE l_sfmcseq    LIKE sfmc_t.sfmcseq
DEFINE l_sfmcseq1   LIKE sfmc_t.sfmcseq1

   DELETE FROM inao_t
    WHERE inaoent = g_enterprise
      AND inaodocno IN (SELECT sfmc008 FROM sfmc_t WHERE sfmcent = inaoent AND sfmcdocno = p_sfmadocno)
   
   #inao000 = '1'
   LET l_sql = " INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,",
                                   " inaoseq2,inao000,inao001,inao002,inao003,",
                                   " inao004,inao005,inao006,inao007,inao008,",
                                   " inao009,inao010,inao011,inao012,inao013,",
                                   " inao014,inao020,inao021,inao022,inao023,",
                                   " inao024)",
               " SELECT inaoent,inaosite,?,?,0,",
                      " inaoseq2,'1',inao001,inao002,inao003,",
                      " inao004,inao005,inao006,inao007,inao008,",
                      " inao009,inao010,inao011,inao012,inao013,",
                      " inao014,inao020,inao021,inao022,inao023,",
                      " inao024",
               "   FROM inao_t",
               "  WHERE inaoent = ",g_enterprise,
               "    AND inaodocno = '",p_sfmadocno,"'",
               "    AND inaoseq = ?",
               "    AND inaoseq1 = ?"
   PREPARE gen_inao_1 FROM l_sql
   
   #inao000 = '2'
   LET l_sql = " INSERT INTO inao_t (inaoent,inaosite,inaodocno,inaoseq,inaoseq1,",
                                   " inaoseq2,inao000,inao001,inao002,inao003,",
                                   " inao004,inao005,inao006,inao007,inao008,",
                                   " inao009,inao010,inao011,inao012,inao013,",
                                   " inao014,inao020,inao021,inao022,inao023,",
                                   " inao024)",
               " SELECT inaoent,inaosite,?,?,1,",
                      " inaoseq2,'2',inao001,inao002,inao003,",
                      " inao004,inao005,inao006,inao007,inao008,",
                      " inao009,inao010,inao011,inao012,inao013,",
                      " inao014,inao020,inao021,inao022,inao023,",
                      " inao024",
               "   FROM inao_t",
               "  WHERE inaoent = ",g_enterprise,
               "    AND inaodocno = '",p_sfmadocno,"'",
               "    AND inaoseq = ?",
               "    AND inaoseq1 = ?"
   PREPARE gen_inao_2 FROM l_sql
   
   LET l_sql = " SELECT DISTINCT sfdcdocno,sfdcseq,sfmcseq,sfmcseq1",
               "   FROM sfdc_t,sfmc_t",
               "  WHERE sfdcent = sfmcent",
               "    AND sfdcdocno = sfmc008",
               "    AND sfdc001 = sfmc001",
               "    AND sfdc002 = sfmc003",
               "    AND sfdc003 = sfmc004",
               "    AND sfmcent = ",g_enterprise,
               "    AND sfmcdocno = '",p_sfmadocno,"'"
   PREPARE sel_sfdc_pre FROM l_sql
   DECLARE sel_sfdc_cur CURSOR FOR sel_sfdc_pre
   FOREACH sel_sfdc_cur INTO l_sfdcdocno,l_sfdcseq,l_sfmcseq,l_sfmcseq1
      EXECUTE gen_inao_1 USING l_sfdcdocno,l_sfdcseq,l_sfmcseq,l_sfmcseq1
      EXECUTE gen_inao_2 USING l_sfdcdocno,l_sfdcseq,l_sfmcseq,l_sfmcseq1
   END FOREACH
END FUNCTION

 
{</section>}
 
