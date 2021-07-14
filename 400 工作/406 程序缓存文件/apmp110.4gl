#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="apmp110.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0028(2016-09-06 11:32:42), PR版次:0028(2021-02-07 15:46:13)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000375
#+ Filename...: apmp110
#+ Description: VMI結算作業
#+ Creator....: 04441(2014-08-15 16:26:41)
#+ Modifier...: 02097 -SD/PR- 08734
 
{</section>}
 
{<section id="apmp110.global" type="s" >}
#應用 p02 樣板自動產生(Version:26)
#add-point:填寫註解說明 name="global.memo"
# Modify......: NO.160318-00005#35   2016/03/31   By 07900    重复错误讯息修改
# Modify......: NO.160318-00025#37   2016/04/19   By 07959    將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
# Modify......: NO.160705-00008#1    2016/07/13   By 03079    修正單價是否可修改的邏輯
#160816-00001#7   16/08/17 By 08742    抓取理由碼改CALL sub
#160906-00006#1   16/09/06 By 02097    入庫單別、倉退單別下方都增加，單據日期欄位，控管方式同維護作業，預設today，必輸，單號取號、單據日期、過帳日期都以此日期為主
#161021-00034#1   16/10/21 By Whitney  1. apmp110_count()增加傳入參數detail的游標位置 2. add apmp110_get_price_1()
#161207-00053#1   16/12/13 By 00768    1.修正应产生仓退单却产生收货入库，应产生收货入库却产生仓退单的问题
#                                        模拟出的原因是：同一个供应商，不同料，不同方向，一次apmp110整批抛转，认定出入方面有误
#                                      2.修正异常成倍产生数据的问题
#                                        模拟出的原因是：当产生失败后重新挑选，或者点击重新整理后再次挑选，就会产生倍数的情况
#160711-00040#24   2017/02/20   By xujing     T類作業的單別開窗的where條件(找CALL q_ooba002_開頭的)增加如下程式段
#                                               CALL s_control_get_docno_sql(g_user,g_dept) RETURNING l_success,l_sql1
#170217-00025#4    2017/02/27   By zhujing    整批调整未产生数据时，提示消息修正。
#170330-00089#1    2017/03/31   By lixiang    因采购通路栏位已调整为可不必输，所以取价时，不用判断此栏位是否为空
#170618-00515#1    2017/06/26   By 06137      修正整測問題：調整單據產生的採購性質，由原本1.一般採購改為3.VMI採購
#170618-00329#1    2017/07/13   By 07024      產生單據，檢查單價的部份，<0改成<=0，並更換錯誤訊息
#170703-00025#14   2017/07/24   by 09773      调整construct中的开窗调用,将q_ooag001调整成q_ooag001_2
#171025-00027#1    2017/10/27   by 09767      将#170618-00515#1修改的还原 
#180504-00007#1    2018/05/11   By 02294      維護的日期不可小於成本關帳日
#171201-00045#19   2018/08/21   by 08172      修正多人同时执行同笔资料锁资料问题
#181101-00020#1    2018/11/02   By 05423      调整多张单据若相互抵消，不产生入库、仓退单的情况。记录单据编号为OFFSET+年月日时分秒，更新为VMI已结算
#181203-00028#1    2018/12/19   By 05423      盘点单inaj036 = '501'时，不对inaj004做转换
#190328-00053#1    2019/03/29   By 06021      不启用采购计价单位时，计价单位，计价数量默认给值交易单价，交易数量（调整取不到核价单问题）
#191108-00009#1    2019/11/08   By 01996      修正190328-00053#1 调整错误的问题
#200106-00047#6    2020/01/13   By 12133      新增、修改料號時，保稅(pmdt041)從imaf034預帶
#200302-00005#1    2020/03/02   By 12787      批次作业串查调整
#200408-00071#1    2020/04/09   By 01996      勾选结算数据时,会更新显示单据信息,但是需排除临时表单据性质为空的资料显示
#201109-00009#113  2021/01/27   By 14589      模糊查詢功能，將使用者輸入的字串自動補入*
#210205-00039#1    2021/02/07   By 08734      apmp110抛转产生入库单时应给予多角性质初值
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:23) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:23) --- end ---
 
IMPORT os
IMPORT util
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc" 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#模組變數(Module Variables)
DEFINE g_wc                 STRING
DEFINE g_wc_t               STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                STRING
DEFINE g_wc_filter          STRING
DEFINE g_wc_filter_t        STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10              
DEFINE l_ac_d               LIKE type_t.num10             #單身idx 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_current_page       LIKE type_t.num10             #目前所在頁數
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_master_idx         LIKE type_t.num10
 
TYPE type_parameter RECORD
   #add-point:自定背景執行須傳遞的參數(Module Variable) name="global.parameter"
   
   #end add-point
        wc               STRING
                     END RECORD
 
TYPE type_g_detail_d RECORD
#add-point:自定義模組變數(Module Variable)  #注意要在add-point內寫入END RECORD name="global.variable"
    sel               LIKE type_t.chr1,      #選擇 
    #ming 20150616 add --------------------------------(S) 
    sel2              LIKE type_t.chr1,      #是否已經先被寫入temp table了 
    #ming 20150616 add --------------------------------(E)  
    inaj015           LIKE type_t.chr80,     #單據性質
    inaj022           LIKE inaj_t.inaj022,   #扣帳日期
    inaj001           LIKE inaj_t.inaj001,   #單據編號
    inaj002           LIKE inaj_t.inaj002,   #項次
    inaj003           LIKE inaj_t.inaj003,   #項序
    inaj005           LIKE inaj_t.inaj005,   #料件編號
    inaj005_desc      LIKE type_t.chr80,     #品名
    inaj005_desc_desc LIKE type_t.chr80,     #規格
    inaj006           LIKE inaj_t.inaj006,   #產品特徵
    inaj007           LIKE inaj_t.inaj007,   #庫存管理特徵
    pmds007           LIKE pmds_t.pmds007,   #庫存管理特徵
    inaj011           LIKE inaj_t.inaj011,   #數量
    inaj012           LIKE inaj_t.inaj012,   #單位
    inaj012_desc      LIKE type_t.chr80,     #說明
    inaj008           LIKE inaj_t.inaj008,   #庫
    inaj008_desc      LIKE type_t.chr80,     #說明
    inaj009           LIKE inaj_t.inaj009,   #儲
    inaj009_desc      LIKE type_t.chr80,     #說明
    inaj010           LIKE inaj_t.inaj010    #批
                     END RECORD

TYPE type_g_detail2_d RECORD
    pmds000           LIKE pmds_t.pmds000,   #單據性質
    pmds007           LIKE pmds_t.pmds007,   #供應商
    pmds007_desc      LIKE type_t.chr80,     #說明
    pmds031           LIKE pmds_t.pmds031,   #付款條件
    pmds031_desc      LIKE type_t.chr80,     #說明
    pmds032           LIKE pmds_t.pmds032,   #交易條件
    pmds032_desc      LIKE type_t.chr80,     #說明
    pmds033           LIKE pmds_t.pmds033,   #稅別
    pmds033_desc      LIKE type_t.chr80,     #說明
    pmds034           LIKE pmds_t.pmds034,   #稅率
    pmds035           LIKE pmds_t.pmds035,   #含稅否
    pmds037           LIKE pmds_t.pmds037,   #幣別
    pmds037_desc      LIKE type_t.chr80,     #說明
    pmds038           LIKE pmds_t.pmds038,   #匯率
    pmds039           LIKE pmds_t.pmds039,   #取價方式
    pmds039_desc      LIKE type_t.chr80,     #說明
    pmds048           LIKE pmds_t.pmds048,   #內外購
    pmds049           LIKE pmds_t.pmds049,   #匯率計算基準
    pmds012           LIKE pmds_t.pmds012    #採購通路
                     END RECORD

TYPE type_g_detail3_d RECORD
    pmdtseq           LIKE pmdt_t.pmdtseq,   #項次
    pmdt006           LIKE pmdt_t.pmdt006,   #料件編號
    pmdt006_desc      LIKE type_t.chr80,     #品名
    pmdt006_desc_desc LIKE type_t.chr80,     #規格
    pmdt007           LIKE pmdt_t.pmdt007,   #產品特徵
    pmdt063           LIKE pmdt_t.pmdt063,   #庫存管理特徵
    pmdt019           LIKE pmdt_t.pmdt019,   #單位
    pmdt019_desc      LIKE type_t.chr80,     #說明
    pmdt020           LIKE pmdt_t.pmdt020,   #數量
    pmdt021           LIKE pmdt_t.pmdt021,   #參考單位
    pmdt021_desc      LIKE type_t.chr80,     #說明
    pmdt022           LIKE pmdt_t.pmdt022,   #參考數量
    pmdt016           LIKE pmdt_t.pmdt016,   #庫
    pmdt016_desc      LIKE type_t.chr80,     #說明
    pmdt017           LIKE pmdt_t.pmdt017,   #儲
    pmdt017_desc      LIKE type_t.chr80,     #說明
    pmdt018           LIKE pmdt_t.pmdt018,   #批
    pmdt046           LIKE pmdt_t.pmdt046,   #稅別
    pmdt046_desc      LIKE type_t.chr80,     #說明
    pmdt037           LIKE pmdt_t.pmdt037,   #稅率
    pmdt023           LIKE pmdt_t.pmdt023,   #計價單位
    pmdt023_desc      LIKE type_t.chr80,     #說明
    pmdt024           LIKE pmdt_t.pmdt024,   #計價數量
    pmdt036           LIKE pmdt_t.pmdt036,   #單價
    pmdt038           LIKE pmdt_t.pmdt038,   #未稅金額
    pmdt039           LIKE pmdt_t.pmdt039,   #含稅金額
    pmdt047           LIKE pmdt_t.pmdt047,   #金額
    pmdt042           LIKE pmdt_t.pmdt042,   #取價來源
    pmdt043           LIKE pmdt_t.pmdt043,   #參考單號
    pmdt044           LIKE pmdt_t.pmdt044    #取出單價
                     END RECORD

TYPE type_g_detail4_d RECORD
    inaj015           LIKE type_t.chr80,     #單據性質
    inaj022           LIKE inaj_t.inaj022,   #扣帳日期
    inaj001           LIKE inaj_t.inaj001,   #單據編號
    inaj002           LIKE inaj_t.inaj002,   #項次
    inaj003           LIKE inaj_t.inaj003,   #項序
    inaj005           LIKE inaj_t.inaj005,   #料件編號
    inaj005_desc      LIKE type_t.chr80,     #品名
    inaj005_desc_desc LIKE type_t.chr80,     #規格
    inaj006           LIKE inaj_t.inaj006,   #產品特徵
    inaj007           LIKE inaj_t.inaj007,   #庫存管理特徵
    inaj011           LIKE inaj_t.inaj011,   #數量
    inaj012           LIKE inaj_t.inaj012,   #單位
    inaj012_desc      LIKE type_t.chr80,     #說明
    inaj008           LIKE inaj_t.inaj008,   #庫
    inaj008_desc      LIKE type_t.chr80,     #說明
    inaj009           LIKE inaj_t.inaj009,   #儲
    inaj009_desc      LIKE type_t.chr80,     #說明
    inaj010           LIKE inaj_t.inaj010    #批
                     END RECORD

DEFINE tm             RECORD
    pmdtdocno1        LIKE ooba_t.ooba002,   #收貨入庫單別
    pmdtdocno1_desc   LIKE type_t.chr80,     #說明
    pmdt0511          LIKE pmdt_t.pmdt051,   #收貨理由
    pmdt0511_desc     LIKE type_t.chr80,     #說明
    pmdtdocno2        LIKE ooba_t.ooba002,   #倉退單別
    pmdtdocno2_desc   LIKE type_t.chr80,     #說明
    pmds001           LIKE pmds_t.pmds001,   #單據日期 #160906-00006#1
    pmdt0512          LIKE pmdt_t.pmdt051,   #倉退理由
    pmdt0512_desc     LIKE type_t.chr80,     #說明
    pmds0012          LIKE pmds_t.pmds001    #單據日期 #160906-00006#1
                     END RECORD

DEFINE g_detail2_d  DYNAMIC ARRAY OF type_g_detail2_d
DEFINE g_detail3_d  DYNAMIC ARRAY OF type_g_detail3_d
DEFINE g_detail4_d  DYNAMIC ARRAY OF type_g_detail4_d
DEFINE g_detail2_cnt        LIKE type_t.num5
DEFINE g_detail3_cnt        LIKE type_t.num5
DEFINE g_detail4_cnt        LIKE type_t.num5
DEFINE g_detail2_idx        LIKE type_t.num5
DEFINE g_detail3_idx        LIKE type_t.num5
DEFINE g_detail4_idx        LIKE type_t.num5

DEFINE g_detail2_d_o  RECORD
    pmds031           LIKE pmds_t.pmds031,
    pmds032           LIKE pmds_t.pmds032,
    pmds033           LIKE pmds_t.pmds033,
    pmds037           LIKE pmds_t.pmds037,
    pmds039           LIKE pmds_t.pmds039
                     END RECORD

DEFINE g_detail3_d_o  RECORD
    pmdt022           LIKE pmdt_t.pmdt022,
    pmdt046           LIKE pmdt_t.pmdt046,
    pmdt024           LIKE pmdt_t.pmdt024,
    pmdt036           LIKE pmdt_t.pmdt036 
                     END RECORD

DEFINE g_ooef004            LIKE ooef_t.ooef004           #單據別參照表號
DEFINE g_ooef016            LIKE ooef_t.ooef016           #主幣別編號
DEFINE g_acc1               LIKE type_t.chr10             #收貨應用分類碼
DEFINE g_acc2               LIKE type_t.chr10             #倉退應用分類碼
DEFINE g_flag               LIKE type_t.chr1

#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
DEFINE g_detail_cnt         LIKE type_t.num10              #單身 總筆數(所有資料)
DEFINE g_detail_d  DYNAMIC ARRAY OF type_g_detail_d
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="apmp110.main" type="s" >}
#+ 作業開始 
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   DEFINE ls_js  STRING
   #add-point:main段define name="main.define"
   
   #end add-point   
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("apm","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   
   #end add-point
 
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_apmp110 WITH FORM cl_ap_formpath("apm",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL apmp110_init()   
 
      #進入選單 Menu (="N")
      CALL apmp110_ui_dialog() 
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_apmp110
   END IF 
   
   #add-point:作業離開前 name="main.exit"


   DROP TABLE apmp110_tmp1 #ODI-ORA#

   DROP TABLE apmp110_tmp2 #ODI-ORA#

   DROP TABLE apmp110_tmp3 #ODI-ORA#


   DROP TABLE tax_tmp #ODI-ORA#

   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="apmp110.init" type="s" >}
#+ 畫面資料初始化
PRIVATE FUNCTION apmp110_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point   
   #add-point:init段define name="init.define"
   
   #end add-point   
   
   LET g_error_show  = 1
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1"
 
   #add-point:畫面資料初始化 name="init.init"
   LET g_wc = "1=1"

   CALL cl_set_combo_scc('pmds000','2060')
   CALL cl_set_combo_scc('pmdt042','2016')

   LET g_ooef004 = ''
   LET g_ooef016 = ''
   SELECT ooef004,ooef016 INTO g_ooef004,g_ooef016 FROM ooef_t
    WHERE ooefent = g_enterprise AND ooef001 = g_site
   LET g_acc1 = ''
   #SELECT gzcb004 INTO g_acc1 FROM gzcb_t WHERE gzcb001 = '24' AND gzcb002 = 'apmt570'  #160816-00001#7 mark
   LET g_acc1 = s_fin_get_scc_value('24','apmt570','2')  #160816-00001#7  Add
   
   LET g_acc2 = ''
   #SELECT gzcb004 INTO g_acc2 FROM gzcb_t WHERE gzcb001 = '24' AND gzcb002 = 'apmt580'  #160816-00001#7 mark
   LET g_acc2 = s_fin_get_scc_value('24','apmt580','2')  #160816-00001#7  Add
   
   LET g_flag = '1'

   #判斷據點參數若不使用參考單位時，則參考單位、數量需隱藏不可以維護
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'N' THEN
      CALL cl_set_comp_visible("pmdt021,pmdt021_desc,pmdt022",FALSE)
   END IF

   #整體參數未使用採購計價單位
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0019') = "N" THEN
      CALL cl_set_comp_visible("pmdt023,pmdt023_desc,pmdt024",FALSE)
   END IF
   LET tm.pmds001 = g_today #160906-00006#1
   LET tm.pmds0012= g_today #160906-00006#1
   CREATE TEMP TABLE apmp110_tmp1( 
    pmds000           LIKE pmds_t.pmds000,   #單據性質
    pmds007           LIKE pmds_t.pmds007,   #供應商
    pmds031           LIKE pmds_t.pmds031,   #付款條件
    pmds032           LIKE pmds_t.pmds032,   #交易條件
    pmds033           LIKE pmds_t.pmds033,   #稅別
    pmds034           LIKE pmds_t.pmds034,   #稅率
    pmds035           LIKE pmds_t.pmds035,   #含稅否
    pmds037           LIKE pmds_t.pmds037,   #幣別
    pmds038           LIKE pmds_t.pmds038,   #匯率
    pmds039           LIKE pmds_t.pmds039,   #取價方式
    pmds048           LIKE pmds_t.pmds048,   #內外購
    pmds049           LIKE pmds_t.pmds049,   #匯率計算基準
    pmds012           LIKE pmds_t.pmds012    #採購通路
)

   CREATE TEMP TABLE apmp110_tmp2( 
    pmdt000_s         LIKE pmds_t.pmds000,   #应归属单据性质 #161207-00053#1-1 add虚构的栏位同pmds000
    pmdtseq           LIKE pmdt_t.pmdtseq,   #項次
    pmdt006           LIKE pmdt_t.pmdt006,   #料件編號
    pmdt007           LIKE pmdt_t.pmdt007,   #產品特徵
    pmdt063           LIKE pmdt_t.pmdt063,   #庫存管理特徵
    pmdt019           LIKE pmdt_t.pmdt019,   #單位
    pmdt020           LIKE pmdt_t.pmdt020,   #數量
    pmdt021           LIKE pmdt_t.pmdt021,   #參考單位
    pmdt022           LIKE pmdt_t.pmdt022,   #參考數量
    pmdt016           LIKE pmdt_t.pmdt016,   #庫
    pmdt017           LIKE pmdt_t.pmdt017,   #儲
    pmdt018           LIKE pmdt_t.pmdt018,   #批
    pmdt046           LIKE pmdt_t.pmdt046,   #稅別
    pmdt037           LIKE pmdt_t.pmdt037,   #稅率
    pmdt023           LIKE pmdt_t.pmdt023,   #計價單位
    pmdt024           LIKE pmdt_t.pmdt024,   #計價數量
    pmdt036           LIKE pmdt_t.pmdt036,   #單價
    pmdt038           LIKE pmdt_t.pmdt038,   #未稅金額
    pmdt039           LIKE pmdt_t.pmdt039,   #含稅金額
    pmdt047           LIKE pmdt_t.pmdt047,   #金額
    pmdt042           LIKE pmdt_t.pmdt042,   #取價來源
    pmdt043           LIKE pmdt_t.pmdt043,   #參考單號
    pmdt044           LIKE pmdt_t.pmdt044    #取出單價
)

   CREATE TEMP TABLE apmp110_tmp3( 
    inaj015           LIKE type_t.chr80,     #單據性質
    inaj022           LIKE inaj_t.inaj022,   #扣帳日期
    inaj001           LIKE inaj_t.inaj001,   #單據編號
    inaj002           LIKE inaj_t.inaj002,   #項次
    inaj003           LIKE inaj_t.inaj003,   #項序
    inaj005           LIKE inaj_t.inaj005,   #料件編號
    inaj006           LIKE inaj_t.inaj006,   #產品特徵
    inaj007           LIKE inaj_t.inaj007,   #庫存管理特徵
    inaj011           LIKE inaj_t.inaj011,   #數量
    inaj012           LIKE inaj_t.inaj012,   #單位
    inaj008           LIKE inaj_t.inaj008,   #庫
    inaj009           LIKE inaj_t.inaj009,   #儲
    inaj010           LIKE inaj_t.inaj010    #批
)

   CALL s_tax_recount_tmp()
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="apmp110.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION apmp110_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point 
   DEFINE li_idx   LIKE type_t.num10
   DEFINE lp_str   STRING   #201109-00009
   #add-point:ui_dialog段define name="init.init"
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_where     STRING
   DEFINE l_cnt       LIKE type_t.num5
   DEFINE l_imaf015   LIKE imaf_t.imaf015
   DEFINE l_imaf017   LIKE imaf_t.imaf017
   DEFINE l_imaf144   LIKE imaf_t.imaf144
   DEFINE l_oodbl004  LIKE oodbl_t.oodbl004
   DEFINE l_oodb005   LIKE oodb_t.oodb005
   DEFINE l_oodb006   LIKE oodb_t.oodb006
   DEFINE l_oodb011   LIKE oodb_t.oodb011
   DEFINE l_xrcd113   LIKE xrcd_t.xrcd113
   DEFINE l_xrcd114   LIKE xrcd_t.xrcd114
   DEFINE l_xrcd115   LIKE xrcd_t.xrcd115
   DEFINE l_controlno LIKE ooha_t.ooha001
   DEFINE l_dept      LIKE ooag_t.ooag003
   DEFINE l_pmds  RECORD
      pmds012  LIKE pmds_t.pmds012,
      pmds031  LIKE pmds_t.pmds031,
      pmds032  LIKE pmds_t.pmds032,
      pmds033  LIKE pmds_t.pmds033,
      pmds034  LIKE pmds_t.pmds034,
      pmds035  LIKE pmds_t.pmds035,
      pmds037  LIKE pmds_t.pmds037,
      pmds038  LIKE pmds_t.pmds038,
      pmds039  LIKE pmds_t.pmds039,
      pmds048  LIKE pmds_t.pmds048,
      pmds049  LIKE pmds_t.pmds049
               END RECORD
   DEFINE l_flag      LIKE type_t.chr1
   #160705-00008#1 20160713 -----(S) 
   DEFINE l_pmam002   LIKE pmam_t.pmam002
   DEFINE l_pmam003   LIKE pmam_t.pmam003
   #160705-00008#1 20160713 -----(E) 
   DEFINE  l_sql1          STRING     #160711-00040#24 add
   
   DEFINE l_gzsz008    LIKE gzsz_t.gzsz008  #180504-00007#1 add
   DEFINE l_cnt1       LIKE type_t.num10  #181101-00020#1 add
   DEFINE l_cnt2       LIKE type_t.num10  #181101-00020#1 add   
   #end add-point 
   
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   LET g_action_choice = " "  
   CALL cl_set_act_visible("accept,cancel", FALSE)
         
   LET g_detail_cnt = g_detail_d.getLength()
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_detail_d.clear()
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL apmp110_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         CONSTRUCT BY NAME g_wc ON inaj005,imaa009,inaj025,inaj007,oocq002,inaj008,inaj022
	   
            BEFORE CONSTRUCT

            ON ACTION controlp INFIELD inaj005  #料件編號
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_imaf001_15()
               DISPLAY g_qryparam.return1 TO inaj005
               NEXT FIELD inaj005

            #201109-00009#113 add---(s)
            AFTER FIELD inaj005
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)
                  CALL FGL_DIALOG_SETBUFFER(lp_str)
               END IF
            #201109-00009#113 add---(e)

            ON ACTION controlp INFIELD imaa009  #產品分類
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_rtax001()
               DISPLAY g_qryparam.return1 TO imaa009
               NEXT FIELD imaa009

            #201109-00009#113 add---(s)
            AFTER FIELD imaa009
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)
                  CALL FGL_DIALOG_SETBUFFER(lp_str)
               END IF
            #201109-00009#113 add---(e)

            ON ACTION controlp INFIELD inaj025  #主要採購員
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #CALL q_ooag001()                      #呼叫開窗
               CALL q_ooag001_2()                     #170703-00025#14 modify
               DISPLAY g_qryparam.return1 TO inaj025
               NEXT FIELD inaj025

            #201109-00009#113 add---(s)
            AFTER FIELD inaj025
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)
                  CALL FGL_DIALOG_SETBUFFER(lp_str)
               END IF
            #201109-00009#113 add---(e)

            ON ACTION controlp INFIELD inaj007  #供應商編號
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_pmaa001_3()
               DISPLAY g_qryparam.return1 TO inaj007
               NEXT FIELD inaj007

            #201109-00009#113 add---(s)
            AFTER FIELD inaj007
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)
                  CALL FGL_DIALOG_SETBUFFER(lp_str)
               END IF
            #201109-00009#113 add---(e)

            ON ACTION controlp INFIELD oocq002  #供應商分類
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = '251'
               CALL q_oocq002()
               DISPLAY g_qryparam.return1 TO oocq002
               NEXT FIELD oocq002

            #201109-00009#113 add---(s)
            AFTER FIELD oocq002
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)
                  CALL FGL_DIALOG_SETBUFFER(lp_str)
               END IF
            #201109-00009#113 add---(e)

            ON ACTION controlp INFIELD inaj008  #VMI結算庫位
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_inaa001()
               DISPLAY g_qryparam.return1 TO inaj008
               NEXT FIELD inaj008

            #201109-00009#113 add---(s)
            AFTER FIELD inaj008
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)
                  CALL FGL_DIALOG_SETBUFFER(lp_str)
               END IF
            #201109-00009#113 add---(e)

#            ON ACTION controlp INFIELD inaj009  #VMI結算儲位
#               INITIALIZE g_qryparam.* TO NULL
#               LET g_qryparam.state = 'c'
#               LET g_qryparam.reqry = FALSE
#               CALL q_inab002()
#               DISPLAY g_qryparam.return1 TO inaj009
#               NEXT FIELD inaj009

         END CONSTRUCT

         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         INPUT BY NAME tm.pmdtdocno1,tm.pmdt0511,tm.pmds001,tm.pmdtdocno2,tm.pmdt0512,tm.pmds0012     #160906-00006#1
            ATTRIBUTE(WITHOUT DEFAULTS)
         
            BEFORE INPUT
               CALL apmp110_set_required() RETURNING l_flag

            AFTER FIELD pmdtdocno1
               CALL s_aooi200_get_slip_desc(tm.pmdtdocno1) RETURNING tm.pmdtdocno1_desc
               DISPLAY BY NAME tm.pmdtdocno1_desc 
               
               #ming 20150617 add ------------(S) 
               IF NOT cl_null(tm.pmdtdocno1) THEN
                  IF NOT s_aooi200_chk_slip(g_site,'',tm.pmdtdocno1,'apmt532') THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
               #ming 20150617 add ------------(E)  
            
            BEFORE FIELD pmdt0511
               IF cl_null(tm.pmdtdocno1) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00603'
                  LET g_errparam.extend = 'pmdtdocno'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD pmdtdocno1
               END IF

            AFTER FIELD pmdt0511
               IF NOT cl_null(tm.pmdt0511) THEN
                  IF NOT s_azzi650_chk_exist(g_acc1,tm.pmdt0511) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
               CALL s_desc_get_acc_desc(g_acc1,tm.pmdt0511) RETURNING tm.pmdt0511_desc
               DISPLAY BY NAME tm.pmdt0511_desc

            AFTER FIELD pmdtdocno2
               CALL s_aooi200_get_slip_desc(tm.pmdtdocno2) RETURNING tm.pmdtdocno2_desc
               DISPLAY BY NAME tm.pmdtdocno2_desc

            BEFORE FIELD pmdt0512
               IF cl_null(tm.pmdtdocno2) THEN
                  INITIALIZE g_errparam TO NULL
                  #ming 20150617 modify ----------------(S) 
                  #LET g_errparam.code = 'apm-00603'
                  LET g_errparam.code = 'apm-00957'     #倉退單別未輸入 
                  #ming 20150617 modify ----------------(E) 
                  LET g_errparam.extend = 'pmdtdocno'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD pmdtdocno2
               END IF

            AFTER FIELD pmdt0512
               IF NOT cl_null(tm.pmdt0512) THEN
                  IF NOT s_azzi650_chk_exist(g_acc2,tm.pmdt0512) THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
               CALL s_desc_get_acc_desc(g_acc2,tm.pmdt0512) RETURNING tm.pmdt0512_desc
               DISPLAY BY NAME tm.pmdt0512_desc
            #160906-00006#1-s
            AFTER FIELD pmds001
               IF NOT cl_null(tm.pmds001) THEN
                  #180504-00007#1--add--s
                  #維護的日期不可小於成本關帳日
                  LET l_gzsz008 = cl_get_para(g_enterprise,g_site,'S-MFG-0031')
                  IF tm.pmds001 <= l_gzsz008 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'sub-00306'
                     LET g_errparam.extend = tm.pmds001
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD pmds001
                  END IF
                  #180504-00007#1--add--s
               END IF
            
            AFTER FIELD pmds0012
               IF NOT cl_null(tm.pmds0012) THEN
                  #180504-00007#1--add--s
                  #維護的日期不可小於成本關帳日
                  LET l_gzsz008 = cl_get_para(g_enterprise,g_site,'S-MFG-0031')
                  IF tm.pmds0012 <= l_gzsz008 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'sub-00306'
                     LET g_errparam.extend = tm.pmds0012
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD pmds0012
                  END IF
                  #180504-00007#1--add--s
               END IF
            #160906-00006#1-e
            ON ACTION controlp INFIELD pmdtdocno1  #收貨入庫單別
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = tm.pmdtdocno1
               LET g_qryparam.arg1 = g_ooef004
               LET g_qryparam.arg2 = 'apmt532'
               #160711-00040#24 add(s)
               CALL s_control_get_docno_sql(g_user,g_dept)
                   RETURNING l_success,l_sql1
               IF NOT cl_null(l_sql1) THEN
                  LET g_qryparam.where = l_sql1
               END IF
               #160711-00040#24 add(e)
               CALL q_ooba002_1()
               LET tm.pmdtdocno1 = g_qryparam.return1
               DISPLAY tm.pmdtdocno1 TO pmdtdocno1
               CALL s_aooi200_get_slip_desc(tm.pmdtdocno1) RETURNING tm.pmdtdocno1_desc
               DISPLAY BY NAME tm.pmdtdocno1_desc
               NEXT FIELD pmdtdocno1

            ON ACTION controlp INFIELD pmdt0511  #收貨理由
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = tm.pmdt0511
               LET g_qryparam.where = "1=1 "
               LET l_where = ''
               CALL s_control_get_doc_sql("oocq002",tm.pmdtdocno1,'8') RETURNING l_success,l_where
               IF l_success AND NOT cl_null(l_where) THEN
                  LET g_qryparam.where = g_qryparam.where ," AND ",l_where
               END IF
               LET g_qryparam.arg1 = g_acc1
               CALL q_oocq002()
               LET tm.pmdt0511 = g_qryparam.return1
               DISPLAY tm.pmdt0511 TO pmdt0511
               CALL s_desc_get_acc_desc(g_acc1,tm.pmdt0511) RETURNING tm.pmdt0511_desc
               DISPLAY BY NAME tm.pmdt0511_desc
               NEXT FIELD pmdt0511

            ON ACTION controlp INFIELD pmdtdocno2  #倉退單別
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = tm.pmdtdocno2
               LET g_qryparam.arg1 = g_ooef004
               LET g_qryparam.arg2 = 'apmt580'
               #160711-00040#24 add(s)
               CALL s_control_get_docno_sql(g_user,g_dept)
                   RETURNING l_success,l_sql1
               IF NOT cl_null(l_sql1) THEN
                  LET g_qryparam.where = l_sql1
               END IF
               #160711-00040#24 add(e)
               CALL q_ooba002_1()
               LET tm.pmdtdocno2 = g_qryparam.return1
               DISPLAY tm.pmdtdocno2 TO pmdtdocno2
               CALL s_aooi200_get_slip_desc(tm.pmdtdocno2) RETURNING tm.pmdtdocno2_desc
               DISPLAY BY NAME tm.pmdtdocno2_desc
               NEXT FIELD pmdtdocno2

            ON ACTION controlp INFIELD pmdt0512  #倉退理由
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = tm.pmdt0512
               LET g_qryparam.where = "1=1 "
               LET l_where = ''
               CALL s_control_get_doc_sql("oocq002",tm.pmdtdocno2,'8') RETURNING l_success,l_where
               IF l_success AND NOT cl_null(l_where) THEN
                  LET g_qryparam.where = g_qryparam.where ," AND ",l_where
               END IF
               LET g_qryparam.arg1 = g_acc2
               CALL q_oocq002()
               LET tm.pmdt0512 = g_qryparam.return1
               DISPLAY tm.pmdt0512 TO pmdt0512
               CALL s_desc_get_acc_desc(g_acc2,tm.pmdt0512) RETURNING tm.pmdt0512_desc
               DISPLAY BY NAME tm.pmdt0512_desc
               NEXT FIELD pmdt0512

            AFTER INPUT
               IF INT_FLAG THEN
                  EXIT DIALOG
               END IF

         END INPUT

         INPUT ARRAY g_detail_d FROM s_detail1.*
            ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                      INSERT ROW = FALSE,
                      DELETE ROW = FALSE,
                      APPEND ROW = FALSE)

            BEFORE INPUT
               LET g_detail_cnt = g_detail_d.getLength()

            BEFORE ROW
               LET g_master_idx = ARR_CURR()
               DISPLAY g_master_idx TO FORMONLY.h_index
               LET g_detail_cnt = g_detail_d.getLength()
               CALL apmp110_fetch()

            ON CHANGE b_sel 
               #ming 20150616 add -----------------------(S) 
               #手動的情況，直接改變sel2即可 
               LET g_detail_d[g_master_idx].sel2 = g_detail_d[g_master_idx].sel
               #ming 20150616 add -----------------------(E)  
               
               IF g_detail_d[g_master_idx].sel = 'N' THEN  #取消勾選
                  #結算資料清單
                  DELETE FROM apmp110_tmp3
                   WHERE inaj001 = g_detail_d[g_master_idx].inaj001
                     AND inaj002 = g_detail_d[g_master_idx].inaj002
                     AND inaj003 = g_detail_d[g_master_idx].inaj003
                     AND inaj011 = g_detail_d[g_master_idx].inaj011
                  LET l_cnt = ''
                  SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp3
                   WHERE inaj005 = g_detail_d[g_master_idx].inaj005
                     AND inaj006 = g_detail_d[g_master_idx].inaj006
                     AND inaj007 = g_detail_d[g_master_idx].pmds007
                     AND inaj008 = g_detail_d[g_master_idx].inaj008
                     AND inaj009 = g_detail_d[g_master_idx].inaj009
                     AND inaj010 = g_detail_d[g_master_idx].inaj010
                     AND inaj012 = g_detail_d[g_master_idx].inaj012
                  IF cl_null(l_cnt) OR l_cnt = 0 THEN
                     #入庫/倉退明細
                     DELETE FROM apmp110_tmp2
                      WHERE pmdt006 = g_detail_d[g_master_idx].inaj005
                        AND pmdt007 = g_detail_d[g_master_idx].inaj006
                        AND pmdt063 = g_detail_d[g_master_idx].pmds007
                        AND pmdt016 = g_detail_d[g_master_idx].inaj008
                        AND pmdt017 = g_detail_d[g_master_idx].inaj009
                        AND pmdt018 = g_detail_d[g_master_idx].inaj010
                        AND pmdt019 = g_detail_d[g_master_idx].inaj012
                     SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp2
                      WHERE pmdt063 = g_detail_d[g_master_idx].pmds007   #库存管理特征，即供应商编号
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        #入庫/倉退單據
                        DELETE FROM apmp110_tmp1
                         WHERE pmds007 = g_detail_d[g_master_idx].pmds007
                     ELSE
                        CALL apmp110_count(g_master_idx)
                     END IF
                  ELSE
                     CALL apmp110_count(g_master_idx)
                  END IF
               ELSE  #勾選結算資料清單
                  INSERT INTO apmp110_tmp3 VALUES(g_detail_d[g_master_idx].inaj015,
                 g_detail_d[g_master_idx].inaj022,g_detail_d[g_master_idx].inaj001,
                 g_detail_d[g_master_idx].inaj002,g_detail_d[g_master_idx].inaj003,
                 g_detail_d[g_master_idx].inaj005,g_detail_d[g_master_idx].inaj006,
                 g_detail_d[g_master_idx].pmds007,g_detail_d[g_master_idx].inaj011,
                 g_detail_d[g_master_idx].inaj012,g_detail_d[g_master_idx].inaj008,
                 g_detail_d[g_master_idx].inaj009,g_detail_d[g_master_idx].inaj010)
                  LET l_cnt = ''
                  SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp2
                   WHERE pmdt006 = g_detail_d[g_master_idx].inaj005
                     AND pmdt007 = g_detail_d[g_master_idx].inaj006
                     AND pmdt063 = g_detail_d[g_master_idx].pmds007
                     AND pmdt016 = g_detail_d[g_master_idx].inaj008
                     AND pmdt017 = g_detail_d[g_master_idx].inaj009
                     AND pmdt018 = g_detail_d[g_master_idx].inaj010
                     AND pmdt019 = g_detail_d[g_master_idx].inaj012
                  IF cl_null(l_cnt) OR l_cnt = 0 THEN
                     #先判斷這個供應商是否有設多個當前採購控制組範圍內的供應商預設條件，則開窗，讓user 選擇帶哪一個控制組的資料
                     INITIALIZE l_pmds.* TO NULL
                     LET l_dept = cl_get_sitename(g_detail_d[g_master_idx].pmds007)
                     CALL s_control_get_group('4',g_detail_d[g_master_idx].pmds007,l_dept) RETURNING l_success,l_controlno
                     IF l_success AND NOT cl_null(l_controlno) THEN
                        SELECT pmal003,pmal004,pmal006,pmal008,pmal020,pmal021,pmal023,pmal024
                          INTO l_pmds.pmds037,l_pmds.pmds033,l_pmds.pmds031,l_pmds.pmds012,
                               l_pmds.pmds032,l_pmds.pmds039,l_pmds.pmds048,l_pmds.pmds049
                          FROM pmal_t 
                         WHERE pmalent = g_enterprise AND pmal001 = g_detail_d[g_master_idx].pmds007
                           AND pmal002 = l_controlno AND pmalstus = 'Y'
                     ELSE
                        SELECT pmab033,pmab034,pmab037,pmab038,pmab053,pmab054,pmab057,pmab058
                          INTO l_pmds.pmds037,l_pmds.pmds033,l_pmds.pmds031,l_pmds.pmds012,
                               l_pmds.pmds032,l_pmds.pmds039,l_pmds.pmds048,l_pmds.pmds049
                          FROM pmab_t
                         WHERE pmabent = g_enterprise AND pmabsite = g_site
                           AND pmab001 = g_detail_d[g_master_idx].pmds007
                     END IF
                     #稅率、含稅否
                     IF NOT cl_null(l_pmds.pmds033) THEN
                        CALL s_tax_chk(g_site,l_pmds.pmds033)
                             RETURNING l_success,l_oodbl004,l_pmds.pmds035,l_pmds.pmds034,l_oodb011
                        IF l_oodb011 = '1' THEN  #正常稅率
                           LET l_imaf017 = l_pmds.pmds033
                           LET l_oodb005 = l_pmds.pmds035
                           LET l_oodb006 = l_pmds.pmds034
                        ELSE                     #依料件設定
                           LET l_imaf017 = ''
                           SELECT imaf017 INTO l_imaf017 FROM imaf_t
                            WHERE imafent = g_enterprise AND imafsite = g_site
                              AND imaf001 = g_detail_d[g_master_idx].inaj005
                           IF NOT cl_null(l_imaf017) THEN
                              CALL s_tax_chk(g_site,l_imaf017)
                                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                           END IF
                        END IF
                     END IF
                     #項次
                     SELECT MAX(pmdtseq)+1 INTO l_cnt FROM apmp110_tmp2
                      WHERE pmdt063 = g_detail_d[g_master_idx].pmds007
                     IF cl_null(l_cnt) THEN LET l_cnt = 1 END IF
                     #入庫/倉退明細
                     #INSERT INTO apmp110_tmp2 VALUES(l_cnt,g_detail_d[g_master_idx].inaj005,  #161207-00053#1-1 mark
                     INSERT INTO apmp110_tmp2 VALUES('',l_cnt,g_detail_d[g_master_idx].inaj005,  #161207-00053#1-1 add
                          g_detail_d[g_master_idx].inaj006,g_detail_d[g_master_idx].pmds007,
                         #g_detail_d[g_master_idx].inaj012,'0','','0',  #PGS(D)-00902-mark
                          g_detail_d[g_master_idx].inaj012,0,'',0,      #PGS(D)-00902-add
                          g_detail_d[g_master_idx].inaj008,g_detail_d[g_master_idx].inaj009,
                          g_detail_d[g_master_idx].inaj010,l_imaf017,l_oodb006,
                        # '','0','0','0','0','0','','','')    #PGS(D)-00902-mark
                          '',0,0,0,0,0,'','',0)              #PGS(D)-00902-add
                     LET l_cnt = ''
                     SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp1
                      WHERE pmds007 = g_detail_d[g_master_idx].pmds007  #供应商编号
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        #匯率
                        CALL apmp110_get_exrate(l_pmds.pmds037,l_pmds.pmds048) RETURNING l_pmds.pmds038
                        #入庫/倉退單據
                        INSERT INTO apmp110_tmp1(pmds007,pmds031,pmds032,pmds033,pmds034,pmds035,
                                                 pmds037,pmds038,pmds039,pmds048,pmds049,pmds012)
                                          VALUES(g_detail_d[g_master_idx].pmds007,l_pmds.pmds031,
                                                 l_pmds.pmds032,l_pmds.pmds033,l_pmds.pmds034,l_pmds.pmds035,
                                                 l_pmds.pmds037,l_pmds.pmds038,l_pmds.pmds039,l_pmds.pmds048,
                                                 l_pmds.pmds049,l_pmds.pmds012)
                     END IF
                  END IF
                  CALL apmp110_count(g_master_idx)
               END IF
               CALL apmp110_fetch()
               CALL apmp110_get_price_1()   #161021-00034#1

         END INPUT

         INPUT ARRAY g_detail2_d FROM s_detail2.* 
              ATTRIBUTE(COUNT = g_detail2_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                        INSERT ROW = FALSE,
                        DELETE ROW = FALSE,
                        APPEND ROW = FALSE)

            BEFORE INPUT
               CALL apmp110_set_required() RETURNING l_flag
               CASE 
                  WHEN l_flag = '1' OR l_flag = '3'
                     IF cl_null(tm.pmdtdocno1) THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'apm-00603'
                        LET g_errparam.extend = 'pmdtdocno'
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        NEXT FIELD pmdtdocno1
                     END IF
                  WHEN l_flag = '2' OR l_flag = '3'
                     IF cl_null(tm.pmdtdocno2) THEN
                        INITIALIZE g_errparam TO NULL
                        #ming 20150617 modify ----------------(S) 
                        #LET g_errparam.code = 'apm-00603'
                        LET g_errparam.code = 'apm-00957'     #倉退單別未輸入 
                        #ming 20150617 modify ----------------(E) 
                        LET g_errparam.extend = 'pmdtdocno'
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        NEXT FIELD pmdtdocno2
                     ELSE
                        IF cl_null(tm.pmdt0512) THEN
                           NEXT FIELD pmdt0512
                        END IF
                     END IF
#                  OTHERWISE EXIT CASE  #181101-00020#1 mark
                  #181101-00020#1 add-S
                  OTHERWISE
                     NEXT FIELD b_sel 
                  #181101-00020#1 add-E
               END CASE
               LET g_detail2_cnt = g_detail2_d.getLength()
               LET g_flag = '0'

            BEFORE ROW
               LET g_detail2_idx = ARR_CURR()
               LET g_detail2_cnt = g_detail2_d.getLength()
               LET g_detail2_d_o.pmds031 = g_detail2_d[g_detail2_idx].pmds031
               LET g_detail2_d_o.pmds032 = g_detail2_d[g_detail2_idx].pmds032
               LET g_detail2_d_o.pmds033 = g_detail2_d[g_detail2_idx].pmds033
               LET g_detail2_d_o.pmds037 = g_detail2_d[g_detail2_idx].pmds037
               LET g_detail2_d_o.pmds039 = g_detail2_d[g_detail2_idx].pmds039
               CALL apmp110_fetch_1()
               #181101-00020#1 add-S
               CALL apmp110_set_required_b()
               CALL apmp110_set_no_required_b()
               #181101-00020#1 add-E

            AFTER FIELD pmds031
               LET g_detail2_d[g_detail2_idx].pmds031_desc = ''
               IF NOT cl_null(g_detail2_d[g_detail2_idx].pmds031) THEN
                  IF g_detail2_d[g_detail2_idx].pmds031 <> g_detail2_d_o.pmds031 OR cl_null(g_detail2_d_o.pmds031) THEN
                     INITIALIZE g_chkparam.* TO NULL
                     LET g_chkparam.arg1 = g_detail2_d[g_detail2_idx].pmds007
                     LET g_chkparam.arg2 = g_detail2_d[g_detail2_idx].pmds031
                     IF NOT cl_chk_exist("v_pmad002_1") THEN
                        LET g_detail2_d[g_detail2_idx].pmds031 = g_detail2_d_o.pmds031
                        CALL s_desc_get_ooib002_desc(g_detail2_d[g_detail2_idx].pmds031) RETURNING g_detail2_d[g_detail2_idx].pmds031_desc
                        NEXT FIELD CURRENT
                     END IF
                     CALL apmp110_get_price_1()   #161021-00034#1
                  END IF
               END IF
               CALL s_desc_get_ooib002_desc(g_detail2_d[g_detail2_idx].pmds031) RETURNING g_detail2_d[g_detail2_idx].pmds031_desc
               LET g_detail2_d_o.pmds031 = g_detail2_d[g_detail2_idx].pmds031

            AFTER FIELD pmds032
               LET g_detail2_d[g_detail2_idx].pmds032_desc = ''
               IF NOT cl_null(g_detail2_d[g_detail2_idx].pmds032) THEN
                  IF g_detail2_d[g_detail2_idx].pmds032 <> g_detail2_d_o.pmds032 OR cl_null(g_detail2_d_o.pmds032) THEN
                     IF NOT s_azzi650_chk_exist('238',g_detail2_d[g_detail2_idx].pmds032) THEN
                        LET g_detail2_d[g_detail2_idx].pmds032 = g_detail2_d_o.pmds032
                        CALL s_desc_get_acc_desc('238',g_detail2_d[g_detail2_idx].pmds032) RETURNING g_detail2_d[g_detail2_idx].pmds032_desc
                        NEXT FIELD CURRENT
                     END IF
                     CALL apmp110_get_price_1()   #161021-00034#1
                  END IF
               END IF
               CALL s_desc_get_acc_desc('238',g_detail2_d[g_detail2_idx].pmds032) RETURNING g_detail2_d[g_detail2_idx].pmds032_desc
               LET g_detail2_d_o.pmds032 = g_detail2_d[g_detail2_idx].pmds032

            AFTER FIELD pmds033
               LET g_detail2_d[g_detail2_idx].pmds033_desc = ''
               IF NOT cl_null(g_detail2_d[g_detail2_idx].pmds033) THEN
                  IF g_detail2_d[g_detail2_idx].pmds033 <> g_detail2_d_o.pmds033 OR cl_null(g_detail2_d_o.pmds033) THEN
                     CALL s_tax_chk(g_site,g_detail2_d[g_detail2_idx].pmds033)
                          RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                     IF NOT l_success THEN
                        LET g_detail2_d[g_detail2_idx].pmds033 = g_detail2_d_o.pmds033
                        CALL s_desc_get_tax_desc1(g_site,g_detail2_d[g_detail2_idx].pmds033) RETURNING g_detail2_d[g_detail2_idx].pmds033_desc
                        NEXT FIELD CURRENT
                     ELSE
                        LET g_detail2_d[g_detail2_idx].pmds033_desc = l_oodbl004
                        LET g_detail2_d[g_detail2_idx].pmds034 = l_oodb006
                        LET g_detail2_d[g_detail2_idx].pmds035 = l_oodb005
                     END IF
                  END IF
               END IF
               CALL s_desc_get_tax_desc1(g_site,g_detail2_d[g_detail2_idx].pmds033) RETURNING g_detail2_d[g_detail2_idx].pmds033_desc
               LET g_detail2_d_o.pmds033 = g_detail2_d[g_detail2_idx].pmds033

            AFTER FIELD pmds037
               LET g_detail2_d[g_detail2_idx].pmds037_desc = ''
               IF NOT cl_null(g_detail2_d[g_detail2_idx].pmds037) THEN
                  IF g_detail2_d[g_detail2_idx].pmds037 <> g_detail2_d_o.pmds037 OR cl_null(g_detail2_d_o.pmds037) THEN
                     INITIALIZE g_chkparam.* TO NULL
                     LET g_chkparam.arg1 = g_site
                     LET g_chkparam.arg2 = g_detail2_d[g_detail2_idx].pmds037
                     
                     #160318-00025#37  2016/04/19  by pengxin  add(S)
                     LET g_errshow = TRUE #是否開窗 
                     LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
                     #160318-00025#37  2016/04/19  by pengxin  add(E)
                     
                     IF NOT cl_chk_exist("v_ooaj002") THEN
                        LET g_detail2_d[g_detail2_idx].pmds037 = g_detail2_d_o.pmds037
                        CALL s_desc_get_currency_desc(g_detail2_d[g_detail2_idx].pmds037) RETURNING g_detail2_d[g_detail2_idx].pmds037_desc
                        NEXT FIELD CURRENT
                     END IF
                     CALL apmp110_get_exrate(g_detail2_d[g_detail2_idx].pmds037,g_detail2_d[g_detail2_idx].pmds048)
                          RETURNING g_detail2_d[g_detail2_idx].pmds038
                     CALL apmp110_get_price_1()   #161021-00034#1
                  END IF
               END IF
               CALL s_desc_get_currency_desc(g_detail2_d[g_detail2_idx].pmds037) RETURNING g_detail2_d[g_detail2_idx].pmds037_desc
               LET g_detail2_d_o.pmds037 = g_detail2_d[g_detail2_idx].pmds037

            AFTER FIELD pmds039
               LET g_detail2_d[g_detail2_idx].pmds039_desc = ''
               IF NOT cl_null(g_detail2_d[g_detail2_idx].pmds039) THEN
                  IF g_detail2_d[g_detail2_idx].pmds039 <> g_detail2_d_o.pmds039 OR cl_null(g_detail2_d_o.pmds039) THEN
                     INITIALIZE g_chkparam.* TO NULL
                     LET g_chkparam.arg1 = g_detail2_d[g_detail2_idx].pmds039
                     
                     #160318-00025#37  2016/04/19  by pengxin  add(S)
                     LET g_errshow = TRUE #是否開窗 
                     LET g_chkparam.err_str[1] = "apm-00210:sub-01302|apmi130|",cl_get_progname("apmi130",g_lang,"2"),"|:EXEPROGapmi130"
                     #160318-00025#37  2016/04/19  by pengxin  add(E)
                     
                     IF NOT cl_chk_exist("v_pmam001") THEN
                        LET g_detail2_d[g_detail2_idx].pmds039 = g_detail2_d_o.pmds039
                        CALL s_desc_get_price_type_desc(g_detail2_d[g_detail2_idx].pmds039) RETURNING g_detail2_d[g_detail2_idx].pmds039_desc
                        NEXT FIELD CURRENT
                     END IF
                     CALL apmp110_get_price_1()   #161021-00034#1
                  END IF
               END IF
               CALL s_desc_get_price_type_desc(g_detail2_d[g_detail2_idx].pmds039) RETURNING g_detail2_d[g_detail2_idx].pmds039_desc
               LET g_detail2_d_o.pmds039 = g_detail2_d[g_detail2_idx].pmds039

            ON ACTION controlp INFIELD pmds031  #付款條件
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_detail2_d[g_detail2_idx].pmds031
               LET g_qryparam.arg1 = g_detail2_d[g_detail2_idx].pmds007
               CALL q_pmad002_2()
               LET g_detail2_d[g_detail2_idx].pmds031 = g_qryparam.return1
               DISPLAY g_detail2_d[g_detail2_idx].pmds031 TO pmds031
               CALL s_desc_get_ooib002_desc(g_detail2_d[g_detail2_idx].pmds031) RETURNING g_detail2_d[g_detail2_idx].pmds031_desc
               NEXT FIELD pmds031

            ON ACTION controlp INFIELD pmds032  #交易條件
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_detail2_d[g_detail2_idx].pmds032
               LET g_qryparam.arg1 = '238'
               CALL q_oocq002()
               LET g_detail2_d[g_detail2_idx].pmds032 = g_qryparam.return1
               DISPLAY g_detail2_d[g_detail2_idx].pmds032 TO pmds032
               CALL s_desc_get_acc_desc('238',g_detail2_d[g_detail2_idx].pmds032) RETURNING g_detail2_d[g_detail2_idx].pmds032_desc
               NEXT FIELD pmds032

            ON ACTION controlp INFIELD pmds033  #稅別
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_detail2_d[g_detail2_idx].pmds033
               CALL q_oodb002_2()
               LET g_detail2_d[g_detail2_idx].pmds033 = g_qryparam.return1
               DISPLAY g_detail2_d[g_detail2_idx].pmds033 TO pmds033
               CALL s_desc_get_tax_desc1(g_site,g_detail2_d[g_detail2_idx].pmds033) RETURNING g_detail2_d[g_detail2_idx].pmds033_desc
               NEXT FIELD pmds033

            ON ACTION controlp INFIELD pmds037  #幣別
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_detail2_d[g_detail2_idx].pmds037
               LET g_qryparam.arg1 = g_site
               CALL q_ooaj002_1()
               LET g_detail2_d[g_detail2_idx].pmds037 = g_qryparam.return1
               DISPLAY g_detail2_d[g_detail2_idx].pmds037 TO pmds037
               CALL s_desc_get_currency_desc(g_detail2_d[g_detail2_idx].pmds037) RETURNING g_detail2_d[g_detail2_idx].pmds037_desc
               NEXT FIELD pmds037

            ON ACTION controlp INFIELD pmds039  #取價方式
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_detail2_d[g_detail2_idx].pmds039
               CALL q_pmam001()
               LET g_detail2_d[g_detail2_idx].pmds039 = g_qryparam.return1
               DISPLAY g_detail2_d[g_detail2_idx].pmds039 TO pmds039
               CALL s_desc_get_price_type_desc(g_detail2_d[g_detail2_idx].pmds039) RETURNING g_detail2_d[g_detail2_idx].pmds039_desc
               NEXT FIELD pmds039

            ON ROW CHANGE
               IF INT_FLAG THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = '' 
                  LET g_errparam.code   = 9001 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  LET INT_FLAG = 0
                  EXIT DIALOG 
               END IF
               INITIALIZE g_errparam TO NULL 
               UPDATE apmp110_tmp1 SET pmds031 = g_detail2_d[g_detail2_idx].pmds031,
                                       pmds032 = g_detail2_d[g_detail2_idx].pmds032,
                                       pmds033 = g_detail2_d[g_detail2_idx].pmds033,
                                       pmds034 = g_detail2_d[g_detail2_idx].pmds034,
                                       pmds035 = g_detail2_d[g_detail2_idx].pmds035,
                                       pmds037 = g_detail2_d[g_detail2_idx].pmds037,
                                       pmds038 = g_detail2_d[g_detail2_idx].pmds038,
                                       pmds039 = g_detail2_d[g_detail2_idx].pmds039
                WHERE pmds007 = g_detail2_d[g_detail2_idx].pmds007
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_errparam.code   = "std-00009" 
                  WHEN SQLCA.sqlcode #其他錯誤
                     LET g_errparam.code   = SQLCA.sqlcode 
                  OTHERWISE EXIT CASE
               END CASE
               IF NOT cl_null(g_errparam.code) THEN
                  LET g_errparam.extend = "axmp501_tmp" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
               END IF

         END INPUT

         INPUT ARRAY g_detail3_d FROM s_detail3.* 
              ATTRIBUTE(COUNT = g_detail3_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                        INSERT ROW = FALSE,
                        DELETE ROW = FALSE,
                        APPEND ROW = FALSE)

            BEFORE INPUT
               CALL apmp110_set_required() RETURNING l_flag
               CASE 
                  WHEN l_flag = '1' OR l_flag = '3'
                     IF cl_null(tm.pmdtdocno1) THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'apm-00603'
                        LET g_errparam.extend = 'pmdtdocno'
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        NEXT FIELD pmdtdocno1
                     END IF
                  WHEN l_flag = '2' OR l_flag = '3'
                     IF cl_null(tm.pmdtdocno2) THEN
                        INITIALIZE g_errparam TO NULL
                        #ming 20150617 modify ----------------(S) 
                        #LET g_errparam.code = 'apm-00603'
                        LET g_errparam.code = 'apm-00957'     #倉退單別未輸入 
                        #ming 20150617 modify ----------------(E) 
                        LET g_errparam.extend = 'pmdtdocno'
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        NEXT FIELD pmdtdocno2
                     ELSE
                        IF cl_null(tm.pmdt0512) THEN
                           NEXT FIELD pmdt0512
                        END IF
                     END IF
#                  OTHERWISE EXIT CASE  #181101-00020#1 mark
                  #181101-00020#1 add-S
                  OTHERWISE
                     NEXT FIELD b_sel 
                  #181101-00020#1 add-E
               END CASE
               LET g_detail3_cnt = g_detail3_d.getLength()
               LET g_flag = '0'

            BEFORE ROW
               LET g_detail3_idx = ARR_CURR()
               LET g_detail3_cnt = g_detail3_d.getLength()
               LET g_detail3_d_o.pmdt022 = g_detail3_d[g_detail3_idx].pmdt022
               LET g_detail3_d_o.pmdt046 = g_detail3_d[g_detail3_idx].pmdt046
               LET g_detail3_d_o.pmdt024 = g_detail3_d[g_detail3_idx].pmdt024
               LET g_detail3_d_o.pmdt036 = g_detail3_d[g_detail3_idx].pmdt036
               CALL apmp110_fetch_2()
               LET l_imaf015 = ''
               LET l_imaf144 = ''
               SELECT imaf015,imaf144 INTO l_imaf015,l_imaf144 FROM imaf_t
                WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_detail3_d[g_detail3_idx].pmdt006
               #181101-00020#1 add-S
               CALL apmp110_set_required_b()
               CALL apmp110_set_no_required_b()
               #181101-00020#1 add-E
               #[T:料件據點進銷存檔]未設參考單位，參考數量不允許輸入
               IF cl_null(l_imaf015) THEN
                  CALL cl_set_comp_entry("pmdt021,pmdt021_desc,pmdt022",FALSE)
               END IF
               #[T:料件據點進銷存檔]未設計價單位，計價數量不允許輸入
               IF cl_null(l_imaf144) THEN
                  CALL cl_set_comp_entry("pmdt023,pmdt023_desc,pmdt024",FALSE)
               END IF 
               
               #160705-00008#1 20160713 -----(S) 
               LET l_pmam002 = ''
               LET l_pmam003 = ''
               SELECT pmam002,pmam003 INTO l_pmam002,l_pmam003
                 FROM pmam_t
                WHERE pmament = g_enterprise
                  AND pmam001 = g_detail2_d[g_detail2_idx].pmds039

               CALL cl_set_comp_entry("pmdt036",TRUE)
               IF (g_detail3_d[g_detail3_idx].pmdt044 > 0 OR l_pmam002 <> 'Y') AND
                  l_pmam003 <> 'Y' THEN
                  CALL cl_set_comp_entry("pmdt036",FALSE)
               END IF
               #160705-00008#1 20160713 -----(E) 

            AFTER FIELD pmdt022
               IF NOT cl_null(g_detail3_d[g_detail3_idx].pmdt022) THEN
                  IF g_detail3_d[g_detail3_idx].pmdt022 <> g_detail3_d_o.pmdt022 OR cl_null(g_detail3_d_o.pmdt022) THEN
                     IF NOT cl_ap_chk_range(g_detail3_d[g_detail3_idx].pmdt022,"0.000","0","","","azz-00079",1) THEN
                        LET g_detail3_d[g_detail3_idx].pmdt022 = g_detail3_d_o.pmdt022
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
               LET g_detail3_d_o.pmdt022 = g_detail3_d[g_detail3_idx].pmdt022

            AFTER FIELD pmdt046
               IF NOT cl_null(g_detail3_d[g_detail3_idx].pmdt046) THEN
                  IF g_detail3_d[g_detail3_idx].pmdt046 <> g_detail3_d_o.pmdt046 OR cl_null(g_detail3_d_o.pmdt046) THEN
                     CALL s_tax_chk(g_site,g_detail3_d[g_detail3_idx].pmdt046)
                          RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                     IF NOT l_success THEN
                        LET g_detail3_d[g_detail3_idx].pmdt046 = g_detail3_d_o.pmdt046
                        NEXT FIELD CURRENT
                     ELSE
                        LET g_detail3_d[g_detail3_idx].pmdt046_desc = l_oodbl004
                        LET g_detail3_d[g_detail3_idx].pmdt037 = l_oodb006
                     END IF
                     CALL apmp110_get_price()
                  END IF
               END IF
               LET g_detail3_d_o.pmdt046 = g_detail3_d[g_detail3_idx].pmdt046

            AFTER FIELD pmdt024
               IF NOT cl_null(g_detail3_d[g_detail3_idx].pmdt024) THEN
                  IF g_detail3_d[g_detail3_idx].pmdt024 <> g_detail3_d_o.pmdt024 OR cl_null(g_detail3_d_o.pmdt024) THEN
                     IF NOT cl_ap_chk_range(g_detail3_d[g_detail3_idx].pmdt024,"0.000","0","","","azz-00079",1) THEN
                        LET g_detail3_d[g_detail3_idx].pmdt024 = g_detail3_d_o.pmdt024
                        NEXT FIELD CURRENT
                     END IF
                     CALL apmp110_get_price()
                  END IF
               END IF
               LET g_detail3_d_o.pmdt024 = g_detail3_d[g_detail3_idx].pmdt024

            AFTER FIELD pmdt036
               IF NOT cl_null(g_detail3_d[g_detail3_idx].pmdt036) THEN
                  IF g_detail3_d[g_detail3_idx].pmdt036 <> g_detail3_d_o.pmdt036 OR cl_null(g_detail3_d_o.pmdt036) THEN
                     IF NOT cl_ap_chk_range(g_detail3_d[g_detail3_idx].pmdt036,"0.000","0","","","azz-00079",1) THEN
                        LET g_detail3_d[g_detail3_idx].pmdt036 = g_detail3_d_o.pmdt036
                        NEXT FIELD CURRENT
                     END IF
                     IF NOT cl_null(g_detail2_d[g_detail2_idx].pmds039) AND
                        NOT cl_null(g_detail3_d[g_detail3_idx].pmdt042) AND
                        NOT cl_null(g_detail2_d[g_detail2_idx].pmds037) AND
                        NOT cl_null(g_detail3_d[g_detail3_idx].pmdt006) AND
                        NOT cl_null(g_detail3_d[g_detail3_idx].pmdt007) AND
                        NOT cl_null(g_detail3_d[g_detail3_idx].pmdt019) THEN
                        CALL s_purchase_price_check(g_detail2_d[g_detail2_idx].pmds039,g_detail3_d[g_detail3_idx].pmdt036,
                                                    g_detail3_d_o.pmdt036,g_detail3_d[g_detail3_idx].pmdt042,
                                                    g_detail2_d[g_detail2_idx].pmds037,g_detail3_d[g_detail3_idx].pmdt006,
                                                    g_detail3_d[g_detail3_idx].pmdt007,g_detail3_d[g_detail3_idx].pmdt019)
                             RETURNING l_success,g_errno
                        IF NOT l_success THEN
                           INITIALIZE g_errparam TO NULL 
                           LET g_errparam.extend = '' 
                           LET g_errparam.code   = g_errno
                           LET g_errparam.popup  = TRUE
                           CALL cl_err()
                           LET g_detail3_d[g_detail3_idx].pmdt036 = g_detail3_d_o.pmdt036
                           NEXT FIELD CURRENT
                        END IF
                     END IF
                     IF NOT cl_null(g_detail3_d[g_detail3_idx].pmdt046) AND
                        NOT cl_null(g_detail3_d[g_detail3_idx].pmdt020) AND
                        NOT cl_null(g_detail2_d[g_detail2_idx].pmds037) AND
                        NOT cl_null(g_detail2_d[g_detail2_idx].pmds038) THEN
                        CALL s_tax_count(g_site,g_detail3_d[g_detail3_idx].pmdt046,
                                         g_detail3_d[g_detail3_idx].pmdt020*g_detail3_d[g_detail3_idx].pmdt036,
                                         g_detail3_d[g_detail3_idx].pmdt020,g_detail2_d[g_detail2_idx].pmds037,
                                         g_detail2_d[g_detail2_idx].pmds038)
                             RETURNING g_detail3_d[g_detail3_idx].pmdt038,g_detail3_d[g_detail3_idx].pmdt047,
                                       g_detail3_d[g_detail3_idx].pmdt039,l_xrcd113,l_xrcd114,l_xrcd115
                     END IF
                  END IF
               END IF
               LET g_detail3_d_o.pmdt036 = g_detail3_d[g_detail3_idx].pmdt036

            ON ACTION controlp INFIELD pmdt046  #倉退單別
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'i'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_detail3_d[g_detail3_idx].pmdt046
               CALL q_oodb002_2()
               LET g_detail3_d[g_detail3_idx].pmdt046 = g_qryparam.return1
               DISPLAY g_detail3_d[g_detail3_idx].pmdt046 TO pmdt046
               NEXT FIELD pmdt046

            ON ROW CHANGE
               IF INT_FLAG THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = '' 
                  LET g_errparam.code   = 9001 
                  LET g_errparam.popup  = FALSE 
                  CALL cl_err()
                  LET INT_FLAG = 0
                  EXIT DIALOG 
               END IF
               INITIALIZE g_errparam TO NULL 
               UPDATE apmp110_tmp2 SET pmdt022 = g_detail3_d[g_detail3_idx].pmdt022,
                                       pmdt046 = g_detail3_d[g_detail3_idx].pmdt046,
                                       pmdt037 = g_detail3_d[g_detail3_idx].pmdt037,
                                       pmdt024 = g_detail3_d[g_detail3_idx].pmdt024,
                                       pmdt036 = g_detail3_d[g_detail3_idx].pmdt036,
                                       pmdt038 = g_detail3_d[g_detail3_idx].pmdt038,
                                       pmdt039 = g_detail3_d[g_detail3_idx].pmdt039,
                                       pmdt047 = g_detail3_d[g_detail3_idx].pmdt047,
                                       pmdt042 = g_detail3_d[g_detail3_idx].pmdt042,
                                       pmdt043 = g_detail3_d[g_detail3_idx].pmdt043,
                                       pmdt044 = g_detail3_d[g_detail3_idx].pmdt044
                WHERE pmdt006 = g_detail3_d[g_detail3_idx].pmdt006
                  AND pmdt007 = g_detail3_d[g_detail3_idx].pmdt007
                  AND pmdt063 = g_detail3_d[g_detail3_idx].pmdt063
                  AND pmdt016 = g_detail3_d[g_detail3_idx].pmdt016
                  AND pmdt017 = g_detail3_d[g_detail3_idx].pmdt017
                  AND pmdt018 = g_detail3_d[g_detail3_idx].pmdt018
                  AND pmdt019 = g_detail3_d[g_detail3_idx].pmdt019
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_errparam.code   = "std-00009" 
                  WHEN SQLCA.sqlcode #其他錯誤
                     LET g_errparam.code   = SQLCA.sqlcode 
                  OTHERWISE EXIT CASE
               END CASE
               IF NOT cl_null(g_errparam.code) THEN
                  LET g_errparam.extend = "axmp501_tmp" 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
               END IF
               
            AFTER INPUT

         END INPUT

         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_detail4_d TO s_detail4.* ATTRIBUTES(COUNT=g_detail4_cnt)

            BEFORE ROW
               LET g_detail4_idx = DIALOG.getCurrentRow("s_detail4")

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail4_idx)
               LET g_detail4_idx = DIALOG.getCurrentRow("s_detail4")

         END DISPLAY

         #end add-point
 
         BEFORE DIALOG
            IF g_detail_d.getLength() > 0 THEN
               CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
               CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
            ELSE
               CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
               CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
            END IF
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            #add-point:ui_dialog段on action selall name="ui_dialog.selall.befroe"
            
            #end add-point            
            FOR li_idx = 1 TO g_detail_d.getLength()
               LET g_detail_d[li_idx].sel = "Y"
               #add-point:ui_dialog段on action selall name="ui_dialog.for.onaction_selall"
               #ming 20150616 add ----------------------------------(S)  
               #還沒有被寫入temp table的才能處理，否則會有資料重覆寫入的問題 
               IF g_detail_d[li_idx].sel2 = 'N' THEN
                  LET g_detail_d[li_idx].sel2 = 'Y'

                  INSERT INTO apmp110_tmp3
                         VALUES(g_detail_d[li_idx].inaj015,g_detail_d[li_idx].inaj022,
                                g_detail_d[li_idx].inaj001,g_detail_d[li_idx].inaj002,
                                g_detail_d[li_idx].inaj003,g_detail_d[li_idx].inaj005,
                                g_detail_d[li_idx].inaj006,g_detail_d[li_idx].pmds007,
                                g_detail_d[li_idx].inaj011,g_detail_d[li_idx].inaj012,
                                g_detail_d[li_idx].inaj008,g_detail_d[li_idx].inaj009,
                                g_detail_d[li_idx].inaj010)

                  LET l_cnt = ''
                  SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp2
                   WHERE pmdt006 = g_detail_d[li_idx].inaj005
                     AND pmdt007 = g_detail_d[li_idx].inaj006
                     AND pmdt063 = g_detail_d[li_idx].pmds007
                     AND pmdt016 = g_detail_d[li_idx].inaj008
                     AND pmdt017 = g_detail_d[li_idx].inaj009
                     AND pmdt018 = g_detail_d[li_idx].inaj010
                     AND pmdt019 = g_detail_d[li_idx].inaj012
                  IF cl_null(l_cnt) OR l_cnt = 0 THEN
                     #先判斷這個供應商是否有設多個當前採購控制組範圍內的供應商預設條件，則開窗，讓user 選擇帶哪一個控制組的資料
                     INITIALIZE l_pmds.* TO NULL
                     LET l_dept = cl_get_sitename(g_detail_d[li_idx].pmds007) 
                     CALL s_control_get_group('4',g_detail_d[li_idx].pmds007,l_dept)
                          RETURNING l_success,l_controlno
                     IF l_success AND NOT cl_null(l_controlno) THEN
                        SELECT pmal003,pmal004,pmal006,pmal008,pmal020,pmal021,pmal023,pmal024
                          INTO l_pmds.pmds037,l_pmds.pmds033,l_pmds.pmds031,l_pmds.pmds012,
                               l_pmds.pmds032,l_pmds.pmds039,l_pmds.pmds048,l_pmds.pmds049
                          FROM pmal_t
                         WHERE pmalent = g_enterprise
                           AND pmal001 = g_detail_d[li_idx].pmds007
                           AND pmal002 = l_controlno
                           AND pmalstus = 'Y'
                     ELSE
                        SELECT pmab033,pmab034,pmab037,pmab038,pmab053,pmab054,pmab057,pmab058
                          INTO l_pmds.pmds037,l_pmds.pmds033,l_pmds.pmds031,l_pmds.pmds012,
                               l_pmds.pmds032,l_pmds.pmds039,l_pmds.pmds048,l_pmds.pmds049
                          FROM pmab_t
                         WHERE pmabent = g_enterprise
                           AND pmabsite = g_site
                           AND pmab001 = g_detail_d[li_idx].pmds007
                     END IF
                     #稅率、含稅否 
                     IF NOT cl_null(l_pmds.pmds033) THEN
                        CALL s_tax_chk(g_site,l_pmds.pmds033)
                             RETURNING l_success,l_oodbl004,l_pmds.pmds035,l_pmds.pmds034,l_oodb011
                        IF l_oodb011 = '1' THEN     #正常稅率  
                           LET l_imaf017 = l_pmds.pmds033
                           LET l_oodb005 = l_pmds.pmds035
                           LET l_oodb006 = l_pmds.pmds034
                        ELSE                        #依料件設定  
                           LET l_imaf017 = '' 
                           SELECT imaf017 INTO l_imaf017
                             FROM imaf_t
                            WHERE imafent  = g_enterprise
                              AND imafsite = g_site
                              AND imaf001 = g_detail_d[li_idx].inaj005
                           IF NOT cl_null(l_imaf017) THEN
                              CALL s_tax_chk(g_site,l_imaf017)
                                   RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                           END IF
                        END IF
                     END IF

                     #項次 
                     SELECT MAX(pmdtseq) + 1 INTO l_cnt
                       FROM apmp110_tmp2
                      WHERE pmdt063 = g_detail_d[li_idx].pmds007
                     IF cl_null(l_cnt) THEN
                        LET l_cnt = 1
                     END IF

                     #入庫/倉退明細 
                     #INSERT INTO apmp110_tmp2 VALUES(l_cnt,g_detail_d[li_idx].inaj005,  #161207-00053#1-1 mark
                     INSERT INTO apmp110_tmp2 VALUES('',l_cnt,g_detail_d[li_idx].inaj005,  #161207-00053#1-1 add
                          g_detail_d[li_idx].inaj006,g_detail_d[li_idx].pmds007,
                        # g_detail_d[li_idx].inaj012,'0','','0',  #PGS(D)-00902-mark
                          g_detail_d[li_idx].inaj012,0,'',0,      #PGS(D)-00902-add-
                          g_detail_d[li_idx].inaj008,g_detail_d[li_idx].inaj009,
                          g_detail_d[li_idx].inaj010,l_imaf017,l_oodb006,
                         #'','0','0','0','0','0','','','')  #PGS(D)-00902-mark
                          '',0,0,0,0,0,'','',0)            #PGS(D)-00902-add-
                     LET l_cnt = ''                
                     SELECT COUNT(1) INTO l_cnt FROM apmp110_tmp1
                      WHERE pmds007 = g_detail_d[li_idx].pmds007
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        #匯率 
                        CALL apmp110_get_exrate(l_pmds.pmds037,l_pmds.pmds048)
                             RETURNING l_pmds.pmds038
                        #入庫/倉退單據 
                        INSERT INTO apmp110_tmp1(pmds007,pmds031,pmds032,pmds033,pmds034,pmds035,
                                                 pmds037,pmds038,pmds039,pmds048,pmds049,pmds012)
                                          VALUES(g_detail_d[li_idx].pmds007,l_pmds.pmds031,
                                                 l_pmds.pmds032,l_pmds.pmds033,l_pmds.pmds034,l_pmds.pmds035,
                                                 l_pmds.pmds037,l_pmds.pmds038,l_pmds.pmds039,l_pmds.pmds048,
                                                 l_pmds.pmds049,l_pmds.pmds012)
                     END IF
                  END IF
                  CALL apmp110_count(li_idx)
               END IF  
               #ming 20150616 add ----------------------------------(E)  
               #end add-point
            END FOR
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            #ming 20150616 add ------------------(S)  
            CALL apmp110_fetch()
            CALL apmp110_get_price_1()   #161021-00034#1
            #ming 20150616 add ------------------(E)  
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_detail_d.getLength()
               LET g_detail_d[li_idx].sel = "N"
               #add-point:ui_dialog段on action selnone name="ui_dialog.for.onaction_selnone"
               #ming 20150616 add -----------------------------(S) 
               #已經被寫入temp table才需要花時間、效能去處理 
               IF g_detail_d[li_idx].sel2 = 'Y' THEN
                  LET g_detail_d[li_idx].sel2 = 'N'

                  #結算資料清單 
                  DELETE FROM apmp110_tmp3
                   WHERE inaj001 = g_detail_d[li_idx].inaj001     #單據編號  
                     AND inaj002 = g_detail_d[li_idx].inaj002     #項次  
                     AND inaj003 = g_detail_d[li_idx].inaj003     #項序  
                     AND inaj011 = g_detail_d[li_idx].inaj011     #交易數量  

                  LET l_cnt = ''
                  SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp3
                   WHERE inaj005 = g_detail_d[li_idx].inaj005     #料件編號  
                     AND inaj006 = g_detail_d[li_idx].inaj006     #產品特徵  
                     AND inaj007 = g_detail_d[li_idx].pmds007     #庫存管理特徵  
                     AND inaj008 = g_detail_d[li_idx].inaj008     #庫位編號   
                     AND inaj009 = g_detail_d[li_idx].inaj009     #儲位編號  
                     AND inaj010 = g_detail_d[li_idx].inaj010     #批號  
                     AND inaj012 = g_detail_d[li_idx].inaj012     #交易單位  
                  IF cl_null(l_cnt) OR l_cnt = 0 THEN
                     #如果在apmp110_tmp3已無資料的話，就應該把apmp110_tmp2的項目移除 
                     #入庫/倉退明細 
                     DELETE FROM apmp110_tmp2
                      WHERE pmdt006 = g_detail_d[li_idx].inaj005
                        AND pmdt007 = g_detail_d[li_idx].inaj006
                        AND pmdt063 = g_detail_d[li_idx].pmds007
                        AND pmdt016 = g_detail_d[li_idx].inaj008 
                        AND pmdt017 = g_detail_d[li_idx].inaj009
                        AND pmdt018 = g_detail_d[li_idx].inaj010
                        AND pmdt019 = g_detail_d[li_idx].inaj012

                     SELECT COUNT(*) INTO l_cnt
                       FROM apmp110_tmp2
                      WHERE pmdt063 = g_detail_d[li_idx].pmds007
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        #入庫/倉退單據 
                        DELETE FROM apmp110_tmp1
                         WHERE pmds007 = g_detail_d[li_idx].pmds007
                     ELSE
                        CALL apmp110_count(li_idx)
                     END IF
                  ELSE
                     CALL apmp110_count(li_idx)
                  END IF
               END IF
               #ming 20150616 add -----------------------------(E)  
               #end add-point
            END FOR
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            #ming 20150616 add ------------------------------(S)  
            #重新顯示下方的資訊 
            CALL apmp110_fetch()
            CALL apmp110_get_price_1()   #161021-00034#1
            #ming 20150616 add ------------------------------(E)  
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_detail_d[li_idx].sel = "Y"
               END IF
            END FOR
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            #ming 20150616 add ---------------------------(S)             
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  #還沒有被寫入temp table的才能處理，否則會有資料重覆寫入的問題 
                  IF g_detail_d[li_idx].sel2 = 'N' THEN
                     LET g_detail_d[li_idx].sel2 = 'Y'

                     INSERT INTO apmp110_tmp3
                            VALUES(g_detail_d[li_idx].inaj015,g_detail_d[li_idx].inaj022,
                                   g_detail_d[li_idx].inaj001,g_detail_d[li_idx].inaj002,
                                   g_detail_d[li_idx].inaj003,g_detail_d[li_idx].inaj005,
                                   g_detail_d[li_idx].inaj006,g_detail_d[li_idx].pmds007,
                                   g_detail_d[li_idx].inaj011,g_detail_d[li_idx].inaj012,
                                   g_detail_d[li_idx].inaj008,g_detail_d[li_idx].inaj009,
                                   g_detail_d[li_idx].inaj010)

                     LET l_cnt = ''
                     SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp2
                      WHERE pmdt006 = g_detail_d[li_idx].inaj005
                        AND pmdt007 = g_detail_d[li_idx].inaj006
                        AND pmdt063 = g_detail_d[li_idx].pmds007
                        AND pmdt016 = g_detail_d[li_idx].inaj008
                        AND pmdt017 = g_detail_d[li_idx].inaj009
                        AND pmdt018 = g_detail_d[li_idx].inaj010
                        AND pmdt019 = g_detail_d[li_idx].inaj012
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        #先判斷這個供應商是否有設多個當前採購控制組範圍內的供應商預設條件，則開窗，讓user 選擇帶哪一個控制組的資料
                        INITIALIZE l_pmds.* TO NULL
                        LET l_dept = cl_get_sitename(g_detail_d[li_idx].pmds007) 
                        CALL s_control_get_group('4',g_detail_d[li_idx].pmds007,l_dept)
                             RETURNING l_success,l_controlno
                        IF l_success AND NOT cl_null(l_controlno) THEN
                           SELECT pmal003,pmal004,pmal006,pmal008,pmal020,pmal021,pmal023,pmal024
                             INTO l_pmds.pmds037,l_pmds.pmds033,l_pmds.pmds031,l_pmds.pmds012,
                                  l_pmds.pmds032,l_pmds.pmds039,l_pmds.pmds048,l_pmds.pmds049
                             FROM pmal_t
                            WHERE pmalent = g_enterprise
                              AND pmal001 = g_detail_d[li_idx].pmds007
                              AND pmal002 = l_controlno
                              AND pmalstus = 'Y'
                        ELSE
                           SELECT pmab033,pmab034,pmab037,pmab038,pmab053,pmab054,pmab057,pmab058
                             INTO l_pmds.pmds037,l_pmds.pmds033,l_pmds.pmds031,l_pmds.pmds012,
                                  l_pmds.pmds032,l_pmds.pmds039,l_pmds.pmds048,l_pmds.pmds049
                             FROM pmab_t
                            WHERE pmabent = g_enterprise
                              AND pmabsite = g_site
                              AND pmab001 = g_detail_d[li_idx].pmds007
                        END IF
                        #稅率、含稅否 
                        IF NOT cl_null(l_pmds.pmds033) THEN
                           CALL s_tax_chk(g_site,l_pmds.pmds033)
                                RETURNING l_success,l_oodbl004,l_pmds.pmds035,l_pmds.pmds034,l_oodb011
                           IF l_oodb011 = '1' THEN     #正常稅率  
                              LET l_imaf017 = l_pmds.pmds033
                              LET l_oodb005 = l_pmds.pmds035 
                              LET l_oodb006 = l_pmds.pmds034
                           ELSE                        #依料件設定  
                              LET l_imaf017 = ''
                              SELECT imaf017 INTO l_imaf017
                                FROM imaf_t
                               WHERE imafent  = g_enterprise
                                 AND imafsite = g_site
                                 AND imaf001 = g_detail_d[li_idx].inaj005
                              IF NOT cl_null(l_imaf017) THEN
                                 CALL s_tax_chk(g_site,l_imaf017)
                                      RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
                              END IF
                           END IF
                        END IF

                        #項次 
                        SELECT MAX(pmdtseq) + 1 INTO l_cnt
                          FROM apmp110_tmp2
                         WHERE pmdt063 = g_detail_d[li_idx].pmds007
                        IF cl_null(l_cnt) THEN
                           LET l_cnt = 1
                        END IF

                        #入庫/倉退明細 
                        #INSERT INTO apmp110_tmp2 VALUES(l_cnt,g_detail_d[li_idx].inaj005, #161207-00053#1-1 mark
                        INSERT INTO apmp110_tmp2 VALUES('',l_cnt,g_detail_d[li_idx].inaj005, #161207-00053#1-1 add
                             g_detail_d[li_idx].inaj006,g_detail_d[li_idx].pmds007,
                            #g_detail_d[li_idx].inaj012,'0','','0',  #PGS(D)-00902-mark
                             g_detail_d[li_idx].inaj012,0,'',0,      #PGS(D)-00902-add
                             g_detail_d[li_idx].inaj008,g_detail_d[li_idx].inaj009,
                             g_detail_d[li_idx].inaj010,l_imaf017,l_oodb006, 
                           # '','0','0','0','0','0','','','')   #PGS(D)-00902-mark
                             '',0,0,0,0,0,'','',0)             #PGS(D)-00902-add
                        LET l_cnt = ''
                        SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp1
                         WHERE pmds007 = g_detail_d[li_idx].pmds007
                        IF cl_null(l_cnt) OR l_cnt = 0 THEN
                           #匯率 
                           CALL apmp110_get_exrate(l_pmds.pmds037,l_pmds.pmds048)
                                RETURNING l_pmds.pmds038
                           #入庫/倉退單據 
                           INSERT INTO apmp110_tmp1(pmds007,pmds031,pmds032,pmds033,pmds034,pmds035,
                                                    pmds037,pmds038,pmds039,pmds048,pmds049,pmds012)
                                             VALUES(g_detail_d[li_idx].pmds007,l_pmds.pmds031,
                                                    l_pmds.pmds032,l_pmds.pmds033,l_pmds.pmds034,l_pmds.pmds035,
                                                    l_pmds.pmds037,l_pmds.pmds038,l_pmds.pmds039,l_pmds.pmds048,
                                                    l_pmds.pmds049,l_pmds.pmds012)
                        END IF
                     END IF
                     CALL apmp110_count(li_idx)
                  END IF
               END IF
            END FOR

            CALL apmp110_fetch()
            CALL apmp110_get_price_1()   #161021-00034#1
            #ming 20150616 add ---------------------------(E)   
            
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_detail_d[li_idx].sel = "N"
               END IF
            END FOR
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            #ming 20150616 add ----------------------------(S)  
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  #如果是已經被寫入temp table的，才花時間、效能去處理 
                  IF g_detail_d[li_idx].sel2 = 'Y' THEN
                     LET g_detail_d[li_idx].sel2 = 'N'

                     #結算資料清單 
                     DELETE FROM apmp110_tmp3
                      WHERE inaj001 = g_detail_d[li_idx].inaj001     #單據編號  
                        AND inaj002 = g_detail_d[li_idx].inaj002     #項次  
                        AND inaj003 = g_detail_d[li_idx].inaj003     #項序  
                        AND inaj011 = g_detail_d[li_idx].inaj011     #交易數量  

                     LET l_cnt = ''
                     SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp3
                      WHERE inaj005 = g_detail_d[li_idx].inaj005     #料件編號  
                        AND inaj006 = g_detail_d[li_idx].inaj006     #產品特徵  
                        AND inaj007 = g_detail_d[li_idx].pmds007     #庫存管理特徵  
                        AND inaj008 = g_detail_d[li_idx].inaj008     #庫位編號   
                        AND inaj009 = g_detail_d[li_idx].inaj009     #儲位編號  
                        AND inaj010 = g_detail_d[li_idx].inaj010     #批號  
                        AND inaj012 = g_detail_d[li_idx].inaj012     #交易單位  
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        #如果在apmp110_tmp3已無資料的話，就應該把apmp110_tmp2的項目移除 
                        #入庫/倉退明細 
                        DELETE FROM apmp110_tmp2
                         WHERE pmdt006 = g_detail_d[li_idx].inaj005
                           AND pmdt007 = g_detail_d[li_idx].inaj006 
                           AND pmdt063 = g_detail_d[li_idx].pmds007
                           AND pmdt016 = g_detail_d[li_idx].inaj008
                           AND pmdt017 = g_detail_d[li_idx].inaj009
                           AND pmdt018 = g_detail_d[li_idx].inaj010
                           AND pmdt019 = g_detail_d[li_idx].inaj012

                        SELECT COUNT(*) INTO l_cnt
                          FROM apmp110_tmp2
                         WHERE pmdt063 = g_detail_d[li_idx].pmds007
                        IF cl_null(l_cnt) OR l_cnt = 0 THEN
                           #入庫/倉退單據 
                           DELETE FROM apmp110_tmp1
                            WHERE pmds007 = g_detail_d[li_idx].pmds007
                        ELSE
                           CALL apmp110_count(li_idx)
                        END IF
                     ELSE
                        CALL apmp110_count(li_idx)
                     END IF
                  END IF
               END IF
            END FOR

            CALL apmp110_fetch()
            CALL apmp110_get_price_1()   #161021-00034#1
            #ming 20150616 add ----------------------------(E)  
            #end add-point
      
         ON ACTION filter
            LET g_action_choice="filter"
            CALL apmp110_filter()
            #add-point:ON ACTION filter name="menu.filter"
            
            #END add-point
            EXIT DIALOG
      
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice = "exit"
            EXIT DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG
 
         ON ACTION accept
            #add-point:ui_dialog段accept之前 name="menu.filter"
            
            #end add-point
            CALL apmp110_query()
             
         # 條件清除
         ON ACTION qbeclear
            #add-point:ui_dialog段 name="ui_dialog.qbeclear"
            
            #end add-point
 
         # 重新整理
         ON ACTION datarefresh
            LET g_error_show = 1
            #add-point:ui_dialog段datarefresh name="ui_dialog.datarefresh"
            
            #end add-point
            CALL apmp110_b_fill()
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"

         ON ACTION batch_execute
            #181101-00020#1 add-S
            SELECT COUNT(*) INTO l_cnt1 FROM apmp110_tmp1
             WHERE pmds000 = '4'  #收貨入庫單
            SELECT COUNT(*) INTO l_cnt2 FROM apmp110_tmp1
             WHERE pmds000 = '7'  #採購倉退單
            #181101-00020#1 add-E
            #在產生單據前需檢核畫面左邊查詢條件區塊的入庫單別、入庫理由碼、倉退單別、倉退理由碼是否有維護，
            #若沒有則顯示訊息告知需維護
#            IF cl_null(tm.pmdtdocno1) THEN   #181101-00020#1 mark
            IF cl_null(tm.pmdtdocno1) AND l_cnt1 > 0 THEN   #181101-00020#1 mod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'apm-00603'
               LET g_errparam.extend = 'pmdtdocno'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               NEXT FIELD pmdtdocno1
            END IF
#            IF cl_null(tm.pmdtdocno2) THEN   #181101-00020#1 mark
            IF cl_null(tm.pmdtdocno2) AND l_cnt2 > 0 THEN   #181101-00020#1 mod
               INITIALIZE g_errparam TO NULL
               #ming 20150617 modify ----------------(S) 
               #LET g_errparam.code = 'apm-00603'
               LET g_errparam.code = 'apm-00957'     #倉退單別未輸入 
               #ming 20150617 modify ----------------(E) 
               LET g_errparam.extend = 'pmdtdocno'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               NEXT FIELD pmdtdocno2
            END IF
            LET l_cnt = ''
            SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp3
            IF cl_null(l_cnt) OR l_cnt = 0 THEN
               CALL cl_ask_pressanykey('-400')
               NEXT FIELD b_sel
            END IF
            IF apmp110_data_chk() THEN
               CALL apmp110_process()
            END IF

         #end add-point
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:22) ---start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:22) --- end ---
 
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #(ver:22) ---start---
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         #(ver:22) --- end ---
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="apmp110.query" type="s" >}
#+ QBE資料查詢
PRIVATE FUNCTION apmp110_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      STRING
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define name="query.define"
   
   #end add-point 
    
   #add-point:cs段after_construct name="query.after_construct"
   IF g_flag = '0' THEN
      IF NOT cl_ask_confirm('apm-00610') THEN
         RETURN
      END IF   
   END IF   

   LET g_flag = '1'
   DELETE FROM apmp110_tmp1
   DELETE FROM apmp110_tmp2
   DELETE FROM apmp110_tmp3
   
   #end add-point
        
   LET g_error_show = 1
   CALL apmp110_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
 
   END IF
   
   #add-point:cs段after_query name="query.cs_after_query"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="apmp110.b_fill" type="s" >}
#+ 單身陣列填充
PRIVATE FUNCTION apmp110_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_sqladdon_t   STRING    #200917-00047
   #add-point:b_fill段define name="b_fill.define"
   
   #end add-point
 
   #200917-00047 -S-
   #檢查後加入，避免疊加 (代追單)
  #LET g_wc = g_wc, cl_sql_auth_filter()   #(ver:21) add cl_sql_auth_filter()   #200917-00047 mark
 
   LET ls_sqladdon_t = cl_sql_auth_filter()
   IF NOT g_wc.getIndexOf(ls_sqladdon_t,1) THEN
      LET g_wc = g_wc, ls_sqladdon_t   #200917-00047
   END IF
   #200917-00047 -E-
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   #161207-00053#1-2 add--s
   DELETE FROM apmp110_tmp1
   DELETE FROM apmp110_tmp2
   DELETE FROM apmp110_tmp3
   #161207-00053#1-2 add--e

   #未結算的VMI交易資料
   LET g_sql = " SELECT 'N','N',gzzal003,inaj022,inaj001,inaj002,inaj003,inaj005,imaal003,imaal004,inaj006, ",
               "        inaj007,'',(inaj011*inaj004),inaj012,oocal003,inaj008,inayl003,inaj009,inab003,inaj010 ",
               "   FROM inaj_t ",
               "        LEFT OUTER JOIN gzzal_t ON gzzal001 = inaj015 AND gzzal002 = '",g_dlang,"' ",
               "        LEFT OUTER JOIN imaal_t ON imaalent = inajent AND imaal001 = inaj005 AND imaal002 = '",g_dlang,"' ",
               "        LEFT OUTER JOIN oocal_t ON oocalent = inajent AND oocal001 = inaj012 AND oocal002 = '",g_dlang,"' ",
               "        LEFT OUTER JOIN inayl_t ON inaylent = inajent AND inayl001 = inaj008 AND inayl002 = '",g_dlang,"' ",
               "        LEFT OUTER JOIN inab_t ON inabent = inajent AND inabsite = inajsite AND inab001 = inaj008 AND inab002 = inaj009 ",
               "  WHERE inajent = ? AND inajsite = '",g_site,"' AND inaj030 = '1' AND TRIM(inaj007) IS NOT NULL ",
               "    AND ",g_wc CLIPPED,  
               "  ORDER BY inaj001,inaj002,inaj003 "

   #end add-point
 
   PREPARE apmp110_sel FROM g_sql
   DECLARE b_fill_curs CURSOR FOR apmp110_sel
   
   CALL g_detail_d.clear()
   #add-point:b_fill段其他頁簽清空 name="b_fill.clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
   #180816-00028#1 -S-
   FOREACH b_fill_curs USING g_enterprise 
   #add-point:b_fill段foreach_using name="b_fill.foreach_using"
   
   #end add-point
   INTO 
   #180816-00028#1 -E-
   #add-point:b_fill段foreach_into name="b_fill.foreach_into"
    g_detail_d[l_ac].sel,g_detail_d[l_ac].sel2,g_detail_d[l_ac].inaj015,g_detail_d[l_ac].inaj022,
    g_detail_d[l_ac].inaj001,g_detail_d[l_ac].inaj002,g_detail_d[l_ac].inaj003,
    g_detail_d[l_ac].inaj005,g_detail_d[l_ac].inaj005_desc,g_detail_d[l_ac].inaj005_desc_desc,
    g_detail_d[l_ac].inaj006,g_detail_d[l_ac].inaj007,g_detail_d[l_ac].pmds007,
    g_detail_d[l_ac].inaj011,g_detail_d[l_ac].inaj012,g_detail_d[l_ac].inaj012_desc,
    g_detail_d[l_ac].inaj008,g_detail_d[l_ac].inaj008_desc,
    g_detail_d[l_ac].inaj009,g_detail_d[l_ac].inaj009_desc,g_detail_d[l_ac].inaj010

   #end add-point
   
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #add-point:b_fill段資料填充 name="b_fill.foreach_iside"
      LET g_detail_d[l_ac].pmds007 = g_detail_d[l_ac].inaj007
      #end add-point
      
      CALL apmp110_detail_show()      
 
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend =  "" 
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
 
         END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.other_table"
   CALL g_detail_d.deleteElement(g_detail_d.getLength())
   IF (l_ac - 1) > 0 THEN
      LET g_master_idx = 1
   END IF

   #end add-point
    
   LET g_detail_cnt = l_ac - 1 
   DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE apmp110_sel
   
   LET l_ac = 1
   CALL apmp110_fetch()
   #add-point:b_fill段資料填充(其他單身) name="b_fill.after_b_fill"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="apmp110.fetch" type="s" >}
#+ 單身陣列填充2
PRIVATE FUNCTION apmp110_fetch()
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:fetch段define name="fetch.define"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   #add-point:單身填充後 name="fetch.after_fill"
   IF cl_null(g_master_idx) OR g_master_idx = 0 THEN
      RETURN
   END IF

   LET g_sql = " SELECT pmds000,pmds007,'',pmds031,'',pmds032,'',pmds033,'',pmds034, ",
               "        pmds035,pmds037,'',pmds038,pmds039,'',pmds048,pmds049,pmds012 ",
               "   FROM apmp110_tmp1 ",
               "  WHERE pmds000 IS NOT NULL ",  #200408-00071#1 add
               "  ORDER BY pmds000 "

   PREPARE apmp110_tmp1 FROM g_sql
   DECLARE tmp1_curs CURSOR FOR apmp110_tmp1
   
   CALL g_detail2_d.clear()
 
   LET l_ac = 1 
 
   FOREACH tmp1_curs INTO 
      g_detail2_d[l_ac].pmds000,g_detail2_d[l_ac].pmds007,g_detail2_d[l_ac].pmds007_desc,
      g_detail2_d[l_ac].pmds031,g_detail2_d[l_ac].pmds031_desc,
      g_detail2_d[l_ac].pmds032,g_detail2_d[l_ac].pmds032_desc,
      g_detail2_d[l_ac].pmds033,g_detail2_d[l_ac].pmds033_desc,
      g_detail2_d[l_ac].pmds034,g_detail2_d[l_ac].pmds035,
      g_detail2_d[l_ac].pmds037,g_detail2_d[l_ac].pmds037_desc,
      g_detail2_d[l_ac].pmds038,g_detail2_d[l_ac].pmds039,g_detail2_d[l_ac].pmds039_desc,
      g_detail2_d[l_ac].pmds048,g_detail2_d[l_ac].pmds049,g_detail2_d[l_ac].pmds012
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      CALL s_desc_get_trading_partner_abbr_desc(g_detail2_d[l_ac].pmds007) RETURNING g_detail2_d[l_ac].pmds007_desc
      
      CALL s_desc_get_ooib002_desc(g_detail2_d[l_ac].pmds031) RETURNING g_detail2_d[l_ac].pmds031_desc
      
      CALL s_desc_get_acc_desc('238',g_detail2_d[l_ac].pmds032) RETURNING g_detail2_d[l_ac].pmds032_desc
      
      CALL s_desc_get_tax_desc1(g_site,g_detail2_d[l_ac].pmds033) RETURNING g_detail2_d[l_ac].pmds033_desc
      
      CALL s_desc_get_currency_desc(g_detail2_d[l_ac].pmds037) RETURNING g_detail2_d[l_ac].pmds037_desc
      
      CALL s_desc_get_price_type_desc(g_detail2_d[l_ac].pmds039) RETURNING g_detail2_d[l_ac].pmds039_desc

      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend =  "" 
            LET g_errparam.code   =  9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
          END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   
   CALL g_detail2_d.deleteElement(g_detail2_d.getLength())
   IF (l_ac - 1) > 0 THEN
      LET g_detail2_idx = 1
   END IF
    
   LET g_detail2_cnt = l_ac - 1

   CLOSE tmp1_curs
   FREE apmp110_tmp1

   CALL apmp110_fetch_1()

   #end add-point 
   
   LET l_ac = li_ac
   
END FUNCTION
 
{</section>}
 
{<section id="apmp110.detail_show" type="s" >}
#+ 顯示相關資料
PRIVATE FUNCTION apmp110_detail_show()
   #add-point:show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define name="detail_show.define"
   
   #end add-point
   
   #add-point:detail_show段 name="detail_show.detail_show"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="apmp110.filter" type="s" >}
#+ filter過濾功能
PRIVATE FUNCTION apmp110_filter()
   #add-point:filter段define(客製用) name="filter.define_customerization"
   
   #end add-point    
   #add-point:filter段define name="filter.define"
   
   #end add-point
   
   DISPLAY ARRAY g_detail_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
      ON UPDATE
 
   END DISPLAY
 
   LET l_ac = 1
   LET g_detail_cnt = 1
   #add-point:filter段define name="filter.detail_cnt"
   
   #end add-point    
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter
   LET g_wc_t = g_wc
   
   LET g_wc = cl_replace_str(g_wc, g_wc_filter, '')
   
   CALL apmp110_b_fill()
   
END FUNCTION
 
{</section>}
 
{<section id="apmp110.filter_parser" type="s" >}
#+ filter欄位解析
PRIVATE FUNCTION apmp110_filter_parser(ps_field)
   #add-point:filter段define(客製用) name="filter_parser.define_customerization"
   
   #end add-point    
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define name="filter_parser.define"
   
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
 
{<section id="apmp110.filter_show" type="s" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION apmp110_filter_show(ps_field,ps_object)
   DEFINE ps_field         STRING
   DEFINE ps_object        STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
 
   LET ls_name = "formonly.", ps_object
 
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = apmp110_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="apmp110.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 異動匯總數量及單據性質
# Memo...........:
# Usage..........: CALL apmp110_count(p_idx)
# Input parameter: p_idx
# Return code....: no
# Date & Author..: 140825 By whiteny
# Modify.........: #161021-00034#1 新增p_idx取代g_master_idx
################################################################################
PRIVATE FUNCTION apmp110_count(p_idx)
DEFINE p_idx      LIKE type_t.num5
DEFINE l_success  LIKE type_t.num5
DEFINE l_pmdt  RECORD
    pmdt020  LIKE pmdt_t.pmdt020,
    pmdt021  LIKE pmdt_t.pmdt021,
    pmdt022  LIKE pmdt_t.pmdt022,
    pmdt023  LIKE pmdt_t.pmdt023,
    pmdt024  LIKE pmdt_t.pmdt024
            END RECORD
DEFINE l_pmdt020   LIKE pmdt_t.pmdt020  #161207-00053#1-1 add
DEFINE l_pmdt000_s LIKE pmds_t.pmds000  #161207-00053#1-1 add
DEFINE l_cnt1      LIKE type_t.num10    #161207-00053#1-1 add
DEFINE l_cnt2      LIKE type_t.num10    #161207-00053#1-1 add
DEFINE l_sql       STRING               #PGS(D)-00902-add-

   INITIALIZE l_pmdt.* TO NULL
   #數量是已經是針對相同料件編號、產品特徵、庫存管理特徵、單位、庫位、儲位、批號進行加總後的值
   SELECT SUM(inaj011) INTO l_pmdt.pmdt020 FROM apmp110_tmp3
    WHERE inaj005 = g_detail_d[p_idx].inaj005  #料
      AND inaj006 = g_detail_d[p_idx].inaj006  #产品特征
      AND inaj007 = g_detail_d[p_idx].pmds007  #库存管理特征-供应商
      AND inaj008 = g_detail_d[p_idx].inaj008  #库
      AND inaj009 = g_detail_d[p_idx].inaj009  #储位
      AND inaj010 = g_detail_d[p_idx].inaj010  #批号
      AND inaj012 = g_detail_d[p_idx].inaj012  #单位
   IF cl_null(l_pmdt.pmdt020) THEN LET l_pmdt.pmdt020 = 0 END IF
   LET l_pmdt000_s = '7'  #161207-00053#1-1 add 采购仓退
   IF l_pmdt.pmdt020 < 0 THEN
      LET l_pmdt.pmdt020 = l_pmdt.pmdt020 * (-1)
      LET l_pmdt000_s = '4'  #161207-00053#1-1 add 收货入库
   END IF
   #181101-00020#1 add-S
   IF l_pmdt.pmdt020 = 0 THEN
      LET l_pmdt000_s = NULL
   END IF
   #181101-00020#1 add-E
   #料件據點進銷存檔設置的參考單位、採購計價單位
   SELECT imaf015,imaf144 INTO l_pmdt.pmdt021,l_pmdt.pmdt023 FROM imaf_t
    WHERE imafent = g_enterprise AND imafsite = g_site
      AND imaf001 = g_detail_d[p_idx].inaj005
   #參考數量由交易數量乘上交易單位與參考單位的換算率做預設
   IF NOT cl_null(l_pmdt.pmdt021) THEN
      CALL s_aooi250_convert_qty(g_detail_d[p_idx].inaj005,g_detail_d[p_idx].inaj012,
                                 l_pmdt.pmdt021,l_pmdt.pmdt020)
           RETURNING l_success,l_pmdt.pmdt022
   END IF
   #計價數量由交易數量乘上交易單位與計價單位的換算率做預設
   IF NOT cl_null(l_pmdt.pmdt023) THEN
      CALL s_aooi250_convert_qty(g_detail_d[p_idx].inaj005,g_detail_d[p_idx].inaj012,
                                 l_pmdt.pmdt023,l_pmdt.pmdt020)
           RETURNING l_success,l_pmdt.pmdt024
   END IF
   #190328-00053#1---add---begin---
   #未使用採購計價單位,則賦值當前的交易單位和數量
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0019') = "N" THEN
      #191108-00009#1 mark(s)
      #LET l_pmdt.pmdt022 = l_pmdt.pmdt020
      #LET l_pmdt.pmdt023 = l_pmdt.pmdt021
      #191108-00009#1 mark(e)
      #191108-00009#1 add(s)
      LET l_pmdt.pmdt023 = g_detail_d[p_idx].inaj012
      LET l_pmdt.pmdt024 = l_pmdt.pmdt020
      #191108-00009#1 add(e)
   END IF   
   #190328-00053#1---add----end----
   UPDATE apmp110_tmp2 SET pmdt020  = l_pmdt.pmdt020,
                           pmdt021  = l_pmdt.pmdt021,
                           pmdt022  = l_pmdt.pmdt022,
                           pmdt023  = l_pmdt.pmdt023,
                           pmdt024  = l_pmdt.pmdt024,
                           pmdt000_s= l_pmdt000_s  #161207-00053#1-1 add
    WHERE pmdt006 = g_detail_d[p_idx].inaj005
      AND pmdt007 = g_detail_d[p_idx].inaj006
      AND pmdt063 = g_detail_d[p_idx].pmds007
      AND pmdt016 = g_detail_d[p_idx].inaj008
      AND pmdt017 = g_detail_d[p_idx].inaj009
      AND pmdt018 = g_detail_d[p_idx].inaj010
      AND pmdt019 = g_detail_d[p_idx].inaj012
   
   #161207-00053#1-1 mod--s 重新处理apmp110_tmp1的pmds000的逻辑
   #                      如果同一个供应商，不同料，不同方向，则应该再产生一笔apmp110_tmp1的，否则同个供应商
   #                      A料是负数，B料是整数，那么都会产生仓退或者采购入库，应该各自产生各自方向的
   #LET l_pmdt.pmdt020 = ''
   #SELECT SUM(inaj011) INTO l_pmdt.pmdt020 FROM apmp110_tmp3
   # WHERE inaj007 = g_detail_d[p_idx].pmds007
   ##匯總後的數量若是小於0則代表要產生對應的收貨入庫單
   #IF l_pmdt.pmdt020 < 0 THEN
   #   UPDATE apmp110_tmp1 SET pmds000 = '4'
   #    WHERE pmds007 = g_detail_d[p_idx].pmds007
   ##反之若匯總後數量為正時則要產生採購倉退單
   #ELSE
   #   UPDATE apmp110_tmp1 SET pmds000 = '7'
   #    WHERE pmds007 = g_detail_d[p_idx].pmds007
   #END IF
   #检查同个供应商，不同料，是否有不同方向的情况
   #现有汇总数量大于0的料:l_cnt1
   SELECT COUNT(*) INTO l_cnt1
     FROM ( SELECT inaj005,inaj006,inaj008,inaj009,inaj010,inaj012,SUM(inaj011) FROM apmp110_tmp3
            WHERE inaj007 = g_detail_d[p_idx].pmds007
            GROUP BY inaj005,inaj006,inaj008,inaj009,inaj010,inaj012  #料件编号，产品特征，库，储，批，单位
           HAVING SUM(inaj011) > 0 
          ) t51  #PGS(D)-00902 add-
   #现有汇总数量小于0的料:l_cnt2
   SELECT COUNT(*) INTO l_cnt2
     FROM ( SELECT inaj005,inaj006,inaj008,inaj009,inaj010,inaj012,SUM(inaj011) FROM apmp110_tmp3
            WHERE inaj007 = g_detail_d[p_idx].pmds007
            GROUP BY inaj005,inaj006,inaj008,inaj009,inaj010,inaj012  #料件编号，产品特征，库，储，批，单位
           HAVING SUM(inaj011) < 0 
          ) t52  #PGS(D)-00902 add-
#   UPDATE apmp110_tmp1 SET pmds000 = ''   #181101-00020#1 mark
   UPDATE apmp110_tmp1 SET pmds000 = NULL #181101-00020#1 mod
    WHERE pmds007 = g_detail_d[p_idx].pmds007  #供应商编号
   CASE
      WHEN l_cnt2 > 0 AND l_cnt1 = 0   #一笔收货入库
           UPDATE apmp110_tmp1 SET pmds000 = '4'
            WHERE pmds007 = g_detail_d[p_idx].pmds007  #供应商编号
              AND (pmds000 = '' OR pmds000 IS NULL)
              AND ROWNUM  = 1
           #PGS(D)-00902 add-s-
           #PGS(D)-00902 add-e-
      WHEN l_cnt1 > 0 AND l_cnt2 = 0   #一笔采购仓退
           UPDATE apmp110_tmp1 SET pmds000 = '7'
            WHERE pmds007 = g_detail_d[p_idx].pmds007  #供应商编号
              AND (pmds000 = '' OR pmds000 IS NULL)
              AND ROWNUM  = 1
            #PGS(D)-00902 add-s-
           #PGS(D)-00902 add-e-
      WHEN l_cnt1 > 0 AND l_cnt2 > 0   #一笔收货入库和一笔采购仓退
           UPDATE apmp110_tmp1 SET pmds000 = '4'
            WHERE pmds007 = g_detail_d[p_idx].pmds007  #供应商编号
              AND (pmds000 = '' OR pmds000 IS NULL)
              AND ROWNUM  = 1
           UPDATE apmp110_tmp1 SET pmds000 = '7'
            WHERE pmds007 = g_detail_d[p_idx].pmds007  #供应商编号
              AND (pmds000 = '' OR pmds000 IS NULL)
              AND ROWNUM  = 1
           #PGS(D)-00902 add-s-
           #PGS(D)-00902 add-e-

           #按前后逻辑看默认至少会有一笔的，如果第二笔更新没成功则要复制一笔出来
           IF SQLCA.sqlerrd[3]=0 THEN
              INSERT INTO apmp110_tmp1(pmds000,pmds007,pmds031,pmds032,pmds033,pmds034,pmds035,pmds037,pmds038,pmds039,pmds048,pmds049,pmds012)
                SELECT '7',pmds007,pmds031,pmds032,pmds033,pmds034,pmds035,pmds037,pmds038,pmds039,pmds048,pmds049,pmds012
                  FROM apmp110_tmp1
                 WHERE pmds007 = g_detail_d[p_idx].pmds007  #供应商编号
                   AND pmds000 = '4'
           END IF
   END CASE
   #181101-00020#1 mark-S 不将互相抵消的单头删去
#   #删除多余的
#   DELETE FROM apmp110_tmp1
#    WHERE pmds007 = g_detail_d[p_idx].pmds007  #供应商编号
#      AND pmds000 = ''  
   #181101-00020#1 mark-E
   #161207-00053#1-1 mod--e
END FUNCTION

################################################################################
# Descriptions...: 取匯率
# Memo...........:
# Usage..........: CALL apmp110_get_exrate(p_pmds037,p_pmds048)
#                  RETURNING r_pmds038
# Input parameter: p_pmds037   幣別
#                : p_pmds048   內外購
# Return code....: r_pmds038   匯率
# Date & Author..: 140825 By whitney
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_get_exrate(p_pmds037,p_pmds048)
DEFINE p_pmds037  LIKE pmds_t.pmds037
DEFINE p_pmds048  LIKE pmds_t.pmds048
DEFINE r_pmds038  LIKE pmds_t.pmds038
DEFINE l_scc40    LIKE type_t.chr2

   IF NOT cl_null(p_pmds037) THEN
      #根據內外購獲取當前營運據點參數設置的汇率类型
      LET l_scc40 = ''
      CASE p_pmds048
         WHEN '1'    #內購
            LET l_scc40 = cl_get_para(g_enterprise,g_site,'S-BAS-0014')
         WHEN '2'    #外購
            LET l_scc40 = cl_get_para(g_enterprise,g_site,'S-BAS-0015')
         OTHERWISE EXIT CASE
      END CASE
      IF NOT cl_null(l_scc40) THEN
         CALL s_aooi160_get_exrate('1',g_site,g_today,p_pmds037,g_ooef016,0,l_scc40) RETURNING r_pmds038
      END IF
   END IF

   RETURN r_pmds038

END FUNCTION

################################################################################
# Descriptions...: 收貨/倉退明細
# Memo...........:
# Usage..........: CALL apmp110_fetch_1()
# Input parameter: no
# Return code....: no
# Date & Author..: 140825 By whiteny
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_fetch_1()
 
   DEFINE li_ac           LIKE type_t.num5
   
   LET li_ac = l_ac 
   
   IF cl_null(g_detail2_idx) OR g_detail2_idx = 0 THEN
      RETURN
   END IF

   LET g_sql = " SELECT pmdtseq,pmdt006,'','',pmdt007,pmdt063,pmdt019,'',pmdt020,pmdt021, ",
               "        '',pmdt022,pmdt016,'',pmdt017,'',pmdt018,pmdt046,'',pmdt037, ",
               "        pmdt023,'',pmdt024,pmdt036,pmdt038,pmdt039,pmdt047,pmdt042,pmdt043,pmdt044 ",
               "   FROM apmp110_tmp2 ",
               "  WHERE pmdt063 = ? ",
#               "    AND pmdt000_s = ? ",  #161207-00053#1-1 add   #181101-00020#1 mark
               "    AND (NVL(pmdt000_s,' ') = NVL(?,' '))",   #181101-00020#1 mod
               "  ORDER BY pmdtseq "

   PREPARE apmp110_tmp2 FROM g_sql
   DECLARE tmp2_curs CURSOR FOR apmp110_tmp2
   
   CALL g_detail3_d.clear()
 
   LET l_ac = 1
 
   FOREACH tmp2_curs USING g_detail2_d[g_detail2_idx].pmds007,g_detail2_d[g_detail2_idx].pmds000 INTO  #161207-00053#1-1 mod add pmds000
      g_detail3_d[l_ac].pmdtseq,g_detail3_d[l_ac].pmdt006,g_detail3_d[l_ac].pmdt006_desc,g_detail3_d[l_ac].pmdt006_desc_desc,
      g_detail3_d[l_ac].pmdt007,g_detail3_d[l_ac].pmdt063,g_detail3_d[l_ac].pmdt019,g_detail3_d[l_ac].pmdt019_desc,
      g_detail3_d[l_ac].pmdt020,g_detail3_d[l_ac].pmdt021,g_detail3_d[l_ac].pmdt021_desc,g_detail3_d[l_ac].pmdt022,
      g_detail3_d[l_ac].pmdt016,g_detail3_d[l_ac].pmdt016_desc,g_detail3_d[l_ac].pmdt017,g_detail3_d[l_ac].pmdt017_desc,
      g_detail3_d[l_ac].pmdt018,g_detail3_d[l_ac].pmdt046,g_detail3_d[l_ac].pmdt046_desc,
      g_detail3_d[l_ac].pmdt037,g_detail3_d[l_ac].pmdt023,g_detail3_d[l_ac].pmdt023_desc,
      g_detail3_d[l_ac].pmdt024,g_detail3_d[l_ac].pmdt036,g_detail3_d[l_ac].pmdt038,g_detail3_d[l_ac].pmdt039,
      g_detail3_d[l_ac].pmdt047,g_detail3_d[l_ac].pmdt042,g_detail3_d[l_ac].pmdt043,g_detail3_d[l_ac].pmdt044
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      CALL s_desc_get_item_desc(g_detail3_d[l_ac].pmdt006) RETURNING g_detail3_d[l_ac].pmdt006_desc,g_detail3_d[l_ac].pmdt006_desc_desc
      
      CALL s_desc_get_unit_desc(g_detail3_d[l_ac].pmdt019) RETURNING g_detail3_d[l_ac].pmdt019_desc
      
      CALL s_desc_get_unit_desc(g_detail3_d[l_ac].pmdt021) RETURNING g_detail3_d[l_ac].pmdt021_desc
      
      CALL s_desc_get_stock_desc(g_site,g_detail3_d[l_ac].pmdt016) RETURNING g_detail3_d[l_ac].pmdt016_desc
      
      CALL s_desc_get_locator_desc(g_site,g_detail3_d[l_ac].pmdt016,g_detail3_d[l_ac].pmdt017) RETURNING g_detail3_d[l_ac].pmdt017_desc
      
      CALL s_desc_get_tax_desc1(g_site,g_detail3_d[l_ac].pmdt046) RETURNING g_detail3_d[l_ac].pmdt046_desc
      
      CALL s_desc_get_unit_desc(g_detail3_d[l_ac].pmdt023) RETURNING g_detail3_d[l_ac].pmdt023_desc

      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend =  "" 
            LET g_errparam.code   =  9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
          END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   
   CALL g_detail3_d.deleteElement(g_detail3_d.getLength())
   IF (l_ac - 1) > 0 THEN
      LET g_detail3_idx = 1
   END IF
    
   LET g_detail3_cnt = l_ac - 1 
   
   CLOSE tmp2_curs
   FREE apmp110_tmp2

   CALL apmp110_fetch_2()

   LET l_ac = li_ac
   
END FUNCTION

################################################################################
# Descriptions...: 對應結算資料清單
# Memo...........:
# Usage..........: CALL apmp110_fetch_2()
# Input parameter: no
# Return code....: no
# Date & Author..: 140825 By whiteny
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_fetch_2()
 
   DEFINE li_ac           LIKE type_t.num5
   
   LET li_ac = l_ac 
   
   IF cl_null(g_detail3_idx) OR g_detail3_idx = 0 THEN
      RETURN
   END IF

   LET g_sql = " SELECT inaj015,inaj022,inaj001,inaj002,inaj003,inaj005,'','',inaj006, ",
               "        inaj007,inaj011,inaj012,'',inaj008,'',inaj009,'',inaj010 ",
               "   FROM apmp110_tmp3 ",
#               "  WHERE inaj005 = ? AND inaj006 = ? AND inaj007 = ? AND inaj008 = ? AND inaj009 = ? AND inaj010 = ? AND inaj012 = ? ", #181101-00020#1 mark
               #181101-00020#1 mod-S
               "  WHERE NVL(inaj005,' ') = NVL(?,' ') ",
               "    AND NVL(inaj006,' ') = NVL(?,' ') ",
               "    AND NVL(inaj007,' ') = NVL(?,' ') ",
               "    AND NVL(inaj008,' ') = NVL(?,' ') ",
               "    AND NVL(inaj009,' ') = NVL(?,' ') ",
               "    AND NVL(inaj010,' ') = NVL(?,' ') ",
               "    AND NVL(inaj012,' ') = NVL(?,' ') ",
               #181101-00020#1 mod-E
               "  ORDER BY inaj001,inaj002,inaj003 "

   PREPARE apmp110_tmp3 FROM g_sql
   DECLARE tmp3_curs CURSOR FOR apmp110_tmp3
   
   CALL g_detail4_d.clear()
 
   LET l_ac = 1

   FOREACH tmp3_curs USING g_detail3_d[g_detail3_idx].pmdt006,g_detail3_d[g_detail3_idx].pmdt007,
                           g_detail3_d[g_detail3_idx].pmdt063,g_detail3_d[g_detail3_idx].pmdt016,
                           g_detail3_d[g_detail3_idx].pmdt017,g_detail3_d[g_detail3_idx].pmdt018,
                           g_detail3_d[g_detail3_idx].pmdt019 INTO 
      g_detail4_d[l_ac].inaj015,g_detail4_d[l_ac].inaj022,g_detail4_d[l_ac].inaj001,g_detail4_d[l_ac].inaj002,
      g_detail4_d[l_ac].inaj003,g_detail4_d[l_ac].inaj005,g_detail4_d[l_ac].inaj005_desc,g_detail4_d[l_ac].inaj005_desc_desc,
      g_detail4_d[l_ac].inaj006,g_detail4_d[l_ac].inaj007,g_detail4_d[l_ac].inaj011,
      g_detail4_d[l_ac].inaj012,g_detail4_d[l_ac].inaj012_desc,g_detail4_d[l_ac].inaj008,g_detail4_d[l_ac].inaj008_desc,
      g_detail4_d[l_ac].inaj009,g_detail4_d[l_ac].inaj009_desc,g_detail4_d[l_ac].inaj010

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      CALL s_desc_get_item_desc(g_detail4_d[l_ac].inaj005) RETURNING g_detail4_d[l_ac].inaj005_desc,g_detail4_d[l_ac].inaj005_desc_desc
      
      CALL s_desc_get_unit_desc(g_detail4_d[l_ac].inaj012) RETURNING g_detail4_d[l_ac].inaj012_desc
      
      CALL s_desc_get_stock_desc(g_site,g_detail4_d[l_ac].inaj008) RETURNING g_detail4_d[l_ac].inaj008_desc
      
      CALL s_desc_get_locator_desc(g_site,g_detail4_d[l_ac].inaj008,g_detail4_d[l_ac].inaj009) RETURNING g_detail4_d[l_ac].inaj009_desc

      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend =  "" 
            LET g_errparam.code   =  9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
          END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   
   CALL g_detail4_d.deleteElement(g_detail4_d.getLength())
   IF (l_ac - 1) > 0 THEN
      LET g_detail4_idx = 1
   END IF
    
   LET g_detail4_cnt = l_ac - 1 
   
   CLOSE tmp3_curs
   FREE apmp110_tmp3

   LET l_ac = li_ac
   
END FUNCTION

################################################################################
# Descriptions...: 取單價
# Memo...........:
# Usage..........: CALL apmp110_get_price()
# Input parameter: no
# Return code....: no
# Date & Author..: 140825 By whiteny
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_get_price()
DEFINE l_docno     LIKE pmdn_t.pmdndocno
DEFINE l_seq       LIKE pmdn_t.pmdnseq
DEFINE l_xrcd113   LIKE xrcd_t.xrcd113
DEFINE l_xrcd114   LIKE xrcd_t.xrcd114
DEFINE l_xrcd115   LIKE xrcd_t.xrcd115

   IF cl_null(g_detail2_d[g_detail2_idx].pmds039) OR
      cl_null(g_detail2_d[g_detail2_idx].pmds007) OR
      cl_null(g_detail3_d[g_detail3_idx].pmdt006) OR
      cl_null(g_detail2_d[g_detail2_idx].pmds037) OR
      cl_null(g_detail3_d[g_detail3_idx].pmdt046) OR
      cl_null(g_detail2_d[g_detail2_idx].pmds031) OR
      cl_null(g_detail2_d[g_detail2_idx].pmds032) OR
      #cl_null(g_detail2_d[g_detail2_idx].pmds012) OR   #170330-00089#1 mark
      cl_null(g_detail3_d[g_detail3_idx].pmdt023) OR
      cl_null(g_detail3_d[g_detail3_idx].pmdt024) OR
      cl_null(g_detail2_d[g_detail2_idx].pmds048) THEN
      RETURN
   END IF

   IF g_detail3_d[g_detail3_idx].pmdt007 IS NULL THEN
      LET g_detail3_d[g_detail3_idx].pmdt007 = ' '
   END IF

   CASE g_detail2_d[g_detail2_idx].pmds000
      WHEN '4'  #無採購收貨入庫
         LET l_docno = tm.pmdtdocno1
      WHEN '7'  #採購倉退單
         LET l_docno = tm.pmdtdocno2
      OTHERWISE EXIT CASE
   END CASE

   CALL s_purchase_price_get(g_detail2_d[g_detail2_idx].pmds039,g_detail2_d[g_detail2_idx].pmds007,
                             g_detail3_d[g_detail3_idx].pmdt006,g_detail3_d[g_detail3_idx].pmdt007,
                             g_detail2_d[g_detail2_idx].pmds037,g_detail3_d[g_detail3_idx].pmdt046,
                             g_detail2_d[g_detail2_idx].pmds031,g_detail2_d[g_detail2_idx].pmds032,
                             g_detail2_d[g_detail2_idx].pmds012,l_docno,g_today,
                             g_detail3_d[g_detail3_idx].pmdt023,g_detail3_d[g_detail3_idx].pmdt024,g_site,
                             g_detail2_d[g_detail2_idx].pmds048,'1','','')
        RETURNING g_detail3_d[g_detail3_idx].pmdt042,g_detail3_d[g_detail3_idx].pmdt036,g_detail3_d[g_detail3_idx].pmdt043,l_seq
   LET g_detail3_d[g_detail3_idx].pmdt044 = g_detail3_d[g_detail3_idx].pmdt036

   IF NOT cl_null(g_detail3_d[g_detail3_idx].pmdt046) AND
      NOT cl_null(g_detail3_d[g_detail3_idx].pmdt020) AND
      NOT cl_null(g_detail2_d[g_detail2_idx].pmds037) AND
      NOT cl_null(g_detail2_d[g_detail2_idx].pmds038) THEN
      CALL s_tax_count(g_site,g_detail3_d[g_detail3_idx].pmdt046,
                       g_detail3_d[g_detail3_idx].pmdt020*g_detail3_d[g_detail3_idx].pmdt036,
                       g_detail3_d[g_detail3_idx].pmdt020,g_detail2_d[g_detail2_idx].pmds037,
                       g_detail2_d[g_detail2_idx].pmds038)
           RETURNING g_detail3_d[g_detail3_idx].pmdt038,g_detail3_d[g_detail3_idx].pmdt047,
                     g_detail3_d[g_detail3_idx].pmdt039,l_xrcd113,l_xrcd114,l_xrcd115
   END IF

   UPDATE apmp110_tmp2 SET pmdt038 = g_detail3_d[g_detail3_idx].pmdt038,
                           pmdt039 = g_detail3_d[g_detail3_idx].pmdt039,
                           pmdt047 = g_detail3_d[g_detail3_idx].pmdt047,
                           pmdt036 = g_detail3_d[g_detail3_idx].pmdt036,
                           pmdt042 = g_detail3_d[g_detail3_idx].pmdt042,
                           pmdt043 = g_detail3_d[g_detail3_idx].pmdt043,
                           pmdt044 = g_detail3_d[g_detail3_idx].pmdt044
    WHERE pmdt006 = g_detail3_d[g_detail3_idx].pmdt006
      AND pmdt007 = g_detail3_d[g_detail3_idx].pmdt007
      AND pmdt063 = g_detail3_d[g_detail3_idx].pmdt063
      AND pmdt016 = g_detail3_d[g_detail3_idx].pmdt016
      AND pmdt017 = g_detail3_d[g_detail3_idx].pmdt017
      AND pmdt018 = g_detail3_d[g_detail3_idx].pmdt018
      AND pmdt019 = g_detail3_d[g_detail3_idx].pmdt019

END FUNCTION

################################################################################
# Descriptions...: 執行前檢核欄位值合理性
# Memo...........:
# Usage..........: CALL apmp110_data_chk()
# Input parameter: no
# Return code....: TRUE OR FALSE
# Date & Author..: 140826 By whiteny
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_data_chk()
DEFINE r_success  LIKE type_t.num5
DEFINE l_pmdt  RECORD
    pmdtseq  LIKE pmdt_t.pmdtseq,   #項次
    pmdt063  LIKE pmdt_t.pmdt063,   #庫存管理特徵
    pmdt022  LIKE pmdt_t.pmdt022,   #參考數量
    pmdt046  LIKE pmdt_t.pmdt046,   #稅別
    pmdt024  LIKE pmdt_t.pmdt024,   #計價數量
    pmdt036  LIKE pmdt_t.pmdt036    #單價
              END RECORD

   LET r_success = TRUE
   CALL cl_err_collect_init()
   LET g_coll_title[1] = cl_getmsg('apm-00050',g_lang)  #供應商編號
   LET g_coll_title[2] = cl_getmsg('anm-00225',g_lang)  #項次    #axm-00008   #160318-00005#35  by 07900--mod

   LET g_cnt = l_ac
   FOR l_ac = 1 TO g_detail2_d.getLength()
      #181101-00020#1 add-S
      IF cl_null(g_detail2_d[l_ac].pmds000) THEN
         CONTINUE FOR
      END IF
      #181101-00020#1 add-E
      IF cl_null(g_detail2_d[l_ac].pmds031) THEN
         #付款條件不可為空！
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'apm-00530'
         LET g_errparam.extend = 'pmds031'
         LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
         CALL cl_err()
         LET r_success = FALSE
      END IF
      IF cl_null(g_detail2_d[l_ac].pmds032) THEN
         #交易條件不可為空！
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'apm-00531'
         LET g_errparam.extend = 'pmds032'
         LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
         CALL cl_err()
         LET r_success = FALSE
      END IF
      IF cl_null(g_detail2_d[l_ac].pmds033) THEN
         #稅別不可為空!
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'asf-00228'
         LET g_errparam.extend = 'pmds033'
         LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
         CALL cl_err()
         LET r_success = FALSE
      END IF
      IF cl_null(g_detail2_d[l_ac].pmds037) THEN
         #幣別不可為空!
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'asf-00227'
         LET g_errparam.extend = 'pmds037'
         LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
         CALL cl_err()
         LET r_success = FALSE
      END IF
      IF cl_null(g_detail2_d[l_ac].pmds039) THEN
         #取價方式不可為空!
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'asf-00226'
         LET g_errparam.extend = 'pmds039'
         LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOR

   DECLARE apmp110_cur CURSOR FOR
#      SELECT pmdtseq,pmdt063,pmdt022,pmdt046,pmdt024,pmdt036 FROM apmp110_tmp2 ORDER BY pmdt063 #181101-00020#1 mark
      SELECT pmdtseq,pmdt063,pmdt022,pmdt046,pmdt024,pmdt036 FROM apmp110_tmp2 WHERE pmdt000_s IS NOT NULL  #181101-00020#1 mod
   FOREACH apmp110_cur INTO l_pmdt.pmdtseq,l_pmdt.pmdt063,l_pmdt.pmdt022,
                            l_pmdt.pmdt046,l_pmdt.pmdt024,l_pmdt.pmdt036
      IF l_pmdt.pmdt022 < 0 THEN
         #數量不可小於0
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'agl-00041'
         LET g_errparam.extend = 'pmdt022'
         LET g_errparam.coll_vals[1] = l_pmdt.pmdt063
         LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
         CALL cl_err()
         LET r_success = FALSE
      END IF
      IF cl_null(l_pmdt.pmdt046) THEN
         #稅別不可為空!
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'asf-00228'
         LET g_errparam.extend = 'pmdt046'
         LET g_errparam.coll_vals[1] = l_pmdt.pmdt063
         LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
         CALL cl_err()
         LET r_success = FALSE
      END IF
      IF l_pmdt.pmdt024 < 0 THEN
         #數量不可小於0
         INITIALIZE g_errparam.* TO NULL
         LET g_errparam.code = 'agl-00041'
         LET g_errparam.extend = 'pmdt024'
         LET g_errparam.coll_vals[1] = l_pmdt.pmdt063
         LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #IF cl_null(l_pmdt.pmdt036) OR l_pmdt.pmdt036 < 0 THEN #170618-00329#1-mark
         ##單價不可以空白或小於0 #170618-00329#1-mark
      IF cl_null(l_pmdt.pmdt036) OR l_pmdt.pmdt036 <= 0 THEN #170618-00329#1-add
         #單價不可以空白或小於等於0 #170618-00329#1-add
         INITIALIZE g_errparam.* TO NULL
         #LET g_errparam.code = 'axc-00013' #170618-00329#1-mark
         LET g_errparam.code = 'apm-01191'  #170618-00329#1-add
         LET g_errparam.extend = 'pmdt046'
         LET g_errparam.coll_vals[1] = l_pmdt.pmdt063
         LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH
   
   CALL cl_err_collect_show()

   LET l_ac = g_cnt
   LET g_cnt = 0
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 依據匯總的結果產生相關單據，單身'單據資訊'頁籤資料每一筆代表一張單據，
#                  而對應的'入庫/倉退明細'頁籤的資料則代表是該單據的單身相關資料
# Memo...........:
# Usage..........: CALL apmp110_process()
# Input parameter: no
# Return code....: no
# Date & Author..: 140826 By whitney
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_process()
DEFINE tot_success  LIKE type_t.num5
DEFINE l_success    LIKE type_t.num5
DEFINE l_pmds  RECORD
    pmdsdocno  LIKE pmds_t.pmdsdocno,  #單據單號		
    pmds008	   LIKE pmds_t.pmds008,	   #帳款供應商	
    pmds009	   LIKE pmds_t.pmds009,	   #送貨供應商	
    pmds011	   LIKE pmds_t.pmds011,	   #採購性質		
    pmds021	   LIKE pmds_t.pmds021,	   #LC進口			
    pmds036	   LIKE pmds_t.pmds036,	   #交易類型		
    pmds047	   LIKE pmds_t.pmds047,	   #多角貿易中斷點
    pmds100	   LIKE pmds_t.pmds100,	   #倉退方式		
    pmds101	   LIKE pmds_t.pmds101,	   #折讓日期		
    pmds043	   LIKE pmds_t.pmds043,	   #採購總未稅金額
    pmds044	   LIKE pmds_t.pmds044,	   #採購總含稅金額
    pmds046	   LIKE pmds_t.pmds046,	   #採購總稅額	
    pmdsownid  LIKE pmds_t.pmdsownid,  #資料所有者	
    pmdsowndp  LIKE pmds_t.pmdsowndp,  #資料所屬部門	
    pmdscrtid  LIKE pmds_t.pmdscrtid,  #資料建立者	
    pmdscrtdp  LIKE pmds_t.pmdscrtdp,  #資料建立部門	
    pmdscrtdt  LIKE pmds_t.pmdscrtdt,  #資料創建日	
    pmdsstus   LIKE pmds_t.pmdsstus,   #狀態碼			
    pmds054    LIKE pmds_t.pmds054,    #資料來源 #151111-00023#1-add
    pmdsdocdt  LIKE pmds_t.pmdsdocdt,  #單據日期 #160906-00006#1
    pmds001    LIKE pmds_t.pmds001     #扣帳日期 #160906-00006#1
    ,pmds014   LIKE pmds_t.pmds014     #多角性质 #210205-00039#1 add
             END RECORD
DEFINE l_pmdt  RECORD
	 pmdtseq    LIKE pmdt_t.pmdtseq,	   #項次			
	 pmdt005    LIKE pmdt_t.pmdt005,	   #子件特性		
	 pmdt006    LIKE pmdt_t.pmdt006,	   #料件編號		
	 pmdt007    LIKE pmdt_t.pmdt007,	   #產品特徵		
	 pmdt016    LIKE pmdt_t.pmdt016,	   #庫位			
	 pmdt017    LIKE pmdt_t.pmdt017,	   #儲位			
	 pmdt018    LIKE pmdt_t.pmdt018,	   #批號			
	 pmdt019    LIKE pmdt_t.pmdt019,	   #收貨/入庫單位	
	 pmdt020    LIKE pmdt_t.pmdt020,	   #收貨/入庫數量	
	 pmdt021    LIKE pmdt_t.pmdt021,	   #參考單位		
	 pmdt022    LIKE pmdt_t.pmdt022,	   #參考數量		
	 pmdt023    LIKE pmdt_t.pmdt023,	   #計價單位		
	 pmdt024    LIKE pmdt_t.pmdt024,	   #計價數量		
	 pmdt025    LIKE pmdt_t.pmdt025,	   #緊急度			
	 pmdt026    LIKE pmdt_t.pmdt026,	   #檢驗否			
	 pmdt036    LIKE pmdt_t.pmdt036,	   #單價			
	 pmdt037    LIKE pmdt_t.pmdt037,	   #稅率			
	 pmdt038    LIKE pmdt_t.pmdt038,	   #未稅金額		
	 pmdt039    LIKE pmdt_t.pmdt039,	   #含稅金額		
	 pmdt041    LIKE pmdt_t.pmdt041,	   #保稅否			
	 pmdt042    LIKE pmdt_t.pmdt042,	   #取價來源		
	 pmdt043    LIKE pmdt_t.pmdt043,	   #價格參考單號	
	 pmdt044    LIKE pmdt_t.pmdt044,	   #取出單價		
	 pmdt046    LIKE pmdt_t.pmdt046,	   #稅別			
	 pmdt047    LIKE pmdt_t.pmdt047,	   #稅額			
	 pmdt051    LIKE pmdt_t.pmdt051,	   #理由碼			
	 pmdt052    LIKE pmdt_t.pmdt052,	   #狀態碼			
	 pmdt053    LIKE pmdt_t.pmdt053,	   #允收數量		
	 pmdt054    LIKE pmdt_t.pmdt054,	   #已入庫量		
	 pmdt055    LIKE pmdt_t.pmdt055,	   #驗退量			
	 pmdt062    LIKE pmdt_t.pmdt062,	   #多庫儲批收貨入庫
	 pmdt063    LIKE pmdt_t.pmdt063,	   #庫存管理特徵	
	 pmdt084    LIKE pmdt_t.pmdt084     #須自立AP否 #151111-00023#1-add
             END RECORD
DEFINE l_inaj  RECORD
    inaj001    LIKE inaj_t.inaj001,
    inaj002    LIKE inaj_t.inaj002,
    inaj003    LIKE inaj_t.inaj003,
    inaj004    LIKE inaj_t.inaj004,
    inaj011    LIKE inaj_t.inaj011
             END RECORD
DEFINE l_pmdt011    LIKE pmdt_t.pmdt011
DEFINE l_money      LIKE pmdt_t.pmdt036
DEFINE l_xrcd113    LIKE xrcd_t.xrcd113
DEFINE l_xrcd114    LIKE xrcd_t.xrcd114
DEFINE l_xrcd115    LIKE xrcd_t.xrcd115
DEFINE l_xrcd123    LIKE xrcd_t.xrcd123
DEFINE l_xrcd124    LIKE xrcd_t.xrcd124
DEFINE l_xrcd125    LIKE xrcd_t.xrcd125
DEFINE l_xrcd133    LIKE xrcd_t.xrcd133
DEFINE l_xrcd134    LIKE xrcd_t.xrcd134
DEFINE l_xrcd135    LIKE xrcd_t.xrcd135
DEFINE l_cnt        LIKE type_t.num5  #151111-00023#1-add
DEFINE l_flag       LIKE type_t.num5  #170217-00025#4 add 
#171201-00045#19 -s 180821 add by 08172
DEFINE l_inaj030    LIKE inaj_t.inaj030
DEFINE l_inaj031    LIKE inaj_t.inaj031
DEFINE l_inaj032    LIKE inaj_t.inaj032
#171201-00045#19 -e 180821 add by 08172
DEFINE l_datetime   DATETIME YEAR TO SECOND  #181101-00020#1 add
DEFINE l_docno      LIKE type_t.chr20        #181101-00020#1 add
DEFINE l_str        STRING                   #181101-00020#1 add
DEFINE l_flag1      LIKE type_t.num5         #181101-00020#1 add
#200302-00005#1 add -S
DEFINE lc_param_link  RECORD
       prog           STRING,
       param          DYNAMIC ARRAY OF STRING,
       default_wc     STRING,
       deputy         STRING
       END RECORD 
DEFINE l_confmsg     STRING
DEFINE l_strno1      LIKE pmds_t.pmdsdocno   
DEFINE l_endno1      LIKE pmds_t.pmdsdocno
DEFINE l_strno2      LIKE pmds_t.pmdsdocno
DEFINE l_endno2      LIKE pmds_t.pmdsdocno
#200302-00005#1 add -E
   CALL s_transaction_begin()
   #171201-00045#19 -s 180821 add by 08172
   #锁资料
   LET g_sql = " SELECT inaj005 ",
               "   FROM inaj_t ",
               "  WHERE inajent = ",g_enterprise,
               "    AND inajsite = '",g_site,"'",
               "    AND inaj030 = '1' AND TRIM(inaj007) IS NOT NULL",
               "    AND EXISTS (SELECT 1",
               "                  FROM ( SELECT inaj001 inaj001_1,inaj002 inaj002_1,inaj003 inaj003_1,",
              #"                               (CASE WHEN inaj011 < 0 THEN '-1' ELSE '1' END) inaj004_1",  #PGS(D)-00902-mark
               "                               (CASE WHEN inaj011 < 0 THEN -1 ELSE 1 END) inaj004_1",      #PGS(D)-00902-add
               "                          FROM apmp110_tmp3) t53 ",  #PGS(D)-00902 add-
               "                 WHERE inaj001_1 = inaj001",
               "                   AND inaj002_1 = inaj002",
               "                   AND inaj003_1 = inaj003",
               "                   AND inaj004_1 = inaj004) FOR UPDATE"
   LET g_sql = cl_sql_forupd(g_sql)                #轉換不同資料庫語法
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   DECLARE apmp110_cl CURSOR FROM g_sql
   OPEN apmp110_cl
      IF SQLCA.SQLCODE THEN   
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "" 
         LET g_errparam.code = "apm-01275"
         LET g_errparam.popup = TRUE 
         CLOSE apmp110_cl  
         CALL s_transaction_end('N','0')
         CALL cl_err() 
         RETURN
      END IF
   #171201-00045#19 -e 180821 add by 08172
   
   CALL cl_err_collect_init()
   LET g_coll_title[1] = cl_getmsg('apm-00050',g_lang)  #供應商編號
   LET g_coll_title[2] = cl_getmsg('anm-00225',g_lang)  #項次   #axm-00008   #160318-00005#35  by 07900--mod
   LET tot_success = TRUE
   LET l_success = TRUE
   LET l_flag = FALSE   #170217-00025#4 add
   
   LET l_strno1 = ''   #200302-00005#1
   LET l_endno1 = ''   #200302-00005#1
   LET l_strno2 = ''   #200302-00005#1
   LET l_endno2 = ''   #200302-00005#1
   
   LET g_sql = " SELECT pmdtseq,pmdt006,pmdt007,pmdt016,pmdt017,pmdt018,pmdt019,pmdt020,pmdt021,pmdt022, ",
               "        pmdt023,pmdt024,pmdt036,pmdt037,pmdt042,pmdt043,pmdt044,pmdt046,pmdt063 ",
               "   FROM apmp110_tmp2 ",
               "  WHERE pmdt063 = ? ",
#               "    AND pmdt000_s = ? ",  #161207-00053#1-1 add   #181101-00020#1 mark
               "    AND NVL(pmdt000_s,' ') = NVL(?,' ') ",  #181101-00020#1 mod
               "  ORDER BY pmdtseq "
   PREPARE apmp110_pr1 FROM g_sql
   DECLARE apmp110_cs1 CURSOR FOR apmp110_pr1

   LET g_sql = " SELECT inaj001,inaj002,inaj003,inaj011 FROM apmp110_tmp3 ",   
               #181101-00020#1 mark-S
#               "  WHERE inaj005 = ? AND inaj006 = ? AND inaj007 = ? AND inaj008 = ? ",
#               "    AND inaj009 = ? AND inaj010 = ? AND inaj012 = ? "
               #181101-00020#1 mark-E
               #181101-00020#1 add-S
               "  WHERE NVL(inaj005,' ') = NVL(?,' ') AND NVL(inaj006,' ') = NVL(?,' ') ",
               "    AND NVL(inaj007,' ') = NVL(?,' ') AND NVL(inaj008,' ') = NVL(?,' ') ",
               "    AND NVL(inaj009,' ') = NVL(?,' ') AND NVL(inaj010,' ') = NVL(?,' ') ",
               "    AND NVL(inaj012,' ') = NVL(?,' ') "
               #181101-00020#1 add-E
   PREPARE apmp110_pr2 FROM g_sql
   DECLARE apmp110_cs2 CURSOR FOR apmp110_pr2
   
   LET g_cnt = l_ac
   FOR l_ac = 1 TO g_detail2_d.getLength()

      IF NOT l_success THEN
         LET tot_success = FALSE
         LET l_success = TRUE
      END IF

      INITIALIZE l_pmds.* TO NULL
      LET l_flag1 = FALSE   #如果不需要产生单据，则给值TRUE
      CASE g_detail2_d[l_ac].pmds000
         WHEN '4'  #無採購收貨入庫
            CALL s_aooi200_gen_docno(g_site,tm.pmdtdocno1,tm.pmds001,'apmt532')     #160906-00006#1 g_today->tm.pmds001
                 RETURNING l_success,l_pmds.pmdsdocno
            LET g_prog = 'apmt532'
            LET l_pmds.pmdsdocdt = tm.pmds001   #160906-00006#1
            LET l_pmds.pmds001   = tm.pmds001   #160906-00006#1
         WHEN '7'  #採購倉退單
            CALL s_aooi200_gen_docno(g_site,tm.pmdtdocno2,tm.pmds0012,'apmt580')    #160906-00006#1 g_today->tm.pmds0012
                 RETURNING l_success,l_pmds.pmdsdocno
           #LET l_pmds.pmds101 = g_today     #160906-00006#1 mark
            LET l_pmds.pmds101 = tm.pmds0012 #160906-00006#1 mark
            LET l_pmds.pmdsdocdt = tm.pmds0012  #160906-00006#1
            LET l_pmds.pmds001   = tm.pmds0012  #160906-00006#1
            LET g_prog = 'apmt580'
#         OTHERWISE EXIT CASE  #181101-00020#1 mark
         #181101-00020#1 add-S   如果刚好相互抵消，则不产生任何单据
         OTHERWISE
            LET l_datetime = cl_get_current()
            LET l_str = cl_replace_str(l_datetime,':','')
            LET l_str = cl_replace_str(l_str,' ','')
            LET l_str = cl_replace_str(l_str,'-','')
            LET l_str = 'OFFSET' CLIPPED,l_str
            LET l_docno = l_str
            LET l_flag1  = TRUE
         #181101-00020#1 add-E
      END CASE
      #181101-00020#1 add-S 如果l_flag1 = TRUE，则所列的单据都要回写1.VMI已结算；2.单号=l_docno
      IF l_flag1 THEN
         FOREACH apmp110_cs1 USING g_detail2_d[l_ac].pmds007,g_detail2_d[l_ac].pmds000  
               INTO l_pmdt.pmdtseq,l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt016,l_pmdt.pmdt017,
                    l_pmdt.pmdt018,l_pmdt.pmdt019,l_pmdt.pmdt020,l_pmdt.pmdt021,l_pmdt.pmdt022,
                    l_pmdt.pmdt023,l_pmdt.pmdt024,l_pmdt.pmdt036,l_pmdt.pmdt037,l_pmdt.pmdt042,
                    l_pmdt.pmdt043,l_pmdt.pmdt044,l_pmdt.pmdt046,l_pmdt.pmdt063
            #將本次產生的收貨入庫單、倉退單所產生的'VMI結算否'欄位更新成'2:已結算'
            INITIALIZE l_inaj.* TO NULL
            FOREACH apmp110_cs2 USING l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt063,l_pmdt.pmdt016,
                                      l_pmdt.pmdt017,l_pmdt.pmdt018,l_pmdt.pmdt019
                                 INTO l_inaj.inaj001,l_inaj.inaj002,l_inaj.inaj003,l_inaj.inaj011 
               IF l_inaj.inaj011 < 0 THEN
                  LET l_inaj.inaj004 = '-1'
               ELSE
                  LET l_inaj.inaj004 = '1'
               END IF
               #171201-00045#19 -s 180821 add by 08172
               #检查是否已结算
               LET l_inaj030 = ''
               LET l_inaj031 = ''
               LET l_inaj032 =''
               SELECT inaj030,inaj031,inaj032
                 INTO l_inaj030,l_inaj031,l_inaj032
                 FROM inaj_t
                WHERE inajent = g_enterprise
                  AND inajsite = g_site
                  AND inaj001 = l_inaj.inaj001
                  AND inaj002 = l_inaj.inaj002
                  AND inaj003 = l_inaj.inaj003
#                  AND inaj004 = l_inaj.inaj004  #181203-00028#1 mark
                  AND inaj004 = (CASE WHEN inaj036 = '501' THEN 1 ELSE l_inaj.inaj004 END)   #181203-00028#1 mod
               IF l_inaj030 = '2' AND NOT cl_null(l_inaj031) AND NOT cl_null(l_inaj032) THEN
                  INITIALIZE g_errparam.* TO NULL
                  LET g_errparam.code = "apm-01276"
                  LET g_errparam.extend = ""
                  LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
                  LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               IF l_success THEN
                  UPDATE inaj_t SET inaj030 = '2',               #VMI交易結算否
                                    inaj031 = l_docno            #VMI對應入庫/倉退單號
                   WHERE inajent = g_enterprise
                     AND inajsite = g_site
                     AND inaj001 = l_inaj.inaj001
                     AND inaj002 = l_inaj.inaj002
                     AND inaj003 = l_inaj.inaj003
#                     AND inaj004 = l_inaj.inaj004  #181203-00028#1 mark
                     AND inaj004 = (CASE WHEN inaj036 = '501' THEN 1 ELSE l_inaj.inaj004 END)   #181203-00028#1 mod
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam.* TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = 'upd inaj_t'
                     LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
                     LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
                     CALL cl_err()
                     LET l_success = FALSE
                  END IF
                  IF SQLCA.sqlerrd[3] > 0 THEN
                     LET l_flag = TRUE
                  END IF
                  IF l_success THEN
                     DELETE FROM apmp110_tmp3
                      WHERE inaj001 = l_inaj.inaj001     #單據編號  
                        AND inaj002 = l_inaj.inaj002     #項次  
                        AND inaj003 = l_inaj.inaj003     #項序  
                        AND inaj011 = l_inaj.inaj011     #交易數量  
                  
                     LET l_cnt = ''
                     SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp3
                      WHERE inaj005 = l_pmdt.pmdt006     #料件編號  
                        AND inaj006 = l_pmdt.pmdt007     #產品特徵  
                        AND inaj007 = l_pmdt.pmdt063     #庫存管理特徵  
                        AND inaj008 = l_pmdt.pmdt016     #庫位編號   
                        AND inaj009 = l_pmdt.pmdt017     #儲位編號  
                        AND inaj010 = l_pmdt.pmdt018     #批號  
                        AND inaj012 = l_pmdt.pmdt019     #交易單位  
                     IF cl_null(l_cnt) OR l_cnt = 0 THEN
                        #如果在apmp110_tmp3已無資料的話，就應該把apmp110_tmp2的項目移除 
                        #入庫/倉退明細 
                        DELETE FROM apmp110_tmp2
                         WHERE pmdt006 = l_pmdt.pmdt006 #料件編號
                           AND pmdt007 = l_pmdt.pmdt007 #產品特徵
                           AND pmdt063 = l_pmdt.pmdt063 #庫存管理特徵
                           AND pmdt016 = l_pmdt.pmdt016 #庫位編號   
                           AND pmdt017 = l_pmdt.pmdt017 #儲位編號  
                           AND pmdt018 = l_pmdt.pmdt018 #批號  
                           AND pmdt019 = l_pmdt.pmdt019 #交易單位  
                  
                        SELECT COUNT(*) INTO l_cnt
                          FROM apmp110_tmp2
                         WHERE pmdt063 = g_detail2_d[l_ac].pmds007
                           AND pmdt000_s = g_detail2_d[l_ac].pmds000  #161207-00053#1-1 add
                        IF cl_null(l_cnt) OR l_cnt = 0 THEN
                           #入庫/倉退單據 
                           DELETE FROM apmp110_tmp1
                            WHERE pmds007 = g_detail2_d[l_ac].pmds007
                              AND pmds000 = g_detail2_d[l_ac].pmds000  #161207-00053#1-1 add
                        END IF
                     END IF
                  END IF
               END IF 
               INITIALIZE l_inaj.* TO NULL
               
            END FOREACH
            INITIALIZE l_pmdt.* TO NULL         
         END FOREACH
      ELSE
      #181101-00020#1 add-E
         #抓取交易對象夥伴關係檔且交易類型為"1:收/付款對象"的交易對象
         #若有設置多筆收/付款交易對象時，則取有勾選主要的交易對象那一個
         #若沒有設時，則[帳款供應商]預設採購供應商
         LET l_pmds.pmds008 = ''
         SELECT pmac002 INTO l_pmds.pmds008 FROM pmac_t
          WHERE pmacent = g_enterprise AND pmac001 = g_detail2_d[l_ac].pmds007
            AND pmac003 = '1' AND pmacstus = 'Y' AND pmac004 = 'Y'
         IF cl_null(l_pmds.pmds008) THEN
            #PGS(D)-13130 -S-
            SELECT pmac002 INTO l_pmds.pmds008 FROM pmac_t
             WHERE pmacent = g_enterprise AND pmac001 = g_detail2_d[l_ac].pmds007
               AND pmac003 = '1' AND pmacstus = 'Y' AND rownum = 1
            #PGS(D)-13130 -E-
            IF cl_null(l_pmds.pmds008) THEN
               LET l_pmds.pmds008 = g_detail2_d[l_ac].pmds007
            END IF
         END IF
         
         #抓取交易對象夥伴關係檔且交易類型為"2:出貨對象"的交易對象
         #若有設置多筆出貨交易對象時，則取有勾選主要的交易對象那一個
         #若沒有設時，則[送貨供應商]預設採購供應商
         LET l_pmds.pmds009 = ''
         SELECT pmac002 INTO l_pmds.pmds009 FROM pmac_t
          WHERE pmacent = g_enterprise AND pmac001 = g_detail2_d[l_ac].pmds007
            AND pmac003 = '2' AND pmacstus = 'Y' AND pmac004 = 'Y'
         IF cl_null(l_pmds.pmds009) THEN
            SELECT pmac002 INTO l_pmds.pmds009 FROM pmac_t
             WHERE pmacent = g_enterprise AND pmac001 = g_detail2_d[l_ac].pmds007
               AND pmac003 = '2' AND pmacstus = 'Y' AND rownum = 1
            
            #PGS(D)-00902-add-s-
            #PGS(D)-00902-add-e-
            IF cl_null(l_pmds.pmds009) THEN
               LET l_pmds.pmds009 = g_detail2_d[l_ac].pmds007
            END IF
         END IF
   
         #採購性質='1.一般採購'
         LET l_pmds.pmds011 = '1'   #170618-00515#1 Mark By ken 170626    #171025-00027#1 remark by 09767
         #LET l_pmds.pmds011 = '3'    #170618-00515#1 Add By ken 170626   由1.一般採購改成3.VMI採購    #171025-00027#1   mark by 09767
         LET l_pmds.pmds021 = 'N'
         LET l_pmds.pmds036 = '1'
         LET l_pmds.pmds047 = 'N'
         LET l_pmds.pmds054 = '3' #151111-00023#1-add
         #倉退方式='1:倉退退回'
         LET l_pmds.pmds100 = '1'
         LET l_pmds.pmdsstus = 'N'
         LET l_pmds.pmdsownid = g_user
         LET l_pmds.pmdsowndp = g_dept
         LET l_pmds.pmdscrtid = g_user
         LET l_pmds.pmdscrtdp = g_dept 
         LET l_pmds.pmdscrtdt = cl_get_current()
         
         LET l_pmds.pmds014 = '1' #210205-00039#1 add
   
         INSERT INTO pmds_t (pmdsent,pmdssite,pmdsdocno,pmdsdocdt,pmds000,pmds001,
                             pmds002,pmds003,pmds007,pmds008,pmds009,pmds011,pmds012,
                             pmds021,pmds031,pmds032,pmds033,pmds034,pmds035,pmds036,
                             pmds037,pmds038,pmds039,pmds047,pmds048,pmds049,pmds100,
                             #pmdsownid,pmdsowndp,pmdscrtid,pmdscrtdp,pmdscrtdt,pmdsstus,pmds054) #151111-00023#1-add-'pmds054' #210205-00039#1 mark
                             pmdsownid,pmdsowndp,pmdscrtid,pmdscrtdp,pmdscrtdt,pmdsstus,pmds054,pmds014) #210205-00039#1 add
         VALUES (g_enterprise,g_site,l_pmds.pmdsdocno,l_pmds.pmdsdocdt,g_detail2_d[l_ac].pmds000,l_pmds.pmds001,      #160906-00006#1 g_today->pmdsdocdt/pmds001
                 g_user,g_dept,g_detail2_d[l_ac].pmds007,l_pmds.pmds008,l_pmds.pmds009,
                 l_pmds.pmds011,g_detail2_d[l_ac].pmds012,l_pmds.pmds021,g_detail2_d[l_ac].pmds031,
                 g_detail2_d[l_ac].pmds032,g_detail2_d[l_ac].pmds033,g_detail2_d[l_ac].pmds034,
                 g_detail2_d[l_ac].pmds035,l_pmds.pmds036,g_detail2_d[l_ac].pmds037,
                 g_detail2_d[l_ac].pmds038,g_detail2_d[l_ac].pmds039,l_pmds.pmds047,
                 g_detail2_d[l_ac].pmds048,g_detail2_d[l_ac].pmds049,l_pmds.pmds100,l_pmds.pmdsownid, 
                 #l_pmds.pmdsowndp,l_pmds.pmdscrtid,l_pmds.pmdscrtdp,l_pmds.pmdscrtdt,l_pmds.pmdsstus,l_pmds.pmds054) #151111-00023#1-add-'l_pmds.pmds054' #210205-00039#1 mark
                 l_pmds.pmdsowndp,l_pmds.pmdscrtid,l_pmds.pmdscrtdp,l_pmds.pmdscrtdt,l_pmds.pmdsstus,l_pmds.pmds054,l_pmds.pmds014) #210205-00039#1 add
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam.* TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'ins pmds_t'
            LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
            CALL cl_err()
            LET l_success = FALSE
         ELSE
            #170217-00025#4 add-S
            IF SQLCA.sqlerrd[3] > 0 THEN
               LET l_flag = TRUE
            END IF
            #170217-00025#4 add-E
            INITIALIZE l_pmdt.* TO NULL
            LET l_pmdt011 = '1'
            
            FOREACH apmp110_cs1 USING g_detail2_d[l_ac].pmds007,g_detail2_d[l_ac].pmds000  #161207-00053#1-1 mod add pmds000
               INTO l_pmdt.pmdtseq,l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt016,l_pmdt.pmdt017,
                    l_pmdt.pmdt018,l_pmdt.pmdt019,l_pmdt.pmdt020,l_pmdt.pmdt021,l_pmdt.pmdt022,
                    l_pmdt.pmdt023,l_pmdt.pmdt024,l_pmdt.pmdt036,l_pmdt.pmdt037,l_pmdt.pmdt042,
                    l_pmdt.pmdt043,l_pmdt.pmdt044,l_pmdt.pmdt046,l_pmdt.pmdt063
               #子件特性='1.一般'
               LET l_pmdt.pmdt005 = '1'
               LET l_pmdt.pmdt025 = '1'
               LET l_pmdt.pmdt026 = 'N'
               #LET l_pmdt.pmdt041 = 'N'   #200106-00047#6 mark
               #200106-00047#6 add---(S)
               LET l_pmdt.pmdt041 = ''  
               SELECT imaf034 INTO l_pmdt.pmdt041
                 FROM imaf_t
                WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = l_pmdt.pmdt006
               #200106-00047#6 add---(E)
               
               LET l_pmdt.pmdt084 = 'Y' #151111-00023#1-add
               #狀態碼='1:一般'
               LET l_pmdt.pmdt052 = '1'
               LET l_pmdt.pmdt053 = 0
               LET l_pmdt.pmdt054 = 0
               LET l_pmdt.pmdt055 = 0
               LET l_pmdt.pmdt062 = 'N'
               CASE g_detail2_d[l_ac].pmds000
                  WHEN '4'  #無採購收貨入庫
                     LET l_pmdt.pmdt051 = tm.pmdt0511
                  WHEN '7'  #採購倉退單
                     LET l_pmdt.pmdt051 = tm.pmdt0512
                  OTHERWISE EXIT CASE
               END CASE
               LET l_money = l_pmdt.pmdt036 * l_pmdt.pmdt024
               CALL s_tax_ins(l_pmds.pmdsdocno,l_pmdt.pmdtseq,'0',g_site,l_money,l_pmdt.pmdt046,l_pmdt.pmdt024,
                              g_detail2_d[l_ac].pmds037,g_detail2_d[l_ac].pmds038,'','','')
                    RETURNING l_pmdt.pmdt038,l_pmdt.pmdt047,l_pmdt.pmdt039,l_xrcd113,l_xrcd114,l_xrcd115,
                              l_xrcd123,l_xrcd124,l_xrcd125,l_xrcd133,l_xrcd134,l_xrcd135
   
               INSERT INTO pmdt_t(pmdtent,pmdtsite,pmdtdocno,pmdtseq,pmdt005,pmdt006,
                     pmdt007,pmdt011,pmdt016,pmdt017,pmdt018,pmdt019,pmdt020,pmdt021,pmdt022,pmdt023,
                     pmdt024,pmdt025,pmdt026,pmdt036,pmdt037,pmdt038,pmdt039,pmdt041,pmdt042,pmdt043,
                     pmdt044,pmdt046,pmdt047,pmdt051,pmdt052,pmdt053,pmdt054,pmdt055,pmdt062,pmdt063,pmdt084) #151111-00023#1-add-'pmdt084'
               VALUES(g_enterprise,g_site,l_pmds.pmdsdocno,l_pmdt.pmdtseq,l_pmdt.pmdt005,l_pmdt.pmdt006,
                      l_pmdt.pmdt007,l_pmdt011,l_pmdt.pmdt016,l_pmdt.pmdt017,l_pmdt.pmdt018,
                      l_pmdt.pmdt019,l_pmdt.pmdt020,l_pmdt.pmdt021,l_pmdt.pmdt022,l_pmdt.pmdt023,
                      l_pmdt.pmdt024,l_pmdt.pmdt025,l_pmdt.pmdt026,l_pmdt.pmdt036,l_pmdt.pmdt037,
                      l_pmdt.pmdt038,l_pmdt.pmdt039,l_pmdt.pmdt041,l_pmdt.pmdt042,l_pmdt.pmdt043,
                      l_pmdt.pmdt044,l_pmdt.pmdt046,l_pmdt.pmdt047,l_pmdt.pmdt051,l_pmdt.pmdt052,
                      l_pmdt.pmdt053,l_pmdt.pmdt054,l_pmdt.pmdt055,l_pmdt.pmdt062,l_pmdt.pmdt063,l_pmdt.pmdt084) #151111-00023#1-add-'l_pmdt.pmdt084'
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam.* TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'ins pmdt_t'
                  LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
                  LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               #170217-00025#4 add-S
               IF SQLCA.sqlerrd[3] > 0 THEN
                  LET l_flag = TRUE
               END IF
               #170217-00025#4 add-E
               
               #多庫儲批不勾選時，則也新增一筆資料到收貨/驗退/入庫/倉退單多庫儲批收貨明細檔
               INSERT INTO pmdu_t(pmduent,pmdusite,pmdudocno,pmduseq,pmduseq1,pmdu001,pmdu002,pmdu005,pmdu006,
                                  pmdu007,pmdu008,pmdu009,pmdu010,pmdu011,pmdu012,pmdu013,pmdu014,pmdu015)
                          VALUES (g_enterprise,g_site,l_pmds.pmdsdocno,l_pmdt.pmdtseq,'1',l_pmdt.pmdt006,
                                  l_pmdt.pmdt007,l_pmdt.pmdt063,l_pmdt.pmdt016,l_pmdt.pmdt017,
                                  l_pmdt.pmdt018,l_pmdt.pmdt019,l_pmdt.pmdt020,l_pmdt.pmdt021,
                                  l_pmdt.pmdt022,l_pmdt.pmdt053,l_pmdt.pmdt054,l_pmdt.pmdt055)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam.* TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'ins pmdu_t'
                  LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
                  LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
                  CALL cl_err()
                  LET l_success = FALSE
               END IF
               #170217-00025#4 add-S
               IF SQLCA.sqlerrd[3] > 0 THEN
                  LET l_flag = TRUE
               END IF
               #170217-00025#4 add-E
   
               #將本次產生的收貨入庫單、倉退單所產生的'VMI結算否'欄位更新成'2:已結算'
               IF l_success THEN
                  INITIALIZE l_inaj.* TO NULL
                  FOREACH apmp110_cs2 USING l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt063,l_pmdt.pmdt016,
                                            l_pmdt.pmdt017,l_pmdt.pmdt018,l_pmdt.pmdt019
                                       INTO l_inaj.inaj001,l_inaj.inaj002,l_inaj.inaj003,l_inaj.inaj011 
                     
                     IF l_inaj.inaj011 < 0 THEN
                        LET l_inaj.inaj004 = '-1'
                     ELSE
                        LET l_inaj.inaj004 = '1'
                     END IF
                     #171201-00045#19 -s 180821 add by 08172
                     #检查是否已结算
                     LET l_inaj030 = ''
                     LET l_inaj031 = ''
                     LET l_inaj032 =''
                     SELECT inaj030,inaj031,inaj032
                       INTO l_inaj030,l_inaj031,l_inaj032
                       FROM inaj_t
                      WHERE inajent = g_enterprise
                        AND inajsite = g_site
                        AND inaj001 = l_inaj.inaj001
                        AND inaj002 = l_inaj.inaj002
                        AND inaj003 = l_inaj.inaj003
#                        AND inaj004 = l_inaj.inaj004  #181203-00028#1 mark
                        AND inaj004 = (CASE WHEN inaj036 = '501' THEN 1 ELSE l_inaj.inaj004 END)   #181203-00028#1 mod
                     IF l_inaj030 = '2' AND NOT cl_null(l_inaj031) AND NOT cl_null(l_inaj032) THEN
                        INITIALIZE g_errparam.* TO NULL
                        LET g_errparam.code = "apm-01276"
                        LET g_errparam.extend = ""
                        LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
                        LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
                        CALL cl_err()
                        LET l_success = FALSE
                     END IF
                     IF l_success THEN
                     #171201-00045#19 -e 180821 add by 08172
                        UPDATE inaj_t SET inaj030 = '2',               #VMI交易結算否
                                          inaj031 = l_pmds.pmdsdocno,  #VMI對應入庫/倉退單號
                                          inaj032 = l_pmdt.pmdtseq     #VMI對應入庫/倉退項次
                         WHERE inajent = g_enterprise
                           AND inajsite = g_site
                           AND inaj001 = l_inaj.inaj001
                           AND inaj002 = l_inaj.inaj002
                           AND inaj003 = l_inaj.inaj003
#                           AND inaj004 = l_inaj.inaj004  #181203-00028#1 mark
                           AND inaj004 = (CASE WHEN inaj036 = '501' THEN 1 ELSE l_inaj.inaj004 END)   #181203-00028#1 mod
                        IF SQLCA.sqlcode THEN
                           INITIALIZE g_errparam.* TO NULL
                           LET g_errparam.code = SQLCA.sqlcode
                           LET g_errparam.extend = 'upd inaj_t'
                           LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
                           LET g_errparam.coll_vals[2] = l_pmdt.pmdtseq
                           CALL cl_err()
                           LET l_success = FALSE
                        END IF
                        
                        #151111-00023#1-add----(S)
                        IF l_success THEN
                           DELETE FROM apmp110_tmp3
                            WHERE inaj001 = l_inaj.inaj001     #單據編號  
                              AND inaj002 = l_inaj.inaj002     #項次  
                              AND inaj003 = l_inaj.inaj003     #項序  
                              AND inaj011 = l_inaj.inaj011     #交易數量  
                        
                           LET l_cnt = ''
                           SELECT COUNT(*) INTO l_cnt FROM apmp110_tmp3
                            WHERE inaj005 = l_pmdt.pmdt006     #料件編號  
                              AND inaj006 = l_pmdt.pmdt007     #產品特徵  
                              AND inaj007 = l_pmdt.pmdt063     #庫存管理特徵  
                              AND inaj008 = l_pmdt.pmdt016     #庫位編號   
                              AND inaj009 = l_pmdt.pmdt017     #儲位編號  
                              AND inaj010 = l_pmdt.pmdt018     #批號  
                              AND inaj012 = l_pmdt.pmdt019     #交易單位  
                           IF cl_null(l_cnt) OR l_cnt = 0 THEN
                              #如果在apmp110_tmp3已無資料的話，就應該把apmp110_tmp2的項目移除 
                              #入庫/倉退明細 
                              DELETE FROM apmp110_tmp2
                               WHERE pmdt006 = l_pmdt.pmdt006 #料件編號
                                 AND pmdt007 = l_pmdt.pmdt007 #產品特徵
                                 AND pmdt063 = l_pmdt.pmdt063 #庫存管理特徵
                                 AND pmdt016 = l_pmdt.pmdt016 #庫位編號   
                                 AND pmdt017 = l_pmdt.pmdt017 #儲位編號  
                                 AND pmdt018 = l_pmdt.pmdt018 #批號  
                                 AND pmdt019 = l_pmdt.pmdt019 #交易單位  
                        
                              SELECT COUNT(*) INTO l_cnt
                                FROM apmp110_tmp2
                               WHERE pmdt063 = g_detail2_d[l_ac].pmds007
                                 AND pmdt000_s = g_detail2_d[l_ac].pmds000  #161207-00053#1-1 add
                              IF cl_null(l_cnt) OR l_cnt = 0 THEN
                                 #入庫/倉退單據 
                                 DELETE FROM apmp110_tmp1
                                  WHERE pmds007 = g_detail2_d[l_ac].pmds007
                                    AND pmds000 = g_detail2_d[l_ac].pmds000  #161207-00053#1-1 add
                              END IF
                           END IF
                        END IF
                        #151111-00023#1-add----(E)
                     END IF #171201-00045#19 180821 add by 08172
                     INITIALIZE l_inaj.* TO NULL
                     
                  END FOREACH
               END IF
                  
               
               INITIALIZE l_pmdt.* TO NULL
               LET l_pmdt011 = l_pmdt011 + 1
               
            END FOREACH
         END IF
         
         IF l_success THEN
            CALL s_tax_recount(l_pmds.pmdsdocno)
                 RETURNING l_pmds.pmds043,l_pmds.pmds046,l_pmds.pmds044,l_xrcd113,l_xrcd114,l_xrcd115
            UPDATE pmds_t SET pmds043 = l_pmds.pmds043,
                              pmds046 = l_pmds.pmds046,
                              pmds044 = l_pmds.pmds044
             WHERE pmdsdocno = l_pmds.pmdsdocno
               AND pmdsent = g_enterprise
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam.* TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd pmds_t'
               LET g_errparam.coll_vals[1] = g_detail2_d[l_ac].pmds007
               CALL cl_err()
               LET l_success = FALSE
            END IF
         END IF
         
        
         IF l_success THEN
            #產生完相關單據後需呼叫各單據作業的確認與過帳流程進行單據確認與過帳
            IF s_apmt520_conf_chk(l_pmds.pmdsdocno) THEN
               IF s_apmt520_conf_upd(l_pmds.pmdsdocno) THEN
                  IF s_apmt520_posted_chk(l_pmds.pmdsdocno) THEN
                     IF NOT s_apmt520_posted_upd(l_pmds.pmdsdocno) THEN
                        LET l_success = FALSE
                     #200302-00005#1 add -S
                     ELSE
                        CASE g_detail2_d[l_ac].pmds000
                           WHEN '4'  #無採購收貨入庫
                              IF l_ac = 1 THEN 
                                 LET l_strno1 = l_pmds.pmdsdocno 
                              END IF
                              LET l_endno1 = l_pmds.pmdsdocno
                           WHEN '7'  #採購倉退單
                              IF l_ac = 1 THEN 
                                 LET l_strno2 = l_pmds.pmdsdocno 
                              END IF
                              LET l_endno2 = l_pmds.pmdsdocno
                           OTHERWISE EXIT CASE
                        END CASE
                     #200302-00005#1 add -E
                     END IF
                  ELSE
                     LET l_success = FALSE
                  END IF
               ELSE
                  LET l_success = FALSE
               END IF
            ELSE
               LET l_success = FALSE
            END IF
         END IF
      END IF   #181101-00020#1 add
   END FOR

   LET l_ac = g_cnt
   LET g_cnt = 0
   CALL cl_err_collect_show() 
   
   #ming 20150616 add -----------------------(S) 
   #如果是最後一筆才出錯的話，是不會回到foreach的最前面去改變tot_success 
   #所以在離開foreach後，還要再一次的檢查l_success的狀態 
   IF NOT l_success THEN
      LET tot_success = FALSE
   END IF
   #ming 20150616 add -----------------------(E) 
   
   #170217-00025#4 add-S
   IF l_flag = FALSE THEN
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.code = 'sub-00491'   #無資料產生
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      CLOSE apmp110_cl  #171201-00045#19 180821 add by 08172
      RETURN            
   END IF
   #170217-00025#4 add-E
   CLOSE apmp110_cl  #171201-00045#19 180821 add by 08172
   IF tot_success THEN
      CALL s_transaction_end('Y','0')
      LET g_flag = '1'
   ELSE
      CALL s_transaction_end('N','0')
   END IF

   IF g_bgjob = "N" THEN
      #前景作業完成處理
      CALL apmp110_b_fill() #151111-00023#2-add
      CALL cl_ask_pressanykey("std-00012")
      #200302-00005#1 add -S
      IF tot_success THEN
         IF NOT l_flag1  THEN
            #无采购收货入库单
            IF NOT cl_null(l_strno1) AND NOT cl_null(l_endno1)THEN
               LET l_confmsg = cl_getmsg('aap-01186',g_lang),cl_getmsg('aap-01194',g_lang),cl_getmsg('aap-01187',g_lang)
               IF cl_ask_confirm(l_confmsg) THEN
                  INITIALIZE lc_param_link.* TO NULL 
                  LET lc_param_link.prog = 'apmt532'
                  LET lc_param_link.default_wc = "pmdsdocno BETWEEN '",l_strno1 CLIPPED,"' ",
                                             " AND '",l_endno1 CLIPPED,"' "
                  CALL cl_cmdrun(util.JSON.stringify(lc_param_link))
               END IF
            END IF
            #仓退单
            IF NOT cl_null(l_strno2) AND NOT cl_null(l_endno2)THEN
               LET l_confmsg = cl_getmsg('aap-01186',g_lang),cl_getmsg('aap-01195',g_lang),cl_getmsg('aap-01187',g_lang)
               IF cl_ask_confirm(l_confmsg)THEN
                  INITIALIZE lc_param_link.* TO NULL 
                  LET lc_param_link.prog = 'apmt580'
                  LET lc_param_link.default_wc = "pmdsdocno BETWEEN '",l_strno2 CLIPPED,"' ",
                                             " AND '",l_endno2 CLIPPED,"' "
                  CALL cl_cmdrun(util.JSON.stringify(lc_param_link))
               END IF
            END IF
         END IF
      END IF 
      #200302-00005#1 add -E
   ELSE
      #背景作業完成處理
   END IF

END FUNCTION

################################################################################
# Descriptions...: 控制蘭未必輸否
# Memo...........:
# Usage..........: CALL apmp110_set_required()
#                  RETURNING r_flag
# Input parameter: no
# Return code....: r_flag
# Date & Author..: 141007 By whitney
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_set_required()
DEFINE r_flag    LIKE type_t.chr1
DEFINE l_cnt1    LIKE type_t.num5
DEFINE l_cnt2    LIKE type_t.num5

   CALL cl_set_comp_required("pmdtdocno1,pmdtdocno2,pmdt0512",FALSE)
   LET r_flag = '0'
   LET l_cnt1 = 0
   LET l_cnt2 = 0
   SELECT COUNT(*) INTO l_cnt1 FROM apmp110_tmp1
    WHERE pmds000 = '4'  #收貨入庫單
   SELECT COUNT(*) INTO l_cnt2 FROM apmp110_tmp1
    WHERE pmds000 = '7'  #採購倉退單
   IF l_cnt1 > 0 THEN
      CALL cl_set_comp_required("pmdtdocno1",TRUE)
      LET r_flag = '1'
   END IF
   IF l_cnt2 > 0 THEN
      CALL cl_set_comp_required("pmdtdocno2,pmdt0512",TRUE)
      LET r_flag = '2'
   END IF
   IF l_cnt1 > 0 AND l_cnt2 > 0 THEN
      LET r_flag = '3'
   END IF
   RETURN r_flag

END FUNCTION

################################################################################
# Descriptions...: 重取所有單身的單價
# Memo...........:
# Usage..........: CALL apmp110_get_price_1()
# Input parameter: 
# Return code....: 
# Date & Author..: #161021-00034#1
# Modify.........:
################################################################################
PRIVATE FUNCTION apmp110_get_price_1()
DEFINE l_idx_t_1    LIKE type_t.num5
DEFINE l_idx_t_2    LIKE type_t.num5

   LET l_idx_t_1 = g_detail2_idx
   LET l_idx_t_2 = g_detail3_idx
   
   FOR g_detail2_idx = 1 TO g_detail2_d.getLength()
      CALL apmp110_fetch_1()
      FOR g_detail3_idx = 1 TO g_detail3_d.getLength()
         CALL apmp110_get_price()
      END FOR
   END FOR
   
   LET g_detail2_idx = l_idx_t_1
   LET g_detail3_idx = l_idx_t_2

END FUNCTION

################################################################################
# Descriptions...: 设定栏位必输
# Memo...........:
# Usage..........: CALL apmp110_set_no_required_b()
# Date & Author..: 2018-11-5 By 05423
# Modify.........: #181101-00020#1 add
################################################################################
PRIVATE FUNCTION apmp110_set_required_b()
   
   CALL cl_set_comp_required("pmds031,pmds032,pmds033,pmds037,pmds039,pmdt046",TRUE) 
   CALL cl_set_comp_entry("pmds031,pmds032,pmds033,pmds037,pmds039,pmdt046",TRUE) 
   
END FUNCTION

################################################################################
# Descriptions...: 设定栏位非必输
# Memo...........:
# Usage..........: CALL apmp110_set_required_b()
# Date & Author..: 2018-11-5 By 05423
# Modify.........: #181101-00020#1 add
################################################################################
PRIVATE FUNCTION apmp110_set_no_required_b()

   IF g_detail2_idx > 0 THEN
      IF cl_null(g_detail2_d[g_detail2_idx].pmds000) THEN
         CALL cl_set_comp_required("pmds031,pmds032,pmds033,pmds037,pmds039,pmdt046",FALSE) 
         CALL cl_set_comp_entry("pmds031,pmds032,pmds033,pmds037,pmds039,pmdt046",FALSE) 
      END IF
   END IF
END FUNCTION

#end add-point
 
{</section>}
 
