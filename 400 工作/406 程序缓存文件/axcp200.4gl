#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axcp200.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0105(2016-06-13 17:17:39), PR版次:0105(2021-03-19 16:29:53)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000389
#+ Filename...: axcp200
#+ Description: 發出商品整批生成作業
#+ Creator....: 00768(2015-09-16 17:22:19)
#+ Modifier...: 02295 -SD/PR- 05423
 
{</section>}
 
{<section id="axcp200.global" type="s" >}
#應用 p01 樣板自動產生(Version:23)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#160603-00008#1   2016/06/03  By 02295  发出商品应包含当月出货，当月开票的资料(埃美柯追回)
#160328-00022#5   2016/07/14  By 02040  增加progressbar顯示計算進度條
#160706-00021#2   2016/07/14  By 02097  轉出時(出貨)發出商品科目應取原轉入時的科目，無則取料件對應的會計科目。
#                                       當月出貨又當月開發票者(aist310)則不計入/檢核轉出時，是取銷貨單的多倉儲表
#160804-00042#1   2016/08/04  By 02097  xckb006 應給isag003 而非isagseq 
#160817-00005#1   2016/08/30  By 02097  倉儲預設給值
#160907-00003#4   2016/09/08  By 02097  axcp200: 銷退單時,應取原出貨月份的成本金額
#160907-00003#1   2016/09/22  By 02295  走簽收出貨型式的, 系統沒捉到
#161012-00038#1   2016/10/13  By 01258  发出商品科目调整，销退单资料应只需扣除4、销货折让（泰日升追回）
#161124-00048#12  2016/12/13  By xujing     整批调整系统RECORD LIKE xxxx_t.* 星号写法
#161223-00020#1   2016/12/23  By 02295  效能优化
#161222-00034#1   2017/01/03  By charles4m 調整 axcp200.4gl；當非銷退時，增加取出貨月的年度期別的值。
#170103-00021#1   2017/01/05  By charles4m SQL 多寫了一個 FROM
#170103-00022#1   2017/01/05  By charles4m 取成本域類型時，要使用 g_sys_6002 才正確
#170105-00068#1   2017/01/10  By 06694    調整MERGE語法
#170104-00054#1   2017/01/22  By 02295    效能优化
#170213-00024#1   2017/02/13  By 02295    将insert into的写法改成列出具体的栏位出来
#170214-00060#1   2017/02/20  By charles4m 1. 下QBE 條件無法產生資料。2. 銷退單抓不到出貨單扣帳日。3. 各種 SQL 語法錯誤。4. 發票跟原本出貨/銷退單金額對不上。
#                                          5. 從客戶貨款對帳明細 isag_t 撈資料要多下條件isag001 in ('11','21')。6. 增加抓取開張單價邏輯。7. 處理 xckb037 NULL 問題。
#170220-00038#1   2017/02/20  By charles4m 1.要判斷關帳年月，如果要執行的年月已超過關帳年月，不可重跑資料
#                                          2.PREPARE xckb_pre1 FROM g_sql 少右括號。
#                                          3.PREPARE xckb2_pre3 FROM g_sql isag004*isag005 改為 isag004*isag015。
#170220-00032#1   2017/02/22  By 02295     1. xckc_t 要加上出貨單號、項次，key index要加上這二個欄位
#                                          2. 從xckb_t產生xckc_t資料，要多加出貨單號、項次，另外從上期轉入、計算本月出貨數、本月轉出數這些地方的計算都要多加上出貨單號、項次
#                                          3. 把計算xckc_t這段寫程副程序，讓axcp204可以呼叫統計多期的xckc資料(要本次來用全域變數的值都改用傳入的方式)
#170306-00053#1   2017/03/07  By wujiea    axcp200_xckb2_new（）中将多笔isag合并，isaf011处理空值 
#170217-00025#7   2017/03/07  By zhujing   整批调整未产生数据时，提示消息修正。
#170306-00022#1   2017/03/13  By fionchen  調整因為小數位數的差異，會造成期末金額差異問題
#170207-00034#1   2017/03/14  By fionchen  1.账套开窗过滤操作者权限 2.修改账套后，应带出账套所属法人当前的"现行成本结算年度"和"现行成本结算期别"
#170322-00109#1   2017/03/27  By 00768     若参数“按料件特性计算成本否”为N时，xckb037栏位给空格
#170323-00090#1   2017/03/28  By 02111     PREPARE xckb_pre6 條件不構導致無法 MERGE，增加批號當條件即可。(AND b.xccc008 = a.xckb017)。
#170405-00005#1   2017/04/05  By 08734     修复执行 execute xckb_pre6 报错。
#170417-00016#1   2017/04/18  By 02295     调整#170214-00060#1处理漏掉的地方
#170414-00057#1   2017/04/19  By lixiang   出货单有对应的销退单，抓成本单价时，应以出货单的扣账日期取单价
#170426-00037#1   2017/05/03  By 02295     1.成本类型是3批次成本时有sql关联不完全,应吧批号关联进去,非批次成本不需要抓出批号
#                                          2.出货单走签收流程时,出货单不算在发出商品内
#                                          3.xckb_pre81,82sql中缺少项序的关联
#170504-00033#1   2017/05/12  By ouhz      调整查询axcq200数据借货出货单不应体现在销货成本中
#170512-00092#1   2017/05/17  By 02295     开票的资料抓取的逻辑,关联出货单单身多库储批的表,因为开票端没有项序的问题,所以有对应不到批号,导致抓不到单价
#170606-00027#1   2017/06/09  By 02295     金额取位后总金额与料工费存在差异，此单做尾差处理
#170608-00023#1   2017/06/12  By 02295     调整销退单的单价改抓xcck_t中的单价,因为销退的单价在成本计算时,会根据参数的设置有变化,当月出货当月销退时,单价不一定是axcp500的单价
#170616-00124#1   2017/06/19  By 02295     1.axcp200增加进度条的进度显示
#                                          2.优化之前的逻辑本应该需要mark的段落在本单mark,以便后续读程式方便
#170618-00239#1   2017/06/21  By 08992     修正單號170512-00092調整的SQL只適用於走批次成本(l_xcat005='3')的情況,非批次成本時還是要抓原本的isag005與isag004
#170603-00014#1   2017/06/26  By 02111     1. 單位轉換不應該先取位否則會造成後續數據轉換錯誤，改使用 s_aooi250_convert_qty1()。
#                                          2. 銷退單本月轉出數量、金額需乘上 -1。
#170704-00012#1   2017/07/26  By zhujing   修复多仓储批出货单未统计的问题。
#170808-00050#1   2017/08/14  By 02295     xckb_t 科目如果为空则给一个空格
#170815-00032#1   2017/08/17  By 02295       抓取开票数据的时候如果是销退单,则数量和金额要乘以-1,另外汇总段不需要将销退的部分乘以-1
#170821-00021#1   2017/08/22  By 08172     删除当期已存在的旧资料进度提示放在资料检查后面
#170822-00008#1   2017/08/23  By 09767     确实distinct
#170824-00029#1   2017/08/31  By 02295     在调整尾差的部分中,应判断人工制費的绝对值大小来决定差异分摊在哪个金额上
#170815-00010#1   2017/09/07  By zhujing   【发出商品】的科目获取不正确。应该为agli161设置的glcc006
#170908-00044#1   2017/09/13  By 08992     1.修正個別出貨單計算異常
#                                          2.修正月對帳單未發票補登的单据不參與發出商品计算
#171012-00003#1   2017/10/13  By 05423     出货单的出货性质为2.换货订单和销退单销退方式为5.销退换货的直接写入发出档，不考虑是否开票
#171011-00045#1   2017/10/12  By 02295     开票的数据,如果前段是销退纯金额折让,则在开票的数据中也排除掉
#171013-00013#1   2017/10/16  By 05599     xckb2_pre81|xckb2_pre82 这2处的sql,当l_xcat005='3'时sql关联需要加上xckb036项序,<>'3'时不需要
#171020-00046#1   2017/10/25  By 05599     轉入的部分需排除調撥訂單
#171030-00011#1   2017/10/30  By 02295     在处理金额尾差时,抓取的资料应抓取当期及之前期別的资料,不该抓全部资料
#171030-00036#1   2017/10/31  By 05599     axcp200發出商品轉入排除掉簽退單
#171108-00029#1   2017/11/08  By 05599     axcp200_ins_xckb2_new()这个function中抓取资料时应排除仓库是非成本仓的数
#180305-00034#1   2018/03/06  By 02111     1. 調整 PREPARE xckb2_pre5 FROM g_sql、PREPARE xckb_pre12 FROM g_sql 拿掉 xckb004 = g_comp 、將 xckb004 = imagsite、xckb004 = imafsite 都改抓法人 g_comp。
#                                          2. 170808-00050#1 在 EXECUTE xckb2_pre5 後的 xckb022 = ' ' 應該改為 xckb2_tmp。
#180308-00033#1   2018/03/08  By 02111     axcp200 執行前先檢查是否已產生當期 axct711、axct712 確認單據，若有責不可以執行。
#180408-00007#1   2018/04/08  By 02295     发票计价单位和销售单位不一样时,产品有做转出,但是在回写xckb013和xckb014时,临时表的抓取要用distinct做唯一抓取,不然会报错
#180319-00057#10  2018/04/10  By 10500     据点切换后，预设值要重新带值
#180925-00065#1   2018/09/26  By 02295     金额取位后的尾差处理,绝对值的处理用ABS()不能用s_math_abs()这个元件
#181030-00060#1   2018/11/07  By 06137     優化調整：1.axcp200_ins_xckb_new、axcp200_ins_xckb2_new 優化insert convert_tmp段落
#                                                   2.DELETE FROM convert_tmp 因無條件，所以改用truncate
#                                                   3.金額尾差處理段落，新增註解
#181113-00041#1   2018/11/15  By 02295     优化排除成本仓资料的处理逻辑(因目前会判断xmdl014为空或者null时,走多仓储批时,多仓储批里面是非成本仓会被算入发出商品)
#181126-00029#1   2018/11/27  By 05423     修正获取xccc资料时，由于xckb038(NULL)与xccc002(' ')值不等，抓不到资料的问题
#181206-00043#1   2018/12/12  By 02295     在判断是否为成本仓时,如果是VMI仓,则另外需抓取其结算仓(inaa018)再对其进行判断是否为成本仓
#180802-00020#1   2018/12/17  By 06137     優化尾差處理效能問題
#181112-00039#1   2019/01/04  By 02111     改用 業務人員 (isaf057) 寫入 人員編號 (xckb010)。
#190115-00038#1   2019/01/18  By 02111     調整無條件進位計算方式。
#190310-00001#1   2019/03/11  By 02295     PREPARE xckb2_pre33 FROM g_sql中的SQL应加上DISTINCT的,目前出现重复资料,计算2次(分不同储位出货,且数量一样)
#190311-00010#1   2019/03/13  By 02111     修正 170306-00022#1 轉出轉入尾差處理邏輯。把差異的金額攤到發票金額最大筆。若有多筆實則抓其中一筆更新。
#190312-00007#1   2019/03/22  By 10500     修正当前据点打开axcp200,然后选择账套,其法人与当前据点不一样执行报错的问题
#190328-00054#1   2019/03/29  By 05423     修正pre82中未关联成本域，导致merge时关联条件不足的问题
#190410-00009#1   2019/04/22  By 02295     当销退单有分多库储批,开票开一次时,发出商品的转出会按转入的拆分项序,在判断数量时应判断数量的绝对值做判断
#180814-00076#1   2019/04/28  By 02295     计算xckb027时,需要按数量进行分摊金额,不能每一笔都是总金额,且此金额抓取未税金额
#190514-00040#2   2019/05/22  By 05423     修正年度期别检核方式
#190528-00003#1   2019/05/28  By 02295     调整xckb027,当资料为销退时记录为负数 
#190619-00012#1   2019/06/24  By 02295     销退单当月开票一部分,次月再次开票,在axcp200次月计算时exe34中的数量判断不准确,负数的判断需要用绝对值判断
#190621-00013#1   2019/07/08  By 02295     发出商品计算,转出金额与转入存在尾差时做调整,这部分之前有做过,但由于效能优化和部分单调整导致尾差计算错误.现在本单做一次优化调整
#190708-00016#1   2019/07/08  By 02111     xckb010、xckb011 改抓 出貨單 [業務人員]、[部門編號]。
#190709-00041#1   2019/07/12  By 02295     xckb019的值抓取拿掉,不去抓取aist310上的发票代码.
#190910-00006#1   2019/09/12  By 02295     发出商品转入的部分,增加数量<>0的条件
#191017-00033#1   2019/10/17  By 02295     在走批次成本时,发出商品转出抓取数量未乘以isag015(正负值)
#191113-00006#1   2019/11/14  By 02295     直接抓取数量放入临时表,比率放在算数量的时候算,不要先算出比例值再去用
#191129-00030#1   2019/12/02  By 02295     判断成本域类型应该用g_sys_6002
#190806-00022#1   2019/12/23  By 02295     临时表是有记录到项次项序的,而前面期别的转出已经写入实体表,也都是有分配到项次项序,所以这边可以直接SUM做更新
#190925-00042#1   2020/01/06  By 10042     發票數量不需要依小數位數取位
#200110-00009#1   2020/02/24  By 02295     关联表xmdk_t时,关联字段写错
#200309-00024#1   2020/03/09  By 02295     抓取前期累计已经开票即发出商品转出量时，无需将发票号码加入分组中
#200529-00027#3   2020/06/09  By 12787     增加可背景执行功能
#200415-00064#6   2020/06/24  by 08172     转入改为xmdk007-xckb009
#200710-00047#1   2020/07/14  By 01996     xckb021 转换成本单位数量时,直接用单位转换比例计算
#200709-00103#1   2020/07/20  by 08172     资料存入xckb2_tmp时，对应数值栏位''用cast转换
#200724-00059#1   2020/07/28  By 02295     VMI仓出货单的,xckb仓库要记录结算仓的编号
#200824-00034#1   2020/08/18  By 01534     1:修正PGS 追單錯誤 2:PGS漏改部分 3:MERGE INTO 处理（2020/10/15）
#200908-00049#4   2020/10/20  By 13656     修正cast as varchar写法
#200804-00059#1   2020/08/06  By 01996     更新convert_tmp中,from_qty与to_qty为一致时字段给1
#201026-00005#1   2020/10/28  By 02295     计价单位的数量的已经全部开票,但算成出货单位的数量存在尾差,本单处理将次尾差分摊到最后一笔的开票项序上
#201030-00027#6   2020/11/12  By 01534     判斷參數「走簽收流程，但依出貨認列發出商品否」=Y時，出貨轉入發出商品，axmt580簽收轉出發出商品，axmt590簽退轉出發出商品
#201030-00027#7   2020/11/27  By 01534     1.xckb001來源新增簽退單類型(SCC8343)，抓簽退單時xckb001原先給簽收單，改給簽退單 
#..........................................2.xckb002=-1.轉出，成本單價要依出貨單抓轉入的成本單價做計算，用xckb043、xckb044串xckb005、xckb006轉入的單價(抓第一筆)
#201216-00027#1   2020/12/17  By 01534     1.axcp200 原先是判斷滿足參數時，走新流程；現在都改成判斷該筆出貨/簽收/簽退資料的新欄位=Y時才走新流程，反之為N或為空時走舊流程
#..........................................2.非簽收訂單(xmdk002<>'3')且新欄位為Y時不抓進發出商品；
#..........................................3.xckb_t新增一欄位「新收入準則」checkbox，用來源資料的新欄位給，如果來源是isag_t的給N
#201231-00007#1   2021/01/05  By 02295     1.签收单发出商品转出需要将单位抓入convert_tmp中,后面做单位换算要用到
#                                          2.判断仓库是否为成本的逻辑调整
#210107-00030#1   2021/01/08  By 02295     发出商品转入新增的xckb043签收单对应出货单号和xckb044签收单对应出货项次记录空,这样在计算xckc_t会将转出的部分更新到转入的里面
#210318-00012#1   2021/03/18  By 05423     新收入準則的處理，axcp200 產生發出商品資料，排除費用性料號(imaa004='E')
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
   #200529-00027#3 add -S
   pmaa001     LIKE type_t.chr500, 
   imaa001     LIKE type_t.chr500, 
   glaald      LIKE type_t.chr500, 
   yy          LIKE type_t.num5, 
   pp          LIKE type_t.num5, 
   #200529-00027#3 add -E
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       pmaa001 LIKE type_t.chr500, 
   imaa001 LIKE type_t.chr500, 
   glaald LIKE type_t.chr500, 
   glaald_desc LIKE glaal_t.glaal002, 
   yy LIKE type_t.num5, 
   pp LIKE type_t.num5, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
DEFINE g_condition_display LIKE type_t.chr1   #180813-00044
 
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_success     LIKE type_t.num5

DEFINE g_sys_6001           LIKE ooab_t.ooab002                #系统参数[S-FIN-6001]:採用成本域否
DEFINE g_sys_6002           LIKE ooab_t.ooab002                #系统参数[S-FIN-6002]:成本域類型
DEFINE g_sys_6013           LIKE ooab_t.ooab002                #系统参数[S-FIN-6013]:按料件特性计算成本否  #170322-00109#1 add
DEFINE g_sys_6005           LIKE ooab_t.ooab002                #170414-00057#1 add
DEFINE g_round_type         LIKE ooaa_t.ooaa002                #金额舍入类型

DEFINE g_comp        LIKE xccc_t.xccccomp #法人
DEFINE g_ld          LIKE xccc_t.xcccld   #账别
DEFINE g_yy          LIKE xccc_t.xccc004  #成本年
DEFINE g_pp          LIKE xccc_t.xccc005  #成本期
DEFINE g_last_yy     LIKE xccc_t.xccc004  #成本年-上期
DEFINE g_last_pp     LIKE xccc_t.xccc005  #成本期-上期
DEFINE g_calc_type   LIKE xccc_t.xccc003  #glaa120成本计算类型
DEFINE g_bdate       LIKE glav_t.glav004  #年度+期別對應的起始截止日期
DEFINE g_edate       LIKE glav_t.glav004

DEFINE g_xcat001     LIKE xcat_t.xcat001  #成本计算类型
DEFINE g_glaa003     LIKE glaa_t.glaa003  #会计周期参照表号
DEFINE g_glaa026     LIKE glaa_t.glaa026  #币种参照表号

DEFINE g_glaa001     LIKE glaa_t.glaa001  #使用幣別
DEFINE g_glaa025     LIKE glaa_t.glaa025  #本位幣一 匯率採用
DEFINE g_ooaj006_1   LIKE ooaj_t.ooaj006  #本位幣一 成本單價小數位數
DEFINE g_ooaj007_1   LIKE ooaj_t.ooaj006  #本位幣一 成本金額小數位數

DEFINE g_glaa015     LIKE glaa_t.glaa015  #啟用本位幣二
DEFINE g_glaa016     LIKE glaa_t.glaa016  #本位幣二
DEFINE g_glaa017     LIKE glaa_t.glaa017  #本位幣二 汇种换算基准
DEFINE g_glaa018     LIKE glaa_t.glaa018  #本位幣二 匯率採用
DEFINE g_ooaj006_2   LIKE ooaj_t.ooaj006  #本位幣二 成本單價小數位數
DEFINE g_ooaj007_2   LIKE ooaj_t.ooaj006  #本位幣二 成本金額小數位數

DEFINE g_glaa019     LIKE glaa_t.glaa019  #啟用本位幣三
DEFINE g_glaa020     LIKE glaa_t.glaa020  #本位幣三
DEFINE g_glaa021     LIKE glaa_t.glaa021  #本位幣三 汇种换算基准
DEFINE g_glaa022     LIKE glaa_t.glaa022  #本位幣三 匯率採用
DEFINE g_ooaj006_3   LIKE ooaj_t.ooaj006  #本位幣三 成本單價小數位數
DEFINE g_ooaj007_3   LIKE ooaj_t.ooaj006  #本位幣三 成本金額小數位數

DEFINE g_wc_axm      STRING  #销售单据
DEFINE g_wc_ais      STRING  #发票
DEFINE g_flag        LIKE type_t.num5  #170217-00025#7 add 
DEFINE g_wc_comp     STRING            #170207-00034#1 add 
DEFINE g_para        STRING            #201030-00027#6 add            
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axcp200.main" type="s" >}
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
   CALL s_axc_set_site_default()
      RETURNING g_comp,g_ld,g_yy,g_pp,g_calc_type 
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL axcp200_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_axcp200 WITH FORM cl_ap_formpath("axc",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL axcp200_init()
 
      #進入選單 Menu (="N")
      CALL axcp200_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_axcp200
   END IF
 
   #add-point:作業離開前 name="main.exit"
   #170104-00054#1---add---s

   DROP TABLE convert_tmp; #ODI-ORA#

   DROP TABLE xckb_tmp; #ODI-ORA#

   DROP TABLE xckb2_tmp; #ODI-ORA#
   #170104-00054#1---add---e

   DROP TABLE reached_tmp;        #170908-00044#1 add #ODI-ORA#


   DROP TABLE convert_by_so_tmp;  #170908-00044#1 add #ODI-ORA#

   #201026-00005#1---add---s
   DROP TABLE reup_xckb_tmp;  
   #201026-00005#1---add---e
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="axcp200.init" type="s" >}
#+ 初始化作業
PRIVATE FUNCTION axcp200_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   
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
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="axcp200.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION axcp200_ui_dialog()
 
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
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_errno    LIKE gzze_t.gzze001
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   IF cl_null(g_master.glaald) THEN
      LET g_master.glaald = g_ld
   END IF
   IF cl_null(g_master.yy) OR g_master.yy = 0 THEN
      LET g_master.yy = g_yy
   END IF
   IF cl_null(g_master.pp) OR g_master.pp = 0 THEN
      LET g_master.pp = g_pp
   END IF
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.glaald,g_master.yy,g_master.pp 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
 
               #end add-point
         
                     #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD glaald
            
            #add-point:AFTER FIELD glaald name="input.a.glaald"
            IF NOT cl_null(g_master.glaald)  THEN
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
                  NEXT FIELD CURRENT
               END IF
            END IF
            
            CALL s_desc_get_ld_desc(g_master.glaald) RETURNING g_master.glaald_desc
            DISPLAY BY NAME g_master.glaald_desc
            CALL axcp200_default()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaald
            #add-point:BEFORE FIELD glaald name="input.b.glaald"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaald
            #add-point:ON CHANGE glaald name="input.g.glaald"
            
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
            IF g_master.yy > 9999 THEN
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
            IF g_master.pp > 99 THEN
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
           #CALL q_glaald()      #170207-00034#1 mark
            #170207-00034#1 add --(S)--
            #給予arg
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept 
            #增加帳套過濾條件
            IF cl_null(g_wc_comp) THEN
               CALL s_axrt300_get_site(g_user,'','3') RETURNING g_wc_comp
               LET g_wc_comp = cl_replace_str(g_wc_comp,"ooef017","glaacomp")
            END IF
            IF NOT cl_null(g_wc_comp) THEN
               LET g_qryparam.where = g_wc_comp
            END IF            
            CALL q_authorised_ld()                                #呼叫開窗              
            #170207-00034#1 add --(E)--
            LET g_master.glaald = g_qryparam.return1     #將開窗取得的值>
            DISPLAY BY NAME g_master.glaald
            #170207-00034#1 add --(S)--
            CALL axcp200_default()          
            #170207-00034#1 add --(E)--
            NEXT FIELD glaald
            #END add-point
 
 
         #Ctrlp:input.c.yy
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD yy
            #add-point:ON ACTION controlp INFIELD yy name="input.c.yy"
            
            #END add-point
 
 
         #Ctrlp:input.c.pp
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD pp
            #add-point:ON ACTION controlp INFIELD pp name="input.c.pp"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON pmaa001,imaa001
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmaa001
            #add-point:BEFORE FIELD pmaa001 name="construct.b.pmaa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD pmaa001
            
            #add-point:AFTER FIELD pmaa001 name="construct.a.pmaa001"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.pmaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmaa001
            #add-point:ON ACTION controlp INFIELD pmaa001 name="construct.c.pmaa001"
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_7()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmaa001  #顯示到畫面上
            NEXT FIELD pmaa001                     #返回原欄位
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
 
 
 
 
         #Ctrlp:construct.c.imaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaa001
            #add-point:ON ACTION controlp INFIELD imaa001 name="construct.c.imaa001"
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_imaa001_10()                    #呼叫開窗
           #DISPLAY g_qryparam.return1 TO pmaa001  #顯示到畫面上  #160706-00021#2 mark
           #NEXT FIELD pmaa001                     #返回原欄位    #160706-00021#2 mark  
            DISPLAY g_qryparam.return1 TO imaa001  #顯示到畫面上  #160706-00021#2
            NEXT FIELD imaa001                     #返回原欄位    #160706-00021#2 
            #END add-point
 
 
 
            
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
            CALL axcp200_get_buffer(l_dialog)
            #180813-00044 ---start---
            #顯示上次使用者下的條件
            IF g_condition_display = "Y" THEN
               CALL cl_qbe_display_condition('100001', g_user)
            END IF
            #180813-00044 --- end ---
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            #180319-00057#10   add-S 
            CALL s_axc_set_site_default() RETURNING g_comp,g_master.glaald,g_master.yy,g_master.pp,g_calc_type
            CALL s_desc_get_ld_desc(g_master.glaald) RETURNING g_master.glaald_desc
            CALL axcp200_default()
            DISPLAY BY NAME g_master.*               
            #180319-00057#10   add-E
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
         CALL axcp200_init()
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
      #200529-00027#3 add -S
      LET lc_param.pmaa001 = g_master.pmaa001 
      LET lc_param.imaa001 = g_master.imaa001
      LET lc_param.glaald  = g_master.glaald
      LET lc_param.yy      = g_master.yy
      LET lc_param.pp      = g_master.pp
      IF cl_null(lc_param.wc) THEN
         LET lc_param.wc = " 1=1"
         LET g_master.wc = " 1=1"
      END IF
      #200529-00027#3 add -E
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
                 CALL axcp200_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = axcp200_transfer_argv(ls_js)
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
 
{<section id="axcp200.transfer_argv" type="s" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION axcp200_transfer_argv(ls_js)
 
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
 
{<section id="axcp200.process" type="s" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION axcp200_process(ls_js)
 
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
   DEFINE l_cnt         LIKE type_t.num5 #180308-00033#1 add
   
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE axcp200_process_cs CURSOR FROM ls_sql
#  FOREACH axcp200_process_cs INTO
   #add-point:process段process name="process.process"
   #170220-00038#1 ---addd (s)---
   CALL axcp200_date_chk()
   IF NOT cl_null(g_errno) THEN
      LET g_errparam.extend = g_master.yy
      LET g_errparam.code   = g_errno
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF      
   #170220-00038#1 ---addd (s)---
   #180308-00033#1 add start -----
   SELECT COUNT(*) INTO l_cnt FROM xcea_t 
    WHERE xceaent = g_enterprise AND xceald = g_master.glaald
      #200908-00049#4 --s remark
      AND xcea002 IN ('11','12') AND xcea004 = g_master.yy AND xcea005 = g_master.pp   #PGS(D)-10130 mark
      #200908-00049#4 --e remark
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      LET g_errparam.code   = "axc-00956"
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   #180308-00033#1 add end   -----
   CALL axcp200_create_tmp()    #170104-00054#1
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
        
      
      CALL s_transaction_begin()   
      CALL cl_err_collect_init()  #汇总错误讯息初始化
      LET g_flag = FALSE   #170217-00025#7 add
      
      #執行，生成發出商品資料（xckb_t,xckc_t）
      CALL axcp200_execute() RETURNING l_success
      
      CALL cl_err_collect_show() #显示错误讯息汇总
      IF l_success THEN
         CALL s_transaction_end('Y','0')  
      ELSE
         CALL s_transaction_end('N','0') 
      END IF
      
      #170217-00025#7 add-S
      IF g_flag = FALSE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.code = 'sub-00491'   #無資料產生
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN  
      END IF      
      #170217-00025#7 add-E
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      #200529-00027#3 add -S
      LET g_master.pmaa001 = lc_param.pmaa001
      LET g_master.imaa001 = lc_param.imaa001
      LET g_master.glaald = lc_param.glaald
      LET g_master.yy = lc_param.yy
      LET g_master.pp = lc_param.pp
     
      CALL s_transaction_begin()     
      LET g_flag = FALSE
      
      #執行，生成發出商品資料（xckb_t,xckc_t）
      CALL axcp200_execute() RETURNING l_success
      
      IF l_success THEN
         CALL s_transaction_end('Y','0')  
      ELSE
         CALL s_transaction_end('N','0') 
      END IF
      #200529-00027#3 add -E      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL axcp200_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="axcp200.get_buffer" type="s" >}
PRIVATE FUNCTION axcp200_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.glaald = p_dialog.getFieldBuffer('glaald')
   LET g_master.yy = p_dialog.getFieldBuffer('yy')
   LET g_master.pp = p_dialog.getFieldBuffer('pp')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="axcp200.msgcentre_notify" type="s" >}
PRIVATE FUNCTION axcp200_msgcentre_notify()
 
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
 
{<section id="axcp200.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"

#執行，生成發出商品資料（xckb_t,xckc_t）
PRIVATE FUNCTION axcp200_execute()
   DEFINE r_success  LIKE type_t.num5
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_sql      STRING
   DEFINE li_count   LIKE type_t.num10    #170616-00124#1
   DEFINE l_str      STRING               #170616-00124#1
   LET r_success = TRUE
   
   #170616-00124#1---add---s
   IF g_bgjob <> "Y" THEN
      LET li_count = 5
      CALL cl_progress_bar_no_window(li_count)   
   END IF
   
   #170821-00021#1 -s 20170822 mark by 08172
#   ##畫面顯示處理進度 
#   IF g_bgjob <> "Y" THEN
#      CALL cl_getmsg_parm('axc-00838',g_lang,l_str) RETURNING l_str
#      CALL cl_progress_no_window_ing(l_str)
#   END IF
   #170821-00021#1 -e 20170822 mark by 08172   
   #170616-00124#1---add---e
   
   #取"會計週期參照表號glaa003"，用于取年度+期別對應的起始截止日期
   #取币别glaa001,glaa016,glaa020
   LET g_glaa003=''
   SELECT glaacomp,glaa120,glaa003,glaa026,
          glaa001,glaa025,
          glaa015,glaa016,glaa017,glaa018,
          glaa019,glaa020,glaa021,glaa022
     INTO g_comp,g_xcat001,g_glaa003,g_glaa026,
          g_glaa001,g_glaa025,
          g_glaa015,g_glaa016,g_glaa017,g_glaa018,
          g_glaa019,g_glaa020,g_glaa021,g_glaa022
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = g_master.glaald
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'Select glaa003'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #g_comp判断与处理
   #判断参数 ，若参数 “发出商品不纳入成本计算” 则启动作业，否则不予启动。
   IF cl_get_para(g_enterprise,g_comp,'S-FIN-1003')!='4' THEN
      #参数未设置：发出商品不纳入成本计算，此作业不启动！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axc-00731'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #201030-00027#6-S add   
   LET g_para = ''
   CALL cl_get_para(g_enterprise,g_site,'S-FIN-9029') RETURNING g_para
   IF cl_null(g_para) THEN LET g_para = 'N' END IF 
   #201030-00027#6-E add  
   
   LET g_sys_6001 = cl_get_para(g_enterprise,g_comp,'S-FIN-6001')   #系统参数[S-FIN-6001]:採用成本域否
   LET g_sys_6002 = cl_get_para(g_enterprise,g_comp,'S-FIN-6002')   #系统参数[S-FIN-6002]:成本域類型
   LET g_sys_6005 = cl_get_para(g_enterprise,g_comp,'S-FIN-6005')   #170414-00057#1 add
   
   IF g_sys_6001 = 'N' THEN
      LET g_sys_6002 = ''
   END IF
   LET g_sys_6013 = cl_get_para(g_enterprise,g_comp,'S-FIN-6013')   #系统参数[S-FIN-6013]:按料件特性计算成本否  #170322-00109#1 add
   LET g_round_type = cl_get_para(g_enterprise,'','E-COM-0006')  #取企业参数设置-金额舍入类型
   IF g_round_type NOT MATCHES '[1234]' OR cl_null(g_round_type) THEN
      #进位方式不正确
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00293'
      LET g_errparam.extend = g_round_type
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #币别小数位数设置
   SELECT ooaj006,ooaj007 INTO g_ooaj006_1,g_ooaj007_1 FROM ooaj_t
    WHERE ooajent = g_enterprise                           
      AND ooaj001 = g_glaa026                              
      AND ooaj002 = g_glaa001 
   SELECT ooaj006,ooaj007 INTO g_ooaj006_2,g_ooaj007_2 FROM ooaj_t
    WHERE ooajent = g_enterprise                           
      AND ooaj001 = g_glaa026                              
      AND ooaj002 = g_glaa016 
   SELECT ooaj006,ooaj007 INTO g_ooaj006_3,g_ooaj007_3 FROM ooaj_t
    WHERE ooajent = g_enterprise                           
      AND ooaj001 = g_glaa026                              
      AND ooaj002 = g_glaa020 
      
      
   CALL s_fin_date_get_period_range(g_glaa003,g_master.yy,g_master.pp)
       RETURNING g_bdate,g_edate

   #取上期的年度/期别
   CALL s_fin_date_get_last_period('',g_master.glaald,g_master.yy,g_master.pp)
        RETURNING l_success,g_last_yy,g_last_pp
   IF NOT l_success THEN
      RETURN r_success
   END IF
   
   #170821-00021#1 -s 20170822 add by 08172
   ##畫面顯示處理進度 
   IF g_bgjob <> "Y" THEN
      CALL cl_getmsg_parm('axc-00838',g_lang,l_str) RETURNING l_str
      CALL cl_progress_no_window_ing(l_str)
   END IF   
   #170821-00021#1 -e 20170822 add by 08172
   
   #CALL s_transaction_begin() #170214-00060#1 add  #170104-00054#1 mark

   #根据条件，判断发出商品档是否已经存在对应资料。若已存在，则删除资料后重新统计。
   LET g_wc = g_master.wc
   LET g_wc= cl_replace_str(g_wc,"pmaa001","xckb009") #客戶
   LET g_wc= cl_replace_str(g_wc,"imaa001","xckb012") #產品編號
   LET l_sql = "DELETE FROM xckb_t ",
               " WHERE xckbent = ",g_enterprise,
               "   AND xckbcomp='",g_comp,"' ",
               "   AND xckbld  ='",g_master.glaald,"' ",
               "   AND xckb007 = ",g_master.yy,
               "   AND xckb008 = ",g_master.pp,
               "   AND ",g_wc CLIPPED
   PREPARE axcp200_execute_p1 FROM l_sql
   EXECUTE axcp200_execute_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'delete xckb'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   #170217-00025#7 add-S
   IF SQLCA.sqlerrd[3] > 0 THEN
      LET g_flag = TRUE
   END IF
   #170217-00025#7 add-E
   
   #170220-00032#1---mark---s
   #LET g_wc = g_master.wc
   #LET g_wc = cl_replace_str(g_wc,"pmaa001","xckc003") #客戶
   #LET g_wc = cl_replace_str(g_wc,"imaa001","xckc004") #產品編號
   #LET l_sql = "DELETE FROM xckc_t ",
   #            " WHERE xckcent = ",g_enterprise,
   #            "   AND xckccomp='",g_comp,"' ",
   #            "   AND xckcld  ='",g_master.glaald,"' ",
   #            "   AND xckc001 = ",g_master.yy,
   #            "   AND xckc002 = ",g_master.pp,
   #            "   AND ",g_wc CLIPPED
   #PREPARE axcp200_execute_p2 FROM l_sql
   #EXECUTE axcp200_execute_p2
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = SQLCA.sqlcode
   #   LET g_errparam.extend = 'delete xckc'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #170220-00032#1---mark---e

   #170616-00124#1---add---s
   ##畫面顯示處理進度 
   IF g_bgjob <> "Y" THEN
      CALL cl_getmsg_parm('axc-00839',g_lang,l_str) RETURNING l_str
      CALL cl_progress_no_window_ing(l_str)
   END IF   
   #170616-00124#1---add---e
   
   #170104-00054#1---add---s
   CALL axcp200_ins_xckb_new() RETURNING l_success
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #170616-00124#1---add---s
   ##畫面顯示處理進度 
   IF g_bgjob <> "Y" THEN
      CALL cl_getmsg_parm('axc-00840',g_lang,l_str) RETURNING l_str
      CALL cl_progress_no_window_ing(l_str)
   END IF   
   #170616-00124#1---add---e
   
   CALL axcp200_ins_xckb2_new() RETURNING l_success
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
  
   #180814-00076#1---add---s
   CALL axcp200_deal_xckb027() RETURNING l_success
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF  
   #180814-00076#1---add---e
   
  #CALL s_transaction_begin() #170214-00060#1 mark
   
   #INSERT INTO xckb_t SELECT * FROM xckb_tmp   #170213-00024#1 mark
   #170213-00024#1---add---s
   INSERT INTO xckb_t(xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb007,
                      xckb008,xckb009,xckb010,xckb011,xckb012,xckb013,xckb014,xckb015,xckb016,xckb017,
                      xckb018,xckb019,xckb020,xckb021,xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,
                      xckb028,xckb029,xckb030,xckb031,xckb032,xckb033,xckb034,xckb035,xckb036,xckb037,
                      xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h,
                      xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h,
                      xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h,
                      xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h,
                      xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,
                      xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,
                      xckb038,xckb043,xckb044,xckb045)  #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045
   SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb007,  #201030-00027#6 add DISTINCT
          xckb008,xckb009,xckb010,xckb011,xckb012,xckb013,xckb014,xckb015,xckb016,xckb017,
          xckb018,xckb019,xckb020,xckb021,xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,
          xckb028,xckb029,xckb030,xckb031,xckb032,xckb033,xckb034,xckb035,xckb036,xckb037,
          xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h,
          xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h,
          xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h,
          xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h,
          xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,
          xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,
          xckb038,xckb043,xckb044,xckb045    #201030-00027#6 add xckb043,xckb044   #201216-00027#1 add xckb045
   FROM xckb_tmp       
   #170213-00024#1---add---e
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'INS xckb_t'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      #CALL s_transaction_end('N','0')   #170104-00054#1 mark
      RETURN r_success
   END IF
   #170217-00025#7 add-S
   IF SQLCA.sqlerrd[3] > 0 THEN
      LET g_flag = TRUE
   END IF
   #170217-00025#7 add-E
   #INSERT INTO xckb_t SELECT * FROM xckb2_tmp   #170213-00024#1 mark
   #170213-00024#1---add---s
   INSERT INTO xckb_t(xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb007,
                      xckb008,xckb009,xckb010,xckb011,xckb012,xckb013,xckb014,xckb015,xckb016,xckb017,
                      xckb018,xckb019,xckb020,xckb021,xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,
                      xckb028,xckb029,xckb030,xckb031,xckb032,xckb033,xckb034,xckb035,xckb036,xckb037,
                      xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h,
                      xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h,
                      xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h,
                      xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h,
                      xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,
                      xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,
                      xckb038,xckb043,xckb044,xckb045)   #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045
   SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb007,   #201030-00027#6 add DISTINCT 
          xckb008,xckb009,xckb010,xckb011,xckb012,xckb013,xckb014,xckb015,xckb016,xckb017,
          xckb018,xckb019,xckb020,xckb021,xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,
          xckb028,xckb029,xckb030,xckb031,xckb032,xckb033,xckb034,xckb035,xckb036,xckb037,
          xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h,
          xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h,
          xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h,
          xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h,
          xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,
          xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,
          xckb038,xckb043,xckb044,xckb045   #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045
   FROM xckb2_tmp    
   #170213-00024#1---add---e
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'INS xckb_t'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      #CALL s_transaction_end('N','0')  ##170104-00054#1 mark
      RETURN r_success
   END IF   
   #170104-00054#1---add---e
   
   #170217-00025#7 add-S
   IF SQLCA.sqlerrd[3] > 0 THEN
      LET g_flag = TRUE
   END IF
   #170217-00025#7 add-E
   
   #170213-00024#1---mark---s
   ##170104-00054#1---mark---s
   ##发出商品统计档--用于做分录
   ##获取明细资料，统计出当月的xckb发出商品的月底统计资料
   #CALL axcp200_execute_ins_xckb()
   #   RETURNING l_success
   #IF NOT l_success THEN
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   ##170104-00054#1---mark---e
   #170213-00024#1---mark---e
   
   #170616-00124#1---add---s
   ##畫面顯示處理進度 
   IF g_bgjob <> "Y" THEN
      CALL cl_getmsg_parm('axc-00841',g_lang,l_str) RETURNING l_str
      CALL cl_progress_no_window_ing(l_str)
   END IF   
   #170616-00124#1---add---e
   
   #170306-00022#1 add --(S)--
   ## 小數尾差處理: 當一同出貨單項次拆成二筆項序出貨，出貨單上的總金額是二筆出貨各自數量*單價後的加總
   ## 但這樣在收款時的計算，是用總數量*單價，數量可能相同，但因為單據小數位關係，金額會有尾差
   ## 所以當該出貨單的數量已全數收款，但金額沖銷後有的尾差，要放到這次收款的總金額中
   CALL axcp200_upd_xckb() RETURNING l_success
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #170306-00022#1 add --(E)--

   #170616-00124#1---add---s
   ##畫面顯示處理進度 
   IF g_bgjob <> "Y" THEN
      CALL cl_getmsg_parm('axc-00842',g_lang,l_str) RETURNING l_str
      CALL cl_progress_no_window_ing(l_str)
   END IF   
   #170616-00124#1---add---e
   
   #发出商品汇总统计档——用于汇总查询发出商品金额
   #根据月度统计资料，汇总获得xckc发出商品当月的汇总统计档。
   #170220-00032#1---mod---s
   #CALL axcp200_execute_ins_xckc()
   #   RETURNING l_success
   CALL s_axcp200_ins_xckc(g_master.wc,g_comp,g_master.glaald,g_master.yy,g_master.pp)
      RETURNING l_success   
   #170220-00032#1---mod---s
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

#发出商品统计档--用于做分录
#获取明细资料，统计出当月的xckb发出商品的月底统计资料
PRIVATE FUNCTION axcp200_execute_ins_xckb()
#170616-00124#1---mark---s   
#   DEFINE r_success  LIKE type_t.num5
#   DEFINE l_success  LIKE type_t.num5
#   DEFINE l_sql      STRING
##   DEFINE l_xckb     RECORD LIKE xckb_t.*  #161124-00048#12 mark
#  #161124-00048#12 add(s)
#  DEFINE l_xckb RECORD  #發出商品統計檔
#       xckbent LIKE xckb_t.xckbent, #企业编号
#       xckbcomp LIKE xckb_t.xckbcomp, #法人
#       xckbld LIKE xckb_t.xckbld, #账套
#       xckb001 LIKE xckb_t.xckb001, #来源
#       xckb002 LIKE xckb_t.xckb002, #方向
#       xckb003 LIKE xckb_t.xckb003, #发票号码
#       xckb004 LIKE xckb_t.xckb004, #据点site
#       xckb005 LIKE xckb_t.xckb005, #出货单号
#       xckb006 LIKE xckb_t.xckb006, #出货项次
#       xckb007 LIKE xckb_t.xckb007, #年度
#       xckb008 LIKE xckb_t.xckb008, #期别
#       xckb009 LIKE xckb_t.xckb009, #客户编号
#       xckb010 LIKE xckb_t.xckb010, #人员编号
#       xckb011 LIKE xckb_t.xckb011, #部门编号
#       xckb012 LIKE xckb_t.xckb012, #产品编号
#       xckb013 LIKE xckb_t.xckb013, #销售单位
#       xckb014 LIKE xckb_t.xckb014, #数量
#       xckb015 LIKE xckb_t.xckb015, #仓库编号
#       xckb016 LIKE xckb_t.xckb016, #库位编号
#       xckb017 LIKE xckb_t.xckb017, #批号
#       xckb018 LIKE xckb_t.xckb018, #no use
#       xckb019 LIKE xckb_t.xckb019, #发票编号
#       xckb020 LIKE xckb_t.xckb020, #库存单位
#       xckb021 LIKE xckb_t.xckb021, #库存数量
#       xckb022 LIKE xckb_t.xckb022, #科目编号
#       xckb023 LIKE xckb_t.xckb023, #多角贸易否
#       xckb024 LIKE xckb_t.xckb024, #开票年度
#       xckb025 LIKE xckb_t.xckb025, #开票期别
#       xckb026 LIKE xckb_t.xckb026, #币种一
#       xckb027 LIKE xckb_t.xckb027, #金额
#       xckb028 LIKE xckb_t.xckb028, #币种二
#       xckb029 LIKE xckb_t.xckb029, #金额
#       xckb030 LIKE xckb_t.xckb030, #币种三
#       xckb031 LIKE xckb_t.xckb031, #金额
#       xckb032 LIKE xckb_t.xckb032, #no use
#       xckb033 LIKE xckb_t.xckb033, #no use
#       xckb034 LIKE xckb_t.xckb034, #no use
#       xckb035 LIKE xckb_t.xckb035, #no use
#       xckb036 LIKE xckb_t.xckb036, #项序
#       xckb037 LIKE xckb_t.xckb037, #特性
#       xckb101 LIKE xckb_t.xckb101, #币种一成本单价
#       xckb101a LIKE xckb_t.xckb101a, #币种一成本单价-材料
#       xckb101b LIKE xckb_t.xckb101b, #币种一成本单价-人工
#       xckb101c LIKE xckb_t.xckb101c, #币种一成本单价-加工
#       xckb101d LIKE xckb_t.xckb101d, #币种一成本单价-制费一
#       xckb101e LIKE xckb_t.xckb101e, #币种一成本单价-制费二
#       xckb101f LIKE xckb_t.xckb101f, #币种一成本单价-制费三
#       xckb101g LIKE xckb_t.xckb101g, #币种一成本单价-制费四
#       xckb101h LIKE xckb_t.xckb101h, #币种一成本单价-制费五
#       xckb102 LIKE xckb_t.xckb102, #币种一成本金额
#       xckb102a LIKE xckb_t.xckb102a, #币种一成本金额-材料
#       xckb102b LIKE xckb_t.xckb102b, #币种一成本金额-人工
#       xckb102c LIKE xckb_t.xckb102c, #币种一成本金额-加工
#       xckb102d LIKE xckb_t.xckb102d, #币种一成本金额-制费一
#       xckb102e LIKE xckb_t.xckb102e, #币种一成本金额-制费二
#       xckb102f LIKE xckb_t.xckb102f, #币种一成本金额-制费三
#       xckb102g LIKE xckb_t.xckb102g, #币种一成本金额-制费四
#       xckb102h LIKE xckb_t.xckb102h, #币种一成本金额-制费五
#       xckb111 LIKE xckb_t.xckb111, #币种二成本单价
#       xckb111a LIKE xckb_t.xckb111a, #币种二成本单价-材料
#       xckb111b LIKE xckb_t.xckb111b, #币种二成本单价-人工
#       xckb111c LIKE xckb_t.xckb111c, #币种二成本单价-加工
#       xckb111d LIKE xckb_t.xckb111d, #币种二成本单价-制费一
#       xckb111e LIKE xckb_t.xckb111e, #币种二成本单价-制费二
#       xckb111f LIKE xckb_t.xckb111f, #币种二成本单价-制费三
#       xckb111g LIKE xckb_t.xckb111g, #币种二成本单价-制费四
#       xckb111h LIKE xckb_t.xckb111h, #币种二成本单价-制费五
#       xckb112 LIKE xckb_t.xckb112, #币种二成本金额
#       xckb112a LIKE xckb_t.xckb112a, #币种二成本金额-材料
#       xckb112b LIKE xckb_t.xckb112b, #币种二成本金额-人工
#       xckb112c LIKE xckb_t.xckb112c, #币种二成本金额-加工
#       xckb112d LIKE xckb_t.xckb112d, #币种二成本金额-制费一
#       xckb112e LIKE xckb_t.xckb112e, #币种二成本金额-制费二
#       xckb112f LIKE xckb_t.xckb112f, #币种二成本金额-制费三
#       xckb112g LIKE xckb_t.xckb112g, #币种二成本金额-制费四
#       xckb112h LIKE xckb_t.xckb112h, #币种二成本金额-制费五
#       xckb121 LIKE xckb_t.xckb121, #币种三成本单价
#       xckb121a LIKE xckb_t.xckb121a, #币种三成本单价-材料
#       xckb121b LIKE xckb_t.xckb121b, #币种三成本单价-人工
#       xckb121c LIKE xckb_t.xckb121c, #币种三成本单价-加工
#       xckb121d LIKE xckb_t.xckb121d, #币种三成本单价-制费一
#       xckb121e LIKE xckb_t.xckb121e, #币种三成本单价-制费二
#       xckb121f LIKE xckb_t.xckb121f, #币种三成本单价-制费三
#       xckb121g LIKE xckb_t.xckb121g, #币种三成本单价-制费四
#       xckb121h LIKE xckb_t.xckb121h, #币种三成本单价-制费五
#       xckb122 LIKE xckb_t.xckb122, #币种三成本金额
#       xckb122a LIKE xckb_t.xckb122a, #币种三成本金额-材料
#       xckb122b LIKE xckb_t.xckb122b, #币种三成本金额-人工
#       xckb122c LIKE xckb_t.xckb122c, #币种三成本金额-加工
#       xckb122d LIKE xckb_t.xckb122d, #币种三成本金额-制费一
#       xckb122e LIKE xckb_t.xckb122e, #种三成本金额-制费二
#       xckb122f LIKE xckb_t.xckb122f, #币种三成本金额-制费三
#       xckb122g LIKE xckb_t.xckb122g, #币种三成本金额-制费四
#       xckb122h LIKE xckb_t.xckb122h, #币种三成本金额-制费五
#       xckb038 LIKE xckb_t.xckb038  #成本域
#END RECORD
#  #161124-00048#12 add(e)
##   DEFINE l_xmdk     RECORD LIKE xmdk_t.*  #出货/签收/销退单单头档 #161124-00048#12 mark
#   #161124-00048#12 add(s)
#   DEFINE l_xmdk RECORD  #出貨/簽收/銷退單單頭檔
#       xmdkent LIKE xmdk_t.xmdkent, #企业编号
#       xmdksite LIKE xmdk_t.xmdksite, #营运据点
#       xmdkunit LIKE xmdk_t.xmdkunit, #应用组织
#       xmdkdocno LIKE xmdk_t.xmdkdocno, #单据单号
#       xmdkdocdt LIKE xmdk_t.xmdkdocdt, #单据日期
#       xmdk000 LIKE xmdk_t.xmdk000, #单据性质
#       xmdk001 LIKE xmdk_t.xmdk001, #扣账日期
#       xmdk002 LIKE xmdk_t.xmdk002, #出货性质
#       xmdk003 LIKE xmdk_t.xmdk003, #业务人员
#       xmdk004 LIKE xmdk_t.xmdk004, #业务部门
#       xmdk005 LIKE xmdk_t.xmdk005, #出通/出货单号
#       xmdk006 LIKE xmdk_t.xmdk006, #订单单号
#       xmdk007 LIKE xmdk_t.xmdk007, #订单客户
#       xmdk008 LIKE xmdk_t.xmdk008, #收款客户
#       xmdk009 LIKE xmdk_t.xmdk009, #收货客户
#       xmdk010 LIKE xmdk_t.xmdk010, #收款条件
#       xmdk011 LIKE xmdk_t.xmdk011, #交易条件
#       xmdk012 LIKE xmdk_t.xmdk012, #税种
#       xmdk013 LIKE xmdk_t.xmdk013, #税率
#       xmdk014 LIKE xmdk_t.xmdk014, #单价含税否
#       xmdk015 LIKE xmdk_t.xmdk015, #发票类型
#       xmdk016 LIKE xmdk_t.xmdk016, #币种
#       xmdk017 LIKE xmdk_t.xmdk017, #汇率
#       xmdk018 LIKE xmdk_t.xmdk018, #取价方式
#       xmdk019 LIKE xmdk_t.xmdk019, #优惠条件
#       xmdk020 LIKE xmdk_t.xmdk020, #送货供应商
#       xmdk021 LIKE xmdk_t.xmdk021, #送货地址
#       xmdk022 LIKE xmdk_t.xmdk022, #运输方式
#       xmdk023 LIKE xmdk_t.xmdk023, #交运起点
#       xmdk024 LIKE xmdk_t.xmdk024, #交运终点
#       xmdk025 LIKE xmdk_t.xmdk025, #航次/航班/车号
#       xmdk026 LIKE xmdk_t.xmdk026, #起运日期
#       xmdk027 LIKE xmdk_t.xmdk027, #唛头编号
#       xmdk028 LIKE xmdk_t.xmdk028, #包装单制作
#       xmdk029 LIKE xmdk_t.xmdk029, #Invoice制作
#       xmdk030 LIKE xmdk_t.xmdk030, #销售渠道
#       xmdk031 LIKE xmdk_t.xmdk031, #销售分类
#       xmdk032 LIKE xmdk_t.xmdk032, #结关日期
#       xmdk033 LIKE xmdk_t.xmdk033, #额外品名规格
#       xmdk034 LIKE xmdk_t.xmdk034, #留置原因
#       xmdk035 LIKE xmdk_t.xmdk035, #多角序号
#       xmdk036 LIKE xmdk_t.xmdk036, #集成单号
#       xmdk037 LIKE xmdk_t.xmdk037, #发票号码
#       xmdk038 LIKE xmdk_t.xmdk038, #运输状态
#       xmdk039 LIKE xmdk_t.xmdk039, #在途成本库位
#       xmdk040 LIKE xmdk_t.xmdk040, #在途非成本库位
#       xmdk041 LIKE xmdk_t.xmdk041, #发票编号
#       xmdk042 LIKE xmdk_t.xmdk042, #内外销
#       xmdk043 LIKE xmdk_t.xmdk043, #汇率计算基准
#       xmdk044 LIKE xmdk_t.xmdk044, #多角流程编号
#       xmdk045 LIKE xmdk_t.xmdk045, #多角性质
#       xmdk051 LIKE xmdk_t.xmdk051, #总税前金额
#       xmdk052 LIKE xmdk_t.xmdk052, #总含税金额
#       xmdk053 LIKE xmdk_t.xmdk053, #总税额
#       xmdk054 LIKE xmdk_t.xmdk054, #备注
#       xmdk055 LIKE xmdk_t.xmdk055, #客户收货日
#       xmdk081 LIKE xmdk_t.xmdk081, #对应的签收单号
#       xmdk082 LIKE xmdk_t.xmdk082, #销退方式
#       xmdk083 LIKE xmdk_t.xmdk083, #多角贸易已抛转
#       xmdk084 LIKE xmdk_t.xmdk084, #折让证明单开立否
#       xmdk200 LIKE xmdk_t.xmdk200, #调货经销商编号
#       xmdk201 LIKE xmdk_t.xmdk201, #代送商编号
#       xmdk202 LIKE xmdk_t.xmdk202, #发票客户
#       xmdk203 LIKE xmdk_t.xmdk203, #促销方案编号
#       xmdk204 LIKE xmdk_t.xmdk204, #整单折扣
#       xmdk205 LIKE xmdk_t.xmdk205, #送货站点编号
#       xmdk206 LIKE xmdk_t.xmdk206, #运输路线编号
#       xmdk207 LIKE xmdk_t.xmdk207, #销售组织
#       xmdk208 LIKE xmdk_t.xmdk208, #调货出货单号
#       xmdk209 LIKE xmdk_t.xmdk209, #No Use
#       xmdk210 LIKE xmdk_t.xmdk210, #No Use
#       xmdk211 LIKE xmdk_t.xmdk211, #No Use
#       xmdk212 LIKE xmdk_t.xmdk212, #No Use
#       xmdk213 LIKE xmdk_t.xmdk213, #本币含税总金额
#       xmdk214 LIKE xmdk_t.xmdk214, #收款完成否
#       xmdkownid LIKE xmdk_t.xmdkownid, #资料所有者
#       xmdkowndp LIKE xmdk_t.xmdkowndp, #资料所有部门
#       xmdkcrtid LIKE xmdk_t.xmdkcrtid, #资料录入者
#       xmdkcrtdp LIKE xmdk_t.xmdkcrtdp, #资料录入部门
#       xmdkcrtdt LIKE xmdk_t.xmdkcrtdt, #资料创建日
#       xmdkmodid LIKE xmdk_t.xmdkmodid, #资料更改者
#       xmdkmoddt LIKE xmdk_t.xmdkmoddt, #最近更改日
#       xmdkcnfid LIKE xmdk_t.xmdkcnfid, #资料审核者
#       xmdkcnfdt LIKE xmdk_t.xmdkcnfdt, #数据审核日
#       xmdkpstid LIKE xmdk_t.xmdkpstid, #资料过账者
#       xmdkpstdt LIKE xmdk_t.xmdkpstdt, #资料过账日
#       xmdkstus LIKE xmdk_t.xmdkstus, #状态码
#       xmdk085 LIKE xmdk_t.xmdk085, #数据源(销退)
#       xmdk086 LIKE xmdk_t.xmdk086, #来源单号(销退)
#       xmdk046 LIKE xmdk_t.xmdk046, #集成来源
#       xmdk087 LIKE xmdk_t.xmdk087, #出货走发票仓调拨
#       xmdk047 LIKE xmdk_t.xmdk047, #一次性交易对象识别码
#       xmdk088 LIKE xmdk_t.xmdk088, #来源类型
#       xmdk089 LIKE xmdk_t.xmdk089  #来源单号
##       xmdk048 LIKE xmdk_t.xmdk048, #进口报单
##       xmdk049 LIKE xmdk_t.xmdk049, #进口日期
##       xmdk050 LIKE xmdk_t.xmdk050  #保税异动原因编号
#END RECORD
#   #161124-00048#12 add(e)
##   DEFINE l_xmdl     RECORD LIKE xmdl_t.*  #出货/签收/销退单单身明细档  #161124-00048#12 mark
#   #161124-00048#12 add(s)
#   DEFINE l_xmdl RECORD  #出貨/簽收/銷退單單身明細檔
#       xmdlent LIKE xmdl_t.xmdlent, #企业编号
#       xmdlsite LIKE xmdl_t.xmdlsite, #营运据点
#       xmdldocno LIKE xmdl_t.xmdldocno, #单据编号
#       xmdlseq LIKE xmdl_t.xmdlseq, #项次
#       xmdl001 LIKE xmdl_t.xmdl001, #出通单号
#       xmdl002 LIKE xmdl_t.xmdl002, #出通项次
#       xmdl003 LIKE xmdl_t.xmdl003, #订单单号
#       xmdl004 LIKE xmdl_t.xmdl004, #订单项次
#       xmdl005 LIKE xmdl_t.xmdl005, #订单项序
#       xmdl006 LIKE xmdl_t.xmdl006, #订单分批序
#       xmdl007 LIKE xmdl_t.xmdl007, #子件特性
#       xmdl008 LIKE xmdl_t.xmdl008, #料件编号
#       xmdl009 LIKE xmdl_t.xmdl009, #产品特征
#       xmdl010 LIKE xmdl_t.xmdl010, #包装容器
#       xmdl011 LIKE xmdl_t.xmdl011, #作业编号
#       xmdl012 LIKE xmdl_t.xmdl012, #作业序
#       xmdl013 LIKE xmdl_t.xmdl013, #多库储批出货
#       xmdl014 LIKE xmdl_t.xmdl014, #库位
#       xmdl015 LIKE xmdl_t.xmdl015, #储位
#       xmdl016 LIKE xmdl_t.xmdl016, #批号
#       xmdl017 LIKE xmdl_t.xmdl017, #出货单位
#       xmdl018 LIKE xmdl_t.xmdl018, #数量
#       xmdl019 LIKE xmdl_t.xmdl019, #参考单位
#       xmdl020 LIKE xmdl_t.xmdl020, #参考数量
#       xmdl021 LIKE xmdl_t.xmdl021, #计价单位
#       xmdl022 LIKE xmdl_t.xmdl022, #计价数量
#       xmdl023 LIKE xmdl_t.xmdl023, #检验否
#       xmdl024 LIKE xmdl_t.xmdl024, #单价
#       xmdl025 LIKE xmdl_t.xmdl025, #税种
#       xmdl026 LIKE xmdl_t.xmdl026, #税率
#       xmdl027 LIKE xmdl_t.xmdl027, #税前金额
#       xmdl028 LIKE xmdl_t.xmdl028, #含税金额
#       xmdl029 LIKE xmdl_t.xmdl029, #税额
#       xmdl030 LIKE xmdl_t.xmdl030, #项目编号
#       xmdl031 LIKE xmdl_t.xmdl031, #WBS编号
#       xmdl032 LIKE xmdl_t.xmdl032, #活动编号
#       xmdl033 LIKE xmdl_t.xmdl033, #客户料号
#       xmdl034 LIKE xmdl_t.xmdl034, #QPA
#       xmdl035 LIKE xmdl_t.xmdl035, #已签收量
#       xmdl036 LIKE xmdl_t.xmdl036, #已签退量
#       xmdl037 LIKE xmdl_t.xmdl037, #已销退量
#       xmdl038 LIKE xmdl_t.xmdl038, #主账套已立账数量
#       xmdl039 LIKE xmdl_t.xmdl039, #账套二已立账数量
#       xmdl040 LIKE xmdl_t.xmdl040, #账套三已立账数量
#       xmdl041 LIKE xmdl_t.xmdl041, #保税否
#       xmdl042 LIKE xmdl_t.xmdl042, #取价来源
#       xmdl043 LIKE xmdl_t.xmdl043, #价格来源参考单号
#       xmdl044 LIKE xmdl_t.xmdl044, #价格来源参考项次
#       xmdl045 LIKE xmdl_t.xmdl045, #取出价格
#       xmdl046 LIKE xmdl_t.xmdl046, #价差比
#       xmdl047 LIKE xmdl_t.xmdl047, #已开发票数量
#       xmdl048 LIKE xmdl_t.xmdl048, #发票编号
#       xmdl049 LIKE xmdl_t.xmdl049, #发票号码
#       xmdl050 LIKE xmdl_t.xmdl050, #理由码
#       xmdl051 LIKE xmdl_t.xmdl051, #备注
#       xmdl052 LIKE xmdl_t.xmdl052, #库存管理特征
#       xmdl053 LIKE xmdl_t.xmdl053, #主账套暂估数量
#       xmdl054 LIKE xmdl_t.xmdl054, #账套二暂估数量
#       xmdl055 LIKE xmdl_t.xmdl055, #账套三暂估数量
#       xmdl081 LIKE xmdl_t.xmdl081, #签退数量(签收、签退单使用)
#       xmdl082 LIKE xmdl_t.xmdl082, #签退参考数量(签收、签退单使用)
#       xmdl083 LIKE xmdl_t.xmdl083, #签退计价数量(签收、签退单使用)
#       xmdl084 LIKE xmdl_t.xmdl084, #签退理由码(签收、签退单使用)
#       xmdl085 LIKE xmdl_t.xmdl085, #订单开立据点
#       xmdl086 LIKE xmdl_t.xmdl086, #订单多角性质
#       xmdl087 LIKE xmdl_t.xmdl087, #需自立应收否
#       xmdl088 LIKE xmdl_t.xmdl088, #多角流程编号
#       xmdl089 LIKE xmdl_t.xmdl089, #QC单号
#       xmdl090 LIKE xmdl_t.xmdl090, #判定项次
#       xmdl091 LIKE xmdl_t.xmdl091, #判定结果
#       xmdl092 LIKE xmdl_t.xmdl092, #借货还量数量
#       xmdl093 LIKE xmdl_t.xmdl093, #借货还量参考数量
#       xmdl200 LIKE xmdl_t.xmdl200, #销售渠道
#       xmdl201 LIKE xmdl_t.xmdl201, #产品组编码
#       xmdl202 LIKE xmdl_t.xmdl202, #销售范围编码
#       xmdl203 LIKE xmdl_t.xmdl203, #销售办公室
#       xmdl204 LIKE xmdl_t.xmdl204, #出货包装单位
#       xmdl205 LIKE xmdl_t.xmdl205, #出货包装数量
#       xmdl206 LIKE xmdl_t.xmdl206, #签退包装数量
#       xmdl207 LIKE xmdl_t.xmdl207, #库存锁定等级
#       xmdl208 LIKE xmdl_t.xmdl208, #标准价
#       xmdl209 LIKE xmdl_t.xmdl209, #促销价
#       xmdl210 LIKE xmdl_t.xmdl210, #交易价
#       xmdl211 LIKE xmdl_t.xmdl211, #折价金额
#       xmdl212 LIKE xmdl_t.xmdl212, #销售组织
#       xmdl213 LIKE xmdl_t.xmdl213, #销售人员
#       xmdl214 LIKE xmdl_t.xmdl214, #销售部门
#       xmdl215 LIKE xmdl_t.xmdl215, #合同编号
#       xmdl216 LIKE xmdl_t.xmdl216, #经营方式
#       xmdl217 LIKE xmdl_t.xmdl217, #结算类型
#       xmdl218 LIKE xmdl_t.xmdl218, #结算方式
#       xmdl219 LIKE xmdl_t.xmdl219, #交易类型
#       xmdl220 LIKE xmdl_t.xmdl220, #寄销已核销数量
#       xmdl222 LIKE xmdl_t.xmdl222, #地区编号
#       xmdl223 LIKE xmdl_t.xmdl223, #县市编号
#       xmdl224 LIKE xmdl_t.xmdl224, #省区编号
#       xmdl225 LIKE xmdl_t.xmdl225, #区域编号
#       xmdl226 LIKE xmdl_t.xmdl226, #商品条码
#       xmdlunit LIKE xmdl_t.xmdlunit, #应用组织
#       xmdlorga LIKE xmdl_t.xmdlorga, #账务组织
#       xmdl056 LIKE xmdl_t.xmdl056, #检验合格量
#       xmdl094 LIKE xmdl_t.xmdl094, #来源单号(销退)
#       xmdl095 LIKE xmdl_t.xmdl095, #项次(销退)
#       xmdl227 LIKE xmdl_t.xmdl227, #现金折扣单号
#       xmdl228 LIKE xmdl_t.xmdl228, #现金折扣单项次
#       xmdl057 LIKE xmdl_t.xmdl057, #有效日期
#       xmdl058 LIKE xmdl_t.xmdl058, #制造日期
#       xmdl096 LIKE xmdl_t.xmdl096, #来源项次
#       xmdl059 LIKE xmdl_t.xmdl059, #客户退货量
#       xmdl060 LIKE xmdl_t.xmdl060  #放行状态
#END RECORD
#   #161124-00048#12 add(e)
##   DEFINE l_xmdm     RECORD LIKE xmdm_t.*  #出货/签收/销退单多库储批出货明细档 #161124-00048#12 mark
#   #161124-00048#12 add(s)
#   DEFINE l_xmdm RECORD  #出貨/簽收/銷退單多庫儲批出貨明細檔
#       xmdment LIKE xmdm_t.xmdment, #企业编号
#       xmdmsite LIKE xmdm_t.xmdmsite, #营运据点
#       xmdmdocno LIKE xmdm_t.xmdmdocno, #出货单号
#       xmdmseq LIKE xmdm_t.xmdmseq, #项次
#       xmdmseq1 LIKE xmdm_t.xmdmseq1, #项序
#       xmdm001 LIKE xmdm_t.xmdm001, #料件编号
#       xmdm002 LIKE xmdm_t.xmdm002, #产品特征
#       xmdm003 LIKE xmdm_t.xmdm003, #作业编号
#       xmdm004 LIKE xmdm_t.xmdm004, #作业序
#       xmdm005 LIKE xmdm_t.xmdm005, #限定库位
#       xmdm006 LIKE xmdm_t.xmdm006, #限定储位
#       xmdm007 LIKE xmdm_t.xmdm007, #限定批号
#       xmdm008 LIKE xmdm_t.xmdm008, #单位
#       xmdm009 LIKE xmdm_t.xmdm009, #出货数量
#       xmdm010 LIKE xmdm_t.xmdm010, #参考单位
#       xmdm011 LIKE xmdm_t.xmdm011, #参考数量
#       xmdm012 LIKE xmdm_t.xmdm012, #已签收数量
#       xmdm013 LIKE xmdm_t.xmdm013, #已签退数量
#       xmdm014 LIKE xmdm_t.xmdm014, #已销退数量
#       xmdm031 LIKE xmdm_t.xmdm031, #签退数量
#       xmdm032 LIKE xmdm_t.xmdm032, #签退参考数量
#       xmdm033 LIKE xmdm_t.xmdm033, #库存管理特征
#       xmdm034 LIKE xmdm_t.xmdm034, #备置量
#       xmdm035 LIKE xmdm_t.xmdm035  #在拣量
#END RECORD
#   #161124-00048#12 add(e)
##   DEFINE l_isaf     RECORD LIKE isaf_t.* #161124-00048#12 mark
##   DEFINE l_isag     RECORD LIKE isag_t.* #161124-00048#12 mark
#   #161124-00048#12 add(s)
#   DEFINE l_isaf RECORD  #銷項發票主檔
#       isafent LIKE isaf_t.isafent, #企业编码
#       isafsite LIKE isaf_t.isafsite, #账务组织
#       isafcomp LIKE isaf_t.isafcomp, #法人
#       isafdocno LIKE isaf_t.isafdocno, #开票单号
#       isafdocdt LIKE isaf_t.isafdocdt, #录入日期
#       isaf001 LIKE isaf_t.isaf001, #发票来源
#       isaf002 LIKE isaf_t.isaf002, #发票客户
#       isaf003 LIKE isaf_t.isaf003, #账款客户
#       isaf004 LIKE isaf_t.isaf004, #业务组织
#       isaf005 LIKE isaf_t.isaf005, #开票人员
#       isaf006 LIKE isaf_t.isaf006, #开票部门
#       isaf007 LIKE isaf_t.isaf007, #扣账日期
#       isaf008 LIKE isaf_t.isaf008, #发票类型
#       isaf009 LIKE isaf_t.isaf009, #电子发票否
#       isaf010 LIKE isaf_t.isaf010, #发票编号
#       isaf011 LIKE isaf_t.isaf011, #发票号码
#       isaf012 LIKE isaf_t.isaf012, #发票检查码
#       isaf013 LIKE isaf_t.isaf013, #发票防伪随机码
#       isaf014 LIKE isaf_t.isaf014, #发票日期
#       isaf015 LIKE isaf_t.isaf015, #发票时间
#       isaf016 LIKE isaf_t.isaf016, #税种
#       isaf017 LIKE isaf_t.isaf017, #含税否
#       isaf018 LIKE isaf_t.isaf018, #税率
#       isaf019 LIKE isaf_t.isaf019, #申报格式
#       isaf020 LIKE isaf_t.isaf020, #发票号码迄号
#       isaf021 LIKE isaf_t.isaf021, #购货方名称
#       isaf022 LIKE isaf_t.isaf022, #购货方税务编号
#       isaf023 LIKE isaf_t.isaf023, #购货方地址
#       isaf024 LIKE isaf_t.isaf024, #购货方电话
#       isaf025 LIKE isaf_t.isaf025, #购货方开户银行
#       isaf026 LIKE isaf_t.isaf026, #购货方账户编码
#       isaf027 LIKE isaf_t.isaf027, #销货方名称
#       isaf028 LIKE isaf_t.isaf028, #销方税务编号
#       isaf029 LIKE isaf_t.isaf029, #销货方地址
#       isaf030 LIKE isaf_t.isaf030, #销货方电话
#       isaf031 LIKE isaf_t.isaf031, #销货方开户银行
#       isaf032 LIKE isaf_t.isaf032, #销货方帐号
#       isaf033 LIKE isaf_t.isaf033, #POS机号
#       isaf034 LIKE isaf_t.isaf034, #POS单号
#       isaf035 LIKE isaf_t.isaf035, #应收单号
#       isaf036 LIKE isaf_t.isaf036, #发票异动状态
#       isaf037 LIKE isaf_t.isaf037, #异动理由码
#       isaf038 LIKE isaf_t.isaf038, #异动备注
#       isaf039 LIKE isaf_t.isaf039, #异动日期
#       isaf040 LIKE isaf_t.isaf040, #异动时间
#       isaf041 LIKE isaf_t.isaf041, #异动人员
#       isaf042 LIKE isaf_t.isaf042, #项目作废核准文号
#       isaf043 LIKE isaf_t.isaf043, #通关方式注记
#       isaf044 LIKE isaf_t.isaf044, #打印次数
#       isaf045 LIKE isaf_t.isaf045, #支付工具卡号1
#       isaf046 LIKE isaf_t.isaf046, #支付工具卡号2
#       isaf047 LIKE isaf_t.isaf047, #支付工具卡号3
#       isaf048 LIKE isaf_t.isaf048, #辅助账二应收单号
#       isaf049 LIKE isaf_t.isaf049, #辅助账三应收单号
#       isaf050 LIKE isaf_t.isaf050, #生成方式
#       isaf051 LIKE isaf_t.isaf051, #发票簿号
#       isaf052 LIKE isaf_t.isaf052, #发票簿号对应的营运据点
#       isaf053 LIKE isaf_t.isaf053, #发票联数
#       isaf054 LIKE isaf_t.isaf054, #课税种
#       isaf055 LIKE isaf_t.isaf055, #收款客户
#       isaf056 LIKE isaf_t.isaf056, #发票性质
#       isaf057 LIKE isaf_t.isaf057, #业务人员
#       isaf058 LIKE isaf_t.isaf058, #收款条件
#       isaf100 LIKE isaf_t.isaf100, #币种
#       isaf101 LIKE isaf_t.isaf101, #汇率
#       isaf103 LIKE isaf_t.isaf103, #发票原币税前金额
#       isaf104 LIKE isaf_t.isaf104, #发票原币税额
#       isaf105 LIKE isaf_t.isaf105, #发票原币含税金额
#       isaf106 LIKE isaf_t.isaf106, #发票原币留抵税额
#       isaf107 LIKE isaf_t.isaf107, #发票原币已折金额
#       isaf108 LIKE isaf_t.isaf108, #发票原币已折税额
#       isaf113 LIKE isaf_t.isaf113, #发票本币税前金额
#       isaf114 LIKE isaf_t.isaf114, #发票本币税额
#       isaf115 LIKE isaf_t.isaf115, #发票本币含税金额
#       isaf116 LIKE isaf_t.isaf116, #发票本币留抵税额
#       isaf117 LIKE isaf_t.isaf117, #发票本币已折金额
#       isaf118 LIKE isaf_t.isaf118, #发票本币已折税额
#       isaf119 LIKE isaf_t.isaf119, #账款应税金额
#       isaf120 LIKE isaf_t.isaf120, #账款零税金额
#       isaf121 LIKE isaf_t.isaf121, #账款免税金额
#       isaf122 LIKE isaf_t.isaf122, #礼券已开发票金额
#       isaf123 LIKE isaf_t.isaf123, #礼券已开发票税额
#       isaf124 LIKE isaf_t.isaf124, #已开发票留抵税额
#       isaf201 LIKE isaf_t.isaf201, #爱心码
#       isaf202 LIKE isaf_t.isaf202, #载具类别号码
#       isaf203 LIKE isaf_t.isaf203, #载具显码 ID
#       isaf204 LIKE isaf_t.isaf204, #载具隐码 ID
#       isaf205 LIKE isaf_t.isaf205, #电子发票导出状态
#       isaf206 LIKE isaf_t.isaf206, #电子发票导出序号
#       isaf207 LIKE isaf_t.isaf207, #电子发票领取方式
#       isaf208 LIKE isaf_t.isaf208, #申报年度
#       isaf209 LIKE isaf_t.isaf209, #申报月份
#       isaf210 LIKE isaf_t.isaf210, #申报据点
#       isafstus LIKE isaf_t.isafstus, #状态码
#       isafownid LIKE isaf_t.isafownid, #资料所有者
#       isafowndp LIKE isaf_t.isafowndp, #资料所有部门
#       isafcrtid LIKE isaf_t.isafcrtid, #资料录入者
#       isafcrtdp LIKE isaf_t.isafcrtdp, #资料录入部门
#       isafcrtdt LIKE isaf_t.isafcrtdt, #资料创建日
#       isafmodid LIKE isaf_t.isafmodid, #资料更改者
#       isafmoddt LIKE isaf_t.isafmoddt, #最近更改日
#       isafcnfid LIKE isaf_t.isafcnfid, #资料审核者
#       isafcnfdt LIKE isaf_t.isafcnfdt, #数据审核日
#       isaf059 LIKE isaf_t.isaf059, #适用零税率规定
#       isaf060 LIKE isaf_t.isaf060, #通关方式
#       isaf061 LIKE isaf_t.isaf061, #非经海关证明文档名称
#       isaf062 LIKE isaf_t.isaf062, #非经海关证明文档号码
#       isaf063 LIKE isaf_t.isaf063, #经由海关出口报单类别
#       isaf064 LIKE isaf_t.isaf064, #出口报单号码
#       isaf065 LIKE isaf_t.isaf065, #输出或结汇日期
#       isaf066 LIKE isaf_t.isaf066, #商业发票号码(IV no.)
#       isaf067 LIKE isaf_t.isaf067  #一次性交易对象
#END RECORD
#DEFINE l_isag RECORD  #銷項發票來源明細檔
#       isagent LIKE isag_t.isagent, #企业编号
#       isagcomp LIKE isag_t.isagcomp, #法人
#       isagdocno LIKE isag_t.isagdocno, #开票单号
#       isagseq LIKE isag_t.isagseq, #项次
#       isagorga LIKE isag_t.isagorga, #来源组织
#       isag001 LIKE isag_t.isag001, #来源类型
#       isag002 LIKE isag_t.isag002, #来源单号
#       isag003 LIKE isag_t.isag003, #来源项次
#       isag004 LIKE isag_t.isag004, #发票数量
#       isag005 LIKE isag_t.isag005, #发票单位
#       isag006 LIKE isag_t.isag006, #税种
#       isag007 LIKE isag_t.isag007, #含税否
#       isag008 LIKE isag_t.isag008, #税率
#       isag009 LIKE isag_t.isag009, #料号
#       isag010 LIKE isag_t.isag010, #品名
#       isag011 LIKE isag_t.isag011, #期别
#       isag012 LIKE isag_t.isag012, #收款条件
#       isag013 LIKE isag_t.isag013, #原始发票编号
#       isag014 LIKE isag_t.isag014, #原始发票号码
#       isag015 LIKE isag_t.isag015, #正负值
#       isag016 LIKE isag_t.isag016, #客户料号
#       isag017 LIKE isag_t.isag017, #客户品名
#       isag101 LIKE isag_t.isag101, #原币单价
#       isag103 LIKE isag_t.isag103, #原币税前金额
#       isag104 LIKE isag_t.isag104, #原币税额
#       isag105 LIKE isag_t.isag105, #原币税后金额
#       isag106 LIKE isag_t.isag106, #订金发票已被摊税前额
#       isag113 LIKE isag_t.isag113, #本币税前金额
#       isag114 LIKE isag_t.isag114, #本币税额
#       isag115 LIKE isag_t.isag115, #本币税后金额
#       isag116 LIKE isag_t.isag116, #原币已收金额
#       isag117 LIKE isag_t.isag117, #本币已收金额
#       isag126 LIKE isag_t.isag126, #辅助账二原币已收金额　
#       isag127 LIKE isag_t.isag127, #辅助账二本币已收金额　
#       isag128 LIKE isag_t.isag128, #辅助账二应收单号
#       isag136 LIKE isag_t.isag136, #辅助账三原币已收金额　
#       isag137 LIKE isag_t.isag137, #辅助账二本币已收金额　
#       isag138 LIKE isag_t.isag138, #辅助账三应收单号
#       isag018 LIKE isag_t.isag018  #订金已开发票
#END RECORD
#   #161124-00048#12 add(e)
#   DEFINE l_count    LIKE type_t.num10
#   DEFINE l_isaf014  LIKE isaf_t.isaf014   #发票日期
#   DEFINE l_type     LIKE type_t.num5
#   DEFINE l_imaa006  LIKE imaa_t.imaa006  #成本用基础单位
#   DEFINE l_xcbf001  LIKE xcbf_t.xcbf001  #成本域
#   DEFINE l_qty      LIKE xmdl_t.xmdl018  #发出商品数量
#   DEFINE l_isag004  LIKE isag_t.isag004  #已开发票数量
#   DEFINE l_msg      STRING #160328-00022#5
#   DEFINE l_xmdmseq1	LIKE xmdm_t.xmdmseq1  #160706-00021#2
#   DEFINE l_xmdm005	LIKE xmdm_t.xmdm005   #160706-00021#2
#   DEFINE l_xmdm006	LIKE xmdm_t.xmdm006   #160706-00021#2
#   DEFINE l_xmdm007	LIKE xmdm_t.xmdm007   #160706-00021#2
#   DEFINE l_xmdm008	LIKE xmdm_t.xmdm008   #160706-00021#2
#   DEFINE l_xmdm009	LIKE xmdm_t.xmdm009   #160706-00021#2
#   DEFINE l_xcat005  LIKE xcat_t.xcat005   #160706-00021#2
#   DEFINE l_glav001  LIKE glav_t.glav001   #160706-00021#2
#   DEFINE l_ld       LIKE glaa_t.glaald    #160706-00021#2
#   DEFINE l_xckb007  LIKE xckb_t.xckb007   #160706-00021#2
#   DEFINE l_xckb008  LIKE xckb_t.xckb008   #160706-00021#2
#   DEFINE l_xmdl001  LIKE xmdl_t.xmdl001   #160706-00021#2
#   #170414-00057#1 add--s
#   DEFINE l_xmdkdocdt LIKE xmdk_t.xmdkdocdt 
#   DEFINE l_xmdk000   LIKE xmdk_t.xmdk000  
#   DEFINE l_count5    LIKE type_t.num5
#   #170414-00057#1 add---e
#   
#   LET r_success = TRUE
#  #160328-00022#5-s-add
#   IF g_bgjob <> "Y" THEN
#      LET l_count = 3
#      CALL cl_progress_bar_no_window(l_count)   
#   END IF       
#  #160328-00022#5-e-add   
#   
#   #160706-00021#2--s
#   CALL s_fin_get_major_ld(g_comp) RETURNING l_ld
#   SELECT glaa003 INTO l_glav001 FROM glaa_t
#    WHERE glaaent = g_enterprise
#      AND glaald  = l_ld
#   #160706-00021#2--e
#   LET l_count = 0
#
#   #160328-00022#5-s-add
#   IF g_bgjob <> "Y" THEN 
#      LET l_msg = cl_getmsg_parm("axc-00781",g_lang,'')  #抓取出貨資料寫入發出商品統計檔！           
#      CALL cl_progress_no_window_ing(l_msg)          
#   END IF      
#   #160328-00022#5-e-add 
#
#   #取出货单(axmt540)
#   #取签收单(axmt680):xmdk002 = ‘3’的不要抓，就类似于oga65客户出货签收否 = ‘Y’。表示这张出货单是需要签收的
#   #取签退单(axmt690)
#   #取销退单(axmt600)
#   #开票资料(axrt310)
#   #LET g_wc = g_master.wc
#   LET g_wc_axm = g_master.wc
#   LET g_wc_axm = cl_replace_str(g_wc_axm,"pmaa001","xmdk008") #客戶
#   LET g_wc_axm = cl_replace_str(g_wc_axm,"imaa001","xmdl008") #產品編號
#   
#   #161223-00020#1---add---s
#   SELECT xcat005 INTO l_xcat005
#     FROM xcat_t
#    WHERE xcatent = g_enterprise
#      AND xcat001 = g_xcat001  
#                    
#  #LET l_sql = " SELECT xcbf001 FROM FROM xcbf_t WHERE xcbfent =",g_enterprise," AND xcbfcomp = '",g_comp,"' AND xcbf002 =? " #170103-00021#1 mark
#   LET l_sql = " SELECT xcbf001 FROM xcbf_t WHERE xcbfent =",g_enterprise," AND xcbfcomp = '",g_comp,"' AND xcbf002 =? " #170103-00021#1 add
#   PREPARE p200_xckb_pre1 FROM l_sql
#   
#   
#   LET l_sql = " SELECT glav002,glav006 ",
#               "   FROM xmdl_t,xmdk_t,glav_t ",
#               "  WHERE xmdlent = ",g_enterprise,
#               "    AND xmdldocno = ? AND xmdlseq = ?  ",
#               "    AND xmdlent = xmdkent AND xmdl001 = xmdkdocno ",
#               "    AND glavent = xmdlent AND glav004 = xmdkdocdt ",
#               "    AND glav001 = '",l_glav001,"'"            
#   PREPARE p200_xckb_pre2 FROM l_sql
#   
#   #161222-00034#1 add start -----
#   LET l_sql = "SELECT glav002,glav006 ",
#               "  FROM xmdk_t,glav_t ",
#               " WHERE xmdkent = ",g_enterprise,
#               "   AND xmdkdocno = ? ",
#               "   AND glavent = xmdkent AND glav004 = xmdkdocdt ",
#               "   AND glav001 = '",l_glav001,"'"
#   PREPARE p200_xckb_pre2_1 FROM l_sql
#   #161222-00034#1 add end  -----
#      
#   IF l_xcat005 = '3' THEN   
#      LET l_sql = " SELECT xccc280,xccc280a,xccc280b,xccc280c,xccc280d,xccc280e,xccc280f,xccc280g,xccc280h ",
#                  "   FROM xccc_t",
#                  "  WHERE xcccent = ",g_enterprise,
#                  "    AND xcccld  = '",g_master.glaald,"'", #帐套
#                  "    AND xccc001 = '1'",           #帐套本位币顺序
#                  "    AND xccc002 = ? ", #成本域
#                  "    AND xccc003 = '",g_xcat001,"'",      #成本计算类型
#                  "    AND xccc004 = ? ",                  #年度        
#                  "    AND xccc005 = ? ",                  #期别        
#                  "    AND xccc006 = ? ",                  #料号
#                  "    AND xccc007 = ? ",                  #特性
#                  "    AND xccc008 = ? "                   #批号         
#      PREPARE p200_xckb_pre3 FROM l_sql
#   ELSE
#      LET l_sql = " SELECT xccc280,xccc280a,xccc280b,xccc280c,xccc280d,xccc280e,xccc280f,xccc280g,xccc280h ",
#                  "   FROM xccc_t",
#                  "  WHERE xcccent = ",g_enterprise,
#                  "    AND xcccld  = '",g_master.glaald,"'", #帐套
#                  "    AND xccc001 = '1'",           #帐套本位币顺序
#                  "    AND xccc002 = ? ", #成本域
#                  "    AND xccc003 = '",g_xcat001,"'",      #成本计算类型
#                  "    AND xccc004 = ? ",                  #年度        
#                  "    AND xccc005 = ? ",                  #期别        
#                  "    AND xccc006 = ? ",                  #料号
#                  "    AND xccc007 = ? "                   #特性          
#      PREPARE p200_xckb_pre4 FROM l_sql
#   END IF                         
#   #161223-00020#1---add---e
#   
##   LET l_sql = " SELECT xmdk_t.*,xmdl_t.*,imaa006 ", #161124-00048#12 mark
#   #161124-00048#12 add(s)
#   LET l_sql = " SELECT xmdkent,xmdksite,xmdkunit,xmdkdocno,xmdkdocdt,xmdk000,xmdk001,xmdk002,",
#               "        xmdk003,xmdk004,xmdk005,xmdk006,xmdk007,xmdk008,xmdk009,xmdk010,xmdk011,",
#               "        xmdk012,xmdk013,xmdk014,xmdk015,xmdk016,xmdk017,xmdk018,xmdk019,xmdk020,",
#               "        xmdk021,xmdk022,xmdk023,xmdk024,xmdk025,xmdk026,xmdk027,xmdk028,xmdk029,",
#               "        xmdk030,xmdk031,xmdk032,xmdk033,xmdk034,xmdk035,xmdk036,xmdk037,xmdk038,",
#               "        xmdk039,xmdk040,xmdk041,xmdk042,xmdk043,xmdk044,xmdk045,xmdk051,xmdk052,",
#               "        xmdk053,xmdk054,xmdk055,xmdk081,xmdk082,xmdk083,xmdk084,xmdk200,xmdk201,",
#               "        xmdk202,xmdk203,xmdk204,xmdk205,xmdk206,xmdk207,xmdk208,xmdk209,xmdk210,",
#               "        xmdk211,xmdk212,xmdk213,xmdk214,xmdkownid,xmdkowndp,xmdkcrtid,xmdkcrtdp,",
#               "        xmdkcrtdt,xmdkmodid,xmdkmoddt,xmdkcnfid,xmdkcnfdt,xmdkpstid,xmdkpstdt,  ",
#               "        xmdkstus,xmdk085,xmdk086,xmdk046,xmdk087,xmdk047,xmdk088,xmdk089,",#xmdk048,  ",
#              #"        xmdk049,xmdk050,
#               "        xmdlent,xmdlsite,xmdldocno,xmdlseq,xmdl001,xmdl002,xmdl003,",
#               "        xmdl004,xmdl005,xmdl006,xmdl007,xmdl008,xmdl009,xmdl010,xmdl011,xmdl012,   ",
#               "        xmdl013,xmdl014,xmdl015,xmdl016,xmdl017,xmdl018,xmdl019,xmdl020,xmdl021,   ",
#               "        xmdl022,xmdl023,xmdl024,xmdl025,xmdl026,xmdl027,xmdl028,xmdl029,xmdl030,   ",
#               "        xmdl031,xmdl032,xmdl033,xmdl034,xmdl035,xmdl036,xmdl037,xmdl038,xmdl039,   ",
#               "        xmdl040,xmdl041,xmdl042,xmdl043,xmdl044,xmdl045,xmdl046,xmdl047,xmdl048,   ",
#               "        xmdl049,xmdl050,xmdl051,xmdl052,xmdl053,xmdl054,xmdl055,xmdl081,xmdl082,   ",
#               "        xmdl083,xmdl084,xmdl085,xmdl086,xmdl087,xmdl088,xmdl089,xmdl090,xmdl091,   ",
#               "        xmdl092,xmdl093,xmdl200,xmdl201,xmdl202,xmdl203,xmdl204,xmdl205,xmdl206,   ",
#               "        xmdl207,xmdl208,xmdl209,xmdl210,xmdl211,xmdl212,xmdl213,xmdl214,xmdl215,   ",
#               "        xmdl216,xmdl217,xmdl218,xmdl219,xmdl220,xmdl222,xmdl223,xmdl224,xmdl225,   ",
#               "        xmdl226,xmdlunit,xmdlorga,xmdl056,xmdl094,xmdl095,xmdl227,xmdl228,xmdl057, ",
#               "        xmdl058,xmdl096,xmdl059,xmdl060,imaa006 ", 
#   #161124-00048#12 add(e)
#                       ",xmdmseq1,xmdm005,xmdm006,xmdm007,xmdm008,xmdm009",      #160706-00021#2
#               "   FROM xmdk_t,xmdl_t,inaa_t,imaa_t,xmdm_t ",                    #160706-00021#2
#               "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
#               "    AND inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 ",
#               "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
#               #160907-00003#1---mark---s
#               #"    AND ((xmdk000 IN ('1','2','3','4','5') AND xmdk002 IN ('1','2')) ",
#               #"        OR xmdk000 ='6') ",   #销退
#               #160907-00003#1---mark---e
#               "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq ",    #160706-00021#2 add xmdm
#               "    AND xmdkent = ",g_enterprise,
#               "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#               "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
#               #"    AND xmdkstus='S' ",   #160907-00003#1---mark
#               #160907-00003#1---add---s
#               "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S') ",
#               "         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3') ",
#              #"         OR (xmdk000 = '6' AND xmdk082 = '1' AND xmdkstus = 'S' )) ",       #161012-00038#1 mark
#               "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' )) ",      #161012-00038#1 add        
#               #160907-00003#1---add---e
#               "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#               "    AND inaa010 = 'Y' ",    #成本仓
#               "    AND ",g_wc_axm CLIPPED,
#               #160706-00021#2 add 
#               " UNION ",
##               " SELECT xmdk_t.*,xmdl_t.*,imaa006,xmdmseq1,xmdm005,xmdm006,xmdm007,xmdm008,xmdm009  ",  #161124-00048#12 mark 
#              #161124-00048#12 add(s)
#               " SELECT xmdkent,xmdksite,xmdkunit,xmdkdocno,xmdkdocdt,xmdk000,xmdk001,xmdk002,",
#               "        xmdk003,xmdk004,xmdk005,xmdk006,xmdk007,xmdk008,xmdk009,xmdk010,xmdk011,",
#               "        xmdk012,xmdk013,xmdk014,xmdk015,xmdk016,xmdk017,xmdk018,xmdk019,xmdk020,",
#               "        xmdk021,xmdk022,xmdk023,xmdk024,xmdk025,xmdk026,xmdk027,xmdk028,xmdk029,",
#               "        xmdk030,xmdk031,xmdk032,xmdk033,xmdk034,xmdk035,xmdk036,xmdk037,xmdk038,",
#               "        xmdk039,xmdk040,xmdk041,xmdk042,xmdk043,xmdk044,xmdk045,xmdk051,xmdk052,",
#               "        xmdk053,xmdk054,xmdk055,xmdk081,xmdk082,xmdk083,xmdk084,xmdk200,xmdk201,",
#               "        xmdk202,xmdk203,xmdk204,xmdk205,xmdk206,xmdk207,xmdk208,xmdk209,xmdk210,",
#               "        xmdk211,xmdk212,xmdk213,xmdk214,xmdkownid,xmdkowndp,xmdkcrtid,xmdkcrtdp,",
#               "        xmdkcrtdt,xmdkmodid,xmdkmoddt,xmdkcnfid,xmdkcnfdt,xmdkpstid,xmdkpstdt,  ",
#               "        xmdkstus,xmdk085,xmdk086,xmdk046,xmdk087,xmdk047,xmdk088,xmdk089,",#xmdk048,  ",
#               #"       xmdk049,xmdk050,",
#               "        xmdlent,xmdlsite,xmdldocno,xmdlseq,xmdl001,xmdl002,xmdl003,",
#               "        xmdl004,xmdl005,xmdl006,xmdl007,xmdl008,xmdl009,xmdl010,xmdl011,xmdl012,   ",
#               "        xmdl013,xmdl014,xmdl015,xmdl016,xmdl017,xmdl018,xmdl019,xmdl020,xmdl021,   ",
#               "        xmdl022,xmdl023,xmdl024,xmdl025,xmdl026,xmdl027,xmdl028,xmdl029,xmdl030,   ",
#               "        xmdl031,xmdl032,xmdl033,xmdl034,xmdl035,xmdl036,xmdl037,xmdl038,xmdl039,   ",
#               "        xmdl040,xmdl041,xmdl042,xmdl043,xmdl044,xmdl045,xmdl046,xmdl047,xmdl048,   ",
#               "        xmdl049,xmdl050,xmdl051,xmdl052,xmdl053,xmdl054,xmdl055,xmdl081,xmdl082,   ",
#               "        xmdl083,xmdl084,xmdl085,xmdl086,xmdl087,xmdl088,xmdl089,xmdl090,xmdl091,   ",
#               "        xmdl092,xmdl093,xmdl200,xmdl201,xmdl202,xmdl203,xmdl204,xmdl205,xmdl206,   ",
#               "        xmdl207,xmdl208,xmdl209,xmdl210,xmdl211,xmdl212,xmdl213,xmdl214,xmdl215,   ",
#               "        xmdl216,xmdl217,xmdl218,xmdl219,xmdl220,xmdl222,xmdl223,xmdl224,xmdl225,   ",
#               "        xmdl226,xmdlunit,xmdlorga,xmdl056,xmdl094,xmdl095,xmdl227,xmdl228,xmdl057, ",
#               "        xmdl058,xmdl096,xmdl059,xmdl060,imaa006,xmdmseq1,xmdm005,xmdm006,xmdm007,xmdm008,xmdm009  ",
#              #161124-00048#12 add(e)
#               "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
#               "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
#               "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
#               "   AND xmdl014 = ' '  ",
#               #160907-00003#1---mark---s
#               #"    AND ((xmdk000 IN ('1','2','3','4','5') AND xmdk002 IN ('1','2')) ",
#               #"        OR xmdk000 ='6') ",   #销退
#               #160907-00003#1---mark---e
#               "   AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
#               "    AND xmdkent = ",g_enterprise,
#               "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#               "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
#               #"    AND xmdkstus='S' ",   #160907-00003#1---mark
#               #160907-00003#1---add---s
#               "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S') ",
#               "         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3') ",
#              #"         OR (xmdk000 = '6' AND xmdk082 = '1' AND xmdkstus = 'S' )) ",           #161012-00038#1 mark
#               "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' )) ",           #161012-00038#1 add              
#               #160907-00003#1---add---e               
#               "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#               "    AND ",g_wc_axm CLIPPED
#               #160706-00021#2 add 
#   PREPARE axcp200_execute_ins_xckb_p1 FROM l_sql
#   DECLARE axcp200_execute_ins_xckb_c1 CURSOR FOR axcp200_execute_ins_xckb_p1
#   FOREACH axcp200_execute_ins_xckb_c1 INTO l_xmdk.*,l_xmdl.*,l_imaa006,l_xmdmseq1,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm008,l_xmdm009  #160706-00021#2 add xmdm #,l_xmdm.*
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'axcp200_execute_ins_xckb_c1'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#
#      #160706-00021#2--mark--s
#      ##本月已出货/签收/销退未开票的--add 160107 begin
#      #SELECT SUM(isag004) INTO l_isag004 FROM isag_t  #已开发票数
#      # WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno
#      #   AND isafent = g_enterprise
#      #   AND isafcomp= g_comp
#      #   AND isafstus IN ('S' ,'Y') 
#      #   AND isaf014 BETWEEN g_bdate AND g_edate
#      #   AND isag002 = l_xmdk.xmdkdocno  #来源单号
#      #   AND isag003 = l_xmdl.xmdlseq    #来源项次
#      #IF cl_null(l_isag004) THEN LET l_isag004 = 0 END IF
#      #LET l_qty = l_xmdl.xmdl018 - l_isag004
#      #IF l_qty <= 0 THEN
#      #   CONTINUE FOREACH
#      #END IF
#      #--end
#      #160706-00021#2--mark--e
#      
#      INITIALIZE l_xckb.* TO NULL
#      LET l_xckb.xckbent = g_enterprise      #企業代碼
#      LET l_xckb.xckbcomp= g_comp            #法人，跟据点走，不是跟账别走
#      LET l_xckb.xckbld  = g_master.glaald   #帳別
#      #xmdk000:1:出货单 2:无订单出货 3:直送订单出货 4:出货签收单 5:出货签退单 6:销退单
#      CASE
#         WHEN l_xmdk.xmdk000 = '1' OR l_xmdk.xmdk000 = '2' OR l_xmdk.xmdk000 = '3'
#              LET l_xckb.xckb001 = '1'       #來源:1为出货单，2为签收单，3为销退单，4发票
#         WHEN l_xmdk.xmdk000 = '4' OR l_xmdk.xmdk000 = '5'
#              LET l_xckb.xckb001 = '2'       #來源:1为出货单，2为签收单，3为销退单，4发票
#         WHEN l_xmdk.xmdk000 = '6'           
#              LET l_xckb.xckb001 = '3'       #來源:1为出货单，2为签收单，3为销退单，4发票
#      END CASE                               
#      LET l_xckb.xckb002 = 1                 #方向:从出货/签收/销退取得的为1，表示转入发出商品档。
#                                             #     从开票资料中取得的为-1，表示转出发出商品档
#      LET l_xckb.xckb003 = 'UNINVOICE'       #發票號碼:出货/签收/销退单，赋值 “UNINVOICE”，表示未开票。
#                                             #        开票资料，则将对应的发票号码写进去。
#      LET l_xckb.xckb004 = l_xmdk.xmdksite   #據點site:为单据所在据点，而非当前操作据点
#      LET l_xckb.xckb005 = l_xmdk.xmdkdocno  #出貨單號
#      LET l_xckb.xckb006 = l_xmdl.xmdlseq    #l_xmdm.xmdmseq    #出貨項次
#     #LET l_xckb.xckb036 = 0                 #l_xmdm.xmdmseq1   #出貨项序      #160706-00021#2
#      LET l_xckb.xckb036 = l_xmdmseq1        #出貨项序           #160706-00021#2
#      LET l_xckb.xckb007 = g_master.yy       #年度
#      LET l_xckb.xckb008 = g_master.pp       #期別
#      LET l_xckb.xckb009 = l_xmdk.xmdk008    #客戶編號
#      LET l_xckb.xckb010 = l_xmdk.xmdk003    #人員編號
#      LET l_xckb.xckb011 = l_xmdk.xmdk004    #部門編號
#      LET l_xckb.xckb012 = l_xmdl.xmdl008    #l_xmdm.xmdm001    #產品編號
#      LET l_xckb.xckb037 = l_xmdl.xmdl009    #特性
#      IF cl_null(l_xckb.xckb037) THEN LET l_xckb.xckb037 = ' ' END IF
#      
#      #170322-00109#1 add --s
#      #按料件特性计算成本否
#      IF g_sys_6013 = 'N' THEN
#         LET l_xckb.xckb037 = ' '
#      END IF
#      #170322-00109#1 add --e
#      
#      #LET l_xckb.xckb013 = l_xmdl.xmdl017    #l_xmdm.xmdm008    #銷售單位        #160706-00021#2 mark
#      #LET l_xckb.xckb014 = l_qty  #l_xmdl.xmdl018    #l_xmdm.xmdm009    #數量    #160706-00021#2 mark
#      #LET l_xckb.xckb015 = l_xmdl.xmdl014    #l_xmdm.xmdm005    #倉庫編號        #160706-00021#2 mark
#      #LET l_xckb.xckb016 = l_xmdl.xmdl015    #l_xmdm.xmdm006    #庫位編號        #160706-00021#2 mark
#      #LET l_xckb.xckb017 = l_xmdl.xmdl016    #l_xmdm.xmdm007    #批號            #160706-00021#2 mark
#      #LET l_xckb.xckb018 =  #no use
#      #160706-00021#2--s
#      LET l_xckb.xckb013 = l_xmdm008    #銷售單位
#      LET l_xckb.xckb014 = l_xmdm009    #數量      
#      LET l_xckb.xckb015 = l_xmdm005    #倉庫編號
#      LET l_xckb.xckb016 = l_xmdm006    #庫位編號
#      LET l_xckb.xckb017 = l_xmdm007    #批號
#      #160706-00021#2--e
#      LET l_xckb.xckb019 = l_xmdk.xmdk041    #發票代碼
#      
#      LET l_xckb.xckb020 = l_imaa006    #庫存單位
#      CALL s_aooi250_convert_qty(l_xckb.xckb012,l_xckb.xckb013,l_xckb.xckb020,l_xckb.xckb014)
#         RETURNING l_success,l_xckb.xckb021  #庫存數量
#      IF NOT l_success THEN
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#      IF l_xckb.xckb001 = '3' THEN    #销退单
#         LET l_xckb.xckb021 = l_xckb.xckb021 * -1
#         LET l_xckb.xckb014 = l_xckb.xckb014 * -1     #160817-00005#1
#      END IF
#      
#      #IF l_xckb.xckb002 = '1' THEN
#      #   #转入：抓取agli161，存货类科目中的 发出商品科目glcc006
#      #   LET l_type = 17  #取得科目類型:发出商品
#      #ELSE
#      #   #转出：科目抓取对应的主营业务成本科目。根据出货单对应到agli161抓取科目。
#      #   LET l_type =  #取得科目類型
#      #END IF
#      #CALL s_get_item_acc(g_master.glaald,l_type,l_xckb.xckb012,'','',g_comp,'') 
#      CALL s_get_item_acc(g_master.glaald,17,l_xckb.xckb012,'','',g_comp,'') 
#        RETURNING l_success,l_xckb.xckb022     #科目編號
#      IF cl_null(l_xckb.xckb022) THEN LET l_xckb.xckb022 = ' ' END IF
#        
#      IF cl_null(l_xmdk.xmdk044) THEN
#         LET l_xckb.xckb023 = 'N'              #多角貿易否
#      ELSE
#         LET l_xckb.xckb023 = 'Y'              #多角貿易否
#      END IF
#      
#      #转入不给值
#      #LET l_xckb.xckb024 =  #開票年度
#      #LET l_xckb.xckb025 =  #開票期別
#      LET l_xckb.xckb026 = g_glaa001 #幣種一
#      LET l_xckb.xckb027 = l_xmdl.xmdl028 #金額  
#      #LET l_xckb.xckb032 =  #no use
#      #LET l_xckb.xckb033 =  #no use
#      #LET l_xckb.xckb034 =  #no use
#      #LET l_xckb.xckb035 =  #no use
#
#      #成本域
#      IF g_sys_6001 = 'N' THEN
#         LET l_xcbf001 = ' '
#      ELSE
#        #CASE g_sys_6001 #170103-00022#1 mark
#         CASE g_sys_6002 #170103-00022#1 add
#              WHEN '1'  #组织
#                 #161223-00020#1---mod---s
#                 #  SELECT xcbf001 INTO l_xcbf001 FROM xcbf_t
#                 #   WHERE xcbfent  = g_enterprise
#                 #     AND xcbfcomp = g_comp
#                 #     AND xcbf002  = l_xmdk.xmdksite
#                 EXECUTE p200_xckb_pre1 USING l_xmdk.xmdksite INTO l_xcbf001
#                 #161223-00020#1---mod---e
#              WHEN '2'  #仓库
#                 #161223-00020#1---mod---s
#                 #  SELECT xcbf001 INTO l_xcbf001 FROM xcbf_t
#                 #   WHERE xcbfent  = g_enterprise
#                 #     AND xcbfcomp = g_comp
#                 #     AND xcbf002  = l_xmdl.xmdl014 #倉庫編號
#                 EXECUTE p200_xckb_pre1 USING l_xmdl.xmdl014 INTO l_xcbf001
#                 #161223-00020#1---mod---e
#              WHEN '3'  #库存管理特征
#                   LET l_xcbf001 = l_xmdl.xmdl052
#              OTHERWISE
#                   LET l_xcbf001 = ' ' 
#         END CASE
#      END IF
#      LET l_xckb.xckb038 = l_xcbf001   #成本域
#      #161223-00020#1---mark---s
#      ##160706-00021#2--(S)
#      #SELECT xcat005 INTO l_xcat005
#      #  FROM xcat_t
#      # WHERE xcatent = g_enterprise
#      #   AND xcat001 = g_xcat001
#      ##160706-00021#2--(E)      
#      #161223-00020#1---mark---s
#      #170414-00057#1--s
#      LET l_xckb007 = l_xckb.xckb007
#      LET l_xckb008 = l_xckb.xckb008
#      #170414-00057#1--e
#      #160907-00003#4-s
#      IF l_xmdk.xmdk000 = '6' THEN
#         #從xckb的銷退單號, 串回原退貨單xmdl, 查到該銷退單對應的出貨單及月份
#         #161223-00020#1---mod---e
#         #SELECT glav002,glav006 INTO l_xckb007,l_xckb008
#         #  FROM xmdl_t,xmdk_t,glav_t
#         # WHERE xmdlent = g_enterprise
#         #   AND xmdldocno = l_xckb.xckb005 AND xmdlseq = l_xckb.xckb006
#         #   AND xmdlent = xmdkent AND xmdl001 = xmdkdocno
#         #   AND glavent = xmdlent AND glav004 = xmdkdocdt
#         #   AND glav001 = l_glav001 
#         EXECUTE p200_xckb_pre2 USING l_xckb.xckb005,l_xckb.xckb006 INTO l_xckb007,l_xckb008
#         #161223-00020#1---mod---e
#         #170414-00057#1---s
#         IF g_sys_6005='1' THEN
#            SELECT  xmdk001 INTO l_xmdkdocdt 
#               FROM xmdl_t,xmdk_t   
#               WHERE xmdlent = g_enterprise
#               AND xmdldocno = l_xckb.xckb005 AND xmdlseq = l_xckb.xckb006
#               AND xmdlent = xmdkent AND xmdl001 = xmdkdocno 
#            IF cl_null(l_xmdkdocdt) THEN
#               SELECT xmdkdocdt INTO l_xmdkdocdt
#               FROM xmdk_t WHERE xmdkdocno=l_xckb.xckb005
#               AND xmdkent = g_enterprise
#            END IF 
#            LET l_xckb007=YEAR(l_xmdkdocdt)
#            LET l_xckb008=month(l_xmdkdocdt) 
#            
#            IF STATUS=100 THEN 
#               LET l_xckb007 = l_xckb.xckb007
#               LET l_xckb008 = l_xckb.xckb008
#            END IF 
#         END IF 
#         #170414-00057#1---e
#      ELSE
#         #161222-00034#1 add start -----
#         EXECUTE p200_xckb_pre2_1 USING l_xckb.xckb005 INTO l_xckb007,l_xckb008
#         IF SQLCA.sqlcode THEN
#         #161222-00034#1 add end   -----
#            LET l_xckb007 = l_xckb.xckb007
#            LET l_xckb008 = l_xckb.xckb008
#         END IF #161222-00034#1 add
#      END IF
#      #160907-00003#4-e
#      IF l_xcat005 = '3' THEN    #160706-00021#2
#         #161223-00020#1---mod---s
#         #SELECT xccc280,xccc280a,xccc280b,xccc280c,xccc280d,xccc280e,xccc280f,xccc280g,xccc280h
#         #  INTO l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d, #幣種一成本單價
#         #                      l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,l_xckb.xckb101h  #幣種一成本單價
#         #  FROM xccc_t
#         # WHERE xcccent = g_enterprise
#         #   AND xcccld  = l_xckb.xckbld #帐套
#         #   AND xccc001 = '1'           #帐套本位币顺序
#         #   AND xccc002 = l_xckb.xckb038 #成本域
#         #   AND xccc003 = g_xcat001      #成本计算类型
#         #   AND xccc004 = l_xckb007      #年度          #160706-00021#2 modify
#         #   AND xccc005 = l_xckb008      #期别          #160706-00021#2 modify
#         #   AND xccc006 = l_xckb.xckb012 #料号
#         #   AND xccc007 = l_xckb.xckb037 #特性
#         #   AND xccc008 = l_xckb.xckb017 #批号
#         EXECUTE p200_xckb_pre3 USING l_xckb.xckb038,l_xckb007,l_xckb008,l_xckb.xckb012,l_xckb.xckb037,l_xckb.xckb017
#            INTO l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d, #幣種一成本單價
#                                l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,l_xckb.xckb101h  #幣種一成本單價                                  
#         #161223-00020#1---mod---e
#      #160706-00021#2--(S)
#      ELSE
#         #161223-00020#1---mod---s
#         #SELECT xccc280,xccc280a,xccc280b,xccc280c,xccc280d,xccc280e,xccc280f,xccc280g,xccc280h
#         #  INTO l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d, #幣種一成本單價
#         #                      l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,l_xckb.xckb101h  #幣種一成本單價
#         #  FROM xccc_t
#         # WHERE xcccent = g_enterprise
#         #   AND xcccld  = l_xckb.xckbld #帐套
#         #   AND xccc001 = '1'           #帐套本位币顺序
#         #   AND xccc002 = l_xckb.xckb038 #成本域
#         #   AND xccc003 = g_xcat001      #成本计算类型
#         #   AND xccc004 = l_xckb007      #年度       #160706-00021#2 modify
#         #   AND xccc005 = l_xckb008      #期别       #160706-00021#2 modify
#         #   AND xccc006 = l_xckb.xckb012 #料号
#         #   AND xccc007 = l_xckb.xckb037 #特性  
#         EXECUTE p200_xckb_pre4 USING l_xckb.xckb038,l_xckb007,l_xckb008,l_xckb.xckb012,l_xckb.xckb037
#            INTO l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d, #幣種一成本單價
#                                l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,l_xckb.xckb101h  #幣種一成本單價             
#         #161223-00020#1---mod---e
#      END IF      
#      #160706-00021#2--(E)
#      LET l_xckb.xckb102  = l_xckb.xckb101  * l_xckb.xckb021 #幣種一成本金額       
#      LET l_xckb.xckb102a = l_xckb.xckb101a * l_xckb.xckb021 #幣種一成本金額-材料  
#      LET l_xckb.xckb102b = l_xckb.xckb101b * l_xckb.xckb021 #幣種一成本金額-人工  
#      LET l_xckb.xckb102c = l_xckb.xckb101c * l_xckb.xckb021 #幣種一成本金額-加工  
#      LET l_xckb.xckb102d = l_xckb.xckb101d * l_xckb.xckb021 #幣種一成本金額-制費一
#      LET l_xckb.xckb102e = l_xckb.xckb101e * l_xckb.xckb021 #幣種一成本金額-制費二
#      LET l_xckb.xckb102f = l_xckb.xckb101f * l_xckb.xckb021 #幣種一成本金額-制費三
#      LET l_xckb.xckb102g = l_xckb.xckb101g * l_xckb.xckb021 #幣種一成本金額-制費四
#      LET l_xckb.xckb102h = l_xckb.xckb101h * l_xckb.xckb021 #幣種一成本金額-制費五
#      CALL s_num_round(g_round_type,l_xckb.xckb102 ,g_ooaj007_1) RETURNING l_xckb.xckb102
#      CALL s_num_round(g_round_type,l_xckb.xckb102a,g_ooaj007_1) RETURNING l_xckb.xckb102a
#      CALL s_num_round(g_round_type,l_xckb.xckb102b,g_ooaj007_1) RETURNING l_xckb.xckb102b
#      CALL s_num_round(g_round_type,l_xckb.xckb102c,g_ooaj007_1) RETURNING l_xckb.xckb102c
#      CALL s_num_round(g_round_type,l_xckb.xckb102d,g_ooaj007_1) RETURNING l_xckb.xckb102d
#      CALL s_num_round(g_round_type,l_xckb.xckb102e,g_ooaj007_1) RETURNING l_xckb.xckb102e
#      CALL s_num_round(g_round_type,l_xckb.xckb102f,g_ooaj007_1) RETURNING l_xckb.xckb102f
#      CALL s_num_round(g_round_type,l_xckb.xckb102g,g_ooaj007_1) RETURNING l_xckb.xckb102g
#      CALL s_num_round(g_round_type,l_xckb.xckb102h,g_ooaj007_1) RETURNING l_xckb.xckb102h
#      
#      IF g_glaa015 = 'Y' THEN  #啟用本位幣二
#         LET l_xckb.xckb028 = g_glaa016           #幣種二
#         IF l_xckb.xckb027 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,l_isaf.isafdocdt,l_xckb.xckb026,l_xckb.xckb028,l_xckb.xckb027,g_glaa018)
#                 RETURNING l_xckb.xckb029            #金額
#         END IF
#         #成本金额
#         IF l_xckb.xckb101 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101 ,g_glaa018) RETURNING l_xckb.xckb111  #幣種二成本單價     
#         END IF   
#         IF l_xckb.xckb101a!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101a,g_glaa018) RETURNING l_xckb.xckb111a #幣種二成本單價-材料
#         END IF  
#         IF l_xckb.xckb101b!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101b,g_glaa018) RETURNING l_xckb.xckb111b #幣種二成本單價-人工  
#         END IF
#         IF l_xckb.xckb101c!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101c,g_glaa018) RETURNING l_xckb.xckb111c #幣種二成本單價-加工 
#         END IF 
#         IF l_xckb.xckb101d!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101d,g_glaa018) RETURNING l_xckb.xckb111d #幣種二成本單價-制費一
#         END IF
#         IF l_xckb.xckb101e!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101e,g_glaa018) RETURNING l_xckb.xckb111e #幣種二成本單價-制費二
#         END IF
#         IF l_xckb.xckb101f!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101f,g_glaa018) RETURNING l_xckb.xckb111f #幣種二成本單價-制費三
#         END IF
#         IF l_xckb.xckb101g!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101g,g_glaa018) RETURNING l_xckb.xckb111g #幣種二成本單價-制費四
#         END IF
#         IF l_xckb.xckb101h!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101h,g_glaa018) RETURNING l_xckb.xckb111h #幣種二成本單價-制費五
#         END IF
#         CALL s_num_round(g_round_type,l_xckb.xckb111 ,g_ooaj006_2) RETURNING l_xckb.xckb111 
#         CALL s_num_round(g_round_type,l_xckb.xckb111a,g_ooaj006_2) RETURNING l_xckb.xckb111a
#         CALL s_num_round(g_round_type,l_xckb.xckb111b,g_ooaj006_2) RETURNING l_xckb.xckb111b
#         CALL s_num_round(g_round_type,l_xckb.xckb111c,g_ooaj006_2) RETURNING l_xckb.xckb111c
#         CALL s_num_round(g_round_type,l_xckb.xckb111d,g_ooaj006_2) RETURNING l_xckb.xckb111d
#         CALL s_num_round(g_round_type,l_xckb.xckb111e,g_ooaj006_2) RETURNING l_xckb.xckb111e
#         CALL s_num_round(g_round_type,l_xckb.xckb111f,g_ooaj006_2) RETURNING l_xckb.xckb111f
#         CALL s_num_round(g_round_type,l_xckb.xckb111g,g_ooaj006_2) RETURNING l_xckb.xckb111g
#         CALL s_num_round(g_round_type,l_xckb.xckb111h,g_ooaj006_2) RETURNING l_xckb.xckb111h
#         LET l_xckb.xckb112  = l_xckb.xckb111  * l_xckb.xckb021 #幣種二成本金額       
#         LET l_xckb.xckb112a = l_xckb.xckb111a * l_xckb.xckb021 #幣種二成本金額-材料  
#         LET l_xckb.xckb112b = l_xckb.xckb111b * l_xckb.xckb021 #幣種二成本金額-人工  
#         LET l_xckb.xckb112c = l_xckb.xckb111c * l_xckb.xckb021 #幣種二成本金額-加工  
#         LET l_xckb.xckb112d = l_xckb.xckb111d * l_xckb.xckb021 #幣種二成本金額-制費一
#         LET l_xckb.xckb112e = l_xckb.xckb111e * l_xckb.xckb021 #幣種二成本金額-制費二
#         LET l_xckb.xckb112f = l_xckb.xckb111f * l_xckb.xckb021 #幣種二成本金額-制費三
#         LET l_xckb.xckb112g = l_xckb.xckb111g * l_xckb.xckb021 #幣種二成本金額-制費四
#         LET l_xckb.xckb112h = l_xckb.xckb111h * l_xckb.xckb021 #幣種二成本金額-制費五   
#         CALL s_num_round(g_round_type,l_xckb.xckb112 ,g_ooaj007_2) RETURNING l_xckb.xckb112 
#         CALL s_num_round(g_round_type,l_xckb.xckb112a,g_ooaj007_2) RETURNING l_xckb.xckb112a
#         CALL s_num_round(g_round_type,l_xckb.xckb112b,g_ooaj007_2) RETURNING l_xckb.xckb112b
#         CALL s_num_round(g_round_type,l_xckb.xckb112c,g_ooaj007_2) RETURNING l_xckb.xckb112c
#         CALL s_num_round(g_round_type,l_xckb.xckb112d,g_ooaj007_2) RETURNING l_xckb.xckb112d
#         CALL s_num_round(g_round_type,l_xckb.xckb112e,g_ooaj007_2) RETURNING l_xckb.xckb112e
#         CALL s_num_round(g_round_type,l_xckb.xckb112f,g_ooaj007_2) RETURNING l_xckb.xckb112f
#         CALL s_num_round(g_round_type,l_xckb.xckb112g,g_ooaj007_2) RETURNING l_xckb.xckb112g
#         CALL s_num_round(g_round_type,l_xckb.xckb112h,g_ooaj007_2) RETURNING l_xckb.xckb112h
#      END IF
#      IF g_glaa019 = 'Y' THEN  #啟用本位幣三
#         LET l_xckb.xckb030 = g_glaa020           #幣種三
#         IF l_xckb.xckb027 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,l_isaf.isafdocdt,l_xckb.xckb026,l_xckb.xckb030,l_xckb.xckb027,g_glaa022)
#                 RETURNING l_xckb.xckb031
#         END IF
#         #成本金额
#         IF l_xckb.xckb101 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101 ,g_glaa022) RETURNING l_xckb.xckb121  #幣種三成本單價  
#         END IF      
#         IF l_xckb.xckb101a!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101a,g_glaa022) RETURNING l_xckb.xckb121a #幣種三成本單價-材料
#         END IF  
#         IF l_xckb.xckb101b!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101b,g_glaa022) RETURNING l_xckb.xckb121b #幣種三成本單價-人工
#         END IF  
#         IF l_xckb.xckb101c!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101c,g_glaa022) RETURNING l_xckb.xckb121c #幣種三成本單價-加工 
#         END IF 
#         IF l_xckb.xckb101d!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101d,g_glaa022) RETURNING l_xckb.xckb121d #幣種三成本單價-制費一
#         END IF
#         IF l_xckb.xckb101e!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101e,g_glaa022) RETURNING l_xckb.xckb121e #幣種三成本單價-制費二
#         END IF
#         IF l_xckb.xckb101f!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101f,g_glaa022) RETURNING l_xckb.xckb121f #幣種三成本單價-制費三
#         END IF
#         IF l_xckb.xckb101g!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101g,g_glaa022) RETURNING l_xckb.xckb121g #幣種三成本單價-制費四
#         END IF
#         IF l_xckb.xckb101h!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101h,g_glaa022) RETURNING l_xckb.xckb121h #幣種三成本單價-制費五
#         END IF
#         CALL s_num_round(g_round_type,l_xckb.xckb121 ,g_ooaj006_3) RETURNING l_xckb.xckb121 
#         CALL s_num_round(g_round_type,l_xckb.xckb121a,g_ooaj006_3) RETURNING l_xckb.xckb121a
#         CALL s_num_round(g_round_type,l_xckb.xckb121b,g_ooaj006_3) RETURNING l_xckb.xckb121b
#         CALL s_num_round(g_round_type,l_xckb.xckb121c,g_ooaj006_3) RETURNING l_xckb.xckb121c
#         CALL s_num_round(g_round_type,l_xckb.xckb121d,g_ooaj006_3) RETURNING l_xckb.xckb121d
#         CALL s_num_round(g_round_type,l_xckb.xckb121e,g_ooaj006_3) RETURNING l_xckb.xckb121e
#         CALL s_num_round(g_round_type,l_xckb.xckb121f,g_ooaj006_3) RETURNING l_xckb.xckb121f
#         CALL s_num_round(g_round_type,l_xckb.xckb121g,g_ooaj006_3) RETURNING l_xckb.xckb121g
#         CALL s_num_round(g_round_type,l_xckb.xckb121h,g_ooaj006_3) RETURNING l_xckb.xckb121h
#         LET l_xckb.xckb122  = l_xckb.xckb121  * l_xckb.xckb021 #幣種三成本金額
#         LET l_xckb.xckb122a = l_xckb.xckb121a * l_xckb.xckb021 #幣種三成本金額-材料
#         LET l_xckb.xckb122b = l_xckb.xckb121b * l_xckb.xckb021 #幣種三成本金額-人工
#         LET l_xckb.xckb122c = l_xckb.xckb121c * l_xckb.xckb021 #幣種三成本金額-加工
#         LET l_xckb.xckb122d = l_xckb.xckb121d * l_xckb.xckb021 #幣種三成本金額-制費一
#         LET l_xckb.xckb122e = l_xckb.xckb121e * l_xckb.xckb021 #幣種三成本金額-制費二
#         LET l_xckb.xckb122f = l_xckb.xckb121f * l_xckb.xckb021 #幣種三成本金額-制費三
#         LET l_xckb.xckb122g = l_xckb.xckb121g * l_xckb.xckb021 #幣種三成本金額-制費四
#         LET l_xckb.xckb122h = l_xckb.xckb121h * l_xckb.xckb021 #幣種三成本金額-制費五
#         CALL s_num_round(g_round_type,l_xckb.xckb122 ,g_ooaj007_3) RETURNING l_xckb.xckb122 
#         CALL s_num_round(g_round_type,l_xckb.xckb122a,g_ooaj007_3) RETURNING l_xckb.xckb122a
#         CALL s_num_round(g_round_type,l_xckb.xckb122b,g_ooaj007_3) RETURNING l_xckb.xckb122b
#         CALL s_num_round(g_round_type,l_xckb.xckb122c,g_ooaj007_3) RETURNING l_xckb.xckb122c
#         CALL s_num_round(g_round_type,l_xckb.xckb122d,g_ooaj007_3) RETURNING l_xckb.xckb122d
#         CALL s_num_round(g_round_type,l_xckb.xckb122e,g_ooaj007_3) RETURNING l_xckb.xckb122e
#         CALL s_num_round(g_round_type,l_xckb.xckb122f,g_ooaj007_3) RETURNING l_xckb.xckb122f
#         CALL s_num_round(g_round_type,l_xckb.xckb122g,g_ooaj007_3) RETURNING l_xckb.xckb122g
#         CALL s_num_round(g_round_type,l_xckb.xckb122h,g_ooaj007_3) RETURNING l_xckb.xckb122h
#      END IF
#
#      CALL axcp200_execute_ins_xckb_null_zero(l_xckb.*)
#         RETURNING l_xckb.*
#      
##      INSERT INTO xckb_t VALUES (l_xckb.*)  #161124-00048#12 mark
#      #161124-00048#12 add(s)
#      INSERT INTO xckb_t(xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb004,xckb005,
#                         xckb006,xckb007,xckb008,xckb009,xckb010,xckb011,xckb012,xckb013,
#                         xckb014,xckb015,xckb016,xckb017,xckb018,xckb019,xckb020,xckb021,
#                         xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,xckb028,xckb029,
#                         xckb030,xckb031,xckb032,xckb033,xckb034,xckb035,xckb036,xckb037,
#                         xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,
#                         xckb101h,xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,
#                         xckb102g,xckb102h,xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,
#                         xckb111f,xckb111g,xckb111h,xckb112,xckb112a,xckb112b,xckb112c,xckb112d,
#                         xckb112e,xckb112f,xckb112g,xckb112h,xckb121,xckb121a,xckb121b,xckb121c,
#                         xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,xckb122,xckb122a,xckb122b,
#                         xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,xckb038) 
#                 VALUES (l_xckb.xckbent,l_xckb.xckbcomp,l_xckb.xckbld,l_xckb.xckb001,l_xckb.xckb002,l_xckb.xckb003,l_xckb.xckb004,l_xckb.xckb005,
#                         l_xckb.xckb006,l_xckb.xckb007,l_xckb.xckb008,l_xckb.xckb009,l_xckb.xckb010,l_xckb.xckb011,l_xckb.xckb012,l_xckb.xckb013,
#                         l_xckb.xckb014,l_xckb.xckb015,l_xckb.xckb016,l_xckb.xckb017,l_xckb.xckb018,l_xckb.xckb019,l_xckb.xckb020,l_xckb.xckb021,
#                         l_xckb.xckb022,l_xckb.xckb023,l_xckb.xckb024,l_xckb.xckb025,l_xckb.xckb026,l_xckb.xckb027,l_xckb.xckb028,l_xckb.xckb029,
#                         l_xckb.xckb030,l_xckb.xckb031,l_xckb.xckb032,l_xckb.xckb033,l_xckb.xckb034,l_xckb.xckb035,l_xckb.xckb036,l_xckb.xckb037,
#                         l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d,l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,
#                         l_xckb.xckb101h,l_xckb.xckb102,l_xckb.xckb102a,l_xckb.xckb102b,l_xckb.xckb102c,l_xckb.xckb102d,l_xckb.xckb102e,l_xckb.xckb102f,
#                         l_xckb.xckb102g,l_xckb.xckb102h,l_xckb.xckb111,l_xckb.xckb111a,l_xckb.xckb111b,l_xckb.xckb111c,l_xckb.xckb111d,l_xckb.xckb111e,
#                         l_xckb.xckb111f,l_xckb.xckb111g,l_xckb.xckb111h,l_xckb.xckb112,l_xckb.xckb112a,l_xckb.xckb112b,l_xckb.xckb112c,l_xckb.xckb112d,
#                         l_xckb.xckb112e,l_xckb.xckb112f,l_xckb.xckb112g,l_xckb.xckb112h,l_xckb.xckb121,l_xckb.xckb121a,l_xckb.xckb121b,l_xckb.xckb121c,
#                         l_xckb.xckb121d,l_xckb.xckb121e,l_xckb.xckb121f,l_xckb.xckb121g,l_xckb.xckb121h,l_xckb.xckb122,l_xckb.xckb122a,l_xckb.xckb122b,
#                         l_xckb.xckb122c,l_xckb.xckb122d,l_xckb.xckb122e,l_xckb.xckb122f,l_xckb.xckb122g,l_xckb.xckb122h,l_xckb.xckb038)
#      #161124-00048#12 add(e)
#      LET l_count = l_count + 1
#   END FOREACH
#
#   #160328-00022#5-s-add
#   IF g_bgjob <> "Y" THEN 
#      LET l_msg = cl_getmsg_parm("axc-00782",g_lang,'')  #抓取開票資料寫入發出商品統計檔！
#      CALL cl_progress_no_window_ing(l_msg)          
#   END IF      
#   #160328-00022#5-e-add 
#
#
#   #开票
#   #LET g_wc = g_master.wc
#   LET g_wc_ais = g_master.wc
#   LET g_wc_ais = cl_replace_str(g_wc_ais,"pmaa001","isaf003") #客戶
#   LET g_wc_ais = cl_replace_str(g_wc_ais,"imaa001","isag009") #產品編號
#   
#   #161223-00020#1---add---s
#   LET l_sql = " SELECT xmdl009  ",
#               "   FROM xmdl_t ",
#               "  WHERE xmdlent   = ",g_enterprise,
#               "    AND xmdldocno = ? ",
#               "    AND xmdlseq   = ? "
#   PREPARE p200_xckb_pre5 FROM l_sql            
#   #161223-00020#1---add---e
#         
#   #LET l_sql = " SELECT isaf_t.*,isag_t.* ",
#   #            "   FROM isaf_t,isag_t ",
#   #            "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
#   #            "    AND isafent = ",g_enterprise,
#   #            "    AND isafcomp='",g_comp,"' ",
#   #            "    AND isafstus IN ('S' ,'Y') ",
#   #            "    AND isafdocdt BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#   #            "    AND isag009 IS NOT NULL ",
#   #            "    AND ",g_wc_ais CLIPPED
#   
#   #本月已开票，但开的是前月的部分的 --160107 mod
##   LET l_sql = " SELECT isaf_t.*,isag_t.* ",  #161124-00048#12 mark
#   #161124-00048#12 add(s)
#   LET l_sql = " SELECT isafent,isafsite,isafcomp,isafdocno,isafdocdt,isaf001,isaf002,isaf003,           ",
#               "        isaf004,isaf005,isaf006,isaf007,isaf008,isaf009,isaf010,isaf011,isaf012,         ",
#               "        isaf013,isaf014,isaf015,isaf016,isaf017,isaf018,isaf019,isaf020,isaf021,         ",
#               "        isaf022,isaf023,isaf024,isaf025,isaf026,isaf027,isaf028,isaf029,isaf030,         ",
#               "        isaf031,isaf032,isaf033,isaf034,isaf035,isaf036,isaf037,isaf038,isaf039,         ",
#               "        isaf040,isaf041,isaf042,isaf043,isaf044,isaf045,isaf046,isaf047,isaf048,         ",
#               "        isaf049,isaf050,isaf051,isaf052,isaf053,isaf054,isaf055,isaf056,isaf057,         ",
#               "        isaf058,isaf100,isaf101,isaf103,isaf104,isaf105,isaf106,isaf107,isaf108,         ",
#               "        isaf113,isaf114,isaf115,isaf116,isaf117,isaf118,isaf119,isaf120,isaf121,         ",
#               "        isaf122,isaf123,isaf124,isaf201,isaf202,isaf203,isaf204,isaf205,isaf206,         ",
#               "        isaf207,isaf208,isaf209,isaf210,isafstus,isafownid,isafowndp,isafcrtid,          ",
#               "        isafcrtdp,isafcrtdt,isafmodid,isafmoddt,isafcnfid,isafcnfdt,isaf059,isaf060,     ",
#               "        isaf061,isaf062,isaf063,isaf064,isaf065,isaf066,isaf067,isagent,isagcomp,        ",
#               "        isagdocno,isagseq,isagorga,isag001,isag002,isag003,isag004,isag005,isag006,      ",
#               "        isag007,isag008,isag009,isag010,isag011,isag012,isag013,isag014,isag015,isag016, ",
#               "        isag017,isag101,isag103,isag104,isag105,isag106,isag113,isag114,isag115,isag116, ",
#               "        isag117,isag126,isag127,isag128,isag136,isag137,isag138,isag018, ",               
#   #161124-00048#12 add(e)
#               "        imaa006 ",  #161223-00020#1 add
#               "   FROM isaf_t,isag_t ",
#               "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ",   #161223-00020#1 add
#               "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
#               "    AND isafent = ",g_enterprise,
#               "    AND isafcomp='",g_comp,"' ",
#               "    AND isafstus IN ('S' ,'Y') ",
#               "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#               "    AND isag009 IS NOT NULL ",
#               "    AND ",g_wc_ais CLIPPED   #,    #160706-00021#2 mark
#               #160706-00021#2 mark--s
#               #"    AND EXISTS (SELECT 1 FROM xmdk_t,xmdl_t,inaa_t ",
#               #"                 WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
#               #"                   AND inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 ",
#               #"                   AND ((xmdk000 IN ('1','2','3','4','5') AND xmdk002 IN ('1','2')) ",
#               #"                       OR xmdk000 ='6') ",   #销退
#               #"                   AND xmdkent = ",g_enterprise,
#               #"                   AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#               #"                   AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
#               #"                   AND xmdkstus='S' ",
#               ##"                   AND xmdk001 < '",g_bdate,"' ",   #160603-00008#1
#               #"                   AND inaa010 = 'Y' ",    #成本仓
#               #"                   AND ",g_wc_axm CLIPPED,
#               #"                   AND xmdldocno = isag002 ",  #来源单号
#               #"                   AND xmdlseq   = isag003 ",   #来源项次
#               #"               ) "
#               #160706-00021#2 mark--e
#   PREPARE axcp200_execute_ins_xckb_p2 FROM l_sql
#   DECLARE axcp200_execute_ins_xckb_c2 CURSOR FOR axcp200_execute_ins_xckb_p2
#   FOREACH axcp200_execute_ins_xckb_c2 INTO l_isaf.*,l_isag.*,l_imaa006
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'axcp200_execute_ins_xckb_c2'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#      #161223-00020#1---add---s  
#      IF cl_null(l_imaa006) THEN
#         #此料未維護基礎單位！
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'aim-00194'
#         LET g_errparam.extend = l_isag.isag009
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         CONTINUE FOREACH
#      END IF
#      #161223-00020#1---add---e    
#      INITIALIZE l_xckb.* TO NULL
#      LET l_xckb.xckbent = g_enterprise      #企業代碼
#      LET l_xckb.xckbcomp= g_comp            #法人，跟据点走，不是跟账别走
#      LET l_xckb.xckbld  = g_master.glaald   #帳別        
#      LET l_xckb.xckb001 = '4'               #來源:1为出货单，2为签收单，3为销退单，4发票                             
#      LET l_xckb.xckb002 = -1                #方向:从出货/签收/销退取得的为1，表示转入发出商品档。
#                                             #     从开票资料中取得的为-1，表示转出发出商品档
#      LET l_xckb.xckb003 = l_isaf.isaf011    #發票號碼:出货/签收/销退单，赋值 “UNINVOICE”，表示未开票。
#                                             #        开票资料，则将对应的发票号码写进去。
#      IF cl_null(l_xckb.xckb003) THEN LET l_xckb.xckb003 = ' ' END IF      #160706-00021#2
#      LET l_xckb.xckb004 = g_site            #據點site:为单据所在据点，而非当前操作据点
#      #LET l_xckb.xckb005 = l_isaf.isafdocno #出貨單號    #160706-00021#2 mark
#      LET l_xckb.xckb005 = l_isag.isag002    #出貨單號    #160706-00021#2
#     #LET l_xckb.xckb006 = l_isag.isagseq    #出貨項次    #160804-00042#1 mark
#      LET l_xckb.xckb006 = l_isag.isag003    #出貨項次    #160804-00042#1
#      LET l_xckb.xckb036 = 0                 #出貨项序
#      LET l_xckb.xckb007 = g_master.yy       #年度
#      LET l_xckb.xckb008 = g_master.pp       #期別
#      LET l_xckb.xckb009 = l_isaf.isaf003    #客戶編號
#      LET l_xckb.xckb010 = l_isaf.isaf005    #人員編號
#      LET l_xckb.xckb011 = l_isaf.isaf006    #部門編號
#      LET l_xckb.xckb012 = l_isag.isag009    #產品編號
#      #161223-00020#1---mod---s
#      #SELECT xmdl009 INTO l_xckb.xckb037     #特性
#      #  FROM xmdl_t
#      # WHERE xmdlent   = g_enterprise
#      #   AND xmdldocno = l_isag.isag002
#      #   AND xmdlseq   = l_isag.isag003
#      EXECUTE p200_xckb_pre5 USING l_isag.isag002,l_isag.isag003 INTO  l_xckb.xckb037
#      #161223-00020#1---mod---e
#         
#      IF cl_null(l_xckb.xckb037) THEN LET l_xckb.xckb037 = ' ' END IF
#      
#
#      #170322-00109#1 add--s
#      #按料件特性计算成本否
#      IF g_sys_6013 = 'N' THEN
#         LET l_xckb.xckb037 = ' '
#      END IF
#      #170322-00109#1 add--e
#      
#      LET l_xckb.xckb013 = l_isag.isag005    #銷售單位
#     #LET l_xckb.xckb014 = l_isag.isag004    #數量         #160817-00005#1 mark
#      #160817-00005#1--s
#      IF NOT cl_null(l_isag.isag015) THEN 
#         LET l_xckb.xckb014 = l_isag.isag004 * l_isag.isag015 
#      ELSE 
#         LET l_xckb.xckb014 = l_isag.isag004 
#      END IF
#      #160817-00005#1--e
#      LET l_xckb.xckb015 = ' '               #倉庫編號
#      LET l_xckb.xckb016 = ' '               #庫位編號
#      LET l_xckb.xckb017 = ' '               #批號
#      #LET l_xckb.xckb018 =  #no use
#      LET l_xckb.xckb019 = l_isaf.isaf010    #發票代碼
#      
#      #161223-00020#1---mark---s
#      #SELECT imaa006 INTO l_xckb.xckb020     #庫存單位
#      #  FROM imaa_t
#      # WHERE imaaent = g_enterprise
#      #   AND imaa001 = l_xckb.xckb012   
#      #IF cl_null(l_xckb.xckb020) THEN
#      #   #此料未維護基礎單位！
#      #   INITIALIZE g_errparam TO NULL
#      #   LET g_errparam.code = 'aim-00194'
#      #   LET g_errparam.extend = l_xckb.xckb012
#      #   LET g_errparam.popup = TRUE
#      #   CALL cl_err()
#      #   LET r_success = FALSE
#      #   CONTINUE FOREACH
#      #END IF
#      #161223-00020#1---mark---e
#      LET l_xckb.xckb020 = l_imaa006   #161223-00020#1 add
#      CALL s_aooi250_convert_qty(l_xckb.xckb012,l_xckb.xckb013,l_xckb.xckb020,l_xckb.xckb014)
#         RETURNING l_success,l_xckb.xckb021  #庫存數量
#      IF NOT l_success THEN
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#      
#      #IF l_xckb.xckb002 = '1' THEN
#      #   #转入：抓取agli161，存货类科目中的 发出商品科目glcc006
#      #   LET l_type = 17  #取得科目類型:发出商品
#      #ELSE
#      #   #转出：科目抓取对应的主营业务成本科目。根据出货单对应到agli161抓取科目。
#      #   LET l_type = 5   #取得科目類型
#      #END IF
#      #CALL s_get_item_acc(g_master.glaald,l_type,l_xckb.xckb012,'','',g_comp,'') 
#     #CALL s_get_item_acc(g_master.glaald,5,l_xckb.xckb012,'','',g_comp,'')      #161012-00038#1 mark
#      CALL s_get_item_acc(g_master.glaald,17,l_xckb.xckb012,'','',g_comp,'')     #161012-00038#1 add
#        RETURNING l_success,l_xckb.xckb022     #科目編號
#      IF cl_null(l_xckb.xckb022) THEN LET l_xckb.xckb022 = ' ' END IF
#        
#      LET l_xckb.xckb023 = 'N'                 #多角貿易否
#      
#      #转入不给值
#      #LET l_xckb.xckb024 =                     #開票年度
#      #LET l_xckb.xckb025 =                     #開票期別
#      
#      LET l_xckb.xckb026 = g_glaa001           #幣種一
#      LET l_xckb.xckb027 = l_isag.isag115      #金額
#      #LET l_xckb.xckb032 =  #no use
#      #LET l_xckb.xckb033 =  #no use
#      #LET l_xckb.xckb034 =  #no use
#      #LET l_xckb.xckb035 =  #no use
#      
#      #成本域
#      IF g_sys_6001 = 'N' THEN
#         LET l_xcbf001 = ' '
#      ELSE
#        #CASE g_sys_6001 #170103-00022#1 mark
#         CASE g_sys_6002 #170103-00022#1 add
#              WHEN '1'  #组织
#                 #161223-00020#1---mod---s
#                 #  SELECT xcbf001 INTO l_xcbf001 FROM xcbf_t
#                 #   WHERE xcbfent  = g_enterprise
#                 #     AND xcbfcomp = g_comp
#                 #     AND xcbf002  = l_xckb.xckb004  #据点
#                 EXECUTE p200_xckb_pre1 USING l_xckb.xckb004 INTO l_xcbf001
#                 #161223-00020#1---mod---e
#              WHEN '2'  #仓库
#                 #161223-00020#1---mod---e                      
#                 #  SELECT xcbf001 INTO l_xcbf001 FROM xcbf_t
#                 #   WHERE xcbfent  = g_enterprise
#                 #     AND xcbfcomp = g_comp
#                 #     AND xcbf002  = l_xckb.xckb015 #仓库
#                 EXECUTE p200_xckb_pre1 USING l_xckb.xckb015 INTO l_xcbf001
#                 #161223-00020#1---mod---e                      
#              WHEN '3'  #库存管理特征
#                   LET l_xcbf001 = l_xmdl.xmdl052
#              OTHERWISE
#                   LET l_xcbf001 = ' ' 
#         END CASE
#      END IF
#      LET l_xckb.xckb038 = l_xcbf001   #成本域
#      
#      #161223-00020#1---mod---s         
#      #SELECT xccc280,xccc280a,xccc280b,xccc280c,xccc280d,xccc280e,xccc280f,xccc280g,xccc280h
#      #  INTO l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d, #幣種一成本單價
#      #                      l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,l_xckb.xckb101h  #幣種一成本單價
#      #  FROM xccc_t
#      # WHERE xcccent = g_enterprise
#      #   AND xcccld  = l_xckb.xckbld #帐套
#      #   AND xccc001 = '1'           #帐套本位币顺序
#      #   AND xccc002 = l_xckb.xckb038 #成本域
#      #   AND xccc003 = g_xcat001      #成本计算类型
#      #   AND xccc004 = l_xckb.xckb007 #年度
#      #   AND xccc005 = l_xckb.xckb008 #期别
#      #   AND xccc006 = l_xckb.xckb012 #料号
#      #   AND xccc007 = l_xckb.xckb037 #特性
#      #   AND xccc008 = l_xckb.xckb017 #批号
#      
#      #170414-00057#1---s
#      LET l_xckb007 = l_xckb.xckb007
#      LET l_xckb008 = l_xckb.xckb008         
#   
#      IF g_sys_6005='1' THEN
#         #從xckb的銷退單號, 串回原退貨單xmdl, 查到該銷退單對應的出貨單及月份        
#         LET l_xmdkdocdt=NULL 
#         SELECT  xmdkdocdt INTO l_xmdkdocdt    #add renjj170301  按扣账日期算
#           FROM xmdl_t,xmdk_t   
#           WHERE xmdlent = g_enterprise
#           AND xmdldocno = l_xckb.xckb005 AND xmdlseq = l_xckb.xckb006
#           AND xmdlent = xmdkent AND xmdl001 = xmdkdocno AND xmdldocno IN (SELECT m.xmdkdocno FROM xmdk_t m WHERE xmdk000='6')
#         IF cl_null(l_xmdkdocdt) THEN
#            SELECT xmdkdocdt INTO l_xmdkdocdt
#              FROM xmdk_t WHERE xmdkdocno=l_xckb.xckb005
#               AND xmdkent = g_enterprise AND xmdk000='6'
#         END IF
#         IF NOT cl_null(l_xmdkdocdt) THEN
#            LET l_xckb007=YEAR(l_xmdkdocdt)
#            LET l_xckb008=month(l_xmdkdocdt) 
#         END IF
#      END IF     
#      #170414-00057#1---e
#      EXECUTE p200_xckb_pre3 USING l_xckb.xckb038,l_xckb.xckb007,l_xckb.xckb008,
#                                   l_xckb.xckb012,l_xckb.xckb037,l_xckb.xckb017
#         INTO l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d, #幣種一成本單價
#                             l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,l_xckb.xckb101h  #幣種一成本單價                                  
#      #161223-00020#1---mod---e     
#      LET l_xckb.xckb102  = l_xckb.xckb101  * l_xckb.xckb021 #幣種一成本金額       
#      LET l_xckb.xckb102a = l_xckb.xckb101a * l_xckb.xckb021 #幣種一成本金額-材料  
#      LET l_xckb.xckb102b = l_xckb.xckb101b * l_xckb.xckb021 #幣種一成本金額-人工  
#      LET l_xckb.xckb102c = l_xckb.xckb101c * l_xckb.xckb021 #幣種一成本金額-加工  
#      LET l_xckb.xckb102d = l_xckb.xckb101d * l_xckb.xckb021 #幣種一成本金額-制費一
#      LET l_xckb.xckb102e = l_xckb.xckb101e * l_xckb.xckb021 #幣種一成本金額-制費二
#      LET l_xckb.xckb102f = l_xckb.xckb101f * l_xckb.xckb021 #幣種一成本金額-制費三
#      LET l_xckb.xckb102g = l_xckb.xckb101g * l_xckb.xckb021 #幣種一成本金額-制費四
#      LET l_xckb.xckb102h = l_xckb.xckb101h * l_xckb.xckb021 #幣種一成本金額-制費五
#      CALL s_num_round(g_round_type,l_xckb.xckb102 ,g_ooaj007_1) RETURNING l_xckb.xckb102
#      CALL s_num_round(g_round_type,l_xckb.xckb102a,g_ooaj007_1) RETURNING l_xckb.xckb102a
#      CALL s_num_round(g_round_type,l_xckb.xckb102b,g_ooaj007_1) RETURNING l_xckb.xckb102b
#      CALL s_num_round(g_round_type,l_xckb.xckb102c,g_ooaj007_1) RETURNING l_xckb.xckb102c
#      CALL s_num_round(g_round_type,l_xckb.xckb102d,g_ooaj007_1) RETURNING l_xckb.xckb102d
#      CALL s_num_round(g_round_type,l_xckb.xckb102e,g_ooaj007_1) RETURNING l_xckb.xckb102e
#      CALL s_num_round(g_round_type,l_xckb.xckb102f,g_ooaj007_1) RETURNING l_xckb.xckb102f
#      CALL s_num_round(g_round_type,l_xckb.xckb102g,g_ooaj007_1) RETURNING l_xckb.xckb102g
#      CALL s_num_round(g_round_type,l_xckb.xckb102h,g_ooaj007_1) RETURNING l_xckb.xckb102h
#      
#      IF g_glaa015 = 'Y' THEN  #啟用本位幣二
#         LET l_xckb.xckb028 = g_glaa016           #幣種二
#         IF l_xckb.xckb027 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,l_isaf.isafdocdt,l_xckb.xckb026,l_xckb.xckb028,l_xckb.xckb027,g_glaa018)
#                 RETURNING l_xckb.xckb029            #金額
#         END IF
#         #成本金额
#         IF l_xckb.xckb101 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101 ,g_glaa018) RETURNING l_xckb.xckb111  #幣種二成本單價      
#         END IF 
#         IF l_xckb.xckb101a!= 0 THEN 
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101a,g_glaa018) RETURNING l_xckb.xckb111a #幣種二成本單價-材料  
#         END IF
#         IF l_xckb.xckb101b!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101b,g_glaa018) RETURNING l_xckb.xckb111b #幣種二成本單價-人工 
#         END IF 
#         IF l_xckb.xckb101c!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101c,g_glaa018) RETURNING l_xckb.xckb111c #幣種二成本單價-加工  
#         END IF
#         IF l_xckb.xckb101d!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101d,g_glaa018) RETURNING l_xckb.xckb111d #幣種二成本單價-制費一
#         END IF
#         IF l_xckb.xckb101e!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101e,g_glaa018) RETURNING l_xckb.xckb111e #幣種二成本單價-制費二
#         END IF
#         IF l_xckb.xckb101f!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101f,g_glaa018) RETURNING l_xckb.xckb111f #幣種二成本單價-制費三
#         END IF
#         IF l_xckb.xckb101g!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101g,g_glaa018) RETURNING l_xckb.xckb111g #幣種二成本單價-制費四
#         END IF
#         IF l_xckb.xckb101h!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa016,l_xckb.xckb101h,g_glaa018) RETURNING l_xckb.xckb111h #幣種二成本單價-制費五
#         END IF
#         CALL s_num_round(g_round_type,l_xckb.xckb111 ,g_ooaj006_2) RETURNING l_xckb.xckb111 
#         CALL s_num_round(g_round_type,l_xckb.xckb111a,g_ooaj006_2) RETURNING l_xckb.xckb111a
#         CALL s_num_round(g_round_type,l_xckb.xckb111b,g_ooaj006_2) RETURNING l_xckb.xckb111b
#         CALL s_num_round(g_round_type,l_xckb.xckb111c,g_ooaj006_2) RETURNING l_xckb.xckb111c
#         CALL s_num_round(g_round_type,l_xckb.xckb111d,g_ooaj006_2) RETURNING l_xckb.xckb111d
#         CALL s_num_round(g_round_type,l_xckb.xckb111e,g_ooaj006_2) RETURNING l_xckb.xckb111e
#         CALL s_num_round(g_round_type,l_xckb.xckb111f,g_ooaj006_2) RETURNING l_xckb.xckb111f
#         CALL s_num_round(g_round_type,l_xckb.xckb111g,g_ooaj006_2) RETURNING l_xckb.xckb111g
#         CALL s_num_round(g_round_type,l_xckb.xckb111h,g_ooaj006_2) RETURNING l_xckb.xckb111h
#         LET l_xckb.xckb112  = l_xckb.xckb111  * l_xckb.xckb021 #幣種二成本金額       
#         LET l_xckb.xckb112a = l_xckb.xckb111a * l_xckb.xckb021 #幣種二成本金額-材料  
#         LET l_xckb.xckb112b = l_xckb.xckb111b * l_xckb.xckb021 #幣種二成本金額-人工  
#         LET l_xckb.xckb112c = l_xckb.xckb111c * l_xckb.xckb021 #幣種二成本金額-加工  
#         LET l_xckb.xckb112d = l_xckb.xckb111d * l_xckb.xckb021 #幣種二成本金額-制費一
#         LET l_xckb.xckb112e = l_xckb.xckb111e * l_xckb.xckb021 #幣種二成本金額-制費二
#         LET l_xckb.xckb112f = l_xckb.xckb111f * l_xckb.xckb021 #幣種二成本金額-制費三
#         LET l_xckb.xckb112g = l_xckb.xckb111g * l_xckb.xckb021 #幣種二成本金額-制費四
#         LET l_xckb.xckb112h = l_xckb.xckb111h * l_xckb.xckb021 #幣種二成本金額-制費五   
#         CALL s_num_round(g_round_type,l_xckb.xckb112 ,g_ooaj007_2) RETURNING l_xckb.xckb112 
#         CALL s_num_round(g_round_type,l_xckb.xckb112a,g_ooaj007_2) RETURNING l_xckb.xckb112a
#         CALL s_num_round(g_round_type,l_xckb.xckb112b,g_ooaj007_2) RETURNING l_xckb.xckb112b
#         CALL s_num_round(g_round_type,l_xckb.xckb112c,g_ooaj007_2) RETURNING l_xckb.xckb112c
#         CALL s_num_round(g_round_type,l_xckb.xckb112d,g_ooaj007_2) RETURNING l_xckb.xckb112d
#         CALL s_num_round(g_round_type,l_xckb.xckb112e,g_ooaj007_2) RETURNING l_xckb.xckb112e
#         CALL s_num_round(g_round_type,l_xckb.xckb112f,g_ooaj007_2) RETURNING l_xckb.xckb112f
#         CALL s_num_round(g_round_type,l_xckb.xckb112g,g_ooaj007_2) RETURNING l_xckb.xckb112g
#         CALL s_num_round(g_round_type,l_xckb.xckb112h,g_ooaj007_2) RETURNING l_xckb.xckb112h
#      END IF
#      IF g_glaa019 = 'Y' THEN  #啟用本位幣三
#         LET l_xckb.xckb030 = g_glaa020           #幣種三
#         IF l_xckb.xckb027 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,l_isaf.isafdocdt,l_xckb.xckb026,l_xckb.xckb030,l_xckb.xckb027,g_glaa022)
#                 RETURNING l_xckb.xckb031            #金額
#         END IF
#         #成本金额
#         IF l_xckb.xckb101 != 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101 ,g_glaa022) RETURNING l_xckb.xckb121  #幣種三成本單價    
#         END IF    
#         IF l_xckb.xckb101a!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101a,g_glaa022) RETURNING l_xckb.xckb121a #幣種三成本單價-材料  
#         END IF
#         IF l_xckb.xckb101b!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101b,g_glaa022) RETURNING l_xckb.xckb121b #幣種三成本單價-人工  
#         END IF
#         IF l_xckb.xckb101c!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101c,g_glaa022) RETURNING l_xckb.xckb121c #幣種三成本單價-加工  
#         END IF
#         IF l_xckb.xckb101d!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101d,g_glaa022) RETURNING l_xckb.xckb121d #幣種三成本單價-制費一
#         END IF
#         IF l_xckb.xckb101e!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101e,g_glaa022) RETURNING l_xckb.xckb121e #幣種三成本單價-制費二
#         END IF
#         IF l_xckb.xckb101f!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101f,g_glaa022) RETURNING l_xckb.xckb121f #幣種三成本單價-制費三
#         END IF
#         IF l_xckb.xckb101g!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101g,g_glaa022) RETURNING l_xckb.xckb121g #幣種三成本單價-制費四
#         END IF
#         IF l_xckb.xckb101h!= 0 THEN
#            CALL s_aooi160_get_exrate('2',l_xckb.xckbld,g_today,g_glaa001,g_glaa020,l_xckb.xckb101h,g_glaa022) RETURNING l_xckb.xckb121h #幣種三成本單價-制費五
#         END IF
#         CALL s_num_round(g_round_type,l_xckb.xckb121 ,g_ooaj006_3) RETURNING l_xckb.xckb121 
#         CALL s_num_round(g_round_type,l_xckb.xckb121a,g_ooaj006_3) RETURNING l_xckb.xckb121a
#         CALL s_num_round(g_round_type,l_xckb.xckb121b,g_ooaj006_3) RETURNING l_xckb.xckb121b
#         CALL s_num_round(g_round_type,l_xckb.xckb121c,g_ooaj006_3) RETURNING l_xckb.xckb121c
#         CALL s_num_round(g_round_type,l_xckb.xckb121d,g_ooaj006_3) RETURNING l_xckb.xckb121d
#         CALL s_num_round(g_round_type,l_xckb.xckb121e,g_ooaj006_3) RETURNING l_xckb.xckb121e
#         CALL s_num_round(g_round_type,l_xckb.xckb121f,g_ooaj006_3) RETURNING l_xckb.xckb121f
#         CALL s_num_round(g_round_type,l_xckb.xckb121g,g_ooaj006_3) RETURNING l_xckb.xckb121g
#         CALL s_num_round(g_round_type,l_xckb.xckb121h,g_ooaj006_3) RETURNING l_xckb.xckb121h
#         LET l_xckb.xckb122  = l_xckb.xckb121  * l_xckb.xckb021 #幣種三成本金額
#         LET l_xckb.xckb122a = l_xckb.xckb121a * l_xckb.xckb021 #幣種三成本金額-材料
#         LET l_xckb.xckb122b = l_xckb.xckb121b * l_xckb.xckb021 #幣種三成本金額-人工
#         LET l_xckb.xckb122c = l_xckb.xckb121c * l_xckb.xckb021 #幣種三成本金額-加工
#         LET l_xckb.xckb122d = l_xckb.xckb121d * l_xckb.xckb021 #幣種三成本金額-制費一
#         LET l_xckb.xckb122e = l_xckb.xckb121e * l_xckb.xckb021 #幣種三成本金額-制費二
#         LET l_xckb.xckb122f = l_xckb.xckb121f * l_xckb.xckb021 #幣種三成本金額-制費三
#         LET l_xckb.xckb122g = l_xckb.xckb121g * l_xckb.xckb021 #幣種三成本金額-制費四
#         LET l_xckb.xckb122h = l_xckb.xckb121h * l_xckb.xckb021 #幣種三成本金額-制費五
#         CALL s_num_round(g_round_type,l_xckb.xckb122 ,g_ooaj007_3) RETURNING l_xckb.xckb122 
#         CALL s_num_round(g_round_type,l_xckb.xckb122a,g_ooaj007_3) RETURNING l_xckb.xckb122a
#         CALL s_num_round(g_round_type,l_xckb.xckb122b,g_ooaj007_3) RETURNING l_xckb.xckb122b
#         CALL s_num_round(g_round_type,l_xckb.xckb122c,g_ooaj007_3) RETURNING l_xckb.xckb122c
#         CALL s_num_round(g_round_type,l_xckb.xckb122d,g_ooaj007_3) RETURNING l_xckb.xckb122d
#         CALL s_num_round(g_round_type,l_xckb.xckb122e,g_ooaj007_3) RETURNING l_xckb.xckb122e
#         CALL s_num_round(g_round_type,l_xckb.xckb122f,g_ooaj007_3) RETURNING l_xckb.xckb122f
#         CALL s_num_round(g_round_type,l_xckb.xckb122g,g_ooaj007_3) RETURNING l_xckb.xckb122g
#         CALL s_num_round(g_round_type,l_xckb.xckb122h,g_ooaj007_3) RETURNING l_xckb.xckb122h
#      END IF
#
#      CALL axcp200_execute_ins_xckb_null_zero(l_xckb.*)
#         RETURNING l_xckb.*
#      
##      INSERT INTO xckb_t VALUES (l_xckb.*)  #161124-00048#12 mark
#      #161124-00048#12 add(s)
#      INSERT INTO xckb_t(xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb004,xckb005,
#                         xckb006,xckb007,xckb008,xckb009,xckb010,xckb011,xckb012,xckb013,
#                         xckb014,xckb015,xckb016,xckb017,xckb018,xckb019,xckb020,xckb021,
#                         xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,xckb028,xckb029,
#                         xckb030,xckb031,xckb032,xckb033,xckb034,xckb035,xckb036,xckb037,
#                         xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,
#                         xckb101h,xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,
#                         xckb102g,xckb102h,xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,
#                         xckb111f,xckb111g,xckb111h,xckb112,xckb112a,xckb112b,xckb112c,xckb112d,
#                         xckb112e,xckb112f,xckb112g,xckb112h,xckb121,xckb121a,xckb121b,xckb121c,
#                         xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,xckb122,xckb122a,xckb122b,
#                         xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,xckb038) 
#                 VALUES (l_xckb.xckbent,l_xckb.xckbcomp,l_xckb.xckbld,l_xckb.xckb001,l_xckb.xckb002,l_xckb.xckb003,l_xckb.xckb004,l_xckb.xckb005,
#                         l_xckb.xckb006,l_xckb.xckb007,l_xckb.xckb008,l_xckb.xckb009,l_xckb.xckb010,l_xckb.xckb011,l_xckb.xckb012,l_xckb.xckb013,
#                         l_xckb.xckb014,l_xckb.xckb015,l_xckb.xckb016,l_xckb.xckb017,l_xckb.xckb018,l_xckb.xckb019,l_xckb.xckb020,l_xckb.xckb021,
#                         l_xckb.xckb022,l_xckb.xckb023,l_xckb.xckb024,l_xckb.xckb025,l_xckb.xckb026,l_xckb.xckb027,l_xckb.xckb028,l_xckb.xckb029,
#                         l_xckb.xckb030,l_xckb.xckb031,l_xckb.xckb032,l_xckb.xckb033,l_xckb.xckb034,l_xckb.xckb035,l_xckb.xckb036,l_xckb.xckb037,
#                         l_xckb.xckb101,l_xckb.xckb101a,l_xckb.xckb101b,l_xckb.xckb101c,l_xckb.xckb101d,l_xckb.xckb101e,l_xckb.xckb101f,l_xckb.xckb101g,
#                         l_xckb.xckb101h,l_xckb.xckb102,l_xckb.xckb102a,l_xckb.xckb102b,l_xckb.xckb102c,l_xckb.xckb102d,l_xckb.xckb102e,l_xckb.xckb102f,
#                         l_xckb.xckb102g,l_xckb.xckb102h,l_xckb.xckb111,l_xckb.xckb111a,l_xckb.xckb111b,l_xckb.xckb111c,l_xckb.xckb111d,l_xckb.xckb111e,
#                         l_xckb.xckb111f,l_xckb.xckb111g,l_xckb.xckb111h,l_xckb.xckb112,l_xckb.xckb112a,l_xckb.xckb112b,l_xckb.xckb112c,l_xckb.xckb112d,
#                         l_xckb.xckb112e,l_xckb.xckb112f,l_xckb.xckb112g,l_xckb.xckb112h,l_xckb.xckb121,l_xckb.xckb121a,l_xckb.xckb121b,l_xckb.xckb121c,
#                         l_xckb.xckb121d,l_xckb.xckb121e,l_xckb.xckb121f,l_xckb.xckb121g,l_xckb.xckb121h,l_xckb.xckb122,l_xckb.xckb122a,l_xckb.xckb122b,
#                         l_xckb.xckb122c,l_xckb.xckb122d,l_xckb.xckb122e,l_xckb.xckb122f,l_xckb.xckb122g,l_xckb.xckb122h,l_xckb.xckb038)
#      #161124-00048#12 add(e)
#      LET l_count = l_count + 1
#   END FOREACH
#   IF l_count = 0 THEN
#      #所选条件范围内无资料!
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'asf-00697'
#      LET g_errparam.extend = 'Select glaa003'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#   END IF
#   
#   RETURN r_success
#170616-00124#1---mark---e
END FUNCTION

#发出商品汇总统计档——用于汇总查询发出商品金额
#根据月度统计资料，汇总获得xckc发出商品当月的汇总统计档。
PRIVATE FUNCTION axcp200_execute_ins_xckc()
#170220-00032#1---mark---s   
#   DEFINE r_success  LIKE type_t.num5
#   DEFINE l_success  LIKE type_t.num5
#   DEFINE l_sql    STRING
##   DEFINE l_xckc   RECORD LIKE xckc_t.* #161124-00048#12 mark
#   DEFINE l_xckc RECORD  #發出商品匯總統計檔
#       xckcent LIKE xckc_t.xckcent, #企业编号
#       xckccomp LIKE xckc_t.xckccomp, #法人
#       xckcld LIKE xckc_t.xckcld, #账套
#       xckc001 LIKE xckc_t.xckc001, #年度
#       xckc002 LIKE xckc_t.xckc002, #期别
#       xckc003 LIKE xckc_t.xckc003, #客户编号
#       xckc004 LIKE xckc_t.xckc004, #产品编号
#       xckc005 LIKE xckc_t.xckc005, #科目编号
#       xckc006 LIKE xckc_t.xckc006, #库存单位
#       xckc007 LIKE xckc_t.xckc007, #期初数量
#       xckc008 LIKE xckc_t.xckc008, #期初金额
#       xckc009 LIKE xckc_t.xckc009, #本月出货数量
#       xckc010 LIKE xckc_t.xckc010, #本月出货金额
#       xckc011 LIKE xckc_t.xckc011, #本月转出数量
#       xckc012 LIKE xckc_t.xckc012, #本月转出金额
#       xckc013 LIKE xckc_t.xckc013, #期末数量
#       xckc014 LIKE xckc_t.xckc014, #期末金额
#       xckc015 LIKE xckc_t.xckc015, #币种二期初金额
#       xckc016 LIKE xckc_t.xckc016, #币种二本月出货金额
#       xckc017 LIKE xckc_t.xckc017, #币种二本月转出金额
#       xckc018 LIKE xckc_t.xckc018, #币种二期末金额
#       xckc019 LIKE xckc_t.xckc019, #币种三期初金额
#       xckc020 LIKE xckc_t.xckc020, #币种三本月出货金额
#       xckc021 LIKE xckc_t.xckc021, #币种三本月转出金额
#       xckc022 LIKE xckc_t.xckc022, #币种三期末金额
#       xckc023 LIKE xckc_t.xckc023, #特性
#       xckc008a LIKE xckc_t.xckc008a, #期初金额-材料
#       xckc008b LIKE xckc_t.xckc008b, #期初金额-人工
#       xckc008c LIKE xckc_t.xckc008c, #期初金额-加工
#       xckc008d LIKE xckc_t.xckc008d, #期初金额-制费一
#       xckc008e LIKE xckc_t.xckc008e, #期初金额-制费二
#       xckc008f LIKE xckc_t.xckc008f, #期初金额-制费三
#       xckc008g LIKE xckc_t.xckc008g, #期初金额-制费四
#       xckc008h LIKE xckc_t.xckc008h, #期初金额-制费五
#       xckc010a LIKE xckc_t.xckc010a, #本月出货金额-材料
#       xckc010b LIKE xckc_t.xckc010b, #本月出货金额-人工
#       xckc010c LIKE xckc_t.xckc010c, #本月出货金额-加工
#       xckc010d LIKE xckc_t.xckc010d, #本月出货金额-制费一
#       xckc010e LIKE xckc_t.xckc010e, #本月出货金额-制费二
#       xckc010f LIKE xckc_t.xckc010f, #本月出货金额-制费三
#       xckc010g LIKE xckc_t.xckc010g, #本月出货金额-制费四
#       xckc010h LIKE xckc_t.xckc010h, #本月出货金额-制费五
#       xckc012a LIKE xckc_t.xckc012a, #本月转出金额-材料
#       xckc012b LIKE xckc_t.xckc012b, #本月转出金额-人工
#       xckc012c LIKE xckc_t.xckc012c, #本月转出金额-加工
#       xckc012d LIKE xckc_t.xckc012d, #本月转出金额-制费一
#       xckc012e LIKE xckc_t.xckc012e, #本月转出金额-制费二
#       xckc012f LIKE xckc_t.xckc012f, #本月转出金额-制费三
#       xckc012g LIKE xckc_t.xckc012g, #本月转出金额-制费四
#       xckc012h LIKE xckc_t.xckc012h, #本月转出金额-制费五
#       xckc014a LIKE xckc_t.xckc014a, #期末金额-材料
#       xckc014b LIKE xckc_t.xckc014b, #期末金额-人工
#       xckc014c LIKE xckc_t.xckc014c, #期末金额-加工
#       xckc014d LIKE xckc_t.xckc014d, #期末金额-制费一
#       xckc014e LIKE xckc_t.xckc014e, #期末金额-制费二
#       xckc014f LIKE xckc_t.xckc014f, #期末金额-制费三
#       xckc014g LIKE xckc_t.xckc014g, #期末金额-制费四
#       xckc014h LIKE xckc_t.xckc014h, #期末金额-制费五
#       xckc015a LIKE xckc_t.xckc015a, #币种二期初金额-材料
#       xckc015b LIKE xckc_t.xckc015b, #币种二期初金额-人工
#       xckc015c LIKE xckc_t.xckc015c, #币种二期初金额-加工
#       xckc015d LIKE xckc_t.xckc015d, #币种二期初金额-制费一
#       xckc015e LIKE xckc_t.xckc015e, #币种二期初金额-制费二
#       xckc015f LIKE xckc_t.xckc015f, #币种二期初金额-制费三
#       xckc015g LIKE xckc_t.xckc015g, #币种二期初金额-制费四
#       xckc015h LIKE xckc_t.xckc015h, #币种二期初金额-制费五
#       xckc016a LIKE xckc_t.xckc016a, #币种二本月出货金额-材料
#       xckc016b LIKE xckc_t.xckc016b, #币种二本月出货金额-人工
#       xckc016c LIKE xckc_t.xckc016c, #币种二本月出货金额-加工
#       xckc016d LIKE xckc_t.xckc016d, #币种二本月出货金额-制费一
#       xckc016e LIKE xckc_t.xckc016e, #币种二本月出货金额-制费二
#       xckc016f LIKE xckc_t.xckc016f, #币种二本月出货金额-制费三
#       xckc016g LIKE xckc_t.xckc016g, #币种二本月出货金额-制费四
#       xckc016h LIKE xckc_t.xckc016h, #币种二本月出货金额-制费五
#       xckc017a LIKE xckc_t.xckc017a, #币种二本月转出金额-材料
#       xckc017b LIKE xckc_t.xckc017b, #币种二本月转出金额-人工
#       xckc017c LIKE xckc_t.xckc017c, #币种二本月转出金额-加工
#       xckc017d LIKE xckc_t.xckc017d, #币种二本月转出金额-制费一
#       xckc017e LIKE xckc_t.xckc017e, #币种二本月转出金额-制费二
#       xckc017f LIKE xckc_t.xckc017f, #币种二本月转出金额-制费三
#       xckc017g LIKE xckc_t.xckc017g, #币种二本月转出金额-制费四
#       xckc017h LIKE xckc_t.xckc017h, #币种二本月转出金额-制费五
#       xckc018a LIKE xckc_t.xckc018a, #币种二期末金额-材料
#       xckc018b LIKE xckc_t.xckc018b, #币种二期末金额-人工
#       xckc018c LIKE xckc_t.xckc018c, #币种二期末金额-加工
#       xckc018d LIKE xckc_t.xckc018d, #币种二期末金额-制费一
#       xckc018e LIKE xckc_t.xckc018e, #币种二期末金额-制费二
#       xckc018f LIKE xckc_t.xckc018f, #币种二期末金额-制费三
#       xckc018g LIKE xckc_t.xckc018g, #币种二期末金额-制费四
#       xckc018h LIKE xckc_t.xckc018h, #币种二期末金额-制费五
#       xckc019a LIKE xckc_t.xckc019a, #币种三期初金额-材料
#       xckc019b LIKE xckc_t.xckc019b, #币种三期初金额-人工
#       xckc019c LIKE xckc_t.xckc019c, #币种三期初金额-加工
#       xckc019d LIKE xckc_t.xckc019d, #币种三期初金额-制费一
#       xckc019e LIKE xckc_t.xckc019e, #币种三期初金额-制费二
#       xckc019f LIKE xckc_t.xckc019f, #币种三期初金额-制费三
#       xckc019g LIKE xckc_t.xckc019g, #币种三期初金额-制费四
#       xckc019h LIKE xckc_t.xckc019h, #币种三期初金额-制费五
#       xckc020a LIKE xckc_t.xckc020a, #币种三本月出货金额-材料
#       xckc020b LIKE xckc_t.xckc020b, #币种三本月出货金额-人工
#       xckc020c LIKE xckc_t.xckc020c, #币种三本月出货金额-加工
#       xckc020d LIKE xckc_t.xckc020d, #币种三本月出货金额-制费一
#       xckc020e LIKE xckc_t.xckc020e, #币种三本月出货金额-制费二
#       xckc020f LIKE xckc_t.xckc020f, #币种三本月出货金额-制费三
#       xckc020g LIKE xckc_t.xckc020g, #币种三本月出货金额-制费四
#       xckc020h LIKE xckc_t.xckc020h, #币种三本月出货金额-制费五
#       xckc021a LIKE xckc_t.xckc021a, #币种三本月转出金额-材料
#       xckc021b LIKE xckc_t.xckc021b, #币种三本月转出金额-人工
#       xckc021c LIKE xckc_t.xckc021c, #币种三本月转出金额-加工
#       xckc021d LIKE xckc_t.xckc021d, #币种三本月转出金额-制费一
#       xckc021e LIKE xckc_t.xckc021e, #币种三本月转出金额-制费二
#       xckc021f LIKE xckc_t.xckc021f, #币种三本月转出金额-制费三
#       xckc021g LIKE xckc_t.xckc021g, #币种三本月转出金额-制费四
#       xckc021h LIKE xckc_t.xckc021h, #币种三本月转出金额-制费五
#       xckc022a LIKE xckc_t.xckc022a, #币种三期末金额-材料
#       xckc022b LIKE xckc_t.xckc022b, #币种三期末金额-人工
#       xckc022c LIKE xckc_t.xckc022c, #币种三期末金额-加工
#       xckc022d LIKE xckc_t.xckc022d, #币种三期末金额-制费一
#       xckc022e LIKE xckc_t.xckc022e, #币种三期末金额-制费二
#       xckc022f LIKE xckc_t.xckc022f, #币种三期末金额-制费三
#       xckc022g LIKE xckc_t.xckc022g, #币种三期末金额-制费四
#       xckc022h LIKE xckc_t.xckc022h  #币种三期末金额-制费五
#END RECORD
#   DEFINE l_msg    STRING #160328-00022#5
#
#
#   LET r_success = TRUE
#
#   #160328-00022#5-s-add
#   IF g_bgjob <> "Y" THEN 
#      LET l_msg = cl_getmsg_parm("axc-00783",g_lang,'')  #抓取開票資料寫入發出商品統計檔！
#      CALL cl_progress_no_window_ing(l_msg)          
#   END IF      
#   #160328-00022#5-e-add 
#
#   LET g_wc = g_master.wc
#   LET g_wc= cl_replace_str(g_wc,"pmaa001","xckb009") #客戶
#   LET g_wc= cl_replace_str(g_wc,"imaa001","xckb012") #產品編號
#   LET l_sql="INSERT INTO xckc_t(xckcent,xckccomp,xckcld,xckc001,xckc002,xckc003,xckc004,xckc023,xckc005,xckc006,",
#             #                   期初数  金额     本月出货数 金额  本月转出数 金额   期末数  金额
#             "                   xckc007,xckc008,xckc009,xckc010,xckc011,xckc012,xckc013,xckc014,",
#             #                币种2期初/本月出货/本月转出/期末金额  币种3期初/本月出货/本月转出/期末金额
#             "                   xckc015,xckc016,xckc017,xckc018,xckc019,xckc020,xckc021,xckc022, ",
#             "                   xckc008a,xckc008b,xckc008c,xckc008d,xckc008e,xckc008f,xckc008g,xckc008h, ",
#             "                   xckc010a,xckc010b,xckc010c,xckc010d,xckc010e,xckc010f,xckc010g,xckc010h, ",
#             "                   xckc012a,xckc012b,xckc012c,xckc012d,xckc012e,xckc012f,xckc012g,xckc012h, ",
#             "                   xckc014a,xckc014b,xckc014c,xckc014d,xckc014e,xckc014f,xckc014g,xckc014h, ",
#             "                   xckc015a,xckc015b,xckc015c,xckc015d,xckc015e,xckc015f,xckc015g,xckc015h, ",
#             "                   xckc016a,xckc016b,xckc016c,xckc016d,xckc016e,xckc016f,xckc016g,xckc016h, ",
#             "                   xckc017a,xckc017b,xckc017c,xckc017d,xckc017e,xckc017f,xckc017g,xckc017h, ",
#             "                   xckc018a,xckc018b,xckc018c,xckc018d,xckc018e,xckc018f,xckc018g,xckc018h, ",
#             "                   xckc019a,xckc019b,xckc019c,xckc019d,xckc019e,xckc019f,xckc019g,xckc019h, ",
#             "                   xckc020a,xckc020b,xckc020c,xckc020d,xckc020e,xckc020f,xckc020g,xckc020h, ",
#             "                   xckc021a,xckc021b,xckc021c,xckc021d,xckc021e,xckc021f,xckc021g,xckc021h, ",
#             "                   xckc022a,xckc022b,xckc022c,xckc022d,xckc022e,xckc022f,xckc022g,xckc022h) ",
#             "SELECT UNIQUE xckbent,xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,NVL(xckb022,' '),xckb020,",
#             "       0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0, ",
#             "       0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0, ",
#             "       0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0, ",
#             "       0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0  ",
#             "  FROM xckb_t ",
#             " WHERE xckbent = ",g_enterprise,     #企業代碼
#             "   AND xckbcomp='",g_comp,"' ",      #法人，跟据点走，不是跟账别走
#             "   AND xckbld  ='",g_master.glaald,"' ",  #帳別
#             "   AND xckb007 = ",g_master.yy,      #年度
#             "   AND xckb008 = ",g_master.pp,      #期別
#             "   AND ",g_wc
#   PREPARE axcp200_execute_ins_xckc_p FROM l_sql
#   EXECUTE axcp200_execute_ins_xckc_p
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'axcp200_execute_ins_xckc_p'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   
#   #期初 
#   #LET g_wc = g_master.wc
#   #LET g_wc = cl_replace_str(g_wc,"pmaa001","xckc003") #客戶
#   #LET g_wc = cl_replace_str(g_wc,"imaa001","xckc004") #產品編號
#   LET l_sql = " MERGE INTO xckc_t a ",
#               " USING ( SELECT xckc_t.* FROM xckc_t ",
#               "          WHERE xckcent = ",g_enterprise,
#               "            AND xckccomp='",g_comp,"' ",
#               "            AND xckcld  = '",g_master.glaald,"'",
#               "            AND xckc001 = ",g_last_yy,  #年度-上期
#               "            AND xckc002 = ",g_last_pp,  #期别-上期
#               "            AND (xckc013 <> 0 OR xckc014 <> 0 )", #170105-00068#1 add 
#               #"            AND ",g_wc,
#               "       ) b ",
#               "    ON ( a.xckcent = b.xckcent         ",
#               "     AND a.xckccomp= b.xckccomp        ",
#               "     AND a.xckcld  = b.xckcld          ",
#               "     AND a.xckc001 = ",g_master.yy, #年度-本期
#               "     AND a.xckc002 = ",g_master.pp, #期别-本期
#               "     AND a.xckc003 = b.xckc003         ", #客戶
#               "     AND a.xckc004 = b.xckc004         ", #產品
#               "     AND a.xckc023 = b.xckc023)         ", #特性   #170105-00068#1 add )
#               #"     AND a.xckc005 = b.xckc005 )       ", #科目  #170105-00068#1 mark 
#               "  WHEN MATCHED THEN                          ",
#               "       UPDATE SET a.xckc007  = nvl(b.xckc013,0) ,   ",  #期初数量
#               "                  a.xckc008  = nvl(b.xckc014,0) ,   ",  #期初金额
#               "                  a.xckc008a = nvl(b.xckc014a,0) ,   ",  #期初金额
#               "                  a.xckc008b = nvl(b.xckc014b,0) ,   ",  #期初金额
#               "                  a.xckc008c = nvl(b.xckc014c,0) ,   ",  #期初金额
#               "                  a.xckc008d = nvl(b.xckc014d,0) ,   ",  #期初金额
#               "                  a.xckc008e = nvl(b.xckc014e,0) ,   ",  #期初金额
#               "                  a.xckc008f = nvl(b.xckc014f,0) ,   ",  #期初金额
#               "                  a.xckc008g = nvl(b.xckc014g,0) ,   ",  #期初金额
#               "                  a.xckc008h = nvl(b.xckc014h,0) ,   ",  #期初金额
#               "                  a.xckc015  = nvl(b.xckc018,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015a = nvl(b.xckc018a,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015b = nvl(b.xckc018b,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015c = nvl(b.xckc018c,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015d = nvl(b.xckc018d,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015e = nvl(b.xckc018e,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015f = nvl(b.xckc018f,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015g = nvl(b.xckc018g,0) ,   ",  #币种2期初金额  
#               "                  a.xckc015h = nvl(b.xckc018h,0) ,   ",  #币种2期初金额
#               "                  a.xckc019  = nvl(b.xckc022,0) ,   ",  #币种3期初金额
#               "                  a.xckc019a = nvl(b.xckc022a,0) ,   ",  #币种3期初金额
#               "                  a.xckc019b = nvl(b.xckc022b,0) ,   ",  #币种3期初金额
#               "                  a.xckc019c = nvl(b.xckc022c,0) ,   ",  #币种3期初金额
#               "                  a.xckc019d = nvl(b.xckc022d,0) ,   ",  #币种3期初金额
#               "                  a.xckc019e = nvl(b.xckc022e,0) ,   ",  #币种3期初金额
#               "                  a.xckc019f = nvl(b.xckc022f,0) ,   ",  #币种3期初金额
#               "                  a.xckc019g = nvl(b.xckc022g,0) ,   ",  #币种3期初金额
#               "                  a.xckc019h = nvl(b.xckc022h,0)     ",  #币种3期初金额
#               "        WHERE a.xckc001 = ",g_master.yy,  #年度-本期
#               "          AND a.xckc002 = ",g_master.pp,  #期别-本期 #161012-00038#1 mark  ','    #170105-00068#1 remove #
#              #170105-00068#1 remove # start -----
#              #161012-00038#1 mark  --begin--
#              #上面insert已经塞入了，故mark              
#              "  WHEN NOT MATCHED THEN                      ",
#              "       INSERT VALUES(b.xckcent,b.xckccomp,b.xckcld,",g_master.yy,",",g_master.pp,", ",
#              "                     b.xckc003,b.xckc004,b.xckc005,b.xckc006,     ",
#              "                     b.xckc013,b.xckc014, 0,0, 0,0, 0,0,", #期初数量/金额,本月出货数/金,本月转出数/金，期末数/金
#              "                     b.xckc018,0,0,0, b.xckc022,0,0,0,", #币种二...  币种三...
#              "                     b.xckc023, ",        #特性
#              "                     b.xckc014a,b.xckc014b,b.xckc014c,b.xckc014d, ", #期初金额明细
#              "                     b.xckc014e,b.xckc014f,b.xckc014g,b.xckc014h, ", 
#              "                     0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0, ",   #本月出货/转出/期末金额
#              "                     b.xckc018a,b.xckc018b,b.xckc018c,b.xckc018d, ", #期初金额明细--币种二
#              "                     b.xckc018e,b.xckc018f,b.xckc018g,b.xckc018h, ",
#              "                     0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0, ",   #本月出货/转出/期末金额
#              "                     b.xckc022a,b.xckc022b,b.xckc022c,b.xckc022d, ", #期初金额明细--币种三
#              "                     b.xckc022e,b.xckc022f,b.xckc022g,b.xckc022h, ",
#              "                     0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0  ",   #本月出货/转出/期末金额
#              "                     )  "
#              #161012-00038#1 mark  --end--
#              #170105-00068#1 remove # end -----
#   PREPARE axcp200_execute_ins_xckc_p1 FROM l_sql
#   EXECUTE axcp200_execute_ins_xckc_p1
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'axcp200_execute_ins_xckc_p1'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   #本月出货数
#   LET g_wc = g_master.wc
#   LET g_wc= cl_replace_str(g_wc,"pmaa001","xckb009") #客戶
#   LET g_wc= cl_replace_str(g_wc,"imaa001","xckb012") #產品編號
#   LET l_sql = " MERGE INTO xckc_t a ",
#               #" USING xckb_t ",
#               " USING ( SELECT xckbent,xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckb022, ",
#               "                SUM(xckb021) xckb021,SUM(xckb102) xckb102,SUM(xckb112) xckb112,SUM(xckb122) xckb122, ",
#               "                SUM(xckb102a) xckb102a,SUM(xckb102b) xckb102b,SUM(xckb102c) xckb102c,SUM(xckb102d) xckb102d, ",
#               "                SUM(xckb102e) xckb102e,SUM(xckb102f) xckb102f,SUM(xckb102g) xckb102g,SUM(xckb102h) xckb102h, ",
#               "                SUM(xckb112a) xckb112a,SUM(xckb112b) xckb112b,SUM(xckb112c) xckb112c,SUM(xckb112d) xckb112d, ",
#               "                SUM(xckb112e) xckb112e,SUM(xckb112f) xckb112f,SUM(xckb112g) xckb112g,SUM(xckb112h) xckb112h, ",
#               "                SUM(xckb122a) xckb122a,SUM(xckb122b) xckb122b,SUM(xckb122c) xckb122c,SUM(xckb122d) xckb122d, ",
#               "                SUM(xckb122e) xckb122e,SUM(xckb122f) xckb122f,SUM(xckb122g) xckb122g,SUM(xckb122h) xckb122h  ",
#               "           FROM xckb_t ",
#               "          WHERE xckbent = ",g_enterprise,
#               "            AND xckbcomp='",g_comp,"' ",
#               "            AND xckbld  = '",g_master.glaald,"'",
#               "            AND xckb007 = ",g_master.yy,  #年度-本期
#               "            AND xckb008 = ",g_master.pp,  #期别-本期
#               "            AND xckb002 = 1 ",
#               "            AND ",g_wc,
#               "          GROUP BY xckbent,xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckb022 ",
#               "       ) b ",
#               "    ON ( a.xckcent = b.xckbent   ",
#               "    AND  a.xckccomp= b.xckbcomp  ",
#               "    AND  a.xckcld  = b.xckbld    ",
#               "    AND  a.xckc001 = b.xckb007   ", #年度-本期
#               "    AND  a.xckc002 = b.xckb008   ", #期别-本期
#               "    AND  a.xckc003 = b.xckb009   ", #客戶
#               "    AND  a.xckc004 = b.xckb012   ", #產品
#               "    AND  a.xckc023 = b.xckb037   ", #特性
#               "    AND  a.xckc005 = b.xckb022 ) ", #科目
#               "  WHEN MATCHED THEN  ",
#               "       UPDATE SET a.xckc009  = b.xckb021, ",  #本月出货数量
#               "                  a.xckc010  = b.xckb102, ",  #本月出货金额
#               "                  a.xckc010a = b.xckb102a, ",  #本月出货金额
#               "                  a.xckc010b = b.xckb102b, ",  #本月出货金额
#               "                  a.xckc010c = b.xckb102c, ",  #本月出货金额
#               "                  a.xckc010d = b.xckb102d, ",  #本月出货金额
#               "                  a.xckc010e = b.xckb102e, ",  #本月出货金额
#               "                  a.xckc010f = b.xckb102f, ",  #本月出货金额
#               "                  a.xckc010g = b.xckb102g, ",  #本月出货金额
#               "                  a.xckc010h = b.xckb102h, ",  #本月出货金额
#               "                  a.xckc016  = b.xckb112, ",  #币种2
#               "                  a.xckc016a = b.xckb112a, ",  #
#               "                  a.xckc016b = b.xckb112b, ",  #
#               "                  a.xckc016c = b.xckb112c, ",  #
#               "                  a.xckc016d = b.xckb112d, ",  #
#               "                  a.xckc016e = b.xckb112e, ",  #
#               "                  a.xckc016f = b.xckb112f, ",  #
#               "                  a.xckc016g = b.xckb112g, ",  #
#               "                  a.xckc016h = b.xckb112h, ",  #
#               "                  a.xckc020  = b.xckb122, ",  #币种3
#               "                  a.xckc020a = b.xckb122a, ",  #
#               "                  a.xckc020b = b.xckb122b, ",  #
#               "                  a.xckc020c = b.xckb122c, ",  #
#               "                  a.xckc020d = b.xckb122d, ",  #
#               "                  a.xckc020e = b.xckb122e, ",  #
#               "                  a.xckc020f = b.xckb122f, ",  #
#               "                  a.xckc020g = b.xckb122g, ",  #
#               "                  a.xckc020h = b.xckb122h  "   #
#   PREPARE axcp200_execute_ins_xckc_p2 FROM l_sql
#   EXECUTE axcp200_execute_ins_xckc_p2
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'axcp200_execute_ins_xckc_p2'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   #本月转出数
#   LET l_sql = " MERGE INTO xckc_t a ",
#               #" USING xckb_t ",
#               " USING ( SELECT xckbent,xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckb022, ",
#               "                SUM(xckb021) xckb021,SUM(xckb102) xckb102,SUM(xckb112) xckb112,SUM(xckb122) xckb122, ",
#               "                SUM(xckb102a) xckb102a,SUM(xckb102b) xckb102b,SUM(xckb102c) xckb102c,SUM(xckb102d) xckb102d, ",
#               "                SUM(xckb102e) xckb102e,SUM(xckb102f) xckb102f,SUM(xckb102g) xckb102g,SUM(xckb102h) xckb102h, ",
#               "                SUM(xckb112a) xckb112a,SUM(xckb112b) xckb112b,SUM(xckb112c) xckb112c,SUM(xckb112d) xckb112d, ",
#               "                SUM(xckb112e) xckb112e,SUM(xckb112f) xckb112f,SUM(xckb112g) xckb112g,SUM(xckb112h) xckb112h, ",
#               "                SUM(xckb122a) xckb122a,SUM(xckb122b) xckb122b,SUM(xckb122c) xckb122c,SUM(xckb122d) xckb122d, ",
#               "                SUM(xckb122e) xckb122e,SUM(xckb122f) xckb122f,SUM(xckb122g) xckb122g,SUM(xckb122h) xckb122h  ",
#               "           FROM xckb_t ",
#               "          WHERE xckbent = ",g_enterprise,
#               "            AND xckbcomp='",g_comp,"' ",
#               "            AND xckbld  = '",g_master.glaald,"'",
#               "            AND xckb007 = ",g_master.yy,  #年度-本期
#               "            AND xckb008 = ",g_master.pp,  #期别-本期
#               "            AND xckb002 = -1 ",  #转出
#               "            AND ",g_wc,
#               "          GROUP BY xckbent,xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb037,xckb022 ",
#               "       ) b ",
#               "    ON ( a.xckcent = b.xckbent   ",
#               "    AND  a.xckccomp= b.xckbcomp  ",
#               "    AND  a.xckcld  = b.xckbld    ",
#               "    AND  a.xckc001 = b.xckb007   ", #年度-本期
#               "    AND  a.xckc002 = b.xckb008   ", #期别-本期
#               "    AND  a.xckc003 = b.xckb009   ", #客戶
#               "    AND  a.xckc004 = b.xckb012   ", #產品
#               "    AND  a.xckc023 = b.xckb037   ", #特性
#               "    AND  a.xckc005 = b.xckb022 ) ", #科目
#               "  WHEN MATCHED THEN  ",  
#               "       UPDATE SET a.xckc011  = b.xckb021, ",  #本月转出数量
#               "                  a.xckc012  = b.xckb102, ",  #本月转出金额
#               "                  a.xckc012a = b.xckb102a, ",  #本月转出金额
#               "                  a.xckc012b = b.xckb102b, ",  #本月转出金额
#               "                  a.xckc012c = b.xckb102c, ",  #本月转出金额
#               "                  a.xckc012d = b.xckb102d, ",  #本月转出金额
#               "                  a.xckc012e = b.xckb102e, ",  #本月转出金额
#               "                  a.xckc012f = b.xckb102f, ",  #本月转出金额
#               "                  a.xckc012g = b.xckb102g, ",  #本月转出金额
#               "                  a.xckc012h = b.xckb102h, ",  #本月转出金额
#               "                  a.xckc017  = b.xckb112, ",  #币种2
#               "                  a.xckc017a = b.xckb112a, ",  #
#               "                  a.xckc017b = b.xckb112b, ",  #
#               "                  a.xckc017c = b.xckb112c, ",  #
#               "                  a.xckc017d = b.xckb112d, ",  #
#               "                  a.xckc017e = b.xckb112e, ",  #
#               "                  a.xckc017f = b.xckb112f, ",  #
#               "                  a.xckc017g = b.xckb112g, ",  #
#               "                  a.xckc017h = b.xckb112h, ",  #
#               "                  a.xckc021  = b.xckb122, ",  #币种3
#               "                  a.xckc021a = b.xckb122a, ",  #
#               "                  a.xckc021b = b.xckb122b, ",  #
#               "                  a.xckc021c = b.xckb122c, ",  #
#               "                  a.xckc021d = b.xckb122d, ",  #
#               "                  a.xckc021e = b.xckb122e, ",  #
#               "                  a.xckc021f = b.xckb122f, ",  #
#               "                  a.xckc021g = b.xckb122g, ",  #
#               "                  a.xckc021h = b.xckb122h  "   #
#   PREPARE axcp200_execute_ins_xckc_p3 FROM l_sql
#   EXECUTE axcp200_execute_ins_xckc_p3
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'axcp200_execute_ins_xckc_p3'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   #期末数
#   LET g_wc = g_master.wc
#   LET g_wc = cl_replace_str(g_wc,"pmaa001","xckc003") #客戶
#   LET g_wc = cl_replace_str(g_wc,"imaa001","xckc004") #產品編號
#   LET l_sql = " UPDATE xckc_t SET xckc013  = xckc007 + xckc009 - xckc011, ",  #期末数量
#               "                   xckc014  = xckc008 + xckc010 - xckc012, ",  #期末金额
#               "                   xckc014a = xckc008a+ xckc010a- xckc012a, ",  #期末金额
#               "                   xckc014b = xckc008b+ xckc010b- xckc012b, ",  #期末金额
#               "                   xckc014c = xckc008c+ xckc010c- xckc012c, ",  #期末金额
#               "                   xckc014d = xckc008d+ xckc010d- xckc012d, ",  #期末金额
#               "                   xckc014e = xckc008e+ xckc010e- xckc012e, ",  #期末金额
#               "                   xckc014f = xckc008f+ xckc010f- xckc012f, ",  #期末金额
#               "                   xckc014g = xckc008g+ xckc010g- xckc012g, ",  #期末金额
#               "                   xckc014h = xckc008h+ xckc010h- xckc012h, ",  #期末金额
#               "                   xckc018  = xckc015 + xckc016 - xckc017, ",  #币种2 
#               "                   xckc018a = xckc015a+ xckc016a- xckc017a, ",  #
#               "                   xckc018b = xckc015b+ xckc016b- xckc017b, ",  #
#               "                   xckc018c = xckc015c+ xckc016c- xckc017c, ",  #
#               "                   xckc018d = xckc015d+ xckc016d- xckc017d, ",  #
#               "                   xckc018e = xckc015e+ xckc016e- xckc017e, ",  #
#               "                   xckc018f = xckc015f+ xckc016f- xckc017f, ",  #
#               "                   xckc018g = xckc015g+ xckc016g- xckc017g, ",  #
#               "                   xckc018h = xckc015h+ xckc016h- xckc017h, ",  #
#               "                   xckc022  = xckc019 + xckc020 - xckc021, ",  #币种3
#               "                   xckc022a = xckc019a+ xckc020a- xckc021a, ",  #
#               "                   xckc022b = xckc019b+ xckc020b- xckc021b, ",  #
#               "                   xckc022c = xckc019c+ xckc020c- xckc021c, ",  #
#               "                   xckc022d = xckc019d+ xckc020d- xckc021d, ",  #
#               "                   xckc022e = xckc019e+ xckc020e- xckc021e, ",  #
#               "                   xckc022f = xckc019f+ xckc020f- xckc021f, ",  #
#               "                   xckc022g = xckc019g+ xckc020g- xckc021g, ",  #
#               "                   xckc022h = xckc019h+ xckc020h- xckc021h  ",  #
#               "  WHERE xckcent = ",g_enterprise,
#               "    AND xckccomp='",g_comp,"' ",
#               "    AND xckcld  = '",g_master.glaald,"'",
#               "    AND xckc001 = ",g_master.yy,  #年度-本期
#               "    AND xckc002 = ",g_master.pp,  #期别-本期
#               "    AND ",g_wc
#   PREPARE axcp200_execute_ins_xckc_p4 FROM l_sql
#   EXECUTE axcp200_execute_ins_xckc_p4
#   IF SQLCA.sqlcode THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = SQLCA.sqlcode
#      LET g_errparam.extend = 'axcp200_execute_ins_xckc_p4'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   
#   RETURN r_success
#170220-00032#1---mark---e   
END FUNCTION

#xckb空赋值0
PRIVATE FUNCTION axcp200_execute_ins_xckb_null_zero(p_xckb)
#170616-00124#1---mark---s
##   DEFINE p_xckb     RECORD LIKE xckb_t.*  #161124-00048#12 mark
#   #161124-00048#12 add(s)
   DEFINE p_xckb RECORD  #發出商品統計檔
       xckbent LIKE xckb_t.xckbent, #企业编号
       xckbcomp LIKE xckb_t.xckbcomp, #法人
       xckbld LIKE xckb_t.xckbld, #账套
       xckb001 LIKE xckb_t.xckb001, #来源
       xckb002 LIKE xckb_t.xckb002, #方向
       xckb003 LIKE xckb_t.xckb003, #发票号码
       xckb004 LIKE xckb_t.xckb004, #据点site
       xckb005 LIKE xckb_t.xckb005, #出货单号
       xckb006 LIKE xckb_t.xckb006, #出货项次
       xckb007 LIKE xckb_t.xckb007, #年度
       xckb008 LIKE xckb_t.xckb008, #期别
       xckb009 LIKE xckb_t.xckb009, #客户编号
       xckb010 LIKE xckb_t.xckb010, #人员编号
       xckb011 LIKE xckb_t.xckb011, #部门编号
       xckb012 LIKE xckb_t.xckb012, #产品编号
       xckb013 LIKE xckb_t.xckb013, #销售单位
       xckb014 LIKE xckb_t.xckb014, #数量
       xckb015 LIKE xckb_t.xckb015, #仓库编号
       xckb016 LIKE xckb_t.xckb016, #库位编号
       xckb017 LIKE xckb_t.xckb017, #批号
       xckb018 LIKE xckb_t.xckb018, #no use
       xckb019 LIKE xckb_t.xckb019, #发票编号
       xckb020 LIKE xckb_t.xckb020, #库存单位
       xckb021 LIKE xckb_t.xckb021, #库存数量
       xckb022 LIKE xckb_t.xckb022, #科目编号
       xckb023 LIKE xckb_t.xckb023, #多角贸易否
       xckb024 LIKE xckb_t.xckb024, #开票年度
       xckb025 LIKE xckb_t.xckb025, #开票期别
       xckb026 LIKE xckb_t.xckb026, #币种一
       xckb027 LIKE xckb_t.xckb027, #金额
       xckb028 LIKE xckb_t.xckb028, #币种二
       xckb029 LIKE xckb_t.xckb029, #金额
       xckb030 LIKE xckb_t.xckb030, #币种三
       xckb031 LIKE xckb_t.xckb031, #金额
       xckb032 LIKE xckb_t.xckb032, #no use
       xckb033 LIKE xckb_t.xckb033, #no use
       xckb034 LIKE xckb_t.xckb034, #no use
       xckb035 LIKE xckb_t.xckb035, #no use
       xckb036 LIKE xckb_t.xckb036, #项序
       xckb037 LIKE xckb_t.xckb037, #特性
       xckb101 LIKE xckb_t.xckb101, #币种一成本单价
       xckb101a LIKE xckb_t.xckb101a, #币种一成本单价-材料
       xckb101b LIKE xckb_t.xckb101b, #币种一成本单价-人工
       xckb101c LIKE xckb_t.xckb101c, #币种一成本单价-加工
       xckb101d LIKE xckb_t.xckb101d, #币种一成本单价-制费一
       xckb101e LIKE xckb_t.xckb101e, #币种一成本单价-制费二
       xckb101f LIKE xckb_t.xckb101f, #币种一成本单价-制费三
       xckb101g LIKE xckb_t.xckb101g, #币种一成本单价-制费四
       xckb101h LIKE xckb_t.xckb101h, #币种一成本单价-制费五
       xckb102 LIKE xckb_t.xckb102, #币种一成本金额
       xckb102a LIKE xckb_t.xckb102a, #币种一成本金额-材料
       xckb102b LIKE xckb_t.xckb102b, #币种一成本金额-人工
       xckb102c LIKE xckb_t.xckb102c, #币种一成本金额-加工
       xckb102d LIKE xckb_t.xckb102d, #币种一成本金额-制费一
       xckb102e LIKE xckb_t.xckb102e, #币种一成本金额-制费二
       xckb102f LIKE xckb_t.xckb102f, #币种一成本金额-制费三
       xckb102g LIKE xckb_t.xckb102g, #币种一成本金额-制费四
       xckb102h LIKE xckb_t.xckb102h, #币种一成本金额-制费五
       xckb111 LIKE xckb_t.xckb111, #币种二成本单价
       xckb111a LIKE xckb_t.xckb111a, #币种二成本单价-材料
       xckb111b LIKE xckb_t.xckb111b, #币种二成本单价-人工
       xckb111c LIKE xckb_t.xckb111c, #币种二成本单价-加工
       xckb111d LIKE xckb_t.xckb111d, #币种二成本单价-制费一
       xckb111e LIKE xckb_t.xckb111e, #币种二成本单价-制费二
       xckb111f LIKE xckb_t.xckb111f, #币种二成本单价-制费三
       xckb111g LIKE xckb_t.xckb111g, #币种二成本单价-制费四
       xckb111h LIKE xckb_t.xckb111h, #币种二成本单价-制费五
       xckb112 LIKE xckb_t.xckb112, #币种二成本金额
       xckb112a LIKE xckb_t.xckb112a, #币种二成本金额-材料
       xckb112b LIKE xckb_t.xckb112b, #币种二成本金额-人工
       xckb112c LIKE xckb_t.xckb112c, #币种二成本金额-加工
       xckb112d LIKE xckb_t.xckb112d, #币种二成本金额-制费一
       xckb112e LIKE xckb_t.xckb112e, #币种二成本金额-制费二
       xckb112f LIKE xckb_t.xckb112f, #币种二成本金额-制费三
       xckb112g LIKE xckb_t.xckb112g, #币种二成本金额-制费四
       xckb112h LIKE xckb_t.xckb112h, #币种二成本金额-制费五
       xckb121 LIKE xckb_t.xckb121, #币种三成本单价
       xckb121a LIKE xckb_t.xckb121a, #币种三成本单价-材料
       xckb121b LIKE xckb_t.xckb121b, #币种三成本单价-人工
       xckb121c LIKE xckb_t.xckb121c, #币种三成本单价-加工
       xckb121d LIKE xckb_t.xckb121d, #币种三成本单价-制费一
       xckb121e LIKE xckb_t.xckb121e, #币种三成本单价-制费二
       xckb121f LIKE xckb_t.xckb121f, #币种三成本单价-制费三
       xckb121g LIKE xckb_t.xckb121g, #币种三成本单价-制费四
       xckb121h LIKE xckb_t.xckb121h, #币种三成本单价-制费五
       xckb122 LIKE xckb_t.xckb122, #币种三成本金额
       xckb122a LIKE xckb_t.xckb122a, #币种三成本金额-材料
       xckb122b LIKE xckb_t.xckb122b, #币种三成本金额-人工
       xckb122c LIKE xckb_t.xckb122c, #币种三成本金额-加工
       xckb122d LIKE xckb_t.xckb122d, #币种三成本金额-制费一
       xckb122e LIKE xckb_t.xckb122e, #种三成本金额-制费二
       xckb122f LIKE xckb_t.xckb122f, #币种三成本金额-制费三
       xckb122g LIKE xckb_t.xckb122g, #币种三成本金额-制费四
       xckb122h LIKE xckb_t.xckb122h, #币种三成本金额-制费五
       xckb038 LIKE xckb_t.xckb038  #成本域
END RECORD
#   #161124-00048#12 add(e)
#   
#   IF cl_null(p_xckb.xckb027 ) THEN LET p_xckb.xckb027  = 0 END IF #币种一金额
#   IF cl_null(p_xckb.xckb029 ) THEN LET p_xckb.xckb029  = 0 END IF #币种二金额
#   IF cl_null(p_xckb.xckb031 ) THEN LET p_xckb.xckb031  = 0 END IF #币种三金额
#   
#   #币种一成本单价，金额
#   IF cl_null(p_xckb.xckb101 ) THEN LET p_xckb.xckb101  = 0 END IF
#   IF cl_null(p_xckb.xckb101a) THEN LET p_xckb.xckb101a = 0 END IF
#   IF cl_null(p_xckb.xckb101b) THEN LET p_xckb.xckb101b = 0 END IF
#   IF cl_null(p_xckb.xckb101c) THEN LET p_xckb.xckb101c = 0 END IF
#   IF cl_null(p_xckb.xckb101d) THEN LET p_xckb.xckb101d = 0 END IF
#   IF cl_null(p_xckb.xckb101e) THEN LET p_xckb.xckb101e = 0 END IF
#   IF cl_null(p_xckb.xckb101f) THEN LET p_xckb.xckb101f = 0 END IF
#   IF cl_null(p_xckb.xckb101g) THEN LET p_xckb.xckb101g = 0 END IF
#   IF cl_null(p_xckb.xckb101h) THEN LET p_xckb.xckb101h = 0 END IF
#   IF cl_null(p_xckb.xckb102 ) THEN LET p_xckb.xckb102  = 0 END IF
#   IF cl_null(p_xckb.xckb102a) THEN LET p_xckb.xckb102a = 0 END IF
#   IF cl_null(p_xckb.xckb102b) THEN LET p_xckb.xckb102b = 0 END IF
#   IF cl_null(p_xckb.xckb102c) THEN LET p_xckb.xckb102c = 0 END IF
#   IF cl_null(p_xckb.xckb102d) THEN LET p_xckb.xckb102d = 0 END IF
#   IF cl_null(p_xckb.xckb102e) THEN LET p_xckb.xckb102e = 0 END IF
#   IF cl_null(p_xckb.xckb102f) THEN LET p_xckb.xckb102f = 0 END IF
#   IF cl_null(p_xckb.xckb102g) THEN LET p_xckb.xckb102g = 0 END IF
#   IF cl_null(p_xckb.xckb102h) THEN LET p_xckb.xckb102h = 0 END IF
#   
#   #币种二成本单价，金额
#   IF cl_null(p_xckb.xckb111 ) THEN LET p_xckb.xckb111  = 0 END IF
#   IF cl_null(p_xckb.xckb111a) THEN LET p_xckb.xckb111a = 0 END IF
#   IF cl_null(p_xckb.xckb111b) THEN LET p_xckb.xckb111b = 0 END IF
#   IF cl_null(p_xckb.xckb111c) THEN LET p_xckb.xckb111c = 0 END IF
#   IF cl_null(p_xckb.xckb111d) THEN LET p_xckb.xckb111d = 0 END IF
#   IF cl_null(p_xckb.xckb111e) THEN LET p_xckb.xckb111e = 0 END IF
#   IF cl_null(p_xckb.xckb111f) THEN LET p_xckb.xckb111f = 0 END IF
#   IF cl_null(p_xckb.xckb111g) THEN LET p_xckb.xckb111g = 0 END IF
#   IF cl_null(p_xckb.xckb111h) THEN LET p_xckb.xckb111h = 0 END IF
#   IF cl_null(p_xckb.xckb112 ) THEN LET p_xckb.xckb112  = 0 END IF
#   IF cl_null(p_xckb.xckb112a) THEN LET p_xckb.xckb112a = 0 END IF
#   IF cl_null(p_xckb.xckb112b) THEN LET p_xckb.xckb112b = 0 END IF
#   IF cl_null(p_xckb.xckb112c) THEN LET p_xckb.xckb112c = 0 END IF
#   IF cl_null(p_xckb.xckb112d) THEN LET p_xckb.xckb112d = 0 END IF
#   IF cl_null(p_xckb.xckb112e) THEN LET p_xckb.xckb112e = 0 END IF
#   IF cl_null(p_xckb.xckb112f) THEN LET p_xckb.xckb112f = 0 END IF
#   IF cl_null(p_xckb.xckb112g) THEN LET p_xckb.xckb112g = 0 END IF
#   IF cl_null(p_xckb.xckb112h) THEN LET p_xckb.xckb112h = 0 END IF
#
#   #币种三成本单价，金额
#   IF cl_null(p_xckb.xckb121 ) THEN LET p_xckb.xckb121  = 0 END IF
#   IF cl_null(p_xckb.xckb121a) THEN LET p_xckb.xckb121a = 0 END IF
#   IF cl_null(p_xckb.xckb121b) THEN LET p_xckb.xckb121b = 0 END IF
#   IF cl_null(p_xckb.xckb121c) THEN LET p_xckb.xckb121c = 0 END IF
#   IF cl_null(p_xckb.xckb121d) THEN LET p_xckb.xckb121d = 0 END IF
#   IF cl_null(p_xckb.xckb121e) THEN LET p_xckb.xckb121e = 0 END IF
#   IF cl_null(p_xckb.xckb121f) THEN LET p_xckb.xckb121f = 0 END IF
#   IF cl_null(p_xckb.xckb121g) THEN LET p_xckb.xckb121g = 0 END IF
#   IF cl_null(p_xckb.xckb121h) THEN LET p_xckb.xckb121h = 0 END IF
#   IF cl_null(p_xckb.xckb122 ) THEN LET p_xckb.xckb122  = 0 END IF
#   IF cl_null(p_xckb.xckb122a) THEN LET p_xckb.xckb122a = 0 END IF
#   IF cl_null(p_xckb.xckb122b) THEN LET p_xckb.xckb122b = 0 END IF
#   IF cl_null(p_xckb.xckb122c) THEN LET p_xckb.xckb122c = 0 END IF
#   IF cl_null(p_xckb.xckb122d) THEN LET p_xckb.xckb122d = 0 END IF
#   IF cl_null(p_xckb.xckb122e) THEN LET p_xckb.xckb122e = 0 END IF
#   IF cl_null(p_xckb.xckb122f) THEN LET p_xckb.xckb122f = 0 END IF
#   IF cl_null(p_xckb.xckb122g) THEN LET p_xckb.xckb122g = 0 END IF
#   IF cl_null(p_xckb.xckb122h) THEN LET p_xckb.xckb122h = 0 END IF
#   
#   RETURN p_xckb.*
#170616-00124#1---mark---e   
END FUNCTION

################################################################################
# Date & Author..: 2017/01/22 By xianghui
# Modify.........: #170104-00054#1
################################################################################
PRIVATE FUNCTION axcp200_create_tmp()
   
   WHENEVER ERROR CONTINUE
   
   #单位转换的临时表

   DROP TABLE convert_tmp; #ODI-ORA#
   CREATE TEMP TABLE convert_tmp(
      imaa001   LIKE imaa_t.imaa001,
      from_unit LIKE inag_t.inag007,
      to_unit   LIKE inag_t.inag007,
      #190925-00042#1 -S add
      from_qty  LIKE oocc_t.oocc002,
      to_qty    LIKE oocc_t.oocc004,
      #190925-00042#1 -E add
      qty       LIKE inag_t.inag008, #170603-00014#1 add ,
      ooca002   LIKE ooca_t.ooca002, #170603-00014#1 add
      ooca004   LIKE ooca_t.ooca004  #170603-00014#1 add
      )

   #發出商品統計檔

   DROP TABLE xckb_tmp; #ODI-ORA#
   CREATE TEMP TABLE xckb_tmp(
       xckbent LIKE xckb_t.xckbent, #企业代码
       xckbcomp LIKE xckb_t.xckbcomp, #法人
       xckbld LIKE xckb_t.xckbld, #账别
       xckb001 LIKE xckb_t.xckb001, #来源
       xckb002 LIKE xckb_t.xckb002, #方向
       xckb003 LIKE xckb_t.xckb003, #发票号码
       xckb004 LIKE xckb_t.xckb004, #据点site
       xckb005 LIKE xckb_t.xckb005, #出货单号
       xckb006 LIKE xckb_t.xckb006, #出货项次
       xckb007 LIKE xckb_t.xckb007, #年度
       xckb008 LIKE xckb_t.xckb008, #期别
       xckb009 LIKE xckb_t.xckb009, #客户编号
       xckb010 LIKE xckb_t.xckb010, #人员编号
       xckb011 LIKE xckb_t.xckb011, #部门编号
       xckb012 LIKE xckb_t.xckb012, #产品编号
       xckb013 LIKE xckb_t.xckb013, #销售单位
       xckb014 LIKE xckb_t.xckb014, #数量
       xckb015 LIKE xckb_t.xckb015, #仓库编号
       xckb016 LIKE xckb_t.xckb016, #库位编号
       xckb017 LIKE xckb_t.xckb017, #批号
       xckb018 LIKE xckb_t.xckb018, #no use
       xckb019 LIKE xckb_t.xckb019, #发票代码
       xckb020 LIKE xckb_t.xckb020, #库存单位
       xckb021 LIKE xckb_t.xckb021, #库存数量
       xckb022 LIKE xckb_t.xckb022, #科目编号
       xckb023 LIKE xckb_t.xckb023, #多角贸易否
       xckb024 LIKE xckb_t.xckb024, #开票年度
       xckb025 LIKE xckb_t.xckb025, #开票期别
       xckb026 LIKE xckb_t.xckb026, #币种一
       xckb027 LIKE xckb_t.xckb027, #金额
       xckb028 LIKE xckb_t.xckb028, #币种二
       xckb029 LIKE xckb_t.xckb029, #金额
       xckb030 LIKE xckb_t.xckb030, #币种三
       xckb031 LIKE xckb_t.xckb031, #金额
       xckb032 LIKE xckb_t.xckb032, #no use
       xckb033 LIKE xckb_t.xckb033, #no use
       xckb034 LIKE xckb_t.xckb034, #no use
       xckb035 LIKE xckb_t.xckb035, #no use
       xckb036 LIKE xckb_t.xckb036, #项序
       xckb037 LIKE xckb_t.xckb037, #特性
       xckb101 LIKE xckb_t.xckb101, #币种一成本单价
       xckb101a LIKE xckb_t.xckb101a, #币种一成本单价-材料
       xckb101b LIKE xckb_t.xckb101b, #币种一成本单价-人工
       xckb101c LIKE xckb_t.xckb101c, #币种一成本单价-加工
       xckb101d LIKE xckb_t.xckb101d, #币种一成本单价-制费一
       xckb101e LIKE xckb_t.xckb101e, #币种一成本单价-制费二
       xckb101f LIKE xckb_t.xckb101f, #币种一成本单价-制费三
       xckb101g LIKE xckb_t.xckb101g, #币种一成本单价-制费四
       xckb101h LIKE xckb_t.xckb101h, #币种一成本单价-制费五
       xckb102 LIKE xckb_t.xckb102, #币种一成本金额
       xckb102a LIKE xckb_t.xckb102a, #币种一成本金额-材料
       xckb102b LIKE xckb_t.xckb102b, #币种一成本金额-人工
       xckb102c LIKE xckb_t.xckb102c, #币种一成本金额-加工
       xckb102d LIKE xckb_t.xckb102d, #币种一成本金额-制费一
       xckb102e LIKE xckb_t.xckb102e, #币种一成本金额-制费二
       xckb102f LIKE xckb_t.xckb102f, #币种一成本金额-制费三
       xckb102g LIKE xckb_t.xckb102g, #币种一成本金额-制费四
       xckb102h LIKE xckb_t.xckb102h, #币种一成本金额-制费五
       xckb111 LIKE xckb_t.xckb111, #币种二成本单价
       xckb111a LIKE xckb_t.xckb111a, #币种二成本单价-材料
       xckb111b LIKE xckb_t.xckb111b, #币种二成本单价-人工
       xckb111c LIKE xckb_t.xckb111c, #币种二成本单价-加工
       xckb111d LIKE xckb_t.xckb111d, #币种二成本单价-制费一
       xckb111e LIKE xckb_t.xckb111e, #币种二成本单价-制费二
       xckb111f LIKE xckb_t.xckb111f, #币种二成本单价-制费三
       xckb111g LIKE xckb_t.xckb111g, #币种二成本单价-制费四
       xckb111h LIKE xckb_t.xckb111h, #币种二成本单价-制费五
       xckb112 LIKE xckb_t.xckb112, #币种二成本金额
       xckb112a LIKE xckb_t.xckb112a, #币种二成本金额-材料
       xckb112b LIKE xckb_t.xckb112b, #币种二成本金额-人工
       xckb112c LIKE xckb_t.xckb112c, #币种二成本金额-加工
       xckb112d LIKE xckb_t.xckb112d, #币种二成本金额-制费一
       xckb112e LIKE xckb_t.xckb112e, #币种二成本金额-制费二
       xckb112f LIKE xckb_t.xckb112f, #币种二成本金额-制费三
       xckb112g LIKE xckb_t.xckb112g, #币种二成本金额-制费四
       xckb112h LIKE xckb_t.xckb112h, #币种二成本金额-制费五
       xckb121 LIKE xckb_t.xckb121, #币种三成本单价
       xckb121a LIKE xckb_t.xckb121a, #币种三成本单价-材料
       xckb121b LIKE xckb_t.xckb121b, #币种三成本单价-人工
       xckb121c LIKE xckb_t.xckb121c, #币种三成本单价-加工
       xckb121d LIKE xckb_t.xckb121d, #币种三成本单价-制费一
       xckb121e LIKE xckb_t.xckb121e, #币种三成本单价-制费二
       xckb121f LIKE xckb_t.xckb121f, #币种三成本单价-制费三
       xckb121g LIKE xckb_t.xckb121g, #币种三成本单价-制费四
       xckb121h LIKE xckb_t.xckb121h, #币种三成本单价-制费五
       xckb122 LIKE xckb_t.xckb122, #币种三成本金额
       xckb122a LIKE xckb_t.xckb122a, #币种三成本金额-材料
       xckb122b LIKE xckb_t.xckb122b, #币种三成本金额-人工
       xckb122c LIKE xckb_t.xckb122c, #币种三成本金额-加工
       xckb122d LIKE xckb_t.xckb122d, #币种三成本金额-制费一
       xckb122e LIKE xckb_t.xckb122e, #种三成本金额-制费二
       xckb122f LIKE xckb_t.xckb122f, #币种三成本金额-制费三
       xckb122g LIKE xckb_t.xckb122g, #币种三成本金额-制费四
       xckb122h LIKE xckb_t.xckb122h, #币种三成本金额-制费五
       xckb038  LIKE xckb_t.xckb038,  #成本域
       docdt    LIKE xmdk_t.xmdkdocdt,
       yy       LIKE xckb_t.xckb007,     #年度
       mm       LIKE xckb_t.xckb008,     #期别  
       xckb043  LIKE xckb_t.xckb043,
       xckb044  LIKE xckb_t.xckb044,
       xckb045  LIKE xckb_t.xckb045            
      )   #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045
      

   DROP TABLE xckb2_tmp; #ODI-ORA#
   CREATE TEMP TABLE xckb2_tmp(
       xckbent LIKE xckb_t.xckbent, #企业代码
       xckbcomp LIKE xckb_t.xckbcomp, #法人
       xckbld LIKE xckb_t.xckbld, #账别
       xckb001 LIKE xckb_t.xckb001, #来源
       xckb002 LIKE xckb_t.xckb002, #方向
       xckb003 LIKE xckb_t.xckb003, #发票号码
       xckb004 LIKE xckb_t.xckb004, #据点site
       xckb005 LIKE xckb_t.xckb005, #出货单号
       xckb006 LIKE xckb_t.xckb006, #出货项次
       xckb007 LIKE xckb_t.xckb007, #年度
       xckb008 LIKE xckb_t.xckb008, #期别
       xckb009 LIKE xckb_t.xckb009, #客户编号
       xckb010 LIKE xckb_t.xckb010, #人员编号
       xckb011 LIKE xckb_t.xckb011, #部门编号
       xckb012 LIKE xckb_t.xckb012, #产品编号
       xckb013 LIKE xckb_t.xckb013, #销售单位
       xckb014 LIKE xckb_t.xckb014, #数量
       xckb015 LIKE xckb_t.xckb015, #仓库编号
       xckb016 LIKE xckb_t.xckb016, #库位编号
       xckb017 LIKE xckb_t.xckb017, #批号
       xckb018 LIKE xckb_t.xckb018, #no use
       xckb019 LIKE xckb_t.xckb019, #发票代码
       xckb020 LIKE xckb_t.xckb020, #库存单位
       xckb021 LIKE xckb_t.xckb021, #库存数量
       xckb022 LIKE xckb_t.xckb022, #科目编号
       xckb023 LIKE xckb_t.xckb023, #多角贸易否
       xckb024 LIKE xckb_t.xckb024, #开票年度
       xckb025 LIKE xckb_t.xckb025, #开票期别
       xckb026 LIKE xckb_t.xckb026, #币种一
       xckb027 LIKE xckb_t.xckb027, #金额
       xckb028 LIKE xckb_t.xckb028, #币种二
       xckb029 LIKE xckb_t.xckb029, #金额
       xckb030 LIKE xckb_t.xckb030, #币种三
       xckb031 LIKE xckb_t.xckb031, #金额
       xckb032 LIKE xckb_t.xckb032, #no use
       xckb033 LIKE xckb_t.xckb033, #no use
       xckb034 LIKE xckb_t.xckb034, #no use
       xckb035 LIKE xckb_t.xckb035, #no use
       xckb036 LIKE xckb_t.xckb036, #项序
       xckb037 LIKE xckb_t.xckb037, #特性
       xckb101 LIKE xckb_t.xckb101, #币种一成本单价
       xckb101a LIKE xckb_t.xckb101a, #币种一成本单价-材料
       xckb101b LIKE xckb_t.xckb101b, #币种一成本单价-人工
       xckb101c LIKE xckb_t.xckb101c, #币种一成本单价-加工
       xckb101d LIKE xckb_t.xckb101d, #币种一成本单价-制费一
       xckb101e LIKE xckb_t.xckb101e, #币种一成本单价-制费二
       xckb101f LIKE xckb_t.xckb101f, #币种一成本单价-制费三
       xckb101g LIKE xckb_t.xckb101g, #币种一成本单价-制费四
       xckb101h LIKE xckb_t.xckb101h, #币种一成本单价-制费五
       xckb102 LIKE xckb_t.xckb102, #币种一成本金额
       xckb102a LIKE xckb_t.xckb102a, #币种一成本金额-材料
       xckb102b LIKE xckb_t.xckb102b, #币种一成本金额-人工
       xckb102c LIKE xckb_t.xckb102c, #币种一成本金额-加工
       xckb102d LIKE xckb_t.xckb102d, #币种一成本金额-制费一
       xckb102e LIKE xckb_t.xckb102e, #币种一成本金额-制费二
       xckb102f LIKE xckb_t.xckb102f, #币种一成本金额-制费三
       xckb102g LIKE xckb_t.xckb102g, #币种一成本金额-制费四
       xckb102h LIKE xckb_t.xckb102h, #币种一成本金额-制费五
       xckb111 LIKE xckb_t.xckb111, #币种二成本单价
       xckb111a LIKE xckb_t.xckb111a, #币种二成本单价-材料
       xckb111b LIKE xckb_t.xckb111b, #币种二成本单价-人工
       xckb111c LIKE xckb_t.xckb111c, #币种二成本单价-加工
       xckb111d LIKE xckb_t.xckb111d, #币种二成本单价-制费一
       xckb111e LIKE xckb_t.xckb111e, #币种二成本单价-制费二
       xckb111f LIKE xckb_t.xckb111f, #币种二成本单价-制费三
       xckb111g LIKE xckb_t.xckb111g, #币种二成本单价-制费四
       xckb111h LIKE xckb_t.xckb111h, #币种二成本单价-制费五
       xckb112 LIKE xckb_t.xckb112, #币种二成本金额
       xckb112a LIKE xckb_t.xckb112a, #币种二成本金额-材料
       xckb112b LIKE xckb_t.xckb112b, #币种二成本金额-人工
       xckb112c LIKE xckb_t.xckb112c, #币种二成本金额-加工
       xckb112d LIKE xckb_t.xckb112d, #币种二成本金额-制费一
       xckb112e LIKE xckb_t.xckb112e, #币种二成本金额-制费二
       xckb112f LIKE xckb_t.xckb112f, #币种二成本金额-制费三
       xckb112g LIKE xckb_t.xckb112g, #币种二成本金额-制费四
       xckb112h LIKE xckb_t.xckb112h, #币种二成本金额-制费五
       xckb121 LIKE xckb_t.xckb121, #币种三成本单价
       xckb121a LIKE xckb_t.xckb121a, #币种三成本单价-材料
       xckb121b LIKE xckb_t.xckb121b, #币种三成本单价-人工
       xckb121c LIKE xckb_t.xckb121c, #币种三成本单价-加工
       xckb121d LIKE xckb_t.xckb121d, #币种三成本单价-制费一
       xckb121e LIKE xckb_t.xckb121e, #币种三成本单价-制费二
       xckb121f LIKE xckb_t.xckb121f, #币种三成本单价-制费三
       xckb121g LIKE xckb_t.xckb121g, #币种三成本单价-制费四
       xckb121h LIKE xckb_t.xckb121h, #币种三成本单价-制费五
       xckb122 LIKE xckb_t.xckb122, #币种三成本金额
       xckb122a LIKE xckb_t.xckb122a, #币种三成本金额-材料
       xckb122b LIKE xckb_t.xckb122b, #币种三成本金额-人工
       xckb122c LIKE xckb_t.xckb122c, #币种三成本金额-加工
       xckb122d LIKE xckb_t.xckb122d, #币种三成本金额-制费一
       xckb122e LIKE xckb_t.xckb122e, #种三成本金额-制费二
       xckb122f LIKE xckb_t.xckb122f, #币种三成本金额-制费三
       xckb122g LIKE xckb_t.xckb122g, #币种三成本金额-制费四
       xckb122h LIKE xckb_t.xckb122h, #币种三成本金额-制费五
       xckb038  LIKE xckb_t.xckb038,  #成本域
       xckb043  LIKE xckb_t.xckb043,
       xckb044  LIKE xckb_t.xckb044,
       xckb045  LIKE xckb_t.xckb045  
      )  #201030-00027#6 add xckb043,xckb044   #201216-00027#1 add xckb045
      
   #170908-00044#1-s add

   DROP TABLE reached_tmp; #ODI-ORA#
   CREATE TEMP TABLE reached_tmp(
      xckbent            LIKE xckb_t.xckbent,
      xckbcomp           LIKE xckb_t.xckbcomp,
      xckbld             LIKE xckb_t.xckbld,
      xckb005            LIKE xckb_t.xckb005,
      xckb006            LIKE xckb_t.xckb006,
      xckb036            LIKE xckb_t.xckb036,
      xckb014            LIKE xckb_t.xckb014,
      xckb014_reached    LIKE xckb_t.xckb014,
      xckb021            LIKE xckb_t.xckb021,
      xckb021_reached    LIKE xckb_t.xckb021,
      xckb015            LIKE xckb_t.xckb015,
      xckb016            LIKE xckb_t.xckb016,
      xckb017            LIKE xckb_t.xckb017
      )
   
   ## 單據上的單位轉換，每次出貨單位跟計價單位可能不同
   ## 再加上多倉儲出貨時，上面只有出貨單位沒有計價單位
   ## 所以從出貨單抓完出貨單位後，要再重新推算計價單位

   DROP TABLE convert_by_so_tmp; #ODI-ORA#
   CREATE TEMP TABLE convert_by_so_tmp(
      xckb005   LIKE xckb_t.xckb005,
      xckb006   LIKE xckb_t.xckb006,
      imaa001   LIKE imaa_t.imaa001,
      from_unit LIKE inag_t.inag007,
      to_unit   LIKE inag_t.inag007,
      #190925-00042#1 -S add
      from_qty  LIKE oocc_t.oocc002,
      to_qty    LIKE oocc_t.oocc004,
      #190925-00042#1 -E add
      qty       LIKE inag_t.inag008,
      ooca002   LIKE ooca_t.ooca002,
      ooca004   LIKE ooca_t.ooca004,
      xmdl018   LIKE xmdl_t.xmdl018,  #191113-00006#1
      xmdl022   LIKE xmdl_t.xmdl022   #191113-00006#1
      )   
   #170908-00044#1-e add
   
   #201026-00005#1---add---s
   DROP TABLE reup_xckb_tmp; 
   DROP TABLE reup_xckb_tmp; #ODI-ORA#
   CREATE TEMP TABLE reup_xckb_tmp(
      docno      LIKE xmdl_t.xmdldocno,   #单据编号
      seq        LIKE xmdl_t.xmdlseq,     #项次
      xmdl021    LIKE xmdl_t.xmdl021,     #计价单位
      xmdl022    LIKE xmdl_t.xmdl022,     #计价数量
      isag005    LIKE isag_t.isag005,     #发票单位
      isag004    LIKE isag_t.isag004,     #发票数量
      xckb021    LIKE xckb_t.xckb021
      )   
   #201026-00005#1---add---e   
END FUNCTION

################################################################################
# Date & Author..: 2017/01/22 By xianghui
# Modify.........: #170104-00054#1
################################################################################
PRIVATE FUNCTION axcp200_ins_xckb_new()
DEFINE l_success    LIKE type_t.num5
DEFINE l_qty        LIKE inag_t.inag008 
DEFINE l_imaa001    LIKE imaa_t.imaa001
DEFINE l_from_unit  LIKE inag_t.inag007 
DEFINE l_to_unit    LIKE inag_t.inag007
DEFINE l_ext1       LIKE ooan_t.ooan005
DEFINE l_ext2       LIKE ooan_t.ooan005
DEFINE l_finarg     LIKE type_t.chr1    
DEFINE r_success    LIKE type_t.num5
DEFINE l_count      LIKE type_t.num10
DEFINE l_xcat005    LIKE xcat_t.xcat005
DEFINE l_glav001    LIKE glav_t.glav001
DEFINE l_ld         LIKE glaa_t.glaald
DEFINE l_ooca002    LIKE ooca_t.ooca002 #170603-00014#1 add
DEFINE l_ooca004    LIKE ooca_t.ooca004 #170603-00014#1 add

   LET r_success = TRUE

  #LET l_finarg  = cl_get_para(g_enterprise,g_site,'S-FINC9020') #根据参数 S-FINC9020  出货当月全部转发出商品   #190312-00007#1 mark
   LET l_finarg  = cl_get_para(g_enterprise,g_comp,'S-FINC9020') #根据参数 S-FINC9020  出货当月全部转发出商品   #190312-00007#1 add

   LET g_wc_axm = g_master.wc
   LET g_wc_axm = cl_replace_str(g_wc_axm,"pmaa001","xmdk008") #客戶
   LET g_wc_axm = cl_replace_str(g_wc_axm,"imaa001","xmdl008") #產品編號
   
   SELECT xcat005 INTO l_xcat005
     FROM xcat_t
    WHERE xcatent = g_enterprise
      AND xcat001 = g_xcat001 
      
   CALL s_fin_get_major_ld(g_comp) RETURNING l_ld
   SELECT glaa003 INTO l_glav001 FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = l_ld
      
   LET l_count = 0
   
#201030-00027#6-S mark   
   #LET g_sql = "SELECT COUNT(1) ",
   #            "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
   #            "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
   #            "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
   #            "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
   #            "    AND xmdkent = ",g_enterprise,
   #            "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #            "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
   #            "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3'  AND xmdk002 <> '8' AND xmdk002 <> '4') ",   #170426-00037#1 add xmdk002<>'3'  #170504-00033#1 add xmdk082 <> '8' #171020-00046#1 add xmdk002 <> '4'
   #            "         OR (xmdk000 = '7' AND xmdkstus = 'Y')",                                                  #170504-00033#1 add
   #           #"         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3') ", #171030-00036#1 mark
   #            "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ",     #171030-00036#1 add
   #            "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' )) ",                             
   #            "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
   #            "    AND xmdm009 <> 0 ", #190910-00006#1 add
   #            #170704-00012#1 mod-S add xmdl014 IS NULL
#  #             "    AND (xmdl014 = ' ' OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ", #170214-00060#1 add )
   #            #"    AND (xmdl014 = ' ' OR xmdl014 IS NULL OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ",   #181113-00041#1 mark
   #            #"    AND EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdment AND inaasite  = xmdmsite  AND inaa001 = xmdm005 AND inaa010 = 'Y') ",   #181113-00041#1  #181206-00043#1 mark
   #            #181206-00043#1---add---s
   #            "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
   #            "                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
   #            #181206-00043#1---add---e
   #            #170704-00012#1 mod-E
   #            "    AND ",g_wc_axm CLIPPED
#201030-00027#6-E mark 

#201216-00027#1-S mark
##201030-00027#6-S add 
#   LET g_sql = "SELECT COUNT(1) ",
#               "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
#               "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
#               "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
#               "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
#               "    AND xmdkent = ",g_enterprise,
#               "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#               "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
#               "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3'  AND xmdk002 <> '8' AND xmdk002 <> '4') ",   
#               "         OR (xmdk000 = '7' AND xmdkstus = 'Y')"                                                  
#              # "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ",     
#              # "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' ) "
#   IF g_para = 'Y' THEN
#      #1.xmdk000 IN ('1','2','3')且xmdk002 = '3'，方向(xckb002) = 1 
#      LET g_sql = g_sql,
#                  "         OR (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 = '3') ",
#                  "         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3') "   #出項也放在這裡計算
#   ELSE
#      LET g_sql = g_sql,
#                  "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ", 
#                  "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' ) "                  
#   END IF 
#   LET g_sql = g_sql,")",               
#               "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#               "    AND xmdm009 <> 0 ", 
#               "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
#               "                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
#               "    AND ",g_wc_axm CLIPPED
##201030-00027#6-E add 
#201216-00027#1-E mark

#201216-00027#1-S add
   LET g_sql = "SELECT COUNT(1) ",
               "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
               "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
               "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
               "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
               "    AND xmdkent = ",g_enterprise,
               "    AND imaa004 <> 'E' ", #210318-00012#1 料件不得为费用性料号
               "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
               "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
               "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3'  AND xmdk002 <> '8' AND xmdk002 <> '4' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ",   
               "         OR (xmdk000 = '7' AND xmdkstus = 'Y' AND (xmdk071 = 'N' OR xmdk071 IS NULL))"                                                  

      #1.xmdk000 IN ('1','2','3')且xmdk002 = '3'，方向(xckb002) = 1 
      LET g_sql = g_sql,
                  "         OR (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 = '3' AND xmdk071 = 'Y' ) ",
                  "         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3' AND xmdk071 = 'Y' ) "   #出項也放在這裡計算

      LET g_sql = g_sql,
                  "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ", 
                  "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) "                  

   LET g_sql = g_sql,")",               
               "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
               "    AND xmdm009 <> 0 ", 
               "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
               #"                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ", #201231-00007#1 mark
               "                  AND (A.inaa010 = (CASE WHEN xmdk000 = '4' THEN 'N' ELSE 'Y' END) OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ", #201231-00007#1
               "    AND ",g_wc_axm CLIPPED
#201216-00027#1-E add 

   PREPARE xckb_count_pre FROM g_sql
   EXECUTE xckb_count_pre INTO l_count
   IF l_count = 0 THEN
      RETURN r_success
   END IF
   
   #DELETE FROM convert_tmp;    #181030-00060#1 Mark By 06137  181107
   TRUNCATE TABLE convert_tmp;  #181030-00060#1 Add By 06137  181107  #因DELETE convert_tmp無任何條件，所以改寫TRUNCATE TABLE，優化刪除效能
#201030-00027#6-S mark    
#   LET g_sql = " INSERT INTO convert_tmp ",
#               #" SELECT DISTINCT xmdl008,xmdl017,imaa006,1 ",      #170603-00014#1 mark
#              #" SELECT DISTINCT xmdl008,xmdl017,imaa006,1,'','' ", #170603-00014#1 add     #181030-00060#1 Mark By 06137  181107
#               #" SELECT DISTINCT xmdl008,(CASE WHEN xmdl008='MISC' AND xmdl017 IS NULL THEN 'PCS' ELSE xmdl017 END) xmdl017,imaa006,1,'','' ",    #181030-00060#1 Add By 06137  181107  #190925-00042#1 mark
#               " SELECT DISTINCT xmdl008,(CASE WHEN xmdl008='MISC' AND xmdl017 IS NULL THEN 'PCS' ELSE xmdl017 END) xmdl017,imaa006,0,0,1,0,NULL ",    #181030-00060#1 Add By 06137  181107     #PGS(D)-10130 add  #200824-00034#1 add 0,0              
#               "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
#               "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
#               "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
#               "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
#               "    AND xmdkent = ",g_enterprise,
#               "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
#               "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
#               "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3' AND xmdk002 <> '8' AND xmdk002 <> '4') ", #170426-00037#1 add xmdk002<>'3' #170504-00033#1 add xmdk002 <> '8' #171020-00046#1 add xmdk002 <> '4'
#               "         OR (xmdk000 = '7' AND xmdkstus = 'Y')",                                               #170426-00037#1
#              #"         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3') ", #171030-00036#1 mark
#               "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ",     #171030-00036#1 add
#               "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' )) ",                             
#               "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#               "    AND xmdm009 <> 0 ", #190910-00006#1 add
#               #170704-00012#1 mod-S add xmdl014 IS NULL
##               "    AND (xmdl014 = ' ' OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ", #170220-00038#1 add )
#               #"    AND (xmdl014 = ' ' OR xmdl014 IS NULL OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ",  #181113-00041#1 mark
#               #"    AND EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdment AND inaasite  = xmdmsite  AND inaa001 = xmdm005 AND inaa010 = 'Y') ",   #181113-00041#1  #181206-00043#1 mark
#               #181206-00043#1---add---s
#               "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
#               "                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
#               #181206-00043#1---add---e
#               #170704-00012#1 mod-E
#               "    AND ",g_wc_axm CLIPPED   
#201030-00027#6-E mark   

#201030-00027#6-S add  
   LET g_sql = " INSERT INTO convert_tmp ",
               " SELECT DISTINCT xmdl008,(CASE WHEN xmdl008='MISC' AND xmdl017 IS NULL THEN 'PCS' ELSE xmdl017 END) xmdl017,imaa006,0,0,1,0,NULL ",    
               "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
               "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
               "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
               "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
               "    AND xmdkent = ",g_enterprise,
               "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
               "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
               "    AND imaa004 <> 'E' ", #210318-00012#1 不得为费用类料件
#201216-00027#1-S mark               
             # "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3' AND xmdk002 <> '8' AND xmdk002 <> '4') ", 
             # "         OR (xmdk000 = '7' AND xmdkstus = 'Y')"        
#201216-00027#1-E mark

#201216-00027#1-S add               
              "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3' AND xmdk002 <> '8' AND xmdk002 <> '4' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ", 
              "         OR (xmdk000 = '7' AND xmdkstus = 'Y' AND (xmdk071 = 'N' OR xmdk071 IS NULL) )"        
#201216-00027#1-E add

               #"         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') "
               #"         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' ) "     

#201216-00027#1-S mark
   #IF g_para = 'Y' THEN
   #   #1.xmdk000 IN ('1','2','3')且xmdk002 = '3'，方向(xckb002) = 1 
   #   LET g_sql = g_sql,
   #               "         OR (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 = '3') ",
   #               "         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3') "   #出項也放在這裡計算                  
   #ELSE
   #   LET g_sql = g_sql,
   #               "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ", 
   #               "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' ) "                  
   #END IF 
#201216-00027#1-E mark

#201216-00027#1-S add
      LET g_sql = g_sql,
                  "         OR (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 = '3' AND xmdk071 = 'Y' ) ",
                  "         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3' AND xmdk071 = 'Y') "   #出項也放在這裡計算                  
      LET g_sql = g_sql,
                  "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ", 
                  "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) "                  
#201216-00027#1-E add

   LET g_sql = g_sql,")",                           
               "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
               "    AND xmdm009 <> 0 ", 
               "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
               #"                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ", #201231-00007#1 mark
               "                  AND (A.inaa010 = (CASE WHEN xmdk000 = '4' THEN 'N' ELSE 'Y' END) OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ", #201231-00007#1
               "    AND ",g_wc_axm CLIPPED 
#201030-00027#6-E add 

   PREPARE xckb_pre1 FROM g_sql
   EXECUTE xckb_pre1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF     
   
   #181030-00060#1 Add By 06137  181107(S)   將更新語法整合到INSERT INTO語法中
   #UPDATE convert_tmp
   #   SET from_unit = 'PCS'
   # WHERE imaa001 = 'MISC'
   #   AND from_unit IS NULL
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.extend = "UPDATE convert_tmp"
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF 
   #181030-00060#1 Add By 06137  181107(E)
   
   LET g_sql = " SELECT DISTINCT imaa001,from_unit,to_unit ",
               "   FROM convert_tmp "
   PREPARE xckb_pre2 FROM g_sql
   DECLARE xckb_cur2 CURSOR FOR xckb_pre2
   FOREACH xckb_cur2 INTO l_imaa001,l_from_unit,l_to_unit
      #CALL s_aooi250_convert_qty(l_imaa001,l_from_unit,l_to_unit,1) #170603-00014#1 mark
      CALL s_aooi250_convert_qty1(l_imaa001,l_from_unit,l_to_unit,1) #170603-00014#1 add
         RETURNING l_success,l_qty
      IF l_success THEN
         #170603-00014#1 add start -----
         SELECT ooca002,ooca004 INTO l_ooca002,l_ooca004
           FROM ooca_t
          WHERE oocaent = g_enterprise
            AND ooca001 = l_to_unit
         #170603-00014#1 add end   -----      
　       UPDATE convert_tmp
            SET qty = l_qty
              ,ooca002 = l_ooca002, ooca004 = l_ooca004 #170603-00014#1 add            
          WHERE imaa001 = l_imaa001
            AND from_unit = l_from_unit
            AND to_unit = l_to_unit
      END IF
   END FOREACH
   
   #200710-00047#1 add(s)
   #更新来源单位数量,目的单位数量
   LET g_sql = " MERGE INTO convert_tmp",
               " USING oocc_t",
               "    ON (from_unit = oocc001 AND to_unit = oocc003 AND ooccent = ",g_enterprise,")",
               "  WHEN MATCHED THEN",
               "     UPDATE SET from_qty = oocc002,",
               "                to_qty = oocc004"

#200824-00034#1-S add
#200824-00034#1-E add 

   PREPARE update_tmp_pre3 FROM g_sql
   EXECUTE update_tmp_pre3
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE update_tmp_pre3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   LET g_sql = " MERGE INTO convert_tmp",
               " USING imad_t",
               "    ON (imaa001 = imad001 AND from_unit = imad002 AND to_unit = imad004 AND imadent = ",g_enterprise,")",
               "  WHEN MATCHED THEN",
               "     UPDATE SET from_qty = imad003,",
               "                to_qty = imad005"

#200824-00034#1-S add
#200824-00034#1-E add 

   PREPARE update_tmp_pre4 FROM g_sql
   EXECUTE update_tmp_pre4
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE update_tmp_pre3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   #200710-00047#1 add(e)    

   #200804-00059#1 add(s)
   #更新来源与单位一致的情况
   UPDATE convert_tmp SET from_qty = 1,
                            to_qty = 1
                    WHERE from_unit = to_unit
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = ""
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   #200804-00059#1 add(e)

   LET g_sql = " INSERT INTO xckb_tmp(xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
               "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
               "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
               "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
               "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
               "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
               "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
               "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
               "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
               "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
               "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
               "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
               "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
               "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
               "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
               "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
               "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
               "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038,xckb043,xckb044,xckb045 ) ",  #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045
             # " SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"',(CASE WHEN xmdk000='1' OR xmdk000='2' OR xmdk000='3' OR xmdk000='7'  THEN '1' WHEN xmdk000='4' OR xmdk000='5' THEN '2' WHEN xmdk000='6' THEN '3' END) xckb001,'1',",  ##170504-00033#1 add xmdk000='7'  #201030-00027#6 add DISTINCT 
               " SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"',(CASE WHEN xmdk000='1' OR xmdk000='2' OR xmdk000='3' OR xmdk000='7'  THEN '1' WHEN xmdk000='4' THEN '2' WHEN xmdk000='5' THEN '5' WHEN xmdk000='6' THEN '3' END) xckb001,'1',",  #201030-00027#7 簽退單類型(xckb001)給'5'
               "        'UNINVOICE',xmdksite,xmdkdocno,xmdlseq,",g_master.yy,",",
#               "        ",g_master.pp,",xmdk008,xmdk003,xmdk004,xmdl008,",  #200415-00064#6 mark
               "        ",g_master.pp,",xmdk007,xmdk003,xmdk004,xmdl008,",  #200415-00064#6 add
               "        xmdm008,xmdm009,xmdm005,xmdm006,xmdm007,", 
               "        '',xmdk041,imaa006,0,'',",
               #"        DECODE(xmdk044,NULL,'N','Y'),'','','",g_glaa001,"',xmdl028,"   #190410-00009#1 mark
               #"        DECODE(xmdk044,NULL,'N','Y'),'','','",g_glaa001,"',xmdl027,"    #190410-00009#1  #PGS(D)-10130 mark
               "        case when xmdk044 = NULL THEN 'N' ELSE 'Y' END,NULL,NULL,'",g_glaa001,"',xmdl027,"    #190410-00009#1   #PGS(D)-10130 add
   IF g_glaa015 = 'Y' THEN                        
      LET g_sql = g_sql,"'",g_glaa016,"',0,"         
   ELSE
      #LET g_sql = g_sql,"'',0,"     #200824-00034#1 mark
      LET g_sql = g_sql,"NULL,0,"    #200824-00034#1 add
   END IF
   IF g_glaa019 = 'Y' THEN                        
      #LET g_sql = g_sql,"'",g_glaa020,"',0,'',"   #200824-00034#1 mark
      LET g_sql = g_sql,"'",g_glaa020,"',0,CAST(NULL AS decimal),"  #200824-00034#1 add
   ELSE
      #LET g_sql = g_sql,"'',0,'',"      #200824-00034#1 mark
      LET g_sql = g_sql,"NULL,0,CAST(NULL AS decimal),"   #200824-00034#1 add
   END IF
   LET g_sql = g_sql,
             #"'','','',xmdmseq1,xmdl009,",          #170214-00060#1 mark
             # "'','','',xmdmseq1,NVL(xmdl009,' '),", #170214-00060#1 add  #200824-00034#1 mark
              "CAST(NULL AS decimal),CAST(NULL AS decimal),NULL,xmdmseq1,NVL(xmdl009,' '),",  #200824-00034#1 add
              "0,0,0,0,0,0,0,0,0,", 
              "0,0,0,0,0,0,0,0,0,", 
              "0,0,0,0,0,0,0,0,0,", 
              "0,0,0,0,0,0,0,0,0,", 
              "0,0,0,0,0,0,0,0,0,", 
              "0,0,0,0,0,0,0,0,0,"
   #IF g_sys_6001 = '3' THEN   #191129-00030#1 mark
   IF g_sys_6002 = '3' THEN   #191129-00030#1
      LET g_sql = g_sql,"xmdl052" #170214-00060#1 remove ,
   ELSE
      LET g_sql = g_sql,"' '" #170214-00060#1 remove ,
   END IF
  #LET g_sql = g_sql,"'','','',", #170214-00060#1 mark

#201030-00027#6-S mark  
   #LET g_sql = g_sql, #170214-00060#1 add
   #            "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
   #            "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
   #            "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
   #            "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
   #            "    AND xmdkent = ",g_enterprise,
   #            "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
   #            "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
   #            "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3' AND xmdk002 <> '8' AND xmdk002 <> '4') ", #170426-00037#1 add xmdk002<>'3'  #170504-00033#1 add xmdk082 <> '8' #171020-00046#1 add xmdk002 <> '4'
   #            "         OR (xmdk000 = '7' AND xmdkstus = 'Y')",                                               #170504-00033#1 add 
   #           #"         OR (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3') ", #171030-00036#1 mark
   #            "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ",     #171030-00036#1 add             
   #            "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' )) ",                             
   #            "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
   #            "    AND xmdm009 <> 0 ", #190910-00006#1 add
   #            #170704-00012#1 mod-S add xmdl014 IS NULL
   #             "    AND (xmdl014 = ' ' OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ", #170214-00060#1 add )
   #            #"    AND (xmdl014 = ' ' OR xmdl014 IS NULL OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ",   #181113-00041#1 mark
   #            #"    AND EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdment AND inaasite  = xmdmsite  AND inaa001 = xmdm005 AND inaa010 = 'Y') ",   #181113-00041#1 #181206-00043#1 mark
   #            #181206-00043#1---add---s
   #            "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
   #            "                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
   #            #181206-00043#1---add---e
   #            #170704-00012#1 mod-E
   #            "    AND ",g_wc_axm CLIPPED 
#201030-00027#6-E mark  

#201030-00027#6-S add                  
   LET g_sql = g_sql, 
               #",xmdl001,xmdl002,xmdk071 ",    #201216-00027#1 add xmdk071  #210107-00030#1 mark
#               ",'','',xmdk071 ",    #201216-00027#1 add xmdk071  #210107-00030#1   #210318-00012#1 mark
               ",'',NULL,xmdk071 ",    #210318-00012#1 mod xckb044为NUM
               "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
               "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
               "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
               "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
               "    AND xmdkent = ",g_enterprise,
               "    AND imaa004 <> 'E' ", #210318-00012#1 不得为费用类料件
               "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
               "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
#201216-00027#1-S mark               
              #"    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3' AND xmdk002 <> '8' AND xmdk002 <> '4') ", 
              #"         OR (xmdk000 = '7' AND xmdkstus = 'Y')"          
#201216-00027#1-E mark    

#201216-00027#1-S add               
               "    AND ((xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002<>'3' AND xmdk002 <> '8' AND xmdk002 <> '4' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ", 
               "         OR (xmdk000 = '7' AND xmdkstus = 'Y' AND (xmdk071 = 'N' OR xmdk071 IS NULL) )"          
#201216-00027#1-E add  

              # "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ",                        
              # "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' ) "

#201216-00027#1-S mark 
   #IF g_para = 'Y' THEN
   #   #1.xmdk000 IN ('1','2','3')且xmdk002 = '3'，方向(xckb002) = 1 
   #   LET g_sql = g_sql,
   #               "         OR (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 = '3') "
   #ELSE
   #   LET g_sql = g_sql,
   #               "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3') ", 
   #               "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' ) "                  
   #END IF 
#201216-00027#1-E mark 

#201216-00027#1-S add
      LET g_sql = g_sql,
                  "         OR (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 = '3' AND xmdk071 = 'Y' ) "                   
      LET g_sql = g_sql,                  
                  "         OR (xmdk000 IN ('4') AND xmdkstus = 'Y' AND xmdk002 = '3' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ", 
                  "         OR (xmdk000 = '6' AND xmdk082 != '4' AND xmdkstus = 'S' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) "                  
#201216-00027#1-S add

   LET g_sql = g_sql,")",  
                  "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
                  "    AND xmdm009 <> 0 ", 
                  #"    AND (NVL(xmdl014,' ') = ' ' OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ",  #201231-00007#1 mark
                  "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
                  "                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
                  "    AND ",g_wc_axm CLIPPED  

#201030-00027#6-E add   

   PREPARE xckb_pre3 FROM g_sql
   EXECUTE xckb_pre3
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF


#201030-00027#6-S add 
#注意仓库是否是成本仓
#axmt580非成本仓，axmt590成本仓
#1.xmdk000 IN ('4') AND xmdk002 = '3'，方向(xckb002) = -1  
#2.xmdk000 IN ('5') AND xmdk002 = '3'，方向(xckb002) = -1
  #IF g_para = 'Y' THEN  #201216-00027#1 mark 
      LET g_sql = " INSERT INTO xckb_tmp(xckbent,xckbcomp,xckbld,xckb001,xckb002,",
                  "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
                  "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
                  "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
                  "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
                  "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
                  "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
                  "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
                  "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
                  "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
                  "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
                  "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
                  "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
                  "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
                  "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
                  "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
                  "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
                  "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
                  "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038,xckb043,xckb044,xckb045 ) ",   #201216-00027#1 add xckb045
                 #" SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"',(CASE WHEN xmdk000='1' OR xmdk000='2' OR xmdk000='3' OR xmdk000='7'  THEN '1' WHEN xmdk000='4' OR xmdk000='5' THEN '2' WHEN xmdk000='6' THEN '3' END) xckb001,'-1',",  #201030-00027#7 mark
                  " SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"',(CASE WHEN xmdk000='1' OR xmdk000='2' OR xmdk000='3' OR xmdk000='7'  THEN '1' WHEN xmdk000='4' THEN '2' WHEN xmdk000='5' THEN '5' WHEN xmdk000='6' THEN '3' END) xckb001,'-1',",  #201030-00027#7 add
                  "        'UNINVOICE',xmdksite,xmdkdocno,xmdlseq,",g_master.yy,",",
                  "        ",g_master.pp,",xmdk007,xmdk003,xmdk004,xmdl008,",  
                  "        xmdm008,(CASE WHEN xmdk000 = '5' THEN xmdm031 ELSE xmdm009 END) xmdm009 ,xmdm005,xmdm006,xmdm007,", 
                  "        '',xmdk041,imaa006,0,'',",
                  "        case when xmdk044 = NULL THEN 'N' ELSE 'Y' END,NULL,NULL,'",g_glaa001,"',xmdl027,"    
      IF g_glaa015 = 'Y' THEN                        
         LET g_sql = g_sql,"'",g_glaa016,"',0,"         
      ELSE
         LET g_sql = g_sql,"NULL,0,"    
      END IF
      IF g_glaa019 = 'Y' THEN                        
         LET g_sql = g_sql,"'",g_glaa020,"',0,CAST(NULL AS decimal),"  
      ELSE
         LET g_sql = g_sql,"NULL,0,CAST(NULL AS decimal),"   
      END IF
      LET g_sql = g_sql,
                 "CAST(NULL AS decimal),CAST(NULL AS decimal),NULL,xmdmseq1,NVL(xmdl009,' '),",  
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,"
      
      IF g_sys_6002 = '3' THEN   
         LET g_sql = g_sql,"xmdl052" 
      ELSE
         LET g_sql = g_sql,"' '" 
      END IF

      LET g_sql = g_sql, 
                  ",xmdl001,xmdl002,xmdk071 ",   #201216-00027#1 add xmdk071
                  "   FROM xmdk_t,xmdl_t,imaa_t,xmdm_t  ",
                  "  WHERE xmdkent = xmdlent AND xmdkdocno = xmdldocno ",
                  "    AND imaaent = xmdlent AND imaa001   = xmdl008 ",
                  "    AND xmdment = xmdkent AND xmdmdocno = xmdkdocno AND xmdmseq = xmdlseq",
                  "    AND xmdkent = ",g_enterprise,
                  "    AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = '",g_enterprise,"'",
                  "    AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
                # "    AND ((xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3')) ",    #201216-00027#1 mark
                  "    AND ((xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3' AND xmdk071 = 'Y')) ",    #201216-00027#1 add 
                  "    AND xmdk001 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
                  "    AND xmdm009 <> 0 ", 
                  "    AND imaa004 <> 'E' ", #210318-00012#1 add
#                  "    AND (xmdl014 = ' ' OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'N')) ", 
#                  "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
#                  "                  AND (A.inaa010 = 'N' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='N'))) ",
                  "    AND (NVL(xmdl014,' ') = ' ' OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 =(CASE WHEN xmdk000 = '4' THEN 'N' WHEN xmdk000 = '5' THEN 'Y' ELSE 'N' END))) ", 
                  "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
                  "                  AND (A.inaa010 = (CASE WHEN xmdk000 = '4' THEN 'N' WHEN xmdk000 = '5' THEN 'Y' ELSE 'N' END) OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010=(CASE WHEN xmdk000 = '4' THEN 'N' WHEN xmdk000 = '5' THEN 'Y' ELSE 'N' END)))) ",
                  "    AND ",g_wc_axm CLIPPED  
                  #(CASE WHEN xmdk000 = '4' THEN 'N' WHEN xmdk000 = '5' THEN 'Y' ELSE 'N' END)   
      PREPARE xckb_pre13 FROM g_sql
      EXECUTE xckb_pre13
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb_pre13"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF  

   #END IF   #201216-00027#1 mark  
#201030-00027#6-E add 

   #200724-00059#1---add---s
   #更新VMI存货仓为结算仓         
   UPDATE xckb_tmp SET xckb015 = (SELECT inaa018 FROM inaa_t WHERE inaaent = g_enterprise AND inaasite = xckb004 AND inaa001 = xckb015 )
    WHERE EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = g_enterprise AND inaasite = xckb004 AND inaa001 = xckb015 AND inaa018 IS NOT NULL)
   #200724-00059#1---add---e
   
   
   #170322-00109#1 add--s
   #按料件特性计算成本否
   IF g_sys_6013 = 'N' THEN
      UPDATE xckb_tmp SET xckb037 = ' '
   END IF
   #170322-00109#1 add--e
   
   #更新库存数量栏位         
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb_tmp a",
               #" USING (SELECT imaa001,from_unit,to_unit,qty FROM convert_tmp ) b", #170603-00014#1 mark
#               " USING (SELECT imaa001,from_unit,to_unit,qty,ooca002,ooca004 FROM convert_tmp ) b", #170603-00014#1 add   #200710-00047#1 mark
               " USING (SELECT imaa001,from_unit,to_unit,qty,ooca002,ooca004,from_qty,to_qty FROM convert_tmp ) b",   #200710-00047#1 add
               "    ON (a.xckb012 = b.imaa001 AND a.xckb013 = b.from_unit AND a.xckb020 = b.to_unit) ",
               "  WHEN MATCHED THEN ",
               #"        UPDATE SET a.xckb021 = a.xckb014*b.qty " #170603-00014#1 mark
               #200710-00047#1 mark(s)
               ##170603-00014#1 add start -----
               #"        UPDATE SET a.xckb021 = (CASE WHEN b.ooca004 = '1' THEN ROUND(a.xckb014*b.qty,b.ooca002) ",
               #"                                     WHEN b.ooca004 = '2' THEN (CASE WHEN MOD(ROUND(a.xckb014*b.qty,b.ooca002),(2/POWER(10,b.ooca002))) = 0 THEN (ROUND(a.xckb014*b.qty,b.ooca002)) ", 
               #"                                          ELSE ROUND(a.xckb014*b.qty,b.ooca002)-(power(10,b.ooca002) ) END  )", 
               #"                                     WHEN b.ooca004 = '3' THEN TRUNC(a.xckb014*b.qty,b.ooca002) ",
               ##"                                     WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*b.qty)/POWER(10,b.ooca002) ", #190115-00038#1 mark
               #"                                     WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*b.qty*POWER(10,b.ooca002))/POWER(10,b.ooca002) ", #190115-00038#1 add
               #"                                END) "
               ##170603-00014#1 add end   -----    
               #200710-00047#1 mark(e)     
               #200710-00047#1 add(s)
              #200824-00034#1-S mark 
               #"        UPDATE SET a.xckb021 = (CASE WHEN b.ooca004 = '1' THEN ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002) ",
               #"                                     WHEN b.ooca004 = '2' THEN (CASE WHEN MOD(ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002),(2/POWER(10,b.ooca002))) = 0 THEN (ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002)) ", 
               #"                                          ELSE ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002)-(power(10,b.ooca002) ) END  )", 
               #"                                     WHEN b.ooca004 = '3' THEN TRUNC(a.xckb014*(b.to_qty/b.from_qty),b.ooca002) ",
               #"                                     WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*(b.to_qty/b.from_qty)*POWER(10,b.ooca002))/POWER(10,b.ooca002) ", 
               #"                                END) "
              #200824-00034#1-E mark 
              
              #200824-00034#1-S add               
               "        UPDATE SET a.xckb021 = (CASE WHEN b.ooca004 = '1' THEN DECODE(b.from_qty,0,0,ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002)) ",
               "                                     WHEN b.ooca004 = '2' THEN (CASE WHEN MOD(DECODE(b.from_qty,0,0,ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002)),(2/POWER(10,b.ooca002))) = 0 THEN (DECODE(b.from_qty,0,0,ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002))) ", 
               "                                          ELSE DECODE(b.from_qty,0,0,ROUND(a.xckb014*(b.to_qty/b.from_qty),b.ooca002))-(power(10,b.ooca002) ) END  )",       
               "                                     WHEN b.ooca004 = '3' THEN TRUNC(DECODE(b.from_qty,0,0,a.xckb014*(b.to_qty/b.from_qty)),b.ooca002) ",
               "                                     WHEN b.ooca004 = '4' THEN CEIL(DECODE(b.from_qty,0,0,a.xckb014*(b.to_qty/b.from_qty)*POWER(10,b.ooca002)))/POWER(10,b.ooca002) ",                
               "                                END) "   
              #200824-00034#1-E add                
               #200710-00047#1 add(e)             
   #PGS(D)-00824 --- end ---
   PREPARE xckb_pre4 FROM g_sql
   EXECUTE xckb_pre4     
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre4"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #销退单   
   UPDATE xckb_tmp 
      SET xckb014 = xckb014 *-1,
          xckb021 = xckb021 *-1
    WHERE xckb001 = '3' 

   #科目
   #170815-00010#1 mark-S 重写
#   LET g_sql =     " MERGE INTO xckb_tmp ",
#                   " USING (SELECT glcc002,glcc016 FROM glcc_t",   
#                   "         WHERE glccent = ",g_enterprise," AND glcc001 = '1' ",
#                   "           AND glccld  = '",g_master.glaald,"' ",
#                   "           AND glcc016 = '*' ", #170815-00010#1 add
#                   "           AND (glcc014='",g_comp,"' OR glcc014='*' ) AND ROWNUM = 1 ORDER BY glcc016 ) tsed",
#                   "    ON ((glcc016 = xckb012 OR glcc016 = '*') ) ",   
#                   "    WHEN MATCHED THEN  ",
#                   "    UPDATE SET xckb022 = glcc002" 
   #170815-00010#1 mark-E
   #170815-00010#1 add-S g_sql 整个重写，在子查询中直接匹配到最佳glcc006,后更新至暂存档
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb_tmp A ", #用暂存档更新暂存档，故加了别名
               " USING ( ",
               "        SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb036,xckb003,xckb005,xckb006,",
               "               xckb007,xckb008,xckb009,xckb012,xckb015,xckb004,xckb022,imag011,imaf111,",
               "               NVL(NVL(NVL(NVL(NVL(NVL(A,B),C),D),E),F),G) glcc006 ",  #匹配到最佳glcc006(符合agli161设定条件最多的)
               "          FROM (",    #子查询，根据料号等信息匹配到各个glcc006    
               "          SELECT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb036,xckb003,xckb005,xckb006,xckb007,xckb008,xckb009,xckb012,xckb015,xckb004,xckb022,imag011,imaf111,",
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc016 = xckb012 AND glcc015 = xckb015 AND glcc014 = xckb004) A,", #料号、据点、仓库别都匹配（未匹配成本分群、销售分群是因为料号已匹配，料号匹配了对应的分群应当一致）
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc016 = xckb012 AND glcc015 = xckb015 AND glcc014 = '*') B,",     #料号、仓库别匹配，且agli161设定的据点为*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc016 = xckb012 AND glcc015 = '*' AND glcc014 = '*') C,",         #料号匹配，agli161设定的据点、仓库都是*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = imaf111 AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = imag011) D,",  #成本分群、销售分群匹配，料号、据点、仓库为*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = imaf111 AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = '*' AND rownum=1) E,",  #销售分群匹配，料号、据点、仓库、成本分群为* （rownum=1当资料正确的时候，可以不写，防止设定重复）
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = '*' AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = imag011 AND rownum=1) F,",  #成本分群匹配，料号、据点、仓库、销售分群为*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = '*' AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = '*' AND rownum=1) G",       #全匹配--实在找不到了，就用全*的带入
               "           FROM xckb_tmp,imag_t,imaf_t ",
               #180305-00034#1 mark start -----
               #"          WHERE xckb004 = '",g_comp,"' ", 
               #"            AND xckbld = '",g_master.glaald,"' ",
               ##180305-00034#1 mark end   -----
               "          WHERE xckbld = '",g_master.glaald,"' ",                              
               "            AND xckb012 = imag001 ",
               "            AND xckb012 = imaf001 ",
               #180305-00034#1 mark start -----
               #"            AND xckb004 = imagsite ",
               #"            AND xckb004 = imafsite ",
               #180305-00034#1 mark end   -----       
               #180305-00034#1 add start -----

               "            AND imagsite = xckbcomp ",
               "            AND imafsite = xckbcomp ",
               "            AND xckbcomp = '",g_comp,"' ",
               #180305-00034#1 add end    -----
               "            AND xckbent = ",g_enterprise,
               "            AND imagent = xckbent ",
               "            AND imafent = xckbent ",
               "               )",
               "       ) B",
               "    ON (B.xckbent = A.xckbent AND B.xckbcomp = A.xckbcomp AND B.xckbld = A.xckbld ", #匹配暂存档的key值，保证一一对应
               "    AND B.xckb001 = A.xckb001 AND B.xckb002 = A.xckb002 AND B.xckb003 = A.xckb003 ",
               "    AND B.xckb005 = A.xckb005 AND B.xckb006 = A.xckb006 AND B.xckb007 = A.xckb007 ",
               "    AND B.xckb008 = A.xckb008 AND B.xckb009 = A.xckb009 AND B.xckb036= A.xckb036) ",
               "  WHEN MATCHED THEN ",
               "       UPDATE SET A.xckb022 = B.glcc006 "
   #PGS(D)-00824 --- end ---
   #170815-00010#1 add-E
   PREPARE xckb_pre12 FROM g_sql
   EXECUTE xckb_pre12 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre12"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   
   UPDATE xckb_tmp SET xckb022 = ' ' WHERE xckb022 IS NULL  #170808-00050#1 add
   
   #更新成本域    
   IF g_sys_6001 = 'N' THEN
      UPDATE xckb_tmp 
         SET xckb038 = ' ' 
   ELSE
      CASE g_sys_6002
           WHEN '1'  #组织
              UPDATE xckb_tmp 
                 SET xckb038 = (SELECT xcbf001 FROM xcbf_t
                                 WHERE xcbfent  = g_enterprise
                                   AND xcbfcomp = g_comp
                                   AND xcbf002  = xckb004)                    
           WHEN '2'  #仓库
              UPDATE xckb_tmp 
                 SET xckb038 = (SELECT xcbf001 FROM xcbf_t
                                 WHERE xcbfent  = g_enterprise
                                   AND xcbfcomp = g_comp
                                   AND xcbf002  = xckb015)            
      END CASE
   END IF  
   #181126-00029#1 add-S
   UPDATE xckb_tmp 
      SET xckb038 = ' ' 
    WHERE xckb038 IS NULL
   #181126-00029#1 add-E
   ## --> 170220-00038#1
   ##調整順序，先不論是出貨單還是銷退單，拿過帳日期先更新docdt
   ##銷退單有出貨來源的，再用原出貨單的過帳日期更新docdt
   ##這樣做才能避免銷退無出貨來源的資料，能抓的到過帳年月的單位成本

   UPDATE xckb_tmp 
      SET docdt = (SELECT xmdk001 FROM xmdk_t 
                    WHERE xmdkent = g_enterprise 
                      AND xmdkdocno = xckb005) 
                      
   UPDATE xckb_tmp 
     #170214-00060#1 ---add (s)---
      SET docdt = (SELECT a.xmdk001 FROM xmdk_t a,xmdk_t b,xmdl_t
                    WHERE b.xmdkent = g_enterprise AND b.xmdk000 = '6'
                      AND xmdldocno = xckb005 AND xmdlseq = xckb006
                      AND b.xmdkent = xmdlent AND b.xmdkdocno = xmdldocno
                      AND xmdl001 = a.xmdkdocno)
      WHERE xckb001 = '3'
      #170220-00038#1 add start -----
        AND EXISTS (SELECT * FROM xmdl_t
                     WHERE xmdlent = g_enterprise AND xmdldocno = xckb005
                       AND NVL(xmdl001,' ') <> ' ')     
      #170220-00038#1 add end   -----                       
     #170214-00060#1 ---add (e)---
     #170214-00060#1 ---mark (s)---
     #SET docdt = (SELECT xmdkdocdt FROM xmdl_t,xmdk_t 
     #              WHERE xmdlent = xmdkent 
     #                AND xmdl001 = xmdkdocno 
     #                AND xmdlent = g_enterprise 
     #                AND xmdldocno = xckb005 
     #                AND xmdlseq = xckb006) 
     #WHERE xmdk000 = '6'   
     #170214-00060#1 ---mark (e)---
#170220-00038#1 mark start -----
#   UPDATE xckb_tmp 
#      SET docdt = (SELECT xmdkdocdt FROM xmdk_t 
#                    WHERE xmdkent = g_enterprise 
#                     #AND xmdkdocno = xckb005)                      #170214-00060#1 mark
#                      AND xmdkdocno = xckb005 and xmdk000 <> '6' )  #170214-00060#1 add
#   #WHERE xmdk000 <> '6'  #170214-00060#1 mark
#    WHERE xckb001 <> '3' #170214-00060#1 add
#170220-00038#1 mark end   -----    
    
   UPDATE xckb_tmp 
      SET yy = (SELECT DISTINCT glav002 FROM glav_t 
                 WHERE glavent = g_enterprise 
                   #AND glav004 = xmdkdocdt  #170220-00038#1 mark
                   AND glav001 = l_glav001 
                   AND glav004 = docdt),
          mm = (SELECT DISTINCT glav006 FROM glav_t 
                 WHERE glavent = g_enterprise 
                   #AND glav004 = xmdkdocdt  #170220-00038#1 mark
                   AND glav001 = l_glav001 
                   AND glav004 = docdt)           

  ##170214-00060#1 ---add (s)---
   UPDATE xckb_tmp 
      #SET yy = g_master.yy, mm = g_master.pp  #PGS(D)-10130 mark
      SET yy = to_number(g_master.yy),mm = to_number(g_master.pp)  #PGS(D)-10130 add
      WHERE xckb001 = '3' AND docdt IS NULL

   IF l_xcat005 = '3' THEN
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb_tmp a",
                  " USING (SELECT xccald,xcca001,xcca002,xcca004,xcca005,xcca006,xcca007,xcca008, ",
                  "                xcca110, xcca110a,xcca110b,  ",
                  "                xcca110c,xcca110d,xcca110e, ",
                  "                xcca110f,xcca110g,xcca110h  ",
                  "          FROM xcca_t ",
                  "         WHERE xccaent = ",g_enterprise,
                  "           AND xcca001 = '1'",                  #帐套本位币顺序
                  "           AND xcca003 = '",g_xcat001,"'",      #成本计算类型
                  "    ) b ",
                  "    ON (b.xccald  = a.xckbld AND b.xcca002 = a.xckb038 AND b.xcca004 = a.yy ",
                  #"   AND b.xcca005 = a.mm AND b.xcca006 = a.xckb012 AND b.xcca007 = a.xckb037) ",   #170426-00037#1  mark
                  "   AND b.xcca005 = a.mm AND b.xcca006 = a.xckb012 AND b.xcca007 = a.xckb037 AND b.xcca008 = a.xckb017) ",   #170426-00037#1
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xcca110, ",
                  "                   a.xckb101a = b.xcca110a, ",
                  "                   a.xckb101b = b.xcca110b, ",
                  "                   a.xckb101c = b.xcca110c, ",
                  "                   a.xckb101d = b.xcca110d, ",
                  "                   a.xckb101e = b.xcca110e, ",
                  "                   a.xckb101f = b.xcca110f, ",
                  "                   a.xckb101g = b.xcca110g, ",
                  "                   a.xckb101h = b.xcca110h "
      #PGS(D)-00824 --- end ---
   ELSE
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb_tmp a",
                  " USING (SELECT xccald,xcca001,xcca002,xcca004,xcca005,xcca006,xcca007, ",          
                  "                xcca110, xcca110a,xcca110b,  ",
                  "                xcca110c,xcca110d,xcca110e, ",
                  "                xcca110f,xcca110g,xcca110h  ",
                  "          FROM xcca_t ",
                  "         WHERE xccaent = ",g_enterprise,
                  "           AND xcca001 = '1'",                  #帐套本位币顺序
                  "           AND xcca003 = '",g_xcat001,"'",      #成本计算类型
                  "           AND xcca008 = ' ' ",                 #170908-00044#1 add  非批次成本，抓批號為空的成本單價                
                  "    ) b ",
                  "    ON (b.xccald  = a.xckbld AND b.xcca002 = a.xckb038 AND b.xcca004 = a.yy ",
                  "   AND b.xcca005 = a.mm AND b.xcca006 = a.xckb012 AND b.xcca007 = a.xckb037) ",
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xcca110, ",
                  "                   a.xckb101a = b.xcca110a, ",
                  "                   a.xckb101b = b.xcca110b, ",
                  "                   a.xckb101c = b.xcca110c, ",
                  "                   a.xckb101d = b.xcca110d, ",
                  "                   a.xckb101e = b.xcca110e, ",
                  "                   a.xckb101f = b.xcca110f, ",
                  "                   a.xckb101g = b.xcca110g, ",
                  "                   a.xckb101h = b.xcca110h "
      #PGS(D)-00824 --- end ---
   END IF
   PREPARE xckb_pre6_1 FROM g_sql
   EXECUTE xckb_pre6_1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre6_1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
  #170214-00060#1 ---add (e)---

   IF l_xcat005 = '3' THEN
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb_tmp a",
                  " USING (SELECT xcccld,xccc001,xccc002,xccc004,xccc005,xccc006,xccc007,xccc008, ",
                  "                xccc280, xccc280a,xccc280b,  ",
                  "                xccc280c,xccc280d,xccc280e, ",
                  "                xccc280f,xccc280g,xccc280h  ",
                  "          FROM xccc_t ",
                  "         WHERE xcccent = ",g_enterprise,
                  "           AND xccc001 = '1'",                  #帐套本位币顺序
                  "           AND xccc003 = '",g_xcat001,"'",      #成本计算类型
                  "    ) b ",
                  "    ON (b.xcccld  = a.xckbld AND b.xccc002 = a.xckb038 AND b.xccc004 = a.yy ",
                  "    AND b.xccc008 = a.xckb017 ", #170323-00090#1 add   
                  "   AND b.xccc005 = a.mm AND b.xccc006 = a.xckb012 AND b.xccc007 = a.xckb037) ",
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xccc280, ",
                  "                   a.xckb101a = b.xccc280a, ",               
                  "                   a.xckb101b = b.xccc280b, ",               
                  "                   a.xckb101c = b.xccc280c, ",               
                  "                   a.xckb101d = b.xccc280d, ",               
                  "                   a.xckb101e = b.xccc280e, ",               
                  "                   a.xckb101f = b.xccc280f, ",               
                  "                   a.xckb101g = b.xccc280g, ",               
                  "                   a.xckb101h = b.xccc280h "
      #PGS(D)-00824 --- end ---
   ELSE
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb_tmp a",
                  #" USING (SELECT xcccld,xccc001,xccc002,xccc004,xccc005,xccc006,xccc007,xccc008, ",  #170405-00005#1 add 增加xccc008 #170426-00037#1 mark
                  " USING (SELECT xcccld,xccc001,xccc002,xccc004,xccc005,xccc006,xccc007 , ",  #170426-00037#1 add   
                  "                xccc280, xccc280a,xccc280b,  ",
                  "                xccc280c,xccc280d,xccc280e, ",
                  "                xccc280f,xccc280g,xccc280h  ",
                  "          FROM xccc_t ",
                  "         WHERE xcccent = ",g_enterprise,
                  "           AND xccc001 = '1'",                  #帐套本位币顺序
                  "           AND xccc003 = '",g_xcat001,"'",      #成本计算类型
                  "           AND xccc008 = ' ' ",                 #170908-00044#1 add  非批次成本，抓批號為空的成本單價                 
                  "    ) b ",
                  "    ON (b.xcccld  = a.xckbld AND b.xccc002 = a.xckb038 AND b.xccc004 = a.yy ",
                  #"    AND b.xccc008 = a.xckb017 ", #170323-00090#1 add     #170426-00037#1 mark              
                  "   AND b.xccc005 = a.mm AND b.xccc006 = a.xckb012 AND b.xccc007 = a.xckb037) ",
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xccc280, ",
                  "                   a.xckb101a = b.xccc280a, ",               
                  "                   a.xckb101b = b.xccc280b, ",               
                  "                   a.xckb101c = b.xccc280c, ",               
                  "                   a.xckb101d = b.xccc280d, ",               
                  "                   a.xckb101e = b.xccc280e, ",               
                  "                   a.xckb101f = b.xccc280f, ",               
                  "                   a.xckb101g = b.xccc280g, ",               
                  "                   a.xckb101h = b.xccc280h "
      #PGS(D)-00824 --- end ---
   END IF                  
   PREPARE xckb_pre6 FROM g_sql
   EXECUTE xckb_pre6
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre6"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #170608-00023#1---add---s
   #销退单的单价在计算成本的时候已经回根据参数的设定计算好,所以销退的单价直接抓取销退单本期进出成本档   
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb_tmp a",
               #" USING (SELECT xcckld,xcck001,xcck002,xcck004,xcck005,xcck006,xcck007,xcck008, ",  #170822-00008#1  mark by 09767 
               " USING (SELECT DISTINCT xcckld,xcck001,xcck002,xcck004,xcck005,xcck006,xcck007,xcck008, ",#170822-00008#1  modify by 09767 
               "                xcck282, xcck282a,xcck282b,  ",
               "                xcck282c,xcck282d,xcck282e, ",
               "                xcck282f,xcck282g,xcck282h  ",
               "          FROM xcck_t ",
               "         WHERE xcckent = ",g_enterprise,
               "           AND xcckld = '",g_master.glaald,"'",
               "           AND xcck001 = '1'",                  #帐套本位币顺序
               "           AND xcck003 = '",g_xcat001,"'",      #成本计算类型
               "    ) b ",
               "    ON (b.xcckld  = a.xckbld AND b.xcck002 = a.xckb038  ",
               "    AND b.xcck004 = a.xckb007 AND b.xcck005 = a.xckb008 ",
               "    AND b.xcck006 = a.xckb005 AND b.xcck007 = a.xckb006 AND b.xcck008 = a.xckb036) ",
               "  WHEN MATCHED THEN ",
               "        UPDATE SET a.xckb101  = b.xcck282, ",
               "                   a.xckb101a = b.xcck282a, ",               
               "                   a.xckb101b = b.xcck282b, ",               
               "                   a.xckb101c = b.xcck282c, ",               
               "                   a.xckb101d = b.xcck282d, ",               
               "                   a.xckb101e = b.xcck282e, ",               
               "                   a.xckb101f = b.xcck282f, ",               
               "                   a.xckb101g = b.xcck282g, ",               
               "                   a.xckb101h = b.xcck282h ",
               " WHERE xckb001 = '3' "
   #PGS(D)-00824 --- end ---
   PREPARE xckb_pre6_2 FROM g_sql
   EXECUTE xckb_pre6_2
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre6_2"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #170608-00023#1---add---e
   
   
#201030-00027#7-S add
   LET g_sql = " MERGE INTO xckb_tmp a",
             #  " USING (SELECT DISTINCT xckbld,xckb001,xckb002,xckb004,xckb005,xckb006,xckb007,xckb008, ",
               " USING (SELECT DISTINCT xckbld,xckb001,xckb002,xckb004,xckb005,xckb006, ",
               "                xckb101, xckb101a,xckb101b,  ",
               "                xckb101c,xckb101d,xckb101e, ",
               "                xckb101f,xckb101g,xckb101h  ",
             #  "          FROM xckb_tmp ",
               "          FROM xckb_t ",
               "         WHERE xckbent = ",g_enterprise,
               "           AND xckbld = '",g_master.glaald,"'",
               "           AND xckb002 = '1'",               #進項
             #  "           AND xckb007 = ",g_master.yy,      #年度
             #  "           AND xckb008 = ",g_master.pp,      #期别
             #  "           AND ROWNUM = 1 ",
               "    ) b ",
               "    ON (b.xckbld  = a.xckbld  ",
             #  "    AND b.xckb007 = a.xckb007 AND b.xckb008 = a.xckb008 ",
               "    AND b.xckb005 = a.xckb043 AND b.xckb006 = a.xckb044 ) ",
               "  WHEN MATCHED THEN ",
               "        UPDATE SET a.xckb101  = b.xckb101,  ",
               "                   a.xckb101a = b.xckb101a, ",               
               "                   a.xckb101b = b.xckb101b, ",               
               "                   a.xckb101c = b.xckb101c, ",               
               "                   a.xckb101d = b.xckb101d, ",               
               "                   a.xckb101e = b.xckb101e, ",               
               "                   a.xckb101f = b.xckb101f, ",               
               "                   a.xckb101g = b.xckb101g, ",               
               "                   a.xckb101h = b.xckb101h ",
               " WHERE a.xckb002 = '-1' AND a.xckb001 IN ('2','5')"


   
   PREPARE xckb_pre6_3 FROM g_sql
   EXECUTE xckb_pre6_3
   DISPLAY "LXH_SQLCA.sqlerrd[3]:",SQLCA.sqlerrd[3]
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre6_3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF     
#201030-00027#7-E add

   #UPDATE xckb2_tmp #170214-00060#1 mark
   UPDATE xckb_tmp  #170214-00060#1 add
      SET xckb102 =  xckb101  * xckb021,
          xckb102a = xckb101a * xckb021,
          xckb102b = xckb101b * xckb021,
          xckb102c = xckb101c * xckb021,
          xckb102d = xckb101d * xckb021,
          xckb102e = xckb101e * xckb021,
          xckb102f = xckb101f * xckb021,
          xckb102g = xckb101g * xckb021,
          xckb102h = xckb101h * xckb021 
          
   #币种一进行取位
   CASE g_round_type
      WHEN '1'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb102  = round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102a = round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102b = round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102c = round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102d = round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102e = round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102f = round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102g = round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102h = round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,") "          
      WHEN '2'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb102  = (CASE WHEN MOD(round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                     "        xckb102a  = (CASE WHEN MOD(round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                     "        xckb102b  = (CASE WHEN MOD(round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102c  = (CASE WHEN MOD(round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102d  = (CASE WHEN MOD(round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102e  = (CASE WHEN MOD(round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102f  = (CASE WHEN MOD(round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102g  = (CASE WHEN MOD(round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102h  = (CASE WHEN MOD(round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
      WHEN '3'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb102  = trunc(round(COALESCE(xckb102,0),6),",g_ooaj007_1,"),  ",
                     "        xckb102a = trunc(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,"), ",
                     "        xckb102b = trunc(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,"), ",
                     "        xckb102c = trunc(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,"), ",
                     "        xckb102d = trunc(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,"), ",
                     "        xckb102e = trunc(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,"), ",
                     "        xckb102f = trunc(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,"), ",
                     "        xckb102g = trunc(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,"), ",
                     "        xckb102h = trunc(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,") "
      WHEN '4'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb102  = ceil(round(COALESCE(xckb102,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102a = ceil(round(COALESCE(xckb102a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102b = ceil(round(COALESCE(xckb102b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102c = ceil(round(COALESCE(xckb102c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102d = ceil(round(COALESCE(xckb102d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102e = ceil(round(COALESCE(xckb102e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102f = ceil(round(COALESCE(xckb102f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102g = ceil(round(COALESCE(xckb102g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102h = ceil(round(COALESCE(xckb102h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
   END CASE
   PREPARE xckb_pre7 FROM g_sql
   EXECUTE xckb_pre7   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre7"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   

   #170606-00027#1---add---s
   #修正xckb102的值-先修至xckb102a,若xckb102a為零,則修正xckb102b......
   #180925-00065#1---mod---s
#   UPDATE xckb_tmp SET xckb102a = xckb102 - (xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)   
#    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #AND xckb102 - (xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h) <> 0    #170824-00029#1 mark
#      AND s_math_abs(xckb102a) >= s_math_abs(xckb102b) AND s_math_abs(xckb102a) >= s_math_abs(xckb102c)   #170824-00029#1 add abs
#      AND s_math_abs(xckb102a) >= s_math_abs(xckb102d) AND s_math_abs(xckb102a) >= s_math_abs(xckb102e)   #170824-00029#1 add abs
#      AND s_math_abs(xckb102a) >= s_math_abs(xckb102f) AND s_math_abs(xckb102a) >= s_math_abs(xckb102g)   #170824-00029#1 add abs
#      AND s_math_abs(xckb102a) >= s_math_abs(xckb102h)                                                    #170824-00029#1 add abs
#      
#   UPDATE xckb_tmp SET xckb102b = xckb102 - (xckb102a + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
#    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #AND xckb102 - (xckb102a + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
#      AND s_math_abs(xckb102b) >= s_math_abs(xckb102c)                                                   #170824-00029#1 add abs
#      AND s_math_abs(xckb102b) >= s_math_abs(xckb102d) AND s_math_abs(xckb102b) >= s_math_abs(xckb102e)  #170824-00029#1 add abs
#      AND s_math_abs(xckb102b) >= s_math_abs(xckb102f) AND s_math_abs(xckb102b) >= s_math_abs(xckb102g)  #170824-00029#1 add abs
#      AND s_math_abs(xckb102b) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs
# 
#   UPDATE xckb_tmp SET xckb102c = xckb102 - (xckb102a + xckb102b + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
#    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #AND xckb102 - (xckb102a + xckb102b + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
#      AND s_math_abs(xckb102c) >= s_math_abs(xckb102d) AND s_math_abs(xckb102c) >= s_math_abs(xckb102e)  #170824-00029#1 add abs
#      AND s_math_abs(xckb102c) >= s_math_abs(xckb102f) AND s_math_abs(xckb102c) >= s_math_abs(xckb102g)  #170824-00029#1 add abs
#      AND s_math_abs(xckb102c) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs      
#
#   UPDATE xckb_tmp SET xckb102d = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102e + xckb102f + xckb102g + xckb102h)  
#    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102e + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
#      AND s_math_abs(xckb102d) >= s_math_abs(xckb102e)                                                   #170824-00029#1 add abs
#      AND s_math_abs(xckb102d) >= s_math_abs(xckb102f) AND s_math_abs(xckb102d) >= s_math_abs(xckb102g)
#      AND s_math_abs(xckb102d) >= s_math_abs(xckb102h)                                                    #170824-00029#1 add abs        
# 
#   UPDATE xckb_tmp SET xckb102e = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102f + xckb102g + xckb102h)  
#    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
#      AND s_math_abs(xckb102e) >= s_math_abs(xckb102f) AND s_math_abs(xckb102e) >= s_math_abs(xckb102g)  #170824-00029#1 add abs
#      AND s_math_abs(xckb102e) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs         
# 
#   UPDATE xckb_tmp SET xckb102f = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102g + xckb102h)  
#    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
#      AND s_math_abs(xckb102f) >= s_math_abs(xckb102g)                                                   #170824-00029#1 add abs
#      AND s_math_abs(xckb102f) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs       
#
#   UPDATE xckb_tmp SET xckb102g = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102h)  
#    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102h) <> 0  #170824-00029#1 mark
#      AND s_math_abs(xckb102g) >= s_math_abs(xckb102h)                                                  #170824-00029#1 add abs        
   
   UPDATE xckb_tmp SET xckb102a = xckb102 - (xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)   
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102a) >= ABS(xckb102b) AND ABS(xckb102a) >= ABS(xckb102c)   
      AND ABS(xckb102a) >= ABS(xckb102d) AND ABS(xckb102a) >= ABS(xckb102e)   
      AND ABS(xckb102a) >= ABS(xckb102f) AND ABS(xckb102a) >= ABS(xckb102g)   
      AND ABS(xckb102a) >= ABS(xckb102h)                                                    
      
   UPDATE xckb_tmp SET xckb102b = xckb102 - (xckb102a + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102b) >= ABS(xckb102c)                                                   
      AND ABS(xckb102b) >= ABS(xckb102d) AND ABS(xckb102b) >= ABS(xckb102e)  
      AND ABS(xckb102b) >= ABS(xckb102f) AND ABS(xckb102b) >= ABS(xckb102g)  
      AND ABS(xckb102b) >= ABS(xckb102h)                                                   
 
   UPDATE xckb_tmp SET xckb102c = xckb102 - (xckb102a + xckb102b + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102c) >= ABS(xckb102d) AND ABS(xckb102c) >= ABS(xckb102e)  
      AND ABS(xckb102c) >= ABS(xckb102f) AND ABS(xckb102c) >= ABS(xckb102g)  
      AND ABS(xckb102c) >= ABS(xckb102h)                                                       

   UPDATE xckb_tmp SET xckb102d = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102e + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102d) >= ABS(xckb102e)                                                   
      AND ABS(xckb102d) >= ABS(xckb102f) AND ABS(xckb102d) >= ABS(xckb102g)
      AND ABS(xckb102d) >= ABS(xckb102h)                                                          
 
   UPDATE xckb_tmp SET xckb102e = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102e) >= ABS(xckb102f) AND ABS(xckb102e) >= ABS(xckb102g) 
      AND ABS(xckb102e) >= ABS(xckb102h)                                                       
 
   UPDATE xckb_tmp SET xckb102f = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102f) >= ABS(xckb102g)                                                   
      AND ABS(xckb102f) >= ABS(xckb102h)                                                          

   UPDATE xckb_tmp SET xckb102g = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102g) >= ABS(xckb102h)                                                    
   #180925-00065#1---mod---e
   UPDATE xckb_tmp SET xckb102h = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g) <> 0   #170824-00029#1 mark    
   #170606-00027#1---add---e
   
   IF g_glaa015 = 'Y' THEN  #啟用本位幣二
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa016,1,g_glaa018) RETURNING l_ext1            #金額
      UPDATE xckb_tmp
         SET xckb028 = g_glaa016,
             xckb029 = xckb027 * l_ext1,
             xckb111 =  xckb101 * l_ext1,
             xckb111a = xckb101a * l_ext1,
             xckb111b = xckb101b * l_ext1,
             xckb111c = xckb101c * l_ext1,
             xckb111d = xckb101d * l_ext1,
             xckb111e = xckb101e * l_ext1,
             xckb111f = xckb101f * l_ext1,
             xckb111g = xckb101g * l_ext1,
             xckb111h = xckb101h * l_ext1
      #币种二单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb111  = round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111a = round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111b = round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111c = round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111d = round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111e = round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111f = round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111g = round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111h = round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb111  = (CASE WHEN MOD(round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb111a  = (CASE WHEN MOD(round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb111b  = (CASE WHEN MOD(round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111c  = (CASE WHEN MOD(round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111d  = (CASE WHEN MOD(round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111e  = (CASE WHEN MOD(round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111f  = (CASE WHEN MOD(round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111g  = (CASE WHEN MOD(round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111h  = (CASE WHEN MOD(round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb111  = trunc(round(COALESCE(xckb111,0),6),",g_ooaj007_1,"),  ",
                        "        xckb111a = trunc(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,"), ",
                        "        xckb111b = trunc(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,"), ",
                        "        xckb111c = trunc(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,"), ",
                        "        xckb111d = trunc(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,"), ",
                        "        xckb111e = trunc(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,"), ",
                        "        xckb111f = trunc(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,"), ",
                        "        xckb111g = trunc(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,"), ",
                        "        xckb111h = trunc(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb111  = ceil(round(COALESCE(xckb111,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb111a = ceil(round(COALESCE(xckb111a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111b = ceil(round(COALESCE(xckb111b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111c = ceil(round(COALESCE(xckb111c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111d = ceil(round(COALESCE(xckb111d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111e = ceil(round(COALESCE(xckb111e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111f = ceil(round(COALESCE(xckb111f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111g = ceil(round(COALESCE(xckb111g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111h = ceil(round(COALESCE(xckb111h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE   
      PREPARE xckb_pre8 FROM g_sql
      EXECUTE xckb_pre8 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb_pre8"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF      
      UPDATE xckb_tmp
         SET xckb112 =  xckb111  * xckb021,
             xckb112a = xckb111a * xckb021,
             xckb112b = xckb111b * xckb021,
             xckb112c = xckb111c * xckb021,
             xckb112d = xckb111d * xckb021,
             xckb112e = xckb111e * xckb021,
             xckb112f = xckb111f * xckb021,
             xckb112g = xckb111g * xckb021,
             xckb112h = xckb111h * xckb021 
      #币种二金额进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb112  = round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112a = round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112b = round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112c = round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112d = round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112e = round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112f = round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112g = round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112h = round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb112  = (CASE WHEN MOD(round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb112a  = (CASE WHEN MOD(round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb112b  = (CASE WHEN MOD(round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112c  = (CASE WHEN MOD(round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112d  = (CASE WHEN MOD(round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112e  = (CASE WHEN MOD(round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112f  = (CASE WHEN MOD(round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112g  = (CASE WHEN MOD(round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112h  = (CASE WHEN MOD(round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb112  = trunc(round(COALESCE(xckb112,0),6),",g_ooaj007_1,"),  ",
                        "        xckb112a = trunc(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,"), ",
                        "        xckb112b = trunc(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,"), ",
                        "        xckb112c = trunc(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,"), ",
                        "        xckb112d = trunc(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,"), ",
                        "        xckb112e = trunc(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,"), ",
                        "        xckb112f = trunc(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,"), ",
                        "        xckb112g = trunc(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,"), ",
                        "        xckb112h = trunc(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb112  = ceil(round(COALESCE(xckb112,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb112a = ceil(round(COALESCE(xckb112a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112b = ceil(round(COALESCE(xckb112b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112c = ceil(round(COALESCE(xckb112c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112d = ceil(round(COALESCE(xckb112d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112e = ceil(round(COALESCE(xckb112e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112f = ceil(round(COALESCE(xckb112f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112g = ceil(round(COALESCE(xckb112g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112h = ceil(round(COALESCE(xckb112h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE  
      PREPARE xckb_pre9 FROM g_sql
      EXECUTE xckb_pre9 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb_pre9"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF    
      #170606-00027#1---add---s
      #修正xckb112的值-先修至xckb112a,若xckb112a為零,則修正xckb112b......
      #180925-00065#1---mod---s
#      UPDATE xckb_tmp SET xckb112a = xckb112 - (xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)   
#       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
#         #AND xckb112 - (xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h) <> 0    #170824-00029#1 mark
#         AND s_math_abs(xckb112a) >= s_math_abs(xckb112b) AND s_math_abs(xckb112a) >= s_math_abs(xckb112c)   #170824-00029#1 add abs
#         AND s_math_abs(xckb112a) >= s_math_abs(xckb112d) AND s_math_abs(xckb112a) >= s_math_abs(xckb112e)   #170824-00029#1 add abs
#         AND s_math_abs(xckb112a) >= s_math_abs(xckb112f) AND s_math_abs(xckb112a) >= s_math_abs(xckb112g)   #170824-00029#1 add abs
#         AND s_math_abs(xckb112a) >= s_math_abs(xckb112h)                                                    #170824-00029#1 add abs
#         
#      UPDATE xckb_tmp SET xckb112b = xckb112 - (xckb112a + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
#       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
#         #AND xckb112 - (xckb112a + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb112b) >= s_math_abs(xckb112c)                                                   #170824-00029#1 add abs
#         AND s_math_abs(xckb112b) >= s_math_abs(xckb112d) AND s_math_abs(xckb112b) >= s_math_abs(xckb112e)  #170824-00029#1 add abs
#         AND s_math_abs(xckb112b) >= s_math_abs(xckb112f) AND s_math_abs(xckb112b) >= s_math_abs(xckb112g)  #170824-00029#1 add abs
#         AND s_math_abs(xckb112b) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs
#    
#      UPDATE xckb_tmp SET xckb112c = xckb112 - (xckb112a + xckb112b + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
#       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
#         #AND xckb112 - (xckb112a + xckb112b + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb112c) >= s_math_abs(xckb112d) AND s_math_abs(xckb112c) >= s_math_abs(xckb112e)  #170824-00029#1 add abs
#         AND s_math_abs(xckb112c) >= s_math_abs(xckb112f) AND s_math_abs(xckb112c) >= s_math_abs(xckb112g)  #170824-00029#1 add abs
#         AND s_math_abs(xckb112c) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs      
#   
#      UPDATE xckb_tmp SET xckb112d = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112e + xckb112f + xckb112g + xckb112h)  
#       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
#         #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112e + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb112d) >= s_math_abs(xckb112e)                                                   #170824-00029#1 add abs
#         AND s_math_abs(xckb112d) >= s_math_abs(xckb112f) AND s_math_abs(xckb112d) >= s_math_abs(xckb112g)
#         AND s_math_abs(xckb112d) >= s_math_abs(xckb112h)                                                    #170824-00029#1 add abs        
#    
#      UPDATE xckb_tmp SET xckb112e = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112f + xckb112g + xckb112h)  
#       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
#         #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb112e) >= s_math_abs(xckb112f) AND s_math_abs(xckb112e) >= s_math_abs(xckb112g)  #170824-00029#1 add abs
#         AND s_math_abs(xckb112e) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs         
#    
#      UPDATE xckb_tmp SET xckb112f = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112g + xckb112h)  
#       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
#         #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb112f) >= s_math_abs(xckb112g)                                                   #170824-00029#1 add abs
#         AND s_math_abs(xckb112f) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs       
#   
#      UPDATE xckb_tmp SET xckb112g = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112h)  
#       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
#         #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112h) <> 0  #170824-00029#1 mark
#         AND s_math_abs(xckb112g) >= s_math_abs(xckb112h)                                                  #170824-00029#1 add abs        

      UPDATE xckb_tmp SET xckb112a = xckb112 - (xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)   
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112a) >= ABS(xckb112b) AND ABS(xckb112a) >= ABS(xckb112c)   
         AND ABS(xckb112a) >= ABS(xckb112d) AND ABS(xckb112a) >= ABS(xckb112e)   
         AND ABS(xckb112a) >= ABS(xckb112f) AND ABS(xckb112a) >= ABS(xckb112g)   
         AND ABS(xckb112a) >= ABS(xckb112h)                                                    
         
      UPDATE xckb_tmp SET xckb112b = xckb112 - (xckb112a + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112b) >= ABS(xckb112c)                                                   
         AND ABS(xckb112b) >= ABS(xckb112d) AND ABS(xckb112b) >= ABS(xckb112e)  
         AND ABS(xckb112b) >= ABS(xckb112f) AND ABS(xckb112b) >= ABS(xckb112g)  
         AND ABS(xckb112b) >= ABS(xckb112h)                                                   
    
      UPDATE xckb_tmp SET xckb112c = xckb112 - (xckb112a + xckb112b + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112c) >= ABS(xckb112d) AND ABS(xckb112c) >= ABS(xckb112e)  
         AND ABS(xckb112c) >= ABS(xckb112f) AND ABS(xckb112c) >= ABS(xckb112g)  
         AND ABS(xckb112c) >= ABS(xckb112h)                                                       
   
      UPDATE xckb_tmp SET xckb112d = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112e + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112d) >= ABS(xckb112e)                                                   
         AND ABS(xckb112d) >= ABS(xckb112f) AND ABS(xckb112d) >= ABS(xckb112g)
         AND ABS(xckb112d) >= ABS(xckb112h)                                                          
    
      UPDATE xckb_tmp SET xckb112e = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112e) >= ABS(xckb112f) AND ABS(xckb112e) >= ABS(xckb112g) 
         AND ABS(xckb112e) >= ABS(xckb112h)                                                       
    
      UPDATE xckb_tmp SET xckb112f = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112f) >= ABS(xckb112g)                                                   
         AND ABS(xckb112f) >= ABS(xckb112h)                                                          
   
      UPDATE xckb_tmp SET xckb112g = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112g) >= ABS(xckb112h)                                                    
   #180925-00065#1---mod---e
      UPDATE xckb_tmp SET xckb112h = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g) <> 0   #170824-00029#1 mark    
      #170606-00027#1---add---e	      
   END IF
   
   IF g_glaa019 = 'Y' THEN  #啟用本位幣三
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa020,1,g_glaa022) RETURNING l_ext2            #金額
      UPDATE xckb_tmp
         SET xckb030 = g_glaa020,
             xckb031 =  xckb027 * l_ext2,
             xckb121 =  xckb101 * l_ext2,
             xckb121a = xckb101a * l_ext2,
             xckb121b = xckb101b * l_ext2,
             xckb121c = xckb101c * l_ext2,
             xckb121d = xckb101d * l_ext2,
             xckb121e = xckb101e * l_ext2,
             xckb121f = xckb101f * l_ext2,
             xckb121g = xckb101g * l_ext2,
             xckb121h = xckb101h * l_ext2
      #币种三单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb121  = round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121a = round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121b = round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121c = round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121d = round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121e = round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121f = round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121g = round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121h = round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb121  = (CASE WHEN MOD(round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb121a  = (CASE WHEN MOD(round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb121b  = (CASE WHEN MOD(round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121c  = (CASE WHEN MOD(round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121d  = (CASE WHEN MOD(round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121e  = (CASE WHEN MOD(round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121f  = (CASE WHEN MOD(round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121g  = (CASE WHEN MOD(round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121h  = (CASE WHEN MOD(round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb121  = trunc(round(COALESCE(xckb121,0),6),",g_ooaj007_1,"),  ",
                        "        xckb121a = trunc(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,"), ",
                        "        xckb121b = trunc(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,"), ",
                        "        xckb121c = trunc(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,"), ",
                        "        xckb121d = trunc(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,"), ",
                        "        xckb121e = trunc(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,"), ",
                        "        xckb121f = trunc(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,"), ",
                        "        xckb121g = trunc(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,"), ",
                        "        xckb121h = trunc(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb121  = ceil(round(COALESCE(xckb121,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb121a = ceil(round(COALESCE(xckb121a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121b = ceil(round(COALESCE(xckb121b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121c = ceil(round(COALESCE(xckb121c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121d = ceil(round(COALESCE(xckb121d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121e = ceil(round(COALESCE(xckb121e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121f = ceil(round(COALESCE(xckb121f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121g = ceil(round(COALESCE(xckb121g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121h = ceil(round(COALESCE(xckb121h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE 
      PREPARE xckb_pre10 FROM g_sql
      EXECUTE xckb_pre10  
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb_pre10"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF      
      UPDATE xckb_tmp
         SET xckb122 =  xckb121  * xckb021,
             xckb122a = xckb121a * xckb021,
             xckb122b = xckb121b * xckb021,
             xckb122c = xckb121c * xckb021,
             xckb122d = xckb121d * xckb021,
             xckb122e = xckb121e * xckb021,
             xckb122f = xckb121f * xckb021,
             xckb122g = xckb121g * xckb021,
             xckb122h = xckb121h * xckb021 
      #币种三金额进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb122  = round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122a = round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122b = round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122c = round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122d = round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122e = round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122f = round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122g = round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122h = round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb122  = (CASE WHEN MOD(round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb122a  = (CASE WHEN MOD(round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb122b  = (CASE WHEN MOD(round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122c  = (CASE WHEN MOD(round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122d  = (CASE WHEN MOD(round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122e  = (CASE WHEN MOD(round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122f  = (CASE WHEN MOD(round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122g  = (CASE WHEN MOD(round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122h  = (CASE WHEN MOD(round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb122  = trunc(round(COALESCE(xckb122,0),6),",g_ooaj007_1,"),  ",
                        "        xckb122a = trunc(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,"), ",
                        "        xckb122b = trunc(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,"), ",
                        "        xckb122c = trunc(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,"), ",
                        "        xckb122d = trunc(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,"), ",
                        "        xckb122e = trunc(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,"), ",
                        "        xckb122f = trunc(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,"), ",
                        "        xckb122g = trunc(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,"), ",
                        "        xckb122h = trunc(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb122  = ceil(round(COALESCE(xckb122,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb122a = ceil(round(COALESCE(xckb122a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122b = ceil(round(COALESCE(xckb122b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122c = ceil(round(COALESCE(xckb122c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122d = ceil(round(COALESCE(xckb122d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122e = ceil(round(COALESCE(xckb122e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122f = ceil(round(COALESCE(xckb122f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122g = ceil(round(COALESCE(xckb122g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122h = ceil(round(COALESCE(xckb122h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE  
      PREPARE xckb_pre11 FROM g_sql
      EXECUTE xckb_pre11
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb_pre11"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF  
      #170606-00027#1---add---s
      #修正xckb122的值-先修至xckb122a,若xckb122a為零,則修正xckb122b......
      #180925-00065#1---mod---s
#      UPDATE xckb_tmp SET xckb122a = xckb122 - (xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)   
#       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
#         #AND xckb122 - (xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h) <> 0    #170824-00029#1 mark
#         AND s_math_abs(xckb122a) >= s_math_abs(xckb122b) AND s_math_abs(xckb122a) >= s_math_abs(xckb122c)   #170824-00029#1 add abs
#         AND s_math_abs(xckb122a) >= s_math_abs(xckb122d) AND s_math_abs(xckb122a) >= s_math_abs(xckb122e)   #170824-00029#1 add abs
#         AND s_math_abs(xckb122a) >= s_math_abs(xckb122f) AND s_math_abs(xckb122a) >= s_math_abs(xckb122g)   #170824-00029#1 add abs
#         AND s_math_abs(xckb122a) >= s_math_abs(xckb122h)                                                    #170824-00029#1 add abs
#         
#      UPDATE xckb_tmp SET xckb122b = xckb122 - (xckb122a + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
#       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
#         #AND xckb122 - (xckb122a + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb122b) >= s_math_abs(xckb122c)                                                   #170824-00029#1 add abs
#         AND s_math_abs(xckb122b) >= s_math_abs(xckb122d) AND s_math_abs(xckb122b) >= s_math_abs(xckb122e)  #170824-00029#1 add abs
#         AND s_math_abs(xckb122b) >= s_math_abs(xckb122f) AND s_math_abs(xckb122b) >= s_math_abs(xckb122g)  #170824-00029#1 add abs
#         AND s_math_abs(xckb122b) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs
#    
#      UPDATE xckb_tmp SET xckb122c = xckb122 - (xckb122a + xckb122b + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
#       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
#         #AND xckb122 - (xckb122a + xckb122b + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb122c) >= s_math_abs(xckb122d) AND s_math_abs(xckb122c) >= s_math_abs(xckb122e)  #170824-00029#1 add abs
#         AND s_math_abs(xckb122c) >= s_math_abs(xckb122f) AND s_math_abs(xckb122c) >= s_math_abs(xckb122g)  #170824-00029#1 add abs
#         AND s_math_abs(xckb122c) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs      
#    
#      UPDATE xckb_tmp SET xckb122d = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122e + xckb122f + xckb122g + xckb122h)  
#       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
#         #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122e + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb122d) >= s_math_abs(xckb122e)                                                   #170824-00029#1 add abs
#         AND s_math_abs(xckb122d) >= s_math_abs(xckb122f) AND s_math_abs(xckb122d) >= s_math_abs(xckb122g)
#         AND s_math_abs(xckb122d) >= s_math_abs(xckb122h)                                                    #170824-00029#1 add abs        
#    
#      UPDATE xckb_tmp SET xckb122e = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122f + xckb122g + xckb122h)  
#       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
#         #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb122e) >= s_math_abs(xckb122f) AND s_math_abs(xckb122e) >= s_math_abs(xckb122g)  #170824-00029#1 add abs
#         AND s_math_abs(xckb122e) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs         
#    
#      UPDATE xckb_tmp SET xckb122f = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122g + xckb122h)  
#       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
#         #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
#         AND s_math_abs(xckb122f) >= s_math_abs(xckb122g)                                                   #170824-00029#1 add abs
#         AND s_math_abs(xckb122f) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs       
#    
#      UPDATE xckb_tmp SET xckb122g = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122h)  
#       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
#         #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122h) <> 0  #170824-00029#1 mark
#         AND s_math_abs(xckb122g) >= s_math_abs(xckb122h)                                                  #170824-00029#1 add abs        
    
      UPDATE xckb_tmp SET xckb122a = xckb122 - (xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)   
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122a) >= ABS(xckb122b) AND ABS(xckb122a) >= ABS(xckb122c)   
         AND ABS(xckb122a) >= ABS(xckb122d) AND ABS(xckb122a) >= ABS(xckb122e)   
         AND ABS(xckb122a) >= ABS(xckb122f) AND ABS(xckb122a) >= ABS(xckb122g)   
         AND ABS(xckb122a) >= ABS(xckb122h)                                                    
         
      UPDATE xckb_tmp SET xckb122b = xckb122 - (xckb122a + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122b) >= ABS(xckb122c)                                                   
         AND ABS(xckb122b) >= ABS(xckb122d) AND ABS(xckb122b) >= ABS(xckb122e)  
         AND ABS(xckb122b) >= ABS(xckb122f) AND ABS(xckb122b) >= ABS(xckb122g)  
         AND ABS(xckb122b) >= ABS(xckb122h)                                                   
    
      UPDATE xckb_tmp SET xckb122c = xckb122 - (xckb122a + xckb122b + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122c) >= ABS(xckb122d) AND ABS(xckb122c) >= ABS(xckb122e)  
         AND ABS(xckb122c) >= ABS(xckb122f) AND ABS(xckb122c) >= ABS(xckb122g)  
         AND ABS(xckb122c) >= ABS(xckb122h)                                                       
   
      UPDATE xckb_tmp SET xckb122d = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122e + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122d) >= ABS(xckb122e)                                                   
         AND ABS(xckb122d) >= ABS(xckb122f) AND ABS(xckb122d) >= ABS(xckb122g)
         AND ABS(xckb122d) >= ABS(xckb122h)                                                          
    
      UPDATE xckb_tmp SET xckb122e = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122e) >= ABS(xckb122f) AND ABS(xckb122e) >= ABS(xckb122g) 
         AND ABS(xckb122e) >= ABS(xckb122h)                                                       
    
      UPDATE xckb_tmp SET xckb122f = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122f) >= ABS(xckb122g)                                                   
         AND ABS(xckb122f) >= ABS(xckb122h)                                                          
   
      UPDATE xckb_tmp SET xckb122g = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122g) >= ABS(xckb122h)     
      #180925-00065#1---mod---e
      UPDATE xckb_tmp SET xckb122h = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g) <> 0   #170824-00029#1 mark    
      #170606-00027#1---add---e	      
   END IF  
   RETURN r_success
END FUNCTION

################################################################################
# Date & Author..: 2017/01/22 By xianghui
# Modify.........: #170104-00054#1
################################################################################
PRIVATE FUNCTION axcp200_ins_xckb2_new()
DEFINE l_success            LIKE type_t.num5
DEFINE l_qty                LIKE inag_t.inag008 
DEFINE l_imaa001            LIKE imaa_t.imaa001
DEFINE l_from_unit          LIKE inag_t.inag007 
DEFINE l_to_unit            LIKE inag_t.inag007
DEFINE l_ext1               LIKE ooan_t.ooan005
DEFINE l_ext2               LIKE ooan_t.ooan005
DEFINE r_success            LIKE type_t.num5
DEFINE l_count              LIKE type_t.num10
DEFINE l_xcat005            LIKE xcat_t.xcat005 #170618-00239#1 add
DEFINE l_ooca002            LIKE ooca_t.ooca002 #170603-00014#1 add
DEFINE l_ooca004            LIKE ooca_t.ooca004 #170603-00014#1 add
#170908-00044#1-s add
DEFINE l_wo_xckbent         LIKE xckb_t.xckbent
DEFINE l_wo_xckbcomp        LIKE xckb_t.xckbcomp
DEFINE l_wo_xckbld          LIKE xckb_t.xckbld 
DEFINE l_wo_xckb001         LIKE xckb_t.xckb001
DEFINE l_wo_xckb002         LIKE xckb_t.xckb002
DEFINE l_wo_xckb003         LIKE xckb_t.xckb003
DEFINE l_wo_xckb005         LIKE xckb_t.xckb005
DEFINE l_wo_xckb006         LIKE xckb_t.xckb006
DEFINE l_wo_xckb014         LIKE xckb_t.xckb014
DEFINE l_wo_xckb021         LIKE xckb_t.xckb021
DEFINE l_wo_xckb012         LIKE xckb_t.xckb012
DEFINE l_wo_xckb013         LIKE xckb_t.xckb013
DEFINE l_wo_xckb020         LIKE xckb_t.xckb020
DEFINE l_so_xckb014         LIKE xckb_t.xckb014
DEFINE l_so_xckb014_reached LIKE xckb_t.xckb014
DEFINE l_so_xckb021         LIKE xckb_t.xckb021
DEFINE l_so_xckb021_reached LIKE xckb_t.xckb021
DEFINE l_so_xckb015         LIKE xckb_t.xckb015
DEFINE l_so_xckb016         LIKE xckb_t.xckb016
DEFINE l_so_xckb017         LIKE xckb_t.xckb017
DEFINE l_so_xckb036         LIKE xckb_t.xckb036
#170908-00044#1-e add

   #170618-00239#1-s
   #抓計算方式(批次成本否)
   SELECT xcat005 INTO l_xcat005
     FROM xcat_t
    WHERE xcatent = g_enterprise
      AND xcat001 = g_xcat001  
   #170618-00239#1-e
   
   LET r_success = TRUE
   LET g_wc_ais = g_master.wc
  #170214-00060#1 ---mark (s)---
  #LET g_wc_ais = cl_replace_str(g_wc_ais,"pmaa001","xrca005") #客戶
  #LET g_wc_ais = cl_replace_str(g_wc_ais,"imaa001","xrcb004") #產品編號  
  #170214-00060#1 ---mark (e)---
   LET g_wc_ais = cl_replace_str(g_wc_ais,"pmaa001","isaf003") #170214-00060#1 add
   #171012-00003#1 mark-S 单笔若无发票信息，则无法走后续流程
#   LET l_count = 0
#   LET g_sql = " SELECT COUNT(1) ",
#               "   FROM isaf_t,isag_t ",
#               "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ",   #161223-00020#1 add
#               "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
#               "    AND isafent = ",g_enterprise,
#               "    AND isafcomp='",g_comp,"' ",
#               "    AND isafstus IN ('S' ,'Y') ",
#               "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#               "    AND isag009 IS NOT NULL ",
#               "    AND isag001 in ('11','21') ",   #170417-00016#1
#               #171011-00045#1---add---s
#               "    AND NOT EXISTS(SELECT 1 FROM xmdk_t WHERE xmdkent = isagent AND xmdkdocno=isag002 ",
#               "                      AND xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S') ",
#               #171011-00045#1---add---e  
#               "    AND ",g_wc_ais CLIPPED
#   PREPARE xckb2_count_pre FROM g_sql
#   EXECUTE xckb2_count_pre INTO l_count
#   IF l_count = 0 THEN
#      RETURN r_success
#   END IF
   #171012-00003#1 mark-E

   #DELETE FROM convert_tmp;    #181030-00060#1 Mark By 06137  181107
   TRUNCATE TABLE convert_tmp;  #181030-00060#1 Add By 06137  181107  #因DELETE convert_tmp無任何條件，所以改寫TRUNCATE TABLE，優化刪除效能   
   LET g_sql = " INSERT INTO convert_tmp ",               
               " SELECT * FROM (",  #170908-00044#1 add
               #170908-00044#1-s mark
#               #" SELECT DISTINCT isag009,isag005,imaa006,1 ",      #170603-00014#1 mark
#               " SELECT DISTINCT isag009,xmdm008,imaa006,1,'','' ", #170603-00014#1 add              
#               "   FROM isaf_t,isag_t ",
#               "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ",   #161223-00020#1 add
#               "  ,xmdm_t", #170603-00014#1 add                                                
#               "  ,xmdl_t " , #171108-00029#1 add        
#               "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
#               "    AND isagent = xmdment AND isag002 = xmdmdocno AND isag003 = xmdmseq ", #170603-00014#1 add   
#               "    AND isagent = xmdlent AND isag002 = xmdldocno AND isag003 = xmdlseq ",     #171108-00029#1 add       
#               "    AND isafent = ",g_enterprise,
#               "    AND isafcomp='",g_comp,"' ",
#               "    AND isafstus IN ('S' ,'Y') ",
#               "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#               "    AND isag009 IS NOT NULL ",
#               "    AND isag001 in ('11','21') ",   #170417-00016#1
#               #171011-00045#1---add---s
#               "    AND NOT EXISTS(SELECT 1 FROM xmdk_t WHERE xmdkent = isagent AND xmdkdocno=isag002 ",
#               "                      AND xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S') ",
#               #171011-00045#1---add---e    
#               "    AND (xmdl014 = ' ' OR xmdl014 IS NULL OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite  AND inaa001 = xmdl014 AND inaa010 = 'Y')) ", #171108-00029#1 add  
#               "    AND ",g_wc_ais CLIPPED
               #170908-00044#1-e mark
               #170908-00044#1-s add
              #" SELECT DISTINCT isag009 as imaa001,xmdm008 as from_unit,imaa006 as to_unit,1 as qty,'' as ooca002,'' as ooca004",   #181030-00060#1 Mark By 06137  181107
               #" SELECT DISTINCT isag009 as imaa001,(CASE WHEN isag009='MISC' AND xmdm008 IS NULL THEN 'PCS' ELSE xmdm008 END) as from_unit,imaa006 as to_unit,1 as qty,'' as ooca002,'' as ooca004",   #181030-00060#1 Add By 06137  181107  #190925-00042#1 mark
               #" SELECT DISTINCT isag009 as imaa001,(CASE WHEN isag009='MISC' AND xmdm008 IS NULL THEN 'PCS' ELSE xmdm008 END) as from_unit,imaa006 as to_unit,'' as from_qty,'' as to_qty,1 as qty,'' as ooca002,'' as ooca004",              #190925-00042#1 add #200824-00034#1 mark
               " SELECT DISTINCT isag009 as imaa001,(CASE WHEN isag009='MISC' AND xmdm008 IS NULL THEN 'PCS' ELSE xmdm008 END) as from_unit,imaa006 as to_unit,0 as from_qty,0 as to_qty,1 as qty,null as ooca002,null as ooca004",  #200824-00034#1 add
               "   FROM xmdm_t,isaf_t,isag_t ",
               "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ",
               "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
               "    AND isagent = xmdment AND isag002 = xmdmdocno AND isag003 = xmdmseq ",
               "    AND isafent = ",g_enterprise,
               "    AND isafcomp='",g_comp,"' ",
               "    AND isafstus IN ('S' ,'Y') ",
               "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
               "    AND isag009 IS NOT NULL ",
               "    AND isag001 in ('11','21') ",
               #"    AND EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdment AND inaasite  = xmdmsite  AND inaa001 = xmdm005 AND inaa010 = 'Y') ",   #181113-00041#1  #181206-00043#1 mark
               #181206-00043#1---add---s
               "    AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
               "                  AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
               #181206-00043#1---add---e
               #"    AND ",g_wc_ais CLIPPED," ) "     #PGS(D)-10130 mark
               "    AND ",g_wc_ais CLIPPED," ) t51 "      #PGS(D)-10130 add              
               #170908-00044#1-e add
   PREPARE xckb2_pre1 FROM g_sql
   EXECUTE xckb2_pre1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre1"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #181030-00060#1 Mark By 06137  181107(S)
   #UPDATE convert_tmp
   #   SET from_unit = 'PCS'
   # WHERE imaa001 = 'MISC'
   #   AND from_unit IS NULL
   #181030-00060#1 Mark By 06137  181107(E)
      
   LET g_sql = " SELECT DISTINCT imaa001,from_unit,to_unit ",
               "   FROM convert_tmp "
   PREPARE xckb2_pre2 FROM g_sql
   DECLARE xckb2_cur2 CURSOR FOR xckb2_pre2
   FOREACH xckb2_cur2 INTO l_imaa001,l_from_unit,l_to_unit
      #CALL s_aooi250_convert_qty(l_imaa001,l_from_unit,l_to_unit,1) #170603-00014#1 mark
      CALL s_aooi250_convert_qty1(l_imaa001,l_from_unit,l_to_unit,1) #170603-00014#1 add
         RETURNING l_success,l_qty
      IF l_success THEN
         #170603-00014#1 add start -----
         SELECT ooca002,ooca004 INTO l_ooca002,l_ooca004
           FROM ooca_t
          WHERE oocaent = g_enterprise
            AND ooca001 = l_to_unit
         #170603-00014#1 add end   -----      
　       UPDATE convert_tmp
            SET qty = l_qty
               ,ooca002 = l_ooca002, ooca004 = l_ooca004 #170603-00014#1 add            
          WHERE imaa001 = l_imaa001
            AND from_unit = l_from_unit
            AND to_unit = l_to_unit
      END IF
   END FOREACH
   IF l_xcat005 = '3' THEN    #170618-00239#1 add   
      #IF g_para = 'N' THEN    #201030-00027#6 add   #201216-00027#1 mark
      LET g_sql = " INSERT INTO xckb2_tmp(xckbent,xckbcomp,xckbld,xckb001,xckb002,",
                  "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
                  "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
                  "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
                  "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
                  "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
                  "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
                  "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
                  "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
                  "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
                  "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
                  "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
                  "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
                  "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
                  "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
                  "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
                  "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
                  "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
                  "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038,xckb043,xckb044,xckb045) ",   #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045    
                  " SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"','4','-1',",   #201030-00027#6 add DISTINCT 
                  #"        isaf011,'",g_site,"',isag002,isag003,",g_master.yy,",",                  #170306-00053 wujie mark
                 #"        NVL(isaf011,' ') isaf011,'",g_site,"',isag002,isag003,",g_master.yy,",",  #170306-00053 wujie add NVL   #190312-00007#1 mark
                  "        NVL(isaf011,' ') isaf011,xmdlsite,isag002,isag003,",g_master.yy,",",                                    #190312-00007#1 add
                  #"        ",g_master.pp,",isaf003,isaf005,isaf006,isag009,", #181112-00039#1 mark
                  #"        ",g_master.pp,",isaf003,isaf057,isaf006,isag009,",  #181112-00039#1 add #190708-00016#1 mark 
                  "        ",g_master.pp,",isaf003,xmdk003,xmdk004,isag009,",  #190708-00016#1 add
                  #"        isag005,DECODE(isag005,NULL,isag004,isag004*isag005),' ',' ',' ',", #170220-00038#1 mark
                  #"        isag005,DECODE(isag005,NULL,isag004,isag004*isag015),' ',' ',' ',",  #170220-00038#1 add               #170306-00053 wujie mark
                  #"        isag005,SUM(DECODE(isag005,NULL,isag004,isag004*isag015)) isag004,' ',' ',' ',",  #170220-00038#1 add   #170306-00053 wujie mod #170512-00092#1 mark
                  #"        isag005,SUM(DECODE(isag005,NULL,isag004,isag004)) isag004,' ',' ',' ',",                 #170908-00044#1 add   #191017-00033#1  mark                             
                   "        isag005,SUM(DECODE(isag005,NULL,isag004,isag004*isag015)) isag004,' ',' ',' ',",                  #191017-00033#1              
                  #"        xmdm008,xmdm009,xmdm005,xmdm006,xmdm007,",  #170512-00092#1 add   #170815-00032#1 mark
                  #"        xmdm008,xmdm009*isag015,xmdm005,xmdm006,xmdm007,",                 #170815-00032#1 add   #170908-00044#1 mark
                  #"        '',isaf010,imaa006,'','',",  #190709-00041#1  mark
#                  "        '','',imaa006,'','',",        #190709-00041#1  #200709-00103#1 mark
                  "        '','',imaa006,CAST(NULL AS decimal),'',",        #200709-00103#1 add                  
                  #"        'N','','','",g_glaa001,"',SUM(isag115),"  #170306-00053#1 wujie add SUM()  #190410-00009#1 mark
#                  "        'N','','','",g_glaa001,"',SUM(isag113),"   #190410-00009#1  #200709-00103#1 mark
                  "        'N',CAST(NULL AS int),CAST(NULL AS int),'",g_glaa001,"',SUM(isag113),"   #200709-00103#1 add
         IF g_glaa015 = 'Y' THEN                        
            LET g_sql = g_sql,"'",g_glaa016,"',0,"
         ELSE
            LET g_sql = g_sql,"'',0,"
         END IF
         IF g_glaa019 = 'Y' THEN                        
#            LET g_sql = g_sql,"'",g_glaa020,"',0,'',"  #200709-00103#1 mark
            LET g_sql = g_sql,"'",g_glaa020,"',0,CAST(NULL AS decimal),"  #200709-00103#1 add
         ELSE
#            LET g_sql = g_sql,"'',0,'',"  #200709-00103#1 mark
            LET g_sql = g_sql,"'',0,CAST(NULL AS decimal),"  #200709-00103#1 add
         END IF
         LET g_sql = g_sql,
#                    "'','','',0,' ',",   #170512-00092#1 mark        #170908-00044#1 add  都先放項序0  #200709-00103#1 mark
                    "CAST(NULL AS decimal),CAST(NULL AS decimal),'',0,' ',",   #200709-00103#1 add
                    #"'','','',xmdmseq1,' ',",  #170512-00092#1 add  #170908-00044#1 mark
                    "0,0,0,0,0,0,0,0,0,", 
                    "0,0,0,0,0,0,0,0,0,", 
                    "0,0,0,0,0,0,0,0,0,", 
                    "0,0,0,0,0,0,0,0,0,",
                    "0,0,0,0,0,0,0,0,0,",
                    "0,0,0,0,0,0,0,0,0,",
                    "' ',xmdl001,xmdl002,'N'", #170214-00060#1 remove , #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045
                    "   FROM isaf_t,isag_t ",
                    "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ", 
                   #"   ,xmdm_t",   #170512-00092#1 add xmdm_t  #170908-00044#1 mark
                    "   ,xmdl_t", #171108-00029#1 add
                    "   ,xmdk_t", #190708-00016#1 add                    
                    "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
                   #"    AND isagent = xmdment AND isag002 = xmdmdocno AND isag003 = xmdmseq ",  #170512-00092#1  #170908-00044#1 mark
                    "    AND isagent = xmdlent AND isag002 = xmdldocno AND isag003 = xmdlseq ",  #171108-00029#1 add
                    #"    AND xmdkent = xmdlent AND xmdkdocno = xmdkdocno ", #190708-00016#1 add  #200110-00009#1 mark                  
                    "    AND xmdkent = xmdlent AND xmdkdocno = xmdldocno ",  #200110-00009#1 add  
                    "    AND (xmdk071 = 'N' OR xmdk071 IS NULL) ",#201216-00027#1 add
                    "    AND isafent = ",g_enterprise,
                    "    AND isafcomp='",g_comp,"' ",
                    "    AND imaa004 <> 'E' ",  #210318-00012#1 add
                    "    AND isafstus IN ('S' ,'Y') ",
                    "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
                    "    AND isag009 IS NOT NULL ",
                    "    AND isag001 in ('11','21') ",  #170214-00060#1 add
                    #"    AND (xmdl014 = ' ' OR xmdl014 IS NULL OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite AND inaa001 = xmdl014 AND inaa010 = 'Y')) ", #171108-00029#1 add   #181206-00043#1 mark   
                    #171011-00045#1---add---s
                    "    AND NOT EXISTS(SELECT 1 FROM xmdk_t WHERE xmdkent = isagent AND xmdkdocno=isag002 ",
                  # "                      AND xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S') ",   #201216-00027#1 mark
                    "                      AND xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ",   #201216-00027#1 add 
                    #171011-00045#1---add---e
                    #201231-00007#1---add---s
                    "    AND EXISTS (SELECT 1 FROM inaa_t A,xmdm_t WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 AND xmdlent=xmdment and xmdldocno=xmdmdocno and xmdlseq = xmdmseq ",
                    "                   AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
                    #201231-00007#1---add---e
                    "    AND ",g_wc_ais CLIPPED,
                   #" GROUP BY isaf011,isag002,isag003,isaf003,isaf005,isaf006,isag009,isag005,isaf010,imaa006"  #170306-00053 wujie add  #170908-00044#1 去掉, #181112-00039#1 mark
                    #" GROUP BY isaf011,isag002,isag003,isaf003,isaf057,isaf006,isag009,isag005,isaf010,imaa006"  #170306-00053 wujie add  #170908-00044#1 去掉, #181112-00039#1 add #190708-00016#1 mark
                    #" GROUP BY isaf011,isag002,isag003,isaf003,xmdk003,xmdk004,isag009,isag005,isaf010,imaa006"  #190708-00016#1 add  #190709-00041#1 mark
                    " GROUP BY isaf011,isag002,isag003,isaf003,xmdk003,xmdk004,isag009,isag005,imaa006"  #190709-00041#1 add
                   #"          ,xmdm008,xmdm009,xmdm005,xmdm006,xmdm007,xmdmseq1 "    #170512-00092#1 add        #170908-00044#1 mark
                   ,"          ,isag015 " #171012-00003#1 add
                   ,"          ,xmdlsite,xmdl001,xmdl002 "   #190312-00007#1 add  #201030-00027#6 add xmdl001,xmdl002     
#201231-00007#1---mark---s                   
#   #201030-00027#6-S add
#     #ELSE  #201216-00027#1 mark
#      LET g_sql = " INSERT INTO xckb2_tmp(xckbent,xckbcomp,xckbld,xckb001,xckb002,",
#                  "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
#                  "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
#                  "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
#                  "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
#                  "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
#                  "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
#                  "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
#                  "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
#                  "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
#                  "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
#                  "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
#                  "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
#                  "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
#                  "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
#                  "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
#                  "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
#                  "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
#                  "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038,xckb043,xckb044,xckb045) ",   #201216-00027#1 add xckb045      
#                  " SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"','4','-1',",
#                  "        NVL(isaf011,' ') isaf011,xmdlsite,isag002,isag003,",g_master.yy,",",                                    
#                  "        ",g_master.pp,",isaf003,xmdk003,xmdk004,isag009,",                           
#                   "        isag005,SUM(DECODE(isag005,NULL,isag004,isag004*isag015)) isag004,' ',' ',' ',",                        
#                  "        '','',imaa006,CAST(NULL AS decimal),'',",                   
#                  "        'N',CAST(NULL AS int),CAST(NULL AS int),'",g_glaa001,"',SUM(isag113),"   
#         IF g_glaa015 = 'Y' THEN                        
#            LET g_sql = g_sql,"'",g_glaa016,"',0,"
#         ELSE
#            LET g_sql = g_sql,"'',0,"
#         END IF
#         IF g_glaa019 = 'Y' THEN                        
#            LET g_sql = g_sql,"'",g_glaa020,"',0,CAST(NULL AS decimal),"   
#         ELSE
#            LET g_sql = g_sql,"'',0,CAST(NULL AS decimal),"  
#         END IF
#         LET g_sql = g_sql,
#                    "CAST(NULL AS decimal),CAST(NULL AS decimal),'',0,' ',",    
#                    "0,0,0,0,0,0,0,0,0,", 
#                    "0,0,0,0,0,0,0,0,0,", 
#                    "0,0,0,0,0,0,0,0,0,", 
#                    "0,0,0,0,0,0,0,0,0,",
#                    "0,0,0,0,0,0,0,0,0,",
#                    "0,0,0,0,0,0,0,0,0,",
#                    "' ',xmdl001,xmdl002,'N'",  #201216-00027#1 add xmdk071
#                    "   FROM isaf_t,isag_t ",
#                    "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ", 
#                    "   ,xmdl_t",  
#                    "   ,xmdk_t",                     
#                    "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
#                    "    AND isagent = xmdlent AND isag002 = xmdldocno AND isag003 = xmdlseq ",                
#                    "    AND xmdkent = xmdlent AND xmdkdocno = xmdldocno ",  
#                    "    AND (xmdk071 = 'N' OR xmdk071 IS NULL) ",  #201216-00027#1 add           
#                    "    AND isafent = ",g_enterprise,
#                    "    AND isafcomp='",g_comp,"' ",
#                    "    AND isafstus IN ('S' ,'Y') ",
#                    "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#                    "    AND isag009 IS NOT NULL ",
#                    "    AND isag001 in ('11','21') ",   
#                    "    AND NOT EXISTS(SELECT 1 FROM xmdk_t WHERE xmdkent = isagent AND xmdkdocno=isag002 ",
#                  # "                      AND ((xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S' ) ",                    #201216-00027#1 mark 
#                    "                      AND ((xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S' AND xmdk071 = 'Y' ) ",  #201216-00027#1 add
#                   #"                       OR  (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3'))) ",  #201216-00027#1 mark
#                    "                       OR  (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3' AND xmdk071 = 'Y' ) ",         #201216-00027#1 add
#                    "                       OR  (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 <> '3' AND xmdk071 = 'Y' ))) ",  #201216-00027#1 add                    
#                    "    AND ",g_wc_ais CLIPPED,
#                    " GROUP BY isaf011,isag002,isag003,isaf003,xmdk003,xmdk004,isag009,isag005,imaa006"  
#                   ,"          ,isag015 " 
#                   ,"          ,xmdlsite,xmdl001,xmdl002 "   
#  #END IF   #201216-00027#1 mark                                  
#   #201030-00027#6-E add
#201231-00007#1---mark---e   
   #170618-00239#1-s add                       
   ELSE
     #IF g_para = 'N' THEN    #201030-00027#6 add   #201216-00027#1 mark
      LET g_sql = " INSERT INTO xckb2_tmp(xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
               "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
               "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
               "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
               "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
               "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
               "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
               "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
               "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
               "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
               "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
               "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
               "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
               "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
               "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
               "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
               "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
               "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038,xckb043,xckb044,xckb045) ",   #201030-00027#6 add xckb043,xckb044  ##201216-00027#1 add xckb045     
               " SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"','4','-1',",   #201030-00027#6 add DISTINCT 
              #"        NVL(isaf011,' ') isaf011,'",g_site,"',isag002,isag003,",g_master.yy,",",   #190312-00007#1 mark 
               "        NVL(isaf011,' ') isaf011,xmdlsite,isag002,isag003,",g_master.yy,",",       #190312-00007#1 add              
               #"        ",g_master.pp,",isaf003,isaf005,isaf006,isag009,", #181112-00039#1 mark
               #"        ",g_master.pp,",isaf003,isaf057,isaf006,isag009,",  #181112-00039#1 add #190708-00016#1 mark 
               "        ",g_master.pp,",isaf003,xmdk003,xmdk004,isag009,",  #190708-00016#1 add
               "        isag005,SUM(DECODE(isag005,NULL,isag004,isag004*isag015)) isag004,' ',' ',' ',",  
               #"        '',isaf010,imaa006,'','',",    #190709-00041#1 mark
               #"        '','',imaa006,'','',",          #190709-00041#1  #200824-00034#1 mark
               "        '','',imaa006,CAST(NULL AS decimal),null,",           #200824-00034#1  add
               #"        'N','','','",g_glaa001,"',SUM(isag115),"   #190410-00009#1 mark
               #"        'N','','','",g_glaa001,"',SUM(isag113),"    #190410-00009#1 mark  #200824-00034#1 mark
               "        'N',CAST(NULL AS int),CAST(NULL AS int),'",g_glaa001,"',SUM(isag113),"     #200824-00034#1 add
      IF g_glaa015 = 'Y' THEN                        
         LET g_sql = g_sql,"'",g_glaa016,"',0,"
      ELSE
         #LET g_sql = g_sql,"'',0,"
         LET g_sql = g_sql,"null,0,"          #200824-00034#1 add
      END IF
      IF g_glaa019 = 'Y' THEN                        
         #LET g_sql = g_sql,"'",g_glaa020,"',0,'',"
         LET g_sql = g_sql,"'",g_glaa020,"',0,CAST(NULL AS decimal),"     #200824-00034#1 add
      ELSE
         #LET g_sql = g_sql,"'',0,'',"
         LET g_sql = g_sql,"null,0,CAST(NULL AS decimal),"     #200824-00034#1 add
      END IF
      LET g_sql = g_sql,
               #  "'','','',0,' ',",       #200824-00034#1 mark
                 "CAST(NULL AS decimal),CAST(NULL AS decimal),null,0,' ',",        #200824-00034#1 add
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,", 
                 "0,0,0,0,0,0,0,0,0,",
                 "0,0,0,0,0,0,0,0,0,",
                 "0,0,0,0,0,0,0,0,0,",
                 "' ',xmdl001,xmdl002,'N' ",   #201030-00027#6 add xckb043,xckb044  #201216-00027#1 add xckb045
                 "   FROM isaf_t,isag_t ",
                 "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ",
                 "   ,xmdl_t " , #171108-00029#1 add
                 "   ,xmdk_t ",  #190708-00016#1 add                 
                 "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
                 "    AND isagent = xmdlent AND isag002 = xmdldocno AND isag003 = xmdlseq ",     #171108-00029#1 add 
                 "    AND xmdkent = xmdlent AND xmdkdocno = xmdldocno ", #190708-00016#1 add   
                 "    AND (xmdk071 = 'N' OR xmdk071 IS NULL )",  #201216-00027#1 add                 
                 "    AND isafent = ",g_enterprise,
                 "    AND isafcomp='",g_comp,"' ",
                 "    AND imaa004 <> 'E' ",  #210318-00012#1 add
                 "    AND isafstus IN ('S' ,'Y') ",
                 "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
                 "    AND isag009 IS NOT NULL ",
                 "    AND isag001 in ('11','21') ",
                 #"    AND (xmdl014 = ' ' OR xmdl014 IS NULL OR EXISTS(SELECT 1 FROM inaa_t WHERE inaaent = xmdlent AND inaasite  = xmdlsite AND inaa001 = xmdl014 AND inaa010 = 'Y')) ", #171108-00029#1 add   #181206-00043#1 mark  
                 #171011-00045#1---add---s
                 "    AND NOT EXISTS(SELECT 1 FROM xmdk_t WHERE xmdkent = isagent AND xmdkdocno=isag002 ",
                #"                      AND xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S') ",   #201216-00027#1 mark
                 "                      AND xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S' AND (xmdk071 = 'N' OR xmdk071 IS NULL)) ",   #201216-00027#1 add
                 #171011-00045#1---add---e                    
                 #201231-00007#1---add---s
                 "    AND EXISTS (SELECT 1 FROM inaa_t A,xmdm_t WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 AND xmdlent=xmdment and xmdldocno=xmdmdocno and xmdlseq = xmdmseq ",
                 "                   AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
                 #201231-00007#1---add---e                 
                 "    AND ",g_wc_ais CLIPPED,
                 #" GROUP BY isaf011,isag002,isag003,isaf003,isaf005,isaf006,isag009,isag005,isaf010,imaa006", #181112-00039#1 mark 
                 #" GROUP BY isaf011,isag002,isag003,isaf003,isaf057,isaf006,isag009,isag005,isaf010,imaa006",  #181112-00039#1 add #190708-00016#1 mark 
                 #" GROUP BY isaf011,isag002,isag003,isaf003,xmdk003,xmdk004,isag009,isag005,isaf010,imaa006",  #190708-00016#1 add #190709-00041#1 mark
                 " GROUP BY isaf011,isag002,isag003,isaf003,xmdk003,xmdk004,isag009,isag005,imaa006",  #190709-00041#1
#                 "          ,xmdm008,xmdm009,xmdm005,xmdm006,xmdm007,xmdmseq1 "    #170512-00092#1 add     #171012-00003#1 mark
                 "          ,isag015 " #171012-00003#1 add 
                ,"          ,xmdlsite,xmdl001,xmdl002 "   #190312-00007#1 add   #201030-00027#6 add xmdl001,xmdl002
#201231-00007#1---mark---s                
##201030-00027#6-S add                
#  #ELSE  #201216-00027#1 mark
#      LET g_sql = " INSERT INTO xckb2_tmp(xckbent,xckbcomp,xckbld,xckb001,xckb002,",
#               "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
#               "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
#               "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
#               "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
#               "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
#               "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
#               "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
#               "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
#               "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
#               "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
#               "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
#               "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
#               "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
#               "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
#               "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
#               "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
#               "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
#               "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038,xckb043,xckb044,xckb045) ",   #201216-00027#1 add xckb045     
#               " SELECT DISTINCT ",g_enterprise,",'",g_comp,"','",g_master.glaald,"','4','-1',", 
#               "        NVL(isaf011,' ') isaf011,xmdlsite,isag002,isag003,",g_master.yy,",",                   
#               "        ",g_master.pp,",isaf003,xmdk003,xmdk004,isag009,",  
#               "        isag005,SUM(DECODE(isag005,NULL,isag004,isag004*isag015)) isag004,' ',' ',' ',",  
#               "        '','',imaa006,CAST(NULL AS decimal),null,",          
#               "        'N',CAST(NULL AS int),CAST(NULL AS int),'",g_glaa001,"',SUM(isag113),"     
#      IF g_glaa015 = 'Y' THEN                        
#         LET g_sql = g_sql,"'",g_glaa016,"',0,"
#      ELSE
#         LET g_sql = g_sql,"null,0,"          
#      END IF
#      IF g_glaa019 = 'Y' THEN                        
#         LET g_sql = g_sql,"'",g_glaa020,"',0,CAST(NULL AS decimal),"     
#      ELSE
#         LET g_sql = g_sql,"null,0,CAST(NULL AS decimal),"    
#      END IF
#      LET g_sql = g_sql,
#                 "CAST(NULL AS decimal),CAST(NULL AS decimal),null,0,' ',",        
#                 "0,0,0,0,0,0,0,0,0,", 
#                 "0,0,0,0,0,0,0,0,0,", 
#                 "0,0,0,0,0,0,0,0,0,", 
#                 "0,0,0,0,0,0,0,0,0,",
#                 "0,0,0,0,0,0,0,0,0,",
#                 "0,0,0,0,0,0,0,0,0,",
#                 "' ',xmdl001,xmdl002,'N' ",  #201216-00027#1 add xckb045    
#                 "   FROM isaf_t,isag_t ",
#                 "   LEFT JOIN imaa_t ON imaaent = isagent AND imaa001 = isag009 ",
#                 "   ,xmdl_t " , 
#                 "   ,xmdk_t ",                  
#                 "  WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
#                 "    AND isagent = xmdlent AND isag002 = xmdldocno AND isag003 = xmdlseq ",     
#                 "    AND xmdkent = xmdlent AND xmdkdocno = xmdldocno ", 
#                 "    AND (xmdk071 = 'N' OR xmdk071 IS NULL) ",  #201216-00027#1 add                 
#                 "    AND isafent = ",g_enterprise,
#                 "    AND isafcomp='",g_comp,"' ",
#                 "    AND isafstus IN ('S' ,'Y') ",
#                 "    AND isaf014 BETWEEN '",g_bdate,"' AND '",g_edate,"' ",
#                 "    AND isag009 IS NOT NULL ",
#                 "    AND isag001 in ('11','21') ",
#                 "    AND NOT EXISTS(SELECT 1 FROM xmdk_t WHERE xmdkent = isagent AND xmdkdocno=isag002 ",
#                #"                      AND ((xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S') ",           #201216-00027#1 mark   
#                #"                       OR  (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3'))) ",  #201216-00027#1 mark 
#                 "                      AND ((xmdk000 = '6' AND xmdk082 = '4' AND xmdkstus = 'S' AND xmdk071 = 'Y') ",                #201216-00027#1 add   
#                 "                       OR  (xmdk000 IN ('4','5') AND xmdkstus = 'Y' AND xmdk002 = '3' AND xmdk071 = 'Y') ",         #201216-00027#1 add   
#                 "                       OR  (xmdk000 IN ('1','2','3') AND xmdkstus = 'S' AND xmdk002 <> '3' AND xmdk071 = 'Y'))) ",  #201216-00027#1 add               
#                 "    AND ",g_wc_ais CLIPPED,
#                 " GROUP BY isaf011,isag002,isag003,isaf003,xmdk003,xmdk004,isag009,isag005,imaa006",  
#                 "          ,isag015 " 
#                ,"          ,xmdlsite,xmdl001,xmdl002 "   
#  #END IF   #201216-00027#1 mark
##201030-00027#6-E add   
#201231-00007#1---mark---e
   END IF             
   #170618-00239#1-e add  
   PREPARE xckb2_pre3 FROM g_sql
   EXECUTE xckb2_pre3
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF    

   #170908-00044#1-s add
   ## 入項的 xckb013 是出貨單位(銷售單位)
   ## 出項的 xckb013 目前是抓計價單位，要把它轉回出貨單位
   ## 例如: 入項的出貨為1000 PCS，計價是 591 KG
   ## 在立發票時 是用計價591 KG，但要算完 1000 PCS 才能放回xckb013、xckb014   
   LET g_sql = " INSERT INTO convert_by_so_tmp ",
               " SELECT xckb005,xckb006,xmdl008 as imaa001, ",
               #"        xmdl017 as from_unit,xmdl021 as to_unit,(NVL(xmdl018,1)/NVL(xmdl022,1)) as qty,ooca002,ooca004 ",                             #190925-00042#1 mark
               #"        xmdl017 as from_unit,xmdl021 as to_unit,'' as from_qty,'' as to_qty,(NVL(xmdl018,1)/NVL(xmdl022,1)) as qty,ooca002,ooca004 ",  #190925-00042#1 add
               "        xmdl017 as from_unit,xmdl021 as to_unit,0 as from_qty,0 as to_qty,(NVL(xmdl018,1)/NVL(xmdl022,1)) as qty,ooca002,ooca004 ",   #200824-00034#1 add
               "       ,NVL(xmdl018,1) xmdl018,NVL(xmdl022,1) xmdl022 ", #191113-00006#1
               "   FROM xckb2_tmp,xmdl_t,ooca_t ",
               "  WHERE xckbent = xmdlent and xckbent = oocaent ",
               "    AND xckb005 = xmdldocno AND xckb006 = xmdlseq ",
               "    AND EXISTS(SELECT 1 FROM imaa_t WHERE imaaent = xckbent AND imaa001 = xmdl008 AND imaa004 <> 'E') ",   #210318-00012#1 add
               "    AND xmdl017 = ooca001 "           
   PREPARE xckb_pre41 FROM g_sql
   EXECUTE xckb_pre41
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre41"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #190925-00042#1 -S add

   #200804-00059#1 add(s)
   #更新来源与单位一致的情况
   UPDATE convert_tmp SET from_qty = 1,
                            to_qty = 1
                    WHERE from_unit = to_unit
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = ""
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   #200804-00059#1 add(e)

   LET g_sql = " MERGE INTO xckb2_tmp a ",
               #" USING (SELECT xckb005,xckb006,from_unit,to_unit,qty,ooca002,ooca004 FROM convert_by_so_tmp ) b",  #180408-00007#1 mark
               #" USING (SELECT DISTINCT xckb005,xckb006,from_unit,to_unit,qty,ooca002,ooca004 FROM convert_by_so_tmp ) b",  #180408-00007#1 add #191113-00006#1 mark
               #" USING (SELECT DISTINCT xckb005,xckb006,from_unit,to_unit,xmdl018,xmdl022,ooca002,ooca004 FROM convert_by_so_tmp ) b",  #191113-00006#1  #190925-00042#1 mark
               " USING (SELECT DISTINCT xckb005,xckb006,from_unit,to_unit,from_qty,to_qty,xmdl018,xmdl022,ooca002,ooca004 FROM convert_by_so_tmp ) b",    #190925-00042#1 add
               "    ON (a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006) ",
               "  WHEN MATCHED THEN ",
               "        UPDATE SET ",
               "        a.xckb013 = b.from_unit, ",
               #191113-00006#1---mod---s
               #"        a.xckb014 = (CASE WHEN b.ooca004 = '1' THEN ROUND(a.xckb014*b.qty,b.ooca002) ",
               #"                          WHEN b.ooca004 = '2' THEN (CASE WHEN MOD(ROUND(a.xckb014*b.qty,b.ooca002),(2/POWER(10,b.ooca002))) = 0",
               #"                                                          THEN (ROUND(a.xckb014*b.qty,b.ooca002)) ", 
               #"                                                          ELSE ROUND(a.xckb014*b.qty,b.ooca002)-(power(10,b.ooca002) ) ",
               #"                                                      END  )", 
               #"                          WHEN b.ooca004 = '3' THEN TRUNC(a.xckb014*b.qty,b.ooca002) ",
               ##"                          WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*b.qty)/POWER(10,b.ooca002) ", #190115-00038#1 mark
               #"                          WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*b.qty*POWER(10,b.ooca002))/POWER(10,b.ooca002) ", #190115-00038#1 add
               #"                      END) "
               "        a.xckb014 = (CASE WHEN b.ooca004 = '1' THEN ROUND(a.xckb014*b.xmdl018/b.xmdl022,b.ooca002) ",
               "                          WHEN b.ooca004 = '2' THEN (CASE WHEN MOD( ROUND(a.xckb014*b.xmdl018/b.xmdl022,b.ooca002),(2/POWER(10,b.ooca002))) = 0",
               "                                                          THEN ( ROUND(a.xckb014*b.xmdl018/b.xmdl022,b.ooca002)) ", 
               "                                                          ELSE ROUND(a.xckb014*b.xmdl018/b.xmdl022,b.ooca002)-(power(10,b.ooca002) ) ",
               "                                                      END  )", 
               "                          WHEN b.ooca004 = '3' THEN TRUNC(a.xckb014*b.xmdl018/b.xmdl022,b.ooca002) ",
               "                          WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*b.xmdl018/b.xmdl022*POWER(10,b.ooca002))/POWER(10,b.ooca002) ", 
               "                      END) "               
               #"                      END) "               
               #190925-00042#1 -E mark
               #191113-00006#1---mod---e
   #PGS(D)-00824 --- end ---
   PREPARE xckb_pre42 FROM g_sql
   EXECUTE xckb_pre42
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_pre42"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #170908-00044#1-e add
   
   #190925-00042#1 -S add
   #PGS(D)-00824 ---start---

   LET g_sql = " MERGE INTO xckb2_tmp a",
               #" USING (SELECT imaa001,from_unit,to_unit,qty FROM convert_tmp ) b", #170603-00014#1 mark
               #" USING (SELECT imaa001,from_unit,to_unit,qty,ooca002,ooca004 FROM convert_tmp ) b",  #170603-00014#1 add  #190925-00042#1 mark
               " USING (SELECT imaa001,from_unit,to_unit,from_qty,to_qty,qty,ooca002,ooca004 FROM convert_tmp ) b",        #190925-00042#1 add
               "    ON (a.xckb012 = b.imaa001 AND a.xckb013 = b.from_unit AND a.xckb020 = b.to_unit) ",
               "  WHEN MATCHED THEN ",
               #"        UPDATE SET a.xckb021 = a.xckb014*b.qty " #170603-00014#1 mark
               #170603-00014#1 add start -----
               "        UPDATE SET a.xckb021 = (CASE WHEN b.ooca004 = '1' THEN ROUND(a.xckb014*b.qty,b.ooca002) ",
               "                                     WHEN b.ooca004 = '2' THEN (CASE WHEN MOD( ROUND(a.xckb014*b.qty,b.ooca002),(2/POWER(10,b.ooca002))) = 0 THEN ( ROUND(a.xckb014*b.qty,b.ooca002)) ", 
               "                                          ELSE ROUND(a.xckb014*b.qty,b.ooca002)-(power(10,b.ooca002) ) END  )", 
               "                                     WHEN b.ooca004 = '3' THEN TRUNC(a.xckb014*b.qty,b.ooca002) ",
               #"                          WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*b.qty)/POWER(10,b.ooca002) ", #190115-00038#1 mark
               "                          WHEN b.ooca004 = '4' THEN CEIL(a.xckb014*b.qty*POWER(10,b.ooca002))/POWER(10,b.ooca002) ", #190115-00038#1 add
               "                                END) "
               #170603-00014#1 add end   -----
   #PGS(D)-00824 --- end ---
               ##190925-00042#1 -E add
               #200710-00047#1 mark(e)
               #170603-00014#1 add end   -----   
               #200710-00047#1 add(s)

   PREPARE xckb2_pre4 FROM g_sql
   EXECUTE xckb2_pre4    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre4"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   #171012-00003#1 add-S 出货单的出货性质为2.换货订单和销退单销退方式为5.销退换货的直接写入发出档，不考虑是否开票
   LET g_sql = " INSERT INTO xckb2_tmp(xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
               "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
               "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
               "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
               "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
               "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
               "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
               "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
               "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
               "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
               "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
               "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
               "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
               "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
               "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
               "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
               "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
               "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038 ) ",
	            "          SELECT xckbent,xckbcomp,xckbld,xckb001,'-1',", #方向为发出
               "                 xckb003,xckb004,xckb005,xckb006,xckb007,",
               "                 xckb008,xckb009,xckb010,xckb011,xckb012,",
               "                 xckb013,xckb014,xckb015,xckb016,xckb017,",
               "                 xckb018,xckb019,xckb020,xckb021,xckb022,",
               "                 xckb023,xckb024,xckb025,xckb026,xckb027,",
               "                 xckb028,xckb029,xckb030,xckb031,xckb032,",
               "                 xckb033,xckb034,xckb035,xckb036,xckb037,",
               "                 xckb101,xckb101a,xckb101b,xckb101c,xckb101d,",
               "                 xckb101e,xckb101f,xckb101g,xckb101h,xckb102,",
               "                 xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,",
               "                 xckb102f,xckb102g,xckb102h,xckb111,xckb111a,",
               "                 xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,",
               "                 xckb111g,xckb111h,xckb112,xckb112a,xckb112b,",
               "                 xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,",
               "                 xckb112h,xckb121,xckb121a,xckb121b,xckb121c,",
               "                 xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,",
               "                 xckb122,xckb122a,xckb122b,xckb122c,xckb122d,",
               "                 xckb122e,xckb122f,xckb122g,xckb122h,xckb038 ",
               "            FROM xckb_tmp LEFT OUTER JOIN xmdk_t ON xckbent = xmdkent AND xckb004 = xmdksite AND xckb005 = xmdkdocno ",
               "           WHERE xckbent = ",g_enterprise,
               "             AND xckbcomp = '",g_comp,"' ",
               "             AND xckbld = '",g_master.glaald,"' ",
               "             AND ((xmdk000 = '1' AND xmdk002 = '2') OR (xmdk000 = '6' AND xmdk082 = '5'))"
   PREPARE xckb2_ins FROM g_sql
   EXECUTE xckb2_ins   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_ins"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   #171012-00003#1 add-E
   
   #170908-00044#1-s add
   ##這邊要做分配，主要分出貨有沒有分多庫存批出貨
   ##1. 沒分多倉儲批出貨，那麼項序只有一筆，xckb036就等於原先出貨單的xckb036
   ##2. 有分多倉儲批出貨: 例如原先出貨項次1，出貨數量500，但拆了二個項序，項序1出200，項序2出300
   ##   在開立發票時，第一個月開了100的量，就先把這100分給項序1，第二個月開了200的量，項序1跟項序2各分100，
   ##   接下來的發票都是算在項次2的本月轉出數量裡   
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb2_tmp ",
               " USING (SELECT xmdment,xmdmdocno,xmdmseq,xmdmseq1,xmdm005,xmdm006,xmdm007 ", 
               "          FROM xmdm_t,xmdl_t ",
               #"         WHERE xmdment = xmdlent AND xmdmdocno = xmdldocno AND xmdmseq = xmdlseq AND xmdl013 = 'N') ",  #181206-00043#1 mark
               #181206-00043#1---add---s
               "         WHERE xmdment = xmdlent AND xmdmdocno = xmdldocno AND xmdmseq = xmdlseq AND xmdl013 = 'N' ",
               "           AND EXISTS(SELECT 1 FROM imaa_t WHERE imaaent = xmdment AND imaa001 = xmdm001 AND imaa004 <> 'E') ",  #210318-00012#1 add
               "           AND EXISTS(SELECT 1 FROM inaa_t A WHERE A.inaaent = xmdment AND A.inaasite  = xmdmsite  AND A.inaa001 = xmdm005 ",
               "                         AND (A.inaa010 = 'Y' OR EXISTS(SELECT 1 FROM inaa_t B WHERE B.inaaent = A.inaaent AND B.inaasite  = A.inaasite  AND B.inaa001 = A.inaa018 AND B.inaa010='Y'))) ",
               "       )",
               #181206-00043#1---add---e
               "    ON (xmdment = xckbent AND xmdmdocno = xckb005 AND xmdmseq = xckb006) ",
               "  WHEN MATCHED THEN UPDATE SET xckb036 = xmdmseq1, xckb015 = xmdm005, xckb016 = xmdm006, xckb017 = xmdm007"
   #PGS(D)-00824 --- end ---
   PREPARE xckb2_pre31 FROM g_sql
   EXECUTE xckb2_pre31   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre31"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 

   ## 分多倉儲批出貨:多倉儲批出貨都用庫存數量來比較
   ## a.先把這個月開立發票，但還對不到出貨項序的入項資料撈出來(單號、項次、數量(都用庫存單位來看))
   ## b.依a找出來的單號、項次去看這個月之前開多少數量的發票了
   ## c.接著再看這個月開多少數量的發票，要對應哪些項序

   ##a.先把這個月開立發票，但還對不到出貨項序的入項資料撈出來(單號、項次、數量(都用庫存單位來看))
   LET g_sql = "INSERT INTO reached_tmp ",
               " SELECT * FROM (",
               "    SELECT a.xckbent,a.xckbcomp,a.xckbld, ",
               "           a.xckb005,a.xckb006,a.xckb036,a.xckb014,0 as xckb014_reached,a.xckb021,0 as xckb021_reached,",
               "           a.xckb015,a.xckb016,a.xckb017 ",
               "      FROM xckb_t a,xckb2_tmp b",
               "     WHERE a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld ",
               "       AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 ",
               "       AND b.xckb036 = 0 ",    #還對不到出貨項序 
               "       AND a.xckb002 = '1' ",  #入項資料
               "    UNION ",
               "    SELECT c.xckbent,c.xckbcomp,c.xckbld, ",
               "           c.xckb005,c.xckb006,c.xckb036,c.xckb014,0 as xckb014_reached,c.xckb021,0 as xckb021_reached,",
               "           c.xckb015,c.xckb016,c.xckb017 ",
               "      FROM xckb_tmp c,xckb2_tmp d",
               "     WHERE c.xckbent = d.xckbent AND c.xckbcomp = d.xckbcomp AND c.xckbld = d.xckbld ",
               "       AND c.xckb005 = d.xckb005 AND c.xckb006 = d.xckb006 ",
               "       AND d.xckb036 = 0 ",    #還對不到出貨項序
               "       AND c.xckb002 = '1') t51 "  #入項資料  #200824-00034#1 add t51
   PREPARE xckb2_pre32 FROM g_sql
   EXECUTE xckb2_pre32   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre32"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 

   ##b.依a找出來的單號、項次去看這個月之前開多少數量的發票了
   #LET g_sql = "SELECT a.xckbent,a.xckbcomp,a.xckbld,a.xckb003,a.xckb005,a.xckb006,a.xckb014,a.xckb021 ",  #190310-00001#1 mark
   #190806-00022#1---mark---s
   #LET g_sql = "SELECT DISTINCT a.xckbent,a.xckbcomp,a.xckbld,a.xckb003,a.xckb005,a.xckb006,a.xckb014,a.xckb021 ",  #190310-00001#1
   #            "  FROM xckb_t a,reached_tmp b",
   #            " WHERE a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 ",
   #            "   AND a.xckb002 = -1 AND a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld "
   #PREPARE xckb2_pre33 FROM g_sql
   #DECLARE xckb2_exe33 CURSOR FOR xckb2_pre33
   #IF SQLCA.sqlcode THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code   = SQLCA.sqlcode
   #   LET g_errparam.extend = "EXECUTE xckb2_pre33"
   #   LET g_errparam.popup  = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF 
   #190806-00022#1---mark---e
   #190806-00022#1---add---s
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO reached_tmp A",
               #" USING (SELECT DISTINCT a.xckbent xckbent,a.xckbcomp xckbcomp,a.xckbld xckbld,a.xckb003 xckb003,a.xckb005 xckb005,", #200309-00024#1 mark
               " USING (SELECT DISTINCT a.xckbent xckbent,a.xckbcomp xckbcomp,a.xckbld xckbld,a.xckb005 xckb005,", #200309-00024#1 add
               "                        a.xckb006 xckb006,a.xckb036 xckb036,SUM(a.xckb021) xckb021 ",
               "          FROM xckb_t a,reached_tmp b",
               "         WHERE a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb036 = b.xckb036",
               "           AND a.xckb002 = -1 AND a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld " ,
               #"         GROUP BY a.xckbent,a.xckbcomp,a.xckbld,a.xckb003,a.xckb005,a.xckb006,a.xckb036",  #200309-00024#1 mark
               "         GROUP BY a.xckbent,a.xckbcomp,a.xckbld,a.xckb005,a.xckb006,a.xckb036",  #200309-00024#1 add
               "       ) B",
               "  ON (A.xckbent = B.xckbent AND A.xckbcomp = B.xckbcomp AND A.xckbld = B.xckbld ",
               "  AND A.xckb005 = B.xckb005 AND A.xckb006 = B.xckb006 AND A.xckb036 = B.xckb036 )",
               " WHEN MATCHED THEN ",
               " UPDATE SET A.xckb021_reached = B.xckb021 "
   #PGS(D)-00824 --- end ---
   PREPARE xckb2_pre33 FROM g_sql 
   EXECUTE xckb2_pre33
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre33"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #190806-00022#1---add---e
   LET g_sql = "SELECT xckb036,xckb014,xckb014_reached,xckb021,xckb021_reached,",
               "       xckb015,xckb016,xckb017 ",
               "  FROM reached_tmp ",
               " WHERE xckbent = ? AND xckbcomp = ? AND xckbld = ? ",  
               #"   AND xckb005 = ? AND xckb006 = ?  AND xckb021 > xckb021_reached ",  #190619-00012#1 mark
               "   AND xckb005 = ? AND xckb006 = ?  AND ABS(xckb021) > ABS(xckb021_reached) ",  #190619-00012#1
               " ORDER BY xckb036 "
   PREPARE xckb2_pre34 FROM g_sql
   DECLARE xckb2_exe34 CURSOR FOR xckb2_pre34
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre34"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   #190806-00022#1---mark---s
   #FOREACH xckb2_exe33 INTO l_wo_xckbent,l_wo_xckbcomp,l_wo_xckbld,l_wo_xckb003,l_wo_xckb005,l_wo_xckb006,l_wo_xckb014,l_wo_xckb021
   #   IF SQLCA.sqlcode THEN
   #      INITIALIZE g_errparam TO NULL
   #      LET g_errparam.code = SQLCA.sqlcode
   #      LET g_errparam.extend = 'xckb2_exe33'
   #      LET g_errparam.popup = TRUE
   #      CALL cl_err()
   #      LET r_success = FALSE
   #      RETURN r_success
   #   END IF
   #
   #   FOREACH xckb2_exe34 USING l_wo_xckbent,l_wo_xckbcomp,l_wo_xckbld,l_wo_xckb005,l_wo_xckb006
   #                        INTO l_so_xckb036,l_so_xckb014,l_so_xckb014_reached,l_so_xckb021,l_so_xckb021_reached,
   #                             l_so_xckb015,l_so_xckb016,l_so_xckb017
   #      IF SQLCA.sqlcode THEN
   #         INITIALIZE g_errparam TO NULL
   #         LET g_errparam.code = SQLCA.sqlcode
   #         LET g_errparam.extend = 'xckb2_exe34'
   #         LET g_errparam.popup = TRUE
   #         CALL cl_err()
   #         LET r_success = FALSE
   #         RETURN r_success
   #      END IF
   #
   #      #IF l_so_xckb021 - l_so_xckb021_reached < l_wo_xckb021 THEN  #190619-00012#1 mark
   #      IF s_math_abs(l_so_xckb021 - l_so_xckb021_reached) < s_math_abs(l_wo_xckb021) THEN  #190619-00012#1
   #         UPDATE reached_tmp SET xckb021_reached = xckb021_reached + (l_so_xckb021 - l_so_xckb021_reached)
   #          WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
   #            AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = l_so_xckb036
   #         LET l_wo_xckb021 = l_wo_xckb021 - (l_so_xckb021 - l_so_xckb021_reached)
   #      ELSE
   #         UPDATE reached_tmp SET xckb021_reached = xckb021_reached + l_wo_xckb021
   #          WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
   #            AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = l_so_xckb036
   #         LET l_wo_xckb021 = 0
   #      END IF
   #
   #      IF l_wo_xckb021 = 0 THEN EXIT FOREACH END IF
   #
   #   END FOREACH
   #END FOREACH
   #190806-00022#1---mark---e
   
   #c.接著再看這個月開多少數量的發票，要對應哪些項序
   LET g_sql = "SELECT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb005,xckb006,xckb021,xckb014, ",
               "       xckb012,xckb013,xckb020 ",
               "  FROM xckb2_tmp WHERE xckb036 = 0 ORDER BY xckb005,xckb006"
   PREPARE xckb2_pre35 FROM g_sql
   DECLARE xckb2_exe35 CURSOR FOR xckb2_pre35
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre35"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   FOREACH xckb2_exe35 INTO l_wo_xckbent,l_wo_xckbcomp,l_wo_xckbld,l_wo_xckb001,l_wo_xckb002,l_wo_xckb003,
                            l_wo_xckb005,l_wo_xckb006,l_wo_xckb021,l_wo_xckb014,l_wo_xckb012,l_wo_xckb013,l_wo_xckb020
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'xckb2_exe35'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
 
      FOREACH xckb2_exe34 USING l_wo_xckbent,l_wo_xckbcomp,l_wo_xckbld,l_wo_xckb005,l_wo_xckb006
                           INTO l_so_xckb036,l_so_xckb014,l_so_xckb014_reached,l_so_xckb021,l_so_xckb021_reached,
                                l_so_xckb015,l_so_xckb016,l_so_xckb017
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'xckb2_exe34'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF

         #IF l_so_xckb021 - l_so_xckb021_reached < l_wo_xckb021 THEN  #190410-00009#1 mark
         IF s_math_abs(l_so_xckb021 - l_so_xckb021_reached) < s_math_abs(l_wo_xckb021) THEN  #190410-00009#1
            LET l_qty = l_so_xckb021 - l_so_xckb021_reached
            UPDATE reached_tmp SET xckb021_reached = xckb021_reached + l_qty
             WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
               AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = l_so_xckb036

            CALL s_aooi250_convert_qty(l_wo_xckb012,l_wo_xckb020,l_wo_xckb013,l_qty) 
                 RETURNING l_success,l_so_xckb014

            UPDATE xckb2_tmp 
               SET xckb036 = l_so_xckb036,
                   xckb014 = l_so_xckb014,
                   xckb021 = l_qty,
                   xckb015 = l_so_xckb015,
                   xckb016 = l_so_xckb016,
                   xckb017 = l_so_xckb017
             WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
               AND xckb001 = l_wo_xckb001 AND xckb002 = l_wo_xckb002 AND xckb003 = l_wo_xckb003
               AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = 0
               
            INSERT INTO xckb2_tmp
                  (xckbent,xckbcomp,xckbld,
                   xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb007,xckb008,xckb009,xckb010,
                   xckb011,xckb012,xckb013,xckb014,xckb015,xckb016,xckb017,xckb018,xckb019,xckb020,
                   xckb021,xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,xckb028,xckb029,xckb030,
                   xckb031,xckb032,xckb033,xckb034,xckb035,xckb036,xckb037,
                   xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h,
                   xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h,
                   xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h,
                   xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h,
                   xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,
                   xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,
                   xckb038)
            SELECT xckbent,xckbcomp,xckbld,
                   xckb001,xckb002,xckb003,xckb004,xckb005,xckb006,xckb007,xckb008,xckb009,xckb010,
                   xckb011,xckb012,xckb013,xckb014,' ' as xckb015,' ' as xckb016,' ' as xckb017,xckb018,xckb019,xckb020,
                   xckb021,xckb022,xckb023,xckb024,xckb025,xckb026,xckb027,xckb028,xckb029,xckb030,
                   xckb031,xckb032,xckb033,xckb034,xckb035,0 as xckb036,xckb037,
                   xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h,
                   xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h,
                   xckb111,xckb111a,xckb111b,xckb111c,xckb111d,xckb111e,xckb111f,xckb111g,xckb111h,
                   xckb112,xckb112a,xckb112b,xckb112c,xckb112d,xckb112e,xckb112f,xckb112g,xckb112h,
                   xckb121,xckb121a,xckb121b,xckb121c,xckb121d,xckb121e,xckb121f,xckb121g,xckb121h,
                   xckb122,xckb122a,xckb122b,xckb122c,xckb122d,xckb122e,xckb122f,xckb122g,xckb122h,
                   xckb038
              FROM xckb2_tmp
             WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
               AND xckb001 = l_wo_xckb001 AND xckb002 = l_wo_xckb002 AND xckb003 = l_wo_xckb003
               AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = l_so_xckb036
           
            UPDATE xckb2_tmp 
               SET xckb014 = l_wo_xckb014 - l_so_xckb014,
                   xckb021 = l_wo_xckb021 - l_qty
             WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
               AND xckb001 = l_wo_xckb001 AND xckb002 = l_wo_xckb002 AND xckb003 = l_wo_xckb003
               AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = 0

            LET l_wo_xckb021 = l_wo_xckb021 - l_qty
            LET l_wo_xckb014 = l_wo_xckb014 - l_so_xckb014
         ELSE
            UPDATE reached_tmp SET xckb021_reached = xckb021_reached + l_wo_xckb021
             WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
               AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = l_so_xckb036

            UPDATE xckb2_tmp 
               SET xckb036 = l_so_xckb036,
                   xckb014 = l_wo_xckb014,
                   xckb021 = l_wo_xckb021,
                   xckb015 = l_so_xckb015,
                   xckb016 = l_so_xckb016,
                   xckb017 = l_so_xckb017
             WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
               AND xckb001 = l_wo_xckb001 AND xckb002 = l_wo_xckb002 AND xckb003 = l_wo_xckb003
               AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = 0

            LET l_wo_xckb021 = 0
         END IF

         IF l_wo_xckb021 = 0 THEN EXIT FOREACH END IF
      END FOREACH
      #181113-00041#1---add---s
      #此处有效删除的情况:非成本仓出货的开票数据
      DELETE FROM xckb2_tmp 
       WHERE xckbent = l_wo_xckbent AND xckbcomp = l_wo_xckbcomp AND xckbld = l_wo_xckbld
         AND xckb001 = l_wo_xckb001 AND xckb002 = l_wo_xckb002 AND xckb003 = l_wo_xckb003
         AND xckb005 = l_wo_xckb005 AND xckb006 = l_wo_xckb006 AND xckb036 = 0
      #181113-00041#1---add---e
   END FOREACH
   #170908-00044#1-e add
   
   #170815-00010#1 add-S g_sql 整个重写，在子查询中直接匹配到最佳glcc006,后更新至暂存档
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb2_tmp A ", #用暂存档更新暂存档，故加了别名
               " USING ( ",
               "        SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb036,xckb003,xckb005,xckb006,",
               "               xckb007,xckb008,xckb009,xckb012,xckb015,xckb004,xckb022,imag011,imaf111,",
               "               NVL(NVL(NVL(NVL(NVL(NVL(A,B),C),D),E),F),G) glcc006 ",  #匹配到最佳glcc006(符合agli161设定条件最多的)
               "          FROM (",    #子查询，根据料号等信息匹配到各个glcc006    
               "          SELECT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb036,xckb003,xckb005,xckb006,xckb007,xckb008,xckb009,xckb012,xckb015,xckb004,xckb022,imag011,imaf111,",
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc016 = xckb012 AND glcc015 = xckb015 AND glcc014 = xckb004) A,", #料号、据点、仓库别都匹配（未匹配成本分群、销售分群是因为料号已匹配，料号匹配了对应的分群应当一致）
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc016 = xckb012 AND glcc015 = xckb015 AND glcc014 = '*') B,",     #料号、仓库别匹配，且agli161设定的据点为*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc016 = xckb012 AND glcc015 = '*' AND glcc014 = '*') C,",         #料号匹配，agli161设定的据点、仓库都是*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = imaf111 AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = imag011) D,",  #成本分群、销售分群匹配，料号、据点、仓库为*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = imaf111 AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = '*' AND rownum=1) E,",  #销售分群匹配，料号、据点、仓库、成本分群为* （rownum=1当资料正确的时候，可以不写，防止设定重复）
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = '*' AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = imag011 AND rownum=1) F,",  #成本分群匹配，料号、据点、仓库、销售分群为*
               "                (SELECT glcc006 FROM glcc_t WHERE glccld = xckbld AND glcc001 = '1' AND glccent = xckbent AND glcc012 = '*' AND glcc016 = '*' AND glcc015 = '*' AND glcc014 = '*' AND glcc011 = '*' AND rownum=1) G",       #全匹配--实在找不到了，就用全*的带入
               "           FROM xckb2_tmp,imag_t,imaf_t ",
               #180305-00034#1 mark start -----
               #"          WHERE xckb004 = '",g_comp,"' ", 
               #"            AND xckbld = '",g_master.glaald,"' ",
               ##180305-00034#1 mark end   -----
               "          WHERE xckbld = '",g_master.glaald,"' ",
               "            AND xckb012 = imag001 ",
               "            AND xckb012 = imaf001 ",
               #180305-00034#1 mark start -----
               #"            AND xckb004 = imagsite ",
               #"            AND xckb004 = imafsite ",
               #180305-00034#1 mark end   -----       
               #180305-00034#1 add start -----
               "            AND imagsite = xckbcomp ",
               "            AND imafsite = xckbcomp ",
               "            AND xckbcomp = '",g_comp,"' ",
               #180305-00034#1 add end    -----
               "            AND xckbent = ",g_enterprise,
               "            AND imagent = xckbent ",
               "            AND imafent = xckbent ",
               "               )",
               "       ) B",
               "    ON (B.xckbent = A.xckbent AND B.xckbcomp = A.xckbcomp AND B.xckbld = A.xckbld ", #匹配暂存档的key值，保证一一对应
               "    AND B.xckb001 = A.xckb001 AND B.xckb002 = A.xckb002 AND B.xckb003 = A.xckb003 ",
               "    AND B.xckb005 = A.xckb005 AND B.xckb006 = A.xckb006 AND B.xckb007 = A.xckb007 ",
               "    AND B.xckb008 = A.xckb008 AND B.xckb009 = A.xckb009 AND B.xckb036 = A.xckb036) ",
               "  WHEN MATCHED THEN ",
               "       UPDATE SET A.xckb022 = B.glcc006 "
   #PGS(D)-00824 --- end ---
   #170815-00010#1 add-E
   PREPARE xckb2_pre5 FROM g_sql
   EXECUTE xckb2_pre5
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre5"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   
   #UPDATE xckb_tmp SET xckb022 = ' ' WHERE xckb022 IS NULL  #170808-00050#1 add #180305-00034#1 mark
   UPDATE xckb2_tmp SET xckb022 = ' ' WHERE xckb022 IS NULL  #180305-00034#1 add
   
   #更新成本域    
   IF g_sys_6001 = 'N' THEN
      UPDATE xckb2_tmp 
         SET xckb038 = ' ' 
   ELSE
      CASE g_sys_6002
         WHEN '1'  #组织
            UPDATE xckb2_tmp 
               SET xckb038 = (SELECT xcbf001 FROM xcbf_t
                               WHERE xcbfent  = g_enterprise
                                 AND xcbfcomp = g_comp
                                 AND xcbf002  = xckb004)                    
         WHEN '2'  #仓库
            UPDATE xckb2_tmp 
               SET xckb038 = (SELECT xcbf001 FROM xcbf_t
                               WHERE xcbfent  = g_enterprise
                                 AND xcbfcomp = g_comp
                                 AND xcbf002  = xckb015) 
         WHEN '3' #库存管理特征
            UPDATE xckb2_tmp 
               SET xckb038 = (SELECT xmdl052 FROM xmdl_t
                               WHERE xmdlent  = g_enterprise
                                 AND xmdldocno = xckb005
                                 AND xmdlseq  = xckb006)                      
      END CASE
   END IF    
   #181126-00029#1 add-S
   UPDATE xckb2_tmp 
      SET xckb038 = ' ' 
    WHERE xckb038 IS NULL
   #181126-00029#1 add-E
   #特性
   UPDATE xckb2_tmp 
      SET xckb037 = (SELECT NVL(xmdl009,' ') FROM xmdl_t
                      WHERE xmdlent  = g_enterprise
                        AND xmdldocno = xckb005
                        AND xmdlseq  = xckb006)  

   #170322-00109#1 add--s
   #按料件特性计算成本否
   IF g_sys_6013 = 'N' THEN
      UPDATE xckb2_tmp SET xckb037 = ' '
   END IF
   #170322-00109#1 add--e

  #170214-00060#1 ---mark (s)---                        
  #LET g_sql = " MERGE INTO xckb2_tmp a",
  #            " USING (SELECT xcccld,xccc001,xccc002,xccc004,xccc005,xccc006,xccc007,xccc008, ",
  #            "                xccc280, xccc280a,xccc280b,  ",
  #            "                xccc280c,xccc280d,xccc280e, ",
  #            "                xccc280f,xccc280g,xccc280h  ",
  #            "          FROM xccc_t ",
  #            "         WHERE xcccent = ",g_enterprise,
  #            "           AND xccc001 = '1'",                    #帐套本位币顺序
  #            "           AND xccc003 = '",g_xcat001,"'",      #成本计算类型
  #            "       ) b ",
  #            "    ON (b.xcccld  = a.xckbld AND b.xccc002 = a.xckb038 AND b.xccc004 = xckb007",
  #            "   AND b.xccc005 = xckb008 AND b.xccc006 = a.xckb012 AND b.xccc007 = a.xckb037 AND b.xccc008 = a.xckb017) ",
  #            "  WHEN MATCHED THEN ",
  #            "        UPDATE SET a.xckb101  = b.xccc280, ",
  #            "                   a.xckb101a = b.xccc280a, ",               
  #            "                   a.xckb101b = b.xccc280b, ",               
  #            "                   a.xckb101c = b.xccc280c, ",               
  #            "                   a.xckb101d = b.xccc280d, ",               
  #            "                   a.xckb101e = b.xccc280e, ",               
  #            "                   a.xckb101f = b.xccc280f, ",               
  #            "                   a.xckb101g = b.xccc280g, ",               
  #            "                   a.xckb101h = b.xccc280h "               
  #PREPARE xckb2_pre8 FROM g_sql
  #EXECUTE xckb2_pre8
  #IF SQLCA.sqlcode THEN
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.code   = SQLCA.sqlcode
  #   LET g_errparam.extend = "EXECUTE xckb2_pre8"
  #   LET g_errparam.popup  = TRUE
  #   CALL cl_err()
  #   LET r_success = FALSE
  #   RETURN r_success
  #END IF  
  #170214-00060#1 ---mark (e)--- 
     

  #170214-00060#1 ---add (s)---
#170908-00044#1-s mod 
#   LET g_sql = " MERGE INTO xckb2_tmp a",
#               " USING (SELECT xcccld,xccc001,xccc002,xccc004,xccc005,xccc006,xccc007,xccc008, ",
#               "                xccc280, xccc280a,xccc280b,  ",
#               "                xccc280c,xccc280d,xccc280e, ",
#               "                xccc280f,xccc280g,xccc280h  ",
#               "          FROM xccc_t ",
#               "         WHERE xcccent = ",g_enterprise,
#               "           AND xccc001 = '1'",                    #帐套本位币顺序
#               "           AND xccc003 = '",g_xcat001,"'",        #成本计算类型    
#               "       ) b ",
#               "    ON (b.xcccld  = a.xckbld AND b.xccc002 = a.xckb038 AND b.xccc004 = xckb007",
#               "   AND b.xccc005 = xckb008 AND b.xccc006 = a.xckb012 AND b.xccc007 = a.xckb037 AND b.xccc008 = a.xckb017) ",
#               "  WHEN MATCHED THEN ",
#               "        UPDATE SET a.xckb101  = b.xccc280, ",
#               "                   a.xckb101a = b.xccc280a, ",               
#               "                   a.xckb101b = b.xccc280b, ",               
#               "                   a.xckb101c = b.xccc280c, ",               
#               "                   a.xckb101d = b.xccc280d, ",               
#               "                   a.xckb101e = b.xccc280e, ",               
#               "                   a.xckb101f = b.xccc280f, ",               
#               "                   a.xckb101g = b.xccc280g, ",               
#               "                   a.xckb101h = b.xccc280h "               
#  抓成本時，依批次成本或非批次成本取值，差異在於xccc008要用空白或實際批號取成本單價
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb2_tmp a",
               " USING (SELECT xcccld,xccc001,xccc002,xccc004,xccc005,xccc006,xccc007,xccc008, ",
               "               xccc280, xccc280a,xccc280b,  ",
               "               xccc280c,xccc280d,xccc280e, ",
               "               xccc280f,xccc280g,xccc280h  ",
               "          FROM xccc_t ",
               "         WHERE xcccent = ",g_enterprise,
               "           AND xccc001 = '1'",                    #帐套本位币顺序
               "           AND xccc003 = '",g_xcat001,"'",        #成本计算类型
               "       ) b "
   IF l_xcat005 = '3' THEN
      LET g_sql = g_sql CLIPPED,
                  " ON (b.xcccld  = a.xckbld AND b.xccc002 = a.xckb038 AND b.xccc004 = xckb007",
                  "     AND b.xccc005 = xckb008 AND b.xccc006 = a.xckb012 AND b.xccc007 = a.xckb037 AND b.xccc008 = a.xckb017) "
   ELSE
      LET g_sql = g_sql CLIPPED,
                  " ON (b.xcccld  = a.xckbld AND b.xccc002 = a.xckb038 AND b.xccc004 = xckb007",
                  "     AND b.xccc005 = xckb008 AND b.xccc006 = a.xckb012 AND b.xccc007 = a.xckb037 AND b.xccc008 = ' ') "
   END IF
   LET g_sql = g_sql CLIPPED,
               "  WHEN MATCHED THEN ",
               "        UPDATE SET a.xckb101  = b.xccc280,",
               "                   a.xckb101a = b.xccc280a,",               
               "                   a.xckb101b = b.xccc280b,",               
               "                   a.xckb101c = b.xccc280c,",               
               "                   a.xckb101d = b.xccc280d,",               
               "                   a.xckb101e = b.xccc280e,",               
               "                   a.xckb101f = b.xccc280f,",               
               "                   a.xckb101g = b.xccc280g,",               
               "                   a.xckb101h = b.xccc280h"
   #PGS(D)-00824 --- end ---
   
   #170908-00044#1-e mod                
   PREPARE xckb2_pre8 FROM g_sql
   EXECUTE xckb2_pre8
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre8"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   IF l_xcat005 = '3' THEN #171013-00013#1 add
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb2_tmp a",
                  " USING (SELECT distinct xckbent,xckbcomp,xckbld,xckb005,xckb006,xckb036,", #170426-00037#1 add add xckb036
                  "               xckb101, xckb101a,xckb101b,  ",
                  "               xckb101c,xckb101d,xckb101e, ",
                  "               xckb101f,xckb101g,xckb101h  ",
                  "          FROM xckb_t ",
                  "         WHERE xckbent = ",g_enterprise,
                  "           AND xckb002 = 1 ",
                  "       ) b ",
                  "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld AND ",
                  "        a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb036 = b.xckb036) ",  #170426-00037#1 add add xckb036
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xckb101, ",
                  "                   a.xckb101a = b.xckb101a, ",               
                  "                   a.xckb101b = b.xckb101b, ",               
                  "                   a.xckb101c = b.xckb101c, ",               
                  "                   a.xckb101d = b.xckb101d, ",               
                  "                   a.xckb101e = b.xckb101e, ",               
                  "                   a.xckb101f = b.xckb101f, ",               
                  "                   a.xckb101g = b.xckb101g, ",               
                  "                   a.xckb101h = b.xckb101h "
      #PGS(D)-00824 --- end ---
   #171013-00013#1 add (s)
   ELSE
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb2_tmp a",
                  " USING (SELECT distinct xckbent,xckbcomp,xckbld,xckb005,xckb006,", 
                  "               xckb101, xckb101a,xckb101b,  ",
                  "               xckb101c,xckb101d,xckb101e, ",
                  "               xckb101f,xckb101g,xckb101h  ",
                  "          FROM xckb_t ",
                  "         WHERE xckbent = ",g_enterprise,
                  "           AND xckb002 = 1 ",
                  "       ) b ",
                  "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld AND ",
                  "        a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 ) ",  
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xckb101, ",
                  "                   a.xckb101a = b.xckb101a, ",               
                  "                   a.xckb101b = b.xckb101b, ",               
                  "                   a.xckb101c = b.xckb101c, ",               
                  "                   a.xckb101d = b.xckb101d, ",               
                  "                   a.xckb101e = b.xckb101e, ",               
                  "                   a.xckb101f = b.xckb101f, ",               
                  "                   a.xckb101g = b.xckb101g, ",               
                  "                   a.xckb101h = b.xckb101h "
      #PGS(D)-00824 --- end ---
   END IF
   #171013-00013#1 add (e)
 
   PREPARE xckb2_pre81 FROM g_sql
   EXECUTE xckb2_pre81
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre81"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF  

   IF l_xcat005 = '3' THEN #171013-00013#1 add   
      ## 同月份的處理 from xckb_tmp
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb2_tmp a",
                  " USING (SELECT distinct xckbent,xckbcomp,xckbld,xckb005,xckb006,xckb036,", #170426-00037#1 add add xckb036
                  "               xckb101, xckb101a,xckb101b,  ",
                  "               xckb101c,xckb101d,xckb101e, ",
                  "               xckb101f,xckb101g,xckb101h  ",
                  "          FROM xckb_tmp ",
                  "         WHERE xckbent = ",g_enterprise,
                  "           AND xckb002 = 1 ",
                  "       ) b ",
                  "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld AND ",
                  "        a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb036 = b.xckb036) ",  #170426-00037#1 add add xckb036
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xckb101, ",
                  "                   a.xckb101a = b.xckb101a, ",               
                  "                   a.xckb101b = b.xckb101b, ",               
                  "                   a.xckb101c = b.xckb101c, ",               
                  "                   a.xckb101d = b.xckb101d, ",               
                  "                   a.xckb101e = b.xckb101e, ",               
                  "                   a.xckb101f = b.xckb101f, ",               
                  "                   a.xckb101g = b.xckb101g, ",               
                  "                   a.xckb101h = b.xckb101h "
      #PGS(D)-00824 --- end ---
   #171013-00013#1 add (s)
   ELSE
      #PGS(D)-00824 ---start---
      LET g_sql = " MERGE INTO xckb2_tmp a",
                  " USING (SELECT distinct xckbent,xckbcomp,xckbld,xckb005,xckb006,xckb038,",  #190328-00054#1 add xckb038
                  "               xckb101, xckb101a,xckb101b,  ",
                  "               xckb101c,xckb101d,xckb101e, ",
                  "               xckb101f,xckb101g,xckb101h  ",
                  "          FROM xckb_tmp ",
                  "         WHERE xckbent = ",g_enterprise,
                  "           AND xckb002 = 1 ",
                  "       ) b ",
                  "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld AND ",
                  "        a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb038 = b.xckb038 ) ",   #190328-00054#1 add xckb038 
                  "  WHEN MATCHED THEN ",
                  "        UPDATE SET a.xckb101  = b.xckb101, ",
                  "                   a.xckb101a = b.xckb101a, ",               
                  "                   a.xckb101b = b.xckb101b, ",               
                  "                   a.xckb101c = b.xckb101c, ",               
                  "                   a.xckb101d = b.xckb101d, ",               
                  "                   a.xckb101e = b.xckb101e, ",               
                  "                   a.xckb101f = b.xckb101f, ",               
                  "                   a.xckb101g = b.xckb101g, ",               
                  "                   a.xckb101h = b.xckb101h "
      #PGS(D)-00824 --- end ---
   END IF
   #171013-00013#1 add (e)
      
   PREPARE xckb2_pre82 FROM g_sql
   EXECUTE xckb2_pre82
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre82"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
  #170214-00060#1 ---add (e)--- 
   
   UPDATE xckb2_tmp
      SET xckb102 =  xckb101  * xckb021,
          xckb102a = xckb101a * xckb021,
          xckb102b = xckb101b * xckb021,
          xckb102c = xckb101c * xckb021,
          xckb102d = xckb101d * xckb021,
          xckb102e = xckb101e * xckb021,
          xckb102f = xckb101f * xckb021,
          xckb102g = xckb101g * xckb021,
          xckb102h = xckb101h * xckb021   
   #币种一进行取位
   CASE g_round_type
      WHEN '1'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb102  = round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102a = round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102b = round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102c = round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102d = round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102e = round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102f = round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102g = round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,"), ",         
                     "        xckb102h = round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,") "          
      WHEN '2'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb102  = (CASE WHEN MOD(round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                     "        xckb102a  = (CASE WHEN MOD(round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                     "        xckb102b  = (CASE WHEN MOD(round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102c  = (CASE WHEN MOD(round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102d  = (CASE WHEN MOD(round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102e  = (CASE WHEN MOD(round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102f  = (CASE WHEN MOD(round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102g  = (CASE WHEN MOD(round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                     "        xckb102h  = (CASE WHEN MOD(round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
      WHEN '3'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb102  = trunc(round(COALESCE(xckb102,0),6),",g_ooaj007_1,"),  ",
                     "        xckb102a = trunc(round(COALESCE(xckb102a,0),6),",g_ooaj007_1,"), ",
                     "        xckb102b = trunc(round(COALESCE(xckb102b,0),6),",g_ooaj007_1,"), ",
                     "        xckb102c = trunc(round(COALESCE(xckb102c,0),6),",g_ooaj007_1,"), ",
                     "        xckb102d = trunc(round(COALESCE(xckb102d,0),6),",g_ooaj007_1,"), ",
                     "        xckb102e = trunc(round(COALESCE(xckb102e,0),6),",g_ooaj007_1,"), ",
                     "        xckb102f = trunc(round(COALESCE(xckb102f,0),6),",g_ooaj007_1,"), ",
                     "        xckb102g = trunc(round(COALESCE(xckb102g,0),6),",g_ooaj007_1,"), ",
                     "        xckb102h = trunc(round(COALESCE(xckb102h,0),6),",g_ooaj007_1,") "
      WHEN '4'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb102  = ceil(round(COALESCE(xckb102,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                     "        xckb102a = ceil(round(COALESCE(xckb102a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102b = ceil(round(COALESCE(xckb102b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102c = ceil(round(COALESCE(xckb102c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102d = ceil(round(COALESCE(xckb102d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102e = ceil(round(COALESCE(xckb102e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102f = ceil(round(COALESCE(xckb102f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102g = ceil(round(COALESCE(xckb102g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                     "        xckb102h = ceil(round(COALESCE(xckb102h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
   END CASE
   PREPARE xckb2_pre10 FROM g_sql
   EXECUTE xckb2_pre10
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_pre10"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #170606-00027#1---add---s
   #修正xckb102的值-先修至xckb102a,若xckb102a為零,則修正xckb102b......
   #180925-00065#1---mod---s
   #UPDATE xckb2_tmp SET xckb102a = xckb102 - (xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)   
   # WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
   #   #AND xckb102 - (xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h) <> 0    #170824-00029#1 mark
   #   AND s_math_abs(xckb102a) >= s_math_abs(xckb102b) AND s_math_abs(xckb102a) >= s_math_abs(xckb102c)   #170824-00029#1 add abs
   #   AND s_math_abs(xckb102a) >= s_math_abs(xckb102d) AND s_math_abs(xckb102a) >= s_math_abs(xckb102e)   #170824-00029#1 add abs
   #   AND s_math_abs(xckb102a) >= s_math_abs(xckb102f) AND s_math_abs(xckb102a) >= s_math_abs(xckb102g)   #170824-00029#1 add abs
   #   AND s_math_abs(xckb102a) >= s_math_abs(xckb102h)                                                    #170824-00029#1 add abs
   #   
   #UPDATE xckb2_tmp SET xckb102b = xckb102 - (xckb102a + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
   # WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
   #   #AND xckb102 - (xckb102a + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
   #   AND s_math_abs(xckb102b) >= s_math_abs(xckb102c)                                                   #170824-00029#1 add abs
   #   AND s_math_abs(xckb102b) >= s_math_abs(xckb102d) AND s_math_abs(xckb102b) >= s_math_abs(xckb102e)  #170824-00029#1 add abs
   #   AND s_math_abs(xckb102b) >= s_math_abs(xckb102f) AND s_math_abs(xckb102b) >= s_math_abs(xckb102g)  #170824-00029#1 add abs
   #   AND s_math_abs(xckb102b) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs
   #
   #UPDATE xckb2_tmp SET xckb102c = xckb102 - (xckb102a + xckb102b + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
   # WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
   #   #AND xckb102 - (xckb102a + xckb102b + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
   #   AND s_math_abs(xckb102c) >= s_math_abs(xckb102d) AND s_math_abs(xckb102c) >= s_math_abs(xckb102e)  #170824-00029#1 add abs
   #   AND s_math_abs(xckb102c) >= s_math_abs(xckb102f) AND s_math_abs(xckb102c) >= s_math_abs(xckb102g)  #170824-00029#1 add abs
   #   AND s_math_abs(xckb102c) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs      
   #
   #UPDATE xckb2_tmp SET xckb102d = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102e + xckb102f + xckb102g + xckb102h)  
   # WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
   #   #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102e + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
   #   AND s_math_abs(xckb102d) >= s_math_abs(xckb102e)                                                   #170824-00029#1 add abs
   #   AND s_math_abs(xckb102d) >= s_math_abs(xckb102f) AND s_math_abs(xckb102d) >= s_math_abs(xckb102g)
   #   AND s_math_abs(xckb102d) >= s_math_abs(xckb102h)                                                    #170824-00029#1 add abs        
   #
   #UPDATE xckb2_tmp SET xckb102e = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102f + xckb102g + xckb102h)  
   # WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
   #   #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102f + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
   #   AND s_math_abs(xckb102e) >= s_math_abs(xckb102f) AND s_math_abs(xckb102e) >= s_math_abs(xckb102g)  #170824-00029#1 add abs
   #   AND s_math_abs(xckb102e) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs         
   #
   #UPDATE xckb2_tmp SET xckb102f = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102g + xckb102h)  
   # WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
   #   #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102g + xckb102h) <> 0   #170824-00029#1 mark
   #   AND s_math_abs(xckb102f) >= s_math_abs(xckb102g)                                                   #170824-00029#1 add abs
   #   AND s_math_abs(xckb102f) >= s_math_abs(xckb102h)                                                   #170824-00029#1 add abs       
   #
   #UPDATE xckb2_tmp SET xckb102g = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102h)  
   # WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
   #   #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102h) <> 0  #170824-00029#1 mark
   #   AND s_math_abs(xckb102g) >= s_math_abs(xckb102h)                                                  #170824-00029#1 add abs        

   UPDATE xckb2_tmp SET xckb102a = xckb102 - (xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)   
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102a) >= ABS(xckb102b) AND ABS(xckb102a) >= ABS(xckb102c)   
      AND ABS(xckb102a) >= ABS(xckb102d) AND ABS(xckb102a) >= ABS(xckb102e)   
      AND ABS(xckb102a) >= ABS(xckb102f) AND ABS(xckb102a) >= ABS(xckb102g)   
      AND ABS(xckb102a) >= ABS(xckb102h)                                                    
      
   UPDATE xckb2_tmp SET xckb102b = xckb102 - (xckb102a + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102b) >= ABS(xckb102c)                                                   
      AND ABS(xckb102b) >= ABS(xckb102d) AND ABS(xckb102b) >= ABS(xckb102e)  
      AND ABS(xckb102b) >= ABS(xckb102f) AND ABS(xckb102b) >= ABS(xckb102g)  
      AND ABS(xckb102b) >= ABS(xckb102h)                                                   
 
   UPDATE xckb2_tmp SET xckb102c = xckb102 - (xckb102a + xckb102b + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102c) >= ABS(xckb102d) AND ABS(xckb102c) >= ABS(xckb102e)  
      AND ABS(xckb102c) >= ABS(xckb102f) AND ABS(xckb102c) >= ABS(xckb102g)  
      AND ABS(xckb102c) >= ABS(xckb102h)                                                       

   UPDATE xckb2_tmp SET xckb102d = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102e + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102d) >= ABS(xckb102e)                                                   
      AND ABS(xckb102d) >= ABS(xckb102f) AND ABS(xckb102d) >= ABS(xckb102g)
      AND ABS(xckb102d) >= ABS(xckb102h)                                                          
 
   UPDATE xckb2_tmp SET xckb102e = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102f + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102e) >= ABS(xckb102f) AND ABS(xckb102e) >= ABS(xckb102g) 
      AND ABS(xckb102e) >= ABS(xckb102h)                                                       
 
   UPDATE xckb2_tmp SET xckb102f = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102g + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102f) >= ABS(xckb102g)                                                   
      AND ABS(xckb102f) >= ABS(xckb102h)                                                          

   UPDATE xckb2_tmp SET xckb102g = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102h)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      AND ABS(xckb102g) >= ABS(xckb102h)                                                    
   #180925-00065#1---mod---e
   UPDATE xckb2_tmp SET xckb102h = xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g)  
    WHERE xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
      #AND xckb102 - (xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g) <> 0   #170824-00029#1 mark    
   #170606-00027#1---add---e	   
   IF g_glaa015 = 'Y' THEN  #啟用本位幣二
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa016,1,g_glaa018) RETURNING l_ext1            #金額
      UPDATE xckb2_tmp
         SET xckb028 = g_glaa016,
             xckb029 = xckb027 * l_ext1,
             xckb111 =  xckb101 * l_ext1,
             xckb111a = xckb101a * l_ext1,
             xckb111b = xckb101b * l_ext1,
             xckb111c = xckb101c * l_ext1,
             xckb111d = xckb101d * l_ext1,
             xckb111e = xckb101e * l_ext1,
             xckb111f = xckb101f * l_ext1,
             xckb111g = xckb101g * l_ext1,
             xckb111h = xckb101h * l_ext1
      #币种二单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb111  = round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111a = round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111b = round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111c = round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111d = round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111e = round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111f = round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111g = round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb111h = round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb111  = (CASE WHEN MOD(round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb111a  = (CASE WHEN MOD(round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb111b  = (CASE WHEN MOD(round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111c  = (CASE WHEN MOD(round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111d  = (CASE WHEN MOD(round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111e  = (CASE WHEN MOD(round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111f  = (CASE WHEN MOD(round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111g  = (CASE WHEN MOD(round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb111h  = (CASE WHEN MOD(round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb111  = trunc(round(COALESCE(xckb111,0),6),",g_ooaj007_1,"),  ",
                        "        xckb111a = trunc(round(COALESCE(xckb111a,0),6),",g_ooaj007_1,"), ",
                        "        xckb111b = trunc(round(COALESCE(xckb111b,0),6),",g_ooaj007_1,"), ",
                        "        xckb111c = trunc(round(COALESCE(xckb111c,0),6),",g_ooaj007_1,"), ",
                        "        xckb111d = trunc(round(COALESCE(xckb111d,0),6),",g_ooaj007_1,"), ",
                        "        xckb111e = trunc(round(COALESCE(xckb111e,0),6),",g_ooaj007_1,"), ",
                        "        xckb111f = trunc(round(COALESCE(xckb111f,0),6),",g_ooaj007_1,"), ",
                        "        xckb111g = trunc(round(COALESCE(xckb111g,0),6),",g_ooaj007_1,"), ",
                        "        xckb111h = trunc(round(COALESCE(xckb111h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb111  = ceil(round(COALESCE(xckb111,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb111a = ceil(round(COALESCE(xckb111a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111b = ceil(round(COALESCE(xckb111b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111c = ceil(round(COALESCE(xckb111c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111d = ceil(round(COALESCE(xckb111d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111e = ceil(round(COALESCE(xckb111e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111f = ceil(round(COALESCE(xckb111f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111g = ceil(round(COALESCE(xckb111g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb111h = ceil(round(COALESCE(xckb111h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE   
      PREPARE xckb2_pre11 FROM g_sql
      EXECUTE xckb2_pre11 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb2_pre11"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF       
      UPDATE xckb2_tmp
         SET xckb112 =  xckb111  * xckb021,
             xckb112a = xckb111a * xckb021,
             xckb112b = xckb111b * xckb021,
             xckb112c = xckb111c * xckb021,
             xckb112d = xckb111d * xckb021,
             xckb112e = xckb111e * xckb021,
             xckb112f = xckb111f * xckb021,
             xckb112g = xckb111g * xckb021,
             xckb112h = xckb111h * xckb021 
      #币种二金额进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb112  = round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112a = round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112b = round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112c = round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112d = round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112e = round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112f = round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112g = round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb112h = round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb112  = (CASE WHEN MOD(round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb112a  = (CASE WHEN MOD(round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb112b  = (CASE WHEN MOD(round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112c  = (CASE WHEN MOD(round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112d  = (CASE WHEN MOD(round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112e  = (CASE WHEN MOD(round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112f  = (CASE WHEN MOD(round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112g  = (CASE WHEN MOD(round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb112h  = (CASE WHEN MOD(round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb112  = trunc(round(COALESCE(xckb112,0),6),",g_ooaj007_1,"),  ",
                        "        xckb112a = trunc(round(COALESCE(xckb112a,0),6),",g_ooaj007_1,"), ",
                        "        xckb112b = trunc(round(COALESCE(xckb112b,0),6),",g_ooaj007_1,"), ",
                        "        xckb112c = trunc(round(COALESCE(xckb112c,0),6),",g_ooaj007_1,"), ",
                        "        xckb112d = trunc(round(COALESCE(xckb112d,0),6),",g_ooaj007_1,"), ",
                        "        xckb112e = trunc(round(COALESCE(xckb112e,0),6),",g_ooaj007_1,"), ",
                        "        xckb112f = trunc(round(COALESCE(xckb112f,0),6),",g_ooaj007_1,"), ",
                        "        xckb112g = trunc(round(COALESCE(xckb112g,0),6),",g_ooaj007_1,"), ",
                        "        xckb112h = trunc(round(COALESCE(xckb112h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb112  = ceil(round(COALESCE(xckb112,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb112a = ceil(round(COALESCE(xckb112a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112b = ceil(round(COALESCE(xckb112b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112c = ceil(round(COALESCE(xckb112c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112d = ceil(round(COALESCE(xckb112d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112e = ceil(round(COALESCE(xckb112e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112f = ceil(round(COALESCE(xckb112f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112g = ceil(round(COALESCE(xckb112g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb112h = ceil(round(COALESCE(xckb112h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE  
      PREPARE xckb2_pre12 FROM g_sql
      EXECUTE xckb2_pre12 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb2_pre12"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF 
      #170606-00027#1---add---s
      #修正xckb112的值-先修至xckb112a,若xckb112a為零,則修正xckb112b......
      #180925-00065#1---mod---s
      #UPDATE xckb2_tmp SET xckb112a = xckb112 - (xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)   
      # WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
      #   #AND xckb112 - (xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h) <> 0    #170824-00029#1 mark
      #   AND s_math_abs(xckb112a) >= s_math_abs(xckb112b) AND s_math_abs(xckb112a) >= s_math_abs(xckb112c)   #170824-00029#1 add abs
      #   AND s_math_abs(xckb112a) >= s_math_abs(xckb112d) AND s_math_abs(xckb112a) >= s_math_abs(xckb112e)   #170824-00029#1 add abs
      #   AND s_math_abs(xckb112a) >= s_math_abs(xckb112f) AND s_math_abs(xckb112a) >= s_math_abs(xckb112g)   #170824-00029#1 add abs
      #   AND s_math_abs(xckb112a) >= s_math_abs(xckb112h)                                                    #170824-00029#1 add abs
      #   
      #UPDATE xckb2_tmp SET xckb112b = xckb112 - (xckb112a + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
      # WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
      #   #AND xckb112 - (xckb112a + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb112b) >= s_math_abs(xckb112c)                                                   #170824-00029#1 add abs
      #   AND s_math_abs(xckb112b) >= s_math_abs(xckb112d) AND s_math_abs(xckb112b) >= s_math_abs(xckb112e)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb112b) >= s_math_abs(xckb112f) AND s_math_abs(xckb112b) >= s_math_abs(xckb112g)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb112b) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs
      #
      #UPDATE xckb2_tmp SET xckb112c = xckb112 - (xckb112a + xckb112b + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
      # WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
      #   #AND xckb112 - (xckb112a + xckb112b + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb112c) >= s_math_abs(xckb112d) AND s_math_abs(xckb112c) >= s_math_abs(xckb112e)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb112c) >= s_math_abs(xckb112f) AND s_math_abs(xckb112c) >= s_math_abs(xckb112g)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb112c) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs      
      #
      #UPDATE xckb2_tmp SET xckb112d = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112e + xckb112f + xckb112g + xckb112h)  
      # WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
      #   #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112e + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb112d) >= s_math_abs(xckb112e)                                                   #170824-00029#1 add abs
      #   AND s_math_abs(xckb112d) >= s_math_abs(xckb112f) AND s_math_abs(xckb112d) >= s_math_abs(xckb112g)
      #   AND s_math_abs(xckb112d) >= s_math_abs(xckb112h)                                                    #170824-00029#1 add abs        
      #
      #UPDATE xckb2_tmp SET xckb112e = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112f + xckb112g + xckb112h)  
      # WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
      #   #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112f + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb112e) >= s_math_abs(xckb112f) AND s_math_abs(xckb112e) >= s_math_abs(xckb112g)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb112e) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs         
      #
      #UPDATE xckb2_tmp SET xckb112f = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112g + xckb112h)  
      # WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
      #   #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112g + xckb112h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb112f) >= s_math_abs(xckb112g)                                                   #170824-00029#1 add abs
      #   AND s_math_abs(xckb112f) >= s_math_abs(xckb112h)                                                   #170824-00029#1 add abs       
      #
      #UPDATE xckb2_tmp SET xckb112g = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112h)  
      # WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
      #   #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112h) <> 0  #170824-00029#1 mark
      #   AND s_math_abs(xckb112g) >= s_math_abs(xckb112h)                                                  #170824-00029#1 add abs        

      UPDATE xckb2_tmp SET xckb112a = xckb112 - (xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)   
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112a) >= ABS(xckb112b) AND ABS(xckb112a) >= ABS(xckb112c)   
         AND ABS(xckb112a) >= ABS(xckb112d) AND ABS(xckb112a) >= ABS(xckb112e)   
         AND ABS(xckb112a) >= ABS(xckb112f) AND ABS(xckb112a) >= ABS(xckb112g)   
         AND ABS(xckb112a) >= ABS(xckb112h)                                                    
         
      UPDATE xckb2_tmp SET xckb112b = xckb112 - (xckb112a + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112b) >= ABS(xckb112c)                                                   
         AND ABS(xckb112b) >= ABS(xckb112d) AND ABS(xckb112b) >= ABS(xckb112e)  
         AND ABS(xckb112b) >= ABS(xckb112f) AND ABS(xckb112b) >= ABS(xckb112g)  
         AND ABS(xckb112b) >= ABS(xckb112h)                                                   
    
      UPDATE xckb2_tmp SET xckb112c = xckb112 - (xckb112a + xckb112b + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112c) >= ABS(xckb112d) AND ABS(xckb112c) >= ABS(xckb112e)  
         AND ABS(xckb112c) >= ABS(xckb112f) AND ABS(xckb112c) >= ABS(xckb112g)  
         AND ABS(xckb112c) >= ABS(xckb112h)                                                       
   
      UPDATE xckb2_tmp SET xckb112d = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112e + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112d) >= ABS(xckb112e)                                                   
         AND ABS(xckb112d) >= ABS(xckb112f) AND ABS(xckb112d) >= ABS(xckb112g)
         AND ABS(xckb112d) >= ABS(xckb112h)                                                          
    
      UPDATE xckb2_tmp SET xckb112e = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112f + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112e) >= ABS(xckb112f) AND ABS(xckb112e) >= ABS(xckb112g) 
         AND ABS(xckb112e) >= ABS(xckb112h)                                                       
    
      UPDATE xckb2_tmp SET xckb112f = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112g + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112f) >= ABS(xckb112g)                                                   
         AND ABS(xckb112f) >= ABS(xckb112h)                                                          
   
      UPDATE xckb2_tmp SET xckb112g = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112h)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         AND ABS(xckb112g) >= ABS(xckb112h)                                                    
      #180925-00065#1---mod---e
      UPDATE xckb2_tmp SET xckb112h = xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g)  
       WHERE xckb112 <> xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g + xckb112h
         #AND xckb112 - (xckb112a + xckb112b + xckb112c + xckb112d + xckb112e + xckb112f + xckb112g) <> 0   #170824-00029#1 mark    
      #170606-00027#1---add---e	      
   END IF
   
   IF g_glaa019 = 'Y' THEN  #啟用本位幣三
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa020,1,g_glaa022) RETURNING l_ext2            #金額
      UPDATE xckb2_tmp
         SET xckb030 = g_glaa020,
             xckb031 =  xckb027 * l_ext2,
             xckb121 =  xckb101 * l_ext2,
             xckb121a = xckb101a * l_ext2,
             xckb121b = xckb101b * l_ext2,
             xckb121c = xckb101c * l_ext2,
             xckb121d = xckb101d * l_ext2,
             xckb121e = xckb101e * l_ext2,
             xckb121f = xckb101f * l_ext2,
             xckb121g = xckb101g * l_ext2,
             xckb121h = xckb101h * l_ext2
      #币种三单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb121  = round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121a = round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121b = round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121c = round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121d = round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121e = round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121f = round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121g = round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb121h = round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb121  = (CASE WHEN MOD(round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb121a  = (CASE WHEN MOD(round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb121b  = (CASE WHEN MOD(round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121c  = (CASE WHEN MOD(round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121d  = (CASE WHEN MOD(round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121e  = (CASE WHEN MOD(round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121f  = (CASE WHEN MOD(round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121g  = (CASE WHEN MOD(round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb121h  = (CASE WHEN MOD(round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb121  = trunc(round(COALESCE(xckb121,0),6),",g_ooaj007_1,"),  ",
                        "        xckb121a = trunc(round(COALESCE(xckb121a,0),6),",g_ooaj007_1,"), ",
                        "        xckb121b = trunc(round(COALESCE(xckb121b,0),6),",g_ooaj007_1,"), ",
                        "        xckb121c = trunc(round(COALESCE(xckb121c,0),6),",g_ooaj007_1,"), ",
                        "        xckb121d = trunc(round(COALESCE(xckb121d,0),6),",g_ooaj007_1,"), ",
                        "        xckb121e = trunc(round(COALESCE(xckb121e,0),6),",g_ooaj007_1,"), ",
                        "        xckb121f = trunc(round(COALESCE(xckb121f,0),6),",g_ooaj007_1,"), ",
                        "        xckb121g = trunc(round(COALESCE(xckb121g,0),6),",g_ooaj007_1,"), ",
                        "        xckb121h = trunc(round(COALESCE(xckb121h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb121  = ceil(round(COALESCE(xckb121,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb121a = ceil(round(COALESCE(xckb121a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121b = ceil(round(COALESCE(xckb121b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121c = ceil(round(COALESCE(xckb121c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121d = ceil(round(COALESCE(xckb121d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121e = ceil(round(COALESCE(xckb121e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121f = ceil(round(COALESCE(xckb121f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121g = ceil(round(COALESCE(xckb121g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb121h = ceil(round(COALESCE(xckb121h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE 
      PREPARE xckb2_pre13 FROM g_sql
      EXECUTE xckb2_pre13 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb2_pre13"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF       
      UPDATE xckb2_tmp
         SET xckb122 =  xckb121  * xckb021,
             xckb122a = xckb121a * xckb021,
             xckb122b = xckb121b * xckb021,
             xckb122c = xckb121c * xckb021,
             xckb122d = xckb121d * xckb021,
             xckb122e = xckb121e * xckb021,
             xckb122f = xckb121f * xckb021,
             xckb122g = xckb121g * xckb021,
             xckb122h = xckb121h * xckb021 
      #币种三金额进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb122  = round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122a = round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122b = round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122c = round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122d = round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122e = round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122f = round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122g = round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,"), ",         
                        "        xckb122h = round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,") "          
         WHEN '2'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb122  = (CASE WHEN MOD(round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb122a  = (CASE WHEN MOD(round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ", 
                        "        xckb122b  = (CASE WHEN MOD(round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122c  = (CASE WHEN MOD(round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122d  = (CASE WHEN MOD(round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122e  = (CASE WHEN MOD(round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122f  = (CASE WHEN MOD(round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122g  = (CASE WHEN MOD(round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ), ",
                        "        xckb122h  = (CASE WHEN MOD(round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                     
         WHEN '3'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb122  = trunc(round(COALESCE(xckb122,0),6),",g_ooaj007_1,"),  ",
                        "        xckb122a = trunc(round(COALESCE(xckb122a,0),6),",g_ooaj007_1,"), ",
                        "        xckb122b = trunc(round(COALESCE(xckb122b,0),6),",g_ooaj007_1,"), ",
                        "        xckb122c = trunc(round(COALESCE(xckb122c,0),6),",g_ooaj007_1,"), ",
                        "        xckb122d = trunc(round(COALESCE(xckb122d,0),6),",g_ooaj007_1,"), ",
                        "        xckb122e = trunc(round(COALESCE(xckb122e,0),6),",g_ooaj007_1,"), ",
                        "        xckb122f = trunc(round(COALESCE(xckb122f,0),6),",g_ooaj007_1,"), ",
                        "        xckb122g = trunc(round(COALESCE(xckb122g,0),6),",g_ooaj007_1,"), ",
                        "        xckb122h = trunc(round(COALESCE(xckb122h,0),6),",g_ooaj007_1,") "
         WHEN '4'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb122  = ceil(round(COALESCE(xckb122,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"),  ",
                        "        xckb122a = ceil(round(COALESCE(xckb122a,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122b = ceil(round(COALESCE(xckb122b,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122c = ceil(round(COALESCE(xckb122c,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122d = ceil(round(COALESCE(xckb122d,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122e = ceil(round(COALESCE(xckb122e,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122f = ceil(round(COALESCE(xckb122f,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122g = ceil(round(COALESCE(xckb122g,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,"), ",
                        "        xckb122h = ceil(round(COALESCE(xckb122h,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE  
      PREPARE xckb2_pre14 FROM g_sql
      EXECUTE xckb2_pre14 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb2_pre14"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF 
      #170606-00027#1---add---s
      #修正xckb122的值-先修至xckb122a,若xckb122a為零,則修正xckb122b......
      #180925-00065#1---mod---s
      #UPDATE xckb2_tmp SET xckb122a = xckb122 - (xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)   
      # WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
      #   #AND xckb122 - (xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h) <> 0    #170824-00029#1 mark
      #   AND s_math_abs(xckb122a) >= s_math_abs(xckb122b) AND s_math_abs(xckb122a) >= s_math_abs(xckb122c)   #170824-00029#1 add abs
      #   AND s_math_abs(xckb122a) >= s_math_abs(xckb122d) AND s_math_abs(xckb122a) >= s_math_abs(xckb122e)   #170824-00029#1 add abs
      #   AND s_math_abs(xckb122a) >= s_math_abs(xckb122f) AND s_math_abs(xckb122a) >= s_math_abs(xckb122g)   #170824-00029#1 add abs
      #   AND s_math_abs(xckb122a) >= s_math_abs(xckb122h)                                                    #170824-00029#1 add abs
      #   
      #UPDATE xckb2_tmp SET xckb122b = xckb122 - (xckb122a + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
      # WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
      #   #AND xckb122 - (xckb122a + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb122b) >= s_math_abs(xckb122c)                                                   #170824-00029#1 add abs
      #   AND s_math_abs(xckb122b) >= s_math_abs(xckb122d) AND s_math_abs(xckb122b) >= s_math_abs(xckb122e)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb122b) >= s_math_abs(xckb122f) AND s_math_abs(xckb122b) >= s_math_abs(xckb122g)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb122b) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs
      #
      #UPDATE xckb2_tmp SET xckb122c = xckb122 - (xckb122a + xckb122b + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
      # WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
      #   #AND xckb122 - (xckb122a + xckb122b + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb122c) >= s_math_abs(xckb122d) AND s_math_abs(xckb122c) >= s_math_abs(xckb122e)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb122c) >= s_math_abs(xckb122f) AND s_math_abs(xckb122c) >= s_math_abs(xckb122g)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb122c) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs      
      #
      #UPDATE xckb2_tmp SET xckb122d = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122e + xckb122f + xckb122g + xckb122h)  
      # WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
      #   #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122e + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb122d) >= s_math_abs(xckb122e)                                                   #170824-00029#1 add abs
      #   AND s_math_abs(xckb122d) >= s_math_abs(xckb122f) AND s_math_abs(xckb122d) >= s_math_abs(xckb122g)
      #   AND s_math_abs(xckb122d) >= s_math_abs(xckb122h)                                                    #170824-00029#1 add abs        
      #
      #UPDATE xckb2_tmp SET xckb122e = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122f + xckb122g + xckb122h)  
      # WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
      #   #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122f + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb122e) >= s_math_abs(xckb122f) AND s_math_abs(xckb122e) >= s_math_abs(xckb122g)  #170824-00029#1 add abs
      #   AND s_math_abs(xckb122e) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs         
      #
      #UPDATE xckb2_tmp SET xckb122f = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122g + xckb122h)  
      # WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
      #   #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122g + xckb122h) <> 0   #170824-00029#1 mark
      #   AND s_math_abs(xckb122f) >= s_math_abs(xckb122g)                                                   #170824-00029#1 add abs
      #   AND s_math_abs(xckb122f) >= s_math_abs(xckb122h)                                                   #170824-00029#1 add abs       
      #
      #UPDATE xckb2_tmp SET xckb122g = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122h)  
      # WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
      #   #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122h) <> 0  #170824-00029#1 mark
      #   AND s_math_abs(xckb122g) >= s_math_abs(xckb122h)                                                  #170824-00029#1 add abs        
      
      UPDATE xckb2_tmp SET xckb122a = xckb122 - (xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)   
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122a) >= ABS(xckb122b) AND ABS(xckb122a) >= ABS(xckb122c)   
         AND ABS(xckb122a) >= ABS(xckb122d) AND ABS(xckb122a) >= ABS(xckb122e)   
         AND ABS(xckb122a) >= ABS(xckb122f) AND ABS(xckb122a) >= ABS(xckb122g)   
         AND ABS(xckb122a) >= ABS(xckb122h)                                                    
         
      UPDATE xckb2_tmp SET xckb122b = xckb122 - (xckb122a + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122b) >= ABS(xckb122c)                                                   
         AND ABS(xckb122b) >= ABS(xckb122d) AND ABS(xckb122b) >= ABS(xckb122e)  
         AND ABS(xckb122b) >= ABS(xckb122f) AND ABS(xckb122b) >= ABS(xckb122g)  
         AND ABS(xckb122b) >= ABS(xckb122h)                                                   
    
      UPDATE xckb2_tmp SET xckb122c = xckb122 - (xckb122a + xckb122b + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122c) >= ABS(xckb122d) AND ABS(xckb122c) >= ABS(xckb122e)  
         AND ABS(xckb122c) >= ABS(xckb122f) AND ABS(xckb122c) >= ABS(xckb122g)  
         AND ABS(xckb122c) >= ABS(xckb122h)                                                       
   
      UPDATE xckb2_tmp SET xckb122d = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122e + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122d) >= ABS(xckb122e)                                                   
         AND ABS(xckb122d) >= ABS(xckb122f) AND ABS(xckb122d) >= ABS(xckb122g)
         AND ABS(xckb122d) >= ABS(xckb122h)                                                          
    
      UPDATE xckb2_tmp SET xckb122e = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122f + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122e) >= ABS(xckb122f) AND ABS(xckb122e) >= ABS(xckb122g) 
         AND ABS(xckb122e) >= ABS(xckb122h)                                                       
    
      UPDATE xckb2_tmp SET xckb122f = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122g + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122f) >= ABS(xckb122g)                                                   
         AND ABS(xckb122f) >= ABS(xckb122h)                                                          
   
      UPDATE xckb2_tmp SET xckb122g = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122h)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         AND ABS(xckb122g) >= ABS(xckb122h)                                                    
      #180925-00065#1---mod---e     
      UPDATE xckb2_tmp SET xckb122h = xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g)  
       WHERE xckb122 <> xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g + xckb122h
         #AND xckb122 - (xckb122a + xckb122b + xckb122c + xckb122d + xckb122e + xckb122f + xckb122g) <> 0   #170824-00029#1 mark    
      #170606-00027#1---add---e     
   END IF 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 年度期別檢查
# Usage..........: CALL axcp200_date_chk()
# Date & Author..: 2017/02/20 By charles4m
# Modify.........: 170220-00038#1
################################################################################
PRIVATE FUNCTION axcp200_date_chk()
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
   #190514-00040#2 mark-S         
#   SELECT ooef017 INTO l_ooef017 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = l_comp
#   LET l_flag = cl_get_para(g_enterprise,l_ooef017,'S-FIN-6012')   #关账日期
#
#   LET l_yy = YEAR(l_flag)
#   LET l_pp = MONTH(l_flag)
   #190514-00040#2 mark-E
   #190514-00040#2 add-S
   #根据关账日期获取到年期
   CALL s_fin_get_close_date(l_comp) RETURNING l_flag,l_yy,l_pp
   #190514-00040#2 add-E
   LET g_errno = ' '
   IF l_yy > g_master.yy THEN
      LET g_errno = 'axc-00303'
   END IF

   IF l_yy = g_master.yy AND l_pp >= g_master.pp THEN   
      LET g_errno = 'axc-00304'
   END IF
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........: 尾差處理
# Usage..........: CALL axcp200_upd_xckb ()
#                  RETURNING l_success
# Return code....: l_success TRUE 成功 FALSE 失敗
# Date & Author..: 17/03/13 By fionchen(#170306-00022#1 add)
# Modify.........:
################################################################################
PRIVATE FUNCTION axcp200_upd_xckb()
   DEFINE r_success          LIKE type_t.num5
   DEFINE l_xckb005          LIKE xckb_t.xckb005,
          l_xckb006          LIKE xckb_t.xckb006,
          l_outcome_xckb014  LIKE xckb_t.xckb014,
          l_outcome_xckb102  LIKE xckb_t.xckb102,
          l_outcome_xckb102a LIKE xckb_t.xckb102a,
          l_outcome_xckb102b LIKE xckb_t.xckb102b,
          l_outcome_xckb102c LIKE xckb_t.xckb102c,
          l_outcome_xckb102d LIKE xckb_t.xckb102d,
          l_outcome_xckb102e LIKE xckb_t.xckb102e,
          l_outcome_xckb102f LIKE xckb_t.xckb102f,
          l_outcome_xckb102g LIKE xckb_t.xckb102g,
          l_outcome_xckb102h LIKE xckb_t.xckb102h,
          --income
          l_income_xckb014   LIKE xckb_t.xckb014,
          l_income_xckb102   LIKE xckb_t.xckb102,
          l_income_xckb102a  LIKE xckb_t.xckb102a,
          l_income_xckb102b  LIKE xckb_t.xckb102b,
          l_income_xckb102c  LIKE xckb_t.xckb102c,
          l_income_xckb102d  LIKE xckb_t.xckb102d,
          l_income_xckb102e  LIKE xckb_t.xckb102e,
          l_income_xckb102f  LIKE xckb_t.xckb102f,
          l_income_xckb102g  LIKE xckb_t.xckb102g,
          l_income_xckb102h  LIKE xckb_t.xckb102h, #190311-00010#1 add ,
          l_diff_xckb102     LIKE xckb_t.xckb102,  #190311-00010#1 add
          l_xckb003          LIKE xckb_t.xckb003,  #190311-00010#1 add
          l_xckb036          LIKE xckb_t.xckb036   #190311-00010#1 add
   
   LET r_success = TRUE

   #190621-00013#1---add---s
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb_t M ",
               " USING (SELECT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb005,xckb006,xckb007,xckb008,xckb036,",
               "               xckb014,xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h ",
               "         FROM (",
               "               SELECT a.xckbent xckbent,a.xckbcomp xckbcomp,a.xckbld xckbld,a.xckb001 xckb001,a.xckb002 xckb002, ",
               "                      a.xckb003 xckb003,a.xckb005 xckb005,a.xckb006 xckb006,a.xckb007 xckb007,a.xckb008 xckb008,",
               "                      a.xckb036 xckb036,",
               "                      ROW_NUMBER() OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb005,xckb006,xckb007,xckb008 ",
               "                                             ORDER BY a.xckb102 DESC  ) NB,",
               "                      SUM(xckb014*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb014, ",
               "                      SUM(xckb102*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102, ",               
               "                      SUM(xckb102a*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102a, ",
               "                      SUM(xckb102b*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102b, ",
               "                      SUM(xckb102c*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102c, ",
               "                      SUM(xckb102d*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102d, ",
               "                      SUM(xckb102e*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102e, ",
               "                      SUM(xckb102f*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102f, ",
               "                      SUM(xckb102g*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102g, ",
               "                      SUM(xckb102h*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102h  ",
               "                 FROM xckb_t a ",
               "                WHERE a.xckbent = '",g_enterprise,"' AND a.xckbcomp = '",g_comp,"' AND a.xckbld = '",g_master.glaald,"' ",
               "                  AND (a.xckb007*12+a.xckb008)<=",g_master.yy,"*12+",g_master.pp,
               "                  AND EXISTS ( SELECT 1 FROM xckb_t b ",
               "                                WHERE a.xckbent = b.xckbent and a.xckbcomp = b.xckbcomp and a.xckbld = b.xckbld ",
               "                                  AND b.xckb007 = ",g_master.yy," AND b.xckb008 = ",g_master.pp,
               "                                  AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND b.xckb002 = -1 ) ",
               "              ) ",
               "        WHERE xckb002='-1' AND xckb007 =  ",g_master.yy,"  AND xckb008 = ",g_master.pp,
               "          AND NB = 1 ",
               "          AND xckb014=0 AND (xckb102<>0 OR xckb102a<>0 OR xckb102b<>0 OR xckb102c<>0 OR xckb102d<>0 ",
               "                         OR xckb102e<>0 OR xckb102f<>0 OR xckb102g<>0 OR xckb102h<>0)",                          
               "       ) diff ",               
               "  ON (M.xckbent = diff.xckbent ",
               "  AND M.xckbcomp =diff.xckbcomp",
               "  AND M.xckbld =  diff.xckbld   ",
               "  AND M.xckb001 = diff.xckb001 ",
               "  AND M.xckb002 = diff.xckb002 ",
               "  AND M.xckb003 = diff.xckb003 ",
               "  AND M.xckb005 = diff.xckb005 ",
               "  AND M.xckb006 = diff.xckb006 ",
               "  AND M.xckb007 = diff.xckb007 ",
               "  AND M.xckb008 = diff.xckb008 ",
               "  AND M.xckb036 = diff.xckb036) ", 
               "  WHEN MATCHED THEN ",
               "        UPDATE SET M.xckb102  = M.xckb102  - diff.xckb002 * diff.xckb102 ,",
               "                   M.xckb102a = M.xckb102a - diff.xckb002 * diff.xckb102a,",
               "                   M.xckb102b = M.xckb102b - diff.xckb002 * diff.xckb102b,",
               "                   M.xckb102c = M.xckb102c - diff.xckb002 * diff.xckb102c,",
               "                   M.xckb102d = M.xckb102d - diff.xckb002 * diff.xckb102d,",
               "                   M.xckb102e = M.xckb102e - diff.xckb002 * diff.xckb102e,",
               "                   M.xckb102f = M.xckb102f - diff.xckb002 * diff.xckb102f,",
               "                   M.xckb102g = M.xckb102g - diff.xckb002 * diff.xckb102g,",
               "                   M.xckb102h = M.xckb102h - diff.xckb002 * diff.xckb102h "
   #PGS(D)-00824 --- end ---
   PREPARE axcp200_execute_upd_xckb FROM g_sql
   EXECUTE axcp200_execute_upd_xckb 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'UPDATE axcp200_execute_upd_xckb'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF   
   #190621-00013#1---add---e
   
   #201026-00005#1---add---s
   #此段处理发出商品转入的部分,全部已经开票,开票是以计价单位开票,开票数量=出货单/销退单的计价数量,但axcp200前面算出来的成本单位的数量有尾差,
   #导致开票数量已经全部开完,但是发出商品开票冲转入没有全部冲完
   #处理:以计价数量去判断是否已经冲完,如果已经冲完,则将上述尾差加到当期的一笔中
   LET g_sql = " INSERT INTO reup_xckb_tmp ",
               " SELECT DISTINCT xckb005,xckb006,'',0,'',0,0 ",
               "   FROM xckb2_tmp ",
               "  WHERE xckbent = '",g_enterprise,"' AND xckbcomp = '",g_comp,"' AND xckbld = '",g_master.glaald,"' ",
               "    AND xckb007 =",g_master.yy," AND xckb008=",g_master.pp,
               "    AND xckb002 = '-1'"    
   PREPARE p200_ins_reup FROM g_sql
   EXECUTE p200_ins_reup 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'INSERT p200_ins_reup'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF  

   #处理剩余未开票的数量
   LET g_sql = "MERGE INTO reup_xckb_tmp a ",
               "USING (SELECT xckb005,xckb006,SUM(xckb002*xckb021) qty FROM xckb_t ",
               "        WHERE xckbent = '",g_enterprise,"' AND xckbcomp = '",g_comp,"' AND xckbld = '",g_master.glaald,"' ",
               "          AND (xckb007*12+xckb008)<=",g_master.yy,"*12+",g_master.pp,
               "          AND EXISTS(SELECT 1 FROM reup_xckb_tmp WHERE docno = xckb005 AND seq = xckb006) ",
               "        GROUP BY xckb005,xckb006",
               "      ) b ",
               "  ON (a.docno = b.xckb005 AND a.seq = b.xckb006) ",
               " WHEN MATCHED THEN ",
               " UPDATE SET a.xckb021 = b.qty"   
   PREPARE p200_upd_reup1 FROM g_sql
   EXECUTE p200_upd_reup1 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'UPDATE p200_upd_reup1'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 

   #处理转入部分的计价单位和数量
   LET g_sql = "MERGE INTO reup_xckb_tmp a ",
               "USING (SELECT DISTINCT xmdldocno,xmdlseq,xmdl021,xmdl022 FROM xmdl_t ",
               "        WHERE xmdlent = ",g_enterprise,
               "          AND xmdlsite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = ",g_enterprise," AND ooefstus ='Y' AND ooef017 ='",g_comp,"')",
               "          AND EXISTS(SELECT 1 FROM reup_xckb_tmp WHERE docno = xmdldocno AND seq = xmdlseq) ",
               "      ) b ",
               "  ON (a.docno = b.xmdldocno AND a.seq = b.xmdlseq) ",
               " WHEN MATCHED THEN ",
               " UPDATE SET a.xmdl021 = b.xmdl021,",
               "            a.xmdl022 = b.xmdl022  "
   PREPARE p200_upd_reup2 FROM g_sql
   EXECUTE p200_upd_reup2 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'UPDATE p200_upd_reup2'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
 
   #处理转出部分的计价单位和数量
   LET g_sql = "MERGE INTO reup_xckb_tmp a ",
               "USING (SELECT DISTINCT isag002,isag003,isag005,SUM(isag004) isag004 FROM isaf_t,isag_t ",
               "        WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
               "          AND isafent = ",g_enterprise,
               "          AND isafcomp ='",g_comp,"' ",
               "          AND isafstus IN ('S' ,'Y') ",
               "          AND isaf014 <= '",g_edate,"' ",
               "          AND isag009 IS NOT NULL ",   
               "          AND isag001 in ('11','21') ",
               "          AND EXISTS(SELECT 1 FROM reup_xckb_tmp WHERE docno = isag002 AND seq = isag003) ",
               "        GROUP BY isag002,isag003,isag005",
               "      ) b ",
               "  ON (a.docno = b.isag002 AND a.seq = b.isag003) ",
               " WHEN MATCHED THEN ",
               " UPDATE SET a.isag005 = b.isag005,",
               "            a.isag004 = b.isag004  "
   PREPARE p200_upd_reup3 FROM g_sql
   EXECUTE p200_upd_reup3 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'UPDATE p200_upd_reup3'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF  
   
   #删除没有尾差的资料
   LET g_sql = "DELETE FROM reup_xckb_tmp ",
               " WHERE NOT (xckb021 <> 0 AND xmdl022 = isag004) "
   PREPARE p200_del_reup1 FROM g_sql
   EXECUTE p200_del_reup1 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'DELETE p200_del_reup1'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF            

   LET g_sql = " MERGE INTO xckb_t M ",
               " USING (SELECT xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb003,xckb005,xckb006,xckb007,xckb008,xckb036,",
               "               xckb014,xckb021,xckb102,xckb102a,xckb102b,xckb102c,xckb102d,xckb102e,xckb102f,xckb102g,xckb102h ",
               "         FROM (",
               "               SELECT xckbent xckbent,xckbcomp xckbcomp,xckbld xckbld,xckb001 xckb001,xckb002 xckb002, ",
               "                      xckb003 xckb003,xckb005 xckb005,xckb006 xckb006,xckb007 xckb007,xckb008 xckb008,",
               "                      xckb036 xckb036,",
               "                      ROW_NUMBER() OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002,xckb005,xckb006,xckb007,xckb008 ",
               "                                             ORDER BY xckb007,xckb008,xckb036 DESC  ) NB,",
               "                      SUM(xckb014*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb014, ",
               "                      SUM(xckb021*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb021, ",
               "                      SUM(xckb102*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102, ",               
               "                      SUM(xckb102a*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102a, ",
               "                      SUM(xckb102b*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102b, ",
               "                      SUM(xckb102c*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102c, ",
               "                      SUM(xckb102d*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102d, ",
               "                      SUM(xckb102e*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102e, ",
               "                      SUM(xckb102f*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102f, ",
               "                      SUM(xckb102g*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102g, ",
               "                      SUM(xckb102h*xckb002) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb005,xckb006) xckb102h  ",
               "                 FROM xckb_t ",
               "                WHERE xckbent = '",g_enterprise,"' AND xckbcomp = '",g_comp,"' AND xckbld = '",g_master.glaald,"' ",
               "                  AND (xckb007*12+xckb008)<=",g_master.yy,"*12+",g_master.pp,
               "                  AND EXISTS (SELECT 1 FROM reup_xckb_tmp ",
               "                               WHERE xckb005 = docno AND xckb006 = seq ) ",
               "              ) ",
               "        WHERE xckb002='-1' AND xckb007 =  ",g_master.yy,"  AND xckb008 = ",g_master.pp," AND NB = 1 ",                        
               "       ) diff ",               
               "  ON (M.xckbent = diff.xckbent ",
               "  AND M.xckbcomp =diff.xckbcomp",
               "  AND M.xckbld =  diff.xckbld   ",
               "  AND M.xckb001 = diff.xckb001 ",
               "  AND M.xckb002 = diff.xckb002 ",
               "  AND M.xckb003 = diff.xckb003 ",
               "  AND M.xckb005 = diff.xckb005 ",
               "  AND M.xckb006 = diff.xckb006 ",
               "  AND M.xckb007 = diff.xckb007 ",
               "  AND M.xckb008 = diff.xckb008 ",
               "  AND M.xckb036 = diff.xckb036) ", 
               "  WHEN MATCHED THEN ",
               "        UPDATE SET M.xckb014  = M.xckb014  - diff.xckb002 * diff.xckb014 ,",
               "                   M.xckb021  = M.xckb021  - diff.xckb002 * diff.xckb021 ,",
               "                   M.xckb102  = M.xckb102  - diff.xckb002 * diff.xckb102 ,",
               "                   M.xckb102a = M.xckb102a - diff.xckb002 * diff.xckb102a,",
               "                   M.xckb102b = M.xckb102b - diff.xckb002 * diff.xckb102b,",
               "                   M.xckb102c = M.xckb102c - diff.xckb002 * diff.xckb102c,",
               "                   M.xckb102d = M.xckb102d - diff.xckb002 * diff.xckb102d,",
               "                   M.xckb102e = M.xckb102e - diff.xckb002 * diff.xckb102e,",
               "                   M.xckb102f = M.xckb102f - diff.xckb002 * diff.xckb102f,",
               "                   M.xckb102g = M.xckb102g - diff.xckb002 * diff.xckb102g,",
               "                   M.xckb102h = M.xckb102h - diff.xckb002 * diff.xckb102h "
   PREPARE p200_upd_reup4 FROM g_sql
   EXECUTE p200_upd_reup4 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'UPDATE p200_upd_reup4'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF      
   #201026-00005#1---add---e     
   
#190621-00013#1---mark---e  
#   ## 先取出本月有轉出的單子及累計的轉出量、轉出金額
#   #180802-00020#1 Mark By 06137  181217(S)
#   #LET g_sql = " SELECT a.xckb005,a.xckb006,SUM(a.xckb014), ",
#   #            "        SUM(a.xckb102), SUM(a.xckb102a), SUM(a.xckb102b), SUM(a.xckb102c), ",
#   #            "        SUM(a.xckb102d),SUM(a.xckb102e), SUM(a.xckb102f), SUM(a.xckb102g), SUM(a.xckb102h) ",
#   #            "   FROM xckb_t a",
#   #            "  WHERE a.xckbent = '",g_enterprise,"' AND a.xckbcomp = '",g_comp,"' AND a.xckbld = '",g_master.glaald,"' ",
#   #            "    AND a.xckb002 = -1 ",
#   #            "    AND (xckb007*12+xckb008) <=",g_master.yy,"*12+",g_master.pp,  #171030-00011#1  add
#   #            "    AND exists ( SELECT * FROM xckb_t b ",
#   #            "                  WHERE a.xckbent = b.xckbent and a.xckbcomp = b.xckbcomp and a.xckbld = b.xckbld ",
#   #            "                    AND b.xckb007 = ",g_master.yy," AND b.xckb008 = ",g_master.pp,
#   #            "                    AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND b.xckb002 = -1 ) ",
#   #            "  group by a.xckb005,a.xckb006 "
#   #180802-00020#1 Mark By 06137  181217(E)      
#   #180802-00020#1 Add By 06137  181217(S)
#   #190311-00010#1 mark start -----
#   #LET g_sql = " SELECT a.xckb005,a.xckb006,SUM(a.xckb014), ",
#   #            "        SUM(a.xckb102), SUM(a.xckb102a), SUM(a.xckb102b), SUM(a.xckb102c), ",
#   #            "        SUM(a.xckb102d),SUM(a.xckb102e), SUM(a.xckb102f), SUM(a.xckb102g), SUM(a.xckb102h), ",
#   #190311-00010#1 mark end   -----
#   #190311-00010#1 add start -----   
#   LET g_sql = " SELECT Z.xckb005,Z.xckb006,SUM(Z.xckb014), ",
#               "        SUM(Z.xckb102), SUM(Z.xckb102a), SUM(Z.xckb102b), SUM(Z.xckb102c), ",
#               "        SUM(Z.xckb102d),SUM(Z.xckb102e), SUM(Z.xckb102f), SUM(Z.xckb102g), SUM(Z.xckb102h), ",
#   #190311-00010#1 add end   -----               
#			      "        SUM(Y.xckb102), SUM(Y.xckb102a), SUM(Y.xckb102b), SUM(Y.xckb102c), ",
#               "        SUM(Y.xckb102d),SUM(Y.xckb102e), SUM(Y.xckb102f), SUM(Y.xckb102g), SUM(Y.xckb102h) ",
#               #"   FROM xckb_t a,", #190311-00010#1 mark
#               #190311-00010#1 add start -----
#               "   FROM ",
#               " (SELECT a.xckb005,a.xckb006,SUM(a.xckb014) xckb014, ",
#               "        SUM(a.xckb102) xckb102, SUM(a.xckb102a) xckb102a, SUM(a.xckb102b) xckb102b, SUM(a.xckb102c) xckb102c, ",
#               "        SUM(a.xckb102d) xckb102d,SUM(a.xckb102e) xckb102e, SUM(a.xckb102f) xckb102f, SUM(a.xckb102g) xckb102g, SUM(a.xckb102h) xckb102h",
#               "   FROM xckb_t a ",
#               "  WHERE a.xckbent = '",g_enterprise,"' AND a.xckbcomp = '",g_comp,"' AND a.xckbld = '",g_master.glaald,"' ",
#               "    AND a.xckb002 = -1 ",
#               "    AND (xckb007*12+xckb008) <=",g_master.yy,"*12+",g_master.pp,  
#               "    AND exists ( SELECT * FROM xckb_t b ",
#               "                  WHERE a.xckbent = b.xckbent and a.xckbcomp = b.xckbcomp and a.xckbld = b.xckbld ",
#               "                    AND b.xckb007 = ",g_master.yy," AND b.xckb008 = ",g_master.pp,
#               "                    AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND b.xckb002 = -1 ) ",
#               "    GROUP BY a.xckb005,a.xckb006) Z, ",
#               #190311-00010#1 add end   -----               
#               "       (SELECT x.xckb005,x.xckb006,SUM(x.xckb014) xckb014, ",
#               "               SUM(x.xckb102) xckb102, SUM(x.xckb102a)xckb102a, SUM(x.xckb102b)xckb102b, SUM(x.xckb102c)xckb102c, ",
#               "               SUM(x.xckb102d)xckb102d,SUM(x.xckb102e)xckb102e, SUM(x.xckb102f)xckb102f, SUM(x.xckb102g)xckb102g, SUM(x.xckb102h)xckb102h ",
#               "          FROM xckb_t x",
#               "         WHERE x.xckbent = '",g_enterprise,"' AND x.xckbcomp = '",g_comp,"' AND x.xckbld = '",g_master.glaald,"' ",
#               "           AND x.xckb002 = 1 ",
#               "           AND (xckb007*12+xckb008) <=",g_master.yy,"*12+",g_master.pp,  
#               "         GROUP BY x.xckb005,x.xckb006) Y ",
#               #190311-00010#1 add start -----
#               "  WHERE Z.xckb005=Y.xckb005 AND Z.xckb006=Y.xckb006 AND Z.xckb014=Y.xckb014 ",
#               "    AND (Z.xckb102 <> Y.xckb102 OR Z.xckb102a <> Z.xckb102a  OR Z.xckb102b <> Z.xckb102b OR ",
#               "         Z.xckb102c <> Y.xckb102c OR Z.xckb102d <> Z.xckb102d OR Z.xckb102e <> Z.xckb102e OR ",
#               "         Z.xckb102f <> Y.xckb102f OR Z.xckb102g <> Z.xckb102g OR Z.xckb102h <> Z.xckb102h) ",
#               "   GROUP BY Z.xckb005,Z.xckb006 "
#               #190311-00010#1 add end   -----
#               #190311-00010#1 mark start -----               
#               #"  WHERE a.xckb005=Y.xckb005 AND a.xckb006=Y.xckb006 ",
#               #"    AND a.xckb014=Y.xckb014 ",
#               #"    AND (a.xckb102 <> Y.xckb102 OR a.xckb102a <> Y.xckb102a  OR a.xckb102b <> Y.xckb102b OR ",
#               #"         a.xckb102c <> Y.xckb102c OR a.xckb102d <> Y.xckb102d OR a.xckb102e <> Y.xckb102e OR ",
#               #"         a.xckb102f <> Y.xckb102f OR a.xckb102g <> Y.xckb102g OR a.xckb102h <> Y.xckb102h) ",			   
#			      #"    AND a.xckbent = '",g_enterprise,"' AND a.xckbcomp = '",g_comp,"' AND a.xckbld = '",g_master.glaald,"' ",
#               #"    AND a.xckb002 = -1 ",
#               #"    AND (xckb007*12+xckb008) <=",g_master.yy,"*12+",g_master.pp,  
#               #"    AND exists ( SELECT * FROM xckb_t b ",
#               #"                  WHERE a.xckbent = b.xckbent and a.xckbcomp = b.xckbcomp and a.xckbld = b.xckbld ",
#               #"                    AND b.xckb007 = ",g_master.yy," AND b.xckb008 = ",g_master.pp,
#               #"                    AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND b.xckb002 = -1 ) ",
#               #"  group by a.xckb005,a.xckb006 "
#               #190311-00010#1 mark end    -----
#   #180802-00020#1 Add By 06137  181217(E)            
#   PREPARE axcp200_execute_upd_xckb_p1 FROM g_sql
#   DECLARE axcp200_execute_upd_xckb_c1 CURSOR FOR axcp200_execute_upd_xckb_p1
#   
#   FOREACH axcp200_execute_upd_xckb_c1 INTO l_xckb005,l_xckb006,l_outcome_xckb014,
#                                            l_outcome_xckb102,l_outcome_xckb102a,l_outcome_xckb102b,l_outcome_xckb102c,
#                                            l_outcome_xckb102d,l_outcome_xckb102e,l_outcome_xckb102f,l_outcome_xckb102g,
#                                            l_outcome_xckb102h
#                                            #180802-00020#1 Add By 181217(S)
#                                            ,l_income_xckb102,l_income_xckb102a,l_income_xckb102b,l_income_xckb102c,
#                                            l_income_xckb102d,l_income_xckb102e,l_income_xckb102f,l_income_xckb102g,
#                                            l_income_xckb102h
#                                            #180802-00020#1 Add By 181217(E)
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'axcp200_execute_upd_xckb_c1'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#
#      #190311-00010#1 add start -----
#      IF l_outcome_xckb102 <> l_income_xckb102 THEN
#          LET l_diff_xckb102 = l_income_xckb102 - l_outcome_xckb102
#      END IF
#      
#      SELECT xckb003,xckb036 INTO l_xckb003,l_xckb036 FROM ( SELECT xckb003,xckb036 FROM xckb_t
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006 ORDER BY xckb102 DESC) tsed WHERE ROWNUM = 1
#       
#      #更新xckb_t中
#      UPDATE xckb_t SET xckb102  = xckb102  + l_diff_xckb102
#        WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#          AND xckb002 = -1 AND xckb003 = l_xckb003
#        AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#        AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#        AND xckb036 = l_xckb036
#        
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'UPDATE xckb102 diff'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
#      
#      UPDATE xckb_t SET xckb102a = xckb102a + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#         AND ABS(xckb102a) >= ABS(xckb102b) AND ABS(xckb102a) >= ABS(xckb102c)
#         AND ABS(xckb102a) >= ABS(xckb102d) AND ABS(xckb102a) >= ABS(xckb102e)
#         AND ABS(xckb102a) >= ABS(xckb102f) AND ABS(xckb102a) >= ABS(xckb102g)
#         AND ABS(xckb102a) >= ABS(xckb102h)
#      
#      UPDATE xckb_tmp SET xckb102b = xckb102b + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#         AND ABS(xckb102b) >= ABS(xckb102c)
#         AND ABS(xckb102b) >= ABS(xckb102d) AND ABS(xckb102b) >= ABS(xckb102e)
#         AND ABS(xckb102b) >= ABS(xckb102f) AND ABS(xckb102b) >= ABS(xckb102g)
#         AND ABS(xckb102b) >= ABS(xckb102h)
#      
#      UPDATE xckb_tmp SET xckb102c = xckb102c + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#         AND ABS(xckb102c) >= ABS(xckb102d) AND ABS(xckb102c) >= ABS(xckb102e)
#         AND ABS(xckb102c) >= ABS(xckb102f) AND ABS(xckb102c) >= ABS(xckb102g)
#         AND ABS(xckb102c) >= ABS(xckb102h)
#      
#      UPDATE xckb_tmp SET xckb102d = xckb102d + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#         AND ABS(xckb102d) >= ABS(xckb102e)
#         AND ABS(xckb102d) >= ABS(xckb102f) AND ABS(xckb102d) >= ABS(xckb102g)
#         AND ABS(xckb102d) >= ABS(xckb102h)
#      
#      UPDATE xckb_tmp SET xckb102e = xckb102e + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#         AND ABS(xckb102e) >= ABS(xckb102f) AND ABS(xckb102e) >= ABS(xckb102g)
#         AND ABS(xckb102e) >= ABS(xckb102h)
#      
#      UPDATE xckb_tmp SET xckb102f = xckb102f + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#         AND ABS(xckb102f) >= ABS(xckb102g)
#         AND ABS(xckb102f) >= ABS(xckb102h)
#      
#      UPDATE xckb_tmp SET xckb102g = xckb102g + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#         AND ABS(xckb102g) >= ABS(xckb102h)
#       
#      UPDATE xckb_tmp SET xckb102h = xckb102h + l_diff_xckb102
#       WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#         AND xckb002 = -1 AND xckb003 = l_xckb003
#         AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#         AND xckb036 = l_xckb036	  
#         AND xckb102 <> xckb102a + xckb102b + xckb102c + xckb102d + xckb102e + xckb102f + xckb102g + xckb102h
#      #190311-00010#1 add end   -----
#      
#      #180802-00020#1 Mark By 181217(S) 將此段判斷移至上方SQL中，優化效能
#      ## 用單號+項次檢查 轉出數量 和 出貨(入項)數量一樣，但金額不同的資料
#      #LET l_income_xckb014 = 0
#      #SELECT diff.* INTO l_income_xckb014,l_income_xckb102,
#      #                   l_income_xckb102a,l_income_xckb102b,l_income_xckb102c,l_income_xckb102d,
#      #                   l_income_xckb102e,l_income_xckb102f,l_income_xckb102g,l_income_xckb102h
#      # FROM (
#      #   SELECT SUM(xckb014) xckb014,SUM(xckb102) xckb102,SUM(xckb102a) xckb102a,SUM(xckb102b) xckb102b,SUM(xckb102c) xckb102c,
#      #          SUM(xckb102d) xckb102d,SUM(xckb102e) xckb102e,SUM(xckb102f) xckb102f,SUM(xckb102g) xckb102g,SUM(xckb102h) xckb102h
#      #   FROM xckb_t
#      #   WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#      #      AND xckb002 = 1
#      #      AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#      #      AND (xckb007*12+xckb008) <=g_master.yy*12+g_master.pp   #171030-00011#1 add
#      #  ) diff
#      # WHERE diff.xckb014 = l_outcome_xckb014
#      #   AND (diff.xckb102 <> l_outcome_xckb102 OR diff.xckb102a <> l_outcome_xckb102a  OR diff.xckb102b <> l_outcome_xckb102b OR
#      #        diff.xckb102c <> l_outcome_xckb102c OR diff.xckb102d <> l_outcome_xckb102d OR diff.xckb102e <> l_outcome_xckb102e OR
#      #        diff.xckb102f <> l_outcome_xckb102f OR diff.xckb102g <> l_outcome_xckb102g OR diff.xckb102h <> l_outcome_xckb102h)
#      # IF SQLCA.sqlcode = 100 THEN
#      #   CONTINUE FOREACH  --not found
#      # END IF
#      # IF SQLCA.sqlcode THEN
#      #   INITIALIZE g_errparam TO NULL
#      #   LET g_errparam.code = SQLCA.sqlcode
#      #   LET g_errparam.extend = 'select axcp200_execute_upd_xckb_c1_1'
#      #   LET g_errparam.popup = TRUE
#      #   CALL cl_err()
#      #   LET r_success = FALSE
#      #   RETURN r_success
#      # END IF
#      #180802-00020#1 Mark By 181217(E)
#      
#       #170824-00029#1---mod---s
#       ##170606-00027#1---add---s
#       ##修正xckb102的值-先修至xckb102a,若xckb102a為零,則修正xckb102b......   
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h) <> 0 
#       #   AND l_outcome_xckb102a >= l_outcome_xckb102b AND l_outcome_xckb102a >= l_outcome_xckb102c
#       #   AND l_outcome_xckb102a >= l_outcome_xckb102d AND l_outcome_xckb102a >= l_outcome_xckb102e
#       #   AND l_outcome_xckb102a >= l_outcome_xckb102f AND l_outcome_xckb102a >= l_outcome_xckb102g
#       #   AND l_outcome_xckb102a >= l_outcome_xckb102h THEN
#       #   LET l_outcome_xckb102a = l_outcome_xckb102 - (l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)
#       #END IF  
#       #  
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h) <> 0  
#       #   AND l_outcome_xckb102b >= l_outcome_xckb102c
#       #   AND l_outcome_xckb102b >= l_outcome_xckb102d AND l_outcome_xckb102b >= l_outcome_xckb102e
#       #   AND l_outcome_xckb102b >= l_outcome_xckb102f AND l_outcome_xckb102b >= l_outcome_xckb102g
#       #   AND l_outcome_xckb102b >= l_outcome_xckb102h THEN
#       #   LET l_outcome_xckb102b = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)	  
#       #END IF
#       #  
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h) <> 0 
#       #   AND l_outcome_xckb102c >= l_outcome_xckb102d AND l_outcome_xckb102c >= l_outcome_xckb102e
#       #   AND l_outcome_xckb102c >= l_outcome_xckb102f AND l_outcome_xckb102c >= l_outcome_xckb102g
#       #   AND l_outcome_xckb102c >= l_outcome_xckb102h THEN 
#       #   LET l_outcome_xckb102c = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)      
#       #END IF
#       # 
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h) <> 0 
#       #   AND l_outcome_xckb102d >= l_outcome_xckb102e
#       #   AND l_outcome_xckb102d >= l_outcome_xckb102f AND l_outcome_xckb102d >= l_outcome_xckb102g
#       #   AND l_outcome_xckb102d >= l_outcome_xckb102h THEN 
#       #   LET l_outcome_xckb102d = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h) 	  
#       #END IF 
#       #  
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h) <> 0 
#       #   AND l_outcome_xckb102e >= l_outcome_xckb102f AND l_outcome_xckb102e >= l_outcome_xckb102g
#       #   AND l_outcome_xckb102e >= l_outcome_xckb102h THEN  
#       #   LET l_outcome_xckb102e = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)	  
#       #END IF
#       # 
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102g + l_outcome_xckb102h) <> 0  
#       #   AND l_outcome_xckb102f >= l_outcome_xckb102g
#       #   AND l_outcome_xckb102f >= l_outcome_xckb102h  THEN      
#    	 #   LET l_outcome_xckb102f = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102g + l_outcome_xckb102h) 
#       #END IF
#       #  
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102h) <> 0 
#       #   AND l_outcome_xckb102g >= l_outcome_xckb102h THEN 
#       #   LET l_outcome_xckb102g = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102h)	  
#       #END IF
#       #  
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g) <> 0 THEN 
#    	 #   LET l_outcome_xckb102h = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g)
#       #END IF	  
#       #
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h) <> 0 
#       #   AND l_income_xckb102a >= l_income_xckb102b AND l_income_xckb102a >= l_income_xckb102c
#       #   AND l_income_xckb102a >= l_income_xckb102d AND l_income_xckb102a >= l_income_xckb102e
#       #   AND l_income_xckb102a >= l_income_xckb102f AND l_income_xckb102a >= l_income_xckb102g
#       #   AND l_income_xckb102a >= l_income_xckb102h THEN
   #       #   LET l_income_xckb102a = l_income_xckb102 - (l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)
#       #END IF  
#       #  
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102a + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h) <> 0  
#       #   AND l_income_xckb102b >= l_income_xckb102c
#       #   AND l_income_xckb102b >= l_income_xckb102d AND l_income_xckb102b >= l_income_xckb102e
#       #   AND l_income_xckb102b >= l_income_xckb102f AND l_income_xckb102b >= l_income_xckb102g
#       #   AND l_income_xckb102b >= l_income_xckb102h THEN
#       #   LET l_income_xckb102b = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)	  
#       #END IF
#       #  
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h) <> 0 
#       #   AND l_income_xckb102c >= l_income_xckb102d AND l_income_xckb102c >= l_income_xckb102e
#       #   AND l_income_xckb102c >= l_income_xckb102f AND l_income_xckb102c >= l_income_xckb102g
#       #   AND l_income_xckb102c >= l_income_xckb102h THEN 
#       #   LET l_income_xckb102c = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)      
#       #END IF
#       # 
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h) <> 0 
#       #   AND l_income_xckb102d >= l_income_xckb102e
#       #   AND l_income_xckb102d >= l_income_xckb102f AND l_income_xckb102d >= l_income_xckb102g
#       #   AND l_income_xckb102d >= l_income_xckb102h THEN 
#       #   LET l_income_xckb102d = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h) 	  
#       #END IF 
#       #  
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h) <> 0 
#       #   AND l_income_xckb102e >= l_income_xckb102f AND l_income_xckb102e >= l_income_xckb102g
#       #   AND l_income_xckb102e >= l_income_xckb102h THEN  
#       #   LET l_income_xckb102e = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)	  
#       #END IF
#       # 
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102g + l_income_xckb102h) <> 0  
#       #   AND l_income_xckb102f >= l_income_xckb102g
#       #   AND l_income_xckb102f >= l_income_xckb102h  THEN      
#    	 #   LET l_income_xckb102f = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102g + l_income_xckb102h) 
#       #END IF
#       #  
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102h) <> 0 
#       #   AND l_income_xckb102g >= l_income_xckb102h THEN 
#       #   LET l_income_xckb102g = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102h)	  
#       #END IF
#       #  
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g) <> 0 THEN 
#    	 #   LET l_income_xckb102h = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g)
#       #END IF	         
#       ##170606-00027#1---add---e
#       
#       #190311-00010#1 mark start -----
#       ##修正xckb102的值-先修至xckb102a,若xckb102a為零,則修正xckb102b......
#       ##181030-00060#1 Add By 06137  181107(S)
#       ##加註解：此段分攤的目的是尾差會攤到成本要素a~h中金額最大的欄位   
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h且l_outcome_xckb102a(絕對值)又是最大值，將尾差更新至l_outcome_xckb102a   
#       ##181030-00060#1 Add By 06137  181107(E) 
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND s_math_abs(l_outcome_xckb102a) >= s_math_abs(l_outcome_xckb102b) AND s_math_abs(l_outcome_xckb102a) >= s_math_abs(l_outcome_xckb102c)
#       #   AND s_math_abs(l_outcome_xckb102a) >= s_math_abs(l_outcome_xckb102d) AND s_math_abs(l_outcome_xckb102a) >= s_math_abs(l_outcome_xckb102e)
#       #   AND s_math_abs(l_outcome_xckb102a) >= s_math_abs(l_outcome_xckb102f) AND s_math_abs(l_outcome_xckb102a) >= s_math_abs(l_outcome_xckb102g)
#       #   AND s_math_abs(l_outcome_xckb102a) >= s_math_abs(l_outcome_xckb102h) THEN
#       #   LET l_outcome_xckb102a = l_outcome_xckb102 - (l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)
#       #END IF  
#       #
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h且l_outcome_xckb102b(絕對值)又是最大值，將尾差更新至l_outcome_xckb102b   #181030-00060#1 Add By 06137  181107       
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND s_math_abs(l_outcome_xckb102b) >= s_math_abs(l_outcome_xckb102c)
#       #   AND s_math_abs(l_outcome_xckb102b) >= s_math_abs(l_outcome_xckb102d) AND s_math_abs(l_outcome_xckb102b) >= s_math_abs(l_outcome_xckb102e)
#       #   AND s_math_abs(l_outcome_xckb102b) >= s_math_abs(l_outcome_xckb102f) AND s_math_abs(l_outcome_xckb102b) >= s_math_abs(l_outcome_xckb102g)
#       #   AND s_math_abs(l_outcome_xckb102b) >= s_math_abs(l_outcome_xckb102h) THEN
#       #   LET l_outcome_xckb102b = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)	  
#       #END IF
#       #  
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h且l_outcome_xckb102c(絕對值)又是最大值，將尾差更新至l_outcome_xckb102c   #181030-00060#1 Add By 06137  181107
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND s_math_abs(l_outcome_xckb102c) >= s_math_abs(l_outcome_xckb102d) AND s_math_abs(l_outcome_xckb102c) >= s_math_abs(l_outcome_xckb102e)
#       #   AND s_math_abs(l_outcome_xckb102c) >= s_math_abs(l_outcome_xckb102f) AND s_math_abs(l_outcome_xckb102c) >= s_math_abs(l_outcome_xckb102g)
#       #   AND s_math_abs(l_outcome_xckb102c) >= s_math_abs(l_outcome_xckb102h) THEN 
#       #   LET l_outcome_xckb102c = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)      
#       #END IF
#       # 
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h且l_outcome_xckb102d(絕對值)又是最大值，將尾差更新至l_outcome_xckb102d   #181030-00060#1 Add By 06137  181107
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND s_math_abs(l_outcome_xckb102d) >= s_math_abs(l_outcome_xckb102e)
#       #   AND s_math_abs(l_outcome_xckb102d) >= s_math_abs(l_outcome_xckb102f) AND s_math_abs(l_outcome_xckb102d) >= s_math_abs(l_outcome_xckb102g)
#       #   AND s_math_abs(l_outcome_xckb102d) >= s_math_abs(l_outcome_xckb102h) THEN 
#       #   LET l_outcome_xckb102d = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h) 	  
#       #END IF 
#       #  
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h且l_outcome_xckb102e(絕對值)又是最大值，將尾差更新至l_outcome_xckb102e   #181030-00060#1 Add By 06137  181107
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND s_math_abs(l_outcome_xckb102e) >= s_math_abs(l_outcome_xckb102f) AND s_math_abs(l_outcome_xckb102e) >= s_math_abs(l_outcome_xckb102g)
#       #   AND s_math_abs(l_outcome_xckb102e) >= s_math_abs(l_outcome_xckb102h) THEN  
#       #   LET l_outcome_xckb102e = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h)	  
#       #END IF
#       # 
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h且l_outcome_xckb102f(絕對值)又是最大值，將尾差更新至l_outcome_xckb102f   #181030-00060#1 Add By 06137  181107
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND s_math_abs(l_outcome_xckb102f) >= s_math_abs(l_outcome_xckb102g)
#       #   AND s_math_abs(l_outcome_xckb102f) >= s_math_abs(l_outcome_xckb102h)  THEN      
#    	 #   LET l_outcome_xckb102f = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102g + l_outcome_xckb102h) 
#       #END IF
#       #  
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h且l_outcome_xckb102g(絕對值)又是最大值，將尾差更新至l_outcome_xckb102g   #181030-00060#1 Add By 06137  181107
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h
#       #   AND s_math_abs(l_outcome_xckb102g) >= s_math_abs(l_outcome_xckb102h) THEN 
#       #   LET l_outcome_xckb102g = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102h)	  
#       #END IF
#       #  
#       ##加註解：l_outcome_xckb102<>l_outcome_xckb102a加到h，將尾差更新至l_outcome_xckb102h   #181030-00060#1 Add By 06137  181107
#       #IF l_outcome_xckb102 <> l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g + l_outcome_xckb102h THEN
#    	 #   LET l_outcome_xckb102h = l_outcome_xckb102 - (l_outcome_xckb102a + l_outcome_xckb102b + l_outcome_xckb102c + l_outcome_xckb102d + l_outcome_xckb102e + l_outcome_xckb102f + l_outcome_xckb102g)
#       #END IF	  
#       #
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h且l_income_xckb102a(絕對值)又是最大值，將尾差更新至l_income_xckb102a   #181030-00060#1 Add By 06137  181107
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND s_math_abs(l_income_xckb102a) >= s_math_abs(l_income_xckb102b) AND s_math_abs(l_income_xckb102a) >= s_math_abs(l_income_xckb102c)
#       #   AND s_math_abs(l_income_xckb102a) >= s_math_abs(l_income_xckb102d) AND s_math_abs(l_income_xckb102a) >= s_math_abs(l_income_xckb102e)
#       #   AND s_math_abs(l_income_xckb102a) >= s_math_abs(l_income_xckb102f) AND s_math_abs(l_income_xckb102a) >= s_math_abs(l_income_xckb102g)
#       #   AND s_math_abs(l_income_xckb102a) >= s_math_abs(l_income_xckb102h) THEN
#       #   LET l_income_xckb102a = l_income_xckb102 - (l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)
#       #END IF  
#       #
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h且l_income_xckb102b(絕對值)又是最大值，將尾差更新至l_income_xckb102b   #181030-00060#1 Add By 06137  181107       
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND s_math_abs(l_income_xckb102b) >= s_math_abs(l_income_xckb102c)
#       #   AND s_math_abs(l_income_xckb102b) >= s_math_abs(l_income_xckb102d) AND s_math_abs(l_income_xckb102b) >= s_math_abs(l_income_xckb102e)
#       #   AND s_math_abs(l_income_xckb102b) >= s_math_abs(l_income_xckb102f) AND s_math_abs(l_income_xckb102b) >= s_math_abs(l_income_xckb102g)
#       #   AND s_math_abs(l_income_xckb102b) >= s_math_abs(l_income_xckb102h) THEN
#       #   LET l_income_xckb102b = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)	  
#       #END IF
#       #
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h且l_income_xckb102c(絕對值)又是最大值，將尾差更新至l_income_xckb102c   #181030-00060#1 Add By 06137  181107       
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND s_math_abs(l_income_xckb102c) >= s_math_abs(l_income_xckb102d) AND s_math_abs(l_income_xckb102c) >= s_math_abs(l_income_xckb102e)
#       #   AND s_math_abs(l_income_xckb102c) >= s_math_abs(l_income_xckb102f) AND s_math_abs(l_income_xckb102c) >= s_math_abs(l_income_xckb102g)
#       #   AND s_math_abs(l_income_xckb102c) >= s_math_abs(l_income_xckb102h) THEN 
#       #   LET l_income_xckb102c = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)      
#       #END IF
#       # 
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h且l_income_xckb102d(絕對值)又是最大值，將尾差更新至l_income_xckb102d   #181030-00060#1 Add By 06137  181107
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND s_math_abs(l_income_xckb102d) >= s_math_abs(l_income_xckb102e)
#       #   AND s_math_abs(l_income_xckb102d) >= s_math_abs(l_income_xckb102f) AND s_math_abs(l_income_xckb102d) >= s_math_abs(l_income_xckb102g)
#       #   AND s_math_abs(l_income_xckb102d) >= s_math_abs(l_income_xckb102h) THEN 
#       #   LET l_income_xckb102d = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h) 	  
#       #END IF 
#       #  
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h且l_income_xckb102e(絕對值)又是最大值，將尾差更新至l_income_xckb102e   #181030-00060#1 Add By 06137  181107
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND s_math_abs(l_income_xckb102e) >= s_math_abs(l_income_xckb102f) AND s_math_abs(l_income_xckb102e) >= s_math_abs(l_income_xckb102g)
#       #   AND s_math_abs(l_income_xckb102e) >= s_math_abs(l_income_xckb102h) THEN  
#       #   LET l_income_xckb102e = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h)	  
#       #END IF
#       # 
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h且l_income_xckb102f(絕對值)又是最大值，將尾差更新至l_income_xckb102f   #181030-00060#1 Add By 06137  181107 
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND s_math_abs(l_income_xckb102f) >= s_math_abs(l_income_xckb102g)
#       #   AND s_math_abs(l_income_xckb102f) >= s_math_abs(l_income_xckb102h)  THEN      
#    	 #   LET l_income_xckb102f = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102g + l_income_xckb102h) 
#       #END IF
#       #  
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h且l_income_xckb102g(絕對值)又是最大值，將尾差更新至l_income_xckb102g   #181030-00060#1 Add By 06137  181107
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h
#       #   AND s_math_abs(l_income_xckb102g) >= s_math_abs(l_income_xckb102h) THEN 
#       #   LET l_income_xckb102g = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102h)	  
#       #END IF
#       #  
#       ##加註解：l_income_xckb102<>l_income_xckb102a加到h,將尾差更新至l_income_xckb102h   #181030-00060#1 Add By 06137  181107
#       #IF l_income_xckb102 <> l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g + l_income_xckb102h THEN
#       #   LET l_income_xckb102h = l_income_xckb102 - (l_income_xckb102a + l_income_xckb102b + l_income_xckb102c + l_income_xckb102d + l_income_xckb102e + l_income_xckb102f + l_income_xckb102g)
#       #END IF	       
#       ##170824-00029#1---mod---e       
#       ###更新xckb_t中
#       #UPDATE xckb_t SET xckb102  = xckb102 + l_income_xckb102 - l_outcome_xckb102,
#       #                  xckb102a = xckb102a + l_income_xckb102a - l_outcome_xckb102a,
#       #                  xckb102b = xckb102b + l_income_xckb102b - l_outcome_xckb102b,
#       #                  xckb102c = xckb102c + l_income_xckb102c - l_outcome_xckb102c,
#       #                  xckb102d = xckb102d + l_income_xckb102d - l_outcome_xckb102d,
#       #                  xckb102e = xckb102e + l_income_xckb102e - l_outcome_xckb102e,
#       #                  xckb102f = xckb102f + l_income_xckb102f - l_outcome_xckb102f,
#       #                  xckb102g = xckb102g + l_income_xckb102g - l_outcome_xckb102g,
#       #                  xckb102h = xckb102h + l_income_xckb102h - l_outcome_xckb102h
#       #  WHERE xckbent = g_enterprise AND xckbcomp = g_comp AND xckbld = g_master.glaald
#       #    AND xckb002 = -1 AND xckb007 = g_master.yy AND xckb008 = g_master.pp
#       #    AND xckb005 = l_xckb005 AND xckb006 = l_xckb006
#       #IF SQLCA.sqlcode THEN
#       #   INITIALIZE g_errparam TO NULL
#       #   LET g_errparam.code = SQLCA.sqlcode
#       #   LET g_errparam.extend = 'UPDATE axcp200_execute_upd_xckb_c1'
#       #   LET g_errparam.popup = TRUE
#       #   CALL cl_err()
#       #   LET r_success = FALSE
#       #   RETURN r_success
#       #END IF 
#       #190311-00010#1 mark end    -----
#         
#   END FOREACH   
#190621-00013#1---mark---e  
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 带出账套所属法人当前的"现行成本结算年度"和"现行成本结算期别"
# Memo...........:
# Usage..........: CALL axcp200_default()
# Date & Author..: 170314 By fionchen (#170207-00034#1)
# Modify.........:
################################################################################
PRIVATE FUNCTION axcp200_default()
  DEFINE l_comp     LIKE glaa_t.glaacomp   
  
  SELECT glaacomp INTO l_comp
    FROM glaa_t
   WHERE glaaent = g_enterprise
     AND glaald  = g_master.glaald
         
  CALL cl_get_para(g_enterprise,l_comp,'S-FIN-6010') RETURNING g_master.yy
  CALL cl_get_para(g_enterprise,l_comp,'S-FIN-6011') RETURNING g_master.pp
END FUNCTION

################################################################################
# Descriptions...: xckb027/xckb029/xckb031金额需记录数量对应的金额,而不是总金额,所以这边需要做拆分
# Memo...........:
# Usage..........: CALL axcp200_deal_xckb027()
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 2019/04/28 By 02295
# Modify.........: #180814-00076#1
################################################################################
PRIVATE FUNCTION axcp200_deal_xckb027()
DEFINE l_ext1       LIKE ooan_t.ooan005
DEFINE l_ext2       LIKE ooan_t.ooan005
DEFINE r_success    LIKE type_t.num5

   LET r_success = TRUE

   #发出商品转入部分xckb027的处理
   #1.用xckb032备份xckb027(因为发出商品转入的xckb027一开始记录的是原币的含税金额,这边xckb032需要记录的是本币的金额,所以要乘以汇率并取位)
   UPDATE xckb_tmp SET xckb032 = xckb027*(SELECT DISTINCT xmdk017 FROM xmdk_t WHERE xmdkent = xckbent AND xmdkdocno = xckb005)
   CASE g_round_type
      WHEN '1'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb032  = round(round(COALESCE(xckb032,0),6),",g_ooaj007_1,") "       
      WHEN '2'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb032  = (CASE WHEN MOD(round(round(COALESCE(xckb032,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb032,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb032,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                    
      WHEN '3'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb032  = trunc(round(COALESCE(xckb032,0),6),",g_ooaj007_1,")  "
      WHEN '4'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb032  = ceil(round(COALESCE(xckb032,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
   END CASE
   PREPARE xckb_deal_xckb032 FROM g_sql
   EXECUTE xckb_deal_xckb032   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_deal_xckb032"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF  


   #2.xckb014/SUM(xckb014)*xckb032 = xckb027
   #币别取位
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb_tmp a ",
               " USING (SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                        xckb003,xckb005,xckb006,xckb036,",
               "                        xckb007,xckb008,xckb014,xckb032,",
               "                        SUM(xckb014) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                                                        xckb003,xckb005,xckb006,xckb007,xckb008) xckb014_sum ",
               "         FROM xckb_tmp ) b ",
               "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld ", 
               "    AND a.xckb001 = b.xckb001 AND a.xckb002 = b.xckb002 AND a.xckb003 = b.xckb003 ",
               "    AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb007 = b.xckb007 ",
               "    AND a.xckb008 = b.xckb008 AND a.xckb036= b.xckb036) ",
               "  WHEN MATCHED THEN ",
                #"       UPDATE SET a.xckb027 = b.xckb014/b.xckb014_sum * b.xckb032 "                  #190925-00042#1 mark
                "       UPDATE SET a.xckb027 = NVL(b.xckb014/NULLIF(b.xckb014_sum,0),0) * b.xckb032 "  #190925-00042#1 add
   #PGS(D)-00824 --- end ---
   PREPARE xckb_deal_pre FROM g_sql
   EXECUTE xckb_deal_pre     
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_deal_pre"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF  

   #币种一进行取位
   CASE g_round_type
      WHEN '1'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb027  = round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,") "       
      WHEN '2'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb027  = (CASE WHEN MOD(round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                    
      WHEN '3'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb027  = trunc(round(COALESCE(xckb027,0),6),",g_ooaj007_1,")  "
      WHEN '4'
         LET g_sql = " UPDATE xckb_tmp ",
                     "    SET xckb027  = ceil(round(COALESCE(xckb027,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
   END CASE
   PREPARE xckb_deal_pre2 FROM g_sql
   EXECUTE xckb_deal_pre2   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_deal_pre2"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF   

   #3.尾差处理
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb_tmp a ",
               " USING (SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                        xckb003,xckb005,xckb006,xckb036,",
               "                        xckb007,xckb008,xckb027,xckb032,xckb027_sum ",
               "          FROM ( SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                                xckb003,xckb005,xckb006,xckb036,",
               "                                xckb007,xckb008,xckb027,xckb032,",
               "                                SUM(xckb027) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                                                                xckb003,xckb005,xckb006,xckb007,xckb008) xckb027_sum, ",
               "                                ROW_NUMBER() OVER(PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002, ", 
               "                                                               xckb003,xckb005,xckb006,xckb007,xckb008 ",               
               "                                                      ORDER BY xckbent,xckbcomp,xckbld,xckb001,xckb002, ",
               "                                                               xckb003,xckb005,xckb006,xckb007,xckb027,xckb036 DESC ) AS numm",               
               "                 FROM xckb_tmp ",              
               "               )  ",
               "         WHERE xckb027_sum <> xckb032 AND numm = 1) b",
               "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld ", 
               "    AND a.xckb001 = b.xckb001 AND a.xckb002 = b.xckb002 AND a.xckb003 = b.xckb003 ",
               "    AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb007 = b.xckb007 ",
               "    AND a.xckb008 = b.xckb008 AND a.xckb036= b.xckb036) ",
               "  WHEN MATCHED THEN ",
               "       UPDATE SET a.xckb027 = a.xckb027 - (b.xckb027_sum - b.xckb032)"
   #PGS(D)-00824 --- end ---
   PREPARE xckb_deal_pre3 FROM g_sql
   EXECUTE xckb_deal_pre3     
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_deal_pre3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF     
   

   IF g_glaa015 = 'Y' THEN  #啟用本位幣二
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa016,1,g_glaa018) RETURNING l_ext1            #金額
      UPDATE xckb_tmp
         SET xckb029 = xckb027 * l_ext1
      #币种三单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb029  = round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,") "       
         WHEN '2'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb029  = (CASE WHEN MOD(round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                    
         WHEN '3'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb029  = trunc(round(COALESCE(xckb029,0),6),",g_ooaj007_1,")  "
         WHEN '4'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb029  = ceil(round(COALESCE(xckb029,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE
      PREPARE xckb_deal_pre4 FROM g_sql
      EXECUTE xckb_deal_pre4   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb_deal_pre4"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF          
   END IF       
   
   IF g_glaa019 = 'Y' THEN  #啟用本位幣三
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa020,1,g_glaa022) RETURNING l_ext2            #金額
      UPDATE xckb_tmp
         SET xckb031 =  xckb027 * l_ext2
      #币种三单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb031  = round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,") "       
         WHEN '2'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb031  = (CASE WHEN MOD(round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                   
         WHEN '3'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb031  = trunc(round(COALESCE(xckb031,0),6),",g_ooaj007_1,")  "
         WHEN '4'
            LET g_sql = " UPDATE xckb_tmp ",
                        "    SET xckb031  = ceil(round(COALESCE(xckb031,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE
      PREPARE xckb_deal_pre5 FROM g_sql
      EXECUTE xckb_deal_pre5   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb_deal_pre5"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF 
   END IF      
   
   ------------------------------------------------------------------------------------------------
   #发出商品转出部分xckb027的处理
   #1.用xckb032备份xckb027
   UPDATE xckb2_tmp SET xckb032 = xckb027
   
   #2.xckb014/SUM(xckb014)*xckb032 = xckb027
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb2_tmp a ",
               " USING (SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                        xckb003,xckb005,xckb006,xckb036,",
               "                        xckb007,xckb008,xckb014,xckb032,",
               "                        SUM(xckb014) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                                                        xckb003,xckb005,xckb006,xckb007,xckb008) xckb014_sum ",
               "         FROM xckb2_tmp ) b ",
               "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld ", 
               "    AND a.xckb001 = b.xckb001 AND a.xckb002 = b.xckb002 AND a.xckb003 = b.xckb003 ",
               "    AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb007 = b.xckb007 ",
               "    AND a.xckb008 = b.xckb008 AND a.xckb036= b.xckb036) ",
               "  WHEN MATCHED THEN ",
                 #"       UPDATE SET a.xckb027 = b.xckb014/b.xckb014_sum * b.xckb032 "                  #190925-00042#1 mark
                "       UPDATE SET a.xckb027 = NVL(b.xckb014/NULLIF(b.xckb014_sum,0),0) * b.xckb032 "  #190925-00042#1 add
   #PGS(D)-00824 --- end ---
   PREPARE xckb2_deal_pre FROM g_sql
   EXECUTE xckb2_deal_pre     
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_deal_pre"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF  

   #币种一进行取位
   CASE g_round_type
      WHEN '1'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb027  = round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,") "       
      WHEN '2'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb027  = (CASE WHEN MOD(round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,") ",
                     "                         ELSE round(round(COALESCE(xckb027,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                    
      WHEN '3'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb027  = trunc(round(COALESCE(xckb027,0),6),",g_ooaj007_1,")  "
      WHEN '4'
         LET g_sql = " UPDATE xckb2_tmp ",
                     "    SET xckb027  = ceil(round(COALESCE(xckb027,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
   END CASE
   PREPARE xckb2_deal_pre2 FROM g_sql
   EXECUTE xckb2_deal_pre2   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_deal_pre2"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF   

   #3.尾差处理
   #PGS(D)-00824 ---start---
   LET g_sql = " MERGE INTO xckb2_tmp a ",
               " USING (SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                        xckb003,xckb005,xckb006,xckb036,",
               "                        xckb007,xckb008,xckb027,xckb032,xckb027_sum ",
               "          FROM ( SELECT DISTINCT xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                                xckb003,xckb005,xckb006,xckb036,",
               "                                xckb007,xckb008,xckb027,xckb032,",
               "                                SUM(xckb027) OVER (PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002,",
               "                                                                xckb003,xckb005,xckb006,xckb007,xckb008) xckb027_sum, ",
               "                                ROW_NUMBER() OVER(PARTITION BY xckbent,xckbcomp,xckbld,xckb001,xckb002, ", 
               "                                                               xckb003,xckb005,xckb006,xckb007,xckb008 ",               
               "                                                      ORDER BY xckbent,xckbcomp,xckbld,xckb001,xckb002, ",
               "                                                               xckb003,xckb005,xckb006,xckb007,xckb027,xckb036 DESC ) AS numm",               
               "                 FROM xckb2_tmp ",              
               "               )  ",
               "         WHERE xckb027_sum <> xckb032 AND numm = 1) b",
               "    ON (a.xckbent = b.xckbent AND a.xckbcomp = b.xckbcomp AND a.xckbld = b.xckbld ", 
               "    AND a.xckb001 = b.xckb001 AND a.xckb002 = b.xckb002 AND a.xckb003 = b.xckb003 ",
               "    AND a.xckb005 = b.xckb005 AND a.xckb006 = b.xckb006 AND a.xckb007 = b.xckb007 ",
               "    AND a.xckb008 = b.xckb008 AND a.xckb036= b.xckb036) ",
               "  WHEN MATCHED THEN ",
               "       UPDATE SET a.xckb027 = a.xckb027 - (b.xckb027_sum - b.xckb032)"
   #PGS(D)-00824 --- end ---
   PREPARE xckb2_deal_pre3 FROM g_sql
   EXECUTE xckb2_deal_pre3     
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_deal_pre3"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF     
   

   IF g_glaa015 = 'Y' THEN  #啟用本位幣二
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa016,1,g_glaa018) RETURNING l_ext1            #金額
      UPDATE xckb2_tmp
         SET xckb029 = xckb027 * l_ext1
      #币种三单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb029  = round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,") "       
         WHEN '2'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb029  = (CASE WHEN MOD(round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb029,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                    
         WHEN '3'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb029  = trunc(round(COALESCE(xckb029,0),6),",g_ooaj007_1,")  "
         WHEN '4'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb029  = ceil(round(COALESCE(xckb029,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE
      PREPARE xckb2_deal_pre4 FROM g_sql
      EXECUTE xckb2_deal_pre4   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb2_deal_pre4"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF          
   END IF       
   
   IF g_glaa019 = 'Y' THEN  #啟用本位幣三
      CALL s_aooi160_get_exrate('2',g_master.glaald,g_today,g_glaa001,g_glaa020,1,g_glaa022) RETURNING l_ext2            #金額
      UPDATE xckb2_tmp
         SET xckb031 =  xckb027 * l_ext2
      #币种三单价进行取位
      CASE g_round_type
         WHEN '1'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb031  = round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,") "       
         WHEN '2'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb031  = (CASE WHEN MOD(round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,"),(2/power(10,",g_ooaj007_1,")))=0 THEN round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,") ",
                        "                         ELSE round(round(COALESCE(xckb031,0),6),",g_ooaj007_1,")-(1/power(10,",g_ooaj007_1,")) END ) "                   
         WHEN '3'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb031  = trunc(round(COALESCE(xckb031,0),6),",g_ooaj007_1,")  "
         WHEN '4'
            LET g_sql = " UPDATE xckb2_tmp ",
                        "    SET xckb031  = ceil(round(COALESCE(xckb031,0),6)*power(10,",g_ooaj007_1,"))/power(10,",g_ooaj007_1,") "
      END CASE
      PREPARE xckb2_deal_pre5 FROM g_sql
      EXECUTE xckb2_deal_pre5   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.extend = "EXECUTE xckb2_deal_pre5"
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF 
   END IF   
   
   #190528-00003#1---add---s
   LET g_sql = " UPDATE xckb_tmp ",
               "    SET xckb027 = -1 * xckb027,",
               "        xckb029 = -1 * xckb029,",
               "        xckb031 = -1 * xckb031 ",
               "  WHERE EXISTS(SELECT 1 FROM xmdk_t WHERE xckbent = xmdkent AND xckb005 = xmdkdocno AND xmdk000 ='6') "
   PREPARE xckb_deal_pre6 FROM g_sql
   EXECUTE xckb_deal_pre6   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb_deal_pre6"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF    
   
   LET g_sql = " UPDATE xckb2_tmp ",
               "    SET xckb027 = -1 * xckb027,",
               "        xckb029 = -1 * xckb029,",
               "        xckb031 = -1 * xckb031 ",
               "  WHERE EXISTS(SELECT 1 FROM xmdk_t WHERE xckbent = xmdkent AND xckb005 = xmdkdocno AND xmdk000 ='6') "
   PREPARE xckb2_deal_pre6 FROM g_sql
   EXECUTE xckb2_deal_pre6   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code   = SQLCA.sqlcode
      LET g_errparam.extend = "EXECUTE xckb2_deal_pre6"
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF               
   #190528-00003#1---add---e
   
   RETURN r_success
END FUNCTION

#end add-point
 
{</section>}
 
