#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="azzi918.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0012(2017-09-21 10:26:49), PR版次:0012(2021-03-02 17:10:59)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000324
#+ Filename...: azzi918
#+ Description: 程式串Javamail設定作業
#+ Creator....: 01856(2014-04-25 16:47:28)
#+ Modifier...: 08146 -SD/PR- 14587
 
{</section>}
 
{<section id="azzi918.global" type="s" >}
#應用 i01 樣板自動產生(Version:80)
#add-point:填寫註解說明 name="global.memo"
#160318-00025#14 2016/04/18 By 07673     將重複內容的錯誤訊息置換為公用錯誤訊息
#170309-00019#1  2017/03/09 By jrg542    mail 帳號同步至其他企業編號功能
#170313-00006#1  2017/03/13 By jrg542    補修正 mail 帳號 同步其他企業編號功能
#170921-00002#1  2017/09/22 By 08146     增加測試寄送mail 按鈕
#180727-00003#1  2018/07/27 By 08146     修正測試寄送e-mail 功能
#210218-00005#1  2021/03/02 By 14587     修正切換DB造成的資料缺漏問題，註解掉切換DB的部分
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:55) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:55) --- end --- 
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
IMPORT JAVA com.fourjs.fgl.lang.FglRecord  #(ver:56) add
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"  
#(ver:56) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:56) --- add end ---
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE TYPE type_g_gzzm_m RECORD
       gzzm001 LIKE gzzm_t.gzzm001, 
   gzzm001_desc LIKE gzzal_t.gzzal003, 
   gzzm003 LIKE gzzm_t.gzzm003, 
   gzzm004 LIKE gzzm_t.gzzm004, 
   gzzm002 LIKE gzzm_t.gzzm002, 
   gzzm005 LIKE gzzm_t.gzzm005, 
   gzzm006 LIKE gzzm_t.gzzm006, 
   gzzm007 LIKE gzzm_t.gzzm007, 
   gzzm010 LIKE gzzm_t.gzzm010, 
   gzzm008 LIKE gzzm_t.gzzm008, 
   gzzm009 LIKE gzzm_t.gzzm009, 
   gzzm011 LIKE gzzm_t.gzzm011, 
   gzzmstus LIKE gzzm_t.gzzmstus, 
   gzzmownid LIKE gzzm_t.gzzmownid, 
   gzzmownid_desc LIKE ooag_t.ooag011, 
   gzzmowndp LIKE gzzm_t.gzzmowndp, 
   gzzmowndp_desc LIKE ooefl_t.ooefl003, 
   gzzmcrtid LIKE gzzm_t.gzzmcrtid, 
   gzzmcrtid_desc LIKE ooag_t.ooag011, 
   gzzmcrtdp LIKE gzzm_t.gzzmcrtdp, 
   gzzmcrtdp_desc LIKE ooefl_t.ooefl003, 
   gzzmcrtdt LIKE gzzm_t.gzzmcrtdt, 
   gzzmmodid LIKE gzzm_t.gzzmmodid, 
   gzzmmodid_desc LIKE ooag_t.ooag011, 
   gzzmmoddt LIKE gzzm_t.gzzmmoddt
       END RECORD
 
DEFINE g_browser    DYNAMIC ARRAY OF RECORD  #查詢方案用陣列 
         b_statepic     LIKE type_t.chr50,
            b_gzzm001 LIKE gzzm_t.gzzm001,
   b_gzzm001_desc LIKE type_t.chr80
      END RECORD 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_email_addr  LIKE type_t.chr30  #170921-00002#1 add
#end add-point
 
#模組變數(Module Variables)
DEFINE g_gzzm_m        type_g_gzzm_m  #單頭變數宣告
DEFINE g_gzzm_m_t      type_g_gzzm_m  #單頭舊值宣告(系統還原用)
DEFINE g_gzzm_m_o      type_g_gzzm_m  #單頭舊值宣告(其他用途)
DEFINE g_gzzm_m_mask_o type_g_gzzm_m  #轉換遮罩前資料
DEFINE g_gzzm_m_mask_n type_g_gzzm_m  #轉換遮罩後資料
 
   DEFINE g_gzzm001_t LIKE gzzm_t.gzzm001
 
   
 
   
 
DEFINE g_wc                  STRING                        #儲存查詢條件
DEFINE g_wc_t                STRING                        #備份查詢條件
DEFINE g_wc_filter           STRING                        #儲存過濾查詢條件
DEFINE g_wc_filter_t         STRING                        #備份過濾查詢條件
DEFINE g_sql                 STRING                        #資料撈取用SQL(含reference)
DEFINE g_forupd_sql          STRING                        #資料鎖定用SQL
DEFINE g_cnt                 LIKE type_t.num10             #指標/統計用變數
DEFINE g_jump                LIKE type_t.num10             #查詢指定的筆數 
DEFINE g_no_ask              LIKE type_t.num5              #是否開啟指定筆視窗 
DEFINE g_rec_b               LIKE type_t.num10             #單身筆數                         
DEFINE l_ac                  LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog     
DEFINE gwin_curr             ui.Window                     #Current Window
DEFINE gfrm_curr             ui.Form                       #Current Form
DEFINE g_pagestart           LIKE type_t.num10             #page起始筆數
DEFINE g_page_action         STRING                        #page action
DEFINE g_header_hidden       LIKE type_t.num5              #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5              #隱藏工作Panel
DEFINE g_page                STRING                        #第幾頁
DEFINE g_current_sw          BOOLEAN                       #Browser所在筆數用開關
DEFINE g_ch                  base.Channel                  #外串程式用
DEFINE g_state               STRING                        #確認前一個動作是否為新增/複製
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #reference用陣列
DEFINE g_error_show          LIKE type_t.num5              #是否顯示資料過多的錯誤訊息
DEFINE g_aw                  STRING                        #確定當下點擊的單身(modify_detail用)
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #cl_log_modified_record用(舊值)
DEFINE g_log2                STRING                        #cl_log_modified_record用(新值)
 
#快速搜尋用
DEFINE g_searchcol           STRING                        #查詢欄位代碼
DEFINE g_searchstr           STRING                        #查詢欄位字串
DEFINE g_order               STRING                        #查詢排序模式
 
#Browser用
DEFINE g_current_idx         LIKE type_t.num10             #Browser 所在筆數(當下page)
DEFINE g_current_row         LIKE type_t.num10             #Browser 所在筆數(暫存用)
DEFINE g_current_cnt         LIKE type_t.num10             #Browser 總筆數(當下page)
DEFINE g_browser_idx         LIKE type_t.num10             #Browser 所在筆數(所有資料)
DEFINE g_browser_cnt         LIKE type_t.num10             #Browser 總筆數(所有資料)
DEFINE g_row_index           LIKE type_t.num10             #階層樹狀用指標
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_err_rec             LIKE type_t.chr1              #紀錄是否有錯誤   #161130-00056
 
#190108-00038 ---start---
DEFINE g_simple_mode         LIKE type_t.num5              #是否切換為簡化模式(TRUE:簡化  FALSE:標準)
DEFINE g_simple_name         LIKE dzzc_t.dzzc002           #簡易畫面的名稱
DEFINE g_current_mode        LIKE type_t.chr10             #紀錄目前的畫面是什麼模式(simple:簡化  standard:標準)
DEFINE g_simple_mode_exists  LIKE type_t.chr1              #紀錄是否有簡化模式可供切換(Y/N)
DEFINE gs_first_time         LIKE type_t.chr1              ##紀錄是否為第一次進入init()段
#190108-00038 --- end ---
DEFINE g_autocomplete_param  DYNAMIC ARRAY OF LIKE type_t.chr1000   #autocomplete功能的傳入參數   #190121-00003
DEFINE g_other_wc            LIKE type_t.chr2000           #其他條件   #190121-00003
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization" 

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"

#end add-point
 
{</section>}
 
{<section id="azzi918.main" type="s" >}
#應用 a26 樣板自動產生(Version:9)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("azz","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT gzzm001,'',gzzm003,gzzm004,gzzm002,gzzm005,gzzm006,gzzm007,gzzm010,gzzm008,gzzm009,gzzm011,gzzmstus,gzzmownid,'',gzzmowndp,'',gzzmcrtid,'',gzzmcrtdp,'',gzzmcrtdt,gzzmmodid,'',gzzmmoddt", 
                      " FROM gzzm_t",
                      " WHERE gzzment= ? AND gzzm001=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE azzi918_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
   CALL azzi918_chk_data_exist(g_forupd_sql)   #190806-00019
 
   LET g_sql = " SELECT DISTINCT t0.gzzm001,t0.gzzm003,t0.gzzm004,t0.gzzm002,t0.gzzm005,t0.gzzm006,t0.gzzm007,t0.gzzm010,t0.gzzm008,t0.gzzm009,t0.gzzm011,t0.gzzmstus,t0.gzzmownid,t0.gzzmowndp,t0.gzzmcrtid,t0.gzzmcrtdp,t0.gzzmcrtdt,t0.gzzmmodid,t0.gzzmmoddt,t1.gzzal003 ,t2.ooag011 ,t3.ooefl003 ,t4.ooag011 , 
       t5.ooefl003 ,t6.ooag011",
               " FROM gzzm_t t0",
                              " LEFT JOIN gzzal_t t1 ON t1.gzzal001=t0.gzzm001 AND t1.gzzal002='"||g_lang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.gzzmownid  ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.gzzmowndp AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.gzzmcrtid  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.gzzmcrtdp AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.gzzmmodid  ",
 
               " WHERE t0.gzzment = " ||g_enterprise|| " AND t0.gzzm001 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE azzi918_master_referesh FROM g_sql
 
    
 
 
   #190108-00038 ---start---
   
   #190108-00038 --- end ---
  
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      #190108-00038 ---modify start---
      OPEN WINDOW w_azzi918 WITH FORM cl_ap_formpath('azz',g_code)
      #190108-00038 --- modify end ---   
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL azzi918_init()   
 
      #進入選單 Menu (="N")
      CALL azzi918_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_azzi918
      
   END IF 
   
   CLOSE azzi918_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="azzi918.init" type="s" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION azzi918_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #190108-00038 ---start---
   DEFINE tpl_msg            STRING
   DEFINE tpl_node           om.DomNode
   DEFINE tpl_nodelist       om.NodeList
   DEFINE tpl_node_name      STRING
   DEFINE tpl_node_tagname   STRING
   DEFINE tpl_i              LIKE type_t.num5
   #190108-00038 --- end ---
   #add-point:init段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   #定義combobox狀態
      CALL cl_set_combo_scc_part('gzzmstus','17','N,Y')
 
      CALL cl_set_combo_scc('gzzm002','198') 
 
   LET g_error_show = 1
   LET g_err_rec = "N"   #161130-00056
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   #190108-00038 ---start---
   CALL gfrm_curr.setElementHidden('ui_change',1)   #隱藏畫面切換action
   #190108-00038 --- end ---
  
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_comp_visible("gzzm008",FALSE)
   IF cl_null(g_gzzm_m.gzzm001) THEN
      CALL cl_set_act_visible("verify_mail", FALSE)
   END IF                      
   #end add-point
 
   #第一次進入init段時才跑default_search()，以避免後續作畫面轉換時因為重複執行init()段而導致g_wc條件值被異動
   IF cl_null(gs_first_time) OR gs_first_time <> "N" THEN   #190108-00038
      #根據外部參數進行搜尋
      CALL azzi918_default_search()
   END IF   #190108-00038
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.chk_data_exist" type="s" >}
#+ 異動前先確認該筆資料是否存在
PRIVATE FUNCTION azzi918_chk_data_exist(ps_sql)
   #add-point:chk_data_exist段define(客製用) name="chk_data_exist.define_customerization"
   
   #end add-point
   DEFINE ps_sql         STRING
   DEFINE ls_sql         STRING
   DEFINE ls_b           LIKE type_t.num5
   DEFINE ls_e           LIKE type_t.num5
   DEFINE ls_table       LIKE type_t.chr20
   DEFINE ls_wc          STRING
   #add-point:chk_data_exist段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="chk_
   
   #end add-point
 
   #add-point:chk_data_exist段action_chk name="chk_data_exist.action_chk"
   
   #end add-point
 
 
   LET ls_b = ps_sql.getIndexOf("FROM",1)+5
   LET ls_e = ps_sql.getIndexOf("WHERE",ls_b)-1
   LET ls_table = ps_sql.subString(ls_b,ls_e)
 
   LET ls_b = ps_sql.getIndexOf("WHERE",1)
   LET ls_e = ps_sql.getIndexOf(" FOR ",ls_b)
   LET ls_wc = ps_sql.subString(ls_b,ls_e)
 
   LET ls_sql = "SELECT COUNT(1) FROM ",ls_table," ",ls_wc
   PREPARE azzi918_chk_data_exist_pre FROM ls_sql
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'PREPARE azzi918_chk_data_exist_pre ERROR'
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION azzi918_ui_dialog() 
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit   LIKE type_t.num10       #判別是否為離開作業
   DEFINE li_idx    LIKE type_t.num10       #指標變數
   DEFINE ls_wc     STRING                  #wc用
   DEFINE la_param  RECORD                  #程式串查用變數
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING                  #轉換後的json字串
   DEFINE l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_arg             STRING                 #報表作業cmdrun使用
   #(ver:53) ---add start---
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   #(ver:53) --- add end ---
   #(ver:56) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:56) --- add end ---
   #add-point:ui_dialog段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE ls_msg          STRING            #170921-00002#1 add
   DEFINE ls_err_code     STRING            #170921-00002#1 add
   DEFINE ls_err_replace  STRING            #170921-00002#1 add
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   LET li_exit = FALSE
   LET g_current_row = 0
   LET g_current_idx = 0
 
   #若有外部參數查詢, 則直接顯示資料(隱藏查詢方案)
   IF g_default THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   ELSE
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL azzi918_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE li_exit = FALSE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_gzzm_m.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL azzi918_init()
      END IF
 
      #190108-00038 ---start---
      
      #190108-00038 --- end ---
      
      CALL lib_cl_dlg.cl_dlg_before_display()
      CALL cl_notice()
    
      #確保g_current_idx位於正常區間內
      #小於,等於0則指到第1筆
      IF g_current_idx <= 0 THEN
         LET g_current_idx = 1
      END IF
               
      IF g_main_hidden = 0 THEN
         MENU
            BEFORE MENU 
               #先填充browser資料
               #190108-00038 ---modify start---
            #  CALL azzi918_browser_fill(g_wc,"")   #190114-00003 mark
            #  IF g_action_choice <> "ui_change" THEN   #190114-00003
               IF g_action_choice = "ui_change" THEN
                  DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
                  DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數
                  DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
                  DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數
               ELSE
                  CALL azzi918_browser_fill(g_wc,"")
               END IF
               #190108-00038 --- modify end ---
               CALL cl_navigator_setting(g_current_idx, g_current_cnt)
               
               #還原為原本指定筆數
               IF g_current_row > 0 THEN
                  LET g_current_idx = g_current_row
               END IF
 
               #當每次點任一筆資料都會需要用到  
               IF g_browser_cnt > 0 THEN
                  CALL azzi918_fetch("")   
               END IF               
               #add-point:ui_dialog段 before menu name="ui_dialog.before_menu"
               #170921-00002#1--start--
               IF cl_null(g_gzzm_m.gzzm001) THEN
                  CALL cl_set_act_visible("verify_mail", FALSE)
               END IF 
               #170921-00002#1--end--
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL azzi918_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL azzi918_set_act_visible()
               CALL azzi918_set_act_no_visible()
               IF NOT (g_gzzm_m.gzzm001 IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " gzzment = " ||g_enterprise|| " AND",
                                     " gzzm001 = '", g_gzzm_m.gzzm001, "' "
 
                  #填到對應位置
                  CALL azzi918_browser_fill(g_wc,"")
               END IF
               
            #第一筆資料
            ON ACTION first
               CALL azzi918_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL azzi918_fetch("N")
               LET g_current_row = g_current_idx
            
            #指定筆資料
            ON ACTION jump
               CALL azzi918_fetch("/")
               LET g_current_row = g_current_idx
            
            #上一筆資料
            ON ACTION previous
               CALL azzi918_fetch("P")
               LET g_current_row = g_current_idx
            
            #最後筆資料
            ON ACTION last 
               CALL azzi918_fetch("L")  
               LET g_current_row = g_current_idx
            
            #離開程式
            ON ACTION exit
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT MENU 
            
            #離開程式
            ON ACTION close
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT MENU
 
            #180226-00040 ---modify start---
            #主頁摺疊
            ON ACTION mainhidden   
               LET g_action_choice = "mainhidden"            
               #(ver:54) ---start---
               #add-point:ui_dialog段 menu段 mainhidden name="ui_dialog.menu_mainhidden"
               
               #end add-point
               #(ver:54) --- end ---
            #180226-00040 --- modify end ---
               #180226-00040 ---modify start---
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
                  CALL cl_notice()
               END IF
               EXIT MENU
               #180226-00040 --- modify end ---
           
            #180226-00040 ---modify start---    
            ON ACTION worksheethidden   #瀏覽頁折疊
               #(ver:54) ---start---
               #add-point:ui_dialog段 menu段 worksheethidden name="ui_dialog.menu_worksheethidden"
               
               #end add-point
               #(ver:54) --- end ---
            #180226-00040 --- modify end ---
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
               END IF
               EXIT MENU
            
            #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
            ON ACTION controls   
               IF g_header_hidden THEN
                  CALL gfrm_curr.setElementHidden("vb_master",0)
                  CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
                  LET g_header_hidden = 0     #visible
               ELSE
                  CALL gfrm_curr.setElementHidden("vb_master",1)
                  CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
                  LET g_header_hidden = 1     #hidden     
               END IF
          
            #查詢方案用
            ON ACTION queryplansel
               CALL cl_dlg_qryplan_select() RETURNING ls_wc
               #不是空條件才寫入g_wc跟重新找資料
               IF NOT cl_null(ls_wc) THEN
                  #(ver:53) ---modify start---
                  CALL util.JSON.parse(ls_wc, la_wc)
                  INITIALIZE g_wc TO NULL
                  FOR li_idx = 1 TO la_wc.getLength()
                     CASE
                        WHEN la_wc[li_idx].tableid = "gzzm_t"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -S-
                        WHEN la_wc[li_idx].tableid = "EXTENDWC"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -E-                         
                     END CASE
                  END FOR
                  IF NOT cl_null(g_wc) THEN
                     #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                     CALL azzi918_browser_fill(g_wc,"F")
                     IF g_browser_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = ""
                        LET g_errparam.code   = "-100"
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        CLEAR FORM
                     ELSE
                        CALL azzi918_fetch("F")
                     END IF
                  END IF
                  #(ver:53) --- modify end ---
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()   #(ver:53) modify
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  #(ver:53) ---modify start---
                  CALL util.JSON.parse(ls_wc, la_wc)
                  INITIALIZE g_wc TO NULL
                  FOR li_idx = 1 TO la_wc.getLength()
                     CASE
                        WHEN la_wc[li_idx].tableid = "gzzm_t"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -S-
                        WHEN la_wc[li_idx].tableid = "EXTENDWC"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -E-  
                     END CASE
                  END FOR
                  IF NOT cl_null(g_wc) THEN
                     #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                     CALL azzi918_browser_fill(g_wc,"F")
                     IF g_browser_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = ""
                        LET g_errparam.code   = "-100"
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        CLEAR FORM
                     ELSE
                        CALL azzi918_fetch("F")
                     END IF
                  END IF
                  #(ver:53) --- modify end ---
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()   #(ver:53) modify
            
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL azzi918_modify()
               #add-point:ON ACTION modify name="menu2.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL azzi918_delete()
               #add-point:ON ACTION delete name="menu2.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL azzi918_insert()
               #add-point:ON ACTION insert name="menu2.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu2.output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu2.quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL azzi918_reproduce()
               #add-point:ON ACTION reproduce name="menu2.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL azzi918_query()
               #add-point:ON ACTION query name="menu2.query"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION verify_mail
            LET g_action_choice="verify_mail"
            IF cl_auth_chk_act("verify_mail") THEN
               
               #add-point:ON ACTION verify_mail name="menu2.verify_mail"
               #170921-00002#1--start--
               CALL cl_getmsg("azz-00197", g_lang) RETURNING ls_msg
               LET INT_FLAG = 0

               PROMPT ls_msg CLIPPED,": " FOR g_email_addr
                 #交談指令共用ACTION
                 &include "common_action.4gl"
               END PROMPT

               IF NOT INT_FLAG THEN
                  CALL azzi918_verify_mail() RETURNING ls_err_code, ls_err_replace
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.code = ls_err_code
                  LET g_errparam.replace[1] = ls_err_replace 
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               END IF
               #170921-00002#1--end--
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION sync
            LET g_action_choice="sync"
            IF cl_auth_chk_act("sync") THEN
               
               #add-point:ON ACTION sync name="menu2.sync"
               #170309-00019 start
               IF NOT cl_null(g_gzzm_m.gzzm001) THEN 
                  IF g_gzzm_m.gzzm001 <> "DEFAULT" THEN 
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "azz-00399"
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                  ELSE
                      #170313-00006#1 start                  
                      INITIALIZE g_errparam TO NULL 
                      LET g_errparam.replace[1] = g_gzzm_m.gzzm003 
                      IF cl_ask_confirm("azz-00430") THEN                        
                        CALL azzi918_sync_mail_account()
                        INITIALIZE g_errparam TO NULL 
                        LET g_errparam.extend = "" 
                        LET g_errparam.code   = "sub-00033"
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                     END IF
                     #170313-00006#1 end                     
                  END IF 
               END IF 
               #170309-00019 end
               #END add-point
               
            END IF
 
 
 
 
            
            
 
               #180611-00048
            
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL azzi918_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.menu.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL azzi918_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.menu.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL azzi918_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.menu.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
 
            #190108-00038 ---start---
            
            #190108-00038 --- end ---
            
            #主選單用ACTION
            &include "main_menu_exit_menu.4gl"
            &include "relating_action.4gl"
            #交談指令共用ACTION
            &include "common_action.4gl"
            
         END MENU
      
      ELSE
      
         DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
           
      
            #左側瀏覽頁簽
            DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTE(COUNT=g_rec_b)
            
               BEFORE ROW
                  #回歸舊筆數位置 (回到當時異動的筆數)
                  LET g_current_idx = DIALOG.getCurrentRow("s_browse")
                  IF g_current_idx = 0 THEN
                     LET g_current_idx = 1
                  END IF
                  LET g_current_row = g_current_idx  #目前指標
                  LET g_current_sw = TRUE
                  CALL cl_show_fld_cont()     
                  
                  #當每次點任一筆資料都會需要用到               
                  CALL azzi918_fetch("")
 
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
    
               
 
               #180725-00030#1 - S -
               #add-point:ui_dialog段自定義browser_action name="ui_dialog.browser_action"
               
               #end add-point
               #180725-00030#1 - E -
 
            END DISPLAY
 
            #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
            
            #end add-point
 
            #查詢方案用
            SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
            SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
         
            BEFORE DIALOG
               CALL cl_ap_code_set_action() #171110-00013#1
               #先填充browser資料
               IF g_action_choice <> "mainhidden" THEN
                  #190108-00038 ---modify start---
               #  CALL azzi918_browser_fill(g_wc,"")
                  IF g_action_choice = "ui_change" THEN
                     DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
                     DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
                     DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
                     DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
                  ELSE
                     CALL azzi918_browser_fill(g_wc,"")
                  END IF
                  #190108-00038 --- modify end ---
               END IF
               CALL cl_navigator_setting(g_current_idx, g_current_cnt)
               LET g_curr_diag = ui.DIALOG.getCurrent()
               #還原為原本指定筆數
               IF g_current_row > 1 THEN
                  #當刪除最後一筆資料時可能產生錯誤, 進行額外判斷
                  IF g_current_row > g_browser.getLength() THEN
                     LET g_current_row = g_browser.getLength()
                  END IF 
                  LET g_current_idx = g_current_row
                  CALL DIALOG.setCurrentRow("s_browse",g_current_idx)
               END IF
 
               #當每次點任一筆資料都會需要用到  
               IF g_browser_cnt > 0 THEN
                  CALL azzi918_fetch("")   
               END IF          
               CALL cl_notice()
               
               #add-point:ui_dialog段before name="ui_dialog.b_dialog"
 
               #end add-point  
            
            AFTER DIALOG
               #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
               
               #end add-point
            
            #狀態碼切換
            ON ACTION statechange
               CALL azzi918_statechange()
               LET g_action_choice="statechange"
               #根據資料狀態切換action狀態
               CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
               CALL azzi918_set_act_visible()
               CALL azzi918_set_act_no_visible()
               IF NOT (g_gzzm_m.gzzm001 IS NULL
 
                 ) THEN
                  #組合條件
                  LET g_add_browse = " gzzment = " ||g_enterprise|| " AND",
                                     " gzzm001 = '", g_gzzm_m.gzzm001, "' "
 
                  #填到對應位置
                  CALL azzi918_browser_fill(g_wc,"")
               END IF
         
            #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL azzi918_filter()
               EXIT DIALOG
 
 
 
            
            #第一筆資料
            ON ACTION first
               CALL azzi918_fetch("F") 
               LET g_current_row = g_current_idx
            
            #下一筆資料
            ON ACTION next
               CALL azzi918_fetch("N")
               LET g_current_row = g_current_idx
         
            #指定筆資料
            ON ACTION jump
               CALL azzi918_fetch("/")
               LET g_current_row = g_current_idx
         
            #上一筆資料
            ON ACTION previous
               CALL azzi918_fetch("P")
               LET g_current_row = g_current_idx
          
            #最後筆資料
            ON ACTION last 
               CALL azzi918_fetch("L")  
               LET g_current_row = g_current_idx
         
            #離開程式
            ON ACTION exit
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT DIALOG 
         
            #離開程式
            ON ACTION close
               LET g_action_choice="exit"
               LET INT_FLAG = FALSE
               LET li_exit = TRUE
               EXIT DIALOG 
    
            #180226-00040 ---modify start---
            #主頁摺疊
            ON ACTION mainhidden 
               LET g_action_choice = "mainhidden"                
               #(ver:54) ---start---
               #add-point:ui_dialog段 mainhidden name="ui_dialog.mainhidden"
               
               #end add-point
               #(ver:54) --- end ---
            #180226-00040 --- modify end ---
               #180226-00040 ---modify start---
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
                  CALL cl_notice()
               END IF
               #EXIT DIALOG
               #180226-00040 --- modify end ---
               
            ON ACTION worksheethidden   #瀏覽頁折疊
               #(ver:54) ---start---
               #add-point:ui_dialog段 worksheethidden name="ui_dialog.worksheethidden"
               
               #end add-point
               #(ver:54) --- end ---
               IF g_main_hidden THEN
                  CALL gfrm_curr.setElementHidden("mainlayout",0)
                  CALL gfrm_curr.setElementHidden("worksheet",1)
                  LET g_main_hidden = 0
               ELSE
                  CALL gfrm_curr.setElementHidden("mainlayout",1)
                  CALL gfrm_curr.setElementHidden("worksheet",0)
                  LET g_main_hidden = 1
               END IF
               #EXIT DIALOG
         
            ON ACTION exporttoexcel
               LET g_action_choice="exporttoexcel"
               IF cl_auth_chk_act("exporttoexcel") THEN
                  #(ver:56) ---start---
                  #因應匯出excel規則調整，需同時符合新舊做法
                  LET lb_get_type = cl_get_exporttoexcel_type()
                  #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
                  
                  #END add-point
                  DISPLAY "lb_get_type:",lb_get_type
 
                  CASE
                     WHEN lb_get_type = "poi"   #使用poi樣板
                        #browser
                        CALL g_export_node.clear()
                        LET l_arr_len = g_browser.getLength()
                        LET g_export_tabname[1] = "s_browse"
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_browser[l_arr_cnt]
                        END FOR
 
                        #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_browser_poi"
                        
                        #END add-point
                        CALL cl_export_poi()
                        #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_browser_after_poi"
                        
                        #END add-point
 
                     OTHERWISE   #使用原始樣板
                        #browser
                        CALL g_export_node.clear()
                        LET g_export_node[1] = base.typeInfo.create(g_browser)
                        LET g_export_id[1]   = "s_browse"
                        
                        #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_browser"   #(ver:52)
                        
                        #END add-point
                        CALL cl_export_to_excel()
                        #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_browser_after"   #(ver:52)
                        
                        #END add-point
                  END CASE
                  #(ver:56) --- end ---
               END IF
         
            #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
            ON ACTION controls   
               IF g_header_hidden THEN
                  CALL gfrm_curr.setElementHidden("vb_master",0)
                  CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
                  LET g_header_hidden = 0     #visible
               ELSE
                  CALL gfrm_curr.setElementHidden("vb_master",1)
                  CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
                  LET g_header_hidden = 1     #hidden     
               END IF
 
            
            #查詢方案用
            ON ACTION queryplansel
               CALL cl_dlg_qryplan_select() RETURNING ls_wc
               #不是空條件才寫入g_wc跟重新找資料
               IF NOT cl_null(ls_wc) THEN
                  #(ver:53) ---modify start---
                  CALL util.JSON.parse(ls_wc, la_wc)
                  INITIALIZE g_wc TO NULL
                  FOR li_idx = 1 TO la_wc.getLength()
                     CASE
                        WHEN la_wc[li_idx].tableid = "gzzm_t"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -S-
                        WHEN la_wc[li_idx].tableid = "EXTENDWC"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -E-  
                     END CASE
                  END FOR
                  IF NOT cl_null(g_wc) THEN
                     #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                     CALL azzi918_browser_fill(g_wc,"F")
                     IF g_browser_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = ""
                        LET g_errparam.code   = "-100"
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        CLEAR FORM
                     ELSE
                        CALL azzi918_fetch("F")
                     END IF
                  END IF
                  #(ver:53) --- modify end ---
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()   #(ver:53) modify
            
            #查詢方案用
            ON ACTION qbe_select
               CALL cl_qbe_list("m") RETURNING ls_wc
               IF NOT cl_null(ls_wc) THEN
                  #(ver:53) ---modify start---
                  CALL util.JSON.parse(ls_wc, la_wc)
                  INITIALIZE g_wc TO NULL
                  FOR li_idx = 1 TO la_wc.getLength()
                     CASE
                        WHEN la_wc[li_idx].tableid = "gzzm_t"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -S-
                        WHEN la_wc[li_idx].tableid = "EXTENDWC"
                           LET g_wc = la_wc[li_idx].wc
                        #190730-00003#4 -E-  
                     END CASE
                  END FOR
                  IF NOT cl_null(g_wc) THEN
                     #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                     CALL azzi918_browser_fill(g_wc,"F")
                     IF g_browser_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = ""
                        LET g_errparam.code   = "-100"
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        CLEAR FORM
                     ELSE
                        CALL azzi918_fetch("F")
                     END IF
                  END IF
                  #(ver:53) --- modify end ---
               END IF
               #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               CALL cl_notice()   #(ver:53) modify
               
            
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL azzi918_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL azzi918_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL azzi918_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL azzi918_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL azzi918_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION verify_mail
            LET g_action_choice="verify_mail"
            IF cl_auth_chk_act("verify_mail") THEN
               
               #add-point:ON ACTION verify_mail name="menu.verify_mail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION sync
            LET g_action_choice="sync"
            IF cl_auth_chk_act("sync") THEN
               
               #add-point:ON ACTION sync name="menu.sync"
               
               #END add-point
               
            END IF
 
 
 
 
            
            
 
               #180611-00048
 
            #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL azzi918_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL azzi918_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL azzi918_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
            
            #190108-00038 ---start---
            
            #190108-00038 --- end ---
 
            #主選單用ACTION
            &include "main_menu_exit_dialog.4gl"
            &include "relating_action.4gl"
            #交談指令共用ACTION
            &include "common_action.4gl"
            
         END DIALOG 
      
      END IF
      
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      
      #(ver:50) ---start---
      IF li_exit THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
      #(ver:50) --- end ---
 
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.browser_fill" type="s" >}
#應用 a29 樣板自動產生(Version:17)
#+ 瀏覽頁簽資料填充(一般單檔)
PRIVATE FUNCTION azzi918_browser_fill(p_wc,ps_page_action) 
   #add-point:browser_fill段define name="browser_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc              STRING
   DEFINE ls_wc             STRING
   DEFINE ps_page_action    STRING
   DEFINE l_searchcol       STRING
   DEFINE l_sql             STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="browser_fill.pre_function"
   
   #end add-point
   
   LET l_searchcol = "gzzm001"
 
   LET p_wc = p_wc.trim() #當查詢按下Q時 按下放棄 g_wc = "  " 所以要清掉空白
   IF cl_null(p_wc) THEN  #p_wc 查詢條件
      LET p_wc = " 1=1 " 
   END IF
   #add-point:browser_fill段wc控制 name="browser_fill.wc"
   
   #end add-point
 
   LET g_sql = " SELECT COUNT(1) FROM gzzm_t ",
               "  ",
               "  ",
               " WHERE gzzment = " ||g_enterprise|| " AND ", 
               p_wc CLIPPED, cl_sql_add_filter("gzzm_t")
                
   #add-point:browser_fill段cnt_sql name="browser_fill.cnt_sql"
   
   #end add-point
                
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt
      FREE header_cnt_pre 
   END IF
   
   #若超過最大顯示筆數
   IF g_browser_cnt > g_max_browse THEN
      #若是因為切換畫面的話，不用再次顯示超過最大顯示筆數的訊息
      IF cl_null(g_action_choice) OR g_action_choice <> "ui_change" THEN   #190108-00038
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = g_browser_cnt 
            LET g_errparam.code   = 9035
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF
      END IF   #190108-00038
   END IF
   
   LET g_error_show = 0
   
   IF ps_page_action = "F" OR
      ps_page_action = "P"  OR
      ps_page_action = "N"  OR
      ps_page_action = "L"  THEN
      LET g_page_action = ps_page_action
   END IF
   
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM
      INITIALIZE g_gzzm_m.* TO NULL
      CALL g_browser.clear()
      LET g_cnt = 1
      LET ls_wc = p_wc
   ELSE
      LET ls_wc = g_add_browse
      LET g_cnt = g_current_idx
   END IF
   
   LET g_sql = " SELECT t0.gzzmstus,t0.gzzm001,t1.gzzal003",
               " FROM gzzm_t t0 ",
               "  ",
                              " LEFT JOIN gzzal_t t1 ON t1.gzzal001=t0.gzzm001 AND t1.gzzal002='"||g_lang||"' ",
 
               " WHERE t0.gzzment = " ||g_enterprise|| " AND ", ls_wc, cl_sql_add_filter("gzzm_t")
   #add-point:browser_fill段fill_wc name="browser_fill.fill_wc"
   
   #end add-point 
   LET g_sql = g_sql, " ORDER BY ",l_searchcol," ",g_order
   #add-point:browser_fill段before_pre name="browser_fill.before_pre"
   
   #end add-point                    
 
   #LET g_sql = cl_sql_add_tabid(g_sql,"gzzm_t")             #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_gzzm001,g_browser[g_cnt].b_gzzm001_desc
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "foreach:" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
         
         
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
         
         #遮罩相關處理
         CALL azzi918_browser_mask()
         
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/inactive.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/active.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         #IF g_cnt > g_max_rec THEN #180330-00002#1
         IF g_cnt > g_max_browse THEN  #180330-00002#1
            EXIT FOREACH
         END IF
      END FOREACH
 
      FREE browse_pre
 
   END IF
 
   #清空g_add_browse, 並指定指標位置
   IF NOT cl_null(g_add_browse) THEN
      LET g_add_browse = ""
      CALL g_curr_diag.setCurrentRow("s_browse",g_current_idx)
   END IF
   
   IF cl_null(g_browser[g_cnt].b_gzzm001) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt = g_browser.getLength()
   LET g_current_cnt = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   LET g_rec_b = g_browser.getLength()
   LET g_cnt = 0
   DISPLAY g_browser_cnt TO FORMONLY.b_count
   DISPLAY g_browser_cnt TO FORMONLY.h_count
   
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   CALL azzi918_set_act_visible()    #170921-00002#1 add
   #end add-point   
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="azzi918.construct" type="s" >}
#+ QBE資料查詢
PRIVATE FUNCTION azzi918_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point
   DEFINE ls_return      STRING
   DEFINE ls_result      STRING 
   DEFINE ls_wc          STRING 
   #(ver:53) ---add start---
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   DEFINE lp_str      STRING   #201109-00009
   #(ver:53) --- add end ---
   #add-point:cs段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
   
   #清空畫面&資料初始化
   CLEAR FORM
   INITIALIZE g_gzzm_m.* TO NULL
   INITIALIZE g_wc TO NULL
   LET g_current_row = 1
 
   LET g_qryparam.state = "c"
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #螢幕上取條件
      CONSTRUCT BY NAME g_wc ON gzzm001,gzzm003,gzzm004,gzzm002,gzzm005,gzzm006,gzzm007,gzzm010,gzzm008,gzzm009,gzzm011,gzzmstus,gzzmownid,gzzmowndp,gzzmcrtid,gzzmcrtdp,gzzmcrtdt,gzzmmodid,gzzmmoddt
      
         BEFORE CONSTRUCT                                    
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point             
      
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<gzzmcrtdt>>----
         AFTER FIELD gzzmcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<gzzmmoddt>>----
         AFTER FIELD gzzmmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<gzzmcnfdt>>----
         
         #----<<gzzmpstdt>>----
 
 
 
      
         #一般欄位
                  #Ctrlp:construct.c.gzzm001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD gzzm001
            #add-point:ON ACTION controlp INFIELD gzzm001 name="construct.c.gzzm001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_gzzm001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO gzzm001  #顯示到畫面上
            NEXT FIELD gzzm001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm001
            #add-point:BEFORE FIELD gzzm001 name="construct.b.gzzm001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm001
            
            #add-point:AFTER FIELD gzzm001 name="construct.a.gzzm001"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm003
            #add-point:BEFORE FIELD gzzm003 name="construct.b.gzzm003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm003
            
            #add-point:AFTER FIELD gzzm003 name="construct.a.gzzm003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.gzzm003
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm003
            #add-point:ON ACTION controlp INFIELD gzzm003 name="construct.c.gzzm003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm004
            #add-point:BEFORE FIELD gzzm004 name="construct.b.gzzm004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm004
            
            #add-point:AFTER FIELD gzzm004 name="construct.a.gzzm004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.gzzm004
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm004
            #add-point:ON ACTION controlp INFIELD gzzm004 name="construct.c.gzzm004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm002
            #add-point:BEFORE FIELD gzzm002 name="construct.b.gzzm002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm002
            
            #add-point:AFTER FIELD gzzm002 name="construct.a.gzzm002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.gzzm002
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm002
            #add-point:ON ACTION controlp INFIELD gzzm002 name="construct.c.gzzm002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm005
            #add-point:BEFORE FIELD gzzm005 name="construct.b.gzzm005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm005
            
            #add-point:AFTER FIELD gzzm005 name="construct.a.gzzm005"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.gzzm005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm005
            #add-point:ON ACTION controlp INFIELD gzzm005 name="construct.c.gzzm005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm006
            #add-point:BEFORE FIELD gzzm006 name="construct.b.gzzm006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm006
            
            #add-point:AFTER FIELD gzzm006 name="construct.a.gzzm006"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.gzzm006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm006
            #add-point:ON ACTION controlp INFIELD gzzm006 name="construct.c.gzzm006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm007
            #add-point:BEFORE FIELD gzzm007 name="construct.b.gzzm007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm007
            
            #add-point:AFTER FIELD gzzm007 name="construct.a.gzzm007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.gzzm007
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm007
            #add-point:ON ACTION controlp INFIELD gzzm007 name="construct.c.gzzm007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm010
            #add-point:BEFORE FIELD gzzm010 name="construct.b.gzzm010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm010
            
            #add-point:AFTER FIELD gzzm010 name="construct.a.gzzm010"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.gzzm010
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm010
            #add-point:ON ACTION controlp INFIELD gzzm010 name="construct.c.gzzm010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm008
            #add-point:BEFORE FIELD gzzm008 name="construct.b.gzzm008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm008
            
            #add-point:AFTER FIELD gzzm008 name="construct.a.gzzm008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.gzzm008
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm008
            #add-point:ON ACTION controlp INFIELD gzzm008 name="construct.c.gzzm008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm009
            #add-point:BEFORE FIELD gzzm009 name="construct.b.gzzm009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm009
            
            #add-point:AFTER FIELD gzzm009 name="construct.a.gzzm009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.gzzm009
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm009
            #add-point:ON ACTION controlp INFIELD gzzm009 name="construct.c.gzzm009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm011
            #add-point:BEFORE FIELD gzzm011 name="construct.b.gzzm011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm011
            
            #add-point:AFTER FIELD gzzm011 name="construct.a.gzzm011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.gzzm011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm011
            #add-point:ON ACTION controlp INFIELD gzzm011 name="construct.c.gzzm011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmstus
            #add-point:BEFORE FIELD gzzmstus name="construct.b.gzzmstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzmstus
            
            #add-point:AFTER FIELD gzzmstus name="construct.a.gzzmstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.gzzmstus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzmstus
            #add-point:ON ACTION controlp INFIELD gzzmstus name="construct.c.gzzmstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.gzzmownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD gzzmownid
            #add-point:ON ACTION controlp INFIELD gzzmownid name="construct.c.gzzmownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO gzzmownid  #顯示到畫面上
            NEXT FIELD gzzmownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmownid
            #add-point:BEFORE FIELD gzzmownid name="construct.b.gzzmownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzmownid
            
            #add-point:AFTER FIELD gzzmownid name="construct.a.gzzmownid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.gzzmowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD gzzmowndp
            #add-point:ON ACTION controlp INFIELD gzzmowndp name="construct.c.gzzmowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO gzzmowndp  #顯示到畫面上
            NEXT FIELD gzzmowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmowndp
            #add-point:BEFORE FIELD gzzmowndp name="construct.b.gzzmowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzmowndp
            
            #add-point:AFTER FIELD gzzmowndp name="construct.a.gzzmowndp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.gzzmcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD gzzmcrtid
            #add-point:ON ACTION controlp INFIELD gzzmcrtid name="construct.c.gzzmcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO gzzmcrtid  #顯示到畫面上
            NEXT FIELD gzzmcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmcrtid
            #add-point:BEFORE FIELD gzzmcrtid name="construct.b.gzzmcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzmcrtid
            
            #add-point:AFTER FIELD gzzmcrtid name="construct.a.gzzmcrtid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.gzzmcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD gzzmcrtdp
            #add-point:ON ACTION controlp INFIELD gzzmcrtdp name="construct.c.gzzmcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO gzzmcrtdp  #顯示到畫面上
            NEXT FIELD gzzmcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmcrtdp
            #add-point:BEFORE FIELD gzzmcrtdp name="construct.b.gzzmcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzmcrtdp
            
            #add-point:AFTER FIELD gzzmcrtdp name="construct.a.gzzmcrtdp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmcrtdt
            #add-point:BEFORE FIELD gzzmcrtdt name="construct.b.gzzmcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.gzzmmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD gzzmmodid
            #add-point:ON ACTION controlp INFIELD gzzmmodid name="construct.c.gzzmmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO gzzmmodid  #顯示到畫面上
            NEXT FIELD gzzmmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmmodid
            #add-point:BEFORE FIELD gzzmmodid name="construct.b.gzzmmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzmmodid
            
            #add-point:AFTER FIELD gzzmmodid name="construct.a.gzzmmodid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmmoddt
            #add-point:BEFORE FIELD gzzmmoddt name="construct.b.gzzmmoddt"
            
            #END add-point
 
 
 
           
      END CONSTRUCT
      
      #add-point:cs段more_construct name="cs.more_construct"
      
      #end add-point   
      
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
         #end add-point  
      
      ON ACTION accept
         CALL cl_qbe_auto_save() #180530-00049#1
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CLEAR FORM #200326-00032#1
         CALL cl_qbe_list("c") RETURNING ls_wc
         #(ver:53) ---add start---
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc TO NULL
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "gzzm_t"
                     LET g_wc = la_wc[li_idx].wc
               END CASE
            END FOR
         END IF
         #(ver:53) --- add end ---
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   END DIALOG
  
   #add-point:cs段after_construct name="cs.after_construct"
   
   #end add-point
  
END FUNCTION
 
{</section>}
 
{<section id="azzi918.filter" type="s" >}
#應用 a50 樣板自動產生(Version:11)
#+ filter過濾功能
PRIVATE FUNCTION azzi918_filter()
   #add-point:filter段define name="filter.define_customerization"
   
   #end add-point   
   DEFINE lp_str     STRING   #201109-00009#2
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="filter.pre_function"
   
   #end add-point
   
   #切換畫面
   IF NOT g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF   
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter.trim()
   LET g_wc_t = g_wc
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON gzzm001
                          FROM s_browse[1].b_gzzm001
 
         BEFORE CONSTRUCT
               DISPLAY azzi918_filter_parser('gzzm001') TO s_browse[1].b_gzzm001
   
         AFTER FIELD b_gzzm001
            #add-point:AFTER FIELD b_gzzm001 name="construct.filter.af.b_gzzm001"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
   #201109-00009#2
      
         #add-point:filter段cs_ctrl name="filter.cs_ctrl"
         
         #end add-point
      
      END CONSTRUCT
 
      #add-point:filter段add_cs name="filter.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         #add-point:filter段b_dialog name="filter.b_dialog"
         
         #end add-point  
      
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   
   END DIALOG
 
   IF NOT INT_FLAG THEN
      IF NOT g_wc.getIndexOf(g_wc_filter,1) THEN   #200828-00027檢查後進入,避免條件重複 (代追單)
         LET g_wc_filter = "   AND   ", g_wc_filter, "   " 
         LET g_wc = g_wc , g_wc_filter   #200917-00047
      END IF   #200828-00027
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF
 
      CALL azzi918_filter_show('gzzm001')
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.filter_parser" type="s" >}
#+ filter過濾功能
PRIVATE FUNCTION azzi918_filter_parser(ps_field)
   #add-point:filter段define name="filter_parser.define_customerization"
   
   #end add-point    
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point    
   
   #一般條件解析
   LET ls_tmp = ps_field, "='"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
   END IF
 
   #模糊條件解析
   LET ls_tmp = ps_field, " like '"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
      LET ls_var = cl_replace_str(ls_var,'%','*')
   END IF
 
   RETURN ls_var
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.filter_show" type="s" >}
#+ 顯示過濾條件
PRIVATE FUNCTION azzi918_filter_show(ps_field)
   DEFINE ps_field         STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
 
   LET ls_name = "formonly.b_", ps_field
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = azzi918_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.query" type="s" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION azzi918_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point
   DEFINE ls_wc STRING
   #add-point:query段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="query.pre_function"
 
   #end add-point
   
   LET INT_FLAG = 0
   LET ls_wc = g_wc
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL g_browser.clear() 
 
   #browser panel折疊
   IF g_worksheet_hidden THEN
      CALL gfrm_curr.setElementHidden("worksheet_vbox",0)
      CALL gfrm_curr.setElementImage("worksheethidden","worksheethidden-24.png")
      LET g_worksheet_hidden = 0
   END IF
   
   #單頭折疊
   IF g_header_hidden THEN
      CALL gfrm_curr.setElementHidden("vb_master",0)
      CALL gfrm_curr.setElementImage("controls","headerhidden-24")
      LET g_header_hidden = 0
   END IF
  
   INITIALIZE g_gzzm_m.* TO NULL
   ERROR ""
 
   DISPLAY " " TO FORMONLY.b_count
   DISPLAY " " TO FORMONLY.h_count
   CALL azzi918_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL azzi918_browser_fill(g_wc,"F")
      CALL azzi918_fetch("")
      RETURN
   ELSE
      LET g_current_row = 1
      LET g_current_cnt = 0
   END IF
   
   #根據條件從新抓取資料
   LET g_error_show = 1
   CALL azzi918_browser_fill(g_wc,"F")   # 移到第一頁
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||")")
   
   #備份搜尋條件
   LET ls_wc = g_wc
   
   IF g_browser.getLength() = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL azzi918_fetch("F") 
   END IF
   
   LET g_wc_filter = ""
   
END FUNCTION
 
{</section>}
 
{<section id="azzi918.fetch" type="s" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION azzi918_fetch(p_fl)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point
   DEFINE p_fl       LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="fetch.pre_function"
 
   #end add-point
   
   #根據傳入的條件決定抓取的資料
   CASE p_fl
      WHEN "F" 
         LET g_current_idx = 1
      WHEN "P"
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN "N"
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN "L" 
         #LET g_current_idx = g_header_cnt        
         LET g_current_idx = g_browser.getLength()    
      WHEN "/"
         #詢問要指定的筆數
         IF (NOT g_no_ask) THEN      
            CALL cl_getmsg("fetch", g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,": " FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl"
            END PROMPT
            
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               EXIT CASE  
            END IF           
         END IF
         IF g_jump > 0 THEN
            LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE     
   END CASE
 
   #筆數顯示
   LET g_browser_idx = g_current_idx 
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
   END IF
   
   
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength() 
   END IF
   
   # 設定browse索引
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx)
   CALL cl_navigator_setting(g_browser_idx, g_browser_cnt) 
 
   #代表沒有資料, 無需做後續資料撈取之動作
   IF g_current_idx = 0 THEN
      RETURN
   END IF
 
   #根據選定的筆數給予key欄位值
   LET g_gzzm_m.gzzm001 = g_browser[g_current_idx].b_gzzm001
 
                       
   #讀取單頭所有欄位資料
   EXECUTE azzi918_master_referesh USING g_gzzm_m.gzzm001 INTO g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmmodid_desc
   
   #遮罩相關處理
   LET g_gzzm_m_mask_o.* =  g_gzzm_m.*
   CALL azzi918_gzzm_t_mask()
   LET g_gzzm_m_mask_n.* =  g_gzzm_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL azzi918_set_act_visible()
   CALL azzi918_set_act_no_visible()
 
   #add-point:fetch段action控制 name="fetch.action_control"
 
   #end add-point  
   
   
   
   #保存單頭舊值
   LET g_gzzm_m_t.* = g_gzzm_m.*
   LET g_gzzm_m_o.* = g_gzzm_m.*
   
   LET g_data_owner = g_gzzm_m.gzzmownid      
   LET g_data_dept  = g_gzzm_m.gzzmowndp
   LET g_data_crtid = g_gzzm_m.gzzmcrtid   #180201-00054
   LET g_data_crtdp = g_gzzm_m.gzzmcrtdp   #180201-00054
   
   #重新顯示
   CALL azzi918_show()
   
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.insert" type="s" >}
#+ 資料新增
PRIVATE FUNCTION azzi918_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   CLEAR FORM #清畫面欄位內容
   INITIALIZE g_gzzm_m.* TO NULL             #DEFAULT 設定
   LET g_gzzm001_t = NULL
 
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   
   WHILE TRUE
      
      #公用欄位給值
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_gzzm_m.gzzmownid = g_user
      LET g_gzzm_m.gzzmowndp = g_dept
      LET g_gzzm_m.gzzmcrtid = g_user
      LET g_gzzm_m.gzzmcrtdp = g_dept 
      LET g_gzzm_m.gzzmcrtdt = cl_get_current()
      LET g_gzzm_m.gzzmmodid = g_user
      LET g_gzzm_m.gzzmmoddt = cl_get_current()
      LET g_gzzm_m.gzzmstus = 'Y'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_gzzm_m.gzzm002 = "N"
      LET g_gzzm_m.gzzm007 = "N"
      LET g_gzzm_m.gzzm008 = "N"
      LET g_gzzm_m.gzzm009 = "N"
      LET g_gzzm_m.gzzm011 = "N"
      LET g_gzzm_m.gzzmstus = "Y"
 
 
      #add-point:單頭預設值 name="insert.default"
 
      #end add-point   
     
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_gzzm_m.gzzmstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
 
 
 
     
      #資料輸入
      CALL azzi918_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         #取消
         LET INT_FLAG = 0
         DISPLAY g_current_cnt TO FORMONLY.h_count     #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index     #當下筆數
         INITIALIZE g_gzzm_m.* TO NULL
         CALL azzi918_show()
      #  CALL s_transaction_end('N','0')   #(ver:51)
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')   #(ver:51)
         CALL cl_err()
         RETURN
      END IF
 
      LET g_rec_b = 0
      EXIT WHILE
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL azzi918_set_act_visible()
   CALL azzi918_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_gzzm001_t = g_gzzm_m.gzzm001
 
   
   #組合新增資料的條件
   LET g_add_browse = " gzzment = " ||g_enterprise|| " AND",
                      " gzzm001 = '", g_gzzm_m.gzzm001, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL azzi918_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
 
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE azzi918_master_referesh USING g_gzzm_m.gzzm001 INTO g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmmodid_desc
   
   
   #遮罩相關處理
   LET g_gzzm_m_mask_o.* =  g_gzzm_m.*
   CALL azzi918_gzzm_t_mask()
   LET g_gzzm_m_mask_n.* =  g_gzzm_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_gzzm_m.gzzm001,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmodid_desc,g_gzzm_m.gzzmmoddt
 
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
 
   LET g_data_owner = g_gzzm_m.gzzmownid      
   LET g_data_dept  = g_gzzm_m.gzzmowndp
   LET g_data_crtid = g_gzzm_m.gzzmcrtid   #180201-00054
   LET g_data_crtdp = g_gzzm_m.gzzmcrtdp   #180201-00054
 
   #功能已完成,通報訊息中心
   CALL azzi918_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="azzi918.modify" type="s" >}
#+ 資料修改
PRIVATE FUNCTION azzi918_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   DEFINE lp_cnt       LIKE type_t.num5   #190806-00019
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="modify.pre_function"
   
   #end add-point
   
   #先確定key值無遺漏
   IF g_gzzm_m.gzzm001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF 
 
   ERROR ""
  
   #備份key值
   LET g_gzzm001_t = g_gzzm_m.gzzm001
 
   
   CALL s_transaction_begin()
   
   #191101-00032 ---modify start---
   #190806-00019 ---start---
   #修改前須先確認資料是否存在
   IF g_action_choice = "modify" OR g_action_choice = "modify_detail" THEN   #191114-00036
      LET lp_cnt = 0
      EXECUTE azzi918_chk_data_exist_pre INTO lp_cnt USING g_enterprise,g_gzzm_m.gzzm001
      IF cl_null(lp_cnt) OR lp_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code = "-100"
         LET g_errparam.popup = TRUE
         CLOSE azzi918_cl
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
   END IF
   #190806-00019 --- end ---
   #191101-00032 --- modify end ---
 
   #先lock資料
   OPEN azzi918_cl USING g_enterprise,g_gzzm_m.gzzm001
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN azzi918_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE azzi918_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #200804-00006 ---start---
   FETCH azzi918_cl
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "FETCH azzi918_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CLOSE azzi918_cl
      #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
      CALL s_transaction_end('N','0')
      CALL s_transaction_begin()
      CALL cl_err()
      RETURN
   END IF
   #200804-00006 --- end ---
 
   #顯示最新的資料
   EXECUTE azzi918_master_referesh USING g_gzzm_m.gzzm001 INTO g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmmodid_desc
 
   #檢查是否允許此動作
   IF NOT azzi918_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #遮罩相關處理
   LET g_gzzm_m_mask_o.* =  g_gzzm_m.*
   CALL azzi918_gzzm_t_mask()
   LET g_gzzm_m_mask_n.* =  g_gzzm_m.*
   
   
 
   #顯示資料
   CALL azzi918_show()
   
   WHILE TRUE
      LET g_gzzm_m.gzzm001 = g_gzzm001_t
 
      
      #寫入修改者/修改日期資訊
      LET g_gzzm_m.gzzmmodid = g_user 
LET g_gzzm_m.gzzmmoddt = cl_get_current()
LET g_gzzm_m.gzzmmodid_desc = cl_get_username(g_gzzm_m.gzzmmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
 
      #資料輸入
      CALL azzi918_input("u")     
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF INT_FLAG THEN
      #  CALL s_transaction_end('N','0')   #(ver:51)
         LET INT_FLAG = 0
         LET g_gzzm_m.* = g_gzzm_m_t.*
         CALL azzi918_show()
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')   #(ver:51)
         CALL cl_err()
         EXIT WHILE
      END IF
 
      #若有modid跟moddt則進行update
      UPDATE gzzm_t SET (gzzmstus,gzzmmodid,gzzmmoddt) = (g_gzzm_m.gzzmstus,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt)
       WHERE gzzment = g_enterprise AND gzzm001 = g_gzzm001_t
 
 
      EXIT WHILE
      
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL azzi918_set_act_visible()
   CALL azzi918_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " gzzment = " ||g_enterprise|| " AND",
                      " gzzm001 = '", g_gzzm_m.gzzm001, "' "
 
   #填到對應位置
   CALL azzi918_browser_fill(g_wc,"")
 
   CLOSE azzi918_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL azzi918_msgcentre_notify('modify')
   
   LET g_worksheet_hidden = 0
   
END FUNCTION   
 
{</section>}
 
{<section id="azzi918.input" type="s" >}
#+ 資料輸入
PRIVATE FUNCTION azzi918_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point
   DEFINE p_cmd           LIKE type_t.chr1
   DEFINE l_ac_t          LIKE type_t.num10       #未取消的ARRAY CNT 
   DEFINE l_n             LIKE type_t.num10       #檢查重複用  
   DEFINE l_cnt           LIKE type_t.num10       #檢查重複用  
   DEFINE l_lock_sw       LIKE type_t.chr1        #單身鎖住否  
   DEFINE l_allow_insert  LIKE type_t.num5        #可新增否 
   DEFINE l_allow_delete  LIKE type_t.num5        #可刪除否  
   DEFINE l_count         LIKE type_t.num10
   DEFINE l_i             LIKE type_t.num10
   DEFINE l_insert        LIKE type_t.num10
   DEFINE ls_return       STRING
   DEFINE l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE l_vars          DYNAMIC ARRAY OF STRING
   DEFINE l_fields        DYNAMIC ARRAY OF STRING
   DEFINE ls_mdl_str      STRING   #180411-00062
   DEFINE lp_js           STRING   #190412-00022
   #add-point:input段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE l_str           STRING
   #end add-point
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #切換至輸入畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_gzzm_m.gzzm001,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmodid_desc,g_gzzm_m.gzzmmoddt
   
   CALL cl_set_head_visible("","YES")  
   
   #a-新增,r-複製,u-修改
   IF p_cmd = 'r' THEN
      #此段落的r動作等同於a
      LET p_cmd = 'a'
   END IF
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   LET g_qryparam.state = "i"
   
   #控制key欄位可否輸入
   CALL azzi918_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL azzi918_set_no_entry(p_cmd)
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      #單頭段
      INPUT BY NAME g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
         
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            #其他table資料備份(確定是否更改用)
            
            #add-point:input開始前 name="input.before.input"
            
            #end add-point
   
                  #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm001
            
            #add-point:AFTER FIELD gzzm001 name="input.a.gzzm001"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_gzzm_m.gzzm001
            CALL ap_ref_array2(g_ref_fields,"SELECT gzzal003 FROM gzzal_t WHERE gzzal001=? AND gzzal002='"||g_lang||"'","") RETURNING g_rtn_fields
            LET g_gzzm_m.gzzm001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_gzzm_m.gzzm001_desc

            #此段落由子樣板a05產生
            IF  NOT cl_null(g_gzzm_m.gzzm001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_gzzm_m.gzzm001 != g_gzzm001_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM gzzm_t WHERE "||"gzzment = '" ||g_enterprise|| "' AND "||"gzzm001 = '"||g_gzzm_m.gzzm001 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF

                  IF g_gzzm_m.gzzm001 = "DEFAULT" OR g_gzzm_m.gzzm001 = "REPORT" THEN 
                  ELSE 
                     #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                     INITIALIZE g_chkparam.* TO NULL
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_gzzm_m.gzzm001
                     #呼叫檢查存在並帶值的library
                     LET g_errshow = TRUE   #160318-00025#14
               LET g_chkparam.err_str[1] = "aoo-00120:sub-01302|azzi910|",cl_get_progname("azzi910",g_lang,"2"),"|:EXEPROGazzi910"    #160318-00025#14  
                     #檢查資料是否存在
                     IF cl_chk_exist("v_gzzz001") THEN
                        #檢查成功時後續處理
                     ELSE
                       #檢查失敗時後續處理
                       NEXT FIELD CURRENT
                     END IF
                  END IF 
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm001
            #add-point:BEFORE FIELD gzzm001 name="input.b.gzzm001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm001
            #add-point:ON CHANGE gzzm001 name="input.g.gzzm001"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_gzzm_m.gzzm001
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'gzzm001',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm003
            #add-point:BEFORE FIELD gzzm003 name="input.b.gzzm003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm003
            
            #add-point:AFTER FIELD gzzm003 name="input.a.gzzm003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm003
            #add-point:ON CHANGE gzzm003 name="input.g.gzzm003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm004
            #add-point:BEFORE FIELD gzzm004 name="input.b.gzzm004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm004
            
            #add-point:AFTER FIELD gzzm004 name="input.a.gzzm004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm004
            #add-point:ON CHANGE gzzm004 name="input.g.gzzm004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm002
            #add-point:BEFORE FIELD gzzm002 name="input.b.gzzm002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm002
            
            #add-point:AFTER FIELD gzzm002 name="input.a.gzzm002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm002
            #add-point:ON CHANGE gzzm002 name="input.g.gzzm002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm005
            #add-point:BEFORE FIELD gzzm005 name="input.b.gzzm005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm005
            
            #add-point:AFTER FIELD gzzm005 name="input.a.gzzm005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm005
            #add-point:ON CHANGE gzzm005 name="input.g.gzzm005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm006
            #add-point:BEFORE FIELD gzzm006 name="input.b.gzzm006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm006
            
            #add-point:AFTER FIELD gzzm006 name="input.a.gzzm006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm006
            #add-point:ON CHANGE gzzm006 name="input.g.gzzm006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm007
            #add-point:BEFORE FIELD gzzm007 name="input.b.gzzm007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm007
            
            #add-point:AFTER FIELD gzzm007 name="input.a.gzzm007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm007
            #add-point:ON CHANGE gzzm007 name="input.g.gzzm007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm010
            #add-point:BEFORE FIELD gzzm010 name="input.b.gzzm010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm010
            
            #add-point:AFTER FIELD gzzm010 name="input.a.gzzm010"
            IF NOT cl_null(g_gzzm_m.gzzm010) THEN
               LET l_str = g_gzzm_m.gzzm010
               IF l_str.getIndexOf("@",1) <= 1 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_gzzm_m.gzzm010 
                  LET g_errparam.code   = "azz-00237"   #E-Mail 格式錯誤
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm010
            #add-point:ON CHANGE gzzm010 name="input.g.gzzm010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm008
            #add-point:BEFORE FIELD gzzm008 name="input.b.gzzm008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm008
            
            #add-point:AFTER FIELD gzzm008 name="input.a.gzzm008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm008
            #add-point:ON CHANGE gzzm008 name="input.g.gzzm008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm009
            #add-point:BEFORE FIELD gzzm009 name="input.b.gzzm009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm009
            
            #add-point:AFTER FIELD gzzm009 name="input.a.gzzm009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm009
            #add-point:ON CHANGE gzzm009 name="input.g.gzzm009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzm011
            #add-point:BEFORE FIELD gzzm011 name="input.b.gzzm011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzm011
            
            #add-point:AFTER FIELD gzzm011 name="input.a.gzzm011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzm011
            #add-point:ON CHANGE gzzm011 name="input.g.gzzm011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD gzzmstus
            #add-point:BEFORE FIELD gzzmstus name="input.b.gzzmstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD gzzmstus
            
            #add-point:AFTER FIELD gzzmstus name="input.a.gzzmstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE gzzmstus
            #add-point:ON CHANGE gzzmstus name="input.g.gzzmstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.gzzm001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD gzzm001
            #add-point:ON ACTION controlp INFIELD gzzm001 name="input.c.gzzm001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_gzzm_m.gzzm001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_gzzz001_1()                                #呼叫開窗

            LET g_gzzm_m.gzzm001 = g_qryparam.return1              

            DISPLAY g_gzzm_m.gzzm001 TO gzzm001              #

            NEXT FIELD gzzm001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.gzzm003
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm003
            #add-point:ON ACTION controlp INFIELD gzzm003 name="input.c.gzzm003"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm004
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm004
            #add-point:ON ACTION controlp INFIELD gzzm004 name="input.c.gzzm004"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm002
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm002
            #add-point:ON ACTION controlp INFIELD gzzm002 name="input.c.gzzm002"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm005
            #add-point:ON ACTION controlp INFIELD gzzm005 name="input.c.gzzm005"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm006
            #add-point:ON ACTION controlp INFIELD gzzm006 name="input.c.gzzm006"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm007
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm007
            #add-point:ON ACTION controlp INFIELD gzzm007 name="input.c.gzzm007"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm010
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm010
            #add-point:ON ACTION controlp INFIELD gzzm010 name="input.c.gzzm010"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm008
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm008
            #add-point:ON ACTION controlp INFIELD gzzm008 name="input.c.gzzm008"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm009
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm009
            #add-point:ON ACTION controlp INFIELD gzzm009 name="input.c.gzzm009"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzm011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzm011
            #add-point:ON ACTION controlp INFIELD gzzm011 name="input.c.gzzm011"
            
            #END add-point
 
 
         #Ctrlp:input.c.gzzmstus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD gzzmstus
            #add-point:ON ACTION controlp INFIELD gzzmstus name="input.c.gzzmstus"
            
            #END add-point
 
 
 #欄位開窗
 
         AFTER INPUT
            #若點選cancel則離開dialog
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
            
            #錯誤訊息統整顯示
            #CALL cl_err_collect_show()
            #CALL cl_showmsg()
  
            IF p_cmd <> "u" THEN
               #當p_cmd不為u代表為新增/複製
               LET l_count = 1  
 
               #確定新增的資料不存在(不重複)
               SELECT COUNT(1) INTO l_count FROM gzzm_t
                WHERE gzzment = g_enterprise AND gzzm001 = g_gzzm_m.gzzm001
 
               IF l_count = 0 THEN
               
                  #add-point:單頭新增前 name="input.head.b_insert"
                  
                  #end add-point
               
                  #190412-00022 ---start---
                  #資料所有者與資料所有部門改為呼叫FUNCTION取得
                  LET lp_js = util.JSON.stringify(g_gzzm_m)
                  CALL cl_auth_belong_data(lp_js,"gzzm_t") RETURNING g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp
                  #190412-00022 --- end ---
 
                  #將新增的單頭資料寫入資料庫
                  INSERT INTO gzzm_t (gzzment,gzzm001,gzzm003,gzzm004,gzzm002,gzzm005,gzzm006,gzzm007,gzzm010,gzzm008,gzzm009,gzzm011,gzzmstus,gzzmownid,gzzmowndp,gzzmcrtid,gzzmcrtdp,gzzmcrtdt,gzzmmodid,gzzmmoddt)
                  VALUES (g_enterprise,g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp,g_gzzm_m.gzzmcrtid, 
                      g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt) 
                  
                  #add-point:單頭新增中 name="input.head.m_insert"
                  
                  #end add-point
                  
                  #若寫入錯誤則提示錯誤訊息並返回輸入頁面
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "gzzm_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')   #161130-00056
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  END IF
                  
                  
                  
                  #資料多語言用-增/改
                  
                     #161130-00056
                  
                  #add-point:單頭新增後 name="input.head.a_insert"
                  
                  #end add-point
                  
                  CALL s_transaction_end('Y','0')
               ELSE
               #  CALL s_transaction_end('N','0')   #(ver:51)
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_gzzm_m.gzzm001
                  LET g_errparam.code = "std-00006" 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')   #(ver:51)
                  CALL cl_err()
               END IF 
            ELSE
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL azzi918_gzzm_t_mask_restore('restore_mask_o')
               
               UPDATE gzzm_t SET (gzzm001,gzzm003,gzzm004,gzzm002,gzzm005,gzzm006,gzzm007,gzzm010,gzzm008,gzzm009,gzzm011,gzzmstus,gzzmownid,gzzmowndp,gzzmcrtid,gzzmcrtdp,gzzmcrtdt,gzzmmodid,gzzmmoddt) = (g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006, 
                   g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp,g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt)
                WHERE gzzment = g_enterprise AND gzzm001 = g_gzzm001_t #
 
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                  #  CALL s_transaction_end('N','0')   #(ver:51)
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "gzzm_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')   #(ver:51)
                     CALL cl_err()
                     NEXT FIELD CURRENT
 
                  WHEN SQLCA.SQLCODE #其他錯誤
                  #  CALL s_transaction_end('N','0')   #(ver:51)
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "gzzm_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')   #(ver:51)
                     CALL cl_err()
                     NEXT FIELD CURRENT
 
                  OTHERWISE
                     
                     #資料多語言用-增/改
                     
                        #161130-00056
                     
                     #將遮罩欄位進行遮蔽
                     CALL azzi918_gzzm_t_mask_restore('restore_mask_n')
                     
                     #add-point:單頭修改後 name="input.head.a_update"
                     
                     #end add-point
                     #修改歷程記錄(單頭修改)
                     LET g_log1 = util.JSON.stringify(g_gzzm_m_t)
                     LET g_log2 = util.JSON.stringify(g_gzzm_m)
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                        CALL s_transaction_end('N','0')
                     ELSE
                        CALL s_transaction_end('Y','0')
                     END IF
               END CASE
               
            END IF
           #controlp
      END INPUT
      
      #add-point:input段more input  name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG
         #CALL cl_err_collect_init()
         #add-point:input段before_dialog  name="input.before_dialog"
         
         #end add-point
          
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name, g_fld_name, g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         IF g_header_hidden THEN
            CALL gfrm_curr.setElementHidden("vb_master",0)
            CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
            LET g_header_hidden = 0     #visible
         ELSE
            CALL gfrm_curr.setElementHidden("vb_master",1)
            CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
            LET g_header_hidden = 1     #hidden     
         END IF
 
      ON ACTION accept
         ACCEPT DIALOG
         
      #放棄輸入
      ON ACTION cancel
         LET g_action_choice=""
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      #在dialog 右上角 (X)
      ON ACTION close 
         LET INT_FLAG = TRUE 
         EXIT DIALOG
    
      #toolbar 離開
      ON ACTION exit
         LET INT_FLAG = TRUE 
         EXIT DIALOG
   
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.reproduce" type="s" >}
#+ 資料複製
PRIVATE FUNCTION azzi918_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point
   DEFINE l_newno     LIKE gzzm_t.gzzm001 
   DEFINE l_oldno     LIKE gzzm_t.gzzm001 
 
   DEFINE l_master    RECORD LIKE gzzm_t.* #此變數樣板目前無使用
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   #先確定key值無遺漏
   IF g_gzzm_m.gzzm001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   #備份key值
   LET g_gzzm001_t = g_gzzm_m.gzzm001
 
   
   #清空key值
   LET g_gzzm_m.gzzm001 = ""
 
    
   CALL azzi918_set_entry("a")
   CALL azzi918_set_no_entry("a")
   
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_gzzm_m.gzzmownid = g_user
      LET g_gzzm_m.gzzmowndp = g_dept
      LET g_gzzm_m.gzzmcrtid = g_user
      LET g_gzzm_m.gzzmcrtdp = g_dept 
      LET g_gzzm_m.gzzmcrtdt = cl_get_current()
      LET g_gzzm_m.gzzmmodid = g_user
      LET g_gzzm_m.gzzmmoddt = cl_get_current()
      LET g_gzzm_m.gzzmstus = 'Y'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_gzzm_m.gzzmstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
      LET g_gzzm_m.gzzm001_desc = ''
   DISPLAY BY NAME g_gzzm_m.gzzm001_desc
 
   
   #資料輸入
   CALL azzi918_input("r")
   
   IF INT_FLAG THEN
      #取消
      INITIALIZE g_gzzm_m.* TO NULL
      CALL azzi918_show()
   #  CALL s_transaction_end('N','0')   #(ver:51)
      LET INT_FLAG = 0
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = 9001 
      LET g_errparam.popup = FALSE 
      CALL s_transaction_end('N','0')   #(ver:51)
      CALL cl_err()
      RETURN
   END IF
   
   CALL s_transaction_begin()
   
   #add-point:單頭複製前 name="reproduce.head.b_insert"
   
   #end add-point
   
   #add-point:單頭複製中 name="reproduce.head.m_insert"
   
   #end add-point
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "gzzm_t:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單頭複製後 name="reproduce.head.a_insert"
   
   #end add-point
   
   CALL s_transaction_end('Y','0')
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   CALL azzi918_set_act_visible()
   CALL azzi918_set_act_no_visible()
 
   #將新增的資料併入搜尋條件中
   LET g_state = "insert"
   
   LET g_gzzm001_t = g_gzzm_m.gzzm001
 
   
   #組合新增資料的條件
   LET g_add_browse = " gzzment = " ||g_enterprise|| " AND",
                      " gzzm001 = '", g_gzzm_m.gzzm001, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL azzi918_browser_fill("","")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
              
   LET g_data_owner = g_gzzm_m.gzzmownid      
   LET g_data_dept  = g_gzzm_m.gzzmowndp
   LET g_data_crtid = g_gzzm_m.gzzmcrtid   #180201-00054
   LET g_data_crtdp = g_gzzm_m.gzzmcrtdp   #180201-00054
              
   #功能已完成,通報訊息中心
   CALL azzi918_msgcentre_notify('reproduce')
                 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.show" type="s" >}
#+ 資料顯示 
PRIVATE FUNCTION azzi918_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:show段Function前置處理  name="show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
    
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL azzi918_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_gzzm_m.gzzm001
            CALL ap_ref_array2(g_ref_fields,"SELECT gzzal003 FROM gzzal_t WHERE gzzal001=? AND gzzal002='"||g_lang||"'","") RETURNING g_rtn_fields
            LET g_gzzm_m.gzzm001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_gzzm_m.gzzm001_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_gzzm_m.gzzmownid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_gzzm_m.gzzmownid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_gzzm_m.gzzmownid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_gzzm_m.gzzmowndp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_gzzm_m.gzzmowndp_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_gzzm_m.gzzmowndp_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_gzzm_m.gzzmcrtid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_gzzm_m.gzzmcrtid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_gzzm_m.gzzmcrtid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_gzzm_m.gzzmcrtdp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_gzzm_m.gzzmcrtdp_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_gzzm_m.gzzmcrtdp_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_gzzm_m.gzzmmodid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_gzzm_m.gzzmmodid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_gzzm_m.gzzmmodid_desc

   #end add-point
 
   #將資料輸出到畫面上
   DISPLAY BY NAME g_gzzm_m.gzzm001,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmodid_desc,g_gzzm_m.gzzmmoddt
   
   #儲存PK
   LET l_ac = g_current_idx
   CALL azzi918_set_pk_array()
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_gzzm_m.gzzmstus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
 
 
 
 
   #顯示有特殊格式設定的欄位或說明
   CALL cl_show_fld_cont()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.delete" type="s" >}
#+ 資料刪除 
PRIVATE FUNCTION azzi918_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   #先確定key值無遺漏
   IF g_gzzm_m.gzzm001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
    
   LET g_gzzm001_t = g_gzzm_m.gzzm001
 
   
   
 
   OPEN azzi918_cl USING g_enterprise,g_gzzm_m.gzzm001
   IF SQLCA.SQLCODE THEN    #(ver:49)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN azzi918_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CLOSE azzi918_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #200804-00006 ---start---
   FETCH azzi918_cl
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "FETCH azzi918_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CLOSE azzi918_cl
      #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
      CALL s_transaction_end('N','0')
      CALL s_transaction_begin()
      CALL cl_err()
      RETURN
   END IF
   #200804-00006 --- end ---
 
   #顯示最新的資料
   EXECUTE azzi918_master_referesh USING g_gzzm_m.gzzm001 INTO g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmmodid_desc
   
   
   #檢查是否允許此動作
   IF NOT azzi918_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_gzzm_m_mask_o.* =  g_gzzm_m.*
   CALL azzi918_gzzm_t_mask()
   LET g_gzzm_m_mask_n.* =  g_gzzm_m.*
   
   #將最新資料顯示到畫面上
   CALL azzi918_show()
   
   IF cl_ask_delete() THEN
 
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point
 
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL azzi918_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
 
      DELETE FROM gzzm_t 
       WHERE gzzment = g_enterprise AND gzzm001 = g_gzzm_m.gzzm001 
 
 
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "gzzm_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN   #161130-00056
      END IF
  
      
         #161130-00056
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      
      #end add-point
      
       
 
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_gzzm_m)   #(ver:49)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:49)
         CLOSE azzi918_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      CLEAR FORM
      CALL azzi918_ui_browser_refresh()
      
      #清空單頭資料
      INITIALIZE g_gzzm_m.* TO NULL   #180420-00043
 
      #確保畫面上保有資料
      IF g_browser_cnt > 0 THEN
         #CALL azzi918_browser_fill(g_wc,"")
         CALL azzi918_fetch("P")
      ELSE
         CLEAR FORM
      END IF
      CALL s_transaction_end('Y','0')
   ELSE    
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE azzi918_cl
 
   #功能已完成,通報訊息中心
   CALL azzi918_msgcentre_notify('delete')
 
   #add-point:單頭刪除完成後 name="delete.a_delete"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.ui_browser_refresh" type="s" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION azzi918_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_gzzm001 = g_gzzm_m.gzzm001
 
         THEN
         CALL g_browser.deleteElement(l_i)
       END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count     #page count
   DISPLAY g_header_cnt  TO FORMONLY.h_count     #page count
  
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
  
END FUNCTION
 
{</section>}
 
{<section id="azzi918.set_entry" type="s" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION azzi918_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization" 
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point     
    
   #add-point:Function前置處理 name="set_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("gzzm001",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.set_no_entry" type="s" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION azzi918_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point
   DEFINE p_cmd LIKE type_t.chr1
   #add-point:set_no_entry段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("gzzm001",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.set_act_visible" type="s" >}
#+ 單頭權限開啟
PRIVATE FUNCTION azzi918_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization" 
   
   #end add-point  
   #add-point:set_act_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   #170921-00002#1--start--
   IF cl_null(g_gzzm_m.gzzm001) THEN
      CALL cl_set_act_visible("verify_mail", FALSE)
   ELSE
      CALL cl_set_act_visible("verify_mail", TRUE)
   END IF 
   #170921-00002#1--end--
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="azzi918.set_act_no_visible" type="s" >}
#+ 單頭權限關閉
PRIVATE FUNCTION azzi918_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point
   #add-point:set_act_no_visible段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="azzi918.default_search" type="s" >}
#+ 外部參數搜尋
PRIVATE FUNCTION azzi918_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization" 
   
   #end add-point
   DEFINE li_idx  LIKE type_t.num10
   DEFINE li_cnt  LIKE type_t.num10
   DEFINE ls_wc   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="default_search.pre_function"
   
   #end add-point
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point  
   
   #根據外部參數(g_argv)組合wc
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " gzzm001 = '", g_argv[01], "' AND "
   END IF
   
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   #200330-00044 ---start---
   IF NOT cl_null(g_default_wc) THEN
      LET g_wc = g_default_wc
      LET g_default = TRUE
   ELSE
   #200330-00044 --- end ---
      IF NOT cl_null(ls_wc) THEN
         #若有外部參數則根據該參數組合
         LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
         LET g_default = TRUE
      ELSE
         #若無外部參數則預設為1=2
         LET g_default = FALSE
         #預設查詢條件
         LET g_wc = cl_qbe_get_default_qryplan()
         IF cl_null(g_wc) THEN
            LET g_wc = " 1=2"
         END IF
      END IF
   END IF   #200330-00044
   
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
   
   #181128-00048 ---start---
   #若有外部串查條件,則以該條件為主
   IF NOT cl_null(g_default_wc) THEN
      LET g_wc = g_default_wc
   END IF
   #181128-00048 --- end ---
 
   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF
 
 
END FUNCTION
 
{</section>}
 
{<section id="azzi918.mask_functions" type="s" >}
&include "erp/azz/azzi918_mask.4gl"
 
{</section>}
 
{<section id="azzi918.state_change" type="s" >}
   #應用 a09 樣板自動產生(Version:24)
#+ 確認碼變更 
PRIVATE FUNCTION azzi918_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   #180130-00006 ---start---
   #保存單頭舊值
   LET g_gzzm_m_t.* = g_gzzm_m.*
   LET g_gzzm_m_o.* = g_gzzm_m.*
   #180130-00006 --- end ---
 
   IF g_gzzm_m.gzzm001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN azzi918_cl USING g_enterprise,g_gzzm_m.gzzm001
   IF SQLCA.SQLCODE THEN
      CLOSE azzi918_cl
   #  CALL s_transaction_end('N','0')   #(ver:19)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN azzi918_cl:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')   #(ver:19)
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE azzi918_master_referesh USING g_gzzm_m.gzzm001 INTO g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmmodid_desc
   
 
   #檢查是否允許此動作
   IF NOT azzi918_action_chk() THEN
      CLOSE azzi918_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_gzzm_m.gzzm001,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp, 
       g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmodid_desc,g_gzzm_m.gzzmmoddt
 
   CASE g_gzzm_m.gzzmstus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_gzzm_m.gzzmstus
            
            WHEN "N"
               HIDE OPTION "inactive"
            WHEN "Y"
               HIDE OPTION "active"
         END CASE
     
         #181128-00048 ---start---
         #181211 SA說暫時先mark此段功能
      #  #BPM功能
      #  CALL cl_set_act_visible("reunconfirmed",FALSE)
      #  CASE g_gzzm_m.gzzmstus
      #      WHEN "A"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #      WHEN "D"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #      WHEN "R"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #  END CASE
         #181128-00048 --- end ---
 
      #add-point:menu前 name="statechange.before_menu"
      
      #end add-point
      
      
	  
      ON ACTION inactive
         IF cl_auth_chk_act("inactive") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.inactive"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION active
         IF cl_auth_chk_act("active") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.active"
            
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   LET INT_FLAG=FALSE  #(ver.18)
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      ) OR 
      g_gzzm_m.gzzmstus = lc_state OR cl_null(lc_state) THEN
      CLOSE azzi918_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_gzzm_m.gzzmmodid = g_user
   LET g_gzzm_m.gzzmmoddt = cl_get_current()
   LET g_gzzm_m.gzzmstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE gzzm_t 
      SET (gzzmstus,gzzmmodid,gzzmmoddt) 
        = (g_gzzm_m.gzzmstus,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt)     
    WHERE gzzment = g_enterprise AND gzzm001 = g_gzzm_m.gzzm001
 
    
   IF SQLCA.SQLCODE THEN
      #171011-00030 ---start---
      CLOSE azzi918_cl
      CALL s_transaction_end('N','0')
      #171011-00030 --- end ---
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      #170801-00033 ---start---
   #  CLOSE azzi918_cl   #171011-00030 mark
   #  CALL s_transaction_end('N','0')   #171011-00030 mark
      RETURN
      #170801-00033 --- end ---
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/inactive.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/active.png")
         
      END CASE
 
      #180130-00006 ---start---
      #修改歷程記錄(狀態碼修改)
      LET g_log1 = util.JSON.stringify(g_gzzm_m_t)
      LET g_log2 = util.JSON.stringify(g_gzzm_m)
      IF NOT cl_log_modified_record(g_log1,g_log2) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #180130-00006 --- end ---
    
      #撈取異動後的資料
      EXECUTE azzi918_master_referesh USING g_gzzm_m.gzzm001 INTO g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
          g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmmodid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_gzzm_m.gzzm001,g_gzzm_m.gzzm001_desc,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002,g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008,g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmownid_desc,g_gzzm_m.gzzmowndp, 
          g_gzzm_m.gzzmowndp_desc,g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtid_desc,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdp_desc,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmodid_desc,g_gzzm_m.gzzmmoddt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE azzi918_cl
   CALL s_transaction_end('Y','0')
   
   #(ver:20) ---start---
   #add-point:transaction結束後 name="statechange.transaction_after"
   
   #end add-point  
   #(ver:20) --- end --- 
 
   #功能已完成,通報訊息中心
   CALL azzi918_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="azzi918.signature" type="s" >}
   
 
{</section>}
 
{<section id="azzi918.set_pk_array" type="s" >}
   #應用 a51 樣板自動產生(Version:10)
#+ 給予pk_array內容
PRIVATE FUNCTION azzi918_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"
   
   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="set_pk_array.before"
   
   #end add-point  
 
 
   #181105-00036 ---modify start---  
   #210120-00006 ---modify start---
   CALL g_pk_array.clear()
 
   #應檢查單頭是否有資料
   IF cl_null(g_gzzm_m.gzzm001) THEN
      RETURN
   END IF
   #210120-00006 --- modify end ---
   #181105-00036 --- modify end ---
   
   LET g_pk_array[1].values = g_gzzm_m.gzzm001
   LET g_pk_array[1].column = 'gzzm001'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="azzi918.other_dialog" readonly="Y" type="s" >}
 
 
{</section>}
 
{<section id="azzi918.msgcentre_notify" type="s" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION azzi918_msgcentre_notify(lc_state)
   #add-point:msgcentre_notify段define name="msgcentre_notify.define_customerization"
   
   #end add-point   
   DEFINE lc_state LIKE type_t.chr80
   #add-point:msgcentre_notify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="msgcentre_notify.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="msgcentre_notify.pre_function"
   
   #end add-point
   
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = lc_state
 
   #PK資料填寫
   CALL azzi918_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_gzzm_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="azzi918.action_chk" type="s" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION azzi918_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization" 
   
   #end add-point
   #add-point:action_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="azzi918.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: mail 帳號同步其他企業編號功能
# Memo...........:
# Usage..........: CALL azzi918_sync_mail_account()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
# Return code....: 回传参数变量1   回传参数变量说明1
# Date & Author..: 2017/03/09 By jrg542
# Modify.........:
################################################################################
PRIVATE FUNCTION azzi918_sync_mail_account()
#170309-00019 start
   DEFINE ls_sql   STRING 
   DEFINE li_cnt   LIKE type_t.num5
   DEFINE li_cnt2  LIKE type_t.num5
   DEFINE lc_gzou001  LIKE gzou_t.gzou001
   DEFINE la_gzou_arr DYNAMIC ARRAY OF RECORD 
     lc_gzou001       LIKE gzou_t.gzou001
                   END RECORD 
   DEFINE ls_dbs   STRING     

   #寫入修改者/修改日期資訊
   LET g_gzzm_m.gzzmownid = g_user
   LET g_gzzm_m.gzzmowndp = g_dept
   LET g_gzzm_m.gzzmcrtid = g_user
   LET g_gzzm_m.gzzmcrtdp = g_dept 
   LET g_gzzm_m.gzzmcrtdt = cl_get_current()
   LET g_gzzm_m.gzzmmodid = g_user
   LET g_gzzm_m.gzzmmoddt = cl_get_current()
   LET g_gzzm_m.gzzmstus = 'Y'

   
   LET li_cnt = 1
   LET ls_sql = "SELECT gzou001 FROM gzou_t WHERE gzoustus = 'Y' "
   #備份 db 編號
   LET ls_dbs = g_dbs
   #DECLARE azzi918_cl CURSOR FROM g_forupd_sql
   DECLARE azzi918_sync_mail_cs CURSOR FROM ls_sql
   #取所有企業編號
   FOREACH azzi918_sync_mail_cs INTO la_gzou_arr[li_cnt].lc_gzou001
      LET li_cnt = li_cnt + 1
   END FOREACH 
   CALL la_gzou_arr.deleteElement(li_cnt)
   CLOSE azzi918_sync_mail_cs
   #連線到ds
   #CALL cl_db_connect("ds",TRUE)   #210218-00005#1 mark
   FOR li_cnt = 1 TO la_gzou_arr.getLength()
       #目前ent略過
       IF la_gzou_arr[li_cnt].lc_gzou001 = g_enterprise OR la_gzou_arr[li_cnt].lc_gzou001 = 99 THEN 
          CONTINUE FOR  
       END IF
       #比對其他ent  
       SELECT COUNT(1) INTO li_cnt2 FROM gzzm_t
        WHERE gzzment = la_gzou_arr[li_cnt].lc_gzou001 
         AND  gzzm001 = 'DEFAULT'    

       IF li_cnt2 = 0 THEN 

          INSERT INTO gzzm_t (gzzment,gzzm001,gzzm003,gzzm004,gzzm002,gzzm005,gzzm006,gzzm007, 
                      gzzm010,gzzm008,gzzm009,gzzm011,gzzmstus,gzzmownid,gzzmowndp,gzzmcrtid,gzzmcrtdp, 
                      gzzmcrtdt,gzzmmodid,gzzmmoddt)
                  VALUES (la_gzou_arr[li_cnt].lc_gzou001 ,'DEFAULT',g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002, 
                      g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008, 
                      g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
                      g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt)  
          DISPLAY "INSERT INTO gzzm_t sqlca.sqlcode:",sqlca.sqlcode ," ent:",la_gzou_arr[li_cnt].lc_gzou001," gzzm001:",g_gzzm_m.gzzm001
       ELSE

          #更新 
          UPDATE gzzm_t SET (gzzm001,gzzm003,gzzm004,gzzm002,gzzm005,gzzm006,gzzm007,gzzm010,gzzm008, 
                 gzzm009,gzzm011,gzzmstus,gzzmownid,gzzmowndp,gzzmcrtid,gzzmcrtdp,gzzmcrtdt,gzzmmodid, 
                 gzzmmoddt) = (g_gzzm_m.gzzm001,g_gzzm_m.gzzm003,g_gzzm_m.gzzm004,g_gzzm_m.gzzm002, 
                 g_gzzm_m.gzzm005,g_gzzm_m.gzzm006,g_gzzm_m.gzzm007,g_gzzm_m.gzzm010,g_gzzm_m.gzzm008, 
                 g_gzzm_m.gzzm009,g_gzzm_m.gzzm011,g_gzzm_m.gzzmstus,g_gzzm_m.gzzmownid,g_gzzm_m.gzzmowndp, 
                 g_gzzm_m.gzzmcrtid,g_gzzm_m.gzzmcrtdp,g_gzzm_m.gzzmcrtdt,g_gzzm_m.gzzmmodid,g_gzzm_m.gzzmmoddt) 
           WHERE gzzment = la_gzou_arr[li_cnt].lc_gzou001  AND gzzm001 = 'DEFAULT' #   
           DISPLAY "UPDATE gzzm_t sqlca.sqlcode:",sqlca.sqlcode ," ent:",la_gzou_arr[li_cnt].lc_gzou001," gzzm001:",g_gzzm_m.gzzm001   
       END IF   
   END FOR 

   #CALL cl_db_connect(ls_dbs,TRUE)   #直接做重新連線處理   #210218-00005#1 mark
#170309-00019 end   
END FUNCTION

################################################################################
# Descriptions...: 測試寄送mail
# Memo...........:
# Usage..........: CALL azzi918_verify_mail()
#                  RETURNING null
# Input parameter: 無
# Return code....: err_code, err_replace
# Date & Author..: 170921 by 08146 #170921-00002#1
# Modify.........:
################################################################################
PRIVATE FUNCTION azzi918_verify_mail()
   DEFINE ls_tmp       STRING 
   DEFINE li_result    LIKE type_t.num5
   DEFINE ls_file      STRING 
   DEFINE lc_channel   base.Channel
   DEFINE ls_text      STRING 
   DEFINE ls_path      STRING 
   DEFINE ls_str       STRING 
   DEFINE ls_str2      STRING
   DEFINE ls_str3      STRING
   DEFINE li_pos       LIKE type_t.num5
   DEFINE li_cnt       LIKE type_t.num5
   DEFINE li_chk       LIKE type_t.num5
   DEFINE li_pos2      LIKE type_t.num5
   DEFINE li_chk2      LIKE type_t.num5   
   DEFINE ls_err       STRING
   DEFINE ld_date      LIKE type_t.dat
   DEFINE l_prog_bak   STRING      #180727-00003#1 add
   
   INITIALIZE g_xml TO NULL
   
   LET l_prog_bak = g_prog         #180727-00003#1 add  備份 g_prog
   LET g_prog = g_gzzm_m.gzzm001   #180727-00003#1 add  
   
   #檢查收件人MAIL是否正確
   IF NOT cl_chk_email(g_email_addr) THEN
      RETURN "aoo-00454", g_email_addr
   END IF
   
   #先檢查畫面資料是否填寫完整
   CASE 
      #Mail Server
      WHEN cl_null(g_gzzm_m.gzzm003)
         RETURN "azz-00457","gzzm003"
      #Mail Server Port
      WHEN cl_null(g_gzzm_m.gzzm004)
         RETURN "azz-00457","gzzm004"
      #Mail Server User
      WHEN cl_null(g_gzzm_m.gzzm005)
         RETURN "azz-00457","gzzm005"
      #Mail Server User Passwd
      WHEN cl_null(g_gzzm_m.gzzm006)
         RETURN "azz-00457","gzzm006"
      
   END CASE
   
   #信件暫存檔案路徑
   LET ls_file = "azzi918_",FGL_GETPID() USING "<<<<<",".txt"
   LET ls_file = os.Path.join(FGL_GETENV("TEMPDIR"),ls_file)

   IF os.Path.exists(ls_file) THEN 
      IF os.Path.delete(ls_file) THEN END IF
   END IF
   
   #信件檔案
   LET lc_channel = base.Channel.create()
   CALL lc_channel.openFile(ls_file CLIPPED, "w" )
   CALL lc_channel.setDelimiter("")
   LET ls_text = "TEST\n"
   CALL lc_channel.write(ls_text)
   CALL lc_channel.close()
   #信件本文
   LET g_xml.body = ls_file
   
   #信件主旨
   LET g_xml.subject = "[", g_gzzm_m.gzzm001, "]", "azzi918_測試寄送"
   #寄信人
   IF NOT cl_null(g_gzzm_m.gzzm010) THEN
      LET g_xml.sender = g_gzzm_m.gzzm010
   END IF
   #收件者
   LET g_xml.recipient = g_email_addr
   #Mail Server 
   IF NOT cl_null(g_gzzm_m.gzzm003) THEN
      LET g_xml.mailserver = g_gzzm_m.gzzm003
   END IF
   #Mail Server Port
   IF NOT cl_null(g_gzzm_m.gzzm004) THEN
      LET g_xml.serverport = g_gzzm_m.gzzm004
   END IF
   #Mail Server User
   IF NOT cl_null(g_gzzm_m.gzzm005) THEN
      LET g_xml.user = g_gzzm_m.gzzm005
   END IF
   #Mail Server User Passwd
   IF NOT cl_null(g_gzzm_m.gzzm006) THEN
      LET g_xml.passwd = g_gzzm_m.gzzm006
   END IF
    
   #寄發mail
   CALL cl_jmail() RETURNING ls_tmp
   
   LET g_prog = l_prog_bak   #180727-00003#1 add 還原
   
   IF ls_tmp.getIndexOf("successfully",1) THEN 
      RETURN "azz-00456", NULL      #郵件寄送成功。
   ELSE
      RETURN "ais-00306", ls_tmp    #郵件寄送失敗，請檢核相關資訊
   END IF
END FUNCTION

 
{</section>}
 
