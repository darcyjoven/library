#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axrt930_01.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0034(2014-11-04 16:05:52), PR版次:0034(2020-08-04 15:18:26)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000333
#+ Filename...: axrt930_01
#+ Description: 批次產生
#+ Creator....: 01531(2014-11-04 11:35:55)
#+ Modifier...: 01531 -SD/PR- 01531
 
{</section>}
 
{<section id="axrt930_01.global" type="s" >}
#應用 c01b 樣板自動產生(Version:14)
#add-point:填寫註解說明 name="global.memo"
#151125-00006#1  2015/12/03 By 06862    新增/修改/複製單據后立即審核，立即拋轉傳票
#160318-00005#54 2016/03/29 By 07959    將重複內容的錯誤訊息置換為公用錯誤訊息
#160125-00005#9  2016/08/02 By 01727    查詢時加上帳套人員權限條件過濾
#160811-00009#3  2016/08/15 By 01531    账务中心/法人/账套权限控管
#160920-00007#1  2016/09/22 By 01727    暂估税额科目改取axri011中的暂估税额科目
#161026-00013#1  2016/10/26 By 06821    組織類型與職能開窗調整
#161128-00061#5  2016/12/05 by 02481    标准程式定义采用宣告模式,弃用.*写法
#161104-00046#10 170103     By albireo  增加單別控制組
#170301-00027#4  2017/03/02 by 08172    单别参照表调整
#161102-00015#5  2017/03/17 By 06821    1.未啟用的核算項要放一個空白存檔 2.若交易幣別=帳套幣別時, 本幣不可維護
#170330-00016#1  2017/03/31 By 07900    1.axrt930通过整单操作---批次生成，成功产生数据后，单头无资料，需要重新查询后，才会显示出来。
#                                       2.分录底稿未自动产生，必须手工产生分录底稿才有。
#170417-00063#2  2017/04/20 By 09257    單據作業增加關帳日期控卡整批調整
#170315-00043#6  2017/05/02 By 09263    單據作業增加關帳日期控卡整批調整,針對檢核應移至新舊值外先做判斷
#170929-00010#1  2017/10/27 By 01531    修改axrt930，axrt931出貨/雜項暫估金額邏輯
#171110-00035#1  2017/11/10 By 01531    批次產生時,抓取 xrea_t 並未依照指定營運中心過濾 xreasite
#171101-00041#1  2017/11/14 By 01531    批次產生後 並不會自動產生分錄 
#171116-00015#1  2017/11/17 By 01531    延續 171116-00010 處理 axrt930,axrt931 部分
#                                       批次產生時, 抓取 axrt300/axrt330 沖帳資料應以執行當月底以前的沖帳資料為主
#171121-00057#1  2017/11/22 By 01531    axrt931 当月做冲回暂估重立时，应抓取<当月的暂估资料
#                                       axrt930/axrt931 單身稅種抓取axrt320單身的稅種
#                                       批次產生檢核時需加上xremsite限定條件
#                                       要以 axrt320 立帳日到 l_docdt 這區間的沖暫估
#171125-00004#1  2017/11/30 By 08729    axmt541,axrt320中税率都是17%，但是到axrt930中，税额却是按10%计算的
#171006-00010#50 2017/12/28 By 10462    調整報錯做法，先結束交易再做報錯
#170606-00033#14 2018/01/22 By 09505    財務系統相關 帳務人員,業務人員 開窗規格調整
#180803-00069#1  2018/08/03 by 06189    汇总报错问题修改，成功产生单据再去产生对应的凭证
#181227-00068#1  2019/01/04 By 05795    在处理尾差的地方，计算已冲的金额需要转换成原立數- 月結未沖數 = 實际己沖銷數
#190213-00004#1  2019/02/13 By 05795    选择12月会报会计周期不存在的错
#191204-00032#2  2019/12/11 by 08172    因暂估单身允许多税别，故抓取月结资料时排除税别税率，改用账款单身税别
#190611-00014#1  2020/04/10 By 01531    单身未产生单据，提示报错后，单头应也不产生
#190318-00028#4  2020/04/28 By 10500    在直接审核(D-FIN-0031='Y')前加上对权限的判断
#191113-00009#1  2020/05/12 By 09406    单身产生金额的时候，由原来的单头的是否含税依据单身的税种来判断是否含税

#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:11) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:11) --- end ---
 
IMPORT os
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc" name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_xrem_m        RECORD
       xremsite LIKE xrem_t.xremsite, 
   xremsite_desc LIKE type_t.chr80, 
   xremld LIKE xrem_t.xremld, 
   xremld_desc LIKE type_t.chr80, 
   xrem004 LIKE xrem_t.xrem004, 
   xrem004_desc LIKE type_t.chr80, 
   xremdocno LIKE xrem_t.xremdocno, 
   xrem001 LIKE xrem_t.xrem001, 
   xrem002 LIKE xrem_t.xrem002, 
   xremdocdt LIKE xrem_t.xremdocdt
       END RECORD
	   
#add-point:自定義模組變數(Module Variable)(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_sql STRING
DEFINE g_argv1  LIKE type_t.chr1
#151125-00006#1--add--s
DEFINE l_ooba002         LIKE ooba_t.ooba002   
DEFINE l_xremcomp        LIKE xrem_t.xremcomp
DEFINE l_dfin0031        LIKE type_t.chr1
DEFINE l_dfin0032        LIKE type_t.chr1
#151125-00006#1--add--e
DEFINE g_user_slip_wc    STRING      #161104-00046#10
DEFINE l_success         LIKE type_t.num5   #170417-00063#2 by 09257 --add
DEFINE g_sfin2007        LIKE xrem_t.xremdocdt    #170315-00043#6 add
DEFINE g_sfin2012        LIKE type_t.chr1         #170915-00038#1 add
#end add-point
 
DEFINE g_xrem_m        type_g_xrem_m
 
   DEFINE g_xremdocno_t LIKE xrem_t.xremdocno
 
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_autocomplete_param  DYNAMIC ARRAY OF LIKE type_t.chr1000   #autocomplete功能的傳入參數   #190121-00003
DEFINE g_other_wc            LIKE type_t.chr2000           #其他條件   #190121-00003
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axrt930_01.input" type="s" >}
#+ 資料輸入
PUBLIC FUNCTION axrt930_01(--)
   #add-point:input段變數傳入 name="input.get_var"
   p_argv1
   #end add-point
   )
   #add-point:input段define name="input.define_customerization"
   
   #end add-point
   DEFINE l_ac_t          LIKE type_t.num10       #未取消的ARRAY CNT 
   DEFINE l_allow_insert  LIKE type_t.num5        #可新增否 
   DEFINE l_allow_delete  LIKE type_t.num5        #可刪除否  
   DEFINE l_count         LIKE type_t.num10
   DEFINE l_insert        LIKE type_t.num5
   DEFINE p_cmd           LIKE type_t.chr5
   DEFINE ls_mdl_str      STRING   #190925-00007
   DEFINE lp_js           STRING   #190925-00007
   #add-point:input段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE l_comp          LIKE xrem_t.xremcomp
   DEFINE l_strdate       LIKE xrem_t.xremdocdt
   DEFINE l_enddate       LIKE xrem_t.xremdocdt
   DEFINE l_glaa024       LIKE glaa_t.glaa024
   DEFINE l_glaa003       LIKE glaa_t.glaa003 #會計參照表號
   DEFINE l_glav006       LIKE glav_t.glav003 #會計期別
   DEFINE l_origin_str    STRING
   DEFINE r_xremdocno     LIKE xrem_t.xremdocno
   #DEFINE r_success       LIKE type_t.chr1  #190611-00014#1 mark
   DEFINE r_success       LIKE type_t.num5   #190611-00014#1 add 
   DEFINE l_success       LIKE type_t.chr1   
   DEFINE p_argv1         LIKE type_t.chr1
   DEFINE g_bookno        LIKE glaa_t.glaald
   DEFINE l_xrcacomp      LIKE xrca_t.xrcacomp
   DEFINE l_glaa121       LIKE glaa_t.glaa121    #20150528 add lujh
   DEFINE l_ooac004       LIKE ooac_t.ooac004    #20150528 add lujh
   DEFINE l_flag          LIKE type_t.num5       #161104-00046#10
   DEFINE l_slip          LIKE type_t.chr80      #170330-00016#1 add xul 
   DEFINE l_year          LIKE xrem_t.xrem001    #190213-00004#1---add 
   DEFINE l_mon           LIKE xrem_t.xrem002    #190213-00004#1---add
   #end add-point
 
  
   WHENEVER ERROR CALL cl_err_msg_log   #180810-00046
 
   #畫面開啟 (identifier)
   OPEN WINDOW w_axrt930_01 WITH FORM cl_ap_formpath("axr","axrt930_01")
 
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   
   LET g_qryparam.state = "i"
   LET p_cmd = 'a'
   
   #輸入前處理
   #add-point:單頭前置處理 name="input.pre_input"
   WHENEVER ERROR CONTINUE
   LET g_argv1 = p_argv1
   IF g_argv1 = '1' THEN LET g_prog = 'axrt930' END IF
   IF g_argv1 = '2' THEN LET g_prog = 'axrt931' END IF
   LET g_xrem_m.xrem001 = YEAR(g_today)
   LET g_xrem_m.xrem002 = MONTH(g_today)
   LET g_xrem_m.xremdocno = null   #151125-00006#1--add-


   CALL s_fin_create_account_center_tmp()
   #帳務中心
   #取得預設的帳務中心,因新增階段的時候,並不會知道site,所以以登入人員做為依據
   CALL s_fin_get_account_center('',g_user,'3',g_today) RETURNING l_success,g_xrem_m.xremsite,g_errno
   CALL s_desc_get_department_desc(g_xrem_m.xremsite)RETURNING g_xrem_m.xremsite_desc 
   
   #g_bookno,先做帳務中心及g_bookno的勾稽,登入人員帳務人員時,基本上會有該g_bookno的帳務中心權限
   #IF NOT cl_null(g_bookno) THEN
   #   #帳務中心與帳別勾稽
   #   CALL s_fin_account_center_with_ld_chk(g_xrem_m.xremsite,g_bookno,g_user,'3','N','',g_today) RETURNING l_success,g_errno
  # END IF
   #該帳務中心與帳別無法勾稽到,以登入人員g_user取得預設帳別/法人
  #IF NOT l_success OR cl_null(g_bookno) THEN
      CALL s_fin_ld_carry('',g_user) RETURNING l_success,g_xrem_m.xremld,l_comp,g_errno
      CALL s_fin_account_center_with_ld_chk(g_xrem_m.xremsite,g_xrem_m.xremld,g_user,'3','N','',g_today) RETURNING l_success,g_errno
  #ELSE
  #    LET g_xrem_m.xremld = g_bookno
  #END IF

   #若取不出資料,則不預設帳別
   IF NOT l_success THEN
      LET g_xrem_m.xremld = ''
   END IF
   IF cl_null(g_xrem_m.xremld) THEN 
      CALL s_fin_orga_get_comp_ld(g_xrem_m.xremsite) RETURNING l_success,g_errno,l_xrcacomp,g_xrem_m.xremld
      CALL s_fin_account_center_with_ld_chk(g_xrem_m.xremsite,g_xrem_m.xremld,g_user,'3','N','',g_today) RETURNING l_success,g_errno
   END IF
   IF NOT cl_null(g_xrem_m.xremld) THEN
      CALL s_desc_get_ld_desc(g_xrem_m.xremld) RETURNING g_xrem_m.xremld_desc
      #單據別參照表號
      SELECT glaa024,glaa121 INTO l_glaa024,l_glaa121    #20150528 add glaa021 lujh
        FROM glaa_t
       WHERE glaaent = g_enterprise
         AND glaald = g_xrem_m.xremld 
   END IF
   
   #取得會計周期參照表設定下拉   
   CALL axrt930_01_glaa003(g_xrem_m.xremld,g_xrem_m.xrem001)RETURNING l_glaa003
   #取得該期最大最小日期      
   IF g_argv1 = '1' THEN
      #下期最大最小日期 
#      CALL s_fin_date_get_period_range(l_glaa003,g_xrem_m.xrem001,g_xrem_m.xrem002+1)RETURNING l_strdate,l_enddate  #190213-00004#1---mark
      #190213-00004#1---add---str
      CALL s_fin_date_get_next_period(l_glaa003,g_xrem_m.xremld,g_xrem_m.xrem001,g_xrem_m.xrem002) RETURNING g_sub_success,l_year,l_mon  #取下期年月     
      CALL s_fin_date_get_period_range(l_glaa003,l_year,l_mon) RETURNING l_strdate,l_enddate #下期最大最小日期
      #190213-00004#1---add---end
      LET g_xrem_m.xremdocdt = l_strdate
   ELSE
      #當月最大最小日期
      CALL s_fin_date_get_period_range(l_glaa003,g_xrem_m.xrem001,g_xrem_m.xrem002)RETURNING l_strdate,l_enddate
      LET g_xrem_m.xremdocdt = l_enddate
   END IF   
   
   LET g_xrem_m.xrem004  = g_user
   #170606-00033#14 add-s
   #检核该人员是否属于账套对应法人下 
   CALL s_afa_ooag001_def_chk(g_site,g_xrem_m.xrem004,'',1) RETURNING g_errno 
   IF NOT cl_null(g_errno) THEN
      LET g_xrem_m.xrem004 = NULL
   END IF 
   #170606-00033#14 add-e
   CALL s_desc_get_person_desc(g_xrem_m.xrem004) RETURNING g_xrem_m.xrem004_desc        

   
   DISPLAY BY NAME g_xrem_m.xremld,g_xrem_m.xrem001,g_xrem_m.xrem002,g_xrem_m.xremdocdt,g_xrem_m.xremld_desc,
                   g_xrem_m.xremsite,g_xrem_m.xremsite_desc,g_xrem_m.xrem004_desc 
   #161104-00046#10-----s
   CALL s_control_get_docno_sql(g_user,g_dept) RETURNING g_sub_success,g_user_slip_wc
   #161104-00046#10-----e
   #end add-point
  
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #輸入開始
      INPUT BY NAME g_xrem_m.xremsite,g_xrem_m.xremld,g_xrem_m.xrem004,g_xrem_m.xremdocno,g_xrem_m.xrem001,g_xrem_m.xrem002,g_xrem_m.xremdocdt ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION
         #add-point:單頭前置處理 name="input.action"
         
         #end add-point
         
         #自訂ACTION(master_input)
         
         
         BEFORE INPUT
            #add-point:單頭輸入前處理 name="input.before_input"
            
            #end add-point
          
                  #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xremsite
            
            #add-point:AFTER FIELD xremsite name="input.a.xremsite"
            LET g_xrem_m.xremsite_desc = ''
#160811-00009#3 mod s---            
#            IF NOT cl_null(g_xrem_m.xremsite) THEN
#               CALL s_fin_account_center_with_ld_chk(g_xrem_m.xremsite,'','','3','N','',g_today) RETURNING g_sub_success,g_errno
#               IF NOT g_sub_success THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = ''
#                  LET g_errparam.popup = TRUE
#                  LET g_xrem_m.xremsite = ''
#                  LET g_xrem_m.xremsite_desc = ''
#                  DISPLAY BY NAME g_xrem_m.xremsite_desc
#                  CALL cl_err()
#                  NEXT FIELD xremsite
#               END IF
#            END IF
#160811-00009#3 mod e---
            #160811-00009#3 add s---
            IF NOT cl_null(g_xrem_m.xremsite) THEN
               IF p_cmd = 'a' THEN
                  #161026-00013#1 --s add
                  #檢核是否結算組織
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_xrem_m.xremsite
                  IF NOT cl_chk_exist("v_ooef001_212") THEN  
                     LET g_xrem_m.xremsite = ''
                     LET g_xrem_m.xremsite_desc = s_desc_get_department_desc(g_xrem_m.xremsite)
                     DISPLAY BY NAME g_xrem_m.xremsite_desc
                     NEXT FIELD CURRENT
                  END IF
                  #161026-00013#1 --e add
               
                  CALL s_axrt300_site_geared_ld(g_xrem_m.xremsite,g_xrem_m.xremld,g_xrem_m.xrem004,g_xrem_m.xremdocdt,'site')
                     RETURNING l_success,g_xrem_m.xremsite,g_xrem_m.xremsite_desc,g_xrem_m.xremld,g_xrem_m.xremld_desc
                  DISPLAY BY NAME g_xrem_m.xremsite,g_xrem_m.xremsite_desc
                  DISPLAY BY NAME g_xrem_m.xremld,g_xrem_m.xremld_desc
                  IF NOT l_success THEN NEXT FIELD CURRENT END IF
               END IF
            ELSE
               LET g_xrem_m.xremsite_desc = ''
            END IF                   
            #160811-00009#3 add e---
            LET g_xrem_m.xremsite_desc = s_desc_get_department_desc(g_xrem_m.xremsite)
            DISPLAY BY NAME g_xrem_m.xremsite_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xremsite
            #add-point:BEFORE FIELD xremsite name="input.b.xremsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xremsite
            #add-point:ON CHANGE xremsite name="input.g.xremsite"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_xrem_m.xremsite
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'xremsite',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xremld
            
            #add-point:AFTER FIELD xremld name="input.a.xremld"
            LET g_xrem_m.xremld_desc = ''
            IF NOT cl_null(g_xrem_m.xremld) THEN
               #檢查是否存在 帳別資料檔 中
               IF NOT ap_chk_isExist(g_xrem_m.xremld,"SELECT COUNT(*) FROM glaa_t WHERE "||"glaaent = '" ||g_enterprise|| "' AND "||"glaald = ? ",'agl-00016',1) THEN
                  LET g_xrem_m.xremld = ''
                  CALL s_desc_get_ld_desc(g_xrem_m.xremld) RETURNING g_xrem_m.xremld_desc                
                  NEXT FIELD CURRENT
               END IF  
               
               #檢查是否 有效
#               IF NOT ap_chk_isExist(g_xrem_m.xremld,"SELECT COUNT(*) FROM glaa_t WHERE "||"glaaent = '" ||g_enterprise|| "' AND "||"glaald = ? AND glaastus = 'Y'",'agl-00051',1) THEN   #160318-00005#54  mark
               IF NOT ap_chk_isExist(g_xrem_m.xremld,"SELECT COUNT(*) FROM glaa_t WHERE "||"glaaent = '" ||g_enterprise|| "' AND "||"glaald = ? AND glaastus = 'Y'",'sub-01302','agli010') THEN   #160318-00005#54  add
                  LET g_xrem_m.xremld = ''
                  CALL s_desc_get_ld_desc(g_xrem_m.xremld) RETURNING g_xrem_m.xremld_desc                
                  NEXT FIELD CURRENT
               END IF 
               
               CALL s_fin_account_center_sons_query('3',g_xrem_m.xremsite,g_today,'1')
               CALL s_fin_account_center_with_ld_chk(g_xrem_m.xremsite,g_xrem_m.xremld,g_user,'3','N','',g_today) RETURNING g_sub_success,g_errno
               IF NOT g_sub_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_xrem_m.xremld = '' 
                  NEXT FIELD CURRENT
                END IF
             END IF
            #重新取得會計週期參照表,最大期別,月份下拉
            CALL axrt930_01_glaa003(g_xrem_m.xremld,g_xrem_m.xrem001)RETURNING l_glaa003
            CALL s_desc_get_ld_desc(g_xrem_m.xremld) RETURNING g_xrem_m.xremld_desc
            DISPLAY BY NAME g_xrem_m.xremld_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xremld
            #add-point:BEFORE FIELD xremld name="input.b.xremld"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xremld
            #add-point:ON CHANGE xremld name="input.g.xremld"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_xrem_m.xremld
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'xremld',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrem004
            
            #add-point:AFTER FIELD xrem004 name="input.a.xrem004"
            LET g_xrem_m.xrem004_desc = ' '
            IF NOT cl_null(g_xrem_m.xrem004) THEN        
               CALL s_employee_chk(g_xrem_m.xrem004) RETURNING g_sub_success
               IF NOT g_sub_success THEN
                  LET g_xrem_m.xrem004 = ''
                  NEXT FIELD CURRENT
               END IF     
               
                #170606-00033#14 add-s 
                #检查该人员是否存在当前据点法人下
                CALL s_axrt300_ooag001_chk(g_site,g_xrem_m.xrem004,'',1) RETURNING l_success
                IF l_success=FALSE THEN
                  LET g_xrem_m.xrem004 = ''
                  NEXT FIELD CURRENT
                END IF 
                #170606-00033#14 add-e
            END IF
            CALL s_desc_get_person_desc(g_xrem_m.xrem004) RETURNING g_xrem_m.xrem004_desc
            DISPLAY BY NAME g_xrem_m.xrem004_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrem004
            #add-point:BEFORE FIELD xrem004 name="input.b.xrem004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrem004
            #add-point:ON CHANGE xrem004 name="input.g.xrem004"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_xrem_m.xrem004
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'xrem004',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xremdocno
            #add-point:BEFORE FIELD xremdocno name="input.b.xremdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xremdocno
            
            #add-point:AFTER FIELD xremdocno name="input.a.xremdocno"
             IF NOT cl_null(g_xrem_m.xremdocno) THEN 
               CALL s_fin_slip_chk(g_xrem_m.xremdocno,g_prog,g_xrem_m.xremld,l_glaa024)RETURNING g_sub_success,g_errno            
               IF NOT g_sub_success THEN
                   INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_xrem_m.xremdocno = ''
                  NEXT FIELD CURRENT
               END IF     
               #161104-00046#10-----s
#               CALL s_control_chk_doc('1',g_xrem_m.xremdocno,'4',g_user,g_dept,'','') RETURNING g_sub_success,l_flag #170301-00027#4 20170302 mark by 08172
               CALL s_control_chk_doc('1',g_xrem_m.xremdocno,'4',g_user,g_dept,g_xrem_m.xremld,'') RETURNING g_sub_success,l_flag #170301-00027#4 20170302 add by 08172
               IF g_sub_success AND l_flag THEN
               ELSE
                  LET g_xrem_m.xremdocno = ''
                  NEXT FIELD CURRENT
               END IF
               #161104-00046#10-----e
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xremdocno
            #add-point:ON CHANGE xremdocno name="input.g.xremdocno"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_xrem_m.xremdocno
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'xremdocno',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrem001
            #add-point:BEFORE FIELD xrem001 name="input.b.xrem001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrem001
            
            #add-point:AFTER FIELD xrem001 name="input.a.xrem001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrem001
            #add-point:ON CHANGE xrem001 name="input.g.xrem001"
            CALL axrt930_01_glaa003(g_xrem_m.xremld,g_xrem_m.xrem001)RETURNING l_glaa003
            IF g_argv1 = '1' THEN
               #下期最大最小日期 
#               CALL s_fin_date_get_period_range(l_glaa003,g_xrem_m.xrem001,g_xrem_m.xrem002+1)RETURNING l_strdate,l_enddate  #190213-00004#1---mark
               #190213-00004#1---add---str
               CALL s_fin_date_get_next_period(l_glaa003,g_xrem_m.xremld,g_xrem_m.xrem001,g_xrem_m.xrem002) RETURNING g_sub_success,l_year,l_mon  #取下期年月     
               CALL s_fin_date_get_period_range(l_glaa003,l_year,l_mon) RETURNING l_strdate,l_enddate #下期最大最小日期
               #190213-00004#1---add---end
            ELSE
               #當月最大最小日期
               CALL s_fin_date_get_period_range(l_glaa003,g_xrem_m.xrem001,g_xrem_m.xrem002)RETURNING l_strdate,l_enddate
            END IF        
            CALL axrt930_01_glaa003(g_xrem_m.xremld,g_xrem_m.xrem001)RETURNING l_glaa003
            CALL s_fin_date_get_period_range(l_glaa003,g_xrem_m.xrem001,g_xrem_m.xrem002)RETURNING l_strdate,l_enddate
            IF cl_null(l_strdate) OR cl_null(l_enddate)THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'agl-00129'
               LET g_errparam.extend = g_xrem_m.xrem001
               LET g_errparam.popup = TRUE
               CALL cl_err()                            
               NEXT FIELD CURRENT
            END IF
            IF g_argv1 = '1' THEN
               #下期第一天
               LET g_xrem_m.xremdocdt = l_strdate
            ELSE
               #當期最後一天
               LET g_xrem_m.xremdocdt = l_enddate
            END IF
            DISPLAY BY NAME g_xrem_m.xremdocdt
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrem002
            #add-point:BEFORE FIELD xrem002 name="input.b.xrem002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrem002
            
            #add-point:AFTER FIELD xrem002 name="input.a.xrem002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrem002
            #add-point:ON CHANGE xrem002 name="input.g.xrem002"
            CALL axrt930_01_glaa003(g_xrem_m.xremld,g_xrem_m.xrem001)RETURNING l_glaa003
            IF g_argv1 = '1' THEN
               #下期最大最小日期 
#               CALL s_fin_date_get_period_range(l_glaa003,g_xrem_m.xrem001,g_xrem_m.xrem002+1)RETURNING l_strdate,l_enddate #190213-00004#1---mark
                #190213-00004#1---add---str
               CALL s_fin_date_get_next_period(l_glaa003,g_xrem_m.xremld,g_xrem_m.xrem001,g_xrem_m.xrem002) RETURNING g_sub_success,l_year,l_mon  #取下期年月     
               CALL s_fin_date_get_period_range(l_glaa003,l_year,l_mon) RETURNING l_strdate,l_enddate #下期最大最小日期
               #190213-00004#1---add---end
            ELSE
               #當期最大最小日期
               CALL s_fin_date_get_period_range(l_glaa003,g_xrem_m.xrem001,g_xrem_m.xrem002)RETURNING l_strdate,l_enddate
            END IF    
            IF cl_null(l_strdate) OR cl_null(l_enddate)THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'agl-00129'
               LET g_errparam.extend = g_xrem_m.xrem002
               LET g_errparam.popup = TRUE
               CALL cl_err()                            
               NEXT FIELD CURRENT
            END IF
            IF g_argv1 = '1' THEN
               LET g_xrem_m.xremdocdt = l_strdate
            ELSE
               LET g_xrem_m.xremdocdt = l_enddate
            END IF
            DISPLAY BY NAME g_xrem_m.xremdocdt
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xremdocdt
            #add-point:BEFORE FIELD xremdocdt name="input.b.xremdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xremdocdt
            
            #add-point:AFTER FIELD xremdocdt name="input.a.xremdocdt"
            IF g_argv1 = '1' THEN
               #年度/期別條件加一期的日期區間
               IF g_xrem_m.xremdocdt > l_enddate OR g_xrem_m.xremdocdt < l_strdate THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aap-00240'
                  LET g_errparam.extend = g_xrem_m.xremdocdt
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_xrem_m.xremdocdt = l_strdate
                  NEXT FIELD CURRENT
               END IF
            ELSE
               #年度期別的日期區間
               IF g_xrem_m.xremdocdt > l_enddate OR g_xrem_m.xremdocdt < l_strdate THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aap-00225'
                  LET g_errparam.extend = g_xrem_m.xremdocdt
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_xrem_m.xremdocdt = l_enddate
                  NEXT FIELD CURRENT
               END IF
            END IF
            
            #170417-00063#2 by 09257 --add_s
            IF NOT cl_null(g_xrem_m.xremdocdt) THEN
               #170315-00043#6   mark(s) 
               #CALL s_axrt300_date_chk(g_xrem_m.xremsite,g_xrem_m.xremdocdt) RETURNING l_success
               #IF NOT l_success THEN
               #170315-00043#6   mark(e) 
               #170315-00043#6   add(s)
               SELECT glaacomp INTO l_xremcomp FROM glaa_t 
                WHERE glaaent = g_enterprise 
                  AND glaald =  g_xrem_m.xremld              
               CALL cl_get_para(g_enterprise,l_xremcomp,'S-FIN-2007') RETURNING g_sfin2007
                 IF NOT cl_null(g_sfin2007) THEN
                    IF g_xrem_m.xremdocdt < g_sfin2007 THEN               
                #170315-00043#6   add(e)
                       INITIALIZE g_errparam TO NULL 
                       LET g_errparam.extend = "" 
                       LET g_errparam.code   = "axr-00299"
                       LET g_errparam.popup  = TRUE 
                       CALL cl_err() 
                       NEXT FIELD CURRENT
                    END IF #170315-00043#6   add
               END IF
            END IF
            #170417-00063#2 by 09257 --add_e
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xremdocdt
            #add-point:ON CHANGE xremdocdt name="input.g.xremdocdt"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.xremsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xremsite
            #add-point:ON ACTION controlp INFIELD xremsite name="input.c.xremsite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xrem_m.xremsite
            #LET g_qryparam.where = " ooef201 = 'Y' " #160811-00009#3 
            #CALL q_ooef001()   #161026-00013#1 mark
            CALL q_ooef001_46() #161026-00013#1 add
            LET g_xrem_m.xremsite = g_qryparam.return1
            CALL s_desc_get_department_desc(g_xrem_m.xremsite) RETURNING g_xrem_m.xremsite_desc
            DISPLAY BY NAME g_xrem_m.xremsite,g_xrem_m.xremsite_desc
            NEXT FIELD xremsite
            #END add-point
 
 
         #Ctrlp:input.c.xremld
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xremld
            #add-point:ON ACTION controlp INFIELD xremld name="input.c.xremld"
            INITIALIZE g_qryparam.* TO NULL
               
            #取得帳務組織下所屬成員
            CALL s_fin_account_center_sons_query('3',g_xrem_m.xremsite,g_today,'1')
            #取得帳務組織下所屬成員之帳別   
            CALL s_fin_account_center_comp_str() RETURNING l_origin_str
            #將取回的字串轉換為SQL條件
            CALL s_fin_get_wc_str(l_origin_str) RETURNING l_origin_str
            
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xrem_m.xremld
            LET g_qryparam.arg1 = g_user                                 #人員權限
            LET g_qryparam.arg2 = g_dept                                 #部門權限
            LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN ",l_origin_str,""
            CALL q_authorised_ld()
            LET g_xrem_m.xremld = g_qryparam.return1
            CALL s_desc_get_ld_desc(g_xrem_m.xremld) RETURNING g_xrem_m.xremld_desc     
            DISPLAY BY NAME g_xrem_m.xremld,g_xrem_m.xremld_desc
            NEXT FIELD xremld 
            #END add-point
 
 
         #Ctrlp:input.c.xrem004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrem004
            #add-point:ON ACTION controlp INFIELD xrem004 name="input.c.xrem004"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xrem_m.xrem004    
            #170606-00033#14 add-s
            LET g_qryparam.where = "(ooag004 IN (SELECT ooef001 FROM ooef_t 
                                                WHERE ooefent=",g_enterprise, 
                                                " AND ooef017 IN (SELECT ooef017 FROM ooef_t 
                                                                    WHERE ooefent=",g_enterprise, 
                                                                    " AND ooef001='",g_site,"')
                                                  AND ooef201='Y'
                                                )
                                     OR ooag004='ALL' )"
                                                
            #170606-00033#14 add-e            
            CALL q_ooag001()
            LET g_xrem_m.xrem004 = g_qryparam.return1
            CALL s_desc_get_person_desc(g_xrem_m.xrem004) RETURNING g_xrem_m.xrem004_desc
            DISPLAY BY NAME g_xrem_m.xrem004,g_xrem_m.xrem004_desc
            NEXT FIELD xrem004
            #END add-point
 
 
         #Ctrlp:input.c.xremdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xremdocno
            #add-point:ON ACTION controlp INFIELD xremdocno name="input.c.xremdocno"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_xrem_m.xremdocno 
            LET g_qryparam.arg1 = l_glaa024
            LET g_qryparam.arg2 = g_prog
            #161104-00046#10-----s
            IF NOT cl_null(g_user_slip_wc)THEN
               LET g_qryparam.where = g_user_slip_wc
            END IF
            #161104-00046#10-----e   
            CALL q_ooba002_1()                          
            LET g_xrem_m.xremdocno  = g_qryparam.return1 
            DISPLAY g_xrem_m.xremdocno TO xremdocno      
            NEXT FIELD xremdocno                    
            #END add-point
 
 
         #Ctrlp:input.c.xrem001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrem001
            #add-point:ON ACTION controlp INFIELD xrem001 name="input.c.xrem001"
            
            #END add-point
 
 
         #Ctrlp:input.c.xrem002
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrem002
            #add-point:ON ACTION controlp INFIELD xrem002 name="input.c.xrem002"
            
            #END add-point
 
 
         #Ctrlp:input.c.xremdocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xremdocdt
            #add-point:ON ACTION controlp INFIELD xremdocdt name="input.c.xremdocdt"
            
            #END add-point
 
 
 #欄位開窗
 
         AFTER INPUT
            #add-point:單頭輸入後處理 name="input.after_input"


            #end add-point
            
      END INPUT
    
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      #公用action
      ON ACTION accept
         ACCEPT DIALOG
        
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION close
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit
         LET INT_FLAG = TRUE 
         EXIT DIALOG
   
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
 
   #add-point:畫面關閉前 name="input.before_close"
   IF INT_FLAG THEN
      LET INT_FLAG = FALSE

      DROP TABLE s_fin_tmp1 #ODI-ORA#
      CLOSE WINDOW w_axrt930_01
      RETURN r_success,r_xremdocno
   END IF
   #end add-point
   
   #畫面關閉
   CLOSE WINDOW w_axrt930_01 
   
   #add-point:input段after input name="input.post_input"
   CALL cl_err_collect_init() 
   CALL s_transaction_begin()  #190611-00014#1 add
   LET r_success = TRUE        #190611-00014#1 add
   CALL axrt930_01_chk() RETURNING r_success
   IF r_success = TRUE THEN    
      CALL axrt930_01_ins_xrem(g_xrem_m.xremdocno) RETURNING g_sub_success,r_xremdocno   
      LET r_success = g_sub_success 
   END IF  
   #190611-00014#1 add s---
   IF NOT r_success THEN 
      CALL s_transaction_end('N','0')
   ELSE
      CALL s_transaction_end('Y','0')
   END IF
   #190611-00014#1 add e---
    
   IF r_success = TRUE THEN #190611-00014#1 add    
      #170330-00016#1--add--s--xul   
      #获取单别
      CALL s_aooi200_get_slip(g_xrem_m.xremdocno) RETURNING g_sub_success,l_slip
      #170330-00016#1--add--e--xul
      #20150528--add--str--lujh
      #是否抛傳票    
      SELECT ooac004 INTO l_ooac004
        FROM ooac_t
       WHERE ooacent = g_enterprise
         AND ooac001 = l_glaa024
         AND ooac002 = l_slip      #170330-00016#1 mod g_xrem_m.xremdocno -> l_slip
         AND ooac003 = 'D-FIN-0030'  
      
      #IF l_glaa121 = 'Y' AND l_ooac004 = 'Y' THEN #180803-00069#1 mark by 06189
      #成功产生单号才去产生凭证
      IF l_glaa121 = 'Y' AND l_ooac004 = 'Y' AND r_xremdocno IS NOT NULL THEN #180803-00069#1 mark by 06189
         CALL s_transaction_begin()
         #CALL cl_err_collect_init() #180803-00069#1 mark by 06189
         
         IF g_argv[1] = '1' THEN 
            CALL s_pre_voucher_ins('AR','R50',g_xrem_m.xremld,r_xremdocno,g_xrem_m.xremdocdt,'5') RETURNING l_success
         ELSE
            #CALL s_pre_voucher_ins('AR','R51',g_xrem_m.xremld,r_xremdocno,g_xrem_m.xremdocdt,'6') RETURNING l_success #171101-00041#1 mark
            CALL s_pre_voucher_ins('AR','R51',g_xrem_m.xremld,r_xremdocno,g_xrem_m.xremdocdt,'5') RETURNING l_success  #171101-00041#1 add
         END IF
      
         LET r_success = l_success
      
      END IF   
      #20150528--add--end--lujh
   END IF  #190611-00014#1 add  
   
   #151125-00006#1--add--s
   #IF r_success = '1' THEN #190611-00014#1 mark
   IF r_success = TRUE THEN #190611-00014#1 add  
      CALL s_transaction_end('Y','0') 
      CALL s_aooi200_fin_get_slip(g_xrem_m.xremdocno) RETURNING l_success,l_ooba002
      LET l_xremcomp = null
      SELECT glaacomp INTO l_xremcomp FROM glaa_t 
                                     WHERE glaaent = g_enterprise 
                                       AND glaald =  g_xrem_m.xremld
      CALL s_fin_get_doc_para(g_xrem_m.xremld,l_xremcomp,l_ooba002,'D-FIN-0031') RETURNING l_dfin0031
      CALL s_fin_get_doc_para(g_xrem_m.xremld,l_xremcomp,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
      IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN 
         IF cl_ask_confirm('aap-00403') THEN
            IF cl_auth_chk_act("confirmed") THEN   #190318-00028#4 add
               CALL axrt930_01_immediately_conf() RETURNING l_success
               IF l_success = 'Y' THEN
                  IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN 
                     IF cl_ask_confirm('axr-00888') THEN              
                        CALL axrt930_01_immediately_gen()
                     END IF 
                   END IF 
               END IF 
            END IF                                 #190318-00028#4 add
         END IF 
      END IF
   ELSE 
      CALL s_transaction_end('N','0')        
   END IF 
   #151125-00006#1--add--e

   CALL cl_err_collect_show()  
   
   RETURN r_success,r_xremdocno


   DROP TABLE s_fin_tmp1 #ODI-ORA#

   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="axrt930_01.other_dialog" readonly="Y" type="s" >}

 
{</section>}
 
{<section id="axrt930_01.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 設定最大期別傳回會計周期參照表
# Memo...........:
# Usage..........: CALL axrt930_01_glaa003(p_ld,p_xrem001)
# Date & Author..: 2014/10/28 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION axrt930_01_glaa003(p_ld,p_xrem001)
DEFINE p_ld       LIKE xrem_t.xremld
DEFINE p_xrem001  LIKE xrem_t.xrem001 #年度
DEFINE l_glav006  LIKE glav_t.glav006
DEFINE r_glaa003  LIKE glaa_t.glaa003 #會計週期參照表
DEFINE l_comb_value STRING
   
   WHENEVER ERROR CONTINUE
   LET r_glaa003 = ''
   LET l_comb_value = '1,2,3,4,5,6,7,8,9,10,11,12'
   #取得會計週期參照表
   SELECT glaa003 INTO r_glaa003
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = p_ld
      
   #取得年度最大期別            
   SELECT DISTINCT MAX(glav006)  INTO l_glav006
     FROM glav_t 
    WHERE glavent = g_enterprise
      AND glav001 = r_glaa003
      AND glav002 = p_xrem001
      
   CALL s_fin_set_comp_scc('xrem001','43')   #年度
   IF l_glav006 = 13 THEN
      CALL s_fin_set_comp_scc('xrem002','111')  #13期
   ELSE
       CALL cl_set_combo_items('xrem002',l_comb_value,l_comb_value)#12期
   END IF
   
   
   RETURN r_glaa003
END FUNCTION

################################################################################
# Descriptions...: 批次產生單頭
# Memo...........:
# Usage..........: CALL axrt930_01_ins_xrem(p_docno)
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION axrt930_01_ins_xrem(p_docno)
#161128-00061#5---modify----begin------------- 
#DEFINE l_xrem RECORD LIKE xrem_t.*
DEFINE l_xrem RECORD  #暫估帳務主檔
       xrement LIKE xrem_t.xrement, #企業編號
       xremownid LIKE xrem_t.xremownid, #資料所有者
       xremowndp LIKE xrem_t.xremowndp, #資料所屬部門
       xremcrtid LIKE xrem_t.xremcrtid, #資料建立者
       xremcrtdp LIKE xrem_t.xremcrtdp, #資料建立部門
       xremcrtdt LIKE xrem_t.xremcrtdt, #資料創建日
       xremmodid LIKE xrem_t.xremmodid, #資料修改者
       xremmoddt LIKE xrem_t.xremmoddt, #最近修改日
       xremcnfid LIKE xrem_t.xremcnfid, #資料確認者
       xremcnfdt LIKE xrem_t.xremcnfdt, #資料確認日
       xremstus LIKE xrem_t.xremstus, #狀態碼
       xremsite LIKE xrem_t.xremsite, #營運據點
       xremld LIKE xrem_t.xremld, #帳套
       xremcomp LIKE xrem_t.xremcomp, #法人
       xremdocno LIKE xrem_t.xremdocno, #單據編號
       xremdocdt LIKE xrem_t.xremdocdt, #單據日期
       xrem001 LIKE xrem_t.xrem001, #年度
       xrem002 LIKE xrem_t.xrem002, #期別
       xrem003 LIKE xrem_t.xrem003, #來源模組
       xrem004 LIKE xrem_t.xrem004, #帳務人員
       xrem005 LIKE xrem_t.xrem005, #傳票號碼
       xrem006 LIKE xrem_t.xrem006  #暫估類型
       END RECORD
#161128-00061#5---modify----end------------- 
DEFINE p_docno     LIKE xrem_t.xremdocno #單據別
DEFINE r_xremdocno LIKE xrem_t.xremdocno
#DEFINE r_success  LIKE type_t.chr1   #190611-00014#1 mark
DEFINE r_success   LIKE type_t.num5   #190611-00014#1 add 
DEFINE l_comp      LIKE xrem_t.xremcomp   
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_xremdocno = ''
   #取得帳套所屬法人 
   CALL s_fin_ld_carry(g_xrem_m.xremld,'')RETURNING g_sub_success,g_xrem_m.xremld,l_comp,g_errno 
   #自動編號
   IF g_argv1 = '1' THEN
      CALL s_aooi200_fin_gen_docno(g_xrem_m.xremld,'','',p_docno,g_xrem_m.xremdocdt,'axrt930') RETURNING r_success,r_xremdocno
   ELSE      
      CALL s_aooi200_fin_gen_docno(g_xrem_m.xremld,'','',p_docno,g_xrem_m.xremdocdt,'axrt931') RETURNING r_success,r_xremdocno
   END IF
   
   IF NOT r_success THEN
      RETURN r_success,r_xremdocno
   END IF
   INITIALIZE l_xrem.* TO NULL
   LET l_xrem.xrement   = g_enterprise
   LET l_xrem.xremownid = g_user
   LET l_xrem.xremowndp = g_dept 
   LET l_xrem.xremcrtid = g_user
   LET l_xrem.xremcrtdt = g_today
   LET l_xrem.xremmodid = ''       #資料修改者
   LET l_xrem.xremmoddt = ''       #最近修改日
   LET l_xrem.xremcnfid = ''       #資料確認者
   LET l_xrem.xremcnfdt = ''       #資料確認日
   LET l_xrem.xremstus  = 'N'      #狀態碼
   LET l_xrem.xremsite  = g_xrem_m.xremsite
   LET l_xrem.xremld    = g_xrem_m.xremld
   LET l_xrem.xremcomp  = l_comp
   LET l_xrem.xremdocno = r_xremdocno
   LET l_xrem.xremdocdt = g_xrem_m.xremdocdt
   LET l_xrem.xrem001   = g_xrem_m.xrem001   #年度
   LET l_xrem.xrem002   = g_xrem_m.xrem002   #期別
   LET l_xrem.xrem003   = 'AR'               #來源模組
   LET l_xrem.xrem004   = g_xrem_m.xrem004   #帳務人員
   LET g_xrem_m.xremdocno = r_xremdocno      #151125-00006#1--add
   IF g_argv1 = '1' THEN 
      LET l_xrem.xrem006 = '1'               
   ELSE
      LET l_xrem.xrem006 = '2'
   END IF      
   #161128-00061#5---modify----begin------------- 
   #INSERT INTO xrem_t VALUES (l_xrem.*)
    INSERT INTO xrem_t (xrement,xremownid,xremowndp,xremcrtid,xremcrtdp,xremcrtdt,xremmodid,xremmoddt,
                        xremcnfid,xremcnfdt,xremstus,xremsite,xremld,xremcomp,xremdocno,xremdocdt,xrem001,xrem002,
                        xrem003,xrem004,xrem005,xrem006)
    VALUES (l_xrem.xrement,l_xrem.xremownid,l_xrem.xremowndp,l_xrem.xremcrtid,l_xrem.xremcrtdp,l_xrem.xremcrtdt,l_xrem.xremmodid,l_xrem.xremmoddt,
            l_xrem.xremcnfid,l_xrem.xremcnfdt,l_xrem.xremstus,l_xrem.xremsite,l_xrem.xremld,l_xrem.xremcomp,l_xrem.xremdocno,l_xrem.xremdocdt,l_xrem.xrem001,l_xrem.xrem002,
            l_xrem.xrem003,l_xrem.xrem004,l_xrem.xrem005,l_xrem.xrem006)
   #161128-00061#5---modify----end------------ 
   IF SQLCA.SQLcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins xrem_t"
      LET g_errparam.popup = TRUE
      LET r_success = FALSE
      CALL cl_err()
      RETURN r_success,r_xremdocno
   END IF
   CALL axrt930_01_ins_xren(r_xremdocno)RETURNING g_sub_success 
   IF NOT g_sub_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins xren_t"
      LET g_errparam.popup = TRUE
      LET r_success = FALSE
      CALL cl_err()   
   END IF   
   
   RETURN r_success,r_xremdocno
END FUNCTION

################################################################################
# Descriptions...: 產生單身
# Memo...........:
# Usage..........: CALL axrt930_01_ins_xren(p_xremdocno)
# Modify.........:
################################################################################
PUBLIC FUNCTION axrt930_01_ins_xren(p_xremdocno)
#161128-00061#5---modify----begin------------- 
#DEFINE l_xren RECORD LIKE xren_t.*
#DEFINE l_xrea RECORD LIKE xrea_t.*
#DEFINE l_xrem RECORD LIKE xrem_t.*
DEFINE l_xren RECORD  #暫估帳務明細檔
       xrenent LIKE xren_t.xrenent, #企業編號
       xrendocno LIKE xren_t.xrendocno, #單據編號
       xrenseq LIKE xren_t.xrenseq, #序號
       xren001 LIKE xren_t.xren001, #年度
       xren002 LIKE xren_t.xren002, #期別
       xren003 LIKE xren_t.xren003, #來源模組
       xren004 LIKE xren_t.xren004, #帳款單性質
       xren005 LIKE xren_t.xren005, #立帳單據號碼
       xren006 LIKE xren_t.xren006, #項次
       xren007 LIKE xren_t.xren007, #分期帳款序
       xren008 LIKE xren_t.xren008, #立帳日期
       xren009 LIKE xren_t.xren009, #帳款對象
       xren010 LIKE xren_t.xren010, #收款對象
       xren011 LIKE xren_t.xren011, #部門
       xren012 LIKE xren_t.xren012, #責任中心
       xren013 LIKE xren_t.xren013, #區域
       xren014 LIKE xren_t.xren014, #客群
       xren015 LIKE xren_t.xren015, #產品類別
       xren016 LIKE xren_t.xren016, #人員
       xren017 LIKE xren_t.xren017, #專案編號
       xren018 LIKE xren_t.xren018, #WBS編號
       xren019 LIKE xren_t.xren019, #應收付科目
       xrenorga LIKE xren_t.xrenorga, #來源組織
       xren020 LIKE xren_t.xren020, #經營方式
       xren021 LIKE xren_t.xren021, #通路
       xren022 LIKE xren_t.xren022, #品牌
       xren023 LIKE xren_t.xren023, #自由核算項一
       xren024 LIKE xren_t.xren024, #自由核算項二
       xren025 LIKE xren_t.xren025, #自由核算項三
       xren026 LIKE xren_t.xren026, #自由核算項四
       xren027 LIKE xren_t.xren027, #自由核算項五
       xren028 LIKE xren_t.xren028, #自由核算項六
       xren029 LIKE xren_t.xren029, #自由核算項七
       xren030 LIKE xren_t.xren030, #自由核算項八
       xren031 LIKE xren_t.xren031, #自由核算項九
       xren032 LIKE xren_t.xren032, #自由核算項十
       xren033 LIKE xren_t.xren033, #摘要
       xren040 LIKE xren_t.xren040, #稅別
       xren041 LIKE xren_t.xren041, #稅率
       xren042 LIKE xren_t.xren042, #稅別會科
       xren043 LIKE xren_t.xren043, #暫估費用/暫估收入科目
       xren100 LIKE xren_t.xren100, #幣別
       xren101 LIKE xren_t.xren101, #匯率
       xren103 LIKE xren_t.xren103, #原幣暫估金額
       xren104 LIKE xren_t.xren104, #原幣暫估稅額
       xren105 LIKE xren_t.xren105, #原幣暫估含稅金額
       xren113 LIKE xren_t.xren113, #本幣暫估金額
       xren114 LIKE xren_t.xren114, #本幣暫估稅額
       xren115 LIKE xren_t.xren115, #本幣暫估含稅金額
       xren121 LIKE xren_t.xren121, #本位幣二匯率
       xren123 LIKE xren_t.xren123, #本位幣二暫估金額
       xren124 LIKE xren_t.xren124, #本位幣二暫估稅額
       xren125 LIKE xren_t.xren125, #本位幣二暫估含稅金額
       xren131 LIKE xren_t.xren131, #本位幣三匯率
       xren133 LIKE xren_t.xren133, #本位幣三暫估金額
       xren134 LIKE xren_t.xren134, #本位幣三暫估稅額
       xren135 LIKE xren_t.xren135  #本位幣三暫估含稅金額
       END RECORD

DEFINE l_xrea RECORD  #往來帳科目月結檔
       xreaent LIKE xrea_t.xreaent, #企業編號
       xreacomp LIKE xrea_t.xreacomp, #法人
       xreasite LIKE xrea_t.xreasite, #帳務組織
       xreald LIKE xrea_t.xreald, #帳套
       xrea001 LIKE xrea_t.xrea001, #年度
       xrea002 LIKE xrea_t.xrea002, #期別
       xrea003 LIKE xrea_t.xrea003, #來源模組
       xrea004 LIKE xrea_t.xrea004, #帳款單性質
       xrea005 LIKE xrea_t.xrea005, #單據號碼
       xrea006 LIKE xrea_t.xrea006, #項次
       xrea007 LIKE xrea_t.xrea007, #分期帳款序
       xrea008 LIKE xrea_t.xrea008, #立帳日期
       xrea009 LIKE xrea_t.xrea009, #帳款對象
       xrea010 LIKE xrea_t.xrea010, #收款對象
       xrea011 LIKE xrea_t.xrea011, #部門
       xrea012 LIKE xrea_t.xrea012, #責任中心
       xrea013 LIKE xrea_t.xrea013, #區域
       xrea014 LIKE xrea_t.xrea014, #客群
       xrea015 LIKE xrea_t.xrea015, #產品類別
       xrea016 LIKE xrea_t.xrea016, #人員
       xrea017 LIKE xrea_t.xrea017, #專案編號
       xrea018 LIKE xrea_t.xrea018, #WBS編號
       xrea019 LIKE xrea_t.xrea019, #應收付科目
       xreaorga LIKE xrea_t.xreaorga, #來源組織
       xrea020 LIKE xrea_t.xrea020, #經營方式
       xrea021 LIKE xrea_t.xrea021, #通路
       xrea022 LIKE xrea_t.xrea022, #品牌
       xrea023 LIKE xrea_t.xrea023, #自由核算項一
       xrea024 LIKE xrea_t.xrea024, #自由核算項二
       xrea025 LIKE xrea_t.xrea025, #自由核算項三
       xrea026 LIKE xrea_t.xrea026, #自由核算項四
       xrea027 LIKE xrea_t.xrea027, #自由核算項五
       xrea028 LIKE xrea_t.xrea028, #自由核算項六
       xrea029 LIKE xrea_t.xrea029, #自由核算項七
       xrea030 LIKE xrea_t.xrea030, #自由核算項八
       xrea031 LIKE xrea_t.xrea031, #自由核算項九
       xrea032 LIKE xrea_t.xrea032, #自由核算項十
       xrea033 LIKE xrea_t.xrea033, #摘要
       xrea034 LIKE xrea_t.xrea034, #發票日期
       xrea035 LIKE xrea_t.xrea035, #出貨單據日期
       xrea036 LIKE xrea_t.xrea036, #交易認定日期
       xrea037 LIKE xrea_t.xrea037, #出入庫扣帳日期
       xrea038 LIKE xrea_t.xrea038, #應收款日
       xrea039 LIKE xrea_t.xrea039, #信評等級
       xrea040 LIKE xrea_t.xrea040, #稅別
       xrea041 LIKE xrea_t.xrea041, #稅率
       xrea042 LIKE xrea_t.xrea042, #No Use
       xrea043 LIKE xrea_t.xrea043, #No Use
       xrea100 LIKE xrea_t.xrea100, #幣別
       xrea101 LIKE xrea_t.xrea101, #交易匯率
       xrea102 LIKE xrea_t.xrea102, #重評匯率
       xrea103 LIKE xrea_t.xrea103, #原幣未沖含稅金額
       xrea104 LIKE xrea_t.xrea104, #原幣暫估未沖未稅金額
       xrea105 LIKE xrea_t.xrea105, #原幣暫估未沖稅額
       xrea106 LIKE xrea_t.xrea106, #原幣暫估未沖含稅金額
       xrea113 LIKE xrea_t.xrea113, #本幣未沖含稅金額
       xrea114 LIKE xrea_t.xrea114, #本幣暫估未沖未稅金額
       xrea115 LIKE xrea_t.xrea115, #本幣暫估未沖稅額
       xrea116 LIKE xrea_t.xrea116, #本幣暫估未沖含稅金額
       xrea122 LIKE xrea_t.xrea122, #本位幣二重評匯率
       xrea123 LIKE xrea_t.xrea123, #本位幣二未沖含稅金額
       xrea132 LIKE xrea_t.xrea132, #本位幣三重評匯率
       xrea133 LIKE xrea_t.xrea133, #本位幣三未沖含稅金額
       xrea044 LIKE xrea_t.xrea044, #發票號碼
       xrea045 LIKE xrea_t.xrea045  #交易條件
       END RECORD

DEFINE l_xrem RECORD  #暫估帳務主檔
       xrement LIKE xrem_t.xrement, #企業編號
       xremownid LIKE xrem_t.xremownid, #資料所有者
       xremowndp LIKE xrem_t.xremowndp, #資料所屬部門
       xremcrtid LIKE xrem_t.xremcrtid, #資料建立者
       xremcrtdp LIKE xrem_t.xremcrtdp, #資料建立部門
       xremcrtdt LIKE xrem_t.xremcrtdt, #資料創建日
       xremmodid LIKE xrem_t.xremmodid, #資料修改者
       xremmoddt LIKE xrem_t.xremmoddt, #最近修改日
       xremcnfid LIKE xrem_t.xremcnfid, #資料確認者
       xremcnfdt LIKE xrem_t.xremcnfdt, #資料確認日
       xremstus LIKE xrem_t.xremstus, #狀態碼
       xremsite LIKE xrem_t.xremsite, #營運據點
       xremld LIKE xrem_t.xremld, #帳套
       xremcomp LIKE xrem_t.xremcomp, #法人
       xremdocno LIKE xrem_t.xremdocno, #單據編號
       xremdocdt LIKE xrem_t.xremdocdt, #單據日期
       xrem001 LIKE xrem_t.xrem001, #年度
       xrem002 LIKE xrem_t.xrem002, #期別
       xrem003 LIKE xrem_t.xrem003, #來源模組
       xrem004 LIKE xrem_t.xrem004, #帳務人員
       xrem005 LIKE xrem_t.xrem005, #傳票號碼
       xrem006 LIKE xrem_t.xrem006  #暫估類型
       END RECORD
#161128-00061#5---modify----end------------- 

DEFINE p_xremdocno   LIKE xrem_t.xremdocno
#DEFINE r_success    LIKE type_t.chr1   #190611-00014#1 mark
DEFINE r_success     LIKE type_t.num5   #190611-00014#1 add 
DEFINE l_docdt       LIKE xrea_t.xrea008
DEFINE l_xrca007     LIKE xrca_t.xrca007
DEFINE l_count       LIKE type_t.num5

#170929-00010#1 add e---
DEFINE l_sql             STRING
DEFINE l_xrcbseq         LIKE xrcb_t.xrcbseq
DEFINE l_xrcb002         LIKE xrcb_t.xrcb002
DEFINE l_xrcb003         LIKE xrcb_t.xrcb003
DEFINE l_xrcb007         LIKE xrcb_t.xrcb007
DEFINE l_xrcb007_2       LIKE xrcb_t.xrcb007
DEFINE l_xrcb101         LIKE xrcb_t.xrcb101
DEFINE l_xrcb103_320     LIKE xrcb_t.xrcb103  
DEFINE l_xrcb103         LIKE xrcb_t.xrcb103
DEFINE l_xrcb104         LIKE xrcb_t.xrcb104
DEFINE l_xrcb105         LIKE xrcb_t.xrcb105
DEFINE l_xrcb113         LIKE xrcb_t.xrcb113
DEFINE l_xrcb114         LIKE xrcb_t.xrcb114
DEFINE l_xrcb115         LIKE xrcb_t.xrcb115
DEFINE l_xrcb103_2       LIKE xrcb_t.xrcb103
DEFINE l_xrcb104_2       LIKE xrcb_t.xrcb104
DEFINE l_xrcb105_2       LIKE xrcb_t.xrcb105
DEFINE l_xrcb113_2       LIKE xrcb_t.xrcb113
DEFINE l_xrcb114_2       LIKE xrcb_t.xrcb114
DEFINE l_xrcb115_2       LIKE xrcb_t.xrcb115
DEFINE l_sum_xrcb103     LIKE xrcb_t.xrcb103
DEFINE l_sum_xrcb104     LIKE xrcb_t.xrcb104
DEFINE l_sum_xrcb105     LIKE xrcb_t.xrcb105
DEFINE l_sum_xrcb113     LIKE xrcb_t.xrcb113
DEFINE l_sum_xrcb114     LIKE xrcb_t.xrcb114
DEFINE l_sum_xrcb115     LIKE xrcb_t.xrcb115
DEFINE l_sum_xrcb103_2   LIKE xrcb_t.xrcb103
DEFINE l_sum_xrcb104_2   LIKE xrcb_t.xrcb104
DEFINE l_sum_xrcb105_2   LIKE xrcb_t.xrcb105
DEFINE l_sum_xrcb113_2   LIKE xrcb_t.xrcb113
DEFINE l_sum_xrcb114_2   LIKE xrcb_t.xrcb114
DEFINE l_sum_xrcb115_2   LIKE xrcb_t.xrcb115
DEFINE l_sum_xren103     LIKE xren_t.xren103
DEFINE l_sum_xren104     LIKE xren_t.xren104
DEFINE l_sum_xren105     LIKE xren_t.xren105
DEFINE l_sum_xren113     LIKE xren_t.xren113
DEFINE l_sum_xren114     LIKE xren_t.xren114
DEFINE l_sum_xren115     LIKE xren_t.xren115
DEFINE l_diff_103        LIKE xren_t.xren103
DEFINE l_diff_104        LIKE xren_t.xren104
DEFINE l_diff_105        LIKE xren_t.xren105
DEFINE l_diff_113        LIKE xren_t.xren113
DEFINE l_diff_114        LIKE xren_t.xren114
DEFINE l_diff_115        LIKE xren_t.xren115
#170929-00010#1 add e--- 
DEFINE l_xrca013         LIKE xrca_t.xrca013 #170929-00010#9 add  
DEFINE l_xrcb105_320     LIKE xrcb_t.xrcb105 #170929-00010#9 add  
#DEFINE l_amt             LIKE type_t.num5    #170929-00010#9 add  #181227-00068#1---mark
#DEFINE l_amt             LIKE type_t.num10   #181227-00068#1---add  #191113-00009#1 mark
DEFINE l_amt             LIKE type_t.num20_6  #191113-00009#1 add
DEFINE l_docdt1          LIKE xrea_t.xrea008 #171121-00057#1 add
DEFINE l_xrcadocdt       LIKE xrca_t.xrcadocdt #171120-00001#1 add

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   #161128-00061#5---modify----begin------------- 
   #SELECT * INTO l_xrem.*
   SELECT xrement,xremownid,xremowndp,xremcrtid,xremcrtdp,xremcrtdt,xremmodid,xremmoddt,
          xremcnfid,xremcnfdt,xremstus,xremsite,xremld,xremcomp,
          xremdocno,xremdocdt,xrem001,xrem002,xrem003,xrem004,xrem005,xrem006 INTO l_xrem.*
   #161128-00061#5---modify----end------------- 
     FROM xrem_t
    WHERE xrement = g_enterprise
      AND xremdocno = p_xremdocno
      
   #LET l_docdt = MDY(l_xrem.xrem002,1,l_xrem.xrem001) #年度期別第一天 #170929-00010#1 mark
#   LET l_docdt = MDY(l_xrem.xrem002+1,1,l_xrem.xrem001)-1 #170929-00010#1 add  #190213-00004#1---mark
   #190213-00004#1---add---str
   IF l_xrem.xrem002 = 12 THEN
      LET l_docdt = MDY(l_xrem.xrem002,31,l_xrem.xrem001)      #年度期別最後一天
   ELSE
      LET l_docdt = MDY(l_xrem.xrem002+1,1,l_xrem.xrem001) - 1 #年度期別最後一天
   END IF
   #190213-00004#1---add---end
   LET l_docdt1 = MDY(l_xrem.xrem002,1,l_xrem.xrem001)  #171121-00057#1 add #年度期別第一天
#170929-00010#1 mark s---   
#   #161128-00061#5---modify----begin------------- 
#   #LET g_sql = " SELECT *                               ",
#   LET g_sql = " SELECT xreaent,xreacomp,xreasite,xreald,xrea001,xrea002,xrea003,xrea004,xrea005,xrea006,xrea007,",
#               "xrea008,xrea009,xrea010,xrea011,xrea012,xrea013,xrea014,xrea015,xrea016,xrea017,xrea018,xrea019,",
#               "xreaorga,xrea020,xrea021,xrea022,xrea023,xrea024,xrea025,xrea026,xrea027,xrea028,xrea029,xrea030,",
#               "xrea031,xrea032,xrea033,xrea034,xrea035,xrea036,xrea037,xrea038,xrea039,xrea040,xrea041,xrea042,",
#               "xrea043,xrea100,xrea101,xrea102,xrea103,xrea104,xrea105,xrea106,xrea113,xrea114,xrea115,xrea116,",
#               "xrea122,xrea123,xrea132,xrea133,xrea044,xrea045 ",
#   #161128-00061#5---modify----end------------- 
#170929-00010#1 mark e---
#170929-00010#1 add s---
   LET g_sql = " SELECT DISTINCT xreaent,xreacomp,xreasite,xreald,xrea001,xrea002,xrea003,xrea004,xrea005,",
               "xrea008,xrea009,xrea010,xrea011,xrea012,xrea013,xrea014,xrea015,xrea016,xrea017,xrea018,",
               "xreaorga,xrea020,xrea021,xrea022,xrea023,xrea024,xrea025,xrea026,xrea027,xrea028,xrea029,xrea030,",
#               "xrea031,xrea032,xrea033,xrea034,xrea035,xrea036,xrea037,xrea038,xrea039,xrea040,xrea041,xrea042,",  #191204-00032#2 mark
               "xrea031,xrea032,xrea033,xrea034,xrea035,xrea036,xrea037,xrea038,xrea039,xrea042,",  #191204-00032#2 add
               "xrea043,xrea100,xrea101,xrea102,",
               "xrea122,xrea132,xrea045 ",
#170929-00010#1 add e---
               "   FROM xrea_t                          ",
               "  WHERE xrea004 LIKE '0%'               ",
               "    AND xreaent = ",g_enterprise,"      ",
               "    AND xreald  = '",l_xrem.xremld,"'   ",
               "    AND xrea003 = 'AR'                  ",
               "    AND xrea001 = '",l_xrem.xrem001,"'  ",
               "    AND xrea002 = '",l_xrem.xrem002,"'  ",
               "    AND xreasite = '",g_xrem_m.xremsite,"'"  #171110-00035#1 add 
               
   IF g_argv1 = '2' THEN
      #LET g_sql = g_sql CLIPPED, " AND xrea008 < '",l_docdt,"' "  #170929-00010#1 mark
      LET g_sql = g_sql CLIPPED, " AND xrea008 <= '",l_docdt,"' "   #170929-00010#1 add
   END IF                          
   PREPARE axrt930_ins_prep FROM g_sql
   DECLARE axrt930_ins_curs CURSOR FOR axrt930_ins_prep

#170929-00010#1 mark s---
#   FOREACH axrt930_ins_curs INTO l_xrea.*     
#      #暫估費用/暫估收入科目
#      SELECT xrca036,xrca007 INTO l_xren.xren043,l_xrca007
#        FROM xrca_t
#       WHERE xrcaent   = g_enterprise
#         AND xrcadocno = l_xrea.xrea005   
#     #稅別會科
#      SELECT glab005 INTO l_xren.xren042
#        FROM glab_t
#       WHERE glabent = g_enterprise
#         AND glab003 = '8304_03'   #160920-00007#1 Mod 8304_27 --> 8304_03
#         AND glabld  = g_xrem_m.xremld
#         AND glab002 = l_xrca007      
#      
#      IF cl_null(l_xren.xrenseq) OR l_xren.xrenseq = 0 THEN
#         LET l_xren.xrenseq = 1
#      ELSE 
#         LET l_xren.xrenseq = l_xren.xrenseq +1
#      END IF  
#170929-00010#1 mark e---
   #170929-00010#1 add s---
   CALL cl_get_para(g_enterprise,l_xrem.xremcomp,'S-FIN-2012') RETURNING g_sfin2012
   
   LET l_sql = "SELECT xrcadocdt,xrcbseq,xrcb002,xrcb003,xrcb007,xrcb101,", #171121-00057#1 add xrcadocdt
               "       xrcb103,xrcb105,xrcb021,xrcb029,xrca013,xrcb020 ", #170929-00010#9 add xrcb105,xrca013 含税否 #171121-00057#1 add xrcb020
               "       ,xrcborga", #171125-00004#1 add
               "  FROM xrcb_t,xrca_t ",
               " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno ",
               "   AND xrcbent = ",g_enterprise,
               "   AND xrcastus = 'Y'",
               "   AND xrcbld = ?",
               "   AND xrcbdocno = ? "
   #171121-00057#1 add s---
   IF g_argv1 = '2' THEN
      LET l_sql = l_sql CLIPPED,"   AND xrcadocdt < '",l_docdt1,"'"
   END IF
   #171121-00057#1 add e---                   
   PREPARE axrt930_sel_xrcb_p FROM l_sql
   DECLARE axrt930_sel_xrcb_c CURSOR FOR axrt930_sel_xrcb_p
  
   
   #有來源單：出貨
   LET l_sql = "SELECT SUM(xrcb007),SUM(xrcb103),SUM(xrcb104),SUM(xrcb105), ",      #數量/原幣未稅/原幣稅額/原幣含稅
               "       SUM(xrcb113),SUM(xrcb114),SUM(xrcb115)",                     #原幣未稅/原幣稅額/原幣含稅
               "  FROM xrcb_t ",
               "  LEFT JOIN xrca_t ON xrcaent = xrcbent AND xrcadocno = xrcbdocno ",
               " WHERE xrcbent = ",g_enterprise,
               "   AND xrcb002 = ?",
               "   AND xrcb003 = ?",
               "   AND xrca001 IN ('12','17','22')",
               "   AND xrcb023 = 'Y'",  #171110-00035#1 add 
               #"   AND xrcadocdt <= '",l_docdt,"'", #171116-00015#1 add
               "   AND xrcadocdt BETWEEN ? AND '",l_docdt,"'",  #171121-00057#1 add
               "   AND xrcastus = 'Y'"
   PREPARE axrt930_sel_xrcb2 FROM l_sql

   #雜項
   LET l_sql = "SELECT SUM(xrcb103),SUM(xrcb104),SUM(xrcb105),SUM(xrcb113),SUM(xrcb114),SUM(xrcb115) ",          #原幣含稅金額
               "  FROM xrcb_t ",
               "  LEFT JOIN xrca_t ON xrcaent = xrcbent AND xrcadocno = xrcbdocno ",
               " WHERE xrcbent = ",g_enterprise,
               "   AND xrcb002 = ?",
               "   AND xrcb003 = ?",
               "   AND xrca001 IN ('16','19','29')",
               "   AND xrcb023 = 'Y'",  #171110-00035#1 add 
               #"   AND xrcadocdt <= '",l_docdt,"'", #171116-00015#1 add
               "   AND xrcadocdt BETWEEN ? AND '",l_docdt,"'",  #171121-00057#1 add
               "   AND xrcastus = 'Y'"
   PREPARE axrt930_sel_xrcb3 FROM l_sql
   
   LET l_sql = "SELECT MAX(xrenseq)+1 ",
               "  FROM xren_t ",
               " WHERE xrenent = ",g_enterprise,
               "   AND xrendocno = '",p_xremdocno,"'"
   PREPARE axrt930_sel_xrenseq_c FROM l_sql

   #171121-00057#1 add s---
   LET l_sql = " SELECT oodb006,oodb005 FROM oodb_t ",     #191113-00009#1 add oodb005
               "  WHERE oodbent=",g_enterprise," AND oodb002=? ",
               "    AND oodb001=(SELECT ooef019 FROM ooef_t WHERE ooefent=",g_enterprise," AND ooef001=?) "   
   PREPARE axrt930_sel_oodb_c FROM l_sql  
   #171121-00057#1 add e---
   
   FOREACH axrt930_ins_curs 
      INTO l_xrea.xreaent,l_xrea.xreacomp,l_xrea.xreasite,l_xrea.xreald,l_xrea.xrea001,
           l_xrea.xrea002,l_xrea.xrea003,l_xrea.xrea004,l_xrea.xrea005,l_xrea.xrea008,
           l_xrea.xrea009,l_xrea.xrea010,l_xrea.xrea011,l_xrea.xrea012,l_xrea.xrea013,
           l_xrea.xrea014,l_xrea.xrea015,l_xrea.xrea016,l_xrea.xrea017,l_xrea.xrea018,
           l_xrea.xreaorga,l_xrea.xrea020,l_xrea.xrea021,l_xrea.xrea022,
           l_xrea.xrea023,l_xrea.xrea024,l_xrea.xrea025,l_xrea.xrea026,l_xrea.xrea027,
           l_xrea.xrea028,l_xrea.xrea029,l_xrea.xrea030,l_xrea.xrea031,l_xrea.xrea032,
           l_xrea.xrea033,l_xrea.xrea034,l_xrea.xrea035,l_xrea.xrea036,l_xrea.xrea037,
#           l_xrea.xrea038,l_xrea.xrea039,l_xrea.xrea040,l_xrea.xrea041,l_xrea.xrea042,  #191204-00032#2 mark
           l_xrea.xrea038,l_xrea.xrea039,l_xrea.xrea042,  #191204-00032#2 add
           l_xrea.xrea043,l_xrea.xrea100,l_xrea.xrea101,l_xrea.xrea102,l_xrea.xrea122,
           l_xrea.xrea132,l_xrea.xrea045
       
       
       #稅別會科
       SELECT glab005 INTO l_xren.xren042
         FROM glab_t
        WHERE glabent = g_enterprise
          AND glab003 = '8304_03'
          AND glabld  = g_xrem_m.xremld
          AND glab002 = (SELECT xrca007 FROM xrca_t WHERE xrcadocno = l_xrea.xrea005 AND xrcaent = g_enterprise)    
          
       LET l_xrcbseq = ''
       LET l_xrcb002 = ''
       LET l_xrcb003 = ''
       LET l_xrcb007 = 0
       LET l_xrcb101 = 0
       LET l_xrcb103_320 = 0  #l_xrcb105_320-->l_xrcb103_320
       LET l_xrcb105_320 = 0  #170929-00010#9 add
       LET l_sum_xrcb103_2 = 0
       LET l_sum_xrcb104_2 = 0
       LET l_sum_xrcb105_2 = 0    
       LET l_sum_xrcb113_2 = 0
       LET l_sum_xrcb114_2 = 0
       LET l_sum_xrcb115_2 = 0       
       FOREACH axrt930_sel_xrcb_c USING l_xrea.xreald,l_xrea.xrea005
          INTO l_xrcadocdt,l_xrcbseq,l_xrcb002,l_xrcb003,l_xrcb007,l_xrcb101,l_xrcb103_320,l_xrcb105_320,l_xren.xren043,l_xren.xren019,l_xrca013,l_xren.xren040,l_xren.xrenorga  #170929-00010#9 add l_xrcb103_320,l_xrca013  #171121-00057#1 add l_xren.xren040 #171121-00057#1 add #171125-00004#1 add ,l_xren.xrenorga
          
             IF cl_null(l_xrcb007) THEN LET l_xrcb007 = 0 END IF
             IF cl_null(l_xrcb101) THEN LET l_xrcb101 = 0 END IF 
             IF cl_null(l_xrcb103_320) THEN LET l_xrcb103_320 = 0 END IF  #l_xrcb105_320-->l_xrcb103_320 
             IF cl_null(l_xrcb105_320) THEN LET l_xrcb105_320 = 0 END IF  #170929-00010#9 add
             LET l_xrcb007_2 = 0
             LET l_xrcb103 = 0
             LET l_xrcb104 = 0
             LET l_xrcb105 = 0
             LET l_xrcb113 = 0
             LET l_xrcb114 = 0
             LET l_xrcb115 = 0
             IF l_xrea.xrea004 = '01' OR l_xrea.xrea004 = '02' THEN       #出貨
                EXECUTE axrt930_sel_xrcb2 USING l_xrcb002,l_xrcb003,l_xrcadocdt       #出貨單號，項次 #171121-00057#1 add l_xrcadocdt
                   INTO l_xrcb007_2,l_xrcb103,l_xrcb104,l_xrcb105,l_xrcb113,l_xrcb114,l_xrcb115
                IF cl_null(l_xrcb007_2) THEN LET l_xrcb007_2 = 0 END IF  
                IF cl_null(l_xrcb103) THEN LET l_xrcb103 = 0 END IF   
                IF cl_null(l_xrcb104) THEN LET l_xrcb104 = 0 END IF   
                IF cl_null(l_xrcb105) THEN LET l_xrcb105 = 0 END IF   
                IF cl_null(l_xrcb113) THEN LET l_xrcb113 = 0 END IF   
                IF cl_null(l_xrcb114) THEN LET l_xrcb114 = 0 END IF   
                IF cl_null(l_xrcb115) THEN LET l_xrcb115 = 0 END IF 

                #171125-00004#1 add(s)
                LET l_sum_xrcb103_2 = l_sum_xrcb103_2 + l_xrcb103
                LET l_sum_xrcb104_2 = l_sum_xrcb104_2 + l_xrcb104
                LET l_sum_xrcb105_2 = l_sum_xrcb105_2 + l_xrcb105
                LET l_sum_xrcb113_2 = l_sum_xrcb113_2 + l_xrcb113
                LET l_sum_xrcb114_2 = l_sum_xrcb114_2 + l_xrcb114
                LET l_sum_xrcb115_2 = l_sum_xrcb115_2 + l_xrcb115
                #171125-00004#1 add(e)
                
                IF l_xrcb007 = l_xrcb007_2 THEN
                   CONTINUE FOREACH
                ELSE                  
                   LET l_xren.xren103 = l_xrcb101 * (l_xrcb007 - l_xrcb007_2)    #原幣暫估金額
#                   CALL s_tax_count(l_xrea.xreasite,l_xrea.xrea040,l_xren.xren103,l_xrcb007-l_xrcb007_2,l_xrea.xrea100,l_xrea.xrea102)  #191204-00032#2 mark
                   CALL s_tax_count(l_xrea.xreasite,l_xren.xren040,l_xren.xren103,l_xrcb007-l_xrcb007_2,l_xrea.xrea100,l_xrea.xrea102)  #191204-00032#2 add
                   RETURNING l_xren.xren103,l_xren.xren104,l_xren.xren105,l_xren.xren113,l_xren.xren114,l_xren.xren115
                   #171125-00004#1 mark(s)
                   #LET l_sum_xrcb103_2 = l_sum_xrcb103_2 + l_xrcb103
                   #LET l_sum_xrcb104_2 = l_sum_xrcb104_2 + l_xrcb104
                   #LET l_sum_xrcb105_2 = l_sum_xrcb105_2 + l_xrcb105
                   #LET l_sum_xrcb113_2 = l_sum_xrcb113_2 + l_xrcb113
                   #LET l_sum_xrcb114_2 = l_sum_xrcb114_2 + l_xrcb114
                   #LET l_sum_xrcb115_2 = l_sum_xrcb115_2 + l_xrcb115
                   #171125-00004#1 mark(e)
                END IF
             ELSE
                #雜項
                LET l_xrcb103_2 = 0
                LET l_xrcb104_2 = 0
                LET l_xrcb105_2 = 0
                LET l_xrcb113_2 = 0
                LET l_xrcb114_2 = 0
                LET l_xrcb115_2 = 0
                EXECUTE axrt930_sel_xrcb3 USING l_xrea.xrea005,l_xrcbseq,l_xrcadocdt     #暫估單號。項次#171121-00057#1 add l_xrcadocdt
                   INTO l_xrcb103_2,l_xrcb104_2,l_xrcb105_2,l_xrcb113_2,l_xrcb114_2,l_xrcb115_2
                IF cl_null(l_xrcb103_2) THEN LET l_xrcb103_2 = 0 END IF   
                IF cl_null(l_xrcb104_2) THEN LET l_xrcb104_2 = 0 END IF   
                IF cl_null(l_xrcb105_2) THEN LET l_xrcb105_2 = 0 END IF  
                IF cl_null(l_xrcb113_2) THEN LET l_xrcb113_2 = 0 END IF   
                IF cl_null(l_xrcb114_2) THEN LET l_xrcb114_2 = 0 END IF   
                IF cl_null(l_xrcb115_2) THEN LET l_xrcb115_2 = 0 END IF  
                
                #171125-00004#1 add(s)
                LET l_sum_xrcb103_2 = l_sum_xrcb103_2 + l_xrcb103
                LET l_sum_xrcb104_2 = l_sum_xrcb104_2 + l_xrcb104
                LET l_sum_xrcb105_2 = l_sum_xrcb105_2 + l_xrcb105
                LET l_sum_xrcb113_2 = l_sum_xrcb113_2 + l_xrcb113
                LET l_sum_xrcb114_2 = l_sum_xrcb114_2 + l_xrcb114
                LET l_sum_xrcb115_2 = l_sum_xrcb115_2 + l_xrcb115
                #171125-00004#1 add(e)
                
                IF l_xrcb103_320 = l_xrcb103_2 THEN #l_xrcb105_320-->l_xrcb103_320 
                   CONTINUE FOREACH
                ELSE
                   #170929-00010#9 add s--- 
                   EXECUTE axrt930_sel_oodb_c USING l_xren.xren040,l_xrea.xreacomp INTO l_xren.xren041,l_xrca013   #191113-00009#1 add 
                   IF l_xrca013 = 'Y' THEN
                      LET l_amt = l_xrcb105_320-l_xrcb105_2
                   ELSE
                      LET l_amt = l_xrcb103_320-l_xrcb103_2
                   END IF 
                   #170929-00010#9 add e---                 
                   #CALL s_tax_count(l_xrea.xreasite,l_xrea.xrea040,l_xrcb103_320-l_xrcb103_2,1,l_xrea.xrea100,l_xrea.xrea102) #l_xrcb105_320-->l_xrcb103_320 #170929-00010#9 mark
#                   CALL s_tax_count(l_xrea.xreasite,l_xrea.xrea040,l_amt,1,l_xrea.xrea100,l_xrea.xrea102) #l_xrcb105_320-->l_xrcb103_320  #170929-00010#9 add  #191204-00032#2 mark
                   CALL s_tax_count(l_xrea.xreasite,l_xren.xren040,l_amt,1,l_xrea.xrea100,l_xrea.xrea102) #191204-00032#2 add
                   RETURNING l_xren.xren103,l_xren.xren104,l_xren.xren105,l_xren.xren113,l_xren.xren114,l_xren.xren115  
                   #171125-00004#1 mark(s)
                   #LET l_sum_xrcb103_2 = l_sum_xrcb103_2 + l_xrcb103_2
                   #LET l_sum_xrcb104_2 = l_sum_xrcb104_2 + l_xrcb104_2
                   #LET l_sum_xrcb105_2 = l_sum_xrcb105_2 + l_xrcb105_2
                   #LET l_sum_xrcb113_2 = l_sum_xrcb113_2 + l_xrcb113_2
                   #LET l_sum_xrcb114_2 = l_sum_xrcb114_2 + l_xrcb114_2
                   #LET l_sum_xrcb115_2 = l_sum_xrcb115_2 + l_xrcb115_2 
                   #171125-00004#1 mark(e)
                END IF
             END IF
             LET l_xren.xrenseq = 0
             EXECUTE axrt930_sel_xrenseq_c INTO l_xren.xrenseq
             IF cl_null(l_xren.xrenseq) OR l_xren.xrenseq = 0 THEN LET l_xren.xrenseq = 1 END IF 
             LET l_xren.xren006 = l_xrcbseq             
      #170929-00010#1 add e---       
      LET l_xren.xrenent = g_enterprise 
      LET l_xren.xrendocno = p_xremdocno
      LET l_xren.xren001 = l_xrea.xrea001    #年度
      LET l_xren.xren002 = l_xrea.xrea002    #期別
      LET l_xren.xren003 = l_xrea.xrea003    #來源模
      LET l_xren.xren004 = l_xrea.xrea004    #帳款單性質
      LET l_xren.xren005 = l_xrea.xrea005    #單據號碼
#      LET l_xren.xren006 = l_xrea.xrea006   #170929-00010#5 mark
#      LET l_xren.xren007 = l_xrea.xrea007   #170929-00010#5 mark
      LET l_xren.xren007 = 0                 #170929-00010#5 add 
      LET l_xren.xren008 = l_xrea.xrea008
      LET l_xren.xren009 = l_xrea.xrea009
      LET l_xren.xren010 = l_xrea.xrea010
      LET l_xren.xren011 = l_xrea.xrea011
      LET l_xren.xren012 = l_xrea.xrea012
      LET l_xren.xren013 = l_xrea.xrea013 
      LET l_xren.xren014 = l_xrea.xrea014 
      LET l_xren.xren015 = l_xrea.xrea015 
      LET l_xren.xren016 = l_xrea.xrea016 
      LET l_xren.xren017 = l_xrea.xrea017 
      LET l_xren.xren018 = l_xrea.xrea018 
#      LET l_xren.xren019 = l_xrea.xrea019    #應收付科目 #170929-00010#5 mark
      #LET l_xren.xrenorga = l_xrea.xreaorga  #171125-00004#1 mark #直接抓axrt320的來源組織來用
      LET l_xren.xren020 = l_xrea.xrea020 
      LET l_xren.xren021 = l_xrea.xrea021 
      LET l_xren.xren022 = l_xrea.xrea022 
      LET l_xren.xren023 = l_xrea.xrea023 
      LET l_xren.xren024 = l_xrea.xrea024 
      LET l_xren.xren025 = l_xrea.xrea025 
      LET l_xren.xren026 = l_xrea.xrea026 
      LET l_xren.xren027 = l_xrea.xrea027 
      LET l_xren.xren028 = l_xrea.xrea028 
      LET l_xren.xren029 = l_xrea.xrea029 
      LET l_xren.xren030 = l_xrea.xrea030 
      LET l_xren.xren031 = l_xrea.xrea031 
      LET l_xren.xren032 = l_xrea.xrea032
      LET l_xren.xren033 = l_xrea.xrea033
#      LET l_xren.xren040 = l_xrea.xrea040  #171121-00057#1 mark
#      LET l_xren.xren041 = l_xrea.xrea041  #171121-00057#1 mark
      EXECUTE axrt930_sel_oodb_c USING l_xren.xren040,l_xrea.xreacomp INTO l_xren.xren041,l_xrca013 #171121-00057#1 add  #191113-00009#1 add l_xrca013
      LET l_xren.xren100 = l_xrea.xrea100 
      LET l_xren.xren101 = l_xrea.xrea102 #重評匯率 
#      LET l_xren.xren103 = l_xrea.xrea104  #170929-00010#5 mark
#      LET l_xren.xren104 = l_xrea.xrea105  #170929-00010#5 mark
#      LET l_xren.xren105 = l_xrea.xrea106  #170929-00010#5 mark
#      LET l_xren.xren113 = l_xrea.xrea114  #170929-00010#5 mark
#      LET l_xren.xren114 = l_xrea.xrea115  #170929-00010#5 mark
#      LET l_xren.xren115 = l_xrea.xrea116  #170929-00010#5 mark
      LET l_xren.xren121 = l_xrea.xrea122 #重評匯率
      LET l_xren.xren131 = l_xrea.xrea132 #重評匯率

      #161102-00015#5 --s add
      IF cl_null(l_xren.xren009) THEN LET l_xren.xren009 = " " END IF  #帳款對象
      IF cl_null(l_xren.xren010) THEN LET l_xren.xren010 = " " END IF  #收款對象
      IF cl_null(l_xren.xren011) THEN LET l_xren.xren011 = " " END IF  #部門
      IF cl_null(l_xren.xren012) THEN LET l_xren.xren012 = " " END IF  #責任中心
      IF cl_null(l_xren.xren013) THEN LET l_xren.xren013 = " " END IF  #區域
      IF cl_null(l_xren.xren014) THEN LET l_xren.xren014 = " " END IF  #客群
      IF cl_null(l_xren.xren015) THEN LET l_xren.xren015 = " " END IF  #產品類別
      IF cl_null(l_xren.xren016) THEN LET l_xren.xren016 = " " END IF  #人員
      IF cl_null(l_xren.xren017) THEN LET l_xren.xren017 = " " END IF  #專案編號
      IF cl_null(l_xren.xren018) THEN LET l_xren.xren018 = " " END IF  #WBS編號
      IF cl_null(l_xren.xren020) THEN LET l_xren.xren020 = " " END IF  #經營方式
      IF cl_null(l_xren.xren021) THEN LET l_xren.xren021 = " " END IF  #通路
      IF cl_null(l_xren.xren022) THEN LET l_xren.xren022 = " " END IF  #品牌
      IF cl_null(l_xren.xren023) THEN LET l_xren.xren023 = " " END IF  #自由核算項一
      IF cl_null(l_xren.xren024) THEN LET l_xren.xren024 = " " END IF  #自由核算項二
      IF cl_null(l_xren.xren025) THEN LET l_xren.xren025 = " " END IF  #自由核算項三
      IF cl_null(l_xren.xren026) THEN LET l_xren.xren026 = " " END IF  #自由核算項四
      IF cl_null(l_xren.xren027) THEN LET l_xren.xren027 = " " END IF  #自由核算項五
      IF cl_null(l_xren.xren028) THEN LET l_xren.xren028 = " " END IF  #自由核算項六
      IF cl_null(l_xren.xren029) THEN LET l_xren.xren029 = " " END IF  #自由核算項七
      IF cl_null(l_xren.xren030) THEN LET l_xren.xren030 = " " END IF  #自由核算項八
      IF cl_null(l_xren.xren031) THEN LET l_xren.xren031 = " " END IF  #自由核算項九
      IF cl_null(l_xren.xren032) THEN LET l_xren.xren032 = " " END IF  #自由核算項十
      #161102-00015#5 --e add

      #161128-00061#5---modify----begin------------- 
      #INSERT INTO xren_t VALUES (l_xren.*)
      INSERT INTO xren_t (xrenent,xrendocno,xrenseq,xren001,xren002,xren003,xren004,xren005,xren006,xren007,
                          xren008,xren009,xren010,xren011,xren012,xren013,xren014,xren015,xren016,xren017,
                          xren018,xren019,xrenorga,xren020,xren021,xren022,xren023,xren024,xren025,xren026,
                          xren027,xren028,xren029,xren030,xren031,xren032,xren033,xren040,xren041,xren042,
                          xren043,xren100,xren101,xren103,xren104,xren105,xren113,xren114,xren115,xren121,
                          xren123,xren124,xren125,xren131,xren133,xren134,xren135)
      VALUES (l_xren.xrenent,l_xren.xrendocno,l_xren.xrenseq,l_xren.xren001,l_xren.xren002,l_xren.xren003,l_xren.xren004,l_xren.xren005,l_xren.xren006,l_xren.xren007,
              l_xren.xren008,l_xren.xren009,l_xren.xren010,l_xren.xren011,l_xren.xren012,l_xren.xren013,l_xren.xren014,l_xren.xren015,l_xren.xren016,l_xren.xren017,
              l_xren.xren018,l_xren.xren019,l_xren.xrenorga,l_xren.xren020,l_xren.xren021,l_xren.xren022,l_xren.xren023,l_xren.xren024,l_xren.xren025,l_xren.xren026,
              l_xren.xren027,l_xren.xren028,l_xren.xren029,l_xren.xren030,l_xren.xren031,l_xren.xren032,l_xren.xren033,l_xren.xren040,l_xren.xren041,l_xren.xren042,
              l_xren.xren043,l_xren.xren100,l_xren.xren101,l_xren.xren103,l_xren.xren104,l_xren.xren105,l_xren.xren113,l_xren.xren114,l_xren.xren115,l_xren.xren121,
              l_xren.xren123,l_xren.xren124,l_xren.xren125,l_xren.xren131,l_xren.xren133,l_xren.xren134,l_xren.xren135)
      #161128-00061#5---modify----end------------- 
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins xren_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
       #170929-00010#1 add s---
       END FOREACH     
       #axrt320
       LET l_sum_xrcb103 = 0
       LET l_sum_xrcb104 = 0
       LET l_sum_xrcb105 = 0
       LET l_sum_xrcb113 = 0
       LET l_sum_xrcb114 = 0
       LET l_sum_xrcb115 = 0
       SELECT SUM(xrcb103),SUM(xrcb104),SUM(xrcb105),SUM(xrcb113),SUM(xrcb114),SUM(xrcb115)
         INTO l_sum_xrcb103,l_sum_xrcb104,l_sum_xrcb105,l_sum_xrcb113,l_sum_xrcb114,l_sum_xrcb115
         FROM xrcb_t
         LEFT JOIN xrca_t ON xrcaent = xrcbent AND xrcadocno = xrcbdocno
        WHERE xrcbdocno = l_xrea.xrea005
          AND xrca001 = l_xrea.xrea004
          AND xrcbent = g_enterprise
       
       IF cl_null(l_sum_xrcb103) THEN LET l_sum_xrcb103 = 0 END IF
       IF cl_null(l_sum_xrcb104) THEN LET l_sum_xrcb104 = 0 END IF
       IF cl_null(l_sum_xrcb105) THEN LET l_sum_xrcb105 = 0 END IF   
       IF cl_null(l_sum_xrcb113) THEN LET l_sum_xrcb113 = 0 END IF
       IF cl_null(l_sum_xrcb114) THEN LET l_sum_xrcb114 = 0 END IF
       IF cl_null(l_sum_xrcb115) THEN LET l_sum_xrcb115 = 0 END IF
       
       #181227-00068#1---add  s
       IF cl_get_para(g_enterprise,l_xrea.xreacomp,'S-FIN-2005') = 'N' THEN

        LET l_sum_xrcb103_2 = 0
        LET l_sum_xrcb104_2 = 0
        LET l_sum_xrcb105_2 = 0
        LET l_sum_xrcb113_2 = 0
        LET l_sum_xrcb114_2 = 0
        LET l_sum_xrcb115_2 = 0
       SELECT SUM(xrea104),SUM(xrea105),SUM(xrea103),SUM(xrea114),SUM(xrea115),SUM(xrea113)
         INTO l_sum_xrcb103_2,l_sum_xrcb104_2,l_sum_xrcb105_2,l_sum_xrcb113_2,l_sum_xrcb114_2,l_sum_xrcb115_2      
         FROM xrea_t
        WHERE xreaent = g_enterprise
          AND xrea005 = l_xrea.xrea005
          AND xrea001 = l_xrea.xrea001
          AND xrea002 = l_xrea.xrea002
          AND xreald = l_xrem.xremld
       
       IF cl_null(l_sum_xrcb103_2) THEN LET l_sum_xrcb103_2 = 0 END IF
       IF cl_null(l_sum_xrcb104_2) THEN LET l_sum_xrcb104_2 = 0 END IF
       IF cl_null(l_sum_xrcb105_2) THEN LET l_sum_xrcb105_2 = 0 END IF
       IF cl_null(l_sum_xrcb113_2) THEN LET l_sum_xrcb113_2 = 0 END IF
       IF cl_null(l_sum_xrcb114_2) THEN LET l_sum_xrcb114_2 = 0 END IF
       IF cl_null(l_sum_xrcb115_2) THEN LET l_sum_xrcb115_2 = 0 END IF
       
       #原立數- 月結未沖數 = 實际己沖銷數
       LET l_sum_xrcb103_2 = l_sum_xrcb103 - l_sum_xrcb103_2   
       LET l_sum_xrcb104_2 = l_sum_xrcb104 - l_sum_xrcb104_2
       LET l_sum_xrcb105_2 = l_sum_xrcb105 - l_sum_xrcb105_2
       LET l_sum_xrcb113_2 = l_sum_xrcb113 - l_sum_xrcb113_2
       LET l_sum_xrcb114_2 = l_sum_xrcb114 - l_sum_xrcb114_2
       LET l_sum_xrcb115_2 = l_sum_xrcb115 - l_sum_xrcb115_2
   
       END IF
       ##181227-00068#1---add    e
      
       #axrt930      
       LET l_sum_xren103 = 0
       LET l_sum_xren104 = 0
       LET l_sum_xren105 = 0
       LET l_sum_xren113 = 0
       LET l_sum_xren114 = 0
       LET l_sum_xren115 = 0
       SELECT SUM(xren103),SUM(xren104),SUM(xren105),SUM(xren113),SUM(xren114),SUM(xren115)
         INTO l_sum_xren103,l_sum_xren104,l_sum_xren105,l_sum_xren113,l_sum_xren114,l_sum_xren115      
         FROM xren_t
        WHERE xrenent = g_enterprise
          AND xrendocno = p_xremdocno
          AND xren005 = l_xrea.xrea005
          AND xren004 = l_xrea.xrea004 
       
       IF cl_null(l_sum_xren103) THEN LET l_sum_xren103 = 0 END IF
       IF cl_null(l_sum_xren104) THEN LET l_sum_xren104 = 0 END IF
       IF cl_null(l_sum_xren105) THEN LET l_sum_xren105 = 0 END IF 
       IF cl_null(l_sum_xren113) THEN LET l_sum_xren113 = 0 END IF
       IF cl_null(l_sum_xren114) THEN LET l_sum_xren114 = 0 END IF
       IF cl_null(l_sum_xren115) THEN LET l_sum_xren115 = 0 END IF 
       
       LET l_diff_103 = 0
       LET l_diff_104 = 0
       LET l_diff_105 = 0
       LET l_diff_113 = 0
       LET l_diff_114 = 0
       LET l_diff_115 = 0
       LET l_diff_103 = l_sum_xrcb103 - (l_sum_xren103 + l_sum_xrcb103_2)
       LET l_diff_104 = l_sum_xrcb104 - (l_sum_xren104 + l_sum_xrcb104_2)
       LET l_diff_105 = l_sum_xrcb105 - (l_sum_xren105 + l_sum_xrcb105_2)
       LET l_diff_113 = l_sum_xrcb113 - (l_sum_xren113 + l_sum_xrcb113_2)
       LET l_diff_114 = l_sum_xrcb114 - (l_sum_xren114 + l_sum_xrcb114_2)
       LET l_diff_115 = l_sum_xrcb115 - (l_sum_xren115 + l_sum_xrcb115_2)
       
       IF g_sfin2012 = '1' THEN            #暫估不含稅
          UPDATE xren_t
             SET xren103 = xren103 + l_diff_103,
                 xren104 = 0,
                 xren105 = xren103 + l_diff_103,
                 xren113 = xren113 + l_diff_113,
                 xren114 = 0,
                 xren115 = xren113 + l_diff_113
           WHERE xrenent = g_enterprise
             AND xrendocno = p_xremdocno
             AND xren004 = l_xrea.xrea004
             AND xren005 = l_xrea.xrea005
             AND xren103 = (SELECT MAX(xren103) FROM xren_t
                             WHERE xrenent = g_enterprise
                               AND xrendocno = p_xremdocno
                               AND xren004 = l_xrea.xrea004
                               AND xren005 = l_xrea.xrea005) 
             AND rownum = 1      #181227-00068#1---add按照上面的条件可能多笔一样的最大值，所以需要加上这个条
          #PGS(D)-01531 add s---
          #PGS(D)-01531 add E---
       ELSE
          UPDATE xren_t
             SET xren103 = xren103 + l_diff_103,
                 xren104 = xren104 + l_diff_104,
                 xren105 = xren105 + l_diff_105,
                 xren113 = xren113 + l_diff_113,
                 xren114 = xren114 + l_diff_114,
                 xren115 = xren115 + l_diff_115
           WHERE xrenent = g_enterprise
             AND xrendocno = p_xremdocno
             AND xren004 = l_xrea.xrea004
             AND xren005 = l_xrea.xrea005
             AND xren103 = (SELECT MAX(xren103) FROM xren_t
                             WHERE xrenent = g_enterprise
                               AND xrendocno = p_xremdocno
                               AND xren004 = l_xrea.xrea004
                               AND xren005 = l_xrea.xrea005) 
             AND rownum = 1      #181227-00068#1---add  按照上面的条件可能多笔一样的最大值，所以需要加上这个条                               
          #PGS(D)-01531 add s---
          #PGS(D)-01531 add E---
       END IF       
       IF SQLCA.SQLcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "upd xren_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET r_success = FALSE
       END IF                            
       #170929-00010#1 add e---   
   END FOREACH
   
   SELECT COUNT(*) INTO l_count
     FROM xren_t
    WHERE xrenent   = g_enterprise
      AND xrendocno = p_xremdocno
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   IF l_count = 0 THEN
       INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axc-00530'
         LET g_errparam.extend = "ins xren_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 检查是否存在资料，询问是否重产
# Memo...........:
# Usage..........: CALL axrt930_01_chk()
# Input parameter:  
# Date & Author..: 2014/11/4 By 01531
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt930_01_chk()
#DEFINE r_success  LIKE type_t.chr1   #190611-00014#1 mark
DEFINE r_success   LIKE type_t.num5   #190611-00014#1 add 
DEFINE l_cnt       LIKE type_t.num5
DEFINE l_cnt1      LIKE type_t.num5
DEFINE l_xremdocno LIKE xrem_t.xremdocno
DEFINE l_xremld    LIKE xrem_t.xremld
DEFINE l_xremdocdt LIKE xrem_t.xremdocdt
DEFINE l_glaa121   LIKE glaa_t.glaa121

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   SELECT glaa121 INTO l_glaa121 FROM glaa_t 
    WHERE glaaent = g_enterprise AND glaald = g_xrem_m.xremld
    
   #檢查是否存在xrem_t中,根據帳套、年度、期別
   #1.若已存在产生传票的资料，提示已存在资料
   LET l_cnt = 0
#mark by aiqq---s
#   SELECT COUNT(*) INTO l_cnt FROM xrem_t
#    WHERE xrement = g_enterprise AND xrem003 = 'AR'
#      AND xremld  = g_xrem_m.xremld 
#      AND xrem001 = g_xrem_m.xrem001 
#      AND xrem002 = g_xrem_m.xrem002
#      AND xremstus = 'Y'
#      AND xrem005 IS NOT NULL 
#mark by aiqq---s

    #add by aiqq---s
    IF g_argv1 = '1' THEN
      SELECT COUNT(*) INTO l_cnt FROM xrem_t
       WHERE xrement = g_enterprise AND xrem003 = 'AR'
         AND xremld  = g_xrem_m.xremld
         AND xrem001 = g_xrem_m.xrem001
         AND xrem002 = g_xrem_m.xrem002
         AND xremstus = 'Y'
         AND xrem005 IS NOT NULL
         AND xrem006 = '1'
         AND xremsite = g_xrem_m.xremsite #171121-00057#1 add
   ELSE
      SELECT COUNT(*) INTO l_cnt FROM xrem_t
       WHERE xrement = g_enterprise AND xrem003 = 'AR'
         AND xremld  = g_xrem_m.xremld
         AND xrem001 = g_xrem_m.xrem001
         AND xrem002 = g_xrem_m.xrem002
         AND xremstus = 'Y'
         AND xrem005 IS NOT NULL
         AND xrem006 = '2'
         AND xremsite = g_xrem_m.xremsite #171121-00057#1 add
   END IF
  #add by aiqq---e
   IF l_cnt > 0 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "axr-00229"
      LET g_errparam.popup  = FALSE 
      CALL cl_err()  
      LET r_success = FALSE      
   END IF   
   
   #2.若不存在产生传票的资料，询问是否删除重产
   LET l_cnt1 = 0
   SELECT COUNT(*) INTO l_cnt1 FROM xrem_t
    WHERE xrement = g_enterprise AND xrem003 = 'AR'
      AND xremld  = g_xrem_m.xremld 
      AND xrem001 = g_xrem_m.xrem001 
      AND xrem002 = g_xrem_m.xrem002
      AND (xrem005 IS NULL OR xrem005 = ' ')  
      AND xremstus<>'X'    #20150526 add lujh
      AND xrem006 = g_argv1 #160125-00005#9 Add
      AND xremsite = g_xrem_m.xremsite  #171121-00057#1 add
   IF l_cnt1 > 0 THEN 
      IF cl_ask_confirm('axr-00230') THEN   #是，删除资料新增
         LET r_success = TRUE    
      
         #获取单据编号
         SELECT xremdocno,xremld,xremdocdt INTO l_xremdocno,l_xremld,l_xremdocdt
           FROM xrem_t
          WHERE xrement = g_enterprise
            AND xremld  = g_xrem_m.xremld 
            AND xrem001 = g_xrem_m.xrem001 
            AND xrem002 = g_xrem_m.xrem002
            AND xrem006 = g_argv1 #160125-00005#9 Add
            AND xrem003 = 'AR'
            AND xremsite = g_xrem_m.xremsite #171121-00057#1 add
         
         #删除单头
         DELETE FROM xrem_t  
          WHERE xrement = g_enterprise
            AND xremdocno = l_xremdocno
            AND xremld  = g_xrem_m.xremld 
            AND xrem001 = g_xrem_m.xrem001 
            AND xrem002 = g_xrem_m.xrem002
            AND xrem003 = 'AR' 
            AND xremsite = g_xrem_m.xremsite   #171121-00057#1 add       
            
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "del xrem" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
         
            LET r_success = FALSE
         END IF    
        
         #删除单身
         DELETE FROM xren_t          
          WHERE xrenent = g_enterprise
            AND xrendocno = l_xremdocno
            AND xren001 = g_xrem_m.xrem001 
            AND xren002 = g_xrem_m.xrem002
            AND xren003 = 'AR'
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "del xren" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
         
            LET r_success = FALSE
         END IF 
         IF l_glaa121 = 'Y' THEN  ##删除分录底稿
            IF g_argv[1] = '1' THEN
               CALL s_pre_voucher_del('AR','R50',g_xrem_m.xremld,g_xrem_m.xremdocno) RETURNING r_success
            ELSE
               CALL s_pre_voucher_del('AR','R51',g_xrem_m.xremld,g_xrem_m.xremdocno) RETURNING r_success
            END IF 
         END IF
         ##删除单号
         IF NOT s_aooi200_fin_del_docno(l_xremld,l_xremdocno,l_xremdocdt) THEN
            LET r_success=FALSE
         END IF 
      ELSE
         LET r_success = FALSE
      END IF
   END IF 
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 編輯完單據立即審核
# Memo...........:
# Usage..........: CALL axrt930_01_immediately_conf()
#                  RETURNING r_success
# Date & Author..: 2015/11/30 By aiqq
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt930_01_immediately_conf()
   DEFINE l_xremcomp        LIKE xrem_t.xremcomp
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_doc_success     LIKE type_t.num5
   DEFINE l_slip            LIKE ooba_t.ooba002
   DEFINE l_dfin0031        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE r_success         LIKE type_t.chr1
   DEFINE l_efin5001        LIKE type_t.chr1
   DEFINE l_ooba002         LIKE ooba_t.ooba002

   LET r_success = 'Y' 
   #無資料直接返回不做處理
   IF cl_null(g_xrem_m.xremld)  THEN 
      LET r_success='N'
      RETURN r_success
   END IF   
   
   LET l_xremcomp = null
   SELECT glaacomp INTO l_xremcomp FROM glaa_t 
                                  WHERE glaaent = g_enterprise 
                                    AND glaald =  g_xrem_m.xremld
   #無資料直接返回不做處理                                 
   IF cl_null(l_xremcomp)  THEN 
      LET r_success='N'
      RETURN r_success   
   END IF
   #無資料直接返回不做處理
   IF cl_null(g_xrem_m.xremdocno) THEN 
      LET r_success='N'
      RETURN r_success   
   END IF   
   
   CALL cl_err_collect_init()
   CALL s_transaction_begin()
   
   LET l_doc_success = TRUE 
   
   CALL s_aooi200_fin_get_slip(g_xrem_m.xremdocno) RETURNING l_doc_success,l_ooba002
                                    
   CALL s_fin_chk_E5001(g_xrem_m.xremld,l_xremcomp,l_ooba002) RETURNING l_efin5001
   IF l_efin5001 = 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axr-00346'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL s_transaction_end('N','0') #171006-00010#50 add
      CALL cl_err()
      CALL cl_err_collect_show()
      #CALL s_transaction_end('N','0') #171006-00010#50 mark
      LET r_success = 'N'
      RETURN r_success 
   END IF 
   CALL s_axrt940_conf_chk_em(g_xrem_m.xremdocno) RETURNING l_doc_success 
   IF l_doc_success = TRUE THEN
      CALL s_axrt940_conf_upd_em(g_xrem_m.xremdocno) RETURNING l_doc_success
   END IF   
  
  #異動狀態碼欄位/修改人/修改日期
   UPDATE xrem_t SET xremstus = 'Y',
                     xremmodid= g_user
    WHERE xrement = g_enterprise AND xremld = g_xrem_m.xremld
      AND xremdocno = g_xrem_m.xremdocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      LET l_doc_success = FALSE
   END IF
  
   IF l_doc_success THEN
      CALL s_transaction_end('Y',1)
      LET r_success = 'Y'
   ELSE
      LET r_success = 'N'
      CALL s_transaction_end('N',1)
   END IF
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 審核完單據立即拋轉傳票
# Memo...........:
# Usage..........: CALL axrt930_01_immediately_gen()
# Date & Author..: 2015/11/30 By aiqq
# Modify.........:
################################################################################
PRIVATE FUNCTION axrt930_01_immediately_gen()
   DEFINE l_xremcomp        LIKE xrem_t.xremcomp
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_doc_success     LIKE type_t.num5
   DEFINE l_slip            LIKE ooba_t.ooba002
   DEFINE l_dfin0032        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE l_glap001         LIKE glap_t.glap001
   DEFINE l_prog            STRING 
   DEFINE ls_js             STRING
   DEFINE l_glaa024         LIKE glaa_t.glaa024
   DEFINE l_ooac004         LIKE ooac_t.ooac004
   DEFINE l_xremstus        LIKE xrem_t.xremstus
   DEFINE l_wc_t            STRING
   DEFINE l_glaa121         LIKE glaa_t.glaa121
   DEFINE l_success_t       LIKE type_t.num5
   DEFINE r_start_no        LIKE glap_t.glapdocno
   DEFINE r_end_no          LIKE glap_t.glapdocno   
   DEFINE l_s               LIKE type_t.chr1  
   DEFINE l_glca002         LIKE glca_t.glca002
   DEFINE l_xrem006         LIKE xrem_t.xrem006
   DEFINE r_success         LIKE type_t.num5
   DEFINE l_xrem005         LIKE xrem_t.xrem005
  
   
   IF cl_null(g_xrem_m.xremld)    THEN RETURN END IF   #無資料直接返回不做處理
   
   LET l_xremcomp = null
   SELECT glaacomp INTO l_xremcomp FROM glaa_t 
                                  WHERE glaaent = g_enterprise 
                                    AND glaald =  g_xrem_m.xremld
                                    
   IF cl_null(l_xremcomp)  THEN RETURN END IF   #無資料直接返回不做處理
   IF cl_null(g_xrem_m.xremdocno) THEN RETURN END IF   #無資料直接返回不做處理

    #取得單別
    CALL s_aooi200_fin_get_slip(g_xrem_m.xremdocno) RETURNING l_success,l_slip
    LET l_glaa024 = NULL
    LET l_glaa121 = NULL
    SELECT glaa024,glaa121 INTO l_glaa024,l_glaa121 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_xrem_m.xremld
   
    SELECT ooac004 INTO l_ooac004 FROM ooac_t WHERE ooacent = g_enterprise
                                   AND ooac001 = l_glaa024
                                   AND ooac002 = l_slip
                                   AND ooac003 = 'D-FIN-2002'
    
    SELECT glca002 INTO l_glca002 FROM glca_t WHERE glcaent = g_enterprise AND glcald = g_xrem_m.xremld AND glca001 = 'AR'    
    IF l_glca002 = '2' THEN
       LET l_prog = 'aglt350'
    ELSE
       LET l_prog = 'aglt310'
    END IF
    
    IF NOT cl_null(l_ooac004) THEN 
       CALL s_transaction_begin()
       LET l_wc_t = "xremdocno = '",g_xrem_m.xremdocno,"'"
       SELECT xrem006 INTO l_xrem006 FROM xrem_t 
                                    WHERE xrement=g_enterprise 
                                    AND xremdocno=g_xrem_m.xremdocno
                                    
       IF l_xrem006 = '1' THEN 
          IF l_glaa121 = 'Y' THEN 
             LET l_wc_t = "glgbdocno = '",g_xrem_m.xremdocno,"'"
             CALL s_pre_voucher_ins_glap('AR','R50',g_xrem_m.xremld,g_xrem_m.xremdocdt,l_ooac004,'1',l_wc_t) 
             RETURNING r_success,r_start_no,r_end_no
          ELSE                
             CALL s_axrt940_gen_ar('5',g_xrem_m.xremld,g_xrem_m.xremdocdt,l_ooac004,1,l_wc_t,'N') 
             RETURNING r_success,r_start_no,r_end_no
          END IF
       ELSE #axrt931
          IF l_glaa121 = 'Y' THEN 
             LET l_wc_t = "glgbdocno = '",g_xrem_m.xremdocno,"'"
             CALL s_pre_voucher_ins_glap('AR','R51',g_xrem_m.xremld,g_xrem_m.xremdocdt,g_xrem_m.xremld,'1',l_wc_t) 
             RETURNING r_success,r_start_no,r_end_no
          ELSE  
             CALL s_axrt940_gen_ar('6',g_xrem_m.xremld,g_xrem_m.xremdocdt,g_xrem_m.xremld,1,l_wc_t,'N') 
             RETURNING r_success,r_start_no,r_end_no
          END IF
       END IF
       
       IF r_success = TRUE AND NOT cl_null(r_start_no) THEN
          UPDATE xrem_t SET xrem005=r_start_no 
                      WHERE xrement=g_enterprise 
                      AND xremdocno=g_xrem_m.xremdocno
          IF SQLCA.SQLCODE THEN
             INITIALIZE g_errparam TO NULL 
             LET g_errparam.extend = "update xrem_t"
             LET g_errparam.code   = SQLCA.SQLCODE
             LET g_errparam.popup  = TRUE      
             CALL cl_err()
             LET r_success = FALSE 
          END IF 
       END IF
       
    ELSE 
        CALL axrt940_02(g_xrem_m.xremld,l_xremcomp,g_xrem_m.xremdocno,'2') RETURNING l_xrem005
        IF NOT cl_null(l_xrem005) THEN
           INITIALIZE g_errparam TO NULL 
           LET g_errparam.extend = g_xrem_m.xremdocno
           LET g_errparam.code   = "axr-00119"
           LET g_errparam.popup  = FALSE      
           CALL cl_err()    
        ELSE 
           INITIALIZE g_errparam TO NULL 
           LET g_errparam.extend = g_xrem_m.xremdocno
           LET g_errparam.code   = "axr-00120"
           LET g_errparam.popup  = FALSE      
           CALL cl_err()    
           LET l_xrem005=''
        END IF
    END IF  
END FUNCTION

 
{</section>}
 
