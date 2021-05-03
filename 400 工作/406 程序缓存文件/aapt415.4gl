#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="aapt415.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0073(2021-04-19 17:05:26), PR版次:0073(2021-04-19 17:07:15)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000413
#+ Filename...: aapt415
#+ Description: 發票請款單維護作業
#+ Creator....: 05016(2014-12-09 09:57:14)
#+ Modifier...: 08734 -SD/PR- 08734
 
{</section>}
 
{<section id="aapt415.global" type="s" >}
#應用 t01 樣板自動產生(Version:120)
#add-point:填寫註解說明 name="global.memo" 
#150301apo       15/03/01 By apo       對帳單開窗改為多選傳回寫入
#150401-00001#13 15/07/17 By RayHuang  statechange段問題修正
#151125-00006#2  15/12/03 By 06421     新增[編輯完單據後立即審核]功能
#151130-00015#2  15/12/21 BY taozf     判断 是否可以更改單據日期 設定開放單據日期修改
#151231-00010#1  16/01/20 By sakura    增加控制組
#160111-00020    16/02/04 By 02097     單別參數D-FIN-0033是否可以更改單據日期勾選Y時，可異動任何欄位, 若有異動單據日期要檢核不可小等於關帳日期
#160104-00007#10 16/02/15 By Hans      配合簽核流程修改
#160125-00005#6  16/02/15 By 02097     查詢時，只顯示有權限的組織
#160308-00010#1  16/03/08 By Jessica   簽核流程修改調整  
#160225-00001#1  16/03/04 By 02097     參數D-FIN-0033=N 時不管什麼欄位都不可異動
#160321-00016#21 16/03/23 By Jessy     修正azzi920重複定義之錯誤訊息
#160812-00027#1  16/08/17 By 06821     全面盤點應付程式帳套權限控管
#160822-00008#3  16/08/24 By 08732     新舊值調整
#160818-00017#1  16/08/30 By 07900     删除修改未重新判断状态码
#161006-00005#4  16/10/12 By 08732     組織類型與職能開窗調整
#161102-00046#1  16/11/03 By 06821     修正查询出全部资料，切换上下笔，會报错sub-00110参数为空的問題
#161108-00017#3  16/11/09 By Reanna    程式中INSERT INTO 有星號作整批調整
#161104-00024#3  16/11/10 By 08729     處理DEFINE有星號
#161114-00017#2  16/11/15 By 06821     應付_開窗過濾據點
#161125-00021#1  16/11/25 By Reanna    增加自定義欄位
#160802-00007#2  16/11/28 By albireo   一次性交易對象識別碼(pmaa004=2)功能應用
#161228-00002#1  16/12/28 By albireo   1.新增時交易對象識別碼應取號後回寫對應單號
#161220-00044#1  17/01/03 By 06948     取消確認時，若單據已存在aapt420，不可取消確認
#161229-00047#45 17/01/09 By 06821     財務用供應商對象控制組,法人條件改為用 IN (site...)的方式,QBE時,傳入符合權限的法人；INPUT時傳入目前法人據點
#161104-00046#4  17/01/11 By 06821     單別預設值;資料依照單別user dept權限過濾單號
#170301-00027#2  17/03/06 By 09042     財務模組的單別應該使用帳套所對應的單別參照表
#170223-00028#1  17/03/07 By Sabrina   單身多項次時，刪除其中一筆會連同其他筆一併刪除
#170313-00033#1  17/04/07 By 08729     提供對帳單查詢開窗應用, 依需求增加 應付帳款單號(apcadocno),立帳日期(apcadocdt),應付款日(apca009),容許票據到期日(apca010)
#170503-00023#1  17/05/03 By Reanna    aapt415未过滤掉aapt300作废/未审核的单据。
#170516-00041#9  17/06/01 By Sabrina   整單bug修改
#170522-00030#1  17/06/08 By 08729     ㄧ次性交易對象沒有帶出說明
#170618-00361#1  17/06/20 By Hans      針對未沖銷的單據加上DISTINCT
#170621-00042#1  17/06/28 By 08729     程式內容有錯誤需調整/aist310/aapt415
#170608-00007#1  17/07/11 By Hans      增加列印作業。
#170720-00041#1  17/07/24 By dorishsu  修正第一筆aapt300+多帳期項次部份請款後,無法新增第二筆相同的aapt300+項次剩餘金額,且第二筆新增成功後無法取消確認的問題
#171031-00032#1  17/11/01 By 05795     对账单号开窗 过滤掉 立账付款完毕的 资料
#171117-00021#1  17/11/17 By 06821     资料新增时，apeb025【付款项次】栏位值默认给“0”，不正确，应该给空
#171127-00022#1  17/12/25 By 06821     1.對帳單號開窗應排除aapt420 未確認同 apcc key 之核銷單 (同原段落aapt415_get_amt 計算可請款金額的控卡)
#                                      2.對帳單號開窗選取單號後, 帶回應付單號應排除暫估類型單據
#171006-00010#66 17/12/27 By 10554     調整報錯做法，先結束交易再做報錯
#180314-00054#1  18/03/23 By 10554     單身輸入【發票號碼】後直接帶出【發票代碼】以利檢核
#180329-00040#1  18/03/29 By 00537     同q_apeb002的效能改善，去掉apba，apbb
#180326-00045#1  18/03/30 By 04152     若已有產生anmt440/460/aapt420資料且狀態=Y，才可以按整單操作的已付款註記
#180402-00020#1  18/04/12 By 09773     1.单身对账单号开窗q_apeb002中所有栏位都应为不可编辑状态，目前销货方名称及其以后列都为可编辑状态；
#                                      2.款别性质下拉选项中请去掉空白项
#180103-00037#10 18/05/03 By 08734     aooi200中单号有做预设时，可更改栏位有设定时，要体现出来
#180402-00011#1  18/05/09 By 06821     aooi200 D-FIN-0033是否可以更改单据日期=N;新增时单据日期还是可以编辑的状态，只有保存后再点击修改，才是不可编辑的状态。
#180510-00048#1  18/05/11 By 04152     若aapt300的來源是多張aapt110時，在aapt415單身手動輸入aapt110單號，會報aap-00159錯誤，應調整抓取立帳單號的WHERE條件
#180516-00039#4  18/06/06 By 10043     修改单据日期时未卡控不可小於單身來源單日期
#180724-00069#1  18/07/26 By 10554     1.单身【对账单号】开窗及手工输入时，应限定对应 [账款单状态为Y] 才可被输入
#180828-00007#1  18/09/04 By 10043     单身选择对账单号后自动带出发票代码，发票代码栏位检核
#180907-00038#1  18/09/19 By 11384     审核时添加关账日期检核，若小于关账日期，则不允许审核
#180103-00004#1  18/10/22 By 10554     單身對帳單號開窗和檢核條件不一致
#181025-00028#4  18/10/29 By 10043     財務模組ENT修正
#181104-00001#1  18/11/15 By 05634     修改對帳單號開窗多選後,帶回單身的對帳單號和發票號碼都重複的問題
#181129-00047#1  18/11/30 By 05634     修正可請款餘額檢核邏輯
#180927-00013#1  19/01/24 By 10554     1.單身付款到期日apeb031開放修改(必輸),輸入後檢核: 付款到期日不可<單据日期
#                                      2.單身增加顯示【來源類型apeb001】、【請款說明apeb010】
#                                      3.【來源類型apeb001】為4*時可輸入【帳款單號apeb003】,不可輸入對帳單號/項次
#                                      4.【帳款單號apeb003】開窗依【來源類型apeb001】和【來源組織apeborga】限制可選擇帳款單號範圍
#                                      5.【帳款單號apeb003】開窗不須檢核是否有帳套權限
#                                      6.【帳款單號apeb003】若對應多筆對帳單號,僅選擇MAX(對帳單號)顯示一筆
#                                      7.修正開窗選擇發票號碼後,帶出請款金額不正確的問題
#                                      8.apbb002=apca005條件改為apbb002=apca004
#                                      9.修正修改日期後年度月份會被清空的問題
#190507-00038#1  19/05/07 By 10554     輸入應付單後帶出的本幣金額以原始單號為主
#190408-00021#13 19/05/30 By 01531     账款性质增加内部暂估单带来的调整
#190531-00010#7  19/06/03 By 10554     CALL aapt420_03* 改CALL s_aapt420_03*
#190423-00042#3  19/07/22 By 10043     修改#181104-00001#1,sql少傳參數
#190901-00001#1  19/09/02 By 11234     在aapt415浏览页签加上单头的付款对象、已付款注记，增加单身本币金额合计
#190911-00007#1  19/09/12 By 08729     修改畫面的說明，4gl並沒有做異動
#191212-00043#1  19/12/18 By 07804     修正發票請款單全額產生對帳單金額,則本幣不須重推
#200226-00017#1  20/02/27 By 11234     修改类型后数据清空
#200412-00001#1  20/04/20 By 11234     修改aapt415单身中对账单号开窗排除立账付款完毕资料的问题
#181024-00092#1  20/05/09 By 12290     增加供應商過欄位時的管控：只能使用本據點內的供應商編號；涉及作業：aapt210/aapt320/aapt360/aapt415/aapt460/aapt510/aapt530/aapt540/aapt550
#200515-00022#1  20/05/18 By 05795     aapt415的本币金额加重评价金额
#200624-00064#1  20/07/02 By 10130     修正当单身有资料时，单头付款对象不可修改
#201030-00047#1  20/11/02 By 11234     效能优化，||写法改为exists
#191203-00012#8  20/12/02 By 14586     画面无资料时TOPMENU上的无效按钮做灰掉处理，避免出现報錯
#210121-00016#5  21/03/24 by 08172     明细操作增加'款别性质与到期日调整'可修改付款单号为空的款别性质与付款到期日
#210419-00024#1  21/04/19 By 08734     规格复制功能失效
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:86) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:86) --- end ---
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
IMPORT JAVA com.fourjs.fgl.lang.FglRecord   #(ver:87) add
#add-point:增加匯入項目 name="global.import" 

#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
#(ver:87) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:87) --- add end ---
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_apea_m        RECORD
       apeasite LIKE apea_t.apeasite, 
   apeasite_desc LIKE type_t.chr80, 
   apea003 LIKE apea_t.apea003, 
   apea003_desc LIKE type_t.chr80, 
   apeadocdt LIKE apea_t.apeadocdt, 
   apeacomp LIKE apea_t.apeacomp, 
   apeald LIKE apea_t.apeald, 
   apeadocno LIKE apea_t.apeadocno, 
   apea001 LIKE apea_t.apea001, 
   apea019 LIKE apea_t.apea019, 
   apea020 LIKE apea_t.apea020, 
   apea005 LIKE apea_t.apea005, 
   apea005_desc LIKE type_t.chr80, 
   apea013 LIKE apea_t.apea013, 
   apea006 LIKE apea_t.apea006, 
   apeastus LIKE apea_t.apeastus, 
   apeaownid LIKE apea_t.apeaownid, 
   apeaownid_desc LIKE ooag_t.ooag011, 
   apeaowndp LIKE apea_t.apeaowndp, 
   apeaowndp_desc LIKE ooefl_t.ooefl003, 
   apeacrtid LIKE apea_t.apeacrtid, 
   apeacrtid_desc LIKE ooag_t.ooag011, 
   apeacrtdp LIKE apea_t.apeacrtdp, 
   apeacrtdp_desc LIKE ooefl_t.ooefl003, 
   apeacrtdt LIKE apea_t.apeacrtdt, 
   apeamodid LIKE apea_t.apeamodid, 
   apeamodid_desc LIKE ooag_t.ooag011, 
   apeamoddt LIKE apea_t.apeamoddt, 
   apeacnfid LIKE apea_t.apeacnfid, 
   apeacnfid_desc LIKE ooag_t.ooag011, 
   apeacnfdt LIKE apea_t.apeacnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_apeb_d        RECORD
       apebseq LIKE apeb_t.apebseq, 
   apeborga LIKE apeb_t.apeborga, 
   apeborga_desc LIKE type_t.chr500, 
   apeb001 LIKE apeb_t.apeb001, 
   apeb002 LIKE apeb_t.apeb002, 
   apeb007 LIKE apeb_t.apeb007, 
   apeb008 LIKE apeb_t.apeb008, 
   apeb011 LIKE apeb_t.apeb011, 
   apeb003 LIKE apeb_t.apeb003, 
   apeb004 LIKE apeb_t.apeb004, 
   apeb005 LIKE apeb_t.apeb005, 
   apeb031 LIKE apeb_t.apeb031, 
   apeb100 LIKE apeb_t.apeb100, 
   apeb108 LIKE apeb_t.apeb108, 
   apeb101 LIKE apeb_t.apeb101, 
   apeb118 LIKE apeb_t.apeb118, 
   apeb006 LIKE apeb_t.apeb006, 
   apeb010 LIKE apeb_t.apeb010, 
   apeb024 LIKE apeb_t.apeb024, 
   apeb025 LIKE apeb_t.apeb025, 
   apebcomp LIKE apeb_t.apebcomp, 
   apbbdocdt LIKE type_t.chr500, 
   apbb055 LIKE type_t.chr500, 
   apeb012 LIKE apeb_t.apeb012, 
   apebld LIKE apeb_t.apebld
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_apeasite LIKE apea_t.apeasite,
      b_apea003 LIKE apea_t.apea003,
   b_apea003_desc LIKE type_t.chr80,
      b_apeadocdt LIKE apea_t.apeadocdt,
      b_apeadocno LIKE apea_t.apeadocno,
      b_apea005 LIKE apea_t.apea005,
   b_apea005_desc LIKE type_t.chr80,
      b_apea013 LIKE apea_t.apea013,
      b_apea017 LIKE apea_t.apea017
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_comp      LIKE ooef_t.ooef001     #帳務中心所屬帳套
DEFINE g_ld        LIKE glaa_t.glaald
DEFINE g_glaa001   LIKE glaa_t.glaa001
DEFINE g_glaa024   LIKE glaa_t.glaa024 #單別參照表號 
DEFINE g_glaa026   LIKE glaa_t.glaa026 #幣別參照表號
DEFINE g_glaa002   LIKE glaa_t.glaa002 #匯率參照表號
DEFINE g_isai002   LIKE isai_t.isai002
DEFINE g_sql_ctrl  STRING              #151231-00010#1
DEFINE g_wc_cs_orga          STRING                #160125-00005#6
DEFINE g_wc_apeborga         STRING                #160812-00027#1 add 帳務來源組織新增時條件
DEFINE g_site_str            STRING                #161114-00017#2 add
DEFINE g_wc_cs_comp          STRING                #161229-00047#45 add
DEFINE g_comp_str            STRING                #161229-00047#45 add 
#161104-00046#4 --s add
DEFINE g_user_dept_wc        STRING     
DEFINE g_user_dept_wc_q      STRING     
DEFINE g_user_slip_wc        STRING
DEFINE g_ap_slip             LIKE ooba_t.ooba002
#161104-00046#4 --e add
DEFINE g_sfin2002            LIKE type_t.chr80 #180927-00013#1 add
#end add-point
       
#模組變數(Module Variables)
DEFINE g_apea_m          type_g_apea_m
DEFINE g_apea_m_t        type_g_apea_m
DEFINE g_apea_m_o        type_g_apea_m
DEFINE g_apea_m_mask_o   type_g_apea_m #轉換遮罩前資料
DEFINE g_apea_m_mask_n   type_g_apea_m #轉換遮罩後資料
 
   DEFINE g_apeadocno_t LIKE apea_t.apeadocno
 
 
DEFINE g_apeb_d          DYNAMIC ARRAY OF type_g_apeb_d
DEFINE g_apeb_d_t        type_g_apeb_d
DEFINE g_apeb_d_o        type_g_apeb_d
DEFINE g_apeb_d_mask_o   DYNAMIC ARRAY OF type_g_apeb_d #轉換遮罩前資料
DEFINE g_apeb_d_mask_n   DYNAMIC ARRAY OF type_g_apeb_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
 
 
DEFINE g_wc2_extend          STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
 
DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10     
DEFINE g_jump                LIKE type_t.num10        
DEFINE g_no_ask              LIKE type_t.num5        
DEFINE g_rec_b               LIKE type_t.num10           
DEFINE l_ac                  LIKE type_t.num10    
DEFINE g_curr_diag           ui.Dialog                         #Current Dialog
                                                               
DEFINE g_pagestart           LIKE type_t.num10                 
DEFINE gwin_curr             ui.Window                         #Current Window
DEFINE gfrm_curr             ui.Form                           #Current Form
DEFINE g_page_action         STRING                            #page action
DEFINE g_header_hidden       LIKE type_t.num5                  #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5                  #隱藏工作Panel
DEFINE g_page                STRING                            #第幾頁
DEFINE g_state               STRING       
DEFINE g_header_cnt          LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10                  #單身總筆數
DEFINE g_detail_idx          LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx_tmp      LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10                  #單身2目前所在筆數
DEFINE g_detail_idx_list     DYNAMIC ARRAY OF LIKE type_t.num10 #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10                  #Browser總筆數
DEFINE g_browser_idx         LIKE type_t.num10                  #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10                  #Browser目前所在筆數(暫存用)
DEFINE g_order               STRING                             #查詢排序欄位
                                                        
DEFINE g_current_row         LIKE type_t.num10                  #Browser所在筆數
DEFINE g_current_sw          BOOLEAN                            #Browser所在筆數用開關
DEFINE g_current_page        LIKE type_t.num10                  #目前所在頁數
DEFINE g_insert              LIKE type_t.chr5                   #是否導到其他page
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #是否顯示筆數提示訊息
DEFINE g_master_insert       BOOLEAN                       #確認單頭資料是否寫入
 
DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #log用
DEFINE g_log2                STRING                        #log用
DEFINE g_loc                 LIKE type_t.chr5              #判斷游標所在位置
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_update              BOOLEAN                       #確定單頭/身是否異動過
DEFINE g_idx_group           om.SaxAttributes              #頁籤群組
DEFINE g_master_commit       LIKE type_t.chr1              #確認單頭是否修改過
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
 
{<section id="aapt415.main" type="s" >}
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
   CALL cl_ap_init("aap","")
 
   #add-point:作業初始化 name="main.init"
   #161114-00017#2 --s mark
   ##151231-00010#1(S)
   #LET g_sql_ctrl = NULL
   #CALL s_control_get_supplier_sql('4',g_site,g_user,g_dept,'') RETURNING g_sub_success,g_sql_ctrl
   ##151231-00010#1(E)
   #161114-00017#2 --e mark
   #161114-00017#2 --s add
   #控制組條件
   LET g_sql_ctrl = NULL
   SELECT ooef017 INTO g_apea_m.apeacomp FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site AND ooefstus = 'Y'
   CALL cl_get_para(g_enterprise,g_apea_m.apeacomp,'S-FIN-2002') RETURNING g_sfin2002 #180927-00013#1 add
   #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apea_m.apeacomp) RETURNING g_sub_success,g_sql_ctrl  #161229-00047#45 mark
   #161114-00017#2 --e add   
   CALL s_fin_create_account_center_tmp()                      #展組織下階成員所需之暫存檔 
   CALL s_fin_azzi800_sons_query(g_today)                      #160125-00005#6
   CALL s_fin_account_center_sons_str() RETURNING g_wc_cs_orga #160125-00005#6
   CALL s_fin_get_wc_str(g_wc_cs_orga) RETURNING g_wc_cs_orga  #160125-00005#6
   #161229-00047#45 --s add
   CALL s_fin_account_center_comp_str() RETURNING g_wc_cs_comp   
   CALL s_fin_get_wc_str(g_wc_cs_comp) RETURNING g_wc_cs_comp      
   CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_wc_cs_comp) RETURNING g_sub_success,g_sql_ctrl
   #161229-00047#45 --e add     
   #161104-00046#4 --s add
   #建立與單頭array相同的temptable
   CALL s_aooi200def_create('','g_apea_m','','','','','','')RETURNING g_sub_success
   #單別控制組
   LET g_user_dept_wc = ''
   CALL s_fin_get_user_dept_control('','apeald','apeaent','apeadocno') RETURNING g_user_dept_wc
   #開窗使用
   LET g_user_dept_wc_q = g_user_dept_wc
   CALL s_control_get_docno_sql(g_user,g_dept) RETURNING g_sub_success,g_user_slip_wc  
   #161104-00046#4 --e add   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   #210121-00016#5 add -s
   LET g_forupd_sql = "SELECT apebseq,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld FROM apeb_t WHERE apebent=? AND apebdocno=? AND apebseq=? FOR UPDATE"
  
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aapt415_bcl1 CURSOR FROM g_forupd_sql
   #210121-00016#5 add -e
   #end add-point
   LET g_forupd_sql = " SELECT apeasite,'',apea003,'',apeadocdt,apeacomp,apeald,apeadocno,apea001,apea019,apea020,apea005,'',apea013,apea006,apeastus,apeaownid,'',apeaowndp,'',apeacrtid,'',apeacrtdp,'',apeacrtdt,apeamodid,'',apeamoddt,apeacnfid,'',apeacnfdt", 
                      " FROM apea_t",
                      " WHERE apeaent= ? AND apeadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aapt415_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
   CALL aapt415_chk_data_exist(g_forupd_sql)   #190806-00019
 
   LET g_sql = " SELECT DISTINCT t0.apeasite,t0.apea003,t0.apeadocdt,t0.apeacomp,t0.apeald,t0.apeadocno,t0.apea001,t0.apea019,t0.apea020,t0.apea005,t0.apea013,t0.apea006,t0.apeastus,t0.apeaownid,t0.apeaowndp,t0.apeacrtid,t0.apeacrtdp,t0.apeacrtdt,t0.apeamodid,t0.apeamoddt,t0.apeacnfid,t0.apeacnfdt,t1.ooag011 , 
       t2.ooefl003 ,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 ,t6.ooag011",
               " FROM apea_t t0",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.apeaownid  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.apeaowndp AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.apeacrtid  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.apeacrtdp AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.apeamodid  ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.apeacnfid  ",
 
               " WHERE t0.apeaent = " ||g_enterprise|| " AND t0.apeadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE aapt415_master_referesh FROM g_sql
 
    
 
 
   #190108-00038 ---start---
   
   #190108-00038 --- end ---
  
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      #190108-00038 ---modify start---
      OPEN WINDOW w_aapt415 WITH FORM cl_ap_formpath('aap',g_code)
      #190108-00038 --- modify end ---   
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL aapt415_init()   
 
      #進入選單 Menu (="N")
      CALL aapt415_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_aapt415
      
   END IF 
   
   CLOSE aapt415_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="aapt415.init" type="s" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION aapt415_init()
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
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
   LET g_err_rec = "N"   #161130-00056
      CALL cl_set_combo_scc_part('apeastus','13','N,Y,X,A,D,R,W')
 
      CALL cl_set_combo_scc('apea001','8507') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   LET g_wc2_extend = " 1=1" #清空查詢方案條件 #190730-00003#4 add
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #190108-00038 ---start---
   CALL gfrm_curr.setElementHidden('ui_change',1)   #隱藏畫面切換action
   #190108-00038 --- end ---
 
   #add-point:畫面資料初始化 name="init.init"
   CALL s_fin_set_comp_scc('apea019','43')  #年度
   CALL s_fin_set_comp_scc('apea020','111')   #期別
   CALL cl_set_combo_scc_part('apea001','8507','40') #限定選項範圍為 ('40') 
   CALL cl_set_combo_scc_part('apeb006','8310','10,20,30')
   CALL cl_set_combo_scc('apeb001','8530')   #180927-00013#1 add
   #end add-point
   
   #第一次進入init段時才跑default_search()，以避免後續作畫面轉換時因為重複執行init()段而導致g_wc條件值被異動
   IF cl_null(gs_first_time) OR gs_first_time <> "N" THEN   #190108-00038
      #初始化搜尋條件
      CALL aapt415_default_search()
   END IF   #190108-00038
    
END FUNCTION
 
{</section>}
 
{<section id="aapt415.chk_data_exist" type="s" >}
#+ 異動前先確認該筆資料是否存在
PRIVATE FUNCTION aapt415_chk_data_exist(ps_sql)
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
   PREPARE aapt415_chk_data_exist_pre FROM ls_sql
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'PREPARE aapt415_chk_data_exist_pre ERROR'
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.ui_dialog" type="s" >}
#+ 功能選單
PRIVATE FUNCTION aapt415_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE lb_first   BOOLEAN
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING
   DEFINE la_output  DYNAMIC ARRAY OF STRING   #報表元件鬆耦合使用
   DEFINE  l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE  l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE  l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_arg             STRING                 #報表作業cmdrun使用
   #(ver:87) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:87) --- add end ---
   #add-point:ui_dialog段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_cn            LIKE type_t.num10     #151125-00006#2
   #180326-00045#1 add ------
   DEFINE l_sql           STRING
   DEFINE l_n             LIKE type_t.num5
   DEFINE l_apeb024       LIKE apeb_t.apeb024
   #180326-00045#1 add end---
   #210121-00016#5 add -s
   DEFINE l_count         LIKE type_t.num5
   DEFINE lc_param_link   RECORD
          prog            STRING,
          param           DYNAMIC ARRAY OF STRING,
          default_wc      STRING,
          deputy          STRING
          END RECORD 
   #210121-00016#5 add -e
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   #因應查詢方案進行處理
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
            CALL aapt415_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   LET lb_first = TRUE
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE 
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_apea_m.* TO NULL
         CALL g_apeb_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL aapt415_init()
      END IF
   
      #190108-00038 ---start---
      
      #190108-00038 --- end ---
 
      CALL lib_cl_dlg.cl_dlg_before_display()
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
         #左側瀏覽頁簽
         DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTES(COUNT=g_header_cnt)
            BEFORE ROW
               #回歸舊筆數位置 (回到當時異動的筆數)
               LET g_current_idx = DIALOG.getCurrentRow("s_browse")
               IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
                  CALL DIALOG.setCurrentRow("s_browse",g_current_row)
                  LET g_current_idx = g_current_row
               END IF
               LET g_current_row = g_current_idx #目前指標
               LET g_current_sw = TRUE
         
               IF g_current_idx > g_browser.getLength() THEN
                  LET g_current_idx = g_browser.getLength()
               END IF 
               
               CALL aapt415_fetch('') # reload data
               LET l_ac = 1
               CALL aapt415_ui_detailshow() #Setting the current row 
         
               CALL aapt415_idx_chk()
               #NEXT FIELD apebseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_apeb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL aapt415_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               #210121-00016#5 add - s
               IF cl_null(g_apeb_d[l_ac].apeb024) AND g_apea_m.apeastus = 'Y' THEN 
                  CALL cl_set_act_visible("change_payment",TRUE)  
               ELSE
                  CALL cl_set_act_visible("change_payment",FALSE)
               END IF
               #210121-00016#5 add -e
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL aapt415_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION change_payment
            LET g_action_choice="change_payment"
            IF cl_auth_chk_act("change_payment") THEN
               
               #add-point:ON ACTION change_payment name="menu.detail_show.page1.change_payment"
               #210121-00016#5 add -s
               IF cl_null(g_apeb_d[g_detail_idx].apeb024) AND g_apea_m.apeastus = 'Y' THEN
                  CALL aapt415_change_payment()
               END IF
               #210121-00016#5 add -e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION detail_qrystr
               MENU "" ATTRIBUTE(STYLE="popup")
                  #add-point:ON ACTION detail_qrystr相關動作 name="menu.detail_show.page1_sub.detail_qrystr"
                  #210121-00016#5 add -s
                  BEFORE MENU
                     IF cl_null(g_apeb_d[l_ac].apeb024) THEN 
                        EXIT MENU
                     END IF
                     #存在付款时分别对应显示anmt440和anmt460
                     LET l_count = 0
                     SELECT COUNT(1) INTO l_count
                       FROM nmck_t,nmcl_t
                      WHERE nmckent = nmclent AND nmckent = g_enterprise
                        AND nmckcomp = nmclcomp AND nmckcomp = g_apea_m.apeacomp
                        AND nmckdocno = nmcldocno
                        AND nmck001 = 'IV'
                        AND nmcl001 = g_apea_m.apeadocno AND nmcl002 = g_apeb_d[l_ac].apebseq
                        AND nmckstus <> 'X'
                     IF cl_null(l_count) THEN LET l_count = 0 END IF
                     IF l_count > 0 THEN
                        HIDE OPTION "prog_aapt420" 
                        #anmt440
                        LET l_count = 0
                        SELECT COUNT(1) INTO l_count
                          FROM nmck_t,nmcl_t
                         WHERE nmckent = nmclent AND nmckent = g_enterprise
                           AND nmckcomp = nmclcomp AND nmckcomp = g_apea_m.apeacomp
                           AND nmckdocno = nmcldocno
                           AND nmck001 = 'IV'
                           AND nmcl001 = g_apea_m.apeadocno AND nmcl002 = g_apeb_d[l_ac].apebseq
                           AND nmckstus <> 'X'
                           AND nmck002 IN (SELECT ooia001 FROM ooia_t WHERE ooiaent = g_enterprise AND ooia002 = '30')
                        IF cl_null(l_count) THEN LET l_count = 0 END IF
                        IF l_count = 0 THEN
                           HIDE OPTION "prog_anmt440" 
                        END IF
                        #anmt460
                        LET l_count = 0
                        SELECT COUNT(1) INTO l_count
                          FROM nmck_t,nmcl_t
                         WHERE nmckent = nmclent AND nmckent = g_enterprise
                           AND nmckcomp = nmclcomp AND nmckcomp = g_apea_m.apeacomp
                           AND nmckdocno = nmcldocno
                           AND nmck001 = 'IV'
                           AND nmcl001 = g_apea_m.apeadocno AND nmcl002 = g_apeb_d[l_ac].apebseq
                           AND nmckstus <> 'X'
                           AND nmck002 IN (SELECT ooia001 FROM ooia_t WHERE ooiaent = g_enterprise AND (ooia002 = '20' OR ooia002 = '10'))
                        IF cl_null(l_count) THEN LET l_count = 0 END IF
                        IF l_count = 0 THEN
                           HIDE OPTION "prog_anmt460" 
                        END IF
                     ELSE
                        HIDE OPTION "prog_anmt440" 
                        HIDE OPTION "prog_anmt460" 
                     END IF
                  #210121-00016#5 add -e
                  #END add-point
                                 #應用 a43 樣板自動產生(Version:4)
               ON ACTION prog_aapt420
                  LET g_action_choice="prog_aapt420"
                  IF cl_auth_chk_act("prog_aapt420") THEN
                     
                     #add-point:ON ACTION prog_aapt420 name="menu.detail_show.page1_sub.prog_aapt420"
                     #210121-00016#5 add -s
                     #應用 a41 樣板自動產生(Version:3)
                     #使用JSON格式組合參數與作業編號(串查)
                     IF g_apeb_d[l_ac].apeb024 = 'MULTI' THEN
                        INITIALIZE lc_param_link.* TO NULL 
                        LET lc_param_link.prog = 'aapt420'
                        LET lc_param_link.default_wc = " apdald = '",g_apea_m.apeald,"' ",
                                                       " AND apdadocno IN (SELECT apcedocno ",
                                                       "                     FROM apda_t,apce_t ",
                                                       "                    WHERE apdaent = apceent AND apdaent = ",g_enterprise,
                                                       "                      AND apdald = apceld AND apdald = '",g_apea_m.apeald,"' ",
                                                       "                      AND apdadocno = apcedocno ",
                                                       "                      AND apdastus <> 'X' ",
                                                       "                      AND apce049 = '",g_apea_m.apeadocno,"' AND apce050 = ",g_apeb_d[l_ac].apebseq,")"
                        LET ls_js = util.JSON.stringify(lc_param_link)
                     ELSE
                        INITIALIZE la_param.* TO NULL
                        LET la_param.prog     = 'aapt420'
                        LET la_param.param[1] = g_apea_m.apeald
                        LET la_param.param[2] = g_apeb_d[l_ac].apeb024
                        LET ls_js = util.JSON.stringify(la_param)
                     END IF
                     CALL cl_cmdrun(ls_js)
                     #210121-00016#5 add -e
                     #END add-point
                     
                  END IF
 
 
 
               #應用 a43 樣板自動產生(Version:4)
               ON ACTION prog_anmt440
                  LET g_action_choice="prog_anmt440"
                  IF cl_auth_chk_act("prog_anmt440") THEN
                     
                     #add-point:ON ACTION prog_anmt440 name="menu.detail_show.page1_sub.prog_anmt440"
                     #210121-00016#5 add -s
                     #應用 a41 樣板自動產生(Version:3)
                     #使用JSON格式組合參數與作業編號(串查)
                     INITIALIZE la_param.* TO NULL
                     LET la_param.prog     = 'anmt440'
                     LET la_param.param[5] = g_apea_m.apeacomp
                     LET la_param.param[6] = g_apeb_d[l_ac].apeb024
                     LET ls_js = util.JSON.stringify(la_param)
                     CALL cl_cmdrun(ls_js)
                     #210121-00016#5 add -e
                     #END add-point
                     
                  END IF
 
 
 
               #應用 a43 樣板自動產生(Version:4)
               ON ACTION prog_anmt460
                  LET g_action_choice="prog_anmt460"
                  IF cl_auth_chk_act("prog_anmt460") THEN
                     
                     #add-point:ON ACTION prog_anmt460 name="menu.detail_show.page1_sub.prog_anmt460"
                     #210121-00016#5 add -s
                     #應用 a41 樣板自動產生(Version:3)
                     #使用JSON格式組合參數與作業編號(串查)
                     IF g_apeb_d[l_ac].apeb024 = 'MULTI' THEN
                        INITIALIZE lc_param_link.* TO NULL 
                        LET lc_param_link.prog = 'anmt460'
                        LET lc_param_link.default_wc = " nmckcomp = '",g_apea_m.apeacomp,"' ",
                                                       " AND nmckdocno IN (SELECT nmcldocno ",
                                                       "                     FROM nmck_t,nmcl_t ",
                                                       "                    WHERE nmckent = nmclent AND nmckent = ",g_enterprise,
                                                       "                      AND nmckcomp = nmclcomp AND nmckcomp = '",g_apea_m.apeacomp,"' ",
                                                       "                      AND nmckdocno = nmcldocno ",
                                                       "                      AND nmck001 = 'IV' ",
                                                       "                      AND nmckstus <> 'X' ",
                                                       "                      AND nmcl001 = '",g_apea_m.apeadocno,"' AND nmcl002 = ",g_apeb_d[l_ac].apebseq,")"
                        LET ls_js = util.JSON.stringify(lc_param_link)
                     ELSE
                        INITIALIZE la_param.* TO NULL
                        LET la_param.prog     = 'anmt460'
                        LET la_param.param[1] = g_apea_m.apeacomp
                        LET la_param.param[2] = g_apeb_d[l_ac].apeb024
                        LET ls_js = util.JSON.stringify(la_param)
                     END IF
                     CALL cl_cmdrun(ls_js)
                     #210121-00016#5 add -e
                     #END add-point
                     
                  END IF
 
 
 
 
               END MENU
 
 
 
               #add-point:ON ACTION detail_qrystr name="menu.detail_show.page1.detail_qrystr"
               
               #END add-point
 
 
 
 
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1 
            #先填充browser資料
            #190108-00038 ---modify start---
         #  CALL aapt415_browser_fill("")   #190114-00003 mark
         #  IF g_action_choice <> "ui_change" THEN   #190114-00003
            IF g_action_choice = "ui_change" THEN
               DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
               DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數
               DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
               DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數
               DISPLAY g_detail_idx  TO FORMONLY.idx       #單身當下筆數
               DISPLAY g_detail_cnt  TO FORMONLY.cnt       #單身總筆數
            ELSE
               CALL aapt415_browser_fill("")
            END IF
            #190108-00038 --- modify end ---
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            LET g_current_idx = DIALOG.getCurrentRow("s_browse")
            IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
               CALL DIALOG.setCurrentRow("s_browse",g_current_row)
               LET g_current_idx = g_current_row
            END IF
            
            #確保g_current_idx位於正常區間內
            #小於,等於0則指到第1筆
            IF g_current_idx <= 0 THEN
               LET g_current_idx = 1
            END IF
            #超過最大筆數則指到最後1筆
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF 
            
            LET g_current_sw = TRUE
            LET g_current_row = g_current_idx #目前指標
            
            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL aapt415_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL aapt415_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL aapt415_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL aapt415_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL aapt415_set_act_visible()   
            CALL aapt415_set_act_no_visible()
            IF NOT (g_apea_m.apeadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " apeaent = " ||g_enterprise|| " AND",
                                  " apeadocno = '", g_apea_m.apeadocno, "' "
 
               #填到對應位置
               CALL aapt415_browser_fill("")
            END IF
         #應用 a32 樣板自動產生(Version:4)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            LET g_action_choice = "bpmstatus"   #181128-00048
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu.bpm_status"
            
            #END add-point
 
 
 
          
         #查詢方案選擇 
         ON ACTION queryplansel
            LET g_action_choice = "queryplan" #ver:81
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               LET g_wc2_extend = " 1=1" #190730-00003#4 add
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "apea_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "apeb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend)
                                            AND NOT g_wc2.getIndexOf(g_wc2_extend,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend            #200917-00047
                  END IF
 
                  #LET g_wc2 = g_wc2_extend  #190730-00003#4 add
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  
                  #190730-00003#4 -S-
                  IF g_wc2.subString(1,4) = " OR " THEN
                     LET g_wc2 = g_wc2.subString(5,g_wc2.getLength())
                  END IF 
                  #190730-00003#4 -E-
                  
               END IF
               CALL aapt415_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
               LET g_wc2_extend = " 1=1" #190730-00003#4 add
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            LET g_action_choice = "queryplan" #ver:81
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               LET g_wc2_extend = " 1=1" #190730-00003#4 add
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE   
                     WHEN la_wc[li_idx].tableid = "apea_t"                   
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "apeb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend)
                                            AND NOT g_wc2.getIndexOf(g_wc2_extend,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend              #200917-00047
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL aapt415_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL aapt415_fetch("F")
                  END IF
                  LET g_wc2_extend = " 1=1" #190730-00003#4 add
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            CALL cl_notice()
          
         #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL aapt415_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL aapt415_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt415_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL aapt415_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt415_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL aapt415_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt415_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL aapt415_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt415_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL aapt415_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL aapt415_idx_chk()
          
         #excel匯出功能          
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:87) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
             
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     #browser
                     CALL g_export_node.clear()
                     IF g_main_hidden = 1 THEN
                        LET l_arr_len = g_browser.getLength()
                        LET g_export_tabname[1] = "s_browse"
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_browser[l_arr_cnt]
                        END FOR
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_poi"
                        
                        #END add-point
                        CALL cl_export_poi()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_after_poi"
                        
                        #END add-point
                     #非browser
                     ELSE
                        LET l_arr_len = g_apeb_d.getLength()
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[1] = "s_detail1"
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_apeb_d[l_arr_cnt]
                        END FOR
 
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                        
                        #END add-point
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_poi()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                        
                        #END add-point
                     END IF
 
                  OTHERWISE   #使用原始樣板
               #(ver:87) --- end ---
               
                     #browser
                     CALL g_export_node.clear()
                     IF g_main_hidden = 1 THEN
                        LET g_export_node[1] = base.typeInfo.create(g_browser)
                        LET g_export_id[1]   = "s_browse"
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser"   #(ver:80)
                        
                        #END add-point
                        CALL cl_export_to_excel()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_browser_after"   #(ver:80)
                        
                        #END add-point
                     #非browser
                     ELSE
                        LET g_export_node[1] = base.typeInfo.create(g_apeb_d)
                        LET g_export_id[1]   = "s_detail1"
 
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                        
                        #END add-point
                        CALL cl_export_to_excel_getpage()
                        CALL cl_export_to_excel()
                        #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:80)
                        
                        #END add-point
                     END IF
               END CASE   #(ver:87) add
            END IF
        
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
 
         #180226-00040 ---modify start---
         #主頁摺疊
         ON ACTION mainhidden       
            #(ver:85) ---start---
            #add-point:ui_dialog段 mainhidden name="ui_dialog.mainhidden"
            
            #end add-point
            #(ver:85) --- end ---
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
         #180226-00040 --- modify end ---
            
         #瀏覽頁折疊
         ON ACTION worksheethidden   
            #(ver:85) ---start---
            #add-point:ui_dialog段 worksheethidden name="ui_dialog.worksheethidden"
            
            #end add-point
            #(ver:85) --- end ---
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
            IF lb_first THEN
               LET lb_first = FALSE
               NEXT FIELD apebseq
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
    
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL aapt415_modify()
               #add-point:ON ACTION modify name="menu.modify"
               #151125-00006#2---s
               CALL aapt415_immediately_conf()
               SELECT COUNT(*) INTO l_cn FROM apea_t 
               WHERE apeaent  = g_enterprise  AND apeadocno = g_apea_m.apeadocno
               IF l_cn > 0 THEN
                  CALL aapt415_ui_headershow()
               END IF
               #151125-00006#2---e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL aapt415_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               #151125-00006#2---s
               CALL aapt415_immediately_conf()
               SELECT COUNT(*) INTO l_cn FROM apea_t 
               WHERE apeaent  = g_enterprise  AND apeadocno = g_apea_m.apeadocno
               IF l_cn > 0 THEN
                  CALL aapt415_ui_headershow()
               END IF
               #151125-00006#2---e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION aapt415_paychk
            LET g_action_choice="aapt415_paychk"
            IF cl_auth_chk_act("aapt415_paychk") THEN
               
               #add-point:ON ACTION aapt415_paychk name="menu.aapt415_paychk"
               #180326-00045#1 add ------
               LET l_n = 0
               SELECT COUNT(1) INTO l_n
                 FROM apeb_t
                WHERE apebent = g_enterprise
                  AND apebdocno = g_apea_m.apeadocno
                  AND apeb024 IS NOT NULL
               IF cl_null(l_n) THEN LET l_n = 0 END IF
               IF l_n = 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = 'anm-09526' #此單尚未有付款紀錄，不可使用已付款註記功能!!
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  EXIT DIALOG
               END IF
               
               LET l_n = 0
               LET l_sql = "SELECT DISTINCT apeb024",
                           "  FROM apeb_t ",
                           " WHERE apebent = ",g_enterprise,
                           "   AND apebdocno = '",g_apea_m.apeadocno,"'",
                           "   AND apeb024 IS NOT NULL"
               PREPARE aapt415_sel_apeb_p1 FROM l_sql
               DECLARE aapt415_sel_apeb_c1 CURSOR FOR aapt415_sel_apeb_p1
               
               LET l_sql = "SELECT COUNT(1)",
                           "  FROM nmck_t ",
                           " WHERE nmckent = ",g_enterprise,
                           "   AND nmckstus = 'Y'",
                           "   AND nmckdocno = ?"
               PREPARE aapt415_sel_nmck_p1 FROM l_sql
               
               LET l_sql = "SELECT COUNT(1)",
                           "  FROM apda_t ",
                           " WHERE apdaent = ",g_enterprise,
                           "   AND apdastus = 'Y'",
                           "   AND apdadocno = ?"
               PREPARE aapt415_sel_apda_p1 FROM l_sql
               
               FOREACH aapt415_sel_apeb_c1 INTO l_apeb024
                  #anmt440/anmt460
                  EXECUTE aapt415_sel_nmck_p1 USING l_apeb024 INTO l_n
                  IF cl_null(l_n) THEN LET l_n = 0 END IF
                  IF l_n > 0 THEN EXIT FOREACH END IF #有一筆狀態=Y表示OK可以PASS
                  #aapt420
                  EXECUTE aapt415_sel_apda_p1 USING l_apeb024 INTO l_n
                  IF cl_null(l_n) THEN LET l_n = 0 END IF
                  IF l_n > 0 THEN EXIT FOREACH END IF
               END FOREACH
               
               IF g_apea_m.apea013='N' THEN
                  #若單身付款單號的狀態至少要有一筆=Y，才可以已註款註記=Y
                  IF l_n = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code   = 'anm-09527' #此付款單號尚未確認，不可使用已付款註記功能!!
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     EXIT DIALOG
                  END IF
               ELSE
                  #若單身付款單號的狀態，狀態都要=N，才能把已付款註記改成=N
                  IF l_n > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code   = 'anm-09528' #此付款單號尚有確認單據，不可取消已付款註記!!
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     EXIT DIALOG
                  END IF
               END IF
               #180326-00045#1 add end---
               
               IF g_apea_m.apeastus != 'Y' THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.extend = ""
                   LET g_errparam.code   = 'aap-00324'
                   LET g_errparam.popup  = TRUE
                   CALL cl_err()
               ELSE
                  IF g_apea_m.apea013 = 'Y' THEN
                     LET g_apea_m.apea013 = 'N'
                     DISPLAY BY NAME g_apea_m.apea013
                     UPDATE apea_t
                     SET apea013 = 'N',apeamodid = g_user,
                         apeamoddt = g_today
                     WHERE apeaent = g_enterprise
                       AND apeadocno = g_apea_m.apeadocno
                  ELSE
                     LET g_apea_m.apea013 = 'Y'
                     DISPLAY BY NAME g_apea_m.apea013
                     UPDATE apea_t
                     SET apea013 = 'Y',apeamodid = g_user,
                         apeamoddt = g_today
                     WHERE apeaent = g_enterprise
                       AND apeadocno = g_apea_m.apeadocno
                  END IF
                  
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = 'adz-00217'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL aapt415_delete()
               #add-point:ON ACTION delete name="menu.delete"
               #191203-00012#8---add---(S)
               CALL aapt415_set_act_visible()
               CALL aapt415_set_act_no_visible()
               #191203-00012#8---add---(E)
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL aapt415_insert()
               #add-point:ON ACTION insert name="menu.insert"
               #151125-00006#2---s
               CALL aapt415_immediately_conf()
               SELECT COUNT(*) INTO l_cn FROM apea_t 
               WHERE apeaent  = g_enterprise  AND apeadocno = g_apea_m.apeadocno
               IF l_cn > 0 THEN
                  CALL aapt415_ui_headershow()
               END IF
               #151125-00006#2---e
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               LET g_rep_wc = " apeaent = '",g_enterprise,"'  AND apeald = '",g_apea_m.apeald,"' AND apeadocno = '",g_apea_m.apeadocno,"' " #170608-00007#1
               #END add-point
               &include "erp/aap/aapt415_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               LET g_rep_wc = " apeaent = '",g_enterprise,"'  AND apeald = '",g_apea_m.apeald,"' AND apeadocno = '",g_apea_m.apeadocno,"' " #170608-00007#1
               #END add-point
               &include "erp/aap/aapt415_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL aapt415_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_apea003
            LET g_action_choice="prog_apea003"
            IF cl_auth_chk_act("prog_apea003") THEN
               
               #add-point:ON ACTION prog_apea003 name="menu.prog_apea003"
               #應用 a45 樣板自動產生(Version:2)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_apea_m.apea003)
 


               #END add-point
               
            END IF
 
 
 
 
 
            #180611-00048
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL aapt415_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL aapt415_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL aapt415_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_apea_m.apeadocdt)
 
 
 
         
         #190108-00038 ---start---
         
         #190108-00038 --- end ---
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
    
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:79) ---add start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:79) --- add end ---
    
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
    
   END WHILE    
      
   CALL cl_set_act_visible("accept,cancel", TRUE)
    
END FUNCTION
 
{</section>}
 
{<section id="aapt415.browser_fill" type="s" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION aapt415_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_ld_str          STRING #161114-00017#2 add
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   
   #end add-point
   
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
 
   #add-point:browser_fill,foreach前 name="browser_fill.before_foreach"
   #161114-00017#2 --s add
   CALL s_axrt300_get_site(g_user,'','2') RETURNING l_ld_str  
   LET l_ld_str = cl_replace_str(l_ld_str,"glaald","apeald")
   LET l_wc = l_wc," AND ",l_ld_str
   #161114-00017#2 --e add
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT apeadocno ",
                      " FROM apea_t ",
                      " ",
                      " LEFT JOIN apeb_t ON apebent = apeaent AND apeadocno = apebdocno ", "  ",
                      #add-point:browser_fill段sql(apeb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE apeaent = " ||g_enterprise|| " AND apebent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("apea_t") 
                      ," AND ", g_wc2_extend #190730-00003#4 add
 
  ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT apeadocno ",
                      " FROM apea_t ", 
                      "  ",
                      "  ",
                      " WHERE apeaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("apea_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
   #end add-point
   
#  LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"   #200804-00006 mark
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,") PGS_A01"   #200804-00006
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
   
   #end add-point
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
      FREE header_cnt_pre
   END IF
    
   IF g_browser_cnt > g_max_browse THEN
      #若是因為切換畫面的話，不用再次顯示超過最大顯示筆數的訊息
      IF cl_null(g_action_choice) OR g_action_choice <> "ui_change" THEN   #190108-00038
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = g_browser_cnt
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
         END IF
      END IF   #190108-00038
      LET g_browser_cnt = g_max_browse
   END IF
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
 
   #根據行為確定資料填充位置及WC
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM                
      INITIALIZE g_apea_m.* TO NULL
      CALL g_apeb_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.apeasite,t0.apea003,t0.apeadocdt,t0.apeadocno,t0.apea005,t0.apea013,t0.apea017 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.apeastus,t0.apeasite,t0.apea003,t0.apeadocdt,t0.apeadocno,t0.apea005,t0.apea013,t0.apea017,t1.ooag011 ,t2.pmaal004 ",
                    " FROM apea_t t0",
                  "  ",
                  "  LEFT JOIN apeb_t ON apebent = apeaent AND apeadocno = apebdocno ", "  ", 
                  #add-point:browser_fill段sql(apeb_t1) name="browser_fill.join.apeb_t1"
                            
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.apea003  ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.apea005 AND t2.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.apeaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("apea_t")
                  ," AND ",g_wc2_extend #190730-00003#4 add 
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.apeastus,t0.apeasite,t0.apea003,t0.apeadocdt,t0.apeadocno,t0.apea005,t0.apea013,t0.apea017,t1.ooag011 ,t2.pmaal004 ",
                  " FROM apea_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.apea003  ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.apea005 AND t2.pmaal002='"||g_dlang||"' ",
 
                  " WHERE t0.apeaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("apea_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   #151231-00010#1(S)
   IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
      LET g_sql = g_sql," AND EXISTS (SELECT 1 FROM pmaa_t ",
                        "              WHERE pmaaent = ",g_enterprise,
                        "                AND ",g_sql_ctrl,
                        "                AND pmaaent = apeaent ",
                        "                AND pmaa001 = apea005 )"
   END IF
   #151231-00010#1(E)   
   #end add-point
   LET g_sql = g_sql," ORDER BY apeadocno ",g_order       #200917-00047 mark   #201005-00006 remark
#  LET g_sql = " SELECT * FROM (",g_sql,") t01_eff ORDER BY apeadocno ",g_order   #200917-00047   #201005-00006 mark
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"apea_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      display "g_sql:",g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      display 'SQL:',g_sql
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_apeasite,g_browser[g_cnt].b_apea003,g_browser[g_cnt].b_apeadocdt,g_browser[g_cnt].b_apeadocno,g_browser[g_cnt].b_apea005,g_browser[g_cnt].b_apea013,g_browser[g_cnt].b_apea017,g_browser[g_cnt].b_apea003_desc,g_browser[g_cnt].b_apea005_desc 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         #190901-00001#1 add(s)
         SELECT SUM(apeb118) INTO g_browser[g_cnt].b_apea017 FROM apeb_t
         WHERE apebent = g_enterprise
           AND apebdocno = g_browser[g_cnt].b_apeadocno         
         #190901-00001#1 add(e)
         #end add-point
      
         #遮罩相關處理
         CALL aapt415_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_browse THEN
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
   
   IF cl_null(g_browser[g_cnt].b_apeadocno) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt  = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   
   #筆數顯示
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
      DISPLAY g_detail_idx  TO FORMONLY.idx     #單身當下筆數
      DISPLAY g_detail_cnt  TO FORMONLY.cnt     #單身總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
      DISPLAY '' TO FORMONLY.idx     #單身當下筆數
      DISPLAY '' TO FORMONLY.cnt     #單身總筆數
   END IF
 
   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0
 
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
                  
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   #191203-00012#8---add---(S)
   CALL aapt415_set_act_visible()
   CALL aapt415_set_act_no_visible()
   #191203-00012#8---add---(E)
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.ui_headershow" type="s" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION aapt415_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
 
   IF g_browser.getLength() > 0 AND g_current_idx > 0 THEN   #200828-00027檢查後進入,避免資料溢位 (代追單)
      LET g_apea_m.apeadocno = g_browser[g_current_idx].b_apeadocno   
 
      EXECUTE aapt415_master_referesh USING g_apea_m.apeadocno INTO g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid, 
          g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp_desc,g_apea_m.apeamodid_desc,g_apea_m.apeacnfid_desc 
 
      
      CALL aapt415_apea_t_mask()
      CALL aapt415_show()
   END IF   #200828-00027
      
END FUNCTION
 
{</section>}
 
{<section id="aapt415.ui_detailshow" type="s" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION aapt415_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.ui_browser_refresh" type="s" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION aapt415_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point    
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_apeadocno = g_apea_m.apeadocno 
 
         THEN
         CALL g_browser.deleteElement(l_i)
         EXIT FOR
      END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
    
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:ui_browser_refresh段after name="ui_browser_refresh.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.construct" type="s" >}
#+ QBE資料查詢
PRIVATE FUNCTION aapt415_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point    
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING 
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   DEFINE lp_str      STRING   #201109-00009
   #add-point:cs段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   DEFINE l_ld_str          STRING #161114-00017#2 add
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_apea_m.* TO NULL
   CALL g_apeb_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   LET g_site_str = NULL   #161114-00017#2 add
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON apeasite,apeasite_desc,apea003,apea003_desc,apeadocdt,apeacomp,apeald,apeadocno,apea001,apea019,apea020,apea005,apea005_desc,apea013,apea006,apeastus,apeaownid,apeaowndp,apeacrtid,apeacrtdp,apeacrtdt,apeamodid,apeamoddt,apeacnfid,apeacnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<apeacrtdt>>----
         AFTER FIELD apeacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<apeamoddt>>----
         AFTER FIELD apeamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<apeacnfdt>>----
         AFTER FIELD apeacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<apeapstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.apeasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeasite
            #add-point:ON ACTION controlp INFIELD apeasite name="construct.c.apeasite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apea_m.apeasite
            #LET g_qryparam.where = " ooef206 = 'Y' " #160812-00027#1 mark
            #CALL q_ooef001()     #161006-00005#4  mark
            CALL q_ooef001_33()   #161006-00005#4  add
            DISPLAY g_qryparam.return1 TO apeasite
            NEXT FIELD apeasite
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeasite
            #add-point:BEFORE FIELD apeasite name="construct.b.apeasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeasite
            
            #add-point:AFTER FIELD apeasite name="construct.a.apeasite"
            CALL FGL_DIALOG_GETBUFFER() RETURNING g_site_str #161114-00017#2 add
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeasite_desc
            #add-point:BEFORE FIELD apeasite_desc name="construct.b.apeasite_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeasite_desc
            
            #add-point:AFTER FIELD apeasite_desc name="construct.a.apeasite_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apeasite_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeasite_desc
            #add-point:ON ACTION controlp INFIELD apeasite_desc name="construct.c.apeasite_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea003
            #add-point:BEFORE FIELD apea003 name="construct.b.apea003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea003
            
            #add-point:AFTER FIELD apea003 name="construct.a.apea003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apea003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apea003
            #add-point:ON ACTION controlp INFIELD apea003 name="construct.c.apea003"
            #請款人員
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()
            DISPLAY g_qryparam.return1 TO apea003
            NEXT FIELD apea003
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea003_desc
            #add-point:BEFORE FIELD apea003_desc name="construct.b.apea003_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea003_desc
            
            #add-point:AFTER FIELD apea003_desc name="construct.a.apea003_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apea003_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea003_desc
            #add-point:ON ACTION controlp INFIELD apea003_desc name="construct.c.apea003_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeadocdt
            #add-point:BEFORE FIELD apeadocdt name="construct.b.apeadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeadocdt
            
            #add-point:AFTER FIELD apeadocdt name="construct.a.apeadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apeadocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeadocdt
            #add-point:ON ACTION controlp INFIELD apeadocdt name="construct.c.apeadocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeacomp
            #add-point:BEFORE FIELD apeacomp name="construct.b.apeacomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeacomp
            
            #add-point:AFTER FIELD apeacomp name="construct.a.apeacomp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apeacomp
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeacomp
            #add-point:ON ACTION controlp INFIELD apeacomp name="construct.c.apeacomp"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeald
            #add-point:BEFORE FIELD apeald name="construct.b.apeald"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeald
            
            #add-point:AFTER FIELD apeald name="construct.a.apeald"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apeald
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeald
            #add-point:ON ACTION controlp INFIELD apeald name="construct.c.apeald"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeadocno
            #add-point:BEFORE FIELD apeadocno name="construct.b.apeadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeadocno
            
            #add-point:AFTER FIELD apeadocno name="construct.a.apeadocno"
   

            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apeadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeadocno
            #add-point:ON ACTION controlp INFIELD apeadocno name="construct.c.apeadocno"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161111-00042#2 --s add
            #控制組條件
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
                                      "          WHERE pmaaent = ",g_enterprise,
                                      "            AND ",g_sql_ctrl,
                                      "            AND pmaaent = apeaent ",
                                      "            AND pmaa001 = apea005 )"
            END IF
            #查詢依帳套權限管理
            CALL s_axrt300_get_site(g_user,g_site_str,'2') RETURNING l_ld_str
            LET l_ld_str = cl_replace_str(l_ld_str,"glaald","apeald")
            LET g_qryparam.where = g_qryparam.where, " AND ",l_ld_str
            #161111-00042#2 --e add
            #161104-00046#4 --s add
            #單別權限控管
            IF NOT cl_null(g_user_dept_wc_q) AND NOT g_user_dept_wc_q = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND ",g_user_dept_wc_q CLIPPED
            END IF
            #161104-00046#4 --e add
            CALL q_apeadocno()
            DISPLAY g_qryparam.return1 TO apeadocno      #顯示到畫面上
            NEXT FIELD apeadocno
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea001
            #add-point:BEFORE FIELD apea001 name="construct.b.apea001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea001
            
            #add-point:AFTER FIELD apea001 name="construct.a.apea001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apea001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea001
            #add-point:ON ACTION controlp INFIELD apea001 name="construct.c.apea001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea019
            #add-point:BEFORE FIELD apea019 name="construct.b.apea019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea019
            
            #add-point:AFTER FIELD apea019 name="construct.a.apea019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apea019
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea019
            #add-point:ON ACTION controlp INFIELD apea019 name="construct.c.apea019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea020
            #add-point:BEFORE FIELD apea020 name="construct.b.apea020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea020
            
            #add-point:AFTER FIELD apea020 name="construct.a.apea020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apea020
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea020
            #add-point:ON ACTION controlp INFIELD apea020 name="construct.c.apea020"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apea005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apea005
            #add-point:ON ACTION controlp INFIELD apea005 name="construct.c.apea005"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #151231-00010#1(S)
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
                                      "          WHERE pmaaent = ",g_enterprise,
                                      "            AND ",g_sql_ctrl,
                                      "            AND pmaaent = apcaent ",
                                      "            AND pmaa001 = apca005 )"
            END IF
            #151231-00010#1(E)
            CALL q_apca005()
            DISPLAY g_qryparam.return1 TO apea005
            NEXT FIELD apea005
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea005
            #add-point:BEFORE FIELD apea005 name="construct.b.apea005"
         
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea005
            
            #add-point:AFTER FIELD apea005 name="construct.a.apea005"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea005_desc
            #add-point:BEFORE FIELD apea005_desc name="construct.b.apea005_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea005_desc
            
            #add-point:AFTER FIELD apea005_desc name="construct.a.apea005_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apea005_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea005_desc
            #add-point:ON ACTION controlp INFIELD apea005_desc name="construct.c.apea005_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea013
            #add-point:BEFORE FIELD apea013 name="construct.b.apea013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea013
            
            #add-point:AFTER FIELD apea013 name="construct.a.apea013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apea013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea013
            #add-point:ON ACTION controlp INFIELD apea013 name="construct.c.apea013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea006
            #add-point:BEFORE FIELD apea006 name="construct.b.apea006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea006
            
            #add-point:AFTER FIELD apea006 name="construct.a.apea006"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apea006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea006
            #add-point:ON ACTION controlp INFIELD apea006 name="construct.c.apea006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeastus
            #add-point:BEFORE FIELD apeastus name="construct.b.apeastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeastus
            
            #add-point:AFTER FIELD apeastus name="construct.a.apeastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.apeastus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeastus
            #add-point:ON ACTION controlp INFIELD apeastus name="construct.c.apeastus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apeaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeaownid
            #add-point:ON ACTION controlp INFIELD apeaownid name="construct.c.apeaownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()
            DISPLAY g_qryparam.return1 TO apeaownid
            NEXT FIELD apeaownid
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeaownid
            #add-point:BEFORE FIELD apeaownid name="construct.b.apeaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeaownid
            
            #add-point:AFTER FIELD apeaownid name="construct.a.apeaownid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apeaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeaowndp
            #add-point:ON ACTION controlp INFIELD apeaowndp name="construct.c.apeaowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()
            DISPLAY g_qryparam.return1 TO apeaowndp
            NEXT FIELD apeaowndp
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeaowndp
            #add-point:BEFORE FIELD apeaowndp name="construct.b.apeaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeaowndp
            
            #add-point:AFTER FIELD apeaowndp name="construct.a.apeaowndp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apeacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeacrtid
            #add-point:ON ACTION controlp INFIELD apeacrtid name="construct.c.apeacrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()
            DISPLAY g_qryparam.return1 TO apeacrtid
            NEXT FIELD apeacrtid
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeacrtid
            #add-point:BEFORE FIELD apeacrtid name="construct.b.apeacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeacrtid
            
            #add-point:AFTER FIELD apeacrtid name="construct.a.apeacrtid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.apeacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeacrtdp
            #add-point:ON ACTION controlp INFIELD apeacrtdp name="construct.c.apeacrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()
            DISPLAY g_qryparam.return1 TO apeacrtdp
            NEXT FIELD apeacrtdp
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeacrtdp
            #add-point:BEFORE FIELD apeacrtdp name="construct.b.apeacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeacrtdp
            
            #add-point:AFTER FIELD apeacrtdp name="construct.a.apeacrtdp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeacrtdt
            #add-point:BEFORE FIELD apeacrtdt name="construct.b.apeacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apeamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeamodid
            #add-point:ON ACTION controlp INFIELD apeamodid name="construct.c.apeamodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001() 
            DISPLAY g_qryparam.return1 TO apeamodid
            NEXT FIELD apeamodid
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeamodid
            #add-point:BEFORE FIELD apeamodid name="construct.b.apeamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeamodid
            
            #add-point:AFTER FIELD apeamodid name="construct.a.apeamodid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeamoddt
            #add-point:BEFORE FIELD apeamoddt name="construct.b.apeamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.apeacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeacnfid
            #add-point:ON ACTION controlp INFIELD apeacnfid name="construct.c.apeacnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()
            DISPLAY g_qryparam.return1 TO apeacnfid
            NEXT FIELD apeacnfid
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeacnfid
            #add-point:BEFORE FIELD apeacnfid name="construct.b.apeacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeacnfid
            
            #add-point:AFTER FIELD apeacnfid name="construct.a.apeacnfid"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeacnfdt
            #add-point:BEFORE FIELD apeacnfdt name="construct.b.apeacnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON apebseq,apeborga,apeborga_desc,apeb001,apeb002,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apebld
           FROM s_detail1[1].apebseq,s_detail1[1].apeborga,s_detail1[1].apeborga_desc,s_detail1[1].apeb001,s_detail1[1].apeb002,s_detail1[1].apeb008,s_detail1[1].apeb011,s_detail1[1].apeb003,s_detail1[1].apeb004,s_detail1[1].apeb005,s_detail1[1].apeb031,s_detail1[1].apeb100,s_detail1[1].apeb108,s_detail1[1].apeb101, 
               s_detail1[1].apeb118,s_detail1[1].apeb006,s_detail1[1].apeb010,s_detail1[1].apeb024,s_detail1[1].apeb025,s_detail1[1].apebcomp,s_detail1[1].apebld
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apebseq
            #add-point:BEFORE FIELD apebseq name="construct.b.page1.apebseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apebseq
            
            #add-point:AFTER FIELD apebseq name="construct.a.page1.apebseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apebseq
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apebseq
            #add-point:ON ACTION controlp INFIELD apebseq name="construct.c.page1.apebseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.apeborga
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeborga
            #add-point:ON ACTION controlp INFIELD apeborga name="construct.c.page1.apeborga"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            IF NOT cl_null(g_wc_cs_orga) THEN         #160125-00005#6
   			   LET g_qryparam.where = " ooef001 IN ",g_wc_cs_orga,
   			                          " AND ooef201 = 'Y' "   #161006-00005#4  add 
   			END IF                                    #160125-00005#6
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO apeborga  #顯示到畫面上
            NEXT FIELD apeborga                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeborga
            #add-point:BEFORE FIELD apeborga name="construct.b.page1.apeborga"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeborga
            
            #add-point:AFTER FIELD apeborga name="construct.a.page1.apeborga"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeborga_desc
            #add-point:BEFORE FIELD apeborga_desc name="construct.b.page1.apeborga_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeborga_desc
            
            #add-point:AFTER FIELD apeborga_desc name="construct.a.page1.apeborga_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeborga_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeborga_desc
            #add-point:ON ACTION controlp INFIELD apeborga_desc name="construct.c.page1.apeborga_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb001
            #add-point:BEFORE FIELD apeb001 name="construct.b.page1.apeb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb001
            
            #add-point:AFTER FIELD apeb001 name="construct.a.page1.apeb001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb001
            #add-point:ON ACTION controlp INFIELD apeb001 name="construct.c.page1.apeb001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb002
            #add-point:BEFORE FIELD apeb002 name="construct.b.page1.apeb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb002
            
            #add-point:AFTER FIELD apeb002 name="construct.a.page1.apeb002"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.apeb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeb002
            #add-point:ON ACTION controlp INFIELD apeb002 name="construct.c.page1.apeb002"
            #170313-00033#1 add(s)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #控制組條件
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = " EXISTS (SELECT 1 FROM pmaa_t ",
                                      "          WHERE pmaaent = ",g_enterprise,
                                      "            AND ",g_sql_ctrl,
                                      "            AND pmaaent = apeaent ",
                                      "            AND pmaa001 = apea005 )"
            END IF            
            
            #查詢依帳套權限管理
            CALL s_axrt300_get_site(g_user,g_site_str,'2') RETURNING l_ld_str 
            LET l_ld_str = cl_replace_str(l_ld_str,"glaald","apeald")
            LET g_qryparam.where = g_qryparam.where, " AND ",l_ld_str
            #單別權限控管
            IF NOT cl_null(g_user_dept_wc_q) AND NOT g_user_dept_wc_q = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND ",g_user_dept_wc_q CLIPPED
            END IF
            CALL q_apeb002_2()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO apeb002  #顯示到畫面上
            NEXT FIELD apeb002   
            #170313-00033#1 add(e)            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.apeb008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeb008
            #add-point:ON ACTION controlp INFIELD apeb008 name="construct.c.page1.apeb008"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #170516-00041#9---add---start---
            #查詢依帳套權限管理
            CALL s_axrt300_get_site(g_user,g_site_str,'2') RETURNING l_ld_str
            LET l_ld_str = cl_replace_str(l_ld_str,"glaald","apeald")
            LET g_qryparam.where = " apeb008 IS NOT NULL AND ",l_ld_str
            #170516-00041#9---add---end---
            CALL q_apeb008()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO apeb008  #顯示到畫面上
            NEXT FIELD apeb008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb008
            #add-point:BEFORE FIELD apeb008 name="construct.b.page1.apeb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb008
            
            #add-point:AFTER FIELD apeb008 name="construct.a.page1.apeb008"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb011
            #add-point:BEFORE FIELD apeb011 name="construct.b.page1.apeb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb011
            
            #add-point:AFTER FIELD apeb011 name="construct.a.page1.apeb011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb011
            #add-point:ON ACTION controlp INFIELD apeb011 name="construct.c.page1.apeb011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb003
            #add-point:BEFORE FIELD apeb003 name="construct.b.page1.apeb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb003
            
            #add-point:AFTER FIELD apeb003 name="construct.a.page1.apeb003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.apeb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeb003
            #add-point:ON ACTION controlp INFIELD apeb003 name="construct.c.page1.apeb003"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " apbbstus = 'Y' "
            CALL q_apeb003()
            DISPLAY g_qryparam.return1 TO apeb003            
            NEXT FIELD apeb003
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb004
            #add-point:BEFORE FIELD apeb004 name="construct.b.page1.apeb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb004
            
            #add-point:AFTER FIELD apeb004 name="construct.a.page1.apeb004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb004
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb004
            #add-point:ON ACTION controlp INFIELD apeb004 name="construct.c.page1.apeb004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb005
            #add-point:BEFORE FIELD apeb005 name="construct.b.page1.apeb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb005
            
            #add-point:AFTER FIELD apeb005 name="construct.a.page1.apeb005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb005
            #add-point:ON ACTION controlp INFIELD apeb005 name="construct.c.page1.apeb005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb031
            #add-point:BEFORE FIELD apeb031 name="construct.b.page1.apeb031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb031
            
            #add-point:AFTER FIELD apeb031 name="construct.a.page1.apeb031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb031
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb031
            #add-point:ON ACTION controlp INFIELD apeb031 name="construct.c.page1.apeb031"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.apeb100
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeb100
            #add-point:ON ACTION controlp INFIELD apeb100 name="construct.c.page1.apeb100"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO apeb100  #顯示到畫面上
            NEXT FIELD apeb100                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb100
            #add-point:BEFORE FIELD apeb100 name="construct.b.page1.apeb100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb100
            
            #add-point:AFTER FIELD apeb100 name="construct.a.page1.apeb100"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb108
            #add-point:BEFORE FIELD apeb108 name="construct.b.page1.apeb108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb108
            
            #add-point:AFTER FIELD apeb108 name="construct.a.page1.apeb108"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb108
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb108
            #add-point:ON ACTION controlp INFIELD apeb108 name="construct.c.page1.apeb108"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb101
            #add-point:BEFORE FIELD apeb101 name="construct.b.page1.apeb101"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb101
            
            #add-point:AFTER FIELD apeb101 name="construct.a.page1.apeb101"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb101
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb101
            #add-point:ON ACTION controlp INFIELD apeb101 name="construct.c.page1.apeb101"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb118
            #add-point:BEFORE FIELD apeb118 name="construct.b.page1.apeb118"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb118
            
            #add-point:AFTER FIELD apeb118 name="construct.a.page1.apeb118"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb118
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb118
            #add-point:ON ACTION controlp INFIELD apeb118 name="construct.c.page1.apeb118"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb006
            #add-point:BEFORE FIELD apeb006 name="construct.b.page1.apeb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb006
            
            #add-point:AFTER FIELD apeb006 name="construct.a.page1.apeb006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb006
            #add-point:ON ACTION controlp INFIELD apeb006 name="construct.c.page1.apeb006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb010
            #add-point:BEFORE FIELD apeb010 name="construct.b.page1.apeb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb010
            
            #add-point:AFTER FIELD apeb010 name="construct.a.page1.apeb010"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.apeb010
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb010
            #add-point:ON ACTION controlp INFIELD apeb010 name="construct.c.page1.apeb010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb024
            #add-point:BEFORE FIELD apeb024 name="construct.b.page1.apeb024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb024
            
            #add-point:AFTER FIELD apeb024 name="construct.a.page1.apeb024"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.apeb024
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb024
            #add-point:ON ACTION controlp INFIELD apeb024 name="construct.c.page1.apeb024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb025
            #add-point:BEFORE FIELD apeb025 name="construct.b.page1.apeb025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb025
            
            #add-point:AFTER FIELD apeb025 name="construct.a.page1.apeb025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.apeb025
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb025
            #add-point:ON ACTION controlp INFIELD apeb025 name="construct.c.page1.apeb025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apebcomp
            #add-point:BEFORE FIELD apebcomp name="construct.b.page1.apebcomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apebcomp
            
            #add-point:AFTER FIELD apebcomp name="construct.a.page1.apebcomp"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.apebcomp
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apebcomp
            #add-point:ON ACTION controlp INFIELD apebcomp name="construct.c.page1.apebcomp"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apebld
            #add-point:BEFORE FIELD apebld name="construct.b.page1.apebld"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apebld
            
            #add-point:AFTER FIELD apebld name="construct.a.page1.apebld"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.page1.apebld
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apebld
            #add-point:ON ACTION controlp INFIELD apebld name="construct.c.page1.apebld"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         #加上合計功能後無法查詢，需重新DISPLAY所有頁籤
         LET g_apeb_d[1].apebseq = ""
         DISPLAY ARRAY g_apeb_d TO s_detail1.*
            BEFORE DISPLAY
               EXIT DISPLAY
         END DISPLAY
         CALL cl_set_comp_entry('apbbdocdt',FALSE)
         CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_wc_cs_comp) RETURNING g_sub_success,g_sql_ctrl  #161229-00047#45 add
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CLEAR FORM #200326-00032#1
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL
            LET g_wc2_extend = " 1=1" #190730-00003#4 add
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "apea_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "apeb_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
 
               END CASE
            END FOR
         END IF
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      ON ACTION accept
         CALL cl_qbe_auto_save() #180530-00049#1
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
   
   #組合g_wc2
   LET g_wc2 = g_wc2_table1
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   #161104-00046#4 --s add
   IF cl_null(g_user_dept_wc)THEN
      LET g_user_dept_wc = ' 1=1'
   END IF
   IF g_user_dept_wc <>  " 1=1" THEN
      LET g_wc = g_wc ," AND ", g_user_dept_wc CLIPPED
   END IF   
   #161104-00046#4 --e add  
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.filter" type="s" >}
#應用 a50 樣板自動產生(Version:11)
#+ filter過濾功能
PRIVATE FUNCTION aapt415_filter()
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
      CONSTRUCT g_wc_filter ON apeasite,apea003,apeadocdt,apeadocno,apea005,apea013,apea017
                          FROM s_browse[1].b_apeasite,s_browse[1].b_apea003,s_browse[1].b_apeadocdt,s_browse[1].b_apeadocno,s_browse[1].b_apea005,s_browse[1].b_apea013,s_browse[1].b_apea017
 
         BEFORE CONSTRUCT
               DISPLAY aapt415_filter_parser('apeasite') TO s_browse[1].b_apeasite
            DISPLAY aapt415_filter_parser('apea003') TO s_browse[1].b_apea003
            DISPLAY aapt415_filter_parser('apeadocdt') TO s_browse[1].b_apeadocdt
            DISPLAY aapt415_filter_parser('apeadocno') TO s_browse[1].b_apeadocno
            DISPLAY aapt415_filter_parser('apea005') TO s_browse[1].b_apea005
            DISPLAY aapt415_filter_parser('apea013') TO s_browse[1].b_apea013
            DISPLAY aapt415_filter_parser('apea017') TO s_browse[1].b_apea017
   
         AFTER FIELD b_apeasite
            #add-point:AFTER FIELD b_apeasite name="construct.filter.af.b_apeasite"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
         AFTER FIELD b_apea003
            #add-point:AFTER FIELD b_apea003 name="construct.filter.af.b_apea003"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
         AFTER FIELD b_apeadocno
            #add-point:AFTER FIELD b_apeadocno name="construct.filter.af.b_apeadocno"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
         AFTER FIELD b_apea005
            #add-point:AFTER FIELD b_apea005 name="construct.filter.af.b_apea005"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
         AFTER FIELD b_apea013
            #add-point:AFTER FIELD b_apea013 name="construct.filter.af.b_apea013"
            
            #END add-point
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
         AFTER FIELD b_apea017
            #add-point:AFTER FIELD b_apea017 name="construct.filter.af.b_apea017"
            
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
 
      CALL aapt415_filter_show('apeasite')
   CALL aapt415_filter_show('apea003')
   CALL aapt415_filter_show('apeadocdt')
   CALL aapt415_filter_show('apeadocno')
   CALL aapt415_filter_show('apea005')
   CALL aapt415_filter_show('apea013')
   CALL aapt415_filter_show('apea017')
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.filter_parser" type="s" >}
#+ filter過濾功能
PRIVATE FUNCTION aapt415_filter_parser(ps_field)
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
 
{<section id="aapt415.filter_show" type="s" >}
#+ 顯示過濾條件
PRIVATE FUNCTION aapt415_filter_show(ps_field)
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
   LET ls_condition = aapt415_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.query" type="s" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION aapt415_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF   
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_apeb_d.clear()
 
   
   #add-point:query段other name="query.other"
   CALL cl_set_comp_entry('apbbdocdt',FALSE)
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index 
   DISPLAY '' TO FORMONLY.h_count
   
   LET g_wc2_extend = " 1=1" #清空查詢方案條件 #190730-00003#4 add
   
   CALL aapt415_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL aapt415_browser_fill("")
      CALL aapt415_fetch("")
      RETURN
   END IF
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")
   
   #搜尋後資料初始化 
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_detail_idx_list[1] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL aapt415_filter_show('apeasite')
   CALL aapt415_filter_show('apea003')
   CALL aapt415_filter_show('apeadocdt')
   CALL aapt415_filter_show('apeadocno')
   CALL aapt415_filter_show('apea005')
   CALL aapt415_filter_show('apea013')
   CALL aapt415_filter_show('apea017')
   CALL aapt415_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL aapt415_fetch("F") 
      #顯示單身筆數
      CALL aapt415_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.fetch" type="s" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION aapt415_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
 
   #清空第二階單身
 
   
   CALL cl_ap_performance_next_start()
   CASE p_flag
      WHEN 'F' 
         LET g_current_idx = 1
      WHEN 'L'  
         LET g_current_idx = g_browser.getLength()              
      WHEN 'P'
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN 'N'
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN '/'
         IF (NOT g_no_ask) THEN    
            CALL cl_set_act_visible("accept,cancel", TRUE)    
            CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,':' FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl" 
            END PROMPT
 
            CALL cl_set_act_visible("accept,cancel", FALSE)    
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE  
            END IF           
         END IF
         
         IF g_jump > 0 AND g_jump <= g_browser.getLength() THEN
             LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE  
   END CASE 
 
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx) #設定browse 索引
   
   LET g_current_row = g_current_idx
   LET g_detail_cnt = g_header_cnt                  
   
   #單身總筆數顯示
   IF g_detail_cnt > 0 THEN
      #若單身有資料時, idx至少為1
      IF g_detail_idx <= 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx  
   ELSE
      LET g_detail_idx = 0
      DISPLAY '' TO FORMONLY.idx    
   END IF
   
   #瀏覽頁筆數顯示
   LET g_browser_idx = g_pagestart+g_current_idx-1
   DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
   DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_current_idx, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_apea_m.apeadocno = g_browser[g_current_idx].b_apeadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE aapt415_master_referesh USING g_apea_m.apeadocno INTO g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid, 
       g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp_desc,g_apea_m.apeamodid_desc,g_apea_m.apeacnfid_desc 
 
   
   #遮罩相關處理
   LET g_apea_m_mask_o.* =  g_apea_m.*
   CALL aapt415_apea_t_mask()
   LET g_apea_m_mask_n.* =  g_apea_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt415_set_act_visible()   
   CALL aapt415_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   CALL aapt415_set_entry_invoice_code()
   #end add-point
   
   #保存單頭舊值
   LET g_apea_m_t.* = g_apea_m.*
   LET g_apea_m_o.* = g_apea_m.*
   
   LET g_data_owner = g_apea_m.apeaownid      
   LET g_data_dept  = g_apea_m.apeaowndp
   LET g_data_crtid = g_apea_m.apeacrtid   #180201-00054
   LET g_data_crtdp = g_apea_m.apeacrtdp   #180201-00054
   
   #重新顯示   
   CALL aapt415_show()
 
   #應用 a56 樣板自動產生(Version:6)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
#  IF cl_bpm_chk() THEN   #181128-00048 mark
   IF cl_bpm_chk_status() THEN   #181128-00048
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
   #181128-00048 ---start---
   #若由BPM端開啟T100作業只能查詢，不能維護
   IF FGL_GETENV("BPMUSER") = "Y" THEN
      CALL cl_set_act_visible("insert,modify,delete,modify_detail,reproduce",FALSE)
   END IF
   #181128-00048 --- end ---
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.insert" type="s" >}
#+ 資料新增
PRIVATE FUNCTION aapt415_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_apeb_d.clear()   
 
 
   INITIALIZE g_apea_m.* TO NULL             #DEFAULT 設定
   
   LET g_apeadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_apea_m.apeaownid = g_user
      LET g_apea_m.apeaowndp = g_dept
      LET g_apea_m.apeacrtid = g_user
      LET g_apea_m.apeacrtdp = g_dept 
      LET g_apea_m.apeacrtdt = cl_get_current()
      LET g_apea_m.apeamodid = g_user
      LET g_apea_m.apeamoddt = cl_get_current()
      LET g_apea_m.apeastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      LET g_apea_m.apea019 = YEAR(g_today)
      LET g_apea_m.apea020 = MONTH(g_today)
      LET g_apea_m.apea013 = 'N'
      LET g_apea_m.apeasite = g_site
      LET g_apea_m.apea003 = g_user
      LET g_apea_m.apea001 = '40'
      LET g_apea_m.apeadocdt = g_today
      CALL s_desc_get_department_desc(g_apea_m.apeasite) RETURNING g_apea_m.apeasite_desc
      #營運據點取得帳別與法人
      CALL s_fin_orga_get_comp_ld(g_apea_m.apeasite) RETURNING g_sub_success,g_errno,g_apea_m.apeacomp,g_apea_m.apeald
      CALL cl_get_para(g_enterprise,g_apea_m.apeacomp,'S-FIN-2002') RETURNING g_sfin2002 #180927-00013#1 add
      CALL s_desc_get_person_desc(g_apea_m.apea003 ) RETURNING g_apea_m.apea003_desc
      CALL s_fin_get_wc_str(g_apea_m.apeacomp) RETURNING g_comp_str  #161229-00047#45 add 
      CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_comp_str) RETURNING g_sub_success,g_sql_ctrl #161229-00047#45 add 
      #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apea_m.apeacomp) RETURNING g_sub_success,g_sql_ctrl #161114-00017#2 add 控制組條件  #161229-00047#45 mark
      #匯率/單據/幣別參照表號             
      CALL s_ld_sel_glaa(g_apea_m.apeald,'glaa001|glaa002|glaa024|glaa026') RETURNING  g_sub_success,g_glaa001,g_glaa002,g_glaa024,g_glaa026  
      
      DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc,
                      g_apea_m.apea003,g_apea_m.apea003_desc,
                      g_apea_m.apea013,g_apea_m.apeadocdt
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_apea_m_t.* = g_apea_m.*
      LET g_apea_m_o.* = g_apea_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_apea_m.apeastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         
      END CASE
 
 
 
    
      CALL aapt415_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
      
      IF NOT g_master_insert THEN
         DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
         INITIALIZE g_apea_m.* TO NULL
         INITIALIZE g_apeb_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL aapt415_show()
         CALL aapt415_idx_chk()   #(ver:83)
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_apeb_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt415_set_act_visible()   
   CALL aapt415_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_apeadocno_t = g_apea_m.apeadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " apeaent = " ||g_enterprise|| " AND",
                      " apeadocno = '", g_apea_m.apeadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
   
   LET g_wc2_extend = " 1=1" #191129-00016#1 add 
   
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   LET g_current_row = g_browser.getLength() + 1 #190108-00038 add
   CALL aapt415_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE aapt415_cl
   
   CALL aapt415_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE aapt415_master_referesh USING g_apea_m.apeadocno INTO g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid, 
       g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp_desc,g_apea_m.apeamodid_desc,g_apea_m.apeacnfid_desc 
 
   
   
   #遮罩相關處理
   LET g_apea_m_mask_o.* =  g_apea_m.*
   CALL aapt415_apea_t_mask()
   LET g_apea_m_mask_n.* =  g_apea_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc,g_apea_m.apea003,g_apea_m.apea003_desc,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea005_desc,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus, 
       g_apea_m.apeaownid,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp,g_apea_m.apeacrtdp_desc,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamodid_desc,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfid_desc, 
       g_apea_m.apeacnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_apea_m.apeaownid      
   LET g_data_dept  = g_apea_m.apeaowndp
   LET g_data_crtid = g_apea_m.apeacrtid   #180201-00054
   LET g_data_crtdp = g_apea_m.apeacrtdp   #180201-00054
   
   
   #功能已完成,通報訊息中心
   CALL aapt415_msgcentre_notify('insert')
   
   CALL aapt415_idx_chk()   #(ver:83)
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.modify" type="s" >}
#+ 資料修改
PRIVATE FUNCTION aapt415_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE lp_cnt       LIKE type_t.num5   #190806-00019
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_apea_m_t.* = g_apea_m.*
   LET g_apea_m_o.* = g_apea_m.*
   
   IF g_apea_m.apeadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_apeadocno_t = g_apea_m.apeadocno
 
   CALL s_transaction_begin()
   
   #191101-00032 ---modify start---
   #190806-00019 ---start---
   #修改前須先確認資料是否存在
   IF g_action_choice = "modify" OR g_action_choice = "modify_detail" THEN   #191114-00036
      LET lp_cnt = 0
      EXECUTE aapt415_chk_data_exist_pre INTO lp_cnt USING g_enterprise,g_apea_m.apeadocno
      IF cl_null(lp_cnt) OR lp_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code = "-100"
         LET g_errparam.popup = TRUE
         CLOSE aapt415_cl
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
   END IF
   #190806-00019 --- end ---
   #191101-00032 --- modify end ---
 
   OPEN aapt415_cl USING g_enterprise,g_apea_m.apeadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN aapt415_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE aapt415_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #200804-00006 ---start---
   FETCH aapt415_cl
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "FETCH aapt415_cl:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CLOSE aapt415_cl
      #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
      CALL s_transaction_end('N','0')
      CALL s_transaction_begin()
      CALL cl_err()
      RETURN
   END IF
   #200804-00006 --- end ---
 
   #顯示最新的資料
   EXECUTE aapt415_master_referesh USING g_apea_m.apeadocno INTO g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid, 
       g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp_desc,g_apea_m.apeamodid_desc,g_apea_m.apeacnfid_desc 
 
   
   #檢查是否允許此動作
   IF NOT aapt415_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_apea_m_mask_o.* =  g_apea_m.*
   CALL aapt415_apea_t_mask()
   LET g_apea_m_mask_n.* =  g_apea_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL aapt415_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_apeadocno_t = g_apea_m.apeadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_apea_m.apeamodid = g_user 
LET g_apea_m.apeamoddt = cl_get_current()
LET g_apea_m.apeamodid_desc = cl_get_username(g_apea_m.apeamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #160308-00010#1 add ---(S)---
      IF g_apea_m.apeastus MATCHES '[DR]' THEN 
         LET g_apea_m.apeastus = "N"
      END IF
      #160308-00010#1 add ---(E)---
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL aapt415_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE apea_t SET (apeastus,apeamodid,apeamoddt) = (g_apea_m.apeastus,g_apea_m.apeamodid,g_apea_m.apeamoddt)
          WHERE apeaent = g_enterprise AND apeadocno = g_apeadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_apea_m.* = g_apea_m_t.*
         #  CALL aapt415_show()   #(ver:83)
         END IF
         CALL aapt415_show()   #(ver:83)
         CALL aapt415_idx_chk()   #(ver:83)
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_apea_m.apeadocno != g_apea_m_t.apeadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE apeb_t SET apebdocno = g_apea_m.apeadocno
 
          WHERE apebent = g_enterprise AND apebdocno = g_apea_m_t.apeadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "apeb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "apeb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
 
         
 
         
         #UPDATE 多語言table key值
         
            #161130-00056 add
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #180720-00009 ---start---
   #add-point:modify段修改後 name="modify.after"
   
   #end add-point
   #180720-00009 --- end ---
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt415_set_act_visible()   
   CALL aapt415_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " apeaent = " ||g_enterprise|| " AND",
                      " apeadocno = '", g_apea_m.apeadocno, "' "
 
   #填到對應位置
   CALL aapt415_browser_fill("")
 
   CLOSE aapt415_cl
   
   CALL s_transaction_end('Y','0')
 
   #180720-00009 ---start---
   #add-point:modify段結束前 name="modify.before_end"
   
   #end add-point
   #180720-00009 --- end ---
 
   #功能已完成,通報訊息中心
   CALL aapt415_msgcentre_notify('modify')
   
   CALL aapt415_idx_chk() #ver:83
 
END FUNCTION 
 
{</section>}
 
{<section id="aapt415.input" type="s" >}
#+ 資料輸入
PRIVATE FUNCTION aapt415_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point  
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num10                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num10                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num10
   DEFINE  l_i                   LIKE type_t.num10
   DEFINE  l_ac_t                LIKE type_t.num10
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num10
   DEFINE  li_reproduce_target   LIKE type_t.num10
   DEFINE  ls_keys               DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE  ls_mdl_str            STRING   #180411-00062
   DEFINE  lp_js                 STRING   #190412-00022
   #add-point:input段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE  l_apeb109             LIKE apeb_t.apeb109
   DEFINE  l_apbb025             LIKE apbb_t.apbb025
   DEFINE  l_apeb119             LIKE apeb_t.apeb119
   DEFINE  l_apbb028             LIKE apbb_t.apbb028
   DEFINE  l_ld                  LIKE apca_t.apcald
   DEFINE  l_lines               LIKE type_t.num5     #150301apo
   DEFINE  l_flag                LIKE type_t.chr1
   #151029-00001#2--add--str--lujh
   DEFINE  l_apeb108             LIKE apeb_t.apeb108
   DEFINE  l_apeb118             LIKE apeb_t.apeb118
   
   #151029-00001#2--add--end--lujh
   
   DEFINE l_pmaa004              LIKE pmaa_t.pmaa004   #160802-00007#2
   DEFINE l_flag1                LIKE type_t.num5      #161104-00046#4 add
   DEFINE l_max_docdt            LIKE apea_t.apeadocdt #180516-00039#4 add
   #180927-00013#1---add---(S)
   DEFINE l_min_docdt            LIKE apea_t.apeadocdt 
   DEFINE l_gzcb003_str          LIKE gzcb_t.gzcb003  
   DEFINE l_flag2                LIKE type_t.chr1     
   #180927-00013#1---add---(E)
   #end add-point  
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF   
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc,g_apea_m.apea003,g_apea_m.apea003_desc,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea005_desc,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus, 
       g_apea_m.apeaownid,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp,g_apea_m.apeacrtdp_desc,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamodid_desc,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfid_desc, 
       g_apea_m.apeacnfdt
   
   #ver:82
   #清空單身條件
   LET g_wc2 = " 1=1"
   LET g_wc2_table1 = " 1=1 "
 
   #CALL aapt415_b_fill()
   #ver:82
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT apebseq,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld FROM apeb_t WHERE apebent=? AND apebdocno=? AND apebseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE aapt415_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL aapt415_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL aapt415_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   WHILE TRUE
      LET l_flag = 'N'
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="aapt415.input.head" type="s" >}
      #單頭段
      INPUT BY NAME g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN aapt415_cl USING g_enterprise,g_apea_m.apeadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN aapt415_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE aapt415_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
 
            #200804-00006 ---start---
            FETCH aapt415_cl
            IF SQLCA.SQLCODE AND SQLCA.SQLCODE <> 100 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH aapt415_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CLOSE aapt415_cl
               #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
               CALL s_transaction_end('N','0')
               CALL s_transaction_begin()
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 --- end ---
 
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL aapt415_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            CALL aapt415_set_entry_invoice_code()

            #end add-point
            CALL aapt415_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeasite
            
            #add-point:AFTER FIELD apeasite name="input.a.apeasite"
            LET g_apea_m.apeasite_desc = ''
            IF NOT cl_null(g_apea_m.apeasite) THEN
               CALL s_fin_account_center_with_ld_chk(g_apea_m.apeasite,'','','6','N','',g_today) RETURNING g_sub_success,g_errno
               IF NOT g_sub_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_apea_m.apeasite = g_site
                  LET g_apea_m.apeasite_desc = s_desc_get_department_desc(g_apea_m.apeasite)
                  DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc
                  NEXT FIELD apeasite
               END IF
            END IF
            LET g_apea_m.apeasite_desc = s_desc_get_department_desc(g_apea_m.apeasite)
            DISPLAY BY NAME g_apea_m.apeasite_desc
            #營運據點取得帳別與法人
            CALL s_fin_orga_get_comp_ld(g_apea_m.apeasite) RETURNING g_sub_success,g_errno,g_apea_m.apeacomp,g_apea_m.apeald
            CALL aapt415_set_entry_invoice_code()
            CALL s_fin_get_wc_str(g_apea_m.apeacomp) RETURNING g_comp_str  #161229-00047#45 add 
            CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_comp_str) RETURNING g_sub_success,g_sql_ctrl         #161229-00047#45 add 
            #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apea_m.apeacomp) RETURNING g_sub_success,g_sql_ctrl #161114-00017#2 add 控制組條件 #161229-00047#45 mark
            #匯率/單據/幣別參照表號            
            CALL s_ld_sel_glaa(g_apea_m.apeald,'glaa001|glaa002|glaa024|glaa026') RETURNING  g_sub_success,g_glaa001,g_glaa002,g_glaa024,g_glaa026 
            CALL cl_get_para(g_enterprise,g_apea_m.apeacomp,'S-FIN-2002') RETURNING g_sfin2002 #180927-00013#1 add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeasite
            #add-point:BEFORE FIELD apeasite name="input.b.apeasite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeasite
            #add-point:ON CHANGE apeasite name="input.g.apeasite"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apea_m.apeasite
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeasite',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea003
            
            #add-point:AFTER FIELD apea003 name="input.a.apea003"
            LET g_apea_m.apea003_desc = ''
            IF NOT cl_null(g_apea_m.apea003) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apea_m.apea003 != g_apea_m_t.apea003 OR g_apea_m_t.apea003 IS NULL )) THEN
                  CALL s_employee_chk(g_apea_m.apea003) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                     LET g_apea_m.apea003 = g_apea_m_t.apea003
                     CALL s_desc_get_person_desc(g_apea_m.apea003) RETURNING g_apea_m.apea003_desc
                     DISPLAY BY NAME g_apea_m.apea003_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_person_desc(g_apea_m.apea003) RETURNING g_apea_m.apea003_desc
            DISPLAY BY NAME g_apea_m.apea003_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea003
            #add-point:BEFORE FIELD apea003 name="input.b.apea003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apea003
            #add-point:ON CHANGE apea003 name="input.g.apea003"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apea_m.apea003
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apea003',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeadocdt
            #add-point:BEFORE FIELD apeadocdt name="input.b.apeadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeadocdt
            
            #add-point:AFTER FIELD apeadocdt name="input.a.apeadocdt"
            #160111-00020#4--(S)
            IF cl_null(g_apea_m.apeadocdt) THEN #180927-00013#1 add
               LET g_apea_m.apea019 = ''  #180723-00032#1 add  
               LET g_apea_m.apea020 = ''  #180723-00032#1 add  
            END IF  #180927-00013#1 add
            IF NOT cl_null(g_apea_m.apeadocdt) THEN
              #IF  g_apea_m.apeadocdt != g_apea_m_o.apeadocdt AND cl_null(g_apea_m_o.apeadocdt) THEN  #180927-00013#1 add #180927-00013#1 mark
               IF  g_apea_m.apeadocdt != g_apea_m_o.apeadocdt OR cl_null(g_apea_m_o.apeadocdt) THEN  #180927-00013#1 add
                  CALL s_fin_date_close_chk('',g_apea_m.apeacomp,'AAP',g_apea_m.apeadocdt) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                    #LET g_apea_m.apeadocdt= g_apea_m_t.apeadocdt #180927-00013#1 mark
                     LET g_apea_m.apeadocdt= g_apea_m_o.apeadocdt #180927-00013#1 add
                     NEXT FIELD CURRENT
                  END IF
                  
                  #180516-00039#4 add ---s
                  #單據日期%1不可小於來源單據日期%2，請確認!
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt
                    FROM apeb_t
                   WHERE apebent = g_enterprise
                     AND apebdocno = g_apea_m.apeadocno
                  IF l_cnt > 0 THEN
                     LET l_max_docdt = ''               
                     SELECT MAX(apbbdocdt) INTO l_max_docdt
                       FROM apbb_t
                      WHERE apbbent = g_enterprise
                        AND apbbdocno IN (SELECT apeb002 FROM apeb_t
                                           WHERE apebent = g_enterprise
                                             AND apebdocno = g_apea_m.apeadocno) 
                                         
                     IF l_max_docdt > g_apea_m.apeadocdt THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aap-00692'
                        LET g_errparam.extend = ''
                        LET g_errparam.replace[1] = g_apea_m.apeadocdt
                        LET g_errparam.replace[2] = l_max_docdt
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                       #LET g_apea_m.apeadocdt= g_apea_m_t.apeadocdt #180927-00013#1 mark
                        LET g_apea_m.apeadocdt= g_apea_m_o.apeadocdt #180927-00013#1 add
                        NEXT FIELD CURRENT                  
                     END IF   
                     #180927-00013#1---add---(S)  
                     #單頭請款日期不可大於單身最小付款到期日  
                     LET l_min_docdt = '' 
                     SELECT MIN(apeb031) INTO l_min_docdt
                       FROM apeb_t
                      WHERE apebent = g_enterprise
                        AND apebdocno = g_apea_m.apeadocno 
                     IF g_apea_m.apeadocdt > l_min_docdt THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'aap-00754' #單頭請款日期不可大於單身最小付款到期日，請重新輸入！
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_apea_m.apeadocdt= g_apea_m_o.apeadocdt
                        NEXT FIELD CURRENT                  
                     END IF
                     #180927-00013#1---add---(E)
                  END IF                     
                  #180516-00039#4 add ---e     
                   
                  LET g_apea_m.apea019 = YEAR(g_apea_m.apeadocdt)   #180723-00032#1 add
                  LET g_apea_m.apea020 = MONTH(g_apea_m.apeadocdt)  #180723-00032#1 add     
                  DISPLAY BY NAME g_apea_m.apea019,g_apea_m.apea020      
               END IF #180927-00013#1 add                 
            END IF
            #160111-00020#4--(E)
            LET g_apea_m_o.* = g_apea_m.*  #180927-00013#1 add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeadocdt
            #add-point:ON CHANGE apeadocdt name="input.g.apeadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeacomp
            #add-point:BEFORE FIELD apeacomp name="input.b.apeacomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeacomp
            
            #add-point:AFTER FIELD apeacomp name="input.a.apeacomp"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeacomp
            #add-point:ON CHANGE apeacomp name="input.g.apeacomp"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeald
            #add-point:BEFORE FIELD apeald name="input.b.apeald"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeald
            
            #add-point:AFTER FIELD apeald name="input.a.apeald"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeald
            #add-point:ON CHANGE apeald name="input.g.apeald"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeadocno
            #add-point:BEFORE FIELD apeadocno name="input.b.apeadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeadocno
            
            #add-point:AFTER FIELD apeadocno name="input.a.apeadocno"
            IF NOT cl_null(g_apea_m.apeadocno) THEN    
               #150106-00008-mark--            
               #CALL s_fin_slip_chk(g_apea_m.apeadocno,g_prog,g_ld,g_glaa024)RETURNING g_sub_success,g_errno
               #IF NOT g_sub_success THEN
               #   INITIALIZE g_errparam TO NULL
               #   LET g_errparam.code = g_errno
               #   LET g_errparam.extend = ''
               #   LET g_errparam.popup = TRUE
               #   CALL cl_err()
               #   LET g_apea_m.apeadocno = ''
               #   NEXT FIELD CURRENT
               #END IF
               #150106-00008-mark--
               IF NOT s_aooi200_fin_chk_docno(g_apea_m.apeald,'','',g_apea_m.apeadocno,g_apea_m.apeadocdt,g_prog) THEN
                  LET g_apea_m.apeadocno = g_apea_m_t.apeadocno
                  NEXT FIELD CURRENT
               END IF             
               #161104-00046#4 --s add
               #170301-00027#2 by 09042 mark（e）
               #CALL s_control_chk_doc('1',g_apea_m.apeadocno,'4',g_user,g_dept,'','') RETURNING g_sub_success,l_flag1
               #170301-00027#2 by 09042 mark（e）
               #170301-00027#2 by 09042 add（s）               
               CALL s_control_chk_doc('1',g_apea_m.apeadocno,'4',g_user,g_dept,g_apea_m.apeald,'') RETURNING g_sub_success,l_flag1   #170301-00027#2  畫面上有帳套，將帳套傳入。               
               #170301-00027#2 by 09042 add（e）               
               IF g_sub_success AND l_flag1 THEN             
               ELSE
                  LET g_apea_m.apeadocno = g_apea_m_t.apeadocno
                  NEXT FIELD CURRENT            
               END IF
               CALL s_aooi200_fin_get_slip(g_apea_m.apeadocno) RETURNING g_sub_success,g_ap_slip
               #刪除單別預設temptable
               DELETE FROM s_aooi200def1
               #以目前畫面資訊新增temp資料   #請勿調整.*
               INSERT INTO s_aooi200def1 VALUES(g_apea_m.*)
               #依單別預設取用資訊
               CALL s_aooi200def_get('','',g_apea_m.apeasite,'2',g_ap_slip,'','',g_apea_m.apeald)
               #依單別預設值TEMP內容 給予到畫面上   #請勿調整.*
               SELECT * INTO g_apea_m.* FROM s_aooi200def1               
               #161104-00046#4 --e add
               #180103-00037#10 add(s)
               CALL s_desc_get_person_desc(g_apea_m.apea003 ) RETURNING g_apea_m.apea003_desc 
               LET g_apea_m.apea005_desc = s_desc_get_trading_partner_abbr_desc(g_apea_m.apea005)
               DISPLAY BY NAME g_apea_m.apea003_desc,g_apea_m.apea005_desc
               #180103-00037#10 add(e)
            END IF
            #180103-00037#10 add(s)
            CALL aapt415_set_entry(p_cmd)              
            CALL aapt415_set_no_entry(p_cmd)
            #180103-00037#10 add(e)
      

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeadocno
            #add-point:ON CHANGE apeadocno name="input.g.apeadocno"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apea_m.apeadocno
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeadocno',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea001
            #add-point:BEFORE FIELD apea001 name="input.b.apea001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea001
            
            #add-point:AFTER FIELD apea001 name="input.a.apea001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apea001
            #add-point:ON CHANGE apea001 name="input.g.apea001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea019
            #add-point:BEFORE FIELD apea019 name="input.b.apea019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea019
            
            #add-point:AFTER FIELD apea019 name="input.a.apea019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apea019
            #add-point:ON CHANGE apea019 name="input.g.apea019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea020
            #add-point:BEFORE FIELD apea020 name="input.b.apea020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea020
            
            #add-point:AFTER FIELD apea020 name="input.a.apea020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apea020
            #add-point:ON CHANGE apea020 name="input.g.apea020"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea005
            
            #add-point:AFTER FIELD apea005 name="input.a.apea005"
            LET g_apea_m.apea005_desc = ' '
            DISPLAY BY NAME g_apea_m.apea005_desc
            IF NOT cl_null(g_apea_m.apea005) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_apea_m.apea005 != g_apea_m_t.apea005 OR g_apea_m_t.apea005 IS NULL )) THEN
                 #CALL s_aap_pmaa001_chk(g_apea_m.apea005) RETURNING g_sub_success,g_errno   #151231-00010#1 mark
                  CALL s_aap_apca004_chk(g_apea_m.apea005) RETURNING g_sub_success,g_errno    #151231-00010#1 add
                  #IF NOT cl_null(g_errno)THEN  #161014-00053#3 mark
                  IF NOT g_sub_success THEN     #161014-00053#3 add
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     #160321-00016#21 --s add
                     LET g_errparam.replace[1] = 'apmm100'
                     LET g_errparam.replace[2] = cl_get_progname('apmm100',g_lang,"2")
                     LET g_errparam.exeprog = 'apmm100'
                     #160321-00016#21 --e add
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     #LET g_apea_m.apea005 = g_apea_m_t.apea005
                     LET g_apea_m.apea005 = g_apea_m_t.apea005
                     LET g_apea_m.apea005_desc = s_desc_get_trading_partner_abbr_desc(g_apea_m.apea005)
                     DISPLAY BY NAME g_apea_m.apea005_desc
                     NEXT FIELD CURRENT
                  END IF
                  #160802-00007#2-----s
                  SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t WHERE pmaaent = g_enterprise AND pmaa001 = g_apea_m.apea005
                  IF l_pmaa004 = '2' THEN   #一次性交易對象
                     #CALL apmi004_01('1',g_apea_m.apea006,g_apea_m.apea005,g_apea_m.apeadocno) RETURNING g_apea_m.apea006 #170522-00030#1 mark
                     #170522-00030#1 add(s)
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'i'
                     LET g_qryparam.reqry = FALSE
                     LET g_qryparam.default1 =  g_apea_m.apea006
                     LET g_qryparam.arg1 =  g_apea_m.apea005
                     CALL q_pmak002()
                     LET g_apea_m.apea006 = g_qryparam.return1   
                     #170522-00030#1 add(e)             
                  END IF
                  IF l_pmaa004 = '4' THEN   #內部員工
                     CALL apmi004_01('2',g_apea_m.apea006,g_apea_m.apea005,g_apea_m.apeadocno) RETURNING g_apea_m.apea006
                  END IF
                  #160802-00007#2-----e
                  
                  #181024-00092#1 add-S
                  #檢核輸入的供應商是否在單據別限制範圍內，若不在限制內則不允許跟此供應商採購
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt FROM pmab_t 
                   WHERE pmabent=g_enterprise AND pmabsite=g_site AND pmab001=g_apea_m.apea005
                  IF l_cnt > 0 THEN 
                     LET g_apea_m.apea005_desc = s_desc_get_trading_partner_abbr_desc(g_apea_m.apea005)
                     DISPLAY BY NAME g_apea_m.apea005_desc
                  ELSE
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ais-00055'
                     LET g_errparam.exeprog = 'apmm102'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apea_m.apea005 = g_apea_m_t.apea005
                     LET g_apea_m.apea005_desc = s_desc_get_trading_partner_abbr_desc(g_apea_m.apea005)
                     DISPLAY BY NAME g_apea_m.apea005_desc
                     NEXT FIELD CURRENT
                  END IF                
                  #181024-00092#1 add-E
               END IF
            END IF
            #160802-00007#2-----s
            IF cl_null(g_apea_m.apea005) THEN
               LET g_apea_m.apea006 = ''
            END IF
            #160802-00007#2-----e
            LET g_apea_m.apea005_desc = s_desc_get_trading_partner_abbr_desc(g_apea_m.apea005)
            #160802-00007#2-----s
            IF NOT cl_null(g_apea_m.apea006) THEN
               #CALL s_axrt300_xrca_ref('xrca057',g_apea_m.apea006,'','') RETURNING g_sub_success,g_apea_m.apea005_desc #170522-00030#1 mark
               CALL s_axrt300_xrca_ref('xrca057',g_apea_m.apea005,g_apea_m.apea006,'') RETURNING g_sub_success,g_apea_m.apea005_desc  #170522-00030#1 add
            END IF
            #160802-00007#2-----e   
            DISPLAY BY NAME g_apea_m.apea005_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea005
            #add-point:BEFORE FIELD apea005 name="input.b.apea005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apea005
            #add-point:ON CHANGE apea005 name="input.g.apea005"
            #LET g_apea_m.apea006 = g_apea_m.apea005 #170522-00030#1 mark
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea013
            #add-point:BEFORE FIELD apea013 name="input.b.apea013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea013
            
            #add-point:AFTER FIELD apea013 name="input.a.apea013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apea013
            #add-point:ON CHANGE apea013 name="input.g.apea013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apea006
            #add-point:BEFORE FIELD apea006 name="input.b.apea006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apea006
            
            #add-point:AFTER FIELD apea006 name="input.a.apea006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apea006
            #add-point:ON CHANGE apea006 name="input.g.apea006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeastus
            #add-point:BEFORE FIELD apeastus name="input.b.apeastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeastus
            
            #add-point:AFTER FIELD apeastus name="input.a.apeastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeastus
            #add-point:ON CHANGE apeastus name="input.g.apeastus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.apeasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeasite
            #add-point:ON ACTION controlp INFIELD apeasite name="input.c.apeasite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apea_m.apeasite
            #LET g_qryparam.where = " ooef206 = 'Y' " #160812-00027#1 mark
            #CALL q_ooef001()     #161006-00005#4  mark
            CALL q_ooef001_33()   #161006-00005#4  add
            LET g_apea_m.apeasite = g_qryparam.return1
            CALL s_desc_get_department_desc(g_apea_m.apeasite) RETURNING g_apea_m.apeasite_desc
            DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc
            NEXT FIELD apeasite
            #END add-point
 
 
         #Ctrlp:input.c.apea003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apea003
            #add-point:ON ACTION controlp INFIELD apea003 name="input.c.apea003"
            #請款人員            
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apea_m.apea003
            CALL q_ooag001()
            LET g_apea_m.apea003 = g_qryparam.return1
            CALL s_desc_get_person_desc(g_apea_m.apea003) RETURNING g_apea_m.apea003_desc
            DISPLAY BY NAME g_apea_m.apea003,g_apea_m.apea003_desc
            NEXT FIELD apea003
            #END add-point
 
 
         #Ctrlp:input.c.apeadocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeadocdt
            #add-point:ON ACTION controlp INFIELD apeadocdt name="input.c.apeadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.apeacomp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeacomp
            #add-point:ON ACTION controlp INFIELD apeacomp name="input.c.apeacomp"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_apea_m.apeacomp             #給予default值
            LET g_qryparam.default2 = "" #g_apea_m.ooef001 #组织编号
            #給予arg
            LET g_qryparam.arg1 = "" #


            CALL q_ooef001()                                #呼叫開窗

            LET g_apea_m.apeacomp = g_qryparam.return1              
            #LET g_apea_m.ooef001 = g_qryparam.return2 
            DISPLAY g_apea_m.apeacomp TO apeacomp              #
            CALL cl_get_para(g_enterprise,g_apea_m.apeacomp,'S-FIN-2002') RETURNING g_sfin2002 #180927-00013#1 add
            #DISPLAY g_apea_m.ooef001 TO ooef001 #组织编号
            NEXT FIELD apeacomp                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.apeald
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeald
            #add-point:ON ACTION controlp INFIELD apeald name="input.c.apeald"
            
            #END add-point
 
 
         #Ctrlp:input.c.apeadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeadocno
            #add-point:ON ACTION controlp INFIELD apeadocno name="input.c.apeadocno"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apea_m.apeadocno
            LET g_qryparam.arg1 = g_glaa024         
            LET g_qryparam.arg2  = g_prog
            #161104-00046#4 --s add
            IF NOT cl_null(g_user_slip_wc)THEN
               LET g_qryparam.where = g_user_slip_wc
            END IF
            #161104-00046#4 --e add             
            CALL q_ooba002_1()
            LET g_apea_m.apeadocno = g_qryparam.return1
            DISPLAY BY NAME g_apea_m.apeadocno
            NEXT FIELD apeadocno

            #END add-point
 
 
         #Ctrlp:input.c.apea001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea001
            #add-point:ON ACTION controlp INFIELD apea001 name="input.c.apea001"
            
            #END add-point
 
 
         #Ctrlp:input.c.apea019
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea019
            #add-point:ON ACTION controlp INFIELD apea019 name="input.c.apea019"
            
            #END add-point
 
 
         #Ctrlp:input.c.apea020
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea020
            #add-point:ON ACTION controlp INFIELD apea020 name="input.c.apea020"
            
            #END add-point
 
 
         #Ctrlp:input.c.apea005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apea005
            #add-point:ON ACTION controlp INFIELD apea005 name="input.c.apea005"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apea_m.apea005      #給予default值
            LET g_qryparam.arg1 = "('1','3')"
            #151231-00010#1(S)
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_sql_ctrl
            END IF
            #151231-00010#1(E)            
            CALL q_pmaa001_1()                                
            LET g_apea_m.apea005 = g_qryparam.return1       
            CALL s_desc_get_trading_partner_abbr_desc(g_apea_m.apea005) RETURNING g_apea_m.apea005_desc
            DISPLAY BY NAME g_apea_m.apea005,g_apea_m.apea005_desc

            #END add-point
 
 
         #Ctrlp:input.c.apea013
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea013
            #add-point:ON ACTION controlp INFIELD apea013 name="input.c.apea013"
            
            #END add-point
 
 
         #Ctrlp:input.c.apea006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apea006
            #add-point:ON ACTION controlp INFIELD apea006 name="input.c.apea006"
            
            #END add-point
 
 
         #Ctrlp:input.c.apeastus
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeastus
            #add-point:ON ACTION controlp INFIELD apeastus name="input.c.apeastus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_apea_m.apeadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_fin_gen_docno(g_apea_m.apeald,'','',g_apea_m.apeadocno,g_apea_m.apeadocdt,g_prog)
                     RETURNING g_sub_success,g_apea_m.apeadocno
#               CALL s_aooi200_gen_docno(g_comp,g_apea_m.apeadocno,g_apea_m.apeadocdt,g_prog)
#                    RETURNING g_sub_success,g_apea_m.apeadocn

               #161228-00002#1-----s
               UPDATE pmak_t SET pmak006 = g_apea_m.apeadocno 
                WHERE pmakent = g_enterprise AND pmak001 = g_apea_m.apea006
               #161228-00002#1-----e
               #end add-point
               
               #190412-00022 ---start---
               #資料所有者與資料所有部門改為呼叫FUNCTION取得
               LET lp_js = util.JSON.stringify(g_apea_m)
               CALL cl_auth_belong_data(lp_js,"apea_t") RETURNING g_apea_m.apeaownid,g_apea_m.apeaowndp
               #190412-00022 --- end ---
 
               INSERT INTO apea_t (apeaent,apeasite,apea003,apeadocdt,apeacomp,apeald,apeadocno,apea001,apea019,apea020,apea005,apea013,apea006,apeastus,apeaownid,apeaowndp,apeacrtid,apeacrtdp,apeacrtdt,apeamodid,apeamoddt,apeacnfid,apeacnfdt)
               VALUES (g_enterprise,g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid,g_apea_m.apeaowndp, 
                   g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_apea_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               
               #end add-point
               
               
               
                  #161130-00056
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL aapt415_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL aapt415_b_fill()
                  CALL aapt415_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               #161228-00002#1-----s
               UPDATE pmak_t SET pmak006 = g_apea_m.apeadocno 
                WHERE pmakent = g_enterprise AND pmak001 = g_apea_m.apea006
               #161228-00002#1-----e
               #end add-point
               
               #將遮罩欄位還原
               CALL aapt415_apea_t_mask_restore('restore_mask_o')
               
               UPDATE apea_t SET (apeasite,apea003,apeadocdt,apeacomp,apeald,apeadocno,apea001,apea019,apea020,apea005,apea013,apea006,apeastus,apeaownid,apeaowndp,apeacrtid,apeacrtdp,apeacrtdt,apeamodid,apeamoddt,apeacnfid,apeacnfdt) = (g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp, 
                   g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid,g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt, 
                   g_apea_m.apeacnfid,g_apea_m.apeacnfdt)
                WHERE apeaent = g_enterprise AND apeadocno = g_apeadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "apea_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
                  #161130-00056
               
               #將遮罩欄位進行遮蔽
               CALL aapt415_apea_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_apea_m_t)
               LET g_log2 = util.JSON.stringify(g_apea_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_apeadocno_t = g_apea_m.apeadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="aapt415.input.body" type="s" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_apeb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            CALL aapt415_show()
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_apeb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL aapt415_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_apeb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            #營運據點取得帳別與法人
            CALL s_fin_orga_get_comp_ld(g_apea_m.apeasite) RETURNING g_sub_success,g_errno,g_apea_m.apeacomp,g_apea_m.apeald
            CALL cl_get_para(g_enterprise,g_apea_m.apeacomp,'S-FIN-2002') RETURNING g_sfin2002 #180927-00013#1 add
            CALL s_fin_get_wc_str(g_apea_m.apeacomp) RETURNING g_comp_str  #161229-00047#45 add 
            CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_comp_str) RETURNING g_sub_success,g_sql_ctrl         #161229-00047#45 add 
            #CALL s_control_get_supplier_sql_pmab('4',g_site,g_user,g_dept,'',g_apea_m.apeacomp) RETURNING g_sub_success,g_sql_ctrl #161114-00017#2 add 控制組條件 #161229-00047#45 mark
            CALL aapt415_set_entry_invoice_code()
            #匯率/單據/幣別參照表號            
            CALL s_ld_sel_glaa(g_apea_m.apeald,'glaa001|glaa002|glaa024|glaa026') RETURNING  g_sub_success,g_glaa001,g_glaa002,g_glaa024,g_glaa026 
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            LET g_aw = 's_detail1'
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN aapt415_cl USING g_enterprise,g_apea_m.apeadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN aapt415_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE aapt415_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
 
            #200804-00006 ---start---
            FETCH aapt415_cl
            IF SQLCA.SQLCODE AND SQLCA.SQLCODE <> 100 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH aapt415_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CLOSE aapt415_cl
               #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
               CALL s_transaction_end('N','0')
               CALL s_transaction_begin()
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 --- end ---
            
            LET g_rec_b = g_apeb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_apeb_d[l_ac].apebseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_apeb_d_t.* = g_apeb_d[l_ac].*  #BACKUP
               LET g_apeb_d_o.* = g_apeb_d[l_ac].*  #BACKUP
               CALL aapt415_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL aapt415_set_no_entry_b(l_cmd)
               IF NOT aapt415_lock_b("apeb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH aapt415_bcl INTO g_apeb_d[l_ac].apebseq,g_apeb_d[l_ac].apeborga,g_apeb_d[l_ac].apeb001,g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb011,g_apeb_d[l_ac].apeb003,g_apeb_d[l_ac].apeb004,g_apeb_d[l_ac].apeb005,g_apeb_d[l_ac].apeb031,g_apeb_d[l_ac].apeb100, 
                      g_apeb_d[l_ac].apeb108,g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118,g_apeb_d[l_ac].apeb006,g_apeb_d[l_ac].apeb010,g_apeb_d[l_ac].apeb024,g_apeb_d[l_ac].apeb025,g_apeb_d[l_ac].apebcomp,g_apeb_d[l_ac].apeb012,g_apeb_d[l_ac].apebld
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_apeb_d_t.apebseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_apeb_d_mask_o[l_ac].* =  g_apeb_d[l_ac].*
                  CALL aapt415_apeb_t_mask()
                  LET g_apeb_d_mask_n[l_ac].* =  g_apeb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL aapt415_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            CALL aapt415_idx_chk()   #(ver:83)
        
         BEFORE INSERT  
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL aapt415_idx_chk()   #(ver:83)
            INITIALIZE g_apeb_d[l_ac].* TO NULL 
            INITIALIZE g_apeb_d_t.* TO NULL 
            INITIALIZE g_apeb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_apeb_d[l_ac].apeb108 = "0"
      LET g_apeb_d[l_ac].apeb118 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            LET g_apeb_d[l_ac].apeb025 = '' #171117-00021#1 add
            #end add-point
            LET g_apeb_d_t.* = g_apeb_d[l_ac].*     #新輸入資料
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL aapt415_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            LET g_apeb_d[l_ac].apeb001 = 'aapt110' #180927-00013#1 add
            #end add-point
            CALL aapt415_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_apeb_d[li_reproduce_target].* = g_apeb_d[li_reproduce].*
 
               LET g_apeb_d[li_reproduce_target].apebseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            LET g_apeb_d[l_ac].apebseq = NULL
            SELECT MAX(apebseq) INTO g_apeb_d[l_ac].apebseq FROM apeb_t
             WHERE apebent = g_enterprise
               AND apebdocno = g_apea_m.apeadocno
            IF cl_null(g_apeb_d[l_ac].apebseq) THEN
               LET g_apeb_d[l_ac].apebseq = 0
            END IF
            LET g_apeb_d[l_ac].apebseq = g_apeb_d[l_ac].apebseq + 1
            
            CALL s_fin_orga_get_comp_ld(g_apea_m.apeasite) RETURNING g_sub_success,g_errno,g_apeb_d[l_ac].apeborga ,l_ld
            LET g_apeb_d[l_ac].apeborga_desc = s_desc_get_department_desc(g_apeb_d[l_ac].apeborga)
            #LET g_apeb_d[l_ac].apeb011 = g_today
            
            LET g_apeb_d[l_ac].apebcomp = g_apea_m.apeacomp
            LET g_apeb_d[l_ac].apebld = g_apea_m.apeald
            
            #end add-point  
  
         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身新增 name="input.body.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM apeb_t 
             WHERE apebent = g_enterprise AND apebdocno = g_apea_m.apeadocno
 
               AND apebseq = g_apeb_d[l_ac].apebseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_apea_m.apeadocno
               LET gs_keys[2] = g_apeb_d[g_detail_idx].apebseq
               CALL aapt415_insert_b('apeb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_apeb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "apeb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL aapt415_b_fill()
               #資料多語言用-增/改
               
                  #161130-00056 add
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body.b_delete_ask"
               
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
               
               #add-point:單身刪除前 name="input.body.b_delete"
               
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_apea_m.apeadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_apeb_d_t.apebseq
 
            
               #刪除同層單身
               IF NOT aapt415_delete_b('apeb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aapt415_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT aapt415_key_delete_b(gs_keys,'apeb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE aapt415_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
   #161130-00056 add
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE aapt415_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_apeb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_apeb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apebseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_apeb_d[l_ac].apebseq,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD apebseq
            END IF 
 
 
 
            #add-point:AFTER FIELD apebseq name="input.a.page1.apebseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_apea_m.apeadocno IS NOT NULL AND g_apeb_d[g_detail_idx].apebseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_apea_m.apeadocno != g_apeadocno_t OR g_apeb_d[g_detail_idx].apebseq != g_apeb_d_t.apebseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM apeb_t WHERE "||"apebent = '" ||g_enterprise|| "' AND "||"apebdocno = '"||g_apea_m.apeadocno ||"' AND "|| "apebseq = '"||g_apeb_d[g_detail_idx].apebseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            IF NOT cl_null(g_apeb_d[l_ac].apebseq) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apebseq
            #add-point:BEFORE FIELD apebseq name="input.b.page1.apebseq"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apebseq
            #add-point:ON CHANGE apebseq name="input.g.page1.apebseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeborga
            
            #add-point:AFTER FIELD apeborga name="input.a.page1.apeborga"
            LET g_apeb_d[l_ac].apeborga_desc = ' '
            DISPLAY BY NAME g_apeb_d[l_ac].apeborga_desc
            IF NOT cl_null(g_apeb_d[l_ac].apeborga) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apeb_d[l_ac].apeborga != g_apeb_d_t.apeborga OR g_apeb_d_t.apeborga IS NULL )) THEN
                  #161006-00005#4   add---s
                  CALL s_fin_account_center_sons_query('6',g_apea_m.apeasite,g_today,'1')
                  CALL s_fin_account_center_sons_str() RETURNING g_wc_apeborga
                  CALL s_fin_get_wc_str(g_wc_apeborga) RETURNING g_wc_apeborga
                  #161006-00005#4   add---e
                  CALL s_aap_apcborga_chk(g_apea_m.apeald,g_apea_m.apeadocno,g_apeb_d[l_ac].apeborga,g_wc_apeborga) RETURNING g_sub_success,g_errno #160812-00027#1 add
                  #CALL aapt415_apeborga_chk(g_apeb_d[l_ac].apeborga) RETURNING g_sub_success,g_errno                                               #160812-00027#1 mark
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apeb_d[l_ac].apeborga = g_apeb_d_t.apeborga
                     LET g_apeb_d[l_ac].apeborga_desc = s_desc_get_department_desc(g_apeb_d[l_ac].apeborga)
                     DISPLAY BY NAME g_apeb_d[l_ac].apeborga_desc
                     NEXT FIELD CURRENT
                  END IF
                  
                  #161006-00005#4   add---s
                  CALL s_fin_apcborga_chk(g_apea_m.apeasite,g_apea_m.apeacomp,g_apeb_d[l_ac].apeborga,g_today,'6')  RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apeb_d[l_ac].apeborga = g_apeb_d_t.apeborga
                     LET g_apeb_d[l_ac].apeborga_desc = s_desc_get_department_desc(g_apeb_d[l_ac].apeborga)
                     DISPLAY BY NAME g_apeb_d[l_ac].apeborga_desc
                     NEXT FIELD CURRENT
                  END IF
                  
                  LET l_count = NULL
                  SELECT count(1) INTO l_count 
                    FROM s_fin_tmp1
                   WHERE ooef001 = g_apeb_d[l_ac].apeborga
                     
                  IF cl_null(l_count) THEN LET l_count = 0 END IF  
                     
                  IF l_count = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ais-00342'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apeb_d[l_ac].apeborga = g_apeb_d_t.apeborga
                     LET g_apeb_d[l_ac].apeborga_desc = s_desc_get_department_desc(g_apeb_d[l_ac].apeborga)
                     DISPLAY BY NAME g_apeb_d[l_ac].apeborga_desc
                     NEXT FIELD CURRENT
                  END IF
                  #161006-00005#4   add---e 
               END IF
            END IF
            LET g_apeb_d[l_ac].apeborga_desc = s_desc_get_department_desc(g_apeb_d[l_ac].apeborga)
            DISPLAY BY NAME g_apeb_d[l_ac].apeborga_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeborga
            #add-point:BEFORE FIELD apeborga name="input.b.page1.apeborga"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeborga
            #add-point:ON CHANGE apeborga name="input.g.page1.apeborga"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apeb_d[l_ac].apeborga
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeborga',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeborga_desc
            #add-point:BEFORE FIELD apeborga_desc name="input.b.page1.apeborga_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeborga_desc
            
            #add-point:AFTER FIELD apeborga_desc name="input.a.page1.apeborga_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeborga_desc
            #add-point:ON CHANGE apeborga_desc name="input.g.page1.apeborga_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb001
            #add-point:BEFORE FIELD apeb001 name="input.b.page1.apeb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb001
            
            #add-point:AFTER FIELD apeb001 name="input.a.page1.apeb001"
            #180927-00013#1---add---(S)需檢核內容是否在SCC-8530範圍內
            IF NOT cl_null(g_apeb_d[l_ac].apeb001) THEN
               #IF g_apeb_d[l_ac].apeb001 != g_apeb_d_o.apeb001 AND cl_null(g_apeb_d_o.apeb001) THEN  #200226-00017#1 mark
               IF g_apeb_d[l_ac].apeb001 != g_apeb_d_o.apeb001 OR cl_null(g_apeb_d_o.apeb001) THEN    #200226-00017#1 add            
                  LET l_cnt = 0
                  SELECT COUNT(1) INTO l_cnt 
                    FROM gzcb_t
                   WHERE gzcb001 = '8530' 
                     AND gzcb002 = g_apeb_d[l_ac].apeb001
                  IF l_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'anm-03107' #自行輸入不允許輸入此來源類型
                     LET g_errparam.extend = g_apeb_d[l_ac].apeb001
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apeb_d[l_ac].apeb001 = g_apeb_d_o.apeb001
                     DISPLAY BY NAME g_apeb_d[l_ac].apeb001
                     NEXT FIELD CURRENT
                  END IF
                  #修改來源類型後要清空該列的值
                  CALL aapt415_isam_clean()
               END IF      
            END IF
            IF cl_null(l_flag2) THEN LET l_flag2 = 'N' END IF
            IF g_apeb_d[l_ac].apeb001 MATCHES '4*' AND cl_null(g_apeb_d[l_ac].apeb003) AND l_flag2 != 'Y' THEN            
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 'aap-00755'
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET l_flag2 = 'Y'
            END IF
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*       
            #180927-00013#1---add---(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb001
            #add-point:ON CHANGE apeb001 name="input.g.page1.apeb001"
            #180927-00013#1---add---(S)
            CALL aapt415_set_entry_b(l_cmd)    
            CALL aapt415_set_no_entry_b(l_cmd) 
            IF cl_null(l_flag2) THEN LET l_flag2 = 'N' END IF
            IF g_apeb_d[l_ac].apeb001 MATCHES '4*' THEN            
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 'aap-00755'
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET l_flag2 = 'Y'
            END IF
            #180927-00013#1---add---(E)
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb002
            #add-point:BEFORE FIELD apeb002 name="input.b.page1.apeb002"
            CALL aapt415_set_entry_b(l_cmd)     #180927-00013#1 add
            CALL aapt415_set_no_entry_b(l_cmd)  #180927-00013#1 add    
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb002
            
            #add-point:AFTER FIELD apeb002 name="input.a.page1.apeb002"
            IF NOT cl_null(g_apeb_d[l_ac].apeb002) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apeb_d[l_ac].apeb002 != g_apeb_d_t.apeb002 OR g_apeb_d_t.apeb002 IS NULL )) THEN
                  IF l_cmd = 'u' THEN 
                     CALL aapt415_isam_clean()                    
                  END IF
                  CALL aapt415_apeb002_chk(g_apeb_d[l_ac].apeb002) RETURNING g_sub_success,g_errno
                  IF NOT g_sub_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apeb_d[l_ac].apeb002 = g_apeb_d_t.apeb002
                     CALL aapt415_isam_clean()
                     DISPLAY BY NAME g_apeb_d[l_ac].apeb002
                     NEXT FIELD CURRENT
                  END IF                                 
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb002
            #add-point:ON CHANGE apeb002 name="input.g.page1.apeb002"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apeb_d[l_ac].apeb002
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeb002',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb007
            #add-point:BEFORE FIELD apeb007 name="input.b.page1.apeb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb007
            
            #add-point:AFTER FIELD apeb007 name="input.a.page1.apeb007"
            #180828-00007#1 add ---s
            IF NOT cl_null(g_apeb_d[l_ac].apeb007) THEN          
               IF NOT cl_null(g_apeb_d[l_ac].apeb002) AND NOT cl_null(g_apeb_d[l_ac].apeb008) THEN 
                  IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apeb_d[l_ac].apeb007 != g_apeb_d_t.apeb007 OR g_apeb_d_t.apeb007 IS NULL )) THEN
                     CALL aapt415_apeb008_chk() RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_apeb_d[l_ac].apeb007 = g_apeb_d_t.apeb007
                        LET g_apeb_d[l_ac].apeb008 = g_apeb_d_t.apeb008
                        DISPLAY BY NAME g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008
                        NEXT FIELD CURRENT
                     END IF                     
                  END IF
               END IF
            END IF            
            #180828-00007#1 add ---e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb007
            #add-point:ON CHANGE apeb007 name="input.g.page1.apeb007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb008
            #add-point:BEFORE FIELD apeb008 name="input.b.page1.apeb008"
            CALL aapt415_set_entry_b(l_cmd)     #180927-00013#1 add
            CALL aapt415_set_no_entry_b(l_cmd)  #180927-00013#1 add    
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb008
            
            #add-point:AFTER FIELD apeb008 name="input.a.page1.apeb008"
            IF NOT cl_null(g_apeb_d[l_ac].apeb008) THEN          
               IF NOT cl_null(g_apeb_d[l_ac].apeb002) THEN 
                  IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apeb_d[l_ac].apeb008 != g_apeb_d_t.apeb008 OR g_apeb_d_t.apeb008 IS NULL )) THEN
                     #180314-00054#1---add---(S)
                     SELECT isam009 INTO g_apeb_d[l_ac].apeb007
                      FROM isam_t
                     WHERE isament = g_enterprise
                       AND isam010 = g_apeb_d[l_ac].apeb008
                       AND isamdocno = g_apeb_d[l_ac].apeb002
                     DISPLAY BY NAME g_apeb_d[l_ac].apeb007
                     #180314-00054#1---add---(E)
                     CALL aapt415_apeb008_chk() RETURNING g_sub_success,g_errno
                     IF NOT g_sub_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_apeb_d[l_ac].apeb007 = g_apeb_d_t.apeb007   #180314-00054#1---add
                        LET g_apeb_d[l_ac].apeb008 = g_apeb_d_t.apeb008
                        DISPLAY BY NAME g_apeb_d[l_ac].apeb008
                        NEXT FIELD CURRENT
                     END IF
                     
                     IF l_cmd = 'u' THEN 
                        CALL s_transaction_begin()
                        DELETE FROM apeb_t
                         WHERE apebent = g_enterprise
                           AND apebdocno = g_apea_m.apeadocno
                           AND apeb002 = g_apeb_d_t.apeb002
                           AND apeb008 = g_apeb_d_t.apeb008
                        IF SQLCA.sqlcode THEN
                           CALL s_transaction_end('N',0)
                        ELSE
                           CALL s_transaction_end('Y',0)
                        END IF 
                     END IF
                     CALL aapt415_ins_apeb('',g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb008)
                     LET l_flag = 'Y'
                     EXIT DIALOG
                  END IF
               END IF
            END IF
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb008
            #add-point:ON CHANGE apeb008 name="input.g.page1.apeb008"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apeb_d[l_ac].apeb008
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeb008',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb011
            #add-point:BEFORE FIELD apeb011 name="input.b.page1.apeb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb011
            
            #add-point:AFTER FIELD apeb011 name="input.a.page1.apeb011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb011
            #add-point:ON CHANGE apeb011 name="input.g.page1.apeb011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb003
            #add-point:BEFORE FIELD apeb003 name="input.b.page1.apeb003"
            CALL aapt415_set_entry_b(l_cmd)     #180927-00013#1 add
            CALL aapt415_set_no_entry_b(l_cmd)  #180927-00013#1 add    
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb003
            
            #add-point:AFTER FIELD apeb003 name="input.a.page1.apeb003"
            #180927-00013#1---add---(S)
            IF cl_null(l_flag2) THEN LET l_flag2 = 'N' END IF
            IF g_apeb_d[l_ac].apeb001 MATCHES '4*' AND cl_null(g_apeb_d[l_ac].apeb003) AND l_flag2 != 'Y' THEN            
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 'aap-00755'
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET l_flag2 = 'Y'
            END IF
            #180927-00013#1---add---(E)
            #180927-00013#1---mark---(S)
            #IF NOT cl_null(g_apeb_d[l_ac].apeb003)THEN
            #   IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apeb_d[l_ac].apeb003 != g_apeb_d_t.apeb003 OR g_apeb_d_t.apeb003 IS NULL )) THEN
            #      CALL aapt415_apeb002_chk(g_apeb_d[l_ac].apeb003) RETURNING g_sub_success,g_errno
            #      IF NOT g_sub_success THEN
            #         INITIALIZE g_errparam TO NULL
            #         LET g_errparam.code = g_errno
            #         LET g_errparam.extend = ''
            #         LET g_errparam.popup = TRUE
            #         CALL cl_err()
            #         LET g_apeb_d[l_ac].apeb003 = g_apeb_d_t.apeb003
            #         CALL aapt415_isam_clean()
            #         DISPLAY BY NAME g_apeb_d[l_ac].apeb003
            #         NEXT FIELD CURRENT
            #      END IF
            #      SELECT apbbdocdt,apbb055 INTO g_apeb_d[l_ac].apbbdocdt,g_apeb_d[l_ac].apbb055 
            #        FROM apbb_t
            #       WHERE apbbent   = g_enterprise
            #         AND apbbdocno = g_apeb_d[l_ac].apeb003                                
            #      DISPLAY BY NAME  g_apeb_d[l_ac].apbbdocdt,g_apeb_d[l_ac].apbb055  
            #      CALL aapt415_isam_ref()    
            #   END IF
            #END IF
            #180927-00013#1---mark--(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb003
            #add-point:ON CHANGE apeb003 name="input.g.page1.apeb003"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apeb_d[l_ac].apeb003
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeb003',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb004
            #add-point:BEFORE FIELD apeb004 name="input.b.page1.apeb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb004
            
            #add-point:AFTER FIELD apeb004 name="input.a.page1.apeb004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb004
            #add-point:ON CHANGE apeb004 name="input.g.page1.apeb004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb005
            #add-point:BEFORE FIELD apeb005 name="input.b.page1.apeb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb005
            
            #add-point:AFTER FIELD apeb005 name="input.a.page1.apeb005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb005
            #add-point:ON CHANGE apeb005 name="input.g.page1.apeb005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb031
            #add-point:BEFORE FIELD apeb031 name="input.b.page1.apeb031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb031
            
            #add-point:AFTER FIELD apeb031 name="input.a.page1.apeb031"
            #180927-00013#1---add---(S)
            IF NOT cl_null(g_apeb_d[l_ac].apeb031) THEN
               IF g_apeb_d[l_ac].apeb031 != g_apeb_d_o.apeb031 OR cl_null(g_apeb_d_o.apeb031) THEN
                  IF g_apeb_d[l_ac].apeb031 < g_apea_m.apeadocdt THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'aap-00753' #付款到期日不可小於單頭請款日期，請重新輸入！
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apeb_d[l_ac].apeb031 = g_apeb_d_o.apeb031
                     DISPLAY BY NAME g_apeb_d[l_ac].apeb031
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*
            #180927-00013#1---add---(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb031
            #add-point:ON CHANGE apeb031 name="input.g.page1.apeb031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb100
            #add-point:BEFORE FIELD apeb100 name="input.b.page1.apeb100"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb100
            
            #add-point:AFTER FIELD apeb100 name="input.a.page1.apeb100"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb100
            #add-point:ON CHANGE apeb100 name="input.g.page1.apeb100"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apeb_d[l_ac].apeb100
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeb100',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb108
            #add-point:BEFORE FIELD apeb108 name="input.b.page1.apeb108"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb108
            
            #add-point:AFTER FIELD apeb108 name="input.a.page1.apeb108"
            IF NOT cl_null(g_apeb_d[l_ac].apeb108) THEN 
               #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_apeb_d[l_ac].apeb108 != g_apeb_d_t.apeb108 OR g_apeb_d_t.apeb108 IS NULL )) THEN  #160822-00008#3  mark
               IF g_apeb_d[l_ac].apeb108 != g_apeb_d_o.apeb108 OR cl_null(g_apeb_d_o.apeb108) THEN                                      #160822-00008#3
                  #CALL aapt415_apeb108_chk(g_apea_m.apeadocno,g_apeb_d[l_ac].apebseq,g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb108)  #160104-00007#10
                  CALL s_aapt415_apeb108_chk(g_apea_m.apeadocno,g_apeb_d[l_ac].apebseq,g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb108) #160104-00007#10
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     #LET g_apeb_d[l_ac].apeb108 = g_apeb_d_t.apeb108  #160822-00008#3  mark
                     LET g_apeb_d[l_ac].apeb108 = g_apeb_d_o.apeb108   #160822-00008#3
                     DISPLAY BY NAME g_apeb_d[l_ac].apeb108
                     NEXT FIELD CURRENT
                  END IF
#                  #apcc可请款余额      
#                  SELECT SUM(COALESCE(apcc108,0)-COALESCE(apcc109,0)),
#                         SUM(COALESCE(apcc118,0)-COALESCE(apcc119,0))
#                    INTO l_apcc108,l_apcc118
#                    FROM ( SELECT DISTINCT apccdocno,apccseq,apccseq,apcc108,apcc109,apcc118,apcc119
#                           FROM apbb_t,apba_t,isam_t,apca_t,apcb_t,apcc_t 
#                          WHERE apbbent = g_enterprise
#                            AND apbbent = apbaent 
#                            AND apbbdocno = apbadocno 
#                            AND apbbent = isament 
#                            AND apbbdocno = isamdocno 
#                            AND (apba005||apba006 = apcb002||apcb003
#                             OR  isam050 = apcadocno) 
#                            AND apcaent = apcbent 
#                            AND apcald = apcbld 
#                            AND apcadocno = apcbdocno 
#                            AND apcbent = apccent 
#                            AND apcbld = apccld 
#                            AND apcbdocno = apccdocno 
#                            AND apbb002 = apca005
#                            AND isamdocno = g_apeb_d[l_ac].apeb002
#                            AND isam010 = g_apeb_d[l_ac].apeb008
#                        )
#                     
#                  IF cl_null(l_apcc108) THEN LET l_apcc108 = 0 END IF
#                  IF cl_null(l_apcc118) THEN LET l_apcc118 = 0 END IF
#                  
#                  #aapt415 己請款未核銷額(apeb108-apeb109)
#                  SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)),
#                         SUM(COALESCE(apeb118,0)-COALESCE(apeb119,0))
#                    INTO l_apeb108,l_apeb118
#                    FROM apea_t,apeb_t
#                   WHERE apebent = g_enterprise
#                     AND apeaent = apebent
#                     AND apeadocno = apebdocno 
#                     AND apeb002 = g_apeb_d[l_ac].apeb002
#                     AND apeb008 = g_apeb_d[l_ac].apeb008
#                     AND ((apebdocno = g_apea_m.apeadocno
#                     AND  apebseq <> g_apeb_d[l_ac].apebseq)
#                      OR apebdocno <> g_apea_m.apeadocno)
#                     AND apeastus <> 'X' 
#                  
#                  IF cl_null(l_apeb108) THEN LET l_apeb108 = 0 END IF
#                  IF cl_null(l_apeb118) THEN LET l_apeb118 = 0 END IF
#                  
#                  IF l_apeb108 < 0 THEN LET l_apeb108 = l_apeb108 * -1 END IF
#                  IF l_apeb118 < 0 THEN LET l_apeb118 = l_apeb118 * -1 END IF
#                     
#                  #aapt420 未確認之核銷單
#                  SELECT SUM(apce109),SUM(apce119) INTO l_apce109,l_apce119
#                    FROM apda_t,apce_t
#                   WHERE apdaent = g_enterprise
#                     AND apdaent = apceent
#                     AND apdald = apceld
#                     AND apdadocno = apcedocno
#                     AND apce03||apce04||apce05 IN (SELECT apccdocno||apccseq||apcc001
#                                                      FROM apbb_t,apba_t,isam_t,apca_t,apcb_t,apcc_t 
#                                                     WHERE apbbent = g_enterprise
#                                                       AND apbbent = apbaent 
#                                                       AND apbbdocno = apbadocno 
#                                                       AND apbbent = isament 
#                                                       AND apbbdocno = isamdocno 
#                                                       AND (apba005||apba006 = apcb002||apcb003
#                                                        OR  isam050 = apcadocno) 
#                                                       AND apcaent = apcbent 
#                                                       AND apcald = apcbld 
#                                                       AND apcadocno = apcbdocno 
#                                                       AND apcbent = apccent 
#                                                       AND apcbld = apccld 
#                                                       AND apcbdocno = apccdocno 
#                                                       AND apbb002 = apca005
#                                                       AND isamdocno = g_apeb_d[l_ac].apeb002
#                                                       AND isam010 = g_apeb_d[l_ac].apeb008)     
#                     AND apdastus <> 'X' 
#                  
#                  IF cl_null(l_apce109) THEN LET l_apce109 = 0 END IF
#                  IF cl_null(l_apce119) THEN LET l_apce119 = 0 END IF                        

                  
                  LET g_apeb_d[l_ac].apeb118 = g_apeb_d[l_ac].apeb108 * g_apeb_d[l_ac].apeb101
                  CALL s_curr_round_ld('1',g_apea_m.apeald ,g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb108,2) RETURNING g_sub_success,g_errno,g_apeb_d[l_ac].apeb108
                  CALL s_curr_round_ld('1',g_apea_m.apeald ,g_glaa001,g_apeb_d[l_ac].apeb118,2) RETURNING g_sub_success,g_errno,g_apeb_d[l_ac].apeb118
               END IF
            END IF
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*  #160822-00008#3
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb108
            #add-point:ON CHANGE apeb108 name="input.g.page1.apeb108"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb101
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_apeb_d[l_ac].apeb101,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD apeb101
            END IF 
 
 
 
            #add-point:AFTER FIELD apeb101 name="input.a.page1.apeb101"
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*  #160822-00008#3
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb101
            #add-point:BEFORE FIELD apeb101 name="input.b.page1.apeb101"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb101
            #add-point:ON CHANGE apeb101 name="input.g.page1.apeb101"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb118
            #add-point:BEFORE FIELD apeb118 name="input.b.page1.apeb118"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb118
            
            #add-point:AFTER FIELD apeb118 name="input.a.page1.apeb118"
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*  #160822-00008#3
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb118
            #add-point:ON CHANGE apeb118 name="input.g.page1.apeb118"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb006
            #add-point:BEFORE FIELD apeb006 name="input.b.page1.apeb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb006
            
            #add-point:AFTER FIELD apeb006 name="input.a.page1.apeb006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb006
            #add-point:ON CHANGE apeb006 name="input.g.page1.apeb006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb010
            #add-point:BEFORE FIELD apeb010 name="input.b.page1.apeb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb010
            
            #add-point:AFTER FIELD apeb010 name="input.a.page1.apeb010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb010
            #add-point:ON CHANGE apeb010 name="input.g.page1.apeb010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb024
            #add-point:BEFORE FIELD apeb024 name="input.b.page1.apeb024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb024
            
            #add-point:AFTER FIELD apeb024 name="input.a.page1.apeb024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb024
            #add-point:ON CHANGE apeb024 name="input.g.page1.apeb024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb025
            #add-point:BEFORE FIELD apeb025 name="input.b.page1.apeb025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb025
            
            #add-point:AFTER FIELD apeb025 name="input.a.page1.apeb025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb025
            #add-point:ON CHANGE apeb025 name="input.g.page1.apeb025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apebcomp
            #add-point:BEFORE FIELD apebcomp name="input.b.page1.apebcomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apebcomp
            
            #add-point:AFTER FIELD apebcomp name="input.a.page1.apebcomp"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apebcomp
            #add-point:ON CHANGE apebcomp name="input.g.page1.apebcomp"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apbbdocdt
            #add-point:BEFORE FIELD apbbdocdt name="input.b.page1.apbbdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apbbdocdt
            
            #add-point:AFTER FIELD apbbdocdt name="input.a.page1.apbbdocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apbbdocdt
            #add-point:ON CHANGE apbbdocdt name="input.g.page1.apbbdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apbb055
            #add-point:BEFORE FIELD apbb055 name="input.b.page1.apbb055"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apbb055
            
            #add-point:AFTER FIELD apbb055 name="input.a.page1.apbb055"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apbb055
            #add-point:ON CHANGE apbb055 name="input.g.page1.apbb055"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb012
            #add-point:BEFORE FIELD apeb012 name="input.b.page1.apeb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb012
            
            #add-point:AFTER FIELD apeb012 name="input.a.page1.apeb012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb012
            #add-point:ON CHANGE apeb012 name="input.g.page1.apeb012"
            &ifndef v1
               CALL g_autocomplete_param.clear()
               LET g_autocomplete_param[1] = g_apeb_d[l_ac].apeb012
               LET g_other_wc = ''
               CALL cl_ap_code_autocomplete(DIALOG,g_code,'apeb012',g_autocomplete_param,g_other_wc)
            &endif

            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apebld
            #add-point:BEFORE FIELD apebld name="input.b.page1.apebld"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apebld
            
            #add-point:AFTER FIELD apebld name="input.a.page1.apebld"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apebld
            #add-point:ON CHANGE apebld name="input.g.page1.apebld"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.apebseq
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apebseq
            #add-point:ON ACTION controlp INFIELD apebseq name="input.c.page1.apebseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeborga
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeborga
            #add-point:ON ACTION controlp INFIELD apeborga name="input.c.page1.apeborga"
            #160812-00027#1 --s add
            #展組織下階成員所需之暫存檔
            CALL s_fin_create_account_center_tmp()
            #CALL s_fin_account_center_sons_query('3',g_apea_m.apeasite,g_today,'1')   #161006-00005#4   mark
            CALL s_fin_account_center_sons_query('6',g_apea_m.apeasite,g_today,'1')    #161006-00005#4   add  (與SA討論後，改用資金中心)
            CALL s_fin_account_center_sons_str() RETURNING g_wc_apeborga
            CALL s_fin_get_wc_str(g_wc_apeborga) RETURNING g_wc_apeborga
            #160812-00027#1 --e add
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apeb_d[l_ac].apeborga
            #LET g_qryparam.where = " (ooef206 = 'Y' OR ooef003 ='Y' ) "                                           #160812-00027#1 mark
            LET g_qryparam.where = " ooef001 IN ",g_wc_apeborga CLIPPED," AND ooef017 ='",g_apea_m.apeacomp,"' ",  #160812-00027#1 add
                                   " AND ooef201 = 'Y'"   #161006-00005#4  add
            CALL q_ooef001()
            LET g_apeb_d[l_ac].apeborga = g_qryparam.return1
            CALL s_desc_get_department_desc(g_apeb_d[l_ac].apeborga) RETURNING g_apeb_d[l_ac].apeborga_desc
            DISPLAY BY NAME g_apeb_d[l_ac].apeborga,g_apeb_d[l_ac].apeborga_desc
            NEXT FIELD apeborga
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeborga_desc
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeborga_desc
            #add-point:ON ACTION controlp INFIELD apeborga_desc name="input.c.page1.apeborga_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb001
            #add-point:ON ACTION controlp INFIELD apeb001 name="input.c.page1.apeb001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeb002
            #add-point:ON ACTION controlp INFIELD apeb002 name="input.c.page1.apeb002"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apeb_d[l_ac].apeb002
           #LET g_qryparam.where = " apbb002 = '",g_apea_m.apea005,"' AND apbbdocdt <= '",g_apea_m.apeadocdt,"' ", #180927-00013#1 mark
            LET g_qryparam.where = " apca005 = '",g_apea_m.apea005,"' AND apbbdocdt <= '",g_apea_m.apeadocdt,"' ", #180927-00013#1 add apeb002帳款對象改apca005付款對象
                                   " AND isam050 = apcadocno ",#180724-00069#1 add 
                                   #171031-00032#1---add----str
                                   #过滤掉 立账付款完毕的 资料
                                   " AND apca001 NOT IN ('01','02','03','04','06','07')           ", #190408-00021#13 add '06','07'
                                   #" AND apca108 <> (SELECT SUM(apcc109)                ", #171127-00022#1 mark 移除(SELECT SUM(apcc109)
                                   #" AND apcc108 <>                                     ",  #171127-00022#1 add  改寫 SELECT SUM(amt1) FROM  #200412-00001#1 mark
                                   " AND c.apcc108 <>                                   ",                                                    #200412-00001#1 add       
                                   "          ( SELECT SUM(amt1) FROM (",  #171127-00022#1 add  
                                   "               (SELECT NVL(SUM (apcc109),0) amt1    ",  #171127-00022#1 add       
                                   "                  FROM apca_t a,apcc_t b            ",
                                   "                  WHERE a.apcaent = b.apccent       ",
                                   "                   AND a.apcadocno = b.apccdocno    ",
                                   "                   AND a.apcald = b.apccld          ",
                                   "                   AND a.apca018 = isamdocno        ",
                                   "                   AND a.apcaent = isament          ",
                                   "                   AND a.apca016 = '12'             ",
                                   "                   AND b.apccseq = c.apccseq        ",  #200412-00001#1 add
                                   "                   AND b.apcc001 = c.apcc001        ",  #200412-00001#1 add
                                   "                 )                                  ",                                  
                                    #171031-00032#1---add----end
                                   #200412-00001#1 mark(s)
#                                   #171127-00022#1 --s add 對帳單號開窗應排除aapt420 未確認同 apcc key 之核銷單 (同原段落aapt415_get_amt 計算可請款金額的控卡)
#                                   "            UNION                                   ",
#                                   "               (SELECT NVL(SUM(apce109),0) amt1     ",
#                                   "                  FROM apda_t,apce_t                ",
#                                   "                 WHERE apdaent = apccent            ",  
#                                   "                   AND apdaent = apceent            ",
#                                   "                   AND apdald = apceld              ",
#                                   "                   AND apdadocno = apcedocno        ",
#                                   "                   AND apce003 = apccdocno          ",
#                                   "                   AND apce004 =apccseq             ",
#                                   "                   AND apce005 =apcc001             ",
#                                   "                   AND apdastus = 'N'        )))    ",
#                                   #171127-00022#1 --e add
                                   #200412-00001#1 mark(e)
                                   #200412-00001#1 add(s)
                                   "            UNION                                   ",
                                   "               (SELECT NVL(SUM(apce109),0) amt1     ",
                                   "                  FROM apda_t,apce_t                ",
                                   "                 WHERE apdaent = c.apccent          ",  
                                   "                   AND apdaent = apceent            ",
                                   "                   AND apdald = apceld              ",
                                   "                   AND apdadocno = apcedocno        ",
                                   "                   AND apce003 = c.apccdocno        ",
                                   "                   AND apce004 = c.apccseq          ",
                                   "                   AND apce005 = c.apcc001          ",
                                   #"                   AND apdastus = 'N'        )))    ",     #PGS(D)-08172 memo mark
                                   "                   AND apdastus = 'N'        )) t51)    ",  #PGS(D)-08172 memo add
                                   #200412-00001#1 add(e)
                                   " AND apcacomp = '",g_apea_m.apeacomp,"' "
            CALL q_apeb002()
            IF NOT cl_null(g_qryparam.return1) THEN
               CALL aapt415_ins_apeb(g_qryparam.return1,'','')
               LET l_flag = 'Y'
               EXIT DIALOG
            ELSE
               NEXT FIELD apeb002
            END IF
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb007
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb007
            #add-point:ON ACTION controlp INFIELD apeb007 name="input.c.page1.apeb007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeb008
            #add-point:ON ACTION controlp INFIELD apeb008 name="input.c.page1.apeb008"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
           #LET g_qryparam.default1 = g_apeb_d[l_ac].apeb008 #180724-00069#1 mark
            LET g_qryparam.where = "isam036 in(11,21) AND isamdocno = '",g_apeb_d[l_ac].apeb002,"' ",
                                   " AND isam011 <= '",g_apea_m.apeadocdt,"' "
            CALL q_isam010_6()
            LET g_apeb_d[l_ac].apeb007 = g_qryparam.return1   #180314-00054#1   add
            DISPLAY g_apeb_d[l_ac].apeb007 TO apeb007         #180314-00054#1   add
            LET g_apeb_d[l_ac].apeb008 = g_qryparam.return2
            CALL aapt415_isam_ref()
            DISPLAY g_apeb_d[l_ac].apeb008 TO apeb008
            NEXT FIELD apeb008
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb011
            #add-point:ON ACTION controlp INFIELD apeb011 name="input.c.page1.apeb011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD apeb003
            #add-point:ON ACTION controlp INFIELD apeb003 name="input.c.page1.apeb003"
            INITIALIZE g_qryparam.* TO NULL
            #LET g_qryparam.state = 'i'
            LET g_qryparam.state = 'm'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_apeb_d[l_ac].apeb003
#180927-00013#1---mark---(S)
#            LET g_qryparam.where = " apbb002 = '",g_apea_m.apea005,"' AND apbbdocdt <= '",g_apea_m.apeadocdt,"' ", 
#                                   " AND apbbstus = 'Y'"
#            #CALL q_apeb003()  #150301apo mark
#            CALL aapt415_01() #150301apo 
#180927-00013#1---mark---(S)
            #--150301apo--mark--(s)
            #LET g_apeb_d[l_ac].apeb003 = g_qryparam.return1
            #LET g_apeb_d[l_ac].apbbdocdt = g_qryparam.return2
            #LET g_apeb_d[l_ac].apbb055  =  g_qryparam.return3
            #LET g_apeb_d[l_ac].apeb008 = g_qryparam.return4
            #LET g_apeb_d[l_ac].apeb007 = g_qryparam.return5
            #CALL aapt415_isam_ref()
            #IF cl_null(g_apeb_d[l_ac].apeb003) THEN
            #   CALL aapt415_isam_clean()
            #END IF
            #DISPLAY BY NAME g_apeb_d[l_ac].apbbdocdt,g_apeb_d[l_ac].apeb003,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apbb055   
            #NEXT FIELD apeb003
            #--150301apo--mark--(e)
#180927-00013#1---mark---(S)
#            #150301apo--(s)
#            #無選擇任何一筆
#            IF g_qryparam.str_array.getLength() = 0 THEN
#               CALL aapt415_isam_clean()
#               NEXT FIELD CURRENT
#            ELSE
#               #檢核並寫入
#               CALL aapt415_controlp_chk(g_qryparam.str_array) RETURNING l_lines
#               LET l_flag = 'Y'
#               CALL aapt415_show()
#               EXIT DIALOG
#            END IF
#            #150301apo--(e)
#180927-00013#1---mark---(E)
            #180927-00013#1---add---(S)
            LET g_qryparam.default2 = g_apeb_d[l_ac].apeb004
            LET g_qryparam.default3 = g_apeb_d[l_ac].apeb005
            LET g_qryparam.default4 = g_apeb_d[l_ac].apeb008
            SELECT gzcb003 INTO l_gzcb003_str FROM gzcb_t WHERE gzcb001 = '8530' AND gzcb002 = g_apeb_d[l_ac].apeb001
            CALL s_fin_get_wc_str(l_gzcb003_str) RETURNING l_gzcb003_str
            SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t WHERE pmaaent = g_enterprise AND pmaa001 = g_apea_m.apea005
            LET g_qryparam.arg1 = g_apea_m.apeacomp
            LET g_qryparam.arg2 = g_apea_m.apea005
            LET g_qryparam.arg3 = g_apea_m.apeadocdt
            LET g_qryparam.arg4 = g_apea_m.apeadocno
            LET g_qryparam.arg5 = g_apea_m.apeald
            LET g_qryparam.arg6 = '' #稅別為空
            IF l_pmaa004 = '2' THEN
               LET g_qryparam.where = " apcacomp ='",g_apea_m.apeacomp,"' ",
                                      " AND apca005 = '",g_apea_m.apea005,"' ",
                                      " AND apca057 = '",g_apea_m.apea006,"' ",
                                      " AND apcadocdt <= '",g_apea_m.apeadocdt,"' AND "   
            ELSE
               LET g_qryparam.where = " apcacomp ='",g_apea_m.apeacomp,"' ",
                                      " AND ((apca004 = '",g_apea_m.apea005,"' AND apca001='15') OR apca005 = '",g_apea_m.apea005,"' ",
                                      "         OR apca005 IN (SELECT pmac002 FROM pmac_t ",
                                      "                     WHERE pmacent = ",g_enterprise,
                                      "                       AND pmac001 = '",g_apea_m.apea005,"' ",
                                      "                       AND pmacstus = 'Y' )",                                    
                                      "     )",
                                      " AND apcadocdt <= '",g_apea_m.apeadocdt,"' AND "  
            END IF  
            LET g_qryparam.where = g_qryparam.where CLIPPED," apca001 IN ",l_gzcb003_str
            IF NOT cl_null(g_wc_cs_orga) THEN
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND apcasite IN ",g_wc_cs_orga," "
            END IF
            IF g_apeb_d[l_ac].apeb001 MATCHES '4[12]' THEN
               LET g_qryparam.where = g_qryparam.where CLIPPED,
                                      "  AND (apca060 IS NULL OR NOT (apca060 = '2' AND apca001 = '21'))" #不可選到開立發票的21:訂金待抵單
            END IF
            CALL aapt420_03()  
           #CALL s_aapt420_03() #190531-00010#7 add  #190531-00010#7 mark
            IF g_qryparam.str_array.getLength() = 0 THEN
               NEXT FIELD CURRENT
            ELSE
               CALL aapt415_apeb003_controlp(g_qryparam.str_array) RETURNING g_sub_success
            END IF
            IF g_sub_success THEN
               LET l_flag = 'Y'
               EXIT DIALOG
            ELSE
               NEXT FIELD CURRENT
            END IF
            #180927-00013#1---add---(E)
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb004
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb004
            #add-point:ON ACTION controlp INFIELD apeb004 name="input.c.page1.apeb004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb005
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb005
            #add-point:ON ACTION controlp INFIELD apeb005 name="input.c.page1.apeb005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb031
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb031
            #add-point:ON ACTION controlp INFIELD apeb031 name="input.c.page1.apeb031"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb100
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb100
            #add-point:ON ACTION controlp INFIELD apeb100 name="input.c.page1.apeb100"
 
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb108
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb108
            #add-point:ON ACTION controlp INFIELD apeb108 name="input.c.page1.apeb108"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb101
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb101
            #add-point:ON ACTION controlp INFIELD apeb101 name="input.c.page1.apeb101"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb118
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb118
            #add-point:ON ACTION controlp INFIELD apeb118 name="input.c.page1.apeb118"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb006
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb006
            #add-point:ON ACTION controlp INFIELD apeb006 name="input.c.page1.apeb006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb010
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb010
            #add-point:ON ACTION controlp INFIELD apeb010 name="input.c.page1.apeb010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb024
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb024
            #add-point:ON ACTION controlp INFIELD apeb024 name="input.c.page1.apeb024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb025
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb025
            #add-point:ON ACTION controlp INFIELD apeb025 name="input.c.page1.apeb025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apebcomp
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apebcomp
            #add-point:ON ACTION controlp INFIELD apebcomp name="input.c.page1.apebcomp"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apbbdocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apbbdocdt
            #add-point:ON ACTION controlp INFIELD apbbdocdt name="input.c.page1.apbbdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apbb055
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apbb055
            #add-point:ON ACTION controlp INFIELD apbb055 name="input.c.page1.apbb055"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apeb012
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apeb012
            #add-point:ON ACTION controlp INFIELD apeb012 name="input.c.page1.apeb012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.apebld
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD apebld
            #add-point:ON ACTION controlp INFIELD apebld name="input.c.page1.apebld"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_apeb_d[l_ac].* = g_apeb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE aapt415_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_apeb_d[l_ac].apebseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_apeb_d[l_ac].* = g_apeb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL aapt415_apeb_t_mask_restore('restore_mask_o')
      
               UPDATE apeb_t SET (apebdocno,apebseq,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld) = (g_apea_m.apeadocno,g_apeb_d[l_ac].apebseq,g_apeb_d[l_ac].apeborga,g_apeb_d[l_ac].apeb001, 
                   g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb011,g_apeb_d[l_ac].apeb003,g_apeb_d[l_ac].apeb004,g_apeb_d[l_ac].apeb005,g_apeb_d[l_ac].apeb031,g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb108,g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118,g_apeb_d[l_ac].apeb006, 
                   g_apeb_d[l_ac].apeb010,g_apeb_d[l_ac].apeb024,g_apeb_d[l_ac].apeb025,g_apeb_d[l_ac].apebcomp,g_apeb_d[l_ac].apeb012,g_apeb_d[l_ac].apebld)
                WHERE apebent = g_enterprise AND apebdocno = g_apea_m.apeadocno 
 
                  AND apebseq = g_apeb_d_t.apebseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_apeb_d[l_ac].* = g_apeb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "apeb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_apeb_d[l_ac].* = g_apeb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "apeb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_apea_m.apeadocno
               LET gs_keys_bak[1] = g_apeadocno_t
               LET gs_keys[2] = g_apeb_d[g_detail_idx].apebseq
               LET gs_keys_bak[2] = g_apeb_d_t.apebseq
               CALL aapt415_update_b('apeb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL aapt415_apeb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_apeb_d[g_detail_idx].apebseq = g_apeb_d_t.apebseq 
 
                  ) THEN
                  LET gs_keys[01] = g_apea_m.apeadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_apeb_d_t.apebseq
 
                  CALL aapt415_key_update_b(gs_keys,'apeb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_apea_m),util.JSON.stringify(g_apeb_d_t)
               LET g_log2 = util.JSON.stringify(g_apea_m),util.JSON.stringify(g_apeb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL aapt415_unlock_b("apeb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            
            #end add-point 
    
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
                  LET g_apeb_d[li_reproduce_target].* = g_apeb_d[li_reproduce].*
 
                  LET g_apeb_d[li_reproduce_target].apebseq = NULL
 
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_apeb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_apeb_d.getLength()+1
            END IF
            #(ver:84) ---start---
            #add-point:input段單身複製  name="input.body.controlo"
            
            #end add-point
            #(ver:84) --- end ---
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="aapt415.input.other" type="s" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD apeadocno #170906-00011#1
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD apebseq #170906-00011#1
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               
               #end add-point  
            END CASE
         END IF
      
      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"
         
         #end add-point    
         
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
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
         #add-point:input段accept  name="input.accept"
         
         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"
         
         #end add-point
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   IF l_flag = 'Y' THEN
      CONTINUE WHILE
   ELSE
      EXIT WHILE
   END IF
   
END WHILE
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.show" type="s" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION aapt415_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   CALL s_ld_sel_glaa(g_apea_m.apeald,'glaa001|glaa002|glaa024|glaa026') RETURNING  g_sub_success,g_glaa001,g_glaa002,g_glaa024,g_glaa026
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL aapt415_b_fill() #單身填充
      CALL aapt415_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL aapt415_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   CALL s_desc_get_department_desc(g_apea_m.apeasite) RETURNING g_apea_m.apeasite_desc
   CALL s_desc_get_person_desc(g_apea_m.apea003 ) RETURNING g_apea_m.apea003_desc
   CALL s_desc_get_trading_partner_abbr_desc(g_apea_m.apea005) RETURNING g_apea_m.apea005_desc
   #160802-00007#2-----s
   IF cl_null(g_apea_m.apea005) THEN
      LET g_apea_m.apea006 = ''
   END IF

   IF NOT cl_null(g_apea_m.apea006) THEN
      #CALL s_axrt300_xrca_ref('xrca057',g_apea_m.apea006,'','') RETURNING g_sub_success,g_apea_m.apea005_desc  #170522-00030#1 mark
      CALL s_axrt300_xrca_ref('xrca057',g_apea_m.apea005,g_apea_m.apea006,'') RETURNING g_sub_success,g_apea_m.apea005_desc  #170522-00030#1 add
   END IF
   #160802-00007#2-----e    
   #end add-point
   
   #遮罩相關處理
   LET g_apea_m_mask_o.* =  g_apea_m.*
   CALL aapt415_apea_t_mask()
   LET g_apea_m_mask_n.* =  g_apea_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc,g_apea_m.apea003,g_apea_m.apea003_desc,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea005_desc,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus, 
       g_apea_m.apeaownid,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp,g_apea_m.apeacrtdp_desc,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamodid_desc,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfid_desc, 
       g_apea_m.apeacnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_apea_m.apeastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_apeb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
 
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL aapt415_detail_show()
 
   #add-point:show段之後 name="show.after"
   #191203-00012#8---add---(S)
   CALL aapt415_set_act_visible()
   CALL aapt415_set_act_no_visible()
   #191203-00012#8---add---(E)
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.detail_show" type="s" >}
#+ 第二階單身reference
PRIVATE FUNCTION aapt415_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point  
   #add-point:detail_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="detail_show.before"
   
   #end add-point
   
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.reproduce" type="s" >}
#+ 資料複製
PRIVATE FUNCTION aapt415_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE apea_t.apeadocno 
   DEFINE l_oldno     LIKE apea_t.apeadocno 
 
   DEFINE l_master    RECORD LIKE apea_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE apeb_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   LET g_master_insert = FALSE
   
   IF g_apea_m.apeadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_apeadocno_t = g_apea_m.apeadocno
 
    
   LET g_apea_m.apeadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_apea_m.apeaownid = g_user
      LET g_apea_m.apeaowndp = g_dept
      LET g_apea_m.apeacrtid = g_user
      LET g_apea_m.apeacrtdp = g_dept 
      LET g_apea_m.apeacrtdt = cl_get_current()
      LET g_apea_m.apeamodid = g_user
      LET g_apea_m.apeamoddt = cl_get_current()
      LET g_apea_m.apeastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_apea_m.apeastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL aapt415_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_apea_m.* TO NULL
      INITIALIZE g_apeb_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL aapt415_show()
      CALL aapt415_idx_chk()   #(ver:83)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = 9001 
      LET g_errparam.popup = FALSE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL aapt415_set_act_visible()   
   CALL aapt415_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_apeadocno_t = g_apea_m.apeadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " apeaent = " ||g_enterprise|| " AND",
                      " apeadocno = '", g_apea_m.apeadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL aapt415_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL aapt415_idx_chk()
   
   LET g_data_owner = g_apea_m.apeaownid      
   LET g_data_dept  = g_apea_m.apeaowndp
   LET g_data_crtid = g_apea_m.apeacrtid   #180201-00054
   LET g_data_crtdp = g_apea_m.apeacrtdp   #180201-00054
   
   #功能已完成,通報訊息中心
   CALL aapt415_msgcentre_notify('reproduce')
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.detail_reproduce" type="s" >}
#+ 單身自動複製
PRIVATE FUNCTION aapt415_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE apeb_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE aapt415_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM apeb_t
    WHERE apebent = g_enterprise AND apebdocno = g_apeadocno_t
 
    INTO TEMP aapt415_detail
 
   #將key修正為調整後   
   UPDATE aapt415_detail 
      #更新key欄位
      SET apebdocno = g_apea_m.apeadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO apeb_t SELECT * FROM aapt415_detail
   
   IF SQLCA.SQLCODE THEN
      #180110-00034 ---start---
      #add-point:錯誤時處理 name="detail_reproduce.body.table1.rollback"
      
      #end add-point
      CALL s_transaction_end('N','0')
      #180110-00034 --- end ---
 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE aapt415_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_apeadocno_t = g_apea_m.apeadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.delete" type="s" >}
#+ 資料刪除
PRIVATE FUNCTION aapt415_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_apea_m.apeadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN aapt415_cl USING g_enterprise,g_apea_m.apeadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN aapt415_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE aapt415_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE aapt415_master_referesh USING g_apea_m.apeadocno INTO g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid, 
       g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp_desc,g_apea_m.apeamodid_desc,g_apea_m.apeacnfid_desc 
 
   
   
   #檢查是否允許此動作
   IF NOT aapt415_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_apea_m_mask_o.* =  g_apea_m.*
   CALL aapt415_apea_t_mask()
   LET g_apea_m_mask_n.* =  g_apea_m.*
   
   CALL aapt415_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL aapt415_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_apeadocno_t = g_apea_m.apeadocno
 
 
      DELETE FROM apea_t
       WHERE apeaent = g_enterprise AND apeadocno = g_apea_m.apeadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_apea_m.apeadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_fin_del_docno(g_apea_m.apeald,g_apea_m.apeadocno ,g_apea_m.apeadocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM apeb_t
       WHERE apebent = g_enterprise AND apebdocno = g_apea_m.apeadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "apeb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_apea_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE aapt415_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_apeb_d.clear() 
 
     
      CALL aapt415_ui_browser_refresh()  
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
         #161130-00056 add
      
      #單身多語言刪除
      
         #161130-00056 add
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      #清空單頭資料
      INITIALIZE g_apea_m.* TO NULL   #180420-00043
 
      IF g_browser_cnt > 0 THEN 
         #CALL aapt415_browser_fill("")
         CALL aapt415_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE aapt415_cl
 
   #功能已完成,通報訊息中心
   CALL aapt415_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="aapt415.b_fill" type="s" >}
#+ 單身陣列填充
PRIVATE FUNCTION aapt415_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_apeb_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF aapt415_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR 
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT apebseq,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld  FROM apeb_t",   
                     " INNER JOIN apea_t ON apeaent = " ||g_enterprise|| " AND apeadocno = apebdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                     
                     " WHERE apebent=? AND apebdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY apeb_t.apebseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE aapt415_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR aapt415_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
      FOREACH b_fill_cs USING g_enterprise,g_apea_m.apeadocno INTO g_apeb_d[l_ac].apebseq,g_apeb_d[l_ac].apeborga,g_apeb_d[l_ac].apeb001,g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb011,g_apeb_d[l_ac].apeb003,g_apeb_d[l_ac].apeb004,g_apeb_d[l_ac].apeb005,g_apeb_d[l_ac].apeb031, 
          g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb108,g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118,g_apeb_d[l_ac].apeb006,g_apeb_d[l_ac].apeb010,g_apeb_d[l_ac].apeb024,g_apeb_d[l_ac].apeb025,g_apeb_d[l_ac].apebcomp,g_apeb_d[l_ac].apeb012,g_apeb_d[l_ac].apebld   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         LET g_apeb_d[l_ac].apeborga_desc = s_desc_get_department_desc(g_apeb_d[l_ac].apeborga)
         SELECT apbbdocdt,apbb055 INTO g_apeb_d[l_ac].apbbdocdt,g_apeb_d[l_ac].apbb055
             FROM apbb_t
            WHERE apbbent   = g_enterprise
              AND apbbdocno = g_apeb_d[l_ac].apeb003
          
         #end add-point
      
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
   
   END IF
    
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_apeb_d.deleteElement(g_apeb_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE aapt415_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_apeb_d.getLength()
      LET g_apeb_d_mask_o[l_ac].* =  g_apeb_d[l_ac].*
      CALL aapt415_apeb_t_mask()
      LET g_apeb_d_mask_n[l_ac].* =  g_apeb_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.delete_b" type="s" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION aapt415_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   DEFINE l_apeb002   LIKE apeb_t.apeb002
   DEFINE l_apeb008   LIKE apeb_t.apeb008
   DEFINE l_length    LIKE type_t.num5
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
#  LET g_update = TRUE  #200610-00021 mark
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
     #IF 1=2 THEN               #170223-00028 mark
      #end add-point    
      DELETE FROM apeb_t
       WHERE apebent = g_enterprise AND
         apebdocno = ps_keys_bak[1] AND apebseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
     #170223-00028---mark---start---
     #程式裡允許同一張對帳單號+發票號碼可分多筆輸入，所以應可刪除其中一筆而不是全部刪除
     #ELSE
     #   DELETE FROM apeb_t
     #    WHERE apebent = g_enterprise 
     #      AND apebdocno = ps_keys_bak[1] 
     #      AND apeb002 = g_apeb_d[l_ac].apeb002
     #      AND apeb008 = g_apeb_d[l_ac].apeb008
     #   
     #   LET l_apeb002 = g_apeb_d[l_ac].apeb002
     #   LET l_apeb008 = g_apeb_d[l_ac].apeb008  
     #   LET l_length = g_apeb_d.getLength()     
     #      
     #   FOR li_idx = l_length TO 1 STEP -1
     #      IF g_apeb_d[li_idx].apeb002 = l_apeb002 AND g_apeb_d[li_idx].apeb008 = l_apeb008 THEN 
     #         CALL g_apeb_d.deleteElement(li_idx)
     #      END IF
     #   END FOR
     #END IF
     #170223-00028---mark---end---
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ":",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_apeb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   LET g_update = TRUE  #200610-00021
 
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.insert_b" type="s" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION aapt415_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
#  LET g_update = TRUE   #200610-00021 mark
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO apeb_t
                  (apebent,
                   apebdocno,
                   apebseq
                   ,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_apeb_d[g_detail_idx].apeborga,g_apeb_d[g_detail_idx].apeb001,g_apeb_d[g_detail_idx].apeb002,g_apeb_d[g_detail_idx].apeb007,g_apeb_d[g_detail_idx].apeb008,g_apeb_d[g_detail_idx].apeb011,g_apeb_d[g_detail_idx].apeb003,g_apeb_d[g_detail_idx].apeb004,g_apeb_d[g_detail_idx].apeb005, 
                       g_apeb_d[g_detail_idx].apeb031,g_apeb_d[g_detail_idx].apeb100,g_apeb_d[g_detail_idx].apeb108,g_apeb_d[g_detail_idx].apeb101,g_apeb_d[g_detail_idx].apeb118,g_apeb_d[g_detail_idx].apeb006,g_apeb_d[g_detail_idx].apeb010,g_apeb_d[g_detail_idx].apeb024,g_apeb_d[g_detail_idx].apeb025, 
                       g_apeb_d[g_detail_idx].apebcomp,g_apeb_d[g_detail_idx].apeb012,g_apeb_d[g_detail_idx].apebld)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "apeb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_apeb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
   LET g_update = TRUE   #200610-00021
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.update_b" type="s" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION aapt415_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point   
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
#  LET g_update = TRUE   #200610-00021 mark
   
   #判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "apeb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL aapt415_apeb_t_mask_restore('restore_mask_o')
               
      UPDATE apeb_t 
         SET (apebdocno,
              apebseq
              ,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_apeb_d[g_detail_idx].apeborga,g_apeb_d[g_detail_idx].apeb001,g_apeb_d[g_detail_idx].apeb002,g_apeb_d[g_detail_idx].apeb007,g_apeb_d[g_detail_idx].apeb008,g_apeb_d[g_detail_idx].apeb011,g_apeb_d[g_detail_idx].apeb003,g_apeb_d[g_detail_idx].apeb004,g_apeb_d[g_detail_idx].apeb005,g_apeb_d[g_detail_idx].apeb031, 
                  g_apeb_d[g_detail_idx].apeb100,g_apeb_d[g_detail_idx].apeb108,g_apeb_d[g_detail_idx].apeb101,g_apeb_d[g_detail_idx].apeb118,g_apeb_d[g_detail_idx].apeb006,g_apeb_d[g_detail_idx].apeb010,g_apeb_d[g_detail_idx].apeb024,g_apeb_d[g_detail_idx].apeb025,g_apeb_d[g_detail_idx].apebcomp,g_apeb_d[g_detail_idx].apeb012, 
                  g_apeb_d[g_detail_idx].apebld) 
         WHERE apebent = g_enterprise AND apebdocno = ps_keys_bak[1] AND apebseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "apeb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "apeb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL aapt415_apeb_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
   LET g_update = TRUE   #200610-00021
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.key_update_b" type="s" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION aapt415_key_update_b(ps_keys_bak,ps_table)
   #add-point:update_b段define(客製用) name="key_update_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_key       DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_update_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_update_b.pre_function"
   
   #end add-point
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.key_delete_b" type="s" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION aapt415_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_delete_b.pre_function"
   
   #end add-point
   
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.lock_b" type="s" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION aapt415_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   #210121-00016#5 add -s
   IF ps_page = "'2'" THEN
      LET ls_group = "apeb_t"
      IF ls_group.getIndexOf(ps_table,1) THEN
         OPEN aapt415_bcl1 USING g_enterprise,
                                          g_apea_m.apeadocno,g_apeb_d[g_detail_idx].apebseq     
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "aapt415_bcl:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            RETURN FALSE
         END IF
      END IF
   ELSE
   #210121-00016#5 add -e
   #end add-point
    
   #先刷新資料
   #CALL aapt415_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "apeb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN aapt415_bcl USING g_enterprise,
                                       g_apea_m.apeadocno,g_apeb_d[g_detail_idx].apebseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "aapt415_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   END IF  #210121-00016#5 add
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.unlock_b" type="s" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION aapt415_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE aapt415_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   #210121-00016#5 add -s
   IF ps_page = "'2'" THEN
      LET ls_group = "'2',"
      IF ls_group.getIndexOf(ps_page,1) THEN
         CLOSE aapt415_bcl1
      END IF
   END IF
   #210121-00016#5 add -e
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_entry" type="s" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION aapt415_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("apeadocno,apeald",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("apeadocno",TRUE)
      CALL cl_set_comp_entry("apeadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("apeadocdt",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("apea001,apea003,apea019,apea020,apea005,apea013,apeasite",TRUE) #180103-00037#10 add
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_no_entry" type="s" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION aapt415_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_dfin0033  LIKE type_t.chr1  #151130-00015#2
   DEFINE l_success   LIKE type_t.chr1  #151130-00015#2
   DEFINE l_slip      LIKE type_t.chr80  #151130-00015#2 
   DEFINE l_fields    STRING             #180103-00037#10 add
   DEFINE l_cmt       LIKE type_t.num10  #151130-00015#2 
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("apeadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("apeadocno,apeald",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("apeadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #151130-00015#2  -add -str
   IF NOT cl_null(g_apea_m.apeadocno) THEN  
      #获取单别
      CALL s_aooi200_fin_get_slip(g_apea_m.apeadocno) RETURNING l_success,l_slip
      #取得單別設置的"是否直接審核"參數
      CALL s_fin_get_doc_para(g_apea_m.apeald,g_apea_m.apeacomp,l_slip,'D-FIN-0033') RETURNING l_dfin0033
      #IF l_dfin0033 = "Y"  THEN                     #180402-00011#1 mark
      IF (l_dfin0033 = "Y") OR (p_cmd = 'a') THEN    #180402-00011#1 add (p_cmd = 'a') 新增時不受D-FIN-0033限制      
         CALL cl_set_comp_entry("apeadocdt",TRUE)
      #180402-00011#1 --s add
      ELSE
         CALL cl_set_comp_entry("apeadocdt",FALSE)
      #180402-00011#1 --e add    
      END IF
      #180103-00037#10 add(s)
      LET l_fields = ''
      CALL s_aooi200_fin_get_doc_fields(g_site,'2',g_apea_m.apeadocno,g_apea_m.apeald) RETURNING l_fields
      CALL cl_set_comp_entry(l_fields,FALSE)
      #180103-00037#10 add(e)
   END IF 
   #151130-00015#2  -end -str
   CALL cl_set_comp_entry("apea013,apea019,apea020",FALSE) #180723-00032#1 add
   
   #200624-00064#1 add--s
   SELECT count(1) INTO l_cmt FROM apeb_t 
     WHERE apebent = g_enterprise
       AND apebdocno = g_apea_m.apeadocno
       
   IF l_cmt > 0 THEN
      CALL cl_set_comp_entry("apea005",FALSE)
   END IF
   #200624-00064#1 add--e
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_entry_b" type="s" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION aapt415_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   #210121-00016#5 add -s
   #款别性质更改时只开放款别修改
   IF p_cmd = 'x' THEN
      CALL cl_set_comp_entry("apebseq,apeborga,apeb001,apeb002,apeb007,apeb008,apeb003,apeb108,apeb010",FALSE)
   ELSE
      CALL cl_set_comp_entry("apebseq,apeborga,apeb001,apeb108,apeb010",TRUE)
   #210121-00016#5 add -e
      #180927-00013#1---add---(S)
      CALL cl_set_comp_entry("apeb002,apeb008,apeb003",TRUE)
      CALL cl_set_comp_required("apeb002,apeb008,apeb003",FALSE) 
      SELECT isai002 INTO g_isai002
        FROM ooef_t
        LEFT JOIN isai_t ON ooefent = isaient AND ooef019 = isai001
       WHERE ooefent = g_enterprise
         AND ooef001 = g_apea_m.apeacomp
      IF g_isai002 <> "1" THEN
         CALL cl_set_comp_entry("apeb007",TRUE)
      END IF
      #180927-00013#1---add---(E)
   END IF  #210121-00016#5 add
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_no_entry_b" type="s" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION aapt415_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   IF p_cmd <> 'x' THEN  #210121-00016#5 add
      #180927-00013#1---add---(S)
      CASE  
         WHEN g_apeb_d[l_ac].apeb001 = 'aapt110' 
            CALL cl_set_comp_entry("apeb003",FALSE)  
            CALL cl_set_comp_required("apeb002,apeb008",TRUE) 
         WHEN g_apeb_d[l_ac].apeb001 MATCHES '4[012]'
            CALL cl_set_comp_entry("apeb002,apeb008",FALSE)
            IF g_isai002 <> "1" THEN
               CALL cl_set_comp_entry("apeb007",FALSE)
            END IF
            CALL cl_set_comp_required("apeb003",TRUE) 
      END CASE
      #180927-00013#1---add---(E)
   END IF  #210121-00016#5 add 
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_act_visible" type="s" >}
#+ 單頭權限開啟
PRIVATE FUNCTION aapt415_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("aapt415_paychk", TRUE) #191203-00012#8 add
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_act_no_visible" type="s" >}
#+ 單頭權限關閉
PRIVATE FUNCTION aapt415_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   DEFINE l_ld          LIKE glaa_t.glaald      #160225-00001#1
   DEFINE l_dfin0033    LIKE type_t.chr1        #160225-00001#1
   DEFINE l_slip        LIKE apca_t.apcadocno   #160225-00001#1
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_apea_m.apeastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #160225-00001#1--(S)
   IF NOT cl_null(g_apea_m.apeadocno) THEN
      CALL s_fin_orga_get_comp_ld(g_apea_m.apeasite) RETURNING g_sub_success,g_errno,g_apea_m.apeacomp,l_ld #161102-00046#1 add 重新取得apeacomp,避免傳入參數為空報錯
      CALL cl_get_para(g_enterprise,g_apea_m.apeacomp,'S-FIN-2002') RETURNING g_sfin2002 #180927-00013#1 add
      SELECT glaald INTO l_ld FROM glaa_t
       WHERE glaaent = g_enterprise
         AND glaacomp = g_apea_m.apeacomp
         AND glaa014 = 'Y'
      CALL s_aooi200_fin_get_slip(g_apea_m.apeadocno) RETURNING g_sub_success,l_slip
      CALL s_fin_get_doc_para(l_ld,g_apea_m.apeacomp,l_slip,'D-FIN-0033') RETURNING l_dfin0033
      CALL s_fin_date_close_chk('@',g_apea_m.apeacomp,'AAP',g_apea_m.apeadocdt) RETURNING g_sub_success
      IF l_dfin0033 = "N" AND NOT g_sub_success THEN 
         CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
      END IF
   END IF
   #160225-00001#1--(E)
   #191203-00012#8---add---(S)
   IF cl_null(g_apea_m.apeadocno) THEN
      CALL cl_set_act_visible("aapt415_paychk", FALSE)
   END IF
   #191203-00012#8---add---(E)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_act_visible_b" type="s" >}
#+ 單身權限開啟
PRIVATE FUNCTION aapt415_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.set_act_no_visible_b" type="s" >}
#+ 單身權限關閉
PRIVATE FUNCTION aapt415_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   SELECT isai002 INTO g_isai002
     FROM ooef_t
     LEFT JOIN isai_t ON ooefent = isaient AND ooef019 = isai001
    WHERE ooefent = g_enterprise
      AND ooef001 = g_apea_m.apeacomp
   IF g_isai002 = "1" THEN
      CALL cl_set_comp_visible('apeb007',FALSE)
   ELSE
      CALL cl_set_comp_visible('apeb007',TRUE)
   END IF   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.default_search" type="s" >}
#+ 外部參數搜尋
PRIVATE FUNCTION aapt415_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point  
   DEFINE li_idx     LIKE type_t.num10
   DEFINE li_cnt     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE ls_where   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="default_search.before"
   
   #end add-point  
   
   LET g_pagestart = 1
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " apeadocno = '", g_argv[01], "' AND "
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
         LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
         LET g_default = TRUE
      ELSE
         #若無外部參數則預設為1=2
         LET g_default = FALSE
         
         #預設查詢條件
         CALL cl_qbe_get_default_qryplan() RETURNING ls_where
         IF NOT cl_null(ls_where) THEN
            CALL util.JSON.parse(ls_where, la_wc)
            INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
            LET g_wc2_extend = " 1=1" #190730-00003#4 add
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "apea_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "apeb_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
 
                  WHEN la_wc[li_idx].tableid = "EXTENDWC"
                     LET g_wc2_extend = la_wc[li_idx].wc
               END CASE
            END FOR
            IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
               OR NOT cl_null(g_wc2_extend)
               THEN
               #組合g_wc2
               IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                  LET g_wc2 = g_wc2_table1
               END IF
 
               IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend)
                                         AND NOT g_wc2.getIndexOf(g_wc2_extend,1) THEN   #200828-00027檢查後補入,避免g_wc2重複增加 (代追單)
                  LET g_wc2 = g_wc2 ," AND ", g_wc2_extend                  #200917-00047
               END IF
            
               IF g_wc2.subString(1,5) = " AND " THEN
                  LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
               END IF
            END IF
         END IF
       
         IF cl_null(g_wc) AND cl_null(g_wc2) THEN
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
 
{<section id="aapt415.state_change" type="s" >}
   #應用 a09 樣板自動產生(Version:24)
#+ 確認碼變更 
PRIVATE FUNCTION aapt415_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_n          LIKE type_t.num5
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_apeb003    LIKE apeb_t.apeb003    #161220-00044#1 add
   DEFINE l_apeb004    LIKE apeb_t.apeb004    #170720-00041#1 add
   DEFINE l_apeb005    LIKE apeb_t.apeb005    #170720-00041#1 add
   DEFINE l_apebseq    LIKE apeb_t.apebseq    #170720-00041#1 add
   DEFINE l_count      LIKE type_t.num5       #161220-00044#1 add
   DEFINE l_apeb003_s  STRING                 #161220-00044#1 add
   
   DEFINE g_sfin3007   LIKE apea_t.apeadocdt  #180907-00038#1  18/09/19 By 11384
   
   #160308-00010#1 mark ---(S)---
   #CALL cl_set_act_visible("signing,withdraw",FALSE)
   #CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
   #CALL cl_set_act_visible("closed",FALSE)
   #CASE g_apea_m.apeastus
   #    WHEN "N"
   #       CALL cl_set_act_visible("unconfirmed,hold",FALSE)
   #       #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
   #       IF cl_bpm_chk() THEN
   #           CALL cl_set_act_visible("signing",TRUE)
   #           CALL cl_set_act_visible("confirmed",FALSE)
   #       END IF
   #    
   #    WHEN "R"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
   #       CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
   #    
   #    WHEN "D"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
   #       CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
   #    
   #    WHEN "X"
   #       CALL s_transaction_end('N','0')       #150401-00001#13
   #       RETURN
   #    
   #    WHEN "Y"
   #       CALL cl_set_act_visible("invalid,confirmed",FALSE)
   #    
   #    WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
   #       CALL cl_set_act_visible("withdraw",TRUE)
   #       CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
   #    
   #    WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
   #       CALL cl_set_act_visible("confirmed ",TRUE)
   #       CALL cl_set_act_visible("unconfirmed,invalid",FALSE)
   #END CASE
   #160308-00010#1 mark ---(E)---
   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   #161220-00044#1 add (S)
   #取得單身的應付單號
   #LET g_sql = "SELECT apeb003 FROM apeb_t ",                          #170720-00041#1 mark
   LET g_sql = "SELECT apebseq,apeb003,apeb004,apeb005 FROM apeb_t ",   #170720-00041#1 add
               " INNER JOIN apea_t ON apeaent = apebent AND apeadocno = apebdocno ",
               " WHERE apebent = ",g_enterprise," AND apebdocno = '",g_apea_m.apeadocno,"' "
   PREPARE aapt415_apeb003_pre FROM g_sql
   DECLARE aapt415_apeb003_cs CURSOR FOR aapt415_apeb003_pre
   
   #檢核是否存在aapt420
   LET g_sql = " SELECT COUNT(*) FROM apda_t,apce_t ",
               "  WHERE apdaent = apceent ",
               "    AND apdald = apceld ",
               "    AND apdadocno = apcedocno ",
               "    AND apdaent = ",g_enterprise,
               "    AND apdald = '",g_apea_m.apeald,"' ",
               "    AND apdastus <> 'X' ",
               "    AND apce003 = ? "
              ,"    AND apce004 = ? ",                          #170720-00041#1 add
               "    AND apce005 = ? ",                          #170720-00041#1 add
               "    AND apce049 = '",g_apea_m.apeadocno,"' ",   #170720-00041#1 add
               "    AND apce050 = ? "                           #170720-00041#1 add 
   PREPARE aapt415_apce003 FROM g_sql  
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   #180130-00006 ---start---
   #保存單頭舊值
   LET g_apea_m_t.* = g_apea_m.*
   LET g_apea_m_o.* = g_apea_m.*
   #180130-00006 --- end ---
 
   IF g_apea_m.apeadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN aapt415_cl USING g_enterprise,g_apea_m.apeadocno
   IF SQLCA.SQLCODE THEN
      CLOSE aapt415_cl
   #  CALL s_transaction_end('N','0')   #(ver:19)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN aapt415_cl:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')   #(ver:19)
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE aapt415_master_referesh USING g_apea_m.apeadocno INTO g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid, 
       g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp_desc,g_apea_m.apeamodid_desc,g_apea_m.apeacnfid_desc 
 
   
 
   #檢查是否允許此動作
   IF NOT aapt415_action_chk() THEN
      CLOSE aapt415_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc,g_apea_m.apea003,g_apea_m.apea003_desc,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea005_desc,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus, 
       g_apea_m.apeaownid,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp,g_apea_m.apeacrtdp_desc,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamodid_desc,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfid_desc, 
       g_apea_m.apeacnfdt
 
   CASE g_apea_m.apeastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   #180907-00038#1 add_S 18/09/19 By 11384
   IF NOT cl_null(g_apea_m.apeadocdt) THEN
      CALL cl_get_para(g_enterprise,g_apea_m.apeasite,'S-FIN-3007') RETURNING g_sfin3007
      IF NOT cl_null(g_sfin3007) THEN
         IF g_apea_m.apeadocdt <= g_sfin3007 THEN
            CLOSE aapt415_cl
            CALL s_transaction_end('N','0')
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'aap-00736'
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN
         END IF
      END IF
   END IF
   #180907-00038#1 add_E 18/09/19 By 11384
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_apea_m.apeastus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "X"
               HIDE OPTION "invalid"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
         END CASE
     
         #181128-00048 ---start---
         #181211 SA說暫時先mark此段功能
      #  #BPM功能
      #  CALL cl_set_act_visible("reunconfirmed",FALSE)
      #  CASE g_apea_m.apeastus
      #      WHEN "A"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #      WHEN "D"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #      WHEN "R"
      #         CALL cl_set_act_visible("reunconfirmed",TRUE)
      #  END CASE
         #181128-00048 --- end ---
 
      #add-point:menu前 name="statechange.before_menu"
         CASE g_apea_m.apeastus
            WHEN "Y"
               HIDE OPTION "invalid"
         END CASE
         
      #160308-00010#1 add ---(S)---
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
      CALL cl_set_act_visible("closed",FALSE)
      
      CASE g_apea_m.apeastus
          WHEN "N"
             CALL cl_set_act_visible("unconfirmed",FALSE)
             #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
             IF cl_bpm_chk() THEN
                 CALL cl_set_act_visible("signing",TRUE)
                 CALL cl_set_act_visible("confirmed",FALSE)
             END IF
          
          WHEN "R"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
             CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
          
          WHEN "D"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
             CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)
          
          WHEN "X"
             CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
             CALL s_transaction_end('N','0')       #150401-00001#13
             RETURN
          
          WHEN "Y"
             CALL cl_set_act_visible("invalid,confirmed",FALSE)
          
          WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
             CALL cl_set_act_visible("withdraw",TRUE)
             CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
          
          WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
             CALL cl_set_act_visible("confirmed ",TRUE)
             CALL cl_set_act_visible("unconfirmed,invalid",FALSE)
      END CASE
      #160308-00010#1 add ---(E)---   
      #end add-point
      
      #應用 a36 樣板自動產生(Version:6)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT aapt415_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE aapt415_cl
             RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT aapt415_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE aapt415_cl
             RETURN
         END IF
 
      #181128-00048 ---start---
      #181211 SA說暫時先mark此段功能
      #還原為未確認
   #  ON ACTION reunconfirmed
   #     IF cl_auth_chk_act("reunconfirmed") THEN
   #        LET lc_state = "N"
   #        IF g_apea_m.apeastus = "A" THEN   #當狀態已核准寫入log
   #           CALL cl_bpm_write_status_log("RN")   #寫入log
   #        END IF
   #        #add-point:action控制 name="statechange.reunconfirmed"
   #        
   #        #end add-point
   #     END IF
   #     EXIT MENU
      #181128-00048 --- end ---
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            #160104-00007#10   ---s---
            #LET l_n = 0
            #SELECT COUNT(*) INTO l_n 
            #  FROM apeb_t
            # WHERE apebent = g_enterprise
            #   AND apebdocno = g_apea_m.apeadocno
            #   AND apeb024 IS NOT NULL
            #   
            #IF l_n > 0 THEN 
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "" 
            #   LET g_errparam.code   = "aap-00416" 
            #   LET g_errparam.popup  = TRUE 
            #   CALL cl_err()
            #   RETURN
            #END IF
            #
            #LET l_n = 0
            #SELECT COUNT(*) INTO l_n
            #  FROM nmck_t,nmcl_t
            # WHERE nmckent = g_enterprise
            #   AND nmckent = nmclent
            #   AND nmckcomp = nmclcomp
            #   AND nmckdocno = nmcldocno  
            #   AND nmckstus <> 'X'               
            #   AND nmcl001||nmcl002 IN (SELECT apebdocno||apebseq FROM apeb_t
            #                             WHERE apebent = g_enterprise
            #                               AND apebdocno = g_apea_m.apeadocno
            #                            )
            #   
            #IF l_n > 0 THEN 
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "" 
            #   LET g_errparam.code   = "aap-00417" 
            #   LET g_errparam.popup  = TRUE 
            #   CALL cl_err()
            #   RETURN
            #END IF
            #160104-00007#10   ---e---
            #161220-00044#1 add (S)
            LET l_count = 0
            #FOREACH aapt415_apeb003_cs INTO l_apeb003                                #170720-00041#1 mark
            FOREACH aapt415_apeb003_cs INTO l_apebseq,l_apeb003,l_apeb004,l_apeb005   #170720-00041#1 add
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "Foreach: aapt415_apeb003_cs ",SQLERRMESSAGE 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  LET l_count = 1
                  CALL cl_err()                  
                  EXIT FOREACH
               END IF
               
               LET l_n = 0
               #EXECUTE aapt415_apce003 USING l_apeb003 INTO l_n                                #170720-00041#1 mark
               EXECUTE aapt415_apce003 USING l_apeb003,l_apeb004,l_apeb005,l_apebseq INTO l_n   #170720-00041#1 add
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "EXECUTE: aapt415_apce003 ",SQLERRMESSAGE 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  LET l_count = 1
                  CALL cl_err()
                  EXIT FOREACH
               END IF
               
               IF l_n > 0 THEN
                  LET l_apeb003_s = l_apeb003_s,l_apeb003,','
                  LET l_count = l_count + l_n
               END IF
            END FOREACH
            IF l_count > 0 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_apeb003_s
               LET g_errparam.code   = "anm-00298" 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               RETURN
            END IF
            #161220-00044#1 add (E)
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            #160104-00007#10   ---s---
            #LET l_n = 0
            #SELECT COUNT(*) INTO l_n
            #  FROM apeb_t
            # WHERE apebent = g_enterprise
            #   AND apebdocno = g_apea_m.apeadocno
            #   
            #IF l_n = 0 THEN 
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "" 
            #   LET g_errparam.code   = "axm-00228" 
            #   LET g_errparam.popup  = TRUE 
            #   CALL cl_err()
            #   RETURN
            #END IF
            #CALL cl_err_collect_init()
            #CALL aapt415_confirm_chk() RETURNING l_success
            #IF l_success = FALSE THEN 
            #   CALL cl_err_collect_show()  
            #   RETURN
            #END IF
            #CALL cl_err_collect_show()  
            #160104-00007#10   ---e---
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION approved
         IF cl_auth_chk_act("approved") THEN
            LET lc_state = "A"
            #add-point:action控制 name="statechange.approved"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION withdraw
      #   IF cl_auth_chk_act("withdraw") THEN
      #      LET lc_state = "D"
      #      #add-point:action控制 name="statechange.withdraw"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION rejection
         IF cl_auth_chk_act("rejection") THEN
            LET lc_state = "R"
            #add-point:action控制 name="statechange.rejection"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION signing
      #   IF cl_auth_chk_act("signing") THEN
      #      LET lc_state = "W"
      #      #add-point:action控制 name="statechange.signing"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   LET INT_FLAG=FALSE  #(ver.18)
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      AND lc_state <> "X"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      ) OR 
      g_apea_m.apeastus = lc_state OR cl_null(lc_state) THEN
      CLOSE aapt415_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   CALL s_transaction_begin()              #160308-00010#1 add
   #確認
   IF lc_state = 'Y' THEN
      #160104-00007#10   ---s---  
      #IF g_apea_m.apeastus = 'N' THEN     #160308-00010#1 mark
         CALL cl_err_collect_init()
         CALL s_aapt415_conf_chk(g_apea_m.apeadocno) RETURNING g_sub_success
         IF NOT g_sub_success THEN
            CALL s_transaction_end('N','0')           #150401-00001#13
            CALL cl_err_collect_show()
            RETURN
         ELSE
            IF NOT cl_ask_confirm('aim-00108') THEN   #是否執行確認？
               CALL s_transaction_end('N','0')        #150401-00001#13
               RETURN                                 #150401-00001#13
            ELSE  
               #CALL s_transaction_begin() #160308-00010#1 mark
               CALL s_aapt415_conf_upd(g_apea_m.apeadocno) RETURNING g_sub_success
               IF NOT g_sub_success THEN
                  CALL s_transaction_end('N','0')
                  CALL cl_err_collect_show()
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','0')
                  CALL cl_err_collect_show()
               END IF    
               #LET g_apea_m.apeacnfdt = cl_get_current()
               #LET g_apea_m.apeacnfid = g_user       
               #UPDATE apea_t 
               #SET (apeacnfdt,apeacnfid) 
               #  = (g_apea_m.apeacnfdt ,g_apea_m.apeacnfid)     
               #WHERE apeaent = g_enterprise AND apeadocno = g_apea_m.apeadocno
               #IF SQLCA.SQLERRD[3] = 0 THEN
               #   CALL s_transaction_end('N','0')     #150401-00001#13
               #   RETURN          
               #ELSE
               #   CALL s_transaction_end('Y','0')
               #END IF
               #160104-00007#10   ---e---  
            END IF 
         END IF   
      #END IF                              #160308-00010#1 mark
   END IF
   #取消確認
   IF lc_state = 'N' THEN
      #160104-00007#10   ---s---  
      CALL cl_err_collect_init()
      CALL s_aapt415_unconf_chk(g_apea_m.apeadocno) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         CALL s_transaction_end('N','0')           #150401-00001#13
         CALL cl_err_collect_show()
         RETURN
      ELSE
         IF NOT cl_ask_confirm('aim-00110') THEN   #是否執行取消確認？
            CALL s_transaction_end('N','0')        #150401-00001#13
            RETURN                                 #150401-00001#13
         ELSE
            #CALL s_transaction_begin()    #160308-00010#1 mark
            CALL s_aapt415_unconf_upd(g_apea_m.apeadocno) RETURNING g_sub_success
            IF NOT g_sub_success THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()
            END IF
            #LET g_apea_m.apeacnfdt = ''
            #LET g_apea_m.apeacnfid = ''
            #UPDATE apea_t 
            #   SET (apeacnfdt,apeacnfid) 
            #     = (g_apea_m.apeacnfdt ,g_apea_m.apeacnfid)     
            # WHERE apeaent = g_enterprise AND apeadocno = g_apea_m.apeadocno
            #IF SQLCA.SQLERRD[3] = 0 THEN
            #   CALL s_transaction_end('N','0')     #150401-00001#13
            #   RETURN
            #ELSE
            #   CALL s_transaction_end('Y','0')
            #END IF
            #160104-00007#10   ---e--- 
         END IF           
      END IF
   END IF
   #作廢
   IF lc_state = 'X' THEN
      #160104-00007#10   ---s--- 
      CALL cl_err_collect_init()
      CALL s_aapt415_void_chk(g_apea_m.apeadocno) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         CALL s_transaction_end('N','0')           #150401-00001#13
         CALL cl_err_collect_show()
         RETURN
      ELSE
         #詢問
         IF NOT cl_ask_confirm('aim-00109') THEN   #是否執作廢?
            CALL s_transaction_end('N','0')        #150401-00001#13
            RETURN
         ELSE
            CALL s_aapt415_void_upd(g_apea_m.apeadocno) RETURNING g_sub_success
            IF NOT g_sub_success THEN
              #CALL cl_err_collect_show()   #171006-00010#66 mark
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()   #171006-00010#66 add
               RETURN
            ELSE
              #CALL cl_err_collect_show()   #171006-00010#66 mark
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()   #171006-00010#66 add
            END IF               
         END IF
         #160104-00007#10   ---e--- 
      END IF
   END IF
   #end add-point
   
   LET g_apea_m.apeamodid = g_user
   LET g_apea_m.apeamoddt = cl_get_current()
   LET g_apea_m.apeastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE apea_t 
      SET (apeastus,apeamodid,apeamoddt) 
        = (g_apea_m.apeastus,g_apea_m.apeamodid,g_apea_m.apeamoddt)     
    WHERE apeaent = g_enterprise AND apeadocno = g_apea_m.apeadocno
 
    
   IF SQLCA.SQLCODE THEN
      #171011-00030 ---start---
      CLOSE aapt415_cl
      CALL s_transaction_end('N','0')
      #171011-00030 --- end ---
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      #170801-00033 ---start---
   #  CLOSE aapt415_cl   #171011-00030 mark
   #  CALL s_transaction_end('N','0')   #171011-00030 mark
      RETURN
      #170801-00033 --- end ---
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         
      END CASE
 
      #180130-00006 ---start---
      #修改歷程記錄(狀態碼修改)
      LET g_log1 = util.JSON.stringify(g_apea_m_t)
      LET g_log2 = util.JSON.stringify(g_apea_m)
      IF NOT cl_log_modified_record(g_log1,g_log2) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #180130-00006 --- end ---
    
      #撈取異動後的資料
      EXECUTE aapt415_master_referesh USING g_apea_m.apeadocno INTO g_apea_m.apeasite,g_apea_m.apea003,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus,g_apea_m.apeaownid, 
          g_apea_m.apeaowndp,g_apea_m.apeacrtid,g_apea_m.apeacrtdp,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfdt,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp_desc,g_apea_m.apeamodid_desc,g_apea_m.apeacnfid_desc 
 
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc,g_apea_m.apea003,g_apea_m.apea003_desc,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea005_desc,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus, 
          g_apea_m.apeaownid,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp,g_apea_m.apeacrtdp_desc,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamodid_desc,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfid_desc, 
          g_apea_m.apeacnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE aapt415_cl
   CALL s_transaction_end('Y','0')
   
   #(ver:20) ---start---
   #add-point:transaction結束後 name="statechange.transaction_after"
   
   #end add-point  
   #(ver:20) --- end --- 
 
   #功能已完成,通報訊息中心
   CALL aapt415_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="aapt415.idx_chk" type="s" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION aapt415_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   LET g_curr_diag = ui.DIALOG.getCurrent()   #(ver:83)
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_apeb_d.getLength() THEN
         LET g_detail_idx = g_apeb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_apeb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_apeb_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.b_fill2" type="s" >}
#+ 單身陣列填充2
PRIVATE FUNCTION aapt415_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="b_fill2.pre_function"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   IF g_detail_idx <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx
   
 
      
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
    
   LET l_ac = li_ac
   
   CALL aapt415_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.fill_chk" type="s" >}
#+ 單身填充確認
PRIVATE FUNCTION aapt415_fill_chk(ps_idx)
   #add-point:fill_chk段define(客製用) name="fill_chk.define_customerization"
   
   #end add-point
   DEFINE ps_idx        LIKE type_t.chr10
   #add-point:fill_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fill_chk.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="fill_chk.before_chk"
   
   #end add-point
   
   #此funtion功能暫時停用(2015/1/12)
   #無論傳入值為何皆回傳true(代表要填充該單身)
 
   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="aapt415.status_show" type="s" >}
PRIVATE FUNCTION aapt415_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="aapt415.mask_functions" type="s" >}
&include "erp/aap/aapt415_mask.4gl"
 
{</section>}
 
{<section id="aapt415.signature" type="s" >}
   #應用 a39 樣板自動產生(Version:12)
#+ BPM提交
PRIVATE FUNCTION aapt415_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL aapt415_show()
   CALL aapt415_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   #160308-00010#1 add ---(S)---
   #確認前檢核段
   IF NOT s_aapt415_conf_chk(g_apea_m.apeadocno) THEN
      CLOSE aapt415_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #160308-00010#1 add ---(E)---
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_apea_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_apeb_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   
   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL aapt415_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL aapt415_ui_headershow()
   CALL aapt415_ui_detailshow()
 
 
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:10)
#+ BPM抽單
PRIVATE FUNCTION aapt415_draw_out()
   #add-point:draw段define name="draw.define_customerization"
   
   #end add-point
   #add-point:draw段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="draw.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="draw.pre_function"
   
   #end add-point
   
   #抽單失敗
   IF NOT cl_bpm_draw_out() THEN 
      RETURN FALSE
   END IF    
          
   #重新指定此筆單據資料狀態圖片=>抽單
   LET g_browser[g_current_idx].b_statepic = "stus/16/draw_out.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL aapt415_ui_headershow()  
   CALL aapt415_ui_detailshow()
 
 
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="aapt415.set_pk_array" type="s" >}
   #應用 a51 樣板自動產生(Version:10)
#+ 給予pk_array內容
PRIVATE FUNCTION aapt415_set_pk_array()
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
   IF cl_null(g_apea_m.apeadocno) THEN
      RETURN
   END IF
   #210120-00006 --- modify end ---
   #181105-00036 --- modify end ---
   
   LET g_pk_array[1].values = g_apea_m.apeadocno
   LET g_pk_array[1].column = 'apeadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="aapt415.other_dialog" readonly="Y" type="s" >}
   
 
{</section>}
 
{<section id="aapt415.msgcentre_notify" type="s" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION aapt415_msgcentre_notify(lc_state)
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
   CALL aapt415_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_apea_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="aapt415.action_chk" type="s" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION aapt415_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#1   2016/08/30  By 07900   --add--s--
    SELECT apeastus INTO g_apea_m.apeastus
     FROM apea_t
    WHERE apeaent = g_enterprise
      AND apeadocno= g_apea_m.apeadocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail") THEN
      LET g_errno = NULL
     CASE g_apea_m.apeastus
        WHEN 'W'
           LET g_errno = 'sub-00180'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'S'
           LET g_errno = 'sub-00230'
     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_apea_m.apeadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
         LET g_errno = NULL
        CALL aapt415_set_act_visible()
        CALL aapt415_set_act_no_visible()
        CALL aapt415_show()
        RETURN FALSE
     END IF
   END IF   
   #160818-00017#1   2016/08/30  By 07900   --add--e--
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="aapt415.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 根據發票帶出相關數據
# Memo...........:
# Usage..........: CALL aapt415_isam_ref()
# Date & Author..: 2014/12/09 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_isam_ref()
DEFINE l_cnt LIKE type_t.num5
 
   IF NOT cl_null(g_apeb_d[l_ac].apeb008) THEN
      SELECT isam009,isam010,isam008,isam014,
             isam025-(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh
                        FROM apeb_t,apea_t 
                      #WHERE apeastus != 'X'  #180927-00013#1 mark
                       #180927-00013#1---add---(S)
                       WHERE apebent = apeaent AND apeaent = g_enterprise
                         AND apeastus != 'X' 
                         AND ( apeadocno <> g_ape_m.apeadocno 
                             OR (apeadocno <> g_ape_m.apeadocno AND apebseq <> g_apeb_d[l_ac].apebseq))
                       #180927-00013#1---add---(E)
                         AND apeadocno = apebdocno AND apeb008 = isam010 ),
             isam015,
             isam028-(SELECT COALESCE (SUM(apeb118),0)    #151029-00001#2 change apeb119 to apeb118 lujh
                        FROM apeb_t,apea_t 
                       #WHERE apeastus != 'X'   #180927-00013#1 mark
                       #180927-00013#1---add---(S)
                       WHERE apebent = apeaent AND apeaent = g_enterprise
                         AND apeastus != 'X' 
                         AND ( apeadocno <> g_ape_m.apeadocno 
                             OR (apeadocno <> g_ape_m.apeadocno AND apebseq <> g_apeb_d[l_ac].apebseq))
                       #180927-00013#1---add---(E)
                         AND apeadocno = apebdocno AND apeb008 = isam010 )
        INTO g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,
             g_apeb_d[l_ac].apeb012,
             g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb108,   #151029-00001#2 change apeb109 to apeb108 lujh
             g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118    #151029-00001#2 change apeb119 to apeb118 lujh
        FROM isam_t
       WHERE isament = g_enterprise
         AND (isam009 = g_apeb_d[l_ac].apeb007 OR isam009 IS NULL OR isam009 = ' ')
         AND isam010 = g_apeb_d[l_ac].apeb008
        #AND isamdocno = g_apeb_d[l_ac].apeb003    #180314-00054#1   mark
         AND isamdocno = g_apeb_d[l_ac].apeb002    #180314-00054#1   add
   ELSE  
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM isam_t
       #WHERE isamdocno = g_apeb_d[l_ac].apeb003    #180314-00054#1   mark
        WHERE isamdocno = g_apeb_d[l_ac].apeb002    #180314-00054#1   add
          AND isament = g_enterprise
      IF l_cnt = 1 THEN
         SELECT apbb015,apbb025-(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh
                                  FROM apeb_t,apea_t 
                                 WHERE apeastus != 'X' 
                                   AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add
                                   AND apeadocno = apebdocno 
                                   AND apeb003 = g_apeb_d[l_ac].apeb003),
                         apbb028-(SELECT COALESCE (SUM(apeb118),0)   #151029-00001#2 change apeb119 to apeb118 lujh 
                                   FROM apeb_t,apea_t 
                                  WHERE apeastus != 'X'
                                    AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add                                  
                                    AND apeadocno = apebdocno
                                    AND apeb003 = g_apeb_d[l_ac].apeb003),
                apbb014,isam009,
                isam010, (CASE WHEN apbb008 IS NULL THEN isam008 ELSE apbb008 END)
           INTO g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb108,g_apeb_d[l_ac].apeb118,  #151029-00001#2 change apeb109,apeb119 to apeb108,apeb118 lujh
                g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb007,
                g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb012
           FROM apbb_t,isam_t
          WHERE apbbent = isament AND apbbent = g_enterprise 
          #AND apbbdocno = isamdocno AND apbbdocno = g_apeb_d[l_ac].apeb003    #180314-00054#1   mark
           AND apbbdocno = isamdocno AND apbbdocno = g_apeb_d[l_ac].apeb002    #180314-00054#1   add
     END IF
     IF l_cnt = 0 THEN
        SELECT apbb015,apbb025-(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh
                                  FROM apeb_t,apea_t 
                                 WHERE apeastus != 'X' 
                                   AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add
                                   AND apeadocno = apebdocno 
                                   AND apeb003 = g_apeb_d[l_ac].apeb003),
                       apbb028-(SELECT COALESCE (SUM(apeb118),0)    #151029-00001#2 change apeb119 to apeb118 lujh
                                   FROM apeb_t,apea_t 
                                  WHERE apeastus != 'X'
                                    AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add                                  
                                    AND apeadocno = apebdocno
                                    AND apeb003 = g_apeb_d[l_ac].apeb003),
               apbb014,apbb009,
               apbb010,apbb008 
          INTO g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb108,g_apeb_d[l_ac].apeb118,  #151029-00001#2 change apeb109,apeb119 to apeb108,apeb118 lujh
               g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb007,
               g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb012
          FROM apbb_t
         WHERE apbbent = g_enterprise 
           AND apbbdocno = g_apeb_d[l_ac].apeb003
      END IF
   END IF

   DISPLAY BY NAME g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,
                   g_apeb_d[l_ac].apeb012,
                   g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb108,  #151029-00001#2 change apeb109 to apeb108 lujh
                   g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118   #151029-00001#2 change apeb119 to apeb118 lujh
                     
                     


END FUNCTION

################################################################################
# Descriptions...: 清空相關數據
# Memo...........:
# Usage..........: CALL aapt415_isam_clear()
# Date & Author..: 2014/12/09 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_isam_clean()
   LET g_apeb_d[l_ac].apbbdocdt =''
   LET g_apeb_d[l_ac].apbb055   = ''
   LET g_apeb_d[l_ac].apeb007 =''
   LET g_apeb_d[l_ac].apeb008 =''
   LET g_apeb_d[l_ac].apeb011 =''
   LET g_apeb_d[l_ac].apeb012 =''
  #LET g_apeb_d[l_ac].apeb108 =''    #151029-00001#2 change apeb109 to apeb108 lujh #180927-00013#1 mark
   LET g_apeb_d[l_ac].apeb108 = 0    #180927-00013#1 add
   LET g_apeb_d[l_ac].apeb100 =''
   LET g_apeb_d[l_ac].apeb101 =''
  #LET g_apeb_d[l_ac].apeb118 =''    #151029-00001#2 change apeb119 to apeb118 lujh #180927-00013#1 mark
   LET g_apeb_d[l_ac].apeb118 = 0    #180927-00013#1 add 
   LET g_apeb_d[l_ac].apeb003 =''
   LET g_apeb_d[l_ac].apeb004 =''
   LET g_apeb_d[l_ac].apeb005 =''
   LET g_apeb_d[l_ac].apeb031 =''
   LET g_apeb_d[l_ac].apeb006 =''
   LET g_apeb_d[l_ac].apeb010 =''    #180927-00013#1 add
   LET g_apeb_d[l_ac].apeb002 =''    #200226-00017#1 add

   DISPLAY BY NAME g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,
                   g_apeb_d[l_ac].apeb011,g_apeb_d[l_ac].apeb012,
                   g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb108,   #151029-00001#2 change apeb109 to apeb108 lujh
                   g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118,   #151029-00001#2 change apeb119 to apeb118 lujh
                   g_apeb_d[l_ac].apbbdocdt,g_apeb_d[l_ac].apbb055,
                   g_apeb_d[l_ac].apeb003,g_apeb_d[l_ac].apeb004,
                   g_apeb_d[l_ac].apeb005,g_apeb_d[l_ac].apeb031,
                   g_apeb_d[l_ac].apeb006
                  ,g_apeb_d[l_ac].apeb010  #180927-00013#1 add
                  ,g_apeb_d[l_ac].apeb002  #200226-00017#1 add
END FUNCTION

################################################################################
# Descriptions...: 檢查金額是否超過可請款金額
# Memo...........:
# Usage..........: CALL aapt415_money_chk()
# Date & Author..: 2014/12/09 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_money_chk()
   DEFINE r_apeb108 LIKE apeb_t.apeb108 #可輸入最大原幣金額   #151029-00001#2 change apeb109 to apeb108 lujh
   DEFINE r_apbb025 LIKE apbb_t.apbb025

      #該收票單號下的發票金額
      SELECT isam025-(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh
                        FROM apeb_t,apea_t 
                       WHERE apeastus != 'X' 
                         AND apeaent = apebent AND apeaent = g_enterprise
                         AND apeadocno = apebdocno AND apeb008 = g_apeb_d[l_ac].apeb008 
                         AND ((apeadocno != g_apea_m.apeadocno) 
                          OR apeadocno = g_apea_m.apeadocno AND apebseq != g_apeb_d[l_ac].apebseq))          
        INTO r_apeb108   #151029-00001#2 change apeb109 to apeb108 lujh
        FROM isam_t
       WHERE isament = g_enterprise 
         AND (isam009 = g_apeb_d[l_ac].apeb007 OR isam009 IS NULL OR isam009 = ' ')
         AND isam010 = g_apeb_d[l_ac].apeb008
         AND isamdocno = g_apeb_d[l_ac].apeb003
      IF cl_null(r_apeb108)THEN LET r_apeb108 = 0 END IF   #151029-00001#2 change apeb109 to apeb108 lujh
      #已請款的"收票單號"是否超額請款,警示 "請款金額超出可請款的對帳單金額，請檢核是否登錄錯誤。" 不可輸入
      SELECT apbb025 -(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh 
                         FROM apeb_t,apea_t
                        WHERE apeaent = apebent AND apeaent = g_enterprise
                          AND apeadocno = apebdocno AND apeastus != 'X'  
                          AND apeb003 = g_apeb_d[l_ac].apeb003  
                          AND ((apeadocno != g_apea_m.apeadocno) 
                          OR apeadocno = g_apea_m.apeadocno AND apebseq != g_apeb_d[l_ac].apebseq) )
        INTO r_apbb025 
        FROM apbb_t
       WHERE apbbent = g_enterprise
         AND apbbdocno = g_apeb_d[l_ac].apeb003   
       IF cl_null(r_apbb025)THEN LET r_apbb025 = 0 END IF
 RETURN r_apeb108,r_apbb025   #151029-00001#2 change apeb109 to apeb108 lujh



END FUNCTION

################################################################################
# Descriptions...: 來源組織檢查
# Memo...........:
# Usage..........: CALL aapt415_apeborga_chk(p_ooef001)
# Date & Author..: 2014/12/10 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_apeborga_chk(p_ooef001)
   DEFINE r_success LIKE type_t.chr1
   DEFINE r_errno   LIKE gzze_t.gzze001
   DEFINE p_ooef001 LIKE ooef_t.ooef001
   DEFINE l_count   LIKE type_t.num5
   
   LET r_success = TRUE
   LET r_errno =''
   LET l_count = ''
   
   
   SELECT COUNT(*) INTO l_count
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooefstus = 'Y'
      AND (ooef206 = 'Y' OR ooef003 = 'Y')
      AND ooef001 = p_ooef001
      
   IF cl_null(l_count) THEN
      LET l_count = 0
   END IF
      
    IF l_count = 0 THEN
       LET r_success = FALSE
       LET r_errno ='aap-00291'
    END IF

   RETURN r_success,r_errno

END FUNCTION

################################################################################
# Descriptions...: 開票單號檢核
# Memo...........:
# Usage..........: CALL aapt415_apeb002_chk()
# Date & Author..: 2014/12/10 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_apeb002_chk(p_apbbdocno)
DEFINE r_success        LIKE type_t.chr1
DEFINE r_errno          LIKE gzze_t.gzze001
DEFINE p_apbbdocno      LIKE apbb_t.apbbdocno
DEFINE l_count          LIKE type_t.num5
#170503-00023#1 add ------
DEFINE l_sql            STRING
DEFINE l_apcastus       LIKE apca_t.apcastus
#170503-00023#1 add end---
#180103-00004#1---add---(S)
DEFINE l_apca001        LIKE apca_t.apca001  
DEFINE l_apca005        LIKE apca_t.apca005  
DEFINE l_amt            LIKE isam_t.isam025  
DEFINE l_apccdocno      LIKE apcc_t.apccdocno
DEFINE l_apccseq        LIKE apcc_t.apccseq  
DEFINE l_apcc001        LIKE apcc_t.apcc001  
DEFINE l_apcc108        LIKE apcc_t.apcc108 
DEFINE l_chk            LIKE type_t.num5
#180103-00004#1---add---(E)
                                              
   LET r_success = TRUE
   LET r_errno =''
   LET l_count = ''
   
   SELECT COUNT(*) INTO l_count
     FROM apbb_t
    WHERE apbbent = g_enterprise
      AND apbbdocno = p_apbbdocno
     #AND apbb002 = g_apea_m.apea005 #180927-00013#1 mark
      AND apbbdocdt <= g_apea_m.apeadocdt
      AND apbbstus = 'Y'
   IF l_count = 0 THEN
      LET r_success = FALSE
      LET r_errno ='aap-00292'
   END IF
   
   #170503-00023#1 add ------
   LET l_sql = "SELECT apcastus",
               "      ,apca001,apca005 ",  #180103-00004#1 add
               "  FROM apca_t",
               " WHERE apcaent = ",g_enterprise,
               "   AND apcacomp = '",g_apea_m.apeacomp,"'",
               #"   AND apca018 = '",p_apbbdocno,"'" #180510-00048#1 mark
               #180510-00048#1 add ------
               "   AND apcadocno = (SELECT DISTINCT isam050 FROM isam_t WHERE isament = ",g_enterprise,
                                     " AND isamdocno = '",p_apbbdocno,"')"
               #180510-00048#1 add end---
   PREPARE aapt415_chk_apca_p1 FROM l_sql
   DECLARE aapt415_chk_apca_c1 CURSOR FOR aapt415_chk_apca_p1
   EXECUTE aapt415_chk_apca_c1 INTO l_apcastus
                                   ,l_apca001,l_apca005   #180103-00004#1 add
   CASE
      #是否存在
      WHEN SQLCA.SQLCODE = 100
         LET r_errno = 'aap-00159'
         LET r_success = FALSE
         RETURN r_success,r_errno
      #是否為確認
      WHEN l_apcastus <> 'Y'
         LET r_errno = 'axr-00065'
         LET r_success = FALSE
         RETURN r_success,r_errno
      #180103-00004#1---add---(S)
      WHEN l_apca001 MATCHES '0[123467]' #排除暫估類型單據 #190408-00021#13 add 67
         LET r_errno = 'aap-00398'
         LET r_success = FALSE
         RETURN r_success,r_errno
      WHEN l_apca005 <> g_apea_m.apea005 #對應付款對象要和單頭付款對象相同
         LET r_errno = 'aap-00566'
         LET r_success = FALSE
         RETURN r_success,r_errno
      #180103-00004#1---add---(E)
   END CASE
   #170503-00023#1 add end---
   #180103-00004#1---add---(S)
   LET l_sql = " SELECT apccdocno,apccseq,apcc001,apcc108",
               "   FROM isam_t ",
               "   LEFT JOIN apcc_t ON apccent = isament AND apccdocno = isam050 ",
               "  WHERE isament = ",g_enterprise,
               "    AND isamdocno = '",p_apbbdocno,"'"
   PREPARE aapt415_chk_apcc_p1 FROM l_sql 
   DECLARE aapt415_chk_apcc_c1 CURSOR FOR aapt415_chk_apcc_p1
   LET l_sql = "SELECT SUM(amt1) ",
               "FROM ((SELECT NVL(SUM (apcc109),0) amt1 ",
               "         FROM apcc_t LEFT JOIN apca_t ON apcaent = apccent AND apcald = apccld AND apcadocno = apccdocno",
               "        WHERE apcaent = ",g_enterprise, 
               "          AND apca018 = '",p_apbbdocno,"' ", 
               "          AND apca016 = '12'",
               "          AND apccseq = ? ",  #200412-00001#1 add
               "          AND apcc001 = ? ",  #200412-00001#1 add
               "      )",
               "      UNION",
               "      (SELECT NVL(SUM(apce109),0) amt1 ",
               "         FROM apce_t LEFT JOIN apda_t ON apdaent = apceent AND apdald = apceld AND apdadocno = apcedocno",
               "        WHERE apdaent = ",g_enterprise ,
               "          AND apce003 = ? ",
               "          AND apce004 = ? ",
               "          AND apce005 = ? ",
               "          AND apdastus = 'N'",
               "      ))"
   PREPARE aapt415_chk_apcc_p2 FROM l_sql
   LET l_chk = FALSE
   FOREACH aapt415_chk_apcc_c1 INTO l_apccdocno,l_apccseq,l_apcc001,l_apcc108
      IF cl_null(l_apcc108) THEN LET l_apcc108 = 0 END IF
      #EXECUTE aapt415_chk_apcc_p2 USING l_apccdocno,l_apccseq,l_apcc001 INTO l_amt                     #200412-00001#1 mark
      EXECUTE aapt415_chk_apcc_p2 USING l_apccseq,l_apcc001,l_apccdocno,l_apccseq,l_apcc001 INTO l_amt  #200412-00001#1 add
      IF cl_null(l_amt) THEN LET l_amt = 0 END IF
      IF l_amt <> l_apcc108 THEN #同apeb002開窗段apcc108檢核
         LET l_chk = TRUE
      END IF
   END FOREACH
   IF NOT l_chk THEN
      LET r_errno = 'aap-00414'
      LET r_success = FALSE
      RETURN r_success,r_errno
   END IF
   #180103-00004#1---add---(E)

   RETURN r_success,r_errno
END FUNCTION

################################################################################
# Descriptions...: 用"發票編碼方式"決定是否隱藏"發票代碼"
# Memo...........:
# Usage..........: CALL aapt415_set_entry_invoice_code()
# Date & Author..: 2014/12/18 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_set_entry_invoice_code()
   
   SELECT isai002 INTO g_isai002
     FROM ooef_t
     LEFT JOIN isai_t ON ooefent = isaient AND ooef019 = isai001
    WHERE ooefent = g_enterprise
      AND ooef001 = g_apea_m.apeacomp
   IF g_isai002 = "1" THEN
      CALL cl_set_comp_visible('apeb007',FALSE)
   ELSE
      CALL cl_set_comp_visible('apeb007',TRUE)
   END IF

END FUNCTION

################################################################################
# Descriptions...: 發票號碼檢核
# Memo...........:
# Usage..........: CALL aapt415_apeb008_chk()
# Date & Author..: 2014/12/18 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_apeb008_chk()
   DEFINE r_success   LIKE type_t.chr1
   DEFINE r_errno     LIKE gzze_t.gzze001
   DEFINE l_count     LIKE type_t.num5
   DEFINE l_apeb108   LIKE apeb_t.apeb108
   DEFINE l_isam025   LIKE isam_t.isam025
   
   LET r_success = TRUE
   LET r_errno =''
   LET l_count = ''
   
   SELECT COUNT(*) INTO l_count
     FROM isam_t
    WHERE isament   =  g_enterprise
      AND isamdocno =  g_apeb_d[l_ac].apeb002
      AND (isam009 = g_apeb_d[l_ac].apeb007 OR isam009 IS NULL OR isam009 = ' ')
      AND isam010   =  g_apeb_d[l_ac].apeb008
       
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   
   IF l_count = 0 THEN
      LET r_success = FALSE
      LET r_errno ='ade-00061'
      RETURN r_success,r_errno
   END IF

   #檢核該發票是否已被請款完, 不得再登打 (只能檢核 aapt415 , 因為 apcc 可能沒有發票號碼,故無法取用來計算) 
   SELECT SUM(apeb108) INTO l_apeb108
     FROM apeb_t ,apea_t 
    WHERE apebent = g_enterprise
      AND apebent = apeaent
      AND apebdocno = apeadocno
      AND apeb002 = g_apeb_d[l_ac].apeb002
      AND apeb008 = g_apeb_d[l_ac].apeb008
      AND apeastus <> 'X'
   
   SELECT SUM(isam025) INTO l_isam025
     FROM isam_t
    WHERE isament = g_enterprise
      AND isamdocno = g_apeb_d[l_ac].apeb002
      AND isam010 = g_apeb_d[l_ac].apeb008
   
   IF l_apeb108 = l_isam025 THEN
      LET r_success = FALSE
      LET r_errno ='aap-00415'
      RETURN r_success,r_errno
   END IF 

   RETURN r_success,r_errno

END FUNCTION

################################################################################
# Descriptions...: 本幣金額檢查
# Memo...........:
# Usage..........: CALL aapt415_apeb119_chk()
# Date & Author..: 2014/12/19 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION aapt415_apeb119_chk()
   DEFINE r_apeb119 LIKE apeb_t.apeb119 #可輸入最大原幣金額
   DEFINE r_apbb028 LIKE apbb_t.apbb028
   
      #該收票單號下本幣發票金額
      SELECT isam028-(SELECT COALESCE (SUM(apeb119),0) 
                        FROM apeb_t,apea_t 
                       WHERE apeastus != 'X' 
                         AND apeaent = apebent AND apeaent = g_enterprise
                         AND apeadocno = apebdocno AND apeb008 = g_apeb_d[l_ac].apeb008 
                         AND ((apeadocno != g_apea_m.apeadocno) 
                          OR apeadocno = g_apea_m.apeadocno AND apebseq != g_apeb_d[l_ac].apebseq))          
        INTO r_apeb119
        FROM isam_t
       WHERE isament = g_enterprise
         AND (isam009 = g_apeb_d[l_ac].apeb007 OR isam009 IS NULL OR isam009 = ' ')
         AND isam010 = g_apeb_d[l_ac].apeb008
         AND isamdocno = g_apeb_d[l_ac].apeb003
      IF cl_null(r_apeb119)THEN LET r_apeb119 = 0 END IF
      #已請款的"收票單號"是否超額請款,警示 "請款金額超出可請款的對帳單金額，請檢核是否登錄錯誤。" 不可輸入
      SELECT apbb028 -(SELECT COALESCE (SUM(apeb119),0)  
                         FROM apeb_t,apea_t
                        WHERE apeaent = apebent AND apeaent = g_enterprise
                          AND apeadocno = apebdocno AND apeastus != 'X'  
                          AND apeb003 = g_apeb_d[l_ac].apeb003  
                          AND ((apeadocno != g_apea_m.apeadocno) 
                          OR apeadocno = g_apea_m.apeadocno AND apebseq != g_apeb_d[l_ac].apebseq) )
        INTO r_apbb028 
        FROM apbb_t
       WHERE apbbent = g_enterprise
         AND apbbdocno = g_apeb_d[l_ac].apeb003
       IF cl_null(r_apbb028)THEN LET r_apbb028 = 0 END IF
 RETURN r_apeb119,r_apbb028
END FUNCTION

################################################################################
# Descriptions...: 多選開窗結果回傳及檢核
# Memo...........:
# Usage..........: CALL aapt415_controlp_chk(p_str_array)
# Date & Author..: 15/03/01 By apo(#150301apo)
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt415_controlp_chk(p_str_array)
DEFINE  p_str_array    DYNAMIC ARRAY OF STRING
DEFINE  l_i            LIKE type_t.num5
DEFINE  l_cnt          LIKE type_t.num5
DEFINE  tok            base.StringTokenizer
DEFINE  l_str1         LIKE type_t.chr100
DEFINE  l_str2         LIKE type_t.chr100
DEFINE  l_str3         LIKE type_t.chr100
DEFINE  l_str4         LIKE type_t.chr100
DEFINE  l_str5         LIKE type_t.chr100
DEFINE  l_num          LIKE type_t.num5
DEFINE  l_i1           LIKE type_t.num5
DEFINE  l_num_ac       LIKE type_t.num5


   CALL cl_err_collect_init()
   LET l_i1 = 1
   FOR l_i = 1 TO p_str_array.getLength()
      
      LET tok = base.StringTokenizer.create(g_qryparam.str_array[l_i],"|")
      LET l_cnt = 0
      WHILE tok.hasMoreTokens()
         LET l_cnt = l_cnt + 1
         CASE l_cnt
            WHEN "1"
               LET l_str1 = tok.nextToken()
            WHEN "2"
               LET l_str2 = tok.nextToken()
            WHEN "3"
               LET l_str3 = tok.nextToken()
            WHEN "4"
               LET l_str4 = tok.nextToken()
            WHEN "5"               
               LET l_str5 = tok.nextToken()
            OTHERWISE
               EXIT WHILE
         END CASE
      END WHILE
      CALL aapt415_apeb002_chk(l_str1) RETURNING g_sub_success,g_errno
      IF NOT g_sub_success THEN
         CONTINUE FOR
      END IF

      CALL aapt415_apeb_insert(l_str1,l_str2,l_str3,l_str4,l_str5)

      LET l_i1 = l_i1 + 1
   END FOR
   CALL cl_err_collect_show()
   RETURN l_i1
END FUNCTION

################################################################################
# Descriptions...: 多選寫入apeb檔案
# Memo...........:
# Usage..........: CALL aapt415_apeb_insert(p_apbbdocno,p_apbbdocdt,p_apbb055,p_apbb010,p_apbb009)
# Date & Author..: 15/03/01 By apo(#150301apo)
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt415_apeb_insert(p_apbbdocno,p_apbbdocdt,p_apbb055,p_apbb010,p_apbb009)
DEFINE p_apbbdocno      LIKE apbb_t.apbbdocno
DEFINE p_apbbdocdt      LIKE apbb_t.apbbdocdt
DEFINE p_apbb055        LIKE apbb_t.apbb055
DEFINE p_apbb010        LIKE apbb_t.apbb010
DEFINE p_apbb009        LIKE apbb_t.apbb009
#DEFINE l_apeb           RECORD LIKE apeb_t.* #161104-00024#3 mark
#161104-00024#3-add(s)
DEFINE l_apeb  RECORD  #付款申請帳款明細檔
       apebent   LIKE apeb_t.apebent, #企業編號
       apebcomp  LIKE apeb_t.apebcomp, #法人
       apebsite  LIKE apeb_t.apebsite, #資金中心
       apebld    LIKE apeb_t.apebld, #帳套
       apeborga  LIKE apeb_t.apeborga, #帳務歸屬組織
       apebdocno LIKE apeb_t.apebdocno, #沖銷單單號
       apebseq   LIKE apeb_t.apebseq, #項次
       apeb001   LIKE apeb_t.apeb001, #來源作業
       apeb002   LIKE apeb_t.apeb002, #對帳單號
       apeb003   LIKE apeb_t.apeb003, #沖銷帳款單單號
       apeb004   LIKE apeb_t.apeb004, #沖銷帳款單項次
       apeb005   LIKE apeb_t.apeb005, #沖銷帳款單帳期
       apeb006   LIKE apeb_t.apeb006, #款別性質
       apeb007   LIKE apeb_t.apeb007, #發票編號
       apeb008   LIKE apeb_t.apeb008, #發票號碼
       apeb010   LIKE apeb_t.apeb010, #摘要說明
       apeb013   LIKE apeb_t.apeb013, #帳款對象
       apeb015   LIKE apeb_t.apeb015, #沖銷加減項
       apeb016   LIKE apeb_t.apeb016, #沖銷科目
       apeb024   LIKE apeb_t.apeb024, #付款單號
       apeb025   LIKE apeb_t.apeb025, #付款單項次
       apeb028   LIKE apeb_t.apeb028, #產生方式
       apeb031   LIKE apeb_t.apeb031, #應付到期日
       apeb100   LIKE apeb_t.apeb100, #幣別
       apeb101   LIKE apeb_t.apeb101, #匯率
       apeb109   LIKE apeb_t.apeb109, #原幣已沖銷金額
       apeb119   LIKE apeb_t.apeb119, #本幣已沖銷金額
       apebud001 LIKE apeb_t.apebud001, #自定義欄位(文字)001
       apebud002 LIKE apeb_t.apebud002, #自定義欄位(文字)002
       apebud003 LIKE apeb_t.apebud003, #自定義欄位(文字)003
       apebud004 LIKE apeb_t.apebud004, #自定義欄位(文字)004
       apebud005 LIKE apeb_t.apebud005, #自定義欄位(文字)005
       apebud006 LIKE apeb_t.apebud006, #自定義欄位(文字)006
       apebud007 LIKE apeb_t.apebud007, #自定義欄位(文字)007
       apebud008 LIKE apeb_t.apebud008, #自定義欄位(文字)008
       apebud009 LIKE apeb_t.apebud009, #自定義欄位(文字)009
       apebud010 LIKE apeb_t.apebud010, #自定義欄位(文字)010
       apebud011 LIKE apeb_t.apebud011, #自定義欄位(數字)011
       apebud012 LIKE apeb_t.apebud012, #自定義欄位(數字)012
       apebud013 LIKE apeb_t.apebud013, #自定義欄位(數字)013
       apebud014 LIKE apeb_t.apebud014, #自定義欄位(數字)014
       apebud015 LIKE apeb_t.apebud015, #自定義欄位(數字)015
       apebud016 LIKE apeb_t.apebud016, #自定義欄位(數字)016
       apebud017 LIKE apeb_t.apebud017, #自定義欄位(數字)017
       apebud018 LIKE apeb_t.apebud018, #自定義欄位(數字)018
       apebud019 LIKE apeb_t.apebud019, #自定義欄位(數字)019
       apebud020 LIKE apeb_t.apebud020, #自定義欄位(數字)020
       apebud021 LIKE apeb_t.apebud021, #自定義欄位(日期時間)021
       apebud022 LIKE apeb_t.apebud022, #自定義欄位(日期時間)022
       apebud023 LIKE apeb_t.apebud023, #自定義欄位(日期時間)023
       apebud024 LIKE apeb_t.apebud024, #自定義欄位(日期時間)024
       apebud025 LIKE apeb_t.apebud025, #自定義欄位(日期時間)025
       apebud026 LIKE apeb_t.apebud026, #自定義欄位(日期時間)026
       apebud027 LIKE apeb_t.apebud027, #自定義欄位(日期時間)027
       apebud028 LIKE apeb_t.apebud028, #自定義欄位(日期時間)028
       apebud029 LIKE apeb_t.apebud029, #自定義欄位(日期時間)029
       apebud030 LIKE apeb_t.apebud030, #自定義欄位(日期時間)030
       apeb011   LIKE apeb_t.apeb011, #發票日期
       apeb012   LIKE apeb_t.apeb012, #發票類型
       apeb108   LIKE apeb_t.apeb108, #原幣請款金額
       apeb118   LIKE apeb_t.apeb118, #本幣請款金額
       apeb023   LIKE apeb_t.apeb023  #付款對象
           END RECORD
#161104-00024#3-add(e)
DEFINE l_cnt            LIKE type_t.num5

   INITIALIZE l_apeb.* TO NULL
   LET l_apeb.apebent = g_enterprise
   LET l_apeb.apebdocno = g_apea_m.apeadocno
   LET l_apeb.apeb003 = p_apbbdocno
   LET l_apeb.apeb008 = p_apbb010
   LET l_apeb.apeb007 = p_apbb009

   LET l_apeb.apebseq = NULL
   SELECT MAX(apebseq) INTO l_apeb.apebseq FROM apeb_t
    WHERE apebent = g_enterprise
      AND apebdocno = g_apea_m.apeadocno
   IF cl_null(l_apeb.apebseq) THEN
      LET l_apeb.apebseq = 0
   END IF
   LET l_apeb.apebseq = l_apeb.apebseq + 1
   
   CALL s_fin_orga_get_comp_ld(g_site) RETURNING g_sub_success,g_errno,l_apeb.apeborga,l_apeb.apebld
   LET l_apeb.apeb011 = g_today
   IF NOT cl_null(l_apeb.apeb008) THEN
      SELECT isam009,isam010,isam008,isam014,
             isam025-(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh
                        FROM apeb_t,apea_t 
                       WHERE apeastus != 'X'
                         AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add                       
                         AND apeadocno = apebdocno AND apeb008 = isam010 ),
             isam015,
             isam028-(SELECT COALESCE (SUM(apeb118),0)    #151029-00001#2 change apeb119 to apeb118 lujh
                        FROM apeb_t,apea_t 
                       WHERE apeastus != 'X'
                         AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add                       
                         AND apeadocno = apebdocno AND apeb008 = isam010 )
        INTO l_apeb.apeb007,l_apeb.apeb008,
             l_apeb.apeb012,
             l_apeb.apeb100,l_apeb.apeb108,    #151029-00001#2 change apeb109 to apeb108 lujh
             l_apeb.apeb101,l_apeb.apeb118     #151029-00001#2 change apeb119 to apeb118 lujh
        FROM isam_t
       WHERE isament = g_enterprise
         AND (isam009 = l_apeb.apeb007 OR isam009 IS NULL OR isam009 = ' ')
         AND isam010 = l_apeb.apeb008
         AND isamdocno = l_apeb.apeb003
   ELSE  
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM isam_t
        WHERE isamdocno = l_apeb.apeb003
          AND isament = g_enterprise
      IF l_cnt = 1 THEN
         SELECT apbb015,apbb025-(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh
                                  FROM apeb_t,apea_t 
                                 WHERE apeastus != 'X' 
                                   AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add
                                   AND apeadocno = apebdocno 
                                   AND apeb003 = l_apeb.apeb003),
                         apbb028-(SELECT COALESCE (SUM(apeb118),0)   #151029-00001#2 change apeb119 to apeb118 lujh
                                   FROM apeb_t,apea_t 
                                  WHERE apeastus != 'X' 
                                    AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add
                                    AND apeadocno = apebdocno
                                    AND apeb003 = l_apeb.apeb003),
                apbb014,isam009,
                isam010, (CASE WHEN apbb008 IS NULL THEN isam008 ELSE apbb008 END)
           INTO l_apeb.apeb101,l_apeb.apeb108,l_apeb.apeb118,    #151029-00001#2 change apeb109,apeb119 to apeb108,apeb118 lujh
                l_apeb.apeb100,l_apeb.apeb007,
                l_apeb.apeb008,l_apeb.apeb012
           FROM apbb_t,isam_t
          WHERE apbbent = isament AND apbbent = g_enterprise 
           AND apbbdocno = isamdocno AND apbbdocno = l_apeb.apeb003
     END IF
     IF l_cnt = 0 THEN
        SELECT apbb015,apbb025-(SELECT COALESCE (SUM(apeb108),0)    #151029-00001#2 change apeb109 to apeb108 lujh
                                  FROM apeb_t,apea_t 
                                 WHERE apeastus != 'X' 
                                   AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add
                                   AND apeadocno = apebdocno 
                                   AND apeb003 = l_apeb.apeb003),
                       apbb028-(SELECT COALESCE (SUM(apeb118),0)    #151029-00001#2 change apeb119 to apeb118 lujh
                                   FROM apeb_t,apea_t 
                                  WHERE apeastus != 'X' 
                                    AND apebent = apeaent AND apebent = g_enterprise #181025-00028#4 add
                                    AND apeadocno = apebdocno
                                    AND apeb003 = l_apeb.apeb003),
               apbb014,apbb009,
               apbb010,apbb008 
          INTO l_apeb.apeb101,l_apeb.apeb108,l_apeb.apeb118,    #151029-00001#2 change apeb109,apeb119 to apeb108,apeb118 lujh
               l_apeb.apeb100,l_apeb.apeb007,
               l_apeb.apeb008,l_apeb.apeb012
          FROM apbb_t
         WHERE apbbent = g_enterprise 
           AND apbbdocno = l_apeb.apeb003
      END IF
   END IF
   IF cl_null(l_apeb.apeb108) THEN LET l_apeb.apeb108 = 0 END IF   #151029-00001#2 change apeb109 to apeb108 lujh
   IF cl_null(l_apeb.apeb118) THEN LET l_apeb.apeb118 = 0 END IF   #151029-00001#2 change apeb119 to apeb118 lujh
   IF l_apeb.apeb108 = 0 OR l_apeb.apeb118 = 0 THEN    #151029-00001#2 change apeb109,apeb119 to apeb108,apeb118 lujh
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00295'
      LET g_errparam.extend = s_fin_get_colname(g_prog,"apeb003"),l_apeb.apeb003,"/",s_fin_get_colname(g_prog,"apeb008"),l_apeb.apeb008
      LET g_errparam.popup = TRUE
      CALL cl_err()   
      RETURN
   END IF
   INSERT INTO apeb_t
               (apebent,
                apebdocno,apebseq,
                apeborga,apeb003,apeb007,apeb008,apeb011,apeb012,apeb100,apeb108,apeb101,apeb118)  #151029-00001#2 change apeb109,apeb119 to apeb108,apeb118 lujh
         VALUES(l_apeb.apebent,
                l_apeb.apebdocno,l_apeb.apebseq,
                l_apeb.apeborga,l_apeb.apeb003,l_apeb.apeb007, 
                l_apeb.apeb008,l_apeb.apeb011,l_apeb.apeb012, 
                l_apeb.apeb100,l_apeb.apeb108,l_apeb.apeb101,   #151029-00001#2 change apeb109 to apeb108 lujh
                l_apeb.apeb118)                                 #151029-00001#2 change apeb119 to apeb118 lujh
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "apeb_t" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   END IF                
END FUNCTION

################################################################################
# Descriptions...: 立即审核
# Memo...........:
# Usage..........: CALL aapt415_immediately_conf()
#                  RETURNING ---
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/12/03 By 06421
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt415_immediately_conf()
#151125-00006#2--s
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_doc_success     LIKE type_t.num5
   DEFINE l_slip            LIKE ooba_t.ooba002
   DEFINE l_dfin0031        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   #DEFINE l_apea            RECORD LIKE apea_t.* #161104-00024#3 mark
   #161104-00024#3-add(s)
   DEFINE l_apea  RECORD  #付款申請主檔
          apeaent   LIKE apea_t.apeaent, #企業編號
          apeacomp  LIKE apea_t.apeacomp, #代付法人(集團)
          apeald    LIKE apea_t.apeald, #帳套
          apeadocno LIKE apea_t.apeadocno, #請款單號
          apeadocdt LIKE apea_t.apeadocdt, #單據日期
          apeasite  LIKE apea_t.apeasite, #資金中心
          apea001   LIKE apea_t.apea001, #請款單性質
          apea003   LIKE apea_t.apea003, #帳務人員
          apea005   LIKE apea_t.apea005, #付款對象
          apea006   LIKE apea_t.apea006, #一次性交易識別碼
          apea007   LIKE apea_t.apea007, #產生方式
          apea008   LIKE apea_t.apea008, #來源參考單號
          apea009   LIKE apea_t.apea009, #沖帳批序號
          apea010   LIKE apea_t.apea010, #集團代付批號
          apea011   LIKE apea_t.apea011, #差異處理
          apea013   LIKE apea_t.apea013, #已付款註記
          apea014   LIKE apea_t.apea014, #拋轉傳票號碼
          apea015   LIKE apea_t.apea015, #作廢理由碼
          apea016   LIKE apea_t.apea016, #列印次數
          apea017   LIKE apea_t.apea017, #MEMO備註
          apea018   LIKE apea_t.apea018, #付款(攤銷)理由碼
          apea022   LIKE apea_t.apea022, #集團代付款否
          apea023   LIKE apea_t.apea023, #付款核銷者
          apea024   LIKE apea_t.apea024, #付款核銷日期
          apeaownid LIKE apea_t.apeaownid, #資料所有者
          apeaowndp LIKE apea_t.apeaowndp, #資料所屬部門
          apeacrtid LIKE apea_t.apeacrtid, #資料建立者
          apeacrtdp LIKE apea_t.apeacrtdp, #資料建立部門
          apeacrtdt LIKE apea_t.apeacrtdt, #資料創建日
          apeamodid LIKE apea_t.apeamodid, #資料修改者
          apeamoddt LIKE apea_t.apeamoddt, #最近修改日
          apeacnfid LIKE apea_t.apeacnfid, #資料確認者
          apeacnfdt LIKE apea_t.apeacnfdt, #資料確認日
          apeapstid LIKE apea_t.apeapstid, #資料過帳者
          apeapstdt LIKE apea_t.apeapstdt, #資料過帳日
          apeastus  LIKE apea_t.apeastus, #狀態碼
          apeaud001 LIKE apea_t.apeaud001, #自定義欄位(文字)001
          apeaud002 LIKE apea_t.apeaud002, #自定義欄位(文字)002
          apeaud003 LIKE apea_t.apeaud003, #自定義欄位(文字)003
          apeaud004 LIKE apea_t.apeaud004, #自定義欄位(文字)004
          apeaud005 LIKE apea_t.apeaud005, #自定義欄位(文字)005
          apeaud006 LIKE apea_t.apeaud006, #自定義欄位(文字)006
          apeaud007 LIKE apea_t.apeaud007, #自定義欄位(文字)007
          apeaud008 LIKE apea_t.apeaud008, #自定義欄位(文字)008
          apeaud009 LIKE apea_t.apeaud009, #自定義欄位(文字)009
          apeaud010 LIKE apea_t.apeaud010, #自定義欄位(文字)010
          apeaud011 LIKE apea_t.apeaud011, #自定義欄位(數字)011
          apeaud012 LIKE apea_t.apeaud012, #自定義欄位(數字)012
          apeaud013 LIKE apea_t.apeaud013, #自定義欄位(數字)013
          apeaud014 LIKE apea_t.apeaud014, #自定義欄位(數字)014
          apeaud015 LIKE apea_t.apeaud015, #自定義欄位(數字)015
          apeaud016 LIKE apea_t.apeaud016, #自定義欄位(數字)016
          apeaud017 LIKE apea_t.apeaud017, #自定義欄位(數字)017
          apeaud018 LIKE apea_t.apeaud018, #自定義欄位(數字)018
          apeaud019 LIKE apea_t.apeaud019, #自定義欄位(數字)019
          apeaud020 LIKE apea_t.apeaud020, #自定義欄位(數字)020
          apeaud021 LIKE apea_t.apeaud021, #自定義欄位(日期時間)021
          apeaud022 LIKE apea_t.apeaud022, #自定義欄位(日期時間)022
          apeaud023 LIKE apea_t.apeaud023, #自定義欄位(日期時間)023
          apeaud024 LIKE apea_t.apeaud024, #自定義欄位(日期時間)024
          apeaud025 LIKE apea_t.apeaud025, #自定義欄位(日期時間)025
          apeaud026 LIKE apea_t.apeaud026, #自定義欄位(日期時間)026
          apeaud027 LIKE apea_t.apeaud027, #自定義欄位(日期時間)027
          apeaud028 LIKE apea_t.apeaud028, #自定義欄位(日期時間)028
          apeaud029 LIKE apea_t.apeaud029, #自定義欄位(日期時間)029
          apeaud030 LIKE apea_t.apeaud030, #自定義欄位(日期時間)030
          apea019   LIKE apea_t.apea019, #請款起始年度
          apea020   LIKE apea_t.apea020, #請款起始月份
          apea025   LIKE apea_t.apea025, #請款截止年度
          apea026   LIKE apea_t.apea026, #請款截止月份
          apea027   LIKE apea_t.apea027  #對公否
              END RECORD
   #161104-00024#3-add(e)
   IF cl_null(g_apea_m.apeasite)  THEN RETURN END IF   #無資料直接返回不做處理
   IF cl_null(g_apea_m.apeadocno) THEN RETURN END IF   #無資料直接返回不做處理
    
   LET l_count = 0
   SELECT COUNT(*) INTO l_count FROM apeb_t WHERE apebent = g_enterprise
      AND apebdocno = g_apea_m.apeadocno
      
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   IF l_count = 0 THEN
      RETURN 
   END IF                   #第一单身無資料直接返回不做處理
   
   SELECT COUNT(*) INTO l_count FROM apeb_t WHERE apebent = g_enterprise
      AND apebdocno = g_apea_m.apeadocno
      
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   IF l_count = 0 THEN
      RETURN 
   END IF                   #第二单身無資料直接返回不做處理
   CALL s_fin_orga_get_comp_ld(g_apea_m.apeasite) RETURNING g_sub_success,g_errno,g_apea_m.apeacomp,g_apea_m.apeald
   #取得單別
   CALL s_aooi200_fin_get_slip(g_apea_m.apeadocno) RETURNING l_success,l_slip
   #取得單別設置的"是否直接審核"參數
   CALL s_fin_get_doc_para(g_apea_m.apeald,g_apea_m.apeacomp,l_slip,'D-FIN-0031') RETURNING l_dfin0031
   CALL cl_get_para(g_enterprise,g_apea_m.apeacomp,'S-FIN-2002') RETURNING g_sfin2002 #180927-00013#1 add
   IF cl_null(l_dfin0031) OR l_dfin0031 MATCHES '[Nn]' THEN RETURN END IF #參數值為空或為N則不做直接審核邏輯
   IF NOT cl_ask_confirm('aap-00403') THEN RETURN END IF  #询问是否立即审核?
   
   
   CALL s_transaction_begin()
   CALL cl_err_collect_init()
   LET l_doc_success = TRUE
      

   
   #異動狀態碼欄位/修改人/修改日期
   LET g_apea_m.apeamoddt = cl_get_current()
   LET g_apea_m.apeacnfdt = cl_get_current()
   UPDATE apea_t SET apeastus = 'Y',
                     apeamodid= g_user,
                     apeamoddt= g_apea_m.apeamoddt,
                     apeacnfid= g_user,
                     apeacnfdt= g_apea_m.apeacnfdt
    WHERE apeaent = g_enterprise 
      AND apeadocno = g_apea_m.apeadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      LET l_doc_success = FALSE
   END IF
   IF l_doc_success = TRUE THEN
      CALL s_transaction_end('Y',1)
   ELSE
      CALL s_transaction_end('N',1)
      CALL cl_err_collect_show()
   END IF
#151125-00006#2--e
END FUNCTION
# 开窗挑选整批产生单身
PRIVATE FUNCTION aapt415_ins_apeb(p_wc,p_isamdocno,p_isam010)
   DEFINE p_wc              STRING
   DEFINE p_isamdocno       LIKE isam_t.isamdocno
   DEFINE p_isam010         LIKE isam_t.isam010
   #DEFINE l_apeb            RECORD LIKE apeb_t.* #161104-00024#3 mark
   #161104-00024#3-add(s)
   DEFINE l_apeb  RECORD  #付款申請帳款明細檔
          apebent   LIKE apeb_t.apebent, #企業編號
          apebcomp  LIKE apeb_t.apebcomp, #法人
          apebsite  LIKE apeb_t.apebsite, #資金中心
          apebld    LIKE apeb_t.apebld, #帳套
          apeborga  LIKE apeb_t.apeborga, #帳務歸屬組織
          apebdocno LIKE apeb_t.apebdocno, #沖銷單單號
          apebseq   LIKE apeb_t.apebseq, #項次
          apeb001   LIKE apeb_t.apeb001, #來源作業
          apeb002   LIKE apeb_t.apeb002, #對帳單號
          apeb003   LIKE apeb_t.apeb003, #沖銷帳款單單號
          apeb004   LIKE apeb_t.apeb004, #沖銷帳款單項次
          apeb005   LIKE apeb_t.apeb005, #沖銷帳款單帳期
          apeb006   LIKE apeb_t.apeb006, #款別性質
          apeb007   LIKE apeb_t.apeb007, #發票編號
          apeb008   LIKE apeb_t.apeb008, #發票號碼
          apeb010   LIKE apeb_t.apeb010, #摘要說明
          apeb013   LIKE apeb_t.apeb013, #帳款對象
          apeb015   LIKE apeb_t.apeb015, #沖銷加減項
          apeb016   LIKE apeb_t.apeb016, #沖銷科目
          apeb024   LIKE apeb_t.apeb024, #付款單號
          apeb025   LIKE apeb_t.apeb025, #付款單項次
          apeb028   LIKE apeb_t.apeb028, #產生方式
          apeb031   LIKE apeb_t.apeb031, #應付到期日
          apeb100   LIKE apeb_t.apeb100, #幣別
          apeb101   LIKE apeb_t.apeb101, #匯率
          apeb109   LIKE apeb_t.apeb109, #原幣已沖銷金額
          apeb119   LIKE apeb_t.apeb119, #本幣已沖銷金額
          apebud001 LIKE apeb_t.apebud001, #自定義欄位(文字)001
          apebud002 LIKE apeb_t.apebud002, #自定義欄位(文字)002
          apebud003 LIKE apeb_t.apebud003, #自定義欄位(文字)003
          apebud004 LIKE apeb_t.apebud004, #自定義欄位(文字)004
          apebud005 LIKE apeb_t.apebud005, #自定義欄位(文字)005
          apebud006 LIKE apeb_t.apebud006, #自定義欄位(文字)006
          apebud007 LIKE apeb_t.apebud007, #自定義欄位(文字)007
          apebud008 LIKE apeb_t.apebud008, #自定義欄位(文字)008
          apebud009 LIKE apeb_t.apebud009, #自定義欄位(文字)009
          apebud010 LIKE apeb_t.apebud010, #自定義欄位(文字)010
          apebud011 LIKE apeb_t.apebud011, #自定義欄位(數字)011
          apebud012 LIKE apeb_t.apebud012, #自定義欄位(數字)012
          apebud013 LIKE apeb_t.apebud013, #自定義欄位(數字)013
          apebud014 LIKE apeb_t.apebud014, #自定義欄位(數字)014
          apebud015 LIKE apeb_t.apebud015, #自定義欄位(數字)015
          apebud016 LIKE apeb_t.apebud016, #自定義欄位(數字)016
          apebud017 LIKE apeb_t.apebud017, #自定義欄位(數字)017
          apebud018 LIKE apeb_t.apebud018, #自定義欄位(數字)018
          apebud019 LIKE apeb_t.apebud019, #自定義欄位(數字)019
          apebud020 LIKE apeb_t.apebud020, #自定義欄位(數字)020
          apebud021 LIKE apeb_t.apebud021, #自定義欄位(日期時間)021
          apebud022 LIKE apeb_t.apebud022, #自定義欄位(日期時間)022
          apebud023 LIKE apeb_t.apebud023, #自定義欄位(日期時間)023
          apebud024 LIKE apeb_t.apebud024, #自定義欄位(日期時間)024
          apebud025 LIKE apeb_t.apebud025, #自定義欄位(日期時間)025
          apebud026 LIKE apeb_t.apebud026, #自定義欄位(日期時間)026
          apebud027 LIKE apeb_t.apebud027, #自定義欄位(日期時間)027
          apebud028 LIKE apeb_t.apebud028, #自定義欄位(日期時間)028
          apebud029 LIKE apeb_t.apebud029, #自定義欄位(日期時間)029
          apebud030 LIKE apeb_t.apebud030, #自定義欄位(日期時間)030
          apeb011   LIKE apeb_t.apeb011, #發票日期
          apeb012   LIKE apeb_t.apeb012, #發票類型
          apeb108   LIKE apeb_t.apeb108, #原幣請款金額
          apeb118   LIKE apeb_t.apeb118, #本幣請款金額
          apeb023   LIKE apeb_t.apeb023  #付款對象
              END RECORD
   #161104-00024#3-add(e)
   DEFINE l_isamdocno       LIKE isam_t.isamdocno
   DEFINE l_isam008         LIKE isam_t.isam008
   DEFINE l_isam009         LIKE isam_t.isam009
   DEFINE l_isam010         LIKE isam_t.isam010
   DEFINE l_isam011         LIKE isam_t.isam011
   DEFINE l_isam025         LIKE isam_t.isam025
   DEFINE l_apeborga        LIKE apeb_t.apeborga
   DEFINE l_sql             STRING
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_apeb108         LIKE apeb_t.apeb108
   DEFINE l_flag            LIKE type_t.chr1
   DEFINE l_amt             LIKE isam_t.isam025
   DEFINE l_amt1            LIKE isam_t.isam025
   DEFINE l_tmp             RECORD 
                            apccdocno            LIKE apcc_t.apccdocno,
                            apccseq              LIKE apcc_t.apccseq,
                            apcc001              LIKE apcc_t.apcc001,
                            apcc004              LIKE apcc_t.apcc004,
                            apcc100              LIKE apcc_t.apcc100,
                            apcc102              LIKE apcc_t.apcc102,
                            apcc108              LIKE apcc_t.apcc108,
                            apcc109              LIKE apcc_t.apcc109,
                            apca001              LIKE apca_t.apca001,
                            apca004              LIKE apca_t.apca004, #180927-00013#1 add
                            apca005              LIKE apca_t.apca005,
                            apca035              LIKE apca_t.apca035,
                            apcadocno            LIKE apca_t.apcadocno,
                            apcadocdt            LIKE apca_t.apcadocdt
                            END RECORD
   DEFINE l_isam028         LIKE isam_t.isam028    #191212-00043#1 add
   
   CALL s_transaction_end('N',0)
   
   CALL s_transaction_begin()
   
   LET l_success = TRUE
   
   LET l_apeborga = g_apeb_d[l_ac].apeborga
   
   DELETE FROM apeb_t
    WHERE apebent = g_enterprise
      AND apebdocno = g_apea_m.apeadocno
      AND apebseq = g_apeb_d[l_ac].apebseq
      
   IF cl_null(g_apeb_d_t.apeb002) THEN 
      SELECT MAX(apebseq) INTO l_apeb.apebseq FROM apeb_t
       WHERE apebent = g_enterprise
         AND apebdocno = g_apea_m.apeadocno
      IF cl_null(l_apeb.apebseq) THEN
         LET l_apeb.apebseq = 1
      ELSE
         LET l_apeb.apebseq = l_apeb.apebseq + 1
      END IF
   ELSE
      LET l_apeb.apebseq = g_apeb_d_t.apebseq
   END IF
   LET l_sql = "SELECT isamdocno,isam008,isam009,isam010,isam011,isam025 ", 
               "  FROM isam_t ",
               " WHERE isament = ",g_enterprise
   IF NOT cl_null(p_wc) THEN 
      LET l_sql =  l_sql," AND (",p_wc,")"
   END IF
   
   IF NOT cl_null(p_isamdocno) THEN 
      LET l_sql =  l_sql," AND isamdocno = '",p_isamdocno,"'"
   END IF
   
   IF NOT cl_null(p_isam010) THEN 
      LET l_sql =  l_sql," AND isam010 = '",p_isam010,"'"
   END IF
   
   PREPARE aapt415_ins_pre FROM l_sql
   DECLARE aapt415_ins_cs CURSOR FOR aapt415_ins_pre   
   #180724-00069#1---add---(S)apcc可請款餘額取代原發票金額isam025
   LET l_sql = "SELECT SUM(COALESCE(apcc108,0)-COALESCE(apcc109,0))  ",
#               "      ,SUM(COALESCE(apcc118,0)-COALESCE(apcc119,0))",   #191212-00043#1#1 add  #200515-00022#1---mark
               "      ,SUM(COALESCE(apcc118,0)-COALESCE(apcc119,0)+COALESCE(apcc113,0))",   #200515-00022#1---add
               "  FROM isam_t ",
               "  LEFT JOIN apcc_t ON apccent = isament AND apccdocno = isam050",
               " WHERE isament = ",g_enterprise,
               " AND isamdocno = ? AND isam010 = ? "
              ," AND (apcc009 = ? OR apcc009 = 'MULTI') "   #181104-00001#1 add
   PREPARE aapt415_amt_pre FROM l_sql            
   #180724-00069#1---add---(E)
   
   FOREACH aapt415_ins_cs INTO l_isamdocno,l_isam008,l_isam009,l_isam010,l_isam011,l_isam025  
      #EXECUTE aapt415_amt_pre USING l_isamdocno,l_isam010 INTO l_isam025  #180724-00069#1 add #190423-00042#3 mark
     #EXECUTE aapt415_amt_pre USING l_isamdocno,l_isam010,l_isam010 INTO l_isam025 #190423-00042#3 add   #191212-00043#1 mark
      EXECUTE aapt415_amt_pre USING l_isamdocno,l_isam010,l_isam010 INTO l_isam025,l_isam028 #190423-00042#3 add   #191212-00043#1 add
      LET l_apeb.apebent   = g_enterprise
      LET l_apeb.apebcomp  = g_apea_m.apeacomp
      LET l_apeb.apebsite  = g_apea_m.apeasite
      LET l_apeb.apebld    = g_apea_m.apeald
      LET l_apeb.apeborga  = l_apeborga
      LET l_apeb.apebdocno = g_apea_m.apeadocno
      LET l_apeb.apeb001   = 'aapt110'
      LET l_apeb.apeb002   = l_isamdocno
      LET l_apeb.apeb006   = '20'
      LET l_apeb.apeb007   = l_isam009
      LET l_apeb.apeb008   = l_isam010
      IF l_isam025 >= 0 THEN 
         LET l_apeb.apeb015 = '0' #因已出货table字段不可修改datatype，故用0代替D，1代替C
      ELSE
         LET l_apeb.apeb015 = '1'
      END IF
      
      LET l_apeb.apeb011 = l_isam011
      LET l_apeb.apeb012 = l_isam008
      
      #aapt415 同 apcc key 己請款未核銷額(apeb108-apeb109)
      SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)) INTO l_amt1
        FROM apea_t,apeb_t
       WHERE apebent = g_enterprise
         AND apeaent = apebent
         AND apeadocno = apebdocno 
         AND apeb002 = l_isamdocno
         AND apeb008 = l_isam010
         AND apeastus <> 'X'  

      IF cl_null(l_amt1) THEN 
         LET l_amt1 = 0
      END IF
      
      IF l_amt1 < 0 THEN 
         LET l_amt1 = l_amt1 * -1
      END IF
      
      IF l_isam025 < 0 THEN 
         LET l_isam025 = l_isam025 * -1
      END IF
       
      LET l_amt = l_isam025 - l_amt1
      
      WHILE TRUE
         CALL aapt415_get_amt(l_isamdocno,l_isam010,l_amt) RETURNING l_flag,l_apeb108,l_tmp.*
         IF l_flag = 'X' THEN
            EXIT WHILE
         END IF
         
         IF l_flag ='N' THEN 
            LET l_amt = l_amt - l_apeb108
         END IF
         
         IF l_tmp.apca001[1,1] = 2 THEN
            LET l_apeb108 = l_apeb108 * -1
         END IF
         
         LET l_apeb.apeb003 = l_tmp.apccdocno
         LET l_apeb.apeb004 = l_tmp.apccseq
         LET l_apeb.apeb005 = l_tmp.apcc001
        #LET l_apeb.apeb013 = l_tmp.apca005 #180927-00013#1 mark
         LET l_apeb.apeb013 = l_tmp.apca004 #180927-00013#1 add #帳款對象
         LET l_apeb.apeb023 = l_tmp.apca005 #180927-00013#1 add #付款對象
         LET l_apeb.apeb016 = l_tmp.apca035
         LET l_apeb.apeb031 = l_tmp.apcc004
         LET l_apeb.apeb100 = l_tmp.apcc100
         LET l_apeb.apeb101 = l_tmp.apcc102
         LET l_apeb.apeb108 = l_apeb108
         LET l_apeb.apeb118 = l_apeb.apeb108 * l_apeb.apeb101
         #191212-00043#1-(S) add
         #當可請款金額=全額，不重推本幣
         IF l_apeb108 = l_isam025 THEN
            LET l_apeb.apeb118 = l_isam028
         END IF
         #191212-00043#1-(E) add
        #CALL s_curr_round_ld('1',l_apeb.apebld ,l_apeb.apeb100,l_apeb.apeb108,2) RETURNING g_sub_success,g_errno,l_apeb.apeb108     #180314-00054#1   add
         CALL s_curr_round_ld('1',l_apeb.apebld ,g_glaa001,l_apeb.apeb118,2) RETURNING g_sub_success,g_errno,l_apeb.apeb118
         
         LET l_apeb.apeb025 = '' #171117-00021#1 add

         #INSERT INTO apeb_t VALUES(l_apeb.*) #161108-00017#3 mark
         #161108-00017#3 add ------
         INSERT INTO apeb_t (apebent,apebcomp,apebsite,apebld,apeborga,
                             apebdocno,apebseq,
                             apeb001,apeb002,apeb003,apeb004,apeb005,
                             apeb006,apeb007,apeb008,apeb010,apeb013,
                             apeb015,apeb016,apeb024,apeb025,apeb028,
                             apeb031,apeb100,apeb101,apeb109,apeb119,
                             #161125-00021#1 add ------
                             apebud001,apebud002,apebud003,apebud004,apebud005,
                             apebud006,apebud007,apebud008,apebud009,apebud010,
                             apebud011,apebud012,apebud013,apebud014,apebud015,
                             apebud016,apebud017,apebud018,apebud019,apebud020,
                             apebud021,apebud022,apebud023,apebud024,apebud025,
                             apebud026,apebud027,apebud028,apebud029,apebud030,
                             #161125-00021#1 add end---
                             apeb011,apeb012,apeb108,apeb118,apeb023
                            )
         VALUES (l_apeb.apebent,l_apeb.apebcomp,l_apeb.apebsite,l_apeb.apebld,l_apeb.apeborga,
                 l_apeb.apebdocno,l_apeb.apebseq,
                 l_apeb.apeb001,l_apeb.apeb002,l_apeb.apeb003,l_apeb.apeb004,l_apeb.apeb005,
                 l_apeb.apeb006,l_apeb.apeb007,l_apeb.apeb008,l_apeb.apeb010,l_apeb.apeb013,
                 l_apeb.apeb015,l_apeb.apeb016,l_apeb.apeb024,l_apeb.apeb025,l_apeb.apeb028,
                 l_apeb.apeb031,l_apeb.apeb100,l_apeb.apeb101,l_apeb.apeb109,l_apeb.apeb119,
                 #161125-00021#1 add ------
                 l_apeb.apebud001,l_apeb.apebud002,l_apeb.apebud003,l_apeb.apebud004,l_apeb.apebud005,
                 l_apeb.apebud006,l_apeb.apebud007,l_apeb.apebud008,l_apeb.apebud009,l_apeb.apebud010,
                 l_apeb.apebud011,l_apeb.apebud012,l_apeb.apebud013,l_apeb.apebud014,l_apeb.apebud015,
                 l_apeb.apebud016,l_apeb.apebud017,l_apeb.apebud018,l_apeb.apebud019,l_apeb.apebud020,
                 l_apeb.apebud021,l_apeb.apebud022,l_apeb.apebud023,l_apeb.apebud024,l_apeb.apebud025,
                 l_apeb.apebud026,l_apeb.apebud027,l_apeb.apebud028,l_apeb.apebud029,l_apeb.apebud030,
                 #161125-00021#1 add end---
                 l_apeb.apeb011,l_apeb.apeb012,l_apeb.apeb108,l_apeb.apeb118,l_apeb.apeb023
                )
         #161108-00017#3 add end---
      
         IF SQLCA.sqlcode THEN
            LET l_success = FALSE
            EXIT WHILE
         END IF
         
         SELECT MAX(apebseq) INTO l_apeb.apebseq FROM apeb_t
          WHERE apebent = g_enterprise
            AND apebdocno = g_apea_m.apeadocno
         IF cl_null(l_apeb.apebseq) THEN
            LET l_apeb.apebseq = 1
         ELSE
            LET l_apeb.apebseq = l_apeb.apebseq + 1
         END IF
         
         
         IF l_flag = 'Y' THEN 
            EXIT WHILE
         END IF
      END WHILE

   END FOREACH 
   
   IF l_success = TRUE THEN
      CALL s_transaction_end('Y',0)
   ELSE
      CALL s_transaction_end('N',0)
   END IF
END FUNCTION
# 获取可请款金额
PRIVATE FUNCTION aapt415_get_amt(p_isamdocno,p_isam010,p_isam025)
   DEFINE p_isamdocno             LIKE isam_t.isamdocno
   DEFINE p_isam010               LIKE isam_t.isam010
   DEFINE p_isam025               LIKE isam_t.isam025
   DEFINE l_sql                   STRING
   DEFINE l_amt1                  LIKE isam_t.isam025
   DEFINE l_amt2                  LIKE isam_t.isam025
   DEFINE l_amt3                  LIKE isam_t.isam025
   DEFINE r_isam025               LIKE isam_t.isam025
   DEFINE r_flag                  LIKE type_t.chr1
   DEFINE l_tmp                   RECORD 
                                  apccdocno            LIKE apcc_t.apccdocno,
                                  apccseq              LIKE apcc_t.apccseq,
                                  apcc001              LIKE apcc_t.apcc001,
                                  apcc004              LIKE apcc_t.apcc004,
                                  apcc100              LIKE apcc_t.apcc100,
                                  apcc102              LIKE apcc_t.apcc102,
                                  apcc108              LIKE apcc_t.apcc108,
                                  apcc109              LIKE apcc_t.apcc109,
                                  apca001              LIKE apca_t.apca001,
                                  apca004              LIKE apca_t.apca004, #180927-00013#1 add
                                  apca005              LIKE apca_t.apca005,
                                  apca035              LIKE apca_t.apca035,
                                  apcadocno            LIKE apca_t.apcadocno,
                                  apcadocdt            LIKE apca_t.apcadocdt
                                  END RECORD
   
   LET r_isam025 = 0
   LET r_flag = 'X'
 
#180329-00040#1 --begin 效能改善 
  #LET l_sql = "SELECT DISTINCT apccdocno,apccseq,apcc001,apcc004,apcc100,apcc102,apcc108,apcc109,apca001,apca005,apca035,apcadocno,apcadocdt",  #180927-00013#1 mark
   #180927-00013#1---add---(S)
   LET l_sql = "SELECT DISTINCT apccdocno,apccseq,apcc001,apcc004,apcc100,",
               "                apcc102,apcc108,apcc109,apca001,apca004,",
               "                apca005,apca035,apcadocno,apcadocdt", 
   #180927-00013#1---add---(E)            
               "  FROM isam_t,apca_t,apcb_t,apcc_t ",
               " WHERE apcaent = ",g_enterprise,
               "   AND isam050 = apcadocno ",
               "   AND isament = apcaent ", #181025-00028#4 add
               "   AND apcaent = apcbent ",
               "   AND apcald = apcbld ",
               "   AND apcadocno = apcbdocno ",
               "   AND apca001 NOT IN ('01','02','03','04','06','07') ", #171127-00022#1 add   #190408-00021#13 add '06','07'
               "   AND apcbent = apccent ",
               "   AND apcbld = apccld ",
               "   AND apcbdocno = apccdocno ",
               "   AND isamdocno = '",p_isamdocno,"'",
               "   AND isam010 = '",p_isam010,"'",
               " ORDER BY apcadocno,apcadocdt,apccseq "
               
               
#   LET l_sql = "SELECT DISTINCT apccdocno,apccseq,apcc001,apcc004,apcc100,apcc102,apcc108,apcc109,apca001,apca005,apca035,apcadocno,apcadocdt",
#               "  FROM apbb_t,apba_t,isam_t,apca_t,apcb_t,apcc_t ",
#               " WHERE apbbent = ",g_enterprise,
#               "   AND apbbent = apbaent ",
#               "   AND apbbdocno = apbadocno ",
#               "   AND apbbent = isament ",
#               "   AND apbbdocno = isamdocno ",
#               "   AND (apba005||apba006 = apcb002||apcb003 ",
#               "    OR  isam050 = apcadocno) ",
#               "   AND apcaent = apcbent ",
#               "   AND apcald = apcbld ",
#               "   AND apcadocno = apcbdocno ",
#               "   AND apca001 NOT IN ('01','02','03','04') ", #171127-00022#1 add  
#               "   AND apcbent = apccent ",
#               "   AND apcbld = apccld ",
#               "   AND apcbdocno = apccdocno ",
#               "   AND apbb002 = apca005 ",
#               "   AND isamdocno = '",p_isamdocno,"'",
#               "   AND isam010 = '",p_isam010,"'",
#               " ORDER BY apcadocno,apcadocdt,apccseq "
#               
#180329-00040#1 --end 效能改善 
   PREPARE aapt415_apcc_pre FROM l_sql
   DECLARE aapt415_apcc_cs CURSOR FOR aapt415_apcc_pre
   
   FOREACH aapt415_apcc_cs INTO l_tmp.*
      IF cl_null(l_tmp.apcc108) THEN 
         LET l_tmp.apcc108 = 0
      END IF
      
      IF cl_null(l_tmp.apcc109) THEN 
         LET l_tmp.apcc109 = 0
      END IF 
   
      #181129-00047#1---add---str--
      #列出下列情況: (=0:代表未回寫, >0:代表已回寫)
      #1.aapt415 >> 未確認 apeb109 = 0, apcc109 = 0
      #2.aapt415 -> aapt420 >> 未確認 apeb109 = 0, apcc109 = 0
      #3.aapt415 -> aapt420 >> 已確認 apeb109 > 0, apcc109 > 0
      #4.aapt420 >> 未確認 apcc109 = 0
      #5.aapt420 >> 已確認 apcc109 > 0
      #上述流程,3和5已包含在l_tmp.apcc109
      #1已包含在l_amt1
      #4已包含在l_amt2
      #2現在會被l_amt1和l_amt2都算到,只能被算一次,所以l_amt1增加排除已產生到aapt420的
      #181129-00047#1---add---end--
      
      #aapt415 同 apcc key 己請款未核銷額(apeb108-apeb109)
      SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)) INTO l_amt1
        FROM apea_t,apeb_t
       WHERE apebent = g_enterprise
         AND apeaent = apebent
         AND apeadocno = apebdocno 
         AND apeb003 = l_tmp.apccdocno
         AND apeb004 = l_tmp.apccseq
         AND apeb005 = l_tmp.apcc001    
         AND apeastus <> 'X'  
         AND (apeb024 = '' OR apeb024 = ' ' OR apeb024 IS NULL)   #181129-00047#1 add

      IF cl_null(l_amt1) THEN 
         LET l_amt1 = 0
      END IF
      
      IF l_amt1 < 0 THEN 
         LET l_amt1 = l_amt1 * -1
      END IF
      
      #aapt420 未確認同 apcc key 之核銷單
      SELECT SUM(apce109) INTO l_amt2
        FROM apda_t,apce_t
       WHERE apdaent = g_enterprise
         AND apdaent = apceent
         AND apdald = apceld
         AND apdadocno = apcedocno
         #170621-00042#1 mark(s)
         #AND apce03 = l_tmp.apccdocno
         #AND apce04 = l_tmp.apccseq 
         #AND apce05 = l_tmp.apcc001
         #170621-00042#1 mark(e)
         #170621-00042#1 add(s)
         AND apce003 = l_tmp.apccdocno
         AND apce004 = l_tmp.apccseq 
         AND apce005 = l_tmp.apcc001
         #170621-00042#1 add(e)         
         #AND apdastus <> 'X'   #170720-00041#1 mark
         AND apdastus = 'N'     #170720-00041#1 add 

      IF cl_null(l_amt2) THEN 
         LET l_amt2 = 0
      END IF
      
      #可请款余额
      LET l_amt3 =  l_tmp.apcc108 - l_tmp.apcc109 - l_amt1 - l_amt2

      IF l_amt3 = 0 THEN      
         CONTINUE FOREACH
      END IF

      IF p_isam025 < = l_amt3 THEN    #如果请款金额小于等于可请款余额,则以请款金额写入
         LET r_isam025 = p_isam025
         LET r_flag = 'Y'             #余额足够,不需要继续往下一笔找
      ELSE  #如果请款金额大于可请款余额,则以可请款余额写入
         LET r_isam025 = l_amt3
         LET r_flag = 'N'             #余额不足,需要继续往下一笔找
      END IF
      
      EXIT FOREACH
   END FOREACH 
   
   RETURN r_flag,r_isam025,l_tmp.*
END FUNCTION
# 請款金額檢查
PRIVATE FUNCTION aapt415_apeb108_chk(p_docno,p_seq,p_apeb002,p_apeb008,p_apeb108)
   DEFINE p_docno        LIKE apea_t.apeadocno
   DEFINE p_seq          LIKE apeb_t.apebseq
   DEFINE p_apeb002      LIKE apeb_t.apeb002
   DEFINE p_apeb008      LIKE apeb_t.apeb008
   DEFINE p_apeb108      LIKE apeb_t.apeb108
   DEFINE l_amt          LIKE apeb_t.apeb108 
   DEFINE l_amt1         LIKE apeb_t.apeb108 
   DEFINE l_amt2         LIKE apeb_t.apeb108 
   DEFINE l_amt3         LIKE apeb_t.apeb108 
 
   
   LET g_errno =''
   #apcc可请款余额      
   SELECT SUM(COALESCE(apcc108,0)-COALESCE(apcc109,0)) INTO l_amt1
     FROM ( SELECT DISTINCT apccdocno,apccseq,apccseq,apcc108,apcc109
            FROM apbb_t,apba_t,isam_t,apca_t,apcb_t,apcc_t 
           WHERE apbbent = g_enterprise
             AND apbbent = apbaent 
             AND apbbdocno = apbadocno 
             AND apbbent = isament 
             AND apbbdocno = isamdocno 
             AND (apba005||apba006 = apcb002||apcb003
              OR  isam050 = apcadocno) 
             AND apcaent = apcbent 
             AND apcald = apcbld 
             AND apcadocno = apcbdocno 
             AND apcbent = apccent 
             AND apcbld = apccld 
             AND apcbdocno = apccdocno 
            #AND apbb002 = apca005 #180927-00013#1 mark
             AND apbb002 = apca004 #180927-00013#1 add
             AND isamdocno = p_apeb002
             AND isam010 = p_apeb008
         )
      
   IF cl_null(l_amt1) THEN 
      LET l_amt1 = 0
   END IF
      
   #aapt415 己請款未核銷額(apeb108-apeb109)
   SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)) INTO l_amt2
     FROM apea_t,apeb_t
    WHERE apebent = g_enterprise
      AND apeaent = apebent
      AND apeadocno = apebdocno 
      AND apeb002 = p_apeb002
      AND apeb008 = p_apeb008
      AND ((apebdocno = p_docno
      AND  apebseq <> p_seq)
       OR apebdocno <> p_docno)
      AND apeastus <> 'X' 
   
   IF cl_null(l_amt2) THEN 
      LET l_amt2 = 0
   END IF
   
   IF l_amt2 < 0 THEN 
      LET l_amt2 = l_amt2 * -1
   END IF
      
   #aapt420 未確認之核銷單
   #201030-00047#1 mark(s)
#   SELECT SUM(apce109) INTO l_amt3
#     FROM apda_t,apce_t
#    WHERE apdaent = g_enterprise
#      AND apdaent = apceent
#      AND apdald = apceld
#      AND apdadocno = apcedocno
#      #AND apce003||apce004||apce005 IN (SELECT apccdocno||apccseq||apcc001 #170618-00361#1 mark
#       AND apce003||apce004||apce005 IN (SELECT DISTINCT apccdocno||apccseq||apcc001  #170618-00361#1 add      
#                                       FROM apbb_t,apba_t,isam_t,apca_t,apcb_t,apcc_t 
#                                      WHERE apbbent = g_enterprise
#                                        AND apbbent = apbaent 
#                                        AND apbbdocno = apbadocno 
#                                        AND apbbent = isament 
#                                        AND apbbdocno = isamdocno 
#                                        AND (apba005||apba006 = apcb002||apcb003
#                                         OR  isam050 = apcadocno) 
#                                        AND apcaent = apcbent 
#                                        AND apcald = apcbld 
#                                        AND apcadocno = apcbdocno 
#                                        AND apcbent = apccent 
#                                        AND apcbld = apccld 
#                                        AND apcbdocno = apccdocno 
#                                       #AND apbb002 = apca005 #180927-00013#1 mark
#                                        AND apbb002 = apca004 #180927-00013#1 add
#                                        AND isamdocno = p_apeb002
#                                        AND isam010 = p_apeb008)     
#      AND apdastus <> 'X' 
   #201030-00047#1 mark(e)
   #201030-00047#1 add(s)
   SELECT SUM(apce109) INTO l_amt3
     FROM apda_t,apce_t
    WHERE apdaent = g_enterprise
      AND apdaent = apceent
      AND apdald = apceld
      AND apdadocno = apcedocno
      AND EXISTS(SELECT 1 FROM apbb_t,apba_t,isam_t,apca_t,apcb_t,apcc_t
                  WHERE apbbent = g_enterprise
                    AND apbbent = apbaent
                    AND apbbdocno = apbadocno
                    AND apbbent = isament
                    AND apbbdocno = isamdocno
                    AND apcc001 = l_apeb005
                    AND isam050 = apcadocno
                    AND apcaent = apbbent
                    AND apcaent = apcbent
                    AND apcald = apcbld
                    AND apcadocno = apcbdocno
                    AND apcbent = apccent
                    AND apcbld = apccld
                    AND apcbdocno = apccdocno
                    AND apbb002 = apca005
                    AND isamdocno = p_apeb002
                    AND isam010 = p_apeb008
                    AND apccdocno = apce003
                    AND apccseq = apce004
                    AND apcc001 = apce005)                 
   #201030-00047#1 add(e)

   IF cl_null(l_amt3) THEN 
      LET l_amt3 = 0
   END IF      
      
   #计算可请款余额
   LET l_amt = l_amt1 - l_amt2 - l_amt3
   
   IF p_apeb108 > l_amt THEN 
      LET g_errno ='aap-00414'
 
  END IF
END FUNCTION
# 审核检查
PRIVATE FUNCTION aapt415_confirm_chk()
   DEFINE l_sql            STRING
   DEFINE l_apebdocno      LIKE apeb_t.apebdocno
   DEFINE l_apebseq        LIKE apeb_t.apebseq
   DEFINE l_apeb002        LIKE apeb_t.apeb002
   DEFINE l_apeb008        LIKE apeb_t.apeb008
   DEFINE l_apeb108        LIKE apeb_t.apeb108
   DEFINE r_success        LIKE type_t.num5
   
   LET r_success = TRUE
   LET l_sql = "SELECT apebdocno,apebseq,apeb002,apeb008,apeb108 ",
               "  FROM apeb_t ",
               " WHERE apebent = ",g_enterprise,
               "   AND apebdocno = '",g_apea_m.apeadocno,"'"
               
   PREPARE aapt415_confirm_chk_pre FROM l_sql
   DECLARE aapt415_confirm_chk_cs CURSOR FOR aapt415_confirm_chk_pre
   
   FOREACH aapt415_confirm_chk_cs INTO l_apebdocno,l_apebseq,l_apeb002,l_apeb008,l_apeb108
      CALL aapt415_apeb108_chk(l_apebdocno,l_apebseq,l_apeb002,l_apeb008,l_apeb108)
      IF NOT cl_null(g_errno) THEN 
         IF NOT cl_null(g_errno) THEN 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = l_apebseq,'/',l_apeb002,'/',l_apeb008,'/',l_apeb108
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 帳款單開窗多選帶單身
# Memo...........: 180927-00013#1 create
# Usage..........: CALL aapt415_apeb003_controlp(p_str_array)
#                  RETURNING r_success
# Input parameter: p_str_array
# Return code....: r_success
# Date & Author..: 190124 By 10554
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt415_apeb003_controlp(p_str_array)
DEFINE p_str_array   DYNAMIC ARRAY OF STRING
DEFINE r_success     LIKE type_t.num5
DEFINE l_amt_flag    LIKE type_t.chr1
DEFINE l_i           LIKE type_t.num5
DEFINE l_cnt         LIKE type_t.num5
DEFINE tok           base.StringTokenizer
DEFINE l_str1        LIKE type_t.chr100 #apcadocno
DEFINE l_str2        LIKE type_t.chr100 #apccseq
DEFINE l_str3        LIKE type_t.chr100 #apcc001
DEFINE l_str4        LIKE type_t.chr100 #apcc009
DEFINE l_sql         STRING
DEFINE l_flag        LIKE type_t.chr1

   CALL cl_err_collect_init()
   LET r_success = TRUE
   CALL s_transaction_end('N',0)
   
   CALL s_transaction_begin()
   LET l_flag = 'N' #是否有寫入資料
   
   #若為修改,刪除該筆單身資料
   DELETE FROM apeb_t 
    WHERE apebent = g_enterprise
      AND apebdocno = g_apea_m.apeadocno
      AND apebseq = g_apeb_d[l_ac].apebseq
   
   FOR l_i = 1 TO p_str_array.getLength()
      LET tok = base.StringTokenizer.create(g_qryparam.str_array[l_i],"|")
      LET l_cnt = 0
      WHILE tok.hasMoreTokens()
         LET l_cnt = l_cnt + 1
         CASE l_cnt
            WHEN "1"
               LET l_str1 = tok.nextToken()
            WHEN "2"
               LET l_str2 = tok.nextToken()
            WHEN "3"
               LET l_str3 = tok.nextToken()
            WHEN "4"
               LET l_str4 = tok.nextToken()
            OTHERWISE
               EXIT WHILE
         END CASE
      END WHILE
      IF cl_null(l_str1) THEN CONTINUE FOR END IF #帳款單號為空就跳過
      #帳款單檢核
      CALL aapt415_apeb003_chk(l_str1,l_str2,l_str3) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         CONTINUE FOR
      END IF

      #新增單身
      CALL aapt415_apeb003_detail(l_str1,l_str2,l_str3,l_str4) RETURNING g_sub_success 
      IF g_sub_success THEN
         LET l_flag = 'Y' #寫入資料flag
      ELSE
         LET r_success = FALSE
      END IF
   END FOR
   
   IF r_success AND l_flag = 'Y' THEN 
      CALL s_transaction_end('Y',0)
   ELSE
      CALL s_transaction_end('N',0)
   END IF
   CALL cl_err_collect_show()
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢核帳款單
# Memo...........: 180927-00013#1 create
# Usage..........: CALL aapt415_apeb003_chk(p_apce003,p_apce004,p_apce005)
#                  RETURNING r_success
# Input parameter: p_apcadocno 帳款單
# Return code....: r_success
# Date & Author..: 190125 By 10554
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt415_apeb003_chk(p_apce003,p_apce004,p_apce005)
DEFINE p_apce003       LIKE apce_t.apce003
DEFINE p_apce004       LIKE apce_t.apce004
DEFINE p_apce005       LIKE apce_t.apce005
DEFINE r_success       LIKE type_t.num5
DEFINE l_gzcb003_str   LIKE gzcb_t.gzcb003
DEFINE l_cnt           LIKE type_t.num10
DEFINE l_sql           STRING

   LET r_success = TRUE
   #檢核帳款單性質是否符合SCC設定的範圍
   SELECT gzcb003 INTO l_gzcb003_str 
     FROM gzcb_t 
    WHERE gzcb001 = '8530' AND gzcb002 = g_apeb_d[l_ac].apeb001
   CALL s_fin_get_wc_str(l_gzcb003_str) RETURNING l_gzcb003_str
   LET l_cnt = 0
   LET l_sql = "SELECT COUNT(1) ",
               "  FROM apca_t ",
               " WHERE apcaent = ",g_enterprise,
               "   AND apcadocno = '",p_apce003,"'",
               "   AND apca001 IN ",l_gzcb003_str
   PREPARE aapt415_apca001_chk FROM l_sql 
   EXECUTE aapt415_apca001_chk INTO l_cnt
   IF l_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = p_apce003
      LET g_errparam.code = 'aap-00583' #輸入的單號所對應的帳款單性質不符，請重新輸入!
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      LET r_success = FALSE
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 帳款單產單身資料
# Memo...........: 180927-00013#1 create
# Usage..........: CALL aapt415_apeb003_detail(p_apcadocno,p_apcbseq,p_apcc001)
#                  RETURNING r_success
# Input parameter: p_apccdocno 帳款單號
#                : p_apccseq   帳款單項次
#                : p_apcc001   帳期
#                : p_apcc009   發票號碼
# Return code....: r_success
# Date & Author..: 190128 By 10554
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt415_apeb003_detail(p_apccdocno,p_apccseq,p_apcc001,p_apcc009)
DEFINE p_apccdocno   LIKE apcc_t.apccdocno
DEFINE p_apccseq     LIKE apcc_t.apccseq  
DEFINE p_apcc001     LIKE apcc_t.apcc001  
DEFINE p_apcc009     LIKE apcc_t.apcc009 
DEFINE r_success     LIKE type_t.num5
DEFINE l_sql         STRING
DEFINE l_apcc        RECORD
       apcc002       LIKE apcc_t.apcc002,
       apcc004       LIKE apcc_t.apcc004,
       apcc008       LIKE apcc_t.apcc008,
       apcc010       LIKE apcc_t.apcc010,
       apcc100       LIKE apcc_t.apcc100,
       apcc102       LIKE apcc_t.apcc102,
       apcc108       LIKE apcc_t.apcc108,
       apcc109       LIKE apcc_t.apcc109
                     END RECORD
DEFINE l_apca        RECORD
       apca001       LIKE apca_t.apca001,
       apca004       LIKE apca_t.apca004,
       apca005       LIKE apca_t.apca005,
       apca032       LIKE apca_t.apca032,
       apca035       LIKE apca_t.apca035,
       apcb049       LIKE apcb_t.apcb049
                     END RECORD 
DEFINE l_apeb        RECORD  #付款申請帳款明細檔
       apebent       LIKE apeb_t.apebent, #企業編號
       apebcomp      LIKE apeb_t.apebcomp, #法人
       apebsite      LIKE apeb_t.apebsite, #資金中心
       apebld        LIKE apeb_t.apebld, #帳套
       apeborga      LIKE apeb_t.apeborga, #帳務歸屬組織
       apebdocno     LIKE apeb_t.apebdocno, #沖銷單單號
       apebseq       LIKE apeb_t.apebseq, #項次
       apeb001       LIKE apeb_t.apeb001, #來源作業
       apeb002       LIKE apeb_t.apeb002, #對帳單號
       apeb003       LIKE apeb_t.apeb003, #沖銷帳款單單號
       apeb004       LIKE apeb_t.apeb004, #沖銷帳款單項次
       apeb005       LIKE apeb_t.apeb005, #沖銷帳款單帳期
       apeb006       LIKE apeb_t.apeb006, #款別性質
       apeb007       LIKE apeb_t.apeb007, #發票代碼
       apeb008       LIKE apeb_t.apeb008, #發票號碼
       apeb010       LIKE apeb_t.apeb010, #摘要說明
       apeb013       LIKE apeb_t.apeb013, #帳款對象
       apeb015       LIKE apeb_t.apeb015, #沖銷加減項
       apeb016       LIKE apeb_t.apeb016, #沖銷科目
       apeb024       LIKE apeb_t.apeb024, #付款單號
       apeb025       LIKE apeb_t.apeb025, #付款單項次
       apeb028       LIKE apeb_t.apeb028, #產生方式
       apeb031       LIKE apeb_t.apeb031, #應付到期日
       apeb100       LIKE apeb_t.apeb100, #幣別
       apeb101       LIKE apeb_t.apeb101, #匯率
       apeb109       LIKE apeb_t.apeb109, #原幣已沖銷金額
       apeb119       LIKE apeb_t.apeb119, #本幣已沖銷金額
       apeb011       LIKE apeb_t.apeb011, #發票日期
       apeb012       LIKE apeb_t.apeb012, #發票類型
       apeb108       LIKE apeb_t.apeb108, #原幣請款金額
       apeb118       LIKE apeb_t.apeb118, #本幣請款金額
       apeb023       LIKE apeb_t.apeb023  #付款對象
END RECORD      
DEFINE l_apce        RECORD
                     apce038    LIKE apce_t.apce038,
                     apce024    LIKE apce_t.apce024,
                     apce100    LIKE apce_t.apce100,
                     apce109    LIKE apce_t.apce109,
                     apce101    LIKE apce_t.apce101,
                     
                     apce119    LIKE apce_t.apce119,
                     apce120    LIKE apce_t.apce120,
                     apce121    LIKE apce_t.apce121,
                     apce129    LIKE apce_t.apce129,
                     apce130    LIKE apce_t.apce130,
                     
                     apce131    LIKE apce_t.apce131,
                     apce139    LIKE apce_t.apce139,
                     apce031    LIKE apce_t.apce031,
                     apce017    LIKE apce_t.apce017,
                     apce018    LIKE apce_t.apce018,
                     
                     apce019    LIKE apce_t.apce019,
                     apce022    LIKE apce_t.apce022,
                     apce020    LIKE apce_t.apce020,
                     apce023    LIKE apce_t.apce023,
                     apce035    LIKE apce_t.apce035,
                     
                     apce036    LIKE apce_t.apce036,
                     apce044    LIKE apce_t.apce044,
                     apce045    LIKE apce_t.apce045,
                     apce046    LIKE apce_t.apce046,
                     apce051    LIKE apce_t.apce051,
                     
                     apce052    LIKE apce_t.apce052,
                     apce053    LIKE apce_t.apce053,
                     apce054    LIKE apce_t.apce054,
                     apce055    LIKE apce_t.apce055,
                     apce056    LIKE apce_t.apce056,
                     
                     apce057    LIKE apce_t.apce057,
                     apce058    LIKE apce_t.apce058,
                     apce059    LIKE apce_t.apce059,
                     apce060    LIKE apce_t.apce060,
                     apce010    LIKE apce_t.apce010,
                     apce048    LIKE apce_t.apce048   
                     END RECORD  
                     
                     
   LET r_success = TRUE
   INITIALIZE l_apcc.* TO NULL
   INITIALIZE l_apca.* TO NULL
   INITIALIZE l_apeb.* TO NULL
   INITIALIZE l_apce.* TO NULL
   
   
   #共同欄位
   LET l_apeb.apebent   = g_enterprise
   LET l_apeb.apebcomp  = g_apea_m.apeacomp
   LET l_apeb.apebsite  = g_apea_m.apeasite
   LET l_apeb.apebld    = g_apea_m.apeald
   LET l_apeb.apeborga  = g_apeb_d[l_ac].apeborga
   LET l_apeb.apebdocno = g_apea_m.apeadocno
   LET l_apeb.apeb001   = g_apeb_d[l_ac].apeb001
   
   #新增單身
   SELECT DISTINCT apcc002,apcc004,apcc008,apcc010,
                   apcc100,apcc102,apcc108,apcc109,
                   apca001,apca004,apca005,apca032,
                   apca035,(SELECT MAX(apcb049) FROM apcb_t WHERE apcbent = apcaent AND apcbld = apcald AND apcbdocno = apcadocno)
     INTO l_apcc.apcc002,l_apcc.apcc004,l_apcc.apcc008,l_apcc.apcc010,
          l_apcc.apcc100,l_apcc.apcc102,l_apcc.apcc108,l_apcc.apcc109,
          l_apca.apca001,l_apca.apca004,l_apca.apca005,l_apca.apca032,
          l_apca.apca035,l_apca.apcb049
     FROM apcc_t,apca_t 
    WHERE apccent = apcaent 
      AND apccld = apcald 
      AND apccdocno = apcadocno 
      AND apccent = g_enterprise
      AND apccld = g_apea_m.apeald
      AND apccdocno = p_apccdocno
      AND apccseq = p_apccseq  
      AND apcc001 = p_apcc001
   
   #取項次
   LET l_apeb.apebseq = ''
   SELECT MAX(apebseq)+1 INTO l_apeb.apebseq
     FROM apeb_t 
    WHERE apebent = g_enterprise
      AND apebdocno = g_apea_m.apeadocno
   IF cl_null(l_apeb.apebseq) THEN
      LET l_apeb.apebseq = 1
   END IF
   
   LET l_apeb.apeb002 = l_apca.apcb049
   LET l_apeb.apeb003 = p_apccdocno #帳款單號
   LET l_apeb.apeb004 = p_apccseq #帳款單項次
   LET l_apeb.apeb005 = p_apcc001 #帳款單帳期
   LET l_apeb.apeb006 = l_apcc.apcc002
   LET l_apeb.apeb007 = l_apcc.apcc008
   LET l_apeb.apeb008 = p_apcc009
   LET l_apeb.apeb010 = ''
   LET l_apeb.apeb013 = l_apca.apca004
   IF l_apeb.apeb001 = '40' THEN
      LET l_apeb.apeb015 = 0 #加項
   ELSE
      LET l_apeb.apeb015 = 1 #減項
   END IF
   LET l_apeb.apeb016 = l_apca.apca035
   LET l_apeb.apeb024 = ''
   LET l_apeb.apeb025 = ''
   LET l_apeb.apeb028 = '0' #人工輸入
   LET l_apeb.apeb031 = l_apcc.apcc004
   LET l_apeb.apeb100 = l_apcc.apcc100
   LET l_apeb.apeb101 = l_apcc.apcc102
   LET l_apeb.apeb109 = 0
   LET l_apeb.apeb119 = 0
   LET l_apeb.apeb011 = l_apcc.apcc010
   LET l_apeb.apeb012 = l_apca.apca032
   CALL s_aapt420_source_doc_carry(l_apeb.apeb001,l_apeb.apeb003,l_apeb.apeb004,l_apeb.apebld,
                                   l_apeb.apebdocno,l_apeb.apebseq,l_apeb.apebld,
                                   l_apeb.apeb005,l_apeb.apeb008,g_sfin2002)                        
      RETURNING l_apce.apce038,l_apce.apce024,l_apce.apce100,l_apce.apce109,l_apce.apce101,
                l_apce.apce119,l_apce.apce120,l_apce.apce121,l_apce.apce129,l_apce.apce130,
                l_apce.apce131,l_apce.apce139,l_apce.apce031,l_apce.apce017,l_apce.apce018,
                l_apce.apce019,l_apce.apce022,l_apce.apce020,l_apce.apce023,l_apce.apce035,
                l_apce.apce036,l_apce.apce044,l_apce.apce045,l_apce.apce046,l_apce.apce051,
                l_apce.apce052,l_apce.apce053,l_apce.apce054,l_apce.apce055,l_apce.apce056,
                l_apce.apce057,l_apce.apce058,l_apce.apce059,l_apce.apce060,l_apce.apce010,
                l_apce.apce048
   LET l_apeb.apeb108 = l_apce.apce109   
   LET l_apeb.apeb118 = l_apce.apce119  #190507-00038#1 add
   IF l_apca.apca001[1,1] = 2 THEN
      LET l_apeb.apeb108 = l_apeb.apeb108 * -1
      LET l_apeb.apeb118 = l_apeb.apeb118 * -1 #190507-00038#1 add  
   END IF
   #CALL s_curr_round_ld('1',l_apeb.apebld ,g_glaa001,l_apeb.apeb108 * l_apeb.apeb101,2) RETURNING g_sub_success,g_errno,l_apeb.apeb118 #190507-00038#1 mark
   LET l_apeb.apeb023 = l_apca.apca005
   
   INSERT INTO apeb_t (apebent,apebcomp,apebsite,apebld,apeborga,
                       apebdocno,apebseq,
                       apeb001,apeb002,apeb003,apeb004,apeb005,
                       apeb006,apeb007,apeb008,apeb010,apeb013,
                       apeb015,apeb016,apeb024,apeb025,apeb028,
                       apeb031,apeb100,apeb101,apeb109,apeb119,
                       apeb011,apeb012,apeb108,apeb118,apeb023
                      )
      VALUES (l_apeb.apebent,l_apeb.apebcomp,l_apeb.apebsite,l_apeb.apebld,l_apeb.apeborga,
              l_apeb.apebdocno,l_apeb.apebseq,
              l_apeb.apeb001,l_apeb.apeb002,l_apeb.apeb003,l_apeb.apeb004,l_apeb.apeb005,
              l_apeb.apeb006,l_apeb.apeb007,l_apeb.apeb008,l_apeb.apeb010,l_apeb.apeb013,
              l_apeb.apeb015,l_apeb.apeb016,l_apeb.apeb024,l_apeb.apeb025,l_apeb.apeb028,
              l_apeb.apeb031,l_apeb.apeb100,l_apeb.apeb101,l_apeb.apeb109,l_apeb.apeb119,
              l_apeb.apeb011,l_apeb.apeb012,l_apeb.apeb108,l_apeb.apeb118,l_apeb.apeb023
             )
   IF SQLCA.sqlcode THEN
      LET r_success = FALSE
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "ins apeb_t" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 款别性质变更
# Memo...........: #210121-00016#5
# Usage..........: CALL aapt415_change_payment()
# Input parameter: 
# Return code....: 
# Date & Author..: 2021/03/24 by 08172
# Modify.........:
################################################################################
PRIVATE FUNCTION aapt415_change_payment()
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否 
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_apea_m.apeasite,g_apea_m.apeasite_desc,g_apea_m.apea003,g_apea_m.apea003_desc,g_apea_m.apeadocdt,g_apea_m.apeacomp,g_apea_m.apeald,g_apea_m.apeadocno,g_apea_m.apea001,g_apea_m.apea019,g_apea_m.apea020,g_apea_m.apea005,g_apea_m.apea005_desc,g_apea_m.apea013,g_apea_m.apea006,g_apea_m.apeastus, 
       g_apea_m.apeaownid,g_apea_m.apeaownid_desc,g_apea_m.apeaowndp,g_apea_m.apeaowndp_desc,g_apea_m.apeacrtid,g_apea_m.apeacrtid_desc,g_apea_m.apeacrtdp,g_apea_m.apeacrtdp_desc,g_apea_m.apeacrtdt,g_apea_m.apeamodid,g_apea_m.apeamodid_desc,g_apea_m.apeamoddt,g_apea_m.apeacnfid,g_apea_m.apeacnfid_desc, 
       g_apea_m.apeacnfdt
 
#   LET g_forupd_sql = " SELECT apeasite,'',apea003,'',apeadocdt,apeacomp,apeald,apeadocno,apea001,apea019,apea020,apea005,'',apea013,apea006,apeastus,apeaownid,'',apeaowndp,'',apeacrtid,'',apeacrtdp,'',apeacrtdt,apeamodid,'',apeamoddt,apeacnfid,'',apeacnfdt", 
#                      " FROM apea_t",
#                      " WHERE apeaent= ? AND apeadocno=? FOR UPDATE"
#   #add-point:SQL_define name="main.after_define_sql"
#
#   #end add-point
#   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
#   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
#   DECLARE aapt415_cl1 CURSOR FROM g_forupd_sql                 # LOCK CURSOR
#   CALL aapt415_chk_data_exist(g_forupd_sql)
#   
#   LET g_forupd_sql = "SELECT apebseq,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld FROM apeb_t WHERE apebent=? AND apebdocno=? AND apebseq=? FOR UPDATE"
#   #add-point:input段define_sql name="input.after_define_sql"
#
#   #end add-point 
#   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
#   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
#   DECLARE aapt415_bcl1 CURSOR FROM g_forupd_sql
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
      INPUT ARRAY g_apeb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = FALSE, 
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
          
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            CALL aapt415_show()
            #end add-point
          
            CALL aapt415_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_apeb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            #營運據點取得帳別與法人
            CALL s_fin_orga_get_comp_ld(g_apea_m.apeasite) RETURNING g_sub_success,g_errno,g_apea_m.apeacomp,g_apea_m.apeald
            CALL aapt415_set_entry_invoice_code()
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            LET g_aw = 's_detail1'
            #end add-point   
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1
            
            LET l_lock_sw = 'N'            #DEFAULT
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN aapt415_cl USING g_enterprise,g_apea_m.apeadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN aapt415_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE aapt415_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
 
            #200804-00006 ---start---
            FETCH aapt415_cl
            IF SQLCA.SQLCODE AND SQLCA.SQLCODE <> 100 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH aapt415_cl:",SQLERRMESSAGE
               LET g_errparam.code = SQLCA.SQLCODE
               LET g_errparam.popup = TRUE
               CLOSE aapt415_cl
               #PostgreSQL需額外重新開啟, 無論主程式子程式都須關閉
               CALL s_transaction_end('N','0')
               CALL s_transaction_begin()
               CALL cl_err()
               RETURN
            END IF
            #200804-00006 --- end ---
            LET g_rec_b = g_apeb_d.getLength()
            LET g_apeb_d_t.* = g_apeb_d[l_ac].*  #BACKUP
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*  #BACKUP
            CALL aapt415_set_entry_b('x')
            #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
             
            #end add-point  
            CALL aapt415_set_no_entry_b('x')
            IF NOT aapt415_lock_b("apeb_t","'2'") THEN
               LET l_lock_sw='Y'
            ELSE
               FETCH aapt415_bcl1 INTO g_apeb_d[l_ac].apebseq,g_apeb_d[l_ac].apeborga,g_apeb_d[l_ac].apeb001,g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb011,g_apeb_d[l_ac].apeb003,g_apeb_d[l_ac].apeb004,g_apeb_d[l_ac].apeb005,g_apeb_d[l_ac].apeb031,g_apeb_d[l_ac].apeb100, 
                   g_apeb_d[l_ac].apeb108,g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118,g_apeb_d[l_ac].apeb006,g_apeb_d[l_ac].apeb010,g_apeb_d[l_ac].apeb024,g_apeb_d[l_ac].apeb025,g_apeb_d[l_ac].apebcomp,g_apeb_d[l_ac].apeb012,g_apeb_d[l_ac].apebld
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = g_apeb_d_t.apebseq,":",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  LET l_lock_sw = "Y"
               END IF
               
               #遮罩相關處理
               LET g_apeb_d_mask_o[l_ac].* =  g_apeb_d[l_ac].*
               CALL aapt415_apeb_t_mask()
               LET g_apeb_d_mask_n[l_ac].* =  g_apeb_d[l_ac].*
               
               LET g_bfill = "N"
               CALL aapt415_show()
               LET g_bfill = "Y"
               
               CALL cl_show_fld_cont()
            END IF
            
            #遮罩相關處理
            LET g_apeb_d_mask_o[l_ac].* =  g_apeb_d[l_ac].*
            CALL aapt415_apeb_t_mask()
            LET g_apeb_d_mask_n[l_ac].* =  g_apeb_d[l_ac].*
            
            LET g_bfill = "N"
            CALL aapt415_show()
            LET g_bfill = "Y"
            
            CALL cl_show_fld_cont()
            #add-point:modify段before row name="input.body.before_row"
          
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
          
            #其他table進行lock
            
          
            CALL aapt415_idx_chk()
            
         BEFORE FIELD apeb031
            #add-point:BEFORE FIELD apeb031 name="input.b.page1.apeb031"

            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb031
            
            #add-point:AFTER FIELD apeb031 name="input.a.page1.apeb031"
            IF NOT cl_null(g_apeb_d[l_ac].apeb031) THEN
               IF g_apeb_d[l_ac].apeb031 != g_apeb_d_o.apeb031 OR cl_null(g_apeb_d_o.apeb031) THEN
                  IF g_apeb_d[l_ac].apeb031 < g_apea_m.apeadocdt THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'aap-00753' #付款到期日不可小於單頭請款日期，請重新輸入！
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_apeb_d[l_ac].apeb031 = g_apeb_d_o.apeb031
                     DISPLAY BY NAME g_apeb_d[l_ac].apeb031
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_apeb_d_o.* = g_apeb_d[l_ac].*
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb031
            #add-point:ON CHANGE apeb031 name="input.g.page1.apeb031"

            #END add-point 
            
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD apeb006
            #add-point:BEFORE FIELD apeb006 name="input.b.page1.apeb006"
          
            #END add-point
          
          
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD apeb006
            
            #add-point:AFTER FIELD apeb006 name="input.a.page1.apeb006"
          
            #END add-point
            
          
          
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE apeb006
            #add-point:ON CHANGE apeb006 name="input.g.page1.apeb006"
          
            #END add-point 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_apeb_d[l_ac].* = g_apeb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE aapt415_bcl1
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_apeb_d[l_ac].apebseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_apeb_d[l_ac].* = g_apeb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
          
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
          
               #將遮罩欄位還原
               CALL aapt415_apeb_t_mask_restore('restore_mask_o')
          
               UPDATE apeb_t SET (apebdocno,apebseq,apeborga,apeb001,apeb002,apeb007,apeb008,apeb011,apeb003,apeb004,apeb005,apeb031,apeb100,apeb108,apeb101,apeb118,apeb006,apeb010,apeb024,apeb025,apebcomp,apeb012,apebld) = (g_apea_m.apeadocno,g_apeb_d[l_ac].apebseq,g_apeb_d[l_ac].apeborga,g_apeb_d[l_ac].apeb001, 
                   g_apeb_d[l_ac].apeb002,g_apeb_d[l_ac].apeb007,g_apeb_d[l_ac].apeb008,g_apeb_d[l_ac].apeb011,g_apeb_d[l_ac].apeb003,g_apeb_d[l_ac].apeb004,g_apeb_d[l_ac].apeb005,g_apeb_d[l_ac].apeb031,g_apeb_d[l_ac].apeb100,g_apeb_d[l_ac].apeb108,g_apeb_d[l_ac].apeb101,g_apeb_d[l_ac].apeb118,g_apeb_d[l_ac].apeb006, 
                   g_apeb_d[l_ac].apeb010,g_apeb_d[l_ac].apeb024,g_apeb_d[l_ac].apeb025,g_apeb_d[l_ac].apebcomp,g_apeb_d[l_ac].apeb012,g_apeb_d[l_ac].apebld)
                WHERE apebent = g_enterprise AND apebdocno = g_apea_m.apeadocno 
          
                  AND apebseq = g_apeb_d_t.apebseq #項次   
          
                  
               #add-point:單身修改中 name="input.body.m_update"
          
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_apeb_d[l_ac].* = g_apeb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "apeb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_apeb_d[l_ac].* = g_apeb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "apeb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_apea_m.apeadocno
               LET gs_keys_bak[1] = g_apeadocno_t
               LET gs_keys[2] = g_apeb_d[g_detail_idx].apebseq
               LET gs_keys_bak[2] = g_apeb_d_t.apebseq
               CALL aapt415_update_b('apeb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
          
               #將遮罩欄位進行遮蔽
               CALL aapt415_apeb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_apeb_d[g_detail_idx].apebseq = g_apeb_d_t.apebseq 
          
                  ) THEN
                  LET gs_keys[01] = g_apea_m.apeadocno
          
                  LET gs_keys[gs_keys.getLength()+1] = g_apeb_d_t.apebseq
          
                  CALL aapt415_key_update_b(gs_keys,'apeb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_apea_m),util.JSON.stringify(g_apeb_d_t)
               LET g_log2 = util.JSON.stringify(g_apea_m),util.JSON.stringify(g_apeb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
          
               #end add-point
          
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
          
            #end add-point
            CALL aapt415_unlock_b("apeb_t","'2'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
          
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
          
            #end add-point 
            
      END INPUT
      
      BEFORE DIALOG 
      
      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"

         #end add-point    
         
      ON ACTION accept
         #add-point:input段accept  name="input.accept"

         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"

         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"

         #end add-point  
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"

         #end add-point
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
END FUNCTION

 
{</section>}
 
