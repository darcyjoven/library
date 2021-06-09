#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axcq200.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:52(2020-02-15 12:01:41), PR版次:0052(2021-05-17 10:37:42)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000323
#+ Filename...: axcq200
#+ Description: 發出商品進銷存查詢作業
#+ Creator....: 00768(2015-10-26 16:29:27)
#+ Modifier...: 12133 -SD/PR- 01996
 
{</section>}
 
{<section id="axcq200.global" type="s" >}
#應用 q04 樣板自動產生(Version:47)
#add-point:填寫註解說明 name="global.memo"
#160706-00021#1   16/07/04  By 02097    增加【發出商品科目】xckc005
#160919-00081#1   16/09/22  By 02040    本期無任何異動明細(xckb_t)時，彙總頁箋也需顯示期初數據(xckc_t)
#160926-00014#1   16/09/26  By 02040    輸入條件後，若查不到資料，畫面會直接關閉
#160802-00020#7   16/10/06  By shiun    增加帳套權限管控、法人權限管控
#160921-00010#1   17/01/19  By xujing   切换据点以后单头栏位重新预设
#170220-00032#3   17/02/23  By xujing   汇总页签增加出货单号+项次
#170307-00017#1   17/03/13  By fionchen 調整匯總轉出金額小計總計加總錯誤與數量無加總問題
#170323-00072#1   17/03/24  By 02295    明细单身抓取数据时关联xckc的KEY加上xckc205  xckc205 
#170328-00094#1   17/03/29  By fionchen 修正明細資料頁籤筆數與明細(本位幣二)頁籤筆數不同問題
#170325-00086#1   17/03/29  By fionchen 若根据【发出商品科目】查询时，若无匹配数据，右边的单头资料也不需显示。
#170327-00055#1   17/03/31  By 01531    查询时，如果条件都为空，会将没有账套权限的资料都查询出来。
#170323-00073#1   17/04/01  By 08734    在查詢欄位加上[來源]、[方向]
#170421-00022#1   17/05/16  By 08734    调整打开程式后没点执行就报错问题
#170427-00041#5   17/05/16  By 08734    axcq查询作业，取平均值、小计及总计等再计算栏位的金额取位，需按照aooi150处的【成本金额小数字数】栏位的设置取位
#170310-00068#3   17/06/19  By 09256    增加二次查詢功能
#170614-00002#1   17/07/05  By zhaoqya  优化sql，库位储位名称放主sql抓
#170725-00076#6   17/08/17  By 10046    調整當月出貨，當月未開票時，轉出數量為NULL值，造成匯總異常
#170822-00009#1   17/08/29  BY 09042    单头汇总条件为客户时，小计用客户
#171212-00022#1   17/12/13  By 08734    还原#170822-00009#1单修改的内容
#170626-00018#1   18/01/22  By 10046    (1)規格修改標籤名稱：銷售單位→基礎單位 (2)當xckb001(資料來源)為1、2、3時，數量改抓取xcck201欄位值
#                                       (3)xckb013改抓imaa_t的基礎單位 (4)當基礎單位不等於銷售單位時，銷售單位會依轉換率換算成基礎數量
#170618-00439#1   18/03/27  By 10046    單身增加"未開票明細"頁籤，並做查詢的邏輯處理
#180320-00047#2   18/04/19  By 10500    据点切换后，预设值要重新带值
#180428-00018#1   18/05/08  By 02295    xckc_t增加据点栏位
#180919-00042#1   18/09/21  By 02111    [未開票明細] 銷退單小於 0 也要顯示。
#181126-00029#1   18/11/27  By 05423    修正开窗未控管帐套权限的问题
#181128-00016#1   18/12/20  By 09767    左边查询条件[特性]栏位开窗
#181129-00060#1   18/12/29  By 11384    1.重写axcq200_ui_dialog(),使得'P''N''L'等字母输入时，不会触发快捷键
#                                       2.[明细数据]与[汇总数据]里的栏位名称“xx-委外”改成“xx-加工”
#190106-00003#1   19/01/11  By 02295    汇总页签中成本分群,抓不到axci120的中的资料时,改抓aimm207的成本分群
#190124-00004#1   19/01/29  By 02295    基础单位和数量抓取xckb020和xckb021
#190311-00014#1   19/03/18  By 02295    抓取未开票数据中的SQL,先抓取所有的资料,再按分组做合计,因为存在分组栏位字段一样,数量一样,其他的字段有不一样的,这样SQL中加入DISTINCT就会少抓取资料,故将DSITINCT去掉 
#190322-00021#1   19/03/25  By 10500    修正查询多期资料，无法翻页的问题
#190329-00026#1   19/05/07  By 10500    【明细数据】页签所有栏位增加筛选功能
#190620-00009#1   19/06/24  By 02295    销退单数量在axcp200计算的时候就会计算成负数,axcq200不用再特意乘以-1了
#190628-00043#3   19/07/15  By 07423    axcq200的查詢條件增加一QBE欄位「出貨單號」
#191108-00002#4   20/02/15  By 12133    畫面"特性"改為"產品特徵"，依照參數S-FIN-6013顯隱
#180720-00020#1   20/03/13  By 02295    未开票明细页签销售单价换算成本位币的单价
#191224-00020#2   20/03/13  By 02295    效能优化
#190624-00019#1   20/04/30  By 11892    二次筛选后清空二次筛选条件,参考aglq713筛选效果
#                                       #180720-00020#1中报错未汇总,有多次弹窗，要不停点确定
#191113-00049#1   20/05/08  By 11515    效能优化
#201028-00008#1   20/10/30  By 02295    191113-00049#1效能优化部分,导致未开票明细数量翻倍,因为xckb_t表的关联条件不足
#201030-00027#8   20/11/30  By 05423    当走签收流程，但依出货认列发出商品[S-FIN-9029]='Y'时，隐藏未开票明细
#201109-00009#10  20/12/28  By 14586    模糊查詢功能，將使用者輸入的字串自動補入*\
#210104-00025#1   21/01/04  By 01996    1.修正当汇总条件是2时没有where条件的问题
#                                       2.修正191224-00020关联inaml_t条件错误的问题
#201109-00009#92  21/01/20  By 14586    模糊查詢功能，將使用者輸入的字串自動補入*
#210506-00027#1   21/05/08  By 01996    调整因201028-00008导致 未开票明细只能查询到出货明细,查不到销退明细.
#210511-00015#1   21/05/17  By 01996    调用s_fin_get_curr_rate前 需要传入
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:35) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:35) --- end ---
 
IMPORT os
IMPORT util
IMPORT JAVA com.fourjs.fgl.lang.FglRecord  #(ver:36) add
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#(ver:36) ---add start---
GLOBALS
#單身匯excel POI變數
TYPE rec_arr_type           ARRAY [] OF com.fourjs.fgl.lang.FglRecord
DEFINE g_export_tag         DYNAMIC ARRAY OF rec_arr_type                 #畫面欄位數
DEFINE g_export_tabname     DYNAMIC ARRAY OF STRING                       #畫面名稱
END GLOBALS
#(ver:36) --- add end ---
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_master        RECORD
       xckbcomp LIKE xckb_t.xckbcomp, 
   xckbcomp_desc LIKE type_t.chr80, 
   xckbld LIKE xckb_t.xckbld, 
   xckbld_desc LIKE type_t.chr80, 
   xckb007 LIKE xckb_t.xckb007, 
   xckb008 LIKE xckb_t.xckb008, 
   ca LIKE type_t.chr500
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_detail RECORD
       
       xckb001 LIKE xckb_t.xckb001, 
   xckb002 LIKE xckb_t.xckb002, 
   xckb003 LIKE xckb_t.xckb003, 
   xckb004 LIKE xckb_t.xckb004, 
   xckb005 LIKE xckb_t.xckb005, 
   xckb006 LIKE xckb_t.xckb006, 
   xckb036 LIKE xckb_t.xckb036, 
   xmdk001 LIKE xmdk_t.xmdk001, 
   xckb009 LIKE xckb_t.xckb009, 
   xckb009_desc LIKE pmaal_t.pmaal004, 
   xckc005 LIKE xckc_t.xckc005, 
   xckc005_desc LIKE type_t.chr500, 
   xckb010 LIKE xckb_t.xckb010, 
   xckb010_desc LIKE ooag_t.ooag011, 
   xckb011 LIKE xckb_t.xckb011, 
   xckb011_desc LIKE ooefl_t.ooefl003, 
   xckb012 LIKE xckb_t.xckb012, 
   xckb012_desc LIKE imaal_t.imaal003, 
   xckb012_desc2 LIKE type_t.chr500, 
   xckb037 LIKE xckb_t.xckb037, 
   xckb037_desc LIKE imecl_t.imecl005, 
   xckb013 LIKE xckb_t.xckb013, 
   xckb014 LIKE xckb_t.xckb014, 
   xckb015 LIKE xckb_t.xckb015, 
   xckb015_desc LIKE inaa_t.inaa002, 
   xckb016 LIKE xckb_t.xckb016, 
   xckb016_desc LIKE inab_t.inab003, 
   xckb017 LIKE xckb_t.xckb017, 
   xckb102 LIKE xckb_t.xckb102, 
   xckb102a LIKE xckb_t.xckb102a, 
   xckb102b LIKE xckb_t.xckb102b, 
   xckb102c LIKE xckb_t.xckb102c, 
   xckb102d LIKE xckb_t.xckb102d, 
   xckb102e LIKE xckb_t.xckb102e, 
   xckb102f LIKE xckb_t.xckb102f, 
   xckb102g LIKE xckb_t.xckb102g, 
   xckb102h LIKE xckb_t.xckb102h, 
   xckb101 LIKE xckb_t.xckb101, 
   xckb101a LIKE xckb_t.xckb101a, 
   xckb101b LIKE xckb_t.xckb101b, 
   xckb101c LIKE xckb_t.xckb101c, 
   xckb101d LIKE xckb_t.xckb101d, 
   xckb101e LIKE xckb_t.xckb101e, 
   xckb101f LIKE xckb_t.xckb101f, 
   xckb101g LIKE xckb_t.xckb101g, 
   xckb101h LIKE xckb_t.xckb101h
       END RECORD
PRIVATE TYPE type_g_detail2 RECORD
       xcbb010 LIKE xcbb_t.xcbb010, 
   xcbb010_desc LIKE oocql_t.oocql004, 
   xckc024 LIKE xckc_t.xckc024, 
   xckc025 LIKE xckc_t.xckc025, 
   xckc004 LIKE xckc_t.xckc004, 
   xckc004_desc LIKE imaal_t.imaal003, 
   xckc004_desc2 LIKE type_t.chr500, 
   xckc023 LIKE xckc_t.xckc023, 
   xckc023_desc LIKE imecl_t.imecl005, 
   xckc006 LIKE xckc_t.xckc006, 
   xckc003 LIKE xckc_t.xckc003, 
   xckc003_desc LIKE pmaal_t.pmaal004, 
   xckc005 LIKE xckc_t.xckc005, 
   xckc005_6_desc LIKE type_t.chr500, 
   xckc007 LIKE xckc_t.xckc007, 
   xckc008 LIKE xckc_t.xckc008, 
   xckc008a LIKE xckc_t.xckc008a, 
   xckc008b LIKE xckc_t.xckc008b, 
   xckc008c LIKE xckc_t.xckc008c, 
   xckc008d LIKE xckc_t.xckc008d, 
   xckc008e LIKE xckc_t.xckc008e, 
   xckc008f LIKE xckc_t.xckc008f, 
   xckc008g LIKE xckc_t.xckc008g, 
   xckc008h LIKE xckc_t.xckc008h, 
   xckc009 LIKE xckc_t.xckc009, 
   xckc010 LIKE xckc_t.xckc010, 
   xckc010a LIKE xckc_t.xckc010a, 
   xckc010b LIKE xckc_t.xckc010b, 
   xckc010c LIKE xckc_t.xckc010c, 
   xckc010d LIKE xckc_t.xckc010d, 
   xckc010e LIKE xckc_t.xckc010e, 
   xckc010f LIKE xckc_t.xckc010f, 
   xckc010g LIKE xckc_t.xckc010g, 
   xckc010h LIKE xckc_t.xckc010h, 
   xckc011 LIKE xckc_t.xckc011, 
   xckc012 LIKE xckc_t.xckc012, 
   xckc012a LIKE xckc_t.xckc012a, 
   xckc012b LIKE xckc_t.xckc012b, 
   xckc012c LIKE xckc_t.xckc012c, 
   xckc012d LIKE xckc_t.xckc012d, 
   xckc012e LIKE xckc_t.xckc012e, 
   xckc012f LIKE xckc_t.xckc012f, 
   xckc012g LIKE xckc_t.xckc012g, 
   xckc012h LIKE xckc_t.xckc012h, 
   xckc013 LIKE xckc_t.xckc013, 
   xckc014 LIKE xckc_t.xckc014, 
   xckc014a LIKE xckc_t.xckc014a, 
   xckc014b LIKE xckc_t.xckc014b, 
   xckc014c LIKE xckc_t.xckc014c, 
   xckc014d LIKE xckc_t.xckc014d, 
   xckc014e LIKE xckc_t.xckc014e, 
   xckc014f LIKE xckc_t.xckc014f, 
   xckc014g LIKE xckc_t.xckc014g, 
   xckc014h LIKE xckc_t.xckc014h
       END RECORD
 
PRIVATE TYPE type_g_detail3 RECORD
       xckb001 LIKE xckb_t.xckb001, 
   xckb002 LIKE xckb_t.xckb002, 
   xckb003 LIKE xckb_t.xckb003, 
   xckb004 LIKE xckb_t.xckb004, 
   xckb005 LIKE xckb_t.xckb005, 
   xckb006 LIKE xckb_t.xckb006, 
   xckb036 LIKE xckb_t.xckb036, 
   xmdk001 LIKE xmdk_t.xmdk001, 
   xckb009 LIKE xckb_t.xckb009, 
   xckb009_3_desc LIKE pmaal_t.pmaal004, 
   xckc005 LIKE xckc_t.xckc005, 
   xckc005_3_desc LIKE type_t.chr500, 
   xckb010 LIKE xckb_t.xckb010, 
   xckb010_3_desc LIKE ooag_t.ooag011, 
   xckb011 LIKE xckb_t.xckb011, 
   xckb011_3_desc LIKE ooefl_t.ooefl003, 
   xckb012 LIKE xckb_t.xckb012, 
   xckb012_3_desc LIKE imaal_t.imaal003, 
   xckb012_3_desc_3 LIKE type_t.chr500, 
   xckb037 LIKE xckb_t.xckb037, 
   xckb037_3_desc LIKE imecl_t.imecl005, 
   xckb013 LIKE xckb_t.xckb013, 
   xckb014 LIKE xckb_t.xckb014, 
   xckb015 LIKE xckb_t.xckb015, 
   xckb015_3_desc LIKE inaa_t.inaa002, 
   xckb016 LIKE xckb_t.xckb016, 
   xckb016_3_desc LIKE inab_t.inab003, 
   xckb017 LIKE xckb_t.xckb017, 
   xckb112 LIKE xckb_t.xckb112, 
   xckb112a LIKE xckb_t.xckb112a, 
   xckb112b LIKE xckb_t.xckb112b, 
   xckb112c LIKE xckb_t.xckb112c, 
   xckb112d LIKE xckb_t.xckb112d, 
   xckb112e LIKE xckb_t.xckb112e, 
   xckb112f LIKE xckb_t.xckb112f, 
   xckb112g LIKE xckb_t.xckb112g, 
   xckb112h LIKE xckb_t.xckb112h, 
   xckb111 LIKE xckb_t.xckb111, 
   xckb111a LIKE xckb_t.xckb111a, 
   xckb111b LIKE xckb_t.xckb111b, 
   xckb111c LIKE xckb_t.xckb111c, 
   xckb111d LIKE xckb_t.xckb111d, 
   xckb111e LIKE xckb_t.xckb111e, 
   xckb111f LIKE xckb_t.xckb111f, 
   xckb111g LIKE xckb_t.xckb111g, 
   xckb111h LIKE xckb_t.xckb111h
       END RECORD
 
PRIVATE TYPE type_g_detail4 RECORD
       xckb001 LIKE xckb_t.xckb001, 
   xckb002 LIKE xckb_t.xckb002, 
   xckb003 LIKE xckb_t.xckb003, 
   xckb004 LIKE xckb_t.xckb004, 
   xckb005 LIKE xckb_t.xckb005, 
   xckb006 LIKE xckb_t.xckb006, 
   xckb036 LIKE xckb_t.xckb036, 
   xmdk001 LIKE xmdk_t.xmdk001, 
   xckb009 LIKE xckb_t.xckb009, 
   xckb009_4_desc LIKE pmaal_t.pmaal004, 
   xckc005 LIKE xckc_t.xckc005, 
   xckc005_4_desc LIKE type_t.chr500, 
   xckb010 LIKE xckb_t.xckb010, 
   xckb010_4_desc LIKE ooag_t.ooag011, 
   xckb011 LIKE xckb_t.xckb011, 
   xckb011_4_desc LIKE ooefl_t.ooefl003, 
   xckb012 LIKE xckb_t.xckb012, 
   xckb012_4_desc LIKE imaal_t.imaal003, 
   xckb012_4_desc_1 LIKE type_t.chr500, 
   xckb037 LIKE xckb_t.xckb037, 
   xckb037_4_desc LIKE imecl_t.imecl005, 
   xckb013 LIKE xckb_t.xckb013, 
   xckb014 LIKE xckb_t.xckb014, 
   xckb015 LIKE xckb_t.xckb015, 
   xckb015_4_desc LIKE inaa_t.inaa002, 
   xckb016 LIKE xckb_t.xckb016, 
   xckb016_4_desc LIKE inab_t.inab003, 
   xckb017 LIKE xckb_t.xckb017, 
   xckb122 LIKE xckb_t.xckb122, 
   xckb122a LIKE xckb_t.xckb122a, 
   xckb122b LIKE xckb_t.xckb122b, 
   xckb122c LIKE xckb_t.xckb122c, 
   xckb122d LIKE xckb_t.xckb122d, 
   xckb122e LIKE xckb_t.xckb122e, 
   xckb122f LIKE xckb_t.xckb122f, 
   xckb122g LIKE xckb_t.xckb122g, 
   xckb122h LIKE xckb_t.xckb122h, 
   xckb121 LIKE xckb_t.xckb121, 
   xckb121a LIKE xckb_t.xckb121a, 
   xckb121b LIKE xckb_t.xckb121b, 
   xckb121c LIKE xckb_t.xckb121c, 
   xckb121d LIKE xckb_t.xckb121d, 
   xckb121e LIKE xckb_t.xckb121e, 
   xckb121f LIKE xckb_t.xckb121f, 
   xckb121g LIKE xckb_t.xckb121g, 
   xckb121h LIKE xckb_t.xckb121h
       END RECORD
 
PRIVATE TYPE type_g_detail5 RECORD
       xcbb010 LIKE xcbb_t.xcbb010, 
   xcbb010_1_desc LIKE oocql_t.oocql004, 
   xckc024 LIKE xckc_t.xckc024, 
   xckc025 LIKE xckc_t.xckc025, 
   xckc004 LIKE xckc_t.xckc004, 
   xckc004_1_desc LIKE imaal_t.imaal003, 
   xckc004_1_desc_3 LIKE type_t.chr500, 
   xckc023 LIKE xckc_t.xckc023, 
   xckc023_1_desc LIKE imecl_t.imecl005, 
   xckc006 LIKE xckc_t.xckc006, 
   xckc003 LIKE xckc_t.xckc003, 
   xckc003_1_desc LIKE pmaal_t.pmaal004, 
   xckc005 LIKE xckc_t.xckc005, 
   xckc005_7_desc LIKE type_t.chr500, 
   xckc007 LIKE xckc_t.xckc007, 
   xckc015 LIKE xckc_t.xckc015, 
   xckc015a LIKE xckc_t.xckc015a, 
   xckc015b LIKE xckc_t.xckc015b, 
   xckc015c LIKE xckc_t.xckc015c, 
   xckc015d LIKE xckc_t.xckc015d, 
   xckc015e LIKE xckc_t.xckc015e, 
   xckc015f LIKE xckc_t.xckc015f, 
   xckc015g LIKE xckc_t.xckc015g, 
   xckc015h LIKE xckc_t.xckc015h, 
   xckc009 LIKE xckc_t.xckc009, 
   xckc016 LIKE xckc_t.xckc016, 
   xckc016a LIKE xckc_t.xckc016a, 
   xckc016b LIKE xckc_t.xckc016b, 
   xckc016c LIKE xckc_t.xckc016c, 
   xckc016d LIKE xckc_t.xckc016d, 
   xckc016e LIKE xckc_t.xckc016e, 
   xckc016f LIKE xckc_t.xckc016f, 
   xckc016g LIKE xckc_t.xckc016g, 
   xckc016h LIKE xckc_t.xckc016h, 
   xckc011 LIKE xckc_t.xckc011, 
   xckc017 LIKE xckc_t.xckc017, 
   xckc017a LIKE xckc_t.xckc017a, 
   xckc017b LIKE xckc_t.xckc017b, 
   xckc017c LIKE xckc_t.xckc017c, 
   xckc017d LIKE xckc_t.xckc017d, 
   xckc017e LIKE xckc_t.xckc017e, 
   xckc017f LIKE xckc_t.xckc017f, 
   xckc017g LIKE xckc_t.xckc017g, 
   xckc017h LIKE xckc_t.xckc017h, 
   xckc013 LIKE xckc_t.xckc013, 
   xckc018 LIKE xckc_t.xckc018, 
   xckc018a LIKE xckc_t.xckc018a, 
   xckc018b LIKE xckc_t.xckc018b, 
   xckc018c LIKE xckc_t.xckc018c, 
   xckc018d LIKE xckc_t.xckc018d, 
   xckc018e LIKE xckc_t.xckc018e, 
   xckc018f LIKE xckc_t.xckc018f, 
   xckc018g LIKE xckc_t.xckc018g, 
   xckc018h LIKE xckc_t.xckc018h
       END RECORD
 
PRIVATE TYPE type_g_detail6 RECORD
       xcbb010 LIKE xcbb_t.xcbb010, 
   xcbb010_2_desc LIKE oocql_t.oocql004, 
   xckc024 LIKE xckc_t.xckc024, 
   xckc025 LIKE xckc_t.xckc025, 
   xckc004 LIKE xckc_t.xckc004, 
   xckc004_2_desc LIKE imaal_t.imaal003, 
   xckc004_2_desc_3 LIKE type_t.chr500, 
   xckc023 LIKE xckc_t.xckc023, 
   xckc023_2_desc LIKE imecl_t.imecl005, 
   xckc006 LIKE xckc_t.xckc006, 
   xckc003 LIKE xckc_t.xckc003, 
   xckc003_2_desc LIKE pmaal_t.pmaal004, 
   xckc005 LIKE xckc_t.xckc005, 
   xckc005_8_desc LIKE type_t.chr500, 
   xckc007 LIKE xckc_t.xckc007, 
   xckc019 LIKE xckc_t.xckc019, 
   xckc019a LIKE xckc_t.xckc019a, 
   xckc019b LIKE xckc_t.xckc019b, 
   xckc019c LIKE xckc_t.xckc019c, 
   xckc019d LIKE xckc_t.xckc019d, 
   xckc019e LIKE xckc_t.xckc019e, 
   xckc019f LIKE xckc_t.xckc019f, 
   xckc019g LIKE xckc_t.xckc019g, 
   xckc019h LIKE xckc_t.xckc019h, 
   xckc009 LIKE xckc_t.xckc009, 
   xckc020 LIKE xckc_t.xckc020, 
   xckc020a LIKE xckc_t.xckc020a, 
   xckc020b LIKE xckc_t.xckc020b, 
   xckc020c LIKE xckc_t.xckc020c, 
   xckc020d LIKE xckc_t.xckc020d, 
   xckc020e LIKE xckc_t.xckc020e, 
   xckc020f LIKE xckc_t.xckc020f, 
   xckc020g LIKE xckc_t.xckc020g, 
   xckc020h LIKE xckc_t.xckc020h, 
   xckc011 LIKE xckc_t.xckc011, 
   xckc021 LIKE xckc_t.xckc021, 
   xckc021a LIKE xckc_t.xckc021a, 
   xckc021b LIKE xckc_t.xckc021b, 
   xckc021c LIKE xckc_t.xckc021c, 
   xckc021d LIKE xckc_t.xckc021d, 
   xckc021e LIKE xckc_t.xckc021e, 
   xckc021f LIKE xckc_t.xckc021f, 
   xckc021g LIKE xckc_t.xckc021g, 
   xckc021h LIKE xckc_t.xckc021h, 
   xckc013 LIKE xckc_t.xckc013, 
   xckc022 LIKE xckc_t.xckc022, 
   xckc022a LIKE xckc_t.xckc022a, 
   xckc022b LIKE xckc_t.xckc022b, 
   xckc022c LIKE xckc_t.xckc022c, 
   xckc022d LIKE xckc_t.xckc022d, 
   xckc022e LIKE xckc_t.xckc022e, 
   xckc022f LIKE xckc_t.xckc022f, 
   xckc022g LIKE xckc_t.xckc022g, 
   xckc022h LIKE xckc_t.xckc022h
       END RECORD
 
PRIVATE TYPE type_g_detail7 RECORD
       xckb001 LIKE xckb_t.xckb001, 
   xckb005 LIKE xckb_t.xckb005, 
   xckb006 LIKE xckb_t.xckb006, 
   xckb009 LIKE xckb_t.xckb009, 
   xckb009_5_desc LIKE pmaal_t.pmaal004, 
   xckb012 LIKE xckb_t.xckb012, 
   xckb012_desc_5 LIKE type_t.chr500, 
   xckb012_desc2_5 LIKE type_t.chr500, 
   xmdl024 LIKE xmdl_t.xmdl024, 
   price LIKE type_t.num20_6, 
   xckb014 LIKE xckb_t.xckb014, 
   xckb027 LIKE xckb_t.xckb027, 
   xckb102 LIKE xckb_t.xckb102
       END RECORD
 
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
TYPE type_tm RECORD  #左边查询区域
             xckbcomp LIKE xckb_t.xckbcomp,
             xckbld   LIKE xckb_t.xckbld,
             xckb007  LIKE xckb_t.xckb007, 
             xckb008  LIKE xckb_t.xckb008, 
             xckb009  LIKE xckb_t.xckb009, 
             xckb012  LIKE xckb_t.xckb012, 
             xckb037  LIKE xckb_t.xckb037,
             ca       LIKE type_t.chr1,   #汇总条件
             xckb001  LIKE xckb_t.xckb001,  #170323-00073#1 add
             xckb002  LIKE xckb_t.xckb002   #170323-00073#1 add
             END RECORD
DEFINE tm    type_tm

DEFINE g_browser  DYNAMIC ARRAY OF RECORD    #資料瀏覽之欄位,中间变量，用于笔数定位
                  xckbcomp LIKE xckb_t.xckbcomp,
                  xckbld   LIKE xckb_t.xckbld,
                  xckb007  LIKE xckb_t.xckb007, 
                  xckb008  LIKE xckb_t.xckb008
                  END RECORD 
                  
DEFINE g_qbe_hidden_t       LIKE type_t.num5              #qbe頁籤折疊
DEFINE g_glaa015             LIKE glaa_t.glaa015
DEFINE g_glaa019             LIKE glaa_t.glaa019
#add--160802-00020#7 By shiun--(S)
DEFINE g_wc_cs_ld            STRING
DEFINE g_wc_cs_comp          STRING
DEFINE g_xckb001             LIKE xckb_t.xckb001
DEFINE g_xckb002             LIKE xckb_t.xckb002
#add--160802-00020#7 By shiun--(E)
DEFINE g_xckbcompstr         STRING   #190628-00043#3 add
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master            type_g_master
DEFINE g_master_t          type_g_master
 
   
 
DEFINE g_detail            DYNAMIC ARRAY OF type_g_detail
DEFINE g_detail_t          type_g_detail
DEFINE g_detail2     DYNAMIC ARRAY OF type_g_detail2
DEFINE g_detail2_t   type_g_detail2
 
DEFINE g_detail3     DYNAMIC ARRAY OF type_g_detail3
DEFINE g_detail3_t   type_g_detail3
 
DEFINE g_detail4     DYNAMIC ARRAY OF type_g_detail4
DEFINE g_detail4_t   type_g_detail4
 
DEFINE g_detail5     DYNAMIC ARRAY OF type_g_detail5
DEFINE g_detail5_t   type_g_detail5
 
DEFINE g_detail6     DYNAMIC ARRAY OF type_g_detail6
DEFINE g_detail6_t   type_g_detail6
 
DEFINE g_detail7     DYNAMIC ARRAY OF type_g_detail7
DEFINE g_detail7_t   type_g_detail7
 
 
 
DEFINE g_wc                  STRING                        #儲存 user 的查詢條件
DEFINE g_wc_t                STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                 STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
DEFINE g_sql                 STRING                        #組 sql 用 
DEFINE g_cnt_sql             STRING                        #組 sql 用 
DEFINE g_forupd_sql          STRING                        #SELECT ... FOR UPDATE  SQL    
DEFINE g_cnt                 LIKE type_t.num10              
DEFINE l_ac                  LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog     
DEFINE gwin_curr             ui.Window                     #Current Window
DEFINE gfrm_curr             ui.Form                       #Current Form
DEFINE g_current_page        LIKE type_t.num5              #目前所在頁數
DEFINE g_current_row         LIKE type_t.num10             #目前所在筆數
DEFINE g_current_idx         LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_page                STRING                        #第幾頁
DEFINE g_ch                  base.Channel                  #外串程式用
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_error_show          LIKE type_t.num5
DEFINE g_master_idx          LIKE type_t.num10
DEFINE g_detail_idx          LIKE type_t.num10             #單身 所在筆數(所有資料)
DEFINE g_detail_idx2         LIKE type_t.num10
DEFINE g_hyper_url           STRING                        #hyperlink的主要網址
DEFINE g_msg                 STRING
DEFINE g_jump                LIKE type_t.num10
DEFINE g_no_ask              LIKE type_t.num5
DEFINE g_row_count           LIKE type_t.num10
DEFINE g_qbe_hidden          LIKE type_t.num5              #qbe頁籤折疊
DEFINE g_tot_cnt             LIKE type_t.num10             #計算總筆數
DEFINE g_num_in_page         LIKE type_t.num10             #每頁筆數
DEFINE g_page_act_list       STRING                        #分頁ACTION清單
DEFINE g_current_row_tot     LIKE type_t.num10             #目前所在總筆數
DEFINE g_page_start_num      LIKE type_t.num10             #目前頁面起始筆數
DEFINE g_page_end_num        LIKE type_t.num10             #目前頁面結束筆數
DEFINE g_master_row_move     LIKE type_t.chr1              #是否為單頭筆數更動
 
#多table用wc
DEFINE g_wc_table           STRING
DEFINE g_detail_page_action STRING
DEFINE g_pagestart          LIKE type_t.num10
 
 
 
DEFINE g_wc_filter_table           STRING
 
 
 
#add-point:自定義模組變數-客製(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axcq200.main" type="s" >}
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
      OPEN WINDOW w_axcq200 WITH FORM cl_ap_formpath('axc',g_code)
      #190108-00038 --- modify end ---   
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL axcq200_init()   
 
      #進入選單 Menu (="N")
      CALL axcq200_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_axcq200
      
   END IF 
   
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="axcq200.init" type="s" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION axcq200_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_wc_filter   = "  1 = 1  "   #171117-00042 將1=1改為空白   #171219-00006 改為"  1 = 1  "
   LET g_wc_filter_t = ""   #171117-00042 將1=1改為空白
   LET g_error_show  = 1
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_master_row_move = "Y"
   
     
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('b_xckb001_1','8343')
   CALL cl_set_combo_scc('b_xckb001_3','8343')
   CALL cl_set_combo_scc('b_xckb001_4','8343')
   CALL cl_set_combo_scc('b_xckb002_1','8344')
   CALL cl_set_combo_scc('b_xckb002_3','8344')
   CALL cl_set_combo_scc('b_xckb002_4','8344')
   CALL cl_set_act_visible_toolbaritem("insert,datainfo,output",FALSE)
   CALL cl_set_combo_scc('xckb_t.xckb001','8343')  #170323-00073#1 add
   CALL cl_set_combo_scc('xckb_t.xckb002','8344')  #170323-00073#1 add
   CALL cl_set_combo_scc('b_xckb001_5','8343')   #170618-00439#1 add
   #191108-00002#4 add---(S)
   #產品特徵依照參數S-FIN-6013顯隱
   IF cl_get_para(g_enterprise,g_site,'S-FIN-6013') = 'N' THEN
      CALL cl_set_comp_visible("lbl_xckb037,xckb037,b_xckb037,b_xckb037_3,b_xckb037_4,b_xckc023_0,b_xckc023_1,b_xckc023_2",FALSE)
   ELSE
      CALL cl_set_comp_visible("lbl_xckb037,xckb037,b_xckb037,b_xckb037_3,b_xckb037_4,b_xckc023_0,b_xckc023_1,b_xckc023_2",TRUE)
   END IF
   #191108-00002#4 add---(E)
   #201030-00027#8 add-S
   #如果已出货尚未开立发票的发出商品成本冻结且走签收流程，依出货认列发出商品，则隐藏未开票页签
   IF cl_get_para(g_enterprise,g_site,'S-FIN-1003') = '4' AND cl_get_para(g_enterprise,g_site,'S-FIN-9029') = 'Y' THEN
      CALL cl_set_comp_visible('bpage_24',FALSE)
   ELSE
      CALL cl_set_comp_visible('bpage_24',TRUE)
   END IF
   #201030-00027#8 add-E
   #end add-point
 
   CALL axcq200_default_search()
END FUNCTION
 
{</section>}
 
{<section id="axcq200.default_search" type="s" >}
PRIVATE FUNCTION axcq200_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   
 
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
 
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION axcq200_ui_dialog() 
   #add-point:ui_dialog段define-客製 name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit   LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx    LIKE type_t.num10
   DEFINE ls_result STRING
   DEFINE la_param  RECORD
                    prog       STRING,
                    actionid   STRING,
                    background LIKE type_t.chr1,
                    param      DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE ls_wc     STRING
   DEFINE lc_action_choice_old    STRING
   #(ver:36) ---add start---
   DEFINE l_arr_len       LIKE type_t.num10
   DEFINE l_arr_cnt       LIKE type_t.num10
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:36) --- add end ---
   DEFINE ls_sqladdon_t   STRING                #200917-00047
   DEFINE lp_str          STRING                #201109-00009
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_xcbk001  LIKE xcbk_t.xcbk001 #无用
   #end add-point
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"
#181129-00060#1 add_S   
   CALL axcq200_ui_dialog1()
   RETURN
#181129-00060#1 add_E   
   #end add-point
 
   CLEAR FORM  
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
 
   LET li_exit = FALSE
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   LET g_current_idx = 1
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   LET g_current_row_tot = 0
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   LET g_master_row_move = "Y"
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   LET l_ac = 1
 
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   LET g_action_choice = "log"                    #180320-00047#2 add
   IF cl_null(tm.ca) THEN
      LET tm.ca = '3'
   END IF
   IF cl_null(g_wc) OR g_wc=" 1=1" OR g_wc=" 1=2"  THEN
      #预设当前site的法人，主账套，年度期别，#成本计算类型
      CALL s_axc_set_site_default() RETURNING tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008,l_xcbk001
   END IF
   #end add-point
 
   
 
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      CALL axcq200_cs()
   END IF
 
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         INITIALIZE g_master.* TO NULL
         CALL g_detail.clear()
         CALL g_detail2.clear()
 
         CALL g_detail3.clear()
 
         CALL g_detail4.clear()
 
         CALL g_detail5.clear()
 
         CALL g_detail6.clear()
 
         CALL g_detail7.clear()
 
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 0
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_master_row_move = "Y"
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL axcq200_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
         INPUT BY NAME tm.ca
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            ON CHANGE ca
               #CALL cl_set_comp_visible('b_xckc003,b_xckc003_desc,b_xckc004,b_xckc004_desc,b_xckc004_desc2,b_xckc023,b_xckc023_desc,b_xckc006,b_xckc007,b_xckc009,b_xckc011,b_xckc013',TRUE)
               #CASE tm.ca
               #   WHEN '1'  #客户
               #        CALL cl_set_comp_visible('b_xckc004,b_xckc004_desc,b_xckc004_desc2,b_xckc023,b_xckc023_desc,b_xckc006,b_xckc007,b_xckc009,b_xckc011,b_xckc013',FALSE)
               #   WHEN '2'  #产品
               #        CALL cl_set_comp_visible('b_xckc003,b_xckc003_desc',FALSE)
               #   WHEN '3'  #客户+产品
               #        #无
               #END CASE
         END INPUT
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
         CONSTRUCT BY NAME g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckc005,xckb001,xckb002,xckb004  #170323-00073#1 add #180428-00018#1 add xckb004
         #CONSTRUCT BY NAME g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckc005    #160706-00021#1   #170323-00073#1 mark
         #CONSTRUCT g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037
         #     FROM b_xckbcomp,b_xckbld,b_xckb007,b_xckb008,
         #          s_detail1[1].b_xckb009,s_detail1[1].b_xckb012,s_detail1[1].b_xckb037          
            BEFORE CONSTRUCT
               #160921-00010#1 add(s)
               IF cl_null(g_wc) OR g_wc=" 1=1" OR g_wc=" 1=2"  THEN
                  #预设当前site的法人，主账套，年度期别，#成本计算类型
                  CALL s_axc_set_site_default() RETURNING tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008,l_xcbk001
               END IF
               #160921-00010#1 add(e)
               DISPLAY BY NAME tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008
               #DISPLAY tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008 TO b_xckbcomp,xckbld,b_xckb007,b_xckb008
            
            AFTER FIELD xckbcomp
               LET tm.xckbcomp= GET_FLDBUF(xckbcomp)

            AFTER FIELD xckbld
               LET tm.xckbld  = GET_FLDBUF(xckbld)

            AFTER FIELD xckb007
               LET tm.xckb007 = GET_FLDBUF(xckb007)
               
            AFTER FIELD xckb008
               LET tm.xckb008 = GET_FLDBUF(xckb008)
               
            ON ACTION controlp INFIELD xckbcomp   #法人
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #add--160802-00020#7 By shiun--(S)
      	      #增加法人過濾條件
               IF NOT cl_null(g_wc_cs_comp) THEN
                  LET g_qryparam.where = " ooef001 IN ",g_wc_cs_comp
               END IF
               #add--160802-00020#7 By shiun--(S)
               CALL q_ooef001_2()                #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckbcomp  #顯示到畫面上
               NEXT FIELD xckbcomp              #返回原欄位
            
            
            ON ACTION controlp INFIELD xckbld   #账别
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = g_user
               LET g_qryparam.arg2 = g_dept
               #add--160802-00020#7 By shiun--(S)
               #增加帳套權限控制
               IF NOT cl_null(g_wc_cs_ld) THEN
                  LET g_qryparam.where = " glaald IN ",g_wc_cs_ld
               END IF
               #add--160802-00020#7 By shiun--(S)
               CALL q_authorised_ld()                #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckbld  #顯示到畫面上
               NEXT FIELD xckbld                     #返回原欄位
            
            ON ACTION controlp INFIELD xckb009   #客户编号
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_pmaa001_7()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb009  #顯示到畫面上
               NEXT FIELD xckb009                     #返回原欄位
                         
            ON ACTION controlp INFIELD xckb012   #产品编号
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_imaa001()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb012  #顯示到畫面上
               NEXT FIELD xckb012                     #返回原欄位

            #181128-00016#1 add-->s
            ON ACTION controlp INFIELD xckb037
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_xcck011()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb037  #顯示到畫面上
               NEXT FIELD xckb037                     #返回原欄位
            #181128-00016#1 add-->e
            
            #160706-00021#1
            ON ACTION controlp INFIELD xckc005
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL aglt310_04()
               DISPLAY g_qryparam.return1 TO xckc005  #顯示到畫面上
               NEXT FIELD xckc005                     #返回原欄位
            #160706-00021#1
            
            #180428-00018#1---add---s
            ON ACTION controlp INFIELD xckb004
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_ooef001()
               DISPLAY g_qryparam.return1 TO xckb004  #顯示到畫面上
               NEXT FIELD xckb004                     #返回原欄位            
            #180428-00018#1---add---e

            
         END CONSTRUCT
         #end add-point
     
         DISPLAY ARRAY g_detail TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
               CALL axcq200_detail_action_trans()   #(ver:34)
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
            #  CALL axcq200_detail_action_trans()   #(ver:34) mark
               LET g_master_idx = l_ac
               CALL axcq200_b_fill2()
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail2 TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 2
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body2.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_2)
            
 
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail3 TO s_detail3.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 3
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body3.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_3)
            
 
            #add-point:page3自定義行為 name="ui_dialog.body3.action"
            
            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail4 TO s_detail4.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 4
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail4")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body4.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_4)
            
 
            #add-point:page4自定義行為 name="ui_dialog.body4.action"
            
            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail5 TO s_detail5.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 5
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail5")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body5.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_5)
            
 
            #add-point:page5自定義行為 name="ui_dialog.body5.action"
            
            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail6 TO s_detail6.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 6
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail6")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body6.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_6)
            
 
            #add-point:page6自定義行為 name="ui_dialog.body6.action"
            
            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail7 TO s_detail7.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 7
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail7")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body7.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_7)
            
 
            #add-point:page7自定義行為 name="ui_dialog.body7.action"
            
            #end add-point
 
         END DISPLAY
 
 
 
         #add-point:ui_dialog段define name="ui_dialog.more_displayarray"
 
         #end add-point
    
         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_page = 1   #(ver:34)
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            CALL axcq200_fetch('')
            CALL axcq200_detail_action_trans()   #(ver:34)
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            #180320-00047#2   add-S
            IF cl_null(g_action_choice) THEN
               INITIALIZE g_master.* TO NULL
               LET g_wc  = " 1=2"
               DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
            END IF
            #180320-00047#2   add-E
            #170310-00068#3-s add
            #增加二次查詢功能
            ON ACTION filter
               LET g_action_choice="filter"
               CALL axcq200_filter()
            #170310-00068#3-e add
            #end add-point
            NEXT FIELD xckbcomp
 
         AFTER DIALOG
            #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
            
            #end add-point
            
         ON ACTION exit
            LET g_action_choice="exit"
            LET INT_FLAG = FALSE
            LET li_exit = TRUE
            EXIT DIALOG 
      
         ON ACTION close
            LET INT_FLAG=FALSE
            LET li_exit = TRUE
            EXIT DIALOG
 
         ON ACTION accept
            INITIALIZE g_wc_filter TO NULL   #171117-00042 mark   #191008-00022 remark
            IF cl_null(g_wc) THEN
               LET g_wc = " 1=1"
            END IF
 
 
   
            IF cl_null(g_wc2) THEN
               LET g_wc2 = " 1=1"
            END IF
 
 
 
            #add-point:ON ACTION accept name="ui_dialog.accept"
            IF g_qbe_hidden_t != 8 AND g_qbe_hidden_t != g_qbe_hidden THEN  #原隐藏变成显示，现在还原隐藏
               CALL gfrm_curr.setElementHidden("qbe",1)
               CALL gfrm_curr.setElementImage("qbehidden","16/worksheethidden.png")
               LET g_qbe_hidden = 1     #hidden
            END IF
            LET g_qbe_hidden_t = 8  #相当于清空的意思，清空还是0不好判断，就用了个8
            
            #170323-00073#1 add(S)
            LET tm.xckb001 = GET_FLDBUF(xckb001) 
            LET g_xckb001=tm.xckb001

            LET tm.xckb002 = GET_FLDBUF(xckb002) 
            LET g_xckb002=tm.xckb002
            #170323-00073#1 add(E)
            #end add-point
 
            LET g_error_show = 1   #190802-00012
            CALL axcq200_cs()
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"
            
            #end add-point
            CALL cl_user_overview()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:36) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"
               
               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
 
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     CALL g_export_node.clear()
                     LET l_arr_len = g_detail.getLength()
                     LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[1] = "s_detail1"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[1][l_arr_cnt] = g_detail[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail2.getLength()
                     LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[2] = "s_detail2"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[2][l_arr_cnt] = g_detail2[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail3.getLength()
                     LET g_export_tag[3] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[3] = "s_detail3"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[3][l_arr_cnt] = g_detail3[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail4.getLength()
                     LET g_export_tag[4] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[4] = "s_detail4"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[4][l_arr_cnt] = g_detail4[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail5.getLength()
                     LET g_export_tag[5] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[5] = "s_detail5"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[5][l_arr_cnt] = g_detail5[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail6.getLength()
                     LET g_export_tag[6] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[6] = "s_detail6"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[6][l_arr_cnt] = g_detail6[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail7.getLength()
                     LET g_export_tag[7] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[7] = "s_detail7"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[7][l_arr_cnt] = g_detail7[l_arr_cnt]
                     END FOR
 
 
                     
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"
                     
                     #end add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_poi()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"
                     
                     #end add-point
 
                  OTHERWISE   #使用原始樣板
               #(ver:36) --- end ---
                     CALL g_export_node.clear()
                     LET g_export_node[1] = base.typeInfo.create(g_detail)
                     LET g_export_id[1]   = "s_detail1"
                     LET g_export_node[2] = base.typeInfo.create(g_detail2)
                     LET g_export_id[2]   = "s_detail2"
 
                     LET g_export_node[3] = base.typeInfo.create(g_detail3)
                     LET g_export_id[3]   = "s_detail3"
 
                     LET g_export_node[4] = base.typeInfo.create(g_detail4)
                     LET g_export_id[4]   = "s_detail4"
 
                     LET g_export_node[5] = base.typeInfo.create(g_detail5)
                     LET g_export_id[5]   = "s_detail5"
 
                     LET g_export_node[6] = base.typeInfo.create(g_detail6)
                     LET g_export_id[6]   = "s_detail6"
 
                     LET g_export_node[7] = base.typeInfo.create(g_detail7)
                     LET g_export_id[7]   = "s_detail7"
 
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                     
                     #end add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_to_excel()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:33)
                     
                     #end add-point
               END CASE   #(ver:36) add
            END IF
 
 
         ON ACTION datarefresh   # 重新整理
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('F')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION qbehidden     #qbe頁籤折疊
            IF g_qbe_hidden THEN
               CALL gfrm_curr.setElementHidden("qbe",0)
               CALL gfrm_curr.setElementImage("qbehidden","16/mainhidden.png")
               LET g_qbe_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("qbe",1)
               CALL gfrm_curr.setElementImage("qbehidden","16/worksheethidden.png")
               LET g_qbe_hidden = 1     #hidden
            END IF
 
         ON ACTION datainfo   #串查至主維護程式
            #add-point:ON ACTION datainfo name="ui_dialog.datainfo"
            
            #end add-point
            CALL axcq200_maintain_prog()
 
         ON ACTION first   # 第一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('F')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION previous   # 上一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('P')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION jump   # 跳至第幾筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('/')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION next   # 下一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('N')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION last   # 最後一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('L')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION detail_first               #page first
            LET g_action_choice = "detail_first"
            LET g_detail_page_action = "detail_first"
            LET g_master_row_move = "N"
            CALL axcq200_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            LET g_master_row_move = "N"
            CALL axcq200_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            LET g_master_row_move = "N"
            CALL axcq200_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            LET g_master_row_move = "N"
            CALL axcq200_b_fill()
 
         
         
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               
               #add-point:ON ACTION query name="menu.query"
               LET g_qbe_hidden_t = g_qbe_hidden   #旧值备份
               IF g_qbe_hidden_t THEN  #隐藏
                  CALL gfrm_curr.setElementHidden("qbe",0)
                  CALL gfrm_curr.setElementImage("qbehidden","16/mainhidden.png")
                  LET g_qbe_hidden = 0     #visible
               END IF
               #END add-point
               
               
            END IF
 
 
 
 
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"
         
         #end add-point
 
         ON ACTION qbeclear   # 條件清除
            CLEAR FORM
            #add-point:條件清除後 name="ui_dialog.qbeclear"
            #单头不清除，只应清除左边查询段
            DISPLAY g_master.xckbcomp      TO  b_xckbcomp
            DISPLAY g_master.xckbld        TO  b_xckbld
            DISPLAY g_master.xckb007       TO  b_xckb007
            DISPLAY g_master.xckb008       TO  b_xckb008
            DISPLAY g_master.xckbcomp_desc TO xckbcomp_desc
            DISPLAY g_master.xckbld_desc   TO xckbld_desc
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
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"
 
         #end add-point 
 
      END DIALOG 
   
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.cs" type="s" >}
#+ 組單頭CURSOR
PRIVATE FUNCTION axcq200_cs()
   #add-point:cs段define-客製 name="cs.define_customerization"
   
   #end add-point
   #add-point:cs段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   DEFINE ls_wc      STRING
   DEFINE l_wc       STRING             #160706-00021#1
   DEFINE l_count    LIKE type_t.num5
   #end add-point
 
   #add-point:FUNCTION前置處理 name="cs.before_function"
 
   #end add-point
 
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
 
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
   IF g_wc2 = " 1=1" THEN
      #add-point:cs段單頭sql組成(未下單身條件) name="cs.sql_define_1"
     #IF cl_null(g_wc_filter) THEN
     #   LET g_wc_filter = " 1=1"
     #END IF
     #LET ls_wc = g_wc," AND ", g_wc_filter
     #160706-00021#1
      LET l_wc = g_wc
     #170325-00086#1 mark --(S)--  
     #IF l_wc.getIndexOf('xckc005',1) > 0 THEN
     #   LEt g_wc = g_wc.subString(1,g_wc.getIndexOf('xckc005',1)-1)
     #   LET g_wc = g_wc," 1=1"
     #END IF
     #170325-00086#1 mark --(E)--
     #160706-00021#1
     #抓出单头资料
     #160919-00081#1-s-mark 
     #LET g_sql = "SELECT UNIQUE xckbcomp,xckbld,xckb007,xckb008 ",
     #            "  FROM xckb_t ",
     #            " WHERE xckbent = ",g_enterprise,
     #            "   AND ",g_wc
     #LET g_sql = g_sql, cl_sql_add_filter("xckb_t"),  #額外的過濾條件
     #           " ORDER BY xckbcomp,xckbld,xckb007,xckb008 "     
     #160919-00081#1-e-mark     
     #160919-00081#1-s-add
      LET ls_wc = g_wc
      LET ls_wc = cl_replace_str(ls_wc,"xckbcomp","xckccomp") 
      LET ls_wc = cl_replace_str(ls_wc,"xckbld","xckcld") 
      LET ls_wc = cl_replace_str(ls_wc,"xckb007","xckc001") 
      LET ls_wc = cl_replace_str(ls_wc,"xckb008","xckc002") 
     #160926-00014#1-s-ad d
      LET g_wc = cl_replace_str(g_wc,"xckc005","xckb022") 
      LET ls_wc = cl_replace_str(ls_wc,"xckb009","xckc003")
      LET ls_wc = cl_replace_str(ls_wc,"xckb012","xckc004")
      LET ls_wc = cl_replace_str(ls_wc,"xckb037","xckc023")
       
      #LET ls_wc = cl_replace_str(ls_wc,"xckb001",g_xckb001)  #170323-00073#1 add
      #LET ls_wc = cl_replace_str(ls_wc,"xckb002",g_xckb002)  #170323-00073#1 add
      LET ls_wc = cl_replace_str(ls_wc,"xckb004","xckcsite")  #180428-00018#1 add 
      LET ls_wc = cl_replace_str(ls_wc,"xckb005","xckc024")   #190628-00043#3 add
      
      #181126-00029#1 add-S
      #---增加帳套權限控管
      IF NOT cl_null(g_wc_cs_ld) THEN
         LET g_wc = g_wc ," AND xckbld IN ",g_wc_cs_ld
      END IF
      IF NOT cl_null(g_wc_cs_ld) THEN
         LET ls_wc = ls_wc ," AND xckcld IN ",g_wc_cs_ld
      END IF
      #---增加法人過濾條件
      IF NOT cl_null(g_wc_cs_comp) THEN
         LET g_wc = g_wc ," AND xckbcomp IN ",g_wc_cs_comp
      END IF
      IF NOT cl_null(g_wc_cs_comp) THEN
         LET ls_wc = ls_wc ," AND xckccomp IN ",g_wc_cs_comp
      END IF
      #181126-00029#1 add-E
     #160926-00014#1-e-add 
      IF cl_null(g_xckb001) AND cl_null(g_xckb002) THEN #170323-00073#1 add 
         LET g_sql = "SELECT DISTINCT xckbcomp,xckbld,xckb007,xckb008 ",
                     "  FROM xckb_t ",
                     " WHERE xckbent = ",g_enterprise,
                     "   AND ",g_wc,   
                     " UNION  ",         
                     "SELECT DISTINCT xckccomp,xckcld,xckc001,xckc002 ",
                     "  FROM xckc_t ",
                     " WHERE xckcent = ",g_enterprise,
                     "   AND ",ls_wc,
                     " ORDER BY xckbcomp,xckbld,xckb007,xckb008 " 
      #170323-00073#1 add(S)
      ELSE
         LET g_sql = "SELECT DISTINCT xckbcomp,xckbld,xckb007,xckb008 ",
                     "  FROM xckb_t ",
                     " WHERE xckbent = ",g_enterprise,
                     "   AND ",g_wc,
                     " ORDER BY xckbcomp,xckbld,xckb007,xckb008 " 
     END IF 
     #170323-00073#1 add(E)     
     #160919-00081#1-e-add                 
      LET g_wc = l_wc                         #160706-00021#1
      PREPARE axcq210_prepare FROM g_sql      #預備一下
      DECLARE axcq210_b_curs                  #宣告成可捲動的
          SCROLL CURSOR WITH HOLD FOR axcq210_prepare
      #end add-point
   ELSE
      #add-point:cs段單頭sql組成(有下單身條件) name="cs.sql_define_2"
      #IF cl_null(g_wc_filter) THEN
      #   LET g_wc_filter = " 1=1"
      #END IF
      #LET ls_wc = g_wc, " AND ", g_wc2, " AND ", g_wc_filter
      
      #抓出单头资料
     #160919-00081#1-s-mark
     #LET g_sql = "SELECT UNIQUE xckbcomp,xckbld,xckb007,xckb008 ",
     #            "  FROM xckb_t ",
     #            " WHERE xkbent = ",g_enterprise,
     #            "   AND ",g_wc
     #LET g_sql = g_sql, cl_sql_add_filter("xckb_t"),  #額外的過濾條件
     #           " ORDER BY xckbcomp,xckbld,xckb007,xckb008 "     
     #160919-00081#1-e-mark  
     #160919-00081#1-s-add
      LET ls_wc = g_wc
      LET ls_wc = cl_replace_str(ls_wc,"xckbcomp","xckccomp") 
      LET ls_wc = cl_replace_str(ls_wc,"xckbld","xckcld") 
      LET ls_wc = cl_replace_str(ls_wc,"xckb007","xckc001") 
      LET ls_wc = cl_replace_str(ls_wc,"xckb008","xckc002")
     #160926-00014#1-s-add
      LET g_wc = cl_replace_str(g_wc,"xckc005","xckb022") 
      LET ls_wc = cl_replace_str(ls_wc,"xckb009","xckc003")
      LET ls_wc = cl_replace_str(ls_wc,"xckb012","xckc004")
      LET ls_wc = cl_replace_str(ls_wc,"xckb037","xckc023")
      #LET ls_wc = cl_replace_str(ls_wc,"xckb001",g_xckb001)  #170323-00073#1 add
      #LET ls_wc = cl_replace_str(ls_wc,"xckb002",g_xckb002)  #170323-00073#1 add  
      LET ls_wc = cl_replace_str(ls_wc,"xckb004","xckcsite")  #180428-00018#1 add      
     #160926-00014#1-e-add       
     
      #add--160802-00020#7 by shiun--(S)
      #---增加帳套權限控管
      IF NOT cl_null(g_wc_cs_ld) THEN
         LET g_wc = g_wc ," AND xckbld IN ",g_wc_cs_ld
      END IF
      IF NOT cl_null(g_wc_cs_ld) THEN
         LET ls_wc = ls_wc ," AND xckcld IN ",g_wc_cs_ld
      END IF
      #---增加法人過濾條件
      IF NOT cl_null(g_wc_cs_comp) THEN
         LET g_wc = g_wc ," AND xckbcomp IN ",g_wc_cs_comp
      END IF
      IF NOT cl_null(g_wc_cs_comp) THEN
         LET ls_wc = ls_wc ," AND xckccomp IN ",g_wc_cs_comp
      END IF
      #add--160802-00020#7 by shiun--(E)
      
      IF cl_null(g_xckb001) AND cl_null(g_xckb002) THEN  #170323-00073#1 add
         LET g_sql = "SELECT DISTINCT xckbcomp,xckbld,xckb007,xckb008 ",
                     "  FROM xckb_t ",
                     " WHERE xckbent = ",g_enterprise,
                     "   AND ",g_wc,   
                     " UNION  ",
                     "SELECT DISTINCT xckccomp,xckcld,xckc001,xckc002 ",
                     "  FROM xckc_t ",
                     " WHERE xckcent = ",g_enterprise,
                     "   AND ",ls_wc,
                     " ORDER BY xckbcomp,xckbld,xckb007,xckb008 "
     #170323-00073#1 add(S)
     ELSE
         LET g_sql = "SELECT DISTINCT xckbcomp,xckbld,xckb007,xckb008 ",
                     "  FROM xckb_t ",
                     " WHERE xckbent = ",g_enterprise,
                     "   AND ",g_wc,
                     " ORDER BY xckbcomp,xckbld,xckb007,xckb008 " 
     END IF
     #170323-00073#1 add(E)     
     #160919-00081#1-e-add     

      #end add-point
   END IF
 
   PREPARE axcq200_pre FROM g_sql
   DECLARE axcq200_curs SCROLL CURSOR WITH HOLD FOR axcq200_pre
   OPEN axcq200_curs
 
   #add-point:cs段單頭總筆數計算 name="cs.head_total_row_count"
  #160706-00021#1
   LET l_wc = g_wc
   IF l_wc.getIndexOf('xckc005',1) > 0 THEN
      LEt g_wc = g_wc.subString(1,g_wc.getIndexOf('xckc005',1)-1)
      LET g_wc = g_wc," 1=1"
   END IF
  #160706-00021#1
  #抓出資料筆數
  #160919-00081#1-s-mark 
  #LET g_cnt_sql = "SELECT COUNT(DISTINCT xckbcomp||xckbld||xckb007||xckb008) ",
  #                "  FROM xckb_t",
  #                " WHERE xckbent = ",g_enterprise,
  #                "   AND ",g_wc
  #160919-00081#1-e-mark  
  
   
   LET g_cnt_sql = " SELECT COUNT(1) FROM (",g_sql,") tsed "  #160919-00081#1 add
 
   LET g_sql = g_sql, cl_sql_add_filter("xckb_t")   #額外的過濾條件
   LET g_wc = l_wc                                  #160706-00021#1
   #end add-point
   PREPARE axcq200_precount FROM g_cnt_sql
   EXECUTE axcq200_precount INTO g_row_count
 
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
 
   ELSE
      CALL axcq200_fetch("F")
   END IF
END FUNCTION
 
{</section>}
 
{<section id="axcq200.fetch" type="s" >}
#+ 抓取單頭資料
PRIVATE FUNCTION axcq200_fetch(p_flag)
   #add-point:fetch段define-客製 name="fetch.define_customerization"
   
   #end add-point
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   DEFINE li_ac           LIKE type_t.num10
   #end add-point
 
   #add-point:FUNCTION前置處理 name="fetch.before_function"
  
   #end add-point
 
   MESSAGE ""
 
   #FETCH段CURSOR移動
   #應用 qs18 樣板自動產生(Version:3)
   #add-point:fetch段CURSOR移動 name="fetch.cursor_action"
   #170421-00022#1 add(S)
   IF g_wc  = " 1=2" THEN
      RETURN
   END IF
   #170421-00022#1 add(E)   
   #没符合条件的资料
   IF g_row_count = 0 THEN
      # 清空右側畫面欄位值，但須保留左側qbe查詢條件
      INITIALIZE g_master.* TO NULL
      DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
      CALL g_detail.clear()
      CALL g_detail2.clear()
      CALL g_detail3.clear()
      CALL g_detail4.clear()
      CALL g_detail5.clear()
      CALL g_detail6.clear()
      CALL g_detail7.clear()   #170618-00439#1 add
      DISPLAY '' TO FORMONLY.h_index
      DISPLAY '' TO FORMONLY.h_count
      DISPLAY '' TO FORMONLY.idx
      DISPLAY '' TO FORMONLY.cnt
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code   = '-100' 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   #受pattern限制，使用g_fetch变量，非空为版型所有，不需要调用的
   
   
   LET li_ac=1
   FOREACH axcq200_curs INTO g_browser[li_ac].xckbcomp,g_browser[li_ac].xckbld,g_browser[li_ac].xckb007,g_browser[li_ac].xckb008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      LET li_ac = li_ac + 1
      IF li_ac > g_max_rec THEN
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_browser.deleteElement(li_ac)
   #end add-point
 
 
 
 
 
   IF SQLCA.SQLCODE THEN
      # 清空右側畫面欄位值，但須保留左側qbe查詢條件
      INITIALIZE g_master.* TO NULL
      DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
      CALL g_detail.clear()
      CALL g_detail2.clear()
 
      CALL g_detail3.clear()
 
      CALL g_detail4.clear()
 
      CALL g_detail5.clear()
 
      CALL g_detail6.clear()
 
      CALL g_detail7.clear()
 
 
      #add-point:陣列清空 name="fetch.array_clear"
      
      #end add-point
      DISPLAY '' TO FORMONLY.h_index
      DISPLAY '' TO FORMONLY.h_count
      DISPLAY '' TO FORMONLY.idx
      DISPLAY '' TO FORMONLY.cnt
 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = '-100' 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   ELSE
      CASE p_flag
         WHEN 'F' LET g_current_idx = 1
         WHEN 'P' LET g_current_idx = g_current_idx - 1
         WHEN 'N' LET g_current_idx = g_current_idx + 1
         WHEN 'L' LET g_current_idx = g_row_count
         #200804-00006 ---modify start---
      #  WHEN '/' LET g_current_idx = g_jump
         
         WHEN '/'
           CALL cl_set_act_visible("accept,cancel", TRUE)
           CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
           LET INT_FLAG = 0
 
           PROMPT ls_msg CLIPPED,':' FOR g_jump
              &include "common_action.4gl"
           END PROMPT
 
           CALL cl_set_act_visible("accept,cancel", FALSE)
           IF INT_FLAG THEN
               LET INT_FLAG = 0
               EXIT CASE
           END IF
           LET g_current_idx = g_jump
         #200804-00006 --- modify end ---
      END CASE
      #(ver:34) ---modify start---
      IF g_row_count >  0 THEN
         DISPLAY g_current_idx TO FORMONLY.h_index
         DISPLAY g_row_count TO FORMONLY.h_count
      ELSE
         DISPLAY '' TO FORMONLY.h_index
         DISPLAY '' TO FORMONLY.h_count
      END IF
      #(ver:34) --- modify end ---
      CALL cl_navigator_setting( g_current_idx, g_row_count )
   END IF
 
   #add-point:fetch結束前 name="fetch.after"
   LET g_master.xckbcomp= g_browser[g_current_idx].xckbcomp
   LET g_master.xckbld  = g_browser[g_current_idx].xckbld
   LET g_master.xckb007 = g_browser[g_current_idx].xckb007
   LET g_master.xckb008 = g_browser[g_current_idx].xckb008
   
   CALL s_desc_get_department_desc(g_master.xckbcomp) RETURNING g_master.xckbcomp_desc #法人組織
   DISPLAY g_master.xckbcomp_desc TO xckbcomp_desc
   CALL s_desc_get_ld_desc(g_master.xckbld) RETURNING g_master.xckbld_desc #帳別編號
   DISPLAY g_master.xckbld_desc TO xckbld_desc
   #end add-point
 
   LET g_master_row_move = "Y"
   #重新顯示
   CALL axcq200_show()
 
   #(ver:34) ---start---
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   CALL axcq200_b_fill()
   #(ver:34) --- end ---
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.show" type="s" >}
PRIVATE FUNCTION axcq200_show()
   #add-point:show段define-客製 name="show.define_customerization"
   
   #end add-point
   DEFINE ls_sql    STRING
   #add-point:show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="show.before_function"
   
   #end add-point
 
   DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
 
   #讀入ref值
   #add-point:show段單身reference name="show.head.reference"
   SELECT glaa015,glaa019
     INTO g_glaa015,g_glaa019
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald = g_master.xckbld
   IF cl_null(g_glaa015) THEN LET g_glaa015 = 'N' END IF
   IF cl_null(g_glaa019) THEN LET g_glaa019 = 'N' END IF
   IF g_glaa015 = 'Y' THEN
      CALL cl_set_comp_visible("bpage_12,bpage_22",TRUE)
   ELSE
      CALL cl_set_comp_visible("bpage_12,bpage_22",FALSE)
   END IF
   IF g_glaa019 = 'Y' THEN
      CALL cl_set_comp_visible("bpage_13,bpage_23",TRUE)
   ELSE
      CALL cl_set_comp_visible("bpage_13,bpage_23",FALSE)
   END IF
   #end add-point
 
   #(ver:34) ---mark start---
#  LET g_detail_page_action = "detail_first"
#  LET g_pagestart = 1
#  LET g_detail_idx = 1
#  LET g_detail_idx2 = 1
#  CALL axcq200_b_fill()
   #(ver:34) --- mark end ---
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.b_fill" type="s" >}
#+ 單身陣列填充
PRIVATE FUNCTION axcq200_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_sql_rank     STRING
   DEFINE ls_sqladdon_t   STRING   #200828-00027
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE li_ac           LIKE type_t.num10
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_xckb_amt      RECORD  #效能考虑
                          xckb112      LIKE xckb_t.xckb112 ,
                          xckb112a     LIKE xckb_t.xckb112a,
                          xckb112b     LIKE xckb_t.xckb112b,
                          xckb112c     LIKE xckb_t.xckb112c,
                          xckb112d     LIKE xckb_t.xckb112d,
                          xckb112e     LIKE xckb_t.xckb112e,
                          xckb112f     LIKE xckb_t.xckb112f,
                          xckb112g     LIKE xckb_t.xckb112g,
                          xckb112h     LIKE xckb_t.xckb112h,
                          xckb111      LIKE xckb_t.xckb111 ,
                          xckb111a     LIKE xckb_t.xckb111a,
                          xckb111b     LIKE xckb_t.xckb111b,
                          xckb111c     LIKE xckb_t.xckb111c,
                          xckb111d     LIKE xckb_t.xckb111d,
                          xckb111e     LIKE xckb_t.xckb111e,
                          xckb111f     LIKE xckb_t.xckb111f,
                          xckb111g     LIKE xckb_t.xckb111g,
                          xckb111h     LIKE xckb_t.xckb111h,
                          xckb122      LIKE xckb_t.xckb122 ,
                          xckb122a     LIKE xckb_t.xckb122a,
                          xckb122b     LIKE xckb_t.xckb122b,
                          xckb122c     LIKE xckb_t.xckb122c,
                          xckb122d     LIKE xckb_t.xckb122d,
                          xckb122e     LIKE xckb_t.xckb122e,
                          xckb122f     LIKE xckb_t.xckb122f,
                          xckb122g     LIKE xckb_t.xckb122g,
                          xckb122h     LIKE xckb_t.xckb122h,
                          xckb121      LIKE xckb_t.xckb121 ,
                          xckb121a     LIKE xckb_t.xckb121a,
                          xckb121b     LIKE xckb_t.xckb121b,
                          xckb121c     LIKE xckb_t.xckb121c,
                          xckb121d     LIKE xckb_t.xckb121d,
                          xckb121e     LIKE xckb_t.xckb121e,
                          xckb121f     LIKE xckb_t.xckb121f,
                          xckb121g     LIKE xckb_t.xckb121g,
                          xckb121h     LIKE xckb_t.xckb121h
                          END RECORD
   DEFINE l_wc            STRING        #170325-00086#1 add  
   #l_xckb013_1為銷售單位，g_detail[li_ac].xckb013改抓基礎單位   
   DEFINE l_xckb013_1     LIKE xckb_t.xckb013   #銷售單位   #170626-00018#1 add
   #170310-00068#3-s add
   #加入二次篩選
   IF NOT cl_null(g_wc_filter) THEN
     #LET g_wc = g_wc CLIPPED,"AND ",g_wc_filter   #170618-00439#1 mark
      LET g_wc = g_wc CLIPPED," AND ",g_wc_filter  #170618-00439#1 add     
   END IF
   #170310-00068#3-e add
   #end add-point
 
   #200828-00027 -S-
   #檢查後疊加,避免重複
   #LET g_wc = g_wc, cl_sql_auth_filter()   #(ver:32) add cl_sql_auth_filter()
 
   LET ls_sqladdon_t = cl_sql_auth_filter()   #(ver:32) add cl_sql_auth_filter()
   IF NOT g_wc.getIndexOf(ls_sqladdon_t,1) THEN
      LET g_wc = g_wc, ls_sqladdon_t   #200917-00047
   END IF
   #200828-00027 -E-
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
 
   #end add-point
 
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
   CALL g_detail.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   CALL g_detail2.clear()
   #170328-00094#1 add --(S)--
   CALL g_detail3.clear()
   CALL g_detail4.clear()
   #170328-00094#1 add --(E)--
   CALL g_detail7.clear()   #170618-00439#1 add
   #end add-point
 
   LET l_ac = 1
 
   # b_fill段sql組成及FOREACH撰寫
   #應用 qs09 樣板自動產生(Version:3)
   #+ b_fill段資料取得(包含sql組成及FOREACH段撰寫)
   #add-point:b_fill段sql name="b_fill.sql"
   LET l_wc = g_wc                                       #170325-00086#1 add
   LET g_wc = cl_replace_str(g_wc,"xckc005","xckb022")   #170325-00086#1 add
   #170327-00055#1 add s---
   #增加帳套權限控制
   IF NOT cl_null(g_wc_cs_ld) THEN
      LET g_wc = g_wc," AND xckbld IN ",g_wc_cs_ld
   END IF   
   #170327-00055#1 add e---
   LET g_sql = "SELECT UNIQUE xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb036,xmdk001,xckb009,pmaal004,xckc005,",
               #170614-00002#1 add -s
               "       (SELECT glacl004 FROM glacl_t,glaa_t ",
               "         WHERE glaclent = ",g_enterprise,
               "           AND glacl001 = glaa004    ",
               "           AND glacl002 = xckc005    ",
               "           AND glacl003 = '",g_dlang,"' ",  
               "           AND glaald   = '",g_master.xckbld,"' ", 
               "           AND glaaent  = glaclent) xckc005_desc, ",
               #170614-00002#1 add -e
               "              xckb010,ooag011, ",        #160706-00021#1
               "              xckb011,ooefl003,xckb012,imaal003,imaal004,xckb037,'', ",    
               #"              xckb013,xckb014,xckb015,",   #170626-00018#1 mark
               #190124-00004#1---mod---s
               ##170626-00018#1 add --s
               ##xckb013改抓imaa_t的基礎單位
               #"              (SELECT imaa006 FROM imaa_t WHERE imaaent = xckbent AND imaa001 = xckb012) xckb013,",
               #"CASE WHEN xckb001 IN('1','2','3') THEN",
               #"      (SELECT DISTINCT xcck201 FROM xcck_t",
               #"        WHERE xckbent = xcckent AND xckbld = xcckld AND xckb007 = xcck004 AND xckb008 = xcck005",
               #"          AND xckb005 = xcck006 AND xckb006 = xcck007 AND xckb036 = xcck008)",
               #"     ELSE xckb014 END xckb014,",
               #"              xckb015,",
               ##170626-00018#1 add --e
               "              xckb020,xckb021,xckb015, ",
               #190124-00004#1---mod---s
               #170614-00002#1 add -s
               "        (SELECT inayl003 FROM inay_t  ", 
               "           LEFT OUTER JOIN inayl_t ON inayent = inaylent ",
               "                                  AND inay001 = inayl001 ",
               "                                  AND inayl002 = '",g_dlang,"'  ", 
               "                                WHERE inayent  = ",g_enterprise,
               "                                  AND inay001  = xckb015) xckb015_desc, ",
               #170614-00002#1 add -e
               "              xckb016,",
               #170614-00002#1 add -s
               "        (SELECT inab003 FROM inab_t   ",
               "          WHERE inabent  = ",g_enterprise,
               "            AND inabsite = '",g_site,"' ",
               "            AND inab001  = xckb015  ",
               "            AND inab002  = xckb016) xckb016_desc,",
               #170614-00002#1 add -e
               "              xckb017, ",
               "              xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h, ",
               "              xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h, ",
               "              xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h, ", #效能考虑
               "              xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h, ", #效能考虑
               "              xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h, ", #效能考虑
               "              xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h ", #效能考虑
               "             ,xckb013 xckb013_1",   #170626-00018#1 add  #xckb013_1為銷售單位，
               "  FROM xckb_t LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckb009 AND pmaal002='"||g_dlang||"' ",
               "              LEFT JOIN ooag_t  ON ooagent ='"||g_enterprise||"' AND ooag001 =xckb010 ",
               "              LEFT JOIN ooefl_t ON ooeflent='"||g_enterprise||"' AND ooefl001=xckb011 AND ooefl002='"||g_dlang||"' ",
               "              LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckb012 AND imaal002='"||g_dlang||"' ",
               "              LEFT JOIN xmdk_t  ON xmdkent ='"||g_enterprise||"' AND xmdkdocno=xckb005 ",
               "              LEFT JOIN xckc_t  ON xckcent = xckbent AND xckccomp = xckbcomp AND xckcld = xckbld ",        #160706-00021#1
               "                               AND xckc001 = xckb007 AND xckc002 = xckb008 AND xckc003 = xckb009 AND xckc004 = xckb012 AND xckc023 = xckb037 ",         #160706-00021#1
               "                               AND xckc024 = xckb005 AND xckc025 = xckb006",    #170323-00072#1
               " WHERE xckbent = ",g_enterprise,
               "   AND xckbcomp='",g_master.xckbcomp,"' ",
               "   AND xckbld  ='",g_master.xckbld,"' ",
               "   AND xckb007 = ",g_master.xckb007,
               "   AND xckb008 = ",g_master.xckb008,
               "   AND ",g_wc CLIPPED 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE axcq200_pb FROM g_sql
   DECLARE b_fill_cs CURSOR FOR axcq200_pb
   
   LET g_wc = l_wc                                 #170325-00086#1 add
   #为节约时间效能，组合到一个sql中
   #LET g_sql = "SELECT UNIQUE xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb036,xmdk001,xckb009,pmaal004,xckb010,ooag011, ",
   #            "              xckb011,ooefl003,xckb012,imaal003,imaal004,xckb037,'', ",
   #            "              xckb013,xckb014,xckb015,'',xckb016,'',xckb017, ",
   #            "              xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h, ",
   #            "              xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h ",
   #            "  FROM xckb_t LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckb009 AND pmaal002='"||g_dlang||"' ",
   #            "              LEFT JOIN ooag_t  ON ooagent ='"||g_enterprise||"' AND ooag001 =xckb010 ",
   #            "              LEFT JOIN ooefl_t ON ooeflent='"||g_enterprise||"' AND ooefl001=xckb011 AND ooefl002='"||g_dlang||"' ",
   #            "              LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckb012 AND imaal002='"||g_dlang||"' ",
   #            "              LEFT JOIN xmdk_t  ON xmdkent ='"||g_enterprise||"' AND xmdkdocno=xckb005 ",
   #            " WHERE xckbent = ",g_enterprise,
   #            "   AND xckbcomp='",g_master.xckbcomp,"' ",
   #            "   AND xckbld  ='",g_master.xckbld,"' ",
   #            "   AND xckb007 = ",g_master.xckb007,
   #            "   AND xckb008 = ",g_master.xckb008,
   #            "   AND ",g_wc CLIPPED 
   #LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #PREPARE axcq200_pb3 FROM g_sql
   #DECLARE b_fill_cs3 CURSOR FOR axcq200_pb3
   #
   #
   #LET g_sql = "SELECT UNIQUE xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb036,xmdk001,xckb009,pmaal004,xckb010,ooag011, ",
   #            "              xckb011,ooefl003,xckb012,imaal003,imaal004,xckb037,'', ",
   #            "              xckb013,xckb014,xckb015,'',xckb016,'',xckb017, ",
   #            "              xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h, ",
   #            "              xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h ",
   #            "  FROM xckb_t LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckb009 AND pmaal002='"||g_dlang||"' ",
   #            "              LEFT JOIN ooag_t  ON ooagent ='"||g_enterprise||"' AND ooag001 =xckb010 ",
   #            "              LEFT JOIN ooefl_t ON ooeflent='"||g_enterprise||"' AND ooefl001=xckb011 AND ooefl002='"||g_dlang||"' ",
   #            "              LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckb012 AND imaal002='"||g_dlang||"' ",
   #            "              LEFT JOIN xmdk_t  ON xmdkent ='"||g_enterprise||"' AND xmdkdocno=xckb005 ",
   #            " WHERE xckbent = ",g_enterprise,
   #            "   AND xckbcomp='",g_master.xckbcomp,"' ",
   #            "   AND xckbld  ='",g_master.xckbld,"' ",
   #            "   AND xckb007 = ",g_master.xckb007,
   #            "   AND xckb008 = ",g_master.xckb008,
   #            "   AND ",g_wc CLIPPED 
   #LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #PREPARE axcq200_pb4 FROM g_sql
   #DECLARE b_fill_cs4 CURSOR FOR axcq200_pb4
   #end add-point
 
 
 
 
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   LET li_ac = 1
   #FOREACH b_fill_cs INTO g_detail[li_ac].xckb001,g_detail[li_ac].xckb002,g_detail[li_ac].xckb003 ,
   #                       g_detail[li_ac].xckb004,g_detail[li_ac].xckb005,g_detail[li_ac].xckb006,
   #                       g_detail[li_ac].xckb036,g_detail[li_ac].xmdk001,
   #                       g_detail[li_ac].xckb009,g_detail[li_ac].xckb009_desc,
   #                       g_detail[li_ac].xckb010,g_detail[li_ac].xckb010_desc,
   #                       g_detail[li_ac].xckb011,g_detail[li_ac].xckb011_desc,
   #                       g_detail[li_ac].xckb012,g_detail[li_ac].xckb012_desc,g_detail[li_ac].xckb012_desc2,
   #                       g_detail[li_ac].xckb037,g_detail[li_ac].xckb037_desc,
   #                       g_detail[li_ac].xckb013,g_detail[li_ac].xckb014,
   #                       g_detail[li_ac].xckb015,g_detail[li_ac].xckb015_desc,
   #                       g_detail[li_ac].xckb016,g_detail[li_ac].xckb016_desc,
   #                       g_detail[li_ac].xckb017,
   #                       g_detail[li_ac].xckb102,
   #                       g_detail[li_ac].xckb102a,g_detail[li_ac].xckb102b,
   #                       g_detail[li_ac].xckb102c,g_detail[li_ac].xckb102d,
   #                       g_detail[li_ac].xckb102e,g_detail[li_ac].xckb102f,
   #                       g_detail[li_ac].xckb102g,g_detail[li_ac].xckb102h,
   #                       g_detail[li_ac].xckb101,
   #                       g_detail[li_ac].xckb101a,g_detail[li_ac].xckb101b,
   #                       g_detail[li_ac].xckb101c,g_detail[li_ac].xckb101d,
   #                       g_detail[li_ac].xckb101e,g_detail[li_ac].xckb101f,
   #                       g_detail[li_ac].xckb101g,g_detail[li_ac].xckb101h,
   FOREACH b_fill_cs INTO g_detail[li_ac].*,
                          l_xckb_amt.*  #效能考虑
                         ,l_xckb013_1   #170626-00018#1 add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      #CALL s_desc_get_account_desc(g_master.xckbld, g_detail[li_ac].xckc005) RETURNING  g_detail[li_ac].xckc005_desc    #160706-00021#1  #170614-00002#1 mark
      #显示产品特征说明
      CALL s_feature_description(g_detail[li_ac].xckb012,g_detail[li_ac].xckb037)
         RETURNING l_success,g_detail[li_ac].xckb037_desc
      IF NOT l_success THEN
         LET g_detail[li_ac].xckb037_desc = ''
      END IF
      #170614-00002#1 mark -s
#      #库位名称
#      CALL s_desc_get_stock_desc(g_detail[li_ac].xckb004,g_detail[li_ac].xckb015)
#         RETURNING g_detail[li_ac].xckb015_desc
#
#      #储位名称
#      IF NOT cl_null(g_detail[li_ac].xckb016) THEN
#         CALL s_desc_get_locator_desc(g_detail[li_ac].xckb004,g_detail[li_ac].xckb015,g_detail[li_ac].xckb016)
#            RETURNING g_detail[li_ac].xckb016_desc
#      END IF
       #170614-00002#1 mark -e
      #190124-00004#1---mark---s 
      ##170626-00018#1 add --s 
      ##當來源為4.發票，且基礎單位不等於銷售單位時，銷售單位需依轉換率換算成基礎數量
      #IF g_detail[li_ac].xckb001 = '4' THEN
      #   IF g_detail[li_ac].xckb013 != l_xckb013_1 THEN
      #      CALL s_aooi250_convert_qty1(g_detail[li_ac].xckb012,l_xckb013_1,g_detail[li_ac].xckb013,g_detail[li_ac].xckb014)
      #              RETURNING l_success, g_detail[li_ac].xckb014
      #   END IF
      #END IF
      #190124-00004#1---mark---e
      #190620-00009#1---mark---s
      ##如果來源為"1:銷退單"，數量應為負值
      #IF g_detail[li_ac].xckb001 = "3" THEN
      #   LET g_detail[li_ac].xckb014 = g_detail[li_ac].xckb014 * -1
      #END IF
      #190620-00009#1---mark---e
      #170626-00018#1 add --e
      #效能考虑-本位币二
      LET g_detail3[li_ac].* = g_detail[li_ac].*
      LET g_detail3[li_ac].xckb112  = l_xckb_amt.xckb112  
      LET g_detail3[li_ac].xckb112a = l_xckb_amt.xckb112a 
      LET g_detail3[li_ac].xckb112b = l_xckb_amt.xckb112b 
      LET g_detail3[li_ac].xckb112c = l_xckb_amt.xckb112c 
      LET g_detail3[li_ac].xckb112d = l_xckb_amt.xckb112d 
      LET g_detail3[li_ac].xckb112e = l_xckb_amt.xckb112e 
      LET g_detail3[li_ac].xckb112f = l_xckb_amt.xckb112f 
      LET g_detail3[li_ac].xckb112g = l_xckb_amt.xckb112g 
      LET g_detail3[li_ac].xckb112h = l_xckb_amt.xckb112h 
      LET g_detail3[li_ac].xckb111  = l_xckb_amt.xckb111  
      LET g_detail3[li_ac].xckb111a = l_xckb_amt.xckb111a 
      LET g_detail3[li_ac].xckb111b = l_xckb_amt.xckb111b 
      LET g_detail3[li_ac].xckb111c = l_xckb_amt.xckb111c 
      LET g_detail3[li_ac].xckb111d = l_xckb_amt.xckb111d 
      LET g_detail3[li_ac].xckb111e = l_xckb_amt.xckb111e 
      LET g_detail3[li_ac].xckb111f = l_xckb_amt.xckb111f 
      LET g_detail3[li_ac].xckb111g = l_xckb_amt.xckb111g 
      LET g_detail3[li_ac].xckb111h = l_xckb_amt.xckb111h
      
      #效能考虑-本位币三
      LET g_detail4[li_ac].* = g_detail[li_ac].*
      LET g_detail4[li_ac].xckb122  = l_xckb_amt.xckb122  
      LET g_detail4[li_ac].xckb122a = l_xckb_amt.xckb122a 
      LET g_detail4[li_ac].xckb122b = l_xckb_amt.xckb122b 
      LET g_detail4[li_ac].xckb122c = l_xckb_amt.xckb122c 
      LET g_detail4[li_ac].xckb122d = l_xckb_amt.xckb122d 
      LET g_detail4[li_ac].xckb122e = l_xckb_amt.xckb122e 
      LET g_detail4[li_ac].xckb122f = l_xckb_amt.xckb122f 
      LET g_detail4[li_ac].xckb122g = l_xckb_amt.xckb122g 
      LET g_detail4[li_ac].xckb122h = l_xckb_amt.xckb122h 
      LET g_detail4[li_ac].xckb121  = l_xckb_amt.xckb121  
      LET g_detail4[li_ac].xckb121a = l_xckb_amt.xckb121a 
      LET g_detail4[li_ac].xckb121b = l_xckb_amt.xckb121b 
      LET g_detail4[li_ac].xckb121c = l_xckb_amt.xckb121c 
      LET g_detail4[li_ac].xckb121d = l_xckb_amt.xckb121d 
      LET g_detail4[li_ac].xckb121e = l_xckb_amt.xckb121e 
      LET g_detail4[li_ac].xckb121f = l_xckb_amt.xckb121f 
      LET g_detail4[li_ac].xckb121g = l_xckb_amt.xckb121g 
      LET g_detail4[li_ac].xckb121h = l_xckb_amt.xckb121h
      
      IF li_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF 
         EXIT FOREACH
      END IF
      
      LET li_ac = li_ac + 1
          
   END FOREACH
   FREE axcq200_pb
   #190624-00019#1---add--(S)  
   #二次筛选清空二次筛选条件，需要重新显示栏位说明
   CALL axcq200_filter_show('xckb009','b_xckb009') 
   CALL axcq200_filter_show('xckb001','b_xckb001_1')
   CALL axcq200_filter_show('xckb002','b_xckb002_1')
   CALL axcq200_filter_show('xckb003','b_xckb003')
   CALL axcq200_filter_show('xckb004','b_xckb004')
   CALL axcq200_filter_show('xckb005','b_xckb005')
   CALL axcq200_filter_show('xckb006','b_xckb006')
   CALL axcq200_filter_show('xckb036','b_xckb036')
   CALL axcq200_filter_show('xmdk001','b_xmdk001_1')
   CALL axcq200_filter_show('xckc005','b_xckc005')
   CALL axcq200_filter_show('xckb010','b_xckb010')
   CALL axcq200_filter_show('xckb011','b_xckb011')
   CALL axcq200_filter_show('xckb012','b_xckb012')
   CALL axcq200_filter_show('xckb037','b_xckb037')
   CALL axcq200_filter_show('xckb013','b_xckb013')
   CALL axcq200_filter_show('xckb014','b_xckb014')
   CALL axcq200_filter_show('xckb015','b_xckb015')
   CALL axcq200_filter_show('xckb016','b_xckb016')
   CALL axcq200_filter_show('xckb017','b_xckb017')
   CALL axcq200_filter_show('xckb0102','b_xckb0102')
   CALL axcq200_filter_show('xckb0102a','b_xckb0102a')
   CALL axcq200_filter_show('xckb0102b','b_xckb0102b')
   CALL axcq200_filter_show('xckb0102c','b_xckb0102c')
   CALL axcq200_filter_show('xckb0102d','b_xckb0102d')
   CALL axcq200_filter_show('xckb0102e','b_xckb0102e')
   CALL axcq200_filter_show('xckb0102f','b_xckb0102f')
   CALL axcq200_filter_show('xckb0102g','b_xckb0102g')
   CALL axcq200_filter_show('xckb0102h','b_xckb0102h')
   CALL axcq200_filter_show('xckb0101','b_xckb0101')
   CALL axcq200_filter_show('xckb0101a','b_xckb0101a')
   CALL axcq200_filter_show('xckb0101b','b_xckb0101b')
   CALL axcq200_filter_show('xckb0101c','b_xckb0101c')
   CALL axcq200_filter_show('xckb0101d','b_xckb0101d')
   CALL axcq200_filter_show('xckb0101e','b_xckb0101e')
   CALL axcq200_filter_show('xckb0101f','b_xckb0101f')
   CALL axcq200_filter_show('xckb0101g','b_xckb0101g')
   CALL axcq200_filter_show('xckb0101h','b_xckb0101h')
   #190624-00019#1---add--(E) 
   #end add-point
 
   CALL g_detail.deleteElement(g_detail.getLength())
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
 
   #end add-point
 
   LET g_error_show = 0
 
   #單身總筆數顯示
   LET g_detail_cnt = g_detail.getLength()
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL axcq200_detail_index_setting()
 
   #重新計算單身筆數並呈現
#  CALL axcq200_detail_action_trans()   #(ver:34) mark
 
   CALL axcq200_b_fill2()
 
   CALL axcq200_detail_action_trans()   #(ver:34)
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.b_fill2" type="s" >}
#+ 單身陣列填充2
PRIVATE FUNCTION axcq200_b_fill2()
   #add-point:b_fill2段define-客製 name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:b_fill2段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   DEFINE lr_wc     STRING
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_xckc_amt      RECORD  #效能考虑
                          xckc015  LIKE xckc_t.xckc015, 
                          xckc015a LIKE xckc_t.xckc015a, 
                          xckc015b LIKE xckc_t.xckc015b, 
                          xckc015c LIKE xckc_t.xckc015c, 
                          xckc015d LIKE xckc_t.xckc015d, 
                          xckc015e LIKE xckc_t.xckc015e, 
                          xckc015f LIKE xckc_t.xckc015f, 
                          xckc015g LIKE xckc_t.xckc015g, 
                          xckc015h LIKE xckc_t.xckc015h,
                          xckc016  LIKE xckc_t.xckc016, 
                          xckc016a LIKE xckc_t.xckc016a, 
                          xckc016b LIKE xckc_t.xckc016b, 
                          xckc016c LIKE xckc_t.xckc016c, 
                          xckc016d LIKE xckc_t.xckc016d, 
                          xckc016e LIKE xckc_t.xckc016e, 
                          xckc016f LIKE xckc_t.xckc016f, 
                          xckc016g LIKE xckc_t.xckc016g, 
                          xckc016h LIKE xckc_t.xckc016h,
                          xckc017  LIKE xckc_t.xckc017, 
                          xckc017a LIKE xckc_t.xckc017a, 
                          xckc017b LIKE xckc_t.xckc017b, 
                          xckc017c LIKE xckc_t.xckc017c, 
                          xckc017d LIKE xckc_t.xckc017d, 
                          xckc017e LIKE xckc_t.xckc017e, 
                          xckc017f LIKE xckc_t.xckc017f, 
                          xckc017g LIKE xckc_t.xckc017g, 
                          xckc017h LIKE xckc_t.xckc017h,
                          xckc018  LIKE xckc_t.xckc018, 
                          xckc018a LIKE xckc_t.xckc018a, 
                          xckc018b LIKE xckc_t.xckc018b, 
                          xckc018c LIKE xckc_t.xckc018c, 
                          xckc018d LIKE xckc_t.xckc018d, 
                          xckc018e LIKE xckc_t.xckc018e, 
                          xckc018f LIKE xckc_t.xckc018f, 
                          xckc018g LIKE xckc_t.xckc018g, 
                          xckc018h LIKE xckc_t.xckc018h,
                          xckc019  LIKE xckc_t.xckc019, 
                          xckc019a LIKE xckc_t.xckc019a, 
                          xckc019b LIKE xckc_t.xckc019b, 
                          xckc019c LIKE xckc_t.xckc019c, 
                          xckc019d LIKE xckc_t.xckc019d, 
                          xckc019e LIKE xckc_t.xckc019e, 
                          xckc019f LIKE xckc_t.xckc019f, 
                          xckc019g LIKE xckc_t.xckc019g, 
                          xckc019h LIKE xckc_t.xckc019h,
                          xckc020  LIKE xckc_t.xckc020, 
                          xckc020a LIKE xckc_t.xckc020a, 
                          xckc020b LIKE xckc_t.xckc020b, 
                          xckc020c LIKE xckc_t.xckc020c, 
                          xckc020d LIKE xckc_t.xckc020d, 
                          xckc020e LIKE xckc_t.xckc020e, 
                          xckc020f LIKE xckc_t.xckc020f, 
                          xckc020g LIKE xckc_t.xckc020g, 
                          xckc020h LIKE xckc_t.xckc020h,
                          xckc021  LIKE xckc_t.xckc021, 
                          xckc021a LIKE xckc_t.xckc021a, 
                          xckc021b LIKE xckc_t.xckc021b, 
                          xckc021c LIKE xckc_t.xckc021c, 
                          xckc021d LIKE xckc_t.xckc021d, 
                          xckc021e LIKE xckc_t.xckc021e, 
                          xckc021f LIKE xckc_t.xckc021f, 
                          xckc021g LIKE xckc_t.xckc021g, 
                          xckc021h LIKE xckc_t.xckc021h,
                          xckc022  LIKE xckc_t.xckc022, 
                          xckc022a LIKE xckc_t.xckc022a, 
                          xckc022b LIKE xckc_t.xckc022b, 
                          xckc022c LIKE xckc_t.xckc022c, 
                          xckc022d LIKE xckc_t.xckc022d, 
                          xckc022e LIKE xckc_t.xckc022e, 
                          xckc022f LIKE xckc_t.xckc022f, 
                          xckc022g LIKE xckc_t.xckc022g, 
                          xckc022h LIKE xckc_t.xckc022h
                          END RECORD
   DEFINE l_xcbb010_t     LIKE xcbb_t.xcbb010
   DEFINE l_xckc003_t     LIKE xckc_t.xckc003
   DEFINE l_xcbb010_sum   RECORD  #按成本分群小计
                          xckc007  LIKE xckc_t.xckc007, 
                          xckc008  LIKE xckc_t.xckc008, 
                          xckc008a LIKE xckc_t.xckc008a, 
                          xckc008b LIKE xckc_t.xckc008b, 
                          xckc008c LIKE xckc_t.xckc008c, 
                          xckc008d LIKE xckc_t.xckc008d, 
                          xckc008e LIKE xckc_t.xckc008e, 
                          xckc008f LIKE xckc_t.xckc008f, 
                          xckc008g LIKE xckc_t.xckc008g, 
                          xckc008h LIKE xckc_t.xckc008h, 
                          xckc009  LIKE xckc_t.xckc009, 
                          xckc010  LIKE xckc_t.xckc010, 
                          xckc010a LIKE xckc_t.xckc010a, 
                          xckc010b LIKE xckc_t.xckc010b, 
                          xckc010c LIKE xckc_t.xckc010c, 
                          xckc010d LIKE xckc_t.xckc010d, 
                          xckc010e LIKE xckc_t.xckc010e, 
                          xckc010f LIKE xckc_t.xckc010f, 
                          xckc010g LIKE xckc_t.xckc010g, 
                          xckc010h LIKE xckc_t.xckc010h, 
                          xckc011  LIKE xckc_t.xckc011, 
                          xckc012  LIKE xckc_t.xckc012, 
                          xckc012a LIKE xckc_t.xckc012a, 
                          xckc012b LIKE xckc_t.xckc012b, 
                          xckc012c LIKE xckc_t.xckc012c, 
                          xckc012d LIKE xckc_t.xckc012d, 
                          xckc012e LIKE xckc_t.xckc012e, 
                          xckc012f LIKE xckc_t.xckc012f, 
                          xckc012g LIKE xckc_t.xckc012g, 
                          xckc012h LIKE xckc_t.xckc012h, 
                          xckc013  LIKE xckc_t.xckc013, 
                          xckc014  LIKE xckc_t.xckc014, 
                          xckc014a LIKE xckc_t.xckc014a, 
                          xckc014b LIKE xckc_t.xckc014b, 
                          xckc014c LIKE xckc_t.xckc014c, 
                          xckc014d LIKE xckc_t.xckc014d, 
                          xckc014e LIKE xckc_t.xckc014e, 
                          xckc014f LIKE xckc_t.xckc014f, 
                          xckc014g LIKE xckc_t.xckc014g, 
                          xckc014h LIKE xckc_t.xckc014h,
                          xckc015  LIKE xckc_t.xckc015, 
                          xckc015a LIKE xckc_t.xckc015a, 
                          xckc015b LIKE xckc_t.xckc015b, 
                          xckc015c LIKE xckc_t.xckc015c, 
                          xckc015d LIKE xckc_t.xckc015d, 
                          xckc015e LIKE xckc_t.xckc015e, 
                          xckc015f LIKE xckc_t.xckc015f, 
                          xckc015g LIKE xckc_t.xckc015g, 
                          xckc015h LIKE xckc_t.xckc015h,
                          xckc016  LIKE xckc_t.xckc016, 
                          xckc016a LIKE xckc_t.xckc016a, 
                          xckc016b LIKE xckc_t.xckc016b, 
                          xckc016c LIKE xckc_t.xckc016c, 
                          xckc016d LIKE xckc_t.xckc016d, 
                          xckc016e LIKE xckc_t.xckc016e, 
                          xckc016f LIKE xckc_t.xckc016f, 
                          xckc016g LIKE xckc_t.xckc016g, 
                          xckc016h LIKE xckc_t.xckc016h,
                          xckc017  LIKE xckc_t.xckc017, 
                          xckc017a LIKE xckc_t.xckc017a, 
                          xckc017b LIKE xckc_t.xckc017b, 
                          xckc017c LIKE xckc_t.xckc017c, 
                          xckc017d LIKE xckc_t.xckc017d, 
                          xckc017e LIKE xckc_t.xckc017e, 
                          xckc017f LIKE xckc_t.xckc017f, 
                          xckc017g LIKE xckc_t.xckc017g, 
                          xckc017h LIKE xckc_t.xckc017h,
                          xckc018  LIKE xckc_t.xckc018, 
                          xckc018a LIKE xckc_t.xckc018a, 
                          xckc018b LIKE xckc_t.xckc018b, 
                          xckc018c LIKE xckc_t.xckc018c, 
                          xckc018d LIKE xckc_t.xckc018d, 
                          xckc018e LIKE xckc_t.xckc018e, 
                          xckc018f LIKE xckc_t.xckc018f, 
                          xckc018g LIKE xckc_t.xckc018g, 
                          xckc018h LIKE xckc_t.xckc018h,
                          xckc019  LIKE xckc_t.xckc019, 
                          xckc019a LIKE xckc_t.xckc019a, 
                          xckc019b LIKE xckc_t.xckc019b, 
                          xckc019c LIKE xckc_t.xckc019c, 
                          xckc019d LIKE xckc_t.xckc019d, 
                          xckc019e LIKE xckc_t.xckc019e, 
                          xckc019f LIKE xckc_t.xckc019f, 
                          xckc019g LIKE xckc_t.xckc019g, 
                          xckc019h LIKE xckc_t.xckc019h,
                          xckc020  LIKE xckc_t.xckc020, 
                          xckc020a LIKE xckc_t.xckc020a, 
                          xckc020b LIKE xckc_t.xckc020b, 
                          xckc020c LIKE xckc_t.xckc020c, 
                          xckc020d LIKE xckc_t.xckc020d, 
                          xckc020e LIKE xckc_t.xckc020e, 
                          xckc020f LIKE xckc_t.xckc020f, 
                          xckc020g LIKE xckc_t.xckc020g, 
                          xckc020h LIKE xckc_t.xckc020h,
                          xckc021  LIKE xckc_t.xckc021, 
                          xckc021a LIKE xckc_t.xckc021a, 
                          xckc021b LIKE xckc_t.xckc021b, 
                          xckc021c LIKE xckc_t.xckc021c, 
                          xckc021d LIKE xckc_t.xckc021d, 
                          xckc021e LIKE xckc_t.xckc021e, 
                          xckc021f LIKE xckc_t.xckc021f, 
                          xckc021g LIKE xckc_t.xckc021g, 
                          xckc021h LIKE xckc_t.xckc021h,
                          xckc022  LIKE xckc_t.xckc022, 
                          xckc022a LIKE xckc_t.xckc022a, 
                          xckc022b LIKE xckc_t.xckc022b, 
                          xckc022c LIKE xckc_t.xckc022c, 
                          xckc022d LIKE xckc_t.xckc022d, 
                          xckc022e LIKE xckc_t.xckc022e, 
                          xckc022f LIKE xckc_t.xckc022f, 
                          xckc022g LIKE xckc_t.xckc022g, 
                          xckc022h LIKE xckc_t.xckc022h
                          END RECORD
   DEFINE l_xckc_tot      RECORD   #总计
                          xckc007  LIKE xckc_t.xckc007, 
                          xckc008  LIKE xckc_t.xckc008, 
                          xckc008a LIKE xckc_t.xckc008a, 
                          xckc008b LIKE xckc_t.xckc008b, 
                          xckc008c LIKE xckc_t.xckc008c, 
                          xckc008d LIKE xckc_t.xckc008d, 
                          xckc008e LIKE xckc_t.xckc008e, 
                          xckc008f LIKE xckc_t.xckc008f, 
                          xckc008g LIKE xckc_t.xckc008g, 
                          xckc008h LIKE xckc_t.xckc008h, 
                          xckc009  LIKE xckc_t.xckc009, 
                          xckc010  LIKE xckc_t.xckc010, 
                          xckc010a LIKE xckc_t.xckc010a, 
                          xckc010b LIKE xckc_t.xckc010b, 
                          xckc010c LIKE xckc_t.xckc010c, 
                          xckc010d LIKE xckc_t.xckc010d, 
                          xckc010e LIKE xckc_t.xckc010e, 
                          xckc010f LIKE xckc_t.xckc010f, 
                          xckc010g LIKE xckc_t.xckc010g, 
                          xckc010h LIKE xckc_t.xckc010h, 
                          xckc011  LIKE xckc_t.xckc011, 
                          xckc012  LIKE xckc_t.xckc012, 
                          xckc012a LIKE xckc_t.xckc012a, 
                          xckc012b LIKE xckc_t.xckc012b, 
                          xckc012c LIKE xckc_t.xckc012c, 
                          xckc012d LIKE xckc_t.xckc012d, 
                          xckc012e LIKE xckc_t.xckc012e, 
                          xckc012f LIKE xckc_t.xckc012f, 
                          xckc012g LIKE xckc_t.xckc012g, 
                          xckc012h LIKE xckc_t.xckc012h, 
                          xckc013  LIKE xckc_t.xckc013, 
                          xckc014  LIKE xckc_t.xckc014, 
                          xckc014a LIKE xckc_t.xckc014a, 
                          xckc014b LIKE xckc_t.xckc014b, 
                          xckc014c LIKE xckc_t.xckc014c, 
                          xckc014d LIKE xckc_t.xckc014d, 
                          xckc014e LIKE xckc_t.xckc014e, 
                          xckc014f LIKE xckc_t.xckc014f, 
                          xckc014g LIKE xckc_t.xckc014g, 
                          xckc014h LIKE xckc_t.xckc014h,
                          xckc015  LIKE xckc_t.xckc015, 
                          xckc015a LIKE xckc_t.xckc015a, 
                          xckc015b LIKE xckc_t.xckc015b, 
                          xckc015c LIKE xckc_t.xckc015c, 
                          xckc015d LIKE xckc_t.xckc015d, 
                          xckc015e LIKE xckc_t.xckc015e, 
                          xckc015f LIKE xckc_t.xckc015f, 
                          xckc015g LIKE xckc_t.xckc015g, 
                          xckc015h LIKE xckc_t.xckc015h,
                          xckc016  LIKE xckc_t.xckc016, 
                          xckc016a LIKE xckc_t.xckc016a, 
                          xckc016b LIKE xckc_t.xckc016b, 
                          xckc016c LIKE xckc_t.xckc016c, 
                          xckc016d LIKE xckc_t.xckc016d, 
                          xckc016e LIKE xckc_t.xckc016e, 
                          xckc016f LIKE xckc_t.xckc016f, 
                          xckc016g LIKE xckc_t.xckc016g, 
                          xckc016h LIKE xckc_t.xckc016h,
                          xckc017  LIKE xckc_t.xckc017, 
                          xckc017a LIKE xckc_t.xckc017a, 
                          xckc017b LIKE xckc_t.xckc017b, 
                          xckc017c LIKE xckc_t.xckc017c, 
                          xckc017d LIKE xckc_t.xckc017d, 
                          xckc017e LIKE xckc_t.xckc017e, 
                          xckc017f LIKE xckc_t.xckc017f, 
                          xckc017g LIKE xckc_t.xckc017g, 
                          xckc017h LIKE xckc_t.xckc017h,
                          xckc018  LIKE xckc_t.xckc018, 
                          xckc018a LIKE xckc_t.xckc018a, 
                          xckc018b LIKE xckc_t.xckc018b, 
                          xckc018c LIKE xckc_t.xckc018c, 
                          xckc018d LIKE xckc_t.xckc018d, 
                          xckc018e LIKE xckc_t.xckc018e, 
                          xckc018f LIKE xckc_t.xckc018f, 
                          xckc018g LIKE xckc_t.xckc018g, 
                          xckc018h LIKE xckc_t.xckc018h,
                          xckc019  LIKE xckc_t.xckc019, 
                          xckc019a LIKE xckc_t.xckc019a, 
                          xckc019b LIKE xckc_t.xckc019b, 
                          xckc019c LIKE xckc_t.xckc019c, 
                          xckc019d LIKE xckc_t.xckc019d, 
                          xckc019e LIKE xckc_t.xckc019e, 
                          xckc019f LIKE xckc_t.xckc019f, 
                          xckc019g LIKE xckc_t.xckc019g, 
                          xckc019h LIKE xckc_t.xckc019h,
                          xckc020  LIKE xckc_t.xckc020, 
                          xckc020a LIKE xckc_t.xckc020a, 
                          xckc020b LIKE xckc_t.xckc020b, 
                          xckc020c LIKE xckc_t.xckc020c, 
                          xckc020d LIKE xckc_t.xckc020d, 
                          xckc020e LIKE xckc_t.xckc020e, 
                          xckc020f LIKE xckc_t.xckc020f, 
                          xckc020g LIKE xckc_t.xckc020g, 
                          xckc020h LIKE xckc_t.xckc020h,
                          xckc021  LIKE xckc_t.xckc021, 
                          xckc021a LIKE xckc_t.xckc021a, 
                          xckc021b LIKE xckc_t.xckc021b, 
                          xckc021c LIKE xckc_t.xckc021c, 
                          xckc021d LIKE xckc_t.xckc021d, 
                          xckc021e LIKE xckc_t.xckc021e, 
                          xckc021f LIKE xckc_t.xckc021f, 
                          xckc021g LIKE xckc_t.xckc021g, 
                          xckc021h LIKE xckc_t.xckc021h,
                          xckc022  LIKE xckc_t.xckc022, 
                          xckc022a LIKE xckc_t.xckc022a, 
                          xckc022b LIKE xckc_t.xckc022b, 
                          xckc022c LIKE xckc_t.xckc022c, 
                          xckc022d LIKE xckc_t.xckc022d, 
                          xckc022e LIKE xckc_t.xckc022e, 
                          xckc022f LIKE xckc_t.xckc022f, 
                          xckc022g LIKE xckc_t.xckc022g, 
                          xckc022h LIKE xckc_t.xckc022h
                          END RECORD
   DEFINE l_glaa001  LIKE glaa_t.glaa016  #170427-00041#5                       
   DEFINE l_glaa016  LIKE glaa_t.glaa016  #170427-00041#5
   DEFINE l_glaa020  LIKE glaa_t.glaa020  #170427-00041#5
   #170618-00439#1 add --s
   DEFINE l_wc       STRING
   DEFINE l_str1     STRING
   DEFINE l_str2     STRING
   DEFINE l_s        LIKE type_t.num5
   DEFINE l_e        LIKE type_t.num5
   #170618-00439#1 add --e
#181129-00060#1 add_S                         
   DEFINE l_xckb_tot      RECORD   #总计
                          xckb027  LIKE xckb_t.xckb027, 
                          xckb102  LIKE xckb_t.xckb102
                          END RECORD                          
#181129-00060#1 add_E                  
   DEFINE l_glaa004       LIKE glaa_t.glaa004   #190628-00043#3 add
   #180720-00020#1---add---s 
   DEFINE l_xmdkdocdt     LIKE xmdk_t.xmdkdocdt
   DEFINE l_xmdk016       LIKE xmdk_t.xmdk016   
   DEFINE l_xmdk016_t     LIKE xmdk_t.xmdk016  
   DEFINE l_xckb026       LIKE xckb_t.xckb026  
   DEFINE l_rate1         LIKE apca_t.apca121
   DEFINE l_rate2         LIKE apca_t.apca121
   DEFINE l_rate3         LIKE apca_t.apca121 
   #180720-00020#1---add---e
   DEFINE l_wc_qq    STRING  #191113-00049#1 add
   #210511-00015#1 add(s)
   DEFINE lc_param   RECORD
                          type        LIKE type_t.chr1,       #類型
                          apca004     LIKE apca_t.apca004,    #交易對象
                          sfin2009    LIKE type_t.chr1        #匯率類型
                       END RECORD
   DEFINE ls_js       STRING
   #210511-00015#1 add(e)
   #end add-point
 
   #add-point:FUNCTION前置處理 name="b_fill2.before_function"
   
   #end add-point
 
   LET li_ac = 1
 
   #單身組成
   #應用 qs11 樣板自動產生(Version:3)
   #+ b_fill2段table資料取得(包含sql組成及資料填充)
   #add-point:sql組成 name="b_fill2.fill"
   #170427-00041#5 add(S)
   LET l_glaa001=''
   LET l_glaa016=''  
   LET l_glaa020=''
   #SELECT glaa001,glaa016,glaa020 INTO l_glaa001,l_glaa016,l_glaa020 FROM glaa_t WHERE glaaent=g_enterprise AND glaald=g_master.xckbld #191224-00020#2 mark
   #170427-00041#5 add(E)
   #191224-00020#2---mark---s
   LET l_glaa004 =''
   SELECT glaa004,glaa001,glaa016,glaa020
     INTO l_glaa004,l_glaa001,l_glaa016,l_glaa020   
     FROM glaa_t 
    WHERE glaaent =g_enterprise 
      AND glaald = g_master.xckbld  
   #191224-00020#2---mark---e
   
   CALL cl_set_comp_visible('b_xckc003,b_xckc003_desc,b_xckc004,b_xckc004_desc,b_xckc004_desc2,b_xckc023,b_xckc023_desc,b_xckc006,b_xckc007,b_xckc009,b_xckc011,b_xckc013',TRUE)
   #170220-00032#3 add(s)
   CALL cl_set_comp_visible('b_xckc024_0,b_xckc025_0,b_xckc024_1,b_xckc025_1,b_xckc024_2,b_xckc025_2',TRUE)
   #170220-00032#3 add(e)
   CASE tm.ca
      WHEN '1'  #客户
           CALL cl_set_comp_visible('b_xckc004,b_xckc004_desc,b_xckc004_desc2,b_xckc023,b_xckc023_desc,b_xckc006,b_xckc007,b_xckc009,b_xckc011,b_xckc013',FALSE)   
           #170220-00032#3 add(s)
           CALL cl_set_comp_visible('b_xckc024_0,b_xckc025_0,b_xckc024_1,b_xckc025_1,b_xckc024_2,b_xckc025_2',FALSE)
           #170220-00032#3 add(e)
      WHEN '2'  #产品
           CALL cl_set_comp_visible('b_xckc003,b_xckc003_desc',FALSE)
           #170220-00032#3 add(s)
           CALL cl_set_comp_visible('b_xckc024_0,b_xckc025_0,b_xckc024_1,b_xckc025_1,b_xckc024_2,b_xckc025_2',FALSE)
           #170220-00032#3 add(e)
      WHEN '3'  #客户+产品
           #无
           #170220-00032#3 add(s)
           CALL cl_set_comp_visible('b_xckc024_0,b_xckc025_0,b_xckc024_1,b_xckc025_1,b_xckc024_2,b_xckc025_2',FALSE)
           #170220-00032#3 add(e)
   END CASE
   
   CALL g_detail2.clear()
   #170328-00094#1 add --(S)--
   CALL g_detail5.clear()
   CALL g_detail6.clear()
   #170328-00094#1 add --(E)--
   LET lr_wc = g_wc
   LET lr_wc = cl_replace_str(lr_wc,"xckbcomp","xckccomp")
   LET lr_wc = cl_replace_str(lr_wc,"xckbld","xckcld")
   LET lr_wc = cl_replace_str(lr_wc,"xckb007","xckc001")
   LET lr_wc = cl_replace_str(lr_wc,"xckb008","xckc002")
   LET lr_wc = cl_replace_str(lr_wc,"xckb009","xckc003")
   LET lr_wc = cl_replace_str(lr_wc,"xckb012","xckc004")
   LET lr_wc = cl_replace_str(lr_wc,"xckb037","xckc023")
   LET lr_wc = cl_replace_str(lr_wc,"xckb001",tm.xckb001)  #170323-00073#1 add
   LET lr_wc = cl_replace_str(lr_wc,"xckb002",tm.xckb002)  #170323-00073#1 add
   LET lr_wc = cl_replace_str(lr_wc,"xckb004","xckcsite")  #180428-00018#1 add
   LET lr_wc = cl_replace_str(lr_wc,"xckb005","xckc024")   #190628-00043#3 add
   #LET tm.xckb001=""  #170323-00073#1 add
   #LET tm.xckb002=""  #170323-00073#1 add
   
   CASE tm.ca
      WHEN '1'  #客户
           #LET g_sql = "SELECT xcbb010,oocql004,'','','','','','','','',xckc003,pmaal004, ",               #170220-00032#3 add '','', #190106-00003#1 mark
           LET g_sql = "SELECT NVL(xcbb010,imag011),NVL(a.oocql004,b.oocql004),'','','','','','','','',xckc003,pmaal004, ",            #190106-00003#1 add
                       "      xckc005,glacl004,",#160706-00021#1 #191224-00020#2 add glacl004
                      #"      '',SUM(xckc008),SUM(xckc008a),SUM(xckc008b),SUM(xckc008c),SUM(xckc008d), ",               #170307-00017#1 mark
                       "         SUM(xckc007),SUM(xckc008),SUM(xckc008a),SUM(xckc008b),SUM(xckc008c),SUM(xckc008d), ",  #170307-00017#1 add
                       "                      SUM(xckc008e),SUM(xckc008f),SUM(xckc008g),SUM(xckc008h), ",
                      #"      '',SUM(xckc010),SUM(xckc010a),SUM(xckc010b),SUM(xckc010c),SUM(xckc010d), ",               #170307-00017#1 mark
                       "         SUM(xckc009),SUM(xckc010),SUM(xckc010a),SUM(xckc010b),SUM(xckc010c),SUM(xckc010d), ",  #170307-00017#1 add
                       "                      SUM(xckc010e),SUM(xckc010f),SUM(xckc010g),SUM(xckc010h), ",
                      #"      '',SUM(xckc012),SUM(xckc012a),SUM(xckc012b),SUM(xckc012c),SUM(xckc012d), ",               #170307-00017#1 mark
                       "         SUM(xckc011),SUM(xckc012),SUM(xckc012a),SUM(xckc012b),SUM(xckc012c),SUM(xckc012d), ",  #170307-00017#1 add
                       "                      SUM(xckc012e),SUM(xckc012f),SUM(xckc012g),SUM(xckc012h), ",            
                      #"      '',SUM(xckc014),SUM(xckc014a),SUM(xckc014b),SUM(xckc014c),SUM(xckc014d), ",               #170307-00017#1 mark
                       "         SUM(xckc013),SUM(xckc014),SUM(xckc014a),SUM(xckc014b),SUM(xckc014c),SUM(xckc014d), ",  #170307-00017#1 add
                       "                      SUM(xckc014e),SUM(xckc014f),SUM(xckc014g),SUM(xckc014h), ",
                       "         SUM(xckc015),SUM(xckc015a),SUM(xckc015b),SUM(xckc015c),SUM(xckc015d), ",
                       "                      SUM(xckc015e),SUM(xckc015f),SUM(xckc015g),SUM(xckc015h), ",
                       "         SUM(xckc016),SUM(xckc016a),SUM(xckc016b),SUM(xckc016c),SUM(xckc016d), ",
                       "                      SUM(xckc016e),SUM(xckc016f),SUM(xckc016g),SUM(xckc016h), ",
                       "         SUM(xckc017),SUM(xckc017a),SUM(xckc017b),SUM(xckc017c),SUM(xckc017d), ",
                       "                      SUM(xckc017e),SUM(xckc017f),SUM(xckc017g),SUM(xckc017h), ",
                       "         SUM(xckc018),SUM(xckc018a),SUM(xckc018b),SUM(xckc018c),SUM(xckc018d), ",
                       "                      SUM(xckc018e),SUM(xckc018f),SUM(xckc018g),SUM(xckc018h), ",
                       "         SUM(xckc019),SUM(xckc019a),SUM(xckc019b),SUM(xckc019c),SUM(xckc019d), ",
                       "                      SUM(xckc019e),SUM(xckc019f),SUM(xckc019g),SUM(xckc019h), ",
                       "         SUM(xckc020),SUM(xckc020a),SUM(xckc020b),SUM(xckc020c),SUM(xckc020d), ",
                       "                      SUM(xckc020e),SUM(xckc020f),SUM(xckc020g),SUM(xckc020h), ",
                       "         SUM(xckc021),SUM(xckc021a),SUM(xckc021b),SUM(xckc021c),SUM(xckc021d), ",
                       "                      SUM(xckc021e),SUM(xckc021f),SUM(xckc021g),SUM(xckc021h), ",
                       "         SUM(xckc022),SUM(xckc022a),SUM(xckc022b),SUM(xckc022c),SUM(xckc022d), ",
                       "                      SUM(xckc022e),SUM(xckc022f),SUM(xckc022g),SUM(xckc022h)  ",
                       "  FROM xckc_t LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckc004 AND imaal002='"||g_dlang||"' ",
                       "              LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckc003 AND pmaal002='"||g_dlang||"' ",
                       "              LEFT JOIN xcbb_t ON xcbbent = xckcent AND xcbbcomp= xckccomp AND xcbb001 = xckc001 AND xcbb002 = xckc002 AND xcbb003 = xckc004 AND xcbb004 = xckc023 ", #年度，期别,料号，特性
                       #190106-00003#1---mod---s
                       #"              LEFT JOIN oocql_t ON oocqlent='"||g_enterprise||"' AND oocql001='206' AND oocql002=xcbb010 AND oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN oocql_t a ON a.oocqlent='"||g_enterprise||"' AND a.oocql001='206' AND a.oocql002=xcbb010 AND a.oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN imag_t ON imagent = xckcent AND imagsite = '",g_master.xckbcomp,"' AND imag001 = xckc004",
                       "              LEFT JOIN oocql_t b ON b.oocqlent='"||g_enterprise||"' AND b.oocql001='206' AND b.oocql002=imag011 AND b.oocql003='"||g_dlang||"' ",
                       #190106-00003#1---mod---e
                       "              LEFT JOIN glacl_t ON glaclent = xckcent AND glacl001='",l_glaa004,"' AND glacl002=xckc005 AND glacl003='",g_dlang,"'", #191224-00020#2 add 
                       " WHERE xckcent = ",g_enterprise,
                       "   AND xckccomp='",g_master.xckbcomp,"' ",
                       "   AND xckcld  ='",g_master.xckbld,"' ",
                       "   AND xckc001 = ",g_master.xckb007,
                       "   AND xckc002 = ",g_master.xckb008,
                       "   AND ",lr_wc CLIPPED,
                       #" GROUP BY xcbb010,oocql004,xckc003,pmaal004,xckc005 ",      #160706-00021#1 #190106-00003#1 mark
                       #" ORDER BY xcbb010,oocql004,xckc003,pmaal004 "  #190106-00003#1 mark
                       " GROUP BY xcbb010,imag011,a.oocql004,b.oocql004,xckc003,pmaal004,xckc005,glacl004 ",      #190106-00003#1 add #191224-00020#2 add glacl004
                       " ORDER BY xcbb010,imag011,a.oocql004,b.oocql004,xckc003,pmaal004 "  #190106-00003#1 mark
      WHEN '2'  #产品
           #LET g_sql = "SELECT xcbb010,oocql004,'','',xckc004,imaal003,imaal004,xckc023,'',xckc006,'','', ",       #170220-00032#3 add '','',  #190106-00003#1 mark
           LET g_sql = "SELECT NVL(xcbb010,imag011),NVL(a.oocql004,b.oocql004),'','',xckc004,imaal003,imaal004,xckc023,inaml004,xckc006,'','', ",     #190106-00003#1   #191224-00020#2 add inaml004          
                       "      xckc005,glacl004,",#160706-00021#1 #191224-00020#2 add glacl004 
                       "      SUM(xckc007),SUM(xckc008),SUM(xckc008a),SUM(xckc008b),SUM(xckc008c),SUM(xckc008d), ",
                       "                                SUM(xckc008e),SUM(xckc008f),SUM(xckc008g),SUM(xckc008h), ",
                       "      SUM(xckc009),SUM(xckc010),SUM(xckc010a),SUM(xckc010b),SUM(xckc010c),SUM(xckc010d), ",
                       "                                SUM(xckc010e),SUM(xckc010f),SUM(xckc010g),SUM(xckc010h), ",
                       "      SUM(xckc011),SUM(xckc012),SUM(xckc012a),SUM(xckc012b),SUM(xckc012c),SUM(xckc012d), ",
                       "                                SUM(xckc012e),SUM(xckc012f),SUM(xckc012g),SUM(xckc012h), ",
                       "      SUM(xckc013),SUM(xckc014),SUM(xckc014a),SUM(xckc014b),SUM(xckc014c),SUM(xckc014d), ",
                       "                                SUM(xckc014e),SUM(xckc014f),SUM(xckc014g),SUM(xckc014h), ",
                       "                   SUM(xckc015),SUM(xckc015a),SUM(xckc015b),SUM(xckc015c),SUM(xckc015d), ",
                       "                                SUM(xckc015e),SUM(xckc015f),SUM(xckc015g),SUM(xckc015h), ",
                       "                   SUM(xckc016),SUM(xckc016a),SUM(xckc016b),SUM(xckc016c),SUM(xckc016d), ",
                       "                                SUM(xckc016e),SUM(xckc016f),SUM(xckc016g),SUM(xckc016h), ",
                       "                   SUM(xckc017),SUM(xckc017a),SUM(xckc017b),SUM(xckc017c),SUM(xckc017d), ",
                       "                                SUM(xckc017e),SUM(xckc017f),SUM(xckc017g),SUM(xckc017h), ",
                       "                   SUM(xckc018),SUM(xckc018a),SUM(xckc018b),SUM(xckc018c),SUM(xckc018d), ",
                       "                                SUM(xckc018e),SUM(xckc018f),SUM(xckc018g),SUM(xckc018h), ",
                       "                   SUM(xckc019),SUM(xckc019a),SUM(xckc019b),SUM(xckc019c),SUM(xckc019d), ",
                       "                                SUM(xckc019e),SUM(xckc019f),SUM(xckc019g),SUM(xckc019h), ",
                       "                   SUM(xckc020),SUM(xckc020a),SUM(xckc020b),SUM(xckc020c),SUM(xckc020d), ",
                       "                                SUM(xckc020e),SUM(xckc020f),SUM(xckc020g),SUM(xckc020h), ",
                       "                   SUM(xckc021),SUM(xckc021a),SUM(xckc021b),SUM(xckc021c),SUM(xckc021d), ",
                       "                                SUM(xckc021e),SUM(xckc021f),SUM(xckc021g),SUM(xckc021h), ",
                       "                   SUM(xckc022),SUM(xckc022a),SUM(xckc022b),SUM(xckc022c),SUM(xckc022d), ",
                       "                                SUM(xckc022e),SUM(xckc022f),SUM(xckc022g),SUM(xckc022h)  ",
                       "  FROM xckc_t LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckc004 AND imaal002='"||g_dlang||"' ",
                       "              LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckc003 AND pmaal002='"||g_dlang||"' ",
                       "              LEFT JOIN xcbb_t ON xcbbent = xckcent AND xcbbcomp= xckccomp AND xcbb001 = xckc001 AND xcbb002 = xckc002 AND xcbb003 = xckc004 AND xcbb004 = xckc023 ", #年度，期别,料号，特性
                       #190106-00003#1---mod---s
                       #"              LEFT JOIN oocql_t ON oocqlent='"||g_enterprise||"' AND oocql001='206' AND oocql002=xcbb010 AND oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN oocql_t a ON a.oocqlent='"||g_enterprise||"' AND a.oocql001='206' AND a.oocql002=xcbb010 AND a.oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN imag_t ON imagent = xckcent AND imagsite = '",g_master.xckbcomp,"' AND imag001 = xckc004",
                       "              LEFT JOIN oocql_t b ON b.oocqlent='"||g_enterprise||"' AND b.oocql001='206' AND b.oocql002=imag011 AND b.oocql003='"||g_dlang||"' ",
                       #190106-00003#1---mod---e" WHERE xckcent = ",g_enterprise,
                       "              LEFT JOIN glacl_t ON glaclent = xckcent AND glacl001='",l_glaa004,"' AND glacl002=xckc005 AND glacl003='",g_dlang,"'", #191224-00020#2 add 
                      #"              LEFT JOIN inaml_t ON inamlent=xckcent AND inaml001=xckc004 AND inaml002 = xckc023 AND imaal002='",g_dlang,"' ",  #191224-00020#2 add   #210104-00025#1 mark
                       "              LEFT JOIN inaml_t ON inamlent=xckcent AND inaml001=xckc004 AND inaml002 = xckc023 AND inaml003='",g_dlang,"' ",  #210104-00025#1 add
                       " WHERE xckcent = ",g_enterprise,   #210104-00025#1 add                       
                       "   AND xckccomp='",g_master.xckbcomp,"' ",
                       "   AND xckcld  ='",g_master.xckbld,"' ",
                       "   AND xckc001 = ",g_master.xckb007,
                       "   AND xckc002 = ",g_master.xckb008,
                       "   AND ",lr_wc CLIPPED,
                       #" GROUP BY xcbb010,oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc005 ",      #160706-00021#1 #190106-00003#1 mark
                       #" ORDER BY xcbb010,oocql004,xckc004,imaal003,imaal004,xckc023,xckc006 "  #190106-00003#1 mark
                       " GROUP BY xcbb010,imag011,a.oocql004,b.oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc005,glacl004,inaml004 ",      #190106-00003#1 add #191224-00020#2 add glacl004,inaml004
                       " ORDER BY xcbb010,imag011,a.oocql004,b.oocql004,xckc004,imaal003,imaal004,xckc023,xckc006 "  #190106-00003#1 
      WHEN '3'  #客户+产品
           #LET g_sql = "SELECT xcbb010,oocql004,'','',xckc004,imaal003,imaal004,xckc023,'',xckc006,xckc003,pmaal004, ",   #170220-00032#3 add '','',  #190106-00003#1 mark
           LET g_sql = "SELECT NVL(xcbb010,imag011),NVL(a.oocql004,b.oocql004),'','',xckc004,imaal003,imaal004,xckc023,inaml004,xckc006,xckc003,pmaal004, ", #190106-00003#1 add #191224-00020#2 add inaml004  
                       "      xckc005,glacl004,",#160706-00021#1 #191224-00020#2 add glacl004 
                       "      SUM(xckc007),SUM(xckc008),SUM(xckc008a),SUM(xckc008b),SUM(xckc008c),SUM(xckc008d), ",
                       "                                SUM(xckc008e),SUM(xckc008f),SUM(xckc008g),SUM(xckc008h), ",
                       "      SUM(xckc009),SUM(xckc010),SUM(xckc010a),SUM(xckc010b),SUM(xckc010c),SUM(xckc010d), ",
                       "                                SUM(xckc010e),SUM(xckc010f),SUM(xckc010g),SUM(xckc010h), ",
                       "      SUM(xckc011),SUM(xckc012),SUM(xckc012a),SUM(xckc012b),SUM(xckc012c),SUM(xckc012d), ",
                       "                                SUM(xckc012e),SUM(xckc012f),SUM(xckc012g),SUM(xckc012h), ",
                       "      SUM(xckc013),SUM(xckc014),SUM(xckc014a),SUM(xckc014b),SUM(xckc014c),SUM(xckc014d), ",
                       "                                SUM(xckc014e),SUM(xckc014f),SUM(xckc014g),SUM(xckc014h), ",
                       "                   SUM(xckc015),SUM(xckc015a),SUM(xckc015b),SUM(xckc015c),SUM(xckc015d), ",
                       "                                SUM(xckc015e),SUM(xckc015f),SUM(xckc015g),SUM(xckc015h), ",
                       "                   SUM(xckc016),SUM(xckc016a),SUM(xckc016b),SUM(xckc016c),SUM(xckc016d), ",
                       "                                SUM(xckc016e),SUM(xckc016f),SUM(xckc016g),SUM(xckc016h), ",
                       "                   SUM(xckc017),SUM(xckc017a),SUM(xckc017b),SUM(xckc017c),SUM(xckc017d), ",
                       "                                SUM(xckc017e),SUM(xckc017f),SUM(xckc017g),SUM(xckc017h), ",
                       "                   SUM(xckc018),SUM(xckc018a),SUM(xckc018b),SUM(xckc018c),SUM(xckc018d), ",
                       "                                SUM(xckc018e),SUM(xckc018f),SUM(xckc018g),SUM(xckc018h), ",
                       "                   SUM(xckc019),SUM(xckc019a),SUM(xckc019b),SUM(xckc019c),SUM(xckc019d), ",
                       "                                SUM(xckc019e),SUM(xckc019f),SUM(xckc019g),SUM(xckc019h), ",
                       "                   SUM(xckc020),SUM(xckc020a),SUM(xckc020b),SUM(xckc020c),SUM(xckc020d), ",
                       "                                SUM(xckc020e),SUM(xckc020f),SUM(xckc020g),SUM(xckc020h), ",
                       "                   SUM(xckc021),SUM(xckc021a),SUM(xckc021b),SUM(xckc021c),SUM(xckc021d), ",
                       "                                SUM(xckc021e),SUM(xckc021f),SUM(xckc021g),SUM(xckc021h), ",
                       "                   SUM(xckc022),SUM(xckc022a),SUM(xckc022b),SUM(xckc022c),SUM(xckc022d), ",
                       "                                SUM(xckc022e),SUM(xckc022f),SUM(xckc022g),SUM(xckc022h)  ",
                       "  FROM xckc_t LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckc004 AND imaal002='"||g_dlang||"' ",
                       "              LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckc003 AND pmaal002='"||g_dlang||"' ",
                       "              LEFT JOIN xcbb_t ON xcbbent = xckcent AND xcbbcomp= xckccomp AND xcbb001 = xckc001 AND xcbb002 = xckc002 AND xcbb003 = xckc004 AND xcbb004 = xckc023 ", #年度，期别,料号，特性
                       #190106-00003#1---mod---s
                       #"              LEFT JOIN oocql_t ON oocqlent='"||g_enterprise||"' AND oocql001='206' AND oocql002=xcbb010 AND oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN oocql_t a ON a.oocqlent='"||g_enterprise||"' AND a.oocql001='206' AND a.oocql002=xcbb010 AND a.oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN imag_t ON imagent = xckcent AND imagsite = '",g_master.xckbcomp,"' AND imag001 = xckc004",
                       "              LEFT JOIN oocql_t b ON b.oocqlent='"||g_enterprise||"' AND b.oocql001='206' AND b.oocql002=imag011 AND b.oocql003='"||g_dlang||"' ",
                       #190106-00003#1---mod---e
                       "              LEFT JOIN glacl_t ON glaclent = xckcent AND glacl001='",l_glaa004,"' AND glacl002=xckc005 AND glacl003='",g_dlang,"'", #191224-00020#2 add 
                      #"              LEFT JOIN inaml_t ON inamlent=xckcent AND inaml001=xckc004 AND inaml002 = xckc023 AND imaal002='",g_dlang,"' ",  #191224-00020#2 add      #210104-00025#1 mark
                       "              LEFT JOIN inaml_t ON inamlent=xckcent AND inaml001=xckc004 AND inaml002 = xckc023 AND inaml003='",g_dlang,"' ",  #210104-00025#1 add                      
                       " WHERE xckcent = ",g_enterprise,
                       "   AND xckccomp='",g_master.xckbcomp,"' ",
                       "   AND xckcld  ='",g_master.xckbld,"' ",
                       "   AND xckc001 = ",g_master.xckb007,
                       "   AND xckc002 = ",g_master.xckb008,
                       "   AND ",lr_wc CLIPPED,
                       #" GROUP BY xcbb010,oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004,xckc005 ",      #160706-00021#1 #190106-00003#1 mark
                       #" ORDER BY xcbb010,oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004 "  #190106-00003#1 mark
                       " GROUP BY xcbb010,imag011,a.oocql004,b.oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004,xckc005,glacl004,inaml004 ",      #190106-00003#1 add #191224-00020#2 add glacl004,inaml004
                       " ORDER BY xcbb010,imag011,a.oocql004,b.oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004 "  #190106-00003#1 
        #170220-00032#3 add(s)
        WHEN '4'  #出货单号+项次
           #LET g_sql = "SELECT xcbb010,oocql004,xckc024,xckc025,xckc004,imaal003,imaal004,xckc023,'',xckc006,xckc003,pmaal004, ",  #190106-00003#1 mark
           LET g_sql = "SELECT NVL(xcbb010,imag011),NVL(a.oocql004,b.oocql004),xckc024,xckc025,xckc004,imaal003,imaal004,xckc023,inaml004,xckc006,xckc003,pmaal004, ",  #190106-00003#1 add #191224-00020#2 add inaml004  
                       "      xckc005,glacl004,",#160706-00021#1 #191224-00020#2 add glacl004 
                       "      SUM(xckc007),SUM(xckc008),SUM(xckc008a),SUM(xckc008b),SUM(xckc008c),SUM(xckc008d), ",
                       "                                SUM(xckc008e),SUM(xckc008f),SUM(xckc008g),SUM(xckc008h), ",
                       "      SUM(xckc009),SUM(xckc010),SUM(xckc010a),SUM(xckc010b),SUM(xckc010c),SUM(xckc010d), ",
                       "                                SUM(xckc010e),SUM(xckc010f),SUM(xckc010g),SUM(xckc010h), ",
                       "      SUM(xckc011),SUM(xckc012),SUM(xckc012a),SUM(xckc012b),SUM(xckc012c),SUM(xckc012d), ",
                       "                                SUM(xckc012e),SUM(xckc012f),SUM(xckc012g),SUM(xckc012h), ",
                       "      SUM(xckc013),SUM(xckc014),SUM(xckc014a),SUM(xckc014b),SUM(xckc014c),SUM(xckc014d), ",
                       "                                SUM(xckc014e),SUM(xckc014f),SUM(xckc014g),SUM(xckc014h), ",
                       "                   SUM(xckc015),SUM(xckc015a),SUM(xckc015b),SUM(xckc015c),SUM(xckc015d), ",
                       "                                SUM(xckc015e),SUM(xckc015f),SUM(xckc015g),SUM(xckc015h), ",
                       "                   SUM(xckc016),SUM(xckc016a),SUM(xckc016b),SUM(xckc016c),SUM(xckc016d), ",
                       "                                SUM(xckc016e),SUM(xckc016f),SUM(xckc016g),SUM(xckc016h), ",
                       "                   SUM(xckc017),SUM(xckc017a),SUM(xckc017b),SUM(xckc017c),SUM(xckc017d), ",
                       "                                SUM(xckc017e),SUM(xckc017f),SUM(xckc017g),SUM(xckc017h), ",
                       "                   SUM(xckc018),SUM(xckc018a),SUM(xckc018b),SUM(xckc018c),SUM(xckc018d), ",
                       "                                SUM(xckc018e),SUM(xckc018f),SUM(xckc018g),SUM(xckc018h), ",
                       "                   SUM(xckc019),SUM(xckc019a),SUM(xckc019b),SUM(xckc019c),SUM(xckc019d), ",
                       "                                SUM(xckc019e),SUM(xckc019f),SUM(xckc019g),SUM(xckc019h), ",
                       "                   SUM(xckc020),SUM(xckc020a),SUM(xckc020b),SUM(xckc020c),SUM(xckc020d), ",
                       "                                SUM(xckc020e),SUM(xckc020f),SUM(xckc020g),SUM(xckc020h), ",
                       "                   SUM(xckc021),SUM(xckc021a),SUM(xckc021b),SUM(xckc021c),SUM(xckc021d), ",
                       "                                SUM(xckc021e),SUM(xckc021f),SUM(xckc021g),SUM(xckc021h), ",
                       "                   SUM(xckc022),SUM(xckc022a),SUM(xckc022b),SUM(xckc022c),SUM(xckc022d), ",
                       "                                SUM(xckc022e),SUM(xckc022f),SUM(xckc022g),SUM(xckc022h)  ",
                       "  FROM xckc_t LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckc004 AND imaal002='"||g_dlang||"' ",
                       "              LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckc003 AND pmaal002='"||g_dlang||"' ",
                       "              LEFT JOIN xcbb_t ON xcbbent = xckcent AND xcbbcomp= xckccomp AND xcbb001 = xckc001 AND xcbb002 = xckc002 AND xcbb003 = xckc004 AND xcbb004 = xckc023 ", #年度，期别,料号，特性
                       #190106-00003#1---mod---s
                       #"              LEFT JOIN oocql_t ON oocqlent='"||g_enterprise||"' AND oocql001='206' AND oocql002=xcbb010 AND oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN oocql_t a ON a.oocqlent='"||g_enterprise||"' AND a.oocql001='206' AND a.oocql002=xcbb010 AND a.oocql003='"||g_dlang||"' ",
                       "              LEFT JOIN imag_t ON imagent = xckcent AND imagsite = '",g_master.xckbcomp,"' AND imag001 = xckc004",
                       "              LEFT JOIN oocql_t b ON b.oocqlent='"||g_enterprise||"' AND b.oocql001='206' AND b.oocql002=imag011 AND b.oocql003='"||g_dlang||"' ",
                       #190106-00003#1---mod---e
                       "              LEFT JOIN glacl_t ON glaclent = xckcent AND glacl001='",l_glaa004,"' AND glacl002=xckc005 AND glacl003='",g_dlang,"'", #191224-00020#2 add 
                      #"              LEFT JOIN inaml_t ON inamlent=xckcent AND inaml001=xckc004 AND inaml002 = xckc023 AND imaal002='",g_dlang,"' ",  #191224-00020#2 add    #210104-00025#1 mark
                       "              LEFT JOIN inaml_t ON inamlent=xckcent AND inaml001=xckc004 AND inaml002 = xckc023 AND inaml003='",g_dlang,"' ",  #210104-00025#1 add                        
                       " WHERE xckcent = ",g_enterprise,
                       "   AND xckccomp='",g_master.xckbcomp,"' ",
                       "   AND xckcld  ='",g_master.xckbld,"' ",
                       "   AND xckc001 = ",g_master.xckb007,
                       "   AND xckc002 = ",g_master.xckb008,
                       "   AND ",lr_wc CLIPPED,
                       #" GROUP BY xckc024,xckc025,xcbb010,oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004,xckc005 ",      #160706-00021#1 #190106-00003#1 mark
                       #" ORDER BY xckc024,xckc025,xcbb010,oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004 "  #190106-00003#1 mark
                       " GROUP BY xckc024,xckc025,xcbb010,imag011,a.oocql004,b.oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004,xckc005,glacl004,inaml004 ",      #190106-00003#1 add #191224-00020#2 add glacl004,inaml004
                       " ORDER BY xckc024,xckc025,xcbb010,imag011,a.oocql004,b.oocql004,xckc004,imaal003,imaal004,xckc023,xckc006,xckc003,pmaal004 "  #190106-00003#1 
       #170220-00032#3 add(e)
   END CASE
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE axcq200_pb2 FROM g_sql
   DECLARE b_fill_cs2 CURSOR FOR axcq200_pb2
   #end add-point
 
 
 
 
 
 
   #add-point:單身填充後 name="b_fill2.after_fill"
   CALL axcq200_xcbb010_sum_to_0() RETURNING l_xcbb010_sum.*
   CALL axcq200_xckc_tot_to_0() RETURNING l_xckc_tot.*
   #191224-00020#2---mark---s
   ##190628-00043#3 add --(S)--
   #SELECT glaa004
   #  INTO l_glaa004   
   #  FROM glaa_t 
   # WHERE glaaent =g_enterprise 
   #   AND glaald = g_master.xckbld   
   ##190628-00043#3 add --(E)--
   #191224-00020#2---mark---e
   #FOREACH b_fill_cs2 INTO g_detail2[li_ac].xcbb010,g_detail2[li_ac].xcbb010_desc,
   #                        g_detail2[li_ac].xckc004,g_detail2[li_ac].xckc004_desc,g_detail2[li_ac].xckc004_desc2,
   #                        g_detail2[li_ac].xckc023,g_detail2[li_ac].xckc023_desc,g_detail2[li_ac].xckc006,
   #                        g_detail2[li_ac].xckc003,g_detail2[li_ac].xckc003_desc,
   #                        g_detail2[li_ac].xckc007,g_detail2[li_ac].xckc008,
   #                        g_detail2[li_ac].xckc008a,g_detail2[li_ac].xckc008b,
   #                        g_detail2[li_ac].xckc008c,g_detail2[li_ac].xckc008d,
   #                        g_detail2[li_ac].xckc008e,g_detail2[li_ac].xckc008f,
   #                        g_detail2[li_ac].xckc008g,g_detail2[li_ac].xckc008h,
   #                        g_detail2[li_ac].xckc009,g_detail2[li_ac].xckc010,
   #                        g_detail2[li_ac].xckc010a,g_detail2[li_ac].xckc010b,
   #                        g_detail2[li_ac].xckc010c,g_detail2[li_ac].xckc010d,
   #                        g_detail2[li_ac].xckc010e,g_detail2[li_ac].xckc010f,
   #                        g_detail2[li_ac].xckc010g,g_detail2[li_ac].xckc010h,
   #                        g_detail2[li_ac].xckc011,g_detail2[li_ac].xckc012,
   #                        g_detail2[li_ac].xckc012a,g_detail2[li_ac].xckc012b,
   #                        g_detail2[li_ac].xckc012c,g_detail2[li_ac].xckc012d,
   #                        g_detail2[li_ac].xckc012e,g_detail2[li_ac].xckc012f,
   #                        g_detail2[li_ac].xckc012g,g_detail2[li_ac].xckc012h,
   #                        g_detail2[li_ac].xckc013,g_detail2[li_ac].xckc014,
   #                        g_detail2[li_ac].xckc014a,g_detail2[li_ac].xckc014b,
   #                        g_detail2[li_ac].xckc014c,g_detail2[li_ac].xckc014d,
   #                        g_detail2[li_ac].xckc014e,g_detail2[li_ac].xckc014f,
   #                        g_detail2[li_ac].xckc014g,g_detail2[li_ac].xckc014h
   FOREACH b_fill_cs2 INTO g_detail2[li_ac].*,l_xckc_amt.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      #191224-00020#2---mark---s
      #CALL s_desc_get_account_desc(g_master.xckbld, g_detail2[li_ac].xckc005_6_desc) RETURNING  g_detail2[li_ac].xckc005_6_desc    #160706-00021#1
      ##显示产品特征说明
      #CALL s_feature_description(g_detail2[li_ac].xckc004,g_detail2[li_ac].xckc023)
      #   RETURNING l_success,g_detail2[li_ac].xckc023_desc
      #IF NOT l_success THEN
      #   LET g_detail2[li_ac].xckc023_desc = ''
      #END IF
      #
      ##190628-00043#3 add --(S)--
      ##顯示發出商品科目簡稱
      #INITIALIZE g_ref_fields TO NULL
      #LET g_ref_fields[1] = g_detail2[li_ac].xckc005
      #CALL ap_ref_array2(g_ref_fields,"SELECT glacl004 FROM glacl_t WHERE glaclent='"||g_enterprise||"' AND glacl001='"||l_glaa004||"' AND glacl002=? AND glacl003='"||g_dlang||"'","") RETURNING g_rtn_fields
      #LET g_detail2[li_ac].xckc005_6_desc = '', g_rtn_fields[1] , ''
      ##190628-00043#3 add --(E)--
      #191224-00020#2---mark---e
      
      #币种二
      LET g_detail5[li_ac].* = g_detail2[li_ac].*
      CALL s_desc_get_account_desc(g_master.xckbld, g_detail5[li_ac].xckc005_7_desc) RETURNING  g_detail5[li_ac].xckc005_7_desc    #160706-00021#1
      LET g_detail5[li_ac].xckc015  = l_xckc_amt.xckc015
      LET g_detail5[li_ac].xckc015a = l_xckc_amt.xckc015a 
      LET g_detail5[li_ac].xckc015b = l_xckc_amt.xckc015b 
      LET g_detail5[li_ac].xckc015c = l_xckc_amt.xckc015c 
      LET g_detail5[li_ac].xckc015d = l_xckc_amt.xckc015d 
      LET g_detail5[li_ac].xckc015e = l_xckc_amt.xckc015e 
      LET g_detail5[li_ac].xckc015f = l_xckc_amt.xckc015f 
      LET g_detail5[li_ac].xckc015g = l_xckc_amt.xckc015g 
      LET g_detail5[li_ac].xckc015h = l_xckc_amt.xckc015h
      LET g_detail5[li_ac].xckc016  = l_xckc_amt.xckc016
      LET g_detail5[li_ac].xckc016a = l_xckc_amt.xckc016a 
      LET g_detail5[li_ac].xckc016b = l_xckc_amt.xckc016b 
      LET g_detail5[li_ac].xckc016c = l_xckc_amt.xckc016c 
      LET g_detail5[li_ac].xckc016d = l_xckc_amt.xckc016d 
      LET g_detail5[li_ac].xckc016e = l_xckc_amt.xckc016e 
      LET g_detail5[li_ac].xckc016f = l_xckc_amt.xckc016f 
      LET g_detail5[li_ac].xckc016g = l_xckc_amt.xckc016g 
      LET g_detail5[li_ac].xckc016h = l_xckc_amt.xckc016h
      LET g_detail5[li_ac].xckc017  = l_xckc_amt.xckc017
      LET g_detail5[li_ac].xckc017a = l_xckc_amt.xckc017a 
      LET g_detail5[li_ac].xckc017b = l_xckc_amt.xckc017b 
      LET g_detail5[li_ac].xckc017c = l_xckc_amt.xckc017c 
      LET g_detail5[li_ac].xckc017d = l_xckc_amt.xckc017d 
      LET g_detail5[li_ac].xckc017e = l_xckc_amt.xckc017e 
      LET g_detail5[li_ac].xckc017f = l_xckc_amt.xckc017f 
      LET g_detail5[li_ac].xckc017g = l_xckc_amt.xckc017g 
      LET g_detail5[li_ac].xckc017h = l_xckc_amt.xckc017h
      LET g_detail5[li_ac].xckc018  = l_xckc_amt.xckc018
      LET g_detail5[li_ac].xckc018a = l_xckc_amt.xckc018a 
      LET g_detail5[li_ac].xckc018b = l_xckc_amt.xckc018b 
      LET g_detail5[li_ac].xckc018c = l_xckc_amt.xckc018c 
      LET g_detail5[li_ac].xckc018d = l_xckc_amt.xckc018d 
      LET g_detail5[li_ac].xckc018e = l_xckc_amt.xckc018e 
      LET g_detail5[li_ac].xckc018f = l_xckc_amt.xckc018f 
      LET g_detail5[li_ac].xckc018g = l_xckc_amt.xckc018g 
      LET g_detail5[li_ac].xckc018h = l_xckc_amt.xckc018h
      
      #币种三
      LET g_detail6[li_ac].* = g_detail2[li_ac].*
      LET g_detail6[li_ac].xckc019  = l_xckc_amt.xckc019
      LET g_detail6[li_ac].xckc019a = l_xckc_amt.xckc019a 
      LET g_detail6[li_ac].xckc019b = l_xckc_amt.xckc019b 
      LET g_detail6[li_ac].xckc019c = l_xckc_amt.xckc019c 
      LET g_detail6[li_ac].xckc019d = l_xckc_amt.xckc019d 
      LET g_detail6[li_ac].xckc019e = l_xckc_amt.xckc019e 
      LET g_detail6[li_ac].xckc019f = l_xckc_amt.xckc019f 
      LET g_detail6[li_ac].xckc019g = l_xckc_amt.xckc019g 
      LET g_detail6[li_ac].xckc019h = l_xckc_amt.xckc019h
      LET g_detail6[li_ac].xckc020  = l_xckc_amt.xckc020
      LET g_detail6[li_ac].xckc020a = l_xckc_amt.xckc020a 
      LET g_detail6[li_ac].xckc020b = l_xckc_amt.xckc020b 
      LET g_detail6[li_ac].xckc020c = l_xckc_amt.xckc020c 
      LET g_detail6[li_ac].xckc020d = l_xckc_amt.xckc020d 
      LET g_detail6[li_ac].xckc020e = l_xckc_amt.xckc020e 
      LET g_detail6[li_ac].xckc020f = l_xckc_amt.xckc020f 
      LET g_detail6[li_ac].xckc020g = l_xckc_amt.xckc020g 
      LET g_detail6[li_ac].xckc020h = l_xckc_amt.xckc020h
      LET g_detail6[li_ac].xckc021  = l_xckc_amt.xckc021
      LET g_detail6[li_ac].xckc021a = l_xckc_amt.xckc021a 
      LET g_detail6[li_ac].xckc021b = l_xckc_amt.xckc021b 
      LET g_detail6[li_ac].xckc021c = l_xckc_amt.xckc021c 
      LET g_detail6[li_ac].xckc021d = l_xckc_amt.xckc021d 
      LET g_detail6[li_ac].xckc021e = l_xckc_amt.xckc021e 
      LET g_detail6[li_ac].xckc021f = l_xckc_amt.xckc021f 
      LET g_detail6[li_ac].xckc021g = l_xckc_amt.xckc021g 
      LET g_detail6[li_ac].xckc021h = l_xckc_amt.xckc021h
      LET g_detail6[li_ac].xckc022  = l_xckc_amt.xckc022
      LET g_detail6[li_ac].xckc022a = l_xckc_amt.xckc022a 
      LET g_detail6[li_ac].xckc022b = l_xckc_amt.xckc022b 
      LET g_detail6[li_ac].xckc022c = l_xckc_amt.xckc022c 
      LET g_detail6[li_ac].xckc022d = l_xckc_amt.xckc022d 
      LET g_detail6[li_ac].xckc022e = l_xckc_amt.xckc022e 
      LET g_detail6[li_ac].xckc022f = l_xckc_amt.xckc022f 
      LET g_detail6[li_ac].xckc022g = l_xckc_amt.xckc022g 
      LET g_detail6[li_ac].xckc022h = l_xckc_amt.xckc022h
      
      #小计
      IF l_xcbb010_t IS NOT NULL OR l_xcbb010_t != g_detail2[li_ac].xcbb010 THEN   #170822-00009#1 mark  #171212-00022#1 remark
      #IF l_xckc003_t IS NOT NULL AND l_xckc003_t != g_detail2[li_ac].xckc003 THEN   #170822-00009#1 add  #171212-00022#1 mark
         #新xcbb010的下移一行，插入小计
         LET g_detail2[li_ac+1].* = g_detail6[li_ac].*
         LET g_detail5[li_ac+1].* = g_detail6[li_ac].*
         LET g_detail6[li_ac+1].* = g_detail6[li_ac].*
         INITIALIZE g_detail2[li_ac].* TO NULL
         INITIALIZE g_detail5[li_ac].* TO NULL
         INITIALIZE g_detail6[li_ac].* TO NULL
         #小计本位币页签显示
         IF li_ac > 1 THEN 
            LET g_detail2[li_ac].xcbb010_desc = g_detail2[li_ac-1].xcbb010,cl_getmsg("lib-00156",g_dlang) #小计  #170822-00009#1 mark  #171212-00022#1 remark 
            #LET g_detail2[li_ac].xckc003 = cl_getmsg("lib-00156",g_dlang)  #170822-00009#1 add  #171212-00022#1 mark
         END IF
         LET g_detail2[li_ac].xckc007  = l_xcbb010_sum.xckc007 
         LET g_detail2[li_ac].xckc008  = l_xcbb010_sum.xckc008 
         LET g_detail2[li_ac].xckc008a = l_xcbb010_sum.xckc008a
         LET g_detail2[li_ac].xckc008b = l_xcbb010_sum.xckc008b
         LET g_detail2[li_ac].xckc008c = l_xcbb010_sum.xckc008c
         LET g_detail2[li_ac].xckc008d = l_xcbb010_sum.xckc008d
         LET g_detail2[li_ac].xckc008e = l_xcbb010_sum.xckc008e
         LET g_detail2[li_ac].xckc008f = l_xcbb010_sum.xckc008f
         LET g_detail2[li_ac].xckc008g = l_xcbb010_sum.xckc008g
         LET g_detail2[li_ac].xckc008h = l_xcbb010_sum.xckc008h
         LET g_detail2[li_ac].xckc009  = l_xcbb010_sum.xckc009 
         LET g_detail2[li_ac].xckc010  = l_xcbb010_sum.xckc010 
         LET g_detail2[li_ac].xckc010a = l_xcbb010_sum.xckc010a
         LET g_detail2[li_ac].xckc010b = l_xcbb010_sum.xckc010b
         LET g_detail2[li_ac].xckc010c = l_xcbb010_sum.xckc010c
         LET g_detail2[li_ac].xckc010d = l_xcbb010_sum.xckc010d
         LET g_detail2[li_ac].xckc010e = l_xcbb010_sum.xckc010e
         LET g_detail2[li_ac].xckc010f = l_xcbb010_sum.xckc010f
         LET g_detail2[li_ac].xckc010g = l_xcbb010_sum.xckc010g
         LET g_detail2[li_ac].xckc010h = l_xcbb010_sum.xckc010h
         #170725-00076#6  add  -s
         IF cl_null(l_xcbb010_sum.xckc011 ) THEN
            LET l_xcbb010_sum.xckc011 = 0 
         END IF 
         #170725-00076#6  add  -e
         LET g_detail2[li_ac].xckc011  = l_xcbb010_sum.xckc011 
         LET g_detail2[li_ac].xckc012  = l_xcbb010_sum.xckc012 
         LET g_detail2[li_ac].xckc012a = l_xcbb010_sum.xckc012a
         LET g_detail2[li_ac].xckc012b = l_xcbb010_sum.xckc012b
         LET g_detail2[li_ac].xckc012c = l_xcbb010_sum.xckc012c
         LET g_detail2[li_ac].xckc012d = l_xcbb010_sum.xckc012d
         LET g_detail2[li_ac].xckc012e = l_xcbb010_sum.xckc012e
         LET g_detail2[li_ac].xckc012f = l_xcbb010_sum.xckc012f
         LET g_detail2[li_ac].xckc012g = l_xcbb010_sum.xckc012g
         LET g_detail2[li_ac].xckc012h = l_xcbb010_sum.xckc012h
         LET g_detail2[li_ac].xckc013  = l_xcbb010_sum.xckc013 
         LET g_detail2[li_ac].xckc014  = l_xcbb010_sum.xckc014 
         LET g_detail2[li_ac].xckc014a = l_xcbb010_sum.xckc014a
         LET g_detail2[li_ac].xckc014b = l_xcbb010_sum.xckc014b
         LET g_detail2[li_ac].xckc014c = l_xcbb010_sum.xckc014c
         LET g_detail2[li_ac].xckc014d = l_xcbb010_sum.xckc014d
         LET g_detail2[li_ac].xckc014e = l_xcbb010_sum.xckc014e
         LET g_detail2[li_ac].xckc014f = l_xcbb010_sum.xckc014f
         LET g_detail2[li_ac].xckc014g = l_xcbb010_sum.xckc014g
         LET g_detail2[li_ac].xckc014h = l_xcbb010_sum.xckc014h
         #小计币别二页签显示
         IF li_ac > 1 THEN 
            LET g_detail5[li_ac].xcbb010_1_desc = g_detail5[li_ac-1].xcbb010,cl_getmsg("lib-00156",g_dlang) #小计
         END IF
         LET g_detail5[li_ac].xckc007  = l_xcbb010_sum.xckc007 
         LET g_detail5[li_ac].xckc015  = l_xcbb010_sum.xckc015 
         LET g_detail5[li_ac].xckc015a = l_xcbb010_sum.xckc015a
         LET g_detail5[li_ac].xckc015b = l_xcbb010_sum.xckc015b
         LET g_detail5[li_ac].xckc015c = l_xcbb010_sum.xckc015c
         LET g_detail5[li_ac].xckc015d = l_xcbb010_sum.xckc015d
         LET g_detail5[li_ac].xckc015e = l_xcbb010_sum.xckc015e
         LET g_detail5[li_ac].xckc015f = l_xcbb010_sum.xckc015f
         LET g_detail5[li_ac].xckc015g = l_xcbb010_sum.xckc015g
         LET g_detail5[li_ac].xckc015h = l_xcbb010_sum.xckc015h
         LET g_detail5[li_ac].xckc009  = l_xcbb010_sum.xckc009 
         LET g_detail5[li_ac].xckc016  = l_xcbb010_sum.xckc016 
         LET g_detail5[li_ac].xckc016a = l_xcbb010_sum.xckc016a
         LET g_detail5[li_ac].xckc016b = l_xcbb010_sum.xckc016b
         LET g_detail5[li_ac].xckc016c = l_xcbb010_sum.xckc016c
         LET g_detail5[li_ac].xckc016d = l_xcbb010_sum.xckc016d
         LET g_detail5[li_ac].xckc016e = l_xcbb010_sum.xckc016e
         LET g_detail5[li_ac].xckc016f = l_xcbb010_sum.xckc016f
         LET g_detail5[li_ac].xckc016g = l_xcbb010_sum.xckc016g
         LET g_detail5[li_ac].xckc016h = l_xcbb010_sum.xckc016h
         LET g_detail5[li_ac].xckc011  = l_xcbb010_sum.xckc011 
         LET g_detail5[li_ac].xckc017  = l_xcbb010_sum.xckc017 
         LET g_detail5[li_ac].xckc017a = l_xcbb010_sum.xckc017a
         LET g_detail5[li_ac].xckc017b = l_xcbb010_sum.xckc017b
         LET g_detail5[li_ac].xckc017c = l_xcbb010_sum.xckc017c
         LET g_detail5[li_ac].xckc017d = l_xcbb010_sum.xckc017d
         LET g_detail5[li_ac].xckc017e = l_xcbb010_sum.xckc017e
         LET g_detail5[li_ac].xckc017f = l_xcbb010_sum.xckc017f
         LET g_detail5[li_ac].xckc017g = l_xcbb010_sum.xckc017g
         LET g_detail5[li_ac].xckc017h = l_xcbb010_sum.xckc017h
         LET g_detail5[li_ac].xckc013  = l_xcbb010_sum.xckc013 
         LET g_detail5[li_ac].xckc018  = l_xcbb010_sum.xckc018 
         LET g_detail5[li_ac].xckc018a = l_xcbb010_sum.xckc018a
         LET g_detail5[li_ac].xckc018b = l_xcbb010_sum.xckc018b
         LET g_detail5[li_ac].xckc018c = l_xcbb010_sum.xckc018c
         LET g_detail5[li_ac].xckc018d = l_xcbb010_sum.xckc018d
         LET g_detail5[li_ac].xckc018e = l_xcbb010_sum.xckc018e
         LET g_detail5[li_ac].xckc018f = l_xcbb010_sum.xckc018f
         LET g_detail5[li_ac].xckc018g = l_xcbb010_sum.xckc018g
         LET g_detail5[li_ac].xckc018h = l_xcbb010_sum.xckc018h
         #小计币别三页签显示
         IF li_ac > 1 THEN 
            LET g_detail6[li_ac].xcbb010_2_desc = g_detail6[li_ac-1].xcbb010,cl_getmsg("lib-00156",g_dlang) #小计
         END IF
         LET g_detail6[li_ac].xckc007  = l_xcbb010_sum.xckc007 
         LET g_detail6[li_ac].xckc019  = l_xcbb010_sum.xckc019 
         LET g_detail6[li_ac].xckc019a = l_xcbb010_sum.xckc019a
         LET g_detail6[li_ac].xckc019b = l_xcbb010_sum.xckc019b
         LET g_detail6[li_ac].xckc019c = l_xcbb010_sum.xckc019c
         LET g_detail6[li_ac].xckc019d = l_xcbb010_sum.xckc019d
         LET g_detail6[li_ac].xckc019e = l_xcbb010_sum.xckc019e
         LET g_detail6[li_ac].xckc019f = l_xcbb010_sum.xckc019f
         LET g_detail6[li_ac].xckc019g = l_xcbb010_sum.xckc019g
         LET g_detail6[li_ac].xckc019h = l_xcbb010_sum.xckc019h
         LET g_detail6[li_ac].xckc009  = l_xcbb010_sum.xckc009 
         LET g_detail6[li_ac].xckc020  = l_xcbb010_sum.xckc020 
         LET g_detail6[li_ac].xckc020a = l_xcbb010_sum.xckc020a
         LET g_detail6[li_ac].xckc020b = l_xcbb010_sum.xckc020b
         LET g_detail6[li_ac].xckc020c = l_xcbb010_sum.xckc020c
         LET g_detail6[li_ac].xckc020d = l_xcbb010_sum.xckc020d
         LET g_detail6[li_ac].xckc020e = l_xcbb010_sum.xckc020e
         LET g_detail6[li_ac].xckc020f = l_xcbb010_sum.xckc020f
         LET g_detail6[li_ac].xckc020g = l_xcbb010_sum.xckc020g
         LET g_detail6[li_ac].xckc020h = l_xcbb010_sum.xckc020h
         LET g_detail6[li_ac].xckc011  = l_xcbb010_sum.xckc011 
         LET g_detail6[li_ac].xckc021  = l_xcbb010_sum.xckc021 
         LET g_detail6[li_ac].xckc021a = l_xcbb010_sum.xckc021a
         LET g_detail6[li_ac].xckc021b = l_xcbb010_sum.xckc021b
         LET g_detail6[li_ac].xckc021c = l_xcbb010_sum.xckc021c
         LET g_detail6[li_ac].xckc021d = l_xcbb010_sum.xckc021d
         LET g_detail6[li_ac].xckc021e = l_xcbb010_sum.xckc021e
         LET g_detail6[li_ac].xckc021f = l_xcbb010_sum.xckc021f
         LET g_detail6[li_ac].xckc021g = l_xcbb010_sum.xckc021g
         LET g_detail6[li_ac].xckc021h = l_xcbb010_sum.xckc021h
         LET g_detail6[li_ac].xckc013  = l_xcbb010_sum.xckc013 
         LET g_detail6[li_ac].xckc022  = l_xcbb010_sum.xckc022 
         LET g_detail6[li_ac].xckc022a = l_xcbb010_sum.xckc022a
         LET g_detail6[li_ac].xckc022b = l_xcbb010_sum.xckc022b
         LET g_detail6[li_ac].xckc022c = l_xcbb010_sum.xckc022c
         LET g_detail6[li_ac].xckc022d = l_xcbb010_sum.xckc022d
         LET g_detail6[li_ac].xckc022e = l_xcbb010_sum.xckc022e
         LET g_detail6[li_ac].xckc022f = l_xcbb010_sum.xckc022f
         LET g_detail6[li_ac].xckc022g = l_xcbb010_sum.xckc022g
         LET g_detail6[li_ac].xckc022h = l_xcbb010_sum.xckc022h
         
         CALL axcq200_xcbb010_sum_to_0() RETURNING l_xcbb010_sum.*
         LET li_ac = li_ac + 1
         LET l_xcbb010_t = g_detail2[li_ac].xcbb010   #170822-00009#1 mark  #171212-00022#1 remark
      END IF
      
      #新一轮小计合计
      #小计-本位币
      LET l_xcbb010_sum.xckc007  = l_xcbb010_sum.xckc007  + g_detail2[li_ac].xckc007 
      LET l_xcbb010_sum.xckc008  = l_xcbb010_sum.xckc008  + g_detail2[li_ac].xckc008 
      LET l_xcbb010_sum.xckc008a = l_xcbb010_sum.xckc008a + g_detail2[li_ac].xckc008a
      LET l_xcbb010_sum.xckc008b = l_xcbb010_sum.xckc008b + g_detail2[li_ac].xckc008b
      LET l_xcbb010_sum.xckc008c = l_xcbb010_sum.xckc008c + g_detail2[li_ac].xckc008c
      LET l_xcbb010_sum.xckc008d = l_xcbb010_sum.xckc008d + g_detail2[li_ac].xckc008d
      LET l_xcbb010_sum.xckc008e = l_xcbb010_sum.xckc008e + g_detail2[li_ac].xckc008e
      LET l_xcbb010_sum.xckc008f = l_xcbb010_sum.xckc008f + g_detail2[li_ac].xckc008f
      LET l_xcbb010_sum.xckc008g = l_xcbb010_sum.xckc008g + g_detail2[li_ac].xckc008g
      LET l_xcbb010_sum.xckc008h = l_xcbb010_sum.xckc008h + g_detail2[li_ac].xckc008h
      LET l_xcbb010_sum.xckc009  = l_xcbb010_sum.xckc009  + g_detail2[li_ac].xckc009 
      LET l_xcbb010_sum.xckc010  = l_xcbb010_sum.xckc010  + g_detail2[li_ac].xckc010 
      LET l_xcbb010_sum.xckc010a = l_xcbb010_sum.xckc010a + g_detail2[li_ac].xckc010a
      LET l_xcbb010_sum.xckc010b = l_xcbb010_sum.xckc010b + g_detail2[li_ac].xckc010b
      LET l_xcbb010_sum.xckc010c = l_xcbb010_sum.xckc010c + g_detail2[li_ac].xckc010c
      LET l_xcbb010_sum.xckc010d = l_xcbb010_sum.xckc010d + g_detail2[li_ac].xckc010d
      LET l_xcbb010_sum.xckc010e = l_xcbb010_sum.xckc010e + g_detail2[li_ac].xckc010e
      LET l_xcbb010_sum.xckc010f = l_xcbb010_sum.xckc010f + g_detail2[li_ac].xckc010f
      LET l_xcbb010_sum.xckc010g = l_xcbb010_sum.xckc010g + g_detail2[li_ac].xckc010g
      LET l_xcbb010_sum.xckc010h = l_xcbb010_sum.xckc010h + g_detail2[li_ac].xckc010h
      LET l_xcbb010_sum.xckc011  = l_xcbb010_sum.xckc011  + g_detail2[li_ac].xckc011 
     #LET l_xcbb010_sum.xckc012  = l_xcbb010_sum.xckc017  + g_detail2[li_ac].xckc012    #170307-00017#1 mark
      LET l_xcbb010_sum.xckc012  = l_xcbb010_sum.xckc012  + g_detail2[li_ac].xckc012    #170307-00017#1 add
      LET l_xcbb010_sum.xckc012a = l_xcbb010_sum.xckc012a + g_detail2[li_ac].xckc012a
      LET l_xcbb010_sum.xckc012b = l_xcbb010_sum.xckc012b + g_detail2[li_ac].xckc012b
      LET l_xcbb010_sum.xckc012c = l_xcbb010_sum.xckc012c + g_detail2[li_ac].xckc012c
      LET l_xcbb010_sum.xckc012d = l_xcbb010_sum.xckc012d + g_detail2[li_ac].xckc012d
      LET l_xcbb010_sum.xckc012e = l_xcbb010_sum.xckc012e + g_detail2[li_ac].xckc012e
      LET l_xcbb010_sum.xckc012f = l_xcbb010_sum.xckc012f + g_detail2[li_ac].xckc012f
      LET l_xcbb010_sum.xckc012g = l_xcbb010_sum.xckc012g + g_detail2[li_ac].xckc012g
      LET l_xcbb010_sum.xckc012h = l_xcbb010_sum.xckc012h + g_detail2[li_ac].xckc012h
      LET l_xcbb010_sum.xckc013  = l_xcbb010_sum.xckc013  + g_detail2[li_ac].xckc013 
      LET l_xcbb010_sum.xckc014  = l_xcbb010_sum.xckc014  + g_detail2[li_ac].xckc014 
      LET l_xcbb010_sum.xckc014a = l_xcbb010_sum.xckc014a + g_detail2[li_ac].xckc014a
      LET l_xcbb010_sum.xckc014b = l_xcbb010_sum.xckc014b + g_detail2[li_ac].xckc014b
      LET l_xcbb010_sum.xckc014c = l_xcbb010_sum.xckc014c + g_detail2[li_ac].xckc014c
      LET l_xcbb010_sum.xckc014d = l_xcbb010_sum.xckc014d + g_detail2[li_ac].xckc014d
      LET l_xcbb010_sum.xckc014e = l_xcbb010_sum.xckc014e + g_detail2[li_ac].xckc014e
      LET l_xcbb010_sum.xckc014f = l_xcbb010_sum.xckc014f + g_detail2[li_ac].xckc014f
      LET l_xcbb010_sum.xckc014g = l_xcbb010_sum.xckc014g + g_detail2[li_ac].xckc014g
      LET l_xcbb010_sum.xckc014h = l_xcbb010_sum.xckc014h + g_detail2[li_ac].xckc014h
      
      
      
      #小计-币种二                                              
      LET l_xcbb010_sum.xckc015  = l_xcbb010_sum.xckc015  + g_detail5[li_ac].xckc015 
      LET l_xcbb010_sum.xckc015a = l_xcbb010_sum.xckc015a + g_detail5[li_ac].xckc015a
      LET l_xcbb010_sum.xckc015b = l_xcbb010_sum.xckc015b + g_detail5[li_ac].xckc015b
      LET l_xcbb010_sum.xckc015c = l_xcbb010_sum.xckc015c + g_detail5[li_ac].xckc015c
      LET l_xcbb010_sum.xckc015d = l_xcbb010_sum.xckc015d + g_detail5[li_ac].xckc015d
      LET l_xcbb010_sum.xckc015e = l_xcbb010_sum.xckc015e + g_detail5[li_ac].xckc015e
      LET l_xcbb010_sum.xckc015f = l_xcbb010_sum.xckc015f + g_detail5[li_ac].xckc015f
      LET l_xcbb010_sum.xckc015g = l_xcbb010_sum.xckc015g + g_detail5[li_ac].xckc015g
      LET l_xcbb010_sum.xckc015h = l_xcbb010_sum.xckc015h + g_detail5[li_ac].xckc015h
      LET l_xcbb010_sum.xckc016  = l_xcbb010_sum.xckc016  + g_detail5[li_ac].xckc016 
      LET l_xcbb010_sum.xckc016a = l_xcbb010_sum.xckc016a + g_detail5[li_ac].xckc016a
      LET l_xcbb010_sum.xckc016b = l_xcbb010_sum.xckc016b + g_detail5[li_ac].xckc016b
      LET l_xcbb010_sum.xckc016c = l_xcbb010_sum.xckc016c + g_detail5[li_ac].xckc016c
      LET l_xcbb010_sum.xckc016d = l_xcbb010_sum.xckc016d + g_detail5[li_ac].xckc016d
      LET l_xcbb010_sum.xckc016e = l_xcbb010_sum.xckc016e + g_detail5[li_ac].xckc016e
      LET l_xcbb010_sum.xckc016f = l_xcbb010_sum.xckc016f + g_detail5[li_ac].xckc016f
      LET l_xcbb010_sum.xckc016g = l_xcbb010_sum.xckc016g + g_detail5[li_ac].xckc016g
      LET l_xcbb010_sum.xckc016h = l_xcbb010_sum.xckc016h + g_detail5[li_ac].xckc016h
      LET l_xcbb010_sum.xckc017  = l_xcbb010_sum.xckc017  + g_detail5[li_ac].xckc017 
      LET l_xcbb010_sum.xckc017a = l_xcbb010_sum.xckc017a + g_detail5[li_ac].xckc017a
      LET l_xcbb010_sum.xckc017b = l_xcbb010_sum.xckc017b + g_detail5[li_ac].xckc017b
      LET l_xcbb010_sum.xckc017c = l_xcbb010_sum.xckc017c + g_detail5[li_ac].xckc017c
      LET l_xcbb010_sum.xckc017d = l_xcbb010_sum.xckc017d + g_detail5[li_ac].xckc017d
      LET l_xcbb010_sum.xckc017e = l_xcbb010_sum.xckc017e + g_detail5[li_ac].xckc017e
      LET l_xcbb010_sum.xckc017f = l_xcbb010_sum.xckc017f + g_detail5[li_ac].xckc017f
      LET l_xcbb010_sum.xckc017g = l_xcbb010_sum.xckc017g + g_detail5[li_ac].xckc017g
      LET l_xcbb010_sum.xckc017h = l_xcbb010_sum.xckc017h + g_detail5[li_ac].xckc017h
      LET l_xcbb010_sum.xckc018  = l_xcbb010_sum.xckc018  + g_detail5[li_ac].xckc018 
      LET l_xcbb010_sum.xckc018a = l_xcbb010_sum.xckc018a + g_detail5[li_ac].xckc018a
      LET l_xcbb010_sum.xckc018b = l_xcbb010_sum.xckc018b + g_detail5[li_ac].xckc018b
      LET l_xcbb010_sum.xckc018c = l_xcbb010_sum.xckc018c + g_detail5[li_ac].xckc018c
      LET l_xcbb010_sum.xckc018d = l_xcbb010_sum.xckc018d + g_detail5[li_ac].xckc018d
      LET l_xcbb010_sum.xckc018e = l_xcbb010_sum.xckc018e + g_detail5[li_ac].xckc018e
      LET l_xcbb010_sum.xckc018f = l_xcbb010_sum.xckc018f + g_detail5[li_ac].xckc018f
      LET l_xcbb010_sum.xckc018g = l_xcbb010_sum.xckc018g + g_detail5[li_ac].xckc018g
      LET l_xcbb010_sum.xckc018h = l_xcbb010_sum.xckc018h + g_detail5[li_ac].xckc018h
      
      
      #小计-币种三
      LET l_xcbb010_sum.xckc019  = l_xcbb010_sum.xckc019  + g_detail6[li_ac].xckc019 
      LET l_xcbb010_sum.xckc019a = l_xcbb010_sum.xckc019a + g_detail6[li_ac].xckc019a 
      LET l_xcbb010_sum.xckc019b = l_xcbb010_sum.xckc019b + g_detail6[li_ac].xckc019b 
      LET l_xcbb010_sum.xckc019c = l_xcbb010_sum.xckc019c + g_detail6[li_ac].xckc019c 
      LET l_xcbb010_sum.xckc019d = l_xcbb010_sum.xckc019d + g_detail6[li_ac].xckc019d 
      LET l_xcbb010_sum.xckc019e = l_xcbb010_sum.xckc019e + g_detail6[li_ac].xckc019e 
      LET l_xcbb010_sum.xckc019f = l_xcbb010_sum.xckc019f + g_detail6[li_ac].xckc019f 
      LET l_xcbb010_sum.xckc019g = l_xcbb010_sum.xckc019g + g_detail6[li_ac].xckc019g 
      LET l_xcbb010_sum.xckc019h = l_xcbb010_sum.xckc019h + g_detail6[li_ac].xckc019h
      LET l_xcbb010_sum.xckc020  = l_xcbb010_sum.xckc020  + g_detail6[li_ac].xckc020 
      LET l_xcbb010_sum.xckc020a = l_xcbb010_sum.xckc020a + g_detail6[li_ac].xckc020a 
      LET l_xcbb010_sum.xckc020b = l_xcbb010_sum.xckc020b + g_detail6[li_ac].xckc020b 
      LET l_xcbb010_sum.xckc020c = l_xcbb010_sum.xckc020c + g_detail6[li_ac].xckc020c 
      LET l_xcbb010_sum.xckc020d = l_xcbb010_sum.xckc020d + g_detail6[li_ac].xckc020d 
      LET l_xcbb010_sum.xckc020e = l_xcbb010_sum.xckc020e + g_detail6[li_ac].xckc020e 
      LET l_xcbb010_sum.xckc020f = l_xcbb010_sum.xckc020f + g_detail6[li_ac].xckc020f 
      LET l_xcbb010_sum.xckc020g = l_xcbb010_sum.xckc020g + g_detail6[li_ac].xckc020g 
      LET l_xcbb010_sum.xckc020h = l_xcbb010_sum.xckc020h + g_detail6[li_ac].xckc020h
      LET l_xcbb010_sum.xckc021  = l_xcbb010_sum.xckc021  + g_detail6[li_ac].xckc021 
      LET l_xcbb010_sum.xckc021a = l_xcbb010_sum.xckc021a + g_detail6[li_ac].xckc021a 
      LET l_xcbb010_sum.xckc021b = l_xcbb010_sum.xckc021b + g_detail6[li_ac].xckc021b 
      LET l_xcbb010_sum.xckc021c = l_xcbb010_sum.xckc021c + g_detail6[li_ac].xckc021c 
      LET l_xcbb010_sum.xckc021d = l_xcbb010_sum.xckc021d + g_detail6[li_ac].xckc021d 
      LET l_xcbb010_sum.xckc021e = l_xcbb010_sum.xckc021e + g_detail6[li_ac].xckc021e 
      LET l_xcbb010_sum.xckc021f = l_xcbb010_sum.xckc021f + g_detail6[li_ac].xckc021f 
      LET l_xcbb010_sum.xckc021g = l_xcbb010_sum.xckc021g + g_detail6[li_ac].xckc021g 
      LET l_xcbb010_sum.xckc021h = l_xcbb010_sum.xckc021h + g_detail6[li_ac].xckc021h
      LET l_xcbb010_sum.xckc022  = l_xcbb010_sum.xckc022  + g_detail6[li_ac].xckc022 
      LET l_xcbb010_sum.xckc022a = l_xcbb010_sum.xckc022a + g_detail6[li_ac].xckc022a 
      LET l_xcbb010_sum.xckc022b = l_xcbb010_sum.xckc022b + g_detail6[li_ac].xckc022b 
      LET l_xcbb010_sum.xckc022c = l_xcbb010_sum.xckc022c + g_detail6[li_ac].xckc022c 
      LET l_xcbb010_sum.xckc022d = l_xcbb010_sum.xckc022d + g_detail6[li_ac].xckc022d 
      LET l_xcbb010_sum.xckc022e = l_xcbb010_sum.xckc022e + g_detail6[li_ac].xckc022e 
      LET l_xcbb010_sum.xckc022f = l_xcbb010_sum.xckc022f + g_detail6[li_ac].xckc022f 
      LET l_xcbb010_sum.xckc022g = l_xcbb010_sum.xckc022g + g_detail6[li_ac].xckc022g 
      LET l_xcbb010_sum.xckc022h = l_xcbb010_sum.xckc022h + g_detail6[li_ac].xckc022h
      
      
      #总计
      #总计-本位币
      LET l_xckc_tot.xckc007  = l_xckc_tot.xckc007  + g_detail2[li_ac].xckc007 
      LET l_xckc_tot.xckc008  = l_xckc_tot.xckc008  + g_detail2[li_ac].xckc008 
      LET l_xckc_tot.xckc008a = l_xckc_tot.xckc008a + g_detail2[li_ac].xckc008a
      LET l_xckc_tot.xckc008b = l_xckc_tot.xckc008b + g_detail2[li_ac].xckc008b
      LET l_xckc_tot.xckc008c = l_xckc_tot.xckc008c + g_detail2[li_ac].xckc008c
      LET l_xckc_tot.xckc008d = l_xckc_tot.xckc008d + g_detail2[li_ac].xckc008d
      LET l_xckc_tot.xckc008e = l_xckc_tot.xckc008e + g_detail2[li_ac].xckc008e
      LET l_xckc_tot.xckc008f = l_xckc_tot.xckc008f + g_detail2[li_ac].xckc008f
      LET l_xckc_tot.xckc008g = l_xckc_tot.xckc008g + g_detail2[li_ac].xckc008g
      LET l_xckc_tot.xckc008h = l_xckc_tot.xckc008h + g_detail2[li_ac].xckc008h
      LET l_xckc_tot.xckc009  = l_xckc_tot.xckc009  + g_detail2[li_ac].xckc009 
      LET l_xckc_tot.xckc010  = l_xckc_tot.xckc010  + g_detail2[li_ac].xckc010 
      LET l_xckc_tot.xckc010a = l_xckc_tot.xckc010a + g_detail2[li_ac].xckc010a
      LET l_xckc_tot.xckc010b = l_xckc_tot.xckc010b + g_detail2[li_ac].xckc010b
      LET l_xckc_tot.xckc010c = l_xckc_tot.xckc010c + g_detail2[li_ac].xckc010c
      LET l_xckc_tot.xckc010d = l_xckc_tot.xckc010d + g_detail2[li_ac].xckc010d
      LET l_xckc_tot.xckc010e = l_xckc_tot.xckc010e + g_detail2[li_ac].xckc010e
      LET l_xckc_tot.xckc010f = l_xckc_tot.xckc010f + g_detail2[li_ac].xckc010f
      LET l_xckc_tot.xckc010g = l_xckc_tot.xckc010g + g_detail2[li_ac].xckc010g
      LET l_xckc_tot.xckc010h = l_xckc_tot.xckc010h + g_detail2[li_ac].xckc010h
      #170725-00076#6  add --s
      IF cl_null( g_detail2[li_ac].xckc011) THEN 
         LET  g_detail2[li_ac].xckc011 = 0 
      END IF 
      #170725-00076#6  add --e
      LET l_xckc_tot.xckc011  = l_xckc_tot.xckc011  + g_detail2[li_ac].xckc011 
     #LET l_xckc_tot.xckc012  = l_xckc_tot.xckc017  + g_detail2[li_ac].xckc012    #170307-00017#1 mark
      LET l_xckc_tot.xckc012  = l_xckc_tot.xckc012  + g_detail2[li_ac].xckc012    #170307-00017#1 add
      LET l_xckc_tot.xckc012a = l_xckc_tot.xckc012a + g_detail2[li_ac].xckc012a
      LET l_xckc_tot.xckc012b = l_xckc_tot.xckc012b + g_detail2[li_ac].xckc012b
      LET l_xckc_tot.xckc012c = l_xckc_tot.xckc012c + g_detail2[li_ac].xckc012c
      LET l_xckc_tot.xckc012d = l_xckc_tot.xckc012d + g_detail2[li_ac].xckc012d
      LET l_xckc_tot.xckc012e = l_xckc_tot.xckc012e + g_detail2[li_ac].xckc012e
      LET l_xckc_tot.xckc012f = l_xckc_tot.xckc012f + g_detail2[li_ac].xckc012f
      LET l_xckc_tot.xckc012g = l_xckc_tot.xckc012g + g_detail2[li_ac].xckc012g
      LET l_xckc_tot.xckc012h = l_xckc_tot.xckc012h + g_detail2[li_ac].xckc012h
      LET l_xckc_tot.xckc013  = l_xckc_tot.xckc013  + g_detail2[li_ac].xckc013 
      LET l_xckc_tot.xckc014  = l_xckc_tot.xckc014  + g_detail2[li_ac].xckc014 
      LET l_xckc_tot.xckc014a = l_xckc_tot.xckc014a + g_detail2[li_ac].xckc014a
      LET l_xckc_tot.xckc014b = l_xckc_tot.xckc014b + g_detail2[li_ac].xckc014b
      LET l_xckc_tot.xckc014c = l_xckc_tot.xckc014c + g_detail2[li_ac].xckc014c
      LET l_xckc_tot.xckc014d = l_xckc_tot.xckc014d + g_detail2[li_ac].xckc014d
      LET l_xckc_tot.xckc014e = l_xckc_tot.xckc014e + g_detail2[li_ac].xckc014e
      LET l_xckc_tot.xckc014f = l_xckc_tot.xckc014f + g_detail2[li_ac].xckc014f
      LET l_xckc_tot.xckc014g = l_xckc_tot.xckc014g + g_detail2[li_ac].xckc014g
      LET l_xckc_tot.xckc014h = l_xckc_tot.xckc014h + g_detail2[li_ac].xckc014h
      
      
      #总计-币种二                                            
      LET l_xckc_tot.xckc015  = l_xckc_tot.xckc015  + g_detail5[li_ac].xckc015 
      LET l_xckc_tot.xckc015a = l_xckc_tot.xckc015a + g_detail5[li_ac].xckc015a
      LET l_xckc_tot.xckc015b = l_xckc_tot.xckc015b + g_detail5[li_ac].xckc015b
      LET l_xckc_tot.xckc015c = l_xckc_tot.xckc015c + g_detail5[li_ac].xckc015c
      LET l_xckc_tot.xckc015d = l_xckc_tot.xckc015d + g_detail5[li_ac].xckc015d
      LET l_xckc_tot.xckc015e = l_xckc_tot.xckc015e + g_detail5[li_ac].xckc015e
      LET l_xckc_tot.xckc015f = l_xckc_tot.xckc015f + g_detail5[li_ac].xckc015f
      LET l_xckc_tot.xckc015g = l_xckc_tot.xckc015g + g_detail5[li_ac].xckc015g
      LET l_xckc_tot.xckc015h = l_xckc_tot.xckc015h + g_detail5[li_ac].xckc015h
      LET l_xckc_tot.xckc016  = l_xckc_tot.xckc016  + g_detail5[li_ac].xckc016 
      LET l_xckc_tot.xckc016a = l_xckc_tot.xckc016a + g_detail5[li_ac].xckc016a
      LET l_xckc_tot.xckc016b = l_xckc_tot.xckc016b + g_detail5[li_ac].xckc016b
      LET l_xckc_tot.xckc016c = l_xckc_tot.xckc016c + g_detail5[li_ac].xckc016c
      LET l_xckc_tot.xckc016d = l_xckc_tot.xckc016d + g_detail5[li_ac].xckc016d
      LET l_xckc_tot.xckc016e = l_xckc_tot.xckc016e + g_detail5[li_ac].xckc016e
      LET l_xckc_tot.xckc016f = l_xckc_tot.xckc016f + g_detail5[li_ac].xckc016f
      LET l_xckc_tot.xckc016g = l_xckc_tot.xckc016g + g_detail5[li_ac].xckc016g
      LET l_xckc_tot.xckc016h = l_xckc_tot.xckc016h + g_detail5[li_ac].xckc016h
      LET l_xckc_tot.xckc017  = l_xckc_tot.xckc017  + g_detail5[li_ac].xckc017 
      LET l_xckc_tot.xckc017a = l_xckc_tot.xckc017a + g_detail5[li_ac].xckc017a
      LET l_xckc_tot.xckc017b = l_xckc_tot.xckc017b + g_detail5[li_ac].xckc017b
      LET l_xckc_tot.xckc017c = l_xckc_tot.xckc017c + g_detail5[li_ac].xckc017c
      LET l_xckc_tot.xckc017d = l_xckc_tot.xckc017d + g_detail5[li_ac].xckc017d
      LET l_xckc_tot.xckc017e = l_xckc_tot.xckc017e + g_detail5[li_ac].xckc017e
      LET l_xckc_tot.xckc017f = l_xckc_tot.xckc017f + g_detail5[li_ac].xckc017f
      LET l_xckc_tot.xckc017g = l_xckc_tot.xckc017g + g_detail5[li_ac].xckc017g
      LET l_xckc_tot.xckc017h = l_xckc_tot.xckc017h + g_detail5[li_ac].xckc017h
      LET l_xckc_tot.xckc018  = l_xckc_tot.xckc018  + g_detail5[li_ac].xckc018 
      LET l_xckc_tot.xckc018a = l_xckc_tot.xckc018a + g_detail5[li_ac].xckc018a
      LET l_xckc_tot.xckc018b = l_xckc_tot.xckc018b + g_detail5[li_ac].xckc018b
      LET l_xckc_tot.xckc018c = l_xckc_tot.xckc018c + g_detail5[li_ac].xckc018c
      LET l_xckc_tot.xckc018d = l_xckc_tot.xckc018d + g_detail5[li_ac].xckc018d
      LET l_xckc_tot.xckc018e = l_xckc_tot.xckc018e + g_detail5[li_ac].xckc018e
      LET l_xckc_tot.xckc018f = l_xckc_tot.xckc018f + g_detail5[li_ac].xckc018f
      LET l_xckc_tot.xckc018g = l_xckc_tot.xckc018g + g_detail5[li_ac].xckc018g
      LET l_xckc_tot.xckc018h = l_xckc_tot.xckc018h + g_detail5[li_ac].xckc018h
      
      
      #总计-币种三
    
      LET l_xckc_tot.xckc019  = l_xckc_tot.xckc019  + g_detail6[li_ac].xckc019 
      LET l_xckc_tot.xckc019a = l_xckc_tot.xckc019a + g_detail6[li_ac].xckc019a 
      LET l_xckc_tot.xckc019b = l_xckc_tot.xckc019b + g_detail6[li_ac].xckc019b 
      LET l_xckc_tot.xckc019c = l_xckc_tot.xckc019c + g_detail6[li_ac].xckc019c 
      LET l_xckc_tot.xckc019d = l_xckc_tot.xckc019d + g_detail6[li_ac].xckc019d 
      LET l_xckc_tot.xckc019e = l_xckc_tot.xckc019e + g_detail6[li_ac].xckc019e 
      LET l_xckc_tot.xckc019f = l_xckc_tot.xckc019f + g_detail6[li_ac].xckc019f 
      LET l_xckc_tot.xckc019g = l_xckc_tot.xckc019g + g_detail6[li_ac].xckc019g 
      LET l_xckc_tot.xckc019h = l_xckc_tot.xckc019h + g_detail6[li_ac].xckc019h
      LET l_xckc_tot.xckc020  = l_xckc_tot.xckc020  + g_detail6[li_ac].xckc020 
      LET l_xckc_tot.xckc020a = l_xckc_tot.xckc020a + g_detail6[li_ac].xckc020a 
      LET l_xckc_tot.xckc020b = l_xckc_tot.xckc020b + g_detail6[li_ac].xckc020b 
      LET l_xckc_tot.xckc020c = l_xckc_tot.xckc020c + g_detail6[li_ac].xckc020c 
      LET l_xckc_tot.xckc020d = l_xckc_tot.xckc020d + g_detail6[li_ac].xckc020d 
      LET l_xckc_tot.xckc020e = l_xckc_tot.xckc020e + g_detail6[li_ac].xckc020e 
      LET l_xckc_tot.xckc020f = l_xckc_tot.xckc020f + g_detail6[li_ac].xckc020f 
      LET l_xckc_tot.xckc020g = l_xckc_tot.xckc020g + g_detail6[li_ac].xckc020g 
      LET l_xckc_tot.xckc020h = l_xckc_tot.xckc020h + g_detail6[li_ac].xckc020h
      LET l_xckc_tot.xckc021  = l_xckc_tot.xckc021  + g_detail6[li_ac].xckc021 
      LET l_xckc_tot.xckc021a = l_xckc_tot.xckc021a + g_detail6[li_ac].xckc021a 
      LET l_xckc_tot.xckc021b = l_xckc_tot.xckc021b + g_detail6[li_ac].xckc021b 
      LET l_xckc_tot.xckc021c = l_xckc_tot.xckc021c + g_detail6[li_ac].xckc021c 
      LET l_xckc_tot.xckc021d = l_xckc_tot.xckc021d + g_detail6[li_ac].xckc021d 
      LET l_xckc_tot.xckc021e = l_xckc_tot.xckc021e + g_detail6[li_ac].xckc021e 
      LET l_xckc_tot.xckc021f = l_xckc_tot.xckc021f + g_detail6[li_ac].xckc021f 
      LET l_xckc_tot.xckc021g = l_xckc_tot.xckc021g + g_detail6[li_ac].xckc021g 
      LET l_xckc_tot.xckc021h = l_xckc_tot.xckc021h + g_detail6[li_ac].xckc021h
      LET l_xckc_tot.xckc022  = l_xckc_tot.xckc022  + g_detail6[li_ac].xckc022 
      LET l_xckc_tot.xckc022a = l_xckc_tot.xckc022a + g_detail6[li_ac].xckc022a 
      LET l_xckc_tot.xckc022b = l_xckc_tot.xckc022b + g_detail6[li_ac].xckc022b 
      LET l_xckc_tot.xckc022c = l_xckc_tot.xckc022c + g_detail6[li_ac].xckc022c 
      LET l_xckc_tot.xckc022d = l_xckc_tot.xckc022d + g_detail6[li_ac].xckc022d 
      LET l_xckc_tot.xckc022e = l_xckc_tot.xckc022e + g_detail6[li_ac].xckc022e 
      LET l_xckc_tot.xckc022f = l_xckc_tot.xckc022f + g_detail6[li_ac].xckc022f 
      LET l_xckc_tot.xckc022g = l_xckc_tot.xckc022g + g_detail6[li_ac].xckc022g 
      LET l_xckc_tot.xckc022h = l_xckc_tot.xckc022h + g_detail6[li_ac].xckc022h
      
      
      
      IF li_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF 
         EXIT FOREACH
      END IF
      #LET l_xckc003_t = g_detail2[li_ac].xckc003  #170822-00009#1 add  #171212-00022#1 mark
      LET li_ac = li_ac + 1
          
   END FOREACH
   #小计显示
   #小计本位币页签显示
   IF li_ac > 1 THEN 
      LET g_detail2[li_ac].xcbb010_desc = g_detail2[li_ac-1].xcbb010,cl_getmsg("lib-00156",g_dlang) #小计  #170822-00009#1 mark  #171212-00022#1 remark
      #LET g_detail2[li_ac].xckc003 = cl_getmsg("lib-00156",g_dlang) #小计   #170822-00009#1 add  #171212-00022#1 mark
   END IF
   #170427-00041#5 add(S)
      IF cl_null(l_xcbb010_sum.xckc008) THEN LET l_xcbb010_sum.xckc008=0 END IF
      IF cl_null(l_xcbb010_sum.xckc008a) THEN LET l_xcbb010_sum.xckc008a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc008b) THEN LET l_xcbb010_sum.xckc008b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc008c) THEN LET l_xcbb010_sum.xckc008c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc008d) THEN LET l_xcbb010_sum.xckc008d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc008e) THEN LET l_xcbb010_sum.xckc008e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc008f) THEN LET l_xcbb010_sum.xckc008f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc008g) THEN LET l_xcbb010_sum.xckc008g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc008h) THEN LET l_xcbb010_sum.xckc008h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010) THEN LET l_xcbb010_sum.xckc010=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010a) THEN LET l_xcbb010_sum.xckc010a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010b) THEN LET l_xcbb010_sum.xckc010b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010c) THEN LET l_xcbb010_sum.xckc010c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010d) THEN LET l_xcbb010_sum.xckc010d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc010e) THEN LET l_xcbb010_sum.xckc010e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010f) THEN LET l_xcbb010_sum.xckc010f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010g) THEN LET l_xcbb010_sum.xckc010g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc010h) THEN LET l_xcbb010_sum.xckc010h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012) THEN LET l_xcbb010_sum.xckc012=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012a) THEN LET l_xcbb010_sum.xckc012a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012b) THEN LET l_xcbb010_sum.xckc012b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012c) THEN LET l_xcbb010_sum.xckc012c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012d) THEN LET l_xcbb010_sum.xckc012d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc012e) THEN LET l_xcbb010_sum.xckc012e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012f) THEN LET l_xcbb010_sum.xckc012f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012g) THEN LET l_xcbb010_sum.xckc012g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc012h) THEN LET l_xcbb010_sum.xckc012h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014) THEN LET l_xcbb010_sum.xckc014=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014a) THEN LET l_xcbb010_sum.xckc014a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014b) THEN LET l_xcbb010_sum.xckc014b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014c) THEN LET l_xcbb010_sum.xckc014c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014d) THEN LET l_xcbb010_sum.xckc014d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc014e) THEN LET l_xcbb010_sum.xckc014e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014f) THEN LET l_xcbb010_sum.xckc014f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014g) THEN LET l_xcbb010_sum.xckc014g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc014h) THEN LET l_xcbb010_sum.xckc014h=0 END IF      
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008,'5') RETURNING l_xcbb010_sum.xckc008
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008a,'5') RETURNING l_xcbb010_sum.xckc008a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008b,'5') RETURNING l_xcbb010_sum.xckc008b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008c,'5') RETURNING l_xcbb010_sum.xckc008c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008d,'5') RETURNING l_xcbb010_sum.xckc008d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008e,'5') RETURNING l_xcbb010_sum.xckc008e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008f,'5') RETURNING l_xcbb010_sum.xckc008f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008g,'5') RETURNING l_xcbb010_sum.xckc008g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc008h,'5') RETURNING l_xcbb010_sum.xckc008h
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010,'5') RETURNING l_xcbb010_sum.xckc010
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010a,'5') RETURNING l_xcbb010_sum.xckc010a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010b,'5') RETURNING l_xcbb010_sum.xckc010b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010c,'5') RETURNING l_xcbb010_sum.xckc010c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010d,'5') RETURNING l_xcbb010_sum.xckc010d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010e,'5') RETURNING l_xcbb010_sum.xckc010e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010f,'5') RETURNING l_xcbb010_sum.xckc010f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010g,'5') RETURNING l_xcbb010_sum.xckc010g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc010h,'5') RETURNING l_xcbb010_sum.xckc010h
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012,'5') RETURNING l_xcbb010_sum.xckc012
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012a,'5') RETURNING l_xcbb010_sum.xckc012a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012b,'5') RETURNING l_xcbb010_sum.xckc012b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012c,'5') RETURNING l_xcbb010_sum.xckc012c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012d,'5') RETURNING l_xcbb010_sum.xckc012d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012e,'5') RETURNING l_xcbb010_sum.xckc012e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012f,'5') RETURNING l_xcbb010_sum.xckc012f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012g,'5') RETURNING l_xcbb010_sum.xckc012g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc012h,'5') RETURNING l_xcbb010_sum.xckc012h
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014,'5') RETURNING l_xcbb010_sum.xckc014
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014a,'5') RETURNING l_xcbb010_sum.xckc014a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014b,'5') RETURNING l_xcbb010_sum.xckc014b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014c,'5') RETURNING l_xcbb010_sum.xckc014c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014d,'5') RETURNING l_xcbb010_sum.xckc014d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014e,'5') RETURNING l_xcbb010_sum.xckc014e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014f,'5') RETURNING l_xcbb010_sum.xckc014f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014g,'5') RETURNING l_xcbb010_sum.xckc014g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xcbb010_sum.xckc014h,'5') RETURNING l_xcbb010_sum.xckc014h
      #170427-00041#5 add(E)
   
   LET g_detail2[li_ac].xckc007  = l_xcbb010_sum.xckc007 
   LET g_detail2[li_ac].xckc008  = l_xcbb010_sum.xckc008 
   LET g_detail2[li_ac].xckc008a = l_xcbb010_sum.xckc008a
   LET g_detail2[li_ac].xckc008b = l_xcbb010_sum.xckc008b
   LET g_detail2[li_ac].xckc008c = l_xcbb010_sum.xckc008c
   LET g_detail2[li_ac].xckc008d = l_xcbb010_sum.xckc008d
   LET g_detail2[li_ac].xckc008e = l_xcbb010_sum.xckc008e
   LET g_detail2[li_ac].xckc008f = l_xcbb010_sum.xckc008f
   LET g_detail2[li_ac].xckc008g = l_xcbb010_sum.xckc008g
   LET g_detail2[li_ac].xckc008h = l_xcbb010_sum.xckc008h
   LET g_detail2[li_ac].xckc009  = l_xcbb010_sum.xckc009 
   LET g_detail2[li_ac].xckc010  = l_xcbb010_sum.xckc010 
   LET g_detail2[li_ac].xckc010a = l_xcbb010_sum.xckc010a
   LET g_detail2[li_ac].xckc010b = l_xcbb010_sum.xckc010b
   LET g_detail2[li_ac].xckc010c = l_xcbb010_sum.xckc010c
   LET g_detail2[li_ac].xckc010d = l_xcbb010_sum.xckc010d
   LET g_detail2[li_ac].xckc010e = l_xcbb010_sum.xckc010e
   LET g_detail2[li_ac].xckc010f = l_xcbb010_sum.xckc010f
   LET g_detail2[li_ac].xckc010g = l_xcbb010_sum.xckc010g
   LET g_detail2[li_ac].xckc010h = l_xcbb010_sum.xckc010h
   #170725-00076#6  add --s
   IF cl_null(l_xcbb010_sum.xckc011 ) THEN
      LET l_xcbb010_sum.xckc011 = 0 
   END IF 
   #170725-00076#6  add --e
   LET g_detail2[li_ac].xckc011  = l_xcbb010_sum.xckc011 
   LET g_detail2[li_ac].xckc012  = l_xcbb010_sum.xckc012 
   LET g_detail2[li_ac].xckc012a = l_xcbb010_sum.xckc012a
   LET g_detail2[li_ac].xckc012b = l_xcbb010_sum.xckc012b
   LET g_detail2[li_ac].xckc012c = l_xcbb010_sum.xckc012c
   LET g_detail2[li_ac].xckc012d = l_xcbb010_sum.xckc012d
   LET g_detail2[li_ac].xckc012e = l_xcbb010_sum.xckc012e
   LET g_detail2[li_ac].xckc012f = l_xcbb010_sum.xckc012f
   LET g_detail2[li_ac].xckc012g = l_xcbb010_sum.xckc012g
   LET g_detail2[li_ac].xckc012h = l_xcbb010_sum.xckc012h
   LET g_detail2[li_ac].xckc013  = l_xcbb010_sum.xckc013 
   LET g_detail2[li_ac].xckc014  = l_xcbb010_sum.xckc014 
   LET g_detail2[li_ac].xckc014a = l_xcbb010_sum.xckc014a
   LET g_detail2[li_ac].xckc014b = l_xcbb010_sum.xckc014b
   LET g_detail2[li_ac].xckc014c = l_xcbb010_sum.xckc014c
   LET g_detail2[li_ac].xckc014d = l_xcbb010_sum.xckc014d
   LET g_detail2[li_ac].xckc014e = l_xcbb010_sum.xckc014e
   LET g_detail2[li_ac].xckc014f = l_xcbb010_sum.xckc014f
   LET g_detail2[li_ac].xckc014g = l_xcbb010_sum.xckc014g
   LET g_detail2[li_ac].xckc014h = l_xcbb010_sum.xckc014h
   #小计币别二页签显示
   IF li_ac > 1 THEN 
      LET g_detail5[li_ac].xcbb010_1_desc = g_detail5[li_ac-1].xcbb010,cl_getmsg("lib-00156",g_dlang) #小计
   END IF
   #170427-00041#5 add(S)
    IF NOT cl_null(l_glaa016) THEN
      IF cl_null(l_xcbb010_sum.xckc015) THEN LET l_xcbb010_sum.xckc015=0 END IF
      IF cl_null(l_xcbb010_sum.xckc015a) THEN LET l_xcbb010_sum.xckc015a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc015b) THEN LET l_xcbb010_sum.xckc015b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc015c) THEN LET l_xcbb010_sum.xckc015c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc015d) THEN LET l_xcbb010_sum.xckc015d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc015e) THEN LET l_xcbb010_sum.xckc015e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc015f) THEN LET l_xcbb010_sum.xckc015f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc015g) THEN LET l_xcbb010_sum.xckc015g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc015h) THEN LET l_xcbb010_sum.xckc015h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016) THEN LET l_xcbb010_sum.xckc016=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016a) THEN LET l_xcbb010_sum.xckc016a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016b) THEN LET l_xcbb010_sum.xckc016b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016c) THEN LET l_xcbb010_sum.xckc016c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016d) THEN LET l_xcbb010_sum.xckc016d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc016e) THEN LET l_xcbb010_sum.xckc016e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016f) THEN LET l_xcbb010_sum.xckc016f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016g) THEN LET l_xcbb010_sum.xckc016g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc016h) THEN LET l_xcbb010_sum.xckc016h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017) THEN LET l_xcbb010_sum.xckc017=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017a) THEN LET l_xcbb010_sum.xckc017a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017b) THEN LET l_xcbb010_sum.xckc017b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017c) THEN LET l_xcbb010_sum.xckc017c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017d) THEN LET l_xcbb010_sum.xckc017d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc017e) THEN LET l_xcbb010_sum.xckc017e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017f) THEN LET l_xcbb010_sum.xckc017f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017g) THEN LET l_xcbb010_sum.xckc017g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc017h) THEN LET l_xcbb010_sum.xckc017h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018) THEN LET l_xcbb010_sum.xckc018=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018a) THEN LET l_xcbb010_sum.xckc018a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018b) THEN LET l_xcbb010_sum.xckc018b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018c) THEN LET l_xcbb010_sum.xckc018c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018d) THEN LET l_xcbb010_sum.xckc018d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc018e) THEN LET l_xcbb010_sum.xckc018e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018f) THEN LET l_xcbb010_sum.xckc018f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018g) THEN LET l_xcbb010_sum.xckc018g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc018h) THEN LET l_xcbb010_sum.xckc018h=0 END IF      
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015,'5') RETURNING l_xcbb010_sum.xckc015
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015a,'5') RETURNING l_xcbb010_sum.xckc015a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015b,'5') RETURNING l_xcbb010_sum.xckc015b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015c,'5') RETURNING l_xcbb010_sum.xckc015c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015d,'5') RETURNING l_xcbb010_sum.xckc015d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015e,'5') RETURNING l_xcbb010_sum.xckc015e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015f,'5') RETURNING l_xcbb010_sum.xckc015f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015g,'5') RETURNING l_xcbb010_sum.xckc015g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc015h,'5') RETURNING l_xcbb010_sum.xckc015h
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016,'5') RETURNING l_xcbb010_sum.xckc016
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016a,'5') RETURNING l_xcbb010_sum.xckc016a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016b,'5') RETURNING l_xcbb010_sum.xckc016b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016c,'5') RETURNING l_xcbb010_sum.xckc016c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016d,'5') RETURNING l_xcbb010_sum.xckc016d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016e,'5') RETURNING l_xcbb010_sum.xckc016e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016f,'5') RETURNING l_xcbb010_sum.xckc016f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016g,'5') RETURNING l_xcbb010_sum.xckc016g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc016h,'5') RETURNING l_xcbb010_sum.xckc016h
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017,'5') RETURNING l_xcbb010_sum.xckc017
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017a,'5') RETURNING l_xcbb010_sum.xckc017a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017b,'5') RETURNING l_xcbb010_sum.xckc017b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017c,'5') RETURNING l_xcbb010_sum.xckc017c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017d,'5') RETURNING l_xcbb010_sum.xckc017d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017e,'5') RETURNING l_xcbb010_sum.xckc017e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017f,'5') RETURNING l_xcbb010_sum.xckc017f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017g,'5') RETURNING l_xcbb010_sum.xckc017g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc017h,'5') RETURNING l_xcbb010_sum.xckc017h
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018,'5') RETURNING l_xcbb010_sum.xckc018
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018a,'5') RETURNING l_xcbb010_sum.xckc018a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018b,'5') RETURNING l_xcbb010_sum.xckc018b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018c,'5') RETURNING l_xcbb010_sum.xckc018c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018d,'5') RETURNING l_xcbb010_sum.xckc018d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018e,'5') RETURNING l_xcbb010_sum.xckc018e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018f,'5') RETURNING l_xcbb010_sum.xckc018f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018g,'5') RETURNING l_xcbb010_sum.xckc018g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xcbb010_sum.xckc018h,'5') RETURNING l_xcbb010_sum.xckc018h
    END IF
      #170427-00041#5 add(E)
   
   LET g_detail5[li_ac].xckc007  = l_xcbb010_sum.xckc007 
   LET g_detail5[li_ac].xckc015  = l_xcbb010_sum.xckc015 
   LET g_detail5[li_ac].xckc015a = l_xcbb010_sum.xckc015a
   LET g_detail5[li_ac].xckc015b = l_xcbb010_sum.xckc015b
   LET g_detail5[li_ac].xckc015c = l_xcbb010_sum.xckc015c
   LET g_detail5[li_ac].xckc015d = l_xcbb010_sum.xckc015d
   LET g_detail5[li_ac].xckc015e = l_xcbb010_sum.xckc015e
   LET g_detail5[li_ac].xckc015f = l_xcbb010_sum.xckc015f
   LET g_detail5[li_ac].xckc015g = l_xcbb010_sum.xckc015g
   LET g_detail5[li_ac].xckc015h = l_xcbb010_sum.xckc015h
   LET g_detail5[li_ac].xckc009  = l_xcbb010_sum.xckc009 
   LET g_detail5[li_ac].xckc016  = l_xcbb010_sum.xckc016 
   LET g_detail5[li_ac].xckc016a = l_xcbb010_sum.xckc016a
   LET g_detail5[li_ac].xckc016b = l_xcbb010_sum.xckc016b
   LET g_detail5[li_ac].xckc016c = l_xcbb010_sum.xckc016c
   LET g_detail5[li_ac].xckc016d = l_xcbb010_sum.xckc016d
   LET g_detail5[li_ac].xckc016e = l_xcbb010_sum.xckc016e
   LET g_detail5[li_ac].xckc016f = l_xcbb010_sum.xckc016f
   LET g_detail5[li_ac].xckc016g = l_xcbb010_sum.xckc016g
   LET g_detail5[li_ac].xckc016h = l_xcbb010_sum.xckc016h
   LET g_detail5[li_ac].xckc011  = l_xcbb010_sum.xckc011 
   LET g_detail5[li_ac].xckc017  = l_xcbb010_sum.xckc017 
   LET g_detail5[li_ac].xckc017a = l_xcbb010_sum.xckc017a
   LET g_detail5[li_ac].xckc017b = l_xcbb010_sum.xckc017b
   LET g_detail5[li_ac].xckc017c = l_xcbb010_sum.xckc017c
   LET g_detail5[li_ac].xckc017d = l_xcbb010_sum.xckc017d
   LET g_detail5[li_ac].xckc017e = l_xcbb010_sum.xckc017e
   LET g_detail5[li_ac].xckc017f = l_xcbb010_sum.xckc017f
   LET g_detail5[li_ac].xckc017g = l_xcbb010_sum.xckc017g
   LET g_detail5[li_ac].xckc017h = l_xcbb010_sum.xckc017h
   LET g_detail5[li_ac].xckc013  = l_xcbb010_sum.xckc013 
   LET g_detail5[li_ac].xckc018  = l_xcbb010_sum.xckc018 
   LET g_detail5[li_ac].xckc018a = l_xcbb010_sum.xckc018a
   LET g_detail5[li_ac].xckc018b = l_xcbb010_sum.xckc018b
   LET g_detail5[li_ac].xckc018c = l_xcbb010_sum.xckc018c
   LET g_detail5[li_ac].xckc018d = l_xcbb010_sum.xckc018d
   LET g_detail5[li_ac].xckc018e = l_xcbb010_sum.xckc018e
   LET g_detail5[li_ac].xckc018f = l_xcbb010_sum.xckc018f
   LET g_detail5[li_ac].xckc018g = l_xcbb010_sum.xckc018g
   LET g_detail5[li_ac].xckc018h = l_xcbb010_sum.xckc018h
   #小计币别三页签显示
   IF li_ac > 1 THEN    #160926-00014#1 add
      LET g_detail6[li_ac].xcbb010_2_desc = g_detail6[li_ac-1].xcbb010,cl_getmsg("lib-00156",g_dlang) #小计
   END IF               #160926-00014#1 add 
   
   #170427-00041#5 add(S)
    IF NOT cl_null(l_glaa020) THEN
      IF cl_null(l_xcbb010_sum.xckc019) THEN LET l_xcbb010_sum.xckc019=0 END IF
      IF cl_null(l_xcbb010_sum.xckc019a) THEN LET l_xcbb010_sum.xckc019a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc019b) THEN LET l_xcbb010_sum.xckc019b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc019c) THEN LET l_xcbb010_sum.xckc019c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc019d) THEN LET l_xcbb010_sum.xckc019d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc019e) THEN LET l_xcbb010_sum.xckc019e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc019f) THEN LET l_xcbb010_sum.xckc019f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc019g) THEN LET l_xcbb010_sum.xckc019g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc019h) THEN LET l_xcbb010_sum.xckc019h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020) THEN LET l_xcbb010_sum.xckc020=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020a) THEN LET l_xcbb010_sum.xckc020a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020b) THEN LET l_xcbb010_sum.xckc020b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020c) THEN LET l_xcbb010_sum.xckc020c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020d) THEN LET l_xcbb010_sum.xckc020d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc020e) THEN LET l_xcbb010_sum.xckc020e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020f) THEN LET l_xcbb010_sum.xckc020f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020g) THEN LET l_xcbb010_sum.xckc020g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc020h) THEN LET l_xcbb010_sum.xckc020h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021) THEN LET l_xcbb010_sum.xckc021=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021a) THEN LET l_xcbb010_sum.xckc021a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021b) THEN LET l_xcbb010_sum.xckc021b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021c) THEN LET l_xcbb010_sum.xckc021c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021d) THEN LET l_xcbb010_sum.xckc021d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc021e) THEN LET l_xcbb010_sum.xckc021e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021f) THEN LET l_xcbb010_sum.xckc021f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021g) THEN LET l_xcbb010_sum.xckc021g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc021h) THEN LET l_xcbb010_sum.xckc021h=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022) THEN LET l_xcbb010_sum.xckc022=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022a) THEN LET l_xcbb010_sum.xckc022a=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022b) THEN LET l_xcbb010_sum.xckc022b=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022c) THEN LET l_xcbb010_sum.xckc022c=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022d) THEN LET l_xcbb010_sum.xckc022d=0 END IF 
      IF cl_null(l_xcbb010_sum.xckc022e) THEN LET l_xcbb010_sum.xckc022e=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022f) THEN LET l_xcbb010_sum.xckc022f=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022g) THEN LET l_xcbb010_sum.xckc022g=0 END IF
      IF cl_null(l_xcbb010_sum.xckc022h) THEN LET l_xcbb010_sum.xckc022h=0 END IF      
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019,'5') RETURNING l_xcbb010_sum.xckc019
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019a,'5') RETURNING l_xcbb010_sum.xckc019a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019b,'5') RETURNING l_xcbb010_sum.xckc019b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019c,'5') RETURNING l_xcbb010_sum.xckc019c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019d,'5') RETURNING l_xcbb010_sum.xckc019d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019e,'5') RETURNING l_xcbb010_sum.xckc019e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019f,'5') RETURNING l_xcbb010_sum.xckc019f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019g,'5') RETURNING l_xcbb010_sum.xckc019g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc019h,'5') RETURNING l_xcbb010_sum.xckc019h
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020,'5') RETURNING l_xcbb010_sum.xckc020
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020a,'5') RETURNING l_xcbb010_sum.xckc020a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020b,'5') RETURNING l_xcbb010_sum.xckc020b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020c,'5') RETURNING l_xcbb010_sum.xckc020c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020d,'5') RETURNING l_xcbb010_sum.xckc020d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020e,'5') RETURNING l_xcbb010_sum.xckc020e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020f,'5') RETURNING l_xcbb010_sum.xckc020f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020g,'5') RETURNING l_xcbb010_sum.xckc020g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc020h,'5') RETURNING l_xcbb010_sum.xckc020h
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021,'5') RETURNING l_xcbb010_sum.xckc021
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021a,'5') RETURNING l_xcbb010_sum.xckc021a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021b,'5') RETURNING l_xcbb010_sum.xckc021b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021c,'5') RETURNING l_xcbb010_sum.xckc021c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021d,'5') RETURNING l_xcbb010_sum.xckc021d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021e,'5') RETURNING l_xcbb010_sum.xckc021e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021f,'5') RETURNING l_xcbb010_sum.xckc021f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021g,'5') RETURNING l_xcbb010_sum.xckc021g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc021h,'5') RETURNING l_xcbb010_sum.xckc021h
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022,'5') RETURNING l_xcbb010_sum.xckc022
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022a,'5') RETURNING l_xcbb010_sum.xckc022a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022b,'5') RETURNING l_xcbb010_sum.xckc022b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022c,'5') RETURNING l_xcbb010_sum.xckc022c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022d,'5') RETURNING l_xcbb010_sum.xckc022d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022e,'5') RETURNING l_xcbb010_sum.xckc022e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022f,'5') RETURNING l_xcbb010_sum.xckc022f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022g,'5') RETURNING l_xcbb010_sum.xckc022g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xcbb010_sum.xckc022h,'5') RETURNING l_xcbb010_sum.xckc022h
    END IF
      #170427-00041#5 add(E)
   LET g_detail6[li_ac].xckc007  = l_xcbb010_sum.xckc007 
   LET g_detail6[li_ac].xckc019  = l_xcbb010_sum.xckc019 
   LET g_detail6[li_ac].xckc019a = l_xcbb010_sum.xckc019a
   LET g_detail6[li_ac].xckc019b = l_xcbb010_sum.xckc019b
   LET g_detail6[li_ac].xckc019c = l_xcbb010_sum.xckc019c
   LET g_detail6[li_ac].xckc019d = l_xcbb010_sum.xckc019d
   LET g_detail6[li_ac].xckc019e = l_xcbb010_sum.xckc019e
   LET g_detail6[li_ac].xckc019f = l_xcbb010_sum.xckc019f
   LET g_detail6[li_ac].xckc019g = l_xcbb010_sum.xckc019g
   LET g_detail6[li_ac].xckc019h = l_xcbb010_sum.xckc019h
   LET g_detail6[li_ac].xckc009  = l_xcbb010_sum.xckc009 
   LET g_detail6[li_ac].xckc020  = l_xcbb010_sum.xckc020 
   LET g_detail6[li_ac].xckc020a = l_xcbb010_sum.xckc020a
   LET g_detail6[li_ac].xckc020b = l_xcbb010_sum.xckc020b
   LET g_detail6[li_ac].xckc020c = l_xcbb010_sum.xckc020c
   LET g_detail6[li_ac].xckc020d = l_xcbb010_sum.xckc020d
   LET g_detail6[li_ac].xckc020e = l_xcbb010_sum.xckc020e
   LET g_detail6[li_ac].xckc020f = l_xcbb010_sum.xckc020f
   LET g_detail6[li_ac].xckc020g = l_xcbb010_sum.xckc020g
   LET g_detail6[li_ac].xckc020h = l_xcbb010_sum.xckc020h
   LET g_detail6[li_ac].xckc011  = l_xcbb010_sum.xckc011 
   LET g_detail6[li_ac].xckc021  = l_xcbb010_sum.xckc021 
   LET g_detail6[li_ac].xckc021a = l_xcbb010_sum.xckc021a
   LET g_detail6[li_ac].xckc021b = l_xcbb010_sum.xckc021b
   LET g_detail6[li_ac].xckc021c = l_xcbb010_sum.xckc021c
   LET g_detail6[li_ac].xckc021d = l_xcbb010_sum.xckc021d
   LET g_detail6[li_ac].xckc021e = l_xcbb010_sum.xckc021e
   LET g_detail6[li_ac].xckc021f = l_xcbb010_sum.xckc021f
   LET g_detail6[li_ac].xckc021g = l_xcbb010_sum.xckc021g
   LET g_detail6[li_ac].xckc021h = l_xcbb010_sum.xckc021h
   LET g_detail6[li_ac].xckc013  = l_xcbb010_sum.xckc013 
   LET g_detail6[li_ac].xckc022  = l_xcbb010_sum.xckc022 
   LET g_detail6[li_ac].xckc022a = l_xcbb010_sum.xckc022a
   LET g_detail6[li_ac].xckc022b = l_xcbb010_sum.xckc022b
   LET g_detail6[li_ac].xckc022c = l_xcbb010_sum.xckc022c
   LET g_detail6[li_ac].xckc022d = l_xcbb010_sum.xckc022d
   LET g_detail6[li_ac].xckc022e = l_xcbb010_sum.xckc022e
   LET g_detail6[li_ac].xckc022f = l_xcbb010_sum.xckc022f
   LET g_detail6[li_ac].xckc022g = l_xcbb010_sum.xckc022g
   LET g_detail6[li_ac].xckc022h = l_xcbb010_sum.xckc022h
   
   LET li_ac = li_ac + 1
   
   #总计显示
   #总计本位币页签显示
   #170427-00041#5 add(S)
      IF cl_null(l_xckc_tot.xckc008) THEN LET l_xckc_tot.xckc008=0 END IF
      IF cl_null(l_xckc_tot.xckc008a) THEN LET l_xckc_tot.xckc008a=0 END IF
      IF cl_null(l_xckc_tot.xckc008b) THEN LET l_xckc_tot.xckc008b=0 END IF
      IF cl_null(l_xckc_tot.xckc008c) THEN LET l_xckc_tot.xckc008c=0 END IF
      IF cl_null(l_xckc_tot.xckc008d) THEN LET l_xckc_tot.xckc008d=0 END IF 
      IF cl_null(l_xckc_tot.xckc008e) THEN LET l_xckc_tot.xckc008e=0 END IF
      IF cl_null(l_xckc_tot.xckc008f) THEN LET l_xckc_tot.xckc008f=0 END IF
      IF cl_null(l_xckc_tot.xckc008g) THEN LET l_xckc_tot.xckc008g=0 END IF
      IF cl_null(l_xckc_tot.xckc008h) THEN LET l_xckc_tot.xckc008h=0 END IF
      IF cl_null(l_xckc_tot.xckc010) THEN LET l_xckc_tot.xckc010=0 END IF
      IF cl_null(l_xckc_tot.xckc010a) THEN LET l_xckc_tot.xckc010a=0 END IF
      IF cl_null(l_xckc_tot.xckc010b) THEN LET l_xckc_tot.xckc010b=0 END IF
      IF cl_null(l_xckc_tot.xckc010c) THEN LET l_xckc_tot.xckc010c=0 END IF
      IF cl_null(l_xckc_tot.xckc010d) THEN LET l_xckc_tot.xckc010d=0 END IF 
      IF cl_null(l_xckc_tot.xckc010e) THEN LET l_xckc_tot.xckc010e=0 END IF
      IF cl_null(l_xckc_tot.xckc010f) THEN LET l_xckc_tot.xckc010f=0 END IF
      IF cl_null(l_xckc_tot.xckc010g) THEN LET l_xckc_tot.xckc010g=0 END IF
      IF cl_null(l_xckc_tot.xckc010h) THEN LET l_xckc_tot.xckc010h=0 END IF
      IF cl_null(l_xckc_tot.xckc012) THEN LET l_xckc_tot.xckc012=0 END IF
      IF cl_null(l_xckc_tot.xckc012a) THEN LET l_xckc_tot.xckc012a=0 END IF
      IF cl_null(l_xckc_tot.xckc012b) THEN LET l_xckc_tot.xckc012b=0 END IF
      IF cl_null(l_xckc_tot.xckc012c) THEN LET l_xckc_tot.xckc012c=0 END IF
      IF cl_null(l_xckc_tot.xckc012d) THEN LET l_xckc_tot.xckc012d=0 END IF 
      IF cl_null(l_xckc_tot.xckc012e) THEN LET l_xckc_tot.xckc012e=0 END IF
      IF cl_null(l_xckc_tot.xckc012f) THEN LET l_xckc_tot.xckc012f=0 END IF
      IF cl_null(l_xckc_tot.xckc012g) THEN LET l_xckc_tot.xckc012g=0 END IF
      IF cl_null(l_xckc_tot.xckc012h) THEN LET l_xckc_tot.xckc012h=0 END IF
      IF cl_null(l_xckc_tot.xckc014) THEN LET l_xckc_tot.xckc014=0 END IF
      IF cl_null(l_xckc_tot.xckc014a) THEN LET l_xckc_tot.xckc014a=0 END IF
      IF cl_null(l_xckc_tot.xckc014b) THEN LET l_xckc_tot.xckc014b=0 END IF
      IF cl_null(l_xckc_tot.xckc014c) THEN LET l_xckc_tot.xckc014c=0 END IF
      IF cl_null(l_xckc_tot.xckc014d) THEN LET l_xckc_tot.xckc014d=0 END IF 
      IF cl_null(l_xckc_tot.xckc014e) THEN LET l_xckc_tot.xckc014e=0 END IF
      IF cl_null(l_xckc_tot.xckc014f) THEN LET l_xckc_tot.xckc014f=0 END IF
      IF cl_null(l_xckc_tot.xckc014g) THEN LET l_xckc_tot.xckc014g=0 END IF
      IF cl_null(l_xckc_tot.xckc014h) THEN LET l_xckc_tot.xckc014h=0 END IF      
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008,'5') RETURNING l_xckc_tot.xckc008
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008a,'5') RETURNING l_xckc_tot.xckc008a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008b,'5') RETURNING l_xckc_tot.xckc008b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008c,'5') RETURNING l_xckc_tot.xckc008c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008d,'5') RETURNING l_xckc_tot.xckc008d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008e,'5') RETURNING l_xckc_tot.xckc008e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008f,'5') RETURNING l_xckc_tot.xckc008f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008g,'5') RETURNING l_xckc_tot.xckc008g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc008h,'5') RETURNING l_xckc_tot.xckc008h
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010,'5') RETURNING l_xckc_tot.xckc010
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010a,'5') RETURNING l_xckc_tot.xckc010a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010b,'5') RETURNING l_xckc_tot.xckc010b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010c,'5') RETURNING l_xckc_tot.xckc010c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010d,'5') RETURNING l_xckc_tot.xckc010d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010e,'5') RETURNING l_xckc_tot.xckc010e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010f,'5') RETURNING l_xckc_tot.xckc010f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010g,'5') RETURNING l_xckc_tot.xckc010g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc010h,'5') RETURNING l_xckc_tot.xckc010h
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012,'5') RETURNING l_xckc_tot.xckc012
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012a,'5') RETURNING l_xckc_tot.xckc012a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012b,'5') RETURNING l_xckc_tot.xckc012b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012c,'5') RETURNING l_xckc_tot.xckc012c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012d,'5') RETURNING l_xckc_tot.xckc012d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012e,'5') RETURNING l_xckc_tot.xckc012e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012f,'5') RETURNING l_xckc_tot.xckc012f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012g,'5') RETURNING l_xckc_tot.xckc012g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc012h,'5') RETURNING l_xckc_tot.xckc012h
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014,'5') RETURNING l_xckc_tot.xckc014
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014a,'5') RETURNING l_xckc_tot.xckc014a
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014b,'5') RETURNING l_xckc_tot.xckc014b
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014c,'5') RETURNING l_xckc_tot.xckc014c
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014d,'5') RETURNING l_xckc_tot.xckc014d
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014e,'5') RETURNING l_xckc_tot.xckc014e
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014f,'5') RETURNING l_xckc_tot.xckc014f
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014g,'5') RETURNING l_xckc_tot.xckc014g
      CALL s_curr_round(g_master.xckbcomp,l_glaa001,l_xckc_tot.xckc014h,'5') RETURNING l_xckc_tot.xckc014h
      #170427-00041#5 add(E)
   
   LET g_detail2[li_ac].xcbb010  = cl_getmsg("lib-00133",g_dlang) #总计
   LET g_detail2[li_ac].xckc007  = l_xckc_tot.xckc007 
   LET g_detail2[li_ac].xckc008  = l_xckc_tot.xckc008 
   LET g_detail2[li_ac].xckc008a = l_xckc_tot.xckc008a
   LET g_detail2[li_ac].xckc008b = l_xckc_tot.xckc008b
   LET g_detail2[li_ac].xckc008c = l_xckc_tot.xckc008c
   LET g_detail2[li_ac].xckc008d = l_xckc_tot.xckc008d
   LET g_detail2[li_ac].xckc008e = l_xckc_tot.xckc008e
   LET g_detail2[li_ac].xckc008f = l_xckc_tot.xckc008f
   LET g_detail2[li_ac].xckc008g = l_xckc_tot.xckc008g
   LET g_detail2[li_ac].xckc008h = l_xckc_tot.xckc008h
   LET g_detail2[li_ac].xckc009  = l_xckc_tot.xckc009 
   LET g_detail2[li_ac].xckc010  = l_xckc_tot.xckc010 
   LET g_detail2[li_ac].xckc010a = l_xckc_tot.xckc010a
   LET g_detail2[li_ac].xckc010b = l_xckc_tot.xckc010b
   LET g_detail2[li_ac].xckc010c = l_xckc_tot.xckc010c
   LET g_detail2[li_ac].xckc010d = l_xckc_tot.xckc010d
   LET g_detail2[li_ac].xckc010e = l_xckc_tot.xckc010e
   LET g_detail2[li_ac].xckc010f = l_xckc_tot.xckc010f
   LET g_detail2[li_ac].xckc010g = l_xckc_tot.xckc010g
   LET g_detail2[li_ac].xckc010h = l_xckc_tot.xckc010h
   LET g_detail2[li_ac].xckc011  = l_xckc_tot.xckc011 
   LET g_detail2[li_ac].xckc012  = l_xckc_tot.xckc012 
   LET g_detail2[li_ac].xckc012a = l_xckc_tot.xckc012a
   LET g_detail2[li_ac].xckc012b = l_xckc_tot.xckc012b
   LET g_detail2[li_ac].xckc012c = l_xckc_tot.xckc012c
   LET g_detail2[li_ac].xckc012d = l_xckc_tot.xckc012d
   LET g_detail2[li_ac].xckc012e = l_xckc_tot.xckc012e
   LET g_detail2[li_ac].xckc012f = l_xckc_tot.xckc012f
   LET g_detail2[li_ac].xckc012g = l_xckc_tot.xckc012g
   LET g_detail2[li_ac].xckc012h = l_xckc_tot.xckc012h
   LET g_detail2[li_ac].xckc013  = l_xckc_tot.xckc013 
   LET g_detail2[li_ac].xckc014  = l_xckc_tot.xckc014 
   LET g_detail2[li_ac].xckc014a = l_xckc_tot.xckc014a
   LET g_detail2[li_ac].xckc014b = l_xckc_tot.xckc014b
   LET g_detail2[li_ac].xckc014c = l_xckc_tot.xckc014c
   LET g_detail2[li_ac].xckc014d = l_xckc_tot.xckc014d
   LET g_detail2[li_ac].xckc014e = l_xckc_tot.xckc014e
   LET g_detail2[li_ac].xckc014f = l_xckc_tot.xckc014f
   LET g_detail2[li_ac].xckc014g = l_xckc_tot.xckc014g
   LET g_detail2[li_ac].xckc014h = l_xckc_tot.xckc014h
   #总计币别二页签显示
   #170427-00041#5 add(S)
    IF NOT cl_null(l_glaa016) THEN
      IF cl_null(l_xckc_tot.xckc015) THEN LET l_xckc_tot.xckc015=0 END IF
      IF cl_null(l_xckc_tot.xckc015a) THEN LET l_xckc_tot.xckc015a=0 END IF
      IF cl_null(l_xckc_tot.xckc015b) THEN LET l_xckc_tot.xckc015b=0 END IF
      IF cl_null(l_xckc_tot.xckc015c) THEN LET l_xckc_tot.xckc015c=0 END IF
      IF cl_null(l_xckc_tot.xckc015d) THEN LET l_xckc_tot.xckc015d=0 END IF 
      IF cl_null(l_xckc_tot.xckc015e) THEN LET l_xckc_tot.xckc015e=0 END IF
      IF cl_null(l_xckc_tot.xckc015f) THEN LET l_xckc_tot.xckc015f=0 END IF
      IF cl_null(l_xckc_tot.xckc015g) THEN LET l_xckc_tot.xckc015g=0 END IF
      IF cl_null(l_xckc_tot.xckc015h) THEN LET l_xckc_tot.xckc015h=0 END IF
      IF cl_null(l_xckc_tot.xckc016) THEN LET l_xckc_tot.xckc016=0 END IF
      IF cl_null(l_xckc_tot.xckc016a) THEN LET l_xckc_tot.xckc016a=0 END IF
      IF cl_null(l_xckc_tot.xckc016b) THEN LET l_xckc_tot.xckc016b=0 END IF
      IF cl_null(l_xckc_tot.xckc016c) THEN LET l_xckc_tot.xckc016c=0 END IF
      IF cl_null(l_xckc_tot.xckc016d) THEN LET l_xckc_tot.xckc016d=0 END IF 
      IF cl_null(l_xckc_tot.xckc016e) THEN LET l_xckc_tot.xckc016e=0 END IF
      IF cl_null(l_xckc_tot.xckc016f) THEN LET l_xckc_tot.xckc016f=0 END IF
      IF cl_null(l_xckc_tot.xckc016g) THEN LET l_xckc_tot.xckc016g=0 END IF
      IF cl_null(l_xckc_tot.xckc016h) THEN LET l_xckc_tot.xckc016h=0 END IF
      IF cl_null(l_xckc_tot.xckc017) THEN LET l_xckc_tot.xckc017=0 END IF
      IF cl_null(l_xckc_tot.xckc017a) THEN LET l_xckc_tot.xckc017a=0 END IF
      IF cl_null(l_xckc_tot.xckc017b) THEN LET l_xckc_tot.xckc017b=0 END IF
      IF cl_null(l_xckc_tot.xckc017c) THEN LET l_xckc_tot.xckc017c=0 END IF
      IF cl_null(l_xckc_tot.xckc017d) THEN LET l_xckc_tot.xckc017d=0 END IF 
      IF cl_null(l_xckc_tot.xckc017e) THEN LET l_xckc_tot.xckc017e=0 END IF
      IF cl_null(l_xckc_tot.xckc017f) THEN LET l_xckc_tot.xckc017f=0 END IF
      IF cl_null(l_xckc_tot.xckc017g) THEN LET l_xckc_tot.xckc017g=0 END IF
      IF cl_null(l_xckc_tot.xckc017h) THEN LET l_xckc_tot.xckc017h=0 END IF
      IF cl_null(l_xckc_tot.xckc018) THEN LET l_xckc_tot.xckc018=0 END IF
      IF cl_null(l_xckc_tot.xckc018a) THEN LET l_xckc_tot.xckc018a=0 END IF
      IF cl_null(l_xckc_tot.xckc018b) THEN LET l_xckc_tot.xckc018b=0 END IF
      IF cl_null(l_xckc_tot.xckc018c) THEN LET l_xckc_tot.xckc018c=0 END IF
      IF cl_null(l_xckc_tot.xckc018d) THEN LET l_xckc_tot.xckc018d=0 END IF 
      IF cl_null(l_xckc_tot.xckc018e) THEN LET l_xckc_tot.xckc018e=0 END IF
      IF cl_null(l_xckc_tot.xckc018f) THEN LET l_xckc_tot.xckc018f=0 END IF
      IF cl_null(l_xckc_tot.xckc018g) THEN LET l_xckc_tot.xckc018g=0 END IF
      IF cl_null(l_xckc_tot.xckc018h) THEN LET l_xckc_tot.xckc018h=0 END IF      
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015,'5') RETURNING l_xckc_tot.xckc015
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015a,'5') RETURNING l_xckc_tot.xckc015a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015b,'5') RETURNING l_xckc_tot.xckc015b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015c,'5') RETURNING l_xckc_tot.xckc015c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015d,'5') RETURNING l_xckc_tot.xckc015d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015e,'5') RETURNING l_xckc_tot.xckc015e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015f,'5') RETURNING l_xckc_tot.xckc015f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015g,'5') RETURNING l_xckc_tot.xckc015g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc015h,'5') RETURNING l_xckc_tot.xckc015h
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016,'5') RETURNING l_xckc_tot.xckc016
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016a,'5') RETURNING l_xckc_tot.xckc016a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016b,'5') RETURNING l_xckc_tot.xckc016b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016c,'5') RETURNING l_xckc_tot.xckc016c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016d,'5') RETURNING l_xckc_tot.xckc016d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016e,'5') RETURNING l_xckc_tot.xckc016e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016f,'5') RETURNING l_xckc_tot.xckc016f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016g,'5') RETURNING l_xckc_tot.xckc016g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc016h,'5') RETURNING l_xckc_tot.xckc016h
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017,'5') RETURNING l_xckc_tot.xckc017
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017a,'5') RETURNING l_xckc_tot.xckc017a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017b,'5') RETURNING l_xckc_tot.xckc017b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017c,'5') RETURNING l_xckc_tot.xckc017c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017d,'5') RETURNING l_xckc_tot.xckc017d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017e,'5') RETURNING l_xckc_tot.xckc017e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017f,'5') RETURNING l_xckc_tot.xckc017f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017g,'5') RETURNING l_xckc_tot.xckc017g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc017h,'5') RETURNING l_xckc_tot.xckc017h
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018,'5') RETURNING l_xckc_tot.xckc018
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018a,'5') RETURNING l_xckc_tot.xckc018a
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018b,'5') RETURNING l_xckc_tot.xckc018b
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018c,'5') RETURNING l_xckc_tot.xckc018c
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018d,'5') RETURNING l_xckc_tot.xckc018d
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018e,'5') RETURNING l_xckc_tot.xckc018e
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018f,'5') RETURNING l_xckc_tot.xckc018f
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018g,'5') RETURNING l_xckc_tot.xckc018g
      CALL s_curr_round(g_master.xckbcomp,l_glaa016,l_xckc_tot.xckc018h,'5') RETURNING l_xckc_tot.xckc018h
    END IF
      #170427-00041#5 add(E)
   
   LET g_detail5[li_ac].xcbb010  = cl_getmsg("lib-00133",g_dlang) #总计
   LET g_detail5[li_ac].xckc007  = l_xckc_tot.xckc007 
   LET g_detail5[li_ac].xckc015  = l_xckc_tot.xckc015 
   LET g_detail5[li_ac].xckc015a = l_xckc_tot.xckc015a
   LET g_detail5[li_ac].xckc015b = l_xckc_tot.xckc015b
   LET g_detail5[li_ac].xckc015c = l_xckc_tot.xckc015c
   LET g_detail5[li_ac].xckc015d = l_xckc_tot.xckc015d
   LET g_detail5[li_ac].xckc015e = l_xckc_tot.xckc015e
   LET g_detail5[li_ac].xckc015f = l_xckc_tot.xckc015f
   LET g_detail5[li_ac].xckc015g = l_xckc_tot.xckc015g
   LET g_detail5[li_ac].xckc015h = l_xckc_tot.xckc015h
   LET g_detail5[li_ac].xckc009  = l_xckc_tot.xckc009 
   LET g_detail5[li_ac].xckc016  = l_xckc_tot.xckc016 
   LET g_detail5[li_ac].xckc016a = l_xckc_tot.xckc016a
   LET g_detail5[li_ac].xckc016b = l_xckc_tot.xckc016b
   LET g_detail5[li_ac].xckc016c = l_xckc_tot.xckc016c
   LET g_detail5[li_ac].xckc016d = l_xckc_tot.xckc016d
   LET g_detail5[li_ac].xckc016e = l_xckc_tot.xckc016e
   LET g_detail5[li_ac].xckc016f = l_xckc_tot.xckc016f
   LET g_detail5[li_ac].xckc016g = l_xckc_tot.xckc016g
   LET g_detail5[li_ac].xckc016h = l_xckc_tot.xckc016h
   LET g_detail5[li_ac].xckc011  = l_xckc_tot.xckc011 
   LET g_detail5[li_ac].xckc017  = l_xckc_tot.xckc017 
   LET g_detail5[li_ac].xckc017a = l_xckc_tot.xckc017a
   LET g_detail5[li_ac].xckc017b = l_xckc_tot.xckc017b
   LET g_detail5[li_ac].xckc017c = l_xckc_tot.xckc017c
   LET g_detail5[li_ac].xckc017d = l_xckc_tot.xckc017d
   LET g_detail5[li_ac].xckc017e = l_xckc_tot.xckc017e
   LET g_detail5[li_ac].xckc017f = l_xckc_tot.xckc017f
   LET g_detail5[li_ac].xckc017g = l_xckc_tot.xckc017g
   LET g_detail5[li_ac].xckc017h = l_xckc_tot.xckc017h
   LET g_detail5[li_ac].xckc013  = l_xckc_tot.xckc013 
   LET g_detail5[li_ac].xckc018  = l_xckc_tot.xckc018 
   LET g_detail5[li_ac].xckc018a = l_xckc_tot.xckc018a
   LET g_detail5[li_ac].xckc018b = l_xckc_tot.xckc018b
   LET g_detail5[li_ac].xckc018c = l_xckc_tot.xckc018c
   LET g_detail5[li_ac].xckc018d = l_xckc_tot.xckc018d
   LET g_detail5[li_ac].xckc018e = l_xckc_tot.xckc018e
   LET g_detail5[li_ac].xckc018f = l_xckc_tot.xckc018f
   LET g_detail5[li_ac].xckc018g = l_xckc_tot.xckc018g
   LET g_detail5[li_ac].xckc018h = l_xckc_tot.xckc018h
   #总计币别三页签显示
   
   #170427-00041#5 add(S)
    IF NOT cl_null(l_glaa020) THEN
      IF cl_null(l_xckc_tot.xckc019) THEN LET l_xckc_tot.xckc019=0 END IF
      IF cl_null(l_xckc_tot.xckc019a) THEN LET l_xckc_tot.xckc019a=0 END IF
      IF cl_null(l_xckc_tot.xckc019b) THEN LET l_xckc_tot.xckc019b=0 END IF
      IF cl_null(l_xckc_tot.xckc019c) THEN LET l_xckc_tot.xckc019c=0 END IF
      IF cl_null(l_xckc_tot.xckc019d) THEN LET l_xckc_tot.xckc019d=0 END IF 
      IF cl_null(l_xckc_tot.xckc019e) THEN LET l_xckc_tot.xckc019e=0 END IF
      IF cl_null(l_xckc_tot.xckc019f) THEN LET l_xckc_tot.xckc019f=0 END IF
      IF cl_null(l_xckc_tot.xckc019g) THEN LET l_xckc_tot.xckc019g=0 END IF
      IF cl_null(l_xckc_tot.xckc019h) THEN LET l_xckc_tot.xckc019h=0 END IF
      IF cl_null(l_xckc_tot.xckc020) THEN LET l_xckc_tot.xckc020=0 END IF
      IF cl_null(l_xckc_tot.xckc020a) THEN LET l_xckc_tot.xckc020a=0 END IF
      IF cl_null(l_xckc_tot.xckc020b) THEN LET l_xckc_tot.xckc020b=0 END IF
      IF cl_null(l_xckc_tot.xckc020c) THEN LET l_xckc_tot.xckc020c=0 END IF
      IF cl_null(l_xckc_tot.xckc020d) THEN LET l_xckc_tot.xckc020d=0 END IF 
      IF cl_null(l_xckc_tot.xckc020e) THEN LET l_xckc_tot.xckc020e=0 END IF
      IF cl_null(l_xckc_tot.xckc020f) THEN LET l_xckc_tot.xckc020f=0 END IF
      IF cl_null(l_xckc_tot.xckc020g) THEN LET l_xckc_tot.xckc020g=0 END IF
      IF cl_null(l_xckc_tot.xckc020h) THEN LET l_xckc_tot.xckc020h=0 END IF
      IF cl_null(l_xckc_tot.xckc021) THEN LET l_xckc_tot.xckc021=0 END IF
      IF cl_null(l_xckc_tot.xckc021a) THEN LET l_xckc_tot.xckc021a=0 END IF
      IF cl_null(l_xckc_tot.xckc021b) THEN LET l_xckc_tot.xckc021b=0 END IF
      IF cl_null(l_xckc_tot.xckc021c) THEN LET l_xckc_tot.xckc021c=0 END IF
      IF cl_null(l_xckc_tot.xckc021d) THEN LET l_xckc_tot.xckc021d=0 END IF 
      IF cl_null(l_xckc_tot.xckc021e) THEN LET l_xckc_tot.xckc021e=0 END IF
      IF cl_null(l_xckc_tot.xckc021f) THEN LET l_xckc_tot.xckc021f=0 END IF
      IF cl_null(l_xckc_tot.xckc021g) THEN LET l_xckc_tot.xckc021g=0 END IF
      IF cl_null(l_xckc_tot.xckc021h) THEN LET l_xckc_tot.xckc021h=0 END IF
      IF cl_null(l_xckc_tot.xckc022) THEN LET l_xckc_tot.xckc022=0 END IF
      IF cl_null(l_xckc_tot.xckc022a) THEN LET l_xckc_tot.xckc022a=0 END IF
      IF cl_null(l_xckc_tot.xckc022b) THEN LET l_xckc_tot.xckc022b=0 END IF
      IF cl_null(l_xckc_tot.xckc022c) THEN LET l_xckc_tot.xckc022c=0 END IF
      IF cl_null(l_xckc_tot.xckc022d) THEN LET l_xckc_tot.xckc022d=0 END IF 
      IF cl_null(l_xckc_tot.xckc022e) THEN LET l_xckc_tot.xckc022e=0 END IF
      IF cl_null(l_xckc_tot.xckc022f) THEN LET l_xckc_tot.xckc022f=0 END IF
      IF cl_null(l_xckc_tot.xckc022g) THEN LET l_xckc_tot.xckc022g=0 END IF
      IF cl_null(l_xckc_tot.xckc022h) THEN LET l_xckc_tot.xckc022h=0 END IF      
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019,'5') RETURNING l_xckc_tot.xckc019
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019a,'5') RETURNING l_xckc_tot.xckc019a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019b,'5') RETURNING l_xckc_tot.xckc019b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019c,'5') RETURNING l_xckc_tot.xckc019c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019d,'5') RETURNING l_xckc_tot.xckc019d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019e,'5') RETURNING l_xckc_tot.xckc019e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019f,'5') RETURNING l_xckc_tot.xckc019f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019g,'5') RETURNING l_xckc_tot.xckc019g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc019h,'5') RETURNING l_xckc_tot.xckc019h
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020,'5') RETURNING l_xckc_tot.xckc020
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020a,'5') RETURNING l_xckc_tot.xckc020a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020b,'5') RETURNING l_xckc_tot.xckc020b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020c,'5') RETURNING l_xckc_tot.xckc020c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020d,'5') RETURNING l_xckc_tot.xckc020d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020e,'5') RETURNING l_xckc_tot.xckc020e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020f,'5') RETURNING l_xckc_tot.xckc020f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020g,'5') RETURNING l_xckc_tot.xckc020g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc020h,'5') RETURNING l_xckc_tot.xckc020h
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021,'5') RETURNING l_xckc_tot.xckc021
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021a,'5') RETURNING l_xckc_tot.xckc021a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021b,'5') RETURNING l_xckc_tot.xckc021b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021c,'5') RETURNING l_xckc_tot.xckc021c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021d,'5') RETURNING l_xckc_tot.xckc021d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021e,'5') RETURNING l_xckc_tot.xckc021e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021f,'5') RETURNING l_xckc_tot.xckc021f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021g,'5') RETURNING l_xckc_tot.xckc021g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc021h,'5') RETURNING l_xckc_tot.xckc021h
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022,'5') RETURNING l_xckc_tot.xckc022
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022a,'5') RETURNING l_xckc_tot.xckc022a
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022b,'5') RETURNING l_xckc_tot.xckc022b
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022c,'5') RETURNING l_xckc_tot.xckc022c
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022d,'5') RETURNING l_xckc_tot.xckc022d
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022e,'5') RETURNING l_xckc_tot.xckc022e
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022f,'5') RETURNING l_xckc_tot.xckc022f
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022g,'5') RETURNING l_xckc_tot.xckc022g
      CALL s_curr_round(g_master.xckbcomp,l_glaa020,l_xckc_tot.xckc022h,'5') RETURNING l_xckc_tot.xckc022h
    END IF
      #170427-00041#5 add(E)
   LET g_detail6[li_ac].xcbb010  = cl_getmsg("lib-00133",g_dlang) #总计
   LET g_detail6[li_ac].xckc007  = l_xckc_tot.xckc007 
   LET g_detail6[li_ac].xckc019  = l_xckc_tot.xckc019 
   LET g_detail6[li_ac].xckc019a = l_xckc_tot.xckc019a
   LET g_detail6[li_ac].xckc019b = l_xckc_tot.xckc019b
   LET g_detail6[li_ac].xckc019c = l_xckc_tot.xckc019c
   LET g_detail6[li_ac].xckc019d = l_xckc_tot.xckc019d
   LET g_detail6[li_ac].xckc019e = l_xckc_tot.xckc019e
   LET g_detail6[li_ac].xckc019f = l_xckc_tot.xckc019f
   LET g_detail6[li_ac].xckc019g = l_xckc_tot.xckc019g
   LET g_detail6[li_ac].xckc019h = l_xckc_tot.xckc019h
   LET g_detail6[li_ac].xckc009  = l_xckc_tot.xckc009 
   LET g_detail6[li_ac].xckc020  = l_xckc_tot.xckc020 
   LET g_detail6[li_ac].xckc020a = l_xckc_tot.xckc020a
   LET g_detail6[li_ac].xckc020b = l_xckc_tot.xckc020b
   LET g_detail6[li_ac].xckc020c = l_xckc_tot.xckc020c
   LET g_detail6[li_ac].xckc020d = l_xckc_tot.xckc020d
   LET g_detail6[li_ac].xckc020e = l_xckc_tot.xckc020e
   LET g_detail6[li_ac].xckc020f = l_xckc_tot.xckc020f
   LET g_detail6[li_ac].xckc020g = l_xckc_tot.xckc020g
   LET g_detail6[li_ac].xckc020h = l_xckc_tot.xckc020h
   LET g_detail6[li_ac].xckc011  = l_xckc_tot.xckc011 
   LET g_detail6[li_ac].xckc021  = l_xckc_tot.xckc021 
   LET g_detail6[li_ac].xckc021a = l_xckc_tot.xckc021a
   LET g_detail6[li_ac].xckc021b = l_xckc_tot.xckc021b
   LET g_detail6[li_ac].xckc021c = l_xckc_tot.xckc021c
   LET g_detail6[li_ac].xckc021d = l_xckc_tot.xckc021d
   LET g_detail6[li_ac].xckc021e = l_xckc_tot.xckc021e
   LET g_detail6[li_ac].xckc021f = l_xckc_tot.xckc021f
   LET g_detail6[li_ac].xckc021g = l_xckc_tot.xckc021g
   LET g_detail6[li_ac].xckc021h = l_xckc_tot.xckc021h
   LET g_detail6[li_ac].xckc013  = l_xckc_tot.xckc013 
   LET g_detail6[li_ac].xckc022  = l_xckc_tot.xckc022 
   LET g_detail6[li_ac].xckc022a = l_xckc_tot.xckc022a
   LET g_detail6[li_ac].xckc022b = l_xckc_tot.xckc022b
   LET g_detail6[li_ac].xckc022c = l_xckc_tot.xckc022c
   LET g_detail6[li_ac].xckc022d = l_xckc_tot.xckc022d
   LET g_detail6[li_ac].xckc022e = l_xckc_tot.xckc022e
   LET g_detail6[li_ac].xckc022f = l_xckc_tot.xckc022f
   LET g_detail6[li_ac].xckc022g = l_xckc_tot.xckc022g
   LET g_detail6[li_ac].xckc022h = l_xckc_tot.xckc022h
   
   FREE axcq200_pb2
   #170618-00439#1 add --s
   #組合QBE輸入的條件中，去除年度、期別的查詢條件
   #舉例g_wc = "xckbcomp='DSCNJ' and xckbld='03' and xckb007=2014 and xckb008=11 AND   1 = 1        "
   #經過底下這段會只剩下g_wc = "xckbcomp='DSCNJ' and xckbld='03' and   1 = 1        "
   LET l_wc = "and ",g_wc
   LET l_wc = cl_replace_str(l_wc,"AND"," and")
   LET l_e = l_wc.getIndexOf("and xckb007",1) - 1
   IF l_e > 0 THEN
      LET l_str1 = l_wc.subString(1,l_e)
      LET l_s = l_wc.getIndexOf("and",l_wc.getIndexOf("and xckb007",1)+5) - 1
      LET l_str2 = l_wc.subString(l_s,l_wc.getLength())
      LET l_wc = l_str1,l_str2
   END IF
   LET l_e = l_wc.getIndexOf("and xckb008",1) - 1
   IF l_e > 0 THEN
      LET l_str1 = l_wc.subString(1,l_e)
      LET l_s = l_wc.getIndexOf("and",l_wc.getIndexOf("and xckb008",1)+5) - 1
      LET l_str2 = l_wc.subString(l_s,l_wc.getLength())
      LET l_wc = l_str1,l_str2
   END IF
   
   
#191113-00049#1  效率优化mark -s    
    #未開票明細SQL
#    LET g_sql = "SELECT xckb001,xckb005,xckb006,xckb009,pmaal004,xckb012,imaal003,imaal004,xmdl024,",
#                "       SUM(xckb102*xckb002)/COALESCE(SUM(xckb014*xckb002),0),",
#                "       SUM(xckb014*xckb002),SUM(xckb027*xckb002),SUM(xckb102*xckb002)",
#                "       ,xmdk016,xmdkdocdt,xckb026",   #180720-00020#1 add
#                "  FROM ",
                #"(SELECT DISTINCT",   #190311-00014#1   mark
#                "(SELECT  ",   #190311-00014#1
#               "        (SELECT DISTINCT b.xckb001 FROM xckb_t b WHERE a.xckbent = b.xckbent AND a.xckb005 = b.xckb005 AND b.xckb001 <> '4') xckb001,",
#                "        xckb005,xckb006,xckb009,",
#                "        (SELECT pmaal004 FROM pmaal_t WHERE xckbent = pmaalent AND xckb009 = pmaal001 AND pmaal002 = '",g_dlang,"') pmaal004,",
#                "        xckb012,",
#                "        (SELECT imaal003 FROM imaal_t WHERE xckbent = imaalent AND xckb012 = imaal001 AND imaal002 = '",g_dlang,"') imaal003,", 
#                "        (SELECT imaal004 FROM imaal_t WHERE xckbent = imaalent AND xckb012 = imaal001 AND imaal002 = '",g_dlang,"') imaal004,",
#                "        (SELECT xmdl024 FROM xmdl_t WHERE xckbent = xmdlent AND xckb005 = xmdldocno AND xckb006 = xmdlseq) xmdl024,",
#                "        (SELECT xmdk016 FROM xmdk_t WHERE xckbent = xmdkent AND xckb005 = xmdkdocno ) xmdk016,xckb026,",    #180720-00020#1
#                "        (SELECT xmdkdocdt FROM xmdk_t WHERE xckbent = xmdkent AND xckb005 = xmdkdocno ) xmdkdocdt,",    #180720-00020#1 
#                "        xckb002,xckb014,xckb027,xckb102,xckbent,xckbcomp,xckbld",
#                "   FROM xckb_t a",
#                "  WHERE xckbent = ",g_enterprise,
#                "    AND xckbcomp = '",g_master.xckbcomp,"'",  
#                "    AND xckbld = '",g_master.xckbld,"'",
#                "    AND xckb007*12+xckb008 <= ",g_master.xckb007*12+g_master.xckb008,
                #l_wc,") ",  #180720-00020#1 mark
#                "    ",l_wc,") ",  #180720-00020#1
#                " GROUP BY xckb001,xckb005,xckb006,xckb009,pmaal004,xckb012,imaal003,imaal004,xmdl024,xmdk016,xckb026,xmdkdocdt",  #180720-00020#1 add xmdk016,xckb026,xmdkdocdt
                #" HAVING SUM(xckb014*xckb002) > 0" #180919-00042#1 mark
#                " HAVING (CASE WHEN xckb001 = '3' THEN SUM(xckb014*xckb002) * -1 ELSE SUM(xckb014*xckb002) END) > 0 " #180919-00042#1 add
#                ," ORDER BY xmdk016 "  #180720-00020#1
#191113-00049#1  效率优化mark -e

 # #191113-00049#1 效能优化--s 
   LET l_wc_qq = l_wc
   LET l_wc_qq = cl_replace_str(l_wc,"xckb","a.xckb")
    #未開票明細SQL
    LET g_sql = "SELECT b.xckb001, ",
                " a.xckb005,a.xckb006,a.xckb009, ",
                " (SELECT pmaal004 FROM pmaal_t WHERE a.xckbent = pmaalent AND a.xckb009 = pmaal001 AND pmaal002 = '",g_dlang,"') pmaal004, ",
                " a.xckb012, ",
                " (SELECT imaal003 FROM imaal_t WHERE a.xckbent = imaalent AND a.xckb012 = imaal001 AND imaal002 = '",g_dlang,"') imaal003, ",
                " (SELECT imaal004 FROM imaal_t WHERE a.xckbent = imaalent AND a.xckb012 = imaal001 AND imaal002 = '",g_dlang,"') imaal004, ",
                "  xmdl024,",
                "       SUM(a.xckb102*a.xckb002)/COALESCE(SUM(a.xckb014*a.xckb002),0),",
                "       SUM(a.xckb014*a.xckb002),SUM(a.xckb027*a.xckb002),SUM(a.xckb102*a.xckb002),",
                "       (SELECT xmdk016 FROM xmdk_t WHERE a.xckbent = xmdkent AND a.xckb005 = xmdkdocno ) xmdk016, ",    #180720-00020#1
                "       (SELECT xmdkdocdt FROM xmdk_t WHERE a.xckbent = xmdkent AND a.xckb005 = xmdkdocno ) xmdkdocdt,a.xckb026 ",    #180720-00020#1 
                "   FROM xckb_t a",
                " LEFT OUTER JOIN xmdl_t ON a.xckbent = xmdlent  AND a.xckb005 = xmdldocno AND a.xckb006 = xmdlseq ",
                #" LEFT OUTER JOIN xckb_t b ON a.xckbent = b.xckbent  AND a.xckb005 = b.xckb005 AND b.xckb001 <> '4' ",  #201028-00008#1 mark
               #" LEFT OUTER JOIN xckb_t b ON a.xckbent = b.xckbent AND a.xckbld=b.xckbld AND a.xckbcomp=b.xckbcomp AND b.xckb001 ='1' ",       #201028-00008#1 #210506-00027#1 mark
                " LEFT OUTER JOIN xckb_t b ON a.xckbent = b.xckbent AND a.xckbld=b.xckbld AND a.xckbcomp=b.xckbcomp ",      #210506-00027#1 add
                "                        AND a.xckb005 = b.xckb005 AND a.xckb006=b.xckb006 AND a.xckb036 = b.xckb036 AND b.xckb001 <> '4' ",   #201028-00008#1                
                "  WHERE a.xckbent = ",g_enterprise,
                "    AND a.xckbcomp = '",g_master.xckbcomp,"'",  
                "    AND a.xckbld = '",g_master.xckbld,"'",
                "    AND (a.xckb007 < '",g_master.xckb007,"' OR (a.xckb007 = '",g_master.xckb007,"' AND a.xckb008 <= '",g_master.xckb008,"' )) ",
                l_wc_qq," ",
                " GROUP BY a.xckbent,b.xckb001,a.xckb005,a.xckb006,a.xckb009,a.xckb012,xmdl024,a.xckb026",               
                " HAVING (CASE WHEN b.xckb001 = '3' THEN SUM(a.xckb014*a.xckb002) * -1 ELSE SUM(a.xckb014*a.xckb002) END) > 0 " #180919-00042#1 add
   #191113-00049#1 效能优化--e     
    PREPARE axcq200_pre2 FROM g_sql
    DECLARE axcq200_cur2 CURSOR FOR axcq200_pre2
    CALL g_detail7.clear()
    CALL axcq200_xckb_tot_to_0() RETURNING l_xckb_tot.*  #181129-00060#1 add   
    LET li_ac = 1
    LET l_rate1 = 1   #180720-00020#1 add
    CALL cl_err_collect_init() #190624-00019#1 add
    LET lc_param.sfin2009 = cl_get_para(g_enterprise,g_master.xckbcomp,'S-FIN-2009')   #210511-00015#1 add
    FOREACH axcq200_cur2
       INTO g_detail7[li_ac].xckb001,g_detail7[li_ac].xckb005,g_detail7[li_ac].xckb006,
            g_detail7[li_ac].xckb009,g_detail7[li_ac].xckb009_5_desc,g_detail7[li_ac].xckb012,
            g_detail7[li_ac].xckb012_desc_5,g_detail7[li_ac].xckb012_desc2_5,g_detail7[li_ac].xmdl024,
            g_detail7[li_ac].price,g_detail7[li_ac].xckb014,g_detail7[li_ac].xckb027,
            g_detail7[li_ac].xckb102,l_xmdk016,l_xmdkdocdt,l_xckb026    #180720-00020#1 add l_xmdk016,l_xmdkdocdt,l_xckb026
       #180720-00020#1---add---s       
       IF cl_null(l_xmdk016_t) OR l_xmdk016_t <> l_xmdk016 THEN 
          LET ls_js = util.JSON.stringify(lc_param)
         #CALL s_fin_get_curr_rate(g_master.xckbcomp,g_master.xckbld,l_xmdkdocdt,l_xmdk016,' ') RETURNING l_rate1,l_rate2,l_rate3        #210511-00015#1 mark
          CALL s_fin_get_curr_rate(g_master.xckbcomp,g_master.xckbld,l_xmdkdocdt,l_xmdk016,ls_js) RETURNING l_rate1,l_rate2,l_rate3      #210511-00015#1 add          
       END IF
       LET g_detail7[li_ac].xmdl024 = g_detail7[li_ac].xmdl024 * l_rate1
       #180720-00020#1---add---e
#181129-00060#1  add_S            
      #总计
       IF cl_null(g_detail7[li_ac].xckb027) THEN LET g_detail7[li_ac].xckb027 = 0 END IF
       IF cl_null(g_detail7[li_ac].xckb102) THEN LET g_detail7[li_ac].xckb102 = 0 END IF      
       LET l_xckb_tot.xckb027  = l_xckb_tot.xckb027  + g_detail7[li_ac].xckb027 
       LET l_xckb_tot.xckb102  = l_xckb_tot.xckb102  + g_detail7[li_ac].xckb102
#181129-00060#1  add_E          
       LET li_ac = li_ac + 1
    END FOREACH
    CALL cl_err_collect_show() #190624-00019#1 add
#181129-00060#1  add_S 
    CALL g_detail7.deleteElement(g_detail7.getLength())
   #170618-00439#1 add --e
   #CALL g_detail2.deleteElement(g_detail2.getLength())
   #总计显示
      IF cl_null(l_xckb_tot.xckb027) THEN LET l_xckb_tot.xckb027 = 0 END IF
      IF cl_null(l_xckb_tot.xckb102) THEN LET l_xckb_tot.xckb102 = 0 END IF
      LET g_detail7[li_ac].xckb012  = cl_getmsg("lib-00133",g_dlang) #总计
      LET g_detail7[li_ac].xckb027  = l_xckb_tot.xckb027 
      LET g_detail7[li_ac].xckb102  = l_xckb_tot.xckb102
#181129-00060#1  add_E   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.detail_show" type="s" >}
#+ 顯示相關資料
PRIVATE FUNCTION axcq200_detail_show(ps_page)
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
 
      #end add-point
   END IF
 
   IF ps_page.getIndexOf("'2'",1) > 0 THEN
      #帶出公用欄位reference值page2
      
 
      #add-point:show段單身reference name="detail_show.body2.reference"
 
      #end add-point
   END IF
 
   IF ps_page.getIndexOf("'3'",1) > 0 THEN
      #帶出公用欄位reference值page3
      
 
      #add-point:show段單身reference name="detail_show.body3.reference"
 
      #end add-point
   END IF
 
   IF ps_page.getIndexOf("'4'",1) > 0 THEN
      #帶出公用欄位reference值page4
      
 
      #add-point:show段單身reference name="detail_show.body4.reference"
 
      #end add-point
   END IF
 
   IF ps_page.getIndexOf("'5'",1) > 0 THEN
      #帶出公用欄位reference值page5
      
 
      #add-point:show段單身reference name="detail_show.body5.reference"
 
      #end add-point
   END IF
 
   IF ps_page.getIndexOf("'6'",1) > 0 THEN
      #帶出公用欄位reference值page6
      
 
      #add-point:show段單身reference name="detail_show.body6.reference"
 
      #end add-point
   END IF
 
   IF ps_page.getIndexOf("'7'",1) > 0 THEN
      #帶出公用欄位reference值page7
      
 
      #add-point:show段單身reference name="detail_show.body7.reference"


      #end add-point
   END IF
 
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.maintain_prog" type="s" >}
#+ 串查至主維護程式
PRIVATE FUNCTION axcq200_maintain_prog()
   #add-point:maintain_prog段define-客製 name="maintain_prog.define_customerization"
   
   #end add-point
   DEFINE ls_js      STRING
   DEFINE la_param   RECORD
                     prog       STRING,
                     actionid   STRING,
                     background LIKE type_t.chr1,
                     param      DYNAMIC ARRAY OF STRING
                     END RECORD
   DEFINE ls_j       LIKE type_t.num5
   #add-point:maintain_prog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="maintain_prog.define"
   
   #end add-point
 
 
   #add-point:maintain_prog段開始前 name="maintain_prog.before"
   
   #end add-point
 
   LET la_param.prog = ""
 
 
 
   IF NOT cl_null(la_param.prog) THEN
      LET ls_js = util.JSON.stringify(la_param)
      CALL cl_cmdrun_wait(ls_js)
   END IF
 
   #add-point:maintain_prog段結束前 name="maintain_prog.after"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="axcq200.detail_action_trans" type="s" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION axcq200_detail_action_trans()
   #add-point:detail_action_trans段define-客製 name="detail_action_trans.define_customerization"
   
   #end add-point
   #add-point:detail_action_trans段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_action_trans.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_action_trans.before_function"
   
   #end add-point
 
   #因應單身切頁功能，筆數計算方式調整
   #(ver:34) ---modify start---
   LET g_curr_diag = ui.DIALOG.getCurrent()
   IF g_pagestart = 0 THEN
      LET g_pagestart = 1
   END IF
 
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_detail.getLength() THEN
         LET g_detail_idx = g_detail.getLength()
      END IF
      IF g_detail_idx = 0 AND g_detail.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET g_current_row_tot = g_pagestart + g_detail_idx - 1
      IF g_tot_cnt > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.idx
         DISPLAY g_tot_cnt TO FORMONLY.cnt
      ELSE
         IF g_detail.getLength() > 0 THEN
            DISPLAY g_current_row_tot TO FORMONLY.idx
            DISPLAY g_detail.getLength() TO FORMONLY.cnt
         ELSE
            DISPLAY '' TO FORMONLY.idx
            DISPLAY '' TO FORMONLY.cnt
         END IF
      END IF
   END IF
 
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_detail2.getLength() THEN
         LET g_detail_idx = g_detail2.getLength()
      END IF
      IF g_detail_idx = 0 AND g_detail2.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET g_current_row_tot = g_pagestart + g_detail_idx - 1
      IF g_detail2.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.idx
         DISPLAY g_detail2.getLength() TO FORMONLY.cnt
      ELSE
         DISPLAY '' TO FORMONLY.idx
         DISPLAY '' TO FORMONLY.cnt
      END IF
   END IF
 
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_detail3.getLength() THEN
         LET g_detail_idx = g_detail3.getLength()
      END IF
      IF g_detail_idx = 0 AND g_detail3.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET g_current_row_tot = g_pagestart + g_detail_idx - 1
      IF g_detail3.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.idx
         DISPLAY g_detail3.getLength() TO FORMONLY.cnt
      ELSE
         DISPLAY '' TO FORMONLY.idx
         DISPLAY '' TO FORMONLY.cnt
      END IF
   END IF
 
   IF g_current_page = 4 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
      IF g_detail_idx > g_detail4.getLength() THEN
         LET g_detail_idx = g_detail4.getLength()
      END IF
      IF g_detail_idx = 0 AND g_detail4.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET g_current_row_tot = g_pagestart + g_detail_idx - 1
      IF g_detail4.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.idx
         DISPLAY g_detail4.getLength() TO FORMONLY.cnt
      ELSE
         DISPLAY '' TO FORMONLY.idx
         DISPLAY '' TO FORMONLY.cnt
      END IF
   END IF
 
   IF g_current_page = 5 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail5")
      IF g_detail_idx > g_detail5.getLength() THEN
         LET g_detail_idx = g_detail5.getLength()
      END IF
      IF g_detail_idx = 0 AND g_detail5.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET g_current_row_tot = g_pagestart + g_detail_idx - 1
      IF g_detail5.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.idx
         DISPLAY g_detail5.getLength() TO FORMONLY.cnt
      ELSE
         DISPLAY '' TO FORMONLY.idx
         DISPLAY '' TO FORMONLY.cnt
      END IF
   END IF
 
   IF g_current_page = 6 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail6")
      IF g_detail_idx > g_detail6.getLength() THEN
         LET g_detail_idx = g_detail6.getLength()
      END IF
      IF g_detail_idx = 0 AND g_detail6.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET g_current_row_tot = g_pagestart + g_detail_idx - 1
      IF g_detail6.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.idx
         DISPLAY g_detail6.getLength() TO FORMONLY.cnt
      ELSE
         DISPLAY '' TO FORMONLY.idx
         DISPLAY '' TO FORMONLY.cnt
      END IF
   END IF
 
   IF g_current_page = 7 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail7")
      IF g_detail_idx > g_detail7.getLength() THEN
         LET g_detail_idx = g_detail7.getLength()
      END IF
      IF g_detail_idx = 0 AND g_detail7.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET g_current_row_tot = g_pagestart + g_detail_idx - 1
      IF g_detail7.getLength() > 0 THEN
         DISPLAY g_current_row_tot TO FORMONLY.idx
         DISPLAY g_detail7.getLength() TO FORMONLY.cnt
      ELSE
         DISPLAY '' TO FORMONLY.idx
         DISPLAY '' TO FORMONLY.cnt
      END IF
   END IF
 
 
   #(ver:34) --- modify end ---
 
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
 
{<section id="axcq200.detail_index_setting" type="s" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION axcq200_detail_index_setting()
   #add-point:detail_index_setting段define-客製 name="detail_index_setting.define_customerization"
   
   #end add-point
   DEFINE li_redirect     BOOLEAN
   DEFINE ldig_curr       ui.Dialog
   #add-point:detail_index_setting段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_index_setting.define"
   
   #end add-point
 
 
   #add-point:FUNCTION前置處理 name="detail_index_setting.before_function"
   
   #end add-point
 
   IF g_master_row_move = "Y" THEN
      LET g_detail_idx = 1
      LET li_redirect = TRUE
   ELSE
      IF g_curr_diag IS NOT NULL THEN
         CASE
            WHEN g_curr_diag.getCurrentRow("s_detail1") <= "0"
               LET g_detail_idx = 1
               IF g_detail.getLength() THEN
                  LET li_redirect = TRUE
               END IF
            WHEN g_curr_diag.getCurrentRow("s_detail1") > g_detail.getLength() AND g_detail.getLength() > 0
               LET g_detail_idx = g_detail.getLength()
               LET li_redirect = TRUE
            WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
               IF g_detail_idx > g_detail.getLength() THEN
                  LET g_detail_idx = g_detail.getLength()
               END IF
               LET li_redirect = TRUE
         END CASE
      END IF
   END IF
 
   IF li_redirect THEN
      LET ldig_curr = ui.Dialog.getCurrent()
      CALL ldig_curr.setCurrentRow("s_detail1", g_detail_idx)
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="axcq200.mask_functions" type="s" >}
 &include "erp/axc/axcq200_mask.4gl"
 
{</section>}
 
{<section id="axcq200.other_function" readonly="Y" type="s" >}

#变量清0
PRIVATE FUNCTION axcq200_xcbb010_sum_to_0()
   DEFINE r_xcbb010_sum   RECORD  #按成本分群小计
                          xckc007  LIKE xckc_t.xckc007, 
                          xckc008  LIKE xckc_t.xckc008, 
                          xckc008a LIKE xckc_t.xckc008a, 
                          xckc008b LIKE xckc_t.xckc008b, 
                          xckc008c LIKE xckc_t.xckc008c, 
                          xckc008d LIKE xckc_t.xckc008d, 
                          xckc008e LIKE xckc_t.xckc008e, 
                          xckc008f LIKE xckc_t.xckc008f, 
                          xckc008g LIKE xckc_t.xckc008g, 
                          xckc008h LIKE xckc_t.xckc008h, 
                          xckc009  LIKE xckc_t.xckc009, 
                          xckc010  LIKE xckc_t.xckc010, 
                          xckc010a LIKE xckc_t.xckc010a, 
                          xckc010b LIKE xckc_t.xckc010b, 
                          xckc010c LIKE xckc_t.xckc010c, 
                          xckc010d LIKE xckc_t.xckc010d, 
                          xckc010e LIKE xckc_t.xckc010e, 
                          xckc010f LIKE xckc_t.xckc010f, 
                          xckc010g LIKE xckc_t.xckc010g, 
                          xckc010h LIKE xckc_t.xckc010h, 
                          xckc011  LIKE xckc_t.xckc011, 
                          xckc012  LIKE xckc_t.xckc012, 
                          xckc012a LIKE xckc_t.xckc012a, 
                          xckc012b LIKE xckc_t.xckc012b, 
                          xckc012c LIKE xckc_t.xckc012c, 
                          xckc012d LIKE xckc_t.xckc012d, 
                          xckc012e LIKE xckc_t.xckc012e, 
                          xckc012f LIKE xckc_t.xckc012f, 
                          xckc012g LIKE xckc_t.xckc012g, 
                          xckc012h LIKE xckc_t.xckc012h, 
                          xckc013  LIKE xckc_t.xckc013, 
                          xckc014  LIKE xckc_t.xckc014, 
                          xckc014a LIKE xckc_t.xckc014a, 
                          xckc014b LIKE xckc_t.xckc014b, 
                          xckc014c LIKE xckc_t.xckc014c, 
                          xckc014d LIKE xckc_t.xckc014d, 
                          xckc014e LIKE xckc_t.xckc014e, 
                          xckc014f LIKE xckc_t.xckc014f, 
                          xckc014g LIKE xckc_t.xckc014g, 
                          xckc014h LIKE xckc_t.xckc014h,
                          xckc015  LIKE xckc_t.xckc015, 
                          xckc015a LIKE xckc_t.xckc015a, 
                          xckc015b LIKE xckc_t.xckc015b, 
                          xckc015c LIKE xckc_t.xckc015c, 
                          xckc015d LIKE xckc_t.xckc015d, 
                          xckc015e LIKE xckc_t.xckc015e, 
                          xckc015f LIKE xckc_t.xckc015f, 
                          xckc015g LIKE xckc_t.xckc015g, 
                          xckc015h LIKE xckc_t.xckc015h,
                          xckc016  LIKE xckc_t.xckc016, 
                          xckc016a LIKE xckc_t.xckc016a, 
                          xckc016b LIKE xckc_t.xckc016b, 
                          xckc016c LIKE xckc_t.xckc016c, 
                          xckc016d LIKE xckc_t.xckc016d, 
                          xckc016e LIKE xckc_t.xckc016e, 
                          xckc016f LIKE xckc_t.xckc016f, 
                          xckc016g LIKE xckc_t.xckc016g, 
                          xckc016h LIKE xckc_t.xckc016h,
                          xckc017  LIKE xckc_t.xckc017, 
                          xckc017a LIKE xckc_t.xckc017a, 
                          xckc017b LIKE xckc_t.xckc017b, 
                          xckc017c LIKE xckc_t.xckc017c, 
                          xckc017d LIKE xckc_t.xckc017d, 
                          xckc017e LIKE xckc_t.xckc017e, 
                          xckc017f LIKE xckc_t.xckc017f, 
                          xckc017g LIKE xckc_t.xckc017g, 
                          xckc017h LIKE xckc_t.xckc017h,
                          xckc018  LIKE xckc_t.xckc018, 
                          xckc018a LIKE xckc_t.xckc018a, 
                          xckc018b LIKE xckc_t.xckc018b, 
                          xckc018c LIKE xckc_t.xckc018c, 
                          xckc018d LIKE xckc_t.xckc018d, 
                          xckc018e LIKE xckc_t.xckc018e, 
                          xckc018f LIKE xckc_t.xckc018f, 
                          xckc018g LIKE xckc_t.xckc018g, 
                          xckc018h LIKE xckc_t.xckc018h,
                          xckc019  LIKE xckc_t.xckc019, 
                          xckc019a LIKE xckc_t.xckc019a, 
                          xckc019b LIKE xckc_t.xckc019b, 
                          xckc019c LIKE xckc_t.xckc019c, 
                          xckc019d LIKE xckc_t.xckc019d, 
                          xckc019e LIKE xckc_t.xckc019e, 
                          xckc019f LIKE xckc_t.xckc019f, 
                          xckc019g LIKE xckc_t.xckc019g, 
                          xckc019h LIKE xckc_t.xckc019h,
                          xckc020  LIKE xckc_t.xckc020, 
                          xckc020a LIKE xckc_t.xckc020a, 
                          xckc020b LIKE xckc_t.xckc020b, 
                          xckc020c LIKE xckc_t.xckc020c, 
                          xckc020d LIKE xckc_t.xckc020d, 
                          xckc020e LIKE xckc_t.xckc020e, 
                          xckc020f LIKE xckc_t.xckc020f, 
                          xckc020g LIKE xckc_t.xckc020g, 
                          xckc020h LIKE xckc_t.xckc020h,
                          xckc021  LIKE xckc_t.xckc021, 
                          xckc021a LIKE xckc_t.xckc021a, 
                          xckc021b LIKE xckc_t.xckc021b, 
                          xckc021c LIKE xckc_t.xckc021c, 
                          xckc021d LIKE xckc_t.xckc021d, 
                          xckc021e LIKE xckc_t.xckc021e, 
                          xckc021f LIKE xckc_t.xckc021f, 
                          xckc021g LIKE xckc_t.xckc021g, 
                          xckc021h LIKE xckc_t.xckc021h,
                          xckc022  LIKE xckc_t.xckc022, 
                          xckc022a LIKE xckc_t.xckc022a, 
                          xckc022b LIKE xckc_t.xckc022b, 
                          xckc022c LIKE xckc_t.xckc022c, 
                          xckc022d LIKE xckc_t.xckc022d, 
                          xckc022e LIKE xckc_t.xckc022e, 
                          xckc022f LIKE xckc_t.xckc022f, 
                          xckc022g LIKE xckc_t.xckc022g, 
                          xckc022h LIKE xckc_t.xckc022h
                          END RECORD

   LET r_xcbb010_sum.xckc007  = 0
   LET r_xcbb010_sum.xckc008  = 0
   LET r_xcbb010_sum.xckc008a = 0
   LET r_xcbb010_sum.xckc008b = 0
   LET r_xcbb010_sum.xckc008c = 0
   LET r_xcbb010_sum.xckc008d = 0
   LET r_xcbb010_sum.xckc008e = 0
   LET r_xcbb010_sum.xckc008f = 0
   LET r_xcbb010_sum.xckc008g = 0
   LET r_xcbb010_sum.xckc008h = 0
   LET r_xcbb010_sum.xckc009  = 0
   LET r_xcbb010_sum.xckc010  = 0
   LET r_xcbb010_sum.xckc010a = 0
   LET r_xcbb010_sum.xckc010b = 0
   LET r_xcbb010_sum.xckc010c = 0
   LET r_xcbb010_sum.xckc010d = 0
   LET r_xcbb010_sum.xckc010e = 0
   LET r_xcbb010_sum.xckc010f = 0
   LET r_xcbb010_sum.xckc010g = 0
   LET r_xcbb010_sum.xckc010h = 0
   LET r_xcbb010_sum.xckc011  = 0
   LET r_xcbb010_sum.xckc012  = 0
   LET r_xcbb010_sum.xckc012a = 0
   LET r_xcbb010_sum.xckc012b = 0
   LET r_xcbb010_sum.xckc012c = 0
   LET r_xcbb010_sum.xckc012d = 0
   LET r_xcbb010_sum.xckc012e = 0
   LET r_xcbb010_sum.xckc012f = 0
   LET r_xcbb010_sum.xckc012g = 0
   LET r_xcbb010_sum.xckc012h = 0
   LET r_xcbb010_sum.xckc013  = 0
   LET r_xcbb010_sum.xckc014  = 0
   LET r_xcbb010_sum.xckc014a = 0
   LET r_xcbb010_sum.xckc014b = 0
   LET r_xcbb010_sum.xckc014c = 0
   LET r_xcbb010_sum.xckc014d = 0
   LET r_xcbb010_sum.xckc014e = 0
   LET r_xcbb010_sum.xckc014f = 0
   LET r_xcbb010_sum.xckc014g = 0
   LET r_xcbb010_sum.xckc014h = 0
   LET r_xcbb010_sum.xckc015  = 0
   LET r_xcbb010_sum.xckc015a = 0
   LET r_xcbb010_sum.xckc015b = 0
   LET r_xcbb010_sum.xckc015c = 0
   LET r_xcbb010_sum.xckc015d = 0
   LET r_xcbb010_sum.xckc015e = 0
   LET r_xcbb010_sum.xckc015f = 0
   LET r_xcbb010_sum.xckc015g = 0
   LET r_xcbb010_sum.xckc015h = 0
   LET r_xcbb010_sum.xckc016  = 0
   LET r_xcbb010_sum.xckc016a = 0
   LET r_xcbb010_sum.xckc016b = 0
   LET r_xcbb010_sum.xckc016c = 0
   LET r_xcbb010_sum.xckc016d = 0
   LET r_xcbb010_sum.xckc016e = 0
   LET r_xcbb010_sum.xckc016f = 0
   LET r_xcbb010_sum.xckc016g = 0
   LET r_xcbb010_sum.xckc016h = 0
   LET r_xcbb010_sum.xckc017  = 0
   LET r_xcbb010_sum.xckc017a = 0
   LET r_xcbb010_sum.xckc017b = 0
   LET r_xcbb010_sum.xckc017c = 0
   LET r_xcbb010_sum.xckc017d = 0
   LET r_xcbb010_sum.xckc017e = 0
   LET r_xcbb010_sum.xckc017f = 0
   LET r_xcbb010_sum.xckc017g = 0
   LET r_xcbb010_sum.xckc017h = 0
   LET r_xcbb010_sum.xckc018  = 0
   LET r_xcbb010_sum.xckc018a = 0
   LET r_xcbb010_sum.xckc018b = 0
   LET r_xcbb010_sum.xckc018c = 0
   LET r_xcbb010_sum.xckc018d = 0
   LET r_xcbb010_sum.xckc018e = 0
   LET r_xcbb010_sum.xckc018f = 0
   LET r_xcbb010_sum.xckc018g = 0
   LET r_xcbb010_sum.xckc018h = 0
   LET r_xcbb010_sum.xckc019  = 0
   LET r_xcbb010_sum.xckc019a = 0
   LET r_xcbb010_sum.xckc019b = 0
   LET r_xcbb010_sum.xckc019c = 0
   LET r_xcbb010_sum.xckc019d = 0
   LET r_xcbb010_sum.xckc019e = 0
   LET r_xcbb010_sum.xckc019f = 0
   LET r_xcbb010_sum.xckc019g = 0
   LET r_xcbb010_sum.xckc019h = 0
   LET r_xcbb010_sum.xckc020  = 0
   LET r_xcbb010_sum.xckc020a = 0
   LET r_xcbb010_sum.xckc020b = 0
   LET r_xcbb010_sum.xckc020c = 0
   LET r_xcbb010_sum.xckc020d = 0
   LET r_xcbb010_sum.xckc020e = 0
   LET r_xcbb010_sum.xckc020f = 0
   LET r_xcbb010_sum.xckc020g = 0
   LET r_xcbb010_sum.xckc020h = 0
   LET r_xcbb010_sum.xckc021  = 0
   LET r_xcbb010_sum.xckc021a = 0
   LET r_xcbb010_sum.xckc021b = 0
   LET r_xcbb010_sum.xckc021c = 0
   LET r_xcbb010_sum.xckc021d = 0
   LET r_xcbb010_sum.xckc021e = 0
   LET r_xcbb010_sum.xckc021f = 0
   LET r_xcbb010_sum.xckc021g = 0
   LET r_xcbb010_sum.xckc021h = 0
   LET r_xcbb010_sum.xckc022  = 0
   LET r_xcbb010_sum.xckc022a = 0
   LET r_xcbb010_sum.xckc022b = 0
   LET r_xcbb010_sum.xckc022c = 0
   LET r_xcbb010_sum.xckc022d = 0
   LET r_xcbb010_sum.xckc022e = 0
   LET r_xcbb010_sum.xckc022f = 0
   LET r_xcbb010_sum.xckc022g = 0
   LET r_xcbb010_sum.xckc022h = 0

   RETURN r_xcbb010_sum.*
END FUNCTION

#变量清0
PRIVATE FUNCTION axcq200_xckc_tot_to_0()
   DEFINE r_xckc_tot      RECORD   #总计
                          xckc007  LIKE xckc_t.xckc007, 
                          xckc008  LIKE xckc_t.xckc008, 
                          xckc008a LIKE xckc_t.xckc008a, 
                          xckc008b LIKE xckc_t.xckc008b, 
                          xckc008c LIKE xckc_t.xckc008c, 
                          xckc008d LIKE xckc_t.xckc008d, 
                          xckc008e LIKE xckc_t.xckc008e, 
                          xckc008f LIKE xckc_t.xckc008f, 
                          xckc008g LIKE xckc_t.xckc008g, 
                          xckc008h LIKE xckc_t.xckc008h, 
                          xckc009  LIKE xckc_t.xckc009, 
                          xckc010  LIKE xckc_t.xckc010, 
                          xckc010a LIKE xckc_t.xckc010a, 
                          xckc010b LIKE xckc_t.xckc010b, 
                          xckc010c LIKE xckc_t.xckc010c, 
                          xckc010d LIKE xckc_t.xckc010d, 
                          xckc010e LIKE xckc_t.xckc010e, 
                          xckc010f LIKE xckc_t.xckc010f, 
                          xckc010g LIKE xckc_t.xckc010g, 
                          xckc010h LIKE xckc_t.xckc010h, 
                          xckc011  LIKE xckc_t.xckc011, 
                          xckc012  LIKE xckc_t.xckc012, 
                          xckc012a LIKE xckc_t.xckc012a, 
                          xckc012b LIKE xckc_t.xckc012b, 
                          xckc012c LIKE xckc_t.xckc012c, 
                          xckc012d LIKE xckc_t.xckc012d, 
                          xckc012e LIKE xckc_t.xckc012e, 
                          xckc012f LIKE xckc_t.xckc012f, 
                          xckc012g LIKE xckc_t.xckc012g, 
                          xckc012h LIKE xckc_t.xckc012h, 
                          xckc013  LIKE xckc_t.xckc013, 
                          xckc014  LIKE xckc_t.xckc014, 
                          xckc014a LIKE xckc_t.xckc014a, 
                          xckc014b LIKE xckc_t.xckc014b, 
                          xckc014c LIKE xckc_t.xckc014c, 
                          xckc014d LIKE xckc_t.xckc014d, 
                          xckc014e LIKE xckc_t.xckc014e, 
                          xckc014f LIKE xckc_t.xckc014f, 
                          xckc014g LIKE xckc_t.xckc014g, 
                          xckc014h LIKE xckc_t.xckc014h,
                          xckc015  LIKE xckc_t.xckc015, 
                          xckc015a LIKE xckc_t.xckc015a, 
                          xckc015b LIKE xckc_t.xckc015b, 
                          xckc015c LIKE xckc_t.xckc015c, 
                          xckc015d LIKE xckc_t.xckc015d, 
                          xckc015e LIKE xckc_t.xckc015e, 
                          xckc015f LIKE xckc_t.xckc015f, 
                          xckc015g LIKE xckc_t.xckc015g, 
                          xckc015h LIKE xckc_t.xckc015h,
                          xckc016  LIKE xckc_t.xckc016, 
                          xckc016a LIKE xckc_t.xckc016a, 
                          xckc016b LIKE xckc_t.xckc016b, 
                          xckc016c LIKE xckc_t.xckc016c, 
                          xckc016d LIKE xckc_t.xckc016d, 
                          xckc016e LIKE xckc_t.xckc016e, 
                          xckc016f LIKE xckc_t.xckc016f, 
                          xckc016g LIKE xckc_t.xckc016g, 
                          xckc016h LIKE xckc_t.xckc016h,
                          xckc017  LIKE xckc_t.xckc017, 
                          xckc017a LIKE xckc_t.xckc017a, 
                          xckc017b LIKE xckc_t.xckc017b, 
                          xckc017c LIKE xckc_t.xckc017c, 
                          xckc017d LIKE xckc_t.xckc017d, 
                          xckc017e LIKE xckc_t.xckc017e, 
                          xckc017f LIKE xckc_t.xckc017f, 
                          xckc017g LIKE xckc_t.xckc017g, 
                          xckc017h LIKE xckc_t.xckc017h,
                          xckc018  LIKE xckc_t.xckc018, 
                          xckc018a LIKE xckc_t.xckc018a, 
                          xckc018b LIKE xckc_t.xckc018b, 
                          xckc018c LIKE xckc_t.xckc018c, 
                          xckc018d LIKE xckc_t.xckc018d, 
                          xckc018e LIKE xckc_t.xckc018e, 
                          xckc018f LIKE xckc_t.xckc018f, 
                          xckc018g LIKE xckc_t.xckc018g, 
                          xckc018h LIKE xckc_t.xckc018h,
                          xckc019  LIKE xckc_t.xckc019, 
                          xckc019a LIKE xckc_t.xckc019a, 
                          xckc019b LIKE xckc_t.xckc019b, 
                          xckc019c LIKE xckc_t.xckc019c, 
                          xckc019d LIKE xckc_t.xckc019d, 
                          xckc019e LIKE xckc_t.xckc019e, 
                          xckc019f LIKE xckc_t.xckc019f, 
                          xckc019g LIKE xckc_t.xckc019g, 
                          xckc019h LIKE xckc_t.xckc019h,
                          xckc020  LIKE xckc_t.xckc020, 
                          xckc020a LIKE xckc_t.xckc020a, 
                          xckc020b LIKE xckc_t.xckc020b, 
                          xckc020c LIKE xckc_t.xckc020c, 
                          xckc020d LIKE xckc_t.xckc020d, 
                          xckc020e LIKE xckc_t.xckc020e, 
                          xckc020f LIKE xckc_t.xckc020f, 
                          xckc020g LIKE xckc_t.xckc020g, 
                          xckc020h LIKE xckc_t.xckc020h,
                          xckc021  LIKE xckc_t.xckc021, 
                          xckc021a LIKE xckc_t.xckc021a, 
                          xckc021b LIKE xckc_t.xckc021b, 
                          xckc021c LIKE xckc_t.xckc021c, 
                          xckc021d LIKE xckc_t.xckc021d, 
                          xckc021e LIKE xckc_t.xckc021e, 
                          xckc021f LIKE xckc_t.xckc021f, 
                          xckc021g LIKE xckc_t.xckc021g, 
                          xckc021h LIKE xckc_t.xckc021h,
                          xckc022  LIKE xckc_t.xckc022, 
                          xckc022a LIKE xckc_t.xckc022a, 
                          xckc022b LIKE xckc_t.xckc022b, 
                          xckc022c LIKE xckc_t.xckc022c, 
                          xckc022d LIKE xckc_t.xckc022d, 
                          xckc022e LIKE xckc_t.xckc022e, 
                          xckc022f LIKE xckc_t.xckc022f, 
                          xckc022g LIKE xckc_t.xckc022g, 
                          xckc022h LIKE xckc_t.xckc022h
                          END RECORD

   LET r_xckc_tot.xckc007  = 0
   LET r_xckc_tot.xckc008  = 0
   LET r_xckc_tot.xckc008a = 0
   LET r_xckc_tot.xckc008b = 0
   LET r_xckc_tot.xckc008c = 0
   LET r_xckc_tot.xckc008d = 0
   LET r_xckc_tot.xckc008e = 0
   LET r_xckc_tot.xckc008f = 0
   LET r_xckc_tot.xckc008g = 0
   LET r_xckc_tot.xckc008h = 0
   LET r_xckc_tot.xckc009  = 0
   LET r_xckc_tot.xckc010  = 0
   LET r_xckc_tot.xckc010a = 0
   LET r_xckc_tot.xckc010b = 0
   LET r_xckc_tot.xckc010c = 0
   LET r_xckc_tot.xckc010d = 0
   LET r_xckc_tot.xckc010e = 0
   LET r_xckc_tot.xckc010f = 0
   LET r_xckc_tot.xckc010g = 0
   LET r_xckc_tot.xckc010h = 0
   LET r_xckc_tot.xckc011  = 0
   LET r_xckc_tot.xckc012  = 0
   LET r_xckc_tot.xckc012a = 0
   LET r_xckc_tot.xckc012b = 0
   LET r_xckc_tot.xckc012c = 0
   LET r_xckc_tot.xckc012d = 0
   LET r_xckc_tot.xckc012e = 0
   LET r_xckc_tot.xckc012f = 0
   LET r_xckc_tot.xckc012g = 0
   LET r_xckc_tot.xckc012h = 0
   LET r_xckc_tot.xckc013  = 0
   LET r_xckc_tot.xckc014  = 0
   LET r_xckc_tot.xckc014a = 0
   LET r_xckc_tot.xckc014b = 0
   LET r_xckc_tot.xckc014c = 0
   LET r_xckc_tot.xckc014d = 0
   LET r_xckc_tot.xckc014e = 0
   LET r_xckc_tot.xckc014f = 0
   LET r_xckc_tot.xckc014g = 0
   LET r_xckc_tot.xckc014h = 0
   LET r_xckc_tot.xckc015  = 0
   LET r_xckc_tot.xckc015a = 0
   LET r_xckc_tot.xckc015b = 0
   LET r_xckc_tot.xckc015c = 0
   LET r_xckc_tot.xckc015d = 0
   LET r_xckc_tot.xckc015e = 0
   LET r_xckc_tot.xckc015f = 0
   LET r_xckc_tot.xckc015g = 0
   LET r_xckc_tot.xckc015h = 0
   LET r_xckc_tot.xckc016  = 0
   LET r_xckc_tot.xckc016a = 0
   LET r_xckc_tot.xckc016b = 0
   LET r_xckc_tot.xckc016c = 0
   LET r_xckc_tot.xckc016d = 0
   LET r_xckc_tot.xckc016e = 0
   LET r_xckc_tot.xckc016f = 0
   LET r_xckc_tot.xckc016g = 0
   LET r_xckc_tot.xckc016h = 0
   LET r_xckc_tot.xckc017  = 0
   LET r_xckc_tot.xckc017a = 0
   LET r_xckc_tot.xckc017b = 0
   LET r_xckc_tot.xckc017c = 0
   LET r_xckc_tot.xckc017d = 0
   LET r_xckc_tot.xckc017e = 0
   LET r_xckc_tot.xckc017f = 0
   LET r_xckc_tot.xckc017g = 0
   LET r_xckc_tot.xckc017h = 0
   LET r_xckc_tot.xckc018  = 0
   LET r_xckc_tot.xckc018a = 0
   LET r_xckc_tot.xckc018b = 0
   LET r_xckc_tot.xckc018c = 0
   LET r_xckc_tot.xckc018d = 0
   LET r_xckc_tot.xckc018e = 0
   LET r_xckc_tot.xckc018f = 0
   LET r_xckc_tot.xckc018g = 0
   LET r_xckc_tot.xckc018h = 0
   LET r_xckc_tot.xckc019  = 0
   LET r_xckc_tot.xckc019a = 0
   LET r_xckc_tot.xckc019b = 0
   LET r_xckc_tot.xckc019c = 0
   LET r_xckc_tot.xckc019d = 0
   LET r_xckc_tot.xckc019e = 0
   LET r_xckc_tot.xckc019f = 0
   LET r_xckc_tot.xckc019g = 0
   LET r_xckc_tot.xckc019h = 0
   LET r_xckc_tot.xckc020  = 0
   LET r_xckc_tot.xckc020a = 0
   LET r_xckc_tot.xckc020b = 0
   LET r_xckc_tot.xckc020c = 0
   LET r_xckc_tot.xckc020d = 0
   LET r_xckc_tot.xckc020e = 0
   LET r_xckc_tot.xckc020f = 0
   LET r_xckc_tot.xckc020g = 0
   LET r_xckc_tot.xckc020h = 0
   LET r_xckc_tot.xckc021  = 0
   LET r_xckc_tot.xckc021a = 0
   LET r_xckc_tot.xckc021b = 0
   LET r_xckc_tot.xckc021c = 0
   LET r_xckc_tot.xckc021d = 0
   LET r_xckc_tot.xckc021e = 0
   LET r_xckc_tot.xckc021f = 0
   LET r_xckc_tot.xckc021g = 0
   LET r_xckc_tot.xckc021h = 0
   LET r_xckc_tot.xckc022  = 0
   LET r_xckc_tot.xckc022a = 0
   LET r_xckc_tot.xckc022b = 0
   LET r_xckc_tot.xckc022c = 0
   LET r_xckc_tot.xckc022d = 0
   LET r_xckc_tot.xckc022e = 0
   LET r_xckc_tot.xckc022f = 0
   LET r_xckc_tot.xckc022g = 0
   LET r_xckc_tot.xckc022h = 0
   
   RETURN r_xckc_tot.*

END FUNCTION

################################################################################
# Descriptions...: #+ filter過濾功能
# Memo...........:
# Usage..........: CALL axcq212_filter()
# Input parameter: 
# Return code....: 
# Date & Author..: 20170619 By 09256 (#170310-00068#3)
# Modify.........:
################################################################################
PRIVATE FUNCTION axcq200_filter()
DEFINE  ls_result   STRING

   LET l_ac = 1
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter
   LET g_wc_t = g_wc
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      #190329-00026#1   mark-S
#      CONSTRUCT g_wc_filter ON xckb009
#                              
#           FROM s_detail1[1].b_xckb009
      #190329-00026#1   mark-E
      #190329-00026#1   add-S
      CONSTRUCT g_wc_filter ON xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb036,xmdk001,xckb009,xckc005,xckb010,xckb011,xckb012,
                               xckb037,xckb013,xckb014,xckb015,xckb016,xckb017,xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,
                               xckb102f,xckb102g,xckb102h,xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h
                              
           FROM s_detail1[1].b_xckb001_1,s_detail1[1].b_xckb002_1,s_detail1[1].b_xckb003,s_detail1[1].b_xckb004,s_detail1[1].b_xckb005,
                s_detail1[1].b_xckb006,s_detail1[1].b_xckb036,s_detail1[1].b_xmdk001_1,s_detail1[1].b_xckb009,s_detail1[1].b_xckc005,
                s_detail1[1].b_xckb010,s_detail1[1].b_xckb011,s_detail1[1].b_xckb012,s_detail1[1].b_xckb037,s_detail1[1].b_xckb013,
                s_detail1[1].b_xckb014,s_detail1[1].b_xckb015,s_detail1[1].b_xckb016,s_detail1[1].b_xckb017,s_detail1[1].b_xckb102,
                s_detail1[1].b_xckb102a,s_detail1[1].b_xckb102b,s_detail1[1].b_xckb102c,s_detail1[1].b_xckb102d,s_detail1[1].b_xckb102e,
                s_detail1[1].b_xckb102f,s_detail1[1].b_xckb102g,s_detail1[1].b_xckb102h,s_detail1[1].b_xckb101,s_detail1[1].b_xckb101a,
                s_detail1[1].b_xckb101b,s_detail1[1].b_xckb101c,s_detail1[1].b_xckb101d,s_detail1[1].b_xckb101e,s_detail1[1].b_xckb101f,
                s_detail1[1].b_xckb101g,s_detail1[1].b_xckb101h
      #190329-00026#1   add-E      
               
 
         BEFORE CONSTRUCT         
            DISPLAY axcq200_filter_parser('xckb009') TO s_detail1[1].b_xckb009
            #190329-00026#1   add-S
            DISPLAY axcq200_filter_parser('xckb001') TO s_detail1[1].b_xckb001_1
            DISPLAY axcq200_filter_parser('xckb002') TO s_detail1[1].b_xckb002_1
            DISPLAY axcq200_filter_parser('xckb003') TO s_detail1[1].b_xckb003
            DISPLAY axcq200_filter_parser('xckb004') TO s_detail1[1].b_xckb004
            DISPLAY axcq200_filter_parser('xckb005') TO s_detail1[1].b_xckb005
            DISPLAY axcq200_filter_parser('xckb006') TO s_detail1[1].b_xckb006
            DISPLAY axcq200_filter_parser('xckb036') TO s_detail1[1].b_xckb036
            DISPLAY axcq200_filter_parser('xmdk001') TO s_detail1[1].b_xmdk001_1
            DISPLAY axcq200_filter_parser('xckc005') TO s_detail1[1].b_xckc005
            DISPLAY axcq200_filter_parser('xckb010') TO s_detail1[1].b_xckb010
            DISPLAY axcq200_filter_parser('xckb011') TO s_detail1[1].b_xckb011
            DISPLAY axcq200_filter_parser('xckb012') TO s_detail1[1].b_xckb012
            DISPLAY axcq200_filter_parser('xckb037') TO s_detail1[1].b_xckb037
            DISPLAY axcq200_filter_parser('xckb013') TO s_detail1[1].b_xckb013
            DISPLAY axcq200_filter_parser('xckb014') TO s_detail1[1].b_xckb014
            DISPLAY axcq200_filter_parser('xckb015') TO s_detail1[1].b_xckb015
            DISPLAY axcq200_filter_parser('xckb016') TO s_detail1[1].b_xckb016
            DISPLAY axcq200_filter_parser('xckb017') TO s_detail1[1].b_xckb017
            DISPLAY axcq200_filter_parser('xckb102') TO s_detail1[1].b_xckb102
            DISPLAY axcq200_filter_parser('xckb102a') TO s_detail1[1].b_xckb102a
            DISPLAY axcq200_filter_parser('xckb102b') TO s_detail1[1].b_xckb102b
            DISPLAY axcq200_filter_parser('xckb102c') TO s_detail1[1].b_xckb102c
            DISPLAY axcq200_filter_parser('xckb102d') TO s_detail1[1].b_xckb102d
            DISPLAY axcq200_filter_parser('xckb102e') TO s_detail1[1].b_xckb102e
            DISPLAY axcq200_filter_parser('xckb102f') TO s_detail1[1].b_xckb102f
            DISPLAY axcq200_filter_parser('xckb102g') TO s_detail1[1].b_xckb102g
            DISPLAY axcq200_filter_parser('xckb102h') TO s_detail1[1].b_xckb102h
            DISPLAY axcq200_filter_parser('xckb101') TO s_detail1[1].b_xckb101
            DISPLAY axcq200_filter_parser('xckb101a') TO s_detail1[1].b_xckb101a
            DISPLAY axcq200_filter_parser('xckb101b') TO s_detail1[1].b_xckb101b
            DISPLAY axcq200_filter_parser('xckb101c') TO s_detail1[1].b_xckb101c
            DISPLAY axcq200_filter_parser('xckb101d') TO s_detail1[1].b_xckb101d
            DISPLAY axcq200_filter_parser('xckb101e') TO s_detail1[1].b_xckb101e
            DISPLAY axcq200_filter_parser('xckb101f') TO s_detail1[1].b_xckb101f
            DISPLAY axcq200_filter_parser('xckb101g') TO s_detail1[1].b_xckb101g
            DISPLAY axcq200_filter_parser('xckb101h') TO s_detail1[1].b_xckb101h
            #190329-00026#1   add-E

 
         #單身公用欄位開窗相關處理
         
           
         #單身一般欄位開窗相關處理
       ON ACTION controlp INFIELD b_xckb009   #客户编号
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_pmaa001_7()                            
               DISPLAY g_qryparam.return1 TO b_xckb009  #顯示到畫面上
               NEXT FIELD b_xckb009                     #返回原欄位
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb009           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
            
       #190329-00026#1   add-S
       ON ACTION controlp INFIELD b_xckb004   #据点 
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_ooef001()
               DISPLAY g_qryparam.return1 TO b_xckb004  #顯示到畫面上
               NEXT FIELD b_xckb004                     #返回原欄位  
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb004           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
      
       ON ACTION controlp INFIELD b_xckb005   #单据编号
                #開窗c段
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_xckb005()
                DISPLAY g_qryparam.return1 TO b_xckb005  #顯示到畫面上
                NEXT FIELD b_xckb005                     #返回原欄位  
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb005           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
                
       ON ACTION controlp INFIELD b_xckb010   #人员编号  
                #開窗c段
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_ooag001()
                DISPLAY g_qryparam.return1 TO b_xckb010  #顯示到畫面上
                NEXT FIELD b_xckb010                     #返回原欄位 
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb010           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
                
       ON ACTION controlp INFIELD b_xckb011   #部门编号
                #開窗c段
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_ooeg001()
                DISPLAY g_qryparam.return1 TO b_xckb011  #顯示到畫面上
                NEXT FIELD b_xckb011                     #返回原欄位 
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb011           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
       
       ON ACTION controlp INFIELD b_xckb012   #产品编号
                #開窗c段
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_imaa001()
                DISPLAY g_qryparam.return1 TO b_xckb012  #顯示到畫面上
                NEXT FIELD b_xckb012                     #返回原欄位 
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb012           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
      
       ON ACTION controlp INFIELD b_xckb037   #特性
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_xcck011()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO b_xckb037    #顯示到畫面上
               NEXT FIELD b_xckb037                       #返回原欄位
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb037           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 

       ON ACTION controlp INFIELD b_xckb013   #基础单位
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_ooca001_1()                       
                DISPLAY g_qryparam.return1 TO xckb013  #顯示到畫面上
                NEXT FIELD b_xckb013                   #返回原欄位 
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb013           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
              
       ON ACTION controlp INFIELD b_xckb015   #库位编号
                #開窗c段
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_inaa001_2()
                DISPLAY g_qryparam.return1 TO b_xckb015  #顯示到畫面上
                NEXT FIELD b_xckb015                     #返回原欄位 
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb015           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
       
        
       ON ACTION controlp INFIELD b_xckb016   #储位编号
                #開窗c段
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_inab002_2()
                DISPLAY g_qryparam.return1 TO b_xckb016  #顯示到畫面上
                NEXT FIELD b_xckb016                     #返回原欄位          
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb016           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
            #201109-00009#92---add---(E) 
       
       ON ACTION controlp INFIELD b_xckb017   #批号
                #開窗c段
                INITIALIZE g_qryparam.* TO NULL
                LET g_qryparam.state = 'c'
                LET g_qryparam.reqry = FALSE
                CALL q_inag006()
                DISPLAY g_qryparam.return1 TO b_xckb017  #顯示到畫面上
                NEXT FIELD b_xckb017                     #返回原欄位   
       #190329-00026#1   add-E
            #201109-00009#92---add---(S)         
            AFTER FIELD b_xckb017           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF
               
            AFTER FIELD b_xckb003           
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  LET ls_result = cl_ap_code_fuzzyquery(ls_result)   #模糊查詢功能
                  CALL FGL_DIALOG_SETBUFFER(ls_result)
               END IF               
            #201109-00009#92---add---(E) 
 
      END CONSTRUCT
 
      #add-point:filter段add_cs

      #end add-point
 
      BEFORE DIALOG
         #add-point:filter段b_dialog

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
      LET g_wc_filter = g_wc_filter, " "
      LET g_wc_filter_t = g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
   END IF
   
   CALL axcq200_filter_show('xckb009','b_xckb009') 
   #190329-00026#1   add-S 
   CALL axcq200_filter_show('xckb001','b_xckb001_1')
   CALL axcq200_filter_show('xckb002','b_xckb002_1')
   CALL axcq200_filter_show('xckb003','b_xckb003')
   CALL axcq200_filter_show('xckb004','b_xckb004')
   CALL axcq200_filter_show('xckb005','b_xckb005')
   CALL axcq200_filter_show('xckb006','b_xckb006')
   CALL axcq200_filter_show('xckb036','b_xckb036')
   CALL axcq200_filter_show('xmdk001','b_xmdk001_1')
   CALL axcq200_filter_show('xckc005','b_xckc005')
   CALL axcq200_filter_show('xckb010','b_xckb010')
   CALL axcq200_filter_show('xckb011','b_xckb011')
   CALL axcq200_filter_show('xckb012','b_xckb012')
   CALL axcq200_filter_show('xckb037','b_xckb037')
   CALL axcq200_filter_show('xckb013','b_xckb013')
   CALL axcq200_filter_show('xckb014','b_xckb014')
   CALL axcq200_filter_show('xckb015','b_xckb015')
   CALL axcq200_filter_show('xckb016','b_xckb016')
   CALL axcq200_filter_show('xckb017','b_xckb017')
   CALL axcq200_filter_show('xckb0102','b_xckb0102')
   CALL axcq200_filter_show('xckb0102a','b_xckb0102a')
   CALL axcq200_filter_show('xckb0102b','b_xckb0102b')
   CALL axcq200_filter_show('xckb0102c','b_xckb0102c')
   CALL axcq200_filter_show('xckb0102d','b_xckb0102d')
   CALL axcq200_filter_show('xckb0102e','b_xckb0102e')
   CALL axcq200_filter_show('xckb0102f','b_xckb0102f')
   CALL axcq200_filter_show('xckb0102g','b_xckb0102g')
   CALL axcq200_filter_show('xckb0102h','b_xckb0102h')
   CALL axcq200_filter_show('xckb0101','b_xckb0101')
   CALL axcq200_filter_show('xckb0101a','b_xckb0101a')
   CALL axcq200_filter_show('xckb0101b','b_xckb0101b')
   CALL axcq200_filter_show('xckb0101c','b_xckb0101c')
   CALL axcq200_filter_show('xckb0101d','b_xckb0101d')
   CALL axcq200_filter_show('xckb0101e','b_xckb0101e')
   CALL axcq200_filter_show('xckb0101f','b_xckb0101f')
   CALL axcq200_filter_show('xckb0101g','b_xckb0101g')
   CALL axcq200_filter_show('xckb0101h','b_xckb0101h')
   #190329-00026#1   add-E
 
 
    
    
   CALL axcq200_b_fill()

   IF g_detail.getLength() = 0 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
   END IF
   
   LET g_wc = g_wc_t
   INITIALIZE g_wc_filter TO NULL  #190624-00019#1 add
   
   CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
   CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
END FUNCTION

################################################################################
# Descriptions...: #+ Browser標題欄位顯示搜尋條件
# Memo...........:
# Usage..........: CALL axcq212_filter_show(ps_field,ps_object)
# Input parameter: 
# Return code....: 
# Date & Author..: 2017/6/19 By 09256(#170310-00068#3)
# Modify.........:
################################################################################
PRIVATE FUNCTION axcq200_filter_show(ps_field,ps_object)
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
   LET ls_condition = axcq200_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
END FUNCTION

################################################################################
# Descriptions...: #+ filter欄位解析
# Memo...........:
# Usage..........: CALL axcq212_filter_parser(ps_field)
# Input parameter: 
# Return code....: 
# Date & Author..: 2017/06/19 By 09256(#170310-00068#3)
# Modify.........:
################################################################################
PRIVATE FUNCTION axcq200_filter_parser(ps_field)
DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num5
   DEFINE li_tmp2    LIKE type_t.num5
   DEFINE ls_var     STRING
   
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

################################################################################
# Descriptions...: axcq200_ui_dialog()重写
# Modify.........:181129-00060#1 By 11384
################################################################################
PRIVATE FUNCTION axcq200_ui_dialog1()
   DEFINE li_exit   LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx    LIKE type_t.num10
   DEFINE ls_result STRING
   DEFINE la_param  RECORD
                    prog       STRING,
                    actionid   STRING,
                    background LIKE type_t.chr1,
                    param      DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE ls_wc     STRING
   DEFINE lc_action_choice_old    STRING
   #(ver:36) ---add start---
   DEFINE l_arr_len       INTEGER
   DEFINE l_arr_cnt       INTEGER
   DEFINE lb_get_type     LIKE type_t.chr20
   #(ver:36) --- add end ---
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_xcbk001  LIKE xcbk_t.xcbk001 #无用
   DEFINE l_cs_comp  STRING   #190628-00043#3 add
   DEFINE lp_str     STRING   #201109-00009#10 add 
   #end add-point
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"

   #end add-point
 
   CLEAR FORM  
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
 
   LET li_exit = FALSE
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   LET g_current_idx = 1
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   LET g_current_row_tot = 0
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   LET g_master_row_move = "Y"
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   LET l_ac = 1
 
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   LET g_action_choice = "log"                    #180320-00047#2 add
   IF cl_null(tm.ca) THEN
      LET tm.ca = '3'
   END IF
   IF cl_null(g_wc) OR g_wc=" 1=1" OR g_wc=" 1=2"  THEN
      #预设当前site的法人，主账套，年度期别，#成本计算类型
      CALL s_axc_set_site_default() RETURNING tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008,l_xcbk001
   END IF
   #end add-point
 
   
 
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      CALL axcq200_cs()
   END IF
 
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         INITIALIZE g_master.* TO NULL
         CALL g_detail.clear()
         CALL g_detail2.clear()
 
         CALL g_detail3.clear()
 
         CALL g_detail4.clear()
 
         CALL g_detail5.clear()
 
         CALL g_detail6.clear()
 
         CALL g_detail7.clear()
 
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 0
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_master_row_move = "Y"
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL axcq200_init()
      END IF
 
      #190108-00038 ---start---
      
      #190108-00038 --- end ---
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
         INPUT BY NAME tm.ca
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            ON CHANGE ca
               #CALL cl_set_comp_visible('b_xckc003,b_xckc003_desc,b_xckc004,b_xckc004_desc,b_xckc004_desc2,b_xckc023,b_xckc023_desc,b_xckc006,b_xckc007,b_xckc009,b_xckc011,b_xckc013',TRUE)
               #CASE tm.ca
               #   WHEN '1'  #客户
               #        CALL cl_set_comp_visible('b_xckc004,b_xckc004_desc,b_xckc004_desc2,b_xckc023,b_xckc023_desc,b_xckc006,b_xckc007,b_xckc009,b_xckc011,b_xckc013',FALSE)
               #   WHEN '2'  #产品
               #        CALL cl_set_comp_visible('b_xckc003,b_xckc003_desc',FALSE)
               #   WHEN '3'  #客户+产品
               #        #无
               #END CASE
         END INPUT
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
         CONSTRUCT BY NAME g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckc005,xckb001,xckb002,xckb004,xckb005                                            #190628-00043#3 add xckb005
        #CONSTRUCT BY NAME g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckc005,xckb001,xckb002,xckb004  #170323-00073#1 add #180428-00018#1 add xckb004   #190628-00043#3 mark
         #CONSTRUCT BY NAME g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckc005    #160706-00021#1   #170323-00073#1 mark
         #CONSTRUCT g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037
         #     FROM b_xckbcomp,b_xckbld,b_xckb007,b_xckb008,
         #          s_detail1[1].b_xckb009,s_detail1[1].b_xckb012,s_detail1[1].b_xckb037          
            BEFORE CONSTRUCT
               #160921-00010#1 add(s)
               IF cl_null(g_wc) OR g_wc=" 1=1" OR g_wc=" 1=2"  THEN
                  #预设当前site的法人，主账套，年度期别，#成本计算类型
                  CALL s_axc_set_site_default() RETURNING tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008,l_xcbk001
               END IF
               #160921-00010#1 add(e)
               DISPLAY BY NAME tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008
               #DISPLAY tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008 TO b_xckbcomp,xckbld,b_xckb007,b_xckb008
            
            AFTER FIELD xckbcomp
               LET tm.xckbcomp= GET_FLDBUF(xckbcomp)
               LET g_xckbcompstr = GET_FLDBUF(xckbcomp)   #190628-00043#3 add 
               #201109-00009#10---add---(S)              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckbcomp
               END IF
               #201109-00009#10---add---(E)
               
            AFTER FIELD xckbld
               LET tm.xckbld  = GET_FLDBUF(xckbld)
               #201109-00009#10---add---(S)              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckbld
               END IF
               #201109-00009#10---add---(E)  
               
            AFTER FIELD xckb007
               LET tm.xckb007 = GET_FLDBUF(xckb007)
               
            AFTER FIELD xckb008
               LET tm.xckb008 = GET_FLDBUF(xckb008)
               
            ON ACTION controlp INFIELD xckbcomp   #法人
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #add--160802-00020#7 By shiun--(S)
      	      #增加法人過濾條件
               IF NOT cl_null(g_wc_cs_comp) THEN
                  LET g_qryparam.where = " ooef001 IN ",g_wc_cs_comp
               END IF
               #add--160802-00020#7 By shiun--(S)
               CALL q_ooef001_2()                #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckbcomp  #顯示到畫面上
               NEXT FIELD xckbcomp              #返回原欄位
            
            
            ON ACTION controlp INFIELD xckbld   #账别
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = g_user
               LET g_qryparam.arg2 = g_dept
               #add--160802-00020#7 By shiun--(S)
               #增加帳套權限控制
               IF NOT cl_null(g_wc_cs_ld) THEN
                  LET g_qryparam.where = " glaald IN ",g_wc_cs_ld
               END IF
               #add--160802-00020#7 By shiun--(S)
               CALL q_authorised_ld()                #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckbld  #顯示到畫面上
               NEXT FIELD xckbld                     #返回原欄位
            
            ON ACTION controlp INFIELD xckb009   #客户编号
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_pmaa001_7()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb009  #顯示到畫面上
               NEXT FIELD xckb009                     #返回原欄位
            #201109-00009#10---add---(S)
            AFTER FIELD xckb009              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckb009
               END IF
            #201109-00009#10---add---(E)
            
            ON ACTION controlp INFIELD xckb012   #产品编号
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_imaa001()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb012  #顯示到畫面上
               NEXT FIELD xckb012                     #返回原欄位
            #201109-00009#10---add---(S)
            AFTER FIELD xckb012              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckb012
               END IF
            #201109-00009#10---add---(E) 
            
            #181128-00016#1 add-->s
            ON ACTION controlp INFIELD xckb037
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_xcck011()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb037  #顯示到畫面上
               NEXT FIELD xckb037                     #返回原欄位
            #181128-00016#1 add-->e
            #201109-00009#10---add---(S)
            AFTER FIELD xckb037              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckb037
               END IF
            #201109-00009#10---add---(E)
            
            #160706-00021#1
            ON ACTION controlp INFIELD xckc005
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL aglt310_04()
               DISPLAY g_qryparam.return1 TO xckc005  #顯示到畫面上
               NEXT FIELD xckc005                     #返回原欄位
            #160706-00021#1
            #201109-00009#10---add---(S)
            AFTER FIELD xckc005              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckc005
               END IF
            #201109-00009#10---add---(E)
            
            #180428-00018#1---add---s
            ON ACTION controlp INFIELD xckb004
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_ooef001()
               DISPLAY g_qryparam.return1 TO xckb004  #顯示到畫面上
               NEXT FIELD xckb004                     #返回原欄位            
            #180428-00018#1---add---e
            #201109-00009#10---add---(S)
            AFTER FIELD xckb004              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckb004
               END IF
            #201109-00009#10---add---(E) 
            
            #190628-00043#3 add --(S)--
            ON ACTION controlp INFIELD xckb005
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #增加法人過濾條件
               IF NOT cl_null(g_xckbcompstr) THEN
                  CALL axcq200_get_key_value(g_xckbcompstr) RETURNING l_cs_comp
                  IF NOT cl_null(l_cs_comp) THEN
                     LET g_qryparam.where = " xckbcomp IN ",l_cs_comp
                  END IF
               ELSE
                  IF NOT cl_null(g_wc_cs_comp) THEN
                     LET g_qryparam.where = " xckbcomp IN ",g_wc_cs_comp
                  END IF
               END IF   
               CALL q_xckb005()
               DISPLAY g_qryparam.return1 TO xckb005  #顯示到畫面上
               NEXT FIELD xckb005  
            #190628-00043#3 add --(E)--
            #201109-00009#10---add---(S)
            AFTER FIELD xckb005              
               CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
               IF NOT cl_null(lp_str) THEN
                  LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
                  DISPLAY lp_str TO xckb005
               END IF
            #201109-00009#10---add---(E)            
         END CONSTRUCT
         #end add-point
     
         DISPLAY ARRAY g_detail TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
               CALL axcq200_detail_action_trans()   #(ver:34)
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
            #  CALL axcq200_detail_action_trans()   #(ver:34) mark
               LET g_master_idx = l_ac
               CALL axcq200_b_fill2()
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body.before_row"

               #end add-point
 
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"

            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail2 TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 2
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body2.before_row"

               #end add-point
 
            #自訂ACTION(detail_show,page_2)
            
 
            #add-point:page2自定義行為 name="ui_dialog.body2.action"

            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail3 TO s_detail3.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 3
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body3.before_row"

               #end add-point
 
            #自訂ACTION(detail_show,page_3)
            
 
            #add-point:page3自定義行為 name="ui_dialog.body3.action"

            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail4 TO s_detail4.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 4
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail4")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body4.before_row"

               #end add-point
 
            #自訂ACTION(detail_show,page_4)
            
 
            #add-point:page4自定義行為 name="ui_dialog.body4.action"

            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail5 TO s_detail5.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 5
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail5")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body5.before_row"

               #end add-point
 
            #自訂ACTION(detail_show,page_5)
            
 
            #add-point:page5自定義行為 name="ui_dialog.body5.action"

            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail6 TO s_detail6.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 6
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail6")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body6.before_row"

               #end add-point
 
            #自訂ACTION(detail_show,page_6)
            
 
            #add-point:page6自定義行為 name="ui_dialog.body6.action"

            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail7 TO s_detail7.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 7
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail7")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
            #  DISPLAY g_detail_idx2 TO FORMONLY.idx
               CALL axcq200_detail_action_trans()   #(ver:34)
 
               #add-point:input段before row name="input.body7.before_row"

               #end add-point
 
            #自訂ACTION(detail_show,page_7)
            
 
            #add-point:page7自定義行為 name="ui_dialog.body7.action"

            #end add-point
 
         END DISPLAY
 
 
 
         #add-point:ui_dialog段define name="ui_dialog.more_displayarray"

         #end add-point
    
         BEFORE DIALOG
            CALL cl_ap_code_set_action() #171110-00013#1
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_page = 1   #(ver:34)
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            CALL axcq200_fetch('')
            CALL axcq200_detail_action_trans()   #(ver:34)
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            #180320-00047#2   add-S
            IF cl_null(g_action_choice) THEN
               INITIALIZE g_master.* TO NULL
               LET g_wc  = " 1=2"
               DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
            END IF
            #180320-00047#2   add-E
            #170310-00068#3-s add
            #增加二次查詢功能
            ON ACTION filter
               LET g_action_choice="filter"
               CALL axcq200_filter()
            #170310-00068#3-e add
            #end add-point
            NEXT FIELD xckbcomp
 
         AFTER DIALOG
            #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
            
            #end add-point
            
         ON ACTION exit
            LET g_action_choice="exit"
            LET INT_FLAG = FALSE
            LET li_exit = TRUE
            EXIT DIALOG 
      
         ON ACTION close
            LET INT_FLAG=FALSE
            LET li_exit = TRUE
            EXIT DIALOG
 
         ON ACTION accept
         #  INITIALIZE g_wc_filter TO NULL   #171117-00042 mark
            IF cl_null(g_wc) THEN
               LET g_wc = " 1=1"
            END IF
 
 
   
            IF cl_null(g_wc2) THEN
               LET g_wc2 = " 1=1"
            END IF
 
 
 
            #add-point:ON ACTION accept name="ui_dialog.accept"
            IF g_qbe_hidden_t != 8 AND g_qbe_hidden_t != g_qbe_hidden THEN  #原隐藏变成显示，现在还原隐藏
               CALL gfrm_curr.setElementHidden("qbe",1)
               CALL gfrm_curr.setElementImage("qbehidden","16/worksheethidden.png")
               LET g_qbe_hidden = 1     #hidden
            END IF
            LET g_qbe_hidden_t = 8  #相当于清空的意思，清空还是0不好判断，就用了个8
            
            #170323-00073#1 add(S)
            LET tm.xckb001 = GET_FLDBUF(xckb001) 
            LET g_xckb001=tm.xckb001

            LET tm.xckb002 = GET_FLDBUF(xckb002) 
            LET g_xckb002=tm.xckb002
            #170323-00073#1 add(E)
            #end add-point
 
            CALL axcq200_cs()
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"

            #end add-point
            CALL cl_user_overview()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #(ver:36) ---start---
               #因應匯出excel規則調整，需同時符合新舊做法
               LET lb_get_type = cl_get_exporttoexcel_type()
               #add-point:ON ACTION exporttoexcel name="ui_dialog.exporttoexcel_type_change"

               #END add-point
               DISPLAY "lb_get_type:",lb_get_type
 
               CASE
                  WHEN lb_get_type = "poi"   #使用poi樣板
                     CALL g_export_node.clear()
                     LET l_arr_len = g_detail.getLength()
                     LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[1] = "s_detail1"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[1][l_arr_cnt] = g_detail[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail2.getLength()
                     LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[2] = "s_detail2"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[2][l_arr_cnt] = g_detail2[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail3.getLength()
                     LET g_export_tag[3] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[3] = "s_detail3"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[3][l_arr_cnt] = g_detail3[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail4.getLength()
                     LET g_export_tag[4] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[4] = "s_detail4"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[4][l_arr_cnt] = g_detail4[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail5.getLength()
                     LET g_export_tag[5] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[5] = "s_detail5"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[5][l_arr_cnt] = g_detail5[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail6.getLength()
                     LET g_export_tag[6] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[6] = "s_detail6"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[6][l_arr_cnt] = g_detail6[l_arr_cnt]
                     END FOR
 
                     LET l_arr_len = g_detail7.getLength()
                     LET g_export_tag[7] = rec_arr_type.create(l_arr_len)
                     LET g_export_tabname[7] = "s_detail7"
                     FOR l_arr_cnt = 1 TO l_arr_len
                        LET g_export_tag[7][l_arr_cnt] = g_detail7[l_arr_cnt]
                     END FOR
 
 
                     
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_poi"

                     #end add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_poi()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after_poi"

                     #end add-point
 
                  OTHERWISE   #使用原始樣板
               #(ver:36) --- end ---
                     CALL g_export_node.clear()
                     LET g_export_node[1] = base.typeInfo.create(g_detail)
                     LET g_export_id[1]   = "s_detail1"
                     LET g_export_node[2] = base.typeInfo.create(g_detail2)
                     LET g_export_id[2]   = "s_detail2"
 
                     LET g_export_node[3] = base.typeInfo.create(g_detail3)
                     LET g_export_id[3]   = "s_detail3"
 
                     LET g_export_node[4] = base.typeInfo.create(g_detail4)
                     LET g_export_id[4]   = "s_detail4"
 
                     LET g_export_node[5] = base.typeInfo.create(g_detail5)
                     LET g_export_id[5]   = "s_detail5"
 
                     LET g_export_node[6] = base.typeInfo.create(g_detail6)
                     LET g_export_id[6]   = "s_detail6"
 
                     LET g_export_node[7] = base.typeInfo.create(g_detail7)
                     LET g_export_id[7]   = "s_detail7"
 
 
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"

                     #end add-point
                     CALL cl_export_to_excel_getpage()
                     CALL cl_export_to_excel()
                     #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel_after"   #(ver:33)

                     #end add-point
               END CASE   #(ver:36) add
            END IF
 
 
         ON ACTION datarefresh   # 重新整理
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('F')
            LET g_action_choice = lc_action_choice_old
 
         #190322-00021#1   add-S
         ON ACTION first   # 第一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('F')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION previous   # 上一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('P')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION jump   # 跳至第幾筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('/')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION next   # 下一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('N')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION last   # 最後一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL axcq200_fetch('L')
            LET g_action_choice = lc_action_choice_old
         #190322-00021#1   add-E
         
         ON ACTION qbehidden     #qbe頁籤折疊
            IF g_qbe_hidden THEN
               CALL gfrm_curr.setElementHidden("qbe",0)
               CALL gfrm_curr.setElementImage("qbehidden","16/mainhidden.png")
               LET g_qbe_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("qbe",1)
               CALL gfrm_curr.setElementImage("qbehidden","16/worksheethidden.png")
               LET g_qbe_hidden = 1     #hidden
            END IF
 
         ON ACTION datainfo   #串查至主維護程式
            #add-point:ON ACTION datainfo name="ui_dialog.datainfo"

            #end add-point
            CALL axcq200_maintain_prog()
 
 
         #190108-00038 ---start---
         
         #190108-00038 --- end ---
 
         
         
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               
               #add-point:ON ACTION insert name="menu.insert"

               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               
               #add-point:ON ACTION query name="menu.query"
               LET g_qbe_hidden_t = g_qbe_hidden   #旧值备份
               IF g_qbe_hidden_t THEN  #隐藏
                  CALL gfrm_curr.setElementHidden("qbe",0)
                  CALL gfrm_curr.setElementImage("qbehidden","16/mainhidden.png")
                  LET g_qbe_hidden = 0     #visible
               END IF
               #END add-point
               
               
            END IF
 
 
 
 
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"

         #end add-point
 
         ON ACTION qbeclear   # 條件清除
            CLEAR FORM
            #add-point:條件清除後 name="ui_dialog.qbeclear"
            #单头不清除，只应清除左边查询段
            DISPLAY g_master.xckbcomp      TO  b_xckbcomp
            DISPLAY g_master.xckbld        TO  b_xckbld
            DISPLAY g_master.xckb007       TO  b_xckb007
            DISPLAY g_master.xckb008       TO  b_xckb008
            DISPLAY g_master.xckbcomp_desc TO xckbcomp_desc
            DISPLAY g_master.xckbld_desc   TO xckbld_desc
            #end add-point 
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"

         #end add-point 
 
      END DIALOG 
   
   END WHILE
END FUNCTION

################################################################################
#变量清0
# Date & Author..: #181129-00060#1 By 11384
################################################################################
PRIVATE FUNCTION axcq200_xckb_tot_to_0()
   DEFINE r_xckb_tot      RECORD   #总计
                          xckb027  LIKE xckb_t.xckb027, 
                          xckb102  LIKE xckb_t.xckb102
                          END RECORD                          
   LET r_xckb_tot.xckb027 = 0
   LET r_xckb_tot.xckb102 = 0
   
   RETURN r_xckb_tot.*
                          
END FUNCTION

################################################################################
# Descriptions...: 解析法人QBE字串
# Memo...........:
# Usage..........: CALL axcq200_get_key_value(p_str_array)
#                  RETURNING r_xckbcompstr
# Input parameter: p_str_array    法人多選字串
# Return code....: r_xckbcompstr  法人條件字串
# Date & Author..: 19/07/15 By 07423 (#190628-00043#3 add)
# Modify.........:
################################################################################
PRIVATE FUNCTION axcq200_get_key_value(p_str_array)
   DEFINE p_str_array       STRING
   DEFINE r_xckbcompstr     STRING
   DEFINE bst               base.StringTokenizer 
  #DEFINE l_cnt             LIKE type_t.num5
  #DEFINE l_i               LIKE type_t.num5

   LET r_xckbcompstr = NULL
   
   IF cl_null(p_str_array) THEN
      RETURN r_xckbcompstr
   END IF
   
   LET bst= base.StringTokenizer.create(p_str_array,"|")
   WHILE bst.hasMoreTokens()
      IF NOT cl_null(r_xckbcompstr) THEN
         LET r_xckbcompstr = r_xckbcompstr,','
      END IF
      LET r_xckbcompstr = r_xckbcompstr,"'",bst.nextToken(),"'"
   END WHILE
   
   IF NOT cl_null(r_xckbcompstr) THEN
      LET r_xckbcompstr = '(',r_xckbcompstr,')'
   END IF
   
   RETURN r_xckbcompstr
END FUNCTION

 
{</section>}
 
