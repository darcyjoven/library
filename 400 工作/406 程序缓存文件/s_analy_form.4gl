#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_analy_form.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0068(1900-01-01 00:00:00), PR版次:0068(2021-05-27 17:34:32)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000509
#+ Filename...: s_analy_form
#+ Description: 解析公式獲取金額
#+ Creator....: 02114(2014-05-12 13:56:42)
#+ Modifier...: 00000 -SD/PR- 11234
 
{</section>}
 
{<section id="s_analy_form.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150812-00010#3   15/08/28  By 03538   當設定公式為變量*數值的時候,增加辨認數值邏輯
#151013-00016#4   15/12/02  By Hans    新增合併報表公式
#160506-00012#1   16/05/10  By 02599   当表内项目没有设置公式时，赋值0
#160526-00035#1   16/05/27  By 02599   設定金額來源為：期初余額借貸(2,3)/期未餘額借貸(8,9)者，修改公式計算, 先依核算項GROUP SUM,依期余額判斷借貸余, 再作二次合計
#161128-00061#7   16/12/09  by 02481   标准程式定义采用宣告模式,弃用.*写法
#161215-00022#1   16/12/16  By 02114   抓取glfb005的公式时,要去掉前后空格
#170104-00043#1   17/01/06  By 01531   所有的据点一起查看，有部分据点的值都为0，单看该据点，则数据正常
#170304-00002#1   17/03/07  By 02114   解析变量公式有误
#170222-00003#1   17/03/10  By 01531   要排除年結和月結的數字
#170327-00047#1   17/03/29  By 02599   s_analy_from在抓取agli201变量时，按照项次排序
#170331-00072#1   170405    By albireo 排除CE傳票時要同時排除XC傳票
#170406-00082#1   170410    By albireo 排除CE+XC傳票時,應限制9類(xcea002=9)
#170418-00002#1   17/04/18  By Sabrina 當程式為aglq938時需將結轉金額扣除
#170419-00037#1   17/04/21  By 02114   抓总账变量笔数时,可能会抓到2笔,导致后续解析公式有误
#170510-00043#2   17/05/15  By 02599   程式优化
#170602-00004#1   17/06/02  By albireo #170419-00037#1 調整有誤,造成只有一筆的變量無法分辨為表內公式還是變量
#170623-00034#6   17/07/10  By Sabrina (1)調整aglq938操作畫面。比照aglp700增加年度、期別判斷
#                                      (2)取期末資料須為當期
#                                      (3)aglq938查詢時，若設定agli201設定[取述方式(glfc008)]="1:期初余额"，則直接取去年年末資料
#                                      (4)增加處理agli070時，錯誤訊息提示
#170816-00007#159 17/10/25 By 10043    調整公用元件錯誤訊息,顯示更明確的資訊內容
#180327-00033#1   18/03/28 By 05488    agli201的glfc013移除選項3，故在判斷glfc013時，也不可以有選項3改用程式代號去判斷總帳或是合併
#180327-00043#1   18/03/31 By 04150    l_glfc001需去除\n，避免字串含\n導致SQL算不出金額
#180528-00050#1   18/06/01 By 05488    取數方式(glfc008)增加"A：年初數"計算邏輯
#180424-00026#6   18/06/06 By 06189    来源是aglq947的时候，数据取值为合并报表
#180723-00010#1   18/07/23 By 05634    如果是aglq860和aglq960,s_analy_form_formula取消小數取位
#180829-00038#1   18/08/29 by 08172    解析运算符时需考虑小数的情况
#180829-00065#1   18/08/30 By 05488    aglp750已有抓傳票資料寫到gleb_t，aglq938查詢時不需在抓結轉傳票來加總
#180917-00047#1   18/09/18 By 05634    增加aglq840,aglq820,s_analy_form_formula取消小數取位
#190111-00025#1   19/01/16 By 10043    aglq810期別為0無CE憑證,不需考慮是否排除CE憑證
#190202-00002#1   19/02/15 By 07804    修正160526-00035#1,當agli021取值方式為(2,3,8,9)時,抓取glaq資料要抓取借/貸方一起納入考慮,才會與真正過帳時寫入總帳時的金額相符
#181121-00017#2   19/12/05 By 01531    1.若變量有重分類時則科目餘額方向不同時,則取重分類變量取代當前變量
#                                      2.重分类考虑核算项
#191226-00004#7   20/02/20 By 10043    agli201資料來源新增5:自行輸入選項,修改解析公式計算金額邏輯
#191226-00004#9   20/02/26 By 10500    补充#191226-00004#7
#200317-00012#1   20/03/17 By 11234    修改aglq810排除AD凭证的问题
#200312-00058#1   20/03/13 By 11234    增加agli201中取数方式设置为A.年初数的情况
#200330-00035#1   20/03/30 By 01531    重分类修正
#200525-00028#1   20/05/26 By 05795    sql拼接公式有误，如果是减号，后面公式应该需要括号起来
#200529-00062#1   20/06/01 By 07804    修正解析公式有誤,若前一個運算符號是括號,後面串接公式也要加括號
#200611-00032#1   20/06/18 By 11234    处理aglq810在agli201互为重分类变量时结果不对的问题
#200629-00035#1   20/06/30 By 11234    修改agli201互设重分类问题
#200714-00066#1   20/07/14 By 01531    重分类问题修正
#200717-00016#1   20/07/17 By 01531    重分类#200714-00066#1问题修正
#200721-00013#1   20/07/21 By 01531    重分类问题,aglq810 下已过账条件查询不报错，下全部条件查询报错
#200723-00018#1   20/07/23 By 01531    程序3654行，增加glfc008取值方式='A'
#200925-00012#1   20/09/27 by 08172    修正pgs除数为0闪退问题
#200809-00005#1   20/08/11 By 11234    抓取重分类核算项段的sql参照aglq720加上取0期的段落
#200927-00028#1   20/10/20 by 08172    修正不含审计调整传票时本年利润对应审计调整中损益金额取值
#200724-00083#1   20/08/17 By 11234    期别为0无YE凭证，不需考虑是否排除YE凭证
#200825-00025#1   20/09/04 By 11234    效能优化，在top_global.inc中增加数组用于存参数和返回值
#201111-00045#1   20/12/28 By 11234    #200925-00012#1此单在Oracle环境报错，改成只在pgs环境
#200910-00022#1   20/09/11 By 11234    增加l_chr1=I表内项目时的取数逻辑
#210112-00013#2   21/01/27 By 10043    aglq937依公式計算金額增加"合併報表重分類取值維度含帳套"邏輯
#210112-00013#3   21/01/28 By 10043    aglq930依公式計算金額增加"重分類"&"合併報表重分類取值維度含帳套"邏輯
#210325-00005#1   21/03/25 By 05795    如果是A年初数得时候，就不需要执行EXECUTE glaq_st_pre INTO l_amt_st
#210301-00038@1   21/04/08 By 11234    效能优化，合并报表重分类部分根据账套group by拿到循环外面写
#210426-00027#1   21/05/15 By 14589    s_analy_form_get_amt缺別名、group by不能有空值
#210419-00041#1   21/05/24 By 11234    当是agli075且agli201单身取数方式为567本期发生额的时候，扣减掉去年期末
#210527-00003#1   21/05/27 By 11234    修正#210426-00027#1多加的别名导致agli070查询报错问题
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
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_analy_form.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
DEFINE tok base.StringTokenizer
DEFINE tok1 base.StringTokenizer
DEFINE tok3 base.StringTokenizer
DEFINE tok4 base.StringTokenizer
DEFINE tok5 base.StringTokenizer
DEFINE tok6 base.StringTokenizer
DEFINE g_str  STRING
DEFINE g_glfa002    LIKE glfa_t.glfa002
DEFINE g_bdate      LIKE type_t.dat     #170510-00043#2 add
DEFINE g_edate      LIKE type_t.dat     #170510-00043#2 add
DEFINE g_glaa003    LIKE glaa_t.glaa003 #170510-00043#2 add
#170623-00034#6---add--start
DEFINE g_fun_argv   RECORD
          glfa001       STRING,         #報表模板
          glfbl004      STRING,         #項目
          glfb003       STRING          #報表行序
                    END RECORD
#170623-00034#6---add--end
DEFINE g_glaq022_t  LIKE glaq_t.glaq022  #210301-00038@1 add  #核算項舊值備份  
DEFINE g_ld_t       LIKE gldn_t.gldn041  #210301-00038@1 add
#end add-point
 
{</section>}
 
{<section id="s_analy_form.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
#170816-00007#159 add by 10043 ---- (s)
DEFINE g_colname_1   STRING
DEFINE g_comment_1   STRING 
DEFINE g_msg         STRING   #錯誤訊息
#170816-00007#159 add by 10043 ---- (e)   
#end add-point
 
{</section>}
 
{<section id="s_analy_form.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_analy_form.other_function" readonly="Y" type="s" >}
################################################################################
# Descriptions...: 解析公式或者解析座標
# Memo...........:
# Usage..........: CALL s_analy_form(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_glfa001   報表模板編號
#                : p_glfb004   取數公式來源  1.表內項目(傳座標) 2.總帳變量(傳公式)
#                : p_str       公式、座標
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add 
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: 02481
#                : by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
################################################################################
PUBLIC FUNCTION s_analy_form(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_glfb004,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
 # DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_glfb004       LIKE glfb_t.glfb004
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #查询条件
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5  
   DEFINE l_left          LIKE type_t.chr1
   DEFINE l_right         LIKE type_t.chr1
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   #150827-00036#1--add--end
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---
   DEFINE l_num           LIKE type_t.num10  #200825-00025#1 add
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_amount = 0
   #170816-00007#159 mark by 10043 --(s)
   #IF cl_null(p_ld) AND cl_null(p_year) AND cl_null(p_bmonth) AND cl_null(p_emonth) AND cl_null(p_glfa001) AND cl_null(p_glfb004) AND cl_null(p_str) THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-268'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()  
#      CALL cl_errmsg('','','','sub-268',1)
   #   LET r_success = FALSE
   #   RETURN r_success,r_amount
   #END IF
   #170816-00007#159 mark by 10043 --(e)  
   #170816-00007#159 add by 10043 --(s)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_ld) THEN
      LET g_colname_1 = cl_getmsg("axc-00585",g_dlang)  #帳別
      LET g_msg = g_colname_1   
   END IF      
   IF cl_null(p_year) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("agl-00274",g_dlang)  #年
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_bmonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00794",g_dlang)  #起始期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_emonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00795",g_dlang)  #截止期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_glfa001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("abgq050","lbl_glfa001") RETURNING g_colname_1,g_comment_1  #報表模版編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_glfb004) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("abgi070_01","lbl_glfb004") RETURNING g_colname_1,g_comment_1  #公式來源
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF    
   IF cl_null(p_str) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("lib-00362",g_dlang)   #公式
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF     
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF   
   #170816-00007#159 add by 10043 --(e)

   #200825-00025#1 add(s)
   IF cl_null(p_glfb004) THEN LET p_glfb004 = ' ' END IF
   IF cl_null(p_str) THEN LET p_str = ' ' END IF
   IF cl_null(p_wc) THEN LET p_wc = ' ' END IF
   #检查动态数组中是否有重复
   FOR l_num = 1 TO g_s_analy_form_reuse.getLength()
       IF g_s_analy_form_reuse[l_num].ld = p_ld AND g_s_analy_form_reuse[l_num].year = p_year AND g_s_analy_form_reuse[l_num].bmonth = p_bmonth 
       AND g_s_analy_form_reuse[l_num].emonth = p_emonth AND g_s_analy_form_reuse[l_num].glfa009 = p_glfa009 AND g_s_analy_form_reuse[l_num].glfa008 = p_glfa008 
       AND g_s_analy_form_reuse[l_num].glfa001 = p_glfa001 AND g_s_analy_form_reuse[l_num].glfb004 = p_glfb004 AND g_s_analy_form_reuse[l_num].str = p_str
       AND g_s_analy_form_reuse[l_num].wc = p_wc AND g_s_analy_form_reuse[l_num].show_ad = p_show_ad AND g_s_analy_form_reuse[l_num].stus = p_stus
       AND g_s_analy_form_reuse[l_num].show_ce = p_show_ce AND g_s_analy_form_reuse[l_num].show_ye = p_show_ye THEN
          LET r_success = g_s_analy_form_reuse[l_num].success
          LET r_amount = g_s_analy_form_reuse[l_num].amount
          RETURN r_success,r_amount
       END IF
   END FOR
   #200825-00025#1 add(e)

   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   LET g_str = p_str
   
   #报表模板类型
   SELECT glfa002 INTO g_glfa002 FROM glfa_t
   WHERE glfaent=g_enterprise AND glfa001=p_glfa001
   
   IF p_glfb004 = '1' THEN  #表內項目
      CALL s_analy_form_get_coordinate(p_glfa001,p_str)
      RETURNING l_success,p_str  
 
      CALL s_analy_form_formula(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus' #170222-00003#1 add ,p_show_ce,p_show_ye
      RETURNING l_success,r_amount  
   ELSE   #總帳變量
      CALL s_analy_form_formula(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus' #170222-00003#1 add ,p_show_ce,p_show_ye
      RETURNING l_success,r_amount  
   END IF
   
   IF l_success = FALSE THEN
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   #200825-00025#1 add(s)
   #存入动态数组
   LET l_num = g_s_analy_form_reuse.getLength() + 1
   LET g_s_analy_form_reuse[l_num].ld = p_ld
   LET g_s_analy_form_reuse[l_num].year = p_year
   LET g_s_analy_form_reuse[l_num].bmonth = p_bmonth
   LET g_s_analy_form_reuse[l_num].emonth = p_emonth
   LET g_s_analy_form_reuse[l_num].glfa009 = p_glfa009
   LET g_s_analy_form_reuse[l_num].glfa008 = p_glfa008
   LET g_s_analy_form_reuse[l_num].glfa001 = p_glfa001
   LET g_s_analy_form_reuse[l_num].glfb004 = p_glfb004
   LET g_s_analy_form_reuse[l_num].str = p_str
   LET g_s_analy_form_reuse[l_num].wc = p_wc
   LET g_s_analy_form_reuse[l_num].show_ad = p_show_ad
   LET g_s_analy_form_reuse[l_num].stus = p_stus
   LET g_s_analy_form_reuse[l_num].show_ce = p_show_ce
   LET g_s_analy_form_reuse[l_num].show_ye = p_show_ye
   LET g_s_analy_form_reuse[l_num].success = r_success
   LET g_s_analy_form_reuse[l_num].amount = r_amount
   #200825-00025#1 add(e)
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: SQL语句定义
# Memo...........: #170510-00043#2 add
# Usage..........: CALL s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce)
# Input parameter: p_ld           账套组成的字符串
#                : p_year         年度
#                : p_bmonth       起始期别
#                : p_emonth       截止期别
#                : p_show_ce      是否显示CE凭证
# Return code....: 
# Date & Author..: 2017/05/15 By 02599
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce)
   DEFINE p_ld            STRING                               
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE l_sql           STRING

   IF p_show_ce = 'N' THEN 
      #抓取起始期别的起始日期，截止期别的截止日期
      LET l_sql ="  SELECT DISTINCT glaa003  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
                 "  AND glaald IN ('",p_ld,"') "
      PREPARE glaa003_pre FROM l_sql
      EXECUTE glaa003_pre INTO g_glaa003
      
      SELECT MIN(glav004),MAX(glav004) INTO g_bdate,g_edate
        FROM glav_t
       WHERE glavent=g_enterprise AND glav001=g_glaa003
         AND glav002=p_year 
         AND glav006 BETWEEN p_bmonth AND p_emonth
   END IF   
   
   #定义抓取借贷别SQL语句
   LET l_sql ="SELECT glac008 FROM glac_t",
              " WHERE glacent = ",g_enterprise,
              "   AND glac001 = (SELECT DISTINCT glaa004  FROM glaa_t ",
              "                   WHERE glaaent = ",g_enterprise,
              "                     AND glaald IN ('",p_ld,"') )",
              "   AND glac002 = ? "
   PREPARE glac008_pre FROM l_sql
   
   #定义抓取agli201变量相关资料
   LET l_sql = "SELECT glfc001,glfcseq,glfc002,glfc003,glfc004,glfc005,glfc006,glfc007,glfc008,",
               "       glfc009,glfc010,glfc011,glfc012,glfc013 ",
               "      ,glfc014,glfc015,glfc016 ",#181121-00017#2 add #191226-00004#7 add glfc016
               "  FROM glfc_t ",
               " WHERE glfcent = '",g_enterprise,"'",
               "   AND glfc001 = ? ",
               " ORDER BY glfcseq "  
   PREPARE glfc_pre FROM l_sql
   DECLARE glfc_cur CURSOR FOR glfc_pre  

   #181121-00017#2 add s---
   LET l_sql= " SELECT DISTINCT glfc001 FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc015 = ? AND glfc014 = 'Y' "
   PREPARE get_glfc001 FROM l_sql
   DECLARE get_glfc001_cur CURSOR FOR get_glfc001 #200330-00035#1(20200407) add
   
   #200330-00035#1(20200407) add s---
   LET l_sql= " SELECT COUNT(1) FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc015 = ? AND glfc014 = 'Y' "
   PREPARE get_glfc001_1 FROM l_sql
   #200330-00035#1(20200407) add e---
   
   
   #定义抓取agli201变量相关资料
   LET l_sql = "SELECT glfc001,glfcseq,glfc002,glfc003,glfc004,glfc005,glfc006,glfc007,glfc008,",
               "       glfc009,glfc010,glfc011,glfc012,glfc013 ",
               "      ,glfc014,glfc015,glfc016,glfc017 ", #191226-00004#7 add glfc016 #210112-00013#2 add glfc017
               "  FROM glfc_t ",
               " WHERE glfcent = '",g_enterprise,"'",
               "   AND glfc001 = ? ",
               " ORDER BY glfcseq "  
   PREPARE glfc_pre1 FROM l_sql
   DECLARE glfc_cur1 CURSOR FOR glfc_pre1   

   LET l_sql = " SELECT COUNT(1) FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc015 = ? AND glfc014 = 'Y'"
   PREPARE glfc_pre2 FROM l_sql
   #181121-00017#2 add e---
   
   #210301-00038@1 add(s)
   LET l_sql = "  MERGE INTO s_analy_tmp t1 ",
               "  USING (SELECT glfcseq,glfc009,glfc011,glfc012 FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc001 = ? ORDER BY glfcseq) t2 ",
               "     ON (t1.glfcseq = t2.glfcseq AND t1.glaq022 = ? AND t1.ld = ?) ",
               "   WHEN NOT MATCHED THEN ",
               " INSERT VALUES('',0,t2.glfc009,t2.glfcseq,t2.glfc011,t2.glfc012,'1','') "                 
   PREPARE s_analy_form_tmp_pr4 FROM l_sql
   
   LET l_sql = " SELECT COUNT(1) FROM s_analy_tmp WHERE flag = '1' "
   PREPARE get_tmpcnt1 FROM l_sql
   
   LET l_sql = " SELECT COUNT(1) FROM s_analy_tmp "
   PREPARE get_tmpcnt2 FROM l_sql
   
   LET l_sql = " INSERT INTO s_analy_tmp( ",
               " glaq022,amt,glfc009,glfcseq,glfc011, ",
               " glfc012,ld ",
               " ) ",
               " VALUES ( ",
               " ?,?,?,?,?, ",
               " ?,? ",
               " ) "
   PREPARE ins_tmp FROM l_sql
   #210301-00038@1 add(e)
   
END FUNCTION

################################################################################
# Descriptions...: 抓取總賬變量設置作業agli201設置的公式
# Memo...........:
# Usage..........: s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_wcp_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add 
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
#                : by Hans  1.數據來源增加 合併財報合併後統計檔   
################################################################################
PUBLIC FUNCTION s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
 # DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add   
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       STRING
   DEFINE p_wc            STRING    #筛选条件
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   #161128-00061#7----add----begin-------------------
   #DEFINE l_glfc          RECORD  LIKE glfc_t.*  
   DEFINE l_glfc RECORD  #公式設定檔
       glfcent LIKE glfc_t.glfcent, #企業編號
       glfcownid LIKE glfc_t.glfcownid, #資料所有者
       glfcowndp LIKE glfc_t.glfcowndp, #資料所屬部門
       glfccrtid LIKE glfc_t.glfccrtid, #資料建立者
       glfccrtdp LIKE glfc_t.glfccrtdp, #資料建立部門
       glfccrtdt LIKE glfc_t.glfccrtdt, #資料創建日
       glfcmodid LIKE glfc_t.glfcmodid, #資料修改者
       glfcmoddt LIKE glfc_t.glfcmoddt, #最近修改日
       glfc001 LIKE glfc_t.glfc001, #公式編號
       glfcseq LIKE glfc_t.glfcseq, #項次
       glfc002 LIKE glfc_t.glfc002, #科目參照表
       glfc003 LIKE glfc_t.glfc003, #起始科目
       glfc004 LIKE glfc_t.glfc004, #截止科目
       glfc005 LIKE glfc_t.glfc005, #選用核算項
       glfc006 LIKE glfc_t.glfc006, #起始核算項值
       glfc007 LIKE glfc_t.glfc007, #截止核算項值
       glfc008 LIKE glfc_t.glfc008, #取值方式
       glfc009 LIKE glfc_t.glfc009, #運算方式
       glfc010 LIKE glfc_t.glfc010, #額外條件
       glfc011 LIKE glfc_t.glfc011, #左括號
       glfc012 LIKE glfc_t.glfc012, #右括號
       glfcud001 LIKE glfc_t.glfcud001, #自定義欄位(文字)001
       glfcud002 LIKE glfc_t.glfcud002, #自定義欄位(文字)002
       glfcud003 LIKE glfc_t.glfcud003, #自定義欄位(文字)003
       glfcud004 LIKE glfc_t.glfcud004, #自定義欄位(文字)004
       glfcud005 LIKE glfc_t.glfcud005, #自定義欄位(文字)005
       glfcud006 LIKE glfc_t.glfcud006, #自定義欄位(文字)006
       glfcud007 LIKE glfc_t.glfcud007, #自定義欄位(文字)007
       glfcud008 LIKE glfc_t.glfcud008, #自定義欄位(文字)008
       glfcud009 LIKE glfc_t.glfcud009, #自定義欄位(文字)009
       glfcud010 LIKE glfc_t.glfcud010, #自定義欄位(文字)010
       glfcud011 LIKE glfc_t.glfcud011, #自定義欄位(數字)011
       glfcud012 LIKE glfc_t.glfcud012, #自定義欄位(數字)012
       glfcud013 LIKE glfc_t.glfcud013, #自定義欄位(數字)013
       glfcud014 LIKE glfc_t.glfcud014, #自定義欄位(數字)014
       glfcud015 LIKE glfc_t.glfcud015, #自定義欄位(數字)015
       glfcud016 LIKE glfc_t.glfcud016, #自定義欄位(數字)016
       glfcud017 LIKE glfc_t.glfcud017, #自定義欄位(數字)017
       glfcud018 LIKE glfc_t.glfcud018, #自定義欄位(數字)018
       glfcud019 LIKE glfc_t.glfcud019, #自定義欄位(數字)019
       glfcud020 LIKE glfc_t.glfcud020, #自定義欄位(數字)020
       glfcud021 LIKE glfc_t.glfcud021, #自定義欄位(日期時間)021
       glfcud022 LIKE glfc_t.glfcud022, #自定義欄位(日期時間)022
       glfcud023 LIKE glfc_t.glfcud023, #自定義欄位(日期時間)023
       glfcud024 LIKE glfc_t.glfcud024, #自定義欄位(日期時間)024
       glfcud025 LIKE glfc_t.glfcud025, #自定義欄位(日期時間)025
       glfcud026 LIKE glfc_t.glfcud026, #自定義欄位(日期時間)026
       glfcud027 LIKE glfc_t.glfcud027, #自定義欄位(日期時間)027
       glfcud028 LIKE glfc_t.glfcud028, #自定義欄位(日期時間)028
       glfcud029 LIKE glfc_t.glfcud029, #自定義欄位(日期時間)029
       glfcud030 LIKE glfc_t.glfcud030, #自定義欄位(日期時間)030
       glfc013   LIKE glfc_t.glfc013,   #數據來源
       glfc014   LIKE glfc_t.glfc014,   #181121-00017#2 add 
       glfc015   LIKE glfc_t.glfc015    #181121-00017#2 add
      ,glfc016   LIKE glfc_t.glfc016    #191226-00004#7 add
       END RECORD
   #161128-00061#7----add----end-------------------   
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_str           STRING
   DEFINE l_glfc009       LIKE type_t.chr10
   DEFINE l_success       LIKE type_t.num5
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   #150827-00036#1--add--end
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   DEFINE l_glfc001       LIKE glfc_t.glfc001 #170510-00043#2 add
#181121-00017#2 add s---   
   DEFINE l_glfc1 RECORD  #公式設定檔
       glfcent LIKE glfc_t.glfcent, #企業編號
       glfcownid LIKE glfc_t.glfcownid, #資料所有者
       glfcowndp LIKE glfc_t.glfcowndp, #資料所屬部門
       glfccrtid LIKE glfc_t.glfccrtid, #資料建立者
       glfccrtdp LIKE glfc_t.glfccrtdp, #資料建立部門
       glfccrtdt LIKE glfc_t.glfccrtdt, #資料創建日
       glfcmodid LIKE glfc_t.glfcmodid, #資料修改者
       glfcmoddt LIKE glfc_t.glfcmoddt, #最近修改日
       glfc001 LIKE glfc_t.glfc001, #公式編號
       glfcseq LIKE glfc_t.glfcseq, #項次
       glfc002 LIKE glfc_t.glfc002, #科目參照表
       glfc003 LIKE glfc_t.glfc003, #起始科目
       glfc004 LIKE glfc_t.glfc004, #截止科目
       glfc005 LIKE glfc_t.glfc005, #選用核算項
       glfc006 LIKE glfc_t.glfc006, #起始核算項值
       glfc007 LIKE glfc_t.glfc007, #截止核算項值
       glfc008 LIKE glfc_t.glfc008, #取值方式
       glfc009 LIKE glfc_t.glfc009, #運算方式
       glfc010 LIKE glfc_t.glfc010, #額外條件
       glfc011 LIKE glfc_t.glfc011, #左括號
       glfc012 LIKE glfc_t.glfc012, #右括號
       glfcud001 LIKE glfc_t.glfcud001, #自定義欄位(文字)001
       glfcud002 LIKE glfc_t.glfcud002, #自定義欄位(文字)002
       glfcud003 LIKE glfc_t.glfcud003, #自定義欄位(文字)003
       glfcud004 LIKE glfc_t.glfcud004, #自定義欄位(文字)004
       glfcud005 LIKE glfc_t.glfcud005, #自定義欄位(文字)005
       glfcud006 LIKE glfc_t.glfcud006, #自定義欄位(文字)006
       glfcud007 LIKE glfc_t.glfcud007, #自定義欄位(文字)007
       glfcud008 LIKE glfc_t.glfcud008, #自定義欄位(文字)008
       glfcud009 LIKE glfc_t.glfcud009, #自定義欄位(文字)009
       glfcud010 LIKE glfc_t.glfcud010, #自定義欄位(文字)010
       glfcud011 LIKE glfc_t.glfcud011, #自定義欄位(數字)011
       glfcud012 LIKE glfc_t.glfcud012, #自定義欄位(數字)012
       glfcud013 LIKE glfc_t.glfcud013, #自定義欄位(數字)013
       glfcud014 LIKE glfc_t.glfcud014, #自定義欄位(數字)014
       glfcud015 LIKE glfc_t.glfcud015, #自定義欄位(數字)015
       glfcud016 LIKE glfc_t.glfcud016, #自定義欄位(數字)016
       glfcud017 LIKE glfc_t.glfcud017, #自定義欄位(數字)017
       glfcud018 LIKE glfc_t.glfcud018, #自定義欄位(數字)018
       glfcud019 LIKE glfc_t.glfcud019, #自定義欄位(數字)019
       glfcud020 LIKE glfc_t.glfcud020, #自定義欄位(數字)020
       glfcud021 LIKE glfc_t.glfcud021, #自定義欄位(日期時間)021
       glfcud022 LIKE glfc_t.glfcud022, #自定義欄位(日期時間)022
       glfcud023 LIKE glfc_t.glfcud023, #自定義欄位(日期時間)023
       glfcud024 LIKE glfc_t.glfcud024, #自定義欄位(日期時間)024
       glfcud025 LIKE glfc_t.glfcud025, #自定義欄位(日期時間)025
       glfcud026 LIKE glfc_t.glfcud026, #自定義欄位(日期時間)026
       glfcud027 LIKE glfc_t.glfcud027, #自定義欄位(日期時間)027
       glfcud028 LIKE glfc_t.glfcud028, #自定義欄位(日期時間)028
       glfcud029 LIKE glfc_t.glfcud029, #自定義欄位(日期時間)029
       glfcud030 LIKE glfc_t.glfcud030, #自定義欄位(日期時間)030
       glfc013   LIKE glfc_t.glfc013,   #數據來源
       glfc014   LIKE glfc_t.glfc014,   
       glfc015   LIKE glfc_t.glfc015    
       END RECORD
DEFINE l_glfc001_1  LIKE glfc_t.glfc001       
DEFINE l_amt_1      LIKE glar_t.glar005
DEFINE l_flag       LIKE type_t.chr1 
DEFINE l_n          LIKE type_t.num5
DEFINE l_sql_stus   STRING
DEFINE l_field1     STRING
DEFINE l_amt_2      LIKE glar_t.glar005
DEFINE l_amt2       LIKE glar_t.glar005
DEFINE l_glaq022    LIKE glaq_t.glaq022
DEFINE l_glfc005    LIKE glfc_t.glfc005
DEFINE lc_param     RECORD
       glfc001      LIKE glfc_t.glfc001,     
       glaq022      LIKE glaq_t.glaq022,
       ld           LIKE glaq_t.glaqld  #210301-00038@1 add       
                    END RECORD
DEFINE ls_js        STRING
DEFINE l_amt3       LIKE glar_t.glar005
DEFINE l_amt4       LIKE glar_t.glar005
#181121-00017#2 add e--- 
DEFINE l_amt_5  LIKE glfc_t.glfc001   #200330-00035#1 add
DEFINE l_amt_6  LIKE glfc_t.glfc001   #200330-00035#1 add
DEFINE l_amt_7  LIKE glfc_t.glfc001   #200330-00035#1(20200407) add  
DEFINE l_cnt    LIKE type_t.num5      #200330-00035#1(20200407) add 
#200723-00018#1 add s---
DEFINE l_glaa130       LIKE glaa_t.glaa130  
DEFINE l_glaa003       LIKE glaa_t.glaa003     
DEFINE l_last_yy       LIKE type_t.num5        
DEFINE l_last_mm       LIKE type_t.num5 
DEFINE l_amt_last      LIKE glar_t.glar005
#200723-00018#1 add e---

   LET r_success = TRUE
   LET l_str = ''
   LET r_amount = 0
   LET l_success = TRUE #210112-00013#3 add
   
   #定义SQL申请
   CALL s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce) #210112-00013#3 add
   
   #200723-00018#1 add s---
   #p_ld是账套字符串，若是合并报表，那账套
   LET l_glaa130 = NULL
   LET l_glaa003 = NULL
   LET l_sql = " SELECT DISTINCT glaa130,glaa003  FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald IN ('",p_ld,"')"
   PREPARE get_glaa1 FROM l_sql
   EXECUTE get_glaa1 INTO l_glaa130,l_glaa003
   IF cl_null(l_glaa130) THEN LET l_glaa130 = 'N' END IF 
   #200723-00018#1 add e---
 
   LET p_glfc001 = p_glfc001.trim() 
   #抓取變量設置(agli201)
   
   #161128-00061#7----add----begin-------------------
   #LET l_sql = "SELECT * FROM glfc_t ",
#170510-00043#2--mark--str--
#   LET l_sql = "SELECT glfcent,glfcownid,glfcowndp,glfccrtid,glfccrtdp,glfccrtdt,glfcmodid,glfcmoddt,",
#               "glfc001,glfcseq,glfc002,glfc003,glfc004,glfc005,glfc006,glfc007,glfc008,glfc009,glfc010,",
#               "glfc011,glfc012,glfcud001,glfcud002,glfcud003,glfcud004,glfcud005,glfcud006,glfcud007,",
#               "glfcud008,glfcud009,glfcud010,glfcud011,glfcud012,glfcud013,glfcud014,glfcud015,glfcud016,",
#               "glfcud017,glfcud018,glfcud019,glfcud020,glfcud021,glfcud022,glfcud023,glfcud024,glfcud025,",
#               "glfcud026,glfcud027,glfcud028,glfcud029,glfcud030,glfc013 FROM glfc_t ",
#   #161128-00061#7----add----end-------------------
#               " WHERE glfcent = '",g_enterprise,"'",
#               "   AND glfc001 = '",p_glfc001,"'"
#              ," ORDER BY glfcseq "   #170327-00047#1 add
#   PREPARE glfc_pre FROM l_sql
#   DECLARE glfc_cur CURSOR FOR glfc_pre  
#170510-00043#2--mark--end

   #170510-00043#2--mod--str--
#   FOREACH glfc_cur INTO l_glfc.*
   LET l_glfc001= p_glfc001
   LET l_glfc001 = cl_replace_str(l_glfc001,'\n', '')   #180327-00043#1 add
   LET l_amt2 = 0 #181121-00017#2 #cy02 add 
   LET l_flag = 'N'  #重分类变量B,agi201单身可能设置多笔，那其对应的变量金额应该只要抓一次就好  
   LET l_amt_6 = 0   #200330-00035#1(#20200407) add 
   FOREACH glfc_cur USING l_glfc001 
                    INTO l_glfc.glfc001,l_glfc.glfcseq,l_glfc.glfc002,l_glfc.glfc003,l_glfc.glfc004,
                         l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,l_glfc.glfc009,
                         l_glfc.glfc010,l_glfc.glfc011,l_glfc.glfc012,l_glfc.glfc013
                        ,l_glfc.glfc014,l_glfc.glfc015,l_glfc.glfc016 #181121-00017#2 add #191226-00004#7 add glfc016
   #170510-00043#2--mod--end
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
#         CALL cl_errmsg('','FOREACH:','',SQLCA.sqlcode,1)

         EXIT FOREACH
      END IF
      
      #左括號
      IF l_glfc.glfc011 = 'Y' THEN 
         IF cl_null(l_str) THEN 
            LET l_str = "(" CLIPPED
         ELSE
            LET l_str = l_str CLIPPED ," ( " CLIPPED
         END IF
      END IF
      
      #計算金額
      LET l_amt = 0
      #151013-00016#4 ---s---
#      IF l_glfc.glfc013='1' THEN #150827-00036#1 add
#         #數據來源：總帳憑證統計檔glar_t
#         CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
#                                   l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                   l_glfc.glfc010,p_wc,p_show_ad,p_stus) #150827-00036#1 add 'p_show_ad,p_stus'
#         RETURNING l_success,l_amt   
#      #150827-00036#1--add--str--
#      ELSE
#         #數據來源：分錄底稿統計檔glat_t
#         CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
#                                    l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                    l_glfc.glfc010,p_wc) 
#         RETURNING l_success,l_amt
#      END IF
      #150827-00036#1--add--end
      
      #181121-00017#2 add s---
      LET lc_param.glfc001 = l_glfc.glfc001
      LET lc_param.glaq022 = ''
      LET lc_param.ld = ''  #210301-00038@1 add
      LET ls_js = util.JSON.stringify(lc_param)
      #181121-00017#2 add e---      
               
      CASE l_glfc.glfc013 
         WHEN '1'
            #180327-00033#1---add---start---
            #agli201的glfc013只剩1和2選項，把選項3：合併報表統計檔併入選項1
            #因此在這用程式代號判斷是走總帳或是合併報表
            #IF g_prog MATCHES 'aglq93*' OR g_prog MATCHES 'aglq96*' THEN #mark by 06189 #180424-00026#6
            #IF g_prog MATCHES 'aglq93*' OR g_prog MATCHES 'aglq96*' OR g_prog MATCHES 'aglq947*' THEN #mark by 06189 #180424-00026#6 #200723-00018#1 mark
            IF l_glaa130 = 'Y' THEN #200723-00018#1 add               
               #210112-00013#3 add ---s
               IF g_prog MATCHES 'aglq930*' THEN
                  CALL s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
                                                  l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                                  l_glfc.glfc010,p_wc,p_stus)
                       RETURNING l_success,l_amt
                  EXIT CASE                       
               END IF
               #210112-00013#3 add ---e               
               #數據來源：合併報表統計檔(glea_t)
               CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #181121-00017#2 mod l_glfc.glfc001->ls_js
                                          l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                          l_glfc.glfc010,p_wc,p_stus)
               RETURNING l_success,l_amt  
               #200723-00018#1 add s---
               #--add by carol.wu  200521--S--
               #--因為合併報表的科余是年度累計數, 遇到要取本期發生數時, 必須先扣減上減的數字才會正確
               #IF g_prog MATCHES 'aglq939*' AND l_glfc.glfc008 MATCHES '[456]' THEN #本期發生額                     #210419-00041#1 mark
               IF (g_prog MATCHES 'aglq939*' OR g_prog MATCHES 'agli075*') AND l_glfc.glfc008 MATCHES '[456]' THEN  #210419-00041#1 add
                  LET l_amt_last = 0
                  #取得去年期末
                  CALL s_fin_date_get_last_period(l_glaa003,p_ld,p_year,'1')
                  RETURNING l_success,l_last_yy,l_last_mm
                   
                  CALL s_analy_form_get_amt_2(p_ld,l_last_yy,l_last_mm,l_last_mm,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
                                    l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                    l_glfc.glfc010,p_wc,p_stus)
                  RETURNING l_success,l_amt_last
                  IF cl_null(l_amt_last) THEN
                     LET l_amt_last = 0
                  END IF
                  LET l_amt = l_amt - l_amt_last  #本期發生額
               END IF
               #200723-00018#1 add e---
               #--add by carol.wu  200521--S--               
            ELSE
            #180327-00033#1---add---end--- 
               #數據來源：總帳憑證統計檔glar_t           
               CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #181121-00017#2 mod l_glfc.glfc001->ls_js
                                         l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                         l_glfc.glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus'  #170222-00003#1 add ,p_show_ce,p_show_ye
               RETURNING l_success,l_amt           
            END IF      #180327-00033#1 add
         WHEN '2'
            CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #181121-00017#2 mod l_glfc.glfc001->ls_js
                                       l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,       
                                       l_glfc.glfc010,p_wc) 
            RETURNING l_success,l_amt             
         #此段保留給已出貨且在agli201有設3選項的客戶使用      #180327-00033#1 add
         WHEN '3'
            #210112-00013#3 add ---s
            IF g_prog MATCHES 'aglq930*' THEN
               CALL s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
                                               l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                               l_glfc.glfc010,p_wc,p_stus)
                    RETURNING l_success,l_amt
               EXIT CASE                       
            END IF
            #210112-00013#3 add ---e         
         
            CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #181121-00017#2 mod l_glfc.glfc001->ls_js
                                       l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                       l_glfc.glfc010,p_wc,p_stus)
            RETURNING l_success,l_amt     

         #191226-00004#7 add ---s
         WHEN '5'
            #191226-00004#9   add-S
            IF cl_null(l_glfc.glfc016) THEN
               LET l_glfc.glfc016 = 0
            END IF
            LET l_success = TRUE
            #191226-00004#9   add-E
            LET l_amt = l_glfc.glfc016 CLIPPED
         #191226-00004#7 add ---e

      END CASE
      
      
      
      #181121-00017#2 add s---
      #IF g_prog MATCHES 'aglq937*' OR g_prog MATCHES 'aglq947*' OR g_prog MATCHES 'aglq810*' OR g_prog MATCHES 'aglq811*' OR g_prog MATCHES 'aglq840*' THEN   #210112-00013#3 mark
      IF g_prog MATCHES 'aglq93[07]*' OR g_prog MATCHES 'aglq947*' OR g_prog MATCHES 'aglq810*' OR g_prog MATCHES 'aglq811*' OR g_prog MATCHES 'aglq840*' THEN #210112-00013#3 add
         #200330-00035#1(#20200407) add s---#变量本身有重分类变量且也作为重分类变量时，l_flag = 'Y'已经算过重分类之后，l_amt也已保留正数金额了，foreach glfc_cur循环,后面的l_amt=0
         IF l_flag = 'Y' THEN 
            LET l_glfc001_1 = NULL
            #EXECUTE get_glfc001 USING l_glfc.glfc001 INTO l_glfc001_1 #200330-00035#1(20200407) mark
            LET l_cnt =0 #200330-00035#1(20200407) add
            EXECUTE get_glfc001_1 USING l_glfc.glfc001 INTO l_cnt #200330-00035#1(20200407) add
            #IF l_glfc.glfc014 = 'Y' AND NOT cl_null(l_glfc001_1) THEN #200330-00035#1(20200407) mark
            #IF l_glfc.glfc014 = 'Y' AND l_cnt > 0 THEN #200330-00035#1(20200407) add  #200629-00035#1 mark
            IF l_glfc.glfc014 = 'Y' THEN                                               #200629-00035#1 add #只要自己本身有重分类，计算过一次，l_amt就可=0
               LET l_amt = 0 
            END IF             
         END IF
         #200330-00035#1(#20200407) add s---
         IF l_flag = 'N' THEN 
            #若B(glfc001)是A变量的重分类变量B(glfc015)，则获取A(l_glfc001_1)，取的A公式计算金额(l_amt_1)
            LET l_glfc001_1 = NULL
            #200330-00035#1 add s---
            #IF l_glfc.glfc014 = 'Y' AND NOT cl_null(l_glfc001_1) THEN #变量本身有重分类变量且也作为重分类变量时，l_amt保留正数金额 #200330-00035#1(20200407) mark
            IF l_glfc.glfc014 = 'Y' THEN #变量本身有重分类变量且也作为重分类变量时，l_amt保留正数金额  #200330-00035#1(20200407) add
               LET l_amt_5 = 0 LET l_amt_6 = 0 
               CALL s_analy_form_get_glfc_1(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) RETURNING g_sub_success,l_amt_5,l_amt_6
               #LET l_amt = l_amt_6 #200330-00035#1(20200407) add  #200611-00032#1 mark
               IF l_amt_5 < 0 THEN  #200629-00035#1 add  
                  LET l_amt = l_amt_5                                 #200611-00032#1 add
               #200629-00035#1 add(s)
               ELSE
                  LET l_amt = l_amt_6                                 #200611-00032#1 add
               END IF
               #200629-00035#1 add(e)
               LET l_flag = 'Y'    #200330-00035#1(20200407) add
            END IF
            #200330-00035#1 add e--        
            LET l_glfc001_1 = NULL            
            FOREACH get_glfc001_cur USING l_glfc.glfc001 INTO l_glfc001_1 #200330-00035#1(20200407) add            
               IF NOT cl_null(l_glfc001_1) THEN           
                  LET l_flag = 'Y'
                  LET l_amt_1 = 0 
                 #CALL s_analy_form_get_glfc_1(p_ld,p_year,p_bmonth,p_emonth,l_glfc001_1,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) RETURNING l_success,l_amt_1 #181121-00017#2 #cy02 add
                  CALL s_analy_form_get_glfc_1(p_ld,p_year,p_bmonth,p_emonth,l_glfc001_1,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) RETURNING g_sub_success,l_amt_1,l_amt_2 #181121-00017#2 #cy02 add
                  IF l_amt_1 < 0 THEN 
                     #判断是否本身有设置了重分类，若有则l_amt=0                  
                     LET l_amt = l_amt + (l_amt_1*-1)
                     #LET l_amt2 = l_amt2 + l_amt_2 #181121-00017#2 #cy02 add  #200611-00032#1 mark
                     #200611-00032#1 add(s)
                     IF l_amt < 0  THEN 
                        LET l_amt = 0
                     END IF
                     IF l_amt_5 < 0 THEN  #200629-00035#1 add #l_amt_5小于0时才加上原来的正数l_amt_6,不然l_amt已经等于l_amt_6，再加一次会重复累加 
                     LET l_amt = l_amt + l_amt_6
                     END IF               #200629-00035#1 add
                     #200611-00032#1 add(e)
                  END IF                  
               END IF
            END FOREACH #200330-00035#1(20200407) add   
         END IF             
      END IF
      #181121-00017#2 add e---   
               
      IF l_success = FALSE THEN
         LET r_success = FALSE
         RETURN r_success,r_amount
      END IF

      LET l_str = l_str CLIPPED,l_amt CLIPPED

      #右括號
      IF l_glfc.glfc012 = 'Y' THEN 
         LET l_str = l_str CLIPPED ," ) " CLIPPED
      END IF
      
      #運算符
      CASE l_glfc.glfc009
         WHEN 1   LET l_glfc009 = ' + '
         WHEN 2   LET l_glfc009 = ' - '
         WHEN 3   LET l_glfc009 = ' * '
         WHEN 4   LET l_glfc009 = ' / '
           
      END CASE
      
      IF NOT cl_null(l_glfc.glfc009) THEN 
         LET l_str = l_str CLIPPED,l_glfc009 CLIPPED
      END IF
   
   END FOREACH 
   
   IF cl_null(l_str) THEN 
      RETURN r_success,r_amount
   END IF
   
   LET l_sql = "SELECT ",l_str CLIPPED," FROM DUAL"
   PREPARE l_sql_pre1 FROM l_sql
   EXECUTE l_sql_pre1 INTO r_amount
   
   #除數不可為0
   IF SQLCA.sqlerrd[2] = -1476 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00237'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','agl-00237',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = l_str
      #170623-00034#6---add--start
      IF NOT cl_null(g_fun_argv.glfbl004) THEN
         LET g_errparam.extend = s_get_field_name('agli070','glfbl004'),":",g_fun_argv.glfbl004,
                                 " & ",
                                 s_get_field_name('agli070','glfb003'), ":",g_fun_argv.glfb003,
                                 " >> ",
                                 l_str
      END IF
      #170623-00034#6---add--end
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','sub-00559',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF

   #181121-00017#2 add s---
   #IF g_prog MATCHES 'aglq937*' OR g_prog MATCHES 'aglq947*' OR g_prog MATCHES 'aglq810*' OR g_prog MATCHES 'aglq811*' OR g_prog MATCHES 'aglq840*' THEN #210112-00013#3 mark
   IF g_prog MATCHES 'aglq93[07]*' OR g_prog MATCHES 'aglq947*' OR g_prog MATCHES 'aglq810*' OR g_prog MATCHES 'aglq811*' OR g_prog MATCHES 'aglq840*' THEN #210112-00013#3 add
      #B(glfc001)有设置重分类变量C，且最终计算金额<0,则金额给0
      IF l_glfc.glfc014 = 'Y' AND r_amount < 0 THEN 
          LET r_amount = 0  
          #181121-00017#2 #cy02 add s--- 
         LET l_amt3 = 0
         LET l_amt4 = 0          
         CALL s_analy_form_get_glfc_1(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) RETURNING l_success,l_amt3,l_amt4          
         LET r_amount = r_amount + l_amt4  
         #181121-00017#2 #cy02 add e---
      END IF
   END IF
   #181121-00017#2 add e---   
      
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 通過座標獲取公式
# Memo...........:
# Usage..........: CALL s_analy_form_get_glfb005(p_glfa001,p_coordinate)
#                  RETURNING r_glfb005
# Input parameter: p_glfa001      報表模板編號
#                : p_coordinate   座標
# Return code....: r_glfb005      公式
# Date & Author..: 2014/05/12 By lujh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_formula(p_glfa001,p_glfb005)
   DEFINE p_glfa001          LIKE glfa_t.glfa001
   DEFINE p_coordinate       STRING
   DEFINE l_glfbseq          LIKE type_t.chr1000  #行次
   DEFINE l_glfbseq1         LIKE type_t.chr1000  #列次
   DEFINE r_glfb004          LIKE glfb_t.glfb004
   #DEFINE r_glfb005          LIKE glfb_t.glfb005 #161215-00022#1 mark lujh
   #161215-00022#1--add--str--lujh
   DEFINE l_glfb005          LIKE glfb_t.glfb005
   DEFINE r_glfb005          STRING
   #161215-00022#1--add--end--lujh
   DEFINE l_n                LIKE type_t.num5
   DEFINE p_glfb005          LIKE glfb_t.glfb005
   DEFINE l_sql              STRING
   
   LET p_coordinate = p_glfb005   
    
   LET p_coordinate = p_coordinate.trim() 
   #將座標解析成行、列
   LET l_glfbseq  = p_coordinate.substring(2,p_coordinate.getLength())  #行次
   LET l_glfbseq1 = p_coordinate.substring(1,1)  #列次   
   
   LET r_glfb004 = ''
   LET r_glfb005 = ''
   
   #先根据坐标抓取數公式來源和公式
   SELECT glfb004,glfb005 INTO r_glfb004,l_glfb005   #161215-00022#1 change r_glfb005 to l_glfb005
     FROM glfb_t
    WHERE glfbent = g_enterprise
      AND glfb001 = p_glfa001
      AND glfbseq = l_glfbseq
      AND glfbseq1 = l_glfbseq1
   #PGS(D)-13132 add -S-
   #PGS(D)-13132 add -E-
   

   #如果抓不到,可能是传过来的公式是“总账变量”,不需要再往下解析  或者就没有设置公式
   IF cl_null(r_glfb004) THEN 
      LET l_sql = "SELECT COUNT(DISTINCT glfb004) ",
                  "  FROM glfb_t ",
                  " WHERE glfbent = '",g_enterprise,"'",
                  "   AND glfb005 LIKE '%",p_glfb005,"%'"
      PREPARE s_analy_form_glfb004 FROM l_sql
      EXECUTE s_analy_form_glfb004 INTO l_n

      #IF l_n = 1 THEN   #170419-00037#1 mark lujh
      #IF l_n > 1 THEN    #170419-00037#1 add lujh   #170602-00004#1 mark
      IF l_n >= 1 THEN    #170602-00004#1
         SELECT DISTINCT glfb004 INTO r_glfb004
           FROM glfb_t
          WHERE glfbent = g_enterprise
            AND glfb005 = p_glfb005
         LET l_glfb005 = p_glfb005      #170304-00002#1 change r_glfb005 to l_glfb005           
      END IF
   END IF
      
   #161215-00022#1--add--str--lujh   
   LET r_glfb005 = l_glfb005
   LET r_glfb005 = r_glfb005.trim()
   #161215-00022#1--add--end--lujh
     
   RETURN r_glfb004,r_glfb005
END FUNCTION

################################################################################
# Descriptions...: 解析公式
# Memo...........:
# Usage..........: CALL s_analy_form(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa001   報表模板編號
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_str       公式
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add 
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
################################################################################
PUBLIC FUNCTION s_analy_form_formula(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#  DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #筛选条件
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_str4          STRING    #150812-00010#3
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   #150827-00036#1--add--end       
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   DEFINE l_message       STRING  #200925-00012#1 add
   
   LET r_success = TRUE
   LET r_amount = 0
   
   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   
   LET l_str  = ''
   LET l_str1 = ''
   LET l_str2 = ''
   CALL l_operator.clear()
   
   #抓取第一位字符是變量還是"("
   LET l_str2 = p_str.substring(1,1) 
    
#   LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符 #180829-00038#1 180829 mark by 08172
   LET l_delimiter1 = ".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #小数点字母數字當做分隔符  #180829-00038#1 180829 add by 08172
   LET l_delimiter2 = "+-*/()"                                                 #運算符、括號作為分隔符
   LET tok3 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
   LET tok4 = base.StringTokenizer.create(p_str,l_delimiter1)  #字母數字當做分隔符,取出運算符、括號
   
   #將公式里的運算符存放到數組里
   LET l_i = 1
   WHILE tok4.hasMoreTokens()
     LET l_str3 = tok4.nextToken()
     LET l_str3 = l_str3.trim()
     LET l_operator[l_i].symbol = l_str3
     IF cl_null(l_operator[l_i].symbol) THEN  #去除掉空格
        CALL l_operator.deleteElement(l_i)
     ELSE
        LET l_i = l_i + 1
     END IF
   END WHILE
   CALL l_operator.deleteElement(l_i)
   LET l_i = l_i - 1
   
   #定义SQL申请
   CALL s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce) #170510-00043#2 add
   
   #取出每個變量到變量設置作業(agli201)抓取金額,然後再重組公式算出最後金額
   LET l_j = 1
   WHILE tok3.hasMoreTokens()
     LET l_str1 = tok3.nextToken()
     
     #去除掉空格
     IF cl_null(l_str1) THEN 
        CONTINUE WHILE
     END IF

     LET l_str4 = l_str1   #150812-00010#3
     LET l_amt = 0  
     CALL s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,l_str1,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus'  #170222-00003#1 add ,p_show_ce,p_show_ye 
     RETURNING l_success,l_amt
     IF l_success = FALSE THEN
        LET r_success = FALSE
        RETURN r_success,r_amount
     END IF

     #150812-00010#3--s
     IF l_str4.substring(1,1)  MATCHES '[0123456789]' THEN
        LET l_amt = l_str1
     END IF
     #150812-00010#3--e     
     IF l_str2 = '(' THEN     
        IF cl_null(l_str) THEN
           LET l_str = l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        ELSE
           LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        END IF
     ELSE
        IF cl_null(l_str) THEN
           LET l_str = l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        ELSE
           LET l_str = l_str CLIPPED, l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        END IF
     END IF
     LET l_j = l_j + 1
   END WHILE
   
   #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
   IF l_i = l_j THEN 
      LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
   END IF
   
   IF cl_null(l_str) THEN 
      RETURN r_success,r_amount
   END IF
   
   #201111-00045#1 remark(s)
   #200925-00012#1 mark -s
   LET l_sql = "SELECT ",l_str CLIPPED," FROM DUAL"
   PREPARE l_sql_pre FROM l_sql
   EXECUTE l_sql_pre INTO r_amount
   
   #除數不可為0
   IF SQLCA.sqlerrd[2] = -1476 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00237'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','agl-00237',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = l_str
      #170623-00034#6---add--start
      IF NOT cl_null(g_fun_argv.glfbl004) THEN
         LET g_errparam.extend = s_get_field_name('agli070','glfbl004'),":",g_fun_argv.glfbl004,
                                 " & ",
                                 s_get_field_name('agli070','glfb003'), ":",g_fun_argv.glfb003,
                                 " >> ",
                                 l_str
      END IF
      #170623-00034#6---add--end
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','sub-00559',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   #200925-00012#1 mark -e
   #201111-00045#1 remark(e)
   
   #200925-00012#1 add -s
   #200925-00012#1 add -e
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
      
   #180723-00010#1---mark---str--
   ##小數取位
   #CALL s_num_round('1',r_amount,p_glfa009) RETURNING r_amount
   #180723-00010#1---mark---end--
   
   #根據金額單位對金額進行處理
   CASE p_glfa008
      WHEN '1'  #元
         LET r_amount = r_amount
      WHEN '2'  #千
         LET r_amount = r_amount / 1000
      WHEN '3'  #萬
         LET r_amount = r_amount / 10000
      OTHERWISE
         LET r_amount = r_amount
   END CASE
   
   #180723-00010#1---add---str--
   #小數取位
   IF NOT (g_prog = "aglq960" OR g_prog = "aglq860" OR g_prog = "aglq840" OR g_prog = "aglq820") THEN   #180917-00047#1 add aglq840,aglq820
      CALL s_num_round('1',r_amount,p_glfa009) RETURNING r_amount
   END IF
   #180723-00010#1---add---end--
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 獲取座標
# Memo...........:
# Usage..........: CALL s_analy_form_get_coordinate(p_glfa001,p_str)
#                  RETURNING r_success,r_amount
# Input parameter: p_glfa001   報表模板編號
#                : p_str       公式、座標
# Return code....: r_success   檢核狀態
#                : r_str       金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_coordinate(p_glfa001,p_str)
   DEFINE p_ld            LIKE glaa_t.glaald
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_str           STRING
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_glfb004       LIKE glfb_t.glfb004
   #DEFINE l_glfb005       LIKE glfb_t.glfb005   #161215-00022#1 mark lujh
   DEFINE l_glfb005       STRING                 #161215-00022#1 add lujh
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_flag          LIKE type_t.num5
   DEFINE l_success       LIKE type_t.num5
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE r_str           STRING
            
   LET r_success = TRUE
   LET r_amount = 0
   
   #將公式一直解析到全部是變量再算金額
   LET l_flag = TRUE
   WHILE l_flag 
      LET l_flag = FALSE
      LET l_str = ''
      LET l_str1 = ''
      LET l_str2 = ''
      CALL l_operator.clear()
      #抓取第一位字符是變量還是"("
      LET l_str2 = p_str.substring(1,1)
      
#      LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符 #180829-00038#1 180829 mark by 08172
      LET l_delimiter1 = ".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #小数点字母數字當做分隔符  #180829-00038#1 180829 add by 08172
      LET l_delimiter2 = "+-*/()"                                                 #運算符、括號作為分隔符
      LET tok5 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
      LET tok6 = base.StringTokenizer.create(p_str,l_delimiter1)  #字母數字當做分隔符,取出運算符、括號
      
      #將公式里的運算符存放到數組里
      LET l_i = 1
      WHILE tok6.hasMoreTokens()
        LET l_str3 = tok6.nextToken()
        LET l_str3 = l_str3.trim()
        LET l_operator[l_i].symbol = l_str3
        IF cl_null(l_operator[l_i].symbol) THEN   #去除掉空格
           CALL l_operator.deleteElement(l_i)
        ELSE
           LET l_i = l_i + 1
        END IF
      END WHILE
      CALL l_operator.deleteElement(l_i)
      LET l_i = l_i - 1
      
   
      #取出每個座標到財務報表結構設置作業(agli070)抓取公式
      LET l_j = 1
      WHILE tok5.hasMoreTokens() 
        LET l_str1 = tok5.nextToken()
        #去除掉空格
        IF cl_null(l_str1) THEN 
           CONTINUE WHILE
        END IF
        
        #根據座標抓取公式
        CALL s_analy_form_get_formula(p_glfa001,l_str1) RETURNING l_glfb004,l_glfb005 
        IF cl_null(l_glfb005) AND l_glfb004 = '2' THEN
           LET l_glfb005 = l_str1
        END IF
        IF cl_null(l_glfb005) AND (l_glfb004 = '1' OR cl_null(l_glfb004)) THEN
           LET l_glfb005 = 0
        END IF
        #150812-00010#3--s
        IF l_str1[1,1]  MATCHES '[0123456789]' THEN
           LET l_glfb005 = l_str1
        END IF
        #150812-00010#3--e   
        
        #防止有乘除的運算，先把公式用括號括起來
#        IF l_operator[l_j].symbol = '*' OR l_operator[l_j].symbol = '/' THEN   #200525-00028#1---mark 
        IF l_operator[l_j].symbol = '*' OR l_operator[l_j].symbol = '/' OR l_operator[l_j].symbol = '-'  THEN   #200525-00028#1---add        
           LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
        END IF
        
        #前一个运算符是乘、除、减,把后面的公式用括号括起来
        IF l_j > 1 THEN 
           #IF l_operator[l_j-1].symbol = '*' OR l_operator[l_j-1].symbol = '/' OR l_operator[l_j-1].symbol = '-' THEN   #200529-00062#1 mark
           IF l_operator[l_j-1].symbol = '*' OR l_operator[l_j-1].symbol = '/' OR l_operator[l_j-1].symbol = '-'  OR l_operator[l_j-1].symbol = '(' THEN   #200529-00062#1 add           
              LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
           END IF
        END IF

        IF l_str2 = '(' THEN 
           IF cl_null(l_str) THEN
              LET l_str = l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           ELSE
              LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           END IF
        ELSE
           IF cl_null(l_str) THEN
              LET l_str = l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           ELSE
              LET l_str = l_str CLIPPED, l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           END IF
        END IF
        LET l_j = l_j + 1
        
        IF l_glfb004 = '1' THEN 
           LET l_flag = TRUE
        END IF
      END WHILE 
      
      #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
      IF l_i = l_j THEN 
         LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
      END IF
      
      LET p_str = l_str    
   END WHILE      
   
   LET r_str = l_str
   RETURN r_success,r_str
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
#                : ##181121-00017#1 p_glfc001改成ls_js
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#  DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       LIKE glfc_t.glfc001
   DEFINE p_glfc002       LIKE glfc_t.glfc002
   DEFINE p_glfc003       LIKE glfc_t.glfc003
   DEFINE p_glfc004       LIKE glfc_t.glfc004
   DEFINE p_glfc005       LIKE glfc_t.glfc005
   DEFINE p_glfc006       LIKE glfc_t.glfc006
   DEFINE p_glfc007       LIKE glfc_t.glfc007
   DEFINE p_glfc008       LIKE glfc_t.glfc008
   DEFINE p_glfc010       LIKE glfc_t.glfc010
   DEFINE p_wc            STRING
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   DEFINE l_field         LIKE type_t.chr100
   DEFINE l_glaa004       LIKE glaa_t.glaa004
   DEFINE l_glac008       LIKE glac_t.glac008
   DEFINE l_sql_ce        STRING
   DEFINE l_wc_ce         STRING
   DEFINE l_field1        LIKE type_t.chr100
   DEFINE l_amt_ce        LIKE glar_t.glar005
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   DEFINE l_amt_st        LIKE glar_t.glar005
   DEFINE l_amt_ad        LIKE glar_t.glar005
   DEFINE l_sql_st        STRING
   DEFINE l_sql_ad        STRING
   DEFINE l_sql_stus      STRING
   DEFINE l_sql_stus_1    STRING
   #150827-00036#1--add--end
   DEFINE l_sum_str       STRING #160526-00035#1 add
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   DEFINE l_amt_ye        LIKE glar_t.glar005
   DEFINE l_sql_ye        STRING
   #170222-00003#1 add e---   
   #170406-00082#1-----s
   DEFINE l_bdate    LIKE type_t.dat
   DEFINE l_edate    LIKE type_t.dat
   DEFINE l_glaa003  LIKE glaa_t.glaa003
   DEFINE l_ddate    LIKE type_t.dat
   #170406-00082#1-----e
   DEFINE l_sum_str_ce       STRING   #撈取欄位 #190202-00002#1 add
   DEFINE l_sum_str_ye       STRING   #撈取欄位 #190202-00002#1 add
   DEFINE l_sum_str_st       STRING   #撈取欄位 #190202-00002#1 add
   DEFINE l_sum_str_ad       STRING   #撈取欄位 #190202-00002#1 add
   #181121-00017#2 #cy02 add s---
   DEFINE lc_param        RECORD
       glfc001            LIKE glfc_t.glfc001,     
       glaq022            LIKE glaq_t.glaq022  
                          END RECORD 
   DEFINE ls_js           STRING   
   DEFINE l_where1        STRING
   DEFINE l_where         STRING   
   #181121-00017#2 #cy02 add e---
   #200927-00028#1 add -s
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_amt_ad1       LIKE glar_t.glar005
   #200927-00028#1 add -e
   DEFINE l_num4           LIKE type_t.num10  #200825-00025#1 add
   
   #200825-00025#1 add(s)
   IF cl_null(ls_js) THEN LET ls_js = ' ' END IF
   IF cl_null(p_glfc002) THEN LET p_glfc002 = ' ' END IF
   IF cl_null(p_glfc003) THEN LET p_glfc003 = ' ' END IF
   IF cl_null(p_glfc004) THEN LET p_glfc004 = ' ' END IF
   IF cl_null(p_glfc005) THEN LET p_glfc005 = ' ' END IF
   IF cl_null(p_glfc006) THEN LET p_glfc006 = ' ' END IF
   IF cl_null(p_glfc007) THEN LET p_glfc007 = ' ' END IF
   IF cl_null(p_glfc008) THEN LET p_glfc008 = ' ' END IF
   IF cl_null(p_glfc010) THEN LET p_glfc010 = ' ' END IF
   IF cl_null(p_wc) THEN LET p_wc = ' ' END IF
   #检查动态数组中是否有重复
   FOR l_num4 = 1 TO g_s_analy_form_get_amt_reuse.getLength()
       IF g_s_analy_form_get_amt_reuse[l_num4].ld = p_ld AND g_s_analy_form_get_amt_reuse[l_num4].year = p_year AND g_s_analy_form_get_amt_reuse[l_num4].bmonth = p_bmonth 
       AND g_s_analy_form_get_amt_reuse[l_num4].emonth = p_emonth AND g_s_analy_form_get_amt_reuse[l_num4].ls_js = ls_js AND g_s_analy_form_get_amt_reuse[l_num4].glfc002 = p_glfc002 
       AND g_s_analy_form_get_amt_reuse[l_num4].glfc003 = p_glfc003 AND g_s_analy_form_get_amt_reuse[l_num4].glfc004 = p_glfc004 AND g_s_analy_form_get_amt_reuse[l_num4].glfc005 = p_glfc005
       AND g_s_analy_form_get_amt_reuse[l_num4].glfc006 = p_glfc006 AND g_s_analy_form_get_amt_reuse[l_num4].glfc007 = p_glfc007 AND g_s_analy_form_get_amt_reuse[l_num4].glfc008 = p_glfc008
       AND g_s_analy_form_get_amt_reuse[l_num4].glfc010 = p_glfc010 AND g_s_analy_form_get_amt_reuse[l_num4].wc = p_wc AND g_s_analy_form_get_amt_reuse[l_num4].show_ad = p_show_ad 
       AND g_s_analy_form_get_amt_reuse[l_num4].stus = p_stus AND g_s_analy_form_get_amt_reuse[l_num4].show_ce = p_show_ce AND g_s_analy_form_get_amt_reuse[l_num4].show_ye = p_show_ye THEN
          LET r_success = g_s_analy_form_get_amt_reuse[l_num4].success
          LET r_amount = g_s_analy_form_get_amt_reuse[l_num4].amount
          RETURN r_success,r_amount
       END IF
   END FOR
   #200825-00025#1 add(e)
   
   CALL util.JSON.parse(ls_js,lc_param)  #181121-00017#2 #cy02 add 
   
   LET p_glfc001 = lc_param.glfc001 #181121-00017#2 #cy02 add 
   
   LET r_success = TRUE
   LET l_field = ''
   LET l_field1 = ''
   LET r_amount = 0
   LET l_amt_ce = 0
   LET l_amt_ye = 0 #170222-00003#1 add
   LET l_glac008 = ''
   LET l_amt_st = 0
   LET l_amt_ad = 0
#2015/1/23--mod--str--   
   #抓取科目參照表
#   IF cl_null(p_comp) THEN
#      SELECT glaa004 INTO l_glaa004
#        FROM glaa_t
#        WHERE glaaent = g_enterprise
#          AND glaald = p_ld
#   ELSE
#170510-00043#2--mark--str--
#      LET l_sql ="  SELECT DISTINCT glaa004  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#                 "  AND glaald IN ('",p_ld,"') "
#      PREPARE glaa004_pre FROM l_sql
#      EXECUTE glaa004_pre INTO l_glaa004 
#170510-00043#2--mark--end
   
#170510-00043#2--mark--str--
#      #170406-00082#1-----s
#      LET l_sql ="  SELECT DISTINCT glaa003  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#                 "  AND glaald IN ('",p_ld,"') "
#      PREPARE glaa003_pre FROM l_sql
#      EXECUTE glaa003_pre INTO l_glaa003
#      #170406-00082#1-----e
#170510-00043#2--mark--end
#   END IF   
#2015/1/23--mod--end     

   #170406-00082#1-----s
#   CALL s_fin_date_get_period_range(l_glaa003,p_year,p_bmonth)RETURNING l_bdate,l_ddate #170510-00043#2 mark
#   CALL s_fin_date_get_period_range(l_glaa003,p_year,p_emonth)RETURNING l_ddate,l_edate  #170510-00043#2 mark
   #170510-00043#2--add--str--
   IF p_show_ce = 'N' THEN
      LET l_bdate = g_bdate
      LET l_edate = g_edate
   #170510-00043#2--add--end
   LET l_edate = l_edate + 1
   END IF #170510-00043#2 add
   #170406-00082#1-----e
      
   
   #抓取起始科目的正常餘額形態
#170510-00043#2--mod--str--
#   SELECT glac008 INTO l_glac008
#     FROM glac_t
#    WHERE glacent = g_enterprise
#      AND glac001 = l_glaa004
#      AND glac002 = p_glfc003   
   
   EXECUTE glac008_pre USING p_glfc003 INTO l_glac008 
#170510-00043#2--mod--end   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF
   
   #150827-00036#1--add--str--
   IF cl_null(p_stus) THEN
      LET p_stus='1'  
   END IF 
   CASE p_stus
      WHEN '1' 
         LET l_sql_stus=" AND glapstus='S'"
      WHEN '2'
         LET l_sql_stus=" AND glapstus IN ('S','Y') "
         LET l_sql_stus_1=" AND glapstus='Y' "
      WHEN '3'
         LET l_sql_stus=" AND glapstus IN ('S','Y','N') "
         LET l_sql_stus_1=" AND glapstus IN ('Y','N') "
   END CASE    
   #150827-00036#1--add--end
   
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         LET l_sql = "SELECT SUM(glar005 - glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glar003 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glar003 < ",p_bmonth
         END IF
             
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sql_ce="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            #"   AND glap007 = 'CE'",     #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",     #210426-00027#1 mark  #210527-00003#1 remark
                           #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t51)",  #210426-00027#1 add   #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",   
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",    #210426-00027#1 mark  #210527-00003#1 remark
                           #"                                     )t52", #210426-00027#1 add   #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL", 
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",     #210426-00027#1 mark  #210527-00003#1 remark
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t53",  #210426-00027#1 add  #210527-00003#1 mark
                                  "))",       
                            #170406-00082#1-----e
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            #排除YE憑證
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add        
               LET l_sql_ye="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add  
            END IF                
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1 mark 
         
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
      WHEN '2'  #期初餘額在借方
#         LET l_sql = "SELECT SUM(glar005) ",      #160526-00035#1 mark
#                     "  FROM glar_t ",            #160526-00035#1 mark
         LET l_sum_str = " SUM(glar005-glar006) "  #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",             #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glar003 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glar003 < ",p_bmonth
         END IF
         
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sum_str_ce = " SUM(glaq003-glaq004) "   #190202-00002#1 add               
              #LET l_sql_ce="SELECT SUM(glaq003) ",          #190202-00002#1 mark
               LET l_sql_ce = " " ,                          #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            #"   AND glap007 = 'CE'",     #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t54)",  #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t55",  #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",    #210426-00027#1 mark  #210527-00003#1 remark
                    #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t56", #210426-00027#1 add   #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add
                            
            #170222-00003#1 add s---
            END IF
            #排除YE憑證    
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
               LET l_sum_str_ye =" SUM(glaq003-glaq004) "   #190202-00002#1 add
              #LET l_sql_ye="SELECT SUM(glaq003) ",         #190202-00002#1 mark
               LET l_sql_ye=" ",                            #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add 
            END IF                              
            #170222-00003#1 add e---                           
         #END IF #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sum_str_st = " SUM(glaq003-glaq004) "   #190202-00002#1 add
           #LET l_sql_st="SELECT SUM(glaq003) ",          #190202-00002#1 mark            
            LET l_sql_st="  ",                            #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sum_str_ad=" SUM(glaq003-glaq004) "   #190202-00002#1 add
           #LET l_sql_ad="SELECT SUM(glaq003) ",        #190202-00002#1 mark
            LET l_sql_ad="  ",                          #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
      WHEN '3'  #期初餘額在貸方
#          LET l_sql = "SELECT SUM(glar006) ",    #160526-00035#1 mark
#                     "  FROM glar_t ",           #160526-00035#1 mark
         LET l_sum_str = " SUM(glar006-glar005) " #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",            #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glar003 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glar003 < ",p_bmonth
         END IF
               
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sum_str_ce = " SUM(glaq004-glaq003) "   #190202-00002#1 add 
              #LET l_sql_ce="SELECT SUM(glaq004) ",          #190202-00002#1 mark
               LET l_sql_ce=" ",                             #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            #"   AND glap007 = 'CE'",     #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t57)",  #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t58",  #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",     #210426-00027#1 mark  #210527-00003#1 reamrk
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t59",  #210426-00027#1 add  #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add   
            #170222-00003#1 add s---
            END IF
            #排除YE憑
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
               LET l_sum_str_ye = " SUM(glaq004-glaq003) "   #190202-00002#1 add
              #LET l_sql_ye="SELECT SUM(glaq004) ",          #190202-00002#1 mark
               LET l_sql_ye="  ",                            #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add    
            END IF                            
            #170222-00003#1 add e---
         #END IF #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sum_str_st=" SUM(glaq004-glaq003) "   #190202-00002#1 add
           #LET l_sql_st="SELECT SUM(glaq004) ",        #190202-00002#1 mark
            LET l_sql_st="  ",                          #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sum_str_ad=" SUM(glaq004-glaq003) "   #190202-00002#1 add
           #LET l_sql_ad="SELECT SUM(glaq004) ",        #190202-00002#1 mark
            LET l_sql_ad="  ",                          #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
      WHEN '4'  #本期借方
          LET l_sql = "SELECT SUM(glar005) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sql_ce="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",      #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t60)",   #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t61",  #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",      #210426-00027#1 mark  #210527-00003#1 remark
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t62",   #210426-00027#1 add  #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            #排除YE憑證
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add            
               LET l_sql_ye="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add  
            END IF                            
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1 mark
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '5'  #本期貸方
          LET l_sql = "SELECT SUM(glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1'  #170222-00003#1 mark 
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sql_ce="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t63)",  #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",    #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t64", #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",      #210426-00027#1 mark  #210527-00003#1 reamrk
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t65",   #210426-00027#1 add  #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---        
            END IF
            #排除YE憑證
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
               LET l_sql_ye="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add 
            END IF                            
            #170222-00003#1 add e---                           
         #END IF  #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '6'  #本期發生額
          LET l_sql = "SELECT SUM(glar005 - glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1'  #170222-00003#1 mark 
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sql_ce="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",    #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t66)",  #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t67",  #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",     #210426-00027#1 mark  #210527-00003#1 remark
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t68",  #210426-00027#1 add  #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e                            
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            #排除YE憑
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
               LET l_sql_ye="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add   
            END IF                            
            #170222-00003#1 add e---                         
         #END IF  #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '7'  #期末餘額
          LET l_sql = "SELECT SUM(glar005 - glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                    #"   AND glar003 < =  ",p_emonth, #PGS(D)-10500-mark
                     "   AND glar003 <=  ",p_emonth,  #PGS(D)-10500-add
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sql_ce="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                           #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                            "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t69)",  #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t70",  #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",    #210426-00027#1 mark  #210527-00003#1 remark
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t71", #210426-00027#1 add  #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e                          
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
               #排除YE憑證
               LET l_sql_ye="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                           #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                            "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add   
            END IF                            
            #170222-00003#1 add e---                         
         #END IF  #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                         "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                         "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '8'  #期末餘額在借方
#          LET l_sql = "SELECT SUM(glar005) ",    #160526-00035#1 mark
#                     "  FROM glar_t ",           #160526-00035#1 mark
         LET l_sum_str = " SUM(glar005-glar006) " #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",            #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                    #"   AND glar003 < =  ",p_emonth, #PGS(D)-10500-mark
                     "   AND glar003 <=  ",p_emonth,  #PGS(D)-10500-add
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sum_str_ce = " SUM(glaq003-glaq004) "   #190202-00002#1 add
              #LET l_sql_ce="SELECT SUM(glaq003) ",          #190202-00002#1 mark
               LET l_sql_ce="  ",                            #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                           #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                            "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",    #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t72)", #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",     #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t73",  #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",     #210426-00027#1 mark  #210527-00003#1 remark
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t74",  #210426-00027#1 add  #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
                            
            #170222-00003#1 add s---
            END IF
            #排除YE憑证
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
               LET l_sum_str_ye = " SUM(glaq003-glaq004) "   #190202-00002#1 add
              #LET l_sql_ye="SELECT SUM(glaq003) ",          #190202-00002#1 mark
               LET l_sql_ye="  ",                            #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                           #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                            "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add  
            END IF                            
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1 mark
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sum_str_st=" SUM(glaq003-glaq004) "   #190202-00002#1 add
           #LET l_sql_st="SELECT SUM(glaq003) ",        #190202-00002#1 mark
            LET l_sql_st="  ",                          #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                         "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sum_str_ad=" SUM(glaq003-glaq004) "   #190202-00002#1 add
           #LET l_sql_ad="SELECT SUM(glaq003) ",        #190202-00002#1 mark
            LET l_sql_ad="  ",                          #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                         "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '9'  #期末餘額在貸方
#          LET l_sql = "SELECT SUM(glar006) ",    #160526-00035#1 mark
#                     "  FROM glar_t ",           #160526-00035#1 mark
         LET l_sum_str = " SUM(glar006-glar005) " #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",            #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                    #"   AND glar003 < =  ",p_emonth, #PGS(D)-10500-mark
                     "   AND glar003 <=  ",p_emonth,  #PGS(D)-10500-add
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                    
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
            #IF p_show_ce = 'N' THEN  #170222-00003#1 add #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
               LET l_sum_str_ce = " SUM(glaq004-glaq003) "   #190202-00002#1 add
              #LET l_sql_ce="SELECT SUM(glaq004) ",          #190202-00002#1 mark
               LET l_sql_ce="  ",                            #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                           #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                            "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",      #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"')t75)",   #210426-00027#1 add  #210527-00003#1 mark
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",      #210426-00027#1 mark  #210527-00003#1 remark
                            #"                                     )t76",   #210426-00027#1 add  #210527-00003#1 mark
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",      #210426-00027#1 mark  #210527-00003#1 remark
                     #"                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')t77",   #210426-00027#1 add  #210527-00003#1 mark
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add              
            #170222-00003#1 add s---
            END IF
            #排除YE憑证
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
               LET l_sum_str_ye = " SUM(glaq004-glaq003) "   #190202-00002#1 add
              #LET l_sql_ye="SELECT SUM(glaq004) ",          #190202-00002#1 mark
               LET l_sql_ye="  ",                            #190202-00002#1 add
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                           #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                            "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add   
            END IF                         
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1  mark
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sum_str_st=" SUM(glaq004-glaq003) "   #190202-00002#1 add
           #LET l_sql_st="SELECT SUM(glaq004) ",        #190202-00002#1 mark
            LET l_sql_st="  ",                          #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                         "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sum_str_ad=" SUM(glaq004-glaq003) "   #190202-00002#1 add
           #LET l_sql_ad="SELECT SUM(glaq004) ",        #190202-00002#1 mark
            LET l_sql_ad="  ",                          #190202-00002#1 add
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        #"   AND glap004 < =  ",p_emonth, #PGS(D)-10500-mark
                         "   AND glap004 <=  ",p_emonth,  #PGS(D)-10500-add
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
         #200312-00058#1 add(s)
         WHEN 'A'  #年初数
            LET l_sql = "SELECT SUM(glar005 - glar006) ",
                        "  FROM glar_t ",
                        " WHERE glarent = '",g_enterprise,"' ",
                        "   AND glarld IN ('",p_ld,"') ",
                        "   AND glar002 = ",p_year,
                        "   AND glar003 = 0 ",
                        "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' "
         #200312-00058#1 add(e)
         #200724-00083#1 add(s)
         LET p_bmonth = 0
         LET p_emonth = p_bmonth
         #200724-00083#1 add(e)
   END CASE 


   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field = 'glar012'
         LET l_field1= 'glaq017'
      WHEN '2'   #部門
         LET l_field = 'glar013'
         LET l_field1= 'glaq018'
      WHEN '3'   #利潤/成本中心
         LET l_field = 'glar014'
         LET l_field1= 'glaq019'
      WHEN '4'   #區域
         LET l_field = 'glar015'
         LET l_field1= 'glaq020'
      WHEN '5'   #交易客商
         LET l_field = 'glar016'
         LET l_field1= 'glaq021'
      WHEN '6'   #帳款客商
         LET l_field = 'glar017'
         LET l_field1= 'glaq022'
      WHEN '7'   #客群
         LET l_field = 'glar018'
         LET l_field1= 'glaq023'
      WHEN '8'   #產品類別
         LET l_field = 'glar019'
         LET l_field1= 'glaq024'
      WHEN '9'   #經營方式
         LET l_field = 'glar051'
         LET l_field1= 'glaq051'
      WHEN '10'   #渠道
         LET l_field = 'glar052'
         LET l_field1= 'glaq052'
      WHEN '11'   #品牌
         LET l_field = 'glar053'
         LET l_field1= 'glaq053'
      WHEN '12'   #人員
         LET l_field = 'glar020'
         LET l_field1= 'glaq025'
#      WHEN '10'  #預算編號
#         LET l_field = 'glar021'
      
      WHEN '13'  #專案編號
         LET l_field = 'glar022'
         LET l_field1= 'glaq027'
      WHEN '14'  #WBS
         LET l_field = 'glar023'
         LET l_field1= 'glaq028'
      WHEN '15'  #自由核算項一
         LET l_field = 'glar024'
         LET l_field1= 'glaq029'
      WHEN '16'  #自由核算項二
         LET l_field = 'glar025'
         LET l_field1= 'glaq030'
      WHEN '17'  #自由核算項三
         LET l_field = 'glar026'
         LET l_field1= 'glaq031'
      WHEN '18'  #自由核算項四
         LET l_field = 'glar027'
         LET l_field1= 'glaq032'
      WHEN '19'  #自由核算項五
         LET l_field = 'glar028'
         LET l_field1= 'glaq033'
      WHEN '20'  #自由核算項六
         LET l_field = 'glar029'
         LET l_field1= 'glaq034'
      WHEN '21'  #自由核算項七
         LET l_field = 'glar030'
         LET l_field1= 'glaq035'
      WHEN '22'  #自由核算項八
         LET l_field = 'glar031'
         LET l_field1= 'glaq036'
      WHEN '23'  #自由核算項九
         LET l_field = 'glar032'
         LET l_field1= 'glaq037'
      WHEN '24'  #自由核算項十
         LET l_field = 'glar033'
         LET l_field1= 'glaq038'
      OTHERWISE
         LET l_field = ''
         LET l_field1= ''
   END CASE

   #181121-00017#2 #cy02 add s---
   IF NOT cl_null(lc_param.glaq022) THEN 
      LET l_where = " AND ",l_field," IN('",lc_param.glaq022,"')"
      LET l_where1 = " AND ",l_field1," IN('",lc_param.glaq022,"')"
   ELSE
      LET l_where = " AND 1=1 " 
      LET l_where1 = " AND 1=1 "       
   END IF
   #181121-00017#2 #cy02 add e---   
   
#2015/1/23--mod--str--
#   #過濾統治科目
#   IF cl_null(p_comp) THEN
#      LET l_sql = l_sql," AND glar001 IN (SELECT glac002 FROM glac_t ",
#                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
#                        "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
#   ELSE
#     LET l_sql = l_sql," AND glar001 IN (SELECT glac002 FROM glac_t ",
#                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
#                        "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')",
#                        " AND glar012 = '",p_comp,"'"
#   END IF   
   LET l_sql = l_sql," AND glar001 IN (SELECT glac002 FROM glac_t ",
                     "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                     "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                     "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"     #210426-00027#1 mark  #210527-00003#1 remark
                     #"                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')t78"  #210426-00027#1 add  #210527-00003#1 mark
   IF NOT cl_null(p_wc) THEN
      LET l_sql = l_sql," AND ",p_wc
   END IF
#2015/1/23--mod--end
   #核算项范围条件
   IF cl_null(lc_param.glaq022) THEN  #181121-00017#2 #cy02 add  
      IF NOT cl_null(l_field) THEN       
         IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
         END IF
         
         IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
         END IF
         IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
         END IF
      END IF
   #181121-00017#2 #cy02 add s---    
   ELSE
      IF NOT cl_null(l_where) THEN    
         LET l_sql = l_sql,l_where
      END IF  
   END IF   
   #181121-00017#2 #cy02 add e---
   
   
   #額外條件
   IF NOT cl_null(p_glfc010) THEN 
      LET l_sql = l_sql," AND ",p_glfc010
   END IF
   
   #150827-00036#1--add--str--
   #损益类报表 OR 單據狀態=2 or 3 OR 不含審計調整傳票
   IF g_glfa002 = '2' OR p_stus='2' OR p_stus='3' OR p_show_ad='N' OR p_show_ye='N' OR p_show_ce='N' OR g_glfa002 = '1' THEN  #170222-00003#1 add p_show_ye='N' OR p_show_ce='N' OR g_glfa002 = '1'
      IF NOT cl_null(p_wc) THEN
         LET l_wc_ce=cl_replace_str(p_wc,"glar001","glaq002")
         LET l_wc_ce=cl_replace_str(l_wc_ce,"glar012","glaq017")
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar013','glaq018')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar014','glaq019')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar015','glaq020')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar016','glaq021')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar017','glaq022')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar018','glaq023')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar019','glaq024')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar051','glaq051')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar052','glaq052')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar053','glaq053')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar020','glaq025')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar022','glaq027')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar023','glaq028')
         #自由核算項
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar024','glaq029')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar025','glaq030')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar026','glaq031')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar027','glaq032')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar028','glaq033')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar029','glaq034')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar030','glaq035')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar031','glaq036')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar032','glaq037')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar033','glaq038')
      END IF
   END IF
   #150827-00036#1--add--end
   
   #损益类报表
   #IF g_glfa002 = '2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
      #IF p_show_ce = 'N' THEN #170222-00003#1 add  #190111-00025#1 mark
      IF p_show_ce = 'N' AND p_bmonth <> 0 THEN     #190111-00025#1 add
         LET l_sql_ce = l_sql_ce," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                                 "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                                 "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                                 "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"      #210426-00027#1 mark  #210527-00003#1 remark
                                 #"                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')t79"   #210426-00027#1 add  #210527-00003#1 mark
         IF NOT cl_null(l_wc_ce) THEN
            LET l_sql_ce = l_sql_ce," AND ",l_wc_ce
         END IF
         #核算项范围条件
         IF cl_null(lc_param.glaq022) THEN #181121-00017#2 #cy02 add      
            IF NOT cl_null(l_field1) THEN  #150827-00036#1 add
               IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                  LET l_sql_ce = l_sql_ce," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
               END IF
               
               IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
                  LET l_sql_ce = l_sql_ce," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
               END IF
               IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                  LET l_sql_ce = l_sql_ce," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
               END IF
            END IF #150827-00036#1 add
         #181121-00017#2 #cy02 add s---    
         ELSE
            IF NOT cl_null(l_where1) THEN    
               #LET l_sql = l_sql,l_where1 #200721-00013#1 mark
               LET l_sql_ce = l_sql_ce,l_where1 #200721-00013#1 add 
            END IF  
         END IF   
         #181121-00017#2 #cy02 add e---         
         
         #190202-00002#1-(S) add
         IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
            IF cl_null(l_field1) THEN
               LET l_field1="''"
            END IF
            LET l_sql_ce="SELECT sum(amt) ",
                         "  FROM (",
                         "        SELECT glaq002,",l_field1,",",l_sum_str_ce," amt ",l_sql_ce,
                         "         GROUP BY glaq002,",l_field1,
                         "         HAVING ",l_sum_str_ce,">0 ",
                         "       )"
         END IF
         #190202-00002#1-(E) add
         
         #CE类凭证金额
         PREPARE glaq_ce_pre FROM l_sql_ce
         EXECUTE glaq_ce_pre INTO l_amt_ce
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00559'
            LET g_errparam.extend = p_glfc001
            LET g_errparam.popup = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            RETURN r_success,r_amount
         END IF
         IF cl_null(l_amt_ce) THEN LET l_amt_ce=0 END IF
      END IF #170222-00003#1 add
      #170222-00003#1 add s---  
      #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
      IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add
         LET l_sql_ye = l_sql_ye," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                                 "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                                 "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                                 "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
         IF NOT cl_null(l_wc_ce) THEN
            LET l_sql_ye = l_sql_ye," AND ",l_wc_ce
         END IF
         #核算项范围条件
         IF cl_null(lc_param.glaq022) THEN #181121-00017#2 #cy02 add
            IF NOT cl_null(l_field1) THEN  #150827-00036#1 add
               IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                  LET l_sql_ye = l_sql_ye," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
               END IF
               
               IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
                  LET l_sql_ye = l_sql_ye," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
               END IF
               IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                  LET l_sql_ye = l_sql_ye," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
               END IF
            END IF #150827-00036#1 add
         #181121-00017#2 #cy02 add s---    
         ELSE
            IF NOT cl_null(l_where1) THEN 
               #LET l_sql = l_sql,l_where1 #200721-00013#1 mark
               LET l_sql_ye = l_sql_ye,l_where1 #200721-00013#1 add
            END IF  
         END IF   
         #181121-00017#2 #cy02 add e---
         #190202-00002#1-(S) add
         #210426-00027#1 mark---(s)
         IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
            IF cl_null(l_field1) THEN
               LET l_field1="''"
            END IF
            LET l_sql_ye="SELECT sum(amt) ",
                         "  FROM (",
                         "        SELECT glaq002,",l_field1,",",l_sum_str_ye," amt ",l_sql_ye,
                         "         GROUP BY glaq002,",l_field1,
                         "         HAVING ",l_sum_str_ye,">0 ",
                         "       )"
         END IF
         #190202-00002#1-(E) add
         #210426-00027#1 mark---(e)
         
         #YE类凭证金额
         PREPARE glaq_ye_pre FROM l_sql_ye
         EXECUTE glaq_ye_pre INTO l_amt_ye
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00559'
            LET g_errparam.extend = p_glfc001
            LET g_errparam.popup = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            RETURN r_success,r_amount
         END IF
         IF cl_null(l_amt_ye) THEN LET l_amt_ye=0 END IF
      END IF         
      #170222-00003#1 add e---      
   #END IF #170222-00003#1  mark
   
   IF p_glfc008 <> 'A' THEN  #210325-00005#1----add ---因为年初数里没有对 l_sql_st 和  l_sql_ad赋值
   #150827-00036#1--add--str--
   #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
   IF p_stus='2' OR p_stus='3' THEN
      LET l_sql_st = l_sql_st," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                              "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                              "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                              "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
      IF NOT cl_null(l_wc_ce) THEN
         LET l_sql_st = l_sql_st," AND ",l_wc_ce
      END IF
      #核算项范围条件
      IF cl_null(lc_param.glaq022) THEN #181121-00017#2 #cy02 add
         IF NOT cl_null(l_field1) THEN
            IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_st = l_sql_st," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
            END IF
            
            IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
               LET l_sql_st = l_sql_st," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
            END IF
            IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_st = l_sql_st," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
            END IF
         END IF
      #181121-00017#2 #cy02 add s---    
      ELSE
         IF NOT cl_null(l_where1) THEN     
            #LET l_sql = l_sql,l_where1 #200721-00013#1 mark
            LET l_sql_st = l_sql_st,l_where1 #200721-00013#1 add
         END IF  
      END IF   
      #181121-00017#2 #cy02 add e---           
      
      #190202-00002#1-(S) add
      IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
         IF cl_null(l_field1) THEN
            LET l_field1="''"
         END IF
         LET l_sql_st="SELECT sum(amt) ",
                      "  FROM (",
                      "        SELECT glaq002,",l_field1,",",l_sum_str_st," amt ",l_sql_st,
                      "         GROUP BY glaq002,",l_field1,
                      #"         HAVING ",l_sum_str_st,">0 ",  #200317-00012#1 mark
                      "       )"
      END IF
      #190202-00002#1-(E) add
      
      #CE类凭证金额
      PREPARE glaq_st_pre FROM l_sql_st
      EXECUTE glaq_st_pre INTO l_amt_st
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00559'
         LET g_errparam.extend = p_glfc001
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success,r_amount
      END IF
      IF cl_null(l_amt_st) THEN LET l_amt_st=0 END IF
   END IF
   #金額減少：排除AD審計調整憑證金額（-）
   IF p_show_ad = 'N' THEN
      LET l_sql_ad = l_sql_ad," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                              "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                              "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                              "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
      IF NOT cl_null(l_wc_ce) THEN
         LET l_sql_ad = l_sql_ad," AND ",l_wc_ce
      END IF
      #核算项范围条件
      IF cl_null(lc_param.glaq022) THEN #181121-00017#2 #cy02 add
         IF NOT cl_null(l_field1) THEN
            IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_ad = l_sql_ad," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
            END IF
            
            IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
               LET l_sql_ad = l_sql_ad," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
            END IF
            IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_ad = l_sql_ad," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
            END IF
         END IF
      #181121-00017#2 #cy02 add s---    
      ELSE
         IF NOT cl_null(l_where1) THEN    
            #LET l_sql = l_sql,l_where1 #200721-00013#1 mark
            LET l_sql_ad = l_sql_ad,l_where1 #200721-00013#1 add
         END IF  
      END IF   
      #181121-00017#2 #cy02 add e---        
      #190202-00002#1-(S) add
      IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
         IF cl_null(l_field1) THEN
            LET l_field1="''"
         END IF
         LET l_sql_ad="SELECT sum(amt) ",
                      "  FROM (",
                      "        SELECT glaq002,",l_field1,",",l_sum_str_ad," amt ",l_sql_ad,
                      "         GROUP BY glaq002,",l_field1,
                      "       )t83"
      END IF
      #190202-00002#1-(E) add
      
      #CE类凭证金额
      PREPARE glaq_ad_pre FROM l_sql_ad
      EXECUTE glaq_ad_pre INTO l_amt_ad
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00559'
         LET g_errparam.extend = p_glfc001
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success,r_amount
      END IF
      IF cl_null(l_amt_ad) THEN LET l_amt_ad=0 END IF
      #200927-00028#1 add -s
      #取本年利润审计调整损益科目金额
      CALL s_analy_form_get_amt_ad(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,l_wc_ce,p_stus) 
         RETURNING l_success,l_amt_ad1
      LET l_amt_ad = l_amt_ad + l_amt_ad1
      #200927-00028#1 add -e
   END IF
   #150827-00036#1--add--end
   END IF #210325-00005#1----add    
   #160526-00035#1--add--str--
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF cl_null(l_field) THEN
         LET l_field="''"
      END IF
      LET l_sql="SELECT sum(amt) ",
                "  FROM (",
                "        SELECT glar001,",l_field,",",l_sum_str," amt ",l_sql,
                "         GROUP BY glar001,",l_field,
                "         HAVING ",l_sum_str,">0 ",  #200317-00012#1 mark  #200629-00035#1 remark
                "       )"
   END IF
   #160526-00035#1--add--end
   
   PREPARE glar_pre FROM l_sql
   EXECUTE glar_pre INTO r_amount
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,p_glfc001,'','sub-00559',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   #IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' THEN   #1:期初餘額 6:本期發生額 7:期末餘額                            #200312-00058#1 mark
   IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' OR p_glfc008 = 'A' THEN   #1:期初餘額 6:本期發生額 7:期末餘額 A:年初数  #200312-00058#1 add
      IF l_glac008 = '2' THEN   #貸余
         LET r_amount = r_amount * -1
         #损益类报表
         #IF g_glfa002 = '2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1  mark
            #LET l_amt_ce = l_amt_ce * -1 #170222-00003#1 mark
            #170222-00003#1 add s---
            #IF p_show_ce = 'N' THEN                   #190111-00025#1 mark
            IF p_show_ce = 'N' AND p_bmonth <> 0 THEN  #190111-00025#1 add  
               LET l_amt_ce = l_amt_ce * -1
            END IF
            #IF p_show_ye = 'N' THEN                   #200724-00083#1 mark
            IF p_show_ye = 'N' AND p_bmonth <> 0 THEN  #200724-00083#1 add            
               LET l_amt_ye = l_amt_ye * -1 
            END IF 
            #170222-00003#1 add e---            
         #END IF #170222-00003#1 mark
         
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_amt_st = l_amt_st * -1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_amt_ad = l_amt_ad * -1
         END IF
         #150827-00036#1--add--end
      END IF
   END IF
   
   #损益类报表时去除CE类凭证金额
   #IF g_glfa002 = '2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
      #LET r_amount = r_amount - l_amt_ce #170222-00003#1 mark
      #170222-00003#1 add s---
      IF p_show_ce = 'N' THEN  
         LET r_amount = r_amount - l_amt_ce
      END IF
      IF p_show_ye = 'N' THEN            
         LET r_amount = r_amount - l_amt_ye 
      END IF       
      #170222-00003#1 add e---
   #END IF mark
   
   #150827-00036#1--add--str--
   #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
   IF p_stus='2' OR p_stus='3' THEN
      LET r_amount = r_amount + l_amt_st
   END IF
   #金額減少：排除AD審計調整憑證金額（-）
   IF p_show_ad = 'N' THEN
      LET r_amount = r_amount - l_amt_ad  
   END IF
   #150827-00036#1--add--end
   
   #200317-00012#1 add(s)
   IF p_glfc008 = '2' OR p_glfc008 = '3' OR p_glfc008 = '8' OR p_glfc008 = '9' THEN
      IF r_amount < 0 THEN 
         LET r_amount = 0 
      END IF
   END IF
   #200317-00012#1 add(e)

   #200825-00025#1 add(s)
   #存入动态数组
   LET l_num4 = g_s_analy_form_get_amt_reuse.getLength() + 1
   LET g_s_analy_form_get_amt_reuse[l_num4].ld = p_ld
   LET g_s_analy_form_get_amt_reuse[l_num4].year = p_year
   LET g_s_analy_form_get_amt_reuse[l_num4].bmonth = p_bmonth
   LET g_s_analy_form_get_amt_reuse[l_num4].emonth = p_emonth
   LET g_s_analy_form_get_amt_reuse[l_num4].ls_js = ls_js
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc002 = p_glfc002
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc003 = p_glfc003
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc004 = p_glfc004
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc005 = p_glfc005
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc006 = p_glfc006
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc007 = p_glfc007
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc008 = p_glfc008
   LET g_s_analy_form_get_amt_reuse[l_num4].glfc010 = p_glfc010
   LET g_s_analy_form_get_amt_reuse[l_num4].wc = p_wc
   LET g_s_analy_form_get_amt_reuse[l_num4].show_ad = p_show_ad
   LET g_s_analy_form_get_amt_reuse[l_num4].stus = p_stus
   LET g_s_analy_form_get_amt_reuse[l_num4].show_ce = p_show_ce
   LET g_s_analy_form_get_amt_reuse[l_num4].show_ye = p_show_ye
   LET g_s_analy_form_get_amt_reuse[l_num4].success = r_success
   LET g_s_analy_form_get_amt_reuse[l_num4].amount = r_amount
   #200825-00025#1 add(e)

   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 數據來源：總帳憑證統計檔glar_t
# Memo...........:
# Usage..........: CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By 02599 #150827-00036#1
# Modify.........: ##181121-00017#1 p_glfc001改成ls_js
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc)
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark 
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       LIKE glfc_t.glfc001
   DEFINE p_glfc002       LIKE glfc_t.glfc002
   DEFINE p_glfc003       LIKE glfc_t.glfc003
   DEFINE p_glfc004       LIKE glfc_t.glfc004
   DEFINE p_glfc005       LIKE glfc_t.glfc005
   DEFINE p_glfc006       LIKE glfc_t.glfc006
   DEFINE p_glfc007       LIKE glfc_t.glfc007
   DEFINE p_glfc008       LIKE glfc_t.glfc008
   DEFINE p_glfc010       LIKE glfc_t.glfc010
   DEFINE p_wc            STRING
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   DEFINE l_field         LIKE type_t.chr100
   DEFINE l_glaa004       LIKE glaa_t.glaa004
   DEFINE l_glac008       LIKE glac_t.glac008
   DEFINE l_wc            STRING
   DEFINE l_sum_str       STRING #160526-00035#1 add
   #181121-00017#2 #cy02 add s---
   DEFINE lc_param        RECORD
       glfc001            LIKE glfc_t.glfc001,     
       glaq022            LIKE glaq_t.glaq022  
                          END RECORD 
   DEFINE ls_js           STRING   
   DEFINE l_where1        STRING
   DEFINE l_where         STRING   
   #181121-00017#2 #cy02 add e---
   DEFINE l_num2          LIKE type_t.num10  #200825-00025#1 add

   #200825-00025#1 add(s)
   IF cl_null(ls_js) THEN LET ls_js = ' ' END IF
   IF cl_null(p_glfc002) THEN LET p_glfc002 = ' ' END IF
   IF cl_null(p_glfc003) THEN LET p_glfc003 = ' ' END IF
   IF cl_null(p_glfc004) THEN LET p_glfc004 = ' ' END IF
   IF cl_null(p_glfc005) THEN LET p_glfc005 = ' ' END IF
   IF cl_null(p_glfc006) THEN LET p_glfc006 = ' ' END IF
   IF cl_null(p_glfc007) THEN LET p_glfc007 = ' ' END IF
   IF cl_null(p_glfc008) THEN LET p_glfc008 = ' ' END IF
   IF cl_null(p_glfc010) THEN LET p_glfc010 = ' ' END IF
   IF cl_null(p_wc) THEN LET p_wc = ' ' END IF
  #检查动态数组中是否有重复
   FOR l_num2 = 1 TO g_s_analy_form_get_amt_1_reuse.getLength()
       IF g_s_analy_form_get_amt_1_reuse[l_num2].ld = p_ld AND g_s_analy_form_get_amt_1_reuse[l_num2].year = p_year AND g_s_analy_form_get_amt_1_reuse[l_num2].bmonth = p_bmonth 
       AND g_s_analy_form_get_amt_1_reuse[l_num2].emonth = p_emonth AND g_s_analy_form_get_amt_1_reuse[l_num2].ls_js = ls_js AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc002 = p_glfc002 
       AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc003 = p_glfc003 AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc004 = p_glfc004 AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc005 = p_glfc005
       AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc006 = p_glfc006 AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc007 = p_glfc007 AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc008 = p_glfc008
       AND g_s_analy_form_get_amt_1_reuse[l_num2].glfc010 = p_glfc010 AND g_s_analy_form_get_amt_1_reuse[l_num2].wc = p_wc THEN
          LET r_success = g_s_analy_form_get_amt_1_reuse[l_num2].success
          LET r_amount = g_s_analy_form_get_amt_1_reuse[l_num2].amount
          RETURN r_success,r_amount
       END IF
   END FOR
   #200825-00025#1 add(e)

   CALL util.JSON.parse(ls_js,lc_param)  #181121-00017#2 #cy02 add 
   LET p_glfc001 = lc_param.glfc001 #181121-00017#2 #cy02 add 
   LET r_success = TRUE
   LET l_field = ''
   LET r_amount = 0
   LET l_glac008 = ''
#170510-00043#2--mark--str--
#   LET l_sql ="  SELECT DISTINCT glaa004  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#              "  AND glaald IN ('",p_ld,"') "
#   PREPARE glaa004_1_pre FROM l_sql
#   EXECUTE glaa004_1_pre INTO l_glaa004   
#170510-00043#2--mark--end
   
   #抓取起始科目的正常餘額形態
#170510-00043#2--mod--str--
#   SELECT glac008 INTO l_glac008
#     FROM glac_t
#    WHERE glacent = g_enterprise
#      AND glac001 = l_glaa004
#      AND glac002 = p_glfc003
   EXECUTE glac008_pre USING p_glfc003 INTO l_glac008 
#170510-00043#2--mod--end   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF
   
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         LET l_sql = "SELECT SUM(glat113 - glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glat002 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glat002 < ",p_bmonth
         END IF
         
      WHEN '2'  #期初餘額在借方
#         LET l_sql = "SELECT SUM(glat113) ",      #160526-00035#1 mark
         LET l_sum_str = " SUM(glat113-glat114) "  #160526-00035#1 add
         LET l_sql =                               #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glat002 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glat002 < ",p_bmonth
         END IF
         
      WHEN '3'  #期初餘額在貸方
#          LET l_sql = "SELECT SUM(glat114) ",      #160526-00035#1 mark
          LET l_sum_str = " SUM(glat114-glat113) "  #160526-00035#1 add
          LET l_sql =                               #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glat002 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glat002 < ",p_bmonth
         END IF
               
      WHEN '4'  #本期借方
          LET l_sql = "SELECT SUM(glat113) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
      WHEN '5'  #本期貸方
          LET l_sql = "SELECT SUM(glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '6'  #本期發生額
          LET l_sql = "SELECT SUM(glat113 - glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                     
      WHEN '7'  #期末餘額
          LET l_sql = "SELECT SUM(glat113 - glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                    #"   AND glat002 < =  ",p_emonth, #PGS(D)-10500-mark
                     "   AND glat002 <=  ",p_emonth,  #PGS(D)-10500-add
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
         
      WHEN '8'  #期末餘額在借方
#          LET l_sql = "SELECT SUM(glat113) ",     #160526-00035#1 mark
          LET l_sum_str = " SUM(glat113-glat114) " #160526-00035#1 add
          LET l_sql =                              #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                    #"   AND glat002 < =  ",p_emonth, #PGS(D)-10500-mark
                     "   AND glat002 <=  ",p_emonth,  #PGS(D)-10500-add
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '9'  #期末餘額在貸方
#          LET l_sql = "SELECT SUM(glat114) ",     #160526-00035#1 mark
          LET l_sum_str = " SUM(glat114-glat113) " #160526-00035#1 add
          LET l_sql =                              #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                    #"   AND glat002 < =  ",p_emonth, #PGS(D)-10500-mark
                     "   AND glat002 <=  ",p_emonth,  #PGS(D)-10500-add
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
      #200312-00058#1 add(s)
      #这里应当是取不到期别为0的数据的，相当于直接给0
      WHEN 'A'  #年初数
          LET l_sql = "SELECT SUM(glat113 - glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 = 0 ",
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      #200312-00058#1 add(e)
        
   END CASE 


   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field = 'glatorga'
      WHEN '2'   #部門
         LET l_field = 'glat011'
      WHEN '3'   #利潤/成本中心
         LET l_field = 'glat012'
      WHEN '4'   #區域
         LET l_field = 'glat013'
      WHEN '5'   #交易客商
         LET l_field = 'glat005'
      WHEN '6'   #帳款客商
         LET l_field = 'glat006'
      WHEN '7'   #客群
         LET l_field = 'glat014'
      WHEN '8'   #產品類別
         LET l_field = 'glat015'
      WHEN '9'   #經營方式
         LET l_field = 'glat020'
      WHEN '10'   #渠道
         LET l_field = 'glat021'
      WHEN '11'   #品牌
         LET l_field = 'glat022'
      WHEN '12'   #人員
         LET l_field = 'glat016'
      WHEN '13'  #專案編號
         LET l_field = 'glat017'
      WHEN '14'  #WBS
         LET l_field = 'glat018'
      WHEN '15'  #自由核算項一
         LET l_field = 'glat023'
      WHEN '16'  #自由核算項二
         LET l_field = 'glat024'
      WHEN '17'  #自由核算項三
         LET l_field = 'glat025'
      WHEN '18'  #自由核算項四
         LET l_field = 'glat026'
      WHEN '19'  #自由核算項五
         LET l_field = 'glat027'
      WHEN '20'  #自由核算項六
         LET l_field = 'glat028'
      WHEN '21'  #自由核算項七
         LET l_field = 'glat029'
      WHEN '22'  #自由核算項八
         LET l_field = 'glat030'
      WHEN '23'  #自由核算項九
         LET l_field = 'glat031'
      WHEN '24'  #自由核算項十
         LET l_field = 'glat032'
      OTHERWISE
         LET l_field = ''
   END CASE
   
   #181121-00017#2 #cy02 add s---
   IF NOT cl_null(lc_param.glaq022) THEN 
      LET l_where = " AND ",l_field," IN('",lc_param.glaq022,"')"
   ELSE
      LET l_where = " AND 1=1 "     
   END IF
   #181121-00017#2 #cy02 add e---    

  
   LET l_sql = l_sql," AND glat007 IN (SELECT glac002 FROM glac_t ",
                     "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                     "                    AND glacent = ",g_enterprise,       #180528-00050#1 add
                     "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
   IF NOT cl_null(p_wc) THEN
      LET l_wc=cl_replace_str(p_wc,"glar001","glat007")
      LET l_wc=cl_replace_str(l_wc,"glar012","glatorga")
      LET l_wc=cl_replace_str(l_wc,'glar013','glat011')
      LET l_wc=cl_replace_str(l_wc,'glar014','glat012')
      LET l_wc=cl_replace_str(l_wc,'glar015','glat013')
      LET l_wc=cl_replace_str(l_wc,'glar016','glat005')
      LET l_wc=cl_replace_str(l_wc,'glar017','glat006')
      LET l_wc=cl_replace_str(l_wc,'glar018','glat014')
      LET l_wc=cl_replace_str(l_wc,'glar019','glat015')
      LET l_wc=cl_replace_str(l_wc,'glar051','glat020')
      LET l_wc=cl_replace_str(l_wc,'glar052','glat021')
      LET l_wc=cl_replace_str(l_wc,'glar053','glat022')
      LET l_wc=cl_replace_str(l_wc,'glar020','glat016')
      LET l_wc=cl_replace_str(l_wc,'glar022','glat017')
      LET l_wc=cl_replace_str(l_wc,'glar023','glat018')
      #自由核算項
      LET l_wc=cl_replace_str(l_wc,'glar024','glat023')
      LET l_wc=cl_replace_str(l_wc,'glar025','glat024')
      LET l_wc=cl_replace_str(l_wc,'glar026','glat025')
      LET l_wc=cl_replace_str(l_wc,'glar027','glat026')
      LET l_wc=cl_replace_str(l_wc,'glar028','glat027')
      LET l_wc=cl_replace_str(l_wc,'glar029','glat028')
      LET l_wc=cl_replace_str(l_wc,'glar030','glat029')
      LET l_wc=cl_replace_str(l_wc,'glar031','glat030')
      LET l_wc=cl_replace_str(l_wc,'glar032','glat031')
      LET l_wc=cl_replace_str(l_wc,'glar033','glat032')
      LET l_sql = l_sql," AND ",l_wc
   END IF
   
   #核算项范围条件
   IF cl_null(lc_param.glaq022) THEN #181121-00017#2 #cy02 add
      IF NOT cl_null(l_field) THEN       
         IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
         END IF
         
         IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
         END IF
         IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
         END IF
      END IF
   #181121-00017#2 #cy02 add s---    
   ELSE
      IF NOT cl_null(l_where) THEN    
         LET l_sql = l_sql,l_where
      END IF  
   END IF   
   #181121-00017#2 #cy02 add e---   
      
   #額外條件
   IF NOT cl_null(p_glfc010) THEN 
      LET l_sql = l_sql," AND ",p_glfc010
   END IF
   
   #160526-00035#1--add--str--
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF cl_null(l_field) THEN
         LET l_field="''"
      END IF
      LET l_sql="SELECT sum(amt) ",
                "  FROM (",
                "        SELECT glat007,",l_field,",",l_sum_str," amt ",l_sql,
                "         GROUP BY glat007,",l_field,
                "         HAVING ",l_sum_str,">0 ",
                "       )"
   END IF
   #160526-00035#1--add--end
   
   PREPARE glat_pre FROM l_sql
   EXECUTE glat_pre INTO r_amount
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   #IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' THEN   #1:期初餘額 6:本期發生額 7:期末餘額                    #180528-00050#1 mark
    IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' OR p_glfc008 = 'A' THEN   #1:期初餘額 6:本期發生額 7:期末餘額 #180528-00050#1 add
      IF l_glac008 = '2' THEN   #貸余
         LET r_amount = r_amount * -1
      END IF
   END IF
   
   #200825-00025#1 add(s)
   #存入动态数组
   LET l_num2 = g_s_analy_form_get_amt_1_reuse.getLength() + 1
   LET g_s_analy_form_get_amt_1_reuse[l_num2].ld = p_ld
   LET g_s_analy_form_get_amt_1_reuse[l_num2].year = p_year
   LET g_s_analy_form_get_amt_1_reuse[l_num2].bmonth = p_bmonth
   LET g_s_analy_form_get_amt_1_reuse[l_num2].emonth = p_emonth
   LET g_s_analy_form_get_amt_1_reuse[l_num2].ls_js = ls_js
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc002 = p_glfc002
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc003 = p_glfc003
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc004 = p_glfc004
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc005 = p_glfc005
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc006 = p_glfc006
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc007 = p_glfc007
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc008 = p_glfc008
   LET g_s_analy_form_get_amt_1_reuse[l_num2].glfc010 = p_glfc010
   LET g_s_analy_form_get_amt_1_reuse[l_num2].wc = p_wc
   LET g_s_analy_form_get_amt_1_reuse[l_num2].success = r_success
   LET g_s_analy_form_get_amt_1_reuse[l_num2].amount = r_amount
   #200825-00025#1 add(e)
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 數據來源:合併報表合併後各期科目餘額檔 glea_t
# Memo...........:
# Usage..........: CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
#                : p_stus      本位幣狀態
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/12/02 By Hans #151013-00016#13
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
 #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
 DEFINE p_ld            STRING                                #170104-00043#1 add
 DEFINE p_year          LIKE type_t.num5
 DEFINE p_bmonth        LIKE type_t.num5
 DEFINE p_emonth        LIKE type_t.num5
 DEFINE p_glfc001       LIKE glfc_t.glfc001
 DEFINE p_glfc002       LIKE glfc_t.glfc002
 DEFINE p_glfc003       LIKE glfc_t.glfc003
 DEFINE p_glfc004       LIKE glfc_t.glfc004
 DEFINE p_glfc005       LIKE glfc_t.glfc005
 DEFINE p_glfc006       LIKE glfc_t.glfc006
 DEFINE p_glfc007       LIKE glfc_t.glfc007
 DEFINE p_glfc008       LIKE glfc_t.glfc008
 DEFINE p_glfc010       LIKE glfc_t.glfc010
 DEFINE p_wc            STRING
 DEFINE p_stus          LIKE type_t.chr1
 DEFINE r_success       LIKE type_t.num5
 DEFINE r_amount        LIKE type_t.num20_6
 DEFINE l_sql           STRING
 DEFINE l_field         LIKE type_t.chr100
 DEFINE l_glaa004       LIKE glaa_t.glaa004
 DEFINE l_glac008       LIKE glac_t.glac008
 DEFINE l_wc            STRING
 DEFINE l_field1        STRING
 DEFINE l_field2        STRING
 DEFINE l_field3        STRING
 DEFINE l_field4        STRING
 DEFINE l_field5        STRING
 DEFINE l_sum_str       STRING #160526-00035#1 add
 #DEFINE l_diff          LIKE type_t.num20_6     #170418-00002#1 add    #180829-00065#1 mark 
 #DEFINE l_diff2         LIKE type_t.num20_6     #170418-00002#1 add    #180829-00065#1 mark
 #170623-00034#6---add---start---
 DEFINE l_bmonth        LIKE type_t.num5        
 DEFINE l_success       LIKE type_t.num5        
 DEFINE l_glaa003       LIKE glaa_t.glaa003     
 DEFINE l_last_yy       LIKE type_t.num5        
 DEFINE l_last_mm       LIKE type_t.num5        
 #170623-00034#6---add---end---
 #181121-00017#2 #cy02 add s---
 DEFINE lc_param        RECORD
     glfc001            LIKE glfc_t.glfc001,     
     glaq022            LIKE glaq_t.glaq022,
     ld                 LIKE glea_t.glea033  #210301-00038@1 add       
                        END RECORD 
 DEFINE ls_js           STRING   
 DEFINE l_where1        STRING
 DEFINE l_where         STRING   
 #181121-00017#2 #cy02 add e---
  
 CALL util.JSON.parse(ls_js,lc_param)  #181121-00017#2 #cy02 add 
 LET p_glfc001 = lc_param.glfc001 #181121-00017#2 #cy02 add   
   # p_stus  1  記帳幣   本位幣一
   #         2  功能幣   本位幣二
   #         3  報告幣   本位幣三
   
   LET r_success = TRUE
   LET l_field = ''
   LET r_amount = 0
   LET l_glac008 = ''
#170510-00043#2--mark--str--
#   LET l_sql ="  SELECT DISTINCT glaa004  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#              "  AND glaald IN ('",p_ld,"') "
#   PREPARE glaa004_1_pre02 FROM l_sql
#   EXECUTE glaa004_1_pre02 INTO l_glaa004     
#170510-00043#2--mark--end
   
   #抓取起始科目的正常餘額形態
#170510-00043#2--mod--str--
#   SELECT glac008 INTO l_glac008
#     FROM glac_t
#    WHERE glacent = g_enterprise
#      AND glac001 = l_glaa004
#      AND glac002 = p_glfc003
   EXECUTE glac008_pre USING p_glfc003 INTO l_glac008 
#170510-00043#2--mod--end   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF
   IF cl_null(p_stus)THEN LET p_stus = '1' END IF
   CASE  p_stus
      WHEN 1 
         #記帳幣
         LET l_field1 = " SELECT SUM(glea008 - glea009) "
         LET l_field2 = " SELECT SUM(glea008) "
         LET l_field3 = " SELECT SUM(glea009) "
         LET l_field4 = " SUM(glea008-glea009) " #160526-00035#1 add
         LET l_field5 = " SUM(glea009-glea008) " #160526-00035#1 add
      WHEN 2           
         LET l_field1 = " SELECT SUM(glea027 - glea028)"
         LET l_field2 = " SELECT SUM(glea027) "
         LET l_field3 = " SELECT SUM(glea028) "
         LET l_field4 = " SELECT SUM(glea027-glea028) " #160526-00035#1 add
         LET l_field5 = " SELECT SUM(glea028-glea027) " #160526-00035#1 add
     WHEN 3               
        LET l_field1 =  " SELECT SUM(glea030 - glea031)"
        LET l_field2 =  " SELECT SUM(glea030) "
        LET l_field3 =  " SELECT SUM(glea031) "
        LET l_field4 =  " SELECT SUM(glea030-glea031) " #160526-00035#1 add
        LET l_field5 =  " SELECT SUM(glea031-glea030) " #160526-00035#1 add
   END CASE

   #170623-00034#---add--start
   #IF p_glfc008 MATCHES '[123]' THEN       #期初資料   #180528-00050#1 mark
    IF p_glfc008 MATCHES '[123A]' THEN      #期初資料   #180528-00050#1 add
      #取得會計週期參照表
      LET l_glaa003 = ''
      CALL s_ld_sel_glaa(p_ld,'glaa003') RETURNING  l_success,l_glaa003
      
      #取得去年期末
      CALL s_fin_date_get_last_period(l_glaa003,p_ld,p_year,'1')
            RETURNING l_success,l_last_yy,l_last_mm
   END IF
   #170623-00034#6---add--end
   
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         #LET l_sql = "SELECT SUM(glea008 - glea009) ",
         LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                    #"   AND glea003 = ",p_year,         #170623-00034#6 mark
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         #170623-00034#6---mark---start---            
         #IF p_bmonth=0 THEN
         #   LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
         #ELSE
         #   LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
         #END IF
         #170623-00034#6---mark---end---
         #170623-00034#6---add--start
         #IF g_prog MATCHES 'aglq938*' THEN                     #180528-00050#1 mark
         IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN   #180528-00050#1 add
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
         #170623-00034#6---add--end
      WHEN '2'  #期初餘額在借方
         #LET l_sql = "SELECT SUM(glea008) ",
#         LET l_sql = l_field2 CLIPPED,  #160526-00035#1 mark
         LET l_sql =                     #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                    #"   AND glea003 = ",p_year,            #170623-00034#6 mark
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         #170623-00034#6---mark---start---            
         #IF p_bmonth=0 THEN
         #   LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
         #ELSE
         #   LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
         #END IF
         #170623-00034#6---mark---end---
         #170623-00034#6---add--start
         #IF g_prog MATCHES 'aglq938*' THEN                     #180528-00050#1 mark
         IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN   #180528-00050#1 add
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
         #170623-00034#6---add--end
         
      WHEN '3'  #期初餘額在貸方
         # LET l_sql = "SELECT SUM(glea009) ",
#          LET l_sql = l_field3 CLIPPED, #160526-00035#1 mark
          LET l_sql =                    #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                    #"   AND glea003 = ",p_year,                 #170623-00034#6 mark
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         #170623-00034#6---mark---start---            
         #IF p_bmonth=0 THEN
         #   LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
         #ELSE
         #   LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
         #END IF
         #170623-00034#6---mark---end---
         #170623-00034#6---add--start
         #IF g_prog MATCHES 'aglq938*' THEN                     #180528-00050#1 mark
         IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN   #180528-00050#1 add
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
         #170623-00034#6---add--end
               
      WHEN '4'  #本期借方
          #LET l_sql = "SELECT SUM(glea008) ",
          LET l_sql = l_field2 CLIPPED, 
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,               
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
      WHEN '5'  #本期貸方
         #LET l_sql = "SELECT SUM(glea009) ",
          LET l_sql = l_field3 CLIPPED, 
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '6'  #本期發生額
          #LET l_sql = "SELECT SUM(glea008 - glea009) ",
          LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                     
      WHEN '7'  #期末餘額
          #LET l_sql = "SELECT SUM(glea008 - glea009) ",
          LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                    #"   AND glea004 < =  ",p_emonth,   #170623-00034#6 mark
                     "   AND glea004 =  ",p_emonth,     #170623-00034#6 add
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
         
      WHEN '8'  #期末餘額在借方
          #LET l_sql = "SELECT SUM(glea008) ",
#           LET l_sql = l_field2 CLIPPED, #160526-00035#1 mark
          LET l_sql =                     #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                    #"   AND glea004 < =  ",p_emonth,   #170623-00034#6 mark
                     "   AND glea004 =  ",p_emonth,     #170623-00034#6 add
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '9'  #期末餘額在貸方
          #LET l_sql = "SELECT SUM(glea009) ",
#           LET l_sql = l_field3 CLIPPED, #160526-00035#1 mark
          LET l_sql =                     #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                    #"   AND glea004 < =  ",p_emonth,   #170623-00034#6 mark
                     "   AND glea004 =  ",p_emonth,     #170623-00034#6 add
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                     
      #180528-00050#1---add---start---
      #WHEN 'a'   #期初餘額 #200723-00018#1 mark
      WHEN 'A'   #200723-00018# add
         LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t,gldb_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        #IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'a' THEN   #200723-00018#1 mark
        IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN    #200723-00018#1 add
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF      
      #180528-00050#1---add---end---      
   END CASE 


   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field = 'glea012'
      WHEN '2'   #部門
         LET l_field = 'glea013'
      WHEN '3'   #利潤/成本中心
         LET l_field = 'glea014'
      WHEN '4'   #區域
         LET l_field = 'glea015'
      WHEN '5'   #交易客商
         LET l_field = 'glea016'
      WHEN '6'   #帳款客商
         LET l_field = 'glea017'
      WHEN '7'   #客群
         LET l_field = 'glea018'
      WHEN '8'   #產品類別
         LET l_field = 'glea019'
      WHEN '9'   #經營方式
         LET l_field = 'glea020'
      WHEN '10'   #渠道
         LET l_field = 'glea021'
      WHEN '11'   #品牌
         LET l_field = 'glea022'
      WHEN '12'   #人員
         LET l_field = 'glea023'
      WHEN '13'  #專案編號
         LET l_field = 'glea024'
      WHEN '14'  #WBS
         LET l_field = 'glea024'      
      OTHERWISE
         LET l_field = ''
   END CASE

   #181121-00017#2 #cy02 add s---
   IF NOT cl_null(lc_param.glaq022) THEN 
      LET l_where = " AND ",l_field," IN('",lc_param.glaq022,"')"
   ELSE
      LET l_where = " AND 1=1 "  
   END IF
   #181121-00017#2 #cy02 add e--- 
   
   LET l_sql = l_sql," AND glea005 IN (SELECT glac002 FROM glac_t ",
                     "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                     "                    AND glacent = ",g_enterprise,       #180528-00050#1 add
                     "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
   IF NOT cl_null(p_wc) THEN
      LET l_wc=cl_replace_str(p_wc,"glar001","glea005")
      LET l_wc=cl_replace_str(l_wc,"glar012","glea012")
      LET l_wc=cl_replace_str(l_wc,'glar013','glea013')
      LET l_wc=cl_replace_str(l_wc,'glar014','glea014')
      LET l_wc=cl_replace_str(l_wc,'glar015','glea015')
      LET l_wc=cl_replace_str(l_wc,'glar016','glea016')
      LET l_wc=cl_replace_str(l_wc,'glar017','glea017')
      LET l_wc=cl_replace_str(l_wc,'glar018','glea018')
      LET l_wc=cl_replace_str(l_wc,'glar019','glea019')
      LET l_wc=cl_replace_str(l_wc,'glar051','glea020')
      LET l_wc=cl_replace_str(l_wc,'glar052','glea021')
      LET l_wc=cl_replace_str(l_wc,'glar053','glea022')
      LET l_wc=cl_replace_str(l_wc,'glar020','glea023')
      LET l_wc=cl_replace_str(l_wc,'glar022','glea024')
      LET l_wc=cl_replace_str(l_wc,'glar023','glea025')
      LET l_sql = l_sql," AND ",l_wc
   END IF
   
   #核算项范围条件
   IF cl_null(lc_param.glaq022) THEN #181121-00017#2 #cy02 add
      IF NOT cl_null(l_field) THEN       
         IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
         END IF
         
         IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
         END IF
         IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
         END IF
      END IF
   #181121-00017#2 #cy02 add s---    
   ELSE
      IF NOT cl_null(l_where) THEN    
         LET l_sql = l_sql,l_where
      END IF  
   END IF   
   #181121-00017#2 #cy02 add e---      
   
   #210301-00038@1 add(s)
   IF NOT cl_null(lc_param.ld) AND lc_param.ld <> ' ' THEN
      LET l_sql = l_sql," AND glea033 = '",lc_param.ld,"' "
   END IF
   #210301-00038@1 add(e)
   
   #額外條件
   IF NOT cl_null(p_glfc010) THEN 
      LET l_sql = l_sql," AND ",p_glfc010
   END IF

   #160526-00035#1--add--str--
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF cl_null(l_field) THEN
         LET l_field="''"
      END IF
      IF p_glfc008='2' OR p_glfc008='8' THEN
         LET l_sum_str=l_field4 #借-贷
      ELSE
         LET l_sum_str=l_field5 #贷-借
      END IF
      LET l_sql="SELECT sum(amt) ",
                "  FROM (",
                "        SELECT glea005,",l_field,",",l_sum_str," amt ",l_sql,
                "         GROUP BY glea005,",l_field,
                "         HAVING ",l_sum_str,">0 ",
                "       )"
   END IF
   #160526-00035#1--add--end
   
   PREPARE glat_pre02 FROM l_sql
   EXECUTE glat_pre02 INTO r_amount
   
   
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   #180829-00065#1---mark---start---
   ##170418-00002#1---add---start---
   ##IF g_prog = 'aglq938' THEN          #170623-00034#6 mark
   #IF g_prog MATCHES 'aglq938*' THEN   #170623-00034#6 add
   #   LET l_diff = 0
   #   LET l_sql = "SELECT SUM(gldq017-gldq018) FROM gldp_t,gldq_t ",
   #               "WHERE gldpent = gldqent AND gldpdocno = gldqdocno ",
   #               "  AND gldpent = ",g_enterprise," AND gldpstus = 'Y' ",
   #               "  AND gldpld IN ('",p_ld,"') AND gldp001 IN (SELECT gldc002 FROM gldc_t WHERE gldcent = ",g_enterprise,
   #               "  AND gldcld IN ('",p_ld,"') AND gldc005 = 'Y') ",                  
   #               "  AND gldp003 = ",p_year," AND gldp004 = ",p_emonth,
   #               "  AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' AND gldp005='4'"
   #   PREPARE gldq_diff FROM l_sql
   #   EXECUTE gldq_diff INTO l_diff      
   #   IF cl_null(l_diff) THEN LET l_diff = 0 END IF
   #   LET l_diff2 = 0
   #   LET l_sql = "SELECT SUM(gldq017-gldq018) FROM gldp_t,gldq_t",
   #               " WHERE gldpent = gldqent AND gldpdocno = gldqdocno ",
   #               "   AND gldpent = ",g_enterprise," AND gldpstus = 'Y'",
   #               "   AND gldpld IN ('",p_ld,"') AND gldp001 IN (SELECT gldc002 FROM gldc_t WHERE gldcent =  ",g_enterprise,
   #               "   AND gldcld IN ('",p_ld,"') AND gldc005 = 'Y') ",
   #               "   AND gldp003 = ",p_year," AND gldp004 = ",p_emonth,
   #               "   AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' AND gldp005='1' AND gldp006 = 'W' "
   #   PREPARE gldq_diff2 FROM l_sql
   #   EXECUTE gldq_diff2 INTO l_diff2      
   #   IF cl_null(l_diff2) THEN LET l_diff2 = 0 END IF
   #   LET r_amount = r_amount - l_diff - l_diff2
   # END IF
   ##170418-00002#1---add---end---
   #180829-00065#1---mark---end---
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   #IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' THEN   #1:期初餘額 6:本期發生額 7:期末餘額 #200723-00018#1 mark
   IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' OR p_glfc008 = 'A' THEN   #200723-00018#1 add
      IF l_glac008 = '2' THEN   #貸余
         LET r_amount = r_amount * -1
      END IF
   END IF
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 解析报表设置的公式
# Memo...........: #151201-00004#3
#                : 用于agli075设置公式解析
# Usage..........: CALL s_analy_form_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_glfa001   報表模板編號
#                : p_str       公式
#                : p_wc        筛选条件
#                : p_show_ad   含審計調整傳票否 
#                : p_stus      傳票狀態
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2016/04/14 By 02599
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_analy_form_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add   
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #查询条件
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5  
   DEFINE l_left          LIKE type_t.chr1
   DEFINE l_right         LIKE type_t.chr1
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_amount = 0
   
   #170816-00007#159 mark by 10043 --(s)
   #IF cl_null(p_ld) AND cl_null(p_year) AND cl_null(p_bmonth) AND cl_null(p_emonth) AND cl_null(p_glfa001) AND cl_null(p_str) THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-268'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success,r_amount
   #END IF
   #170816-00007#159 mark by 10043 --(e)
   #170816-00007#159 add by 10043 --(s)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_ld) THEN
      LET g_colname_1 = cl_getmsg("axc-00585",g_dlang)  #帳別
      LET g_msg = g_colname_1   
   END IF      
   IF cl_null(p_year) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("agl-00274",g_dlang)  #年
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_bmonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00794",g_dlang)  #起始期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_emonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00795",g_dlang)  #截止期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_glfa001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("abgq050","lbl_glfa001") RETURNING g_colname_1,g_comment_1  #報表模版編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_str) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("lib-00362",g_dlang)   #公式
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF     
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF   
   #170816-00007#159 add by 10043 --(e) 
   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   
   LET g_str = p_str
   
   #报表模板类型
   SELECT glfa002 INTO g_glfa002 FROM glfa_t
   WHERE glfaent=g_enterprise AND glfa001=p_glfa001
   
   #1）将公式逐层解析，直到公式中的表内项目全部变成总账变量
   CALL s_analy_form_get_coordinate_2(p_glfa001,p_str)
   RETURNING l_success,p_str  
   IF l_success = FALSE THEN
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   #2）将解析的公式计算金额
   #CALL s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus)                     #170222-00003#1 mark
   CALL s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)  #170222-00003#1 add
   RETURNING l_success,r_amount  
   
   IF l_success = FALSE THEN
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 逐层解析公式，直至公式中的表内项目全部被替换
# Memo...........: #151201-00004#3
# Usage..........: CALL s_analy_form_get_coordinate_2(p_glfa001,p_str)
#                  RETURNING r_success,r_amount
# Input parameter: p_glfa001   報表模板編號
#                : p_str       公式、座標
# Return code....: r_success   檢核狀態
#                : r_str       金額
# Date & Author..: 2016/04/14 By 02599
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_coordinate_2(p_glfa001,p_str)
  DEFINE p_str           STRING
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_glfb004       LIKE glfb_t.glfb004
   DEFINE l_glfb005       LIKE glfb_t.glfb005
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_flag          LIKE type_t.num5
   DEFINE l_success       LIKE type_t.num5
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE r_str           STRING
   DEFINE l_chr1          LIKE type_t.chr1
   DEFINE l_str4           STRING
            
   LET r_success = TRUE
   LET r_amount = 0
   
   #將公式一直解析到全部是變量再算金額
   LET l_flag = TRUE
   WHILE l_flag 
      LET l_flag = FALSE
      LET l_str = ''
      LET l_str1 = ''
      LET l_str2 = ''
      CALL l_operator.clear()
      #抓取第一位字符是變量還是"("
      LET l_str2 = p_str.substring(1,1)
      
#      LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符 #180829-00038#1 180829 mark by 08172
      LET l_delimiter1 = ".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #小数点字母數字當做分隔符  #180829-00038#1 180829 add by 08172
      LET l_delimiter2 = "+-*/()"                                  #運算符、括號作為分隔符
      LET tok5 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
      LET tok6 = base.StringTokenizer.create(p_str,l_delimiter1)   #字母數字當做分隔符,取出運算符、括號
      
      #將公式里的運算符存放到數組里
      LET l_i = 1
      WHILE tok6.hasMoreTokens()
        LET l_str3 = tok6.nextToken()
        LET l_str3 = l_str3.trim()
        LET l_operator[l_i].symbol = l_str3
        IF cl_null(l_operator[l_i].symbol) THEN   #去除掉空格
           CALL l_operator.deleteElement(l_i)
        ELSE
           LET l_i = l_i + 1
        END IF
      END WHILE
      CALL l_operator.deleteElement(l_i)
      LET l_i = l_i - 1
      
   
      #取出每個座標到財務報表結構設置作業(agli070)抓取公式
      LET l_j = 1
      WHILE tok5.hasMoreTokens() 
        LET l_str1 = tok5.nextToken()
        #去除掉空格
        IF cl_null(l_str1) THEN 
           CONTINUE WHILE
        END IF
        #抓取第一个字母，判断变量类型
        LET l_str4 = l_str1
        LET l_str4 = l_str4.trim()
        LET l_chr1 = l_str4.substring(1,1)
        IF l_chr1 NOT MATCHES '[IVN]' THEN
        #IF l_chr1 NOT MATCHES '[0IVN]' THEN  #200910-00022#1 add  #有的表内项目未设置公式会取到0
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = 'sub-00758'
           LET g_errparam.extend = l_str1
           LET g_errparam.popup = TRUE
           CALL cl_err()
           LET r_success = FALSE
           CONTINUE WHILE
        END IF
        
        #I表內項目
        IF l_chr1='I' THEN
           #根據座標抓取公式
           CALL s_analy_form_get_formula_2(p_glfa001,l_str1) RETURNING l_glfb005 
           IF cl_null(l_glfb005) THEN
              LET l_glfb005 = 0
           END IF
           
           #如果下层公式还是坐标，接着往下解析
           LET l_str4 = l_glfb005
           LET l_str4 = l_str4.trim()
           LET l_chr1 = l_str4.substring(1,1)
           IF l_chr1 = 'I' THEN
              LET l_flag = TRUE
           END IF
        ELSE
           #V總帳變量  #N数值
           LET l_glfb005 = l_str1
        END IF
        
        #防止有乘除的運算，先把公式用括號括起來
#        IF l_operator[l_j].symbol = '*' OR l_operator[l_j].symbol = '/' THEN  #200525-00028#1---mark 
        IF l_operator[l_j].symbol = '*' OR l_operator[l_j].symbol = '/' OR l_operator[l_j].symbol = '-' THEN  #200525-00028#1---add
           LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
        END IF
        
        #前一个运算符是乘、除、减,把后面的公式用括号括起来
        IF l_j > 1 THEN 
           #IF l_operator[l_j-1].symbol = '*' OR l_operator[l_j-1].symbol = '/' OR l_operator[l_j-1].symbol = '-' THEN   #200529-00062#1 mark
           IF l_operator[l_j-1].symbol = '*' OR l_operator[l_j-1].symbol = '/' OR l_operator[l_j-1].symbol = '-' OR l_operator[l_j-1].symbol = '(' THEN   #200529-00062#1 add
              LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
           END IF
        END IF

        IF l_str2 = '(' THEN 
           IF cl_null(l_str) THEN
              LET l_str = l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           ELSE
              LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           END IF
        ELSE
           IF cl_null(l_str) THEN
              LET l_str = l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           ELSE
              LET l_str = l_str CLIPPED, l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           END IF
        END IF
        LET l_j = l_j + 1
      END WHILE 
      
      #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
      IF l_i = l_j THEN 
         LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
      END IF
      
      LET p_str = l_str    
   END WHILE      
   
   LET r_str = l_str
   RETURN r_success,r_str
END FUNCTION

################################################################################
# Descriptions...: 通過座標獲取公式
# Memo...........: #151201-00004#3
# Usage..........: CALL s_analy_form_get_formula_2(p_glfa001,p_glfb005)
#                  RETURNING r_glfb005
# Input parameter: p_glfa001      報表模板編號
#                : p_glfb005      座標
# Return code....: r_glfb005      公式
# Date & Author..: 2016/04/14 By 02599
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_formula_2(p_glfa001,p_glfb005)
   DEFINE p_glfa001          LIKE glfa_t.glfa001
   DEFINE p_glfb005          LIKE glfb_t.glfb005
   DEFINE l_coordinate       STRING
   DEFINE l_glfbseq          LIKE type_t.chr1000  #行次
   DEFINE l_glfbseq1         LIKE type_t.chr1000  #列次
   DEFINE r_glfb005          LIKE glfb_t.glfb005
   
   LET l_coordinate = p_glfb005   
    
   LET l_coordinate = l_coordinate.trim() 
   #將座標解析成行、列
   LET l_glfbseq  = l_coordinate.substring(3,l_coordinate.getLength())  #行次
   LET l_glfbseq1 = l_coordinate.substring(2,2)  #列次   

   LET r_glfb005 = ''
   
   #先根据坐标抓取數公式來源和公式
   SELECT glfb005 INTO r_glfb005 
     FROM glfb_t
    WHERE glfbent = g_enterprise
      AND glfb001 = p_glfa001
      AND glfbseq = l_glfbseq
      AND glfbseq1 = l_glfbseq1
   #160506-00012#1--add--str--
   IF SQLCA.sqlcode = 100 THEN
      LET r_glfb005 = 0
   END IF
   IF r_glfb005 IS NULL THEN
      LET r_glfb005 = 0
   END IF
   #160506-00012#1--add--end   
   RETURN r_glfb005
END FUNCTION

################################################################################
# Descriptions...: 解析公式
# Memo...........: #151201-00004#3
# Usage..........: CALL s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa001   報表模板編號
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_str       公式
#                : p_wc        筛选条件
#                : p_show_ad   含審計調整傳票否
#                : p_stus      傳票狀態
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add 
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2016/04/14 By 02599
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #筛选条件
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1 
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_str4          STRING    
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   DEFINE l_chr1          LIKE type_t.chr1
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   DEFINE l_message       STRING  #200925-00012#1 add
   #DEFINE l_glfb005       STRING  #200910-00022#1 add
   
   LET r_success = TRUE
   LET r_amount = 0
   
   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   
   LET l_str  = ''
   LET l_str1 = ''
   LET l_str2 = ''
   CALL l_operator.clear()
   
   #抓取第一位字符是變量還是"("
   LET l_str2 = p_str.substring(1,1) 
    
#   LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符 #180829-00038#1 180829 mark by 08172
   LET l_delimiter1 = ".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #小数点字母數字當做分隔符  #180829-00038#1 180829 add by 08172
   LET l_delimiter2 = "+-*/()"                                                 #運算符、括號作為分隔符
   LET tok3 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
   LET tok4 = base.StringTokenizer.create(p_str,l_delimiter1)  #字母數字當做分隔符,取出運算符、括號
   
   #將公式里的運算符存放到數組里
   LET l_i = 1
   WHILE tok4.hasMoreTokens()
     LET l_str3 = tok4.nextToken()
     LET l_str3 = l_str3.trim()
     LET l_operator[l_i].symbol = l_str3
     IF cl_null(l_operator[l_i].symbol) THEN  #去除掉空格
        CALL l_operator.deleteElement(l_i)
     ELSE
        LET l_i = l_i + 1
     END IF
   END WHILE
   CALL l_operator.deleteElement(l_i)
   LET l_i = l_i - 1
   
   #定义SQL申请
   CALL s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce) #170510-00043#2 add
   
   #取出每個變量到變量設置作業(agli201)抓取金額,然後再重組公式算出最後金額
   LET l_j = 1
   WHILE tok3.hasMoreTokens()
     LET l_str1 = tok3.nextToken()
     
     #去除掉空格
     IF cl_null(l_str1) THEN 
        CONTINUE WHILE
     END IF
     #抓取第一个字母，判断变量类型
     LET l_str4 = l_str1
     LET l_str4 = l_str4.trim()
     LET l_chr1 = l_str4.substring(1,1)
#160506-00012#1--mark--str--
#     #抓取变量
#     LET l_str4 = l_str4.substring(2,l_str4.getLength()) 
#     LET l_str1 = l_str4
#160506-00012#1--mark--end
     #当为总账变量时计算金额
     IF l_chr1 = 'V' THEN#抓取变量
        #160506-00012#1--add--str--
        #抓取变量
        LET l_str4 = l_str4.substring(2,l_str4.getLength()) 
        LET l_str1 = l_str4
        #160506-00012#1--add--end
        LET l_amt = 0  
        CALL s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,l_str1,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)  #170222-00003#1 add ,p_show_ce,p_show_ye
        RETURNING l_success,l_amt
        IF l_success = FALSE THEN
           LET r_success = FALSE
           RETURN r_success,r_amount
        END IF
     ELSE
        #N数值
        IF l_chr1='N' THEN
           LET l_str1=l_str4.substring(2,l_str4.getLength())
           LET l_sql = "SELECT ",l_str1 CLIPPED," FROM DUAL"
           PREPARE l_sql_pre_3 FROM l_sql
           EXECUTE l_sql_pre_3 INTO l_amt
           IF cl_null(l_amt) THEN LET l_amt=0 END IF
        ELSE
           LET l_amt = l_str1
#           #200910-00022#1 add(s)
#           #根據座標抓取公式
#           CALL s_analy_form_get_formula_2(p_glfa001,l_str1) RETURNING l_str4 
#           IF cl_null(l_str4) THEN
#              LET l_str4 = ''
#           END IF
#           #如果下层公式还是坐标，接着往下解析
#           LET l_str4 = cl_replace_str(l_str4,'(','')
#           LET l_str4 = cl_replace_str(l_str4,')','')
#           LET l_str4 = cl_replace_str(l_str4,'+','')
#           LET l_str4 = cl_replace_str(l_str4,'-','')
#           LET l_str4 = cl_replace_str(l_str4,'*','')
#           LET l_str4 = cl_replace_str(l_str4,'/','')
#           LET l_str4 = l_str4.trim()
#           LET l_chr1 = l_str4.substring(1,1)
#           IF l_chr1 = 'V' THEN  #抓取变量
#              #抓取变量
#              LET l_str4 = l_str4.substring(2,l_str4.getLength()) 
#              LET l_str1 = l_str4
#              LET l_amt = 0  
#              CALL s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,l_str1,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                   RETURNING l_success,l_amt
#              IF l_success = FALSE THEN
#                 LET r_success = FALSE
#                 RETURN r_success,r_amount
#              END IF
#           ELSE
#              #N数值
#              IF l_chr1 = 'N' THEN
#                 LET l_str1 = l_str4.substring(2,l_str4.getLength())
#                 LET l_sql = "SELECT ",l_str1 CLIPPED," FROM DUAL"
#                 PREPARE l_sql_pre_32 FROM l_sql
#                 EXECUTE l_sql_pre_32 INTO l_amt
#                 IF cl_null(l_amt) THEN LET l_amt = 0 END IF
#              END IF
#           END IF
#           IF cl_null(l_amt) THEN LET l_amt = 0 END IF
#		   #200910-00022#1 add(e)
        END IF
     END IF

     IF l_str2 = '(' THEN     
        IF cl_null(l_str) THEN
           LET l_str = l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        ELSE
           LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        END IF
     ELSE
        IF cl_null(l_str) THEN
           LET l_str = l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        ELSE
           LET l_str = l_str CLIPPED, l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        END IF
     END IF
     LET l_j = l_j + 1
   END WHILE
   
   #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
   IF l_i = l_j THEN 
      LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
   END IF
   
   IF cl_null(l_str) THEN 
      RETURN r_success,r_amount
   END IF
   
   #201111-00045#1 remark(s)
   #200925-00012#1 mark -s
   LET l_sql = "SELECT ",l_str CLIPPED," FROM DUAL"
   PREPARE l_sql_pre_2 FROM l_sql
   EXECUTE l_sql_pre_2 INTO r_amount
   
   #除數不可為0
   IF SQLCA.sqlerrd[2] = -1476 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00237'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = l_str
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   #200925-00012#1 mark -e
   #201111-00045#1 remark(e)
   
   #200925-00012#1 add -s
   #200925-00012#1 add -e
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   #小數取位
   CALL s_num_round('1',r_amount,p_glfa009) RETURNING r_amount
   
   #根據金額單位對金額進行處理
   CASE p_glfa008
      WHEN '1'  #元
         LET r_amount = r_amount
      WHEN '2'  #千
         LET r_amount = r_amount / 1000
      WHEN '3'  #萬
         LET r_amount = r_amount / 10000
      OTHERWISE
         LET r_amount = r_amount
   END CASE
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 設定外接參數/資料
# Memo...........:
# Usage..........: CALL s_analy_form_argv(p_feld,p_init)
# Input parameter: p_feld         預計給資料的欄位
# Return code....: p_init         預設資料
# Date & Author..: 170623-00034#1 170710 By JIE
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_argv(p_feld,p_init)
   DEFINE p_feld      STRING        #欄位
   DEFINE p_init      STRING        #資料
   
   CASE
      WHEN p_feld = 'clear'        INITIALIZE g_fun_argv TO NULL
      WHEN p_feld = 'glfa001'      LET g_fun_argv.glfa001 = p_init   #報表模板
      WHEN p_feld = 'glfbl004'     LET g_fun_argv.glfbl004= p_init   #項目
      WHEN p_feld = 'glfb003'      LET g_fun_argv.glfb003 = p_init   #報表行序
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 抓取總賬變量設置作業agli201設置的公式-取重分类变量对应变量的公式金额
# Memo...........:
# Usage..........: s_analy_form_get_glfc_1(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_wcp_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_wc        筛选条件 
#                : p_show_ad   含審計調整傳票否  
#                : p_stus      傳票狀態  
#                : p_show_ce   含月结传票否  
#                : p_show_ye   含年结传票否 
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2019/12/19 By 01531
# Modify.........: #181121-00017#1 add 
################################################################################
PUBLIC FUNCTION s_analy_form_get_glfc_1(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
   DEFINE p_ld            STRING                               
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       STRING
   DEFINE p_wc            STRING    #筛选条件
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   DEFINE l_glfc RECORD  #公式設定檔
       glfcent LIKE glfc_t.glfcent, #企業編號
       glfcownid LIKE glfc_t.glfcownid, #資料所有者
       glfcowndp LIKE glfc_t.glfcowndp, #資料所屬部門
       glfccrtid LIKE glfc_t.glfccrtid, #資料建立者
       glfccrtdp LIKE glfc_t.glfccrtdp, #資料建立部門
       glfccrtdt LIKE glfc_t.glfccrtdt, #資料創建日
       glfcmodid LIKE glfc_t.glfcmodid, #資料修改者
       glfcmoddt LIKE glfc_t.glfcmoddt, #最近修改日
       glfc001 LIKE glfc_t.glfc001, #公式編號
       glfcseq LIKE glfc_t.glfcseq, #項次
       glfc002 LIKE glfc_t.glfc002, #科目參照表
       glfc003 LIKE glfc_t.glfc003, #起始科目
       glfc004 LIKE glfc_t.glfc004, #截止科目
       glfc005 LIKE glfc_t.glfc005, #選用核算項
       glfc006 LIKE glfc_t.glfc006, #起始核算項值
       glfc007 LIKE glfc_t.glfc007, #截止核算項值
       glfc008 LIKE glfc_t.glfc008, #取值方式
       glfc009 LIKE glfc_t.glfc009, #運算方式
       glfc010 LIKE glfc_t.glfc010, #額外條件
       glfc011 LIKE glfc_t.glfc011, #左括號
       glfc012 LIKE glfc_t.glfc012, #右括號
       glfcud001 LIKE glfc_t.glfcud001, #自定義欄位(文字)001
       glfcud002 LIKE glfc_t.glfcud002, #自定義欄位(文字)002
       glfcud003 LIKE glfc_t.glfcud003, #自定義欄位(文字)003
       glfcud004 LIKE glfc_t.glfcud004, #自定義欄位(文字)004
       glfcud005 LIKE glfc_t.glfcud005, #自定義欄位(文字)005
       glfcud006 LIKE glfc_t.glfcud006, #自定義欄位(文字)006
       glfcud007 LIKE glfc_t.glfcud007, #自定義欄位(文字)007
       glfcud008 LIKE glfc_t.glfcud008, #自定義欄位(文字)008
       glfcud009 LIKE glfc_t.glfcud009, #自定義欄位(文字)009
       glfcud010 LIKE glfc_t.glfcud010, #自定義欄位(文字)010
       glfcud011 LIKE glfc_t.glfcud011, #自定義欄位(數字)011
       glfcud012 LIKE glfc_t.glfcud012, #自定義欄位(數字)012
       glfcud013 LIKE glfc_t.glfcud013, #自定義欄位(數字)013
       glfcud014 LIKE glfc_t.glfcud014, #自定義欄位(數字)014
       glfcud015 LIKE glfc_t.glfcud015, #自定義欄位(數字)015
       glfcud016 LIKE glfc_t.glfcud016, #自定義欄位(數字)016
       glfcud017 LIKE glfc_t.glfcud017, #自定義欄位(數字)017
       glfcud018 LIKE glfc_t.glfcud018, #自定義欄位(數字)018
       glfcud019 LIKE glfc_t.glfcud019, #自定義欄位(數字)019
       glfcud020 LIKE glfc_t.glfcud020, #自定義欄位(數字)020
       glfcud021 LIKE glfc_t.glfcud021, #自定義欄位(日期時間)021
       glfcud022 LIKE glfc_t.glfcud022, #自定義欄位(日期時間)022
       glfcud023 LIKE glfc_t.glfcud023, #自定義欄位(日期時間)023
       glfcud024 LIKE glfc_t.glfcud024, #自定義欄位(日期時間)024
       glfcud025 LIKE glfc_t.glfcud025, #自定義欄位(日期時間)025
       glfcud026 LIKE glfc_t.glfcud026, #自定義欄位(日期時間)026
       glfcud027 LIKE glfc_t.glfcud027, #自定義欄位(日期時間)027
       glfcud028 LIKE glfc_t.glfcud028, #自定義欄位(日期時間)028
       glfcud029 LIKE glfc_t.glfcud029, #自定義欄位(日期時間)029
       glfcud030 LIKE glfc_t.glfcud030, #自定義欄位(日期時間)030
       glfc013   LIKE glfc_t.glfc013,   #數據來源
       glfc014   LIKE glfc_t.glfc014,   
       glfc015   LIKE glfc_t.glfc015    
      ,glfc016   LIKE glfc_t.glfc016    #191226-00004#7 add
      ,glfc017   LIKE glfc_t.glfc017    #210112-00013#2 add
       END RECORD 
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_str           STRING
   DEFINE l_glfc009       LIKE type_t.chr10
   DEFINE l_success       LIKE type_t.num5
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   DEFINE l_glfc001       LIKE glfc_t.glfc001 
   #181121-00017#2 #cy02 add s---
   DEFINE l_amt2          LIKE glar_t.glar005 
   DEFINE l_amt1          LIKE glar_t.glar005
   DEFINE r_amount2       LIKE glar_t.glar005 
   DEFINE l_str2          STRING
   DEFINE lc_param        RECORD
       glfc001            LIKE glfc_t.glfc001,     
       glaq022            LIKE glaq_t.glaq022, #210112-00013#2 add ,
       ld                 LIKE gldn_t.gldn041,  #210301-00038@1 add
       #210112-00013#2 add ---s
       glfcseq            LIKE glfc_t.glfcseq,
       glfc009            LIKE glfc_t.glfc009,
       glfc011            LIKE glfc_t.glfc011,
       glfc012            LIKE glfc_t.glfc012,
       glfc017            LIKE glfc_t.glfc017
       #210112-00013#2 add ---e       
                          END RECORD 
   DEFINE ls_js           STRING  
   DEFINE l_field1        STRING  
   DEFINE l_sql_stus      STRING 
   DEFINE l_glaq022       LIKE glaq_t.glaq022   
   #181121-00017#2 #cy02 add s---   
   #200330-00035#1 add s---
   DEFINE l_glfc0091      LIKE type_t.num5
   DEFINE l_cnt           LIKE type_t.num5
   #200330-00035#1 add e---
   DEFINE l_glfc0091_t    LIKE type_t.num5  #200611-00032#1 add
   #200629-00035#1 add s---
   DEFINE l_text          DYNAMIC ARRAY OF RECORD  #存儲核算项
                          glaq022  LIKE glaq_t.glaq022
                         ,ld       LIKE glea_t.glea033 #210112-00013#2 add
                          END RECORD   
   DEFINE l_i             LIKE type_t.num5 
   DEFINE l_tmp           RECORD
                          glaq022 LIKE glaq_t.glaq022,  #核算项
                          amt     LIKE glar_t.glar005,  #科目余额
                          glfc009 LIKE type_t.num5,     
                          glfcseq LIKE glfc_t.glfcseq,
                          glfc011 LIKE glfc_t.glfc011,
                          glfc012 LIKE glfc_t.glfc012
                         ,flag    LIKE type_t.chr1,   #210112-00013#2 add
                          ld      LIKE glea_t.glea033 #210112-00013#2 add
                          END RECORD                          
   DEFINE l_str3          STRING                          
   #200629-00035#1 add e---
   #200714-00066#1 add s---
   DEFINE l_n             LIKE type_t.num10
   DEFINE l_glfc011       LIKE glfc_t.glfc011
   DEFINE l_glfc012       LIKE glfc_t.glfc012
   DEFINE l_amt3          LIKE glar_t.glar005
   DEFINE l_glfc0092      LIKE type_t.chr10
   DEFINE l_n1            LIKE type_t.num10
   DEFINE l_glfcseq_t     LIKE glfc_t.glfcseq
   DEFINE l_seq           LIKE glfc_t.glfcseq
   DEFINE l_glfc009_t     LIKE glfc_t.glfc009
   DEFINE l_glfc011_t     LIKE glfc_t.glfc011 
   DEFINE l_glfc012_t     LIKE glfc_t.glfc012  
   DEFINE l_flag1         LIKE type_t.num5   
   #200714-00066#1 add e---
   DEFINE l_seq_min       LIKE glfc_t.glfcseq #200717-00016#1 add 
   #200723-00018#1 add s---
   DEFINE l_glaa130       LIKE glaa_t.glaa130  
   DEFINE l_glaa003       LIKE glaa_t.glaa003     
   DEFINE l_last_yy       LIKE type_t.num5        
   DEFINE l_last_mm       LIKE type_t.num5 
   DEFINE l_amt_last      LIKE glar_t.glar005
   #200723-00018#1 add e---
   DEFINE l_field2        STRING  #200809-00005#1 add
   DEFINE l_num3           LIKE type_t.num10  #200825-00025#1 add
   #210301-00038@1 add(s)
   DEFINE l_field3        STRING
   DEFINE l_ld            LIKE gldn_t.gldn041
   DEFINE l_orderby       STRING
   DEFINE l_sql2          STRING
   DEFINE l_glaa004       LIKE glaa_t.glaa004
   DEFINE l_glac008       LIKE glac_t.glac008
   #210301-00038@1 add(e)
   


   #200825-00025#1 add(s)
   IF cl_null(p_glfc001) THEN LET p_glfc001 = ' ' END IF
   IF cl_null(p_wc) THEN LET p_wc = ' ' END IF
   #检查动态数组中是否有重复
   FOR l_num3 = 1 TO g_s_analy_form_get_glfc_1_reuse.getLength()
       IF g_s_analy_form_get_glfc_1_reuse[l_num3].ld = p_ld AND g_s_analy_form_get_glfc_1_reuse[l_num3].year = p_year AND g_s_analy_form_get_glfc_1_reuse[l_num3].bmonth = p_bmonth 
       AND g_s_analy_form_get_glfc_1_reuse[l_num3].emonth = p_emonth AND g_s_analy_form_get_glfc_1_reuse[l_num3].glfc001 = p_glfc001 AND g_s_analy_form_get_glfc_1_reuse[l_num3].wc = p_wc 
       AND g_s_analy_form_get_glfc_1_reuse[l_num3].show_ad = p_show_ad AND g_s_analy_form_get_glfc_1_reuse[l_num3].stus = p_stus AND g_s_analy_form_get_glfc_1_reuse[l_num3].show_ce = p_show_ce
       AND g_s_analy_form_get_glfc_1_reuse[l_num3].show_ye = p_show_ye THEN
          LET r_success = g_s_analy_form_get_glfc_1_reuse[l_num3].success
          LET r_amount = g_s_analy_form_get_glfc_1_reuse[l_num3].amount
          LET r_amount2 = g_s_analy_form_get_glfc_1_reuse[l_num3].amount2
          RETURN r_success,r_amount,r_amount2
       END IF
   END FOR
   #200825-00025#1 add(e)

   LET r_success = TRUE
   LET l_success = TRUE #200714-00066#1 add 
   CALL s_analy_form_tmp()  #200330-00035#1 add 
   DELETE FROM s_analy_tmp  #200330-00035#1 add
   
   LET l_str = ''
   LET l_str2 = ''   #181121-00017#2 #cy02 add 
   LET r_amount = 0
   LET r_amount2 = 0 #181121-00017#2#cy02 add
   
   LET p_glfc001 = p_glfc001.trim() 
   #抓取變量設置(agli201)
 
   LET l_glfc001= p_glfc001
   LET l_glfc001 = cl_replace_str(l_glfc001,'\n', '')   
   LET l_glfc0091_t = 1  #200611-00032#1 add
   CALL l_text.clear()  #200629-00035#1 add

   #200723-00018#1 add s---
   LET l_glaa130 = NULL
   LET l_glaa003 = NULL
   LET l_sql = " SELECT DISTINCT glaa130,glaa003  FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald IN ('",p_ld,"')"
   PREPARE get_glaa FROM l_sql
   EXECUTE get_glaa INTO l_glaa130,l_glaa003
   IF cl_null(l_glaa130) THEN LET l_glaa130 = 'N' END IF 
   #200723-00018#1 add e---
   
   INITIALIZE l_glfc.* TO NULL #200714-00066#1 add 
   FOREACH glfc_cur1 USING l_glfc001 
                    INTO l_glfc.glfc001,l_glfc.glfcseq,l_glfc.glfc002,l_glfc.glfc003,l_glfc.glfc004,
                         l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,l_glfc.glfc009,
                         l_glfc.glfc010,l_glfc.glfc011,l_glfc.glfc012,l_glfc.glfc013
                        ,l_glfc.glfc014,l_glfc.glfc015,l_glfc.glfc016,l_glfc.glfc017 #191226-00004#7 add #210112-00013#2 add glfc017
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH 1:",l_glfc001
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      #左括號
      IF l_glfc.glfc011 = 'Y' THEN 
         IF cl_null(l_str) THEN 
            LET l_str = "(" CLIPPED
         ELSE
            LET l_str = l_str CLIPPED ," ( " CLIPPED
         END IF
         #181121-00017#2 #cy02 add s---
         IF cl_null(l_str2) THEN 
            LET l_str2 = "(" CLIPPED
         ELSE
            LET l_str2 = l_str2 CLIPPED ," ( " CLIPPED
         END IF
         #181121-00017#2 #cy02 add e---
      END IF

      #181121-00017#2 #cy02 add s---
      #選定核算項
      CASE l_glfc.glfc005
         WHEN '1'   #營運據點
            LET l_field1= 'glaq017'
            LET l_field2 = 'glar012'  #200809-00005#1 add             
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea012'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn014' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e
         WHEN '2'   #部門
            LET l_field1= 'glaq018'
            LET l_field2 = 'glar013'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea013'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn015' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e            
         WHEN '3'   #利潤/成本中心
            LET l_field1= 'glaq019'
            LET l_field2 = 'glar014'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea014'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn016' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e            
         WHEN '4'   #區域
            LET l_field1= 'glaq020'
            LET l_field2 = 'glar015'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea015'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn017' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '5'   #交易客商
            LET l_field1= 'glaq021'
            LET l_field2 = 'glar016'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea016'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn018' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '6'   #帳款客商
            LET l_field1= 'glaq022'
            LET l_field2 = 'glar017'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea017'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn019' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '7'   #客群
            LET l_field1= 'glaq023'
            LET l_field2 = 'glar018'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea018'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn020' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '8'   #產品類別
            LET l_field1= 'glaq024'
            LET l_field2 = 'glar019'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea019'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn021' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '9'   #經營方式
            LET l_field1= 'glaq051'
            LET l_field2 = 'glar051'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea020'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn037' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '10'   #渠道
            LET l_field1= 'glaq052'
            LET l_field2 = 'glar052'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea021'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn038' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '11'   #品牌
            LET l_field1= 'glaq053'
            LET l_field2 = 'glar053'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea022'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn039' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '12'   #人員
            LET l_field1= 'glaq025'
            LET l_field2 = 'glar020'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea023'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn022' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '13'  #專案編號
            LET l_field1= 'glaq027'
            LET l_field2 = 'glar022'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea024'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn024' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '14'  #WBS
            LET l_field1= 'glaq028'
            LET l_field2 = 'glar023'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1 = 'glea025'
               LET l_field2 = ""
               IF g_prog MATCHES 'aglq930*' THEN LET l_field1 = 'gldn025' END IF #210112-00013#3 add
            END IF           
            #210112-00013#2 add ---e             
         WHEN '15'  #自由核算項一
            LET l_field1= 'glaq029'
            LET l_field2 = 'glar024'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e
         WHEN '16'  #自由核算項二
            LET l_field1= 'glaq030'
            LET l_field2 = 'glar025'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '17'  #自由核算項三
            LET l_field1= 'glaq031'
            LET l_field2 = 'glar026'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '18'  #自由核算項四
            LET l_field1= 'glaq032'
            LET l_field2 = 'glar027'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '19'  #自由核算項五
            LET l_field1= 'glaq033'
            LET l_field2 = 'glar028'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '20'  #自由核算項六
            LET l_field1= 'glaq034'
            LET l_field2 = 'glar029'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '21'  #自由核算項七
            LET l_field1= 'glaq035'
            LET l_field2 = 'glar030'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '22'  #自由核算項八
            LET l_field1= 'glaq036'
            LET l_field2 = 'glar031'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '23'  #自由核算項九
            LET l_field1= 'glaq037'
            LET l_field2 = 'glar032'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         WHEN '24'  #自由核算項十
            LET l_field1= 'glaq038'
            LET l_field2 = 'glar033'  #200809-00005#1 add
            #210112-00013#2 add ---s
            IF l_glaa130 = 'Y' THEN 
               LET l_field1=""
               LET l_field2=""
            END IF
            #210112-00013#2 add ---e            
         OTHERWISE
            LET l_field1= ''
            LET l_field2 = ''         #200809-00005#1 add
      END CASE
      LET l_glaq022 = '' #181121-00017#2 #cy02 add
      LET l_orderby = ''  #210301-00038@1 add
      #IF NOT cl_null(l_field1) THEN                                               #210301-00038@1 mark
      IF NOT cl_null(l_field1) OR (l_glfc.glfc017 = 'Y' AND l_glaa130 = 'Y') THEN  #210301-00038@1 add
         
         IF l_glaa130 = 'N' THEN #210112-00013#2 add
            CASE p_stus
              WHEN '1' 
                 LET l_sql_stus=" AND glapstus='S'"
              WHEN '2'
                 LET l_sql_stus=" AND glapstus IN ('S','Y') "
              WHEN '3'
                 LET l_sql_stus=" AND glapstus IN ('S','Y','N') "    
            END CASE   
            
            #200809-00005#1 add(s)
            IF l_field1 <> '' THEN 
               #LET l_sql = " SELECT DISTINCT ",l_field1," FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",       #210301-00038@1 mark
               LET l_sql = " SELECT DISTINCT ",l_field1,",' ' FROM glaq_t INNER JOIN glap_t ON glapent = glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",  #210301-00038@1 add               
                           " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",  
                           "   AND glap002 = ",p_year,
                           "   AND glap004 <= ",p_emonth,  
                           "   AND ",l_field1," <> ' ' ",
                           "   AND glaq002 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"'",l_sql_stus
            ELSE
            #200809-00005#1 add(e)
               #LET l_sql = " SELECT DISTINCT ",l_field1," FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",       #210301-00038@1 mark
               LET l_sql = " SELECT DISTINCT ",l_field1,",' ' FROM glaq_t INNER JOIN glap_t ON glapent = glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",  #210301-00038@1 add
                           " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",  
                           "   AND glap002 = ",p_year,
                           "   AND glap004 <= ",p_emonth,  #200809-00005#1 add
                           "   AND glaq002 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"'",l_sql_stus  
            END IF  #200809-00005#1 add           
            
            IF NOT cl_null(l_glfc.glfc006) AND NOT cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field1," BETWEEN '",l_glfc.glfc006,"' AND '",l_glfc.glfc007,"'"                     
            END IF
            
            IF NOT cl_null(l_glfc.glfc006) AND cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field1," BETWEEN '",l_glfc.glfc006,"' AND '",l_glfc.glfc006,"'"
            END IF
            IF cl_null(l_glfc.glfc006) AND NOT cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field1," BETWEEN '",l_glfc.glfc007,"' AND '",l_glfc.glfc007,"'"
            END IF
            
            #200809-00005#1 add(s)
            IF l_field2 <> '' THEN  
               LET l_sql = l_sql," UNION ",
                                 #" SELECT DISTINCT ",l_field2," FROM glar_t ",     #210301-00038@1 mark
                                 " SELECT DISTINCT ",l_field2,",' ' FROM glar_t ",  #210301-00038@1 add
                                 "  WHERE glarent = ",g_enterprise,
                                 "    AND glarld IN ('",p_ld,"') ",
                                 "    AND glar002 = ",p_year,
                                 "    AND glar003 = 0 ",
                                 "    AND glar001 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"' ",
                                 "    AND ",l_field2," <> ' ' "                           
            ELSE
               LET l_sql = l_sql," UNION ",
                                 #" SELECT DISTINCT ",l_field2," FROM glar_t ",     #210301-00038@1 mark
                                 " SELECT DISTINCT ",l_field2,",' ' FROM glar_t ",  #210301-00038@1 add
                                 "  WHERE glarent = ",g_enterprise,
                                 "    AND glarld IN ('",p_ld,"') ",
                                 "    AND glar002 = ",p_year,
                                 "    AND glar003 = 0 ",
                                 "    AND glar001 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"' "
            END IF
            IF NOT cl_null(l_glfc.glfc006) AND NOT cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field2," BETWEEN '",l_glfc.glfc006,"' AND '",l_glfc.glfc007,"'"                     
            END IF
            
            IF NOT cl_null(l_glfc.glfc006) AND cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field2," BETWEEN '",l_glfc.glfc006,"' AND '",l_glfc.glfc006,"'"
            END IF
            IF cl_null(l_glfc.glfc006) AND NOT cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field2," BETWEEN '",l_glfc.glfc007,"' AND '",l_glfc.glfc007,"'"
            END IF
            #200809-00005#1 add(e)
         #210112-00013#2 add ---s
         ELSE
            CASE 
               #210112-00013#3 add ---s
               WHEN g_prog MATCHES 'aglq930*'
                  #210301-00038@1 add(s)
                  IF l_glfc.glfc017 = 'Y' THEN
                     LET l_field3 = ",gldn041"
                     LET l_orderby = " ORDER BY ",l_field1,l_field3 
                  ELSE
                     LET l_field3 = ",' '"
                  END IF
                  IF cl_null(l_field1) THEN 
				         LET l_sql = " SELECT DISTINCT ' '",l_field3," FROM gldn_t ",
                                 "  WHERE gldnent = ",g_enterprise," AND gldnld IN ('",p_ld,"') ",  
                                 "    AND gldn003 = ",p_year,
                                 "    AND gldn004 <= ",p_emonth,  
                                 "    AND gldn041 <> ' ' ",
                                 "    AND gldn007 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"' "
				         LET l_orderby = ""
				      ELSE
                  #210301-00038@1 add(e)
                  #LET l_sql = " SELECT DISTINCT ",l_field1," FROM gldn_t ",          #210301-00038@1 mark
                  LET l_sql = " SELECT DISTINCT ",l_field1,l_field3," FROM gldn_t ",  #210301-00038@1 add
                              "  WHERE gldnent=",g_enterprise," AND gldnld IN ('",p_ld,"') ",  
                              "    AND gldn003 = ",p_year,
                              "    AND gldn004 <= ",p_emonth,  
                              "    AND ",l_field1," <> ' ' ",
                              "    AND gldn007 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"'"
                  END IF  #210301-00038@1 add
               #210112-00013#2 add ---e
               OTHERWISE
                  #210301-00038@1 add(s)
                  IF l_glfc.glfc017 = 'Y' THEN
                     LET l_field3 = ",glea033" #need define
                     LET l_orderby = " ORDER BY ",l_field1,l_field3 
                  ELSE
                     LET l_field3 = ",' '"
                  END IF
                  IF cl_null(l_field1) THEN                 
                     LET l_sql = " SELECT DISTINCT ' '",l_field3," FROM glea_t ",
                                 "  WHERE gleaent=",g_enterprise," AND gleald IN ('",p_ld,"') ",  
                                 "    AND glea003 = ",p_year,
                                 "    AND glea004 <= ",p_emonth,  
                                 "    AND glea033  <> ' ' ",
                                 "    AND glea005 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"'"
                     LET l_orderby = ""
                  ELSE
                  #210301-00038@1 add(e)
                  #LET l_sql = " SELECT DISTINCT ",l_field1," FROM glea_t ",          #210301-00038@1 mark
                  LET l_sql = " SELECT DISTINCT ",l_field1,l_field3," FROM glea_t ",  #210301-00038@1 add
                              "  WHERE gleaent=",g_enterprise," AND gleald IN ('",p_ld,"') ",  
                              "    AND glea003 = ",p_year,
                              "    AND glea004 <= ",p_emonth,  
                              "    AND ",l_field1," <> ' ' ",
                              "    AND glea005 BETWEEN '",l_glfc.glfc003,"' AND '",l_glfc.glfc004,"'"
                  END IF  #210301-00038@1 add
            END CASE
            
            IF NOT cl_null(l_glfc.glfc006) AND NOT cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field1," BETWEEN '",l_glfc.glfc006,"' AND '",l_glfc.glfc007,"'"                     
            END IF
            
            IF NOT cl_null(l_glfc.glfc006) AND cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field1," BETWEEN '",l_glfc.glfc006,"' AND '",l_glfc.glfc006,"'"
            END IF
            IF cl_null(l_glfc.glfc006) AND NOT cl_null(l_glfc.glfc007) THEN 
               LET l_sql = l_sql," AND ",l_field1," BETWEEN '",l_glfc.glfc007,"' AND '",l_glfc.glfc007,"'"
            END IF            
            
         END IF
         #210112-00013#2 add ---e         
         
#         #210301-00038@1 add(s)
#         这段写得不对Mark掉
#         #会计科目参照表
#         LET l_glaa004 = NULL
#         LET l_sql2 = " SELECT glaa004 ",
#                      "   FROM glaa_t ",
#                      "  WHERE glaaent = ",g_enterprise,
#                      "    AND glaald IN ('",p_ld,"') "
#         PREPARE sel_glaa_n2 FROM l_sql2
#         EXECUTE sel_glaa_n2 INTO l_glaa004
#         #抓取起始科目的正常餘額形態
#         LET l_glac008 = NULL
#         SELECT glac008 INTO l_glac008
#           FROM glac_t
#          WHERE glacent = g_enterprise
#            AND glac001 = l_glaa004
#            AND glac002 = l_glfc.glfc003
#            AND glacstus = 'Y'
#         IF g_prog MATCHES 'aglq930*' THEN
#            IF l_glac008 = '1' THEN
#               LET l_sql = l_sql," GROUP BY gldn019,gldn041 HAVING SUM(gldn010 - gldn011) < 0 "
#            END IF
#            IF l_glac008 = '2' THEN
#               LET l_sql = l_sql," GROUP BY gldn019,gldn041 HAVING SUM(gldn011 - gldn010) < 0 "
#            END IF
#         END IF
#         #210301-00038@1 add(e)
         
         LET l_sql = l_sql,l_orderby  #210301-00038@1 add
         PREPARE glaq_pre FROM l_sql
         DECLARE glaq_cur CURSOR FOR glaq_pre   
         
         LET l_amt1 = 0 
         LET l_amt2 = 0
         LET g_glaq022_t = ''  #210301-00038@1 add
         LET g_ld_t = ''       #210301-00038@1 add         
         FOREACH glaq_cur INTO l_glaq022,l_ld  #210301-00038@1 add l_ld 
           LET lc_param.glfc001 = l_glfc.glfc001
           LET lc_param.glaq022 = l_glaq022
           LET lc_param.ld = l_ld  #210301-00038@1 add
           #210112-00013#2 add ---s
           LET lc_param.glfcseq = l_glfc.glfcseq
           LET lc_param.glfc009 = l_glfc.glfc009
           LET lc_param.glfc011 = l_glfc.glfc011
           LET lc_param.glfc012 = l_glfc.glfc012 
           LET lc_param.glfc017 = l_glfc.glfc017
           #210112-00013#2 add ---e
           LET ls_js = util.JSON.stringify(lc_param)                     
    #181121-00017#2 #cy02 add e---      
           #計算金額
           LET l_amt = 0
           
           CASE l_glfc.glfc013 
              WHEN '1'
                 #agli201的glfc013只剩1和2選項，把選項3：合併報表統計檔併入選項1
                 #因此在這用程式代號判斷是走總帳或是合併報表
                 #IF g_prog MATCHES 'aglq93*' OR g_prog MATCHES 'aglq96*' OR g_prog MATCHES 'aglq947*' THEN  #200723-00018#1 mark
                 IF l_glaa130 = 'Y' THEN #200723-00018#1 add 
                    
                    #210301-00038@1 mark(s)
#                    #210112-00013#2 add ---s 合併報表取值維度含帳套=Y
#                    IF g_prog MATCHES 'aglq937*' AND l_glfc.glfc017 = 'Y' THEN
#                       CALL s_analy_form_get_amt_3(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                                  l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                                  l_glfc.glfc010,p_wc,p_stus)
#                       RETURNING l_success 
#                       IF NOT l_success THEN
#                          EXIT FOREACH
#                       ELSE
#                          CONTINUE FOREACH
#                       END IF                       
#                    END IF
#                    #210112-00013#2 add ---e
                    #210301-00038@1 mark(e)
                    
                    #210112-00013#3 add ---s
                    IF g_prog MATCHES 'aglq930*' THEN
                       #210301-00038@1 mark(s)
#                       CALL s_analy_form_get_amt_q930y(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                                      l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                                      l_glfc.glfc010,p_wc,p_stus)
#                       RETURNING l_success
#                       IF NOT l_success THEN
#                          EXIT FOREACH
#                       ELSE
#                          CONTINUE FOREACH
#                       END IF
                       #210301-00038@1 mark(e)
                       #210301-00038@1 add(s)
                       CALL s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
                                                  l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                                  l_glfc.glfc010,p_wc,p_stus)
                       RETURNING l_success,l_amt
                       EXIT CASE
                       #210301-00038@1 add(e)
                    END IF                       
                    #210112-00013#3 add ---e
                    
                    #數據來源：合併報表統計檔(glea_t)
                    CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #mod ls_js
                                               l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                               l_glfc.glfc010,p_wc,p_stus)
                    RETURNING l_success,l_amt
                    #200723-00018#1 add s---
                    #--add by carol.wu  200521--S--
                    #--因為合併報表的科余是年度累計數, 遇到要取本期發生數時, 必須先扣減上減的數字才會正確
                    #IF g_prog MATCHES 'aglq939*' AND l_glfc.glfc008 MATCHES '[456]' THEN #本期發生額                     #210419-00041#1 mark
                    IF (g_prog MATCHES 'aglq939*' OR g_prog MATCHES 'agli075*') AND l_glfc.glfc008 MATCHES '[456]' THEN  #210419-00041#1 add
                       LET l_amt_last = 0
                       #取得去年期末
                       CALL s_fin_date_get_last_period(l_glaa003,p_ld,p_year,'1')
                       RETURNING l_success,l_last_yy,l_last_mm
                        
                       CALL s_analy_form_get_amt_2(p_ld,l_last_yy,l_last_mm,l_last_mm,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
                                         l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                         l_glfc.glfc010,p_wc,p_stus)
                       RETURNING l_success,l_amt_last
                       IF cl_null(l_amt_last) THEN
                          LET l_amt_last = 0
                       END IF
                       LET l_amt = l_amt - l_amt_last  #本期發生額
                    END IF
                    #200723-00018#1 add e---
                    #--add by carol.wu  200521--S--                                          
                 ELSE
                    #數據來源：總帳憑證統計檔glar_t           
                    CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,  #mod ls_js
                                              l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                              l_glfc.glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) 
                    RETURNING l_success,l_amt                 
                 END IF      
              WHEN '2'
                 CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #mod ls_js
                                            l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,       
                                            l_glfc.glfc010,p_wc) 
                 RETURNING l_success,l_amt                 
              #此段保留給已出貨且在agli201有設3選項的客戶使用     
              WHEN '3'
                 #210301-00038@1 mark(s)
#                 #210112-00013#2 add ---s 合併報表取值維度含帳套=Y
#                 IF g_prog MATCHES 'aglq937*' AND l_glfc.glfc017 = 'Y' THEN 
#                    CALL s_analy_form_get_amt_3(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                               l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                               l_glfc.glfc010,p_wc,p_stus)
#                    RETURNING l_success
#                    IF NOT l_success THEN
#                       EXIT FOREACH
#                    ELSE
#                       CONTINUE FOREACH
#                    END IF   
#                 END IF
#                 #210112-00013#2 add ---e    
                 #210301-00038@1 mark(e)
                 
                 #210112-00013#3 add ---s
                 IF g_prog MATCHES 'aglq930*' THEN
                    #210301-00038@1 mark(s)
#                    CALL s_analy_form_get_amt_q930y(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                                   l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                                   l_glfc.glfc010,p_wc,p_stus)
#                    RETURNING l_success
#                    IF NOT l_success THEN
#                       EXIT FOREACH
#                    ELSE
#                       CONTINUE FOREACH
#                    END IF                       
                    #210301-00038@1 mark(e)
                    #210301-00038@1 add(s)
                    CALL s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
                                                  l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                                  l_glfc.glfc010,p_wc,p_stus)
                         RETURNING l_success,l_amt
                    EXIT CASE
                    #210301-00038@1 add(e)
                 END IF                       
                 #210112-00013#3 add ---e                 
                 CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #mod ls_js
                                            l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                            l_glfc.glfc010,p_wc,p_stus)
                 RETURNING l_success,l_amt                    

              #191226-00004#9   mark-S
#              #191226-00004#7 add ---s
#              WHEN '5'
#                 LET l_amt = l_glfc.glfc016 CLIPPED
#              #191226-00004#7 add ---e
              #191226-00004#9   mark-E

           END CASE
           IF l_amt = 0 THEN CONTINUE FOREACH END IF  #200629-00035#1 add 
#200629-00035#1 mark s---           
#           IF l_glfc.glfc009 MATCHES '[34]' THEN #200330-00035#1 add
#              #181121-00017#2 #cy02 add s---
#              IF l_amt < 0 THEN 
#                 LET l_amt1 = l_amt1 + l_amt
#              ELSE 
#                 LET l_amt2 = l_amt2 + l_amt      
#              END IF      
#              #181121-00017#2 #cy02 add e---
#           #200330-00035#1 add s---
#           ELSE
#              #LET l_glfc0091 = 1            #200611-00032#1 mark
#              LET l_glfc0091 = l_glfc0091_t  #200611-00032#1 add              
#              IF l_glfc.glfc009 = '2' THEN 
#                 #LET l_glfc0091 = -1        #200611-00032#1 mark
#                 #200611-00032#1 add(s)
#                 #eg：agli201变量SYS0000102
#                 #    #1 22020101应付账款（贷余） 期末余额，贷=1000，运算符号=减号
#                 #    #2 112399  预付账款（借余） 期末余额，借=900 ，运算符合=空
#                 #此时，算出的金额应该是1000-900=100，调整前，是用当前行的1000*-1+900算出了-100
#                 LET l_glfc0091 = l_glfc0091_t
#                 LET l_glfc0091_t = -1 #运算符号用于下一行数字的计算                            
#                 #200611-00032#1 add(e)           
#              END IF   
#              INSERT INTO s_analy_tmp(glaq022,amt,glfc009) VALUES(l_glaq022,l_amt,l_glfc0091)
#           END IF   
#           #200330-00035#1 add e---
#200629-00035#1 mark e---          
           #INSERT INTO s_analy_tmp(glaq022,amt,glfc009) VALUES(l_glaq022,l_amt,l_glfc0091) #200629-00035#1 mark
           #INSERT INTO s_analy_tmp(glaq022,amt,glfc009,glfcseq,glfc011,glfc012) VALUES(l_glaq022,l_amt,l_glfc.glfc009,l_glfc.glfcseq,l_glfc.glfc011,l_glfc.glfc012) #200629-00035#1 add #210112-00013#2 mark
           #210301-00038@1 mark(s)
#           INSERT INTO s_analy_tmp(glaq022,amt,glfc009,glfcseq,glfc011,glfc012,ld)                 #210112-00013#2 add
#           VALUES(l_glaq022,l_amt,l_glfc.glfc009,l_glfc.glfcseq,l_glfc.glfc011,l_glfc.glfc012,' ') #210112-00013#2 add
           #210301-00038@1 mark(e)
           EXECUTE ins_tmp USING l_glaq022,l_amt,l_glfc.glfc009,l_glfc.glfcseq,l_glfc.glfc011,l_glfc.glfc012,l_ld  #210301-00038@1 add
         END FOREACH #181121-00017#2 #cy02 add
         LET l_amt = l_amt1 #181121-00017#2 #cy02 add
      #181121-00017#2 #cy02 add s---   
      ELSE
         #計算金額
         LET l_amt = 0
         LET l_amt2 = 0
         LET lc_param.glfc001 = l_glfc.glfc001
         LET lc_param.glaq022 = ''
         LET lc_param.ld = l_ld  #210301-00038@1 add         
         #210112-00013#2 add ---s
         LET lc_param.glfcseq = l_glfc.glfcseq
         LET lc_param.glfc009 = l_glfc.glfc009
         LET lc_param.glfc011 = l_glfc.glfc011
         LET lc_param.glfc012 = l_glfc.glfc012
         LET lc_param.glfc017 = l_glfc.glfc017         
         #210112-00013#2 add ---e         
         LET ls_js = util.JSON.stringify(lc_param)         
         CASE l_glfc.glfc013 
            WHEN '1'
               #agli201的glfc013只剩1和2選項，把選項3：合併報表統計檔併入選項1
               #因此在這用程式代號判斷是走總帳或是合併報表
               #IF g_prog MATCHES 'aglq93*' OR g_prog MATCHES 'aglq96*' OR g_prog MATCHES 'aglq947*' THEN  #200723-00018#1 mark
               IF l_glaa130 = 'Y' THEN #200723-00018#1 add                  
                  
                  #210301-00038@1 mark(s)
#                  #210112-00013#2 add ---s 合併報表取值維度含帳套=Y
#                  IF g_prog MATCHES 'aglq937*' AND l_glfc.glfc017 = 'Y' THEN 
#                     CALL s_analy_form_get_amt_3(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                                l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                                l_glfc.glfc010,p_wc,p_stus)
#                     RETURNING l_success
#                     EXIT CASE                     
#                  END IF
#                  #210112-00013#2 add ---e   
                  #210301-00038@1 mark(e)
                  
                  #210112-00013#3 add ---s
                  IF g_prog MATCHES 'aglq930*' THEN
                     #210301-00038@1 mark(s)
#                     CALL s_analy_form_get_amt_q930y(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                                    l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                                    l_glfc.glfc010,p_wc,p_stus)
#                     RETURNING l_success
                     #210301-00038@1 mark(e)
                     #210301-00038@1 add(s)
                     CALL s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
                                                    l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                                    l_glfc.glfc010,p_wc,p_stus)
                     RETURNING l_success,l_amt
                     #210301-00038@1 add(e)
                     EXIT CASE                     
                  END IF                       
                  #210112-00013#3 add ---e                  
                  #數據來源：合併報表統計檔(glea_t)
                  CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #mod ls_js
                                             l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                             l_glfc.glfc010,p_wc,p_stus)
                  RETURNING l_success,l_amt           

                  #200723-00018#1 add s---
                  #--add by carol.wu  200521--S--
                  #--因為合併報表的科余是年度累計數, 遇到要取本期發生數時, 必須先扣減上減的數字才會正確
                  #IF g_prog MATCHES 'aglq939*' AND l_glfc.glfc008 MATCHES '[456]' THEN #本期發生額                     #210419-00041#1 mark
                  IF (g_prog MATCHES 'aglq939*' OR g_prog MATCHES 'agli075*') AND l_glfc.glfc008 MATCHES '[456]' THEN  #210419-00041#1 add
                     LET l_amt_last = 0
                     #取得去年期末
                     CALL s_fin_date_get_last_period(l_glaa003,p_ld,p_year,'1')
                     RETURNING l_success,l_last_yy,l_last_mm
                      
                     CALL s_analy_form_get_amt_2(p_ld,l_last_yy,l_last_mm,l_last_mm,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
                                       l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                       l_glfc.glfc010,p_wc,p_stus)
                     RETURNING l_success,l_amt_last
                     IF cl_null(l_amt_last) THEN
                        LET l_amt_last = 0
                     END IF
                     LET l_amt = l_amt - l_amt_last  #本期發生額
                  END IF
                  #200723-00018#1 add e---
                  #--add by carol.wu  200521--S--                    
               ELSE
                  #數據來源：總帳憑證統計檔glar_t           
                  CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,  #mod ls_js
                                            l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                            l_glfc.glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus'  #170222-00003#1 add ,p_show_ce,p_show_ye
                  RETURNING l_success,l_amt                 
               END IF      
            WHEN '2'
               CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #mod ls_js
                                          l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,       
                                          l_glfc.glfc010,p_wc) 
               RETURNING l_success,l_amt                 
            #此段保留給已出貨且在agli201有設3選項的客戶使用     
            WHEN '3'
               
               #210301-00038@1 mark(s)
#               #210112-00013#2 add ---s 合併報表取值維度含帳套=Y
#               IF g_prog MATCHES 'aglq937*' AND l_glfc.glfc017 = 'Y' THEN 
#                  CALL s_analy_form_get_amt_3(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                             l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                             l_glfc.glfc010,p_wc,p_stus)
#                  RETURNING l_success
#                  EXIT CASE                  
#               END IF
#               #210112-00013#2 add ---e
               #210301-00038@1 mark(e)
               
               #210112-00013#3 add ---s
               IF g_prog MATCHES 'aglq930*' THEN
                  #210301-00038@1 mark(s)
#                  CALL s_analy_form_get_amt_q930y(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
#                                                 l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                                 l_glfc.glfc010,p_wc,p_stus)
#                  RETURNING l_success
                  #210301-00038@1 mark(e)
                  #210301-00038@1 add(s)
                  CALL s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003,
                                                 l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                                 l_glfc.glfc010,p_wc,p_stus)
                  RETURNING l_success,l_amt
                  #210301-00038@1 add(e)
                  EXIT CASE                       
               END IF                       
               #210112-00013#3 add ---e
               CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,ls_js,l_glfc.glfc002,l_glfc.glfc003, #mod ls_js
                                          l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                          l_glfc.glfc010,p_wc,p_stus)
               RETURNING l_success,l_amt               

            #191226-00004#7 add ---s
            WHEN '5'
               #191226-00004#9   add-S
               IF cl_null(l_glfc.glfc016) THEN
                  LET l_glfc.glfc016 = 0
               END IF
               LET l_success = TRUE
               #191226-00004#9   add-E
               LET l_amt = l_glfc.glfc016 CLIPPED
            #191226-00004#7 add ---e

         END CASE
      END IF     
      #181121-00017#2 #cy02 add e---
      IF l_success = FALSE THEN
         LET r_success = FALSE
         RETURN r_success,r_amount,r_amount2  #181121-00017#2 #cy02 add r_amount2
      END IF

      IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF #181121-00017#2 #cy02 add
      LET l_str = l_str CLIPPED,l_amt CLIPPED
      LET l_str2 = l_str2 CLIPPED,l_amt2 CLIPPED #181121-00017#2 #cy02 add #累加

      #右括號
      IF l_glfc.glfc012 = 'Y' THEN 
         LET l_str = l_str CLIPPED ," ) " CLIPPED
      END IF
      
      #181121-00017#2 #cy02 add s---
      #右括號
      IF l_glfc.glfc012 = 'Y' THEN 
         LET l_str2 = l_str2 CLIPPED ," ) " CLIPPED
      END IF      
      #181121-00017#2 #cy02 add e---
      
      #運算符
      CASE l_glfc.glfc009
         WHEN 1   LET l_glfc009 = ' + '
         WHEN 2   LET l_glfc009 = ' - '
         WHEN 3   LET l_glfc009 = ' * '
         WHEN 4   LET l_glfc009 = ' / '
           
      END CASE
      
      IF NOT cl_null(l_glfc.glfc009) THEN 
         LET l_str = l_str CLIPPED,l_glfc009 CLIPPED
         LET l_str2 = l_str2 CLIPPED,l_glfc009 CLIPPED #181121-00017#2 #cy02 add
      END IF
   
   END FOREACH 
 
   IF cl_null(l_str) THEN 
      RETURN r_success,r_amount,r_amount2 #181121-00017#2 #cy02 add r_amount2 
   END IF
   
   LET l_sql = "SELECT ",l_str CLIPPED," FROM DUAL"
   PREPARE l_sql_pre2 FROM l_sql
   EXECUTE l_sql_pre2 INTO r_amount
   
   #181121-00017#2 #cy20 add s---
   IF NOT cl_null(l_str2) THEN 
      LET l_sql = "SELECT ",l_str2 CLIPPED," FROM DUAL"
      PREPARE l_sql_pre3 FROM l_sql
      EXECUTE l_sql_pre3 INTO r_amount2 #累加
   END IF   
   #181121-00017#2 #cy20 add e---
   #200629-00035#1 add(s) #针对不启用核算项的
   IF r_amount > 0 THEN 
      LET r_amount2 = r_amount
      LET r_amount = 0
   END IF   
   IF r_amount2 < 0 THEN 
      LET r_amount= r_amount2
      LET r_amount2 = 0
   END IF
   #200629-00035#1 add(e)
   #除數不可為0
   IF SQLCA.sqlerrd[2] = -1476 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00237'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = l_str
      IF NOT cl_null(g_fun_argv.glfbl004) THEN
         LET g_errparam.extend = s_get_field_name('agli070','glfbl004'),":",g_fun_argv.glfbl004,
                                 " & ",
                                 s_get_field_name('agli070','glfb003'), ":",g_fun_argv.glfb003,
                                 " >> ",
                                 l_str
      END IF
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_amount,r_amount2 #181121-00017#2 #cy02 add r_amount2 
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   #181121-00017#2 #cy02 add s---
   IF cl_null(r_amount2) THEN 
      LET r_amount2 = 0
   END IF   
   #181121-00017#2 #cy02 add e---
   
   #200330-00035#1 add s---#同核算项借贷合并后再判断正负值
   LET l_cnt = 0 
   #SELECT COUNT(1) INTO l_cnt FROM s_analy_tmp  #210301-00038@1 mark
   EXECUTE get_tmpcnt2 INTO l_cnt                #210301-00038@1 add
   IF l_cnt > 0 THEN 
##200717-00016#1 (0717) mark s---   
#      #200714-00066#1 add s---
#      LET l_sql = " SELECT glfcseq,glfc009,glfc011,glfc012 FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc001 = '",l_glfc.glfc001,"' ORDER BY glfcseq"
#      PREPARE s_analy_form_tmp_pr4 FROM l_sql
#      DECLARE s_analy_form_tmp_cs4 CURSOR FOR s_analy_form_tmp_pr4
#      
#      LET l_sql = " SELECT COUNT(1) FROM s_analy_tmp WHERE glfcseq = ? "
#      PREPARE s_analy_form_tmp_pr3 FROM l_sql
#      DECLARE s_analy_form_tmp_cs3 CURSOR FOR s_analy_form_tmp_pr3
#      
#      LET l_seq = 0
#      FOREACH s_analy_form_tmp_cs4 INTO l_seq,l_glfc009_t,l_glfc011_t,l_glfc012_t
#         LET l_cnt = 0 
#         EXECUTE s_analy_form_tmp_cs3 USING l_seq INTO l_cnt
#         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
#         IF l_cnt = 0 THEN 
#            INSERT INTO s_analy_tmp(glaq022,amt,glfc009,glfcseq,glfc011,glfc012,flag) 
#               VALUES('',0,l_glfc009_t,l_seq,l_glfc011_t,l_glfc012_t,'1')
#         END IF
#      END FOREACH
#      #200714-00066#1 add e---
##200717-00016#1 (0717) mark e---
      
      #200629-00035#1 add s--- 
      LET l_sql = " SELECT DISTINCT glaq022,ld FROM s_analy_tmp  " #210112-00013#2 add ld
      PREPARE s_analy_form_tmp_pr1 FROM l_sql
      DECLARE s_analy_form_tmp_cs1 CURSOR FOR s_analy_form_tmp_pr1
      LET l_i = 1
      FOREACH s_analy_form_tmp_cs1 INTO l_text[l_i].glaq022,l_text[l_i].ld #210112-00013#2 add ld
         LET l_i = l_i + 1
      END FOREACH      
      CALL l_text.deleteElement(l_text.getLength()) 
      LET l_amt1 = 0 
      LET l_amt2 = 0
      LET l_amt = 0      
      FOR l_i = 1 TO l_text.getLength()
      #200629-00035#1 add e--- 
#200629-00035#1 mark s---      
#         LET l_amt = 0
#         LET l_sql = " SELECT SUM(amt*glfc009) FROM s_analy_tmp GROUP BY glaq022 "
#         PREPARE s_analy_form_tmp_pr FROM l_sql
#         DECLARE s_analy_form_tmp_cs CURSOR FOR s_analy_form_tmp_pr  
#         LET l_amt1 = 0 
#         LET l_amt2 = 0
#         LET l_amt = 0
#         FOREACH s_analy_form_tmp_cs INTO l_amt 
#            IF l_amt < 0 THEN 
#               LET l_amt1 = l_amt1 + l_amt
#            ELSE
#               LET l_amt2 = l_amt2 + l_amt
#            END IF 
#            LET r_amount = l_amt1
#            LET r_amount2 = l_amt2
#         END FOREACH 
#200629-00035#1 mark e---
         #200629-00035#1 add s---
         
         #200825-00025#1 add(s)
         #210301-00038@1 mark(s)
#         LET l_sql = " MERGE INTO s_analy_tmp t1 ",
#                     " USING (SELECT glfcseq,glfc009,glfc011,glfc012 FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc001 = '",l_glfc.glfc001,"' ORDER BY glfcseq) t2 ",
#                     #" ON (t1.glfcseq = t2.glfcseq AND t1.glaq022 = '",l_text[l_i].glaq022,"') ", #210112-00013#2 mark
#                     "    ON (t1.glfcseq = t2.glfcseq AND t1.glaq022 = '",l_text[l_i].glaq022,"'", #210112-00013#2 add
#                     "        AND t1.ld = '",l_text[l_i].ld,"')", #210112-00013#2 add
#                     "  WHEN NOT MATCHED THEN ",
#                     "INSERT VALUES('',0,t2.glfc009,t2.glfcseq,t2.glfc011,t2.glfc012,'1','') "  #210112-00013#2 add ''                   
#         PREPARE s_analy_form_tmp_pr4 FROM l_sql
#         EXECUTE s_analy_form_tmp_pr4
         #210301-00038@1 mark(e)
         EXECUTE s_analy_form_tmp_pr4 USING l_glfc.glfc001,l_text[l_i].glaq022,l_text[l_i].ld  #210301-00038@1 add
         #200825-00025#1 add(e)
      
         #200714-00066#1 add s---
         UPDATE s_analy_tmp SET glaq022 = l_text[l_i].glaq022
            WHERE glaq022 IS NULL AND flag = '1'
         #200714-00066#1 add e---

         #210112-00013#2 add ---s
         UPDATE s_analy_tmp SET ld = l_text[l_i].ld
          WHERE ld IS NULL AND flag = '1'
         #210112-00013#2 add ---e

         LET l_str3 = NULL
         LET l_glfcseq_t = NULL
         #LET l_sql = " SELECT * FROM s_analy_tmp WHERE glaq022 = '",l_text[l_i].glaq022,"' ORDER BY glfcseq" #210112-00013#2 mark
         #210112-00013#2 add ---s
         LET l_sql = " SELECT * FROM s_analy_tmp ", 
                     "  WHERE glaq022 = '",l_text[l_i].glaq022,"'",
                     "    AND ld = '",l_text[l_i].ld,"'",
                     "  ORDER BY glfcseq" 
         #210112-00013#2 add ---e
         PREPARE s_analy_form_tmp_pr FROM l_sql
         DECLARE s_analy_form_tmp_cs CURSOR FOR s_analy_form_tmp_pr 
         
         LET l_sql = " SELECT glfc011,glfc009,glfc012,0 FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc001 = '",l_glfc.glfc001,"'",
                     "    AND glfcseq = ? "
         PREPARE s_analy_form_tmp_pr2 FROM l_sql
         DECLARE s_analy_form_tmp_cs2 CURSOR FOR s_analy_form_tmp_pr2
         
         #200717-00016#1 add s---
         LET l_sql = " SELECT MIN(glfcseq) FROM glfc_t WHERE glfcent = ",g_enterprise," AND glfc001 = '",l_glfc.glfc001,"'"
         PREPARE s_analy_form_tmp_pr5 FROM l_sql
         EXECUTE s_analy_form_tmp_pr5 INTO l_seq_min
         #200717-00016#1 add e---
         
         FOREACH s_analy_form_tmp_cs INTO l_tmp.glaq022,l_tmp.amt,l_tmp.glfc009,l_tmp.glfcseq,l_tmp.glfc011,l_tmp.glfc012
           ,l_tmp.flag,l_tmp.ld #210112-00013#2 add

            IF cl_null(l_tmp.amt) THEN LET l_tmp.amt = 0 END IF 
            
            #200714-00066#1 add s---
            LET l_flag1 = TRUE
            LET l_cnt = 0
            #SELECT COUNT(1) INTO l_cnt FROM s_analy_tmp WHERE flag = '1'  #210301-00038@1 mark
            EXECUTE get_tmpcnt1 INTO l_cnt                                 #210301-00038@1 add 
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
            IF l_cnt = 0 THEN  
            
            #核算项   金额  计算符号  项次   左括号 右括号
            #CS200,   900,    2,      1,       N,    N
            #00000,  -100,  NULL,     2,       N,    N
            #CS200,  1000,  NULL,     2,       N,    N
            #IF cl_null(l_str3) AND l_tmp.glfcseq <> '1' THEN       #200717-00016#1 mark
            IF cl_null(l_str3) AND l_tmp.glfcseq <> l_seq_min THEN  #200717-00016#1 add
               LET l_n1 = 1 
               LET l_flag1 = FALSE
            END IF #核算项00000项次1无资料时，取用上次一个项次的计算符号
            #核算项   金额  计算符号  项次   左括号 右括号
            #C001,   900,    2,      1,       Y,    N            
            #          0,    2,      2,       N,    Y(这笔科目余额为0的 未记录临时表中)
            #0098,  -100,  NULL,     2,       N,    N
            #C001,  1000,  NULL,     2,       N,    N            
            IF NOT cl_null(l_glfcseq_t) AND l_glfcseq_t <> l_tmp.glfcseq -1 AND NOT cl_null(l_str3) THEN 
               LET l_n1 = l_glfcseq_t + 1 
               LET l_flag1 = FALSE 
            END IF #中间有漏项次的，则把中间项次的计算符号和左右括号补上
            LET l_glfc009 = NULL
            IF l_flag1 = FALSE THEN 
               FOR l_n = l_n1 TO l_tmp.glfcseq -1
                   FOREACH s_analy_form_tmp_cs2 USING l_n INTO l_glfc011,l_glfc0091,l_glfc012,l_amt3 
                      #左括號
                      IF l_glfc011 = 'Y' THEN 
                         IF cl_null(l_str3) THEN 
                            LET l_str3 = "(" CLIPPED
                         ELSE
                            LET l_str3 = l_str3 CLIPPED ," ( " CLIPPED
                         END IF
                      END IF
                      
                      LET l_str3 = l_str3 CLIPPED,l_amt3 CLIPPED
                      
                      #右括號
                      IF l_glfc012 = 'Y' THEN 
                         LET l_str3 = l_str3 CLIPPED ," ) " CLIPPED
                      END IF      
                      
                      #運算符
                      CASE l_glfc0091
                         WHEN 1   LET l_glfc0092 = ' + '
                         WHEN 2   LET l_glfc0092 = ' - '
                         WHEN 3   LET l_glfc0092 = ' * '
                         WHEN 4   LET l_glfc0092 = ' / '
                      END CASE
                      
                      IF NOT cl_null(l_glfc0092) THEN 
                         LET l_str3 = l_str3 CLIPPED,l_glfc0092 CLIPPED
                      END IF                               
                   END FOREACH
               END FOR 
            END IF               
            END IF
            #200714-00066#1 add e---
            #左括號
            IF l_tmp.glfc011 = 'Y' THEN 
               IF cl_null(l_str3) THEN 
                  LET l_str3 = "(" CLIPPED
               ELSE
                  LET l_str3 = l_str3 CLIPPED ," ( " CLIPPED
               END IF
            END IF
            
            LET l_str3 = l_str3 CLIPPED,l_tmp.amt CLIPPED
            
            #右括號
            IF l_tmp.glfc012 = 'Y' THEN 
               LET l_str3 = l_str3 CLIPPED ," ) " CLIPPED
            END IF      
   
            #運算符
            CASE l_tmp.glfc009
               WHEN 1   LET l_glfc009 = ' + '
               WHEN 2   LET l_glfc009 = ' - '
               WHEN 3   LET l_glfc009 = ' * '
               WHEN 4   LET l_glfc009 = ' / '
            END CASE
            
            IF NOT cl_null(l_tmp.glfc009) THEN 
               LET l_str3 = l_str3 CLIPPED,l_glfc009 CLIPPED
            END IF     

            LET l_glfcseq_t = l_tmp.glfcseq #200714-00066#1 add
            INITIALIZE l_tmp.* TO NULL #210112-00013#3 add
         END FOREACH         
         IF cl_null(l_str3) THEN LET l_str3 = "0" END IF #210112-00013#3 add
         LET l_sql = "SELECT ",l_str3 CLIPPED," FROM DUAL"
         PREPARE l_sql_pre31 FROM l_sql
         EXECUTE l_sql_pre31 INTO l_amt
         IF l_amt < 0 THEN 
            LET l_amt1 = l_amt1 + l_amt
         ELSE
            LET l_amt2 = l_amt2 + l_amt
         END IF     
         #200629-00035#1 add e--- 
##200717-00016#1 (0717) mod s---         
#         #200714-00066#1 add s---
#         UPDATE s_analy_tmp SET glaq022 = l_text[l_i].glaq022
#            WHERE glaq022 IS NOT NULL AND flag = '1'
#         #200714-00066#1 add e---  
          DELETE FROM s_analy_tmp WHERE glaq022 = l_text[l_i].glaq022 AND glaq022 IS NOT NULL AND flag = '1'
##200717-00016#1 (0717) mod e--- 
      END FOR #200629-00035#1 add  
      LET r_amount = l_amt1
      LET r_amount2 = l_amt2      
   END IF
   #200330-00035#1 add e---   
   
   #200825-00025#1 add(s)
   #存入动态数组
   LET l_num3 = g_s_analy_form_get_glfc_1_reuse.getLength() + 1
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].ld = p_ld
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].year = p_year
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].bmonth = p_bmonth
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].emonth = p_emonth
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].glfc001 = p_glfc001
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].wc = p_wc
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].show_ad = p_show_ad
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].stus = p_stus
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].show_ce = p_show_ce
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].show_ye = p_show_ye
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].success = r_success
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].amount = r_amount
   LET g_s_analy_form_get_glfc_1_reuse[l_num3].amount2 = r_amount2
   #200825-00025#1 add(e)
   
   RETURN r_success,r_amount,r_amount2 #181121-00017#2 #cy02 add add r_amount2 
END FUNCTION

################################################################################
# Descriptions...: 用于重分类
# Memo...........:
# Usage..........: CALL s_analy_form_tmp()
# Date & Author..:  
# Modify.........: #200330-00035#1
################################################################################
PUBLIC FUNCTION s_analy_form_tmp()

   DROP TABLE s_analy_tmp; #ODI-ORA#
   CREATE TEMP TABLE s_analy_tmp
   (
      glaq022 LIKE glaq_t.glaq022,  #核算项
      amt     LIKE glar_t.glar005,  #科目余额
      glfc009 LIKE type_t.num5,     #科目
      #200629-00035#1 add s---
      glfcseq LIKE glfc_t.glfcseq,
      glfc011 LIKE glfc_t.glfc011,
      glfc012 LIKE glfc_t.glfc012,    
      #200629-00035#1 add e---    
      flag    LIKE type_t.chr1,      #200714-00066#1 #210112-00013#2 add ,
      ld      LIKE glea_t.glea033    #210112-00013#2 add
          
   );
END FUNCTION

################################################################################
# Descriptions...: 不含审计调整凭证时本年利润金额
# Memo...........:
# Usage..........: CALL s_analy_form_get_amt_ad(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
#                : p_stus      傳票狀態 
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: #200927-00028#1 2020/10/20 by 08172
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_ad(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
   DEFINE p_ld            STRING                               
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       LIKE glfc_t.glfc001
   DEFINE p_glfc002       LIKE glfc_t.glfc002
   DEFINE p_glfc003       LIKE glfc_t.glfc003
   DEFINE p_glfc004       LIKE glfc_t.glfc004
   DEFINE p_glfc005       LIKE glfc_t.glfc005
   DEFINE p_glfc006       LIKE glfc_t.glfc006
   DEFINE p_glfc007       LIKE glfc_t.glfc007
   DEFINE p_glfc008       LIKE glfc_t.glfc008
   DEFINE p_glfc010       LIKE glfc_t.glfc010
   DEFINE p_wc            STRING
   DEFINE p_stus          LIKE type_t.chr1
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   DEFINE l_field         LIKE type_t.chr100
   DEFINE l_sql_ad        STRING
   DEFINE l_sql_stus      STRING
   DEFINE l_sum_str_ad    STRING
   DEFINE l_glab005       LIKE glab_t.glab005
   DEFINE l_count         LIKE type_t.num5
   
   LET r_success = TRUE
   LET r_amount = 0
   
   IF cl_null(p_stus) THEN
      LET p_stus='1'  
   END IF 
   CASE p_stus
      WHEN '1' 
         LET l_sql_stus=" AND glapstus='S'"
      WHEN '2'
         LET l_sql_stus=" AND glapstus IN ('S','Y') "
      WHEN '3'
         LET l_sql_stus=" AND glapstus IN ('S','Y','N') "
   END CASE    
   
   #取本年利润-agli160
   LET l_glab005 = ''
   LET l_sql = "SELECT glab005 ",
               "  FROM glab_t ",
               " WHERE glabent = ",g_enterprise,
               "   AND glabld IN ('",p_ld,"') ",
               "   AND glab001 = '12' ",
               "   AND glab002 = '9711' ",
               "   AND glab003 = '9711_04' "
   PREPARE glab_sel_pre FROM l_sql
   EXECUTE glab_sel_pre INTO l_glab005
   
   #起始截止科目中是否有本年利润科目
   LET l_count = 0
   LET l_sql = "SELECT COUNT(1) ",
               "  FROM glad_t ",
               " WHERE gladent = ",g_enterprise,
               "   AND gladld IN ('",p_ld,"') ",
               "   AND glad001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
               "   AND glad001 = '",l_glab005,"' "
   PREPARE glad_sel_pre FROM l_sql 
   EXECUTE glad_sel_pre INTO l_count
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   #若无本年利润科目则直接返回
   IF l_count = 0 THEN
      RETURN r_success,r_amount
   END IF
   #本年利润-AD审计调整损益科目凭证金额
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 < ",p_bmonth,
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '2'  #期初餘額在借方
         LET l_sum_str_ad=" SUM(glaq003-glaq004) "   
         LET l_sql_ad="  ",                          
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 < ",p_bmonth,
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '3'  #期初餘額在貸方
         LET l_sum_str_ad=" SUM(glaq004-glaq003) "   
         LET l_sql_ad="  ",                          
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 < ",p_bmonth,
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '4'  #本期借方
         LET l_sql_ad="SELECT SUM(glaq003) ",
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '5'  #本期貸方
         LET l_sql_ad="SELECT SUM(glaq004) ",
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '6'  #本期發生額
         LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '7'  #期末餘額
         LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 <=  ",p_emonth,  
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '8'  #期末餘額在借方
         LET l_sum_str_ad=" SUM(glaq003-glaq004) "   
         LET l_sql_ad="  ",                          
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 <=  ",p_emonth,  
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
      WHEN '9'  #期末餘額在貸方
         LET l_sum_str_ad=" SUM(glaq004-glaq003) "  
         LET l_sql_ad="  ",                          
                      "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                      " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                      "   AND glap002 = ",p_year,
                      "   AND glap004 <=  ",p_emonth,  
                      "   AND glap007 = 'AD' ",
                      "   AND EXISTS (SELECT 1 ",
                      "                 FROM glac_t ",
                      "                WHERE glacent = ",g_enterprise,
                      "                  AND glac001 = '",p_glfc002,"' ",
                      "                  AND glac002 = glaq002 ",
                      "                  AND glac007 = '6') ",  #损益类
                      l_sql_stus
   END CASE 
   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field= 'glaq017'
      WHEN '2'   #部門
         LET l_field= 'glaq018'
      WHEN '3'   #利潤/成本中心
         LET l_field= 'glaq019'
      WHEN '4'   #區域
         LET l_field= 'glaq020'
      WHEN '5'   #交易客商
         LET l_field= 'glaq021'
      WHEN '6'   #帳款客商
         LET l_field= 'glaq022'
      WHEN '7'   #客群
         LET l_field= 'glaq023'
      WHEN '8'   #產品類別
         LET l_field= 'glaq024'
      WHEN '9'   #經營方式
         LET l_field= 'glaq051'
      WHEN '10'   #渠道
         LET l_field= 'glaq052'
      WHEN '11'   #品牌
         LET l_field= 'glaq053'
      WHEN '12'   #人員
         LET l_field= 'glaq025'
      WHEN '13'  #專案編號
         LET l_field= 'glaq027'
      WHEN '14'  #WBS
         LET l_field= 'glaq028'
      WHEN '15'  #自由核算項一
         LET l_field= 'glaq029'
      WHEN '16'  #自由核算項二
         LET l_field= 'glaq030'
      WHEN '17'  #自由核算項三
         LET l_field= 'glaq031'
      WHEN '18'  #自由核算項四
         LET l_field= 'glaq032'
      WHEN '19'  #自由核算項五
         LET l_field= 'glaq033'
      WHEN '20'  #自由核算項六
         LET l_field= 'glaq034'
      WHEN '21'  #自由核算項七
         LET l_field= 'glaq035'
      WHEN '22'  #自由核算項八
         LET l_field= 'glaq036'
      WHEN '23'  #自由核算項九
         LET l_field= 'glaq037'
      WHEN '24'  #自由核算項十
         LET l_field= 'glaq038'
      OTHERWISE
         LET l_field = ''
   END CASE
   IF NOT cl_null(p_wc) THEN
      LET l_sql_ad = l_sql_ad," AND ",p_wc
   END IF
   #核算项范围条件
   IF NOT cl_null(l_field) THEN
      IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql_ad = l_sql_ad," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
      END IF
      
      IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
         LET l_sql_ad = l_sql_ad," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
      END IF
      IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql_ad = l_sql_ad," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
      END IF
   END IF 
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF cl_null(l_field) THEN
         LET l_field="''"
      END IF
      LET l_sql_ad="SELECT sum(amt) ",
                   "  FROM (",
                   "        SELECT glaq002,",l_field,",",l_sum_str_ad," amt ",l_sql_ad,
                   "         GROUP BY glaq002,",l_field,
                   "       )"
   END IF
   
   #审计调整损益金额
   PREPARE glaq_ad_pre1 FROM l_sql_ad
   EXECUTE glaq_ad_pre1 INTO r_amount
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   IF cl_null(r_amount) THEN LET r_amount=0 END IF
   RETURN r_success,r_amount 
END FUNCTION

################################################################################
# Descriptions...: 數據來源:合併報表合併後各期科目餘額檔 glea_t 且合併報表重分類維度含帳套
# Memo...........: 
# Usage..........: CALL s_analy_form_get_amt_3(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : ls_js       字串(glfc001變量編號/glaq022帳款客商)
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
#                : p_stus      本位幣狀態
# Return code....: r_success   檢核狀態
# Date & Author..: #210112-00013#2 add by 10043
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_3(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
DEFINE p_ld            STRING         
DEFINE p_year          LIKE type_t.num5
DEFINE p_bmonth        LIKE type_t.num5
DEFINE p_emonth        LIKE type_t.num5
DEFINE p_glfc001       LIKE glfc_t.glfc001
DEFINE p_glfc002       LIKE glfc_t.glfc002
DEFINE p_glfc003       LIKE glfc_t.glfc003
DEFINE p_glfc004       LIKE glfc_t.glfc004
DEFINE p_glfc005       LIKE glfc_t.glfc005
DEFINE p_glfc006       LIKE glfc_t.glfc006
DEFINE p_glfc007       LIKE glfc_t.glfc007
DEFINE p_glfc008       LIKE glfc_t.glfc008
DEFINE p_glfc010       LIKE glfc_t.glfc010
DEFINE p_wc            STRING
DEFINE p_stus          LIKE type_t.chr1
DEFINE r_success       LIKE type_t.num5
DEFINE l_sql           STRING
DEFINE l_sql_t         STRING
DEFINE l_field         LIKE type_t.chr100
DEFINE l_glaa004       LIKE glaa_t.glaa004
DEFINE l_glac008       LIKE glac_t.glac008
DEFINE l_wc            STRING
DEFINE l_field1        STRING
DEFINE l_field2        STRING
DEFINE l_field3        STRING
DEFINE l_field4        STRING
DEFINE l_field5        STRING
DEFINE l_sum_str       STRING
DEFINE l_bmonth        LIKE type_t.num5        
DEFINE l_success       LIKE type_t.num5        
DEFINE l_glaa003       LIKE glaa_t.glaa003     
DEFINE l_last_yy       LIKE type_t.num5        
DEFINE l_last_mm       LIKE type_t.num5
DEFINE lc_param        RECORD
    glfc001            LIKE glfc_t.glfc001,
    glaq022            LIKE glaq_t.glaq022,
    glfcseq            LIKE glfc_t.glfcseq,
    glfc009            LIKE glfc_t.glfc009,
    glfc011            LIKE glfc_t.glfc011,
    glfc012            LIKE glfc_t.glfc012    
                       END RECORD 
DEFINE ls_js           STRING   
DEFINE l_where1        STRING
DEFINE l_where         STRING
DEFINE l_group_field   STRING
DEFINE l_amount        LIKE glar_t.glar005
DEFINE l_glea033       LIKE glea_t.glea033

  
   CALL util.JSON.parse(ls_js,lc_param)
   LET p_glfc001 = lc_param.glfc001 
   # p_stus  1  記帳幣   本位幣一
   #         2  功能幣   本位幣二
   #         3  報告幣   本位幣三
   
   LET r_success = TRUE
   LET l_field = ''
   LET l_glac008 = ''
   EXECUTE glac008_pre USING p_glfc003 INTO l_glac008 

   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF
   
   LET l_group_field = " glea033 "
   IF cl_null(p_stus)THEN LET p_stus = '1' END IF
   CASE  p_stus
      WHEN 1 
         #記帳幣
         LET l_field1 = " SELECT SUM(glea008 - glea009),",l_group_field
         LET l_field2 = " SELECT SUM(glea008),",l_group_field
         LET l_field3 = " SELECT SUM(glea009),",l_group_field
         LET l_field4 = " SUM(glea008-glea009) "        
         LET l_field5 = " SUM(glea009-glea008) "
      WHEN 2           
         LET l_field1 = " SELECT SUM(glea027 - glea028),",l_group_field
         LET l_field2 = " SELECT SUM(glea027),",l_group_field
         LET l_field3 = " SELECT SUM(glea028),",l_group_field
         LET l_field4 = " SELECT SUM(glea027-glea028) " 
         LET l_field5 = " SELECT SUM(glea028-glea027) " 

     WHEN 3               
        LET l_field1 =  " SELECT SUM(glea030 - glea031),",l_group_field
        LET l_field2 =  " SELECT SUM(glea030),",l_group_field
        LET l_field3 =  " SELECT SUM(glea031),",l_group_field
        LET l_field4 =  " SELECT SUM(glea030-glea031) "
        LET l_field5 =  " SELECT SUM(glea031-glea030) "        
   END CASE
   IF p_glfc008 MATCHES '[123A]' THEN      #期初資料
      #取得會計週期參照表
      LET l_glaa003 = ''
      CALL s_ld_sel_glaa(p_ld,'glaa003') RETURNING  l_success,l_glaa003
      
      #取得去年期末
      CALL s_fin_date_get_last_period(l_glaa003,p_ld,p_year,'1')
            RETURNING l_success,l_last_yy,l_last_mm
   END IF
   
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
      WHEN '2'  #期初餘額在借方
         LET l_sql = "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
         
      WHEN '3'  #期初餘額在貸方
          LET l_sql ="  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
               
      WHEN '4'  #本期借方
          LET l_sql = l_field2 CLIPPED, 
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,               
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
      WHEN '5'  #本期貸方
          LET l_sql = l_field3 CLIPPED, 
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '6'  #本期發生額
          LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                     
      WHEN '7'  #期末餘額
          LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 =  ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
         
      WHEN '8'  #期末餘額在借方
          LET l_sql ="  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 =  ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '9'  #期末餘額在貸方
          LET l_sql ="  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 =  ",p_emonth,    
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"                     
      WHEN 'A'
         LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t,gldb_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        IF g_prog MATCHES 'aglq938*' OR p_glfc008 = 'A' THEN
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF    
   END CASE 


   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field = 'glea012'
      WHEN '2'   #部門
         LET l_field = 'glea013'
      WHEN '3'   #利潤/成本中心
         LET l_field = 'glea014'
      WHEN '4'   #區域
         LET l_field = 'glea015'
      WHEN '5'   #交易客商
         LET l_field = 'glea016'
      WHEN '6'   #帳款客商
         LET l_field = 'glea017'
      WHEN '7'   #客群
         LET l_field = 'glea018'
      WHEN '8'   #產品類別
         LET l_field = 'glea019'
      WHEN '9'   #經營方式
         LET l_field = 'glea020'
      WHEN '10'   #渠道
         LET l_field = 'glea021'
      WHEN '11'   #品牌
         LET l_field = 'glea022'
      WHEN '12'   #人員
         LET l_field = 'glea023'
      WHEN '13'  #專案編號
         LET l_field = 'glea024'
      WHEN '14'  #WBS
         LET l_field = 'glea024'      
      OTHERWISE
         LET l_field = ''
   END CASE

   IF NOT cl_null(lc_param.glaq022) THEN 
      LET l_where = " AND ",l_field," IN('",lc_param.glaq022,"')"
   ELSE
      LET l_where = " AND 1=1 "  
      LET lc_param.glaq022 = ' '
   END IF
   
   LET l_sql = l_sql," AND glea005 IN (SELECT glac002 FROM glac_t ",
                     "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                     "                    AND glacent = ",g_enterprise,
                     "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
   IF NOT cl_null(p_wc) THEN
      LET l_wc=cl_replace_str(p_wc,"glar001","glea005")
      LET l_wc=cl_replace_str(l_wc,"glar012","glea012")
      LET l_wc=cl_replace_str(l_wc,'glar013','glea013')
      LET l_wc=cl_replace_str(l_wc,'glar014','glea014')
      LET l_wc=cl_replace_str(l_wc,'glar015','glea015')
      LET l_wc=cl_replace_str(l_wc,'glar016','glea016')
      LET l_wc=cl_replace_str(l_wc,'glar017','glea017')
      LET l_wc=cl_replace_str(l_wc,'glar018','glea018')
      LET l_wc=cl_replace_str(l_wc,'glar019','glea019')
      LET l_wc=cl_replace_str(l_wc,'glar051','glea020')
      LET l_wc=cl_replace_str(l_wc,'glar052','glea021')
      LET l_wc=cl_replace_str(l_wc,'glar053','glea022')
      LET l_wc=cl_replace_str(l_wc,'glar020','glea023')
      LET l_wc=cl_replace_str(l_wc,'glar022','glea024')
      LET l_wc=cl_replace_str(l_wc,'glar023','glea025')
      LET l_sql = l_sql," AND ",l_wc
   END IF
   
   #核算项范围条件
   IF cl_null(lc_param.glaq022) THEN
      IF NOT cl_null(l_field) THEN       
         IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
         END IF
         
         IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
         END IF
         IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
         END IF
      END IF
   ELSE
      IF NOT cl_null(l_where) THEN    
         LET l_sql = l_sql,l_where
      END IF  
   END IF
   
   #額外條件
   IF NOT cl_null(p_glfc010) THEN 
      LET l_sql = l_sql," AND ",p_glfc010
   END IF
   
   LET l_sql_t = l_sql
   LET l_sql = l_sql," GROUP BY ",l_group_field
   
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF p_glfc008='2' OR p_glfc008='8' THEN
         LET l_sum_str=l_field4 #借-贷
      ELSE
         LET l_sum_str=l_field5 #贷-借
      END IF      
      IF cl_null(l_field) THEN
         LET l_sql="SELECT sum(amt), ",l_group_field,
                      "  FROM (",
                      "        SELECT glea005,",l_group_field,",",l_sum_str," amt,",l_sql_t,
                      "         GROUP BY glea005,",l_group_field,
                      "        HAVING ",l_sum_str,">0 ",
                      "       )",
                      " WHERE 1=1 ",
                      " GROUP BY ",l_group_field
      ELSE
         LET l_sql="SELECT sum(amt), ",l_group_field,
                   "  FROM (",
                   "        SELECT glea005,",l_field,",",l_sum_str," amt,",l_group_field,l_sql_t,
                   "         GROUP BY glea005,",l_field,",",l_group_field,
                   "        HAVING ",l_sum_str,">0 ",
                   "       )",
                   " WHERE 1=1 ",
                   " GROUP BY ",l_group_field
      END IF 
   END IF

   PREPARE get_amount_groupby_ldp FROM l_sql
   DECLARE get_amount_groupby_ldc CURSOR FOR get_amount_groupby_ldp
   
   LET l_sql = " INSERT INTO s_analy_tmp( ",
               " glaq022,amt,glfc009,glfcseq,glfc011,",
               " glfc012,ld ",
               " )",
               " VALUES ( ",
               " ?,?,?,?,?,",
               " ?,? ",
               " )"
   PREPARE ins_analy_tmp FROM l_sql
   
   LET l_amount = 0 
   LET l_glea033 = NULL   
   FOREACH get_amount_groupby_ldc INTO l_amount,l_glea033

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "get_amount_groupby_ldc:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_amount) OR l_amount = 0 THEN 
         CONTINUE FOREACH
      END IF
      
      #1:期初餘額 6:本期發生額 7:期末餘額
      IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' OR p_glfc008 = 'A' THEN
         IF l_glac008 = '2' THEN   #貸余
            LET l_amount = l_amount * -1
         END IF
      END IF
      
      IF cl_null(l_glea033) THEN LET l_glea033 = ' ' END IF
      
      EXECUTE ins_analy_tmp USING lc_param.glaq022,l_amount,
         lc_param.glfc009,lc_param.glfcseq,lc_param.glfc011,lc_param.glfc012,l_glea033      
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins_analy_tmp"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET l_amount = 0 
      LET l_glea033 = NULL
      
   END FOREACH
   
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 數據來源:合併報表個體公司會計科目餘額檔 gldn_t (aglq930) - 重分類為Y
# Memo...........: 
# Usage..........: CALL s_analy_form_get_amt_q930y(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : ls_js       字串(glfc001變量編號/glaq022帳款客商)
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
#                : p_stus      本位幣狀態
# Return code....: r_success   檢核狀態
# Date & Author..: #210112-00013#3 add by 10043
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_q930y(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
DEFINE p_ld            STRING         
DEFINE p_year          LIKE type_t.num5
DEFINE p_bmonth        LIKE type_t.num5
DEFINE p_emonth        LIKE type_t.num5
DEFINE ls_js           STRING
DEFINE p_glfc001       LIKE glfc_t.glfc001
DEFINE p_glfc002       LIKE glfc_t.glfc002
DEFINE p_glfc003       LIKE glfc_t.glfc003
DEFINE p_glfc004       LIKE glfc_t.glfc004
DEFINE p_glfc005       LIKE glfc_t.glfc005
DEFINE p_glfc006       LIKE glfc_t.glfc006
DEFINE p_glfc007       LIKE glfc_t.glfc007
DEFINE p_glfc008       LIKE glfc_t.glfc008
DEFINE p_glfc010       LIKE glfc_t.glfc010
DEFINE p_wc            STRING
DEFINE p_stus          LIKE type_t.chr1
DEFINE r_success       LIKE type_t.num5

#ls_js解析
DEFINE lc_param RECORD
    glfc001 LIKE glfc_t.glfc001,
    glaq022 LIKE glaq_t.glaq022,
    glfcseq LIKE glfc_t.glfcseq,
    glfc009 LIKE glfc_t.glfc009,
    glfc011 LIKE glfc_t.glfc011,
    glfc012 LIKE glfc_t.glfc012,
    glfc017 LIKE glfc_t.glfc017    
    END RECORD 
    
#p_wc解析
DEFINE lc_param2 RECORD
   gldb001 LIKE gldb_t.gldb001, #上層公司
   gldc002 LIKE gldc_t.gldc002, #下層公司
   type    LIKE type_t.chr1,    #金額欄位
   curr    LIKE type_t.chr1,    #記帳/功能/報告
   glfa004 LIKE glfa_t.glfa004, #科目參照表
   glfb003 LIKE glfb_t.glfb003, #報表行序for報錯用
   wc      STRING
   END RECORD   
DEFINE l_amt            LIKE glar_t.glar005
DEFINE l_sql            STRING
DEFINE l_sql2           STRING
DEFINE l_where          STRING
DEFINE l_where2         STRING
DEFINE l_glac008        LIKE glac_t.glac008
DEFINE l_field1         LIKE type_t.chr100
DEFINE l_field2         LIKE type_t.chr100
DEFINE l_field3         LIKE type_t.chr100
DEFINE l_field4         LIKE type_t.chr100
DEFINE l_field5         LIKE type_t.chr100
DEFINE l_glaa004        LIKE glaa_t.glaa004
DEFINE l_level          LIKE type_t.num5  
DEFINE l_gldb001        LIKE gldb_t.gldb001   
DEFINE l_sum_str        STRING    
DEFINE l_sql1           STRING
DEFINE l_field6         LIKE type_t.chr100    #計算傳票金額(貸-借) 
DEFINE l_glab005_992902 LIKE glab_t.glab005   #換算調整科目
DEFINE l_amt_992902     LIKE glar_t.glar005   #換算調整科目金額 
DEFINE l_glab005_992904 LIKE glab_t.glab005   #本期損益(BS)
DEFINE l_flag_992902    LIKE type_t.chr1      #是否為換算調整科目否
DEFINE l_flag_992904    LIKE type_t.chr1      #是否為本期損益(BS)科目 
DEFINE l_gldq001        LIKE gldq_t.gldq001   #會計科目
DEFINE l_group_field    STRING
DEFINE l_groupby        STRING
DEFINE l_gldn041        LIKE gldn_t.gldn041
DEFINE l_instmp         LIKE type_t.chr1

   LET r_success = TRUE
   LET l_flag_992902 = 'N'  #是否為換算調整科目    
   LET l_flag_992904 = 'N'  #是否為本期損益(BS)科目
   
   CALL util.JSON.parse(ls_js,lc_param)
   CALL util.JSON.parse(p_wc,lc_param2)
   
   
   LET l_glaa004 = NULL
   LET l_sql = " SELECT glaa004 ",
               "   FROM glaa_t ",
               "  WHERE glaaent = ",g_enterprise,
               "    AND glaald IN ('",p_ld,"') "
   PREPARE sel_glaa FROM l_sql
   EXECUTE sel_glaa INTO l_glaa004
             
   LET l_sql = "SELECT MAX(level) ",
               "  FROM gldb_t, gldc_t ",
               " WHERE gldbent = ",g_enterprise,
               "   AND gldbent = gldcent ",
               "   AND gldbld = gldcld ",
               "   AND gldb001 = gldc001 ",
               "   AND gldbld IN ('",p_ld,"') ",
               " START WITH gldc002 = '",lc_param2.gldc002,"'", 
               "        AND gldcld IN ('",p_ld,"') ",
               "CONNECT BY NOCYCLE gldc002 = PRIOR gldc001 ",
               "       AND gldcld IN ('",p_ld,"') "

   PREPARE aglq930_get_amt_level_pre FROM l_sql
   EXECUTE aglq930_get_amt_level_pre INTO l_level
    
   LET l_sql = "SELECT gldb001 ",
               "  FROM gldb_t, gldc_t ",
               " WHERE gldbent = ",g_enterprise,
               "   AND gldbent = gldcent ",
               "   AND gldbld = gldcld ",
               "   AND gldb001 = gldc001 ",
               "   AND gldbld IN ('",p_ld,"') ",
               "   AND level = '",l_level,"'",
               " START WITH gldc002 = '",lc_param2.gldc002,"'", 
               "        AND gldcld IN ('",p_ld,"') ",
               "CONNECT BY NOCYCLE gldc002 = PRIOR gldc001 ",
               "       AND gldcld IN ('",p_ld,"') "

   PREPARE aglq930_get_amt_gldb001_pre FROM l_sql
   EXECUTE aglq930_get_amt_gldb001_pre INTO l_gldb001
      
   #取得agli160換算調整科目
   LET l_sql = " SELECT glab005 ",
               "   FROM glab_t ",
               "  WHERE glabent = ",g_enterprise,
               "    AND glabld IN ('",p_ld,"') ",
               "    AND glab001 = '12' ",  #SCC8301
               "    AND glab002 = '9929' ",
               "    AND glab003 = '9929_02' "
   PREPARE sel_glab005_992902 FROM l_sql
   EXECUTE sel_glab005_992902 INTO l_glab005_992902
 
   #取得agli160本期損益(BS)科目
   LET l_sql = " SELECT glab005 ",
               "   FROM glab_t ",
               "  WHERE glabent = ",g_enterprise,
               "    AND glabld IN ('",p_ld,"') ",
               "    AND glab001 = '12' ",  #SCC8301
               "    AND glab002 = '9929' ",
               "    AND glab003 = '9929_04' "
   PREPARE sel_glab005_992904 FROM l_sql
   EXECUTE sel_glab005_992904 INTO l_glab005_992904           
   
   #判斷換算調整科目是否存在此變量裡(agli201)
   IF (l_glab005_992902 >= p_glfc003)  AND (p_glfc004 >= l_glab005_992902) THEN
      LET l_flag_992902 = 'Y'
   ELSE
      LET l_flag_992902 = 'N'
   END IF
    
   #判斷本期損益(BS)科目是否存在此變量裡(agli201)
   IF (l_glab005_992904 >= p_glfc003)  AND (p_glfc004 >= l_glab005_992904) THEN
      LET l_flag_992904 = 'Y'
   ELSE
      LET l_flag_992904 = 'N'
   END IF      
    
   #抓取起始科目的正常餘額形態
   LET l_glac008 = NULL
   SELECT glac008 INTO l_glac008
     FROM glac_t
    WHERE glacent = g_enterprise
      AND glac001 = l_glaa004
      AND glac002 = p_glfc003
      AND glacstus = 'Y'
   
   
   CASE lc_param2.curr 
      WHEN 1 #記帳 
         CASE p_glfc008
            WHEN '1' #期初餘額
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
            WHEN '2' #期初餘額在借方
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
               LET l_sum_str = " SUM(gldn010-gldn011) " 
            WHEN '3' #期初餘額在貸方
               LET l_field1 = " SELECT SUM(gldn011-gldn010) "
               LET l_sum_str = " SUM(gldn011-gldn010) "
            WHEN '4'  #本期借方
               LET l_field1 = " SELECT SUM(gldn010) "   
            WHEN '5'  #本期貸方
               LET l_field1 = " SELECT SUM(gldn011) "    
            WHEN '6'  #本期發生額  
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
            WHEN '7'  #期末餘額
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
            WHEN '8'  #期末餘額在借方    
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "  
               LET l_sum_str = " SUM(gldn010-gldn011) "         
            WHEN '9'  #期末餘額在貸方 
               LET l_field1 = " SELECT SUM(gldn011-gldn010) "
               LET l_sum_str = " SUM(gldn011-gldn010) "         
         END CASE
    
         IF lc_param2.type = '8' THEN 
            LET l_field1 = " SELECT SUM(gldn042-gldn043) "
            LET lc_param2.type = '1'  
         END IF 
    
         CASE 
            WHEN p_glfc008 MATCHES '[167A]'
               LET l_field2 = " SELECT SUM(gldq017) "      #借            
               LET l_field3 = " SELECT SUM(gldq018) "      #貸            
            WHEN p_glfc008 MATCHES '[248]'
               LET l_field2 = " SELECT SUM(gldq017) "      #借
               LET l_field3 = " SELECT 0 "                 #貸
            WHEN p_glfc008 MATCHES '[359]'
               LET l_field2 = " SELECT 0 "                 #借
               LET l_field3 = " SELECT SUM(gldq018) "      #貸
         END CASE
    
         LET l_field6 = " SELECT SUM(gldq018-gldq017) "        #貸-借
      WHEN 2 #功能
         CASE p_glfc008
            WHEN '1' #期初餘額
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
            WHEN '2' #期初餘額在借方
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
               LET l_sum_str = " SUM(gldn027-gldn028) "  
            WHEN '3' #期初餘額在貸方
               LET l_field1 = " SELECT SUM(gldn028-gldn027) "
               LET l_sum_str = " SUM(gldn028-gldn027) " 
            WHEN '4'  #本期借方
               LET l_field1 = " SELECT SUM(gldn027) "   
            WHEN '5'  #本期貸方
               LET l_field1 = " SELECT SUM(gldn028) "    
            WHEN '6'  #本期發生額  
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
            WHEN '7'  #期末餘額
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
            WHEN '8'  #期末餘額在借方    
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
               LET l_sum_str = " SUM(gldn027-gldn028) "               
            WHEN '9'  #期末餘額在貸方 
               LET l_field1 = " SELECT SUM(gldn028-gldn027) "
               LET l_sum_str = " SUM(gldn028-gldn027) " 
         END CASE
         LET l_field2 = " SELECT SUM(gldq019)      "
         LET l_field3 = " SELECT SUM(gldq020)      "
         LET l_field6 = " SELECT SUM(gldq020-gldq019) "        #貸-借    
      WHEN 3 #報告
         LET l_field1 = " SELECT SUM(gldn030-gldn031 )"  
         CASE p_glfc008
            WHEN '1' #期初餘額
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
            WHEN '2' #期初餘額在借方
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
               LET l_sum_str = " SUM(gldn030-gldn031) "   
            WHEN '3' #期初餘額在貸方
               LET l_field1 = " SELECT SUM(gldn031-gldn030) "
               LET l_sum_str = " SUM(gldn031-gldn030) "   
            WHEN '4'  #本期借方
               LET l_field1 = " SELECT SUM(gldn030) "   
            WHEN '5'  #本期貸方
               LET l_field1 = " SELECT SUM(gldn031) "    
            WHEN '6'  #本期發生額  
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
            WHEN '7'  #期末餘額
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
            WHEN '8'  #期末餘額在借方    
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "    
               LET l_sum_str = " SUM(gldn030-gldn031) "        
            WHEN '9'  #期末餘額在貸方 
               LET l_field1 = " SELECT SUM(gldn031-gldn030) "
               LET l_sum_str = " SUM(gldn031-gldn030) "  
         END CASE            
         LET l_field2 = " SELECT SUM(gldq021)      "
         LET l_field3 = " SELECT SUM(gldq022)      "
         LET l_field6 = " SELECT SUM(gldq022-gldq021) " #貸-借 
   END CASE
   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF    
   
   IF lc_param.glfc017 = 'Y' THEN
      LET l_group_field = ",gldn041"
      LET l_groupby = " GROUP BY gldn041 "
   ELSE
      LET l_group_field = ",' '"
      LET l_groupby = ""
   END IF
   LET l_field1 = l_field1 CLIPPED,l_group_field
      
   #計算金額
   LET l_amt = 0
   CASE lc_param2.type
      WHEN '1'  
         LET l_sql1 = "    FROM gldn_t  ",
                      "   WHERE gldnent = ",g_enterprise,"      ",
                      "     AND gldnld IN ('",p_ld,"') ",
                      "     AND gldn001 = '",l_gldb001,"' AND gldn040 = '",lc_param2.gldc002,"'",
                      "     AND gldn005 = '",p_year,"' AND gldn006 = '",p_emonth,"' ", 
                      "     AND gldn007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",  #科目 
                      "     AND gldn007 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise," )" #科目參照表
    
      WHEN '2' #調整借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ", 
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise,"          ",
                      "    AND gldpstus = 'Y' AND gldp005 = '1'                            ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      #aglt533的X:年初調整數也要納入近來
                      "    AND ((gldp003 = ",p_year," AND gldp004 =",p_emonth,")",
                      "         OR (gldp003 = ",p_year," AND gldp004 <=",p_emonth," AND gldp006 = 'X' ))",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表
      WHEN '3' #調整貸方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' AND gldp005 = '1'                   ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      #aglt533的X:年初調整數也要納入近來
                      "    AND ((gldp003 = ",p_year," AND gldp004 =",p_emonth,")",
                      "         OR (gldp003 = ",p_year," AND gldp004 <=",p_emonth," AND gldp006 = 'X' ))",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise," )" #科目參照表    
         IF g_prog MATCHES 'aglq931*' THEN
            LET l_sql1 = l_sql1, "  AND NOT (gldp005 = '1' AND gldp006 = 'W' )"  # 排除aglt508
         END IF
                     
      WHEN '4' #沖銷借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' AND gldp005 = '2'                   ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表
      WHEN '5' #沖銷貸方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' AND gldp005 = '2'                   ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表                       
      WHEN '6' #會計師借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' ",                                                  
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表    
         IF g_prog MATCHES 'aglq931*' THEN
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3') "      # aglt535 
         ELSE
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3','4') "  # aglt535 / aglt540
         END IF
          
      WHEN '7' #會計師借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",  
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' ",                                                   
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'", 
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表
         IF g_prog MATCHES 'aglq931*' THEN
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3') "      # aglt535 
         ELSE
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3','4') "  # aglt535 / aglt540
         END IF
         
   END CASE   
     #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field4 = 'gldn014'
         LET l_field5 = 'gldq003'
      WHEN '2'   #部門
         LET l_field4 = 'gldn015'
         LET l_field5 = 'gldq004'
      WHEN '3'   #利潤/成本中心
         LET l_field4 = 'gldn016'
         LET l_field5 = 'gldq005'
      WHEN '4'   #區域
         LET l_field4 = 'gldn017'
         LET l_field5 = 'gldq006'
      WHEN '5'   #交易客商
         LET l_field4 = 'gldn018'
         LET l_field5 = 'gldq007'
      WHEN '6'   #帳款客商
         LET l_field4 = 'gldn019'
         LET l_field5 = 'gldq008'
      WHEN '7'   #客群
         LET l_field4 = 'gldn020'          
         LET l_field5 = 'gldq009'
      WHEN '8'   #產品類別
         LET l_field4 = 'gldn021'         
         LET l_field5 = 'gldq010'
      WHEN '9'   #經營方式
         LET l_field4 = 'gldn037'        
         LET l_field5 = 'gldq011'
      WHEN '10'   #渠道
         LET l_field4 = 'gldn038'         
         LET l_field5 = 'gldq012'
      WHEN '11'   #品牌
         LET l_field4 = 'gldn039'
         LET l_field5 = 'gldq013'            
      WHEN '12'   #人員
         LET l_field4 = 'gldn022'           
         LET l_field5 = 'gldq014'
      WHEN '13'  #專案編號
         LET l_field4 = 'gldn024'           
         LET l_field5 = 'gldq015'
      WHEN '14'  #WBS
         LET l_field4 = 'gldn025'                  
         LET l_field5 = 'gldq016'
      OTHERWISE
         LET l_field4 = ''
   END CASE

   IF NOT cl_null(lc_param.glaq022) THEN 
      LET l_where = " AND ",l_field4," IN('",lc_param.glaq022,"')"
      LET l_where2 = " AND ",l_field5," IN('",lc_param.glaq022,"')"
   ELSE
      LET l_where = " AND 1=1 "
      LET l_where2 = " AND 1=1 " 
      LET lc_param.glaq022 = ' '
   END IF

   IF lc_param2.type = '1' THEN
      LET l_sql1 = l_sql1," AND gldn007 IN (SELECT glac002 FROM glac_t ",
                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        "                    AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"'  AND glacent = ",g_enterprise,")"
   ELSE
      LET l_sql1 = l_sql1," AND gldq001 IN (SELECT glac002 FROM glac_t ",
                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        "                    AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"'  AND glacent = ",g_enterprise,")"
   
   END IF

   #核算项范围条件
   IF cl_null(lc_param.glaq022) THEN
      CASE lc_param2.type
        WHEN '1'
           IF NOT cl_null(l_field4) THEN       
              IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN
                 LET l_sql1 = l_sql1," AND ",l_field4," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"  
              END IF         
              IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN      
                 LET l_sql1 = l_sql1," AND ",l_field4," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"  
              END IF
              IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                 LET l_sql1 = l_sql1," AND ",l_field4," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
              END IF
           END IF
        OTHERWISE
           IF NOT cl_null(l_field5) THEN       
              IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                 LET l_sql1 = l_sql1," AND ",l_field5," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
              END IF         
              IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
                 LET l_sql1 = l_sql1," AND ",l_field5," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
              END IF
              IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN
                 LET l_sql1 = l_sql1," AND ",l_field5," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
              END IF
           END IF   
      END CASE
   ELSE
      IF NOT cl_null(l_where) THEN    
         CASE lc_param2.type
            WHEN '1'
               LET l_sql1 = l_sql1,l_where
            OTHERWISE
               LET l_sql1 = l_sql1,l_where2
         END CASE
      END IF
   END IF
   
   CASE lc_param2.type
      WHEN '1'
         LET l_sql = l_field1 CLIPPED,l_sql1
         LET l_sql = l_sql,l_groupby
      WHEN '2'   #調整借方
         LET l_sql = l_field2 CLIPPED,l_sql1
      WHEN '3' #調整貸方
         LET l_sql = l_field3 CLIPPED,l_sql1
      WHEN '4' #沖銷借方
         LET l_sql = l_field2 CLIPPED,l_sql1
      WHEN '5' #沖銷貸方
         LET l_sql = l_field3 CLIPPED,l_sql1
      WHEN '6' #會計師借方
         LET l_sql = l_field2 CLIPPED,l_sql1
      WHEN '7' #會計師借方
         LET l_sql = l_field3 CLIPPED,l_sql1             
   END CASE
   
   
   
   IF lc_param2.type = '1' THEN
      IF p_glfc008 MATCHES '[2389]' THEN
         IF cl_null(l_field4) THEN
            LET l_sql="SELECT sum(amt) ",l_group_field,
                      "  FROM (",
                      "         SELECT gldn007,",l_sum_str," amt ",l_group_field,l_sql1,
                      "          GROUP BY gldn007 ",l_group_field,
                      "         HAVING ",l_sum_str,">0 ",
                      "       ) t51 ",l_groupby         
         ELSE
            LET l_sql="SELECT sum(amt) ",l_group_field,
                      "  FROM (",
                      "        SELECT gldn007,",l_field4,",",l_sum_str," amt ",l_group_field,l_sql1,
                      "         GROUP BY gldn007,",l_field4,l_group_field,
                      "         HAVING ",l_sum_str,">0 ",
                      "       ) t51 ",l_groupby
                      
         END IF
      END IF
   END IF
   PREPARE aglq930_prep01 FROM l_sql  
   DECLARE aglq930_cs CURSOR FOR aglq930_prep01

   LET l_sql = " INSERT INTO s_analy_tmp( ",
               " glaq022,amt,glfc009,glfcseq,glfc011,",
               " glfc012,ld ",
               " )",
               " VALUES ( ",
               " ?,?,?,?,?,",
               " ?,? ",
               " )"
   PREPARE q930_ins_analy_tmp FROM l_sql   

   #取aglt503/aglt504換算調整科目金額   
   IF l_flag_992902 = 'Y' THEN
      LET l_gldq001 = l_glab005_992902
   END IF
   IF l_flag_992904 = 'Y' THEN
      LET l_gldq001 = l_glab005_992904
   END IF   
   
   LET l_sql = "   FROM gldq_t,gldp_t",  
               "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise,
               "    AND gldpstus = 'Y' AND gldp005 = '1'",    #來源碼：1：調整
               "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",                     
               "    AND gldq001 = '",l_gldq001,"'",           #科目：agli160換算調整科目
               "    AND gldp003 = ",p_year," AND gldp004 = ",p_emonth,   #年度/期別
               "    AND gldp006 IN ('8','9')"  #資產/損益類科目折算價差
   CASE lc_param2.type      
      WHEN '1'      #各公司餘額
         LET l_sql = l_field6,l_sql,
                     " AND gldq003 = (SELECT glda003 FROM glda_t WHERE gldaent = gldpent AND glda001 = '",lc_param2.gldc002,"')"
      WHEN '2'      #調整借方
         LET l_sql = l_field2,l_sql
      WHEN '3'      #調整貸方
         LET l_sql = l_field3,l_sql
   END CASE
   PREPARE aglq930_sum_992902 FROM l_sql

   LET l_amt = 0 
   LET l_gldn041 = NULL
   LET l_instmp = 'N'
   FOREACH aglq930_cs INTO l_amt,l_gldn041
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "aglq930_cs:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF cl_null(l_amt) THEN LET  l_amt = 0 END IF  
     
      IF lc_param2.type = '1' THEN
         IF p_glfc008 MATCHES '[167]' THEN #1:期初餘額 6:本期發生額 7:期末餘額
            IF l_glac008 = '2' THEN   #貸余
               LET l_amt = l_amt * -1
            END IF
         END IF    
      END IF         

      IF l_flag_992902 = 'Y' OR l_flag_992904 = 'Y' THEN
         IF lc_param2.type MATCHES '[123]' THEN
            LET l_amt_992902 = 0
            EXECUTE aglq930_sum_992902 INTO l_amt_992902
            IF cl_null(l_amt_992902) THEN LET l_amt_992902 = 0 END IF
            CASE lc_param2.type
               WHEN '1'
                  LET l_amt = l_amt + l_amt_992902
               WHEN '2'
                  LET l_amt = l_amt - l_amt_992902
               WHEN '3'            
                  LET l_amt = l_amt - l_amt_992902               
            END CASE
         END IF
      END IF

      IF l_amt = 0 THEN CONTINUE FOREACH END IF      
      
      IF cl_null(l_gldn041) THEN LET l_gldn041 = ' ' END IF
      
      EXECUTE q930_ins_analy_tmp USING lc_param.glaq022,l_amt,
         lc_param.glfc009,lc_param.glfcseq,lc_param.glfc011,lc_param.glfc012,l_gldn041   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "q930_ins_analy_tmp"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET l_amt = 0 
      LET l_gldn041 = NULL   
      LET l_instmp = 'Y'      

   END FOREACH
      
   IF l_instmp = 'N' AND (l_flag_992902 = 'Y' OR l_flag_992904 = 'Y') THEN
      IF lc_param2.type MATCHES '[123]' THEN
         LET l_amt_992902 = 0
         EXECUTE aglq930_sum_992902 INTO l_amt_992902
         IF cl_null(l_amt_992902) THEN LET l_amt_992902 = 0 END IF
         IF l_amt_992902 <> 0 THEN             
            LET l_amt = 0
            CASE lc_param2.type
               WHEN '1'
                  LET l_amt = l_amt + l_amt_992902
               WHEN '2'
                  LET l_amt = l_amt - l_amt_992902
               WHEN '3'            
                  LET l_amt = l_amt - l_amt_992902               
            END CASE

            LET l_gldn041 = ' '           
            EXECUTE q930_ins_analy_tmp USING lc_param.glaq022,l_amt,
               lc_param.glfc009,lc_param.glfcseq,lc_param.glfc011,lc_param.glfc012,l_gldn041   
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "q930_ins_analy_tmp2"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END IF
      END IF
   END IF     
   
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 數據來源:合併報表個體公司會計科目餘額檔 gldn_t (aglq930) - 重分類為N
# Memo...........: 複製aglq930_get_amt
# Usage..........: CALL s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : ls_js       字串(glfc001變量編號/glaq022帳款客商)
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
#                : p_stus      本位幣狀態
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: #210112-00013#3 add by 10043
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_q930n(p_ld,p_year,p_bmonth,p_emonth,ls_js,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
DEFINE p_ld            STRING         
DEFINE p_year          LIKE type_t.num5
DEFINE p_bmonth        LIKE type_t.num5
DEFINE p_emonth        LIKE type_t.num5
DEFINE ls_js           STRING
DEFINE p_glfc001       LIKE glfc_t.glfc001
DEFINE p_glfc002       LIKE glfc_t.glfc002
DEFINE p_glfc003       LIKE glfc_t.glfc003
DEFINE p_glfc004       LIKE glfc_t.glfc004
DEFINE p_glfc005       LIKE glfc_t.glfc005
DEFINE p_glfc006       LIKE glfc_t.glfc006
DEFINE p_glfc007       LIKE glfc_t.glfc007
DEFINE p_glfc008       LIKE glfc_t.glfc008
DEFINE p_glfc010       LIKE glfc_t.glfc010
DEFINE p_wc            STRING
DEFINE p_stus          LIKE type_t.chr1
DEFINE r_success       LIKE type_t.num5
DEFINE r_amount        LIKE glar_t.glar005

#ls_js解析
DEFINE lc_param RECORD
    glfc001 LIKE glfc_t.glfc001,
    glaq022 LIKE glaq_t.glaq022,
    ld      LIKE gldn_t.gldn041,  #210301-00038@1 add
    glfcseq LIKE glfc_t.glfcseq,
    glfc009 LIKE glfc_t.glfc009,
    glfc011 LIKE glfc_t.glfc011,
    glfc012 LIKE glfc_t.glfc012,
    glfc017 LIKE glfc_t.glfc017    
    END RECORD 
    
#p_wc解析
DEFINE lc_param2 RECORD
   gldb001 LIKE gldb_t.gldb001, #上層公司
   gldc002 LIKE gldc_t.gldc002, #下層公司
   type    LIKE type_t.chr1,    #金額欄位
   curr    LIKE type_t.chr1,    #記帳/功能/報告
   glfa004 LIKE glfa_t.glfa004, #科目參照表
   glfb003 LIKE glfb_t.glfb003, #報表行序for報錯用
   wc      STRING
   END RECORD   
DEFINE l_amt            LIKE glar_t.glar005
DEFINE l_sql            STRING
DEFINE l_sql2           STRING
DEFINE l_where          STRING
DEFINE l_where2         STRING
DEFINE l_glac008        LIKE glac_t.glac008
DEFINE l_field1         LIKE type_t.chr100
DEFINE l_field2         LIKE type_t.chr100
DEFINE l_field3         LIKE type_t.chr100
DEFINE l_field4         LIKE type_t.chr100
DEFINE l_field5         LIKE type_t.chr100
DEFINE l_glaa004        LIKE glaa_t.glaa004
DEFINE l_level          LIKE type_t.num5  
DEFINE l_gldb001        LIKE gldb_t.gldb001   
DEFINE l_sum_str        STRING    
DEFINE l_sql1           STRING
DEFINE l_field6         LIKE type_t.chr100    #計算傳票金額(貸-借) 
DEFINE l_glab005_992902 LIKE glab_t.glab005   #換算調整科目
DEFINE l_amt_992902     LIKE glar_t.glar005   #換算調整科目金額 
DEFINE l_glab005_992904 LIKE glab_t.glab005   #本期損益(BS)
DEFINE l_flag_992902    LIKE type_t.chr1      #是否為換算調整科目否
DEFINE l_flag_992904    LIKE type_t.chr1      #是否為本期損益(BS)科目 
DEFINE l_gldq001        LIKE gldq_t.gldq001   #會計科目

   LET r_success = TRUE
   LET r_amount = 0
   LET l_flag_992902 = 'N'  #是否為換算調整科目    
   LET l_flag_992904 = 'N'  #是否為本期損益(BS)科目
   
   CALL util.JSON.parse(ls_js,lc_param)
   CALL util.JSON.parse(p_wc,lc_param2)
   
   
   LET l_glaa004 = NULL
   LET l_sql = " SELECT glaa004 ",
               "   FROM glaa_t ",
               "  WHERE glaaent = ",g_enterprise,
               "    AND glaald IN ('",p_ld,"') "
   PREPARE sel_glaa_n FROM l_sql
   EXECUTE sel_glaa_n INTO l_glaa004
             
   LET l_sql = "SELECT MAX(level) ",
               "  FROM gldb_t, gldc_t ",
               " WHERE gldbent = ",g_enterprise,
               "   AND gldbent = gldcent ",
               "   AND gldbld = gldcld ",
               "   AND gldb001 = gldc001 ",
               "   AND gldbld IN ('",p_ld,"') ",
               " START WITH gldc002 = '",lc_param2.gldc002,"'", 
               "        AND gldcld IN ('",p_ld,"') ",
               "CONNECT BY NOCYCLE gldc002 = PRIOR gldc001 ",
               "       AND gldcld IN ('",p_ld,"') "

   PREPARE aglq930n_get_amt_level_pre FROM l_sql
   EXECUTE aglq930n_get_amt_level_pre INTO l_level
    
   LET l_sql = "SELECT gldb001 ",
               "  FROM gldb_t, gldc_t ",
               " WHERE gldbent = ",g_enterprise,
               "   AND gldbent = gldcent ",
               "   AND gldbld = gldcld ",
               "   AND gldb001 = gldc001 ",
               "   AND gldbld IN ('",p_ld,"') ",
               "   AND level = '",l_level,"'",
               " START WITH gldc002 = '",lc_param2.gldc002,"'", 
               "        AND gldcld IN ('",p_ld,"') ",
               "CONNECT BY NOCYCLE gldc002 = PRIOR gldc001 ",
               "       AND gldcld IN ('",p_ld,"') "

   PREPARE aglq930n_get_amt_gldb001_pre FROM l_sql
   EXECUTE aglq930n_get_amt_gldb001_pre INTO l_gldb001
      
   #取得agli160換算調整科目
   LET l_sql = " SELECT glab005 ",
               "   FROM glab_t ",
               "  WHERE glabent = ",g_enterprise,
               "    AND glabld IN ('",p_ld,"') ",
               "    AND glab001 = '12' ",  #SCC8301
               "    AND glab002 = '9929' ",
               "    AND glab003 = '9929_02' "
   PREPARE sel_glab005_992902n FROM l_sql
   EXECUTE sel_glab005_992902n INTO l_glab005_992902
 
   #取得agli160本期損益(BS)科目
   LET l_sql = " SELECT glab005 ",
               "   FROM glab_t ",
               "  WHERE glabent = ",g_enterprise,
               "    AND glabld IN ('",p_ld,"') ",
               "    AND glab001 = '12' ",  #SCC8301
               "    AND glab002 = '9929' ",
               "    AND glab003 = '9929_04' "
   PREPARE sel_glab005_992904n FROM l_sql
   EXECUTE sel_glab005_992904n INTO l_glab005_992904           
   
   #判斷換算調整科目是否存在此變量裡(agli201)
   IF (l_glab005_992902 >= p_glfc003)  AND (p_glfc004 >= l_glab005_992902) THEN
      LET l_flag_992902 = 'Y'
   ELSE
      LET l_flag_992902 = 'N'
   END IF
    
   #判斷本期損益(BS)科目是否存在此變量裡(agli201)
   IF (l_glab005_992904 >= p_glfc003)  AND (p_glfc004 >= l_glab005_992904) THEN
      LET l_flag_992904 = 'Y'
   ELSE
      LET l_flag_992904 = 'N'
   END IF      
   
   #抓取起始科目的正常餘額形態
   LET l_glac008 = NULL
   SELECT glac008 INTO l_glac008
     FROM glac_t
    WHERE glacent = g_enterprise
      AND glac001 = l_glaa004
      AND glac002 = p_glfc003
      AND glacstus = 'Y'
   
   CASE lc_param2.curr 
      WHEN 1 #記帳 
         CASE p_glfc008
            WHEN '1' #期初餘額
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
            WHEN '2' #期初餘額在借方
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
               LET l_sum_str = " SUM(gldn010-gldn011) " 
            WHEN '3' #期初餘額在貸方
               LET l_field1 = " SELECT SUM(gldn011-gldn010) "
               LET l_sum_str = " SUM(gldn011-gldn010) "
            WHEN '4'  #本期借方
               LET l_field1 = " SELECT SUM(gldn010) "   
            WHEN '5'  #本期貸方
               LET l_field1 = " SELECT SUM(gldn011) "    
            WHEN '6'  #本期發生額  
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
            WHEN '7'  #期末餘額
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "
            WHEN '8'  #期末餘額在借方    
               LET l_field1 = " SELECT SUM(gldn010-gldn011) "  
               LET l_sum_str = " SUM(gldn010-gldn011) "         
            WHEN '9'  #期末餘額在貸方 
               LET l_field1 = " SELECT SUM(gldn011-gldn010) "
               LET l_sum_str = " SUM(gldn011-gldn010) "         
         END CASE
    
         IF lc_param2.type = '8' THEN 
            LET l_field1 = " SELECT SUM(gldn042-gldn043) "
            LET lc_param2.type = '1'  
         END IF 
    
         CASE 
            WHEN p_glfc008 MATCHES '[167A]'
               LET l_field2 = " SELECT SUM(gldq017) "      #借            
               LET l_field3 = " SELECT SUM(gldq018) "      #貸            
            WHEN p_glfc008 MATCHES '[248]'
               LET l_field2 = " SELECT SUM(gldq017) "      #借
               LET l_field3 = " SELECT 0 "                 #貸
            WHEN p_glfc008 MATCHES '[359]'
               LET l_field2 = " SELECT 0 "                 #借
               LET l_field3 = " SELECT SUM(gldq018) "      #貸
         END CASE
    
         LET l_field6 = " SELECT SUM(gldq018-gldq017) "        #貸-借
      WHEN 2 #功能
         CASE p_glfc008
            WHEN '1' #期初餘額
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
            WHEN '2' #期初餘額在借方
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
               LET l_sum_str = " SUM(gldn027-gldn028) "  
            WHEN '3' #期初餘額在貸方
               LET l_field1 = " SELECT SUM(gldn028-gldn027) "
               LET l_sum_str = " SUM(gldn028-gldn027) " 
            WHEN '4'  #本期借方
               LET l_field1 = " SELECT SUM(gldn027) "   
            WHEN '5'  #本期貸方
               LET l_field1 = " SELECT SUM(gldn028) "    
            WHEN '6'  #本期發生額  
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
            WHEN '7'  #期末餘額
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
            WHEN '8'  #期末餘額在借方    
               LET l_field1 = " SELECT SUM(gldn027-gldn028) "
               LET l_sum_str = " SUM(gldn027-gldn028) "               
            WHEN '9'  #期末餘額在貸方 
               LET l_field1 = " SELECT SUM(gldn028-gldn027) "
               LET l_sum_str = " SUM(gldn028-gldn027) " 
         END CASE
         LET l_field2 = " SELECT SUM(gldq019)      "
         LET l_field3 = " SELECT SUM(gldq020)      "
         LET l_field6 = " SELECT SUM(gldq020-gldq019) "        #貸-借    
      WHEN 3 #報告
         LET l_field1 = " SELECT SUM(gldn030-gldn031 )"  
         CASE p_glfc008
            WHEN '1' #期初餘額
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
            WHEN '2' #期初餘額在借方
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
               LET l_sum_str = " SUM(gldn030-gldn031) "   
            WHEN '3' #期初餘額在貸方
               LET l_field1 = " SELECT SUM(gldn031-gldn030) "
               LET l_sum_str = " SUM(gldn031-gldn030) "   
            WHEN '4'  #本期借方
               LET l_field1 = " SELECT SUM(gldn030) "   
            WHEN '5'  #本期貸方
               LET l_field1 = " SELECT SUM(gldn031) "    
            WHEN '6'  #本期發生額  
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
            WHEN '7'  #期末餘額
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "
            WHEN '8'  #期末餘額在借方    
               LET l_field1 = " SELECT SUM(gldn030-gldn031) "    
               LET l_sum_str = " SUM(gldn030-gldn031) "        
            WHEN '9'  #期末餘額在貸方 
               LET l_field1 = " SELECT SUM(gldn031-gldn030) "
               LET l_sum_str = " SUM(gldn031-gldn030) "  
         END CASE            
         LET l_field2 = " SELECT SUM(gldq021)      "
         LET l_field3 = " SELECT SUM(gldq022)      "
         LET l_field6 = " SELECT SUM(gldq022-gldq021) " #貸-借 
   END CASE
   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF   
      
   #計算金額
   LET l_amt = 0
   CASE lc_param2.type
      WHEN '1'  
         LET l_sql1 = "    FROM gldn_t  ",
                      "   WHERE gldnent = ",g_enterprise,"      ",
                      "     AND gldnld IN ('",p_ld,"') ",
                      "     AND gldn001 = '",l_gldb001,"' AND gldn040 = '",lc_param2.gldc002,"'",
                      "     AND gldn005 = '",p_year,"' AND gldn006 = '",p_emonth,"' ", 
                      "     AND gldn007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",  #科目 
                      "     AND gldn007 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise," )" #科目參照表
         #210301-00038@1 add(s)
         IF NOT cl_null(lc_param.ld) AND lc_param.ld <> ' ' THEN
            LET l_sql1 = l_sql1," AND gldn041 = '",lc_param.ld,"' "
         END IF
         #210301-00038@1 add(e)
         
      WHEN '2' #調整借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ", 
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise,"          ",
                      "    AND gldpstus = 'Y' AND gldp005 = '1'                            ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      #aglt533的X:年初調整數也要納入近來
                      "    AND ((gldp003 = ",p_year," AND gldp004 =",p_emonth,")",
                      "         OR (gldp003 = ",p_year," AND gldp004 <=",p_emonth," AND gldp006 = 'X' ))",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表
      WHEN '3' #調整貸方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' AND gldp005 = '1'                   ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      #aglt533的X:年初調整數也要納入近來
                      "    AND ((gldp003 = ",p_year," AND gldp004 =",p_emonth,")",
                      "         OR (gldp003 = ",p_year," AND gldp004 <=",p_emonth," AND gldp006 = 'X' ))",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise," )" #科目參照表    
         IF g_prog MATCHES 'aglq931*' THEN
            LET l_sql1 = l_sql1, "  AND NOT (gldp005 = '1' AND gldp006 = 'W' )"  # 排除aglt508
         END IF
                     
      WHEN '4' #沖銷借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' AND gldp005 = '2'                   ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表
      WHEN '5' #沖銷貸方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' AND gldp005 = '2'                   ",
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表                       
      WHEN '6' #會計師借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' ",                                                  
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'",
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表    
         IF g_prog MATCHES 'aglq931*' THEN
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3') "      # aglt535 
         ELSE
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3','4') "  # aglt535 / aglt540
         END IF
          
      WHEN '7' #會計師借方
         LET l_sql1 = "   FROM gldq_t,gldp_t                    ",  
                      "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise," ",
                      "    AND gldpstus = 'Y' ",                                                   
                      "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",
                      "    AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "    AND gldp003 = '",p_year,"' AND gldp004 = '",p_emonth,"'", 
                      "    AND gldq001 IN (SELECT glac002 FROM glac_t ",
                      "                      WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                      "                        AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"' AND glacent = ",g_enterprise,")" #科目參照表
         IF g_prog MATCHES 'aglq931*' THEN
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3') "      # aglt535 
         ELSE
            LET l_sql1 = l_sql1, "   AND gldp005 IN ('3','4') "  # aglt535 / aglt540
         END IF
         
   END CASE   
     #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field4 = 'gldn014'
         LET l_field5 = 'gldq003'
      WHEN '2'   #部門
         LET l_field4 = 'gldn015'
         LET l_field5 = 'gldq004'
      WHEN '3'   #利潤/成本中心
         LET l_field4 = 'gldn016'
         LET l_field5 = 'gldq005'
      WHEN '4'   #區域
         LET l_field4 = 'gldn017'
         LET l_field5 = 'gldq006'
      WHEN '5'   #交易客商
         LET l_field4 = 'gldn018'
         LET l_field5 = 'gldq007'
      WHEN '6'   #帳款客商
         LET l_field4 = 'gldn019'
         LET l_field5 = 'gldq008'
      WHEN '7'   #客群
         LET l_field4 = 'gldn020'          
         LET l_field5 = 'gldq009'
      WHEN '8'   #產品類別
         LET l_field4 = 'gldn021'         
         LET l_field5 = 'gldq010'
      WHEN '9'   #經營方式
         LET l_field4 = 'gldn037'        
         LET l_field5 = 'gldq011'
      WHEN '10'   #渠道
         LET l_field4 = 'gldn038'         
         LET l_field5 = 'gldq012'
      WHEN '11'   #品牌
         LET l_field4 = 'gldn039'
         LET l_field5 = 'gldq013'            
      WHEN '12'   #人員
         LET l_field4 = 'gldn022'           
         LET l_field5 = 'gldq014'
      WHEN '13'  #專案編號
         LET l_field4 = 'gldn024'           
         LET l_field5 = 'gldq015'
      WHEN '14'  #WBS
         LET l_field4 = 'gldn025'                  
         LET l_field5 = 'gldq016'
      OTHERWISE
         LET l_field4 = ''
   END CASE

   IF NOT cl_null(lc_param.glaq022) THEN 
      LET l_where = " AND ",l_field4," IN('",lc_param.glaq022,"')"
      LET l_where2 = " AND ",l_field5," IN('",lc_param.glaq022,"')"
   ELSE
      LET l_where = " AND 1=1 "
      LET l_where2 = " AND 1=1 "
      LET lc_param.glaq022 = ' '
   END IF

   #210301-00038@1 add(s)
   #因gldq_t無需帳套group,因此相同核算項不同帳套者,只需計算一次
   IF lc_param2.type MATCHES '[234567]' THEN
      IF g_glaq022_t = lc_param.glaq022 AND g_ld_t <> lc_param.ld THEN
         LET r_amount = 0
         RETURN r_success,r_amount
      END IF
      LET g_glaq022_t = lc_param.glaq022
      LET g_ld_t = lc_param.ld
   END IF
   #210301-00038@1 add(e)

   IF lc_param2.type = '1' THEN
      LET l_sql1 = l_sql1," AND gldn007 IN (SELECT glac002 FROM glac_t ",
                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        "                    AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"'  AND glacent = ",g_enterprise,")"
   ELSE
      LET l_sql1 = l_sql1," AND gldq001 IN (SELECT glac002 FROM glac_t ",
                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                        "                    AND glac003 <> '1'  AND glac001 = '",lc_param2.glfa004,"'  AND glacent = ",g_enterprise,")"
   
   END IF

   #核算项范围条件
   IF cl_null(lc_param.glaq022) THEN
      CASE lc_param2.type
        WHEN '1'
           IF NOT cl_null(l_field4) THEN       
              IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN
                 LET l_sql1 = l_sql1," AND ",l_field4," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"  
              END IF         
              IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN      
                 LET l_sql1 = l_sql1," AND ",l_field4," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"  
              END IF
              IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                 LET l_sql1 = l_sql1," AND ",l_field4," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
              END IF
           END IF
        OTHERWISE
           IF NOT cl_null(l_field5) THEN       
              IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
                 LET l_sql1 = l_sql1," AND ",l_field5," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
              END IF         
              IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
                 LET l_sql1 = l_sql1," AND ",l_field5," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
              END IF
              IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN
                 LET l_sql1 = l_sql1," AND ",l_field5," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
              END IF
           END IF   
      END CASE
   ELSE
      IF NOT cl_null(l_where) THEN    
         CASE lc_param2.type
            WHEN '1'
               LET l_sql1 = l_sql1,l_where
            OTHERWISE
               LET l_sql1 = l_sql1,l_where2
         END CASE
      END IF  
   END IF
   
   CASE lc_param2.type
      WHEN '1'
         LET l_sql = l_field1 CLIPPED,l_sql1
      WHEN '2'   #調整借方
         LET l_sql = l_field2 CLIPPED,l_sql1
      WHEN '3' #調整貸方
         LET l_sql = l_field3 CLIPPED,l_sql1
      WHEN '4' #沖銷借方
         LET l_sql = l_field2 CLIPPED,l_sql1
      WHEN '5' #沖銷貸方
         LET l_sql = l_field3 CLIPPED,l_sql1
      WHEN '6' #會計師借方
         LET l_sql = l_field2 CLIPPED,l_sql1
      WHEN '7' #會計師借方
         LET l_sql = l_field3 CLIPPED,l_sql1             
   END CASE
         
   IF lc_param2.type = '1' THEN
      IF p_glfc008 MATCHES '[2389]' THEN
         IF cl_null(l_field4) THEN
            LET l_sql="SELECT sum(amt) ",
                      "  FROM (",
                      "         SELECT gldn007,",l_sum_str," amt ",l_sql1,
                      "          GROUP BY gldn007 ",
                      "         HAVING ",l_sum_str,">0 ",
                      "       ) t51 "       
         ELSE
            LET l_sql="SELECT sum(amt) ",
                      "  FROM (",
                      "        SELECT gldn007,",l_field4,",",l_sum_str," amt ",l_sql1,
                      "         GROUP BY gldn007,",l_field4,
                      "         HAVING ",l_sum_str,">0 ",
                      "       ) t51 "
                      
         END IF
      END IF
   END IF
   PREPARE aglq930n_prep01 FROM l_sql  
   EXECUTE aglq930n_prep01 INTO l_amt
   IF cl_null(l_amt) THEN LET l_amt = 0 END IF    

   IF lc_param2.type = '1' THEN
      IF p_glfc008 MATCHES '[167]' THEN #1:期初餘額 6:本期發生額 7:期末餘額
         IF l_glac008 = '2' THEN   #貸余
            LET l_amt = l_amt * -1
         END IF
      END IF    
   END IF 

   IF l_flag_992902 = 'Y' OR l_flag_992904 = 'Y' THEN   
      #取aglt503/aglt504換算調整科目金額   
      IF l_flag_992902 = 'Y' THEN
         LET l_gldq001 = l_glab005_992902
      END IF
      IF l_flag_992904 = 'Y' THEN
         LET l_gldq001 = l_glab005_992904
      END IF      
      IF lc_param2.type MATCHES '[123]' THEN
         LET l_sql = "   FROM gldq_t,gldp_t",  
                     "  WHERE gldpent = gldqent AND gldpent = ",g_enterprise,
                     "    AND gldpstus = 'Y' AND gldp005 = '1'",    #來源碼：1：調整
                     "    AND gldpdocno = gldqdocno  AND gldpld IN ('",p_ld,"') ",                     
                     "    AND gldq001 = '",l_gldq001,"'",           #科目：agli160換算調整科目
                     "    AND gldp003 = ",p_year," AND gldp004 = ",p_emonth,   #年度/期別
                     "    AND gldp006 IN ('8','9')"  #資產/損益類科目折算價差
         CASE lc_param2.type      
            WHEN '1'      #各公司餘額
               LET l_sql = l_field6,l_sql,
                           " AND gldq003 = (SELECT glda003 FROM glda_t WHERE gldaent = gldpent AND glda001 = '",lc_param2.gldc002,"')"
            WHEN '2'      #調整借方
               LET l_sql = l_field2,l_sql
            WHEN '3'      #調整貸方
               LET l_sql = l_field3,l_sql
         END CASE
         LET l_amt_992902 = 0
         PREPARE aglq930n_sum_992902 FROM l_sql            
         EXECUTE aglq930n_sum_992902 INTO l_amt_992902
         IF cl_null(l_amt_992902) THEN LET l_amt_992902 = 0 END IF
         CASE lc_param2.type
            WHEN '1'
               LET l_amt = l_amt + l_amt_992902
            WHEN '2'
               LET l_amt = l_amt - l_amt_992902
            WHEN '3'            
               LET l_amt = l_amt - l_amt_992902               
         END CASE
      END IF
   END IF

   LET r_amount = l_amt
   
   RETURN r_success,r_amount
   
END FUNCTION

 
{</section>}
 
