#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_aic_carry.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0010(1900-01-01 00:00:00), PR版次:0010(2017-12-19 16:58:37)
#+ Customerized Version.: SD版次:0001(1900-01-01 00:00:00), PR版次:0010(2020-12-15 10:53:30)
#+ Build......: 000454
#+ Filename...: s_aic_carry
#+ Description: 多角拋轉應用元件
#+ Creator....: 04543(2014-05-08 18:59:01)
#+ Modifier...: 00000 -SD/PR- 07423
 
{</section>}
 
{<section id="s_aic_carry.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150917-00001#4  15/11/13 By earl    s_aic_carry_gen_tri_mr、s_aic_carry_gen_tri_rm、s_aic_carry_gen_tri_sb與s_aic_carry_gen_tri_bs加上製造批序號之拋轉
#151123-00007#1  15/11/26 By earl    修正逆推單價功能
#150917-00001#3  16/01/19 By earl    多角中斷調整為可拆單功能
#160310-00020#1  16/03/16 By lixiang 調整调用s_aic_carry_ins_sfac時傳入參數錯誤的問題
#160316-00023#2  16/03/16 By lixiang 拋轉產生入庫單和出貨單時，訂單有專案代號且"專案庫存控管"="Y"時，自動將專案代號帶入庫存管理特徵欄位中
#160428-00008#1  16/04/28 By 02040   多角產生出貨單不需備置，故將備置量預設為0
#160428-00006#2  16/05/09 By 02040   aicp100/aicp200 1.產生採購單時，採購幣別(icag008)若有值，則單據幣別=採購幣別
#                                      2.計價方式"轉撥單價"時，抓取單價(aici130)時需抓取同幣別資料
#                                      3.計價方式="依計價比率"時，單價*比率後，先換算為該據點的本幣單價，再依本幣單價換算為採購幣別單價
#160428-00006#3  16/05/09 By 02040   aicp900/aicp950 1.產生採購單時，採購幣別(icag008)若有值，則單據幣別=採購幣別
#                                      2.計價方式"轉撥單價"時，抓取單價(aici130)時需抓取同幣別資料
#                                      3.計價方式="依計價比率"時，單價*比率後，先換算為該據點的本幣單價，再依本幣單價換算為採購幣別單價
#160523-00018#1  16/06/14 By 02040   調整一張訂單只產生一張工單，工單來源再依xmdd的資料產生 
#160428-00006#4  16/06/24 By 02040   1.統購統付由逆拋調整為正拋2.調整統購統付(逆拋)回寫價格
#160713-00016#1  16/08/08 By 02040   訂單拋轉採購單時，不需重推交貨日期，導致和原單據日期不一致
#160831-00006#1  16/08/31 By 02040   採購變更單調整最終站的採購單最終供應商，增加UPDATE條件 
#160902-00008#1  16/09/02 By 02040   多角拋轉時，需一併將保稅、緊急度的值帶入
#161024-00037#1  16/11/01 By 02040   庫存異動單據拋轉，單據日期、過帳日期都應與起始單據相同
#161031-00050#1  16/11/02 By 02040   多角訂單有費用(xmds_t)和附屬零件(xmdq_t)需一併拋轉過去
#161107-00023#1  16/11/10 By 02040   訂單拋轉，收貨客戶和客戶料號抓始原始單據的
#161118-00012#1  16/11/22 By 06694   s_aic_carry_get_tri_price 裡面的s_aic_carry_icah_cs3、s_aic_carry_icah_cs5、s_aic_carry_icah_cs7 sql多串了2個單引號
#161203-00001#1  16/12/09 By charles4m 未抓到單價時，錯誤訊息未報出。
#                                      若抓不到料號+產品特徵的價格，需再抓料號+產品特徵為' '的價格，若無則報錯
#161215-00009#1  16/12/20 By shiun   納入aps計算欄位(pmdl019)，應固定為"Y"
#161216-00040#1  16/12/21 By 06021   多角订单抛转未根据客户编号自动带出收货地址、账款信息
#161219-00008#1  16/12/22 By charles4m s_aic_carry_icah_pre3、s_aic_carry_icah_pre5、s_aic_carry_icah_pre7 的 SQL LIKE 條件改為 = '*'
#161216-00005#1  16/12/23 By 02040   依aici100設定採購發票類型給予採購單pmdl033
#161214-00046#1  16/12/27 By catmoon 目前該欄位非必輸，拿掉aic-00144控卡
#161227-00009#1  17/01/13 By xujing  调整如果pmdl033为空条件下的 aic-00153 替换成 aic-00225
#170103-00002#1  17/01/18 By 02040   訂單拋轉，單身未帶出簽收日期
#170206-00013#1  17/02/08 By Ann_Huang 1.調整暫存表的寫法s_aic_carry_create_temp_table_xmd()、s_aic_carry_create_temp_table_order()
#                                      2.調整第一點的暫存表名稱過長
#170213-00010#1  17/02/13 By liuym    添加管控，如果采购料号不存在与中间站据点或者终站据点，则不允许多角抛转
#170215-00007#1  17/02/15 By wuxja    写入采购单时需同步写入送货地址和账款地址
#170301-00021#3  17/03/02 By 09263    g_prog整批調整
#170315-00045#1  17/03/15 By ywtsai   修正s_aic_carry_xmdh_pre的SQL給值項次對應錯誤
#170105-00050#2  17/03/20 By 07024    1.預先訂單/採購單拋轉，各站產生的po/so的預先性質，原：性質都給"一般" ； 改成：性質給預訂
#                                     2.資料來源為預先單據的so/po拋轉時，要回寫當站，對應的預先單據的數量
#                                       (訂單=>已出貨量；採購單=>已收貨量、已入庫量)
#170317-00044#1  17/03/23 By ywtsai   產生各站訂單時，出貨狀態(xmdd017)預設為2.準時交貨
#170321-00126#1  17/03/30 By ywtsai   修改產生委外收貨入庫、倉退單時，檢核單據需依照性質判斷apmt531與apmt581
#170414-00041#1  17/04/18 By 06021    调整多角订单变更单价后，下站采购单价没有发生变化问题
#170517-00029#1  17/05/18 By dorislai 1.多角訂單產生委外工單時，其項次未拆成多交期，工單來源應為「2訂單」，若是多交期，工單來源維持「1:MULTI」
#                                     2.修正s_aic_carry_xmdd_pre3少SELECT xmdd006，導致工單轉開工量為0及跳出單位換算的錯誤訊息
#                                     3.多角訂單產生委外工單，若其項次僅有一筆交期，工單的項序(sfaa008)、分批序(sfaa063)需有值
#170618-00330#1  17/06/28 By 08171    銷售多角，有勾委外工單開立點，在用aicp100拋轉時，拋轉出來的委外採購單(apmt501)，來源單號修改成
#                                     1.多(asft300)對一(apmt501)，來源單號(pmdl008)為空
#                                     2.一(asft300)對一(asft300)，來源單號(pmdl008)為工單單號
#170618-00384#1  17/06/30 By 08171    CALL s_asft300_02的時候，因為g_prog還是aicp100，所以檢查單據別的時候會跳錯，本來應該刪掉的最大號會沒有刪除，導致跳號。
#                                     所以在CALL s_asft300_02之前，將g_prog改成asft300，結束後再還回原本的g_prog
#170629-00016#1  17/07/04 By ywtsai   修正銷售多角當來源為入庫單時的判斷方式來取得出通單
#170620-00041#1  17/07/06 By 08171    1. 代採購拋轉時，下單客戶、帳款客戶，出/收貨客戶調整
#                                     2. 出/收貨地址、帳款地址都與初始單據相同
#170620-00057#1  17/07/12 By 07024    修正代採購正拋，收貨+入庫，拋轉失敗(原因：沒取到多角序號)
#170706-00050#1  17/07/12 By 06021    调整多角订单抛转后终点站订单运输方式没值（xmdc031)问题
#170718-00003#1  17/07/18 By ywtsai   修改產生多角單據號碼時，據點代號取代問題
#170718-00059#1  17/07/19 By 08171    最終採購單，將pmdl006='6'改成pmdl006='1'
#170623-00003#1  17/07/19 By 07024    修正統購統付，拋轉的出貨單、入庫單上的"收貨/送貨客戶"
#170724-00046#1  17/07/25 By 06021    调整多角出货单来源为出通单时，抛转报axm-00183错误问题
#170814-00011#1  17/08/14 By wuxja    最终站采购单应根据供应商惯用币别给值，而不是aici120
#170221-00029#2  17/08/22 By 07024    aicp100拋轉時，需將訂單的單頭備註、以及單身備註/長備註，拋轉至各據點的訂單、採購單
#170824-00001#1  17/08/29 By wuxja    xmda037起運地,xmda038目的地,xmdc025單身收貨地址,xmdc031單身運輸方式 应同来源单据
#170830-00067#1  17/09/07 By wuxja    产生多角采购单时，检验否栏位同一般采购单取值逻辑
#170824-00002#2  17/09/11 By 08171    多角拋轉時，送貨供應商、客戶連絡人要從來源訂單拋轉過來
#170824-00002#3  17/09/12 By 08171    變更已拋轉的訂單(axmt510)時，收貨地址、運送方式、起運點、目的地、送貨供應商、客戶連絡人要一起更新
#170817-00043#5  17/09/20 By 08171    原始單據備註欄位需一併拋轉至各站
#                                     修正BUG：如果多角流程編號有10碼，後面流水號改成9碼
#170817-00043#11 17/09/22 By 08171    拋轉還原刪除備註資料sub:s_aic_carry_del_ooff
#170915-00041#1  17/09/20 By 06021    调整采购单别设置和请购勾稽，且请采勾稽差异处理方式设置为拒绝时，aicp100抛转写入采购关联明细错误导致提示apm-01118错误问题
#170105-00050#5  17/09/24 By 07024    1.資料來源為預先單據時，拋轉還原要回寫預先單據的數量
#                                     2.修正#170105-00050#2的預先數量回寫
#170929-00031#1  17/10/12 By 08993    多角拋轉產生的訂單,採購單中交期明細裡的資料中子件特性若為5.附屬零件,6.備品,7.包裝容器,9.樣品,價格設定為0
#171023-00015#1  17/10/24 By 07804    多角拋轉產生的採購單,取得的單價須依照aooi150作取位動作
#170908-00015#1  17/10/25 By 08171    切換營運據點效能：修改s_aic_carry:調整s_aic_carry_crt_tmp_xmd_new、s_aic_carry_crt_tmp_table_order_new這兩個FUNCTION裡的*，展開欄位
#170406-00022#6  17/10/30 By 08992    新增拋轉出貨單時，多拋轉新增的欄位(xmdk059~xmdk070)
#171031-00048#1  17/11/02 By 08525    aicp500抛转时，只对单据别和据点进行替换
#161222-00012#7  17/10/31 By 08171    當出貨、收貨入庫、銷退、倉退單頭來源單據沒有值的時候，
#                                     拋出來的單據其單頭來源單據不會有值，單身一定要有值
#170816-00007#31 17/11/16 By 10042    調整公用元件錯誤訊息,顯示更明確的資訊內容
#171116-00011#1  17/11/23 By 00272    代採產生最終供應商一般採購單資料後,若該站設定採購單自動mail時(S-BAS-0050),就按規則將mail寄出
#171130-00045#1  17/12/01 By 01258    销售通路、采购通路已非必输，多角不应再控卡
#171212-00048#1  17/12/13 By 06021    订单变更MRP冻结栏位后，同时需更新相应站点的MRP冻结栏位
#171110-00029#1  17/12/19 By 07423    多角訂單變更單重取單價問題
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"
#                18/06/21 By xianggy  委外采购单转工单和订单，基板供应商字段传递
#C180709-09421#5 18/07/10 By wangllz  昆山委外采购抛转南通工单，工单日期取昆山来源委外采购单和昆山来源工单中日期较大的
#C180710-09421#3 18/07/10 By wangllz  只有当采购单为委外采购时，才会启用apmi120的对照关系产生南通订单，其他的不启用
#C180709-09421#5 18/07/11 By wangllz  #使生成的工单批号等于来源工单的后九位
#C180711-09421#1 18/07/11 By wangllz  修正#C180709-09421#5,和顾问确认丽智的抛转过程，订单项次和采购单项次相同，采购单明细和采购单关联单据明细一对一
                                      #因此修改关联工单为采购单关联单据明细的来源单据
#C20180713-09016#4 2018/07/13 By Wangxt 生成的南通的工单的【预计开工日期】的取值：取昆山工单预计开工日期和委外采购单审核日期，两者的最大值
#                                       生成的南通的工单的【预计完工日期】的取值：取昆山工单的预计完工日期
#C20180717-09016#2 2018/07/17 By Wangxt 昆山委外多角抛回南通生成订单，工单，BOM中散料已勾选客供料，但是抛回生成的工单备料散料没有默认勾选上客供料选项
#C180723-09421#2   2018/07/23 By wangll 昆山委外采购抛转订单，工单时，工单的规格加下划线栏位要从aimm200带到工单
#C180724-09421#1   2018/07/24 By wangll 如果该订单的来源为委外采购单，工单发放之后回写订单的欠料数量为0
#C180824-07015#1   2018/08/24 by nixiang 订单单身【保质日期】传递
#180316-00044#1  18/03/19 By 06137    統銷統收拋轉後，apmt532送貨供應商值漏了給值，在s_aic_carry_gen_tri_mr裡面，無採購收貨入庫單的段落，用p_firstdocno去得出貨單的xmdk009
#C190527-06857#1  2019/05/27  By caohp    规格加下划线，根据原始单据来判断，而不是根据imaaud005来判断。
#C190628-06857#1  2019/06/28  By caohp    多角委外工单若单身作业编号为空，则更新为工单单身其他项的作业编号
#C190819-06857#1  2019/08/19  By caohp    错误管控，暂时mark掉
#C191119#1        2019/11/19  BY pyh      增加当多角性质是2:代采购,抛转生成的订单单身来源单号/来源序号等于单头的来源单号/单身序号
#                 2020/03/20  By yangtt   KS据点的应收与SAMOA的应付金额保持一致   
#C200804-01626#1  2020/08/04  By pane     当下阶不存在BOM的话，则抛转失败，不继续抛转
#C200917-01616#1  2020/09/17  By pane     增加E4O单别可以抛转委外采购单，抛转工单的时候按照单别的设置带出工单的类型
#181026-00050#1   2020/12/15  By pane    使用SELECT.....INTO TEMP...這種建立Temptable的方式，需加上1=2條件
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
GLOBALS "../../../com/sub/4gl/s_apmm101.inc"
GLOBALS "../../../com/sub/4gl/s_aic_carry.inc"
#170105-00050#2-s-add
GLOBALS
   DEFINE g_pre_aic       LIKE xmda_t.xmda031 #預先單據的多角序號
   DEFINE g_aic_source    LIKE type_t.num5    #紀錄來源單據是否為預先單據(0:非預先訂單 1:訂單 2:採購 --紀錄第一站)
   DEFINE g_err_collect   BOOLEAN             #C20180906-07783 ADD
   DEFINE g_ooba002      LIKE ooba_t.ooba002  #C20180906-07783 ADD
   DEFINE g_para         LIKE type_t.chr80    #C20180906-07783 ADD
END GLOBALS
#170105-00050#2-e-add
#end add-point
 
{</section>}
 
{<section id="s_aic_carry.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_aic_carry.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_sql    STRING

#採購單頭檔
DEFINE g_pmdl   RECORD LIKE pmdl_t.*
#採購單身明細檔
DEFINE g_pmdn   RECORD LIKE pmdn_t.*
#採購交期明細檔
DEFINE g_pmdo   RECORD LIKE pmdo_t.*
#採購關聯單據明細檔
DEFINE g_pmdp   RECORD LIKE pmdp_t.*
#採購多交期匯總檔
DEFINE g_pmdq   RECORD LIKE pmdq_t.*

#訂單單頭檔
DEFINE g_xmda   RECORD LIKE xmda_t.*
#訂單單身明細檔
DEFINE g_xmdc   RECORD LIKE xmdc_t.*
#訂單交期明細檔
DEFINE g_xmdd   RECORD LIKE xmdd_t.*
#訂單多交期匯總檔
DEFINE g_xmdf   RECORD LIKE xmdf_t.*
#訂單附屬零件明細檔
DEFINE g_xmdq   RECORD LIKE xmdq_t.*    #161031-00050#1 add
#訂單費用資料檔
DEFINE g_xmds   RECORD LIKE xmds_t.*    #161031-00050#1 add

#工單單頭檔
DEFINE g_sfaa   RECORD LIKE sfaa_t.*
#工單來源檔
DEFINE g_sfab   RECORD LIKE sfab_t.*
#工單聯產品檔
DEFINE g_sfac   RECORD LIKE sfac_t.*

#收貨/入庫單頭檔
DEFINE g_pmds   RECORD LIKE pmds_t.*                
#收貨/入庫單身明細檔
DEFINE g_pmdt   RECORD LIKE pmdt_t.*
#收貨/驗退/入庫/倉退單多庫儲批收貨明細檔
DEFINE g_pmdu   RECORD LIKE pmdu_t.*
#收貨/入庫需求分配明細檔
DEFINE g_pmdv   RECORD LIKE pmdv_t.*

#出貨單單頭檔
DEFINE g_xmdk   RECORD LIKE xmdk_t.*               
#出貨單身明細檔
DEFINE g_xmdl   RECORD LIKE xmdl_t.*
#出貨單多庫儲批
DEFINE g_xmdm   RECORD LIKE xmdm_t.*
#製造批序號
DEFINE g_inao   RECORD LIKE inao_t.*

TYPE type_g_sfcb_d RECORD
          sfcbdocno  LIKE sfcb_t.sfcbdocno,
          sfaa010    LIKE sfaa_t.sfaa010,
          sfcb001    LIKE sfcb_t.sfcb001,
          sfcb002    LIKE sfcb_t.sfcb002,
          sfcb003    LIKE sfcb_t.sfcb003,
          sfcb004    LIKE sfcb_t.sfcb004,
          sfcb020    LIKE sfcb_t.sfcb020,
          carry_qty  LIKE sfaa_t.sfaa012,
          sfcb013    LIKE sfcb_t.sfcb013,
          sfcb044    LIKE sfcb_t.sfcb044,
          sfcb045    LIKE sfcb_t.sfcb045,
          pmdl017    LIKE pmdl_t.pmdl017,
          pmdl015    LIKE pmdl_t.pmdl015,
          exrate     LIKE ooan_t.ooan005,
          pmdl011    LIKE pmdl_t.pmdl011,
          price      LIKE pmdn_t.pmdn015
                   END RECORD

TYPE type_g_sfcb_d2 RECORD
          sel              LIKE type_t.chr1,
          b_sfcbdocno      LIKE sfcb_t.sfcbdocno,
          b_sfcb001        LIKE sfcb_t.sfcb001,
          b_sfcb002        LIKE sfcb_t.sfcb002,
          b_sfaa003        LIKE sfaa_t.sfaa003,
          b_sfaa002        LIKE sfaa_t.sfaa002,
          b_sfaa002_desc   LIKE type_t.chr500,
          b_sfaa010        LIKE sfaa_t.sfaa010,
          b_sfaa010_desc1  LIKE imaal_t.imaal003,
          b_sfaa010_desc2  LIKE imaal_t.imaal004,
          b_sfcb003        LIKE sfcb_t.sfcb003,
          b_sfcb003_desc   LIKE type_t.chr500,
          b_sfcb004        LIKE sfcb_t.sfcb004,
          b_sfcb020        LIKE sfcb_t.sfcb020,
          b_sfcb020_desc   LIKE type_t.chr500,
          b_tot_qty        LIKE sfaa_t.sfaa012,
          b_carry_qty      LIKE sfaa_t.sfaa012,
          b_sfcb013        LIKE sfcb_t.sfcb013,
          b_sfcb013_desc   LIKE type_t.chr500,
          b_sfcb044        LIKE sfcb_t.sfcb044,
          b_sfcb045        LIKE sfcb_t.sfcb045,
          b_pmdl017        LIKE pmdl_t.pmdl017,
          b_pmdl017_desc   LIKE type_t.chr500,
          b_pmdl015        LIKE pmdl_t.pmdl015,
          b_pmdl015_desc   LIKE type_t.chr500,
          b_exrate         LIKE ooan_t.ooan005,
          b_pmdl011        LIKE pmdl_t.pmdl011,
          b_pmdl011_desc   LIKE type_t.chr500,
          b_price          LIKE pmdn_t.pmdn015
                   END RECORD

TYPE type_g_sfac_d RECORD
          sfacdocno  LIKE sfac_t.sfacdocno,
          sfac006    LIKE sfac_t.sfac006,
          carry_qty  LIKE sfac_t.sfac003
                   END RECORD

DEFINE g_arr1      DYNAMIC ARRAY OF RECORD
          sfcbdocno  LIKE sfcb_t.sfcbdocno,
          sfaa010    LIKE sfaa_t.sfaa010,
          sfcb001    LIKE sfcb_t.sfcb001,
          sfcb002    LIKE sfcb_t.sfcb002,
          sfcb003    LIKE sfcb_t.sfcb003,
          sfcb004    LIKE sfcb_t.sfcb004,
          sfcb020    LIKE sfcb_t.sfcb020,
          carry_qty  LIKE sfaa_t.sfaa012,
          sfcb013    LIKE sfcb_t.sfcb013,
          sfcb044    LIKE sfcb_t.sfcb044,
          sfcb045    LIKE sfcb_t.sfcb045,
          pmdl017    LIKE pmdl_t.pmdl017,
          pmdl015    LIKE pmdl_t.pmdl015,
          exrate     LIKE ooan_t.ooan005,
          pmdl011    LIKE pmdl_t.pmdl011,
          price      LIKE pmdn_t.pmdn015
                   END RECORD

DEFINE g_arr2      DYNAMIC ARRAY OF RECORD
          sfacdocno  LIKE sfac_t.sfacdocno,
          sfac006    LIKE sfac_t.sfac006,
          carry_qty  LIKE sfac_t.sfac003
                   END RECORD
                   
DEFINE g_pmal                DYNAMIC ARRAY OF RECORD
            b_sfcb013        LIKE pmdl_t.pmdl004,
            pmal002          LIKE pmal_t.pmal002
                             END RECORD
#170816-00007#31 -S add
DEFINE g_colname_1   STRING   
DEFINE g_comment_1   STRING       
DEFINE g_msg         STRING   #錯誤訊息
#170816-00007#31 -E add
DEFINE g_pmdldocno   LIKE pmdl_t.pmdldocno  #add by cz 20180612
#C20180906-07783--S--存放成功抛转mes的工单
DEFINE g_sfaadocno   DYNAMIC ARRAY OF RECORD
       wo_no         LIKE sfaa_t.sfaadocno
                     END RECORD
DEFINE g_cnt         LIKE type_t.num10
#C20180906-07783--E--存放成功抛转mes的工单                     
#end add-point
 
{</section>}
 
{<section id="s_aic_carry.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_aic_carry.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
# Memo...........:
# Usage..........: CALL s_aic_carry_get_ica(p_icab001,p_icab002)
# Input parameter: p_icab001   流程代碼
#                : p_icab002   站別
# Return code....: 
#                : 
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_ica(p_icab001,p_icab002)
   DEFINE p_icab001     LIKE icab_t.icab001  #流程代碼
   DEFINE p_icab002     LIKE icab_t.icab002  #站別

   WHENEVER ERROR CONTINUE

   INITIALIZE g_icaa.* TO NULL
   INITIALIZE g_icab.* TO NULL
   INITIALIZE g_icac.* TO NULL
   INITIALIZE g_icad.* TO NULL
   INITIALIZE g_icae.* TO NULL

   IF NOT cl_null(p_icab001) AND
      NOT cl_null(p_icab002) THEN

      SELECT *
        INTO g_icaa.*
        FROM icaa_t
       WHERE icaaent = g_enterprise
         AND icaa001 = p_icab001

      SELECT *
        INTO g_icab.*
        FROM icab_t
       WHERE icabent = g_enterprise
         AND icab001 = p_icab001
         AND icab002 = p_icab002
         
      SELECT *
        INTO g_icac.*
        FROM icac_t
       WHERE icacent = g_enterprise
         AND icac001 = p_icab001
         AND icac002 = p_icab002

      SELECT *
        INTO g_icad.*
        FROM icad_t
       WHERE icadent = g_enterprise
         AND icad001 = p_icab001
         AND icad002 = p_icab002

      SELECT *
        INTO g_icae.*
        FROM icae_t
       WHERE icaeent = g_enterprise
         AND icae001 = p_icab001
         AND icae002 = p_icab002

   END IF         
END FUNCTION

################################################################################
# Descriptions...: 將傳入之當站訂單單號,產生最終供應商一般採購單資料，並將採購單確認
# Memo...........: 請依照順序CALL
#                  CALL s_aic_carry_create_temp_table_order()
#                  CALL s_tax_recount_tmp()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_gen_last_po()
#                  CALL s_transaction_end(Y,0)
#                  CALL s_aic_carry_drop_temp_table_order()
# Usage..........: CALL s_aic_carry_gen_last_po(p_xmdadocno,p_pmdl052,p_date,p_icab001,p_icab002)
#                  RETURNING r_success,r_pmdldocno
# Input parameter: p_xmdadocno    #當站訂單單號
#                : p_pmdl052      #最終供應商代號
#                : p_date         #日期
#                : p_icab001      #當站流程代碼
#                : p_icab002      #站別
# Return code....: r_success      #執行結果
#                : r_pmdldocno    #產生之採購單單號
# Date & Author..: 141119 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_last_po(p_xmdadocno,p_pmdl052,p_date,p_icab001,p_icab002)
   DEFINE p_xmdadocno   LIKE xmda_t.xmdadocno   #當站訂單單號
   DEFINE p_pmdl052     LIKE pmdl_t.pmdl052     #最終供應商代號
   DEFINE p_date        LIKE xmda_t.xmdadocdt   #日期
   DEFINE p_icab001     LIKE icab_t.icab001     #當站流程代碼
   DEFINE p_icab002     LIKE icab_t.icab002     #站別
   DEFINE r_success     LIKE type_t.num5        #執行結果
   DEFINE r_pmdldocno   LIKE sfaa_t.sfaadocno   #產生之採購單單號

   DEFINE l_success     LIKE type_t.num5
   DEFINE l_pmal002     LIKE pmal_t.pmal002     #控制組編號
   DEFINE l_oofa001     LIKE oofa_t.oofa001     #170215-00007#1 add
   DEFINE l_xmda005     LIKE xmda_t.xmda005     #採購性質   #170105-00050#2-add
   DEFINE l_bgjob_bak   LIKE type_t.chr1        #Background job 備份  #171116-00011#1 add
   DEFINE l_site_bak    LIKE pmdl_t.pmdlsite    #g_site 備份          #171116-00011#1 add
   DEFINE l_prog_bak    LIKE type_t.chr20       #作業編號(gzzz001)備份 #171116-00011#1 add
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_pmdldocno = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_xmdadocno) OR
  #   cl_null(p_pmdl052) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdldocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_xmdadocno) THEN
      CALL s_azzi902_get_gzzd("aicp100","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1  #當站訂單單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_pmdl052) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("apmp490_03","lbl_pmdl052") RETURNING g_colname_1,g_comment_1  #最終供應商
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1  #流程編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1  #站別
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
      RETURN r_success,r_pmdldocno
   END IF
   #170816-00007#31 -E add

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #日期若為Null帶入g_today
   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF
   
   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
   CALL s_aic_carry_get_ica(p_icab001,p_icab002)

   #塞pmdl_t
   INITIALIZE g_pmdl.* TO NULL
   LET g_pmdl.pmdlsite = g_icab.icab003
   LET g_pmdl.pmdldocdt = p_date
   LET g_pmdl.pmdl001 = 0

   LET g_pmdl.pmdl004 = p_pmdl052    #最終供應商代號
   
   #170105-00050#2-s-add 從下面移上來的，多抓xmda005
   #SELECT訂單
   SELECT xmda005,xmda015,xmda031,
          xmda034,xmda025,xmda026,
          xmda020,xmda071
     INTO l_xmda005,g_pmdl.pmdl015,g_pmdl.pmdl031,
          g_pmdl.pmdl032,g_pmdl.pmdl025,g_pmdl.pmdl026,
          g_pmdl.pmdl020,g_pmdl.pmdl044
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmdadocno = p_xmdadocno
   #170105-00050#2-e-add
   
   #IF g_prog = 'apmt501' THEN   #140421---earl---add   #170301-00021#3 by 09263 --mark
   IF g_prog MATCHES 'apmt501*' THEN   #170301-00021#3 by 09263 --add
      LET g_pmdl.pmdl005 = '2'          #委外採購單
      LET g_pmdl.pmdl006 = '8'          #協作採購單
      LET g_pmdl.pmdl007 = '4'          #工單
      LET g_pmdl.pmdl008 = ''
   ELSE
      #LET g_pmdl.pmdl005 = '1'          #一般採購  #170105-00050#2-mark
      #170105-00050#2-s-add      
      IF l_xmda005 = '5' THEN
         LET g_pmdl.pmdl005 = '4'  #預先採購
      ELSE
         LET g_pmdl.pmdl005 = '1'  #一般採購
      END IF
      #170105-00050#2-e-add
      LET g_pmdl.pmdl006 = '1'          #一般交易 #170620-00041#1 mark #170718-00059#1 remark
      #LET g_pmdl.pmdl006 = '6'          #中間交易  #170620-00041#1 add #170718-00059#1 mark
      LET g_pmdl.pmdl007 = '9'          #多角拋轉
      LET g_pmdl.pmdl008 = p_xmdadocno  #來源單號
   END IF
   
   LET g_pmdl.pmdl017 = g_icaa.icaa006  #取價方式
   
   #161215-00009#1-mod-s
#   LET g_pmdl.pmdl019 = 'N'          #納入MPS/MRP計算
   LET g_pmdl.pmdl019 = 'Y'          #納入MPS/MRP計算
   #161215-00009#1-mod-e

   LET g_pmdl.pmdl021 = p_pmdl052    #付款供應商
   LET g_pmdl.pmdl022 = p_pmdl052    #送貨供應商

   LET g_pmdl.pmdl029 = g_dept
   LET g_pmdl.pmdl030 = 'Y'

   LET g_pmdl.pmdl047 = 'N'   #物流結案
   LET g_pmdl.pmdl048 = 'N'   #帳流結案
   LET g_pmdl.pmdl049 = 'N'   #金流結案
   LET g_pmdl.pmdl050 = 'N'   #多角最終站否
   LET g_pmdl.pmdl051 = p_icab001

   LET g_pmdl.pmdlownid = g_user
   LET g_pmdl.pmdlowndp = g_dept
   LET g_pmdl.pmdlcrtid = g_user
   LET g_pmdl.pmdlcrtdp = g_dept
   LET g_pmdl.pmdlcrtdt = cl_get_current()
   LET g_pmdl.pmdlstus = 'N'
   
   #170105-00050#2-s-mark 移到上面去
   ##SELECT訂單
   #SELECT xmda015,
   #       #xmda031,xmda034 #170620-00041#1 mark
   #       xmda031,xmda034,xmda025,xmda026,xmda020 #170620-00041#1 add
   #       ,xmda071         #170221-00029#2-add
   #  INTO g_pmdl.pmdl015,
   #       #g_pmdl.pmdl031,g_pmdl.pmdl032 #170620-00041#1 mark
   #       g_pmdl.pmdl031,g_pmdl.pmdl032,g_pmdl.pmdl025,g_pmdl.pmdl026,g_pmdl.pmdl020 #170620-00041#1 add
   #       ,g_pmdl.pmdl044  #170221-00029#2-add
   #  FROM xmda_t
   # WHERE xmdaent = g_enterprise
   #   AND xmdadocno = p_xmdadocno
   #170105-00050#2-e-mark
   
   #获取采购控制组编号
   CALL s_control_get_pmal002('4',g_user,g_dept,g_pmdl.pmdl004)
   RETURNING l_success,l_pmal002

   CALL s_apmm101_default_pmab('1',l_pmal002,g_pmdl.pmdlsite,g_pmdl.pmdl004) RETURNING g_pmab.*
   #慣用交易幣別(若無預設則延續來源)
   IF NOT cl_null(g_pmab.pmab033) THEN
      LET g_pmdl.pmdl015 = g_pmab.pmab033
   END IF
   #慣用交易稅別
   LET g_pmdl.pmdl011 = g_pmab.pmab034
   #慣用付款/收款條件
   LET g_pmdl.pmdl009 = g_pmab.pmab037
   #慣用採購/銷售通路
   LET g_pmdl.pmdl023 = g_pmab.pmab038
   #慣用採購/銷售分類
   LET g_pmdl.pmdl024 = g_pmab.pmab039
   #慣用交運方式
   #LET g_pmdl.pmdl020 = g_pmab.pmab040 #170620-00041#1 mark #改抓初始採購單的
   #慣用交運起點
   #g_pmab.pmab041
   #慣用交運終點
   #g_pmab.pmab042
   #慣用交易條件
   LET g_pmdl.pmdl010 = g_pmab.pmab053
   #慣用取價方式
   IF cl_null(g_pmdl.pmdl017) THEN
      LET g_pmdl.pmdl017 = g_pmab.pmab054
   END IF
   #慣用發票類型
   LET g_pmdl.pmdl033 = g_pmab.pmab056
   #內外購/銷
   LET g_pmdl.pmdl054 = g_pmab.pmab057
   #取匯率來源
   LET g_pmdl.pmdl055 = g_pmab.pmab058
   #負責採購/業務人員
   LET g_pmdl.pmdl002 = g_pmab.pmab031
   #負責採購/業務部門
   LET g_pmdl.pmdl003 = g_pmab.pmab059
   #慣用卸貨港
   #g_pmab.pmab043
   
   IF cl_null(g_pmdl.pmdl015) THEN     #170814-00011#1 add
      #--160428-00006#2--add--(S)
      #採購幣別icag008(若無預設則延續來源)
       CALL s_aic_carry_get_tri_pm(g_pmdl.pmdl051,g_pmdl.pmdlsite,g_pmdl.pmdldocdt)
       RETURNING r_success
       IF r_success AND NOT cl_null(g_icag.icag008 ) THEN
          LET g_pmdl.pmdl015 = g_icag.icag008
       END IF
      #--160428-00006#2--add--(E)   
   END IF         #170814-00011#1 add
   
   #必要欄位檢查
   IF g_pmab.prog = 'apmi110' THEN  #控制組預設
      IF cl_null(g_pmdl.pmdl011) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''
         LET g_errparam.code   = "aic-00134"   #控制組編號%1，供應商編號%2之慣用稅別為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
         
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl009) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00135"   #控制組編號%1，供應商編號%2之慣用付款條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF   

     #171130-00045#1 mark  --begin--
     #IF cl_null(g_pmdl.pmdl023) THEN
     #   INITIALIZE g_errparam TO NULL      
     #   LET g_errparam.extend = ''      
     #   LET g_errparam.code   = "aic-00136"   #控制組編號%1，供應商編號%2之慣用採購通路為空！
     #   LET g_errparam.popup  = TRUE
     #   LET g_errparam.replace[1] = l_pmal002
     #   LET g_errparam.replace[2] = g_pmdl.pmdl004
     #      
     #   CALL cl_err()
     #   LET r_success = FALSE
     #END IF
     #171130-00045#1 mark  --end--
     
      IF cl_null(g_pmdl.pmdl010) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00137"   #控制組編號%1，供應商編號%2之慣用交易條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl017) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00138"   #控制組編號%1，供應商編號%2之慣用取價方式為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      IF cl_null(g_pmdl.pmdl033) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00139"   #控制組編號%1，供應商編號%2之慣用發票類型為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl054) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00140"   #控制組編號%1，供應商編號%2之慣用內外購為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_pmdl.pmdl055) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00141"   #控制組編號%1，供應商編號%2之慣用匯率計算基準為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   ELSE   #供應商預設apmm202
      IF cl_null(g_pmdl.pmdl011) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00142"   #供應商編號%1之慣用交易稅別為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
         
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl009) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00143"   #供應商編號%1之慣用付款條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF   

      #161214-00046#1--mark--start--
      #IF cl_null(g_pmdl.pmdl023) THEN
      #   INITIALIZE g_errparam TO NULL
      #   LET g_errparam.extend = ''
      #   LET g_errparam.code   = "aic-00144"   #供應商編號%1之慣用採購通路為空！
      #   LET g_errparam.popup  = TRUE
      #   LET g_errparam.replace[1] = g_pmdl.pmdl004
      #      
      #   CALL cl_err()
      #   LET r_success = FALSE
      #END IF
      #161214-00046#1--mark--end----

      IF cl_null(g_pmdl.pmdl010) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00145"   #供應商編號%1之慣用交易條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl017) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code   = "aic-00146"   #供應商編號%1之慣用取價方式為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      IF cl_null(g_pmdl.pmdl033) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00147"   #供應商編號%1之慣用發票類型為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl054) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00148"   #供應商編號%1之慣用內外購為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_pmdl.pmdl055) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00149"   #供應商編號%1之慣用匯率計算基準為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF

   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #自動產生一般採購單號pmdldocno
   #IF g_prog = 'apmt501' THEN   #140421---earl---add   #170301-00021#3 by 09263 --mark
   IF g_prog MATCHES 'apmt501*' THEN   #170301-00021#3 by 09263 --add
      CALL s_aic_carry_docno(p_xmdadocno,g_pmdl.pmdlsite,g_icac.icac010,g_pmdl.pmdldocdt,'apmt501')
      RETURNING r_success,g_pmdl.pmdldocno
   ELSE
      CALL s_aic_carry_docno(p_xmdadocno,g_pmdl.pmdlsite,g_icac.icac010,g_pmdl.pmdldocdt,'apmt500')
      RETURNING r_success,g_pmdl.pmdldocno
   END IF
   
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   LET r_pmdldocno = g_pmdl.pmdldocno

   #取得稅率、含稅否
   CALL s_aic_carry_tax(g_pmdl.pmdlsite,g_pmdl.pmdl011)RETURNING r_success,g_pmdl.pmdl013,g_pmdl.pmdl012
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #取匯率
   CALL s_aic_carry_exchange(g_pmdl.pmdl054,g_pmdl.pmdlsite,g_pmdl.pmdldocdt,g_pmdl.pmdl015,'','2')
   RETURNING r_success,g_pmdl.pmdl016
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #抓取交易對象聯絡人明細檔的聯絡對像識別碼，若有設置多個聯絡人，則取有勾選主要聯絡人的那一個
   CALL s_aic_carry_get_contact(p_pmdl052) RETURNING r_success,g_pmdl.pmdl027
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF
   #170620-00041#1 --s mark
   ##170215-00007#1 add   --begin--
   ##抓取送货地址及账款地址
   ##取当前据点的联络对象识别码
   #LET l_oofa001 = ''
   #SELECT oofa001 INTO l_oofa001 FROM oofa_t WHERE oofaent = g_enterprise AND oofa002 = '1' AND oofa003 = g_pmdl.pmdlsite
   #IF NOT cl_null(l_oofa001) THEN
   #   #先抓主要送货地址,若抓不到则抓非主要的，都是只抓第一笔
   #   SELECT oofb019 INTO g_pmdl.pmdl025 FROM oofb_t WHERE oofbent = g_enterprise 
   #      AND oofb002 = l_oofa001 AND oofb008 = '3'
   #    ORDER BY oofb010 DESC,oofb019
   #   #先抓主要账款地址,若抓不到则抓非主要的，都是只抓第一笔
   #   SELECT oofb019 INTO g_pmdl.pmdl026 FROM oofb_t WHERE oofbent = g_enterprise 
   #      AND oofb002 = l_oofa001 AND oofb008 = '5'
   #    ORDER BY oofb010 DESC,oofb019   
   #END IF
   ##170215-00007#1 add   --end--
   #170620-00041#1 --e mark

   INSERT INTO pmdl_t (pmdlent,pmdlsite,pmdldocno,pmdldocdt,
                       pmdl001,pmdl002,pmdl003,pmdl004,pmdl005,
                       pmdl006,pmdl007,pmdl008,pmdl009,pmdl010,
                       pmdl011,pmdl012,pmdl013,pmdl015,
                       pmdl016,pmdl017,pmdl018,pmdl019,pmdl020,
                       pmdl021,pmdl022,pmdl023,pmdl024,pmdl025,
                       pmdl026,pmdl027,pmdl028,pmdl029,pmdl030,
                       pmdl031,pmdl032,pmdl033,
                       pmdl040,
                       pmdl041,pmdl042,pmdl043,pmdl044,
                       pmdl046,pmdl047,pmdl048,pmdl049,pmdl050,
                       pmdl051,pmdl052,pmdl053,pmdl054,pmdl055,
                       pmdlownid,pmdlowndp,
                       pmdlcrtid,pmdlcrtdp,pmdlcrtdt,
                       pmdlmodid,pmdlmoddt,
                       pmdlcnfid,pmdlcnfdt,
                       pmdlpstid,pmdlpstdt,
                       pmdlstus)
   VALUES(g_enterprise,g_pmdl.pmdlsite,g_pmdl.pmdldocno,g_pmdl.pmdldocdt,
          g_pmdl.pmdl001,g_pmdl.pmdl002,g_pmdl.pmdl003,g_pmdl.pmdl004,g_pmdl.pmdl005,
          g_pmdl.pmdl006,g_pmdl.pmdl007,g_pmdl.pmdl008,g_pmdl.pmdl009,g_pmdl.pmdl010,
          g_pmdl.pmdl011,g_pmdl.pmdl012,g_pmdl.pmdl013,g_pmdl.pmdl015,
          g_pmdl.pmdl016,g_pmdl.pmdl017,g_pmdl.pmdl018,g_pmdl.pmdl019,g_pmdl.pmdl020,
          g_pmdl.pmdl021,g_pmdl.pmdl022,g_pmdl.pmdl023,g_pmdl.pmdl024,g_pmdl.pmdl025,
          g_pmdl.pmdl026,g_pmdl.pmdl027,g_pmdl.pmdl028,g_pmdl.pmdl029,g_pmdl.pmdl030,
          g_pmdl.pmdl031,g_pmdl.pmdl032,g_pmdl.pmdl033,
          g_pmdl.pmdl040,
          g_pmdl.pmdl041,g_pmdl.pmdl042,g_pmdl.pmdl043,g_pmdl.pmdl044,
          g_pmdl.pmdl046,g_pmdl.pmdl047,g_pmdl.pmdl048,g_pmdl.pmdl049,g_pmdl.pmdl050,
          g_pmdl.pmdl051,g_pmdl.pmdl052,g_pmdl.pmdl053,g_pmdl.pmdl054,g_pmdl.pmdl055,
          g_pmdl.pmdlownid,g_pmdl.pmdlowndp,
          g_pmdl.pmdlcrtid,g_pmdl.pmdlcrtdp,g_pmdl.pmdlcrtdt,
          g_pmdl.pmdlmodid,g_pmdl.pmdlmoddt,
          g_pmdl.pmdlcnfid,g_pmdl.pmdlcnfdt,
          g_pmdl.pmdlpstid,g_pmdl.pmdlpstdt,
          g_pmdl.pmdlstus)
          
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:pmdl_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
   
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #INSERT 單身
   CALL s_aic_carry_body_po(p_xmdadocno,'2','','','') RETURNING r_success
   
   IF r_success THEN
      #回寫s_aic_carry_tri_po回推單價
      CALL s_aic_carry_update_price(g_pmdl.pmdl051,g_pmdl.pmdl031) RETURNING r_success
      IF NOT r_success THEN
         RETURN r_success,r_pmdldocno
      END IF
   END IF
   
   #170221-00029#2-s-add
   IF r_success THEN
      #寫入單頭/單身的備註
     #IF g_prog MATCHES 'apmt510*' THEN #170817-00043#5 mark
      IF g_pmdl.pmdl005 = '2' THEN      #170817-00043#5 add
         #委外採購
         CALL s_aic_carry_ins_ooff('apmt501',g_pmdl.pmdldocno,'axmt500',p_xmdadocno) RETURNING r_success
      ELSE
         CALL s_aic_carry_ins_ooff('apmt500',g_pmdl.pmdldocno,'axmt500',p_xmdadocno) RETURNING r_success
      END IF
   END IF
   #170221-00029#2-e-add
   
   IF r_success THEN   
      #採購單確認
      CALL s_aic_carry_pmdl_conf(g_pmdl.pmdldocno,g_pmdl.pmdlsite) RETURNING r_success
   END IF
   #171116-00011#1---add----str---
   IF r_success THEN
       LET l_site_bak = g_site
       LET g_site = g_pmdl.pmdlsite
       LET l_bgjob_bak = g_bgjob
       LET g_bgjob = 'Y'
       LET l_prog_bak = g_prog
       LET g_prog ='apmr500'
       IF cl_get_para(g_enterprise,g_site,'S-BAS-0050') = 'Y' THEN
           CALL s_apmt500_maillist('3',g_pmdl.pmdldocno)
           CALL apmr500_g01("pmdlent = "|| g_enterprise ||" AND pmdldocno = '"||g_pmdl.pmdldocno||"'",'','')
       END IF
       LET g_site = l_site_bak
       LET g_bgjob = l_bgjob_bak
       LET g_prog = l_prog_bak
   END IF
   #171116-00011#1---add----end---
   RETURN r_success,r_pmdldocno
END FUNCTION

################################################################################
# Descriptions...: 由到庫日回推出貨日、到廠日
# Memo...........:
# Usage..........: CALL s_aic_carry_get_time(p_site,p_pmdn001,p_pmdn014)
#                  RETURNING r_pmdn012,r_pmdn013
# Input parameter: p_site        #營運據點
#                : p_pmdn001     #料件編號
#                : p_pmdn014     #到庫日期
# Return code....: r_pmdn012     #出貨日期
#                : r_pmdn013     #到場日期
# Date & Author..: 141118 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_time(p_site,p_pmdn001,p_pmdn014)
   DEFINE p_site      LIKE icab_t.icabsite #營運據點
   DEFINE p_pmdn001   LIKE pmdn_t.pmdn001  #料件編號
   DEFINE p_pmdn014   LIKE pmdn_t.pmdn014  #到庫日期
   DEFINE r_pmdn012   LIKE pmdn_t.pmdn012  #出貨日期
   DEFINE r_pmdn013   LIKE pmdn_t.pmdn013  #到場日期
   
   DEFINE l_imaf173   LIKE imaf_t.imaf173  #採購到廠前置時間
   DEFINE l_imaf174   LIKE imaf_t.imaf174  #採購入庫前置時間
  
   WHENEVER ERROR CONTINUE

   LET r_pmdn012 = p_pmdn014
   LET r_pmdn013 = p_pmdn014

   IF cl_null(p_site) OR
      cl_null(p_pmdn001) OR
      cl_null(p_pmdn014) THEN
      RETURN r_pmdn012,r_pmdn013
   END IF

   LET l_imaf173  = ''
   LET l_imaf174  = ''
   SELECT imaf173,imaf174 INTO l_imaf173,l_imaf174
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = p_site
      AND imaf001 = p_pmdn001
      
   #由到庫日期自動計算到廠日期，公式為到庫日期-[T:料件據點進銷存檔].[C:到庫前置時間]
   IF (NOT cl_null(l_imaf174)) AND l_imaf174 <> 0 THEN
      CALL s_date_get_date(p_pmdn014,0,(l_imaf174*(-1))) RETURNING r_pmdn013
   ELSE
      LET r_pmdn013 = p_pmdn014
   END IF

   #由到庫日期自動計算出貨日期，公式為到廠日期-[T:料件據點進銷存檔].[C:到廠前置時間]
   IF (NOT cl_null(l_imaf173)) AND l_imaf173 <> 0 THEN
      CALL s_date_get_date(r_pmdn013,0,(l_imaf173*(-1))) RETURNING r_pmdn012
   ELSE
      LET r_pmdn012 = r_pmdn013
   END IF

   RETURN r_pmdn012,r_pmdn013      
END FUNCTION

################################################################################
# Descriptions...: #CREATE TEMP TABLE 採購單
# Memo...........:
# Usage..........: CALL s_aic_carry_create_temp_table_order()
#                  RETURNING r_success
# Input parameter: 
#                : 
# Return code....: r_success   執行結果
#                : 
# Date & Author..: 141117 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_create_temp_table_order()
   DEFINE r_success     LIKE type_t.num5        #執行結果

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   #DROP TEMP TABLE
   CALL s_aic_carry_drop_temp_table_order()
   
   CALL s_aic_carry_crt_tmp_table_order_new() RETURNING r_success   #170206-00013#1 add
   RETURN r_success   #170206-00013#1 add      

   #170206-00013#1-(S)-mark
   #LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_pmdn_temp AS ",
   #            "SELECT * FROM pmdn_t "
   #PREPARE s_aic_carry_pmdn_temp FROM g_sql
   #EXECUTE s_aic_carry_pmdn_temp
   #FREE s_aic_carry_pmdn_temp
   #
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.extend = "CREATE:s_aic_carry_pmdn_temp"
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()
   #   
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #
   #LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_pmdo_temp AS ",
   #            "SELECT * FROM pmdo_t "
   #PREPARE s_aic_carry_pmdo_temp FROM g_sql
   #EXECUTE s_aic_carry_pmdo_temp
   #FREE s_aic_carry_pmdo_temp
   #
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.extend = "CREATE:s_aic_carry_pmdo_temp"
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()
   #   
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #
   #LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_pmdp_temp AS ",
   #            "SELECT * FROM pmdp_t "
   #PREPARE s_aic_carry_pmdp_temp FROM g_sql
   #EXECUTE s_aic_carry_pmdp_temp
   #FREE s_aic_carry_pmdp_temp
   #
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.extend = "CREATE:s_aic_carry_pmdp_temp"
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()
   #
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #
   #LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_pmdq_temp AS ",
   #            "SELECT * FROM pmdq_t "
   #PREPARE s_aic_carry_pmdq_temp FROM g_sql
   #EXECUTE s_aic_carry_pmdq_temp
   #FREE s_aic_carry_pmdq_temp
   #
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.extend = "CREATE:s_aic_carry_pmdq_temp"
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()
   #
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #
   #RETURN r_success
   #170206-00013#1-(E)-mark
END FUNCTION

################################################################################
# Descriptions...: DROP TEMP TABLE  採購單
# Memo...........:
# Usage..........: CALL s_aic_carry_drop_temp_table_order()
#                  
# Input parameter: 
#                : 
# Return code....: 
#                : 
# Date & Author..: 141117 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_drop_temp_table_order()
   WHENEVER ERROR CONTINUE
   #刪除TEMP TABLE
   #170206-00013#1-(S)-mark
   #DROP TABLE s_aic_carry_pmdn_temp
   #DROP TABLE s_aic_carry_pmdo_temp
   #DROP TABLE s_aic_carry_pmdp_temp
   #DROP TABLE s_aic_carry_pmdq_temp
   #170206-00013#1-(E)-mark
   
   #170206-00013#1-(S)-add
   DROP TABLE s_aic_pmdn_temp
   DROP TABLE s_aic_pmdo_temp
   DROP TABLE s_aic_pmdp_temp
   DROP TABLE s_aic_pmdq_temp
   #170206-00013#1-(E)-add
END FUNCTION

################################################################################
# Descriptions...: 將傳入值當站訂單單號,產生多角採購單資料，並將採購單確認
# Memo...........: 請依照順序CALL
#                  CALL s_aic_carry_create_temp_table_order()
#                  CALL s_tax_recount_tmp()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_gen_tri_po()
#                  CALL s_transaction_end(Y,0)
#                  CALL s_aic_carry_drop_temp_table_order()
# Usage..........: CALL s_aic_carry_gen_tri_po(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_date,p_icab001,p_icab002)
#                  RETURNING r_success,r_pmdldocno
# Input parameter: p_firstpmdldocno   #初始採購單號(若為Null表示由"初始訂單"發起)
#                : p_firstxmdadocno   #初始訂單單號(若為Null表示由"初始採購單"發起)
#                : p_xmdadocno        #當站訂單單號
#                : p_nextsite         #下站營運據點
#                : p_final            #最終站否
#                : p_date             #日期
#                : p_icab001          #流程代碼
#                : p_icab002          #站別
# Return code....: r_success          #執行結果
#                : r_pmdldocno        #產生之採購單單號
# Date & Author..: 141118 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_po(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_date,p_icab001,p_icab002)
   DEFINE p_firstpmdldocno  LIKE pmdl_t.pmdldocno   #初始採購單號
   DEFINE p_firstxmdadocno  LIKE xmda_t.xmdadocno   #初始訂單單號
   DEFINE p_xmdadocno       LIKE xmda_t.xmdadocno   #當站訂單單號
   DEFINE p_nextsite        LIKE icab_t.icabsite    #下站營運據點
   DEFINE p_final           LIKE type_t.chr1        #最終站否
   DEFINE p_date            LIKE xmda_t.xmdadocdt   #日期
   DEFINE p_icab001         LIKE icab_t.icab001     #流程代碼
   DEFINE p_icab002         LIKE icab_t.icab002     #站別

   DEFINE r_success         LIKE type_t.num5        #執行結果
   DEFINE r_pmdldocno       LIKE sfaa_t.sfaadocno   #產生之採購單單號
                           
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_pmal002         LIKE pmal_t.pmal002     #控制組編號
   DEFINE l_oofa001         LIKE oofa_t.oofa001     #170215-00007#1 add
   DEFINE l_xmda005         LIKE xmda_t.xmda005     #訂單性質  170105-00050-add
   DEFINE l_cnt             LIKE type_t.num10       #170618-00330#1 add  
   #170620-00041#1 add --s add   
   DEFINE l_site            LIKE icab_t.icabsite    
   DEFINE l_max_icab002     LIKE icab_t.icab002     #最大站別
   #170620-00041#1 add --e add
   WHENEVER ERROR CONTINUE   
   
   LET r_success = TRUE
   LET r_pmdldocno = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_xmdadocno) OR
  #   cl_null(p_nextsite) OR
  #   cl_null(p_final) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_gen_tri_po"
  #   LET g_errparam.code   = "sub-268"     #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdldocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_xmdadocno) THEN
      CALL s_azzi902_get_gzzd("aicp100","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1   #當站訂單單號 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_nextsite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icacsite") RETURNING g_colname_1,g_comment_1   #下站營運據點
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_final) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01473",g_dlang)   #最終站否
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF  
   END IF      
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程代碼
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1   #站別
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
      RETURN r_success,r_pmdldocno
   END IF
  #170816-00007#31 -E add

   IF cl_null(p_firstpmdldocno) = cl_null(p_firstxmdadocno) THEN   #兩者不會同時存在或同時為Null

  #170816-00007#31 -S mark
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_gen_tri_po"
  #   LET g_errparam.code   = "sub-268"     #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdldocno
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
      LET g_msg = ''
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      IF cl_null(p_firstpmdldocno) THEN
         CALL s_azzi902_get_gzzd("aicr210","lbl_pmdldocno") RETURNING g_colname_1,g_comment_1   #初始採購單號
         LET g_msg = g_colname_1   
      END IF
      IF cl_null(p_firstxmdadocno) THEN
         LET g_colname_1 = ''
         LET g_comment_1 = ''   
         CALL s_azzi902_get_gzzd("aicr200","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1   #初始訂單單號
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
         RETURN r_success,r_pmdldocno
      END IF
   #170816-00007#31 -E add
   
   END IF

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #日期若為Null帶入g_today
   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF

   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
   CALL s_aic_carry_get_ica(p_icab001,p_icab002)
   #塞pmdl_t
   INITIALIZE g_pmdl.* TO NULL
   LET g_pmdl.pmdlsite = g_icab.icab003
   LET g_pmdl.pmdldocdt = p_date
   LET g_pmdl.pmdl001 = 0
   
   #170105-00050#2-s-add  從下面移上來的，多抓xmda005
   #訂單
   SELECT xmda005,xmda015,xmda031,
          xmda034,xmda025,xmda026,
          xmda020,xmda071
     INTO l_xmda005,g_pmdl.pmdl015,g_pmdl.pmdl031,
          g_pmdl.pmdl032,g_pmdl.pmdl025,g_pmdl.pmdl026,
          g_pmdl.pmdl020,g_pmdl.pmdl044
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmdadocno = p_xmdadocno
   #170105-00050#2-e-add

   #IF g_prog = 'apmt501' THEN   #140421---earl---add   #170301-00021#3 by 09263 --mark
   IF g_prog MATCHES 'apmt501*' THEN   #170301-00021#3 by 09263 --add
      LET g_pmdl.pmdl005 = '2'     #委外採購單
      LET g_pmdl.pmdl006 = '6'     #中間交易
      LET g_pmdl.pmdl007 = '4'     #工單
      #LET g_pmdl.pmdl008 = ''     #160523-00018#1 mark
      #170618-00330#1 --s add
      SELECT COUNT(1) INTO l_cnt
        FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaa006 = p_xmdadocno 
         AND sfaastus <> 'X'
      IF l_cnt = 1 THEN
      #170618-00330#1 --e add
         #一(asft300)對一(asft300)，來源單號(pmdl008)為工單單號
         #160523-00018#1-s-add
         SELECT sfaadocno INTO g_pmdl.pmdl008 
           FROM sfaa_t
          WHERE sfaaent = g_enterprise
            AND sfaa006 = p_xmdadocno 
            AND sfaastus <> 'X'
         #160523-00018#1-e-add
      #170618-00330#1 --s add
      ELSE
         #多(asft300)對一(apmt501)，來源單號(pmdl008)為空
         LET g_pmdl.pmdl008 = ''
      END IF
      #170618-00330#1 --e add
   ELSE
      #LET g_pmdl.pmdl005 = '1'          #一般採購 #170105-00050#2-mark
      #170105-00050#2-s-add
      IF l_xmda005 = '5' THEN
         LET g_pmdl.pmdl005 = '4'  #預先採購
      ELSE
         LET g_pmdl.pmdl005 = '1'  #一般採購
      END IF
      #170105-00050#2-e-add
      LET g_pmdl.pmdl006 = '6'          #中間交易
      LET g_pmdl.pmdl007 = '9'          #多角拋轉
      LET g_pmdl.pmdl008 = p_xmdadocno  #來源單號
   END IF

   LET g_pmdl.pmdl009 = g_icae.icae010   #付款條件
   LET g_pmdl.pmdl010 = g_icae.icae015   #交易條件
   LET g_pmdl.pmdl011 = g_icae.icae012   #稅別

   #161215-00009#1-mod-s
#   LET g_pmdl.pmdl019 = 'N'          #納入MPS/MRP計算
   LET g_pmdl.pmdl019 = 'Y'          #納入MPS/MRP計算
   #161215-00009#1-mod-e

   LET g_pmdl.pmdl024 = g_icad.icad011   #採購分類

   LET g_pmdl.pmdl029 = g_dept
   LET g_pmdl.pmdl030 = 'Y'

   LET g_pmdl.pmdl047 = 'N'  #物流結案
   LET g_pmdl.pmdl048 = 'N'  #帳流結案
   LET g_pmdl.pmdl049 = 'N'  #金流結案
   LET g_pmdl.pmdl050 = p_final
   LET g_pmdl.pmdl051 = p_icab001

   LET g_pmdl.pmdlownid = g_user
   LET g_pmdl.pmdlowndp = g_dept
   LET g_pmdl.pmdlcrtid = g_user
   LET g_pmdl.pmdlcrtdp = g_dept
   LET g_pmdl.pmdlcrtdt = cl_get_current()
   LET g_pmdl.pmdlstus = 'N'
   
   #170620-00041#1 --s add
   IF g_icaa.icaa003 = '3' THEN
      #3. 代採買指定供應商
      #收貨客戶↓↓
      #供應商直接是最初採購單的最終供應商
      SELECT pmdl052 INTO g_pmdl.pmdl022
        FROM pmdl_t
       WHERE pmdlent = g_enterprise
         AND pmdldocno = p_firstpmdldocno
      #收貨客戶↑↑
      #下單客戶/付款客戶↓↓
      SELECT MAX(icab002) INTO l_max_icab002 
        FROM icab_t
       WHERE icabent = g_enterprise AND icab001 = p_icab001
      IF p_icab002 = l_max_icab002 THEN
         #最後一站供應商直接是最初採購單的最終供應商
         LET g_pmdl.pmdl004 = g_pmdl.pmdl022
      ELSE
         #前面都抓取下一站
         CALL s_aic_carry_get_ooef024(p_nextsite)
         RETURNING r_success,g_pmdl.pmdl004
         IF NOT r_success THEN
            RETURN r_success,r_pmdldocno
         END IF
      END IF
      #下單客戶/付款客戶↑↑
   ELSE
      #1. 多角銷售 #2. 代採買
      #下單客戶/付款客戶↓↓
      #傳入值指定營運據點之據點對應客戶/廠商編號
      CALL s_aic_carry_get_ooef024(p_nextsite)
      RETURNING r_success,g_pmdl.pmdl004
      IF NOT r_success THEN
         RETURN r_success,r_pmdldocno
      END IF
      #下單客戶/付款客戶↑↑
      #收貨客戶↓↓
      #抓取最終站
      LET l_site = ''
      SELECT icab003 INTO l_site 
        FROM icab_t
       WHERE icabent = g_enterprise AND icab001 = p_icab001
         AND icab002 = ( SELECT MAX(icab002) FROM icab_t
                          WHERE icabent = g_enterprise AND icab001 = p_icab001
                       )
      #傳入值指定營運據點之據點對應客戶/廠商編號
      CALL s_aic_carry_get_ooef024(l_site)
      RETURNING r_success,g_pmdl.pmdl022
      IF NOT r_success THEN
         RETURN r_success,r_pmdldocno
      END IF
      #收貨客戶↑↑
   END IF
   LET g_pmdl.pmdl021 = g_pmdl.pmdl004  #付款供應商
   #170620-00041#1 --e add
   #170620-00041#1 --s mark
   ##傳入值"下站營運據點"之"據點對應客戶/廠商編號"
   #CALL s_aic_carry_get_ooef024(p_nextsite)
   #RETURNING r_success,g_pmdl.pmdl004
   #IF NOT r_success THEN
   #   RETURN r_success,r_pmdldocno
   #END IF
   #LET g_pmdl.pmdl021 = g_pmdl.pmdl004  #付款供應商
   #LET g_pmdl.pmdl022 = g_pmdl.pmdl004  #送貨供應商
   #170620-00041#1 --e mark

   #IF g_prog = 'apmt501' THEN   #140421---earl---add   #170301-00021#3 by 09263 --mark
   IF g_prog MATCHES 'apmt501*' THEN   #170301-00021#3 by 09263 --add
      LET g_pmdl.pmdl052 = g_pmdl.pmdl004  #最終供應商
   END IF

   #170105-00050#2-s-mark  移到上面去
   ##訂單
   ##170620-00041#1 --s mark
   ##SELECT xmda015,
   ##       xmda031,xmda034
   ##  INTO g_pmdl.pmdl015,
   ##       g_pmdl.pmdl031,g_pmdl.pmdl032
   ##170620-00041#1 --e amrk
   ##170620-00041#1 --s add
   #SELECT xmda015,
   #       xmda031,xmda034,xmda025,xmda026,xmda020
   #       ,xmda071        #170221-00029#2-add
   #  INTO g_pmdl.pmdl015,
   #       g_pmdl.pmdl031,g_pmdl.pmdl032,g_pmdl.pmdl025,g_pmdl.pmdl026,g_pmdl.pmdl020
   #       ,g_pmdl.pmdl044 #170221-00029#2-add
   ##170620-00041#1 --e add
   #  FROM xmda_t
   # WHERE xmdaent = g_enterprise
   #   AND xmdadocno = p_xmdadocno
   #170105-00050#2-e-mark
   
  #發票類型取當站營運據點的icae021    #161216-00005#1 014 mod 021 取下一站mod當站          
  #SELECT icae014 INTO g_pmdl.pmdl033             #161216-00005#1 mark
   SELECT icae021 INTO g_pmdl.pmdl033             #161216-00005#1 add
     FROM icab_t,icae_t
    WHERE icabent = icaeent AND icaeent = g_enterprise
      AND icab001 = icae001 AND icae001 = p_icab001
      AND icab002 = icae002
  #   AND icab003 = p_nextsite          #161216-00005#1 mark
      AND icab003 = g_icab.icab003      #161216-00005#1 add

   #获取采购控制组编号
   CALL s_control_get_pmal002('4',g_user,g_dept,g_pmdl.pmdl004)
   RETURNING l_success,l_pmal002

   CALL s_apmm101_default_pmab('1',l_pmal002,g_pmdl.pmdlsite,g_pmdl.pmdl004) RETURNING g_pmab.*
   
   #慣用交易幣別(改抓來源訂單)
   #LET g_pmdl.pmdl015 = g_pmab.pmab033
   #慣用交易稅別(改抓icae012)
   #LET g_pmdl.pmdl011 = g_pmab.pmab034
   #慣用付款/收款條件(改抓icae010)
   #LET g_pmdl.pmdl009 = g_pmab.pmab037
   #慣用採購/銷售通路
   LET g_pmdl.pmdl023 = g_pmab.pmab038
   #慣用採購/銷售分類(改抓icad011)
   #LET g_pmdl.pmdl024 = g_pmab.pmab039
   #慣用交運方式
   #LET g_pmdl.pmdl020 = g_pmab.pmab040 #170620-00041#1 mark #改抓初始採購單的
   #慣用交運起點
   #g_pmab.pmab041,
   #慣用交運終點
   #g_pmab.pmab042,
   #慣用交易條件(改抓icae015)
   #LET g_pmdl.pmdl010 = g_pmab.pmab053
   #慣用取價方式
   LET g_pmdl.pmdl017 = g_pmab.pmab054
   #慣用發票類型(改抓下站營運據點的icae014)
   #LET g_pmdl.pmdl033 = g_pmab.pmab056
   #內外購/銷
   LET g_pmdl.pmdl054 = g_pmab.pmab057
   #取匯率來源
   LET g_pmdl.pmdl055 = g_pmab.pmab058
   #負責採購/業務人員
   LET g_pmdl.pmdl002 = g_pmab.pmab031
   #負責採購/業務部門
   LET g_pmdl.pmdl003 = g_pmab.pmab059
   #慣用卸貨港
   #g_pmab.pmab043

   #--160428-00006#2--add--(S)
   #採購幣別icag008(若無預設則延續來源)
    CALL s_aic_carry_get_tri_pm(g_pmdl.pmdl051,g_pmdl.pmdlsite,g_pmdl.pmdldocdt)
    RETURNING r_success
    IF r_success AND NOT cl_null(g_icag.icag008 ) THEN
       LET g_pmdl.pmdl015 = g_icag.icag008
    END IF
   #--160428-00006#2--add--(E)


   #必要欄位檢查
   IF g_pmab.prog = 'apmi110' THEN  #控制組預設
     #171130-00045#1 mark  --begin--
     #IF cl_null(g_pmdl.pmdl023) THEN
     #   INITIALIZE g_errparam TO NULL      
     #   LET g_errparam.extend = ''      
     #   LET g_errparam.code   = "aic-00136"   #控制組編號%1，供應商編號%2之慣用採購通路為空！
     #   LET g_errparam.popup  = TRUE
     #   LET g_errparam.replace[1] = l_pmal002
     #   LET g_errparam.replace[2] = g_pmdl.pmdl004
     #      
     #   CALL cl_err()
     #   LET r_success = FALSE
     #END IF
     #171130-00045#1 mark  --end--
      IF cl_null(g_pmdl.pmdl017) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00138"   #控制組編號%1，供應商編號%2之慣用取價方式為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl054) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00140"   #控制組編號%1，供應商編號%2之慣用內外購為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_pmdl.pmdl055) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00141"   #控制組編號%1，供應商編號%2之慣用匯率計算基準為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   ELSE   #供應商預設apmm202
      #161214-00046#1--mark--start--
      #IF cl_null(g_pmdl.pmdl023) THEN
      #   INITIALIZE g_errparam TO NULL
      #   LET g_errparam.extend = ''
      #   LET g_errparam.code   = "aic-00144"   #供應商編號%1之慣用採購通路為空！
      #   LET g_errparam.popup  = TRUE
      #   LET g_errparam.replace[1] = g_pmdl.pmdl004
      #      
      #   CALL cl_err()
      #   LET r_success = FALSE
      #END IF
      #161214-00046#1--mark--end----
      IF cl_null(g_pmdl.pmdl017) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code   = "aic-00146"   #供應商編號%1之慣用取價方式為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_pmdl.pmdl054) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00148"   #供應商編號%1之慣用內外購為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_pmdl.pmdl055) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00149"   #供應商編號%1之慣用匯率計算基準為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_pmdl.pmdl004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF

   IF cl_null(g_pmdl.pmdl011) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''
      LET g_errparam.code   = "aic-00150"   #流程代碼%1站別%2之採購稅別為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
         
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF cl_null(g_pmdl.pmdl009) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''      
      LET g_errparam.code   = "aic-00151"   #流程代碼%1站別%2之付款條件為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF cl_null(g_pmdl.pmdl010) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''      
      LET g_errparam.code   = "aic-00152"   #流程代碼%1站別%2之採購單交易條件為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF cl_null(g_pmdl.pmdl033) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''      
#      LET g_errparam.code   = "aic-00153"   #流程代碼%1站別%2之訂單發票類型為空！ 161227-00009 mark
      LET g_errparam.code   = "aic-00245"    #161227-00009 add
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #自動產生採購單號pmdldocno
   IF NOT cl_null(g_icac.icac010) THEN
      #IF g_prog = 'apmt501' THEN   #140421---earl---add   #170301-00021#3 by 09263 --mark
      IF g_prog MATCHES 'apmt501*' THEN   #170301-00021#3 by 09263 --add
         CALL s_aic_carry_docno(p_xmdadocno,g_pmdl.pmdlsite,g_icac.icac010,p_date,'apmt501')
         RETURNING r_success,g_pmdl.pmdldocno
      ELSE
         CALL s_aic_carry_docno(p_xmdadocno,g_pmdl.pmdlsite,g_icac.icac010,p_date,'apmt500')
         RETURNING r_success,g_pmdl.pmdldocno
      END IF
   ELSE
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''      
      LET g_errparam.code   = "aic-00166"   #流程代碼%1站別%2之採購單單別為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   LET r_pmdldocno = g_pmdl.pmdldocno

   #取得稅率、含稅否
   CALL s_aic_carry_tax(g_pmdl.pmdlsite,g_pmdl.pmdl011) RETURNING r_success,g_pmdl.pmdl013,g_pmdl.pmdl012
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #取匯率
   CALL s_aic_carry_exchange(g_pmdl.pmdl054,g_pmdl.pmdlsite,g_pmdl.pmdldocdt,g_pmdl.pmdl015,'','2')
   RETURNING r_success,g_pmdl.pmdl016
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #抓取交易對象聯絡人明細檔的聯絡對像識別碼，若有設置多個聯絡人，則取有勾選主要聯絡人的那一個
   CALL s_aic_carry_get_contact(g_pmdl.pmdl004) RETURNING r_success,g_pmdl.pmdl027
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF
   
   #170620-00041#1 --s mark
   ##170215-00007#1 add   --begin--
   ##抓取送货地址及账款地址
   ##取当前据点的联络对象识别码
   #LET l_oofa001 = ''
   #SELECT oofa001 INTO l_oofa001 FROM oofa_t WHERE oofaent = g_enterprise AND oofa002 = '1' AND oofa003 = g_pmdl.pmdlsite
   #IF NOT cl_null(l_oofa001) THEN
   #   #先抓主要送货地址,若抓不到则抓非主要的，都是只抓第一笔
   #   SELECT oofb019 INTO g_pmdl.pmdl025 FROM oofb_t WHERE oofbent = g_enterprise 
   #      AND oofb002 = l_oofa001 AND oofb008 = '3'
   #    ORDER BY oofb010 DESC,oofb019
   #   #先抓主要账款地址,若抓不到则抓非主要的，都是只抓第一笔
   #   SELECT oofb019 INTO g_pmdl.pmdl026 FROM oofb_t WHERE oofbent = g_enterprise 
   #      AND oofb002 = l_oofa001 AND oofb008 = '5'
   #    ORDER BY oofb010 DESC,oofb019   
   #END IF
   ##170215-00007#1 add   --end-- 
   #170620-00041#1 --e mark

   INSERT INTO pmdl_t (pmdlent,pmdlsite,pmdldocno,pmdldocdt,
                       pmdl001,pmdl002,pmdl003,pmdl004,pmdl005,
                       pmdl006,pmdl007,pmdl008,pmdl009,pmdl010,
                       pmdl011,pmdl012,pmdl013,pmdl015,
                       pmdl016,pmdl017,pmdl018,pmdl019,pmdl020,
                       pmdl021,pmdl022,pmdl023,pmdl024,pmdl025,
                       pmdl026,pmdl027,pmdl028,pmdl029,pmdl030,
                       pmdl031,pmdl032,pmdl033,
                       pmdl040,
                       pmdl041,pmdl042,pmdl043,pmdl044,
                       pmdl046,pmdl047,pmdl048,pmdl049,pmdl050,
                       pmdl051,pmdl052,pmdl053,pmdl054,pmdl055,
                       pmdlownid,pmdlowndp,
                       pmdlcrtid,pmdlcrtdp,pmdlcrtdt,
                       pmdlmodid,pmdlmoddt,
                       pmdlcnfid,pmdlcnfdt,
                       pmdlpstid,pmdlpstdt,
                       pmdlstus)
   VALUES(g_enterprise,g_pmdl.pmdlsite,g_pmdl.pmdldocno,g_pmdl.pmdldocdt,
          g_pmdl.pmdl001,g_pmdl.pmdl002,g_pmdl.pmdl003,g_pmdl.pmdl004,g_pmdl.pmdl005,
          g_pmdl.pmdl006,g_pmdl.pmdl007,g_pmdl.pmdl008,g_pmdl.pmdl009,g_pmdl.pmdl010,
          g_pmdl.pmdl011,g_pmdl.pmdl012,g_pmdl.pmdl013,g_pmdl.pmdl015,
          g_pmdl.pmdl016,g_pmdl.pmdl017,g_pmdl.pmdl018,g_pmdl.pmdl019,g_pmdl.pmdl020,
          g_pmdl.pmdl021,g_pmdl.pmdl022,g_pmdl.pmdl023,g_pmdl.pmdl024,g_pmdl.pmdl025,
          g_pmdl.pmdl026,g_pmdl.pmdl027,g_pmdl.pmdl028,g_pmdl.pmdl029,g_pmdl.pmdl030,
          g_pmdl.pmdl031,g_pmdl.pmdl032,g_pmdl.pmdl033,
          g_pmdl.pmdl040,
          g_pmdl.pmdl041,g_pmdl.pmdl042,g_pmdl.pmdl043,g_pmdl.pmdl044,
          g_pmdl.pmdl046,g_pmdl.pmdl047,g_pmdl.pmdl048,g_pmdl.pmdl049,g_pmdl.pmdl050,
          g_pmdl.pmdl051,g_pmdl.pmdl052,g_pmdl.pmdl053,g_pmdl.pmdl054,g_pmdl.pmdl055,
          g_pmdl.pmdlownid,g_pmdl.pmdlowndp,
          g_pmdl.pmdlcrtid,g_pmdl.pmdlcrtdp,g_pmdl.pmdlcrtdt,
          g_pmdl.pmdlmodid,g_pmdl.pmdlmoddt,
          g_pmdl.pmdlcnfid,g_pmdl.pmdlcnfdt,
          g_pmdl.pmdlpstid,g_pmdl.pmdlpstdt,
          g_pmdl.pmdlstus)
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:pmdl_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF
   
   #INSERT 單身
   CALL s_aic_carry_body_po(p_xmdadocno,'1',p_firstpmdldocno,p_firstxmdadocno,p_nextsite) RETURNING r_success

   #170221-00029#2-s-add
   IF r_success THEN
      #寫入單頭/單身的備註
     #IF g_prog MATCHES 'apmt501*' THEN #170817-00043#5 mark
      IF g_pmdl.pmdl005 = '2' THEN      #170817-00043#5 add
         #委外採購
         CALL s_aic_carry_ins_ooff('apmt501',g_pmdl.pmdldocno,'axmt500',p_xmdadocno) RETURNING r_success
      ELSE
         CALL s_aic_carry_ins_ooff('apmt500',g_pmdl.pmdldocno,'axmt500',p_xmdadocno) RETURNING r_success
      END IF
   END IF
   #170221-00029#2-e-add
   
   IF r_success THEN
      #採購單確認
      CALL s_aic_carry_pmdl_conf(g_pmdl.pmdldocno,g_pmdl.pmdlsite) RETURNING r_success
   END IF

   RETURN r_success,r_pmdldocno      
END FUNCTION

################################################################################
# Descriptions...: 取得icag_t(計價方式、計價基準、採購幣別、計價比率)
# Memo...........:
# Usage..........: CALL s_aic_carry_get_tri_pm(p_icag001,p_icag004,p_icag002)
#                  RETURNING r_success,r_icag005,r_icag006,r_icag008,r_icag007
# Input parameter: p_icag001      #多角流程代碼
#                : p_icag004      #營運據點
#                : p_icag002      #日期
# Return code....: r_success      #執行結果
# Date & Author..: 141118 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_tri_pm(p_icag001,p_icag004,p_icag002)
   DEFINE p_icag001   LIKE icag_t.icag001    #多角流程代碼
   DEFINE p_icag004   LIKE icag_t.icag004    #營運據點
   DEFINE p_icag002   LIKE icag_t.icag002    #日期
   DEFINE r_success   LIKE type_t.num5       #執行結果
   DEFINE l_num       LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET g_sql = "SELECT icagsite,",
               "       icag001,icag002,icag003,icag004,icag005,",
               "       icag006,icag007,icag008",
               "  FROM icag_t",
               " WHERE icagent = ",g_enterprise,
               "   AND icag001 = ?",
               "   AND icag002 <= '",p_icag002,"'",
               "   AND icag004 = ?"
  #            " ORDER BY icag002 DESC"     #160428-00006#4 mark
  #160428-00006#4-s-add
   #IF g_prog = 'aicp950' THEN   #170301-00021#3 by 09263 --mark
   IF g_prog MATCHES 'aicp950*' THEN   #170301-00021#3 by 09263 --add
      #3:依最終供應商逆推 4:依下游供應商單價逆推
      LET g_sql = g_sql," AND icag006 IN ('3','4') "     
   END IF
   LET g_sql = g_sql," ORDER BY icag002 DESC"
  #160428-00006#4-e-add               
               
   PREPARE s_aic_carry_icag_pre FROM g_sql
   DECLARE s_aic_carry_icag_cs CURSOR FOR s_aic_carry_icag_pre

   LET r_success = TRUE
   INITIALIZE g_icag.* TO NULL
   
   CALL s_aic_carry_pm(p_icag001,p_icag004) RETURNING r_success,l_num

   IF r_success AND l_num = 0 AND p_icag001 <> 'ALL' THEN
      CALL s_aic_carry_pm('ALL',p_icag004) RETURNING r_success,l_num
   END IF

   IF r_success AND l_num = 0 AND p_icag004 <> 'ALL' THEN
      CALL s_aic_carry_pm('ALL','ALL') RETURNING r_success,l_num
   END IF

   IF r_success AND l_num = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "aic-00020"   #多角流程取價方式未設定
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET r_success = FALSE
   END IF

   RETURN r_success
END FUNCTION

#由s_aic_carry_get_tri_pm呼叫
PUBLIC FUNCTION s_aic_carry_pm(p_icag001,p_icag004)
   DEFINE p_icag001   LIKE icag_t.icag001    #多角流程代碼
   DEFINE p_icag004   LIKE icag_t.icag004    #營運據點
   DEFINE r_success   LIKE type_t.num5       #執行結果
   DEFINE r_num       LIKE type_t.num5       #有無值
   DEFINE l_icag   RECORD
          icagsite   LIKE icag_t.icagsite,
          icag001    LIKE icag_t.icag001,
          icag002    LIKE icag_t.icag002,
          icag003    LIKE icag_t.icag003,
          icag004    LIKE icag_t.icag004,
          icag005    LIKE icag_t.icag005,
          icag006    LIKE icag_t.icag006,
          icag007    LIKE icag_t.icag007,
          icag008    LIKE icag_t.icag008
                   END RECORD
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_num = 0

   OPEN s_aic_carry_icag_cs USING p_icag001,p_icag004
   INITIALIZE l_icag.* TO NULL   
   FOREACH s_aic_carry_icag_cs INTO l_icag.icagsite,
                                    l_icag.icag001,l_icag.icag002,l_icag.icag003,l_icag.icag004,l_icag.icag005,
                                    l_icag.icag006,l_icag.icag007,l_icag.icag008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_icag_cs"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      LET g_icag.icagsite = l_icag.icagsite
      LET g_icag.icag001 = l_icag.icag001
      LET g_icag.icag002 = l_icag.icag002
      LET g_icag.icag003 = l_icag.icag003
      LET g_icag.icag004 = l_icag.icag004
      LET g_icag.icag005 = l_icag.icag005
      LET g_icag.icag006 = l_icag.icag006
      LET g_icag.icag007 = l_icag.icag007
      LET g_icag.icag008 = l_icag.icag008

      LET r_num = r_num + 1
      
      #若有多筆,則取"生效日期"最近一筆
      EXIT FOREACH
   END FOREACH

   RETURN r_success,r_num   
END FUNCTION

################################################################################
# Descriptions...: 取得icah_t(單價)
# Memo...........:
# Usage..........: CALL s_aic_carry_get_tri_price(p_icah001,p_icah002,p_icah003,p_icah004,p_icah005,p_icah006,p_icah007,p_tax)
#                  RETURNING r_success,r_price
# Input parameter: p_icah001   #多角流程代碼
#                : p_icah002   #來源營運據點
#                : p_icah003   #目的營運據點
#                : p_icah004   #日期
#                : p_icah005   #幣別
#                : p_icah006   #料號
#                : P_icah007   #產品特徵
#                : p_tax       #含稅否
# Return code....: r_success   #執行結果
#                : r_price     #單價
# Date & Author..: 141118 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_tri_price(p_icah001,p_icah002,p_icah003,p_icah004,p_icah005,p_icah006,p_icah007,p_tax)
   DEFINE p_icah001   LIKE icah_t.icah001 #多角流程代碼
   DEFINE p_icah002   LIKE icah_t.icah002 #來源營運據點
   DEFINE p_icah003   LIKE icah_t.icah003 #目的營運據點
   DEFINE p_icah004   LIKE icah_t.icah004 #日期
   DEFINE p_icah005   LIKE icah_t.icah005 #幣別
   DEFINE p_icah006   LIKE icah_t.icah006 #料號
   DEFINE P_icah007   LIKE icah_t.icah007 #產品特徵
   DEFINE p_tax       LIKE type_t.chr1    #含稅否
   DEFINE r_success   LIKE type_t.num5    #執行結果
   DEFINE r_price     LIKE icah_t.icah009 #單價
   DEFINE l_num       LIKE type_t.num5
   DEFINE l_icah011   LIKE icah_t.icah011 #產品分類  #151110 earl add
   DEFINE l_icah012   LIKE icah_t.icah012 #系列      #151110 earl add
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_price = ''
   
   LET l_icah011 = '' #產品分類  #151110 earl add
   LET l_icah012 = '' #系列      #151110 earl add
   SELECT imaa009,imaa127 INTO l_icah011,l_icah012
     FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = p_icah006
   
   #料號
   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND icah006 = '",p_icah006,"'",
               "   AND icah007 = '",p_icah007,"'",
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre1 FROM g_sql
   DECLARE s_aic_carry_icah_cs1 CURSOR FOR s_aic_carry_icah_pre1
   
   #161203-00001#1 ---add (s)---
   #料號+產品特徵為空
   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND icah006 = '",p_icah006,"'",
               "   AND icah007 = ' '",
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre1_1 FROM g_sql
   DECLARE s_aic_carry_icah_cs1_1 CURSOR FOR s_aic_carry_icah_pre1_1
   #161203-00001#1 ---add (e)---
   
   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND icah006 = '",p_icah006,"'",
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre2 FROM g_sql
   DECLARE s_aic_carry_icah_cs2 CURSOR FOR s_aic_carry_icah_pre2

   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND (icah006 = '",p_icah006,"' OR icah006 = '*')", #161219-00008#1 add
              #"   AND icah006 LIKE '%*%'", #161219-00008#1 mark
              #"   AND icah006 LIKE '%",p_icah006,"%'",    #161118-00012#1  modi by 06694  '%'",p_icah006,"'%'" -> '%",p_icah006,"%'" #161219-00008#1 mark
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre3 FROM g_sql
   DECLARE s_aic_carry_icah_cs3 CURSOR FOR s_aic_carry_icah_pre3
   
   #產品分類
   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND icah012 = '",l_icah012,"'",
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre4 FROM g_sql
   DECLARE s_aic_carry_icah_cs4 CURSOR FOR s_aic_carry_icah_pre4

   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND (icah012 = '",l_icah012,"' OR icah012 = '*')", #161219-00008#1 add
              #"   AND icah012 LIKE '%*%'", #161219-00008#1 mark
              #"   AND icah012 LIKE '%",l_icah012,"%'",    #161118-00012#1  modi by 06694  '%'",l_icah012,"'%'" -> '%",l_icah012,"%'" #161219-00008#1 mark
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre5 FROM g_sql
   DECLARE s_aic_carry_icah_cs5 CURSOR FOR s_aic_carry_icah_pre5
   
   #系列   
   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND icah011 = '",l_icah011,"'",
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre6 FROM g_sql
   DECLARE s_aic_carry_icah_cs6 CURSOR FOR s_aic_carry_icah_pre6

   LET g_sql = "SELECT * ",
               "  FROM icah_t",
               " WHERE icahent = '",g_enterprise,"'",
               "   AND icah001 = ?",
               "   AND icah002 = ?",
               "   AND icah003 = ?",
               "   AND icah004 <= '",p_icah004,"'",
               "   AND icah005 = '",p_icah005,"'",
               "   AND (icah011 = '",l_icah011,"' OR icah011 = '*')", #161219-00008#1 add
              #"   AND icah011 LIKE '%*%'", #161219-00008#1 mark
              #"   AND icah011 LIKE '%",l_icah011,"%'",     #161118-00012#1  modi by 06694  '%'",l_icah011,"'%'" -> '%",l_icah011,"%'" #161219-00008#1 mark
               " ORDER BY icah004 DESC"
   PREPARE s_aic_carry_icah_pre7 FROM g_sql
   DECLARE s_aic_carry_icah_cs7 CURSOR FOR s_aic_carry_icah_pre7
      
   INITIALIZE g_icah.* TO NULL
   
   CALL s_aic_carry_price(p_icah001,p_icah002,p_icah003)
   RETURNING r_success,l_num
   
   IF r_success AND l_num = 0 THEN
      CALL s_aic_carry_price(p_icah001,p_icah002,'ALL')
      RETURNING r_success,l_num      
   END IF

   IF r_success AND l_num = 0 THEN
      CALL s_aic_carry_price(p_icah001,'ALL',p_icah003)
      RETURNING r_success,l_num      
   END IF

   IF r_success AND l_num = 0 THEN
      CALL s_aic_carry_price(p_icah001,'ALL','ALL')
      RETURNING r_success,l_num      
   END IF

   IF r_success AND l_num = 0 THEN
      CALL s_aic_carry_price('ALL',p_icah002,p_icah003)
      RETURNING r_success,l_num      
   END IF
   
   IF r_success AND l_num = 0 THEN
      CALL s_aic_carry_price('ALL',p_icah002,'ALL')
      RETURNING r_success,l_num      
   END IF
   
   IF r_success AND l_num = 0 THEN
      CALL s_aic_carry_price('ALL','ALL',p_icah003)
      RETURNING r_success,l_num      
   END IF
   
   IF r_success AND l_num = 0 THEN
      CALL s_aic_carry_price('ALL','ALL','ALL')
      RETURNING r_success,l_num      
   END IF

   IF r_success AND l_num = 0 THEN
   
      #若無轉撥單價是否允許拋轉='N',則若未取到轉撥單價,須提示錯誤訊息
      IF g_icaa.icaa009 = 'N' THEN         
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "aic-00021"   #多角流程轉撥單價未設定
         LET g_errparam.popup  = TRUE
         CALL cl_err()
   
         LET r_success = FALSE
         RETURN r_success,r_price
      ELSE
         LET g_icah.icah009 = 0
         LET g_icah.icah010 = 0
         LET r_success = TRUE
      END IF
   END IF

   IF p_tax = 'N' THEN
      LET r_price = g_icah.icah009
   ELSE
      LET r_price = g_icah.icah010
   END IF

   RETURN r_success,r_price
END FUNCTION

#由s_aic_carry_get_tri_price呼叫
PUBLIC FUNCTION s_aic_carry_price(p_icah001,p_icah002,p_icah003)
   DEFINE p_icah001   LIKE icah_t.icah001 #多角流程代碼
   DEFINE p_icah002   LIKE icah_t.icah002 #來源營運據點
   DEFINE p_icah003   LIKE icah_t.icah003 #目的營運據點

   DEFINE r_success   LIKE type_t.num5       #執行結果
   DEFINE r_num       LIKE type_t.num5       #有無值
   DEFINE l_icah   RECORD LIKE icah_t.*
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET r_num = 0
   INITIALIZE l_icah.* TO NULL

   #"多角流程代碼"+"來源營運據點"+"目的營運據點"+"料號"+"產品特徵"且"生效日期"<=傳入之"日期",若有多筆,則取"生效日期"最近一筆
   OPEN s_aic_carry_icah_cs1 USING p_icah001,p_icah002,p_icah003
   FOREACH s_aic_carry_icah_cs1 INTO l_icah.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET g_icah.* = l_icah.*

      LET r_num = r_num + 1
      
      #若有多筆,則取"生效日期"最近一筆
      EXIT FOREACH
   END FOREACH

   CLOSE s_aic_carry_icah_cs1
   
  #161203-00001#1 ---add (s)---
   IF r_success AND r_num = 0 THEN
      OPEN s_aic_carry_icah_cs1_1 USING p_icah001,p_icah002,p_icah003
      FOREACH s_aic_carry_icah_cs1_1 INTO l_icah.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs1_1"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
      
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         LET g_icah.* = l_icah.*
      
         LET r_num = r_num + 1
         
         #若有多筆,則取"生效日期"最近一筆
         EXIT FOREACH
      END FOREACH
      
      CLOSE s_aic_carry_icah_cs1_1
   END IF
   #161203-00001#1 ---add (e)---
   
   #"多角流程代碼"+"來源營運據點"+"目的營運據點"+"料號"且"生效日期"<=傳入之"日期",若有多筆,則取"生效日期"最近一筆
   IF r_success AND r_num = 0 THEN
      OPEN s_aic_carry_icah_cs2 USING p_icah001,p_icah002,p_icah003
      FOREACH s_aic_carry_icah_cs2 INTO l_icah.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs2"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET g_icah.* = l_icah.*

         LET r_num = r_num + 1
         
         #若有多筆,則取"生效日期"最近一筆
         EXIT FOREACH
      END FOREACH
      
      CLOSE s_aic_carry_icah_cs2
   END IF
   
   #"多角流程代碼"+"來源營運據點"+"目的營運據點"且"料件範圍"符合"料號"且"生效日期"<=傳入之"日期",若有多筆,則取"生效日期"最近一筆
   IF r_success AND r_num = 0 THEN
      OPEN s_aic_carry_icah_cs3 USING p_icah001,p_icah002,p_icah003
      FOREACH s_aic_carry_icah_cs3 INTO l_icah.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs3"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET g_icah.* = l_icah.*

         LET r_num = r_num + 1
         
         #若有多筆,則取"生效日期"最近一筆
         EXIT FOREACH         
      END FOREACH
      
      CLOSE s_aic_carry_icah_cs3
   END IF
   
   #"多角流程代碼"+"來源營運據點"+"目的營運據點"+"系列"且"生效日期"<=傳入之"日期",若有多筆,則取"生效日期"最近一筆
   IF r_success AND r_num = 0 THEN
      OPEN s_aic_carry_icah_cs4 USING p_icah001,p_icah002,p_icah003
      FOREACH s_aic_carry_icah_cs4 INTO l_icah.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs4"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET g_icah.* = l_icah.*

         LET r_num = r_num + 1
         
         #若有多筆,則取"生效日期"最近一筆
         EXIT FOREACH         
      END FOREACH
      
      CLOSE s_aic_carry_icah_cs4
   END IF

   #"多角流程代碼"+"來源營運據點"+"目的營運據點"且"系列範圍"符合"系列"且"生效日期"<=傳入之"日期",若有多筆,則取"生效日期"最近一筆
   IF r_success AND r_num = 0 THEN
      OPEN s_aic_carry_icah_cs5 USING p_icah001,p_icah002,p_icah003
      FOREACH s_aic_carry_icah_cs5 INTO l_icah.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs5"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET g_icah.* = l_icah.*

         LET r_num = r_num + 1
         
         #若有多筆,則取"生效日期"最近一筆
         EXIT FOREACH         
      END FOREACH
      
      CLOSE s_aic_carry_icah_cs5
   END IF
   
   #"多角流程代碼"+"來源營運據點"+"目的營運據點"+"產品分類"且"生效日期"<=傳入之"日期",若有多筆,則取"生效日期"最近一筆
   IF r_success AND r_num = 0 THEN
      OPEN s_aic_carry_icah_cs6 USING p_icah001,p_icah002,p_icah003
      FOREACH s_aic_carry_icah_cs6 INTO l_icah.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs6"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET g_icah.* = l_icah.*

         LET r_num = r_num + 1
         
         #若有多筆,則取"生效日期"最近一筆
         EXIT FOREACH         
      END FOREACH
      
      CLOSE s_aic_carry_icah_cs6
   END IF
   
   #"多角流程代碼"+"來源營運據點"+"目的營運據點"且"產品分類範圍"符合"產品分類"且"生效日期"<=傳入之"日期",若有多筆,則取"生效日期"最近一筆
   IF r_success AND r_num = 0 THEN
      OPEN s_aic_carry_icah_cs7 USING p_icah001,p_icah002,p_icah003
      FOREACH s_aic_carry_icah_cs7 INTO l_icah.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icah_cs7"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET g_icah.* = l_icah.*

         LET r_num = r_num + 1
         
         #若有多筆,則取"生效日期"最近一筆
         EXIT FOREACH
      END FOREACH
      
      CLOSE s_aic_carry_icah_cs7
   END IF
   
   RETURN r_success,r_num
END FUNCTION

################################################################################
# Descriptions...: 抓取交易對象聯絡人明細檔的聯絡對像識別碼，若有設置多個聯絡人，則取有勾選主要聯絡人的那一個
# Memo...........:
# Usage..........: CALL s_aic_carry_get_contact(p_pmaj001)
#                  RETURNING r_success,r_pmaj002
# Input parameter: p_pmaj001      #交易對象編號
#                : 
# Return code....: r_success      #執行結果
#                : r_pmaj002      #聯絡人識別碼
# Date & Author..: 141114 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_contact(p_pmaj001)
   DEFINE p_pmaj001     LIKE pmaj_t.pmaj001    #交易對象編號
   DEFINE r_success     LIKE type_t.num5       #執行結果
   DEFINE r_pmaj002     LIKE pmaj_t.pmaj002    #聯絡人識別碼

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_pmaj002 = ''

   LET g_sql = "SELECT pmaj002 FROM pmaj_t",
               " WHERE pmajent = ",g_enterprise,
               "   AND pmaj001 = '",p_pmaj001,"'",
               " ORDER BY pmaj004 DESC,pmaj002"
   PREPARE s_aic_carry_pmaj_pre FROM g_sql
   DECLARE s_aic_carry_pmaj_cs CURSOR FOR s_aic_carry_pmaj_pre
   FREE s_aic_carry_pmaj_pre

   FOREACH s_aic_carry_pmaj_cs INTO r_pmaj002
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_pmaj_cs"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()      
      
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      EXIT FOREACH   #取第一筆
   END FOREACH

   IF NOT r_success THEN
      RETURN r_success,r_pmaj002
   END IF

   RETURN r_success,r_pmaj002
END FUNCTION

################################################################################
# Descriptions...: 由"訂單/出貨單單號"+"採購單/入庫單幣別"+"計價比率"算出"單價"
# Memo...........:
# Usage..........: CALL s_aic_carry_get_price(p_type,p_inoutsale,p_site,p_date,p_tocur,p_fromdocno,p_fromseq,p_icag007)
#                  RETURNING r_success,r_price
# Input parameter: p_type           #來源1.訂單轉採購單(訂單發起)2.訂單轉採購單(採購單發起)3.出貨單轉入庫單 4.入庫單轉出貨單
#                : p_inoutsale      #內外銷/內外購
#                : p_site           #營運據點
#                : p_date           #日期
#                : p_tocur          #採購單/入庫單幣別
#                : p_fromdocno      #訂單/出貨單單號
#                : p_fromseq        #訂單/出貨單單身項次
#                : p_icag007        #計價比率
# Return code....: r_success        #執行結果
#                : r_price          #換算後單價
# Date & Author..: 141118 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_price(p_type,p_inoutsale,p_site,p_date,p_tocur,p_fromdocno,p_fromseq,p_icag007)
   DEFINE p_type        LIKE type_t.chr1        #來源1.訂單轉採購單(訂單發起)2.訂單轉採購單(採購單發起)2.出貨單轉入庫單
   DEFINE p_inoutsale   LIKE pmdl_t.pmdl054     #內外銷/內外購
   DEFINE p_site        LIKE pmdl_t.pmdlsite    #營運據點
   DEFINE p_date        LIKE pmdl_t.pmdldocdt   #日期
   DEFINE p_tocur       LIKE pmdl_t.pmdl015     #採購單/入庫單幣別
   DEFINE p_fromdocno   LIKE xmdc_t.xmdcdocno   #訂單/出貨單單號
   DEFINE p_fromseq     LIKE xmdc_t.xmdcseq     #訂單/出貨單單身項次
   DEFINE p_icag007     LIKE icag_t.icag007     #計價比率
   DEFINE r_success     LIKE type_t.num5        #執行結果
   DEFINE r_price       LIKE pmdn_t.pmdn015     #換算後單價
   
   DEFINE l_fromcur     LIKE xmda_t.xmda015     #訂單/出貨單幣別
   DEFINE l_fromprice   LIKE xmdc_t.xmdc015     #訂單/出貨單項次單價   
   DEFINE l_exchange    LIKE pmdl_t.pmdl016     #換算匯率
   DEFINE l_doctype     LIKE type_t.chr1        #1.銷售2.採購

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_price = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_type) OR
  #   cl_null(p_inoutsale) OR
  #   cl_null(p_site) OR
  #   cl_null(p_date) OR
  #   cl_null(p_tocur) OR
  #   cl_null(p_fromdocno) OR
  #   cl_null(p_fromseq) OR
  #   cl_null(p_icag007) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #   
  #   LET r_success = FALSE      
  #   RETURN r_success,r_price
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_type) THEN
      LET g_colname_1 = cl_getmsg("sub-01474",g_dlang)   #來源類型
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_inoutsale) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aapq370","lbl_buy") RETURNING g_colname_1,g_comment_1   #內外銷/內外購
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_site) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #營運據點
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_date) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("apmp500","lbl_pmdldocdt") RETURNING g_colname_1,g_comment_1   #日期
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_tocur) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq100","lbl_pmdl015") RETURNING g_colname_1,g_comment_1   #採購幣別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_fromdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CASE p_type
         WHEN '1'
            CALL s_azzi902_get_gzzd("aicp120","lbl_xmdadocno_1") RETURNING g_colname_1,g_comment_1   #訂單單號
         WHEN '2'
            CALL s_azzi902_get_gzzd("aicp110","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1   #出貨單單號
      END CASE
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_fromseq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CASE p_type
         WHEN '1'
            CALL s_azzi902_get_gzzd("aicp100","lbl_xmdcseq") RETURNING g_colname_1,g_comment_1   #訂單項次
         WHEN '2'
            CALL s_azzi902_get_gzzd("aicp110","lbl_xmdcseq") RETURNING g_colname_1,g_comment_1   #出貨單項次
      END CASE
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_icag007) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici120","lbl_icag007") RETURNING g_colname_1,g_comment_1   #計價比率
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
      RETURN r_success,r_price
   END IF
  #170816-00007#31 -E add
   
   CASE p_type
      WHEN '1'
         #SELECT訂單資訊         
         LET l_fromcur = ''
         LET l_fromprice = ''
         SELECT xmda015,xmdc015
           INTO l_fromcur,l_fromprice
           FROM xmda_t,xmdc_t
          WHERE xmdaent = xmdcent AND xmdcent = g_enterprise
            AND xmdadocno = xmdcdocno AND xmdcdocno = p_fromdocno
            AND xmdcseq = p_fromseq

         LET l_doctype = '2'  #產生採購單

      WHEN '2'
         #SELECT採購單資訊         
         LET l_fromcur = ''
         LET l_fromprice = ''
         SELECT pmdl015,pmdn015
           INTO l_fromcur,l_fromprice
           FROM pmdl_t,pmdn_t
          WHERE pmdlent = pmdnent AND pmdnent = g_enterprise
            AND pmdldocno = pmdndocno AND pmdndocno = p_fromdocno
            AND pmdnseq = p_fromseq
            
         LET l_doctype = '2'   #產生採購單
         
      WHEN '3'
         #SELECT出貨單資訊         
         LET l_fromcur = ''
         LET l_fromprice = ''
         SELECT xmdk016,xmdl024
           INTO l_fromcur,l_fromprice
           FROM xmdk_t,xmdl_t
          WHERE xmdkent = xmdlent AND xmdlent = g_enterprise
            AND xmdkdocno = xmdldocno AND xmdldocno = p_fromdocno
            AND xmdlseq = p_fromseq

         LET l_doctype = '2'   #產生入庫單
         
      WHEN '4'
         #SELECT入庫單資訊
         LET l_fromcur = ''
         LET l_fromprice = ''
         SELECT pmds037,pmdt036
           INTO l_fromcur,l_fromprice
           FROM pmds_t,pmdt_t
          WHERE pmdsent = pmdtent AND pmdtent = g_enterprise
            AND pmdsdocno = pmdtdocno AND pmdtdocno = p_fromdocno
            AND pmdtseq = p_fromseq
            
         LET l_doctype = '1'   #產生出貨單

   END CASE
   
   #160428-00006#2乘上計價比率，再乘以匯率
   LET l_fromprice = l_fromprice * p_icag007 / 100     #160428-00006#2 add
   
   IF l_fromcur <> p_tocur THEN
      #取匯率
      CALL s_aic_carry_exchange(p_inoutsale,p_site,p_date,l_fromcur,p_tocur,l_doctype)      
      RETURNING r_success,l_exchange

      IF NOT r_success THEN
         RETURN r_success,r_price
      ELSE
         LET r_price = l_fromprice * l_exchange
      END IF
   ELSE
      LET r_price = l_fromprice
   END IF
   
  
   #乘上計價比率
   #LET r_price = r_price * p_icag007 / 100   #160428-00006#2 mark
  
   RETURN r_success,r_price
END FUNCTION

################################################################################
# Descriptions...: 將傳入值來源營運據點的來源採購單,產生多角訂單資料
# Memo...........: 請依照順序CALL
#                  CALL s_aic_carry_create_temp_table_xmd()
#                  CALL s_tax_recount_tmp()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_gen_tri_so()
#                  CALL s_transaction_end(Y,0)
#                  CALL s_aic_carry_drop_temp_table_xmd()
# Usage..........: CALL s_aic_carry_gen_tri_so(p_presite,p_pmdldocno,p_final,p_date,p_icab001,p_icab002,p_xmdadocno)
#                  RETURNING r_success,r_xmdadocno
# Input parameter: p_presite      #客戶營運據點
#                : p_pmdldocno    #來源採購單號
#                : p_final        #最終站否
#                : p_date         #日期
#                : p_icab001      #流程代碼
#                : p_icab002      #站別
#                : p_xmdadocno    #初始訂單單號
# Return code....: r_success      #執行結果
#                : r_xmdadocno    #產生之訂單單號
# Date & Author..: 141117 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_so(p_presite,p_pmdldocno,p_final,p_date,p_icab001,p_icab002,p_xmdadocno)
   DEFINE p_presite     LIKE pmdl_t.pmdlsite    #客戶營運據點
   DEFINE p_pmdldocno   LIKE pmdl_t.pmdldocno   #來源採購單號
   DEFINE p_final       LIKE type_t.chr1        #最終站否
   DEFINE p_date        LIKE pmdl_t.pmdldocdt   #日期
   DEFINE p_icab001     LIKE icab_t.icab001     #流程代碼
   DEFINE p_icab002     LIKE icab_t.icab002     #站別
   DEFINE p_xmdadocno   LIKE xmda_t.xmdadocno   #初始訂單單號(可為Null)

   DEFINE r_success     LIKE type_t.num5        #執行結果
   DEFINE r_xmdadocno   LIKE xmda_t.xmdadocno   #產生之訂單單號

   DEFINE l_success     LIKE type_t.num5
   DEFINE l_pmal002     LIKE pmal_t.pmal002
   DEFINE l_sql         STRING                  #161031-00050#1 add
   DEFINE l_pmaa027     LIKE pmaa_t.pmaa027     #161216-00040#1 add
   DEFINE l_pmdn001     LIKE pmdn_t.pmdn001     #170213-00010#1 add
   DEFINE l_count       LIKE type_t.num5        #170213-00010#1 add
   DEFINE l_pmdlsite    LIKE pmdl_t.pmdlsite    #170620-00041#1 add
   DEFINE l_pmdl005     LIKE pmdl_t.pmdl005     #採購性質  #170105-00050#2-add
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_xmdadocno = ''
   #add by cz 20180612 -s
   LET g_pmdldocno = NULL
   LET g_pmdldocno = p_pmdldocno 
   #add by cz 20180612 -e

  #170816-00007#31 -S mark
  #IF cl_null(p_presite) OR
  #   cl_null(p_pmdldocno) OR
  #   cl_null(p_final) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_gen_tri_so"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_xmdadocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_presite) THEN
      CALL s_azzi902_get_gzzd("aicp100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #客戶營運據點 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_pmdldocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicp200","lbl_pmdldocno") RETURNING g_colname_1,g_comment_1   #來源採購單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_final) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01473",g_dlang)   #最終站否
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程代碼
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1   #站別
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
      RETURN r_success,r_xmdadocno
   END IF
  #170816-00007#31 -E add
  
  CALL s_aic_carry_get_ica(p_icab001,p_icab002)  #add by puwj 180601
   #170213-00010#1 add-------s---------
   LET l_sql = "SELECT pmdn001",
               "  FROM pmdn_t",
               " WHERE pmdnent = '",g_enterprise,"'",
               "   AND pmdnsite = '",g_site,"'",
               "   AND pmdndocno= ?"
               
   PREPARE s_aic_carry_pmdn_chk_pre FROM l_sql
   DECLARE s_aic_carry_pmdn_chk_cur CURSOR FOR s_aic_carry_pmdn_chk_pre
   OPEN s_aic_carry_pmdn_chk_cur    USING  p_pmdldocno
   FOREACH s_aic_carry_pmdn_chk_cur INTO l_pmdn001 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'pmdn_cur'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      SELECT COUNT(1) INTO l_count FROM imaf_t WHERE imafsite=g_icab.icab003 AND imaf001=l_pmdn001
      IF l_count<1 THEN 
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00247"   #料件%1不存在于据点%2中！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmdn001
         LET g_errparam.replace[2] = g_icab.icab003
            
         CALL cl_err()
         LET r_success = FALSE               
         EXIT FOREACH
      END IF
   END FOREACH
   #170213-00010#1 add-------e---------
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF
   
   #日期若為Null帶入g_today
   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF

   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
#   CALL s_aic_carry_get_ica(p_icab001,p_icab002) mark by puwj 180601

   #塞xmda_t
   INITIALIZE g_xmda.* TO NULL
   
   LET g_xmda.xmdasite = g_icab.icab003
   LET g_xmda.xmdadocdt = p_date   
   
   LET g_xmda.xmda001 = 0

   LET g_xmda.xmda006 = '5' #中間交易
   LET g_xmda.xmda007 = '6' #多角拋轉

   LET g_xmda.xmda008 = p_pmdldocno    #來源單號

   LET g_xmda.xmda009 = g_icae.icae009  #收款條件
   LET g_xmda.xmda010 = g_icae.icae013  #交易條件
   LET g_xmda.xmda011 = g_icae.icae011  #稅別

   LET g_xmda.xmda019 = 'Y'

   LET g_xmda.xmda024 = g_icad.icad003  #銷售分類

   LET g_xmda.xmda029 = g_dept
   LET g_xmda.xmda030 = 'Y'   #modyfi--2015/01/09 By shiun
  
   LET g_xmda.xmda035 = g_icae.icae014

   LET g_xmda.xmda039 = '1'  #預收款發票開立方式
 
   LET g_xmda.xmda045 = 'N'  #物流結案
   LET g_xmda.xmda046 = 'N'  #帳流結案
   LET g_xmda.xmda047 = 'N'  #金流結案

   LET g_xmda.xmda050 = p_icab001
   LET g_xmda.xmda051 = p_final

   LET g_xmda.xmdaownid = g_user
   LET g_xmda.xmdaowndp = g_dept
   LET g_xmda.xmdacrtid = g_user
   LET g_xmda.xmdacrtdp = g_dept
   LET g_xmda.xmdacrtdt = cl_get_current()
   LET g_xmda.xmdastus = 'N'

   #下單客戶↓↓ #170620-00041#1 add
   #傳入值"來源營運據點"之"據點對應客戶/廠商編號"
   CALL s_aic_carry_get_ooef024(p_presite)
   RETURNING r_success,g_xmda.xmda004
   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF
   #下單客戶↑↑ #170620-00041#1 add  
       
   LET g_xmda.xmda021 = g_xmda.xmda004  #帳款客戶
  #LET g_xmda.xmda022 = g_xmda.xmda004  #收貨客戶 #161107-00023#1 mark
   LET g_xmda.xmda203 = g_xmda.xmda004  #發票客戶
   
   #170105-00050#2-s-add 從下面移上來的，多加pmdl005
   #SELECT來源採購單資料
   SELECT pmdl005,pmdl015,pmdl031,
          pmdl032,pmdl025,pmdl026,
          pmdlsite,pmdl020,pmdl044
     INTO l_pmdl005,g_xmda.xmda015,g_xmda.xmda031,
          g_xmda.xmda034,g_xmda.xmda025,g_xmda.xmda026,
          l_pmdlsite,g_xmda.xmda020,g_xmda.xmda071 
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = p_pmdldocno
   #170105-00050#2-e-add
   #C20180725-07783--先取单别设置的默认字段---S
   LET g_xmda.xmda005 = s_aooi200_get_doc_default(g_icab.icab003,'1',g_icac.icac003,'xmda005',g_xmda.xmda005)   
   #C20180725-07783--先取单别设置的默认字段---E   
   #SELECT 初始訂單資料    

   IF cl_null(g_xmda.xmda005) THEN    #C20180726-07783---ADD
      IF NOT cl_null(p_xmdadocno) THEN 
         SELECT xmda005,xmda033,xmda044,xmda022                               #161107-00023#1 add xmda022
               ,xmda037,xmda038                                               #170824-00001#1 add 
               ,xmda027,xmda036                                               #170824-00002#2 add #訂單上要帶來源訂單的客戶連絡人、送貨供應商
           INTO g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044,g_xmda.xmda022   #161107-00023#1 add xmda022
               ,g_xmda.xmda037,g_xmda.xmda038                                 #170824-00001#1 add 
               ,g_xmda.xmda027,g_xmda.xmda036                                 #170824-00002#2 add #訂單上要帶來源訂單的客戶連絡人、送貨供應商
           FROM xmda_t
          WHERE xmdaent = g_enterprise
            AND xmdadocno = p_xmdadocno
      #170620-00041#1 --s add   
      ELSE
         #沒有初始訂單，表示為代採購或代採購指定供應商
         #收貨客戶↓↓
         #抓取起始站
         SELECT icab003 INTO l_pmdlsite 
           FROM icab_t
          WHERE icabent = g_enterprise AND icab001 = p_icab001
            AND icab002 = 0
         CALL s_aic_carry_get_ooef024(l_pmdlsite) #來源採購據點的客戶編號
         RETURNING r_success,g_xmda.xmda022
         IF NOT r_success THEN
            RETURN r_success,r_xmdadocno
         END IF
         #收貨客戶↑↑
      #170620-00041#1 --e add
      END IF 
   #C20180726-07783---S      
   ELSE
      IF NOT cl_null(p_xmdadocno) THEN 
         SELECT xmda033,xmda044,xmda022                               #161107-00023#1 add xmda022
               ,xmda037,xmda038                                               #170824-00001#1 add 
               ,xmda027,xmda036                                               #170824-00002#2 add #訂單上要帶來源訂單的客戶連絡人、送貨供應商
           INTO g_xmda.xmda033,g_xmda.xmda044,g_xmda.xmda022   #161107-00023#1 add xmda022
               ,g_xmda.xmda037,g_xmda.xmda038                                 #170824-00001#1 add 
               ,g_xmda.xmda027,g_xmda.xmda036                                 #170824-00002#2 add #訂單上要帶來源訂單的客戶連絡人、送貨供應商
           FROM xmda_t
          WHERE xmdaent = g_enterprise
            AND xmdadocno = p_xmdadocno
      #170620-00041#1 --s add   
      ELSE
         #沒有初始訂單，表示為代採購或代採購指定供應商
         #收貨客戶↓↓
         #抓取起始站
         SELECT icab003 INTO l_pmdlsite 
           FROM icab_t
          WHERE icabent = g_enterprise AND icab001 = p_icab001
            AND icab002 = 0
         CALL s_aic_carry_get_ooef024(l_pmdlsite) #來源採購據點的客戶編號
         RETURNING r_success,g_xmda.xmda022
         IF NOT r_success THEN
            RETURN r_success,r_xmdadocno
         END IF
         #收貨客戶↑↑
      #170620-00041#1 --e add
      END IF   
   END IF   
   #C20180726-07783---E   
   
     
   IF cl_null(g_xmda.xmda005) THEN
      #LET g_xmda.xmda005 = '1'  #一般訂單 #170105-00050#2-mark
      #170105-00050#2-s-add
      IF l_pmdl005 = '4' THEN
         LET g_xmda.xmda005 = '5'  #預先訂單
      ELSE
         LET g_xmda.xmda005 = '1'  #一般訂單 
      END IF
      #170105-00050#2-e-add
   END IF
   

   #170105-00050#2-s-mark 移到上面去
   ##SELECT來源採購單資料
   ##170620-00041#1 --s mark
   ##SELECT pmdl015,pmdl031,pmdl032
   ##  INTO g_xmda.xmda015,g_xmda.xmda031,g_xmda.xmda034
   ##170620-00041#1 --e mark
   ##170221-00029#2-s-mark
   ###170620-00041#1 --s add #送貨/帳款地址、運輸方式從來源採購單往後拋
   ##SELECT pmdl015,pmdl031,pmdl032,pmdl025,pmdl026,pmdlsite,pmdl020         
   ##  INTO g_xmda.xmda015,g_xmda.xmda031,g_xmda.xmda034,g_xmda.xmda025,g_xmda.xmda026,l_pmdlsite,g_xmda.xmda020
   ###170620-00041#1 --e add
   ##170221-00029#2-e-mark
   ##170221-00029#2-s-add
   #SELECT pmdl015,pmdl031,pmdl032,pmdl025,pmdl026,pmdlsite,pmdl020,pmdl044
   #  INTO g_xmda.xmda015,g_xmda.xmda031,g_xmda.xmda034,g_xmda.xmda025,
   #       g_xmda.xmda026,l_pmdlsite,g_xmda.xmda020,g_xmda.xmda071   
   ##170221-00029#2-e-add
   #  FROM pmdl_t
   # WHERE pmdlent = g_enterprise
   #   AND pmdldocno = p_pmdldocno
   #170105-00050#2-e-mark
   
   #取得銷售控制组編號
   CALL s_control_get_group('2',g_user,g_dept) RETURNING l_success,l_pmal002

   CALL s_apmm101_default_pmab('2',l_pmal002,g_xmda.xmdasite,g_xmda.xmda004) RETURNING g_pmab.*
   #慣用交易幣別(改抓來源採購單)
   #LET g_xmda.xmda015 = g_pmab.pmab033
   #慣用交易稅別(改抓icae011)
   #LET g_xmda.xmda011 = g_pmab.pmab034
   #慣用付款/收款條件(改抓icae009)
   #LET g_xmda.xmda009 = g_pmab.pmab037
   #慣用採購/銷售通路
   LET g_xmda.xmda023 = g_pmab.pmab038
   #慣用採購/銷售分類(改抓icad003)
   #LET g_xmda.xmda024 = g_pmab.pmab039
   #慣用交運方式
   #LET g_xmda.xmda020 = g_pmab.pmab040 #170620-00041#1 mark #改抓初始採購單的
   #慣用交運起點
  #LET g_xmda.xmda037 = g_pmab.pmab041  #170824-00001#1 mark  
   #慣用交運終點
  #LET g_xmda.xmda038 = g_pmab.pmab042  #170824-00001#1 mark 
   #慣用交易條件(改抓icae013)
   #LET g_xmda.xmda010 = g_pmab.pmab053
   #慣用取價方式
   LET g_xmda.xmda017 = g_pmab.pmab054
   #慣用發票類型(改抓icae014)
   #LET g_xmda.xmda035 = g_pmab.pmab056
   #內外購/銷
   LET g_xmda.xmda048 = g_pmab.pmab057
   #取匯率來源
   LET g_xmda.xmda049 = g_pmab.pmab058
   #負責採購/業務人員
   LET g_xmda.xmda002 = g_pmab.pmab031
   #負責採購/業務部門
   LET g_xmda.xmda003 = g_pmab.pmab059
   #慣用卸貨港
   #g_pmab.pmab043

   #必要欄位檢查
   IF g_pmab.prog = 'axmi111' THEN  #控制組預設
     #171130-00045#1 mark  --begin--
     #IF cl_null(g_xmda.xmda023) THEN
     #   INITIALIZE g_errparam TO NULL      
     #   LET g_errparam.extend = ''      
     #   LET g_errparam.code   = "aic-00154"   #控制組編號%1，客戶編號%2之慣用銷售通路為空！
     #   LET g_errparam.popup  = TRUE
     #   LET g_errparam.replace[1] = l_pmal002
     #   LET g_errparam.replace[2] = g_xmda.xmda004
     #      
     #   CALL cl_err()
     #   LET r_success = FALSE
     #END IF
     #171130-00045#1 mark  --end--
     
      IF cl_null(g_xmda.xmda017) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00155"   #控制組編號%1，客戶編號%2之慣用取價方式為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_xmda.xmda004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_xmda.xmda048) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00156"   #控制組編號%1，客戶編號%2之慣用內外銷為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_xmda.xmda004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_xmda.xmda049) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00157"   #控制組編號%1，客戶編號%2之慣用匯率計算基準為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = l_pmal002
         LET g_errparam.replace[2] = g_xmda.xmda004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   ELSE   #客戶據點預設條件axmm202
     #171130-00045#1 mark  --begin--
     #IF cl_null(g_xmda.xmda023) THEN
     #   INITIALIZE g_errparam TO NULL
     #   LET g_errparam.extend = ''
     #   LET g_errparam.code   = "aic-00158"   #客戶編號%1之慣用銷售通路為空！
     #   LET g_errparam.popup  = TRUE
     #   LET g_errparam.replace[1] = g_xmda.xmda004
     #      
     #   CALL cl_err()
     #   LET r_success = FALSE
     #END IF
     #171130-00045#1 mark  --end--
     
      IF cl_null(g_xmda.xmda017) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code   = "aic-00159"   #客戶編號%1之慣用取價方式為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_xmda.xmda004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF

      IF cl_null(g_xmda.xmda048) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00160"   #客戶編號%1之慣用內外銷為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_xmda.xmda004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_xmda.xmda049) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00161"   #客戶編號%1之慣用匯率計算基準為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = g_xmda.xmda004
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF

   IF cl_null(g_xmda.xmda011) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''
      LET g_errparam.code   = "aic-00162"   #流程代碼%1站別%2之訂單稅別為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
         
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF cl_null(g_xmda.xmda009) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''      
      LET g_errparam.code   = "aic-00163"   #流程代碼%1站別%2之收款條件為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF cl_null(g_xmda.xmda010) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = "aic-00164"   #流程代碼%1站別%2之訂單交易條件為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF cl_null(g_xmda.xmda035) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''      
      LET g_errparam.code   = "aic-00153"   #流程代碼%1站別%2之訂單發票類型為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF

   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF

   #自動產生訂單號xmdadocno
   IF NOT cl_null(g_icac.icac003) THEN
      CALL s_aic_carry_docno(p_pmdldocno,g_xmda.xmdasite,g_icac.icac003,p_date,'axmt500')
      RETURNING r_success,g_xmda.xmdadocno
   ELSE
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = ''      
      LET g_errparam.code   = "aic-00167"   #流程代碼%1站別%2之訂單單別為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_icab001
      LET g_errparam.replace[2] = p_icab002
            
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF

   LET r_xmdadocno = g_xmda.xmdadocno

   #取得稅率、含稅否
   CALL s_aic_carry_tax(g_xmda.xmdasite,g_xmda.xmda011) RETURNING r_success,g_xmda.xmda013,g_xmda.xmda012
   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF

   #取匯率
   CALL s_aic_carry_exchange(g_xmda.xmda048,g_xmda.xmdasite,g_xmda.xmdadocdt,g_xmda.xmda015,'','1')
   RETURNING r_success,g_xmda.xmda016
   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF
   #170824-00002#2 --s mark
   #訂單上要帶來源訂單的客戶連絡人
   ##抓取交易對象聯絡人明細檔的聯絡對像識別碼，若有設置多個聯絡人，則取有勾選主要聯絡人的那一個
   #CALL s_aic_carry_get_contact(g_xmda.xmda004) RETURNING r_success,g_xmda.xmda027
   #IF NOT r_success THEN
   #   RETURN r_success,r_xmdadocno
   #END IF
   #170824-00002#2 --e mark
   #170620-00041#1 --s mark 地址應該抓來源採購單的地址(xmdl025、xmdl026)
   ##161216-00040#1--add---begin---
   ##抓取收货地址(地址類型先抓3，抓不到才改抓2)
   #LET l_pmaa027 = ''
   #CALL s_axmt500_get_pmaa027(g_xmda.xmda022) RETURNING l_pmaa027
   #SELECT oofb019 INTO g_xmda.xmda025 FROM oofb_t
   # WHERE oofb002 = l_pmaa027 AND oofb008 = '3'
   #   AND oofbstus = 'Y' AND oofb010 = 'Y' AND rownum = 1 AND oofbent = g_enterprise    
   #IF cl_null(g_xmda.xmda025) THEN
   #   SELECT oofb019 INTO g_xmda.xmda025 FROM oofb_t
   #    WHERE oofb002 = l_pmaa027 AND oofb008 = '3'
   #      AND oofbstus = 'Y' AND rownum = 1 AND oofbent = g_enterprise    
   #END IF
   #IF cl_null(g_xmda.xmda025) THEN
   #   SELECT oofb019 INTO g_xmda.xmda025 FROM oofb_t
   #    WHERE oofb002 = l_pmaa027 AND oofb008 = '2'
   #      AND oofbstus = 'Y' AND oofb010 = 'Y' AND rownum = 1 AND oofbent = g_enterprise    
   #END IF
   #IF cl_null(g_xmda.xmda025) THEN
   #   SELECT oofb019 INTO g_xmda.xmda025 FROM oofb_t
   #    WHERE oofb002 = l_pmaa027 AND oofb008 = '2'
   #      AND oofbstus = 'Y' AND rownum = 1 AND oofbent = g_enterprise    
   #END IF
   #
   ##抓取账款地址(地址類型先抓5，抓不到才改抓2)
   #LET l_pmaa027 = '' 
   #CALL s_axmt500_get_pmaa027(g_xmda.xmda021) RETURNING l_pmaa027
   #SELECT oofb019 INTO g_xmda.xmda026 FROM oofb_t
   # WHERE oofb002 = l_pmaa027  AND oofb008 = '5'
   #   AND oofbstus = 'Y' AND oofb010 = 'Y' AND rownum = 1 AND oofbent = g_enterprise    
   #IF cl_null(g_xmda.xmda026) THEN
   #   SELECT oofb019 INTO g_xmda.xmda026 FROM oofb_t
   #    WHERE oofb002 = g_xmda.xmda021 AND oofb008 = '5'
   #      AND oofbstus = 'Y' AND rownum = 1 AND oofbent = g_enterprise   
   #END IF
   #IF cl_null(g_xmda.xmda026) THEN
   #   SELECT oofb019 INTO g_xmda.xmda026 FROM oofb_t
   #    WHERE oofb002 = l_pmaa027  AND oofb008 = '2'
   #      AND oofbstus = 'Y' AND oofb010 = 'Y' AND rownum = 1 AND oofbent = g_enterprise   
   #END IF
   #IF cl_null(g_xmda.xmda026) THEN
   #   SELECT oofb019 INTO g_xmda.xmda026 FROM oofb_t
   #    WHERE oofb002 = g_xmda.xmda021 AND oofb008 = '2'
   #      AND oofbstus = 'Y' AND rownum = 1 AND oofbent = g_enterprise   
   #END IF 
   ##161216-00040#1--add---end------
   #170620-00041#1 --e mark
   
   INSERT INTO xmda_t (xmdaent,xmdasite,xmdadocno,xmdadocdt,
                       xmda001,xmda002,xmda003,xmda004,xmda005,
                       xmda006,xmda007,xmda008,xmda009,xmda010,
                       xmda011,xmda012,xmda013,xmda015,
                       xmda016,xmda017,xmda018,xmda019,xmda020,
                       xmda021,xmda022,xmda023,xmda024,xmda025,
                       xmda026,xmda027,xmda028,xmda029,xmda030,
                       xmda031,xmda032,xmda033,xmda034,xmda035,
                       xmda036,xmda037,xmda038,xmda039,
                       xmda041,xmda042,xmda043,xmda044,xmda045,
                       xmda046,xmda047,xmda048,xmda049,xmda050,
                       xmda051,xmda071,
                       xmdaownid,xmdaowndp,
                       xmdacrtid,xmdacrtdp,xmdacrtdt,
                       xmdamodid,xmdamoddt,
                       xmdacnfid,xmdacnfdt,
                       xmdapstid,xmdapstdt,xmdastus,
                       xmda200,xmda201,xmda202,xmda203,xmda204,xmda205,
                       xmda206,xmda207,xmdaunit)
   VALUES (g_enterprise,g_xmda.xmdasite,g_xmda.xmdadocno,g_xmda.xmdadocdt,
           g_xmda.xmda001,g_xmda.xmda002,g_xmda.xmda003,g_xmda.xmda004,g_xmda.xmda005,
           g_xmda.xmda006,g_xmda.xmda007,g_xmda.xmda008,g_xmda.xmda009,g_xmda.xmda010,
           g_xmda.xmda011,g_xmda.xmda012,g_xmda.xmda013,g_xmda.xmda015,
           g_xmda.xmda016,g_xmda.xmda017,g_xmda.xmda018,g_xmda.xmda019,g_xmda.xmda020,
           g_xmda.xmda021,g_xmda.xmda022,g_xmda.xmda023,g_xmda.xmda024,g_xmda.xmda025,
           g_xmda.xmda026,g_xmda.xmda027,g_xmda.xmda028,g_xmda.xmda029,g_xmda.xmda030,
           g_xmda.xmda031,g_xmda.xmda032,g_xmda.xmda033,g_xmda.xmda034,g_xmda.xmda035,
           g_xmda.xmda036,g_xmda.xmda037,g_xmda.xmda038,g_xmda.xmda039,
           g_xmda.xmda041,g_xmda.xmda042,g_xmda.xmda043,g_xmda.xmda044,g_xmda.xmda045,
           g_xmda.xmda046,g_xmda.xmda047,g_xmda.xmda048,g_xmda.xmda049,g_xmda.xmda050,
           g_xmda.xmda051,g_xmda.xmda071,
           g_xmda.xmdaownid,g_xmda.xmdaowndp,
           g_xmda.xmdacrtid,g_xmda.xmdacrtdp,g_xmda.xmdacrtdt,
           g_xmda.xmdamodid,g_xmda.xmdamoddt,
           g_xmda.xmdacnfid,g_xmda.xmdacnfdt,
           g_xmda.xmdapstid,g_xmda.xmdapstdt,g_xmda.xmdastus,
           g_xmda.xmda200,g_xmda.xmda201,g_xmda.xmda202,g_xmda.xmda203,g_xmda.xmda204,g_xmda.xmda205,
           g_xmda.xmda206,g_xmda.xmda207,g_xmda.xmdaunit)

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:xmda_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
         
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF

   #INSERT 單身
  #CALL s_aic_carry_body_so(p_pmdldocno) RETURNING r_success              #170103-00002#1 mark
   CALL s_aic_carry_body_so(p_pmdldocno,p_xmdadocno) RETURNING r_success  #170103-00002#1 add
  #161031-00050#1-s-add 
   IF NOT cl_null(p_xmdadocno) THEN
      #產生附屬零件檔xmdq_t
      LET l_sql = "INSERT INTO xmdq_t(xmdqent,xmdqsite,xmdqdocno,xmdqseq,xmdqseq1,",
                   "                  xmdq001,xmdq002,xmdq003,xmdq004,xmdq005, ",
                   "                  xmdq006,xmdq007,xmdq008,xmdq009,xmdq010, ",
                   "                  xmdq011,xmdq012 )",
                   "SELECT xmdqent, '",g_xmda.xmdasite,"' , '",g_xmda.xmdadocno,"' ,xmdqseq,xmdqseq1, ",
                   "       xmdq001,xmdq002,xmdq003,xmdq004,xmdq005, ",
                   "       xmdq006,xmdq007,xmdq008,xmdq009,xmdq010, ",
                   "       xmdq011,xmdq012 ",
                   "  FROM xmdq_t ",
                   " WHERE xmdqent = ",g_enterprise," AND xmdqdocno = '",p_xmdadocno,"'"
      PREPARE s_aic_carry_xmdq_pre1 FROM l_sql  
      EXECUTE s_aic_carry_xmdq_pre1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:xmdq_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()            
         LET r_success = FALSE
         RETURN r_success,r_xmdadocno
      END IF                    
      #產生費用資料檔xmds_t
      LET l_sql = "INSERT INTO xmds_t(xmdsent,xmdssite,xmdsdocno,xmdsseq, ",
                  "                   xmds001,xmds002,xmds003,xmds004,xmds005,xmds006) ",
                  "SELECT xmdsent,'",g_xmda.xmdasite,"' , '",g_xmda.xmdadocno,"' , xmdsseq,",
                  "        xmds001,xmds002,xmds003,xmds004,xmds005, xmds006 ",
                  "  FROM xmds_t ",
                  " WHERE xmdsent = ",g_enterprise," AND xmdsdocno = '",p_xmdadocno,"'"
      PREPARE s_aic_carry_xmds_pre1 FROM l_sql  
      EXECUTE s_aic_carry_xmds_pre1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:xmds_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()            
         LET r_success = FALSE
         RETURN r_success,r_xmdadocno
      END IF            
   END IF
  #161031-00050#1-e-add
  
  #170221-00029#2-s-add
  IF r_success THEN
     #寫入單頭/單身的備註
     CALL s_aic_carry_ins_ooff('axmt500',g_xmda.xmdadocno,'apmt500',p_pmdldocno) RETURNING r_success
  END IF
  #170221-00029#2--add
  
   IF r_success THEN
      #訂單確認
      CALL s_aic_carry_xmda_conf(g_xmda.xmdadocno,g_xmda.xmdasite) RETURNING r_success
   END IF

   RETURN r_success,r_xmdadocno
END FUNCTION

################################################################################
# Descriptions...: #CREATE TEMP TABLE
# Memo...........:
# Usage..........: CALL s_aic_carry_create_temp_table_xmd()
#                  RETURNING r_success
# Input parameter: 
#                : 
# Return code....: r_success    執行結果
#                : 
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_create_temp_table_xmd()
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_success    LIKE type_t.num5   #170206-00013#1 add 
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #DROP TEMP TABLE
   CALL s_aic_carry_drop_temp_table_xmd()

   #CREATE TEMP TABLE   
   CALL s_aic_carry_crt_tmp_xmd_new() RETURNING r_success   #170206-00013#1 add      
   RETURN r_success   #170206-00013#1 add      
   
   #170206-00013#1-(S)-mark   
   #LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_xmdc_temp AS ",
   #            "SELECT * FROM xmdc_t "
   #PREPARE s_aic_carry_xmdc_temp FROM g_sql
   #EXECUTE s_aic_carry_xmdc_temp
   #FREE s_aic_carry_xmdc_temp
   #
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.extend = "CREATE:s_aic_carry_xmdc_temp"
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()  
   #
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #
   #LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_xmdd_temp AS ",
   #            "SELECT * FROM xmdd_t "
   #PREPARE s_aic_carry_xmdd_temp FROM g_sql
   #EXECUTE s_aic_carry_xmdd_temp
   #FREE s_aic_carry_xmdd_temp
   #
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.extend = "CREATE:s_aic_carry_xmdd_temp"
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()  
   #
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #
   #LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_xmdf_temp AS ",
   #            "SELECT * FROM xmdf_t "
   #PREPARE s_aic_carry_xmdf_temp FROM g_sql
   #EXECUTE s_aic_carry_xmdf_temp
   #FREE s_aic_carry_xmdf_temp
   #
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.extend = "CREATE:s_aic_carry_xmdf_temp"
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()  
   #
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #
   #RETURN r_success
   #170206-00013#1-(E)-mark   
END FUNCTION

################################################################################
# Descriptions...: #DROP TEMP TABLE
# Memo...........:
# Usage..........: CALL s_aic_carry_drop_temp_table_xmd()
#                  
# Input parameter: 
#                : 
# Return code....: 
#                : 
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_drop_temp_table_xmd()
   WHENEVER ERROR CONTINUE
   #刪除TEMP TABLE
   #170206-00013#1-(S)-mark
   #DROP TABLE s_aic_carry_xmdc_temp
   #DROP TABLE s_aic_carry_xmdd_temp
   #DROP TABLE s_aic_carry_xmdf_temp
   #170206-00013#1-(E)-mark
   
   #170206-00013#1-(S)-add
   DROP TABLE s_aic_xmdc_temp
   DROP TABLE s_aic_xmdd_temp
   DROP TABLE s_aic_xmdf_temp
   #170206-00013#1-(E)-add
END FUNCTION

################################################################################
# Descriptions...: 將傳入之訂單單號之交期明細檔，一一產生工單委外採購單
# Memo...........: 請依照順序CALL
#                  CALL s_aic_carry_create_temp_asfp400()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_gen_tri_wo()
#                  CALL s_transaction_end(Y,0)
#                  CALL s_aic_carry_drop_temp_asfp400()
# Usage..........: CALL s_aic_carry_gen_tri_wo(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_pmdl052,p_date,p_icab001,p_icab002)
#                  RETURNING r_success,r_pmdldocno
# Input parameter: p_firstpmdldocno #初始採購單號(若為Null表示由"初始訂單"發起)
#                : p_firstxmdadocno #初始訂單單號(若為Null表示由"初始採購單"發起)
#                : p_xmdadocno      #當站訂單單號
#                : p_nextsite       #下站營運據點
#                : p_final          #最終站否
#                : p_pmdl052        #最終供應商
#                : p_date           #日期(若為NULL帶入g_today)
#                : p_icab001        #流程代碼
#                : p_icab002        #站別
# Return code....: r_success        #執行結果
#                : r_pmdldocno      #產生之委外採購單號
# Date & Author..: 141120 By earl
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_wo(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_pmdl052,p_date,p_icab001,p_icab002)
   DEFINE p_firstpmdldocno   LIKE pmdl_t.pmdldocno  #初始採購單號
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno  #初始訂單單號
   DEFINE p_xmdadocno        LIKE xmda_t.xmdadocno  #當站訂單單號
   DEFINE p_nextsite         LIKE xmda_t.xmdasite   #下站營運據點
   DEFINE p_final            LIKE xmda_t.xmda051    #最終站否
   DEFINE p_pmdl052          LIKE pmdl_t.pmdl052    #最終供應商
   DEFINE p_date             LIKE xmda_t.xmdadocdt  #日期(若為NULL帶入g_today)
   DEFINE p_icab001          LIKE icab_t.icab001    #流程代碼
   DEFINE p_icab002          LIKE icab_t.icab002    #站別
                            
   DEFINE r_success          LIKE type_t.num5       #執行結果
   DEFINE r_pmdldocno        STRING  #產生之委外採購單號   
   
   DEFINE l_order     RECORD          
          xmda031            LIKE xmda_t.xmda031,
          xmda034            LIKE xmda_t.xmda034,
          xmda050            LIKE xmda_t.xmda050,
          xmdc028            LIKE xmdc_t.xmdc028,
          xmdc029            LIKE xmdc_t.xmdc029,
          xmdc030            LIKE xmdc_t.xmdc030,
          xmdc036            LIKE xmdc_t.xmdc036,
          xmdc037            LIKE xmdc_t.xmdc037,
          xmdc038            LIKE xmdc_t.xmdc038,
          xmdc049            LIKE xmdc_t.xmdc049,
          xmdc057            LIKE xmdc_t.xmdc057,
          xmdc024            LIKE xmdc_t.xmdc024,  #170517-00029#1-add
          xmddseq            LIKE xmdd_t.xmddseq,
          xmddseq1           LIKE xmdd_t.xmddseq1,
          xmddseq2           LIKE xmdd_t.xmddseq2,
          xmdd001            LIKE xmdd_t.xmdd001,
          xmdd002            LIKE xmdd_t.xmdd002,
          xmdd004            LIKE xmdd_t.xmdd004,
          xmdd006            LIKE xmdd_t.xmdd006,
          xmdd011            LIKE xmdd_t.xmdd011,
          xmdd024            LIKE xmdd_t.xmdd024,
          xmdd025            LIKE xmdd_t.xmdd025
                      END RECORD

   DEFINE l_sfaadocno        STRING                     #紀錄已產生的工單單號

   DEFINE l_prog             LIKE type_t.chr20     #作業編號 (gzzz001)
  #160523-00018#1-s-add
   DEFINE l_xmddseq   LIKE xmdd_t.xmddseq
   DEFINE l_xmddseq1  LIKE xmdd_t.xmddseq1
   DEFINE l_xmddseq2  LIKE xmdd_t.xmddseq2
   DEFINE l_xmdd006   LIKE xmdd_t.xmdd006
  #160523-00018#1-e-add
   DEFINE l_pmdldocdt LIKE pmdl_t.pmdldocdt      #C180709-09421#5---add
   DEFINE l_pmdlsite  LIKE pmdl_t.pmdlsite       #C180709-09421#5---add
   DEFINE l_sfaadocdt LIKE sfaa_t.sfaadocdt      #C180709-09421#5---add
   DEFINE l_pmdlcnfdt LIKE pmdl_t.pmdlcnfdt  #C20180713-09016#4
   DEFINE l_sfaa019 LIKE sfaa_t.sfaa019  #C20180713-09016#4
   DEFINE l_sfaa020 LIKE sfaa_t.sfaa020  #C20180713-09016#4
   DEFINE l_pmdp003 LIKE pmdp_t.pmdp003  #C20180713-09016#4
   DEFINE l_slip    LIKE ooba_t.ooba002  #C200917-01626#1 add by pane 200917

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_pmdldocno = ''
   
   LET l_sfaadocno = '1=1'
   
  #170816-00007#31 -S mark
  #IF cl_null(p_xmdadocno) OR
  #   cl_null(p_final) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
  #   LET g_errparam.code   = "sub-268"    #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdldocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_xmdadocno) THEN
      CALL s_azzi902_get_gzzd("aicp100","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1   #當站訂單單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_final) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01473",g_dlang)   #最終站否
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1   #站別
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
      RETURN r_success,r_pmdldocno
   END IF
  #170816-00007#31 -E add

   IF p_final = 'N' AND cl_null(p_nextsite) THEN
     #170816-00007#31 -S mark
     #INITIALIZE g_errparam TO NULL
     #LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
     #LET g_errparam.code   = "sub-268"    #傳入參數為空!
     #LET g_errparam.popup  = TRUE
     #CALL cl_err()
     #
     #LET r_success = FALSE
     #RETURN r_success,r_pmdldocno
     #170816-00007#31 -E mark
     
     #170816-00007#31 -S add
     #修改錯誤訊息報錯內容
      LET g_msg = ''
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      IF cl_null(p_nextsite) THEN
         CALL s_azzi902_get_gzzd("aici100","lbl_icabsite") RETURNING g_colname_1,g_comment_1   #下站營運據點
         LET g_msg = g_colname_1 
      END IF  
      IF NOT cl_null(g_msg) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_msg 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_pmdldocno
      END IF      
     #170816-00007#31 -E add
   END IF

   IF p_final = 'Y' AND cl_null(p_pmdl052) THEN
     #170816-00007#31 -S mark  
     #INITIALIZE g_errparam TO NULL
     #LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
     #LET g_errparam.code   = "sub-268"    #傳入參數為空!
     #LET g_errparam.popup  = TRUE
     #CALL cl_err()
     #
     #LET r_success = FALSE
     #RETURN r_success,r_pmdldocno 
     #170816-00007#31 -E mark
     
     #170816-00007#31 -S add
     #修改錯誤訊息報錯內容
      LET g_msg = ''
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      IF cl_null(p_pmdl052) THEN
         CALL s_azzi902_get_gzzd("apmp490_03","lbl_pmdl052") RETURNING g_colname_1,g_comment_1   #最終供應商
         LET g_msg = g_colname_1 
      END IF  
      IF NOT cl_null(g_msg) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_msg 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_pmdldocno 
      END IF      
     #170816-00007#31 -E add
   END IF

   IF cl_null(p_firstpmdldocno) = cl_null(p_firstxmdadocno) THEN   #兩者不會同時存在或同時為Null

     #170816-00007#31 -S mark
     #INITIALIZE g_errparam TO NULL
     #LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
     #LET g_errparam.code   = "sub-268"     #傳入參數為空!
     #LET g_errparam.popup  = TRUE
     #CALL cl_err()
     #LET r_success = FALSE
     #RETURN r_success,r_pmdldocno
     #170816-00007#31 -E mark
     
     #170816-00007#31 -S add
     #修改錯誤訊息報錯內容
      LET g_msg = ''
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      IF cl_null(p_firstpmdldocno) THEN
         CALL s_azzi902_get_gzzd("aicr210","lbl_pmdldocno") RETURNING g_colname_1,g_comment_1   #初始採購單號
         LET g_msg = g_colname_1   
      END IF
      IF cl_null(p_firstxmdadocno) THEN
         LET g_colname_1 = ''
         LET g_comment_1 = ''   
         CALL s_azzi902_get_gzzd("aicr200","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1   #初始訂單單號
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
         RETURN r_success,r_pmdldocno
      END IF
     #170816-00007#31 -E add
   END IF

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #日期若為NULL帶入g_today
   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF

   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
   CALL s_aic_carry_get_ica(p_icab001,p_icab002)

  #160523-00018#1-s-mark 
  #LET g_sql = "SELECT xmda031,xmda034,xmda050,",
  #            "       xmdc028,xmdc029,xmdc030,",
  #            "       xmdc036,xmdc037,xmdc038,",
  #            "       xmdc049,xmdc057,",
  #            "       xmddseq,xmddseq1,xmddseq2,",
  #            "       xmdd001,xmdd002,",
  #            "       xmdd004,xmdd006,xmdd011,",
  #            "       xmdd024,xmdd025",
  #            "  FROM xmda_t,xmdc_t,xmdd_t",
  #            " WHERE xmdaent = xmdcent AND xmdcent = xmddent",
  #            "   AND xmddent = ",g_enterprise,
  #            "   AND xmdadocno = xmdcdocno AND xmdcdocno = xmdddocno",
  #            "   AND xmdddocno = '",p_xmdadocno,"'",
  #            "   AND xmdcseq = xmddseq"
  #160523-00018#1-e-mark
   
   #SELECT訂單資訊   
   #160523-00018#1-s
   #LET g_sql = "SELECT xmddseq,xmddseq1,xmddseq2 ",         #170517-00029#1-mark
   LET g_sql = "SELECT xmddseq,xmddseq1,xmddseq2,xmdd006 ",  #170517-00029#1-add
               "  FROM xmdd_t ",
               " WHERE xmddent = ",g_enterprise,
               "   AND xmdddocno = '",p_xmdadocno,"'",
               "   AND xmddseq = ? "
   PREPARE s_aic_carry_xmdd_pre3 FROM g_sql
   DECLARE s_aic_carry_xmdd_cs3 CURSOR FOR s_aic_carry_xmdd_pre3   
   
   LET g_sql = "SELECT xmda031,xmda034,xmda050,",
               "       xmdc028,xmdc029,xmdc030,",
               "       xmdc036,xmdc037,xmdc038,",
               "       xmdc049,xmdc057,",
               "       xmdc024,",  #170517-00029#1-add
               "       xmdcseq,'','',", 
               "       xmdc001,xmdc002,",
               "       xmdc006,xmdc007,xmdc012,",
               "       xmdc008,xmdc009", 
               "  FROM xmda_t,xmdc_t ",
               " WHERE xmdaent = xmdcent AND xmdadocno = xmdcdocno ",
               "   AND xmdcent = ",g_enterprise,
               "   AND xmdcdocno = '",p_xmdadocno,"'"
   #160523-00018#1-e
   PREPARE s_aic_carry_xmdd_pre FROM g_sql
   DECLARE s_aic_carry_xmdd_cs CURSOR FOR s_aic_carry_xmdd_pre
   
   INITIALIZE l_order.* TO NULL
   FOREACH s_aic_carry_xmdd_cs INTO l_order.xmda031,l_order.xmda034,l_order.xmda050,
                                    l_order.xmdc028,l_order.xmdc029,l_order.xmdc030,
                                    l_order.xmdc036,l_order.xmdc037,l_order.xmdc038,
                                    l_order.xmdc049,l_order.xmdc057,
                                    l_order.xmdc024,  #170517-00029#1-add
                                    l_order.xmddseq,l_order.xmddseq1,l_order.xmddseq2,
                                    l_order.xmdd001,l_order.xmdd002,
                                    l_order.xmdd004,l_order.xmdd006,l_order.xmdd011,
                                    l_order.xmdd024,l_order.xmdd025 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_xmdd_cs"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

         
      #塞sfaa_t
      INITIALIZE g_sfaa.* TO NULL
      LET g_sfaa.sfaasite = g_icab.icab003
     # LET g_sfaa.sfaadocdt = p_date  #C180709-09421#5---mark
     #C180709-09421#5---add---s
     #昆山委外采购抛转南通工单，工单日期取昆山来源委外采购单和昆山来源工单中日期较大的
      LET l_pmdldocdt = ''
      LET l_pmdlsite = ''
      LET l_sfaadocdt = ''
      #C20180713-09016#4---mod---s
#      SELECT pmdldocdt,MAX(sfaadocdt) INTO l_pmdldocdt,l_sfaadocdt
#         FROM sfaa_t,xmda_t,pmdp_t,pmdl_t
#         WHERE xmdaent = g_enterprise
#         AND xmdasite = 'NT'
#         AND xmdadocno = p_xmdadocno
#         AND xmda008 = pmdpdocno
#         AND pmdpent = xmdaent
#         AND pmdpsite = 'KS'
#         AND pmdp003 = sfaadocno
#         AND sfaaent = g_enterprise
#         AND sfaasite = pmdpsite
#         AND pmdlent = pmdpent 
#         AND pmdldocno = pmdpdocno
#         AND xmda008 = pmdpdocno
#      GROUP BY pmdldocdt
      LET l_pmdp003 = ''   #来源工单号
      SELECT pmdp003,pmdldocdt INTO l_pmdp003,l_pmdldocdt
        FROM xmda_t,xmdc_t,pmdp_t,pmdl_t
       WHERE xmdaent = xmdcent
         AND xmdadocno = xmdcdocno
         AND pmdlent = pmdpent
         AND pmdldocno = pmdpdocno
         AND xmdcent = pmdpent
         AND xmda008 = pmdpdocno
         AND xmdcseq = pmdpseq
         AND xmdaent = g_enterprise
         AND xmdcdocno = p_xmdadocno
         AND xmdcseq = l_order.xmddseq
      SELECT sfaadocdt INTO l_sfaadocdt 
        FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaadocno = l_pmdp003
      #C20180713-09016#4---mod---e
      IF l_pmdldocdt > = l_sfaadocdt THEN
         LET g_sfaa.sfaadocdt = l_pmdldocdt
      ELSE
         LET g_sfaa.sfaadocdt = l_sfaadocdt
      END IF
      IF cl_null(g_sfaa.sfaadocdt) THEN
         LET g_sfaa.sfaadocdt = p_date
      END IF
     #C180709-09421#5---add---e
      LET g_sfaa.sfaa001 = 0
      LET g_sfaa.sfaa002 = g_user
      LET g_sfaa.sfaa003 = '1'    #1一般工單  
      
      LET g_sfaa.sfaa004 = '1'    #1事前發料制
      #LET g_sfaa.sfaa005 = '2'    #2訂單   #160523-00018#1 mark
      #LET g_sfaa.sfaa005 = '1'    #1:MULTI #160523-00018#1 add  #170517-00029#1-mark 改用判斷的方式
      #170517-00029#1-s-add
      #判斷是否為多交期(Y->MULTI；N->訂單)
      IF l_order.xmdc024 = 'Y' THEN
         LET g_sfaa.sfaa005 = '1'    #1:MULTI
      ELSE
         LET g_sfaa.sfaa005 = '2'    #2訂單
         LET l_order.xmddseq1 = '1'  #項序
         LET l_order.xmddseq2 = '1'  #分批序
      END IF
      #170517-00029#1-e-add
      
      LET g_sfaa.sfaa006 = p_xmdadocno
      LET g_sfaa.sfaa007 = l_order.xmddseq   
      LET g_sfaa.sfaa008 = l_order.xmddseq1  
      LET g_sfaa.sfaa009 = l_order.xmda034
      

      LET g_sfaa.sfaa010 = l_order.xmdd001  
      LET g_sfaa.sfaa012 = l_order.xmdd006  
      LET g_sfaa.sfaa013 = l_order.xmdd004  
#      LET g_sfaa.sfaa020 = l_order.xmdd011  #C20180713-09016#4---mark---
     #C20180713-09016#4---s---
     #昆山委外采购抛转南通工单，生成的南通的工单的【预计完工日期】的取值：取昆山工单的预计完工日期
     #                        生成的南通的工单的【预计开工日期】的取值：取昆山工单预计开工日期和委外采购单审核日期，两者的最大值
      LET l_pmdlcnfdt = '' #委外采购单审核日期
      LET l_pmdp003 = ''   #来源工单号
      SELECT pmdp003,pmdlcnfdt INTO l_pmdp003,l_pmdlcnfdt
        FROM xmda_t,xmdc_t,pmdp_t,pmdl_t
       WHERE xmdaent = xmdcent
         AND xmdadocno = xmdcdocno
         AND pmdlent = pmdpent
         AND pmdldocno = pmdpdocno
         AND xmdcent = pmdpent
         AND xmda008 = pmdpdocno
         AND xmdcseq = pmdpseq
         AND xmdaent = g_enterprise
         AND xmdcdocno = p_xmdadocno
         AND xmdcseq = l_order.xmddseq
      SELECT sfaa019,sfaa020 INTO l_sfaa019,l_sfaa020 
        FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaadocno = l_pmdp003
      LET g_sfaa.sfaa020 = l_sfaa020
      IF l_pmdlcnfdt > = l_sfaa019 THEN
         LET g_sfaa.sfaa019 = l_pmdlcnfdt
      ELSE
         LET g_sfaa.sfaa019 = l_sfaa019
      END IF
     #C20180713-09016#4---e---
     
      LET g_sfaa.sfaa028 = l_order.xmdc036
      LET g_sfaa.sfaa029 = l_order.xmdc037
      LET g_sfaa.sfaa030 = l_order.xmdc038
      LET g_sfaa.sfaa031 = l_order.xmdc049
      
      LET g_sfaa.sfaa034 = l_order.xmdc028
      LET g_sfaa.sfaa035 = l_order.xmdc029

      LET g_sfaa.sfaa038 = 'N'
      LET g_sfaa.sfaa039 = 'N'
      LET g_sfaa.sfaa040 = 'N'
      LET g_sfaa.sfaa041 = 'N'
      LET g_sfaa.sfaa042 = 'N'
      LET g_sfaa.sfaa043 = 'N'
      LET g_sfaa.sfaa044 = 'N'

      LET g_sfaa.sfaa049 = 0
      LET g_sfaa.sfaa050 = 0
      LET g_sfaa.sfaa051 = 0
      LET g_sfaa.sfaa052 = 0
      LET g_sfaa.sfaa053 = 0
      LET g_sfaa.sfaa054 = 0
      LET g_sfaa.sfaa055 = 0
      LET g_sfaa.sfaa056 = 0
      LET g_sfaa.sfaa057 = '2'    #2委外
      LET g_sfaa.sfaa058 = l_order.xmdd025   
      
      LET g_sfaa.sfaa059 = l_order.xmdc030
      LET g_sfaa.sfaa060 = l_order.xmdd024   
      
      LET g_sfaa.sfaa061 = 'N'
      LET g_sfaa.sfaa062 = 'N'
      LET g_sfaa.sfaa063 = l_order.xmddseq2 
      LET g_sfaa.sfaa064 = l_order.xmddseq2  
      
      
      LET g_sfaa.sfaa065 = '0'               #0.未结案
      LET g_sfaa.sfaa066 = l_order.xmda050
      LET g_sfaa.sfaa067 = l_order.xmda031
      LET g_sfaa.sfaa071 = 0                 #160425-00019 by whitney add 齊料套數

      LET g_sfaa.sfaaownid = g_user
      LET g_sfaa.sfaaowndp = g_dept
      LET g_sfaa.sfaacrtid = g_user
      LET g_sfaa.sfaacrtdp = g_dept
      LET g_sfaa.sfaacrtdt = cl_get_current()
      LET g_sfaa.sfaastus = 'N'

      #自動產生委外工單單號sfaadocno
      IF NOT cl_null(g_icac.icac014) THEN
         CALL s_aic_carry_docno(p_xmdadocno,g_sfaa.sfaasite,g_icac.icac014,g_sfaa.sfaadocdt,'asft300')
         RETURNING r_success,g_sfaa.sfaadocno
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
      ELSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = 'aic-00165'   #流程代碼%1站別%2之委外工單單別為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
         
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #預設BOM特性
      SELECT imae037
        INTO g_sfaa.sfaa011
        FROM imae_t
       WHERE imaeent = g_enterprise
         AND imaesite = g_sfaa.sfaasite
         AND imae001 = g_sfaa.sfaa010 #料件編號

      IF p_final = 'Y' THEN
         LET g_sfaa.sfaa017 = p_pmdl052
      ELSE
         #傳入值"下站營運據點"之"據點對應客戶/廠商編號"
         CALL s_aic_carry_get_ooef024(p_nextsite)
         RETURNING r_success,g_sfaa.sfaa017
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
      END IF
      #C20180713-09016#4---mark---s
#      #由"預計完工日"倒推"預計開工日"
#      CALL s_aic_carry_calculate_startdate(g_sfaa.sfaasite,'2',g_sfaa.sfaa010,g_sfaa.sfaa012,g_sfaa.sfaa020)
#      RETURNING r_success,g_sfaa.sfaa019
#      IF NOT r_success THEN
#         EXIT FOREACH
#      END IF
      #C20180713-09016#4---mark---e
      
      #C200917-01626#1 add by pane 200917 begin#
      LET l_slip = ''
      CALL s_aooi200_get_slip(g_sfaa.sfaadocno) RETURNING r_success,l_slip
      LET g_sfaa.sfaa003 = s_aooi200_get_doc_default(g_site,'1',l_slip,'sfaa003',g_sfaa.sfaa003)
      IF cl_null(g_sfaa.sfaa003) THEN
         LET g_sfaa.sfaa003 = '1' 
      END IF
      #C200917-01626#1add by pane 200917 end#
      
      INSERT INTO sfaa_t(sfaaent,sfaasite,sfaadocno,sfaadocdt,
                         sfaa001,sfaa002,sfaa003,sfaa004,sfaa005,
                         sfaa006,sfaa007,sfaa008,sfaa009,sfaa010,
                         sfaa011,sfaa012,sfaa013,sfaa014,sfaa015,
                         sfaa016,sfaa017,sfaa018,sfaa019,sfaa020,
                         sfaa021,sfaa022,sfaa023,sfaa024,sfaa025,
                         sfaa026,sfaa027,sfaa028,sfaa029,sfaa030,
                         sfaa031,sfaa032,sfaa033,sfaa034,sfaa035,
                         sfaa036,sfaa037,sfaa038,sfaa039,sfaa040,
                         sfaa041,sfaa042,sfaa043,sfaa044,sfaa045,
                         sfaa046,sfaa047,sfaa048,sfaa049,sfaa050,
                         sfaa051,sfaa052,sfaa053,sfaa054,sfaa055,
                         sfaa056,sfaa057,sfaa058,sfaa059,sfaa060,
                         sfaa061,sfaa062,sfaa063,sfaa064,sfaa065,
                         sfaa066,sfaa067,sfaa068,
                         sfaaownid,sfaaowndp,
                         sfaacrtid,sfaacrtdp,sfaacrtdt,
                         sfaamodid,sfaamoddt,
                         sfaacnfid,sfaacnfdt,
                         sfaapstid,sfaapstdt,
                         sfaastus)
      VALUES (g_enterprise,g_sfaa.sfaasite,g_sfaa.sfaadocno,g_sfaa.sfaadocdt,
              g_sfaa.sfaa001,g_sfaa.sfaa002,g_sfaa.sfaa003,g_sfaa.sfaa004,g_sfaa.sfaa005,
              g_sfaa.sfaa006,g_sfaa.sfaa007,g_sfaa.sfaa008,g_sfaa.sfaa009,g_sfaa.sfaa010,
              g_sfaa.sfaa011,g_sfaa.sfaa012,g_sfaa.sfaa013,g_sfaa.sfaa014,g_sfaa.sfaa015,
              g_sfaa.sfaa016,g_sfaa.sfaa017,g_sfaa.sfaa018,g_sfaa.sfaa019,g_sfaa.sfaa020,
              g_sfaa.sfaa021,g_sfaa.sfaa022,g_sfaa.sfaa023,g_sfaa.sfaa024,g_sfaa.sfaa025,
              g_sfaa.sfaa026,g_sfaa.sfaa027,g_sfaa.sfaa028,g_sfaa.sfaa029,g_sfaa.sfaa030,
              g_sfaa.sfaa031,g_sfaa.sfaa032,g_sfaa.sfaa033,g_sfaa.sfaa034,g_sfaa.sfaa035,
              g_sfaa.sfaa036,g_sfaa.sfaa037,g_sfaa.sfaa038,g_sfaa.sfaa039,g_sfaa.sfaa040,
              g_sfaa.sfaa041,g_sfaa.sfaa042,g_sfaa.sfaa043,g_sfaa.sfaa044,g_sfaa.sfaa045,
              g_sfaa.sfaa046,g_sfaa.sfaa047,g_sfaa.sfaa048,g_sfaa.sfaa049,g_sfaa.sfaa050,
              g_sfaa.sfaa051,g_sfaa.sfaa052,g_sfaa.sfaa053,g_sfaa.sfaa054,g_sfaa.sfaa055,
              g_sfaa.sfaa056,g_sfaa.sfaa057,g_sfaa.sfaa058,g_sfaa.sfaa059,g_sfaa.sfaa060,
              g_sfaa.sfaa061,g_sfaa.sfaa062,g_sfaa.sfaa063,g_sfaa.sfaa064,g_sfaa.sfaa065,
              g_sfaa.sfaa066,g_sfaa.sfaa067,g_sfaa.sfaa068,
              g_sfaa.sfaaownid,g_sfaa.sfaaowndp,
              g_sfaa.sfaacrtid,g_sfaa.sfaacrtdp,g_sfaa.sfaacrtdt,
              g_sfaa.sfaamodid,g_sfaa.sfaamoddt,
              g_sfaa.sfaacnfid,g_sfaa.sfaacnfdt,
              g_sfaa.sfaapstid,g_sfaa.sfaapstdt,
              g_sfaa.sfaastus)

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:sfaa_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      FOREACH s_aic_carry_xmdd_cs3 USING l_order.xmddseq INTO l_xmddseq,l_xmddseq1,l_xmddseq2,l_xmdd006  #160523-00018#1 add

         #塞sfab_t
         INITIALIZE g_sfab.* TO NULL
         LET g_sfab.sfabsite = g_sfaa.sfaasite
         LET g_sfab.sfabdocno = g_sfaa.sfaadocno
         LET g_sfab.sfab001 = '2' 
         LET g_sfab.sfab002 = p_xmdadocno
        #160523-00018#1-s-mark 
        #LET g_sfab.sfab003 = l_order.xmddseq
        #LET g_sfab.sfab004 = l_order.xmddseq1
        #LET g_sfab.sfab005 = l_order.xmddseq2
        #160523-00018#1-e-mark 
        #160523-00018#1-s-add
         LET g_sfab.sfab003 = l_xmddseq
         LET g_sfab.sfab004 = l_xmddseq1
         LET g_sfab.sfab005 = l_xmddseq2
        #160523-00018#1-e-add         
         LET g_sfab.sfab006 = 10
        #LET g_sfab.sfab007 = g_sfaa.sfaa012   #160523-00018#1 mark
         LET g_sfab.sfab007 = l_xmdd006        #160523-00018#1 add
         
         SELECT MAX(sfabseq)+1 INTO g_sfab.sfabseq
           FROM sfab_t
          WHERE sfabent = g_enterprise
            AND sfabdocno = g_sfaa.sfaadocno
         
         IF cl_null(g_sfab.sfabseq) THEN
            LET g_sfab.sfabseq = 1
         END IF
         
         INSERT INTO sfab_t(sfabent,sfabsite,sfabdocno,sfabseq,
                            sfab001,sfab002,sfab003,sfab004,sfab005,
                            sfab006,sfab007)
         VALUES (g_enterprise,g_sfab.sfabsite,g_sfab.sfabdocno,g_sfab.sfabseq,
                 g_sfab.sfab001,g_sfab.sfab002,g_sfab.sfab003,g_sfab.sfab004,g_sfab.sfab005,
                 g_sfab.sfab006,g_sfab.sfab007)
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:sfab_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH       #160523-00018#1 add
      #塞sfac_t
      #160310-00020#1---mark----begin---
      #xmdc057是库存管理特征栏位，而sfac006是产品特征，传入值错误
      #CALL s_aic_carry_ins_sfac(l_order.xmdc057) RETURNING r_success 
      #160310-00020#1---mark----end---
      CALL s_aic_carry_ins_sfac(l_order.xmdd002) RETURNING r_success  #160310-00020#1 add
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      #自動產生工單備料單身sfba_t
      CALL s_aic_carry_ins_sfba() RETURNING r_success
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      #C190628-06857#1---add---s
      #多角委外工单若单身作业编号为空，则更新为工单单身其他项的作业编号
      CALL s_aic_carry_upd_sfba003() RETURNING r_success
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      #C190628-06857#1---add---e
      
      #工單確認(包含檢查、產生工單製程sfca,sfcb)
      CALL s_aic_carry_sfaa_conf() RETURNING r_success
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      #無條件將狀態碼更新為F.發放
      UPDATE sfaa_t SET sfaastus = 'F' 
       WHERE sfaaent = g_enterprise 
         AND sfaadocno = g_sfaa.sfaadocno

      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE:sfaa_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #紀錄已完成之工單
      IF l_sfaadocno = '1=1' THEN
         LET l_sfaadocno = "('",g_sfaa.sfaadocno,"'"
      ELSE
         LET l_sfaadocno = l_sfaadocno,",'",g_sfaa.sfaadocno,"'"
      END IF

   END FOREACH   

   IF NOT l_sfaadocno = '1=1' THEN
      LET l_sfaadocno = l_sfaadocno,")"
   END IF

   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #產生委外採購單
   LET l_prog = g_prog     #備份作業編號
   LET g_prog = 'apmt501'  #委外採購單

   IF p_final = 'N' THEN
      #中間站
      CALL s_aic_carry_gen_tri_po(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_date,p_icab001,p_icab002)
      RETURNING r_success,r_pmdldocno
   ELSE
      #最終站
      CALL s_aic_carry_gen_last_po(p_xmdadocno,p_pmdl052,p_date,p_icab001,p_icab002)
      RETURNING r_success,r_pmdldocno
   END IF
   
   LET g_prog = l_prog     #還原作業編號

   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF
   
   #r_pmdldocno為產生之採購單號
   RETURN r_success,r_pmdldocno   
END FUNCTION

#預設sfac資料由s_aic_carry_gen_tri_wo呼叫
#參考asft300_ins_sfac
PRIVATE FUNCTION s_aic_carry_ins_sfac(p_sfac006)
   DEFINE p_sfac006  LIKE sfac_t.sfac006  #產品特徵
   DEFINE r_success  LIKE type_t.num5     #執行結果
   DEFINE l_sql1     STRING
   DEFINE l_sql2     STRING
   DEFINE l_sql3     STRING
   DEFINE l_n        LIKE type_t.num5
   DEFINE l_last_len LIKE oofi_t.oofi002                   #C20190422-07783 ADD
   DEFINE l_last_len1 LIKE oofi_t.oofi002                  #C20190422-07783 ADD
   DEFINE l_success1  LIKE type_t.num5                     #C20190422-07783 ADD
   DEFINE l_sfaa015       DATETIME YEAR TO SECOND          #161219-00007#1 add
   DEFINE l_sfaa015_1     LIKE type_t.chr20    #BOM有效日期 #161219-00007#1 add   
   WHENEVER ERROR CONTINUE

   IF cl_null(p_sfac006) THEN
      LET p_sfac006 = ' '
   END IF

   LET r_success = TRUE

   #当p_date为null时，bom有效日期为当前日期
    IF cl_null(g_sfaa.sfaa015) THEN
       LET l_sfaa015 = cl_get_current()
       LET l_sfaa015_1 = l_sfaa015
    ELSE
       LET l_sfaa015 = g_sfaa.sfaa015
       LET l_sfaa015_1 = l_sfaa015
    END IF
   #161219-00007#1 ---add (e)---

   LET l_sql1 = "SELECT UNIQUE '','2',bmab003,' ',bmab004*",g_sfaa.sfaa012/100,",'',0",
                "  FROM bmab_t WHERE bmabent = ",g_enterprise,
                "   AND bmabsite = '",g_sfaa.sfaasite,"' AND bmab001 = '",g_sfaa.sfaa010,"' AND bmab002 = '",g_sfaa.sfaa011,"'"
                   ,"   AND to_char(bmab005,'YYYY-MM-DD hh24:mi:ss')<= '",l_sfaa015_1,"'",                    #161219-00007#1 add
                   "   AND (bmab006 IS NULL OR to_char(bmab006,'YYYY-MM-DD hh24:mi:ss')> '",l_sfaa015_1,"') " #161219-00007#1 add                
                
   LET l_sql2 = "SELECT UNIQUE '','3',bmad003,' ',bmad004*",g_sfaa.sfaa012,",bmad005,0",
                "  FROM bmad_t WHERE bmadent = ",g_enterprise,
                "   AND bmadsite = '",g_sfaa.sfaasite,"' AND bmad001 = '",g_sfaa.sfaa010,"' AND bmad002 = '",g_sfaa.sfaa011,"'"
                   ,"   AND to_char(bmad006,'YYYY-MM-DD hh24:mi:ss')<= '",l_sfaa015_1,"' ",                   #161219-00007#1 add
                   "   AND (bmad007 IS NULL OR to_char(bmad007,'YYYY-MM-DD hh24:mi:ss')> '",l_sfaa015_1,"') " #161219-00007#1 add                
                
   LET l_sql3 = "SELECT UNIQUE '','5',bmac003,' ',bmac005/bmac006*",g_sfaa.sfaa012,",bmac004,0",
                "  FROM bmac_t WHERE bmacent = ",g_enterprise,
                "   AND bmacsite = '",g_sfaa.sfaasite,"' AND bmac001 = '",g_sfaa.sfaa010,"' AND bmac002 = '",g_sfaa.sfaa011,"'"
                   ,"   AND to_char(bmac007,'YYYY-MM-DD hh24:mi:ss')<= '",l_sfaa015_1,"' ",                   #161219-00007#1 add
                   "   AND (bmac008 IS NULL OR to_char(bmac008,'YYYY-MM-DD hh24:mi:ss')> '",l_sfaa015_1,"') " #161219-00007#1 add                
                
   LET g_sql = l_sql1," UNION ",l_sql2," UNION ",l_sql3
   PREPARE s_aic_carry_sfac_pre FROM g_sql
   DECLARE s_aic_carry_sfac_cs CURSOR FOR s_aic_carry_sfac_pre
   FREE s_aic_carry_sfac_pre
   
   LET l_n = 0
   SELECT COUNT(*) INTO l_n 
     FROM bmad_t
    WHERE bmadent = g_enterprise
      AND bmadsite = g_sfaa.sfaasite
      AND bmad001 = g_sfaa.sfaa010
      AND bmad002 = g_sfaa.sfaa011

   INITIALIZE g_sfac.* TO NULL
   IF l_n = 0 OR g_sfaa.sfaa003 = '3' THEN    #拆件式工单只产生‘一般’资料，不产生联产品、副产品、多产出主件
      SELECT MAX(sfacseq)+1 INTO g_sfac.sfacseq
        FROM sfac_t
       WHERE sfacent = g_enterprise
         AND sfacsite = g_sfaa.sfaasite
         AND sfacdocno= g_sfaa.sfaadocno

      IF cl_null(g_sfac.sfacseq) THEN
         LET g_sfac.sfacseq = 1
      END IF

      LET g_sfac.sfacsite = g_sfaa.sfaasite
      LET g_sfac.sfacdocno = g_sfaa.sfaadocno
      LET g_sfac.sfac001 = g_sfaa.sfaa010
      LET g_sfac.sfac002 = '1'
      LET g_sfac.sfac003 = g_sfaa.sfaa012
      LET g_sfac.sfac004 = g_sfaa.sfaa013
      LET g_sfac.sfac005 = 0
      LET g_sfac.sfac006 = p_sfac006
      #C20190404-07783---S
      IF g_sfac.sfac002 = '1'  THEN
         LET g_sfac.sfacud001 = g_sfaa.sfaa059
      END IF
      #C20190404-07783---E          
      INSERT INTO sfac_t(sfacent,sfacsite,sfacdocno,sfacseq,
                         sfac001,sfac002,sfac003,sfac004,sfac005,sfac006,sfacud001)  #C20190404-07783 ADD sfacud001
      VALUES(g_enterprise,g_sfac.sfacsite,g_sfaa.sfaadocno,g_sfac.sfacseq,
             g_sfac.sfac001,g_sfac.sfac002,g_sfac.sfac003,g_sfac.sfac004,g_sfac.sfac005,g_sfac.sfac006,g_sfac.sfacud001) #C20190404-07783 ADD sfacud001
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:sfac_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()      
      
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   IF g_sfaa.sfaa003 != '3' THEN   #拆件式工单只产生‘一般’资料，不产生联产品、副产品、多产出主件
      FOREACH s_aic_carry_sfac_cs INTO g_sfac.sfacseq,g_sfac.sfac002,g_sfac.sfac001,g_sfac.sfac006,
                                       g_sfac.sfac003,g_sfac.sfac004,g_sfac.sfac005
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_sfac_cs"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         IF cl_null(g_sfac.sfac001) THEN
            CONTINUE FOREACH
         END IF

         SELECT MAX(sfacseq)+1 INTO g_sfac.sfacseq 
           FROM sfac_t
          WHERE sfacent = g_enterprise 
            AND sfacsite = g_sfaa.sfaasite
            AND sfacdocno= g_sfaa.sfaadocno

         IF cl_null(g_sfac.sfacseq) THEN
            LET g_sfac.sfacseq = 1
         END IF

         IF cl_null(g_sfac.sfac004) THEN
            SELECT bmaa004 INTO g_sfac.sfac004 
              FROM bmaa_t 
             WHERE bmaaent = g_enterprise 
               AND bmaasite = g_sfaa.sfaasite 
               AND bmaa001 = g_sfaa.sfaa010
               AND bmaa002 = g_sfaa.sfaa011
            #170814-00030#1 add --(S)--
            #因聯產品的設定是依比例,因此單位應與生產單位相同
            IF g_sfac.sfac002 = '2' THEN
               LET g_sfac.sfac004 = g_sfaa.sfaa013
            END IF
            #170814-00030#1 add --(E)--               
         END IF
         #C20190404-07783---S
         IF g_sfac.sfac002 = '1'  THEN
            LET g_sfac.sfacud001 = g_sfaa.sfaa059
         END IF
         #C20190404-07783---E 
         #C20190422-07783--S--联产品自动编号，原则：前5码与工单尾前5码相同，第6码放9，7~9码为流水码
         IF g_sfac.sfac002 = '2' THEN          
            SELECT substr(g_sfaa.sfaadocno,-9) INTO l_last_len FROM dual #截取工单后9码
            SELECT substr(l_last_len,0,5) INTO l_last_len1 FROM dual
            LET l_last_len1 = l_last_len1,'9'
            CALL cs_aooi390_get_auto_no(l_last_len1) RETURNING l_success1,g_sfac.sfacud001       
         END IF            
         #C20190422-07783--E--联产品自动编号，原则：前5码与工单尾前5码相同，第6码放9，7~9码为流水码          
         INSERT INTO sfac_t(sfacent,sfacsite,sfacdocno,sfacseq,
                            sfac001,sfac002,sfac003,sfac004,sfac005,sfac006,sfacud001)  #C20190404-07783 ADD sfacud001
         VALUES(g_enterprise,g_sfac.sfacsite,g_sfaa.sfaadocno,g_sfac.sfacseq,
                g_sfac.sfac001,g_sfac.sfac002,g_sfac.sfac003,g_sfac.sfac004,g_sfac.sfac005,g_sfac.sfac006,g_sfac.sfacud001)  #C20190404-07783 ADD sfacud001
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:sfac_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()      
      
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      
         IF g_sfac.sfac002 = '2' THEN
            #產品特徵
            UPDATE sfac_t
               SET sfac006 = p_sfac006
             WHERE sfacent = g_enterprise
               AND sfacsite = g_sfaa.sfaasite 
               AND sfacdocno = g_sfaa.sfaadocno
               AND sfac002 = '2'      
               AND sfacseq = g_sfac.sfacseq

            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:sfac_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()            
            
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            
            UPDATE sfac_t
               SET sfac003 = sfac003 - g_sfac.sfac003
             WHERE sfacent = g_enterprise
               AND sfacsite = g_sfaa.sfaasite 
               AND sfacdocno = g_sfaa.sfaadocno
               AND sfac002 = '1'
               AND sfac006 = p_sfac006

            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:sfac_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()            
            
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            
         ELSE
            UPDATE sfac_t
               SET sfac003 = sfac003 - g_sfac.sfac003
             WHERE sfacent = g_enterprise
               AND sfacsite = g_sfaa.sfaasite
               AND sfacdocno = g_sfaa.sfaadocno
               AND sfac002 = '1'

            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:sfac_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()            
            
               LET r_success = FALSE
               EXIT FOREACH
            END IF          
         
         END IF
      END FOREACH
      
      IF NOT r_success THEN
         RETURN r_success
      END IF
   END IF

   RETURN r_success      
END FUNCTION

#自動產生工單備料單身由s_aic_carry_gen_tri_wo呼叫
#因該應用元件使用g_site故需先改為當前營運據點
PRIVATE FUNCTION s_aic_carry_ins_sfba()
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_site      LIKE sfaa_t.sfaasite   #備份營運據點
   DEFINE l_num       LIKE type_t.num5
   DEFINE l_prog_o    LIKE type_t.chr30 #170618-00384#1 add 存g_prog舊值
   
   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = g_sfaa.sfaasite  #將g_site替換成當站營運據點
   #170618-00384#1 --s add
   LET l_prog_o = g_prog 
   LET g_prog = 'asft300'
   #170618-00384#1 --e add
   CALL s_asft300_02(g_sfaa.sfaadocno,g_sfaa.sfaa003,g_sfaa.sfaa010,g_sfaa.sfaa011,g_sfaa.sfaa015,g_sfaa.sfaa012,'N')
   RETURNING r_success,l_num
   LET g_prog = l_prog_o #170618-00384#1 add 

   LET g_site = l_site           #還原g_site

   RETURN r_success
END FUNCTION

#工單確認(包含檢查、產生工單製程sfca,sfcb)由s_aic_carry_gen_tri_wo呼叫
#因該應用元件使用g_site故需先改為當前營運據點
PRIVATE FUNCTION s_aic_carry_sfaa_conf()
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_site      LIKE sfaa_t.sfaasite   #備份營運據點

   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = g_sfaa.sfaasite  #將g_site替換成當站營運據點

   CALL s_asft300_01_confirm(g_sfaa.sfaadocno)
   RETURNING r_success

   LET g_site = l_site           #還原g_site

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 自動產生收貨入庫單or倉退單並自動確認、過帳
# Memo...........: 請依照順序CALL
#                  CALL s_tax_recount_tmp()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_gen_tri_mr()
#                  CALL s_transaction_end(Y,0)
# Usage..........: CALL s_aic_carry_gen_tri_mr(p_firstdocno,p_xmdkdocno,p_pmdsdocno,p_date,p_icab001,p_icab002,p_type,p_nextsite)
#                  RETURNING r_success,r_pmdsdocno
# Input parameter: p_firstdocno  LIKE pmds_t.pmdsdocno  #初始入庫/倉退單號 OR 初始出貨/簽收/銷退單號
#                : p_xmdkdocno   LIKE xmdk_t.xmdkdocno  #來源出貨/簽收/銷退單號
#                : p_pmdsdocno   LIKE pmds_t.pmdsdocno  #來源入庫/倉退單號
#                : p_date        LIKE xmdk_t.xmdkdocdt  #日期
#                : p_icab001     LIKE icab_t.icab001    #流程代碼
#                : p_icab002     LIKE icab_t.icab002    #站別
#                : p_type        LIKE type_t.chr20      #拋轉類型(Null、aicp900、aicp950)
#                : p_nextsite    LIKE icab_t.icabsite   #供應商營運據點(aicp900、aicp950使用)
# Return code....: r_success     LIKE type_t.num5       #執行結果
#                : r_pmdsdocno   LIKE pmds_t.pmdsdocno  #產生之收貨單/倉退單號
# Date & Author..: 141125 By earl
# Modify.........: 150917-00001#4 151111 earl 修改傳入參數，增加製造批序號拋轉
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_mr(p_firstdocno,p_xmdkdocno,p_pmdsdocno,p_date,p_icab001,p_icab002,p_type,p_nextsite)
   DEFINE l_icaduc004 like icaduc_t.icaduc004
   DEFINE p_firstdocno  LIKE pmds_t.pmdsdocno #初始入庫/倉退單號 OR 初始出貨/簽收/銷退單號 
   DEFINE p_xmdkdocno   LIKE xmdk_t.xmdkdocno #來源出貨/簽收/銷退單號
   DEFINE p_pmdsdocno   LIKE pmds_t.pmdsdocno #來源入庫/倉退單號
   DEFINE p_date        LIKE xmdk_t.xmdkdocdt #日期
   DEFINE p_icab001     LIKE icab_t.icab001   #流程代碼
   DEFINE p_icab002     LIKE icab_t.icab002   #站別
   DEFINE p_type        LIKE type_t.chr20     #拋轉類型(可為Null、aicp900、aicp950)
   DEFINE p_nextsite    LIKE icab_t.icabsite  #供應商營運據點(aicp900、aicp950使用)
   DEFINE r_success     LIKE type_t.num5       #執行結果
   DEFINE r_pmdsdocno   LIKE pmds_t.pmdsdocno  #產生之收貨單號   
   DEFINE l_pmdt025     LIKE pmdt_t.pmdt025    #160902-00008#1 add
   DEFINE l_xmdl        RECORD LIKE xmdl_t.*
   DEFINE l_xmdm        RECORD LIKE xmdm_t.*

   DEFINE l_pmdldocno   LIKE pmdl_t.pmdldocno
   DEFINE l_pmdsdocno   LIKE pmds_t.pmdsdocno #151103 earl add
   DEFINE l_xmdkdocdt   LIKE xmdk_t.xmdkdocdt
   DEFINE l_pmdn001     LIKE pmdn_t.pmdn001   #cws 2017.12.29   
   
   DEFINE l_xmdk     RECORD
      xmdk000           LIKE xmdk_t.xmdk000,
      xmdk001           LIKE xmdk_t.xmdk001,   #161024-00037#1 add
      xmdkdocdt         LIKE xmdk_t.xmdkdocdt, #161024-00037#1 add
      xmdk005           LIKE xmdk_t.xmdk005,   #151103 earl add
      xmdk006           LIKE xmdk_t.xmdk006,
      xmdk009           LIKE xmdk_t.xmdk009,   #170623-00003#1-add
      xmdk016           LIKE xmdk_t.xmdk016,
      xmdk035           LIKE xmdk_t.xmdk035,
      xmdk044           LIKE xmdk_t.xmdk044,
      xmdk054           LIKE xmdk_t.xmdk054,  #170817-00043#5 add 
      xmdk082           LIKE xmdk_t.xmdk082   #151113 earl add 銷退方式
                     END RECORD
                     
   DEFINE l_xmdadocdt   LIKE xmda_t.xmdadocdt

   DEFINE l_xrcd103     LIKE xrcd_t.xrcd103
   DEFINE l_xrcd104     LIKE xrcd_t.xrcd104
   DEFINE l_xrcd105     LIKE xrcd_t.xrcd105
   
   DEFINE l_pmal002     LIKE pmdl_t.pmdl002
   DEFINE l_success     LIKE type_t.num5
   
   DEFINE l_imaf091     LIKE imaf_t.imaf091
   DEFINE l_imaf092     LIKE imaf_t.imaf092
   
   DEFINE l_inao013     LIKE inao_t.inao013  #150917-00001#4 151113 earl add
   
   DEFINE l_pjaa013     LIKE pjaa_t.pjaa013  #160316-00023#2 add
   DEFINE l_pmdt088     LIKE pmdt_t.pmdt088  #170817-00043#5 add
   DEFINE l_xmdk009     LIKE xmdk_t.xmdk009      #收貨客戶  180316-00044#1 Add By 06137  180320
   DEFINE l_pmdn028     LIKE pmdn_t.pmdn028  #C20190306-07783 ADD 库位
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_pmdsdocno = ''

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdsdocno
   END IF

  #170816-00007#31 -S mark
  #IF cl_null(p_firstdocno) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdsdocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_firstdocno) THEN
      LET g_colname_1 = cl_getmsg("sub-01492",g_dlang)   #初始單據
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1   #站別
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
      RETURN r_success,r_pmdsdocno
   END IF
  #170816-00007#31 -E add
   
   #來源入庫單號與來源出貨單號皆不為空白的情況不會存在
   IF cl_null(p_xmdkdocno) AND cl_null(p_pmdsdocno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "sub-00050"   #傳入值有誤
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_pmdsdocno   
   END IF

   IF NOT cl_null(p_type) THEN
      IF cl_null(p_nextsite) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "sub-00050"   #傳入值有誤
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success,r_pmdsdocno
      END IF

      IF p_type <> 'aicp950' AND p_type <> 'aicp900' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "sub-00050"   #傳入值有誤
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         RETURN r_success,r_pmdsdocno
      END IF
   END IF

   #日期若為Null帶入g_today
   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF

   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
   CALL s_aic_carry_get_ica(p_icab001,p_icab002)

   #塞pmds_t
   INITIALIZE g_pmds.* TO NULL
   LET g_pmds.pmdsent = g_enterprise
   LET g_pmds.pmdssite = g_icab.icab003
   
   #LET g_pmds.pmdsdocdt = p_date  #161024-00037#1 mark
   #LET g_pmds.pmds001 = p_date    #161024-00037#1 mark
   
   LET g_pmds.pmds014 = '6'  #中間交易

   LET g_pmds.pmds021 = 'N'  #LC進口
   
   LET g_pmds.pmds036 = '1'  #交易類型
   
   LET g_pmds.pmds050 = 'Y'  #多角貿易已拋轉

   LET g_pmds.pmdsownid = g_user
   LET g_pmds.pmdsowndp = g_dept
   LET g_pmds.pmdscrtid = g_user
   LET g_pmds.pmdscrtdp = g_dept
   LET g_pmds.pmdscrtdt = cl_get_current()
   LET g_pmds.pmdsstus = 'N'

   INITIALIZE l_xmdk.* TO NULL
   #抓來源單號
   IF NOT cl_null(p_xmdkdocno) THEN
      #抓取出貨單、銷退單資訊
      SELECT xmdk000,xmdk005,xmdk006,
             xmdk016,xmdk035,
             xmdkdocdt,xmdk001,                #161024-00037#1 add 
             xmdk044,xmdk082
             ,xmdk054        #170817-00043#5 add 
        INTO l_xmdk.xmdk000,l_xmdk.xmdk005,l_xmdk.xmdk006,
             l_xmdk.xmdk016,l_xmdk.xmdk035,
             l_xmdk.xmdkdocdt,l_xmdk.xmdk001,  #161024-00037#1 add 
             l_xmdk.xmdk044,l_xmdk.xmdk082
             ,l_xmdk.xmdk054 #170817-00043#5 add 
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_xmdkdocno
   ELSE
      #初始入庫單號(aicp400正拋,aicp950)
      SELECT pmds000,pmds006,
             pmds037,pmds041,
             pmdsdocdt,pmds001,                #161024-00037#1 add
             pmds009,        #170623-00003#1-add
             pmds053,pmds100
             ,pmds045        #170817-00043#5 add 
        INTO l_xmdk.xmdk000,l_xmdk.xmdk006,
             l_xmdk.xmdk016,l_xmdk.xmdk035,
             l_xmdk.xmdkdocdt,l_xmdk.xmdk001,  #161024-00037#1 add
             l_xmdk.xmdk009, #170623-00003#1-add
             l_xmdk.xmdk044,l_xmdk.xmdk082
             ,l_xmdk.xmdk054 #170817-00043#5 add 
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmdsdocno = p_pmdsdocno
      
      LET l_xmdk.xmdk005 = l_xmdk.xmdk006
      
      IF l_xmdk.xmdk000 = '7' OR        #7.採購倉退維護作業
         l_xmdk.xmdk000 = '14' OR       #14.委外採購倉退
         l_xmdk.xmdk000 = '15' THEN     #15.重覆性生產委外採購倉退作業
         
         LET l_xmdk.xmdk000 = '6'   #產生倉退單
      ELSE
         LET l_xmdk.xmdk000 = '1'   #產生採購收貨入庫單
      END IF
      
   END IF
   LET g_pmds.pmdsdocdt = l_xmdk.xmdkdocdt  #161024-00037#1 add
   LET g_pmds.pmds001 = l_xmdk.xmdk001      #161024-00037#1 add
   #多角序號
   LET g_pmds.pmds041 = l_xmdk.xmdk035
   #多角流程代碼
   LET g_pmds.pmds053 = l_xmdk.xmdk044
   #170817-00043#5 --s add
   #單頭備註
   LET g_pmds.pmds045 = l_xmdk.xmdk054 
   #170817-00043#5 --e add

   IF cl_null(p_type) THEN
      #多角貿易中斷點否
      LET g_pmds.pmds047 = g_icab.icab005

      #取得採購單號(入庫)、入庫單號(倉退)
      LET l_pmdldocno = ''
      LET l_pmdsdocno = ''
      IF NOT cl_null(p_xmdkdocno) THEN
         CALL s_aic_carry_get_fromdocno(g_pmds.pmdssite,p_xmdkdocno,'','1','2')
         RETURNING r_success,l_pmdldocno
         
         IF NOT r_success THEN
            RETURN r_success,r_pmdsdocno
         END IF

         CALL s_aic_carry_get_fromdocno(g_pmds.pmdssite,p_xmdkdocno,'','1','4')
         RETURNING r_success,l_pmdsdocno
         
         IF NOT r_success THEN
            RETURN r_success,r_pmdsdocno
         END IF

         IF l_xmdk.xmdk000 = '6' THEN   #銷退單
            
            IF g_icab.icab004 = 'Y' THEN
               LET g_pmds.pmds000 = '14'  #委外採購倉退單
            ELSE
               LET g_pmds.pmds000 = '7'  #採購倉退單
            END IF
            
            LET g_pmds.pmds100 = l_xmdk.xmdk082  #倉退方式
            
            #自動產生倉退單號pmdsdocno
            IF cl_null(g_icac.icac013) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00202'    #流程代碼%1站別%2之倉退單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               #170321-00126#1 add---start---
               IF g_pmds.pmds000 = '14' THEN
                  CALL s_aic_carry_docno(p_xmdkdocno,g_pmds.pmdssite,g_icac.icac013,g_pmds.pmdsdocdt,'apmt581')
                  RETURNING r_success,g_pmds.pmdsdocno
               ELSE
               #170321-00126#1 add---end---
                  CALL s_aic_carry_docno(p_xmdkdocno,g_pmds.pmdssite,g_icac.icac013,g_pmds.pmdsdocdt,'apmt580')
                  RETURNING r_success,g_pmds.pmdsdocno
               END IF             #170321-00126#1 add
            END IF
         ELSE
            IF g_icab.icab004 = 'Y' THEN
               LET g_pmds.pmds000 = '20'  #委外採購收貨入庫單
            ELSE
               LET g_pmds.pmds000 = '3'  #採購收貨入庫單
            END IF
         
            #自動產生收貨入庫單號pmdsdocno
            IF cl_null(g_icac.icac012) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00203'    #流程代碼%1站別%2之收貨入庫單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               #170321-00126#1 add---start---
               IF g_pmds.pmds000 = '20' THEN
                  CALL s_aic_carry_docno(p_xmdkdocno,g_pmds.pmdssite,g_icac.icac012,g_pmds.pmdsdocdt,'apmt531')
                  RETURNING r_success,g_pmds.pmdsdocno
               ELSE
               #170321-00126#1 add---end---
                  CALL s_aic_carry_docno(p_xmdkdocno,g_pmds.pmdssite,g_icac.icac012,g_pmds.pmdsdocdt,'apmt530')
                  RETURNING r_success,g_pmds.pmdsdocno
               END IF              #170321-00126#1 add
            END IF
         END IF
      ELSE
         CALL s_aic_carry_get_fromdocno(g_pmds.pmdssite,p_pmdsdocno,'','2','2')
         RETURNING r_success,l_pmdldocno

         IF NOT r_success THEN
            RETURN r_success,r_pmdsdocno
         END IF

         CALL s_aic_carry_get_fromdocno(g_pmds.pmdssite,p_pmdsdocno,'','2','4')
         RETURNING r_success,l_pmdsdocno

         IF NOT r_success THEN
            RETURN r_success,r_pmdsdocno
         END IF

         IF l_xmdk.xmdk000 = '6' THEN   #銷退單
            IF g_icab.icab004 = 'Y' THEN
               LET g_pmds.pmds000 = '14'  #委外採購倉退單
            ELSE
               LET g_pmds.pmds000 = '7'  #採購倉退單
            END IF
            
            LET g_pmds.pmds100 = l_xmdk.xmdk082  #倉退方式
            
            #自動產生倉退單號pmdsdocno
            IF cl_null(g_icac.icac013) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00202'    #流程代碼%1站別%2之倉退單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               CALL s_aic_carry_docno(p_pmdsdocno,g_pmds.pmdssite,g_icac.icac013,g_pmds.pmdsdocdt,'apmt580')
               RETURNING r_success,g_pmds.pmdsdocno
            END IF
         ELSE
            IF g_icab.icab004 = 'Y' THEN
               LET g_pmds.pmds000 = '20'  #委外採購收貨入庫單
            ELSE
               LET g_pmds.pmds000 = '3'  #採購收貨入庫單
            END IF
         
            #自動產生收貨入庫單號pmdsdocno
            IF cl_null(g_icac.icac012) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00203'    #流程代碼%1站別%2之收貨入庫單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               #170321-00126#1 add---start---
               IF g_pmds.pmds000 = '20' THEN
                  CALL s_aic_carry_docno(p_pmdsdocno,g_pmds.pmdssite,g_icac.icac012,g_pmds.pmdsdocdt,'apmt530')
                  RETURNING r_success,g_pmds.pmdsdocno
               ELSE
               #170321-00126#1 add---end---
                  CALL s_aic_carry_docno(p_pmdsdocno,g_pmds.pmdssite,g_icac.icac012,g_pmds.pmdsdocdt,'apmt530')
                  RETURNING r_success,g_pmds.pmdsdocno
               END IF                  #170321-00126#1 add
            END IF
         END IF
      END IF
      
      LET r_pmdsdocno = g_pmds.pmdsdocno
      IF NOT r_success THEN
         RETURN r_success,r_pmdsdocno
      END IF
   
      #來源單號
      IF g_pmds.pmds000 = '14' OR g_pmds.pmds000 = '7' THEN #委外採購倉退單、倉退單
         IF NOT cl_null(l_xmdk.xmdk005) THEN
            LET g_pmds.pmds006 = l_pmdsdocno
         END IF
      ELSE
         IF NOT cl_null(l_xmdk.xmdk006) THEN
            LET g_pmds.pmds006 = l_pmdldocno
         END IF
      END IF

      #SELECT採購單資料
      SELECT pmdl002,pmdl003,
             pmdl004,pmdl021,pmdl022,
             pmdl005,
             pmdl023,pmdl024,pmdl028,
             pmdl009,pmdl010,pmdl011,pmdl012,pmdl013,
             pmdl015,pmdl016,pmdl017,pmdl018,
             pmdl054,pmdl055
        INTO g_pmds.pmds002,g_pmds.pmds003,
             g_pmds.pmds007,g_pmds.pmds008,g_pmds.pmds009,
             g_pmds.pmds011,
             g_pmds.pmds012,g_pmds.pmds013,g_pmds.pmds028,
             g_pmds.pmds031,g_pmds.pmds032,g_pmds.pmds033,g_pmds.pmds034,g_pmds.pmds035,
             g_pmds.pmds037,g_pmds.pmds038,g_pmds.pmds039,g_pmds.pmds040,
             g_pmds.pmds048,g_pmds.pmds049
        FROM pmdl_t
       WHERE pmdlent = g_enterprise
         AND pmdldocno = l_pmdldocno
         

   ELSE  #aicp900,aicp950      
      LET g_pmds.pmds011 = '1'  #採購性質
      LET g_pmds.pmds013 = g_icad.icad011 #採購分類
      
      LET g_pmds.pmds031 = g_icae.icae010 #付款條件
      LET g_pmds.pmds032 = g_icae.icae015 #交易條件
      LET g_pmds.pmds033 = g_icae.icae012 #稅別
      
      LET g_pmds.pmds047 = 'N'  #多角貿易中斷點否
      
      #自動產生收貨入庫單號pmdsdocno
      IF NOT cl_null(p_xmdkdocno) THEN
         IF l_xmdk.xmdk000 = '6' THEN   #銷退單
            LET g_pmds.pmds000 = '7'  #採購倉退單
            LET g_pmds.pmds100 = l_xmdk.xmdk082  #倉退方式
            
            IF cl_null(g_icac.icac013) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00202'    #流程代碼%1站別%2之倉退單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               CALL s_aic_carry_docno(p_xmdkdocno,g_pmds.pmdssite,g_icac.icac013,g_pmds.pmdsdocdt,'apmt580')
               RETURNING r_success,g_pmds.pmdsdocno
            END IF
            
         ELSE
            #初始入庫單號(aicp950)
            LET g_pmds.pmds000 = '4'  #無採購收貨入庫單
            
            IF cl_null(g_icac.icac011) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00204'    #流程代碼%1站別%2之無採購收貨入庫單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               CALL s_aic_carry_docno(p_xmdkdocno,g_pmds.pmdssite,g_icac.icac011,g_pmds.pmdsdocdt,'apmt532')
               RETURNING r_success,g_pmds.pmdsdocno
            END IF
           #--160428-00006#3--add--(S)
           #CALL s_aic_carry_get_tri_pm(g_pmds.pmds053,g_pmds.pmdssite,g_pmds.pmdsdocdt)
           #RETURNING r_success
           #IF r_success AND NOT cl_null(g_icag.icag008 ) THEN
           #   LET g_pmds.pmds037 = g_icag.icag008
           #END IF           
           #--160428-00006#3--add--(E)            
         END IF
      
      ELSE
         IF l_xmdk.xmdk000 = '6' THEN   #銷退單
            LET g_pmds.pmds000 = '7'  #採購倉退單
            LET g_pmds.pmds100 = l_xmdk.xmdk082  #倉退方式

            IF cl_null(g_icac.icac013) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00202'    #流程代碼%1站別%2之倉退單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               CALL s_aic_carry_docno(p_pmdsdocno,g_pmds.pmdssite,g_icac.icac013,g_pmds.pmdsdocdt,'apmt580')
               RETURNING r_success,g_pmds.pmdsdocno
            END IF
         ELSE
            LET g_pmds.pmds000 = '4'  #無採購收貨入庫單
            
            IF cl_null(g_icac.icac011) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00204'    #流程代碼%1站別%2之無採購收貨入庫單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_pmdsdocno
            ELSE
               CALL s_aic_carry_docno(p_pmdsdocno,g_pmds.pmdssite,g_icac.icac011,g_pmds.pmdsdocdt,'apmt532')
               RETURNING r_success,g_pmds.pmdsdocno
            END IF
           #--160428-00006#3--add--(S)
           #CALL s_aic_carry_get_tri_pm(g_pmds.pmds053,g_pmds.pmdssite,g_pmds.pmdsdocdt)
           #RETURNING r_success
           #IF r_success AND NOT cl_null(g_icag.icag008 ) THEN
           #   LET g_pmds.pmds037 = g_icag.icag008
           #END IF           
           #--160428-00006#3--add--(E) 
         END IF
      
      END IF
      
      LET r_pmdsdocno = g_pmds.pmdsdocno
      IF NOT r_success THEN
         RETURN r_success,r_pmdsdocno
      END IF
      
      #傳入值"下站營運據點"之"據點對應客戶/廠商編號"
      CALL s_aic_carry_get_ooef024(p_nextsite)
      RETURNING r_success,g_pmds.pmds007
      IF NOT r_success THEN
         RETURN r_success,r_pmdsdocno
      END IF
      
      LET g_pmds.pmds008 = g_pmds.pmds007
      
      #180316-00044#1 Add By 06137  180320(S)
      IF cl_null(l_xmdk.xmdk009) THEN
         LET l_xmdk.xmdk009 = g_pmds.pmds008
      END IF
      #180316-00044#1 Add By 06137  180320(E)
         
      #LET g_pmds.pmds009 = g_pmds.pmds007 #170623-00003#1-mark
      LET g_pmds.pmds009 = l_xmdk.xmdk009  #170623-00003#1-add
      #IF cl_null(g_pmds.pmds037) THEN         #160428-00006#3 add
      LET g_pmds.pmds037 = l_xmdk.xmdk016  #幣別
      #END IF                                  #160428-00006#3 add
      #获取采购控制组编号
      CALL s_control_get_pmal002('4',g_user,g_dept,g_pmds.pmds007)
      RETURNING l_success,l_pmal002
      
      CALL s_apmm101_default_pmab('1',l_pmal002,g_pmds.pmdssite,g_pmds.pmds007) RETURNING g_pmab.*
      #慣用交易幣別(改抓來源)
      #LET g_pmds.pmds037 = g_pmab.pmab033
      #慣用交易稅別(改抓icae012)
      #LET g_pmds.pmds033 = g_pmab.pmab034
      #慣用付款/收款條件(改抓icae010)
      #LET g_pmds.pmds031 = g_pmab.pmab037
      #慣用採購/銷售通路
      LET g_pmds.pmds012 = g_pmab.pmab038
      #慣用採購/銷售分類(改抓icad011)
      #LET g_pmds.pmds013 = g_pmab.pmab039
      #慣用交運方式
      #g_pmab.pmab040
      #慣用交運起點
      #g_pmab.pmab041
      #慣用交運終點
      #g_pmab.pmab042
      #慣用交易條件(改抓icae015)
      #LET g_pmds.pmds032 = g_pmab.pmab053
      #慣用取價方式
      LET g_pmds.pmds039 = g_pmab.pmab054
      #慣用發票類型(改抓下站營運據點的icae014)
      #g_pmab.pmab056
      #內外購/銷
      LET g_pmds.pmds048 = g_pmab.pmab057
      #取匯率來源
      LET g_pmds.pmds049 = g_pmab.pmab058
      #負責採購/業務人員
      LET g_pmds.pmds002 = g_pmab.pmab031
      #負責採購/業務部門
      LET g_pmds.pmds003 = g_pmab.pmab059
      #慣用卸貨港
      #g_pmab.pmab043
      
      #必要欄位檢查
      IF g_pmab.prog = 'apmi110' THEN  #控制組預設
         IF cl_null(g_pmds.pmds012) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00136"   #控制組編號%1，供應商編號%2之慣用採購通路為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_pmds.pmds007
               
            CALL cl_err()
            LET r_success = FALSE
         END IF
      
         IF cl_null(g_pmds.pmds039) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00138"   #控制組編號%1，供應商編號%2之慣用取價方式為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_pmds.pmds007
               
            CALL cl_err()
            LET r_success = FALSE
         END IF
      
         IF cl_null(g_pmds.pmds048) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00140"   #控制組編號%1，供應商編號%2之慣用內外購為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_pmds.pmds007
               
            CALL cl_err()
            LET r_success = FALSE
         END IF
      
         IF cl_null(g_pmds.pmds049) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00141"   #控制組編號%1，供應商編號%2之慣用匯率計算基準為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_pmds.pmds007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
      ELSE   #供應商預設apmm202
         #161214-00046#1--mark--start--
         #IF cl_null(g_pmds.pmds012) THEN
         #   INITIALIZE g_errparam TO NULL
         #   LET g_errparam.extend = ''
         #   LET g_errparam.code   = "aic-00144"   #供應商編號%1之慣用採購通路為空！
         #   LET g_errparam.popup  = TRUE
         #   LET g_errparam.replace[1] = g_pmds.pmds007
         #      
         #   CALL cl_err()
         #   LET r_success = FALSE
         #END IF
         #161214-00046#1--mark--end----
         IF cl_null(g_pmds.pmds039) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = ''
            LET g_errparam.code   = "aic-00146"   #供應商編號%1之慣用取價方式為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_pmds.pmds007
               
            CALL cl_err()
            LET r_success = FALSE
         END IF
      
         IF cl_null(g_pmds.pmds048) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00148"   #供應商編號%1之慣用內外購為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_pmds.pmds007
               
            CALL cl_err()
            LET r_success = FALSE
         END IF
      
         IF cl_null(g_pmds.pmds049) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00149"   #供應商編號%1之慣用匯率計算基準為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_pmds.pmds007
               
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF

      IF cl_null(g_pmds.pmds033) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''
         LET g_errparam.code   = "aic-00150"   #流程代碼%1站別%2之採購稅別為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      IF cl_null(g_pmds.pmds031) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00151"   #流程代碼%1站別%2之付款條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
               
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      IF cl_null(g_pmds.pmds032) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00152"   #流程代碼%1站別%2之採購單交易條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
               
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      IF NOT r_success THEN
         RETURN r_success,r_pmdsdocno
      END IF

      #取得稅率、含稅否
      CALL s_aic_carry_tax(g_pmds.pmdssite,g_pmds.pmds033)RETURNING r_success,g_pmds.pmds035,g_pmds.pmds034
      IF NOT r_success THEN
         RETURN r_success,r_pmdsdocno
      END IF

      #取匯率
      CALL s_aic_carry_exchange(g_pmds.pmds048,g_pmds.pmdssite,g_pmds.pmdsdocdt,g_pmds.pmds037,'','2')
      RETURNING r_success,g_pmds.pmds038
      IF NOT r_success THEN
         RETURN r_success,r_pmdsdocno
      END IF
      
   END IF

   INSERT INTO pmds_t VALUES g_pmds.*
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:pmds_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success,r_pmdsdocno
   END IF

   LET g_sql = "SELECT pmdnsite,",
               "       pmdn015,",
               "       pmdn016,pmdn017,pmdn020,",
               "       pmdn021,",
               "       pmdn035,pmdn036,pmdn037,pmdn038,pmdn040,",
               "       pmdn041,pmdn043,pmdn044",
               "       ,pmdn028 ",   #C20190306-07783 ADD 取来源采购单的库位
               "  FROM pmdn_t",
               " WHERE pmdnent = ",g_enterprise,
               "   AND pmdndocno = ?",
               "   AND pmdnseq = ?"
   PREPARE s_aic_carry_pmdn_pre FROM g_sql

   IF NOT cl_null(p_xmdkdocno) THEN
      LET g_sql = "SELECT xmdkdocdt,",
                  "       xmdksite,",
                  "       xmdldocno,xmdlseq,xmdl002,",  #151104 earl mod
                  "       xmdl003,xmdl004,xmdl005,",
                  "       xmdl006,xmdl007,xmdl008,xmdl009,xmdl010,",
                  "       xmdl011,xmdl012,xmdl013,xmdl014,xmdl015,",
                  "       xmdl016,xmdl017,xmdl018,xmdl019,xmdl020,",
                  "       xmdl021,xmdl022,xmdl024,",
                 #"       xmdl052,",             #170817-00043#5 mark
                  "       xmdl051,xmdl052,'',",  #170817-00043#5 add
                  "       '1',xmdl041, ",         #160902-00008#1 add
                  "       xmdl086,xmdl088",
                  "  FROM xmdk_t,xmdl_t",
                  " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
                  "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"'",
                  " ORDER BY xmdlseq"
   ELSE
      #aicp400正拋第一站無來源出貨單
      LET g_sql = "SELECT pmdsdocdt,",
                  "       pmdssite,",
                  "       '',pmdtseq,pmdt028,",      #151104 earl add
                  "       '',pmdt002,pmdt003,",
                  "       pmdt004,pmdt005,pmdt006,pmdt007,pmdt008,",
                  "       pmdt009,pmdt010,pmdt062,pmdt016,pmdt017,",
                  "       pmdt018,pmdt019,pmdt020,pmdt021,pmdt022,",
                  "       pmdt023,pmdt024,pmdt036,",
                 #"       pmdt063,",                 #170817-00043#5 mark
                  "       pmdt059,pmdt063,pmdt088,", #170817-00043#5 add
                  "       pmdt025,pmdt041,",      #160902-00008#1 add
                  "       pmdt086,pmdt085 ",
                  "  FROM pmds_t,pmdt_t",
                  " WHERE pmdsent = pmdtent AND pmdtent = ",g_enterprise,
                  "   AND pmdsdocno = pmdtdocno AND pmdtdocno = '",p_pmdsdocno,"'",
                  " ORDER BY pmdtseq"
   END IF
   
   PREPARE s_aic_carry_xmdl_pre1 FROM g_sql
   DECLARE s_aic_carry_xmdl_cs1 CURSOR FOR s_aic_carry_xmdl_pre1

   IF NOT cl_null(p_xmdkdocno) THEN
      LET g_sql = "SELECT xmdmseq1,",
                  "       xmdm001,xmdm002,xmdm003,xmdm004,xmdm005,",
                  "       xmdm006,xmdm007,xmdm008,xmdm009,xmdm010,",
                  "       xmdm011,xmdm033",
                  "  FROM xmdm_t",
                  " WHERE xmdment = ",g_enterprise,
                  "   AND xmdmdocno = '",p_xmdkdocno,"'",
                  "   AND xmdmseq = ?",
                  " ORDER BY xmdmseq1"
   ELSE
      #初始入庫單號(aicp400正拋,aicp950)
      LET g_sql = "SELECT pmduseq1,",
                  "       pmdu001,pmdu002,pmdu003,pmdu004,pmdu006,",
                  "       pmdu007,pmdu008,pmdu009,pmdu010,pmdu011,",
                  "       pmdu012,pmdu005",
                  "  FROM pmdu_t",
                  " WHERE pmduent = ",g_enterprise,
                  "   AND pmdudocno = '",p_pmdsdocno,"'",
                  "   AND pmduseq = ?",
                  " ORDER BY pmduseq1"
   END IF

   PREPARE s_aic_carry_xmdm_pre FROM g_sql
   DECLARE s_aic_carry_xmdm_cs CURSOR FOR s_aic_carry_xmdm_pre

   LET l_xmdkdocdt = ''
   INITIALIZE l_xmdl.* TO NULL
   FOREACH s_aic_carry_xmdl_cs1 INTO l_xmdkdocdt,
                                     l_xmdl.xmdlsite,
                                     l_xmdl.xmdldocno,l_xmdl.xmdlseq,l_xmdl.xmdl002, #151104 earl mod
                                     l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,
                                     l_xmdl.xmdl006,l_xmdl.xmdl007,l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl010,
                                     l_xmdl.xmdl011,l_xmdl.xmdl012,l_xmdl.xmdl013,l_xmdl.xmdl014,l_xmdl.xmdl015,
                                     l_xmdl.xmdl016,l_xmdl.xmdl017,l_xmdl.xmdl018,l_xmdl.xmdl019,l_xmdl.xmdl020,
                                     l_xmdl.xmdl021,l_xmdl.xmdl022,l_xmdl.xmdl024,
                                    #l_xmdl.xmdl052,                          #170817-00043#5 mark
                                     l_xmdl.xmdl051,l_xmdl.xmdl052,l_pmdt088, #170817-00043#5 add
                                     l_pmdt025,l_xmdl.xmdl041,     #160902-00008#1 add
                                     l_xmdl.xmdl086,l_xmdl.xmdl088
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_xmdl_cs1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
     
      #塞pmdt_t
      INITIALIZE g_pmdt.* TO NULL
      LET g_pmdt.pmdtent = g_enterprise
      LET g_pmdt.pmdtsite = g_pmds.pmdssite
      LET g_pmdt.pmdtdocno = g_pmds.pmdsdocno
      LET g_pmdt.pmdtseq = l_xmdl.xmdlseq

      LET g_pmdt.pmdt005 = l_xmdl.xmdl007
      LET g_pmdt.pmdt006 = l_xmdl.xmdl008
      LET g_pmdt.pmdt007 = l_xmdl.xmdl009
      LET g_pmdt.pmdt008 = l_xmdl.xmdl010
      LET g_pmdt.pmdt009 = l_xmdl.xmdl011
      LET g_pmdt.pmdt010 = l_xmdl.xmdl012
      LET g_pmdt.pmdt011 = 1
      
      LET g_pmdt.pmdt019 = l_xmdl.xmdl017
      LET g_pmdt.pmdt020 = l_xmdl.xmdl018
      LET g_pmdt.pmdt021 = l_xmdl.xmdl019
      LET g_pmdt.pmdt022 = l_xmdl.xmdl020
      LET g_pmdt.pmdt023 = l_xmdl.xmdl021
      LET g_pmdt.pmdt024 = l_xmdl.xmdl022
     #160902-00008#1-s-add
      LET g_pmdt.pmdt025 = l_pmdt025        
      LET g_pmdt.pmdt041 = l_xmdl.xmdl041
     #160902-00008#1-e-add
      LET g_pmdt.pmdt052 = '1'  #狀態碼
      LET g_pmdt.pmdt053 = 0
      LET g_pmdt.pmdt054 = 0
      LET g_pmdt.pmdt055 = 0
      LET g_pmdt.pmdt056 = 0
      LET g_pmdt.pmdt057 = 0
      LET g_pmdt.pmdt058 = 0
      LET g_pmdt.pmdt059 = l_xmdl.xmdl051 #170817-00043#5 add
      
      IF NOT cl_null(p_xmdkdocno) THEN
         LET g_pmdt.pmdt064 = l_xmdl.xmdldocno
         LET g_pmdt.pmdt065 = l_xmdl.xmdlseq
      END IF
       
      LET g_pmdt.pmdt066 = 0
      LET g_pmdt.pmdt067 = 0
      LET g_pmdt.pmdt068 = 0
      LET g_pmdt.pmdt069 = 0
      
      LET g_pmdt.pmdt084 = 'Y'   #需自立AP否 #151105改為Y
      
      LET g_pmdt.pmdt085 = g_pmds.pmds053   #多角流程代碼
      LET g_pmdt.pmdt086 = g_pmds.pmds014   #多角性質

      LET g_pmdt.pmdt062 = l_xmdl.xmdl013   #多庫儲批收貨入庫
      LET g_pmdt.pmdt018 = l_xmdl.xmdl016   #批號
      
      #170817-00043#5 --s add
      #逆拋
      IF NOT cl_null(p_xmdkdocno) THEN
         #抓出始出貨單的存貨備註
         SELECT pmdt088 INTO l_pmdt088
           FROM pmdt_t
          WHERE pmdtent = g_enterprise
            AND pmdtdocno = p_firstdocno
            AND pmdtseq = l_xmdl.xmdlseq
      END IF   
      LET g_pmdt.pmdt088 = l_pmdt088 #存貨備註
      #170817-00043#5 --e add   
            
      #統銷統收之第0站，庫位儲位要同料件預設
      IF p_type = 'aicp900' AND p_icab002 = '0' THEN
         LET l_imaf091 = ''
         LET l_imaf092 = ''
         CALL s_aic_carry_sel_imaf091_imaf092(g_pmdt.pmdtsite,g_pmdt.pmdt006)
         RETURNING l_imaf091,l_imaf092
         
         IF cl_null(l_imaf091) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = ""
            LET g_errparam.code   = 'aim-00245'   #營運據點%1料件編號%2無預設之庫位、儲位！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_pmdt.pmdtsite
            LET g_errparam.replace[2] = g_pmdt.pmdt006
             
            CALL cl_err()
            
            LET r_success = FALSE
            EXIT FOREACH            
         END IF
         
         IF cl_null(l_imaf092) THEN
            LET l_imaf092 = ' '
         END IF
      END IF

      #同據點直接引用來源
      IF g_pmdt.pmdtsite = l_xmdl.xmdlsite THEN
         LET g_pmdt.pmdt063 = l_xmdl.xmdl052   #庫存管理特徵
         LET g_pmdt.pmdt016 = l_xmdl.xmdl014   #庫位
         LET g_pmdt.pmdt017 = l_xmdl.xmdl015   #儲位
         
      #跨據點用aici100設定
      ELSE
         LET g_pmdt.pmdt063 = ' '              #庫存管理特徵
         
         #庫位、儲位
         IF NOT cl_null(l_xmdl.xmdl014) THEN
            #統銷統收之第0站，庫位儲位要同料件預設
            IF p_type = 'aicp900' AND p_icab002 = '0' THEN
               LET g_pmdt.pmdt016 = l_imaf091             #庫位
               LET g_pmdt.pmdt017 = l_imaf092             #儲位
            ELSE
               #add by maoyy20180227-s
               SELECT icaduc004 INTO l_icaduc004 FROM icaduc_t WHERE icaducent=g_enterprise
               AND icaduc001=p_icab001 AND icaduc005=p_icab002+1
               AND icaduc006=l_xmdl.xmdl014
               IF NOT cl_null(l_icaduc004) THEN
                  LET g_pmdt.pmdt016 = l_icaduc004    #庫位
                  LET g_pmdt.pmdt017 = l_xmdl.xmdl015   #庫位
                  LET g_pmdt.pmdt018 = l_xmdl.xmdl016    #庫位
               ELSE
               #add by maoyy20180227-e
                 IF cl_null(g_icad.icad004) THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.extend = ""
                    LET g_errparam.code   = 'aic-00169'   #流程代碼%1站別%2之庫位為空！
                    LET g_errparam.popup  = TRUE
                    LET g_errparam.replace[1] = p_icab001
                    LET g_errparam.replace[2] = p_icab002
                    
                    CALL cl_err()
                 
                    LET r_success = FALSE
                    EXIT FOREACH            
                 ELSE              
                    LET g_pmdt.pmdt016 = g_icad.icad004     #庫位
                   
                    IF cl_null(g_icad.icad005) THEN
                      LET g_pmdt.pmdt017 = ' '             #儲位
                    ELSE
                      LET g_pmdt.pmdt017 = g_icad.icad005  #儲位
                    END IF
                 END IF
               END IF#add by maoyy20180227-e            
            END IF
         ELSE
            LET g_pmdt.pmdt016 = ' '             #庫位
            LET g_pmdt.pmdt017 = ' '             #儲位
         END IF
         
      END IF
      
      #若傳入值"拋轉類型"為Null
      IF cl_null(p_type) THEN
         LET g_pmdt.pmdt002 = l_xmdl.xmdl004
         LET g_pmdt.pmdt003 = l_xmdl.xmdl005
         LET g_pmdt.pmdt004 = l_xmdl.xmdl006

         #取得採購單號
         LET l_pmdldocno = ''
         LET l_pmdsdocno = ''
         IF NOT cl_null(p_xmdkdocno) THEN
            CALL s_aic_carry_get_fromdocno(g_pmdt.pmdtsite,p_xmdkdocno,l_xmdl.xmdlseq,'1','2')
            RETURNING r_success,l_pmdldocno
         
            IF NOT r_success THEN
               RETURN r_success,r_pmdsdocno
            END IF
            
            LET g_pmdt.pmdt001 = l_pmdldocno     #來源單號
            
            CALL s_aic_carry_get_fromdocno(g_pmdt.pmdtsite,p_xmdkdocno,l_xmdl.xmdlseq,'1','4')
            RETURNING r_success,l_pmdsdocno
         
            IF NOT r_success THEN
               RETURN r_success,r_pmdsdocno
            END IF
            
         ELSE
            #初始入庫單號(aicp400正拋,aicp950)
            CALL s_aic_carry_get_fromdocno(g_pmdt.pmdtsite,p_pmdsdocno,l_xmdl.xmdlseq,'2','2')
            RETURNING r_success,l_pmdldocno

            IF NOT r_success THEN
               RETURN r_success,r_pmdsdocno
            END IF
            
            LET g_pmdt.pmdt001 = l_pmdldocno     #來源單號
            
            CALL s_aic_carry_get_fromdocno(g_pmdt.pmdtsite,p_pmdsdocno,l_xmdl.xmdlseq,'2','4')
            RETURNING r_success,l_pmdsdocno

            IF NOT r_success THEN
               RETURN r_success,r_pmdsdocno
            END IF
         END IF
         SELECT pmdn001 INTO l_pmdn001  FROM pmdn_t #cws 2017.12.29
          WHERE pmdnent = g_enterprise AND pmdnsite = g_pmdt.pmdtsite  AND pmdndocno = g_pmdt.pmdt001 AND pmdnseq = g_pmdt.pmdt002
         IF NOT cl_null(l_pmdn001) THEN LET g_pmdt.pmdt006 = l_pmdn001 END IF
         
         LET l_pmdn028 = ''   #C20190306-07783 ADD
         #目的營運據點採購單
         EXECUTE s_aic_carry_pmdn_pre USING g_pmdt.pmdt001,g_pmdt.pmdt002
         INTO g_pmdt.pmdt087,
              g_pmdt.pmdt036,
              g_pmdt.pmdt046,g_pmdt.pmdt037,g_pmdt.pmdt025,
              g_pmdt.pmdt041,
              g_pmdt.pmdt040,g_pmdt.pmdt072,g_pmdt.pmdt073,g_pmdt.pmdt074,g_pmdt.pmdt042,
              g_pmdt.pmdt043,g_pmdt.pmdt044,g_pmdt.pmdt045,l_pmdn028  #C20190306-07783 ADD l_pmdn028

         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "EXECUTE:s_aic_carry_pmdn_pre"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
       
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #C20190306-07783--S--以采购单的库位为准
         IF NOT cl_null(l_pmdn028) THEN
            LET g_pmdt.pmdt016 = l_pmdn028
         END IF
         #C20190306-07783--E--以采购单的库位为准        
         #151104 earl add
         IF g_pmds.pmds000 = '14' OR g_pmds.pmds000 = '7' OR g_pmds.pmds000 = '3' THEN #委外採購倉退單、倉退單 #170724-00046#1 add'OR g_pmds.pmds000 = '3''
            LET g_pmdt.pmdt027 = l_pmdsdocno
            LET g_pmdt.pmdt028 = l_xmdl.xmdl002
         END IF

      #若傳入值"拋轉類型"不為Null
      ELSE

        #LET g_pmdt.pmdt025 = '1'        #160902-00008#1 mark

         LET g_pmdt.pmdt037 = g_pmds.pmds034

        #LET g_pmdt.pmdt041 = 'N'        #160902-00008#1 mark
       
         LET g_pmdt.pmdt045 = 0
         LET g_pmdt.pmdt046 = g_pmds.pmds033

         LET g_pmdt.pmdt036 = l_xmdl.xmdl024 #單價
         LET g_pmdt.pmdt044 = g_pmdt.pmdt036
         
      END IF
      
      #20200320 add by yangtt--str
      #保持不同据点的应收与应付的金额一致，等同出货单价
      LET g_pmdt.pmdt036 = l_xmdl.xmdl024 #單價
      LET g_pmdt.pmdt044 = g_pmdt.pmdt036
      #20200320 add by yangtt--end
      
      #檢驗否
      IF g_icab.icab005 = 'Y' THEN
         IF (NOT cl_null(g_pmdt.pmdt009)) AND (NOT cl_null(g_pmdt.pmdt010)) THEN
            SELECT qcap006 INTO g_pmdt.pmdt026
              FROM qcap_t
             WHERE qcapent = g_enterprise AND qcapsite = g_pmdt.pmdtsite
               AND qcap001 = g_pmdt.pmdt006 AND qcap002 = g_pmds.pmds007
               AND qcap003 = g_pmdt.pmdt009 AND qcap004 = g_pmdt.pmdt010
               AND qcap005 = g_pmdt.pmdt007
         ELSE
            SELECT qcap006 INTO g_pmdt.pmdt026
              FROM qcap_t
             WHERE qcapent = g_enterprise AND qcapsite = g_pmdt.pmdtsite
               AND qcap001 = g_pmdt.pmdt006 AND qcap002 = g_pmds.pmds007
               AND qcap005 = g_pmdt.pmdt007
         END IF
      END IF
      
      IF cl_null(g_pmdt.pmdt026) THEN
         LET g_pmdt.pmdt026 = 'N'
      END IF
      
      #160316-00023#2--add---begin---
      #有專案代號且"專案庫存控管"="Y"時，自動將專案代號帶入庫存管理特徵欄位中，不可修改
      IF g_pmds.pmds000 MATCHES '[3467]' OR g_pmds.pmds000 = '12' OR g_pmds.pmds000 = '13' OR g_pmds.pmds000 = '14' OR g_pmds.pmds000 = '15' OR g_pmds.pmds000 = '20' THEN
         IF NOT cl_null(g_pmdt.pmdt072) THEN
            SELECT pjaa013 INTO l_pjaa013 FROM pjaa_t,pjba_t 
               WHERE pjaaent = pjbaent AND pjaa001 = pjba000 AND pjaaent = g_enterprise AND pjba001 = g_pmdt.pmdt072
            IF l_pjaa013 = 'Y' THEN
               LET g_pmdt.pmdt063 = g_pmdt.pmdt072
            END IF
         END IF  
      END IF     
      #160316-00023#2--add---end---

      #取得未稅金額、稅額、含稅金額
      CALL s_aic_carry_get_amount(g_pmdt.pmdtsite,g_pmdt.pmdtdocno,g_pmdt.pmdtseq,g_pmds.pmds037,g_pmdt.pmdt024,g_pmdt.pmdt036,g_pmdt.pmdt046)
      RETURNING r_success,g_pmdt.pmdt038,g_pmdt.pmdt047,g_pmdt.pmdt039

      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      INSERT INTO pmdt_t VALUES g_pmdt.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:pmdt_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
            
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #整批產生收貨原始需求分配明細資料
      CALL s_aic_carry_ins_pmdv() RETURNING r_success
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      INITIALIZE l_xmdm.* TO NULL
      OPEN s_aic_carry_xmdm_cs USING g_pmdt.pmdtseq
      FOREACH s_aic_carry_xmdm_cs INTO l_xmdm.xmdmseq1,
                                       l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,l_xmdm.xmdm005,
                                       l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008,l_xmdm.xmdm009,l_xmdm.xmdm010,
                                       l_xmdm.xmdm011,l_xmdm.xmdm033
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_xmdm_cs"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #塞pmdu_t
         INITIALIZE g_pmdu.* TO NULL
         LET g_pmdu.pmduent = g_enterprise
         LET g_pmdu.pmdusite = g_pmdt.pmdtsite
         LET g_pmdu.pmdudocno = g_pmdt.pmdtdocno
         LET g_pmdu.pmduseq = g_pmdt.pmdtseq
         LET g_pmdu.pmduseq1 = l_xmdm.xmdmseq1
        #LET g_pmdu.pmdu001 = l_xmdm.xmdm001    #料件編號
         LET g_pmdu.pmdu001 = g_pmdt.pmdt006    #cws 2017.12.29
         LET g_pmdu.pmdu002 = l_xmdm.xmdm002    #產品特徵
         LET g_pmdu.pmdu003 = l_xmdm.xmdm003    #作業編號
         LET g_pmdu.pmdu004 = l_xmdm.xmdm004    #作業序
       
         LET g_pmdu.pmdu008 = l_xmdm.xmdm007    #批號
         LET g_pmdu.pmdu009 = l_xmdm.xmdm008    #單位
         LET g_pmdu.pmdu010 = l_xmdm.xmdm009    #數量
         LET g_pmdu.pmdu011 = l_xmdm.xmdm010    #參考單位
         LET g_pmdu.pmdu012 = l_xmdm.xmdm011    #參考數量
         LET g_pmdu.pmdu013 = 0                 #允收數量
         LET g_pmdu.pmdu014 = 0                 #已入庫量
         LET g_pmdu.pmdu015 = 0                 #已驗退量
       
         #同據點直接引用來源
         IF g_pmdt.pmdtsite = l_xmdl.xmdlsite THEN
               LET g_pmdu.pmdu005 = l_xmdm.xmdm033    #庫存管理特徵
               LET g_pmdu.pmdu006 = l_xmdm.xmdm005    #庫位
               LET g_pmdu.pmdu007 = l_xmdm.xmdm006    #儲位
         ELSE
            LET g_pmdu.pmdu005 = ' '    #庫存管理特徵
            
            #庫位、儲位
            IF NOT cl_null(l_xmdm.xmdm005) THEN
               #統銷統收之第0站，庫位儲位要同料件預設
               IF p_type = 'aicp900' AND p_icab002 = '0' THEN
                  LET g_pmdu.pmdu006 = l_imaf091             #庫位
                  LET g_pmdu.pmdu007 = l_imaf092             #儲位
               ELSE
                  #fcx-180320--str---pmdu006/pmdu007/pmdu008
                  SELECT icaduc004 INTO l_icaduc004 FROM icaduc_t WHERE icaducent=g_enterprise
                  AND icaduc001=p_icab001 AND icaduc005=p_icab002+1
                  AND icaduc006=l_xmdm.xmdm005
                  IF NOT cl_null(l_icaduc004) THEN
                     LET g_pmdu.pmdu006 = l_icaduc004      #庫位
                     LET g_pmdu.pmdu007 = l_xmdm.xmdm006   #储位
                     LET g_pmdu.pmdu008 = l_xmdm.xmdm007   #批次
                  ELSE     
                  #fcx-180320--end---pmdu006/pmdu007/pmdu008                  
                     IF cl_null(g_icad.icad004) THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = ""
                        LET g_errparam.code   = 'aic-00169'   #流程代碼%1站別%2之庫位為空！
                        LET g_errparam.popup  = TRUE
                        LET g_errparam.replace[1] = p_icab001
                        LET g_errparam.replace[2] = p_icab002
                        
                        CALL cl_err()
                     
                        LET r_success = FALSE
                        EXIT FOREACH            
                     ELSE
                        LET g_pmdu.pmdu006 = g_icad.icad004     #庫位
                        
                        IF cl_null(g_icad.icad005) THEN
                           LET g_pmdu.pmdu007 = ' '             #儲位
                        ELSE
                           LET g_pmdu.pmdu007 = g_icad.icad005  #儲位
                        END IF
                     END IF
                  END IF   #fcx-180320--add---pmdu006/pmdu007/pmdu008
                  #C20190306-07783--S--与入库明细中的库位一致
                  IF NOT cl_null(g_pmdt.pmdt016) THEN
                     LET g_pmdu.pmdu006 = g_pmdt.pmdt016                     
                  END IF
                  #C20190306-07783--E--与入库明细中的库位一致                  
               END IF
            ELSE
               LET g_pmdu.pmdu006 = ' '             #庫位
               LET g_pmdu.pmdu007 = ' '             #儲位
            END IF
       
         END IF
         
         #160316-00023#2--add---begin---
         #有專案代號且"專案庫存控管"="Y"時，自動將專案代號帶入庫存管理特徵欄位中，不可修改
         IF g_pmds.pmds000 MATCHES '[3467]' OR g_pmds.pmds000 = '12' OR g_pmds.pmds000 = '13' OR g_pmds.pmds000 = '14' OR g_pmds.pmds000 = '15' OR g_pmds.pmds000 = '20' THEN
            IF NOT cl_null(g_pmdt.pmdt072) THEN
               SELECT pjaa013 INTO l_pjaa013 FROM pjaa_t,pjba_t 
                  WHERE pjaaent = pjbaent AND pjaa001 = pjba000 AND pjaaent = g_enterprise AND pjba001 = g_pmdt.pmdt072
               IF l_pjaa013 = 'Y' THEN
                  LET g_pmdu.pmdu005 = g_pmdt.pmdt072
               END IF
            END IF  
         END IF     
         #160316-00023#2--add---end---
       
         INSERT INTO pmdu_t VALUES g_pmdu.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:pmdu_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #150917-00001#4 151113 earl add s
         IF g_pmds.pmds000 = '14' OR g_pmds.pmds000 = '7' THEN #委外採購倉退單、倉退單
            LET l_inao013 = -1   #目的入庫碼:'-1出庫'
         ELSE #3.收貨入庫單、4.無採購收貨入庫單
            LET l_inao013 = 1   #目的入庫碼:'1:入庫'
         END IF
         
         IF NOT s_aic_carry_inao_ins(p_firstdocno,g_pmdu.pmduseq,g_pmdu.pmduseq1,g_pmdu.pmdusite,g_pmdu.pmdudocno,
                                     g_pmdu.pmdu005,g_pmdu.pmdu006,g_pmdu.pmdu007,l_inao013,'2') THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #150917-00001#4 151113 earl add e
         
      END FOREACH
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
   END FOREACH

   IF NOT r_success THEN
      RETURN r_success,r_pmdsdocno
   ELSE
   
      #重新計算整單的未稅、含稅總金額
      CALL s_aic_carry_return_amount(g_pmds.pmdsdocno)
      RETURNING l_xrcd103,l_xrcd104,l_xrcd105            
      
      UPDATE pmds_t
         SET pmds043 = l_xrcd103,
             pmds044 = l_xrcd105,
             pmds046 = l_xrcd104
       WHERE pmdsent = g_enterprise 
         AND pmdsdocno = g_pmds.pmdsdocno
      
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE:pmds_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success,r_pmdsdocno
      END IF
      
      #170817-00043#5 --s add
      #複製備註拋到後面單據
      CASE l_xmdk.xmdk000
         WHEN '1' #採購單
            IF NOT cl_null(p_xmdkdocno) THEN
               IF g_pmds.pmds000 = '4' THEN #無採購收貨入庫
                  CALL s_aic_carry_ins_ooff('apmt532',r_pmdsdocno,'axmt540',p_xmdkdocno) RETURNING r_success
               ELSE
                  IF g_pmds.pmds000 = '20' THEN   
                     #委外
                     CALL s_aic_carry_ins_ooff('apmt531',r_pmdsdocno,'axmt540',p_xmdkdocno) RETURNING r_success
                  ELSE
                     CALL s_aic_carry_ins_ooff('apmt530',r_pmdsdocno,'axmt540',p_xmdkdocno) RETURNING r_success
                  END IF
               END IF
            ELSE
               #初始入庫單號(aicp400正拋,aicp950)
               IF g_pmds.pmds000 = '4' THEN #無採購收貨入庫
                  CALL s_aic_carry_ins_ooff('apmt532',r_pmdsdocno,'apmt530',p_firstdocno) RETURNING r_success
               ELSE
                  IF g_pmds.pmds000 = '20' THEN
                     #委外
                     CALL s_aic_carry_ins_ooff('apmt531',r_pmdsdocno,'apmt530',p_firstdocno) RETURNING r_success
                  ELSE
                     CALL s_aic_carry_ins_ooff('apmt530',r_pmdsdocno,'apmt530',p_firstdocno) RETURNING r_success
                  END IF
               END IF
            END IF
         WHEN '4' #簽收單
            CALL s_aic_carry_ins_ooff('apmt530',r_pmdsdocno,'axmt580',p_firstdocno) RETURNING r_success
         WHEN '7' #借貨還價單
            CALL s_aic_carry_ins_ooff('apmt530',r_pmdsdocno,'axmt580',p_firstdocno) RETURNING r_success
         WHEN '6' #倉退單
            IF NOT cl_null(p_xmdkdocno) THEN
               IF g_pmds.pmds000 = '14' THEN
                  #委外
                  CALL s_aic_carry_ins_ooff('apmt581',r_pmdsdocno,'axmt600',p_xmdkdocno) RETURNING r_success
               ELSE
                  CALL s_aic_carry_ins_ooff('apmt580',r_pmdsdocno,'axmt600',p_xmdkdocno) RETURNING r_success
               END IF
            ELSE
               IF g_pmds.pmds000 = '14' THEN
                  #委外
                  CALL s_aic_carry_ins_ooff('apmt581',r_pmdsdocno,'apmt580',p_pmdsdocno) RETURNING r_success
               ELSE
                  CALL s_aic_carry_ins_ooff('apmt580',r_pmdsdocno,'apmt580',p_pmdsdocno) RETURNING r_success
               END IF
            END IF
         WHEN '2' #無採購收貨入庫
            IF NOT cl_null(p_xmdkdocno) THEN
               CALL s_aic_carry_ins_ooff('apmt532',r_pmdsdocno,'axmt540',p_xmdkdocno) RETURNING r_success
            ELSE
               #初始入庫單號(aicp400正拋,aicp950)
               CALL s_aic_carry_ins_ooff('apmt532',r_pmdsdocno,'apmt532',p_pmdsdocno) RETURNING r_success
            END IF
      END CASE
      #170817-00043#5 --e add  
   END IF

   #確認過帳
   CALL s_aic_carry_pmds_conf() RETURNING r_success
   IF NOT r_success THEN
      RETURN r_success,r_pmdsdocno
   END IF

   RETURN r_success,r_pmdsdocno   
END FUNCTION

#簽收單自動確認由s_aic_carry_gen_tri_mr呼叫
#因該應用元件使用g_site故需先改為當前營運據點
PRIVATE FUNCTION s_aic_carry_pmds_conf()
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_site      LIKE pmds_t.pmdssite   #備份營運據點
   DEFINE l_argv1     LIKE type_t.chr10
   DEFINE l_pmdsstus  LIKE pmds_t.pmdsstus
   
   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = g_pmds.pmdssite  #將g_site替換成當站營運據點

   LET l_argv1 = g_argv[1]
   LET g_argv[1] = g_pmds.pmds000

   CALL s_apmt520_conf_chk(g_pmds.pmdsdocno) RETURNING r_success
   IF r_success THEN
      CALL s_apmt520_conf_upd(g_pmds.pmdsdocno) RETURNING r_success
   END IF
   
   IF r_success THEN
      LET l_pmdsstus = ''
      SELECT pmdsstus INTO l_pmdsstus
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmdsdocno = g_pmds.pmdsdocno
     
      IF l_pmdsstus <> 'S' THEN   #若已自動過帳不再次過帳
         CALL s_apmt520_posted_chk(g_pmds.pmdsdocno) RETURNING r_success
         IF r_success THEN
            CALL s_apmt520_posted_upd(g_pmds.pmdsdocno) RETURNING r_success
         END IF
      END IF
   END IF
   
   LET g_site = l_site
   LET g_argv[1] = l_argv1

   RETURN r_success
END FUNCTION

#整批產生收貨原始需求分配明細資料由s_aic_carry_gen_tri_mr呼叫
#因該應用元件使用g_site故需先改為當前營運據點
PRIVATE FUNCTION s_aic_carry_ins_pmdv()
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_site      LIKE sfaa_t.sfaasite   #備份營運據點

   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = g_pmdu.pmdusite  #將g_site替換成當站營運據點

   CALL s_apmt520_gen_pmdv(g_pmdt.pmdtdocno,g_pmdt.pmdtseq)
   RETURNING r_success

   LET g_site = l_site           #還原g_site

   RETURN r_success
END FUNCTION

#由來源單號取得對應營運據點之單號
PRIVATE FUNCTION s_aic_carry_get_fromdocno(p_tosite,p_fromdocno,p_fromseq,p_type1,p_type2)
   DEFINE p_tosite      LIKE xmdk_t.xmdksite      #目的營運據點
   DEFINE p_fromdocno   LIKE xmdk_t.xmdkdocno     #來源單號
   DEFINE p_fromseq     LIKE xmdl_t.xmdlseq       #來源項次(可Null)
   DEFINE p_type1       LIKE type_t.chr1          #來源類型 1.xmdk_t(出貨/簽收/銷退單) 2.pmdt_t(入庫/倉退單)
   DEFINE p_type2       LIKE type_t.chr1          #目的類型 1.訂單 
                                                  #         2.採購單
                                                  #         3.出貨→出通單/簽收→出貨/銷退→出貨單
                                                  #         4.入庫→採購單/倉退→入庫單
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_todocno     LIKE pmdl_t.pmdldocno     #目的單號
   DEFINE l_fromnum1    LIKE xmdk_t.xmdk006        #訂單單號、採購單號
   DEFINE l_fromnum2    LIKE xmdk_t.xmdk005        #來源出通單號
   DEFINE l_aicnum1     LIKE xmda_t.xmda031        #多角序號
   DEFINE l_aicnum2     LIKE xmdg_t.xmdg055
   DEFINE l_pmds000     LIKE pmds_t.pmds000       #151103 earl add
   DEFINE l_xmdk000     LIKE xmdk_t.xmdk000
   DEFINE l_xmdk005     LIKE xmdk_t.xmdk005
   DEFINE l_xmdl001     LIKE xmdl_t.xmdl001
   DEFINE l_xmdl002     LIKE xmdl_t.xmdl002
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_todocno = ''
   
   LET l_fromnum1 = ''
   LET l_fromnum2 = ''
   LET l_aicnum1 = ''
   LET l_aicnum2 = ''
   LET l_xmdk000 = ''
   LET l_pmds000 = ''  #151103 earl add
   
   CASE p_type1  #來源類型
      WHEN '1'   #xmdk_t(出貨/簽收/銷退單)
         #出貨單/簽收單/銷退單單頭之來源單號、訂單單號
         SELECT xmdk000,
                xmdk005,xmdk006
           INTO l_xmdk000,
                l_fromnum2,l_fromnum1
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = p_fromdocno
         
         #SEL出通單/出貨單號(xmdl001)
         IF cl_null(l_fromnum2) THEN
            CALL s_aic_carry_sel_xmdl001_xmdl002(p_fromdocno,p_fromseq) RETURNING r_success,l_xmdl001,l_xmdl002
            
            IF NOT r_success THEN
               RETURN r_success,r_todocno
            END IF
            
            LET l_fromnum2 = l_xmdl001
         END IF
         
         #來源為簽收單，用來源出貨單再抓一次資料
         IF l_xmdk000 = '4' OR l_xmdk000 = '7' THEN  #簽收單、借貨還價單
            #來源出貨單
            IF NOT cl_null(l_fromnum2) THEN
               LET l_xmdk005 = ''   #來源出通單
               SELECT xmdk000,
                      xmdk005
                 INTO l_xmdk000,
                      l_xmdk005
                 FROM xmdk_t
                WHERE xmdkent = g_enterprise
                  AND xmdkdocno = l_fromnum2
               
               IF NOT cl_null(l_xmdk005) THEN
                  LET l_fromnum2 = l_xmdk005
               ELSE
                  #抓單身第一筆xmdl001
                  CALL s_aic_carry_sel_xmdl001_xmdl002(l_xmdl001,l_xmdl002) RETURNING r_success,l_xmdl001,l_xmdl002
                  
                  IF NOT r_success THEN
                     RETURN r_success,r_todocno
                  END IF

                  LET l_fromnum2 = l_xmdl001
               END IF
            END IF
               
         END IF
         
         #SEL出通/出貨多角序號
         IF l_xmdk000 = '1' THEN  #來源為出貨單
            #出通單多角序號
            SELECT xmdg055
              INTO l_aicnum2
              FROM xmdg_t
             WHERE xmdgent = g_enterprise
               AND xmdgdocno = l_fromnum2

         ELSE
            #出貨單多角序號
            SELECT xmdk035
              INTO l_aicnum2
              FROM xmdk_t
             WHERE xmdkent = g_enterprise
               AND xmdkdocno = l_fromnum2
         END IF
         
         IF l_xmdk000 = '6' THEN #銷退
            LET l_pmds000 = '7'  #倉退
         END IF
         
         #SEL訂單單號
         IF cl_null(l_fromnum1) THEN
            #取得第單身第一筆訂單單號
            CALL s_aic_carry_sel_xmdl003_sql(p_fromseq)
            
            PREPARE s_aic_carry_xmdl_pre4 FROM g_sql
            DECLARE s_aic_carry_xmdl_cs4 SCROLL CURSOR FOR s_aic_carry_xmdl_pre4
       
            OPEN s_aic_carry_xmdl_cs4 USING p_fromdocno
            FETCH FIRST s_aic_carry_xmdl_cs4 INTO l_fromnum1
            IF SQLCA.sqlcode AND SQLCA.sqlcode <> 100 THEN #151102 earl mod
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FETCH:s_aic_carry_xmdl_cs4"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
            END IF
            
            CLOSE s_aic_carry_xmdl_cs4
            FREE s_aic_carry_xmdl_pre4
       
            IF NOT r_success THEN
               RETURN r_success,r_todocno
            END IF

#151103 earl mark
#            IF cl_null(l_fromnum1) THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = ""
#               LET g_errparam.code   = "aic-00081"   #查無與該來源出貨單之訂單單號！
#               LET g_errparam.popup  = TRUE
#               CALL cl_err()
#       
#               LET r_success = FALSE
#               RETURN r_success,r_todocno
#            END IF
         END IF
         
         #訂單多角序號
         SELECT xmda031
           INTO l_aicnum1
           FROM xmda_t
          WHERE xmdaent = g_enterprise
            AND xmdadocno = l_fromnum1

#151103 earl mark
#         IF cl_null(l_aicnum1) THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_fromnum1
#            LET g_errparam.code   = "aic-00082"   #查無該訂單之多角序號！
#            LET g_errparam.popup  = TRUE
#            CALL cl_err()
#        
#            LET r_success = FALSE
#            RETURN r_success,r_todocno
#         END IF

      WHEN '2'   #pmdt_t(入庫/倉退單)
         #apmt570單頭之pmds006為收貨單號，非採購單號，直接取單身
         #取得第單身第一筆採購單號
         CALL s_aic_carry_sel_pmdt001_sql(p_fromseq)
                     
         PREPARE s_aic_carry_pmdt_pre5 FROM g_sql
         DECLARE s_aic_carry_pmdt_cs5 SCROLL CURSOR FOR s_aic_carry_pmdt_pre5
         
         OPEN s_aic_carry_pmdt_cs5 USING p_fromdocno
         FETCH FIRST s_aic_carry_pmdt_cs5 INTO l_pmds000,l_fromnum2,l_fromnum1  #151103 earl mod

         IF SQLCA.sqlcode AND SQLCA.sqlcode <> 100 THEN #151102 earl mod
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FETCH:s_aic_carry_pmdt_cs5"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
         END IF

         CLOSE s_aic_carry_pmdt_cs5
         FREE s_aic_carry_pmdt_pre5
         
         IF NOT r_success THEN
            RETURN r_success,r_todocno
         END IF

         #151103 earl add
         IF l_pmds000 = '7' OR l_pmds000 = '14' OR l_pmds000 = '15' THEN   #倉退
            #入庫多角序號
            #(抓收貨入庫) #170620-00057#1-add
            SELECT pmds041
              INTO l_aicnum2
              FROM pmds_t
             WHERE pmdsent = g_enterprise
               AND pmdsdocno = l_fromnum2
            #170620-00057#1-s-add
            #收貨入庫抓不到，就抓入庫單的(若有多筆，就取第一張的多角序號)
            IF cl_null(l_aicnum2) THEN
               #161222-00012#7 --s mark
               #SELECT pmds041
               #  INTO l_aicnum2
               #  FROM pmds_t
               # WHERE pmdsent = g_enterprise
               #   AND pmds006 = l_fromnum2
               # ORDER BY pmdsdocno
               #161222-00012#7 --e mark
               #161222-00012#7 --s add
               SELECT pmds041 INTO l_aicnum2
                  FROM pmds_t,pmdt_t
                 WHERE pmdsent = pmdtent AND pmdsdocno = pmdtdocno
                   AND pmdsent = g_enterprise
                   AND pmdt027 = l_fromnum2
                 ORDER BY pmdsdocno DESC
               #161222-00012#7 --e add
            END IF
            #170620-00057#1-e-add
            LET l_xmdk000 = '6'  #銷退
         ELSE
            #採購多角序號
            SELECT pmdl031
              INTO l_aicnum2
              FROM pmdl_t
             WHERE pmdlent = g_enterprise
               AND pmdldocno = l_fromnum2
         END IF

#151103 earl mark
#         IF cl_null(l_fromnum1) THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = ""
#            LET g_errparam.code   = "aic-00116"   #查無與該來源入庫單之採購單號！
#            LET g_errparam.popup  = TRUE
#            CALL cl_err()
#       
#            LET r_success = FALSE
#            RETURN r_success,r_todocno
#         END IF      

         #採購多角序號
         SELECT pmdl031
           INTO l_aicnum1
           FROM pmdl_t
          WHERE pmdlent = g_enterprise
            AND pmdldocno = l_fromnum1

#151103 earl mark
#         IF cl_null(l_aicnum1) THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = l_fromnum1
#            LET g_errparam.code   = "aic-00117"   #查無該採購單之多角序號！
#            LET g_errparam.popup  = TRUE
#            CALL cl_err()
#        
#            LET r_success = FALSE
#            RETURN r_success,r_todocno
#         END IF
         
   END CASE
   
   CASE p_type2  #目的類型
      WHEN '1'   #訂單
         IF NOT cl_null(l_aicnum1) THEN   #151103 earl add
            #取得目的營運據點訂單單號
            SELECT xmdadocno
              INTO r_todocno
              FROM xmda_t
             WHERE xmdaent = g_enterprise
               AND xmdasite = p_tosite
               AND xmda031 = l_aicnum1
            
            IF cl_null(r_todocno) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_fromnum1
               LET g_errparam.code   = "aic-00192"   #取得目的營運據點之訂單單號失敗
               LET g_errparam.popup  = TRUE
               CALL cl_err()   
               
               LET r_success = FALSE
               RETURN r_success,r_todocno
            END IF
         END IF
         
      WHEN '2'   #採購單
         IF NOT cl_null(l_aicnum1) THEN   #151103 earl add
            #取得目的營運據點採購單號
            SELECT pmdldocno
              INTO r_todocno
              FROM pmdl_t
             WHERE pmdlent = g_enterprise
               AND pmdlsite = p_tosite
               AND pmdl031 = l_aicnum1
            
            IF cl_null(r_todocno) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = l_fromnum1
               LET g_errparam.code   = "aic-00052"   #取得目的營運據點之採購單號失敗
               LET g_errparam.popup  = TRUE
               CALL cl_err()   
               
               LET r_success = FALSE
               RETURN r_success,r_todocno
            END IF
         END IF
      
      WHEN '3'  #出通單/出貨單
         IF NOT cl_null(l_aicnum2) AND NOT cl_null(l_xmdk000) THEN   #151103 earl add
            IF l_xmdk000 = '1' THEN  #來源為出貨單
              #抓取出通單
              SELECT xmdgdocno
                INTO r_todocno
                FROM xmdg_t
               WHERE xmdgent = g_enterprise
                 AND xmdgsite = p_tosite
                 AND xmdg055 = l_aicnum2
            ELSE
               #抓取出貨單
               SELECT xmdkdocno
                 INTO r_todocno
                 FROM xmdk_t
                WHERE xmdkent = g_enterprise
                  AND xmdk000 = '1'
                  AND xmdksite = p_tosite
                  AND xmdk035 = l_aicnum2
            END IF
         END IF
         
      WHEN '4'  #採購單/入庫單
         IF NOT cl_null(l_aicnum2) AND NOT cl_null(l_pmds000) THEN   #151103 earl add
            IF l_pmds000 = '7' OR l_pmds000 = '14' OR l_pmds000 = '15' THEN   #倉退
               #抓取入庫單
               SELECT pmdsdocno
                 INTO r_todocno
                 FROM pmds_t
                WHERE pmdsent = g_enterprise
                  AND pmds000 IN ('3','20','4','24','6','12','13','25')
                  AND pmdssite = p_tosite
                  AND pmds041 = l_aicnum2               
            ELSE
               #抓取採購單
               SELECT pmdldocno
                 INTO r_todocno
                 FROM pmdl_t
                WHERE pmdlent = g_enterprise
                  AND pmdlsite = p_tosite
                  AND pmdl031 = l_aicnum2
            END IF
         END IF
   END CASE

   RETURN r_success,r_todocno   
END FUNCTION

################################################################################
# Descriptions...: 取得"預設單別"
# Memo...........:
# Usage..........: CALL s_aic_carry_get_doctype(p_icaf001,p_icaf002,p_type)
#                  RETURNING r_success,r_slip
# Input parameter: p_icaf001     LIKE icaf_t.icaf001   #來源營運據點
#                : p_icaf002     LIKE icaf_t.icaf002   #目的營運據點
#                : p_type        LIKE type_t.chr20     #需求類型
# Return code....: r_success     LIKE type_t.num5      #執行結果
#                : r_slip        LIKE type_t.chr10     #單別
# Date & Author..: 141120 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_doctype(p_icaf001,p_icaf002,p_type)
   DEFINE p_icaf001     LIKE icaf_t.icaf001   #來源營運據點
   DEFINE p_icaf002     LIKE icaf_t.icaf002   #目的營運據點
   DEFINE p_type        LIKE type_t.chr20     #需求類型
   DEFINE r_success     LIKE type_t.num5      #執行結果
   DEFINE r_slip        LIKE type_t.chr10     #單別

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_slip = ''

   IF cl_null(p_type) OR
      (p_type <> 'axmt520' AND p_type <> 'axmt540' AND p_type <> 'axmt620' AND p_type <> 'apmt530') THEN

     #170816-00007#31 -S mark
     #INITIALIZE g_errparam TO NULL
     #LET g_errparam.extend = ""
     #LET g_errparam.code   = "sub-00280"   #傳入參數為空或傳入值不正確!
     #LET g_errparam.popup  = TRUE
     #CALL cl_err()
     #
     #LET r_success = FALSE
     #RETURN r_success,r_slip
     #170816-00007#31 -E mark
     
     #170816-00007#31 -S add
     #修改錯誤訊息報錯內容
      LET g_msg = ''
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      LET g_colname_1 = cl_getmsg("sub-01482",g_dlang)   #需求類型
      LET g_msg = g_colname_1   
      IF NOT cl_null(g_msg) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_msg 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_slip
      END IF
     #170816-00007#31 -E add
   END IF
     
   CALL s_aic_carry_doctype(p_icaf001,p_icaf002,p_type) RETURNING r_slip
   IF NOT cl_null(r_slip) THEN
      RETURN r_success,r_slip
   END IF

   CALL s_aic_carry_doctype('ALL',p_icaf002,p_type) RETURNING r_slip
   IF NOT cl_null(r_slip) THEN
      RETURN r_success,r_slip
   END IF

   CALL s_aic_carry_doctype(p_icaf001,'ALL',p_type) RETURNING r_slip
   IF NOT cl_null(r_slip) THEN
      RETURN r_success,r_slip
   END IF

   CALL s_aic_carry_doctype('ALL','ALL',p_type) RETURNING r_slip
   IF NOT cl_null(r_slip) THEN
      RETURN r_success,r_slip
   END IF

   #若無資料
   CASE p_type
      WHEN 'axmt520'
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "aic-00055"   #查無符合條件之預設出貨通知單別
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
      WHEN 'axmt540'
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "aic-00056"   #查無符合條件之預設出貨單別
         LET g_errparam.popup  = TRUE
         CALL cl_err()

      WHEN 'axmt620'
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "aic-00057"   #查無符合條件之預設Invoice單別
         LET g_errparam.popup  = TRUE
         CALL cl_err()

      WHEN 'apmt530'
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "aic-00096"   #查無符合條件之預設入庫單別
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
   END CASE

   LET r_success = FALSE
   RETURN r_success,r_slip
END FUNCTION

#由s_aic_carry_get_doctype呼叫
PRIVATE FUNCTION s_aic_carry_doctype(p_icaf001,p_icaf002,p_type)
   DEFINE p_icaf001     LIKE icaf_t.icaf001   #來源營運據點
   DEFINE p_icaf002     LIKE icaf_t.icaf002   #目的營運據點
   DEFINE p_type        LIKE type_t.chr20     #需求類型
   DEFINE r_slip        LIKE type_t.chr5      #單別
   DEFINE l_icaf026     LIKE icaf_t.icaf026   #預設出通單別
   DEFINE l_icaf015     LIKE icaf_t.icaf015   #預設出貨單別
   DEFINE l_icaf027     LIKE icaf_t.icaf027   #預設Invoice單別
   DEFINE l_icaf005     LIKE icaf_t.icaf005   #預設入庫單別

   WHENEVER ERROR CONTINUE

   LET l_icaf005 = ''
   LET l_icaf026 = ''
   LET l_icaf015 = ''
   LET l_icaf027 = ''   
   LET r_slip = ''
   SELECT icaf005,icaf026,icaf015,icaf027
     INTO l_icaf005,l_icaf026,l_icaf015,l_icaf027
     FROM icaf_t
    WHERE icafent = g_enterprise
      AND icaf001 = p_icaf001
      AND icaf002 = p_icaf002

   CASE p_type
      WHEN 'axmt520'
         LET r_slip = l_icaf026
      WHEN 'axmt540'
         LET r_slip = l_icaf015
      WHEN 'axmt620'
         LET r_slip = l_icaf027
      WHEN 'apmt530'
         LET r_slip = l_icaf005
   END CASE

   RETURN r_slip
END FUNCTION

################################################################################
# Descriptions...: 產生統購統付之第0站入庫單
# Memo...........: 請依照順序CALL
#                : CALL s_tax_recount_tmp()
#                : CALL s_transaction_begin()
#                : CALL s_aic_carry_gen_tri_rm()
#                : CALL s_transaction_end(Y,0)
# Usage..........: CALL s_aic_carry_gen_tri_rm(p_pmdsdocno)
#                  RETURNING r_success,r_pmdsdocno
# Input parameter: p_pmdsdocno                          #最終站入庫單號
#                : 
# Return code....: r_success     LIKE type_t.num5       #執行結果
#                : r_pmdsdocno   LIKE pmds_t.pmdsdocno  #產生之第0站入庫單號
# Date & Author..: 150811 By earl
# Modify.........: 150917-00001#4 151111 earl 增加製造批序號拋轉
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_rm(p_pmdsdocno)
   DEFINE p_pmdsdocno     LIKE pmds_t.pmdsdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_pmdsdocno     LIKE pmds_t.pmdsdocno
   
   DEFINE l_pmds000       LIKE pmds_t.pmds000
   DEFINE l_pmds006       LIKE pmds_t.pmds006
   DEFINE l_pmds014       LIKE pmds_t.pmds014
   
   DEFINE l_slip          LIKE pmds_t.pmdsdocno
   DEFINE l_site          LIKE pmds_t.pmdssite
   DEFINE l_pmdsstus      LIKE pmds_t.pmdsstus
   DEFINE l_pmdlsite      LIKE pmdl_t.pmdlsite
   
   DEFINE l_imaf          RECORD
      imaf091                LIKE imaf_t.imaf091,
      imaf092                LIKE imaf_t.imaf092
                          END RECORD
   DEFINE l_xrcd          RECORD
      xrcd103                LIKE xrcd_t.xrcd103,
      xrcd104                LIKE xrcd_t.xrcd104,
      xrcd105                LIKE xrcd_t.xrcd105
                          END RECORD
      
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET r_pmdsdocno = ''
   
   LET g_sql = "SELECT pmdt001 ",
               "  FROM pmdt_t",
               " WHERE pmdtent = ",g_enterprise,
               "   AND pmdtdocno = '",p_pmdsdocno,"'",
               "   AND pmdt001 IS NOT NULL",
               " ORDER BY pmdtseq"
   PREPARE s_aic_carry_pmdt_pre3 FROM g_sql
   DECLARE s_aic_carry_pmdt_cs3 SCROLL CURSOR FOR s_aic_carry_pmdt_pre3
   
   LET l_pmds000 = ''  #單據性質
   LET l_pmds006 = ''  #來源單號
   LET l_pmds014 = ''  #多角性質
   SELECT pmds000,pmds006,pmds014
     INTO l_pmds000,l_pmds006,l_pmds014
     FROM pmds_t
    WHERE pmdsent = g_enterprise
      AND pmdsdocno = p_pmdsdocno
   
   #收貨入庫單的來源單號才是採購單
   IF l_pmds000 <> '20' AND l_pmds000 <> '3' THEN
      LET l_pmds006 = ''
   END IF
   
   #非4:統購統付不產生
   IF l_pmds014 <> '4' THEN
      RETURN r_success,r_pmdsdocno
   END IF
   
   #來源採購單號
   IF cl_null(l_pmds006) THEN
      OPEN s_aic_carry_pmdt_cs3
      FETCH FIRST s_aic_carry_pmdt_cs3 INTO l_pmds006
      IF cl_null(l_pmds006) THEN
         INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'apm-00983'   #"多角性質"為"4.統購統付"時，來源採購單不可為空！
            LET g_errparam.extend = p_pmdsdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
         LET r_success = FALSE
         RETURN r_success,r_pmdsdocno
      END IF
   END IF
   
   LET l_pmdlsite = ''
   SELECT pmdlsite
     INTO l_pmdlsite
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = l_pmds006
   
   #抓來源採購單的下站單別
   CALL s_aooi210_get_doc(l_pmdlsite,'','4',l_pmds006,'apmt530','apm-00984') RETURNING r_success,l_slip
   IF NOT r_success THEN
      RETURN r_success,r_pmdsdocno
   END IF

   INITIALIZE g_pmds.* TO NULL
   SELECT *
     INTO g_pmds.*
     FROM pmds_t
    WHERE pmdsent = g_enterprise
      AND pmdsdocno = p_pmdsdocno

   LET g_pmds.pmdsent = g_enterprise
   LET g_pmds.pmdssite = l_pmdlsite
   LET g_pmds.pmdsdocdt = g_today
   LET g_pmds.pmds001 = g_today  #扣帳日期
   LET g_pmds.pmds011 = '1'      #採購性質
   LET g_pmds.pmdsownid = g_user
   LET g_pmds.pmdsowndp = g_dept
   LET g_pmds.pmdscrtid = g_user
   LET g_pmds.pmdscrtdp = g_dept
   LET g_pmds.pmdscrtdt = cl_get_current()
   LET g_pmds.pmdsmodid = ''
   LET g_pmds.pmdsmoddt = ''
   LET g_pmds.pmdscnfid = ''
   LET g_pmds.pmdscnfdt = ''
   LET g_pmds.pmdspstid = ''
   LET g_pmds.pmdspstdt = ''
   LET g_pmds.pmdsstus = 'N'
   
   LET g_pmds.pmds041 = p_pmdsdocno    #多角序號存放該入庫單號
   
   #取匯率
   CALL s_aic_carry_exchange(g_pmds.pmds048,g_pmds.pmdssite,g_pmds.pmdsdocdt,g_pmds.pmds037,'','2')
   RETURNING r_success,g_pmds.pmds038
   IF NOT r_success THEN
      RETURN r_success,r_pmdsdocno
   END IF
   
   #收貨入庫單的來源單號才是採購單
   IF g_pmds.pmds000 <> '20' AND g_pmds.pmds000 <> '3' THEN
      LET g_pmds.pmds000 = '3'
      LET g_pmds.pmds006 = ''
      LET g_pmds.pmds006 = l_pmds006   #180316-00044#1 Add By 06137  180320
   END IF
   
   #自動產生單號
   CALL s_aooi200_gen_docno(g_pmds.pmdssite,l_slip,g_pmds.pmdsdocdt,'apmt530')
   RETURNING r_success,g_pmds.pmdsdocno
   IF NOT r_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00003'  #自動生成單據編號有誤，請重新確認
      LET g_errparam.extend = g_pmds.pmdsdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
    
      RETURN r_success,r_pmdsdocno
   END IF

   LET r_pmdsdocno = g_pmds.pmdsdocno

   INSERT INTO pmds_t VALUES g_pmds.*
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:pmds_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success,r_pmdsdocno
   END IF
   
   #SELECT FROM pmdt_t
   LET g_sql = " SELECT * ",
               "   FROM pmdt_t",
               "  WHERE pmdtent = ",g_enterprise,
               "    AND pmdtdocno = '",p_pmdsdocno,"'",
               "  ORDER BY pmdtseq"
   PREPARE s_aic_carry_produce_pmdt_pre FROM g_sql
   DECLARE s_aic_carry_produce_pmdt_cs CURSOR WITH HOLD FOR s_aic_carry_produce_pmdt_pre
   
   #SELECT FROM pmdu_t
   LET g_sql = "SELECT * ",
               "  FROM pmdu_t",
               " WHERE pmduent = ",g_enterprise,
               "   AND pmdudocno = '",p_pmdsdocno,"'",
               "   AND pmduseq = ?"
   PREPARE s_aic_carry_produce_pmdu_pre FROM g_sql
   DECLARE s_aic_carry_produce_pmdu_cs CURSOR WITH HOLD FOR s_aic_carry_produce_pmdu_pre
      
   #SELECT FROM pmdv_t
   LET g_sql = "SELECT * ",
               "  FROM pmdv_t",
               " WHERE pmdvent = ",g_enterprise,
               "   AND pmdvdocno = '",p_pmdsdocno,"'",
               "   AND pmdvseq = ?"
   PREPARE s_aic_carry_produce_pmdv_pre FROM g_sql
   DECLARE s_aic_carry_produce_pmdv_cs CURSOR WITH HOLD FOR s_aic_carry_produce_pmdv_pre
   
   INITIALIZE g_pmdt.* TO NULL
   FOREACH s_aic_carry_produce_pmdt_cs INTO g_pmdt.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:s_aic_carry_produce_pmdt_cs"
         LET g_errparam.popup = TRUE
         CALL cl_err()           
         LET r_success = FALSE
         EXIT FOREACH
      END IF   
      
      LET g_pmdt.pmdtent = g_pmds.pmdsent
      LET g_pmdt.pmdtsite = g_pmds.pmdssite
      LET g_pmdt.pmdtdocno = g_pmds.pmdsdocno
      
      LET g_pmdt.pmdt053 = 0      #允收數量
      LET g_pmdt.pmdt054 = 0      #已入庫量
      LET g_pmdt.pmdt055 = 0      #驗退量
      LET g_pmdt.pmdt056 = 0      #主帳套已請款數量
      LET g_pmdt.pmdt057 = 0      #帳套二已請款數量
      LET g_pmdt.pmdt058 = 0      #帳套三已請款數量
      LET g_pmdt.pmdt066 = 0      #主帳套暫估數量
      LET g_pmdt.pmdt067 = 0      #帳套二暫估數量
      LET g_pmdt.pmdt068 = 0      #帳套三暫估數量
      LET g_pmdt.pmdt069 = 0      #已開發票數量
      
      #料件預設庫位、預設儲位
      INITIALIZE l_imaf.* TO NULL
      CALL s_aic_carry_sel_imaf091_imaf092(g_pmdt.pmdtsite,g_pmdt.pmdt006)
      RETURNING l_imaf.imaf091,l_imaf.imaf092
      
      #庫位
      IF cl_null(l_imaf.imaf091) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aim-00245'   #營運據點%1料件編號%2無預設之庫位、儲位！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_pmdt.pmdtsite
         LET g_errparam.replace[2] = g_pmdt.pmdt006
         
         CALL cl_err()           
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #儲位
      IF cl_null(l_imaf.imaf092) THEN
         LET l_imaf.imaf092 = ' '
      END IF
      
      IF g_pmdt.pmdt062 <> 'Y' THEN   #非多庫儲批
         #庫位、儲位替換成料件預設庫位、儲位
         LET g_pmdt.pmdt016 = l_imaf.imaf091    #庫位
         LET g_pmdt.pmdt017 = l_imaf.imaf092    #儲位
         LET g_pmdt.pmdt063 = ' '  #庫存管理特徵
      END IF
      
      #取得未稅金額、稅額、含稅金額
      CALL s_aic_carry_get_amount(g_pmdt.pmdtsite,g_pmdt.pmdtdocno,g_pmdt.pmdtseq,g_pmds.pmds037,g_pmdt.pmdt024,g_pmdt.pmdt036,g_pmdt.pmdt046)
      RETURNING r_success,g_pmdt.pmdt038,g_pmdt.pmdt047,g_pmdt.pmdt039
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      INSERT INTO pmdt_t VALUES g_pmdt.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INSERT:xmdl_t" 
         LET g_errparam.code = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      INITIALIZE g_pmdu.* TO NULL
      OPEN s_aic_carry_produce_pmdu_cs USING g_pmdt.pmdtseq
      FOREACH s_aic_carry_produce_pmdu_cs INTO g_pmdu.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:s_aic_carry_produce_pmdu_cs"
            LET g_errparam.popup = TRUE
            CALL cl_err()           
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         LET g_pmdu.pmduent = g_pmdt.pmdtent
         LET g_pmdu.pmdusite = g_pmdt.pmdtsite
         LET g_pmdu.pmdudocno = g_pmdt.pmdtdocno
         LET g_pmdu.pmdu005 = ' ' #庫存管理特徵
         LET g_pmdu.pmdu006 = l_imaf.imaf091    #庫位
         LET g_pmdu.pmdu007 = l_imaf.imaf092    #儲位
         LET g_pmdu.pmdu013 = 0   #允收數量
         LET g_pmdu.pmdu014 = 0   #已入庫數量
         LET g_pmdu.pmdu015 = 0   #已驗退數量
         
         INSERT INTO pmdu_t VALUES g_pmdu.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:pmdu_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #150917-00001#4 151113 earl add s
         IF NOT s_aic_carry_inao_ins(p_pmdsdocno,g_pmdu.pmduseq,g_pmdu.pmduseq1,g_pmdu.pmdusite,g_pmdu.pmdudocno,
                                     g_pmdu.pmdu005,g_pmdu.pmdu006,g_pmdu.pmdu007,'1','2') THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #150917-00001#4 151113 earl add e
         
      END FOREACH

      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      #整批產生收貨原始需求分配明細資料
      INITIALIZE g_pmdv.* TO NULL
      OPEN s_aic_carry_produce_pmdv_cs USING g_pmdt.pmdtseq
      FOREACH s_aic_carry_produce_pmdv_cs INTO g_pmdv.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:s_aic_carry_produce_pmdv_cs"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF

         LET g_pmdv.pmdvent = g_pmdt.pmdtent
         LET g_pmdv.pmdvsite = g_pmdt.pmdtsite
         LET g_pmdv.pmdvdocno = g_pmdt.pmdtdocno
         
         INSERT INTO pmdv_t VALUES g_pmdv.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:pmdv_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF  
      END FOREACH
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success,r_pmdsdocno
   END IF
   
   #重新計算整單的未稅、含稅總金額
   INITIALIZE l_xrcd.* TO NULL
   CALL s_aic_carry_return_amount(g_pmds.pmdsdocno)
   RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105            
      
   UPDATE pmds_t
      SET pmds043 = l_xrcd.xrcd103,
          pmds044 = l_xrcd.xrcd105,
          pmds046 = l_xrcd.xrcd104
    WHERE pmdsent = g_enterprise 
      AND pmdsdocno = g_pmds.pmdsdocno
      
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "UPDATE:pmds_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_pmdsdocno
   END IF
   
   CALL s_aic_carry_ins_ooff('apmt530',r_pmdsdocno,'apmt530',p_pmdsdocno) RETURNING r_success #170817-00043#5 add
   
   #確認過帳
   CALL s_aic_carry_pmds_conf() RETURNING r_success
   IF NOT r_success THEN
      RETURN r_success,r_pmdsdocno
   END IF
      
   RETURN r_success,r_pmdsdocno
END FUNCTION

################################################################################
# Descriptions...: CREATE TEMP TABLE
# Memo...........:
# Usage..........: s_aic_carry_create_temp_table_storage()
#                  
# Input parameter: 
#                : 
# Return code....: r_success     執行結果
#                : 
# Date & Author..: 141125 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_create_temp_table_storage()
   DEFINE r_success    LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
#nouse   
#   #DROP TEMP TABLE
#   CALL s_aic_carry_drop_temp_table_storage()
#
#   #CREATE TEMP TABLE
#   LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_pmdt_temp AS ",
#               "SELECT * FROM pmdt_t "
#   PREPARE s_aic_carry_pmdt_temp FROM g_sql
#   EXECUTE s_aic_carry_pmdt_temp
#   FREE s_aic_carry_pmdt_temp
#   
#   IF SQLCA.sqlcode THEN      
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = "CREATE:s_aic_carry_pmdt_temp"
#      LET g_errparam.code   = SQLCA.sqlcode
#      LET g_errparam.popup  = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#
#   LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_pmdu_temp AS ",
#               "SELECT * FROM pmdu_t "
#   PREPARE s_aic_carry_pmdu_temp FROM g_sql
#   EXECUTE s_aic_carry_pmdu_temp
#   FREE s_aic_carry_pmdu_temp
#
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = "CREATE:s_aic_carry_pmdu_temp"
#      LET g_errparam.code   = SQLCA.sqlcode
#      LET g_errparam.popup  = TRUE
#      CALL cl_err()
#      
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#
#   LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_pmdv_temp AS ",
#               "SELECT * FROM pmdv_t "
#   PREPARE s_aic_carry_pmdv_temp FROM g_sql
#   EXECUTE s_aic_carry_pmdv_temp
#   FREE s_aic_carry_pmdv_temp
#   
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = "CREATE:s_aic_carry_pmdv_temp"
#      LET g_errparam.code   = SQLCA.sqlcode
#      LET g_errparam.popup  = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: DROP TEMP TABLE
# Memo...........:
# Usage..........: CALL s_aic_carry_drop_temp_table_storage()
#                  
# Input parameter: 
#                : 
# Return code....: 
#                : 
# Date & Author..: 141125 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_drop_temp_table_storage()
   WHENEVER ERROR CONTINUE
#nouse
#   #刪除TEMP TABLE
#   DROP TABLE s_aic_carry_pmdt_temp
#   DROP TABLE s_aic_carry_pmdu_temp
#   DROP TABLE s_aic_carry_pmdv_temp
END FUNCTION

################################################################################
# Descriptions...: 更新目的據點單據之客戶/廠商、單價、金額等資訊
# Memo...........: 請依順序CALL
#                  CALL s_tax_recount_tmp()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_upd_tri_price()
#                  CALL s_transaction_end(Y,0)
# Usage..........: CALL s_aic_carry_upd_tri_price(p_fromsite,p_fromdocno,p_tosite,p_todocno,p_type,p_icab001,p_icab002)
#                  RETURNING r_success
# Input parameter: p_fromsite    LIKE pmds_t.pmdssite    #來源營運據點
#                : p_fromdocno   LIKE pmds_t.pmdsdocno   #來源單號
#                : p_tosite      LIKE xmdk_t.xmdksite    #目的營運據點
#                : p_todocno     LIKE xmdk_t.xmdkdocno   #目的單號
#                : p_type        LIKE type_t.chr20       #更新類型(axmt540,apmt570)
#                : p_icab001     LIKE icab_t.icab001     #目的流程代碼
#                : p_icab002     LIKE icab_t.icab002     #目的站別
# Return code....: r_success     LIKE type_t.num5        #執行結果
#                : 
# Date & Author..: 141124 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_upd_tri_price(p_fromsite,p_fromdocno,p_tosite,p_todocno,p_type,p_icab001,p_icab002)
   DEFINE p_fromsite    LIKE pmds_t.pmdssite    #來源營運據點
   DEFINE p_fromdocno   LIKE pmds_t.pmdsdocno   #來源單號
   DEFINE p_tosite      LIKE xmdk_t.xmdksite    #目的營運據點
   DEFINE p_todocno     LIKE xmdk_t.xmdkdocno   #目的單號
   DEFINE p_type        LIKE type_t.chr20       #更新類型(axmt540,apmt570)
   DEFINE p_icab001     LIKE icab_t.icab001     #目的流程代碼
   DEFINE p_icab002     LIKE icab_t.icab002     #目的站別

   DEFINE r_success     LIKE type_t.num5        #執行結果

   DEFINE l_price       RECORD
             oodb005       LIKE oodb_t.oodb005,    #含稅否
             oodb006       LIKE oodb_t.oodb006,    #稅率
             ooef024       LIKE ooef_t.ooef024,    #客戶/廠商編號
             coin          LIKE xmdk_t.xmdk016,    #幣別
             date          LIKE xmdk_t.xmdkdocdt,  #單據日期
             exchange      LIKE xmdk_t.xmdk017,    #匯率
             inoutsale     LIKE xmdk_t.xmdk042     #內外銷(購)
                        END RECORD
                        
   DEFINE l_xmdk013     LIKE xmdk_t.xmdk013
   DEFINE l_xmdk016     LIKE xmdk_t.xmdk016
   DEFINE l_seq         LIKE xmdl_t.xmdlseq
   DEFINE l_xmdl022     LIKE xmdl_t.xmdl022
   DEFINE l_xmdl027     LIKE xmdl_t.xmdl027
   DEFINE l_xmdl028     LIKE xmdl_t.xmdl028
   DEFINE l_xmdl029     LIKE xmdl_t.xmdl029
   DEFINE l_uniprice    LIKE xmdl_t.xmdl024     #單價
   DEFINE l_pmdt024     LIKE pmdt_t.pmdt024
   DEFINE l_xrcd103     LIKE xrcd_t.xrcd103
   DEFINE l_xrcd104     LIKE xrcd_t.xrcd104
   DEFINE l_xrcd105     LIKE xrcd_t.xrcd105
   DEFINE l_pmdt038     LIKE pmdt_t.pmdt038
   DEFINE l_pmdt047     LIKE pmdt_t.pmdt047
   DEFINE l_pmdt039     LIKE pmdt_t.pmdt039

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

  #170816-00007#31 -S mark
  #IF cl_null(p_fromsite) OR
  #   cl_null(p_fromdocno) OR
  #   cl_null(p_tosite) OR
  #   cl_null(p_todocno) OR
  #   cl_null(p_type) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN      
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_fromsite) THEN
      CALL s_azzi902_get_gzzd("aici110","lbl_icaf001") RETURNING g_colname_1,g_comment_1   #來源營運據點
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_fromdocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicp400","lbl_pmds006") RETURNING g_colname_1,g_comment_1   #來源單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_tosite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici110","lbl_icaf002") RETURNING g_colname_1,g_comment_1   #目的營運據點
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_todocno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicp570","lbl_xmdkdocno") RETURNING g_colname_1,g_comment_1   #單據編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_type) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      LET g_colname_1 = cl_getmsg("sub-01475",g_dlang)   #更新類型
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF   
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1   #站別
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
      RETURN r_success
   END IF
  #170816-00007#31 -E add

   IF p_type <> 'axmt540' AND
      p_type <> 'apmt570' THEN

      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "sub-00050"   #傳入值有誤
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF

   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
   CALL s_aic_carry_get_ica(p_icab001,p_icab002)

   INITIALIZE l_price.* TO NULL

   #傳入值"來源營運據點"之"據點對應客戶/廠商編號"
   CALL s_aic_carry_get_ooef024(p_fromsite)
   RETURNING r_success,l_price.ooef024   
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   CASE p_type
      #若傳入值更新類型='axmt540',則取出"來源營運據點"之"來源單號"入庫單相關欄位,更新傳入值"目的營運據點"之出貨單號="目的單號"之以下欄位:
      WHEN 'axmt540'

         #取得稅率、含稅否
         CALL s_aic_carry_tax(p_tosite,g_icae.icae011) RETURNING r_success,l_price.oodb005,l_price.oodb006         
         IF NOT r_success THEN
            RETURN r_success
         END IF

         #SELECT來源入庫單
         SELECT pmds037
           INTO l_price.coin
           FROM pmds_t
          WHERE pmdsent = g_enterprise
            AND pmdsdocno = p_fromdocno

         #SELECT目的出貨單
         SELECT xmdkdocdt,xmdk042
           INTO l_price.date,l_price.inoutsale
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = p_todocno

         #取匯率
         CALL s_aic_carry_exchange(l_price.inoutsale,p_tosite,l_price.date,l_price.coin,'','1')
         RETURNING r_success,l_price.exchange
         IF NOT r_success THEN
            RETURN r_success
         END IF

         LET g_sql = "SELECT xmdlseq,xmdl022",
                     "  FROM xmdk_t,xmdl_t",
                     " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
                     "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_todocno,"'"
         PREPARE s_aic_carry_xmdl_pre3 FROM g_sql
         DECLARE s_aic_carry_xmdl_cs3 CURSOR FOR s_aic_carry_xmdl_pre3

         LET g_sql = "SELECT pmdt036",
                     "  FROM pmdt_t",
                     " WHERE pmdtent = ",g_enterprise,
                     "   AND pmdtdocno = '",p_fromdocno,"'",
                     "   AND pmdtseq = ?"
         PREPARE s_aic_carry_pmdt_pre1 FROM g_sql
         
         FOREACH s_aic_carry_xmdl_cs3 INTO l_seq,l_xmdl022
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FOREACH:s_aic_carry_xmdl_cs3"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
               EXIT FOREACH
            END IF

            EXECUTE s_aic_carry_pmdt_pre1 USING l_seq INTO l_uniprice
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "EXECUTE:s_aic_carry_pmdt_pre1"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
               EXIT FOREACH
            END IF

            #取得未稅金額、稅額、含稅金額
            CALL s_aic_carry_get_amount(p_tosite,p_todocno,l_seq,l_price.coin,l_xmdl022,l_uniprice,g_icae.icae011)
            RETURNING r_success,l_xmdl027,l_xmdl029,l_xmdl028

            IF NOT r_success THEN
               EXIT FOREACH
            END IF

            UPDATE xmdl_t
               SET xmdl024 = l_uniprice,
                   xmdl025 = g_icae.icae011,
                   xmdl026 = l_price.oodb006,
                   xmdl027 = l_xmdl027,
                   xmdl028 = l_xmdl028,
                   xmdl029 = l_xmdl029
             WHERE xmdlent = g_enterprise
               AND xmdldocno = p_todocno
               AND xmdlseq = l_seq

            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:xmdl_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END FOREACH

         IF NOT r_success THEN
            RETURN r_success
         ELSE

            #重新計算整單的未稅、含稅總金額
            CALL s_aic_carry_return_amount(p_todocno)
            RETURNING l_xrcd103,l_xrcd104,l_xrcd105            

            UPDATE xmdk_t
               SET xmdk007 = l_price.ooef024,
                   xmdk008 = l_price.ooef024,
                   xmdk009 = l_price.ooef024,
                   xmdk010 = g_icae.icae009,
                   xmdk011 = g_icae.icae013,
                   xmdk012 = g_icae.icae011,
                   xmdk013 = l_price.oodb006,
                   xmdk014 = l_price.oodb005,
                   xmdk015 = g_icae.icae014,
                   xmdk016 = l_price.coin,
                   xmdk017 = l_price.exchange,
                   xmdk051 = l_xrcd103,
                   xmdk052 = l_xrcd105,
                   xmdk053 = l_xrcd104
             WHERE xmdkent = g_enterprise
               AND xmdkdocno = p_todocno
      
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:xmdk_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()

               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF
         
      #若傳入值更新類型='apmt570',則取出"來源營運據點"之"來源單號"出貨單相關欄位,更新傳入值"目的營運據點"之入庫單號="目的單號"之以下欄位:
      WHEN 'apmt570'

         #取得稅率、含稅否
         CALL s_aic_carry_tax(p_tosite,g_icae.icae012) RETURNING r_success,l_price.oodb005,l_price.oodb006
         IF NOT r_success THEN
            RETURN r_success
         END IF

         #SELECT來源出貨單
         SELECT xmdk016
           INTO l_price.coin
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = p_formdocno

         #SELECT目的收貨單
         SELECT pmdsdocdt,pmds048
           INTO l_price.date,l_price.inoutsale
           FROM pmds_t
          WHERE pmdsent = g_enterprise
            AND pmdsdocno = p_todocno

         #取匯率
         CALL s_aic_carry_exchange(l_price.inoutsale,p_tosite,l_price.date,l_price.coin,'','2')
         RETURNING r_success,l_price.exchange
         IF NOT r_success THEN
            RETURN r_success
         END IF

         LET g_sql = "SELECT pmdtseq,pmdt024",
                     "  FROM pmds_t,pmdt_t",
                     " WHERE pmdsent = pmdtent AND pmdtent = ",g_enterprise,
                     "   AND pmdsdocno = pmdtdocno AND pmdtdocno = '",p_todocno,"'"
         PREPARE s_aic_carry_pmdt_pre2 FROM g_sql
         DECLARE s_aic_carry_pmdt_cs2 CURSOR FOR s_aic_carry_pmdt_pre2

         LET g_sql = "SELECT xmdl024",
                     "  FROM xmdl",
                     " WHERE xmdlent = ",g_enterprise,
                     "   AND xmdldocno = '",p_todocno,"'",
                     "   AND xmdlseq = ?"
         PREPARE s_aic_carry_xmdl_pre2 FROM g_sql
         
         FOREACH s_aic_carry_pmdt_cs2 INTO l_seq,l_pmdt024
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "FOREACH:s_aic_carry_pmdt_cs2"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
               EXIT FOREACH
            END IF

            EXECUTE s_aic_carry_xmdl_pre2 USING l_seq INTO l_uniprice
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "EXECUTE:s_aic_carry_xmdl_pre2"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()

               LET r_success = FALSE
               EXIT FOREACH
            END IF

            #取得未稅金額、稅額、含稅金額
            CALL s_aic_carry_get_amount(p_tosite,p_todocno,l_seq,l_price.coin,l_pmdt024,l_uniprice,g_icae.icae012)
            RETURNING r_success,l_pmdt038,l_pmdt047,l_pmdt039

            IF NOT r_success THEN
               EXIT FOREACH
            END IF

            UPDATE pmdt_t
               SET pmdt036 = l_uniprice,
                   pmdt046 = g_icae.icae012,
                   pmdt037 = l_price.oodb006,
                   pmdt038 = l_pmdt038,
                   pmdt039 = l_pmdt039,
                   pmdt047 = l_pmdt047
             WHERE pmdtent = g_enterprise
               AND pmdtdocno = p_todocno
               AND pmdtseq = l_seq

            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:pmdt_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END FOREACH

         IF NOT r_success THEN
            RETURN r_success
         ELSE

            #重新計算整單的未稅、含稅總金額
            CALL s_aic_carry_return_amount(p_todocno)
            RETURNING l_xrcd103,l_xrcd104,l_xrcd105            

            UPDATE pmds_t
               SET pmds007 = l_price.ooef024,
                   pmds008 = l_price.ooef024,
                   pmds009 = l_price.ooef024,
                   pmds010 = '',
                   pmds031 = g_icae.icae010,
                   pmds032 = g_icae.icae015,
                   pmds033 = g_icae.icae012,
                   pmds034 = l_price.oodb006,
                   pmds035 = l_price.oodb005,
                   pmds037 = l_price.coin,
                   pmds038 = l_price.exchange,
                   pmds043 = l_xrcd103,
                   pmds044 = l_xrcd105,
                   pmds046 = l_xrcd104
             WHERE pmdsent = g_enterprise 
               AND pmdsdocno = p_todocno
      
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:pmds_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()

               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF

   END CASE

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 產生目的據點多角出貨單or銷退單
# Memo...........: 依照順序CALL
#                : CALL s_tax_recount_tmp()
#                : CALL s_transaction_begin()
#                : CALL s_aic_carry_gen_tri_bs()
#                : CALL s_transaction_end(Y,0)
# Usage..........: CALL s_aic_carry_gen_tri_bs(p_firstdocno,p_pmdsdocno,p_xmdkdocno,p_xmdk002,p_date,p_icab001,p_icab002,p_type,p_presite)
#                  RETURNING r_success,r_xmdkdocno
# Input parameter: p_firstdocno  LIKE xmdk_t.xmdkdocno   #初始出貨/簽收/銷退單號 OR 初始入庫/倉退單號
#                : p_pmdsdocno   LIKE pmds_t.pmdsdocno   #來源入庫/倉退單號
#                : p_xmdkdocno   LIKE xmdk_t.xmdkdocno   #來源出貨/簽收/銷退單號
#                : p_xmdk002     LIKE xmdk_t.xmdk002     #出貨性質(若為Null則預設為1.一般)
#                : p_date        LIKE xmdk_t.xmdkdocdt   #日期
#                : p_icab001     LIKE icab_t.icab001     #流程代碼
#                : p_icab002     LIKE icab_t.icab002     #目的站別
#                : p_type        LIKE type_t.chr20       #拋轉類型(Null、aicp900、aicp950)
#                : p_presite     LIKE xmdk_t.xmdksite    #上站營運據點(aicp900、aicp950使用)
# Return code....: r_success     LIKE type_t.num5        #執行結果
#                : r_xmdkdocno   LIKE xmdk_t.xmdkdocno   #產生之出貨單號or銷退單號
# Date & Author..: 141125 By earl
# Modify.........: 150917-00001#4 151111 earl 修改傳入參數，增加製造批序號拋轉
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_bs(p_firstdocno,p_pmdsdocno,p_xmdkdocno,p_xmdk002,p_date,p_icab001,p_icab002,p_type,p_presite)
   DEFINE p_firstdocno  LIKE xmdk_t.xmdkdocno   #初始出貨/簽收/銷退單號 OR 初始入庫/倉退單號
   DEFINE p_pmdsdocno   LIKE pmds_t.pmdsdocno   #來源入庫/倉退單號
   DEFINE p_xmdkdocno   LIKE xmdk_t.xmdkdocno   #來源出貨/簽收/銷退單號
   DEFINE p_xmdk002     LIKE xmdk_t.xmdk002     #出貨性質(若為Null則預設為1.一般)
   DEFINE p_date        LIKE xmdk_t.xmdkdocdt   #日期
   DEFINE p_icab001     LIKE icab_t.icab001     #流程代碼
   DEFINE p_icab002     LIKE icab_t.icab002     #目的站別
   DEFINE p_type        LIKE type_t.chr20       #拋轉類型(Null、aicp900、aicp950)
   DEFINE p_presite     LIKE xmdk_t.xmdksite    #客戶營運據點(aicp900、aicp950使用)
   DEFINE r_success     LIKE type_t.num5        #執行結果
   DEFINE r_xmdkdocno   LIKE xmdk_t.xmdkdocno   #產生之出貨單號 OR 銷退單號
   
   DEFINE l_pmdsdocdt   LIKE pmds_t.pmdsdocdt
   
   DEFINE l_pmal002     LIKE pmds_t.pmds002

   DEFINE l_pmdt        RECORD LIKE pmdt_t.*
   DEFINE l_pmdu        RECORD LIKE pmdu_t.*
   
   DEFINE l_imaf091     LIKE imaf_t.imaf091
   DEFINE l_imaf092     LIKE imaf_t.imaf092
   
   DEFINE l_success     LIKE type_t.num5

   DEFINE l_pmds        RECORD
             pmds000       LIKE pmds_t.pmds000,
             pmdsdocdt     LIKE pmds_t.pmdsdocdt,  #161024-00037#1 add
             pmds001       LIKE pmds_t.pmds001,    #161024-00037#1 add
             pmds006       LIKE pmds_t.pmds006,
             pmds037       LIKE pmds_t.pmds037,
             pmds041       LIKE pmds_t.pmds041,
             pmds053       LIKE pmds_t.pmds053,
             pmds045       LIKE pmds_t.pmds045,  #170817-00043#5 add 備註
             pmds100       LIKE pmds_t.pmds100   #151113 earl add 倉退方式
                        END RECORD
   
   DEFINE l_xmdk000     LIKE xmdk_t.xmdk000
   DEFINE l_xmdk005     LIKE xmdk_t.xmdk005
   DEFINE l_xmdadocno   LIKE xmda_t.xmdadocno
   DEFINE l_xmdgdocno   LIKE xmdg_t.xmdgdocno
   DEFINE l_xmdl001     LIKE xmdl_t.xmdl001
   DEFINE l_xmdl002     LIKE xmdl_t.xmdl002
   
   DEFINE l_inao013     LIKE inao_t.inao013  #150917-00001#4 151113 earl add
   
   DEFINE l_pjaa013     LIKE pjaa_t.pjaa013  #160316-00023#2 add
   DEFINE l_max_icab002 LIKE icab_t.icab002  #160428-00006#4 add
   DEFINE l_xmdg055     LIKE xmdg_t.xmdg055  #170629-00016#1 add
   DEFINE l_first_site  LIKE icab_t.icab003  #170623-00003#1-add
   DEFINE l_xmdkdocno_1 LIKE xmdk_t.xmdkdocno  #記錄出貨單單號 #170406-00022#6 add
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_xmdkdocno = ''

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_xmdkdocno
   END IF

  #170816-00007#31 -S mark
  #IF cl_null(p_firstdocno) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_xmdkdocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_firstdocno) THEN
      LET g_colname_1 = cl_getmsg("sub-01508",g_dlang)   #初始單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1   #站別
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
      RETURN r_success,r_xmdkdocno
   END IF
  #170816-00007#31 -E add

   #來源入庫單號與來源出貨單號皆不為空白的情況不會存在
   IF cl_null(p_pmdsdocno) AND cl_null(p_xmdkdocno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ""
      LET g_errparam.code   = "sub-00050"   #傳入值有誤
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_xmdkdocno
   END IF
   
   IF NOT cl_null(p_type) THEN
      #拋轉類型不為Null則上站營運據點不可為Null
      IF cl_null(p_presite) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "sub-00050"   #傳入值有誤
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success,r_xmdkdocno
      END IF
      
      #拋轉類型必須為aicp950或aicp900
      IF p_type <> 'aicp950' AND p_type <> 'aicp900' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = "sub-00050"   #傳入值有誤
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         RETURN r_success,r_xmdkdocno
      END IF
   END IF

   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF

   #出貨性質(若為Null預設為1一般)
   IF cl_null(p_xmdk002) THEN
      LET p_xmdk002 = '1'  #一般
   END IF

   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
   CALL s_aic_carry_get_ica(p_icab001,p_icab002)

   #160428-00006#4-s-add
    #抓取最終站
    LET l_max_icab002 = ''
    SELECT MAX(icab002) 
     INTO l_max_icab002
      FROM icab_t
     WHERE icabent = g_enterprise
       AND icab001 = p_icab001
   #160428-00006#4-e-add  
   #塞xmdk_t
   INITIALIZE g_xmdk.* TO NULL
   LET g_xmdk.xmdkent = g_enterprise
   LET g_xmdk.xmdksite = g_icab.icab003
  #LET g_xmdk.xmdkdocdt = p_date   #161024-00037#1 mark
  #LET g_xmdk.xmdk001 = p_date     #161024-00037#1 mark
   LET g_xmdk.xmdk002 = p_xmdk002
   LET g_xmdk.xmdk026 = p_date
   LET g_xmdk.xmdk032 = g_today #結關日期
   LET g_xmdk.xmdk045 = '5'     #中間交易
   
   LET g_xmdk.xmdk083 = 'Y'     #多角貿易已拋轉

   LET g_xmdk.xmdkownid = g_user
   LET g_xmdk.xmdkowndp = g_dept
   LET g_xmdk.xmdkcrtid = g_user
   LET g_xmdk.xmdkcrtdp = g_dept
   LET g_xmdk.xmdkcrtdt = cl_get_current()
   LET g_xmdk.xmdkstus = 'N'

   #抓來源
   INITIALIZE l_pmds.* TO NULL
   IF NOT cl_null(p_pmdsdocno) THEN
      #抓取入庫/倉退單號資訊
      SELECT pmds000,pmds001,pmdsdocdt,       #161024-00037#1 add pmds001,pmdsdocdt
             pmds006,pmds037,pmds041,pmds053,
             pmds100
             ,pmds045        #170817-00043#5 add
        INTO l_pmds.pmds000,l_pmds.pmds001,l_pmds.pmdsdocdt,   #161024-00037#1 add pmds001,pmdsdocdt
             l_pmds.pmds006,l_pmds.pmds037,l_pmds.pmds041,l_pmds.pmds053,
             l_pmds.pmds100
             ,l_pmds.pmds045 #170817-00043#5 add
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmdsdocno = p_pmdsdocno

      LET g_xmdk.xmdk005 = l_pmds.pmds006    #161222-00012#7 add
      #151103 earl add
      IF l_pmds.pmds000 = '7' OR l_pmds.pmds000 = '14' OR l_pmds.pmds000 = '15' THEN   #倉退
         #倉退的pmds006為入庫單，非採購單
        #LET g_xmdk.xmdk005 = l_pmds.pmds006 #161222-00012#7 mark
         LET l_pmds.pmds006 = ''
      END IF
      
      #170406-00022#6-s add
      LET l_xmdk000 = ''
      SELECT xmdk000 INTO l_xmdk000      
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_xmdkdocno
      #取得出貨單單號，後續使用"l_xmdkdocno_1"取得出貨單資料
      IF l_xmdk000 = '4' OR l_xmdk000 = '7' THEN  #簽收單、借貨還價單
         CALL s_aic_carry_sel_xmdl001_xmdl002(p_xmdkdocno,'') RETURNING r_success,l_xmdl001,l_xmdl002
               
         IF NOT r_success THEN
            RETURN r_success,r_xmdkdocno
         END IF
         LET l_xmdkdocno_1 = l_xmdl001   #取單身的來源出貨單
      ELSE
         LET l_xmdkdocno_1 = p_xmdkdocno #取出貨單單號
      END IF
      #170406-00022#6-e add
   ELSE
      #抓取出貨/簽收/銷退單資訊
      LET l_xmdk000 = ''
      SELECT xmdk000,xmdk001,xmdkdocdt,              #161024-00037#1 add xmdk001,xmdkdocdt
             xmdk006,xmdk016,xmdk035,xmdk044,
             xmdk082,
             xmdk005,xmdk028,xmdk029
             ,xmdk054 #170817-00043#5 add         
        INTO l_xmdk000,l_pmds.pmds001,l_pmds.pmdsdocdt,   #161024-00037#1 add pmds001,pmdsdocdt
             l_pmds.pmds006,l_pmds.pmds037,l_pmds.pmds041,l_pmds.pmds053,
             l_pmds.pmds100,
             g_xmdk.xmdk005,g_xmdk.xmdk028,g_xmdk.xmdk029
             ,l_pmds.pmds045 #170817-00043#5 add          
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_xmdkdocno
      
      LET l_xmdkdocno_1 = p_xmdkdocno #170406-00022#6 add 取得出貨單單號，後續用來取得出貨單資料
      
      #來源為簽收單，用來源出貨單再抓一次資料
      IF l_xmdk000 = '4' OR l_xmdk000 = '7' THEN  #簽收單、借貨還價單
         LET l_xmdl001 = ''
         LET l_xmdl002 = ''
         #來源出貨單
         IF NOT cl_null(g_xmdk.xmdk005) THEN
            LET l_xmdl001 = g_xmdk.xmdk005
         ELSE
            #抓單身第一筆xmdl001
            CALL s_aic_carry_sel_xmdl001_xmdl002(p_xmdkdocno,'') RETURNING r_success,l_xmdl001,l_xmdl002
            
            IF NOT r_success THEN
               RETURN r_success,r_xmdkdocno
            END IF

            IF cl_null(l_xmdl001) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = "agl-00329"  #無來源單據！
               LET g_errparam.popup  = TRUE
               CALL cl_err()
                  
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            END IF
         END IF
         
         LET l_xmdkdocno_1 = l_xmdl001 #170406-00022#6 add 取得出貨單單號，後續用來取得出貨單資料
         
         #SEL來源出貨單資訊
         SELECT xmdk005,
                xmdk000,xmdk001,xmdkdocdt,              #161024-00037#1 add xmdk001,xmdkdocdt
                xmdk006,xmdk016,
                xmdk028,xmdk029
                ,xmdk054        #170817-00043#5 add              
           INTO l_xmdk005,
                l_xmdk000,l_pmds.pmds001,l_pmds.pmdsdocdt,   #161024-00037#1 add pmds001,pmdsdocdt
                l_pmds.pmds006,l_pmds.pmds037,
                g_xmdk.xmdk028,g_xmdk.xmdk029
                ,l_pmds.pmds045 #170817-00043#5 add              
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = l_xmdl001
            
      END IF
      
      IF l_xmdk000 = '6' THEN  #銷退單
        LET l_pmds.pmds000 = '7'    #產生銷退單
      ELSE
         LET l_pmds.pmds000 = '1'   #產生出貨單
      END IF
   END IF
            
   LET g_xmdk.xmdkdocdt = l_pmds.pmdsdocdt   #161024-00037#1 add
   LET g_xmdk.xmdk001 = l_pmds.pmds001       #161024-00037#1 add

   LET g_xmdk.xmdk035 = l_pmds.pmds041  #多角序號
   LET g_xmdk.xmdk044 = l_pmds.pmds053  #多角流程代碼
   LET g_xmdk.xmdk054 = l_pmds.pmds045  #備註 #170817-00043#5 add

   IF cl_null(p_type) THEN  #若傳入值"拋轉類型"=空值
      LET l_xmdadocno = ''
      LET l_xmdgdocno = ''
      LET l_xmdg055 = ''     #170629-00016#1 add
      IF NOT cl_null(p_pmdsdocno) THEN
         #來源訂單
         CALL s_aic_carry_get_fromdocno(g_xmdk.xmdksite,p_pmdsdocno,'','2','1')
         RETURNING r_success,l_xmdadocno
         
         IF NOT r_success THEN
            RETURN r_success,r_xmdkdocno
         END IF
         
         #來源出通/出貨單 151103 earl add
         CALL s_aic_carry_get_fromdocno(g_xmdk.xmdksite,p_pmdsdocno,'','2','3')
         RETURNING r_success,l_xmdgdocno
         
         IF NOT r_success THEN
            RETURN r_success,r_xmdkdocno
         END IF
         
         #170629-00016#1 add---start---
         IF cl_null(l_xmdgdocno) THEN
            #判斷是否有出通單
            SELECT xmdg055 INTO l_xmdg055 
              FROM xmdg_t
             WHERE xmdgent = g_enterprise
               AND xmdgsite = g_site
               AND xmdgdocno IN (SELECT xmdk005 FROM xmdk_t
             WHERE xmdkent = g_enterprise 
               AND xmdksite = g_site
               AND xmdkdocno = p_firstdocno
               AND xmdk005 <> ' ')
            IF cl_null(l_xmdg055) THEN
               LET l_xmdg055 = ''
            END IF
            SELECT xmdgdocno
              INTO l_xmdgdocno
              FROM xmdg_t
             WHERE xmdgent = g_enterprise
               AND xmdgsite = g_xmdk.xmdksite
               AND xmdg055 = l_xmdg055
            IF cl_null(l_xmdgdocno) THEN
               LET l_xmdgdocno = ''
            END IF
         END IF
         #170629-00016#1 add---end---
         
         IF l_pmds.pmds000 = '7' OR l_pmds.pmds000 = '14' OR l_pmds.pmds000 = '15' THEN   #倉退
            LET g_xmdk.xmdk000 = '6'      #銷退單
            LET g_xmdk.xmdk085 = '1'      #手動輸入
            LET g_xmdk.xmdk082 = l_pmds.pmds100  #銷退方式
            
            #折讓證明單開立否
            IF cl_null(g_xmdk.xmdk084) THEN
               LET g_xmdk.xmdk084 = '1'
            END IF
            
            #自動產生銷退單號xmdkdocno
            IF cl_null(g_icac.icac009) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00201'    #流程代碼%1站別%2之銷退單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_pmdsdocno,g_xmdk.xmdksite,g_icac.icac009,g_xmdk.xmdkdocdt,'axmt600')
               RETURNING r_success,g_xmdk.xmdkdocno
            END IF
        
         ELSE
            LET g_xmdk.xmdk000 = '1'      #出貨單
            
            #包裝單製作
            IF cl_null(g_xmdk.xmdk028) THEN
               LET g_xmdk.xmdk028 = 'N'
            END IF
            
            #Invoice製作
            IF cl_null(g_xmdk.xmdk029) THEN
               LET g_xmdk.xmdk029 = 'N'
            END IF
            
            #自動產生出貨單號xmdkdocno
            IF cl_null(g_icac.icac007) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00168'    #流程代碼%1站別%2之出貨單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_pmdsdocno,g_xmdk.xmdksite,g_icac.icac007,g_xmdk.xmdkdocdt,'axmt540')
               RETURNING r_success,g_xmdk.xmdkdocno
            END IF
            
         END IF

      ELSE
         #來源訂單
         CALL s_aic_carry_get_fromdocno(g_xmdk.xmdksite,p_xmdkdocno,'','1','1')
         RETURNING r_success,l_xmdadocno
         
         IF NOT r_success THEN
            RETURN r_success,r_xmdkdocno
         END IF
         
         #來源出通/出貨單
         CALL s_aic_carry_get_fromdocno(g_xmdk.xmdksite,p_xmdkdocno,'','1','3')
         RETURNING r_success,l_xmdgdocno
         
         IF NOT r_success THEN
            RETURN r_success,r_xmdkdocno
         END IF
         
         IF l_pmds.pmds000 = '7' OR l_pmds.pmds000 = '14' OR l_pmds.pmds000 = '15' THEN   #倉退
            LET g_xmdk.xmdk000 = '6'      #銷退單
            LET g_xmdk.xmdk085 = '1'      #手動輸入
            LET g_xmdk.xmdk082 = l_pmds.pmds100  #銷退方式
            
            #折讓證明單開立否
            IF cl_null(g_xmdk.xmdk084) THEN
               LET g_xmdk.xmdk084 = '1'
            END IF
            
            #自動產生銷退單號xmdkdocno
            IF cl_null(g_icac.icac009) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00201'    #流程代碼%1站別%2之銷退單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_xmdkdocno,g_xmdk.xmdksite,g_icac.icac009,g_xmdk.xmdkdocdt,'axmt600')
               RETURNING r_success,g_xmdk.xmdkdocno
            END IF
        
         ELSE
            LET g_xmdk.xmdk000 = '1'      #出貨單
            
            #包裝單製作
            IF cl_null(g_xmdk.xmdk028) THEN
               LET g_xmdk.xmdk028 = 'N'
            END IF
            
            #Invoice製作
            IF cl_null(g_xmdk.xmdk029) THEN
               LET g_xmdk.xmdk029 = 'N'
            END IF
            
            #自動產生出貨單號xmdkdocno
            IF cl_null(g_icac.icac007) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00168'    #流程代碼%1站別%2之出貨單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_xmdkdocno,g_xmdk.xmdksite,g_icac.icac007,g_xmdk.xmdkdocdt,'axmt540')
               RETURNING r_success,g_xmdk.xmdkdocno
            END IF
            
         END IF
         
      END IF
      
      LET r_xmdkdocno = g_xmdk.xmdkdocno
      
      IF NOT r_success THEN
         RETURN r_success,r_xmdkdocno
      END IF

      #來源出通/出貨單
      IF NOT cl_null(g_xmdk.xmdk005) THEN    #170629-00016#1 mark  #161222-00012#7 remark
      #IF NOT cl_null(l_xmdgdocno) THEN        #170629-00016#1 add #161222-00012#7 mark
         LET g_xmdk.xmdk005 = l_xmdgdocno
      END IF

      #151104 earl add
      #來源訂單單號
      IF NOT cl_null(l_pmds.pmds006) THEN
         LET g_xmdk.xmdk006 = l_xmdadocno
      END IF
            
      #SELECT出通單/出貨單
      IF NOT cl_null(l_xmdgdocno) THEN
         IF g_xmdk.xmdk000 = '1' THEN
            #抓出通單
            SELECT xmdg002,xmdg003,
                   xmdg005,xmdg006,xmdg007,xmdg008,
                   xmdg009,xmdg010,xmdg011,xmdg012,xmdg013,
                   xmdg014,xmdg015,'','',xmdg016,
                   xmdg017,xmdg018,xmdg019,xmdg020,
                   xmdg023,xmdg026,
                   xmdg027,
                   xmdg032,xmdg033,
                   xmdg202,
                   xmdg001             #C20180725-07783 ADD
              INTO g_xmdk.xmdk003,g_xmdk.xmdk004,
                   g_xmdk.xmdk007,g_xmdk.xmdk008,g_xmdk.xmdk009,g_xmdk.xmdk010,
                   g_xmdk.xmdk011,g_xmdk.xmdk012,g_xmdk.xmdk013,g_xmdk.xmdk014,g_xmdk.xmdk015,
                   g_xmdk.xmdk016,g_xmdk.xmdk017,g_xmdk.xmdk018,g_xmdk.xmdk019,g_xmdk.xmdk020,
                   g_xmdk.xmdk021,g_xmdk.xmdk022,g_xmdk.xmdk023,g_xmdk.xmdk024,
                   g_xmdk.xmdk027,g_xmdk.xmdk030,
                   g_xmdk.xmdk031,
                   g_xmdk.xmdk042,g_xmdk.xmdk043,
                   g_xmdk.xmdk202,
                   g_xmdk.xmdk002    #C20180725-07783 ADD
              FROM xmdg_t             
             WHERE xmdgent = g_enterprise
               AND xmdgdocno = l_xmdgdocno
               
            #取價方式、優惠條件
            SELECT xmda017,xmda018
              INTO g_xmdk.xmdk018,g_xmdk.xmdk019
              FROM xmda_t
             WHERE xmdaent = g_enterprise
               AND xmdadocno = l_xmdadocno
         ELSE
            #抓出貨單
            SELECT xmdk003,xmdk004,
                   xmdk007,xmdk008,xmdk009,xmdk010,
                   xmdk011,xmdk012,xmdk013,xmdk014,xmdk015,
                   xmdk016,xmdk017,xmdk018,xmdk019,xmdk020,
                   xmdk021,xmdk022,xmdk023,xmdk024,
                   xmdk027,xmdk030,
                   xmdk031,
                   xmdk042,xmdk043,
                   xmdk202, 
                   xmdk002    #C20180725-07783 ADD                   
              INTO g_xmdk.xmdk003,g_xmdk.xmdk004,
                   g_xmdk.xmdk007,g_xmdk.xmdk008,g_xmdk.xmdk009,g_xmdk.xmdk010,
                   g_xmdk.xmdk011,g_xmdk.xmdk012,g_xmdk.xmdk013,g_xmdk.xmdk014,g_xmdk.xmdk015,
                   g_xmdk.xmdk016,g_xmdk.xmdk017,g_xmdk.xmdk018,g_xmdk.xmdk019,g_xmdk.xmdk020,
                   g_xmdk.xmdk021,g_xmdk.xmdk022,g_xmdk.xmdk023,g_xmdk.xmdk024,
                   g_xmdk.xmdk027,g_xmdk.xmdk030,
                   g_xmdk.xmdk031,
                   g_xmdk.xmdk042,g_xmdk.xmdk043,
                   g_xmdk.xmdk202,
                   g_xmdk.xmdk002    #C20180725-07783 ADD                   
              FROM xmdk_t
             WHERE xmdkent = g_enterprise
               AND xmdkdocno = l_xmdgdocno
         END IF
      ELSE
         #SELECT訂單資料
         SELECT xmda002,xmda003,
                xmda004,xmda021,xmda022,xmda009,
                xmda010,xmda011,xmda012,xmda013,xmda035,
                xmda015,xmda016,xmda017,xmda018,xmda036,
                xmda025,xmda020,xmda037,xmda038,
                xmda044,xmda023,
                xmda024,
                xmda048,xmda049,
                xmda203,
                xmda005           #C20180725-07783 ADD
           INTO g_xmdk.xmdk003,g_xmdk.xmdk004,
                g_xmdk.xmdk007,g_xmdk.xmdk008,g_xmdk.xmdk009,g_xmdk.xmdk010,
                g_xmdk.xmdk011,g_xmdk.xmdk012,g_xmdk.xmdk013,g_xmdk.xmdk014,g_xmdk.xmdk015,
                g_xmdk.xmdk016,g_xmdk.xmdk017,g_xmdk.xmdk018,g_xmdk.xmdk019,g_xmdk.xmdk020,
                g_xmdk.xmdk021,g_xmdk.xmdk022,g_xmdk.xmdk023,g_xmdk.xmdk024,
                g_xmdk.xmdk027,g_xmdk.xmdk030,
                g_xmdk.xmdk031,
                g_xmdk.xmdk042,g_xmdk.xmdk043,
                g_xmdk.xmdk202,
                g_xmdk.xmdk002    #C20180725-07783 ADD
           FROM xmda_t
          WHERE xmdaent = g_enterprise
            AND xmdadocno = l_xmdadocno
      END IF
      
      #170406-00022#6-s add
      IF g_xmdk.xmdk000 = '1' AND NOT cl_null(l_xmdkdocno_1) THEN
         #取得出貨單資料   
         SELECT xmdk025,xmdk059,xmdk060,xmdk061,xmdk062,
                xmdk063,xmdk064,xmdk065,xmdk066,
                xmdk067,xmdk068,xmdk069,xmdk070
           INTO g_xmdk.xmdk025,g_xmdk.xmdk059,g_xmdk.xmdk060,g_xmdk.xmdk061,g_xmdk.xmdk062,
                g_xmdk.xmdk063,g_xmdk.xmdk064,g_xmdk.xmdk065,g_xmdk.xmdk066,
                g_xmdk.xmdk067,g_xmdk.xmdk068,g_xmdk.xmdk069,g_xmdk.xmdk070
          FROM xmdk_t
         WHERE xmdkent = g_enterprise
           AND xmdkdocno = l_xmdkdocno_1
       END IF
      #170406-00022#6-e add
   
   ELSE  #若傳入值"拋轉類型"<>空值(aicp900,aicp950)
      LET g_xmdk.xmdk010 = g_icae.icae009   #收款條件
      LET g_xmdk.xmdk011 = g_icae.icae013   #交易條件
      LET g_xmdk.xmdk012 = g_icae.icae011   #稅別
      LET g_xmdk.xmdk015 = g_icae.icae014   #發票類型
      LET g_xmdk.xmdk031 = g_icad.icad003   #銷售分類
      
      IF NOT cl_null(p_pmdsdocno) THEN
         IF l_pmds.pmds000 = '7' OR l_pmds.pmds000 = '14' OR l_pmds.pmds000 = '15' THEN   #倉退
            LET g_xmdk.xmdk000 = '6'      #銷退單
            LET g_xmdk.xmdk085 = '1'      #手動輸入
            LET g_xmdk.xmdk082 = l_pmds.pmds100  #銷退方式
            
            #折讓證明單開立否
            IF cl_null(g_xmdk.xmdk084) THEN
               LET g_xmdk.xmdk084 = '1'
            END IF
            
            #自動產生銷退單號xmdkdocno
            IF cl_null(g_icac.icac009) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00201'    #流程代碼%1站別%2之銷退單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_pmdsdocno,g_xmdk.xmdksite,g_icac.icac009,g_xmdk.xmdkdocdt,'axmt600')
               RETURNING r_success,g_xmdk.xmdkdocno
            END IF
         
         ELSE
            LET g_xmdk.xmdk000 = '2'      #無訂單出貨單

            #包裝單製作
            IF cl_null(g_xmdk.xmdk028) THEN
               LET g_xmdk.xmdk028 = 'N'
            END IF
            
            #Invoice製作
            IF cl_null(g_xmdk.xmdk029) THEN
               LET g_xmdk.xmdk029 = 'N'
            END IF

            #自動產生無訂單出貨單號xmdkdocno
            IF cl_null(g_icac.icac015) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00200'    #流程代碼%1站別%2之無訂單出貨單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_pmdsdocno,g_xmdk.xmdksite,g_icac.icac015,g_xmdk.xmdkdocdt,'axmt541')
               RETURNING r_success,g_xmdk.xmdkdocno               
            END IF
            
         END IF
      ELSE
         IF l_pmds.pmds000 = '7' OR l_pmds.pmds000 = '14' OR l_pmds.pmds000 = '15' THEN   #倉退
            LET g_xmdk.xmdk000 = '6'      #銷退單
            LET g_xmdk.xmdk085 = '1'      #手動輸入
            LET g_xmdk.xmdk082 = l_pmds.pmds100  #銷退方式
            
            #折讓證明單開立否
            IF cl_null(g_xmdk.xmdk084) THEN
               LET g_xmdk.xmdk084 = '1'
            END IF
            
            #自動產生銷退單號xmdkdocno
            IF cl_null(g_icac.icac009) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00201'    #流程代碼%1站別%2之銷退單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_xmdkdocno,g_xmdk.xmdksite,g_icac.icac009,g_xmdk.xmdkdocdt,'axmt600')
               RETURNING r_success,g_xmdk.xmdkdocno
            END IF
        
         ELSE
            LET g_xmdk.xmdk000 = '2'      #無訂單出貨單

            #包裝單製作
            IF cl_null(g_xmdk.xmdk028) THEN
               LET g_xmdk.xmdk028 = 'N'
            END IF
            
            #Invoice製作
            IF cl_null(g_xmdk.xmdk029) THEN
               LET g_xmdk.xmdk029 = 'N'
            END IF

            #自動產生無訂單出貨單號xmdkdocno
            IF cl_null(g_icac.icac015) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'aic-00200'    #流程代碼%1站別%2之無訂單出貨單單別為空！
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = p_icab001
               LET g_errparam.replace[2] = p_icab002
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_xmdkdocno
            ELSE
               CALL s_aic_carry_docno(p_xmdkdocno,g_xmdk.xmdksite,g_icac.icac015,g_xmdk.xmdkdocdt,'axmt541')
               RETURNING r_success,g_xmdk.xmdkdocno
            END IF
            
         END IF
      END IF
      
      LET r_xmdkdocno = g_xmdk.xmdkdocno
      
      IF NOT r_success THEN
         RETURN r_success,r_xmdkdocno
      END IF
      
      #傳入值"上站營運據點"之"據點對應客戶/廠商編號"
      CALL s_aic_carry_get_ooef024(p_presite)
      RETURNING r_success,g_xmdk.xmdk007
      IF NOT r_success THEN
         RETURN r_success,r_xmdkdocno
      END IF
      
      LET g_xmdk.xmdk008 = g_xmdk.xmdk007  #訂單客戶
      #LET g_xmdk.xmdk009 = g_xmdk.xmdk007  #收貨客戶 #170623-00003#1-mark
      LET g_xmdk.xmdk202 = g_xmdk.xmdk007  #發票客戶
      
      #170623-00003#1-s-add
      SELECT icab003 INTO l_first_site
        FROM icab_t
       WHERE icabent = g_enterprise
         AND icab001 = p_icab001
         AND icab002 = (SELECT MIN(icab002) FROM icab_t
                         WHERE icabent = g_enterprise
                           AND icab001 = p_icab001)
      #取得收貨客戶
      CALL s_aic_carry_get_ooef024(l_first_site) 
         RETURNING r_success,g_xmdk.xmdk009   
      IF NOT r_success THEN
         RETURN r_success,r_xmdkdocno
      END IF
      #170623-00003#1-e-add
      
      LET g_xmdk.xmdk016 = l_pmds.pmds037  #幣別
      
      #取得銷售控制组編號
      CALL s_control_get_group('2',g_user,g_dept)
      RETURNING l_success,l_pmal002
      
      CALL s_apmm101_default_pmab('2',l_pmal002,g_xmdk.xmdksite,g_xmdk.xmdk007) RETURNING g_pmab.*
      #慣用交易幣別(改抓來源)
      #LET g_xmdk.xmdk016 = g_pmab.pmab033
      #慣用交易稅別(改抓icae011)
      #LET g_xmdk.xmdk012 = g_pmab.pmab034
      #慣用付款/收款條件(改抓icae009)
      #LET g_xmdk.xmdk010 = g_pmab.pmab037
      #慣用採購/銷售通路
      LET g_xmdk.xmdk030 = g_pmab.pmab038
      #慣用採購/銷售分類(改抓icad003)
      #LET g_xmdk.xmdk031 = g_pmab.pmab039
      #慣用交運方式
      LET g_xmdk.xmdk022 = g_pmab.pmab040
      #慣用交運起點
      LET g_xmdk.xmdk023 = g_pmab.pmab041
      #慣用交運終點
      LET g_xmdk.xmdk024 = g_pmab.pmab042
      #慣用交易條件(改抓icae013)
      #LET g_xmdk.xmdk011 = g_pmab.pmab053
      #慣用取價方式
      LET g_xmdk.xmdk018 = g_pmab.pmab054
      #慣用發票類型(改抓icae014)
      #LET g_xmdk.xmdk015 = g_pmab.pmab056
      #內外購/銷
      LET g_xmdk.xmdk042 = g_pmab.pmab057
      #取匯率來源
      LET g_xmdk.xmdk043 = g_pmab.pmab058
      #負責採購/業務人員
      LET g_xmdk.xmdk003 = g_pmab.pmab031
      #負責採購/業務部門
      LET g_xmdk.xmdk004 = g_pmab.pmab059
      #慣用卸貨港
      #g_pmab.pmab043
      
      #必要欄位檢查
      IF g_pmab.prog = 'axmi111' THEN  #控制組預設
         IF cl_null(g_xmdk.xmdk030) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00154"   #控制組編號%1，客戶編號%2之慣用銷售通路為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
   
         IF cl_null(g_xmdk.xmdk018) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00155"   #控制組編號%1，客戶編號%2之慣用取價方式為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
   
         IF cl_null(g_xmdk.xmdk042) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00156"   #控制組編號%1，客戶編號%2之慣用內外銷為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
   
         IF cl_null(g_xmdk.xmdk043) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00157"   #控制組編號%1，客戶編號%2之慣用匯率計算基準為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = l_pmal002
            LET g_errparam.replace[2] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
      ELSE   #客戶據點預設條件axmm202
         IF cl_null(g_xmdk.xmdk030) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = ''
            LET g_errparam.code   = "aic-00158"   #客戶編號%1之慣用銷售通路為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
   
         IF cl_null(g_xmdk.xmdk018) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = ''
            LET g_errparam.code   = "aic-00159"   #客戶編號%1之慣用取價方式為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
   
         IF cl_null(g_xmdk.xmdk042) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00160"   #客戶編號%1之慣用內外銷為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
   
         IF cl_null(g_xmdk.xmdk043) THEN
            INITIALIZE g_errparam TO NULL      
            LET g_errparam.extend = ''      
            LET g_errparam.code   = "aic-00161"   #客戶編號%1之慣用匯率計算基準為空！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_xmdk.xmdk007
            
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   
      IF cl_null(g_xmdk.xmdk012) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''
         LET g_errparam.code   = "aic-00162"   #流程代碼%1站別%2之訂單稅別為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
         
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_xmdk.xmdk010) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00163"   #流程代碼%1站別%2之收款條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_xmdk.xmdk011) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code   = "aic-00164"   #流程代碼%1站別%2之訂單交易條件為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF cl_null(g_xmdk.xmdk015) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''      
         LET g_errparam.code   = "aic-00153"   #流程代碼%1站別%2之訂單發票類型為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
            
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
      IF NOT r_success THEN
         RETURN r_success,r_xmdkdocno
      END IF
      
      #取得稅率、含稅否
      CALL s_aic_carry_tax(g_xmdk.xmdksite,g_xmdk.xmdk012) RETURNING r_success,g_xmdk.xmdk014,g_xmdk.xmdk013
      IF NOT r_success THEN
         RETURN r_success,r_xmdkdocno
      END IF

      #取匯率
      CALL s_aic_carry_exchange(g_xmdk.xmdk042,g_xmdk.xmdksite,g_xmdk.xmdkdocdt,g_xmdk.xmdk016,'','1')
      RETURNING r_success,g_xmdk.xmdk017
      IF NOT r_success THEN
         RETURN r_success,r_xmdkdocno
      END IF

   END IF
   #C20180725-07783--如果是调拨出货，则在途仓取客户主档，客户设置的在途仓--S
   IF g_xmdk.xmdk002 = '4' THEN 
      SELECT pmaaud006 INTO g_xmdk.xmdk039 FROM pmaa_t
       WHERE pmaaent = g_enterprise
         AND pmaa001 = g_xmdk.xmdk007
         AND pmaastus = 'Y'
   END IF                
   #C20180725-07783--如果是调拨出货，则在途仓取客户主档，客户设置的在途仓--E     
   INSERT INTO xmdk_t VALUES g_xmdk.*
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:xmdk_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
         
      LET r_success = FALSE
      RETURN r_success,r_xmdkdocno
   END IF

   #INSERT xmdl_t,xmdm_t
   IF NOT cl_null(p_pmdsdocno) THEN
      LET g_sql = "SELECT pmdsdocdt,pmds000,pmds006,pmdt028,",  #151104 earl mod
                  "       pmdssite,",
                  "       pmdtseq,",
                  "       pmdt001,pmdt002,pmdt003,pmdt004,pmdt005,",
                  "       pmdt006,pmdt007,pmdt008,pmdt009,pmdt010,",
                  "       pmdt016,pmdt017,pmdt018,pmdt019,pmdt020,",
                  "       pmdt021,pmdt022,pmdt023,pmdt024,pmdt041,", #160902-00008#1 add pmdt041
                 #"       pmdt062,pmdt063,",         #170817-00043#5 mark
                  "       pmdt059,pmdt062,pmdt063,", #170817-00043#5 add
                  "       pmdt036,pmdt085",
                  "  FROM pmds_t,pmdt_t",
                  " WHERE pmdsent = pmdtent AND pmdtent = ",g_enterprise,
                  "   AND pmdsdocno = pmdtdocno AND pmdtdocno = '",p_pmdsdocno,"'"
   ELSE
      LET g_sql = "SELECT xmdkdocdt,xmdk000,xmdl001,xmdl002,",
                  "       xmdksite,",
                  "       xmdlseq,",
                  "       xmdl003,xmdl004,xmdl005,xmdl006,xmdl007,",
                  "       xmdl008,xmdl009,xmdl010,xmdl011,xmdl012,",
                  "       xmdl014,xmdl015,xmdl016,xmdl017,xmdl018,",
                  "       xmdl019,xmdl020,xmdl021,xmdl022,xmdl041,", #160902-00008#1 add xmdl041
                 #"       xmdl013,xmdl052,",         #170817-00043#5 mark
                  "       xmdl051,xmdl013,xmdl052,", #170817-00043#5 add
                  "       xmdl024,xmdl088",
                  "  FROM xmdk_t,xmdl_t",
                  " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
                  "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_xmdkdocno,"'"
   END IF
   
   PREPARE s_aic_carry_pmdt_pre4 FROM g_sql
   DECLARE s_aic_carry_pmdt_cs4 CURSOR FOR s_aic_carry_pmdt_pre4
   
   IF NOT cl_null(p_pmdsdocno) THEN
      LET g_sql = "SELECT pmduseq1,",
                  "       pmdu001,pmdu002,pmdu003,pmdu004,pmdu005,",
                  "       pmdu006,pmdu007,pmdu008,pmdu009,pmdu010,",
                  "       pmdu011,pmdu012",
                  "  FROM pmdu_t",
                  " WHERE pmduent = ",g_enterprise,
                  "   AND pmdudocno = '",p_pmdsdocno,"'",
                  "   AND pmduseq = ?",
                  " ORDER BY pmduseq1"
   ELSE
      LET g_sql = "SELECT xmdmseq1,",
                  "       xmdm001,xmdm002,xmdm003,xmdm004,xmdm033,",
                  "       xmdm005,xmdm006,xmdm007,xmdm008,xmdm009,",
                  "       xmdm010,xmdm011",                #151103 earl mod
                  "  FROM xmdm_t",
                  " WHERE xmdment = ",g_enterprise,
                  "   AND xmdmdocno = '",p_xmdkdocno,"'",  #151103 earl mod
                  "   AND xmdmseq = ?",
                  " ORDER BY xmdmseq1"
   END IF
   
   PREPARE s_aic_carry_pmdu_pre FROM g_sql
   DECLARE s_aic_carry_pmdu_cs CURSOR FOR s_aic_carry_pmdu_pre

   LET g_sql = "SELECT xmdh023,xmdh024,xmdh025,",
               "       xmdh031,xmdh032,xmdh033,xmdh034,",
               "       xmdh036,xmdc040,xmdc041,xmdc042,xmdc043,",
               "       xmdc044",
               "  FROM xmdh_t",
               #"  LEFT OUTER JOIN xmdc_t ON xmdcent = xmdhent AND xmdcdocno = xmdh001 AND xmdcseq = xmdh001",   #170315-00045#1 mark
               "  LEFT OUTER JOIN xmdc_t ON xmdcent = xmdhent AND xmdcdocno = xmdh001 AND xmdcseq = xmdh002",   #170315-00045#1 add
               " WHERE xmdhent = ",g_enterprise,
               "   AND xmdhdocno = ?",
               "   AND xmdhseq = ?"
   PREPARE s_aic_carry_xmdh_pre FROM g_sql
    
   LET g_sql = "SELECT xmdl024,xmdl025,xmdl026,",
               "       xmdl030,xmdl031,xmdl032,xmdl033,",
               "       xmdl041,xmdl042,xmdl043,xmdl044,xmdl045,",
               "       xmdl046",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = ?",
               "   AND xmdlseq = ?"
   PREPARE s_aic_carry_xmdl_pre10 FROM g_sql
   
   LET g_sql = "SELECT xmdd018,xmdd019,xmdd020,",
               "       xmdc036,xmdc037,xmdc038,xmdc027,",
               "       xmdc021,xmdc040,xmdc041,xmdc042,xmdc043,",
               "       xmdc044",
               "  FROM xmda_t,xmdc_t,xmdd_t",
               " WHERE xmdaent = xmdcent AND xmdcent = xmddent AND xmddent = ",g_enterprise,
               "   AND xmdadocno = xmdcdocno AND xmdcdocno = xmdddocno",
               "   AND xmdcseq = xmddseq",
               "   AND xmdddocno = ?",
               "   AND xmddseq = ?",
               "   AND xmddseq1 = ?",
               "   AND xmddseq2 = ?"
   PREPARE s_aic_carry_xmdc_pre FROM g_sql

   LET g_sql = "SELECT xmdl002",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = ?",
               "   AND xmdlseq = ?"
   PREPARE s_aic_carry_xmdl_pre FROM g_sql

   LET l_pmdsdocdt = ''
   LET l_xmdk000 = ''
   LET l_xmdl001 = ''
   LET l_xmdl002 = ''
   INITIALIZE l_pmdt.* TO NULL
   FOREACH s_aic_carry_pmdt_cs4 INTO l_pmdsdocdt,l_xmdk000,l_xmdl001,l_xmdl002,
                                     l_pmdt.pmdtsite,
                                     l_pmdt.pmdtseq,
                                     l_pmdt.pmdt001,l_pmdt.pmdt002,l_pmdt.pmdt003,l_pmdt.pmdt004,l_pmdt.pmdt005,
                                     l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt008,l_pmdt.pmdt009,l_pmdt.pmdt010,
                                     l_pmdt.pmdt016,l_pmdt.pmdt017,l_pmdt.pmdt018,l_pmdt.pmdt019,l_pmdt.pmdt020,
                                     l_pmdt.pmdt021,l_pmdt.pmdt022,l_pmdt.pmdt023,l_pmdt.pmdt024,l_pmdt.pmdt041,      #160902-00008#1 add
                                    #l_pmdt.pmdt062,l_pmdt.pmdt063,                #170817-00043#5 mark
                                     l_pmdt.pmdt059,l_pmdt.pmdt062,l_pmdt.pmdt063, #170817-00043#5 add
                                     l_pmdt.pmdt036,l_pmdt.pmdt085
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_pmdt_cs4"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
    
      #151103 earl add
      IF NOT cl_null(p_pmdsdocno) THEN
         IF l_xmdk000 = '7' OR l_xmdk000 = '14' OR l_xmdk000 = '15' OR l_xmdk000 = '26' THEN   #倉退
            LET l_xmdk000 = ''
         ELSE
          IF l_pmds.pmds000 =  '7' OR l_pmds.pmds000 = '14' OR l_pmds.pmds000 = '15'  OR l_pmds.pmds000 = '26'THEN  #仓退  #170724-00046#1 add
            #入庫的pmds006為採購單，非入庫單
            LET l_xmdk000 = ''
            LET l_xmdl001 = ''
            LET l_xmdl002 = ''
          END IF #170724-00046#1 add
         END IF
      END IF
    
      #塞g_xmdl.*
      INITIALIZE g_xmdl.* TO NULL
      LET g_xmdl.xmdlent = g_enterprise
      LET g_xmdl.xmdlsite = g_xmdk.xmdksite
      LET g_xmdl.xmdldocno = g_xmdk.xmdkdocno
      LET g_xmdl.xmdlseq = l_pmdt.pmdtseq
    
      LET g_xmdl.xmdl007 = l_pmdt.pmdt005
      LET g_xmdl.xmdl008 = l_pmdt.pmdt006
      LET g_xmdl.xmdl009 = l_pmdt.pmdt007
      LET g_xmdl.xmdl010 = l_pmdt.pmdt008
      LET g_xmdl.xmdl011 = l_pmdt.pmdt009
      LET g_xmdl.xmdl012 = l_pmdt.pmdt010
      
      LET g_xmdl.xmdl017 = l_pmdt.pmdt019
      LET g_xmdl.xmdl018 = l_pmdt.pmdt020  #數量
      LET g_xmdl.xmdl019 = l_pmdt.pmdt021
      LET g_xmdl.xmdl020 = l_pmdt.pmdt022
      LET g_xmdl.xmdl021 = l_pmdt.pmdt023
      LET g_xmdl.xmdl022 = l_pmdt.pmdt024
      LET g_xmdl.xmdl041 = l_pmdt.pmdt041  #保稅  #160902-00008#1 add
      LET g_xmdl.xmdl023 = 'N'             #檢驗否
    
      LET g_xmdl.xmdl035 = 0
      LET g_xmdl.xmdl036 = 0
      LET g_xmdl.xmdl037 = 0
      LET g_xmdl.xmdl038 = 0
      LET g_xmdl.xmdl039 = 0
      LET g_xmdl.xmdl040 = 0
      
      LET g_xmdl.xmdl047 = 0
      
      LET g_xmdl.xmdl053 = 0
      LET g_xmdl.xmdl054 = 0
      LET g_xmdl.xmdl055 = 0
      LET g_xmdl.xmdl056 = g_xmdl.xmdl018  #檢驗合格量
      
      LET g_xmdl.xmdl081 = 0
      LET g_xmdl.xmdl082 = 0
      LET g_xmdl.xmdl083 = 0
    
      LET g_xmdl.xmdl087 = 'Y'   #需自立應收否 #151105改為Y
      LET g_xmdl.xmdl088 = g_xmdk.xmdk044        
    
      LET g_xmdl.xmdl013 = l_pmdt.pmdt062   #多庫儲批出貨
      LET g_xmdl.xmdl016 = l_pmdt.pmdt018   #批號
      LET g_xmdl.xmdl051 = l_pmdt.pmdt059   #備註 #170817-00043#5 add
      
      #統購統付之第終站，庫位儲位要同料件預設(#160428-00006#4第0站調整成最終站)
      
     #IF p_type = 'aicp950' AND p_icab002 = '0' THEN            #160428-00006#4 mark
      IF p_type = 'aicp950' AND p_icab002 = l_max_icab002 THEN  #160428-00006#4 add
         LET l_imaf091 = ''
         LET l_imaf092 = ''
         CALL s_aic_carry_sel_imaf091_imaf092(g_xmdl.xmdlsite,g_xmdl.xmdl008)
         RETURNING l_imaf091,l_imaf092
         
         IF cl_null(l_imaf091) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = ""
            LET g_errparam.code   = 'aim-00245'   #營運據點%1料件編號%2無預設之庫位、儲位！
            LET g_errparam.popup  = TRUE
            LET g_errparam.replace[1] = g_xmdl.xmdlsite
            LET g_errparam.replace[2] = g_xmdl.xmdl008
             
            CALL cl_err()
            
            LET r_success = FALSE
            EXIT FOREACH            
         END IF
         
         IF cl_null(l_imaf092) THEN
            LET l_imaf092 = ' '
         END IF
      END IF
    
      #同據點直接引用來源
      IF g_xmdl.xmdlsite = l_pmdt.pmdtsite THEN
         LET g_xmdl.xmdl052 = l_pmdt.pmdt063   #庫存管理特徵
         LET g_xmdl.xmdl014 = l_pmdt.pmdt016   #庫位
         LET g_xmdl.xmdl015 = l_pmdt.pmdt017   #儲位
         
      #跨據點用aici100設定
      ELSE
         LET g_xmdl.xmdl052 = ' '              #庫存管理特徵
         
         #庫位、儲位
         IF NOT cl_null(l_pmdt.pmdt062) THEN
           #統購統付之第終站，庫位儲位要同料件預設(#160428-00006#4第0站調整成最終站)                    
           #IF p_type = 'aicp950' AND p_icab002 = '0' THEN            #160428-00006#4 mark
            IF p_type = 'aicp950' AND p_icab002 = l_max_icab002 THEN  #160428-00006#4 add            
               LET g_xmdl.xmdl014 = l_imaf091            #庫位
               LET g_xmdl.xmdl015 = l_imaf092            #儲位
            ELSE
               IF cl_null(g_icad.icad004) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = 'aic-00169'   #流程代碼%1站別%2之庫位為空！
                  LET g_errparam.popup  = TRUE
                  LET g_errparam.replace[1] = p_icab001
                  LET g_errparam.replace[2] = p_icab002
                  
                  CALL cl_err()
               
                  LET r_success = FALSE
                  EXIT FOREACH            
               ELSE
                  LET g_xmdl.xmdl014 = g_icad.icad004     #庫位
                  
                  IF cl_null(g_icad.icad005) THEN
                     LET g_xmdl.xmdl015 = ' '             #儲位
                  ELSE
                     LET g_xmdl.xmdl015 = g_icad.icad005  #儲位
                  END IF
               END IF
            END IF
         ELSE
            LET g_xmdl.xmdl014 = ' '             #庫位
            LET g_xmdl.xmdl015 = ' '             #儲位
         END IF
      END IF
    
      IF cl_null(p_type) THEN  #若傳入值"拋轉類型"=空值
         LET g_xmdl.xmdl004 = l_pmdt.pmdt002
         LET g_xmdl.xmdl005 = l_pmdt.pmdt003
         LET g_xmdl.xmdl006 = l_pmdt.pmdt004
    
         LET l_xmdadocno = ''
         LET l_xmdgdocno = ''
         LET l_xmdg055 = ''        #170629-00016#1 add
         #取得訂單單號
         #取得出通/出貨單號
         IF NOT cl_null(p_pmdsdocno) THEN
            CALL s_aic_carry_get_fromdocno(g_xmdl.xmdlsite,p_pmdsdocno,l_pmdt.pmdtseq,'2','1')
            RETURNING r_success,l_xmdadocno
            
            IF NOT r_success THEN
               RETURN r_success,r_xmdkdocno
            END IF
            
            LET g_xmdl.xmdl003 = l_xmdadocno  #來源訂單單號

            #151104 earl add
            #來源出通/出貨單
            CALL s_aic_carry_get_fromdocno(g_xmdl.xmdlsite,p_pmdsdocno,l_pmdt.pmdtseq,'2','3')
            RETURNING r_success,l_xmdgdocno
         
            IF NOT r_success THEN
               RETURN r_success,r_xmdkdocno
            END IF
            
            #170629-00016#1 add---start---
            IF cl_null(l_xmdgdocno) THEN
               #判斷是否有出通單
               #161222-00012#7 --s mark 改串單身的出通單號
               #SELECT xmdg055 INTO l_xmdg055
               #  FROM xmdg_t
               # WHERE xmdgent = g_enterprise
               #   AND xmdgsite = g_site
               #   AND xmdgdocno IN (SELECT xmdk005 FROM xmdk_t
               # WHERE xmdkent = g_enterprise
               #   AND xmdksite = g_site
               #   AND xmdkdocno = p_firstdocno
               #   AND xmdk005 <> ' ')
               #161222-00012#7 --e mark
               #161222-00012#7 --s add
               SELECT xmdg055 INTO l_xmdg055
                 FROM xmdg_t
                WHERE xmdgent = g_enterprise
                  AND xmdgsite = g_site
                  AND xmdgdocno IN (SELECT xmdl001 FROM xmdl_t
                                     WHERE xmdlent = g_enterprise
                                       AND xmdlsite = g_site
                                       AND xmdldocno = p_firstdocno
                                       AND xmdlseq = l_pmdt.pmdtseq )
               #161222-00012#7 --e add
               IF cl_null(l_xmdg055) THEN
                  LET l_xmdg055 = ''
               END IF
               SELECT xmdgdocno
                 INTO l_xmdgdocno
                 FROM xmdg_t
                WHERE xmdgent = g_enterprise
                  AND xmdgsite = g_xmdl.xmdlsite
                  AND xmdg055 = l_xmdg055
               IF cl_null(l_xmdgdocno) THEN
                  LET l_xmdgdocno = ''
               END IF
            END IF
            #170629-00016#1 add---end---

         ELSE
            #來源訂單
            CALL s_aic_carry_get_fromdocno(g_xmdl.xmdlsite,p_xmdkdocno,l_pmdt.pmdtseq,'1','1')
            RETURNING r_success,l_xmdadocno
         
            IF NOT r_success THEN
               RETURN r_success,r_xmdkdocno
            END IF
            
            LET g_xmdl.xmdl003 = l_xmdadocno  #來源訂單單號

            #來源出通/出貨單
            CALL s_aic_carry_get_fromdocno(g_xmdl.xmdlsite,p_xmdkdocno,l_pmdt.pmdtseq,'1','3')
            RETURNING r_success,l_xmdgdocno
         
            IF NOT r_success THEN
               RETURN r_success,r_xmdkdocno
            END IF
           
         END IF
         
         #151104 earl mod
         IF NOT cl_null(l_xmdgdocno) THEN
            #來源為簽收單，用來源出貨單再抓一次資料
            IF l_xmdk000 = '4' OR l_xmdk000 = '7' THEN  #簽收單、借貨還價單
               OPEN s_aic_carry_xmdl_pre USING l_xmdl001,l_xmdl002
               EXECUTE s_aic_carry_xmdl_pre INTO l_xmdl002
            END IF
            
            #170629-00016#1 add---start---
            IF cl_null(l_xmdl002) THEN
               LET l_xmdl002 = l_pmdt.pmdt002
            END IF
            #170629-00016#1 add---end---
            IF NOT cl_null(l_xmdl002) THEN
               LET g_xmdl.xmdl001 = l_xmdgdocno  #來源出通/出貨單
               LET g_xmdl.xmdl002 = l_xmdl002
            END IF
            
         END IF
         
         IF NOT cl_null(g_xmdl.xmdl001) THEN  #抓來源出通單/出貨單
            IF g_xmdk.xmdk000 = '1' THEN
            #抓出通單
               EXECUTE s_aic_carry_xmdh_pre USING g_xmdl.xmdl001,g_xmdl.xmdl002
               INTO g_xmdl.xmdl024,g_xmdl.xmdl025,g_xmdl.xmdl026,
                    g_xmdl.xmdl030,g_xmdl.xmdl031,g_xmdl.xmdl032,g_xmdl.xmdl033,
                    g_xmdl.xmdl041,g_xmdl.xmdl042,g_xmdl.xmdl043,g_xmdl.xmdl044,g_xmdl.xmdl045,
                    g_xmdl.xmdl046
                    
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "EXECUTE:s_aic_carry_xmdh_pre"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
            
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
            ELSE
            #抓出貨單
               EXECUTE s_aic_carry_xmdl_pre10 USING g_xmdl.xmdl001,g_xmdl.xmdl002
               INTO g_xmdl.xmdl024,g_xmdl.xmdl025,g_xmdl.xmdl026,
                    g_xmdl.xmdl030,g_xmdl.xmdl031,g_xmdl.xmdl032,g_xmdl.xmdl033,
                    g_xmdl.xmdl041,g_xmdl.xmdl042,g_xmdl.xmdl043,g_xmdl.xmdl044,g_xmdl.xmdl045,
                    g_xmdl.xmdl046

               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "EXECUTE:s_aic_carry_xmdl_pre10"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
            
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
            END IF
         ELSE #抓來源訂單       
            EXECUTE s_aic_carry_xmdc_pre USING g_xmdl.xmdl003,g_xmdl.xmdl004,g_xmdl.xmdl005,g_xmdl.xmdl006
            INTO g_xmdl.xmdl024,g_xmdl.xmdl025,g_xmdl.xmdl026,
                 g_xmdl.xmdl030,g_xmdl.xmdl031,g_xmdl.xmdl032,g_xmdl.xmdl033,
                 g_xmdl.xmdl041,g_xmdl.xmdl042,g_xmdl.xmdl043,g_xmdl.xmdl044,g_xmdl.xmdl045,
                 g_xmdl.xmdl046
            
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "EXECUTE:s_aic_carry_xmdc_pre"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
            
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END IF
         
      ELSE                     #若傳入值"拋轉類型"<>空值

        #LET g_xmdl.xmdl041 = 'N'             #保稅  #160902-00008#1 mark
         
         LET g_xmdl.xmdl046 = 0               #價差比
         
         LET g_xmdl.xmdl025 = g_xmdk.xmdk012  #稅別
         LET g_xmdl.xmdl026 = g_xmdk.xmdk013  #稅率
    
         LET g_xmdl.xmdl024 = l_pmdt.pmdt036  #單價
         LET g_xmdl.xmdl045 = g_xmdl.xmdl024  #取出價格
      END IF
      
      #160316-00023#2--add---begin---
      #有專案代號且"專案庫存控管"="Y"時，自動將專案代號帶入庫存管理特徵欄位中，不可修改
      IF NOT cl_null(g_xmdl.xmdl030) THEN
         SELECT pjaa013 INTO l_pjaa013 FROM pjaa_t,pjba_t 
            WHERE pjaaent = pjbaent AND pjaa001 = pjba000 AND pjaaent = g_enterprise AND pjba001 = g_xmdl.xmdl030
         IF l_pjaa013 = 'Y' THEN
            LET g_xmdl.xmdl052 = g_xmdl.xmdl030
         END IF
      END IF     
      #160316-00023#2--add---end---
      
      #取得未稅金額、稅額、含稅金額
      CALL s_aic_carry_get_amount(g_xmdl.xmdlsite,g_xmdl.xmdldocno,g_xmdl.xmdlseq,g_xmdk.xmdk016,g_xmdl.xmdl022,g_xmdl.xmdl024,g_xmdl.xmdl025)
      RETURNING r_success,g_xmdl.xmdl027,g_xmdl.xmdl029,g_xmdl.xmdl028
    
      IF NOT r_success THEN
         EXIT FOREACH         
      END IF
    
      INSERT INTO xmdl_t VALUES g_xmdl.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:xmdl_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
    
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      INITIALIZE l_pmdu.* TO NULL
      OPEN s_aic_carry_pmdu_cs USING g_xmdl.xmdlseq
      FOREACH s_aic_carry_pmdu_cs INTO l_pmdu.pmduseq1,
                                       l_pmdu.pmdu001,l_pmdu.pmdu002,l_pmdu.pmdu003,l_pmdu.pmdu004,l_pmdu.pmdu005,
                                       l_pmdu.pmdu006,l_pmdu.pmdu007,l_pmdu.pmdu008,l_pmdu.pmdu009,l_pmdu.pmdu010,
                                       l_pmdu.pmdu011,l_pmdu.pmdu012
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_pmdu_cs"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            EXIT FOREACH
         END IF

         #塞xmdm_t
         INITIALIZE g_xmdm.* TO NULL
         LET g_xmdm.xmdment = g_enterprise
         LET g_xmdm.xmdmsite = g_xmdl.xmdlsite
         LET g_xmdm.xmdmdocno = g_xmdl.xmdldocno
         LET g_xmdm.xmdmseq = g_xmdl.xmdlseq
         LET g_xmdm.xmdmseq1 = l_pmdu.pmduseq1
         LET g_xmdm.xmdm001 = l_pmdu.pmdu001    #料件編號
         LET g_xmdm.xmdm002 = l_pmdu.pmdu002    #產品特徵
         LET g_xmdm.xmdm003 = l_pmdu.pmdu003    #作業編號
         LET g_xmdm.xmdm004 = l_pmdu.pmdu004    #作業序
         
         LET g_xmdm.xmdm007 = l_pmdu.pmdu008    #批號
         LET g_xmdm.xmdm008 = l_pmdu.pmdu009    #單位
         LET g_xmdm.xmdm009 = l_pmdu.pmdu010    #數量
         LET g_xmdm.xmdm010 = l_pmdu.pmdu011    #參考單位
         LET g_xmdm.xmdm011 = l_pmdu.pmdu012    #參考數量
         LET g_xmdm.xmdm012 = 0                 #已簽收數量
         LET g_xmdm.xmdm013 = 0                 #已簽退數量
         LET g_xmdm.xmdm014 = 0                 #已銷退數量
         LET g_xmdm.xmdm031 = 0                 #簽退數量
         LET g_xmdm.xmdm032 = 0                 #簽退參考數量
         LET g_xmdm.xmdm034 = 0  #160428-00008#1 add   備置量
         LET g_xmdm.xmdm035 = 0  #160428-00008#1 add   在揀量
         #同據點直接引用來源
         IF g_xmdl.xmdlsite = l_pmdt.pmdtsite THEN
            LET g_xmdm.xmdm033 = l_pmdu.pmdu005    #庫存管理特徵
            LET g_xmdm.xmdm005 = l_pmdu.pmdu006    #庫位
            LET g_xmdm.xmdm006 = l_pmdu.pmdu007    #儲位
         ELSE
            LET g_xmdm.xmdm033 = ' '              #庫存管理特徵
           
           #統購統付之第終站，庫位儲位要同料件預設(#160428-00006#4第0站調整成最終站)                    
           #IF p_type = 'aicp950' AND p_icab002 = '0' THEN            #160428-00006#4 mark
            IF p_type = 'aicp950' AND p_icab002 = l_max_icab002 THEN  #160428-00006#4 add             
               LET g_xmdm.xmdm005 = l_imaf091                         #庫位
               LET g_xmdm.xmdm006 = l_imaf092                         #儲位
            ELSE
            #庫位、儲位
               IF NOT cl_null(l_pmdu.pmdu006) THEN
                  IF cl_null(g_icad.icad004) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code   = 'aic-00169'   #流程代碼%1站別%2之庫位為空！
                     LET g_errparam.popup  = TRUE
                     LET g_errparam.replace[1] = p_icab001
                     LET g_errparam.replace[2] = p_icab002
                     
                     CALL cl_err()
                  
                     LET r_success = FALSE
                     EXIT FOREACH            
                  ELSE
                     LET g_xmdm.xmdm005 = g_icad.icad004     #庫位
                     
                     IF cl_null(g_icad.icad005) THEN
                        LET g_xmdm.xmdm006 = ' '             #儲位
                     ELSE
                        LET g_xmdm.xmdm006 = g_icad.icad005  #儲位
                     END IF
                  END IF
               ELSE
                  LET g_xmdm.xmdm005 = ' '             #庫位
                  LET g_xmdm.xmdm006 = ' '             #儲位
               END IF
            END IF
         END IF
         
         #160316-00023#2--add---begin---
         #有專案代號且"專案庫存控管"="Y"時，自動將專案代號帶入庫存管理特徵欄位中，不可修改
         IF NOT cl_null(g_xmdl.xmdl030) THEN
            SELECT pjaa013 INTO l_pjaa013 FROM pjaa_t,pjba_t 
               WHERE pjaaent = pjbaent AND pjaa001 = pjba000 AND pjaaent = g_enterprise AND pjba001 = g_xmdl.xmdl030
            IF l_pjaa013 = 'Y' THEN
               LET g_xmdm.xmdm033 = g_xmdl.xmdl030
            END IF
         END IF     
         #160316-00023#2--add---end---
      
    
         INSERT INTO xmdm_t VALUES g_xmdm.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:xmdm_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #150917-00001#4 151113 earl add s
         IF g_xmdk.xmdk000 = '6' THEN #6.銷退單
            LET l_inao013 = 1   #目的入庫碼:'1:入庫'
         ELSE #1.出貨單、2.無訂單出貨單
            LET l_inao013 = -1   #目的入庫碼:'-1出庫'
         END IF
         
         IF NOT s_aic_carry_inao_ins(p_firstdocno,g_xmdm.xmdmseq,g_xmdm.xmdmseq1,g_xmdm.xmdmsite,g_xmdm.xmdmdocno,
                                     g_xmdm.xmdm033,g_xmdm.xmdm005,g_xmdm.xmdm006,l_inao013,'1') THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #150917-00001#4 151113 earl add e
         
      END FOREACH
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
   END FOREACH
    
   IF NOT r_success THEN
      RETURN r_success,r_xmdkdocno
   ELSE
      #重新計算整單的未稅、含稅總金額
      CALL s_aic_carry_return_amount(g_xmdk.xmdkdocno)
      RETURNING g_xmdk.xmdk051,g_xmdk.xmdk053,g_xmdk.xmdk052         
    
      UPDATE xmdk_t
         SET xmdk051 = g_xmdk.xmdk051,
             xmdk053 = g_xmdk.xmdk053,
             xmdk052 = g_xmdk.xmdk052
       WHERE xmdkent = g_enterprise 
         AND xmdkdocno = g_xmdk.xmdkdocno
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE:xmdk_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
    
         LET r_success = FALSE
         RETURN r_success,r_xmdkdocno
      END IF
      #170817-00043#5 --s add
      #複製備註拋到後面單據
      CASE g_xmdk.xmdk000
         WHEN '6' #倉退單
            IF NOT cl_null(p_pmdsdocno) THEN
               CALL s_aic_carry_ins_ooff('axmt600',r_xmdkdocno,'apmt580',p_pmdsdocno) RETURNING r_success
            ELSE
               CALL s_aic_carry_ins_ooff('axmt600',r_xmdkdocno,'axmt600',p_xmdkdocno) RETURNING r_success
            END IF
         WHEN '2' #無採購訂單
            IF NOT cl_null(p_pmdsdocno) THEN
               CALL s_aic_carry_ins_ooff('axmt541',r_xmdkdocno,'apmt530',p_pmdsdocno) RETURNING r_success
            ELSE
               CALL s_aic_carry_ins_ooff('axmt541',r_xmdkdocno,'axmt541',p_xmdkdocno) RETURNING r_success
            END IF
         OTHERWISE
            IF NOT cl_null(p_pmdsdocno) THEN
               CALL s_aic_carry_ins_ooff('axmt540',r_xmdkdocno,'apmt530',p_pmdsdocno) RETURNING r_success
            ELSE
               CALL s_aic_carry_ins_ooff('axmt540',r_xmdkdocno,'axmt540',p_xmdkdocno) RETURNING r_success
            END IF
      END CASE            
      #170817-00043#5 --e add
   END IF

   #出貨單確認、過帳
   CALL s_aic_carry_xmdk_conf(g_xmdk.xmdksite,g_xmdk.xmdkdocno,g_xmdk.xmdk000,'S') RETURNING r_success

   RETURN r_success,r_xmdkdocno                 
END FUNCTION

#出貨、銷退確認由s_aic_carry_gen_tri_bs呼叫
#因該應用元件使用g_site故需先改為當前營運據點
PRIVATE FUNCTION s_aic_carry_xmdk_conf(p_xmdksite,p_xmdkdocno,p_xmdk000,p_type)
   DEFINE p_xmdksite  LIKE xmdk_t.xmdksite
   DEFINE p_xmdkdocno LIKE xmdk_t.xmdkdocno
   DEFINE p_xmdk000   LIKE xmdk_t.xmdk000
   DEFINE p_type      LIKE type_t.chr1       #'Y'確認,'S'確認且過帳
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_site      LIKE sfaa_t.sfaasite   #備份營運據點
   DEFINE l_xmdkstus  LIKE xmdk_t.xmdkstus

   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = p_xmdksite       #將g_site替換成當站營運據點

   IF p_xmdk000 = '6' THEN #銷退單
      #銷退單確認   
      CALL s_axmt600_conf_chk(p_xmdkdocno) RETURNING r_success
      IF r_success THEN
         CALL s_axmt600_conf_upd(p_xmdkdocno) RETURNING r_success            
      END IF

      IF p_type = 'S' AND r_success THEN
         
         LET l_xmdkstus = ''
         SELECT xmdkstus INTO l_xmdkstus
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = p_xmdkdocno
         
         IF l_xmdkstus <> 'S' THEN   #若已自動過帳不再次過帳
            #出貨單過帳
            CALL s_axmt600_post_chk(p_xmdkdocno) RETURNING r_success
            IF r_success THEN
               CALL s_axmt600_post_upd(p_xmdkdocno,'') RETURNING r_success            
            END IF
         END IF
      END IF
   
   ELSE
      #出貨單確認   
      CALL s_axmt540_conf_chk(p_xmdkdocno) RETURNING r_success
      IF r_success THEN
         CALL s_axmt540_conf_upd(p_xmdkdocno) RETURNING r_success            
      END IF

      IF p_type = 'S' AND r_success THEN

         LET l_xmdkstus = ''
         SELECT xmdkstus INTO l_xmdkstus
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = p_xmdkdocno

         IF l_xmdkstus <> 'S' THEN   #若已自動過帳不再次過帳
            #出貨單過帳
            CALL s_axmt540_post_chk(p_xmdkdocno) RETURNING r_success
            IF r_success THEN
               CALL s_axmt540_post_upd(p_xmdkdocno) RETURNING r_success            
            END IF
         END IF   
         
      END IF
   END IF

   LET g_site = l_site           #還原g_site

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: CREATE TEMP TABLE
# Memo...........:
# Usage..........: CALL s_aic_carry_create_temp_table_ship()
#                  
# Input parameter: 
#                : 
# Return code....: r_success    執行結果
#                : 
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_create_temp_table_ship()
   DEFINE r_success       LIKE type_t.num5
#nouse       
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
#   
#   #DROP TEMP TABLE
#   CALL s_aic_carry_drop_temp_table_ship()
#
#   #CREATE TEMP TABLE
#   LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_xmdl_temp AS ",
#               "SELECT * FROM xmdl_t "
#   PREPARE s_aic_carry_xmdl_temp FROM g_sql
#   EXECUTE s_aic_carry_xmdl_temp
#   FREE s_aic_carry_xmdl_temp
#
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = "CREATE:s_aic_carry_xmdl_temp"
#      LET g_errparam.code   = SQLCA.sqlcode
#      LET g_errparam.popup  = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#
#   LET g_sql = "CREATE GLOBAL TEMPORARY TABLE s_aic_carry_xmdm_temp AS ",
#               "SELECT * FROM xmdm_t "
#   PREPARE s_aic_carry_xmdm_temp FROM g_sql
#   EXECUTE s_aic_carry_xmdm_temp
#   FREE s_aic_carry_xmdm_temp
#   
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.extend = "CREATE:s_aic_carry_xmdm_temp"
#      LET g_errparam.code   = SQLCA.sqlcode
#      LET g_errparam.popup  = TRUE
#      CALL cl_err()
#
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: DROP TEMP TABLE
# Memo...........:
# Usage..........: CALL s_aic_carry_drop_temp_table_ship()
#                  
# Input parameter: 
#                : 
# Return code....: 
#                : 
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_drop_temp_table_ship()
   WHENEVER ERROR CONTINUE
#   
#nouse       
#   #刪除TEMP TABLE
#   DROP TABLE s_aic_carry_xmdl_temp
#   DROP TABLE s_aic_carry_xmdm_temp
END FUNCTION

################################################################################
# Descriptions...: 多角流程自動取號
# Memo...........:
# Usage..........: CALL s_aic_carry_gettrino(p_icaa001,p_type,p_date,p_site)
#                  RETURNING r_success,r_trino
# Input parameter: p_icaa001      多角流程代碼
#                : p_type         多角流程類型('1'訂單/採購單
#                                             '2'出貨通知單
#                                             '3'Invoice/Packing
#                                             '4'出貨/收貨入庫
#                                             '5'應收/付立帳
#                                             '6'銷退/倉退
#                                             '7'應收/付折讓)
#                : p_date         日期
#                : p_site         營運據點
# Return code....: r_success      執行結果
#                : r_trino        多角流程序號
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_gettrino(p_icaa001,p_type,p_date,p_site)
   DEFINE p_icaa001     LIKE icaa_t.icaa001
   DEFINE p_type        LIKE type_t.chr1
   DEFINE p_date        LIKE type_t.dat
   DEFINE p_site        LIKE type_t.chr10
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_trino       LIKE type_t.chr20

   DEFINE l_no          LIKE type_t.num5            #編碼長度
   DEFINE l_icaa008     LIKE icaa_t.icaa008
   DEFINE l_ooef008     LIKE ooef_t.ooef008
   DEFINE l_ooef010     LIKE ooef_t.ooef010
   DEFINE l_yy          LIKE type_t.num5            #會計年(2位)
   DEFINE l_yyyy        LIKE type_t.num5            #會計年(4位)
   DEFINE l_mm          LIKE type_t.chr5            #自然月1,2,3,4,5,6,7,8,9,A,B,C
   DEFINE l_month       LIKE oogc_t.oogc016         #自然月1,2,3,4,5,6,7,8,9,10,11,12
   DEFINE l_pp          LIKE type_t.chr10           #會計期別
   DEFINE l_ww          LIKE type_t.num5            #自然周
   DEFINE l_format      STRING                      #編碼格式
   DEFINE l_date        STRING                      #編碼日期
   DEFINE l_icai003     LIKE icai_t.icai003
   DEFINE l_icai004     LIKE type_t.chr20           #因編碼要補0故使用chr20
   DEFINE l_newno       LIKE type_t.chr20
   DEFINE i             LIKE type_t.num5
   DEFINE l_icaa001     STRING                      #170817-00043#5 add

   WHENEVER ERROR CONTINUE
  
   LET r_success = TRUE
   LET r_trino = ''
  
  #170816-00007#31 -S mark
  #IF cl_null(p_icaa001) OR
  #   cl_null(p_type) OR
  #   cl_null(p_date) OR
  #   cl_null(p_site) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #   
  #   LET r_success = FALSE
  #   RETURN r_success,r_trino
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_icaa001) THEN
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程編號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_type) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      LET g_colname_1 = cl_getmsg("sub-01480",g_dlang)   #多角流程類型
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_date) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aapt110","lbl_pmdsdocdt") RETURNING g_colname_1,g_comment_1   #日期
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_site) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icabsite") RETURNING g_colname_1,g_comment_1   #營運據點
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
      RETURN r_success,r_trino
   END IF
  #170816-00007#31 -E add

   IF p_type NOT MATCHES '[1234567]' THEN

      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_type
      LET g_errparam.code   = "aic-00078"   #傳入之"多角流程類型"錯誤！
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success,r_trino
   END IF

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_trino
   END IF

   #若SITE小寫轉大寫
   LET p_site = UPSHIFT(p_site)

   #取得"流程序號編碼方式"
   LET l_icaa008 = ''
   SELECT icaa008
     INTO l_icaa008
     FROM icaa_t
    WHERE icaaent = g_enterprise
      AND icaa001 = p_icaa001
      
   IF cl_null(l_icaa008) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_icaa001
      LET g_errparam.code   = "aic-00077"   #該多角流程代碼無流程序號編碼方式！
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success,r_trino
   END IF

   #取得"行事曆參照表號"及"辦公行事曆對應類別"
   LET l_ooef008 = ''
   LET l_ooef010 = ''
   SELECT ooef008,ooef010
     INTO l_ooef008,l_ooef010
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = p_site
     
   IF cl_null(l_ooef008) OR cl_null(l_ooef010) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_site
      LET g_errparam.code   = "aic-00079"    #該營運據點之"行事曆參照表號"及"辦公行事曆對應類別"不可為空白！
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_trino
   END IF
     
   #oogc015 = 會計年  oogc006 = 會計期別 oogc008 = 自然周別 oogc016 = 月份
   LET l_yyyy = ''
   LET l_pp = ''
   LET l_ww = ''
   LET l_month = ''
   SELECT oogc015,oogc006,oogc008,oogc016
     INTO l_yyyy,l_pp,l_ww,l_month
     FROM oogc_t
    WHERE oogcent = g_enterprise
      AND oogc001 = l_ooef008
      AND oogc002 = l_ooef010
      AND oogc003 = p_date

   IF SQLCA.sqlcode = 100 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_site
      LET g_errparam.code   = "sub-00326"    #無法取得據點對應的年期資料！
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
   
      LET r_success = FALSE
      RETURN r_success,r_trino
   END IF

   LET l_yy = ''
   LET l_yy = l_yyyy MOD 100

  #LET l_no = 10             #預設編碼長度10碼 #170817-00043#5 mark
   #170817-00043#5 --s add
   #如果多角流程編號有10碼，後面流水號改成9碼
   LET l_icaa001 = p_icaa001
   IF l_icaa001.getLength() > 9 THEN
      LET l_no = 9
   ELSE
      LET l_no = 10
   END IF
   #170817-00043#5 --e add
   LET l_format = ''
   LET l_date = ''
   LET l_icai003 = ''

   CASE l_icaa008
      WHEN '0'   #無
         LET l_date = ''
         LET l_icai003 = 0   #纯流水码的时候期别特别设为0
         FOR i = 1 TO l_no - 1
            LET l_format = l_format,'&'
         END FOR           
      WHEN '1'   #YYMM
         LET l_date = p_date USING 'YYMM'
         FOR i = 1 TO l_no - 4
            LET l_format = l_format,'&'
         END FOR
      WHEN '2'   #YYPP
         LET l_date = l_yy USING "&&",l_pp USING "&&"
         FOR i = 1 TO l_no - 4
            LET l_format = l_format,'&'
         END FOR      
      WHEN '3'   #YYYYMMDD
         LET l_date = p_date USING 'YYYYMMDD'
         FOR i = 1 TO l_no - 8
            LET l_format = l_format,'&'
         END FOR      
      WHEN '4'   #YYYYMM
         LET l_date = p_date USING 'YYYYMM'
         FOR i = 1 TO l_no - 6
            LET l_format = l_format,'&'
         END FOR      
      WHEN '5'   #YYYYPP
         LET l_date = l_yyyy USING "&&&&",l_pp USING "&&"
         FOR i = 1 TO l_no - 6
            LET l_format = l_format,'&'
         END FOR
      WHEN '6'   #YYMMDD
         LET l_date = p_date USING 'YYMMDD'
         FOR i = 1 TO l_no - 6
            LET l_format = l_format,'&'
         END FOR
      WHEN '7'   #YYM
         LET l_mm = MONTH(p_date)
         IF l_mm < 10 THEN
            LET l_date = p_date USING "YY",l_mm USING "&"
         ELSE
            IF l_mm = 10 THEN LET l_mm = 'A' END IF
            IF l_mm = 11 THEN LET l_mm = 'B' END IF
            IF l_mm = 12 THEN LET l_mm = 'C' END IF
         
            LET l_date = p_date USING "YY",l_mm CLIPPED
         END IF
         FOR i = 1 TO l_no - 3
            LET l_format = l_format,'&'
         END FOR      
      WHEN '8'   #YYWW
         LET l_date = p_date USING "YY",l_ww USING "&&"
         FOR i = 1 TO l_no - 4
            LET l_format = l_format,'&'
         END FOR      
      WHEN '9'   #YYYYWW
         LET l_date = YEAR(p_date) USING "&&&&",l_ww USING "&&"
         FOR i = 1 TO l_no - 6
            LET l_format = l_format,'&'
         END FOR      
   END CASE

   IF cl_null(l_icai003) THEN LET l_icai003 = l_date END IF
   LET l_icai003 = s_chr_atrim(l_icai003)

   LET g_sql = "SELECT icai004 + 1",
               "  FROM icai_t",
               " WHERE icaient = '",g_enterprise,"'",
               "   AND icai001 = '",p_icaa001,"'",
               "   AND icai002 = '",p_type,"'",
               "   AND icai003 = '",l_icai003,"'",
               "   FOR UPDATE"
   LET g_sql = cl_sql_forupd(g_sql)
   DECLARE s_aic_carry_icai_cl CURSOR FROM g_sql
   
   OPEN s_aic_carry_icai_cl
   IF SQLCA.sqlcode AND SQLCA.sqlcode <> "100" THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      CLOSE s_aic_carry_icai_cl
      LET r_success = FALSE
      RETURN r_success,r_trino
   END IF

   LET l_icai004 = ''
   LET l_newno = ''

   FETCH s_aic_carry_icai_cl INTO l_icai004
   IF SQLCA.sqlcode AND SQLCA.sqlcode <> "100" THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      CLOSE s_aic_carry_icai_cl
      LET r_success = FALSE
      RETURN r_success,r_trino
   END IF

   IF cl_null(l_icai004) THEN
      LET l_icai004 = 1
      LET l_newno = l_icai004 USING l_format
      
      INSERT INTO icai_t(icaient,icai001,icai002,icai003,icai004)
      VALUES (g_enterprise,p_icaa001,p_type,l_icai003,l_newno)
      
   ELSE
      LET l_newno = l_icai004 USING l_format
      
      UPDATE icai_t
         SET icai004 = l_newno
       WHERE icaient = g_enterprise
         AND icai001 = p_icaa001
         AND icai002 = p_type
         AND icai003 = l_icai003
   END IF

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      CLOSE s_aic_carry_icai_cl
      LET r_success = FALSE    
      RETURN r_success,r_trino
   END IF

   #拼接完整單號
   LET r_trino = p_icaa001,'-',l_icai003,l_newno

   CLOSE s_aic_carry_icai_cl
   RETURN r_success,r_trino
END FUNCTION

################################################################################
# Descriptions...: 將產生之採購單確認
# Memo...........:
# Usage..........: CALL s_aic_carry_pmdl_conf(p_pmdldocno,p_pmdlsite)
#                  RETURNING r_success
# Input parameter: p_pmdldocno    #採購單號
#                : p_pmdlsite     #營運據點
# Return code....: 
#                : r_success      #執行結果
# Date & Author..: 141118 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_pmdl_conf(p_pmdldocno,p_pmdlsite)
   #採購單自動確認由s_aic_carry_gen_last_po、s_aic_carry_gen_tri_po呼叫
   #因該應用元件使用g_site故需先改為當前營運據點
   DEFINE p_pmdldocno   LIKE pmdl_t.pmdldocno
   DEFINE p_pmdlsite    LIKE pmdl_t.pmdlsite
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_site        LIKE pmds_t.pmdssite   #備份營運據點
   DEFINE l_argv1     LIKE type_t.chr10

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = p_pmdlsite       #將g_site替換成當站營運據點

   LET l_argv1 = g_argv[1]
   
   #IF g_prog = 'apmt501' THEN   #140421---earl---add   #170301-00021#3 by 09263 --mark
   IF g_prog MATCHES 'apmt501*' THEN   #170301-00021#3 by 09263 --add
      LET g_argv[1] = '1'    #委外採購單
   ELSE
      LET g_argv[1] = '3'    #採購單
   END IF

   CALL s_apmt500_conf_chk(p_pmdldocno) RETURNING r_success
   IF r_success THEN
      CALL s_apmt500_conf_upd(p_pmdldocno) RETURNING r_success
   END IF

   LET g_site = l_site
   LET g_argv[1] = l_argv1

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 將產生之訂單確認
# Memo...........:
# Usage..........: CALL s_aic_carry_xmda_conf(p_xmdadocno,p_xmdasite)
#                  RETURNING r_success
# Input parameter: p_xmdadocno    訂單單號
#                : p_xmdasite     營運據點
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 141117 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_xmda_conf(p_xmdadocno,p_xmdasite)
   #採購單自動確認由s_aic_carry_gen_tri_so呼叫
   #因該應用元件使用g_site故需先改為當前營運據點
   DEFINE p_xmdadocno   LIKE xmda_t.xmdadocno
   DEFINE p_xmdasite    LIKE xmda_t.xmdasite
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_site        LIKE pmds_t.pmdssite   #備份營運據點

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = p_xmdasite       #將g_site替換成當站營運據點

   CALL s_axmt500_conf_chk(p_xmdadocno) RETURNING r_success
   IF r_success THEN
      CALL s_axmt500_conf_upd(p_xmdadocno) RETURNING r_success
   END IF

   LET g_site = l_site

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 到推"預計開工日"
# Memo...........:
# Usage..........: CALL s_aic_carry_calculate_startdate(p_site,p_type,p_sfaa010,p_sfaa012,p_date)
#                  RETURNING r_success,r_date
# Input parameter: p_site       LIKE type_t.chr10     #營運據點　
#                : p_type       LIKE type_t.chr1      #計算類型：'1'為計算預計完工日、'2'為計算預計開工日
#                : p_sfaa010    LIKE sfaa_t.sfaa010   #生產料號
#                : p_sfaa012    LIKE sfaa_t.sfaa012   #生產數量
#                : p_date       LIKE type_t.dat       #日期
# Return code....: r_success    LIKE type_t.num5      #執行結果
#                : r_date       LIKE type_t.dat       #結果日期
# Date & Author..: 141119 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_calculate_startdate(p_site,p_type,p_sfaa010,p_sfaa012,p_date)
   DEFINE p_site       LIKE type_t.chr10     #營運據點
   DEFINE p_type       LIKE type_t.chr1      #計算類型：1/2，1為計算預計完工日、2為計算預計開工日
   DEFINE p_sfaa010    LIKE sfaa_t.sfaa010   #生产料号
   DEFINE p_sfaa012    LIKE sfaa_t.sfaa012   #生产数量
   DEFINE p_date       LIKE type_t.dat       #日期
   DEFINE r_success    LIKE type_t.num5      #处理状态
   DEFINE r_date       LIKE type_t.dat       #结果日期   
   DEFINE l_site       LIKE type_t.chr10     #備份營運據點
      
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = p_site           #將g_site替換成當站營運據點      
      
   CALL s_asft300_06(p_type,p_sfaa010,p_sfaa012,p_date)
   RETURNING r_success,r_date
      
   LET g_site = l_site

   RETURN r_success,r_date
END FUNCTION

################################################################################
# Descriptions...: UPDATE訂單及採購單之逆推單價
# Memo...........:
# Usage..........: CALL s_aic_carry_update_price(p_icab001,p_pmdl031)
#                  RETURNING r_success
# Input parameter: p_icab001      多角流程代碼
#                : p_pmdl031      多角流程序號
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 141118 By earl
# Modify.........: 150422 By earl
#                : 151126 By earl 151123-00007#1 修正逆推單價功能，改為由last_po發起
################################################################################
PUBLIC FUNCTION s_aic_carry_update_price(p_icab001,p_pmdl031)
   DEFINE p_icab001        LIKE icab_t.icab001
   DEFINE p_pmdl031        LIKE pmdl_t.pmdl031
   DEFINE r_success        LIKE type_t.num5
   
   DEFINE l_final_site     LIKE type_t.num5       #最終站否
   DEFINE l_modify         LIKE type_t.num5       #單價是否有修改
   
   DEFINE l_pmdn046        LIKE pmdn_t.pmdn046
   DEFINE l_pmdn048        LIKE pmdn_t.pmdn048
   DEFINE l_pmdn047        LIKE pmdn_t.pmdn047
   
   DEFINE l_exchange       LIKE pmdl_t.pmdl016
                          
   DEFINE l_pmdl040        LIKE pmdl_t.pmdl040
   DEFINE l_pmdl041        LIKE pmdl_t.pmdl041
   DEFINE l_pmdl042        LIKE pmdl_t.pmdl042
   
   DEFINE l_pmdl015_final  LIKE pmdl_t.pmdl015    #最終站幣別
   DEFINE l_pmdl015_after  LIKE pmdl_t.pmdl015    #後站幣別  
   DEFINE l_pmdlsite_after LIKE pmdl_t.pmdlsite   #後站營運據點

   DEFINE l_xmdadocno      LIKE xmda_t.xmdadocno  #後站訂單單號

   DEFINE l_final     DYNAMIC ARRAY OF RECORD
             pmdn015       LIKE pmdn_t.pmdn015    #最終站單價
                      END RECORD
   DEFINE l_after     DYNAMIC ARRAY OF RECORD 
             pmdn015       LIKE pmdn_t.pmdn015    #後站單價
                      END RECORD
   
   DEFINE l_pmdl      RECORD
             icab002       LIKE icab_t.icab002,
             pmdlsite      LIKE pmdl_t.pmdlsite,
             pmdldocno     LIKE pmdl_t.pmdldocno,
             pmdldocdt     LIKE pmdl_t.pmdldocdt,
             pmdl015       LIKE pmdl_t.pmdl015,
             pmdl054       LIKE pmdl_t.pmdl054
                      END RECORD
   
   DEFINE l_pmdn      RECORD
             pmdnseq       LIKE pmdn_t.pmdnseq,
             pmdn015       LIKE pmdn_t.pmdn015,
             pmdn011       LIKE pmdn_t.pmdn011,
             pmdn016       LIKE pmdn_t.pmdn016
                      END RECORD
  #160428-00006#4-s-add 
   DEFINE l_pmdo RECORD 
          pmdoseq1   LIKE pmdo_t.pmdoseq1,
          pmdoseq2   LIKE pmdo_t.pmdoseq2,
          pmdo022    LIKE pmdo_t.pmdo022,
          pmdo023    LIKE pmdo_t.pmdo023,
          pmdo031    LIKE pmdo_t.pmdo031, 
          pmdo032    LIKE pmdo_t.pmdo032, 
          pmdo033    LIKE pmdo_t.pmdo033, 
          pmdo034    LIKE pmdo_t.pmdo034 
              END RECORD          
  #160428-00006#4-e-add 


   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   LET g_sql = "SELECT icab002,",
               "       pmdlsite,pmdldocno,pmdldocdt,pmdl015,pmdl054",
               "  FROM icab_t,pmdl_t",
               " WHERE icabent = pmdlent AND pmdlent = ",g_enterprise,
               "   AND icab001 = '",p_icab001,"'",
               "   AND icab003 = pmdlsite",
               "   AND pmdl031 = '",p_pmdl031,"'",
               " ORDER BY icab002 DESC"
   PREPARE s_aic_carry_icab_pre FROM g_sql
   DECLARE s_aic_carry_icab_cs CURSOR FOR s_aic_carry_icab_pre
   
   LET g_sql = "SELECT pmdnseq,pmdn015,pmdn011,pmdn016",
               "  FROM pmdn_t",
               " WHERE pmdnent = ",g_enterprise,
               "   AND pmdndocno = ?"
   PREPARE s_aic_carry_pmdn_pre2 FROM g_sql
   DECLARE s_aic_carry_pmdn_cs2 CURSOR FOR s_aic_carry_pmdn_pre2
   
   LET g_sql = "SELECT xmdadocno",
               "  FROM xmda_t",
               " WHERE xmdaent = ",g_enterprise,
               "   AND xmda031 = '",p_pmdl031,"'",
               "   AND xmdasite = ?"
   PREPARE s_aic_carry_xmda_pre FROM g_sql
   
  #160428-00006#4-s-add
   LET g_sql = "SELECT pmdoseq1,pmdoseq2,pmdo022,pmdo023,pmdo031 ",
               "  FROM pmdo_t ",
               " WHERE pmdoent = ",g_enterprise,
               "   AND pmdodocno = ? AND pmdoseq = ? ",
               "   AND pmdo003 <> '6' "                        
   PREPARE s_aic_carry_pmdo_pre FROM g_sql
   DECLARE s_aic_carry_pmdo_cs CURSOR FOR s_aic_carry_pmdo_pre               
  #160428-00006#4-e-add  
   
   
   CALL l_final.clear()
   CALL l_after.clear()
   LET l_final_site = TRUE
   LET l_pmdl015_final = ''
   LET l_pmdl015_after = ''
   LET l_pmdlsite_after = ''
   
   #採購單頭站別回推
   FOREACH s_aic_carry_icab_cs INTO l_pmdl.icab002,
                                    l_pmdl.pmdlsite,l_pmdl.pmdldocno,l_pmdl.pmdldocdt,l_pmdl.pmdl015,l_pmdl.pmdl054
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_icab_cs"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET l_modify = FALSE
      
      IF l_final_site THEN #最終站
         LET l_pmdl015_final = l_pmdl.pmdl015      #最終站幣別
         LET l_pmdl015_after = l_pmdl.pmdl015      #後站幣別
         LET l_pmdlsite_after = l_pmdl.pmdlsite    #後站營運據點
      ELSE
         #取得icag_t、計價
         CALL s_aic_carry_get_tri_pm(p_icab001,l_pmdl.pmdlsite,l_pmdl.pmdldocdt)
         RETURNING r_success
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         #下站訂單
         LET l_xmdadocno = ''
         EXECUTE s_aic_carry_xmda_pre USING l_pmdlsite_after INTO l_xmdadocno
         IF SQLCA.sqlcode AND SQLCA.sqlcode <> '100' THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "EXECUTE:s_aic_carry_xmda_pre"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
          
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END IF
            
      #採購單單身
      OPEN s_aic_carry_pmdn_cs2 USING l_pmdl.pmdldocno
      FOREACH s_aic_carry_pmdn_cs2 INTO l_pmdn.pmdnseq,l_pmdn.pmdn015,l_pmdn.pmdn011,l_pmdn.pmdn016
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_pmdn_cs2"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         IF l_final_site THEN  #最終站
            LET l_final[l_pmdn.pmdnseq].pmdn015 = l_pmdn.pmdn015   #最終站單價
            LET l_after[l_pmdn.pmdnseq].pmdn015 = l_pmdn.pmdn015   #後站單價
         ELSE
            #若計價方式=1,則:
            IF g_icag.icag005 = '1' THEN
               CASE g_icag.icag006
                  #若"計價基準"=3.依最終廠商逆推
                  WHEN '3'
                       #(若初始訂單幣別與採購單幣別不同,則呼叫應用元件取訂單幣別與本國幣的匯率,再以本國幣別換成採購幣別匯率進行換算)
                       IF l_pmdl015_final <> l_pmdl.pmdl015 THEN
                          #取匯率
                          CALL s_aic_carry_exchange(l_pmdl.pmdl054,l_pmdl.pmdlsite,l_pmdl.pmdldocdt,l_pmdl015_final,l_pmdl.pmdl015,'2')
                          RETURNING r_success,l_exchange
                          
                          IF NOT r_success THEN
                             EXIT FOREACH
                          ELSE
                             LET l_pmdn.pmdn015 = l_final[l_pmdn.pmdnseq].pmdn015 * l_exchange
                          END IF
                       ELSE
                          LET l_pmdn.pmdn015 = l_final[l_pmdn.pmdnseq].pmdn015
                       END IF
                       
                       #乘上計價比率(百分比)
                       LET l_pmdn.pmdn015 = l_pmdn.pmdn015 * g_icag.icag007 / 100
                       LET l_modify = TRUE
            
                  #若"計價基準"=4.依下游廠商逆推
                  WHEN '4'
                       IF l_pmdl015_after <> l_pmdl.pmdl015 THEN
                          #取匯率
                          CALL s_aic_carry_exchange(l_pmdl.pmdl054,l_pmdl.pmdlsite,l_pmdl.pmdldocdt,l_pmdl015_after,l_pmdl.pmdl015,'2')
                          RETURNING r_success,l_exchange
                     
                          IF NOT r_success THEN
                             EXIT FOREACH
                          ELSE
                             LET l_pmdn.pmdn015 = l_after[l_pmdn.pmdnseq].pmdn015 * l_exchange
                          END IF
                       ELSE
                          LET l_pmdn.pmdn015 = l_after[l_pmdn.pmdnseq].pmdn015
                       END IF
                       
                       #乘上計價比率(百分比)
                       LET l_pmdn.pmdn015 = l_pmdn.pmdn015 * g_icag.icag007 / 100
                       LET l_modify = TRUE
                       
               END CASE
            END IF
            
            IF l_modify THEN
               #取得未稅金額、稅額、含稅金額
               CALL s_aic_carry_get_amount(l_pmdl.pmdlsite,l_pmdl.pmdldocno,l_pmdn.pmdnseq,l_pmdl.pmdl015,l_pmdn.pmdn011,l_pmdn.pmdn015,l_pmdn.pmdn016)
               RETURNING r_success,l_pmdn046,l_pmdn048,l_pmdn047
               
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
               
               #更新採購單
               UPDATE pmdn_t
                  SET pmdn015 = l_pmdn.pmdn015,   #單價
                      pmdn043 = l_pmdn.pmdn015,   #取出價格
                      pmdn046 = l_pmdn046,   #未稅金額
                      pmdn048 = l_pmdn048,   #稅額
                      pmdn047 = l_pmdn047    #含稅金額
                WHERE pmdnent = g_enterprise
                  AND pmdndocno = l_pmdl.pmdldocno
                  AND pmdnseq = l_pmdn.pmdnseq
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE:pmdn_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
               
               UPDATE pmdo_t
                  SET pmdo022 = l_pmdn.pmdn015    #參考價格
                WHERE pmdoent = g_enterprise
                  AND pmdodocno = l_pmdl.pmdldocno
                  AND pmdoseq = l_pmdn.pmdnseq
            
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE:pmdo_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()                  
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
               #160428-00006#4-s-add
               #更新pmdo資料
               OPEN s_aic_carry_pmdo_cs USING l_pmdl.pmdldocno,l_pmdn.pmdnseq
               FOREACH s_aic_carry_pmdo_cs INTO l_pmdo.pmdoseq1,l_pmdo.pmdoseq2,l_pmdo.pmdo022,l_pmdo.pmdo023,l_pmdo.pmdo031
                  LET l_pmdo.pmdo032 = 0
                  LET l_pmdo.pmdo033 = 0
                  LET l_pmdo.pmdo034 = 0
                  #取得未稅金額、含稅金額、稅額
                  CALL s_aic_carry_tax1(l_pmdl.pmdlsite,l_pmdo.pmdo031,l_pmdo.pmdo022,l_pmdo.pmdo023,l_pmdn.pmdn015,l_pmdn.pmdn016)
                    RETURNING l_pmdo.pmdo032,l_pmdo.pmdo033,l_pmdo.pmdo034
                  UPDATE pmdo_t
                     SET pmdo032 = l_pmdo.pmdo032,
                         pmdo033 = l_pmdo.pmdo033,
                         pmdo034 = l_pmdo.pmdo034
                   WHERE pmdoent = g_enterprise
                     AND pmdodocno = l_pmdl.pmdldocno
                     AND pmdoseq = l_pmdn.pmdnseq
                     AND pmdoseq1 = l_pmdo.pmdoseq1
                     AND pmdoseq2 = l_pmdo.pmdoseq2 
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "UPDATE pmdo_t"
                     LET g_errparam.code   = SQLCA.sqlcode
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()               
                     LET r_success = FALSE
                     EXIT FOREACH
                  END IF                    
               END FOREACH
               #160428-00006#4-e-add    
               
               #更新訂單            
               IF NOT cl_null(l_xmdadocno) THEN
                  #先update單價，之後由s_aic_carry_price_upd計算未稅、稅額、含稅金額
                  UPDATE xmdc_t
                     SET xmdc015 = l_pmdn.pmdn015,  #單價
                         xmdc043 = l_pmdn.pmdn015   #取出價格
                   WHERE xmdcent = g_enterprise
                     AND xmdcseq = l_pmdn.pmdnseq
                     AND xmdcdocno = l_xmdadocno
                  
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "UPDATE:xmdc_t"
                     LET g_errparam.code   = SQLCA.sqlcode
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                
                     LET r_success = FALSE
                     EXIT FOREACH
                  END IF
            
                  UPDATE xmdd_t
                     SET xmdd018 = l_pmdn.pmdn015    #參考價格
                   WHERE xmddent = g_enterprise             
                     AND xmddseq = l_pmdn.pmdnseq
                     AND xmdddocno = l_xmdadocno
                     AND xmdd003 <> '6'              #160428-00006#4 add
                                    
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = "UPDATE:xmdd_t"
                     LET g_errparam.code   = SQLCA.sqlcode
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                 
                     LET r_success = FALSE
                     EXIT FOREACH
                  END IF
               END IF
            END IF
            
            LET l_after[l_pmdn.pmdnseq].pmdn015 = l_pmdn.pmdn015  #後站單價
         END IF
      END FOREACH
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      LET l_final_site = FALSE
      
      IF l_modify THEN
         #重新計算整單的未稅、含稅總金額
         CALL s_aic_carry_return_amount(l_pmdl.pmdldocno)
         RETURNING l_pmdl040,l_pmdl042,l_pmdl041
         
         UPDATE pmdl_t
            SET pmdl040 = l_pmdl040,
                pmdl042 = l_pmdl042,
                pmdl041 = l_pmdl041
          WHERE pmdlent = g_enterprise 
            AND pmdldocno = l_pmdl.pmdldocno
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "UPDATE:pmdl_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #重新計算整單的未稅、含稅總金額(訂單)
         IF NOT cl_null(l_xmdadocno) THEN
            IF NOT s_aic_carry_price_upd('1',l_xmdadocno) THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END IF
      END IF

      LET l_pmdl015_after = l_pmdl.pmdl015      #後站幣別
      LET l_pmdlsite_after = l_pmdl.pmdlsite    #後站營運據點

   END FOREACH

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 計算匯率
# Memo...........:
# Usage..........: CALL s_aic_carry_exchange(p_icaa013,p_site,p_date,p_from,p_to,p_type)
#                  RETURNING r_success,r_exchange
# Input parameter: p_icaa013   #1.內銷(購)  2.外銷(購)
#                : p_site      #營運據點
#                : p_date      #單據日期
#                : p_from      #來源幣別
#                : p_to        #目的幣別(若為Null則預帶p_site本幣)
#                : p_type      #1.銷售   2.採購
# Return code....: r_success   #執行結果
#                : r_exchange  #匯率
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_exchange(p_icaa013,p_site,p_date,p_from,p_to,p_type)
   DEFINE p_icaa013      LIKE icaa_t.icaa013
   DEFINE p_site         LIKE xmdk_t.xmdksite
   DEFINE p_date         LIKE xmdk_t.xmdkdocdt
   DEFINE p_from         LIKE xmdk_t.xmdk016
   DEFINE p_to           LIKE xmdk_t.xmdk016
   DEFINE p_type         LIKE type_t.chr1
   DEFINE r_success      LIKE type_t.num5
   DEFINE r_exchange     LIKE xmdk_t.xmdk017

   DEFINE l_para_data    LIKE type_t.chr80

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_exchange = ''
   
  #170816-00007#31 -S mark
  #IF cl_null(p_icaa013) OR cl_null(p_site) OR cl_null(p_from) OR cl_null(p_type) THEN
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_exchange
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_icaa013) THEN
      LET g_colname_1 = cl_getmsg("sub-01476",g_dlang)   #1.內銷(購)  2.外銷(購)
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_site) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      CALL s_azzi902_get_gzzd("aici100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #營運據點
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_from) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici130","lbl_icah005") RETURNING g_colname_1,g_comment_1   #來源幣別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_type) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01507",g_dlang)   #多角類型
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
      RETURN r_success,r_exchange
   END IF
  #170816-00007#31 -E add 
   
   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF
   
   LET l_para_data = ''   
   CASE p_icaa013
      WHEN '1'  #內
         IF p_type = '1' THEN  #銷
            CALL cl_get_para(g_enterprise,p_site,'S-BAS-0010') RETURNING l_para_data
         ELSE    #購
            CALL cl_get_para(g_enterprise,p_site,'S-BAS-0014') RETURNING l_para_data
         END IF
      WHEN '2'  #外
         IF p_type = '1' THEN  #銷
            CALL cl_get_para(g_enterprise,p_site,'S-BAS-0011') RETURNING l_para_data
         ELSE    #購
            CALL cl_get_para(g_enterprise,p_site,'S-BAS-0015') RETURNING l_para_data         
         END IF
      
   END CASE

   IF cl_null(l_para_data) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00363'  #查無外幣採用匯率類型！
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_exchange
   ELSE
      IF cl_null(p_to) THEN
         #取本幣
         SELECT ooef016 INTO p_to
           FROM ooef_t
          WHERE ooefent = g_enterprise
            AND ooef001 = p_site
            
         IF cl_null(p_to) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = p_site
            LET g_errparam.code   = "aic-00024"   #該營運據點之主要幣別不可為空
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            
            LET r_success = FALSE            
            RETURN r_success,r_exchange
         END IF
      END IF

      #取匯率
      CALL s_aooi160_get_exrate('1',p_site,g_today,p_from,p_to,0,l_para_data) RETURNING r_exchange

   END IF

   RETURN r_success,r_exchange
END FUNCTION

################################################################################
# Descriptions...: 得出稅率、含稅否
# Memo...........:
# Usage..........: CALL s_aic_carry_tax(p_ooef001,p_oodb002)
#                  RETURNING r_success,r_oodb005,r_oodb006
# Input parameter: p_ooef001       LIKE ooef_t.ooef001    #營運據點
#                : p_oodb002       LIKE oodb_t.oodb002    #稅別代碼
# Return code....: r_success       LIKE type_t.num5       #檢核狀態
#                : r_oodb005       LIKE oodb_t.oodb005    #含稅否
#                : r_oodb006       LIKE oodb_t.oodb006    #稅率
# Date & Author..: 141113 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_tax(p_ooef001,p_oodb002)
   DEFINE p_ooef001       LIKE ooef_t.ooef001    #營運據點
   DEFINE p_oodb002       LIKE oodb_t.oodb002    #稅別代碼
   DEFINE r_success       LIKE type_t.num5       #檢核狀態
   DEFINE r_oodb005       LIKE oodb_t.oodb005    #含稅否
   DEFINE r_oodb006       LIKE oodb_t.oodb006    #稅率
   
   DEFINE l_oodbl004      LIKE oodbl_t.oodbl004  #稅別名稱
   DEFINE l_oodb011       LIKE oodb_t.oodb011    #稅別應用

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_oodb005 = ''
   LET r_oodb006 = ''

   CALL s_tax_chk(p_ooef001,p_oodb002) RETURNING r_success,l_oodbl004,r_oodb005,r_oodb006,l_oodb011
         
   RETURN r_success,r_oodb005,r_oodb006
END FUNCTION

################################################################################
# Descriptions...: 取得未稅金額、含稅金額、稅額
# Memo...........: 單純計算金額，不寫入xrcd檔
# Usage..........: CALL s_aic_carry_tax1(p_xmddsite,p_xmdd027,p_xmdd018,p_xmdd019,p_xmda015,p_xmda016)
#                  RETURNING r_xmdd028,r_xmdd029,r_xmdd030
# Input parameter: p_xmddsite        LIKE xmdd_t.xmddsite   #營運據點
#                : p_xmdd027         LIKE xmdd_t.xmdd027    #計價數量
#                : p_xmdd018         LIKE xmdd_t.xmdd018    #單價
#                : p_xmdd019         LIKE xmdd_t.xmdd019    #稅別
#                : p_xmda015         LIKE xmda_t.xmda015    #幣別   
#                : p_xmda016         LIKE xmda_t.xmda016    #匯率
# Return code....: r_xmdd028         LIKE xmdd_t.xmdd028    #未稅金額
#                : r_xmdd029         LIKE xmdd_t.xmdd029    #含稅金額
#                : r_xmdd030         LIKE xmdd_t.xmdd030    #稅額
# Date & Author..: 141117 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_tax1(p_xmddsite,p_xmdd027,p_xmdd018,p_xmdd019,p_xmda015,p_xmda016)
   DEFINE p_xmddsite        LIKE xmdd_t.xmddsite   #營運據點
   DEFINE p_xmdd027         LIKE xmdd_t.xmdd027    #計價數量
   DEFINE p_xmdd018         LIKE xmdd_t.xmdd018    #單價
   DEFINE p_xmdd019         LIKE xmdd_t.xmdd019    #稅別
   DEFINE p_xmda015         LIKE xmda_t.xmda015    #幣別   
   DEFINE p_xmda016         LIKE xmda_t.xmda016    #匯率
   
   DEFINE r_xmdd028         LIKE xmdd_t.xmdd028    #未稅金額
   DEFINE r_xmdd029         LIKE xmdd_t.xmdd029    #含稅金額
   DEFINE r_xmdd030         LIKE xmdd_t.xmdd030    #稅額
   
   DEFINE l_money           LIKE xmdc_t.xmdc046
   DEFINE l_xrcd113         LIKE xrcd_t.xrcd113
   DEFINE l_xrcd114         LIKE xrcd_t.xrcd114
   DEFINE l_xrcd115         LIKE xrcd_t.xrcd115

   WHENEVER ERROR CONTINUE

   LET r_xmdd028 = 0
   LET r_xmdd029 = 0
   LET r_xmdd030 = 0

   IF cl_null(p_xmddsite) OR cl_null(p_xmdd027) OR
      cl_null(p_xmdd018) OR cl_null(p_xmdd019) OR
      cl_null(p_xmda015) OR cl_null(p_xmda016) THEN
      RETURN r_xmdd028,r_xmdd029,r_xmdd030
   END IF

   LET l_money = p_xmdd027 * p_xmdd018
   CALL s_tax_count(p_xmddsite,p_xmdd019,l_money,p_xmdd027,p_xmda015,p_xmda016)
     RETURNING r_xmdd028,r_xmdd030,r_xmdd029,l_xrcd113,l_xrcd114,l_xrcd115

   IF cl_null(r_xmdd028) THEN LET r_xmdd028 = 0 END IF
   IF cl_null(r_xmdd029) THEN LET r_xmdd029 = 0 END IF
   IF cl_null(r_xmdd030) THEN LET r_xmdd030 = 0 END IF

   RETURN r_xmdd028,r_xmdd029,r_xmdd030
END FUNCTION

################################################################################
# Descriptions...: 取得未稅金額、税额、含稅金額
# Memo...........:
# Usage..........: CALL s_aic_carry_get_amount(p_pmdlsite,p_pmdldocno,p_pmdnseq,p_pmdl015,p_pmdn011,p_pmdn015,p_pmdn016)
#                  RETURNING r_pmdn046,r_pmdn048,r_pmdn047
# Input parameter: p_pmdlsite     營運據點
#                : p_pmdldocno    單據編號
#                : p_pmdnseq      項次
#                : p_pmdl015      幣別
#                : p_pmdn011      計價數量
#                : p_pmdn015      單價
#                : p_pmdn016      稅別
# Return code....: r_success      執行結果
#                : r_pmdn046      未稅金額
#                : r_pmdn048      稅額
#                : r_pmdn047      含稅金額
# Date & Author..: 141120 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_amount(p_pmdlsite,p_pmdldocno,p_pmdnseq,p_pmdl015,p_pmdn011,p_pmdn015,p_pmdn016)
   DEFINE p_pmdlsite        LIKE pmdl_t.pmdlsite
   DEFINE p_pmdldocno       LIKE pmdl_t.pmdldocno
   DEFINE p_pmdnseq         LIKE pmdn_t.pmdnseq
   DEFINE p_pmdl015         LIKE pmdl_t.pmdl015
   DEFINE p_pmdn011         LIKE pmdn_t.pmdn011
   DEFINE p_pmdn015         LIKE pmdn_t.pmdn015
   DEFINE p_pmdn016         LIKE pmdn_t.pmdn016
   DEFINE r_success         LIKE type_t.num5
   DEFINE r_pmdn046         LIKE pmdn_t.pmdn046
   DEFINE r_pmdn048         LIKE pmdn_t.pmdn048
   DEFINE r_pmdn047         LIKE pmdn_t.pmdn047
   DEFINE l_money           LIKE pmdn_t.pmdn046
   DEFINE l_xrcd113         LIKE xrcd_t.xrcd113
   DEFINE l_xrcd114         LIKE xrcd_t.xrcd114
   DEFINE l_xrcd115         LIKE xrcd_t.xrcd115
   DEFINE l_xrcd123         LIKE xrcd_t.xrcd113
   DEFINE l_xrcd124         LIKE xrcd_t.xrcd114
   DEFINE l_xrcd125         LIKE xrcd_t.xrcd115
   DEFINE l_xrcd133         LIKE xrcd_t.xrcd113
   DEFINE l_xrcd134         LIKE xrcd_t.xrcd114
   DEFINE l_xrcd135         LIKE xrcd_t.xrcd115

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_pmdn046 = 0
   LET r_pmdn048 = 0
   LET r_pmdn047 = 0

   IF cl_null(p_pmdlsite) OR cl_null(p_pmdldocno) OR cl_null(p_pmdnseq) OR cl_null(p_pmdn011) OR
      cl_null(p_pmdn015) OR cl_null(p_pmdn016) THEN
      RETURN r_success,r_pmdn046,r_pmdn048,r_pmdn047
   END IF

   LET l_money = p_pmdn011 * p_pmdn015
   CALL s_tax_ins(p_pmdldocno,p_pmdnseq,0,p_pmdlsite,l_money,p_pmdn016,
                  p_pmdn011,p_pmdl015,1,'','','')
        RETURNING r_pmdn046,r_pmdn048,r_pmdn047,l_xrcd113,l_xrcd114,l_xrcd115,
                  l_xrcd123,l_xrcd124,l_xrcd125,l_xrcd133,l_xrcd134,l_xrcd135

   #計算失敗
   IF NOT g_sub_success THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdn046,r_pmdn048,r_pmdn047
   END IF
   
   IF cl_null(r_pmdn046) THEN LET r_pmdn046 = 0 END IF
   IF cl_null(r_pmdn048) THEN LET r_pmdn048 = 0 END IF
   IF cl_null(r_pmdn047) THEN LET r_pmdn047 = 0 END IF

   RETURN r_success,r_pmdn046,r_pmdn048,r_pmdn047   
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aic_carry_return_amount(p_pmdldocno)
#                  RETURNING r_pmdl040,r_pmdl042,r_pmdl041
# Input parameter: p_pmdldocno      LIKE pmdl_t.pmdldocno  #單據編號
#                : 
# Return code....: r_pmdl040        LIKE pmdl_t.pmdl040     #總未稅金額
#                : r_pmdl042        LIKE pmdl_t.pmdl042     #總稅額
#                : r_pmdl041        LIKE pmdl_t.pmdl041     #總含稅金額
# Date & Author..: 141117 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_return_amount(p_pmdldocno)
   DEFINE p_pmdldocno      LIKE pmdl_t.pmdldocno
   DEFINE r_pmdl040        LIKE pmdl_t.pmdl040     #總未稅金額
   DEFINE r_pmdl042        LIKE pmdl_t.pmdl042     #總稅額
   DEFINE r_pmdl041        LIKE pmdl_t.pmdl041     #總含稅金額
   
   DEFINE l_xrcd113        LIKE xrcd_t.xrcd113
   DEFINE l_xrcd114        LIKE xrcd_t.xrcd114
   DEFINE l_xrcd115        LIKE xrcd_t.xrcd115

   WHENEVER ERROR CONTINUE

   LET r_pmdl040 = 0
   LET r_pmdl042 = 0
   LET r_pmdl041 = 0

   IF cl_null(p_pmdldocno) THEN
      RETURN r_pmdl040,r_pmdl042,r_pmdl041
   END IF

   #重新計算整單的未稅、含稅總金額
   CALL s_tax_recount(p_pmdldocno)
   RETURNING r_pmdl040,r_pmdl042,r_pmdl041,l_xrcd113,l_xrcd114,l_xrcd115

   IF cl_null(r_pmdl040) THEN LET r_pmdl040 = 0 END IF
   IF cl_null(r_pmdl042) THEN LET r_pmdl042 = 0 END IF
   IF cl_null(r_pmdl041) THEN LET r_pmdl041 = 0 END IF
   
   RETURN r_pmdl040,r_pmdl042,r_pmdl041
END FUNCTION

################################################################################
# Descriptions...: 查詢營運據點之"據點對應客戶/廠商編號"
# Memo...........:
# Usage..........: CALL s_aic_carry_get_ooef024(p_site)
#                  RETURNING r_success,r_ooef024
# Input parameter: p_site      營運據點
#                : 
# Return code....: r_success   執行結果
#                : r_ooef024   據點對應客戶/廠商編號
# Date & Author..: 141117 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_get_ooef024(p_site)
   DEFINE p_site     LIKE ooef_t.ooef001
   DEFINE r_success  LIKE type_t.num5
   DEFINE r_ooef024  LIKE ooef_t.ooef024
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET r_ooef024 = ''
   
   #傳入值"營運據點"之"據點對應客戶/廠商編號"
   SELECT ooef024 INTO r_ooef024
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = p_site
      
   IF cl_null(r_ooef024) THEN
      INITIALIZE g_errparam TO NULL      
      LET g_errparam.extend = p_site      
      LET g_errparam.code   = "aic-00113"   #組織編號%1之"據點對應客戶/廠商編號"不可為空！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = p_site
            
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success,r_ooef024
   END IF
   
   RETURN r_success,r_ooef024
END FUNCTION

#於gen_tri_wo前呼叫
PUBLIC FUNCTION s_aic_carry_create_temp_asfp400()
   DEFINE r_success     LIKE type_t.num5   
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   CALL s_aic_carry_drop_temp_asfp400()

   CREATE TEMP TABLE asfp400_tmp_t(
      sfcbdocno      LIKE sfcb_t.sfcbdocno,
      sfaa010        LIKE sfaa_t.sfaa010,
      sfac006        LIKE sfac_t.sfac006,
      sfcb001        LIKE sfcb_t.sfcb001,
      sfcb002        LIKE sfcb_t.sfcb002,
      sfcb003        LIKE sfcb_t.sfcb003,
      sfcb004        LIKE sfcb_t.sfcb004,
      sfcb020        LIKE sfcb_t.sfcb020,
      carry_qty      LIKE sfaa_t.sfaa012,
      sfcb013        LIKE sfcb_t.sfcb013,
      sfcb044        LIKE sfcb_t.sfcb044,
      sfcb045        LIKE sfcb_t.sfcb045,
      pmdl017        LIKE pmdl_t.pmdl017,
      pmdl015        LIKE pmdl_t.pmdl015,
      exrate         LIKE ooan_t.ooan005,
      pmdl011        LIKE pmdl_t.pmdl011,
      price          LIKE pmdn_t.pmdn015
      );
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create:asfp400_tmp_t'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

#於gen_tri_wo後呼叫
PUBLIC FUNCTION s_aic_carry_drop_temp_asfp400()
   WHENEVER ERROR CONTINUE
   
   DROP TABLE asfp400_tmp_t;
END FUNCTION

################################################################################
# Descriptions...: 刪除多角流程流水號
# Memo...........:
# Usage..........: CALL s_aic_carry_deletetrino(p_docno,p_type)
#                  RETURNING r_success
# Input parameter: p_docno       #多角單號
#                : p_type        #多角流程類型('1'訂單/採購單
#                                             '2'出貨通知單
#                                             '3'Invoice/Packing
#                                             '4'出貨/收貨入庫
#                                             '5'應收/付立帳
#                                             '6'銷退/倉退
#                                             '7'應收/付折讓)
# Return code....: 
#                : 
# Date & Author..: 150205 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_deletetrino(p_docno,p_type)
   DEFINE p_docno         STRING              #多角單號
   DEFINE p_type          LIKE type_t.chr1    #流程類型

   DEFINE r_success       LIKE type_t.num5

   DEFINE l_icai001       LIKE icai_t.icai001 #流程代碼
   DEFINE l_icaa008       LIKE icaa_t.icaa008
   DEFINE l_docno         STRING              #期別+流水號
   DEFINE l_icai003       LIKE icai_t.icai003 #期別
   DEFINE l_icai004       LIKE icai_t.icai004 #流水號
   DEFINE l_icai004_max   LIKE icai_t.icai004 #最大流水號


   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
  
  #170816-00007#31 -S mark
  #IF cl_null(p_docno) OR
  #   cl_null(p_type) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = ""
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #   
  #   LET r_success = FALSE
  #   RETURN r_success
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_docno) THEN
      CALL s_azzi902_get_gzzd("aicq100","lbl_xmda031") RETURNING g_colname_1,g_comment_1   #多角序號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_type) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      LET g_colname_1 = cl_getmsg("sub-01481",g_dlang)   #流程類型
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
      RETURN r_success
   END IF
  #170816-00007#31 -E add

   IF p_type NOT MATCHES '[1234567]' THEN

      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = p_type
      LET g_errparam.code   = "aic-00078"   #傳入之"多角流程類型"錯誤！
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   #流程代碼
   LET l_icai001 = p_docno.substring(1,s_chr_get_index_of(p_docno,'-',1) - 1)
   #期別+流水號
   LET l_docno = p_docno.substring(s_chr_get_index_of(p_docno,'-',1) + 1,p_docno.getlength())
   
   #取得"流程序號編碼方式"
   LET l_icaa008 = ''
   SELECT icaa008
     INTO l_icaa008
     FROM icaa_t
    WHERE icaaent = g_enterprise
      AND icaa001 = l_icai001
      
   IF cl_null(l_icaa008) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = l_icai001
      LET g_errparam.code   = "aic-00077"   #該多角流程代碼無流程序號編碼方式！
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF

   LET l_icai003 = ''
   LET l_icai004 = ''

   CASE l_icaa008
      WHEN '0'   #無
         LET l_icai003 = 0   #纯流水码的时候期别特别设为0
         LET l_icai004 = l_docno.substring(l_docno.getlength()-8,l_docno.getlength())

      WHEN '1'   #YYMM
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-6)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-5,l_docno.getlength())

      WHEN '2'   #YYPP
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-6)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-5,l_docno.getlength())

      WHEN '3'   #YYYYMMDD
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-2)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-1,l_docno.getlength())
          
      WHEN '4'   #YYYYMM
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-4)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-3,l_docno.getlength())

      WHEN '5'   #YYYYPP
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-4)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-3,l_docno.getlength())

      WHEN '6'   #YYMMDD
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-4)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-3,l_docno.getlength())

      WHEN '7'   #YYM
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-7)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-6,l_docno.getlength())

      WHEN '8'   #YYWW
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-6)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-5,l_docno.getlength())

      WHEN '9'   #YYYYWW
         LET l_icai003 = l_docno.substring(l_docno.getlength()-9,l_docno.getlength()-4)
         LET l_icai004 = l_docno.substring(l_docno.getlength()-3,l_docno.getlength())

   END CASE

   LET g_sql = "SELECT COALESCE(icai004,0)",
               "  FROM icai_t",
               " WHERE icaient = ",g_enterprise,
               "   AND icai001 = '",l_icai001,"'",
               "   AND icai002 = '",p_type,"'",
               "   AND icai003 = '",l_icai003,"'",
               "   FOR UPDATE"
   LET g_sql = cl_sql_forupd(g_sql)
   DECLARE s_aic_carry_icai_cl01 CURSOR FROM g_sql
   
   OPEN s_aic_carry_icai_cl01
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      CLOSE s_aic_carry_icai_cl01
      LET r_success = FALSE
      RETURN r_success
   END IF

   LET l_icai004_max = ''
   FETCH s_aic_carry_icai_cl01 INTO l_icai004_max

   #無資料不做更新
   IF SQLCA.sqlcode = "100" THEN
      CLOSE s_aic_carry_icai_cl01
      RETURN r_success   
   END IF

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      CLOSE s_aic_carry_icai_cl01
      LET r_success = FALSE
      RETURN r_success
   END IF

   #若刪除的單據為最大號，更新最大流水號
   IF l_icai004_max = l_icai004 THEN
      UPDATE icai_t
         SET icai004 = icai004 - 1
       WHERE icaient = g_enterprise
         AND icai001 = l_icai001
         AND icai002 = p_type
         AND icai003 = l_icai003

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         CLOSE s_aic_carry_icai_cl01
         LET r_success = FALSE    
         RETURN r_success
      END IF

   END IF
   
   CLOSE s_aic_carry_icai_cl01
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 單據自動編碼
# Memo...........:
# Usage..........: CALL s_aic_carry_docno(p_docno,p_site,p_slip,p_date,p_prog)
#                  RETURNING r_success,r_docno
# Input parameter: p_docno     來源單號
#                : p_site      營運據點
#                : p_slip      單別
#                : p_date      日期
#                : p_prog      作業
# Return code....: r_success   處理狀況
#                : r_docno     單號
# Date & Author..: 150401 By whitney
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_docno(p_docno,p_site,p_slip,p_date,p_prog)
DEFINE p_docno       STRING
DEFINE p_site        LIKE ooef_t.ooef001
DEFINE p_slip        LIKE type_t.chr20
DEFINE p_date        LIKE type_t.dat
DEFINE p_prog        LIKE oobl_t.oobl002
DEFINE r_success     LIKE type_t.num5
DEFINE r_docno       STRING
DEFINE l_success     LIKE type_t.num5
DEFINE l_site        LIKE ooef_t.ooef001
DEFINE l_slip        LIKE type_t.chr20
DEFINE l_ooef005     LIKE ooef_t.ooef005
DEFINE l_docno       LIKE type_t.chr20
DEFINE l_cnt         LIKE type_t.num5
DEFINE l_oobx007     LIKE oobx_t.oobx007
DEFINE l_sn          STRING
DEFINE l_doc_len     LIKE type_t.num5     #单号长度
DEFINE l_site_len    LIKE type_t.num5     #SITE段长度
DEFINE l_slip_len    LIKE type_t.num5     #单别段长度
DEFINE l_sn_len      LIKE type_t.num5     #流水码段长度（含年期）
DEFINE l_oobf003     LIKE oobf_t.oobf003
DEFINE l_forupd_sql  STRING
DEFINE l_oobf004     LIKE oobf_t.oobf004
DEFINE r_slip        LIKE type_t.chr20    #170718-00003#1 add
#171031-00048#1 add -s
DEFINE l_cnt1        LIKE type_t.num5     
DEFINE l_docno1       STRING               
DEFINE l_docno2       STRING               
#171031-00048#1 add -e
#add by huna20180608---s
DEFINE l_xmda008      LIKE xmda_t.xmda008
DEFINE l_pmdl008      LIKE pmdl_t.pmdl008
DEFINE l_docno_p      LIKE xmda_t.xmda008
DEFINE l_docno_r      LIKE xmda_t.xmda008
DEFINE l_pmdl008_str  STRING
#add by huna20180608---e

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_docno = ''

   #多角單據流水號保持一致，委外工單除外
   #IF cl_get_para(g_enterprise,'','E-BAS-0018') = 'Y' AND p_prog <> 'asft300' THEN   #170301-00021#3 by 09263 --mark
   IF cl_get_para(g_enterprise,'','E-BAS-0018') = 'Y' AND p_prog NOT MATCHES 'asft300*' THEN   #170301-00021#3 by 09263 --add
      CALL s_aooi200_get_site(p_docno)
           RETURNING l_success,l_site
      CALL s_aooi200_get_slip(p_docno)
           RETURNING l_success,l_slip
      LET l_ooef005 = ''
      SELECT ooef005 INTO l_ooef005
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = p_site
      LET l_ooef005 = UPSHIFT(l_ooef005)
      #171031-00048#1 add -s
      #SITE 长度
      LET l_site_len = cl_get_para(g_enterprise,'','E-COM-0003')
      #单别长度
      LET l_slip_len = cl_get_para(g_enterprise,'','E-COM-0001')
      IF cl_get_para(g_enterprise,'','E-COM-0002') = 'Y' THEN
         LET l_cnt1 = l_site_len + l_slip_len + 1   #加上“-”分隔
      ELSE 
         LET l_cnt1 = l_site_len + l_slip_len
      END IF
      LET l_docno1 = p_docno.subString(1,l_cnt1)                     #截取单别+据点
      LET l_docno2 = p_docno.subString(l_cnt1+1,p_docno.getLength()) #截取单据的后半字串
      #171031-00048#1 add -e
      CALL cl_str_replace(l_docno1,l_site,l_ooef005)  #171031-00048#1 mod p_docno->l_docno1
           RETURNING r_docno
      LET r_docno = r_docno.append(l_docno2)   #171031-00048#1 add   #组成替换后的新单据
      #170718-00003#1 add---start---
      LET r_slip = ''
      CALL cl_str_replace(l_slip,l_site,l_ooef005)
           RETURNING r_slip
      IF cl_null(r_slip) THEN
         LET r_slip = l_slip
      END IF
      #170718-00003#1 add---end---
      #CALL cl_str_replace(r_docno,l_slip,p_slip)      #170718-00003#1 mark
      CALL cl_str_replace(r_docno,r_slip,p_slip)       #170718-00003#1 add
           RETURNING r_docno
      
      #檢查新的單據號碼是否已存在，存在的話顯示詳細的錯誤訊息並回傳錯誤
      LET l_docno = r_docno
      LET l_cnt = 0
      CASE
         #WHEN p_prog = 'axmt500'  #訂單單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'axmt500*'    #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM xmda_t
             WHERE xmdaent = g_enterprise
               AND xmdadocno = l_docno
         #WHEN p_prog = 'axmt540'  #出貨單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'axmt540*' #出貨單號   #170301-00021#3 by 09263 --add
           #OR p_prog = 'axmt541'  #無訂單出貨   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'axmt541*'   #無訂單出貨  #170301-00021#3 by 09263 --add
           #OR p_prog = 'axmt600'  #銷退單號   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'axmt600*'#銷退單號   #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM xmdk_t
             WHERE xmdkent = g_enterprise
               AND xmdkdocno = l_docno
         #WHEN p_prog = 'apmt500'  #採購單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'apmt500*'  #採購單號  #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM pmdl_t
             WHERE pmdlent = g_enterprise
               AND pmdldocno = l_docno
         #WHEN p_prog = 'apmt580'  #倉退單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'apmt580*'  #倉退單號   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt520'  #收貨單號   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt520*'  #收貨單號   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt530'  #收貨入庫   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt530*'  #收貨入庫   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt531'  #委外收貨入庫   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt531*'  #委外收貨入庫   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt532'  #無採購收貨入庫   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt532*'  #無採購收貨入庫   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt570'  #入庫單號   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt570*'  #入庫單號   #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM pmds_t
             WHERE pmdsent = g_enterprise
               AND pmdsdocno = l_docno
         #WHEN p_prog = 'asft300'  #委外工單   #170301-00021#3 by 09263 --mark      
         WHEN p_prog MATCHES 'asft300*'  #委外工單   #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM sfaa_t
             WHERE sfaaent = g_enterprise
               AND sfaadocno = l_docno
      END CASE
      IF NOT cl_null(l_cnt) AND l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aic-00131'
         LET g_errparam.extend = r_docno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         LET r_docno = ''
         RETURN r_success,r_docno
      END IF
      #更新單據別最大流水號oobf_t
      LET l_oobx007 = 0
      SELECT oobx007 INTO l_oobx007
        FROM oobx_t
       WHERE oobxent = g_enterprise
         AND oobx001 = l_slip
      LET l_sn = l_docno[r_docno.getlength()-l_oobx007+1,r_docno.getlength()]
      #SITE 长度
      LET l_site_len = cl_get_para(g_enterprise,'','E-COM-0003')
      #单别长度
      LET l_slip_len = cl_get_para(g_enterprise,'','E-COM-0001')
      #单号长度
      LET l_doc_len = cl_get_para(g_enterprise,'','E-COM-0005')
      #流水码长度（含年期）
      LET l_sn_len = l_doc_len - l_slip_len - l_site_len 
      IF cl_get_para(g_enterprise,'','E-COM-0002') ='Y' THEN
         LET l_sn_len = l_sn_len - 1
      END IF
      IF cl_get_para(g_enterprise,'','E-COM-0004') ='Y' THEN
         LET l_sn_len = l_sn_len - 1
      END IF
      IF l_sn_len = l_sn.getlength() THEN
         LET l_oobf003 = '0'
      ELSE
         LET l_oobf003 = l_docno[r_docno.getlength()-l_sn_len+1,r_docno.getlength()-l_oobx007]
      END IF
      #从最大流水码表oobf_t找到合适的最大流水码，加1，写入oobf_t，若取不到，则编001存入
      #要先锁住最大流水码表，锁到单别的范围
      LET l_forupd_sql = " SELECT oobf004+1 FROM oobf_t ",
                          " WHERE oobfent = ",g_enterprise,
                            " AND oobfsite= '",p_site,"'",
                            " AND oobf001 = '",l_ooef005,"'",
                            " AND oobf002 = '",p_slip,"'", 
                            " AND oobf003 = '",l_oobf003,"'",
                            " FOR UPDATE "
      LET l_forupd_sql = cl_sql_forupd(l_forupd_sql)
      DECLARE auno_lock_cl CURSOR FROM l_forupd_sql
      OPEN auno_lock_cl
      FETCH auno_lock_cl INTO l_oobf004
      IF SQLCA.sqlcode = "-263" THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00115'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         CLOSE auno_lock_cl
         LET r_success = FALSE
         LET r_docno = ''
         RETURN r_success,r_docno
      END IF
      #若最大流水码没取到，说明这是第一次取，编个001吧！
      IF SQLCA.sqlcode = 100 THEN
         LET l_oobf004 = 1 
      END IF
      IF l_sn > = l_oobf004 THEN
         LET l_oobf004 = l_sn
         INSERT INTO oobf_t(oobfent,oobfsite,oobf001,oobf002,oobf003,oobf004)
                     VALUES(g_enterprise,p_site,l_ooef005,p_slip,l_oobf003,l_oobf004)  
         IF SQLCA.sqlcode = -239 OR SQLCA.sqlcode = -268 THEN
            UPDATE oobf_t SET oobf004 = l_oobf004
             WHERE oobfent = g_enterprise
               AND oobfsite= p_site
               AND oobf001 = l_ooef005
               AND oobf002 = p_slip
               AND oobf003 = l_oobf003
            IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode 
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CLOSE auno_lock_cl
               LET r_success = FALSE
               LET r_docno = ''
               RETURN r_success,r_docno
            END IF
         END IF
      END IF
      FREE auno_lock_cl
   ELSE   
      #fcx-180408--str---工单编码
      IF p_prog = 'asft300' AND cl_get_doc_para(g_enterprise,p_site,p_slip,'D-MFGC-007') = 'Y' THEN   
         CALL cs_aooi200_gen_docno(p_site,p_slip,p_date,p_prog)  
         RETURNING r_success,r_docno
      ELSE         
      #fcx-180408--end---工单编码      
         CALL s_aooi200_gen_docno(p_site,p_slip,p_date,p_prog)
              RETURNING r_success,r_docno
      END IF  #fcx-180408--end---工单编码
      
      #add by huna20180608---s
      #如果来源订单单号 对应的来源是 【6.多角抛转】，
      #              并且来源单号为 【E45】,
      #来源据点为昆山【KS】，抛转据点为南通【NT】
      #则生成的工单号 后九位直接置为 来源工单号的 后九位
      LET l_xmda008 = ''
      LET l_docno_p = p_docno
      SELECT xmda008 INTO l_xmda008 FROM xmda_t WHERE xmdaent = g_enterprise AND xmdadocno = l_docno_p AND xmda007 = '6'
      IF NOT cl_null(l_xmda008) THEN 
        CALL s_aooi200_get_slip(l_xmda008) RETURNING l_success,l_slip
        #IF l_slip = 'E45' OR l_slip = 'E46' THEN  #add E46 的情况 by huna20180611
        IF l_slip = 'E45' OR l_slip = 'E46'  OR l_slip = 'E4O' THEN  #C200917-01626#1 add by pane 200917 增加E4O单别
             ######单号编码,工单后面流水码相同########
             #获取l_xmda008(多角来源委外采购单对应的工单)
             LET l_pmdl008 = ''
             SELECT pmdl008 INTO l_pmdl008 FROM pmdl_t WHERE pmdlent = g_enterprise AND pmdldocno = l_xmda008 AND pmdl007 = '4'
             IF NOT cl_null(l_pmdl008) THEN 
                 LET l_pmdl008_str = l_pmdl008
                 CALL s_aooi200_get_site(l_pmdl008_str)
                      RETURNING l_success,l_site
                 IF l_site = 'KS' AND p_site = 'NT' THEN    #来源为 KS，当前为NT，才走 
                    LET l_docno_r = r_docno                 
                    LET l_docno_r[r_docno.getlength()-8,r_docno.getlength()] = l_pmdl008[r_docno.getlength()-8,r_docno.getlength()]
                    LET r_docno = l_docno_r
                 END IF 
             END IF                          
             ######单号编码,工单后面流水码相同########
        END IF 
      END IF 
      #add by huna20180608---e      
   END IF
   
   RETURN r_success,r_docno
END FUNCTION

#抓取入庫單單身第一筆採購單號
PRIVATE FUNCTION s_aic_carry_sel_pmdt001_sql(p_pmdtseq)
   DEFINE p_pmdtseq    LIKE pmdt_t.pmdtseq
   
   WHENEVER ERROR CONTINUE
   
   #151103 earl mod
   LET g_sql = "SELECT pmds000,COALESCE(pmds006,pmdt027),pmdt001",
               "  FROM pmds_t,pmdt_t",
               " WHERE pmdsent = pmdtent AND pmdtent = ",g_enterprise,
               "   AND pmdsdocno = pmdtdocno",
               "   AND pmdtdocno = ?"
   IF NOT cl_null(p_pmdtseq) THEN
      LET g_sql = g_sql," AND pmdtseq = '",p_pmdtseq,"'"
   ELSE
      LET g_sql = g_sql," AND pmdt001 IS NOT NULL"
   END IF

   LET g_sql = g_sql," ORDER BY pmdtseq"

   RETURN
END FUNCTION

#抓取出貨單單身第一筆訂單單號
PRIVATE FUNCTION s_aic_carry_sel_xmdl003_sql(p_xmdlseq)
   DEFINE p_xmdlseq    LIKE xmdl_t.xmdlseq
   
   WHENEVER ERROR CONTINUE
            
   LET g_sql = "SELECT xmdl003",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = ?"
   IF NOT cl_null(p_xmdlseq) THEN
      LET g_sql = g_sql," AND xmdlseq = '",p_xmdlseq,"'"
   ELSE
      LET g_sql = g_sql," AND xmdl003 IS NOT NULL"
   END IF
   
   LET g_sql = g_sql," ORDER BY xmdlseq"
   
   RETURN
END FUNCTION

#抓取出貨單單身第一筆出通單號
PRIVATE FUNCTION s_aic_carry_sel_xmdl001_xmdl002(p_xmdldocno,p_xmdlseq)
   DEFINE p_xmdldocno  LIKE xmdl_t.xmdldocno
   DEFINE p_xmdlseq    LIKE xmdl_t.xmdlseq
   DEFINE r_success    LIKE type_t.num5
   DEFINE r_xmdl001    LIKE xmdl_t.xmdl001
   DEFINE r_xmdl002    LIKE xmdl_t.xmdl002
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET r_xmdl001 = ''
   LET r_xmdl002 = ''

   LET g_sql = "SELECT xmdl001,xmdl002",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = '",p_xmdldocno,"'"
   IF NOT cl_null(p_xmdlseq) THEN
      LET g_sql = g_sql," AND xmdlseq = '",p_xmdlseq,"'"
   ELSE
      LET g_sql = g_sql," AND xmdl001 IS NOT NULL"
   END IF
   
   LET g_sql = g_sql," ORDER BY xmdlseq"
   
   PREPARE s_aic_carry_xmdl001_xmdl002_pre FROM g_sql
   DECLARE s_aic_carry_xmdl001_xmdl002_cs SCROLL CURSOR FOR s_aic_carry_xmdl001_xmdl002_pre
   OPEN s_aic_carry_xmdl001_xmdl002_cs
   
   FETCH FIRST s_aic_carry_xmdl001_xmdl002_cs INTO r_xmdl001,r_xmdl002
   IF SQLCA.sqlcode AND SQLCA.sqlcode <> 100 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "FETCH:s_aic_carry_xmdl001_xmdl002_cs"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
   END IF
   
   CLOSE s_aic_carry_xmdl001_xmdl002_cs
   FREE s_aic_carry_xmdl001_xmdl002_pre
   
   RETURN r_success,r_xmdl001,r_xmdl002
END FUNCTION

################################################################################
# Descriptions...: 抓取imaf091,imaf092
# Memo...........:
# Usage..........: CALL s_aic_carry_sel_imaf091_imaf092(p_imafsite,p_imaf001)
#                  RETURNING r_imaf091,r_imaf092
# Input parameter: p_imafsite   營運據點
#                : p_imaf001    料件編號
# Return code....: r_imaf091    預設庫位
#                : r_imaf092    預設儲位
# Date & Author..: 150812 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_sel_imaf091_imaf092(p_imafsite,p_imaf001)
   DEFINE p_imafsite   LIKE imaf_t.imafsite
   DEFINE p_imaf001    LIKE imaf_t.imaf001
   DEFINE r_imaf091    LIKE imaf_t.imaf091
   DEFINE r_imaf092    LIKE imaf_t.imaf092
   
   WHENEVER ERROR CONTINUE
   
   LET r_imaf091 = ''
   LET r_imaf092 = ''
   
   SELECT imaf091,imaf092
     INTO r_imaf091,r_imaf092
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = p_imafsite
      AND imaf001 = p_imaf001
      
   RETURN r_imaf091,r_imaf092
END FUNCTION

################################################################################
# Descriptions...: 產生統銷統收之第0站出貨單
# Memo...........: 請依照順序CALL
#                : CALL s_tax_recount_tmp()
#                : CALL s_transaction_begin()
#                : CALL s_aic_carry_gen_tri_sb()
#                : CALL s_transaction_end(Y,0)
# Usage..........: CALL s_aic_carry_gen_tri_sb(p_xmdkdocno)
#                  RETURNING r_success,r_pmdsdocno
# Input parameter: p_xmdkdocno                          #最終站出貨單號
#                : 
# Return code....: r_success     LIKE type_t.num5       #執行結果
#                : r_xmdkdocno   LIKE xmdk_t.xmdkdocno  #產生之第0站出貨單號
# Date & Author..: 150811 By earl
# Modify.........: 150917-00001#4 151111 earl 增加製造批序號拋轉
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_sb(p_xmdkdocno)
   DEFINE p_xmdkdocno     LIKE xmdk_t.xmdkdocno
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_xmdkdocno     LIKE xmdk_t.xmdkdocno
   
   DEFINE l_xmdk005       LIKE xmdk_t.xmdk005
   DEFINE l_xmdk006       LIKE xmdk_t.xmdk006
   DEFINE l_xmdk045       LIKE xmdk_t.xmdk045
   DEFINE l_xmdasite      LIKE xmda_t.xmdasite
   DEFINE l_slip          LIKE xmdk_t.xmdkdocno
   
   DEFINE l_imaf          RECORD
      imaf091                LIKE imaf_t.imaf091,
      imaf092                LIKE imaf_t.imaf092
                          END RECORD
   DEFINE l_xrcd          RECORD
      xrcd103                LIKE xrcd_t.xrcd103,
      xrcd104                LIKE xrcd_t.xrcd104,
      xrcd105                LIKE xrcd_t.xrcd105
                          END RECORD
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   LET r_xmdkdocno = ''

   LET g_sql = "SELECT xmdl003 ",
               "  FROM xmdl_t",
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = '",p_xmdkdocno,"'",
               "   AND xmdl003 IS NOT NULL",
               " ORDER BY xmdlseq"
   PREPARE s_aic_carry_produce_packing_pre FROM g_sql
   DECLARE s_aic_carry_produce_packing_cs SCROLL CURSOR FOR s_aic_carry_produce_packing_pre
   

   LET l_xmdk005 = ''  #出通單號
   LET l_xmdk006 = ''  #訂單單號
   LET l_xmdk045 = ''  #多角性質
   SELECT xmdk005,xmdk006,xmdk045
     INTO l_xmdk005,l_xmdk006,l_xmdk045
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   
   #非統銷統收不產生
   IF l_xmdk045 <> '3' THEN
      RETURN r_success,r_xmdkdocno
   END IF
   
   #來源訂單號
   IF cl_null(l_xmdk006) THEN
      OPEN s_aic_carry_produce_packing_cs
      FETCH FIRST s_aic_carry_produce_packing_cs INTO l_xmdk006
      IF cl_null(l_xmdk006) THEN
         INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axm-00707'   #"多角性質"為"3.統銷統收"時，來源訂單不可為空！
            LET g_errparam.extend = p_xmdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
         LET r_success = FALSE
         RETURN r_success,r_xmdkdocno
      END IF
   END IF

   LET l_xmdasite = ''
   SELECT xmdasite
     INTO l_xmdasite
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmdadocno = l_xmdk006

   #抓來源訂單的下站單別
   CALL s_aooi210_get_doc(l_xmdasite,'','2',l_xmdk006,'axmt540','axm-00705') RETURNING r_success,l_slip
   IF NOT r_success THEN
      RETURN r_success,r_xmdkdocno
   END IF

   INITIALIZE g_xmdk.* TO NULL
   SELECT *
     INTO g_xmdk.*
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_xmdkdocno
   
   LET g_xmdk.xmdkent = g_enterprise
   LET g_xmdk.xmdksite = l_xmdasite
   LET g_xmdk.xmdkdocdt = g_today
   LET g_xmdk.xmdk001 = g_today  #扣帳日期
   LET g_xmdk.xmdk002 = '1'      #出貨性質
   LET g_xmdk.xmdkownid = g_user
   LET g_xmdk.xmdkowndp = g_dept
   LET g_xmdk.xmdkcrtid = g_user
   LET g_xmdk.xmdkcrtdp = g_dept
   LET g_xmdk.xmdkcrtdt = cl_get_current()
   LET g_xmdk.xmdkmodid = ''
   LET g_xmdk.xmdkmoddt = ''
   LET g_xmdk.xmdkcnfid = ''
   LET g_xmdk.xmdkcnfdt = ''
   LET g_xmdk.xmdkpstid = ''
   LET g_xmdk.xmdkpstdt = ''
   LET g_xmdk.xmdkstus = 'N'
   
   LET g_xmdk.xmdk035 = p_xmdkdocno    #多角序號存放該出貨單單號
   
   #取匯率
   CALL s_aic_carry_exchange(g_xmdk.xmdk042,g_xmdk.xmdksite,g_xmdk.xmdkdocdt,g_xmdk.xmdk016,'','1')
   RETURNING r_success,g_xmdk.xmdk017
   IF NOT r_success THEN
      RETURN r_success,r_xmdkdocno
   END IF
   
   #自動產生單號
   CALL s_aooi200_gen_docno(g_xmdk.xmdksite,l_slip,g_xmdk.xmdkdocdt,'axmt540')
   RETURNING r_success,g_xmdk.xmdkdocno
   IF NOT r_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00003'
      LET g_errparam.extend = g_xmdk.xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
    
      RETURN r_success,r_xmdkdocno
   END IF
   
   LET r_xmdkdocno = g_xmdk.xmdkdocno
   
   INSERT INTO xmdk_t VALUES g_xmdk.*
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "INSERT:xmdk_t" 
      LET g_errparam.code = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
 
      LET r_success = FALSE
      RETURN r_success,r_xmdkdocno
   END IF
      
   #SELECT FROM xmdl_t
   LET g_sql = " SELECT *",
               "   FROM xmdl_t",
               "  WHERE xmdlent = ",g_enterprise,
               "    AND xmdldocno = '",p_xmdkdocno,"'",
               "  ORDER BY xmdlseq"
   PREPARE s_aic_carry_produce_xmdl_pre FROM g_sql
   DECLARE s_aic_carry_produce_xmdl_cs CURSOR WITH HOLD FOR s_aic_carry_produce_xmdl_pre
   
   #SELECT FROM xmdm_t
   LET g_sql = "SELECT * ",
               "  FROM xmdm_t",
               " WHERE xmdment = ",g_enterprise,
               "   AND xmdmdocno = '",p_xmdkdocno,"'",
               "   AND xmdmseq = ?"
   PREPARE s_aic_carry_produce_xmdm_pre FROM g_sql
   DECLARE s_aic_carry_produce_xmdm_cs CURSOR WITH HOLD FOR s_aic_carry_produce_xmdm_pre
      
   INITIALIZE g_xmdl.* TO NULL
   FOREACH s_aic_carry_produce_xmdl_cs INTO g_xmdl.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:s_aic_carry_produce_xmdl_cs"
         LET g_errparam.popup = TRUE
         CALL cl_err()           
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET g_xmdl.xmdlent = g_xmdk.xmdkent
      LET g_xmdl.xmdlsite = g_xmdk.xmdksite
      LET g_xmdl.xmdldocno = g_xmdk.xmdkdocno
      
      LET g_xmdl.xmdl035 = 0     #已簽收量
      LET g_xmdl.xmdl036 = 0     #已簽退量
      LET g_xmdl.xmdl037 = 0     #已銷退量
      LET g_xmdl.xmdl038 = 0     #主帳套已立帳數量
      LET g_xmdl.xmdl039 = 0     #帳套二已立帳數量
      LET g_xmdl.xmdl040 = 0     #帳套三已立帳數量
      LET g_xmdl.xmdl047 = 0     #已開發票數量
      LET g_xmdl.xmdl053 = 0     #主帳套暫估數量
      LET g_xmdl.xmdl054 = 0     #帳套二暫估數量
      LET g_xmdl.xmdl055 = 0     #帳套三暫估數量
      LET g_xmdl.xmdl081 = 0     #簽退數量
      LET g_xmdl.xmdl082 = 0     #簽退參考數量
      LET g_xmdl.xmdl083 = 0     #簽退計價數量
      
      #料件預設庫位、預設儲位
      INITIALIZE l_imaf.* TO NULL
      CALL s_aic_carry_sel_imaf091_imaf092(g_xmdl.xmdlsite,g_xmdl.xmdl008)
      RETURNING l_imaf.imaf091,l_imaf.imaf092

      #庫位
      IF cl_null(l_imaf.imaf091) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aim-00245'   #營運據點%1料件編號%2無預設之庫位、儲位！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_xmdl.xmdlsite
         LET g_errparam.replace[2] = g_xmdl.xmdl008
         
         CALL cl_err()           
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #儲位
      IF cl_null(l_imaf.imaf092) THEN
         LET l_imaf.imaf092 = ' '
      END IF
      
      IF g_xmdl.xmdl013 <> 'Y' THEN   #非多庫儲批
         #庫位、儲位替換成料件預設庫位、儲位
         LET g_xmdl.xmdl014 = l_imaf.imaf091    #庫位
         LET g_xmdl.xmdl015 = l_imaf.imaf092    #儲位
         LET g_xmdl.xmdl052 = ' '  #庫存管理特徵
      END IF

      #取得未稅金額、稅額、含稅金額
      CALL s_aic_carry_get_amount(g_xmdl.xmdlsite,g_xmdl.xmdldocno,g_xmdl.xmdlseq,g_xmdk.xmdk016,g_xmdl.xmdl022,g_xmdl.xmdl024,g_xmdl.xmdl025)
      RETURNING r_success,g_xmdl.xmdl027,g_xmdl.xmdl029,g_xmdl.xmdl028
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      INSERT INTO xmdl_t VALUES g_xmdl.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INSERT:xmdl_t" 
         LET g_errparam.code = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      INITIALIZE g_xmdm.* TO NULL          
      OPEN s_aic_carry_produce_xmdm_cs USING g_xmdl.xmdlseq
      FOREACH s_aic_carry_produce_xmdm_cs INTO g_xmdm.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:s_aic_carry_produce_xmdm_cs"
            LET g_errparam.popup = TRUE
            CALL cl_err()           
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      
         LET g_xmdm.xmdment = g_xmdl.xmdlent
         LET g_xmdm.xmdmsite = g_xmdl.xmdlsite
         LET g_xmdm.xmdmdocno = g_xmdl.xmdldocno
         LET g_xmdm.xmdm005 = l_imaf.imaf091    #庫位
         LET g_xmdm.xmdm006 = l_imaf.imaf092    #儲位
         LET g_xmdm.xmdm012 = 0   #已簽收數量
         LET g_xmdm.xmdm013 = 0   #已簽退數量
         LET g_xmdm.xmdm014 = 0   #已銷退數量
         LET g_xmdm.xmdm031 = 0   #簽退數量
         LET g_xmdm.xmdm032 = 0   #簽退參考數量
         LET g_xmdm.xmdm033 = ' ' #庫存管理特徵
         LET g_xmdm.xmdm034 = 0   #160428-00008#1 add   備置量
         LET g_xmdm.xmdm035 = 0  #160428-00008#1 add   在揀量
         INSERT INTO xmdm_t VALUES g_xmdm.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "INSERT:xmdm_t" 
            LET g_errparam.code = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
 
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #150917-00001#4 151113 earl add s
         IF NOT s_aic_carry_inao_ins(p_xmdkdocno,g_xmdm.xmdmseq,g_xmdm.xmdmseq1,g_xmdm.xmdmsite,g_xmdm.xmdmdocno,
                                     g_xmdm.xmdm033,g_xmdm.xmdm005,g_xmdm.xmdm006,'-1','1') THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #150917-00001#4 151113 earl add e
         
      END FOREACH
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
            
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success,r_xmdkdocno
   END IF
   
   #重新計算整單的未稅、含稅總金額
   INITIALIZE l_xrcd.* TO NULL
   CALL s_aic_carry_return_amount(g_xmdk.xmdkdocno)
   RETURNING l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105
   
   UPDATE xmdk_t SET xmdk051 = l_xrcd.xrcd103,
                     xmdk052 = l_xrcd.xrcd105,
                     xmdk053 = l_xrcd.xrcd104
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = g_xmdk.xmdkdocno

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'UPDATE xmdk_t'
      LET g_errparam.extend = g_xmdk.xmdkdocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      
      RETURN r_success,r_xmdkdocno
   END IF
   
   CALL s_aic_carry_ins_ooff('axmt540',r_xmdkdocno,'axmt540',p_xmdkdocno) RETURNING r_success #170817-00043#5 add  
 
   #出貨單確認、過帳
   CALL s_aic_carry_xmdk_conf(g_xmdk.xmdksite,g_xmdk.xmdkdocno,g_xmdk.xmdk000,'S') RETURNING r_success
   
   RETURN r_success,r_xmdkdocno
END FUNCTION

################################################################################
# Descriptions...: 訂單變更
# Memo...........: 請依照順序CALL
#                  CALL s_aic_carry_create_temp_table_xmd()
#                  CALL s_aic_carry_create_temp_table_order()
#                  CALL s_tax_recount_tmp()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_mod_so(p_xmeedocno,p_xmee900,p_upd_all)
#                  CALL s_transaction_end(Y,0)
#                  CALL s_aic_carry_drop_temp_table_xmd()
#                  CALL s_aic_carry_drop_temp_table_order()
# Usage..........: CALL s_aic_carry_mod_so(p_xmeedocno,p_xmee900,p_upd_all)
#                  RETURNING r_success
# Input parameter: p_xmeedocno   #訂單變更單號
#                : p_xmee900     #變更序
#                : p_upd_all     #是否一併更新"出貨/收貨"單
# Return code....: r_success     #執行結果
#                : 
# Date & Author..: 150903 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_mod_so(p_xmeedocno,p_xmee900,p_upd_all)
   DEFINE p_xmeedocno         LIKE xmee_t.xmeedocno  #訂單變更單號
   DEFINE p_xmee900           LIKE xmee_t.xmee900    #變更序
   DEFINE p_upd_all           LIKE type_t.chr1       #是否一併更新"出貨/收貨"單
   DEFINE r_success           LIKE type_t.num5
   
   DEFINE l_xmda050           LIKE xmda_t.xmda050
   DEFINE l_xmda031           LIKE xmda_t.xmda031
   DEFINE l_icab002           LIKE icab_t.icab002
   DEFINE l_icab003           LIKE icab_t.icab003
   DEFINE l_icab002_next      LIKE icab_t.icab002
   DEFINE l_icab003_next      LIKE icab_t.icab003
   DEFINE l_pmdldocno         LIKE pmdl_t.pmdldocno
   DEFINE l_xmdadocno         LIKE xmda_t.xmdadocno
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
      
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
  #170816-00007#31 -S mark
  #IF cl_null(p_xmeedocno) OR
  #   cl_null(p_xmee900) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_mod_so"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_xmeedocno) THEN
      CALL s_azzi902_get_gzzd("axmr510","lbl_xmeedocno") RETURNING g_colname_1,g_comment_1   #訂單變更單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_xmee900) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("afat511","lbl_fabp008") RETURNING g_colname_1,g_comment_1   #變更序
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
      RETURN r_success
   END IF
  #170816-00007#31 -E add
   
   IF cl_null(p_upd_all) THEN
      LET p_upd_all = 'N'
   END IF
   
   #SELECT訂單資料
   LET l_xmda050 = ''  #多角流程代碼
   LET l_xmda031 = ''  #多角序號
   SELECT xmda050,xmda031
     INTO l_xmda050,l_xmda031
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmdadocno = p_xmeedocno

   #當站多角貿易營運據點
   LET g_sql = "SELECT icab002,icab003",
               "  FROM icab_t",
               " WHERE icabent = '",g_enterprise,"'",
               "   AND icab001 = '",l_xmda050,"'",
               " ORDER BY icab002"
   PREPARE s_aic_carry_icab_pre1 FROM g_sql
   DECLARE s_aic_carry_icab_cs1 CURSOR FOR s_aic_carry_icab_pre1
   
   #下站多角貿易營運據點
   LET g_sql = "SELECT icab002,icab003",
               "  FROM icab_t",
               " WHERE icabent = '",g_enterprise,"'",
               "   AND icab001 = '",l_xmda050,"'",
               "   AND icab002 > ?",
               " ORDER BY icab002"
   PREPARE s_aic_carry_icab_next_pre1 FROM g_sql
   DECLARE s_aic_carry_icab_next_cs1 SCROLL CURSOR FOR s_aic_carry_icab_next_pre1
   
   LET l_icab002 = ''
   LET l_icab003 = ''
   LET l_xmdadocno = p_xmeedocno
   LET l_pmdldocno = ''
   FOREACH s_aic_carry_icab_cs1 INTO l_icab002,l_icab003
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH s_aic_carry_icab_cs1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()         
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
            
      #取下站
      LET l_icab002_next = ''
      LET l_icab003_next = ''
      OPEN s_aic_carry_icab_next_cs1 USING l_icab002
      FETCH FIRST s_aic_carry_icab_next_cs1 INTO l_icab002_next,l_icab003_next
          
      CALL s_aic_carry_get_ica(l_xmda050,l_icab002)   #171110-00029#1 add
      
      #若為第0站
      IF l_icab002 = 0 THEN
         #UPDATE採購單
         CALL s_aic_carry_tri_po_upd(l_xmdadocno,'',l_xmda031,l_icab003,p_xmeedocno,l_icab003_next)
         RETURNING r_success,l_pmdldocno
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         IF p_upd_all = 'Y' THEN
            #收貨/入庫的UPDATE
            CALL s_apmt510_upd(l_pmdldocno,p_xmeedocno,p_xmee900,'2') RETURNING r_success
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
         END IF
         
         CONTINUE FOREACH
      ELSE
         IF NOT cl_null(l_icab002_next) THEN #中間站
            #UPDATE訂單
            CALL s_aic_carry_tri_so_upd(l_pmdldocno,p_xmeedocno,l_xmda031,l_icab003)
            RETURNING r_success,l_xmdadocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            #UPDATE採購單
            CALL s_aic_carry_tri_po_upd(l_xmdadocno,'',l_xmda031,l_icab003,p_xmeedocno,l_icab003_next)
            RETURNING r_success,l_pmdldocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            IF p_upd_all = 'Y' THEN
               #出通/出貨/簽收/Invoice的UPDATE
               CALL s_axmt510_upd(l_xmdadocno,p_xmeedocno,p_xmee900,'1') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
               
               #收貨/入庫的UPDATE
               CALL s_apmt510_upd(l_pmdldocno,p_xmeedocno,p_xmee900,'2') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
            END IF
            
         ELSE #最終站
            #UPDATE訂單
            #C20180831-07783--SAMOA抛KS采用更新下站订单的形式（单身也更新，不重产)---S
            IF g_site = 'SAMOA' THEN
               CALL s_aic_carry_tri_so_upd2(l_pmdldocno,p_xmeedocno,l_xmda031,l_icab003,p_xmee900)
               RETURNING r_success,l_xmdadocno
            ELSE
            #C20180831-07783--SAMOA抛KS采用更新下站订单的形式（单身也更新，不重产)---E                
               CALL s_aic_carry_tri_so_upd(l_pmdldocno,p_xmeedocno,l_xmda031,l_icab003)
               RETURNING r_success,l_xmdadocno      
            END IF   #C20180831-07783--SAMOA抛KS采用更新下站订单的形式（单身也更新，不重产)---ADD            
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
     
            
            IF p_upd_all = 'Y' THEN
               #出通/出貨/簽收/Invoice的UPDATE
               CALL s_axmt510_upd(l_xmdadocno,p_xmeedocno,p_xmee900,'1') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
            END IF
         END IF
      END IF
      
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 採購單變更
# Memo...........: 請依照順序CALL
#                  CALL s_aic_carry_create_temp_table_xmd()
#                  CALL s_aic_carry_create_temp_table_order()
#                  CALL s_tax_recount_tmp()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_mod_po(p_pmeedocno,p_pmee900,p_upd_all)
#                  CALL s_transaction_end(Y,0)
#                  CALL s_aic_carry_drop_temp_table_xmd()
#                  CALL s_aic_carry_drop_temp_table_order()
# Usage..........: CALL s_aic_carry_mod_po(p_pmeedocno,p_pmee900,p_upd_all)
#                  RETURNING r_success
# Input parameter: p_pmeedocno   #採購變更單號
#                : p_pmee900     #變更序
#                : p_upd_all     #是否一併更新"出貨/收貨"單
# Return code....: r_success     #執行結果
#                : 
# Date & Author..: 150903 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_mod_po(p_pmeedocno,p_pmee900,p_upd_all)
   DEFINE p_pmeedocno         LIKE pmee_t.pmeedocno
   DEFINE p_pmee900           LIKE pmee_t.pmee900
   DEFINE p_upd_all           LIKE type_t.chr1
   DEFINE r_success           LIKE type_t.num5
                              
   DEFINE l_pmdl006           LIKE pmdl_t.pmdl006 
   DEFINE l_pmdl051           LIKE pmdl_t.pmdl051
   DEFINE l_pmdl031           LIKE pmdl_t.pmdl031   
   DEFINE l_icab002           LIKE icab_t.icab002
   DEFINE l_icab003           LIKE icab_t.icab003
   DEFINE l_icab002_next      LIKE icab_t.icab002
   DEFINE l_icab003_next      LIKE icab_t.icab003
   DEFINE l_pmdldocno         LIKE pmdl_t.pmdldocno
   DEFINE l_xmdadocno         LIKE xmda_t.xmdadocno
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
      
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF   

  #170816-00007#31 -S mark
  #IF cl_null(p_pmeedocno) OR
  #   cl_null(p_pmee900) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_mod_po"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_pmeedocno) THEN
      CALL s_azzi902_get_gzzd("apmr510","lbl_pmeedocno") RETURNING g_colname_1,g_comment_1   #採購變更單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_pmee900) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("afat511","lbl_fabp008") RETURNING g_colname_1,g_comment_1   #變更序
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
      RETURN r_success
   END IF
  #170816-00007#31 -E add
   
   IF cl_null(p_upd_all) THEN
      LET p_upd_all = 'N'
   END IF   

   #SELECT採購單資料
   LET l_pmdl006 = ''  #多角性質
   LET l_pmdl051 = ''  #多角流程代碼
   LET l_pmdl031 = ''  #多角序號
   SELECT pmdl006,pmdl051,pmdl031
     INTO l_pmdl006,l_pmdl051,l_pmdl031
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = p_pmeedocno

   #當站多角貿易營運據點
   LET g_sql = "SELECT icab002,icab003",
               "  FROM icab_t",
               " WHERE icabent = '",g_enterprise,"'",
               "   AND icab001 = '",l_pmdl051,"'",
               " ORDER BY icab002"
   PREPARE s_aic_carry_icab_pre2 FROM g_sql
   DECLARE s_aic_carry_icab_cs2 CURSOR FOR s_aic_carry_icab_pre2

   #下站多角貿易營運據點
   LET g_sql = "SELECT icab002,icab003",
               "  FROM icab_t",
               " WHERE icabent = '",g_enterprise,"'",
               "   AND icab001 = '",l_pmdl051,"'",
               "   AND icab002 > ?",
               " ORDER BY icab002"
   PREPARE s_aic_carry_icab_next_pre2 FROM g_sql
   DECLARE s_aic_carry_icab_next_cs2 SCROLL CURSOR FOR s_aic_carry_icab_next_pre2

   LET l_icab002 = ''
   LET l_icab003 = ''
   LET l_xmdadocno = ''
   LET l_pmdldocno = p_pmeedocno
   FOREACH s_aic_carry_icab_cs2 INTO l_icab002,l_icab003
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH s_aic_carry_icab_cs2"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #取下站
      LET l_icab002_next = ''
      LET l_icab003_next = ''
      OPEN s_aic_carry_icab_next_cs2 USING l_icab002
      FETCH FIRST s_aic_carry_icab_next_cs2 INTO l_icab002_next,l_icab003_next
      
      #若為第0站
      IF l_icab002 = 0 THEN         
         CONTINUE FOREACH
      ELSE
         IF NOT cl_null(l_icab002_next) THEN #中間站
            #UPDATE訂單
            CALL s_aic_carry_tri_so_upd(l_pmdldocno,'',l_pmdl031,l_icab003)
            RETURNING r_success,l_xmdadocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            #UPDATE採購單
            CALL s_aic_carry_tri_po_upd(l_xmdadocno,p_pmeedocno,l_pmdl031,l_icab003,'',l_icab003_next)
            RETURNING r_success,l_pmdldocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            IF p_upd_all = 'Y' THEN
               #出通/出貨/簽收/Invoice的UPDATE
               CALL s_axmt510_upd(l_xmdadocno,p_pmeedocno,p_pmee900,'2') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
               
               #收貨/入庫的UPDATE
               CALL s_apmt510_upd(l_pmdldocno,p_pmeedocno,p_pmee900,'1') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
            END IF
                     
         ELSE #最終站
            #UPDATE訂單
            CALL s_aic_carry_tri_so_upd(l_pmdldocno,'',l_pmdl031,l_icab003)
            RETURNING r_success,l_xmdadocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            #代採購指定最終供應商
            IF l_pmdl006 = '3' THEN
               #UPDATE最終採購單
               CALL s_aic_carry_last_po_upd(l_xmdadocno,p_pmeedocno,l_pmdl031,l_icab003)
               RETURNING r_success,l_pmdldocno
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
            END IF

            IF p_upd_all = 'Y' THEN
               #出通/出貨/簽收/Invoice的UPDATE
               CALL s_axmt510_upd(l_xmdadocno,p_pmeedocno,p_pmee900,'2') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
               
               #代採購指定最終供應商
               IF l_pmdl006 = '3' THEN
                  #收貨/入庫的UPDATE
                  CALL s_apmt510_upd(l_pmdldocno,p_pmeedocno,p_pmee900,'1') RETURNING r_success
                  IF NOT r_success THEN
                     EXIT FOREACH
                  END IF
               END IF
            END IF
         END IF
      END IF
      
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 訂單變更upd
# Memo...........:
# Usage..........: CALL s_aic_carry_tri_so_upd(p_pmdldocno,p_firstxmdadocno,p_xmda031,p_xmdasite)
#                  RETURNING r_success
# Input parameter: p_pmdldocno       來源採購單號
#                : p_firstxmdadocno  初始訂單單號
#                : p_xmda031         多角序號
#                : p_xmdasite        營運據點
# Return code....: r_success         執行結果
#                : r_xmdadocno       訂單單號
# Date & Author..: 150826 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_tri_so_upd(p_pmdldocno,p_firstxmdadocno,p_xmda031,p_xmdasite)
   DEFINE p_pmdldocno        LIKE pmdl_t.pmdldocno   #來源採購單號
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno   #初始訂單單號(可Null)
   DEFINE p_xmda031          LIKE xmda_t.xmda031     #多角序號
   DEFINE p_xmdasite         LIKE xmda_t.xmdasite    #營運據點
   DEFINE r_success          LIKE type_t.num5        #執行結果
   DEFINE r_xmdadocno        LIKE xmda_t.xmdadocno   #產生之訂單單號
   #170824-00002#3 --s add
   DEFINE l_pmdl020          LIKE pmdl_t.pmdl020
   DEFINE l_pmdl025          LIKE pmdl_t.pmdl025
   DEFINE l_pmdl026          LIKE pmdl_t.pmdl026
   DEFINE l_xmda005_o        LIKE xmda_t.xmda005    
   #170824-00002#3 --e add
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_xmdadocno = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_pmdldocno) OR
  #   cl_null(p_xmda031) OR
  #   cl_null(p_xmdasite) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_tri_so_upd"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_xmdadocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_pmdldocno) THEN
      CALL s_azzi902_get_gzzd("aicp200","lbl_pmdldocno") RETURNING g_colname_1,g_comment_1   #來源採購單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_xmda031) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq100","lbl_xmda031") RETURNING g_colname_1,g_comment_1   #多角序號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_xmdasite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #營運據點
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
      RETURN r_success,r_xmdadocno
   END IF
  #170816-00007#31 -E add

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF

   #塞xmda_t
   INITIALIZE g_xmda.* TO NULL
   
   #SELECT 原始訂單資料
   SELECT * INTO g_xmda.*
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmda031 = p_xmda031
      AND xmdasite = p_xmdasite
      AND xmdastus <> 'X'
   
   LET r_xmdadocno = g_xmda.xmdadocno
   
   #SELECT 初始訂單資料
   IF NOT cl_null(p_firstxmdadocno) THEN
     #170824-00002#3 --s mark
     #SELECT xmda005,xmda033,xmda044        
     #  INTO g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044
     #170824-00002#3 --e mark
     #170824-00002#3 --s add
     SELECT xmda005,xmda033,xmda044,
            xmda027,xmda025,xmda026,
            xmda020,xmda037,xmda038,xmda036
       INTO g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044,
            g_xmda.xmda027,g_xmda.xmda025,g_xmda.xmda026,
            g_xmda.xmda020,g_xmda.xmda037,g_xmda.xmda038,g_xmda.xmda036
     #170824-00002#3 --e add 
        FROM xmda_t
       WHERE xmdaent = g_enterprise
         AND xmdadocno = p_firstxmdadocno
   END IF
   
   #SELECT來源採購單資料
   SELECT pmdldocdt,pmdl001,
          pmdl015,pmdl032
         ,pmdl020,pmdl025,pmdl026 #170824-00002#3 add
     INTO g_xmda.xmdadocdt,g_xmda.xmda001,
          g_xmda.xmda015,g_xmda.xmda034
         ,l_pmdl020,l_pmdl025,l_pmdl026 #170824-00002#3 add
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = p_pmdldocno
   
   #170824-00002#3 --s add
   #沒有初始訂單，表示是代採買，則抓來源採購單的欄位
   IF cl_null(p_firstxmdadocno) THEN
      LET g_xmda.xmda020 = l_pmdl020
      LET g_xmda.xmda025 = l_pmdl025
      LET g_xmda.xmda026 = l_pmdl026
   END IF
   #170824-00002#3 --e add
   
   LET g_xmda.xmdamodid = g_user
   LET g_xmda.xmdamoddt = cl_get_current()
   
   #取匯率
   CALL s_aic_carry_exchange(g_xmda.xmda048,g_xmda.xmdasite,g_xmda.xmdadocdt,g_xmda.xmda015,'','1')
   RETURNING r_success,g_xmda.xmda016
   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF
   #C20180830-07783--先取单别设置的默认字段---S
   LET l_xmda005_o = g_xmda.xmda005
   LET g_xmda.xmda005 = s_aooi200_get_doc_default(g_icab.icab003,'1',g_icac.icac003,'xmda005',g_xmda.xmda005) 
   IF cl_null(g_xmda.xmda005) THEN
      LET g_xmda.xmda005 = l_xmda005_o  
   END IF
   #C20180830-07783--先取单别设置的默认字段---E  
   UPDATE xmda_t
      SET (xmda005,xmda033,xmda044,
           xmdadocdt,xmda001,
           xmda015,xmda034,
           xmdamodid,xmdamoddt,
           #170824-00002#3 --s add
           #客戶連絡人、收貨地址、帳款地址、
           #運送方式、起運點、目的地、送貨供應商
           xmda027,xmda025,xmda026,
           xmda020,xmda037,xmda038,xmda036,
           #170824-00002#3 --e add           
           xmda016)
        = (g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044,
           g_xmda.xmdadocdt,g_xmda.xmda001,
           g_xmda.xmda015,g_xmda.xmda034,
           g_xmda.xmdamodid,g_xmda.xmdamoddt,
           #170824-00002#3 --s add
           g_xmda.xmda027,g_xmda.xmda025,g_xmda.xmda026,
           g_xmda.xmda020,g_xmda.xmda037,g_xmda.xmda038,g_xmda.xmda036,
           #170824-00002#3 --e add    
           g_xmda.xmda016)
     WHERE xmdaent = g_enterprise
       AND xmdadocno = g_xmda.xmdadocno
       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "UPDATE xmda_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
         
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF

   #INSERT 單身
  #CALL s_aic_carry_body_so(p_pmdldocno,p_firstxmdadocno) RETURNING r_success  #170103-00002#1 mark
   CALL s_aic_carry_body_so(p_pmdldocno,p_firstxmdadocno) RETURNING r_success  #170103-00002#1 add

   RETURN r_success,r_xmdadocno
END FUNCTION

################################################################################
# Descriptions...: 採購單變更upd
# Memo...........:
# Usage..........: CALL s_aic_carry_tri_po_upd(p_xmdadocno,p_firstpmdldocno,p_pmdl031,p_pmdlsite,p_firstxmdadocno,p_nextsite)
#                  RETURNING r_success
# Input parameter: p_xmdadocno       #來源訂單單號
#                : p_firstpmdldocno  #初始採購單號
#                : p_pmdl031         #多角序號
#                : p_pmdlsite        #營運據點
#                : p_firstxmdadocno  #初始訂單單號
#                : p_nextsite        #下站營運據點
# Return code....: r_success         #執行結果
#                : r_pmdldocno       #採購單號
# Date & Author..: 150826 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_tri_po_upd(p_xmdadocno,p_firstpmdldocno,p_pmdl031,p_pmdlsite,p_firstxmdadocno,p_nextsite)
   DEFINE p_xmdadocno        LIKE xmda_t.xmdadocno   #來源訂單單號
   DEFINE p_firstpmdldocno   LIKE pmdl_t.pmdldocno   #初始採購單號
   DEFINE p_pmdl031          LIKE pmdl_t.pmdl031     #多角序號
   DEFINE p_pmdlsite         LIKE pmdl_t.pmdlsite    #營運據點
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno   #初始訂單單號
   DEFINE p_nextsite         LIKE icab_t.icabsite    #下站營運據點
   DEFINE r_success          LIKE type_t.num5        #執行結果
   DEFINE r_pmdldocno        LIKE sfaa_t.sfaadocno   #產生之採購單單號

   WHENEVER ERROR CONTINUE   
   
   LET r_success = TRUE
   LET r_pmdldocno = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_xmdadocno) OR
  #   cl_null(p_pmdl031) OR
  #   cl_null(p_pmdlsite) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_tri_po_upd"
  #   LET g_errparam.code   = "sub-268"     #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdldocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_xmdadocno) THEN
      LET g_colname_1 = cl_getmsg("sub-01491",g_dlang)   #來源訂單單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_pmdl031) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq100","lbl_xmda031") RETURNING g_colname_1,g_comment_1   #多角序號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_pmdlsite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #營運據點
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
      RETURN r_success,r_pmdldocno
   END IF
  #170816-00007#31 -E add
   
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #塞pmdl_t
   INITIALIZE g_pmdl.* TO NULL
   
   #SELECT 原始採購單資料
   SELECT * INTO g_pmdl.*
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdl031 = p_pmdl031
      AND pmdlsite = p_pmdlsite
      AND pmdlstus <> 'X'

   LET r_pmdldocno = g_pmdl.pmdldocno

   #SELECT 來源訂單資料
   SELECT xmdadocdt,xmda001,
          xmda015,xmda034
         ,xmda020,xmda025,xmda026 #170824-00002#3 add
     INTO g_pmdl.pmdldocdt,g_pmdl.pmdl001,
          g_pmdl.pmdl015,g_pmdl.pmdl032
         ,g_pmdl.pmdl020,g_pmdl.pmdl025,g_pmdl.pmdl026 #170824-00002#3 add
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmdadocno = p_xmdadocno
   
   LET g_pmdl.pmdlmodid = g_user
   LET g_pmdl.pmdlmoddt = cl_get_current()
   
   #170414-00041#1--add--begin-----
   #採購幣別icag008(若無預設則延續來源)
    CALL s_aic_carry_get_tri_pm(g_pmdl.pmdl051,g_pmdl.pmdlsite,g_pmdl.pmdldocdt)
    RETURNING r_success
    IF r_success AND NOT cl_null(g_icag.icag008 ) THEN
       LET g_pmdl.pmdl015 = g_icag.icag008
    END IF
   #170414-00041#1--add--end-----
   #取匯率
   CALL s_aic_carry_exchange(g_pmdl.pmdl054,g_pmdl.pmdlsite,g_pmdl.pmdldocdt,g_pmdl.pmdl015,'','2')
   RETURNING r_success,g_pmdl.pmdl016
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   UPDATE pmdl_t 
      SET (pmdldocdt,pmdl001,
           pmdl015,pmdl032,
           pmdlmodid,pmdlmoddt,
           pmdl020,pmdl025,pmdl026, #170824-00002#3 add 運送方式、收貨地址、帳款地址
           pmdl016)
        = (g_pmdl.pmdldocdt,g_pmdl.pmdl001,
           g_pmdl.pmdl015,g_pmdl.pmdl032,
           g_pmdl.pmdlmodid,g_pmdl.pmdlmoddt,
           g_pmdl.pmdl020,g_pmdl.pmdl025,g_pmdl.pmdl026, #170824-00002#3 add
           g_pmdl.pmdl016)
     WHERE pmdlent = g_enterprise
       AND pmdldocno = g_pmdl.pmdldocno

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "UPDATE pmdl_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF
   
   #INSERT 單身
   CALL s_aic_carry_body_po(p_xmdadocno,'1',p_firstpmdldocno,p_firstxmdadocno,p_nextsite) RETURNING r_success

   RETURN r_success,r_pmdldocno
END FUNCTION

################################################################################
# Descriptions...: INSERT 訂單單身
# Memo...........:
# Usage..........: CALL s_aic_carry_body_so(p_pmdldocno,p_firstxmdadocno)
#                  RETURNING r_success
# Input parameter: p_pmdldocno        來源採購單號
#                : p_firstxmdadocno   初始訂單單號
#                : 
# Return code....: r_success     執行結果
#                : 
# Date & Author..: 150824 By earl
# Modify.........: #170103-00002#1 增加傳入參數(p_firstxmdadocno)
################################################################################
PUBLIC FUNCTION s_aic_carry_body_so(p_pmdldocno,p_firstxmdadocno)
   DEFINE p_pmdldocno        LIKE pmdl_t.pmdldocno
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno   #170103-00002#1
   DEFINE r_success          LIKE type_t.num5   
   DEFINE l_pmdn   RECORD LIKE pmdn_t.*
   DEFINE l_pmdo   RECORD LIKE pmdo_t.*
   DEFINE l_pmdq   RECORD LIKE pmdq_t.*
   DEFINE l_pmdo015          LIKE pmdo_t.pmdo015 #170105-00050#2-add
   DEFINE l_pmao004          LIKE pmao_t.pmao004 #cws 2017.12.29
   DEFINE l_icaduc006        LIKE icaduc_t.icaduc006 #add by jinfeng 180313 
   DEFINE l_pmdl005          LIKE pmdl_t.pmdl005    #C180710-09421#3---add   #采购单性质     
   DEFINE l_pmdp003          LIKE pmdp_t.pmdp003    #C180824-07015#1 add
   DEFINE l_pmdp004          LIKE pmdp_t.pmdp004    #C180824-07015#1 add
   DEFINE l_pmdl006          LIKE pmdl_t.pmdl006    #C191119#1 add 多角性质
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET g_sql = "SELECT pmdnseq,pmdn001,pmdn002,pmdn004,pmdn005,",  #fcx-180328 add pmdn004,pmdn005
               "       pmdn006,pmdn007,pmdn008,pmdn009,pmdn010,",
               "       pmdn011,pmdn014,pmdn015,",
               "       pmdn019,pmdn020,pmdn021,pmdn022,pmdn024,", #160902-00008#1 add pmdn020、pmdn021
               "       pmdn025,pmdn026,",                         #170824-00001#1 add
               "       pmdn027,pmdn028,pmdn029,pmdn030,",         #161107-00023#1 add pmdn027
               "       pmdn031,pmdn032,pmdn033,pmdn034,pmdn035,",
               "       pmdn036,pmdn037,pmdn038,pmdn039,",
               "       pmdn043,",
               "       pmdn046,pmdn047,pmdn048,",
               "       pmdn050,", #170221-00029#2-add
               "       pmdn053",
               "       ,pmdn060", #170105-00050#2-add
               "       ,pmdnud001",#add by cz 20180607 添加基板供应商字段 #remark by xianggy 180621
               "       ,pmdnud014",   #add by hehw 200915  添加WEIGHT字段
               "  FROM pmdn_t",
               " WHERE pmdnent = ",g_enterprise,
               "   AND pmdndocno = '",p_pmdldocno,"'"
   PREPARE s_aic_carry_pmdn_pre1 FROM g_sql
   DECLARE s_aic_carry_pmdn_cs1 CURSOR FOR s_aic_carry_pmdn_pre1

   LET g_sql = "SELECT pmdoseq1,pmdoseq2,",
               "       pmdo001,pmdo002,pmdo003,pmdo004,pmdo005,",
               "       pmdo006,pmdo007,pmdo008,pmdo009,pmdo010,",
               "       pmdo011,pmdo013,",
               "       pmdo022,",
               "       pmdo028,pmdo029,pmdo030,",
               "       pmdo031,pmdo032,pmdo033,pmdo034",
               "  FROM pmdo_t",
               " WHERE pmdoent = ",g_enterprise,
               "   AND pmdodocno = '",p_pmdldocno,"'",
               "   AND pmdoseq =?"
   PREPARE s_aic_carry_pmdo_pre1 FROM g_sql
   DECLARE s_aic_carry_pmdo_cs1 CURSOR FOR s_aic_carry_pmdo_pre1

   LET g_sql = "SELECT pmdqseq2,",
               "       pmdq002,pmdq003,pmdq004,pmdq005,",
               "       pmdq006,pmdq007,pmdq008",
               "  FROM pmdq_t",
               " WHERE pmdqent = ",g_enterprise,
               "   AND pmdqdocno = '",p_pmdldocno,"'",
               "   AND pmdqseq =?"
   PREPARE s_aic_carry_pmdq_pre FROM g_sql
   DECLARE s_aic_carry_pmdq_cs CURSOR FOR s_aic_carry_pmdq_pre

   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_xmdc_temp",   #170206-00013#1 mark
               "  FROM s_aic_xmdc_temp",         #170206-00013#1 add
               " WHERE xmdcent = ",g_enterprise,
               "   AND xmdcdocno = '",g_xmda.xmdadocno,"'",
               "   AND xmdcseq = ?"
   PREPARE s_aic_carry_xmdc_temp_pre FROM g_sql

   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_xmdd_temp",   #170206-00013#1 mark
               "  FROM s_aic_xmdd_temp",         #170206-00013#1 add
               " WHERE xmddent = ",g_enterprise,
               "   AND xmdddocno = '",g_xmda.xmdadocno,"'",
               "   AND xmddseq = ?",
               "   AND xmddseq1 = ?",
               "   AND xmddseq2 = ?"
   PREPARE s_aic_carry_xmdd_temp_pre FROM g_sql
   
   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_xmdf_temp",   #170206-00013#1 mark
               "  FROM s_aic_xmdf_temp",         #170206-00013#1 add
               " WHERE xmdfent = ",g_enterprise,
               "   AND xmdfdocno = '",g_xmda.xmdadocno,"'",
               "   AND xmdfseq = ?",
               "   AND xmdfseq2 = ?"
   PREPARE s_aic_carry_xmdf_temp_pre FROM g_sql
   
  #170103-00002#1-s-add
   LET g_sql = " SELECT xmdc013 FROM xmdc_t ",
               "  WHERE xmdcent = ",g_enterprise,
               "    AND xmdcdocno = ? ",
               "    AND xmdcseq = ? " 
  PREPARE s_aic_carry_xmdc_pre2 FROM g_sql               
  #170103-00002#1-e-add

   #清空TEMP TABLE
   #170206-00013#1-(S)-mark
   #DELETE FROM s_aic_carry_xmdc_temp
   #DELETE FROM s_aic_carry_xmdd_temp
   #DELETE FROM s_aic_carry_xmdf_temp
   #170206-00013#1-(E)-mark
   #170206-00013#1-(S)-add
   DELETE FROM s_aic_xmdc_temp
   DELETE FROM s_aic_xmdd_temp
   DELETE FROM s_aic_xmdf_temp
   #170206-00013#1-(E)-add
   

   #將資料塞入temp table，並刪除原table資料
  #INSERT INTO s_aic_carry_xmdc_temp   #170206-00013#1 mark
   INSERT INTO s_aic_xmdc_temp         #170206-00013#1 add
   SELECT * FROM xmdc_t
    WHERE xmdcent = g_enterprise
      AND xmdcdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_xmdc_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #170105-00050#10-s-add
   #將預先的數量減回來
   IF NOT s_aic_carry_pre_so_upd('2',g_xmda.xmdasite,g_xmda.xmda031) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #170105-00050#10-e-add
   
   DELETE FROM xmdc_t
    WHERE xmdcent = g_enterprise
      AND xmdcdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM xmdc_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF
   
  #INSERT INTO s_aic_carry_xmdd_temp   #170206-00013#1 mark
   INSERT INTO s_aic_xmdd_temp         #170206-00013#1 add
   SELECT * FROM xmdd_t
    WHERE xmddent = g_enterprise
      AND xmdddocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_xmdd_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DELETE FROM xmdd_t
    WHERE xmddent = g_enterprise
      AND xmdddocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM xmdd_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF

  #INSERT INTO s_aic_carry_xmdf_temp   #170206-00013#1 mark
   INSERT INTO s_aic_xmdf_temp         #170206-00013#1 add
   SELECT * FROM xmdf_t
    WHERE xmdfent = g_enterprise
      AND xmdfdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_xmdf_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success
   END IF

   DELETE FROM xmdf_t
    WHERE xmdfent = g_enterprise
      AND xmdfdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM xmdf_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF

   FOREACH s_aic_carry_pmdn_cs1 INTO l_pmdn.pmdnseq,l_pmdn.pmdn001,l_pmdn.pmdn002,l_pmdn.pmdn004,l_pmdn.pmdn005,    #fcx-180328 add pmdn004,pmdn005
                                     l_pmdn.pmdn006,l_pmdn.pmdn007,l_pmdn.pmdn008,l_pmdn.pmdn009,l_pmdn.pmdn010,
                                     l_pmdn.pmdn011,l_pmdn.pmdn014,l_pmdn.pmdn015,
                                     l_pmdn.pmdn019,l_pmdn.pmdn020,l_pmdn.pmdn021,l_pmdn.pmdn022,l_pmdn.pmdn024,    #160902-00008#1 add pmdn020,pmdn021
                                     l_pmdn.pmdn025,l_pmdn.pmdn026,    #170824-00001#1 add
                                     l_pmdn.pmdn027,l_pmdn.pmdn028,l_pmdn.pmdn029,l_pmdn.pmdn030,                   #161107-00023#1 add pmdn027
                                     l_pmdn.pmdn031,l_pmdn.pmdn032,l_pmdn.pmdn033,l_pmdn.pmdn034,l_pmdn.pmdn035,
                                     l_pmdn.pmdn036,l_pmdn.pmdn037,l_pmdn.pmdn038,l_pmdn.pmdn039,
                                     l_pmdn.pmdn043,
                                     l_pmdn.pmdn046,l_pmdn.pmdn047,l_pmdn.pmdn048,
                                     l_pmdn.pmdn050, #170221-00029#2-add
                                     l_pmdn.pmdn053
                                    ,l_pmdn.pmdn060  #170105-00050#2-add
                                    ,l_pmdn.pmdnud001  #add by cz 20180607 #remark by xianggy 180621
                                    ,l_pmdn.pmdnud014   #add by hehw 200915
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_pmdn_cs1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #塞xmdc_t
      INITIALIZE g_xmdc.* TO NULL
      
      #先塞入原本資料(變更前的資料)
      EXECUTE s_aic_carry_xmdc_temp_pre USING l_pmdn.pmdnseq
      INTO g_xmdc.*
      
      LET g_xmdc.xmdcsite = g_xmda.xmdasite
      LET g_xmdc.xmdcdocno = g_xmda.xmdadocno
      LET g_xmdc.xmdcseq = l_pmdn.pmdnseq
     #LET g_xmdc.xmdc001 = l_pmdn.pmdn001  #cws 2017.12.28
        
      SELECT pmao004 INTO l_pmao004  FROM pmao_t,pmdl_t
       WHERE pmaoent = g_enterprise  AND pmao001 = pmdl004 AND pmao002 = l_pmdn.pmdn001 AND pmdldocno = p_pmdldocno AND pmao000 = '1'  #C20180912-07783  ADD AND pmao000 = '1' 
      #C180710-09421#3---add---s
      LET l_pmdl005 = ''
      SELECT pmdl005 INTO l_pmdl005
         FROM pmdl_t
         WHERE pmdlent = g_enterprise
         AND pmdldocno = p_pmdldocno
      IF l_pmdl005 = '2' THEN
      #C180710-09421#3---add---e
         IF cl_null(l_pmao004) THEN LET g_xmdc.xmdc001 = l_pmdn.pmdn001 ELSE LET g_xmdc.xmdc001 = l_pmao004 END IF
      #C180710-09421#3---add---S
      ELSE
         LET g_xmdc.xmdc001 = l_pmdn.pmdn001
      END IF  
      #C180710-09421#3---add---E
      LET g_xmdc.xmdc002 = l_pmdn.pmdn002
      
      
      #fcx-180328--str--
      LET g_xmdc.xmdc004 = l_pmdn.pmdn004
      LET g_xmdc.xmdc005 = l_pmdn.pmdn005
      #fcx-180328--str--  

      LET g_xmdc.xmdc006 = l_pmdn.pmdn006
      LET g_xmdc.xmdc007 = l_pmdn.pmdn007
      LET g_xmdc.xmdc008 = l_pmdn.pmdn008
      LET g_xmdc.xmdc009 = l_pmdn.pmdn009
      LET g_xmdc.xmdc010 = l_pmdn.pmdn010
      LET g_xmdc.xmdc011 = l_pmdn.pmdn011
      LET g_xmdc.xmdc012 = l_pmdn.pmdn014

      LET g_xmdc.xmdc016 = g_xmda.xmda011
      LET g_xmdc.xmdc017 = g_xmda.xmda012

      LET g_xmdc.xmdc015 = l_pmdn.pmdn015
      LET g_xmdc.xmdc043 = l_pmdn.pmdn043

      LET g_xmdc.xmdc019 = l_pmdn.pmdn019  #子件特性
     #160902-00008#1-s-mark
     #LET g_xmdc.xmdc020 = '1' #一般        #急料
     #LET g_xmdc.xmdc021 = 'N'              #保稅
     #160902-00008#1-e-mark
     #160902-00008#1-s-add
      LET g_xmdc.xmdc020 = l_pmdn.pmdn020   #急料
      LET g_xmdc.xmdc021 = l_pmdn.pmdn021   #保稅
     #160902-00008#1-e-add      
      LET g_xmdc.xmdc022 = l_pmdn.pmdn022   #部分交貨
      LET g_xmdc.xmdcunit = g_xmda.xmdasite
      LET g_xmdc.xmdcorga = g_xmda.xmdasite
      LET g_xmdc.xmdc023 = g_xmda.xmda004
      LET g_xmdc.xmdc024 = l_pmdn.pmdn024
      
      LET g_xmdc.xmdc025 = l_pmdn.pmdn025   #170824-00001#1 add
      LET g_xmdc.xmdc026 = l_pmdn.pmdn026   #170824-00001#1 add
      
     #LET g_xmdc.xmdc027 = g_xmdc.xmdc001   #161107-00023#1 mark
      LET g_xmdc.xmdc027 = l_pmdn.pmdn027   #161107-00023#1 add
     #LET g_xmdc.xmdc028 = l_pmdn.pmdn028   #限定庫位，不限制
     #LET g_xmdc.xmdc029 = l_pmdn.pmdn029   #限定儲位，不限制
      LET g_xmdc.xmdc030 = l_pmdn.pmdn030
      LET g_xmdc.xmdc031 = l_pmdn.pmdn031
      LET g_xmdc.xmdc032 = l_pmdn.pmdn032
      LET g_xmdc.xmdc033 = l_pmdn.pmdn033
      LET g_xmdc.xmdc034 = l_pmdn.pmdn034
      LET g_xmdc.xmdc035 = l_pmdn.pmdn035
      LET g_xmdc.xmdc036 = l_pmdn.pmdn036
      LET g_xmdc.xmdc037 = l_pmdn.pmdn037
      LET g_xmdc.xmdc038 = l_pmdn.pmdn038
      LET g_xmdc.xmdc039 = l_pmdn.pmdn039
      
      LET g_xmdc.xmdcud004 = l_pmdn.pmdnud001   #基板供应商 add by cz 20180607 #remark by xianggy 180621
      LET g_xmdc.xmdcud012 = l_pmdn.pmdnud014   #WEIGHT add by hehw 200915

      LET g_xmdc.xmdc044 = 0
      LET g_xmdc.xmdc045 = '1'  #一般

      LET g_xmdc.xmdc052 = 'N'
      LET g_xmdc.xmdc050 = l_pmdn.pmdn050 #170221-00029#2-add
      LET g_xmdc.xmdc057 = l_pmdn.pmdn053
      #add by jinfeng 180312--s
      SELECT icaduc006 INTO  l_icaduc006  FROM icaduc_t 
       WHERE icaducent = g_enterprise 
         AND icaduc001 = g_icab.icab001 
         AND icaduc003 = g_icab.icab002-1 
         AND icaduc004 = l_pmdn.pmdn028							
      IF NOT cl_null(l_icaduc006) THEN							
         LET g_xmdc.xmdc028 = l_icaduc006         #库位							
      ELSE 									
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'cxm-00012'   #采购单收货库位为空或未找到对应的下站据点的库位
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE         
         CALL cl_err()    
         LET r_success = FALSE
         RETURN r_success							
      END IF							
      
      #add by jinfeng 180312--e
     #170103-00002 #1-s-add
      IF NOT cl_null(p_firstxmdadocno) THEN
         EXECUTE s_aic_carry_xmdc_pre2 USING p_firstxmdadocno,l_pmdn.pmdnseq INTO g_xmdc.xmdc013     
      END IF 
     #170103-00002 #1-e-add
      #取得未稅金額、税额、含稅金額
      CALL s_aic_carry_get_amount(g_xmdc.xmdcsite,g_xmdc.xmdcdocno,g_xmdc.xmdcseq,g_xmda.xmda015,g_xmdc.xmdc011,g_xmdc.xmdc015,g_xmdc.xmdc016)
      RETURNING r_success,g_xmdc.xmdc046,g_xmdc.xmdc048,g_xmdc.xmdc047

     IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      #170105-00050#2-s-add
      #先判斷，來源是否為預先訂單
      IF g_aic_source MATCHES "[12]" THEN
         #取得對應的預先訂單單號
         SELECT xmdadocno INTO g_xmdc.xmdc055
           FROM xmda_t
          WHERE xmdaent  = g_enterprise
            AND xmdasite = g_xmda.xmdasite
            AND xmda031  = g_pre_aic
         LET g_xmdc.xmdc056 = l_pmdn.pmdn060
      END IF
      #170105-00050#2-s-add
      #C180824-07015#1 add----------S
      LET l_pmdp003=''
      LET l_pmdp004=''
      SELECT pmdp003,pmdp004 INTO l_pmdp003,l_pmdp004 FROM pmdp_t
       WHERE pmdpent = g_enterprise 
         AND pmdpdocno = p_pmdldocno
         AND pmdpseq = l_pmdn.pmdnseq
      SELECT xmdcud021,xmdcud001,xmdcud002,xmdcud003 INTO g_xmdc.xmdcud021,g_xmdc.xmdcud001,g_xmdc.xmdcud002,g_xmdc.xmdcud003 FROM xmdc_t  #C20180829-07783 add xmdcud001,xmdcud002,xmdcud003
       WHERE xmdcent = g_enterprise
         AND xmdcdocno = l_pmdp003
         AND xmdcseq = l_pmdp004
      ##增加多角性质为2:代采购抛转生成的订单单身来源单号/来源序号等于单头的来源单号/单身序号 add by pyh 20191119  
      LET l_pmdl006 = ''
      SELECT pmdl006 INTO l_pmdl006
         FROM pmdl_t
         WHERE pmdlent = g_enterprise
         AND pmdldocno = p_pmdldocno
      
      IF l_pmdl006 = '2' THEN 
         LET g_xmdc.xmdcud001 = p_pmdldocno
         LET g_xmdc.xmdcud002 = g_xmdc.xmdcseq
      END IF
      #C180824-07015#1 add----------E
      
      INSERT INTO xmdc_t (xmdcent,xmdcsite,xmdcdocno,xmdcseq,
                          xmdc001,xmdc002,xmdc003,xmdc004,xmdc005,
                          xmdc006,xmdc007,xmdc008,xmdc009,xmdc010,
                          xmdc011,xmdc012,xmdc013,xmdc015,
                          xmdc016,xmdc017,xmdc019,xmdc020,
                          xmdc021,xmdc022,
                          xmdcunit,xmdcorga,
                          xmdc023,xmdc024,xmdc025,
                          xmdc026,xmdc027,xmdc028,xmdc029,xmdc030,
                          xmdc031,xmdc032,xmdc033,xmdc034,xmdc035,
                          xmdc036,xmdc037,xmdc038,xmdc039,xmdc040,
                          xmdc041,xmdc042,xmdc043,xmdc044,xmdc045,
                          xmdc046,xmdc047,xmdc048,xmdc049,xmdc050,
                          xmdc051,xmdc052,xmdc053,xmdc054,xmdc055,
                          xmdcud021, #C180824-07015#1 add  
                          xmdc056,xmdc057,xmdcud004,        #add ,xmdcud004 by xianggy 180621
                          xmdcud012,                        #add xmdcud012 by hehw 200915
                          xmdcud001,xmdcud002,xmdcud003)    #C20180829-07783 ADD
      VALUES (g_enterprise,g_xmdc.xmdcsite,g_xmdc.xmdcdocno,g_xmdc.xmdcseq,
              g_xmdc.xmdc001,g_xmdc.xmdc002,g_xmdc.xmdc003,g_xmdc.xmdc004,g_xmdc.xmdc005,
              g_xmdc.xmdc006,g_xmdc.xmdc007,g_xmdc.xmdc008,g_xmdc.xmdc009,g_xmdc.xmdc010,
              g_xmdc.xmdc011,g_xmdc.xmdc012,g_xmdc.xmdc013,g_xmdc.xmdc015,
              g_xmdc.xmdc016,g_xmdc.xmdc017,g_xmdc.xmdc019,g_xmdc.xmdc020,
              g_xmdc.xmdc021,g_xmdc.xmdc022,
              g_xmdc.xmdcunit,g_xmdc.xmdcorga,
              g_xmdc.xmdc023,g_xmdc.xmdc024,g_xmdc.xmdc025,
              g_xmdc.xmdc026,g_xmdc.xmdc027,g_xmdc.xmdc028,g_xmdc.xmdc029,g_xmdc.xmdc030,
              g_xmdc.xmdc031,g_xmdc.xmdc032,g_xmdc.xmdc033,g_xmdc.xmdc034,g_xmdc.xmdc035,
              g_xmdc.xmdc036,g_xmdc.xmdc037,g_xmdc.xmdc038,g_xmdc.xmdc039,g_xmdc.xmdc040,
              g_xmdc.xmdc041,g_xmdc.xmdc042,g_xmdc.xmdc043,g_xmdc.xmdc044,g_xmdc.xmdc045,
              g_xmdc.xmdc046,g_xmdc.xmdc047,g_xmdc.xmdc048,g_xmdc.xmdc049,g_xmdc.xmdc050,
              g_xmdc.xmdc051,g_xmdc.xmdc052,g_xmdc.xmdc053,g_xmdc.xmdc054,g_xmdc.xmdc055,
              g_xmdc.xmdcud021,  #C180824-07015#1 add
              g_xmdc.xmdc056,g_xmdc.xmdc057,g_xmdc.xmdcud004,      #add ,g_xmdc.xmdcud004 by xianggy 180621
              g_xmdc.xmdcud012,                                    #add xmdcud012 by hehw 200915
              g_xmdc.xmdcud001,g_xmdc.xmdcud002,g_xmdc.xmdcud003)  #C20180829-07783 ADD

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:xmdc_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      OPEN s_aic_carry_pmdo_cs1 USING l_pmdn.pmdnseq
      FOREACH s_aic_carry_pmdo_cs1 INTO l_pmdo.pmdoseq1,l_pmdo.pmdoseq2,
                                        l_pmdo.pmdo001,l_pmdo.pmdo002,l_pmdo.pmdo003,l_pmdo.pmdo004,l_pmdo.pmdo005,
                                        l_pmdo.pmdo006,l_pmdo.pmdo007,l_pmdo.pmdo008,l_pmdo.pmdo009,l_pmdo.pmdo010,
                                        l_pmdo.pmdo011,l_pmdo.pmdo013,
                                        l_pmdo.pmdo022,
                                        l_pmdo.pmdo028,l_pmdo.pmdo029,l_pmdo.pmdo030,
                                        l_pmdo.pmdo031,l_pmdo.pmdo032,l_pmdo.pmdo033,l_pmdo.pmdo034
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH s_aic_carry_pmdo_cs1"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         #塞xmdd_t
         INITIALIZE g_xmdd.* TO NULL
         
         #先塞入原本資料(變更前的資料)
         EXECUTE s_aic_carry_xmdd_temp_pre USING g_xmdc.xmdcseq,l_pmdo.pmdoseq1,l_pmdo.pmdoseq2
         INTO g_xmdd.*
         
         LET g_xmdd.xmddsite = g_xmda.xmdasite
         LET g_xmdd.xmdddocno = g_xmda.xmdadocno
         LET g_xmdd.xmddseq = g_xmdc.xmdcseq
         LET g_xmdd.xmddseq1 = l_pmdo.pmdoseq1
         LET g_xmdd.xmddseq2 = l_pmdo.pmdoseq2
         
         SELECT pmao004 INTO l_pmao004  FROM pmao_t,pmdl_t  #cws 2017.12.29
          WHERE pmaoent = g_enterprise  AND pmao001 = pmdl004 AND pmao002 = l_pmdo.pmdo001 AND pmdldocno = p_pmdldocno AND pmao000 = '1'  #C20181227-07783  ADD AND pmao000 = '1'
         #C180710-09421#3---add---s
         LET l_pmdl005 = ''
         SELECT pmdl005 INTO l_pmdl005
            FROM pmdl_t
            WHERE pmdlent = g_enterprise
            AND pmdldocno = p_pmdldocno
         IF l_pmdl005 = '2' THEN
         #C180710-09421#3---add---e
            IF cl_null(l_pmao004) THEN LET g_xmdd.xmdd001 = l_pmdo.pmdo001 ELSE LET g_xmdd.xmdd001 = l_pmao004 END IF
         #C180710-09421#3---add---S
         ELSE
            LET g_xmdd.xmdd001 = l_pmdo.pmdo001
         END IF
         #C180710-09421#3---add---e
        #LET g_xmdd.xmdd001 = l_pmdo.pmdo001
         LET g_xmdd.xmdd002 = l_pmdo.pmdo002
         LET g_xmdd.xmdd003 = l_pmdo.pmdo003
         LET g_xmdd.xmdd004 = l_pmdo.pmdo004
         LET g_xmdd.xmdd005 = l_pmdo.pmdo005
         LET g_xmdd.xmdd006 = l_pmdo.pmdo006
         LET g_xmdd.xmdd007 = l_pmdo.pmdo007
         LET g_xmdd.xmdd008 = l_pmdo.pmdo008
         LET g_xmdd.xmdd009 = l_pmdo.pmdo009
         LET g_xmdd.xmdd010 = l_pmdo.pmdo010
         LET g_xmdd.xmdd011 = l_pmdo.pmdo011
         LET g_xmdd.xmdd012 = l_pmdo.pmdo013
         LET g_xmdd.xmdd013 = 'N'
         LET g_xmdd.xmdd017 = '2'            #170317-00044#1 add
         
         LET g_xmdd.xmdd018 = l_pmdo.pmdo022
         LET g_xmdd.xmdd019 = g_xmdc.xmdc016
         LET g_xmdd.xmdd020 = g_xmdc.xmdc017

         LET g_xmdd.xmdd024 = l_pmdo.pmdo028
         LET g_xmdd.xmdd025 = l_pmdo.pmdo029
         LET g_xmdd.xmdd026 = l_pmdo.pmdo030
         LET g_xmdd.xmdd027 = l_pmdo.pmdo031

         #已出貨數量
         IF cl_null(g_xmdd.xmdd014) THEN
            LET g_xmdd.xmdd014 = 0
         END IF
         
         #已銷退數量
         IF cl_null(g_xmdd.xmdd015) THEN
            LET g_xmdd.xmdd015 = 0
         END IF
         
         #銷退換貨數量
         IF cl_null(g_xmdd.xmdd016) THEN
            LET g_xmdd.xmdd016 = 0
         END IF

         #已轉出通數量
         IF cl_null(g_xmdd.xmdd031) THEN
            LET g_xmdd.xmdd031 = 0
         END IF
         
         #備置量
         IF cl_null(g_xmdd.xmdd032) THEN
            LET g_xmdd.xmdd032 = 0
         END IF
         
         #已簽退量
         IF cl_null(g_xmdd.xmdd034) THEN
            LET g_xmdd.xmdd034 = 0
         END IF
         
         #已分配量
         IF cl_null(g_xmdd.xmdd035) THEN
            LET g_xmdd.xmdd035 = 0
         END IF

         #取得未稅金額、含稅金額、稅額
         CALL s_aic_carry_tax1(g_xmdd.xmddsite,g_xmdd.xmdd027,g_xmdd.xmdd018,g_xmdd.xmdd019,g_xmda.xmda015,g_xmda.xmda016)
         RETURNING g_xmdd.xmdd028,g_xmdd.xmdd029,g_xmdd.xmdd030
         #fcx-180320--str---
         LET g_xmdd.xmddud001 = 'N'   #状态码
         LET g_xmdd.xmddud012 = g_xmdd.xmdd006  #欠料量
         #fcx-180320--end---         
         INSERT INTO xmdd_t (xmddent,xmddsite,
                             xmdddocno,xmddseq,xmddseq1,xmddseq2,
                             xmdd001,xmdd002,xmdd003,xmdd004,xmdd005,
                             xmdd006,xmdd007,xmdd008,xmdd009,xmdd010,
                             xmdd011,xmdd012,xmdd013,xmdd014,xmdd015,
                             xmdd016,xmdd017,xmdd018,xmdd019,xmdd020,
                             xmdd021,xmdd022,xmdd023,xmdd024,xmdd025,
                             xmdd026,xmdd027,xmdd028,xmdd029,xmdd030,
                             xmdd031,xmdd032,xmdd033,xmdd034,xmdd035,
                             xmddud001,xmddud012)   #fcx-180320 add
         VALUES (g_enterprise,g_xmdd.xmddsite,
                 g_xmdd.xmdddocno,g_xmdd.xmddseq,g_xmdd.xmddseq1,g_xmdd.xmddseq2,
                 g_xmdd.xmdd001,g_xmdd.xmdd002,g_xmdd.xmdd003,g_xmdd.xmdd004,g_xmdd.xmdd005,
                 g_xmdd.xmdd006,g_xmdd.xmdd007,g_xmdd.xmdd008,g_xmdd.xmdd009,g_xmdd.xmdd010,
                 g_xmdd.xmdd011,g_xmdd.xmdd012,g_xmdd.xmdd013,g_xmdd.xmdd014,g_xmdd.xmdd015,
                 g_xmdd.xmdd016,g_xmdd.xmdd017,g_xmdd.xmdd018,g_xmdd.xmdd019,g_xmdd.xmdd020,
                 g_xmdd.xmdd021,g_xmdd.xmdd022,g_xmdd.xmdd023,g_xmdd.xmdd024,g_xmdd.xmdd025,
                 g_xmdd.xmdd026,g_xmdd.xmdd027,g_xmdd.xmdd028,g_xmdd.xmdd029,g_xmdd.xmdd030,
                 g_xmdd.xmdd031,g_xmdd.xmdd032,g_xmdd.xmdd033,g_xmdd.xmdd034,g_xmdd.xmdd035,
                 g_xmdd.xmddud001,g_xmdd.xmddud012)  #fcx-180320 add
                 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:xmdd_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #170105-00050#5-s-mark
         ##170105-00050#2-s-add
         ##先判斷，來源是否為預先訂單
         #IF g_aic_source MATCHES "[12]" THEN
         #   #取得前一張單回寫的數量
         #   SELECT DISTINCT pmdo015 INTO l_pmdo015
         #     FROM pmdl_t,pmdo_t
         #    WHERE pmdlent = pmdoent          AND pmdldocno = pmdodocno 
         #      AND pmdlent = g_enterprise     AND pmdl031 = g_pre_aic
         #      AND pmdoseq = g_xmdc.xmdc056   #以單身來源項次為準
         #      AND pmdoseq1 = g_xmdd.xmddseq1 AND pmdoseq2 = g_xmdd.xmddseq2
         #    ORDER BY pmdo015 DESC               
         #   #將數量，回寫至對應的預先訂單   
         #   UPDATE xmdd_t SET xmdd014 = l_pmdo015 #已出貨量
         #    WHERE xmddent = g_enterprise AND xmddseq = g_xmdc.xmdc056   #以單身來源項次為準
         #      AND xmddseq1 = g_xmdd.xmddseq1 AND xmddseq2 = g_xmdd.xmddseq2
         #      AND xmdddocno = (SELECT xmdadocno FROM xmda_t WHERE xmdaent = g_enterprise
         #                          AND xmdasite = g_xmdd.xmddsite  AND xmda031 = g_pre_aic)
         #   IF SQLCA.sqlcode THEN
         #      INITIALIZE g_errparam TO NULL
         #      LET g_errparam.extend = "UPDATE:xmdd_t"
         #      LET g_errparam.code   = SQLCA.sqlcode
         #      LET g_errparam.popup  = TRUE
         #      CALL cl_err()
         #  
         #      LET r_success = FALSE
         #      EXIT FOREACH
         #   END IF
         #END IF
         ##170105-00050#2-e-add
         #170105-00050#5-e-mark
      END FOREACH

      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      OPEN s_aic_carry_pmdq_cs USING l_pmdn.pmdnseq
      FOREACH s_aic_carry_pmdq_cs INTO l_pmdq.pmdqseq2,
                                       l_pmdq.pmdq002,l_pmdq.pmdq003,l_pmdq.pmdq004,l_pmdq.pmdq005,
                                       l_pmdq.pmdq006,l_pmdq.pmdq007,l_pmdq.pmdq008
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH s_aic_carry_pmdq_cs"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         #塞xmdf_t
         INITIALIZE g_xmdf.* TO NULL
         
         #先塞入原本資料(變更前的資料)
         EXECUTE s_aic_carry_xmdf_temp_pre USING g_xmdc.xmdcseq,l_pmdq.pmdqseq2
         INTO g_xmdf.*
         
         LET g_xmdf.xmdfsite = g_xmda.xmdasite
         LET g_xmdf.xmdfdocno = g_xmda.xmdadocno
         LET g_xmdf.xmdfseq = g_xmdc.xmdcseq

         LET g_xmdf.xmdfseq2 = l_pmdq.pmdqseq2
         LET g_xmdf.xmdf002 = l_pmdq.pmdq002
         LET g_xmdf.xmdf003 = l_pmdq.pmdq003
         LET g_xmdf.xmdf004 = l_pmdq.pmdq004
         LET g_xmdf.xmdf005 = l_pmdq.pmdq006
         LET g_xmdf.xmdf006 = l_pmdq.pmdq007
         LET g_xmdf.xmdf007 = l_pmdq.pmdq008
         
         INSERT INTO xmdf_t (xmdfent,xmdfsite,
                             xmdfdocno,xmdfseq,xmdfseq2,
                             xmdf002,xmdf003,xmdf004,xmdf005,
                             xmdf006,xmdf007)
         VALUES (g_enterprise,g_xmdf.xmdfsite,
                 g_xmdf.xmdfdocno,g_xmdf.xmdfseq,g_xmdf.xmdfseq2,
                 g_xmdf.xmdf002,g_xmdf.xmdf003,g_xmdf.xmdf004,g_xmdf.xmdf005,
                 g_xmdf.xmdf006,g_xmdf.xmdf007)
                 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:xmdf_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH

      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
   END FOREACH
   
   #170105-00050#5-s-add
   #先判斷，來源是否為預先訂單
   IF g_aic_source MATCHES "[12]" AND r_success THEN
      #更新預先訂單的資料
      CALL s_aic_carry_pre_so_upd('1',g_xmda.xmdasite,g_xmda.xmda031) RETURNING r_success
       IF NOT r_success THEN
          RETURN r_success
       END IF
   END IF
   #170105-00050#5-e-add
      
   IF NOT r_success THEN
      RETURN r_success
   ELSE
      CALL s_aic_carry_return_amount(g_xmda.xmdadocno)
      RETURNING g_xmda.xmda041,g_xmda.xmda043,g_xmda.xmda042

      UPDATE xmda_t
         SET xmda041 = g_xmda.xmda041,
             xmda043 = g_xmda.xmda043,
             xmda042 = g_xmda.xmda042
       WHERE xmdaent = g_enterprise
         AND xmdadocno = g_xmda.xmdadocno
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE:xmda_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success
      END IF   
            
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: INSERT 採購單單身
# Memo...........:
# Usage..........: CALL s_aic_carry_body_po(p_xmdadocno,p_type)
#                  RETURNING r_success
# Input parameter: p_xmdadocno   來源單號
#                : p_type        1.中間站2.最終站
# Return code....: r_success     執行結果
#                : 
# Date & Author..: 150824 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_body_po(p_xmdadocno,p_type,p_firstpmdldocno,p_firstxmdadocno,p_nextsite)
   DEFINE p_xmdadocno     LIKE xmda_t.xmdadocno
   DEFINE p_type          LIKE type_t.chr1          #1.中間站2.最終站
   DEFINE p_firstpmdldocno  LIKE pmdl_t.pmdldocno   #初始採購單號(中間站使用)
   DEFINE p_firstxmdadocno  LIKE xmda_t.xmdadocno   #初始訂單單號(中間站使用)
   DEFINE p_nextsite        LIKE icab_t.icabsite    #下站營運據點(中間站使用)
   
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_xmdc          RECORD LIKE xmdc_t.*
   DEFINE l_xmdd          RECORD   LIKE xmdd_t.*
   DEFINE l_xmdf          RECORD   LIKE xmdf_t.*
   DEFINE l_cnt           LIKE type_t.num10
   DEFINE l_pmdn012       LIKE pmdn_t.pmdn012       #160713-00016#1 add
   DEFINE l_pmdn013       LIKE pmdn_t.pmdn013       #160713-00016#1 add 
   DEFINE l_oofa001       LIKE oofa_t.oofa001       #170215-00007#1 add
   DEFINE l_xmdd014       LIKE xmdd_t.xmdd014       #170105-00050#2-add
   DEFINE l_pmdp023       LIKE pmdp_t.pmdp023       #170915-00041#1 add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET g_sql = "SELECT xmdcseq,",
               "       xmdc001,xmdc002,",
               "       xmdc006,xmdc007,xmdc008,xmdc009,xmdc010,",
               "       xmdc011,xmdc012,xmdc015,",
               "       xmdc019,xmdc020,xmdc021,xmdc022,xmdc024,", #160902-00008#1 add xmdc020,xmdc021
               "       xmdc025,xmdc026,xmdc031,",                 #170824-00001#1 add
               "       xmdc027,xmdc028,xmdc029,xmdc030,",         #161107-00023#1 add xmdc027
               "       xmdc036,xmdc037,xmdc038,xmdc039,",
               "       xmdc050,", #170221-00029#2-add
               "       xmdc057",
               "      ,xmdc056",  #170105-00050#2-add
               "  FROM xmdc_t",
               " WHERE xmdcent = ",g_enterprise,
               "   AND xmdcdocno = '",p_xmdadocno,"'"
   PREPARE s_aic_carry_xmdc_pre1 FROM g_sql
   DECLARE s_aic_carry_xmdc_cs1 CURSOR FOR s_aic_carry_xmdc_pre1

   LET g_sql = "SELECT xmddseq1,xmddseq2,",
               "       xmdd001,xmdd002,xmdd003,xmdd004,xmdd005,",
               "       xmdd006,xmdd007,xmdd008,xmdd009,xmdd010,",
               "       xmdd024,xmdd025,xmdd026,xmdd027, ",
               "       xmdd011,xmdd012,xmdd013 ",    #160713-00016#1 add   #171212-00048#1 add xmdd013        
               "  FROM xmdd_t",
               " WHERE xmddent = ",g_enterprise,
               "   AND xmdddocno = '",p_xmdadocno,"'",
               "   AND xmddseq =?"
   PREPARE s_aic_carry_xmdd_pre2 FROM g_sql
   DECLARE s_aic_carry_xmdd_cs2 CURSOR FOR s_aic_carry_xmdd_pre2

   LET g_sql = "SELECT xmdfseq2,",
               "       xmdf002,xmdf003,xmdf004,xmdf005,",
               "       xmdf006,xmdf007",
               "  FROM xmdf_t",
               " WHERE xmdfent = ",g_enterprise,
               "   AND xmdfdocno = '",p_xmdadocno,"'",
               "   AND xmdfseq =?"
   PREPARE s_aic_carry_xmdf_pre FROM g_sql
   DECLARE s_aic_carry_xmdf_cs CURSOR FOR s_aic_carry_xmdf_pre

   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_pmdn_temp",   #170206-00013#1 mark
               "  FROM s_aic_pmdn_temp",         #170206-00013#1 add
               " WHERE pmdnent = ",g_enterprise,
               "   AND pmdndocno = '",g_pmdl.pmdldocno,"'",
               "   AND pmdnseq = ?"
   PREPARE s_aic_carry_pmdn_temp_pre FROM g_sql

   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_pmdo_temp",   #170206-00013#1 mark
               "  FROM s_aic_pmdo_temp",         #170206-00013#1 add
               " WHERE pmdoent = ",g_enterprise,
               "   AND pmdodocno = '",g_pmdl.pmdldocno,"'",
               "   AND pmdoseq = ?",
               "   AND pmdoseq1 = ?",
               "   AND pmdoseq2 = ?"
   PREPARE s_aic_carry_pmdo_temp_pre FROM g_sql

   LET g_sql = "SELECT pmdp025,pmdp026",
              #"  FROM s_aic_carry_pmdp_temp",   #170206-00013#1 mark
               "  FROM s_aic_pmdp_temp",         #170206-00013#1 add
               " WHERE pmdpent = ",g_enterprise,
               "   AND pmdpdocno = '",g_pmdl.pmdldocno,"'",
               "   AND pmdpseq = ?",
               "   AND pmdp003 = ?",
               "   AND pmdp004 = ?",
               "   AND pmdp005 = ?",
               "   AND pmdp006 = ?"
   PREPARE s_aic_carry_pmdp_temp_pre FROM g_sql

   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_pmdq_temp",   #170206-00013#1 mark
               "  FROM s_aic_pmdq_temp",         #170206-00013#1 add
               " WHERE pmdqent = ",g_enterprise,
               "   AND pmdqdocno = '",g_pmdl.pmdldocno,"'",
               "   AND pmdqseq = ?",
               "   AND pmdqseq2 = ?"
   PREPARE s_aic_carry_pmdq_temp_pre FROM g_sql

   #清空TEMP TABLE
   #170206-00013#1-(S)-mark
   #DELETE FROM s_aic_carry_pmdn_temp
   #DELETE FROM s_aic_carry_pmdo_temp
   #DELETE FROM s_aic_carry_pmdp_temp
   #DELETE FROM s_aic_carry_pmdq_temp
   #170206-00013#1-(E)-mark   
   #170206-00013#1-(S)-add
   DELETE FROM s_aic_pmdn_temp
   DELETE FROM s_aic_pmdo_temp
   DELETE FROM s_aic_pmdp_temp
   DELETE FROM s_aic_pmdq_temp
   #170206-00013#1-(E)-add
   
   
   #將資料塞入temp table，並刪除原table資料
  #INSERT INTO s_aic_carry_pmdn_temp   #170206-00013#1 mark
   INSERT INTO s_aic_pmdn_temp         #170206-00013#1 add
   SELECT * FROM pmdn_t
    WHERE pmdnent = g_enterprise
      AND pmdndocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_pmdn_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #170105-00050#10-s-add
   #將預先的數量減回來
   IF NOT s_aic_carry_pre_po_upd('2',g_pmdl.pmdlsite,g_pmdl.pmdl031) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #170105-00050#10-e-add
   
   DELETE FROM pmdn_t
    WHERE pmdnent = g_enterprise
      AND pmdndocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM pmdn_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   
  #INSERT INTO s_aic_carry_pmdo_temp   #170206-00013#1 mark
   INSERT INTO s_aic_pmdo_temp         #170206-00013#1 add
   SELECT * FROM pmdo_t
    WHERE pmdoent = g_enterprise
      AND pmdodocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_pmdo_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DELETE FROM pmdo_t
    WHERE pmdoent = g_enterprise
      AND pmdodocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM pmdo_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   
  #INSERT INTO s_aic_carry_pmdp_temp   #170206-00013#1 mark
   INSERT INTO s_aic_pmdp_temp         #170206-00013#1 add
   SELECT * FROM pmdp_t
    WHERE pmdpent = g_enterprise
      AND pmdpdocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_pmdp_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DELETE FROM pmdp_t
    WHERE pmdpent = g_enterprise
      AND pmdpdocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM pmdp_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
   
  #INSERT INTO s_aic_carry_pmdq_temp   #170206-00013#1 mark
   INSERT INTO s_aic_pmdq_temp         #170206-00013#1 add
   SELECT * FROM pmdq_t
    WHERE pmdqent = g_enterprise
      AND pmdqdocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_pmdq_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF

   DELETE FROM pmdq_t
    WHERE pmdqent = g_enterprise
      AND pmdqdocno = g_pmdl.pmdldocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM pmdq_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   
      LET r_success = FALSE
      RETURN r_success
   END IF
  
  #--160428-00006#2--mark--(S)
  #調整至產生採購單頭時就取得icag的資料，好設定單頭幣別  
  #IF p_type = '1' THEN
  #   #取得icag_t、計價、幣別
  #   CALL s_aic_carry_get_tri_pm(g_pmdl.pmdl051,g_pmdl.pmdlsite,g_pmdl.pmdldocdt)
  #   RETURNING r_success
  #   IF NOT r_success THEN
  #      RETURN r_success
  #   END IF
  #END IF
  #--160428-00006#2--mark--(E) 
   
   FOREACH s_aic_carry_xmdc_cs1 INTO l_xmdc.xmdcseq,
                                     l_xmdc.xmdc001,l_xmdc.xmdc002,
                                     l_xmdc.xmdc006,l_xmdc.xmdc007,l_xmdc.xmdc008,l_xmdc.xmdc009,l_xmdc.xmdc010,
                                     l_xmdc.xmdc011,l_xmdc.xmdc012,l_xmdc.xmdc015,
                                     l_xmdc.xmdc019,l_xmdc.xmdc020,l_xmdc.xmdc021,l_xmdc.xmdc022,l_xmdc.xmdc024,  #160902-00008#1 add xmdc020,xmdc021
                                     l_xmdc.xmdc025,l_xmdc.xmdc026,l_xmdc.xmdc031,                                #170824-00001#1 add
                                     l_xmdc.xmdc027,l_xmdc.xmdc028,l_xmdc.xmdc029,l_xmdc.xmdc030,                 #161107-00023#1 add xmdc027   
                                     l_xmdc.xmdc036,l_xmdc.xmdc037,l_xmdc.xmdc038,l_xmdc.xmdc039,
                                     l_xmdc.xmdc050, #170221-00029#2-add
                                     l_xmdc.xmdc057
                                    ,l_xmdc.xmdc056  #170105-00050#2-add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_xmdc_cs1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()   
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
 
      #塞pmdn_t
      INITIALIZE g_pmdn.* TO NULL
      
      #先塞入原本資料(變更前的資料)
      EXECUTE s_aic_carry_pmdn_temp_pre USING l_xmdc.xmdcseq
      INTO g_pmdn.*
      
      LET g_pmdn.pmdnsite = g_pmdl.pmdlsite
      LET g_pmdn.pmdndocno = g_pmdl.pmdldocno
      LET g_pmdn.pmdnseq = l_xmdc.xmdcseq
      LET g_pmdn.pmdn001 = l_xmdc.xmdc001
      LET g_pmdn.pmdn002 = l_xmdc.xmdc002
      
      LET g_pmdn.pmdn006 = l_xmdc.xmdc006
      LET g_pmdn.pmdn007 = l_xmdc.xmdc007
      LET g_pmdn.pmdn008 = l_xmdc.xmdc008
      LET g_pmdn.pmdn009 = l_xmdc.xmdc009
      LET g_pmdn.pmdn010 = l_xmdc.xmdc010
      LET g_pmdn.pmdn011 = l_xmdc.xmdc011

      LET g_pmdn.pmdn014 = l_xmdc.xmdc012
      LET g_pmdn.pmdn016 = g_pmdl.pmdl011
      LET g_pmdn.pmdn017 = g_pmdl.pmdl012

      LET g_pmdn.pmdn019 = l_xmdc.xmdc019   #子件特性
     #160902-00008#1-s-mark
     #LET g_pmdn.pmdn020 = '1' #一般         #緊急度
     #LET g_pmdn.pmdn021 = 'N'               #保稅
     #160902-00008#1-e-mark
     #160902-00008#1-s-mark
      LET g_pmdn.pmdn020 = l_xmdc.xmdc020    #緊急度
      LET g_pmdn.pmdn021 = l_xmdc.xmdc021    #保稅
     #160902-00008#1-e-mark     
      LET g_pmdn.pmdn022 = l_xmdc.xmdc022    #部分交貨
      LET g_pmdn.pmdnunit = g_pmdl.pmdlsite
      LET g_pmdn.pmdnorga = g_pmdl.pmdlsite
      LET g_pmdn.pmdn023 = g_pmdl.pmdl004
      LET g_pmdn.pmdn024 = l_xmdc.xmdc024
      
      LET g_pmdn.pmdn025 = l_xmdc.xmdc025  #170824-00001#1 add
      LET g_pmdn.pmdn026 = l_xmdc.xmdc026  #170824-00001#1 add
      
     #LET g_pmdn.pmdn027 = l_xmdc.xmdc001  #161107-00023#1 mark
      LET g_pmdn.pmdn027 = l_xmdc.xmdc027  #161107-00023#1 add
      LET g_pmdn.pmdn028 = l_xmdc.xmdc028  #限定庫位
      LET g_pmdn.pmdn029 = l_xmdc.xmdc029  #限定儲位
      LET g_pmdn.pmdn030 = l_xmdc.xmdc030

     #LET g_pmdn.pmdn031 = g_pmdl.pmdl020   #170706-00050#1 add #170824-00001#1 mark
      LET g_pmdn.pmdn031 = l_xmdc.xmdc031   #170824-00001#1 add
      LET g_pmdn.pmdn032 = '1'   #1.供應商運送
      LET g_pmdn.pmdn033 = 0
      LET g_pmdn.pmdn034 = 0

      LET g_pmdn.pmdn036 = l_xmdc.xmdc036
      LET g_pmdn.pmdn037 = l_xmdc.xmdc037
      LET g_pmdn.pmdn038 = l_xmdc.xmdc038
      LET g_pmdn.pmdn039 = l_xmdc.xmdc039

      LET g_pmdn.pmdn044 = 0
      LET g_pmdn.pmdn045 = '1' #一般

      #170105-00050#2-s-add
      #先判斷，來源是否為預先訂單
      IF g_aic_source MATCHES "[12]" THEN
         #取得對應的預先訂單單號
         SELECT pmdldocno INTO g_pmdn.pmdn059
           FROM pmdl_t
          WHERE pmdlent  = g_enterprise
            AND pmdlsite = g_pmdl.pmdlsite
            AND pmdl031  = g_pre_aic
         LET g_pmdn.pmdn060 = l_xmdc.xmdc056
      END IF
      #170105-00050#2-e-add
     #LET g_pmdn.pmdn052 = 'N'      #170830-00067#1 mark
      CALL s_aic_carry_get_qcap006(g_pmdn.pmdn001,g_pmdn.pmdn002,g_pmdn.pmdn004,g_pmdn.pmdn005) RETURNING g_pmdn.pmdn052   #170830-00067#1 add
      
      LET g_pmdn.pmdn050 = l_xmdc.xmdc050 #170221-00029#2-add
      LET g_pmdn.pmdn053 = l_xmdc.xmdc057

      #由到庫日回推出貨日、到廠日
      CALL s_aic_carry_get_time(g_pmdn.pmdnsite,g_pmdn.pmdn001,g_pmdn.pmdn014)
      RETURNING g_pmdn.pmdn012,g_pmdn.pmdn013

      IF p_type = '1' THEN      
         #若計價方式=1.依計價比率
         IF g_icag.icag005 = '1' THEN
            CASE g_icag.icag006            
               WHEN '1'   #若"計價基準"=1.依來源營運據點
                  IF NOT cl_null(p_firstxmdadocno) THEN #由初始訂單發起
                     #(若初始訂單幣別與採購單幣別不同,則呼叫應用元件取訂單幣別與本國幣的匯率,再以本國幣別換成採購幣別匯率進行換算)
                     CALL s_aic_carry_get_price('1',g_pmdl.pmdl054,g_pmdn.pmdnsite,g_pmdl.pmdldocdt,g_pmdl.pmdl015,
                                                p_firstxmdadocno,l_xmdc.xmdcseq,g_icag.icag007)
                     RETURNING r_success,g_pmdn.pmdn015
                     
                  ELSE   #由初始採購單發起
                     #(若初始採購單幣別與採購單幣別不同,則呼叫應用元件取初始採購單幣別與本國幣的匯率,再以本國幣別換成採購幣別匯率進行換算)
                     CALL s_aic_carry_get_price('2',g_pmdl.pmdl054,g_pmdn.pmdnsite,g_pmdl.pmdldocdt,g_pmdl.pmdl015,
                                                p_firstpmdldocno,l_xmdc.xmdcseq,g_icag.icag007)
                     RETURNING r_success,g_pmdn.pmdn015
                                                         
                  END IF
               
               WHEN '2'  #若"計價基準"=2.依上游廠商
                  #(若當站訂單幣別與採購單幣別不同,則呼叫應用元件取訂單幣別與本國幣的匯率,再以本國幣別換成採購幣別匯率進行換算)
                  CALL s_aic_carry_get_price('1',g_pmdl.pmdl054,g_pmdn.pmdnsite,g_pmdl.pmdldocdt,g_pmdl.pmdl015,
                                             p_xmdadocno,l_xmdc.xmdcseq,g_icag.icag007)
                  RETURNING r_success,g_pmdn.pmdn015
                                                 
               WHEN '3'  #若"計價基準"=3.依最終廠商逆推
                  #於完成最終站採購單後,再進行逆推計，之後由s_aic_carry_gen_last_po回寫
                  LET g_pmdn.pmdn015 = l_xmdc.xmdc015  #先預設訂單單價
               
               WHEN '4' #若"計價基準"=4.依下游廠商逆推
                  #於完成最終站採購單後,再進行逆推計，之後由s_aic_carry_gen_last_po回寫
                  LET g_pmdn.pmdn015 = l_xmdc.xmdc015  #先預設訂單單價
      
            END CASE
            
         ELSE
           #IF g_icag.icag005 <> '3' OR g_pmdn.pmdn015 <> '0' THEN                   #160428-00006#2 mark
            IF g_icag.icag005 = '3' AND l_xmdc.xmdc015 <> '0' THEN                   #160428-00006#2 add
               #計價方式為3:非0時，依轉撥單價==>若為3，且單價為0，則直接給0，不重取
               LET g_pmdn.pmdn015 = l_xmdc.xmdc015                                   #160428-00006#2 add
            ELSE                                                                     #160428-00006#2 add
               #若計價方式2:依轉撥單價或3非0時(單價為0時)，依轉撥單價
               #則須進一步呼叫s_aic_carry_get_tri_price取得轉撥單價
               CASE g_icaa.icaa010
                  WHEN '1'   #轉撥單價取價方式='1.依單據日期'
                     #取得icah_t
                     CALL s_aic_carry_get_tri_price(g_pmdl.pmdl051,g_pmdl.pmdlsite,p_nextsite,g_pmdl.pmdldocdt,
                                                    g_pmdl.pmdl015,g_pmdn.pmdn001,g_pmdn.pmdn002,g_pmdl.pmdl013)
                     RETURNING r_success,g_pmdn.pmdn015
               
                  WHEN '2'   #轉撥單價取價方式='2.預計出入庫日期'
                     #取得icah_t
                     CALL s_aic_carry_get_tri_price(g_pmdl.pmdl051,g_pmdl.pmdlsite,p_nextsite,g_pmdn.pmdn014,
                                                    g_pmdl.pmdl015,g_pmdn.pmdn001,g_pmdn.pmdn002,g_pmdl.pmdl013)
                     RETURNING r_success,g_pmdn.pmdn015
               END CASE
            END IF
      
         END IF
      
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         CALL s_curr_round(g_pmdn.pmdnsite,g_pmdl.pmdl015,g_pmdn.pmdn015,'1') RETURNING g_pmdn.pmdn015   #171023-00015#1 add
         LET g_pmdn.pmdn043 = g_pmdn.pmdn015
      ELSE
         #單價 CALL取價元件
         CALL s_purchase_price_get(g_pmdl.pmdl017,g_pmdl.pmdl004,g_pmdn.pmdn001,g_pmdn.pmdn002,g_pmdl.pmdl015,
                                   g_pmdn.pmdn016,g_pmdl.pmdl009,g_pmdl.pmdl010,g_pmdl.pmdl023,g_pmdl.pmdldocno,
                                   g_pmdl.pmdldocdt,g_pmdn.pmdn010,g_pmdn.pmdn011,g_pmdn.pmdnsite,g_pmdl.pmdl054,                               
                                   '1',g_pmdn.pmdn004,g_pmdn.pmdn005)
         RETURNING g_pmdn.pmdn040,g_pmdn.pmdn043,g_pmdn.pmdn041,g_pmdn.pmdn042
         
         #呼叫幣別取位應用元件對單價作取位(依單頭幣別做取位基準)
         CALL s_curr_round(g_pmdn.pmdnsite,g_pmdl.pmdl015,g_pmdn.pmdn043,'1') RETURNING g_pmdn.pmdn043
        
         LET g_pmdn.pmdn015 = g_pmdn.pmdn043
         
      END IF
      
      #取得未稅金額、稅額、含稅金額
      CALL s_aic_carry_get_amount(g_pmdn.pmdnsite,g_pmdn.pmdndocno,g_pmdn.pmdnseq,g_pmdl.pmdl015,g_pmdn.pmdn011,g_pmdn.pmdn015,g_pmdn.pmdn016)
      RETURNING r_success,g_pmdn.pmdn046,g_pmdn.pmdn048,g_pmdn.pmdn047

      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
     #170824-00001#1 mark  --begin--
     ##170215-00007#1 add   --begin--
     ##抓取送货地址及账款地址
     ##取当前据点的联络对象识别码
     #LET l_oofa001 = ''
     #SELECT oofa001 INTO l_oofa001 FROM oofa_t WHERE oofaent = g_enterprise AND oofa002 = '1' AND oofa003 = g_pmdn.pmdnsite
     #IF NOT cl_null(l_oofa001) THEN
     #   #先抓主要送货地址,若抓不到则抓非主要的，都是只抓第一笔
     #   SELECT oofb019 INTO g_pmdn.pmdn025 FROM oofb_t WHERE oofbent = g_enterprise 
     #      AND oofb002 = l_oofa001 AND oofb008 = '3'
     #    ORDER BY oofb010 DESC,oofb019
     #   #先抓主要账款地址,若抓不到则抓非主要的，都是只抓第一笔
     #   SELECT oofb019 INTO g_pmdn.pmdn026 FROM oofb_t WHERE oofbent = g_enterprise 
     #      AND oofb002 = l_oofa001 AND oofb008 = '5'
     #    ORDER BY oofb010 DESC,oofb019   
     #END IF
     ##170215-00007#1 add   --end--  
     #170824-00001#1 mark  --end--
     
      INSERT INTO pmdn_t (pmdnent,pmdnsite,pmdndocno,pmdnseq,
                          pmdn001,pmdn002,pmdn003,pmdn004,pmdn005,
                          pmdn006,pmdn007,pmdn008,pmdn009,pmdn010,
                          pmdn011,pmdn012,pmdn013,pmdn014,pmdn015,
                          pmdn016,pmdn017,pmdn019,pmdn020,
                          pmdn021,pmdn022,pmdnunit,pmdnorga,
                          pmdn023,pmdn024,pmdn025,
                          pmdn026,pmdn027,pmdn028,pmdn029,pmdn030,
                          pmdn031,pmdn032,pmdn033,pmdn034,pmdn035,
                          pmdn036,pmdn037,pmdn038,pmdn039,pmdn040,
                          pmdn041,pmdn042,pmdn043,pmdn044,pmdn045,
                          pmdn046,pmdn047,pmdn048,pmdn049,pmdn050,
                         #pmdn051,pmdn052,pmdn053)                 #170105-00050#2-mark
                          pmdn051,pmdn052,pmdn053,pmdn059,pmdn060) #170105-00050#2-add
      VALUES (g_enterprise,g_pmdn.pmdnsite,g_pmdn.pmdndocno,g_pmdn.pmdnseq,
              g_pmdn.pmdn001,g_pmdn.pmdn002,g_pmdn.pmdn003,g_pmdn.pmdn004,g_pmdn.pmdn005,
              g_pmdn.pmdn006,g_pmdn.pmdn007,g_pmdn.pmdn008,g_pmdn.pmdn009,g_pmdn.pmdn010,
              g_pmdn.pmdn011,g_pmdn.pmdn012,g_pmdn.pmdn013,g_pmdn.pmdn014,g_pmdn.pmdn015,
              g_pmdn.pmdn016,g_pmdn.pmdn017,g_pmdn.pmdn019,g_pmdn.pmdn020,
              g_pmdn.pmdn021,g_pmdn.pmdn022,g_pmdn.pmdnunit,g_pmdn.pmdnorga,
              g_pmdn.pmdn023,g_pmdn.pmdn024,g_pmdn.pmdn025,
              g_pmdn.pmdn026,g_pmdn.pmdn027,g_pmdn.pmdn028,g_pmdn.pmdn029,g_pmdn.pmdn030,
              g_pmdn.pmdn031,g_pmdn.pmdn032,g_pmdn.pmdn033,g_pmdn.pmdn034,g_pmdn.pmdn035,
              g_pmdn.pmdn036,g_pmdn.pmdn037,g_pmdn.pmdn038,g_pmdn.pmdn039,g_pmdn.pmdn040,
              g_pmdn.pmdn041,g_pmdn.pmdn042,g_pmdn.pmdn043,g_pmdn.pmdn044,g_pmdn.pmdn045,
              g_pmdn.pmdn046,g_pmdn.pmdn047,g_pmdn.pmdn048,g_pmdn.pmdn049,g_pmdn.pmdn050,
             #g_pmdn.pmdn051,g_pmdn.pmdn052,g_pmdn.pmdn053)                               #170105-00050#2-mark
              g_pmdn.pmdn051,g_pmdn.pmdn052,g_pmdn.pmdn053,g_pmdn.pmdn059,g_pmdn.pmdn060) #170105-00050#2-add

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:pmdn_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      OPEN s_aic_carry_xmdd_cs2 USING g_pmdn.pmdnseq
      FOREACH s_aic_carry_xmdd_cs2 INTO l_xmdd.xmddseq1,l_xmdd.xmddseq2,
                                        l_xmdd.xmdd001,l_xmdd.xmdd002,l_xmdd.xmdd003,l_xmdd.xmdd004,l_xmdd.xmdd005,
                                        l_xmdd.xmdd006,l_xmdd.xmdd007,l_xmdd.xmdd008,l_xmdd.xmdd009,l_xmdd.xmdd010,
                                        l_xmdd.xmdd024,l_xmdd.xmdd025,l_xmdd.xmdd026,l_xmdd.xmdd027,
                                        l_xmdd.xmdd011,l_xmdd.xmdd012                #160713-00016#1 add  
                                        ,l_xmdd.xmdd013  #171212-00048#1 add
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_xmdd_cs2"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         
            
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #塞pmdo_t
         INITIALIZE g_pmdo.* TO NULL
         
         #先塞入原本資料(變更前的資料)
         EXECUTE s_aic_carry_pmdo_temp_pre USING g_pmdn.pmdnseq,l_xmdd.xmddseq1,l_xmdd.xmddseq2
         INTO g_pmdo.*
         
         LET g_pmdo.pmdosite = g_pmdl.pmdlsite
         LET g_pmdo.pmdodocno = g_pmdl.pmdldocno
         LET g_pmdo.pmdoseq = g_pmdn.pmdnseq
         LET g_pmdo.pmdoseq1 = l_xmdd.xmddseq1
         LET g_pmdo.pmdoseq2 = l_xmdd.xmddseq2
         LET g_pmdo.pmdo001 = l_xmdd.xmdd001
         LET g_pmdo.pmdo002 = l_xmdd.xmdd002
         LET g_pmdo.pmdo003 = l_xmdd.xmdd003
         LET g_pmdo.pmdo004 = l_xmdd.xmdd004
         LET g_pmdo.pmdo005 = l_xmdd.xmdd005
         LET g_pmdo.pmdo006 = l_xmdd.xmdd006
         LET g_pmdo.pmdo007 = l_xmdd.xmdd007
         LET g_pmdo.pmdo008 = l_xmdd.xmdd008
         LET g_pmdo.pmdo009 = l_xmdd.xmdd009
         LET g_pmdo.pmdo010 = l_xmdd.xmdd010    
        #160713-00016#1-s-mark
         #LET g_pmdo.pmdo011 = g_pmdn.pmdn012   
         #LET g_pmdo.pmdo012 = g_pmdn.pmdn013
         #LET g_pmdo.pmdo013 = g_pmdn.pmdn014
        #160713-00016#1-e-mark
        #160713-00016#1-s-add
        #由到庫日回推出貨日、到廠日
         CALL s_aic_carry_get_time(g_pmdn.pmdnsite,g_pmdo.pmdo001,l_xmdd.xmdd012)
           RETURNING l_pmdn012,l_pmdn013        
         LET g_pmdo.pmdo011 = l_xmdd.xmdd011   
         LET g_pmdo.pmdo012 = l_pmdn013
         LET g_pmdo.pmdo013 = l_xmdd.xmdd012        
        #160713-00016#1-e-add
        #LET g_pmdo.pmdo014 = 'N'             #171212-00048#1 mark
         LET g_pmdo.pmdo014 = l_xmdd.xmdd013  #171212-00048#1 add
                  
         LET g_pmdo.pmdo022 = g_pmdn.pmdn015
         LET g_pmdo.pmdo023 = g_pmdn.pmdn016
         LET g_pmdo.pmdo024 = g_pmdn.pmdn017
         
         LET g_pmdo.pmdo028 = l_xmdd.xmdd024
         LET g_pmdo.pmdo029 = l_xmdd.xmdd025
         LET g_pmdo.pmdo030 = l_xmdd.xmdd026
         LET g_pmdo.pmdo031 = l_xmdd.xmdd027

         #170929-00031#1-s add
         #多角拋轉產生的訂單,採購單中交期明細裡的資料中子件特性若為5.附屬零件,6.備品,7.包裝容器,9.樣品,價格設定為0
         IF g_pmdo.pmdo003 MATCHES '[56789]' THEN
            LET g_pmdo.pmdo022 = 0
         END IF
         #170929-00031#1-e add 
         
         #已收貨量
         IF cl_null(g_pmdo.pmdo015) THEN
            LET g_pmdo.pmdo015 = 0
         END IF
         
         #驗退量
         IF cl_null(g_pmdo.pmdo016) THEN
            LET g_pmdo.pmdo016 = 0
         END IF
         
         #倉退換貨量
         IF cl_null(g_pmdo.pmdo017) THEN
            LET g_pmdo.pmdo017 = 0
         END IF
         
         #已入庫量
         IF cl_null(g_pmdo.pmdo019) THEN
            LET g_pmdo.pmdo019 = 0
         END IF
         
         #倉退量
         IF cl_null(g_pmdo.pmdo040) THEN
            LET g_pmdo.pmdo040 = 0
         END IF
         
         #取得未稅金額、含稅金額、稅額
         CALL s_aic_carry_tax1(g_pmdo.pmdosite,g_pmdo.pmdo031,g_pmdo.pmdo022,g_pmdo.pmdo023,g_pmdl.pmdl015,g_pmdl.pmdl016)
         RETURNING g_pmdo.pmdo032,g_pmdo.pmdo033,g_pmdo.pmdo034
         
         INSERT INTO pmdo_t (pmdoent,pmdosite,pmdodocno,
                             pmdoseq,pmdoseq1,pmdoseq2,
                             pmdo001,pmdo002,pmdo003,pmdo004,pmdo005,
                             pmdo006,pmdo007,pmdo008,pmdo009,pmdo010,
                             pmdo011,pmdo012,pmdo013,pmdo014,pmdo015,
                             pmdo016,pmdo017,pmdo019,pmdo020,
                             pmdo021,pmdo022,pmdo023,pmdo024,pmdo025,
                             pmdo026,pmdo027,pmdo028,pmdo029,pmdo030,
                             pmdo031,pmdo032,pmdo033,pmdo034,pmdo035,
                             pmdo036,pmdo037,pmdo038,pmdo039,pmdo040)
         VALUES (g_enterprise,g_pmdo.pmdosite,g_pmdo.pmdodocno,
                 g_pmdo.pmdoseq,g_pmdo.pmdoseq1,g_pmdo.pmdoseq2,
                 g_pmdo.pmdo001,g_pmdo.pmdo002,g_pmdo.pmdo003,g_pmdo.pmdo004,g_pmdo.pmdo005,
                 g_pmdo.pmdo006,g_pmdo.pmdo007,g_pmdo.pmdo008,g_pmdo.pmdo009,g_pmdo.pmdo010,
                 g_pmdo.pmdo011,g_pmdo.pmdo012,g_pmdo.pmdo013,g_pmdo.pmdo014,g_pmdo.pmdo015,
                 g_pmdo.pmdo016,g_pmdo.pmdo017,g_pmdo.pmdo019,g_pmdo.pmdo020,
                 g_pmdo.pmdo021,g_pmdo.pmdo022,g_pmdo.pmdo023,g_pmdo.pmdo024,g_pmdo.pmdo025,
                 g_pmdo.pmdo026,g_pmdo.pmdo027,g_pmdo.pmdo028,g_pmdo.pmdo029,g_pmdo.pmdo030,
                 g_pmdo.pmdo031,g_pmdo.pmdo032,g_pmdo.pmdo033,g_pmdo.pmdo034,g_pmdo.pmdo035,
                 g_pmdo.pmdo036,g_pmdo.pmdo037,g_pmdo.pmdo038,g_pmdo.pmdo039,g_pmdo.pmdo040)
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:pmdo_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #170105-00050#5-s-mark
         ##170105-00050#2-s-add 
         ##先判斷，來源是否為預先訂單
         #IF g_aic_source MATCHES "[12]" THEN
         #   #取得前一張單回寫的數量
         #   LET l_xmdd014 = 0
         #   SELECT DISTINCT xmdd014 INTO l_xmdd014
         #     FROM xmda_t,xmdd_t
         #    WHERE xmdaent = xmddent          AND xmdadocno = xmdddocno 
         #      AND xmdaent = g_enterprise     AND xmda031 = g_pre_aic
         #      AND xmddseq = g_pmdn.pmdn060   #以單身來源項次為準
         #      AND xmddseq1 = g_pmdo.pmdoseq1 AND xmddseq2 = g_pmdo.pmdoseq2
         #    ORDER BY xmdd014 DESC                
         #   #將數量，回寫至對應的預先採購單
         #   UPDATE pmdo_t SET pmdo015 = l_xmdd014, #已收貨量
         #                     pmdo019 = l_xmdd014  #已入庫量
         #    WHERE pmdoent = g_enterprise AND pmdoseq = g_pmdn.pmdn060 #以單身來源項次為準
         #      AND pmdoseq1 = g_pmdo.pmdoseq1 AND pmdoseq2 = g_pmdo.pmdoseq2
         #      AND pmdodocno = (SELECT pmdldocno FROM pmdl_t WHERE pmdlent = g_enterprise
         #                          AND pmdlsite = g_pmdo.pmdosite AND pmdl031 = g_pre_aic)
         #   IF SQLCA.sqlcode  THEN
         #      INITIALIZE g_errparam TO NULL
         #      LET g_errparam.extend = "UPDATE:pmdo_t"
         #      LET g_errparam.code   = SQLCA.sqlcode
         #      LET g_errparam.popup  = TRUE
         #      CALL cl_err()
         #      LET r_success = FALSE
         #      EXIT FOREACH
         #   END IF
         #END IF
         #170105-00050#2-e-add
         #170105-00050#5-e-mark
         
         #塞pmdp_t
         LET l_cnt = 0 
         SELECT COUNT(*) INTO l_cnt
           FROM pmdp_t
          WHERE pmdpent = g_enterprise
            AND pmdpdocno = g_pmdl.pmdldocno
            AND pmdpseq = g_pmdo.pmdoseq
            AND pmdpseq1 = g_pmdo.pmdoseq1
         #170915-00041#1--add---begin----
         LET l_pmdp023 = 0
         IF g_pmdn.pmdn024 ='Y' THEN
           SELECT SUM(xmdd006) INTO l_pmdp023 FROM xmdd_t
             WHERE xmddent = g_enterprise
               AND xmdddocno = p_xmdadocno
               AND xmddseq = g_pmdn.pmdnseq
         END IF   
         #170915-00041#1---add----end----   

         IF l_cnt = 0 OR cl_null(l_cnt) THEN
            INITIALIZE g_pmdp.* TO NULL
            
            LET g_pmdp.pmdpsite = g_pmdl.pmdlsite
            LET g_pmdp.pmdpdocno = g_pmdl.pmdldocno
            LET g_pmdp.pmdpseq = g_pmdo.pmdoseq
            LET g_pmdp.pmdpseq1 = g_pmdo.pmdoseq1
            
            LET g_pmdp.pmdp001 = g_pmdn.pmdn001
            LET g_pmdp.pmdp002 = g_pmdn.pmdn002
            
            #IF g_prog = 'apmt501' THEN   #委外工單   150421---earl---add   #170301-00021#3 by 09263 --mark
            IF g_prog MATCHES 'apmt501*' THEN   #委外工單   #170301-00021#3 by 09263 --add
               SELECT sfaadocno
                 INTO g_pmdp.pmdp003
                 FROM sfaa_t
                WHERE sfaaent = g_enterprise
                  AND sfaa006 = p_xmdadocno      #來源單號
                  AND sfaa007 = g_pmdn.pmdnseq   #來源項次
               #  AND sfaa008 = l_xmdd.xmddseq1  #來源項序     #160523-00018#1 mark
               #  AND sfaa063 = l_xmdd.xmddseq2  #來源分批序   #160523-00018#1 mark
                  AND sfaastus <> 'X'
                  
               LET g_pmdp.pmdp004 = 0
               LET g_pmdp.pmdp005 = 0
               LET g_pmdp.pmdp006 = 0
            ELSE
               LET g_pmdp.pmdp003 = p_xmdadocno
               LET g_pmdp.pmdp004 = g_pmdn.pmdnseq
               LET g_pmdp.pmdp005 = l_xmdd.xmddseq1
               LET g_pmdp.pmdp006 = l_xmdd.xmddseq2
            END IF
            
            LET g_pmdp.pmdp007 = l_xmdd.xmdd001
            LET g_pmdp.pmdp008 = l_xmdd.xmdd002
            
            LET g_pmdp.pmdp021 = '1'
            LET g_pmdp.pmdp022 = l_xmdd.xmdd004
            #170915-00041#1--add----begin---
            #当有分批序时将来源数量汇总写入第一个分批序中
            IF g_pmdn.pmdn024 ='Y' THEN
             LET g_pmdp.pmdp023 = l_pmdp023
             LET g_pmdp.pmdp024 = l_pmdp023
            ELSE
             LET g_pmdp.pmdp023 = l_xmdd.xmdd006
             LET g_pmdp.pmdp024 = l_xmdd.xmdd006
            END IF 
            #170915-00041#1---add---end----
            
            #先塞入原本資料(變更前的資料)
            EXECUTE s_aic_carry_pmdp_temp_pre USING g_pmdo.pmdoseq,g_pmdp.pmdp003,g_pmdp.pmdp004,g_pmdp.pmdp005,g_pmdp.pmdp006
            INTO g_pmdp.pmdp025,g_pmdp.pmdp026
            
            IF cl_null(g_pmdp.pmdp025) THEN
               LET g_pmdp.pmdp025 = 0
            END IF
            
            IF cl_null(g_pmdp.pmdp026) THEN
               LET g_pmdp.pmdp026 = 0
            END IF
            
            INSERT INTO pmdp_t (pmdpent,pmdpsite,pmdpdocno,pmdpseq,pmdpseq1,
                                pmdp001,pmdp002,pmdp003,pmdp004,pmdp005,
                                pmdp006,pmdp007,pmdp008,pmdp009,pmdp010,
                                pmdp011,pmdp012,
                                pmdp021,pmdp022,pmdp023,pmdp024,pmdp025,
                                pmdp026)
            VALUES (g_enterprise,g_pmdp.pmdpsite,g_pmdp.pmdpdocno,g_pmdp.pmdpseq,g_pmdp.pmdpseq1,
                    g_pmdp.pmdp001,g_pmdp.pmdp002,g_pmdp.pmdp003,g_pmdp.pmdp004,g_pmdp.pmdp005,
                    g_pmdp.pmdp006,g_pmdp.pmdp007,g_pmdp.pmdp008,g_pmdp.pmdp009,g_pmdp.pmdp010,
                    g_pmdp.pmdp011,g_pmdp.pmdp012,
                    g_pmdp.pmdp021,g_pmdp.pmdp022,g_pmdp.pmdp023,g_pmdp.pmdp024,g_pmdp.pmdp025,
                    g_pmdp.pmdp026)
            
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "INSERT:pmdp_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END IF
      END FOREACH
   
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      OPEN s_aic_carry_xmdf_cs USING g_pmdn.pmdnseq
      FOREACH s_aic_carry_xmdf_cs INTO l_xmdf.xmdfseq2,
                                       l_xmdf.xmdf002,l_xmdf.xmdf003,l_xmdf.xmdf004,l_xmdf.xmdf005,
                                       l_xmdf.xmdf006,l_xmdf.xmdf007
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_xmdf_cs"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         
            
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      
         #塞g_pmdq
         INITIALIZE g_pmdq.* TO NULL
         
         #先塞入原本資料(變更前的資料)
         EXECUTE s_aic_carry_pmdq_temp_pre USING g_pmdn.pmdnseq,l_xmdf.xmdfseq2
         INTO g_pmdq.*
         
         LET g_pmdq.pmdqsite = g_pmdl.pmdlsite
         LET g_pmdq.pmdqdocno = g_pmdl.pmdldocno
         LET g_pmdq.pmdqseq = g_pmdn.pmdnseq
         
         LET g_pmdq.pmdqseq2 = l_xmdf.xmdfseq2
         LET g_pmdq.pmdq002 = l_xmdf.xmdf002
         LET g_pmdq.pmdq003 = l_xmdf.xmdf003
         LET g_pmdq.pmdq004 = l_xmdf.xmdf004
         LET g_pmdq.pmdq005 = l_xmdf.xmdf004
         LET g_pmdq.pmdq006 = l_xmdf.xmdf005
         LET g_pmdq.pmdq007 = l_xmdf.xmdf006
         LET g_pmdq.pmdq008 = l_xmdf.xmdf007
         
         INSERT INTO pmdq_t (pmdqent,pmdqsite,pmdqdocno,
                             pmdqseq,pmdqseq2,
                             pmdq002,pmdq003,pmdq004,pmdq005,
                             pmdq006,pmdq007,pmdq008)
         VALUES (g_enterprise,g_pmdq.pmdqsite,g_pmdq.pmdqdocno,
                 g_pmdq.pmdqseq,g_pmdq.pmdqseq2,
                 g_pmdq.pmdq002,g_pmdq.pmdq003,g_pmdq.pmdq004,g_pmdq.pmdq005,
                 g_pmdq.pmdq006,g_pmdq.pmdq007,g_pmdq.pmdq008)
      
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:pmdq_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
      
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
   END FOREACH

   #170105-00050#5-s-add
   #先判斷，來源是否為預先採購單
   IF g_aic_source MATCHES "[12]" AND r_success THEN
      #更新預先採購單的資料
      CALL s_aic_carry_pre_po_upd('1',g_pmdl.pmdlsite,g_pmdl.pmdl031) RETURNING r_success
      IF NOT r_success THEN
         RETURN r_success
      END IF
   END IF
   #170105-00050#5-e-add
   
   IF NOT r_success THEN
      RETURN r_success
   ELSE

      #重新計算整單的未稅、含稅總金額
      CALL s_aic_carry_return_amount(g_pmdl.pmdldocno)
      RETURNING g_pmdl.pmdl040,g_pmdl.pmdl042,g_pmdl.pmdl041
      
      UPDATE pmdl_t
         SET pmdl040 = g_pmdl.pmdl040,
             pmdl042 = g_pmdl.pmdl042,
             pmdl041 = g_pmdl.pmdl041
       WHERE pmdlent = g_enterprise
         AND pmdldocno = g_pmdl.pmdldocno
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE:pmdl_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success
      END IF

   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 最終站採購單變更upd
# Memo...........:
# Usage..........: CALL s_aic_carry_last_po_upd(p_xmdadocno,p_firstpmdldocno,p_pmdl031,p_pmdlsite)
#                  RETURNING r_success
# Input parameter: p_xmdadocno      #來源訂單單號
#                : p_firstpmdldocno #初始採購單號
#                : p_pmdl031        #多角序號
#                : p_pmdlsite       #營運據點
# Return code....: r_success        #執行結果
#                : r_pmdldocno      #採購單號
# Date & Author..: 150826 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_last_po_upd(p_xmdadocno,p_firstpmdldocno,p_pmdl031,p_pmdlsite)
   DEFINE p_xmdadocno        LIKE xmda_t.xmdadocno   #來源訂單單號
   DEFINE p_firstpmdldocno   LIKE pmdl_t.pmdldocno   #初始採購單號
   DEFINE p_pmdl031          LIKE pmdl_t.pmdl031     #多角序號
   DEFINE p_pmdlsite         LIKE pmdl_t.pmdlsite    #營運據點
   DEFINE r_success          LIKE type_t.num5        #執行結果
   DEFINE r_pmdldocno        LIKE sfaa_t.sfaadocno   #產生之採購單單號

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_pmdldocno = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_xmdadocno) OR
  #   cl_null(p_pmdl031) OR
  #   cl_null(p_pmdlsite) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_last_po_upd"
  #   LET g_errparam.code   = "sub-268"   #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdldocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_xmdadocno) THEN
      LET g_colname_1 = cl_getmsg("sub-01491",g_dlang)   #來源訂單單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_pmdl031) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq100","lbl_xmda031") RETURNING g_colname_1,g_comment_1   #多角序號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_pmdlsite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #營運據點
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
      RETURN r_success,r_pmdldocno
   END IF
  #170816-00007#31 -E add

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #塞pmdl_t
   INITIALIZE g_pmdl.* TO NULL
   
   #SELECT 原始採購單資料
   SELECT * INTO g_pmdl.*
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdl031 = p_pmdl031
      AND pmdlsite = p_pmdlsite
      AND pmdlstus <> 'X'
      
   #160831-00006#1-s-add
   IF cl_null(g_pmdl.pmdldocno) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno   
   END IF
   #160831-00006#1-e-add
   
   LET r_pmdldocno = g_pmdl.pmdldocno
   
   #SELECT 初始採購單資料
   SELECT pmdl052 INTO g_pmdl.pmdl052
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = p_firstpmdldocno

   LET g_pmdl.pmdl004 = g_pmdl.pmdl052    #最終供應商代號
   LET g_pmdl.pmdl021 = g_pmdl.pmdl052    #付款供應商
   LET g_pmdl.pmdl022 = g_pmdl.pmdl052    #送貨供應商

   #抓取交易對象聯絡人明細檔的聯絡對像識別碼，若有設置多個聯絡人，則取有勾選主要聯絡人的那一個
   CALL s_aic_carry_get_contact(g_pmdl.pmdl052) RETURNING r_success,g_pmdl.pmdl027
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   #SELECT 來源訂單資料
   SELECT xmdadocdt,xmda001,
          xmda034
     INTO g_pmdl.pmdldocdt,g_pmdl.pmdl001,
          g_pmdl.pmdl032
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmdadocno = p_xmdadocno
   
   LET g_pmdl.pmdlmodid = g_user
   LET g_pmdl.pmdlmoddt = cl_get_current()

   #取匯率
   CALL s_aic_carry_exchange(g_pmdl.pmdl054,g_pmdl.pmdlsite,g_pmdl.pmdldocdt,g_pmdl.pmdl015,'','2')
   RETURNING r_success,g_pmdl.pmdl016
   IF NOT r_success THEN
      RETURN r_success,r_pmdldocno
   END IF

   UPDATE pmdl_t
      SET (pmdl052,
           pmdl004,pmdl021,pmdl022,
           pmdl027,
           pmdldocdt,pmdl001,
           pmdl032,
           pmdlmodid,pmdlmoddt,
           pmdl016)
        = (g_pmdl.pmdl052,
           g_pmdl.pmdl004,g_pmdl.pmdl021,g_pmdl.pmdl022,
           g_pmdl.pmdl027,
           g_pmdl.pmdldocdt,g_pmdl.pmdl001,
           g_pmdl.pmdl032,
           g_pmdl.pmdlmodid,g_pmdl.pmdlmoddt,
           g_pmdl.pmdl016)
     WHERE pmdlent = g_enterprise             #160831-00006#1 add
       AND pmdldocno = g_pmdl.pmdldocno       #160831-00006#1 add       
              
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "UPDATE pmdl_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
   
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #INSERT 單身
   CALL s_aic_carry_body_po(p_xmdadocno,'2','','','') RETURNING r_success

   IF r_success THEN
      #回寫s_aic_carry_tri_po回推單價
      CALL s_aic_carry_update_price(g_pmdl.pmdl051,g_pmdl.pmdl031) RETURNING r_success
      IF NOT r_success THEN
         RETURN r_success,r_pmdldocno
      END IF
   END IF

   RETURN r_success,r_pmdldocno
END FUNCTION

################################################################################
# Descriptions...: 製造批序號檢查
# Memo...........:
# Usage..........: CALL s_aic_carry_lot_chk(p_icaa001)
#                  RETURNING r_success
# Input parameter: p_icaa001    多角流程代碼
#                : 
# Return code....: r_success    執行結果
#                : 
# Date & Author..: 151110 By earl
# Modify.........: 151228 By earl修改~這個不要再用了
################################################################################
PUBLIC FUNCTION s_aic_carry_lot_chk(p_icaa001)
   DEFINE p_icaa001        LIKE icaa_t.icaa001
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_icaa003        LIKE icaa_t.icaa003
   DEFINE l_icab003_first  LIKE icab_t.icab003
   DEFINE l_icab003_final  LIKE icab_t.icab003
   DEFINE l_first          LIKE type_t.chr80
   DEFINE l_final          LIKE type_t.chr80
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
#   IF NOT cl_null(p_icaa001) THEN
#      LET l_icaa003 = ''
#      LET l_icab003_first = ''
#      LET l_icab003_final = ''
#      SELECT icaa003,a.icab003,b.icab003
#        INTO l_icaa003,l_icab003_first,l_icab003_final
#        FROM icaa_t,icab_t a,icab_t b
#       WHERE icaaent = a.icabent AND a.icabent = b.icabent AND b.icabent = g_enterprise
#         AND icaa001 = a.icab001 AND a.icab001 = b.icab001 AND b.icab001 = p_icaa001
#         AND a.icab002 = '0'
#         AND b.icab002 = (SELECT MAX(c.icab002) FROM icab_t c WHERE c.icabent = icaaent AND c.icab001 = icaa001)
#      
#      LET l_final = ''
#      LET l_final = ''
#      
#      CASE l_icaa003
#         WHEN '1' #1:銷售
#            CALL cl_get_para(g_enterprise,l_icab003_first,'S-BAS-0048') RETURNING l_first  #初始出貨
#            CALL cl_get_para(g_enterprise,l_icab003_final,'S-BAS-0048') RETURNING l_final  #最終出貨
#            
#            IF l_first <> l_final THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = ""
#               LET g_errparam.code   = 'aic-00197'  #初始站'%1'之"出貨通知單進行製造批序號控管"設定與最終站'%2'之"出貨通知單進行製造批序號控管"設定不同！
#               LET g_errparam.popup  = TRUE
#               LET g_errparam.replace[1] = l_icab003_first
#               LET g_errparam.replace[2] = l_icab003_final
#               CALL cl_err()   
#               
#               LET r_success = FALSE
#            END IF
#         WHEN '2' #2:代採購
#            CALL cl_get_para(g_enterprise,l_icab003_first,'S-BAS-0049') RETURNING l_first  #初始入庫
#            CALL cl_get_para(g_enterprise,l_icab003_first,'S-BAS-0048') RETURNING l_final  #最終出貨
#            
#            IF l_first <> l_final THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = ""
#               LET g_errparam.code   = 'aic-00198'  #初始站'%1'之"收貨單進行製造批序號控管"設定與最終站'%2'之"出貨通知單進行製造批序號控管"設定不同！
#               LET g_errparam.popup  = TRUE
#               LET g_errparam.replace[1] = l_icab003_first
#               LET g_errparam.replace[2] = l_icab003_final
#               CALL cl_err()   
#               
#               LET r_success = FALSE
#            END IF
#         WHEN '3' #3:採購指定最終供應商
#            CALL cl_get_para(g_enterprise,l_icab003_first,'S-BAS-0049') RETURNING l_first  #初始入庫
#            CALL cl_get_para(g_enterprise,l_icab003_first,'S-BAS-0049') RETURNING l_final  #最終入庫
#            
#            IF l_first <> l_final THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.extend = ""
#               LET g_errparam.code   = 'aic-00199'  #初始站'%1'之"收貨單進行製造批序號控管"設定與最終站'%2'之"收貨單進行製造批序號控管"設定不同！
#               LET g_errparam.popup  = TRUE
#               LET g_errparam.replace[1] = l_icab003_first
#               LET g_errparam.replace[2] = l_icab003_final
#               CALL cl_err()   
#               
#               LET r_success = FALSE
#            END IF
#      END CASE
#   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: INSERT製造批序號
# Memo...........:
# Usage..........: CALL s_aic_carry_inao_ins(p_inaodocno,p_inaoseq,p_inaoseq1,p_site,p_docno,p_inao003,p_inao005,p_inao006,p_inao013,p_type)
#                  RETURNING r_success
# Input parameter: p_inaodocno 來源單號
#                : p_inaoseq   來源項次
#                : p_inaoseq1  來源項序
#                : p_site      目的營運據點
#                : p_docno     目的單號
#                : p_inao003   庫存管理特徵
#                : p_inao005   目的庫位
#                : p_inao006   目的儲位
#                : p_inao013   目的入庫碼:'1:入庫'、'-1出庫'
#                : p_type      單據型態:1.出貨 2.入庫
# Return code....: r_success   執行結果
#                : 
# Date & Author..: 150917-00001#4 151120 earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_inao_ins(p_inaodocno,p_inaoseq,p_inaoseq1,p_site,p_docno,p_inao003,p_inao005,p_inao006,p_inao013,p_type)
   DEFINE p_inaodocno   LIKE inao_t.inaodocno  #來源單號
   DEFINE p_inaoseq     LIKE inao_t.inaoseq    #來源項次
   DEFINE p_inaoseq1    LIKE inao_t.inaoseq1   #來源項序
   DEFINE p_site        LIKE inao_t.inaosite   #目的營運據點
   DEFINE p_docno       LIKE inao_t.inaodocno  #目的單號
   DEFINE p_inao003     LIKE inao_t.inao003    #庫存管理特徵
   DEFINE p_inao005     LIKE inao_t.inao005    #目的庫位
   DEFINE p_inao006     LIKE inao_t.inao006    #目的儲位
   DEFINE p_inao013     LIKE inao_t.inao013    #目的出入庫碼:1.入庫 -1.出庫
   DEFINE p_type        LIKE type_t.chr1       #單據型態:1.出貨 2.入庫
   DEFINE r_success     LIKE type_t.num5       #執行結果
   DEFINE l_imaf071     LIKE imaf_t.imaf071    #151228 earl add
   DEFINE l_imaf081     LIKE imaf_t.imaf081    #151228 earl add
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
  #170816-00007#31 -S mark
  #IF cl_null(p_inaodocno) OR cl_null(p_inaoseq) OR cl_null(p_inaoseq1) OR
  #   cl_null(p_site) OR cl_null(p_docno) OR 
  #   cl_null(p_inao013) OR cl_null(p_type) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_inao_ins"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inaodocno) THEN
      LET g_colname_1 = cl_getmsg("adb-00472",g_dlang)    #來源單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_inaoseq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01486",g_dlang)   #來源項次
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_inaoseq1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01487",g_dlang)   #來源項序
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_site) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01489",g_dlang)   #目的營運據點
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_docno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01490",g_dlang)   #目的單號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_inao013) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("axcq912","lbl_b_xcck009") RETURNING g_colname_1,g_comment_1   #目的出入庫碼:1.入庫 -1.出庫
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_type) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01477",g_dlang)   #單據型態
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
      RETURN r_success
   END IF
  #170816-00007#31 -E add
   
   #庫存管理特徵
   IF cl_null(p_inao003) THEN
      LET p_inao003 = ' '
   END IF
   #目的庫位
   IF cl_null(p_inao005) THEN
      LET p_inao005 = ' '
   END IF
   #目的儲位
   IF cl_null(p_inao006) THEN
      LET p_inao006 = ' '
   END IF
   
   #SELECT FROM inao_t
   LET g_sql = "SELECT * ",
               "  FROM inao_t",
               " WHERE inaoent = ",g_enterprise,
               "   AND inaodocno = '",p_inaodocno,"'",
               "   AND inaoseq = '",p_inaoseq,"'",
               "   AND inaoseq1 = '",p_inaoseq1,"'"
   PREPARE s_aic_carry_produce_inao_pre FROM g_sql
   DECLARE s_aic_carry_produce_inao_cs CURSOR WITH HOLD FOR s_aic_carry_produce_inao_pre
   
   INITIALIZE g_inao.* TO NULL
   FOREACH s_aic_carry_produce_inao_cs INTO g_inao.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH s_aic_carry_produce_inao_cs"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #151228 earl add s
      CALL s_aic_carry_imaf071_imaf081_sel(p_site,g_inao.inao001) RETURNING l_imaf071,l_imaf081
      
      #不可有批號且不可有序號
      IF l_imaf071 = '2' AND l_imaf081 = '2' THEN
         CONTINUE FOREACH
      END IF
      
      #不可有批號且無序號
      IF l_imaf071 = '2' AND cl_null(g_inao.inao009) THEN
         CONTINUE FOREACH
      END IF
      
      #無批號且不可有序號
      IF cl_null(g_inao.inao008) AND l_imaf081 = '2' THEN
         CONTINUE FOREACH
      END IF
      #151228 earl add e
      
      LET g_inao.inaosite = p_site
      LET g_inao.inaodocno = p_docno
      LET g_inao.inao003 = p_inao003   #庫存管理特徵
      LET g_inao.inao005 = p_inao005   #庫位
      LET g_inao.inao006 = p_inao006   #儲位
      LET g_inao.inao013 = p_inao013   #出入庫碼
      LET g_inao.inao021 = 0           #已入庫/出貨/簽收量
      LET g_inao.inao022 = 0           #已驗退/簽退量
      LET g_inao.inao023 = 0           #已倉退/銷退量
      LET g_inao.inao024 = 0           #已轉QC量

      INSERT INTO inao_t VALUES g_inao.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INSERT:inao_t" 
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         LET r_success = FALSE
         EXIT FOREACH
      END IF
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: UPDATE無訂單出貨單及無採購收貨入庫單之單價(統銷統收、統購統付)
# Memo...........:
# Usage..........: CALL s_aic_carry_unite_price_upd(p_type,p_docno)
#                  RETURNING r_success
# Input parameter: p_type    1.統銷統收 2.統購統付
#                : p_docno   最終站出貨單號(統銷統收)、最終站收貨入庫單號(統購統付)
# Return code....: r_success 執行結果
#                : 
# Date & Author..: 151202 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_unite_price_upd(p_type,p_docno)
   DEFINE p_type           LIKE type_t.chr1      #1.統銷統收 2.統購統付
   DEFINE p_docno          LIKE pmds_t.pmdsdocno #最終站出貨單號(統銷統收)、最終站收貨入庫單號(統購統付)
   DEFINE r_success        LIKE type_t.num5
   
   DEFINE l_docno          LIKE pmds_t.pmdsdocno
   DEFINE l_pmds041        LIKE pmds_t.pmds041   #多角流程序號
   DEFINE l_pmds053        LIKE pmds_t.pmds053
   DEFINE l_modify         LIKE type_t.num5       #單價是否有修改
   DEFINE l_exchange       LIKE pmdl_t.pmdl016
   
   DEFINE l_pmds037_first  LIKE pmds_t.pmds037    #初始站幣別
   DEFINE l_pmds037_before LIKE pmds_t.pmds037    #前站幣別
   
   DEFINE l_first     DYNAMIC ARRAY OF RECORD
             pmdt036       LIKE pmdt_t.pmdt036    #初始站單價
                      END RECORD
   DEFINE l_before    DYNAMIC ARRAY OF RECORD 
             pmdt036       LIKE pmdt_t.pmdt036    #前站單價
                      END RECORD
   
   DEFINE l_pmds      RECORD
             icab002       LIKE icab_t.icab002,
             pmdssite      LIKE pmds_t.pmdssite,
             pmdsdocno     LIKE pmds_t.pmdsdocno,
             pmdsdocdt     LIKE pmds_t.pmdsdocdt,
             pmds001       LIKE pmds_t.pmds001,
             pmds035       LIKE pmds_t.pmds035,
             pmds037       LIKE pmds_t.pmds037,
             pmds048       LIKE pmds_t.pmds048
                      END RECORD
   DEFINE l_pmdt      RECORD
             pmdtseq        LIKE pmdt_t.pmdtseq,
             pmdt006        LIKE pmdt_t.pmdt006,
             pmdt007        LIKE pmdt_t.pmdt007,
             pmdt036        LIKE pmdt_t.pmdt036,
             pmdt024        LIKE pmdt_t.pmdt024,
             pmdt046        LIKE pmdt_t.pmdt046
                      END RECORD
   DEFINE l_icab002_next    LIKE icab_t.icab002
   DEFINE l_icab003_next    LIKE icab_t.icab003
   
   DEFINE l_pmdt038         LIKE pmdt_t.pmdt038
   DEFINE l_pmdt047         LIKE pmdt_t.pmdt047
   DEFINE l_pmdt039         LIKE pmdt_t.pmdt039
   DEFINE l_pmds043         LIKE pmds_t.pmds043
   DEFINE l_pmds046         LIKE pmds_t.pmds046
   DEFINE l_pmds044         LIKE pmds_t.pmds044

   DEFINE l_xmdkdocno      LIKE xmdk_t.xmdkdocno  #後站出貨單號
   DEFINE l_sql1       STRING     #160428-00006#4 add


   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET l_docno = ''           #初始站單號
   LET l_pmds041 = ''         #多角流程序號
   LET l_pmds053 = ''         #多角流程代碼
   LET l_pmds037_first  = ''  #初始站幣別
   LET l_pmds037_before = ''  #前站幣別
   CALL l_first.clear()
   CALL l_before.clear()
   
   ##==##統銷統收(逆拋)(1:銷售)-計價基準(1:依來源營運據點2:依上游供應商)
   ##==##統購統付(正拋)(3:採購指定最終供應商)-計價基準(3:依最終供應商逆推4:依下游供應商單價逆推)
      
   IF p_type = '1' THEN  
      #1.統銷統收   
     
      #出貨單
      SELECT xmdkdocno,xmdk016
        INTO l_docno,l_pmds037_first
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdk035 = p_docno
      
      IF cl_null(l_docno) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = 'aic-00208'  #統銷統收查無初始站對應之出貨單！
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      
      SELECT xmdk035,xmdk044
        INTO l_pmds041,l_pmds053
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_docno

      #160428-00006#4-s-add
      #(正拋)
      LET l_sql1 = "SELECT icab002,",
                  "       pmdssite,pmdsdocno,pmdsdocdt,",
                  "       pmds001,pmds035,pmds037,pmds048",          
                  "  FROM icab_t,pmds_t",
                  " WHERE icabent = pmdsent AND pmdsent = ",g_enterprise,
                  "   AND icab001 = '",l_pmds053,"'",
                  "   AND icab003 = pmdssite",
                  "   AND pmds041 = '",l_pmds041,"'",
                  " ORDER BY icab002" 
     
      LET g_sql = "SELECT xmdlseq,xmdl008,xmdl009,xmdl024,xmdl022,xmdl025",
                  "  FROM xmdl_t",
                  " WHERE xmdlent = ",g_enterprise,
                  "   AND xmdldocno = '",l_docno,"'"
   ELSE   
      #2.統購統付   
     
      #入庫單
      SELECT pmdsdocno,pmds037
        INTO l_docno,l_pmds037_first
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmds041 = p_docno
      
      IF cl_null(l_docno) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = 'aic-00209'  #統購統付查無初始站對應之收貨入庫單！
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF

      SELECT pmds041,pmds053
        INTO l_pmds041,l_pmds053
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmdsdocno = p_docno

      #160428-00006#4-s-add
      #(逆拋)
      LET l_sql1 = "SELECT icab002,",
                  "       pmdssite,pmdsdocno,pmdsdocdt,",
                  "       pmds001,pmds035,pmds037,pmds048",          
                  "  FROM icab_t,pmds_t",
                  " WHERE icabent = pmdsent AND pmdsent = ",g_enterprise,
                  "   AND icab001 = '",l_pmds053,"'",
                  "   AND icab003 = pmdssite",
                  "   AND pmds041 = '",l_pmds041,"'",
                  " ORDER BY icab002 DESC "      

      LET g_sql = "SELECT pmdtseq,pmdt006,pmdt007,pmdt036,pmdt024,pmdt046",
                  "  FROM pmdt_t",
                  " WHERE pmdtent = ",g_enterprise,
                  "   AND pmdtdocno = '",l_docno,"'"
   END IF
   
   PREPARE s_aic_carry_pmdt_pre6 FROM g_sql
   DECLARE s_aic_carry_pmdt_cs6 CURSOR FOR s_aic_carry_pmdt_pre6
   
  #160428-00006#4-s-add
   PREPARE s_aic_carry_icab_pre3 FROM l_sql1
   DECLARE s_aic_carry_icab_cs3 CURSOR FOR s_aic_carry_icab_pre3
  #160428-00006#4-e-add   
   
   
   LET l_pmds037_before = l_pmds037_first  #前站幣別
   
   #紀錄單身項次、單價、計價數量、稅別
   FOREACH s_aic_carry_pmdt_cs6 INTO l_pmdt.pmdtseq,l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt036,l_pmdt.pmdt024,l_pmdt.pmdt046
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_pmdt_cs6"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF         
      LET l_first[l_pmdt.pmdtseq].pmdt036 = l_pmdt.pmdt036    #初始站單價
      LET l_before[l_pmdt.pmdtseq].pmdt036 = l_pmdt.pmdt036   #前站單價
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success
   END IF
  
  #160428-00006#4-s-mark 
  #LET g_sql = "SELECT icab002,",
  #            "       pmdssite,pmdsdocno,pmdsdocdt,",
  #            "       pmds001,pmds035,pmds037,pmds048",          
  #            "  FROM icab_t,pmds_t",
  #            " WHERE icabent = pmdsent AND pmdsent = ",g_enterprise,
  #            "   AND icab001 = '",l_pmds053,"'",
  #            "   AND icab003 = pmdssite",
  #            "   AND pmds041 = '",l_pmds041,"'",
  #            " ORDER BY icab002"
  #PREPARE s_aic_carry_icab_pre3 FROM g_sql
  #DECLARE s_aic_carry_icab_cs3 CURSOR FOR s_aic_carry_icab_pre3
  #160428-00006#4-e-mark  
   
   LET g_sql = "SELECT pmdtseq,pmdt006,pmdt007,pmdt036,pmdt024,pmdt046",
               "  FROM pmdt_t",
               " WHERE pmdtent = ",g_enterprise,
               "   AND pmdtdocno = ?"
   PREPARE s_aic_carry_pmdt_pre7 FROM g_sql
   DECLARE s_aic_carry_pmdt_cs7 CURSOR FOR s_aic_carry_pmdt_pre7
  
     
  #下站多角貿易營運據點
   LET g_sql = "SELECT icab002,icab003",
               "  FROM icab_t",
               " WHERE icabent = '",g_enterprise,"'",
               "   AND icab001 = '",l_pmds053,"'",
               "   AND icab002 > ?",
               " ORDER BY icab002"
   PREPARE s_aic_carry_icab_next_pre3 FROM g_sql
   DECLARE s_aic_carry_icab_next_cs3 SCROLL CURSOR FOR s_aic_carry_icab_next_pre3

  
   LET g_sql = "SELECT xmdkdocno",
               "  FROM xmdk_t",
               " WHERE xmdkent = ",g_enterprise,
               "   AND xmdk035 = '",l_pmds041,"'",
               "   AND xmdksite = ?"
   PREPARE s_aic_carry_xmddk_pre FROM g_sql
   
   #單頭站別
   FOREACH s_aic_carry_icab_cs3 INTO l_pmds.icab002,
                                     l_pmds.pmdssite,l_pmds.pmdsdocno,l_pmds.pmdsdocdt,
                                     l_pmds.pmds001,l_pmds.pmds035,l_pmds.pmds037,l_pmds.pmds048 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_icab_cs3"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
     #160428-00006#4-s-mark 
     ##統購統付初始入庫單不重新計算
     #IF l_pmds.pmdsdocno = l_docno THEN
     #   CONTINUE FOREACH
     #END IF
     #160428-00006#4-e-mark 
      LET l_modify = FALSE
      
      #取下站
      LET l_icab002_next = ''
      LET l_icab003_next = ''
      OPEN s_aic_carry_icab_next_cs3 USING l_pmds.icab002
      FETCH FIRST s_aic_carry_icab_next_cs3 INTO l_icab002_next,l_icab003_next
      
      #下站出貨單
      LET l_xmdkdocno = ''
      EXECUTE s_aic_carry_xmddk_pre USING l_icab003_next INTO l_xmdkdocno
      
      CALL s_aic_carry_get_ica(l_pmds053,l_pmds.icab002)   #171110-00029#1 add
      
      #取得icag_t、計價
      CALL s_aic_carry_get_tri_pm(l_pmds053,l_pmds.pmdssite,l_pmds.pmdsdocdt)
      RETURNING r_success
      IF NOT r_success THEN
         EXIT FOREACH      
     #--160428-00006#3--add--(S) 
      ELSE
         IF r_success AND NOT cl_null(g_icag.icag008 ) THEN
            IF l_pmds.pmds037 <> g_icag.icag008 THEN
               CALL s_aic_carry_exchange(l_pmds.pmds048,l_pmds.pmdssite,l_pmds.pmdsdocdt,l_pmds.pmds037,g_icag.icag008,'2')
               RETURNING r_success,l_exchange
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
               UPDATE pmds_t
                  SET pmds037 = g_icag.icag008,
                      pmds038 = l_exchange               
                WHERE pmdsent = g_enterprise 
                  AND pmdsdocno = l_pmds.pmdsdocno
            
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE:pmds_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()                 
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF   
              #更新下一站出貨單幣別
               UPDATE xmdk_t
                  SET xmdk016 = g_icag.icag008,
                      xmdk017 = l_exchange
                WHERE xmdkent = g_enterprise
                  AND xmdkdocno = l_xmdkdocno
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE:pmdk_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()                 
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF                   
               LET l_pmds.pmds037 = g_icag.icag008   
            END IF
      END IF      
     #--160428-00006#3--add--(E)
      END IF
      #入庫單單身
      OPEN s_aic_carry_pmdt_cs7 USING l_pmds.pmdsdocno
      FOREACH s_aic_carry_pmdt_cs7 INTO l_pmdt.pmdtseq,l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmdt.pmdt036,l_pmdt.pmdt024,l_pmdt.pmdt046
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_pmdt_cs7"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()      
            LET r_success = FALSE
            EXIT FOREACH
         END IF
                  
         #若計價方式=1.依計價比率
         IF g_icag.icag005 = '1' THEN
           #CASE g_icag.icag006           #160428-00006#4 mark
            CASE                          #160428-00006#4 add
              #WHEN '1'  #依来源营运据点   #160428-00006#4 mark                 
               WHEN (g_icag.icag006 = '1' OR g_icag.icag006 = '3')   #160428-00006#4 add
                  #1:依來源營運據點 3:依最終供應商逆推
                  #160428-00006#3乘上計價比率，再乘以匯率
                  LET l_first[l_pmdt.pmdtseq].pmdt036 = l_first[l_pmdt.pmdtseq].pmdt036 * g_icag.icag007 / 100  #160428-00006#3 add
                  IF l_pmds037_first <> l_pmds.pmds037 THEN                   
                    #取匯率
                     CALL s_aic_carry_exchange(l_pmds.pmds048,l_pmds.pmdssite,l_pmds.pmdsdocdt,l_pmds037_first,l_pmds.pmds037,'2')                      
                     RETURNING r_success,l_exchange
                    
                     IF NOT r_success THEN
                        EXIT FOREACH
                     ELSE
                        LET l_pmdt.pmdt036 = l_first[l_pmdt.pmdtseq].pmdt036 * l_exchange
                     END IF
                  ELSE
                     LET l_pmdt.pmdt036 = l_first[l_pmdt.pmdtseq].pmdt036
                  END IF
                  
                  #乘上計價比率(百分比)
                  #LET l_pmdt.pmdt036 = l_pmdt.pmdt036 * g_icag.icag007 / 100  #160428-00006#3 mark 
                  LET l_modify = TRUE
         
              #WHEN '2'  #依上游厂商                                  #160428-00006#4 mark
               WHEN (g_icag.icag006 = '2' OR g_icag.icag006 = '4')   #160428-00006#4 add
                  #2:依上游供應商 #4:依下游供應商單價逆推
                  #160428-00006#3乘上計價比率，再乘以匯率
                  LET l_before[l_pmdt.pmdtseq].pmdt036 = l_before[l_pmdt.pmdtseq].pmdt036 * g_icag.icag007 / 100   #160428-00006#3 add 
                  
                  IF l_pmds037_before <> l_pmds.pmds037 THEN    
                  
                    #取匯率
                     CALL s_aic_carry_exchange(l_pmds.pmds048,l_pmds.pmdssite,l_pmds.pmdsdocdt,l_pmds037_before,l_pmds.pmds037,'2')                      
                     RETURNING r_success,l_exchange
                    
                     IF NOT r_success THEN
                        EXIT FOREACH
                     ELSE
                        LET l_pmdt.pmdt036 = l_before[l_pmdt.pmdtseq].pmdt036 * l_exchange
                     END IF
                  ELSE
                     LET l_pmdt.pmdt036 = l_before[l_pmdt.pmdtseq].pmdt036
                  END IF
                  
                  #乘上計價比率(百分比)
                  #LET l_pmdt.pmdt036 = l_pmdt.pmdt036 * g_icag.icag007 / 100    #160428-00006#3 mark
                  LET l_modify = TRUE
                  
            END CASE
       
         ELSE
           #IF g_icag.icag005 <> '3' OR g_pmdn.pmdn015 <> '0' THEN         #160428-00006#3 mark
            IF g_icag.icag005 = '3' AND l_pmdt.pmdt036 = '0' THEN          #160428-00006#3 add
               #計價方式為3:非0時，依轉撥單價==>若為3，且單價為0，則直接給0，不重取
            ELSE                                                           #160428-00006#3 add
               #若計價方式2:依轉撥單價或3非0時(單價為0時)，依轉撥單價
               #則須進一步呼叫s_aic_carry_get_tri_price取得轉撥單價
               CASE g_icaa.icaa010
                  WHEN '1'   #轉撥單價取價方式='1.依單據日期'
                     #取得icah_t
                     CALL s_aic_carry_get_tri_price(l_pmds053,l_pmds.pmdssite,l_icab003_next,l_pmds.pmdsdocdt,
                                                    l_pmds.pmds037,l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmds.pmds035)
                     RETURNING r_success,l_pmdt.pmdt036
                     LET l_modify = TRUE
               
                  WHEN '2'   #轉撥單價取價方式='2.預計出入庫日期'
                     #取得icah_t
                     CALL s_aic_carry_get_tri_price(l_pmds053,l_pmds.pmdssite,l_icab003_next,l_pmds.pmds001,
                                                    l_pmds.pmds037,l_pmdt.pmdt006,l_pmdt.pmdt007,l_pmds.pmds035)
                     RETURNING r_success,l_pmdt.pmdt036
                     LET l_modify = TRUE
                     
               END CASE
            END IF
         END IF
         
         IF l_modify THEN
            #取得未稅金額、稅額、含稅金額
            CALL s_aic_carry_get_amount(l_pmds.pmdssite,l_pmds.pmdsdocno,l_pmdt.pmdtseq,l_pmds.pmds037,l_pmdt.pmdt024,l_pmdt.pmdt036,l_pmdt.pmdt046)
            RETURNING r_success,l_pmdt038,l_pmdt047,l_pmdt039
            
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            #更新入庫單
            UPDATE pmdt_t
               SET pmdt036 = l_pmdt.pmdt036,   #單價
                   pmdt044 = l_pmdt.pmdt036,   #取出價格
                   pmdt038 = l_pmdt038,        #未稅金額
                   pmdt047 = l_pmdt047,        #稅額
                   pmdt039 = l_pmdt039         #含稅金額
             WHERE pmdtent = g_enterprise
               AND pmdtdocno = l_pmds.pmdsdocno
               AND pmdtseq = l_pmdt.pmdtseq
            
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:pmdt_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            #更新出貨單
            IF NOT cl_null(l_xmdkdocno) THEN
               #先update單價，之後由s_aic_carry_price_upd計算未稅、稅額、含稅金額
               UPDATE xmdl_t
                  SET xmdl024 = l_pmdt.pmdt036,   #單價
                      xmdl045 = l_pmdt.pmdt036    #取出價格
                WHERE xmdlent = g_enterprise
                  AND xmdlseq = l_pmdt.pmdtseq
                  AND xmdldocno = l_xmdkdocno
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE:xmdl_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
             
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
             
            END IF
         END IF
                  
         LET l_before[l_pmdt.pmdtseq].pmdt036 = l_pmdt.pmdt036  #後站單價
      END FOREACH
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      IF l_modify THEN
         #重新計算整單的未稅、含稅總金額
         CALL s_aic_carry_return_amount(l_pmds.pmdsdocno)
         RETURNING l_pmds043,l_pmds046,l_pmds044
            
         UPDATE pmds_t
            SET pmds043 = l_pmds043,
                pmds046 = l_pmds046,
                pmds044 = l_pmds044
          WHERE pmdsent = g_enterprise 
            AND pmdsdocno = l_pmds.pmdsdocno
            
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "UPDATE:pmds_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
           
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #重新計算整單的未稅、含稅總金額(出貨)
         IF NOT cl_null(l_xmdkdocno) THEN
            IF NOT s_aic_carry_price_upd('2',l_xmdkdocno) THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
         END IF
      END IF
      
      
      LET l_pmds037_before = l_pmds.pmds037  #前站幣別
      
   END FOREACH

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 計算單據未稅金額、稅額、含稅金額
# Memo...........:
# Usage..........: CALL s_aic_carry_price_upd(p_type,p_docno)
#                  RETURNING r_success
# Input parameter: p_type   1.訂單  2.出貨單
#                : p_docno  單據單號
# Return code....: 
#                : 
# Date & Author..: 151202 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_price_upd(p_type,p_docno)
   DEFINE p_type       LIKE type_t.chr1      #1.訂單 2.出貨單
   DEFINE p_docno      LIKE xmda_t.xmdadocno #單據單號
   DEFINE r_success    LIKE type_t.num5
   
   DEFINE l_xmda       RECORD
             xmdasite     LIKE xmda_t.xmdasite,  #營運據點
             xmdadocno    LIKE xmda_t.xmdadocno, #單號
             xmda015      LIKE xmda_t.xmda015,   #幣別
             xmdcseq      LIKE xmdc_t.xmdcseq,   #項次
             xmdc011      LIKE xmdc_t.xmdc011,   #計價數量
             xmdc015      LIKE xmdc_t.xmdc015,   #單價
             xmdc016      LIKE xmdc_t.xmdc016,   #稅別
             xmdc046      LIKE xmdc_t.xmdc046,   #未稅金額
             xmdc047      LIKE xmdc_t.xmdc047,   #含稅金額
             xmdc048      LIKE xmdc_t.xmdc048    #稅額
                       END RECORD
                       
   DEFINE l_xmda041    LIKE xmda_t.xmda041
   DEFINE l_xmda043    LIKE xmda_t.xmda043
   DEFINE l_xmda042    LIKE xmda_t.xmda042
  #160428-00006#4-s-add 
   DEFINE l_sql        STRING
   DEFINE l_xmdd  RECORD 
             xmddseq1   LIKE xmdd_t.xmddseq1,
             xmddseq2   LIKE xmdd_t.xmddseq2,
             xmdd018    LIKE xmdd_t.xmdd018,
             xmdd019    LIKE xmdd_t.xmdd019,
             xmdd027    LIKE xmdd_t.xmdd027, 
             xmdd028    LIKE xmdd_t.xmdd028, 
             xmdd029    LIKE xmdd_t.xmdd029, 
             xmdd030    LIKE xmdd_t.xmdd030 
            END RECORD             
  #160428-00006#4-e-add 
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF NOT cl_null(p_docno) THEN
      CASE p_type
         WHEN '1'  #1.訂單
            LET g_sql = "SELECT xmdasite,xmdadocno,xmda015,",
                          "       xmdcseq,xmdc011,xmdc015,xmdc016",
                          "  FROM xmda_t,xmdc_t",
                          " WHERE xmdaent = xmdcent AND xmdcent = ",g_enterprise,
                          "   AND xmdadocno = xmdcdocno AND xmdcdocno = '",p_docno,"'"                          
           #160428-00006#4-s-add
            LET l_sql = "SELECT xmddseq1,xmddseq2,xmdd018,xmdd019,xmdd027 ",
                        "  FROM xmdd_t ",
                        " WHERE xmddent = ",g_enterprise,
                        "   AND xmdddocno = ? AND xmddseq = ? ",
                        "   AND xmdd003 <> '6' "                        
           #160428-00006#4-e-add
         WHEN '2'  #2.出貨單
            LET g_sql = "SELECT xmdksite,xmdkdocno,xmdk016,",
                          "       xmdlseq,xmdl022,xmdl024,xmdl025",
                          "  FROM xmdk_t,xmdl_t",
                          " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
                          "   AND xmdkdocno = xmdldocno AND xmdldocno = '",p_docno,"'"
                          
      END CASE
      
      PREPARE s_aic_carry_price_upd_pre_1 FROM g_sql
      DECLARE s_aic_carry_price_upd_cs_1 CURSOR WITH HOLD FOR s_aic_carry_price_upd_pre_1      
     #160428-00006#4-s-add
      PREPARE s_aic_carry_price_upd_pre_2 FROM l_sql
      DECLARE s_aic_carry_price_upd_cs_2 CURSOR WITH HOLD FOR s_aic_carry_price_upd_pre_2      
     #160428-00006#4-e-add 
      
      INITIALIZE l_xmda.* TO NULL
      FOREACH s_aic_carry_price_upd_cs_1 INTO l_xmda.xmdasite,l_xmda.xmdadocno,l_xmda.xmda015,
                                              l_xmda.xmdcseq,l_xmda.xmdc011,l_xmda.xmdc015,l_xmda.xmdc016
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_price_upd_cs_1"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      
         #取得未稅金額、稅額、含稅金額
         CALL s_aic_carry_get_amount(l_xmda.xmdasite,l_xmda.xmdadocno,l_xmda.xmdcseq,l_xmda.xmda015,l_xmda.xmdc011,l_xmda.xmdc015,l_xmda.xmdc016)
         RETURNING r_success,l_xmda.xmdc046,l_xmda.xmdc048,l_xmda.xmdc047
         
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         CASE p_type
            WHEN '1'  #1.訂單
               UPDATE xmdc_t
                  SET xmdc046 = l_xmda.xmdc046,
                      xmdc048 = l_xmda.xmdc048,
                      xmdc047 = l_xmda.xmdc047
                WHERE xmdcent = g_enterprise
                  AND xmdcdocno = p_docno
                  AND xmdcseq = l_xmda.xmdcseq    #160428-00006#4 add
         
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE xmdc_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()               
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
              #160428-00006#4-s-add
              #更新xmdd資料
              OPEN s_aic_carry_price_upd_cs_2 USING p_docno,l_xmda.xmdcseq
              FOREACH s_aic_carry_price_upd_cs_2 INTO l_xmdd.xmddseq1,l_xmdd.xmddseq2,l_xmdd.xmdd018,l_xmdd.xmdd019,l_xmdd.xmdd027
                 LET l_xmdd.xmdd028 = 0
                 LET l_xmdd.xmdd029 = 0
                 LET l_xmdd.xmdd030 = 0
                 #取得未稅金額、含稅金額、稅額
                 CALL s_aic_carry_tax1(l_xmda.xmdasite,l_xmdd.xmdd027,l_xmdd.xmdd018,l_xmdd.xmdd019,l_xmda.xmdc015,l_xmda.xmdc016)
                   RETURNING l_xmdd.xmdd028,l_xmdd.xmdd029,l_xmdd.xmdd030
                 UPDATE xmdd_t
                    SET xmdd028 = l_xmdd.xmdd028,
                        xmdd029 = l_xmdd.xmdd029,
                        xmdd030 = l_xmdd.xmdd030
                  WHERE xmddent = g_enterprise
                    AND xmdddocno = p_docno
                    AND xmddseq = l_xmda.xmdcseq
                    AND xmddseq1 = l_xmdd.xmddseq1
                    AND xmddseq2 = l_xmdd.xmddseq2 
                 IF SQLCA.sqlcode THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.extend = "UPDATE xmdd_t"
                    LET g_errparam.code   = SQLCA.sqlcode
                    LET g_errparam.popup  = TRUE
                    CALL cl_err()               
                    LET r_success = FALSE
                    EXIT FOREACH
                 END IF                    
              END FOREACH
              #160428-00006#4-e-add
         
            WHEN '2'  #2.出貨單
               UPDATE xmdl_t
                  SET xmdl027 = l_xmda.xmdc046,
                      xmdl029 = l_xmda.xmdc048,
                      xmdl028 = l_xmda.xmdc047
                WHERE xmdlent = g_enterprise
                  AND xmdldocno = p_docno
                  AND xmdlseq = l_xmda.xmdcseq    #160428-00006#4 add
                  
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE xmdl_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()               
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
         END CASE
         
      END FOREACH
      
      IF r_success THEN
         #重新計算整單的未稅、含稅總金額
         CALL s_aic_carry_return_amount(p_docno)
         RETURNING l_xmda041,l_xmda043,l_xmda042
         
         CASE p_type
            WHEN '1'  #1.訂單
               UPDATE xmda_t
                  SET xmda041 = l_xmda041,
                      xmda043 = l_xmda043,
                      xmda042 = l_xmda042
                WHERE xmdaent = g_enterprise
                  AND xmdadocno = p_docno
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE xmda_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  
                  LET r_success = FALSE
               END IF
            
            WHEN '2'  #2.出貨單
               UPDATE xmdk_t
                  SET xmdk051 = l_xmda041,
                      xmdk053 = l_xmda043,
                      xmdk052 = l_xmda042
                WHERE xmdkent = g_enterprise
                  AND xmdkdocno = p_docno
                  
                IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = "UPDATE xmdk_t"
                  LET g_errparam.code   = SQLCA.sqlcode
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  
                  LET r_success = FALSE
               END IF
         END CASE
         
            
      END IF
      
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 料件是否使用製造批序號
# Memo...........:
# Usage..........: CALL s_aic_carry_imaf071_imaf081_sel(p_site,p_imaf001)
#                  RETURNING r_imaf071,r_imaf081
# Input parameter: p_site    營運據點
#                : p_imaf001 料件編號
# Return code....: r_imaf071 製造批號
#                : r_imaf081 製造序號
# Date & Author..: 151228 By earl
# Modify.........:
################################################################################
PRIVATE FUNCTION s_aic_carry_imaf071_imaf081_sel(p_site,p_imaf001)
   DEFINE p_site        LIKE imaf_t.imafsite
   DEFINE p_imaf001     LIKE imaf_t.imaf001
   DEFINE r_imaf071     LIKE imaf_t.imaf071
   DEFINE r_imaf081     LIKE imaf_t.imaf081
   
   WHENEVER ERROR CONTINUE
   
   LET r_imaf071 = ''
   LET r_imaf081 = ''
   
   LET g_sql = "SELECT imaf071,imaf081",
               "  FROM imaf_t",
               " WHERE imafent = ",g_enterprise,
               "   AND imafsite = ?",
               "   AND imaf001 = '",p_imaf001,"'"
   PREPARE s_aic_carry_imaf071_imaf081_pre FROM g_sql
   
   EXECUTE s_aic_carry_imaf071_imaf081_pre USING p_site INTO r_imaf071,r_imaf081
   IF SQLCA.sqlcode = 100 THEN
      EXECUTE s_aic_carry_imaf071_imaf081_pre USING 'ALL' INTO r_imaf071,r_imaf081
   END IF
   
   RETURN r_imaf071,r_imaf081
END FUNCTION

################################################################################
# Descriptions...: 製造批序號檢查
# Memo...........:
# Usage..........: CALL s_aic_carry_inao_chk(p_icaa001,p_imaf001)
#                  RETURNING r_success
# Input parameter: p_icaa001  多角流程代碼
#                : p_imaf001  料號
# Return code....: r_success  執行結果
#                : 
# Date & Author..: 151228 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_inao_chk(p_icaa001,p_imaf001)
   DEFINE p_icaa001        LIKE icaa_t.icaa001
   DEFINE p_imaf001        LIKE imaf_t.imaf001
   DEFINE r_success        LIKE type_t.num5
   
   DEFINE l_final          LIKE icab_t.icab002
   DEFINE l_icab002        LIKE icab_t.icab002
   DEFINE l_icab003        LIKE icab_t.icab003
   DEFINE l_imaf071        LIKE imaf_t.imaf071
   DEFINE l_imaf081        LIKE imaf_t.imaf081

   DEFINE l_first    RECORD
      icab003           LIKE icab_t.icab003,
      imaf071           LIKE imaf_t.imaf071,
      imaf081           LIKE imaf_t.imaf081
                     END RECORD
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF NOT cl_null(p_icaa001) AND NOT cl_null(p_imaf001) THEN
      LET g_sql = "SELECT icab002,icab003",
                  "  FROM icab_t",
                  " WHERE icabent = ",g_enterprise,
                  "   AND icab001 = '",p_icaa001,"'",
                  " ORDER BY icab002"
      PREPARE s_aic_carry_icab002_icab003_pre FROM g_sql
      DECLARE s_aic_carry_icab002_icab003_cs CURSOR FOR s_aic_carry_icab002_icab003_pre
      
      LET l_final = ''
      LET g_sql = "SELECT a.icab002",
                  "  FROM icab_t a",
                  " WHERE a.icabent = ",g_enterprise,
                  "   AND a.icab001 = '",p_icaa001,"'",
                  "   AND a.icab002 = (SELECT MAX(b.icab002) FROM icab_t b WHERE b.icabent = a.icabent AND b.icab001 = a.icab001)"
      PREPARE s_aic_carry_icab002_pre FROM g_sql
      EXECUTE s_aic_carry_icab002_pre INTO l_final
      
      INITIALIZE l_first.* TO NULL
      FOREACH s_aic_carry_icab002_icab003_cs INTO l_icab002,l_icab003
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH:s_aic_carry_icab002_icab003_cs"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         CALL s_aic_carry_imaf071_imaf081_sel(l_icab003,p_imaf001)
         RETURNING l_imaf071,l_imaf081
      
         #初始站
         IF l_icab002 = 0 THEN
            LET l_first.icab003 = l_icab003
            LET l_first.imaf071 = l_imaf071
            LET l_first.imaf081 = l_imaf081
            
            CONTINUE FOREACH
         END IF
         
         IF l_icab002 <> l_final THEN #中間站
            IF (l_first.imaf071 <> '1' AND l_imaf071 = '1') OR (l_first.imaf081 <> '1' AND l_imaf081 = '1') THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = "aic-00213"  #料號%1多角初始站據點%2之"製造批號控管方式"、"序號控管方式"設定"非必需"時，多角據點%3不可設定為"必需"！
               LET g_errparam.popup  = TRUE
               LET g_errparam.replace[1] = p_imaf001
               LET g_errparam.replace[2] = l_first.icab003
               LET g_errparam.replace[3] = l_icab003
               CALL cl_err()
               
               LET r_success = FALSE
            END IF
            
         ELSE  #最終站
            IF l_first.imaf071 <> l_imaf071 OR  l_first.imaf081 <> l_imaf081 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = "aic-00214"  #料號%1多角初始站據點%2與最終站據點%3之"製造批號控管方式"、"序號控管方式"設定值須相同！
               LET g_errparam.popup  = TRUE
               LET g_errparam.replace[1] = p_imaf001
               LET g_errparam.replace[2] = l_first.icab003
               LET g_errparam.replace[3] = l_icab003
               CALL cl_err()
               
               LET r_success = FALSE
            END IF
         END IF
   
      END FOREACH
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 多角續拋最終站訂單單號
# Memo...........:
# Usage..........: CALL s_aic_carry_continue_xmda(p_site,p_icab001,p_type,p_docno_from)
#                  RETURNING r_success,r_xmdadocno,r_icab003_final
# Input parameter: p_site          當下營運據點
#                : p_icab001       流程代碼
#                : p_type          1.訂單  2.採購單
#                : p_docno_from    訂單/採購單號
# Return code....: r_success       TRUE 需校驗檢查  FALSE 不需校驗檢查
#                : r_xmdadocno     最終站訂單單號
#                : r_icab003_final 最終站營運據點
# Date & Author..: 150917-00001#3 160120 By earl
# Modify.........: 
################################################################################
PRIVATE FUNCTION s_aic_carry_continue_xmda(p_site,p_icab001,p_type,p_docno_from)
   DEFINE p_site            LIKE xmdd_t.xmddsite    #當下營運據點
   DEFINE p_icab001         LIKE icab_t.icab001     #流程代碼
   DEFINE p_type            LIKE type_t.chr1        #1.訂單 2.採購單
   DEFINE p_docno_from      LIKE xmdd_t.xmdddocno   #訂單/採購單號
   
   DEFINE r_chk             LIKE type_t.num5        #TRUE 需要校驗檢查  FALSE  不需校驗檢查
   DEFINE r_xmdadocno       LIKE xmda_t.xmdadocno   #最終站訂單單號
   DEFINE r_icab003_final   LIKE icab_t.icab003     #最終站據點
   
   DEFINE l_icaa003         LIKE icaa_t.icaa003     #流程類型
   DEFINE l_icaa005         LIKE icaa_t.icaa005     #中斷否
   DEFINE l_icab003_first   LIKE icab_t.icab003     #第0站據點
   DEFINE l_icab003_final   LIKE icab_t.icab003     #最終站據點
   
   WHENEVER ERROR CONTINUE

   LET r_chk = TRUE
   LET r_xmdadocno = ''
   LET r_icab003_final = ''
   
   LET l_icaa003 = ''
   LET l_icaa005 = ''
   LET l_icab003_first = ''
   LET l_icab003_final = ''
   
   SELECT icaa003,icaa005,a.icab003,b.icab003
     INTO l_icaa003,l_icaa005,l_icab003_first,l_icab003_final
     FROM icaa_t,icab_t a,icab_t b
    WHERE icaaent = a.icabent AND a.icabent = b.icabent AND b.icabent = g_enterprise
      AND icaa001 = a.icab001 AND a.icab001 = b.icab001 AND b.icab001 = p_icab001
      AND a.icab002 = '0'
      AND b.icab002 = (SELECT MAX(c.icab002)
                         FROM icab_t c
                        WHERE c.icabent = g_enterprise
                          AND c.icab001 = p_icab001)
   
   LET r_icab003_final = l_icab003_final
   
   IF l_icaa003 = '1' THEN #銷售
      IF p_type = '2' THEN  #採購單不回寫
         LET r_chk = FALSE
         RETURN r_chk,r_xmdadocno,r_icab003_final
      END IF
   ELSE   #代採購、採購指定最終供應商
      IF p_type = '1' THEN  #訂單不回寫
         LET r_chk = FALSE
         RETURN r_chk,r_xmdadocno,r_icab003_final
      END IF
   END IF
   
   #第0站且中斷續拋
   IF l_icaa005 = 'Y' AND l_icab003_first = p_site THEN
   
      LET g_sql = "SELECT xmdadocno",
                  "  FROM xmda_t",
                  " WHERE xmdaent = ",g_enterprise,
                  "   AND xmdasite = '",l_icab003_final,"'"
      
      IF p_type = '1' THEN #訂單
         LET g_sql = g_sql,
                     " AND xmda031 = (SELECT xmda031",
                     "                  FROM xmda_t",
                     "                 WHERE xmdaent = ",g_enterprise,
                     "                   AND xmdadocno = '",p_docno_from,"')"
      ELSE  #採購單
         LET g_sql = g_sql,
                     " AND xmda031 = (SELECT pmdl031",
                     "                  FROM pmdl_t",
                     "                 WHERE pmdlent = ",g_enterprise,
                     "                   AND pmdldocno = '",p_docno_from,"')"
      END IF
      
      #最終站訂單單號
      PREPARE s_aic_carry_xmdadocno_pre FROM g_sql
      EXECUTE s_aic_carry_xmdadocno_pre INTO r_xmdadocno
   ELSE
      LET r_chk = FALSE
      RETURN r_chk,r_xmdadocno,r_icab003_final
   END IF
   
   RETURN r_chk,r_xmdadocno,r_icab003_final
END FUNCTION

################################################################################
# Descriptions...: 多角續拋回寫最終站出貨單之已簽收量
# Memo...........:
# Usage..........: CALL s_aic_carry_continue_upd(p_site,p_icab001,p_type,p_docno_from,p_seq,p_seq1,p_seq2,p_batch,p_num,p_upd)
#                  RETURNING r_success
# Input parameter: p_site           當下營運據點
#                : p_icab001        流程代碼
#                : p_type           1.訂單 2.採購單
#                : p_docno_from     訂單/採購單號
#                : p_seq            訂單/採購項次
#                : p_seq1           訂單/採購項序
#                : p_seq2           訂單/採購分批序
#                : p_batch          批號
#                : p_num            數量
#                : p_upd            1.正向(過帳) 2.負向(取消過帳)
# Return code....: 
#                : 
# Date & Author..: 150917-00001#3 160120 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_continue_upd(p_site,p_icab001,p_type,p_docno_from,p_seq,p_seq1,p_seq2,p_batch,p_num,p_upd)
   DEFINE p_site            LIKE xmdd_t.xmddsite    #當下營運據點
   DEFINE p_icab001         LIKE icab_t.icab001     #流程代碼
   DEFINE p_type            LIKE type_t.chr1        #1.訂單 2.採購單
   DEFINE p_docno_from      LIKE xmdd_t.xmdddocno   #訂單/採購單號
   DEFINE p_seq             LIKE xmdd_t.xmddseq     #訂單/採購項次
   DEFINE p_seq1            LIKE xmdd_t.xmddseq1    #訂單/採購項序
   DEFINE p_seq2            LIKE xmdd_t.xmddseq2    #訂單/採購分批序
   DEFINE p_batch           LIKE xmdc_t.xmdc030     #批號
   DEFINE p_num             LIKE xmdc_t.xmdc007     #數量
   DEFINE p_upd             LIKE type_t.chr1        #1.正向(過帳) 2.負向(取消過帳)
   DEFINE r_success         LIKE type_t.num5

   DEFINE l_chk             LIKE type_t.num5        #TRUE 需要校驗檢查  FALSE  不需校驗檢查
   DEFINE l_xmdadocno       LIKE xmda_t.xmdadocno   #最終站訂單單號
   DEFINE l_icab003_final   LIKE icab_t.icab003     #最終站據點

   DEFINE l_num             LIKE xmdc_t.xmdc007
   DEFINE l_xmdm012         LIKE xmdm_t.xmdm012
   
   DEFINE l_xmdl          RECORD
             xmdldocno      LIKE xmdl_t.xmdldocno,
             xmdlseq        LIKE xmdl_t.xmdlseq
                          END RECORD
   
   DEFINE l_xmdm          RECORD
             xmdmseq1       LIKE xmdm_t.xmdmseq1,
             xmdm009        LIKE xmdm_t.xmdm009,
             xmdm012        LIKE xmdm_t.xmdm012
                          END RECORD

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF cl_null(p_site) OR
      cl_null(p_icab001) OR
      cl_null(p_type) OR
      cl_null(p_docno_from) OR
      cl_null(p_num) OR
      cl_null(p_upd) THEN
      
      RETURN r_success
   END IF
   
   IF cl_null(p_seq) THEN
      LET p_seq = 0
   END IF
   IF cl_null(p_seq1) THEN
      LET p_seq1 = 0
   END IF
   IF cl_null(p_seq2) THEN
      LET p_seq2 = 0
   END IF
   
   #最終站訂單單號
   CALL s_aic_carry_continue_xmda(p_site,p_icab001,p_type,p_docno_from)
   RETURNING l_chk,l_xmdadocno,l_icab003_final
   
   IF l_chk THEN
      IF cl_null(l_xmdadocno) THEN
         INITIALIZE g_errparam TO NULL      
         LET g_errparam.extend = ''
         LET g_errparam.code   = 'aic-00220'   #查無%1對應據點%2的多角訂單！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_docno_from
         LET g_errparam.replace[2] = l_icab003_final
         
         LET r_success = FALSE
         RETURN r_success
      END IF
   ELSE
      RETURN r_success   #不需回寫
   END IF
   
   LET g_sql = "SELECT xmdldocno,xmdlseq",
               "  FROM xmdk_t,xmdl_t",
               " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
               "   AND xmdkdocno = xmdldocno",
               "   AND xmdksite = '",l_icab003_final,"'",
               "   AND xmdk000 = '1'",
               "   AND xmdk083 = 'Y'",
               "   AND xmdl003 = '",l_xmdadocno,"'",
               "   AND COALESCE(xmdl004,0) = '",p_seq,"'",
               "   AND COALESCE(xmdl005,0) = '",p_seq1,"'",
               "   AND COALESCE(xmdl006,0) = '",p_seq2,"'"
               
   IF p_upd = '1' THEN  #1.正向(過帳)
      LET g_sql = g_sql,
                  " AND COALESCE(xmdl018,0) > COALESCE(xmdl035,0)",
                  " ORDER BY xmdkdocdt,xmdldocno,xmdlseq"
   ELSE   #2.負向(取消過帳)
      LET g_sql = g_sql,
                  " AND COALESCE(xmdl035,0) > 0",
                  " ORDER BY xmdkdocdt DESC,xmdldocno DESC,xmdlseq DESC"
   END IF
   
   PREPARE s_aic_carry_xmdl_pre5 FROM g_sql
   DECLARE s_aic_carry_xmdl_cs5 CURSOR FOR s_aic_carry_xmdl_pre5
   
   LET g_sql = "SELECT xmdmseq1,COALESCE(xmdm009,0),COALESCE(xmdm012,0)",
               "  FROM xmdm_t",
               " WHERE xmdment = ",g_enterprise,
               "   AND COALESCE(xmdm007,' ') = COALESCE('",p_batch,"',' ')",
               "   AND xmdmdocno = ?",
               "   AND xmdmseq = ?"
    
   IF p_upd = '1' THEN  #1.正向(過帳)
      LET g_sql = g_sql,
                  " AND COALESCE(xmdm009,0) > COALESCE(xmdm012,0)",
                  " ORDER BY xmdmseq1"
   ELSE   #2.負向(取消過帳)
      LET g_sql = g_sql,
                  " AND COALESCE(xmdm012,0) > 0",
                  " ORDER BY xmdmseq1 DESC"
   END IF
   
   PREPARE s_aic_carry_xmdm_pre1 FROM g_sql
   DECLARE s_aic_carry_xmdm_cs1 CURSOR FOR s_aic_carry_xmdm_pre1
   
   INITIALIZE l_xmdl.* TO NULL
   FOREACH s_aic_carry_xmdl_cs5 INTO l_xmdl.xmdldocno,l_xmdl.xmdlseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH s_aic_carry_xmdl_cs5"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      INITIALIZE l_xmdm.* TO NULL
      OPEN s_aic_carry_xmdm_cs1 USING l_xmdl.xmdldocno,l_xmdl.xmdlseq
      FOREACH s_aic_carry_xmdm_cs1 INTO l_xmdm.xmdmseq1,l_xmdm.xmdm009,l_xmdm.xmdm012
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH s_aic_carry_xmdm_cs1"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         IF p_upd = '1' THEN  #1.正向(過帳)
            LET l_num = l_xmdm.xmdm009 - l_xmdm.xmdm012   #未續拋數量
            IF p_num > l_num THEN
               #此項序全數續拋
               UPDATE xmdm_t
                  SET xmdm012 = l_xmdm.xmdm009
                WHERE xmdment = g_enterprise
                  AND xmdmdocno = l_xmdl.xmdldocno
                  AND xmdmseq = l_xmdl.xmdlseq
                  AND xmdmseq1 = l_xmdm.xmdmseq1
               
               LET p_num = p_num - l_num   #未回寫數量
            ELSE
               UPDATE xmdm_t
                  SET xmdm012 = (l_xmdm.xmdm012 + p_num)
                WHERE xmdment = g_enterprise
                  AND xmdmdocno = l_xmdl.xmdldocno
                  AND xmdmseq = l_xmdl.xmdlseq
                  AND xmdmseq1 = l_xmdm.xmdmseq1
               
               LET p_num = 0   #未回寫數量
            END IF
            
            
         ELSE   #2.負向(取消過帳)
            IF p_num > l_xmdm.xmdm012 THEN
               #此項序全數取消續拋
               UPDATE xmdm_t
                  SET xmdm012 = 0
                WHERE xmdment = g_enterprise
                  AND xmdmdocno = l_xmdl.xmdldocno
                  AND xmdmseq = l_xmdl.xmdlseq
                  AND xmdmseq1 = l_xmdm.xmdmseq1
               
               LET p_num = p_num - l_xmdm.xmdm012   #未回寫數量
            ELSE
               UPDATE xmdm_t
                  SET xmdm012 = (l_xmdm.xmdm012 - p_num)
                WHERE xmdment = g_enterprise
                  AND xmdmdocno = l_xmdl.xmdldocno
                  AND xmdmseq = l_xmdl.xmdlseq
                  AND xmdmseq1 = l_xmdm.xmdmseq1
               
               LET p_num = 0   #未回寫數量
            END IF
         END IF
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "UPDATE xmdm_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         IF p_num = 0 THEN
            EXIT FOREACH   #無數量需回寫，離開Foreach
         END IF
      END FOREACH
      CLOSE s_aic_carry_xmdm_cs1
      
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      LET l_xmdm012 = 0
      SELECT SUM(xmdm012) INTO l_xmdm012
        FROM xmdm_t
       WHERE xmdment = g_enterprise
         AND xmdmdocno = l_xmdl.xmdldocno
         AND xmdmseq = l_xmdl.xmdlseq
      
      UPDATE xmdl_t
         SET xmdl035 = l_xmdm012
       WHERE xmdlent = g_enterprise
         AND xmdldocno = l_xmdl.xmdldocno
         AND xmdlseq = l_xmdl.xmdlseq
      
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE xmdl_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF p_num = 0 THEN
         EXIT FOREACH   #無數量需回寫，離開Foreach
      END IF
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   IF p_num > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = 'aic-00221'   #續拋之數量無法全數回寫最終站%1之出貨單已簽收量！
      LET g_errparam.popup  = TRUE
      LET g_errparam.replace[1] = l_icab003_final
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 可續拋數量
# Memo...........:
# Usage..........: CALL s_aic_carry_continue_qty(p_site,p_icab001,p_type,p_docno_from,p_seq,p_seq1,p_seq2,p_batch,p_ship_docno,p_ship_seq)
#                  RETURNING r_chk,r_qty,r_qty_batch
# Input parameter: p_site           當下營運據點
#                : p_icab001        流程代碼
#                : p_type           1.訂單 2.採購單
#                : p_docno_from     訂單/採購單號
#                : p_seq            訂單/採購項次
#                : p_seq1           訂單/採購項序
#                : p_seq2           訂單/採購分批序
#                : p_batch          批號
#                : p_ship_docno     出貨/入庫單號(排除用，可傳入空值)
#                : p_ship_seq       出貨/入庫項次(排除用，可傳入空值)
# Return code....: r_chk            TRUE 需檢查 FALSE 不需檢查
#                : r_qty            未續拋數量
#                : r_qty_batch      未續拋數量(考慮批號)
# Date & Author..: 150917-00001#3 160121 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_continue_qty(p_site,p_icab001,p_type,p_docno_from,p_seq,p_seq1,p_seq2,p_batch,p_ship_docno,p_ship_seq)
   DEFINE p_site            LIKE xmdd_t.xmddsite    #當下營運據點
   DEFINE p_icab001         LIKE icab_t.icab001     #流程代碼
   DEFINE p_type            LIKE type_t.chr1        #1.訂單 2.採購單
   DEFINE p_docno_from      LIKE xmdd_t.xmdddocno   #訂單/採購單號
   DEFINE p_seq             LIKE xmdd_t.xmddseq     #訂單/採購項次
   DEFINE p_seq1            LIKE xmdd_t.xmddseq1    #訂單/採購項序
   DEFINE p_seq2            LIKE xmdd_t.xmddseq2    #訂單/採購分批序
   DEFINE p_batch           LIKE xmdc_t.xmdc030     #批號
   DEFINE p_ship_docno      LIKE xmdk_t.xmdkdocno   #出貨/入庫單單號(排除本張出貨單可傳空值)
   DEFINE p_ship_seq        LIKE xmdl_t.xmdlseq     #出貨/入庫單項次(可傳空值)
   DEFINE r_chk             LIKE type_t.num5        #TRUE 需要校驗檢查  FALSE  不需校驗檢查
   DEFINE r_qty             LIKE xmdl_t.xmdl205     #未續拋數量
   DEFINE r_qty_batch       LIKE xmdl_t.xmdl205     #未續拋數量(考慮批號)
   
   DEFINE l_chk             LIKE type_t.num5        #TRUE 需要校驗檢查  FALSE  不需校驗檢查
   DEFINE l_xmdadocno       LIKE xmda_t.xmdadocno   #最終站訂單單號
   DEFINE l_icab003_final   LIKE icab_t.icab003     #最終站據點
   DEFINE l_unship_qty      LIKE xmdl_t.xmdl018
   DEFINE l_unpost_qty      LIKE xmdl_t.xmdl018
   
   WHENEVER ERROR CONTINUE
   
   LET r_chk = TRUE
   LET r_qty = 0
   LET r_qty_batch = 0
   
   IF cl_null(p_site) OR
      cl_null(p_icab001) OR
      cl_null(p_type) OR
      cl_null(p_docno_from) THEN
      
      LET r_chk = FALSE
      
      RETURN r_chk,r_qty,r_qty_batch
   END IF
   
   IF cl_null(p_seq) THEN
      LET p_seq = 0
   END IF
   IF cl_null(p_seq1) THEN
      LET p_seq1 = 0
   END IF
   IF cl_null(p_seq2) THEN
      LET p_seq2 = 0
   END IF
   
   #最終站訂單單號
   CALL s_aic_carry_continue_xmda(p_site,p_icab001,p_type,p_docno_from)
   RETURNING l_chk,l_xmdadocno,l_icab003_final
   
   IF l_chk THEN
      IF cl_null(l_xmdadocno) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ''
         LET g_errparam.code   = 'aic-00220'   #查無%1對應據點%2的多角訂單！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_docno_from
         LET g_errparam.replace[2] = l_icab003_final
         
         RETURN r_chk,r_qty,r_qty_batch
      END IF
   ELSE
      LET r_chk = FALSE
      RETURN r_chk,r_qty,r_qty_batch   #不需回寫
   END IF
   
   LET g_sql = "SELECT SUM(COALESCE(xmdl018,0))-SUM(COALESCE(xmdl035,0))",
               "  FROM xmdk_t,xmdl_t",
               " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
               "   AND xmdkdocno = xmdldocno",
               "   AND xmdksite = '",l_icab003_final,"'",
               "   AND xmdk000 = '1'",
               "   AND xmdk083 = 'Y'",
               "   AND xmdl003 = '",l_xmdadocno,"' ",
               "   AND COALESCE(xmdl004,0) = ",p_seq,
               "   AND COALESCE(xmdl005,0) = ",p_seq1,
               "   AND COALESCE(xmdl006,0) = ",p_seq2
   PREPARE s_aic_carry_xmdl_pre6 FROM g_sql
   
   #最終站出貨數量 - 已續拋數量
   LET l_unship_qty = 0
   EXECUTE s_aic_carry_xmdl_pre6 INTO l_unship_qty
   IF cl_null(l_unship_qty) THEN
      LET l_unship_qty = 0
   END IF
   
   IF p_type = '1' THEN  #1.訂單
      LET g_sql = "SELECT SUM(COALESCE(xmdl018,0))",
                  "  FROM xmdk_t,xmdl_t",
                  " WHERE xmdkent = xmdlent AND xmdlent = ",g_enterprise,
                  "   AND xmdkdocno = xmdldocno",
                  "   AND xmdksite = '",p_site,"'",
                  "   AND xmdk000 = '1'",
                  "   AND xmdkstus NOT IN ('X','S')",
                  "   AND xmdl003 = '",p_docno_from,"'",
                  "   AND COALESCE(xmdl004,0) = '",p_seq,"'",
                  "   AND COALESCE(xmdl005,0) = '",p_seq1,"'",
                  "   AND COALESCE(xmdl006,0) = '",p_seq2,"'"
   
      IF NOT cl_null(p_ship_docno) AND NOT cl_null(p_ship_seq) THEN
         LET g_sql = g_sql," AND NOT (xmdkdocno = '",p_ship_docno,"' AND xmdlseq = '",p_ship_seq,"')"
      END IF
                  
   ELSE   #2.採購單
      LET g_sql = "SELECT SUM(COALESCE(pmdt020,0))",
                  "  FROM pmds_t,pmdt_t",
                  " WHERE pmdsent = pmdtent AND pmdtent = ",g_enterprise,
                  "   AND pmdsdocno = pmdtdocno",
                  "   AND pmdssite = '",p_site,"'",
                  "   AND pmds000 IN ('3','6')",
                  "   AND pmdsstus NOT IN ('X','S')",
                  "   AND pmdt001 = '",p_docno_from,"'",
                  "   AND COALESCE(pmdt002,0) = '",p_seq,"'",
                  "   AND COALESCE(pmdt003,0) = '",p_seq1,"'",
                  "   AND COALESCE(pmdt004,0) = '",p_seq2,"'"
   
      IF NOT cl_null(p_ship_docno) AND NOT cl_null(p_ship_seq) THEN
         LET g_sql = g_sql," AND NOT (pmdsdocno = '",p_ship_docno,"' AND xmdlseq = '",p_ship_seq,"')"
      END IF
      
   END IF
   PREPARE s_aic_carry_xmdl_pre7 FROM g_sql
   
   #未過帳回寫之續拋數量
   LET l_unpost_qty = 0
   EXECUTE s_aic_carry_xmdl_pre7 INTO l_unpost_qty
   IF cl_null(l_unpost_qty) THEN
      LET l_unpost_qty = 0
   END IF
   
   #未續拋數量
   LET r_qty = l_unship_qty - l_unpost_qty

   IF p_batch IS NOT NULL THEN
      LET g_sql = "SELECT SUM(COALESCE(xmdm009,0))-SUM(COALESCE(xmdm012,0))",
                  "  FROM xmdk_t,xmdl_t,xmdm_t",
                  " WHERE xmdkent = xmdlent AND xmdlent = xmdment AND xmdment = ",g_enterprise,
                  "   AND xmdkdocno = xmdldocno AND xmdldocno = xmdmdocno",
                  "   AND xmdlseq = xmdmseq",
                  "   AND xmdksite = '",l_icab003_final,"'",
                  "   AND xmdk000 = '1'",
                  "   AND xmdk083 = 'Y'",
                  "   AND xmdl003 = '",l_xmdadocno,"' ",
                  "   AND COALESCE(xmdl004,0) = ",p_seq,
                  "   AND COALESCE(xmdl005,0) = ",p_seq1,
                  "   AND COALESCE(xmdl006,0) = ",p_seq2,
                  "   AND COALESCE(xmdm007,' ') = COALESCE('",p_batch,"',' ')"
      PREPARE s_aic_carry_xmdm_pre2 FROM g_sql
      
      #最終站出貨數量 - 已續拋數量
      LET l_unship_qty = 0
      EXECUTE s_aic_carry_xmdm_pre2 INTO l_unship_qty
      IF cl_null(l_unship_qty) THEN
         LET l_unship_qty = 0
      END IF
   
      IF p_type = '1' THEN  #1.訂單
         LET g_sql = "SELECT SUM(COALESCE(xmdm009,0))",
                     "  FROM xmdk_t,xmdl_t,xmdm_t",
                     " WHERE xmdkent = xmdlent AND xmdlent = xmdment AND xmdment = ",g_enterprise,
                     "   AND xmdkdocno = xmdldocno AND xmdldocno = xmdmdocno",
                     "   AND xmdlseq = xmdmseq",
                     "   AND xmdksite = '",p_site,"'",
                     "   AND xmdk000 = '1'",
                     "   AND xmdkstus NOT IN ('X','S')",
                     "   AND xmdl003 = '",p_docno_from,"'",
                     "   AND COALESCE(xmdl004,0) = '",p_seq,"'",
                     "   AND COALESCE(xmdl005,0) = '",p_seq1,"'",
                     "   AND COALESCE(xmdl006,0) = '",p_seq2,"'",
                     "   AND COALESCE(xmdm007,' ') = COALESCE('",p_batch,"',' ')"
      
         IF NOT cl_null(p_ship_docno) AND NOT cl_null(p_ship_seq) THEN
            LET g_sql = g_sql," AND NOT (xmdkdocno = '",p_ship_docno,"' AND xmdlseq = '",p_ship_seq,"')"
         END IF
      
      ELSE   #2.採購單
         LET g_sql = "SELECT SUM(COALESCE(pmdu010,0))",
                     "  FROM pmds_t,pmdt_t,pmdu_t",
                     " WHERE pmdsent = pmdtent AND pmdtent = pmduent AND pmduent = ",g_enterprise,
                     "   AND pmdsdocno = pmdtdocno AND pmdtdocno = pmdudocno",
                     "   AND pmdtseq = pmduseq",
                     "   AND pmdssite = '",p_site,"'",
                     "   AND pmds000 IN ('3','6')",
                     "   AND pmdsstus NOT IN ('X','S')",
                     "   AND pmdt001 = '",p_docno_from,"'",
                     "   AND COALESCE(pmdt002,0) = '",p_seq,"'",
                     "   AND COALESCE(pmdt003,0) = '",p_seq1,"'",
                     "   AND COALESCE(pmdt004,0) = '",p_seq2,"'",
                     "   AND COALESCE(pmdu008,' ') = COALESCE('",p_batch,"',' ')"
      
         IF NOT cl_null(p_ship_docno) AND NOT cl_null(p_ship_seq) THEN
            LET g_sql = g_sql," AND NOT (pmdsdocno = '",p_ship_docno,"' AND pmdtseq = '",p_ship_seq,"')"
         END IF
         
      END IF
      PREPARE s_aic_carry_xmdm_pre3 FROM g_sql
      
      #未過帳回寫之續拋數量
      LET l_unpost_qty = 0
      EXECUTE s_aic_carry_xmdm_pre3 INTO l_unpost_qty
      IF cl_null(l_unpost_qty) THEN
         LET l_unpost_qty = 0
      END IF
   
      #未續拋數量(考慮批號)
      LET r_qty_batch = l_unship_qty - l_unpost_qty
   END IF

   RETURN r_chk,r_qty,r_qty_batch
END FUNCTION

################################################################################
# Descriptions...: 改寫temp table
# Memo...........:
# Usage..........: s_aic_carry_crt_tmp_xmd_new()
#                  RETURNING r_success
# Input parameter: 
#                : 
# Return code....: r_success      執行結果
#                : 
# Date & Author..: 17/02/08 By Ann_Huang  #170206-00013#1 add
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_crt_tmp_xmd_new()
   DEFINE r_success    LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   #CREATE TEMP TABLE
   #s_aic_carry_xmdc_temp
  #LET g_sql = "SELECT * FROM xmdc_t INTO TEMP s_aic_xmdc_temp " #170908-00015#1 mark
   #170908-00015#1 --s add
   LET g_sql = " SELECT xmdcent,xmdcsite,xmdcdocno,xmdcseq,xmdc001,",
               "        xmdc002,xmdc003,xmdc004,xmdc005,xmdc006,",
               "        xmdc007,xmdc008,xmdc009,xmdc010,xmdc011,",
               "        xmdc012,xmdc013,xmdc015,xmdc016,xmdc017,",
               "        xmdc019,xmdc020,xmdc021,xmdc022,xmdcunit,",
               "        xmdcorga,xmdc023,xmdc024,xmdc025,xmdc026,",
               "        xmdc027,xmdc028,xmdc029,xmdc030,xmdc031,",
               "        xmdc032,xmdc033,xmdc034,xmdc035,xmdc036,",
               "        xmdc037,xmdc038,xmdc039,xmdc040,xmdc041,",
               "        xmdc042,xmdc043,xmdc044,xmdc045,xmdc046,",
               "        xmdc047,xmdc048,xmdc049,xmdc050,xmdc051,",
               "        xmdc052,xmdc053,xmdc054,xmdc055,xmdc056,",
               "        xmdc057,xmdcud001,xmdcud002,xmdcud003,xmdcud004,",
               "        xmdcud005,xmdcud006,xmdcud007,xmdcud008,xmdcud009,",
               "        xmdcud010,xmdcud011,xmdcud012,xmdcud013,xmdcud014,",
               "        xmdcud015,xmdcud016,xmdcud017,xmdcud018,xmdcud019,",
               "        xmdcud020,xmdcud021,xmdcud022,xmdcud023,xmdcud024,",
               "        xmdcud025,xmdcud026,xmdcud027,xmdcud028,xmdcud029,",
               "        xmdcud030,xmdc058,xmdc059,xmdc060,xmdc061,",
               "        xmdc062,xmdc200,xmdc201 ",
               #"   FROM xmdc_t INTO TEMP s_aic_xmdc_temp "   #181026-00050#1 mark
                #181026-00050#1 -S add
               #這種建立Temptable的方式沒有加上條件,會把所有資料新增至temp table中,需加上1=2條件
               "   FROM xmdc_t ",
               "  WHERE 1 = 2 ",
               "   INTO TEMP s_aic_xmdc_temp "
               #181026-00050#1 -E add
   #170908-00015#1 --e add
   PREPARE s_aic_carry_xmdc_temp FROM g_sql
   EXECUTE s_aic_carry_xmdc_temp
   FREE s_aic_carry_xmdc_temp

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "CREATE:s_aic_xmdc_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()  

      LET r_success = FALSE
      RETURN r_success
   END IF

   #s_aic_carry_xmdd_temp
  #LET g_sql = "SELECT * FROM xmdd_t INTO TEMP s_aic_xmdd_temp" #170908-00015#1 mark
   #170908-00015#1 --s add
   LET g_sql = " SELECT xmddent,xmddsite,xmdddocno,xmddseq,xmddseq1,",
               "        xmddseq2,xmdd001,xmdd002,xmdd003,xmdd004,",
               "        xmdd005,xmdd006,xmdd007,xmdd008,xmdd009,",
               "        xmdd010,xmdd011,xmdd012,xmdd013,xmdd014,",
               "        xmdd015,xmdd016,xmdd017,xmdd018,xmdd019,",
               "        xmdd020,xmdd021,xmdd022,xmdd023,xmdd024,",
               "        xmdd025,xmdd026,xmdd027,xmdd028,xmdd029,",
               "        xmdd030,xmdd031,xmdd032,xmdd033,xmdd034,",
               "        xmdd035,xmdd200,xmdd201,xmdd202,xmdd203,",
               "        xmdd204,xmdd205,xmdd206,xmddunit,xmdd207,",
               "        xmdd208,xmdd209,xmdd210,xmdd211,xmdd212,",
               "        xmdd213,xmdd214,xmdd215,xmdd216,xmdd217,",
               "        xmdd218,xmdd219,xmdd220,xmdd221,xmdd222,",
               "        xmdd223,xmdd224,xmdd225,xmdd226,xmdd227,",
               "        xmdd228,xmddorga,xmdd229,xmdd230,xmddud001,",
               "        xmddud002,xmddud003,xmddud004,xmddud005,xmddud006,",
               "        xmddud007,xmddud008,xmddud009,xmddud010,xmddud011,",
               "        xmddud012,xmddud013,xmddud014,xmddud015,xmddud016,",
               "        xmddud017,xmddud018,xmddud019,xmddud020,xmddud021,",
               "        xmddud022,xmddud023,xmddud024,xmddud025,xmddud026,",
               "        xmddud027,xmddud028,xmddud029,xmddud030,xmdd036,",
               "        xmdd037,xmdd038,xmdd039,xmdd231,xmdd040 ",
               #"   FROM xmdd_t INTO TEMP s_aic_xmdd_temp"  #181026-00050#1 mark
                #181026-00050#1 -S add
               #這種建立Temptable的方式沒有加上條件,會把所有資料新增至temp table中,需加上1=2條件
               "   FROM xmdd_t ",
               "  WHERE 1 = 2 ",
               "   INTO TEMP s_aic_xmdd_temp "
               #181026-00050#1 -E add
   #170908-00015#1 --e add
   PREPARE s_aic_carry_xmdd_temp FROM g_sql
   EXECUTE s_aic_carry_xmdd_temp
   FREE s_aic_carry_xmdd_temp

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "CREATE:s_aic_xmdd_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()  

      LET r_success = FALSE
      RETURN r_success
   END IF

   #s_aic_carry_xmdf_temp
  #LET g_sql = "SELECT * FROM xmdf_t INTO TEMP s_aic_xmdf_temp " #170908-00015#1 mark
   #170908-00015#1 --s add
   LET g_sql = " SELECT xmdfent,xmdfsite,xmdfdocno,xmdfseq,xmdfseq2,",
               "        xmdf002,xmdf003,xmdf004,xmdf005,xmdf006,",
               "        xmdf007,xmdf200,xmdf201,xmdf202,xmdfunit,",
               "        xmdfud001,xmdfud002,xmdfud003,xmdfud004,xmdfud005,",
               "        xmdfud006,xmdfud007,xmdfud008,xmdfud009,xmdfud010,",
               "        xmdfud011,xmdfud012,xmdfud013,xmdfud014,xmdfud015,",
               "        xmdfud016,xmdfud017,xmdfud018,xmdfud019,xmdfud020,",
               "        xmdfud021,xmdfud022,xmdfud023,xmdfud024,xmdfud025,",
               "        xmdfud026,xmdfud027,xmdfud028,xmdfud029,xmdfud030,",
               "        xmdf203,xmdf008 ",
              # "   FROM xmdf_t INTO TEMP s_aic_xmdf_temp " #181026-00050#1 mark
               #181026-00050#1 -S add
               #這種建立Temptable的方式沒有加上條件,會把所有資料新增至temp table中,需加上1=2條件
               "   FROM xmdf_t ",
               "  WHERE 1 = 2 ",
               "   INTO TEMP s_aic_xmdf_temp "
               #181026-00050#1 -E add
   #170908-00015#1 --e add
   PREPARE s_aic_carry_xmdf_temp FROM g_sql
   EXECUTE s_aic_carry_xmdf_temp
   FREE s_aic_carry_xmdf_temp

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "CREATE:s_aic_xmdf_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()  

      LET r_success = FALSE
      RETURN r_success
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 改寫temp table s_aic_carry_create_temp_table_order
# Memo...........:
# Usage..........: CALL s_aic_carry_crt_tmp_table_order_new()
#                  RETURNING r_success
# Input parameter: 
#                : 
# Return code....: r_success   執行結果
#                : 
# Date & Author..: 17/02/08 By Ann_Huang   #170206-00013#1 add
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_crt_tmp_table_order_new()
   DEFINE r_success     LIKE type_t.num5        #執行結果

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   #CREATE TEMP TABLE
   #s_aic_carry_pmdn_temp
  #LET g_sql = "SELECT * FROM pmdn_t INTO TEMP s_aic_pmdn_temp " #170908-00015#1 mark
   #170908-00015#1 --s add
   LET g_sql = " SELECT pmdnent,pmdnsite,pmdnunit,pmdndocno,pmdnseq, ",
               "        pmdn001,pmdn002,pmdn003,pmdn004,pmdn005,",
               "        pmdn006,pmdn007,pmdn008,pmdn009,pmdn010,",
               "        pmdn011,pmdn012,pmdn013,pmdn014,pmdn015,",
               "        pmdn016,pmdn017,pmdn019,pmdn020,pmdn021,",
               "        pmdn022,pmdnorga,pmdn023,pmdn024,pmdn025,",
               "        pmdn026,pmdn027,pmdn028,pmdn029,pmdn030,",
               "        pmdn031,pmdn032,pmdn033,pmdn034,pmdn035,",
               "        pmdn036,pmdn037,pmdn038,pmdn039,pmdn040,",
               "        pmdn041,pmdn042,pmdn043,pmdn044,pmdn045,",
               "        pmdn046,pmdn047,pmdn048,pmdn049,pmdn050,",
               "        pmdn051,pmdn052,pmdn053,pmdn200,pmdn201,",
               "        pmdn202,pmdn203,pmdn204,pmdn205,pmdn206,",
               "        pmdn207,pmdn208,pmdn209,pmdn210,pmdn211,",
               "        pmdn212,pmdn213,pmdn214,pmdn215,pmdn216,",
               "        pmdn217,pmdn218,pmdn219,pmdn220,pmdn221,",
               "        pmdn222,pmdn223,pmdn224,pmdn900,pmdn999,",
               "        pmdnud001,pmdnud002,pmdnud003,pmdnud004,pmdnud005,",
               "        pmdnud006,pmdnud007,pmdnud008,pmdnud009,pmdnud010,",
               "        pmdnud011,pmdnud012,pmdnud013,pmdnud014,pmdnud015,",
               "        pmdnud016,pmdnud017,pmdnud018,pmdnud019,pmdnud020,",
               "        pmdnud021,pmdnud022,pmdnud023,pmdnud024,pmdnud025,",
               "        pmdnud026,pmdnud027,pmdnud028,pmdnud029,pmdnud030,",
               "        pmdn225,pmdn054,pmdn055,pmdn056,pmdn057,",
               "        pmdn226,pmdn227,pmdn058,pmdn228,pmdn059,",
               "        pmdn060 ",
               #"   FROM pmdn_t INTO TEMP s_aic_pmdn_temp " #181026-00050#1 mark
               #181026-00050#1 -S add
               #這種建立Temptable的方式沒有加上條件,會把所有資料新增至temp table中,需加上1=2條件
               "   FROM pmdn_t ",
               "  WHERE 1 = 2 ",
               "   INTO TEMP s_aic_pmdn_temp "
               #181026-00050#1 -E add
   #170908-00015#1 --e add
   PREPARE s_aic_carry_pmdn_temp FROM g_sql
   EXECUTE s_aic_carry_pmdn_temp
   FREE s_aic_carry_pmdn_temp

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "CREATE:s_aic_pmdn_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success
   END IF

   #s_aic_carry_pmdo_temp
  #LET g_sql = "SELECT * FROM pmdo_t INTO TEMP s_aic_pmdo_temp " #170908-00015#1 mark
   #170908-00015#1 --s add
   LET g_sql = "SELECT pmdoent,pmdosite,pmdodocno,pmdoseq,pmdoseq1,",
               "       pmdoseq2,pmdo001,pmdo002,pmdo003,pmdo004,",
               "       pmdo005,pmdo006,pmdo007,pmdo008,pmdo009,",
               "       pmdo010,pmdo011,pmdo012,pmdo013,pmdo014,",
               "       pmdo015,pmdo016,pmdo017,pmdo019,pmdo020,",
               "       pmdo021,pmdo022,pmdo023,pmdo024,pmdo025,",
               "       pmdo026,pmdo027,pmdo028,pmdo029,pmdo030,",
               "       pmdo031,pmdo032,pmdo033,pmdo034,pmdo035,",
               "       pmdo036,pmdo037,pmdo038,pmdo039,pmdo040,",
               "       pmdo200,pmdo201,pmdo900,pmdo999,pmdoud001,",
               "       pmdoud002,pmdoud003,pmdoud004,pmdoud005,pmdoud006,",
               "       pmdoud007,pmdoud008,pmdoud009,pmdoud010,pmdoud011,",
               "       pmdoud012,pmdoud013,pmdoud014,pmdoud015,pmdoud016,",
               "       pmdoud017,pmdoud018,pmdoud019,pmdoud020,pmdoud021,",
               "       pmdoud022,pmdoud023,pmdoud024,pmdoud025,pmdoud026,",
               "       pmdoud027,pmdoud028,pmdoud029,pmdoud030,pmdo041,",
               "       pmdo042,pmdo043,pmdo044,pmdo045 ",
               #"  FROM pmdo_t INTO TEMP s_aic_pmdo_temp " #181026-00050#1 mark
               #181026-00050#1 -S add
               #這種建立Temptable的方式沒有加上條件,會把所有資料新增至temp table中,需加上1=2條件
               "   FROM pmdo_t ",
               "  WHERE 1 = 2 ",
               "   INTO TEMP s_aic_pmdo_temp "
               #181026-00050#1 -E add
   #170908-00015#1 --e add
   PREPARE s_aic_carry_pmdo_temp FROM g_sql
   EXECUTE s_aic_carry_pmdo_temp
   FREE s_aic_carry_pmdo_temp

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "CREATE:s_aic_pmdo_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success
   END IF

   #s_aic_carry_pmdp_temp
  #LET g_sql = "SELECT * FROM pmdp_t INTO TEMP s_aic_pmdp_temp " #170908-00015#1 mark
   #170908-00015#1 --s add
   LET g_sql = " SELECT pmdpent,pmdpsite,pmdpdocno,pmdpseq,pmdpseq1,",
               "        pmdp001,pmdp002,pmdp003,pmdp004,pmdp005,",
               "        pmdp006,pmdp007,pmdp008,pmdp009,pmdp010,",
               "        pmdp011,pmdp012,pmdp021,pmdp022,pmdp023,",
               "        pmdp024,pmdp025,pmdp026,pmdp900,pmdp999,",
               "        pmdpud001,pmdpud002,pmdpud003,pmdpud004,pmdpud005,",
               "        pmdpud006,pmdpud007,pmdpud008,pmdpud009,pmdpud010,",
               "        pmdpud011,pmdpud012,pmdpud013,pmdpud014,pmdpud015,",
               "        pmdpud016,pmdpud017,pmdpud018,pmdpud019,pmdpud020,",
               "        pmdpud021,pmdpud022,pmdpud023,pmdpud024,pmdpud025,",
               "        pmdpud026,pmdpud027,pmdpud028,pmdpud029,pmdpud030 ",
               #"   FROM pmdp_t INTO TEMP s_aic_pmdp_temp " #181026-00050#1 mark
               #181026-00050#1 -S add
               #這種建立Temptable的方式沒有加上條件,會把所有資料新增至temp table中,需加上1=2條件
               "   FROM pmdp_t ",
               "  WHERE 1 = 2 ",
               "   INTO TEMP s_aic_pmdp_temp "
               #181026-00050#1 -E add
   #170908-00015#1 --e add
   PREPARE s_aic_carry_pmdp_temp FROM g_sql
   EXECUTE s_aic_carry_pmdp_temp
   FREE s_aic_carry_pmdp_temp

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "CREATE:s_aic_pmdp_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF

   #s_aic_carry_pmdq_temp
  #LET g_sql = "SELECT * FROM pmdq_t INTO TEMP s_aic_pmdq_temp " #170908-00015#1 mark
   #170908-00015#1 --s add
   LET g_sql = " SELECT pmdqent,pmdqsite,pmdqdocno,pmdqseq,pmdqseq2,",
               "        pmdq002,pmdq003,pmdq004,pmdq005,pmdq006,",
               "        pmdq007,pmdq008,pmdq201,pmdq202,pmdq900,",
               "        pmdq999,pmdqud001,pmdqud002,pmdqud003,pmdqud004,",
               "        pmdqud005,pmdqud006,pmdqud007,pmdqud008,pmdqud009,",
               "        pmdqud010,pmdqud011,pmdqud012,pmdqud013,pmdqud014,",
               "        pmdqud015,pmdqud016,pmdqud017,pmdqud018,pmdqud019,",
               "        pmdqud020,pmdqud021,pmdqud022,pmdqud023,pmdqud024,",
               "        pmdqud025,pmdqud026,pmdqud027,pmdqud028,pmdqud029,",
               "        pmdqud030 ",
               #"   FROM pmdq_t INTO TEMP s_aic_pmdq_temp " #181026-00050#1 mark
               #181026-00050#1 -S add
               #這種建立Temptable的方式沒有加上條件,會把所有資料新增至temp table中,需加上1=2條件
               "   FROM pmdq_t ",
               "  WHERE 1 = 2 ",
               "   INTO TEMP s_aic_pmdq_temp "
               #181026-00050#1 -E add
   #170908-00015#1 --e add
   PREPARE s_aic_carry_pmdq_temp FROM g_sql
   EXECUTE s_aic_carry_pmdq_temp
   FREE s_aic_carry_pmdq_temp

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "CREATE:s_aic_pmdq_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 寫入單頭/單身的備註
# Memo...........: (從前一張單據，取得ooff_t的資料，寫入ooff的資料)
# Usage..........: CALL s_aic_carry_ins_ooff(p_ins_prog,p_ins_docno,p_prog,p_docno)
#                  RETURNING r_success
# Input parameter: p_ins_prog     要寫入ooff的程式代號
#                : p_ins_docno    要寫入ooff的新單號
#                : p_prog         來源程式代號
#                : p_docno        來源單號
# Return code....: r_success      寫入ooff_t結果(TRUE/FALSE)
# Date & Author..: 2017/08/22 By dorislai (#170221-00029#2)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_ins_ooff(p_ins_prog,p_ins_docno,p_prog,p_docno)
   DEFINE p_ins_prog    LIKE gzza_t.gzza001
   DEFINE p_ins_docno   LIKE xmda_t.xmdadocno
   DEFINE p_prog        LIKE gzza_t.gzza001
   DEFINE p_docno       LIKE xmda_t.xmdadocno
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_sql         STRING 
   
   LET r_success = TRUE
   
   #寫入單頭/單身的備註
   LET l_sql = "INSERT INTO ooff_t(ooffent,ooffstus,ooff001,ooff002,ooff003,ooff004,ooff005,ooff006,ooff007,",
               "                   ooff008,ooff009,ooff010,ooff011,ooff012,ooff013,ooff014,ooffownid,ooffowndp,ooffcrtid,",
               "                   ooffcrtdp,ooffcrtdt) ",
               "           (SELECT ooffent,ooffstus,ooff001,'",p_ins_prog,"','",p_ins_docno,"',ooff004,ooff005,ooff006,ooff007,",
               "                   ooff008,ooff009,ooff010,ooff011,ooff012,ooff013,ooff014,'",g_user,"','",g_dept,"','",g_user,"',",
               "                   '",g_dept,"',TO_DATE('",cl_get_current(),"','YYYY/MM/DD HH24:MI:SS') ",
               "              FROM ooff_t ",
               "              WHERE ooffent=",g_enterprise," AND ooff001 IN ('6','7') AND ooff003='",p_docno,"'"
   #170817-00043#5 --s mark
   #IF p_prog MATCHES 'apmt500*' THEN
   #   #若當站有委外工單開立點，訂單的來源單據，可能是採購單或委外採購單
   #   LET l_sql = l_sql CLIPPED," AND ooff002 IN ('apmt500','apmt501')  ) "
   #ELSE
   #   LET l_sql = l_sql CLIPPED," AND ooff002='",p_prog,"'  ) "
   #END IF
   #170817-00043#5 --e mark
   #170817-00043#5 --s add
   CASE 
      WHEN p_prog MATCHES 'apmt500*'
         #若當站有委外工單開立點，訂單的來源單據，可能是採購單或委外採購單
         LET l_sql = l_sql CLIPPED," AND ooff002 IN ('apmt500','apmt501') ) "
      WHEN p_prog MATCHES 'apmt580*'
         #若當站有委外工單開立點，可能是倉退單貨委外倉退單
         LET l_sql = l_sql CLIPPED," AND ooff002 IN ('apmt580','apmt581')  ) "
      WHEN p_prog MATCHES 'apmt530*'
         #可能是收貨入庫單、委外採購單、無採購收貨入庫單
         LET l_sql = l_sql CLIPPED," AND ooff002 IN ('apmt530','apmt531','apmt532')  ) "
      WHEN p_prog MATCHES 'axmt540*'
         #可能是出貨單或無訂單出貨單
         LET l_sql = l_sql CLIPPED," AND ooff002 IN ('axmt540','axmt541')  ) "
      OTHERWISE
         LET l_sql = l_sql CLIPPED," AND ooff002='",p_prog,"'  ) "
   END CASE
   #170817-00043#5 --e add
   PREPARE s_aic_carry_ins_body_ooff FROM l_sql
   EXECUTE s_aic_carry_ins_body_ooff
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "s_aic_carry_ins_ooff:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
   END IF
   
   RETURN r_success
END FUNCTION

#获取料件是否检验（同一般采购单）
#170830-00067#1 add
PUBLIC FUNCTION s_aic_carry_get_qcap006(p_pmdn001,p_pmdn002,p_pmdn004,p_pmdn005)
DEFINE l_sql      STRING
DEFINE r_pmdn052  LIKE pmdn_t.pmdn052
DEFINE p_pmdn001  LIKE pmdn_t.pmdn001
DEFINE p_pmdn002  LIKE pmdn_t.pmdn002
DEFINE p_pmdn004  LIKE pmdn_t.pmdn004
DEFINE p_pmdn005  LIKE pmdn_t.pmdn005

      LET r_pmdn052 = ''

      LET l_sql = " SELECT qcap006 FROM qcap_t ",
                 " WHERE qcapent = '",g_enterprise,"' ",
                 "  AND qcapsite = '",g_site,"' ",
                 "  AND qcap001 = '",p_pmdn001,"' ",
                 "  AND qcap002 = '",g_pmdl.pmdl004,"' "

      IF p_pmdn002 IS NOT NULL THEN
         LET l_sql = l_sql ," AND (qcap005 = '",p_pmdn002,"' OR qcap005 = 'ALL' )"
      END IF
      IF (NOT cl_null(p_pmdn004)) AND (NOT cl_null(p_pmdn005)) THEN
         LET l_sql = l_sql ," AND (qcap003 = '",p_pmdn004,"' OR qcap003 = 'ALL' ) AND qcap004 = '",p_pmdn005,"' "
      END IF

      PREPARE get_qcap FROM l_sql
      EXECUTE get_qcap INTO r_pmdn052
      FREE get_qcap

      IF cl_null(r_pmdn052) THEN
         #若沒有維護aqci050,再從aqci040中帶值
         SELECT imae114 INTO r_pmdn052 FROM imae_t
             WHERE imaeent = g_enterprise AND imaesite = g_site AND imae001 = p_pmdn001

      END IF

      IF cl_null(r_pmdn052) THEN
         LET r_pmdn052 = 'N'
      END IF
      RETURN r_pmdn052    
END FUNCTION

################################################################################
# Descriptions...: 還原時刪除備註擋
# Memo...........: #170817-00043#11
# Usage..........: CALL s_aic_carry_del_ooff(p_prog,p_docno)
#                  RETURNING r_success
# Input parameter: p_prog  程式
#                : p_docno 要刪除備註的單據
# Return code....: r_success 刪除是否成功
# Date & Author..: 2017/09/21 By 08171
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_del_ooff(p_prog,p_docno)
   DEFINE p_prog        LIKE gzza_t.gzza001
   DEFINE p_docno       LIKE xmda_t.xmdadocno
   DEFINE r_success     LIKE type_t.num5
   DEFINE l_sql         STRING 
   
   LET r_success = TRUE
   
   #寫入單頭/單身的備註
   LET l_sql = " DELETE FROM ooff_t ",
               "       WHERE ooffent=",g_enterprise," AND ooff001 IN ('6','7') AND ooff003='",p_docno,"'",
               "         AND ooff002='",p_prog,"' "
 
   PREPARE s_aic_carry_del_body_ooff FROM l_sql
   EXECUTE s_aic_carry_del_body_ooff
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "s_aic_carry_del_ooff:",SQLERRMESSAGE
      LET g_errparam.code = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新預先採購單的資料
# Memo...........:
# Usage..........: CALL s_aic_carry_pre_po_upd(p_type,p_site,p_pmdl031)
#                  RETURNING r_success
# Input parameter: p_type         類型(1.新增數量 2.減少數量)
#                : p_site         單據所在據點
#                : p_pmdl031      多角序號
# Return code....: r_success      TRUE FALSE
# Date & Author..: 2017/09/25 By dorislai (170105-00050#5)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_pre_po_upd(p_type,p_site,p_pmdl031)
   DEFINE p_type       LIKE type_t.num5
   DEFINE p_site       LIKE pmdl_t.pmdlsite
   DEFINE p_pmdl031    LIKE pmdl_t.pmdl031
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_sql        STRING
   DEFINE l_num        LIKE pmdn_t.pmdn007 #記錄當下項次的數量
   DEFINE l_qty        LIKE xmdc_t.xmdc007  #記錄要增減的數量
   DEFINE l_cnt        LIKE type_t.num10
   DEFINE l_total      LIKE type_t.num10    #記錄項次的總筆數
   DEFINE l_pmdn     RECORD
            pmdndocno  LIKE pmdn_t.pmdndocno,
            pmdnseq    LIKE pmdn_t.pmdnseq,
            pmdn007    LIKE pmdn_t.pmdn007, #數量
            pmdn059    LIKE pmdn_t.pmdn059, #來源單號
            pmdn060    LIKE pmdn_t.pmdn060  #來源項次
          END RECORD
   DEFINE l_pre_pmdo     RECORD
            pmdodocno  LIKE pmdo_t.pmdodocno,
            pmdoseq    LIKE pmdo_t.pmdoseq,  
            pmdoseq1   LIKE pmdo_t.pmdoseq1, 
            pmdoseq2   LIKE pmdo_t.pmdoseq2,
            pmdo006    LIKE pmdo_t.pmdo006,            
            pmdo015    LIKE pmdo_t.pmdo015,  
            pmdo019    LIKE pmdo_t.pmdo019  
          END RECORD
   
   LET r_success = TRUE

   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM pmdl_t
    WHERE pmdlent  = g_enterprise
      AND pmdlsite = p_site           #營運據點  
      AND pmdl031  = p_pmdl031        #多角流程序號   
      AND pmdlstus <> 'X'             #排除作廢
        
   #無採購單 故直接回傳true
   IF l_cnt = 0 THEN
      RETURN r_success
   END IF
      
   #用多角流程序號取得採購單資料
   LET l_sql = "SELECT pmdndocno,pmdnseq,pmdn007,pmdn059,pmdn060 ",
               "  FROM pmdl_t,pmdn_t ",
               " WHERE pmdlent = pmdnent AND pmdldocno = pmdndocno ",
               "   AND pmdlent  = '",g_enterprise,"' ",
               "   AND pmdlsite = '",p_site,"' ",     #營運據點  
               "   AND pmdl031  = '",p_pmdl031,"' ",  #多角流程序號   
               "   AND pmdlstus <> 'X' ",             #排除作廢
               " ORDER BY pmdnseq "
   PREPARE aicp210_po_pre1 FROM l_sql
   DECLARE aicp210_po_cur1 CURSOR FOR aicp210_po_pre1   
   
   #取得來源預先採購單的已收貨量、已入庫量
   LET l_sql = "SELECT pmdodocno,pmdoseq,pmdoseq1,pmdoseq2,pmdo006,pmdo015,pmdo019",
               "  FROM pmdl_t,pmdo_t",
               " WHERE pmdlent = pmdoent AND pmdldocno = pmdodocno ",
               "   AND pmdl005 = '4' ", #預先採購單
               "   AND pmdoent = '",g_enterprise,"'",
               "   AND pmdodocno = ? AND pmdoseq = ? "
   IF p_type = '1' THEN
      LET l_sql = l_sql CLIPPED," ORDER BY pmdoseq1,pmdoseq2 "
   ELSE
      LET l_sql = l_sql CLIPPED," ORDER BY pmdoseq1 DESC,pmdoseq2 DESC "
   END IF            
   PREPARE aicp210_po_pre2 FROM l_sql
   DECLARE aicp210_po_cur2 CURSOR FOR aicp210_po_pre2
   
   #取得項次的總筆數
   LET l_sql = "SELECT COUNT(1) FROM pmdo_t",
               " WHERE pmdoent = '",g_enterprise,"'",
               "   AND pmdodocno = ? AND pmdoseq = ? "
   PREPARE aicp210_po_cnt1 FROM l_sql
   
   #採購單單身的每一筆資料
   INITIALIZE l_pmdn TO NULL
   FOREACH aicp210_po_cur1 INTO l_pmdn.pmdndocno,l_pmdn.pmdnseq,l_pmdn.pmdn007,l_pmdn.pmdn059,l_pmdn.pmdn060
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "aicp210_po_cur1:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #記錄當筆項次的數量
      LET l_num = l_pmdn.pmdn007
      
      #取得項次的總筆數
      LET l_total = 0
      EXECUTE aicp210_po_cnt1 USING l_pmdn.pmdn059,l_pmdn.pmdn060 INTO l_total
      
      #依對應的單據.項次，取得預先採購單的「交期明細」資料
      LET l_qty = 0
      INITIALIZE l_pre_pmdo TO NULL
      FOREACH aicp210_po_cur2 USING l_pmdn.pmdn059,l_pmdn.pmdn060 INTO l_pre_pmdo.pmdodocno,l_pre_pmdo.pmdoseq,
                                                                       l_pre_pmdo.pmdoseq1,l_pre_pmdo.pmdoseq2,
                                                                       l_pre_pmdo.pmdo006,l_pre_pmdo.pmdo015,
                                                                       l_pre_pmdo.pmdo019
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "aicp210_po_cur2:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         IF p_type = '1' THEN
            #要回寫的數量
            #  (採購單數量<預先分批數量)     或  (採購單數量>預先分批數量&最後ㄧ筆分批序→數量全回寫)
            IF l_num < (l_pre_pmdo.pmdo006 - l_pre_pmdo.pmdo015) OR (l_total-1 = 0) THEN
               LET l_qty = l_num
            ELSE
               LET l_qty = l_pre_pmdo.pmdo006 - l_pre_pmdo.pmdo015
            END IF
            #更新
            UPDATE pmdo_t SET pmdo015 = pmdo015 + l_qty, #已收貨量
                              pmdo019 = pmdo019 + l_qty  #已入庫量
             WHERE pmdoent   = g_enterprise
               AND pmdodocno = l_pre_pmdo.pmdodocno
               AND pmdoseq   = l_pre_pmdo.pmdoseq
               AND pmdoseq1  = l_pre_pmdo.pmdoseq1
               AND pmdoseq2  = l_pre_pmdo.pmdoseq2
         ELSE
            #要扣回去的數量
           # LET l_qty = l_pre_pmdo.pmdo015
            #LET l_qty = l_pmdn.pmdn007
            IF l_num < l_pre_pmdo.pmdo015 THEN
               LET l_qty = l_num
            ELSE
               LET l_qty = l_pre_pmdo.pmdo015
            END IF
            #更新
            UPDATE pmdo_t SET pmdo015 = pmdo015 - l_qty, #已收貨量
                              pmdo019 = pmdo019 - l_qty  #已入庫量
             WHERE pmdoent   = g_enterprise
               AND pmdodocno = l_pre_pmdo.pmdodocno
               AND pmdoseq   = l_pre_pmdo.pmdoseq
               AND pmdoseq1  = l_pre_pmdo.pmdoseq1
               AND pmdoseq2  = l_pre_pmdo.pmdoseq2
         END IF
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "upd_pmdo:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            RETURN r_success
         END IF
         
         #表示已回寫完ㄧ筆項次的分批序
         LET l_total = l_total - 1
         #扣掉用掉的數量
         LET l_num = l_num - l_qty
         #若沒數量了，就離開，跑下一個項次
         IF l_num <= 0 THEN
            EXIT FOREACH
         END IF
      END FOREACH
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新預先訂單的資料
# Memo...........:
# Usage..........: CALL s_aic_carry_pre_so_upd(p_type,p_site,p_xmda031)
#                  RETURNING r_success
# Input parameter: p_type         類型(1.新增數量 2.減少數量)
#                : p_site         單據所在據點
#                : p_pmdl031      多角序號
# Return code....: r_success      TRUE FALSE
# Date & Author..: 2017/09/25 By dorislai (170105-00050#5)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_pre_so_upd(p_type,p_site,p_xmda031)
   DEFINE p_type       LIKE type_t.num5
   DEFINE p_site       LIKE xmda_t.xmdasite
   DEFINE p_xmda031    LIKE xmda_t.xmda031
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_sql        STRING
   DEFINE l_num        LIKE xmdc_t.xmdc007  #記錄當下項次的數量
   DEFINE l_qty        LIKE xmdc_t.xmdc007  #記錄要增減的數量
   DEFINE l_cnt        LIKE type_t.num10 
   DEFINE l_total      LIKE type_t.num10    #記錄項次的總筆數
   DEFINE l_xmdc     RECORD
            xmdcdocno  LIKE xmdc_t.xmdcdocno,
            xmdcseq    LIKE xmdc_t.xmdcseq,
            xmdc007    LIKE xmdc_t.xmdc007, #數量
            xmdc055    LIKE xmdc_t.xmdc055, #來源單號
            xmdc056    LIKE xmdc_t.xmdc056  #來源項次
          END RECORD
   DEFINE l_pre_xmdd     RECORD
            xmdddocno  LIKE xmdd_t.xmdddocno,
            xmddseq    LIKE xmdd_t.xmddseq,  
            xmddseq1   LIKE xmdd_t.xmddseq1, 
            xmddseq2   LIKE xmdd_t.xmddseq2,
            xmdd006    LIKE xmdd_t.xmdd006,            
            xmdd014    LIKE xmdd_t.xmdd014  
          END RECORD
   
   LET r_success = TRUE
   
   #用多角流程序號取得採購單資料
   LET l_sql = "SELECT xmdcdocno,xmdcseq,xmdc007,xmdc055,xmdc056 ",
               "  FROM xmda_t,xmdc_t ",
               " WHERE xmdaent = xmdcent AND xmdadocno = xmdcdocno ",
               "   AND xmdaent  = '",g_enterprise,"' ",
               "   AND xmdasite = '",p_site,"' ",     #營運據點  
               "   AND xmda031  = '",p_xmda031,"' ",  #多角流程序號   
               "   AND xmdastus <> 'X' ",             #排除作廢
               " ORDER BY xmdcseq "
   PREPARE aicp210_so_pre1 FROM l_sql
   DECLARE aicp210_so_cur1 CURSOR FOR aicp210_so_pre1   
   
   #取得來源預先採購單的已收貨量、已入庫量
   LET l_sql = "SELECT xmdddocno,xmddseq,xmddseq1,xmddseq2,xmdd006,xmdd014",
               "  FROM xmda_t,xmdd_t",
               " WHERE xmdaent = xmddent AND xmdadocno = xmdddocno ",
               "   AND xmda005 = '5' ", #預先採購單
               "   AND xmdaent = '",g_enterprise,"'",
               "   AND xmdddocno = ? AND xmddseq = ? "
   IF p_type = '1' THEN
      LET l_sql = l_sql CLIPPED," ORDER BY xmddseq1,xmddseq2 "
   ELSE
      LET l_sql = l_sql CLIPPED," ORDER BY xmddseq1 DESC,xmddseq2 DESC "
   END IF
   PREPARE aicp210_so_pre2 FROM l_sql
   DECLARE aicp210_so_cur2 CURSOR FOR aicp210_so_pre2
   
   #取得項次的總筆數
   LET l_sql = "SELECT COUNT(1) FROM xmdd_t",
               " WHERE xmddent = '",g_enterprise,"'",
               "   AND xmdddocno = ? AND xmddseq = ? "
   PREPARE aicp210_so_cnt1 FROM l_sql
   
   #採購單單身的每一筆資料
   INITIALIZE l_xmdc TO NULL
   FOREACH aicp210_so_cur1 INTO l_xmdc.xmdcdocno,l_xmdc.xmdcseq,l_xmdc.xmdc007,l_xmdc.xmdc055,l_xmdc.xmdc056 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "aicp210_so_cur1:",SQLERRMESSAGE
         LET g_errparam.code = SQLCA.SQLCODE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #記錄當筆項次的數量
      LET l_num = l_xmdc.xmdc007
      
      #取得項次的總筆數
      LET l_total = 0
      EXECUTE aicp210_so_cnt1 USING l_xmdc.xmdc055,l_xmdc.xmdc056 INTO l_total
      
      #依對應的單據.項次，取得預先採購單的「交期明細」資料
      LET l_qty = 0
      INITIALIZE l_pre_xmdd TO NULL
      FOREACH aicp210_so_cur2 USING l_xmdc.xmdc055,l_xmdc.xmdc056 INTO l_pre_xmdd.xmdddocno,l_pre_xmdd.xmddseq,
                                                                       l_pre_xmdd.xmddseq1,l_pre_xmdd.xmddseq2,
                                                                       l_pre_xmdd.xmdd006,l_pre_xmdd.xmdd014
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "aicp210_so_cur2:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         IF p_type = '1' THEN
            #要回寫的數量
            #  (訂單數量<預先分批數量)        或  (訂單數量>預先分批數量&最後ㄧ筆分批序→數量全回寫)
            IF l_num < (l_pre_xmdd.xmdd006-l_pre_xmdd.xmdd014) OR (l_total-1 = 0) THEN
               LET l_qty = l_num
            ELSE
               LET l_qty = l_pre_xmdd.xmdd006-l_pre_xmdd.xmdd014
            END IF
            #更新
            UPDATE xmdd_t SET xmdd014 = xmdd014 + l_qty
             WHERE xmddent   = g_enterprise
               AND xmdddocno = l_pre_xmdd.xmdddocno
               AND xmddseq   = l_pre_xmdd.xmddseq
               AND xmddseq1  = l_pre_xmdd.xmddseq1
               AND xmddseq2  = l_pre_xmdd.xmddseq2 
         ELSE
            #要扣回去的數量
          #  LET l_qty = l_pre_xmdd.xmdd014
            #LET l_qty = l_xmdc.xmdd006
            IF l_num < l_pre_xmdd.xmdd014 THEN
               LET l_qty = l_num
            ELSE
               LET l_qty = l_pre_xmdd.xmdd014
            END IF
            #更新            
            UPDATE xmdd_t SET xmdd014 = xmdd014 - l_qty #已出貨量
             WHERE xmddent   = g_enterprise
               AND xmdddocno = l_pre_xmdd.xmdddocno
               AND xmddseq   = l_pre_xmdd.xmddseq
               AND xmddseq1  = l_pre_xmdd.xmddseq1
               AND xmddseq2  = l_pre_xmdd.xmddseq2 
         END IF
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "upd_xmdd:",SQLERRMESSAGE
            LET g_errparam.code = SQLCA.SQLCODE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            RETURN r_success
         END IF
         
         #表示已回寫完ㄧ筆項次的分批序
         LET l_total = l_total - 1
         #扣掉用掉的數量
         LET l_num = l_num - l_qty
         #若沒數量了，就離開，跑下一個項次
         IF l_num <= 0 THEN
            EXIT FOREACH
         END IF
      END FOREACH
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 將傳入之訂單單號之交期明細檔，一一產生工單委外採購單
# Memo...........: 請依照順序CALL
#                  CALL s_aic_carry_create_temp_asfp400()
#                  CALL s_transaction_begin()
#                  CALL s_aic_carry_gen_tri_wo()
#                  CALL s_transaction_end(Y,0)
#                  CALL s_aic_carry_drop_temp_asfp400()
# Usage..........: CALL s_aic_carry_gen_tri_wo(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_pmdl052,p_date,p_icab001,p_icab002)
#                  RETURNING r_success,r_pmdldocno
# Input parameter: p_firstpmdldocno #初始採購單號(若為Null表示由"初始訂單"發起)
#                : p_firstxmdadocno #初始訂單單號(若為Null表示由"初始採購單"發起)
#                : p_xmdadocno      #當站訂單單號
#                : p_nextsite       #下站營運據點
#                : p_final          #最終站否
#                : p_pmdl052        #最終供應商
#                : p_date           #日期(若為NULL帶入g_today)
#                : p_icab001        #流程代碼
#                : p_icab002        #站別
# Return code....: r_success        #執行結果
#                : r_pmdldocno      #產生之委外採購單號
# Date & Author..: 180330 By jinfeng
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_aic_carry_gen_tri_wo2(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_pmdl052,p_date,p_icab001,p_icab002)
   DEFINE p_firstpmdldocno   LIKE pmdl_t.pmdldocno  #初始採購單號
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno  #初始訂單單號
   DEFINE p_xmdadocno        LIKE xmda_t.xmdadocno  #當站訂單單號
   DEFINE p_nextsite         LIKE xmda_t.xmdasite   #下站營運據點
   DEFINE p_final            LIKE xmda_t.xmda051    #最終站否
   DEFINE p_pmdl052          LIKE pmdl_t.pmdl052    #最終供應商
   DEFINE p_date             LIKE xmda_t.xmdadocdt  #日期(若為NULL帶入g_today)
   DEFINE p_icab001          LIKE icab_t.icab001    #流程代碼
   DEFINE p_icab002          LIKE icab_t.icab002    #站別
                            
   DEFINE r_success          LIKE type_t.num5       #執行結果
   DEFINE r_pmdldocno        STRING  #產生之委外採購單號   
   
   DEFINE l_order     RECORD          
          xmda031            LIKE xmda_t.xmda031,
          xmda034            LIKE xmda_t.xmda034,
          xmda050            LIKE xmda_t.xmda050,
          xmdc028            LIKE xmdc_t.xmdc028,
          xmdc029            LIKE xmdc_t.xmdc029,
          xmdc030            LIKE xmdc_t.xmdc030,
          xmdc036            LIKE xmdc_t.xmdc036,
          xmdc037            LIKE xmdc_t.xmdc037,
          xmdc038            LIKE xmdc_t.xmdc038,
          xmdc049            LIKE xmdc_t.xmdc049,
          xmdc057            LIKE xmdc_t.xmdc057,
          xmdc024            LIKE xmdc_t.xmdc024,  #170517-00029#1-add
          xmddseq            LIKE xmdd_t.xmddseq,
          xmddseq1           LIKE xmdd_t.xmddseq1,
          xmddseq2           LIKE xmdd_t.xmddseq2,
          xmdd001            LIKE xmdd_t.xmdd001,
          xmdd002            LIKE xmdd_t.xmdd002,
          xmdd004            LIKE xmdd_t.xmdd004,
          xmdd006            LIKE xmdd_t.xmdd006,
          xmdd011            LIKE xmdd_t.xmdd011,
          xmdd024            LIKE xmdd_t.xmdd024,
          xmdd025            LIKE xmdd_t.xmdd025
         ,xmdcud004          LIKE xmdc_t.xmdcud004 #add by cz 20180607 #remark by xianggy 180621
         ,xmdcud012          LIKE xmdc_t.xmdcud012   #add by hehw 200915
                      END RECORD
   DEFINE l_sfba      RECORD LIKE sfba_t.*   #C20190306-07783 ADD 
   DEFINE l_sfaa003   LIKE sfaa_t.sfaa003    #C20190306-07783 ADD
   DEFINE l_sfaadocno        STRING                     #紀錄已產生的工單單號

   DEFINE l_prog             LIKE type_t.chr20     #作業編號 (gzzz001)
  #160523-00018#1-s-add
   DEFINE l_xmddseq   LIKE xmdd_t.xmddseq
   DEFINE l_xmddseq1  LIKE xmdd_t.xmddseq1
   DEFINE l_xmddseq2  LIKE xmdd_t.xmddseq2
   DEFINE l_xmdd006   LIKE xmdd_t.xmdd006
   DEFINE l_pmdp003   LIKE pmdp_t.pmdp003   #fcx-180411 add
   DEFINE l_n1,l_n2   LIKE type_t.num5      #fcx-180411 add
   DEFINE l_site      LIKE sfaa_t.sfaasite  #fcx-180411 add   
   DEFINE l_para      LIKE type_t.chr80     #fcx-180412 add
   DEFINE l_sfaaud001 LIKE sfaa_t.sfaaud001 #add by cz 20180612
  #160523-00018#1-e-add
   #add by chenjjz 180627 --- S
   DEFINE l_sql        STRING               
   DEFINE l_sfba005   LIKE sfba_t.sfba005
   DEFINE l_sfbaseq   LIKE sfba_t.sfbaseq
   DEFINE l_sfba029   LIKE sfba_t.sfba029
   DEFINE l_sfba028   LIKE sfba_t.sfba028
   DEFINE l_cnt       LIKE type_t.num5
   DEFINE l_sfaa006   LIKE sfaa_t.sfaa006
   DEFINE l_xmda008   LIKE xmda_t.xmda008
   DEFINE l_pmdp003_1   LIKE pmdp_t.pmdp003
   DEFINE l_success1    LIKE type_t.num5,
          l_ooba002_1   LIKE ooba_t.ooba002,
          l_icab003     LIKE icab_t.icab003
   #add by chenjjz 180627 --- E
   DEFINE l_xmda008_sfaa LIKE xmda_t.xmda008  #C180709-09421#5---add
   DEFINE l_ksdocno_sfaa LIKE sfaa_t.sfaadocno  #C180709-09421#5---add 
   DEFINE l_sfaa007      LIKE sfaa_t.sfaa007    #C180711-09421#1---add
   DEFINE l_sfaa008      LIKE sfaa_t.sfaa008    #C180711-09421#1---add
   DEFINE l_pmdldocdt LIKE pmdl_t.pmdldocdt      #C180709-09421#5---add
   DEFINE l_pmdlsite  LIKE pmdl_t.pmdlsite       #C180709-09421#5---add
   DEFINE l_sfaadocdt LIKE sfaa_t.sfaadocdt      #C180709-09421#5---add
   DEFINE l_pmdlcnfdt LIKE pmdl_t.pmdlcnfdt  #C20180713-09016#4
   DEFINE l_sfaa019 LIKE sfaa_t.sfaa019  #C20180713-09016#4
   DEFINE l_sfaa020 LIKE sfaa_t.sfaa020  #C20180713-09016#4
   DEFINE l_sfaaud002 LIKE sfaa_t.sfaaud002    #C180723-09421#2---add
   #C180724-09421#1---add---s
   DEFINE l_sfaa006_w   LIKE sfaa_t.sfaa006
   DEFINE l_xmda008_w   LIKE xmda_t.xmda008
   DEFINE l_pmdl005_w   LIKE pmdl_t.pmdl005
   #C180724-09421#1---add---e
   DEFINE l_cnt1        LIKE type_t.num10
   DEFINE l_pmdp009     LIKE pmdp_t.pmdp009    #C20190312-07783 ADD
   DEFINE r_success_1     LIKE type_t.num5     #C20190520-07783#1 ADD
   DEFINE l_slip        LIKE ooba_t.ooba002  #C200917-01626#1 add by pane 200917
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_pmdldocno = ''
   
   LET l_sfaadocno = '1=1'
   
  #170816-00007#31 -S mark
  #IF cl_null(p_xmdadocno) OR
  #   cl_null(p_final) OR
  #   cl_null(p_icab001) OR
  #   cl_null(p_icab002) THEN
  #
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
  #   LET g_errparam.code   = "sub-268"    #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_pmdldocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_xmdadocno) THEN
      CALL s_azzi902_get_gzzd("aicp100","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1   #當站訂單單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_final) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-01473",g_dlang)   #最終站否
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_icab001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaa001") RETURNING g_colname_1,g_comment_1   #流程編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF 
   END IF
   IF cl_null(p_icab002) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icab002") RETURNING g_colname_1,g_comment_1   #站別
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
      RETURN r_success,r_pmdldocno
   END IF
  #170816-00007#31 -E add

   IF p_final = 'N' AND cl_null(p_nextsite) THEN
     #170816-00007#31 -S mark
     #INITIALIZE g_errparam TO NULL
     #LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
     #LET g_errparam.code   = "sub-268"    #傳入參數為空!
     #LET g_errparam.popup  = TRUE
     #CALL cl_err()
     #
     #LET r_success = FALSE
     #RETURN r_success,r_pmdldocno
     #170816-00007#31 -E mark
     
     #170816-00007#31 -S add
     #修改錯誤訊息報錯內容
      LET g_msg = ''
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      IF cl_null(p_nextsite) THEN
         CALL s_azzi902_get_gzzd("aici100","lbl_icabsite") RETURNING g_colname_1,g_comment_1   #下站營運據點
         LET g_msg = g_colname_1 
      END IF  
      IF NOT cl_null(g_msg) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_msg 
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_pmdldocno
      END IF      
     #170816-00007#31 -E add
   END IF

#   IF p_final = 'Y' AND cl_null(p_pmdl052) THEN  #mark by jinfeng 180404--s
#     #170816-00007#31 -S mark  
#     #INITIALIZE g_errparam TO NULL
#     #LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
#     #LET g_errparam.code   = "sub-268"    #傳入參數為空!
#     #LET g_errparam.popup  = TRUE
#     #CALL cl_err()
#     #
#     #LET r_success = FALSE
#     #RETURN r_success,r_pmdldocno 
#     #170816-00007#31 -E mark
#     
#     #170816-00007#31 -S add
#     #修改錯誤訊息報錯內容
#      LET g_msg = ''
#      LET g_colname_1 = ''
#      LET g_comment_1 = ''
#      IF cl_null(p_pmdl052) THEN
#         CALL s_azzi902_get_gzzd("apmp490_03","lbl_pmdl052") RETURNING g_colname_1,g_comment_1   #最終供應商
#         LET g_msg = g_colname_1 
#      END IF  
#      IF NOT cl_null(g_msg) THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
#         LET g_errparam.popup = TRUE
#         LET g_errparam.replace[1] = g_msg 
#         CALL cl_err()
#         LET r_success = FALSE
#         RETURN r_success,r_pmdldocno 
#      END IF      
#     #170816-00007#31 -E add
#   END IF                #mark by jinfeng 180404--e

   IF cl_null(p_firstpmdldocno) = cl_null(p_firstxmdadocno) THEN   #兩者不會同時存在或同時為Null

     #170816-00007#31 -S mark
     #INITIALIZE g_errparam TO NULL
     #LET g_errparam.extend = "s_aic_carry_gen_tri_wo"
     #LET g_errparam.code   = "sub-268"     #傳入參數為空!
     #LET g_errparam.popup  = TRUE
     #CALL cl_err()
     #LET r_success = FALSE
     #RETURN r_success,r_pmdldocno
     #170816-00007#31 -E mark
     
     #170816-00007#31 -S add
     #修改錯誤訊息報錯內容
      LET g_msg = ''
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      IF cl_null(p_firstpmdldocno) THEN
         CALL s_azzi902_get_gzzd("aicr210","lbl_pmdldocno") RETURNING g_colname_1,g_comment_1   #初始採購單號
         LET g_msg = g_colname_1   
      END IF
      IF cl_null(p_firstxmdadocno) THEN
         LET g_colname_1 = ''
         LET g_comment_1 = ''   
         CALL s_azzi902_get_gzzd("aicr200","lbl_xmdadocno") RETURNING g_colname_1,g_comment_1   #初始訂單單號
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
         RETURN r_success,r_pmdldocno
      END IF
     #170816-00007#31 -E add
   END IF

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_pmdldocno
   END IF

   #日期若為NULL帶入g_today
   IF cl_null(p_date) THEN
      LET p_date = g_today
   END IF

   #SELECT icaa_t,icab_t,icac_t,icad_t,icae_t
   CALL s_aic_carry_get_ica(p_icab001,p_icab002)

  #160523-00018#1-s-mark 
  #LET g_sql = "SELECT xmda031,xmda034,xmda050,",
  #            "       xmdc028,xmdc029,xmdc030,",
  #            "       xmdc036,xmdc037,xmdc038,",
  #            "       xmdc049,xmdc057,",
  #            "       xmddseq,xmddseq1,xmddseq2,",
  #            "       xmdd001,xmdd002,",
  #            "       xmdd004,xmdd006,xmdd011,",
  #            "       xmdd024,xmdd025",
  #            "  FROM xmda_t,xmdc_t,xmdd_t",
  #            " WHERE xmdaent = xmdcent AND xmdcent = xmddent",
  #            "   AND xmddent = ",g_enterprise,
  #            "   AND xmdadocno = xmdcdocno AND xmdcdocno = xmdddocno",
  #            "   AND xmdddocno = '",p_xmdadocno,"'",
  #            "   AND xmdcseq = xmddseq"
  #160523-00018#1-e-mark
   
   #SELECT訂單資訊   
   #160523-00018#1-s
   #LET g_sql = "SELECT xmddseq,xmddseq1,xmddseq2 ",         #170517-00029#1-mark
   LET g_sql = "SELECT xmddseq,xmddseq1,xmddseq2,xmdd006 ",  #170517-00029#1-add
               "  FROM xmdd_t ",
               " WHERE xmddent = ",g_enterprise,
               "   AND xmdddocno = '",p_xmdadocno,"'",
               "   AND xmddseq = ? "
   PREPARE s_aic_carry_xmdd_pre7 FROM g_sql
   DECLARE s_aic_carry_xmdd_cs7 CURSOR FOR s_aic_carry_xmdd_pre7   
   
   LET g_sql = "SELECT xmda031,xmda034,xmda050,",
               "       xmdc028,xmdc029,xmdc030,",
               "       xmdc036,xmdc037,xmdc038,",
               "       xmdc049,xmdc057,",
               "       xmdc024,",  #170517-00029#1-add
               "       xmdcseq,'','',", 
               "       xmdc001,xmdc002,",
               "       xmdc006,xmdc007,xmdc012,",
               "       xmdc008,xmdc009",
               "       ,xmdcud004 ",   #add by cz 20180607  #remark by xianggy 180621   
               "       ,xmdcud012 ",   #add by hehw 200915               
               "  FROM xmda_t,xmdc_t ",
               " WHERE xmdaent = xmdcent AND xmdadocno = xmdcdocno ",
               "   AND xmdcent = ",g_enterprise,
               "   AND xmdcdocno = '",p_xmdadocno,"'"
   #160523-00018#1-e
   PREPARE s_aic_carry_xmdd_pre4 FROM g_sql
   DECLARE s_aic_carry_xmdd_cs4 CURSOR FOR s_aic_carry_xmdd_pre4
   INITIALIZE l_order.* TO NULL
   LET g_cnt = 0             #C20180906-07783 ADD 作为记录抛mes成功的工单的数组的指标
   CALL g_sfaadocno.clear()  #C20180906-07783 ADD 清空数组
   FOREACH s_aic_carry_xmdd_cs4 INTO l_order.xmda031,l_order.xmda034,l_order.xmda050,
                                    l_order.xmdc028,l_order.xmdc029,l_order.xmdc030,
                                    l_order.xmdc036,l_order.xmdc037,l_order.xmdc038,
                                    l_order.xmdc049,l_order.xmdc057,
                                    l_order.xmdc024,  #170517-00029#1-add
                                    l_order.xmddseq,l_order.xmddseq1,l_order.xmddseq2,
                                    l_order.xmdd001,l_order.xmdd002,
                                    l_order.xmdd004,l_order.xmdd006,l_order.xmdd011,
                                    l_order.xmdd024,l_order.xmdd025 
                                    ,l_order.xmdcud004   #add by cz 20180607 #remark by xianggy 180621
                                    ,l_order.xmdcud012   #add by hehw 200915
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_xmdd_cs4"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

         
      #塞sfaa_t
      INITIALIZE g_sfaa.* TO NULL
      LET g_sfaa.sfaasite = g_icab.icab003
     # LET g_sfaa.sfaadocdt = p_date  #C180709-09421#5---mark
     #C180709-09421#5---add---s
     #昆山委外采购抛转南通工单，工单日期取昆山来源委外采购单和昆山来源工单中日期较大的
      LET l_pmdldocdt = ''
      LET l_pmdlsite = ''
      LET l_sfaadocdt = ''
      #C20180713-09016#4---mod---s
#      SELECT pmdldocdt,MAX(sfaadocdt) INTO l_pmdldocdt,l_sfaadocdt
#         FROM sfaa_t,xmda_t,pmdp_t,pmdl_t
#         WHERE xmdaent = g_enterprise
#         AND xmdasite = 'NT'
#         AND xmdadocno = p_xmdadocno
#         AND xmda008 = pmdpdocno
#         AND pmdpent = xmdaent
#         AND pmdpsite = 'KS'
#         AND pmdp003 = sfaadocno
#         AND sfaaent = g_enterprise
#         AND sfaasite = pmdpsite
#         AND pmdlent = pmdpent 
#         AND pmdldocno = pmdpdocno
#         AND xmda008 = pmdpdocno
#      GROUP BY pmdldocdt
      LET l_pmdp003 = ''   #来源工单号
      SELECT pmdp003,pmdldocdt INTO l_pmdp003,l_pmdldocdt
        FROM xmda_t,xmdc_t,pmdp_t,pmdl_t
       WHERE xmdaent = xmdcent
         AND xmdadocno = xmdcdocno
         AND pmdlent = pmdpent
         AND pmdldocno = pmdpdocno
         AND xmdcent = pmdpent
         AND xmda008 = pmdpdocno
         AND xmdcseq = pmdpseq
         AND xmdaent = g_enterprise
         AND xmdcdocno = p_xmdadocno
         AND xmdcseq = l_order.xmddseq
      SELECT sfaadocdt INTO l_sfaadocdt 
        FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaadocno = l_pmdp003
      #C20180713-09016#4---mod---e
      IF l_pmdldocdt > = l_sfaadocdt THEN
         LET g_sfaa.sfaadocdt = l_pmdldocdt
      ELSE
         LET g_sfaa.sfaadocdt = l_sfaadocdt
      END IF
      IF cl_null(g_sfaa.sfaadocdt) THEN
         LET g_sfaa.sfaadocdt = p_date
      END IF
     #C180709-09421#5---add---e
      LET g_sfaa.sfaa001 = 0
      LET g_sfaa.sfaa002 = g_user
      LET g_sfaa.sfaa003 = '1'    #1一般工單   
      LET g_sfaa.sfaa004 = '1'    #1事前發料制
      #LET g_sfaa.sfaa005 = '2'    #2訂單   #160523-00018#1 mark
      #LET g_sfaa.sfaa005 = '1'    #1:MULTI #160523-00018#1 add  #170517-00029#1-mark 改用判斷的方式
      #170517-00029#1-s-add
      #判斷是否為多交期(Y->MULTI；N->訂單)
      IF l_order.xmdc024 = 'Y' THEN
         LET g_sfaa.sfaa005 = '1'    #1:MULTI
      ELSE
         LET g_sfaa.sfaa005 = '2'    #2訂單
         LET l_order.xmddseq1 = '1'  #項序
         LET l_order.xmddseq2 = '1'  #分批序
      END IF
      #170517-00029#1-e-add
      
      LET g_sfaa.sfaa006 = p_xmdadocno
      LET g_sfaa.sfaa007 = l_order.xmddseq   
      LET g_sfaa.sfaa008 = l_order.xmddseq1  

      #fcx-180411--str---自动生成的工单的参考客户给上站据点工单的参考客户及批号
      SELECT pmdp003 INTO l_pmdp003 FROM pmdp_t
       WHERE pmdpent = g_enterprise 
         AND pmdpdocno = p_firstpmdldocno
         AND pmdpseq = l_order.xmddseq       #C20180704-07783 ADD
         AND pmdpseq1 = l_order.xmddseq1     #C20180704-07783 ADD
      SELECT sfaa009,sfaa059,sfaaud001 INTO g_sfaa.sfaa009,g_sfaa.sfaa059,g_sfaa.sfaaud001 FROM sfaa_t  #add sfaaud001 by tanglt180417
       WHERE sfaaent = g_enterprise
         AND sfaadocno = l_pmdp003
      IF cl_null(g_sfaa.sfaa009) THEN 
      #fcx-180411--end---自动生成的工单的参考客户给上站据点工单的参考客户及批号      
         LET g_sfaa.sfaa009 = l_order.xmda034          
      END IF                                           #fcx-180411--add---自动生成的工单的参考客户给上站据点工单的参考客户

      LET g_sfaa.sfaa010 = l_order.xmdd001  
      LET g_sfaa.sfaa012 = l_order.xmdd006  
      LET g_sfaa.sfaa013 = l_order.xmdd004  
#      LET g_sfaa.sfaa020 = l_order.xmdd011  #C20180713-09016#4---mark---
     #C20180713-09016#4---s---
     #昆山委外采购抛转南通工单，生成的南通的工单的【预计完工日期】的取值：取昆山工单的预计完工日期
     #                        生成的南通的工单的【预计开工日期】的取值：取昆山工单预计开工日期和委外采购单审核日期，两者的最大值
      LET l_pmdlcnfdt = '' #委外采购单审核日期
      LET l_pmdp003 = ''   #来源工单号
      LET l_pmdp009 = ''   #来源作业编号  C20190312-07783 ADD
      SELECT pmdp003,pmdlcnfdt,pmdp009 INTO l_pmdp003,l_pmdlcnfdt,l_pmdp009  #C20190312-07783 ADD pmdp009
        FROM xmda_t,xmdc_t,pmdp_t,pmdl_t
       WHERE xmdaent = xmdcent
         AND xmdadocno = xmdcdocno
         AND pmdlent = pmdpent
         AND pmdldocno = pmdpdocno
         AND xmdcent = pmdpent
         AND xmda008 = pmdpdocno
         AND xmdcseq = pmdpseq
         AND xmdaent = g_enterprise
         AND xmdcdocno = p_xmdadocno
         AND xmdcseq = l_order.xmddseq
      SELECT sfaa019,sfaa020 INTO l_sfaa019,l_sfaa020 
        FROM sfaa_t
       WHERE sfaaent = g_enterprise
         AND sfaadocno = l_pmdp003
      LET g_sfaa.sfaa020 = l_sfaa020
      IF l_pmdlcnfdt > = l_sfaa019 THEN
         LET g_sfaa.sfaa019 = l_pmdlcnfdt
      ELSE
         LET g_sfaa.sfaa019 = l_sfaa019
      END IF
     #C20180713-09016#4---e---

     
      LET g_sfaa.sfaa028 = l_order.xmdc036
      LET g_sfaa.sfaa029 = l_order.xmdc037
      LET g_sfaa.sfaa030 = l_order.xmdc038
      LET g_sfaa.sfaa031 = l_order.xmdc049
      
      LET g_sfaa.sfaa034 = l_order.xmdc028
      LET g_sfaa.sfaa035 = l_order.xmdc029

      LET g_sfaa.sfaa038 = 'N'
      LET g_sfaa.sfaa039 = 'N'
      LET g_sfaa.sfaa040 = 'N'
      LET g_sfaa.sfaa041 = 'N'
      LET g_sfaa.sfaa042 = 'N'
      LET g_sfaa.sfaa043 = 'N'
      LET g_sfaa.sfaa044 = 'N'

      LET g_sfaa.sfaa049 = 0
      LET g_sfaa.sfaa050 = 0
      LET g_sfaa.sfaa051 = 0
      LET g_sfaa.sfaa052 = 0
      LET g_sfaa.sfaa053 = 0
      LET g_sfaa.sfaa054 = 0
      LET g_sfaa.sfaa055 = 0
      LET g_sfaa.sfaa056 = 0
     # LET g_sfaa.sfaa057 = '2'    #2委外    #mark by jinfeng 180330
      LET g_sfaa.sfaa057 = '1'     #厂内     #add by jinfeng 180330
      LET g_sfaa.sfaa058 = l_order.xmdd025     
     
#      LET g_sfaa.sfaa059 = l_order.xmdc030 #fcx-180411-mark---源工单的批号  
      LET g_sfaa.sfaa060 = l_order.xmdd024   
      
      LET g_sfaa.sfaa061 = 'N'
      LET g_sfaa.sfaa062 = 'N'
      LET g_sfaa.sfaa063 = l_order.xmddseq2 
      LET g_sfaa.sfaa064 = l_order.xmddseq2  
      
      
      LET g_sfaa.sfaa065 = '0'               #0.未结案
      LET g_sfaa.sfaa066 = l_order.xmda050
      LET g_sfaa.sfaa067 = l_order.xmda031
      LET g_sfaa.sfaa071 = 0                 #160425-00019 by whitney add 齊料套數

      LET g_sfaa.sfaaownid = g_user
      LET g_sfaa.sfaaowndp = g_dept
      LET g_sfaa.sfaacrtid = g_user
      LET g_sfaa.sfaacrtdp = g_dept
      LET g_sfaa.sfaacrtdt = cl_get_current()
      LET g_sfaa.sfaastus = 'N'
      
      LET g_sfaa.sfaaua001 = l_order.xmdcud004  #add by cz 20180607 #remark by xianggy 180621
      LET g_sfaa.sfaaud012 = l_order.xmdcud012  #add by hehw 200915 
      #C20190411-07783--S-MARK--上面有取前端工单的客户批号的逻辑，这里是以委外采购单单头来源单号为角度关联，若合并生成就不对了
      #add by cz 20180612 -s #南通工单带入昆山工单的客户批号
#      LET l_sfaaud001 = NULL
#      SELECT sfaaud001 INTO l_sfaaud001 
#        FROM sfaa_t LEFT JOIN pmdl_t ON pmdlent=sfaaent AND pmdl008=sfaadocno AND pmdlsite=sfaasite
#       WHERE sfaaent=g_enterprise AND sfaasite='KS' AND pmdldocno=g_pmdldocno
#       
#      LET g_sfaa.sfaaud001 = l_sfaaud001
      #add by cz 20180612 -e
      #C20190411-07783--E-MARK--上面有取前端工单的客户批号的逻辑，这里是以委外采购单单头来源单号为角度关联，若合并生成就不对了      
  
      #自動產生委外工單單號sfaadocno
      IF NOT cl_null(g_icac.icac014) THEN
         #CALL s_aic_carry_docno(p_xmdadocno,g_sfaa.sfaasite,g_icac.icac014,g_sfaa.sfaadocdt,'asft300')     #mark by chenjjz 180626
         #C20190520-07783#1---S
#         CALL s_aic_carry_docno1(p_xmdadocno,g_sfaa.sfaasite,g_icac.icac014,g_sfaa.sfaadocdt,'asft300',l_order.xmddseq)
#         RETURNING r_success,g_sfaa.sfaadocno
#         IF NOT r_success THEN
#            EXIT FOREACH
#         END IF
         LET r_success_1 = TRUE
         CALL s_aic_carry_docno1(p_xmdadocno,g_sfaa.sfaasite,g_icac.icac014,g_sfaa.sfaadocdt,'asft300',l_order.xmddseq)
         RETURNING r_success_1,g_sfaa.sfaadocno
         IF NOT r_success_1 THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #C20190520-07783#1---E
      ELSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = ""
         LET g_errparam.code   = 'aic-00165'   #流程代碼%1站別%2之委外工單單別為空！
         LET g_errparam.popup  = TRUE
         LET g_errparam.replace[1] = p_icab001
         LET g_errparam.replace[2] = p_icab002
         
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
 
      #fcx-180411--str--预计入库批号，取单号最后一段儿
      SELECT instr(g_sfaa.sfaadocno,'-',-1,1) INTO l_n1 FROM dual
      LET l_n2 = length(g_sfaa.sfaadocno)
      LET g_sfaa.sfaa059 = g_sfaa.sfaadocno[l_n1+1,l_n2]      
      #fcx-180411--end--预计入库批号，取单号最后一段儿      

      #預設BOM特性
      SELECT imae037
        INTO g_sfaa.sfaa011
        FROM imae_t
       WHERE imaeent = g_enterprise
         AND imaesite = g_sfaa.sfaasite
         AND imae001 = g_sfaa.sfaa010 #料件編號

      IF p_final = 'Y' THEN
         LET g_sfaa.sfaa017 = p_pmdl052
      ELSE
         #傳入值"下站營運據點"之"據點對應客戶/廠商編號"
         #C20190520-07783#1--S
#         CALL s_aic_carry_get_ooef024(p_nextsite)
#         RETURNING r_success,g_sfaa.sfaa017
#         IF NOT r_success THEN
#            EXIT FOREACH
#         END IF
         LET r_success_1 = TRUE
         CALL s_aic_carry_get_ooef024(p_nextsite)
         RETURNING r_success_1,g_sfaa.sfaa017
         IF NOT r_success_1 THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #C20190520-07783#1--E         
      END IF

      #C20180713-09016#4---mark---s
#      #由"預計完工日"倒推"預計開工日"
#      CALL s_aic_carry_calculate_startdate(g_sfaa.sfaasite,'2',g_sfaa.sfaa010,g_sfaa.sfaa012,g_sfaa.sfaa020)
#      RETURNING r_success,g_sfaa.sfaa019
#      IF NOT r_success THEN
#         EXIT FOREACH
#      END IF
      #C20180713-09016#4---mark---e
      #C190527-06857#1---mark---s
      #C180723-09421#2---add---s
      #LET l_sfaaud002 = ''
      #SELECT imaaud005 INTO l_sfaaud002 
      #   FROM imaa_t
      #   WHERE imaaent = g_enterprise 
      #   AND imaa001 = g_sfaa.sfaa010 
      #IF cl_null(l_sfaaud002) THEN 
      #   LET l_sfaaud002 = 'N'
      #END IF
      #C180723-09421#2---add---e
      #C190527-06857#1---mark---e
      #C190527-06857#1---add---s
      LET l_sfaaud002 = ''
      SELECT sfaaud002 INTO l_sfaaud002
        FROM sfaa_t
       WHERE sfaadocno = ( SELECT pmdp003
                             FROM xmda_t,xmdc_t,pmdp_t,pmdl_t
                            WHERE xmdaent = xmdcent
                              AND xmdadocno = xmdcdocno
                              AND pmdlent = pmdpent
                              AND pmdldocno = pmdpdocno
                              AND xmdcent = pmdpent
                              AND xmda008 = pmdpdocno
                              AND xmdcseq = pmdpseq
                              AND xmdaent = g_enterprise
                              AND xmdcdocno = p_xmdadocno
                              AND xmdcseq = l_order.xmddseq )
      IF cl_null(l_sfaaud002) THEN 
         LET l_sfaaud002 = 'N'
      END IF
      #C190527-06857#1---add---e  
      #C200917-01626#1 add by pane 200917 begin#
      LET l_slip = ''
      CALL s_aooi200_get_slip(g_sfaa.sfaadocno) RETURNING r_success,l_slip
      LET g_sfaa.sfaa003 = s_aooi200_get_doc_default(g_site,'1',l_slip,'sfaa003',g_sfaa.sfaa003)
      IF cl_null(g_sfaa.sfaa003) THEN
         LET g_sfaa.sfaa003 = '1' 
      END IF
      #C200917-01626#1add by pane 200917 end#
      
      INSERT INTO sfaa_t(sfaaent,sfaasite,sfaadocno,sfaadocdt,
                         sfaa001,sfaa002,sfaa003,sfaa004,sfaa005,
                         sfaa006,sfaa007,sfaa008,sfaa009,sfaa010,
                         sfaa011,sfaa012,sfaa013,sfaa014,sfaa015,
                         sfaa016,sfaa017,sfaa018,sfaa019,sfaa020,
                         sfaa021,sfaa022,sfaa023,sfaa024,sfaa025,
                         sfaa026,sfaa027,sfaa028,sfaa029,sfaa030,
                         sfaa031,sfaa032,sfaa033,sfaa034,sfaa035,
                         sfaa036,sfaa037,sfaa038,sfaa039,sfaa040,
                         sfaa041,sfaa042,sfaa043,sfaa044,sfaa045,
                         sfaa046,sfaa047,sfaa048,sfaa049,sfaa050,
                         sfaa051,sfaa052,sfaa053,sfaa054,sfaa055,
                         sfaa056,sfaa057,sfaa058,sfaa059,sfaa060,
                         sfaa061,sfaa062,sfaa063,sfaa064,sfaa065,
                         sfaa066,sfaa067,sfaa068,
                         sfaaownid,sfaaowndp,
                         sfaacrtid,sfaacrtdp,sfaacrtdt,
                         sfaamodid,sfaamoddt,
                         sfaacnfid,sfaacnfdt,
                         sfaapstid,sfaapstdt,
                         sfaastus,sfaaud001,sfaaua001,sfaaud012,  #add sfaaud001 by tanglt180417   #add sfaaua001 by xianggy 180621   #add sfaaud012 by hehw 200915
                         sfaaud002)   #C180723-09421#2---add sfaaud002
      VALUES (g_enterprise,g_sfaa.sfaasite,g_sfaa.sfaadocno,g_sfaa.sfaadocdt,
              g_sfaa.sfaa001,g_sfaa.sfaa002,g_sfaa.sfaa003,g_sfaa.sfaa004,g_sfaa.sfaa005,
              g_sfaa.sfaa006,g_sfaa.sfaa007,g_sfaa.sfaa008,g_sfaa.sfaa009,g_sfaa.sfaa010,
              g_sfaa.sfaa011,g_sfaa.sfaa012,g_sfaa.sfaa013,g_sfaa.sfaa014,g_sfaa.sfaa015,
              g_sfaa.sfaa016,g_sfaa.sfaa017,g_sfaa.sfaa018,g_sfaa.sfaa019,g_sfaa.sfaa020,
              g_sfaa.sfaa021,g_sfaa.sfaa022,g_sfaa.sfaa023,g_sfaa.sfaa024,g_sfaa.sfaa025,
              g_sfaa.sfaa026,g_sfaa.sfaa027,g_sfaa.sfaa028,g_sfaa.sfaa029,g_sfaa.sfaa030,
              g_sfaa.sfaa031,g_sfaa.sfaa032,g_sfaa.sfaa033,g_sfaa.sfaa034,g_sfaa.sfaa035,
              g_sfaa.sfaa036,g_sfaa.sfaa037,g_sfaa.sfaa038,g_sfaa.sfaa039,g_sfaa.sfaa040,
              g_sfaa.sfaa041,g_sfaa.sfaa042,g_sfaa.sfaa043,g_sfaa.sfaa044,g_sfaa.sfaa045,
              g_sfaa.sfaa046,g_sfaa.sfaa047,g_sfaa.sfaa048,g_sfaa.sfaa049,g_sfaa.sfaa050,
              g_sfaa.sfaa051,g_sfaa.sfaa052,g_sfaa.sfaa053,g_sfaa.sfaa054,g_sfaa.sfaa055,
              g_sfaa.sfaa056,g_sfaa.sfaa057,g_sfaa.sfaa058,g_sfaa.sfaa059,g_sfaa.sfaa060,
              g_sfaa.sfaa061,g_sfaa.sfaa062,g_sfaa.sfaa063,g_sfaa.sfaa064,g_sfaa.sfaa065,
              g_sfaa.sfaa066,g_sfaa.sfaa067,g_sfaa.sfaa068,
              g_sfaa.sfaaownid,g_sfaa.sfaaowndp,
              g_sfaa.sfaacrtid,g_sfaa.sfaacrtdp,g_sfaa.sfaacrtdt,
              g_sfaa.sfaamodid,g_sfaa.sfaamoddt,
              g_sfaa.sfaacnfid,g_sfaa.sfaacnfdt,
              g_sfaa.sfaapstid,g_sfaa.sfaapstdt,
              g_sfaa.sfaastus,g_sfaa.sfaaud001,g_sfaa.sfaaua001,g_sfaa.sfaaud012,  #add sfaaud001 by tanglt180417   #add sfaaua001 by xianggy 180621   #add sfaaud012 by hehw 200915 
              l_sfaaud002)      #C180723-09421#2---add l_sfaaud002

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:sfaa_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      FOREACH s_aic_carry_xmdd_cs7 USING l_order.xmddseq INTO l_xmddseq,l_xmddseq1,l_xmddseq2,l_xmdd006  #160523-00018#1 add

         #塞sfab_t
         INITIALIZE g_sfab.* TO NULL
         LET g_sfab.sfabsite = g_sfaa.sfaasite
         LET g_sfab.sfabdocno = g_sfaa.sfaadocno
         LET g_sfab.sfab001 = '2' 
         LET g_sfab.sfab002 = p_xmdadocno
        #160523-00018#1-s-mark 
        #LET g_sfab.sfab003 = l_order.xmddseq
        #LET g_sfab.sfab004 = l_order.xmddseq1
        #LET g_sfab.sfab005 = l_order.xmddseq2
        #160523-00018#1-e-mark 
        #160523-00018#1-s-add
         LET g_sfab.sfab003 = l_xmddseq
         LET g_sfab.sfab004 = l_xmddseq1
         LET g_sfab.sfab005 = l_xmddseq2
        #160523-00018#1-e-add         
         LET g_sfab.sfab006 = 10
        #LET g_sfab.sfab007 = g_sfaa.sfaa012   #160523-00018#1 mark
         LET g_sfab.sfab007 = l_xmdd006        #160523-00018#1 add
         
         SELECT MAX(sfabseq)+1 INTO g_sfab.sfabseq
           FROM sfab_t
          WHERE sfabent = g_enterprise
            AND sfabdocno = g_sfaa.sfaadocno
         
         IF cl_null(g_sfab.sfabseq) THEN
            LET g_sfab.sfabseq = 1
         END IF
         
         INSERT INTO sfab_t(sfabent,sfabsite,sfabdocno,sfabseq,
                            sfab001,sfab002,sfab003,sfab004,sfab005,
                            sfab006,sfab007)
         VALUES (g_enterprise,g_sfab.sfabsite,g_sfab.sfabdocno,g_sfab.sfabseq,
                 g_sfab.sfab001,g_sfab.sfab002,g_sfab.sfab003,g_sfab.sfab004,g_sfab.sfab005,
                 g_sfab.sfab006,g_sfab.sfab007)
         
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:sfab_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH       #160523-00018#1 add
      #塞sfac_t
      #160310-00020#1---mark----begin---
      #xmdc057是库存管理特征栏位，而sfac006是产品特征，传入值错误
      #CALL s_aic_carry_ins_sfac(l_order.xmdc057) RETURNING r_success 
      #160310-00020#1---mark----end---
      #C20190520-07783#1---S
#      CALL s_aic_carry_ins_sfac(l_order.xmdd002) RETURNING r_success  #160310-00020#1 add
#      IF NOT r_success THEN
#         EXIT FOREACH
#      END IF
      LET r_success_1 = TRUE
      CALL s_aic_carry_ins_sfac(l_order.xmdd002) RETURNING r_success_1  #160310-00020#1 add
      IF NOT r_success_1 THEN
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      #C20190520-07783#1---E      
      
      #C20190312-07783--S---如果是整单委外，则复制上站工单的备料档，若是制程工单，则下站根据BOM展工单
      IF NOT cl_null(l_pmdp009) THEN
         #C20190306-07783--S---取上站工单的备料档
         #自動產生工單備料單身sfba_t
         LET r_success_1 = TRUE     #C20190520-07783#1 ADD
         #C20190520-07783#1--S
#         CALL s_aic_carry_ins_sfba() RETURNING r_success
#         IF NOT r_success THEN
#            #EXIT FOREACH        #181204-00054#1 mark
#            CONTINUE FOREACH     #181204-00054#1 mod
#         END IF
         CALL s_aic_carry_ins_sfba() RETURNING r_success_1
         IF NOT r_success_1 THEN
            #EXIT FOREACH        #181204-00054#1 mark
            LET r_success = FALSE
            #CONTINUE FOREACH     #181204-00054#1 mod  #C200804-01626#1  mark by pane 200804
            EXIT FOREACH           #C200804-01626#1 mod by pane 200804
         END IF
         #C20190520-07783#1--E   
         
         #C190628-06857#1---add---s
         #多角委外工单若单身作业编号为空，则更新为工单单身其他项的作业编号
         CALL s_aic_carry_upd_sfba003() RETURNING r_success
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         #C190628-06857#1---add---e     
         
      ELSE
      #C20190312-07783--E---如果是整单委外，则复制上站工单的备料档，若是制程工单，则下站根据BOM展工单      
         #C20190306-07783--E---取上站工单的备料档      
         LET l_sql = " SELECT * FROM sfba_t WHERE sfbaent = ? AND sfbadocno = ?"
         PREPARE s_aic_carry_ins_sfba_pre FROM l_sql
         DECLARE s_aic_carry_ins_sfba_cur CURSOR FOR s_aic_carry_ins_sfba_pre
         INITIALIZE l_sfba.* TO NULL
         FOREACH s_aic_carry_ins_sfba_cur USING g_enterprise,l_pmdp003 INTO l_sfba.*
           LET l_sfba.sfbasite = g_sfaa.sfaasite       #据点
           LET l_sfba.sfbadocno = g_sfaa.sfaadocno     #单号
           IF cl_null(l_sfba.sfba003) THEN
              LET l_sfba.sfba003 = 'CR19'              #作业编号
           END IF
           IF cl_null(l_sfba.sfba004) THEN
              LET l_sfba.sfba004 = '1'                 #作业序
           END IF
           LET l_sfba.sfba009 = 'Y'                    #倒扣料
           LET l_sfba.sfba015 = 0                      #委外代买量
           LET l_sfba.sfba016 = 0                      #已发数量
           LET l_sfba.sfba017 = 0                      #报废数量
           LET l_sfba.sfba018 = 0                      #盘盈亏数量
           LET l_sfba.sfba019 = '5003'                 #制定发料仓库
           LET l_sfba.sfba025 = 0                      #超领数量
           LET l_sfba.sfba028 = 'Y'                    #客供料
           LET l_sfba.sfba031 = 0                      #备置量
           LET l_sfba.sfba032 = ''                     #备置理由码
           INSERT INTO sfba_t VALUES l_sfba.*
           IF SQLCA.sqlcode THEN
              INITIALIZE g_errparam TO NULL
              LET g_errparam.extend = "INSERT:sfba_t"
              LET g_errparam.code   = SQLCA.sqlcode
              LET g_errparam.popup  = TRUE
              CALL cl_err()        
              LET r_success = FALSE
              CONTINUE FOREACH
           END IF
         END FOREACH    
      END IF    #C20190312-07783--ADD---如果是整单委外，则复制上站工单的备料档，若是制程工单，则下站根据BOM展工单
      #C20190306-07783--E---取上站工单的备料档      
      
      CALL s_aooi200_get_slip(p_firstpmdldocno) RETURNING l_success1,l_ooba002_1  #C20180704-07783     
      SELECT icab003 INTO l_icab003 FROM icab_t
       WHERE icabent = g_enterprise
         AND icab001 = p_icab001
         AND icab002 = p_icab002-1
      #add by chenjjz 180627 --- S         委外采购单多角抛转产生的工单，单身料号的批号要根据最先的工单单身相同料号的批号带出
      LET l_sql = "SELECT sfba005,sfbaseq FROM sfba_t WHERE sfbaent =? AND sfbadocno =?" 
      PREPARE s_aic_carry_sfba005_chk_pre FROM l_sql
      DECLARE s_aic_carry_sfba005_chk_cur CURSOR FOR s_aic_carry_sfba005_chk_pre
      OPEN s_aic_carry_sfba005_chk_cur    USING  g_enterprise,g_sfaa.sfaadocno
      FOREACH s_aic_carry_sfba005_chk_cur INTO l_sfba005,l_sfbaseq     
         SELECT sfaa006 INTO l_sfaa006 FROM sfaa_t WHERE sfaadocno = g_sfaa.sfaadocno
         SELECT xmda008 INTO l_xmda008 FROM xmda_t WHERE xmdadocno = l_sfaa006
         SELECT pmdp003 INTO l_pmdp003_1 FROM pmdp_t WHERE pmdpdocno = l_xmda008 AND substr(pmdp003,8,16)  = g_sfaa.sfaa059
         SELECT COUNT(*) INTO l_cnt FROM sfba_t WHERE sfbadocno = l_pmdp003_1 AND sfba005 =  l_sfba005
         IF l_cnt > 0 THEN 
            SELECT sfba028,sfba029 INTO l_sfba028,l_sfba029 FROM sfba_t WHERE sfbadocno = l_pmdp003_1 AND sfba005 =  l_sfba005 #C20180717-09016#2 add sfba028
            UPDATE sfba_t SET sfba029 = l_sfba029
#                              ,sfba028 = l_sfba028 #C20180717-09016#2
             WHERE sfbadocno = g_sfaa.sfaadocno
               AND sfbaseq = l_sfbaseq
               AND sfbaent = g_enterprise #C20180703-07783 ADD
               
            IF SQLCA.sqlcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE:sfaa_t"
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               EXIT FOREACH
            END IF
         END IF
         #C20180704-07783---将委外采购单的单别参数D-MFGC-011更新下站据点杂收单与工单V料的批次为WIP是Y的，备料档料号的前12位与生产料号的前12位一致的批次更新为WIP
         IF cl_get_doc_para(g_enterprise,'KS',l_ooba002_1,'D-MFGC-011') = 'Y'  THEN
            UPDATE sfba_t SET sfba029 = 'WIP' 
             WHERE sfbaent = g_enterprise
               AND sfbadocno =  g_sfaa.sfaadocno
               AND substr(sfba006,0,12) = substr(g_sfaa.sfaa010,0,12)
         END IF
      END FOREACH
      #add by chenjjz 180627 --- E
      
      #C180709-09421#5---add---s 
      #使生成的工单批号等于来源工单的后九位
      LET l_ksdocno_sfaa = ''
      LET l_xmda008_sfaa = ''
      SELECT xmda008 INTO l_xmda008_sfaa
         FROM xmda_t
         WHERE xmdaent = g_enterprise
         AND xmdasite = 'NT'
         AND xmdadocno = g_sfaa.sfaa006
      #C180711-09421#1---mark---s
      #和顾问确认丽智的抛转过程，订单项次和采购单项次相同，采购单明细和采购单关联单据明细一对一
      #因此修改关联工单为采购单关联单据明细的来源单据
#      SELECT pmdl008 INTO l_ksdocno_sfaa
#         FROM pmdl_t
#         WHERE pmdlent = g_enterprise
#         AND pmdlsite = 'KS'
#         AND pmdldocno = l_xmda008_sfaa

      #C180711-09421#1---mark---e
      #C180711-09421#1---add---s
      LET l_sfaa007 = 0
      LET l_sfaa008 = 0
      SELECT sfaa007,sfaa008 INTO l_sfaa007,l_sfaa008
         FROM sfaa_t
         WHERE sfaaent = g_enterprise
         AND sfaasite = 'NT'
         AND sfaadocno = g_sfaa.sfaadocno
         
      SELECT pmdp003 INTO l_ksdocno_sfaa
         FROM pmdp_t
         WHERE pmdpent = g_enterprise
         AND pmdpsite = 'KS'
         AND pmdpdocno = l_xmda008_sfaa
         AND pmdpseq = l_sfaa007
         AND pmdpseq1 = l_sfaa008
      #C180711-09421#1---add---e
      SELECT substr(l_ksdocno_sfaa,length(l_ksdocno_sfaa)-8,9) INTO l_ksdocno_sfaa FROM dual
      LET l_ksdocno_sfaa = 'WIP',l_ksdocno_sfaa
      LET l_ksdocno_sfaa = cl_replace_str(l_ksdocno_sfaa,' ','')
      IF NOT cl_null(l_ksdocno_sfaa) THEN
         IF cl_get_doc_para(g_enterprise,'KS',l_ooba002_1,'D-MFGC-011') = 'Y'  THEN      
            UPDATE sfba_t SET sfba029 =  l_ksdocno_sfaa 
               WHERE sfbaent = g_enterprise 
               AND sfbadocno = g_sfaa.sfaadocno
               AND substr(sfba006,0,6) = substr(g_sfaa.sfaa010,0,6)
         END IF
      END IF
      #C180709-09421#5---add---e
      
      #C20180703-07783---因为这里更新了批号，还是要再更新一下单头的【散料批号】--s  
       LET l_sfba029 = ''            
       SELECT sfba029 INTO l_sfba029 FROM (
      SELECT sfba029 FROM sfba_t,sfaa_t
       WHERE sfaaent = sfbaent
         AND sfaadocno = sfbadocno
         AND sfbaent = g_enterprise
         AND sfbadocno =  g_sfaa.sfaadocno
         AND substr(sfba006,0,6) = substr(sfaa010,0,6)
        ORDER BY sfbaseq )
      WHERE rownum = 1   
      #mod by wangtaoz 180706 -s      
      IF NOT cl_null( l_sfba029) THEN 
         UPDATE sfaa_t SET sfaaud003 =  l_sfba029 WHERE sfaaent = g_enterprise AND sfaadocno = g_sfaa.sfaadocno
      END IF 
      #mod by wangtaoz 180706 -e      
      #C20180703-07783---因为这里更新了批号，还是要再更新一下单头的【散料批号】--e        
      
      
      #工單確認(包含檢查、產生工單製程sfca,sfcb)
#      CALL s_aic_carry_sfaa_conf() RETURNING r_success    C20180906-07783 MARK
      #C20190520-07783#1---S
#      CALL s_aic_carry_sfaa_conf2() RETURNING r_success   #C20180906-07783 ADD
#      IF NOT r_success THEN
#         EXIT FOREACH
#      END IF
      LET r_success_1 = TRUE
      CALL s_aic_carry_sfaa_conf2() RETURNING r_success_1   #C20180906-07783 ADD
      IF NOT r_success_1 THEN
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      #C20190520-07783#1---E      
      #fcx-180411--str--如果没有发放，则需要调用发放函数
      SELECT sfaastus INTO g_sfaa.sfaastus FROM sfaa_t 
       WHERE sfaaent = g_enterprise
         AND sfaadocno = g_sfaa.sfaadocno
      LET l_site = g_site           #fcx-180411 add 
      LET g_site = g_sfaa.sfaasite  #fcx-180411 add 暂时将g_site 换成当站
      CALL cl_get_doc_para(g_enterprise,g_site,g_icac.icac014,'D-MFG-0040') RETURNING l_para  #fcx-180412 add
      IF g_sfaa.sfaastus <> 'F' AND ( l_para <> 'Y'  OR cl_null(l_para)) THEN  #fcx-180412 add   AND (NOT l_para OR cl_null(l_para)) 
      #fcx-180411--end--如果没有发放，则需要调用发放函数      
      #add by jinfeng 180410--s 
#      IF NOT s_asft300_confirmed_chk(g_sfaa.sfaadocno) THEN
#         LET r_success = FALSE
#         EXIT FOREACH
#      END IF      
#      IF NOT s_asft300_confirmed_upd(g_sfaa.sfaadocno) THEN      
#         LET r_success = FALSE
#         EXIT FOREACH
#      END IF      
#      UPDATE sfaa_t SET sfaastus = 'Y' 
#       WHERE sfaaent = g_enterprise 
#         AND sfaadocno = g_sfaa.sfaadocno 
         IF NOT s_asft300_released_chk(g_sfaa.sfaadocno) THEN      
            LET r_success = FALSE
            EXIT FOREACH
         END IF           
#         IF NOT s_asft300_released_upd(g_sfaa.sfaadocno) THEN         C20180906-07783 MARK
         IF NOT s_aic_carry_sfaa_released_upd(g_sfaa.sfaadocno) THEN  #C20180906-07783 ADD
            LET r_success = FALSE
            EXIT FOREACH
         END IF    
      END IF   #fcx-180411 add         
      #add by jinfeng 180410--e

      #無條件將狀態碼更新為F.發放
      UPDATE sfaa_t SET sfaastus = 'F' 
       WHERE sfaaent = g_enterprise 
         AND sfaadocno = g_sfaa.sfaadocno

      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE:sfaa_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #C180724-09421#1---add---s
      #如果该订单的来源为委外采购单，工单发放之后回写订单的欠料数量为0
      #1.查询工单的来源单号
      LET l_sfaa006_w = ''
      SELECT sfaa006 INTO l_sfaa006_w
         FROM sfaa_t
         WHERE sfaaent = g_enterprise
         AND sfaadocno = g_sfaa.sfaadocno
      #2.查询订单的来源单号
      LET l_xmda008_w = ''
      SELECT xmda008 INTO l_xmda008_w
         FROM xmda_t
         WHERE xmdaent = g_enterprise
         AND xmdadocno = l_sfaa006_w
      #3.查询来源采购单是否为委外采购单，委外采购单的采购性质为‘2’ 
      LET l_pmdl005_w = ''      
      SELECT pmdl005 INTO l_pmdl005_w
          FROM pmdl_t
          WHERE pmdlent = g_enterprise
          AND pmdldocno = l_xmda008_w
      #4.如果该订单的来源为委外采购单，工单发放之后回写订单的欠料数量为0
      IF l_pmdl005_w = '2' THEN
         UPDATE xmdd_t SET xmddud012 = 0
            WHERE xmddent = g_enterprise
            AND xmdddocno = l_sfaa006_w
            
         IF SQLCA.sqlcode  THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "UPDATE:xmddud012"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END IF
      #C180724-09421#1---add---e
      #紀錄已完成之工單
      IF l_sfaadocno = '1=1' THEN
         LET l_sfaadocno = "('",g_sfaa.sfaadocno,"'"
      ELSE
         LET l_sfaadocno = l_sfaadocno,",'",g_sfaa.sfaadocno,"'"
      END IF

   END FOREACH   

   IF NOT l_sfaadocno = '1=1' THEN
      LET l_sfaadocno = l_sfaadocno,")"
   END IF

   IF NOT r_success THEN
      #RETURN r_success,r_pmdldocno
      #C20180906-07783---S--有错误的话，要将之前抛MES的拉回
      LET l_cnt1 = 0
      LET l_cnt1 = g_sfaadocno.getLength()
      IF l_cnt1 > 0 THEN
         IF s_aws_mes2_wo_batch_delete(g_sfaadocno) THEN
         ELSE
            LET g_err_collect = FALSE         
            CALL cl_err()
            LET r_success = FALSE
         END IF          
      END IF
      #C20180906-07783---E--有错误的话，要将之前抛MES的拉回        
      LET g_site = l_site  #fcx-180411 add    
      RETURN r_success,l_sfaadocno
   END IF

#   #產生委外採購單
#   LET l_prog = g_prog     #備份作業編號
#   LET g_prog = 'apmt501'  #委外採購單
#
#   IF p_final = 'N' THEN
#      #中間站
#      CALL s_aic_carry_gen_tri_po(p_firstpmdldocno,p_firstxmdadocno,p_xmdadocno,p_nextsite,p_final,p_date,p_icab001,p_icab002)
#      RETURNING r_success,r_pmdldocno
#   ELSE
#      #最終站
#      CALL s_aic_carry_gen_last_po(p_xmdadocno,p_pmdl052,p_date,p_icab001,p_icab002)
#      RETURNING r_success,r_pmdldocno
#   END IF
#   
#   LET g_prog = l_prog     #還原作業編號
#
#   IF NOT r_success THEN
#      RETURN r_success,r_pmdldocno
#   END IF
   
   #r_pmdldocno為產生之採購單號
   #RETURN r_success,r_pmdldocno 
   LET g_site = l_site  #fcx-180411 add      
   RETURN r_success,l_sfaadocno
END FUNCTION

################################################################################
# Descriptions...: 單據自動編碼
# Memo...........:
# Usage..........: CALL s_aic_carry_docno(p_docno,p_site,p_slip,p_date,p_prog)
#                  RETURNING r_success,r_docno
# Input parameter: p_docno     來源單號
#                : p_site      營運據點
#                : p_slip      單別
#                : p_date      日期
#                : p_prog      作業
#                : p_seq       项次
# Return code....: r_success   處理狀況
#                : r_docno     單號
# Date & Author..: 180626 by chenjjz
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_docno1(p_docno,p_site,p_slip,p_date,p_prog,p_seq)
DEFINE p_docno       STRING
DEFINE p_site        LIKE ooef_t.ooef001
DEFINE p_slip        LIKE type_t.chr20
DEFINE p_date        LIKE type_t.dat
DEFINE p_prog        LIKE oobl_t.oobl002
DEFINE p_seq         LIKE type_t.num5
DEFINE r_success     LIKE type_t.num5
DEFINE r_docno       STRING
DEFINE l_success     LIKE type_t.num5
DEFINE l_site        LIKE ooef_t.ooef001
DEFINE l_slip        LIKE type_t.chr20
DEFINE l_ooef005     LIKE ooef_t.ooef005
DEFINE l_docno       LIKE type_t.chr20
DEFINE l_cnt         LIKE type_t.num5
DEFINE l_oobx007     LIKE oobx_t.oobx007
DEFINE l_sn          STRING
DEFINE l_doc_len     LIKE type_t.num5     #单号长度
DEFINE l_site_len    LIKE type_t.num5     #SITE段长度
DEFINE l_slip_len    LIKE type_t.num5     #单别段长度
DEFINE l_sn_len      LIKE type_t.num5     #流水码段长度（含年期）
DEFINE l_oobf003     LIKE oobf_t.oobf003
DEFINE l_forupd_sql  STRING
DEFINE l_oobf004     LIKE oobf_t.oobf004
DEFINE r_slip        LIKE type_t.chr20    #170718-00003#1 add
#171031-00048#1 add -s
DEFINE l_cnt1        LIKE type_t.num5     
DEFINE l_docno1       STRING               
DEFINE l_docno2       STRING               
#171031-00048#1 add -e
#add by huna20180608---s
DEFINE l_xmda008      LIKE xmda_t.xmda008
DEFINE l_pmdl008      LIKE pmdl_t.pmdl008
DEFINE l_docno_p      LIKE xmda_t.xmda008
DEFINE l_docno_r      LIKE xmda_t.xmda008
DEFINE l_pmdp003_str  STRING
#add by huna20180608---e
DEFINE l_pmdp003      LIKE pmdp_t.pmdp003
#C20190212-07783--S
DEFINE l_con       STRING                            #营运据点与单别分隔符
DEFINE l_con1      STRING                            #单别与单号分隔符
DEFINE l_yy        LIKE type_t.num5                  #会计年(两位)
DEFINE l_yyyy      LIKE type_t.num5                  #会计年(四位)
DEFINE l_mm        LIKE type_t.chr5                  #自然月
DEFINE l_dd        LIKE type_t.num5                  #170112-00035#1
DEFINE l_month     LIKE oogc_t.oogc016               #自然月
DEFINE l_pp        LIKE type_t.chr10                 #会计期
DEFINE l_ww        LIKE type_t.num5                  #自然周
DEFINE l_wd        LIKE type_t.num5                  #星期
DEFINE l_yys       LIKE type_t.chr2
DEFINE l_wws       LIKE type_t.chr2
DEFINE l_wds       LIKE type_t.chr2
DEFINE l_format    STRING                            #流水码格式
DEFINE l_date      STRING                            #单号年期格式部分
DEFINE l_ooef_t RECORD  #組織基本資料檔
       ooefent LIKE ooef_t.ooefent, #企业编号
       ooefstus LIKE ooef_t.ooefstus, #状态码
       ooef001 LIKE ooef_t.ooef001, #组织编号
       ooef002 LIKE ooef_t.ooef002, #税号
       ooef004 LIKE ooef_t.ooef004, #单据别参照表号
       ooef005 LIKE ooef_t.ooef005, #单据据点编号
       ooef006 LIKE ooef_t.ooef006, #所属国家地区
       ooef007 LIKE ooef_t.ooef007, #上市柜公司编号
       ooef008 LIKE ooef_t.ooef008, #行事历参照表号
       ooef009 LIKE ooef_t.ooef009, #制造行事历对应类别
       ooef010 LIKE ooef_t.ooef010, #办公行事历对应类别
       ooef011 LIKE ooef_t.ooef011, #专属国家地区功能
       ooef012 LIKE ooef_t.ooef012, #联络对象识别码
       ooef013 LIKE ooef_t.ooef013, #日期显示格式
       ooefownid LIKE ooef_t.ooefownid, #资料所有者
       ooefowndp LIKE ooef_t.ooefowndp, #资料所有部门
       ooefcrtid LIKE ooef_t.ooefcrtid, #资料录入者
       ooefcrtdp LIKE ooef_t.ooefcrtdp, #资料录入部门
       ooefcrtdt LIKE ooef_t.ooefcrtdt, #资料创建日
       ooefmodid LIKE ooef_t.ooefmodid, #资料更改者
       ooefmoddt LIKE ooef_t.ooefmoddt, #最近更改日
       ooef014 LIKE ooef_t.ooef014, #币种参照表号
       ooef015 LIKE ooef_t.ooef015, #汇率参照表号
       ooef016 LIKE ooef_t.ooef016, #主币种编号
       ooef017 LIKE ooef_t.ooef017, #法人归属
       ooef018 LIKE ooef_t.ooef018, #时区
       ooef019 LIKE ooef_t.ooef019, #税区
       ooef020 LIKE ooef_t.ooef020, #工商登记号
       ooef021 LIKE ooef_t.ooef021, #法人代表
       ooef022 LIKE ooef_t.ooef022, #注册资本
       ooef003 LIKE ooef_t.ooef003, #法人否
       ooef023 LIKE ooef_t.ooef023, #数字/金额显示格式
       ooef024 LIKE ooef_t.ooef024, #据点对应客户/供应商编号
       ooef025 LIKE ooef_t.ooef025, #品管参照表号
       ooef026 LIKE ooef_t.ooef026, #默认存款银行账户
       ooef100 LIKE ooef_t.ooef100, #门店状态
       ooef101 LIKE ooef_t.ooef101, #层级类型
       ooef102 LIKE ooef_t.ooef102, #业态
       ooef103 LIKE ooef_t.ooef103, #渠道
       ooef104 LIKE ooef_t.ooef104, #商圈
       ooef105 LIKE ooef_t.ooef105, #可比店
       ooef106 LIKE ooef_t.ooef106, #价格参考标准
       ooef107 LIKE ooef_t.ooef107, #店庆会计期
       ooef108 LIKE ooef_t.ooef108, #散客编号
       ooef109 LIKE ooef_t.ooef109, #开业日期
       ooef110 LIKE ooef_t.ooef110, #闭店日期
       ooef111 LIKE ooef_t.ooef111, #测量面积
       ooef112 LIKE ooef_t.ooef112, #建筑面积
       ooef113 LIKE ooef_t.ooef113, #经营面积
       ooef114 LIKE ooef_t.ooef114, #合作对象总数
       ooef115 LIKE ooef_t.ooef115, #24小时营业否
       ooef120 LIKE ooef_t.ooef120, #本店取货订定比例
       ooef121 LIKE ooef_t.ooef121, #异店取货订定比例
       ooef122 LIKE ooef_t.ooef122, #总部配送订定比例
       ooef123 LIKE ooef_t.ooef123, #默认收货成本仓
       ooef124 LIKE ooef_t.ooef124, #默认出货成本仓
       ooef125 LIKE ooef_t.ooef125, #默认在途成本仓
       ooef150 LIKE ooef_t.ooef150, #门店类别
       ooef151 LIKE ooef_t.ooef151, #规模类别
       ooef152 LIKE ooef_t.ooef152, #门店周期
       ooef153 LIKE ooef_t.ooef153, #销售区域
       ooef154 LIKE ooef_t.ooef154, #销售省区
       ooef155 LIKE ooef_t.ooef155, #销售地区
       ooef156 LIKE ooef_t.ooef156, #销售片区
       ooef157 LIKE ooef_t.ooef157, #其他属性1
       ooef158 LIKE ooef_t.ooef158, #其他属性2
       ooef159 LIKE ooef_t.ooef159, #其他属性3
       ooef160 LIKE ooef_t.ooef160, #其他属性4
       ooef161 LIKE ooef_t.ooef161, #其他属性5
       ooef162 LIKE ooef_t.ooef162, #其他属性6
       ooef163 LIKE ooef_t.ooef163, #其他属性7
       ooef164 LIKE ooef_t.ooef164, #其他属性8
       ooef165 LIKE ooef_t.ooef165, #其他属性9
       ooef166 LIKE ooef_t.ooef166, #其他属性10
       ooef167 LIKE ooef_t.ooef167, #其他属性11
       ooef168 LIKE ooef_t.ooef168, #其他属性12
       ooef169 LIKE ooef_t.ooef169, #其他属性13
       ooef170 LIKE ooef_t.ooef170, #其他属性14
       ooef171 LIKE ooef_t.ooef171, #其他属性15
       ooef172 LIKE ooef_t.ooef172, #其他属性16
       ooef173 LIKE ooef_t.ooef173, #其他属性17
       ooefunit LIKE ooef_t.ooefunit, #应用组织
       ooef200 LIKE ooef_t.ooef200, #分群编号
       ooef201 LIKE ooef_t.ooef201, #营运据点
       ooef202 LIKE ooef_t.ooef202, #预测组织
       ooef203 LIKE ooef_t.ooef203, #部门组织
       ooef204 LIKE ooef_t.ooef204, #核算组织
       ooef205 LIKE ooef_t.ooef205, #预算组织
       ooef206 LIKE ooef_t.ooef206, #资金组织
       ooef207 LIKE ooef_t.ooef207, #资产组织
       ooef208 LIKE ooef_t.ooef208, #销售组织
       ooef209 LIKE ooef_t.ooef209, #销售范围
       ooef210 LIKE ooef_t.ooef210, #采购组织
       ooef211 LIKE ooef_t.ooef211, #物流组织
       ooef212 LIKE ooef_t.ooef212, #结算组织
       ooef213 LIKE ooef_t.ooef213, #nouse
       ooef214 LIKE ooef_t.ooef214, #nouse
       ooef215 LIKE ooef_t.ooef215, #nouse
       ooef216 LIKE ooef_t.ooef216, #nouse
       ooef217 LIKE ooef_t.ooef217, #nouse
       ooef301 LIKE ooef_t.ooef301, #营销中心
       ooef302 LIKE ooef_t.ooef302, #配送中心
       ooef303 LIKE ooef_t.ooef303, #采购中心
       ooef304 LIKE ooef_t.ooef304, #门店
       ooef305 LIKE ooef_t.ooef305, #办事处
       ooef306 LIKE ooef_t.ooef306, #nouse
       ooef307 LIKE ooef_t.ooef307, #nouse
       ooef308 LIKE ooef_t.ooef308, #nouse
       ooef309 LIKE ooef_t.ooef309, #nouse
       ooef310 LIKE ooef_t.ooef310, #nouse
       ooef126 LIKE ooef_t.ooef126, #默认收货非成本仓
       ooef127 LIKE ooef_t.ooef127, #默认出货非成本仓
       ooef128 LIKE ooef_t.ooef128, #默认在途非成本仓
       ooef116 LIKE ooef_t.ooef116 #语言别
END RECORD
#C20190212-07783--e
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_docno = ''

   #多角單據流水號保持一致，委外工單除外
   #IF cl_get_para(g_enterprise,'','E-BAS-0018') = 'Y' AND p_prog <> 'asft300' THEN   #170301-00021#3 by 09263 --mark
   IF cl_get_para(g_enterprise,'','E-BAS-0018') = 'Y' AND p_prog NOT MATCHES 'asft300*' THEN   #170301-00021#3 by 09263 --add
      CALL s_aooi200_get_site(p_docno)
           RETURNING l_success,l_site
      CALL s_aooi200_get_slip(p_docno)
           RETURNING l_success,l_slip
      LET l_ooef005 = ''
      SELECT ooef005 INTO l_ooef005
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = p_site
      LET l_ooef005 = UPSHIFT(l_ooef005)
      #171031-00048#1 add -s
      #SITE 长度
      LET l_site_len = cl_get_para(g_enterprise,'','E-COM-0003')
      #单别长度
      LET l_slip_len = cl_get_para(g_enterprise,'','E-COM-0001')
      IF cl_get_para(g_enterprise,'','E-COM-0002') = 'Y' THEN
         LET l_cnt1 = l_site_len + l_slip_len + 1   #加上“-”分隔
      ELSE 
         LET l_cnt1 = l_site_len + l_slip_len
      END IF
      LET l_docno1 = p_docno.subString(1,l_cnt1)                     #截取单别+据点
      LET l_docno2 = p_docno.subString(l_cnt1+1,p_docno.getLength()) #截取单据的后半字串
      #171031-00048#1 add -e
      CALL cl_str_replace(l_docno1,l_site,l_ooef005)  #171031-00048#1 mod p_docno->l_docno1
           RETURNING r_docno
      LET r_docno = r_docno.append(l_docno2)   #171031-00048#1 add   #组成替换后的新单据
      #170718-00003#1 add---start---
      LET r_slip = ''
      CALL cl_str_replace(l_slip,l_site,l_ooef005)
           RETURNING r_slip
      IF cl_null(r_slip) THEN
         LET r_slip = l_slip
      END IF
      #170718-00003#1 add---end---
      #CALL cl_str_replace(r_docno,l_slip,p_slip)      #170718-00003#1 mark
      CALL cl_str_replace(r_docno,r_slip,p_slip)       #170718-00003#1 add
           RETURNING r_docno
      
      #檢查新的單據號碼是否已存在，存在的話顯示詳細的錯誤訊息並回傳錯誤
      LET l_docno = r_docno
      LET l_cnt = 0
      CASE
         #WHEN p_prog = 'axmt500'  #訂單單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'axmt500*'    #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM xmda_t
             WHERE xmdaent = g_enterprise
               AND xmdadocno = l_docno
         #WHEN p_prog = 'axmt540'  #出貨單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'axmt540*' #出貨單號   #170301-00021#3 by 09263 --add
           #OR p_prog = 'axmt541'  #無訂單出貨   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'axmt541*'   #無訂單出貨  #170301-00021#3 by 09263 --add
           #OR p_prog = 'axmt600'  #銷退單號   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'axmt600*'#銷退單號   #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM xmdk_t
             WHERE xmdkent = g_enterprise
               AND xmdkdocno = l_docno
         #WHEN p_prog = 'apmt500'  #採購單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'apmt500*'  #採購單號  #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM pmdl_t
             WHERE pmdlent = g_enterprise
               AND pmdldocno = l_docno
         #WHEN p_prog = 'apmt580'  #倉退單號   #170301-00021#3 by 09263 --mark
         WHEN p_prog MATCHES 'apmt580*'  #倉退單號   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt520'  #收貨單號   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt520*'  #收貨單號   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt530'  #收貨入庫   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt530*'  #收貨入庫   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt531'  #委外收貨入庫   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt531*'  #委外收貨入庫   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt532'  #無採購收貨入庫   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt532*'  #無採購收貨入庫   #170301-00021#3 by 09263 --add
           #OR p_prog = 'apmt570'  #入庫單號   #170301-00021#3 by 09263 --mark
           OR p_prog MATCHES 'apmt570*'  #入庫單號   #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM pmds_t
             WHERE pmdsent = g_enterprise
               AND pmdsdocno = l_docno
         #WHEN p_prog = 'asft300'  #委外工單   #170301-00021#3 by 09263 --mark      
         WHEN p_prog MATCHES 'asft300*'  #委外工單   #170301-00021#3 by 09263 --add
            SELECT COUNT(*) INTO l_cnt
              FROM sfaa_t
             WHERE sfaaent = g_enterprise
               AND sfaadocno = l_docno
      END CASE
      IF NOT cl_null(l_cnt) AND l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aic-00131'
         LET g_errparam.extend = r_docno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         LET r_docno = ''
         RETURN r_success,r_docno
      END IF
      #更新單據別最大流水號oobf_t
      LET l_oobx007 = 0
      SELECT oobx007 INTO l_oobx007
        FROM oobx_t
       WHERE oobxent = g_enterprise
         AND oobx001 = l_slip
      LET l_sn = l_docno[r_docno.getlength()-l_oobx007+1,r_docno.getlength()]
      #SITE 长度
      LET l_site_len = cl_get_para(g_enterprise,'','E-COM-0003')
      #单别长度
      LET l_slip_len = cl_get_para(g_enterprise,'','E-COM-0001')
      #单号长度
      LET l_doc_len = cl_get_para(g_enterprise,'','E-COM-0005')
      #流水码长度（含年期）
      LET l_sn_len = l_doc_len - l_slip_len - l_site_len 
      IF cl_get_para(g_enterprise,'','E-COM-0002') ='Y' THEN
         LET l_sn_len = l_sn_len - 1
      END IF
      IF cl_get_para(g_enterprise,'','E-COM-0004') ='Y' THEN
         LET l_sn_len = l_sn_len - 1
      END IF
      IF l_sn_len = l_sn.getlength() THEN
         LET l_oobf003 = '0'
      ELSE
         LET l_oobf003 = l_docno[r_docno.getlength()-l_sn_len+1,r_docno.getlength()-l_oobx007]
      END IF
      #从最大流水码表oobf_t找到合适的最大流水码，加1，写入oobf_t，若取不到，则编001存入
      #要先锁住最大流水码表，锁到单别的范围
      LET l_forupd_sql = " SELECT oobf004+1 FROM oobf_t ",
                          " WHERE oobfent = ",g_enterprise,
                            " AND oobfsite= '",p_site,"'",
                            " AND oobf001 = '",l_ooef005,"'",
                            " AND oobf002 = '",p_slip,"'", 
                            " AND oobf003 = '",l_oobf003,"'",
                            " FOR UPDATE "
      LET l_forupd_sql = cl_sql_forupd(l_forupd_sql)
      DECLARE auno_lock_cl1 CURSOR FROM l_forupd_sql
      OPEN auno_lock_cl1
      FETCH auno_lock_cl1 INTO l_oobf004
      IF SQLCA.sqlcode = "-263" THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00115'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         CLOSE auno_lock_cl
         LET r_success = FALSE
         LET r_docno = ''
         RETURN r_success,r_docno
      END IF
      #若最大流水码没取到，说明这是第一次取，编个001吧！
      IF SQLCA.sqlcode = 100 THEN
         LET l_oobf004 = 1 
      END IF
      IF l_sn > = l_oobf004 THEN
         LET l_oobf004 = l_sn
         INSERT INTO oobf_t(oobfent,oobfsite,oobf001,oobf002,oobf003,oobf004)
                     VALUES(g_enterprise,p_site,l_ooef005,p_slip,l_oobf003,l_oobf004)  
         IF SQLCA.sqlcode = -239 OR SQLCA.sqlcode = -268 THEN
            UPDATE oobf_t SET oobf004 = l_oobf004
             WHERE oobfent = g_enterprise
               AND oobfsite= p_site
               AND oobf001 = l_ooef005
               AND oobf002 = p_slip
               AND oobf003 = l_oobf003
            IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode 
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CLOSE auno_lock_cl
               LET r_success = FALSE
               LET r_docno = ''
               RETURN r_success,r_docno
            END IF
         END IF
      END IF
      FREE auno_lock_cl
   ELSE   
      #fcx-180408--str---工单编码
      IF p_prog = 'asft300' AND cl_get_doc_para(g_enterprise,p_site,p_slip,'D-MFGC-007') = 'Y' THEN   
         #C20190212-07783--S--若下站据点工单与上站工单一致，生成的最大流水号记录oobf_t也要更改
         #add by huna20180608---s
         #如果来源订单单号 对应的来源是 【6.多角抛转】，
         #              并且来源单号为 【E45】,
         #来源据点为昆山【KS】，抛转据点为南通【NT】
         #则生成的工单号 后九位直接置为 来源工单号的 后九位
         LET l_xmda008 = ''
         LET l_docno_p = p_docno
         SELECT xmda008 INTO l_xmda008 FROM xmda_t WHERE xmdaent = g_enterprise AND xmdadocno = l_docno_p AND xmda007 = '6'
         IF NOT cl_null(l_xmda008) THEN 
           CALL s_aooi200_get_slip(l_xmda008) RETURNING l_success,l_slip
           #IF l_slip = 'E45' OR l_slip = 'E46' THEN  #add E46 的情况 by huna20180611
           IF l_slip = 'E45' OR l_slip = 'E46' OR l_slip = 'E4O'  THEN  #C200917-01626#1add by pane 200917增加E4O单别
                ######单号编码,工单后面流水码相同########
                #获取l_xmda008(多角来源委外采购单对应的工单)
                LET l_pmdp003 = '' 
                SELECT pmdp003 INTO l_pmdp003 
                  FROM pmdp_t,pmdl_t 
                 WHERE pmdpent = g_enterprise
                   AND pmdpent = pmdlent               
                   AND pmdldocno = pmdpdocno 
                   AND pmdpdocno = l_xmda008 
                   AND pmdl007 = '4'
                   AND pmdpseq = p_seq 
                IF NOT cl_null(l_pmdp003) THEN 
                    LET l_pmdp003_str = l_pmdp003
                    CALL s_aooi200_get_site(l_pmdp003_str)
                         RETURNING l_success,l_site
                    IF l_site = 'KS' AND p_site = 'NT' THEN    #来源为 KS，当前为NT，才走   
                       #营运据点与单别分隔符
                       IF cl_get_para(g_enterprise,'','E-COM-0002') ='Y' THEN
                          LET l_con     ='-'
                       ELSE
                          LET l_con     =''
                       END IF
                       #单别与单号分隔符
                       IF cl_get_para(g_enterprise,'','E-COM-0004') ='Y' THEN
                          LET l_con1     ='-'
                       ELSE
                          LET l_con1     =''
                       END IF     
                       #开始编写单号
                       #期别流水码格式化
                       #取年期资料
                       SELECT ooefent,ooefstus,ooef001,ooef002,ooef004,ooef005,ooef006,ooef007,ooef008,ooef009,ooef010,ooef011,ooef012,ooef013,ooefownid,ooefowndp,ooefcrtid,ooefcrtdp,ooefcrtdt,ooefmodid,ooefmoddt,ooef014,ooef015,ooef016,ooef017,ooef018,ooef019,ooef020,ooef021,ooef022,ooef003,ooef023,ooef024,ooef025,ooef026,ooef100,ooef101,ooef102,ooef103,ooef104,ooef105,ooef106,ooef107,ooef108,ooef109,ooef110,ooef111,ooef112,ooef113,ooef114,ooef115,ooef120,ooef121,ooef122,ooef123,ooef124,ooef125,ooef150,ooef151,ooef152,
                              ooef153,ooef154,ooef155,ooef156,ooef157,ooef158,ooef159,ooef160,ooef161,ooef162,ooef163,ooef164,ooef165,ooef166,ooef167,ooef168,ooef169,ooef170,ooef171,ooef172,ooef173,ooefunit,ooef200,ooef201,ooef202,ooef203,ooef204,ooef205,ooef206,ooef207,ooef208,ooef209,ooef210,ooef211,ooef212,ooef213,ooef214,ooef215,ooef216,ooef217,ooef301,ooef302,ooef303,ooef304,ooef305,ooef306,ooef307,ooef308,ooef309,ooef310,ooef126,ooef127,ooef128,ooef116 
                        INTO l_ooef_t.* FROM ooef_t  #161124-00048#7  2016/12/13 By 08734 add
                        WHERE ooefent = g_enterprise
                          AND ooef001 = p_site                       
                       #oogc015 = 会计年  oogc006 = 会计期 oogc008 = 自然周
                       SELECT oogc015,oogc006,oogc008,oogc016 INTO l_yyyy,l_pp,l_ww,l_month
                         FROM oogc_t 
                        WHERE oogcent = g_enterprise 
                          AND oogc001 = l_ooef_t.ooef008 
                          AND oogc002 = l_ooef_t.ooef010  
                          AND oogc003 = p_date 
                       
                       IF SQLCA.sqlcode = 100 THEN
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'sub-00326'
                          LET g_errparam.extend = p_site
                          LET g_errparam.popup = TRUE
                          CALL cl_err()                       
                          LET r_success = FALSE
                          LET r_docno = ''
                          RETURN r_success,r_docno
                       END IF

                       #取2位的年，这样写会有3000年虫但是不用定义一个字符型截位
                       #IF l_yyyy >= 2000 THEN LET l_yy = l_yyyy -2000 END IF   fcx-180328 mark
                       #IF l_yyyy <= 2000 THEN LET l_yy = l_yyyy -1900 END IF   fcx-180328 mark
                       IF l_yyyy >= 2000 THEN LET l_yy = l_yyyy -2000 USING "&&" END IF  #fcx-180328 add
                       IF l_yyyy <= 2000 THEN LET l_yy = l_yyyy -1900 USING "&&" END IF  #fcx-180328 add

                       #取星期
                       LET l_wd = WEEKDAY(p_date)   #jinfeng

                       LET l_format =''  #格式要先清空
                       LET l_date =''    #接受格式化之后的年期
                       LET l_oobf003 =''
                       #fcx-180328--str--
                       LET l_ww = l_ww USING "&&"
                       LET l_yys = s_chr_atrim(l_yy)
                       #LET l_wws = s_chr_atrim(l_ww)             #20190108 mark by yangtt
                       LET l_wws = s_chr_atrim(l_ww) USING "&&"   #20190108 add by yangtt
                       LET l_wds = s_chr_atrim(l_wd)
                       #fcx-180328--end--
                       LET l_oobf003 = l_yys,l_wws,l_wds            #jinfeng
                       LET l_oobf003 = s_chr_atrim(l_oobf003)                       
                       LET r_docno = l_ooef_t.ooef005,l_con,p_slip,l_con1,l_oobf003,'0000'
                       LET l_docno_r = r_docno                 
                       LET l_docno_r[r_docno.getlength()-8,r_docno.getlength()] = l_pmdp003[r_docno.getlength()-8,r_docno.getlength()]
                       LET r_docno = l_docno_r
                    END IF 
#                    IF l_site = 'KS' AND p_site = 'NT' THEN    #C20190416-07783 ADD 订单最后一段与上站一致的，不记录流水号  C20190419-07783 MARK 得记录不然删除的时候回删不掉
#               
#                    ELSE                                       #C20190416-07783 ADD 订单最后一段与上站一致的，不记录流水号  C20190419-07783 MARK 得记录不然删除的时候回删不掉
                       #C20190212-07783--S---更新oobf_t档
                       LET l_ooef005 = ''
                       SELECT ooef005 INTO l_ooef005
                         FROM ooef_t
                        WHERE ooefent = g_enterprise
                          AND ooef001 = p_site
                       LET l_ooef005 = UPSHIFT(l_ooef005)      
                       LET l_oobf003 = l_docno_r[r_docno.getlength()-8,r_docno.getlength()-4]                    
                       #从最大流水码表oobf_t找到合适的最大流水码，加1，写入oobf_t，若取不到，则编001存入
                       #要先锁住最大流水码表，锁到单别的范围
                       LET l_forupd_sql = " SELECT oobf004 FROM oobf_t ",  #不需要最大流水码加1，因为由于订单号要求与上据点的一致。
                                                                           #流水码没有，则最大流水码给当前值，若取到了 判断下是否比当前大，大的话则不需要更新，否则给当前值。
                                           " WHERE oobfent = ",g_enterprise,
                                             " AND oobfsite= '",p_site,"'",
                                             " AND oobf001 = '",l_ooef005,"'",
                                             " AND oobf002 = '",p_slip,"'", 
                                             " AND oobf003 = '",l_oobf003,"'",
                                             " FOR UPDATE "
                       LET l_forupd_sql = cl_sql_forupd(l_forupd_sql)
                       DECLARE auno_lock_cl2 CURSOR FROM l_forupd_sql
                       OPEN auno_lock_cl2
                       FETCH auno_lock_cl2 INTO l_oobf004
                       IF SQLCA.sqlcode = "-263" THEN
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'sub-00115'
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                          CLOSE auno_lock_cl2
                          LET r_success = FALSE
                          LET r_docno = ''
                          RETURN r_success,r_docno
                       END IF
                       #若最大流水码没取到，说明这是第一次取，给当前的流水码！
                       IF SQLCA.sqlcode = 100 THEN
                          LET l_oobf004 = l_docno_r[r_docno.getlength()-3,r_docno.getlength()]  
                       END IF
                       IF NOT cl_null(l_oobf004) AND l_docno_r[r_docno.getlength()-3,r_docno.getlength()] > l_oobf004  THEN
                          LET l_oobf004 = l_docno_r[r_docno.getlength()-3,r_docno.getlength()]
                       END IF
                       INSERT INTO oobf_t(oobfent,oobfsite,oobf001,oobf002,oobf003,oobf004)
                                   VALUES(g_enterprise,p_site,l_ooef005,p_slip,l_oobf003,l_oobf004)  
                       IF SQLCA.sqlcode = -239 OR SQLCA.sqlcode = -268 THEN
                          UPDATE oobf_t SET oobf004 = l_oobf004
                           WHERE oobfent = g_enterprise
                             AND oobfsite= p_site
                             AND oobf001 = l_ooef005
                             AND oobf002 = p_slip
                             AND oobf003 = l_oobf003
                          IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
                             INITIALIZE g_errparam TO NULL
                             LET g_errparam.code = SQLCA.sqlcode 
                             LET g_errparam.popup = TRUE
                             CALL cl_err()
                             CLOSE auno_lock_cl2
                             LET r_success = FALSE
                             LET r_docno = ''
                             RETURN r_success,r_docno
                          END IF
                       END IF
                       FREE auno_lock_cl2                
                       #C20190212-07783--E---更新oobf_t档  
#                   END IF   #C20190416-07783 ADD 订单最后一段与上站一致的，不记录流水号      C20190419-07783 MARK 得记录不然删除的时候回删不掉               
                END IF                          
                ######单号编码,工单后面流水码相同########
           END IF
         ELSE   
           CALL cs_aooi200_gen_docno(p_site,p_slip,p_date,p_prog)  
           RETURNING r_success,r_docno         
         END IF 
         #add by huna20180608---e          
#        CALL cs_aooi200_gen_docno(p_site,p_slip,p_date,p_prog)  
#        RETURNING r_success,r_docno
         #C20190212-07783--E--若下站据点工单与上站工单一致，生成的最大流水号记录oobf_t也要更改
      ELSE         
      #fcx-180408--end---工单编码      
         CALL s_aooi200_gen_docno(p_site,p_slip,p_date,p_prog)
              RETURNING r_success,r_docno
      END IF  #fcx-180408--end---工单编码

      #C20190212-07783--S---拿到上面去
      #add by huna20180608---s
      #如果来源订单单号 对应的来源是 【6.多角抛转】，
      #              并且来源单号为 【E45】,
      #来源据点为昆山【KS】，抛转据点为南通【NT】
      #则生成的工单号 后九位直接置为 来源工单号的 后九位
#      LET l_xmda008 = ''
#      LET l_docno_p = p_docno
#      SELECT xmda008 INTO l_xmda008 FROM xmda_t WHERE xmdaent = g_enterprise AND xmdadocno = l_docno_p AND xmda007 = '6'
#      IF NOT cl_null(l_xmda008) THEN 
#        CALL s_aooi200_get_slip(l_xmda008) RETURNING l_success,l_slip
#        IF l_slip = 'E45' OR l_slip = 'E46' THEN  #add E46 的情况 by huna20180611
#             ######单号编码,工单后面流水码相同########
#             #获取l_xmda008(多角来源委外采购单对应的工单)
#             LET l_pmdp003 = '' 
#             SELECT pmdp003 INTO l_pmdp003 
#               FROM pmdp_t,pmdl_t 
#              WHERE pmdpent = g_enterprise
#                AND pmdpent = pmdlent               
#                AND pmdldocno = pmdpdocno 
#                AND pmdpdocno = l_xmda008 
#                AND pmdl007 = '4'
#                AND pmdpseq = p_seq 
#             IF NOT cl_null(l_pmdp003) THEN 
#                 LET l_pmdp003_str = l_pmdp003
#                 CALL s_aooi200_get_site(l_pmdp003_str)
#                      RETURNING l_success,l_site
#                 IF l_site = 'KS' AND p_site = 'NT' THEN    #来源为 KS，当前为NT，才走 
#                    LET l_docno_r = r_docno                 
#                    LET l_docno_r[r_docno.getlength()-8,r_docno.getlength()] = l_pmdp003[r_docno.getlength()-8,r_docno.getlength()]
#                    LET r_docno = l_docno_r
#                 END IF 
#             END IF                          
#             ######单号编码,工单后面流水码相同########
#        END IF 
#      END IF 
      #add by huna20180608---e 
      #C20190212-07783--E---拿到上面去      
   END IF
   
   RETURN r_success,r_docno
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aic_carry_tri_so_upd2 (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/8/31 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_tri_so_upd2(p_pmdldocno,p_firstxmdadocno,p_xmda031,p_xmdasite,p_xmee900)
   DEFINE p_pmdldocno        LIKE pmdl_t.pmdldocno   #來源採購單號
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno   #初始訂單單號(可Null)
   DEFINE p_xmda031          LIKE xmda_t.xmda031     #多角序號
   DEFINE p_xmdasite         LIKE xmda_t.xmdasite    #營運據點
   DEFINE p_xmee900          LIKE xmee_t.xmee900     #变更版次
   DEFINE r_success          LIKE type_t.num5        #執行結果
   DEFINE r_xmdadocno        LIKE xmda_t.xmdadocno   #產生之訂單單號
   #170824-00002#3 --s add
   DEFINE l_pmdl020          LIKE pmdl_t.pmdl020
   DEFINE l_pmdl025          LIKE pmdl_t.pmdl025
   DEFINE l_pmdl026          LIKE pmdl_t.pmdl026
   DEFINE l_xmda005_o        LIKE xmda_t.xmda005    
   #170824-00002#3 --e add
   #C20180831-07783---S
   DEFINE l_xmegseq          LIKE xmeg_t.xmegseq,
          l_xmeg901          LIKE xmeg_t.xmeg901,
          l_xmeg011          LIKE xmeg_t.xmeg011,
          l_xmeg007          LIKE xmeg_t.xmeg007,
          l_xmeg028          LIKE xmeg_t.xmeg028,
          l_xmdd014          LIKE xmdd_t.xmdd014,
          l_xmdd031          LIKE xmdd_t.xmdd031,
          l_xmddud011        LIKE xmdd_t.xmddud011,
          l_xmdc028          LIKE xmdc_t.xmdc028,
          l_xmddud013s       LIKE xmdd_t.xmddud013,
          l_xmdd031s         LIKE xmdd_t.xmdd031,
          l_xmdd032s         LIKE xmdd_t.xmdd032 
   #C20180831-07783---E      
   DEFINE l_xmddud013        LIKE xmdd_t.xmddud013  #C20190505-07783 ADD   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_xmdadocno = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_pmdldocno) OR
  #   cl_null(p_xmda031) OR
  #   cl_null(p_xmdasite) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_tri_so_upd"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_xmdadocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_pmdldocno) THEN
      CALL s_azzi902_get_gzzd("aicp200","lbl_pmdldocno") RETURNING g_colname_1,g_comment_1   #來源採購單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_xmda031) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq100","lbl_xmda031") RETURNING g_colname_1,g_comment_1   #多角序號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_xmdasite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #營運據點
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
      RETURN r_success,r_xmdadocno
   END IF
  #170816-00007#31 -E add

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF

   #塞xmda_t
   INITIALIZE g_xmda.* TO NULL
   
   #SELECT 原始訂單資料
   SELECT * INTO g_xmda.*
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmda031 = p_xmda031
      AND xmdasite = p_xmdasite
      AND xmdastus <> 'X'
   
   LET r_xmdadocno = g_xmda.xmdadocno
   
   #SELECT 初始訂單資料
   IF NOT cl_null(p_firstxmdadocno) THEN
     #170824-00002#3 --s mark
     #SELECT xmda005,xmda033,xmda044        
     #  INTO g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044
     #170824-00002#3 --e mark
     #170824-00002#3 --s add
     SELECT xmda005,xmda033,xmda044,
            xmda027,xmda025,xmda026,
            xmda020,xmda037,xmda038,xmda036
       INTO g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044,
            g_xmda.xmda027,g_xmda.xmda025,g_xmda.xmda026,
            g_xmda.xmda020,g_xmda.xmda037,g_xmda.xmda038,g_xmda.xmda036
     #170824-00002#3 --e add 
        FROM xmda_t
       WHERE xmdaent = g_enterprise
         AND xmdadocno = p_firstxmdadocno
   END IF
   
   #SELECT來源採購單資料
   SELECT pmdldocdt,pmdl001,
          pmdl015,pmdl032
         ,pmdl020,pmdl025,pmdl026 #170824-00002#3 add
     INTO g_xmda.xmdadocdt,g_xmda.xmda001,
          g_xmda.xmda015,g_xmda.xmda034
         ,l_pmdl020,l_pmdl025,l_pmdl026 #170824-00002#3 add
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = p_pmdldocno
   
   #170824-00002#3 --s add
   #沒有初始訂單，表示是代採買，則抓來源採購單的欄位
   IF cl_null(p_firstxmdadocno) THEN
      LET g_xmda.xmda020 = l_pmdl020
      LET g_xmda.xmda025 = l_pmdl025
      LET g_xmda.xmda026 = l_pmdl026
   END IF
   #170824-00002#3 --e add
   
   LET g_xmda.xmdamodid = g_user
   LET g_xmda.xmdamoddt = cl_get_current()
   
   #取匯率
   CALL s_aic_carry_exchange(g_xmda.xmda048,g_xmda.xmdasite,g_xmda.xmdadocdt,g_xmda.xmda015,'','1')
   RETURNING r_success,g_xmda.xmda016
   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF
   #C20180830-07783--先取单别设置的默认字段---S
   LET l_xmda005_o = g_xmda.xmda005
   LET g_xmda.xmda005 = s_aooi200_get_doc_default(g_icab.icab003,'1',g_icac.icac003,'xmda005',g_xmda.xmda005) 
   IF cl_null(g_xmda.xmda005) THEN
      LET g_xmda.xmda005 = l_xmda005_o  
   END IF
   #C20180830-07783--先取单别设置的默认字段---E  
   UPDATE xmda_t
      SET (xmda005,xmda033,xmda044,
           xmdadocdt,xmda001,
           xmda015,xmda034,
           xmdamodid,xmdamoddt,
           #170824-00002#3 --s add
           #客戶連絡人、收貨地址、帳款地址、
           #運送方式、起運點、目的地、送貨供應商
           xmda027,xmda025,xmda026,
           xmda020,xmda037,xmda038,xmda036,
           #170824-00002#3 --e add           
           xmda016)
        = (g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044,
           g_xmda.xmdadocdt,g_xmda.xmda001,
           g_xmda.xmda015,g_xmda.xmda034,
           g_xmda.xmdamodid,g_xmda.xmdamoddt,
           #170824-00002#3 --s add
           g_xmda.xmda027,g_xmda.xmda025,g_xmda.xmda026,
           g_xmda.xmda020,g_xmda.xmda037,g_xmda.xmda038,g_xmda.xmda036,
           #170824-00002#3 --e add    
           g_xmda.xmda016)
     WHERE xmdaent = g_enterprise
       AND xmdadocno = g_xmda.xmdadocno
       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "UPDATE xmda_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
         
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF
    
   #因为下站的订单可能已经进行了预扣、转出通单、备货、出货单等，还是要保留原数据，因而进行更新下站订单的方式。另外，要注意加一些管控
 
   #首先，变更数量不可小于出通/出货数量
   DECLARE xmeg_cs CURSOR FOR  
      SELECT DISTINCT xmegseq,xmeg901,xmeg011,xmeg007,xmeg028  FROM xmeg_t 
       WHERE xmegent = g_enterprise 
         AND xmegdocno = p_firstxmdadocno
         AND xmeg900 = p_xmee900
       ORDER BY xmegseq           
   FOREACH xmeg_cs INTO l_xmegseq,l_xmeg901,l_xmeg011,l_xmeg007,l_xmeg028    
       CASE l_xmeg901
         WHEN '2'                     #單身修改
            #檢查數量是否小於已出貨量/已轉出通量
            LET l_xmdd014 = 0
            LET l_xmdd031 = 0
            CALL s_axmt510_quant_chk(g_xmda.xmdadocno,l_xmegseq) RETURNING l_xmdd014,l_xmdd031
            IF l_xmeg011 < l_xmdd014 OR l_xmeg011 < l_xmdd031 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'axm-00443'
               LET g_errparam.extend = g_xmda.xmdadocno
               LET g_errparam.popup = TRUE
               CALL cl_err()       
               LET r_success = FALSE
               RETURN r_success,r_xmdadocno
            END IF   
            #C20190505-07783--S--检查，下站订单是否存在备货数量
            #然后，变更数量不可小于预扣 
#            LET l_xmddud011 = 0    #C20180622-07783 add
#            SELECT MAX(SUM(xmddud011))
#              INTO l_xmddud011
#              FROM xmdd_t
#             WHERE xmddent = g_enterprise
#               AND xmdddocno = g_xmda.xmdadocno
#               AND xmddseq = l_xmegseq
#               GROUP BY xmddseq1       
#            IF cl_null(l_xmddud011) THEN LET l_xmddud011 = 0 END IF  #C20180622-07783 add                            
#            IF l_xmeg007 < l_xmddud011 THEN   #C20180622-07783 add
#               INITIALIZE g_errparam TO NULL
##               LET g_errparam.code = 'cxm-00443'    #变更后的数量不可小于预扣！                    C20181204-07783 MARK
#               LET g_errparam.code = 'cxm-01443'     #变更后的数量不可小于下站订单的预扣+已转出通量！ C20181204-07783 ADD
#               LET g_errparam.extend = g_xmda.xmdadocno
#               LET g_errparam.popup = TRUE
#               CALL cl_err()                             
#               LET r_success = FALSE
#               RETURN r_success,r_xmdadocno
#            END IF     
             #C190819-06857#1---mark---s
             #错误管控
             #LET l_xmddud013 = 0
             #SELECT MAX(SUM(xmddud013)) INTO l_xmddud013
             #  FROM xmdd_t
             # WHERE xmddent = g_enterprise
             #   AND xmdddocno = g_xmda.xmdadocno
             #   AND xmddseq = l_xmegseq
             #GROUP BY xmddseq1 
             #IF cl_null(l_xmddud013) THEN LET l_xmddud013 = 0 END IF             
             #IF l_xmddud013 > 0 THEN
             #   INITIALIZE g_errparam TO NULL
             #   LET g_errparam.replace[1] = l_xmddud013
             #   LET g_errparam.code = 'cxm-00031'    #下站订单存在备货数量%1，不可变更仓库!
             #   LET g_errparam.extend = g_xmda.xmdadocno
             #   LET g_errparam.popup = TRUE
             #   CALL cl_err()                    
             #   LET r_success = FALSE
             #   RETURN r_success,r_xmdadocno
             #END IF
             #C190819-06857#1---mark---e
             
            #C20190505-07783--E--检查，下站订单是否存在备货数量
            #最后，如果变更了仓库，需要管控：存未處理的出通單（即已轉出通數量>備貨量+备置量），不可變更倉庫！
            SELECT xmdc028 INTO l_xmdc028 FROM xmdc_t
             WHERE xmdcent = g_enterprise
               AND xmdcdocno = g_xmda.xmdadocno
               AND xmdcseq = l_xmegseq
            IF l_xmeg028 <> l_xmdc028 THEN        

               #C190819-06857#1---add---s
               LET l_xmddud013 = 0
               SELECT MAX(SUM(xmddud013)) INTO l_xmddud013
                 FROM xmdd_t
                WHERE xmddent = g_enterprise
                  AND xmdddocno = g_xmda.xmdadocno
                  AND xmddseq = l_xmegseq
               GROUP BY xmddseq1 
               IF cl_null(l_xmddud013) THEN LET l_xmddud013 = 0 END IF             
               IF l_xmddud013 > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.replace[1] = l_xmddud013
                  LET g_errparam.code = 'cxm-00031'    #下站订单存在备货数量%1，不可变更仓库!
                  LET g_errparam.extend = g_xmda.xmdadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()                    
                  LET r_success = FALSE
                  RETURN r_success,r_xmdadocno
               END IF
               #C190819-06857#1---add---e

               LET l_xmddud013s = 0 
               LET l_xmdd031s = 0
               SELECT SUM(NVL(xmddud013,0)),SUM(NVL(xmdd031,0)),SUM(NVL(xmdd032,0))  INTO l_xmddud013s,l_xmdd031s,l_xmdd032s
                 FROM xmdd_t
                WHERE xmddent = g_enterprise
                  AND xmdddocno = g_xmda.xmdadocno
                  AND xmddseq = l_xmegseq
               GROUP BY xmddseq1                    
               IF l_xmdd031s <> l_xmddud013s+l_xmdd032s THEN
                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'cxm-00445'    #存未處理的出通單（即已轉出通數量>備貨量+备置量），不可變更倉庫！        C20181204-07783 MARK
                  LET g_errparam.code = 'cxm-01445'    #下站的订单存未处理的出通单（即已转出通数量>备货量+备置量），不可变更仓库！C20181204-07783 ADD
                  LET g_errparam.extend = g_xmda.xmdadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()                    
                  LET r_success = FALSE
                  RETURN r_success,r_xmdadocno
               END IF   
            END IF               
       END CASE     
   END FOREACH   
   #更新订单：更新的时候，如果变更了仓库，还要释放预扣；如果只变更了数量，预扣、备货等不能变，变更欠料量。
   CALL s_aic_carry_tri_so_upd2_body(p_firstxmdadocno,p_xmee900,g_xmda.xmdadocno,p_xmdasite) RETURNING r_success
   IF r_success = FALSE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = ''    #更新订单失败
      LET g_errparam.extend = g_xmda.xmdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()                    
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF    

   RETURN r_success,r_xmdadocno
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aic_carry_tri_so_upd_body (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/8/31 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_tri_so_upd2_body(p_xmeedocno,p_xmee900,p_xmdadocno,p_xmdasite)
DEFINE p_xmeedocno     LIKE xmee_t.xmeedocno
DEFINE p_xmee900       LIKE xmee_t.xmee900
DEFINE p_xmdadocno     LIKE xmda_t.xmdadocno
DEFINE p_xmdasite      LIKE xmda_t.xmdasite
DEFINE r_success       LIKE type_t.num5
DEFINE l_xmeeacti      LIKE xmee_t.xmeeacti
DEFINE l_xmee900       LIKE xmee_t.xmee900
DEFINE l_xmee901       LIKE xmee_t.xmee901
DEFINE l_xmee004       LIKE xmee_t.xmee004
DEFINE l_cnt           LIKE type_t.num5
DEFINE l_ooef016       LIKE ooef_t.ooef016,
       l_ooef017       LIKE ooef_t.ooef017,
       l_ooef019       LIKE ooef_t.ooef019,
       g_site_o        LIKE xmda_t.xmdasite
#161109-00085#47-s mod
#DEFINE l_xmee          RECORD LIKE xmee_t.*      #單頭檔   #161109-00085#47-s mark
DEFINE l_xmee          RECORD  #訂單變更單頭檔
       xmeeent LIKE xmee_t.xmeeent, #企業編號
       xmeesite LIKE xmee_t.xmeesite, #營運據點
       xmeedocno LIKE xmee_t.xmeedocno, #訂單單號
       xmeedocdt LIKE xmee_t.xmeedocdt, #訂單日期
       xmee001 LIKE xmee_t.xmee001, #版次
       xmee002 LIKE xmee_t.xmee002, #業務人員
       xmee003 LIKE xmee_t.xmee003, #業務部門
       xmee004 LIKE xmee_t.xmee004, #客戶編號
       xmee005 LIKE xmee_t.xmee005, #訂單性質
       xmee006 LIKE xmee_t.xmee006, #多角性質
       xmee007 LIKE xmee_t.xmee007, #資料來源
       xmee008 LIKE xmee_t.xmee008, #來源單號
       xmee009 LIKE xmee_t.xmee009, #收款條件
       xmee010 LIKE xmee_t.xmee010, #交易條件
       xmee011 LIKE xmee_t.xmee011, #稅別
       xmee012 LIKE xmee_t.xmee012, #稅率
       xmee013 LIKE xmee_t.xmee013, #單價含稅否
       xmee015 LIKE xmee_t.xmee015, #幣別
       xmee016 LIKE xmee_t.xmee016, #匯率
       xmee017 LIKE xmee_t.xmee017, #取價方式
       xmee018 LIKE xmee_t.xmee018, #收款優惠條件
       xmee019 LIKE xmee_t.xmee019, #納入APS計算
       xmee020 LIKE xmee_t.xmee020, #運送方式
       xmee021 LIKE xmee_t.xmee021, #帳款客戶
       xmee022 LIKE xmee_t.xmee022, #收貨客戶
       xmee023 LIKE xmee_t.xmee023, #銷售通路
       xmee024 LIKE xmee_t.xmee024, #銷售分類二
       xmee025 LIKE xmee_t.xmee025, #出貨地址
       xmee026 LIKE xmee_t.xmee026, #帳款地址
       xmee027 LIKE xmee_t.xmee027, #客戶連絡人
       xmee028 LIKE xmee_t.xmee028, #一次性交易對象識別碼
       xmee029 LIKE xmee_t.xmee029, #出貨部門
       xmee030 LIKE xmee_t.xmee030, #多角貿易已拋轉
       xmee031 LIKE xmee_t.xmee031, #多角來源單號
       xmee032 LIKE xmee_t.xmee032, #留置原因
       xmee033 LIKE xmee_t.xmee033, #客戶訂購單號
       xmee034 LIKE xmee_t.xmee034, #最終客戶
       xmee035 LIKE xmee_t.xmee035, #發票類型
       xmee036 LIKE xmee_t.xmee036, #送貨供應商
       xmee037 LIKE xmee_t.xmee037, #起運點
       xmee038 LIKE xmee_t.xmee038, #目的地
       xmee039 LIKE xmee_t.xmee039, #預收款發票開立方式
       xmee041 LIKE xmee_t.xmee041, #訂單總未稅金額
       xmee042 LIKE xmee_t.xmee042, #訂單總含稅金額
       xmee043 LIKE xmee_t.xmee043, #訂單總稅額
       xmee044 LIKE xmee_t.xmee044, #嘜頭編號
       xmee045 LIKE xmee_t.xmee045, #物流結案
       xmee046 LIKE xmee_t.xmee046, #帳流結案
       xmee047 LIKE xmee_t.xmee047, #金流結案
       xmee048 LIKE xmee_t.xmee048, #內外銷
       xmee049 LIKE xmee_t.xmee049, #匯率計算基準
       xmee050 LIKE xmee_t.xmee050, #多角流程編號
       xmee051 LIKE xmee_t.xmee051, #多角最終站
       xmee071 LIKE xmee_t.xmee071, #備註
       xmee900 LIKE xmee_t.xmee900, #變更序
       xmee901 LIKE xmee_t.xmee901, #變更類型
       xmee902 LIKE xmee_t.xmee902, #變更日期
       xmee903 LIKE xmee_t.xmee903, #變更理由
       xmee904 LIKE xmee_t.xmee904, #變更備註
       xmeeownid LIKE xmee_t.xmeeownid, #資料所有者
       xmeeowndp LIKE xmee_t.xmeeowndp, #資料所屬部門
       xmeecrtid LIKE xmee_t.xmeecrtid, #資料建立者
       xmeecrtdp LIKE xmee_t.xmeecrtdp, #資料建立部門
       xmeecrtdt LIKE xmee_t.xmeecrtdt, #資料創建日
       xmeemodid LIKE xmee_t.xmeemodid, #資料修改者
       xmeemoddt LIKE xmee_t.xmeemoddt, #最近修改日
       xmeecnfid LIKE xmee_t.xmeecnfid, #資料確認者
       xmeecnfdt LIKE xmee_t.xmeecnfdt, #資料確認日
       xmeestus LIKE xmee_t.xmeestus, #狀態碼
       xmeeacti LIKE xmee_t.xmeeacti, #訂購單結案否
       xmee200 LIKE xmee_t.xmee200, #調貨經銷商編號
       xmee201 LIKE xmee_t.xmee201, #代送商編號
       xmee202 LIKE xmee_t.xmee202, #銷售辦事處
       xmee203 LIKE xmee_t.xmee203, #發票客戶
       xmee204 LIKE xmee_t.xmee204, #促銷方案編號
       xmee205 LIKE xmee_t.xmee205, #整單折扣
       xmee206 LIKE xmee_t.xmee206, #送貨站點編號
       xmee207 LIKE xmee_t.xmee207, #運輸路線編號
       xmee208 LIKE xmee_t.xmee208, #地區編號
       xmee209 LIKE xmee_t.xmee209, #縣市編號
       xmee210 LIKE xmee_t.xmee210, #省區編號
       xmee211 LIKE xmee_t.xmee211, #區域編號
       xmeeunit LIKE xmee_t.xmeeunit  #應用組織
                 END RECORD      
#161109-00085#47-e mod
#161109-00085#47-s mod
#DEFINE l_xmeg          RECORD LIKE xmeg_t.*      #單身明細檔   #161109-00085#47-s mark
DEFINE l_xmeg          RECORD  #訂單變更單身明細檔
       xmegent LIKE xmeg_t.xmegent, #企業編號
       xmegsite LIKE xmeg_t.xmegsite, #營運據點
       xmegdocno LIKE xmeg_t.xmegdocno, #採購單號
       xmegseq LIKE xmeg_t.xmegseq, #項次
       xmeg001 LIKE xmeg_t.xmeg001, #料件編號
       xmeg002 LIKE xmeg_t.xmeg002, #產品特徵
       xmeg003 LIKE xmeg_t.xmeg003, #包裝容器
       xmeg004 LIKE xmeg_t.xmeg004, #作業編號
       xmeg005 LIKE xmeg_t.xmeg005, #製程式
       xmeg006 LIKE xmeg_t.xmeg006, #銷售單位
       xmeg007 LIKE xmeg_t.xmeg007, #銷售數量
       xmeg008 LIKE xmeg_t.xmeg008, #參考單位
       xmeg009 LIKE xmeg_t.xmeg009, #參考數量
       xmeg010 LIKE xmeg_t.xmeg010, #計價單位
       xmeg011 LIKE xmeg_t.xmeg011, #計價數量
       xmeg012 LIKE xmeg_t.xmeg012, #約定交貨日
       xmeg013 LIKE xmeg_t.xmeg013, #預定簽收日
       xmeg015 LIKE xmeg_t.xmeg015, #單價
       xmeg016 LIKE xmeg_t.xmeg016, #稅別
       xmeg017 LIKE xmeg_t.xmeg017, #稅率
       xmeg019 LIKE xmeg_t.xmeg019, #子件特性
       xmeg020 LIKE xmeg_t.xmeg020, #急料
       xmeg021 LIKE xmeg_t.xmeg021, #保稅
       xmeg022 LIKE xmeg_t.xmeg022, #部分交貨
       xmegunit LIKE xmeg_t.xmegunit, #出貨據點
       xmegorga LIKE xmeg_t.xmegorga, #收款據點
       xmeg023 LIKE xmeg_t.xmeg023, #收貨客戶
       xmeg024 LIKE xmeg_t.xmeg024, #多交期
       xmeg025 LIKE xmeg_t.xmeg025, #收貨地址編號
       xmeg026 LIKE xmeg_t.xmeg026, #帳款地址編號
       xmeg027 LIKE xmeg_t.xmeg027, #客戶料號
       xmeg028 LIKE xmeg_t.xmeg028, #限定庫位
       xmeg029 LIKE xmeg_t.xmeg029, #限定儲位
       xmeg030 LIKE xmeg_t.xmeg030, #限定批號
       xmeg031 LIKE xmeg_t.xmeg031, #運輸方式
       xmeg032 LIKE xmeg_t.xmeg032, #取貨模式
       xmeg033 LIKE xmeg_t.xmeg033, #備品率
       xmeg034 LIKE xmeg_t.xmeg034, #可超交率
       xmeg035 LIKE xmeg_t.xmeg035, #價格核決
       xmeg036 LIKE xmeg_t.xmeg036, #專案編號
       xmeg037 LIKE xmeg_t.xmeg037, #WBS編號
       xmeg038 LIKE xmeg_t.xmeg038, #活動編號
       xmeg039 LIKE xmeg_t.xmeg039, #費用原因
       xmeg040 LIKE xmeg_t.xmeg040, #取價來源
       xmeg041 LIKE xmeg_t.xmeg041, #價格參考單號
       xmeg042 LIKE xmeg_t.xmeg042, #價格參考項次
       xmeg043 LIKE xmeg_t.xmeg043, #取出價格
       xmeg044 LIKE xmeg_t.xmeg044, #價差比
       xmeg045 LIKE xmeg_t.xmeg045, #狀態碼
       xmeg046 LIKE xmeg_t.xmeg046, #未稅金額
       xmeg047 LIKE xmeg_t.xmeg047, #含稅金額
       xmeg048 LIKE xmeg_t.xmeg048, #稅額
       xmeg049 LIKE xmeg_t.xmeg049, #理由碼
       xmeg050 LIKE xmeg_t.xmeg050, #備註
       xmeg051 LIKE xmeg_t.xmeg051, #客戶訂單項次
       xmeg052 LIKE xmeg_t.xmeg052, #檢驗否
       xmeg053 LIKE xmeg_t.xmeg053, #結案理由碼
       xmeg900 LIKE xmeg_t.xmeg900, #變更序
       xmeg901 LIKE xmeg_t.xmeg901, #變更類型
       xmeg902 LIKE xmeg_t.xmeg902, #變更理由
       xmeg903 LIKE xmeg_t.xmeg903, #變更備註
       xmeg062 LIKE xmeg_t.xmeg062  #170321-00086#1 add
      ,xmeg057 LIKE xmeg_t.xmeg057  #庫存管理特徵   #170824-00002#1 add
      #170105-00050#9 --s add
      ,xmeg055 LIKE xmeg_t.xmeg055
      ,xmeg056 LIKE xmeg_t.xmeg056
      #170105-00050#9 --e add
      ,xmegud021  LIKE xmeg_t.xmegud021 #add by pane 191128
                 END RECORD
#161109-00085#47-e mod
#161109-00085#47-s mod
#DEFINE l_xmef          RECORD LIKE xmef_t.*      #多期預收款   #161109-00085#47-s mark
DEFINE l_xmef          RECORD  #訂單變更多帳期預收款檔
       xmefent LIKE xmef_t.xmefent, #企業編號
       xmefsite LIKE xmef_t.xmefsite, #營運據點
       xmefdocno LIKE xmef_t.xmefdocno, #採購單號
       xmef001 LIKE xmef_t.xmef001, #期別
       xmef002 LIKE xmef_t.xmef002, #收款條件
       xmef003 LIKE xmef_t.xmef003, #預計應收款日
       xmef004 LIKE xmef_t.xmef004, #預計票據到期日
       xmef005 LIKE xmef_t.xmef005, #未稅金額                
       xmef006 LIKE xmef_t.xmef006, #含稅金額
       xmef007 LIKE xmef_t.xmef007, #應收帳款單號
       xmef008 LIKE xmef_t.xmef008, #主帳套已收未稅金額       
       xmef009 LIKE xmef_t.xmef009, #主帳套已收含稅金額
       xmef010 LIKE xmef_t.xmef010, #帳套二已收未稅金額
       xmef011 LIKE xmef_t.xmef011, #帳套二已收含稅金額
       xmef014 LIKE xmef_t.xmef014, #帳套三已收未稅金額
       xmef015 LIKE xmef_t.xmef015, #帳套三已收含稅金額
       xmef900 LIKE xmef_t.xmef900, #變更序
       xmef901 LIKE xmef_t.xmef901, #變更類型
       xmef902 LIKE xmef_t.xmef902, #變更理由
       xmef903 LIKE xmef_t.xmef903, #變更備註
       xmef016 LIKE xmef_t.xmef016, #帳款類型
       xmef017 LIKE xmef_t.xmef017  #帳款影響出貨模式
               END RECORD
#161109-00085#47-e mod
#161109-00085#47-s mod
#DEFINE l_xmeh          RECORD LIKE xmeh_t.*      #交期明細檔
DEFINE l_xmeh RECORD  #訂單變更交期明細檔
       xmehent LIKE xmeh_t.xmehent, #企業編號
       xmehsite LIKE xmeh_t.xmehsite, #營運據點
       xmehdocno LIKE xmeh_t.xmehdocno, #訂單單號
       xmehseq LIKE xmeh_t.xmehseq, #訂單項次
       xmehseq1 LIKE xmeh_t.xmehseq1, #項序
       xmehseq2 LIKE xmeh_t.xmehseq2, #分批序
       xmeh001 LIKE xmeh_t.xmeh001, #料件編號
       xmeh002 LIKE xmeh_t.xmeh002, #產品特徵
       xmeh003 LIKE xmeh_t.xmeh003, #子件特性
       xmeh004 LIKE xmeh_t.xmeh004, #銷售單位
       xmeh005 LIKE xmeh_t.xmeh005, #訂購總數量
       xmeh006 LIKE xmeh_t.xmeh006, #分批訂購數量
       xmeh007 LIKE xmeh_t.xmeh007, #折合主件數量
       xmeh008 LIKE xmeh_t.xmeh008, #QPA
       xmeh009 LIKE xmeh_t.xmeh009, #交期類型
       xmeh010 LIKE xmeh_t.xmeh010, #出貨時段
       xmeh011 LIKE xmeh_t.xmeh011, #約定交貨日期
       xmeh012 LIKE xmeh_t.xmeh012, #預計簽收日期
       xmeh013 LIKE xmeh_t.xmeh013, #MRP交期凍結
       xmeh014 LIKE xmeh_t.xmeh014, #已出貨量
       xmeh015 LIKE xmeh_t.xmeh015, #已銷退量
       xmeh016 LIKE xmeh_t.xmeh016, #銷退換貨數量
       xmeh017 LIKE xmeh_t.xmeh017, #出貨狀態
       xmeh018 LIKE xmeh_t.xmeh018, #參考價格
       xmeh019 LIKE xmeh_t.xmeh019, #稅別
       xmeh020 LIKE xmeh_t.xmeh020, #稅率
       xmeh021 LIKE xmeh_t.xmeh021, #電子訂購單號
       xmeh022 LIKE xmeh_t.xmeh022, #最近修改人員
       xmeh023 LIKE xmeh_t.xmeh023, #最近修改時間
       xmeh024 LIKE xmeh_t.xmeh024, #分批參考單位
       xmeh025 LIKE xmeh_t.xmeh025, #分批參考數量
       xmeh026 LIKE xmeh_t.xmeh026, #分批計價單位
       xmeh027 LIKE xmeh_t.xmeh027, #分批計價數量
       xmeh028 LIKE xmeh_t.xmeh028, #分批未稅金額
       xmeh029 LIKE xmeh_t.xmeh029, #分批含稅金額
       xmeh030 LIKE xmeh_t.xmeh030, #分批稅額
       xmeh031 LIKE xmeh_t.xmeh031, #已轉出通數量
       xmeh900 LIKE xmeh_t.xmeh900, #變更序
       xmeh901 LIKE xmeh_t.xmeh901, #變更類型
       xmeh200 LIKE xmeh_t.xmeh200, #促銷方案
       xmeh201 LIKE xmeh_t.xmeh201, #分批包裝單位
       xmeh202 LIKE xmeh_t.xmeh202, #分批包裝數量
       xmeh203 LIKE xmeh_t.xmeh203, #標準價
       xmeh204 LIKE xmeh_t.xmeh204, #促銷價
       xmeh205 LIKE xmeh_t.xmeh205, #交易價
       xmeh206 LIKE xmeh_t.xmeh206, #折價金額
       xmehunit LIKE xmeh_t.xmehunit, #應用組織
       xmeh207 LIKE xmeh_t.xmeh207, #收貨網點
       xmeh208 LIKE xmeh_t.xmeh208, #送貨地址碼
       xmeh209 LIKE xmeh_t.xmeh209, #送貨站點
       xmeh210 LIKE xmeh_t.xmeh210, #送貨時段
       xmeh211 LIKE xmeh_t.xmeh211, #送貨客戶
       xmeh212 LIKE xmeh_t.xmeh212, #MRP凍結
       xmeh213 LIKE xmeh_t.xmeh213, #庫位/庫區
       xmeh214 LIKE xmeh_t.xmeh214, #儲位
       xmeh215 LIKE xmeh_t.xmeh215, #批號
       xmeh216 LIKE xmeh_t.xmeh216, #庫存鎖定等級
       xmeh217 LIKE xmeh_t.xmeh217, #庫存餘額
       xmeh218 LIKE xmeh_t.xmeh218, #銷售通路
       xmeh219 LIKE xmeh_t.xmeh219, #產品組編號
       xmeh220 LIKE xmeh_t.xmeh220, #銷售範圍編號
       xmeh221 LIKE xmeh_t.xmeh221, #備註
       xmeh222 LIKE xmeh_t.xmeh222, #辦事處
       xmeh223 LIKE xmeh_t.xmeh223, #業務人員
       xmeh224 LIKE xmeh_t.xmeh224, #業務部門
       xmeh225 LIKE xmeh_t.xmeh225, #主合約編號
       xmeh226 LIKE xmeh_t.xmeh226, #經營方式
       xmeh227 LIKE xmeh_t.xmeh227, #結算類型
       xmeh228 LIKE xmeh_t.xmeh228, #結算方式
       xmehorga LIKE xmeh_t.xmehorga, #帳務組織
       xmeh229 LIKE xmeh_t.xmeh229  #交易類型
END RECORD
#161109-00085#47-e mod
#161109-00085#47-s mod
#DEFINE l_xmej          RECORD LIKE xmej_t.*      #多交期匯總檔
DEFINE l_xmej          RECORD  #訂單變更多交期匯總檔
       xmejent LIKE xmej_t.xmejent, #企業編號
       xmejsite LIKE xmej_t.xmejsite, #營運據點
       xmejdocno LIKE xmej_t.xmejdocno, #訂單單號
       xmejseq LIKE xmej_t.xmejseq, #訂單項次
       xmejseq2 LIKE xmej_t.xmejseq2, #分批序
       xmej002 LIKE xmej_t.xmej002, #分批數量
       xmej003 LIKE xmej_t.xmej003, #約定交貨日期
       xmej004 LIKE xmej_t.xmej004, #預計簽收日
       xmej005 LIKE xmej_t.xmej005, #出貨時段
       xmej006 LIKE xmej_t.xmej006, #MRP凍結否
       xmej900 LIKE xmej_t.xmej900, #變更序
       xmej901 LIKE xmej_t.xmej901, #變更類型
       xmej200 LIKE xmej_t.xmej200, #庫區/庫位
       xmej201 LIKE xmej_t.xmej201, #儲位
       xmej202 LIKE xmej_t.xmej202, #批號
       xmejunit LIKE xmej_t.xmejunit, #應用組織
       xmej007 LIKE xmej_t.xmej007  #交期類型
               END RECORD

DEFINE l_i       LIKE type_t.num5    
#161031-00049#1-s-add
DEFINE l_xmdd    RECORD
       xmdddocno     LIKE xmdd_t.xmdddocno,
       xmddseq       LIKE xmdd_t.xmddseq,
       xmddseq1      LIKE xmdd_t.xmddseq1,
       xmddseq2      LIKE xmdd_t.xmddseq2,
       xmdd014       LIKE xmdd_t.xmdd014,
       xmdd015       LIKE xmdd_t.xmdd015,
       xmdd016       LIKE xmdd_t.xmdd016,
       #170411-00082#1 add---begin---
       xmdd001       LIKE xmdd_t.xmdd001,
       xmdd002       LIKE xmdd_t.xmdd002,
       xmdd004       LIKE xmdd_t.xmdd004,
       xmdd006       LIKE xmdd_t.xmdd006,
       #170411-00082#1 add---end---
       xmdd031       LIKE xmdd_t.xmdd031
                END RECORD
       
DEFINE l_xmek002       LIKE xmek_t.xmek002
DEFINE l_xmdc046       LIKE xmdc_t.xmdc046
DEFINE l_xmdc047       LIKE xmdc_t.xmdc047
DEFINE l_xmdc048       LIKE xmdc_t.xmdc048
DEFINE l_hold          LIKE type_t.num5
DEFINE l_xmda032       LIKE xmda_t.xmda032
DEFINE l_xmda015       LIKE xmda_t.xmda015  #add by lixiang 2015/11/17
DEFINE l_xmda048       LIKE xmda_t.xmda048  #add by lixiang 2015/11/17
DEFINE l_sql           STRING               #160421-00006#1 add 
DEFINE l_imaf058       LIKE imaf_t.imaf058  #170426-00048#2 add
DEFINE l_forupd_sql    STRING               #170427-00007#2 add
#170329-00046#11 --s add
DEFINE l_xmee041         LIKE xmee_t.xmee041
DEFINE l_xmee042         LIKE xmee_t.xmee042
DEFINE l_xmee043         LIKE xmee_t.xmee043
DEFINE l_xrcd113         LIKE xrcd_t.xrcd113
DEFINE l_xrcd114         LIKE xrcd_t.xrcd114
DEFINE l_xrcd115         LIKE xrcd_t.xrcd115
DEFINE l_success         LIKE type_t.num5
DEFINE l_xrcd008_0       LIKE xrcd_t.xrcd008
DEFINE l_xrcd008         LIKE xrcd_t.xrcd008
DEFINE l_xmdd028         LIKE xmdd_t.xmdd028  
DEFINE l_xmdd029         LIKE xmdd_t.xmdd029  
DEFINE l_xmdd030         LIKE xmdd_t.xmdd030
DEFINE l_xmeh028         LIKE xmeh_t.xmeh028
DEFINE l_xmeh029         LIKE xmeh_t.xmeh029
DEFINE l_xmeh030         LIKE xmeh_t.xmeh030
DEFINE l_xmeedocno_900   LIKE type_t.chr100 
DEFINE l_xrcd RECORD  #交易稅明細檔
       xrcdent LIKE xrcd_t.xrcdent, #企業編號
       xrcdcomp LIKE xrcd_t.xrcdcomp, #法人
       xrcdld LIKE xrcd_t.xrcdld, #帳套
       xrcdsite LIKE xrcd_t.xrcdsite, #營運據點
       xrcddocno LIKE xrcd_t.xrcddocno, #交易單據編號
       xrcdseq LIKE xrcd_t.xrcdseq, #項次
       xrcdseq2 LIKE xrcd_t.xrcdseq2, #項次2
       xrcdorga LIKE xrcd_t.xrcdorga, #帳務來源SITE
       xrcd001 LIKE xrcd_t.xrcd001, #來源作業別
       xrcd002 LIKE xrcd_t.xrcd002, #稅別
       xrcd003 LIKE xrcd_t.xrcd003, #稅率
       xrcd004 LIKE xrcd_t.xrcd004, #固定課稅金額
       xrcd005 LIKE xrcd_t.xrcd005, #課稅數量
       xrcd006 LIKE xrcd_t.xrcd006, #含稅否
       xrcd007 LIKE xrcd_t.xrcd007, #計算序
       xrcd008 LIKE xrcd_t.xrcd008, #no use
       xrcd009 LIKE xrcd_t.xrcd009, #稅額會計科目
       xrcd010 LIKE xrcd_t.xrcd010, #no use
       xrcd100 LIKE xrcd_t.xrcd100, #幣別
       xrcd101 LIKE xrcd_t.xrcd101, #匯率
       xrcd102 LIKE xrcd_t.xrcd102, #原幣計算基準
       xrcd103 LIKE xrcd_t.xrcd103, #原幣未稅金額
       xrcd104 LIKE xrcd_t.xrcd104, #原幣稅額
       xrcd105 LIKE xrcd_t.xrcd105, #原幣含稅金額
       xrcd106 LIKE xrcd_t.xrcd106, #原幣留抵稅額
       xrcd112 LIKE xrcd_t.xrcd112, #本幣計算基準
       xrcd113 LIKE xrcd_t.xrcd113, #本幣未稅金額
       xrcd114 LIKE xrcd_t.xrcd114, #本幣稅額
       xrcd115 LIKE xrcd_t.xrcd115, #本幣含稅金額
       xrcd116 LIKE xrcd_t.xrcd116, #本幣留抵稅額
       xrcd117 LIKE xrcd_t.xrcd117, #已開發票原幣未稅金額
       xrcd118 LIKE xrcd_t.xrcd118, #已開發票原幣稅額
       xrcd121 LIKE xrcd_t.xrcd121, #本位幣二匯率
       xrcd124 LIKE xrcd_t.xrcd124, #本位幣二稅額
       xrcd131 LIKE xrcd_t.xrcd131, #本位幣三匯率
       xrcd134 LIKE xrcd_t.xrcd134, #本位幣三稅額
       xrcd123 LIKE xrcd_t.xrcd123, #本位幣二未稅金額
       xrcd125 LIKE xrcd_t.xrcd125, #本位幣二含稅金額
       xrcd133 LIKE xrcd_t.xrcd133, #本位幣三未稅金額
       xrcd135 LIKE xrcd_t.xrcd135, #本位幣三含稅金額
       xrcdud001 LIKE xrcd_t.xrcdud001, #自定義欄位(文字)001
       xrcdud002 LIKE xrcd_t.xrcdud002, #自定義欄位(文字)002
       xrcdud003 LIKE xrcd_t.xrcdud003, #自定義欄位(文字)003
       xrcdud004 LIKE xrcd_t.xrcdud004, #自定義欄位(文字)004
       xrcdud005 LIKE xrcd_t.xrcdud005, #自定義欄位(文字)005
       xrcdud006 LIKE xrcd_t.xrcdud006, #自定義欄位(文字)006
       xrcdud007 LIKE xrcd_t.xrcdud007, #自定義欄位(文字)007
       xrcdud008 LIKE xrcd_t.xrcdud008, #自定義欄位(文字)008
       xrcdud009 LIKE xrcd_t.xrcdud009, #自定義欄位(文字)009
       xrcdud010 LIKE xrcd_t.xrcdud010, #自定義欄位(文字)010
       xrcdud011 LIKE xrcd_t.xrcdud011, #自定義欄位(數字)011
       xrcdud012 LIKE xrcd_t.xrcdud012, #自定義欄位(數字)012
       xrcdud013 LIKE xrcd_t.xrcdud013, #自定義欄位(數字)013
       xrcdud014 LIKE xrcd_t.xrcdud014, #自定義欄位(數字)014
       xrcdud015 LIKE xrcd_t.xrcdud015, #自定義欄位(數字)015
       xrcdud016 LIKE xrcd_t.xrcdud016, #自定義欄位(數字)016
       xrcdud017 LIKE xrcd_t.xrcdud017, #自定義欄位(數字)017
       xrcdud018 LIKE xrcd_t.xrcdud018, #自定義欄位(數字)018
       xrcdud019 LIKE xrcd_t.xrcdud019, #自定義欄位(數字)019
       xrcdud020 LIKE xrcd_t.xrcdud020, #自定義欄位(數字)020
       xrcdud021 LIKE xrcd_t.xrcdud021, #自定義欄位(日期時間)021
       xrcdud022 LIKE xrcd_t.xrcdud022, #自定義欄位(日期時間)022
       xrcdud023 LIKE xrcd_t.xrcdud023, #自定義欄位(日期時間)023
       xrcdud024 LIKE xrcd_t.xrcdud024, #自定義欄位(日期時間)024
       xrcdud025 LIKE xrcd_t.xrcdud025, #自定義欄位(日期時間)025
       xrcdud026 LIKE xrcd_t.xrcdud026, #自定義欄位(日期時間)026
       xrcdud027 LIKE xrcd_t.xrcdud027, #自定義欄位(日期時間)027
       xrcdud028 LIKE xrcd_t.xrcdud028, #自定義欄位(日期時間)028
       xrcdud029 LIKE xrcd_t.xrcdud029, #自定義欄位(日期時間)029
       xrcdud030 LIKE xrcd_t.xrcdud030, #自定義欄位(日期時間)030
       xrcd011 LIKE xrcd_t.xrcd011, #發票編號
       xrcd012 LIKE xrcd_t.xrcd012, #發票號碼
       xrcd013 LIKE xrcd_t.xrcd013  #稅別項次
END RECORD
#170329-00046#11 --e add
#170329-00046#22 --s add
DEFINE  l_xmehseq1   LIKE  xmeh_t.xmehseq1
DEFINE  l_xmehseq2   LIKE  xmeh_t.xmehseq2
#170329-00046#22 --e add
DEFINE  l_xmdc055    LIKE  xmdc_t.xmdc055 #170825-00053#1 add
DEFINE  l_xmdc056    LIKE  xmdc_t.xmdc056 #170825-00053#1 add
DEFINE  l_xmdc007    LIKE  xmdc_t.xmdc007 #170825-00053#1 add
DEFINE  l_xmda031    LIKE  xmda_t.xmda031 #170105-00050#9 add
DEFINE l_xmddud001   LIKE xmdd_t.xmddud001,
       l_xmddud011   LIKE xmdd_t.xmddud011,
       l_xmddud012   LIKE xmdd_t.xmddud012,
       l_xmddud013   LIKE xmdd_t.xmddud013     #fcx-180411 add
DEFINE l_xmdc028     LIKE xmdc_t.xmdc028,       #fcx-180411 add
       l_xmeg028     LIKE xmeg_t.xmeg028,       #fcx-180411 add
       l_xmdd032     LIKE xmdd_t.xmdd032     
DEFINE l_xmeh006     LIKE xmeh_t.xmeh006,
       l_xmdd006     LIKE xmdd_t.xmdd006
DEFINE l_due         LIKE xmdd_t.xmdd006, #C20190505-07783 ADD
       l_cnt2        LIKE type_t.num10,
       l_xmdd011     LIKE xmdd_t.xmdd011,
       l_xmdd009     LIKE xmdd_t.xmdd009

   LET r_success = TRUE
   #先將訂單的回傳值寫入TEMP TABLE  
   #已出貨量、已銷退量、銷退換貨量、已轉出通量
   DELETE FROM axmt510_tmp01_1   #160727-00019#30   16/08/08 By 08734 临时表长度超过15码的减少到15码以下 axmt510_xmdd_tmp ——> axmt510_tmp01
   INSERT INTO axmt510_tmp01_1(xmdddocno,xmddseq,xmddseq1,xmddseq2,  #160727-00019#30   16/08/08 By 08734 临时表长度超过15码的减少到15码以下 axmt510_xmdd_tmp ——> axmt510_tmp01
                                  xmdd014,xmdd015, xmdd016,xmdd031)
        SELECT xmdddocno,xmddseq,xmddseq1,xmddseq2,
               xmdd014,xmdd015,xmdd016,xmdd031
          FROM xmdd_t
         WHERE xmddent = g_enterprise
           AND xmdddocno = p_xmdadocno
  #fcx-180411---str---
   #先將訂單的回傳值寫入TEMP TABLE  
   #xmddud001,xmddud011,xmddud012,xmddud013,xmdc028
   DELETE FROM axmt510_tmp03_1   #160727-00019#30   16/08/08 By 08734 临时表长度超过15码的减少到15码以下 axmt510_xmdd_tmp ——> axmt510_tmp01
   INSERT INTO axmt510_tmp03_1(xmdddocno,xmddseq,xmddseq1,xmddseq2,  #160727-00019#30   16/08/08 By 08734 临时表长度超过15码的减少到15码以下 axmt510_xmdd_tmp ——> axmt510_tmp01
                                  xmddud001,xmddud011, xmddud012,xmddud013,xmdc028,xmeg028,xmdd032,xmeh006,xmdd006,xmdd011,xmdd009)
        SELECT DISTINCT xmdddocno,xmddseq,xmddseq1,xmddseq2,
               xmddud001,xmddud011, xmddud012,xmddud013,xmdc028,xmeg028,xmdd032,xmeh006,xmdd006,xmdd011,xmdd009   #C20190505-07783 ADD xmdd011,xmdd009
          FROM xmdd_t
          LEFT JOIN xmeh_t ON xmehent = xmddent AND xmehseq = xmddseq AND xmehseq1 = xmddseq1 AND xmehseq2 = xmddseq2 AND xmehdocno = p_xmeedocno AND xmeh900 = p_xmee900
          ,xmdc_t 
          LEFT JOIN xmeg_t ON xmdcent = xmegent  AND xmdcseq = xmegseq AND xmegdocno = p_xmeedocno AND xmeg900 = p_xmee900
         WHERE xmddent = xmdcent
           AND xmdddocno = xmdcdocno
           AND xmddseq = xmdcseq
           AND xmddent = g_enterprise
           AND xmdddocno = p_xmdadocno
   #先更新交期匯總檔xmej_t，之後更新單身時，可一併更新交期明檔
   INITIALIZE l_xmej.* TO NULL
   DECLARE sel_xmej_cs1 CURSOR FOR
    SELECT xmejseq,xmejseq2,xmej901,
           xmej002,xmej003,xmej004,xmej005,xmej006,
           xmej007
      FROM xmej_t
     WHERE xmejent = g_enterprise
       AND xmejdocno = p_xmeedocno 
       AND xmej900 = p_xmee900
   
   #刪除交期明細
   DELETE FROM xmdf_t
    WHERE xmdfent = g_enterprise
      AND xmdfdocno = p_xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "DELETE xmdf_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF

   FOREACH sel_xmej_cs1 INTO l_xmej.xmejseq,l_xmej.xmejseq2,l_xmej.xmej901,
                             l_xmej.xmej002,l_xmej.xmej003,l_xmej.xmej004,l_xmej.xmej005,l_xmej.xmej006,
                             l_xmej.xmej007
   
      INSERT INTO xmdf_t (xmdfent,xmdfdocno,xmdfsite,xmdfseq,xmdfseq2,
                          xmdf002,xmdf003,xmdf004,xmdf005,xmdf006,xmdf007)
                  VALUES (g_enterprise,p_xmdadocno,p_xmdasite,l_xmej.xmejseq,l_xmej.xmejseq2,
                          l_xmej.xmej002,l_xmej.xmej003,l_xmej.xmej004,l_xmej.xmej005,l_xmej.xmej006,
                          l_xmej.xmej007)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT xmdf_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH
   #更新單身xmeg_t
   INITIALIZE l_xmeg.* TO NULL
   DECLARE sel_xmeg_cs1 CURSOR FOR
    SELECT xmegseq,xmegunit,xmegorga,xmeg901, 
           xmeg027,xmeg001,xmeg019,xmeg002,xmeg006,
           xmeg007,xmeg008,xmeg009,xmeg024,xmeg012,
           xmeg013,xmeg045,xmeg016,xmeg017,xmeg010,
           xmeg011,xmeg015,xmeg046,xmeg047,xmeg048,
           xmeg023,xmeg020,xmeg021,xmeg022,xmeg052,
           xmeg049,xmeg053,xmeg050,xmeg028,xmeg029,
           xmeg030,xmeg025,xmeg026,xmeg031,xmeg032,
           xmeg033,xmeg034,xmeg003,xmeg036,xmeg037,
           xmeg038,xmeg039,xmeg035,xmeg040,xmeg041,
           xmeg042,xmeg043,xmeg044
          ,xmeg062  #170321-00086#1 add
          ,xmeg057  #170824-00002#1 add
          ,xmeg055,xmeg056 #170105-00050#9 add
          ,xmegud021    #add by pane 191128
      FROM xmeg_t
     WHERE xmegent = g_enterprise
       AND xmegdocno = p_xmeedocno 
       AND xmeg900 = p_xmee900
     ORDER BY xmegseq

   FOREACH sel_xmeg_cs1 INTO l_xmeg.xmegseq,l_xmeg.xmegunit,l_xmeg.xmegorga,l_xmeg.xmeg901, 
                             l_xmeg.xmeg027,l_xmeg.xmeg001,l_xmeg.xmeg019,l_xmeg.xmeg002,l_xmeg.xmeg006,
                             l_xmeg.xmeg007,l_xmeg.xmeg008,l_xmeg.xmeg009,l_xmeg.xmeg024,l_xmeg.xmeg012,
                             l_xmeg.xmeg013,l_xmeg.xmeg045,l_xmeg.xmeg016,l_xmeg.xmeg017,l_xmeg.xmeg010,
                             l_xmeg.xmeg011,l_xmeg.xmeg015,l_xmeg.xmeg046,l_xmeg.xmeg047,l_xmeg.xmeg048,
                             l_xmeg.xmeg023,l_xmeg.xmeg020,l_xmeg.xmeg021,l_xmeg.xmeg022,l_xmeg.xmeg052,
                             l_xmeg.xmeg049,l_xmeg.xmeg053,l_xmeg.xmeg050,l_xmeg.xmeg028,l_xmeg.xmeg029,
                             l_xmeg.xmeg030,l_xmeg.xmeg025,l_xmeg.xmeg026,l_xmeg.xmeg031,l_xmeg.xmeg032,
                             l_xmeg.xmeg033,l_xmeg.xmeg034,l_xmeg.xmeg003,l_xmeg.xmeg036,l_xmeg.xmeg037,
                             l_xmeg.xmeg038,l_xmeg.xmeg039,l_xmeg.xmeg035,l_xmeg.xmeg040,l_xmeg.xmeg041,
                             l_xmeg.xmeg042,l_xmeg.xmeg043,l_xmeg.xmeg044
                            ,l_xmeg.xmeg062  #170321-00086#1 add
                            ,l_xmeg.xmeg057  #170824-00002#1 add  
                            ,l_xmeg.xmeg055,l_xmeg.xmeg056 #170105-00050#9 add
                            ,l_xmeg.xmegud021    #add by pane 191128
       #單身修改
       IF l_xmeg.xmeg901 = '2' THEN

          UPDATE xmdc_t 
             SET (xmdcunit,xmdcorga, 
                  xmdc027,xmdc001,xmdc019,xmdc002,xmdc006,
                  xmdc007,xmdc008,xmdc009,xmdc024,xmdc012,
                  xmdc013,xmdc016,xmdc017,xmdc010,
                  xmdc011,xmdc015,xmdc046,xmdc047,xmdc048,
                  xmdc023,xmdc020,xmdc021,xmdc022,xmdc052,
                  xmdc049,xmdc050,xmdc028,xmdc029,
                  xmdc030,xmdc025,xmdc026,xmdc031,xmdc032,
                  xmdc033,xmdc034,xmdc003,xmdc036,xmdc037,
                  xmdc038,xmdc039,xmdc035,xmdc040,xmdc041,
                  xmdc042,xmdc043,xmdc044
                 ,xmdc062  #170321-00086#1 add
                 ,xmdc057  #170824-00002#1 add
                 ,xmdc055,xmdc056  #170105-00050#9 add
                 ,xmdcud021    #add by pane 191128
                  )
#               = (l_xmeg.xmegunit,l_xmeg.xmegorga,   C20190226-07783 MARK 出货据点/组织，得取当站据点，不能取SAMOA的
               = (p_xmdasite,p_xmdasite,             #C20190226-07783 ADD 出货据点/组织，得取当站据点，不能取SAMOA的
                  l_xmeg.xmeg027,l_xmeg.xmeg001,l_xmeg.xmeg019,l_xmeg.xmeg002,l_xmeg.xmeg006,
                  l_xmeg.xmeg007,l_xmeg.xmeg008,l_xmeg.xmeg009,l_xmeg.xmeg024,l_xmeg.xmeg012,
                  l_xmeg.xmeg013,l_xmeg.xmeg016,l_xmeg.xmeg017,l_xmeg.xmeg010,
                  l_xmeg.xmeg011,l_xmeg.xmeg015,l_xmeg.xmeg046,l_xmeg.xmeg047,l_xmeg.xmeg048,
                  l_xmeg.xmeg023,l_xmeg.xmeg020,l_xmeg.xmeg021,l_xmeg.xmeg022,l_xmeg.xmeg052,
                  l_xmeg.xmeg049,l_xmeg.xmeg050,l_xmeg.xmeg028,l_xmeg.xmeg029,
                  l_xmeg.xmeg030,l_xmeg.xmeg025,l_xmeg.xmeg026,l_xmeg.xmeg031,l_xmeg.xmeg032,
                  l_xmeg.xmeg033,l_xmeg.xmeg034,l_xmeg.xmeg003,l_xmeg.xmeg036,l_xmeg.xmeg037,
                  l_xmeg.xmeg038,l_xmeg.xmeg039,l_xmeg.xmeg035,l_xmeg.xmeg040,l_xmeg.xmeg041,
                  l_xmeg.xmeg042,l_xmeg.xmeg043,l_xmeg.xmeg044
                 ,l_xmeg.xmeg062   #170321-00086#1 add
                 ,l_xmeg.xmeg057   #170824-00002#1 add
                 ,l_xmeg.xmeg055,l_xmeg.xmeg056 #170105-00050#9 add
                 ,l_xmeg.xmegud021   #add by pane 191128
                  )
           WHERE xmdcent = g_enterprise
             AND xmdcdocno = p_xmdadocno
             AND xmdcseq = l_xmeg.xmegseq     
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = "UPDATE xmdc_t"
             LET g_errparam.popup = TRUE
             CALL cl_err()
             LET r_success = FALSE
          END IF
          #170329-00046#11 --s add

          #變更單的金額回寫到訂單的xrcd(seq2=0)         
          UPDATE xrcd_t
             SET xrcd103 = l_xmeg.xmeg046,
                 xrcd104 = l_xmeg.xmeg048,
                 xrcd105 = l_xmeg.xmeg047
           WHERE xrcdent = g_enterprise
             AND xrcdld = ' '          
             AND xrcddocno = p_xmdadocno
             AND xrcdseq2 = 0
             AND xrcdseq = l_xmeg.xmegseq 
          IF SQLCA.sqlcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = "upd xrcd_t"
             LET g_errparam.popup = TRUE
             CALL cl_err()
         
             LET r_success = FALSE
             RETURN r_success
          END IF
          #170329-00046#11 --e add
       END IF
       
       #單身新增
       IF l_xmeg.xmeg901 ='3' THEN
          LET l_cnt = 0
          SELECT COUNT(*) INTO l_cnt
            FROM xmdc_t
           WHERE xmdcent = g_enterprise
             AND xmdcdocno = p_xmdadocno
             AND xmdcseq = l_xmeg.xmegseq
          IF l_cnt = 0 THEN
             INSERT INTO xmdc_t (xmdcent, xmdcdocno, xmdcsite,xmdcseq,
                                 xmdcunit,xmdcorga, 
                                 xmdc027,xmdc001,xmdc019,xmdc002,xmdc006,
                                 xmdc007,xmdc008,xmdc009,xmdc024,xmdc012,
                                 xmdc013,xmdc045,xmdc016,xmdc017,xmdc010,
                                 xmdc011,xmdc015,xmdc046,xmdc047,xmdc048,
                                 xmdc023,xmdc020,xmdc021,xmdc022,xmdc052,
                                 xmdc049,xmdc053,xmdc050,xmdc028,xmdc029,
                                 xmdc030,xmdc025,xmdc026,xmdc031,xmdc032,
                                 xmdc033,xmdc034,xmdc003,xmdc036,xmdc037,
                                 xmdc038,xmdc039,xmdc035,xmdc040,xmdc041,
                                 xmdc042,xmdc043,xmdc044
                                ,xmdc062  #170321-00086#1 add
                                ,xmdc057  #170824-00002#1 add
                                ,xmdc055,xmdc056 #170105-00050#9 add
                                ,xmdcud021   #add by pane 191128
                                 )
                         VALUES (g_enterprise, p_xmdadocno, p_xmdasite,l_xmeg.xmegseq,
                                 p_xmdasite,p_xmdasite,
                                 l_xmeg.xmeg027,l_xmeg.xmeg001,l_xmeg.xmeg019,l_xmeg.xmeg002,l_xmeg.xmeg006,
                                 l_xmeg.xmeg007,l_xmeg.xmeg008,l_xmeg.xmeg009,l_xmeg.xmeg024,l_xmeg.xmeg012,
                                 l_xmeg.xmeg013,l_xmeg.xmeg045,l_xmeg.xmeg016,l_xmeg.xmeg017,l_xmeg.xmeg010,
                                 l_xmeg.xmeg011,l_xmeg.xmeg015,l_xmeg.xmeg046,l_xmeg.xmeg047,l_xmeg.xmeg048,
                                 l_xmeg.xmeg023,l_xmeg.xmeg020,l_xmeg.xmeg021,l_xmeg.xmeg022,l_xmeg.xmeg052,
                                 l_xmeg.xmeg049,l_xmeg.xmeg053,l_xmeg.xmeg050,l_xmeg.xmeg028,l_xmeg.xmeg029,
                                 l_xmeg.xmeg030,l_xmeg.xmeg025,l_xmeg.xmeg026,l_xmeg.xmeg031,l_xmeg.xmeg032,
                                 l_xmeg.xmeg033,l_xmeg.xmeg034,l_xmeg.xmeg003,l_xmeg.xmeg036,l_xmeg.xmeg037,
                                 l_xmeg.xmeg038,l_xmeg.xmeg039,l_xmeg.xmeg035,l_xmeg.xmeg040,l_xmeg.xmeg041,
                                 l_xmeg.xmeg042,l_xmeg.xmeg043,l_xmeg.xmeg044
                                ,l_xmeg.xmeg062   #170321-00086#1 add
                                ,l_xmeg.xmeg057   #170824-00002#1 add
                                ,l_xmeg.xmeg055,l_xmeg.xmeg056 #170105-00050#9 add
                                ,l_xmeg.xmegud021   #add by pane 191128
                                 )
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = "INSERT xmdc_t"
                LET g_errparam.popup = TRUE
                CALL cl_err()
                LET r_success = FALSE
             END IF 

             #170329-00046#11 --s add
             #變更單項次更新時會新增xrcd，再寫進同樣一筆訂單的xrcd(seq2=0)
             SELECT xrcdent,xrcdcomp,xrcdld,xrcdsite,xrcddocno,
                    xrcdseq,xrcdseq2,xrcdorga,xrcd001,xrcd002,
                    xrcd003,xrcd004,xrcd005,xrcd006,xrcd007,
                    xrcd008,xrcd009,xrcd010,xrcd100,xrcd101,
                    xrcd102,xrcd103,xrcd104,xrcd105,xrcd106,
                    xrcd112,xrcd113,xrcd114,xrcd115,xrcd116,
                    xrcd117,xrcd118,xrcd121,xrcd124,xrcd131,
                    xrcd134,xrcd123,xrcd125,xrcd133,xrcd135,
                    xrcdud001,xrcdud002,xrcdud003,xrcdud004,xrcdud005,
                    xrcdud006,xrcdud007,xrcdud008,xrcdud009,xrcdud010,
                    xrcdud011,xrcdud012,xrcdud013,xrcdud014,xrcdud015,
                    xrcdud016,xrcdud017,xrcdud018,xrcdud019,xrcdud020,
                    xrcdud021,xrcdud022,xrcdud023,xrcdud024,xrcdud025,
                    xrcdud026,xrcdud027,xrcdud028,xrcdud029,xrcdud030,
                    xrcd011,xrcd012,xrcd013
               INTO l_xrcd.xrcdent,l_xrcd.xrcdcomp,l_xrcd.xrcdld,l_xrcd.xrcdsite,l_xrcd.xrcddocno,
                    l_xrcd.xrcdseq,l_xrcd.xrcdseq2,l_xrcd.xrcdorga,l_xrcd.xrcd001,l_xrcd.xrcd002,
                    l_xrcd.xrcd003,l_xrcd.xrcd004,l_xrcd.xrcd005,l_xrcd.xrcd006,l_xrcd.xrcd007,
                    l_xrcd.xrcd008,l_xrcd.xrcd009,l_xrcd.xrcd010,l_xrcd.xrcd100,l_xrcd.xrcd101,
                    l_xrcd.xrcd102,l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,l_xrcd.xrcd106,
                    l_xrcd.xrcd112,l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115,l_xrcd.xrcd116,
                    l_xrcd.xrcd117,l_xrcd.xrcd118,l_xrcd.xrcd121,l_xrcd.xrcd124,l_xrcd.xrcd131,
                    l_xrcd.xrcd134,l_xrcd.xrcd123,l_xrcd.xrcd125,l_xrcd.xrcd133,l_xrcd.xrcd135,
                    l_xrcd.xrcdud001,l_xrcd.xrcdud002,l_xrcd.xrcdud003,l_xrcd.xrcdud004,l_xrcd.xrcdud005,
                    l_xrcd.xrcdud006,l_xrcd.xrcdud007,l_xrcd.xrcdud008,l_xrcd.xrcdud009,l_xrcd.xrcdud010,
                    l_xrcd.xrcdud011,l_xrcd.xrcdud012,l_xrcd.xrcdud013,l_xrcd.xrcdud014,l_xrcd.xrcdud015,
                    l_xrcd.xrcdud016,l_xrcd.xrcdud017,l_xrcd.xrcdud018,l_xrcd.xrcdud019,l_xrcd.xrcdud020,
                    l_xrcd.xrcdud021,l_xrcd.xrcdud022,l_xrcd.xrcdud023,l_xrcd.xrcdud024,l_xrcd.xrcdud025,
                    l_xrcd.xrcdud026,l_xrcd.xrcdud027,l_xrcd.xrcdud028,l_xrcd.xrcdud029,l_xrcd.xrcdud030,
                    l_xrcd.xrcd011,l_xrcd.xrcd012,l_xrcd.xrcd013
               FROM xrcd_t
              WHERE xrcdent = g_enterprise
                AND xrcdld = ' '          
                AND xrcddocno = p_xmeedocno
                AND xrcdseq2 = p_xmee900
                AND xrcdseq = l_xmeg.xmegseq 
             CALL s_tax_get_ooef(p_xmdasite) RETURNING l_success,l_ooef016,l_ooef017,l_ooef019          
             INSERT INTO xrcd_t(xrcdent,xrcdcomp,xrcdld,xrcdsite,xrcddocno,
                                xrcdseq,xrcdseq2,xrcdorga,xrcd001,xrcd002,
                                xrcd003,xrcd004,xrcd005,xrcd006,xrcd007,
                                xrcd008,xrcd009,xrcd010,xrcd100,xrcd101,
                                xrcd102,xrcd103,xrcd104,xrcd105,xrcd106,
                                xrcd112,xrcd113,xrcd114,xrcd115,xrcd116,
                                xrcd117,xrcd118,xrcd121,xrcd124,xrcd131,
                                xrcd134,xrcd123,xrcd125,xrcd133,xrcd135,
                                xrcdud001,xrcdud002,xrcdud003,xrcdud004,xrcdud005,
                                xrcdud006,xrcdud007,xrcdud008,xrcdud009,xrcdud010,
                                xrcdud011,xrcdud012,xrcdud013,xrcdud014,xrcdud015,
                                xrcdud016,xrcdud017,xrcdud018,xrcdud019,xrcdud020,
                                xrcdud021,xrcdud022,xrcdud023,xrcdud024,xrcdud025,
                                xrcdud026,xrcdud027,xrcdud028,xrcdud029,xrcdud030,
                                xrcd011,xrcd012,xrcd013
                                )
                         VALUES(l_xrcd.xrcdent,l_ooef017,' ',p_xmdasite,p_xmdadocno,
                                l_xrcd.xrcdseq,0,l_xrcd.xrcdorga,l_xrcd.xrcd001,l_xrcd.xrcd002,
                                l_xrcd.xrcd003,l_xrcd.xrcd004,l_xrcd.xrcd005,l_xrcd.xrcd006,l_xrcd.xrcd007,
                                l_xrcd.xrcd008,l_xrcd.xrcd009,l_xrcd.xrcd010,l_xrcd.xrcd100,l_xrcd.xrcd101,
                                l_xrcd.xrcd102,l_xrcd.xrcd103,l_xrcd.xrcd104,l_xrcd.xrcd105,l_xrcd.xrcd106,
                                l_xrcd.xrcd112,l_xrcd.xrcd113,l_xrcd.xrcd114,l_xrcd.xrcd115,l_xrcd.xrcd116,
                                l_xrcd.xrcd117,l_xrcd.xrcd118,l_xrcd.xrcd121,l_xrcd.xrcd124,l_xrcd.xrcd131,
                                l_xrcd.xrcd134,l_xrcd.xrcd123,l_xrcd.xrcd125,l_xrcd.xrcd133,l_xrcd.xrcd135,
                                l_xrcd.xrcdud001,l_xrcd.xrcdud002,l_xrcd.xrcdud003,l_xrcd.xrcdud004,l_xrcd.xrcdud005,
                                l_xrcd.xrcdud006,l_xrcd.xrcdud007,l_xrcd.xrcdud008,l_xrcd.xrcdud009,l_xrcd.xrcdud010,
                                l_xrcd.xrcdud011,l_xrcd.xrcdud012,l_xrcd.xrcdud013,l_xrcd.xrcdud014,l_xrcd.xrcdud015,
                                l_xrcd.xrcdud016,l_xrcd.xrcdud017,l_xrcd.xrcdud018,l_xrcd.xrcdud019,l_xrcd.xrcdud020,
                                l_xrcd.xrcdud021,l_xrcd.xrcdud022,l_xrcd.xrcdud023,l_xrcd.xrcdud024,l_xrcd.xrcdud025,
                                l_xrcd.xrcdud026,l_xrcd.xrcdud027,l_xrcd.xrcdud028,l_xrcd.xrcdud029,l_xrcd.xrcdud030,
                                l_xrcd.xrcd011,l_xrcd.xrcd012,l_xrcd.xrcd013)
             IF SQLCA.sqlcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = "INSERT xmdc_t seq2=0"
                LET g_errparam.popup = TRUE
                CALL cl_err()
                LET r_success = FALSE
             END IF
          END IF             
       END IF
       #更新訂單xrcd檔
       #更新交期明細檔    
       LET g_site_o = g_site
       LET g_site = p_xmdasite
       IF NOT s_axmt500_gen_xmdd(p_xmdadocno,l_xmeg.xmegseq) THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "INSERT xmdd_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET r_success = FALSE
       END IF   
       #庫存需求等候  
       IF l_xmeg.xmeg901 MATCHES '[23]' THEN
          IF NOT s_axmt510_inas('con',p_xmdadocno,l_xmeg.xmegseq) THEN
             LET r_success = FALSE
          END IF
       END IF   
       LET g_site = g_site_o
   END FOREACH     
   #將已出貨量、已銷退量、銷退換貨量、已轉出通量回寫
   LET l_sql = "SELECT xmdddocno FROM xmdd_t ",
                      " WHERE xmddent = ? AND xmdddocno = ? AND xmddseq = ? AND xmddseq1 = ? AND xmddseq2 = ? FOR UPDATE NOWAIT"
   DECLARE s_axmt510_updxmdd_cl CURSOR FROM l_sql   
   INITIALIZE l_xmdd.* TO NULL
   DECLARE sel_xmdd_cs CURSOR FOR
    SELECT xmdddocno,xmddseq,xmddseq1,xmddseq2,
             xmdd014,xmdd015,xmdd016,xmdd031
      FROM axmt510_tmp01_1  #160727-00019#30   16/08/08 By 08734 临时表长度超过15码的减少到15码以下 axmt510_xmdd_tmp ——> axmt510_tmp01
   FOREACH sel_xmdd_cs INTO l_xmdd.xmdddocno,l_xmdd.xmddseq,l_xmdd.xmddseq1,l_xmdd.xmddseq2,
                            l_xmdd.xmdd014,l_xmdd.xmdd015,l_xmdd.xmdd016,l_xmdd.xmdd031
       #170427-00007#2 add --(S)--
       OPEN s_axmt510_updxmdd_cl USING g_enterprise,l_xmdd.xmdddocno,l_xmdd.xmddseq,l_xmdd.xmddseq1,l_xmdd.xmddseq2
       IF SQLCA.SQLCODE THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = "OPEN s_axmt510_updxmdd_cl:",SQLERRMESSAGE
          LET g_errparam.code = SQLCA.SQLCODE
          LET g_errparam.popup = TRUE
          CLOSE s_axmt510_updxmdd_cl
          CALL cl_err()
          LET r_success = FALSE
          EXIT FOREACH
       ELSE
       #170427-00007#2 add --(E)--
          UPDATE xmdd_t
             SET xmdd014 = l_xmdd.xmdd014,       
                 xmdd015 = l_xmdd.xmdd015,
                 xmdd016 = l_xmdd.xmdd016,
                 xmdd031 = l_xmdd.xmdd031
           WHERE xmddent = g_enterprise
             AND xmdddocno = l_xmdd.xmdddocno
             AND xmddseq = l_xmdd.xmddseq          
             AND xmddseq1 = l_xmdd.xmddseq1          
             AND xmddseq2 = l_xmdd.xmddseq2 
       END IF    #170427-00007#2 add          
   
         IF l_xmdd.xmdd014 > 0 THEN 
         #SELECT xmdd001,xmdd002,xmdd004 INTO l_xmdd.xmdd001,l_xmdd.xmdd002,l_xmdd.xmdd004 FROM xmdd_t #170426-00048#2 mark
         #170426-00048#2 --s add
         SELECT xmdd001,xmdd002,xmdd004,imaf058 INTO l_xmdd.xmdd001,l_xmdd.xmdd002,l_xmdd.xmdd004,l_imaf058 FROM xmdd_t
              LEFT JOIN imaf_t ON  imafent = xmddent AND imaf001 = xmdd001 AND imafsite = xmddsite 
         #170426-00048#2 --e add
             WHERE xmddent = g_enterprise
               AND xmdddocno = l_xmdd.xmdddocno
               AND xmddseq = l_xmdd.xmddseq          
               AND xmddseq1 = l_xmdd.xmddseq1          
               AND xmddseq2 = l_xmdd.xmddseq2
         IF l_imaf058 = '3' THEN #170426-00048#2 add           
            CALL s_inventory_upd_inas(g_site,p_xmeedocno,l_xmdd.xmddseq,l_xmdd.xmddseq1,l_xmdd.xmddseq2,
                                    l_xmdd.xmdd001,l_xmdd.xmdd002,l_xmdd.xmdd004,l_xmdd.xmdd014,-1)
                 RETURNING r_success                         
            END IF
         END IF #170426-00048#2 add         
        #170411-00082#1----add---end----       
   END FOREACH
   CLOSE s_axmt510_updxmdd_cl    #170427-00007#2 add
   
   #將fcx-180411--str---xmddud001,xmddud011,xmddud012,xmddud013回寫
   INITIALIZE l_xmdd.* TO NULL
   LET l_xmddud001=''
   LET l_xmddud011=''
   LET l_xmddud012=''
   LET l_xmddud013=''
   LET l_xmdc028=''
   LET l_xmeg028=''
   LET l_xmeh006 = 0   #C20180627-07783 ADD
   LET l_xmdd006 = 0   #C20180627-07783 ADD
   LET l_xmdd011 = ''  #C20190505-07783 ADD
   LET l_xmdd009 = ''  #C20190505-07783 ADD
   DECLARE sel_xmdd_cs2 CURSOR FOR
    SELECT xmdddocno,xmddseq,xmddseq1,xmddseq2,
             xmddud001,xmddud011,xmddud012,xmddud013,xmdc028,xmeg028,xmdd032,xmeh006,xmdd006,xmdd011,xmdd009   #C20180627-07783 ADD xmeh006,xmdd006 #C20190505-07783 ADD l_xmdd011,l_xmdd009
      FROM axmt510_tmp03_1  #160727-00019#30   16/08/08 By 08734 临时表长度超过15码的减少到15码以下 axmt510_xmdd_tmp ——> axmt510_tmp01
   FOREACH sel_xmdd_cs2 INTO l_xmdd.xmdddocno,l_xmdd.xmddseq,l_xmdd.xmddseq1,l_xmdd.xmddseq2,
                            l_xmddud001,l_xmddud011,l_xmddud012,l_xmddud013,l_xmdc028,l_xmeg028,l_xmdd032,l_xmeh006,l_xmdd006,l_xmdd011,l_xmdd009 #C20180627-07783 ADD l_xmeh006,l_xmdd006
       #170427-00007#2 add --(S)--                                                                                                                #C20190505-07783 ADD l_xmdd011,l_xmdd009
       OPEN s_axmt510_updxmdd_cl USING g_enterprise,l_xmdd.xmdddocno,l_xmdd.xmddseq,l_xmdd.xmddseq1,l_xmdd.xmddseq2
       IF SQLCA.SQLCODE THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = "OPEN s_axmt510_updxmdd_cl:",SQLERRMESSAGE
          LET g_errparam.code = SQLCA.SQLCODE
          LET g_errparam.popup = TRUE
          CLOSE s_axmt510_updxmdd_cl
          CALL cl_err()
          LET r_success = FALSE
          EXIT FOREACH
       ELSE
          #C20180627-07783--因为可能更库位的时候，订单已经进行了一部分（比如批次计划、出货等），这里状态码、备货量、备置量什么的都不变--s
          IF  l_xmdc028 <> l_xmeg028  THEN           
              UPDATE xmdd_t
                 SET xmddud001 = l_xmddud001,       
                     xmddud011 = 0,
                     xmddud012 = l_xmddud012 + l_xmddud011 + l_xmeh006 - l_xmdd006,
                     xmddud013 = l_xmddud013,
                     xmdd032 = l_xmdd032,
                     xmdd011 = l_xmdd011,     #C20180906-07783 ADD
                     xmdd009 = l_xmdd009      #C20180906-07783 ADD                        
               WHERE xmddent = g_enterprise
                 AND xmdddocno = l_xmdd.xmdddocno
                 AND xmddseq = l_xmdd.xmddseq          
                 AND xmddseq1 = l_xmdd.xmddseq1          
                 AND xmddseq2 = l_xmdd.xmddseq2 
               #C20190505-07783---S          
              IF SQLCA.SQLCODE THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "update xmdd_t l_xmdc028 <> l_xmeg028 :",SQLERRMESSAGE
                 LET g_errparam.code = SQLCA.SQLCODE
                 LET g_errparam.popup = TRUE
                 CLOSE s_axmt510_updxmdd_cl
                 CALL cl_err()
                 LET r_success = FALSE
                 CONTINUE FOREACH        
              END IF                 
          ELSE
              UPDATE xmdd_t
                 SET xmddud001 = l_xmddud001,       
                     xmddud011 = l_xmddud011,
                     xmddud012 = l_xmddud012,
                     xmddud013 = l_xmddud013,
                     xmdd032 = l_xmdd032,
                     xmdd011 = l_xmdd011,     #C20180906-07783 ADD
                     xmdd009 = l_xmdd009      #C20180906-07783 ADD                         
               WHERE xmddent = g_enterprise
                 AND xmdddocno = l_xmdd.xmdddocno
                 AND xmddseq = l_xmdd.xmddseq          
                 AND xmddseq1 = l_xmdd.xmddseq1          
                 AND xmddseq2 = l_xmdd.xmddseq2     
              IF SQLCA.SQLCODE THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "update xmdd_t l_xmdc028 <> l_xmeg028 else :",SQLERRMESSAGE
                 LET g_errparam.code = SQLCA.SQLCODE
                 LET g_errparam.popup = TRUE
                 CLOSE s_axmt510_updxmdd_cl
                 CALL cl_err()
                 LET r_success = FALSE
                 CONTINUE FOREACH        
              END IF                   
              #C20181207-07783--S--判断一下，是不是预扣为负了，如果是负了，提醒用户回想如何操作的，并立即联络信息部
              LET l_cnt2 = 0
              SELECT count(*) INTO l_cnt2 FROM xmdd_t
               WHERE xmddent = g_enterprise
                 AND xmdddocno = l_xmdd.xmdddocno
                 AND xmddseq = l_xmdd.xmddseq          
                 AND xmddseq1 = l_xmdd.xmddseq1          
                 AND xmddseq2 = l_xmdd.xmddseq2 
                 AND xmddud011 < 0
              IF l_cnt2 > 0 THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = ''
                 LET g_errparam.replace[1] = l_xmdd.xmdddocno
                 LET g_errparam.replace[2] = l_xmdd.xmddseq                 
                 LET g_errparam.code =  'cxm-00038'           #变更后，订单%1项次%2的预扣数量变为了负数，请回忆下操作，立即联系信息部！
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 LET r_success = FALSE
                 CONTINUE FOREACH
              END IF                   
              #C20190505-07783---E               
          END IF
          #C20190505-07783---S
#          IF l_xmeh006 <> l_xmdd006 AND l_xmdc028 = l_xmeg028 THEN 
#             UPDATE xmdd_t
#                SET xmddud001 = l_xmddud001,       
#                    xmddud011 = l_xmddud011,
#                    xmddud012 = l_xmddud012 +  l_xmeh006 - l_xmdd006,
#                    xmddud013 = l_xmddud013,
#                    xmdd032 = l_xmdd032                    
#              WHERE xmddent = g_enterprise
#                AND xmdddocno = l_xmdd.xmdddocno
#                AND xmddseq = l_xmdd.xmddseq          
#                AND xmddseq1 = l_xmdd.xmddseq1          
#                AND xmddseq2 = l_xmdd.xmddseq2 
#          END IF  
          IF l_xmeh006 > l_xmdd006 AND l_xmdc028 = l_xmeg028 THEN 
             UPDATE xmdd_t
                SET xmddud001 = l_xmddud001,       
                    xmddud011 = l_xmddud011,
                    xmddud012 = l_xmddud012 +  l_xmeh006 - l_xmdd006,
                    xmddud013 = l_xmddud013,
                    xmdd032 = l_xmdd032,
                    xmdd011 = l_xmdd011,     #C20180906-07783 ADD
                    xmdd009 = l_xmdd009      #C20180906-07783 ADD                        
              WHERE xmddent = g_enterprise
                AND xmdddocno = l_xmdd.xmdddocno
                AND xmddseq = l_xmdd.xmddseq          
                AND xmddseq1 = l_xmdd.xmddseq1          
                AND xmddseq2 = l_xmdd.xmddseq2 
              IF SQLCA.SQLCODE THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "update xmdd_t l_xmeh006 > l_xmdd006 AND l_xmdc028 = l_xmeg028 :",SQLERRMESSAGE
                 LET g_errparam.code = SQLCA.SQLCODE
                 LET g_errparam.popup = TRUE
                 CLOSE s_axmt510_updxmdd_cl
                 CALL cl_err()
                 LET r_success = FALSE
                 CONTINUE FOREACH        
              END IF                  
             #C20181207-07783--S--判断一下，是不是预扣为负了，如果是负了，提醒用户回想如何操作的，并立即联络信息部
             LET l_cnt2 = 0
             SELECT count(*) INTO l_cnt2 FROM xmdd_t
              WHERE xmddent = g_enterprise
                AND xmdddocno = l_xmdd.xmdddocno
                AND xmddseq = l_xmdd.xmddseq          
                AND xmddseq1 = l_xmdd.xmddseq1          
                AND xmddseq2 = l_xmdd.xmddseq2 
                AND xmddud011 < 0
             IF l_cnt2 > 0 THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.extend = ''
                LET g_errparam.replace[1] = l_xmdd.xmdddocno
                LET g_errparam.replace[2] = l_xmdd.xmddseq                
                LET g_errparam.code =  'cxm-00038'           #变更后，订单%1项次%2的预扣数量变为了负数，请回忆下操作，立即联系信息部！
                LET g_errparam.popup = TRUE
                CALL cl_err()
                LET r_success = FALSE
                CONTINUE FOREACH
             END IF                              
             #C20181207-07783--E--判断一下，是不是预扣为负了，如果是负了，提醒用户立即联络信息部                  
          END IF 
          IF l_xmeh006 < l_xmdd006 AND l_xmdc028 = l_xmeg028 THEN 
             LET l_due = l_xmdd006 - l_xmeh006
             #优先扣减欠料量
             IF l_due <= l_xmddud012 THEN 
                UPDATE xmdd_t
                   SET xmddud001 = l_xmddud001,       
                       xmddud011 = l_xmddud011,
                       xmddud012 = l_xmddud012 - l_due,
                       xmddud013 = l_xmddud013,
                       xmdd032 = l_xmdd032,
                       xmdd011 = l_xmdd011,     #C20180906-07783 ADD
                       xmdd009 = l_xmdd009      #C20180906-07783 ADD                           
                 WHERE xmddent = g_enterprise
                   AND xmdddocno = l_xmdd.xmdddocno
                   AND xmddseq = l_xmdd.xmddseq          
                   AND xmddseq1 = l_xmdd.xmddseq1          
                   AND xmddseq2 = l_xmdd.xmddseq2 
                 IF SQLCA.SQLCODE THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.extend = "update xmdd_t l_due <= l_xmddud012 :",SQLERRMESSAGE
                    LET g_errparam.code = SQLCA.SQLCODE
                    LET g_errparam.popup = TRUE
                    CLOSE s_axmt510_updxmdd_cl
                    CALL cl_err()
                    LET r_success = FALSE
                    CONTINUE FOREACH        
                 END IF                         
                 #C20181207-07783--S--判断一下，是不是预扣为负了，如果是负了，提醒用户回想如何操作的，并立即联络信息部
                 LET l_cnt2 = 0
                 SELECT count(*) INTO l_cnt2 FROM xmdd_t
                  WHERE xmddent = g_enterprise
                    AND xmdddocno = l_xmdd.xmdddocno
                    AND xmddseq = l_xmdd.xmddseq          
                    AND xmddseq1 = l_xmdd.xmddseq1          
                    AND xmddseq2 = l_xmdd.xmddseq2 
                    AND xmddud011 < 0
                 IF l_cnt2 > 0 THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.extend = ''
                    LET g_errparam.replace[1] = l_xmdd.xmdddocno
                    LET g_errparam.replace[2] = l_xmdd.xmddseq                    
                    LET g_errparam.code =  'cxm-00038'           #变更后，订单%1项次%2的预扣数量变为了负数，请回忆下操作，立即联系信息部！
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                    LET r_success = FALSE
                    CONTINUE FOREACH
                 END IF                              
                 #C20181207-07783--E--判断一下，是不是预扣为负了，如果是负了，提醒用户立即联络信息部                     
             ELSE
                UPDATE xmdd_t
                   SET xmddud001 = l_xmddud001,       
                       xmddud011 = l_xmddud011 - l_due + l_xmddud012,
                       xmddud012 = 0,
                       xmddud013 = l_xmddud013,
                       xmdd032 = l_xmdd032,
                       xmdd011 = l_xmdd011,     #C20180906-07783 ADD
                       xmdd009 = l_xmdd009      #C20180906-07783 ADD                           
                 WHERE xmddent = g_enterprise
                   AND xmdddocno = l_xmdd.xmdddocno
                   AND xmddseq = l_xmdd.xmddseq          
                   AND xmddseq1 = l_xmdd.xmddseq1          
                   AND xmddseq2 = l_xmdd.xmddseq2  
                 IF SQLCA.SQLCODE THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.extend = "update xmdd_t l_due <= l_xmddud012 else :",SQLERRMESSAGE
                    LET g_errparam.code = SQLCA.SQLCODE
                    LET g_errparam.popup = TRUE
                    CLOSE s_axmt510_updxmdd_cl
                    CALL cl_err()
                    LET r_success = FALSE
                    CONTINUE FOREACH        
                 END IF                        
                 #C20181207-07783--S--判断一下，是不是预扣为负了，如果是负了，提醒用户回想如何操作的，并立即联络信息部
                 LET l_cnt2 = 0
                 SELECT count(*) INTO l_cnt2 FROM xmdd_t
                  WHERE xmddent = g_enterprise
                    AND xmdddocno = l_xmdd.xmdddocno
                    AND xmddseq = l_xmdd.xmddseq          
                    AND xmddseq1 = l_xmdd.xmddseq1          
                    AND xmddseq2 = l_xmdd.xmddseq2 
                    AND xmddud011 < 0
                 IF l_cnt2 > 0 THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.extend = ''
                    LET g_errparam.replace[1] = l_xmdd.xmdddocno
                    LET g_errparam.replace[2] = l_xmdd.xmddseq
                    LET g_errparam.code =  'cxm-00038'           #变更后，订单%1项次%2的预扣数量变为了负数，请回忆下操作，立即联系信息部！
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                    LET r_success = FALSE
                    CONTINUE FOREACH
                 END IF                              
                 #C20181207-07783--E--判断一下，是不是预扣为负了，如果是负了，提醒用户立即联络信息部                                 
             END IF                   
          END IF
          #C20190505-07783---E             
          #C20180627-07783--因为可能更库位的时候，订单已经进行了一部分（比如批次计划、出货等），这里状态码、备货量、备置量什么的都不变--e               
       END IF    #170427-00007#2 add          

       LET l_xmddud001=''
       LET l_xmddud011=''
       LET l_xmddud012=''
       LET l_xmddud013=''
       LET l_xmdc028=''
       LET l_xmeg028=''
       LET l_xmeh006 = 0   #C20180627-07783 ADD
       LET l_xmdd006 = 0   #C20180627-07783 ADD       
       LET l_xmdd011 = ''  #C20190505-07783 ADD
       LET l_xmdd009 = ''  #C20190505-07783 ADD       
   END FOREACH
   CLOSE s_axmt510_updxmdd_cl    #170427-00007#2 add   
   #將fcx-180411--end---xmddud001,xmddud011,xmddud012,xmddud013回寫   
   
   #更新多帳期預收款xmef_t
   INITIALIZE l_xmef.* TO NULL
   DECLARE sel_xmef_cs1 CURSOR FOR
   #SELECT xmef001,xmef002,xmef003,xmef004,xmef005,   #171122-00032#4 mark
    SELECT xmef001,xmef002,xmef003,xmef004,           #171122-00032#4 add
          #xmef006,xmef007,xmef008,xmef009,xmef016,   #171122-00032#4 mark
           xmef006,xmef007,xmef009,xmef016,           #171122-00032#4 add
           xmef017,xmef901
      FROM xmef_t
     WHERE xmefent = g_enterprise
       AND xmefdocno = p_xmeedocno 
       AND xmef900 = p_xmee900

   #多帳期刪除
   DELETE FROM xmdb_t
    WHERE xmdbent = g_enterprise
      AND xmdbdocno = p_xmdadocno 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "DELETE xmdb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF

  #FOREACH sel_xmef_cs1 INTO l_xmef.xmef001,l_xmef.xmef002,l_xmef.xmef003,l_xmef.xmef004,l_xmef.xmef005,   #171122-00032#4 mark  
   FOREACH sel_xmef_cs1 INTO l_xmef.xmef001,l_xmef.xmef002,l_xmef.xmef003,l_xmef.xmef004,                  #171122-00032#4 add
                            #l_xmef.xmef006,l_xmef.xmef007,l_xmef.xmef008,l_xmef.xmef009,l_xmef.xmef016,   #171122-00032#4 mark  
                             l_xmef.xmef006,l_xmef.xmef007,l_xmef.xmef009,l_xmef.xmef016,                  #171122-00032#4 add 
                             l_xmef.xmef017,l_xmef.xmef901
   
      INSERT INTO xmdb_t (xmdbent, xmdbdocno, xmdbsite,xmdb001,
                         #xmdb002,xmdb003,xmdb004,xmdb005,xmdb006,xmdb007,             #171122-00032#4 mark              
                         #xmdb008,xmdb009,xmdb016,xmdb017)                             #171122-00032#4 mark  
                          xmdb002,xmdb003,xmdb004,xmdb006,xmdb007,                     #171122-00032#4 add    
                          xmdb009,xmdb016,xmdb017)                                     #171122-00032#4 add
                  VALUES (g_enterprise, p_xmadocno, p_xmdasite,l_xmef.xmef001,
                         #l_xmef.xmef002,l_xmef.xmef003,l_xmef.xmef004,l_xmef.xmef005,l_xmef.xmef006,l_xmef.xmef007,  #171122-00032#4 mark  
                         #l_xmef.xmef008,l_xmef.xmef009,l_xmef.xmef016,l_xmef.xmef017)                                #171122-00032#4 mark  
                          l_xmef.xmef002,l_xmef.xmef003,l_xmef.xmef004,l_xmef.xmef006,l_xmef.xmef007,                 #171122-00032#4 add  
                          l_xmef.xmef009,l_xmef.xmef016,l_xmef.xmef017)                                               #171122-00032#4 add                           
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT xmdb_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH  
   
  RETURN r_success   
           
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aic_carry_sfaa_conf2()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/9/6 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_sfaa_conf2()
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_site      LIKE sfaa_t.sfaasite   #備份營運據點

   LET r_success = TRUE

   LET l_site = g_site           #備份g_site
   LET g_site = g_sfaa.sfaasite  #將g_site替換成當站營運據點

#   CALL s_asft300_01_confirm(g_sfaa.sfaadocno)
   CALL s_aic_carry_sfaa_confirm(g_sfaa.sfaadocno)   
   RETURNING r_success
   

   LET g_site = l_site           #還原g_site

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aic_carry_sfaa_confirm(p_sfaadocno)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/9/6 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_sfaa_confirm(p_sfaadocno)
DEFINE p_sfaadocno           LIKE sfaa_t.sfaadocno
DEFINE r_success             LIKE type_t.num5
DEFINE l_success             LIKE type_t.num5
DEFINE l_sfaacnfid           LIKE sfaa_t.sfaacnfid    #审核者
DEFINE l_sfaacnfdt           DATETIME YEAR TO SECOND  #审核日期
DEFINE l_sfaa003             LIKE sfaa_t.sfaa003      #151207-00001#3
   
   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      RETURN r_success
   END IF
   
   CALL s_aooi200_get_slip(p_sfaadocno) RETURNING l_success,g_ooba002
   IF NOT l_success THEN
      RETURN r_success
   END IF
   
   IF NOT s_asft300_01_confirm_chk(p_sfaadocno) THEN
      RETURN r_success
   END IF
   
   #更新审核状态
   LET l_sfaacnfid = g_user            #审核者
   LET l_sfaacnfdt = cl_get_current()  #审核日期   
  #UPDATE sfaa_t SET sfaastus = 'Y',sfaacnfid = l_sfaacnfid,sfaacnfdt = l_sfaacnfdt               #170324-00070#1 mark
   UPDATE sfaa_t SET sfaastus = 'Y',sfaacnfid = l_sfaacnfid,sfaacnfdt = l_sfaacnfdt,sfaa040 = 'Y' #170324-00070#1 add
    WHERE sfaaent = g_enterprise AND sfaasite = g_site AND sfaadocno = p_sfaadocno
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "upd sfaa_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #庫存需求等候  #15/02/05 add by Sarah
   IF NOT s_asft300_01_upd_inas('con',p_sfaadocno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #2015/09/21 by stellar mark ----- (S)
#   #dorislai-20150714-add----(S)
#   #apst300，獨立需求單的已耗需求量回寫
#   IF NOT s_asft300_01_upd_psab('con',p_sfaadocno) THEN
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   #dorislai-20150714-add----(E)
   #2015/09/21 by stellar mark ----- (E)
   
   #判斷工單單別"自動發放"參數，若等於Y，則再將狀態碼更新為F.發放
   CALL cl_get_doc_para(g_enterprise,g_site,g_ooba002,'D-MFG-0040') RETURNING g_para
   IF g_para = 'Y' THEN
#      CALL s_asft300_released_upd(p_sfaadocno) RETURNING r_success   #170106-00030#1-add
       CALL s_aic_carry_sfaa_released_upd(p_sfaadocno) RETURNING r_success   #C20180906-07783 ADD 
      #170106-00030#1-s-mark
#      UPDATE sfaa_t SET sfaastus = 'F' WHERE sfaaent = g_enterprise AND sfaasite = g_site AND sfaadocno = p_sfaadocno
#      IF SQLCA.sqlcode  THEN
#         INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = "upd sfaa_t"
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#
#         RETURN r_success
#      END IF
#      #161004-00002#1-S
#      ##151207-00001#3 ---START   
#      #SELECT sfaa003 INTO l_sfaa003 FROM sfaa_t WHERE sfaaent = g_enterprise AND sfaasite = g_site AND sfaadocno = p_sfaadocno
#      #IF ((cl_get_para(g_enterprise,g_site,'S-SYS-0003')  = 'Y') AND cl_get_doc_para(g_enterprise,g_site,g_ooba002,'D-MFG-0079') = 'Y' AND (l_sfaa003 <> '3')) THEN   #判斷是否啟用MES整合        
#      #   IF NOT (s_aws_mes_ins('asft300','insert', p_sfaadocno ) = 1) THEN
#      #      LET r_success = FALSE                    
#      #      CALL cl_err()
#      #      RETURN r_success
#      #   END IF 
#      #END IF
#      ##151207-00001#3 ---END  
#      #161004-00002#1-S   
      #170106-00030#1-e-mark
      #170106-00030#1-s-add
   ELSE
      LET r_success = TRUE
      #170106-00030#1-e-add
   END IF
#   LET r_success = TRUE   #170106-00030#1-mark
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aic_carry_sfaa_released_upd(p_sfaadocno)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2018/9/6 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_sfaa_released_upd(p_sfaadocno)
DEFINE p_sfaadocno  LIKE sfaa_t.sfaadocno
DEFINE r_success    LIKE type_t.num5
DEFINE l_success    LIKE type_t.num5
DEFINE l_ooba002    LIKE ooba_t.ooba002
DEFINE l_n          LIKE type_t.num5
DEFINE l_num        LIKE type_t.num5
DEFINE l_sfaa  RECORD
    sfaa003    LIKE sfaa_t.sfaa003,
    sfaa004    LIKE sfaa_t.sfaa004,
    sfaa010    LIKE sfaa_t.sfaa010,
    sfaa011    LIKE sfaa_t.sfaa011,
    sfaa012    LIKE sfaa_t.sfaa012,
    sfaa015    LIKE sfaa_t.sfaa015
   ,sfaa061    LIKE sfaa_t.sfaa061    #161111-00062#1
           END RECORD
DEFINE l_cnt          LIKE type_t.num5  #171201-00006#1 add

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #检查:应在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   INITIALIZE l_sfaa.* TO NULL
   SELECT sfaa003,sfaa004,sfaa010,sfaa011,sfaa012,sfaa015,sfaa061  #161111-00062#1
     INTO l_sfaa.sfaa003,l_sfaa.sfaa004,l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa015,l_sfaa.sfaa061  #161111-00062#1
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaadocno = p_sfaadocno

   CALL s_aooi200_get_slip(p_sfaadocno) RETURNING l_success,l_ooba002
   #D-MFG-0038:工單下階備料產生時機(1.工單輸入時產生 2.工單發放時產生 3.人為決定)
   IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0038') = '2' THEN
      LET l_n = 0
      SELECT COUNT(1) INTO l_n
        FROM sfba_t
       WHERE sfbaent = g_enterprise
         AND sfbadocno = p_sfaadocno
      IF l_n = 0 THEN
         CALL s_asft300_02(p_sfaadocno,l_sfaa.sfaa003,l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa015,l_sfaa.sfaa012,'N') RETURNING l_success,l_num
         IF NOT l_success THEN
            LET r_success = FALSE
         END IF
      END IF
   END IF

   #160822-00019#1-s
   #發料制度2.倒扣料
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM sfba_t
    WHERE sfbaent = g_enterprise
      AND sfbadocno = p_sfaadocno
      AND sfba009 = 'N'
      
   #171201-00006#1  add(s)
   LET l_cnt = 0   
   SELECT COUNT(1) INTO l_cnt
     FROM sfba_t
    WHERE sfbaent = g_enterprise
      AND sfbadocno = p_sfaadocno
      AND sfba008 IN (1,2,3)
   #171201-00006#1 add(e)      
   #IF l_sfaa.sfaa004 = '2' OR l_n = 0 THEN  #171201-00006#1 mark
   IF l_sfaa.sfaa004 = '2' OR l_n = 0 OR l_cnt = 0 THEN  #171201-00006#1 add
      IF NOT s_asft300_upd_sfcb('1',p_sfaadocno,l_sfaa.sfaa012,l_sfaa.sfaa061) THEN  #161111-00062#1
         LET r_success = FALSE
      END IF
   END IF
   #160822-00019#1-e

   #160129-00002#9-S
   #161116-00008#1-S
   #IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' AND cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0079') = 'Y' THEN
   IF cl_get_para(g_enterprise,g_site,'S-SYS-0003') = 'Y' THEN
      IF cl_aws_prod_para(g_enterprise,"mes-0001") = 'Y' THEN
         IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0079') = 'Y' THEN  #170807-00020#8 add
            IF s_aws_mes2_wo_create(p_sfaadocno) THEN
             #  CALL cl_ask_end1() #zhouxm180517 mark 
               #C20180906-07783---S--如果成功了，就记录入数组
                LET g_cnt = g_cnt + 1
                LET g_sfaadocno[g_cnt].wo_no = p_sfaadocno              
               #C20180906-07783---E               
            ELSE
               LET g_err_collect = FALSE         
               CALL cl_err()
               LET r_success = FALSE
            END IF
         END IF  #170807-00020#8 add
      ELSE
         IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0079') = 'Y' THEN
   #161116-00008#1-E
            IF NOT (s_aws_mes_ins('asft300','insert', p_sfaadocno ) = 1) THEN
               #161004-00002#1-S 
               LET g_err_collect = FALSE         
               CALL cl_err()
               #161004-00002#1-E
               LET r_success = FALSE
            ELSE
               CALL cl_ask_end1()
            END IF
   #161116-00008#1-S
         END IF   
      END IF 
   #161116-00008#1-E
   END IF
   #160129-00002#9-E

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20190514 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_tri_so_upd3(p_pmdldocno,p_firstxmdadocno,p_xmda031,p_xmdasite,p_xmee900)
   DEFINE p_pmdldocno        LIKE pmdl_t.pmdldocno   #來源採購單號
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno   #初始訂單單號(可Null)
   DEFINE p_xmda031          LIKE xmda_t.xmda031     #多角序號
   DEFINE p_xmdasite         LIKE xmda_t.xmdasite    #營運據點
   DEFINE p_xmee900          LIKE xmee_t.xmee900     #变更版次
   DEFINE r_success          LIKE type_t.num5        #執行結果
   DEFINE r_xmdadocno        LIKE xmda_t.xmdadocno   #產生之訂單單號
   #170824-00002#3 --s add
   DEFINE l_pmdl020          LIKE pmdl_t.pmdl020
   DEFINE l_pmdl025          LIKE pmdl_t.pmdl025
   DEFINE l_pmdl026          LIKE pmdl_t.pmdl026
   DEFINE l_xmda005_o        LIKE xmda_t.xmda005    
   #170824-00002#3 --e add
   #C20180831-07783---S
   DEFINE l_xmegseq          LIKE xmeg_t.xmegseq,
          l_xmeg901          LIKE xmeg_t.xmeg901,
          l_xmeg011          LIKE xmeg_t.xmeg011,
          l_xmeg007          LIKE xmeg_t.xmeg007,
          l_xmeg028          LIKE xmeg_t.xmeg028,
          l_xmdd014          LIKE xmdd_t.xmdd014,
          l_xmdd031          LIKE xmdd_t.xmdd031,
          l_xmddud011        LIKE xmdd_t.xmddud011,
          l_xmdc028          LIKE xmdc_t.xmdc028,
          l_xmddud013s       LIKE xmdd_t.xmddud013,
          l_xmdd031s         LIKE xmdd_t.xmdd031,
          l_xmdd032s         LIKE xmdd_t.xmdd032 
   #C20180831-07783---E      
   DEFINE l_xmddud013        LIKE xmdd_t.xmddud013  #C20190505-07783 ADD 
   DEFINE l_xmdadocno   LIKE xmda_t.xmdadocno,   #C20190514-07783 ADD
          l_xmdd014_n   LIKE xmdd_t.xmdd014,
          l_xmdd031_n   LIKE xmdd_t.xmdd031,
          l_icaduc003   LIKE icaduc_t.icaduc003,
          l_icaduc006   LIKE icaduc_t.icaduc006
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_xmdadocno = ''

  #170816-00007#31 -S mark
  #IF cl_null(p_pmdldocno) OR
  #   cl_null(p_xmda031) OR
  #   cl_null(p_xmdasite) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_tri_so_upd"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success,r_xmdadocno
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_pmdldocno) THEN
      CALL s_azzi902_get_gzzd("aicp200","lbl_pmdldocno") RETURNING g_colname_1,g_comment_1   #來源採購單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_xmda031) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq100","lbl_xmda031") RETURNING g_colname_1,g_comment_1   #多角序號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_xmdasite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aici100","lbl_icaasite") RETURNING g_colname_1,g_comment_1   #營運據點
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
      RETURN r_success,r_xmdadocno
   END IF
  #170816-00007#31 -E add

   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF

   #塞xmda_t
   INITIALIZE g_xmda.* TO NULL
   
   #SELECT 原始訂單資料
   SELECT * INTO g_xmda.*
     FROM xmda_t
    WHERE xmdaent = g_enterprise
      AND xmda031 = p_xmda031
      AND xmdasite = p_xmdasite
      AND xmdastus <> 'X'
   
   LET r_xmdadocno = g_xmda.xmdadocno
   
   #SELECT 初始訂單資料
   IF NOT cl_null(p_firstxmdadocno) THEN
     #170824-00002#3 --s mark
     #SELECT xmda005,xmda033,xmda044        
     #  INTO g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044
     #170824-00002#3 --e mark
     #170824-00002#3 --s add
     SELECT xmda005,xmda033,xmda044,
            xmda027,xmda025,xmda026,
            xmda020,xmda037,xmda038,xmda036
       INTO g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044,
            g_xmda.xmda027,g_xmda.xmda025,g_xmda.xmda026,
            g_xmda.xmda020,g_xmda.xmda037,g_xmda.xmda038,g_xmda.xmda036
     #170824-00002#3 --e add 
        FROM xmda_t
       WHERE xmdaent = g_enterprise
         AND xmdadocno = p_firstxmdadocno
   END IF
   
   #SELECT來源採購單資料
   SELECT pmdldocdt,pmdl001,
          pmdl015,pmdl032
         ,pmdl020,pmdl025,pmdl026 #170824-00002#3 add
     INTO g_xmda.xmdadocdt,g_xmda.xmda001,
          g_xmda.xmda015,g_xmda.xmda034
         ,l_pmdl020,l_pmdl025,l_pmdl026 #170824-00002#3 add
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = p_pmdldocno
   
   #170824-00002#3 --s add
   #沒有初始訂單，表示是代採買，則抓來源採購單的欄位
   IF cl_null(p_firstxmdadocno) THEN
      LET g_xmda.xmda020 = l_pmdl020
      LET g_xmda.xmda025 = l_pmdl025
      LET g_xmda.xmda026 = l_pmdl026
   END IF
   #170824-00002#3 --e add
   
   LET g_xmda.xmdamodid = g_user
   LET g_xmda.xmdamoddt = cl_get_current()
   
   #取匯率
   CALL s_aic_carry_exchange(g_xmda.xmda048,g_xmda.xmdasite,g_xmda.xmdadocdt,g_xmda.xmda015,'','1')
   RETURNING r_success,g_xmda.xmda016
   IF NOT r_success THEN
      RETURN r_success,r_xmdadocno
   END IF
   #C20180830-07783--先取单别设置的默认字段---S
   LET l_xmda005_o = g_xmda.xmda005
   LET g_xmda.xmda005 = s_aooi200_get_doc_default(g_icab.icab003,'1',g_icac.icac003,'xmda005',g_xmda.xmda005) 
   IF cl_null(g_xmda.xmda005) THEN
      LET g_xmda.xmda005 = l_xmda005_o  
   END IF
   #C20180830-07783--先取单别设置的默认字段---E  
   UPDATE xmda_t
      SET (xmda005,xmda033,xmda044,
           xmdadocdt,xmda001,
           xmda015,xmda034,
           xmdamodid,xmdamoddt,
           #170824-00002#3 --s add
           #客戶連絡人、收貨地址、帳款地址、
           #運送方式、起運點、目的地、送貨供應商
           xmda027,xmda025,xmda026,
           xmda020,xmda037,xmda038,xmda036,
           #170824-00002#3 --e add           
           xmda016)
        = (g_xmda.xmda005,g_xmda.xmda033,g_xmda.xmda044,
           g_xmda.xmdadocdt,g_xmda.xmda001,
           g_xmda.xmda015,g_xmda.xmda034,
           g_xmda.xmdamodid,g_xmda.xmdamoddt,
           #170824-00002#3 --s add
           g_xmda.xmda027,g_xmda.xmda025,g_xmda.xmda026,
           g_xmda.xmda020,g_xmda.xmda037,g_xmda.xmda038,g_xmda.xmda036,
           #170824-00002#3 --e add    
           g_xmda.xmda016)
     WHERE xmdaent = g_enterprise
       AND xmdadocno = g_xmda.xmdadocno
       
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "UPDATE xmda_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
         
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF
    
   #因为下站的订单可能已经进行了预扣、转出通单、备货、出货单等，还是要保留原数据，因而进行更新下站订单的方式。另外，要注意加一些管控
   DECLARE pmeg_cs_1 CURSOR FOR  
      SELECT DISTINCT pmegseq,pmeg901,pmeg011,pmeg007,pmeg028 FROM pmeg_t 
       WHERE pmegent = g_enterprise 
         AND pmegdocno = p_pmdldocno
         AND pmeg900 = p_xmee900
       ORDER BY pmegseq           
   FOREACH pmeg_cs_1 INTO l_xmegseq,l_xmeg901,l_xmeg011,l_xmeg007,l_xmeg028    
       CASE l_xmeg901
         WHEN '2'                     #單身修改
            #檢查數量是否小於已出貨量/已轉出通量           
            LET l_xmdd014_n = 0
            LET l_xmdd031_n = 0
            CALL s_axmt510_quant_chk(g_xmda.xmdadocno,l_xmegseq) RETURNING l_xmdd014_n,l_xmdd031_n                                    
            IF l_xmeg007 < l_xmdd014_n OR l_xmeg007 < l_xmdd031_n THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.replace[1] = l_xmdd031_n
               LET g_errparam.replace[2] = l_xmdd014_n
               LET g_errparam.code = 'cxm-00030'  #变更后的数量不可小于下站已转出通量%1/已出货量%2！
               LET g_errparam.extend = g_xmda.xmdadocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
#               RETURN r_success,r_xmdadocno                                   
            END IF  
            #取得订单项次的库位            
            LET l_xmdc028 = ''
            SELECT xmdc028 INTO l_xmdc028 FROM xmdc_t
             WHERE xmdcent = g_enterprise
               AND xmdcdocno = g_xmda.xmdadocno
               AND xmdcseq = l_xmegseq            
            #首先根据多角基础资料的仓库对应关系取出来，更改后的采购仓库，对应的下站的出货仓库
            LET l_icaduc003 = ''
            SELECT icab002 INTO l_icaduc003 FROM icab_t
             WHERE icabent = g_enterprise
               AND icab001 = g_xmda.xmda050
               AND icab003 = g_site
            LET l_icaduc006 = ''
            SELECT icaduc006 INTO l_icaduc006 FROM icaduc_t 
             WHERE icaducent = g_enterprise 
               AND icaduc001 = g_xmda.xmda050
               AND icaduc003 = l_icaduc003
               AND icaduc004 = l_xmeg028
            IF cl_null(l_icaduc006) THEN							
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'cxm-00012'   #采购单收货库位为空或未找到对应的下站据点的库位
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE         
               CALL cl_err()    
               LET r_success = FALSE
#               RETURN r_success,r_xmdadocno    					
            END IF	
            IF NOT cl_null(l_xmdc028) AND NOT cl_null(l_icaduc006) AND l_xmdc028 <> l_icaduc006 THEN
               #存在备货数量，不可变更仓库。主要是考虑到，一般更库存的话，有预扣量，要释放，变为0。
               #如果有备货，且仅限出通单取消审核，就会出现从备货移到预扣数量，这是不对的，因为仓库已经变了。所以，控制住，处理好备货后，才可以改仓库                  
               IF NOT cl_null(g_xmda.xmdadocno) THEN 
                  LET l_xmddud013 = 0
                  SELECT MAX(SUM(xmddud013)) INTO l_xmddud013
                    FROM xmdd_t
                   WHERE xmddent = g_enterprise
                     AND xmdddocno = g_xmda.xmdadocno
                     AND xmddseq = l_xmegseq
                  GROUP BY xmddseq1                     
                  IF l_xmddud013 > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.replace[1] = l_xmddud013
                     LET g_errparam.code = 'cxm-00031'    #下站订单存在备货数量%1，不可变更仓库!
                     LET g_errparam.extend = g_xmda.xmdadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()                    
                     LET r_success = FALSE
#                     RETURN r_success,r_xmdadocno   
                  END IF
                  LET l_xmddud013s = 0 
                  LET l_xmdd031s = 0
                  SELECT NVL(SUM(xmddud013),0),NVL(SUM(xmdd031),0),NVL(SUM(xmdd032),0)  INTO l_xmddud013s,l_xmdd031s,l_xmdd032s
                    FROM xmdd_t
                   WHERE xmddent = g_enterprise
                     AND xmdddocno = g_xmda.xmdadocno
                     AND xmddseq = l_xmegseq
                  GROUP BY xmddseq1                    
                  IF l_xmdd031s <> l_xmddud013s+l_xmdd032s THEN
                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = 'cxm-00445'    #存未處理的出通單（即已轉出通數量>備貨量+备置量），不可變更倉庫！        C20181204-07783 MARK
                     LET g_errparam.code = 'cxm-01445'    #下站的订单存未处理的出通单（即已转出通数量>备货量+备置量），不可变更仓库！C20181204-07783 ADD
                     LET g_errparam.extend = g_xmda.xmdadocno
                     LET g_errparam.popup = TRUE
                     CALL cl_err()                    
                     LET r_success = FALSE
#                     RETURN r_success,r_xmdadocno   
                  END IF                          
               END IF
            END IF
       END CASE     
   END FOREACH   
   IF r_success = FALSE THEN
      RETURN r_success,r_xmdadocno
   END IF
   #更新订单：更新的时候，如果变更了仓库，还要释放预扣；如果只变更了数量，预扣、备货等不能变，变更欠料量。
#   CALL s_aic_carry_tri_so_upd3_body(p_firstxmdadocno,p_xmee900,g_xmda.xmdadocno,p_xmdasite) RETURNING r_success
#   IF r_success = FALSE THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = ''    #更新订单失败
#      LET g_errparam.extend = g_xmda.xmdadocno
#      LET g_errparam.popup = TRUE
#      CALL cl_err()                    
#      LET r_success = FALSE
#      RETURN r_success,r_xmdadocno
#   END IF    
   CALL s_aic_carry_body_so3(p_pmdldocno,p_firstxmdadocno) RETURNING r_success  #170103-00002#1 add
   IF r_success = FALSE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = ''    #更新订单失败
      LET g_errparam.extend = g_xmda.xmdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()                    
      LET r_success = FALSE
      RETURN r_success,r_xmdadocno
   END IF      

   RETURN r_success,r_xmdadocno
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20190514 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_body_so3(p_pmdldocno,p_firstxmdadocno)
   DEFINE p_pmdldocno        LIKE pmdl_t.pmdldocno
   DEFINE p_firstxmdadocno   LIKE xmda_t.xmdadocno   #170103-00002#1
   DEFINE r_success          LIKE type_t.num5   
   DEFINE l_pmdn   RECORD LIKE pmdn_t.*
   DEFINE l_pmdo   RECORD LIKE pmdo_t.*
   DEFINE l_pmdq   RECORD LIKE pmdq_t.*
   DEFINE l_pmdo015          LIKE pmdo_t.pmdo015 #170105-00050#2-add
   DEFINE l_pmao004          LIKE pmao_t.pmao004 #cws 2017.12.29
   DEFINE l_icaduc006        LIKE icaduc_t.icaduc006 #add by jinfeng 180313 
   DEFINE l_pmdl005          LIKE pmdl_t.pmdl005    #C180710-09421#3---add   #采购单性质     
   DEFINE l_pmdp003          LIKE pmdp_t.pmdp003    #C180824-07015#1 add
   DEFINE l_pmdp004          LIKE pmdp_t.pmdp004    #C180824-07015#1 add
   DEFINE l_xmddud001        LIKE xmdd_t.xmddud001,
          l_xmddud011        LIKE xmdd_t.xmddud011,
          l_xmddud012        LIKE xmdd_t.xmddud012,
          l_xmddud013        LIKE xmdd_t.xmddud013,
          l_xmdd032          LIKE xmdd_t.xmdd032,
          l_xmdd011          LIKE xmdd_t.xmdd011,
          l_xmdd009          LIKE xmdd_t.xmdd009,
          l_xmdd014          LIKE xmdd_t.xmdd014,
          l_xmdd015          LIKE xmdd_t.xmdd015,
          l_xmdd016          LIKE xmdd_t.xmdd016,
          l_xmdd031          LIKE xmdd_t.xmdd031,
          l_xmdd034          LIKE xmdd_t.xmdd034,
          l_xmdd035          LIKE xmdd_t.xmdd035,
          l_xmdd006          LIKE xmdd_t.xmdd006,
          l_xmdc028_new      LIKE xmdc_t.xmdc028,
          l_xmdc028_old      LIKE xmdc_t.xmdc028,
          l_due              LIKE xmdd_t.xmdd006,
          l_icaduc003        LIKE icaduc_t.icaduc003,
          l_cnt              LIKE type_t.num10
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   LET g_sql = "SELECT pmdnseq,pmdn001,pmdn002,pmdn004,pmdn005,",  #fcx-180328 add pmdn004,pmdn005
               "       pmdn006,pmdn007,pmdn008,pmdn009,pmdn010,",
               "       pmdn011,pmdn014,pmdn015,",
               "       pmdn019,pmdn020,pmdn021,pmdn022,pmdn024,", #160902-00008#1 add pmdn020、pmdn021
               "       pmdn025,pmdn026,",                         #170824-00001#1 add
               "       pmdn027,pmdn028,pmdn029,pmdn030,",         #161107-00023#1 add pmdn027
               "       pmdn031,pmdn032,pmdn033,pmdn034,pmdn035,",
               "       pmdn036,pmdn037,pmdn038,pmdn039,",
               "       pmdn043,",
               "       pmdn046,pmdn047,pmdn048,",
               "       pmdn050,", #170221-00029#2-add
               "       pmdn053",
               "       ,pmdn060", #170105-00050#2-add
               "       ,pmdnud001",   #add by cz 20180607 添加基板供应商字段 #remark by xianggy 180621
               "       ,pmdnud014",   #add by hehw 200915 添加WEIGHT字段
               "  FROM pmdn_t",
               " WHERE pmdnent = ",g_enterprise,
               "   AND pmdndocno = '",p_pmdldocno,"'"
   PREPARE s_aic_carry_pmdn_pre1_1 FROM g_sql
   DECLARE s_aic_carry_pmdn_cs1_1 CURSOR FOR s_aic_carry_pmdn_pre1_1

   LET g_sql = "SELECT pmdoseq1,pmdoseq2,",
               "       pmdo001,pmdo002,pmdo003,pmdo004,pmdo005,",
               "       pmdo006,pmdo007,pmdo008,pmdo009,pmdo010,",
               "       pmdo011,pmdo013,",
               "       pmdo022,",
               "       pmdo028,pmdo029,pmdo030,",
               "       pmdo031,pmdo032,pmdo033,pmdo034",
               "  FROM pmdo_t",
               " WHERE pmdoent = ",g_enterprise,
               "   AND pmdodocno = '",p_pmdldocno,"'",
               "   AND pmdoseq =?"
   PREPARE s_aic_carry_pmdo_pre1_1 FROM g_sql
   DECLARE s_aic_carry_pmdo_cs1_1 CURSOR FOR s_aic_carry_pmdo_pre1_1

   LET g_sql = "SELECT pmdqseq2,",
               "       pmdq002,pmdq003,pmdq004,pmdq005,",
               "       pmdq006,pmdq007,pmdq008",
               "  FROM pmdq_t",
               " WHERE pmdqent = ",g_enterprise,
               "   AND pmdqdocno = '",p_pmdldocno,"'",
               "   AND pmdqseq =?"
   PREPARE s_aic_carry_pmdq_pre_1 FROM g_sql
   DECLARE s_aic_carry_pmdq_cs_1 CURSOR FOR s_aic_carry_pmdq_pre_1

   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_xmdc_temp",   #170206-00013#1 mark
               "  FROM s_aic_xmdc_temp",         #170206-00013#1 add
               " WHERE xmdcent = ",g_enterprise,
               "   AND xmdcdocno = '",g_xmda.xmdadocno,"'",
               "   AND xmdcseq = ?"
   PREPARE s_aic_carry_xmdc_temp_pre_1 FROM g_sql

   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_xmdd_temp",   #170206-00013#1 mark
               "  FROM s_aic_xmdd_temp",         #170206-00013#1 add
               " WHERE xmddent = ",g_enterprise,
               "   AND xmdddocno = '",g_xmda.xmdadocno,"'",
               "   AND xmddseq = ?",
               "   AND xmddseq1 = ?",
               "   AND xmddseq2 = ?"
   PREPARE s_aic_carry_xmdd_temp_pre_1 FROM g_sql
   
   LET g_sql = "SELECT *",
              #"  FROM s_aic_carry_xmdf_temp",   #170206-00013#1 mark
               "  FROM s_aic_xmdf_temp",         #170206-00013#1 add
               " WHERE xmdfent = ",g_enterprise,
               "   AND xmdfdocno = '",g_xmda.xmdadocno,"'",
               "   AND xmdfseq = ?",
               "   AND xmdfseq2 = ?"
   PREPARE s_aic_carry_xmdf_temp_pre_1 FROM g_sql
   
  #170103-00002#1-s-add
   LET g_sql = " SELECT xmdc013 FROM xmdc_t ",
               "  WHERE xmdcent = ",g_enterprise,
               "    AND xmdcdocno = ? ",
               "    AND xmdcseq = ? " 
  PREPARE s_aic_carry_xmdc_pre2_1 FROM g_sql               
  #170103-00002#1-e-add

   #清空TEMP TABLE
   #170206-00013#1-(S)-mark
   #DELETE FROM s_aic_carry_xmdc_temp
   #DELETE FROM s_aic_carry_xmdd_temp
   #DELETE FROM s_aic_carry_xmdf_temp
   #170206-00013#1-(E)-mark
   #170206-00013#1-(S)-add
   DELETE FROM s_aic_xmdc_temp
   DELETE FROM s_aic_xmdd_temp
   DELETE FROM s_aic_xmdf_temp
   #170206-00013#1-(E)-add
   

   #將資料塞入temp table，並刪除原table資料
  #INSERT INTO s_aic_carry_xmdc_temp   #170206-00013#1 mark
   INSERT INTO s_aic_xmdc_temp         #170206-00013#1 add
   SELECT * FROM xmdc_t
    WHERE xmdcent = g_enterprise
      AND xmdcdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_xmdc_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #170105-00050#10-s-add
   #將預先的數量減回來
   IF NOT s_aic_carry_pre_so_upd('2',g_xmda.xmdasite,g_xmda.xmda031) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #170105-00050#10-e-add
   
   DELETE FROM xmdc_t
    WHERE xmdcent = g_enterprise
      AND xmdcdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM xmdc_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF
   
  #INSERT INTO s_aic_carry_xmdd_temp   #170206-00013#1 mark
   INSERT INTO s_aic_xmdd_temp         #170206-00013#1 add
   SELECT * FROM xmdd_t
    WHERE xmddent = g_enterprise
      AND xmdddocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_xmdd_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DELETE FROM xmdd_t
    WHERE xmddent = g_enterprise
      AND xmdddocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM xmdd_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF

  #INSERT INTO s_aic_carry_xmdf_temp   #170206-00013#1 mark
   INSERT INTO s_aic_xmdf_temp         #170206-00013#1 add
   SELECT * FROM xmdf_t
    WHERE xmdfent = g_enterprise
      AND xmdfdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT:s_aic_carry_xmdf_temp"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      
      LET r_success = FALSE
      RETURN r_success
   END IF

   DELETE FROM xmdf_t
    WHERE xmdfent = g_enterprise
      AND xmdfdocno = g_xmda.xmdadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "DELETE FROM xmdf_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
    
      LET r_success = FALSE
      RETURN r_success
   END IF

   FOREACH s_aic_carry_pmdn_cs1_1 INTO l_pmdn.pmdnseq,l_pmdn.pmdn001,l_pmdn.pmdn002,l_pmdn.pmdn004,l_pmdn.pmdn005,    #fcx-180328 add pmdn004,pmdn005
                                     l_pmdn.pmdn006,l_pmdn.pmdn007,l_pmdn.pmdn008,l_pmdn.pmdn009,l_pmdn.pmdn010,
                                     l_pmdn.pmdn011,l_pmdn.pmdn014,l_pmdn.pmdn015,
                                     l_pmdn.pmdn019,l_pmdn.pmdn020,l_pmdn.pmdn021,l_pmdn.pmdn022,l_pmdn.pmdn024,    #160902-00008#1 add pmdn020,pmdn021
                                     l_pmdn.pmdn025,l_pmdn.pmdn026,    #170824-00001#1 add
                                     l_pmdn.pmdn027,l_pmdn.pmdn028,l_pmdn.pmdn029,l_pmdn.pmdn030,                   #161107-00023#1 add pmdn027
                                     l_pmdn.pmdn031,l_pmdn.pmdn032,l_pmdn.pmdn033,l_pmdn.pmdn034,l_pmdn.pmdn035,
                                     l_pmdn.pmdn036,l_pmdn.pmdn037,l_pmdn.pmdn038,l_pmdn.pmdn039,
                                     l_pmdn.pmdn043,
                                     l_pmdn.pmdn046,l_pmdn.pmdn047,l_pmdn.pmdn048,
                                     l_pmdn.pmdn050, #170221-00029#2-add
                                     l_pmdn.pmdn053
                                    ,l_pmdn.pmdn060  #170105-00050#2-add
                                    ,l_pmdn.pmdnud001  #add by cz 20180607 #remark by xianggy 180621
                                    ,l_pmdn.pmdnud014   #add by hehw 200915
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH:s_aic_carry_pmdn_cs1_1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #塞xmdc_t
      INITIALIZE g_xmdc.* TO NULL
      
      #先塞入原本資料(變更前的資料)
      EXECUTE s_aic_carry_xmdc_temp_pre_1 USING l_pmdn.pmdnseq
      INTO g_xmdc.*
      
      LET g_xmdc.xmdcsite = g_xmda.xmdasite
      LET g_xmdc.xmdcdocno = g_xmda.xmdadocno
      LET g_xmdc.xmdcseq = l_pmdn.pmdnseq
     #LET g_xmdc.xmdc001 = l_pmdn.pmdn001  #cws 2017.12.28
        
      SELECT pmao004 INTO l_pmao004  FROM pmao_t,pmdl_t
       WHERE pmaoent = g_enterprise  AND pmao001 = pmdl004 AND pmao002 = l_pmdn.pmdn001 AND pmdldocno = p_pmdldocno AND pmao000 = '1'  #C20180912-07783  ADD AND pmao000 = '1' 
      #C180710-09421#3---add---s
      LET l_pmdl005 = ''
      SELECT pmdl005 INTO l_pmdl005
         FROM pmdl_t
         WHERE pmdlent = g_enterprise
         AND pmdldocno = p_pmdldocno
      IF l_pmdl005 = '2' THEN
      #C180710-09421#3---add---e
         IF cl_null(l_pmao004) THEN LET g_xmdc.xmdc001 = l_pmdn.pmdn001 ELSE LET g_xmdc.xmdc001 = l_pmao004 END IF
      #C180710-09421#3---add---S
      ELSE
         LET g_xmdc.xmdc001 = l_pmdn.pmdn001
      END IF  
      #C180710-09421#3---add---E
      LET g_xmdc.xmdc002 = l_pmdn.pmdn002
      
      #fcx-180328--str--
      LET g_xmdc.xmdc004 = l_pmdn.pmdn004
      LET g_xmdc.xmdc005 = l_pmdn.pmdn005
      #fcx-180328--str--  

      LET g_xmdc.xmdc006 = l_pmdn.pmdn006
      LET g_xmdc.xmdc007 = l_pmdn.pmdn007
      LET g_xmdc.xmdc008 = l_pmdn.pmdn008
      LET g_xmdc.xmdc009 = l_pmdn.pmdn009
      LET g_xmdc.xmdc010 = l_pmdn.pmdn010
      LET g_xmdc.xmdc011 = l_pmdn.pmdn011
      LET g_xmdc.xmdc012 = l_pmdn.pmdn014

      LET g_xmdc.xmdc016 = g_xmda.xmda011
      LET g_xmdc.xmdc017 = g_xmda.xmda012

      LET g_xmdc.xmdc015 = l_pmdn.pmdn015
      LET g_xmdc.xmdc043 = l_pmdn.pmdn043

      LET g_xmdc.xmdc019 = l_pmdn.pmdn019  #子件特性
     #160902-00008#1-s-mark
     #LET g_xmdc.xmdc020 = '1' #一般        #急料
     #LET g_xmdc.xmdc021 = 'N'              #保稅
     #160902-00008#1-e-mark
     #160902-00008#1-s-add
      LET g_xmdc.xmdc020 = l_pmdn.pmdn020   #急料
      LET g_xmdc.xmdc021 = l_pmdn.pmdn021   #保稅
     #160902-00008#1-e-add      
      LET g_xmdc.xmdc022 = l_pmdn.pmdn022   #部分交貨
      LET g_xmdc.xmdcunit = g_xmda.xmdasite
      LET g_xmdc.xmdcorga = g_xmda.xmdasite
      LET g_xmdc.xmdc023 = g_xmda.xmda004
      LET g_xmdc.xmdc024 = l_pmdn.pmdn024
      
      LET g_xmdc.xmdc025 = l_pmdn.pmdn025   #170824-00001#1 add
      LET g_xmdc.xmdc026 = l_pmdn.pmdn026   #170824-00001#1 add
      
     #LET g_xmdc.xmdc027 = g_xmdc.xmdc001   #161107-00023#1 mark
      LET g_xmdc.xmdc027 = l_pmdn.pmdn027   #161107-00023#1 add
     #LET g_xmdc.xmdc028 = l_pmdn.pmdn028   #限定庫位，不限制
     #LET g_xmdc.xmdc029 = l_pmdn.pmdn029   #限定儲位，不限制
      LET g_xmdc.xmdc030 = l_pmdn.pmdn030
      LET g_xmdc.xmdc031 = l_pmdn.pmdn031
      LET g_xmdc.xmdc032 = l_pmdn.pmdn032
      LET g_xmdc.xmdc033 = l_pmdn.pmdn033
      LET g_xmdc.xmdc034 = l_pmdn.pmdn034
      LET g_xmdc.xmdc035 = l_pmdn.pmdn035
      LET g_xmdc.xmdc036 = l_pmdn.pmdn036
      LET g_xmdc.xmdc037 = l_pmdn.pmdn037
      LET g_xmdc.xmdc038 = l_pmdn.pmdn038
      LET g_xmdc.xmdc039 = l_pmdn.pmdn039
      
      LET g_xmdc.xmdcud004 = l_pmdn.pmdnud001 #基板供应商 add by cz 20180607 #remark by xianggy 180621
      LET g_xmdc.xmdcud012 = l_pmdn.pmdnud014 #WEIGHT add by hehw 200915

      LET g_xmdc.xmdc044 = 0
      #取之前的状态值，若没有表示是新增项次，给1
      SELECT xmdc045,xmdc053 INTO g_xmdc.xmdc045,g_xmdc.xmdc053 FROM s_aic_xmdc_temp
       WHERE xmdcent = g_enterprise
         AND xmdcdocno = g_xmda.xmdadocno
         AND xmdcseq = g_xmdc.xmdcseq
      IF cl_null(g_xmdc.xmdc045) THEN
         LET g_xmdc.xmdc045 = '1'  #一般
      END IF

      LET g_xmdc.xmdc052 = 'N'
      LET g_xmdc.xmdc050 = l_pmdn.pmdn050 #170221-00029#2-add
      LET g_xmdc.xmdc057 = l_pmdn.pmdn053
      #add by jinfeng 180312--s
#      SELECT icaduc006 INTO  l_icaduc006  FROM icaduc_t 
#       WHERE icaducent = g_enterprise 
#         AND icaduc001 = g_icab.icab001 
#         AND icaduc003 = g_icab.icab002-1 
#         AND icaduc004 = l_pmdn.pmdn028							
      LET l_icaduc003 = ''
      SELECT icab002 INTO l_icaduc003 FROM icab_t
       WHERE icabent = g_enterprise
         AND icab001 = g_xmda.xmda050
         AND icab003 = g_site
      LET l_icaduc006 = ''
      SELECT icaduc006 INTO l_icaduc006 FROM icaduc_t 
       WHERE icaducent = g_enterprise 
         AND icaduc001 = g_xmda.xmda050
         AND icaduc003 = l_icaduc003
         AND icaduc004 = l_pmdn.pmdn028
      IF NOT cl_null(l_icaduc006) THEN							
         LET g_xmdc.xmdc028 = l_icaduc006         #库位							
      ELSE 									
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'cxm-00012'   #采购单收货库位为空或未找到对应的下站据点的库位
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE         
         CALL cl_err()    
         LET r_success = FALSE
         RETURN r_success							
      END IF							
      
      #add by jinfeng 180312--e
     #170103-00002 #1-s-add
      IF NOT cl_null(p_firstxmdadocno) THEN
         EXECUTE s_aic_carry_xmdc_pre2_1 USING p_firstxmdadocno,l_pmdn.pmdnseq INTO g_xmdc.xmdc013     
      END IF 
     #170103-00002 #1-e-add
      #取得未稅金額、税额、含稅金額
      CALL s_aic_carry_get_amount(g_xmdc.xmdcsite,g_xmdc.xmdcdocno,g_xmdc.xmdcseq,g_xmda.xmda015,g_xmdc.xmdc011,g_xmdc.xmdc015,g_xmdc.xmdc016)
      RETURNING r_success,g_xmdc.xmdc046,g_xmdc.xmdc048,g_xmdc.xmdc047

     IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
      #170105-00050#2-s-add
      #先判斷，來源是否為預先訂單
      IF g_aic_source MATCHES "[12]" THEN
         #取得對應的預先訂單單號
         SELECT xmdadocno INTO g_xmdc.xmdc055
           FROM xmda_t
          WHERE xmdaent  = g_enterprise
            AND xmdasite = g_xmda.xmdasite
            AND xmda031  = g_pre_aic
         LET g_xmdc.xmdc056 = l_pmdn.pmdn060
      END IF
      #170105-00050#2-s-add
      #C180824-07015#1 add----------S
      LET l_pmdp003=''
      LET l_pmdp004=''
      SELECT pmdp003,pmdp004 INTO l_pmdp003,l_pmdp004 FROM pmdp_t
       WHERE pmdpent = g_enterprise 
         AND pmdpdocno = p_pmdldocno
         AND pmdpseq = l_pmdn.pmdnseq
      SELECT xmdcud021,xmdcud001,xmdcud002,xmdcud003 INTO g_xmdc.xmdcud021,g_xmdc.xmdcud001,g_xmdc.xmdcud002,g_xmdc.xmdcud003 FROM xmdc_t  #C20180829-07783 add xmdcud001,xmdcud002,xmdcud003
       WHERE xmdcent = g_enterprise
         AND xmdcdocno = l_pmdp003
         AND xmdcseq = l_pmdp004
      #C180824-07015#1 add----------E
      
      INSERT INTO xmdc_t (xmdcent,xmdcsite,xmdcdocno,xmdcseq,
                          xmdc001,xmdc002,xmdc003,xmdc004,xmdc005,
                          xmdc006,xmdc007,xmdc008,xmdc009,xmdc010,
                          xmdc011,xmdc012,xmdc013,xmdc015,
                          xmdc016,xmdc017,xmdc019,xmdc020,
                          xmdc021,xmdc022,
                          xmdcunit,xmdcorga,
                          xmdc023,xmdc024,xmdc025,
                          xmdc026,xmdc027,xmdc028,xmdc029,xmdc030,
                          xmdc031,xmdc032,xmdc033,xmdc034,xmdc035,
                          xmdc036,xmdc037,xmdc038,xmdc039,xmdc040,
                          xmdc041,xmdc042,xmdc043,xmdc044,xmdc045,
                          xmdc046,xmdc047,xmdc048,xmdc049,xmdc050,
                          xmdc051,xmdc052,xmdc053,xmdc054,xmdc055,
                          xmdcud021, #C180824-07015#1 add  
                          xmdc056,xmdc057,xmdcud004,xmdcud012,        #add ,xmdcud004 by xianggy 180621   #add ,xmdcud012 by hehw 200915
                          xmdcud001,xmdcud002,xmdcud003)    #C20180829-07783 ADD
      VALUES (g_enterprise,g_xmdc.xmdcsite,g_xmdc.xmdcdocno,g_xmdc.xmdcseq,
              g_xmdc.xmdc001,g_xmdc.xmdc002,g_xmdc.xmdc003,g_xmdc.xmdc004,g_xmdc.xmdc005,
              g_xmdc.xmdc006,g_xmdc.xmdc007,g_xmdc.xmdc008,g_xmdc.xmdc009,g_xmdc.xmdc010,
              g_xmdc.xmdc011,g_xmdc.xmdc012,g_xmdc.xmdc013,g_xmdc.xmdc015,
              g_xmdc.xmdc016,g_xmdc.xmdc017,g_xmdc.xmdc019,g_xmdc.xmdc020,
              g_xmdc.xmdc021,g_xmdc.xmdc022,
              g_xmdc.xmdcunit,g_xmdc.xmdcorga,
              g_xmdc.xmdc023,g_xmdc.xmdc024,g_xmdc.xmdc025,
              g_xmdc.xmdc026,g_xmdc.xmdc027,g_xmdc.xmdc028,g_xmdc.xmdc029,g_xmdc.xmdc030,
              g_xmdc.xmdc031,g_xmdc.xmdc032,g_xmdc.xmdc033,g_xmdc.xmdc034,g_xmdc.xmdc035,
              g_xmdc.xmdc036,g_xmdc.xmdc037,g_xmdc.xmdc038,g_xmdc.xmdc039,g_xmdc.xmdc040,
              g_xmdc.xmdc041,g_xmdc.xmdc042,g_xmdc.xmdc043,g_xmdc.xmdc044,g_xmdc.xmdc045,
              g_xmdc.xmdc046,g_xmdc.xmdc047,g_xmdc.xmdc048,g_xmdc.xmdc049,g_xmdc.xmdc050,
              g_xmdc.xmdc051,g_xmdc.xmdc052,g_xmdc.xmdc053,g_xmdc.xmdc054,g_xmdc.xmdc055,
              g_xmdc.xmdcud021,  #C180824-07015#1 add
              g_xmdc.xmdc056,g_xmdc.xmdc057,g_xmdc.xmdcud004,g_xmdc.xmdcud012,      #add ,g_xmdc.xmdcud004 by xianggy 180621   #add xmdcud012 by hehw 200915
              g_xmdc.xmdcud001,g_xmdc.xmdcud002,g_xmdc.xmdcud003)  #C20180829-07783 ADD

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT:xmdc_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      OPEN s_aic_carry_pmdo_cs1_1 USING l_pmdn.pmdnseq
      FOREACH s_aic_carry_pmdo_cs1_1 INTO l_pmdo.pmdoseq1,l_pmdo.pmdoseq2,
                                        l_pmdo.pmdo001,l_pmdo.pmdo002,l_pmdo.pmdo003,l_pmdo.pmdo004,l_pmdo.pmdo005,
                                        l_pmdo.pmdo006,l_pmdo.pmdo007,l_pmdo.pmdo008,l_pmdo.pmdo009,l_pmdo.pmdo010,
                                        l_pmdo.pmdo011,l_pmdo.pmdo013,
                                        l_pmdo.pmdo022,
                                        l_pmdo.pmdo028,l_pmdo.pmdo029,l_pmdo.pmdo030,
                                        l_pmdo.pmdo031,l_pmdo.pmdo032,l_pmdo.pmdo033,l_pmdo.pmdo034
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH s_aic_carry_pmdo_cs1_1"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         #塞xmdd_t
         INITIALIZE g_xmdd.* TO NULL
         
         #先塞入原本資料(變更前的資料)
         EXECUTE s_aic_carry_xmdd_temp_pre_1 USING g_xmdc.xmdcseq,l_pmdo.pmdoseq1,l_pmdo.pmdoseq2
         INTO g_xmdd.*
         
         LET g_xmdd.xmddsite = g_xmda.xmdasite
         LET g_xmdd.xmdddocno = g_xmda.xmdadocno
         LET g_xmdd.xmddseq = g_xmdc.xmdcseq
         LET g_xmdd.xmddseq1 = l_pmdo.pmdoseq1
         LET g_xmdd.xmddseq2 = l_pmdo.pmdoseq2
         
         SELECT pmao004 INTO l_pmao004  FROM pmao_t,pmdl_t  #cws 2017.12.29
          WHERE pmaoent = g_enterprise  AND pmao001 = pmdl004 AND pmao002 = l_pmdo.pmdo001 AND pmdldocno = p_pmdldocno AND pmao000 = '1'  #C20181227-07783  ADD AND pmao000 = '1'
         #C180710-09421#3---add---s
         LET l_pmdl005 = ''
         SELECT pmdl005 INTO l_pmdl005
            FROM pmdl_t
            WHERE pmdlent = g_enterprise
            AND pmdldocno = p_pmdldocno
         IF l_pmdl005 = '2' THEN
         #C180710-09421#3---add---e
            IF cl_null(l_pmao004) THEN LET g_xmdd.xmdd001 = l_pmdo.pmdo001 ELSE LET g_xmdd.xmdd001 = l_pmao004 END IF
         #C180710-09421#3---add---S
         ELSE
            LET g_xmdd.xmdd001 = l_pmdo.pmdo001
         END IF
         #C180710-09421#3---add---e
        #LET g_xmdd.xmdd001 = l_pmdo.pmdo001
         LET g_xmdd.xmdd002 = l_pmdo.pmdo002
         LET g_xmdd.xmdd003 = l_pmdo.pmdo003
         LET g_xmdd.xmdd004 = l_pmdo.pmdo004
         LET g_xmdd.xmdd005 = l_pmdo.pmdo005
         LET g_xmdd.xmdd006 = l_pmdo.pmdo006
         LET g_xmdd.xmdd007 = l_pmdo.pmdo007
         LET g_xmdd.xmdd008 = l_pmdo.pmdo008
         LET g_xmdd.xmdd009 = l_pmdo.pmdo009
         LET g_xmdd.xmdd010 = l_pmdo.pmdo010
         LET g_xmdd.xmdd011 = l_pmdo.pmdo011
         LET g_xmdd.xmdd012 = l_pmdo.pmdo013
         LET g_xmdd.xmdd013 = 'N'
         LET g_xmdd.xmdd017 = '2'            #170317-00044#1 add
         
         LET g_xmdd.xmdd018 = l_pmdo.pmdo022
         LET g_xmdd.xmdd019 = g_xmdc.xmdc016
         LET g_xmdd.xmdd020 = g_xmdc.xmdc017

         LET g_xmdd.xmdd024 = l_pmdo.pmdo028
         LET g_xmdd.xmdd025 = l_pmdo.pmdo029
         LET g_xmdd.xmdd026 = l_pmdo.pmdo030
         LET g_xmdd.xmdd027 = l_pmdo.pmdo031
         #xmddud001,xmddud011,xmddud012,xmddud013,xmdd032,xmdd011,xmdd009 在原来的基础上变化
         #xmdd014 xmdd015 xmdd016 xmdd031 xmdd034 xmdd035不变
         LET l_cnt = 0 
         SELECT COUNT(*) INTO l_cnt FROM s_aic_xmdd_temp         #170206-00013#1 add
          WHERE xmddent = g_enterprise
            AND xmdddocno = g_xmda.xmdadocno
            AND xmddseq = g_xmdd.xmddseq
          
         IF l_cnt = 0 THEN
            LET g_xmdd.xmddud001 = 'N'
            LET g_xmdd.xmddud011 = 0
            LET g_xmdd.xmddud012 = g_xmdd.xmdd006
            LET g_xmdd.xmddud013 = 0
            #已出貨數量
            IF cl_null(g_xmdd.xmdd014) THEN
               LET g_xmdd.xmdd014 = 0
            END IF
            
            #已銷退數量
            IF cl_null(g_xmdd.xmdd015) THEN
               LET g_xmdd.xmdd015 = 0
            END IF
            
            #銷退換貨數量
            IF cl_null(g_xmdd.xmdd016) THEN
               LET g_xmdd.xmdd016 = 0
            END IF
          
            #已轉出通數量
            IF cl_null(g_xmdd.xmdd031) THEN
               LET g_xmdd.xmdd031 = 0
            END IF
            
            #備置量
            IF cl_null(g_xmdd.xmdd032) THEN
               LET g_xmdd.xmdd032 = 0
            END IF
            
            #已簽退量
            IF cl_null(g_xmdd.xmdd034) THEN
               LET g_xmdd.xmdd034 = 0
            END IF
            
            #已分配量
            IF cl_null(g_xmdd.xmdd035) THEN
               LET g_xmdd.xmdd035 = 0
            END IF            
         ELSE
            LET l_xmddud001 = ''
            LET l_xmddud011 = 0
            LET l_xmddud012 = 0
            LET l_xmddud013 = 0
            LET l_xmdd032 = 0
            LET l_xmdd011 = ''
            LET l_xmdd009 = ''
            LET l_xmdd014 = 0
            LET l_xmdd015 = 0
            LET l_xmdd016 = 0
            LET l_xmdd031 = 0
            LET l_xmdd034 = 0
            LET l_xmdd035 = 0
            LET l_xmdd006 = 0
            SELECT xmddud001,xmddud011,xmddud012,xmddud013,xmdd032,xmdd011,
                   xmdd009,xmdd014,xmdd015,xmdd016,xmdd031,xmdd034,xmdd035,
                   xmdd006
              INTO l_xmddud001,l_xmddud011,l_xmddud012,l_xmddud013,l_xmdd032,l_xmdd011,
                   l_xmdd009,l_xmdd014,l_xmdd015,l_xmdd016,l_xmdd031,l_xmdd034,l_xmdd035,
                   l_xmdd006
              FROM s_aic_xmdd_temp         #170206-00013#1 add
             WHERE xmddent = g_enterprise
               AND xmdddocno = g_xmda.xmdadocno
               AND xmddseq = g_xmdd.xmddseq
            #下面根据数量、仓库等的变更，调整预扣量、欠料量、仓库            
            #因为可能更库位的时候，订单已经进行了一部分（比如批次计划、出货等），这里状态码、备货量、备置量什么的都不变--s
            LET l_xmdc028_new = ''
            LET l_xmdc028_old = ''
            SELECT xmdc028 INTO l_xmdc028_new FROM xmdc_t 
             WHERE xmdcent = g_enterprise
               AND xmdcdocno = g_xmda.xmdadocno
               AND xmdcseq = g_xmdd.xmddseq
            SELECT xmdc028 INTO l_xmdc028_old FROM s_aic_xmdc_temp         #170206-00013#1 add
             WHERE xmdcent = g_enterprise
               AND xmdcdocno = g_xmda.xmdadocno
               AND xmdcseq = g_xmdd.xmddseq
            IF l_xmdc028_new <> l_xmdc028_old THEN 
               LET g_xmdd.xmddud001 = l_xmddud001   
               LET g_xmdd.xmddud011 = 0
               LET g_xmdd.xmddud012 = l_xmddud012 + l_xmddud011 + g_xmdd.xmdd006 - l_xmdd006
               LET g_xmdd.xmddud013 = l_xmddud013
               LET g_xmdd.xmdd032 = l_xmdd032
               LET g_xmdd.xmdd011 = l_xmdd011
               LET g_xmdd.xmdd009 = l_xmdd009  
               #数据准确性检查
               IF g_xmdd.xmddud011 + g_xmdd.xmddud012 + g_xmdd.xmddud013 + g_xmdd.xmdd032 <> g_xmdd.xmdd006 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.replace[1] = g_xmda.xmdadocno
                  LET g_errparam.replace[2] = g_xmdd.xmddseq
                  LET g_errparam.replace[3] = g_xmdd.xmddud011   
                  LET g_errparam.replace[4] = g_xmdd.xmddud012 
                  LET g_errparam.replace[5] = g_xmdd.xmddud013
                  LET g_errparam.replace[6] = g_xmdd.xmdd032
                  LET g_errparam.replace[7] = g_xmdd.xmdd006                
                  LET g_errparam.code   = 'cxm-00045'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()                
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF
            ELSE            
               LET g_xmdd.xmddud001 = l_xmddud001   
               LET g_xmdd.xmddud011 = l_xmddud011
               LET g_xmdd.xmddud012 = l_xmddud012
               LET g_xmdd.xmddud013 = l_xmddud013
               LET g_xmdd.xmdd032 = l_xmdd032
               LET g_xmdd.xmdd011 = l_xmdd011
               LET g_xmdd.xmdd009 = l_xmdd009               
            END IF
            IF g_xmdd.xmdd006 > l_xmdd006 AND l_xmdc028_new = l_xmdc028_old THEN 
               LET g_xmdd.xmddud001 = l_xmddud001   
               LET g_xmdd.xmddud011 = l_xmddud011
               LET g_xmdd.xmddud012 = l_xmddud012 + g_xmdd.xmdd006 - l_xmdd006
               LET g_xmdd.xmddud013 = l_xmddud013
               LET g_xmdd.xmdd032 = l_xmdd032
               LET g_xmdd.xmdd011 = l_xmdd011
               LET g_xmdd.xmdd009 = l_xmdd009  
               #数据准确性检查
               IF g_xmdd.xmddud011 + g_xmdd.xmddud012 + g_xmdd.xmddud013 + g_xmdd.xmdd032 <> g_xmdd.xmdd006 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.replace[1] = g_xmda.xmdadocno
                  LET g_errparam.replace[2] = g_xmdd.xmddseq
                  LET g_errparam.replace[3] = g_xmdd.xmddud011   
                  LET g_errparam.replace[4] = g_xmdd.xmddud012 
                  LET g_errparam.replace[5] = g_xmdd.xmddud013
                  LET g_errparam.replace[6] = g_xmdd.xmdd032
                  LET g_errparam.replace[7] = g_xmdd.xmdd006                
                  LET g_errparam.code   = 'cxm-00045'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()                
                  LET r_success = FALSE
                  CONTINUE FOREACH
               END IF               
            END IF 
            IF g_xmdd.xmdd006 < l_xmdd006 AND l_xmdc028_new = l_xmdc028_old THEN 
               LET l_due = l_xmdd006 - g_xmdd.xmdd006
               #优先扣减欠料量
               IF l_due <= l_xmddud012 THEN 
                  LET g_xmdd.xmddud001 = l_xmddud001   
                  LET g_xmdd.xmddud011 = l_xmddud011
                  LET g_xmdd.xmddud012 = l_xmddud012 - l_due
                  LET g_xmdd.xmddud013 = l_xmddud013
                  LET g_xmdd.xmdd032 = l_xmdd032
                  LET g_xmdd.xmdd011 = l_xmdd011
                  LET g_xmdd.xmdd009 = l_xmdd009   
                  #数据准确性检查
                  IF g_xmdd.xmddud011 + g_xmdd.xmddud012 + g_xmdd.xmddud013 + g_xmdd.xmdd032 <> g_xmdd.xmdd006 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.replace[1] = g_xmda.xmdadocno
                     LET g_errparam.replace[2] = g_xmdd.xmddseq
                     LET g_errparam.replace[3] = g_xmdd.xmddud011   
                     LET g_errparam.replace[4] = g_xmdd.xmddud012 
                     LET g_errparam.replace[5] = g_xmdd.xmddud013
                     LET g_errparam.replace[6] = g_xmdd.xmdd032
                     LET g_errparam.replace[7] = g_xmdd.xmdd006                
                     LET g_errparam.code   = 'cxm-00045'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()                
                     LET r_success = FALSE
                     CONTINUE FOREACH
                  END IF                  
               ELSE
                  LET g_xmdd.xmddud001 = l_xmddud001   
                  LET g_xmdd.xmddud011 = l_xmddud011 - l_due + l_xmddud012
                  LET g_xmdd.xmddud012 = 0
                  LET g_xmdd.xmddud013 = l_xmddud013
                  LET g_xmdd.xmdd032 = l_xmdd032
                  LET g_xmdd.xmdd011 = l_xmdd011
                  LET g_xmdd.xmdd009 = l_xmdd009  
                  #数据准确性检查
                  IF g_xmdd.xmddud011 + g_xmdd.xmddud012 + g_xmdd.xmddud013 + g_xmdd.xmdd032 <> g_xmdd.xmdd006 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.replace[1] = g_xmda.xmdadocno
                     LET g_errparam.replace[2] = g_xmdd.xmddseq
                     LET g_errparam.replace[3] = g_xmdd.xmddud011   
                     LET g_errparam.replace[4] = g_xmdd.xmddud012 
                     LET g_errparam.replace[5] = g_xmdd.xmddud013
                     LET g_errparam.replace[6] = g_xmdd.xmdd032
                     LET g_errparam.replace[7] = g_xmdd.xmdd006                
                     LET g_errparam.code   = 'cxm-00045'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()                
                     LET r_success = FALSE
                     CONTINUE FOREACH
                  END IF                   
               END IF                   
            END IF
         END IF
          #C20190505-07783---E             
          #C20180627-07783--因为可能更库位的时候，订单已经进行了一部分（比如批次计划、出货等），这里状态码、备货量、备置量什么的都不变--e                       
#           #已出貨數量
#           IF cl_null(g_xmdd.xmdd014) THEN
#              LET g_xmdd.xmdd014 = 0
#           END IF
#           
#           #已銷退數量
#           IF cl_null(g_xmdd.xmdd015) THEN
#              LET g_xmdd.xmdd015 = 0
#           END IF
#           
#           #銷退換貨數量
#           IF cl_null(g_xmdd.xmdd016) THEN
#              LET g_xmdd.xmdd016 = 0
#           END IF
#         
#           #已轉出通數量
#           IF cl_null(g_xmdd.xmdd031) THEN
#              LET g_xmdd.xmdd031 = 0
#           END IF
#           
#           #備置量
#           IF cl_null(g_xmdd.xmdd032) THEN
#              LET g_xmdd.xmdd032 = 0
#           END IF
#           
#           #已簽退量
#           IF cl_null(g_xmdd.xmdd034) THEN
#              LET g_xmdd.xmdd034 = 0
#           END IF
#           
#           #已分配量
#           IF cl_null(g_xmdd.xmdd035) THEN
#              LET g_xmdd.xmdd035 = 0
#           END IF
         #取得未稅金額、含稅金額、稅額
         CALL s_aic_carry_tax1(g_xmdd.xmddsite,g_xmdd.xmdd027,g_xmdd.xmdd018,g_xmdd.xmdd019,g_xmda.xmda015,g_xmda.xmda016)
         RETURNING g_xmdd.xmdd028,g_xmdd.xmdd029,g_xmdd.xmdd030      
         INSERT INTO xmdd_t (xmddent,xmddsite,
                             xmdddocno,xmddseq,xmddseq1,xmddseq2,
                             xmdd001,xmdd002,xmdd003,xmdd004,xmdd005,
                             xmdd006,xmdd007,xmdd008,xmdd009,xmdd010,
                             xmdd011,xmdd012,xmdd013,xmdd014,xmdd015,
                             xmdd016,xmdd017,xmdd018,xmdd019,xmdd020,
                             xmdd021,xmdd022,xmdd023,xmdd024,xmdd025,
                             xmdd026,xmdd027,xmdd028,xmdd029,xmdd030,
                             xmdd031,xmdd032,xmdd033,xmdd034,xmdd035,
                             xmddud001,xmddud012,xmddud011,xmddud013)   
         VALUES (g_enterprise,g_xmdd.xmddsite,
                 g_xmdd.xmdddocno,g_xmdd.xmddseq,g_xmdd.xmddseq1,g_xmdd.xmddseq2,
                 g_xmdd.xmdd001,g_xmdd.xmdd002,g_xmdd.xmdd003,g_xmdd.xmdd004,g_xmdd.xmdd005,
                 g_xmdd.xmdd006,g_xmdd.xmdd007,g_xmdd.xmdd008,g_xmdd.xmdd009,g_xmdd.xmdd010,
                 g_xmdd.xmdd011,g_xmdd.xmdd012,g_xmdd.xmdd013,g_xmdd.xmdd014,g_xmdd.xmdd015,
                 g_xmdd.xmdd016,g_xmdd.xmdd017,g_xmdd.xmdd018,g_xmdd.xmdd019,g_xmdd.xmdd020,
                 g_xmdd.xmdd021,g_xmdd.xmdd022,g_xmdd.xmdd023,g_xmdd.xmdd024,g_xmdd.xmdd025,
                 g_xmdd.xmdd026,g_xmdd.xmdd027,g_xmdd.xmdd028,g_xmdd.xmdd029,g_xmdd.xmdd030,
                 g_xmdd.xmdd031,g_xmdd.xmdd032,g_xmdd.xmdd033,g_xmdd.xmdd034,g_xmdd.xmdd035,
                 g_xmdd.xmddud001,g_xmdd.xmddud012,g_xmdd.xmddud011,g_xmdd.xmddud013)  
                 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:xmdd_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF
         #170105-00050#5-s-mark
         ##170105-00050#2-s-add
         ##先判斷，來源是否為預先訂單
         #IF g_aic_source MATCHES "[12]" THEN
         #   #取得前一張單回寫的數量
         #   SELECT DISTINCT pmdo015 INTO l_pmdo015
         #     FROM pmdl_t,pmdo_t
         #    WHERE pmdlent = pmdoent          AND pmdldocno = pmdodocno 
         #      AND pmdlent = g_enterprise     AND pmdl031 = g_pre_aic
         #      AND pmdoseq = g_xmdc.xmdc056   #以單身來源項次為準
         #      AND pmdoseq1 = g_xmdd.xmddseq1 AND pmdoseq2 = g_xmdd.xmddseq2
         #    ORDER BY pmdo015 DESC               
         #   #將數量，回寫至對應的預先訂單   
         #   UPDATE xmdd_t SET xmdd014 = l_pmdo015 #已出貨量
         #    WHERE xmddent = g_enterprise AND xmddseq = g_xmdc.xmdc056   #以單身來源項次為準
         #      AND xmddseq1 = g_xmdd.xmddseq1 AND xmddseq2 = g_xmdd.xmddseq2
         #      AND xmdddocno = (SELECT xmdadocno FROM xmda_t WHERE xmdaent = g_enterprise
         #                          AND xmdasite = g_xmdd.xmddsite  AND xmda031 = g_pre_aic)
         #   IF SQLCA.sqlcode THEN
         #      INITIALIZE g_errparam TO NULL
         #      LET g_errparam.extend = "UPDATE:xmdd_t"
         #      LET g_errparam.code   = SQLCA.sqlcode
         #      LET g_errparam.popup  = TRUE
         #      CALL cl_err()
         #  
         #      LET r_success = FALSE
         #      EXIT FOREACH
         #   END IF
         #END IF
         ##170105-00050#2-e-add
         #170105-00050#5-e-mark
      END FOREACH

      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      OPEN s_aic_carry_pmdq_cs_1 USING l_pmdn.pmdnseq
      FOREACH s_aic_carry_pmdq_cs_1 INTO l_pmdq.pmdqseq2,
                                       l_pmdq.pmdq002,l_pmdq.pmdq003,l_pmdq.pmdq004,l_pmdq.pmdq005,
                                       l_pmdq.pmdq006,l_pmdq.pmdq007,l_pmdq.pmdq008
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "FOREACH s_aic_carry_pmdq_cs_1"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()         

            LET r_success = FALSE
            EXIT FOREACH
         END IF

         #塞xmdf_t
         INITIALIZE g_xmdf.* TO NULL
         
         #先塞入原本資料(變更前的資料)
         EXECUTE s_aic_carry_xmdf_temp_pre_1 USING g_xmdc.xmdcseq,l_pmdq.pmdqseq2
         INTO g_xmdf.*
         
         LET g_xmdf.xmdfsite = g_xmda.xmdasite
         LET g_xmdf.xmdfdocno = g_xmda.xmdadocno
         LET g_xmdf.xmdfseq = g_xmdc.xmdcseq

         LET g_xmdf.xmdfseq2 = l_pmdq.pmdqseq2
         LET g_xmdf.xmdf002 = l_pmdq.pmdq002
         #xmdf003,xmdf007与变更前一致
         IF cl_null(g_xmdf.xmdf003) THEN
            LET g_xmdf.xmdf003 = l_pmdq.pmdq003
         END IF
         LET g_xmdf.xmdf004 = l_pmdq.pmdq004
         LET g_xmdf.xmdf005 = l_pmdq.pmdq006
         LET g_xmdf.xmdf006 = l_pmdq.pmdq007
         IF cl_null(g_xmdf.xmdf007) THEN
            LET g_xmdf.xmdf007 = l_pmdq.pmdq008
         END IF
         
         INSERT INTO xmdf_t (xmdfent,xmdfsite,
                             xmdfdocno,xmdfseq,xmdfseq2,
                             xmdf002,xmdf003,xmdf004,xmdf005,
                             xmdf006,xmdf007)
         VALUES (g_enterprise,g_xmdf.xmdfsite,
                 g_xmdf.xmdfdocno,g_xmdf.xmdfseq,g_xmdf.xmdfseq2,
                 g_xmdf.xmdf002,g_xmdf.xmdf003,g_xmdf.xmdf004,g_xmdf.xmdf005,
                 g_xmdf.xmdf006,g_xmdf.xmdf007)
                 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "INSERT:xmdf_t"
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()

            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH

      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      
   END FOREACH
   
   #170105-00050#5-s-add
   #先判斷，來源是否為預先訂單
   IF g_aic_source MATCHES "[12]" AND r_success THEN
      #更新預先訂單的資料
      CALL s_aic_carry_pre_so_upd('1',g_xmda.xmdasite,g_xmda.xmda031) RETURNING r_success
       IF NOT r_success THEN
          RETURN r_success
       END IF
   END IF
   #170105-00050#5-e-add
      
   IF NOT r_success THEN
      RETURN r_success
   ELSE
      CALL s_aic_carry_return_amount(g_xmda.xmdadocno)
      RETURNING g_xmda.xmda041,g_xmda.xmda043,g_xmda.xmda042

      UPDATE xmda_t
         SET xmda041 = g_xmda.xmda041,
             xmda043 = g_xmda.xmda043,
             xmda042 = g_xmda.xmda042
       WHERE xmdaent = g_enterprise
         AND xmdadocno = g_xmda.xmdadocno
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE:xmda_t"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success
      END IF   
            
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20190514 By 07783
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_mod_po3(p_pmeedocno,p_pmee900,p_upd_all)
   DEFINE p_pmeedocno         LIKE pmee_t.pmeedocno
   DEFINE p_pmee900           LIKE pmee_t.pmee900
   DEFINE p_upd_all           LIKE type_t.chr1
   DEFINE r_success           LIKE type_t.num5
                              
   DEFINE l_pmdl006           LIKE pmdl_t.pmdl006 
   DEFINE l_pmdl051           LIKE pmdl_t.pmdl051
   DEFINE l_pmdl031           LIKE pmdl_t.pmdl031   
   DEFINE l_icab002           LIKE icab_t.icab002
   DEFINE l_icab003           LIKE icab_t.icab003
   DEFINE l_icab002_next      LIKE icab_t.icab002
   DEFINE l_icab003_next      LIKE icab_t.icab003
   DEFINE l_pmdldocno         LIKE pmdl_t.pmdldocno
   DEFINE l_xmdadocno         LIKE xmda_t.xmdadocno
   
   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
      
   #檢查:應在事物中的
   IF NOT s_transaction_chk('Y','0') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF   

  #170816-00007#31 -S mark
  #IF cl_null(p_pmeedocno) OR
  #   cl_null(p_pmee900) THEN
  #   
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "s_aic_carry_mod_po"
  #   LET g_errparam.code   = "sub-268"  #傳入參數為空!
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #
  #   LET r_success = FALSE
  #   RETURN r_success
  #END IF
  #170816-00007#31 -E mark
  
  #170816-00007#31 -S add
  #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_pmeedocno) THEN
      CALL s_azzi902_get_gzzd("apmr510","lbl_pmeedocno") RETURNING g_colname_1,g_comment_1   #採購變更單號
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_pmee900) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("afat511","lbl_fabp008") RETURNING g_colname_1,g_comment_1   #變更序
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
      RETURN r_success
   END IF
  #170816-00007#31 -E add
   
   IF cl_null(p_upd_all) THEN
      LET p_upd_all = 'N'
   END IF   

   #SELECT採購單資料
   LET l_pmdl006 = ''  #多角性質
   LET l_pmdl051 = ''  #多角流程代碼
   LET l_pmdl031 = ''  #多角序號
   SELECT pmdl006,pmdl051,pmdl031
     INTO l_pmdl006,l_pmdl051,l_pmdl031
     FROM pmdl_t
    WHERE pmdlent = g_enterprise
      AND pmdldocno = p_pmeedocno

   #當站多角貿易營運據點
   LET g_sql = "SELECT icab002,icab003",
               "  FROM icab_t",
               " WHERE icabent = '",g_enterprise,"'",
               "   AND icab001 = '",l_pmdl051,"'",
               " ORDER BY icab002"
   PREPARE s_aic_carry_icab_pre2_1 FROM g_sql
   DECLARE s_aic_carry_icab_cs2_1 CURSOR FOR s_aic_carry_icab_pre2_1

   #下站多角貿易營運據點
   LET g_sql = "SELECT icab002,icab003",
               "  FROM icab_t",
               " WHERE icabent = '",g_enterprise,"'",
               "   AND icab001 = '",l_pmdl051,"'",
               "   AND icab002 > ?",
               " ORDER BY icab002"
   PREPARE s_aic_carry_icab_next_pre2_1 FROM g_sql
   DECLARE s_aic_carry_icab_next_cs2_1 SCROLL CURSOR FOR s_aic_carry_icab_next_pre2_1

   LET l_icab002 = ''
   LET l_icab003 = ''
   LET l_xmdadocno = ''
   LET l_pmdldocno = p_pmeedocno
   FOREACH s_aic_carry_icab_cs2_1 INTO l_icab002,l_icab003
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "FOREACH s_aic_carry_icab_cs2_1"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #取下站
      LET l_icab002_next = ''
      LET l_icab003_next = ''
      OPEN s_aic_carry_icab_next_cs2_1 USING l_icab002
      FETCH FIRST s_aic_carry_icab_next_cs2_1 INTO l_icab002_next,l_icab003_next
      
      #若為第0站
      IF l_icab002 = 0 THEN         
         CONTINUE FOREACH
      ELSE
         IF NOT cl_null(l_icab002_next) THEN #中間站
            #UPDATE訂單
            CALL s_aic_carry_tri_so_upd(l_pmdldocno,'',l_pmdl031,l_icab003)
            RETURNING r_success,l_xmdadocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            #UPDATE採購單
            CALL s_aic_carry_tri_po_upd(l_xmdadocno,p_pmeedocno,l_pmdl031,l_icab003,'',l_icab003_next)
            RETURNING r_success,l_pmdldocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            IF p_upd_all = 'Y' THEN
               #出通/出貨/簽收/Invoice的UPDATE
               CALL s_axmt510_upd(l_xmdadocno,p_pmeedocno,p_pmee900,'2') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
               
               #收貨/入庫的UPDATE
               CALL s_apmt510_upd(l_pmdldocno,p_pmeedocno,p_pmee900,'1') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
            END IF
                     
         ELSE #最終站
            #UPDATE訂單
#            CALL s_aic_carry_tri_so_upd(l_pmdldocno,'',l_pmdl031,l_icab003)  C20190514-07783 MARK
            CALL s_aic_carry_tri_so_upd3(l_pmdldocno,'',l_pmdl031,l_icab003,p_pmee900) #C20190514-07783 ADD
            RETURNING r_success,l_xmdadocno
            IF NOT r_success THEN
               EXIT FOREACH
            END IF
            
            #代採購指定最終供應商
            IF l_pmdl006 = '3' THEN
               #UPDATE最終採購單
               CALL s_aic_carry_last_po_upd(l_xmdadocno,p_pmeedocno,l_pmdl031,l_icab003)
               RETURNING r_success,l_pmdldocno
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
            END IF

            IF p_upd_all = 'Y' THEN
               #出通/出貨/簽收/Invoice的UPDATE
               CALL s_axmt510_upd(l_xmdadocno,p_pmeedocno,p_pmee900,'2') RETURNING r_success
               IF NOT r_success THEN
                  EXIT FOREACH
               END IF
               
               #代採購指定最終供應商
               IF l_pmdl006 = '3' THEN
                  #收貨/入庫的UPDATE
                  CALL s_apmt510_upd(l_pmdldocno,p_pmeedocno,p_pmee900,'1') RETURNING r_success
                  IF NOT r_success THEN
                     EXIT FOREACH
                  END IF
               END IF
            END IF
         END IF
      END IF
      
   END FOREACH
   
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 多角工单检查工单单身的作业编号是否存在为空，若存在为空，则更新为单身其他项的作业编号
# Memo...........:
# Usage..........: CALL s_aic_carry_upd_sfba003()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 190628 By 06857
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aic_carry_upd_sfba003()
   DEFINE r_success     LIKE type_t.num5
   
   LET r_success = TRUE 
   
   UPDATE sfba_t SET sfba003 = ( SELECT DISTINCT sfba003 FROM sfba_t WHERE sfbaent = g_enterprise AND sfbadocno = g_sfaa.sfaadocno )
    WHERE sfbaent = g_enterprise
      AND sfbadocno = g_sfaa.sfaadocno
      AND ( sfba003 = ' ' OR sfba003 IS NULL )
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "s_aic_carry_upd_sfba003() UPDATE:sfba_t"
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

 
{</section>}
 
