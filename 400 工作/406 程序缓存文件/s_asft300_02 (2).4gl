#該程式未解開Section, 採用最新樣板產出!
{<section id="s_asft300_02.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0008(1900-01-01 00:00:00), PR版次:0008(2017-05-23 17:05:00)
#+ Customerized Version.: SD版次:0001(1900-01-01 00:00:00), PR版次:0008(2021-02-02 14:38:40)
#+ Build......: 000311
#+ Filename...: s_asft300_02
#+ Description: 工單產生備料元件
#+ Creator....: 01258(2014-01-14 10:06:39)
#+ Modifier...: 00000 -SD/PR- 01996
 
{</section>}
 
{<section id="s_asft300_02.global" >}
#應用 p00 樣板自動產生(Version:5)
#add-point:填寫註解說明 name="main.memo"
#150722 展备料时损耗量和公式用量分开控制,标准应发量按公式算出后，需回算QPA分子分母
#160314-00026#1  2016/03/21   By Ann_Huang  在展至下階時,應使用上層階料號sfba001當作KEY,不應拿生產料號sfaa010帶出資料。
#160406-00004#1  2016/04/22   By xianghui   组成用量抓取错误调整
#160428-00002#1  2016/04/28   By Ann_Huang  調整 s_asft300_02.4gl 產生子工單的寫法
#160114-00016#1  2016/05/15   By Sarah      單別設置自動取代,abmm207中有設置了替代上限比率,但工單備料自動取代的時候沒有根據這個比率去取代
#160512-00016#14 2016/05/27   By ming       s_asft300_02_bom增加參數 保稅否，如果傳入值為n，則元件都是n，如果傳入值是y，bmba035以sfba033為主
#160615-00025#1  2016/06/20   By fionchen   產生子工單時,若D-MFG-0039(子工單是否自動確認)='Y'時,產生子工單也需產生製程資料
#160713-00002    2016/07/18   By fionchen   s_asft300_02_ins_sfba()取bmba資料時,增加取bmba024資料
#160805-00023    2016/07/12   By whitney    效能優化
#160701-00010#1  2016/08/22   By Sarah      拆件工單如果生產料號有輸入產品特徵，要將產品特徵自動帶入到單身產品特徵欄位
#160817-00040#1  2016/08/22   By wuxja      调用带特征函数时，参数游标修正
#160727-00025#10 2016/09/02   By zhujing    2.產生子工單時s_asft300_02.4gl會控卡sub-00500沒有下階備料，調整為模具工單可以開立子工單，子工單可以不須存在備料，工單為N未確認
#160830-00049#1  2016/09/13   By whitney    自動替代BOM主料有庫存可用量時優先使用，取替代数量应结合bmea016、bmea017考虑
#160926-00035#1  2016/10/07   By fionchen   產生子工單時需依單別設定工單單頭預設值
#161005-00038#1  2016/10/24   By fionchen   調整母工單單別[D-MFG-0025]子工單開立方式設定1.開窗詢問
#161024-00057#8  2016/10/26   By Whitney    刪除sfae_t和sfad_t相關邏輯
#161028-00035#1  2016/10/28   By charles4m  s_asft300_02_p2 的 SQL 加上 sfaastus IN ('N','D','R')，不為作廢
#161028-00064#1  2016/11/02   By liuym      订单转工单时，产生子工单单头参考单号默认为订单单号
#161111-00026#1  2016/11/11   By Whitney    已開工單未發量要扣除本次數量
#161130-00035#1  2016/12/05   By liuym      产生子工单备料逻辑段不知被谁mark导致多阶BOM结构料件开立工单只能开立第一阶子工单，且子工单没有备料信息
#161207-00074#1  2016/12/13   By liuym      主件、元件对应关系为对等对应时，未将主件产品特征带入到备料产品特征
#161214-00023#1  2016/12/14   By liuym      调整161207-00074#1修改漏掉的地方
#161214-00036#1  2016/12/14   By liuym      161207-00074#1调整逻辑存在问题，如果bmcd_t存在多笔资料，那取值时就会出问题
#161221-00056#1  2016/12/21   By 06948      調整 s_asft300_02的s_asft300_02_ins_sfba() FOR迴圈，跑完一筆料後還原工單單號。
#161212-00060#1  2016/12/22   By ouhz       调整订单料件的子件特性为SKD,BOM下有虚拟料件时,该虚拟料件要往下展一阶
#161221-00016#1  2016/12/28   By 00768      备料中若是虚拟料应该自动展开，修正自动展不成功的问题
#170109-00014#1  2017/01/10   By Whitney    產生子工單時，保稅否欄位由成品料號預設帶出
#170107-00001#1  2017/01/10   By dujuan     料号无下阶bom料不生成工单单头
#170112-00005#1  2017/01/12   By Whitney    修正#170109-00014#1
#170112-00039#1  2017/01/13   By shiun      修正sub-00500錯誤訊息的帶入值為生產料號
#161228-00043#1  2017/01/13   By shiun      當該元件+特性(bmea001+bmea002)取不到替代資料時，換抓全主件的替代資料(bmea001 = 'ALL')
#170123-00006#1  2017/01/23   By ywtsai     修正副產品資料產生時，數量不需做單位換算
#160726-00020#19 2017/02/07   By 08992      將module變數改為global變數
#170210-00054#1  2017/02/14   By shiun      修正若子工單開立方式為2:依BOM設置自動生成，子工單重複產生問題
#160726-00020#22 2017/02/16   By 08992      將global變數是g_rec_b、g_cnt、l_ac資料筆數類型的變數,還原成module變數
#170215-00015#1  2017/02/17   By dujuan     abmt310变更的版本后。asft300的工单单据页签bom版本选择。带出相应的备料明细,
#                                           如果维护的版本，在ecn新版本中找不到，就把它当成第一张ecn的旧版本，抓第一张ecn的生效日期前一秒带入到bom有效期那个栏位
#170302-00055#1  2017/03/03   By 08992      將g_num轉為global變數
#161227-00031#1  2017/03/03   By shiun      工單如果有產生子工單時，子工單的完工日應該要拿母工單的開工日往後推算子工單自己的開工日，如果子工單的開工日已經比Today還小，子工單的開工日就給Today
#170226-00002#1  2017/03/07   By Whitney    單別設定參數D-MFG-0076要預帶庫位至備料明細中的庫位
#170307-00047#1  2017/03/13   By fionchen   調整工單開立時,QPA分子跟分母應與BOM單身的組成用量、主件底數不同問題
#170322-00069#1  2017/03/23   By fionchen   修正取BOM單身備註取不到問題
#170327-00069#1  2017/03/28   By Whitney    增加判斷製程勾選卻沒有製程編號不做參數D-MFG-0039子工單自動確認
#160701-00010#1  2017/03/30   By fionchen   拆件式工單生產料號若有輸入產品特徵,需將產品特徵帶到備料單身明細
#170325-00048#1  2017/03/31   By fionchen   限定足額自動取替代=Y時，且替代方式=2.完全取替代 或 限定足額自動取替代=Y時且替代方式=1.部分取替代且替代上限比率=100時,才可全數替代
#170331-00078#1  2017/04/11   By liuym      调整子工单设定产生方式为开窗询问，弹出asfp401画面后直接退出会出现母工单备料产生不全的问题 
                                            #---因为在s_asfp401取消时将事务回滚了，此单顺便改了s_asfp401.4gl，追单的时候不要忘记追,有新增错误说明，错误说明编号：asf-00855
#170411-00002#1  2017/04/11   By Whitney    根據aimm215預設單頭庫儲
#170411-00043#1  2017/04/12   By Whitney    將161130-00035和170210-00054做mark
#170413-00018#1  2017/04/13   By fionchen   誤用了inag009處理，改回inag008
#170407-00055#1  2017/04/18   By fionchen   子工單產生時,須判斷[D-MFG-0040工单审核后自动发放]參數設定,若為’Y’則確認後須自動發放
#170411-00034#1  2017/04/19   By fionchen   1.修正工單來源為'4.母工單轉入'時,不需新增工單來源資料檔 
#                                           2.取得子工單之母工單的來源訂單資料
#170417-00001#1  2017/04/28   By fionchen   修正#160701-00010#1,若拆件式工單無產品特徵,但卻會產生產品特徵備料單身明細的問題
#170504-00021#1  2017/05/11   By fionchen   調整若生產單位有小數位數,而發料單位小數為0時,若生產數量有小數位時,發料數量因為進位而造成QPA分子跟分母應與BOM單身的組成用量、主件底數不同問題
#170509-00097#1  2017/05/12   By fionchen   調整工單自動開立子工單,子工單單頭欄位寫入不完全
#170509-00016#1  2017/05/15   By Whitney    將單位取位造成的差異在調整應發數量欄位中顯示，將#170504-00021#1mark
#170509-00098#1  2017/05/15   By ywtsai     自動開立子工單時，增加預帶可供給量(sfaa069)
#170515-00007#1  2017/05/23   By xujing     返工工单,拆件式工单,产生单身备料,也要根据单头发料制度判断是否为倒扣料
#171115-00026#1  2017/11/16   By 06021      调整当对部位编号，作业编号,作业序为空格时 无法自动取替代(部位编号，作业编号，作业序不作为限定条件)
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"
#170526-00027#1  2017/06/12   By 08171      延續#170407-00055#1，子工單產生時，除了判斷[D-MFG-0040工单审核后自动发放]參數設定，也要判斷狀態碼是否為'Y'，才去做自動發放
#170618-00297#1  2017/07/04   By 08992      修正總應發數量不應用單位設定的取位方式取位,應無條件進位需調整工單與工單變更中更新總應發數量單位取位的部份應調整為無條件進位(本來呼叫s_aooi250_take_decimals,改為呼叫s_num_round)
#170811-00030#1  2017/08/29   By 08171      如果有指定上階部位、作業、作業序,而本階部位、作業、作業序又是空值的話,就預帶上階的這三個條件(只有展開做處理)
#171117-00048#1  2017/11/20   By 08734      在计算未足套数时，使用生产数量*备料QPA分子/QPA分母-已发量计算，应该是判断如果备料用量采用公式计算时，此处的未发套数应该也使用公式计算
#180326-00015#1  2021/01/06 by linghq      自动取替代时，排除已失效取替代料
#end add-point
 
IMPORT os
#add-point:增加匯入項目 name="main.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_asft300_02.free_style_variable" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_asft300_02.global_variable" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
GLOBALS #160726-00020#19 add
TYPE type_bmba     RECORD
    bmba001    LIKE bmba_t.bmba001,        #bom相关资料都可以通过回传的key值抓取
    bmba002    LIKE bmba_t.bmba002,
    bmba003    LIKE bmba_t.bmba003,
    bmba004    LIKE bmba_t.bmba004,
    bmba005    DATETIME YEAR TO SECOND,
    bmba007    LIKE bmba_t.bmba007,
    bmba008    LIKE bmba_t.bmba008,
    bmba035    LIKE bmba_t.bmba035,        #保稅否  #160512-00016#14 20160527 add by ming
    l_bmba011  LIKE bmba_t.bmba011,        #QPA 分子，对应于原始的主件料号
    l_bmba012  LIKE bmba_t.bmba012,        #QPA 分母，对应于原始的主件料号
    l_inam002  LIKE inam_t.inam002         #元件对应特征  
                END RECORD
 TYPE type_bmba_qty RECORD
    bmba001    LIKE bmba_t.bmba001,        #bom相关资料都可以通过回传的key值抓取
    bmba002    LIKE bmba_t.bmba002,
    bmba003    LIKE bmba_t.bmba003,
    bmba004    LIKE bmba_t.bmba004,
    bmba005    DATETIME YEAR TO SECOND,
    bmba007    LIKE bmba_t.bmba007,
    bmba008    LIKE bmba_t.bmba008,
    bmba035    LIKE bmba_t.bmba035,        #保稅否  #160512-00016#14 20160527 add by ming
    l_bmba011  LIKE bmba_t.bmba011,        #QPA 分子，对应于原始的主件料号
    l_bmba012  LIKE bmba_t.bmba012,        #QPA 分母，对应于原始的主件料号
    l_inam002  LIKE inam_t.inam002,        #元件对应特征
    l_qty      LIKE sfaa_t.sfaa012,        #对应数量
    l_qty2     LIKE sfaa_t.sfaa012,        #主件数量      #160406-00004#1
    l_feature  LIKE inam_t.inam002         #主件对应特征   #160406-00004#1
                END RECORD
 TYPE type_g_sfba   RECORD
    sfbaent    LIKE sfba_t.sfbaent,
    sfbasite   LIKE sfba_t.sfbasite,
    sfbadocno  LIKE sfba_t.sfbadocno,
    sfbaseq    LIKE sfba_t.sfbaseq,
    sfbaseq1   LIKE sfba_t.sfbaseq1,
    sfba001    LIKE sfba_t.sfba001,
    sfba002    LIKE sfba_t.sfba002,
    sfba003    LIKE sfba_t.sfba003,
    sfba004    LIKE sfba_t.sfba004,
    sfba005    LIKE sfba_t.sfba005,
    sfba006    LIKE sfba_t.sfba006,
    sfba007    LIKE sfba_t.sfba007,
    sfba008    LIKE sfba_t.sfba008,
    sfba009    LIKE sfba_t.sfba009,
    sfba010    LIKE sfba_t.sfba010,
    sfba011    LIKE sfba_t.sfba011,
    sfba012    LIKE sfba_t.sfba012,
    sfba013    LIKE sfba_t.sfba013,
    sfba014    LIKE sfba_t.sfba014,
    sfba015    LIKE sfba_t.sfba015,
    sfba016    LIKE sfba_t.sfba016,
    sfba017    LIKE sfba_t.sfba017,
    sfba018    LIKE sfba_t.sfba018,
    sfba019    LIKE sfba_t.sfba019,
    sfba020    LIKE sfba_t.sfba020,
    sfba021    LIKE sfba_t.sfba021,
    sfba022    LIKE sfba_t.sfba022,
    sfba023    LIKE sfba_t.sfba023,
    sfba024    LIKE sfba_t.sfba024,
    sfba025    LIKE sfba_t.sfba025,
    sfba026    LIKE sfba_t.sfba026,
    sfba028    LIKE sfba_t.sfba028,
    sfba030    LIKE sfba_t.sfba030,
    sfba033    LIKE sfba_t.sfba033
           END RECORD
#160805-00023 by whitney add start
DEFINE g_prepare    LIKE type_t.chr1
DEFINE g_slip       LIKE ooba_t.ooba002
DEFINE g_d_mfg_0049 LIKE type_t.num5       #工單項次間隔數
DEFINE g_d_mfg_0046 LIKE type_t.chr1       #使用產品特徵
DEFINE g_s_bas_0036 LIKE type_t.chr1       #工單備料數量是否考慮外加損耗率
DEFINE g_d_mfg_0025 LIKE type_t.chr1       #子工單開立方式
DEFINE g_d_mfg_0047 LIKE type_t.chr1       #自動取代
DEFINE g_d_mfg_0048 LIKE type_t.chr1       #自動替代
DEFINE g_d_mfg_0073 LIKE type_t.chr1       #限定足額自動取替代
DEFINE g_d_mfg_0076 LIKE sfba_t.sfba019    #預設庫位  #170226-00002#1
#160805-00023 by whitney add end
DEFINE g_sql        STRING
DEFINE g_num        LIKE type_t.num5       #回传笔数      #170302-00055#1  add
DEFINE g_sfaadocno  LIKE sfaa_t.sfaadocno  #工单单号
DEFINE g_sfaa003    LIKE sfaa_t.sfaa003    #工单形态
DEFINE g_sfaa010    LIKE sfaa_t.sfaa010    #生产料号
DEFINE g_sfaa011    LIKE sfaa_t.sfaa011    #产品特征
DEFINE g_sfaa012    LIKE sfaa_t.sfaa012    #生产数量
DEFINE g_sfaa       RECORD
    sfaadocdt  LIKE sfaa_t.sfaadocdt,
    sfaa004    LIKE sfaa_t.sfaa004,
    sfaa009    LIKE sfaa_t.sfaa009,
    sfaa010    LIKE sfaa_t.sfaa010,
    sfaa011    LIKE sfaa_t.sfaa011,
    sfaa012    LIKE sfaa_t.sfaa012,
    sfaa013    LIKE sfaa_t.sfaa013,
    sfaa015    LIKE sfaa_t.sfaa015,
    sfaa019    LIKE sfaa_t.sfaa019,   #161227-00031#1
    sfaa020    LIKE sfaa_t.sfaa020,
    sfaa021    LIKE sfaa_t.sfaa021,
    sfaa072    LIKE sfaa_t.sfaa072
                END RECORD
#DEFINE g_num        LIKE type_t.num5       #回传笔数 #160726-00020#22 mark
DEFINE g_sfba       type_g_sfba
DEFINE r_bmba       DYNAMIC ARRAY OF type_bmba  #回传数组
#DEFINE g_m          LIKE type_t.num5                #160726-00020#22 mark
#160406-00004#1---add---begin
DEFINE g_bmba_feature  DYNAMIC ARRAY OF RECORD
    l_feature  LIKE inam_t.inam002         #元件对应特征
                END RECORD
#160406-00004#1---add---end
#160701-00010#1 add --(S)--
DEFINE g_inam1               DYNAMIC ARRAY OF RECORD   #記錄產品特徵
           inam001           LIKE inam_t.inam001,
           inam002           LIKE inam_t.inam002,
           inam004           LIKE inam_t.inam004
                             END RECORD
#160701-00010#1 add --(E)--    
END GLOBALS #160726-00020#19 add
#DEFINE g_num        LIKE type_t.num5       #回传笔数   #160726-00020#22 add   #170302-00055#1 mark
DEFINE g_m          LIKE type_t.num5                  #160726-00020#22 add
#end add-point
 
{</section>}
 
{<section id="s_asft300_02.other_dialog" >}

 
{</section>}
 
{<section id="s_asft300_02.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 
# Memo...........:
# Usage..........: CALL s_asft300_02_prepare()
# Input parameter: 
# Return code....: 
# Date & Author..: 160805-00023 By whitney
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_prepare()
DEFINE l_order_method  LIKE ooab_t.ooab002

   IF g_prepare = 'Y' THEN
      RETURN
   END IF
   
   #特征
   LET g_sql = " SELECT sfac006,sfac007,SUM(sfac003) ",
               "   FROM sfac_t ",
               "  WHERE sfacent = ? ",
               "    AND sfacsite = ? ",
               "    AND sfacdocno = ? ",
              #160701-00010#1 -s mod
              #"    AND (sfac002 = '1' OR sfac002 = '2') ",  #一般或聯產品
               "    AND (sfac002 = '1' OR sfac002 = '2' OR sfac002 = '4') ",  #一般或聯產品或拆件式入庫
              #160701-00010#1 -e mod
               "  GROUP BY sfac006,sfac007 ",
               "  ORDER BY sfac006,sfac007 "
   PREPARE s_asft300_02_p1 FROM g_sql
   DECLARE s_asft300_02_c1 CURSOR FOR s_asft300_02_p1
   
   #若有产生子工单，则产生对应备料档资料
   LET g_sql = " SELECT sfaadocno,sfaa003,sfaa010,sfaa011,sfaa015,sfaa012 ",
               "   FROM sfaa_t ",
               "  WHERE sfaaent = ? ",
               "    AND sfaasite = ? ",
              #"    AND sfaa021 = ? ",  #160526-00013 by whitney mark
               "    AND sfaa025 = ? "   #160526-00013 by whitney add
              ,"    AND sfaastus IN ('N','D','R','Y','F') " #161028-00035#1 add    #170107-00001#1 add ,'Y'  #170407-00055#1 add ,'F'
   PREPARE s_asft300_02_p2 FROM g_sql
   DECLARE s_asft300_02_c2 CURSOR FOR s_asft300_02_p2
   
   #產品結構研發資料單身檔
   LET g_sql = " SELECT bmba001,bmba002,bmba003,bmba004,bmba007,bmba008,bmba010,bmba013,bmba015,bmba016, ",
               "        bmba021,bmba022,bmba023,bmba024,bmba027,bmba028,bmba029,bmba030,bmba031,bmba032, ",
              #"        bmba033,bmba034,bmbb011,bmbb012 ",                   #170307-00047#1 mark
               "        bmba033,bmba034,bmbb011,bmbb012,bmba011,bmba012 ",   #170307-00047#1 add
               "   FROM bmba_t ",
               "   LEFT OUTER JOIN bmbb_t ON bmbbent = bmbaent AND bmbbsite = bmbasite AND bmbb001 = bmba001 ",
                                       " AND bmbb002 = bmba002 AND bmbb003 = bmba003 AND bmbb004 = bmba004 ",
                                       " AND bmbb007 = bmba007 AND bmbb008 = bmba008 AND bmbb005 = bmba005 ",
                                       " AND ((bmbb009<=? AND bmbb010 IS NULL) OR (bmbb009<=? AND bmbb010>=?)) ",
               "  WHERE bmbaent=? AND bmbasite=? ",
               "    AND bmba001=? AND bmba002=? AND bmba003=? ",
               #"    AND bmba004=? AND bmba007=? AND bmba008=? ", #170811-00030#1 mark
               #170811-00030#1 --s add
               #有可能特性|作業|作業序是由上階帶來的，所以抓的時候如果是空的也可以
               "    AND (bmba004=? OR bmba004 = ' ') ",
               "    AND (bmba007=? OR bmba007 = ' ') ",
               "    AND (bmba008=? OR bmba008 = ' ') ",
               #170811-00030#1 --e add               
               "    AND to_char(bmba005,'yyyy-mm-dd hh24:mi:ss')=? "
   PREPARE s_asft300_02_ins_sfba_p1 FROM g_sql
   
   #依生管模組參數工單項次間隔數自動增加
   LET g_sql = " SELECT MAX(sfbaseq) FROM sfba_t ",
               "  WHERE sfbaent = ? ",
               "    AND sfbasite = ? ",
               "    AND sfbadocno = ? "
   PREPARE s_asft300_02_ins_sfba_p2 FROM g_sql
   
   #同一料号不同特征当做取替代处理
   LET g_sql = " SELECT sfbaseq,MAX(sfbaseq1) FROM sfba_t ",
               "  WHERE sfbaent = ? ",
               "    AND sfbasite = ? ",
               "    AND sfbadocno = ? ",
               "    AND sfba001 = ? ",
               #170811-00030#1 --s mark
               #"    AND sfba002 = ? ",
               #"    AND sfba003 = ? ",
               #"    AND sfba004 = ? ",
               #170811-00030#1 --e mark
               #170811-00030#1 --s add
               #有可能特性|作業|作業序是由上階帶來的，所以抓的時候如果是空的也可以
               "    AND (sfba002 = ? OR sfba002 = ' ') ",
               "    AND (sfba003 = ? OR sfba003 = ' ') ",
               "    AND (sfba004 = ? OR sfba004 = ' ') ",
               #170811-00030#1 --e add               
               "    AND sfba005 = ? ",
              #"    AND sfbaseq1 = 0 ",  #160705-00001 by whitney mark
               "  GROUP BY sfbaseq "
   PREPARE s_asft300_02_ins_sfba_p3 FROM g_sql
   
   LET g_sql = " SELECT bmaa004,bmba001,bmba002,bmba003,imaa004,imaa005,bmba004,bmba005,bmba006,bmba007,bmba008, ",
               "        bmba010,bmba011,bmba012,bmba014,bmba020,bmba021,bmba025,bmba027,bmba028,bmba035 ",  #160713-00007 add bmba025
               "   FROM bmaa_t,bmba_t ",
               "   LEFT JOIN imaa_t ON imaaent=bmbaent AND imaa001= bmba003 ",
               "  WHERE bmaaent=bmbaent AND bmaasite=bmbasite AND bmaa001=bmba001 AND bmaa002=bmba002 ",
               "    AND bmbaent=? AND bmbasite=? AND bmba001=? AND bmba002=? AND bmaastus='Y' ",
               "    AND (bmba019 = '1' OR bmba019 ='3') ",
               "    AND to_char(bmba005,'YYYY-MM-DD hh24:mi:ss')<=? AND (bmba006 IS NULL OR to_char(bmba006,'YYYY-MM-DD hh24:mi:ss')>?) "
   #工單展備料排序方式
   LET l_order_method = cl_get_para(g_enterprise,g_site,'S-MFG-0056')
   IF NOT cl_null(l_order_method) AND l_order_method = '2' THEN
      #依料號
      LET g_sql = g_sql CLIPPED," ORDER BY bmba003 "
   ELSE
      #依BOM項次
      LET g_sql = g_sql CLIPPED," ORDER BY bmba009 "
   END IF
   PREPARE s_asft300_02_bom_p1 FROM g_sql
   DECLARE s_asft300_02_bom_c1 CURSOR FOR s_asft300_02_bom_p1
   
   #下阶料
   LET g_sql = " SELECT COUNT(1) FROM bmaa_t ",
               "  WHERE bmaaent = ? AND bmaasite = ? AND bmaa001 = ? AND bmaa002 = ? "
   PREPARE s_asft300_02_bom_p2 FROM g_sql
   
   #主件特征对应特征类型特征值
   LET g_sql = " SELECT inam011,inam012,inam013,inam014,inam015,inam016,inam017,inam018,inam019,inam020, ",
               "        inam021,inam022,inam023,inam024,inam025,inam026,inam027,inam028,inam029,inam030, ",
               "        inam031,inam032,inam033,inam034,inam035,inam036,inam037,inam038,inam039,inam040, ",
               "        inam041,inam042,inam043,inam044,inam045,inam046,inam047,inam048,inam049,inam050  ",
               "   FROM inam_t ",
               "  WHERE inament = ? AND inam001 = ? AND inam002 = ? "
   PREPARE s_asft300_02_tz_p1 FROM g_sql
   
   #主件产品特征限定用料
   LET g_sql = " SELECT COUNT(1) FROM bmca_t ",
               "  WHERE bmcaent=? AND bmcasite=? ",
               "    AND bmca001=? AND bmca002=? AND bmca003=? AND bmca004=? AND bmca005=? AND bmca007=? AND bmca008=? "
   PREPARE s_asft300_02_tz_p2 FROM g_sql
   
   LET g_sql = " SELECT bmcb009,bmcb010,bmcb011,bmcb012 ",
               "   FROM bmcb_t ",
               "  WHERE bmcbent=? AND bmcbsite=? ",
               "    AND bmcb001=? AND bmcb002=? AND bmcb003=? AND bmcb004=? AND bmcb005=? AND bmcb007=? AND bmcb008=? ",
               "  ORDER BY bmcb009,bmcb010 "
   PREPARE s_asft300_02_tz_p3 FROM g_sql
   DECLARE s_asft300_02_tz_c3 CURSOR FOR s_asft300_02_tz_p3
   
   #主件与元件产品特征对应
   LET g_sql = " SELECT COUNT(1) FROM bmcc_t ",
               "  WHERE bmccent=? AND bmccsite=? ",
               "    AND bmcc001=? AND bmcc002=? AND bmcc003=? AND bmcc004=? AND bmcc005=? AND bmcc007=? AND bmcc008=? "
   PREPARE s_asft300_02_tz_p4 FROM g_sql
#161207-00074#1 mod---------s--------   
   LET g_sql = " SELECT bmcc009,bmcc010",#bmcd010,bmcd011 ",
               "   FROM bmcc_t",#,bmcd_t ",
               "  WHERE ",#bmccent=bmcdent AND bmccsite=bmcdsite ",
#               "    AND bmcc001=bmcd001 AND bmcc002=bmcd002 AND bmcc003=bmcd003 AND bmcc004=bmcd004 ",
#               "    AND bmcc005=bmcd005 AND bmcc007=bmcd007 AND bmcc008=bmcd008 AND bmcc009=bmcd009 ",
#161207-00074#1 mod---------e-------- 
               "     bmccent=? AND bmccsite=? ",   #161214-00023#1 去第一个AND
               "    AND bmcc001=? AND bmcc002=? AND bmcc003=? AND bmcc004=? AND bmcc005=? AND bmcc007=? AND bmcc008=? ",
               "  ORDER BY bmcc009 "
   PREPARE s_asft300_02_tz_p5 FROM g_sql
   DECLARE s_asft300_02_tz_c5 CURSOR FOR s_asft300_02_tz_p5
   
#161214-00036#1 add---------s--------   
   LET g_sql = " SELECT bmcd010,bmcd011 ",
               "   FROM bmcd_t ",
               "  WHERE  bmcdent=? AND bmcdsite=?",

               "    AND bmcd001=? AND bmcd002=? AND bmcd003=? AND bmcd004=? AND bmcd005=? AND bmcd007=? AND bmcd008=? AND bmcd009=? ",
               "  ORDER BY bmcd009 "
   PREPARE s_asft300_02_tz_pcd FROM g_sql
   DECLARE s_asft300_02_tz_ccd CURSOR FOR s_asft300_02_tz_pcd   
#161214-00036#1 add---------s-------- 


   #限定元件特征
   LET g_sql = " SELECT bmce009,bmce010 ",
               "   FROM bmce_t ",
               "  WHERE bmceent=? AND bmcesite=? ",
               "    AND bmce001=? AND bmce002=? AND bmce003=? AND bmce004=? AND bmce005=? AND bmce007=? AND bmce008=? ",
               "  ORDER BY bmce009 "
   PREPARE s_asft300_02_tz_p6 FROM g_sql
   DECLARE s_asft300_02_tz_c6 CURSOR FOR s_asft300_02_tz_p6
   
   #料件特徵群組單身檔–屬性類型
   LET g_sql = " SELECT imeb006 FROM imaa_t,imeb_t ",
               "  WHERE imaaent = ? AND imaa001 = ? ",
               "    AND imebent = imaaent AND imeb001 = imaa005 AND imeb004 = ? "
   PREPARE s_asft300_02_tz_check_p1 FROM g_sql
   #160727-00025#10 marked-S
#   LET g_sql = " SELECT MAX(sfacseq)+1 FROM sfac_t ",
#               "  WHERE sfacent = ? ",
#               "    AND sfacsite = ? ",
#               "    AND sfacdocno = ? "
#   PREPARE s_asft300_02_gen_children_ins_sfac_p2 FROM g_sql
   #160727-00025#10 marked-E
   
   #可用倉庫存數量
  #LET g_sql = " SELECT SUM(NVL(inag009,0)) ",     #170413-00018#1 mark
   LET g_sql = " SELECT SUM(NVL(inag008,0)) ",     #170413-00018#1 add
               "   FROM inag_t ",
               "  WHERE inagent = ? ",
               "    AND inagsite = ? ",
               "    AND inag001 = ? ",
               "    AND inag002 = ? ",
               "    AND inag007 = ? ",
               "    AND inag010 = 'Y' ",  #庫存可用否
               "    AND inag019 = 'N' "   #留置否
   PREPARE s_asft300_02_get_qty_p1 FROM g_sql
   
   #已開工單未發料量
   LET g_sql = " SELECT SUM(NVL(sfba013,0)) ",
               "   FROM sfaa_t,sfba_t ",
               "  WHERE sfaaent = sfbaent AND sfaadocno = sfbadocno ",
               "    AND sfbaent = ? AND sfbasite = ? ",
               "    AND sfba006 = ? AND sfba021 = ? ",
               "    AND sfaastus IN ('N','Y','F') ",
               "    AND sfaadocno <> '",g_sfaadocno,"' ",  #161111-00026#1
               "    AND NOT EXISTS (SELECT 1 FROM sfdc_t WHERE sfdcent=sfbaent AND sfdcsite=sfbasite AND sfdc001=sfbadocno AND sfdc004=sfba006 AND sfdc005=sfba021) "
              #"    AND sfbadocno NOT IN (SELECT sfdc001 FROM sfdc_t WHERE sfdcent=sfbaent AND sfdcsite=sfbasite AND sfdc004=sfba006 AND sfdc005=sfba021) "
   PREPARE s_asft300_02_get_qty_p2 FROM g_sql
   
   LET g_sql = " INSERT INTO sfba_t ",
               " (sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1, ",
               "  sfba001,sfba002,sfba003,sfba004,sfba005, ",
               "  sfba006,sfba007,sfba008,sfba009,sfba010, ",
               "  sfba011,sfba012,sfba013,sfba014,sfba015, ",
               "  sfba016,sfba017,sfba018,sfba019,sfba020, ",
               "  sfba021,sfba022,sfba023,sfba024,sfba025, ",
               #"  sfba026,sfba028,sfba030,sfba033) ", #mod by huna20170719
               "  sfba026,sfba028,sfba030,sfba033,sfbaud002,sfbaud011,sfbaud012,sfbaud013) ",  #add ,sfbaud002,sfbaud012,sfbaud013 by huna20170719 #add sfbaud011 by huna20170720
               " VALUES (?,?,?,?,?,?,?,?,?,?, ",
                       " ?,?,?,?,?,?,?,?,?,?, ",
                       " ?,?,?,?,?,?,?,?,?,?, ",
                       " ?,?,?,?,?,?,?,?) "   #add ,?,?,? by huna20170719  #add ? by huna20170720
   PREPARE s_asft300_02_ins_sfba_p FROM g_sql
   
   #170109-00014#1-s
   #LET g_sql = " INSERT INTO sfaa_t ",
   #            " (sfaaent,sfaasite,sfaastus,sfaadocno,sfaadocdt, ",
   #            "  sfaa001,sfaa002,sfaa003,sfaa004,sfaa005,sfaa022,sfaa023,sfaa009, ",      ##161028-00064#1 add sfaa022,sfaa023,sfaa009
   #            "  sfaa010,sfaa011,sfaa012,sfaa013,sfaa015, ",
   #            "  sfaa016,sfaa017,sfaa019,sfaa020,sfaa021, ",
   #            "  sfaa025,sfaa038,sfaa039,sfaa040,sfaa041, ",
   #            "  sfaa042,sfaa043,sfaa044,sfaa049,sfaa050, ",
   #            "  sfaa051,sfaa055,sfaa056,sfaa057,sfaa058, ",
   #            "  sfaa060,sfaa061,sfaa062,sfaa071,sfaaownid, ",
   #            "  sfaaowndp,sfaacrtid,sfaacrtdp,sfaacrtdt) ",
   #            " VALUES (?,?,?,?,?,?,?,?,?,?, ",
   #                    " ?,?,?,?,?,?,?,?,?,?, ",
   #                    " ?,?,?,?,?,?,?,?,?,?, ",
   #                    " ?,?,?,?,?,?,?,?,?,?,?,?,?,",                                        ##161028-00064#1 add ?,?,?
   #                    " ?,?,?,?) "
   #170411-00002#1-s
   #LET g_sql = " INSERT INTO sfaa_t ",
   #            " (sfaaent,sfaasite,sfaastus,sfaadocno,sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,sfaa005, ",
   #            "  sfaa009,sfaa010,sfaa011,sfaa012,sfaa013,sfaa015,sfaa016,sfaa017,sfaa019,sfaa020, ",
   #            "  sfaa021,sfaa022,sfaa023,sfaa025,sfaa038,sfaa039,sfaa040,sfaa041,sfaa042,sfaa043, ",
   #            "  sfaa044,sfaa049,sfaa050,sfaa051,sfaa055,sfaa056,sfaa057,sfaa058,sfaa060,sfaa061, ",
   #            "  sfaa062,sfaa071,sfaa072,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,sfaacrtdt) ",
   #            " VALUES (?,?,?,?,?, ?,?,?,?,?, ",
   #                    " ?,?,?,?,?, ?,?,?,?,?, ",
   #                    " ?,?,?,?,?, ?,?,?,?,?, ",
   #                    " ?,?,?,?,?, ?,?,?,?,?, ",
   #                    " ?,?,?,?,?, ?,?,?) "
   LET g_sql = " INSERT INTO sfaa_t ",
               " (sfaaent,sfaasite,sfaastus,sfaadocno,sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,sfaa005, ",
               "  sfaa009,sfaa010,sfaa011,sfaa012,sfaa013,sfaa015,sfaa016,sfaa017,sfaa019,sfaa020, ",
               "  sfaa021,sfaa022,sfaa023,sfaa025,sfaa034,sfaa035,sfaa038,sfaa039,sfaa040,sfaa041, ",
               "  sfaa042,sfaa043,sfaa044,sfaa049,sfaa050,sfaa051,sfaa055,sfaa056,sfaa057,sfaa058, ",
               "  sfaa024,sfaa064,sfaa065,sfaa069,sfaa070,sfaamodid,sfaamoddt, ",    #170411-00034#1 add #170509-00097#1 add sfaa065,sfaa070,sfaamodid,sfaamoddt   #170509-00098#1 add sfaa069            
               "  sfaa060,sfaa061,sfaa062,sfaa071,sfaa072,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,sfaacrtdt) ",
               " VALUES (?,?,?,?,?, ?,?,?,?,?, ",
                       " ?,?,?,?,?, ?,?,?,?,?, ",
                       " ?,?,?,?,?, ?,?,?,?,?, ",
                       " ?,?,?,?,?, ?,?,?,?,?, ",
                       " ?,?,?,?,?, ?,?, ",      #170411-00034#1 add #170509-00097#1 add ?,?,?,?, #170509-00098#1 add 1?
                       " ?,?,?,?,?, ?,?,?,?,?) "
   #170411-00002#1-e
   #170109-00014#1-e
   PREPARE s_asft300_02_ins_sfaa_p FROM g_sql
   
   LET g_sql = " INSERT INTO sfab_t ",
               " (sfabent,sfabsite,sfabdocno,sfabseq,sfab001,sfab006,sfab007) ",
               " VALUES (?,?,?,1,'4',10,?) "
   PREPARE s_asft300_02_ins_sfab_p FROM g_sql
   
   #160727-00025#10 marked-S
#   LET g_sql = " INSERT INTO sfac_t ",
#               " (sfacent,sfacsite,sfacdocno,sfacseq,sfac001,sfac002,sfac003,sfac004,sfac005,sfac006) ",
#               " VALUES (?,?,?,?,?,?,?,?,?,?) "
#   PREPARE s_asft300_02_ins_sfac_p FROM g_sql
   #160727-00025#10 marked-E
   
   LET g_prepare = 'Y'

END FUNCTION
################################################################################
# Descriptions...: 展bom
# Memo...........:
# Usage..........: CALL s_asft300_02_bom(p_level,p_bmaa001,p_bmaa002,p_bmaa004,p_bmba011,p_bmba012,p_date,p_type,p_item,p_feature,p_flag,p_bmba_mix)
# Input parameter: 1.p_level      阶层     主程序调用时给'0'
#                  2.p_bmaa001    料号
#                  3.p_bmaa002    特性
#                  4.p_bmaa004    单位
#                  5.p_bmba011    QPA分子  主程序调用时给'1'
#                  6.p_bmba012    QPA分母  主程序调用时给'1'
#                  7.p_date       有效日期,可以为空；p_date在所展bom的有效日期范围内才展开
#                  8.p_type       是否展到最尾阶，Y:代表不参考bom的展开选项，一律展到最尾阶；
#                                               N或者空时：代表根据bom的展开选项，直到展开选项为'不展开'为止;
#                                               S:代表只展单阶
#                                               M:多阶
#                                               W:代表根据bom的展开选项，不開窗詢問直接展開
#                  9.p_item       展到此料号为止；如果不考虑则给空
#                  10.p_feature   料号对应产品特征
#                  11.p_flag      是否要考虑可选件，Y:代表要考虑；N或者空是：代表不考虑;工单展备料用
#                  12.p_bmba035   保稅否 
# Return code....: 1.r_bmba
# Date & Author..: 2014/1/10 By wuxj
# Modify.........: 150212 by whitney add p_type = 'M'
# Modify.........: 150410 by whitney add p_type = 'W'
# Modify.........: #170811-00030#1 170825 By 08171 p_bmba035 -> p_bmba_mix
################################################################################
PUBLIC FUNCTION s_asft300_02_bom(p_level,p_bmaa001,p_bmaa002,p_bmaa004,p_bmba011,p_bmba012,p_date,p_type,p_item,p_feature,p_flag,p_bmba_mix)
DEFINE p_level      LIKE type_t.num5
DEFINE p_bmaa001    LIKE bmaa_t.bmaa001
DEFINE p_bmaa002    LIKE bmaa_t.bmaa002
DEFINE p_bmaa004    LIKE bmaa_t.bmaa004
DEFINE p_bmba011    LIKE bmba_t.bmba011
DEFINE p_bmba012    LIKE bmba_t.bmba012
DEFINE p_date       LIKE bmba_t.bmba005
DEFINE p_type       LIKE type_t.chr1
DEFINE p_item       LIKE imaa_t.imaa001
DEFINE p_feature    LIKE sfba_t.sfba021
DEFINE p_flag       LIKE type_t.chr1

#DEFINE p_bmba035    LIKE bmba_t.bmba035  #160512-00016#14 20160527 add #170811-00030#1 mark 換成下面的
#170811-00030#1 --s add
#保稅否(bmba035)|部位(bmba004)|作業(bmba007)|作業序(bmba008)  
DEFINE p_bmba_mix   STRING 
#DEFINE l_bmba_mix   STRING
#170811-00030#1 --e add

DEFINE l_sfaa015    DATETIME YEAR TO SECOND
DEFINE l_sfaa015_1  LIKE type_t.chr20    #BOM有效日期
DEFINE sr           DYNAMIC ARRAY OF RECORD
    bmaa004    LIKE bmaa_t.bmaa004,
    bmba001    LIKE bmba_t.bmba001,
    bmba002    LIKE bmba_t.bmba002,
    bmba003    LIKE bmba_t.bmba003,
    imaa004    LIKE imaa_t.imaa004,
    imaa005    LIKE imaa_t.imaa005,
    bmba004    LIKE bmba_t.bmba004,
    bmba005    DATETIME YEAR TO SECOND,
    bmba006    DATETIME YEAR TO SECOND,
    bmba007    LIKE bmba_t.bmba007,
    bmba008    LIKE bmba_t.bmba008,
    bmba010    LIKE bmba_t.bmba010,
    bmba011    LIKE bmba_t.bmba011,
    bmba012    LIKE bmba_t.bmba012,
    bmba014    LIKE bmba_t.bmba014,
    bmba020    LIKE bmba_t.bmba020,
    bmba021    LIKE bmba_t.bmba021,
    bmba025    LIKE bmba_t.bmba025,  #160713-00007 add
    bmba027    LIKE bmba_t.bmba027,
    bmba028    LIKE bmba_t.bmba028,
    #bmba035    LIKE bmba_t.bmba035 #170811-00030#1 mark
    #170811-00030#1 --s add
    bmba035    LIKE bmba_t.bmba035,
    bmba_mix   STRING
    #170811-00030#1 --e add    
                END RECORD
DEFINE l_ac         LIKE type_t.num5
DEFINE fs_insert    LIKE type_t.chr1
DEFINE l_i          LIKE type_t.num5
DEFINE l_success    LIKE type_t.chr1
DEFINE l_rate       LIKE inaj_t.inaj014
DEFINE l_n          LIKE type_t.num5
DEFINE l_bmba005_1  LIKE ooff_t.ooff007
DEFINE l_bmba011    LIKE bmba_t.bmba011
DEFINE l_bmba012    LIKE bmba_t.bmba012
DEFINE l_feature    LIKE inam_t.inam002
DEFINE l_bmba011_1  LIKE bmba_t.bmba011
DEFINE l_bmba012_1  LIKE bmba_t.bmba012
DEFINE l_msg        STRING
#170811-00030#1 --s add
#拆分p_bmba_mix用
DEFINE l_tok_param     base.StringTokenizer
DEFINE l_token         DYNAMIC ARRAY OF RECORD
       l_bmba          STRING
                       END RECORD
DEFINE l_token_n       LIKE type_t.num10
#存放p_bmba_mix拆分出來的值 
DEFINE l_bmba035    LIKE bmba_t.bmba035 #保稅否
DEFINE l_bmba004    LIKE bmba_t.bmba004 #部位
DEFINE l_bmba007    LIKE bmba_t.bmba007 #作業編號
DEFINE l_bmba008    LIKE bmba_t.bmba008 #作業序


#給子工單存放母工單上階料的值 
DEFINE l_sfba002    LIKE sfba_t.sfba002
DEFINE l_sfba003    LIKE sfba_t.sfba003 #部位
DEFINE l_sfba004    LIKE sfba_t.sfba004 #作業編號
DEFINE l_sfaa005    LIKE sfaa_t.sfaa005 #作業序         
#170811-00030#1 --e add  

   WHENEVER ERROR CONTINUE
   
   #参数为空
   IF cl_null(p_level) OR
      cl_null(p_bmaa001) OR
      cl_null(p_bmaa004) OR
      cl_null(p_bmba011) OR
      cl_null(p_bmba012) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00110'
      LET g_errparam.extend = 's_asft300_02_bom'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN ''
   END IF
   
   IF cl_null(p_bmaa002) THEN
      LET p_bmaa002 = ' '
   END IF
   
   IF cl_null(p_type) THEN
      LET p_type = 'N'
   END IF
   
   IF cl_null(p_flag) THEN
      LET p_flag = 'N'
   END IF
   
   #当p_date为null时，bom有效日期为当前日期
   IF cl_null(p_date) THEN
      LET l_sfaa015 = cl_get_current()
      LET l_sfaa015_1 = l_sfaa015
   ELSE
      #LET l_sfaa015_1 = p_date
      #LET l_sfaa015_num = l_sfaa015_1[1,2]
      #IF l_sfaa015_num > 50 THEN
      #   LET l_sfaa015_1 = '19',p_date,' 00:00:00'
      #ELSE
      #   LET l_sfaa015_1 = '20',p_date,' 00:00:00'
      #END IF
      LET l_sfaa015 = p_date
      LET l_sfaa015_1 = l_sfaa015
   END IF
   
   #170811-00030#1 --s mark 改傳組合字串p_bmba_mix，處理在下面
   #160512-00016#14 20160527 add by ming -----(S) 
   ##如果保稅否的傳入值是null的話，就視為N 
   #IF cl_null(p_bmba035) THEN 
   #   LET p_bmba035 = 'N' 
   #END IF 
   #160512-00016#14 20160527 add by ming -----(E)
   #170811-00030#1 --e mark   
   #170811-00030#1 --s add
   LET l_bmba035 = 'N' #保稅否
   LET l_bmba004 = ' ' #部位
   LET l_bmba007 = ' ' #作業編號
   LET l_bmba008 = ' ' #作業序
   IF p_bmba_mix.getIndexOf('|',1) = 0 THEN 
      #沒找到'|'則表示不指定部位、作業、作業序,就依照原先的展bom方式
      IF cl_null(p_bmba_mix) THEN 
         LET l_bmba035 = 'N' #保稅否
      END IF 
   ELSE
      IF NOT cl_null(p_bmba_mix) THEN
         CALL l_token.clear()
         LET l_tok_param = base.StringTokenizer.create(p_bmba_mix,"|")
         LET l_token_n = 1
         WHILE l_tok_param.hasMoreTokens()
            LET l_token[l_token_n].l_bmba = l_tok_param.nextToken()
            IF cl_null(l_token[l_token_n].l_bmba) THEN
               LET l_token[l_token_n].l_bmba = ' '
            END IF
            LET l_token_n = l_token_n + 1
         END WHILE
         LET l_bmba035 = l_token[1].l_bmba
         LET l_bmba004 = l_token[2].l_bmba
         LET l_bmba007 = l_token[3].l_bmba
         LET l_bmba008 = l_token[4].l_bmba      
      END IF
   END IF 
   #170811-00030#1 --e add

   CALL s_asft300_02_prepare()  #160805-00023 by whitney add
   
   IF p_level = 0 THEN
      CALL r_bmba.clear()
      LET g_m =1
   END IF
   LET p_level = p_level + 1
   
   WHILE TRUE
      LET l_ac = 1
      FOREACH s_asft300_02_bom_c1
        USING g_enterprise,g_site,p_bmaa001,p_bmaa002,l_sfaa015_1,l_sfaa015_1
         INTO sr[l_ac].bmaa004,sr[l_ac].bmba001,sr[l_ac].bmba002,sr[l_ac].bmba003,sr[l_ac].imaa004,
              sr[l_ac].imaa005,sr[l_ac].bmba004,sr[l_ac].bmba005,sr[l_ac].bmba006,sr[l_ac].bmba007,
              sr[l_ac].bmba008,sr[l_ac].bmba010,sr[l_ac].bmba011,sr[l_ac].bmba012,sr[l_ac].bmba014,
              sr[l_ac].bmba020,sr[l_ac].bmba021,sr[l_ac].bmba025,sr[l_ac].bmba027,sr[l_ac].bmba028,  #160713-00007 add bmba025
              sr[l_ac].bmba035
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "s_asft300_02_bom_c1:",SQLERRMESSAGE
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            EXIT FOREACH
         END IF
         LET l_ac = l_ac + 1
      END FOREACH
      
      #无下阶料
      CALL sr.deleteElement(l_ac)
      LET l_ac = l_ac - 1
      IF l_ac = 0 THEN
         LET fs_insert = 'N'
      END IF
      
      FOR l_i = 1 TO sr.getLength()
      
         #生產單位
         IF cl_null(sr[l_i].bmaa004) THEN
            LET sr[l_i].bmaa004 = p_bmaa004
         END IF
         CALL s_aimi190_get_convert(p_bmaa001,p_bmaa004,sr[l_i].bmaa004) RETURNING l_success,l_rate
         IF cl_null(l_rate) THEN
            LET l_rate = 1
         END IF
         
         LET l_n = 0
         EXECUTE s_asft300_02_bom_p2 USING g_enterprise,g_site,sr[l_i].bmba003,sr[l_i].bmba002 INTO l_n
         
         LET l_bmba005_1 = sr[l_i].bmba005
         
         #160406-00004#1---modify---begin
         IF sr[l_i].bmba027 = 'Y' THEN
            #mod by huna20170828---s增加参数
            #CALL s_asft300_04_get_bmze003_value(sr[l_i].bmba001,sr[l_i].bmba003,sr[l_i].bmba028,p_feature)
            #     RETURNING l_success,sr[l_i].bmba011
            CALL s_asft300_04_get_bmze003_value(sr[l_i].bmba001,sr[l_i].bmba003,sr[l_i].bmba028,p_feature
                                               ,sr[l_i].bmba002,sr[l_i].bmba004,sr[l_i].bmba005,sr[l_i].bmba007,sr[l_i].bmba008)
                 RETURNING l_success,sr[l_i].bmba011     
            #mod by huna20170828---e
            LET sr[l_i].bmba012 = 1
            LET l_bmba011 = p_bmba011 * sr[l_i].bmba011 * l_rate
            LET l_bmba012 = p_bmba012 * sr[l_i].bmba012
         ELSE
            LET l_bmba011 = p_bmba011 * sr[l_i].bmba011 * l_rate
            LET l_bmba012 = p_bmba012 * sr[l_i].bmba012
         END IF
         #160406-00004#1---modify---begin
         
         IF cl_null(sr[l_i].bmba010) THEN
            LET sr[l_i].bmba010 = sr[l_i].bmaa004
         END IF
         
         #判断是否做特征管理,若有设定元件特征，则返回元件特征
         LET l_feature = ' '
         IF sr[l_i].bmba014 = 'Y' THEN
            CALL s_asft300_02_tz(sr[l_i].bmba001,sr[l_i].bmba002,sr[l_i].bmba003,sr[l_i].bmba004,sr[l_i].bmba005,sr[l_i].bmba007,sr[l_i].bmba008,p_feature,sr[l_i].imaa005)  #160817-00040#1   sr[l_ac].imaa005改成sr[l_i].imaa005
                 RETURNING l_success,l_feature
            IF NOT l_success THEN
               CONTINUE FOR
            END IF
         END IF
         
         #工单展备料时，有来源订单，可选件要在订单有被选择才能带出
         IF p_flag = 'Y' AND sr[l_i].bmba020 ='Y' THEN
            CALL s_asft300_02_kx(sr[l_i].bmba001,sr[l_i].bmba003,sr[l_i].bmba004,sr[l_i].bmba007,sr[l_i].bmba008)
                 RETURNING l_success,l_bmba011_1,l_bmba012_1
            IF NOT l_success THEN
               CONTINUE FOR
            END IF
            LET l_bmba011 = p_bmba011 * l_bmba011_1 * l_rate
            LET l_bmba012 = p_bmba012 * l_bmba012_1 * l_rate
         END IF
         
         #160713-00007-a
         IF sr[l_i].bmba025 = 'Y' THEN
            CONTINUE FOR
         END IF
         #160713-00007-e
         
         #160512-00016#14 20160527 add by ming -----(S)
         #主件料號若為非保稅，則展出來的元件都是非保稅
        #IF p_bmba035 = 'N' THEN #170811-00030#1 mark 
         IF l_bmba035 = 'N' THEN #170811-00030#1 add         
            LET sr[l_i].bmba035 = 'N'
         END IF
         IF cl_null(sr[l_i].bmba035) THEN
            LET sr[l_i].bmba035 = 'N'
         END IF
         #160512-00016#14 20160527 add by ming -----(E)

         #170811-00030#1 --s add
         #組合起來應該是bmba035|bmba004|bmba007|bmba008
         LET sr[l_i].bmba_mix = ''
         LET sr[l_i].bmba_mix = sr[l_i].bmba035


         #mod by huna20170912---s    修改因部位编号为空格，导致的生成工单备料数据错位
         #IF NOT cl_null(sr[l_i].bmba004) THEN
         IF sr[l_i].bmba004 IS NOT NULL THEN 
         #mod by huna20170912---e         
            LET sr[l_i].bmba_mix = sr[l_i].bmba_mix,'|',sr[l_i].bmba004
         END IF

         #mod by huna20170912---s    修改因部位编号为空格，导致的生成工单备料数据错位
         #IF NOT cl_null(sr[l_i].bmba007) THEN 
         IF sr[l_i].bmba007 IS NOT NULL THEN 
         #mod by huna20170912---e           
            LET sr[l_i].bmba_mix = sr[l_i].bmba_mix,'|',sr[l_i].bmba007
         END IF

         #mod by huna20170912---s    修改因部位编号为空格，导致的生成工单备料数据错位
         #IF NOT cl_null(sr[l_i].bmba004) THEN
         IF sr[l_i].bmba008 IS NOT NULL THEN 
         #mod by huna20170912---e 
            LET sr[l_i].bmba_mix = sr[l_i].bmba_mix,'|',sr[l_i].bmba008
         END IF
         #170811-00030#1 --e add


         #傳入參數展到尾階=Y時，則一律展到最尾階
         IF p_type = 'Y' OR p_type = 'M' THEN
            IF l_n > 0 THEN
               IF NOT cl_null(p_item) THEN
                  IF sr[l_i].bmba003 = p_item THEN
                     LET fs_insert = 'Y'
                  ELSE
                    #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,p_type,p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                     CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,p_type,p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add                          
                          RETURNING r_bmba
                     IF p_type = 'M' THEN
                        LET fs_insert = 'Y'
                     ELSE
                        LET fs_insert = 'N'
                     END IF
                  END IF
               ELSE
                 #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,p_type,p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                  CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,p_type,p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add                 
                       RETURNING r_bmba
                  IF p_type = 'M' THEN
                     LET fs_insert = 'Y'
                  ELSE
                     LET fs_insert = 'N'
                  END IF
               END IF
            ELSE
               IF NOT cl_null(p_item) THEN
                  IF sr[l_i].bmba003 = p_item THEN
                     LET fs_insert = 'Y'
                  ELSE
                     LET fs_insert = 'N'
                  END IF
               ELSE
                  LET fs_insert = 'Y'
               END IF
            END IF
         END IF
         
         IF p_type = 'N' OR p_type = 'W' THEN
            IF p_type = 'W' AND sr[l_i].bmba021 = '4' THEN
               LET sr[l_i].bmba021 = '3'
            END IF
            #虚拟件则自动往下展，若无下阶，则不带出虚拟件
            IF sr[l_i].imaa004 = 'X' THEN  #161221-00016#1 mod l_ac->l_i
               IF l_n > 0 THEN
                 #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                  CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add
                         RETURNING r_bmba
                  LET fs_insert = 'N'
               ELSE
                  LET fs_insert = 'N'
               END IF
            ELSE  #不为虚拟件时，按展开选项判断
               CASE sr[l_i].bmba021
                  WHEN '1'  #不展开
                     IF NOT cl_null(p_item) THEN
                        IF sr[l_i].bmba003 = p_item THEN
                           LET fs_insert = 'Y'
                        ELSE
                           LET fs_insert = 'N'
                        END IF
                     ELSE
                        LET fs_insert = 'Y'
                     END IF
                     
                  WHEN '2'  #不展开，自动开立子工单
                     IF NOT cl_null(p_item) THEN
                        IF sr[l_i].bmba003 = p_item THEN
                           LET fs_insert = 'Y'
                        ELSE
                           LET fs_insert = 'N'
                        END IF
                     ELSE
                        LET fs_insert = 'Y'
                     END IF
                     
                  WHEN '3'  #展开
                     IF l_n > 0 THEN
                        IF NOT cl_null(p_item) THEN
                           IF sr[l_i].bmba003 = p_item THEN
                              LET fs_insert = 'Y'
                           ELSE
                             #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                              CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add    
                                   RETURNING r_bmba
                              LET fs_insert = 'N'
                           END IF
                        ELSE
                          #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                           CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add                      
                                RETURNING r_bmba
                           LET fs_insert = 'N'
                        END IF
                     ELSE
                        IF NOT cl_null(p_item) THEN
                           IF sr[l_i].bmba003 = p_item THEN
                              LET fs_insert = 'Y'
                           ELSE
                              LET fs_insert = 'N'
                           END IF
                        ELSE
                           LET fs_insert = 'Y'
                        END IF
                     END IF
                  
                  WHEN '4'  #开窗询问
                     LET l_msg = sr[l_i].bmba003,cl_getmsg('asf-00144',g_lang)
                     IF cl_ask_promp(l_msg) THEN
                        IF l_n > 0 THEN
                           IF NOT cl_null(p_item) THEN
                              IF sr[l_i].bmba003 = p_item THEN
                                 LET fs_insert = 'Y'
                              ELSE
                                #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                                 CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add                                      
                                      RETURNING r_bmba
                                 LET fs_insert = 'N'
                              END IF
                           ELSE
                             #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                              CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add                              
                                   RETURNING r_bmba
                              LET fs_insert = 'N'
                           END IF
                        ELSE
                           IF NOT cl_null(p_item) THEN
                              IF sr[l_i].bmba003 = p_item THEN
                                 LET fs_insert = 'Y'
                              ELSE
                                 LET fs_insert = 'N'
                              END IF
                           ELSE
                              LET fs_insert = 'Y'
                           END IF
                        END IF
                     ELSE
                        IF NOT cl_null(p_item) THEN
                           IF sr[l_i].bmba003 = p_item THEN
                              LET fs_insert = 'Y'
                           ELSE
                              LET fs_insert = 'N'
                           END IF
                        ELSE
                           LET fs_insert = 'Y'
                        END IF
                     END IF
               END CASE
            END IF
         END IF
         
         IF p_type = 'S' THEN      
          LET fs_insert = 'Y'         
          #161212-00060#1---add---begin---  #子件特性为SKD,有虚拟料则虚拟件往下展一阶
           #虚拟件则自动往下展，若无下阶，则不带出虚拟件
            IF sr[l_i].imaa004 = 'X' THEN  #161221-00016#1 mod l_ac->l_i
               IF l_n > 0 THEN
                 #CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba035) #170811-00030#1 mark
                  CALL s_asft300_02_bom(p_level,sr[l_i].bmba003,sr[l_i].bmba002,sr[l_i].bmba010,l_bmba011,l_bmba012,p_date,'N',p_item,l_feature,p_flag,sr[l_i].bmba_mix)      #170811-00030#1 add                       
                       RETURNING r_bmba
                  LET fs_insert = 'N'
               ELSE
                  LET fs_insert = 'N'
               END IF
            END IF         
          #161212-00060#1----add---end----         
         END IF
         
         IF fs_insert = 'Y' THEN
         
            #170811-00030#1 --s add
            #有指定上階部位、作業、作業序,而本階部位、作業、作業序又是空值的話,就預帶上階的條件   
            #上階部位
            IF NOT cl_null(l_bmba004) AND 
               (cl_null(sr[l_i].bmba004) OR cl_null(sr[l_i].bmba004 = ' ')) THEN
               LET sr[l_i].bmba004 = l_bmba004
            END IF
            #作業
            IF NOT cl_null(l_bmba007) AND 
               (cl_null(sr[l_i].bmba007) OR cl_null(sr[l_i].bmba007 = ' ')) THEN
               LET sr[l_i].bmba007 = l_bmba007
            END IF
            #作業序
            IF NOT cl_null(l_bmba008) AND 
               (cl_null(sr[l_i].bmba008) OR cl_null(sr[l_i].bmba008 = ' ')) THEN
               LET sr[l_i].bmba008 = l_bmba008
            END IF

            
            #170811-00030#1 --e add 
            
            IF cl_null(g_m) OR g_m = 0 THEN
               LET g_m = 1
            END IF
            LET r_bmba[g_m].bmba001 = sr[l_i].bmba001
            LET r_bmba[g_m].bmba002 = sr[l_i].bmba002
            LET r_bmba[g_m].bmba003 = sr[l_i].bmba003
            LET r_bmba[g_m].bmba004 = sr[l_i].bmba004
            LET r_bmba[g_m].bmba005 = sr[l_i].bmba005
            LET r_bmba[g_m].bmba007 = sr[l_i].bmba007
            LET r_bmba[g_m].bmba008 = sr[l_i].bmba008
            LET r_bmba[g_m].bmba035 = sr[l_i].bmba035  #160512-00016#14 20160527 add by ming
           ##QPA分子分母约分计算
           #IF l_bmba011 < l_bmba012 THEN
           #   LET l_j = l_bmba011
           #ELSE
           #   LET l_j = l_bmba012
           #END IF
           #FOR l_k = l_j TO 1 STEP -1
           #   IF (l_bmba011 MOD l_k = 0) AND (l_bmba012 MOD l_k = 0) THEN
           #      EXIT FOR
           #   END IF
           #END FOR
           #LET r_bmba[g_m].l_bmba011 = l_bmba011 / l_k
           #LET r_bmba[g_m].l_bmba012 = l_bmba012 / l_k
            LET r_bmba[g_m].l_bmba011 = l_bmba011
            LET r_bmba[g_m].l_bmba012 = l_bmba012
            LET r_bmba[g_m].l_inam002 = l_feature
            LET g_bmba_feature[g_m].l_feature = p_feature  #160406-00004#1
            LET g_m = g_m + 1
         END IF
      END FOR
      EXIT WHILE
   END WHILE
   IF NOT cl_null(g_m) THEN
      CALL r_bmba.deleteElement(g_m)
   END IF
   
   RETURN r_bmba
END FUNCTION

################################################################################
# Descriptions...: 新增工单备料单身档
# Memo...........:
# Usage..........: CALL s_asft300_02_ins_sfba(p_bmba)
#                  RETURNING r_success
# Input parameter: 1.p_bmba
# Return code....: 1.r_success
# Date & Author..: 2014/4/18 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_ins_sfba(p_bmba)
DEFINE p_bmba       DYNAMIC ARRAY OF type_bmba_qty
DEFINE r_success    LIKE type_t.num5
DEFINE l_success    LIKE type_t.chr1
DEFINE l_i          LIKE type_t.num5
DEFINE l_bmba005_1  LIKE ooff_t.ooff007
DEFINE l_qty        LIKE sfba_t.sfba013
DEFINE l_bmba       RECORD
    bmba001    LIKE bmba_t.bmba001,
    bmba002    LIKE bmba_t.bmba002,
    bmba003    LIKE bmba_t.bmba003,
    bmba004    LIKE bmba_t.bmba004,
    bmba007    LIKE bmba_t.bmba007,
    bmba008    LIKE bmba_t.bmba008,
    bmba010    LIKE bmba_t.bmba010,
    bmba013    LIKE bmba_t.bmba013,
    bmba015    LIKE bmba_t.bmba015,
    bmba016    LIKE bmba_t.bmba016,
    bmba021    LIKE bmba_t.bmba021,
    bmba022    LIKE bmba_t.bmba022,
    bmba023    LIKE bmba_t.bmba023,
    bmba024    LIKE bmba_t.bmba024,
    bmba027    LIKE bmba_t.bmba027,
    bmba028    LIKE bmba_t.bmba028,
    bmba029    LIKE bmba_t.bmba029,
    bmba030    LIKE bmba_t.bmba030,
    bmba031    LIKE bmba_t.bmba031,
    bmba032    LIKE bmba_t.bmba032,
    bmba033    LIKE bmba_t.bmba033,
    bmba034    LIKE bmba_t.bmba034
           END RECORD
DEFINE l_bmbb011     LIKE bmbb_t.bmbb011
DEFINE l_bmbb012     LIKE bmbb_t.bmbb012
DEFINE l_sfba013     LIKE sfba_t.sfba013
DEFINE l_sfbaseq     LIKE sfba_t.sfbaseq
DEFINE l_sfbaseq1    LIKE sfba_t.sfbaseq1
DEFINE l_ooff013     LIKE ooff_t.ooff013
DEFINE l_num         LIKE type_t.num5
DEFINE l_n           LIKE type_t.num5       #160120-00027 by whitney add
DEFINE l_chk         LIKE type_t.num5        #判断是否为模具工单  #160727-00025#10 add
DEFINE l_date        LIKE type_t.dat         #160727-00025#10 add
DEFINE l_sfaa003     LIKE type_t.chr50       #160727-00025#10 add
DEFINE l_fs_fill     LIKE type_t.chr1        #161005-00038#1 add
DEFINE l_sfaadocno_t LIKE sfaa_t.sfaadocno   #161221-00056#1 add
DEFINE l_bmba011     LIKE bmba_t.bmba011     #170307-00047#1 add
DEFINE l_bmba012     LIKE bmba_t.bmba012     #170307-00047#1 add
#DEFINE l_sfba023     LIKE sfba_t.sfba023     #170504-00021#1 add  #170509-00016#1 mark
DEFINE l_ooca002     LIKE ooca_t.ooca002   #170618-00297#1 add
DEFINE l_ooca004     LIKE ooca_t.ooca004   #170618-00297#1 add

#add by huna20170719---s
DEFINE l_sfbaud002   LIKE sfba_t.sfbaud002
DEFINE l_sfbaud011   LIKE sfba_t.sfbaud011  #add sfbaud011 by huna20170720
DEFINE l_sfbaud012   LIKE sfba_t.sfbaud012   
DEFINE l_sfbaud013   LIKE sfba_t.sfbaud013   
#add by huna20170719---e

#add by huna20171202---s
DEFINE l_today       DATETIME YEAR TO SECOND                          
DEFINE l_today_1     LIKE type_t.chr20        #BOM有效日期 
DEFINE l_sql1        STRING
DEFINE l_bmbaud002   LIKE bmba_t.bmbaud002
#add by huna20171202---e
DEFINE l_bmba005     LIKE bmba_t.bmba005    #add by wangll171211
DEFINE l_bmbaud011   LIKE bmba_t.bmbaud011  #add by huna20171213
#add by wangll171222---s
DEFINE l_liaohao     LIKE bmba_t.bmba001    
DEFINE l_imae032_w   LIKE imae_t.imae032
DEFINE l_imae033_w   LIKE imae_t.imae033
DEFINE l_bilv        LIKE ecbb_t.ecbb022
#add by wangll171222---e
DEFINE l_bmaa004     LIKE bmaa_t.bmaa004  #add by zhengjt20200709
DEFINE l_imad005     LIKE imad_t.imad005  #add by zhengjt20200709
#add by shenyc20200801
DEFINE l_imaa009     LIKE imaa_t.imaa009
DEFINE l_sfaa006     LIKE sfaa_t.sfaa006
DEFINE l_xmdaud002   LIKE xmda_t.xmdaud002

   LET l_sfaadocno_t = g_sfaadocno    #161221-00056#1 add

   LET r_success = FALSE
   LET l_fs_fill = 'N'                      #161005-00038#1 add
   LET l_ooca002 = ''       #170618-00297#1 add
   LET l_ooca004 = ''       #170618-00297#1 add   
   #160727-00025#10 add-S
   LET l_chk = FALSE
   SELECT sfaa003 INTO l_sfaa003
     FROM sfaa_t 
    WHERE sfaadocno = g_sfaadocno
      AND sfaaent = g_enterprise
      AND sfaasite = g_site
   IF l_sfaa003 = '5' THEN #模具工单
      LET l_chk = TRUE
   END IF
#   IF cl_null(g_slip) THEN
#      CALL s_aooi200_get_slip(g_sfaadocno) RETURNING l_success,g_slip
#   END IF
#   LET l_chk = s_aooi200_chk_slip(g_site,'',g_slip,'asft304')
   #160727-00025#10 add-E
   #此料号无下阶bom料
   IF p_bmba.getLength() = 0 THEN     
      IF l_chk=FALSE THEN      #160727-00025#10 add
         LET g_num = 0
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00500'
         #170112-00039#1-s-mod
#         LET g_errparam.extend = 's_asft300_02_ins_sfba'
         LET g_errparam.extend = g_sfaa.sfaa010
         #170112-00039#1-e-mod
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      ELSE                    #160727-00025#10 add
         LET r_success = TRUE 
         RETURN r_success
      END IF
   END IF
   IF cl_null(g_slip) THEN
      CALL s_aooi200_get_slip(g_sfaadocno) RETURNING l_success,g_slip
   END IF
   #工單項次間隔數
   IF cl_null(g_d_mfg_0049) THEN
      LET g_d_mfg_0049 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0049')
   END IF
   IF cl_null(g_d_mfg_0049) OR g_d_mfg_0049 = 0 THEN
      LET g_d_mfg_0049 = 1
   END IF
   #工單備料數量是否考慮外加損耗率
   IF cl_null(g_d_mfg_0046) THEN
      LET g_d_mfg_0046 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0046')
   END IF
   #使用產品特徵
   IF cl_null(g_s_bas_0036) THEN
      LET g_s_bas_0036 = cl_get_para(g_enterprise,g_site,'S-BAS-0036')
   END IF
   #子工單開立方式
   IF cl_null(g_d_mfg_0025) THEN
      LET g_d_mfg_0025 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0025')
   END IF
   
   FOR l_i = 1 TO p_bmba.getLength()
      
      LET l_bmba005_1 = p_bmba[l_i].bmba005
      LET l_qty = p_bmba[l_i].l_qty * p_bmba[l_i].l_bmba011 / p_bmba[l_i].l_bmba012
      
      INITIALIZE l_bmba.* TO NULL
      LET l_bmbb011 = ''
      LET l_bmbb012 = ''
      EXECUTE s_asft300_02_ins_sfba_p1
        USING l_qty,l_qty,l_qty,g_enterprise,g_site,
              p_bmba[l_i].bmba001,p_bmba[l_i].bmba002,p_bmba[l_i].bmba003,
              p_bmba[l_i].bmba004,p_bmba[l_i].bmba007,p_bmba[l_i].bmba008,
              l_bmba005_1
         INTO l_bmba.bmba001,l_bmba.bmba002,l_bmba.bmba003,l_bmba.bmba004,l_bmba.bmba007,
              l_bmba.bmba008,l_bmba.bmba010,l_bmba.bmba013,l_bmba.bmba015,l_bmba.bmba016,
              l_bmba.bmba021,l_bmba.bmba022,l_bmba.bmba023,l_bmba.bmba024,l_bmba.bmba027,
              l_bmba.bmba028,l_bmba.bmba029,l_bmba.bmba030,l_bmba.bmba031,l_bmba.bmba032,
             #l_bmba.bmba033,l_bmba.bmba034,l_bmbb011,l_bmbb012                       #170307-00047#1 mark
              l_bmba.bmba033,l_bmba.bmba034,l_bmbb011,l_bmbb012,l_bmba011,l_bmba012   #170307-00047#1 add
      
      INITIALIZE g_sfba.* TO NULL
      
      LET g_sfba.sfbaent   = g_enterprise
      LET g_sfba.sfbasite  = g_site
      LET g_sfba.sfbadocno = g_sfaadocno
      
      #依生管模組參數工單項次間隔數自動增加
      EXECUTE s_asft300_02_ins_sfba_p2
        USING g_enterprise,g_site,g_sfba.sfbadocno
         INTO g_sfba.sfbaseq
      IF cl_null(g_sfba.sfbaseq) THEN
         LET g_sfba.sfbaseq = g_d_mfg_0049
      ELSE
         LET g_sfba.sfbaseq = g_sfba.sfbaseq + g_d_mfg_0049
      END IF
      #170811-00030#1 --s add
      LET l_bmba.bmba004 = p_bmba[l_i].bmba004
      LET l_bmba.bmba007 = p_bmba[l_i].bmba007
      LET l_bmba.bmba008 = p_bmba[l_i].bmba008
      #170811-00030#1 --e add      
      LET g_sfba.sfbaseq1 = 0
      LET g_sfba.sfba001  = l_bmba.bmba001
      LET g_sfba.sfba002  = l_bmba.bmba004
      LET g_sfba.sfba003  = l_bmba.bmba007
      LET g_sfba.sfba004  = l_bmba.bmba008
      LET g_sfba.sfba005  = l_bmba.bmba003
      LET g_sfba.sfba006  = l_bmba.bmba003
      LET g_sfba.sfba007  = l_bmba.bmba023
      LET g_sfba.sfba008  = l_bmba.bmba013
      LET g_sfba.sfba009  = l_bmba.bmba030
      LET g_sfba.sfba010  = p_bmba[l_i].l_bmba011
      LET g_sfba.sfba011  = p_bmba[l_i].l_bmba012
      
      #倒扣料
      IF g_sfaa.sfaa004 = '2' THEN
         LET g_sfba.sfba009 = 'Y'
      END IF
      LET l_qty = p_bmba[l_i].l_qty * p_bmba[l_i].l_bmba011 / p_bmba[l_i].l_bmba012
      #add by zhengjt20200708---s
      #解决裁切卷膜纸箱的标准应发量不对的问题
      IF l_bmba.bmba007 = 'LB' AND l_bmba.bmba003 LIKE 'BC%' THEN
         SELECT bmaa004 INTO l_bmaa004
           FROM bmaa_t
          WHERE bmaaent = g_enterprise
            AND bmaasite = g_site
            AND bmaa001 = p_bmba[l_i].bmba001
         IF l_bmaa004 = 'M' THEN
            SELECT imad005 INTO l_imad005
              FROM imad_t
             WHERE imadent = g_enterprise
               AND imad001 = p_bmba[l_i].bmba001
               AND imad004 = 'M'
            IF NOT cl_null(l_imad005) THEN LET l_qty = l_qty / l_imad005 END IF
            IF l_qty < 1 AND l_qty <> 0 THEN
               LET l_qty = 1
            ELSE
               CALL s_num_round('3',l_qty,0) RETURNING l_qty
            END IF
         END IF
      END IF
      #add by zhengjt20200708---e
      #171117-00048#1 add(s)
      #add by wangll171211---s
      #追单补足条件 
      LET l_bmba005 = ''
      SELECT bmba005 INTO l_bmba005
         FROM bmba_t
         WHERE bmbaent = g_enterprise AND bmbasite = g_site AND bmba001 =  l_bmba.bmba001 
         AND bmba002 = l_bmba.bmba002 AND bmba003 = l_bmba.bmba003 AND bmba004 = l_bmba.bmba004
        AND bmba007 = l_bmba.bmba007 AND bmba008 = l_bmba.bmba008 
      #add by wangll171211---e        
      IF l_bmba.bmba027 = 'Y' THEN
         CALL s_asft300_04_get_bmze003_value(l_bmba.bmba001,l_bmba.bmba003,l_bmba.bmba028,p_bmba[l_i].l_feature
                                               ,l_bmba.bmba002,l_bmba.bmba004,l_bmba005,l_bmba.bmba007,l_bmba.bmba008)  #add by wangll171211
                 RETURNING l_success,l_bmba011
         LET l_bmba012 = 1
      END IF
      #171117-00048#1 add(e)
      #liuym171120 add------s----
#      IF l_bmba.bmba027 = 'Y' THEN
#         CALL s_asft300_04_get_bmze003_value(l_bmba.bmba001,l_bmba.bmba003,l_bmba.bmba028,p_bmba[l_i].l_feature,l_bmba.bmba002,l_bmba.bmba004,l_bmba005_1,l_bmba.bmba007,l_bmba.bmba008)
#                 RETURNING l_success,g_sfba.sfba011
#         LET g_sfba.sfba012 = 1
#      END IF
      #liuym171120 add------e----  

      
      IF l_bmba.bmba033 = 'Y' THEN

         #mod by huna20170828---s增加参数
         #CALL s_asft300_04(g_sfaadocno,l_bmba.bmba001,l_bmba.bmba003,l_bmba.bmba034,p_bmba[l_i].l_feature,l_qty)
         #     RETURNING l_success,l_bmbb011
         CALL s_asft300_04(g_sfaadocno,l_bmba.bmba001,l_bmba.bmba003,l_bmba.bmba034,p_bmba[l_i].l_feature,l_qty
                          ,l_bmba.bmba002,l_bmba.bmba004,l_bmba005_1,l_bmba.bmba007,l_bmba.bmba008)
              RETURNING l_success,l_bmbb011    
         #mod by huna20170828---e
      END IF
      IF cl_null(l_bmbb011) THEN LET l_bmbb011 = 0 END IF
      IF cl_null(l_bmbb012) THEN LET l_bmbb012 = 0 END IF
      #BOM的損秏為內含損秏時，允許誤差率=BOM變動損秏率，如果為外加損秏則=0
      IF l_bmba.bmba029 = '1' THEN
         LET g_sfba.sfba012 = l_bmbb011
      ELSE
         LET g_sfba.sfba012 = 0
      END IF
      
      #160406-00004#1---mod---begin
      LET g_sfba.sfba023 = l_qty
      #add by wangll171222---s
      LET l_liaohao = ''
      LET l_imae032_w = ''
      LET l_imae033_w = ''
      LET l_bilv = 0
      SELECT UNIQUE substr(g_sfba.sfba006,-1) INTO l_liaohao FROM dual
      IF l_liaohao = 'L' THEN
         SELECT imae032,imae033 INTO l_imae032_w,l_imae033_w
            FROM imae_t 
            WHERE imaeent = g_enterprise AND imaesite = 'SY' AND imae001 = g_sfba.sfba006   #mod g_site -> 'SY' by zhengjt20200802
         IF cl_null(l_imae032_w) THEN LET l_imae032_w = g_sfba.sfba006 END IF #zhouxm180529 ADD    
         IF NOT cl_null(l_imae032_w) THEN
            SELECT ecbb022/ecbb031 INTO l_bilv
                FROM ecbb_t
                WHERE ecbbent = g_enterprise AND ecbbsite = 'SY' AND ecbb001 = l_imae032_w   #mod g_site -> 'SY' by zhengjt20200709
                AND ecbb002 = l_imae033_w AND ecbb010 = 'END'
            IF l_bilv > 0 THEN
               LET g_sfba.sfba023 = g_sfba.sfba023*l_bilv
               #add by zhengjt20200409   解决B05公式，宽项模数为3等 除不尽的情况
               IF l_bmba.bmba028 = 'B05' THEN
                  CALL s_num_round('1',g_sfba.sfba023,0) RETURNING g_sfba.sfba023
               END IF
               #add by zhengjt20200409   解决B05公式，宽项模数为3等 除不尽的情况
            END IF
            #zhouxm180529 add start
             IF l_bilv = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "比率为0"
               LET g_errparam.code   = ''
               LET g_errparam.popup  = TRUE
               CALL cl_err()
            END IF
            #zhouxm180529 add end             
         END IF
      END IF
      #add by wangll171222---e
      #IF l_bmba.bmba027='N' THEN
      #   LET g_sfba.sfba023=l_qty
      #ELSE
      #    CALL s_asft300_04(g_sfaadocno,l_bmba.bmba001,l_bmba.bmba003,l_bmba.bmba028) RETURNING l_success,l_sfba023
      #    IF l_success THEN
      #       LET g_sfba.sfba023=l_sfba023
      #    ELSE
      #       LET g_sfba.sfba023=0
      #    END IF
      #END IF
      #160406-00004#1---mod--end
      
      LET g_sfba.sfba014 = l_bmba.bmba010
      IF cl_null(g_sfba.sfba014) THEN
         SELECT imae081 INTO g_sfba.sfba014
           FROM imae_t
          WHERE imaeent = g_enterprise
            AND imaesite = g_site
            AND imae001 = g_sfba.sfba006
         IF cl_null(g_sfba.sfba014) THEN
            SELECT imaa006 INTO g_sfba.sfba014
              FROM imaa_t
             WHERE imaaent = g_enterprise
               AND imaa001 = g_sfba.sfba006
         END IF
      END IF

      #LET l_sfba023 = g_sfba.sfba023   #170504-00021#1 add  #170509-00016#1 mark
      
      #170509-00016#1-s mark
      ##若标准应发量发生改变了，则需回算QPA分子分母
      #CALL s_aooi250_take_decimals(g_sfba.sfba014,g_sfba.sfba023)
      #     RETURNING l_success,g_sfba.sfba023
      #170509-00016#1-e mark
     
      #160406-00004#1---mod---begin
      #IF g_sfba.sfba023 != l_qty THEN
      #   CALL s_asft300_02_qpa(p_bmba[l_i].l_qty,g_sfba.sfba023) RETURNING g_sfba.sfba010,g_sfba.sfba011
      #END IF
      #170307-00047#1 add --(S)--
      IF cl_null(l_bmba011) THEN LET l_bmba011 = 0 END IF
      IF cl_null(l_bmba012) THEN LET l_bmba012 = 0 END IF    
     #IF (g_prog = 'asft300' AND l_sfba023 != l_qty) OR          #170504-00021#1 add #若是asft300工單展備料,用小數進位前數量比對,避免因為進位判斷錯誤而回算QPA分子分母  #170509-00016#1 mark
      IF (g_prog = 'asft300' AND g_sfba.sfba023 != l_qty) OR     #170504-00021#1 mark  #170509-00016#1 remark
         (g_prog <> 'asft300') OR (l_bmba011 = 0 OR l_bmba012 = 0) THEN
      #170307-00047#1 add --(E)--
         CALL s_asft300_02_qpa(p_bmba[l_i].l_qty2,g_sfba.sfba023) RETURNING g_sfba.sfba010,g_sfba.sfba011
      #160406-00004#1---mod---end
      #170307-00047#1 add --(S)--
      ELSE
         LET g_sfba.sfba010 = l_bmba011
         LET g_sfba.sfba011 = l_bmba012
      END IF
      #170307-00047#1 add --(E)--
      
      IF l_bmba.bmba029 = '2' AND g_d_mfg_0046 = 'Y' THEN
         LET l_sfba013 = g_sfba.sfba023 * l_bmbb011 / 100 + l_bmbb012
      ELSE
         LET l_sfba013 = 0
      END IF
      LET g_sfba.sfba013 = g_sfba.sfba023 + l_sfba013
      CALL s_asft300_03(g_sfba.sfba006,g_sfba.sfba013) RETURNING l_success,l_sfba013
      IF l_success THEN
         LET g_sfba.sfba013 = l_sfba013
      END IF
      #mark by wangll171226---s
      #add by wangll171222---s
#      LET l_liaohao = ''
#      LET l_imae032_w = ''
#      LET l_imae033_w = ''
#      LET l_bilv = 0
#      SELECT UNIQUE substr(g_sfba.sfba006,-1) INTO l_liaohao FROM dual
#      IF l_liaohao = 'L' THEN
#         SELECT imae032,imae033 INTO l_imae032_w,l_imae033_w
#            FROM imae_t 
#            WHERE imaeent = g_enterprise AND imaesite = g_site AND imae001 = g_sfba.sfba006
#         SELECT ecbb022/ecbb031 INTO l_bilv
#             FROM ecbb_t
#             WHERE ecbbent = g_enterprise AND ecbbsite = g_site AND ecbb001 = l_imae032_w
#             AND ecbb002 = l_imae033_w AND ecbb010 = 'END'
#         LET g_sfba.sfba013 = l_sfba013*l_bilv
#      END IF
      #add by wangll171222---e
      #mark by wangll171226---e
      #单位取位
      #170618-00297#1-s mod
#      CALL s_aooi250_take_decimals(g_sfba.sfba014,g_sfba.sfba013)
#           RETURNING l_success,g_sfba.sfba013      
      CALL s_aooi250_get_msg(g_sfba.sfba014) RETURNING l_success,l_ooca002,l_ooca004
      IF l_success THEN
         #依據傳入的數量進行取位
         CALL s_num_round('4',g_sfba.sfba013,l_ooca002) RETURNING g_sfba.sfba013
      ELSE
         LET r_success = FALSE
      END IF
      #170618-00297#1-e mod 
      
      #代買料
      IF l_bmba.bmba022 = 'Y' THEN 
         LET g_sfba.sfba015 = g_sfba.sfba013
      ELSE
         LET g_sfba.sfba015 = 0
      END IF
      
      LET g_sfba.sfba016  = 0
      LET g_sfba.sfba017  = 0
      LET g_sfba.sfba018  = 0
      LET g_sfba.sfba019  = l_bmba.bmba015
      LET g_sfba.sfba020  = l_bmba.bmba016
      LET g_sfba.sfba021  = p_bmba[l_i].l_inam002
      LET g_sfba.sfba022  = 1
      LET g_sfba.sfba024  = g_sfba.sfba013 - g_sfba.sfba023
      LET g_sfba.sfba025  = 0
      LET g_sfba.sfba026  = '1'
      LET g_sfba.sfba028  = l_bmba.bmba031
      LET g_sfba.sfba030  = l_bmba.bmba032
      LET g_sfba.sfba033  = p_bmba[l_i].bmba035   #160512-00016#14 20160527 add by ming
      #add by shenyc20200801 分公司据点的片材自动带出总部派工单号作为库存管理特征
      IF g_site <> 'SY' THEN
         SELECT imaa009 INTO l_imaa009
         FROM imaa_t
         WHERE imaa001 = g_sfba.sfba006
         AND imaaent = g_enterprise
         IF (l_imaa009[1,1] = '1' OR l_imaa009[1,1] = '2') AND l_imaa009 <> '203' AND l_imaa009 <> '204' THEN #片材
             #根据工单号查找订单号
             SELECT sfaa006 INTO l_sfaa006
             FROM sfaa_t
             WHERE sfaadocno = g_sfaadocno
             AND sfaaent = g_enterprise
             
             SELECT xmdaud002 INTO l_xmdaud002
             FROM xmda_t
             WHERE xmdadocno = l_sfaa006
             AND xmdaent = g_enterprise
             AND xmdasite = g_site
             
             LET g_sfba.sfba030 = l_xmdaud002
         END IF         
      END IF 
      #add by shenyc20200801 分公司据点的片材自动带出总部派工单号作为库存管理特征
      
      #170226-00002#1-s
      IF cl_null(g_sfba.sfba019) THEN
         LET g_sfba.sfba019 = g_d_mfg_0076
      END IF
      #170226-00002#1-e
      #同一料号不同特征当做取替代处理
      IF g_s_bas_0036 = 'Y' THEN
         LET l_sfbaseq = ''
         LET l_sfbaseq1 = ''
         EXECUTE s_asft300_02_ins_sfba_p3
           USING g_enterprise,g_site,g_sfba.sfbadocno,g_sfba.sfba001,g_sfba.sfba002,g_sfba.sfba003,g_sfba.sfba004,g_sfba.sfba005
            INTO l_sfbaseq,l_sfbaseq1
         IF NOT cl_null(l_sfbaseq) AND l_sfbaseq > 0 THEN
            LET g_sfba.sfba022 = 1
            LET g_sfba.sfba010 = 0
            LET g_sfba.sfba011 = 0
            LET g_sfba.sfba023 = 0
            LET g_sfba.sfba024 = 0
            LET g_sfba.sfbaseq = l_sfbaseq
            LET g_sfba.sfbaseq1= l_sfbaseq1 + 1
            #更新项序为0的标准应发量
            UPDATE sfba_t
               SET sfba023 = sfba023 + g_sfba.sfba013 
             WHERE sfbaent = g_enterprise
               AND sfbasite = g_site
               AND sfbadocno = g_sfba.sfbadocno
               AND sfbaseq = g_sfba.sfbaseq
               AND sfbaseq1 = 0
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = "UPDATE sfba_t:",SQLERRMESSAGE
               LET g_errparam.code   = SQLCA.sqlcode
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               RETURN r_success
            END IF
         END IF
      END IF
      #add by huna20170719---s
      LET l_sfbaud002 = ''
      LET l_sfbaud011 = 0  #add sfbaud011 by huna20170720
      LET l_sfbaud012 = 0
      LET l_sfbaud013 = 0
      SELECT bmbaud002,bmbaud011,bmbaud012,bmbaud013              #add bmbaud011 by huna20170720 
        INTO l_sfbaud002,l_sfbaud011,l_sfbaud012,l_sfbaud013      #add l_sfbaud011 by huna20170720
        FROM bmba_t
       WHERE bmbaent = g_enterprise
         AND bmbasite = g_site
         AND bmba001 = l_bmba.bmba001
         AND bmba002 = l_bmba.bmba002
         AND bmba003 = l_bmba.bmba003
         AND bmba004 = l_bmba.bmba004 
         AND bmba007 = l_bmba.bmba007
         AND bmba008 = l_bmba.bmba008
      #add by huna20171107---s 如果加上部位编号+作业编号+作业序查不到数据，则可能是虚拟件，从上阶料号带的作业编号和作业序，所以去掉作业编号+作业序条件试一下
      IF STATUS = 100  THEN
         SELECT bmbaud002,bmbaud011,bmbaud012,bmbaud013              #add bmbaud011 by huna20170720 
           INTO l_sfbaud002,l_sfbaud011,l_sfbaud012,l_sfbaud013      #add l_sfbaud011 by huna20170720
           FROM bmba_t
          WHERE bmbaent = g_enterprise
            AND bmbasite = g_site
            AND bmba001 = l_bmba.bmba001
            AND bmba002 = l_bmba.bmba002
            AND bmba003 = l_bmba.bmba003
      END IF 
      #add by huna20171107---e
      
      #add by huna20170719---e
      #add by huna20171202---s  养生时间根据上层bom带出
      IF l_sfbaud013 > 0 THEN  #只有涂布量大于0的时候，养生时间 才可有值
          LET l_today = cl_get_current()
          LET l_today_1 = l_today
          LET l_sql1 = #mod by huna20171221---s
                       #"   SELECT DISTINCT bmbaud002,bmbaud011                                                               ", #add bmbaud011 by huna20171213 厚度也要根据上阶带出
                       #"   FROM (SELECT bmba009,bmba001,bmba003,bmbaud002,bmbaud011                                          ", #add bmbaud011 by huna20171213 厚度也要根据上阶带出
                       "   SELECT DISTINCT bmbaud002                                                                         ",
                       "   FROM (SELECT bmba009,bmba001,bmba003,bmbaud002                                                    ",
                       #mod by huna20171221---e
                       "           FROM bmba_t,bmaa_t                                                                        ",
                       "          WHERE bmaaent = bmbaent                                                                    ",
                       "            AND bmaasite = bmbasite                                                                  ",
                       "            AND bmaa001 = bmba001                                                                    ",
                       "            AND bmaa002 = bmba002                                                                    ",
                       "            AND bmbaent = ",g_enterprise,"                                                           ",
                       "            AND bmbasite = '",g_site,"'                                                              ",
                       "            AND bmba002 = '",l_bmba.bmba002,"'                                                       ",
                       "            AND bmba003 = '",l_bmba.bmba001,"'                                                       ",
                       "            AND bmba004 = '",l_bmba.bmba004,"'                                                       ",
                       "            AND bmba007 = '",l_bmba.bmba007,"'                                                       ",
                       "            AND bmba008 = '",l_bmba.bmba008,"'                                                       ",                   
                       "            AND to_char(bmba005,'YYYY-MM-DD hh24:mi:ss') <= '",l_today_1,"'                          ",
                       "            AND (bmba006 IS NULL OR to_char(bmba006,'YYYY-MM-DD hh24:mi:ss') > '",l_today_1,"' ))    ",
                       "   WHERE  1=1                                                                                        ",
                       "   CONNECT BY PRIOR  bmba003 = bmba001   START WITH bmba001 =  '",g_sfaa010,"'                       "
          
          PREPARE gen_bmbaud001_pre01 FROM l_sql1
          DECLARE gen_bmbaud001_cs01 CURSOR FOR gen_bmbaud001_pre01
          LET l_bmbaud002 = ''
          #LET l_bmbaud011 = 0                                        #add l_bmbaud011 by huna20171213  #mark by huna20171221        
          EXECUTE gen_bmbaud001_cs01 INTO l_bmbaud002                 #add l_bmbaud011 by huna20171213  #mod by huna20171221 去掉,l_bmbaud011 
          LET l_sfbaud002 = l_bmbaud002
          #LET l_sfbaud011 = l_bmbaud011                              #add l_bmbaud011 by huna20171213  #mark by huna20171221
      ELSE
          LET l_sfbaud002 = '' 
          #LET l_sfbaud011 = ''                                       #add l_bmbaud011 by huna20171213  #mark by huna20171221 
      END IF       
      #add by huna20171202---e
      #add by huna20171221---s厚度先按之前的逻辑抓取本阶的厚度，如果抓到为0，再走
      IF cl_null(l_sfbaud011) OR l_sfbaud011 = 0 THEN 
          LET l_today = cl_get_current()
          LET l_today_1 = l_today
          LET l_sql1 = "   SELECT DISTINCT bmbaud011                                                                         ",
                       "   FROM (SELECT bmba009,bmba001,bmba003,bmbaud011,bmba004,bmba007,bmba008,bmba021                    ",
                       "           FROM bmba_t,bmaa_t                                                                        ",
                       "          WHERE bmaaent = bmbaent                                                                    ",
                       "            AND bmaasite = bmbasite                                                                  ",
                       "            AND bmaa001 = bmba001                                                                    ",
                       "            AND bmaa002 = bmba002                                                                    ",
                       "            AND bmbaent = ",g_enterprise,"                                                           ",
                       "            AND bmbasite = '",g_site,"'                                                              ",
                       "            AND bmba002 = '",l_bmba.bmba002,"'                                                       ",                  
                       "            AND to_char(bmba005,'YYYY-MM-DD hh24:mi:ss') <= '",l_today_1,"'                          ",
                       "            AND (bmba006 IS NULL OR to_char(bmba006,'YYYY-MM-DD hh24:mi:ss') > '",l_today_1,"' ))    ",
                       "   WHERE  1=1 AND bmba003 = '",l_bmba.bmba001,"'   AND bmba004 = '",l_bmba.bmba004,"'                ",
                       "              AND bmba007 = '",l_bmba.bmba007,"'   AND bmba008 = '",l_bmba.bmba008,"'                ",
                       "              AND bmba021 = '3'       ",  #工单展开选项为 【展开】                       
                       "   CONNECT BY PRIOR  bmba003 = bmba001   START WITH bmba001 =  '",g_sfaa010,"'                       "
          
          PREPARE gen_bmbaud001_pre02 FROM l_sql1
          DECLARE gen_bmbaud001_cs02 CURSOR FOR gen_bmbaud001_pre02
          LET l_bmbaud011 = 0                                             
          EXECUTE gen_bmbaud001_cs02 INTO l_bmbaud011 
          IF NOT cl_null(l_bmbaud011) AND l_bmbaud011 > 0 THEN          
             LET l_sfbaud011 = l_bmbaud011  
          END IF              
      END IF 
      #add by huna20171221---e
      #add by shenyc20201111 W07的工单默认全是倒扣料
      IF g_sfba.sfbadocno[3,5] = 'W07' THEN
         LET g_sfba.sfba009 = 'Y'
      END IF 
      #add by shenyc20201111 W07的工单默认全是倒扣料
      EXECUTE s_asft300_02_ins_sfba_p
        USING g_sfba.sfbaent,g_sfba.sfbasite,g_sfba.sfbadocno,g_sfba.sfbaseq,g_sfba.sfbaseq1,
              g_sfba.sfba001,g_sfba.sfba002,g_sfba.sfba003,g_sfba.sfba004,g_sfba.sfba005,
              g_sfba.sfba006,g_sfba.sfba007,g_sfba.sfba008,g_sfba.sfba009,g_sfba.sfba010,
              g_sfba.sfba011,g_sfba.sfba012,g_sfba.sfba013,g_sfba.sfba014,g_sfba.sfba015,
              g_sfba.sfba016,g_sfba.sfba017,g_sfba.sfba018,g_sfba.sfba019,g_sfba.sfba020,
              g_sfba.sfba021,g_sfba.sfba022,g_sfba.sfba023,g_sfba.sfba024,g_sfba.sfba025,
              g_sfba.sfba026,g_sfba.sfba028,g_sfba.sfba030,g_sfba.sfba033
             ,l_sfbaud002,l_sfbaud011,l_sfbaud012,l_sfbaud013  #add by huna20170719   #add l_sfbaud011 by huna20170720
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT sfba_t:",SQLERRMESSAGE
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      
      #写入bom单身备注至备料单身
     #CALL s_aooi360_sel('5',g_site,l_bmba.bmba001,l_bmba.bmba002,l_bmba.bmba003,l_bmba.bmba004,l_bmba005_1,l_bmba.bmba007,l_bmba.bmba008,'','','4')   #170322-00069#1 mark
      CALL s_aooi360_sel('5',g_site,l_bmba.bmba001,l_bmba.bmba002,l_bmba.bmba003,l_bmba.bmba004,'',l_bmba.bmba007,l_bmba.bmba008,'','','4')            #170322-00069#1 add
           RETURNING l_success,l_ooff013
      IF NOT cl_null(l_ooff013) THEN
         CALL s_aooi360_gen('7',g_sfba.sfbadocno,g_sfba.sfbaseq,g_sfba.sfbaseq1,' ',' ',' ',' ',' ',' ',' ','2',l_ooff013) 
              RETURNING l_success
      END IF
      
      LET l_num = g_num
      
      #产生子工单
      IF l_bmba.bmba021 = '2' THEN
         #160120-00027 by whitney modify start
         IF g_d_mfg_0025 = '1' THEN
           #161005-00038#1 mark --(S)--        
           #CALL s_asfp401(g_sfaadocno,g_sfaa.sfaadocdt,'Y') RETURNING l_success,l_n
           #IF NOT l_success THEN
           #   RETURN r_success
           #END IF
           #161005-00038#1 mark --(E)-- 
           LET l_fs_fill = 'Y'     #161005-00038#1 add
         ELSE
            IF NOT s_asft300_02_gen_children(g_sfba.sfbadocno,g_sfba.sfbaseq,g_sfba.sfbaseq1) THEN
               RETURN r_success
            END IF
         END IF
         #160120-00027 by whitney modify end
      END IF
      
      #自动取替代
      IF g_sfba.sfbaseq1 = 0 THEN
         IF NOT s_asft300_02_replace(g_sfba.sfbadocno,g_sfba.sfbaseq,g_sfba.sfbaseq1,l_bmba.bmba024) THEN
            RETURN r_success
         END IF
      END IF
      
      LET g_num = l_num
      LET g_num = g_num + 1
      LET g_sfaadocno = l_sfaadocno_t   #161221-00056#1 add
   END FOR
   
   #161005-00038#1 add --(S)--   
   IF l_fs_fill = 'Y' THEN   
      CALL s_asfp401(g_sfaadocno,g_sfaa.sfaadocdt,'Y') RETURNING l_success,l_n
      IF NOT l_success THEN
         IF NOT cl_ask_confirm("asf-00855") THEN        #170331-00078 add
            RETURN r_success
         END IF                                         #170331-00078 add    
      END IF
   END IF   
   #161005-00038#1 add --(E)-- 
           
   LET r_success = TRUE
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 工单备料产生元件
# Memo...........:
# Usage..........: CALL s_asft300_02(p_sfaadocno,p_sfaa003,p_sfaa010,p_sfaa011,p_sfaa015,p_sfaa012,p_type)
#                  RETURNING r_success,r_num
# Input parameter: 1.p_sfaadocno  工单单号
#                : 2.p_sfaa003    工单形态
#                : 3.p_sfaa010    生产料号
#                : 4.p_sfaa011    产品特征
#                : 5.p_sfaa015    BOM有效日期
#                : 6.p_sfaa012    生产数量
#                : 7.p_type       展到尾阶（Y/N)  
# Return code....: 1.r_success    处理状态
#                : 2.r_num        备料笔数
# Date & Author..: 2014/1/26 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02(p_sfaadocno,p_sfaa003,p_sfaa010,p_sfaa011,p_sfaa015,p_sfaa012,p_type)
DEFINE p_sfaadocno  LIKE sfaa_t.sfaadocno
DEFINE p_sfaa003    LIKE sfaa_t.sfaa003
DEFINE p_sfaa010    LIKE sfaa_t.sfaa010
DEFINE p_sfaa011    LIKE sfaa_t.sfaa011
#DEFINE p_sfaa015    LIKE sfaa_t.sfaa015       #BOM有效日期 170215-00015#1---mark--接收的时分秒是00：00：00
DEFINE p_sfaa015    DATETIME YEAR TO SECOND   #BOM有效日期 #170215-00015#1---add---接收具体的时分秒
DEFINE p_sfaa012    LIKE sfaa_t.sfaa012
DEFINE p_type       LIKE type_t.chr1
DEFINE r_success    LIKE type_t.num5
DEFINE r_num        LIKE type_t.num5
DEFINE l_success    LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5
DEFINE l_flag       LIKE type_t.chr1
DEFINE l_bmba       DYNAMIC ARRAY OF type_bmba
DEFINE l_bmba_qty   DYNAMIC ARRAY OF type_bmba_qty
DEFINE l_sfac       RECORD
    sfac003    LIKE sfac_t.sfac003,
    sfac006    LIKE sfac_t.sfac006,
    sfac007    LIKE sfac_t.sfac007
                END RECORD
DEFINE l_i          LIKE type_t.num5
DEFINE l_j          LIKE type_t.num5
DEFINE l_flag1      LIKE type_t.chr1
DEFINE l_num_t      LIKE type_t.num5
DEFINE l_num        LIKE type_t.num5
DEFINE l_sfaa       DYNAMIC ARRAY OF RECORD
    sfaadocno  LIKE sfaa_t.sfaadocno,
    sfaa003    LIKE sfaa_t.sfaa003,
    sfaa010    LIKE sfaa_t.sfaa010,
    sfaa011    LIKE sfaa_t.sfaa011,
    sfaa015    LIKE sfaa_t.sfaa015,
    sfaa012    LIKE sfaa_t.sfaa012
                END RECORD
DEFINE l_ooba002    LIKE ooba_t.ooba002      #160727-00025#10 add
#DEFINE l_count      LIKE type_t.num5         #170210-00054#1  #170411-00043#1 mark
DEFINE l_imaa005 LIKE imaa_t.imaa005          #170417-00001#1 add
#add by huna20171204---s
DEFINE l_imaa009             LIKE imaa_t.imaa009
DEFINE l_imaal004            LIKE imaal_t.imaal004
DEFINE l_num1                LIKE type_t.num10 
DEFINE l_num2                LIKE type_t.num10 
DEFINE l_sfbguc006           LIKE sfbguc_t.sfbguc006
DEFINE l_sfaaud002           LIKE sfaa_t.sfaaud001
DEFINE l_sfaaud011           LIKE sfaa_t.sfaaud011
#add by huna20171204---e
DEFINE z_sfba030        LIKE sfba_t.sfba030        #库存管理特征   zhengjt20201112
DEFINE z_sfaadocno      LIKE sfaa_t.sfaadocno      #总部据点工单号 zhengjt20201112
DEFINE z_num            LIKE type_t.num10          #zhengjt20201112
DEFINE l_z              LIKE type_t.num5           #zhengjt20201112
DEFINE z_success        LIKE type_t.num5           #zhengjt20201112
   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      RETURN r_success,''
   END IF
   #add by zhengjt20201112---s
   #分公司据点产生工单备料档
   SELECT xmdaud002,xmdaud003 INTO z_sfba030,z_sfaadocno
     FROM xmda_t
     LEFT JOIN sfaa_t ON sfaaent = xmdaent AND sfaa006 = xmdadocno
     WHERE sfaaent = g_enterprise
       AND sfaadocno = p_sfaadocno
   SELECT COUNT(*) INTO l_z
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaadocno = z_sfaadocno
   IF l_z > 0 THEN
      CALL s_asft300_02_ins_sfba2(p_sfaadocno,z_sfba030,z_sfaadocno) RETURNING z_success,z_num
      IF z_success THEN
         LET r_success = TRUE
         RETURN r_success,z_num
      ELSE
         RETURN r_success,0
      END IF
   END IF
   #add by zhengjt20201112---e
   #参数为空
   IF cl_null(p_sfaadocno) OR
      cl_null(p_sfaa003) OR
      cl_null(p_sfaa010) OR
      cl_null(p_sfaa012) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00110'
      LET g_errparam.extend = 's_asft300_02'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success,''
   END IF
   
   IF cl_null(p_sfaa011) THEN
      LET p_sfaa011 = ' '
   END IF
   
   LET g_sfaadocno = p_sfaadocno
   LET g_sfaa003 = p_sfaa003
   LET g_sfaa010 = p_sfaa010
   LET g_sfaa011 = p_sfaa011
   LET g_sfaa012 = p_sfaa012
   
   #160805-00023 by whitney add start
   CALL s_asft300_02_prepare()
   CALL s_aooi200_get_slip(g_sfaadocno) RETURNING l_success,g_slip
   #工單項次間隔數
   LET g_d_mfg_0049 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0049')
   #工單備料數量是否考慮外加損耗率
   LET g_d_mfg_0046 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0046')
   #使用產品特徵
   LET g_s_bas_0036 = cl_get_para(g_enterprise,g_site,'S-BAS-0036')
   #子工單開立方式
   LET g_d_mfg_0025 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0025')
   #自動取代
   LET g_d_mfg_0047 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0047')
   #自動替代
   LET g_d_mfg_0048 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0048')
   #限定足額自動取替代？
   LET g_d_mfg_0073 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0073')
   #預設庫位  #170226-00002#1
   LET g_d_mfg_0076 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0076')  #170226-00002#1
   #160805-00023 by whitney add end
   
   INITIALIZE g_sfaa.* TO NULL
   #add by huna20171204---s
   LET l_sfaaud002 = ''
   LET l_sfaaud011 = 0
   #add by huna20171204---e
   #161227-00031#1-s-mod
#   SELECT sfaadocdt,sfaa004,sfaa009,sfaa010,sfaa011,sfaa012,sfaa013,sfaa015,sfaa020,sfaa021,sfaa072
#     INTO g_sfaa.sfaadocdt,g_sfaa.sfaa004,g_sfaa.sfaa009,g_sfaa.sfaa010,g_sfaa.sfaa011,g_sfaa.sfaa012,g_sfaa.sfaa013,g_sfaa.sfaa015,g_sfaa.sfaa020,g_sfaa.sfaa021,g_sfaa.sfaa072
   SELECT sfaadocdt,sfaa004,sfaa009,sfaa010,sfaa011,sfaa012,sfaa013,sfaa015,sfaa019,sfaa020,sfaa021,sfaa072
          ,sfaaud002,sfaaud011    #add by huna20171204 
     INTO g_sfaa.sfaadocdt,g_sfaa.sfaa004,g_sfaa.sfaa009,g_sfaa.sfaa010,g_sfaa.sfaa011,g_sfaa.sfaa012,g_sfaa.sfaa013,g_sfaa.sfaa015,g_sfaa.sfaa019,g_sfaa.sfaa020,g_sfaa.sfaa021,g_sfaa.sfaa072 
         ,l_sfaaud002,l_sfaaud011    #add by huna20171204 
   #161227-00031#1-e-mod   
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaasite = g_site
      AND sfaadocno = g_sfaadocno
   #不存在符合条件的工单！
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00002'
      LET g_errparam.extend = g_sfaadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success,''
   END IF
   #add by huna20171204---s如果是膜类的料号，则展BOM时，要展维护的吹膜配方的BOM.
   IF NOT cl_null(l_sfaaud002) THEN
      IF cl_null(l_sfaaud011) THEN LET l_sfaaud011 = 0 END IF 
      #膜类（分类码为302）原料
      LET l_imaa009 = ''
      LET l_imaal004 = ''
      SELECT imaa009,imaal004 INTO l_imaa009,l_imaal004
        FROM imaa_t LEFT OUTER JOIN imaal_t ON imaalent = g_enterprise AND imaal001 = imaa001 AND imaal002 = g_dlang
       WHERE imaaent = g_enterprise AND imaa001 = g_sfaa.sfaa010
      IF l_imaa009 = '302'  THEN
          LET g_sfaa.sfaa010 = l_sfaaud002    #展吹膜配方的BOM 
          
          LET l_num1 = l_imaal004[1,3]
          LET l_num2 = l_imaal004[4,7]       
          IF cl_null(l_num1) THEN LET l_num1 = 0 END IF 
          IF cl_null(l_num2) THEN LET l_num2 = 0 END IF
          #生产数量 = 生产物料规格前3位数*后4位数 * 生产数量*(1+损耗率/100)*十的负六次方 
          LET g_sfaa.sfaa012 = g_sfaa.sfaa012 *(l_num1 * l_num2 *(1+l_sfaaud011/100)) * 0.000001  
      END IF 
   END IF 
   #add by huna20171204---e
   #add by wuxja  20140919
   #判断工单来源是否有订单，若有，在展bom的时候，可选件要在订单内有被选择的才可展出
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM sfab_t
    WHERE sfabent = g_enterprise
      AND sfabsite = g_site 
      AND sfabdocno = g_sfaadocno
      AND sfab001 = '2'  #订单
   IF l_n > 0 THEN
      LET l_flag = 'Y'
   ELSE
      LET l_flag = 'N'
   END IF
   
   LET g_num = 0
   
   #特征  #add by wuxja  20140919
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM sfac_t 
    WHERE sfacent = g_enterprise
      AND sfacsite = g_site
      AND sfacdocno = g_sfaadocno
      AND sfac006 IS NOT NULL AND sfac006 != ' '
     #160701-00010#1 -s mod
     #AND (sfac002 = '1' OR sfac002 = '2')  #一般或聯產品
      AND (sfac002 = '1' OR sfac002 = '2' OR sfac002 = '4')  #一般或聯產品或拆件式入庫
     #160701-00010#1 -e mod
   
   IF g_sfaa003='2' OR g_sfaa003='3' THEN  #2.重工工單,3.拆件式工單
      IF l_n = 0 THEN
         SELECT imaa005 INTO l_imaa005 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = g_sfaa.sfaa010  #170417-00001#1 add
         #160701-00010#1 add --(S)--
         IF g_sfaa003 = '2' THEN 
         #160701-00010#1 add --(E)--         
            CALL s_asft300_02_rd(g_sfaa.sfaa012,' ')
         #160701-00010#1 add --(S)--
         ELSE
           #IF g_inam1.getLength() > 0 AND g_inam1[1].inam004 > 0 THEN                                #170417-00001#1 mark               
            IF g_inam1.getLength() > 0 AND g_inam1[1].inam004 > 0 AND (NOT cl_null(l_imaa005)) THEN   #170417-00001#1 add
               FOR l_i = 1 TO g_inam1.getLength()
                   CALL s_asft300_02_rd(g_inam1[l_i].inam004,g_inam1[l_i].inam002)
               END FOR 
            ELSE
               CALL s_asft300_02_rd(g_sfaa.sfaa012,' ')            
            END IF
         END IF
         #160701-00010#1 add --(E)--         
      ELSE
         INITIALIZE l_sfac.* TO NULL
         FOREACH s_asft300_02_c1
           USING g_enterprise,g_site,g_sfaadocno
            INTO l_sfac.sfac006,l_sfac.sfac007,l_sfac.sfac003
            CALL s_asft300_02_rd(l_sfac.sfac003,l_sfac.sfac006)
         END FOREACH
      END IF
   ELSE
      IF l_n = 0 THEN
         CALL s_asft300_02_bom(0,g_sfaa.sfaa010,g_sfaa.sfaa011,g_sfaa.sfaa013,1,1,p_sfaa015,p_type,'',' ',l_flag,g_sfaa.sfaa072)      #170215-00015#1-----g_sfaa.sfaa015--改为--p_sfaa015----这样会有时分秒而g_sfaa.sfaa015只是日期不带时分秒 
              RETURNING l_bmba
         FOR l_i = 1 TO l_bmba.getLength()
            LET l_bmba_qty[l_i].bmba001   = l_bmba[l_i].bmba001
            LET l_bmba_qty[l_i].bmba002   = l_bmba[l_i].bmba002
            LET l_bmba_qty[l_i].bmba003   = l_bmba[l_i].bmba003
            LET l_bmba_qty[l_i].bmba004   = l_bmba[l_i].bmba004
            LET l_bmba_qty[l_i].bmba005   = l_bmba[l_i].bmba005
            LET l_bmba_qty[l_i].bmba007   = l_bmba[l_i].bmba007
            LET l_bmba_qty[l_i].bmba008   = l_bmba[l_i].bmba008
            LET l_bmba_qty[l_i].bmba035   = l_bmba[l_i].bmba035
            #LET l_bmba_qty[l_i].l_bmba011 = l_bmba[l_i].l_bmba011  #160406-00004#1  mark     
            #LET l_bmba_qty[l_i].l_bmba012 = l_bmba[l_i].l_bmba012  #160406-00004#1  mark     
            LET l_bmba_qty[l_i].l_inam002 = l_bmba[l_i].l_inam002
           #LET l_bmba_qty[l_i].l_qty     = g_sfaa.sfaa012         #160406-00004#1  mark
            #160406-00004#1---add---begin
            LET l_bmba_qty[l_i].l_qty     = g_sfaa.sfaa012 * l_bmba[l_i].l_bmba011/l_bmba[l_i].l_bmba012
            LET l_bmba_qty[l_i].l_bmba011 = 1     
            LET l_bmba_qty[l_i].l_bmba012 = 1    
            LET l_bmba_qty[l_i].l_qty2    = g_sfaa.sfaa012
            LET l_bmba_qty[l_i].l_feature = g_bmba_feature[l_i].l_feature
            #160406-00004#1---add---end
         END FOR
      ELSE
         INITIALIZE l_sfac.* TO NULL
         FOREACH s_asft300_02_c1
           USING g_enterprise,g_site,g_sfaadocno
            INTO l_sfac.sfac006,l_sfac.sfac007,l_sfac.sfac003
            CALL s_asft300_02_bom(0,g_sfaa.sfaa010,g_sfaa.sfaa011,g_sfaa.sfaa013,1,1,g_sfaa.sfaa015,p_type,'',l_sfac.sfac006,l_flag,l_sfac.sfac007) 
                 RETURNING l_bmba
            IF l_bmba_qty.getLength() = 0 THEN
               FOR l_i = 1 TO l_bmba.getLength()
                  LET l_bmba_qty[l_i].bmba001   = l_bmba[l_i].bmba001
                  LET l_bmba_qty[l_i].bmba002   = l_bmba[l_i].bmba002
                  LET l_bmba_qty[l_i].bmba003   = l_bmba[l_i].bmba003
                  LET l_bmba_qty[l_i].bmba004   = l_bmba[l_i].bmba004
                  LET l_bmba_qty[l_i].bmba005   = l_bmba[l_i].bmba005
                  LET l_bmba_qty[l_i].bmba007   = l_bmba[l_i].bmba007
                  LET l_bmba_qty[l_i].bmba008   = l_bmba[l_i].bmba008
                  LET l_bmba_qty[l_i].bmba035   = l_bmba[l_i].bmba035
                  #LET l_bmba_qty[l_i].l_bmba011 = l_bmba[l_i].l_bmba011  #160406-00004#1  mark     
                  #LET l_bmba_qty[l_i].l_bmba012 = l_bmba[l_i].l_bmba012  #160406-00004#1  mark    
                  LET l_bmba_qty[l_i].l_inam002 = l_bmba[l_i].l_inam002
                 #LET l_bmba_qty[l_i].l_qty     = l_sfac.sfac003         #160406-00004#1  mark
                  #160406-00004#1---add---begin
                  LET l_bmba_qty[l_i].l_qty     = l_sfac.sfac003 * l_bmba[l_i].l_bmba011/l_bmba[l_i].l_bmba012
                  LET l_bmba_qty[l_i].l_bmba011 = 1              
                  LET l_bmba_qty[l_i].l_bmba012 = 1              
                  LET l_bmba_qty[l_i].l_qty2    = l_sfac.sfac003
                  LET l_bmba_qty[l_i].l_feature = g_bmba_feature[l_i].l_feature
                  #160406-00004#1---add---end               
               END FOR
            ELSE
               FOR l_i = 1 TO l_bmba.getLength()
                  LET l_flag1 = 'N'
                  FOR l_j = 1 TO l_bmba_qty.getLength()
                     IF l_bmba_qty[l_j].bmba001   = l_bmba[l_i].bmba001 AND 
                        l_bmba_qty[l_j].bmba002   = l_bmba[l_i].bmba002 AND
                        l_bmba_qty[l_j].bmba003   = l_bmba[l_i].bmba003 AND
                        l_bmba_qty[l_j].bmba004   = l_bmba[l_i].bmba004 AND
                        l_bmba_qty[l_j].bmba005   = l_bmba[l_i].bmba005 AND
                        l_bmba_qty[l_j].bmba007   = l_bmba[l_i].bmba007 AND
                        l_bmba_qty[l_j].bmba008   = l_bmba[l_i].bmba008 AND
                        l_bmba_qty[l_j].l_inam002 = l_bmba[l_i].l_inam002 THEN
                       #LET l_bmba_qty[l_j].l_qty     = l_bmba_qty[l_j].l_qty + l_sfac.sfac003  #160406-00004#1
                        #160406-00004#1---mark---begin
                        LET l_bmba_qty[l_j].l_qty     = l_bmba_qty[l_j].l_qty + l_sfac.sfac003 * l_bmba[l_i].l_bmba011/l_bmba[l_i].l_bmba012
                        LET l_bmba_qty[l_j].l_bmba011 = 1     
                        LET l_bmba_qty[l_j].l_bmba012 = 1     
                        LET l_bmba_qty[l_j].l_qty2    = l_bmba_qty[l_j].l_qty2 + l_sfac.sfac003
                        #160406-00004#1---mark---end
                        LET l_flag1 = 'Y'
                        EXIT FOR
                     END IF
                  END FOR
                  IF l_flag1 = 'N' THEN
                     LET l_j = l_bmba_qty.getLength() + 1
                     LET l_bmba_qty[l_j].bmba001   = l_bmba[l_i].bmba001
                     LET l_bmba_qty[l_j].bmba002   = l_bmba[l_i].bmba002
                     LET l_bmba_qty[l_j].bmba003   = l_bmba[l_i].bmba003
                     LET l_bmba_qty[l_j].bmba004   = l_bmba[l_i].bmba004
                     LET l_bmba_qty[l_j].bmba005   = l_bmba[l_i].bmba005
                     LET l_bmba_qty[l_j].bmba007   = l_bmba[l_i].bmba007
                     LET l_bmba_qty[l_j].bmba008   = l_bmba[l_i].bmba008
                     LET l_bmba_qty[l_j].bmba035   = l_bmba[l_i].bmba035
                    #LET l_bmba_qty[l_j].l_bmba011 = l_bmba[l_i].l_bmba011  #160406-00004#1  mark
                    #LET l_bmba_qty[l_j].l_bmba012 = l_bmba[l_i].l_bmba012  #160406-00004#1  mark
                     LET l_bmba_qty[l_j].l_inam002 = l_bmba[l_i].l_inam002
                    #LET l_bmba_qty[l_j].l_qty     = l_sfac.sfac003         #160406-00004#1  mark
                     #160406-00004#1---add---begin
                     LET l_bmba_qty[l_j].l_qty     = l_sfac.sfac003 * l_bmba[l_i].l_bmba011/l_bmba[l_i].l_bmba012
                     LET l_bmba_qty[l_j].l_bmba011 = 1
                     LET l_bmba_qty[l_j].l_bmba012 = 1
                     LET l_bmba_qty[l_j].l_qty2    = l_sfac.sfac003
                     LET l_bmba_qty[l_j].l_feature = g_bmba_feature[l_i].l_feature
                     #160406-00004#1---add---end                      
                  END IF
               END FOR
            END IF
         END FOREACH
      END IF
      IF NOT s_asft300_02_ins_sfba(l_bmba_qty) THEN
         RETURN r_success,0
      END IF
   END IF
   
   IF g_num > 0 THEN
      UPDATE sfaa_t
         SET sfaa039 = 'Y'  #備料已產生
       WHERE sfaaent = g_enterprise
         AND sfaasite = g_site
         AND sfaadocno = g_sfaadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "UPDATE sfaa_t:",SQLERRMESSAGE
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
      ELSE
         LET l_num_t = g_num
         LET l_num = 0
         #若有产生子工单，则产生对应备料档资料
         LET l_i = 1
         FOREACH s_asft300_02_c2
           USING g_enterprise,g_site,g_sfaadocno
            INTO l_sfaa[l_i].sfaadocno,l_sfaa[l_i].sfaa003,l_sfaa[l_i].sfaa010,l_sfaa[l_i].sfaa011,l_sfaa[l_i].sfaa015,l_sfaa[l_i].sfaa012
            LET l_i = l_i + 1
         END FOREACH
         CALL l_sfaa.deleteElement(l_i)
         LET l_i = l_i - 1
         IF l_i > 0 THEN
            FOR l_i = 1 TO l_sfaa.getLength()
               #170411-00043#1-s mark
               ##170210-00054#1-s-add
               #LET l_count = 0
               #SELECT COUNT(1) INTO  l_count
               #  FROM sfaa_t
               # WHERE sfaaent = g_enterprise
               #   AND sfaadocno = l_sfaa[l_i].sfaadocno
               #IF cl_null(l_count) OR l_count = 0 THEN
               ##170210-00054#1-e-add
               #170411-00043#1-e mark
                  CALL s_asft300_02(l_sfaa[l_i].sfaadocno,l_sfaa[l_i].sfaa003,l_sfaa[l_i].sfaa010,l_sfaa[l_i].sfaa011,l_sfaa[l_i].sfaa015,l_sfaa[l_i].sfaa012,'N') RETURNING l_success,l_num
                  IF NOT l_success THEN
                     DELETE FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sfaa[l_i].sfaadocno
                     DELETE FROM sfab_t WHERE sfabent=g_enterprise AND sfabdocno=l_sfaa[l_i].sfaadocno
                     DELETE FROM sfac_t WHERE sfacent=g_enterprise AND sfacdocno=l_sfaa[l_i].sfaadocno
                     DELETE FROM sfba_t WHERE sfbaent=g_enterprise AND sfbadocno=l_sfaa[l_i].sfaadocno
                     #160727-00025#10 add-S
                     CALL s_aooi200_del_docno(l_sfaa[l_i].sfaadocno,g_sfaa.sfaadocdt) 
                        RETURNING l_success
                     IF l_sfaa[l_i].sfaa003 = '5' THEN
                        DELETE FROM sfai_t WHERE sfaient=g_enterprise AND sfaidocno=l_sfaa[l_i].sfaadocno
                     END IF
                     CALL s_aooi200_get_slip(l_sfaa[l_i].sfaadocno) RETURNING l_success,l_ooba002
                     IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0039') = 'Y' THEN     #删除多余的制程资料
                        DELETE FROM sfca_t WHERE sfcaent=g_enterprise AND sfcadocno=l_sfaa[l_i].sfaadocno
                        DELETE FROM sfcb_t WHERE sfcbent=g_enterprise AND sfcbdocno=l_sfaa[l_i].sfaadocno
                        DELETE FROM sfcc_t WHERE sfccent=g_enterprise AND sfccdocno=l_sfaa[l_i].sfaadocno
                        DELETE FROM sfcd_t WHERE sfcdent=g_enterprise AND sfcddocno=l_sfaa[l_i].sfaadocno
                     END IF
                     #160727-00025#10 add-E
                  END IF
               #END IF   #170210-00054#1  #170411-00043#1 mark
            END FOR
         END IF
         LET r_success = TRUE
         LET r_num = l_num_t + l_num
         RETURN r_success,r_num
      END IF
   END IF
   
   RETURN r_success,0
END FUNCTION
################################################################################
# Descriptions...: 工单形态为重工工单或者拆件式工单时产生的备料
# Memo...........:
# Usage..........: CALL s_asft300_02_rd(p_qty,p_feature)
# Input parameter: 1.p_qty
#                  2.p_feature
# Date & Author..: 2014/1/26 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_rd(p_qty,p_feature)
DEFINE p_qty        LIKE sfba_t.sfba013
DEFINE p_feature    LIKE sfba_t.sfba021
DEFINE l_success    LIKE type_t.num5
#add by huna20170719---s
DEFINE l_sfbaud002   LIKE sfba_t.sfbaud002 
DEFINE l_sfbaud011   LIKE sfba_t.sfbaud011 #add l_sfbaud011 by huna20170720
DEFINE l_sfbaud012   LIKE sfba_t.sfbaud012   
DEFINE l_sfbaud013   LIKE sfba_t.sfbaud013   
#add by huna20170719---e
   INITIALIZE g_sfba.* TO NULL
   
   LET g_sfba.sfbaent   = g_enterprise
   LET g_sfba.sfbasite  = g_site
   LET g_sfba.sfbadocno = g_sfaadocno
   
   #依生管模組參數工單項次間隔數自動增加
   EXECUTE s_asft300_02_ins_sfba_p2
     USING g_enterprise,g_site,g_sfba.sfbadocno
      INTO g_sfba.sfbaseq
   IF cl_null(g_slip) THEN
      CALL s_aooi200_get_slip(g_sfaadocno) RETURNING l_success,g_slip
   END IF
   IF cl_null(g_d_mfg_0049) THEN
      LET g_d_mfg_0049 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0049')
   END IF
   IF cl_null(g_d_mfg_0049) OR g_d_mfg_0049 = 0 THEN
      LET g_d_mfg_0049 = 1
   END IF
   IF cl_null(g_sfba.sfbaseq) THEN
      LET g_sfba.sfbaseq = g_d_mfg_0049
   ELSE
      LET g_sfba.sfbaseq = g_sfba.sfbaseq + g_d_mfg_0049
   END IF
   
   LET g_sfba.sfbaseq1 = 0
   LET g_sfba.sfba001  = ''
   LET g_sfba.sfba002  = ' '
   LET g_sfba.sfba003  = ' '
   LET g_sfba.sfba004  = ' '
   LET g_sfba.sfba005  = g_sfaa010
   LET g_sfba.sfba006  = g_sfaa010
   LET g_sfba.sfba007  = 0
   LET g_sfba.sfba008  = '2'
#   LET g_sfba.sfba009  = 'N' #170515-00007#1 mark
   #170515-00007#1 add(s)
   IF g_sfaa.sfaa004 = '1' THEN
      LET g_sfba.sfba009 = 'N'
   ELSE
      LET g_sfba.sfba009 = 'Y'
   END IF
   #170515-00007#1 add(e) 
   LET g_sfba.sfba010  = 1
   LET g_sfba.sfba011  = 1
   LET g_sfba.sfba012  = 0
   LET g_sfba.sfba013  = p_qty
   LET g_sfba.sfba014  = g_sfaa.sfaa013
   LET g_sfba.sfba015  = 0
   LET g_sfba.sfba016  = 0
   LET g_sfba.sfba017  = 0
   LET g_sfba.sfba018  = 0
  #LET g_sfba.sfba019  = ''  #170226-00002#1
   LET g_sfba.sfba019 = g_d_mfg_0076  #170226-00002#1
   LET g_sfba.sfba020  = ''
   LET g_sfba.sfba021  = p_feature
   LET g_sfba.sfba022  = 1
   LET g_sfba.sfba023  = p_qty
   LET g_sfba.sfba024  = 0
   LET g_sfba.sfba025  = 0
   LET g_sfba.sfba026  = '1'
   LET g_sfba.sfba028  = 'N'
   LET g_sfba.sfba030  = ''
   LET g_sfba.sfba033  = 'N'
   
   #单位取位
   CALL s_aooi250_take_decimals(g_sfba.sfba014,g_sfba.sfba013)
        RETURNING l_success,g_sfba.sfba013
   CALL s_aooi250_take_decimals(g_sfba.sfba014,g_sfba.sfba023)
        RETURNING l_success,g_sfba.sfba023
   CALL s_aooi250_take_decimals(g_sfba.sfba014,g_sfba.sfba024)
        RETURNING l_success,g_sfba.sfba024
   #add by huna20170719---s
   LET l_sfbaud002 = ''
   LET l_sfbaud011 = 0 #add l_sfbaud011 by huna20170720
   LET l_sfbaud012 = 0
   LET l_sfbaud013 = 0
   #add by huna20170719---e      
   EXECUTE s_asft300_02_ins_sfba_p
     USING g_sfba.sfbaent,g_sfba.sfbasite,g_sfba.sfbadocno,g_sfba.sfbaseq,g_sfba.sfbaseq1,
           g_sfba.sfba001,g_sfba.sfba002,g_sfba.sfba003,g_sfba.sfba004,g_sfba.sfba005,
           g_sfba.sfba006,g_sfba.sfba007,g_sfba.sfba008,g_sfba.sfba009,g_sfba.sfba010,
           g_sfba.sfba011,g_sfba.sfba012,g_sfba.sfba013,g_sfba.sfba014,g_sfba.sfba015,
           g_sfba.sfba016,g_sfba.sfba017,g_sfba.sfba018,g_sfba.sfba019,g_sfba.sfba020,
           g_sfba.sfba021,g_sfba.sfba022,g_sfba.sfba023,g_sfba.sfba024,g_sfba.sfba025,
           g_sfba.sfba026,g_sfba.sfba028,g_sfba.sfba030,g_sfba.sfba033
           ,l_sfbaud002,l_sfbaud011,l_sfbaud012,l_sfbaud013  #add by huna20170719 #add l_sfbaud011 by huna20170720

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT sfba_t:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN
   ELSE
      LET g_num = 1
   END IF
   
END FUNCTION
################################################################################
# Descriptions...: 特征管理
# Memo...........:
# Usage..........: CALL s_asft300_02_tz(p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008,p_feature,p_imaa005)
#                  RETURNING r_success,r_feature
# Input parameter: 1.p_bmca001    主件料号
#                : 2.p_bmca002    特性编号
#                : 3.p_bmca003    元件料号
#                : 4.p_bmca004    部位编码
#                : 5.p_bmca005    生效日期时间
#                : 6.p_bmca007    作业编号
#                : 7.p_bmca008    工艺段号
#                : 8.p_feature    特征
#                : 9.p_imaa005    特徵組別
# Return code....: 1.r_success    
#                : 2.r_feature     
# Date & Author..: 2014/9/25 By wuxja
# Modify.........: 160805-00023 By whitney add p_imaa005
################################################################################
PUBLIC FUNCTION s_asft300_02_tz(p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008,p_feature,p_imaa005)
DEFINE p_bmca001    LIKE bmca_t.bmca001
DEFINE p_bmca002    LIKE bmca_t.bmca002
DEFINE p_bmca003    LIKE bmca_t.bmca003
DEFINE p_bmca004    LIKE bmca_t.bmca004
DEFINE p_bmca005    LIKE bmca_t.bmca005
DEFINE p_bmca007    LIKE bmca_t.bmca007
DEFINE p_bmca008    LIKE bmca_t.bmca008
DEFINE p_feature    LIKE inam_t.inam002
DEFINE p_imaa005    LIKE imaa_t.imaa005
DEFINE r_success    LIKE type_t.num5
DEFINE r_feature    LIKE inam_t.inam002
DEFINE l_inam       RECORD
    inam011    LIKE inam_t.inam011,
    inam012    LIKE inam_t.inam012,
    inam013    LIKE inam_t.inam013,
    inam014    LIKE inam_t.inam014,
    inam015    LIKE inam_t.inam015,
    inam016    LIKE inam_t.inam016,
    inam017    LIKE inam_t.inam017,
    inam018    LIKE inam_t.inam018,
    inam019    LIKE inam_t.inam019,
    inam020    LIKE inam_t.inam020,
    inam021    LIKE inam_t.inam021,
    inam022    LIKE inam_t.inam022,
    inam023    LIKE inam_t.inam023,
    inam024    LIKE inam_t.inam024,
    inam025    LIKE inam_t.inam025,
    inam026    LIKE inam_t.inam026,
    inam027    LIKE inam_t.inam027,
    inam028    LIKE inam_t.inam028,
    inam029    LIKE inam_t.inam029,
    inam030    LIKE inam_t.inam030,
    inam031    LIKE inam_t.inam031,
    inam032    LIKE inam_t.inam032,
    inam033    LIKE inam_t.inam033,
    inam034    LIKE inam_t.inam034,
    inam035    LIKE inam_t.inam035,
    inam036    LIKE inam_t.inam036,
    inam037    LIKE inam_t.inam037,
    inam038    LIKE inam_t.inam038,
    inam039    LIKE inam_t.inam039,
    inam040    LIKE inam_t.inam040,
    inam041    LIKE inam_t.inam041,
    inam042    LIKE inam_t.inam042,
    inam043    LIKE inam_t.inam043,
    inam044    LIKE inam_t.inam044,
    inam045    LIKE inam_t.inam045,
    inam046    LIKE inam_t.inam046,
    inam047    LIKE inam_t.inam047,
    inam048    LIKE inam_t.inam048,
    inam049    LIKE inam_t.inam049,
    inam050    LIKE inam_t.inam050
                END RECORD
DEFINE l_bmcb  RECORD
    bmcb009    LIKE bmcb_t.bmcb009,
    bmcb010    LIKE bmcb_t.bmcb010,
    bmcb011    LIKE bmcb_t.bmcb011,
    bmcb012    LIKE bmcb_t.bmcb012
           END RECORD
DEFINE l_flag       LIKE type_t.chr1
DEFINE l_bmcb009_t  LIKE bmcb_t.bmcb009
DEFINE l_ac         LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5
DEFINE l_bmcc  RECORD
    bmcc009    LIKE bmcc_t.bmcc009,
    bmcc010    LIKE bmcc_t.bmcc010
           END RECORD
DEFINE l_bmcd  RECORD
    bmcd010    LIKE bmcd_t.bmcd010,
    bmcd011    LIKE bmcd_t.bmcd011
           END RECORD
DEFINE l_bmce  RECORD
    bmce009    LIKE bmce_t.bmce009,
    bmce010    LIKE bmce_t.bmce010
           END RECORD
DEFINE l_imeb  DYNAMIC ARRAY OF RECORD
    imeb002    LIKE imeb_t.imeb002,    #特徵項次:記錄是哪一個特徵項次
    imeb004    LIKE imeb_t.imeb004,    #特徵類型:記錄該特徵類型
    imec003    LIKE imec_t.imec003     #特徵值:記錄該特徵項次的內容值
           END RECORD
DEFINE l_success    LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   
   LET r_success = FALSE
   LET r_feature = ' '
   
   #主件特征对应特征类型特征值
   INITIALIZE l_inam.* TO NULL
   EXECUTE s_asft300_02_tz_p1
     USING g_enterprise,p_bmca001,p_feature
      INTO l_inam.inam011,l_inam.inam012,l_inam.inam013,l_inam.inam014,l_inam.inam015,
           l_inam.inam016,l_inam.inam017,l_inam.inam018,l_inam.inam019,l_inam.inam020,
           l_inam.inam021,l_inam.inam022,l_inam.inam023,l_inam.inam024,l_inam.inam025,
           l_inam.inam026,l_inam.inam027,l_inam.inam028,l_inam.inam029,l_inam.inam030,
           l_inam.inam031,l_inam.inam032,l_inam.inam033,l_inam.inam034,l_inam.inam035,
           l_inam.inam036,l_inam.inam037,l_inam.inam038,l_inam.inam039,l_inam.inam040,
           l_inam.inam041,l_inam.inam042,l_inam.inam043,l_inam.inam044,l_inam.inam045,
           l_inam.inam046,l_inam.inam047,l_inam.inam048,l_inam.inam049,l_inam.inam050
   
   #主件产品特征限定用料
   LET l_n = 0
   EXECUTE s_asft300_02_tz_p2
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
      INTO l_n
   IF l_n > 0 THEN
      LET l_flag = 'Y'
      LET l_bmcb009_t = ' '
      INITIALIZE l_bmcb.* TO NULL
      FOREACH s_asft300_02_tz_c3
        USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
         INTO l_bmcb.bmcb009,l_bmcb.bmcb010,l_bmcb.bmcb011,l_bmcb.bmcb012
         #同特征类型的限定特征满足其中一项---》检查通过，直接检查下一特征类型
         IF l_flag = 'Y' AND l_bmcb009_t = l_bmcb.bmcb009 THEN
            CONTINUE FOREACH
         END IF
         #同特征类型的限定特征都不满足---》检查不通过，返回
         IF l_flag = 'N' AND l_bmcb009_t != l_bmcb.bmcb009 THEN
            RETURN r_success,r_feature
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam012) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam014) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam016) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam018) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam020) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam022) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam024) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam026) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam028) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam030) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam032) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam034) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam036) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam038) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam040) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam042) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam044) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam046) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam048) RETURNING l_flag
         END IF
         IF l_bmcb.bmcb009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
            CALL s_asft300_02_tz_check(p_bmca001,l_bmcb.bmcb009,l_bmcb.bmcb011,l_bmcb.bmcb012,l_inam.inam050) RETURNING l_flag
         END IF
         LET l_bmcb009_t = l_bmcb.bmcb009
      END FOREACH
      IF l_flag = 'N' THEN
         RETURN r_success,r_feature
      END IF
   END IF
   
   IF cl_null(p_imaa005) THEN
      LET r_success = TRUE
      RETURN r_success,r_feature
   END IF
   
   LET l_ac = 1
   
   #主件与元件产品特征对应
   LET l_n = 0
   EXECUTE s_asft300_02_tz_p4
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
     INTO l_n
   IF l_n > 0 THEN
      LET l_flag = 'Y'
      INITIALIZE l_bmcc.* TO NULL
      INITIALIZE l_bmcd.* TO NULL
      FOREACH s_asft300_02_tz_c5
        USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
         INTO l_bmcc.bmcc009,l_bmcc.bmcc010#,l_bmcd.bmcd010,l_bmcd.bmcd011       #161207-00074#1 mark 
         #161207-00074#1 add---------s-------- 
         IF l_bmcc.bmcc010 = '2' THEN
#161214-00036#1 mark-----s-------
#            SELECT bmcd010,bmcd011 INTO l_bmcd.bmcd010,l_bmcd.bmcd011 FROM bmcd_t WHERE  bmcdent=g_enterprise AND bmcdsite=g_site 
#                   AND bmcd001=p_bmca001 AND bmcd002=p_bmca002 AND bmcd003=p_bmca003 AND bmcd004=p_bmca004 AND bmcd005=p_bmca005 
#                   AND bmcd007=p_bmca007 AND bmcd008=p_bmca008 AND bmcd009=l_bmcc.bmcc009
#161214-00036#1 mark-----e-------
#161214-00036#1 add---------s-------- 
            FOREACH s_asft300_02_tz_ccd
            USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008,l_bmcc.bmcc009
            INTO l_bmcd.bmcd010,l_bmcd.bmcd011
               IF l_bmcc.bmcc009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam012 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam014 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam016 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam018 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN    
                  IF l_bmcd.bmcd010 = l_inam.inam020 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam022 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam024 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam026 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam028 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam030 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN 
                  IF l_bmcd.bmcd010 = l_inam.inam032 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN 
                  IF l_bmcd.bmcd010 = l_inam.inam034 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam036 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1 
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam038 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam040 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam042 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam044 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam046 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF

               END IF
               IF l_bmcc.bmcc009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam048 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF
               IF l_bmcc.bmcc009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
                  IF l_bmcd.bmcd010 = l_inam.inam050 AND NOT cl_null(l_bmcd.bmcd011) THEN
                     LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                     LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                     LET l_ac = l_ac + 1
                  END IF
               END IF            
            
            END FOREACH
            CONTINUE FOREACH
#161214-00036#1 add---------e-------- 
         END IF
                 
         #161207-00074#1 add---------s--------
         IF l_bmcc.bmcc009 = l_inam.inam011 AND NOT cl_null(l_inam.inam011) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam012
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam012 AND NOT cl_null(l_bmcd.bmcd011) THEN
               
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam013 AND NOT cl_null(l_inam.inam013) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam014
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam014 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam015 AND NOT cl_null(l_inam.inam015) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam016
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam016 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam017 AND NOT cl_null(l_inam.inam017) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam018
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam018 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam019 AND NOT cl_null(l_inam.inam019) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam020
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam020 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam021 AND NOT cl_null(l_inam.inam021) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam022
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam022 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam023 AND NOT cl_null(l_inam.inam023) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam024
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam024 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam025 AND NOT cl_null(l_inam.inam025) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam026
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam026 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam027 AND NOT cl_null(l_inam.inam027) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam028
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam028 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam029 AND NOT cl_null(l_inam.inam029) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam030
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam030 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam031 AND NOT cl_null(l_inam.inam031) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam032
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam032 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam033 AND NOT cl_null(l_inam.inam033) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam034
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam034 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam035 AND NOT cl_null(l_inam.inam035) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam036
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam036 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam037 AND NOT cl_null(l_inam.inam037) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam038
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam038 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam039 AND NOT cl_null(l_inam.inam039) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam040
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam040 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam041 AND NOT cl_null(l_inam.inam041) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam042
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam042 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam043 AND NOT cl_null(l_inam.inam043) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam044
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam044 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam045 AND NOT cl_null(l_inam.inam045) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam046
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam046 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam047 AND NOT cl_null(l_inam.inam047) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam048
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam048 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
         IF l_bmcc.bmcc009 = l_inam.inam049 AND NOT cl_null(l_inam.inam049) THEN
            IF l_bmcc.bmcc010 = '1' THEN
               LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
               LET l_imeb[l_ac].imec003 = l_inam.inam050
               LET l_ac = l_ac + 1
            END IF
            IF l_bmcc.bmcc010 = '2' THEN
               IF l_bmcd.bmcd010 = l_inam.inam050 AND NOT cl_null(l_bmcd.bmcd011) THEN
                  LET l_imeb[l_ac].imeb004 = l_bmcc.bmcc009
                  LET l_imeb[l_ac].imec003 = l_bmcd.bmcd011
                  LET l_ac = l_ac + 1
               END IF
            END IF
         END IF
      END FOREACH
   END IF
   
   #限定元件特征
   INITIALIZE l_bmce.* TO NULL
   FOREACH s_asft300_02_tz_c6
     USING g_enterprise,g_site,p_bmca001,p_bmca002,p_bmca003,p_bmca004,p_bmca005,p_bmca007,p_bmca008
      INTO l_bmce.bmce009,l_bmce.bmce010
      LET l_imeb[l_ac].imeb004 = l_bmce.bmce009
      LET l_imeb[l_ac].imec003 = l_bmce.bmce010
      LET l_ac = l_ac + 1
   END FOREACH
   
   CALL l_imeb.deleteElement(l_ac)
   LET l_ac = l_ac - 1
   
   CALL s_feature_multi_create_string(p_bmca003,p_imaa005,l_imeb,g_sfaadocno,g_site) RETURNING l_success,r_feature
   IF NOT l_success THEN
      RETURN r_success,r_feature
   END IF
   
   LET r_success = TRUE
   RETURN r_success,r_feature
END FUNCTION
################################################################################
# Descriptions...: 自动取替代
# Memo...........:
# Usage..........: CALL s_asft300_02_replace(p_sfbadocno,p_sfbaseq,p_sfbaseq1,p_bmba024)
#                  RETURNING r_success
# Input parameter: 1.p_sfbadocno  
#                : 2.p_sfbaseq    
#                : 3.p_sfbaseq1   
#                : 5.p_bmba024    #主要替代料
# Return code....: 1.r_success
# Date & Author..: 14/6/16 By wuxja
# Modify.........: 160707-00045#1
# Modify.........: 160830-00049#1
################################################################################
PUBLIC FUNCTION s_asft300_02_replace(p_sfbadocno,p_sfbaseq,p_sfbaseq1,p_bmba024)
DEFINE p_sfbadocno  LIKE sfba_t.sfbadocno
DEFINE p_sfbaseq    LIKE sfba_t.sfbaseq
DEFINE p_sfbaseq1   LIKE sfba_t.sfbaseq1
DEFINE p_bmba024    LIKE bmba_t.bmba024
DEFINE r_success    LIKE type_t.num5
DEFINE l_success    LIKE type_t.num5
DEFINE l_sfba       type_g_sfba
DEFINE l_sql        STRING
DEFINE l_bmea  RECORD
    bmea007    LIKE bmea_t.bmea007,
    bmea008    LIKE bmea_t.bmea008,
    bmea011    LIKE bmea_t.bmea011,
    bmea012    LIKE bmea_t.bmea012,
    bmea013    LIKE bmea_t.bmea013,
    bmea014    LIKE bmea_t.bmea014,
    bmea016    LIKE bmea_t.bmea016,
    bmea017    LIKE bmea_t.bmea017,
    bmea019    LIKE bmea_t.bmea019
           END RECORD
DEFINE l_qty        LIKE sfba_t.sfba013  #替代量
#DEFINE l_qty_1      LIKE inag_t.inag009  #庫存量(新料/主料)     #170413-00018#1 mark
#DEFINE l_qty_2      LIKE inag_t.inag009  #庫存量(舊料/副料)     #170413-00018#1 mark
DEFINE l_qty_1      LIKE inag_t.inag008  #庫存量(新料/主料)      #170413-00018#1 add
DEFINE l_qty_2      LIKE inag_t.inag008  #庫存量(舊料/副料)      #170413-00018#1 add
DEFINE l_qty_3      LIKE sfba_t.sfba013  #剩余未替代量
DEFINE l_qty_4      LIKE sfba_t.sfba013  #取替代量/元件底數
DEFINE l_n          LIKE type_t.num5
DEFINE l_flag       LIKE type_t.chr1     #替代已優先考慮主料
#161228-00043#1-s-add
DEFINE l_sql_2      STRING
DEFINE l_count      LIKE type_t.num5
#161228-00043#1-e-add
#add by huna20170719---s
DEFINE l_sfbaud002   LIKE sfba_t.sfbaud002 
DEFINE l_sfbaud011   LIKE sfba_t.sfbaud011 #add l_sfbaud011 by huna20170720
DEFINE l_sfbaud012   LIKE sfba_t.sfbaud012   
DEFINE l_sfbaud013   LIKE sfba_t.sfbaud013   
#add by huna20170719---e
DEFINE l_sfaadocdt    LIKE sfaa_t.sfaadocdt   #180326-00015#1 add  工单单据日期

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   IF cl_null(g_slip) THEN
      CALL s_aooi200_get_slip(g_sfaadocno) RETURNING l_success,g_slip
   END IF
   #自動取代
   IF cl_null(g_d_mfg_0047) THEN
      LET g_d_mfg_0047 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0047')
   END IF
   #自動替代
   IF cl_null(g_d_mfg_0048) THEN
      LET g_d_mfg_0048 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0048')
   END IF
   #限定足額自動取替代
   IF cl_null(g_d_mfg_0073) THEN
      LET g_d_mfg_0073 = cl_get_doc_para(g_enterprise,g_site,g_slip,'D-MFG-0073')
   END IF
   
   IF g_d_mfg_0047 = 'N' AND g_d_mfg_0048 = 'N' THEN
      RETURN r_success
   END IF
   
   LET l_sfba.* = g_sfba.*
   
   #庫存量(新料/主料)
   LET l_qty_1 =  s_asft300_02_get_qty(l_sfba.sfba005,l_sfba.sfba021,l_sfba.sfba014)
   
   #參數不做取代&主料庫存足夠不需要做替代
   IF g_d_mfg_0047 = 'N' AND g_d_mfg_0048 = 'Y' AND l_qty_1 >= l_sfba.sfba013 THEN
      RETURN r_success
   END IF

   SELECT sfaadocdt INTO l_sfaadocdt FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=g_sfaadocno #180326-00015#1 add

   LET l_sql = " SELECT bmea007,bmea008,bmea011,bmea012,bmea013,bmea014,bmea016,bmea017,bmea019 ",
               "   FROM bmea_t ",
               "  WHERE bmeaent = ",g_enterprise," AND bmeasite = '",g_site,"' ",
              #"   AND bmea001 = '",g_sfaa.sfaa010,"' AND bmea002 = '",g_sfaa.sfaa011,"'",  #160314-00026#1  --- mark
               "   AND bmea001 = '",l_sfba.sfba001,"' AND bmea002 = '",g_sfaa.sfaa011,"'",  #160314-00026#1  --- add
               "   AND bmea003 = '",l_sfba.sfba005,"' AND ( bmea004 = '",l_sfba.sfba002,"' OR bmea004 = ' ' ) ",  #171115-00026#1 mod
               "   AND (bmea005 = '",l_sfba.sfba003,"' OR bmea005 = ' ' ) AND  (bmea006 = '",l_sfba.sfba004,"' OR bmea006 = ' ' )"   #171115-00026#1 mod
                #,"   AND (bmea010 IS NULL OR bmea010 >='",l_sfaadocdt,"')"     #180326-00015#1 add  #180626-00012#1 mark
              ,"   AND (bmea010 IS NULL OR bmea010 >'",l_sfaadocdt,"')"      #180626-00012#1 add            
               #"   AND bmea019 = '",l_sfba.sfba021,"'"
   
   CASE
      WHEN g_d_mfg_0047 = 'Y' AND g_d_mfg_0048 = 'N'
         LET l_sql = l_sql," AND bmea007 = '1' "
      WHEN g_d_mfg_0047 = 'N' AND g_d_mfg_0048 = 'Y'
         LET l_sql = l_sql," AND bmea007 = '2' "
   END CASE
   
   #161228-00043#1-s-add
   LET l_count = 0
   LET l_sql_2 = " SELECT COUNT(1) FROM (",l_sql,")"
   PREPARE replace_chk_p FROM l_sql_2
   EXECUTE replace_chk_p INTO l_count   #總筆數
   IF l_count = 0 THEN
      LET l_sql = " SELECT bmea007,bmea008,bmea011,bmea012,bmea013,bmea014,bmea016,bmea017,bmea019 ",
                  "   FROM bmea_t ",
                  "  WHERE bmeaent = ",g_enterprise," AND bmeasite = '",g_site,"' ",
                  "   AND bmea001 = 'ALL' ",
                  "   AND bmea003 = '",l_sfba.sfba005,"' AND ( bmea004 = '",l_sfba.sfba002,"' OR bmea004 = ' ' ) ",  #171115-00026#1 mod
                  "   AND (bmea005 = '",l_sfba.sfba003,"' OR bmea005 = ' ' ) AND  (bmea006 = '",l_sfba.sfba004,"' OR bmea006 = ' ' )"   #171115-00026#1 mod
                  #,"   AND (bmea010 IS NULL OR bmea010 >='",l_sfaadocdt,"')"     #180326-00015#1 add  #180626-00012#1 mark
                  ,"   AND (bmea010 IS NULL OR bmea010 >'",l_sfaadocdt,"')"  #180626-00012#1 add
                  
      CASE
         WHEN g_d_mfg_0047 = 'Y' AND g_d_mfg_0048 = 'N'
            LET l_sql = l_sql," AND bmea007 = '1' "
         WHEN g_d_mfg_0047 = 'N' AND g_d_mfg_0048 = 'Y'
            LET l_sql = l_sql," AND bmea007 = '2' "
      END CASE
   END IF
   #161228-00043#1-e-add
   
   IF cl_null(p_bmba024) THEN
      LET l_sql = l_sql," ORDER BY bmea007,bmea015 "
   ELSE
      LET l_sql = l_sql," ORDER BY bmea007,(CASE WHEN bmea008 = '",p_bmba024,"' THEN 1 END),bmea015 "
   END IF
   
   #剩余未替代量
   LET l_qty_3 = l_sfba.sfba013
   LET l_flag = 'N'
   
   PREPARE s_asft300_02_replace_pre FROM l_sql
   DECLARE s_asft300_02_replace_cur CURSOR FOR s_asft300_02_replace_pre
   INITIALIZE l_bmea.* TO NULL
   FOREACH s_asft300_02_replace_cur INTO l_bmea.bmea007,l_bmea.bmea008,l_bmea.bmea011,
                                         l_bmea.bmea012,l_bmea.bmea013,l_bmea.bmea014,
                                         l_bmea.bmea016,l_bmea.bmea017,l_bmea.bmea019
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "s_asft300_02_replace_cur:",SQLERRMESSAGE
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #自動替代：BOM的主料沒有庫存可用量時，且替代料有庫存可用量，將工單備料自動換為替代料
      #自動取代：舊料有庫存可用量，先取舊料，沒有庫存時，才帶BOM上的新料
      IF l_flag = 'N' AND l_bmea.bmea007 = '2' THEN
         IF l_qty_1 >= l_qty_3 THEN
            EXIT FOREACH
         END IF
         IF l_qty_1 > 0 THEN
            LET l_flag = 'Y'
            LET l_qty_3 = l_qty_3 - l_qty_1
         END IF
      END IF
      
      #庫存量(舊料/副料)
      CALL s_asft300_02_get_qty(l_bmea.bmea008,l_bmea.bmea019,l_bmea.bmea013)
           RETURNING l_qty_2
      
      #庫存量 - 其他工單同樣要發這個料的數量 <= 0 表示這個取替代料未來要發料時會沒有數量 , 所以不考慮取替代成這個料
      IF l_qty_2 <= 0 THEN
         CONTINUE FOREACH
      END IF
      
      #限定客戶
      IF l_bmea.bmea014 = 'Y' AND NOT cl_null(g_sfaa.sfaa009) THEN
         LET l_n = 0
         SELECT COUNT(1) INTO l_n FROM bmeb_t
          WHERE bmebent = g_enterprise AND bmebsite = g_site
            AND bmeb001 = g_sfaa.sfaa010 AND bmeb002 = g_sfaa.sfaa011
            AND bmeb003 = l_sfba.sfba005 AND bmeb004 = l_sfba.sfba002
            AND bmeb005 = l_sfba.sfba003 AND bmeb006 = l_sfba.sfba004
            AND bmea007 = l_bmea.bmea007 AND bmeb008 = l_bmea.bmea008
            AND bmeb009 = g_sfaa.sfaa009 AND bmeb010 = l_bmea.bmea019
         IF l_n = 0 THEN
            CONTINUE FOREACH
         END IF
      END IF
      
      #取替代量/元件底數
      LET l_qty_4 = l_sfba.sfba013 * l_bmea.bmea011 / l_bmea.bmea012
      LET l_qty = 0
      
      #D-MFG-0073：限定足額自動取替代=Y時，或替代方式=2.完全取替代
      #若原發料料號的總應發數量r_num<>取替代的數量l_qty代表不足額，故不做取替代
      #170325-00048#1 modify --(S)--
     #IF g_d_mfg_0073 = 'Y' OR l_bmea.bmea016 = '2' THEN
      IF (g_d_mfg_0073 = 'Y' AND l_bmea.bmea016 = '2') OR
         (g_d_mfg_0073 = 'Y' AND l_bmea.bmea016 = '1' AND l_bmea.bmea017 = 100) THEN
      #170325-00048#1 modify --(E)--
         IF l_qty_4 > l_qty_2 THEN
            CONTINUE FOREACH
         END IF
         IF l_sfba.sfba013 > l_qty_3 THEN
            CONTINUE FOREACH
         END IF
         LET l_qty = l_qty_4
      ELSE  #替代方式=1.部分取替代
         #應該是判斷應發料量l_qty是否小於庫存可發料量l_qty_2
         #若是則用應發料量*替代上限比率(bmea017)/100
         #否則最多只替換剩下的庫存可發料量
         LET l_qty = l_qty_4 * l_bmea.bmea017 / 100
         IF l_qty > l_qty_2 THEN
            LET l_qty = l_qty_2
         END IF
         IF l_qty > l_qty_3 THEN
            LET l_qty = l_qty_3
         END IF
      END IF
      
      IF cl_null(l_qty) THEN LET l_qty = 0 END IF
      IF l_qty = 0 THEN
         CONTINUE FOREACH
      END IF
      
      #新增工单取替代
      LET l_sfba.sfbaseq1 = 0
      SELECT MAX(sfbaseq1)+ 1 INTO l_sfba.sfbaseq1
        FROM sfba_t
       WHERE sfbaent = g_enterprise
         AND sfbasite = g_site
         AND sfbadocno = g_sfaadocno
         AND sfbaseq = l_sfba.sfbaseq
      LET l_sfba.sfba006 = l_bmea.bmea008
      LET l_sfba.sfba007 = 0        
      LET l_sfba.sfba010 = 0
      LET l_sfba.sfba011 = 0
      LET l_sfba.sfba012 = 0
      LET l_sfba.sfba015 = 0
      LET l_sfba.sfba016 = 0
      LET l_sfba.sfba017 = 0
      LET l_sfba.sfba018 = 0
      LET l_sfba.sfba021 = l_bmea.bmea019
      LET l_sfba.sfba022 = l_bmea.bmea011 / l_bmea.bmea012
      LET l_sfba.sfba023 = 0
      LET l_sfba.sfba024 = 0
      LET l_sfba.sfba025 = 0
      LET l_sfba.sfba026 = '1'
      LET l_sfba.sfba028 = 'N'
      #IF l_sfaa.sfaa004='1' THEN
      #   LET l_sfba.sfba009='N'
      #END IF 
      #IF l_sfaa.sfaa004='2' THEN
      #   LET l_sfba.sfba009='Y'
      #END IF 
     
      LET l_sfba.sfba013 = l_qty
      LET l_sfba.sfba014 = l_bmea.bmea013
      LET l_sfba.sfba019 = g_d_mfg_0076  #170226-00002#1  
      #add by huna20170719---s
      LET l_sfbaud002 = ''
      LET l_sfbaud011 = 0   #add l_sfbaud011 by huna20170720
      LET l_sfbaud012 = 0
      LET l_sfbaud013 = 0
      #add by huna20170719---e       
      EXECUTE s_asft300_02_ins_sfba_p
        USING l_sfba.sfbaent,l_sfba.sfbasite,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,
              l_sfba.sfba001,l_sfba.sfba002,l_sfba.sfba003,l_sfba.sfba004,l_sfba.sfba005,
              l_sfba.sfba006,l_sfba.sfba007,l_sfba.sfba008,l_sfba.sfba009,l_sfba.sfba010,
              l_sfba.sfba011,l_sfba.sfba012,l_sfba.sfba013,l_sfba.sfba014,l_sfba.sfba015,
              l_sfba.sfba016,l_sfba.sfba017,l_sfba.sfba018,l_sfba.sfba019,l_sfba.sfba020,
              l_sfba.sfba021,l_sfba.sfba022,l_sfba.sfba023,l_sfba.sfba024,l_sfba.sfba025,
              l_sfba.sfba026,l_sfba.sfba028,l_sfba.sfba030,l_sfba.sfba033
             ,l_sfbaud002,l_sfbaud011,l_sfbaud012,l_sfbaud013 #add by huna20170719   #add l_sfbaud011 by huna20170720
             
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "INSERT sfba_t",SQLERRMESSAGE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET l_qty_3 = l_qty_3 - l_qty * l_bmea.bmea012 / l_bmea.bmea011
      IF l_flag = 'Y' THEN
         LET l_qty_3 = l_qty_3 + l_qty_1
      END IF
      
      UPDATE sfba_t
         SET sfba013 = l_qty_3
       WHERE sfbaent = g_enterprise
         AND sfbasite = g_site
         AND sfbadocno = l_sfba.sfbadocno
         AND sfbaseq =  l_sfba.sfbaseq
         AND sfbaseq1 = 0
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE sfba_t",SQLERRMESSAGE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF l_qty_3 = 0 OR (l_flag = 'Y' AND l_qty_3=l_qty_1) THEN
         EXIT FOREACH
      END IF
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 产生子工单资料，如果有多笔子工单，则需往下展，直到无子工单
# Memo...........:
# Usage..........: CALL s_asft300_02_gen_children(p_sfaadocno,p_sfbaseq,sfbaseq1)
#                  RETURNING r_success
# Input parameter: 1.p_sfaadocno  母工单单号
#                : 2.p_sfbaseq    下展子工单对应项次
#                : 3.p_sfbaseq1   下展子工单对应项序
# Return code....: 1.r_success    处理状态
# Date & Author..: 14/6/9 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_gen_children(p_sfaadocno,p_sfbaseq,p_sfbaseq1)
DEFINE p_sfaadocno  LIKE sfaa_t.sfaadocno
DEFINE p_sfbaseq    LIKE sfba_t.sfbaseq
DEFINE p_sfbaseq1   LIKE sfba_t.sfbaseq1
DEFINE r_success    LIKE type_t.num5
DEFINE l_sfaa       RECORD
    sfaaent    LIKE sfaa_t.sfaaent,
    sfaasite   LIKE sfaa_t.sfaasite,
    sfaastus   LIKE sfaa_t.sfaastus,
    sfaadocno  LIKE sfaa_t.sfaadocno,
    sfaadocdt  LIKE sfaa_t.sfaadocdt,
    sfaa001    LIKE sfaa_t.sfaa001,
    sfaa002    LIKE sfaa_t.sfaa002,
    sfaa003    LIKE sfaa_t.sfaa003,
    sfaa004    LIKE sfaa_t.sfaa004,
    sfaa005    LIKE sfaa_t.sfaa005,
    #161028-00064#1 add-------s------
    sfaa022    LIKE sfaa_t.sfaa022,       #来源单号
    sfaa023    LIKE sfaa_t.sfaa023,       #来源项次
    sfaa009    LIKE sfaa_t.sfaa009,       #参考客户
    #161028-00064#1 add-------e------
    sfaa010    LIKE sfaa_t.sfaa010,
    sfaa011    LIKE sfaa_t.sfaa011,
    sfaa012    LIKE sfaa_t.sfaa012,
    sfaa013    LIKE sfaa_t.sfaa013,
    sfaa015    LIKE sfaa_t.sfaa015,
    sfaa016    LIKE sfaa_t.sfaa016,
    sfaa017    LIKE sfaa_t.sfaa017,
    sfaa019    LIKE sfaa_t.sfaa019,
    sfaa020    LIKE sfaa_t.sfaa020,
    sfaa021    LIKE sfaa_t.sfaa021,
    sfaa025    LIKE sfaa_t.sfaa025,
    sfaa034    LIKE sfaa_t.sfaa034,  #170411-00002#1
    sfaa035    LIKE sfaa_t.sfaa035,  #170411-00002#1
    sfaa038    LIKE sfaa_t.sfaa038,
    sfaa039    LIKE sfaa_t.sfaa039,
    sfaa040    LIKE sfaa_t.sfaa040,
    sfaa041    LIKE sfaa_t.sfaa041,
    sfaa042    LIKE sfaa_t.sfaa042,
    sfaa043    LIKE sfaa_t.sfaa043,
    sfaa044    LIKE sfaa_t.sfaa044,
    sfaa049    LIKE sfaa_t.sfaa049,
    sfaa050    LIKE sfaa_t.sfaa050,
    sfaa051    LIKE sfaa_t.sfaa051,
    sfaa055    LIKE sfaa_t.sfaa055,
    sfaa056    LIKE sfaa_t.sfaa056,
    sfaa057    LIKE sfaa_t.sfaa057,
    sfaa058    LIKE sfaa_t.sfaa058,
    sfaa060    LIKE sfaa_t.sfaa060,
    sfaa061    LIKE sfaa_t.sfaa061,
    sfaa062    LIKE sfaa_t.sfaa062,
    sfaa069    LIKE sfaa_t.sfaa069,  #170509-00098#1 add
    sfaa071    LIKE sfaa_t.sfaa071,
    sfaa072    LIKE sfaa_t.sfaa072,  #170109-00014#1
    sfaaownid  LIKE sfaa_t.sfaaownid,
    sfaaowndp  LIKE sfaa_t.sfaaowndp,
    sfaacrtid  LIKE sfaa_t.sfaacrtid,
    sfaacrtdp  LIKE sfaa_t.sfaacrtdp,
    sfaacrtdt  LIKE sfaa_t.sfaacrtdt,
    sfaacnfid  LIKE sfaa_t.sfaacnfid,
    sfaacnfdt  LIKE sfaa_t.sfaacnfdt
                END RECORD
DEFINE l_ooba002    LIKE ooba_t.ooba002
DEFINE l_success    LIKE type_t.num5
DEFINE l_days       LIKE type_t.num5
DEFINE l_ooef008    LIKE ooef_t.ooef008
DEFINE l_sfaa003    LIKE sfaa_t.sfaa003   #160727-00025#10 add
DEFINE l_cnt        LIKE sfaa_t.sfaa003   #160727-00025#10 add
#DEFINE l_num        LIKE type_t.num5      #161130-00035#1  add   #170411-00043#1 mark
DEFINE l_sfaa024    LIKE sfaa_t.sfaa024   #來源項序      #170411-00034#1 add
DEFINE l_sfaa064    LIKE sfaa_t.sfaa064   #來源分批序    #170411-00034#1 add
#170509-00097#1 add --(S)--
DEFINE l_sfaa065    LIKE sfaa_t.sfaa065   #生管結案狀態  
DEFINE l_sfaa070    LIKE sfaa_t.sfaa070   #原始預計完工日期  
DEFINE l_sfaamodid  LIKE sfaa_t.sfaamodid #資料修改者
DEFINE l_sfaamoddt  LIKE sfaa_t.sfaamoddt #最近修改日
#170509-00097#1 add --(E)--

   LET r_success = FALSE
   
   INITIALIZE l_sfaa.* TO NULL
   #工单预设值
   LET l_sfaa.sfaaent   = g_enterprise
   LET l_sfaa.sfaasite  = g_site
   LET l_sfaa.sfaadocdt = g_sfaa.sfaadocdt
   LET l_sfaa.sfaa001   = 0
   LET l_sfaa.sfaa002   = g_user
   LET l_sfaa.sfaa004   = '1' 
   LET l_sfaa.sfaa005   = '4'
   LET l_sfaa.sfaa010   = g_sfba.sfba006
   LET l_sfaa.sfaa011   = g_sfaa.sfaa011
   LET l_sfaa.sfaa012   = g_sfba.sfba013
   LET l_sfaa.sfaa013   = g_sfba.sfba014
   LET l_sfaa.sfaa015   = g_sfaa.sfaa015
   LET l_sfaa.sfaa020   = g_sfaa.sfaa020
   LET l_sfaa.sfaa038   = "N"
   LET l_sfaa.sfaa039   = "N"
   LET l_sfaa.sfaa040   = "N"
   LET l_sfaa.sfaa041   = "N"
   LET l_sfaa.sfaa042   = "N"
   LET l_sfaa.sfaa043   = "N"
   LET l_sfaa.sfaa044   = "N"
   LET l_sfaa.sfaa049   = "0"
   LET l_sfaa.sfaa050   = "0"
   LET l_sfaa.sfaa051   = "0"
   LET l_sfaa.sfaa055   = "0"
   LET l_sfaa.sfaa056   = "0"
   LET l_sfaa.sfaa062   = "Y"
   LET l_sfaa.sfaa071   = 0  #160425-00019 by whitney add 齊料套數
   LET l_sfaa.sfaa069   = l_sfaa.sfaa012   #170509-00098#1 add
   LET l_sfaa.sfaaownid = g_user
   LET l_sfaa.sfaaowndp = g_dept
   LET l_sfaa.sfaacrtid = g_user
   LET l_sfaa.sfaacrtdp = g_dept
   LET l_sfaa.sfaacrtdt = cl_get_current()
   #170509-00097#1 add --(S)--
   LET l_sfaa065   = "0" 
   LET l_sfaa070   = g_sfaa.sfaa020
   LET l_sfaamodid = g_user
   LET l_sfaamoddt = cl_get_current()
   #170509-00097#1 add --(E)--
   
   LET l_ooba002 = ''
   SELECT imae031,imae033,imae034,imae041,imae042  #170411-00002#1 add ,imae041,imae042
     INTO l_ooba002,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa034,l_sfaa.sfaa035  #170411-00002#1 add ,l_sfaa.sfaa034,l_sfaa.sfaa035
     FROM imae_t
    WHERE imaeent = g_enterprise
      AND imaesite = g_site
      AND imae001 = l_sfaa.sfaa010
   
   IF cl_null(l_ooba002) THEN
      CALL s_aooi200_get_slip(g_sfaadocno) RETURNING l_success,l_ooba002
      IF NOT l_success THEN
         RETURN r_success
      END IF
   END IF
   
   IF cl_null(l_ooba002) THEN
      RETURN r_success
   END IF
   #160727-00025#10 mod-S
   SELECT sfaa003 INTO l_sfaa003
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaasite = g_site
      AND sfaadocno = g_sfaadocno 
   IF l_sfaa003 = '5' THEN
      CALL s_aooi200_chk_slip(g_site,'',l_ooba002,'asft304') RETURNING l_success
      IF NOT l_success THEN
         RETURN r_success
      END IF
      
      #自动编号
      CALL s_aooi200_gen_docno(g_site,l_ooba002,g_sfaa.sfaadocdt,'asft304') RETURNING l_success,l_sfaa.sfaadocno
      IF NOT l_success THEN
         RETURN r_success
      END IF
   ELSE
   #160727-00025#10 mod-E
      CALL s_aooi200_chk_slip(g_site,'',l_ooba002,'asft300') RETURNING l_success
      IF NOT l_success THEN
         RETURN r_success
      END IF
      
      #自动编号
      CALL s_aooi200_gen_docno(g_site,l_ooba002,g_sfaa.sfaadocdt,'asft300') RETURNING l_success,l_sfaa.sfaadocno
      IF NOT l_success THEN
         RETURN r_success
      END IF
   END IF   #160727-00025#10 add
   
   CALL s_asft300_02_get_doc_default(l_sfaa.*) RETURNING l_sfaa.*       #160926-00035#1 add
   
   #依单别预设制程否
   LET l_sfaa.sfaa003 = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa003',l_sfaa.sfaa003)
   LET l_sfaa.sfaa057 = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa057',l_sfaa.sfaa057)
   LET l_sfaa.sfaa061 = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa061',l_sfaa.sfaa061)
   #160727-00025#10 add-S
   IF l_sfaa003 = '5' THEN
      LET l_sfaa.sfaa003 = l_sfaa003
      LET l_sfaa.sfaa061 = 'Y'
      LET l_sfaa.sfaa004 = '2'
   END IF
   #160727-00025#10 add-E
   IF cl_null(l_sfaa.sfaa003) THEN
      LET l_sfaa.sfaa003 = '1'   
   END IF
   IF cl_null(l_sfaa.sfaa057) THEN
      LET l_sfaa.sfaa057 = '1'
   END IF
   IF cl_null(l_sfaa.sfaa061) THEN
      LET l_sfaa.sfaa061 = 'N'
   END IF
   
   #160615-00025#1 add ----(s)
   #若該工單不是製程工單,則不應有製程編號
   IF l_sfaa.sfaa061 = 'N' THEN
      LET l_sfaa.sfaa016 = ''
   END IF
   #160615-00025#1 add ----(e)
   
   CALL s_asft300_06('2',l_sfaa.sfaa010,l_sfaa.sfaa012,l_sfaa.sfaa020) RETURNING l_success,l_sfaa.sfaa019
   IF l_sfaa.sfaa019 < l_sfaa.sfaadocdt THEN
       LET l_days = l_sfaa.sfaadocdt - l_sfaa.sfaa019
       LET l_sfaa.sfaa019 = l_sfaa.sfaadocdt
       #根据当前营运据点g_site抓取aooi120中设置的行事历参照表号
       LET l_ooef008 = ''
       SELECT ooef008 INTO l_ooef008
         FROM ooef_t
        WHERE ooefent = g_enterprise
          AND ooef001 = g_site
       CALL s_date_get_work_date(g_site,l_ooef008,'2',l_sfaa.sfaa020,0,l_days) RETURNING l_sfaa.sfaa020
   END IF
   
   #160526-00013 by whitney modify start
   #LET l_sfaa.sfaa021=g_sfaadocno
   IF cl_null(g_sfaa.sfaa021) THEN
      LET l_sfaa.sfaa021 = g_sfaadocno
   ELSE
      LET l_sfaa.sfaa021 = g_sfaa.sfaa021
   END IF
   LET l_sfaa.sfaa025 = g_sfaadocno
   #160526-00013 by whitney modify end
   
   
   #161028-00064#1 add--------------s--------
   #根据母工单单号取母工单对应的订单单号+项次+客户编号
   #170411-00034#1 modify --(E)--
   #增加項序,分批序
   SELECT sfaa006,sfaa007,sfaa008,sfaa063,sfaa009 INTO l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa024,l_sfaa064,l_sfaa.sfaa009
  #SELECT sfaa006,sfaa007,sfaa009 INTO l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa009
   #170411-00034#1 modify --(E)--  
   FROM sfaa_t  WHERE sfaaent=g_enterprise AND sfaasite=g_site AND sfaadocno=l_sfaa.sfaa021
   #161028-00064#1 add--------------e--------
   
   
   #160615-00025#1 mark -----(s)
   #將此段移到後面執行,避免因為子工單已確認狀態,造成製程產生錯誤
   #IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0039') = 'Y' THEN
   #   LET l_sfaa.sfaastus = 'Y'
   #   LET l_sfaa.sfaacnfid = g_user
   #   LET l_sfaa.sfaacnfdt = cl_get_current()
   #ELSE
   #   LET l_sfaa.sfaastus = 'N'
   #END IF
   #160615-00025#1 mark -----(s)
   LET l_sfaa.sfaastus = 'N'   #160615-00025#1 add
   
   SELECT imaf015,imaf034 INTO l_sfaa.sfaa060,l_sfaa.sfaa072  #170109-00014#1
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = g_site
      AND imaf001 = l_sfaa.sfaa010
   #单位取位
   IF NOT cl_null(l_sfaa.sfaa012) AND NOT cl_null(l_sfaa.sfaa013) THEN
      CALL s_aooi250_take_decimals(l_sfaa.sfaa013,l_sfaa.sfaa012) RETURNING l_success,l_sfaa.sfaa012
   END IF
   IF NOT cl_null(l_sfaa.sfaa012) AND NOT cl_null(l_sfaa.sfaa013) AND NOT cl_null(l_sfaa.sfaa060) THEN
      CALL s_aooi250_convert_qty(l_sfaa.sfaa010,l_sfaa.sfaa013,l_sfaa.sfaa060,l_sfaa.sfaa012) RETURNING l_success,l_sfaa.sfaa058
      IF NOT l_success THEN
         LET l_sfaa.sfaa058 = l_sfaa.sfaa012
      END IF
   END IF
   IF NOT cl_null(l_sfaa.sfaa058) AND NOT cl_null(l_sfaa.sfaa060) THEN
      CALL s_aooi250_take_decimals(l_sfaa.sfaa060,l_sfaa.sfaa058) RETURNING l_success,l_sfaa.sfaa058
   END IF
   
   #161227-00031#1-s-add
   #工單如果有產生子工單時，子工單的完工日應該要拿母工單的開工日往後推算子工單自己的開工日，
   #如果子工單的開工日已經比Today還小，子工單的開工日就給Today
   IF g_today >= g_sfaa.sfaa019 THEN
      LET l_sfaa.sfaa019 = g_today
      LET l_sfaa.sfaa020 = g_today
   ELSE
      LET l_ooef008 = ''
      SELECT ooef008 INTO l_ooef008
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_site
      CALL s_date_get_work_date(g_site,l_ooef008,'2',g_sfaa.sfaa019,0,-1) RETURNING l_sfaa.sfaa020
      CALL s_asft300_06('2',l_sfaa.sfaa010,l_sfaa.sfaa012,l_sfaa.sfaa020) RETURNING l_success,l_sfaa.sfaa019
      IF l_sfaa.sfaa019 < g_today THEN
         LET l_sfaa.sfaa019 = g_today
      END IF
   END IF
   #161227-00031#1-e-add
   
   #170109-00014#1-s
   #EXECUTE s_asft300_02_ins_sfaa_p
   #  USING l_sfaa.sfaaent,l_sfaa.sfaasite,l_sfaa.sfaastus,l_sfaa.sfaadocno,l_sfaa.sfaadocdt,
   #        l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,l_sfaa.sfaa005,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa009,       ##161028-00064#1 add sfaa022,sfaa023,sfaa009
   #        l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,l_sfaa.sfaa015,
   #        l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa019,l_sfaa.sfaa020,l_sfaa.sfaa021,
   #        l_sfaa.sfaa025,l_sfaa.sfaa038,l_sfaa.sfaa039,l_sfaa.sfaa040,l_sfaa.sfaa041,
   #        l_sfaa.sfaa042,l_sfaa.sfaa043,l_sfaa.sfaa044,l_sfaa.sfaa049,l_sfaa.sfaa050,
   #        l_sfaa.sfaa051,l_sfaa.sfaa055,l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,
   #        l_sfaa.sfaa060,l_sfaa.sfaa061,l_sfaa.sfaa062,l_sfaa.sfaa071,l_sfaa.sfaaownid,
   #        l_sfaa.sfaaowndp,l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,l_sfaa.sfaacrtdt
   #170411-00002#1-s
   #EXECUTE s_asft300_02_ins_sfaa_p
   #  USING l_sfaa.sfaaent,l_sfaa.sfaasite,l_sfaa.sfaastus,l_sfaa.sfaadocno,l_sfaa.sfaadocdt,
   #        l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,l_sfaa.sfaa005,
   #        l_sfaa.sfaa009,l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,
   #        l_sfaa.sfaa015,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa019,l_sfaa.sfaa020,
   #        l_sfaa.sfaa021,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa025,l_sfaa.sfaa038,
   #        l_sfaa.sfaa039,l_sfaa.sfaa040,l_sfaa.sfaa041,l_sfaa.sfaa042,l_sfaa.sfaa043,
   #        l_sfaa.sfaa044,l_sfaa.sfaa049,l_sfaa.sfaa050,l_sfaa.sfaa051,l_sfaa.sfaa055,
   #        l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,l_sfaa.sfaa060,l_sfaa.sfaa061,
   #        l_sfaa.sfaa062,l_sfaa.sfaa071,l_sfaa.sfaa072,l_sfaa.sfaaownid,l_sfaa.sfaaowndp,  #170112-00005#1
   #        l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,l_sfaa.sfaacrtdt  #170112-00005#1
   EXECUTE s_asft300_02_ins_sfaa_p
     USING l_sfaa.sfaaent,l_sfaa.sfaasite,l_sfaa.sfaastus,l_sfaa.sfaadocno,l_sfaa.sfaadocdt,
           l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,l_sfaa.sfaa005,
           l_sfaa.sfaa009,l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,
           l_sfaa.sfaa015,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa019,l_sfaa.sfaa020,
           l_sfaa.sfaa021,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa025,l_sfaa.sfaa034,
           l_sfaa.sfaa035,l_sfaa.sfaa038,l_sfaa.sfaa039,l_sfaa.sfaa040,l_sfaa.sfaa041,
           l_sfaa.sfaa042,l_sfaa.sfaa043,l_sfaa.sfaa044,l_sfaa.sfaa049,l_sfaa.sfaa050,
           l_sfaa.sfaa051,l_sfaa.sfaa055,l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,
           l_sfaa024,l_sfaa064,l_sfaa065,l_sfaa.sfaa069,l_sfaa070,l_sfaamodid,l_sfaamoddt,    #170411-00034#1 add #170509-00097#1 add sfaa065,sfaa070,sfaamodid,sfaamoddt  #170509-00098#1 add sfaa069
           l_sfaa.sfaa060,l_sfaa.sfaa061,l_sfaa.sfaa062,l_sfaa.sfaa071,l_sfaa.sfaa072,
           l_sfaa.sfaaownid,l_sfaa.sfaaowndp,l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,l_sfaa.sfaacrtdt
   #170411-00002#1-e
   #170109-00014#1-e
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "INSERT sfaa_t:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   #160727-00025#10 add-S
   IF l_sfaa.sfaa003 = '5' THEN
      INSERT INTO sfai_t (sfaient,sfaidocno,sfaisite,sfai002)
                     VALUES (g_enterprise,l_sfaa.sfaadocno,g_site,0) 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INSERT sfai_t:",SQLERRMESSAGE 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         RETURN r_success
      END IF
   END IF
   #160727-00025#10 add-E
  
  #170411-00034#1 mark --(S)--
  #母工單轉入的子工單,不需寫入工單來源檔  
  ##写入sfab
  #EXECUTE s_asft300_02_ins_sfab_p
  #  USING g_enterprise,g_site,l_sfaa.sfaadocno,l_sfaa.sfaa012
  #IF SQLCA.sqlcode THEN
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.extend = "INSERT sfab_t:",SQLERRMESSAGE
  #   LET g_errparam.code   = SQLCA.sqlcode
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #   RETURN r_success
  #END IF
  #170411-00034#1 mark --(E)-- 
   
   #160615-00025#1 add -----(s)
   #若產生的子工單為自動確認時,需一併產生工單製程資料
   #170327-00069#1-s
   IF NOT (l_sfaa.sfaa057 = '2' AND cl_null(l_sfaa.sfaa017)) AND
      NOT (l_sfaa.sfaa061 = 'Y' AND cl_null(l_sfaa.sfaa016)) THEN
   #170327-00069#1-e
      IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0039') = 'Y' THEN
         IF NOT s_asft300_08(l_sfaa.sfaadocno,l_sfaa.sfaa010,l_sfaa.sfaa016) THEN
            DELETE FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sfaa.sfaadocno
            DELETE FROM sfab_t WHERE sfabent=g_enterprise AND sfabdocno=l_sfaa.sfaadocno
            RETURN r_success
         END IF
         LET l_sfaa.sfaacnfid = g_user
         LET l_sfaa.sfaacnfdt = cl_get_current()
         LET l_sfaa.sfaastus  = 'Y'
         UPDATE sfaa_t
            SET sfaastus  = l_sfaa.sfaastus,
                sfaacnfid = l_sfaa.sfaacnfid,
                sfaacnfdt = l_sfaa.sfaacnfdt
          WHERE sfaaent = g_enterprise
            AND sfaasite = g_site
            AND sfaadocno = l_sfaa.sfaadocno
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "UPDATE sfaa_t:",SQLERRMESSAGE
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      END IF
      #170407-00055#1 add --(S)--
      #判斷子工單單別"自動發放"參數，若等於Y，則再將狀態碼更新為F.發放
      #IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0040') = 'Y' THEN #170526-00027#1 mark
      IF cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0040') = 'Y' AND l_sfaa.sfaastus = 'Y' THEN #170526-00027#1 add      
         CALL s_asft300_released_upd(l_sfaa.sfaadocno) RETURNING l_success
         IF NOT l_success THEN
            RETURN r_success
         ELSE
           #LET l_sfaa.sfaamodid = g_user
           #LET l_sfaa.sfaamoddt = cl_get_current()
            LET l_sfaa.sfaastus = 'F'
            UPDATE sfaa_t SET sfaastus  = l_sfaa.sfaastus
                             #sfaamodid = l_sfaa.sfaamodid,
                             #sfaamoddt = l_sfaa.sfaamoddt
             WHERE sfaaent=g_enterprise AND sfaadocno=l_sfaa.sfaadocno
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "upd sfaa_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()    
               RETURN r_success
            END IF            
         END IF
      END IF
      #170407-00055#1 add --(E)--
   END IF  #170327-00069#1
   #160615-00025#1 add -----(e)
   
   #写入工单生产料号明细
   IF NOT s_asft300_02_gen_children_ins_sfac(l_sfaa.sfaadocno,g_sfba.sfba021) THEN
      RETURN r_success
   END IF
   
   ##产生备料档资料
   #CALL s_asft300_02(l_sfaa.sfaadocno,l_sfaa.sfaa003,l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa015,l_sfaa.sfaa012,'N') RETURNING l_success,l_num
   #IF NOT l_success THEN
   #   DELETE FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sfaa.sfaadocno
   #   DELETE FROM sfba_t WHERE sfbaent=g_enterprise AND sfbadocno=l_sfaa.sfaadocno
   #   RETURN r_success
   #END IF
#170411-00043#1-s mark
#於s_asft300_02()的最後s_asft300_02_c2會統一展子工單的備料，因此這裡還是要mark
#  #161130-00035 add--------s-----
#   #上面那段不知道谁mark的
#   #产生备料档资料
#   CALL s_asft300_02(l_sfaa.sfaadocno,l_sfaa.sfaa003,l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa015,l_sfaa.sfaa012,'N') RETURNING l_success,l_num
#   IF NOT l_success THEN
#      DELETE FROM sfaa_t WHERE sfaaent=g_enterprise AND sfaadocno=l_sfaa.sfaadocno
#      DELETE FROM sfba_t WHERE sfbaent=g_enterprise AND sfbadocno=l_sfaa.sfaadocno
#      RETURN r_success
#   END IF
#   #161130-00035 add--------s-----
#170411-00043#1-e mark
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

#产生生产料号明细资料
PUBLIC FUNCTION s_asft300_02_gen_children_ins_sfac(p_sfaadocno,p_feature)
DEFINE p_sfaadocno  LIKE sfaa_t.sfaadocno
DEFINE p_feature    LIKE sfba_t.sfba021
DEFINE r_success    LIKE type_t.num5
DEFINE l_sfaa       RECORD
    sfaa010    LIKE sfaa_t.sfaa010,
    sfaa011    LIKE sfaa_t.sfaa011,
    sfaa012    LIKE sfaa_t.sfaa012,
    sfaa013    LIKE sfaa_t.sfaa013
                END RECORD
DEFINE l_sql        STRING
DEFINE l_sql1       STRING
DEFINE l_sql2       STRING
DEFINE l_sql3       STRING
DEFINE l_n          LIKE type_t.num5
DEFINE l_sfac       RECORD
    sfacent    LIKE sfac_t.sfacent,
    sfacsite   LIKE sfac_t.sfacsite,
    sfacdocno  LIKE sfac_t.sfacdocno,
    sfacseq    LIKE sfac_t.sfacseq,
    sfac001    LIKE sfac_t.sfac001,
    sfac002    LIKE sfac_t.sfac002,
    sfac003    LIKE sfac_t.sfac003,
    sfac004    LIKE sfac_t.sfac004,
    sfac005    LIKE sfac_t.sfac005,
    sfac006    LIKE sfac_t.sfac006
                END RECORD
DEFINE l_success    LIKE type_t.num5

   LET r_success = FALSE
   
   SELECT sfaa010,sfaa011,sfaa012,sfaa013 INTO l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013
     FROM sfaa_t
    WHERE sfaaent = g_enterprise
      AND sfaasite = g_site
      AND sfaadocno = p_sfaadocno
   
   LET l_sql1 = " SELECT UNIQUE '2',bmab003,bmab004*",l_sfaa.sfaa012/100,",''          FROM bmab_t WHERE bmabent=",g_enterprise,
                "    AND bmabsite='",g_site,"' AND bmab001='",l_sfaa.sfaa010,"' AND bmab002='",l_sfaa.sfaa011,"' "
   LET l_sql2 = " SELECT UNIQUE '3',bmad003,bmad004*",l_sfaa.sfaa012,",bmad005         FROM bmad_t WHERE bmadent=",g_enterprise,
                "    AND bmadsite='",g_site,"' AND bmad001='",l_sfaa.sfaa010,"' AND bmad002='",l_sfaa.sfaa011,"' "
   LET l_sql3 = " SELECT UNIQUE '5',bmac003,bmac005/bmac006*",l_sfaa.sfaa012,",bmac004 FROM bmac_t WHERE bmacent=",g_enterprise,
                "    AND bmacsite='",g_site,"' AND bmac001='",l_sfaa.sfaa010,"' AND bmac002='",l_sfaa.sfaa011,"' " 
   LET l_sql = l_sql1," UNION ",l_sql2," UNION ",l_sql3
   PREPARE s_asft300_02_gen_children_ins_sfac_p FROM l_sql
   DECLARE s_asft300_02_gen_children_ins_sfac_c CURSOR FOR s_asft300_02_gen_children_ins_sfac_p
   #160727-00025#10 add-S
   LET g_sql = " SELECT MAX(sfacseq)+1 FROM sfac_t ",
               "  WHERE sfacent = ? ",
               "    AND sfacsite = ? ",
               "    AND sfacdocno = ? "
   PREPARE s_asft300_02_gen_children_ins_sfac_p2 FROM g_sql
   LET g_sql = " INSERT INTO sfac_t ",
               " (sfacent,sfacsite,sfacdocno,sfacseq,sfac001,sfac002,sfac003,sfac004,sfac005,sfac006) ",
               " VALUES (?,?,?,?,?,?,?,?,?,?) "
   PREPARE s_asft300_02_ins_sfac_p FROM g_sql
   #160727-00025#10 add-E
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM bmad_t
    WHERE bmadent = g_enterprise
      AND bmadsite = g_site
      AND bmad001 = l_sfaa.sfaa010
      AND bmad002 = l_sfaa.sfaa011
   IF l_n = 0 THEN
      INITIALIZE l_sfac.* TO NULL
      EXECUTE s_asft300_02_gen_children_ins_sfac_p2
        USING g_enterprise,g_site,p_sfaadocno
         INTO l_sfac.sfacseq
      IF cl_null(l_sfac.sfacseq) THEN
         LET l_sfac.sfacseq = 1
      END IF
      LET l_sfac.sfacent   = g_enterprise
      LET l_sfac.sfacsite  = g_site
      LET l_sfac.sfacdocno = p_sfaadocno
      LET l_sfac.sfac001   = l_sfaa.sfaa010
      LET l_sfac.sfac002   = '1'
      LET l_sfac.sfac003   = l_sfaa.sfaa012
      LET l_sfac.sfac004   = l_sfaa.sfaa013
      LET l_sfac.sfac005   = 0
      LET l_sfac.sfac006   = p_feature
      EXECUTE s_asft300_02_ins_sfac_p
        USING l_sfac.sfacent,l_sfac.sfacsite,l_sfac.sfacdocno,l_sfac.sfacseq,l_sfac.sfac001,
              l_sfac.sfac002,l_sfac.sfac003,l_sfac.sfac004,l_sfac.sfac005,l_sfac.sfac006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT sfac_t:",SQLERRMESSAGE
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
   END IF
   
   INITIALIZE l_sfac.* TO NULL
   FOREACH s_asft300_02_gen_children_ins_sfac_c
      INTO l_sfac.sfac002,l_sfac.sfac001,l_sfac.sfac003,l_sfac.sfac004
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "s_asft300_02_gen_children_ins_sfac_c:",SQLERRMESSAGE
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      IF cl_null(l_sfac.sfac001) THEN
         CONTINUE FOREACH
      END IF
      EXECUTE s_asft300_02_gen_children_ins_sfac_p2
        USING g_enterprise,g_site,p_sfaadocno
         INTO l_sfac.sfacseq
      IF cl_null(l_sfac.sfacseq) THEN
         LET l_sfac.sfacseq = 1
      END IF
      IF cl_null(l_sfac.sfac004) THEN
         SELECT bmaa004 INTO l_sfac.sfac004
           FROM bmaa_t
          WHERE bmaaent = g_enterprise
            AND bmaasite = g_site
            AND bmaa001 = l_sfaa.sfaa010
            AND bmaa002=l_sfaa.sfaa011
      END IF
      IF l_sfac.sfac002 <> '5' THEN             #170123-00006#1 add副產品不須轉換
         CALL s_aooi250_convert_qty(l_sfaa.sfaa010,l_sfaa.sfaa013,l_sfac.sfac004,l_sfac.sfac003)
              RETURNING l_success,l_sfac.sfac003
      END IF                                    #170123-00006#1 add
      LET l_sfac.sfacent   = g_enterprise
      LET l_sfac.sfacsite  = g_site
      LET l_sfac.sfacdocno = p_sfaadocno
      LET l_sfac.sfac005   = 0
      LET l_sfac.sfac006   = ' '
      #有产品特征时，联产品特征=生产料号特征
      IF l_sfac.sfac002 = '2' AND NOT cl_null(p_feature) THEN
         LET l_sfac.sfac006 = p_feature
      END IF
      EXECUTE s_asft300_02_ins_sfac_p
        USING l_sfac.sfacent,l_sfac.sfacsite,l_sfac.sfacdocno,l_sfac.sfacseq,l_sfac.sfac001,
              l_sfac.sfac002,l_sfac.sfac003,l_sfac.sfac004,l_sfac.sfac005,l_sfac.sfac006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "INSERT sfac_t:",SQLERRMESSAGE
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         RETURN r_success
      END IF
      IF l_sfac.sfac002 = '2' THEN
         #联产品+一般 总数量=生产数量
         UPDATE sfac_t
            SET sfac003 = sfac003 - l_sfac.sfac003
          WHERE sfacent = g_enterprise
            AND sfacsite = g_site
            AND sfacdocno = p_sfaadocno
            AND sfac002 = '1'
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "UPDATE sfac_t:",SQLERRMESSAGE
            LET g_errparam.code   = SQLCA.sqlcode
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            RETURN r_success
         END IF
      END IF
   END FOREACH
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 特征检查是否有设定限定用料
# Memo...........:
# Usage..........: CALL s_asft300_02_tz_check(p_bmcb001,p_bmcb009,p_bmcb011,p_bmcb012,p_inam012)
#                  RETURNING r_flag
# Input parameter: 1.p_bmcb001    主件料号
#                : 2.p_bmcb009    特征类型
#                : 3.p_bmcb011    特征起始值
#                : 4.p_bmcb012    特征终止值
#                : 5.p_inam012    特征值
# Return code....: 1.r_flag       判断特征值是否在限定范围内
# Date & Author..: 14/9/25 By wuxja
# Modify.........: 15/7/20 By wuxja  新增p_bmcb001，p_bmcb009两个参数，判断特征值时需区分数值和文本型
################################################################################
PUBLIC FUNCTION s_asft300_02_tz_check(p_bmcb001,p_bmcb009,p_bmcb011,p_bmcb012,p_inam012)
DEFINE p_bmcb001    LIKE bmcb_t.bmcb001
DEFINE p_bmcb009    LIKE bmcb_t.bmcb009
DEFINE p_bmcb011    LIKE bmcb_t.bmcb011
DEFINE p_bmcb012    LIKE bmcb_t.bmcb012
DEFINE p_inam012    LIKE inam_t.inam012
DEFINE r_flag       LIKE type_t.chr1
DEFINE l_imeb006    LIKE imeb_t.imeb006

   LET r_flag = 'N'
   
   IF cl_null(p_bmcb011) AND cl_null(p_bmcb012) THEN
      LET r_flag = 'Y'
      RETURN r_flag
   END IF
   
   LET l_imeb006 = ''
   EXECUTE s_asft300_02_tz_check_p1 USING g_enterprise,p_bmcb001,p_bmcb009 INTO l_imeb006
   
   IF cl_null(l_imeb006) THEN
      RETURN r_flag
   END IF
   
   IF NOT cl_null(p_bmcb011) AND cl_null(p_bmcb012) THEN
      IF l_imeb006 = '1' THEN
         IF p_inam012 = p_bmcb011 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      ELSE
         IF p_inam012 >= p_bmcb011 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      END IF
   END IF
   IF cl_null(p_bmcb011) AND NOT cl_null(p_bmcb012) THEN
      IF l_imeb006 = '1' THEN
         IF p_inam012 = p_bmcb012 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      ELSE
         IF p_inam012 <= p_bmcb012 THEN
            LET r_flag = 'Y'
            RETURN r_flag
         END IF
      END IF
   END IF
   #起讫都有值，则说明是数值类型的
   IF NOT cl_null(p_bmcb011) AND NOT cl_null(p_bmcb012) THEN
      IF p_inam012 >= p_bmcb011 AND p_inam012 <= p_bmcb012 THEN
         LET r_flag = 'Y'
         RETURN r_flag
      END IF
   END IF
   
   RETURN r_flag
END FUNCTION

################################################################################
# Descriptions...: 工单展备料时，工单来源是订单的，需判断可选件要在订单内有被选择
# Memo...........:
# Usage..........: CALL s_asft300_02_kx(p_bmba001,p_bmba003,p_bmba004,p_bmba007,p_bmba008)
#                  RETURNING r_success
# Input parameter: 1.p_bmba001
#                : 2.p_bmba003
#                : 3.p_bmba004
#                : 4.p_bmba007
#                : 5.p_bmba008
# Return code....: 1.r_success
# Date & Author..: 2014/9/27 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_kx(p_bmba001,p_bmba003,p_bmba004,p_bmba007,p_bmba008)
DEFINE p_bmba001    LIKE bmba_t.bmba001
DEFINE p_bmba003    LIKE bmba_t.bmba003
DEFINE p_bmba004    LIKE bmba_t.bmba004
DEFINE p_bmba007    LIKE bmba_t.bmba007
DEFINE p_bmba008    LIKE bmba_t.bmba008
DEFINE r_success    LIKE type_t.num5
DEFINE r_xmdq006    LIKE xmdq_t.xmdq006
DEFINE r_xmdq007    LIKE xmdq_t.xmdq007
DEFINE l_where      STRING
DEFINE l_sql        STRING
DEFINE l_n          LIKE type_t.num5

   LET r_success = FALSE
   LET r_xmdq006 = ''
   LET r_xmdq007 = ''
   
   IF cl_null(p_bmba001) OR cl_null(p_bmba003) THEN
      RETURN r_success,r_xmdq006,r_xmdq007
   END IF
   
   LET l_where = " WHERE xmdqent = sfabent AND xmdqdocno = sfab002 ",
                 "   AND xmdqent = ",g_enterprise," AND xmdqsite = '",g_site,"' ",
                 "   AND xmdq001 = '",p_bmba003,"' AND xmdq002 = '",p_bmba001,"' ",
                 "   AND sfabdocno = '",g_sfaadocno,"' "
   IF NOT cl_null(p_bmba004) THEN
      LET l_where = l_where," AND xmdq003 = '",p_bmba004,"' "
   END IF
   IF NOT cl_null(p_bmba007) THEN
      LET l_where = l_where," AND xmdq004 = '",p_bmba007,"' "
   END IF
   IF NOT cl_null(p_bmba008) THEN
      LET l_where = l_where," AND xmdq005 = '",p_bmba008,"' "
   END IF
   
   LET l_sql = "SELECT COUNT(1) FROM xmdq_t,sfab_t ",l_where
   PREPARE s_asft300_02_kx_p1 FROM l_sql
   LET l_n = 0
   EXECUTE s_asft300_02_kx_p1 INTO l_n
   IF cl_null(l_n) THEN LET l_n = 0 END IF
   IF l_n = 0 THEN
      RETURN r_success,r_xmdq006,r_xmdq007
   END IF
   
   LET l_sql = "SELECT xmdq006,xmdq007 FROM xmdq_t,sfab_t ",l_where 
   PREPARE s_asft300_02_kx_p2 FROM l_sql
   DECLARE s_asft300_02_kx_c2 CURSOR FOR s_asft300_02_kx_p2
   FOREACH s_asft300_02_kx_c2 INTO r_xmdq006,r_xmdq007
      #只抓一笔
      EXIT FOREACH
   END FOREACH
   
   LET r_success = TRUE
   RETURN r_success,r_xmdq006,r_xmdq007
END FUNCTION

################################################################################
# Descriptions...: 重算QPA分子分母
# Memo...........:
# Usage..........: CALL s_asft300_02_qpa(p_qty1,p_qty2)
#                  RETURNING r_sfba010,r_sfba011
# Input parameter: 
# Return code....: 
# Date & Author..: 2015/07/23 By wuxja
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_qpa(p_qty1,p_qty2)
DEFINE p_qty1       LIKE sfba_t.sfba023
DEFINE p_qty2       LIKE sfba_t.sfba023
DEFINE r_sfba010    LIKE sfba_t.sfba010
DEFINE r_sfba011    LIKE sfba_t.sfba011
DEFINE l_num1       LIKE sfaa_t.sfaa012
DEFINE l_num2       LIKE sfaa_t.sfaa012
DEFINE l_num1_t     LIKE type_t.num20
DEFINE l_num2_t     LIKE type_t.num20
DEFINE l_j          LIKE type_t.num10
DEFINE l_k          LIKE type_t.num10

   LET l_num1 = p_qty1
   LET l_num2 = p_qty2
   LET l_num1_t = l_num1
   LET l_num2_t = l_num2
   
   #整数的话约分，小数的话直接给值（小数约分数值太大）
   IF l_num1 = l_num1_t AND l_num2 = l_num2_t THEN
      #QPA分子分母约分计算
      IF l_num1 < l_num2 THEN
         LET l_j = l_num1_t
      ELSE
         LET l_j = l_num2_t
      END IF
      FOR l_k = l_j TO 1 STEP -1
         IF (l_num1_t MOD l_k = 0) AND (l_num2_t MOD l_k = 0) THEN
            EXIT FOR
         END IF
      END FOR
      
      LET r_sfba010 = l_num2_t / l_k
      LET r_sfba011 = l_num1_t / l_k
   ELSE
      LET r_sfba010 = l_num2
      LET r_sfba011 = l_num1
   END IF
      
   RETURN r_sfba010,r_sfba011
END FUNCTION

################################################################################
# Descriptions...: 庫存可用量=可用倉庫存數量-已開工單未發料量
# Memo...........:
# Usage..........: CALL s_asft300_02_get_qty(p_inag001,p_inag002,p_inag007)
#                  RETURNING r_qty
# Input parameter: 
# Return code....: 
# Date & Author..: 160707-00045 By whitney
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_get_qty(p_inag001,p_inag002,p_inag007)
DEFINE p_inag001    LIKE inag_t.inag001
DEFINE p_inag002    LIKE inag_t.inag002
DEFINE p_inag007    LIKE inag_t.inag007
#DEFINE r_qty        LIKE inag_t.inag009    #170413-00018#1 mark
#DEFINE l_inag009    LIKE inag_t.inag009    #170413-00018#1 mark
DEFINE r_qty        LIKE inag_t.inag008     #170413-00018#1 add
DEFINE l_inag008    LIKE inag_t.inag008     #170413-00018#1 add
DEFINE l_sfba013    LIKE sfba_t.sfba013

   WHENEVER ERROR CONTINUE

   LET r_qty = 0

   #可用倉庫存數量
  #170413-00018#1 mark --(S)-- 
  #LET l_inag009 = 0    
  #EXECUTE s_asft300_02_get_qty_p1 USING g_enterprise,g_site,p_inag001,p_inag002,p_inag007 INTO l_inag009
  #IF cl_null(l_inag009) THEN LET l_inag009 = 0 END IF
  #170413-00018#1 mark --(E)--
   #170413-00018#1 add --(S)--  
   LET l_inag008 = 0    
   EXECUTE s_asft300_02_get_qty_p1 USING g_enterprise,g_site,p_inag001,p_inag002,p_inag007 INTO l_inag008
   IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
   #170413-00018#1 add --(E)--
   
   #已開工單未發料量
   LET l_sfba013 = 0
   EXECUTE s_asft300_02_get_qty_p2 USING g_enterprise,g_site,p_inag001,p_inag002 INTO l_sfba013
   IF cl_null(l_sfba013) THEN LET l_sfba013 = 0 END IF

  #LET r_qty = l_inag009 - l_sfba013    #170413-00018#1 mark
   LET r_qty = l_inag008 - l_sfba013    #170413-00018#1 add

   RETURN r_qty
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_asft300_02_get_doc_default(p_sfaa)
#                  RETURNING r_sfaa
# Input parameter: p_sfaa
# Return code....: r_sfaa
# Date & Author..: 2016/10/07 By fionchen(#160926-00035#1 add)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_get_doc_default(p_sfaa)
DEFINE p_sfaa       RECORD
    sfaaent    LIKE sfaa_t.sfaaent,
    sfaasite   LIKE sfaa_t.sfaasite,
    sfaastus   LIKE sfaa_t.sfaastus,
    sfaadocno  LIKE sfaa_t.sfaadocno,
    sfaadocdt  LIKE sfaa_t.sfaadocdt,
    sfaa001    LIKE sfaa_t.sfaa001,
    sfaa002    LIKE sfaa_t.sfaa002,
    sfaa003    LIKE sfaa_t.sfaa003,
    sfaa004    LIKE sfaa_t.sfaa004,
    sfaa005    LIKE sfaa_t.sfaa005,
    #161028-00064#1 add-------s------
    sfaa022    LIKE sfaa_t.sfaa022,       #来源单号
    sfaa023    LIKE sfaa_t.sfaa023,       #来源项次
    sfaa009    LIKE sfaa_t.sfaa009,       #参考客户
    #161028-00064#1 add-------e------    
    sfaa010    LIKE sfaa_t.sfaa010,
    sfaa011    LIKE sfaa_t.sfaa011,
    sfaa012    LIKE sfaa_t.sfaa012,
    sfaa013    LIKE sfaa_t.sfaa013,
    sfaa015    LIKE sfaa_t.sfaa015,
    sfaa016    LIKE sfaa_t.sfaa016,
    sfaa017    LIKE sfaa_t.sfaa017,
    sfaa019    LIKE sfaa_t.sfaa019,
    sfaa020    LIKE sfaa_t.sfaa020,
    sfaa021    LIKE sfaa_t.sfaa021,
    sfaa025    LIKE sfaa_t.sfaa025,
    sfaa034    LIKE sfaa_t.sfaa034,  #170411-00002#1
    sfaa035    LIKE sfaa_t.sfaa035,  #170411-00002#1
    sfaa038    LIKE sfaa_t.sfaa038,
    sfaa039    LIKE sfaa_t.sfaa039,
    sfaa040    LIKE sfaa_t.sfaa040,
    sfaa041    LIKE sfaa_t.sfaa041,
    sfaa042    LIKE sfaa_t.sfaa042,
    sfaa043    LIKE sfaa_t.sfaa043,
    sfaa044    LIKE sfaa_t.sfaa044,
    sfaa049    LIKE sfaa_t.sfaa049,
    sfaa050    LIKE sfaa_t.sfaa050,
    sfaa051    LIKE sfaa_t.sfaa051,
    sfaa055    LIKE sfaa_t.sfaa055,
    sfaa056    LIKE sfaa_t.sfaa056,
    sfaa057    LIKE sfaa_t.sfaa057,
    sfaa058    LIKE sfaa_t.sfaa058,
    sfaa060    LIKE sfaa_t.sfaa060,
    sfaa061    LIKE sfaa_t.sfaa061,
    sfaa062    LIKE sfaa_t.sfaa062,
    sfaa071    LIKE sfaa_t.sfaa071,
    sfaa072    LIKE sfaa_t.sfaa072,  #170109-00014#1
    sfaa069    LIKE sfaa_t.sfaa069,  #170509-00098#1 add
    sfaaownid  LIKE sfaa_t.sfaaownid,
    sfaaowndp  LIKE sfaa_t.sfaaowndp,
    sfaacrtid  LIKE sfaa_t.sfaacrtid,
    sfaacrtdp  LIKE sfaa_t.sfaacrtdp,
    sfaacrtdt  LIKE sfaa_t.sfaacrtdt,
    sfaacnfid  LIKE sfaa_t.sfaacnfid,
    sfaacnfdt  LIKE sfaa_t.sfaacnfdt
                END RECORD
DEFINE r_sfaa       RECORD
    sfaaent    LIKE sfaa_t.sfaaent,
    sfaasite   LIKE sfaa_t.sfaasite,
    sfaastus   LIKE sfaa_t.sfaastus,
    sfaadocno  LIKE sfaa_t.sfaadocno,
    sfaadocdt  LIKE sfaa_t.sfaadocdt,
    sfaa001    LIKE sfaa_t.sfaa001,
    sfaa002    LIKE sfaa_t.sfaa002,
    sfaa003    LIKE sfaa_t.sfaa003,
    sfaa004    LIKE sfaa_t.sfaa004,
    sfaa005    LIKE sfaa_t.sfaa005,
    #161028-00064#1 add-------s------
    sfaa006    LIKE sfaa_t.sfaa022,       #来源单号
    sfaa007    LIKE sfaa_t.sfaa023,       #来源项次
    sfaa009    LIKE sfaa_t.sfaa009,       #参考客户
    #161028-00064#1 add-------e------
    sfaa010    LIKE sfaa_t.sfaa010,
    sfaa011    LIKE sfaa_t.sfaa011,
    sfaa012    LIKE sfaa_t.sfaa012,
    sfaa013    LIKE sfaa_t.sfaa013,
    sfaa015    LIKE sfaa_t.sfaa015,
    sfaa016    LIKE sfaa_t.sfaa016,
    sfaa017    LIKE sfaa_t.sfaa017,
    sfaa019    LIKE sfaa_t.sfaa019,
    sfaa020    LIKE sfaa_t.sfaa020,
    sfaa021    LIKE sfaa_t.sfaa021,
    sfaa025    LIKE sfaa_t.sfaa025,
    sfaa034    LIKE sfaa_t.sfaa034,  #170411-00002#1
    sfaa035    LIKE sfaa_t.sfaa035,  #170411-00002#1
    sfaa038    LIKE sfaa_t.sfaa038,
    sfaa039    LIKE sfaa_t.sfaa039,
    sfaa040    LIKE sfaa_t.sfaa040,
    sfaa041    LIKE sfaa_t.sfaa041,
    sfaa042    LIKE sfaa_t.sfaa042,
    sfaa043    LIKE sfaa_t.sfaa043,
    sfaa044    LIKE sfaa_t.sfaa044,
    sfaa049    LIKE sfaa_t.sfaa049,
    sfaa050    LIKE sfaa_t.sfaa050,
    sfaa051    LIKE sfaa_t.sfaa051,
    sfaa055    LIKE sfaa_t.sfaa055,
    sfaa056    LIKE sfaa_t.sfaa056,
    sfaa057    LIKE sfaa_t.sfaa057,
    sfaa058    LIKE sfaa_t.sfaa058,
    sfaa060    LIKE sfaa_t.sfaa060,
    sfaa061    LIKE sfaa_t.sfaa061,
    sfaa062    LIKE sfaa_t.sfaa062,
    sfaa071    LIKE sfaa_t.sfaa071,
    sfaa072    LIKE sfaa_t.sfaa072,  #170109-00014#1
    sfaa069    LIKE sfaa_t.sfaa069,  #170509-00098#1 add
    sfaaownid  LIKE sfaa_t.sfaaownid,
    sfaaowndp  LIKE sfaa_t.sfaaowndp,
    sfaacrtid  LIKE sfaa_t.sfaacrtid,
    sfaacrtdp  LIKE sfaa_t.sfaacrtdp,
    sfaacrtdt  LIKE sfaa_t.sfaacrtdt,
    sfaacnfid  LIKE sfaa_t.sfaacnfid,
    sfaacnfdt  LIKE sfaa_t.sfaacnfdt
                END RECORD
DEFINE l_success         LIKE type_t.num5 
DEFINE l_ooba002         LIKE ooba_t.ooba002
   
   LET r_sfaa.* = p_sfaa.*
   CALL s_aooi200_get_slip(p_sfaa.sfaadocno) RETURNING l_success,l_ooba002
   
   LET r_sfaa.sfaa001   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa001',p_sfaa.sfaa001)
   LET r_sfaa.sfaa003   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa003',p_sfaa.sfaa003)
   LET r_sfaa.sfaa057   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa057',p_sfaa.sfaa057)
   LET r_sfaa.sfaa002   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa002',p_sfaa.sfaa002)
   LET r_sfaa.sfaa004   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa004',p_sfaa.sfaa004)
   LET r_sfaa.sfaa005   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa005',p_sfaa.sfaa005)
   LET r_sfaa.sfaa021   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa021',p_sfaa.sfaa021)
   LET r_sfaa.sfaa025   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa025',p_sfaa.sfaa025)
   LET r_sfaa.sfaa010   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa010',p_sfaa.sfaa010)
   LET r_sfaa.sfaa011   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa011',p_sfaa.sfaa011)
   LET r_sfaa.sfaa012   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa012',p_sfaa.sfaa012)
   LET r_sfaa.sfaa013   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa013',p_sfaa.sfaa013)
   LET r_sfaa.sfaa058   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa058',p_sfaa.sfaa058)
   LET r_sfaa.sfaa060   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa060',p_sfaa.sfaa060)
   LET r_sfaa.sfaa061   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa061',p_sfaa.sfaa061)
   LET r_sfaa.sfaa016   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa016',p_sfaa.sfaa016)
   LET r_sfaa.sfaa017   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa017',p_sfaa.sfaa017)
   LET r_sfaa.sfaa019   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa019',p_sfaa.sfaa019)
   LET r_sfaa.sfaa020   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa020',p_sfaa.sfaa020)
   LET r_sfaa.sfaa015   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa015',p_sfaa.sfaa015)
   LET r_sfaa.sfaa062   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa062',p_sfaa.sfaa062)
   LET r_sfaa.sfaa038   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa038',p_sfaa.sfaa038)
   LET r_sfaa.sfaa039   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa039',p_sfaa.sfaa039)
   LET r_sfaa.sfaa040   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa040',p_sfaa.sfaa040)
   LET r_sfaa.sfaa041   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa041',p_sfaa.sfaa041)
   LET r_sfaa.sfaa042   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa042',p_sfaa.sfaa042)
   LET r_sfaa.sfaa043   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa043',p_sfaa.sfaa043)
   LET r_sfaa.sfaa044   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa044',p_sfaa.sfaa044)
   LET r_sfaa.sfaa049   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa049',p_sfaa.sfaa049)
   LET r_sfaa.sfaa050   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa050',p_sfaa.sfaa050)
   LET r_sfaa.sfaa051   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa051',p_sfaa.sfaa051)
   LET r_sfaa.sfaa055   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa055',p_sfaa.sfaa055)
   LET r_sfaa.sfaa056   = s_aooi200_get_doc_default(g_site,'1',l_ooba002,'sfaa056',p_sfaa.sfaa056)
   
   RETURN r_sfaa.*
END FUNCTION

################################################################################
# Descriptions...: 分公司据点产生工单备料档
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20201112 By zhengjt
# Modify.........:
################################################################################
PUBLIC FUNCTION s_asft300_02_ins_sfba2(p_sfaadocno,l_sfba030,l_sfaadocno)

DEFINE l_sfba RECORD  #工單備料單身檔
       sfbaent LIKE sfba_t.sfbaent, #企業編號
       sfbasite LIKE sfba_t.sfbasite, #營運據點
       sfbadocno LIKE sfba_t.sfbadocno, #單號
       sfbaseq LIKE sfba_t.sfbaseq, #項次
       sfbaseq1 LIKE sfba_t.sfbaseq1, #項序
       sfba001 LIKE sfba_t.sfba001, #上階料號
       sfba002 LIKE sfba_t.sfba002, #部位
       sfba003 LIKE sfba_t.sfba003, #作業編號
       sfba004 LIKE sfba_t.sfba004, #作業序
       sfba005 LIKE sfba_t.sfba005, #BOM料號
       sfba006 LIKE sfba_t.sfba006, #發料料號
       sfba007 LIKE sfba_t.sfba007, #投料時距
       sfba008 LIKE sfba_t.sfba008, #必要特性
       sfba009 LIKE sfba_t.sfba009, #倒扣料
       sfba010 LIKE sfba_t.sfba010, #標準QPA分子
       sfba011 LIKE sfba_t.sfba011, #標準QPA分母
       sfba012 LIKE sfba_t.sfba012, #允許誤差率
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba014 LIKE sfba_t.sfba014, #單位
       sfba015 LIKE sfba_t.sfba015, #委外代買數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba017 LIKE sfba_t.sfba017, #報廢數量
       sfba018 LIKE sfba_t.sfba018, #盤虧數量
       sfba019 LIKE sfba_t.sfba019, #指定發料倉庫
       sfba020 LIKE sfba_t.sfba020, #指定發料儲位
       sfba021 LIKE sfba_t.sfba021, #產品特徵
       sfba022 LIKE sfba_t.sfba022, #替代率
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024, #調整應發數量
       sfba025 LIKE sfba_t.sfba025, #超領數量
       sfba026 LIKE sfba_t.sfba026, #SET替代狀態
       sfba027 LIKE sfba_t.sfba027, #SET替代群組
       sfba028 LIKE sfba_t.sfba028, #客供料
       sfba029 LIKE sfba_t.sfba029, #指定發料批號
       sfba030 LIKE sfba_t.sfba030, #指定庫存管理特徵    
       #161109-00085#66 --s add
       sfbaud001 LIKE sfba_t.sfbaud001, #自定義欄位(文字)001
       sfbaud002 LIKE sfba_t.sfbaud002, #自定義欄位(文字)002 ----->养生时间 mod by huna20170719
       sfbaud003 LIKE sfba_t.sfbaud003, #自定義欄位(文字)003
       sfbaud004 LIKE sfba_t.sfbaud004, #自定義欄位(文字)004
       sfbaud005 LIKE sfba_t.sfbaud005, #自定義欄位(文字)005
       sfbaud006 LIKE sfba_t.sfbaud006, #自定義欄位(文字)006
       sfbaud007 LIKE sfba_t.sfbaud007, #自定義欄位(文字)007
       sfbaud008 LIKE sfba_t.sfbaud008, #自定義欄位(文字)008
       sfbaud009 LIKE sfba_t.sfbaud009, #自定義欄位(文字)009
       sfbaud010 LIKE sfba_t.sfbaud010, #自定義欄位(文字)010
       sfbaud011 LIKE sfba_t.sfbaud011, #自定義欄位(數字)011 ----->厚度   mod by huna20170720
       sfbaud012 LIKE sfba_t.sfbaud012, #自定義欄位(數字)012 ----->混合比 mod by huna20170719
       sfbaud013 LIKE sfba_t.sfbaud013, #自定義欄位(數字)013 ----->涂布量 mod by huna20170719
       sfbaud014 LIKE sfba_t.sfbaud014, #自定義欄位(數字)014
       sfbaud015 LIKE sfba_t.sfbaud015, #自定義欄位(數字)015
       sfbaud016 LIKE sfba_t.sfbaud016, #自定義欄位(數字)016
       sfbaud017 LIKE sfba_t.sfbaud017, #自定義欄位(數字)017
       sfbaud018 LIKE sfba_t.sfbaud018, #自定義欄位(數字)018
       sfbaud019 LIKE sfba_t.sfbaud019, #自定義欄位(數字)019
       sfbaud020 LIKE sfba_t.sfbaud020, #自定義欄位(數字)020
       sfbaud021 LIKE sfba_t.sfbaud021, #自定義欄位(日期時間)021
       sfbaud022 LIKE sfba_t.sfbaud022, #自定義欄位(日期時間)022
       sfbaud023 LIKE sfba_t.sfbaud023, #自定義欄位(日期時間)023
       sfbaud024 LIKE sfba_t.sfbaud024, #自定義欄位(日期時間)024
       sfbaud025 LIKE sfba_t.sfbaud025, #自定義欄位(日期時間)025
       sfbaud026 LIKE sfba_t.sfbaud026, #自定義欄位(日期時間)026
       sfbaud027 LIKE sfba_t.sfbaud027, #自定義欄位(日期時間)027
       sfbaud028 LIKE sfba_t.sfbaud028, #自定義欄位(日期時間)028
       sfbaud029 LIKE sfba_t.sfbaud029, #自定義欄位(日期時間)029
       sfbaud030 LIKE sfba_t.sfbaud030, #自定義欄位(日期時間)030
       #161109-00085#66 --e add
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035,  #SET替代套數
       sfba036 LIKE sfba_t.sfba036,  #SET已发料套数
       sfba037 LIKE sfba_t.sfba037   #替代群组
   END RECORD
   DEFINE l_imaa009        LIKE imaa_t.imaa009
   DEFINE l_sfba030        LIKE sfba_t.sfba030
   DEFINE l_sfaadocno      LIKE sfaa_t.sfaadocno
   DEFINE p_sfaadocno      LIKE sfaa_t.sfaadocno
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_num            LIKE type_t.num10
   
   LET l_success = TRUE
   LET l_num = 0
   DECLARE fengongsi_sfba CURSOR FOR SELECT * FROM sfba_t
    WHERE sfbaent = g_enterprise AND sfbasite = 'SY' AND sfbadocno = l_sfaadocno
   FOREACH fengongsi_sfba INTO l_sfba.*
    
      LET l_sfba.sfbasite = g_site
      LET l_sfba.sfbadocno = p_sfaadocno
      LET l_sfba.sfba016 = 0  #已发数量    #add by zhengjt20210202
      LET l_sfba.sfba025 = 0  #超领数量    #add by zhengjt20210202
      IF cl_null(l_sfba.sfba030) THEN
         SELECT imaa009 INTO l_imaa009
           FROM imaa_t
          WHERE imaa001 = l_sfba.sfba006
            AND imaaent = g_enterprise
         IF (l_imaa009[1,1] = '1' OR l_imaa009[1,1] = '2') AND l_imaa009 <> '203' AND l_imaa009 <> '204' THEN #片材
            LET l_sfba.sfba030 = l_sfba030
         END IF 
      END IF
      
      INSERT INTO sfba_t(sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1,
                                     sfba001,sfba002,sfba003,sfba004,sfba005,
                                     sfba006,sfba007,sfba008,sfba009,sfba010,
                                     sfba011,sfba012,sfba013,sfba014,sfba015,
                                     sfba016,sfba017,sfba018,sfba019,sfba020,
                                     sfba021,sfba022,sfba023,sfba024,sfba025,
                                     sfba026,sfba027,sfba028,sfba029,sfba030,
                                     sfbaud001,sfbaud002,sfbaud003,sfbaud004,sfbaud005,
                                     sfbaud006,sfbaud007,sfbaud008,sfbaud009,sfbaud010,
                                     sfbaud011,sfbaud012,sfbaud013,sfbaud014,sfbaud015,
                                     sfbaud016,sfbaud017,sfbaud018,sfbaud019,sfbaud020,
                                     sfbaud021,sfbaud022,sfbaud023,sfbaud024,sfbaud025,
                                     sfbaud026,sfbaud027,sfbaud028,sfbaud029,sfbaud030,
                                     sfba031,sfba032,sfba033,sfba034,sfba035,sfba036,sfba037)
                              VALUES(l_sfba.sfbaent,l_sfba.sfbasite,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,
                                     l_sfba.sfba001,l_sfba.sfba002,l_sfba.sfba003,l_sfba.sfba004,l_sfba.sfba005,
                                     l_sfba.sfba006,l_sfba.sfba007,l_sfba.sfba008,l_sfba.sfba009,l_sfba.sfba010,
                                     l_sfba.sfba011,l_sfba.sfba012,l_sfba.sfba013,l_sfba.sfba014,l_sfba.sfba015,
                                     l_sfba.sfba016,l_sfba.sfba017,l_sfba.sfba018,l_sfba.sfba019,l_sfba.sfba020,
                                     l_sfba.sfba021,l_sfba.sfba022,l_sfba.sfba023,l_sfba.sfba024,l_sfba.sfba025,
                                     l_sfba.sfba026,l_sfba.sfba027,l_sfba.sfba028,l_sfba.sfba029,l_sfba.sfba030,
                                     l_sfba.sfbaud001,l_sfba.sfbaud002,l_sfba.sfbaud003,l_sfba.sfbaud004,l_sfba.sfbaud005,
                                     l_sfba.sfbaud006,l_sfba.sfbaud007,l_sfba.sfbaud008,l_sfba.sfbaud009,l_sfba.sfbaud010,
                                     l_sfba.sfbaud011,l_sfba.sfbaud012,l_sfba.sfbaud013,l_sfba.sfbaud014,l_sfba.sfbaud015,
                                     l_sfba.sfbaud016,l_sfba.sfbaud017,l_sfba.sfbaud018,l_sfba.sfbaud019,l_sfba.sfbaud020,
                                     l_sfba.sfbaud021,l_sfba.sfbaud022,l_sfba.sfbaud023,l_sfba.sfbaud024,l_sfba.sfbaud025,
                                     l_sfba.sfbaud026,l_sfba.sfbaud027,l_sfba.sfbaud028,l_sfba.sfbaud029,l_sfba.sfbaud030,
                                     l_sfba.sfba031,l_sfba.sfba032,l_sfba.sfba033,l_sfba.sfba034,l_sfba.sfba035,l_sfba.sfba036,l_sfba.sfba037)         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins sfba_t",SQLERRMESSAGE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         RETURN l_success
      END IF
      LET l_num = l_num + 1
   END FOREACH
   
   RETURN l_success,l_num
END FUNCTION

 
{</section>}
 
