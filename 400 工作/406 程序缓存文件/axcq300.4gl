#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axcq300.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:84(2016-12-30 16:01:54), PR版次:0084(2021-04-16 14:55:54)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000406
#+ Filename...: axcq300
#+ Description: 成本計算前勾稽查詢
#+ Creator....: 01258(2014-09-11 00:00:00)
#+ Modifier...: 08992 -SD/PR- 01996
 
{</section>}
 
{<section id="axcq300.global" type="s" >}
#應用 q02 樣板自動產生(Version:60)
#add-point:填寫註解說明 name="global.memo"
#151015-00002#1  2015/10/15  By Alberti   1.AP單的單身單身判斷 2.增加雜收單無設定單價的判斷
#160318-00025#8  2016/04/21  By 07675     將重複內容的錯誤訊息置換為公用錯誤訊息(r.v）
#160503-00030#3  2016/05/06  By Sarah     axcq300_b_fill2() SQL效能優化
#160530-00005#3  2016/05/30  By 03538     採購性質串 scc 2061 應用分類一, 若為Y 之性質才可顯示
#160628-00009#1  2016/06/28  By tsungyung 將金額取絕對值
#160907-00003#1  2016/09/09  By 02295     帳款檢核條件加上apca001 IN('01','02','13','17','22')
#160929-00039#1  2016/09/30  By charles4m 當 S-FIN-6013 未啟用時，不需要判斷產品特徵 (xcbb004 = inaj006)
#160802-00020#7  2016/10/06  By shiun     增加帳套權限管控、法人權限管控
#161205-00025#19 2016/12/22  By 02295     效能优化
#160913-00024#1  2016/12/30  By 08992     修改FUNCTION axcq300_b_fill2()段在單據編號(inaj001)前面多顯示作業編號(inaj035)與作業名稱(gzzal003)
#161223-00018#1  2016/01/09  By 08992     此段應為判斷成本結案日故將sfaa038(保稅核銷)改為sfaa048(成本結案日)
#170105-00011#10 2017/02/09  By 02295     效能优化 
#170207-00035#1  2017/02/13  By zhujing   同一料，即使有多產品特徵，成本階都是同一階。在axci120的產品特徵都為空的，故axcq300不用多串xcbb004的條件
#170220-00006#2  2017/02/20  By 02040     增加條件，抓取已確認之請款金額
#170301-00040#1  2017/03/01  By 02295     判断杂收单未设定入库单价 排除非成本仓
#170301-00056#1  2017/03/02  By 02295     请款单付款金额与单身不合检查去除,此段检查在AP结账前做检查了
#170410-00014#1  2017/04/12  By 02111     判斷啟用 按制程计算成本參數 (S-FIN-6003)，改判段 axct203 的資料。
#170515-00005#1  2017/05/15  By lixiang   判断料号是否存在产品分类时，只抓取已确认的料号资料
#170615-00053#4  2017/06/16  By 09042     添加ent条件
#170628-00024#1  2017/06/28  By lixh      SQL中缺少ENT
#170625-00005#1  2017/07/07  By 02295     单身料号增加查询功能
#170618-00103#1  2017/08/22  By lixiang   以工單的資料，判別有異常的成本階
#170421-00068#1  2017/08/22  By lixiang   判斷料件的基礎單位(imaa006)與上期成本單位(xcbb005，有值才比)不一致時，顯示「該料已修改過基礎單位，請重新開帳」
#171113-00010#1  2017/11/15  By 08993     修改重工工單未發料報成本階錯誤的問題
#171204-00008#1  2017/12/07  By 10042     axcq300_b_fill2()裡#2.入庫/退貨單与请款单未匹配SQL段,原條件為 pmdsstus <> 'X' 調整為 pmdsstus = 'S'
#171208-00015#1  2018/01/03  By 05423     1.修正axcq300_cs14，axcq300_cs15 sql中多余括号的问题 2.调整入库金额为0的报错信息
#171228-00048#16 2018/01/03  by 10461     1.於ui_dialog內的BEFORE DIALOG呼叫cl_set_act_visible，若程式無輸出功能則直接撰寫關閉指令 2.檢查ON ACTION output以及ON ACTION quickprint的add-point內是否有內容
#171227-00003#1  2018/01/19  By 07423     1.若該料件無上期成本結算資料,不要顯示[該料已修改過基礎單位，請重新開帳]之錯誤訊息
#                                         2.[該料已修改過基礎單位，請重新開帳]之錯誤訊息應排除費用性料號
#180320-00035#1  2018/03/21  By 02295     axcq300稽核成本阶问题时,参与稽核工单的条件中需加上开始发料日期<=计算年度期別的最后一天,成本结案日>=计算年去期別的第一天,或者为空.
#180723-00008#1  2018/08/15  By 02111     axcq300 axc-00565 的判斷 sfbaseq1 = 0 條件。
#180821-00061#1  2018/08/22  By 05423     1.检查基础单位时，排除费用料号。
#                                         2.检查成本阶时，排除返工工单。
#180904-00054#1  2018/09/05  By 05423     检查成本阶时，元件应抓取已发料的资料
#181203-00051#1  2018/12/03  By 02295     axc-00927错误信息里面的参数设置做替换不对,将'$1'改成'%1'
#181120-00026#1  2018/12/20  By 10500     去除未過賬雜收單的檢核
#180808-00004#1  2018/12/28  By 07423     調整PREPARE axcq300_pr19的SQL效能優化
#190102-00044#1  2019/01/04  By 10130     未计算成本不能查到非成本仓
#190214-00008#1  2019/02/14  By 07423     調整PREPARE axcq300_pr19的SQL效能優化
#190531-00011#1  2019/05/31  By 02295     "该料已修改过基础单位，请重新开账" 改报错应排除掉在在axct300中已经做过开账的资料
#190626-00037#1  2019/09/04  By 12787     检核料号要存在当前据点
#191105-00012#1  2019/11/06  By 02295     检查杂收单没有抓到单价的检查,应用inbc_t实际的库存异动明细档去关联xccw_t的数据,因为杂收单申请的时候可以不输入库储批,无法判断出哪个库收入的
#191227-00011#1  2019/12/30  By 02295     成本计算前勾稽检查判断入库金额未0的检查排除掉非成本仓的入库数据
#200416-00020#1  2020/04/17  By 02295     检查成本阶时，抓取发料单时只抓取已过账的的发料单
#200407-00013#1  2020/04/20  By 05488     新增12項成本檢核控卡
#200428-00039#1  2020/04/29  By 11892     aint302的单据产品特征赋值为空，应取inbb002
#200421-00018#1  2020/04/22  By 01996     增加库存交易明细,成本开账资料的成本分群码校验
#200407-00013#4  2020/05/20  By 00593     針對200407-00013#1增加的12項成本檢核SQL中科目的過濾，判斷agli021存貨類型條件及agli161存貨科目兩個條件必須同時符合才抓
#200302-00034#35 2020/06/15  By 10130     修正单身笔数显示问题
#200724-00018#1  2020/07/24  By 02295     检查axcq300条件限定本期可计算范围的工单.日期的条件1.开单日期<=当前计算年度期別的最后一天2.成本结案日期>=当前计算年度期別的第一天 或者 成本结案日期为空
#200727-00041#1  2020/07/28  By 02295     增加判断多产出主件,实际产出=预计产出但工单未结案的提示
#200821-00042#1  2020/08/24  By 01996     多产出主件未结工单的提示需要依整单的角度判断,而不是按sfac_t的明细,所以实际产出量的判断需要用not exists的方式判断
#200903-00107#1  2020/09/07  By 02295     用xccb_t关联检查成本分群,xcbb与主表关联只要关联到料号,不需要关联产品特征,成本阶不分产品特征 
#201015-00064#1  2020/10/15  By 13132     修正cast as varchar写法
#201127-00017#1  2020/11/27  By 07804     檢查有分錄底稿且分錄底稿科目裡有"存貨"科目，不迴轉時需排除沖暫估的存貨單身
#201208-00015#1  2020/12/08  By 12787     将错误代码axc-00979/axc-00983检核加到axcq300上
#201210-00001#1  2020/12/10  By 12787     axc-00979/axc-00983检核 加上作业编号asft300
#201218-00004#1  2020/12/18  By 12787     修正公式，改成 发料数量*QPA分母/QPA分子*（1+超交率），不然先算括号里的有尾差
#210105-00032#1  2021/01/14  By 12787     1.axcq300与axcq400错误讯息同步:添加检核axc-00977/axc-00978/axc-00980/axc-00981/axc-00982
#                                         2.修正欄位錯位問題
#210220-00037#1  2021/02/20  By 01996     分录底稿存货科目与单据单身金额检查时,增加入库单类型为'4' 无采购收货入库
#210220-00046#1  2021/02/20  By 06978     修正檢核應付傳票底稿金額與帳款單身是否相符，帳款單身應排除費用料號
#210222-00024#1  2021/03/05  By 02295     判断当期之后是否有其他入库单,如果没有则在本月提示
#210319-00051#1  2021/03/25  By 01996     1.检核杂收入库单价时,应该用xccw282单价判断,不应该用xccw202金额判断
#                                         2.关联xccw_t时 缺少条件 xccw003,xccw004,xccw005,xccw007,xccw008
#210416-00009#1  2021/04/16  By 01996     调整检核当期发料量是否足套的地方,抓取发料单不能只限定当期,改为抓取<=当期的发料单
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:45) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:45) --- end ---
 
IMPORT os
IMPORT util
IMPORT JAVA com.fourjs.fgl.lang.FglRecord  #(ver:46) add
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#(ver:46) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:46) --- add end ---
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_xccc_d RECORD
       #statepic       LIKE type_t.chr1,
       
       xccc006 LIKE xccc_t.xccc006, 
   xccc007 LIKE xccc_t.xccc007, 
   xccc006_desc LIKE imaal_t.imaal003, 
   xccc006_desc_1 LIKE type_t.chr500, 
   inaj035 LIKE inaj_t.inaj035, 
   inaj035_desc LIKE gzzal_t.gzzal003, 
   docno LIKE type_t.chr20, 
   info LIKE type_t.chr500 
       END RECORD
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
TYPE type_tm         RECORD
                     xccccomp   LIKE xccc_t.xccccomp,  #法人組織
                     xccccomp_desc   LIKE type_t.chr500,
                     xcccld     LIKE xccc_t.xcccld  ,  #帳別編號
                     xcccld_desc     LIKE type_t.chr500,
                     xccc004    LIKE xccc_t.xccc004 ,  #年度
                     xccc005    LIKE xccc_t.xccc005 ,  #期別
                     xccc001    LIKE xccc_t.xccc001 ,  #本位币顺序
                     xccc001_desc    LIKE type_t.chr500,
                     xccc003    LIKE xccc_t.xccc003,    #成本計算類型
                     xccc003_desc    LIKE type_t.chr500                   
                     END RECORD
DEFINE tm            type_tm
DEFINE g_fetch       LIKE type_t.chr1

DEFINE g_page_cnt        LIKE type_t.num5   #總页數
DEFINE g_page_idx        LIKE type_t.num5   #当页笔数
#DEFINE g_detail_idx         LIKE type_t.num5   #当行
#DEFINE g_detail_cnt         LIKE type_t.num5   #总行

DEFINE g_jump                LIKE type_t.num10
DEFINE g_no_ask              LIKE type_t.num5

DEFINE g_glaa003    LIKE glaa_t.glaa003 #会计周期参照表号
DEFINE g_bdate      LIKE glav_t.glav004 #年度+期別對應的起始截止日期
DEFINE g_edate      LIKE glav_t.glav004

TYPE type_sr RECORD
      xccc006       LIKE xccc_t.xccc006, #料件编号
      xccc007       LIKE xccc_t.xccc007, #料件特性
      xccc006_desc  LIKE type_t.chr500,  #料件品名
      xccc006_desc1 LIKE type_t.chr500,  #料件规格
      docno         LIKE type_t.chr80,   #单据编号
      info          STRING               #错误说明 
      END RECORD
DEFINE sr           DYNAMIC ARRAY OF type_sr
DEFINE g_yy         LIKE xccc_t.xccc004  #年度 上一年度期别
DEFINE g_mm         LIKE xccc_t.xccc005  #期别 上一年度期别
DEFINE g_para_data1          LIKE type_t.chr80     #采用特性否    #fengmy150123
DEFINE g_para_data2          LIKE type_t.chr80     #按制程计算成本 #170410-00014#1 add

#2015/3/26 liuym -------str--- 
TYPE type_g_xccc_e RECORD
       v          STRING
       END RECORD
DEFINE g_param                     type_g_xccc_e  
#2015/3/26 liuym -------end---
#add--160802-00020#7 By shiun--(S)
DEFINE g_wc_cs_ld            STRING
DEFINE g_wc_cs_comp          STRING
#add--160802-00020#7 By shiun--(E)
#200407-00013#1---add---start---
DEFINE g_glaa004             LIKE glaa_t.glaa004               #會計科目參照表
DEFINE g_glaa024             LIKE glaa_t.glaa024               #單據別參照表
DEFINE g_glaa121             LIKE glaa_t.glaa121               #啟用分錄否
DEFINE g_ecom0001            LIKE type_t.num5                  #單別長度
DEFINE g_ecom0003            LIKE type_t.num5                  #營運據點代表號長度
DEFINE g_ecom0002            LIKE type_t.chr1                  #營運據點與單別間以-分隔
DEFINE g_ecom0008            LIKE type_t.chr1                  #單據編號格式
DEFINE g_ecom0004            LIKE type_t.chr1                  #營運據點/單別/單號間以-分隔
DEFINE g_n1                  LIKE type_t.num5                  #截取長度1
DEFINE g_n2                  LIKE type_t.num5                  #截取長度2
#200407-00013#1---add---end---


#end add-point
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_xccc_d
DEFINE g_master_t                   type_g_xccc_d
DEFINE g_xccc_d          DYNAMIC ARRAY OF type_g_xccc_d
DEFINE g_xccc_d_t        type_g_xccc_d
 
      
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
DEFINE l_ac_d               LIKE type_t.num10              #單身idx 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_current_page       LIKE type_t.num5              #目前所在頁數
DEFINE g_detail_cnt         LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_detail_cnt2        LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_master_idx         LIKE type_t.num10
DEFINE g_detail_idx         LIKE type_t.num10
DEFINE g_detail_idx2        LIKE type_t.num10
DEFINE g_hyper_url          STRING                        #hyperlink的主要網址
DEFINE g_tot_cnt            LIKE type_t.num10             #計算總筆數
DEFINE g_num_in_page        LIKE type_t.num10             #每頁筆數
DEFINE g_current_row_tot    LIKE type_t.num10             #目前所在總筆數
DEFINE g_page_act_list      STRING                        #分頁ACTION清單
DEFINE g_page_start_num     LIKE type_t.num10             #目前頁面起始筆數
DEFINE g_page_end_num       LIKE type_t.num10             #目前頁面結束筆數
 
#多table用wc
DEFINE g_wc_table           STRING
DEFINE g_wc_filter_table    STRING
DEFINE g_detail_page_action STRING
DEFINE g_pagestart          LIKE type_t.num10
 
 
#190108-00038 ---start---
DEFINE g_simple_mode         LIKE type_t.num5              #是否切換為簡化模式(TRUE:簡化  FALSE:標準)
DEFINE g_simple_name         LIKE dzzc_t.dzzc002           #簡易畫面的名稱
DEFINE g_current_mode        LIKE type_t.chr10             #紀錄目前的畫面是什麼模式(simple:簡化  standard:標準)
DEFINE g_simple_mode_exists  LIKE type_t.chr1              #紀錄是否有簡化模式可供切換(Y/N)
DEFINE gs_first_time         LIKE type_t.chr1              ##紀錄是否為第一次進入init()段
#190108-00038 --- end ---
 
#add-point:自定義模組變數-客製(Module Variable) name="global.variable_customerization"

##end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axcq300.main" type="s" >}
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
   CALL cl_ap_init("axc","")
 
   #add-point:作業初始化 name="main.init"
   #add--160802-00020#7 By shiun--(S)
   CALL s_fin_create_account_center_tmp()                      #展組織下階成員所需之暫存檔 
   CALL s_fin_azzi800_sons_query(g_today)
   CALL s_fin_account_center_ld_str() RETURNING g_wc_cs_ld
   CALL s_fin_get_wc_str(g_wc_cs_ld)  RETURNING g_wc_cs_ld
   CALL s_axc_get_authcomp() RETURNING g_wc_cs_comp            #抓取使用者有拜訪權限據點的對應法人  
   #add--160802-00020#7 By shiun--(E)
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
 
 
    
 
 
   #190108-00038 ---start---
   
   #190108-00038 --- end ---
  
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      #190108-00038 ---modify start---
      OPEN WINDOW w_axcq300 WITH FORM cl_ap_formpath('axc',g_code)
      #190108-00038 --- modify end ---   
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL axcq300_init()   
 
      #進入選單 Menu (="N")
      CALL axcq300_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_axcq300
      
   END IF 
   
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="axcq300.init" type="s" >}
#+ 畫面資料初始化
PRIVATE FUNCTION axcq300_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #190108-00038 ---start---
   DEFINE tpl_msg            STRING
   DEFINE tpl_node           om.DomNode
   DEFINE tpl_nodelist       om.NodeList
   DEFINE tpl_node_name      STRING
   DEFINE tpl_node_tagname   STRING
   DEFINE tpl_i              LIKE type_t.num5
   #190108-00038 --- end ---
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point
   
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_error_show  = 1
   LET g_wc_filter   = "  1 = 1  "   #171117-00042 modify 將1=1改為空白  #171219-00006 改為"  1 = 1  "
   LET g_wc_filter_t = ""   #171117-00042 modify 將1=1改為空白
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   
   
   
   #190108-00038 ---start---
   
   #190108-00038 --- end ---
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('b_xccc001','8914')
   CALL cl_set_act_visible_toolbaritem("filter",FALSE)
   CALL cl_set_act_visible_toolbaritem("qbe_select,qbe_save,qbeclear",FALSE)
   #fengmy 150123----begin
   #根據參數顯示隱藏料件特性
   CALL cl_get_para(g_enterprise,g_site,'S-FIN-6013') RETURNING g_para_data1  #采用特性否
   CALL cl_get_para(g_enterprise,g_site,'S-FIN-6003') RETURNING g_para_data2  #按制程计算成本 ##170410-00014#1 add
   
 
   IF g_para_data1 = 'Y' THEN
      CALL cl_set_comp_visible('b_xccc007',TRUE)                    
   ELSE                     
      CALL cl_set_comp_visible('b_xccc007',FALSE)                
   END IF 
   #fengmy 150123----end   
   #end add-point
 
   #第一次進入init段時才跑default_search()，以避免後續作畫面轉換時因為重複執行init()段而導致g_wc條件值被異動
   IF cl_null(gs_first_time) OR gs_first_time <> "N" THEN   #190108-00038
      CALL axcq300_default_search()
   END IF   #190108-00038
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.default_search" type="s" >}
PRIVATE FUNCTION axcq300_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   #應用 qs27 樣板自動產生(Version:3)
   #+ 組承接外部參數時資料庫欄位對應條件(單身)
   IF NOT cl_null(g_argv[01]) THEN
      LET g_wc = g_wc, " xcccld = '", g_argv[01], "' AND "
   END IF
 
   IF NOT cl_null(g_argv[02]) THEN
      LET g_wc = g_wc, " xccc001 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET g_wc = g_wc, " xccc002 = '", g_argv[03], "' AND "
   END IF
   IF NOT cl_null(g_argv[04]) THEN
      LET g_wc = g_wc, " xccc003 = '", g_argv[04], "' AND "
   END IF
   IF NOT cl_null(g_argv[05]) THEN
      LET g_wc = g_wc, " xccc004 = '", g_argv[05], "' AND "
   END IF
   IF NOT cl_null(g_argv[06]) THEN
      LET g_wc = g_wc, " xccc005 = '", g_argv[06], "' AND "
   END IF
   IF NOT cl_null(g_argv[07]) THEN
      LET g_wc = g_wc, " xccc006 = '", g_argv[07], "' AND "
   END IF
   IF NOT cl_null(g_argv[08]) THEN
      LET g_wc = g_wc, " xccc007 = '", g_argv[08], "' AND "
   END IF
   IF NOT cl_null(g_argv[09]) THEN
      LET g_wc = g_wc, " xccc008 = '", g_argv[09], "' AND "
   END IF
 
 
 
 
 
 
   #200330-00044 ---start---
   IF NOT cl_null(g_default_wc) THEN
      LET g_wc = g_default_wc
   ELSE
   #200330-00044 --- end ---
      IF NOT cl_null(g_wc) THEN
         LET g_wc = g_wc.subString(1,g_wc.getLength()-5)
      ELSE
         #預設查詢條件
         LET g_wc = " 1=2"
      END IF
   END IF   #200330-00044
 
   #add-point:default_search段開始後 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.ui_dialog" type="s" >}
#+ 功能選單 
PRIVATE FUNCTION axcq300_ui_dialog()
   #add-point:ui_dialog段define-客製 name="ui_dialog.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      STRING
   DEFINE li_idx     LIKE type_t.num10
   DEFINE lc_action_choice_old     STRING
   DEFINE lc_current_row           LIKE type_t.num10
   DEFINE ls_js      STRING
   DEFINE la_param   RECORD
                     prog       STRING,
                     actionid   STRING,
                     background LIKE type_t.chr1,
                     param      DYNAMIC ARRAY OF STRING
                     END RECORD
   #(ver:46) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:46) --- add end ---
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_sucess   LIKE type_t.num5   #2015/3/26 liuym
   #end add-point 
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"
   
   #end add-point
 
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
         
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   LET g_wc = ''   #只有input条件
   #end add-point
 
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_current_row_tot = 1
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      LET g_detail_idx = 1
      LET g_detail_idx2 = 1
      CALL axcq300_b_fill()
   ELSE
      CALL axcq300_query()
   END IF
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_xccc_d.clear()
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 1
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL axcq300_init()
      END IF
   
      #190108-00038 ---start---
      
      #190108-00038 --- end ---
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_xccc_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
 
               #為避免按上下筆影響執行效能，所以有作一些處理
               LET lc_action_choice_old = g_action_choice
               LET g_action_choice = "fetch"
               CALL axcq300_fetch()
               LET g_action_choice = lc_action_choice_old
               LET g_master_idx = l_ac
               CALL axcq300_detail_action_trans()
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point  
            
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
      
 
         
 
      
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
            CALL axcq300_detail_action_trans()
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
         CALL cl_set_act_visible('output', TRUE)           # 171228-00048 #16 add
         CALL cl_set_act_visible('quickprint', FALSE)      # 171228-00048 #16 add
         #2015/3/26 liuym---str----
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN        
               IF g_xccc_d.getLength() > 0 THEN
                  LET g_param.v = "axcq300_temp" 
                  #CALL axcq300_create_temp() RETURNING l_sucess               #200407-00013#1 mark
                  #IF l_sucess THEN                                            #200407-00013#1 mark
                     #CALL axcq300_ins_temp()     #161205-00025#19 mark
                     CALL axcq300_ins_temp_new()     #161205-00025#19 add
                     CALL axcq300_x01(' 1=1', g_param.v)
                  #END IF                                                      #200407-00013#1 mark
               END IF         
            END IF
         #2015/3/26 liuym---str---- 
            #end add-point
 
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL axcq300_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               
               
            END IF
 
 
 
 
      
         ON ACTION filter
            LET g_action_choice="filter"
            CALL axcq300_filter()
            #add-point:ON ACTION filter name="menu.filter"
            
            #END add-point
 
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice = "exit"
            EXIT DIALOG
 
         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG
 
         ON ACTION datarefresh   # 重新整理
            LET g_error_show = 1
            CALL axcq300_b_fill()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:46) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
 
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     CALL g_export_node.clear()
                     LET l_arr_len = g_xccc_d.getLength()
                     LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[1] = "s_detail1"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[1][l_arr_cnt] = g_xccc_d[l_arr_cnt]
                     END FOR
 
 
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_poi()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                     
                     #END add-point
 
                  OTHERWISE   #使用原始樣板
               #(ver:46) --- end ---
                     CALL g_export_node.clear()
                     LET g_export_node[1] = base.typeInfo.create(g_xccc_d)
                     LET g_export_id[1]   = "s_detail1"
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                     
                     #END add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_to_excel()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:43)
                     
                     #END add-point
               END CASE   #(ver:46) add
            END IF
 
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
 
         ON ACTION detail_first               #page first
            LET g_action_choice = "detail_first"
            LET g_detail_page_action = "detail_first"
            CALL axcq300_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            CALL axcq300_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            CALL axcq300_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            CALL axcq300_b_fill()
 
         #190108-00038 ---start---
         
         #190108-00038 --- end ---
 
         
         
 
         #add-point:ui_dialog段自定義action name="ui_dialog.more_action"
         
         #end add-point
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"
         
         #end add-point
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"
         
         #end add-point
      END DIALOG
      
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.query" type="s" >}
#+ QBE資料查詢
PRIVATE FUNCTION axcq300_query()
   #add-point:query段define-客製 name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      LIKE type_t.chr500
   DEFINE ls_wc2     LIKE type_t.chr500
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING
   DEFINE lp_str     STRING   #201109-00009
   #add-point:query段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   CALL axcq300_query2()
   RETURN
   #end add-point 
   
   #add-point:FUNCTION前置處理 name="query.before_function"
 
   #end add-point
 
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_xccc_d.clear()
 
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
   
   LET g_qryparam.state = "c"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_wc_filter = "  1 = 1  "   #171117-00042 將1=1改為空白  #171219-00006 改為"  1 = 1  "
   LET g_detail_page_action = ""
   LET g_pagestart = 1
   
   #wc備份
   LET ls_wc = g_wc
   LET ls_wc2 = g_wc2
   LET g_master_idx = l_ac
 
   LET g_wc = ""   #(ver:44)
   LET g_wc2 = ""   #(ver:44)
 
   
   CALL cl_qbe_init()   #200917-00047
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單身根據table分拆construct
      CONSTRUCT g_wc_table ON xccc006,inaj035
           FROM s_detail1[1].b_xccc006,s_detail1[1].b_inaj035
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct name="cs.head.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #----<<b_xccc006>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_xccc006
            #add-point:BEFORE FIELD b_xccc006 name="construct.b.page1.b_xccc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_xccc006
            
            #add-point:AFTER FIELD b_xccc006 name="construct.a.page1.b_xccc006"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.b_xccc006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_xccc006
            #add-point:ON ACTION controlp INFIELD b_xccc006 name="construct.c.page1.b_xccc006"
            
            #END add-point
 
 
         #----<<b_xccc007>>----
         #----<<b_xccc006_desc>>----
         #----<<b_xccc006_desc_1>>----
         #----<<b_inaj035>>----
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_inaj035
            #add-point:BEFORE FIELD b_inaj035 name="construct.b.page1.b_inaj035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_inaj035
            
            #add-point:AFTER FIELD b_inaj035 name="construct.a.page1.b_inaj035"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.b_inaj035
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_inaj035
            #add-point:ON ACTION controlp INFIELD b_inaj035 name="construct.c.page1.b_inaj035"
            
            #END add-point
 
 
         #----<<b_inaj035_desc>>----
         #----<<b_docno>>----
         #----<<b_info>>----
   
       
      END CONSTRUCT
      
 
      
 
  
      #add-point:query段more_construct name="query.more_construct"
      
      #end add-point 
 
      ON ACTION accept
         #add-point:ON ACTION accept name="query.accept"
         
         #end add-point
 
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG 
 
      #add-point:query段查詢方案相關ACTION設定前 name="query.set_qbe_action_before"
      
      #end add-point 
 
      ON ACTION qbeclear   # 條件清除
         CLEAR FORM
         #add-point:條件清除後 name="query.qbeclear"
         
         #end add-point 
 
      #add-point:query段查詢方案相關ACTION設定後 name="query.set_qbe_action_after"
      
      #end add-point 
 
      #191129-00016 -S-
      ON ACTION qbe_select
         LET ls_wc = ""
         CLEAR FORM #200326-00032#1
         CALL cl_qbe_list("c") RETURNING ls_wc
         #add-point:條件清除後 name="ui_dialog.qbe_select"
         
         #end add-point
 
      ON ACTION queryplansel
         LET g_action_choice = "queryplan" #ver:81
         CALL cl_dlg_qryplan_select() RETURNING ls_wc
 
      ON ACTION qbe_save
         CALL cl_qbe_save()
      #191129-00016 -E-
 
   END DIALOG
 
   
 
   LET g_wc = g_wc_table 
 
 
   
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
 
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      LET g_wc = " 1=2"
      LET g_wc2 = " 1=1"
   #  LET g_wc_filter = g_wc_filter_t   #171117-00042 mark
      RETURN
   ELSE
      LET g_master_idx = 1
   END IF
        
   #add-point:cs段after_construct name="cs.after_construct"
 
   #end add-point
        
   LET g_error_show = 1
   CALL axcq300_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = -100 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   END IF
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
   
END FUNCTION
 
{</section>}
 
{<section id="axcq300.b_fill" type="s" >}
#+ 單身陣列填充
PRIVATE FUNCTION axcq300_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_wc2          STRING
   DEFINE ls_sql_rank     STRING
   DEFINE ls_sqladdon_t   STRING  #200917-00047
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   #fengmy 150123----begin
   #根據參數顯示隱藏料件特性
   IF cl_null(tm.xccccomp) THEN
      CALL cl_get_para(g_enterprise,g_site,'S-FIN-6013') RETURNING g_para_data1   #采用特性否       
   ELSE
      CALL cl_get_para(g_enterprise,tm.xccccomp,'S-FIN-6013') RETURNING g_para_data1   #采用特性否       
   END IF
   IF g_para_data1 = 'Y' THEN
      CALL cl_set_comp_visible('b_xccc007',TRUE)                    
   ELSE                     
      CALL cl_set_comp_visible('b_xccc007',FALSE)                
   END IF 
   #fengmy 150123----end  
   CALL axcq300_b_fill2()
   RETURN
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
 
   #171117-00042 ---mark start---
#  IF cl_null(g_wc_filter) THEN
#     LET g_wc_filter = " 1=1"
#  END IF
   #171117-00042 --- mark end ---
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   
#  LET ls_wc = g_wc, " AND ", g_wc2, " AND ", g_wc_filter, cl_sql_auth_filter()   #(ver:40) add cl_sql_auth_filter()   #171117-00042 mark
   #200917-00047 -S-
   #檢查後加入，避免疊加 (代追單)
  #LET ls_wc = g_wc, " AND ", g_wc2, " ", cl_sql_auth_filter()   #(ver:40) add cl_sql_auth_filter()   #171117-00042 modify   #200917-00047 mark
 
   LET ls_sqladdon_t = " AND ", g_wc2
   IF g_wc.getIndexOf(ls_sqladdon_t,1) THEN
      LET ls_wc = g_wc   #200917-00047
   ELSE
      LET ls_wc = g_wc, ls_sqladdon_t   #200917-00047
   END IF
 
   LET ls_sqladdon_t = cl_sql_auth_filter()
   IF NOT ls_wc.getIndexOf(ls_sqladdon_t,1) THEN
      LET ls_wc = ls_wc, ls_sqladdon_t   #200917-00047
   END IF
   #200917-00047 -E-
 
   LET ls_sql_rank = "SELECT xccc006,xccc007,'','','','','',''  ,DENSE_RANK() OVER( ORDER BY xcccld,xccc001,xccc002,xccc003,xccc004,xccc005,xccc006,xccc007,xccc008) AS RANK FROM xccc_t",
 
 
                     "",
                     " WHERE xcccent= ? AND 1=1 AND ", ls_wc
    
   LET ls_sql_rank = ls_sql_rank, cl_sql_add_filter("xccc_t"),
                     " ORDER BY xcccld,xccc001,xccc002,xccc003,xccc004,xccc005,xccc006,xccc007,xccc008"
 
   #add-point:b_fill段rank_sql_after name="b_fill.rank_sql_after"
   
   #end add-point
 
#  LET g_sql = "SELECT COUNT(1) FROM (",ls_sql_rank,")"   #200804-00006 mark
   LET g_sql = "SELECT COUNT(1) FROM (",ls_sql_rank,") PGS_A01"   #200804-00006
 
   PREPARE b_fill_cnt_pre FROM g_sql
   EXECUTE b_fill_cnt_pre USING g_enterprise INTO g_tot_cnt
   FREE b_fill_cnt_pre
 
   #add-point:b_fill段rank_sql_after_count name="b_fill.rank_sql_after_count"
   
   #end add-point
 
   CASE g_detail_page_action
      WHEN "detail_first"
          LET g_pagestart = 1
 
      WHEN "detail_previous"
          LET g_pagestart = g_pagestart - g_num_in_page
          IF g_pagestart < 1 THEN
              LET g_pagestart = 1
          END IF
 
      WHEN "detail_next"
         LET g_pagestart = g_pagestart + g_num_in_page
         IF g_pagestart > g_tot_cnt THEN
            LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
            WHILE g_pagestart > g_tot_cnt
               LET g_pagestart = g_pagestart - g_num_in_page
            END WHILE
         END IF
 
      WHEN "detail_last"
         LET g_pagestart = g_tot_cnt - (g_tot_cnt mod g_num_in_page) + 1
         WHILE g_pagestart > g_tot_cnt
            LET g_pagestart = g_pagestart - g_num_in_page
         END WHILE
 
      OTHERWISE
         LET g_pagestart = 1
 
   END CASE
 
   LET g_sql = "SELECT xccc006,xccc007,'','','','','',''",
            #  " FROM (",ls_sql_rank,")",   #200804-00006 mark
               " FROM (",ls_sql_rank,") PGS_A02 ",   #200804-00006
              " WHERE RANK >= ",g_pagestart,
                " AND RANK < ",g_pagestart + g_num_in_page
 
   #add-point:b_fill段sql_after name="b_fill.sql_after"
   
   #end add-point
 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE axcq300_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR axcq300_pb
   
   OPEN b_fill_curs USING g_enterprise
   #190108-00038 ---start---
   #add-point:單身OPEN CURSOR name="b_fill.using_ent"
   
   #end add-point
   #190108-00038 --- end --- 
 
   CALL g_xccc_d.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   IF g_cnt = 0 THEN
      LET g_cnt = 1
   END IF
   LET l_ac = 1   
 
   FOREACH b_fill_curs INTO g_xccc_d[l_ac].xccc006,g_xccc_d[l_ac].xccc007,g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1,g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc,g_xccc_d[l_ac].docno,g_xccc_d[l_ac].info
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #LET g_xccc_d[l_ac].statepic = cl_get_actipic(g_xccc_d[l_ac].statepic)
 
      
 
      #add-point:b_fill段資料填充 name="b_fill.fill"
      
      #end add-point
 
      CALL axcq300_detail_show("'1'")      
 
      CALL axcq300_xccc_t_mask()
 
      IF l_ac > g_max_rec THEN
         #若是因為切換畫面的話，不用再次顯示超過最大顯示筆數的訊息
         IF cl_null(g_action_choice) OR g_action_choice <> "ui_change" THEN   #190108-00038
            IF g_error_show = 1 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "" 
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
   
 
   
   CALL g_xccc_d.deleteElement(g_xccc_d.getLength())   
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   
   #end add-point
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   
   #end add-point
 
   LET g_detail_cnt = g_xccc_d.getLength()
#  DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE axcq300_pb
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL axcq300_detail_index_setting()
 
   #重新計算單身筆數並呈現
#  CALL axcq300_detail_action_trans()   #(ver:44) mark
 
   IF g_xccc_d.getLength() > 0 THEN
      LET l_ac = 1
      CALL axcq300_fetch()
   END IF
 
   CALL axcq300_detail_action_trans()   #(ver:44)
   
      CALL axcq300_filter_show('xccc006','b_xccc006')
   CALL axcq300_filter_show('inaj035','b_inaj035')
 
 
   #add-point:b_fill段結束前 name="b_fill.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.fetch" type="s" >}
#+ 單身陣列填充2
PRIVATE FUNCTION axcq300_fetch()
   #add-point:fetch段define-客製 name="fetch.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:fetch段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="fetch.before_function"
   
   #end add-point
 
 
   #add-point:陣列清空 name="fetch.array_clear"
   
   #end add-point
   
   LET li_ac = l_ac 
   
 
   
   #add-point:單身填充後 name="fetch.after_fill"
   
   #end add-point 
   
 
   #add-point:陣列筆數調整 name="fetch.array_deleteElement"
   
   #end add-point
 
   LET l_ac = li_ac
   
END FUNCTION
 
{</section>}
 
{<section id="axcq300.detail_show" type="s" >}
#+ 顯示相關資料
PRIVATE FUNCTION axcq300_detail_show(ps_page)
   #add-point:show段define-客製 name="detail_show.define_customerization"
   
   #end add-point
   DEFINE ps_page    STRING
   DEFINE ls_sql     STRING
   #add-point:show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point
 
   #add-point:detail_show段之前 name="detail_show.before"
   
   #end add-point
   
   
 
   #讀入ref值
   IF ps_page.getIndexOf("'1'",1) > 0 THEN
      #帶出公用欄位reference值page1
      
 
      #add-point:show段單身reference name="detail_show.body.reference"

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_xccc_d[l_ac].xccc006
            LET ls_sql = "SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'"
            LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
            CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
            LET g_xccc_d[l_ac].xccc006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_xccc_d[l_ac].xccc006_desc

      #end add-point
   END IF
   
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.filter" type="s" >}
#+ filter過濾功能
PRIVATE FUNCTION axcq300_filter()
   #add-point:filter段define-客製 name="filter.define_customerization"
   
   #end add-point
   DEFINE  ls_result   STRING
   DEFINE  lp_str      STRING   #201109-00009#2
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point
   
   #add-point:FUNCTION前置處理 name="filter.before_function"
   
   #end add-point
 
   LET l_ac = 1
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter.trim()   #171117-00042 modify
   LET g_wc_t = g_wc
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')   #171117-00042 modify
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON xccc006,inaj035
                          FROM s_detail1[1].b_xccc006,s_detail1[1].b_inaj035
 
         BEFORE CONSTRUCT
                     DISPLAY axcq300_filter_parser('xccc006') TO s_detail1[1].b_xccc006
            DISPLAY axcq300_filter_parser('inaj035') TO s_detail1[1].b_inaj035
 
         
         AFTER FIELD b_xccc006
            #add-point:AFTER FIELD b_xccc006 name="construct.c.filter.af.pages.b_xccc006"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
         AFTER FIELD b_inaj035
            #add-point:AFTER FIELD b_inaj035 name="construct.c.filter.af.pages.b_inaj035"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
   #201109-00009#2
 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
                  #----<<b_xccc006>>----
         #Ctrlp:construct.c.filter.page1.b_xccc006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_xccc006
            #add-point:ON ACTION controlp INFIELD b_xccc006 name="construct.c.filter.page1.b_xccc006"
            
            #END add-point
 
 
         #----<<b_xccc007>>----
         #----<<b_xccc006_desc>>----
         #----<<b_xccc006_desc_1>>----
         #----<<b_inaj035>>----
         #Ctrlp:construct.c.filter.page1.b_inaj035
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_inaj035
            #add-point:ON ACTION controlp INFIELD b_inaj035 name="construct.c.filter.page1.b_inaj035"
            
            #END add-point
 
 
         #----<<b_inaj035_desc>>----
         #----<<b_docno>>----
         #----<<b_info>>----
   
 
      END CONSTRUCT
 
      #add-point:filter段add_cs name="filter.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()    #2
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
 
   #171117-00042 ---modify start---
   IF NOT INT_FLAG THEN
      IF NOT g_wc.getIndexOf(g_wc_filter,1) THEN   #200828-00027檢查後疊加,避免重複 (代追單)
         LET g_wc_filter = "   AND   ", g_wc_filter, "   "
         LET g_wc = g_wc, g_wc_filter          #200917-00047
      END IF   #200828-00027
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF
   #171117-00042 --- modify end ---
   
      CALL axcq300_filter_show('xccc006','b_xccc006')
   CALL axcq300_filter_show('inaj035','b_inaj035')
 
    
   CALL axcq300_b_fill()
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.filter_parser" type="s" >}
#+ filter欄位解析
PRIVATE FUNCTION axcq300_filter_parser(ps_field)
   #add-point:filter段define-客製 name="filter_parser.define_customerization"
   
   #end add-point
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num5
   DEFINE li_tmp2    LIKE type_t.num5
   DEFINE ls_var     STRING
   #add-point:filter段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_parser.before_function"
   
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
 
{<section id="axcq300.filter_show" type="s" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION axcq300_filter_show(ps_field,ps_object)
   #add-point:filter_show段define-客製 name="filter_show.define_customerization"
   
   #end add-point
   DEFINE ps_field         STRING
   DEFINE ps_object        STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
   #add-point:filter_show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_show.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="filter_show.before_function"
   
   #end add-point
 
   LET ls_name = "formonly.", ps_object
 
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = axcq300_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.insert" type="s" >}
#+ insert
PRIVATE FUNCTION axcq300_insert()
   #add-point:insert段define-客製 name="insert.define_customerization"
   
   #end add-point
   #add-point:insert段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point
 
   #add-point:insert段control name="insert.control"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="axcq300.modify" type="s" >}
#+ modify
PRIVATE FUNCTION axcq300_modify()
   #add-point:modify段define-客製 name="modify.define_customerization"
   
   #end add-point
   #add-point:modify段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point
 
   #add-point:modify段control name="modify.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.reproduce" type="s" >}
#+ reproduce
PRIVATE FUNCTION axcq300_reproduce()
   #add-point:reproduce段define-客製 name="reproduce.define_customerization"
   
   #end add-point
   #add-point:reproduce段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point
 
   #add-point:reproduce段control name="reproduce.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.delete" type="s" >}
#+ delete
PRIVATE FUNCTION axcq300_delete()
   #add-point:delete段define-客製 name="delete.define_customerization"
   
   #end add-point
   #add-point:delete段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point
 
   #add-point:delete段control name="delete.control"
   
   #end add-point 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.detail_action_trans" type="s" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION axcq300_detail_action_trans()
   #add-point:detail_action_trans段define-客製 name="detail_action_trans.define_customerization"
   
   #end add-point
   #add-point:detail_action_trans段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_action_trans.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_action_trans.before_function"
   #200302-00034#35 add--s
   IF g_pagestart = 0 THEN
      LET g_pagestart = 1
   END IF
   #(ver:44) --- end ---
   LET g_current_row_tot = g_pagestart + g_detail_idx - 1
   #(ver:44) ---modify start---
   IF g_xccc_d.getLength() > 0 THEN
      DISPLAY g_current_row_tot TO FORMONLY.idx
      DISPLAY g_xccc_d.getLength() TO FORMONLY.cnt
   ELSE
      DISPLAY '' TO FORMONLY.idx
      DISPLAY '' TO FORMONLY.cnt
   END IF
   #200302-00034#35 add--e
   #end add-point
 
   #因應單身切頁功能，筆數計算方式調整
   #(ver:44) ---start---
   IF g_pagestart = 0 THEN
      LET g_pagestart = 1
   END IF
   #(ver:44) --- end ---
   LET g_current_row_tot = g_pagestart + g_detail_idx - 1
   #(ver:44) ---modify start---
   IF g_tot_cnt > 0 THEN
      DISPLAY g_current_row_tot TO FORMONLY.h_index
      DISPLAY g_xccc_d.getLength() TO FORMONLY.h_count
   ELSE
      IF g_xccc_d.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.h_index
         DISPLAY g_tot_cnt TO FORMONLY.h_count
      ELSE
         DISPLAY '' TO FORMONLY.h_index
         DISPLAY '' TO FORMONLY.h_count
      END IF
   END IF
 
 
   #(ver:44) --- modify end ---
 
   #顯示單身頁面的起始與結束筆數
   LET g_page_start_num = g_pagestart
   LET g_page_end_num = g_pagestart + g_num_in_page - 1
   DISPLAY g_page_start_num TO FORMONLY.p_start
   DISPLAY g_page_end_num TO FORMONLY.p_end
 
   #目前不支援跳頁功能
   LET g_page_act_list = "detail_first,detail_previous,'',detail_next,detail_last"
   CALL cl_navigator_detail_page_setting(g_page_act_list,g_current_row_tot,g_pagestart,g_num_in_page,g_tot_cnt)
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.detail_index_setting" type="s" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION axcq300_detail_index_setting()
   #add-point:detail_index_setting段define-客製 name="deatil_index_setting.define_customerization"
   
   #end add-point
   DEFINE li_redirect     BOOLEAN
   DEFINE ldig_curr       ui.Dialog
   #add-point:detail_index_setting段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_index_setting.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_index_setting.before_function"
   
   #end add-point
 
   IF g_curr_diag IS NOT NULL THEN
      CASE
         WHEN g_curr_diag.getCurrentRow("s_detail1") <= "0"
            LET g_detail_idx = 1
            IF g_xccc_d.getLength() > 0 THEN
               LET li_redirect = TRUE
            END IF
         WHEN g_curr_diag.getCurrentRow("s_detail1") > g_xccc_d.getLength() AND g_xccc_d.getLength() > 0
            LET g_detail_idx = g_xccc_d.getLength()
            LET li_redirect = TRUE
         WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
            IF g_detail_idx > g_xccc_d.getLength() THEN
               LET g_detail_idx = g_xccc_d.getLength()
            END IF
            LET li_redirect = TRUE
      END CASE
   END IF
 
   IF li_redirect THEN
      LET ldig_curr = ui.Dialog.getCurrent()
      CALL ldig_curr.setCurrentRow("s_detail1", g_detail_idx)
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="axcq300.mask_functions" type="s" >}
 &include "erp/axc/axcq300_mask.4gl"
 
{</section>}
 
{<section id="axcq300.other_function" readonly="Y" type="s" >}

#查询，pattern不支持功能需求，用此代替pattern
PRIVATE FUNCTION axcq300_query2()
   DEFINE ls_wc             LIKE type_t.chr500
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_glaa001         LIKE glaa_t.glaa001
   DEFINE l_glaa016         LIKE glaa_t.glaa016
   DEFINE l_glaa020         LIKE glaa_t.glaa020
   DEFINE l_flag            LIKE type_t.num5   #fengmy150227 放弃查询就不查数据库
   
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_xccc_d.clear()
   LET g_wc_filter = " 1=1"
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
   
   LET g_qryparam.state = "c"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   
   #wc備份
   LET ls_wc = g_wc
   LET g_master_idx = l_ac
 
   
   CALL axcq300_default()  #查询前预设
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      #单头input 条件，且栏位必输
      INPUT tm.xccccomp,tm.xcccld,tm.xccc004,tm.xccc005,tm.xccc001,tm.xccc003
         FROM b_xccccomp,b_xcccld,b_xccc004,b_xccc005,b_xccc001,b_xccc003
         ATTRIBUTE(WITHOUT DEFAULTS)
      
         BEFORE INPUT
         
         AFTER FIELD b_xccccomp
            CALL axcq300_chk_column('b_xccccomp') RETURNING l_success
            IF NOT l_success THEN
               NEXT FIELD CURRENT
            END IF
            CALL s_desc_get_department_desc(tm.xccccomp) RETURNING tm.xccccomp_desc #法人組織
            DISPLAY tm.xccccomp_desc TO b_xccccomp_desc

         AFTER FIELD b_xcccld
            CALL axcq300_chk_column('b_xcccld') RETURNING l_success
            IF NOT l_success THEN
               NEXT FIELD CURRENT
            END IF
            CALL s_desc_get_ld_desc(tm.xcccld) RETURNING tm.xcccld_desc #帳別編號
            DISPLAY tm.xcccld_desc TO b_xcccld_desc
            
         AFTER FIELD b_xccc001
            SELECT glaa001,glaa016,glaa020 INTO l_glaa001,l_glaa016,l_glaa020
              FROM glaa_t
             WHERE glaaent = g_enterprise
               AND glaald  = tm.xcccld
            CASE tm.xccc001
               WHEN '1' 
                 INITIALIZE g_ref_fields TO NULL
                 LET g_ref_fields[1] = l_glaa001
                 CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
                 LET tm.xccc001_desc = '', g_rtn_fields[1] , ''                  
               WHEN '2'
                 INITIALIZE g_ref_fields TO NULL
                 LET g_ref_fields[1] = l_glaa016
                 CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
                 LET tm.xccc001_desc = '', g_rtn_fields[1] , ''
               WHEN '3'
                 INITIALIZE g_ref_fields TO NULL
                 LET g_ref_fields[1] = l_glaa020
                 CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
                 LET tm.xccc001_desc = '', g_rtn_fields[1] , ''
            END CASE
            DISPLAY tm.xccc001_desc TO b_xccc001_desc
   
         AFTER FIELD b_xccc003
            CALL axcq300_chk_column('b_xccc003') RETURNING l_success
            IF NOT l_success THEN
               NEXT FIELD CURRENT
            END IF
            #成本計算類型说明
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = tm.xccc003
            CALL ap_ref_array2(g_ref_fields,"SELECT xcatl003 FROM xcatl_t WHERE xcatlent='"||g_enterprise||"' AND xcatl001=? AND xcatl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET tm.xccc003_desc = '', g_rtn_fields[1] , ''
            DISPLAY tm.xccc003_desc TO b_xccc003_desc

         AFTER INPUT
            CALL axcq300_chk_column('b_xccccomp+b_xcccld') RETURNING l_success
            IF NOT l_success THEN
               NEXT FIELD b_xccccomp
            END IF
            
      
         ON ACTION controlp INFIELD b_xccccomp #法人组织
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            #add--160802-00020#7 By shiun--(S)
      	   #增加法人過濾條件
            IF NOT cl_null(g_wc_cs_comp) THEN
               LET g_qryparam.where = " ooef001 IN ",g_wc_cs_comp
            END IF
            #add--160802-00020#7 By shiun--(E)
            CALL q_ooef001_2()                      #呼叫開窗
            LET tm.xccccomp = g_qryparam.return1
            DISPLAY tm.xccccomp TO b_xccccomp  #顯示到畫面上
            CALL s_desc_get_department_desc(tm.xccccomp) RETURNING tm.xccccomp_desc #法人組織
            DISPLAY tm.xccccomp_desc TO b_xccccomp_desc
            NEXT FIELD b_xccccomp                     #返回原欄位

         ON ACTION controlp INFIELD b_xcccld   #账别编号
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept
            #add--160802-00020#7 By shiun--(S)
            #增加帳套權限控制
            IF NOT cl_null(g_wc_cs_ld) THEN
               LET g_qryparam.where = " glaald IN ",g_wc_cs_ld
            END IF
            #add--160802-00020#7 By shiun--(E)
            CALL q_authorised_ld()                #呼叫開窗
            LET tm.xcccld = g_qryparam.return1
            DISPLAY tm.xcccld TO b_xcccld  #顯示到畫面上
            
            CALL s_desc_get_ld_desc(tm.xcccld) RETURNING tm.xcccld_desc #帳別編號
            DISPLAY tm.xcccld_desc TO b_xcccld_desc
            NEXT FIELD b_xcccld                     #返回原欄位
 
         ON ACTION controlp INFIELD b_xccc003   #成本计算类型
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            CALL q_xcat001()                       #呼叫開窗
            LET tm.xccc003 = g_qryparam.return1
            DISPLAY tm.xccc003 TO b_xccc003  #顯示到畫面上
            
            #成本計算類型说明
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = tm.xccc003
            CALL ap_ref_array2(g_ref_fields,"SELECT xcatl003 FROM xcatl_t WHERE xcatlent='"||g_enterprise||"' AND xcatl001=? AND xcatl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET tm.xccc003_desc = '', g_rtn_fields[1] , ''
            DISPLAY tm.xccc003_desc TO b_xccc003_desc
            NEXT FIELD b_xccc003                     #返回原欄位

      END INPUT
      #170625-00005#1---add---e
      CONSTRUCT g_wc_table ON xccc006 FROM s_detail1[1].b_xccc006
                     
         BEFORE CONSTRUCT
        
         BEFORE FIELD b_xccc006
        
         AFTER FIELD b_xccc006
        
         ON ACTION controlp INFIELD b_xccc006
		 	   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		 	   LET g_qryparam.reqry = FALSE
            CALL q_imaa001_10()                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO b_xccc006  #顯示到畫面上
            NEXT FIELD b_xccc006                     #返回原欄位            
      END CONSTRUCT
      #170625-00005#1---add---e
      ON ACTION accept
         ACCEPT DIALOG
         
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG
      
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG 
 
      #add-point:query段查詢方案相關ACTION設定前

      #end add-point 
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
 
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
  #   ON ACTION qbeclear   # 條件清除
  #      CLEAR FORM
  #
      #add-point:query段查詢方案相關ACTION設定後

      #end add-point 
 
   END DIALOG
 
   
   LET l_flag = 1   #fengmy150227
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      LET l_flag = 0   #fengmy150227
      #還原
      LET g_wc = ls_wc
   ELSE
      LET g_master_idx = 1
   END IF
   
   LET g_wc = g_wc_table 
 
 
        
   LET g_wc2 = " 1=1"
 
        
   #add-point:cs段after_construct

   #end add-point
        
   LET g_error_show = 1
   IF l_flag THEN    #fengmy150227
      CALL axcq300_b_fill()
   END IF            #fengmy150227
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = -100 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
 
   END IF
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
   
END FUNCTION

#查询前预设
PRIVATE FUNCTION axcq300_default()
DEFINE  l_glaa001        LIKE glaa_t.glaa001

   #预设当前site的法人，主账套，年度期别，成本计算类型
   CALL s_axc_set_site_default() RETURNING tm.xccccomp,tm.xcccld,tm.xccc004,tm.xccc005,tm.xccc003  
   DISPLAY tm.xccccomp,tm.xcccld,tm.xccc004,tm.xccc005,tm.xccc003 TO b_xccccomp,b_xcccld,b_xccc004,b_xccc005,b_xccc003
   #fengmy 150123----begin
   #根據參數顯示隱藏料件特性
   IF cl_null(tm.xccccomp) THEN
      CALL cl_get_para(g_enterprise,g_site,'S-FIN-6013') RETURNING g_para_data1   #采用特性否       
   ELSE
      CALL cl_get_para(g_enterprise,tm.xccccomp,'S-FIN-6013') RETURNING g_para_data1   #采用特性否       
   END IF
   IF g_para_data1 = 'Y' THEN
      CALL cl_set_comp_visible('b_xccc007',TRUE)                    
   ELSE                     
      CALL cl_set_comp_visible('b_xccc007',FALSE)                
   END IF 
   #fengmy 150123----end   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = tm.xccccomp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET tm.xccccomp_desc = '', g_rtn_fields[1] , ''
   DISPLAY tm.xccccomp_desc TO b_xccccomp_desc 
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = tm.xcccld
   CALL ap_ref_array2(g_ref_fields,"SELECT glaal002 FROM glaal_t WHERE glaalent='"||g_enterprise||"' AND glaalld=? AND glaal001='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET tm.xcccld_desc = '', g_rtn_fields[1] , ''
   DISPLAY tm.xcccld_desc TO b_xcccld_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = tm.xccc003
   CALL ap_ref_array2(g_ref_fields,"SELECT xcatl003 FROM xcatl_t WHERE xcatlent='"||g_enterprise||"' AND xcatl001=? AND xcatl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET tm.xccc003_desc = '', g_rtn_fields[1] , ''
   DISPLAY tm.xccc003_desc TO b_xccc003_desc
      
   LET tm.xccc001 = '1'
   DISPLAY tm.xccc001 TO b_xccc001
   
   SELECT glaa001 INTO l_glaa001
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = tm.xcccld

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = l_glaa001
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET tm.xccc001_desc = '', g_rtn_fields[1] , ''
   DISPLAY tm.xccc001_desc TO b_xccc001_desc
END FUNCTION

#检查栏位
PRIVATE FUNCTION axcq300_chk_column(p_column)
   DEFINE p_column      LIKE type_t.chr20
   DEFINE r_success     LIKE type_t.num5
   

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE

   CASE p_column
      WHEN 'b_xccccomp'  #法人
           IF NOT cl_null(tm.xccccomp) THEN
              #校验
              INITIALIZE g_chkparam.* TO NULL
              LET g_chkparam.arg1 = tm.xccccomp
              #add--160802-00020#7 By shiun--(S)
              #增加帳套權限控制
              IF NOT cl_null(g_wc_cs_comp) THEN
                 LET g_chkparam.where = " ooef001 IN ",g_wc_cs_comp
              END IF
              #add--160802-00020#7 By shiun--(E)
              IF NOT cl_chk_exist("v_ooef001_1") THEN
                 LET r_success = FALSE
                 RETURN r_success
              END IF
           END IF
      WHEN 'b_xcccld'    #帐套
           IF NOT cl_null(tm.xcccld) THEN
              #校验
              INITIALIZE g_chkparam.* TO NULL
              LET g_chkparam.arg1 = tm.xcccld
              #add--160802-00020#7 By shiun--(S)
              #增加帳套權限控制
              IF NOT cl_null(g_wc_cs_ld) THEN
                 LET g_chkparam.where = " glaald IN ",g_wc_cs_ld
              END IF
              #add--160802-00020#7 By shiun--(E)
              #160318-00025#8--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "agl-00051:sub-01302|agli010|",cl_get_progname("agli010",g_lang,"2"),"|:EXEPROGagli010"
               #160318-00025#8--add--end
              IF NOT cl_chk_exist("v_glaald") THEN
                 LET r_success = FALSE
                 RETURN r_success
              END IF
           END IF
      WHEN 'b_xccc003'   #成本计算类型
           IF NOT cl_null(tm.xccc003) THEN
              #校验
              INITIALIZE g_chkparam.* TO NULL
              LET g_chkparam.arg1 = tm.xccc003
              #160318-00025#8--add--str
              LET g_errshow = TRUE 
              LET g_chkparam.err_str[1] = "agl-00195:sub-01302|axci100|",cl_get_progname("axci100",g_lang,"2"),"|:EXEPROGaxci100"
              #160318-00025#8--add--end
              IF NOT cl_chk_exist("v_xcat001") THEN
                 LET r_success = FALSE
                 RETURN r_success
              END IF
           END IF
      WHEN 'b_xccccomp+b_xcccld'  #法人+帐套
           IF NOT cl_null(tm.xccccomp) AND NOT cl_null(tm.xcccld) THEN
              #校验
              INITIALIZE g_chkparam.* TO NULL
              LET g_chkparam.arg1 = tm.xcccld
              LET g_chkparam.arg2 = tm.xccccomp
              #160318-00025#8--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "agl-00051:sub-01302|agli010|",cl_get_progname("agli010",g_lang,"2"),"|:EXEPROGagli010"
               #160318-00025#8--add--end
              IF NOT cl_chk_exist("v_glaald_5") THEN
                 LET r_success = FALSE
                 RETURN r_success
              END IF
           END IF
   END CASE
   RETURN r_success
END FUNCTION

#
PRIVATE FUNCTION axcq300_b_fill2()
DEFINE l_glaa003         LIKE glaa_t.glaa003
DEFINE ls_msg            STRING
DEFINE l_success         LIKE type_t.num5
DEFINE l_sfaa048         LIKE sfaa_t.sfaa048
DEFINE l_n               LIKE type_t.num5
DEFINE l_apca001         LIKE apca_t.apca001
DEFINE l_apcadocno       LIKE apca_t.apcadocno
DEFINE l_apca_sum1       LIKE apca_t.apca103
DEFINE l_apca_sum2       LIKE apca_t.apca103
DEFINE l_apcb_sum1       LIKE apcb_t.apcb103
DEFINE l_apcb_sum2       LIKE apcb_t.apcb103
DEFINE l_apcb_sum3       LIKE apcb_t.apcb103
DEFINE l_apcb_sum4       LIKE apcb_t.apcb103
DEFINE l_apcb_sum5       LIKE apcb_t.apcb103
DEFINE l_apcb_sum6       LIKE apcb_t.apcb103
DEFINE l_apca025         LIKE apca_t.apca025
DEFINE l_sfaa012         LIKE sfaa_t.sfaa012
DEFINE l_sfec009         LIKE sfec_t.sfec009
DEFINE l_inbastus        LIKE inba_t.inbastus  #151015-00002#1 add
DEFINE l_xccw202         LIKE xccw_t.xccw202   #151015-00002#1 add
DEFINE l_inbb016         LIKE inbb_t.inbb016   #151015-00002#1 add
DEFINE l_str             STRING                #151201-00018 by whitney add
DEFINE l_oocql004        LIKE oocql_t.oocql004 #151201-00018 by whitney add
DEFINE l_pmds011_str1    STRING   #160530-00005#3  
DEFINE l_apca_inaj035    LIKE inaj_t.inaj035   #160913-00024#1 add
DEFINE l_apca_gzzal003   LIKE gzzal_t.gzzal003 #160913-00024#1 add
DEFINE l_wc              STRING   #170625-00005#1 add
DEFINE l_wc2             STRING   #170625-00005#1 add
DEFINE l_previous_year   LIKE xccc_t.xccc004  #170421-00068#1 add
DEFINE l_previous_month  LIKE xccc_t.xccc005  #170421-00068#1 add
#200407-00013#1---add---start---
DEFINE l_str_seq         LIKE gzze_t.gzze003         #項次
DEFINE l_str_stock       LIKE gzze_t.gzze003         #倉庫代號
DEFINE l_str_error       LIKE gzze_t.gzze003         #錯誤訊息
DEFINE l_seq             LIKE apcb_t.apcbseq         #項次
DEFINE l_inaj008         LIKE inaj_t.inaj008         #庫位
DEFINE l_prog            LIKE type_t.chr10           #代業代號
DEFINE l_sum_apcb113     LIKE apcb_t.apcb113         #單據本幣未稅金額
DEFINE l_sum_glgb003     LIKE glgb_t.glgb003         #分錄金額
DEFINE l_prog_aapt300    LIKE gzzal_t.gzzal003       #aapt300作業說明
DEFINE l_prog_aapt320    LIKE gzzal_t.gzzal003       #aapt320作業說明
DEFINE l_prog_aapt340    LIKE gzzal_t.gzzal003       #aapt340作業說明
DEFINE l_prog_aapt430    LIKE gzzal_t.gzzal003       #aapt430作業說明
DEFINE l_error           LIKE gzze_t.gzze003         #錯誤說明
#200407-00013#1---add---end---
DEFINE l_sfin3011    LIKE type_t.chr1                #迴轉否   #201127-00017#1 add

   #200407-00013#1---add---start
   CALL axcq300_create_temp() RETURNING l_success   
   IF NOT l_success THEN
      RETURN
   END IF
   #200407-00013#1---add---end---   
   #160530-00005#3--s   
   LET l_pmds011_str1 =  s_aap_get_acc_str('2061',"gzcb003 = 'Y' ")
   LET l_pmds011_str1 = s_fin_get_wc_str(l_pmds011_str1)   
   #160530-00005#3--e   
   #根据年度期别计算起始截止日期
   #SELECT glaa003 INTO l_glaa003  #會計週期參照表號                                        #200407-00013#1 mark
   SELECT glaa003,glaa004,glaa024,glaa121                                                  #200407-00013#1 add
     INTO l_glaa003,g_glaa004,g_glaa024,g_glaa121       #會計週期/會計科目/單據別/啟用分錄    #200407-00013#1 add
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaa014 = 'Y'  #主帐套
      AND glaacomp = tm.xccccomp
   CALL s_fin_date_get_period_range(l_glaa003,tm.xccc004,tm.xccc005)
       RETURNING g_bdate,g_edate
   
   #单身初始化
   CALL g_xccc_d.clear()
   LET l_ac = 1
   IF cl_null(g_wc) THEN LET g_wc = " 1=1" END IF  #170625-00005#1 add
   #1.此期料件异动是否全部参于成本阶计算(axcp120)
   #170105-00011#10---mark---s            
   #LET g_sql = " SELECT inaj005,inaj006,",
   #           #160503-00030#3 mod str
   #           #"        '','',inaj001,''",
   #            "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
   #            "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
   #            #160913-00024#1-s
   #            "        '',",
   #            "        '',",
   #            #160913-00024#1-e
   #            "        inaj001,",
   #            "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00557' AND gzze002='",g_lang,"') info",
   #           #160503-00030#3 mod end 
   #            "   FROM inaj_t ",
   #            "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
   #            #"    AND inaj209 ='",tm.xccccomp,"'",  #mark zhangllc 150721
   #           #160503-00030#3 mod str
   #           #"    AND inaj008 NOT IN (SELECT inaa001 FROM inaa_t,inaj_t ",
   #           #"                         WHERE inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 ",
   #           #"                           AND inaaent = ",g_enterprise," AND inaa010 = 'N'",
   #           #"                           AND inaasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #           #"                                               AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"'))",
   #           #"    AND (inaj005 NOT IN (SELECT xcbb003 FROM xcbb_t ",
   #           #"                          WHERE xcbbent = ",g_enterprise," AND xcbbcomp = '",tm.xccccomp,"'",
   #           #"                            AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,") OR ",
   #           #"         inaj006 NOT IN (SELECT xcbb004 FROM xcbb_t ",
   #           #"                          WHERE xcbbent = ",g_enterprise," AND xcbbcomp = '",tm.xccccomp,"'",
   #           #"                            AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,"))",
   #            "    AND NOT EXISTS (SELECT 1 FROM inaa_t ",
   #            "                     WHERE inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008",
   #            "                       AND inaa010 = 'N'",
   #            "                       AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent = inaaent AND ooef001 = inaasite",
   #            "                                      AND ooefstus = 'Y' AND ooef017 = '",tm.xccccomp,"'))",
   #            "    AND (NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = inajent AND xcbb003 = inaj005",
   #            "                                            AND xcbbcomp = '",tm.xccccomp,"'",
   #            "                                            AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,") " #160929-00039#1 reduce ,
   #           #160929-00039#1 ---mark (s)---
   #           #"         OR ",
   #           #"         NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = inajent AND xcbb004 = inaj006",
   #           #"                                            AND xcbbcomp = '",tm.xccccomp,"'",
   #           #"                                            AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,") )", 
   #           #160929-00039#1 ---mark (e)---
   #           
   #           #160929-00039#1 ---add (s)---
   #            IF cl_get_para(g_enterprise,g_site,'S-FIN-6013') = 'Y' THEN
   #               LET g_sql = g_sql, "OR NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = inajent AND xcbb004 = inaj006",
   #                                  " AND xcbbcomp = '",tm.xccccomp,"'",
   #                                  " AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,") "
   #            END IF 
   #            LET g_sql = g_sql , " ) " ,
   #           #160929-00039#1 ---add (e)---
   #           #160503-00030#3 mod end
   #            "    AND inajent = ",g_enterprise,     
   #           #"    AND inaj209 ='",tm.xccccomp,"'"   #mark zhangllc 150721
   #           #add zhangllc 150721
   #           #160503-00030#3 mod str
   #           #"    AND inajsite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #           #"                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"') "
   #            "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",        
   #            "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   #           #160503-00030#3 mod end 
   #            #end
   #170105-00011#10---mark---e            
   #170105-00011#10---add---s
#   IF cl_get_para(g_enterprise,g_site,'S-FIN-6013') = 'Y' THEN   #170207-00035#1 marked 
      LET g_sql = " SELECT /*+ index(inaj_t inaj_n02)*/ inaj005,inaj006,",
                  "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
                  "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
                  #190102-00044#1 add-s
                  "        'aint302',",
                  "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aint302' AND gzzal002='"||g_dlang||"') gzzal003,",
                  #190102-00044#1 add-e
                  "        inaj001,",
                  "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00557' AND gzze002='",g_lang,"') info",
                  "   FROM inaj_t ",
                  #"   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 AND inaa010 <> 'N'",   #190102-00044#1 mark
                  "   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 ",    #190102-00044#1 add
                  "   LEFT JOIN xcbb_t ON xcbbent = inajent AND xcbb003 = inaj005 AND xcbbcomp = '",tm.xccccomp,"'",
                  "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,"",
                  "  WHERE inajent = ",g_enterprise,
                  "    AND inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",     
                  "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",        
                  "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",   
                  #"    AND inaa001 IS NULL AND xcbb003 IS NULL "                           #190102-00044#1 mark
                  "   AND xcbb003 IS NULL AND inaa010 <> 'N'"           #190102-00044#1 add
   #170207-00035#1 marked-S
#   ELSE
#      LET g_sql = " SELECT /*+ index(inaj_t inaj_n02)*/ inaj005,inaj006,",
#                  "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
#                  "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
#                  "        inaj001,",
#                  "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00557' AND gzze002='",g_lang,"') info",
#                  "   FROM inaj_t ",
#                  "   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 AND inaa010 <> 'N'",
#                  "   LEFT JOIN xcbb_t ON xcbbent = inajent AND xcbb003 = inaj005 AND xcbb004 = inaj006 AND xcbbcomp = '",tm.xccccomp,"'",
#                  "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,"",
#                  "  WHERE inajent = ",g_enterprise,
#                  "    AND inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",     
#                  "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",        
#                  "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",   
#                  "    AND inaa001 IS NULL AND xcbb003 IS NULL AND xcbb004 IS NULL "
#   END IF                  
   #170207-00035#1 marked-E
   #170105-00011#10---add---e
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','inaj005')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e   
   PREPARE axcq300_pr1 FROM g_sql
   DECLARE axcq300_cs1 CURSOR FOR axcq300_pr1
   FOREACH axcq300_cs1 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs1" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      #160913-00024#1-s
      IF NOT cl_null(g_xccc_d[l_ac].docno) THEN
         CALL axcq300_aooi200_get_slip(g_xccc_d[l_ac].docno) RETURNING g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc 
      END IF
      #160913-00024#1-e      
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#       WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#      CALL cl_getmsg('axc-00557',g_lang) RETURNING ls_msg  #此料號未參與成本階計算(axcp120)
#     LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH
               
   #2.入庫/退貨單与请款单未匹配
   LET g_sql = " SELECT pmdt006,pmdt007,",
              #160503-00030#3 mod str
              #"        '','',pmdtdocno,''",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=pmdtent AND imaal001=pmdt006 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=pmdtent AND imaal001=pmdt006 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        (CASE (pmds000) WHEN '3' THEN 'apmt530' WHEN '4' THEN 'apmt532' WHEN '6' THEN 'apmt570' WHEN '7' THEN 'apmt580' ",
               "         WHEN '12' THEN 'apmt571' END), ",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = (CASE (pmds000) WHEN '3' THEN 'apmt530' WHEN '4' THEN 'apmt532' WHEN '6' THEN 'apmt570' WHEN '7' THEN 'apmt580' 
                        WHEN '12' THEN 'apmt571' END) AND gzzal002='"||g_dlang||"') gzzal003,",
               #160913-00024#1-e
               "        pmdtdocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00558' AND gzze002='",g_lang,"') info",
              #160503-00030#3 mod end                
               "   FROM pmdt_t,pmds_t ",
               "  WHERE pmdsent = pmdtent AND pmdsdocno = pmdtdocno ",
               #"    AND pmdsdocdt BETWEEN '",g_bdate,"' AND '",g_edate,"'", 
               "    AND pmds001 BETWEEN '",g_bdate,"' AND '",g_edate,"'",  #mod zhangllc 151109
               "    AND pmds000 IN ('3','4','6','7','12')  AND pmdt005 != '9'",   #排除样品
               "    AND pmds011 IN ",l_pmds011_str1 CLIPPED,                      #160530-00005#3
               "    AND (pmdt038 <> 0 AND pmdt039 <> 0 )",   #171208-00015#1 add 排除入库金额为0的，拆到下一个报错信息里面
               "    AND ( pmdt056 + pmdt066 < pmdt024 OR",
               "         (pmdt056 IS NULL AND pmdt024 > 0 AND pmdt056 < pmdt024) OR", 
               #"         (pmds000 = '7' AND pmds100 = '5' AND NOT EXISTS (SELECT 1 FROM apcb_t WHERE apcb008 = pmdtdocno AND apcb009 = pmdtseq)))", #无请款资料匹配纯折让的部分  #170628-00024#1 mark
               "         (pmds000 = '7' AND pmds100 = '5' AND NOT EXISTS (SELECT 1 FROM apcb_t WHERE apcbent = pmdtent AND apcb008 = pmdtdocno AND apcb009 = pmdtseq)))",       #170628-00024#1 add
               "    AND pmdsent = ",g_enterprise,
#               "    AND omdsstus <> 'X' ",     #wujie 150514   #2015/09/15 by stellar mark
              #"    AND pmdsstus <> 'X' ",     #2015/09/15 by stellar add  #171204-00008#1 mark
               "    AND pmdsstus = 'S' ",                                  #171204-00008#1 add
              #160503-00030#3 mod str
              #"    AND pmdssite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
              #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"') "
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=pmdsent AND ooef001=pmdssite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
              #160503-00030#3 mod end 
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','pmdt006')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e 
   PREPARE axcq300_pr2 FROM g_sql
   DECLARE axcq300_cs2 CURSOR FOR axcq300_pr2
   FOREACH axcq300_cs2 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs2" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#       WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#      CALL cl_getmsg('axc-00558',g_lang) RETURNING ls_msg  #入庫/退貨單与请款单未匹配
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH
   #171208-00015#1 add-S   
   #该入库单项次$1的入库金额为0
   LET g_sql = " SELECT pmdt006,pmdt007,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=pmdtent AND imaal001=pmdt006 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=pmdtent AND imaal001=pmdt006 AND imaal002='"||g_dlang||"') imaal004,",
               "        (CASE (pmds000) WHEN '3' THEN 'apmt530' WHEN '4' THEN 'apmt532' WHEN '6' THEN 'apmt570' WHEN '7' THEN 'apmt580' ",
               "         WHEN '12' THEN 'apmt571' END), ",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = (CASE (pmds000) WHEN '3' THEN 'apmt530' WHEN '4' THEN 'apmt532' WHEN '6' THEN 'apmt570' WHEN '7' THEN 'apmt580' 
                        WHEN '12' THEN 'apmt571' END) AND gzzal002='"||g_dlang||"') gzzal003,",
               "        pmdtdocno,",
               #"        replace((SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00927' AND gzze002='",g_lang,"'),'$1',pmdtseq) info",  #181203-00051#1  mark
               "        replace((SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00927' AND gzze002='",g_lang,"'),'%1',pmdtseq) info",   #181203-00051#1 add   #PGS-(D)-03080 mark
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "   FROM pmdt_t,pmds_t ",
               "  WHERE pmdsent = pmdtent AND pmdsdocno = pmdtdocno ",
               "    AND pmds001 BETWEEN '",g_bdate,"' AND '",g_edate,"'",  
               "    AND pmds000 IN ('3','4','6','7','12')  AND pmdt005 != '9'",   #排除样品
               "    AND pmds011 IN ",l_pmds011_str1 CLIPPED,                    
               "    AND ( pmdt038 = 0 OR pmdt039 = 0 ) ",
               "    AND pmdt020 <> 0 ", #181203-00051#1 add
               "    AND pmdsent = ",g_enterprise,
               "    AND pmdsstus = 'S' ",
               "    AND EXISTS (SELECT 1 FROM inaa_t,pmdu_t WHERE inaaent=pmduent AND inaasite=pmdusite AND inaa001=pmdu006 AND inaa010 = 'Y' AND pmdtent=pmduent AND pmdtdocno=pmdudocno AND pmdtseq=pmduseq) ",  #191227-00011#1 add
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=pmdsent AND ooef001=pmdssite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   LET l_wc = cl_replace_str(g_wc,'xccc006','pmdt006')   
   LET g_sql = g_sql," AND ",l_wc
   PREPARE axcq300_pr21 FROM g_sql
   DECLARE axcq300_cs21 CURSOR FOR axcq300_pr21
   FOREACH axcq300_cs21 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs2" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1
   END FOREACH
   #171208-00015#1 add-E
   
   #3.应付帐款数量或金额<0（入库单+仓退单）
   LET g_sql = " SELECT apcb004,'',",
              #160503-00030#3 mod str
              #"        '','',apcadocno,''",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=apcbent AND imaal001=apcb004 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=apcbent AND imaal001=apcb004 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        'aapt300',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002='"||g_dlang||"') gzzal003,",
               #160913-00024#1-e
               "        apcadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00559' AND gzze002='",g_lang,"') info",
              #160503-00030#3 mod end
               "   FROM apca_t,apcb_t",
               "  WHERE apcaent = apcbent AND apcald = apcbld AND apcadocno = apcbdocno ",
               "    AND apcadocdt BETWEEN '",g_bdate,"' AND '",g_edate ,"'",   
               "    AND (apca001 = '13' OR apca001 = '22') ",              
               "    AND ((apcb007 > 0 AND apcb101 < 0) OR ",      #判斷有數量而無金額
               "         (apcb007 > 0 AND apcb105 < 0) OR ",
               "         (apcb007 > 0 AND apcb111 < 0) OR ",
               "         (apcb007 > 0 AND apcb115 < 0) OR ",         
               "         (apcb007 < 0 AND apcb101 > 0) OR ",      #判斷無數量而有金額
               "         (apcb007 < 0 AND apcb105 > 0) OR ",
               "         (apcb007 < 0 AND apcb111 > 0) OR ",
               "         (apcb007 < 0 AND apcb115 > 0)) ",
               "    AND apcaent = ",g_enterprise," AND apcald = '",tm.xcccld,"'",
               "    AND apcacomp ='",tm.xccccomp,"'"
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','apcb004')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e                
   PREPARE axcq300_pr3 FROM g_sql
   DECLARE axcq300_cs3 CURSOR FOR axcq300_pr3
   FOREACH axcq300_cs3 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs3" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#       WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#      CALL cl_getmsg('axc-00559',g_lang) RETURNING ls_msg  #入庫倉退對應的应付帐款数量或金额<0
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH            
                                           
   #4，檢查統計檔期未庫存小於零                                         
   LET g_sql = " SELECT inat001,inat002,",
              #160503-00030#3 mod str
              #"        '','','',''",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inatent AND imaal001=inat001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inatent AND imaal001=inat001 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        '',",
               "        '',",
               #160913-00024#1-e
               "        '',",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00560' AND gzze002='",g_lang,"') info",
              #160503-00030#3 mod end
               "   FROM inat_t ",
               "  WHERE inatent = ",g_enterprise," AND inat008 = ",tm.xccc004,
               "    AND inat009 = ",tm.xccc005," AND inat015 < 0 ",
              #160503-00030#3 mod str
              #"    AND inatsite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
              #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inatent AND ooef001=inatsite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
              #160503-00030#3 mod end
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','inat001')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---                
   PREPARE axcq300_pr4 FROM g_sql
   DECLARE axcq300_cs4 CURSOR FOR axcq300_pr4
   FOREACH axcq300_cs4 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs4" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#       WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#      CALL cl_getmsg('axc-00560',g_lang) RETURNING ls_msg  #此料號統計檔期末庫存<0
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH                                                
   
   #5.每日工時檔中, 有無輸入上期前就已結案的工單
#160503-00030#3 mod str
#   LET g_sql = " SELECT sfac001,sfac006,'','',xcbi002,'',sfaa048",
#               "   FROM xcbh_t,xcbi_t",
#               "   LEFT OUTER JOIN sfaa_t ON xcbient = sfaaent AND xcbi002 = sfaadocno AND sfaastus != 'X' AND sfaa048 IS NOT NULL",
#               "   LEFT OUTER JOIN sfac_t ON xcbient = sfacent AND xcbi002 = sfacdocno",
#               "  WHERE xcbhent = xcbient AND xcbhdocno = xcbidocno ",
#               "    AND xcbh001 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
#               "    AND (xcbi201 != 0 OR xcbi202 != 0 OR xcbi203 != 0 OR xcbi204 != 0) ",
#               "    AND xcbhent = xcbient AND xcbhdocno = xcbidocno",
#               "    AND xcbhent = ",g_enterprise," AND xcbhcomp = '",tm.xccccomp,"'"
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','sfac001')   
   #170625-00005#1---add---e 
   LET g_sql = " SELECT sfac001,sfac006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        'asft300',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               #160913-00024#1-e
               "        xcbi002,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00562' AND gzze002='",g_lang,"') info,",
               "        sfaa048",               
               "   FROM xcbh_t,xcbi_t",
               "   LEFT OUTER JOIN sfaa_t ON xcbient = sfaaent AND xcbi002 = sfaadocno AND sfaastus != 'X' AND sfaa048 IS NOT NULL",
               "   LEFT OUTER JOIN sfac_t ON xcbient = sfacent AND xcbi002 = sfacdocno",
               "  WHERE xcbhent = xcbient AND xcbhdocno = xcbidocno ",
               "    AND xcbh001 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND (xcbi201 != 0 OR xcbi202 != 0 OR xcbi203 != 0 OR xcbi204 != 0) ",
               "    AND xcbhent = ",g_enterprise," AND xcbhcomp = '",tm.xccccomp,"'",
               "    AND sfac001 IS NULL",
               "    AND ",l_wc,   #170625-00005#1
               " UNION",
               " SELECT sfac001,sfac006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        'asft300',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               #160913-00024#1-e
               "        xcbi002,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00561' AND gzze002='",g_lang,"') info,",
               "        sfaa048",               
               "   FROM xcbh_t,xcbi_t",
               "   LEFT OUTER JOIN sfaa_t ON xcbient = sfaaent AND xcbi002 = sfaadocno AND sfaastus != 'X' AND sfaa048 IS NOT NULL",
               "   LEFT OUTER JOIN sfac_t ON xcbient = sfacent AND xcbi002 = sfacdocno",
               "  WHERE xcbhent = xcbient AND xcbhdocno = xcbidocno ",
               "    AND xcbh001 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND (xcbi201 != 0 OR xcbi202 != 0 OR xcbi203 != 0 OR xcbi204 != 0) ",
               "    AND xcbhent = ",g_enterprise," AND xcbhcomp = '",tm.xccccomp,"'",
               "    AND sfac001 IS NOT NULL AND sfaa048 IS NOT NULL",
               "    AND ( to_char(sfaa048,'YYYY') < ",tm.xccc004," OR ",
               "         (to_char(sfaa048,'YYYY') = ",tm.xccc004," AND to_char(sfaa048,'MM') < ",tm.xccc005,") )",
               "    AND ",l_wc      #170625-00005#1           
#160503-00030#3 mod end
   PREPARE axcq300_pr5 FROM g_sql
   DECLARE axcq300_cs5 CURSOR FOR axcq300_pr5
   FOREACH axcq300_cs5 INTO g_xccc_d[l_ac].*,l_sfaa048
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs5" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      IF cl_null(g_xccc_d[l_ac].xccc006) THEN
#         CALL cl_getmsg('axc-00562',g_lang) RETURNING ls_msg  #找不到此工單 
#         LET g_xccc_d[l_ac].info = ls_msg  #错误信息     
#      ELSE
#         SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#          WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#         IF cl_null(l_sfaa048) THEN
#            CONTINUE FOREACH
#          # CALL cl_getmsg('axc-00563',g_lang) RETURNING ls_msg  #應結工單尚未結案
#          # LET g_xccc_d[l_ac].info = ls_msg  #错误信息 
#         ELSE            
#            IF YEAR(l_sfaa048) < tm.xccc004 OR (YEAR(l_sfaa048) = tm.xccc004 AND MONTH(l_sfaa048) < tm.xccc005) THEN
#               CALL cl_getmsg('axc-00561',g_lang) RETURNING ls_msg  #每日工時檔中, 有輸入上期前就已結案的工單 
#               LET g_xccc_d[l_ac].info = ls_msg  #错误信息   
#            ELSE
#               CALL g_xccc_d.deleteElement(l_ac)  
#               CONTINUE FOREACH               
#            END IF
#         END IF
#      END IF
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH 
   
#  #6,入庫材料是否有設標準工時  
#  LET g_sql = "SELECT UNIQUE sfac001,sfac006,'','','','' FROM sfaa_t,sfac_t,xcag_t",
#              " WHERE sfaaent = sfacent AND sfaadocno = sfacdocno ",
#              "   AND sfacent = xcagent AND sfacsite = xcagsite AND sfac001 = xcag004 ",
#              "   AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
#              "   AND sfaa003 = '1' AND (xcag102 = 0 OR xcag102 is null) ",
#              "   AND sfaaent = ",g_enterprise," AND xcagcomp = '",tm.xccccomp,"'"
#  PREPARE axcq300_pr6 FROM g_sql
#  DECLARE axcq300_cs6 CURSOR FOR axcq300_pr6
#  FOREACH axcq300_cs6 INTO g_xccc_d[l_ac].*
#     IF SQLCA.sqlcode THEN
#        INITIALIZE g_errparam TO NULL 
#        LET g_errparam.extend = "FOREACH:axcq300_cs6" 
#        LET g_errparam.code   = SQLCA.sqlcode 
#        LET g_errparam.popup  = TRUE 
#        CALL cl_err()
#        EXIT FOREACH
#     END IF
#     SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#      WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#     CALL cl_getmsg('axc-00564',g_lang) RETURNING ls_msg  #工單入庫材料未設標準工時
#     LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#     
#     LET l_ac = l_ac + 1
#  END FOREACH 
   
   #7,應發數量=0 but 已發數量<>0
   LET g_sql = " SELECT sfba006,sfba021,",
              #160503-00030#3 mod str
              #"        '','',sfaadocno,''",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        'asft300',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               #160913-00024#1-e
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00565' AND gzze002='",g_lang,"') info",
              #160503-00030#3 mod end
               "   FROM sfaa_t,sfba_t",
               "  WHERE sfaaent = sfbaent AND sfaadocno = sfbadocno ",
               "    AND sfaaent  =",g_enterprise,  #150823 by whitney add
               "    AND sfbaseq1 = 0 ", #180723-00008#1 add
               "    AND sfba013 = 0 AND (sfba016 <> 0 OR sfba025 <> 0)",
               #"    AND (sfaa038 >= '",g_bdate,"' OR sfaa038 IS NULL)",   #161223-00018#1 MARK
               "    AND (sfaa048 >= '",g_bdate,"' OR sfaa048 IS NULL)",    #161223-00018#1 MOD 
               "    AND sfaadocdt <='",g_edate,"'",   #200724-00018#1               
              #160503-00030#3 mod str
              #"    AND sfbasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
              #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfbaent AND ooef001=sfbasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
              #160503-00030#3 mod end
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','sfba006')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e               
   PREPARE axcq300_pr7 FROM g_sql
   DECLARE axcq300_cs7 CURSOR FOR axcq300_pr7
   FOREACH axcq300_cs7 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs7" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#       WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#      CALL cl_getmsg('axc-00565',g_lang) RETURNING ls_msg  #工單應發數量為0，但是已發數量或者超領數量不為0
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH 
   
   #8,檢查有inaj_t 但無工單編號
   #170105-00011#10---mark---s 
   #LET g_sql = " SELECT UNIQUE inaj005,inaj006,",
   #           #160503-00030#3 mod str
   #           #"        '','',inaj020,''",
   #            "        '',",
   #            "        '',",
   #            #160913-00024#1-s
   #            "        '',",
   #            "        '',",
   #            #160913-00024#1-e
   #            "        inaj020,",
   #            "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00566' AND gzze002='",g_lang,"') info",
   #           #160503-00030#3 mod end
   #            "   FROM inaj_t",
   #            "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
   #            "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
   #            "    AND NOT EXISTS (SELECT 1 FROM sfaa_t WHERE sfaaent = inajent AND sfaadocno = inaj020) ",
   #            "    AND inajent = ",g_enterprise,
   #            #"    AND inaj209 ='",tm.xccccomp,"')"   #mark zhangllc 150721
   #            #add zhangllc 150721
   #           #160503-00030#3 mod str
   #           #"    AND inajsite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #           #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   #            "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
   #            "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   #           #160503-00030#3 mod end
   #            #end
   #170105-00011#10---mark---e             
   #170105-00011#10---add---s
   LET g_sql = " SELECT /*+ index(inaj_t inaj_n02)*/ UNIQUE inaj005,inaj006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
               "        '','',",      #210105-00032#1 add
               "        inaj020,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00566' AND gzze002='",g_lang,"') info",
               "   FROM inaj_t",
               "   LEFT OUTER JOIN sfaa_t ON sfaaent = inajent AND sfaadocno = inaj020 ",
               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
               "    AND inajent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "    AND sfaadocno IS NULL"               
   #170105-00011#10---add---e       
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','inaj005')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e    
   PREPARE axcq300_pr8 FROM g_sql
   DECLARE axcq300_cs8 CURSOR FOR axcq300_pr8
   FOREACH axcq300_cs8 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs8" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      #160913-00024#1-s
      IF NOT cl_null(g_xccc_d[l_ac].docno) THEN
         CALL axcq300_aooi200_get_slip(g_xccc_d[l_ac].docno) RETURNING g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc 
      END IF
      #160913-00024#1-e  
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#       WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#      CALL cl_getmsg('axc-00566',g_lang) RETURNING ls_msg  #庫存異動明細檔inaj_t有資料，但無工單編號
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH            

   #9.檢查有inaj_t,但無備料檔
#170105-00011#10---mark---s   
##160503-00030#3 mod str
##   LET g_sql = " SELECT UNIQUE inaj005,inaj006,",
##               "        '','',inaj020,'',SUM(inaj011*inaj004)",
##               "   FROM inaj_t ",
##               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
##               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
##               "    AND inaj008 NOT IN (SELECT inaa001 FROM inaa_t,inaj_t ",
##               "                         WHERE inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 ",
##               "                           AND inaaent = ",g_enterprise," AND inaa010 = 'N')",
##               "    AND inajent = ",g_enterprise,
##               #"    AND inaj209 ='",tm.xccccomp,"')",   #mark zhangllc 150721
##               #add zhangllc 150721
##               "    AND inajsite IN (SELECT ooef001 FROM ooef_t",
##               "                      WHERE ooefent = '",g_enterprise,"'",
##               "                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"') ",
##               #end
##               "  GROUP BY inaj005,inaj006,inaj020 "
#   LET g_sql = " SELECT UNIQUE inaj005,inaj006,",
#               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
#               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
#               #160913-00024#1-s
#               "        '',",
#               "        '',",
#               #160913-00024#1-e
#               "        inaj020,",
#               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00567' AND gzze002='",g_lang,"') info",
#               "   FROM inaj_t ",
#               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
#               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
#               "    AND NOT EXISTS (SELECT 1 FROM inaa_t WHERE inaaent=inajent AND inaasite=inajsite",
#               "                                           AND inaa001=inaj008 AND inaa010='N')",               
#               "    AND inajent = ",g_enterprise,
#               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
#               "                                       AND ooefstus='Y' AND ooef017='",tm.xccccomp,"')",               
#               "    AND NOT EXISTS (SELECT 1 FROM imaa_t WHERE imaaent=inajent AND imaa001=inaj005)",
#               " UNION",
#               " SELECT UNIQUE inaj005,inaj006,",
#               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
#               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
#               #160913-00024#1-s
#               "        '',",
#               "        '',",
#               #160913-00024#1-e
#               "        inaj020,",
#               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00568' AND gzze002='",g_lang,"') info",
#               "   FROM inaj_t ",
#               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
#               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
#               "    AND NOT EXISTS (SELECT 1 FROM inaa_t WHERE inaaent=inajent AND inaasite=inajsite",
#               "                                           AND inaa001=inaj008 AND inaa010='N')",
#               "    AND inajent = ",g_enterprise,
#               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
#               "                                       AND ooefstus='Y' AND ooef017='",tm.xccccomp,"')",
#               "    AND EXISTS (SELECT 1 FROM imaa_t WHERE imaaent=inajent AND imaa001=inaj005)",
#               "    AND NOT EXISTS (SELECT 1 FROM sfba_t WHERE sfbaent=inajent AND sfbadocno=inaj020)"
##160503-00030#3 mod end
#170105-00011#10---mark---e
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','inaj005')   
   #170625-00005#1---add---e 
   #170105-00011#10---add---s  
   LET g_sql = " SELECT /*+ index(inaj_t inaj_n02)*/ UNIQUE inaj005,inaj006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
               "        '','',",      #210105-00032#1 add
               "        inaj020,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00567' AND gzze002='",g_lang,"') info",
               "   FROM inaj_t ",
               #"   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 AND inaa010 <> 'N'",   #190102-00044#1 mark
               "   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 ",   #190102-00044#1 add
               "   LEFT JOIN imaa_t ON imaaent=inajent AND imaa001=inaj005 ",
               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等              
               "    AND inajent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
               "                                       AND ooefstus='Y' AND ooef017='",tm.xccccomp,"')",               
               "    AND inaa001 IS NULL AND imaa001 IS NULL ",
               "    AND inaa010 <> 'N'  ",        #190102-00044#1 add
               "    AND ",l_wc, #170625-00005#1
               " UNION",
               " SELECT /*+ index(inaj_t inaj_n02)*/ UNIQUE inaj005,inaj006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
               "        '','',",      #210105-00032#1 add
               "        inaj020,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00568' AND gzze002='",g_lang,"') info",
               "   FROM inaj_t ",
               #"   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 AND inaa010 <> 'N'",   #190102-00044#1 mark
               "   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 ",   #190102-00044#1 add
               "   LEFT OUTER JOIN imaa_t ON imaaent=inajent AND imaa001=inaj005 ",
               "   LEFT OUTER JOIN sfba_t ON sfbaent=inajent AND sfbadocno=inaj020",
               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
               "    AND inajent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
               "                                       AND ooefstus='Y' AND ooef017='",tm.xccccomp,"')",
               "    AND inaa001 IS NULL AND imaa001 IS NULL AND sfbadocno IS NULL ",
               "    AND inaa010 <> 'N'  ",        #190102-00044#1 add
               "    AND ",l_wc   #170625-00005#1               
   #170105-00011#10---add---e
   PREPARE axcq300_pr9 FROM g_sql
   DECLARE axcq300_cs9 CURSOR FOR axcq300_pr9
   FOREACH axcq300_cs9 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs9" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      #160913-00024#1-s
      IF NOT cl_null(g_xccc_d[l_ac].docno) THEN
         CALL axcq300_aooi200_get_slip(g_xccc_d[l_ac].docno) RETURNING g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc 
      END IF
      #160913-00024#1-e  
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#          WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#          
#      SELECT COUNT(*) INTO l_n FROM imaa_t 
#       WHERE imaaent = g_enterprise AND imaa001 = g_xccc_d[l_ac].xccc006
#      IF l_n = 0 THEN
#         CALL cl_getmsg('axc-00567',g_lang) RETURNING ls_msg  #有異動資料(inaj_t)但料號不存在料件主檔(imaa_t)
#         LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#         LET l_ac = l_ac + 1
#      ELSE
#         SELECT COUNT(*) INTO l_n FROM sfba_t 
#          WHERE sfbaent = g_enterprise AND sfbadocno =  g_xccc_d[l_ac].docno
#         IF l_n = 0 THEN
#            CALL cl_getmsg('axc-00568',g_lang) RETURNING ls_msg  #工單備料檔無此料號存在
#            LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#            LET l_ac = l_ac + 1
#         END IF
#      END IF
#160503-00030#3 mark end
      LET l_ac = l_ac + 1   #160503-00030#3 add
   END FOREACH 

#170301-00056#1---mark---e   
##160503-00030#3 add str
#   #把需要的訊息先抓出來
#   CALL cl_getmsg('axc-00569',g_lang) RETURNING ls_msg  #請款單付款金額與單身不合
##160503-00030#3 add end
#   #10,檢查請款的單頭與單身不合
#  #LET g_sql = " SELECT apca001,apcadocno,(apca103-apca106),(apca113-apca116),apca025 FROM apca_t ",           #160628-00009#1 mark
#  #160913-00024#1-s
#  #LET g_sql = " SELECT apca001,apcadocno,ABS((apca103-apca106)),ABS((apca113-apca116)),apca025 FROM apca_t ", #160628-00009#1 add
#  LET g_sql = " SELECT apca001,apcadocno,ABS((apca103-apca106)),ABS((apca113-apca116)),apca025,",
#               "        (CASE (apca001) WHEN '01' THEN 'aapt320' WHEN '02' THEN 'aapt320' WHEN '13' THEN 'aapt300' WHEN '17' THEN 'aapt300' ",
#               "         WHEN '22' THEN 'aapt340' END), ",
#               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001=(CASE (apca001) WHEN '01' THEN 'aapt320' WHEN '02' THEN 'aapt320' WHEN '13' THEN 'aapt300' WHEN '17' THEN 'aapt300' 
#                       WHEN '22' THEN 'aapt340' END) AND gzzal002='"||g_dlang||"') gzzal003",
#               "  FROM apca_t ",
#  #160913-00024#1-e
#               "  WHERE apcadocdt BETWEEN '",g_bdate,"' AND '",g_edate ,"'",
#               "    AND EXISTS (SELECT 1 FROM apcb_t,imaa_t",
#               "                 WHERE apcbent = apcaent AND apcbdocno = apcadocno",
#               "                   AND apcbent = imaaent AND apcb004 = imaa001) ",
#               "    AND apcaent = ",g_enterprise," AND apcacomp = '",tm.xccccomp,"' AND apcald = '",tm.xcccld,"'",
#               "    AND apcastus = 'Y' ",                           #170220-00006#2    
#               "    AND apca001 IN('01','02','13','17','22') "   #160907-00003#1
#   PREPARE axcq300_pr10 FROM g_sql
#   DECLARE axcq300_cs10 CURSOR FOR axcq300_pr10
#   FOREACH axcq300_cs10 INTO l_apca001,l_apcadocno,l_apca_sum1,l_apca_sum2,l_apca025,l_apca_inaj035,l_apca_gzzal003
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL 
#         LET g_errparam.extend = "FOREACH:axcq300_cs10" 
#         LET g_errparam.code   = SQLCA.sqlcode 
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()
#         EXIT FOREACH
#      END IF  
##wujie 150422 --begin
##抓单身合计金额改为新逻辑，用正负值apcb022乘以金额，然后合计即可
#      #2015/09/15 by stellar modify ----- (S)
#      #調整算式
##      SELECT SUM(apcb103-apcb106)*apcb022,SUM(apcb113-apcb116)*apcb022 INTO l_apcb_sum5,l_apcb_sum6 FROM apcb_t
#     #SELECT SUM((apcb103-apcb106)*apcb022),SUM((apcb113-apcb116)*apcb022) INTO l_apcb_sum5,l_apcb_sum6 FROM apcb_t           #160628-00009#1 mark
#      SELECT ABS(SUM((apcb103-apcb106)*apcb022)),ABS(SUM((apcb113-apcb116)*apcb022)) INTO l_apcb_sum5,l_apcb_sum6 FROM apcb_t #160628-00009#1 add
#      #2015/09/15 by stellar modify ----- (E)
#       WHERE apcbent = g_enterprise AND apcbdocno = l_apcadocno 
# 
##      #来源为仓退      
##      SELECT SUM(apcb103-apcb106),SUM(apcb113-apcb116) INTO l_apcb_sum1,l_apcb_sum2 FROM apcb_t
##       WHERE apcbent = g_enterprise AND apcbdocno = l_apcadocno AND apcb001 = 'apmt580'
##      #来源不为仓退       
##      SELECT SUM(apcb103-apcb106),SUM(apcb113-apcb116) INTO l_apcb_sum3,l_apcb_sum4 FROM apcb_t
##       WHERE apcbent = g_enterprise AND apcbdocno = l_apcadocno AND (apcb001 != 'apmt580' OR apcb001 IS NULL)
##      IF cl_null(l_apcb_sum1) THEN LET l_apcb_sum1=0 END IF
##      IF cl_null(l_apcb_sum2) THEN LET l_apcb_sum2=0 END IF
##      IF cl_null(l_apcb_sum3) THEN LET l_apcb_sum3=0 END IF
##      IF cl_null(l_apcb_sum4) THEN LET l_apcb_sum4=0 END IF
##      LET l_apcb_sum5=l_apcb_sum1+l_apcb_sum3  
##      LET l_apcb_sum6=l_apcb_sum2+l_apcb_sum4
##wujie 150422 --end 
#      
#     #若差異處理是沖期初開帳的暫估時,應付單頭金額除了抓(apca103-apca106),(apca113-apca116)外需再扣掉api_file裡的api05
#     #暂时还没有，后续加入
#     #170220-00006#2-s-mark 
#     ##151015-00002#1-Start-Add
#     #IF (l_apca001 MATCHES '0[24]' OR l_apca001 MATCHES '2*') THEN 
#     #   LET l_apcb_sum5 = l_apcb_sum5 * -1 
#     #   LET l_apcb_sum6 = l_apcb_sum6 * -1
#     #END IF 
#     ##151015-00002#1-End-Add
#     #170220-00006#2-e-mark 
#      IF (l_apcb_sum5 != l_apca_sum1 OR l_apcb_sum6 != l_apca_sum2) AND l_apca025 != '4' THEN 
#         LET g_xccc_d[l_ac].xccc006 = ' '
#         LET g_xccc_d[l_ac].xccc007 = ' '
#         LET g_xccc_d[l_ac].docno = l_apcadocno 
#         #160913-00024#1-s         
#         LET g_xccc_d[l_ac].inaj035 = l_apca_inaj035
#         LET g_xccc_d[l_ac].inaj035_desc = l_apca_gzzal003
#         #160913-00024#1-e         
#        #CALL cl_getmsg('axc-00569',g_lang) RETURNING ls_msg  #請款單付款金額與單身不合  #160503-00030#3 mark
#         LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#         LET l_ac = l_ac + 1
#      END IF
#   END FOREACH
#170301-00056#1---mark---e   
   
   #11，產品分類編號為NULL
   LET g_sql = " SELECT imaa001,'',",
              #160503-00030#3 mod str
              #"        '','','',''",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        '',",
               "        '',",
               #160913-00024#1-e
               "        '',",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00570' AND gzze002='",g_lang,"') info",
              #160503-00030#3 mod end
               "   FROM imaa_t",
               "  WHERE imaaent = ",g_enterprise," AND imaa009 IS NULL ",
               #190626-00037#1 add-S
               "    AND EXISTS(SELECT 1 FROM imaf_t WHERE imafent = imaaent AND imaf001 = imaa001 ",
               "                                      AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=imafent AND ooef001=imafsite",
               "                                                                         AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"'))",
               #190626-00037#1 add-E
               "    AND imaastus = 'Y' "  #170515-00005#1 ADD
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','imaa001')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e                
   PREPARE axcq300_pr11 FROM g_sql
   DECLARE axcq300_cs11 CURSOR FOR axcq300_pr11
   FOREACH axcq300_cs11 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs11" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#          WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006     
#      CALL cl_getmsg('axc-00570',g_lang) RETURNING ls_msg  #此料號對應產品分類為空
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH   

   #12,累计至当月的完工入库数量 = 工单数量,才做应结未结工单明细
   #200727-00041#1---mark---s
   #LET g_sql = " SELECT sfaa010,sfac006,",
   #           #160503-00030#3 mod str
   #           #"        '','',sfaadocno,'',sfaa012",
   #            "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
   #            "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
   #            #160913-00024#1-s
   #            "        'asft300',",
   #            "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
   #            #160913-00024#1-e
   #            "        sfaadocno,",
   #            "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00563' AND gzze002='",g_lang,"') info,",
   #            "        sfaa012",
   #           #160503-00030#3 mod end
   #            "   FROM sfaa_t,sfac_t",         
   #            "  WHERE sfaaent = sfacent AND sfaadocno = sfacdocno AND sfaa010 = sfac001 ",
   #            "    AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
   #            "    AND sfaa012 = sfaa050 + sfaa051 ", #完工数 = 生产数
   #           #160503-00030#3 add str
   #           #把FOREACH裡判斷生產數量sfaa012 是否等於 完工入庫數量SUM(sfec009 組進SQL中
   #            "    AND sfaa012 = (SELECT SUM(sfec009) FROM sfea_t,sfec_t",
   #            "                    WHERE sfeaent = sfecent AND sfeadocno = sfecdocno",
   #            "                      AND sfeaent = ",g_enterprise," AND sfeastus = 'S'",
   #            "                      AND sfec001 = sfaadocno AND sfec004 = '1' AND sfea001 <= '",g_edate,"')",
   #           #160503-00030#3 add end
   #            "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
   #            "    AND sfaaent = ",g_enterprise,
   #            "    AND sfaastus <> 'M' ",    #wujie 150514
   #            "    AND sfaastus <> 'X' ",    #151015-00002#1 add
   #           #160503-00030#3 mod str
   #           #"    AND sfaasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #           #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   #            "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
   #            "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   #           #160503-00030#3 mod end 
   #200727-00041#1---mark---e  
   #200727-00041#1---mark---s
   LET g_sql = " SELECT DISTINCT sfaa010,' ',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
               "        'asft300',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00563' AND gzze002='",g_lang,"') info,",
               "        sfaa012 ",
               "   FROM sfaa_t,sfac_t",         
               "  WHERE sfaaent = sfacent AND sfaadocno = sfacdocno ",
               "    AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND ((SELECT COUNT(1) FROM sfac_t WHERE sfaaent = sfacent AND sfaadocno = sfacdocno  AND sfac003 <> sfac005 AND sfac002='3') = 0 ",
               "        OR sfaa012 = sfaa050 + sfaa051) ",
               #"    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案  #210222-00024#1 mark
               #210222-00024#1---add---s
               "    AND NOT EXISTS(SELECT 1 FROM sfea_t,sfec_t",
               "                    WHERE sfeaent = sfecent AND sfeadocno = sfecdocno",
               "                      AND sfeaent = ",g_enterprise," AND sfeastus = 'S'",
               "                      AND sfec001 = sfaadocno AND sfea001 > '",g_edate,"')",
               #210222-00024#1---add---e
#               "    AND sfac005 >= sfac003 ",   #200821-00042#1 mark
               "    AND NOT EXISTS (SELECT 1 FROM sfac_t WHERE sfacent = sfaaent AND sfacdocno=sfaadocno AND sfac005 < sfac003 ) ",  #200821-00042#1 add
               "    AND sfaa003 <> '3' ",
               "    AND sfaaent = ",g_enterprise,
               "    AND sfaastus NOT IN('M','X','N') ",     
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   #200727-00041#1---mark---e    
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','sfaa010')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add--- e               
   PREPARE axcq300_pr12 FROM g_sql
   DECLARE axcq300_cs12 CURSOR FOR axcq300_pr12
   FOREACH axcq300_cs12 INTO g_xccc_d[l_ac].*,l_sfaa012
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs12" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT SUM(sfec009) INTO l_sfec009 FROM sfea_t,sfec_t
#       WHERE sfeaent = sfecent AND sfeadocno = sfecdocno AND sfeaent = g_enterprise AND sfeastus = 'S'
#         AND sfec001 = g_xccc_d[l_ac].docno AND sfec004 = '1' AND sfea001 <= g_edate
#         AND sfeaent = g_enterprise 
#      IF cl_null(l_sfec009) THEN
#         LET l_sfec009 = 0
#      END IF
#      IF l_sfec009 <> l_sfaa012  THEN
#         CONTINUE FOREACH
#      END IF
#      
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#          WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006     
#      CALL cl_getmsg('axc-00563',g_lang) RETURNING ls_msg  #應結工單尚未結案
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH   

   #13，當月完工入庫,檢核有無報工
   LET g_sql = " SELECT DISTINCT sfec005,sfec006,",
              #160503-00030#3 mod str
              #"        '','',sfec001,''",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfecent AND imaal001=sfec005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfecent AND imaal001=sfec005 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        'asft300',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               #160913-00024#1-e
               "        sfec001,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00571' AND gzze002='",g_lang,"') info",
              #160503-00030#3 mod end
               "   FROM sfec_t,sfea_t ",
               "  WHERE sfeaent = sfecent AND sfeadocno = sfecdocno ",
               "    AND sfea001 BETWEEN '",g_bdate,"' AND '",g_edate,"'" #170410-00014#1 remove ,
               #"    AND NOT EXISTS (SELECT 1 FROM xcbi_t WHERE xcbient = sfecent AND xcbi002 = sfec001 AND xcbicomp = '",tm.xccccomp,"') ", #170410-00014#1 mark
   #170410-00014#1 add start -----
   IF g_para_data2 = 'Y' THEN
      LET g_sql = g_sql, "    AND NOT EXISTS (SELECT 1 FROM xcbr_t WHERE xcbrent = sfecent AND xcbr002 = sfec001 AND xcbrcomp = '",tm.xccccomp,"') "
   ELSE
      LET g_sql = g_sql, "    AND NOT EXISTS (SELECT 1 FROM xcbi_t WHERE xcbient = sfecent AND xcbi002 = sfec001 AND xcbicomp = '",tm.xccccomp,"') "
   END IF
   LET g_sql = g_sql,
   #170410-00014#1 add start -----               
               "    AND sfeaent = ",g_enterprise," AND sfeastus = 'S'",
              #160503-00030#3 mod str
              #"    AND sfeasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
              #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfeaent AND ooef001=sfeasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
              #160503-00030#3 mod end
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','sfec005')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e                
   PREPARE axcq300_pr13 FROM g_sql
   DECLARE axcq300_cs13 CURSOR FOR axcq300_pr13
   FOREACH axcq300_cs13 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs13" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#          WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006     
#      CALL cl_getmsg('axc-00571',g_lang) RETURNING ls_msg  #工單已入庫,但未有報工資料
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH   
   
   #by wuxja add 150515 ---begin---
   #14.检查在imaa中有的料号（已审核），但imac没有数据
   #170105-00011#10---mark---s 
   #LET g_sql = " SELECT imaa001,'',",
   #           #160503-00030#3 mod str
   #           #"        '','','',''",
   #            "        (SELECT imaal003 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal003,",
   #            "        (SELECT imaal004 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal004,",
   #            #160913-00024#1-s
   #            "        '',",
   #            "        '',",
   #            #160913-00024#1-e
   #            "        '',",
   #            "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00709' AND gzze002='",g_lang,"') info",
   #           #160503-00030#3 mod end
   #            "   FROM imaa_t",
   #            "  WHERE imaaent = ",g_enterprise," AND imaastus = 'Y'",
   #           #160503-00030#3 mod str
   #           #"    AND imaa001 NOT IN (SELECT imac001 FROM imac_t WHERE imacent = ",g_enterprise,")"
   #            "    AND NOT EXISTS (SELECT 1 FROM imac_t WHERE imacent=imaaent AND imac001=imaa001)"
   #           #160503-00030#3 mod end
   #170105-00011#10---mark---e 
   #170105-00011#10---add---s 
   LET g_sql = " SELECT imaa001,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal004,",
               "        '','',",      #210105-00032#1 add
               "        '',",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00709' AND gzze002='",g_lang,"') info",
               "   FROM imaa_t",
               "   LEFT OUTER JOIN imac_t ON imacent=imaaent AND imac001=imaa001",
               "  WHERE imaaent = ",g_enterprise," AND imaastus = 'Y'",
#               "    AND imac001 IS NULL )"      #171208-00015#1 mark
               "    AND imac001 IS NULL "      #171208-00015#1 mod
   #170105-00011#10---add---e         
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','imaa001')   
   LET g_sql = g_sql," AND ",l_wc
   #170625-00005#1---add---e     
   PREPARE axcq300_pr14 FROM g_sql
   DECLARE axcq300_cs14 CURSOR FOR axcq300_pr14
   FOREACH axcq300_cs14 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs14" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#          WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006     
#      CALL cl_getmsg('axc-00709',g_lang) RETURNING ls_msg  #此料号存在于料件主档imaa中，但不存在于料件资讯档imac中
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH
   #by wuxja add 150515 ---end---   
   
   #add zhangllc 150722 --begin--
   #15.检查有工单或备料，没inaj的，且没有xcbb的
   #170105-00011#10---mark---s                      
   #LET g_sql = " SELECT sfaa010,'',",
   #           #160503-00030#3 mod str
   #           #"        '','',sfaadocno,''",
   #            "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
   #            "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
   #            #160913-00024#1-s
   #            "        'asft300',",
   #            "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
   #            #160913-00024#1-e
   #            "        sfaadocno,",
   #            "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00723' AND gzze002='",g_lang,"') info",
   #           #160503-00030#3 mod end
   #            "   FROM sfaa_t ",         
   #            "  WHERE sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
   #            "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
   #            "    AND sfaastus NOT IN ('M','X','N') ",    #成本结案
   #            "    AND sfaaent = ",g_enterprise,               
   #           #160503-00030#3 mod str
   #           #"    AND sfaasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #           #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
   #            "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
   #            "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
   #           #160503-00030#3 mod end
   #            "    AND NOT EXISTS (SELECT 1 FROM inaj_t WHERE inajent = sfaaent AND inajsite = sfaasite",
   #            "                                           AND inaj005 = sfaa010 AND inaj020= sfaadocno) ",
   #            "    AND NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = sfaaent AND xcbb003 = sfaa010 ",
   #            "                                           AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
   #            "                                           AND xcbbcomp = '",tm.xccccomp,"') ",
   #            " UNION ",
   #            " SELECT sfba006,'',",
   #           #160503-00030#3 mod str
   #           #"        '','',sfaadocno,''",
   #            "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal003,",
   #            "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal004,",
   #            #160913-00024#1-s
   #            "        'asft300',",
   #            "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
   #            #160913-00024#1-e
   #            "        sfaadocno,",
   #            "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00723' AND gzze002='",g_lang,"') info",
   #           #160503-00030#3 mod end
   #            "   FROM sfba_t,sfaa_t ",         
   #            "  WHERE sfaaent = sfbaent AND sfaadocno=sfbadocno ",
   #            "    AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
   #            "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
   #            "    AND sfaastus NOT IN ('M','X','N') ",    #成本结案
   #            "    AND sfaaent = ",g_enterprise,
   #           #160503-00030#3 mod str
   #           #"    AND sfaasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #           #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
   #            "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
   #            "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
   #           #160503-00030#3 mod end
   #            "    AND NOT EXISTS (SELECT 1 FROM inaj_t WHERE inajent = sfbaent AND inajsite = sfbasite",
   #            "                                           AND inaj005 = sfba006 AND inaj020 = sfbadocno) ",
   #            "    AND NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = sfbaent AND xcbb003 = sfba006 ",
   #            "                                           AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
   #            "                                           AND xcbbcomp = '",tm.xccccomp,"') "
   #170105-00011#10---mark---e   
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','sfaa010')   
   LET l_wc2 = cl_replace_str(g_wc,'xccc006','sfba006')
   #170625-00005#1---add---e     
   #170105-00011#10---add---s
   LET g_sql = " SELECT sfaa010,'',",
              #160503-00030#3 mod str
              #"        '','',sfaadocno,''",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
               "        '','',",       #210105-00032#1 add
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00723' AND gzze002='",g_lang,"') info",
               "   FROM sfaa_t ",
               "   LEFT OUTER JOIN inaj_t ON inajent = sfaaent AND inajsite = sfaasite",
               "                         AND inaj005 = sfaa010 AND inaj020= sfaadocno",
               "   LEFT OUTER JOIN xcbb_t ON xcbbent = sfaaent AND xcbb003 = sfaa010 ",
               "                         AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
               "                         AND xcbbcomp = '",tm.xccccomp,"'",               
               "  WHERE sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
               "    AND sfaastus NOT IN ('M','X','N') ",    #成本结案
               "    AND sfaaent = ",g_enterprise,               
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               #"    AND inaj005 IS NULL AND inaj020 IS NULL ) ",   #PGS-(D)-03080 mark
               "    AND inaj005 IS NULL AND inaj020 IS NULL  ",   #PGS-(D)-03080
               "    AND xcbb003 IS NULL ",
               "    AND ",l_wc,    #170625-00005#1
               " UNION ",
               " SELECT sfba006,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal004,",
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00723' AND gzze002='",g_lang,"') info",
               "   FROM sfaa_t,sfba_t ",
               "   LEFT OUTER JOIN inaj_t ON inajent = sfbaent AND inajsite = sfbasite",
               "                      AND inaj005 = sfba006 AND inaj020 = sfbadocno ",
               "   LEFT OUTER JOIN xcbb_t ON xcbbent = sfbaent AND xcbb003 = sfba006 ",
               "                         AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
               "                         AND xcbbcomp = '",tm.xccccomp,"'",               
               "  WHERE sfaaent = sfbaent AND sfaadocno=sfbadocno ",
               "    AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
               "    AND sfaastus NOT IN ('M','X','N') ",    #成本结案
               "    AND sfaaent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
#               "    AND inaj005 IS NULL AND inaj020 IS NULL) ",   #171208-00015#1 mark
               "    AND inaj005 IS NULL AND inaj020 IS NULL ",   #171208-00015#1 mod
               "    AND xcbb003 IS NULL ",
               "    AND ",l_wc2   #170625-00005#1
   #170105-00011#10---add---e                
   PREPARE axcq300_pr15 FROM g_sql
   DECLARE axcq300_cs15 CURSOR FOR axcq300_pr15
   FOREACH axcq300_cs15 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs15" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      CALL s_desc_get_item_desc(g_xccc_d[l_ac].xccc006) RETURNING g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1
#      CALL cl_getmsg('axc-00723',g_lang) RETURNING ls_msg  #有工單或備料，但無庫存異動明細檔inaj_t資料和料件據點成本資料按期設定檔xcbb_t資料
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH
   #add zhangllc 150722 --end--
   
   #151015-00002#1-Start-Add
   #16.雜收單設定判斷
   #1.檢核狀態為未庫存扣帳單者, 則提示異常 ,”庫存異動單未作庫存扣帳”
   #2.與 axct312 (xccw_t)作比對, 不存在axct312或是xccw202.成本金額 是null或0者, 則提示異常  “雜收單未設定入庫單價”
#160503-00030#3 mod str
#   LET g_sql = " SELECT UNIQUE inbb001,'',",   #mod zhangllc 151110 add unique
#              #160503-00030#3 mod str
#              #"        '','',inbadocno,'',",
#               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
#               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
#               "        inbadocno,'",ls_msg_axc00557,"'",
#              #160503-00030#3 mod end
#               "        inbastus,xccw202,inbb016 ",
#               "   FROM inba_t,inbb_t ",
#               "   LEFT OUTER JOIN xccw_t ON xccw006 = inbbdocno and xccw010 = inbb001 AND inbbent = xccwent ",
#               "                         AND xccw001 = ",tm.xccc001," ",
#               "  WHERE inbaent = ",g_enterprise," ",
#               "    AND inbbent = inbaent AND inbadocno = inbbdocno ",
#              #160503-00030#3 mod str
#              #"    AND inbasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#              #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
#               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inbaent AND ooef001=inbasite",
#               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
#              #160503-00030#3 mod end
#               "    AND inbasite = inbbsite ",               
#               "    AND inba002 BETWEEN '", g_bdate,"' AND '", g_edate,"'",   #扣帳日期
#               "    AND inbastus != 'X' ",                                    #未作廢
#               "    AND inba001 = '2' "                                       #雜收單 
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','inbb001')   
   #170625-00005#1---add---e  
#   LET g_sql = " SELECT UNIQUE inbb001,'',",  #200428-00039#1 mark
   LET g_sql = " SELECT UNIQUE inbb001,inbb002,",  #200428-00039#1 add #aint302单据产品特征取inbb002  
               #181120-00026#1   mark-S
#               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal003,",
#               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal004,",
#               #160913-00024#1-s
#               "        'aint302',",
#               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aint302' AND gzzal002='"||g_dlang||"') gzzal003,",
#               #160913-00024#1-e
#               "        inbadocno,",
#               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00737' AND gzze002='",g_lang,"') info,",
#               "        inbastus,xccw202,inbb016 ",
#               #"   FROM inba_t,inbb_t ",    #170301-00040#1 mark
#               "   FROM inba_t,inaa_t,inbb_t ",    #170301-00040#1 add
#               "   LEFT OUTER JOIN xccw_t ON xccw006 = inbbdocno and xccw010 = inbb001 AND inbbent = xccwent ",
#               "                         AND xccw001 = ",tm.xccc001," ",
#               "  WHERE inbaent = ",g_enterprise," ",
#               "    AND inbbent = inbaent AND inbadocno = inbbdocno ",
#               "    AND inbbent = inaaent AND inbbsite = inaasite AND inbb007 = inaa001 AND inaa010 = 'Y' ",     #170301-00040#1 add
#               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inbaent AND ooef001=inbasite",
#               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
#               "    AND inbasite = inbbsite ",               
#               "    AND inba002 BETWEEN '", g_bdate,"' AND '", g_edate,"'",   #扣帳日期
#               "    AND inbastus != 'X' AND inbastus != 'S'",                 #未作廢 且 非已過帳
#               "    AND inba001 = '2' ",                                      #雜收單
#               "    AND ",l_wc,  #170625-00005#1
#               " UNION", 
#               " SELECT UNIQUE inbb001,inbb016,",
               #181120-00026#1   mark-E
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal004,",
               #160913-00024#1-s
               "        'aint302',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aint302' AND gzzal002='"||g_dlang||"') gzzal003,",
               #160913-00024#1-e
               "        inbadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00738' AND gzze002='",g_lang,"') info,",
              #"        inbastus,xccw202,inbb016 ",   #210319-00051#1 mark
               "        inbastus,xccw282,inbb016 ",   #210319-00051#1 add
               #"   FROM inba_t,inbb_t ",          #170301-00040#1 mark
               #"   FROM inba_t,inaa_t,inbb_t ",    #170301-00040#1 add #191105-00012#1 mark
               #210319-00051#1 mark(s)
               #"   FROM inba_t,inbc_t,inaa_t,inbb_t ",    #191105-00012#1
               #"   LEFT OUTER JOIN xccw_t ON xccw006 = inbbdocno and xccw010 = inbb001 AND inbbent = xccwent ",
               #"                         AND xccw001 = ",tm.xccc001," ",
               #210319-00051#1 mark(e)
               #210319-00051#1 add(s)
               "  FROM inba_t,inbc_t ",    #191105-00012#1
               "   LEFT OUTER JOIN xccw_t ON xccw006 = inbcdocno and xccw010 = inbc001 AND inbcent = xccwent ",
               "                         AND xccw001 = ",tm.xccc001," ",
               "                         AND xccw003 = '",tm.xccc003,"' AND xccw004 = ",tm.xccc004," AND xccw005 = ",tm.xccc005,
               "                         AND xccw007 = inbcseq AND xccw008 = inbcseq1 ",
               ",inaa_t,inbb_t ",
               #210319-00051#1 add(e)
               "  WHERE inbaent = ",g_enterprise," ",
               "    AND inbbent = inbaent AND inbadocno = inbbdocno ",
               "    AND inbbent = inbcent AND inbbdocno = inbcdocno AND inbbseq = inbcseq ", #191105-00012#1
               #"    AND inbbent = inaaent AND inbbsite = inaasite AND inbb007 = inaa001 AND inaa010 = 'Y' ",     #170301-00040#1 add #191105-00012#1 mark
               "    AND inbcent = inaaent AND inbcsite = inaasite AND inbc005 = inaa001 AND inaa010 = 'Y' ",     #191105-00012#1
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inbaent AND ooef001=inbasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "    AND inbasite = inbbsite ",               
               "    AND inba002 BETWEEN '", g_bdate,"' AND '", g_edate,"'",   #扣帳日期
               "    AND inbastus = 'S'",                                      #已過帳
               "    AND inba001 = '2' ",                                      #雜收單
              #"    AND (xccw202 IS NULL OR xccw202 = 0)",   #210319-00051#1 mark
               "    AND (xccw282 IS NULL OR xccw282 = 0)",   #210319-00051#1 add
               "    AND ",l_wc   #170625-00005#1               
#160503-00030#3 mod end               
   PREPARE axcq300_pr16 FROM g_sql
   DECLARE axcq300_cs16 CURSOR FOR axcq300_pr16
   FOREACH axcq300_cs16 INTO g_xccc_d[l_ac].*,l_inbastus,l_xccw202,l_inbb016
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs16" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF 
#160503-00030#3 mark str     
#      #mod zhangllc 151110 --begin
#      #SELECT imaal003,imaal004 INTO g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1 FROM imaal_t 
#      # WHERE imaalent = g_enterprise AND imaal001 = g_xccc_d[l_ac].xccc006
#      CALL s_desc_get_item_desc(g_xccc_d[l_ac].xccc006) RETURNING g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1
#      #mod zhangllc 151110 --end
#      
#      IF l_inbastus != 'S' THEN
#         CALL cl_getmsg('axc-00737',g_lang) RETURNING ls_msg  #庫存異動單未作庫存扣帳
#         LET g_xccc_d[l_ac].info = ls_msg  #错误信息 
#         LET l_ac = l_ac + 1
#         
#         CONTINUE FOREACH #因為過帳單據，一定不會有axct312的資料(設定單價)         
#      END IF
#160503-00030#3 mark end
      IF cl_null(l_xccw202) or l_xccw202 = 0 THEN 
#        LET g_xccc_d[l_ac].xccc007 = l_inbb016
         #151201-00018 by whitney add start
         LET l_oocql004 = ''
         SELECT oocql004 INTO l_oocql004
           FROM oocql_t,gzcb_t
          WHERE oocqlent = g_enterprise
            AND oocql001 = gzcb004
            AND oocql002 = l_inbb016
            AND oocql003 = g_dlang
            AND gzcb001 = '24'
            AND gzcb002 = 'aint302'
         LET l_str = l_inbb016,l_oocql004
#        CALL cl_getmsg('axc-00738',g_lang) RETURNING ls_msg  #雜收單未設定入庫單價  #160503-00030#3 mark
         CALL cl_replace_err_msg(g_xccc_d[l_ac].info,l_str) RETURNING g_xccc_d[l_ac].info
         #151201-00018 by whitney add end
#        LET g_xccc_d[l_ac].info = ls_msg  #错误信息  #160503-00030#3 mark
         LET l_ac = l_ac + 1
     #160503-00030#3 add str
      ELSE
         LET l_ac = l_ac + 1
     #160503-00030#3 add end         
      END IF   
           
   END FOREACH   
   #151015-00002#1-End-Add
   
   #add zhangllc 151029 --begin--
   #17.如果参数没有启用特性码计算成本，检查axci120中一个料号只能存在一笔资料，且特征栏位为空格(关键词唯一性，只要判断特性非空格就可以了)
   IF g_para_data1 = 'N' THEN
      LET g_sql = " SELECT xcbb003,xcbb004,",
                 #160503-00030#3 mod str
                 #"        '','','',''",
                  "        (SELECT imaal003 FROM imaal_t WHERE imaalent=xcbbent AND imaal001=xcbb003 AND imaal002='"||g_dlang||"') imaal003,",
                  "        (SELECT imaal004 FROM imaal_t WHERE imaalent=xcbbent AND imaal001=xcbb003 AND imaal002='"||g_dlang||"') imaal004,",
                  #160913-00024#1-s
                  "        'axci120',",
                  "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'axci120' AND gzzal002='"||g_dlang||"') gzzal003,",
                  #160913-00024#1-e
                  "        '',",
                  "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00740' AND gzze002='",g_lang,"') info",
                 #160503-00030#3 mod end
                  "   FROM xcbb_t ",
                  "  WHERE xcbbent = ",g_enterprise,
                  "    AND xcbbcomp='",tm.xccccomp,"' ",
                  "    AND xcbb001 = ",tm.xccc004,
                  "    AND xcbb002 = ",tm.xccc005,
                  "    AND xcbb004 IS NOT NULL AND xcbb004 !=' ' "
      #170625-00005#1---add---s 
      LET l_wc = cl_replace_str(g_wc,'xccc006','xcbb003')   
      LET g_sql = g_sql," AND ",l_wc
      #170625-00005#1---add--- e                   
      PREPARE axcq300_pr17 FROM g_sql
      DECLARE axcq300_cs17 CURSOR FOR axcq300_pr17
      FOREACH axcq300_cs17 INTO g_xccc_d[l_ac].*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:axcq300_cs17" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
#160503-00030#3 mark str
#         CALL s_desc_get_item_desc(g_xccc_d[l_ac].xccc006) RETURNING g_xccc_d[l_ac].xccc006_desc,g_xccc_d[l_ac].xccc006_desc_1
#         CALL cl_getmsg('axc-00740',g_lang) RETURNING ls_msg  #一个料号只能存在一笔资料，且特征栏位为空格
#         LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
         LET l_ac = l_ac + 1
      END FOREACH
   END IF
   #add zhangllc 151029 --end--
   
   #add zhangllc 151109-02 -begin
   #17.检查发料单中工单不存在于工单维护作业中
#170105-00011#10---mark---s            
#  #160503-00030#3 mod str
#  #LET g_sql = " SELECT UNIQUE '','','','',sfdc001,''",
#   #LET g_sql = " SELECT UNIQUE '','','','',sfdc001,",   #160913-00024#1 MARK
#               #160913-00024#1-s
#   LET g_sql = " SELECT UNIQUE '','','','',",            
#               "        '',",
#               "        'asft300',",
#               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
#               #160913-00024#1-e
#               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00401' AND gzze002='",g_lang,"') info",
#  #160503-00030#3 mod end   
#               "   FROM sfdc_t,sfda_t ",
#               "  WHERE sfdcent = sfdaent AND sfdcdocno = sfdadocno ",
#               "    AND sfdaent = ",g_enterprise,
#               "    AND sfda001 BETWEEN '", g_bdate,"' AND '", g_edate,"'",
#               "    AND sfdastus = 'S' ",
#               "    AND NOT EXISTS (SELECT 1 FROM sfaa_t WHERE sfaaent = sfdcent and sfaadocno = sfdc001)",
#               "    AND sfdc001 IS NOT NULL ",
#               "    AND sfda002 NOT IN ('16','26') ",
#              #160503-00030#3 mod str
#              #"    AND sfdasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#              #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
#               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfdaent AND ooef001=sfdasite",
#               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
#              #160503-00030#3 mod end
#               " UNION ",
#              #160503-00030#3 mod str
#              #" SELECT UNIQUE '','','','',sfdb001,''",
#              #" SELECT UNIQUE '','','','',sfdb001,",  160913-00024#1 MARK
#               #160913-00024#1-s
#               " SELECT UNIQUE '','','','',",            
#               "        'asft300',",
#               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
#               "        sfdb001,",
#               #160913-00024#1-e
#               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00401' AND gzze002='",g_lang,"') info",
#               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00401' AND gzze002='",g_lang,"') info",
#              #160503-00030#3 mod end
#               "   FROM sfdb_t,sfda_t ",
#               "  WHERE sfdbent = sfdaent AND sfdbdocno = sfdadocno ",
#               "    AND sfdaent = ",g_enterprise,
#               "    AND sfda001 BETWEEN '", g_bdate,"' AND '", g_edate,"'",
#               "    AND sfdastus = 'S' ",
#               "    AND NOT EXISTS (SELECT 1 FROM sfaa_t WHERE sfaaent = sfdbent and sfaadocno = sfdb001)",
#               "    AND sfdb001 IS NOT NULL ",
#               "    AND sfda002 IN ('15','25') ",
#              #160503-00030#3 mod str
#              #"    AND sfdasite IN (SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#              #"                        AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
#               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfdaent AND ooef001=sfdasite",
#               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
#              #160503-00030#3 mod end
#170105-00011#10---mark---e  
   #170625-00005#1---add---s 
   LET l_wc = cl_replace_str(g_wc,'xccc006','sfda006')   
   #170625-00005#1---add---e 
   #170105-00011#10---add---s
   #LET g_sql = " SELECT UNIQUE '','','','',sfdc001,",      #210105-00032#1 mark
   LET g_sql = " SELECT UNIQUE '','','','','','',sfdc001,",      #210105-00032#1 add
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00401' AND gzze002='",g_lang,"') info",  
               "   FROM sfda_t,sfdc_t ",
               "   LEFT OUTER JOIN sfaa_t ON sfaaent = sfdcent and sfaadocno = sfdc001 ",
               "  WHERE sfdcent = sfdaent AND sfdcdocno = sfdadocno ",
               "    AND sfdaent = ",g_enterprise,
               "    AND sfda001 BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND sfdastus = 'S' ",
               "    AND sfaadocno IS NULL ",
               "    AND sfdc001 IS NOT NULL ",
               "    AND sfda002 NOT IN ('16','26') ",
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfdaent AND ooef001=sfdasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "    AND ",l_wc,   #170625-00005#1
               " UNION ",
               " SELECT UNIQUE '','','','',sfdb001,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00401' AND gzze002='",g_lang,"') info",
               "   FROM sfda_t,sfdb_t ",
               "   LEFT OUTER JOIN sfaa_t ON sfaaent = sfdbent and sfaadocno = sfdb001 ",
               "  WHERE sfdbent = sfdaent AND sfdbdocno = sfdadocno ",
               "    AND sfdaent = ",g_enterprise,
               "    AND sfda001 BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND sfdastus = 'S' ",
               "    AND sfaadocno IS NULL",
               "    AND sfdb001 IS NOT NULL ",
               "    AND sfda002 IN ('15','25') ",
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfdaent AND ooef001=sfdasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "    AND ",l_wc    #170625-00005#1               
   #170105-00011#10---add---e               
   PREPARE axcq300_pr18 FROM g_sql
   DECLARE axcq300_cs18 CURSOR FOR axcq300_pr18
   FOREACH axcq300_cs18 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs18" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
#160503-00030#3 mark str
#      CALL cl_getmsg('axc-00401',g_lang) RETURNING ls_msg  #工單不存在工單維護作業中
#      LET g_xccc_d[l_ac].info = ls_msg  #错误信息
#160503-00030#3 mark end
      LET l_ac = l_ac + 1
   END FOREACH
   #add zhangllc 151109-02 -end
   
   #170618-00103#1---add---s
   #以工單的資料，判別有異常的成本階，主件成本阶>=元件的
   #用生產料跟備料判斷，再加上回收料
#180808-00004#1 mark --(S)-- 
#   LET g_sql = " SELECT UNIQUE sfaa010,sfaa011,",          
#               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
#               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
#               "        'asft300',",
#               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
#               "        sfaadocno,",
#               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00454' AND gzze002='",g_lang,"') info",  
#               " FROM "	, 
#               " (SELECT UNIQUE sfaadocno docno,xcbb006 FROM sfaa_t,xcbb_t",
#               "   WHERE sfaaent = xcbbent AND sfaa010 = xcbb003 AND sfaa011 = xcbb004 AND xcbbent = ",g_enterprise, " AND xcbbcomp = '",tm.xccccomp,"'",
#               "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005," ) aa , " , 
#               #180904-00054#1 mark-S
##               " (SELECT UNIQUE sfbadocno,xcbb006 FROM sfba_t,xcbb_t",
##               "   WHERE sfbaent = xcbbent AND sfba006 = xcbb003 AND sfba021 = xcbb004 AND xcbbent = ",g_enterprise, " AND xcbbcomp = '",tm.xccccomp,"'",
##               "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
##               "  UNION " ,
##               "  SELECT UNIQUE sfacdocno sfbadocno,xcbb006 FROM sfac_t,xcbb_t",
##               "   WHERE sfacent = xcbbent AND sfac001 = xcbb003 AND sfac006 = xcbb004 AND sfac002 = '5' AND xcbbent = ",g_enterprise, " AND xcbbcomp = '",tm.xccccomp,"'",
##               "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
##               "  ) bb , " ,
#               #180904-00054#1 mark-E             
#               #180904-00054#1 add-S
#               " (SELECT DISTINCT sfdc001 sfbadocno,MIN(xcbb006) xcbb006 ",
#               "    FROM sfdc_t,sfaa_t,xcbb_t ",
#               "   WHERE sfdcent = xcbbent AND sfdc004 = xcbb003 AND sfdc005 = xcbb004 AND xcbbent = ",g_enterprise," AND xcbbcomp = '",tm.xccccomp,"' ",
#               "     AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
#               "     AND sfaaent = sfdcent AND sfaadocno = sfdc001 AND sfaa057 <> '2' ",
#               "     AND sfaadocdt BETWEEN ? AND ? ",
#               "   GROUP BY sfdc001 ",
#               "   UNION ",
#               "  SELECT DISTINCT inaj020 sfbadocno,MIN(xcbb006) xcbb006 ",   #委外
#               "    FROM inaj_t,sfaa_t,xcbb_t ",
#               "   WHERE xcbbent = inajent AND xcbb003 = inaj005 AND xcbbent = ",g_enterprise," AND xcbbcomp = '",tm.xccccomp,"' ",
#               "     AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
#               "     AND sfaaent = inajent AND sfaadocno = inaj020 AND ((sfaa003 = '1' AND sfaa057 = '2') OR (sfaa003 = '2' AND sfaa057 = '2')) ",
#               "     AND sfaadocdt BETWEEN ? AND ? ",
#               "     AND inaj015 IN('asft311','asft312','asft313','asft314','asft315','asft321','asft322','asft323','asft324','asft325') ",
#               "   GROUP BY inaj020",
#               "  UNION " ,
#               "  SELECT UNIQUE sfacdocno sfbadocno,xcbb006 FROM sfac_t,xcbb_t",
#               "   WHERE sfacent = xcbbent AND sfac001 = xcbb003 AND sfac006 = xcbb004 AND sfac002 = '5' AND xcbbent = ",g_enterprise, " AND xcbbcomp = '",tm.xccccomp,"'",
#               "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
#               " ) bb, ",
#               #180904-00054#1 add-E 
#               "   sfaa_t  ",           
#               " WHERE aa.docno = bb.sfbadocno AND aa.xcbb006 >= bb.xcbb006 ", #同工单 主件成本阶>元件成本阶
#               "   AND sfaadocno = aa.docno ",
#               "   AND sfaaent   = ",g_enterprise,
#               "   AND sfaa003 <> '2' ",  #180821-00061#1 非返工工单
#               "   AND (sfaa042 IS NULL OR sfaa042 = ' ' OR sfaa042 = 'N')", #非重工工单
#               #180904-00054#1 mark-S
##               "   AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
##               "   AND ((sfaa048 IS NULL OR sfaa048>='",g_bdate,"') AND sfaa045<='",g_edate,"')", #180320-00035#1 add
#               #180904-00054#1 mark-E
#               #180904-00054#1 add-S
#               "   AND sfaadocdt BETWEEN ? AND ? ",
#               "   AND ((sfaa048 IS NULL OR sfaa048>=?) AND sfaa045<=?)", 
#               #180904-00054#1 add-E
#               "   AND sfaastus <> 'X' ", 
#               "   AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
#               "                                      AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
#               #171113-00010#1-s add
#               "   AND EXISTS (SELECT 1 FROM sfda_t,sfdc_t,sfdd_t WHERE sfdaent = ",g_enterprise, " AND sfdcent = sfdaent ",
#               "                                                    AND sfdcdocno = sfdadocno AND sfddent = sfdcent AND sfdddocno = sfdcdocno",               
#               "                                                    AND sfdcseq = sfddseq AND sfdc001 = sfaadocno AND sfdastus = 'S' AND sfdd007 > 0 )",
#               #171113-00010#1-e add
#               " ORDER BY sfaadocno,sfaa010 " 
#180808-00004#1 mark --(E)--             
   #180808-00004#1 add --(S)--
   #效能調整,將SQL中的子查詢利用WITH AS的方式改寫,WITH table AS相當于建立一個temp table,WITH AS建立的臨時表是該SQL查詢完成後就被清除了
   LET g_sql = " WITH aa AS ",
               " (SELECT UNIQUE sfaadocno docno,xcbb006 FROM sfaa_t,xcbb_t",
               "   WHERE sfaaent = xcbbent AND sfaa010 = xcbb003 AND sfaa011 = xcbb004 AND xcbbent = ",g_enterprise, " AND xcbbcomp = '",tm.xccccomp,"'",
               #190214-00008#1 add --(S)--
               "                   AND (sfaa042 IS NULL OR sfaa042 = ' ' OR sfaa042 = 'N')", #非重工工单
               "                   AND sfaadocdt BETWEEN ? AND ?",
               "                   AND sfaastus <> 'X' ", 
               #190214-00008#1 add --(E)--
               "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005," ), " ,
               "      bb AS ",
                " (SELECT DISTINCT sfdc001 sfbadocno,MIN(xcbb006) xcbb006 ",
               #"    FROM sfdc_t,sfaa_t,xcbb_t ", #200416-00020#1 mark
               "    FROM sfda_t,sfdc_t,sfaa_t,xcbb_t ", #200416-00020#1  
               "   WHERE sfdcent = xcbbent AND sfdc004 = xcbb003 AND sfdc005 = xcbb004 AND xcbbent = ",g_enterprise," AND xcbbcomp = '",tm.xccccomp,"' ",
               "     AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
               "     AND sfaaent = sfdcent AND sfaadocno = sfdc001 AND sfaa057 <> '2' ",
               "     AND sfdcent = sfdaent AND sfdcdocno = sfdadocno AND sfdastus = 'S'",  #200416-00020#1               
               #190214-00008#1 add --(S)--
               "     AND (sfaa042 IS NULL OR sfaa042 = ' ' OR sfaa042 = 'N')", #非重工工单
               "     AND sfaastus <> 'X' ", 
               #190214-00008#1 add --(E)--
               "     AND sfaadocdt BETWEEN ? AND ? ",
               "   GROUP BY sfdc001 ",
               "   UNION ",
               "  SELECT DISTINCT inaj020 sfbadocno,MIN(xcbb006) xcbb006 ",   #委外
               "    FROM inaj_t,sfaa_t,xcbb_t ",
               "   WHERE xcbbent = inajent AND xcbb003 = inaj005 AND xcbbent = ",g_enterprise," AND xcbbcomp = '",tm.xccccomp,"' ",
               "     AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
               "     AND sfaaent = inajent AND sfaadocno = inaj020 AND ((sfaa003 = '1' AND sfaa057 = '2') OR (sfaa003 = '2' AND sfaa057 = '2')) ",
               #190214-00008#1 add --(S)--
               "     AND (sfaa042 IS NULL OR sfaa042 = ' ' OR sfaa042 = 'N')", #非重工工单
               "     AND sfaastus <> 'X' ", 
               #190214-00008#1 add --(E)--
               "     AND sfaadocdt BETWEEN ? AND ? ",
               "     AND inaj015 IN('asft311','asft312','asft313','asft314','asft315','asft321','asft322','asft323','asft324','asft325') ",
               "   GROUP BY inaj020",
               "  UNION " ,
               "  SELECT UNIQUE sfacdocno sfbadocno,xcbb006 FROM sfac_t,xcbb_t",
               "   WHERE sfacent = xcbbent AND sfac001 = xcbb003 AND sfac006 = xcbb004 AND sfac002 = '5' AND xcbbent = ",g_enterprise, " AND xcbbcomp = '",tm.xccccomp,"'",
               #190214-00008#1 add --(S)--
               "     AND EXISTS (SELECT sfaadocno FROM sfaa_t WHERE sfaaent = sfacent AND sfaadocno = sfacdocno ",
               "                    AND (sfaa042 IS NULL OR sfaa042 = ' ' OR sfaa042 = 'N')", #非重工工单
               "                    AND sfaastus <> 'X' ",
               "                    AND sfaadocdt BETWEEN ? AND ?)",
               #190214-00008#1 add --(E)--
               "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005," ) ",               
               " SELECT UNIQUE sfaa010,sfaa011,",           
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
               "        'asft300',",
               "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00454' AND gzze002='",g_lang,"') info",  
               " FROM "	,               
               "   sfaa_t,aa,bb  ",             
               " WHERE aa.docno = bb.sfbadocno AND aa.xcbb006 >= bb.xcbb006 ", #同工单 主件成本阶>元件成本阶
               "   AND sfaadocno = aa.docno ",
               "   AND sfaaent   = ",g_enterprise,
               "   AND sfaa003 <> '2' ",   #非返工工单
               "   AND (sfaa042 IS NULL OR sfaa042 = ' ' OR sfaa042 = 'N')", #非重工工单
               "   AND sfaadocdt BETWEEN ? AND ? ",
               "   AND ((sfaa048 IS NULL OR sfaa048>=?) AND sfaa045<=?)", 
               "   AND sfaastus <> 'X' ", 
               "   AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
               "                                      AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "   AND EXISTS (SELECT 1 FROM sfda_t,sfdc_t,sfdd_t WHERE sfdaent = ",g_enterprise, " AND sfdcent = sfdaent ",
               "                                                    AND sfdcdocno = sfdadocno AND sfddent = sfdcent AND sfdddocno = sfdcdocno",               
               "                                                    AND sfdcseq = sfddseq AND sfdc001 = sfaadocno AND sfdastus = 'S' AND sfdd007 > 0 )",
               " ORDER BY sfaadocno,sfaa010 " 
   #180808-00004#1 add --(E)--                
   PREPARE axcq300_pr19 FROM g_sql
   DECLARE axcq300_cs19 CURSOR FOR axcq300_pr19
  #OPEN axcq300_cs19 USING g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate   #180904-00054#1 add            #190214-00008#1 mark
   OPEN axcq300_cs19 USING g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate  #190214-00008#1 add
   FOREACH axcq300_cs19 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs19" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1
   END FOREACH            
   #170618-00103#1---add---e
   
   #170421-00068#1--add---s
   #判斷料件的基礎單位(imaa006)與上期成本單位(xcbb005，有值才比)不一致時，顯示「該料已修改過基礎單位，請重新開帳」
   #計算當前期別的上一期別
   IF tm.xccc005 = 1 THEN
      LET l_previous_year = tm.xccc004 - 1
      LET l_previous_month = 12
   ELSE
      LET l_previous_year = tm.xccc004
      LET l_previous_month = tm.xccc005 - 1
   END IF
   LET g_sql = " SELECT imaa001,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal004,",
               "        '',",
               "        '',",
               "        '',",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00870' AND gzze002='",g_lang,"') info",
               "   FROM imaa_t , xcbb_t ",
               "  WHERE imaaent = xcbbent AND imaa001 = xcbb003 ",
               "    AND imaa004 <> 'E' ", #180821-00061#1 非费用料号
               "    AND imaaent = ",g_enterprise, " AND xcbbcomp = '",tm.xccccomp,"'",
               "    AND xcbb001 = ",l_previous_year," AND xcbb002 = ",l_previous_month,
               "    AND imaa006 <> xcbb005 ",
               #171227-00003#1 add --(S)--
               #排除上月無成本計算資料
#               "    AND imaa001 EXIST (SELECT xccc006 FROM xccc_t ", #180821-00061#1 mark 语法错误
               "    AND imaa001 IN (SELECT xccc006 FROM xccc_t ", #180821-00061#1 mod
               "                        WHERE xcccent = ",g_enterprise," AND xccccomp = '",tm.xccccomp,"'",
               "                          AND xccc004 = ",l_previous_year," AND xccc005 = ",l_previous_month,")", 
               "    AND imaa004 <> 'E' ",       #排除費用性料號
               #171227-00003#1 add --(E)--
               #190531-00011#1---add---s
               "    AND NOT EXISTS (SELECT 1 FROM xcca_t ", 
               "                     WHERE xccaent = ",g_enterprise," AND xccacomp = '",tm.xccccomp,"'",
               "                       AND xccald = '",tm.xcccld,"' AND xcca003 ='",tm.xccc003,"'",
               "                       AND xcca004 = ",l_previous_year," AND xcca005 = ",l_previous_month,"",
               "                       AND imaa001 = xcca006)",                
               #190531-00011#1---add---e
               "    AND imaastus = 'Y' " 
   PREPARE axcq300_pr20 FROM g_sql
   DECLARE axcq300_cs20 CURSOR FOR axcq300_pr20
   FOREACH axcq300_cs20 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs20" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1
   END FOREACH                       
   #170421-00068#1--add---e
   #210105-00032#1 add -S
   #axc-00977:法人无此料号之料件据点财务数据(imag_t)
   LET g_sql = " SELECT DISTINCT imaf001,'', ",
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=imaf001 AND imaal002='"||g_dlang||"') imaal003,",
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=imaf001 AND imaal002='"||g_dlang||"') imaal004,",
               "          'aimm207',",
               "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aimm207' AND gzzal002='"||g_dlang||"') gzzal003,",
               "          '', ",
               "          (SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00977' AND gzze002 = '",g_lang,"') info",               #報錯訊息
               "   FROM imaf_t ",
               "   LEFT OUTER JOIN imag_t ON imagent = imafent AND imag001 = imaf001 AND imagsite = imafsite ",
               "   LEFT OUTER JOIN ooef_t ON ooefent = imafent AND ooef001 = '",tm.xccccomp,"' ",
               "  WHERE imafent = ",g_enterprise," AND imag001 IS NULL  AND imafsite = '",tm.xccccomp,"' ",
               "    AND imafstus = 'Y' ",
               "  ORDER BY imaf001 "
               
   PREPARE axcq300_pr38 FROM g_sql
   DECLARE axcq300_cs38 CURSOR FOR axcq300_pr38
   FOREACH axcq300_cs38 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs38" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   
   #axc-00978:该库位结存为负，请检查！
                                #料件编号#产品特征
   LET g_sql = " SELECT DISTINCT inag001,inag002, ",
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=inag001 AND imaal002='"||g_dlang||"') imaal003,",
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=inag001 AND imaal002='"||g_dlang||"') imaal004,",
               "          'ainq100',",
               "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'ainq100' AND gzzal002='"||g_dlang||"') gzzal003,",
                          #库位/储位/批号/据点
               "          inag004||'/'||inag005||'/'||inag006||'/'||inagsite, ",
               "          (SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00978' AND gzze002 = '",g_lang,"') info",  
               "   FROM inag_t ",
               "   LEFT OUTER JOIN inaa_t ON inaaent = inagent AND inaasite = inagsite AND inaa001 = inag004 ",
               "  WHERE inagent = ",g_enterprise," AND inag008 < 0 ",
               "    AND inaa014 <> 'Y' ",
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inagent AND ooef001=inagsite ",
               "                          AND ooefstus ='Y' AND ooef017 = '",tm.xccccomp,"' ) ",
               "  ORDER BY inag001,inag002 "
               
   PREPARE axcq300_pr39 FROM g_sql
   DECLARE axcq300_cs39 CURSOR FOR axcq300_pr39
   FOREACH axcq300_cs39 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs39" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   #210105-00032#1 add -E
   #201208-00015#1 add -S
   #axc-00979:截止当前期别工单已完工入库数量%1，料未发足，请检查！（拆件、多产出）
   LET g_sql = "   SELECT DISTINCT sfba005,'',",
               "          (SELECT imaal003 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfba005 AND imaal002='"||g_dlang||"') imaal003,",
               "          (SELECT imaal004 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfba005 AND imaal002='"||g_dlang||"') imaal004,",
               #"          '','',sfaadocno, ",  #201210-00001#1 mark
               #201210-00001#1 add -S
               "          'asft300',",
               "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               "          sfaadocno, ",
               #201210-00001#1 add -E
               "          REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00979' AND gzze002 = '",g_lang,"'),'%1',cast(sfec009 as varchar(10))) info",               #報錯訊息
               "    FROM ",
               "         (SELECT sfba005,sfaadocno,sfbaseq,sfaasite, ",
               "                 CASE ",
               "                 WHEN ooca004 = '1' THEN round(COALESCE(sfec009,0),ooca002) ",
               "                 WHEN ooca004 = '2' ",
               "                    THEN (CASE WHEN ooca002<>0 ",
               "                               THEN (CASE WHEN MOD(round(COALESCE(sfec009,0),ooca002),(2/power(10,ooca002)))=0 ",
               "                                          THEN round(COALESCE(sfec009,0),ooca002) ",
               "                                          ELSE round(COALESCE(sfec009,0),ooca002)-(1/power(10,ooca002)) ",
               "                                          END ) ",
               "                               ELSE round(COALESCE(sfec009,0),ooca002) ",
               "                               END) ",
               "                 WHEN ooca004 = '3'  THEN trunc(COALESCE(sfec009,0),ooca002) ",
               "                 WHEN ooca004 = '4'  THEN ceil(COALESCE(sfec009,0)*power(10,ooca002))/power(10,ooca002) ",
               "                  END sfec009 ",
               "           FROM sfaa_t ",
               "           LEFT OUTER JOIN sfba_t ON sfbaent = sfaaent AND sfbadocno = sfaadocno ",
               "           LEFT OUTER JOIN ooca_t ON oocaent = sfaaent AND ooca001 = sfaa013 ",
               "           LEFT OUTER JOIN (SELECT sfdcent,sfdc001,sfdc002,sfdc003,NVL(SUM(-1*sfdc008*sfdc017),0) sfdc008 ",
               "                              FROM sfdc_t ",
               "                              LEFT OUTER JOIN sfda_t ON sfdcent = sfdaent AND sfdcdocno = sfdadocno ",
               "                             WHERE sfdaent = ",g_enterprise," AND sfdastus = 'S' AND sfda001 BETWEEN ? AND ? ",
               "                             GROUP BY sfdcent,sfdc001,sfdc002,sfdc003) T4 ",
               "                        ON sfdcent = sfbaent AND sfdc001 = sfbadocno AND sfdc002 = sfbaseq AND sfdc003 = sfbaseq1 ",
               "           LEFT OUTER JOIN (SELECT sfjcent,sfjc001,sfjc002,sfjc015,NVL(SUM(sfjc006),0) sfjc006 ",
               "                              FROM sfjc_t ",
               "                              LEFT OUTER JOIN sfja_t ON sfjcent = sfjaent AND sfjcdocno = sfjadocno ",
               "                             WHERE sfjaent = ",g_enterprise," AND sfjastus = 'S' AND sfja003 BETWEEN ? AND ? ",
               "                             GROUP BY sfjcent,sfjc001,sfjc002,sfjc015) T5 ",
               "                        ON sfjcent = sfbaent AND sfjc001 = sfbadocno AND sfjc002 = sfbaseq AND sfjc015 = sfbaseq1 ",
               "        ,imae_t ",
               "        ,(SELECT sfec001,sfecent,MAX(sfec009) sfec009 ",
               "            FROM ",
               "              (SELECT sfec001,sfecent,sfec005,(SUM(sfec009/sfac003)*(SELECT sfaa012 FROM sfaa_t WHERE sfaaent = sfecent AND sfaadocno = sfec001)) sfec009 ", 
               "                 FROM sfec_t ",
               "                 LEFT OUTER JOIN sfea_t ON sfecdocno = sfeadocno AND sfecent = sfeaent ",
               "                 LEFT OUTER JOIN sfac_t ON sfacent = sfecent AND sfacdocno = sfec001 AND sfac001 = sfec005 AND sfac006 = sfec006 AND sfac002 = sfec004 ",
               "                WHERE sfeaent = ",g_enterprise," AND sfeastus = 'S' AND sfea001 BETWEEN ? AND ? AND sfec004 NOT IN ('1','2','5') ", 
               "                GROUP BY sfec001,sfecent,sfec005,sfec006) T1",
               "          GROUP BY sfec001,sfecent) T2 ",
               "          WHERE sfaaent = sfbaent AND sfaadocno = sfbadocno ",
               "            AND sfaaent = ",g_enterprise," AND imaeent = sfaaent ",
               "            AND imaesite = sfaasite AND imae001 = sfaa010 ",
               "            AND sfec001 = sfaadocno AND sfecent = sfaaent ",
               "            AND EXISTS(SELECT 1 FROM ooef_t WHERE ooefent = sfbaent AND ooef001 = sfbasite AND ooefstus = 'Y' AND ooef017 = '",tm.xccccomp,"') ",
               "          GROUP BY sfaadocno,sfbaseq,sfec009,imae020,sfaasite,sfba005,ooca002,ooca004 ",
#               "         HAVING SUM((NVL(sfdc008,0)-NVL(sfjc006,0))*(DECODE(NVL(sfba011,0),0,1,NVL(sfba011,0))/DECODE(NVL(sfba010,0),0,1,NVL(sfba010,0))))*(1+imae020/100) < NVL(sfec009,0)) T3 "   #201218-00004#1 mark
               "         HAVING SUM((NVL(sfdc008,0)-NVL(sfjc006,0))*DECODE(NVL(sfba011,0),0,1,NVL(sfba011,0))/DECODE(NVL(sfba010,0),0,1,NVL(sfba010,0)))*(1+imae020/100) < NVL(sfec009,0)) T3 "      #201218-00004#1 add
   PREPARE axcq300_pr36 FROM g_sql
   DECLARE axcq300_cs36 CURSOR FOR axcq300_pr36
   FOREACH axcq300_cs36 USING g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs36" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   
   #210105-00032#1 add -S
   #axc-00980:截止当前期别工单已完工入库数量%1，末站报工数量不足，请检查！
   LET g_sql = " SELECT DISTINCT sfaa010,'',",
               "          (SELECT imaal003 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
               "          (SELECT imaal004 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
               "          'asft300',",
               "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               "          sfaadocno, ",
               "          REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00980' AND gzze002 = '",g_lang,"'),'%1',cast(sfec009 as varchar(10))) info",               #報錯訊息
               "   FROM ",
               "     (SELECT sfaa010,sfaadocno,sfaasite, ",
               "              CASE  ",
               "                 WHEN ooca004 = '1' THEN round(COALESCE(sfec009,0),ooca002) ",
               "                 WHEN ooca004 = '2'  ",
               "                 THEN (CASE WHEN ooca002<>0  ",
            "                               THEN (CASE WHEN MOD(round(COALESCE(sfec009,0),ooca002),(2/power(10,ooca002)))=0 ",
               "                                       THEN round(COALESCE(sfec009,0),ooca002)  ",
               "                                       ELSE round(COALESCE(sfec009,0),ooca002)-(1/power(10,ooca002)) ",
               "                                   END ) ",
               "                            ELSE round(COALESCE(sfec009,0),ooca002)  ",
               "                        END) ",
               "                 WHEN ooca004 = '3'  THEN trunc(COALESCE(sfec009,0),ooca002) ",
               "                 WHEN ooca004 = '4'  THEN ceil(COALESCE(sfec009,0)*power(10,ooca002))/power(10,ooca002)  ",
               "              END sfec009 ",
               "        FROM sfaa_t  ",
               "        LEFT OUTER JOIN ooca_t ON oocaent = sfaaent AND ooca001 = sfaa013  ",
               "        ,ooef_t,ooac_t,(SELECT ooaa002 FROM ooaa_t WHERE ooaaent = ",g_enterprise," AND ooaa001 = 'E-COM-0008') ooaa002, ",
               "        (SELECT sfec001,sfecent,MAX(sfec009) sfec009 FROM  ",
               "              (SELECT sfec001,sfecent,sfec005,(SUM(DECODE(sfac003,0,null,sfec009/sfac003))*(SELECT sfaa012 FROM sfaa_t WHERE sfaaent = sfecent AND sfaadocno = sfec001)) sfec009 ",
               "                 FROM sfec_t  ",
               "                 LEFT OUTER JOIN sfea_t ON sfecdocno = sfeadocno AND sfecent = sfeaent  ",
               "                 LEFT OUTER JOIN sfac_t ON sfacent = sfecent AND sfacdocno = sfec001 AND sfac001 = sfec005 AND sfac006 = sfec006 AND sfac002 = sfec004 ",
               "                WHERE sfeaent = ",g_enterprise," AND sfeastus = 'S' AND sfea001 BETWEEN ? AND ? AND sfec004 NOT IN ('1','2','5')  ",
               "                GROUP BY sfec001,sfecent,sfec005,sfec006 )  ",
               "          GROUP BY sfec001,sfecent) ",
               "       WHERE sfaaent = ",g_enterprise," AND sfaaent = ooefent AND sfaasite= ooef001 AND ooef017 = '",tm.xccccomp,"' AND ooacent = sfaaent AND ooac001 = ooef004 AND ooac003 = 'D-MFG-0044' ",
               "         AND ooac004 = 'Y' AND sfec001 = sfaadocno AND sfecent = sfaaent AND sfaa061 = 'Y' ",
               "         AND sfec009 >  NVL((SELECT (CASE WHEN sfcb005 = '2' THEN SUM(sffb017) ELSE MIN(sffb017) END) ",
               "                               FROM dsdemo.sfcb_t,dsdemo.sffb_t ",
               "                              WHERE sfcbent = sfaaent AND sfcbdocno = sfaadocno AND (sfcb009 = 'END' AND sfcb010 = '0' OR sfcb009 = ' ' OR sfcb009 IS NULL)  ",
               "                                AND sffb005 = sfcbdocno AND sffb006 = sfcb001 AND sffb007 = sfcb003 AND sffb008 = sfcb004 AND sffb009 =sfcb011 AND sffbstus = 'Y' ",
               "                                AND sffbdocdt BETWEEN ? AND ? GROUP BY sfcb005),0) ",
               "  UNION ",
               " SELECT sfaa010,sfaadocno,sfaasite,sfec009 ",
               "   FROM sfaa_t,ooef_t,ooac_t, ",
               "      (SELECT ooaa002 FROM ooaa_t WHERE ooaaent = ",g_enterprise," AND ooaa001 = 'E-COM-0008') ooaa002 , ",
               "      (SELECT sfec001,sfecent,SUM(sfec009) sfec009  ",
               "         FROM sfec_t  ",
               "         LEFT OUTER JOIN sfea_t ON sfecdocno = sfeadocno AND sfecent = sfeaent  ",
               "        WHERE sfeastus = 'S' AND sfec004 NOT IN ('3','4','5') AND sfea001 BETWEEN ? AND ?  ",
               "        GROUP BY sfec001,sfecent)  ",
               "  WHERE sfaaent = ",g_enterprise," AND sfaaent = ooefent AND sfaasite= ooef001 AND ooef017 = '",tm.xccccomp,"' AND ooacent = sfaaent AND ooac001 = ooef004 AND ooac003 = 'D-MFG-0044' ",
               "    AND ooac004 = 'Y' AND sfaa003 <> '3' AND sfec001 = sfaadocno AND sfecent = sfaaent AND sfaa061 = 'Y' ",
               "    AND sfec009 >  NVL((SELECT (CASE WHEN sfcb005 = '2' THEN SUM(sffb017) ELSE MIN(sffb017) END)  ",
               "                          FROM dsdemo.sfcb_t,dsdemo.sffb_t ",
               "                         WHERE sfcbent = sfaaent AND sfcbdocno = sfaadocno AND (sfcb009 = 'END' AND sfcb010 = '0' OR sfcb009 = ' ' OR sfcb009 IS NULL)  ",
               "                           AND sffb005 = sfcbdocno AND sffb006 = sfcb001 AND sffb007 = sfcb003 AND sffb008 = sfcb004 AND sffb009 =sfcb011 AND sffbstus = 'Y' ",
               "                           AND sffbdocdt BETWEEN ? AND ?  ",
               "                         GROUP BY sfcb005),0)) ",
               "  ORDER BY sfaadocno,sfaa010 "
   PREPARE axcq300_pr40 FROM g_sql
   DECLARE axcq300_cs40 CURSOR FOR axcq300_pr40
   FOREACH axcq300_cs40 USING g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs40" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   
   #axc-00981:工单成本中心空白，若人工制费依工单成本中心分摊，需检查！
   LET g_sql = " SELECT DISTINCT sfaa010,'', ",
               "          (SELECT imaal003 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
               "          (SELECT imaal004 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
               "          'asft300',",
               "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               "          sfaadocno, ",
               "          (SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00981' AND gzze002 = '",g_lang,"') info",               #報錯訊息
               "   FROM sfaa_t,ooef_t ",
               "  WHERE sfaaent = ",g_enterprise," ",
               "    AND sfaastus <> 'M' ",
               "    AND sfaadocdt < ? ",
               "    AND sfaaent = ooefent ",
               "    AND sfaasite= ooef001 ",
               "    AND ooef017 = '",tm.xccccomp,"' ",
               "    AND sfaa068 IS NULL ",
               "  ORDER BY sfaadocno,sfaa010 "
               
   PREPARE axcq300_pr41 FROM g_sql
   DECLARE axcq300_cs41 CURSOR FOR axcq300_pr41
   FOREACH axcq300_cs41 USING g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs41" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   #axc-00982:报工单成本中心空白，若人工制费依报工单成本中心分摊，需检查！
   LET g_sql = " SELECT DISTINCT '','','','', ",
               "          'asft330',",
               "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft330' AND gzzal002='"||g_dlang||"') gzzal003," ,
               "          sffbdocno, ",
               "          (SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00982' AND gzze002 = '",g_lang,"') info" ,  
               "   FROM sffb_t,ooef_t,sfaa_t ",
               "  WHERE sffbent = ",g_enterprise," ",
               "    AND sffbent = ooefent ",
               "    AND sffbsite= ooef001 ",
               "    AND ooef017 = '",tm.xccccomp,"' ",
               "    AND sfaadocno = sffb005 ",
               "    AND sfaaent = sffbent ",
               "    AND sfaastus <> 'M' ",
               "    AND sfaadocdt < ? ",
               "    AND sffb030 IS NULL ",
               "  ORDER BY sffbdocno "
               
   PREPARE axcq300_pr42 FROM g_sql
   DECLARE axcq300_cs42 CURSOR FOR axcq300_pr42
   FOREACH axcq300_cs42 USING g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs42" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      IF NOT cl_null(g_xccc_d[l_ac].docno) THEN
         CALL axcq300_aooi200_get_slip(g_xccc_d[l_ac].docno) RETURNING g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc 
      END IF
      IF g_xccc_d[l_ac].inaj035 = 'MULTI' THEN
         LET g_xccc_d[l_ac].inaj035 = 'asft335'
         SELECT gzzal003 INTO g_xccc_d[l_ac].inaj035_desc 
           FROM gzzal_t 
          WHERE gzzal001 = g_xccc_d[l_ac].inaj035 AND gzzal002 = g_dlang
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   #210105-00032#1 add -E
   
   #axc-00983:截止当前期别工单已完工入库数量%1，料未发足，请检查！（一般工单）
   #210105-00032#1 mark -S-
   #LET g_sql = "   SELECT DISTINCT sfba005,'', ",
   #            "          (SELECT imaal003 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfba005 AND imaal002='"||g_dlang||"') imaal003,",
   #            "          (SELECT imaal004 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfba005 AND imaal002='"||g_dlang||"') imaal004,",
   #            #"          '','',sfaadocno, ", #201210-00001#1 mark
   #            #201210-00001#1 add -S
   #            "          'asft300',",
   #            "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
   #            "          sfaadocno, ",
   #            #201210-00001#1 add -E
   #            "          REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00983' AND gzze002 = '",g_lang,"'),'%1',cast(sfec009 as varchar(10))) info",               #報錯訊息,
   #            "     FROM ",
   #            "        (SELECT sfba005,sfaadocno,sfbaseq,sfaasite,NVL(sfec009,0) sfec009 ",
   #            "           FROM sfaa_t  ",
   #            "           LEFT OUTER JOIN sfba_t ON sfbaent = sfaaent AND sfbadocno = sfaadocno  ",
   #            "           LEFT OUTER JOIN (SELECT sfdcent,sfdc001,sfdc002,sfdc003,NVL(SUM(-1*sfdc008*sfdc017),0) sfdc008  ",
   #            "                              FROM sfdc_t  ",
   #            "                              LEFT OUTER JOIN sfda_t ON sfdcent = sfdaent AND sfdcdocno = sfdadocno  ",
   #            "                             WHERE sfdaent = ",g_enterprise," AND sfdastus = 'S' AND sfda001 BETWEEN ? AND ?  ",
   #            "                             GROUP BY sfdcent,sfdc001,sfdc002,sfdc003) T3 ",
   #            "                        ON sfdcent = sfbaent AND sfdc001 = sfbadocno AND sfdc002 = sfbaseq AND sfdc003 = sfbaseq1 ",
   #            "           LEFT OUTER JOIN (SELECT sfjcent,sfjc001,sfjc002,sfjc015,NVL(SUM(sfjc006),0) sfjc006  ",
   #            "                              FROM sfjc_t LEFT OUTER JOIN sfja_t ON sfjcent = sfjaent AND sfjcdocno = sfjadocno  ",
   #            "                             WHERE sfjaent = ",g_enterprise," AND sfjastus = 'S' AND sfja003 BETWEEN ? AND ?  ",
   #            "                             GROUP BY sfjcent,sfjc001,sfjc002,sfjc015) T4 ",
   #            "                        ON sfjcent = sfbaent AND sfjc001 = sfbadocno AND sfjc002 = sfbaseq AND sfjc015 = sfbaseq1 ",
   #            "        ,imae_t ",
   #            "        ,(SELECT sfec001,sfecent,SUM(sfec009) sfec009  ",
   #            "           FROM sfec_t  ",
   #            "           LEFT OUTER JOIN sfea_t ON sfecdocno = sfeadocno AND sfecent = sfeaent  ",
   #            "          WHERE sfeaent = ",g_enterprise," AND sfeastus = 'S' AND sfec004 <> '3' AND sfea001 BETWEEN ? AND ? AND sfec004 NOT IN ('3','4','5')  ",
   #            "          GROUP BY sfec001,sfecent) T1 ",
   #            "          WHERE sfaaent = sfbaent AND sfaadocno = sfbadocno AND sfaaent = ",g_enterprise," AND imaeent = sfaaent AND imaesite = sfaasite AND imae001 = sfaa010 AND sfec001 = sfaadocno AND sfecent = sfaaent AND sfaa003 <> '3' ",
   #            "            AND EXISTS(SELECT 1 FROM ooef_t WHERE ooefent = sfbaent AND ooef001 = sfbasite AND ooefstus = 'Y' AND ooef017 = '",tm.xccccomp,"')  ",
   #            "          GROUP BY sfaadocno,sfbaseq,sfec009,imae020,sfaasite,sfba005 ",
#  #             "         HAVING SUM((NVL(sfdc008,0)-NVL(sfjc006,0))*(DECODE(NVL(sfba011,0),0,1,NVL(sfba011,0))/DECODE(NVL(sfba010,0),0,1,NVL(sfba010,0))))*(1+imae020/100) < NVL(sfec009,0)) T2 "  #201218-00004#1 mark
   #            "         HAVING SUM((NVL(sfdc008,0)-NVL(sfjc006,0))*DECODE(NVL(sfba011,0),0,1,NVL(sfba011,0))/DECODE(NVL(sfba010,0),0,1,NVL(sfba010,0)))*(1+imae020/100) < NVL(sfec009,0)) T2 "     #201218-00004#1 add
   #210105-00032#1 mark -E-
   #210105-00032#1 add -S-
   LET g_sql = "   SELECT DISTINCT sfba005,'', ",
               "          (SELECT imaal003 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfba005 AND imaal002='"||g_dlang||"') imaal003,",
               "          (SELECT imaal004 FROM imaal_t WHERE imaalent=",g_enterprise," AND imaal001=sfba005 AND imaal002='"||g_dlang||"') imaal004,",
               "          'asft300',",
               "          (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'asft300' AND gzzal002='"||g_dlang||"') gzzal003,",
               "          sfaadocno, ",

               "          REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-00983' AND gzze002 = '",g_lang,"'),'%1',cast(sfec009 as varchar(10))) info",               #報錯訊息,
               "     FROM ",
               "        (SELECT T6.sfba005,sfaadocno,T6.sfbaseq,sfaasite,NVL(sfec009,0) sfec009 ",
               "           FROM sfaa_t  ",
               "           LEFT OUTER JOIN sfba_t T6 ON T6.sfbaent = sfaaent AND T6.sfbadocno = sfaadocno  ",
               "            AND NOT (T6.sfbaseq1 = 0 AND T6.sfba010 = 0) ",
               "           LEFT OUTER JOIN (SELECT sfbaent,sfbadocno,sfbaseq,sfba010,sfba011 FROM sfba_t WHERE sfbaent = ",g_enterprise," AND sfbaseq1 = 0 ) TX ",
               "            ON TX.sfbaent = T6.sfbaent AND TX.sfbadocno = T6.sfbadocno AND TX.sfbaseq = T6.sfbaseq ",              
               "           LEFT OUTER JOIN (SELECT sfdcent,sfdc001,sfdc002,sfdc003,NVL(SUM(-1*sfdc008*sfdc017),0) sfdc008  ",
               "                              FROM sfdc_t  ",
               "                              LEFT OUTER JOIN sfda_t ON sfdcent = sfdaent AND sfdcdocno = sfdadocno  ",
              #"                             WHERE sfdaent = ",g_enterprise," AND sfdastus = 'S' AND sfda001 BETWEEN ? AND ?  ",  #210416-00009#1 mark
               "                             WHERE sfdaent = ",g_enterprise," AND sfdastus = 'S' AND sfda001 <= ? ",   #210416-00009#1 add
               "                             GROUP BY sfdcent,sfdc001,sfdc002,sfdc003) T3 ",
               "                        ON sfdcent = T6.sfbaent AND sfdc001 = T6.sfbadocno AND sfdc002 = T6.sfbaseq AND sfdc003 = T6.sfbaseq1 ",
               "           LEFT OUTER JOIN (SELECT sfjcent,sfjc001,sfjc002,sfjc015,NVL(SUM(sfjc006),0) sfjc006  ",
               "                              FROM sfjc_t LEFT OUTER JOIN sfja_t ON sfjcent = sfjaent AND sfjcdocno = sfjadocno  ",
               "                             WHERE sfjaent = ",g_enterprise," AND sfjastus = 'S' AND sfja003 BETWEEN ? AND ?  ",
               "                             GROUP BY sfjcent,sfjc001,sfjc002,sfjc015) T4 ",
               "                        ON sfjcent = T6.sfbaent AND sfjc001 = T6.sfbadocno AND sfjc002 = T6.sfbaseq AND sfjc015 = T6.sfbaseq1 ",
               "        ,imae_t ",
               "        ,(SELECT sfec001,sfecent,SUM(sfec009) sfec009  ",
               "           FROM sfec_t  ",
               "           LEFT OUTER JOIN sfea_t ON sfecdocno = sfeadocno AND sfecent = sfeaent  ",
               "          WHERE sfeaent = ",g_enterprise," AND sfeastus = 'S' AND sfec004 <> '3' AND sfea001 BETWEEN ? AND ? AND sfec004 NOT IN ('3','4','5')  ",
               "          GROUP BY sfec001,sfecent) T1 ",
               "          WHERE sfaaent = T6.sfbaent AND sfaadocno = T6.sfbadocno AND sfaaent = ",g_enterprise," AND imaeent = sfaaent AND imaesite = sfaasite AND imae001 = sfaa010 AND sfec001 = sfaadocno AND sfecent = sfaaent AND sfaa003 <> '3' ",
               "            AND EXISTS(SELECT 1 FROM ooef_t WHERE ooefent = T6.sfbaent AND ooef001 = T6.sfbasite AND ooefstus = 'Y' AND ooef017 = '",tm.xccccomp,"')  ",
               "          GROUP BY sfaadocno,T6.sfbaseq,sfec009,imae020,sfaasite,T6.sfba005 ",
               "         HAVING SUM((NVL(sfdc008,0)-NVL(sfjc006,0))*DECODE(NVL(TX.sfba011,0)*T6.sfba022,0,1,NVL(TX.sfba011,0)*T6.sfba022)/DECODE(NVL(TX.sfba010,0),0,1,NVL(TX.sfba010,0)))*(1+imae020/100) < NVL(sfec009,0)) T2 "    
   #210105-00032#1 add -E-
   PREPARE axcq300_pr37 FROM g_sql
   DECLARE axcq300_cs37 CURSOR FOR axcq300_pr37
  #FOREACH axcq300_cs37 USING g_bdate,g_edate,g_bdate,g_edate,g_bdate,g_edate INTO g_xccc_d[l_ac].*   #210416-00009#1 mark
   FOREACH axcq300_cs37 USING g_edate,g_bdate,g_edate,g_bdate,g_edate INTO g_xccc_d[l_ac].*   #210416-00009#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs37" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   #201208-00015#1 add -E
   
   #200407-00013#1---add---start---
   #費用料號計入存貨科目
   LET g_sql = "SELECT DISTINCT apcb004,'',",                                                                                                      #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",     #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",     #規格
               "       (CASE WHEN apca001 IN ('01','02') THEN 'aapt320' ELSE 'aapt300' END) inaj035,",                                             #作業編號
               "       (CASE WHEN apca001 IN ('01','02') THEN ",                                                                                              
               "            (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt320' AND gzzal002 = '",g_dlang,"') ",                    
               "       ELSE (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002 = '",g_dlang,"') ",                    
               "       END) gzzal003,apcadocno,",                                                                                                  #作業編號說明/單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01007' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",            #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t ",	
               "  LEFT JOIN imaa_t ON imaaent = apcbent AND imaa001 = apcb004 ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	   #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                     #暫估單(aapt320)
               "   AND apcastus != 'X' ",		
               "   AND imaa004 = 'E' ",		                                                         #料件類別："E：費用料號"
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",		
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目在agli161設為存貨科目
               "   AND (apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 = '1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 = '*')) ",	 
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
              #"    OR (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",  #200407-00013#4 mark
               "   AND (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",  #200407-00013#4 add
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr22 FROM g_sql
   DECLARE axcq300_cs22 CURSOR FOR axcq300_pr22
   FOREACH axcq300_cs22 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs22" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   
   #入庫非成本倉計入存貨科目
   LET g_sql = "SELECT DISTINCT apcb004,inaj006,",                                                                                                          #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",              #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",              #規格
               "       (CASE WHEN apca001 IN ('01','02') THEN 'aapt320' ELSE 'aapt300' END) inaj035,",                                                      #作業編號
               "       (CASE WHEN apca001 IN ('01','02') THEN ",
               "            (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt320' AND gzzal002 = '",g_dlang,"') ",
               "       ELSE (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002 = '",g_dlang,"') ",   
               "       END) gzzal003,apcadocno,",                                                                                                           #作業編號說明/單號
               "       REPLACE(REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01008' AND gzze002 = 'zh_TW'),'%1',apcbseq),'%2',inaj008) info",    #報錯訊息
               #201015-00064#1 add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,inaj_t,inaa_t ",	
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = apcbent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'N' ",         #inaa010非成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目在agli161設為存貨科目
               "   AND (apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 = '*')) ",	 
               #會計科目在agli021財務比率分析類別設為"5：存貨"
              #"    OR (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",  #200407-00013#4 mark
               "   AND (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",  #200407-00013#4 add 
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr23 FROM g_sql
   DECLARE axcq300_cs23 CURSOR FOR axcq300_pr23
   FOREACH axcq300_cs23 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs23" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH          
   
   #雜項應付單計入存貨或委外科目，應付單非入庫倉退項使用存貨或委外科目
   LET g_sql = "SELECT DISTINCT apcb004,'',",                                                                                                       #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       (CASE WHEN apca001 = '19' THEN 'aapt301' ELSE 'aapt300' END) inaj035,",                                                      #作業編號
               "       (CASE WHEN apca001 = '19' THEN ",                                                                                      
               "            (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt301' AND gzzal002 = '",g_dlang,"') ",                            
               "       ELSE (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002 = '",g_dlang,"') ",                            
               "       END) gzzal003,apcadocno,",                                                                                                    #作業編號說明/單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-01009' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",               #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t ",	                                                                                                           
               "  LEFT JOIN imaa_t ON imaaent = apcbent AND imaa001 = apcb004 ",		                                                                    
               " WHERE apcaent = ",g_enterprise,                                                                                                     
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",                                                                                
               "   AND apcb001 IN ('19','29') AND apcb023 = 'N' AND apca001 IN ('13','17','19') ",	                                                  #應付單(aapt300)/雜項應付單(aapt301)	
               "   AND apcastus != 'X' ",		
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",		
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目在agli161設為存貨科目
              #"   AND ((apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",   #200407-00013#4 mark
               "   AND (((apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",  #200407-00013#4 add 
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
              #"    OR   (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",  #200407-00013#4 mark
               "   AND   (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",  #200407-00013#4 add 
               #會計科目在agli161設為委外加工費用科目
              #"    OR  (apcb021 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	  #200407-00013#4 mark
               "    OR  (apcb021 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) )",	  #200407-00013#4 add
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr24 FROM g_sql
   DECLARE axcq300_cs24 CURSOR FOR axcq300_pr24
   FOREACH axcq300_cs24 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs24" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   
   #委外入庫單計入非委外科目
   LET g_sql = "SELECT DISTINCT apcb004,inaj006,",                                                                                                  #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       (CASE WHEN apca001 IN ('01','02') THEN 'aapt320' ELSE 'aapt300' END) inaj035,",                                              #作業編號
               "       (CASE WHEN apca001 IN ('01','02') THEN ",                                                                                                     
               "            (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt320' AND gzzal002 = '",g_dlang,"') ",                               
               "       ELSE (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002 = '",g_dlang,"') ",                               
               "       END) gzzal003,apcadocno,",                                                                                                   #作業編號說明/單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01010' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",             #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,imaa_t,pmds_t,pmdt_t,inaj_t,inaa_t ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND imaaent = apcbent AND imaa001 = apcb004 ",
               "   AND apcbent = pmdsent AND pmdsdocno = apcb002 ",
               "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
               "   AND pmdsdocno = pmdtdocno AND pmdssite = pmdtsite ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y' ",         #inaa010成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		                                                                       
               "   AND imaa004 != 'E' ",		                                                                       #料件類別不為"E：費用料號"
               "   AND ((pmds000 IN ('12','20') AND pmdt005 != '8') OR  pmds000 = '14') ",                          #12：委外入庫/14：委外倉退/20：委外收貨入庫
               "   AND pmdsstus IN ('Y','S') ",
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目不存在agli161的委外加工費用科目
               "   AND apcb021 NOT IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 = '1' AND glccld = apcald ",
               "                          AND (glcc016 = apcb004 OR glcc016 = '*') AND (glcc005 IS NOT NULL OR glcc005 != ''))",
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr25 FROM g_sql
   DECLARE axcq300_cs25 CURSOR FOR axcq300_pr25
   FOREACH axcq300_cs25 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs25" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   
   #庫存料號且入庫成本倉，但計入非存貨科目
   LET g_sql = "SELECT DISTINCT apcb004,inaj006,",                                                                                                  #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       (CASE WHEN apca001 IN ('01','02') THEN 'aapt320' ELSE 'aapt300' END) inaj035,",                                              #作業編號
               "       (CASE WHEN apca001 IN ('01','02') THEN ",                                                                                                     
               "            (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt320' AND gzzal002 = '",g_dlang,"') ",                               
               "       ELSE (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002 = '",g_dlang,"') ",                               
               "       END) gzzal003,apcadocno,",                                                                                                   #作業編號說明/單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01011' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",             #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,imaa_t,pmds_t,pmdt_t,inaj_t,inaa_t ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND imaaent = apcbent AND imaa001 = apcb004 ",
               "   AND apcbent = pmdsent AND pmdsdocno = apcb002 ",
               "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
               "   AND pmdsdocno = pmdtdocno AND pmdssite = pmdtsite ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y' ",         #inaa010成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		                                                                       
               "   AND imaa004 != 'E' ",		                                                                       #料件類別不為"E：費用料號"
               "   AND pmds000 NOT IN ('12','14','20')  ",                                                          #12：委外入庫/14：委外倉退/20：委外收貨入庫
               "   AND pmdsstus IN ('Y','S') ",
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目在agli161設為存貨科目
               "   AND ((apcb021 NOT IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	               
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
               "   AND (apcb021 NOT IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr26 FROM g_sql
   DECLARE axcq300_cs26 CURSOR FOR axcq300_pr26
   FOREACH axcq300_cs26 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs26" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH
   
   #應付與暫估價差歸入存貨科目，但無產生成本分攤單
   LET g_sql = "SELECT '','','','',apcf001, ",                                                                                 #料號/產品特徵/品名/規格/作業編號                                                                                       
               "       (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = apcf001 AND gzzal002 = '",g_dlang,"') gzzal003,",        #作業編號說明                 
               "       apcfdocno,",                                                                                            #單號
               "       (SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01012' AND gzze002 = '",g_lang,"') info",              #報錯訊息
               "  FROM apcf_t,apca_t ",                                                                                         
               " WHERE apcfent = ",g_enterprise,                                                                                
               "   AND apcfld = '",tm.xcccld,"'",                                                                               
               "   AND apcaent = apcfent AND apcald = apcfld AND apcadocno = apcfdocno ",                                       
               "   AND apcadocdt BETWEEN ? AND ? ",                                                                             
               "   AND apcf002='D1' AND apcf008='DIFF' ",                                                                      #DIFF為價差
               #會計科目在agli021財務比率分析類別設為"5：存貨"                  
               "   AND apcf021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')", 
               #不存在aapt430費用分攤維護作業
               "   AND apcfdocno NOT IN (SELECT apce003 FROM apce_t,apda_t WHERE apceent = apcfent AND apce003 = apcfdocno ", 
               "                           AND apceld = apcfld AND apcedocno = apdadocno AND apceent = apdaent AND apdastus != 'X')",
               " ORDER BY apcfdocno"      
   PREPARE axcq300_pr27 FROM g_sql
   DECLARE axcq300_cs27 CURSOR FOR axcq300_pr27
   FOREACH axcq300_cs27 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs27" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH            
   
   #單別設定參數
   CALL cl_get_para(g_enterprise,'','E-COM-0001') RETURNING g_ecom0001   #單別長度
   CALL cl_get_para(g_enterprise,'','E-COM-0003') RETURNING g_ecom0003   #營運據點代表號長度
   CALL cl_get_para(g_enterprise,'','E-COM-0002') RETURNING g_ecom0002   #營運據點與單別間以-分隔
   CALL cl_get_para(g_enterprise,'','E-COM-0008') RETURNING g_ecom0008   #單據編號格式
   CASE g_ecom0008
      WHEN '1'
        CASE g_ecom0002
           WHEN 'Y'
             LET g_n1 = g_ecom0003 + 2
             LET g_n2 = g_ecom0001
           WHEN 'N'
             LET g_n1 = g_ecom0003 + 1
             LET g_n2 = g_ecom0001
           OTHERWISE
             LET g_n1 = g_ecom0003 + 2
             LET g_n2 = g_ecom0001
        END CASE   
      WHEN '2'
        LET g_n1 = 1 
        LET g_n2 = g_ecom0001
      OTHERWISE
        LET g_n1 = g_ecom0003 + 2
        LET g_n2 = g_ecom0001
   END CASE
   #單別分錄生成否設置為Y且暫估差異費用分攤單來源科目為存貨科目需報錯
   LET g_sql = "SELECT '','','','','aapt430',",                                                                                                        #料號/產品特徵/品名/規格/作業編號 
               "       (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt430' AND gzzal002 = '",g_dlang,"') gzzal003,",                              #作業編號說明                 
               "       apdadocno,",                                                                                                                    #單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01013' AND gzze002 = '",g_lang,"'),'%1',apceseq) info",                #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apda_t,apce_t ",                                                                                                                
               " WHERE apceent = ",g_enterprise,                                                                                                       
               "   AND apdald = '",tm.xcccld,"'",
               "   AND apdald = apceld AND apdadocno = apcedocno AND apdaent = apceent",                                                               
               "   AND apce002='05' AND apdastus != 'X'",                                                                                              #帳款性質："05：暫估差異"
               "   AND apdadocdt BETWEEN ? AND ? ",
               #來源會計科目若存在agli021存貨科目需報錯
               "   AND apce016 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')",     
               #aapt430單別參數(aooi200)"D-FIN-0030"設為"Y"
               "   AND SUBSTR(apcedocno,",g_n1,",",g_n2,") IN (SELECT ooba002 FROM ooba_t,oobx_t ",                                                    #aapt430單別
               "                                                WHERE oobaent = apceent AND ooba001 = '",g_glaa024,"'",
               "                                                  AND oobxent = oobaent AND oobx001 = ooba002 ",
               "                                                  AND oobx003 = 'aapt430' AND oobx004 = 'aapt430'",                                    #單據性質&作業編號
               "                                                  AND ooba002 IN (SELECT ooac002 FROM ooac_t ",
               "                                                                   WHERE ooacent = apceent AND ooac003 ='D-FIN-0030'",                 #"D-FIN-0030"：產生交易帳務分錄否
               "                                                                     AND ooac001 = ooba001 AND ooac004 = 'Y'))",
               " ORDER BY apdadocno"
   PREPARE axcq300_pr28 FROM g_sql
   DECLARE axcq300_cs28 CURSOR FOR axcq300_pr28
   FOREACH axcq300_cs28 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs28" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH      
   
   #單別分錄生成否設置為Y且暫估差異費用分攤單目的科目不為存貨科目需報錯
   LET g_sql = "SELECT '','','','','aapt430',",                                                                                                        #料號/產品特徵/品名/規格/作業編號 
               "       (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt430' AND gzzal002 = '",g_dlang,"') gzzal003,",                              #作業編號說明                 
               "       apdadocno,",                                                                                                                    #單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01014' AND gzze002 = '",g_lang,"'),'%1',apdcseq) info",                #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apda_t,apce_t,apdc_t ",                                                                                                                
               " WHERE apceent = ",g_enterprise,                                                                                                               
               "   AND apdald = '",tm.xcccld,"'",                                                                                           
               "   AND apdald = apceld AND apdadocno = apcedocno AND apdaent = apceent",                                                              
               "   AND apdald = apdcld AND apdadocno = apdcdocno AND apdaent = apdcent",                                                                
               "   AND apce002 = '05' AND apdastus != 'X'",                                                                                            #帳款性質："05：暫估差異"
               "   AND apdadocdt BETWEEN ? AND ? ",
               #目的會計科目若不存在agli021存貨科目需報錯
               "   AND apdc007 NOT IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')",     
               #aapt430單別參數(aooi200)"D-FIN-0030"設為"Y"
               "   AND SUBSTR(apcedocno,",g_n1,",",g_n2,") IN (SELECT ooba002 FROM ooba_t,oobx_t ",                                                    #aapt430單別
               "                                                WHERE oobaent = apceent AND ooba001 = '",g_glaa024,"'",
               "                                                  AND oobxent = oobaent AND oobx001 = ooba002 ",
               "                                                  AND oobx003 = 'aapt430' AND oobx004 = 'aapt430'",                                    #單據性質&作業編號
               "                                                  AND ooba002 IN (SELECT ooac002 FROM ooac_t ",
               "                                                                   WHERE ooacent = apceent AND ooac003 ='D-FIN-0030'",                 #"D-FIN-0030"：產生交易帳務分錄否
               "                                                                     AND ooac001 = ooba001 AND ooac004 = 'Y'))",
               " ORDER BY apdadocno"
   PREPARE axcq300_pr29 FROM g_sql
   DECLARE axcq300_cs29 CURSOR FOR axcq300_pr29
   FOREACH axcq300_cs29 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs29" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH               
      
   IF g_glaa121 = 'Y' THEN
      #分錄底稿存貨科目發生額與單身稅前金額不符
      #先取出符合的應付單/暫估單/待抵單(aapt300/aapt320/aapt340)
      LET g_sql = "SELECT apcadocno,prog FROM (",
                  " SELECT DISTINCT apcadocno apcadocno,apca001 prog",
                 #"   FROM apca_t,inaj_t,inaa_t,pmds_t,pmdt_t,apcb_t ",  #200407-00013#4 mark
                  "   FROM apca_t,pmds_t,pmdt_t,apcb_t ",                #200407-00013#4 add
                  "   LEFT JOIN imaa_t ON imaaent = apcbent AND imaa001 = apcb004 AND imaa004 != 'E'",      
                  "  WHERE apcbent = ",g_enterprise," ",
                  "    AND apcb001 IN ('11','21')",                                                                                                   
                  "    AND apcald = '",tm.xcccld,"'",
                  "    AND apcaent = apcbent AND apcadocno = apcbdocno AND apcastus !='X'",
                  "    AND pmdsent = apcbent AND pmdsdocno = apcb002 ",
                  "    AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003 ",
                  "    AND (pmds000 IN ('3','6','7','14','4') OR (pmds000 IN ('12','20') AND pmdt005 = '8')) ",      #3：收貨入庫單/6：入庫單/7：倉退單/14：委外倉退單/12：委外入庫單/20：委外收貨入庫單 #210220-00037#1 add 4:无采购收货入库
                  "    AND apcadocdt BETWEEN ? AND ?",
                  "    AND ((apca001 IN ('13','17','22') AND apcb023 = 'N') OR apca001 IN ('01','02'))",
                 #200407-00013#4 -s mark
                 #"    AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
                 #"    AND inaaent = apcbent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y'",
                 #200407-00013#4 -e mark
                 #200407-00013#4 -s add
                  "    AND EXISTS (SELECT 1 FROM inaj_t,inaa_t",
                  "                 WHERE inajent = inaaent AND inaj008 = inaa001 AND inajsite = inaasite AND inaa010 = 'Y'",
                  "                   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004)",
                 #200407-00013#4 -e add
                  
                  #有分錄底稿且分錄底稿科目裡有"存貨"科目
                  "    AND apcbdocno IN (SELECT DISTINCT glgbdocno FROM glgb_t WHERE glgbent = apcbent AND glgbdocno = apcbdocno AND glgbld = apcbld",
                  "                        AND glgb002 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05'))",
                  "  UNION ",
                  #單據aapt430
                  " SELECT DISTINCT apdadocno apcadocno,'aapt430' prog",
                 #"   FROM apda_t,inaj_t,inaa_t,pmds_t,pmdt_t,apdc_t",  #200407-00013#4 mark
                  "   FROM apda_t,pmds_t,pmdt_t,apdc_t",                #200407-00013#4 add
                  "   LEFT JOIN imaa_t ON imaaent = apdcent AND imaa001 = apdc004 AND imaa004 !='E'",
                  "  WHERE apdaent = ",g_enterprise," ",
                  "    AND apdaent = apdcent AND apdadocno=apdcdocno AND apdastus !='X'",                                                                                          
                  "    AND apdald = '",tm.xcccld,"'",
                  "    AND pmdsent = apdcent AND pmdsdocno = apdc002 ",
                  "    AND pmdtent = apdcent AND pmdtdocno = apdc002 AND pmdtseq = apdc003 ",
                  "    AND (pmds000 IN ('3','6','7','14','4') OR (pmds000 IN ('12','20') AND pmdt005 = '8')) ",      #3：收貨入庫單/6：入庫單/7：倉退單/14：委外倉退單/12：委外入庫單/20：委外收貨入庫單   #210220-00037#1 add 4:无采购收货入库
                  "    AND apdadocdt BETWEEN ? AND ?",                  
                 #200407-00013#4 -s mark
                 #"    AND inajent = apdcent AND inaj001 = apdc002 AND inaj002 = apdc003 AND inaj005 = apdc004 ",
                 #"    AND inaaent = apcbent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y'",
                 #200407-00013#4 -e mark
                 #200407-00013#4 -s add
                  "    AND EXISTS (SELECT 1 FROM inaj_t,inaa_t",
                  "                 WHERE inajent = inaaent AND inaj008 = inaa001 AND inajsite = inaasite AND inaa010 = 'Y'",
                  "                   AND inajent = apdcent AND inaj001 = apdc002 AND inaj002 = apdc003 AND inaj005 = apdc004)",
                 #200407-00013#4 -e add
                  
                  #有分錄底稿且分錄底稿科目裡有"存貨"科目
                  "    AND apdadocno IN (SELECT DISTINCT glgbdocno FROM glgb_t WHERE glgbent = apdaent AND glgbdocno = apdadocno AND glgbld = apdald",
                  "                         AND glgb002 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) ",
                  " ) t51", #201015-00064#1 添加别名
                  " ORDER BY apcadocno"         
      PREPARE axcq300_pr30 FROM g_sql
      DECLARE axcq300_cs30 CURSOR FOR axcq300_pr30
      #取應付單/暫估單/待抵單本幣未稅金額

      LET g_sql = "SELECT ABS(SUM(apcb113 * apcb022))",
                  "  FROM apcb_t ",
                  "  LEFT OUTER JOIN imaa_t ON imaaent = ",g_enterprise," AND imaa001 = apcb004 ",   #210220-00046#1 add
                  " WHERE apcbent = ",g_enterprise,
                  "   AND apcbld = '",tm.xcccld,"'",
                  "   AND apcbdocno = ?",
                  "   AND imaa004 != 'E' ",         #210220-00046#1 add
                  "   AND apcb001 IN ('11','21')"
     #200407-00013#4 -s add
      LET g_sql = g_sql,
                  "   AND EXISTS (SELECT 1 FROM pmds_t,pmdt_t",
                  " WHERE pmdsent= pmdtent AND pmdsdocno=pmdtdocno",
                  "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
                  "   AND (pmds000 IN ('3','6','7','14') OR (pmds000 IN ('12','20') AND pmdt005 = '8')))"
     #200407-00013#4 -e add
      #201127-00017#1-(S) add
      #S-FIN-3011 暫估迴轉否
      CALL cl_get_para(g_enterprise,tm.xccccomp,'S-FIN-3011') RETURNING l_sfin3011
      IF l_sfin3011 <> 'Y' THEN #不迴轉
         LET g_sql = g_sql, " AND apcb023 <> 'Y' "
      END IF
      #201127-00017#1-(E) add
      PREPARE axcq300_sum_apcb113 FROM g_sql
      #取分攤單金額
      LET g_sql = "SELECT ABS(SUM(apdc213 - apdc113))",
                  "  FROM apdc_t ",
                  " WHERE apdcent = ",g_enterprise,
                  "   AND apdcld = '",tm.xcccld,"'",
                  "   AND apdcdocno = ?"
     #200407-00013#4 -s add
      LET g_sql = g_sql,
                  "   AND EXISTS (SELECT 1 FROM pmds_t,pmdt_t",
                  " WHERE pmdsent= pmdtent AND pmdsdocno=pmdtdocno",
                  "   AND pmdtent = apdcent AND pmdtdocno = apdc002 AND pmdtseq = apdc003",
                  "   AND (pmds000 IN ('3','6','7','14') OR (pmds000 IN ('12','20') AND pmdt005 = '8')))"
     #200407-00013#4 -e add
      PREPARE axcq300_sum_apdc213 FROM g_sql
      #取分錄存貨科目金額
      LET g_sql = "SELECT ABS(SUM(glgb003-glgb004))",
                  "  FROM glgb_t",
                  " WHERE glgbent = ",g_enterprise,
                  "   AND glgbld = '",tm.xcccld,"'",
                  "   AND glgbdocno = ?",
                  "   AND glgb002 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')"
      PREPARE axcq300_sum_glgb003 FROM g_sql              
      #取得作業代號說明
      SELECT gzzal003 INTO l_prog_aapt300 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002 = g_dlang
      SELECT gzzal003 INTO l_prog_aapt320 FROM gzzal_t WHERE gzzal001 = 'aapt320' AND gzzal002 = g_dlang
      SELECT gzzal003 INTO l_prog_aapt340 FROM gzzal_t WHERE gzzal001 = 'aapt340' AND gzzal002 = g_dlang
      SELECT gzzal003 INTO l_prog_aapt430 FROM gzzal_t WHERE gzzal001 = 'aapt430' AND gzzal002 = g_dlang
      #錯誤訊息
      LET l_error = ''
      SELECT gzze003 INTO l_error FROM gzze_t WHERE gzze001 = 'axc-01015' AND gzze002 = g_dlang
      #寫入temp table
      LET g_sql = " INSERT INTO axcq300_temp (xccccomp,xccccomp_desc,xcccld,xcccld_desc,xccc004,",
                  "                           xccc005,xccc001,xccc001_desc,xccc003,xccc003_desc,",                   
                  "                           xccc006,xccc007,imaal003,imaal004,lbl_docno,lbl_err)",
                  "                   VALUES ('",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld, "','",tm.xcccld_desc, "',",
                  "                           '",tm.xccc004, "','",tm.xccc005,      "','",tm.xccc001,"','",tm.xccc001_desc,"',",
                  "                           '",tm.xccc003, "','",tm.xccc003_desc,"',",    
                  "                           ?,?,?,?,?,?)"
      PREPARE axcq300_ins_tmp FROM g_sql       
      #分錄底稿存貨科目發生額與單身稅前金額不符
      FOREACH axcq300_cs30 USING g_bdate,g_edate,g_bdate,g_edate 
         INTO l_apcadocno,l_prog
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:axcq300_cs30" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         LET l_sum_apcb113 = 0
         LET l_sum_glgb003 = 0
         IF l_prog = 'aapt430' THEN
            #分攤單
            EXECUTE axcq300_sum_apdc213 USING l_apcadocno INTO l_sum_apcb113
         ELSE
            EXECUTE axcq300_sum_apcb113 USING l_apcadocno INTO l_sum_apcb113
         END IF
         EXECUTE axcq300_sum_glgb003 USING l_apcadocno INTO l_sum_glgb003
         IF cl_null(l_sum_apcb113) THEN LET l_sum_apcb113 = 0 END IF
         IF cl_null(l_sum_glgb003) THEN LET l_sum_glgb003 = 0 END IF
         #單據本幣未稅金額與分錄存貨科目金額不一致報錯
         IF l_sum_apcb113 != l_sum_glgb003 THEN
            LET g_xccc_d[l_ac].xccc006 = ''                              #料號
            LET g_xccc_d[l_ac].xccc007 = ''                              #產品特徵
            LET g_xccc_d[l_ac].xccc006_desc = ''                         #品名
            LET g_xccc_d[l_ac].xccc006_desc_1 = ''                       #規格
            CASE l_prog
              WHEN '01'
                LET g_xccc_d[l_ac].inaj035 = 'aapt320'                   #作業代號
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt320         #作業代號說明
              WHEN '02'
                LET g_xccc_d[l_ac].inaj035 = 'aapt320'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt320
              WHEN '13'
                LET g_xccc_d[l_ac].inaj035 = 'aapt300'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt300
              WHEN '17'
                LET g_xccc_d[l_ac].inaj035 = 'aapt300'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt300
              WHEN '22'
                LET g_xccc_d[l_ac].inaj035 = 'aapt340'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt340
              WHEN 'aapt430'
                LET g_xccc_d[l_ac].inaj035 = 'aapt430'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt430         
              OTHERWISE
                LET g_xccc_d[l_ac].inaj035 = ''
                LET g_xccc_d[l_ac].inaj035_desc = ''
            END CASE
            LET g_xccc_d[l_ac].docno = l_apcadocno                       #單據
            LET g_xccc_d[l_ac].info = l_error                            #報錯訊息
            
            #寫入temp table
            EXECUTE axcq300_ins_tmp
              USING g_xccc_d[l_ac].xccc006,g_xccc_d[l_ac].xccc007,g_xccc_d[l_ac].xccc006_desc,
                    g_xccc_d[l_ac].xccc006_desc_1,g_xccc_d[l_ac].docno,g_xccc_d[l_ac].info                 
         ELSE
            CONTINUE FOREACH
         END IF
         LET l_ac = l_ac + 1   
      END FOREACH    
      
      #分錄底稿委外加工費科目發生額與單身稅前金額不符
      #先取出符合的應付單/暫估單/待抵單(aapt300/aapt320/aapt340)
      LET g_sql = "SELECT apcadocno,prog FROM (",
                  " SELECT DISTINCT apcadocno apcadocno,apca001 prog",
                  "   FROM apca_t,pmds_t,pmdt_t,apcb_t ",
                  "   LEFT JOIN imaa_t ON imaaent = apcbent AND imaa001 = apcb004 AND imaa004 != 'E'",
                  "   LEFT JOIN inaj_t ON inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",                  
                  "   LEFT JOIN inaa_t ON inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y'",                  
                  "  WHERE apcbent = ",g_enterprise,
                  "    AND apcb001 IN ('11','21')",                                                                                                   
                  "    AND apcald = '",tm.xcccld,"'",
                  "    AND ((apca001 IN ('13','17','22') AND apcb023 = 'N') OR apca001 IN ('01','02'))",
                  "    AND apcaent = apcbent AND apcadocno = apcbdocno AND apcastus !='X'",
                  "    AND pmdsent = apcbent AND pmdsdocno = apcb002 ",
                  "    AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003 ",
                  "    AND (pmds000 = '14' OR (pmds000 IN ('12','20') AND pmdt005 != '8')) ",          #14：委外倉退單/12：委外入庫單/20：委外收貨入庫單
                  "    AND apcadocdt BETWEEN ? AND ?",
                  #有分錄底稿且分錄底稿科目裡有"委外加工費"科目(agli161：委外加工費科目)
                  "    AND apcbdocno IN (SELECT DISTINCT glgbdocno FROM glgb_t WHERE glgbent = apcbent AND glgbdocno = apcbdocno AND glgbld = apcbld",
                  "                        AND glgb002 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 = '1' AND glccld = apcbld ",
                  "                                           AND (glcc016 = apcb004 OR glcc016 = '*') AND (glcc005 IS NOT NULL OR glcc005 != '')))",
                  #單身科目裡有"委外加工費"科目(agli161：委外加工費科目)
                  "    AND apcb021 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 = '1' AND glccld = apcald ",
                  "                          AND (glcc016 = apcb004 OR glcc016 = '*') AND (glcc005 IS NOT NULL OR glcc005 != ''))",
                  "  UNION ",
                  #單據aapt430
                  " SELECT DISTINCT apdadocno apcadocno,'aapt430' prog",
                  "   FROM apda_t,pmds_t,pmdt_t,apdc_t",
                  "   LEFT JOIN imaa_t ON imaaent = apdcent AND imaa001 = apdc004 AND imaa004 !='E'",
                  "   LEFT JOIN inaj_t ON inajent = apdcent AND inaj001 = apdc002 AND inaj002 = apdc003 AND inaj005 = apdc004 ",
                  "   LEFT JOIN inaa_t ON inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y'",   
                  "  WHERE apdaent = ",g_enterprise,
                  "    AND apdaent = apdcent AND apdadocno=apdcdocno AND apdastus !='X'",                                                                                          
                  "    AND apdald = '",tm.xcccld,"'",
                  "    AND pmdsent = apdcent AND pmdsdocno = apdc002 ",
                  "    AND pmdtent = apdcent AND pmdtdocno = apdc002 AND pmdtseq = apdc003 ",
                  "    AND (pmds000 = '14' OR (pmds000 IN ('12','20') AND pmdt005 != '8')) ",          #14：委外倉退單/12：委外入庫單/20：委外收貨入庫單
                  "    AND apdadocdt BETWEEN ? AND ?",
                  #有分錄底稿且分錄底稿科目裡有"委外加工費"科目(agli161：委外加工費科目)
                  "    AND apdadocno IN (SELECT DISTINCT glgbdocno FROM glgb_t WHERE glgbent = apdcent AND glgbdocno = apdcdocno AND glgbld = apdcld",
                  "                        AND glgb002 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apdcent AND glcc001 = '1' AND glccld = apdcld ",
                  "                                           AND (glcc016 = apdc004 OR glcc016 = '*') AND (glcc005 IS NOT NULL OR glcc005 != '')))",
                  #單身科目裡有"委外加工費"科目(agli161：委外加工費科目)
                  "    AND apdc007 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apdcent AND glcc001 = '1' AND glccld = apdcld ",
                  "                          AND (glcc016 = apdc004 OR glcc016 = '*') AND (glcc005 IS NOT NULL OR glcc005 != ''))",
                  " ) t51 ", #201015-00064#1 添加别名
                  " ORDER BY apcadocno"         
      PREPARE axcq300_pr31 FROM g_sql
      DECLARE axcq300_cs31 CURSOR FOR axcq300_pr31



     #200407-00013#4 -s add
      #取應付單/暫估單/待抵單本幣未稅金額
      LET g_sql = "SELECT ABS(SUM(apcb113 * apcb022))",
                  "  FROM apcb_t ",
                  " WHERE apcbent = ",g_enterprise,
                  "   AND apcbld = '",tm.xcccld,"'",
                  "   AND apcbdocno = ?",
                  "   AND apcb001 IN ('11','21')",
                  "   AND EXISTS (SELECT 1 FROM pmds_t,pmdt_t",
                  " WHERE pmdsent= pmdtent AND pmdsdocno=pmdtdocno",
                  "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
                  "   AND (pmds000 = '14' OR (pmds000 IN ('12','20') AND pmdt005 != '8')))"
      PREPARE axcq300_sum_apcb113_1 FROM g_sql
      #取分攤單金額
      LET g_sql = "SELECT ABS(SUM(apdc213 - apdc113))",
                  "  FROM apdc_t ",
                  " WHERE apdcent = ",g_enterprise,
                  "   AND apdcld = '",tm.xcccld,"'",
                  "   AND apdcdocno = ?",
                  "   AND EXISTS (SELECT 1 FROM pmds_t,pmdt_t",
                  " WHERE pmdsent= pmdtent AND pmdsdocno=pmdtdocno",
                  "   AND pmdtent = apdcent AND pmdtdocno = apdc002 AND pmdtseq = apdc003",
                  "   AND (pmds000 = '14' OR (pmds000 IN ('12','20') AND pmdt005 != '8')))"
      PREPARE axcq300_sum_apdc213_1 FROM g_sql
     #200407-00013#4 -e add

      #取分錄委外加工費科目金額_應付
      LET g_sql = "SELECT ABS(SUM(glgb003-glgb004))",
                  "  FROM glgb_t",
                  " WHERE glgbent = ",g_enterprise,
                  "   AND glgbld = '",tm.xcccld,"'",
                  "   AND glgbdocno = ?",
                  "   AND glgb002 IN (SELECT glcc005 FROM glcc_t WHERE glccent = glgbent AND glcc001 = '1' AND glccld = '",tm.xcccld,"'",
                  "                          AND (glcc016 IN (SELECT DISTINCT apcb021 FROM apcb_t",
                  "                                            WHERE apcbent = glgbent AND apcbdocno = ?",
                  "                                              AND apcb001 IN ('11','21'))",                  
                  "                               OR glcc016 = '*') ",
                  "                          AND (glcc005 IS NOT NULL OR glcc005 != ''))"
      PREPARE axcq300_sum_glgb003_apcb FROM g_sql   
      #取分錄委外加工費科目金額_分攤     
      LET g_sql = "SELECT ABS(SUM(glgb003-glgb004))",
                  "  FROM glgb_t",
                  " WHERE glgbent = ",g_enterprise,
                  "   AND glgbld = '",tm.xcccld,"'",
                  "   AND glgbdocno = ?",
                  "   AND glgb002 IN (SELECT glcc005 FROM glcc_t WHERE glccent = glgbent AND glcc001 = '1' AND glccld = '",tm.xcccld,"'",
                  "                          AND (glcc016 IN (SELECT DISTINCT apdc007 FROM apdc_t",
                  "                                            WHERE apdcent = glgbent AND apdcdocno = ?)",
                  "                               OR glcc016 = '*') ",
                  "                          AND (glcc005 IS NOT NULL OR glcc005 != ''))"
      PREPARE axcq300_sum_glgb003_apdc FROM g_sql        
      #錯誤訊息
      LET l_error = ''
      SELECT gzze003 INTO l_error FROM gzze_t WHERE gzze001 = 'axc-01016' AND gzze002 = g_dlang      
      #分錄底稿委外加工費科目發生額與單身稅前金額不符
      FOREACH axcq300_cs31 USING g_bdate,g_edate,g_bdate,g_edate 
         INTO l_apcadocno,l_prog
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:axcq300_cs31" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         LET l_sum_apcb113 = 0
         LET l_sum_glgb003 = 0
         IF l_prog = 'aapt430' THEN
           #EXECUTE axcq300_sum_apdc213 USING l_apcadocno INTO l_sum_apcb113    #200407-00013#4 mark
            EXECUTE axcq300_sum_apdc213_1 USING l_apcadocno INTO l_sum_apcb113  #200407-00013#4 add            
            EXECUTE axcq300_sum_glgb003_apdc USING l_apcadocno,l_apcadocno INTO l_sum_glgb003
         ELSE
           #EXECUTE axcq300_sum_apcb113 USING l_apcadocno INTO l_sum_apcb113    #200407-00013#4 mark
            EXECUTE axcq300_sum_apcb113_1 USING l_apcadocno INTO l_sum_apcb113  #200407-00013#4 add             
            EXECUTE axcq300_sum_glgb003_apcb USING l_apcadocno,l_apcadocno INTO l_sum_glgb003
         END IF
         IF cl_null(l_sum_apcb113) THEN LET l_sum_apcb113 = 0 END IF
         IF cl_null(l_sum_glgb003) THEN LET l_sum_glgb003 = 0 END IF
         #單據本幣未稅金額與分錄存貨科目金額不一致報錯
         IF l_sum_apcb113 != l_sum_glgb003 THEN
            LET g_xccc_d[l_ac].xccc006 = ''                              #料號
            LET g_xccc_d[l_ac].xccc007 = ''                              #產品特徵
            LET g_xccc_d[l_ac].xccc006_desc = ''                         #品名
            LET g_xccc_d[l_ac].xccc006_desc_1 = ''                       #規格
            CASE l_prog
              WHEN '01'
                LET g_xccc_d[l_ac].inaj035 = 'aapt320'                   #作業代號
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt320         #作業代號說明
              WHEN '02'
                LET g_xccc_d[l_ac].inaj035 = 'aapt320'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt320
              WHEN '13'
                LET g_xccc_d[l_ac].inaj035 = 'aapt300'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt300
              WHEN '17'
                LET g_xccc_d[l_ac].inaj035 = 'aapt300'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt300
              WHEN '22'
                LET g_xccc_d[l_ac].inaj035 = 'aapt340'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt340
              WHEN 'aapt430'
                LET g_xccc_d[l_ac].inaj035 = 'aapt430'
                LET g_xccc_d[l_ac].inaj035_desc = l_prog_aapt430         
              OTHERWISE
                LET g_xccc_d[l_ac].inaj035 = ''
                LET g_xccc_d[l_ac].inaj035_desc = ''
            END CASE
            LET g_xccc_d[l_ac].docno = l_apcadocno                       #單據
            LET g_xccc_d[l_ac].info = l_error                            #報錯訊息
            
            #寫入temp table
            EXECUTE axcq300_ins_tmp
              USING g_xccc_d[l_ac].xccc006,g_xccc_d[l_ac].xccc007,g_xccc_d[l_ac].xccc006_desc,
                    g_xccc_d[l_ac].xccc006_desc_1,g_xccc_d[l_ac].docno,g_xccc_d[l_ac].info                 
         ELSE
            CONTINUE FOREACH
         END IF
         LET l_ac = l_ac + 1   
      END FOREACH      

      #單據(aapt330/aapt331/aapt301/aapt341/aapt420)分錄底稿裡不應存在庫存科目、委外科目科目
      LET g_sql = "SELECT '','','','',",                                                                                                       #料號/產品特徵/品名/規格
                  "       prog, ",                                                                                                             #作業代號
                  "       (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = prog AND gzzal002 = '",g_dlang,"') gzzal003,",                        #作業編號說明    
                  "       apcadocno,",                                                                                                         #單號
                  "       (CASE WHEN prog = 'aapt420' THEN REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01018' AND gzze002 = '",g_lang,"'),'%1',apcbseq) ",                  
                  "        ELSE REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01017' AND gzze002 = '",g_lang,"'),'%1',apcbseq) END) info",     #報錯訊息
                  #201015-00064#1  add -s-
                  #201015-00064#1 add -e-
                  "  FROM (",
                  #單據(aapt330/aapt331/aapt301/aapt341)
                  " SELECT DISTINCT apcadocno apcadocno,apcbseq apcbseq,",
                  "        (CASE WHEN apca001 = '12' THEN 'aapt331'", 
                  "         ELSE CASE WHEN apca001 = '19' THEN 'aapt301'", 
                  "         ELSE CASE WHEN apca001 = '29' THEN 'aapt341'",
                  "         ELSE 'aapt330' ",
                  "         END END END) prog",
                  "   FROM apca_t,apcb_t ",     
                  "  WHERE apcbent = ",g_enterprise,                                                                                                
                  "    AND apcald = '",tm.xcccld,"'",
                  "    AND apca001 IN ('12','15','19','29') ",                                        #12：員工費用借支單/15：員工費用報支單/19：其他應付款單/29：其他待抵單
                  "    AND apcaent = apcbent AND apcadocno = apcbdocno AND apcastus !='X'",
                  "    AND apcadocdt BETWEEN ? AND ?",
                  "    AND apcadocno IN (SELECT glgbdocno FROM glgb_t WHERE glgbent = apcaent AND glgbdocno = apcadocno ",                  
                  #會計科目在agli161設為存貨科目
                  "                         AND ((glgb002 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald ",
                  "                                              AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	               
                  #會計科目在agli161設為委外加工費用科目
                  "                          OR (glgb002  IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald ",
                  "                                              AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	 
                  #會計科目在agli021財務比率分析類別設為"5：存貨"               
                  "                          OR (glgb002  IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = apcbent AND glac011 = '05')) ))",                  
                  "  UNION ",
                  #單據(aapt420)
                  " SELECT DISTINCT apdadocno apcadocno,apdeseq apcbseq,'aapt420' prog",
                  "   FROM apda_t,apde_t",
                  "  WHERE apdaent = ",g_enterprise,
                  "    AND apdaent = apdeent AND apdadocno=apdedocno AND apdastus !='X'",                                                                                          
                  "    AND apdald = '",tm.xcccld,"'",
                  "    AND apdadocdt BETWEEN ? AND ?",         	 
                  #會計科目在agli021財務比率分析類別設為"5：存貨"     
                  "    AND apdadocno IN (SELECT glgbdocno FROM glgb_t WHERE glgbent = apdaent AND glgbdocno = apdadocno ",                  
                  "                         AND apde016 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = apdaent AND glac011 = '05'))",  
                  " ) t51",
                  " ORDER BY apcadocno"         
      PREPARE axcq300_pr32 FROM g_sql
      DECLARE axcq300_cs32 CURSOR FOR axcq300_pr32
      FOREACH axcq300_cs32 USING g_bdate,g_edate,g_bdate,g_edate 
         INTO g_xccc_d[l_ac].*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:axcq300_cs32" 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         LET l_ac = l_ac + 1   
      END FOREACH      
   END IF  
    
   #委外入庫代買料單計入非存貨科目
   LET g_sql = "SELECT DISTINCT apcb004,inaj006,",                                                                                                  #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       (CASE WHEN apca001 IN ('01','02') THEN 'aapt320' ELSE 'aapt300' END) inaj035,",                                              #作業編號
               "       (CASE WHEN apca001 IN ('01','02') THEN ",                                                                                                     
               "            (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt320' AND gzzal002 = '",g_dlang,"') ",                               
               "       ELSE (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aapt300' AND gzzal002 = '",g_dlang,"') ",                               
               "       END) gzzal003,apcadocno,",                                                                                                   #作業編號說明/單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01019' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",             #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,imaa_t,pmds_t,pmdt_t,inaj_t,inaa_t ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND imaaent = apcbent AND imaa001 = apcb004 ",
               "   AND apcbent = pmdsent AND pmdsdocno = apcb002 ",
               "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
               "   AND pmdsdocno = pmdtdocno AND pmdssite = pmdtsite ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y' ",         #inaa010成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		                                                                       
               "   AND imaa004 != 'E' ",		                                                                       #料件類別不為"E：費用料號"
               "   AND ((pmds000 IN ('12','20') AND pmdt005 = '8') OR  pmds000 = '14') ",                           #12：委外入庫/14：委外倉退/20：委外收貨入庫
               "   AND pmdsstus IN ('Y','S') ",
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",             
               #會計科目在agli161設為存貨科目
               "   AND apcb021 NOT IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald ",
               "                        AND (glcc016 = apcb004 OR glcc016 ='*') AND (glcc002 IS NOT NULL OR glcc002 != '')) ",	               
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr33 FROM g_sql
   DECLARE axcq300_cs33 CURSOR FOR axcq300_pr33
   FOREACH axcq300_cs33 USING g_bdate,g_edate INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs33" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET l_ac = l_ac + 1   
   END FOREACH   
   #200407-00013#1---add---end---
   
   #200421-00018#1 add(s)
   #判断库存交易明细档inaj_t是否有对应料件成本分群码
    LET g_sql = " SELECT DISTINCT /*+ index(inaj_t inaj_n02)*/ inaj005,inaj006,",
                  "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
                  "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
                  #"        'aimm217',",
                  #"        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'aimm217' AND gzzal002='"||g_dlang||"') gzzal003,",
                  #"        inaj001,",
                  "         '','','',",
                  "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00453' AND gzze002='",g_lang,"') info",
                  "   FROM inaj_t ",
                  "   LEFT JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 ",    
                  "   LEFT JOIN xcbb_t ON xcbbent = inajent AND xcbbcomp='",tm.xccccomp,"' AND xcbb003 = inaj005 ",
                  #"                   AND xcbb004 = inaj006 ",   #200903-00107#1 mark
                  "                   AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
                  "  WHERE inajent = ",g_enterprise,
                  "    AND inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",     
                  "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",        
                  "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",   
                  "    AND inaa010 <> 'N' AND xcbb010 IS NULL"           
   
   LET l_wc = cl_replace_str(g_wc,'xccc006','inaj005')   
   LET g_sql = g_sql," AND ",l_wc
  
   PREPARE axcq300_pr34 FROM g_sql
   DECLARE axcq300_cs34 CURSOR FOR axcq300_pr34
   FOREACH axcq300_cs34 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs34" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
   
      #IF NOT cl_null(g_xccc_d[l_ac].docno) THEN
      #   CALL axcq300_aooi200_get_slip(g_xccc_d[l_ac].docno) RETURNING g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc 
      #END IF
      LET l_ac = l_ac + 1
   END FOREACH
   
   #判断期初开账是否有对应料件成本分群码
   #取上期的年度/期别
   CALL s_fin_date_get_last_period(l_glaa003,tm.xcccld,tm.xccc004,tm.xccc005)
        RETURNING l_success,g_yy,g_mm
   IF NOT l_success THEN
      RETURN
   END IF
   LET g_sql = " SELECT DISTINCT xcca006,xcca007,",
                  "        (SELECT imaal003 FROM imaal_t WHERE imaalent=xccaent AND imaal001=xcca006 AND imaal002='"||g_dlang||"') imaal003,",
                  "        (SELECT imaal004 FROM imaal_t WHERE imaalent=xccaent AND imaal001=xcca006 AND imaal002='"||g_dlang||"') imaal004,",
                  "        'axct300',",
                  "        (SELECT gzzal003 FROM gzzal_t WHERE gzzal001 = 'axct300' AND gzzal002='"||g_dlang||"') gzzal003,",
                  "        '',",
                  "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00453' AND gzze002='",g_lang,"') info",
                  "   FROM xcca_t ", 
                  "   LEFT JOIN imag_t ON imagent = xccaent AND imagsite = xccacomp AND imag001 = xcca006 ",
                  "  WHERE xccaent = ",g_enterprise,
                  "    AND xccald = '",tm.xcccld,"'",    
                  "    AND xccacomp = '",tm.xccccomp,"'",
                  "    AND xcca003 = '",tm.xccc003,"'",
                  "    AND xcca004 = ",g_yy,
                  "    AND xcca005 = ",g_mm,
                  "    AND imag011 IS NULL"           

   LET l_wc = cl_replace_str(g_wc,'xccc006','xcca006')   
   LET g_sql = g_sql," AND ",l_wc

   PREPARE axcq300_pr35 FROM g_sql
   DECLARE axcq300_cs35 CURSOR FOR axcq300_pr35
   FOREACH axcq300_cs35 INTO g_xccc_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:axcq300_cs35" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
     
      IF NOT cl_null(g_xccc_d[l_ac].docno) THEN
         CALL axcq300_aooi200_get_slip(g_xccc_d[l_ac].docno) RETURNING g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc 
      END IF
      LET l_ac = l_ac + 1
   END FOREACH
   #200421-00018#1 add(e)
   
   CALL g_xccc_d.deleteElement(l_ac)
   LET g_detail_cnt = l_ac - 1
   DISPLAY g_detail_cnt TO FORMONLY.cnt
END FUNCTION

################################################################################
# Descriptions...: 建立報表TempTable
# Memo...........:
# Usage..........: CALL axcq300_create_temp()
#                :      RETURNING r_sucess
# Input parameter: 無
# Return code....: r_success   建立狀態(TRUE:成功 FALSE:失敗)
# Date & Author..: 2015/3/26 By liuym
# Modify.........:
################################################################################
PRIVATE FUNCTION axcq300_create_temp()
   DEFINE r_success         LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   

   DROP TABLE axcq300_temp #ODI-ORA#
   
   CREATE TEMP TABLE axcq300_temp(
      xccccomp       LIKE xccc_t.xccccomp, 
      xccccomp_desc  LIKE type_t.chr100, 
      xcccld         LIKE xccc_t.xcccld, 
      xcccld_desc    LIKE type_t.chr100, 
      xccc004        LIKE xccc_t.xccc004, 
      xccc005        LIKE xccc_t.xccc005, 
      xccc001        LIKE xccc_t.xccc001, 
      xccc001_desc   LIKE type_t.chr100, 
      xccc003        LIKE xccc_t.xccc003, 
      xccc003_desc   LIKE type_t.chr100, 
      xccc006        LIKE xccc_t.xccc006, 
      xccc007        LIKE xccc_t.xccc007, 
      imaal003       LIKE imaal_t.imaal003, 
      imaal004       LIKE imaal_t.imaal004, 
      lbl_docno      LIKE type_t.chr30, 
      lbl_err        LIKE type_t.chr1000
      )
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create axcq300_temp'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 將查詢畫面上的資料寫入報表TempTable
# Memo...........:
# Usage..........: CALL axcq300_ins_temp
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2015/3/26 By liuym
# Modify.........:
################################################################################
PRIVATE FUNCTION axcq300_ins_temp()
DEFINE l_cnt               LIKE type_t.num10
DEFINE l_xccc001_desc      LIKE type_t.chr100   #160503-00030#3 add

   LET l_cnt = g_xccc_d.getLength()

#160503-00030#3 add str
   IF NOT cl_null(tm.xccccomp_desc) THEN
      LET tm.xccccomp_desc = tm.xccccomp,'(',tm.xccccomp_desc,')' CLIPPED
   ELSE
      LET tm.xccccomp_desc = tm.xccccomp
   END IF
   IF NOT cl_null(tm.xcccld_desc) THEN
      LET tm.xcccld_desc = tm.xcccld,'(',tm.xcccld_desc,')' CLIPPED
   ELSE
      LET tm.xcccld_desc = tm.xcccld
   END IF
   IF NOT cl_null(tm.xccc003_desc) THEN
      LET tm.xccc003_desc = tm.xccc003,'(',tm.xccc003_desc,')' CLIPPED
   ELSE 
      LET tm.xccc003_desc = tm.xccc003
   END IF  
   IF NOT cl_null(tm.xccc001) THEN
      SELECT gzcbl004 INTO l_xccc001_desc FROM gzcbl_t
       WHERE gzcbl001='8914' AND gzcbl002=tm.xccc001 AND gzcbl003=g_dlang  
      IF NOT cl_null(tm.xccc001_desc) THEN
         LET tm.xccc001_desc=tm.xccc001,".",l_xccc001_desc,'(',tm.xccc001_desc,')' CLIPPED
      ELSE
         LET tm.xccc001_desc=tm.xccc001,".",l_xccc001_desc CLIPPED   
      END IF
   END IF   
#160503-00030#3 add end

   FOR l_cnt = 1 TO g_xccc_d.getLength()
      INSERT INTO axcq300_temp
                  (xccccomp,xccccomp_desc,xcccld,xcccld_desc,xccc004,
                   xccc005,xccc001,xccc001_desc,xccc003,xccc003_desc,                   
                   xccc006,xccc007,imaal003,imaal004,lbl_docno,lbl_err)
           VALUES (tm.xccccomp,tm.xccccomp_desc,tm.xcccld,tm.xcccld_desc,tm.xccc004,
                   tm.xccc005,tm.xccc001,tm.xccc001_desc,tm.xccc003,tm.xccc003_desc,
                   g_xccc_d[l_cnt].xccc006,g_xccc_d[l_cnt].xccc007,
                   g_xccc_d[l_cnt].xccc006_desc,g_xccc_d[l_cnt].xccc006_desc_1,
                   g_xccc_d[l_cnt].docno,g_xccc_d[l_cnt].info)   
   END FOR                  

END FUNCTION

################################################################################
# Descriptions...: 效能优化
# #161205-00025#19
################################################################################
PRIVATE FUNCTION axcq300_ins_temp_new()
DEFINE l_xccc001_desc    LIKE type_t.chr100
DEFINE l_pmds011_str1    STRING
DEFINE ls_msg            STRING

   IF NOT cl_null(tm.xccccomp_desc) THEN
      LET tm.xccccomp_desc = tm.xccccomp,'(',tm.xccccomp_desc,')' CLIPPED
   ELSE
      LET tm.xccccomp_desc = tm.xccccomp
   END IF
   IF NOT cl_null(tm.xcccld_desc) THEN
      LET tm.xcccld_desc = tm.xcccld,'(',tm.xcccld_desc,')' CLIPPED
   ELSE
      LET tm.xcccld_desc = tm.xcccld
   END IF
   IF NOT cl_null(tm.xccc003_desc) THEN
      LET tm.xccc003_desc = tm.xccc003,'(',tm.xccc003_desc,')' CLIPPED
   ELSE 
      LET tm.xccc003_desc = tm.xccc003
   END IF  
   IF NOT cl_null(tm.xccc001) THEN
      SELECT gzcbl004 INTO l_xccc001_desc FROM gzcbl_t
       WHERE gzcbl001='8914' AND gzcbl002=tm.xccc001 AND gzcbl003=g_dlang  
      IF NOT cl_null(tm.xccc001_desc) THEN
         LET tm.xccc001_desc=tm.xccc001,".",l_xccc001_desc,'(',tm.xccc001_desc,')' CLIPPED
      ELSE
         LET tm.xccc001_desc=tm.xccc001,".",l_xccc001_desc CLIPPED   
      END IF
   END IF
   
   LET l_pmds011_str1 =  s_aap_get_acc_str('2061',"gzcb003 = 'Y' ")
   LET l_pmds011_str1 = s_fin_get_wc_str(l_pmds011_str1) 
   
   #1.此期料件异动是否全部参于成本阶计算(axcp120)
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",
               "        inaj005,inaj006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
               "        inaj001,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00557' AND gzze002='",g_lang,"') info",
               "   FROM inaj_t ",
               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND NOT EXISTS (SELECT 1 FROM inaa_t ",
               "                     WHERE inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008",
               "                       AND inaa010 = 'N'",
               "                       AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent = inaaent AND ooef001 = inaasite",
               "                                      AND ooefstus = 'Y' AND ooef017 = '",tm.xccccomp,"'))",
               "    AND (NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = inajent AND xcbb003 = inaj005",
               "                                            AND xcbbcomp = '",tm.xccccomp,"'",
               "                                            AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,") " #160929-00039#1 reduce ,
               #170207-00035#1 marked-S
#               IF cl_get_para(g_enterprise,g_site,'S-FIN-6013') = 'Y' THEN
#                  LET g_sql = g_sql, "OR NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = inajent AND xcbb004 = inaj006",
#                                     " AND xcbbcomp = '",tm.xccccomp,"'",
#                                     " AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,") "
#               END IF 
               #170207-00035#1 marked-E
               LET g_sql = g_sql , " ) " ,
               "    AND inajent = ",g_enterprise,     
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",        
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   PREPARE axcq300_pr1n FROM g_sql
   EXECUTE axcq300_pr1n
               
   #2.入庫/退貨單与请款单未匹配
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        pmdt006,pmdt007,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=pmdtent AND imaal001=pmdt006 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=pmdtent AND imaal001=pmdt006 AND imaal002='"||g_dlang||"') imaal004,",
               "        pmdtdocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00558' AND gzze002='",g_lang,"') info",             
               "   FROM pmdt_t,pmds_t ",
               "  WHERE pmdsent = pmdtent AND pmdsdocno = pmdtdocno ",
               "    AND pmds001 BETWEEN '",g_bdate,"' AND '",g_edate,"'", 
               "    AND pmds000 IN ('3','4','6','7','12')  AND pmdt005 != '9'",   #排除样品
               "    AND pmds011 IN ",l_pmds011_str1 CLIPPED,                    
               "    AND ( pmdt056 + pmdt066 < pmdt024 OR",
               "         (pmdt056 IS NULL AND pmdt024 > 0 AND pmdt056 < pmdt024) OR", 
               #"         (pmds000 = '7' AND pmds100 = '5' AND NOT EXISTS (SELECT 1 FROM apcb_t WHERE apcb008 = pmdtdocno AND apcb009 = pmdtseq)))", #无请款资料匹配纯折让的部分 #170628-00024#1 mark
               "         (pmds000 = '7' AND pmds100 = '5' AND NOT EXISTS (SELECT 1 FROM apcb_t WHERE apcbent = pmdtent AND apcb008 = pmdtdocno AND apcb009 = pmdtseq)))", #170628-00024#1 add
               "    AND pmdsent = ",g_enterprise,
               "    AND pmdsstus <> 'X' ",    
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=pmdsent AND ooef001=pmdssite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   PREPARE axcq300_pr2n FROM g_sql
   EXECUTE axcq300_pr2n
   
   #3.应付帐款数量或金额<0（入库单+仓退单）
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        apcb004,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=apcbent AND imaal001=apcb004 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=apcbent AND imaal001=apcb004 AND imaal002='"||g_dlang||"') imaal004,",
               "        apcadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00559' AND gzze002='",g_lang,"') info",
               "   FROM apca_t,apcb_t",
               "  WHERE apcaent = apcbent AND apcald = apcbld AND apcadocno = apcbdocno ",
               "    AND apcadocdt BETWEEN '",g_bdate,"' AND '",g_edate ,"'",   
               "    AND (apca001 = '13' OR apca001 = '22') ",              
               "    AND ((apcb007 > 0 AND apcb101 < 0) OR ",      #判斷有數量而無金額
               "         (apcb007 > 0 AND apcb105 < 0) OR ",
               "         (apcb007 > 0 AND apcb111 < 0) OR ",
               "         (apcb007 > 0 AND apcb115 < 0) OR ",         
               "         (apcb007 < 0 AND apcb101 > 0) OR ",      #判斷無數量而有金額
               "         (apcb007 < 0 AND apcb105 > 0) OR ",
               "         (apcb007 < 0 AND apcb111 > 0) OR ",
               "         (apcb007 < 0 AND apcb115 > 0)) ",
               "    AND apcaent = ",g_enterprise," AND apcald = '",tm.xcccld,"'",
               "    AND apcacomp ='",tm.xccccomp,"'"
   PREPARE axcq300_pr3n FROM g_sql
   EXECUTE axcq300_pr3n           
                                           
   #4，檢查統計檔期未庫存小於零                                         
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        inat001,inat002,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inatent AND imaal001=inat001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inatent AND imaal001=inat001 AND imaal002='"||g_dlang||"') imaal004,",
               "        '',",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00560' AND gzze002='",g_lang,"') info",
               "   FROM inat_t ",
               "  WHERE inatent = ",g_enterprise," AND inat008 = ",tm.xccc004,
               "    AND inat009 = ",tm.xccc005," AND inat015 < 0 ",
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inatent AND ooef001=inatsite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   PREPARE axcq300_pr4n FROM g_sql
   EXECUTE axcq300_pr4n                                                 
   
   #5.每日工時檔中, 有無輸入上期前就已結案的工單
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        sfac001,sfac006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal004,",
               "        xcbi002,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00562' AND gzze002='",g_lang,"') info",
               "   FROM xcbh_t,xcbi_t",
               "   LEFT OUTER JOIN sfaa_t ON xcbient = sfaaent AND xcbi002 = sfaadocno AND sfaastus != 'X' AND sfaa048 IS NOT NULL",
               "   LEFT OUTER JOIN sfac_t ON xcbient = sfacent AND xcbi002 = sfacdocno",
               "  WHERE xcbhent = xcbient AND xcbhdocno = xcbidocno ",
               "    AND xcbh001 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND (xcbi201 != 0 OR xcbi202 != 0 OR xcbi203 != 0 OR xcbi204 != 0) ",
               "    AND xcbhent = ",g_enterprise," AND xcbhcomp = '",tm.xccccomp,"'",
               "    AND sfac001 IS NULL",
               " UNION",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        sfac001,sfac006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfacent AND imaal001=sfac001 AND imaal002='"||g_dlang||"') imaal004,",
               "        xcbi002,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00561' AND gzze002='",g_lang,"') info",             
               "   FROM xcbh_t,xcbi_t",
               "   LEFT OUTER JOIN sfaa_t ON xcbient = sfaaent AND xcbi002 = sfaadocno AND sfaastus != 'X' AND sfaa048 IS NOT NULL",
               "   LEFT OUTER JOIN sfac_t ON xcbient = sfacent AND xcbi002 = sfacdocno",
               "  WHERE xcbhent = xcbient AND xcbhdocno = xcbidocno ",
               "    AND xcbh001 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND (xcbi201 != 0 OR xcbi202 != 0 OR xcbi203 != 0 OR xcbi204 != 0) ",
               "    AND xcbhent = ",g_enterprise," AND xcbhcomp = '",tm.xccccomp,"'",
               "    AND sfac001 IS NOT NULL AND sfaa048 IS NOT NULL",
               "    AND ( to_char(sfaa048,'YYYY') < ",tm.xccc004," OR ",
               "         (to_char(sfaa048,'YYYY') = ",tm.xccc004," AND to_char(sfaa048,'MM') < ",tm.xccc005,") )"               
   PREPARE axcq300_pr5n FROM g_sql
   EXECUTE axcq300_pr5n   
      
   #7,應發數量=0 but 已發數量<>0
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        sfba006,sfba021,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal004,",
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00565' AND gzze002='",g_lang,"') info",
               "   FROM sfaa_t,sfba_t",
               "  WHERE sfaaent = sfbaent AND sfaadocno = sfbadocno ",
               "    AND sfaaent  =",g_enterprise,  
               "    AND sfba013 = 0 AND (sfba016 <> 0 OR sfba025 <> 0)",
               #"    AND (sfaa038 >= '",g_bdate,"' OR sfaa038 IS NULL)",    #161223-00018#1 MARK
               "    AND (sfaa048 >= '",g_bdate,"' OR sfaa048 IS NULL)",   #161223-00018#1 MOD
               "    AND sfaadocdt <='",g_edate,"'",   #200724-00018#1  
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfbaent AND ooef001=sfbasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   PREPARE axcq300_pr7n FROM g_sql
   EXECUTE axcq300_pr7n
   
   #8,檢查有inaj_t 但無工單編號
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        inaj005,inaj006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
               "        inaj020,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00566' AND gzze002='",g_lang,"') info",
               "   FROM inaj_t",
               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
               "    AND NOT EXISTS (SELECT 1 FROM sfaa_t WHERE sfaaent = inajent AND sfaadocno = inaj020) ",
               "    AND inajent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   PREPARE axcq300_pr8n FROM g_sql
   EXECUTE axcq300_pr8n           

   #9.檢查有inaj_t,但無備料檔
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        inaj005,inaj006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
               "        inaj020,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00567' AND gzze002='",g_lang,"') info",
               "   FROM inaj_t ",
               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
               "    AND NOT EXISTS (SELECT 1 FROM inaa_t WHERE inaaent=inajent AND inaasite=inajsite",
               "                                           AND inaa001=inaj008 AND inaa010='N')",               
               "    AND inajent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
               "                                       AND ooefstus='Y' AND ooef017='",tm.xccccomp,"')",               
               "    AND NOT EXISTS (SELECT 1 FROM imaa_t WHERE imaaent=inajent AND imaa001=inaj005)",
               " UNION",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        inaj005,inaj006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inajent AND imaal001=inaj005 AND imaal002='"||g_dlang||"') imaal004,",
               "        inaj020,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00568' AND gzze002='",g_lang,"') info",
               "   FROM inaj_t ",
               "  WHERE inaj022 BETWEEN '",g_bdate,"' AND '",g_edate,"'",
               "    AND inaj015 LIKE 'asft31%' AND inaj004 != 0 ",        #inaj015:发料，领料，超领等
               "    AND NOT EXISTS (SELECT 1 FROM inaa_t WHERE inaaent=inajent AND inaasite=inajsite",
               "                                           AND inaa001=inaj008 AND inaa010='N')",
               "    AND inajent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inajent AND ooef001=inajsite",
               "                                       AND ooefstus='Y' AND ooef017='",tm.xccccomp,"')",
               "    AND EXISTS (SELECT 1 FROM imaa_t WHERE imaaent=inajent AND imaa001=inaj005)",
               "    AND NOT EXISTS (SELECT 1 FROM sfba_t WHERE sfbaent=inajent AND sfbadocno=inaj020)"
   PREPARE axcq300_pr9n FROM g_sql
   EXECUTE axcq300_pr9n


#170301-00056#1---mark---s   
#   #把需要的訊息先抓出來
#   CALL cl_getmsg('axc-00569',g_lang) RETURNING ls_msg  #請款單付款金額與單身不合
#   #10,檢查請款的單頭與單身不合
#   LET g_sql = " INSERT INTO axcq300_temp ",
#               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
#               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
#               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",  
#               "        '','','','',apcadocno,'",ls_msg,"'",
#               "   FROM (",
#               "         SELECT apca001,apcadocno,ABS((apca103-apca106)) a,ABS((apca113-apca116)) b,apca025, ",
#               "                CASE WHEN (apca001='02' OR apca001='22') THEN ABS(SUM((apcb103-apcb106)*apcb022) OVER(PARTITION BY apcadocno))*-1 ELSE ABS(SUM((apcb103-apcb106)*apcb022) OVER(PARTITION BY apcadocno)) END a1,",
#               "                CASE WHEN (apca001='02' OR apca001='22') THEN ABS(SUM((apcb113-apcb116)*apcb022) OVER(PARTITION BY apcadocno))*-1 ELSE ABS(SUM((apcb113-apcb116)*apcb022) OVER(PARTITION BY apcadocno)) END b1",
#               "           FROM apca_t,apcb_t ", 
#               "          WHERE apcaent = apcbent AND apcald = apcbld AND apcadocno = apcbdocno ",
#               "            AND apcadocdt BETWEEN '",g_bdate,"' AND '",g_edate ,"'",
#               "            AND EXISTS (SELECT 1 FROM apcb_t,imaa_t",
#               "                         WHERE apcbent = apcaent AND apcbdocno = apcadocno",
#               "                           AND apcbent = imaaent AND apcb004 = imaa001) ",
#               "            AND apcaent = ",g_enterprise," AND apcacomp = '",tm.xccccomp,"' AND apcald = '",tm.xcccld,"'",
#               "            AND apca001 IN('01','02','13','17','22') ",               
#               "        )",               
#               "  WHERE (a1<>a OR b1<>b) AND apca025 <> '4' "  
#   PREPARE axcq300_pr10n FROM g_sql
#   EXECUTE axcq300_pr10n
#170301-00056#1---mark---e   
   
   #11，產品分類編號為NULL
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        imaa001,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal004,",
               "        '',",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00570' AND gzze002='",g_lang,"') info",
               "   FROM imaa_t",
               "  WHERE imaaent = ",g_enterprise," AND imaa009 IS NULL ",
               "    AND imaastus = 'Y' "  #170515-00005#1 ADD
   PREPARE axcq300_pr11n FROM g_sql
   EXECUTE axcq300_pr11n   

   #12,累计至当月的完工入库数量 = 工单数量,才做应结未结工单明细
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        sfaa010,sfac006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00563' AND gzze002='",g_lang,"') info",
               "   FROM sfaa_t,sfac_t",         
               "  WHERE sfaaent = sfacent AND sfaadocno = sfacdocno AND sfaa010 = sfac001 ",
               "    AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND sfaa012 = sfaa050 + sfaa051 ", #完工数 = 生产数
               #把FOREACH裡判斷生產數量sfaa012 是否等於 完工入庫數量SUM(sfec009 組進SQL中
               "    AND sfaa012 = (SELECT SUM(sfec009) FROM sfea_t,sfec_t",
               "                    WHERE sfeaent = sfecent AND sfeadocno = sfecdocno",
               "                      AND sfeaent = ",g_enterprise," AND sfeastus = 'S'",
               "                      AND sfec001 = sfaadocno AND sfec004 = '1' AND sfea001 <= '",g_edate,"')",
               "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
               "    AND sfaaent = ",g_enterprise,
               "    AND sfaastus <> 'M' ",  
               "    AND sfaastus <> 'X' ",  
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"               
   PREPARE axcq300_pr12n FROM g_sql
   EXECUTE axcq300_pr12n

   #13，當月完工入庫,檢核有無報工
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        sfec005,sfec006,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfecent AND imaal001=sfec005 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfecent AND imaal001=sfec005 AND imaal002='"||g_dlang||"') imaal004,",
               "        sfec001,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00571' AND gzze002='",g_lang,"') info",
               "   FROM sfec_t,sfea_t ",
               "  WHERE sfeaent = sfecent AND sfeadocno = sfecdocno ",
               "    AND sfea001 BETWEEN '",g_bdate,"' AND '",g_edate,"'" #170410-00014#1 remove ,
               #"    AND NOT EXISTS (SELECT 1 FROM xcbi_t WHERE xcbient = sfecent AND xcbi002 = sfec001 AND xcbicomp = '",tm.xccccomp,"') ", #170410-00014#1 mark
   #170410-00014#1 add start -----
   IF g_para_data2 = 'Y' THEN
      LET g_sql = g_sql, "    AND NOT EXISTS (SELECT 1 FROM xcbr_t WHERE xcbrent = sfecent AND xcbr002 = sfec001 AND xcbrcomp = '",tm.xccccomp,"') "
   ELSE
      LET g_sql = g_sql, "    AND NOT EXISTS (SELECT 1 FROM xcbi_t WHERE xcbient = sfecent AND xcbi002 = sfec001 AND xcbicomp = '",tm.xccccomp,"') "
   END IF 
   LET g_sql = g_sql,
   #170410-00014#1 add start -----               
               "    AND sfeaent = ",g_enterprise," AND sfeastus = 'S'",
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfeaent AND ooef001=sfeasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   PREPARE axcq300_pr13n FROM g_sql
   EXECUTE axcq300_pr13n  

   #14.检查在imaa中有的料号（已审核），但imac没有数据
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        imaa001,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=imaaent AND imaal001=imaa001 AND imaal002='"||g_dlang||"') imaal004,",
               "        '',",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00709' AND gzze002='",g_lang,"') info",
               "   FROM imaa_t",
               "  WHERE imaaent = ",g_enterprise," AND imaastus = 'Y'",
               "    AND NOT EXISTS (SELECT 1 FROM imac_t WHERE imacent=imaaent AND imac001=imaa001)"
   PREPARE axcq300_pr14n FROM g_sql
   EXECUTE axcq300_pr14n

   #15.检查有工单或备料，没inaj的，且没有xcbb的
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        sfaa010,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfaaent AND imaal001=sfaa010 AND imaal002='"||g_dlang||"') imaal004,",
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00723' AND gzze002='",g_lang,"') info",
               "   FROM sfaa_t ",         
               "  WHERE sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
               "    AND sfaastus NOT IN ('M','X','N') ",    #成本结案
               "    AND sfaaent = ",g_enterprise,               
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "    AND NOT EXISTS (SELECT 1 FROM inaj_t WHERE inajent = sfaaent AND inajsite = sfaasite",
               "                                           AND inaj005 = sfaa010 AND inaj020= sfaadocno) ",
               "    AND NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = sfaaent AND xcbb003 = sfaa010 ",
               "                                           AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
               "                                           AND xcbbcomp = '",tm.xccccomp,"') ",
               " UNION ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        sfba006,'',",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=sfbaent AND imaal001=sfba006 AND imaal002='"||g_dlang||"') imaal004,",
               "        sfaadocno,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00723' AND gzze002='",g_lang,"') info",
               "   FROM sfba_t,sfaa_t ",         
               "  WHERE sfaaent = sfbaent AND sfaadocno=sfbadocno ",
               "    AND sfaadocdt BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND (sfaa065 = '0' OR sfaa065 IS NULL) ",  #未结案
               "    AND sfaastus NOT IN ('M','X','N') ",    #成本结案
               "    AND sfaaent = ",g_enterprise,
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfaaent AND ooef001=sfaasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "    AND NOT EXISTS (SELECT 1 FROM inaj_t WHERE inajent = sfbaent AND inajsite = sfbasite",
               "                                           AND inaj005 = sfba006 AND inaj020 = sfbadocno) ",
               "    AND NOT EXISTS (SELECT 1 FROM xcbb_t WHERE xcbbent = sfbaent AND xcbb003 = sfba006 ",
               "                                           AND xcbb001 = ",tm.xccc004," AND xcbb002 = ",tm.xccc005,
               "                                           AND xcbbcomp = '",tm.xccccomp,"') "
   PREPARE axcq300_pr15n FROM g_sql
   EXECUTE axcq300_pr15n

   #16.雜收單設定判斷
   #1.檢核狀態為未庫存扣帳單者, 則提示異常 ,”庫存異動單未作庫存扣帳”
   #2.與 axct312 (xccw_t)作比對, 不存在axct312或是xccw202.成本金額 是null或0者, 則提示異常  “雜收單未設定入庫單價”         
   LET g_sql = " INSERT INTO axcq300_temp ",
               #181120-00026#1   mark-S
#               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
#               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
#               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
#               "        inbb001,'',",
#               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal003,",
#               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal004,",
#               "        inbadocno,",
#               "        CASE WHEN (xccw202 IS NULL OR xccw202 = 0) ",
#               "             THEN inbb016||(SELECT oocql004 FROM oocql_t,gzcb_t ",
#               "                             WHERE oocqlent = inbbent ",
#               "                               AND oocql001 = gzcb004",
#               "                               AND oocql002 = inbb016",
#               "                               AND oocql003 = '",g_dlang,"'",
#               "                               AND gzcb001 = '24'",
#               "                               AND gzcb002 = 'aint302') ",
#               "             ELSE (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00738' AND gzze002='",g_lang,"') END info ",
#               #"   FROM inba_t,inbb_t ",           #170301-00040#1 mark
#               "   FROM inba_t,inaa_t,inbb_t ",    #170301-00040#1 add
#               "   LEFT OUTER JOIN xccw_t ON xccw006 = inbbdocno and xccw010 = inbb001 AND inbbent = xccwent ",
#               "                         AND xccw001 = ",tm.xccc001," ",
#               "  WHERE inbaent = ",g_enterprise," ",
#               "    AND inbbent = inbaent AND inbadocno = inbbdocno ",
#               "    AND inbbent = inaaent AND inbbsite = inaasite AND inbb007 = inaa001 AND inaa010 = 'Y' ",     #170301-00040#1 add
#               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inbaent AND ooef001=inbasite",
#               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
#               "    AND inbasite = inbbsite ",               
#               "    AND inba002 BETWEEN '", g_bdate,"' AND '", g_edate,"'",   #扣帳日期
#               "    AND inbastus != 'X' AND inbastus != 'S'",                 #未作廢 且 非已過帳
#               "    AND inba001 = '2' ",                                      #雜收單
#               " UNION",
               #181120-00026#1   mark-E
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        inbb001,inbb016,",
               "        (SELECT imaal003 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal003,",
               "        (SELECT imaal004 FROM imaal_t WHERE imaalent=inbbent AND imaal001=inbb001 AND imaal002='"||g_dlang||"') imaal004,",
               "        inbadocno,",
              #"        CASE WHEN (xccw202 IS NULL OR xccw202 = 0) ",  #210319-00051#1 mark
               "        CASE WHEN (xccw282 IS NULL OR xccw282 = 0) ",  #210319-00051#1 add
               "             THEN inbb016||(SELECT oocql004 FROM oocql_t,gzcb_t ",
               "                             WHERE oocqlent = inbbent ",
               "                               AND oocql001 = gzcb004",
               "                               AND oocql002 = inbb016",
               "                               AND oocql003 = '",g_dlang,"'",
               "                               AND gzcb001 = '24'",
               "                               AND gzcb002 = 'aint302') ",
               "             ELSE (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00738' AND gzze002='",g_lang,"') END info ",
               #"   FROM inba_t,inbb_t ",          #170301-00040#1 mark
               #"   FROM inba_t,inaa_t,inbb_t ",    #170301-00040#1 add  #191105-00012#1 mark
               #210319-00051#1 mark(s)
               #"   FROM inba_t,inbc_t,inaa_t,inbb_t ",    #191105-00012#1 add
               #"   LEFT OUTER JOIN xccw_t ON xccw006 = inbbdocno and xccw010 = inbb001 AND inbbent = xccwent ",
               #"                         AND xccw001 = ",tm.xccc001," ",
               #210319-00051#1 mark(e)
               #210319-00051#1 add(s)
               "  FROM inba_t,inbc_t ",    #191105-00012#1
               "   LEFT OUTER JOIN xccw_t ON xccw006 = inbcdocno and xccw010 = inbc001 AND inbcent = xccwent ",
               "                         AND xccw001 = ",tm.xccc001," ",
               "                         AND xccw003 = '",tm.xccc003,"' AND xccw004 = ",tm.xccc004," AND xccw005 = ",tm.xccc005,
               "                         AND xccw007 = inbcseq AND xccw008 = inbcseq1 ",
               ",inaa_t,inbb_t ",
               #210319-00051#1 add(e)
               "  WHERE inbaent = ",g_enterprise," ",
               "    AND inbbent = inbaent AND inbadocno = inbbdocno ",
               "    AND inbbent = inbcent AND inbbdocno = inbcdocno AND inbbseq = inbcseq ", #191105-00012#1
               #"    AND inbbent = inaaent AND inbbsite = inaasite AND inbb007 = inaa001 AND inaa010 = 'Y' ",     #170301-00040#1 add #191105-00012#1
               "    AND inbcent = inaaent AND inbcsite = inaasite AND inbc005 = inaa001 AND inaa010 = 'Y' ",     #191105-00012#1 
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=inbaent AND ooef001=inbasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               "    AND inbasite = inbbsite ",               
               "    AND inba002 BETWEEN '", g_bdate,"' AND '", g_edate,"'",   #扣帳日期
               "    AND inbastus = 'S'",                                      #已過帳
               "    AND inba001 = '2' ",                                      #雜收單
              #"    AND (xccw202 IS NULL OR xccw202 = 0)"      #210319-00051#1 mark
               "    AND (xccw282 IS NULL OR xccw282 = 0)"      #210319-00051#1 add               
   PREPARE axcq300_pr16n FROM g_sql
   EXECUTE axcq300_pr16n  

   #17.如果参数没有启用特性码计算成本，检查axci120中一个料号只能存在一笔资料，且特征栏位为空格(关键词唯一性，只要判断特性非空格就可以了)
   IF g_para_data1 = 'N' THEN
      LET g_sql = " INSERT INTO axcq300_temp ",
                  " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
                  #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080 mark
                  "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080
                  "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
                  "        xcbb003,xcbb004,",
                  "        (SELECT imaal003 FROM imaal_t WHERE imaalent=xcbbent AND imaal001=xcbb003 AND imaal002='"||g_dlang||"') imaal003,",
                  "        (SELECT imaal004 FROM imaal_t WHERE imaalent=xcbbent AND imaal001=xcbb003 AND imaal002='"||g_dlang||"') imaal004,",
                  "        '',",
                  "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00740' AND gzze002='",g_lang,"') info",
                  "   FROM xcbb_t ",
                  "  WHERE xcbbent = ",g_enterprise,
                  "    AND xcbbcomp='",tm.xccccomp,"' ",
                  "    AND xcbb001 = ",tm.xccc004,
                  "    AND xcbb002 = ",tm.xccc005,
                  "    AND xcbb004 IS NOT NULL AND xcbb004 !=' ' "
      PREPARE axcq300_pr17n FROM g_sql
      EXECUTE axcq300_pr17n
   END IF

   #17.检查发料单中工单不存在于工单维护作业中
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",  #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        '','','','',sfdc001,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00401' AND gzze002='",g_lang,"') info",  
               "   FROM sfdc_t,sfda_t ",
               "  WHERE sfdcent = sfdaent AND sfdcdocno = sfdadocno ",
               "    AND sfdaent = ",g_enterprise,
               "    AND sfda001 BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND sfdastus = 'S' ",
               "    AND NOT EXISTS (SELECT 1 FROM sfaa_t WHERE sfaaent = sfdcent and sfaadocno = sfdc001)",
               "    AND sfdc001 IS NOT NULL ",
               "    AND sfda002 NOT IN ('16','26') ",
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfdaent AND ooef001=sfdasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')",
               " UNION ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               #"        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080 mark
               "        ",tm.xccc004,",",tm.xccc005,",'",tm.xccc001,"','",tm.xccc001_desc,"',",   #PGS-(D)-03080
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",   
               "        '','','','',sfdb001,",
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001='axc-00401' AND gzze002='",g_lang,"') info",
               "   FROM sfdb_t,sfda_t ",
               "  WHERE sfdbent = sfdaent AND sfdbdocno = sfdadocno ",
               "    AND sfdaent = ",g_enterprise,
               "    AND sfda001 BETWEEN '", g_bdate,"' AND '", g_edate,"'",
               "    AND sfdastus = 'S' ",
               "    AND NOT EXISTS (SELECT 1 FROM sfaa_t WHERE sfaaent = sfdbent and sfaadocno = sfdb001)",
               "    AND sfdb001 IS NOT NULL ",
               "    AND sfda002 IN ('15','25') ",
               "    AND EXISTS (SELECT 1 FROM ooef_t WHERE ooefent=sfdaent AND ooef001=sfdasite",
               "                                       AND ooefstus ='Y' AND ooef017 ='",tm.xccccomp,"')"
   PREPARE axcq300_pr18n FROM g_sql
   EXECUTE axcq300_pr18n 
   
   #200407-00013#1---add---start---
   #費用料號計入存貨科目
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',", 
               "        apcb004,'',",                                                                                                              #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",     #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",     #規格
               "       apcadocno,",                                                                                                                #單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01007' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",            #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t ",	
               "  LEFT JOIN imaa_t ON imaaent = apcbent AND imaa001 = apcb004 ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	   #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                     #暫估單(aapt320)
               "   AND apcastus != 'X' ",		
               "   AND imaa004 = 'E' ",		                                                         #料件類別："E：費用料號"
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",		
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目在agli161設為存貨科目
               "   AND (apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 = '1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 = '*')) ",	 
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
               "    OR (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",
               " ORDER BY apcb004,apcadocno"
   PREPARE axcq300_pr19n FROM g_sql
   EXECUTE axcq300_pr19n USING g_bdate,g_edate 
   
   #入庫非成本倉計入存貨科目
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',", 
               "        apcb004,inaj006,",                                                                                                                  #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",              #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",              #規格  
               "       apcadocno,",                                                                                                                         #單號
               "       REPLACE(REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01008' AND gzze002 = 'zh_TW'),'%1',apcbseq),'%2',inaj008) info",    #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,inaj_t,inaa_t ",	
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = apcbent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'N' ",         #inaa010非成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目在agli161設為存貨科目
               "   AND (apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 = '*')) ",	 
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
               "    OR (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr20n FROM g_sql
   EXECUTE axcq300_pr20n USING g_bdate,g_edate      
   
   #雜項應付單計入存貨或委外科目，應付單非入庫倉退項使用存貨或委外科目
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',", 
               "        apcb004,'',",                                                                                                               #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       apcadocno,",                                                                                                                 #單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 ='axc-01009' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",              #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t ",	                                                                                                           
               "  LEFT JOIN imaa_t ON imaaent = apcbent AND imaa001 = apcb004 ",		                                                                    
               " WHERE apcaent = ",g_enterprise,                                                                                                     
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",                                                                                
               "   AND apcb001 IN ('19','29') AND apcb023 = 'N' AND apca001 IN ('13','17','19') ",	                                                  #應付單(aapt300)/雜項應付單(aapt301)	
               "   AND apcastus != 'X' ",		
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",		
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目在agli161設為存貨科目
               "   AND ((apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	               
               #會計科目在agli161設為委外加工費用科目
               "    OR (apcb021 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	 
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
               "    OR (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr21n FROM g_sql
   EXECUTE axcq300_pr21n USING g_bdate,g_edate  
   
   #委外入庫單計入非委外科目
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',", 
               "        apcb004,inaj006,",                                                                                                          #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       apcadocno,",                                                                                                                 #單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01010' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",             #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,imaa_t,pmds_t,pmdt_t,inaj_t,inaa_t ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND imaaent = apcbent AND imaa001 = apcb004 ",
               "   AND apcbent = pmdsent AND pmdsdocno = apcb002 ",
               "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
               "   AND pmdsdocno = pmdtdocno AND pmdssite = pmdtsite ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y' ",         #inaa010成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		                                                                       
               "   AND imaa004 != 'E' ",		                                                                       #料件類別不為"E：費用料號"
               "   AND ((pmds000 IN ('12','20') AND pmdt005 != '8') OR  pmds000 = '14') ",                          #12：委外入庫/14：委外倉退/20：委外收貨入庫
               "   AND pmdsstus IN ('Y','S') ",
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目不存在agli161的委外加工費用科目
               "   AND apcb021 NOT IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 = '1' AND glccld = apcald ",
               "                          AND (glcc016 = apcb004 OR glcc016 = '*') AND (glcc005 IS NOT NULL OR glcc005 != ''))",
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr22n FROM g_sql
   EXECUTE axcq300_pr22n USING g_bdate,g_edate  
   
   #庫存料號且入庫成本倉，但計入非存貨科目
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',", 
               "        apcb004,inaj006,",                                                                                                          #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       apcadocno,",                                                                                                                 #單號
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01011' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",             #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,imaa_t,pmds_t,pmdt_t,inaj_t,inaa_t ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND imaaent = apcbent AND imaa001 = apcb004 ",
               "   AND apcbent = pmdsent AND pmdsdocno = apcb002 ",
               "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
               "   AND pmdsdocno = pmdtdocno AND pmdssite = pmdtsite ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y' ",         #inaa010成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		                                                                       
               "   AND imaa004 != 'E' ",		                                                                       #料件類別不為"E：費用料號"
               "   AND pmds000 NOT IN ('12','14','20')  ",                                                          #12：委外入庫/14：委外倉退/20：委外收貨入庫
               "   AND pmdsstus IN ('Y','S') ",
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",               
               #會計科目不存在agli161裡設為存貨科目
               "   AND ((apcb021 NOT IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	               
               #會計科目不存在agli021裡財務比率分析類別設為"5：存貨"               
               "   AND (apcb021 NOT IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",
               " ORDER BY apcb004,apcadocno"               
   PREPARE axcq300_pr23n FROM g_sql
   EXECUTE axcq300_pr23n USING g_bdate,g_edate  
   
   #應付與暫估價差歸入存貨科目，但無產生成本分攤單
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",    
               "        '','','','',apcfdocno,",                                                                           #料號/產品特徵/品名/規格/單號
               "        (SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01012' AND gzze002 = '",g_lang,"') info",         #報錯訊息
               "   FROM apcf_t,apca_t ",
               "  WHERE apcfent = ",g_enterprise,
               "    AND apcfld = '",tm.xcccld,"'",
               "    AND apcaent = apcfent AND apcald = apcfld AND apcadocno = apcfdocno ",
               "    AND apcadocdt BETWEEN ? AND ? ",  
               "    AND apcf002='D1' AND apcf008='DIFF' ",                                                                 #DIFF為價差
               #會計科目在agli021財務比率分析類別設為"5：存貨"                  
               "    AND apcf021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')", 
               #不存在aapt430費用分攤維護作業
               "    AND apcfdocno NOT IN (SELECT apce003 FROM apce_t,apda_t WHERE apceent = apcfent AND apce003 = apcfdocno ", 
               "                            AND apceld = apcfld AND apcedocno = apdadocno AND apceent = apdaent AND apdastus != 'X')",
               "  ORDER BY apcfdocno"    
   PREPARE axcq300_pr24n FROM g_sql
   EXECUTE axcq300_pr24n USING g_bdate,g_edate  
   
   #單別分錄生成否設置為Y且暫估差異費用分攤單來源科目為存貨科目需報錯
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",    
               "        '','','','',apdadocno,",                                                                                                        #料號/產品特徵/品名/規格/單號                 
               "        REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01013' AND gzze002 = '",g_lang,"'),'%1',apceseq) info",                #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "   FROM apda_t,apce_t ",                                                                                                                
               "  WHERE apceent = ",g_enterprise,                                                                                                       
               "    AND apdald = apceld AND apdadocno = apcedocno AND apdaent = apceent",                                                               
               "    AND apce002='05' AND apdastus != 'X'",                                                                                              #帳款性質："05：暫估差異"
               "    AND apdadocdt BETWEEN ? AND ? ",
               #來源會計科目若存在agli021存貨科目需報錯
               "    AND apce016 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')",     
               #aapt430單別參數(aooi200)"D-FIN-0030"設為"Y"
               "    AND SUBSTR(apcedocno,",g_n1,",",g_n2,") IN (SELECT ooba002 FROM ooba_t,oobx_t ",                                                    #aapt430單別
               "                                                 WHERE oobaent = apceent AND ooba001 = '",g_glaa024,"'",
               "                                                   AND oobxent = oobaent AND oobx001 = ooba002 ",
               "                                                   AND oobx003 = 'aapt430' AND oobx004 = 'aapt430'",                                    #單據性質&作業編號
               "                                                   AND ooba002 IN (SELECT ooac002 FROM ooac_t ",
               "                                                                    WHERE ooacent = apceent AND ooac003 ='D-FIN-0030'",                 #"D-FIN-0030"：產生交易帳務分錄否
               "                                                                      AND ooac001 = ooba001 AND ooac004 = 'Y'))",
               "  ORDER BY apdadocno"
   PREPARE axcq300_pr25n FROM g_sql
   EXECUTE axcq300_pr25n USING g_bdate,g_edate 
   
   #單別分錄生成否設置為Y且暫估差異費用分攤單目的科目不為存貨科目需報錯
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",    
               "        '','','','',apdadocno,",                                                                                                        #料號/產品特徵/品名/規格/單號   
               "        REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01014' AND gzze002 = '",g_lang,"'),'%1',apdcseq) info",                #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "   FROM apda_t,apce_t,apdc_t ",                                                                                                                
               "  WHERE apceent = ",g_enterprise,                                                                                                       
               "    AND apdald = apceld AND apdadocno = apcedocno AND apdaent = apceent",                                                              
               "    AND apdald = apdcld AND apdadocno = apdcdocno AND apdaent = apdcent",                                                                
               "    AND apce002='05' AND apdastus != 'X'",                                                                                              #帳款性質："05：暫估差異"
               "    AND apdadocdt BETWEEN ? AND ? ",
               #目的會計科目若不存在agli021存貨科目需報錯
               "    AND apdc007 NOT IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')",     
               #aapt430單別參數(aooi200)"D-FIN-0030"設為"Y"
               "    AND SUBSTR(apcedocno,",g_n1,",",g_n2,") IN (SELECT ooba002 FROM ooba_t,oobx_t ",                                                    #aapt430單別
               "                                                 WHERE oobaent = apceent AND ooba001 = '",g_glaa024,"'",
               "                                                   AND oobxent = oobaent AND oobx001 = ooba002 ",
               "                                                   AND oobx003 = 'aapt430' AND oobx004 = 'aapt430'",                                    #單據性質&作業編號
               "                                                   AND ooba002 IN (SELECT ooac002 FROM ooac_t ",
               "                                                                    WHERE ooacent = apceent AND ooac003 ='D-FIN-0030'",                 #"D-FIN-0030"：產生交易帳務分錄否
               "                                                                      AND ooac001 = ooba001 AND ooac004 = 'Y'))",
               "  ORDER BY apdadocno"
   PREPARE axcq300_pr26n FROM g_sql
   EXECUTE axcq300_pr26n USING g_bdate,g_edate   
   #單據(aapt330/aapt331/aapt301/aapt420)帳務處理不應存在庫存科目、委外科目科目
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",       
               "        '','','','',apcadocno,",                                                                                                  #料號/產品特徵/品名/規格/單號
               "        ELSE REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01017' AND gzze002 = '",g_lang,"'),'%1',apcbseq) END) info",     #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM (",
               " SELECT DISTINCT apcadocno apcadocno,apcbseq apcbseq,",
               "        (CASE WHEN apca001 = '12' THEN 'aapt331'", 
               "         ELSE CASE WHEN apca001 = '19' THEN 'aapt301'", 
               "         ELSE CASE WHEN apca001 = '29' THEN 'aapt341'",
               "         ELSE 'aapt330' ",
               "         END END END) prog",
               "   FROM apca_t,apcb_t ",     
               "  WHERE apcbent = ",g_enterprise,                                                                                                
               "    AND apcald = '",tm.xcccld,"'",
               "    AND apca001 IN ('12','15','19','29') ",                                        #12：員工費用借支單/15：員工費用報支單/19：其他應付款單/29：其他待抵單
               "    AND apcaent = apcbent AND apcadocno = apcbdocno AND apcastus !='X'",
               "    AND apcadocdt BETWEEN ? AND ?",            
               #會計科目在agli161設為存貨科目
               "   AND ((apcb021 IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	               
               #會計科目在agli161設為委外加工費用科目
               "    OR (apcb021 IN (SELECT glcc005 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald AND (glcc016 = apcb004 OR glcc016 ='*'))) ",	 
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
               "    OR (apcb021 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",                  
               "  UNION ",
               #單據(aapt420)
               " SELECT DISTINCT apdadocno apcadocno,apdeseq apcbseq,'aapt420' prog",
               "   FROM apda_t,apde_t",
               "  WHERE apdaent = ",g_enterprise,
               "    AND apdaent = apdeent AND apdadocno=apdedocno AND apdastus !='X'",                                                                                          
               "    AND apdald = '",tm.xcccld,"'",
               "    AND apdadocdt BETWEEN ? AND ?",         	 
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
               "    AND apde016 IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')",  
               " ) t51",  #201015-00064#1 添加别名
               " ORDER BY apcadocno"   
   PREPARE axcq300_pr27n FROM g_sql
   EXECUTE axcq300_pr27n USING g_bdate,g_edate,g_bdate,g_edate 
   
   #委外入庫代買料單計入非存貨科目
   LET g_sql = " INSERT INTO axcq300_temp ",
               " SELECT DISTINCT '",tm.xccccomp,"','",tm.xccccomp_desc,"','",tm.xcccld,"','",tm.xcccld_desc,"',",
               "        '",tm.xccc004,"','",tm.xccc005,"','",tm.xccc001,"','",tm.xccc001_desc,"',",
               "        '",tm.xccc003,"','",tm.xccc003_desc,"',",    
               "        apcb004,inaj006,",                                                                                                          #料號/產品特徵
               "       (SELECT imaal003 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal003,",      #品名
               "       (SELECT imaal004 FROM imaal_t WHERE imaalent = apcbent AND imaal001 = apcb004 AND imaal002 = '",g_dlang,"') imaal004,",      #規格
               "       apcadocno,", 
               "       REPLACE((SELECT gzze003 FROM gzze_t WHERE gzze001 = 'axc-01019' AND gzze002 = '",g_lang,"'),'%1',apcbseq) info",             #報錯訊息
               #201015-00064#1  add -s-
               #201015-00064#1 add -e-
               "  FROM apca_t,apcb_t,imaa_t,pmds_t,pmdt_t,inaj_t,inaa_t ",		
               " WHERE apcaent = ",g_enterprise,
               "   AND apcaent = apcbent AND apcadocno = apcbdocno ",
               "   AND imaaent = apcbent AND imaa001 = apcb004 ",
               "   AND apcbent = pmdsent AND pmdsdocno = apcb002 ",
               "   AND pmdtent = apcbent AND pmdtdocno = apcb002 AND pmdtseq = apcb003",
               "   AND pmdsdocno = pmdtdocno AND pmdssite = pmdtsite ",
               "   AND inajent = apcbent AND inaj001 = apcb002 AND inaj002 = apcb003 AND inaj005 = apcb004 ",
               "   AND inaaent = inajent AND inaa001 = inaj008 AND inaasite = inajsite AND inaa010 = 'Y' ",         #inaa010成本倉
               "   AND ((apcb001 IN ('11','21') AND apcb023 = 'N' AND apca001 IN ('13','17')) ",	                 #應付單(aapt300)	
               "    OR  (apcb001 IN ('11','21') AND apca001 IN ('01','02')) )",	                                   #暫估單(aapt320)
               "   AND apcastus != 'X' ",		                                                                       
               "   AND imaa004 != 'E' ",		                                                                       #料件類別不為"E：費用料號"
               "   AND ((pmds000 IN ('12','20') AND pmdt005 = '8') OR  pmds000 = '14') ",                           #12：委外入庫/14：委外倉退/20：委外收貨入庫
               "   AND pmdsstus IN ('Y','S') ",
               "   AND apcald = '", tm.xcccld,"' AND apcacomp = '",tm.xccccomp,"'",	
               "   AND apcadocdt BETWEEN ? AND ? ",             
               #會計科目在agli161設為存貨科目
               "   AND ((apcb021 NOT IN (SELECT glcc002 FROM glcc_t WHERE glccent = apcbent AND glcc001 ='1' AND glccld = apcald ",
               "                        AND (glcc016 = apcb004 OR glcc016 ='*') AND (glcc002 IS NOT NULL OR glcc002 != ''))) ",	               
               #會計科目在agli021財務比率分析類別設為"5：存貨"               
               "   AND (apcb021 NOT IN (SELECT glac002 FROM glac_t WHERE glac001 = '",g_glaa004,"' AND glacent = ",g_enterprise," AND glac011 = '05')) )",
               " ORDER BY apcb004,apcadocno"  
   PREPARE axcq300_pr28n FROM g_sql
   EXECUTE axcq300_pr28n USING g_bdate,g_edate         
   #200407-00013#1---add---end---
END FUNCTION

################################################################################
# Descriptions...: 傳入單據編號取得作業代號及名稱#160913-00024#1
# Memo...........:
# Usage..........: CALL axcq300_aooi200_get_slip(g_xccc_d[l_ac].docno) 
#                  RETURNING g_xccc_d[l_ac].inaj035,g_xccc_d[l_ac].inaj035_desc
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2017/01/17 By 08992
# Modify.........:
################################################################################
PRIVATE FUNCTION axcq300_aooi200_get_slip(p_docnodesc)
DEFINE l_ooba002 LIKE ooba_t.ooba002
DEFINE r_inaj035 LIKE inaj_t.inaj035
DEFINE r_gzzal003 LIKE gzzal_t.gzzal003
DEFINE p_docnodesc LIKE type_t.chr80
DEFINE  l_success  LIKE type_t.num5

   CALL s_aooi200_get_slip(p_docnodesc) RETURNING l_success,l_ooba002    
      
   SELECT oobx004 INTO r_inaj035 
     FROM oobx_t LEFT JOIN ooba_t ON oobaent = oobxent AND ooba002 = oobx001
    WHERE oobaent = g_enterprise  #170615-00053#4 mod 添加ent条件
      AND ooba002 = l_ooba002 
      #PGS-(D)-03080-----s
      #AND EXISTS(SELECT 1 FROM glaa_t WHERE glaaent = oobxent AND glaald = tm.xcccld AND glaa024 = oobx001)   #210105-00032#1 mark
      AND EXISTS(SELECT 1 FROM glaa_t WHERE glaaent = oobxent AND glaald = tm.xcccld AND glaa024 = ooba001)    #210105-00032#1 add
      #PGS-(D)-03080-----e 
    
   SELECT gzzal003 INTO r_gzzal003 
     FROM gzzal_t 
    WHERE gzzal001 = r_inaj035 AND gzzal002 = g_dlang
   
   RETURN  r_inaj035,r_gzzal003   
END FUNCTION

 
{</section>}
 
