#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="asfp500.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0002(2017-04-21 09:28:16), PR版次:0002(2019-05-14 14:38:39)
#+ Customerized Version.: SD版次:0002(2019-06-01 19:07:13), PR版次:0002(2019-07-01 19:26:25)
#+ Build......: 000352
#+ Filename...: asfp500
#+ Description: 工單生管結案批次作業
#+ Creator....: 00378(2014-03-16 16:11:39)
#+ Modifier...: 08992 -SD/PR- 00272
 
{</section>}
 
{<section id="asfp500.global" type="s" >}
#應用 p01 樣板自動產生(Version:20)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#151229-00004#1   2015/12/29 By tsungyung 有對應的收貨單，但收貨數量與委外入庫的數量不同時，這類工單不能結案。
#160104-00009#1   2016/01/08 By tsungyung 自动结案需抓取aooi200的设定值
#160111-00024#1   2016/01/28 By Ann_Huang 呼叫s_asfp500_get_max_reference_date多回傳參數l_flag記錄單據來源,來決定顯示訊息 
#160330-00012#1   2016/04/01 By catmoon   將CALL cl_progress_no_window_ing(參數)參數有中文的情形改由變數帶入
#170111-00049#1   2017/01/16 By dujuan    委外工單單別設定工單自動生管結案，委外入庫過帳背景自動將委外工單結案，但未將委外採購單結案導致無法取消結案
#170124-00029#1   2017/01/24 By 06948     調整 asfp500_sel_po_p1 增加 ent 條件給值。
#170223-00033#1   2017/02/23 By fionchen  調整#151229-00004#1,有對應收貨單時,若收貨數量與委外驗退+委外入庫的數量不同時,這類工單不能結案
#170220-00049#1   2017/03/03 By liuym     查询时放开单头勾选条件输入，组到单身一起过滤查询
#170309-00051#1   2017/03/14 By Whitney   批次執行在檢核一次結案日期
#170314-00079#1   2017/03/14 By Whitney   ON ACTION wo_close 增加 ACCEPT DIALOG
#170302-00012#9   2017/03/24 By 08734     整批调整未产生数据时，提示消息修正。
#170405-00042#1   2017/04/11 By xujing    效能优化,新增1个b1_fill()
#170222-00022#7   2017/04/12 By Jessica   修改訊息顯示
#170411-00095#2   2017/04/20 By 08992     QBE條件增加母工單(sfaa021)
#170424-00053#1   2017/04/27 By Whitney   工單開窗排除已結案
#170509-00087#1   2017/05/11 By xujing    工單存在未確認工單變更單不可結案
#170509-00065#1   2017/05/22 By 09042     工單結案執行後，已經結案的單子還留在畫面上，應該是要只帶出未結案的工單資料
#170517-00018#1   2017/05/23 By Whitney   增加判斷生管結案日不可以小於庫存關帳日跟成本關帳日
#170713-00009#1   2017/07/26 By fionchen  修正背景執行時,接收參數問題 
#170703-00025#25  2017/07/28  By wanghaoz   调整construct/input中的开窗调用，将q_ooag001/q_ooag001_4调整成q_ooag001_2
#170817-00007#1   2017/08/17 By zhaoqya   g_cnt从num5->num10
#180111-00032#1   2018/01/12 By 05426     检查工单委外采购数量时，用委外采购单关联单据页签资料关联查询 
#180206-00004#1   2018/02/06 By 05426     批次结案时，如果工单结案日小于关账日，报错后依然将工单结案问题修正
#171211-00028#16  2018/02/09 By 05423     工单结案时，产生差异数据到xcna/xcnb/xcnc
#180410-00008#1   2018/04/10 By 05426     背景排程无法结案问题处理
#180111-00043#27  2018/05/02 by 09773     维护方法说明
#180625-00034#1   2018/06/25 By 02702     需將採購單單身都結案完後,再跑整張結案
#180815-00058#1   2018/08/20 By 02295     程式一打开第一次点X不应该要查询出资料,故本单将做调整,第一次点击X不需要查询出资料
#180821-00043#1   2018/09/10 By 00593     增加匯出Excel功能
#180928-00017#1   2018/09/29 By 02295     发料未完成工单的检查时,排除掉参考材料
#181004-00013#1   2018/10/12 By 07423     因生產數量可能變更為0,因此調整生產數量為分母的SQL語法
#181001-00015#79  2018/10/30 By 05016     補上SQL中WHERE漏寫的ent條件
#181024-00017#4   2018/11/20 By 10046     拆件式工單，已入庫合格量應改以完工套數呈現
#181127-00023#1   2018/11/28 By 00593     修正181024-00017#4,當拆件式工單與多產出工單才依sfac_t的數量計算未完工比率,其他工單類型應該還是要以sfaa_t的數量計算
#181130-00013#1   2018/11/30 By 07804     修正當工單結案日期小於工單本身開立日期，應顯示錯誤訊息
#181207-00039#1   2018/12/10 By 00593     修正181127-00023#1,當執行的範圍內有任何一筆拆件式入庫的預計產出量為0的時候,執行工單結案會撈不出任何資料
#190418-00024#1   2019/04/18 By 02159     修正180625-00034#1修改SQL錯誤問題
#190513-00011#1   2019/05/14 By 00272     避免在做asfp500的中途又有人去做庫存關帳(ainp150),執行的當下取到的庫存關帳日期非最新的,
#                                         故按下執行[工單結案]ACTION時和AFTER FIELD 單身結案日(close_dd)時,再重抓最新的庫存關帳日期 
#190628-00024#1   2019/06/28 By 02159     合併委外採購單,工單結案,委外採購單的那個項次的工單需可以結案
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"
#C190601-06857#   备注  #20190110 add sfaa046 by yangtt
#end add-point
#(ver:20) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:20) --- end ---
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_schedule
#add-point:增加匯入項目 name="global.import"
#180821-00043#1 add-s
IMPORT JAVA com.fourjs.fgl.lang.FglRecord   #(ver:87) add

GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#180821-00043#1 add-e
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
        close_dd         LIKE type_t.dat,
        auto             LIKE type_t.chr1,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       a LIKE type_t.num26_10, 
   d LIKE type_t.chr1, 
   c LIKE type_t.chr1, 
   b LIKE type_t.chr1, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
 TYPE type_g_sfaa_d    RECORD
                       sel            LIKE type_t.chr1,
                       sfaadocno      LIKE sfaa_t.sfaadocno,
                       sfaa003        LIKE sfaa_t.sfaa003, 
                       sfaa057        LIKE sfaa_t.sfaa057, 
                       sfaa010        LIKE sfaa_t.sfaa010, 
                       sfaa010_desc1  LIKE type_t.chr500, 
                       sfaa010_desc2  LIKE type_t.chr500,   
                       sfaa020        LIKE sfaa_t.sfaa020, 
                       sfaa046        LIKE sfaa_t.sfaa046,    #20190110 add sfaa046 by yangtt
                       sfaastus       LIKE sfaa_t.sfaastus, 
                       sfaa012        LIKE sfaa_t.sfaa012, 
                       sfaa050        LIKE sfaa_t.sfaa050, 
                       sfaa051        LIKE sfaa_t.sfaa051, 
                       sfaa055        LIKE sfaa_t.sfaa055, 
                       sfaa056        LIKE sfaa_t.sfaa056, 
                       diff_qty       LIKE type_t.num20_6,
                       unfinish_rate  LIKE type_t.num26_10,
                       sfaa013        LIKE sfaa_t.sfaa013, 
                       sfaa009        LIKE sfaa_t.sfaa009, 
                       sfaa009_desc   LIKE type_t.chr500, 
                       sfaa017        LIKE sfaa_t.sfaa017, 
                       sfaa017_desc   LIKE type_t.chr500, 
                       sfaa002        LIKE sfaa_t.sfaa002,
                       sfaa002_desc   LIKE type_t.chr500,
                       unfinish_b     LIKE type_t.chr1,
                       unfinish_c     LIKE type_t.chr1,
                       unfinish_d     LIKE type_t.chr1,   
                       close_dd       LIKE type_t.dat,
                       sfaasite       LIKE sfaa_t.sfaasite
                       ,sfaa021       LIKE sfaa_t.sfaa021  #170411-00095#2 add
                       END RECORD
 TYPE type_g_sfba_d    RECORD
                       sfbaseq        LIKE sfba_t.sfbaseq, 
                       sfbaseq1       LIKE sfba_t.sfbaseq1, 
                       sfba006        LIKE sfba_t.sfba006, 
                       sfba006_desc1  LIKE type_t.chr500, 
                       sfba006_desc2  LIKE type_t.chr500, 
                       sfba002        LIKE sfba_t.sfba002, 
                       sfba002_desc   LIKE type_t.chr500, 
                       sfba003        LIKE sfba_t.sfba003, 
                       sfba003_desc   LIKE type_t.chr500, 
                       sfba004        LIKE sfba_t.sfba004, 
                       sfba014        LIKE sfba_t.sfba014, 
                       sfba014_desc   LIKE type_t.chr500, 
                       sfba023        LIKE sfba_t.sfba023, 
                       sfba024        LIKE sfba_t.sfba024, 
                       sfba013        LIKE sfba_t.sfba013, 
                       sfba015        LIKE sfba_t.sfba015, 
                       sfba016        LIKE sfba_t.sfba016, 
                       sfba025        LIKE sfba_t.sfba025, 
                       unissue_qty    LIKE sfba_t.sfba015, 
                       sfba017        LIKE sfba_t.sfba017, 
                       sfba018        LIKE sfba_t.sfba018, 
                       sfba012        LIKE sfba_t.sfba012
                       END RECORD
 
 TYPE type_g_sfcb_d    RECORD
                       sfcb001        LIKE sfcb_t.sfcb001, 
                       sfcb002        LIKE sfcb_t.sfcb002, 
                       sfcb003        LIKE sfcb_t.sfcb003, 
                       sfcb004        LIKE sfcb_t.sfcb004, 
                       sfcb046        LIKE sfcb_t.sfcb046, 
                       sfcb047        LIKE sfcb_t.sfcb047, 
                       sfcb050        LIKE sfcb_t.sfcb050, 
                       sfcb048        LIKE sfcb_t.sfcb048, 
                       sfcb049        LIKE sfcb_t.sfcb049, 
                       sfcb051        LIKE sfcb_t.sfcb051
                       END RECORD
 
 TYPE type_g_prog_d    RECORD
                       sdocno         LIKE sfaa_t.sfaadocno,
                       prog           LIKE gzza_t.gzza001, 
                       prog_desc      LIKE type_t.chr50, 
                       docno          LIKE sfaa_t.sfaadocno, 
                       stus           LIKE sfaa_t.sfaastus, 
                       crtid          LIKE sfaa_t.sfaacrtid, 
                       crtid_desc     LIKE type_t.chr50,  
                       crtdp          LIKE sfaa_t.sfaacrtdp, 
                       crtdp_desc     LIKE type_t.chr50,
                       opendd         LIKE type_t.dat,
                       postdd         LIKE type_t.dat,                              
                       errno          LIKE gzze_t.gzze001,
                       err_desc       LIKE type_t.chr200
                       END RECORD 

DEFINE g_sfaa_d        DYNAMIC ARRAY OF type_g_sfaa_d
DEFINE g_sfaa_d_t      type_g_sfaa_d
DEFINE g_sfba_d        DYNAMIC ARRAY OF type_g_sfba_d
DEFINE g_sfba_d_t      type_g_sfba_d
DEFINE g_sfcb_d        DYNAMIC ARRAY OF type_g_sfcb_d
DEFINE g_sfcb_d_t      type_g_sfcb_d
DEFINE g_prog_d        DYNAMIC ARRAY OF type_g_prog_d
DEFINE g_prog_d_t      type_g_prog_d
DEFINE g_err_arr       DYNAMIC ARRAY OF type_g_prog_d
DEFINE g_param         type_parameter
DEFINE g_close_dd      LIKE type_t.dat
DEFINE g_rec_b1        LIKE type_t.num5
DEFINE g_rec_b2        LIKE type_t.num5
DEFINE g_rec_b3        LIKE type_t.num5
DEFINE g_rec_b4        LIKE type_t.num5
DEFINE l_ac            LIKE type_t.num5
DEFINE g_press         LIKE type_t.num5
DEFINE g_prog_flag     LIKE type_t.chr10   #160104-00009#1 add
DEFINE g_flag          LIKE type_t.num5  #170302-00012#9   2017/03/24  By 08734 add
#170222-00022#7-S
GLOBALS
DEFINE g_err_collect   BOOLEAN
DEFINE g_cnt           LIKE type_t.num10   #170817-00007#1 num5->num10
END GLOBALS
#170222-00022#7-E
DEFINE g_mfg_close     LIKE type_t.dat      #170517-00018#1
DEFINE g_fin_close     LIKE type_t.dat      #170517-00018#1
DEFINE l_arr_len       INTEGER              #180821-00043#1 add
DEFINE l_arr_cnt       INTEGER              #180821-00043#1 add
DEFINE lb_get_type     LIKE type_t.chr20    #180821-00043#1 add
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="asfp500.main" type="s" >}
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
   CALL cl_ap_init("csf","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   LET g_param.close_dd = g_argv[1]
   LET g_param.auto     = g_argv[2]
   LET g_param.wc       = g_argv[3]
   IF NOT cl_null(g_argv[4]) THEN       #170713-00009#1 add 因為自動排程為json傳入參數,若於此再設定一次g_bgjob,會造成無法背景執行
      LET g_bgjob       = g_argv[4]
   END IF                               #170713-00009#1 add      
   LET g_prog_flag      = g_argv[5]     #160104-00009#1 add   
   IF cl_null(g_bgjob) THEN LET g_bgjob = 'N' END IF
   LET g_press = FALSE
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL asfp500_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asfp500 WITH FORM cl_ap_formpath("csf",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL asfp500_init()
 
      #進入選單 Menu (="N")
      CALL asfp500_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_asfp500
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="asfp500.init" type="s" >}
#+ 初始化作業
PRIVATE FUNCTION asfp500_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE lwin_curr      ui.Window
   DEFINE lfrm_curr      ui.Form
   DEFINE ls_path        STRING

   #end add-point
 
   LET g_error_show = 1
   LET gwin_curr2 = ui.Window.getCurrent()
   LET gfrm_curr2 = gwin_curr2.getForm()
   CALL cl_schedule_import_4fd()
   CALL cl_set_combo_scc("gzpa003","75")
   IF cl_get_para(g_enterprise,"","E-SYS-0005") = "N" THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF 
   #add-point:畫面資料初始化 name="init.init"

   LET lwin_curr = ui.Window.getCurrent()
   LET lfrm_curr = lwin_curr.getForm()
   LET ls_path = os.Path.join(os.Path.join(FGL_GETENV("ERP"),"cfg"),"4tb")
   LET ls_path = os.Path.join(ls_path,"toolbar_q.4tb")
   CALL lfrm_curr.loadToolBar(ls_path)

   #工单状态
   CALL cl_set_combo_scc('sfaa003','4007')
   #厂外/委外
   CALL cl_set_combo_scc('sfaa057','4010')
   #状态码
   CALL cl_set_combo_scc_part('sfaastus','13','C,D,E,F,H,M,N,R,W,X,Y')
   
   CALL cl_set_combo_scc('sfaa004','4008')
   CALL cl_set_combo_scc('sfaa005','4009')
   CALL cl_set_combo_scc('sfab001','4009')

   CALL cl_set_combo_scc_part('stus','13','A,C,D,E,F,G,I,M,N,O,P,R,S,W,X,Y,H,V')

   LET g_master.a = 0
   LET g_master.b = 'Y'
   LET g_master.c = 'Y'
   LET g_master.d = 'Y'
   
   LET g_mfg_close = cl_get_para(g_enterprise,g_site,'S-MFG-0031')  #170517-00018#1
   LET g_fin_close = cl_get_para(g_enterprise,g_site,'S-FIN-6012')  #170517-00018#1

   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asfp500.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION asfp500_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_date        LIKE type_t.dat
   DEFINE lc_master     type_master
   DEFINE l_yn          LIKE type_t.chr1    #結案否      #151229-00004#1 add
   DEFINE l_flag        LIKE type_t.chr1    #160111-00024#1 By Ann_Huang --- add
   DEFINE l_i           LIKE type_t.num10    #180410-00008#1 add
   DEFINE l_li          LIKE type_t.num10    #180410-00008#1 add
   LET g_bgjob = 'N'
   CALL asfp500_query()
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      IF NOT INT_FLAG THEN #180815-00058#1
         #170509-00065#1 by 09042 add(s)
         CALL asfp500_b1_fill_new()  
         CALL asfp500_b2_fill()
         CALL asfp500_b3_fill()
         CALL asfp500_b4_fill()
         #170509-00065#1 by 09042 add(e)
      END IF  #180815-00058#1
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.a,g_master.d,g_master.c,g_master.b 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               LET lc_master.* = g_master.*
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD a
            #add-point:BEFORE FIELD a name="input.b.a"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD a
            
            #add-point:AFTER FIELD a name="input.a.a"
               IF g_master.a < 0 OR g_master.a > 100 THEN
                  #輸入值不在0-100之間(包括臨界值)！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aim-00011'
                  LET g_errparam.extend = g_master.a
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET g_master.a = lc_master.a
                  DISPLAY BY NAME g_master.a
                  NEXT FIELD a
               END IF
               IF lc_master.a <> g_master.a THEN
#                  CALL asfp500_b1_fill()  #170405-00042#1 mark
                  CALL asfp500_b1_fill_new()  #170405-00042#1 add
                  CALL asfp500_b2_fill()
                  CALL asfp500_b3_fill()
                  CALL asfp500_b4_fill()                     
               END IF
               LET lc_master.a = g_master.a
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE a
            #add-point:ON CHANGE a name="input.g.a"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD d
            #add-point:BEFORE FIELD d name="input.b.d"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD d
            
            #add-point:AFTER FIELD d name="input.a.d"
               IF g_master.d NOT MATCHES '[YN]' THEN
                  NEXT FIELD d
               END IF    
               IF lc_master.d <> g_master.d THEN
#                  CALL asfp500_b1_fill()  #170405-00042#1 mark
                  CALL asfp500_b1_fill_new()  #170405-00042#1 add
                  CALL asfp500_b2_fill()
                  CALL asfp500_b3_fill()
                  CALL asfp500_b4_fill()                     
               END IF
               LET lc_master.d = g_master.d   
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE d
            #add-point:ON CHANGE d name="input.g.d"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD c
            #add-point:BEFORE FIELD c name="input.b.c"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD c
            
            #add-point:AFTER FIELD c name="input.a.c"
               IF g_master.c NOT MATCHES '[YN]' THEN
                  NEXT FIELD c
               END IF               
               IF lc_master.c <> g_master.c THEN
#                  CALL asfp500_b1_fill()  #170405-00042#1 mark
                  CALL asfp500_b1_fill_new()  #170405-00042#1 add
                  CALL asfp500_b2_fill()
                  CALL asfp500_b3_fill()
                  CALL asfp500_b4_fill()                     
               END IF
               LET lc_master.c = g_master.c
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE c
            #add-point:ON CHANGE c name="input.g.c"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b
            #add-point:BEFORE FIELD b name="input.b.b"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD b
            
            #add-point:AFTER FIELD b name="input.a.b"
               IF g_master.b NOT MATCHES '[YN]' THEN
                  NEXT FIELD b
               END IF
               IF lc_master.b <> g_master.b THEN
#                  CALL asfp500_b1_fill()  #170405-00042#1 mark
                  CALL asfp500_b1_fill_new()  #170405-00042#1 add
                  CALL asfp500_b2_fill()
                  CALL asfp500_b3_fill()
                  CALL asfp500_b4_fill()                     
               END IF
               LET lc_master.b = g_master.b
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b
            #add-point:ON CHANGE b name="input.g.b"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.a
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD a
            #add-point:ON ACTION controlp INFIELD a name="input.c.a"
            
            #END add-point
 
 
         #Ctrlp:input.c.d
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD d
            #add-point:ON ACTION controlp INFIELD d name="input.c.d"
            
            #END add-point
 
 
         #Ctrlp:input.c.c
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD c
            #add-point:ON ACTION controlp INFIELD c name="input.c.c"
            
            #END add-point
 
 
         #Ctrlp:input.c.b
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD b
            #add-point:ON ACTION controlp INFIELD b name="input.c.b"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"

      
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         DISPLAY ARRAY g_sfba_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b2) 

            BEFORE ROW
               LET l_ac = DIALOG.getCurrentRow("s_detail2")


            BEFORE DISPLAY
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
              #LET g_current_page = 2

         END DISPLAY

         DISPLAY ARRAY g_sfcb_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b3) 

            BEFORE ROW
               LET l_ac = DIALOG.getCurrentRow("s_detail3")


            BEFORE DISPLAY
               LET l_ac = DIALOG.getCurrentRow("s_detail3")
              #LET g_current_page = 2

         END DISPLAY

         DISPLAY ARRAY g_prog_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b4) 

            BEFORE ROW
               LET l_ac = DIALOG.getCurrentRow("s_detail4")


            BEFORE DISPLAY
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
              #LET g_current_page = 2

         END DISPLAY     
         
         INPUT ARRAY g_sfaa_d FROM s_detail1.*
             ATTRIBUTE(COUNT = g_rec_b1,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                     INSERT ROW = FALSE, 
                     DELETE ROW = FALSE,
                     APPEND ROW = FALSE)
            
            BEFORE ROW
               LET l_ac = ARR_CURR()
               CALL asfp500_b2_fill()
               CALL asfp500_b3_fill()
               CALL asfp500_b4_fill()
               
            BEFORE FIELD sel
               CALL cl_set_comp_required('close_dd',FALSE)
 
            ON CHANGE sel
               IF g_sfaa_d[l_ac].sel = 'Y' THEN
                  CALL s_asfp500_get_max_reference_date(g_sfaa_d[l_ac].sfaadocno)
                       RETURNING l_date,l_flag     #160111-00024#1 --- add
                       #RETURNING l_date           #160111-00024#1 --- mark    
                  IF cl_null(g_sfaa_d[l_ac].close_dd) OR g_sfaa_d[l_ac].close_dd < l_date THEN
                     LET g_sfaa_d[l_ac].close_dd = l_date
                  END IF
                  
               ELSE
                  LET g_sfaa_d[l_ac].close_dd = NULL
               END IF
               DISPLAY BY NAME g_sfaa_d[l_ac].close_dd
               
            AFTER FIELD sel
               IF g_sfaa_d[l_ac].sel NOT MATCHES '[YN]' THEN
                  NEXT FIELD sel
               END IF
               IF g_sfaa_d[l_ac].sel = 'Y' THEN
                  CALL cl_set_comp_required('close_dd',TRUE)
                  CALL s_asfp500_get_max_reference_date(g_sfaa_d[l_ac].sfaadocno)
                       RETURNING l_date,l_flag     #160111-00024#1 --- add
                       #RETURNING l_date           #160111-00024#1 --- mark                            
                  IF cl_null(g_sfaa_d[l_ac].close_dd) OR g_sfaa_d[l_ac].close_dd < l_date THEN
                     LET g_sfaa_d[l_ac].close_dd = l_date
                     DISPLAY BY NAME g_sfaa_d[l_ac].close_dd
                  END IF
                  
                  #151229-00004#1 --- add start ---
                  CALL asfp500_close_yn(g_sfaa_d[l_ac].sfaadocno) RETURNING l_yn
                  IF l_yn = 'N' THEN   #收貨量不等於入庫量，不可結案
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00702'
                     LET g_errparam.extend = g_sfaa_d[l_ac].sfaadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_sfaa_d[l_ac].sel = 'N' 
                     DISPLAY BY NAME g_sfaa_d[l_ac].sel
                     
                     NEXT FIELD sel
                  END IF
                  #151229-00004#1 --- add end   ---
                  
               END IF
               
#            BEFORE FIELD close_dd
#               IF g_sfaa_d[l_ac].sel = 'Y' THEN
#                  CALL s_asfp500_get_max_reference_date(g_sfaa_d[l_ac].sfaadocno)
#                       RETURNING l_date
#                  IF cl_null(g_sfaa_d[l_ac].close_dd) THEN
#                     LET g_sfaa_d[l_ac].close_dd = l_date
#                  END IF
#               END IF            
               
            AFTER FIELD close_dd
               IF NOT cl_null(g_sfaa_d[l_ac].close_dd) THEN
                  #170517-00018#1-s
                  #IF g_sfaa_d[l_ac].close_dd < g_close_dd THEN
                  #   INITIALIZE g_errparam TO NULL
                  #   LET g_errparam.code = 'asf-00008'
                  #   LET g_errparam.extend = g_sfaa_d[l_ac].close_dd
                  #   LET g_errparam.popup = TRUE
                  #   CALL cl_err()
                  #   NEXT FIELD close_dd
                  #END IF
                  #IF g_sfaa_d[l_ac].close_dd < l_date THEN
                  #   #其他作业有使用此工单单号，工单的结案日期不可小于这些单据中的单据日期或是过帐日期 或 工单本身的开立日期！
                  #   INITIALIZE g_errparam TO NULL
                  #   #LET g_errparam.code = 'asf-00206'        #160111-00024#1 --- add mark
                  #   #160111-00024#1  By Ann_Huang --- add Start ---
                  #   CASE l_flag
                  #        WHEN '1'  LET g_errparam.code = 'asf-00704'   #發料/退料單   
                  #        WHEN '2'  LET g_errparam.code = 'asf-00705'   #報工單   
                  #        WHEN '3'  LET g_errparam.code = 'asf-00706'   #當站報廢單
                  #        WHEN '4'  LET g_errparam.code = 'asf-00707'   #當站下線單
                  #        WHEN '5'  LET g_errparam.code = 'asf-00708'   #重工轉出單
                  #        WHEN '6'  LET g_errparam.code = 'asf-00709'   #下階料報廢單
                  #        WHEN '7'  LET g_errparam.code = 'asf-00710'   #完工入庫單
                  #        WHEN '8'  LET g_errparam.code = 'asf-00711'   #FQC單
                  #        WHEN '9'  LET g_errparam.code = 'asf-00712'   #委外採購單
                  #        WHEN '10' LET g_errparam.code = 'asf-00713'   #委外收貨單、驗退單、委外入庫、倉退單
                  #        WHEN '11' LET g_errparam.code = 'asf-00714'   #IQC單
                  #   END CASE
                  #   #160111-00024#1  By Ann_Huang --- add End ---
                  #   LET g_errparam.extend = g_sfaa_d[l_ac].close_dd
                  #   LET g_errparam.popup = TRUE
                  #   CALL cl_err()
                  #   NEXT FIELD close_dd
                  #END IF
                  LET g_mfg_close = cl_get_para(g_enterprise,g_site,'S-MFG-0031')  #190513-00011#1 add
                  IF NOT asfp500_close_dd_chk(g_sfaa_d[l_ac].sfaadocno,g_sfaa_d[l_ac].close_dd) THEN
                     NEXT FIELD close_dd
                  END IF
                  #170517-00018#1-e
               END IF

            ON ACTION accept
               ACCEPT DIALOG
 
            ON ACTION cancel
               LET INT_FLAG = 1
               EXIT DIALOG 

         END INPUT         


         
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
      
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL asfp500_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            
            #end add-point
 
         ON ACTION batch_execute
            LET g_action_choice = "batch_execute"
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
            ON ACTION wo_close
               LET g_bgjob = 'N'
               LET g_press = TRUE   
               #180410-00008#1 add------s-----               
               LET l_li=0
               LET g_master.wc="'1=2 '"
               FOR l_i=1 TO g_sfaa_d.getLength()
                  IF g_sfaa_d[l_i].sel='Y' THEN
                     LET l_li=l_li+1
                     LET g_master.wc="'",g_sfaa_d[l_i].sfaadocno,"'",",",g_master.wc
                  END IF

               END FOR
               IF l_li=0 THEN
                  FOR l_i=1 TO g_sfaa_d.getLength()
                     LET g_master.wc="'",g_sfaa_d[l_i].sfaadocno,"'",",",g_master.wc
          
                  END FOR
          
               END IF
               LET g_master.wc= " sfaadocno IN (",g_master.wc," )"
               #180410-00008#1 add----e------
               #170314-00079#1-s                
               ACCEPT DIALOG
               #CALL asfp500_process('')
               #CALL asfp500_b1_fill()
               #CALL asfp500_b2_fill()
               #CALL asfp500_b3_fill()
               #CALL asfp500_b4_fill()  
               #CALL cl_set_comp_required('close_dd',FALSE)                              
               #LET g_press = FALSE                
               #170314-00079#1-e   
 
            
            ON ACTION selall
               CALL asfp500_sel_all("Y")

            ON ACTION selnone
               CALL asfp500_sel_all("N")

            ON ACTION query
               LET g_action_choice="query"
               IF cl_auth_chk_act("query") THEN
                  CALL asfp500_query()
               END IF

            ON ACTION filter
#               LET g_action_choice="filter"
#               IF cl_auth_chk_act("filter") THEN
                  CALL asfp500_filter()
#               END IF

#180821-00043#1 add-s
            ON ACTION exporttoexcel
               LET g_action_choice="exporttoexcel"
               IF cl_auth_chk_act("exporttoexcel") THEN
                  #因為不想匯出"執行歷程",所以在進入匯出Excel前將"執行歷程"頁籤隱藏,離開前再恢復顯示
                  CALL cl_set_comp_visible("history_page",FALSE)
                  #因應匯出excel規則調整，需同時符合新舊做法
                  LET lb_get_type = cl_get_exporttoexcel_type()
                  CASE
                     WHEN lb_get_type = "poi"   #使用poi樣板                     
                        CALL g_export_node.clear()                        
                        LET l_arr_len = g_sfaa_d.getLength()
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[1] = "s_detail1"
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_sfaa_d[l_arr_cnt]
                        END FOR
                        LET l_arr_len = g_sfba_d.getLength()
                        LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[2] = "s_detail2"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[2][l_arr_cnt] = g_sfba_d[l_arr_cnt]
                        END FOR
                        LET l_arr_len = g_sfcb_d.getLength()
                        LET g_export_tag[3] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[3] = "s_detail3"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[3][l_arr_cnt] = g_sfcb_d[l_arr_cnt]
                        END FOR
                        LET l_arr_len = g_prog_d.getLength()
                        LET g_export_tag[4] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[4] = "s_detail4"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[4][l_arr_cnt] = g_prog_d[l_arr_cnt]
                        END FOR                        
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_poi()                        
                     OTHERWISE   #使用原始樣板
                        CALL g_export_node.clear()                        
                        LET g_export_node[1] = base.typeInfo.create(g_sfaa_d)  #工單資料
                        LET g_export_id[1]   = "s_detail1"
                        LET g_export_node[2] = base.typeInfo.create(g_sfba_d)  #未發料明細
                        LET g_export_id[2]   = "s_detail2"
                        LET g_export_node[3] = base.typeInfo.create(g_sfcb_d)  #未報工明細
                        LET g_export_id[3]   = "s_detail3"
                        LET g_export_node[4] = base.typeInfo.create(g_prog_d)  #未完成單據
                        LET g_export_id[4]   = "s_detail4"                        
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_to_excel()
                  END CASE
                  CALL cl_set_comp_visible("history_page",TRUE)
               END IF
#180821-00043#1 add-e

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
         CALL asfp500_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)  #r類使用g_master/p類使用lc_param
 
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
                 CALL asfp500_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = asfp500_transfer_argv(ls_js)
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
 
{<section id="asfp500.transfer_argv" type="s" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION asfp500_transfer_argv(ls_js)
 
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
 
{<section id="asfp500.process" type="s" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION asfp500_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_i           LIKE type_t.num10
   DEFINE l_k           LIKE type_t.num10
   DEFINE l_x           LIKE type_t.num10
   DEFINE l_y           LIKE type_t.num10   
   DEFINE l_cnt         LIKE type_t.num10
   DEFINE l_success     LIKE type_t.chr1
   DEFINE l_err_tmp     DYNAMIC ARRAY OF type_g_prog_d     
   DEFINE l_sfaadocno   DYNAMIC ARRAY OF LIKE sfaa_t.sfaadocno
   DEFINE l_ok_cnt      LIKE type_t.num10
   DEFINE l_nook_cnt    LIKE type_t.num10
   DEFINE l_close_dd    LIKE type_t.dat
   DEFINE l_success1    LIKE type_t.num5
   DEFINE l_flag        LIKE type_t.chr1   #160111-00024#1 By Ann_Huang --- add
   DEFINE ls_info       STRING             #160330-00012#1 add
   DEFINE l_date        LIKE type_t.dat    #170309-00051#1
   DEFINE l_doc_type    LIKE ooba_t.ooba002   #170713-00009#1 add
   DEFINE l_auto        LIKE type_t.chr1      #170713-00009#1 add
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   IF g_bgjob = 'N' THEN
      IF NOT g_press THEN
         RETURN
      END IF
   END IF
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      LET li_count = g_rec_b1
      CALL cl_progress_bar_no_window(li_count)
      LET g_flag = FALSE  #170302-00012#9   2017/03/24  By 08734 add
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE asfp500_process_cs CURSOR FROM ls_sql
#  FOREACH asfp500_process_cs INTO
   #add-point:process段process name="process.process"
   #定义一个取工单对应采购单的CURSOR
   LET ls_sql = " SELECT UNIQUE pmdldocno,pmdnseq,pmdl006,pmdl031,pmdl051,pmdlsite,",
                "               pmdlstus,pmdlcrtid,pmdlcrtdp,pmdldocdt",
                "   FROM pmdl_t,pmdn_t,pmdp_t ",
                "  WHERE pmdlent   = pmdpent   AND pmdlent   = pmdnent ",
                "    AND pmdldocno = pmdpdocno AND pmdldocno = pmdndocno",
                "    AND pmdnseq   = pmdpseq ",
                "    AND pmdl005   = '2' ",           #委外采购
                "    AND pmdl007   = '4' ",           #资料来源4.一般工单
                "    AND pmdp003   = ?   ",           #工单号
                "    AND pmdlstus <>'X' "            #剔除作废单据 liuym150810
               ,"    AND pmdlent = '",g_enterprise,"' "      #170124-00029#1 add
                
   PREPARE asfp500_sel_po_p1 FROM ls_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "prepare asfp500_sel_po_p1"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET g_press = FALSE  #170314-00079#1
      RETURN 
   END IF

   DECLARE asfp500_sel_po_cs CURSOR FOR asfp500_sel_po_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "declare asfp500_sel_po_cs"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET g_press = FALSE  #170314-00079#1
      RETURN 
   END IF
   LET g_mfg_close = cl_get_para(g_enterprise,g_site,'S-MFG-0031')  #190513-00011#1 add
  #180625-00034#1 add --s-- 
   LET ls_sql = " SELECT UNIQUE pmdldocno,pmdlsite,pmdlstus",
                "   FROM pmdl_t,pmdn_t,pmdp_t ",
               #"   FROM pmdl_t,pmdn_t,pmdp_t ",   #190418-00024#1 by 02159 mark
                "  WHERE pmdlent   = pmdpent   AND pmdlent   = pmdnent ",
                "    AND pmdldocno = pmdpdocno AND pmdldocno = pmdndocno",
                "    AND pmdnseq   = pmdpseq ",
                "    AND pmdl005   = '2' ",
                "    AND pmdl007   = '4' ",
                "    AND pmdp003   = ?   ",
                "    AND pmdlstus <>'X' "
               ,"    AND pmdlent = '",g_enterprise,"' " 
                
   PREPARE asfp500_sel_po_p FROM ls_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "prepare asfp500_sel_po_p"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET g_press = FALSE
      RETURN 
   END IF

   DECLARE asfp500_sel_po1_cs CURSOR FOR asfp500_sel_po_p
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "declare asfp500_sel_po1_cs"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET g_press = FALSE
      RETURN 
   END IF
  #180625-00034#1 add --e-- 
  
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      LET l_ok_cnt = 0
      LET l_nook_cnt = 0
      LET l_cnt = 0
      CALL g_err_arr.clear()
      LET g_cnt = 0          #170222-00022#7
      FOR l_i = 1 TO g_rec_b1
         #CALL cl_progress_no_window_ing("读取"||g_sfaa_d[l_i].sfaadocno||"基本资料")  #160330-00012#1 mark
          LET ls_info = cl_getmsg_parm("azz-01004",g_lang,g_sfaa_d[l_i].sfaadocno)    #160330-00012#1 add
          CALL cl_progress_no_window_ing(ls_info)                                     #160330-00012#1 add
          IF g_sfaa_d[l_i].sel = 'Y' THEN
             LET l_cnt = l_cnt + 1
          END IF
          IF g_sfaa_d[l_i].sel = 'Y' AND cl_null(g_sfaa_d[l_i].close_dd) THEN
             #结案日期不可为空
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = 'asf-00255'
             LET g_errparam.extend = g_sfaa_d[l_i].sfaadocno
             LET g_errparam.popup = TRUE
             CALL cl_err()
          END IF
          
          #170309-00051#1-s
          IF g_sfaa_d[l_i].sel = 'Y' AND NOT cl_null(g_sfaa_d[l_i].close_dd) THEN
             #170517-00018#1-s
             #IF g_sfaa_d[l_i].close_dd < g_close_dd THEN
             #   INITIALIZE g_errparam TO NULL
             #   LET g_errparam.code = 'asf-00008'
             #   LET g_errparam.extend = g_sfaa_d[l_i].close_dd
             #   LET g_errparam.popup = TRUE
             #   CALL cl_err()
             #END IF
             #CALL s_asfp500_get_max_reference_date(g_sfaa_d[l_i].sfaadocno)
             #     RETURNING l_date,l_flag
             #IF g_sfaa_d[l_i].close_dd < l_date THEN
             #   #其他作业有使用此工单单号，工单的结案日期不可小于这些单据中的单据日期或是过帐日期 或 工单本身的开立日期！
             #   INITIALIZE g_errparam TO NULL
             #   CASE l_flag
             #        WHEN '1'  LET g_errparam.code = 'asf-00704'   #發料/退料單   
             #        WHEN '2'  LET g_errparam.code = 'asf-00705'   #報工單   
             #        WHEN '3'  LET g_errparam.code = 'asf-00706'   #當站報廢單
             #        WHEN '4'  LET g_errparam.code = 'asf-00707'   #當站下線單
             #        WHEN '5'  LET g_errparam.code = 'asf-00708'   #重工轉出單
             #        WHEN '6'  LET g_errparam.code = 'asf-00709'   #下階料報廢單
             #        WHEN '7'  LET g_errparam.code = 'asf-00710'   #完工入庫單
             #        WHEN '8'  LET g_errparam.code = 'asf-00711'   #FQC單
             #        WHEN '9'  LET g_errparam.code = 'asf-00712'   #委外採購單
             #        WHEN '10'  LET g_errparam.code = 'asf-00713'  #委外收貨單、驗退單、委外入庫、倉退單
             #        WHEN '11'  LET g_errparam.code = 'asf-00714'  #IQC單
             #   END CASE
             #   LET g_errparam.extend = g_sfaa_d[l_i].close_dd
             #   LET g_errparam.popup = TRUE
             #   CALL cl_err()
             #END IF
             IF NOT asfp500_close_dd_chk(g_sfaa_d[l_i].sfaadocno,g_sfaa_d[l_i].close_dd) THEN
                CONTINUE FOR        #180206-00004#1 add  跳过当前笔工单资料
             END IF
             #170517-00018#1-e
          END IF
          #170309-00051#1-e
          
          IF g_sfaa_d[l_i].sel = 'Y' AND NOT cl_null(g_sfaa_d[l_i].close_dd) THEN
             CALL s_asfp500_create_tmp() RETURNING l_success #171211-00028#16 add
             CALL s_transaction_begin()
             #CALL s_asfp500_close_wo(g_sfaa_d[l_i].sfaadocno,g_sfaa_d[l_i].close_dd,'N')              #160104-00009#1 mark
             CALL s_asfp500_close_wo(g_sfaa_d[l_i].sfaadocno,g_sfaa_d[l_i].close_dd,'N','asfp500')     #160104-00009#1 add
                  RETURNING l_success,l_err_tmp
             LET l_x = g_err_arr.getLength()
             LET l_y = l_err_tmp.getLength()
             FOR l_k = 1 TO l_y
                 LET g_err_arr[l_x + l_k].* = l_err_tmp[l_k].*
             END FOR
     
             #工单结案正确时,对应的委外PO也一并结案
             IF l_success = 'Y' THEN
                CALL asfp500_po_close(g_sfaa_d[l_i].sfaadocno)
                     RETURNING l_success1
                IF NOT l_success1 THEN
                   LET l_success = 'N'
                END IF
                
             END IF
             
             IF l_success = 'Y' THEN
                LET l_ok_cnt = l_ok_cnt + 1      
                CALL s_transaction_end('Y','0')
                LET g_flag = TRUE  #170302-00012#9   2017/03/24  By 08734 add
             ELSE
                CALL s_transaction_end('N','0')
                 
             END IF
             CALL s_asfp500_drop_tmp() #171211-00028#16 add
          END IF
      END FOR
      
      IF g_err_arr.getLength() > 0 THEN
         CALL asfp500_01(g_err_arr)
      END IF
      
      #170302-00012#9   2017/03/24  By 08734 add(S)
      IF g_flag = FALSE THEN
         #CALL s_transaction_end('N','0')
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.code = 'sub-00491'   #無資料產生
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN   
      END IF
      #170302-00012#9   2017/03/24  By 08734 add(E)
      
      LET l_nook_cnt = l_cnt - l_ok_cnt
      #成功结案笔数：%1  失败结案笔数：%2
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00214'
      LET g_errparam.extend = ''      
      #170222-00022#7-S
      LET g_err_collect = 0
      IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' AND l_ok_cnt > 0 THEN
         LET g_errparam.extend = cl_getmsg("wss-00228",g_lang) 
      END IF
      #170222-00022#7-E
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = l_ok_cnt 
      LET g_errparam.replace[2] =  l_nook_cnt
      CALL cl_err()
      LET g_press = FALSE  #170314-00079#1
      RETURN
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      IF year(lc_param.close_dd) =1899 THEN LET lc_param.close_dd=cl_get_current() END IF   #180410-00008#1 add 没有传入日期时，会将null自动转换成1899-12-31
     #170713-00009#1 add --(S)--
      #若是自動排程傳入josn參數,則將josn傳入的參數值設定給參數值
      IF NOT cl_null(lc_param.close_dd) THEN LET g_param.close_dd = lc_param.close_dd END IF
      IF NOT cl_null(lc_param.wc) THEN LET g_param.wc = lc_param.wc END IF    
      IF NOT cl_null(lc_param.auto) THEN LET g_param.auto = lc_param.auto END IF    
      IF cl_null(g_prog_flag) THEN LET g_prog_flag = g_prog END IF      
      #170713-00009#1 add --(E)--
      LET g_sql = " SELECT UNIQUE sfaadocno FROM sfaa_t ",
                  " WHERE sfaaent = ",g_enterprise,
                  "   AND sfaastus IN ('F') ",
                  "   AND sfaasite = '",g_site,"'",   #170713-00009#1 add
                  "   AND ",g_param.wc         
      PREPARE asfp500_p1 FROM g_sql
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'prepare asfp500_p1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET g_press = FALSE  #170314-00079#1
         RETURN
      END IF
      DECLARE asfp500_cs1 CURSOR FOR asfp500_p1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'prepare asfp500_cs1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET g_press = FALSE  #170314-00079#1
         RETURN
      END IF
      LET l_i = 1
      FOREACH asfp500_cs1 INTO l_sfaadocno[l_i]
          LET l_i = l_i + 1
      END FOREACH
      LET l_cnt = l_i - 1
      
      FOR l_i = 1 TO l_cnt
          CALL s_asfp500_create_tmp() RETURNING l_success #171211-00028#16 add
          
          CALL s_transaction_begin()
          #若传入的工单结案日期为空时,重新取一下工单合适的结案日期
          LET l_close_dd = g_param.close_dd    
          IF cl_null(g_param.close_dd) THEN     
             CALL s_asfp500_get_max_reference_date(l_sfaadocno[l_i])
                  RETURNING l_close_dd,l_flag     #160111-00024#1 --- add
                  #RETURNING l_close_dd           #160111-00024#1 --- mark
          END IF
          #CALL s_asfp500_close_wo(l_sfaadocno[l_i],l_close_dd,g_param.auto)             #160104-00009#1 mark
         #CALL s_asfp500_close_wo(l_sfaadocno[l_i],l_close_dd,g_param.auto,g_prog_flag)  #160104-00009#1 add   #170713-00009#1 mark
          #170713-00009#1 add --(S)--
          LET l_auto = g_param.auto
          IF cl_null(g_param.auto) THEN
             CALL s_aooi200_get_slip(l_sfaadocno[l_i]) RETURNING l_success,l_doc_type
             #若單據別自動結案=Y,才執行結案作業
             IF cl_get_doc_para(g_enterprise,g_site,l_doc_type,'D-MFG-0019') = 'Y' THEN 
                LET l_auto = 'Y'
             ELSE
                CONTINUE FOR
             END IF             
          END IF
          CALL s_asfp500_close_wo(l_sfaadocno[l_i],l_close_dd,l_auto,g_prog_flag)
          #170713-00009#1 add --(E)--          
               RETURNING l_success,l_err_tmp
          LET l_x = g_err_arr.getLength()
          LET l_y = l_err_tmp.getLength()
          FOR l_k = 1 TO l_y
              LET g_err_arr[l_x + l_k].* = l_err_tmp[l_k].*
          END FOR
          
          #工单结案正确时,对应的委外PO也一并结案
          IF l_success = 'Y' THEN
          #170111-00049#1-----dujuan------add------str---
             IF g_argv[5] = 'apmt571' THEN
               CALL asfp500_po_close(l_sfaadocno[l_i])
                     RETURNING l_success1
                IF NOT l_success1 THEN
                   LET l_success = 'N'
                END IF
             ELSE
           #170111-00049#1-----dujuan------add------end---
               #CALL asfp500_po_close(g_sfaa_d[l_i].sfaadocno)        #170713-00009#1 mark
                CALL asfp500_po_close(l_sfaadocno[l_i])               #170713-00009#1 add
                     RETURNING l_success1
                IF NOT l_success1 THEN
                   LET l_success = 'N'
                END IF
             END IF #170111-00049#1-----dujuan------add
          END IF
             
          IF l_success = 'Y' THEN             
             CALL s_transaction_end('Y','0')
          ELSE             
             CALL s_transaction_end('N','0')
          END IF
          CALL s_asfp500_drop_tmp()  #171211-00028#16 add
      END FOR
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL asfp500_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="asfp500.get_buffer" type="s" >}
PRIVATE FUNCTION asfp500_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.a = p_dialog.getFieldBuffer('a')
   LET g_master.d = p_dialog.getFieldBuffer('d')
   LET g_master.c = p_dialog.getFieldBuffer('c')
   LET g_master.b = p_dialog.getFieldBuffer('b')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asfp500.msgcentre_notify" type="s" >}
PRIVATE FUNCTION asfp500_msgcentre_notify()
 
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
 
{<section id="asfp500.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"
################################################################################
# Descriptions...: 查询功能
# Memo...........:
# Usage..........: CALL s_query()
#                       RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-03-21 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_query()
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   
   LET INT_FLAG = 0
   CLEAR FORM  
   CALL g_sfaa_d.clear()
   CALL g_sfba_d.clear()
   CALL g_sfcb_d.clear()
   CALL g_prog_d.clear()
   
   LET g_action_choice = 'c'
   LET ls_wc = g_param.wc   

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      CONSTRUCT g_param.wc ON sfaadocno,sfaa003,sfaa057,sfaa010,sfaa020,sfaa046,sfaastus,sfaa012,sfaa050, 
                              sfaa051,  sfaa055,sfaa056,sfaa013,sfaa009,sfaa017, sfaa002,sfaasite               
                              ,sfaa021  #170411-00095#2  add
           FROM s_detail1[1].sfaadocno,s_detail1[1].sfaa003, s_detail1[1].sfaa057,s_detail1[1].sfaa010,
                s_detail1[1].sfaa020,  
                s_detail1[1].sfaa046,    #20190110 add by yangtt
                s_detail1[1].sfaastus,s_detail1[1].sfaa012,s_detail1[1].sfaa050,
                s_detail1[1].sfaa051,  s_detail1[1].sfaa055, s_detail1[1].sfaa056,s_detail1[1].sfaa013,
                s_detail1[1].sfaa009,  s_detail1[1].sfaa017, s_detail1[1].sfaa002,s_detail1[1].sfaasite   
                ,s_detail1[1].sfaa021  #170411-00095#2  add
         #工单单号
         ON ACTION controlp INFIELD sfaadocno
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site            
            #170424-00053#1-s
            #LET g_qryparam.where = " sfaasite = '",g_site,"' "
            LET g_qryparam.where = " sfaasite = '",g_site,"' AND sfaastus = 'F' "
            #170424-00053#1-e
            CALL q_sfaadocno_2() 
            DISPLAY g_qryparam.return1 TO sfaadocno
            NEXT FIELD sfaadocno    

         #料件
         ON ACTION controlp INFIELD sfaa010
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaf001() 
            DISPLAY g_qryparam.return1 TO sfaa010
            NEXT FIELD sfaa010
            
         #单位
         ON ACTION controlp INFIELD sfaa013
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooca001() 
            DISPLAY g_qryparam.return1 TO sfaa013
            NEXT FIELD sfaa013

         #客户
         ON ACTION controlp INFIELD sfaa009
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_6() 
            DISPLAY g_qryparam.return1 TO sfaa009
            NEXT FIELD sfaa009

         #委外厂商
         ON ACTION controlp INFIELD sfaa017
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_3() 
            DISPLAY g_qryparam.return1 TO sfaa017
            NEXT FIELD sfaa017

         #生管人员
         ON ACTION controlp INFIELD sfaa002
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
           #CALL q_ooag001()                       #呼叫開窗      #mark by wanghaoz 2017/07/28 170703-00025#25 
            CALL q_ooag001_2()                       #呼叫開窗     #add by wanghaoz 2017/07/28 170703-00025#25
            DISPLAY g_qryparam.return1 TO sfaa002
            NEXT FIELD sfaa002
         #170411-00095#2-s
         #母公單單號
         ON ACTION controlp INFIELD sfaa021
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site            
            #170424-00053#1-s
            #LET g_qryparam.where = " sfaasite = '",g_site,"' AND sfaastus !='C' AND sfaastus !='X' AND sfaastus !='M' "   
            LET g_qryparam.where = " sfaasite = '",g_site,"' AND sfaastus = 'F' "
            #170424-00053#1-e
            CALL q_sfaa021() 
            DISPLAY g_qryparam.return1 TO sfaa021
            NEXT FIELD sfaa021
         #170411-00095#2-e   

      END CONSTRUCT
      #170220-00049#1 add---------s------------
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.a,g_master.d,g_master.c,g_master.b 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"

               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD a
            #add-point:BEFORE FIELD a name="input.b.a"

            #END add-point

         AFTER FIELD a
            
               IF g_master.a < 0 OR g_master.a > 100 THEN
                  #輸入值不在0-100之間(包括臨界值)！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aim-00011'
                  LET g_errparam.extend = g_master.a
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  DISPLAY BY NAME g_master.a
                  NEXT FIELD a
               END IF

            

         AFTER FIELD d
            
            #add-point:AFTER FIELD d name="input.a.d"
               IF g_master.d NOT MATCHES '[YN]' THEN
                  NEXT FIELD d
               END IF    

            #END add-point

 

         AFTER FIELD c
            
            #add-point:AFTER FIELD c name="input.a.c"
               IF g_master.c NOT MATCHES '[YN]' THEN
                  NEXT FIELD c
               END IF               

            #END add-point
            
 
         AFTER FIELD b
            
            #add-point:AFTER FIELD b name="input.a.b"
               IF g_master.b NOT MATCHES '[YN]' THEN
                  NEXT FIELD b
               END IF


            #END add-point
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"

               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"

            #end add-point
         END INPUT      
      
      #170220-00049#1 add---------e------------
      BEFORE DIALOG
         CALL cl_qbe_init() 
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG      

   END DIALOG

   IF INT_FLAG THEN
      RETURN
      LET g_param.wc = ls_wc
   END IF
   
   LET g_error_show = 1
#  CALL asfp500_b1_fill()  #170405-00042#1 mark
   CALL asfp500_b1_fill_new()  #170405-00042#1 add
   CALL asfp500_b2_fill()
   CALL asfp500_b3_fill()
   CALL asfp500_b4_fill()   
   IF g_rec_b1 = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = -100
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF

   LET INT_FLAG = FALSE
   
END FUNCTION
################################################################################
# Descriptions...: 工单单身fill
# Memo...........:
# Usage..........: CALL asfp500_b1_fill()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-03-24 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_b1_fill()
   DEFINE l_i            LIKE type_t.num5
   DEFINE l_unfinish_rt  LIKE type_t.num26_10
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_cnt          LIKE type_t.num10
   
   CALL g_sfaa_d.clear()
   
   IF cl_null(g_param.wc) THEN
      LET g_param.wc = ' 1 = 1'
   END IF
   
   LET g_sql = " SELECT 'N'    , sfaadocno, sfaa003, sfaa057, sfaa010, ''     , ''     , ",
               "        sfaa020, sfaa046,   sfaastus , sfaa012, sfaa050, sfaa051, sfaa055, sfaa056, ",  #20190110 add sfaa046 by yangtt
               "        0      , 0        , sfaa013, sfaa009, ''     , sfaa017, ''     , ",
               "        sfaa002, ''       , 'N'    , 'N'    , 'N'    , ''     ,sfaasite  ",
               "        ,sfaa021",     #170411-00095#2 add
               "   FROM sfaa_t a ",
               " WHERE sfaaent = ",g_enterprise,
               "   AND sfaastus IN ('F') ",
               "   AND sfaasite = '",g_site,"'",  
               "   AND ",g_param.wc

   #未完工量比率小于 a
   IF NOT cl_null(g_master.a) THEN
      #(生产数量-入库量)/生产数量* 100
      LET g_sql = g_sql CLIPPED,"  AND ((sfaa012 - sfaa050 ) / sfaa012 * 100 <= ",g_master.a,")"
   END IF  

   #发料未完成 -- 未完足套
   #实发数量 > 应发数量 * ( 1 - 允许差异率(发料) / 100)
   IF g_master.b = 'N' THEN
      LET g_sql = g_sql CLIPPED,"  AND NOT EXISTS(",
                                "  SELECT 1 FROM sfba_t b",
                                "   WHERE a.sfaaent = b.sfbaent AND a.sfaadocno = b.sfbadocno ",
                                "     AND b.sfba016 < b.sfba013 * ( 1 - sfba012 / 100 ) )"
   END IF

   #报工未完成
   IF g_master.c = 'N' THEN
      LET g_sql = g_sql CLIPPED,"  AND NOT EXISTS(",
                                "  SELECT 1 FROM sfcb_t c",
                                "   WHERE a.sfaaent = c.sfcbent AND a.sfaadocno = c.sfcbdocno ",
                                "     AND (sfcb046 > 0 OR sfcb047 > 0 OR sfcb048 > 0  OR ",
                                "          sfcb049 > 0 OR sfcb050 > 0 OR sfcb051 > 0 ))  "
   END IF

   LET g_sql = g_sql CLIPPED," ORDER BY sfaadocno"
   PREPARE asfp500_b1_fill_p1 FROM g_sql
   DECLARE asfp500_b1_fill_cs1 CURSOR FOR asfp500_b1_fill_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare asfp500_b1_fill_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF

   LET l_i = 1
   FOREACH asfp500_b1_fill_cs1 INTO g_sfaa_d[l_i].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF   
      
      #完工差異數diff_qty:生產數量sfaa012-入庫合格量sfaa050-入庫不合格量sfaa051-
      #                  下線量sfaa055-報廢量sfaa056
      IF cl_null(g_sfaa_d[l_i].sfaa012) THEN LET g_sfaa_d[l_i].sfaa012 = 0 END IF
      IF cl_null(g_sfaa_d[l_i].sfaa050) THEN LET g_sfaa_d[l_i].sfaa050 = 0 END IF      
      IF cl_null(g_sfaa_d[l_i].sfaa051) THEN LET g_sfaa_d[l_i].sfaa051 = 0 END IF      
      IF cl_null(g_sfaa_d[l_i].sfaa055) THEN LET g_sfaa_d[l_i].sfaa055 = 0 END IF      
      IF cl_null(g_sfaa_d[l_i].sfaa056) THEN LET g_sfaa_d[l_i].sfaa056 = 0 END IF      
      LET g_sfaa_d[l_i].diff_qty = g_sfaa_d[l_i].sfaa012 -  g_sfaa_d[l_i].sfaa050 -  g_sfaa_d[l_i].sfaa051 - 
                                   g_sfaa_d[l_i].sfaa055 -  g_sfaa_d[l_i].sfaa056

      #未完工比率 unfinish_rate = 完工差异数 / 生产数量 * 100
      LET g_sfaa_d[l_i].unfinish_rate = g_sfaa_d[l_i].diff_qty / g_sfaa_d[l_i].sfaa012 * 100

      ##未完工量比率小于 a
      #IF NOT cl_null(g_input_h.a) THEN
      #   #(生产数量-入库量)/生产数量* 100
      #   LET l_unfinish_rt = (g_sfaa_d[l_i].sfaa012 - g_sfaa_d[l_i].sfaa050 ) / g_sfaa_d[l_i].sfaa012 * 100
      #   IF l_unfinish_rt > g_input_h.a THEN
      #      CONTINUE FOREACH
      #   END IF
      #END IF  

      ##发料未完成 -- 未完足套
      ##实发数量 > 应发数量 * ( 1 - 允许差异率(发料) / 100)
      IF g_master.b = 'N' THEN
         LET g_sfaa_d[l_i].unfinish_b = 'N'
      ELSE
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt FROM sfba_t
          WHERE sfbaent   = g_enterprise
            AND sfbadocno = g_sfaa_d[l_i].sfaadocno
            AND sfba016 < sfba013 * ( 1 - sfba012 / 100)
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt > 0 THEN
            LET g_sfaa_d[l_i].unfinish_b = 'Y'
         ELSE
            LET g_sfaa_d[l_i].unfinish_b = 'N'
         END IF
      END IF
      
      #报工未完成
      IF g_master.c = 'N' THEN
         LET g_sfaa_d[l_i].unfinish_c = 'N'
      ELSE      
         LET l_cnt = 0 
         SELECT COUNT(*) INTO l_cnt FROM sfcb_t
          WHERE sfcbent = g_enterprise
            AND sfcbdocno = g_sfaa_d[l_i].sfaadocno
            AND (sfcb046 > 0 OR sfcb047 > 0 OR sfcb048 > 0  OR
                 sfcb049 > 0 OR sfcb050 > 0 OR sfcb051 > 0 )
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt > 0 THEN
            LET g_sfaa_d[l_i].unfinish_c = 'Y'
         ELSE
            LET g_sfaa_d[l_i].unfinish_c = 'N'
         END IF
      END IF
      
      #未完成单据
      CALL s_asfp500_unfinished_chk(g_sfaa_d[l_i].sfaadocno)
           RETURNING l_success      
      IF g_master.d = 'N' THEN
         IF l_success THEN
            CONTINUE FOREACH
         END IF
      ELSE
         IF l_success THEN
            LET g_sfaa_d[l_i].unfinish_d = 'Y'         
         ELSE
            LET g_sfaa_d[l_i].unfinish_d = 'N'         
         END IF
      END IF
      
      CALL s_desc_get_item_desc(g_sfaa_d[l_i].sfaa010)
           RETURNING g_sfaa_d[l_i].sfaa010_desc1,g_sfaa_d[l_i].sfaa010_desc2
           
      CALL s_desc_get_trading_partner_abbr_desc(g_sfaa_d[l_i].sfaa009)
           RETURNING g_sfaa_d[l_i].sfaa009_desc

      CALL s_desc_get_department_desc(g_sfaa_d[l_i].sfaa017)
           RETURNING g_sfaa_d[l_i].sfaa017_desc

      CALL s_desc_get_person_desc(g_sfaa_d[l_i].sfaa002)
           RETURNING g_sfaa_d[l_i].sfaa002_desc     
           
      LET l_i = l_i + 1
   
   END FOREACH
   
   CALL g_sfaa_d.deleteElement(l_i)
   LET g_rec_b1 = l_i - 1
   
   IF g_rec_b1 > 0 THEN
      LET l_ac = 1
   END IF
           
END FUNCTION
################################################################################
# Descriptions...: 备料未发全单身fill
# Memo...........:
# Usage..........: CALL asfp500_b2_fill()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-03-24 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_b2_fill()
   DEFINE l_i            LIKE type_t.num5
   
   CALL g_sfba_d.clear()
   
   IF l_ac <=0 THEN
      RETURN
   END IF
   
   LET g_sql = " SELECT sfbaseq, sfbaseq1, sfba006, '',      '', sfba002, '',     ",
               "        sfba003, '',       sfba004, sfba014, '', sfba023, sfba024, ",
               "        sfba013, sfba015,  sfba016, sfba025, 0,  sfba017, sfba018, ",
               "        sfba012   ",
               "   FROM sfba_t ",
               "  WHERE sfbaent   = ",g_enterprise,
               "    AND sfbadocno = '",g_sfaa_d[l_ac].sfaadocno,"'",
               "    AND sfba016   < sfba013 * ( 1 - sfba012 / 100 )",
               "    AND sfba008 IN ('1','2','3') ",
               "  ORDER BY sfbaseq,sfbaseq1 "

   PREPARE asfp500_b2_fill_p1 FROM g_sql
   DECLARE asfp500_b2_fill_cs1 CURSOR FOR asfp500_b2_fill_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare asfp500_b2_fill_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF

   LET l_i = 1
   FOREACH asfp500_b2_fill_cs1 INTO g_sfba_d[l_i].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF   

      CALL s_desc_get_item_desc(g_sfba_d[l_i].sfba006)
           RETURNING g_sfba_d[l_i].sfba006_desc1,g_sfba_d[l_i].sfba006_desc2

      #部位说明
      CALL s_desc_get_acc_desc('215',g_sfba_d[l_i].sfba002)
           RETURNING g_sfba_d[l_i].sfba002_desc

      #作业说明
      CALL s_desc_get_acc_desc('221',g_sfba_d[l_i].sfba003)      
           RETURNING g_sfba_d[l_i].sfba003_desc

      #单位说明
      CALL s_desc_get_unit_desc(g_sfba_d[l_i].sfba014)
           RETURNING g_sfba_d[l_i].sfba014_desc
           
      #未发数量
      LET g_sfba_d[l_i].unissue_qty =  g_sfba_d[l_i].sfba013 - g_sfba_d[l_i].sfba016
      LET l_i = l_i + 1
   
   END FOREACH
   LET g_rec_b2 = l_i - 1   
   CALL g_sfba_d.deleteElement(l_i)
END FUNCTION
################################################################################
# Descriptions...: 填充未报工明细单身
# Memo...........:
# Usage..........: CALL asfp500_b3_fill()
# Input parameter: 
# Return code....: 
# Date & Author..: 日期 By 作者
# Modify.........: #180111-00043#27 mod
################################################################################
PRIVATE FUNCTION asfp500_b3_fill()
   DEFINE l_i            LIKE type_t.num5
   
   CALL g_sfcb_d.clear()
   
   IF l_ac <=0 THEN
      RETURN
   END IF

   LET g_sql = " SELECT sfcb001, sfcb002, sfcb003, sfcb004, sfcb046, sfcb047,",
               "        sfcb050, sfcb048, sfcb049, sfcb051",
               "   FROM sfcb_t ",
               "  WHERE sfcbent   = ",g_enterprise,
               "    AND sfcbdocno = '",g_sfaa_d[l_ac].sfaadocno,"'",
               "    AND (sfcb046 > 0 OR sfcb047 > 0 OR sfcb048 > 0 OR ",
               "         sfcb049 > 0 OR sfcb050 > 0 OR sfcb051 > 0 )  ",
               "  ORDER BY sfcb001, sfcb002 "

   PREPARE asfp500_b3_fill_p1 FROM g_sql
   DECLARE asfp500_b3_fill_cs1 CURSOR FOR asfp500_b3_fill_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare asfp500_b3_fill_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF

   LET l_i = 1
   FOREACH asfp500_b3_fill_cs1 INTO g_sfcb_d[l_i].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF   
       
      LET l_i = l_i + 1
   
   END FOREACH
   LET g_rec_b3 = l_i - 1   
   CALL g_sfcb_d.deleteElement(l_i)
   
END FUNCTION
################################################################################
# Descriptions...: 未完成单据单身fill
# Memo...........:
# Usage..........: CALL asfp500_b4_fill()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-03-24 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_b4_fill()
   DEFINE l_i            LIKE type_t.num5
   DEFINE l_success      LIKE type_t.chr1
   DEFINE l_cnt          LIKE type_t.num5
   
   CALL g_prog_d.clear()
   
   IF l_ac <=0 THEN
      RETURN
   END IF
   
   CALL s_asfp500_unfinished_reference(g_sfaa_d[l_ac].sfaadocno,'','1')
        RETURNING l_success,l_cnt,g_prog_d
   LET g_rec_b4 = l_cnt       
END FUNCTION
################################################################################
# Descriptions...: 全选
# Memo...........:
# Usage..........: CALL asfp500_sel_all(p_flag)
#                       RETURNING NULL
# Input parameter: p_flag         Y/N
# Return code....: NULL
# Date & Author..: 2014-03-24 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_sel_all(p_flag)
   DEFINE p_flag         LIKE type_t.chr1
   DEFINE l_i            LIKE type_t.num5
   DEFINE l_date         LIKE type_t.dat
   DEFINE l_flag         LIKE type_t.chr1   #160111-00024#1 By Ann_Huang --- add
   
   FOR l_i = 1 TO g_sfaa_d.getLength()
       LET g_sfaa_d[l_i].sel = p_flag
       IF p_flag = 'Y' THEN
          CALL s_asfp500_get_max_reference_date(g_sfaa_d[l_i].sfaadocno)
               RETURNING l_date,l_flag      #160111-00024#1 --- add
               #RETURNING l_date            #160111-00024#1 --- mark     
          IF cl_null(g_sfaa_d[l_i].close_dd) OR g_sfaa_d[l_i].close_dd < l_date THEN
             LET g_sfaa_d[l_i].close_dd = l_date
          END IF 
       ELSE
          LET g_sfaa_d[l_i].close_dd = NULL
       END IF
   END FOR
END FUNCTION

################################################################################
# Descriptions...: 批次错误显示
# Memo...........:
# Usage..........: CALL asfp500_show_err()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-04-08
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_show_err()

END FUNCTION

################################################################################
# Descriptions...: 二次过滤
# Memo...........:
# Usage..........: CALL asfp500_filter()
#                  RETURNING NULL
# Input parameter: NULL
# Return code....: NULL
# Date & Author..: 2014-04-10 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_filter()
   DEFINE l_filter_wc    STRING

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      CONSTRUCT l_filter_wc ON sfaadocno,sfaa003,sfaa057,sfaa010,sfaa020,sfaastus,sfaa012,sfaa050,      
                               sfaa051,  sfaa055,sfaa056,sfaa013,sfaa009,sfaa017, sfaa002,sfaasite
                               ,sfaa021         #170411-00095#2  add
           FROM s_detail1[1].sfaadocno,s_detail1[1].sfaa003, s_detail1[1].sfaa057,s_detail1[1].sfaa010,
                s_detail1[1].sfaa020,  s_detail1[1].sfaastus,s_detail1[1].sfaa012,s_detail1[1].sfaa050,
                s_detail1[1].sfaa051,  s_detail1[1].sfaa055, s_detail1[1].sfaa056,s_detail1[1].sfaa013,
                s_detail1[1].sfaa009,  s_detail1[1].sfaa017, s_detail1[1].sfaa002,s_detail1[1].sfaasite   
                ,s_detail1[1].sfaa021           #170411-00095#2  add
         #工单单号
         ON ACTION controlp INFIELD sfaadocno
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            #170424-00053#1-s
            #LET g_qryparam.where = " sfaasite = '",g_site,"' "
            LET g_qryparam.where = " sfaasite = '",g_site,"' AND sfaastus = 'F' "
            #170424-00053#1-e
            CALL q_sfaadocno_2() 
            DISPLAY g_qryparam.return1 TO sfaadocno
            NEXT FIELD sfaadocno    

         #料件
         ON ACTION controlp INFIELD sfaa010
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaf001() 
            DISPLAY g_qryparam.return1 TO sfaa010
            NEXT FIELD sfaa010
            
         #单位
         ON ACTION controlp INFIELD sfaa013
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooca001() 
            DISPLAY g_qryparam.return1 TO sfaa013
            NEXT FIELD sfaa013

         #客户
         ON ACTION controlp INFIELD sfaa009
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_6() 
            DISPLAY g_qryparam.return1 TO sfaa009
            NEXT FIELD sfaa009

         #委外厂商
         ON ACTION controlp INFIELD sfaa017
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_3() 
            DISPLAY g_qryparam.return1 TO sfaa017
            NEXT FIELD sfaa017

         #生管人员
         ON ACTION controlp INFIELD sfaa002
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
           #CALL q_ooag001()                       #呼叫開窗      #mark by wanghaoz 2017/07/28 170703-00025#25 
            CALL q_ooag001_2()                       #呼叫開窗     #add by wanghaoz 2017/07/28 170703-00025#25 
            DISPLAY g_qryparam.return1 TO sfaa002
            NEXT FIELD sfaa002
          
         #170411-00095#2-s 
         #母工單單號
         ON ACTION controlp INFIELD sfaa021
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            #170424-00053#1-s
            #LET g_qryparam.where = " sfaasite = '",g_site,"' AND sfaastus = 'N' "            
            LET g_qryparam.where = " sfaasite = '",g_site,"' AND sfaastus = 'F' "
            #170424-00053#1-e
            CALL q_sfaa021() 
            DISPLAY g_qryparam.return1 TO sfaa021
            NEXT FIELD sfaa021   
         #170411-00095#2-e   

      END CONSTRUCT
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG      

   END DIALOG
   
   LET g_param.wc = g_param.wc CLIPPED,' AND ',l_filter_wc
#  CALL asfp500_b1_fill()  #170405-00042#1 mark
   CALL asfp500_b1_fill_new()  #170405-00042#1 add
   CALL asfp500_b2_fill()
   CALL asfp500_b3_fill()
   CALL asfp500_b4_fill()      
END FUNCTION

################################################################################
# Descriptions...: 請購單結案  -- 抄apmp510
# Memo...........: 請購單多角單據結案作業
# Usage..........: CALL asfp500_aic_closed(p_type,p_pmdnseq,p_pmdn051,p_pmdl031,p_pmdl051)
# Input parameter: p_type         狀態 1.結案 2取消結案
#                : p_pmdnseq      請購單項次
#                : p_pmdn051      結案理由碼
#                : p_pmdl031      多角來源單號
#                : p_pmdn050      多角流程式碼
# Return code....:
# Date & Author..: 2015-06-08  By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_aic_closed(p_type,p_pmdnseq,p_pmdn051,p_pmdl031,p_pmdl051)
   DEFINE p_type      LIKE type_t.num5          #型態1結案；2取消結案
   DEFINE p_pmdnseq   LIKE pmdn_t.pmdnseq       #請購單項次
   DEFINE p_pmdn051   LIKE pmdn_t.pmdn051       #結案理由碼
   DEFINE p_pmdl031   LIKE pmdl_t.pmdl031       #多角來源單號
   DEFINE p_pmdl051   LIKE pmdl_t.pmdl051       #多角流程代碼
   DEFINE l_icab003   LIKE icab_t.icab003       #多角營運據點
   DEFINE l_pmdldocno LIKE pmdl_t.pmdldocno     #採購單單號
   DEFINE l_sfaadocno LIKE sfaa_t.sfaadocno     #工單單號
   DEFINE l_xmdadocno LIKE xmda_t.xmdadocno     #訂單單號
   DEFINE l_sql       STRING
   DEFINE l_success   LIKE type_t.num5


   LET l_sql = "SELECT icab003 ",
               "  FROM icaa_t,icab_t ",
               " WHERE icaaent = '",g_enterprise,"' " ,
               "   AND icaaent = icabent ", #181001-00015#79 add 
               "   AND icaasite = '",g_site,"' " ,
               "   AND icaa001 = '",p_pmdl051,"' " ,
               "   AND icaa001 = icab001 "

   PREPARE s_asfp500_sel_pr_aic FROM l_sql
   DECLARE s_asfp500_sel_cs_aic CURSOR FOR s_asfp500_sel_pr_aic

   #各站營運據點依多角流程序號取得各站 請購單/採購單/工單 單號做結案
   FOREACH s_asfp500_sel_cs_aic INTO l_icab003
      #訂單單號
      LET l_xmdadocno = ''
      SELECT xmdadocno INTO l_xmdadocno
        FROM xmda_t
       WHERE xmdaent = g_enterprise
         AND xmdasite = l_icab003
         AND xmda031 = p_xmda031
      IF NOT cl_null(l_xmdadocno) THEN
         IF p_type = 1 THEN
            #結案
            IF NOT p_pmdnseq > 0 THEN
               CALL s_axmp510_xmdc045_closed('2',l_xmdadocno,p_pmdnseq,p_pmdl051,l_icab003) RETURNING l_success
            ELSE
               CALL s_axmp510_xmda045_closed(l_xmdadocno,l_icab003) RETURNING l_success
               CALL s_axmp510_xmda046_closed(l_xmdadocno,l_icab003) RETURNING l_success
               CALL s_axmp510_xmda047_closed(l_xmdadocno,l_icab003) RETURNING l_success
               CALL s_axmp510_xmdastus_closed('2',l_xmdadocno,l_icab003) RETURNING l_success
            END IF
         ELSE
            #取消結案
            IF NOT p_pmdnseq > 0 THEN
               CALL s_axmp510_xmdc045_unclosed(l_xmdadocno,p_pmdnseq,l_icab003) RETURNING l_success
            ELSE
               CALL s_axmp510_xmda045_unclosed(l_xmdadocno,l_icab003) RETURNING l_success
            END IF
         END IF
      END IF

      #採購單單號
      LET l_pmdldocno = ''
      SELECT pmdldocno INTO l_pmdldocno
        FROM pmdl_t
       WHERE pmdlent = g_enterprise
         AND pmdlsite = l_icab003
         AND pmdl031 = p_pmdl031
      IF NOT cl_null(l_pmdldocno) THEN
         IF p_type = 1 THEN
            #結案
            IF NOT p_pmdnseq > 0 THEN
               CALL s_apmp510_pmdn045_closed('2',l_pmdldocno,p_pmdnseq,p_pmdn051,l_icab003) RETURNING l_success
            ELSE
               CALL s_apmp510_pmdl047_closed(l_pmdldocno,l_icab003) RETURNING l_success
               CALL s_apmp510_pmdl048_closed(l_pmdldocno,l_icab003) RETURNING l_success
               CALL s_apmp510_pmdl049_closed(l_pmdldocno,l_icab003) RETURNING l_success
               CALL s_apmp510_pmdlstus_closed('2',l_pmdldocno,l_icab003) RETURNING l_success
            END IF
         ELSE
            #取消結案
            IF NOT p_pmdnseq > 0 THEN
               CALL s_apmp510_pmdn045_unclosed(l_pmdldocno,p_pmdnseq,l_icab003) RETURNING l_success
            ELSE
               CALL s_apmp510_pmdl047_unclosed(l_pmdldocno,l_icab003) RETURNING l_success
            END IF
         END IF
      END IF


   END FOREACH
                  
END FUNCTION

################################################################################
# Descriptions...: 工单对应的委外采购单结案
# Memo...........:
# Usage..........: CALL asfp500_po_close(p_sfaadocno)
#                       RETURNING r_success
# Input parameter: p_sfaadocno    工单单号
# Return code....: r_success      成功否标识符
# Date & Author..: 2015-06-09 By Carrier
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_po_close(p_sfaadocno)
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
   DEFINE l_cnt            LIKE type_t.num10   #190628-00024#1 by 02159 add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   
   LET l_flag = 'Y'
   FOREACH asfp500_sel_po_cs USING p_sfaadocno
                              INTO l_pmdndocno,l_pmdnseq,l_pmdl006,l_pmdl031,l_pmdl051,l_pmdlsite,
                                   l_pmdlstus,l_pmdlcrtid,l_pmdlcrtdp,l_pmdldocdt
       
       IF l_pmdlstus = 'C' THEN CONTINUE FOREACH END IF  #160128-00022 by whitney add
       
       #單身狀態結案
       IF NOT s_apmp510_pmdn045_closed('2',l_pmdndocno,l_pmdnseq,'',l_pmdlsite) THEN
          LET l_flag = 'N'
       #ELSE
       #   #多角結案(單身狀態)
       #   IF l_pmdl006 = '2' AND NOT cl_null(l_pmdl031) THEN                      #多角結案
       #      CALL asfp500_aic_closed('1',l_pmdnseq,'',l_pmdl031,l_pmdl051)
       #      LET l_flag = 'N'
       #   END IF
       END IF
      
      #180625-00034#1 mark --s--
      ##物流結案
      #IF NOT s_apmp510_pmdl047_closed(l_pmdndocno,l_pmdlsite) THEN
      #   LET l_flag = 'N'
      #END IF

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
      #180625-00034#1 mark --s--
       ##多角結案(物流、帳流、金流、狀態)
       #IF l_pmdl006 = '2' AND NOT cl_null(l_pmdl031) THEN
       #   CALL asfp500_aic_closed('1',0,'',l_pmdl031,l_pmdl051)
       #END IF                    
    
       IF l_flag = 'N' THEN
          LET l_x = g_err_arr.getLength()
          LET g_err_arr[l_x+1].sdocno = p_sfaadocno
          LET g_err_arr[l_x+1].prog  = 'apmt501'
          LET g_err_arr[l_x+1].docno = l_pmdndocno
          LET g_err_arr[l_x+1].stus  = l_pmdlstus
          LET g_err_arr[l_x+1].crtid = l_pmdlcrtid
          LET g_err_arr[l_x+1].crtdp = l_pmdlcrtdp
          LET g_err_arr[l_x+1].errno = 'asf-00690'
          LET g_err_arr[l_x+1].opendd= l_pmdldocdt
          LET g_err_arr[l_x+1].postdd= ''
          CALL s_desc_get_prog_desc(g_err_arr[l_x+1].prog)
               RETURNING g_err_arr[l_x+1].prog_desc
          CALL s_desc_get_person_desc(g_err_arr[l_x+1].crtid)
               RETURNING g_err_arr[l_x+1].crtid_desc
          CALL s_desc_get_department_desc(g_err_arr[l_x+1].crtdp)
               RETURNING g_err_arr[l_x+1].crtdp_desc                  
          CALL s_desc_get_error_desc(g_err_arr[l_x+1].errno)
               RETURNING g_err_arr[l_x+1].err_desc
       END IF
   END FOREACH   

  #180625-00034#1 add --s--
   FOREACH asfp500_sel_po1_cs USING p_sfaadocno
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

      #190628-00024#1 by 02159 add(S)
      LET l_cnt = 0
      SELECT COUNT(pmdndocno) INTO l_cnt
      FROM pmdn_t
      WHERE pmdnent = g_enterprise
        AND pmdndocno = l_pmdndocno
        AND pmdn045 NOT IN ('2','3','4')   #2:正常結案、3:長結案、4:短結案
      IF l_cnt > 0 THEN
         CONTINUE FOREACH
      END IF
      #190628-00024#1 by 02159 add(E)

      #物流結案
      IF NOT s_apmp510_pmdl047_closed(l_pmdndocno,l_pmdlsite) THEN
         LET l_flag = 'N'
      END IF

      #帳流結案
      IF NOT s_apmp510_pmdl048_closed(l_pmdndocno,g_site) THEN
         #LET l_flag = 'N'    #190628-00024#1 by 02159 mark
      END IF
            #金流結案
      IF NOT s_apmp510_pmdl049_closed(l_pmdndocno,g_site) THEN
         #LET l_flag = 'N'    #190628-00024#1 by 02159 mark
      END IF
      #狀態結案
      IF NOT s_apmp510_pmdlstus_closed('2',l_pmdndocno,g_site) THEN
         LET l_flag = 'N'
      END IF

      IF l_flag = 'N' THEN
         LET l_x = g_err_arr.getLength()
         LET g_err_arr[l_x+1].sdocno = p_sfaadocno
         LET g_err_arr[l_x+1].prog  = 'apmt501'
         LET g_err_arr[l_x+1].docno = l_pmdndocno
         LET g_err_arr[l_x+1].stus  = l_pmdlstus
         LET g_err_arr[l_x+1].crtid = l_pmdlcrtid
         LET g_err_arr[l_x+1].crtdp = l_pmdlcrtdp
         LET g_err_arr[l_x+1].errno = 'asf-00690'
         LET g_err_arr[l_x+1].opendd= l_pmdldocdt
         LET g_err_arr[l_x+1].postdd= ''
                  CALL s_desc_get_prog_desc(g_err_arr[l_x+1].prog)
              RETURNING g_err_arr[l_x+1].prog_desc
         CALL s_desc_get_person_desc(g_err_arr[l_x+1].crtid)
              RETURNING g_err_arr[l_x+1].crtid_desc
         CALL s_desc_get_department_desc(g_err_arr[l_x+1].crtdp)
              RETURNING g_err_arr[l_x+1].crtdp_desc
         CALL s_desc_get_error_desc(g_err_arr[l_x+1].errno)
              RETURNING g_err_arr[l_x+1].err_desc
      END IF
   END FOREACH
  #180625-00034#1 add --e--
  
   IF l_flag = 'N' THEN
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 判斷工單是否可結案
# Memo...........: 151229-00004#1 add by tsungyung
# Usage..........: CALL asfp500_close_yn(p_docno)
#                  RETURNING l_yn
# Input parameter: p_docno   傳入工單單號
# Return code....: l_yn   回傳結案否 (Y/N)
# Date & Author..: 2015/12/29 By tsungyung
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_close_yn(p_docno)
DEFINE p_docno       LIKE sfaa_t.sfaadocno   #傳入工單單號
DEFINE l_pmdt020_rc  LIKE pmdt_t.pmdt020     #收貨單收貨量
DEFINE l_pmdt020_wh  LIKE pmdt_t.pmdt020     #入庫單入庫量
DEFINE l_pmdt020_re  LIKE pmdt_t.pmdt020     #驗退單驗退量  #170223-00033#1 add
DEFINE l_yn          LIKE type_t.chr1        #回傳結案否 (Y/N)
DEFINE l_pmdldocno   LIKE pmdl_t.pmdldocno   #採購單單號
#180111-00032#1 add----s------
DEFINE l_sql         STRING     
DEFINE l_pmdpseq     LIKE pmdp_t.pmdpseq
#180111-00032#1 add-----e-----
DEFINE l_set         LIKE sfaa_t.sfaa050     #181024-00017#4 add

   LET l_pmdt020_rc = 0
   LET l_pmdt020_wh = 0
   LET l_yn = 'Y' 
#180111-00032#1 mark-------s------   
#   SELECT pmdldocno INTO l_pmdldocno
#     FROM pmdl_t
#    WHERE pmdlent = g_enterprise
#      AND pmdl008 = p_docno
#      AND pmdl007 = '4'   #工單
#180111-00032#1 mark-----e--------
#180111-00032#1 add-------s------ 
   LET l_sql="SELECT pmdldocno,pmdpseq FROM pmdl_t LEFT JOIN pmdp_t ON pmdlent=pmdpent AND pmdldocno=pmdpdocno  ",
             " WHERE pmdlent=",g_enterprise,
             " AND pmdp003='",p_docno,"'"
   PREPARE asfp500_close_yn_p FROM l_sql
   DECLARE asfp500_close_yn_cs CURSOR FOR asfp500_close_yn_p 
   FOREACH asfp500_close_yn_cs INTO l_pmdldocno,l_pmdpseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_yn='N'
         EXIT FOREACH
      END IF         
#180111-00032#1 add-------e------    
      SELECT SUM(pmdt020) INTO l_pmdt020_rc 
        FROM pmdt_t,pmds_t
       WHERE pmdsent = pmdtent
         AND pmdsdocno = pmdtdocno
         AND pmds000 = '8'           #收貨單
         AND pmdt001 = l_pmdldocno   #採購單單號
         AND pmdt002 =l_pmdpseq      #180111-00032#1 add
         AND pmdsstus <> 'X' 
         AND pmdtent = g_enterprise
         
      SELECT SUM(pmdt020) INTO l_pmdt020_wh 
        FROM pmdt_t,pmds_t
       WHERE pmdsent = pmdtent
         AND pmdsdocno = pmdtdocno
         AND pmds000 = '12'          #入庫單
         AND pmdt001 = l_pmdldocno   #採購單單號
         AND pmdt002 =l_pmdpseq      #180111-00032#1 add
         AND pmdsstus <> 'X' 
         AND pmdtent = g_enterprise   
   
      #170223-00033#1 add --(S)--
      SELECT SUM(pmdt020) INTO l_pmdt020_re
        FROM pmdt_t,pmds_t
       WHERE pmdsent = pmdtent
         AND pmdsdocno = pmdtdocno
         AND pmds000 = '10'          #驗退單
         AND pmdt001 = l_pmdldocno   #採購單單號
         AND pmdt002 =l_pmdpseq      #180111-00032#1 add
         AND pmdsstus <> 'X' 
         AND pmdtent = g_enterprise  
      #170223-00033#1 add --(E)--   
      
      IF cl_null(l_pmdt020_rc) THEN LET l_pmdt020_rc = 0 END IF
      IF cl_null(l_pmdt020_wh) THEN LET l_pmdt020_wh = 0 END IF
      IF cl_null(l_pmdt020_re) THEN LET l_pmdt020_re = 0 END IF  #170223-00033#1 add
      
     #IF l_pmdt020_rc <> l_pmdt020_wh THEN                 #170223-00033#1 mark
      IF l_pmdt020_rc <> (l_pmdt020_wh+l_pmdt020_re) THEN  #170223-00033#1 add
         LET l_yn = 'N'
      END IF
   #180111-00032#1 add----s----
      IF l_yn='N' THEN 
         RETURN l_yn
      END IF
   END FOREACH    
   #180111-00032#1 add----e----
   RETURN l_yn
   
END FUNCTION
#170405-00042#1 add
PRIVATE FUNCTION asfp500_b1_fill_new()
 DEFINE l_i            LIKE type_t.num5
   DEFINE l_unfinish_rt  LIKE type_t.num26_10
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_cnt          LIKE type_t.num10
   DEFINE l_set          LIKE sfaa_t.sfaa050   #181024-00017#4 add
   
   CALL g_sfaa_d.clear()
   
   #181127-00023#1 add-s
   LET g_sql = "SELECT MAX((sfac003-sfac005)/sfac003*100) FROM sfac_t",
               " WHERE sfacent = ? AND sfacdocno = ?"
   PREPARE asfp500_sfac005_p FROM g_sql
   #181127-00023#1 add-e   
   
   IF cl_null(g_param.wc) THEN
      LET g_param.wc = ' 1 = 1'
   END IF
   
   LET g_sql = " SELECT 'N'    , sfaadocno, sfaa003, sfaa057, sfaa010,",#     , ''     , ",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent = sfaaent AND imaal001 = sfaa010 AND imaal002 = '",g_dlang,"'),",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent = sfaaent AND imaal001 = sfaa010 AND imaal002 = '",g_dlang,"'),",
               "        sfaa020, sfaa046,   sfaastus , sfaa012, sfaa050, sfaa051, sfaa055, sfaa056, ",    #20190110 add sfaa046 by yangtt
               "        0      , 0        , sfaa013, sfaa009, ",
               "        (SELECT pmaal004 FROM pmaal_t WHERE pmaalent = sfaaent AND pmaal001 = sfaa009 AND pmaal002 = '",g_dlang,"'),",
               "        sfaa017, ",
               "        (SELECT ooefl003 FROM ooefl_t WHERE ooeflent = sfaaent AND ooefl001 = sfaa017 AND ooefl002 = '",g_dlang,"'), ",
               "        sfaa002, ",
               "        (SELECT ooag011 FROM ooag_t WHERE ooagent = sfaaent AND ooag001 = sfaa002),"
               
   IF g_master.b = 'N' THEN
      LET g_sql = g_sql,"'N',"
   ELSE
      #LET g_sql = g_sql,"CASE WHEN (SELECT NVL(COUNT(1),0) FROM sfba_t WHERE sfbaent = sfaaent AND sfbadocno = sfaadocno AND sfba016 < sfba013 * ( 1 - sfba012 / 100)) > 0 THEN ",  #180928-00017#1 mark
      LET g_sql = g_sql,"CASE WHEN (SELECT NVL(COUNT(1),0) FROM sfba_t WHERE sfbaent = sfaaent AND sfbadocno = sfaadocno AND sfba016 < sfba013 * ( 1 - sfba012 / 100) AND sfba008 <>'4' ) > 0 THEN ",  #180928-00017#1
                  "      'Y' ELSE 'N' END,"
   END IF
   
   IF g_master.c = 'N' THEN
      LET g_sql = g_sql,"'N',"
   ELSE      
      LET g_sql = g_sql,"CASE WHEN (SELECT NVL(COUNT(1),0) FROM sfcb_t WHERE sfcbent = sfaaent AND sfcbdocno = sfaadocno ",
                        "              AND (sfcb046 > 0 OR sfcb047 > 0 OR sfcb048 > 0  OR  sfcb049 > 0 OR sfcb050 > 0 OR sfcb051 > 0 )) > 0 THEN ",
                        "      'Y' ELSE 'N' END,"
   END IF 
   

   LET g_sql = g_sql,"CASE WHEN ( ",
                       #1.发料单/退料单(sfdadocno):工单存在sfdb001、sfdc001，状态不等于作废或过账的都显示
                       "  (SELECT NVL(COUNT(1),0) FROM sfda_t,sfdc_t WHERE sfdaent = sfdcent AND sfdaent = sfaaent AND sfdadocno = sfdcdocno AND sfdc001 = sfaadocno AND sfdastus <> 'X' AND sfdastus <> 'S') + ",
                       #2.报工单(sffbdocno):工单存在sffb005,状态不等于已确认或已作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM sffb_t  WHERE sffbent = sfaaent AND sffb005 = sfaadocno AND sffbstus <> 'X' AND sffbstus <> 'Y') + ",
                       #3.当站报废(sfgadocno):工单存在sfga004，状态不等于过账或作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM sfga_t  WHERE sfgaent = sfaaent AND sfga004 = sfaadocno AND sfgastus <> 'X' AND sfgastus <> 'S') + ",
                       #4.当站下线(sfhadocno):工单存在sfha004，状态不等于过账或作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM sfha_t  WHERE sfhaent = sfaaent AND sfha004 = sfaadocno AND sfhastus <> 'X' AND sfhastus <> 'S') + ",
                       #5.重工转出单(sfiadoccno):工单存在sfia003，状态不等于确认或作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM sfia_t  WHERE sfiaent = sfaaent AND sfia003 = sfaadocno AND sfiastus <> 'X' AND sfiastus <> 'Y') + ",
                       #6.下阶料报废(sfjadocno):工单存在sfjb001，状态不等于已过账、已作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM sfja_t,sfjb_t WHERE sfjaent = sfjbent AND sfjaent = sfaaent AND sfjadocno = sfjbdocno AND sfjb001 = sfaadocno AND sfjastus <> 'X' AND sfjastus <> 'S') + ",
                       #7.完工入库单(sfeadocno):工单存在sfeb001，状态不等于己过账、已作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM sfea_t,sfeb_t WHERE sfeaent = sfebent AND sfeaent = sfaaent AND sfeadocno = sfebdocno AND sfeb001 = sfaadocno AND sfeastus <> 'X' AND sfeastus <> 'S') + ",
                       #8.FQC(qbadocno):用QC单上的来源单号qcba003找完工入库单sfebdocno,
                       #如果QC单状态不等于已确认、已作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM qcba_t  WHERE qcbaent = sfaaent AND qcba003 = sfaadocno AND qcbastus <> 'X' AND qcbastus <> 'Y') + ",
                       #9. 委外采购单(pmdldocno):工单存在pmdp003，状态不等于确认的数据
                       "  (SELECT NVL(COUNT(1),0) FROM pmdl_t,pmdp_t WHERE pmdlent = pmdpent AND pmdlent = sfaaent AND pmdldocno = pmdpdocno AND pmdp003 = sfaadocno AND pmdlstus NOT IN ('X','Y','C')) + ",
                       #10.委外收货单、验退(pmdsdocno):工单存在pmdv014，状态不等于确认、作废的数据
                       "  (SELECT NVL(COUNT(1),0) FROM pmds_t,pmdv_t WHERE pmdsent = pmdvent AND pmdsent = sfaaent AND pmdsdocno = pmdvdocno AND pmdv014 = sfaadocno AND pmdsstus <> 'X' AND pmdsstus <> 'Y' AND pmds000 IN ('1','5')) + ",
                       #11.委外入库单、仓退单(pmdsdocno):工单存在pmdv014，状态不等于过帐、作废的数据
                       "  (SELECT NVL(COUNT(1),0) FROM pmds_t,pmdv_t WHERE pmdsent = pmdvent AND pmdsent = sfaaent AND pmdsdocno = pmdvdocno AND pmdv014 = sfaadocno AND pmdsstus <> 'X' AND pmdsstus <> 'S' AND pmds000 IN ('3','6','7')) + ",
                       #12.IQC(qbadocno):用QC单上的来源单号qcba001、项次qcba002，找委外收货单对内的工单pmdv014，如果QC单状态不等于已确认、已作废的数据都显示
                       "  (SELECT NVL(COUNT(1),0) FROM qcba_t,pmdv_t WHERE qcbaent = pmdvent AND qcbaent = sfaaent AND qcba001 = pmdvdocno AND qcba002 = pmdvseq AND pmdv014 = sfaadocno AND qcbastus <> 'X' AND qcbastus <> 'Y') + ",
                       #13.工单变更单不是审核,作废的单据(sfkadocno) #170509-00087#1 add
                       "  (SELECT NVL(COUNT(1),0) FROM sfka_t,sfkg_t WHERE sfkaent = sfkgent AND sfkaent = sfaaent AND sfkadocno = sfkgdocno AND sfkadocno = sfaadocno AND sfkastus NOT IN ('X','Y')))", #170509-00087#1 add
                       " > 0 THEN 'Y' ELSE 'N' END,",
                       "'' ,sfaasite",
                       "   ,sfaa021",     #170411-00095#2 add
                       "   FROM sfaa_t a  ",
                       #181024-00017#4 add --s
                       #拆件式工單的未完工比率要用實際產出數量(sfac005)與預計產出數量(sfac003)的比率,所以要多串sfac_t
                      #"   LEFT OUTER JOIN (SELECT sfacent,sfacdocno,SUM(sfac003) sfac003,SUM(sfac005) sfac005",         #181127-00023#1 mark
                      #"   LEFT OUTER JOIN (SELECT sfacent,sfacdocno,sfac002,MAX((sfac003-sfac005)/sfac003*100) ratio",  #181127-00023#1 add                                      #181207-00039#1 mark
                       "   LEFT OUTER JOIN (SELECT sfacent,sfacdocno,sfac002,MAX(CASE WHEN sfac003=0 THEN 0 ELSE (sfac003-sfac005)/sfac003*100 END) ratio",  #181127-00023#1 add  #181207-00039#1 add
                       "                      FROM sfac_t",
                       "                     WHERE sfacent = ",g_enterprise,
                       "                       AND sfac002 IN ('3','4')",   #181127-00023#1 add
                      #"                     GROUP BY sfacent,sfacdocno) b ON a.sfaaent = b.sfacent AND a.sfaadocno = b.sfacdocno",          #181127-00023#1 mark
                       "                     GROUP BY sfacent,sfacdocno,sfac002) b ON a.sfaaent = b.sfacent AND a.sfaadocno = b.sfacdocno",  #181127-00023#1 add
                       #181024-00017#4 add --e
                       " WHERE sfaaent = ",g_enterprise,
                       "   AND sfaasite = '",g_site,"'",  
                       "   AND sfaastus ='F' ",
                      #"   AND sfaa012 > 0 ",  #170509-00087#1 add   #181004-00013#1 mark
                       "   AND ",g_param.wc

   #未完工量比率小于 a
   IF NOT cl_null(g_master.a) THEN
      #(生产数量-入库量)/生产数量* 100
     #LET g_sql = g_sql CLIPPED,"  AND ((sfaa012 - sfaa050 ) / sfaa012 * 100 <= ",g_master.a,")"   #181004-00013#1 mark
     #LET g_sql = g_sql CLIPPED,"  AND ((sfaa012 - sfaa050 ) <= ",g_master.a," * sfaa012 * 100)"   #181004-00013#1 add   #181024-00017#4 mark
      #181024-00017#4 add --s
      #1.181004-00013#1改錯了,要/100才對 2.拆件式工單要用實際產出數量(sfac005)與預計產出數量(sfac003)來計算未完工比率
#181127-00023#1 mark-s
#     LET g_sql = g_sql CLIPPED,"  AND (((sfaa012 - sfaa050 ) <= ",g_master.a," * sfaa012 / 100) OR",
#                               "       ((b.sfac003-b.sfac005) <= ",g_master.a," * b.sfac003 / 100)  )"
#181127-00023#1 mark-e
#181127-00023#1 add-s
      LET g_sql = g_sql CLIPPED,"  AND ((sfac002 IN ('3','4') AND ratio <= ",g_master.a,") OR",
                                "       (sfac002 IS NULL AND (sfaa012 - sfaa050 ) <= ",g_master.a," * sfaa012 / 100))"
#181127-00023#1 add-e
      #181024-00017#4 add --e
   END IF  

   #发料未完成 -- 未完足套
   #实发数量 > 应发数量 * ( 1 - 允许差异率(发料) / 100)
   IF g_master.b = 'N' THEN
      LET g_sql = g_sql CLIPPED,"  AND NOT EXISTS(",
                                "  SELECT 1 FROM sfba_t b",
                                "   WHERE a.sfaaent = b.sfbaent AND a.sfaadocno = b.sfbadocno ",
                                "     AND sfba008 <>'4' ",#180928-00017#1
                                "     AND b.sfba016 < b.sfba013 * ( 1 - sfba012 / 100 ) )"
   END IF

   #报工未完成
   IF g_master.c = 'N' THEN
      LET g_sql = g_sql CLIPPED,"  AND NOT EXISTS(",
                                "  SELECT 1 FROM sfcb_t c",
                                "   WHERE a.sfaaent = c.sfcbent AND a.sfaadocno = c.sfcbdocno ",
                                "     AND (sfcb046 > 0 OR sfcb047 > 0 OR sfcb048 > 0  OR ",
                                "          sfcb049 > 0 OR sfcb050 > 0 OR sfcb051 > 0 ))  "
   END IF

   IF g_master.d = 'N' THEN
      LET g_sql = g_sql, #1.发料单/退料单(sfdadocno):工单存在sfdb001、sfdc001，状态不等于作废或过账的都显示
                       " AND NOT EXISTS (SELECT 1 FROM sfda_t,sfdc_t WHERE sfdaent = sfdcent AND sfdaent = sfaaent AND sfdadocno = sfdcdocno AND sfdc001 = sfaadocno AND sfdastus <> 'X' AND sfdastus <> 'S') ",
                       #2.报工单(sffbdocno):工单存在sffb005,状态不等于已确认或已作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM sffb_t  WHERE sffbent = sfaaent AND sffb005 = sfaadocno AND sffbstus <> 'X' AND sffbstus <> 'Y') ",
                       #3.当站报废(sfgadocno):工单存在sfga004，状态不等于过账或作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM sfga_t  WHERE sfgaent = sfaaent AND sfga004 = sfaadocno AND sfgastus <> 'X' AND sfgastus <> 'S') ",
                       #4.当站下线(sfhadocno):工单存在sfha004，状态不等于过账或作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM sfha_t  WHERE sfhaent = sfaaent AND sfha004 = sfaadocno AND sfhastus <> 'X' AND sfhastus <> 'S') ",
                       #5.重工转出单(sfiadoccno):工单存在sfia003，状态不等于确认或作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM sfia_t  WHERE sfiaent = sfaaent AND sfia003 = sfaadocno AND sfiastus <> 'X' AND sfiastus <> 'Y') ",
                       #6.下阶料报废(sfjadocno):工单存在sfjb001，状态不等于已过账、已作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM sfja_t,sfjb_t WHERE sfjaent = sfjbent AND sfjaent = sfaaent AND sfjadocno = sfjbdocno AND sfjb001 = sfaadocno AND sfjastus <> 'X' AND sfjastus <> 'S') ",
                       #7.完工入库单(sfeadocno):工单存在sfeb001，状态不等于己过账、已作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM sfea_t,sfeb_t WHERE sfeaent = sfebent AND sfeaent = sfaaent AND sfeadocno = sfebdocno AND sfeb001 = sfaadocno AND sfeastus <> 'X' AND sfeastus <> 'S') ",
                       #8.FQC(qbadocno):用QC单上的来源单号qcba003找完工入库单sfebdocno,
                       #如果QC单状态不等于已确认、已作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM qcba_t  WHERE qcbaent = sfaaent AND qcba003 = sfaadocno AND qcbastus <> 'X' AND qcbastus <> 'Y') ",
                       #9. 委外采购单(pmdldocno):工单存在pmdp003，状态不等于确认的数据
                       " AND NOT EXISTS (SELECT 1 FROM pmdl_t,pmdp_t WHERE pmdlent = pmdpent AND pmdlent = sfaaent AND pmdldocno = pmdpdocno AND pmdp003 = sfaadocno AND pmdlstus NOT IN ('X','Y','C')) ",
                       #10.委外收货单、验退(pmdsdocno):工单存在pmdv014，状态不等于确认、作废的数据
                       " AND NOT EXISTS (SELECT 1 FROM pmds_t,pmdv_t WHERE pmdsent = pmdvent AND pmdsent = sfaaent AND pmdsdocno = pmdvdocno AND pmdv014 = sfaadocno AND pmdsstus <> 'X' AND pmdsstus <> 'Y' AND pmds000 IN ('1','5')) ",
                       #11.委外入库单、仓退单(pmdsdocno):工单存在pmdv014，状态不等于过帐、作废的数据
                       " AND NOT EXISTS (SELECT 1 FROM pmds_t,pmdv_t WHERE pmdsent = pmdvent AND pmdsent = sfaaent AND pmdsdocno = pmdvdocno AND pmdv014 = sfaadocno AND pmdsstus <> 'X' AND pmdsstus <> 'S' AND pmds000 IN ('3','6','7')) ",
                       #12.IQC(qbadocno):用QC单上的来源单号qcba001、项次qcba002，找委外收货单对内的工单pmdv014，如果QC单状态不等于已确认、已作废的数据都显示
                       " AND NOT EXISTS (SELECT 1 FROM qcba_t,pmdv_t WHERE qcbaent = pmdvent AND qcbaent = sfaaent AND qcba001 = pmdvdocno AND qcba002 = pmdvseq AND pmdv014 = sfaadocno AND qcbastus <> 'X' AND qcbastus <> 'Y') ",
                       #13.工单变更单不是审核,作废的单据(sfkadocno) #170509-00087#1 add
                       " AND NOT EXISTS (SELECT 1 FROM sfka_t,sfkg_t WHERE sfkaent = sfkgent AND sfkaent = sfaaent AND sfkadocno = sfkgdocno AND sfkadocno = sfaadocno AND sfkastus NOT IN ('X','Y'))" #170509-00087#1 add
   END IF

   LET g_sql = g_sql CLIPPED," ORDER BY sfaadocno"
   PREPARE asfp500_b1_fill_new_p1 FROM g_sql
   DECLARE asfp500_b1_fill_new_cs1 CURSOR FOR asfp500_b1_fill_new_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'declare asfp500_b1_fill_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF

   LET l_i = 1
   FOREACH asfp500_b1_fill_new_cs1 INTO g_sfaa_d[l_i].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF   
      
      #完工差異數diff_qty:生產數量sfaa012-入庫合格量sfaa050-入庫不合格量sfaa051-
      #                  下線量sfaa055-報廢量sfaa056
      IF cl_null(g_sfaa_d[l_i].sfaa012) THEN LET g_sfaa_d[l_i].sfaa012 = 0 END IF
      IF cl_null(g_sfaa_d[l_i].sfaa050) THEN LET g_sfaa_d[l_i].sfaa050 = 0 END IF      
      IF cl_null(g_sfaa_d[l_i].sfaa051) THEN LET g_sfaa_d[l_i].sfaa051 = 0 END IF      
      IF cl_null(g_sfaa_d[l_i].sfaa055) THEN LET g_sfaa_d[l_i].sfaa055 = 0 END IF      
      IF cl_null(g_sfaa_d[l_i].sfaa056) THEN LET g_sfaa_d[l_i].sfaa056 = 0 END IF      
      #181024-00017#4 add --s
      IF g_sfaa_d[l_i].sfaa003 = '3' THEN #拆件式工單
        #181127-00023#1 mark-s
        #LET l_set = 0
        #LET l_set = s_asft300_finished_sets(g_sfaa_d[l_i].sfaadocno)   #入庫最大套數
        #LET g_sfaa_d[l_i].diff_qty = g_sfaa_d[l_i].sfaa012 - l_set
        #181127-00023#1 mark-e
        #181127-00023#1 add-s
         EXECUTE asfp500_sfac005_p
           USING g_enterprise,g_sfaa_d[l_i].sfaadocno
            INTO g_sfaa_d[l_i].unfinish_rate           
        #181127-00023#1 add-e         
      ELSE
      #181024-00017#4 add --e
         LET g_sfaa_d[l_i].diff_qty = g_sfaa_d[l_i].sfaa012 -  g_sfaa_d[l_i].sfaa050 -  g_sfaa_d[l_i].sfaa051 - 
                                      g_sfaa_d[l_i].sfaa055 -  g_sfaa_d[l_i].sfaa056
      END IF   #181024-00017#4 add
      #未完工比率 unfinish_rate = 完工差异数 / 生产数量 * 100
      
      IF g_sfaa_d[l_i].sfaa003 <> '3' THEN #拆件式工單   #181127-00023#1 add
         LET g_sfaa_d[l_i].unfinish_rate = g_sfaa_d[l_i].diff_qty / g_sfaa_d[l_i].sfaa012 * 100
      END IF   #181127-00023#1 add

      ##未完工量比率小于 a
      #IF NOT cl_null(g_input_h.a) THEN
      #   #(生产数量-入库量)/生产数量* 100
      #   LET l_unfinish_rt = (g_sfaa_d[l_i].sfaa012 - g_sfaa_d[l_i].sfaa050 ) / g_sfaa_d[l_i].sfaa012 * 100
      #   IF l_unfinish_rt > g_input_h.a THEN
      #      CONTINUE FOREACH
      #   END IF
      #END IF  

      ##发料未完成 -- 未完足套
      ##实发数量 > 应发数量 * ( 1 - 允许差异率(发料) / 100)
#      IF g_master.b = 'N' THEN
#         LET g_sfaa_d[l_i].unfinish_b = 'N'
#      ELSE
#         LET l_cnt = 0
#         SELECT COUNT(*) INTO l_cnt FROM sfba_t
#          WHERE sfbaent   = g_enterprise
#            AND sfbadocno = g_sfaa_d[l_i].sfaadocno
#            AND sfba016 < sfba013 * ( 1 - sfba012 / 100)
#         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
#         IF l_cnt > 0 THEN
#            LET g_sfaa_d[l_i].unfinish_b = 'Y'
#         ELSE
#            LET g_sfaa_d[l_i].unfinish_b = 'N'
#         END IF
#      END IF
#      
      
      
      
      #报工未完成
#      IF g_master.c = 'N' THEN
#         LET g_sfaa_d[l_i].unfinish_c = 'N'
#      ELSE      
#         LET l_cnt = 0 
#         SELECT COUNT(*) INTO l_cnt FROM sfcb_t
#          WHERE sfcbent = g_enterprise
#            AND sfcbdocno = g_sfaa_d[l_i].sfaadocno
#            AND (sfcb046 > 0 OR sfcb047 > 0 OR sfcb048 > 0  OR
#                 sfcb049 > 0 OR sfcb050 > 0 OR sfcb051 > 0 )
#         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
#         IF l_cnt > 0 THEN
#            LET g_sfaa_d[l_i].unfinish_c = 'Y'
#         ELSE
#            LET g_sfaa_d[l_i].unfinish_c = 'N'
#         END IF
#      END IF
      
#      #未完成单据
#      CALL s_asfp500_unfinished_chk(g_sfaa_d[l_i].sfaadocno)
#           RETURNING l_success      
#      IF g_master.d = 'N' THEN
#         IF l_success THEN
#            CONTINUE FOREACH
#         END IF
#      ELSE
#         IF l_success THEN
#            LET g_sfaa_d[l_i].unfinish_d = 'Y'         
#         ELSE
#            LET g_sfaa_d[l_i].unfinish_d = 'N'         
#         END IF
#      END IF
      

#      #完工入库数大于订单数（按优德工单号关联）
#      CALL s_asfp500_z_chk(g_sfaa_d[l_i].sfaadocno)
#           RETURNING l_success      
#      IF g_master.z = 'N' THEN
#         IF l_success THEN
#            CONTINUE FOREACH
#         END IF
#      ELSE
#         IF l_success THEN
#            LET g_sfaa_d[l_i].unfinish_d = 'Y'         
#         ELSE
#            LET g_sfaa_d[l_i].unfinish_d = 'N'         
#         END IF
#      END IF

      
      
#      CALL s_desc_get_item_desc(g_sfaa_d[l_i].sfaa010)
#           RETURNING g_sfaa_d[l_i].sfaa010_desc1,g_sfaa_d[l_i].sfaa010_desc2
           
#      CALL s_desc_get_trading_partner_abbr_desc(g_sfaa_d[l_i].sfaa009)
#           RETURNING g_sfaa_d[l_i].sfaa009_desc

#      CALL s_desc_get_department_desc(g_sfaa_d[l_i].sfaa017)
#           RETURNING g_sfaa_d[l_i].sfaa017_desc

#      CALL s_desc_get_person_desc(g_sfaa_d[l_i].sfaa002)
#           RETURNING g_sfaa_d[l_i].sfaa002_desc     
           
      LET l_i = l_i + 1
   
   END FOREACH
   
   CALL g_sfaa_d.deleteElement(l_i)
   LET g_rec_b1 = l_i - 1
   
   IF g_rec_b1 > 0 THEN
      LET l_ac = 1
   END IF
END FUNCTION

################################################################################
# Descriptions...: 結案日期檢查
# Memo...........:
# Usage..........: CALL asfp500_close_dd_chk(p_sfaadocno,p_close_dd)
#                  RETURNING TRUE OR FALSE
# Input parameter: 
# Return code....: 
# Date & Author..: #170517-00018#1 By Whitney
# Modify.........:
################################################################################
PRIVATE FUNCTION asfp500_close_dd_chk(p_sfaadocno,p_close_dd)
DEFINE p_sfaadocno  LIKE sfaa_t.sfaadocno
DEFINE p_close_dd   LIKE type_t.dat
DEFINE l_date       LIKE type_t.dat
DEFINE l_flag       LIKE type_t.chr1
   
   IF p_close_dd <= g_mfg_close THEN
      #結案日期%1不可小於等於庫存關帳日期%2！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code  = 'asf-00698'
      LET g_errparam.replace[1] = p_close_dd 
      LET g_errparam.replace[2] = g_mfg_close
      LET g_errparam.extend= p_sfaadocno
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN FALSE
   END IF
   IF p_close_dd <= g_fin_close THEN
      #結案日期%1不可小於等於成本關帳日期%2！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code  = 'asf-00869'
      LET g_errparam.replace[1] = p_close_dd 
      LET g_errparam.replace[2] = g_fin_close
      LET g_errparam.extend= p_sfaadocno
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN FALSE
   END IF
   
   CALL s_asfp500_get_max_reference_date(p_sfaadocno)
        RETURNING l_date,l_flag
   
   IF p_close_dd < l_date THEN
      #其他作业有使用此工单单号，工单的结案日期不可小于这些单据中的单据日期或是过帐日期 或 工单本身的开立日期！
      INITIALIZE g_errparam TO NULL
      CASE l_flag
           WHEN '0'  LET g_errparam.code = 'asf-01003'   #181130-00013#1 add
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
      RETURN FALSE
   END IF
   
   RETURN TRUE
END FUNCTION

#end add-point
 
{</section>}
 
