#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="aooi130.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0038(2021-05-11 11:02:29), PR版次:0038(2021-05-11 11:48:22)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000573
#+ Filename...: aooi130
#+ Description: 員工資料維護作業
#+ Creator....: 01258(2013-07-01 00:00:00)
#+ Modifier...: 06978 -SD/PR- 06978
 
{</section>}
 
{<section id="aooi130.global" type="s" >}
#應用 i02 樣板自動產生(Version:70)
#add-point:填寫註解說明 name="global.memo"
#160318-00005#30 2016/03/24 By 07900    重复错误信息修改
#160505-00021#2  2016/06/12 By 02295    增加ooag015，ooag016，ooag017三个栏位
#160808-00006#1  2016/08/22 By Sarah    點擊業務人員的串查按鈕，自動打開員工資料後，沒有直接顯示出業務人員資料
#160429-00013#12 2016/09/01 By Jessica  1.增加欄位ooag018(直屬主管員工編號):
#                                        (1)集團參數E-SYS-0700(是否啟用BPM協同)不為Y時，隱藏此欄位
#                                        (2)開窗q_ooag001，畫面需帶出員工全名ooag011
#                                       2.歸屬部門ooag003，輸入後處理: 若該部門的部門主管ooeg011不為空值，則將值帶入ooag018
#161019-00017#1  2016/10/20 By lixh     组织类型整批调整 
#160902-00024#7  2016/11/02 By Jessica  移除新舊相容的判斷，直接用新參數
#161024-00068#1  2016/11/07 By 08734    aooi130删除一笔资料后，aooi350相应的资料也要删除
#170618-00459#1  2017/06/18 by 08172    归属部门的栏位检查需与开窗一致，也要检查在当前据点下
#170814-00012#23 2017/09/11 By 10043    開窗q_ooeg001_4與q_ooeg001 內容相同,整批修改
#190108-00015#1  2019/01/08 By 11384    修改過員工編號时同步更新aooi350資料
#190108-00008#1  2019/01/09 By 11384    azzi850權限部門設定時同步更新到aooi130
#190312-00030#4  2019/03/19 By 01366    判斷若有勾選與HR或BPM整合，於員工基本資料異動後(Commit)，新增一筆員工主檔資料到員工兼職檔(ooah_t)
#181219-00040#8  2019/04/11 By 12132    新增/修改/刪除時，更新到nmdc
#190415-00002#1  2019/05/09 By 10130    如果有歸屬據點，那就串，如果還沒輸入歸屬據點，那就開全部部門，然後歸屬據點那邊控卡只能輸入該法人底下的據點。
#190702-00029#1  2019/07/02 By 05423    修正#190415-00002#1没有考虑到ALL的情况
#190830-00076#1  2019/09/05 By 02702    修正組SQL時，過濾權限的表格ooag_t少了別名，導致無法依權限設定控管
#190927-00053#1  2019/09/29 By 10983    修正aooi130点击整单操作员工银行账户设置闪退的问题。
#191024-00015#1  2019/12/02 By 13070    修正ooag013栏位“昵称”繁体改为简体
#200221-00009#4  2020/02/24 By 13130    修正FUNCTION回傳值型態及個數
#200319-00010#1  2020/03/20 By 07804    新增檢查，刪除前先查看基礎資料是否在azzi610受控管
#200520-00033#1  2020/05/21 By 01996    调整tables前给了固定值的写法错误
#200406-00010#14 2020/06/02 By 13589    隐藏规格【助记码】栏位
#200706-00017#1  2020/07/06 By 07556    若「其中一筆」兼職資料(aooi722)的歸屬營運據點與員工資料(aooi130)的歸屬營運據點「不同」時，員工基本資料(aooi130)的歸屬營運據點需調整為「ALL」
#200706-00036#1  2020/07/07 By 07556    刪除存在與主部門相同的兼職資料
#210315-00006#1  2021/03/15 By 06978    修正因查詢不存在的資料造成的後續查詢新資料點選功能閃退問題
#210508-00022#1  2021/05/11 By 06978    效能改善
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:46) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:46) --- end ---
 
IMPORT os
IMPORT util
IMPORT JAVA com.fourjs.fgl.lang.FglRecord  #(ver:47) add
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS   #(ver:36) add
   DEFINE mc_data_owner_check LIKE type_t.num5   #(ver:36) add
   #(ver:47) ---add start---
   #單身匯excel POI變數
   TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
   DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
   DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
   #(ver:47) --- add end ---
END GLOBALS   #(ver:36) add
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_ooag_d RECORD
       ooagstus LIKE ooag_t.ooagstus, 
   ooag001 LIKE ooag_t.ooag001, 
   ooag008 LIKE ooag_t.ooag008, 
   ooag009 LIKE ooag_t.ooag009, 
   ooag010 LIKE ooag_t.ooag010, 
   ooag011 LIKE ooag_t.ooag011, 
   ooag012 LIKE ooag_t.ooag012, 
   ooag013 LIKE ooag_t.ooag013, 
   ooag014 LIKE ooag_t.ooag014, 
   ooag001_desc LIKE oofa_t.oofa015, 
   ooag003 LIKE ooag_t.ooag003, 
   ooag003_desc LIKE ooefl_t.ooefl003, 
   ooag004 LIKE ooag_t.ooag004, 
   ooag004_desc LIKE ooefl_t.ooefl003, 
   ooag005 LIKE ooag_t.ooag005, 
   ooag005_desc LIKE oocql_t.oocql004, 
   ooag015 LIKE ooag_t.ooag015, 
   ooag015_desc LIKE oocql_t.oocql004, 
   ooag016 LIKE ooag_t.ooag016, 
   ooag017 LIKE ooag_t.ooag017, 
   ooag017_desc LIKE ooag_t.ooag011, 
   ooag018 LIKE ooag_t.ooag018, 
   ooag018_desc LIKE ooag_t.ooag011
       END RECORD
PRIVATE TYPE type_g_ooag1_info_d RECORD
       ooag001 LIKE ooag_t.ooag001, 
   ooagmodid LIKE ooag_t.ooagmodid, 
   ooagmodid_desc LIKE ooag_t.ooag011, 
   ooagmoddt DATETIME YEAR TO SECOND, 
   ooagownid LIKE ooag_t.ooagownid, 
   ooagownid_desc LIKE ooag_t.ooag011, 
   ooagowndp LIKE ooag_t.ooagowndp, 
   ooagowndp_desc LIKE ooefl_t.ooefl003, 
   ooagcrtid LIKE ooag_t.ooagcrtid, 
   ooagcrtid_desc LIKE ooag_t.ooag011, 
   ooagcrtdp LIKE ooag_t.ooagcrtdp, 
   ooagcrtdp_desc LIKE ooefl_t.ooefl003, 
   ooagcrtdt DATETIME YEAR TO SECOND
       END RECORD
 
 
 
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_esys0737         LIKE type_t.chr1           #啟用銀企直聯API        #181219-00040#8 2019/04/11 By 12132 add
#end add-point
 
#模組變數(Module Variables)
DEFINE g_ooag_d          DYNAMIC ARRAY OF type_g_ooag_d #單身變數
DEFINE g_ooag_d_t        type_g_ooag_d                  #單身備份
DEFINE g_ooag_d_o        type_g_ooag_d                  #單身備份
DEFINE g_ooag_d_mask_o   DYNAMIC ARRAY OF type_g_ooag_d #單身變數
DEFINE g_ooag_d_mask_n   DYNAMIC ARRAY OF type_g_ooag_d #單身變數
DEFINE g_ooag1_info_d   DYNAMIC ARRAY OF type_g_ooag1_info_d
DEFINE g_ooag1_info_d_t type_g_ooag1_info_d
DEFINE g_ooag1_info_d_o type_g_ooag1_info_d
DEFINE g_ooag1_info_d_mask_o DYNAMIC ARRAY OF type_g_ooag1_info_d
DEFINE g_ooag1_info_d_mask_n DYNAMIC ARRAY OF type_g_ooag1_info_d
 
      
DEFINE g_wc2                STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_temp_idx           LIKE type_t.num10             #單身 所在筆數(暫存用)
DEFINE g_detail_idx         LIKE type_t.num10             #單身 所在筆數(所有資料)
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_chk                BOOLEAN
DEFINE g_aw                 STRING                        #確定當下點擊的單身
DEFINE g_log1               STRING                        #log用
DEFINE g_log2               STRING                        #log用
DEFINE g_current_page       LIKE type_t.num10             #目前所在頁數   #(ver:42)
DEFINE g_err_rec            LIKE type_t.chr1              #紀錄是否有錯誤   #161130-00056
 
#多table用wc
DEFINE g_wc_table           STRING
 
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
 
{<section id="aooi130.main" type="s" >}
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
   CALL cl_ap_init("aoo","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
 
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT ooagstus,ooag001,ooag008,ooag009,ooag010,ooag011,ooag012,ooag013,ooag014,ooag003,ooag004,ooag005,ooag015,ooag016,ooag017,ooag018,ooag001,ooagmodid,ooagmoddt,ooagownid,ooagowndp,ooagcrtid,ooagcrtdp,ooagcrtdt FROM ooag_t WHERE ooagent=? AND ooag001=? FOR UPDATE"
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aooi130_bcl CURSOR FROM g_forupd_sql
    
 
 
   #190108-00038 ---start---
   
   #190108-00038 --- end ---
  
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      #190108-00038 ---modify start---
      OPEN WINDOW w_aooi130 WITH FORM cl_ap_formpath('aoo',g_code)
      #190108-00038 --- modify end ---   
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL aooi130_init()   
 
      #進入選單 Menu (="N")
      CALL aooi130_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_aooi130
      
   END IF 
   
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="aooi130.init" type="s" >}
#+ 畫面資料初始化
PRIVATE FUNCTION aooi130_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point
   #190108-00038 ---start---
   DEFINE tpl_msg            STRING   #200630-00032
   DEFINE tpl_node           om.DomNode
   DEFINE tpl_nodelist       om.NodeList
   DEFINE tpl_node_name      STRING
   DEFINE tpl_node_tagname   STRING
   DEFINE tpl_i              LIKE type_t.num5
   #190108-00038 --- end ---
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_e_sys_0723   LIKE type_t.chr1   #160505-00021#2
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET gwin_curr = ui.Window.getCurrent()   #180517-00033
   LET gfrm_curr = gwin_curr.getForm()      #180517-00033
 
   
   
   LET g_error_show = 1
   LET g_err_rec = "N"   #161130-00056
   
   #190108-00038 ---start---
   CALL gfrm_curr.setElementHidden('ui_change',1)   #隱藏畫面切換action
   #190108-00038 --- end ---
 
   #add-point:畫面資料初始化 name="init.init"
   #181219-00040#8 2019/04/12 By 12132 add ---s
   CALL cl_get_para(g_enterprise,'','E-SYS-0737') RETURNING g_esys0737        #啟用銀企直聯API
   IF cl_null(g_esys0737) THEN LET g_esys0737 = 'N' END IF
   #181219-00040#8 2019/04/12 By 12132 add ---e
   #160505-00021#2---add---s
   #160429-00013#12-S
   #CALL cl_set_comp_visible("ooag015,ooag015_desc,ooag016,ooag017,ooag017_desc",TRUE)                     
   CALL cl_set_comp_visible("ooag015,ooag015_desc,ooag016,ooag017,ooag017_desc,ooag018,ooag018_desc",TRUE)  

   IF NOT s_aooi723_chk_bpm() THEN      #160902-00024#7
      #CALL cl_set_comp_visible("ooag015,ooag015_desc,ooag016,ooag017,ooag017_desc",FALSE)                     
      CALL cl_set_comp_visible("ooag015,ooag015_desc,ooag016,ooag017,ooag017_desc,ooag018,ooag018_desc",FALSE) 
   #160429-00013#12-E
   END IF
   #160505-00021#2---add---e
   #end add-point
   
   #第一次進入init段時才跑default_search()，以避免後續作畫面轉換時因為重複執行init()段而導致g_wc條件值被異動
   IF cl_null(gs_first_time) OR gs_first_time <> "N" THEN   #190108-00038
      CALL aooi130_default_search()
   END IF   #190108-00038
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.ui_dialog" type="s" >}
#+ 功能選單 
PRIVATE FUNCTION aooi130_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx   LIKE type_t.num10
   DEFINE la_param  RECORD #串查用
             prog   STRING,
             param  DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE l_cmd_arg             STRING                 #報表作業cmdrun使用
   #(ver:47) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:47) --- add end ---
   #add-point:ui_dialog段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_cmd      STRING
   DEFINE l_ooag002  LIKE ooag_t.ooag002
   #end add-point 
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   LET g_action_choice = " "  
#  LET gwin_curr = ui.Window.getCurrent()   #180517-00033 mark
#  LET gfrm_curr = gwin_curr.getForm()      #180517-00033 mark
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   
   LET g_detail_idx = 1
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_ooag_d.clear()
         CALL g_ooag1_info_d.clear()
 
         LET g_wc2 = ' 1=2'
         LET g_action_choice = ""
         CALL aooi130_init()
      END IF
   
      #190108-00038 ---start---
      
      #190108-00038 --- end ---
 
      CALL aooi130_b_fill(g_wc2)
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_ooag_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body.before_display"
               
               #end add-point
               #讓各頁籤能夠同步指到特定資料
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body.before_display2"
               
               #end add-point
               
            BEFORE ROW
               #(ver:42) ---start---
               LET g_current_page = 1
               CALL aooi130_idx_chk()
               #(ver:42) --- end ---
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               LET g_data_owner = g_ooag1_info_d[g_detail_idx].ooagownid   #(ver:35)
               LET g_data_dept = g_ooag1_info_d[g_detail_idx].ooagowndp  #(ver:35)
               LET g_data_crtid = g_ooag1_info_d[g_detail_idx].ooagcrtid  #180201-00054
               LET g_data_crtdp = g_ooag1_info_d[g_detail_idx].ooagcrtdp  #180201-00054
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL aooi130_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row"
               
               #end add-point
         
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY
      
         DISPLAY ARRAY g_ooag1_info_d TO s_detail1_info.*
            ATTRIBUTES(COUNT=g_detail_cnt)  
         
            BEFORE DISPLAY 
               #add-point:ui_dialog段before display  name="ui_dialog.body1_info.before_display"
               
               #end add-point
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               #add-point:ui_dialog段before display2 name="ui_dialog.body1_info.before_display2"
               
               #end add-point
         
            BEFORE ROW
               #(ver:42) ---start---
               LET g_current_page = 2
               CALL aooi130_idx_chk()
               #(ver:42) --- end ---
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1_info")
               LET l_ac = g_detail_idx
               LET g_temp_idx = l_ac
               DISPLAY g_detail_idx TO FORMONLY.idx
               CALL cl_show_fld_cont() 
               #顯示followup圖示
               #應用 a48 樣板自動產生(Version:3)
   CALL aooi130_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
               #add-point:display array-before row name="ui_dialog.before_row1_info"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_2)
            
               
         END DISPLAY
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
    
         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1
            IF g_temp_idx > 0 THEN
               LET l_ac = g_temp_idx
               CALL DIALOG.setCurrentRow("s_detail1",l_ac)
               LET g_temp_idx = 1
            END IF
            LET g_curr_diag = ui.DIALOG.getCurrent()         
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            CALL DIALOG.setSelectionMode("s_detail1_info", 1)
 
            #add-point:ui_dialog段before name="ui_dialog.b_dialog"
            
            #end add-point
            NEXT FIELD CURRENT
      
         
         #應用 a67 樣板自動產生(Version:1)
         ON ACTION modify
            LET g_action_choice="modify"
            LET g_aw = ''
            CALL aooi130_show_ownid_msg()
            #因為不呼叫cl_auth_chk_act()，所以需另外紀錄log，
            #但紀錄log時需紀錄status，與鴻傑討論後，決議先一律紀錄成功
            CALL cl_log_act(g_action_choice,TRUE)
            CALL aooi130_modify()
            #add-point:ON ACTION modify name="menu.modify"
            
            #END add-point
            
 
 
 
 
         #應用 a67 樣板自動產生(Version:1)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            LET g_aw = g_curr_diag.getCurrentItem()
            CALL aooi130_show_ownid_msg()
            #因為不呼叫cl_auth_chk_act()，所以需另外紀錄log，
            #但紀錄log時需紀錄status，與鴻傑討論後，決議先一律紀錄成功
            CALL cl_log_act(g_action_choice,TRUE)
            CALL aooi130_modify()
            #add-point:ON ACTION modify_detail name="menu.modify_detail"
            
            #END add-point
            
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_lldz
            LET g_action_choice="open_lldz"
            IF cl_auth_chk_act("open_lldz") THEN
               
               #add-point:ON ACTION open_lldz name="menu.open_lldz"
               SELECT ooag002 INTO l_ooag002 FROM ooag_t WHERE ooagent = g_enterprise AND ooag001 = g_ooag_d[l_ac].ooag001
               CALL aooi350_01(l_ooag002)
               #END add-point
               
            END IF
 
 
 
 
         #應用 a67 樣板自動產生(Version:1)
         ON ACTION delete
            LET g_action_choice="delete"
            CALL aooi130_show_ownid_msg()
            #因為不呼叫cl_auth_chk_act()，所以需另外紀錄log，
            #但紀錄log時需紀錄status，與鴻傑討論後，決議先一律紀錄成功
            CALL cl_log_act(g_action_choice,TRUE)
            CALL aooi130_delete()
            #add-point:ON ACTION delete name="menu.delete"
            
            #END add-point
            
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL aooi130_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_txfs
            LET g_action_choice="open_txfs"
            IF cl_auth_chk_act("open_txfs") THEN
               
               #add-point:ON ACTION open_txfs name="menu.open_txfs"
               SELECT ooag002 INTO l_ooag002 FROM ooag_t WHERE ooagent = g_enterprise AND ooag001 = g_ooag_d[l_ac].ooag001
               CALL aooi350_02(l_ooag002)
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
         ON ACTION gen_ooah008
            LET g_action_choice="gen_ooah008"
            IF cl_auth_chk_act("gen_ooah008") THEN
               
               #add-point:ON ACTION gen_ooah008 name="menu.gen_ooah008"
               CALL aooi130_gen_ooah008() #190312-00030#4 add
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL aooi130_query()
               #add-point:ON ACTION query name="menu.query"
               #210315-00006#1 add---start---
               #(DEBUG無此情形)直接執行時，若查詢一不存在的資料，會造成過了aooi130_b_fill後
               #會有陣列超出範圍的報錯，l_ac為0，造成後續重新查詢出資料後，點選整單操作任一功能
               #例如通訊方式會有閃退問題
               IF l_ac = 0 THEN
                  LET l_ac = 1
               END IF
               #210315-00006#1 add---end---
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail1_info",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION batch
            LET g_action_choice="batch"
            IF cl_auth_chk_act("batch") THEN
               
               #add-point:ON ACTION batch name="menu.batch"
               CALL aooi130_batch()
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION open_yhzh
            LET g_action_choice="open_yhzh"
            IF cl_auth_chk_act("open_yhzh") THEN
               
               #add-point:ON ACTION open_yhzh name="menu.open_yhzh"
               #190927-00053#1---add---s
               IF g_detail_idx > 0 THEN
                  CALL aooi130_01(g_ooag_d[g_detail_idx].ooag001)
               END IF
               #190927-00053#1---add---e
               #CALL aooi130_01(g_ooag_d[l_ac].ooag001)    #190927-00053#1---mark               
               #END add-point
               
            END IF
 
 
 
 
      
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:47) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
 
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     CALL g_export_node.clear()
                     LET l_arr_len = g_ooag_d.getLength()
                     LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[1] = "s_detail1"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[1][l_arr_cnt] = g_ooag_d[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_ooag1_info_d.getLength()
                     LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[2] = "s_detail1_info"
                     FOR l_arr_cnt = 1 TO l_arr_len
                         LET g_export_tag[2][l_arr_cnt] = g_ooag1_info_d[l_arr_cnt]
                     END FOR
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_poi()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                     
                     #END add-point
 
                  OTHERWISE   #使用原始樣板
               #(ver:47) --- end ---
                     CALL g_export_node.clear()
                     LET g_export_node[1] = base.typeInfo.create(g_ooag_d)
                     LET g_export_id[1]   = "s_detail1"
                     LET g_export_node[2] = base.typeInfo.create(g_ooag1_info_d)
                     LET g_export_id[2]   = "s_detail1_info"
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_to_excel()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:40)
                     
                     #END add-point
               END CASE   #(ver:47) add
            END IF
       
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice="exit"
            CANCEL DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            CANCEL DIALOG
            
         
 
            #180611-00048
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL aooi130_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL aooi130_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL aooi130_set_pk_array()
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
            CONTINUE DIALOG
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="aooi130.query" type="s" >}
#+ QBE資料查詢
PRIVATE FUNCTION aooi130_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   DEFINE lp_str     STRING   #201109-00009
   #add-point:query段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_ooag_d.clear()
   
   LET g_qryparam.state = "c"
   
   #wc備份
   LET ls_wc = g_wc2
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      CONSTRUCT g_wc2 ON ooagstus,ooag001,ooag008,ooag009,ooag010,ooag011,ooag012,ooag013,ooag014,ooag003,ooag004,ooag005,ooag015,ooag016,ooag017,ooag018,ooagmodid,ooagmoddt,ooagownid,ooagowndp,ooagcrtid,ooagcrtdp,ooagcrtdt 
 
         FROM s_detail1[1].ooagstus,s_detail1[1].ooag001,s_detail1[1].ooag008,s_detail1[1].ooag009,s_detail1[1].ooag010,s_detail1[1].ooag011,s_detail1[1].ooag012,s_detail1[1].ooag013,s_detail1[1].ooag014,s_detail1[1].ooag003,s_detail1[1].ooag004,s_detail1[1].ooag005,s_detail1[1].ooag015,s_detail1[1].ooag016, 
             s_detail1[1].ooag017,s_detail1[1].ooag018,s_detail1_info[1].ooagmodid,s_detail1_info[1].ooagmoddt,s_detail1_info[1].ooagownid,s_detail1_info[1].ooagowndp,s_detail1_info[1].ooagcrtid,s_detail1_info[1].ooagcrtdp,s_detail1_info[1].ooagcrtdt 
      
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<ooagcrtdt>>----
         AFTER FIELD ooagcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<ooagmoddt>>----
         AFTER FIELD ooagmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<ooagcnfdt>>----
         
         #----<<ooagpstdt>>----
 
 
 
      
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagstus
            #add-point:BEFORE FIELD ooagstus name="query.b.page1.ooagstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooagstus
            
            #add-point:AFTER FIELD ooagstus name="query.a.page1.ooagstus"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.ooagstus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooagstus
            #add-point:ON ACTION controlp INFIELD ooagstus name="query.c.page1.ooagstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.ooag001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag001
            #add-point:ON ACTION controlp INFIELD ooag001 name="construct.c.page1.ooag001"
#此段落由子樣板a08產生
            #開窗c段
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooag001  #顯示到畫面上
            NEXT FIELD ooag001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag001
            #add-point:BEFORE FIELD ooag001 name="query.b.page1.ooag001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag001
            
            #add-point:AFTER FIELD ooag001 name="query.a.page1.ooag001"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag008
            #add-point:BEFORE FIELD ooag008 name="query.b.page1.ooag008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag008
            
            #add-point:AFTER FIELD ooag008 name="query.a.page1.ooag008"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:query.c.page1.ooag008
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag008
            #add-point:ON ACTION controlp INFIELD ooag008 name="query.c.page1.ooag008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag009
            #add-point:BEFORE FIELD ooag009 name="query.b.page1.ooag009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag009
            
            #add-point:AFTER FIELD ooag009 name="query.a.page1.ooag009"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:query.c.page1.ooag009
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag009
            #add-point:ON ACTION controlp INFIELD ooag009 name="query.c.page1.ooag009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag010
            #add-point:BEFORE FIELD ooag010 name="query.b.page1.ooag010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag010
            
            #add-point:AFTER FIELD ooag010 name="query.a.page1.ooag010"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:query.c.page1.ooag010
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag010
            #add-point:ON ACTION controlp INFIELD ooag010 name="query.c.page1.ooag010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag011
            #add-point:BEFORE FIELD ooag011 name="query.b.page1.ooag011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag011
            
            #add-point:AFTER FIELD ooag011 name="query.a.page1.ooag011"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:query.c.page1.ooag011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag011
            #add-point:ON ACTION controlp INFIELD ooag011 name="query.c.page1.ooag011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag012
            #add-point:BEFORE FIELD ooag012 name="query.b.page1.ooag012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag012
            
            #add-point:AFTER FIELD ooag012 name="query.a.page1.ooag012"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:query.c.page1.ooag012
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag012
            #add-point:ON ACTION controlp INFIELD ooag012 name="query.c.page1.ooag012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag013
            #add-point:BEFORE FIELD ooag013 name="query.b.page1.ooag013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag013
            
            #add-point:AFTER FIELD ooag013 name="query.a.page1.ooag013"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:query.c.page1.ooag013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag013
            #add-point:ON ACTION controlp INFIELD ooag013 name="query.c.page1.ooag013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag014
            #add-point:BEFORE FIELD ooag014 name="query.b.page1.ooag014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag014
            
            #add-point:AFTER FIELD ooag014 name="query.a.page1.ooag014"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:query.c.page1.ooag014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag014
            #add-point:ON ACTION controlp INFIELD ooag014 name="query.c.page1.ooag014"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.ooag003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag003
            #add-point:ON ACTION controlp INFIELD ooag003 name="construct.c.page1.ooag003"
#此段落由子樣板a08產生
            #開窗c段
            LET g_qryparam.reqry = FALSE
            #CALL q_ooeg001_4()                         #呼叫開窗   #170814-00012#23 170911 mark by 10043 
            #CALL q_ooeg001()                                       #170814-00012#23 170911  add by 10043  #190415-00002#1 mark
            #190415-00002#1 add--s
#            IF NOT cl_null(g_ooag_d[l_ac].ooag004) THEN  #190702-00029#1 mark
            IF NOT cl_null(g_ooag_d[l_ac].ooag004) AND g_ooag_d[l_ac].ooag004 <> 'ALL' THEN  #190702-00029#1 mod
               LET g_qryparam.arg2 = g_ooag_d[l_ac].ooag004
               CALL q_ooeg001_18()
            ELSE
               CALL q_ooeg001_17()
            END IF
            
            #190415-00002#1 add--e
            DISPLAY g_qryparam.return1 TO ooag003  #顯示到畫面上

            NEXT FIELD ooag003                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag003
            #add-point:BEFORE FIELD ooag003 name="query.b.page1.ooag003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag003
            
            #add-point:AFTER FIELD ooag003 name="query.a.page1.ooag003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.ooag004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag004
            #add-point:ON ACTION controlp INFIELD ooag004 name="construct.c.page1.ooag004"
#此段落由子樣板a08產生
            #開窗c段
            LET g_qryparam.reqry = FALSE
            #LET g_qryparam.where = " ooef201 = 'Y' "                             #190415-00002#1 mark
#            LET g_qryparam.where = " ooef201 = 'Y' AND ooef017 = '",g_site,"' "   #190415-00002#1 add #190702-00029#1 mark
            LET g_qryparam.where = " (ooef201 = 'Y' AND ooef017 = '",g_site,"' OR ooef001 = 'ALL')"  #190702-00029#1 add
            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = " " 
            DISPLAY g_qryparam.return1 TO ooag004  #顯示到畫面上

            NEXT FIELD ooag004                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag004
            #add-point:BEFORE FIELD ooag004 name="query.b.page1.ooag004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag004
            
            #add-point:AFTER FIELD ooag004 name="query.a.page1.ooag004"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.ooag005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag005
            #add-point:ON ACTION controlp INFIELD ooag005 name="construct.c.page1.ooag005"
            #此段落由子樣板a08產生
            #開窗c段
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "5"
            LET g_qryparam.where = " oocqstus = 'Y' "
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooag005  #顯示到畫面上
            LET g_qryparam.where = " "
            NEXT FIELD ooag005                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag005
            #add-point:BEFORE FIELD ooag005 name="query.b.page1.ooag005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag005
            
            #add-point:AFTER FIELD ooag005 name="query.a.page1.ooag005"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.ooag015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag015
            #add-point:ON ACTION controlp INFIELD ooag015 name="construct.c.page1.ooag015"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "16"
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooag015  #顯示到畫面上
            NEXT FIELD ooag015                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag015
            #add-point:BEFORE FIELD ooag015 name="query.b.page1.ooag015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag015
            
            #add-point:AFTER FIELD ooag015 name="query.a.page1.ooag015"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag016
            #add-point:BEFORE FIELD ooag016 name="query.b.page1.ooag016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag016
            
            #add-point:AFTER FIELD ooag016 name="query.a.page1.ooag016"
            
            #END add-point
            
 
 
         #Ctrlp:query.c.page1.ooag016
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag016
            #add-point:ON ACTION controlp INFIELD ooag016 name="query.c.page1.ooag016"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.ooag017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag017
            #add-point:ON ACTION controlp INFIELD ooag017 name="construct.c.page1.ooag017"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooag017  #顯示到畫面上
            NEXT FIELD ooag017                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag017
            #add-point:BEFORE FIELD ooag017 name="query.b.page1.ooag017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag017
            
            #add-point:AFTER FIELD ooag017 name="query.a.page1.ooag017"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.ooag018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag018
            #add-point:ON ACTION controlp INFIELD ooag018 name="construct.c.page1.ooag018"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooag018  #顯示到畫面上
            NEXT FIELD ooag018                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag018
            #add-point:BEFORE FIELD ooag018 name="query.b.page1.ooag018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag018
            
            #add-point:AFTER FIELD ooag018 name="query.a.page1.ooag018"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
  
         
                  #Ctrlp:construct.c.page1_info.ooagmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooagmodid
            #add-point:ON ACTION controlp INFIELD ooagmodid name="construct.c.page1_info.ooagmodid"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooagmodid  #顯示到畫面上

            NEXT FIELD ooagmodid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagmodid
            #add-point:BEFORE FIELD ooagmodid name="query.b.page1_info.ooagmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooagmodid
            
            #add-point:AFTER FIELD ooagmodid name="query.a.page1_info.ooagmodid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagmoddt
            #add-point:BEFORE FIELD ooagmoddt name="query.b.page1_info.ooagmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1_info.ooagownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooagownid
            #add-point:ON ACTION controlp INFIELD ooagownid name="construct.c.page1_info.ooagownid"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooagownid  #顯示到畫面上

            NEXT FIELD ooagownid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagownid
            #add-point:BEFORE FIELD ooagownid name="query.b.page1_info.ooagownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooagownid
            
            #add-point:AFTER FIELD ooagownid name="query.a.page1_info.ooagownid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1_info.ooagowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooagowndp
            #add-point:ON ACTION controlp INFIELD ooagowndp name="construct.c.page1_info.ooagowndp"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooagowndp  #顯示到畫面上

            NEXT FIELD ooagowndp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagowndp
            #add-point:BEFORE FIELD ooagowndp name="query.b.page1_info.ooagowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooagowndp
            
            #add-point:AFTER FIELD ooagowndp name="query.a.page1_info.ooagowndp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1_info.ooagcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooagcrtid
            #add-point:ON ACTION controlp INFIELD ooagcrtid name="construct.c.page1_info.ooagcrtid"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooagcrtid  #顯示到畫面上

            NEXT FIELD ooagcrtid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagcrtid
            #add-point:BEFORE FIELD ooagcrtid name="query.b.page1_info.ooagcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooagcrtid
            
            #add-point:AFTER FIELD ooagcrtid name="query.a.page1_info.ooagcrtid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1_info.ooagcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooagcrtdp
            #add-point:ON ACTION controlp INFIELD ooagcrtdp name="construct.c.page1_info.ooagcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO ooagcrtdp  #顯示到畫面上

            NEXT FIELD ooagcrtdp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagcrtdp
            #add-point:BEFORE FIELD ooagcrtdp name="query.b.page1_info.ooagcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooagcrtdp
            
            #add-point:AFTER FIELD ooagcrtdp name="query.a.page1_info.ooagcrtdp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagcrtdt
            #add-point:BEFORE FIELD ooagcrtdt name="query.b.page1_info.ooagcrtdt"
            
            #END add-point
 
 
  
 
      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.before_construct"
            
            #end add-point 
      
      END CONSTRUCT
  
      #add-point:query段more_construct name="query.more_construct"
      
      #end add-point 
  
      BEFORE DIALOG 
         CALL cl_qbe_init()
         #add-point:query段before_dialog name="query.before_dialog"
         
         #end add-point 
      
      ON ACTION qbe_select
         CLEAR FORM #200326-00032#1
         CALL cl_qbe_list("c") RETURNING ls_wc
      
      ON ACTION qbe_save
         CALL cl_qbe_save()
      
      ON ACTION accept 
         CALL cl_qbe_auto_save() #180530-00049#1
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
      #  CANCEL DIALOG   #(ver:44) mark
         EXIT DIALOG   #(ver:44)
      
      #交談指令共用ACTION
      &include "common_action.4gl"
      CONTINUE DIALOG 
   END DIALOG
 
   #add-point:query段after_construct name="query.after_construct"
   LET g_wc2 = cl_replace_str(g_wc2,'ooag','t0.ooag')   #160505-00021#2
   #end add-point
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      #LET g_wc2 = ls_wc
      LET g_wc2 = " 1=2"
      RETURN
   ELSE
      LET g_error_show = 1
      LET g_detail_idx = 1
   END IF
    
   CALL aooi130_b_fill(g_wc2)
   LET g_data_owner = g_ooag1_info_d[g_detail_idx].ooagownid   #(ver:35)
   LET g_data_dept = g_ooag1_info_d[g_detail_idx].ooagowndp   #(ver:35)
   LET g_data_crtid = g_ooag1_info_d[g_detail_idx].ooagcrtid   #180201-00054
   LET g_data_crtdp = g_ooag1_info_d[g_detail_idx].ooagcrtdp   #180201-00054
 
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   END IF
   
   LET INT_FLAG = FALSE
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.insert" type="s" >}
#+ 資料新增
PRIVATE FUNCTION aooi130_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point                
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #add-point:單身新增前 name="insert.b_insert"
   
   #end add-point
   
   LET g_insert = 'Y'
   CALL aooi130_modify()
            
   #add-point:單身新增後 name="insert.a_insert"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aooi130.modify" type="s" >}
#+ 資料修改
PRIVATE FUNCTION aooi130_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point
   DEFINE  l_cmd                  LIKE type_t.chr1
   DEFINE  l_ac_t                 LIKE type_t.num10               #未取消的ARRAY CNT 
   DEFINE  l_n                    LIKE type_t.num10               #檢查重複用  
   DEFINE  l_cnt                  LIKE type_t.num10               #檢查重複用  
   DEFINE  l_lock_sw              LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert         LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete         LIKE type_t.num5                #可刪除否  
   DEFINE  l_count                LIKE type_t.num10
   DEFINE  l_i                    LIKE type_t.num10
   DEFINE  ls_return              STRING
   DEFINE  l_var_keys             DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys           DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                 DYNAMIC ARRAY OF STRING
   DEFINE  l_fields               DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak         DYNAMIC ARRAY OF STRING
   DEFINE  li_reproduce           LIKE type_t.num10
   DEFINE  li_reproduce_target    LIKE type_t.num10
   DEFINE  lb_reproduce           BOOLEAN
   DEFINE  l_insert               BOOLEAN
   DEFINE  ls_mdl_str             STRING   #180411-00062
   DEFINE  ls_sqladdon_t          STRING   #200828-00027
   #add-point:modify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   DEFINE  l_oofa001       LIKE oofa_t.oofa001
   DEFINE  l_n1            LIKE type_t.num5
   DEFINE  l_ooag002       LIKE ooag_t.ooag002
   DEFINE  l_success       LIKE type_t.num5
   DEFINE  l_wc            STRING
   DEFINE  l_date          LIKE oofa_t.oofa017   #当日
   DEFINE  l_oofamoddt     DATETIME YEAR TO SECOND
   DEFINE  l_use           LIKE type_t.num5   #200319-00010#1 add
   #end add-point 
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
#  LET g_action_choice = ""   #(ver:35) mark
   
   LET g_qryparam.state = "i"
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   
   #add-point:modify開始前 name="modify.define_sql"
   
   #end add-point
   
   LET INT_FLAG = FALSE
   LET lb_reproduce = FALSE
   LET l_insert = FALSE
 
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
 
   #add-point:modify段修改前 name="modify.before_input"
   LET g_errshow = 1
   #end add-point
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #Page1 預設值產生於此處
      INPUT ARRAY g_ooag_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_detail_cnt,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_ooag_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL aooi130_b_fill(g_wc2)
            LET g_detail_cnt = g_ooag_d.getLength()
         
         BEFORE ROW
            #add-point:modify段before row name="input.body.before_row2"
            
            #end add-point  
            #(ver:42) ---start---
            LET g_current_page = 1
            CALL aooi130_idx_chk()
            #(ver:42) --- end ---
            LET l_insert = FALSE
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = g_detail_idx
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
            DISPLAY g_ooag_d.getLength() TO FORMONLY.cnt
         
            CALL s_transaction_begin()
            LET g_detail_cnt = g_ooag_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_ooag_d[l_ac].ooag001 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_ooag_d_t.* = g_ooag_d[l_ac].*  #BACKUP
               LET g_ooag_d_o.* = g_ooag_d[l_ac].*  #BACKUP
               IF NOT aooi130_lock_b("ooag_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH aooi130_bcl INTO g_ooag_d[l_ac].ooagstus,g_ooag_d[l_ac].ooag001,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag003,g_ooag_d[l_ac].ooag004,g_ooag_d[l_ac].ooag005, 
                      g_ooag_d[l_ac].ooag015,g_ooag_d[l_ac].ooag016,g_ooag_d[l_ac].ooag017,g_ooag_d[l_ac].ooag018,g_ooag1_info_d[l_ac].ooag001,g_ooag1_info_d[l_ac].ooagmodid,g_ooag1_info_d[l_ac].ooagmoddt,g_ooag1_info_d[l_ac].ooagownid,g_ooag1_info_d[l_ac].ooagowndp,g_ooag1_info_d[l_ac].ooagcrtid,g_ooag1_info_d[l_ac].ooagcrtdp, 
                      g_ooag1_info_d[l_ac].ooagcrtdt
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_ooag_d_t.ooag001,":",SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')   #(ver:39)   #190806-00019
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                     RETURN   #190806-00019
                  END IF
                  
                  #遮罩相關處理
                  LET g_ooag_d_mask_o[l_ac].* =  g_ooag_d[l_ac].*
                  CALL aooi130_ooag_t_mask()
                  LET g_ooag_d_mask_n[l_ac].* =  g_ooag_d[l_ac].*
                  
                  CALL aooi130_detail_show()
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL aooi130_set_entry_b(l_cmd)
            CALL aooi130_set_no_entry_b(l_cmd)
            #add-point:modify段before row name="input.body.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
 
            #其他table進行lock
            
 
 
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL aooi130_idx_chk()   #(ver:42)
            INITIALIZE g_ooag_d_t.* TO NULL
            INITIALIZE g_ooag_d_o.* TO NULL
            INITIALIZE g_ooag_d[l_ac].* TO NULL 
            #公用欄位給值(單身)
            #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_ooag1_info_d[l_ac].ooagownid = g_user
      LET g_ooag1_info_d[l_ac].ooagowndp = g_dept
      LET g_ooag1_info_d[l_ac].ooagcrtid = g_user
      LET g_ooag1_info_d[l_ac].ooagcrtdp = g_dept 
      LET g_ooag1_info_d[l_ac].ooagcrtdt = cl_get_current()
      LET g_ooag1_info_d[l_ac].ooagmodid = g_user
      LET g_ooag1_info_d[l_ac].ooagmoddt = cl_get_current()
      LET g_ooag_d[l_ac].ooagstus = ''
 
 
 
            #自定義預設值(單身2)
                  LET g_ooag_d[l_ac].ooag016 = "N"
 
            #add-point:modify段before備份 name="input.body.before_bak"
            
            #end add-point
            LET g_ooag_d_t.* = g_ooag_d[l_ac].*     #新輸入資料
            LET g_ooag_d_o.* = g_ooag_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_ooag_d[li_reproduce_target].* = g_ooag_d[li_reproduce].*
               LET g_ooag1_info_d[li_reproduce_target].* = g_ooag1_info_d[li_reproduce].*
 
               LET g_ooag_d[g_ooag_d.getLength()].ooag001 = NULL
 
            END IF
            
 
 
            CALL aooi130_set_entry_b(l_cmd)
            CALL aooi130_set_no_entry_b(l_cmd)
            #add-point:modify段before insert name="input.body.before_insert"
            LET g_ooag_d[l_ac].ooagstus = 'Y'
            #end add-point  
  
         AFTER INSERT
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM ooag_t 
             WHERE ooagent = g_enterprise AND ooag001 = g_ooag_d[l_ac].ooag001
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_ooag_d[g_detail_idx].ooag001
               CALL aooi130_insert_b('ooag_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               SELECT COUNT(1) INTO l_n1 FROM ooag_t WHERE ooag001 = g_ooag_d[l_ac].ooag001 AND ooagent = g_enterprise
               IF l_n1 > 0 THEN 
                  #SELECT MAX(to_number(oofa001))+1 INTO l_oofa001 FROM oofa_t
                  #CALL s_aooi350_get_oofa001() RETURNING l_success,l_oofa001
                  LET l_wc = " oofaent = '",g_enterprise,"' "
                  CALL s_aooi350_get_idno('oofa001','oofa_t',l_wc) RETURNING l_success,l_oofa001  
                  UPDATE ooag_t SET ooag002 = l_oofa001 WHERE ooag001 = g_ooag_d[l_ac].ooag001 AND ooagent = g_enterprise
                  IF SQLCA.sqlcode THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ooag_t"
                     LET g_errparam.popup = FALSE
                     CALL cl_err()

                  ELSE
                     LET l_oofamoddt = cl_get_current()
                     INSERT INTO oofa_t(oofastus,oofaent,oofa001,oofa002,oofa003,oofa004,oofa005,oofa006,
                                        oofa007,oofa008,oofa009,oofa010,oofa011,oofa012,oofa013,oofa014,oofa015,oofa016,oofa017,
                                        oofamodid,oofamoddt,oofaownid,oofaowndp,oofacrtid,oofacrtdp,oofacrtdt)
                      VALUES('Y',g_enterprise,l_oofa001,'2',g_ooag_d[l_ac].ooag001,'','','','',
                      g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,
                      g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,
                      #g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].oofa015,'','', #PGS(D)-02667 mark
                      #g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].oofa015,NULL,NULL, #PGS(D)-02667 add         #210508-00022#1 mark
                      g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag001_desc,NULL,NULL,                       #210508-00022#1 add
                      g_user,l_oofamoddt,g_user,g_dept,g_user,g_dept,l_oofamoddt)
                     
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "oofa_t"
                        LET g_errparam.popup = FALSE
                        CALL cl_err()

                        CALL s_transaction_end('N','0')
                     END IF
                     CALL aooi130_upd_ooah(g_ooag_d[l_ac].ooag001,'I',g_ooag_d_o.ooag001) RETURNING l_success #190312-00030#4 add
                     CALL aooi130_upd_ooag(g_ooag_d[l_ac].ooag001) RETURNING l_success                        #190312-00030#4 add
                  END IF
               END IF
               #end add-point
            ELSE    
               INITIALIZE g_ooag_d[l_ac].* TO NULL
            #  CALL s_transaction_end('N','0')   #(ver:39)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')   #(ver:39)
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "ooag_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL aooi130_b_fill(g_wc2)
               #資料多語言用-增/改
               
                  #161130-00056
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #上面一段pattern產生的新增多語言的資料(oofa_t)有錯誤(欄位不對應,oofa001應該與ooag002對應),先刪除掉
               #DELETE FROM oofa_t WHERE oofaent = g_enterprise AND oofa001 = g_ooag_d[l_ac].ooag001
               
               #end add-point
               CALL s_transaction_end('Y','0')
               ##ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
 
            #  LET g_wc2 = g_wc2, " OR (ooag001 = '", g_ooag_d[l_ac].ooag001, "' "   #200828-00027 mark
               LET ls_sqladdon_t= " OR (ooag001 = '", g_ooag_d[l_ac].ooag001, "' "   #200828-00027
 
                                  ,")"
               #200828-00027 -S-
               #檢查後增加,以避免被重複加入g_wc2 (代追單)
               IF NOT g_wc2.getIndexOf(ls_sqladdon_t,1) THEN
                  LET g_wc2 = g_wc2, ls_sqladdon_t      #200917-00047 偵測若已存在則不加入
               END IF
               #200828-00027 -E-
            END IF                
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
            ELSE
               #add-point:單身刪除ask前 name="input.body.b_delete_ask"
               #200319-00010#1-(S) add
               IF NOT cl_null(g_ooag_d_t.ooag001) THEN
                  CALL s_azzi610_check('14',g_ooag_d_t.ooag001,g_site) RETURNING l_success,l_use
                  IF l_use THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'azz-01159'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL s_transaction_end('N','0')
                     CALL cl_err()          
                     CANCEL DELETE
                  END IF
               END IF
               #200319-00010#1-(E) add
               #end add-point   
               
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
 
               #171006-00020 ---start---
               #確定是否有刪除的權限
               #先確定該table有ownid
               IF cl_getField("ooag_t","ooagownid") THEN
                  LET g_data_owner = g_ooag1_info_d[g_detail_idx].ooagownid
                  LET g_data_dept = g_ooag1_info_d[g_detail_idx].ooagowndp
                  LET g_data_crtid = g_ooag1_info_d[g_detail_idx].ooagcrtid   #180201-00054
                  LET g_data_crtdp = g_ooag1_info_d[g_detail_idx].ooagcrtdp   #180201-00054
                  IF NOT cl_auth_chk_act_permission("delete") THEN
                     #有目前權限無法刪除的資料
                     CANCEL DELETE
                  END IF
               END IF
               #171006-00020 --- end ---
              
               #add-point:單身刪除前 name="input.body.b_delete"
               LET l_n = 0
               #若這個員工編號已經存在gzxa_t(azzi800使用者資料設定作業)裡，則不允許刪除
               SELECT COUNT(1) INTO l_n FROM gzxa_t 
                 WHERE gzxaent = g_enterprise AND gzxa002 = '2' AND gzxa003 = g_ooag_d_t.ooag001
               IF l_n > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aoo-00271'
                  LET g_errparam.extend = g_ooag_d_t.ooag001
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CANCEL DELETE
               END IF
               
               LET l_ooag002 = ' '
               SELECT ooag002 INTO l_ooag002 FROM ooag_t WHERE ooagent = g_enterprise AND ooag001 = g_ooag_d_t.ooag001
                  
               #end add-point   
               
               DELETE FROM ooag_t
                WHERE ooagent = g_enterprise AND 
                      ooag001 = g_ooag_d_t.ooag001
 
                      
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point  
                      
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "ooag_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  CANCEL DELETE   
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1
                  
 
 
                  
 
   #161130-00056
                  #add-point:單身刪除後 name="input.body.a_delete"
                  IF NOT cl_null(l_ooag002) THEN
                     IF NOT s_aooi350_del(l_ooag002) THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "oofa_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        CALL s_transaction_end('N','0')
                     END IF
                  END IF
                  CALL aooi130_del_ooah(g_ooag_d_t.ooag001) RETURNING l_success #190312-00030#4 add
                  #end add-point
                  #修改歷程記錄(刪除)
                  CALL aooi130_set_pk_array()
                  LET g_log1 = util.JSON.stringify(g_ooag_d[l_ac])   #(ver:38)
                  IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:38)
                     CALL s_transaction_end('N','0')
                  ELSE
                     CALL s_transaction_end('Y','0')
                  END IF
               END IF 
               CLOSE aooi130_bcl
               #add-point:單身關閉bcl name="input.body.close"
               
               #end add-point
               LET l_count = g_ooag_d.getLength()
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_ooag_d_t.ooag001
 
               #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL aooi130_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            END IF 
              
         AFTER DELETE 
            IF l_cmd <> 'd' THEN
               #add-point:單身刪除後2 name="input.body.after_delete"
               
               #end add-point
                              CALL aooi130_delete_b('ooag_t',gs_keys,"'1'")
            END IF
            #如果是最後一筆
            IF l_ac = (g_ooag_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
            #add-point:單身刪除後3 name="input.body.after_delete3"
            
            #end add-point
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooagstus
            #add-point:BEFORE FIELD ooagstus name="input.b.page1.ooagstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooagstus
            
            #add-point:AFTER FIELD ooagstus name="input.a.page1.ooagstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooagstus
            #add-point:ON CHANGE ooagstus name="input.g.page1.ooagstus"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag001
            
            #add-point:AFTER FIELD ooag001 name="input.a.page1.ooag001"
            #此段落由子樣板a05產生
            IF  NOT cl_null(g_ooag_d[l_ac].ooag001) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_ooag_d[l_ac].ooag001 != g_ooag_d_t.ooag001))) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(1) FROM ooag_t WHERE "||"ooagent = '" ||g_enterprise|| "' AND "||"ooag001 = '"||g_ooag_d[l_ac].ooag001 ||"'",'std-00004',0) THEN 
                     LET g_ooag_d[l_ac].ooag001 = g_ooag_d_t.ooag001
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
                   
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag001
            #add-point:BEFORE FIELD ooag001 name="input.b.page1.ooag001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag001
            #add-point:ON CHANGE ooag001 name="input.g.page1.ooag001"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_ooag_d[l_ac].ooag001
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'ooag001',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag008
            #add-point:BEFORE FIELD ooag008 name="input.b.page1.ooag008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag008
            
            #add-point:AFTER FIELD ooag008 name="input.a.page1.ooag008"
            IF (NOT cl_null(g_ooag_d[l_ac].ooag008)) AND (NOT cl_null(g_ooag_d[l_ac].ooag010)) THEN 
                CALL s_aooi350_gen_fullname(g_site,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010) RETURNING l_success,g_ooag_d[l_ac].ooag011
             END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag008
            #add-point:ON CHANGE ooag008 name="input.g.page1.ooag008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag009
            #add-point:BEFORE FIELD ooag009 name="input.b.page1.ooag009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag009
            
            #add-point:AFTER FIELD ooag009 name="input.a.page1.ooag009"
           IF (NOT cl_null(g_ooag_d[l_ac].ooag009)) AND (NOT cl_null(g_ooag_d[l_ac].ooag008)) AND (NOT cl_null(g_ooag_d[l_ac].ooag010)) THEN 
              CALL s_aooi350_gen_fullname(g_site,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010) RETURNING l_success,g_ooag_d[l_ac].ooag011
           END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag009
            #add-point:ON CHANGE ooag009 name="input.g.page1.ooag009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag010
            #add-point:BEFORE FIELD ooag010 name="input.b.page1.ooag010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag010
            
            #add-point:AFTER FIELD ooag010 name="input.a.page1.ooag010"
            IF (NOT cl_null(g_ooag_d[l_ac].ooag008)) AND (NOT cl_null(g_ooag_d[l_ac].ooag010)) THEN 
                CALL s_aooi350_gen_fullname(g_site,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010) RETURNING l_success,g_ooag_d[l_ac].ooag011
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag010
            #add-point:ON CHANGE ooag010 name="input.g.page1.ooag010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag011
            #add-point:BEFORE FIELD ooag011 name="input.b.page1.ooag011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag011
            
            #add-point:AFTER FIELD ooag011 name="input.a.page1.ooag011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag011
            #add-point:ON CHANGE ooag011 name="input.g.page1.ooag011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag012
            #add-point:BEFORE FIELD ooag012 name="input.b.page1.ooag012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag012
            
            #add-point:AFTER FIELD ooag012 name="input.a.page1.ooag012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag012
            #add-point:ON CHANGE ooag012 name="input.g.page1.ooag012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag013
            #add-point:BEFORE FIELD ooag013 name="input.b.page1.ooag013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag013
            
            #add-point:AFTER FIELD ooag013 name="input.a.page1.ooag013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag013
            #add-point:ON CHANGE ooag013 name="input.g.page1.ooag013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag014
            #add-point:BEFORE FIELD ooag014 name="input.b.page1.ooag014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag014
            
            #add-point:AFTER FIELD ooag014 name="input.a.page1.ooag014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag014
            #add-point:ON CHANGE ooag014 name="input.g.page1.ooag014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag003
            
            #add-point:AFTER FIELD ooag003 name="input.a.page1.ooag003"
            LET g_ooag_d[l_ac].ooag003_desc = ' '
            DISPLAY g_ooag_d[l_ac].ooag003_desc TO s_detail1[l_ac].ooag003_desc
            
            IF NOT cl_null(g_ooag_d[l_ac].ooag003)  THEN 
               IF l_cmd = 'a' OR (l_cmd = 'u' AND g_ooag_d[l_ac].ooag003 != g_ooag_d_t.ooag003) THEN 
                  CALL aooi130_ooag003_ref(g_ooag_d[l_ac].ooag003) RETURNING g_ooag_d[l_ac].ooag003_desc
                  DISPLAY BY NAME g_ooag_d[l_ac].ooag003_desc
                  IF NOT s_aooi125_chk_dept(g_ooag_d[l_ac].ooag003) THEN
                     LET g_ooag_d[l_ac].ooag003 = g_ooag_d_t.ooag003
                     CALL aooi130_ooag003_ref(g_ooag_d[l_ac].ooag003) RETURNING g_ooag_d[l_ac].ooag003_desc
                     DISPLAY BY NAME g_ooag_d[l_ac].ooag003_desc
                     NEXT FIELD ooag003
                  END IF
                  #190415-00002#1 MOD--s
                  #检查有无归属据点，当有归属据点时归属部门需为归属据点下的部门，当无归属据点需查到全部部门
                  IF NOT cl_null(g_ooag_d[l_ac].ooag004) THEN
                     #170618-00459#1 -s 20170618 add by 08172
                     LET l_cnt = 0
                     SELECT COUNT(1) INTO l_cnt
                       FROM ooeg_t
                      WHERE ooegent = g_enterprise
                        AND ooeg001 = g_ooag_d[l_ac].ooag003
                        AND EXISTS ( SELECT 1 
                                       FROM ooef_t
                                      WHERE ooefent = g_enterprise
                                        AND ooef017 = ooeg009
                                        AND (ooef001 = g_site OR ooef001 = 'ALL'))  
#                        AND ooeg009 =  g_ooag_d[l_ac].ooag004        #190415-00002#1 add   #190702-00029#1 mark
                        AND (ooeg009 = g_ooag_d[l_ac].ooag004 OR g_ooag_d[l_ac].ooag004 = 'ALL')   #190702-00029#1 mod                        
                     IF l_cnt = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        #LET g_errparam.code = 'aoo-00729'           #190415-00002#1 mark
                        LET g_errparam.code = 'aoo-00775'            #190415-00002#1 add    
                        LET g_errparam.extend = g_ooag_d[l_ac].ooag003
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        
                        LET g_ooag_d[l_ac].ooag003 = g_ooag_d_t.ooag003
                        CALL aooi130_ooag003_ref(g_ooag_d[l_ac].ooag003) RETURNING g_ooag_d[l_ac].ooag003_desc
                        DISPLAY BY NAME g_ooag_d[l_ac].ooag003_desc
                        NEXT FIELD ooag003
                     END IF
                     #170618-00459#1 -e 20170618 add by 08172
                  END IF                     
                  #190415-00002#1 MOD--e                  
               END IF 
            END IF 
            CALL aooi130_ooag003_ref(g_ooag_d[l_ac].ooag003) RETURNING g_ooag_d[l_ac].ooag003_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag003_desc
            
            #160429-00013#12-S
            IF s_aooi723_chk_bpm() THEN      #160902-00024#7
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_ooag_d[l_ac].ooag003
               CALL ap_ref_array2(g_ref_fields,"SELECT ooeg011, ooag011 FROM ooeg_t LEFT OUTER JOIN ooag_t ON ooagent = ooegent AND ooag001 = ooeg011 WHERE ooegent = '"||g_enterprise||"' AND ooeg001 = ?","") 
               RETURNING g_rtn_fields
               IF g_rtn_fields[1] IS NOT NULL THEN
                  LET g_ooag_d[l_ac].ooag018      = '', g_rtn_fields[1] , ''
                  LET g_ooag_d[l_ac].ooag018_desc = '', g_rtn_fields[2] , ''
                  DISPLAY BY NAME g_ooag_d[l_ac].ooag018
                  DISPLAY BY NAME g_ooag_d[l_ac].ooag018_desc
               END IF
            END IF
            #160429-00013#12-E
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag003
            #add-point:BEFORE FIELD ooag003 name="input.b.page1.ooag003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag003
            #add-point:ON CHANGE ooag003 name="input.g.page1.ooag003"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_ooag_d[l_ac].ooag003
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'ooag003',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag004
            
            #add-point:AFTER FIELD ooag004 name="input.a.page1.ooag004"
            LET g_ooag_d[l_ac].ooag004_desc = ' '
            DISPLAY g_ooag_d[l_ac].ooag004_desc TO s_detail1[l_ac].ooag004_desc
            
            IF NOT cl_null(g_ooag_d[l_ac].ooag004) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND g_ooag_d[l_ac].ooag004 != g_ooag_d_t.ooag004) THEN 
                  IF NOT aooi130_ooag004(g_ooag_d[l_ac].ooag004) THEN
                     LET g_ooag_d[l_ac].ooag004 = g_ooag_d_t.ooag004
                     CALL aooi130_ooag004_ref(g_ooag_d[l_ac].ooag004) RETURNING g_ooag_d[l_ac].ooag004_desc
                     DISPLAY BY NAME g_ooag_d[l_ac].ooag004_desc
                     NEXT FIELD ooag004
                  END IF 
               END IF 
            END IF
            #190312-00030#4 add --start--
            #與HR整合
            IF cl_get_para(g_enterprise,g_site,'S-SYS-0004') = 'Y' THEN
               IF NOT cl_null(g_ooag_d[l_ac].ooag004) THEN
                  LET l_cnt = 0
                  SELECT count(1) INTO l_cnt
                    FROM ooah_t
                   WHERE ooahent  = g_enterprise
                     AND ooah001  = g_ooag_d[l_ac].ooag001
                     AND ooah008  = 'N'
                     AND ooahstus = 'Y'
                  IF l_cnt > 0 THEN
                     #200706-00017#1 add-s
                     LET l_cnt = 0
                     SELECT COUNT(1) INTO l_cnt 
                        FROM ooah_t
                       WHERE ooahent  = g_enterprise
                         AND ooah008  = 'N'
                         AND ooahstus = 'Y'
                         AND ooah001  = g_ooag_d[l_ac].ooag001
                         AND ooah007  != (SELECT ooag004
                                            FROM ooag_t
                                           WHERE ooagent  = g_enterprise
                                             AND ooag001  = g_ooag_d[l_ac].ooag001
                                             AND ooagstus = 'Y')
                     IF l_cnt > 0 THEN                       
                     #200706-00017#1 add-e
                        IF g_ooag_d[l_ac].ooag004 <> 'ALL' THEN #有兼職，須為ALL
                           INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'aoo-00462'   #有兼職資料不能將ALL改為特定據點，請至aooi722刪除/失效對應的兼職資料
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                           LET g_ooag_d[l_ac].ooag004 = g_ooag_d_o.ooag004
                           NEXT FIELD ooag004
                        END IF
                     END IF #200706-00017#1 add
                  ELSE
                     IF g_ooag_d[l_ac].ooag004 = 'ALL' THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aoo-00461'   #與HR整合，歸屬營運據點不可以輸入為ALL
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_ooag_d[l_ac].ooag004 = g_ooag_d_o.ooag004
                        NEXT FIELD ooag004
                     END IF
                  END IF
               END IF
            END IF
            #190312-00030#4 add --end--
            CALL aooi130_ooag004_ref(g_ooag_d[l_ac].ooag004) RETURNING g_ooag_d[l_ac].ooag004_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag004_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag004
            #add-point:BEFORE FIELD ooag004 name="input.b.page1.ooag004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag004
            #add-point:ON CHANGE ooag004 name="input.g.page1.ooag004"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_ooag_d[l_ac].ooag004
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'ooag004',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag005
            
            #add-point:AFTER FIELD ooag005 name="input.a.page1.ooag005"
            LET g_ooag_d[l_ac].ooag005_desc = ' '
            DISPLAY g_ooag_d[l_ac].ooag005_desc TO s_detail1[l_ac].ooag005_desc
            
            IF NOT cl_null(g_ooag_d[l_ac].ooag005) THEN
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_ooag_d[l_ac].ooag005 != g_ooag_d_t.ooag005) THEN 
                  #IF NOT ap_chk_isExist(g_ooag_d[l_ac].ooag005,"SELECT COUNT(*) FROM oocq_t WHERE oocqent = '" ||g_enterprise||"' AND oocq001 ='5' AND oocq002 = ? ","aoo-00086",0 ) THEN
                  #   LET g_ooag_d[l_ac].ooag005 = g_ooag_d_t.ooag005
                  #   CALL aooi130_ooag005_ref(g_ooag_d[l_ac].ooag005) RETURNING g_ooag_d[l_ac].ooag005_desc
                  #   DISPLAY BY NAME g_ooag_d[l_ac].ooag005_desc
                  #   NEXT FIELD ooag005
                  #END IF
                  #IF NOT ap_chk_isExist(g_ooag_d[l_ac].ooag005,"SELECT COUNT(*) FROM oocq_t WHERE oocqent = '" ||g_enterprise||"' AND oocqstus = 'Y' AND oocq001 ='5' AND oocq002 = ? ","aim-00015",0 ) THEN
                  #   LET g_ooag_d[l_ac].ooag005 = g_ooag_d_t.ooag005
                  #   CALL aooi130_ooag005_ref(g_ooag_d[l_ac].ooag005) RETURNING g_ooag_d[l_ac].ooag005_desc
                  #   DISPLAY BY NAME g_ooag_d[l_ac].ooag005_desc
                  #   NEXT FIELD ooag005
                  #END IF
                  IF NOT s_azzi650_chk_exist('5',g_ooag_d[l_ac].ooag005) THEN
                     LET g_ooag_d[l_ac].ooag005 = g_ooag_d_t.ooag005
                     CALL aooi130_ooag005_ref(g_ooag_d[l_ac].ooag005) RETURNING g_ooag_d[l_ac].ooag005_desc
                     DISPLAY BY NAME g_ooag_d[l_ac].ooag005_desc
                     NEXT FIELD ooag005
                  END IF
               #END IF   
            END IF
            CALL aooi130_ooag005_ref(g_ooag_d[l_ac].ooag005) RETURNING g_ooag_d[l_ac].ooag005_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag005_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag005
            #add-point:BEFORE FIELD ooag005 name="input.b.page1.ooag005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag005
            #add-point:ON CHANGE ooag005 name="input.g.page1.ooag005"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_ooag_d[l_ac].ooag005
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'ooag005',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag015
            
            #add-point:AFTER FIELD ooag015 name="input.a.page1.ooag015"
            CALL s_desc_get_acc_desc('16',g_ooag_d[l_ac].ooag015) RETURNING g_ooag_d[l_ac].ooag015_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag015_desc
            IF NOT cl_null(g_ooag_d[l_ac].ooag015) THEN 
               IF NOT s_azzi650_chk_exist('16',g_ooag_d[l_ac].ooag015) THEN
                  LET g_ooag_d[l_ac].ooag015 = g_ooag_d_t.ooag015
                  NEXT FIELD CURRENT
               END IF
            END IF            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag015
            #add-point:BEFORE FIELD ooag015 name="input.b.page1.ooag015"
            CALL s_desc_get_acc_desc('16',g_ooag_d[l_ac].ooag015) RETURNING g_ooag_d[l_ac].ooag015_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag015_desc
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag015
            #add-point:ON CHANGE ooag015 name="input.g.page1.ooag015"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_ooag_d[l_ac].ooag015
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'ooag015',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag016
            #add-point:BEFORE FIELD ooag016 name="input.b.page1.ooag016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag016
            
            #add-point:AFTER FIELD ooag016 name="input.a.page1.ooag016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag016
            #add-point:ON CHANGE ooag016 name="input.g.page1.ooag016"
            CALL aooi130_set_entry_b(l_cmd)
            CALL aooi130_set_no_entry_b(l_cmd)
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag017
            
            #add-point:AFTER FIELD ooag017 name="input.a.page1.ooag017"
            CALL s_desc_get_person_desc(g_ooag_d[l_ac].ooag017) RETURNING g_ooag_d[l_ac].ooag017_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag017_desc
            IF NOT cl_null(g_ooag_d[l_ac].ooag017) THEN 
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_ooag_d[l_ac].ooag017
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
               ELSE
                  #檢查失敗時後續處理
                  LET g_ooag_d[l_ac].ooag017 = g_ooag_d_t.ooag017
                  NEXT FIELD CURRENT
               END IF
            END IF   

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag017
            #add-point:BEFORE FIELD ooag017 name="input.b.page1.ooag017"
            CALL s_desc_get_person_desc(g_ooag_d[l_ac].ooag017) RETURNING g_ooag_d[l_ac].ooag017_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag017_desc
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag017
            #add-point:ON CHANGE ooag017 name="input.g.page1.ooag017"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_ooag_d[l_ac].ooag017
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'ooag017',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD ooag018
            
            #add-point:AFTER FIELD ooag018 name="input.a.page1.ooag018"
            #160429-00013#12-S
            #確認資料無重複
            IF  g_ooag_d[l_ac].ooag018 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_ooag_d[g_detail_idx].ooag018 != g_ooag_d_t.ooag018)) THEN 
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_ooag_d[g_detail_idx].ooag018
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooag001") THEN
                  ELSE
                     #檢查失敗時後續處理
                     LET g_ooag_d[g_detail_idx].ooag018      = g_ooag_d[g_detail_idx].ooag018
                     LET g_ooag_d[g_detail_idx].ooag018_desc = g_ooag_d_t.ooag018_desc
                     NEXT FIELD CURRENT
                  END IF  
               END IF
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_ooag_d[l_ac].ooag018
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_ooag_d[l_ac].ooag018_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_ooag_d[l_ac].ooag018_desc
            #160429-00013#12-E
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooag018
            #add-point:BEFORE FIELD ooag018 name="input.b.page1.ooag018"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooag018
            #add-point:ON CHANGE ooag018 name="input.g.page1.ooag018"
 
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.ooagstus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooagstus
            #add-point:ON ACTION controlp INFIELD ooagstus name="input.c.page1.ooagstus"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag001
            #add-point:ON ACTION controlp INFIELD ooag001 name="input.c.page1.ooag001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag008
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag008
            #add-point:ON ACTION controlp INFIELD ooag008 name="input.c.page1.ooag008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag009
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag009
            #add-point:ON ACTION controlp INFIELD ooag009 name="input.c.page1.ooag009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag010
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag010
            #add-point:ON ACTION controlp INFIELD ooag010 name="input.c.page1.ooag010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag011
            #add-point:ON ACTION controlp INFIELD ooag011 name="input.c.page1.ooag011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag012
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag012
            #add-point:ON ACTION controlp INFIELD ooag012 name="input.c.page1.ooag012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag013
            #add-point:ON ACTION controlp INFIELD ooag013 name="input.c.page1.ooag013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag014
            #add-point:ON ACTION controlp INFIELD ooag014 name="input.c.page1.ooag014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag003
            #add-point:ON ACTION controlp INFIELD ooag003 name="input.c.page1.ooag003"
#此段落由子樣板a07產生            
            #開窗i段
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ooag_d[l_ac].ooag003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_today

            #CALL q_ooeg001_4()                         #呼叫開窗   #170814-00012#23 170911 mark by 10043 
            #CALL q_ooeg001()                                       #170814-00012#23 170911  add by 10043  #190415-00002#1 mark
            #190415-00002#1 add--s
#            IF NOT cl_null(g_ooag_d[l_ac].ooag004) THEN  #190702-00029#1 mark
            IF NOT cl_null(g_ooag_d[l_ac].ooag004) AND g_ooag_d[l_ac].ooag004 <> 'ALL' THEN  #190702-00029#1 add
               LET g_qryparam.arg2 = g_ooag_d[l_ac].ooag004
               CALL q_ooeg001_18()
            ELSE
               CALL q_ooeg001_17()
            END IF
            
            #190415-00002#1 add--e
            LET g_ooag_d[l_ac].ooag003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_ooag_d[l_ac].ooag003 TO ooag003              #顯示到畫面上
            CALL aooi130_ooag003_ref(g_ooag_d[l_ac].ooag003) RETURNING g_ooag_d[l_ac].ooag003_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag003_desc
            NEXT FIELD ooag003                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag004
            #add-point:ON ACTION controlp INFIELD ooag004 name="input.c.page1.ooag004"
#此段落由子樣板a07產生            
            #開窗i段
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ooag_d[l_ac].ooag004             #給予default值

            #給予arg
            #LET g_qryparam.where = " ooef201 = 'Y' "                             #190415-00002#1 mark
#            LET g_qryparam.where = " ooef201 = 'Y' AND ooef017 = '",g_site,"' "   #190415-00002#1 add  #190702-00029#1 mark
            LET g_qryparam.where = " (ooef201 = 'Y' AND ooef017 = '",g_site,"' OR ooef001 = 'ALL') "  #190702-00029#1 add

            CALL q_ooef001()                                #呼叫開窗
            LET g_qryparam.where = " "

            LET g_ooag_d[l_ac].ooag004 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_ooag_d[l_ac].ooag004 TO ooag004              #顯示到畫面上
            CALL aooi130_ooag004_ref(g_ooag_d[l_ac].ooag004) RETURNING g_ooag_d[l_ac].ooag004_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag004_desc
            NEXT FIELD ooag004                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag005
            #add-point:ON ACTION controlp INFIELD ooag005 name="input.c.page1.ooag005"
#此段落由子樣板a07產生            
            #開窗i段
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_ooag_d[l_ac].ooag005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "5" #應用分類

            CALL q_oocq002()                                #呼叫開窗

            LET g_ooag_d[l_ac].ooag005 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_ooag_d[l_ac].ooag005 TO ooag005              #顯示到畫面上
            CALL aooi130_ooag005_ref(g_ooag_d[l_ac].ooag005) RETURNING g_ooag_d[l_ac].ooag005_desc
            DISPLAY BY NAME g_ooag_d[l_ac].ooag005_desc
            NEXT FIELD ooag005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag015
            #add-point:ON ACTION controlp INFIELD ooag015 name="input.c.page1.ooag015"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_ooag_d[l_ac].ooag015             #給予default值
            LET g_qryparam.default2 = "" #g_ooag_d[l_ac].oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = "16" #s

 
            CALL q_oocq002()                                #呼叫開窗
 
            LET g_ooag_d[l_ac].ooag015 = g_qryparam.return1              
            #LET g_ooag_d[l_ac].oocq002 = g_qryparam.return2 
            DISPLAY g_ooag_d[l_ac].ooag015 TO ooag015              #
            #DISPLAY g_ooag_d[l_ac].oocq002 TO oocq002 #應用分類碼
            NEXT FIELD ooag015                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag016
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD ooag016
            #add-point:ON ACTION controlp INFIELD ooag016 name="input.c.page1.ooag016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag017
            #add-point:ON ACTION controlp INFIELD ooag017 name="input.c.page1.ooag017"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_ooag_d[l_ac].ooag017             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001()                                #呼叫開窗
 
            LET g_ooag_d[l_ac].ooag017 = g_qryparam.return1              

            DISPLAY g_ooag_d[l_ac].ooag017 TO ooag017              #

            NEXT FIELD ooag017                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.ooag018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooag018
            #add-point:ON ACTION controlp INFIELD ooag018 name="input.c.page1.ooag018"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_ooag_d[l_ac].ooag018             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001()                                #呼叫開窗
 
            LET g_ooag_d[l_ac].ooag018 = g_qryparam.return1              

            DISPLAY g_ooag_d[l_ac].ooag018 TO ooag018              #

            NEXT FIELD ooag018                          #返回原欄位



            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               CLOSE aooi130_bcl
            #  CALL s_transaction_end('N','0')   #(ver:39)
               LET INT_FLAG = 0
               LET g_ooag_d[l_ac].* = g_ooag_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL s_transaction_end('N','0')   #(ver:39)
               CALL cl_err()
               #add-point:單身取消時 name="input.body.cancel"
               
               #end add-point
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_ooag_d[l_ac].ooag001 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_ooag_d[l_ac].* = g_ooag_d_t.*
            ELSE
               #寫入修改者/修改日期資訊(單身)
               LET g_ooag1_info_d[l_ac].ooagmodid = g_user 
LET g_ooag1_info_d[l_ac].ooagmoddt = cl_get_current()
LET g_ooag1_info_d[l_ac].ooagmodid_desc = cl_get_username(g_ooag1_info_d[l_ac].ooagmodid)
            
               #add-point:單身修改前 name="input.body.b_update"
               SELECT ooag002 INTO l_ooag002 FROM ooag_t WHERE ooag001 = g_ooag_d_t.ooag001  AND ooagent = g_enterprise #190108-00015#1 add by 11384
               #end add-point
               
               #將遮罩欄位還原
               CALL aooi130_ooag_t_mask_restore('restore_mask_o')
 
               UPDATE ooag_t SET (ooagstus,ooag001,ooag008,ooag009,ooag010,ooag011,ooag012,ooag013,ooag014,ooag003,ooag004,ooag005,ooag015,ooag016,ooag017,ooag018,ooagmodid,ooagmoddt,ooagownid,ooagowndp,ooagcrtid,ooagcrtdp,ooagcrtdt) = (g_ooag_d[l_ac].ooagstus,g_ooag_d[l_ac].ooag001,g_ooag_d[l_ac].ooag008, 
                   g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag003,g_ooag_d[l_ac].ooag004,g_ooag_d[l_ac].ooag005,g_ooag_d[l_ac].ooag015,g_ooag_d[l_ac].ooag016,g_ooag_d[l_ac].ooag017,g_ooag_d[l_ac].ooag018, 
                   g_ooag1_info_d[l_ac].ooagmodid,g_ooag1_info_d[l_ac].ooagmoddt,g_ooag1_info_d[l_ac].ooagownid,g_ooag1_info_d[l_ac].ooagowndp,g_ooag1_info_d[l_ac].ooagcrtid,g_ooag1_info_d[l_ac].ooagcrtdp,g_ooag1_info_d[l_ac].ooagcrtdt)
                WHERE ooagent = g_enterprise AND
                  ooag001 = g_ooag_d_t.ooag001 #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
 
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                  #  CALL s_transaction_end('N','0')   #(ver:39)
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "ooag_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')   #(ver:39)
                     CALL cl_err()
                  WHEN SQLCA.SQLCODE #其他錯誤
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "ooag_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_ooag_d[g_detail_idx].ooag001
               LET gs_keys_bak[1] = g_ooag_d_t.ooag001
               CALL aooi130_update_b('ooag_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
                        #161130-00056
                     #修改歷程記錄(修改)
                     LET g_log1 = util.JSON.stringify(g_ooag_d_t)
                     LET g_log2 = util.JSON.stringify(g_ooag_d[l_ac])
                     IF NOT cl_log_modified_record(g_log1,g_log2) THEN
                        CALL s_transaction_end('N','0')
                     END IF
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL aooi130_ooag_t_mask_restore('restore_mask_n')
               
               #add-point:單身修改後 name="input.body.a_update"
#               SELECT ooag002 INTO l_ooag002 FROM ooag_t WHERE ooag001 = g_ooag_d_t.ooag001  AND ooagent = g_enterprise #190108-00015#1 mark by 11384             
#190108-00015#1 mark_S by 11384               
#               UPDATE oofa_t SET (oofa008,oofa009,oofa010,oofa011,oofa012,oofa013,oofa014,oofa015)
#                               = (g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].oofa015)
#                WHERE oofaent = g_enterprise AND oofa001 = l_ooag002  
#190108-00015#1 mark_E by 11384
#190108-00015#1 add_S by 11384
               UPDATE oofa_t SET (oofa003,oofa008,oofa009,oofa010,oofa011,oofa012,oofa013,oofa014,oofa015)
                               = (g_ooag_d[l_ac].ooag001,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,
                                  g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,
                                  #g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].oofa015)       #210508-00022#1 mark
                                  g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag001_desc)   #210508-00022#1 add
                 WHERE oofaent = g_enterprise 
                   AND oofa001 = l_ooag002  
#190108-00015#1 add_E by 11384
               CALL aooi130_upd_ooah(g_ooag_d[l_ac].ooag001,'U',g_ooag_d_t.ooag001) RETURNING l_success #190312-00030#4 add
               CALL aooi130_upd_ooag(g_ooag_d[l_ac].ooag001) RETURNING l_success                        #190312-00030#4 add
               #181219-00040#8 2019/04/11 By 12132 add ---s
               #有啟用銀企直聯API時員工編號有異動要更新nmdc_t
               IF g_esys0737= 'Y' THEN
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt
                    FROM nmdc_t
                   WHERE nmdcent = g_enterprise
                     AND nmdc001 = g_ooag_d_t.ooag001
                  IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
                  IF l_cnt = 0 THEN
                     INSERT INTO nmdc_t (nmdcent,nmdc001,nmdc002,nmdc003,nmdc004,
                                         nmdc005,nmdc006,nmdcstus)
                     VALUES (g_enterprise,g_ooag_d[l_ac].ooag001,'','','',
                             'CNY','',g_ooag_d[l_ac].ooagstus)
                      IF SQLCA.SQLcode  THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "INSERT INTO nmdc_t"   
                        LET g_errparam.popup = TRUE
                        CALL s_transaction_end('N','0')      
                        CALL cl_err()
                      ELSE
                        CALL s_transaction_end('Y','0')
                      END IF
                  ELSE
                     UPDATE nmdc_t
                        SET (nmdc001,nmdcstus)  = (g_ooag_d[l_ac].ooag001,g_ooag_d[l_ac].ooagstus)
                      WHERE nmdcent  = g_enterprise
                        AND nmdc001  = g_ooag_d_t.ooag001
                     IF SQLCA.SQLcode  THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "UPDATE nmdc_t"   
                        LET g_errparam.popup = TRUE
                        CALL s_transaction_end('N','0')      
                        CALL cl_err()
                     ELSE
                        CALL s_transaction_end('Y','0')
                     END IF
                  END IF  
               END IF                  
               #181219-00040#8 2019/04/11 By 12132 add ---e
               #end add-point
 
            END IF
            
         AFTER ROW
            CALL aooi130_unlock_b("ooag_t")
            IF INT_FLAG THEN
            #  CALL s_transaction_end('N','0')   #(ver:39)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL s_transaction_end('N','0')   #(ver:39)
               CALL cl_err()
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_ooag_d[l_ac].* = g_ooag_d_t.*
               END IF
               #add-point:單身after row name="input.body.a_close"
               
               #end add-point
               EXIT DIALOG   #(ver:44)
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #其他table進行unlock
            
             #add-point:單身after row name="input.body.a_row"
            
            #end add-point
            
         AFTER INPUT
            #add-point:單身input後 name="input.body.a_input"
            
            #end add-point
            #錯誤訊息統整顯示
            #CALL cl_err_collect_show()
            #CALL cl_showmsg()
            
         ON ACTION controlo   
            IF l_insert THEN
               #170920-00028 ---modify start---
               #新增判斷是否有上一筆資料可供複製
               IF l_ac_t <= 0 OR l_ac_t IS NULL THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = "adz-01032"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               ELSE
                  LET li_reproduce = l_ac_t
                  LET li_reproduce_target = l_ac
                  LET g_ooag_d[li_reproduce_target].* = g_ooag_d[li_reproduce].*
               LET g_ooag1_info_d[li_reproduce_target].* = g_ooag1_info_d[li_reproduce].*
 
                  LET g_ooag_d[li_reproduce_target].ooag001 = NULL
 
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_ooag_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_ooag_d.getLength()+1
            END IF
            #(ver:43) ---start---
            #add-point:單身複製後 name="input.body.controlo"
            
            #end add-point
            #(ver:43) --- end ---
            
      END INPUT
      
 
      
      DISPLAY ARRAY g_ooag1_info_d TO s_detail1_info.*
         ATTRIBUTES(COUNT=g_detail_cnt)  
      
         BEFORE DISPLAY 
            CALL aooi130_b_fill(g_wc2)
            CALL FGL_SET_ARR_CURR(g_detail_idx)
      
         BEFORE ROW
            #(ver:42) ---start---
            LET g_current_page = 2
            CALL aooi130_idx_chk()
            #(ver:42) --- end ---
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1_info")
            LET l_ac = g_detail_idx
            LET g_temp_idx = l_ac
            DISPLAY g_detail_idx TO FORMONLY.idx
            CALL cl_show_fld_cont() 
            
         #add-point:page2自定義行為 name="input.body1_info.action"
         
         #end add-point
            
      END DISPLAY
 
      
      #add-point:before_more_input name="input.more_input"
      
      #end add-point
      
      BEFORE DIALOG
         #CALL cl_err_collect_init()      
         IF g_temp_idx > 0 THEN
            LET l_ac = g_temp_idx
            CALL DIALOG.setCurrentRow("s_detail1",l_ac)
            LET g_temp_idx = 1
         END IF
         #LET g_curr_diag = ui.DIALOG.getCurrent()
         #add-point:before_dialog name="input.before_dialog"
         
         #end add-point
         CASE g_aw
            WHEN "s_detail1"
               NEXT FIELD ooagstus #170906-00011#1
 
         END CASE
   
      ON ACTION accept
         ACCEPT DIALOG
      
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         #(ver:45) ---start---
         #add-point:modify段cancel name="query.cancel"
         
         #end add-point
         #(ver:45) --- end ---
      #  CANCEL DIALOG   #(ver:44) mark
         EXIT DIALOG   #(ver:44)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) 
              RETURNING g_fld_name,g_frm_name 
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) 
           
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   
   END DIALOG 
    
   #新增後取消
   IF l_cmd = 'a' THEN
      #當取消或無輸入資料按確定時刪除對應資料
      IF INT_FLAG OR cl_null(g_ooag_d[g_detail_idx].ooag001) THEN
         CALL g_ooag_d.deleteElement(g_detail_idx)
         CALL g_ooag1_info_d.deleteElement(g_detail_idx)
 
         CALL aooi130_idx_chk()   #(ver:42)
      END IF
   END IF
   
   #修改後取消
   IF l_cmd = 'u' AND INT_FLAG THEN
      LET g_ooag_d[g_detail_idx].* = g_ooag_d_t.*
   END IF
   
   #add-point:modify段修改後 name="modify.after_input"
   
   #end add-point
 
   CLOSE aooi130_bcl
   CALL s_transaction_end('Y','0')
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.delete" type="s" >}
#+ 資料刪除
PRIVATE FUNCTION aooi130_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point
   DEFINE li_idx          LIKE type_t.num10
   DEFINE li_ac_t         LIKE type_t.num10
   DEFINE li_detail_tmp   LIKE type_t.num10
   DEFINE l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak  DYNAMIC ARRAY OF STRING
   DEFINE l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE l_vars          DYNAMIC ARRAY OF STRING
   DEFINE l_fields        DYNAMIC ARRAY OF STRING
   #add-point:delete段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE l_oofa001       LIKE oofa_t.oofa001
   DEFINE l_sql           STRING
   DEFINE  l_oofa     RECORD
                      oofa001 LIKE oofa_t.oofa001
                      END RECORD
   DEFINE  l_success      LIKE type_t.num5 #190312-00030#4 add   
   DEFINE l_use           LIKE type_t.num5 #200319-00010#1 add
   #end add-point 
   
   #add-point:Function前置處理  name="delete.body.before_delete"
   
   #end add-point
   
   LET g_curr_diag = ui.DIALOG.getCurrent() #(ver:45)
 
   CALL s_transaction_begin()
   
   LET li_ac_t = l_ac
   
   LET li_detail_tmp = g_detail_idx
    
   #lock所有所選資料
   FOR li_idx = 1 TO g_ooag_d.getLength()
      LET g_detail_idx = li_idx
      #已選擇的資料
      IF g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         #確定是否有被鎖定
         IF NOT aooi130_lock_b("ooag_t") THEN
            #已被他人鎖定
            CALL s_transaction_end('N','0')
            RETURN
         END IF
 
         #(ver:35) ---add start---
         #確定是否有刪除的權限
         #先確定該table有ownid
      #  IF cl_getField("ooag_t","ooagownid") THEN   #171006-00020 mark
         IF cl_getField("ooag_t","ooagownid") THEN   #171006-00020 modify
            LET g_data_owner = g_ooag1_info_d[g_detail_idx].ooagownid
            LET g_data_dept = g_ooag1_info_d[g_detail_idx].ooagowndp
            LET g_data_crtid = g_ooag1_info_d[g_detail_idx].ooagcrtid   #180201-00054
            LET g_data_crtdp = g_ooag1_info_d[g_detail_idx].ooagcrtdp   #180201-00054
            IF NOT cl_auth_chk_act_permission("delete") THEN
               #有目前權限無法刪除的資料
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         END IF
         #(ver:35) --- add end ---
      END IF
   END FOR
   
   #add-point:單身刪除詢問前 name="delete.body.b_delete_ask"
   #200319-00010#1-(S) add
   IF li_detail_tmp > 0 THEN
      CALL s_azzi610_check('14',g_ooag_d[li_detail_tmp].ooag001,g_site) RETURNING l_success,l_use
      IF l_use THEN
         INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'azz-01159'
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE
          CALL s_transaction_end('N','0')
          CALL cl_err()          
          RETURN
      END IF
   END IF
   #200319-00010#1-(E) add
   #end add-point  
   
   #詢問是否確定刪除所選資料
   IF NOT cl_ask_del_detail() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   FOR li_idx = 1 TO g_ooag_d.getLength()
      IF g_ooag_d[li_idx].ooag001 IS NOT NULL
 
         AND g_curr_diag.isRowSelected(g_curr_diag.getCurrentItem(), li_idx) THEN 
         
         #add-point:單身刪除前 name="delete.body.b_delete"
         
         #end add-point   
         
         DELETE FROM ooag_t
          WHERE ooagent = g_enterprise AND 
                ooag001 = g_ooag_d[li_idx].ooag001
 
         #add-point:單身刪除中 name="delete.body.m_delete"
         #161024-00068#1  2016/11/07 By 08734 add(S)
         LET l_sql =" SELECT oofa001 ",
                    " FROM oofa_t ",
                    " WHERE oofaent ='",g_enterprise,"'", 
                    " AND oofa003 = '",g_ooag_d[li_idx].ooag001,"'"
         PREPARE aooi130_pre FROM l_sql
         DECLARE aooi350_del CURSOR FOR aooi130_pre
         INITIALIZE l_oofa001 TO NULL
         FOREACH aooi350_del INTO l_oofa.oofa001
            IF NOT cl_null(l_oofa.oofa001) THEN
               IF NOT s_aooi350_del(l_oofa.oofa001) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "oofa_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
         
                  CALL s_transaction_end('N','0')
               END IF
            END IF
          #  DELETE FROM oofa_t
          #     WHERE oofaent = g_enterprise AND 
          #        oofa001 = l_oofa.oofa001
          #  IF SQLCA.sqlcode THEN
          #     INITIALIZE g_errparam TO NULL
          #     LET g_errparam.code = SQLCA.sqlcode
          #     LET g_errparam.extend = "oofa_t:",SQLERRMESSAGE 
          #     LET g_errparam.popup = TRUE
          #     CALL cl_err()                  
          #     CALL s_transaction_end('N','0')
          #     RETURN 
          #  END IF
            
         END FOREACH
         FREE aooi130_pre
         #161024-00068#1  2016/11/07 By 08734 add(E)
         #end add-point  
                
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "ooag_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            RETURN
         ELSE 
            #(ver:41) ---start---
            #修改歷程記錄(刪除)
            LET g_log1 = util.JSON.stringify(g_ooag_d[li_idx])
            IF NOT cl_log_modified_record(g_log1,'') THEN
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            #(ver:41) --- end ---
 
            LET g_detail_cnt = g_detail_cnt-1
            LET l_ac = li_idx
            
 
 
            
 
 
 
            
 
 
            
 
   #161130-00056
            
 
 
            
 
   #161130-00056
 
            #add-point:單身同步刪除前(同層table) name="delete.body.a_delete"
            
            #end add-point
            LET g_detail_idx = li_idx
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_ooag_d_t.ooag001
 
            #add-point:單身同步刪除中(同層table) name="delete.body.a_delete2"
            
            #end add-point
                           CALL aooi130_delete_b('ooag_t',gs_keys,"'1'")
            #add-point:單身同步刪除後(同層table) name="delete.body.a_delete3"
            CALL aooi130_del_ooah(g_ooag_d[li_idx].ooag001) RETURNING l_success #190312-00030#4 add
            #end add-point
            #刪除相關文件
            #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL aooi130_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove.func"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
 
            
         END IF 
      END IF 
    
   END FOR
   CALL s_transaction_end('Y','0')
   
   LET g_detail_idx = li_detail_tmp
            
   #add-point:單身刪除後 name="delete.after"
 
   #end add-point  
   
   LET l_ac = li_ac_t
   
   #刷新資料
   CALL aooi130_b_fill(g_wc2)
            
END FUNCTION
 
{</section>}
 
{<section id="aooi130.b_fill" type="s" >}
#+ 單身陣列填充
PRIVATE FUNCTION aooi130_b_fill(p_wc2)              #BODY FILL UP
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE p_wc2            STRING
   DEFINE ls_owndept_list  STRING  #(ver:35) add
   DEFINE ls_ownuser_list  STRING  #(ver:35) add
   #add-point:b_fill段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_ooag002       LIKE ooag_t.ooag002
   DEFINE l_wc            STRING   #190108-00008#1 add By 11384
   DEFINE l_sql           STRING   #190108-00008#1 add By 11384   
   #end add-point
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   IF cl_null(p_wc2) THEN
      LET p_wc2 = " 1=1"
   END IF
   
   #add-point:b_fill段sql之前 name="b_fill.sql_before"
#160808-00006#1-s add
   IF NOT p_wc2.getIndexOf("t0",1) THEN
      LET p_wc2 = cl_replace_str(p_wc2,'ooag','t0.ooag')
   END IF
#160808-00006#1-e add
   #end add-point
 
   LET g_sql = "SELECT  DISTINCT t0.ooagstus,t0.ooag001,t0.ooag008,t0.ooag009,t0.ooag010,t0.ooag011,t0.ooag012,t0.ooag013,t0.ooag014,t0.ooag003,t0.ooag004,t0.ooag005,t0.ooag015,t0.ooag016,t0.ooag017,t0.ooag018,t0.ooag001,t0.ooagmodid,t0.ooagmoddt,t0.ooagownid,t0.ooagowndp,t0.ooagcrtid,t0.ooagcrtdp,t0.ooagcrtdt , 
       t1.oofa015 ,t2.ooefl003 ,t3.ooefl003 ,t4.oocql004 ,t5.oocql004 ,t6.ooag011 ,t7.ooag011 ,t8.ooag011 ,t9.ooag011 ,t10.ooefl003 ,t11.ooag011 ,t12.ooefl003 FROM ooag_t t0",
               "",
                              " LEFT JOIN oofa_t t1 ON t1.oofaent="||g_enterprise||" AND t1.oofa001=t0.ooag002  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.ooag003 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.ooag004 AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='5' AND t4.oocql002=t0.ooag005 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='16' AND t5.oocql002=t0.ooag015 AND t5.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.ooag017  ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.ooag018  ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.ooagmodid  ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.ooagownid  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.ooagowndp AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.ooagcrtid  ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.ooagcrtdp AND t12.ooefl002='"||g_dlang||"' ",
 
               " WHERE t0.ooagent= ?  AND  1=1 AND (", p_wc2, ") "
 
   #(ver:35) ---add start---
      #應用 a68 樣板自動產生(Version:3)
   #若是修改，須視權限加上條件
#  IF g_action_choice = "modify" OR g_action_choice = "modify_detail" THEN   #(ver:2) mark
   IF g_action_choice = "modify" OR g_action_choice = "modify_detail"
      #170515-00054 新增g_action_choice = 'insert'，
      #為了怕使用者先按了新增卻直接去修改其他筆資料，因此將insert時也加入權限控管
      OR g_action_choice = 'insert'
   THEN
      LET ls_owndept_list = NULL
      LET ls_ownuser_list = NULL
 
      #若有設定部門權限
      CALL cl_get_owndept_list("ooag_t","modify") RETURNING ls_owndept_list
      IF NOT cl_null(ls_owndept_list) THEN
      #  LET g_sql = g_sql, " AND ooagowndp IN (",ls_owndept_list,")"   #180201-00054 mark
         LET g_sql = g_sql, " AND (ooagowndp IN (",ls_owndept_list,")",  #180201-00054 modify
                                 " OR (ooagcrtid = '",g_user,"' AND ooagcrtdp = '",g_dept,"'))"   #180201-00054 modify
      END IF
 
      #若有設定個人權限
      CALL cl_get_ownuser_list("ooag_t","modify") RETURNING ls_ownuser_list
      IF NOT cl_null(ls_ownuser_list) THEN
      #  LET g_sql = g_sql," AND ooagownid IN (",ls_ownuser_list,")"   ##180201-00054 mark
         LET g_sql = g_sql," AND (ooagownid IN (",ls_ownuser_list,") OR ooagcrtid = '",g_user,"')"   #180201-00054 modify
      END IF
   END IF
 
 
 
   #(ver:35) --- add end ---
 
   #add-point:b_fill段sql wc name="b_fill.sql_wc"
  #190830-00076#1 add ---s---
   LET g_sql = cl_replace_str(g_sql,'(ooagownid','(t0.ooagownid')
   LET g_sql = cl_replace_str(g_sql,' ooagcrtid',' t0.ooagcrtid')
   LET g_sql = cl_replace_str(g_sql,'(ooagcrtid','(t0.ooagcrtid')
   LET g_sql = cl_replace_str(g_sql,' ooagcrtdp',' t0.ooagcrtdp')
  #190830-00076#1 add ---e---
  
   LET l_sql = g_sql  #190108-00008#1 add By 11384
   #end add-point
   LET g_sql = g_sql, cl_sql_add_filter("ooag_t"),
                      " ORDER BY t0.ooag001"
   
   #add-point:b_fill段sql之後 name="b_fill.sql_after"
   #190108-00008#1 add_S By 11384
   LET g_sql = l_sql    
   LET l_wc = cl_sql_add_filter("ooag_t")
   IF NOT l_wc.getIndexOf("t0",1) THEN
      LET l_wc = cl_replace_str(l_wc,'ooag','t0.ooag')
   END IF
   LET g_sql = g_sql, l_wc," ORDER BY t0.ooag001"                 
   #190108-00008#1 add_E By 11384
   #end add-point
   
   #LET g_sql = cl_sql_add_tabid(g_sql,"ooag_t")            #WC重組
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE aooi130_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR aooi130_pb
   
   #OPEN b_fill_curs USING g_enterprise #181211-00007#1
 
   CALL g_ooag_d.clear()
   CALL g_ooag1_info_d.clear()   
 
 
   LET g_cnt = l_ac
   LET l_ac = 1   
#  ERROR "Searching!"    #(ver:38) mark
  
   #FOREACH b_fill_curs INTO g_ooag_d[l_ac].ooagstus,g_ooag_d[l_ac].ooag001,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag003,g_ooag_d[l_ac].ooag004,g_ooag_d[l_ac].ooag005,g_ooag_d[l_ac].ooag015,g_ooag_d[l_ac].ooag016,g_ooag_d[l_ac].ooag017,g_ooag_d[l_ac].ooag018,g_ooag1_info_d[l_ac].ooag001,g_ooag1_info_d[l_ac].ooagmodid,g_ooag1_info_d[l_ac].ooagmoddt,g_ooag1_info_d[l_ac].ooagownid,g_ooag1_info_d[l_ac].ooagowndp,g_ooag1_info_d[l_ac].ooagcrtid,g_ooag1_info_d[l_ac].ooagcrtdp,g_ooag1_info_d[l_ac].ooagcrtdt,g_ooag_d[l_ac].ooag001_desc,g_ooag_d[l_ac].ooag003_desc,g_ooag_d[l_ac].ooag004_desc,g_ooag_d[l_ac].ooag005_desc,g_ooag_d[l_ac].ooag015_desc,g_ooag_d[l_ac].ooag017_desc,g_ooag_d[l_ac].ooag018_desc,g_ooag1_info_d[l_ac].ooagmodid_desc,g_ooag1_info_d[l_ac].ooagownid_desc,g_ooag1_info_d[l_ac].ooagowndp_desc,g_ooag1_info_d[l_ac].ooagcrtid_desc,g_ooag1_info_d[l_ac].ooagcrtdp_desc #181211-00007#1
   FOREACH b_fill_curs USING g_enterprise  INTO g_ooag_d[l_ac].ooagstus,g_ooag_d[l_ac].ooag001,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag003,g_ooag_d[l_ac].ooag004, 
       g_ooag_d[l_ac].ooag005,g_ooag_d[l_ac].ooag015,g_ooag_d[l_ac].ooag016,g_ooag_d[l_ac].ooag017,g_ooag_d[l_ac].ooag018,g_ooag1_info_d[l_ac].ooag001,g_ooag1_info_d[l_ac].ooagmodid,g_ooag1_info_d[l_ac].ooagmoddt,g_ooag1_info_d[l_ac].ooagownid,g_ooag1_info_d[l_ac].ooagowndp,g_ooag1_info_d[l_ac].ooagcrtid, 
       g_ooag1_info_d[l_ac].ooagcrtdp,g_ooag1_info_d[l_ac].ooagcrtdt,g_ooag_d[l_ac].ooag001_desc,g_ooag_d[l_ac].ooag003_desc,g_ooag_d[l_ac].ooag004_desc,g_ooag_d[l_ac].ooag005_desc,g_ooag_d[l_ac].ooag015_desc,g_ooag_d[l_ac].ooag017_desc,g_ooag_d[l_ac].ooag018_desc,g_ooag1_info_d[l_ac].ooagmodid_desc, 
       g_ooag1_info_d[l_ac].ooagownid_desc,g_ooag1_info_d[l_ac].ooagowndp_desc,g_ooag1_info_d[l_ac].ooagcrtid_desc,g_ooag1_info_d[l_ac].ooagcrtdp_desc #181211-00007#1
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH b_fill_curs:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
  
      #add-point:b_fill段資料填充 name="b_fill.fill"
      #210508-00022#1 mark---start---
      #SELECT ooag002 INTO l_ooag002 FROM ooag_t WHERE ooag001 = g_ooag_d[l_ac].ooag001 AND ooagent = g_enterprise
      #SELECT oofa015  INTO g_ooag_d[l_ac].oofa015
      #  FROM oofa_t WHERE oofa001 = l_ooag002 AND oofaent = g_enterprise
      #210508-00022#1 mark---end---

       #CALL aooi130_ooag003_ref(g_ooag_d[l_ac].ooag003) RETURNING g_ooag_d[l_ac].ooag003_desc
       #CALL aooi130_ooag004_ref(g_ooag_d[l_ac].ooag004) RETURNING g_ooag_d[l_ac].ooag004_desc
       #CALL aooi130_ooag005_ref(g_ooag_d[l_ac].ooag005) RETURNING g_ooag_d[l_ac].ooag005_desc
       #DISPLAY BY NAME g_ooag_d[l_ac].ooag003_desc,g_ooag_d[l_ac].ooag004_desc,g_ooag_d[l_ac].ooag005_desc
       #CALL aooi130_ooagmodid_ref(g_ooag1_info_d[l_ac].ooagmodid) RETURNING g_ooag1_info_d[l_ac].ooagmodid_desc
       #CALL aooi130_ooagmodid_ref(g_ooag1_info_d[l_ac].ooagownid) RETURNING g_ooag1_info_d[l_ac].ooagownid_desc
       #CALL aooi130_ooagmodid_ref(g_ooag1_info_d[l_ac].ooagcrtid) RETURNING g_ooag1_info_d[l_ac].ooagcrtid_desc 
       #DISPLAY BY NAME g_ooag1_info_d[l_ac].ooagmodid_desc,g_ooag1_info_d[l_ac].ooagownid_desc,g_ooag1_info_d[l_ac].ooagcrtid_desc
       
      #end add-point
      
      CALL aooi130_detail_show()      
 
      IF l_ac > g_max_rec THEN
         #若是因為切換畫面的話，不用再次顯示超過最大顯示筆數的訊息
         IF cl_null(g_action_choice) OR g_action_choice <> "ui_change" THEN   #190108-00038
            IF g_error_show = 1 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
            END IF
         END IF   #190108-00038
         EXIT FOREACH
      END IF
 
      LET l_ac = l_ac + 1
      
   END FOREACH
 
   LET g_error_show = 0
   
 
   
   CALL g_ooag_d.deleteElement(g_ooag_d.getLength())   
   CALL g_ooag1_info_d.deleteElement(g_ooag1_info_d.getLength())
 
   
   #將key欄位填到每個page
   FOR l_ac = 1 TO g_ooag_d.getLength()
      LET g_ooag1_info_d[l_ac].ooag001 = g_ooag_d[l_ac].ooag001 
 
      #add-point:b_fill段key值相關欄位 name="b_fill.keys.fill"
      
      #end add-point
   END FOR
   
   IF g_cnt > g_ooag_d.getLength() THEN
      LET l_ac = g_ooag_d.getLength()
   ELSE
      LET l_ac = g_cnt
   END IF
   LET g_cnt = l_ac
 
   #遮罩相關處理
   FOR l_ac = 1 TO g_ooag_d.getLength()
      LET g_ooag_d_mask_o[l_ac].* =  g_ooag_d[l_ac].*
      CALL aooi130_ooag_t_mask()
      LET g_ooag_d_mask_n[l_ac].* =  g_ooag_d[l_ac].*
   END FOR
   
   LET g_ooag1_info_d_mask_o.* =  g_ooag1_info_d.*
   FOR l_ac = 1 TO g_ooag1_info_d.getLength()
      LET g_ooag1_info_d_mask_o[l_ac].* =  g_ooag1_info_d[l_ac].*
      CALL aooi130_ooag_t_mask()
      LET g_ooag1_info_d_mask_n[l_ac].* =  g_ooag1_info_d[l_ac].*
   END FOR
 
   
   LET l_ac = g_cnt
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   
   #end add-point
   
#  ERROR ""    #(ver:48) mark
 
   LET g_detail_cnt = g_ooag_d.getLength()
   DISPLAY g_detail_idx TO FORMONLY.idx
   DISPLAY g_detail_cnt TO FORMONLY.cnt
   
   CLOSE b_fill_curs
   FREE aooi130_pb
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.detail_show" type="s" >}
#+ 顯示相關資料
PRIVATE FUNCTION aooi130_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   DEFINE l_ooag002     LIKE ooag_t.ooag002
   #end add-point
   
   #add-point:Function前置處理  name="detail_show.before"
   
   #end add-point
   
   
   
   #帶出公用欄位reference值page1
   
    
   #帶出公用欄位reference值page2
   #應用 a12 樣板自動產生(Version:4)
 
 
 
 
   
   #讀入ref值
   #add-point:show段單身reference name="detail_show.reference"
            #CALL aooi130_ooag003_ref(g_ooag_d[l_ac].ooag003) RETURNING g_ooag_d[l_ac].ooag003_desc
            #CALL aooi130_ooag004_ref(g_ooag_d[l_ac].ooag004) RETURNING g_ooag_d[l_ac].ooag004_desc
            #CALL aooi130_ooag005_ref(g_ooag_d[l_ac].ooag005) RETURNING g_ooag_d[l_ac].ooag005_desc
            #DISPLAY BY NAME g_ooag_d[l_ac].ooag003_desc,g_ooag_d[l_ac].ooag004_desc,g_ooag_d[l_ac].ooag005_desc
            
           
   #end add-point
   
   #add-point:show段單身reference name="detail_show.body1_info.reference"
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_ooag1_info_d[l_ac].ooagmodid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_ooag1_info_d[l_ac].ooagmodid_desc = g_rtn_fields[1]
#            DISPLAY BY NAME g_ooag1_info_d[l_ac].ooagmodid_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_ooag1_info_d[l_ac].ooagownid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_ooag1_info_d[l_ac].ooagownid_desc = g_rtn_fields[1]
#            DISPLAY BY NAME g_ooag1_info_d[l_ac].ooagownid_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_ooag1_info_d[l_ac].ooagowndp
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#            LET g_ooag1_info_d[l_ac].ooagowndp_desc = g_rtn_fields[1]
#            DISPLAY BY NAME g_ooag1_info_d[l_ac].ooagowndp_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_ooag1_info_d[l_ac].ooagcrtid
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#            LET g_ooag1_info_d[l_ac].ooagcrtid_desc = g_rtn_fields[1]
#            DISPLAY BY NAME g_ooag1_info_d[l_ac].ooagcrtid_desc
#
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_ooag1_info_d[l_ac].ooagcrtdp
#            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#            LET g_ooag1_info_d[l_ac].ooagcrtdp_desc = g_rtn_fields[1]
#            DISPLAY BY NAME g_ooag1_info_d[l_ac].ooagcrtdp_desc

   #end add-point
 
   #add-point:detail_show段之後 name="detail_show.after"
   #210508-00022#1 mark---start---
   #SELECT ooag002 INTO l_ooag002 FROM ooag_t WHERE ooag001 = g_ooag_d[l_ac].ooag001 AND ooagent = g_enterprise
   #SELECT oofa015 INTO g_ooag_d[l_ac].oofa015 FROM oofa_t WHERE oofa001 = l_ooag002 AND oofaent = g_enterprise    
   #DISPLAY BY NAME g_ooag_d[l_ac].oofa015
   #210508-00022#1 mark---end---
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="aooi130.set_entry_b" type="s" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION aooi130_set_entry_b(p_cmd)                                                  
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point
   DEFINE p_cmd   LIKE type_t.chr1         
   #add-point:set_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point
 
   IF p_cmd = "a" THEN
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry_b段欄位控制 name="set_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_entry_b段control name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry("ooag017,ooag017_desc",TRUE)    #160505-00021#2
   #end add-point                                                                   
                                                                                
END FUNCTION                                                                 
 
{</section>}
 
{<section id="aooi130.set_no_entry_b" type="s" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION aooi130_set_no_entry_b(p_cmd)                                               
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point   
   DEFINE p_cmd   LIKE type_t.chr1           
   #add-point:set_no_entry_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF
   
   #add-point:set_no_entry_b段control name="set_no_entry_b.set_no_entry_b"
   #160505-00021#2---add---s
   IF g_ooag_d[l_ac].ooag016 = 'N' THEN 
      CALL cl_set_comp_entry("ooag017,ooag017_desc",FALSE)
   END IF
   #160505-00021#2---add---e
   #end add-point       
                                                                                
END FUNCTION
 
{</section>}
 
{<section id="aooi130.default_search" type="s" >}
#+ 外部參數搜尋
PRIVATE FUNCTION aooi130_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point
   DEFINE li_idx  LIKE type_t.num10
   DEFINE li_cnt  LIKE type_t.num10
   DEFINE ls_wc   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="default_search.before"
   
   #end add-point  
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " ooag001 = '", g_argv[01], "' AND "
   END IF
   
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   #200330-00044 ---start---
   IF NOT cl_null(g_default_wc) THEN
      LET g_wc2 = g_default_wc
   ELSE
   #200330-00044 --- end ---
      IF NOT cl_null(ls_wc) THEN
         LET ls_wc = ls_wc.subString(1,ls_wc.getLength()-5)
         LET g_wc2 = ls_wc
      ELSE
         LET g_wc2 = " 1=1"
         #預設查詢條件
         LET g_wc2 = cl_qbe_get_default_qryplan()
         IF cl_null(g_wc2) THEN
            LET g_wc2 = " 1=1"
         END IF
      END IF
   END IF   #200330-00044
 
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
   
   #181128-00048 ---start---
   #若有外部串查條件,則以該條件為主
   IF NOT cl_null(g_default_wc) THEN
      LET g_wc2 = g_default_wc
   END IF
   #181128-00048 --- end ---
 
END FUNCTION
 
{</section>}
 
{<section id="aooi130.delete_b" type="s" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION aooi130_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "ooag_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      IF ps_table <> 'ooag_t' THEN
         #add-point:delete_b段刪除前 name="delete_b.b_delete"
         
         #end add-point     
         
         DELETE FROM ooag_t
          WHERE ooagent = g_enterprise AND
            ooag001 = ps_keys_bak[1]
         
         #add-point:delete_b段刪除中 name="delete_b.m_delete"
 
         #end add-point  
            
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = ":",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = FALSE 
            CALL cl_err()
         END IF
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_ooag_d.deleteElement(li_idx) 
      END IF 
      IF ps_page <> "'2'" THEN 
         CALL g_ooag1_info_d.deleteElement(li_idx) 
      END IF 
 
      
      #add-point:delete_b段刪除後 name="delete_b.a_delete"
      #181219-00040#8 2019/04/11 By 12132 add ---s
      IF g_esys0737 = 'Y' THEN
         DELETE FROM nmdc_t 
          WHERE nmdcent = g_enterprise 
            AND nmdc001 = ps_keys_bak[1] 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "delete nmdc_t" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
            #RETURN FALSE        #200221-00009#4 mark 13130
            RETURN               #200221-00009#4 add  13130
            
         END IF
      END IF
      #181219-00040#8 2019/04/11 By 12132 add ---e
      #end add-point
      
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.insert_b" type="s" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION aooi130_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE lp_js       STRING   #190412-00022
   #add-point:insert_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   #判斷是否是同一群組的table
   LET ls_group = "ooag_t,"
   #IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      
      #add-point:insert_b段新增前 name="insert_b.b_insert"
      
      #end add-point    
 
      #190412-00022 ---start---
      #資料所有者與資料所有部門改為呼叫FUNCTION取得
      LET lp_js = util.JSON.stringify(g_ooag_d[l_ac])
      CALL cl_auth_belong_data(lp_js,"ooag_t") RETURNING g_ooag1_info_d[l_ac].ooagownid,g_ooag1_info_d[l_ac].ooagowndp
      #190412-00022 --- end ---
 
      INSERT INTO ooag_t
                  (ooagent,
                   ooag001
                   ,ooagstus,ooag008,ooag009,ooag010,ooag011,ooag012,ooag013,ooag014,ooag003,ooag004,ooag005,ooag015,ooag016,ooag017,ooag018,ooagmodid,ooagmoddt,ooagownid,ooagowndp,ooagcrtid,ooagcrtdp,ooagcrtdt) 
            VALUES(g_enterprise,
                   ps_keys[1]
                   ,g_ooag_d[l_ac].ooagstus,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag003,g_ooag_d[l_ac].ooag004,g_ooag_d[l_ac].ooag005,g_ooag_d[l_ac].ooag015,g_ooag_d[l_ac].ooag016, 
                       g_ooag_d[l_ac].ooag017,g_ooag_d[l_ac].ooag018,g_ooag1_info_d[l_ac].ooagmodid,g_ooag1_info_d[l_ac].ooagmoddt,g_ooag1_info_d[l_ac].ooagownid,g_ooag1_info_d[l_ac].ooagowndp,g_ooag1_info_d[l_ac].ooagcrtid,g_ooag1_info_d[l_ac].ooagcrtdp,g_ooag1_info_d[l_ac].ooagcrtdt)
      #add-point:insert_b段新增中 name="insert_b.m_insert"
 
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "ooag_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      #add-point:insert_b段新增後 name="insert_b.a_insert"
      #181219-00040#8 2019/04/11 By 12132 add ---s
      IF g_esys0737 = 'Y' THEN
         INSERT INTO nmdc_t (nmdcent,nmdc001,nmdc002,nmdc003,nmdc004,
                             nmdc005,nmdc006,nmdcstus)
                     VALUES (g_enterprise,g_ooag_d[l_ac].ooag001,'','','',
                             'CNY','',g_ooag_d[l_ac].ooagstus)
      END IF
      #181219-00040#8 2019/04/11 By 12132 add ---e
      #end add-point    
   #END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.update_b" type="s" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION aooi130_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point
   DEFINE ps_page          STRING
   DEFINE ps_table         STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   #比對新舊值, 判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #若key無變動, 不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
    
   #若key有變動, 則連動其他table的資料   
   #判斷是否是同一群組的table
   LET ls_group = "ooag_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 AND ps_table <> "ooag_t" THEN
      #add-point:update_b段修改前 name="update_b.b_update"
      
      #end add-point     
      UPDATE ooag_t 
         SET (ooag001
              ,ooagstus,ooag008,ooag009,ooag010,ooag011,ooag012,ooag013,ooag014,ooag003,ooag004,ooag005,ooag015,ooag016,ooag017,ooag018,ooagmodid,ooagmoddt,ooagownid,ooagowndp,ooagcrtid,ooagcrtdp,ooagcrtdt) 
              = 
             (ps_keys[1]
              ,g_ooag_d[l_ac].ooagstus,g_ooag_d[l_ac].ooag008,g_ooag_d[l_ac].ooag009,g_ooag_d[l_ac].ooag010,g_ooag_d[l_ac].ooag011,g_ooag_d[l_ac].ooag012,g_ooag_d[l_ac].ooag013,g_ooag_d[l_ac].ooag014,g_ooag_d[l_ac].ooag003,g_ooag_d[l_ac].ooag004,g_ooag_d[l_ac].ooag005,g_ooag_d[l_ac].ooag015,g_ooag_d[l_ac].ooag016, 
                  g_ooag_d[l_ac].ooag017,g_ooag_d[l_ac].ooag018,g_ooag1_info_d[l_ac].ooagmodid,g_ooag1_info_d[l_ac].ooagmoddt,g_ooag1_info_d[l_ac].ooagownid,g_ooag1_info_d[l_ac].ooagowndp,g_ooag1_info_d[l_ac].ooagcrtid,g_ooag1_info_d[l_ac].ooagcrtdp,g_ooag1_info_d[l_ac].ooagcrtdt) 
         WHERE ooagent = g_enterprise AND ooag001 = ps_keys_bak[1]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point 
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
         #  CALL s_transaction_end('N','0')   #(ver:39)
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "ooag_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')   #(ver:39)
            CALL cl_err()
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "ooag_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
         OTHERWISE
            
      END CASE
      #add-point:update_b段修改後 name="update_b.a_update"
      
      #end add-point 
      RETURN
   END IF
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.lock_b" type="s" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION aooi130_lock_b(ps_table)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
   
   #先刷新資料
   #CALL aooi130_b_fill(g_wc2)
   
   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "ooag_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN aooi130_bcl USING g_enterprise,
                                       g_ooag_d[g_detail_idx].ooag001
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "aooi130_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   
   END IF
                                    
 
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="aooi130.unlock_b" type="s" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION aooi130_unlock_b(ps_table)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:unlock_b段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
   
   LET ls_group = ""
   
   #IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE aooi130_bcl
   #END IF
   
 
   
   #add-point:unlock_b段結束前 name="unlock_b.after"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="aooi130.modify_detail_chk" type="s" >}
#+ 單身輸入判定(因應modify_detail)
PRIVATE FUNCTION aooi130_modify_detail_chk(ps_record)
   #add-point:modify_detail_chk段define(客製用) name="modify_detail_chk.define_customerization"
   
   #end add-point
   DEFINE ps_record STRING
   DEFINE ls_return STRING
   #add-point:modify_detail_chk段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify_detail_chk.define"
   
   #end add-point
   
   #add-point:modify_detail_chk段開始前 name="modify_detail_chk.before"
   
   #end add-point
   
   #根據sr名稱確定該page第一個欄位的名稱
   CASE ps_record
      WHEN "s_detail1" 
         LET ls_return = "ooagstus"
      WHEN "s_detail1_info"
         LET ls_return = "ooag001_2"
 
      #add-point:modify_detail_chk段自訂page控制 name="modify_detail_chk.page_control"
      
      #end add-point
   END CASE
    
   #add-point:modify_detail_chk段結束前 name="modify_detail_chk.after"
   
   #end add-point
   
   RETURN ls_return
   
END FUNCTION
 
{</section>}
 
{<section id="aooi130.show_ownid_msg" type="s" >}
#+ 判斷是否顯示只能修改自己權限資料的訊息
#(ver:35) ---add start---
PRIVATE FUNCTION aooi130_show_ownid_msg()
   #add-point:show_ownid_msg段define(客製用) name="show_ownid_msg.define_customerization"
   
   #end add-point
   #add-point:show_ownid_msg段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show_ownid_msg.define"
   
   #end add-point
  
 
   IF g_action_choice = 'modify' OR g_action_choice = 'modify_detail' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = 'lib-00419'
      LET g_errparam.popup  = FALSE
      CALL cl_err()
   END IF
 
END FUNCTION
#(ver:35) --- add end ---
 
{</section>}
 
{<section id="aooi130.idx_chk" type="s" >}
#(ver:42) ---add start---
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION aooi130_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk"
   
   #end add-point
 
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
 
   LET g_curr_diag = ui.DIALOG.getCurrent() #(ver:42)
 
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_ooag_d.getLength() THEN
         LET g_detail_idx = g_ooag_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_ooag_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_ooag_d.getLength() TO FORMONLY.cnt
   END IF
 
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1_info")
      IF g_detail_idx > g_ooag1_info_d.getLength() THEN
         LET g_detail_idx = g_ooag1_info_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_ooag1_info_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_ooag1_info_d.getLength() TO FORMONLY.cnt
   END IF
 
 
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point
 
END FUNCTION
#(ver:42) --- add end ---
 
{</section>}
 
{<section id="aooi130.mask_functions" type="s" >}
&include "erp/aoo/aooi130_mask.4gl"
 
{</section>}
 
{<section id="aooi130.set_pk_array" type="s" >}
   #應用 a51 樣板自動產生(Version:10)
#+ 給予pk_array內容
PRIVATE FUNCTION aooi130_set_pk_array()
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
   #若是單檔多欄型態，則應檢查陣列長度
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   #210120-00006 --- modify end ---
   #181105-00036 --- modify end ---
   
   LET g_pk_array[1].values = g_ooag_d[l_ac].ooag001
   LET g_pk_array[1].column = 'ooag001'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="aooi130.state_change" type="s" >}
   
 
{</section>}
 
{<section id="aooi130.other_dialog" readonly="Y" type="s" >}
 
 
{</section>}
 
{<section id="aooi130.other_function" readonly="Y" type="s" >}
#+
PRIVATE FUNCTION aooi130_ooag004_ref(p_ooag004)
DEFINE p_ooag004      LIKE ooag_t.ooag004
DEFINE r_ooag004_desc LIKE ooefl_t.ooefl003

       INITIALIZE g_ref_fields TO NULL
       LET g_ref_fields[1] = p_ooag004
       CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
       LET r_ooag004_desc = g_rtn_fields[1]
       RETURN r_ooag004_desc  
       
END FUNCTION
# 營運據點欄位控管
PRIVATE FUNCTION aooi130_ooag004(p_ooag004)
DEFINE p_ooag004       LIKE ooag_t.ooag004
 
 IF NOT cl_null(p_ooag004) THEN
    IF NOT ap_chk_isExist(p_ooag004,"SELECT COUNT(1) FROM ooef_t WHERE ooefent = '" ||g_enterprise||"' AND ooef001 = ? ","aoo-00090",0 ) THEN                             
       RETURN FALSE
    END IF
    IF NOT ap_chk_isExist(p_ooag004,"SELECT COUNT(1) FROM ooef_t WHERE ooefent = '" ||g_enterprise||"' AND ooefstus = 'Y' AND ooef001 = ? ","sub-01302","aooi100") THEN  #aoo-00091  #160318-00005#30  By 07900 --mod
       RETURN FALSE
    END IF
    #190702-00029#1 add-S
    IF p_ooag004 = 'ALL' THEN
       RETURN TRUE
    END IF
    #190702-00029#1 add-E
    #161019-00017#1-S
    INITIALIZE g_chkparam.* TO NULL
     
    #設定g_chkparam.*的參數
    LET g_chkparam.arg1 = p_ooag004
     
       
    #呼叫檢查存在並帶值的library
    #IF cl_chk_exist("v_ooef001_13") THEN  #190415-00002#1 mark 
    IF cl_chk_exist("v_ooef001_46") THEN   #190415-00002#1 add
       #檢查成功時後續處理
    ELSE
       #檢查失敗時後續處理
       RETURN FALSE
    END IF    
    #161019-00017#1-E
 END IF   
RETURN TRUE
END FUNCTION
#+
PRIVATE FUNCTION aooi130_ooag005_ref(p_ooag005)
DEFINE p_ooag005      LIKE ooag_t.ooag005
DEFINE r_ooag005_desc LIKE oocql_t.oocql004

       INITIALIZE g_ref_fields TO NULL
       LET g_ref_fields[1] = p_ooag005
       CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='5' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
       LET r_ooag005_desc = g_rtn_fields[1]
       RETURN r_ooag005_desc  
END FUNCTION
#+
PRIVATE FUNCTION aooi130_ooag003_ref(p_ooag003)
DEFINE p_ooag003      LIKE ooag_t.ooag003
DEFINE r_ooag003_desc LIKE ooefl_t.ooefl003

       INITIALIZE g_ref_fields TO NULL
       LET g_ref_fields[1] = p_ooag003
       CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
       LET r_ooag003_desc = g_rtn_fields[1] 
       RETURN r_ooag003_desc   
       
END FUNCTION

PRIVATE FUNCTION aooi130_ooagmodid_ref(p_ooagmodid)
DEFINE p_ooagmodid   LIKE ooag_t.ooagmodid
DEFINE r_ooag011     LIKE ooag_t.ooag011

      LET r_ooag011 = ''
      SELECT ooag011 INTO r_ooag011 FROM ooag_t WHERE ooagent = g_enterprise AND ooag001 = p_ooagmodid
      RETURN r_ooag011
      
END FUNCTION

################################################################################
# Descriptions...: 聯絡對象識別碼批次產生
# Memo...........:
# Usage..........: CALL aooi130_batch()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 14/09/03 By Sarah
# Modify.........:
################################################################################
PRIVATE FUNCTION aooi130_batch()
DEFINE l_sql           STRING
DEFINE l_ooag001       LIKE ooag_t.ooag001
DEFINE l_success       LIKE type_t.num5
DEFINE l_oofa001       LIKE oofa_t.oofa001
DEFINE l_success1      LIKE type_t.num5
   
   LET l_ooag001 = ''
   LET l_success = TRUE
   LET l_oofa001 = ''
   LET l_success1 = TRUE
   
   CALL s_transaction_begin()
   CALL cl_err_collect_init()   #匯總錯誤訊息初始化
   LET l_sql = " SELECT ooag001",
               "   FROM ooag_t",
               "  WHERE ooagent = '",g_enterprise,"'",
               "    AND ooag002 IS NULL"
   PREPARE aooi130_sel_ooag001_pr FROM l_sql
   DECLARE aooi130_sel_ooag001_cs CURSOR FOR aooi130_sel_ooag001_pr
   FOREACH aooi130_sel_ooag001_cs INTO l_ooag001
      CALL s_aooi350_ins_oofa('2',l_ooag001,'') RETURNING l_success,l_oofa001
      IF l_success THEN
         UPDATE ooag_t set ooag002 = l_oofa001
          WHERE ooagent = g_enterprise AND ooag001 = l_ooag001
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ooag001
               LET g_errparam.code   = "std-00009" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               
               CALL s_transaction_end('N','0')
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ooag001
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               
               CALL s_transaction_end('N','0')
         END CASE
      ELSE
         LET l_success1 = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00032'   #資料更新失敗
         LET g_errparam.extend = l_ooag001
         LET g_errparam.popup = TRUE
         CALL cl_err()
         
         CALL s_transaction_end('N','0')
      END IF
   END FOREACH
   CALL cl_err_collect_show()   #顯示匯總錯誤訊息
   
   IF l_success1 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00033'   #資料更新成功
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err() 
      
      CALL s_transaction_end('Y','0')      
   END IF
END FUNCTION

################################################################################
# Descriptions...: 更新員工兼職檔(ooah_t)
# Memo...........: 
# Usage..........: CALL aooi130_upd_ooah(p_ooag001,p_type,p_ooag001_o)
#                  RETURNING r_success
# Input parameter: p_ooag001   員工編號
# Input parameter: p_type      I:新增、U:修改
# Input parameter: p_ooag001_o 修改前員工編號
# Return code....: r_success   成功否(TRUE/FALSE)，此更新不影響transaction結果，故只回傳TRUE
# Date & Author..: #190312-00030#4 add 2019/03/19 By 01366
# Modify.........:
################################################################################
PRIVATE FUNCTION aooi130_upd_ooah(p_ooag001,p_type,p_ooag001_o)
DEFINE p_ooag001    LIKE ooag_t.ooag001 #員工編號
DEFINE p_type       LIKE type_t.chr1    #I:新增、U:修改
DEFINE p_ooag001_o  LIKE ooag_t.ooag001 #修改前員工編號
DEFINE r_success    LIKE type_t.num5    #成功否(TRUE/FALSE)
DEFINE l_ooah RECORD
       ooahstus     LIKE ooah_t.ooahstus, #狀態碼
       ooahent      LIKE ooah_t.ooahent,  #企業編號     
       ooah001      LIKE ooah_t.ooah001,  #員工編號
       ooah002      LIKE ooah_t.ooah002,  #部門編號
       ooah003      LIKE ooah_t.ooah003,  #職稱代碼
       ooah004      LIKE ooah_t.ooah004,  #職務核決層級
       ooah005      LIKE ooah_t.ooah005,  #部門主管員工編號
       ooah006      LIKE ooah_t.ooah006,  #直屬主管員工編號
       ooah007      LIKE ooah_t.ooah007,  #所屬據點
       ooah008      LIKE ooah_t.ooah008,  #是否為主要部門
       ooah009      LIKE ooah_t.ooah009,  #是否為HR轉入
       ooahownid    LIKE ooah_t.ooahownid,
       ooahowndp    LIKE ooah_t.ooahowndp,
       ooahcrtid    LIKE ooah_t.ooahcrtid,
       ooahcrtdp    LIKE ooah_t.ooahcrtdp, 
       ooahcrtdt    LIKE ooah_t.ooahcrtdt,
       ooahmodid    LIKE ooah_t.ooahmodid,
       ooahmoddt    LIKE ooah_t.ooahmoddt
END RECORD
DEFINE l_cnt        LIKE type_t.num10
DEFINE l_ooag001    LIKE ooag_t.ooag001 #員工編號

   #與HR整合或BPM整合才更新員工兼職檔
   IF cl_get_para(g_enterprise,g_site,'S-SYS-0004') = 'N' AND cl_aws_prod_para(g_enterprise,"bpm-0001") = 'N' THEN
      RETURN TRUE
   END IF   

   LET r_success = TRUE
   
   #修改狀態，且新舊值不同，表示有修改員工編號或部門，故先將ooah_t也同步更新
   IF p_type = 'U' THEN
      UPDATE ooah_t
         SET ooah001 = p_ooag001
       WHERE ooahent = g_enterprise 
         AND ooah001 = p_ooag001_o
         AND ooah008 = 'Y'
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "update ooah_t" 
         LET g_errparam.code   = 'aoo-00460' 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = TRUE #不影響transaction，故回傳TRUE
      END IF
   END IF
   
   SELECT ooagstus,ooagent,ooag001,ooag003,ooag005,
          ooag015,'',ooag018,ooag004
     INTO l_ooah.ooahstus,l_ooah.ooahent,l_ooah.ooah001,l_ooah.ooah002,l_ooah.ooah003,
          l_ooah.ooah004,l_ooah.ooah005,l_ooah.ooah006,l_ooah.ooah007
     FROM ooag_t 
    WHERE ooagent = g_enterprise 
      AND ooag001 = p_ooag001
    
    LET l_ooah.ooah008 = 'Y' #是否為主要部門(固定值=Y)
    LET l_ooah.ooah009 = 'N' #是否為HR轉入(固定值=N)

   #200706-00036#1 add-s
   #是否存在與主部門相同的兼職資料
   SELECT COUNT(1) INTO l_cnt
     FROM ooah_t 
    WHERE ooahent = g_enterprise 
      AND ooah001 = p_ooag001
      AND ooah002 = l_ooah.ooah002
      AND ooah008 = 'N'
   IF l_cnt > 0 THEN 
     DELETE FROM ooah_t 
      WHERE ooahent = g_enterprise 
        AND ooah001 = p_ooag001
        AND ooah002 = l_ooah.ooah002
   END IF
   #200706-00036#1 add-e
   
   SELECT COUNT(1) INTO l_cnt
     FROM ooah_t 
    WHERE ooahent = g_enterprise 
      AND ooah001 = l_ooah.ooah001
      AND ooah008 = 'Y'

   IF l_cnt = 0 THEN 
      #新增給值  
      LET l_ooah.ooahownid = g_user
      LET l_ooah.ooahowndp = g_dept
      LET l_ooah.ooahcrtid = g_user
      LET l_ooah.ooahcrtdp = g_dept 
      LET l_ooah.ooahcrtdt = cl_get_current()
      LET l_ooah.ooahmodid = g_user
      LET l_ooah.ooahmoddt = cl_get_current()
   
      INSERT INTO ooah_t(ooahstus,ooahent,ooah001,ooah002,ooah003,
                         ooah004,ooah005,ooah006,ooah007,ooah008,
                         ooah009,ooahownid,ooahowndp,ooahcrtid,ooahcrtdp,
                         ooahcrtdt,ooahmodid,ooahmoddt)
                  VALUES(l_ooah.ooahstus,l_ooah.ooahent,l_ooah.ooah001,l_ooah.ooah002,l_ooah.ooah003,
                         l_ooah.ooah004,l_ooah.ooah005,l_ooah.ooah006,l_ooah.ooah007,l_ooah.ooah008, 
                         l_ooah.ooah009,l_ooah.ooahownid,l_ooah.ooahowndp,l_ooah.ooahcrtid,l_ooah.ooahcrtdp,
                         l_ooah.ooahcrtdt,l_ooah.ooahmodid,l_ooah.ooahmoddt)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "insert ooah_t" 
         LET g_errparam.code   = 'aoo-00460' 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = TRUE #不影響transaction，故回傳TRUE
      END IF
   ELSE
      #修改給值
      LET l_ooah.ooahmodid = g_user
      LET l_ooah.ooahmoddt = cl_get_current()
      
      UPDATE ooah_t SET ooahstus  = l_ooah.ooahstus,
                        ooah002   = l_ooah.ooah002,
                        ooah003   = l_ooah.ooah003,
                        ooah004   = l_ooah.ooah004,
                        ooah005   = l_ooah.ooah005,
                        ooah006   = l_ooah.ooah006,
                        ooah007   = l_ooah.ooah007,
                        ooah008   = l_ooah.ooah008,
                        ooah009   = l_ooah.ooah009,
                        ooahmodid = l_ooah.ooahmodid,
                        ooahmoddt = l_ooah.ooahmoddt
       WHERE ooahent = l_ooah.ooahent
         AND ooah001 = l_ooah.ooah001
         AND ooah008 = 'Y'

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "update ooah_t" 
         LET g_errparam.code   = 'aoo-00460' 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success = TRUE #不影響transaction，故回傳TRUE
      END IF
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 刪除員工兼職檔(ooah_t)
# Memo...........:
# Usage..........: CALL aooi130_del_ooah(p_ooag001)
#                  RETURNING r_success
# Input parameter: p_ooag001   員工編號
# Return code....: r_success   成功否(TRUE/FALSE)，此更新不影響transaction結果，故只回傳TRUE
# Date & Author..: #190312-00030#4 add 2019/03/19 By 01366
# Modify.........:
################################################################################
PRIVATE FUNCTION aooi130_del_ooah(p_ooag001)
DEFINE p_ooag001    LIKE ooag_t.ooag001 #員工編號
DEFINE p_type       LIKE type_t.chr1    #I:新增、U:修改
DEFINE p_ooag001_o  LIKE ooag_t.ooag001 #修改前員工編號
DEFINE r_success    LIKE type_t.num5    #成功否(TRUE/FALSE)

   #與HR整合或BPM整合才更新員工兼職檔
   IF cl_get_para(g_enterprise,g_site,'S-SYS-0004') = 'N' AND cl_aws_prod_para(g_enterprise,"bpm-0001") = 'N' THEN
      RETURN TRUE
   END IF   

   LET r_success = TRUE
   
   DELETE FROM ooah_t
    WHERE ooahent = g_enterprise 
      AND ooah001 = p_ooag001

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "delete ooah_t" 
      LET g_errparam.code   = 'aoo-00460' 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = TRUE #不影響transaction，故回傳TRUE
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 同步主要部門至員工兼職檔
# Memo...........:
# Usage..........: CALL aooi130_gen_ooah008()
#                  RETURNING 無
# Input parameter: 無
# Return code....: 無
# Date & Author..: #190312-00030#4 add 2019/03/29 By 01366
# Modify.........:
################################################################################
PRIVATE FUNCTION aooi130_gen_ooah008()
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_ooah RECORD
       ooahownid    LIKE ooah_t.ooahownid,
       ooahowndp    LIKE ooah_t.ooahowndp,
       ooahcrtid    LIKE ooah_t.ooahcrtid,
       ooahcrtdp    LIKE ooah_t.ooahcrtdp, 
       ooahcrtdt    LIKE ooah_t.ooahcrtdt,
       ooahmodid    LIKE ooah_t.ooahmodid,
       ooahmoddt    LIKE ooah_t.ooahmoddt
   END RECORD
      
   LET l_success = TRUE
   CALL s_transaction_begin()
   CALL cl_err_collect_init()   #匯總錯誤訊息初始化
   
   DELETE FROM ooah_t 
    WHERE ooahent  = g_enterprise
      AND ooah008  = 'Y' 
      AND ooah009  = 'N'
      AND EXISTS (SELECT ooag001 FROM ooag_t WHERE ooagent=ooahent AND ooag001=ooah001)
   IF SQLCA.sqlcode THEN
      LET l_success = FALSE
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "del ooah_t"
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      CALL s_transaction_end('N','0')
   END IF
   
   IF l_success THEN
      LET l_ooah.ooahownid = g_user
      LET l_ooah.ooahowndp = g_dept
      LET l_ooah.ooahcrtid = g_user
      LET l_ooah.ooahcrtdp = g_dept 
      LET l_ooah.ooahcrtdt = cl_get_current()
      LET l_ooah.ooahmodid = g_user
      LET l_ooah.ooahmoddt = cl_get_current()
      
      INSERT INTO ooah_t(ooahstus,ooahent,ooah001,ooah002,ooah003,
                         ooah004,ooah005,ooah006,ooah007,ooah008,
                         ooah009,ooahownid,ooahowndp,ooahcrtid,ooahcrtdp,
                         ooahcrtdt,ooahmodid,ooahmoddt)
      SELECT ooagstus,ooagent,ooag001,ooag003,ooag005,
          ooag015,'',ooag018,ooag004,'Y',
          'N' ,l_ooah.ooahownid,l_ooah.ooahowndp,l_ooah.ooahcrtid,l_ooah.ooahcrtdp,
          l_ooah.ooahcrtdt,l_ooah.ooahmodid,l_ooah.ooahmoddt
        FROM ooag_t
#       WHERE NOT EXISTS (SELECT ooah001 FROM dsdemo.ooah_t WHERE ooahent=ooagent AND ooah001=ooag001 AND ooah008  = 'Y' )    #200520-00033#1 mark
       WHERE NOT EXISTS (SELECT ooah001 FROM ooah_t WHERE ooahent=ooagent AND ooah001=ooag001 AND ooah008  = 'Y' )            #200520-00033#1 add
         AND ooagent  = g_enterprise
         AND ooag003 IS NOT NULL
      IF SQLCA.sqlcode THEN
         LET l_success = FALSE
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "ins ooah_t"
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         CALL s_transaction_end('N','0')
      END IF 
   END IF

   CALL cl_err_collect_show()   #顯示匯總錯誤訊息
   
   IF l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00033'   #資料更新成功
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err() 
      CALL s_transaction_end('Y','0')      
   END IF
END FUNCTION

################################################################################
# Descriptions...: 更新員工資料檔(ooag_t)
# Memo...........: 
# Usage..........: CALL aooi130_upd_ooag(p_ooag001)
#                  RETURNING r_success
# Input parameter: p_ooag001   員工編號
# Return code....: r_success   成功否(TRUE/FALSE)
# Date & Author..: #190312-00030#4 add 2019/04/02 By 01366
# Modify.........:
################################################################################
PRIVATE FUNCTION aooi130_upd_ooag(p_ooag001)
   DEFINE p_ooag001    LIKE ooag_t.ooag001     #員工編號
   DEFINE r_success    LIKE type_t.num5        #成功否(TRUE/FALSE)
   DEFINE l_cnt        LIKE type_t.num10
   DEFINE l_ooag004    LIKE ooag_t.ooag004
   DEFINE l_ooah007    LIKE ooah_t.ooah007
   
   #與HR整合或BPM整合才更新
   IF cl_get_para(g_enterprise,g_site,'S-SYS-0004') = 'N' AND cl_aws_prod_para(g_enterprise,"bpm-0001") = 'N' THEN
      RETURN TRUE
   END IF 

   LET r_success = TRUE
   
   LET l_cnt = 0
   SELECT count(1) INTO l_cnt
     FROM ooah_t
    WHERE ooahent  = g_enterprise
      AND ooah001  = p_ooag001
      AND ooah008  = 'N'
      AND ooahstus = 'Y'
   IF l_cnt > 0 THEN
      #200706-00017#1 add-s
      LET l_cnt = 0
      SELECT COUNT(1) INTO l_cnt 
         FROM ooah_t
        WHERE ooahent  = g_enterprise
          AND ooah008  = 'N'
          AND ooahstus = 'Y'
          AND ooah001  = p_ooag001
          AND ooah007  != (SELECT ooag004
                             FROM ooag_t
                            WHERE ooagent  = g_enterprise
                              AND ooag001  = p_ooag001
                              AND ooagstus = 'Y')
      IF l_cnt > 0 THEN                       
      #200706-00017#1 add-e
         LET l_ooag004 = 'ALL'
      END IF #200706-00017#1 add
   ELSE
      SELECT ooah007 INTO l_ooah007
        FROM ooah_t
       WHERE ooahent  = g_enterprise
         AND ooah001  = p_ooag001
         AND ooah008  = 'Y'
         
      LET l_ooag004 = l_ooah007
   END IF
   IF NOT cl_null(l_ooag004) THEN
      UPDATE ooag_t SET ooag004 = l_ooag004
       WHERE ooagent = g_enterprise
         AND ooag001 = p_ooag001
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "update ooag004:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF   
   RETURN r_success
END FUNCTION

 
{</section>}
 
