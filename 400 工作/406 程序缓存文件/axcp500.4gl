#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axcp500.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0024(2017-03-27 10:22:07), PR版次:0024(2020-08-11 11:38:21)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000446
#+ Filename...: axcp500
#+ Description: 成本計算作業
#+ Creator....: 00378(2014-05-20 17:53:50)
#+ Modifier...: 02295 -SD/PR- 13580
 
{</section>}
 
{<section id="axcp500.global" type="s" >}
#應用 p01 樣板自動產生(Version:23)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#160701-00012#3  2016/07/04 By xianghui 检查axct7*(axct703，axct707除外)同期是否有产生账务资料，有产生则不可再计算成本
#160929-00024#1  2016/10/10 By 02295    在运算前，应检查计算的年度+期别在成本关账日期之后（S-FIN-6012）
#161117-00031#1  2016/11/18 By 02295    将判断条件小于等于改成等于
#161118-00043#1  2016/11/23 By shiun    修改背景執行(將原先寫至前景執行程式段移至外層，並更改傳入參數)
#161129-00063#1  2016/12/14 By 02040    檢查xcea_t的處理，改為呼叫s_axcp500_chk_cal作檢查
#170223-00010#1  2017/02/23 By 00768    增加实时成本的计算逻辑
#170217-00025#8  2017/03/10 By zhujing  整批调整未产生数据时，提示消息修正。
#170301-00026#1  2017/03/14 By lixiang  關帳日期為 2017/01/31時，代表不能重算 2017年期別1的成本
#170327-00062#1  2017/03/30 By 01531   【成本计算类型】栏位应限制只能选择【账套】对应axci101设置的类型
#170426-00039#1  2017/05/07 By 08734   【成本计算类型】栏位输入的时候也应限制只能选择【账套】对应axci101设置的类型
#170619-00013#1  2017/06/30 By lixiang  axcp500跑完，用帳套+成本計算方式回寫,axci101"最近計算成本年度"及"最近計算成本期別"欄位
#171208-00050#1  2017/12/12 By 00531    修改帳套時需要重抓agli010上的預設成本類型來default
#180111-00028#1  2018/01/17 BY 09042    报错仅需提示一次
#170617-00245#1  2018/01/30 By 09042    规格画面上stagenow栏位的sizePolicy调整为dynamic
#180202-00048#6  2018/02/21 By 00566    背景執行異常結束時，要call cl_exitprogram('1')
#181126-00034#1  2018/12/20 By 11384    [账套编号]、[成本计算类型]、[计算年度]、[计算期别]栏位程序打开时给预设值 
#190514-00053#1  2019/05/14 By 05423    修正成本关账日期与年度期别的检核
#200602-00028#1  2020/07/23 By 00902    账套开窗参考axcp200   DEFINE g_wc_comp          STRING     #200602-00028#1 add
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:20) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:20) --- end ---
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_schedule
#add-point:增加匯入項目 name="global.import"
 
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_schedule.inc"
GLOBALS
   DEFINE gwin_curr2  ui.Window
   DEFINE gfrm_curr2  ui.Form
   DEFINE gi_hiden_asign       LIKE type_t.num5
   DEFINE gi_hiden_exec        LIKE type_t.num5
   DEFINE gi_hiden_spec        LIKE type_t.num5
   DEFINE gi_hiden_exec_end    LIKE type_t.num5
   DEFINE g_chk_jobid          LIKE type_t.num5
END GLOBALS
 
PRIVATE TYPE type_parameter RECORD
   #add-point:自定背景執行須傳遞的參數(Module Variable) name="global.parameter"
        glaald       LIKE type_t.chr5, 
        xcat001      LIKE type_t.chr10, 
        xcat001_desc LIKE type_t.chr80, 
        field_flag   LIKE type_t.chr1, 
        yy           LIKE type_t.chr80, 
        pp           LIKE type_t.chr80,         
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       imaa001 LIKE type_t.chr500, 
   imaa009 LIKE type_t.chr10, 
   imaa003 LIKE type_t.chr10, 
   glaald LIKE type_t.chr5, 
   xcat001 LIKE type_t.chr10, 
   xcat001_desc LIKE xcatl_t.xcatl003, 
   field_flag LIKE type_t.chr1, 
   yy LIKE type_t.num5, 
   pp LIKE type_t.num5, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
DEFINE g_condition_display LIKE type_t.chr1   #180813-00044
 
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_glaa003        LIKE glaa_t.glaa003
DEFINE g_ref_fields     DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields     DYNAMIC ARRAY OF VARCHAR(500) 
DEFINE g_stagecomplete LIKE type_t.num5   #151214-00005#1 add
DEFINE g_stime     DATETIME YEAR TO SECOND   #wujie 160321
DEFINE g_etime     DATETIME YEAR TO SECOND   #wujie 160321
DEFINE g_success   LIKE type_t.num5  ##180202-00048#6
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axcp500.main" type="s" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   
   #end add-point 
  
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("axc","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL axcp500_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_axcp500 WITH FORM cl_ap_formpath("axc",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL axcp500_init()
 
      #進入選單 Menu (="N")
      CALL axcp500_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_axcp500
   END IF
 
   #add-point:作業離開前 name="main.exit"
   ## --> 180202-00048#6
   IF g_success = FALSE THEN
      CALL cl_ap_exitprogram("1")
   END IF
   ## <-- 180202-00048#6
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="axcp500.init" type="s" >}
#+ 初始化作業
PRIVATE FUNCTION axcp500_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   #181126-00034#1 add_S By 11384   
   DEFINE l_date             LIKE type_t.dat
   DEFINE l_master_t         type_master  
   #181126-00034#1 add_E By 11384   
   DEFINE l_success          LIKE type_t.num5 #PGS(D)-10500-add   
   #end add-point
 
   LET g_error_show = 1
   LET gwin_curr2 = ui.Window.getCurrent()
   LET gfrm_curr2 = gwin_curr2.getForm()
   CALL cl_schedule_import_4fd()
   CALL cl_set_combo_scc("gzpa003","75")
   IF cl_get_para(g_enterprise,"","E-SYS-0005") = "N" THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF
   LET g_condition_display = "N"   #180813-00044
 
   #190121-00002#1 - S -
   #帶起程式來源為azzi950時僅呈現條件查詢頁
   IF NOT cl_null(g_parentprog) AND g_parentprog = "azzi950"  THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF      
   #190121-00002#1 - E -
 
   #add-point:畫面資料初始化 name="init.init"
   #181126-00034#1 add_S By 11384
   LET l_date = cl_get_today()
   CALL s_axcp500_get_input_default(g_site,l_date,'','')
      RETURNING g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
   DISPLAY BY NAME g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
   LET l_master_t.* = g_master.*
   #181126-00034#1 add_E By 11384
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="axcp500.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION axcp500_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   DEFINE lp_str   STRING   #201109-00009
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_success          LIKE type_t.num5
   DEFINE l_errno            LIKE gzze_t.gzze001
   DEFINE l_date             LIKE type_t.dat
   DEFINE l_master_t         type_master
   DEFINE l_cnt1             LIKE type_t.num5    #170426-00039#1 add 
   DEFINE l_comp             LIKE ooef_t.ooef017    #法人  #181126-00034#1 add by 11384	
   DEFINE g_wc_comp          STRING     #200602-00028#1 add
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   LET l_date = cl_get_today()
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               #181126-00034#1 mark_S By 11384
#               CALL s_axcp500_get_input_default(g_site,l_date,'','')
#                    RETURNING g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
#               DISPLAY BY NAME g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
#               LET l_master_t.* = g_master.*    
               #181126-00034#1 mark_E By 11384               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaald
            #add-point:BEFORE FIELD glaald name="input.b.glaald"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD glaald
            
            #add-point:AFTER FIELD glaald name="input.a.glaald"
            IF NOT cl_null(g_master.glaald) AND 
              (cl_null(l_master_t.glaald) OR l_master_t.glaald <> g_master.glaald) THEN
               CALL s_fin_ld_chk(g_master.glaald,g_user,'N') 
                    RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = l_errno
                  LET g_errparam.extend = g_master.glaald
                  #160321-00016#41 s983961--add(s)
                  LET g_errparam.replace[1] ='agli010'
                  LET g_errparam.replace[2] = cl_get_progname('agli010',g_lang,"2")
                  LET g_errparam.exeprog ='agli010'
                  #160321-00016#41 s983961--add(e)
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
               #171208-00050#1------add s
               SELECT glaa003 INTO g_glaa003 FROM glaa_t
                WHERE glaaent = g_enterprise
                  AND glaald  = g_master.glaald
                  
               #181126-00034#1 add_S by 11384
               SELECT  glaacomp INTO g_site FROM glaa_t
                WHERE glaaent = g_enterprise
                   AND glaald = g_master.glaald
                  AND glaa014 = 'Y'   
               #181126-00034#1 add_E by 11384    
               CALL s_axcp500_get_input_default(g_site,l_date,g_master.glaald,'')
                    RETURNING g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
               DISPLAY BY NAME g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
               LET l_master_t.xcat001 = g_master.xcat001               
              #171208-00050#1------add e  
              
               #170426-00039#1 add(S)
          
               IF NOT cl_null(g_master.xcat001) THEN
                   INITIALIZE g_chkparam.* TO NULL
                   LET g_errshow = TRUE
                   LET g_chkparam.arg1 = g_master.glaald
                   LET g_chkparam.arg2 = g_master.xcat001
                   IF NOT cl_chk_exist("v_xcaz001") THEN
                   
                      NEXT FIELD CURRENT                     
                   END IF
               END IF
    
           #170426-00039#1 add(E)
              #171208-00050#1------mark s
              #SELECT glaa003 INTO g_glaa003 FROM glaa_t
              # WHERE glaaent = g_enterprise
              #   AND glaald  = g_master.glaald
              #    
              #CALL s_axcp500_get_input_default(g_site,l_date,g_master.glaald,'')
              #     RETURNING g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
              #DISPLAY BY NAME g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp   
              #171208-00050#1------mark e               
            END IF
            LET l_master_t.glaald = g_master.glaald
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaald
            #add-point:ON CHANGE glaald name="input.g.glaald"
 
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xcat001
            
            #add-point:AFTER FIELD xcat001 name="input.a.xcat001"
           
           IF NOT cl_null(g_master.xcat001) AND 
              (cl_null(l_master_t.xcat001) OR l_master_t.xcat001 <> g_master.xcat001) THEN
               CALL s_axcp500_chk_xcat001(g_master.glaald,g_master.xcat001)
                    RETURNING l_success,g_master.field_flag
               IF NOT l_success THEN
                  NEXT FIELD CURRENT
               END IF
               #170426-00039#1 add(S)
               IF NOT cl_null(g_master.glaald) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE
                  LET g_chkparam.arg1 = g_master.glaald
                  LET g_chkparam.arg2 = g_master.xcat001
                  IF NOT cl_chk_exist("v_xcaz001") THEN
                  
                     NEXT FIELD CURRENT                     
                  END IF
               END IF
               #170426-00039#1 add(E)               
               CALL s_axcp500_get_input_default(g_site,l_date,g_master.glaald,g_master.xcat001)
                    RETURNING g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp 
               DISPLAY BY NAME g_master.glaald,g_master.xcat001,g_master.field_flag,g_master.yy,g_master.pp                               
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_master.xcat001
               CALL ap_ref_array2(g_ref_fields,"SELECT xcatl003 FROM xcatl_t WHERE xcatlent='"||g_enterprise||"' AND xcatl001=? AND xcatl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_master.xcat001_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_master.xcat001_desc  
               DISPLAY BY NAME g_master.field_flag
            END IF
            LET l_master_t.xcat001 = g_master.xcat001

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xcat001
            #add-point:BEFORE FIELD xcat001 name="input.b.xcat001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xcat001
            #add-point:ON CHANGE xcat001 name="input.g.xcat001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD field_flag
            #add-point:BEFORE FIELD field_flag name="input.b.field_flag"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD field_flag
            
            #add-point:AFTER FIELD field_flag name="input.a.field_flag"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE field_flag
            #add-point:ON CHANGE field_flag name="input.g.field_flag"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD yy
            #add-point:BEFORE FIELD yy name="input.b.yy"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD yy
            
            #add-point:AFTER FIELD yy name="input.a.yy"
            IF g_master.yy < 0 THEN
               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE yy
            #add-point:ON CHANGE yy name="input.g.yy"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pp
            #add-point:BEFORE FIELD pp name="input.b.pp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD pp
            
            #add-point:AFTER FIELD pp name="input.a.pp"
            IF g_master.pp < 0 THEN
               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pp
            #add-point:ON CHANGE pp name="input.g.pp"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.glaald
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaald
            #add-point:ON ACTION controlp INFIELD glaald name="input.c.glaald"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_master.glaald            
            #給予arg
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept
            #200602-00028#1-add-s
            IF cl_null(g_wc_comp) THEN
               CALL s_axrt300_get_site(g_user,'','3') RETURNING g_wc_comp
               LET g_wc_comp = cl_replace_str(g_wc_comp,"ooef017","glaacomp")
            END IF
            IF NOT cl_null(g_wc_comp) THEN
               LET g_qryparam.where = g_wc_comp
            END IF 
            #200602-00028#1-add-e
            CALL q_authorised_ld()     
            LET g_master.glaald = g_qryparam.return1    
            DISPLAY g_master.glaald TO glaald 
            #181126-00034#1 add_S by 11384
            SELECT  glaacomp INTO l_comp FROM glaa_t
               WHERE glaaent  = g_enterprise
                 AND glaald = g_master.glaald
                 AND glaa014  = 'Y'   
            CALL cl_get_para(g_enterprise,l_comp,'S-FIN-6010') RETURNING g_master.yy
            CALL cl_get_para(g_enterprise,l_comp,'S-FIN-6011') RETURNING g_master.pp            
            DISPLAY BY NAME g_master.yy,g_master.pp
            #181126-00034#1 add_E by 11384            
            NEXT FIELD glaald             
            #END add-point
 
 
         #Ctrlp:input.c.xcat001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xcat001
            #add-point:ON ACTION controlp INFIELD xcat001 name="input.c.xcat001"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_master.xcat001            
            #LET g_qryparam.where = " xcat003 = '1'"    #期末   #170223-00010#1  mark 170223
            #170327-00062#1 add s---
            IF NOT cl_null(g_master.glaald) THEN 
               LET g_qryparam.where = " xcazld = '",g_master.glaald,"'"
               CALL q_xcaz001_1()
            ELSE
            #170327-00062#1 add e---
               CALL q_xcat001()  
            END IF #170327-00062#1               
            LET g_master.xcat001 = g_qryparam.return1    
            DISPLAY g_master.xcat001 TO xcat001   
            NEXT FIELD xcat001   
            #END add-point
 
 
         #Ctrlp:input.c.field_flag
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD field_flag
            #add-point:ON ACTION controlp INFIELD field_flag name="input.c.field_flag"
            
            #END add-point
 
 
         #Ctrlp:input.c.yy
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD yy
            #add-point:ON ACTION controlp INFIELD yy name="input.c.yy"
            IF g_master.yy < 0 THEN
               NEXT FIELD yy
            END IF
            #END add-point
 
 
         #Ctrlp:input.c.pp
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD pp
            #add-point:ON ACTION controlp INFIELD pp name="input.c.pp"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
            IF cl_null(g_master.glaald) THEN
               NEXT FIELD glaald
            ELSE
               CALL s_fin_ld_chk(g_master.glaald,g_user,'N') 
                    RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = l_errno
                  LET g_errparam.extend = g_master.glaald
                  #160321-00016#41 s983961--add(s)
                  LET g_errparam.replace[1] ='agli010'
                  LET g_errparam.replace[2] = cl_get_progname('agli010',g_lang,"2")
                  LET g_errparam.exeprog ='agli010'
                  #160321-00016#41 s983961--add(e)
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
               SELECT glaa003 INTO g_glaa003 FROM glaa_t
                WHERE glaaent = g_enterprise
                  AND glaald  = g_master.glaald
            END IF
            
            IF cl_null(g_master.xcat001) THEN
               NEXT FIELD xcat001
            ELSE
               CALL s_axcp500_chk_xcat001(g_master.glaald,g_master.xcat001)
                    RETURNING l_success,g_master.field_flag
               IF NOT l_success THEN
                  NEXT FIELD xcat001
               END IF
            END IF  

            IF cl_null(g_master.yy) THEN
               NEXT FIELD yy
            END IF
            
            IF cl_null(g_master.pp) THEN
               NEXT FIELD pp
            END IF
            
            IF NOT cl_null(g_master.yy) AND NOT cl_null(g_master.pp) THEN
               IF NOT s_fin_date_chk_period(g_glaa003,g_master.yy,g_master.pp) THEN
                  LET g_master.pp = ''
                  DISPLAY BY NAME g_master.pp
                  NEXT FIELD yy
               END IF
            END IF
            
            CALL s_axcp500_chk_cal(g_master.glaald,g_master.xcat001,g_master.yy,g_master.pp)
                 RETURNING l_success
            IF NOT l_success THEN
               #CONTINUE DIALOG    #180111-00028#1  mark
               NEXT FIELD glaald   #180111-00028#1  add
            END IF
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON imaa001,imaa009,imaa003
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.imaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaa001
            #add-point:ON ACTION controlp INFIELD imaa001 name="construct.c.imaa001"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                     
            DISPLAY g_qryparam.return1 TO imaa001  
            NEXT FIELD imaa001                     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaa001
            #add-point:BEFORE FIELD imaa001 name="construct.b.imaa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD imaa001
            
            #add-point:AFTER FIELD imaa001 name="construct.a.imaa001"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.imaa009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaa009
            #add-point:ON ACTION controlp INFIELD imaa009 name="construct.c.imaa009"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001() 
#           CALL q_imaa009()
            DISPLAY g_qryparam.return1 TO imaa009 
            NEXT FIELD imaa009                     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaa009
            #add-point:BEFORE FIELD imaa009 name="construct.b.imaa009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD imaa009
            
            #add-point:AFTER FIELD imaa009 name="construct.a.imaa009"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.imaa003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaa003
            #add-point:ON ACTION controlp INFIELD imaa003 name="construct.c.imaa003"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imck001() 
            DISPLAY g_qryparam.return1 TO imaa003 
            NEXT FIELD imaa003                     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaa003
            #add-point:BEFORE FIELD imaa003 name="construct.b.imaa003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD imaa003
            
            #add-point:AFTER FIELD imaa003 name="construct.a.imaa003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
 
            
            #add-point:其他管控 name="cs.other"
            
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL axcp500_get_buffer(l_dialog)
            #180813-00044 ---start---
            #顯示上次使用者下的條件
            IF g_condition_display = "Y" THEN
               CALL cl_qbe_display_condition('100001', g_user)
            END IF
            #180813-00044 --- end ---
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            
            #end add-point
 
         ON ACTION batch_execute
            LET g_action_choice = "batch_execute"
            #180813-00044 ---start---
            #將此次查詢的條件儲存起來
            LET g_condition_display = "Y"
            CALL cl_qbe_auto_save()
            #180813-00044 --- end ---
            ACCEPT DIALOG
 
         #add-point:ui_dialog段before_qbeclear name="ui_dialog.before_qbeclear"
         
         #end add-point
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE g_master.* TO NULL   #畫面變數清空
            INITIALIZE lc_param.* TO NULL   #傳遞參數變數清空
            #add-point:ui_dialog段qbeclear name="ui_dialog.qbeclear"
            
            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"
         
         #end add-point
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
      
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM   
         INITIALIZE g_master.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL axcp500_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF cl_null(g_parentprog) THEN #190121-00002#1
         IF NOT cl_schedule_exec_check() THEN
            CONTINUE WHILE
         END IF
      END IF #190121-00002#1
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      #161118-00043#1-add-s
      LET lc_param.glaald = g_master.glaald
      LET lc_param.xcat001 = g_master.xcat001
      LET lc_param.field_flag = g_master.field_flag
      LET lc_param.yy = g_master.yy
      LET lc_param.pp = g_master.pp
      #161118-00043#1-add-e
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)  #r類使用g_master/p類使用lc_param
 
      #190121-00002#1 - S -
      #帶起程式來源為azzi950時僅回傳條件不做執行
      IF NOT cl_null(g_parentprog) AND g_parentprog = "azzi950"  THEN
         IF g_action_choice = "batch_execute" THEN
            #將條件寫入暫存檔並結束
            CALL cl_schedule_write_json_data(ls_js)
            EXIT WHILE
         END IF   
      END IF      
      #190121-00002#1 - E -
      
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      ELSE
         IF g_chk_jobid THEN 
            LET g_jobid = g_schedule.gzpa001
         ELSE 
            LET g_jobid = cl_schedule_get_jobid(g_prog)
         END IF 
 
         #依照指定模式執行報表列印
         CASE 
            WHEN g_schedule.gzpa003 = "0"
                 CALL axcp500_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = axcp500_transfer_argv(ls_js)
                 CALL cl_cmdrun(ls_js)
 
            WHEN g_schedule.gzpa003 = "2"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
 
            WHEN g_schedule.gzpa003 = "3"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
         END CASE  
 
         IF g_schedule.gzpa003 = "2" OR g_schedule.gzpa003 = "3" THEN 
            CALL cl_ask_confirm3("std-00014","") #設定完成
         END IF    
         LET g_schedule.gzpa003 = "0" #預設一開始 立即於前景執行
 
         #add-point:ui_dialog段after schedule name="process.after_schedule"
         
         #end add-point
 
         #欄位初始資訊 
         CALL cl_schedule_init_info("all",g_schedule.gzpa003) 
         LET gi_hiden_asign = FALSE 
         LET gi_hiden_exec = FALSE 
         LET gi_hiden_spec = FALSE 
         LET gi_hiden_exec_end = FALSE 
         CALL cl_schedule_hidden()
      END IF
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="axcp500.transfer_argv" type="s" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION axcp500_transfer_argv(ls_js)
 
   #add-point:transfer_agrv段define (客製用) name="transfer_agrv.define_customerization"
   
   #end add-point
   DEFINE ls_js       STRING
   DEFINE la_cmdrun   RECORD
             prog       STRING,
             actionid   STRING,
             background LIKE type_t.chr1,
             param      DYNAMIC ARRAY OF STRING
                  END RECORD
   DEFINE la_param    type_parameter
   #add-point:transfer_agrv段define name="transfer_agrv.define"
   
   #end add-point
 
   LET la_cmdrun.prog = g_prog
   LET la_cmdrun.background = "Y"
   LET la_cmdrun.param[1] = ls_js
 
   #add-point:transfer.argv段程式內容 name="transfer.argv.define"
   
   #end add-point
 
   RETURN util.JSON.stringify( la_cmdrun )
END FUNCTION
 
{</section>}
 
{<section id="axcp500.process" type="s" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION axcp500_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_cnt         LIKE type_t.num10   #160701-00012#3 
   DEFINE l_xcat003     LIKE xcat_t.xcat003  #170223-00010#1 add
   DEFINE l_flag        LIKE type_t.num5  #170217-00025#8 add
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   LET l_flag = FALSE      #170217-00025#8 add
   ## --> 180202-00048#6
   LET g_success = TRUE
   LET g_master.glaald = lc_param.glaald
   LET g_master.xcat001 = lc_param.xcat001
   LET g_master.field_flag = lc_param.field_flag
   LET g_master.yy = lc_param.yy
   LET g_master.pp = lc_param.pp
   LET g_master.wc = lc_param.wc
   ## --< 180202-00048#6
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE axcp500_process_cs CURSOR FROM ls_sql
#  FOREACH axcp500_process_cs INTO
   #add-point:process段process name="process.process"
   #161118-00043#1-add-s
     #161129-00063#1-s-mark 
     ##160701-00012#3---add---s
     #LET l_cnt = 0
     #SELECT COUNT(*) INTO l_cnt
     #  FROM xcea_t
     # WHERE xceaent = g_enterprise
     #   #161118-00043#1-mod-s
#    #    AND xceald = g_master.glaald
#    #    AND xcea004 = g_master.yy         
#    #    AND xcea005 = g_master.pp 
     #   AND xceald = lc_param.glaald
     #   AND xcea004 = lc_param.yy         
     #   AND xcea005 = lc_param.pp 
     #   #161118-00043#1-mod-e
     #   AND xcea002 NOT IN('7','3')
     #IF l_cnt > 0 THEN      
     #   INITIALIZE g_errparam TO NULL
     #   LET g_errparam.code   = 'axc-00780'
     #   LET g_errparam.extend = ''
     #   LET g_errparam.popup  = TRUE
     #   CALL cl_err()
     #   RETURN
     #END IF
     ##160701-00012#3---add---e
     #161129-00063#1-e-mark 
     #161129-00063#1-s-add
      IF NOT s_axcp500_chk_cal(lc_param.glaald,lc_param.xcat001,lc_param.yy,lc_param.pp) THEN 
         LET g_success = FALSE  ##180202-00048#6
         RETURN
      END IF
     #161129-00063#1-e-add
     #170426-00039#1 add(S)

     IF NOT cl_null(g_master.glaald) AND NOT cl_null(g_master.xcat001) THEN
        INITIALIZE g_chkparam.* TO NULL
        LET g_errshow = TRUE
        LET g_chkparam.arg1 = g_master.glaald
        LET g_chkparam.arg2 = g_master.xcat001
        IF NOT cl_chk_exist("v_xcaz001") THEN
           LET g_success = FALSE  ##180202-00048#6
           RETURN                     
        END IF
     ##--> 180202-00048#6
     ELSE
        LET g_success = FALSE 
        RETURN
     ##<-- 180202-00048#6        
     END IF
     #170426-00039#1 add(E)

      #160929-00024#1---add---s
      CALL axcp500_date_chk()
      IF NOT cl_null(g_errno) THEN
         #161118-00043#1-mod-s
#        LET g_errparam.extend = g_master.yy
         #LET g_errparam.extend = lc_param.yy    #170301-00026#1 
         LET g_errparam.extend = lc_param.yy ," / ",lc_param.pp #170301-00026#1 
         #161118-00043#1-mod-e
         LET g_errparam.code   = g_errno
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         #161118-00043#1-mod-s
#        RETURN
         LET li_p01_status = FALSE
         #161118-00043#1-mod-e
         LET g_success = FALSE  ##180202-00048#6
      END IF      
      #160929-00024#1---add---e
      IF li_p01_status THEN
#wujie 160321 --begin
         LET g_stime = cl_get_current() 
         DISPLAY 'START TIME IS :',g_stime
#wujie 160321 --end  

         #170223-00010#1 add--s
         SELECT xcat003 INTO l_xcat003 FROM xcat_t
          WHERE xcatent = g_enterprise
            AND xcat001 = lc_param.xcat001
         IF l_xcat003 = '2' THEN  #实时成本
            ##建立xcgu_tmp 等临时表   
            #CALL s_axcp500_realtime_cre_tmp_table(lc_param.glaald,lc_param.xcat001,lc_param.yy,lc_param.pp)
            #     RETURNING l_success
            #IF NOT l_success THEN
            #   RETURN 
            #END IF
            
            CALL s_transaction_begin()
            CALL s_axcp500_realtime(lc_param.glaald,lc_param.xcat001,lc_param.yy,lc_param.pp,lc_param.wc)
                 RETURNING l_success
            IF NOT l_success THEN
               CALL s_transaction_end('N','0')
               LET g_success = FALSE  ##180202-00048#6
            ELSE
               LET l_flag = TRUE #170217-00025#8 add
               CALL s_transaction_end('Y','0')
            END IF
         ELSE
         #170223-00010#1 add--e
            CALL s_axcp500_create_temp_table()
                 RETURNING l_success
            IF NOT l_success THEN
               LET g_success = FALSE  ##180202-00048#6
               RETURN 
            END IF
            #161118-00043#1-mod-s
#           CALL s_axcp500_cal(g_master.glaald,g_master.xcat001,g_master.yy,g_master.pp,g_master.wc)
            CALL s_axcp500_cal(lc_param.glaald,lc_param.xcat001,lc_param.yy,lc_param.pp,lc_param.wc)
            #161118-00043#1-mod-e
                 RETURNING l_success
            #151214-00005#1 add---s
         END IF  #170223-00010#1 add
         IF l_success THEN     
            LET l_flag = TRUE #170217-00025#8 add
            
            #170619-00013#1--add---s
            #用帳套+成本計算方式回寫最近計算成本年度、期別
            UPDATE xcaz_t SET xcaz007=lc_param.yy,
                              xcaz008=lc_param.pp
              WHERE xcazent = g_enterprise
                AND xcazld=lc_param.glaald
                AND xcaz001=lc_param.xcat001
            #170619-00013#1--add---e
            
            LET g_stagecomplete=100
            DISPLAY g_stagecomplete TO stagecomplete
            LET li_p01_status = TRUE   #161118-00043#1-mark-s
         ELSE
            LET g_success = FALSE  ##180202-00048#6
         END IF
         #151214-00005#1 add---e  
#wujie 160321 --begin
         LET g_etime = cl_get_current() 
         DISPLAY 'FINISH TIME IS :',g_etime
      END IF
   #161118-00043#1-add-e
   #170217-00025#8 add-S
   IF l_flag = FALSE THEN
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.code = 'sub-00491'   #無資料產生
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN            
   END IF
   #170217-00025#8 add-E
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      #161118-00043#1-mark-s
#      #160701-00012#3---add---s
#      LET l_cnt = 0
#      SELECT COUNT(*) INTO l_cnt
#        FROM xcea_t
#       WHERE xceaent = g_enterprise
#         AND xceald = g_master.glaald
#         AND xcea004 = g_master.yy         
#         AND xcea005 = g_master.pp 
#         AND xcea002 NOT IN('7','3')
#      IF l_cnt > 0 THEN      
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code   = 'axc-00780'
#         LET g_errparam.extend = ''
#         LET g_errparam.popup  = TRUE
#         CALL cl_err()
#         RETURN
#      END IF
#      #160701-00012#3---add---e
#      
#      #160929-00024#1---add---s
#      CALL axcp500_date_chk()
#      IF NOT cl_null(g_errno) THEN
#         LET g_errparam.extend = g_master.yy
#         LET g_errparam.code   = g_errno
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()
#         RETURN                       
#      END IF      
#      #160929-00024#1---add---e
#      
##wujie 160321 --begin
#      LET g_stime = cl_get_current() 
#      DISPLAY 'START TIME IS :',g_stime
##wujie 160321 --end  
#      CALL s_axcp500_create_temp_table()
#           RETURNING l_success
#      IF NOT l_success THEN
#         RETURN 
#      END IF
#      CALL s_axcp500_cal(g_master.glaald,g_master.xcat001,g_master.yy,g_master.pp,g_master.wc)
#           RETURNING l_success
#      #151214-00005#1 add---s
#      IF l_success THEN     
#         LET g_stagecomplete=100
#         DISPLAY g_stagecomplete TO stagecomplete
#      END IF
#      #151214-00005#1 add---e  
##wujie 160321 --begin
#      LET g_etime = cl_get_current() 
#      DISPLAY 'FINISH TIME IS :',g_etime
#wujie 160321 --end        
      #161118-00043#1-mark-e
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL axcp500_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="axcp500.get_buffer" type="s" >}
PRIVATE FUNCTION axcp500_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.glaald = p_dialog.getFieldBuffer('glaald')
   LET g_master.xcat001 = p_dialog.getFieldBuffer('xcat001')
   LET g_master.field_flag = p_dialog.getFieldBuffer('field_flag')
   LET g_master.yy = p_dialog.getFieldBuffer('yy')
   LET g_master.pp = p_dialog.getFieldBuffer('pp')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="axcp500.msgcentre_notify" type="s" >}
PRIVATE FUNCTION axcp500_msgcentre_notify()
 
   #add-point:process段define (客製用) name="msgcentre_notify.define_customerization"
   
   #end add-point
   DEFINE lc_state LIKE type_t.chr5
   #add-point:process段define name="msgcentre_notify.define"
   
   #end add-point
 
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = "process"
 
   #add-point:msgcentre其他通知 name="msg_centre.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="axcp500.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 年度期别检查
# Date & Author..: 2016/10/10 By 02295
# Modify.........:
################################################################################
PRIVATE FUNCTION axcp500_date_chk()
   DEFINE l_flag         LIKE type_t.dat
   DEFINE l_yy           LIKE xref_t.xref001
   DEFINE l_pp           LIKE xref_t.xref002
   DEFINE l_ooef017      LIKE ooef_t.ooef017
   DEFINE l_comp         LIKE glaa_t.glaacomp
   
   IF cl_null(g_master.glaald) THEN RETURN END IF

   IF cl_null(g_master.yy) THEN RETURN END IF

   IF cl_null(g_master.pp) THEN RETURN END IF

   SELECT glaacomp INTO l_comp FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = g_master.glaald
         
   #190514-00053#1 mark-S
#   SELECT ooef017 INTO l_ooef017 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = l_comp
#   LET l_flag = cl_get_para(g_enterprise,l_ooef017,'S-FIN-6012')   #关账日期
#   LET l_yy = YEAR(l_flag)
#   LET l_pp = MONTH(l_flag)
   #190514-00053#1 mark-E
   #190514-00053#1 add-S
   #根据关账日期获取到年期
   CALL s_fin_get_close_date(l_comp) RETURNING l_flag,l_yy,l_pp
   #190514-00053#1 add-E
   LET g_errno = ' '
   IF l_yy > g_master.yy THEN
      LET g_errno = 'axc-00303'
   END IF

   #IF l_yy <= g_master.yy AND l_pp > g_master.pp THEN   #161117-00031#1 mark
   #IF l_yy = g_master.yy AND l_pp > g_master.pp THEN     #161117-00031#1 add   #170301-00026#1 
   IF l_yy = g_master.yy AND l_pp >= g_master.pp THEN     #161117-00031#1 add   #170301-00026#1 
      #LET g_errno = 'axc-00304'  #170301-00026#1 
      LET g_errno = 'axc-00828'   #170301-00026#1 
   END IF
END FUNCTION

#end add-point
 
{</section>}
 
