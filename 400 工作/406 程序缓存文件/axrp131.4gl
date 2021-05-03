#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axrp131.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0103(2019-03-07 14:25:56), PR版次:0103(2021-01-20 13:35:25)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000444
#+ Filename...: axrp131
#+ Description: 暫估應收批次立帳作業
#+ Creator....: 01727(2014-10-09 09:30:21)
#+ Modifier...: 09232 -SD/PR- 05795
 
{</section>}
 
{<section id="axrp131.global" type="s" >}
#應用 p01 樣板自動產生(Version:23)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#20150201#1                   By 01727    為了規避多用戶並行執行程序導致出貨/銷退單重複拋磚應收,對拋轉邏輯進行修改：
#                                         取得符合條件的資料集後,在FOREACH中每一筆資料單獨走一次事物
#                                         在事物中,先將取得的出貨/銷退單鎖住,然後再進行拋轉前的欄位複製
#                                         最後再插入應收表之前，再次判斷出貨單/銷退單的可用性
#                                         在拋轉應收結束後無論成功否放開出貨單/銷退單資料
#                                         最後將失敗的資料和成功的資料用資料匯總報錯出來
#150309-00036#1   2015/04/01  By 01727    銷退單立帳條件sql統一:
#                                         1.統一加入 AND xmdk000 IN ('1','2','3','6')
#                                         2.銷退單條件增加排除xmdk082
#                                         OR (xmdk000 = 6 AND xmdk082<>'5') )
#150515-00013#3               By 01727    檢查， 若為本位幣立帳者，本幣金額=原幣金額， 本幣不要重算s_tax
#150807-00010#1   2015/08/10  By Belle    若為axmt600的金額折讓xrcb021取理由碼的會科
#150724-00007#3   2015/10/08  By 01727    xmdlsite需要限定為帳套歸屬法人的下級據點，現在是用賬務中心的下層據點
#151015-00006#1   2015/10/21  By 01727    cnt定义chr1，导致程序执行错误 DEFINE统一定义为同seq一致
#150828-00001#2   2015/10/23  By 01727    axrt3* 的程式 xrcb005 存品名加規格, 中間以 '/' 區間
#151123-00013#6   2015/11/27  By 01727    簽收訂單則取出貨簽收單,一般訂單則取出貨單
#151125-00006#1   2015/12/05  By 06862    生成單據后立即審核，立即拋轉傳票
#151207-00018#1   2015/12/09  By 01727    銷退時只取銷退單,不在抓取銷退簽收單
#151231-00010#9   2016/03/04  By 02599    增加控制组权限控管
#160120-00011#3   2016/03/23  By 02114    1.取用 s_get_item_acc時, 須增加補足可傳入的參數值 
#                                         (1). AXR:取用s_get_item_acc時, 須增加補足可傳入的參數值 
#                                         p_kind   採購分群  :  取單頭的 【銷售分類xrca058】 
#                                         p_trade  交易通路  :  傳入渠道, 取單身的【渠道xrcb034】 
#                                         p_site   營運據點  :  不變 #                  
#                                         p_ware   倉庫別    :  取來源單號的庫別欄位, 即出貨/銷退單的【庫別xmdl014】;  無對應來源單號者，則以空白傳入。
#160318-00005#51  2016/03/29  by 07959    將重複內容的錯誤訊息置換為公用錯誤訊息
#160325-00023#1   2016/03/29  By Hans     單別流程-預設單別修改 根據aooi210設置之流程修改單別合理性
#160318-00025#42  2016/04/25  By pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160505-00005#1   2016/05/06  By 01531    取法人據點之交易對象檔,若取不到法人據點時, 取 據點代碼='ALL'
#160520-00008#1   2016/05/20  By 01727    批次产生以及新增的时候，xrcb015赋值xmdl030
#160614-00016#1   2016/06/21  By 01727    axrt3* 出/退單時, 單位應取來源單的  "計價單位"
#151008-00009#8   2016/06/23  By 03538    有設定對應的遞延類型,則要產生遞延收入檔,並且影響分錄底稿
#160715-00017#1   2016/07/18  by 01727    根据SCC码2077确定出貨/簽收/銷退單據性質中可以立应收账款的单据性质 (gzcb003 = 'Y')
#                                         根据SCC码2088确定销退单据可以应收的销退方式 (gzcb003 = 'Y')
#160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01
#160731-00372#1   2016/08/15  By 07900    客户开窗不要开供应商
#160811-00009#4   2016/08/22  By 01531    账务中心/法人/账套权限控管
#160816-00014#1   2016/08/22  By 01727    含稅立沖暫估規格優化
#160830-00047#1   2016/08/30  BY 01727    axrp13*抛转应收单据没有给单身xrcb102默认值
#160905-00007#3   2016/09/05  By zhujing  调整系统中无ENT的SQL条件增加ent
#160906-00017#1   2016/09/06  By 00768    当参数设置立账不含税时，增加金额按币种设置小数位数的取位
#160913-00017#7   2016/09/22  By 07900    AXR模组调整交易客商开窗
#160802-00007#1   2016/09/26  By 01727    一次性交易對象識別碼(pmaa004=2)功能應用
#160920-00011#1   2016/09/29  By 01727    立暂估不考虑是否对账（aist310），结果会导致同一笔出货单10,000（axrt300立账10,000+axrt320暂估10,000）
#160921-00018#1   2016/10/10  By 01727    计算应收款日和票到期日日期使用错误
#161021-00050#2   2016/10/24  By 08729    處理組織開窗
#161025-00017#1   2016/10/26  By 01531    出货单axmt500&销退单axmt600的销售渠道xmdk030需带入应收单身的渠道xrcb034   
#161026-00013#1   2016/10/26  By 06821    組織類型與職能開窗調整
#161102-00034#1   2016/11/03  By 01727    立暂估数量不考虑已开立发票数量
#161111-00049#6   2016/11/24  By 01727    控制组权限修改
#161128-00061#3   2016/12/01 by 02481     标准程式定义采用宣告模式,弃用.*写法
#170112-00002#1   2017/01/12  By 08532    將axrp131、axrp133中的l_amount定義調整為 LIKE xmdl_t.xmdl022
#160711-00040#37  2017/02/24  By 09042    单别开窗，加上控制组条件
#161102-00015#2   2017/03/14  By 06821    未啟用的核算項要放一個空白存檔
#170323-00108#1   2017/03/25  By 01531    當 aoos020 應收暫估立稅選項 為2.含稅時 稅別無法選擇含稅的稅別
#170421-00052#1   2017/05/03  By 04150    1.立帳日期一律必填 2.彙總條件為1依單號時,立帳日直接抓原單日期
#170420-00074#1   170523      By albireo  銷退依銷貨單發票開立方式決定科目取用原則
#170603-00022#1   2017/06/15  By 02599    金额依币别取位
#170531-00070#1   2017/07/13  By 02599    当稅别栏位录入资料时，单据编号开窗抓取与稅别相同的单据
#170426-00060#1   2017/07/25  By 01531    根據aooi200單別預設账款类别
#170718-00043#1   2017/07/27  By 09232    将元件s_control_get_customer_sql_pmab('4',g_site,g_user,g_dept,'',g_xrca_m.xrcacomp) 第一个参数4改为2
#170711-00047#1   2017/08/07  By 05795    當暫估不含稅時，為什麼轉出來的axrt320未稅金額會是該筆出貨的全額?而不是數量*未稅單價?
#                                         SA告知為了避免尾差問題,建議採倒扣方式計算 用以下判斷式判斷是否為部分暫估當
#                                          主帳套已立帳數量(xmdl038) > 0 且 計價數量(xmdl022) <> 主帳套已立帳數量(xmdl038) 時 
#                                          暫估未稅金額 = 出貨未稅金額(xmdl027) - 交易原幣未稅金額(xrcb103)
#170808-00010#1   2017/08/08  By 05795     #170711-00047#1這個的修改中，要判斷單據狀態，不能只撈xrcb
#170807-00016#1   2017/08/17  by 08172     交易对象和单据编号开窗限制收款条件，捞取抛转资料时过滤收款条件
#170419-00018#1   2017/08/21  By 01531     增加檢核控卡, 如單據存在對帳但未立帳時, 控卡不可立暫估以出貨單(銷退單)+項次檢核
#170814-00012#34  2017/09/15  By 10044     開窗q_ooeg001_4與q_ooeg001 內容相同,整批修改
#170713-00063#40  2017/09/26  By 10042     修改校驗帶值出現的錯誤訊息(v_oocq)
#171018-00034#1   2017/10/19  By 05795     axrp131拋轉一張暫估單(axrt320)時,會自動產生分錄底稿,但一次產生多張暫估單時,只有最後一張會產生分錄底稿
#171020-00002#1   2017/10/20  By 06821     當 aoos020 參數為含稅立帳暫估時,input 段的稅別請于以隱藏 參考 aapp131 作法
#170413-00024#1   2017/11/16  By 01531     axrt320的單身xrcb010業務部門取值：axrp131  非依【业务人员汇总】时，則單身部門取值時，
#                                          有訂單時xrcb 單身取出貨單對應訂單上業務人員及部門，無訂單時取出貨單上的人員及部門。
#171113-00034#1   2017/11/29  By 07900     S-FIN-2012=1 不含税立账时，axrp131的xrca011【税种】栏位预带aoos020设定的零税税种，不可为空，可修改，开窗输入检核存在于aooi610有效资料，并且课税种=2 零税；
#170901-00012#1   2017/12/06  By 09773     修改产生到axrt320的【异动资讯】页签的资料录入日期为日期时间格式
#171207-00020#1   2017/12/07  By 00537     #170419-00018#1定义错误，l_num定义改为like xmdl022
#171204-00010#1   2017/12/07  By 10043     產生暫估單時,單身收入科目未清空變數,造成科目無法依設定重取,導致暫估單拋出後收入科目皆同第一筆資訊
#171205-00006#1   2017/12/12  by 08172     汇总条件为1.依出货单号时，立账日期以画面立账日期为准
#180109-00028#1   2018/01/10  By 09232     将axmt540专案编号和WBS编号带到axrt320核算项专案编号和WBS编号栏位中
#180109-00029#1   2018/01/19  By 09232     axrp131处理数据仅该张出货单，且该出货单仅有一个项次，但生成成功时提示的信息却有两条，重复了
#171013-00004#3   2018/03/05  By 07900     将 s_axrt300_item_acc 替换成 s_get_item_acc，原有逻辑不变.
#180321-00029#1   2018/03/22  By 08729     立暫估時不能選擇扣賬日比立帳日期還要大的出貨單
#180326-00027#1   2018/03/27  By 05795     銷退暫估時，單頭跟單身的收入科目，應以銷退單的銷退性質，帶銷貨退回或銷或折讓的科目
#180416-00030#1   2018/04/23  By 09232     对于有来源单据的，单身本币单价xrcb111取位不对,应该取aooi150单价小数位数
#180329-00029#1   2018/05/16  By 09773     1.畫面增加批次立帳作業增加"單價為0是否立帳"的選項欄位
#                                          2.程式添加對批次作業的過濾
#180509-00055#2   2018/05/22  By 10043     整批調整 s_aooi210_get_check_sql 傳參值
#180221-00030#1   2018/06/06  By 09773     不含税立暂估时，调整暂估单价为未税单价，并根据出货单别含税否推算含税金额或未税金额
#180625-00055#1   2018/06/27  By 09232     原币单价应该用原币取位
#180604-00064#1   2018/07/31  by 08172     优化报错信息'axr-01079'
#180731-00017#33  2018/08/16  By 11387     修改日期格式
#180803-00011#1   2018/08/22  By 09505     自动产生到单身的时候，单身帐款对象和收款对象添加默认值
#180928-00002#1   2018/09/28  By 01531     銷貨收入科目抓取agli161時,銷售分類帶入條件的預設如下:
#                                          帳款單頭銷售分類(可為空),維持由對象預設的銷售分類(可為空)帶入.
#                                          單身取銷貨收入科目抓取agli161時,銷售分類抓取順序:
#                                          1.有來源單據:取來源單上的銷售分類(可為空)-->帳單頭銷售分類(可為空)
#180705-00083#3   2018/10/10  by 08172     1.单身其他信息页签账款对象,收款对象,业务人员,业务部门为空时给单头
#                                          2.依账款科目+收入科目+税额科目所启用的固定核算项并集，取该固定核算项在agli051的设定值为默认值
#                                          3.依账款科目+收入科目+税额科目所启用的自由核算项并集，取该自由核算项在agli043的设定值为默认值
#181012-00009#1   2018/10/19  By 01531     出货单部分应收剩下的再立暂估时：axrt300单头输入出货单的方式产生单身资料时，xrcbsite资料没有给值；
#                                          抓冲暂估时检核已冲暂估金额时，xrcbsite为空，导致没有抓到金额，导致立暂估时全额立的暂估。
#180727-00024#2   2018/10/22  By 09232     彙總方式為, 1.依出貨單, 則日期可空白, 空白時以庫存扣帳日為帳款單日期, 其余匯總方式則日期不可空白。
#181112-00009#1   2018/11/28  By 09232     切换营运据点后， 单价为0立账  的默认值被清空
#181227-00033#1   2018/12/28  By 09232     判断账款对象的“法人类型” 如果是“一次性交易对象或员工” xrca057给xmdk047的值否则给xrca004
#190103-00017#1   2019/01/03  By 05016     過欄位/執行時 控卡無維護會計週期參照表 
#180821-00038#10  2018/11/21  By 01531     单据编号开窗/产生资料 限定只能立一次暂；可立暂估数量重新计算
#190122-00041#1   2019/01/24  By 09232     出货单1月出货，尚未立暂估，次月先做了aist310对账还没抛axrt300；但是补做1月的暂估单系统会有卡控报错（axr-93210）。应该卡控1月31日之前对账的出货单才不能立暂估。
#180928-00039#1   2019/03/06  By 09232     1.input查询 增加 内外销栏位，
#                                          2.扣账日期 改成 扣账日期/结关日期  
#                                          3.如果是外销出货单 将qbe日期条件 xmdk001改为xmdk032 销退单日期条件用xmdk001 如果是内销不管出货单还是销退全部用xmdk001
#                                          4.画面立账日期为null，如果是外销出货 立账日期给结关日期xmdk032 ，外销销退给扣账日期xmdk001 内销给xmdk001
#190118-00038#1   2019/03/01  By 11384     s_tax_ins()之後,要判斷xrcd009為空才update xrcd_t
#190503-00010#1   2019/05/07  By 05634     調整可立暫估金額計算邏輯
#190423-00042#8   2019/05/24  By 11384     当单身来源项目编号/WBS编号有值时,将xmdl030/xmdl031带入xrcb015/xrcb016
#190905-00010#1   2019/09/06  By 11234     暂估的税种会计科目先从axri011中取，取不到再从aisi070中取
#190812-00010#5   2019/09/11  By 01531     axrp13 * 抓取收入科目時取 agli161 若有設銷售分群時, 以銷售分群取科目
#190927-00005#1   2019/09/27  By 08729     axrp131背景排程執行，沒有將input參數傳入，導致無法產生
#190305-00001#3   2019/10/24  By 10500     若【来源作业类型】=21.销退单 则【收入科目xrcb021】根据仓退类型优先抓取agli161【仓退/销货退回科目glcc023】【进货金额折让/金额折让科目glccc024】栏位值
#191224-00028#1   2019/12/25  By 08729     如果立暫估時的計價數量 = 暫估數量，則將出貨單的金額帶到暫估單單身
#191227-00043#1   2019/12/30  By 08729     將客戶分類由axmm200帶出，但如果agli051有維護則為優先
#191030-00020#1   2020/01/03  By 08729     將品牌分類由aimm200帶出，但如果agli051有維護則為優先
#180827-00015#1   2020/01/03  By 01531     AR有開一個xrcb048的[客戶訂購單號], 但在產生時, 沒有給值進來應自動帶入訂單號
#181025-00018#1   2020/01/19  By 10500     当【汇总条件】=1.依出货单号时【立账日期】给空白
#200120-00025#1   2020/02/03  By 10500     按需求单180727-00024的说明 在获取计价数量之前 判断若汇总方式=1.依出货单且日期为空 应给予日期预设值=单据上的库存扣账日期
#200302-00005#10  2020/03/16  By 13132     整批调整批次完成后串查功能
#200317-00037#1   2020/04/03  By 01531     出货单将费用性料件的【备注】xmdl051生成至品名规格xrcb005
#200410-00009#1   2020/04/10  By 01531     开窗可开出，但执行axrp131时报无符合条件数据
#190318-00028#1   2020/04/22  By 10500     在直接审核(D-FIN-0031='Y')前加上对权限的判断
#200423-00021#1   2020/06/18  By 13067     参照表号进行同步更新
#200415-00064#6   2020/06/19  by 08172     1.修正暂估账款对象，收款对象，发票客户给值
#                                          2.根据账款对象+收款对象+发票客户拆单
#200603-00142#1   2020/07/01  by 13656     建立临时表s_def_pay_cre_tmp()
#200716-00011#1   2020/07/29  By 11234     税种设置为正常税率时，axrp131中依交易对象汇总，应当根据税种拆分，生成到不同的暂估单中
#200918-00057#1   2020/09/21  By 11234     参照191224-00028改法，在g_sfin2012 = '1'不含税立暂估的段落也加上相同逻辑
#200925-00016#1   2020/10/09  By 01531     手工输入税种管控调整，q_oodb002_5过滤内容以【0%+应税+1:正常税率】调整
#200724-00031#1   2020/12/08  By 13067     为外销时，开窗的关联条件改为xmdk032
#201023-00028#22  2020/12/24  by 08172     税额科目优先取aisi070税种对应的预设会计科目
#210114-00016#1   2021/01/14  By 05795     D-FIN-0031为Y的时候，会报错
#210120-00023#1   2021/01/20  By 05795     补充#210114-00016#1
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
        #190927-00005#1 add(s)
        xrcasite    LIKE xrca_t.xrcasite, 
        xrcald      LIKE xrca_t.xrcald,
        xrcadocno   LIKE xrca_t.xrcadocno,
        xrca008     LIKE xrca_t.xrca008,
        xrca007     LIKE xrca_t.xrca007,
        b_comb1     LIKE type_t.chr500,
        xrcadocdt   LIKE xrca_t.xrcadocdt,
        b_comb2     LIKE type_t.chr500,
        xrca011     LIKE xrca_t.xrca011,
        xmdk042     LIKE type_t.chr10,
        l_price     LIKE type_t.chr500,
        #190927-00005#1 add(e)
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       xrcasite LIKE xrca_t.xrcasite, 
   xrcasite_desc LIKE ooefl_t.ooefl003, 
   xrcald LIKE xrca_t.xrcald, 
   xrcald_desc LIKE glaal_t.glaal002, 
   xrcadocno LIKE xrca_t.xrcadocno, 
   fflabel_desc LIKE type_t.chr80, 
   xrca008 LIKE xrca_t.xrca008, 
   xrca007 LIKE xrca_t.xrca007, 
   b_comb1 LIKE type_t.chr500, 
   xrcadocdt LIKE xrca_t.xrcadocdt, 
   b_comb2 LIKE type_t.chr500, 
   xrca011 LIKE xrca_t.xrca011, 
   xmdk042 LIKE type_t.chr10, 
   l_price LIKE type_t.chr500, 
   xmdk007 LIKE xmdk_t.xmdk007, 
   fflabel1_desc LIKE type_t.chr80, 
   xmdkdocno LIKE xmdk_t.xmdkdocno, 
   xmdk001 LIKE xmdk_t.xmdk001, 
   xmdk003 LIKE xmdk_t.xmdk003, 
   xmdk000 LIKE xmdk_t.xmdk000, 
   xmdk004 LIKE xmdk_t.xmdk004, 
   xmdk012 LIKE xmdk_t.xmdk012, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
DEFINE g_condition_display LIKE type_t.chr1   #180813-00044
 
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_master_o      type_master   #190103-00017#1 add

#200302-00005#10 add s---
DEFINE g_strno      LIKE xrca_t.xrcadocno
DEFINE g_endno      LIKE xrca_t.xrcadocno
#200302-00005#10 add e---
#20150201#1 By zhangwei Add ---(S)---
TYPE type_xmdk RECORD
   order       LIKE type_t.chr200,
   xmdldocno   LIKE xmdl_t.xmdldocno,
   xmdlseq     LIKE xmdl_t.xmdlseq,
   xrcb007     LIKE xrcb_t.xrcb007,
   xmdk047     LIKE xmdk_t.xmdk047   #160802-00007#1 Add
       END RECORD
DEFINE g_xmdk_d DYNAMIC ARRAY OF type_xmdk
#20150201#1 By zhangwei Add ---(E)---
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
#161128-00061#3-----modify--begin----------
#DEFINE g_glaa                RECORD LIKE glaa_t.*
#DEFINE g_xrca                RECORD LIKE xrca_t.*
#DEFINE g_xrcb                RECORD LIKE xrcb_t.*
DEFINE g_xrca RECORD  #應收憑單單頭
       xrcaent LIKE xrca_t.xrcaent, #企業編號
       xrcaownid LIKE xrca_t.xrcaownid, #資料所有者
       xrcaowndp LIKE xrca_t.xrcaowndp, #資料所屬部門
       xrcacrtid LIKE xrca_t.xrcacrtid, #資料建立者
       xrcacrtdp LIKE xrca_t.xrcacrtdp, #資料建立部門
       xrcacrtdt LIKE xrca_t.xrcacrtdt, #資料創建日
       xrcamodid LIKE xrca_t.xrcamodid, #資料修改者
       xrcamoddt LIKE xrca_t.xrcamoddt, #最近修改日
       xrcacnfid LIKE xrca_t.xrcacnfid, #資料確認者
       xrcacnfdt LIKE xrca_t.xrcacnfdt, #資料確認日
       xrcapstid LIKE xrca_t.xrcapstid, #資料過帳者
       xrcapstdt LIKE xrca_t.xrcapstdt, #資料過帳日
       xrcastus LIKE xrca_t.xrcastus, #狀態碼
       xrcacomp LIKE xrca_t.xrcacomp, #法人
       xrcald LIKE xrca_t.xrcald, #帳套
       xrcadocno LIKE xrca_t.xrcadocno, #應收帳款單號碼
       xrcadocdt LIKE xrca_t.xrcadocdt, #帳款日期
       xrca001 LIKE xrca_t.xrca001, #帳款單性質
       xrcasite LIKE xrca_t.xrcasite, #帳務中心
       xrca003 LIKE xrca_t.xrca003, #帳務人員
       xrca004 LIKE xrca_t.xrca004, #帳款客戶編號
       xrca005 LIKE xrca_t.xrca005, #收款客戶
       xrca006 LIKE xrca_t.xrca006, #客戶分類
       xrca007 LIKE xrca_t.xrca007, #帳款類別
       xrca008 LIKE xrca_t.xrca008, #收款條件編號
       xrca009 LIKE xrca_t.xrca009, #應收款日/應扣抵日
       xrca010 LIKE xrca_t.xrca010, #容許票據到期日
       xrca011 LIKE xrca_t.xrca011, #稅別
       xrca012 LIKE xrca_t.xrca012, #稅率
       xrca013 LIKE xrca_t.xrca013, #含稅否
       xrca014 LIKE xrca_t.xrca014, #人員編號
       xrca015 LIKE xrca_t.xrca015, #部門編號
       xrca016 LIKE xrca_t.xrca016, #來源作業類型
       xrca017 LIKE xrca_t.xrca017, #產生方式
       xrca018 LIKE xrca_t.xrca018, #來源參考單號
       xrca019 LIKE xrca_t.xrca019, #系統產生對應單號(待抵帳款-預收)
       xrca020 LIKE xrca_t.xrca020, #信用狀申請流程否
       xrca021 LIKE xrca_t.xrca021, #商業發票號碼(IV no.)
       xrca022 LIKE xrca_t.xrca022, #出口報單號碼
       xrca023 LIKE xrca_t.xrca023, #發票客戶編號
       xrca024 LIKE xrca_t.xrca024, #發票客戶統一編號
       xrca025 LIKE xrca_t.xrca025, #發票客戶全名
       xrca026 LIKE xrca_t.xrca026, #發票客戶地址
       xrca028 LIKE xrca_t.xrca028, #發票類型
       xrca029 LIKE xrca_t.xrca029, #發票匯率
       xrca030 LIKE xrca_t.xrca030, #發票應開未稅金額
       xrca031 LIKE xrca_t.xrca031, #發票應開稅額
       xrca032 LIKE xrca_t.xrca032, #發票應開含稅金額
       xrca033 LIKE xrca_t.xrca033, #專案編號
       xrca034 LIKE xrca_t.xrca034, #責任中心
       xrca035 LIKE xrca_t.xrca035, #應收(借方)科目編號
       xrca036 LIKE xrca_t.xrca036, #收入(貸方)科目編號
       xrca037 LIKE xrca_t.xrca037, #分錄傳票產生否
       xrca038 LIKE xrca_t.xrca038, #拋轉傳票號碼
       xrca039 LIKE xrca_t.xrca039, #會計檢核附件份數
       xrca040 LIKE xrca_t.xrca040, #留置否
       xrca041 LIKE xrca_t.xrca041, #留置理由碼
       xrca042 LIKE xrca_t.xrca042, #留置設定日期
       xrca043 LIKE xrca_t.xrca043, #留置解除日期
       xrca044 LIKE xrca_t.xrca044, #留置原幣金額
       xrca045 LIKE xrca_t.xrca045, #留置說明
       xrca046 LIKE xrca_t.xrca046, #關係人否
       xrca047 LIKE xrca_t.xrca047, #多角序號
       xrca048 LIKE xrca_t.xrca048, #集團代收/代付單號
       xrca049 LIKE xrca_t.xrca049, #來源營運中心編號
       xrca050 LIKE xrca_t.xrca050, #交易原始單據份數
       xrca051 LIKE xrca_t.xrca051, #作廢理由碼
       xrca052 LIKE xrca_t.xrca052, #列印次數
       xrca053 LIKE xrca_t.xrca053, #備註
       xrca054 LIKE xrca_t.xrca054, #多帳期設定
       xrca055 LIKE xrca_t.xrca055, #繳款優惠條件
       xrca056 LIKE xrca_t.xrca056, #會計檢核附件狀態
       xrca057 LIKE xrca_t.xrca057, #交易對象識別碼
       xrca058 LIKE xrca_t.xrca058, #銷售分類
       xrca059 LIKE xrca_t.xrca059, #預算編號
       xrca060 LIKE xrca_t.xrca060, #發票開立原則
       xrca061 LIKE xrca_t.xrca061, #預計開立發票日期
       xrca062 LIKE xrca_t.xrca062, #多角性質
       xrca063 LIKE xrca_t.xrca063, #整帳批序號
       xrca064 LIKE xrca_t.xrca064, #訂金序次
       xrca065 LIKE xrca_t.xrca065, #發票編號
       xrca066 LIKE xrca_t.xrca066, #發票號碼
       xrca100 LIKE xrca_t.xrca100, #交易原幣別
       xrca101 LIKE xrca_t.xrca101, #原幣匯率
       xrca103 LIKE xrca_t.xrca103, #原幣未稅金額
       xrca104 LIKE xrca_t.xrca104, #原幣稅額
       xrca106 LIKE xrca_t.xrca106, #原幣直接折抵合計金額
       xrca107 LIKE xrca_t.xrca107, #原幣直接沖帳(調整)合計金額
       xrca108 LIKE xrca_t.xrca108, #原幣應收金額
       xrca113 LIKE xrca_t.xrca113, #本幣未稅金額
       xrca114 LIKE xrca_t.xrca114, #本幣稅額
       xrca116 LIKE xrca_t.xrca116, #本幣直接沖帳(調整)合計金額
       xrca117 LIKE xrca_t.xrca117, #本幣直接沖帳(調整)合計金額
       xrca118 LIKE xrca_t.xrca118, #本幣應收金額
       xrca120 LIKE xrca_t.xrca120, #本位幣二幣別
       xrca121 LIKE xrca_t.xrca121, #本位幣二匯率
       xrca123 LIKE xrca_t.xrca123, #本位幣二未稅金額
       xrca124 LIKE xrca_t.xrca124, #本位幣二稅額
       xrca126 LIKE xrca_t.xrca126, #本位幣二直接折抵合計金額
       xrca127 LIKE xrca_t.xrca127, #本位幣二直接沖帳(調整)合計金額
       xrca128 LIKE xrca_t.xrca128, #本位幣二應收金額
       xrca130 LIKE xrca_t.xrca130, #本位幣三幣別
       xrca131 LIKE xrca_t.xrca131, #本位幣三匯率
       xrca133 LIKE xrca_t.xrca133, #本位幣三未稅金額
       xrca134 LIKE xrca_t.xrca134, #本位幣三稅額
       xrca136 LIKE xrca_t.xrca136, #本位幣三直接折抵合計金額
       xrca137 LIKE xrca_t.xrca137, #本位幣三直接沖帳(調整)合計金額
       xrca138 LIKE xrca_t.xrca138  #本位幣三應收金額
END RECORD

DEFINE g_xrcb RECORD  #應收憑單單身
       xrcbent LIKE xrcb_t.xrcbent, #企業編號
       xrcbld LIKE xrcb_t.xrcbld, #帳套
       xrcbdocno LIKE xrcb_t.xrcbdocno, #單號
       xrcbseq LIKE xrcb_t.xrcbseq, #項次
       xrcbsite LIKE xrcb_t.xrcbsite, #營運據點
       xrcborga LIKE xrcb_t.xrcborga, #帳務來源SITE
       xrcb001 LIKE xrcb_t.xrcb001, #來源類型
       xrcb002 LIKE xrcb_t.xrcb002, #來源業務單據號碼
       xrcb003 LIKE xrcb_t.xrcb003, #來源業務單據項次
       xrcb004 LIKE xrcb_t.xrcb004, #產品編號
       xrcb005 LIKE xrcb_t.xrcb005, #品名規格
       xrcb006 LIKE xrcb_t.xrcb006, #單位
       xrcb007 LIKE xrcb_t.xrcb007, #計價數量
       xrcb008 LIKE xrcb_t.xrcb008, #參考單據號碼
       xrcb009 LIKE xrcb_t.xrcb009, #參考單號項次
       xrcblegl LIKE xrcb_t.xrcblegl, #核算組織
       xrcb010 LIKE xrcb_t.xrcb010, #業務部門
       xrcb011 LIKE xrcb_t.xrcb011, #責任中心
       xrcb012 LIKE xrcb_t.xrcb012, #產品類別
       xrcb013 LIKE xrcb_t.xrcb013, #發票帳否(搭贈/備品/樣品)
       xrcb014 LIKE xrcb_t.xrcb014, #理由碼
       xrcb015 LIKE xrcb_t.xrcb015, #專案編號
       xrcb016 LIKE xrcb_t.xrcb016, #WBS編號
       xrcb017 LIKE xrcb_t.xrcb017, #預算細項
       xrcb018 LIKE xrcb_t.xrcb018, #商戶編號
       xrcb019 LIKE xrcb_t.xrcb019, #開票性質
       xrcb020 LIKE xrcb_t.xrcb020, #稅別
       xrcb021 LIKE xrcb_t.xrcb021, #收入會計科目
       xrcb022 LIKE xrcb_t.xrcb022, #正負值
       xrcb023 LIKE xrcb_t.xrcb023, #沖暫估單否
       xrcb024 LIKE xrcb_t.xrcb024, #區域
       xrcb025 LIKE xrcb_t.xrcb025, #傳票號碼
       xrcb026 LIKE xrcb_t.xrcb026, #傳票項次
       xrcb027 LIKE xrcb_t.xrcb027, #發票編號
       xrcb028 LIKE xrcb_t.xrcb028, #發票號碼
       xrcb029 LIKE xrcb_t.xrcb029, #應收帳款科目
       xrcb030 LIKE xrcb_t.xrcb030, #已開發票數量
       xrcb031 LIKE xrcb_t.xrcb031, #收款條件編號
       xrcb032 LIKE xrcb_t.xrcb032, #訂金序次
       xrcb033 LIKE xrcb_t.xrcb033, #經營方式
       xrcb034 LIKE xrcb_t.xrcb034, #通路
       xrcb035 LIKE xrcb_t.xrcb035, #品牌
       xrcb036 LIKE xrcb_t.xrcb036, #客群
       xrcb037 LIKE xrcb_t.xrcb037, #自由核算項一
       xrcb038 LIKE xrcb_t.xrcb038, #自由核算項二
       xrcb039 LIKE xrcb_t.xrcb039, #自由核算項三
       xrcb040 LIKE xrcb_t.xrcb040, #自由核算項四
       xrcb041 LIKE xrcb_t.xrcb041, #自由核算項五
       xrcb042 LIKE xrcb_t.xrcb042, #自由核算項六
       xrcb043 LIKE xrcb_t.xrcb043, #自由核算項七
       xrcb044 LIKE xrcb_t.xrcb044, #自由核算項八
       xrcb045 LIKE xrcb_t.xrcb045, #自由核算項九
       xrcb046 LIKE xrcb_t.xrcb046, #自由核算項十
       xrcb047 LIKE xrcb_t.xrcb047, #摘要
       xrcb048 LIKE xrcb_t.xrcb048, #客戶訂購單號
       xrcb049 LIKE xrcb_t.xrcb049, #開票單號
       xrcb050 LIKE xrcb_t.xrcb050, #開票項次
       xrcb051 LIKE xrcb_t.xrcb051, #業務人員
       xrcb100 LIKE xrcb_t.xrcb100, #交易原幣
       xrcb101 LIKE xrcb_t.xrcb101, #交易原幣單價
       xrcb102 LIKE xrcb_t.xrcb102, #交易匯率
       xrcb103 LIKE xrcb_t.xrcb103, #交易原幣未稅金額
       xrcb104 LIKE xrcb_t.xrcb104, #交易原幣稅額
       xrcb105 LIKE xrcb_t.xrcb105, #交易原幣含稅金額
       xrcb106 LIKE xrcb_t.xrcb106, #交易原幣調整差異金額
       xrcb111 LIKE xrcb_t.xrcb111, #本幣單價
       xrcb113 LIKE xrcb_t.xrcb113, #本幣未稅金額
       xrcb114 LIKE xrcb_t.xrcb114, #本幣稅額
       xrcb115 LIKE xrcb_t.xrcb115, #本幣含稅金額
       xrcb116 LIKE xrcb_t.xrcb116, #本幣調整差異金額
       xrcb117 LIKE xrcb_t.xrcb117, #已開發票金額(未稅)
       xrcb118 LIKE xrcb_t.xrcb118, #應開發票未稅金額
       xrcb119 LIKE xrcb_t.xrcb119, #應開發票含稅金額
       xrcb121 LIKE xrcb_t.xrcb121, #本位幣二匯率
       xrcb123 LIKE xrcb_t.xrcb123, #本位幣二未稅金額
       xrcb124 LIKE xrcb_t.xrcb124, #本位幣二稅額
       xrcb125 LIKE xrcb_t.xrcb125, #本位幣二含稅金額
       xrcb126 LIKE xrcb_t.xrcb126, #本位幣二調整差異金額
       xrcb131 LIKE xrcb_t.xrcb131, #本位幣三匯率
       xrcb133 LIKE xrcb_t.xrcb133, #本位幣三未稅金額
       xrcb134 LIKE xrcb_t.xrcb134, #本位幣三稅額
       xrcb135 LIKE xrcb_t.xrcb135, #本位幣三含稅金額
       xrcb136 LIKE xrcb_t.xrcb136, #本位幣三調整差異金額
       xrcb052 LIKE xrcb_t.xrcb052, #款別編號
       xrcb053 LIKE xrcb_t.xrcb053, #帳款對象
       xrcb054 LIKE xrcb_t.xrcb054, #收款對象
       xrcb055 LIKE xrcb_t.xrcb055, #收現金額(流通)
       xrcb056 LIKE xrcb_t.xrcb056, #應收金額(流通)
       xrcb057 LIKE xrcb_t.xrcb057, #扣款金額(流通)
       xrcb058 LIKE xrcb_t.xrcb058, #預收科目
       xrcb059 LIKE xrcb_t.xrcb059, #代收銀科目
       xrcb060 LIKE xrcb_t.xrcb060, #月份類型
       xrcb107 LIKE xrcb_t.xrcb107  #出貨單單價
       END RECORD

DEFINE g_glaa RECORD  #帳套資料檔
       glaaent LIKE glaa_t.glaaent, #企業編號
       glaaownid LIKE glaa_t.glaaownid, #資料所有者
       glaaowndp LIKE glaa_t.glaaowndp, #資料所屬部門
       glaacrtid LIKE glaa_t.glaacrtid, #資料建立者
       glaacrtdp LIKE glaa_t.glaacrtdp, #資料建立部門
       glaacrtdt LIKE glaa_t.glaacrtdt, #資料創建日
       glaamodid LIKE glaa_t.glaamodid, #資料修改者
       glaamoddt LIKE glaa_t.glaamoddt, #最近修改日
       glaastus LIKE glaa_t.glaastus, #狀態碼
       glaald LIKE glaa_t.glaald, #帳套編號
       glaacomp LIKE glaa_t.glaacomp, #歸屬法人
       glaa001 LIKE glaa_t.glaa001, #使用幣別
       glaa002 LIKE glaa_t.glaa002, #匯率參照表號
       glaa003 LIKE glaa_t.glaa003, #會計週期參照表號
       glaa004 LIKE glaa_t.glaa004, #會計科目參照表號
       glaa005 LIKE glaa_t.glaa005, #現金變動參照表號
       glaa006 LIKE glaa_t.glaa006, #月結方式
       glaa007 LIKE glaa_t.glaa007, #年結方式
       glaa008 LIKE glaa_t.glaa008, #平行記帳否
       glaa009 LIKE glaa_t.glaa009, #傳票登入方式
       glaa010 LIKE glaa_t.glaa010, #現行年度
       glaa011 LIKE glaa_t.glaa011, #現行期別
       glaa012 LIKE glaa_t.glaa012, #最後過帳日期
       glaa013 LIKE glaa_t.glaa013, #關帳日期
       glaa014 LIKE glaa_t.glaa014, #主帳套
       glaa015 LIKE glaa_t.glaa015, #啟用本位幣二
       glaa016 LIKE glaa_t.glaa016, #本位幣二
       glaa017 LIKE glaa_t.glaa017, #本位幣二換算基準
       glaa018 LIKE glaa_t.glaa018, #本位幣二匯率採用
       glaa019 LIKE glaa_t.glaa019, #啟用本位幣三
       glaa020 LIKE glaa_t.glaa020, #本位幣三
       glaa021 LIKE glaa_t.glaa021, #本位幣三換算基準
       glaa022 LIKE glaa_t.glaa022, #本位幣三匯率採用
       glaa023 LIKE glaa_t.glaa023, #次帳套帳務產生時機
       glaa024 LIKE glaa_t.glaa024, #單據別參照表號
       glaa025 LIKE glaa_t.glaa025, #本位幣一匯率採用
       glaa026 LIKE glaa_t.glaa026, #幣別參照表號
       glaa100 LIKE glaa_t.glaa100, #傳票輸入時自動按缺號產生
       glaa101 LIKE glaa_t.glaa101, #傳票總號輸入時機
       glaa102 LIKE glaa_t.glaa102, #傳票成立時,借貸不平衡的處理方式
       glaa103 LIKE glaa_t.glaa103, #未列印的傳票可否進行過帳
       glaa111 LIKE glaa_t.glaa111, #應計調整單別
       glaa112 LIKE glaa_t.glaa112, #期末結轉單別
       glaa113 LIKE glaa_t.glaa113, #年底結轉單別
       glaa120 LIKE glaa_t.glaa120, #成本計算類型
       glaa121 LIKE glaa_t.glaa121, #子模組啟用分錄底稿
       glaa122 LIKE glaa_t.glaa122, #總帳可維護資金異動明細
       glaa027 LIKE glaa_t.glaa027, #單據據點編號
       glaa130 LIKE glaa_t.glaa130, #合併帳套否
       glaa131 LIKE glaa_t.glaa131, #分層合併
       glaa132 LIKE glaa_t.glaa132, #平均匯率計算方式
       glaa133 LIKE glaa_t.glaa133, #非T100公司匯入餘額類型
       glaa134 LIKE glaa_t.glaa134, #合併科目轉換依據異動碼設定值
       glaa135 LIKE glaa_t.glaa135, #現流表間接法群組參照表號
       glaa136 LIKE glaa_t.glaa136, #應收帳款核銷限定己立帳傳票
       glaa137 LIKE glaa_t.glaa137, #應付帳款核銷限定已立帳傳票
       glaa138 LIKE glaa_t.glaa138, #合併報表編制期別
       glaa139 LIKE glaa_t.glaa139, #遞延收入(負債)管理產生否
       glaa140 LIKE glaa_t.glaa140, #無原出貨單的遞延負債減項者,是否仍立遞延收入管理?
       glaa123 LIKE glaa_t.glaa123, #應收帳款核銷可維護資金異動明細
       glaa124 LIKE glaa_t.glaa124, #應付帳款核銷可維護資金異動明細
       glaa028 LIKE glaa_t.glaa028  #匯率來源
       END RECORD
#161128-00061#3-----modify--end----------
DEFINE g_sfin2012            LIKE type_t.chr1

#150210-00011(1)--20150330--add--
DEFINE g_glav002        LIKE glav_t.glav002
DEFINE g_glav005        LIKE glav_t.glav005
DEFINE g_sdate_s        LIKE glav_t.glav004
DEFINE g_sdate_e        LIKE glav_t.glav004
DEFINE g_glav006        LIKE glav_t.glav006
DEFINE g_glav007        LIKE glav_t.glav007
DEFINE g_pdate_s        LIKE glav_t.glav004
DEFINE g_pdate_e        LIKE glav_t.glav004
DEFINE g_wdate_s        LIKE glav_t.glav004
DEFINE g_wdate_e        LIKE glav_t.glav004
#150210-00011(1)--20150330--add--
DEFINE g_sql_ctrl       STRING   #151231-00010#9 add
#161021-00050#6-add(s)
DEFINE g_comp           LIKE xrca_t.xrcacomp
DEFINE xrcasite_t       LIKE xrca_t.xrcasite  
DEFINE xrcacomp_t       LIKE xrca_t.xrcacomp
DEFINE xrcald_t         LIKE xrca_t.xrcald
DEFINE g_master_wc2      STRING  #180928-00039#1 add
#161021-00050#6-add(e)
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axrp131.main" type="s" >}
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
   CALL cl_ap_init("axr","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL axrp131_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_axrp131 WITH FORM cl_ap_formpath("axr",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL axrp131_init()
 
      #進入選單 Menu (="N")
      CALL axrp131_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_axrp131
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="axrp131.init" type="s" >}
#+ 初始化作業
PRIVATE FUNCTION axrp131_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE l_success      LIKE type_t.num5
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
   CALL cl_set_combo_scc_part('xmdk000','2077','1,2,3,6')
   CALL s_fin_create_account_center_tmp()
   CALL s_voucher_cre_ar_tmp_table() RETURNING l_success
   CALL s_def_pay_cre_tmp() RETURNING l_success  #200603-00142#1 add
   
   CALL cl_set_combo_scc('b_comb1','9951')    #151012-00014#1 add lujh
   CALL cl_set_combo_scc('xmdk042','2085') #180928-00039#1 add
   #151231-00010#9--add--str--
   LET g_sql_ctrl = NULL
   CALL s_control_get_customer_sql('2',g_site,g_user,g_dept,'') RETURNING g_sub_success,g_sql_ctrl
   #151231-00010#9--add--end
   
   CALL cl_set_comp_required('xrcadocdt',TRUE)   #170421-00052#1 add
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="axrp131.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION axrp131_ui_dialog()
 
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
   DEFINE l_success         LIKE type_t.chr1
   DEFINE l_ooef004         LIKE ooef_t.ooef004
   DEFINE l_ooef019         LIKE ooef_t.ooef019
   DEFINE l_mm              LIKE type_t.chr2
   DEFINE l_s               LIKE type_t.chr1
   #150210-00011(1)--20150330--add--
   DEFINE  l_flag1          LIKE type_t.chr1       
   DEFINE  l_errno          LIKE type_t.chr100   
   #150210-00011(1)--20150330--add--
   DEFINE l_where           STRING     #160325-00023#1
   DEFINE ls_scc            STRINg     #160715-00017#1 Add
   DEFINE l_sql1            STRING     #160711-00040#37
   DEFINE l_oodb004         LIKE oodb_t.oodb004 #171020-00002#1 add
   DEFINE l_oodb008         LIKE oodb_t.oodb008 #171020-00002#1 add
   DEFINE l_oodb003         LIKE oodb_t.oodb003 #171113-00034#1 add 
   DEFINE l_oodb006         LIKE oodb_t.oodb006 #200925-00016#1 add
   DEFINE l_oodb011         LIKE oodb_t.oodb011 #200925-00016#1 add  
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   INITIALIZE g_master.* TO NULL
   #161021-00050#6-add(s)
  LET g_master.xrcasite = g_site 
  CALL s_fin_orga_get_comp_ld(g_master.xrcasite) RETURNING l_success,g_errno,g_comp,g_master.xrcald 
  LET xrcasite_t = g_master.xrcasite
  LET xrcacomp_t = g_comp
  LET xrcald_t = g_master.xrcald
  #161021-00050#6-add(e)
  #LET g_master.l_price = 'Y'  #180329-00029#1 add  #181112-00009#1 mark
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.xrcasite,g_master.xrcald,g_master.xrcadocno,g_master.xrca008,g_master.xrca007,g_master.b_comb1,g_master.xrcadocdt,g_master.b_comb2,g_master.xrca011,g_master.xmdk042,g_master.l_price 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               CALL axrp131_def()
               LET g_master.xmdk042='1' #180928-00039#1 ADD
               #end add-point
         
                     #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcasite
            
            #add-point:AFTER FIELD xrcasite name="input.a.xrcasite"
            IF NOT cl_null(g_master.xrcasite) THEN
               IF g_master.xrcasite != g_master_o.xrcasite OR cl_null(g_master_o.xrcasite) THEN #190103-00017#1 add                                                                 
                  #161021-00050#2-add(s)
                  CALL s_fin_account_center_with_ld_chk(g_master.xrcasite,g_master.xrcald,g_user,'3','N','',g_today) RETURNING l_success,g_errno
                     IF NOT cl_null(g_errno) THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = g_master.xrcasite
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET g_master.xrcasite = xrcasite_t 
                        LET g_master.xrcald = xrcald_t 
                        CALL s_desc_get_department_desc(g_master.xrcasite) RETURNING g_master.xrcasite_desc
                        CALL s_desc_get_ld_desc(g_master.xrcald) RETURNING g_master.xrcald_desc
                        DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
                        DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc
                        NEXT FIELD CURRENT
                     END IF
                  #161021-00050#2-add(e) 
                  CALL s_axrt300_site_geared_ld(g_master.xrcasite,g_master.xrcald,g_user,g_today,'site')
                     RETURNING l_success,g_master.xrcasite,g_master.xrcasite_desc,g_master.xrcald,g_master.xrcald_desc
                  DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
                  DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc
                  IF NOT l_success THEN NEXT FIELD CURRENT END IF
                  CALL s_axrt300_date_chk(g_master.xrcasite,g_master.xrcadocdt) RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "axr-00299"
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err() 
                     NEXT FIELD CURRENT
                  END IF
                  #190103-00017#1 ---s---
                  SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                         glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011
                         glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                         glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                         glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                         glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
                  FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
                  IF NOT cl_null(g_glaa.glaa003) AND NOT cl_null(g_master.xrcadocdt) THEN
                     CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','') 
                        RETURNING l_flag1,l_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
                            g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
                     IF cl_null(g_pdate_s) THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code   = 'agl-00211'
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET g_pdate_s = g_master.xrcadocdt
                     END IF                                                                
                  END IF                  
                  #190103-00017#1 ---e---                     
               END IF #190103-00017#1 add                                    
            ELSE
               LET g_master.xrcasite_desc = ''
            END IF
            #161128-00061#3-----modify--begin----------
            #SELECT * INTO g_glaa.* 
            #190103-00017#1 ---s---
            # SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
            #        glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
            #        glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
            #        glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
            #        glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
            #        glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
            ##161128-00061#3-----modify--end----------
            #FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
            #190103-00017#1---e---
            DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
            DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc
            #161111-00049#6 Add  ---(S)---
            #CALL s_control_get_customer_sql_pmab('4',g_site,g_user,g_dept,'',g_glaa.glaacomp)  RETURNING g_sub_success,g_sql_ctrl  #170718-00043#1 mark
            CALL s_control_get_customer_sql_pmab('2',g_site,g_user,g_dept,'',g_glaa.glaacomp)  RETURNING g_sub_success,g_sql_ctrl  #170718-00043#1 add
            #161111-00049#6 Add  ---(E)---
            LET g_master_o.xrcasite = g_master.xrcasite  #190103-00017#1 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcasite
            #add-point:BEFORE FIELD xrcasite name="input.b.xrcasite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcasite
            #add-point:ON CHANGE xrcasite name="input.g.xrcasite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcald
            
            #add-point:AFTER FIELD xrcald name="input.a.xrcald"
            IF NOT cl_null(g_master.xrcald) THEN
               IF g_master.xrcald != g_master_o.xrcald OR cl_null(g_master_o.xrcald) THEN #190103-00017#1 add                                                                             
                  CALL s_axrt300_site_geared_ld(g_master.xrcasite,g_master.xrcald,g_user,g_today,'ld')
                     RETURNING l_success,g_master.xrcasite,g_master.xrcasite_desc,g_master.xrcald,g_master.xrcald_desc
                  DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
                  DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc
                  IF NOT l_success THEN
                     #161128-00061#3-----modify--begin----------
                     #SELECT * INTO g_glaa.* 
                      SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                             glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                             glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                             glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                             glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                             glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
                     #161128-00061#3-----modify--end----------
                     FROM FROM glaa_t WHERE glaaent = g_enterprise AND glaald  = g_master.xrcald
                     NEXT FIELD CURRENT
                  END IF
                  #190103-00017#1 ---s---
                  SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                         glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011
                         glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                         glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                         glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                         glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
                  FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
                  IF NOT cl_null(g_glaa.glaa003) AND NOT cl_null(g_master.xrcadocdt) THEN
                     CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','') 
                        RETURNING l_flag1,l_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
                            g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
                     IF cl_null(g_pdate_s) THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code   = 'agl-00211'
                        LET g_errparam.popup  = TRUE 
                        CALL cl_err()
                        LET g_pdate_s = g_master.xrcadocdt
                     END IF                                                                
                  END IF                  
                  #190103-00017#1 ---e---                   
               END IF #190103-00017#1 add
            ELSE
               LET g_master.xrcald_desc = ''
            END IF
            #161128-00061#3-----modify--begin----------
            #SELECT * INTO g_glaa.*
            #190103-00017#1 ---s---            
            # SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
            #        glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
            #        glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
            #        glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
            #        glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
            #        glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
            ##161128-00061#3-----modify--end---------- 
            #FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
            #190103-00017#1 ---e---  
            LET g_master_o.xrcald = g_master.xrcald  #190103-00017#1                                     
            DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
            DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc

            CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2012') RETURNING g_sfin2012
            IF g_sfin2012 = '2' THEN
               #LET g_xrca.xrca011 = ''  #170323-00108#1 mark
               LET g_master.xrca011 = '' #170323-00108#1 add
               CALL cl_set_comp_visible('xrca011',FALSE)   #160816-00014#1 Mod cl_set_comp_entry ---> cl_set_comp_visible #170323-00108#1 mark  #171020-00002#1 remark
               #CALL cl_set_comp_visible('xrca011',TRUE)     #170323-00108#1 add #171020-00002#1 mark
               CALL cl_set_comp_entry('xrca011',TRUE)       #170323-00108#1 add               
            ELSE
               CALL cl_set_comp_visible('xrca011',TRUE)   #160816-00014#1 Add
               CALL cl_set_comp_entry('xrca011',TRUE)
               IF cl_null(g_master.xrca011) AND NOT cl_null(g_master.xrcasite) THEN
                  LET g_master.xrca011 = cl_get_para(g_enterprise,g_master.xrcasite,'S-FIN-2010')
               END IF
            END IF
            #161111-00049#6 Add  ---(S)---
            #CALL s_control_get_customer_sql_pmab('4',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl #170718-00043#1 mark
            CALL s_control_get_customer_sql_pmab('2',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl #170718-00043#1 add
            #161111-00049#6 Add  ---(E)---


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcald
            #add-point:BEFORE FIELD xrcald name="input.b.xrcald"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcald
            #add-point:ON CHANGE xrcald name="input.g.xrcald"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcadocno
            #add-point:BEFORE FIELD xrcadocno name="input.b.xrcadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcadocno
            
            #add-point:AFTER FIELD xrcadocno name="input.a.xrcadocno"
            IF NOT cl_null(g_master.xrcadocno) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_glaa.glaa024
               LET g_chkparam.arg2 = g_master.xrcadocno
               IF NOT cl_chk_exist("v_oobx001_1") THEN
                  LET g_master.xrcadocno = ''
                  NEXT FIELD CURRENT
               END IF
               
               #170426-00060#1 add s---  
               #aooi200单别抓取预设账款类别  
               CALL s_aooi200_fin_get_doc_default(g_master.xrcasite,'2',g_master.xrcadocno,'xrca007',g_xrca.xrca007,g_master.xrcald) RETURNING g_master.xrca007                                                   
               IF NOT cl_null(g_master.xrca007) THEN            
                  DISPLAY g_master.xrca007 TO xrca007
               END IF 
               CALL s_aooi200_fin_get_doc_default(g_master.xrcasite,'2',g_master.xrcadocno,'xrca008',g_xrca.xrca008,g_master.xrcald) RETURNING g_master.xrca008                                                   
               IF NOT cl_null(g_master.xrca008) THEN            
                  DISPLAY g_master.xrca008 TO xrca008
               END IF                
               #170426-00060#1 add e---               
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcadocno
            #add-point:ON CHANGE xrcadocno name="input.g.xrcadocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrca008
            #add-point:BEFORE FIELD xrca008 name="input.b.xrca008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrca008
            
            #add-point:AFTER FIELD xrca008 name="input.a.xrca008"
            IF NOT cl_null(g_master.xrca008) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_master.xrca008
               LET g_chkparam.arg2 = ' '
               #160318-00025#41  2016/04/25  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "apm-00184:sub-01302|aooi714|",cl_get_progname("aooi714",g_lang,"2"),"|:EXEPROGaooi714"
               #160318-00025#41  2016/04/25  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooib002_1") THEN
                  LET g_master.xrca008 = ''
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrca008
            #add-point:ON CHANGE xrca008 name="input.g.xrca008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrca007
            #add-point:BEFORE FIELD xrca007 name="input.b.xrca007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrca007
            
            #add-point:AFTER FIELD xrca007 name="input.a.xrca007"
            IF NOT cl_null(g_master.xrca007) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_master.xrca007
               #160318-00025#42  2016/04/25  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
              #LET g_chkparam.err_str[1] = "aoo-00200:sub-01302|axri012|",cl_get_progname("axri012",g_lang,"2"),"|:EXEPROGaxri012"  #170713-00063#40 mark
               #160318-00025#42  2016/04/25  by pengxin  add(E)
               
               #170713-00063#40 -S add
               LET g_chkparam.err_str[1] = "aoo-00200:sub-01302|",cl_get_progname("axri010",g_lang,"2"),"|:EXEPROGaxri010"
               LET g_chkparam.err_str[2] = "aoo-00199:sub-01303|axri010|",cl_get_progname("axri010",g_lang,"2"),"|:EXEPROGaxri010"
               #170713-00063#40 -E add
               
               IF NOT cl_chk_exist("v_oocq002_3111") THEN
                  LET g_master.xrca007 = ''
                  NEXT FIELD CURRENT
               END IF
            END IF

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrca007
            #add-point:ON CHANGE xrca007 name="input.g.xrca007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_comb1
            #add-point:BEFORE FIELD b_comb1 name="input.b.b_comb1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_comb1
            
            #add-point:AFTER FIELD b_comb1 name="input.a.b_comb1"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_comb1
            #add-point:ON CHANGE b_comb1 name="input.g.b_comb1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcadocdt
            #add-point:BEFORE FIELD xrcadocdt name="input.b.xrcadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcadocdt
            
            #add-point:AFTER FIELD xrcadocdt name="input.a.xrcadocdt"
            IF NOT cl_null(g_master.xrcadocdt) THEN
               IF g_master.xrcadocdt != g_master_o.xrcadocdt OR cl_null(g_master_o.xrcadocdt) THEN #190103-00017#1 add                                                                             
                  CALL s_axrt300_date_chk(g_master.xrcasite,g_master.xrcadocdt) RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "axr-00299"
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err() 
                     NEXT FIELD CURRENT
                  END IF
                  #150210-00011(1)--20150330--add--
                  CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','') 
                  RETURNING l_flag1,l_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
                            g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
                  #150210-00011(1)--20150330--add--
                  #190103-00017#1 ---s--                   
                  IF cl_null(g_pdate_s) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code   = 'agl-00211'
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     LET g_master.xrcadocdt = g_master_o.xrcadocdt
                     NEXT FIELD CURRENT                      
                  END IF                
                  #190103-00017#1 ---e---                  
               END IF #190103-00017#1 add  
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcadocdt
            #add-point:ON CHANGE xrcadocdt name="input.g.xrcadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_comb2
            #add-point:BEFORE FIELD b_comb2 name="input.b.b_comb2"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_comb2
            
            #add-point:AFTER FIELD b_comb2 name="input.a.b_comb2"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_comb2
            #add-point:ON CHANGE b_comb2 name="input.g.b_comb2"
           #--170421-00052#1 mark start-- 
           #IF NOT cl_null(g_master.b_comb2) THEN  #2015/01/23
           #   IF g_master.b_comb2 = '1' THEN
           #      CALL cl_set_comp_required('xrcadocdt',FALSE)
           #   ELSE
           #      CALL cl_set_comp_required('xrcadocdt',TRUE)
           #   END IF
           #END IF
           #--170421-00052#1 mark end--
            #180727-00024#2 add-s
            IF g_master.b_comb2 = '1' THEN
               CALL cl_set_comp_required('xrcadocdt',FALSE)
               #LET g_master.xrcadocdt = ''   #181025-00018#1 add   #PGS(D)-03080 mark
               LET g_master.xrcadocdt = NULL #PGS(D)-03080
            ELSE 
               CALL cl_set_comp_required('xrcadocdt',TRUE)
               #181025-00018#1   add-S
               IF cl_null(g_master.xrcadocdt) THEN
                  LET g_master.xrcadocdt = g_today
               END IF
               #181025-00018#1   add-E
            END IF
            #180727-00024#2 add-e
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrca011
            #add-point:BEFORE FIELD xrca011 name="input.b.xrca011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrca011
            
            #add-point:AFTER FIELD xrca011 name="input.a.xrca011"
            IF NOT cl_null(g_master.xrca011) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_glaa.glaacomp
               LET g_chkparam.arg2 = g_master.xrca011
               #160318-00025#42  2016/04/25  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00223:sub-01302|aooi610|",cl_get_progname("aooi610",g_lang,"2"),"|:EXEPROGaooi610"
               #160318-00025#42  2016/04/25  by pengxin  add(E)
               IF NOT cl_chk_exist("v_oodb002") THEN
                  LET g_master.xrca011 = ''
                  NEXT FIELD CURRENT
               END IF
               
               #171020-00002#1 --s add
               LET l_ooef019 = ''
               SELECT ooef019 INTO l_ooef019 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp    
               LET l_oodb004 = NULL
               LET l_oodb008 = NULL
               LET l_oodb003 = NULL  #171113-00034#1 xul add 
               SELECT oodb004,oodb008,oodb003,oodb006,oodb011 INTO l_oodb004,l_oodb008,l_oodb003,l_oodb006,l_oodb011  #171113-00034#1 xul add  oodb003,l_oodb003 #200925-00016#1 add oodb006,oodb011,l_oodb006,l_oodb011
                 FROM oodb_t
                WHERE oodbent  = g_enterprise AND oodb001  = l_ooef019
                  AND oodb002  = g_master.xrca011
               IF l_oodb004 <> '1' THEN   #非單一稅率
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aap-00182'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE                          
                  CALL cl_err()
                  LET g_master.xrca011 = ''
                  NEXT FIELD CURRENT
               END IF
               IF g_sfin2012 = '1' THEN
                  #IF NOT l_oodb008 MATCHES '[23]' THEN #171113-00034#1 xul mark 
                  #IF l_oodb008 <> '2' THEN #171113-00034#1 xul add #200925-00016#1 mark
                  IF l_oodb008 <> '1' OR l_oodb011 <> '1' OR l_oodb006 <> 0 OR cl_null(l_oodb006) THEN  #200925-00016#1 add
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'aap-00343'                       
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE                            
                     CALL cl_err()
                     LET g_master.xrca011 = ''
                     NEXT FIELD CURRENT
                  END IF
                  #171113-00034#1--add--s--xul
                  IF l_oodb003 <> 'T01' THEN              #171113-00034#1 xul add 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axr-00368'                       
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE                            
                     CALL cl_err()
                     LET g_master.xrca011 = ''
                     NEXT FIELD CURRENT
                  END IF
                  #171113-00034#1--add--e--xul
               END IF               
               #171020-00002#1 --e add
            END IF

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrca011
            #add-point:ON CHANGE xrca011 name="input.g.xrca011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdk042
            #add-point:BEFORE FIELD xmdk042 name="input.b.xmdk042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdk042
            
            #add-point:AFTER FIELD xmdk042 name="input.a.xmdk042"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xmdk042
            #add-point:ON CHANGE xmdk042 name="input.g.xmdk042"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_price
            #add-point:BEFORE FIELD l_price name="input.b.l_price"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD l_price
            
            #add-point:AFTER FIELD l_price name="input.a.l_price"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_price
            #add-point:ON CHANGE l_price name="input.g.l_price"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.xrcasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcasite
            #add-point:ON ACTION controlp INFIELD xrcasite name="input.c.xrcasite"
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_master.xrcasite             #給予default值
            #LET g_qryparam.where = " ooef201 = 'Y' " #160811-00009#4

            #給予arg

            #CALL q_ooef001()                                        #呼叫開窗    #161021-00050#2 mark
            LET g_qryparam.where = " ooefstus = 'Y' "                            #161021-00050#2 add
            CALL q_ooef001_46()                                                  #161021-00050#2 add
            LET g_master.xrcasite = g_qryparam.return1              #將開窗取得的值回傳到變數
            CALL s_axrt300_xrca_ref('xrcasite',g_master.xrcasite,'','') RETURNING l_success,g_master.xrcasite_desc
            IF NOT cl_null(g_master.xrcasite) THEN
               CALL s_axrt300_site_geared_ld(g_master.xrcasite,g_master.xrcald,g_user,g_today,'site')
                  RETURNING l_success,g_master.xrcasite,g_master.xrcasite_desc,g_master.xrcald,g_master.xrcald_desc
               #161128-00061#3-----modify--begin----------
               #SELECT * INTO g_glaa.* 
                SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                       glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                       glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                       glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                       glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                       glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
               #161128-00061#3-----modify--end---------- 
               FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
            END IF
            DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
            DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc
            DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
            NEXT FIELD xrcasite

            #END add-point
 
 
         #Ctrlp:input.c.xrcald
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcald
            #add-point:ON ACTION controlp INFIELD xrcald name="input.c.xrcald"
            CALL s_fin_create_account_center_tmp()   
            #取得帳務組織下所屬成員
            CALL s_fin_account_center_sons_query('3',g_master.xrcasite,g_today,'1')
            #取得帳務組織下所屬成員之帳別   
            CALL s_fin_account_center_comp_str() RETURNING ls_wc
            #將取回的字串轉換為SQL條件
            CALL axrp131_get_ooef001_wc(ls_wc) RETURNING ls_wc  
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_master.xrcald             #給予default值
#160811-00009#4 mark s---            
#            IF NOT cl_null(ls_wc) AND ls_wc <> '(\'\')' THEN
#               LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN ",ls_wc,""
#            ELSE
#               LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y')"
#            END IF
#160811-00009#4 mark e---
            LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN ",ls_wc,""  #160811-00009#4 
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept
            CALL  q_authorised_ld()                                  #呼叫開窗
            LET g_master.xrcald = g_qryparam.return1       #將開窗取得的值回傳到變數
            IF NOT cl_null(g_master.xrcald) THEN
               CALL s_axrt300_site_geared_ld(g_master.xrcasite,g_master.xrcald,g_user,g_today,'ld')
                  RETURNING l_success,g_master.xrcasite,g_master.xrcasite_desc,g_master.xrcald,g_master.xrcald_desc
               #161128-00061#3-----modify--begin----------
               #SELECT * INTO g_glaa.* 
                SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
                       glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
                       glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
                       glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
                       glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
                       glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
               #161128-00061#3-----modify--end----------
               FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
            END IF
            DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc
            NEXT FIELD xrcald                              #返回原欄位  

            #END add-point
 
 
         #Ctrlp:input.c.xrcadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcadocno
            #add-point:ON ACTION controlp INFIELD xrcadocno name="input.c.xrcadocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.xrcadocno             #給予default值

            #給予arg
            SELECT ooef004 INTO l_ooef004 from ooef_t where ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp
            
            SELECT glaa024 INTO g_glaa.glaa024 FROM glaa_t WHERE glaaent = g_enterprise AND glaald  = g_master.xrcald    #200423-00021#1 add
            
            LET g_qryparam.arg1 = g_glaa.glaa024
            LET g_qryparam.arg2 = "axrt320"
            #160711-00040#37  2017/02/24  By 09042  add(S)
            CALL s_control_get_docno_sql(g_user,g_dept)
                    RETURNING l_success,l_sql1
            IF NOT cl_null(l_sql1) THEN
               LET g_qryparam.where = l_sql1
            END IF
            #160711-00040#37  2017/02/24  By 09042  add(E)
            CALL q_ooba002_1()                                #呼叫開窗


            LET g_master.xrcadocno = g_qryparam.return1              

            DISPLAY g_master.xrcadocno TO xrcadocno              #

            NEXT FIELD xrcadocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.xrca008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrca008
            #add-point:ON ACTION controlp INFIELD xrca008 name="input.c.xrca008"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.xrca008             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #
            CALL q_ooib001_1()                                #呼叫開窗

            LET g_master.xrca008 = g_qryparam.return1              

            DISPLAY g_master.xrca008 TO xrca008              #

            NEXT FIELD xrca008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.xrca007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrca007
            #add-point:ON ACTION controlp INFIELD xrca007 name="input.c.xrca007"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.xrca007             #給予default值
            LET g_qryparam.default2 = "" #g_master.oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = "3111" #
            LET g_qryparam.where= " oocq002 IN (SELECT glab002 FROM glab_t WHERE glab001 = '13' AND glabld = '",g_master.xrcald,"' AND glabent = ",g_enterprise,")" #161111-00049#6
            
            CALL q_oocq002()                                #呼叫開窗

            LET g_master.xrca007 = g_qryparam.return1              
            #LET g_master.oocq002 = g_qryparam.return2 
            DISPLAY g_master.xrca007 TO xrca007              #
            #DISPLAY g_master.oocq002 TO oocq002 #應用分類碼
            NEXT FIELD xrca007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.b_comb1
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_comb1
            #add-point:ON ACTION controlp INFIELD b_comb1 name="input.c.b_comb1"
            
            #END add-point
 
 
         #Ctrlp:input.c.xrcadocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcadocdt
            #add-point:ON ACTION controlp INFIELD xrcadocdt name="input.c.xrcadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_comb2
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_comb2
            #add-point:ON ACTION controlp INFIELD b_comb2 name="input.c.b_comb2"
            
            #END add-point
 
 
         #Ctrlp:input.c.xrca011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrca011
            #add-point:ON ACTION controlp INFIELD xrca011 name="input.c.xrca011"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.xrca011             #給予default值
            LET g_qryparam.default2 = "" #g_master.oodb002 #稅別代碼
            LET g_qryparam.default3 = "" #g_master.oodb005 #含稅否
            LET g_qryparam.default4 = "" #g_master.oodb006 #稅率
            #170323-00108#1 add s---
            CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2012') RETURNING g_sfin2012
            IF g_sfin2012 = '1' THEN
               #LET g_qryparam.where = "oodb008 = '2'" #g_xrca_m.oodb006 #稅率    #171020-00002#1 mark
            #171020-00002#1 --s add
              #LET g_qryparam.where = " oodb004 ='1' AND oodb008 IN ('2','3') "   #171113-00034#1 xul mark
              #LET g_qryparam.where = " oodb004 ='1' AND oodb008 = '2' "          #171113-00034#1 xul add           #200925-00016#1 mark
               LET g_qryparam.where = " oodb004 ='1' AND oodb008 = '1' AND oodb006 = 0 AND oodb011 = '1' "          #200925-00016#1 add 
            ELSE
               LET g_qryparam.where = " oodb004 ='1' "
            #171020-00002#1 --e add               
            END IF
            #170323-00108#1 add e---
            #LET g_qryparam.where = " oodb008 ='2' "  #170323-00108#1 mark

            #給予arg
            SELECT ooef019 INTO l_ooef019 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp
            LET g_qryparam.arg1 = l_ooef019

            CALL q_oodb002_5()                                #呼叫開窗

            LET g_master.xrca011 = g_qryparam.return1              
            #LET g_master.oodb002 = g_qryparam.return2 
            #LET g_master.oodb005 = g_qryparam.return3 
            #LET g_master.oodb006 = g_qryparam.return4 
            DISPLAY g_master.xrca011 TO xrca011              #
            #DISPLAY g_master.oodb002 TO oodb002 #稅別代碼
            #DISPLAY g_master.oodb005 TO oodb005 #含稅否
            #DISPLAY g_master.oodb006 TO oodb006 #稅率
            NEXT FIELD xrca011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.xmdk042
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xmdk042
            #add-point:ON ACTION controlp INFIELD xmdk042 name="input.c.xmdk042"
            
            #END add-point
 
 
         #Ctrlp:input.c.l_price
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD l_price
            #add-point:ON ACTION controlp INFIELD l_price name="input.c.l_price"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON xmdk007,xmdkdocno,xmdk001,xmdk003,xmdk000,xmdk004,xmdk012
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.xmdk007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xmdk007
            #add-point:ON ACTION controlp INFIELD xmdk007 name="construct.c.xmdk007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #151231-00010#9--add--str--
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_sql_ctrl
            END IF
            #151231-00010#9--add--end
            #160731-00372#1   2016/08/15  By 07900 --s--
            IF cl_null(g_qryparam.where) THEN
               LET g_qryparam.where =" (pmaa002 ='2' OR pmaa002='3')"
            ELSE 
               LET g_qryparam.where =" (pmaa002 ='2' OR pmaa002='3') AND ",g_qryparam.where            
            END IF 
            #160731-00372#1   2016/08/15  By 07900 --e--
            # CALL q_pmaa001()   #160913-00017#7  mark                  #呼叫開窗
            #170807-00016#1 -s 170817 add by 08172
            IF NOT cl_null(g_master.xrca008) THEN
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND EXISTS (SELECT 1 ",
                                                               "               FROM pmad_t ",
                                                               "              WHERE pmadent=pmaaent ",
                                                               "                AND pmad001=pmaa001",
                                                               "                AND pmad002='",g_master.xrca008,"'",
                                                               "                AND pmadstus='Y')"
            END IF
            #170807-00016#1 -e 170817 add by 08172
            #160913-00017#7--ADD(S)--
            LET g_qryparam.arg1="('2','3')"
            CALL q_pmaa001_1()
            #160913-00017#7--ADD(E)--
            DISPLAY g_qryparam.return1 TO xmdk007  #顯示到畫面上
            NEXT FIELD xmdk007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdk007
            #add-point:BEFORE FIELD xmdk007 name="construct.b.xmdk007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdk007
            
            #add-point:AFTER FIELD xmdk007 name="construct.a.xmdk007"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.xmdkdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xmdkdocno
            #add-point:ON ACTION controlp INFIELD xmdkdocno name="construct.c.xmdkdocno"
            #取得aooi210所設置之前置單別的合理性where 條件 
            #CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','','xmdkdocno') RETURNING g_sub_success,l_where   #160325-00023#1 #180509-00055#2 mark
            CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','axmt540','xmdkdocno') RETURNING g_sub_success,l_where    #180509-00055#2 add
            CALL s_fin_account_center_sons_query('3',g_master.xrcasite,g_master.xrcadocdt,'1')
            CALL s_fin_account_center_sons_str()RETURNING ls_wc
            IF cl_null(ls_wc) THEN LET ls_wc = g_master.xrcasite END IF
            CALL axrp131_get_ooef001_wc(ls_wc)RETURNING ls_wc
            IF MONTH(g_master.xrcadocdt) > 9 THEN
               LET l_mm = MONTH(g_master.xrcadocdt)
            ELSE
               LET l_mm = '0',MONTH(g_master.xrcadocdt)
            END IF
            CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s
           #160715-00017#1 Add  ---(S)---
            CALL s_axrp133_get_scc('xmdk000','2077') RETURNING ls_scc
           #160715-00017#1 Add  ---(E)---

            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
           #LET g_qryparam.arg1 = l_s
            #LET g_qryparam.WHERE = " TO_CHAR(xmdk001,'MM') = '",l_mm,"'"    #150210-00011(1)--20150330--mark--
            #LET g_qryparam.WHERE = " xmdk001 BETWEEN '",g_pdate_s,"' AND '",g_pdate_e,"'"    #150210-00011(1)--20150330--add-- #180321-00029#1 mark
            #LET g_qryparam.WHERE = "  xmdk001 BETWEEN '",g_pdate_s,"' AND '",g_master.xrcadocdt,"'"      #180321-00029#1 add   180727-00024#2 mark
            #180727-00024#2  add-s
            IF NOT cl_null(g_master.xrcadocdt) THEN
               #LET g_qryparam.WHERE = "  xmdk001 BETWEEN '",g_pdate_s,"' AND '",g_master.xrcadocdt,"'"   #200724-00031#1  mark
               #200724-00031#1  add--s
               IF g_master.xmdk042 = '1' THEN
                  LET g_qryparam.WHERE = "  xmdk001 BETWEEN '",g_pdate_s,"' AND '",g_master.xrcadocdt,"'"
               ELSE
                  LET g_qryparam.WHERE = "  xmdk032 BETWEEN '",g_pdate_s,"' AND '",g_master.xrcadocdt,"'"
               END IF 
               #200724-00031#1  add--e
            ELSE
               LET g_qryparam.WHERE = "  1=1 "
            END IF 
            #180727-00024#2  add-e
            #180928-00039#1 add-s
            IF g_master.xmdk042 = '1' THEN
               LET g_qryparam.WHERE = g_qryparam.WHERE," AND xmdk042='1' "
            ELSE
               LET g_qryparam.WHERE = g_qryparam.WHERE," AND xmdk042='2' "
            END IF 
            #180928-00039#1 add-e            
            
           #CALL q_xmdkdocno_10()                           #呼叫開窗
            LET g_qryparam.arg1  = l_s
            LET g_qryparam.arg2  = ls_wc
            
            #151231-00010#9--add--str--
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND EXISTS (SELECT 1 FROM pmaa_t ",
                                                       "              WHERE pmaaent = ",g_enterprise,
                                                       "                AND ",g_sql_ctrl,
                                                       "                AND pmaa001 = xmdk007 )"
            END IF
            #151231-00010#9--add--end
            #170807-00016#1 -s 170817 add by 08172
            IF NOT cl_null(g_master.xrca008) THEN
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND EXISTS (SELECT 1 ",
                                                               "               FROM pmaa_t,pmad_t ",
                                                               "              WHERE pmadent=pmaaent ",
                                                               "                AND pmaaent=",g_enterprise,
                                                               "                AND pmad001=pmaa001",
                                                               "                AND pmaa001=xmdk007",
                                                               "                AND pmad002='",g_master.xrca008,"'",
                                                               "                AND pmadstus='Y')"
            END IF
            #170807-00016#1 -e 170817 add by 08172
            
            #180821-00038#10 add s---
            LET g_qryparam.where = g_qryparam.where CLIPPED," AND NOT EXISTS (SELECT DISTINCT xrcadocno ",
                                                            "                   FROM xrca_t,xrcb_t ",
                                                            "                  WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld ",
                                                            "                    AND xrcbent = ",g_enterprise,"  AND xrcbld = '",g_master.xrcald,"' ",
                                                            "                    AND xrca001 IN ('01','02') AND xrcastus <> 'X' ",
                                                            "                    AND xrcb002 = xmdkdocno AND xrcb003 = xmdlseq )          "                
            #180821-00038#10 add e---            
            LET g_qryparam.where = g_qryparam.where," AND ",l_where,       #160325-00023#1               
                                                    " AND ",ls_scc         #160715-00017#1 Add 
                    
            #171020-00002#1 --s mark
            ##170531-00070#1--add--str--
            ##当稅别录入资料时，单据编号抓取与之相同的稅别
            #IF NOT cl_null(g_master.xrca011) THEN
            #   LET g_qryparam.where = g_qryparam.where," AND xmdk012='",g_master.xrca011,"' "
            #END IF
            ##170531-00070#1--add--end
            #171020-00002#1 --e mark
            LET g_qryparam.where = cl_str_replace(g_qryparam.where,"OR () OR"," OR ") #PGS(D)-03080
            
            #CALL q_xmdl_10_1()                           #呼叫開窗 #160715-00017#1 Mod q_xmdl_10 --> q_xmdl_10_1  #180329-00029#1 mark
            #180329-00029#1 mod--s
            IF g_master.l_price = 'N' THEN 
               CALL q_xmdl_10_2()
            ELSE
               CALL q_xmdl_10_1()
            END IF               
            #180329-00029#1 mod--e               
            DISPLAY g_qryparam.return1 TO xmdkdocno  #顯示到畫面上
            NEXT FIELD xmdkdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdkdocno
            #add-point:BEFORE FIELD xmdkdocno name="construct.b.xmdkdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdkdocno
            
            #add-point:AFTER FIELD xmdkdocno name="construct.a.xmdkdocno"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdk001
            #add-point:BEFORE FIELD xmdk001 name="construct.b.xmdk001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdk001
            
            #add-point:AFTER FIELD xmdk001 name="construct.a.xmdk001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.xmdk001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xmdk001
            #add-point:ON ACTION controlp INFIELD xmdk001 name="construct.c.xmdk001"
            
            #END add-point
 
 
         #Ctrlp:construct.c.xmdk003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xmdk003
            #add-point:ON ACTION controlp INFIELD xmdk003 name="construct.c.xmdk003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xmdk003  #顯示到畫面上
            NEXT FIELD xmdk003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdk003
            #add-point:BEFORE FIELD xmdk003 name="construct.b.xmdk003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdk003
            
            #add-point:AFTER FIELD xmdk003 name="construct.a.xmdk003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdk000
            #add-point:BEFORE FIELD xmdk000 name="construct.b.xmdk000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdk000
            
            #add-point:AFTER FIELD xmdk000 name="construct.a.xmdk000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.xmdk000
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xmdk000
            #add-point:ON ACTION controlp INFIELD xmdk000 name="construct.c.xmdk000"
            
            #END add-point
 
 
         #Ctrlp:construct.c.xmdk004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xmdk004
            #add-point:ON ACTION controlp INFIELD xmdk004 name="construct.c.xmdk004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001_13()                    #呼叫開窗  #161026-00013#1 mark
            #CALL q_ooeg001_4()                                #161026-00013#1 add        #170814-00012#34  170915 By 10044 mark
            CALL q_ooeg001()                                                              #170814-00012#34  170915 By 10044 add
            DISPLAY g_qryparam.return1 TO xmdk004  #顯示到畫面上
            NEXT FIELD xmdk004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdk004
            #add-point:BEFORE FIELD xmdk004 name="construct.b.xmdk004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdk004
            
            #add-point:AFTER FIELD xmdk004 name="construct.a.xmdk004"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.xmdk012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xmdk012
            #add-point:ON ACTION controlp INFIELD xmdk012 name="construct.c.xmdk012"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO xmdk012  #顯示到畫面上
            NEXT FIELD xmdk012                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xmdk012
            #add-point:BEFORE FIELD xmdk012 name="construct.b.xmdk012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xmdk012
            
            #add-point:AFTER FIELD xmdk012 name="construct.a.xmdk012"
            
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
            CALL axrp131_get_buffer(l_dialog)
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
            INITIALIZE g_master.* TO NULL
            CALL axrp131_def()
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
         CALL axrp131_init()
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
      #190103-00017#1 ---s-- 
      #IF INT_FLAG = FALSE THEN   #180928-00039#1 mark
      IF INT_FLAG = FALSE AND g_master.b_comb2<>'1' THEN  #180928-00039#1 add #匯總條件是單號時。予許為空 
         CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','') 
         RETURNING l_flag1,l_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
                   g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
         IF cl_null(g_pdate_s) THEN 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code   = 'agl-00211'
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            CONTINUE WHILE
         END IF 
      END IF         
      #190103-00017#1 ---e---
      #190927-00005#1 add(s)
      LET lc_param.xrcasite  = g_master.xrcasite  
      LET lc_param.xrcald    = g_master.xrcald    
      LET lc_param.xrcadocno = g_master.xrcadocno 
      LET lc_param.xrca008   = g_master.xrca008   
      LET lc_param.xrca007   = g_master.xrca007   
      LET lc_param.b_comb1   = g_master.b_comb1   
      LET lc_param.xrcadocdt = g_master.xrcadocdt 
      LET lc_param.b_comb2   = g_master.b_comb2   
      LET lc_param.xrca011   = g_master.xrca011   
      LET lc_param.xmdk042   = g_master.xmdk042   
      LET lc_param.l_price   = g_master.l_price   
      #190927-00005#1 add(e)
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
                 CALL axrp131_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = axrp131_transfer_argv(ls_js)
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
 
{<section id="axrp131.transfer_argv" type="s" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION axrp131_transfer_argv(ls_js)
 
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
 
{<section id="axrp131.process" type="s" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION axrp131_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_gzzd005    LIKE gzzd_t.gzzd005
   #190927-00005#1 add(s)
   DEFINE l_flag1       LIKE type_t.chr1
   DEFINE l_errno       LIKE type_t.chr100
   DEFINE l_success     LIKE type_t.num5
   #190927-00005#1 add(e)
   
   #200302-00005#10 add s---
   DEFINE lc_param_link  RECORD
          prog           STRING,
          param          DYNAMIC ARRAY OF STRING,
          default_wc     STRING,
          deputy         STRING
          END RECORD 
   DEFINE l_confmsg      STRING
   #200302-00005#10 add e---
   
   
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   #執行步驟:
   #STEP1.取得符合條件的出貨單據
   #STEP2.產生應收單據
   LET li_count = 2
   #190927-00005#1 add(s)
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      LET g_master.xrcasite  = lc_param.xrcasite 
      LET g_master.xrcald    = lc_param.xrcald   
      LET g_master.xrcadocno = lc_param.xrcadocno
      LET g_master.xrca008   = lc_param.xrca008  
      LET g_master.xrca007   = lc_param.xrca007  
      LET g_master.b_comb1   = lc_param.b_comb1  
      LET g_master.xrcadocdt = lc_param.xrcadocdt
      LET g_master.b_comb2   = lc_param.b_comb2  
      LET g_master.xrca011   = lc_param.xrca011  
      LET g_master.xmdk042   = lc_param.xmdk042  
      LET g_master.l_price   = lc_param.l_price  
      LET g_master.wc        = lc_param.wc
      #只有背景執行才再撈一次，要不然到axrp131_get_ar裡不會有相關的glaa資訊，產生的axrt320會有資訊沒寫到
      SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
             glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011
             glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
             glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
             glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
             glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
      FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
      CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','')
           RETURNING l_flag1,l_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
                     g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
      IF cl_null(g_pdate_s) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'agl-00211'
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET g_pdate_s = g_master.xrcadocdt
      END IF
      CALL s_fin_create_account_center_tmp()
      CALL s_voucher_cre_ar_tmp_table() RETURNING l_success
      LET g_sql_ctrl = NULL
      CALL s_control_get_customer_sql('2',g_site,g_user,g_dept,'') RETURNING g_sub_success,g_sql_ctrl
   END IF
   #把原先的內容往上移，這樣不管前景還是背景執行，都會走到這裡
   #錯誤訊息匯總初始化
   CALL cl_err_collect_init()
   LET g_success    = 'Y'
   LET g_totsuccess = 'Y'
    
   SELECT gzzd005 INTO l_gzzd005 FROM gzzd_t
    WHERE gzzd001 = 'axrp131' AND gzzd002 = g_lang AND gzzdstus = 'Y' AND gzzd003 = 'step1'
   CALL cl_progress_no_window_ing(l_gzzd005)
   CALL axrp131_get_data()
    
   IF g_success = 'N' THEN
      CALL cl_err_collect_show()
      #清空進度條
      DISPLAY '' ,0 TO stagenow,stagecomplete

      DROP TABLE axrp131_tmp01                    #ODI-ORA#

      #210114-00016#1---add----str
      DROP TABLE axrp131_tmp02                    #ODI-ORA#
      #210114-00016#1---add----end
      
      RETURN
   END IF
    
   CALL s_axrt300_create_tmp()
    
   CALL s_transaction_begin()
    
   SELECT gzzd005 INTO l_gzzd005 FROM gzzd_t
    WHERE gzzd001 = 'axrp131' AND gzzd002 = g_lang AND gzzdstus = 'Y' AND gzzd003 = 'step2'
   CALL cl_progress_no_window_ing(l_gzzd005)
   CALL axrp131_get_ar()
    

   DROP TABLE axrp131_tmp01 #ODI-ORA#

 #210114-00016#1---add----str
      DROP TABLE axrp131_tmp02                    #ODI-ORA#
      #210114-00016#1---add----end
    
   IF g_success = 'N' THEN
      #清空進度條
      DISPLAY '' ,0 TO stagenow,stagecomplete
      RETURN
   END IF
   #190927-00005#1 add(e)
   
   #200302-00005#10 add s---
   IF NOT cl_null(g_strno) AND NOT cl_null(g_endno)THEN
      LET l_confmsg = cl_getmsg('aap-01186',g_lang),cl_getmsg('aap-01188',g_lang),cl_getmsg('aap-01187',g_lang)
      IF cl_ask_confirm(l_confmsg)THEN
         INITIALIZE lc_param_link.* TO NULL 
         LET lc_param_link.prog = 'axrt320'
         LET lc_param_link.default_wc = "xrcadocno BETWEEN '",g_strno CLIPPED,"' ",
                                    " AND '",g_endno CLIPPED,"' "
         CALL cl_cmdrun(util.JSON.stringify(lc_param_link))
      END IF
   END IF
   #200302-00005#10 add e---
   
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      CALL cl_progress_bar_no_window(li_count)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE axrp131_process_cs CURSOR FROM ls_sql
#  FOREACH axrp131_process_cs INTO
   #add-point:process段process name="process.process"
   
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      #190927-00005#1 mark(s)
      #將此段add-point的內容往上移，這樣前景或是背景都會執行到
      #錯誤訊息匯總初始化
      #CALL cl_err_collect_init()
      #LET g_success    = 'Y'
      #LET g_totsuccess = 'Y'
      #
      #SELECT gzzd005 INTO l_gzzd005 FROM gzzd_t
      # WHERE gzzd001 = 'axrp131' AND gzzd002 = g_lang AND gzzdstus = 'Y' AND gzzd003 = 'step1'
      #CALL cl_progress_no_window_ing(l_gzzd005)
      #CALL axrp131_get_data()
      #
      #IF g_success = 'N' THEN
      #   CALL cl_err_collect_show()
      #   #清空進度條
      #   DISPLAY '' ,0 TO stagenow,stagecomplete

      #   DROP TABLE axrp131_tmp01         #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01                    #ODI-ORA#
      #   RETURN
      #END IF
      #
      #CALL s_axrt300_create_tmp()
      #
      #CALL s_transaction_begin()
      #
      #SELECT gzzd005 INTO l_gzzd005 FROM gzzd_t
      # WHERE gzzd001 = 'axrp131' AND gzzd002 = g_lang AND gzzdstus = 'Y' AND gzzd003 = 'step2'
      #CALL cl_progress_no_window_ing(l_gzzd005)
      #CALL axrp131_get_ar()
      #

      #DROP TABLE axrp131_tmp01        #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01 #ODI-ORA#
      #
      #IF g_success = 'N' THEN
      #   #清空進度條
      #   DISPLAY '' ,0 TO stagenow,stagecomplete
      #   RETURN
      #END IF
      #190927-00005#1 mark(e)
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL axrp131_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="axrp131.get_buffer" type="s" >}
PRIVATE FUNCTION axrp131_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.xrcasite = p_dialog.getFieldBuffer('xrcasite')
   LET g_master.xrcald = p_dialog.getFieldBuffer('xrcald')
   LET g_master.xrcadocno = p_dialog.getFieldBuffer('xrcadocno')
   LET g_master.xrca008 = p_dialog.getFieldBuffer('xrca008')
   LET g_master.xrca007 = p_dialog.getFieldBuffer('xrca007')
   LET g_master.b_comb1 = p_dialog.getFieldBuffer('b_comb1')
   LET g_master.xrcadocdt = p_dialog.getFieldBuffer('xrcadocdt')
   LET g_master.b_comb2 = p_dialog.getFieldBuffer('b_comb2')
   LET g_master.xrca011 = p_dialog.getFieldBuffer('xrca011')
   LET g_master.xmdk042 = p_dialog.getFieldBuffer('xmdk042')
   LET g_master.l_price = p_dialog.getFieldBuffer('l_price')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="axrp131.msgcentre_notify" type="s" >}
PRIVATE FUNCTION axrp131_msgcentre_notify()
 
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
 
{<section id="axrp131.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 給帳務中心、帳套賦默認值
# Memo...........:
# Usage..........: CALL axrp131_def()
#                  RETURNING ---
# Input parameter: ---
# Return code....: ---
# Date & Author..: 2014/10/09 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp131_def()
   DEFINE l_sql         STRING
   DEFINE l_xrcasite    LIKE xrca_t.xrcasite
   DEFINE l_xrcacomp    LIKE xrca_t.xrcacomp
   DEFINE l_success     LIKE type_t.chr1
   DEFINE l_cnt         LIKE type_t.num5
   DEFINE l_ooefl003    LIKE ooefl_t.ooefl003
   #150210-00011(1)--20150330--add--
   DEFINE l_flag1       LIKE type_t.chr1
   DEFINE l_errno       LIKE type_t.chr100
   #150210-00011(1)--20150330--add--
   DEFINE l_sfin2009    LIKE type_t.chr10    #151012-00014#1 add lujh

   IF cl_null(g_master.xrcasite) OR cl_null(g_master.xrcald) THEN
      #帳務中心
      #取得預設的帳務中心,因新增階段的時候,並不會知道site,所以以登入人員做為依據
      CALL s_fin_get_account_center('',g_user,'3',g_today) RETURNING l_success,g_master.xrcasite,g_errno
      #該帳務中心與帳別無法勾稽到,以登入人員g_user取得預設帳別/法人
      CALL s_fin_orga_get_comp_ld(g_master.xrcasite) RETURNING l_success,g_errno,l_xrcacomp,g_master.xrcald   

      #若取不出資料,則不預設帳別
      IF NOT l_success THEN
         LET g_master.xrcald   = ''
      END IF
   END IF #170323-00108#1 add
      CALL s_axrt300_xrca_ref('xrcald',g_master.xrcald,'','') RETURNING l_success,g_master.xrcald_desc
      #161128-00061#3-----modify--begin----------
      #SELECT * INTO g_glaa.* 
       SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
              glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
              glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
              glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
              glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
              glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
      #161128-00061#3-----modify--end----------
      FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
      CALL s_axrt300_xrca_ref('xrcasite',g_master.xrcasite,'','') RETURNING l_success,g_master.xrcasite_desc
      DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc,g_master.xrcald,g_master.xrcald_desc
   #END IF #170323-00108# mark
   IF g_master.b_comb2 <> '1' THEN   #181025-00018#1 add
      IF cl_null(g_master.xrcadocdt) THEN LET g_master.xrcadocdt = g_today END IF
   END IF                            #181025-00018#1 add
   LET g_master.l_price = 'Y'  #181112-00009#1 add
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2012') RETURNING g_sfin2012
   IF g_sfin2012 = '2' THEN
      #LET g_xrca.xrca011 = ''
      LET  g_master.xrca011 = '' #170323-00108#1 add
      CALL cl_set_comp_visible('xrca011',FALSE)   #160816-00014#1 Mod cl_set_comp_entry ---> cl_set_comp_visible #170323-00108#1 mark #171020-00002#1 remark
      #CALL cl_set_comp_visible('xrca011',TRUE)     #170323-00108#1 add #171020-00002#1 mark
      CALL cl_set_comp_entry('xrca011',TRUE)       #170323-00108#1 add
   ELSE
      CALL cl_set_comp_visible('xrca011',TRUE)   #160816-00014#1 Add
      CALL cl_set_comp_entry('xrca011',TRUE)
      IF cl_null(g_master.xrca011) AND NOT cl_null(g_master.xrcasite) THEN
         LET g_master.xrca011 = cl_get_para(g_enterprise,g_master.xrcasite,'S-FIN-2010')
      END IF
   END IF

   #161111-00049#6 Add  ---(S)---
   #161128-00061#3-----modify--begin----------
   #SELECT * INTO g_glaa.* 
    SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
           glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
           glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
           glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
           glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
           glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
   #161128-00061#3-----modify--end----------
   FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
   #CALL s_control_get_customer_sql_pmab('4',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl  #170718-00043#1 mark
   CALL s_control_get_customer_sql_pmab('2',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl  #170718-00043#1 add
   #161111-00049#6 Add  ---(E)---

   #IF cl_null(g_master.b_comb1)  THEN LET g_master.b_comb1 = '1' END IF  #151012-00014#1 mark lujh
   #151012-00014#1--add--str--lujh
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2009') RETURNING l_sfin2009   
   IF l_sfin2009 = '1' THEN LET g_master.b_comb1 = '2' END IF
   IF l_sfin2009 = '2' THEN LET g_master.b_comb1 = '3' END IF
   #151012-00014#1--add--end--lujh
   
   IF cl_null(g_master.b_comb2)  THEN LET g_master.b_comb2 = '1' END IF
   #180727-00024#2 add-s
   IF g_master.b_comb2 = '1' THEN
      CALL cl_set_comp_required('xrcadocdt',FALSE)
   END IF
   #180727-00024#2 add-e
   DISPLAY BY NAME g_master.xrcadocdt,g_master.b_comb1,g_master.b_comb2
   
   #150210-00011(1)--20150330--add--
   CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','') 
   RETURNING l_flag1,l_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
             g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
   #150210-00011(1)--20150330--add--
   LET g_master_o.xrcasite  = g_master.xrcasite    #190103-00017#1           
   LET g_master_o.xrcald    = g_master.xrcald      #190103-00017#1           
   LET g_master_o.xrcadocdt = g_master.xrcadocdt   #190103-00017#1         

END FUNCTION

################################################################################
# Descriptions...: 建立臨時表
# Memo...........:
# Usage..........: CALL axrp131_create_tmp()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      建立成功否
# Date & Author..: 2014/10/13 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp131_create_tmp()
   DEFINE r_success         LIKE type_t.chr1

   LET r_success = 'Y'


   DROP TABLE axrp131_tmp01;             #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01 #ODI-ORA#
   CREATE TEMP TABLE axrp131_tmp01 (     #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01
      xmdldocno     LIKE xmdl_t.xmdldocno,
      xmdlseq       LIKE xmdl_t.xmdlseq,
      xmdk000       LIKE xmdk_t.xmdk000,
      xmdk003       LIKE xmdk_t.xmdk003,
      xmdk004       LIKE xmdk_t.xmdk004,
      xmdk007       LIKE xmdk_t.xmdk007,
      xmdk008       LIKE xmdk_t.xmdk008,
      xmdk202       LIKE xmdk_t.xmdk202,  #200415-00064#6 add
      xmdk010       LIKE xmdk_t.xmdk010,
      xmdk014       LIKE xmdk_t.xmdk014,
      xmdk016       LIKE xmdk_t.xmdk016,
      xmdk017       LIKE xmdk_t.xmdk017,
      xrcb007       LIKE xrcb_t.xrcb007,
      xmdk047       LIKE xmdk_t.xmdk047   #160802-00007#1 Add
   );

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF

   #210114-00016#1---add----str
   DROP TABLE axrp131_tmp02;            
   CREATE TEMP TABLE axrp131_tmp02 (    
      xrcadocno     LIKE xmdl_t.xmdldocno 
   );

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN r_success
   END IF
   
   #210114-00016#1---add----end

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 獲取符合條件的出貨單據資料
# Memo...........:
# Usage..........: CALL axrp131_get_data()
#                  RETURNING ---
# Input parameter: ---
# Return code....: ---
# Date & Author..: 2014/10/09 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp131_get_data()
   DEFINE l_success     LIKE type_t.chr1
   DEFINE l_count       LIKE type_t.num5
   DEFINE l_origin_str  STRING
   DEFINE l_xmdk        RECORD
          xmdkdocno     LIKE xmdk_t.xmdkdocno,
          xmdlseq       LIKE xmdl_t.xmdlseq,
          xmdk000       LIKE xmdk_t.xmdk000,
          xmdk003       LIKE xmdk_t.xmdk003,
          xmdk004       LIKE xmdk_t.xmdk004,
          xmdk007       LIKE xmdk_t.xmdk007,
          xmdk008       LIKE xmdk_t.xmdk008,
          xmdk202       LIKE xmdk_t.xmdk202,  #200415-00064#6 add
          xmdk010       LIKE xmdk_t.xmdk010,
          xmdk014       LIKE xmdk_t.xmdk014,
          xmdk016       LIKE xmdk_t.xmdk016,
          xmdk017       LIKE xmdk_t.xmdk017,
          xrcb007       LIKE xrcb_t.xrcb007,
          xmdk047       LIKE xmdk_t.xmdk047   #160802-00007#1 Add
                        END RECORD
   DEFINE l_s           LIKE type_t.chr1
   DEFINE l_mm          LIKE type_t.chr2
   DEFINE l_str         STRING
   DEFINE l_orders      STRING
   DEFINE l_order       LIKE type_t.chr200
   DEFINE l_flag        LIKE type_t.chr1
   DEFINE l_sql         STRING
   DEFINE l_ac          LIKE type_t.num5
   DEFINE l_where       STRING     #160325-00023#1
   DEFINE ls_wc         STRING     #160715-00017#1 Add
   #170419-00018#1 add s---
   DEFINE l_flag1       LIKE type_t.chr1 
   DEFINE l_str1        STRING            
   DEFINE l_xmdl038     LIKE xmdl_t.xmdl038
#  DEFINE l_num         LIKE type_t.num5     #171207-00020#1 mark
   DEFINE l_num         LIKE xmdl_t.xmdl022  #171207-00020#1 add
   DEFINE l_xmdl053     LIKE xmdl_t.xmdl053
   DEFINE l_xmdl047     LIKE xmdl_t.xmdl047
   DEFINE l_xmdl022     LIKE xmdl_t.xmdl022   
   #170419-00018#1 add e---
   DEFINE l_cnt         LIKE type_t.num5   #180821-00038#10 add 
   DEFINE l_xmdk001     LIKE xmdk_t.xmdk001  #200120-00025#1 add #扣账日期
   DEFINE l_xmdk032     LIKE xmdk_t.xmdk032  #200120-00025#1 add #结关日期
      
   IF cl_null(g_master.wc) THEN LET g_master.wc = " 1=1" END IF

   #171020-00002#1 --s mark 
   ##170531-00070#1--add--str--
   ##当稅别录入资料时，单据编号抓取与之相同的稅别
   #IF NOT cl_null(g_master.xrca011) THEN
   #   LET g_master.wc = g_master.wc," AND xmdk012='",g_master.xrca011,"' "
   #END IF
   ##170531-00070#1--add--end
   #171020-00002#1 --e mark
   
   CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s

   CALL s_fin_account_center_sons_query('3',g_master.xrcasite,g_master.xrcadocdt,'')
   CALL s_fin_account_center_sons_str()RETURNING l_origin_str
   IF cl_null(l_origin_str) THEN LET l_origin_str = g_master.xrcasite END IF
   CALL axrp131_get_ooef001_wc(l_origin_str)RETURNING l_origin_str

   LET g_success = 'Y'
   IF MONTH(g_master.xrcadocdt) > 9 THEN
      LET l_mm = MONTH(g_master.xrcadocdt)
   ELSE
      LET l_mm = '0',MONTH(g_master.xrcadocdt)
   END IF

   #180821-00038#10 add s---
   #立暫估時 檢核非作廢單據單身是否已存在相同來源單 +項次,有則不可重複立帳
   LET l_sql = " SELECT COUNT(xrcadocno) ",
               "   FROM xrca_t,xrcb_t ",
               "  WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcald = xrcbld ",
               "    AND xrcbent = ",g_enterprise,"  AND xrcbld = '",g_master.xrcald,"'  ",
               "    AND xrca001 IN ('01','02') AND xrcastus <> 'X' ",
               "    AND xrcb002 = ? AND xrcb003 = ?  "
   PREPARE axrp131_xrcachk_p FROM l_sql  
   #180821-00038#10 add e---
   
   CALL s_axrp133_get_scc('xmdk000','2077') RETURNING ls_wc   #160715-00017#1 Add
   LET ls_wc = cl_str_replace(ls_wc,"OR () OR"," OR ") #PGS(D)-03080
   #180329-00029#1 add--s
   IF g_master.l_price = 'N'  THEN
      LET l_str = " AND xmdl024 <> 0 "
   ELSE
      LET l_str = " AND 1 = 1 "
   END IF
   #180727-00024#2  add-s
   IF NOT cl_null(g_master.xrcadocdt) THEN
      LET g_master.wc=g_master.wc," AND xmdk001 BETWEEN '",g_pdate_s,"' AND '",g_master.xrcadocdt,"' "
   END IF 
   #180727-00024#2  add-e
   #180928-00039#1 add-s
   #IF g_master.xmdk042='2' AND g_master.wc.getIndexOf('xmdk001',1) > 0 THEN #200410-00009#1 mark
   IF g_master.xmdk042='2' THEN  #200410-00009#1 add 
      LET g_master_wc2=g_master.wc
      IF g_master.wc.getIndexOf('xmdk001',1) > 0 THEN  #200410-00009#1 add
         LET g_master.wc = cl_replace_str(g_master.wc,"xmdk001","xmdk032")
      END IF  #200410-00009#1 add   
   END IF 
   #180928-00039#1 add-e
   #180329-00029#1 add--e
   IF g_master.xmdk042='1' THEN  #180928-00039#1 add
#      LET g_sql = "SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk010,      ",  #200415-00064#6 mark
      LET g_sql = "SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk202,xmdk010,      ",  #200415-00064#6 add
                  "       xmdk014,xmdk016,xmdk017,xrcb007,xmdk047                                 ",   #160802-00007#1 Add xmdk047
#                  "  FROM ( SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,      ",  #200415-00064#6 mark
                  "  FROM ( SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk202,      ",  #200415-00064#6 add
                  "               xmdk010,xmdk014,xmdk016,xmdk017,xmdk047,                        ",   #160802-00007#1 Add xmdk047  
                  "               CASE WHEN '",l_s,"' = '1' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl038 IS NULL THEN 0 ELSE xmdl038 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl053 END       ",
                 #"                     - CASE WHEN xmdl047 IS NULL THEN 0 ELSE xmdl047 END       ",   #160920-00011#1 Add   #161102-00034#1 Mark
                  "                    WHEN '",l_s,"' = '2' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl039 IS NULL THEN 0 ELSE xmdl039 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl054 END       ",
                 #"                     - CASE WHEN xmdl047 IS NULL THEN 0 ELSE xmdl047 END       ",   #160920-00011#1 Add   #161102-00034#1 Mark
                  "                    WHEN '",l_s,"' = '3' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl040 IS NULL THEN 0 ELSE xmdl040 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl055 END       ",
                 #"                     - CASE WHEN xmdl047 IS NULL THEN 0 ELSE xmdl047 END       ",   #160920-00011#1 Add   #161102-00034#1 Mark
                  "               END xrcb007                                                     ",
                  "          FROM xmdk_t, xmdl_t                                                  ",
                  "         WHERE     xmdkdocno = xmdldocno      AND xmdkent = xmdlent            ",
                  "               AND xmdl087 = 'Y'              AND xmdkent = '",g_enterprise,"' ",
                  l_str,  #180329-00029#1 add
                 #"               AND xmdkstus = 'S'                                              ",   #151123-00013#6 Mark
                 #"               AND ((xmdk000 <> 6 AND xmdk002 = '1') OR xmdk000 = 6)           ",   #150309-00036#1 Mark
                 #151123-00013#6 Mark ---(S)---
                 #"               AND xmdk000 IN ('1','2','3','6')                                ",   #150309-00036#1 Add
                 #"       AND ((xmdk000 <> 6 AND xmdk002 = '1') OR (xmdk000 = 6 AND xmdk082 <> 5))",   #150309-00036#1 Add
                 #151123-00013#6 Mark ---(E)---
                 #151123-00013#6 Add  ---(S)---
                #160715-00017#1 Mark ---(S)---
                 #151207-00018#1 Mod  ---(S)---
                #"                AND ((xmdk000 IN ('1', '2', '3') AND xmdkstus = 'S' AND xmdk002 = '1') ",
                #"                  OR (xmdk000 = '4' AND xmdkstus = 'Y' AND xmdk002 = '3')  ",
                #"                  OR (xmdk000 = '6' AND xmdk028 IN (SELECT gzcb002 FROM gzcb_t WHERE gzcb001='2088' AND gzcb003='Y')))",   #151008-00009#8 mark
                #"                  OR (xmdk000 = '6' AND xmdk082 IN (SELECT gzcb002 FROM gzcb_t WHERE gzcb001='2088' AND gzcb003='Y')))",   #151008-00009#8 
                 #151207-00018#1 Mod  ---(E)---
                 #151123-00013#6 Add  ---(E)---
                #160715-00017#1 Mark ---(E)---
                  "               AND ",ls_wc CLIPPED, #160715-00017#1 Add
                  "               AND xmdk042='",g_master.xmdk042,"'", #180928-00039#1 add
                  "               AND ", g_master.wc  CLIPPED,
                  #"               AND TO_CHAR(xmdk001,'MM') = '",l_mm,"'",                  #150210-00011(1)--20150330--mark-- 
                  #"               AND xmdk001 BETWEEN '",g_pdate_s,"' AND '",g_pdate_e,"'",  #150210-00011(1)--20150330--add--  #180321-00029#1 mark
                  #"               AND xmdk001 BETWEEN '",g_pdate_s,"' AND '",g_master.xrcadocdt,"'",  #180321-00029#1 add #180329-00029#1 mark
                  #180731-00017#33 -s  mark by 11387
   #               "               AND xmdk001 BETWEEN (to_date('",g_pdate_s,"','YY-MM-DD')) AND (to_date('",g_master.xrcadocdt,"','YY-MM-DD'))",   #180329-00029#1 mod
                  #180731-00017#33 -e  mark by 11387
                  #180731-00017#33 -s  add by 11387
                  #"               AND xmdk001 BETWEEN (?) AND (?)",   #180727-00024#2 mark
                  #180731-00017#33 -e  add by 11387
                  #"               AND xmdk002 = '1'                                               ",
                  "               AND xmdlsite IN ",l_origin_str,"                                ",
                  #"               )                                                               ",     #PGS(D)-03080 mark
                  "               ) t51                                                              ",   #PGS(D)-03080
                  " WHERE     xrcb007 > 0                                                         "
   #180928-00039#1 add-s
   ELSE
      #出货
#      LET g_sql = "SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk010,      ",  #200415-00064#6 mark
      LET g_sql = "SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk202,xmdk010,      ",  #200415-00064#6 add
                  "       xmdk014,xmdk016,xmdk017,xrcb007,xmdk047                                 ",  
#                  "  FROM ( SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,      ",  #200415-00064#6 mark
                  "  FROM ( SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk202,      ",  #200415-00064#6 add
                  "               xmdk010,xmdk014,xmdk016,xmdk017,xmdk047,                        ",   
                  "               CASE WHEN '",l_s,"' = '1' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl038 IS NULL THEN 0 ELSE xmdl038 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl053 END       ",
                  "                    WHEN '",l_s,"' = '2' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl039 IS NULL THEN 0 ELSE xmdl039 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl054 END       ",
                  "                    WHEN '",l_s,"' = '3' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl040 IS NULL THEN 0 ELSE xmdl040 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl055 END       ",
                  "               END xrcb007                                                     ",
                  "          FROM xmdk_t, xmdl_t                                                  ",
                  "         WHERE     xmdkdocno = xmdldocno      AND xmdkent = xmdlent            ",
                  "               AND xmdl087 = 'Y'              AND xmdkent = '",g_enterprise,"' ",l_str,  
                  "               AND ",ls_wc CLIPPED, 
                  "               AND xmdk042='",g_master.xmdk042,"'", 
                  "               AND xmdk000<>'6'", 
                  "               AND ", g_master.wc  CLIPPED,
                  "               AND xmdlsite IN ",l_origin_str,"                                ",
                  #"               )                                                               ",   #PGS(D)-03080 mark
                  "                )    t51                                                         ",  #PGS(D)-03080
                  " WHERE     xrcb007 > 0                                                         ",
                  " UNION ",
                  #销退                  
#                  "SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk010,      ",  #200415-00064#6 mark
                  "SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk202,xmdk010,      ",  #200415-00064#6 add
                  "       xmdk014,xmdk016,xmdk017,xrcb007,xmdk047                                 ",  
#                  "  FROM ( SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,      ",  #200415-00064#6 mark
                  "  FROM ( SELECT xmdkdocno,xmdlseq,xmdk000,xmdk003,xmdk004,xmdk007,xmdk008,xmdk202,      ",  #200415-00064#6 add
                  "               xmdk010,xmdk014,xmdk016,xmdk017,xmdk047,                        ",   
                  "               CASE WHEN '",l_s,"' = '1' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl038 IS NULL THEN 0 ELSE xmdl038 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl053 END       ",
                  "                    WHEN '",l_s,"' = '2' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl039 IS NULL THEN 0 ELSE xmdl039 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl054 END       ",
                  "                    WHEN '",l_s,"' = '3' THEN                                  ",
                  "                       CASE WHEN xmdl022 IS NULL THEN 0 ELSE xmdl022 END       ",
                  "                     - CASE WHEN xmdl040 IS NULL THEN 0 ELSE xmdl040 END       ",
                  "                     - CASE WHEN xmdl053 IS NULL THEN 0 ELSE xmdl055 END       ",
                  "               END xrcb007                                                     ",
                  "          FROM xmdk_t, xmdl_t                                                  ",
                  "         WHERE     xmdkdocno = xmdldocno      AND xmdkent = xmdlent            ",
                  "               AND xmdl087 = 'Y'              AND xmdkent = '",g_enterprise,"' ",l_str,  
                  "               AND ",ls_wc CLIPPED, 
                  "               AND xmdk042='",g_master.xmdk042,"'", 
                  "               AND xmdk000='6'", 
                  "               AND ",g_master_wc2  CLIPPED,
                  "               AND xmdlsite IN ",l_origin_str,"                                ",
                  #"               )                                                               ",    #PGS(D)-03080 mark
                  "                ) t52                                                           ",    #PGS(D)-03080
                  " WHERE     xrcb007 > 0                                                         "                  
   END IF 
   #180928-00039#1 add-e
   #151231-00010#9--add--str--
   IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
      LET g_sql = g_sql," AND EXISTS (SELECT 1 FROM pmaa_t ",
                        "              WHERE pmaaent = ",g_enterprise,
                        "                AND ",g_sql_ctrl,
                        "                AND pmaa001 = xmdk007)"
   END IF
   #151231-00010#9--add--end
   #170807-00016#1 -s 170817 add by 08172
   IF NOT cl_null(g_master.xrca008) THEN
      LET g_sql = g_sql CLIPPED," AND EXISTS (SELECT 1 ",
                                "               FROM pmaa_t,pmad_t ",
                                "              WHERE pmadent=pmaaent ",
                                "                AND pmaaent=",g_enterprise,
                                "                AND pmad001=pmaa001",
                                "                AND pmaa001=xmdk007",
                                "                AND pmad002='",g_master.xrca008,"'",
                                "                AND pmadstus='Y')"
   END IF
   #170807-00016#1 -e 170817 add by 08172
   #160325-00023#1 ---s---
   #CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','','xmdkdocno') RETURNING g_sub_success,l_where        #180509-00055#2 mark
   CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','axmt540','xmdkdocno') RETURNING g_sub_success,l_where  #180509-00055#2 add 
   LET g_sql = g_sql CLIPPED," AND ",l_where," ORDER BY xmdkdocno,xmdlseq " #180821-00038#10 add ORDER BY xmdkdocno,xmdlseq
   #160325-00023#1 ---e---
   
   PREPARE axrp131_prep FROM g_sql
   DECLARE axrp131_curs CURSOR FOR axrp131_prep


   #170419-00018#1 add s---
   LET g_sql =" SELECT xmdl022,xmdl038,xmdl047,xmdl053 FROM xmdl_t WHERE xmdlent = ",g_enterprise," AND xmdldocno = ? AND xmdlseq = ? "
   PREPARE axrp131_xmdl_prep FROM g_sql
   #170419-00018#1 add e---
   
   CALL axrp131_create_tmp() RETURNING l_success
   LET l_flag1 = 'Y'  #170419-00018#1 add 
   
   #180731-00017#33 -s  mark by 11387
#   FOREACH axrp131_curs INTO l_xmdk.*
   #180731-00017#33 -e  mark by 11387
   #180731-00017#33 -s  add by 11387
   #FOREACH axrp131_curs USING g_pdate_s,g_master.xrcadocdt INTO l_xmdk.*   #180727-00024#2 mark
   FOREACH axrp131_curs INTO l_xmdk.*   #180727-00024#2 add
   #180731-00017#33 -e  add by 11387
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET g_success = 'N'
         EXIT FOREACH
      END IF

      #180821-00038#10 add s---
      #立暫估時 檢核非作廢單據單身是否已存在相同來源單 +項次,有則不可重複立帳
      LET l_cnt = 0
      EXECUTE axrp131_xrcachk_p USING l_xmdk.xmdkdocno,l_xmdk.xmdlseq INTO l_cnt  
      IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF       
      IF l_cnt <> 0 THEN CONTINUE FOREACH END IF      
      #180821-00038#10 add e--   
      
#180821-00038#10 mod s--- #可立暂估数量重新计算
#      #170419-00018#1 add s---
#      #出货单/销退单+项次检核
#      EXECUTE axrp131_xmdl_prep USING l_xmdk.xmdkdocno,l_xmdk.xmdlseq INTO l_xmdl022,l_xmdl038,l_xmdl047,l_xmdl053 
#      #若已立帳 = 0 and 已對帳數量 >= 0, 則 計價-已對帳-暫估 = 可暫估
#      IF l_xmdl038 = 0 AND l_xmdl047 >= 0 THEN 
#         LET l_num = l_xmdl022-l_xmdl047-l_xmdl053   
#      END IF
#      #若 已立帳 > 0  則 計價 - 立帳 - 暫估= 可暫估
#      IF l_xmdl038 > 0 THEN 
#         LET l_num = l_xmdl022-l_xmdl038-l_xmdl053
#      END IF
      #200120-00025#1   add-S
      IF cl_null(g_master.xrcadocdt) AND g_master.b_comb2 = '1' THEN
         SELECT xmdk001,xmdk032 INTO l_xmdk001,l_xmdk032
           FROM xmdk_t
          WHERE xmdkent   = g_enterprise
            AND xmdkdocno = l_xmdk.xmdkdocno
         IF g_master.xmdk042 = '2' AND l_xmdk.xmdk000 <> '6' THEN  #外销出货 日期给结关日期
            LET g_master.xrcadocdt = l_xmdk032   #结关日期
         ELSE
            LET g_master.xrcadocdt = l_xmdk001            #扣账日期
         END IF
      END IF
      #200120-00025#1   add-E
       #CALL s_axrt300_xmdl_get_xrcb007(g_master.xrcald,l_xmdk.xmdkdocno,l_xmdk.xmdlseq,'') RETURNING l_num,g_success   #190122-00041#1 mark
       #PGS(D)-03080-----s  need TQC          
       IF cl_null(g_master.xrcadocdt)THEN
          LET l_xmdk001 = NULL
          SELECT xmdk001 INTO l_xmdk001 FROM xmdk_t
           WHERE xmdkent = g_enterprise
             AND xmdkdocno = l_xmdk.xmdkdocno
          CALL s_axrt300_xmdl_get_xrcb007(g_master.xrcald,l_xmdk.xmdkdocno,l_xmdk.xmdlseq,'',l_xmdk001) RETURNING l_num,g_success
       ELSE
       #PGS(D)-03080-----e  need TQC
          CALL s_axrt300_xmdl_get_xrcb007(g_master.xrcald,l_xmdk.xmdkdocno,l_xmdk.xmdlseq,'',g_master.xrcadocdt) RETURNING l_num,g_success   #190122-00041#1 add
       END IF   #PGS(D)-03080  need TQC#180821-00038#10 mod e---      
      IF l_num > 0 THEN 
      #170419-00018#1 add e---
         IF cl_null(l_xmdk.xmdk003) THEN LET l_xmdk.xmdk003 = ' ' END IF
         IF cl_null(l_xmdk.xmdk004) THEN LET l_xmdk.xmdk004 = ' ' END IF
         IF cl_null(l_xmdk.xmdk007) THEN LET l_xmdk.xmdk007 = ' ' END IF
         IF cl_null(l_xmdk.xmdk008) THEN LET l_xmdk.xmdk008 = ' ' END IF
         IF cl_null(l_xmdk.xmdk010) THEN LET l_xmdk.xmdk010 = ' ' END IF
         IF cl_null(l_xmdk.xmdk014) THEN LET l_xmdk.xmdk014 = ' ' END IF
         IF cl_null(l_xmdk.xmdk016) THEN LET l_xmdk.xmdk016 = ' ' END IF
         IF cl_null(l_xmdk.xmdk017) THEN LET l_xmdk.xmdk017 = ' ' END IF
         IF cl_null(l_xmdk.xmdk047) THEN LET l_xmdk.xmdk047 = ' ' END IF   #160802-00007#1 Add

         INSERT INTO axrp131_tmp01 VALUES (l_xmdk.*)           #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01
      #170419-00018#1 add s--- 
      ELSE
         LET l_flag1 = 'N'
         IF cl_null(l_str1) THEN 
            LET l_str1 = l_xmdk.xmdkdocno 
         ELSE
            LET l_str1 = l_str1,' ',l_xmdk.xmdkdocno
         END IF         
         CONTINUE FOREACH      
      END IF
      #170419-00018#1 add e---
   END FOREACH
   
   IF g_success = 'Y' THEN
      #170419-00018#1 add s--- 
      IF l_flag1 = 'N' THEN  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = l_str1
#         LET g_errparam.code   = 'axr-01079'   #180604-00064#1 180731 mark by 08172
         LET g_errparam.code   = 'axr-93209'   #180604-00064#1 180731 add by 08172         
         LET g_errparam.popup  = TRUE
         CALL cl_err()      
      END IF
      #170419-00018#1 add s---
      SELECT COUNT(*) INTO l_count FROM axrp131_tmp01       #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01
      IF l_count = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = 'ins temp table:'
#         LET g_errparam.code   = 'axm-00276'   #160318-00005#51  mark
         LET g_errparam.code   = 'sub-01321'    #160318-00005#51  add
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET g_success = 'N'
      END IF
   END IF

  #20150201#1 By zhangwei Add ---(S)---
   CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-1002') RETURNING l_flag

   CASE
      WHEN g_master.b_comb2 = '1'
         LET l_str   = "xmdldocno"
         LET l_orders= "xmdldocno"
      WHEN g_master.b_comb2 = '2'
         #200415-00064#6 mark -s
#         LET l_str   = "xmdk007||xmdk008||xmdk016"  
#         LET l_orders= "xmdk007,xmdk008,xmdk016"
         #200415-00064#6 mark -e
         #200415-00064#6 add -s
         LET l_str   = "xmdk007||xmdk008||xmdk202||xmdk016"  
         LET l_orders= "xmdk007,xmdk008,xmdk202,xmdk016"
         #200415-00064#6 add -e
         IF cl_null(g_master.xrca008) AND l_flag != '3' THEN
            LET l_str   = l_str,   "||xmdk010"
            LET l_orders= l_orders,",xmdk010"
         END IF
         IF g_master.b_comb1 = '1' THEN
            LET l_str   = l_str,   "||xmdk017"
            LET l_orders= l_orders,",xmdk017"
         END IF
      WHEN g_master.b_comb2 = '3'
         #200415-00064#6 mark -s
#         LET l_str   = "xmdk007||xmdk008||xmdk016||xmdk003"
#         LET l_orders= "xmdk007,xmdk008,xmdk016,xmdk003"
         #200415-00064#6 mark -e
         #200415-00064#6 add -s
         LET l_str   = "xmdk007||xmdk008||xmdk202||xmdk016||xmdk003"
         LET l_orders= "xmdk007,xmdk008,xmdk202,xmdk016,xmdk003"
         #200415-00064#6 add -e
         IF cl_null(g_master.xrca008) AND l_flag != '3' THEN
            LET l_str   = l_str,   "||xmdk010"
            LET l_orders= l_orders,",xmdk010"
         END IF
        IF g_master.b_comb1 = '1' THEN
           LET l_str   = l_str,   "||xmdk017"
           LET l_orders= l_orders,",xmdk017"
        END IF
      WHEN g_master.b_comb2 = '4'
         #200415-00064#6 mark -s
#         LET l_str   = "xmdk007||xmdk008||xmdk016||xmdk004"
#         LET l_orders= "xmdk007,xmdk008,xmdk016,xmdk004"
         #200415-00064#6 mark -e
         #200415-00064#6 add -s
         LET l_str   = "xmdk007||xmdk008||xmdk202||xmdk016||xmdk004"
         LET l_orders= "xmdk007,xmdk008,xmdk202,xmdk016,xmdk004" 
         #200415-00064#6 add -e
         IF cl_null(g_master.xrca008) AND l_flag != '3' THEN
            LET l_str   = l_str,   "||xmdk010"
            LET l_orders= l_orders,",xmdk010"
         END IF
         IF g_master.b_comb1 = '1' THEN
            LET l_str   = l_str,   "||xmdk017"
            LET l_orders= l_orders,",xmdk017"
         END IF
   END CASE
   LET l_str   = l_str,   "||xmdk047"   #160802-00007#1 Add
   LET l_orders= l_orders,",xmdk047"    #160802-00007#1 Add
   LET l_str = l_str,"||CASE WHEN xmdk000 = 6 THEN 2 ELSE 1 END"
   LET l_orders= l_orders,",CASE WHEN xmdk000 = 6 THEN 2 ELSE 1 END"

   LET l_sql = "SELECT ",l_str,",xmdldocno,xmdlseq,xrcb007,xmdk047 FROM axrp131_tmp01",        #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01   #160802-00007#1 Add xmdk047
               #" ORDER BY ",l_orders, #180821-00038#10 mark
               " ORDER BY ",l_orders,",xmdldocno,xmdlseq " #180821-00038#10 add s
   PREPARE axrp131_ar_prep1 FROM l_sql
   DECLARE axrp131_ar_curs1 CURSOR FOR axrp131_ar_prep1

   CALL g_xmdk_d.clear()
   LET l_ac = 1

   FOREACH axrp131_ar_curs1 INTO g_xmdk_d[l_ac].*
      LET l_ac = l_ac + 1
   END FOREACH
   CALL g_xmdk_d.deleteElement(l_ac)
   LET l_ac = l_ac - 1
  #20150201#1 By zhangwei Add ---(E)---

END FUNCTION

################################################################################
# Descriptions...: 產生應收單據
# Memo...........:
# Usage..........: CALL axrp131_get_ar()
#                  RETURNING ---
# Input parameter: ---
# Return code....: ---
# Date & Author..: 2014/10/09 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp131_get_ar()
   DEFINE l_sql         STRING
   DEFINE l_order_t     LIKE type_t.chr200
   #161128-00061#3-----modify--begin----------
   #DEFINE l_xmdk        RECORD LIKE xmdk_t.*
   #DEFINE l_xmdl        RECORD LIKE xmdl_t.*
   DEFINE l_xmdk RECORD  #出貨/簽收/銷退單單頭檔
       xmdkent LIKE xmdk_t.xmdkent, #企業編號
       xmdksite LIKE xmdk_t.xmdksite, #營運據點
       xmdkunit LIKE xmdk_t.xmdkunit, #應用組織
       xmdkdocno LIKE xmdk_t.xmdkdocno, #單據單號
       xmdkdocdt LIKE xmdk_t.xmdkdocdt, #單據日期
       xmdk000 LIKE xmdk_t.xmdk000, #單據性質
       xmdk001 LIKE xmdk_t.xmdk001, #扣帳日期
       xmdk002 LIKE xmdk_t.xmdk002, #出貨性質
       xmdk003 LIKE xmdk_t.xmdk003, #業務人員
       xmdk004 LIKE xmdk_t.xmdk004, #業務部門
       xmdk005 LIKE xmdk_t.xmdk005, #出通/出貨單號
       xmdk006 LIKE xmdk_t.xmdk006, #訂單單號
       xmdk007 LIKE xmdk_t.xmdk007, #訂單客戶
       xmdk008 LIKE xmdk_t.xmdk008, #收款客戶
       xmdk009 LIKE xmdk_t.xmdk009, #收貨客戶
       xmdk010 LIKE xmdk_t.xmdk010, #收款條件
       xmdk011 LIKE xmdk_t.xmdk011, #交易條件
       xmdk012 LIKE xmdk_t.xmdk012, #稅別
       xmdk013 LIKE xmdk_t.xmdk013, #稅率
       xmdk014 LIKE xmdk_t.xmdk014, #單價含稅否
       xmdk015 LIKE xmdk_t.xmdk015, #發票類型
       xmdk016 LIKE xmdk_t.xmdk016, #幣別
       xmdk017 LIKE xmdk_t.xmdk017, #匯率
       xmdk018 LIKE xmdk_t.xmdk018, #取價方式
       xmdk019 LIKE xmdk_t.xmdk019, #優惠條件
       xmdk020 LIKE xmdk_t.xmdk020, #送貨供應商
       xmdk021 LIKE xmdk_t.xmdk021, #送貨地址
       xmdk022 LIKE xmdk_t.xmdk022, #運輸方式
       xmdk023 LIKE xmdk_t.xmdk023, #交運起點
       xmdk024 LIKE xmdk_t.xmdk024, #交運終點
       xmdk025 LIKE xmdk_t.xmdk025, #航次/航班/車號
       xmdk026 LIKE xmdk_t.xmdk026, #起運日期
       xmdk027 LIKE xmdk_t.xmdk027, #嘜頭編號
       xmdk028 LIKE xmdk_t.xmdk028, #包裝單製作
       xmdk029 LIKE xmdk_t.xmdk029, #Invoice製作
       xmdk030 LIKE xmdk_t.xmdk030, #銷售通路
       xmdk031 LIKE xmdk_t.xmdk031, #銷售分類
       xmdk032 LIKE xmdk_t.xmdk032, #結關日期
       xmdk033 LIKE xmdk_t.xmdk033, #額外品名規格
       xmdk034 LIKE xmdk_t.xmdk034, #留置原因
       xmdk035 LIKE xmdk_t.xmdk035, #多角序號
       xmdk036 LIKE xmdk_t.xmdk036, #整合單號
       xmdk037 LIKE xmdk_t.xmdk037, #發票號碼
       xmdk038 LIKE xmdk_t.xmdk038, #運輸狀態
       xmdk039 LIKE xmdk_t.xmdk039, #在途成本庫位
       xmdk040 LIKE xmdk_t.xmdk040, #在途非成本庫位
       xmdk041 LIKE xmdk_t.xmdk041, #發票編號
       xmdk042 LIKE xmdk_t.xmdk042, #內外銷
       xmdk043 LIKE xmdk_t.xmdk043, #匯率計算基準
       xmdk044 LIKE xmdk_t.xmdk044, #多角流程編號
       xmdk045 LIKE xmdk_t.xmdk045, #多角性質
       xmdk051 LIKE xmdk_t.xmdk051, #總未稅金額
       xmdk052 LIKE xmdk_t.xmdk052, #總含稅金額
       xmdk053 LIKE xmdk_t.xmdk053, #總稅額
       xmdk054 LIKE xmdk_t.xmdk054, #備註
       xmdk055 LIKE xmdk_t.xmdk055, #客戶收貨日
       xmdk081 LIKE xmdk_t.xmdk081, #對應的簽收單號
       xmdk082 LIKE xmdk_t.xmdk082, #銷退方式
       xmdk083 LIKE xmdk_t.xmdk083, #多角貿易已拋轉
       xmdk084 LIKE xmdk_t.xmdk084, #折讓證明單開立否
       xmdk200 LIKE xmdk_t.xmdk200, #調貨經銷商編號
       xmdk201 LIKE xmdk_t.xmdk201, #代送商編號
       xmdk202 LIKE xmdk_t.xmdk202, #發票客戶
       xmdk203 LIKE xmdk_t.xmdk203, #促銷方案編號
       xmdk204 LIKE xmdk_t.xmdk204, #整單折扣
       xmdk205 LIKE xmdk_t.xmdk205, #送貨站點編號
       xmdk206 LIKE xmdk_t.xmdk206, #運輸路線編號
       xmdk207 LIKE xmdk_t.xmdk207, #銷售組織
       xmdk208 LIKE xmdk_t.xmdk208, #調貨出貨單號
       xmdk209 LIKE xmdk_t.xmdk209, #No Use
       xmdk210 LIKE xmdk_t.xmdk210, #No Use
       xmdk211 LIKE xmdk_t.xmdk211, #No Use
       xmdk212 LIKE xmdk_t.xmdk212, #No Use
       xmdk213 LIKE xmdk_t.xmdk213, #本幣含稅總金額
       xmdk214 LIKE xmdk_t.xmdk214, #收款完成否
       xmdkownid LIKE xmdk_t.xmdkownid, #資料所屬者
       xmdkowndp LIKE xmdk_t.xmdkowndp, #資料所有部門
       xmdkcrtid LIKE xmdk_t.xmdkcrtid, #資料建立者
       xmdkcrtdp LIKE xmdk_t.xmdkcrtdp, #資料建立部門
       xmdkcrtdt LIKE xmdk_t.xmdkcrtdt, #資料創建日
       xmdkmodid LIKE xmdk_t.xmdkmodid, #資料修改者
       xmdkmoddt LIKE xmdk_t.xmdkmoddt, #最近修改日
       xmdkcnfid LIKE xmdk_t.xmdkcnfid, #資料確認者
       xmdkcnfdt LIKE xmdk_t.xmdkcnfdt, #資料確認日
       xmdkpstid LIKE xmdk_t.xmdkpstid, #資料過帳者
       xmdkpstdt LIKE xmdk_t.xmdkpstdt, #資料過帳日
       xmdkstus LIKE xmdk_t.xmdkstus, #狀態碼
       xmdk085 LIKE xmdk_t.xmdk085, #資料來源(銷退)
       xmdk086 LIKE xmdk_t.xmdk086, #來源單號(銷退)
       xmdk046 LIKE xmdk_t.xmdk046, #整合來源
       xmdk087 LIKE xmdk_t.xmdk087, #出貨走發票倉調撥
       xmdk047 LIKE xmdk_t.xmdk047, #一次性交易對象識別碼
       xmdk088 LIKE xmdk_t.xmdk088, #來源類型
       xmdk089 LIKE xmdk_t.xmdk089  #來源單號
       END RECORD
   DEFINE l_xmdl RECORD  #出貨/簽收/銷退單單身明細檔
       xmdlent LIKE xmdl_t.xmdlent, #企業編號
       xmdlsite LIKE xmdl_t.xmdlsite, #營運據點
       xmdldocno LIKE xmdl_t.xmdldocno, #單據編號
       xmdlseq LIKE xmdl_t.xmdlseq, #項次
       xmdl001 LIKE xmdl_t.xmdl001, #出通單號
       xmdl002 LIKE xmdl_t.xmdl002, #出通項次
       xmdl003 LIKE xmdl_t.xmdl003, #訂單單號
       xmdl004 LIKE xmdl_t.xmdl004, #訂單項次
       xmdl005 LIKE xmdl_t.xmdl005, #訂單項序
       xmdl006 LIKE xmdl_t.xmdl006, #訂單分批序
       xmdl007 LIKE xmdl_t.xmdl007, #子件特性
       xmdl008 LIKE xmdl_t.xmdl008, #料件編號
       xmdl009 LIKE xmdl_t.xmdl009, #產品特徵
       xmdl010 LIKE xmdl_t.xmdl010, #包裝容器
       xmdl011 LIKE xmdl_t.xmdl011, #作業編號
       xmdl012 LIKE xmdl_t.xmdl012, #作業序
       xmdl013 LIKE xmdl_t.xmdl013, #多庫儲批出貨
       xmdl014 LIKE xmdl_t.xmdl014, #庫位
       xmdl015 LIKE xmdl_t.xmdl015, #儲位
       xmdl016 LIKE xmdl_t.xmdl016, #批號
       xmdl017 LIKE xmdl_t.xmdl017, #出貨單位
       xmdl018 LIKE xmdl_t.xmdl018, #數量
       xmdl019 LIKE xmdl_t.xmdl019, #參考單位
       xmdl020 LIKE xmdl_t.xmdl020, #參考數量
       xmdl021 LIKE xmdl_t.xmdl021, #計價單位
       xmdl022 LIKE xmdl_t.xmdl022, #計價數量
       xmdl023 LIKE xmdl_t.xmdl023, #檢驗否
       xmdl024 LIKE xmdl_t.xmdl024, #單價
       xmdl025 LIKE xmdl_t.xmdl025, #稅別
       xmdl026 LIKE xmdl_t.xmdl026, #稅率
       xmdl027 LIKE xmdl_t.xmdl027, #未稅金額
       xmdl028 LIKE xmdl_t.xmdl028, #含稅金額
       xmdl029 LIKE xmdl_t.xmdl029, #稅額
       xmdl030 LIKE xmdl_t.xmdl030, #專案編號
       xmdl031 LIKE xmdl_t.xmdl031, #WBS編號
       xmdl032 LIKE xmdl_t.xmdl032, #活動編號
       xmdl033 LIKE xmdl_t.xmdl033, #客戶料號
       xmdl034 LIKE xmdl_t.xmdl034, #QPA
       xmdl035 LIKE xmdl_t.xmdl035, #已簽收量
       xmdl036 LIKE xmdl_t.xmdl036, #已簽退量
       xmdl037 LIKE xmdl_t.xmdl037, #已銷退量
       xmdl038 LIKE xmdl_t.xmdl038, #主帳套已立帳數量
       xmdl039 LIKE xmdl_t.xmdl039, #帳套二已立帳數量
       xmdl040 LIKE xmdl_t.xmdl040, #帳套三已立帳數量
       xmdl041 LIKE xmdl_t.xmdl041, #保稅否
       xmdl042 LIKE xmdl_t.xmdl042, #取價來源
       xmdl043 LIKE xmdl_t.xmdl043, #價格來源參考單號
       xmdl044 LIKE xmdl_t.xmdl044, #價格來源參考項次
       xmdl045 LIKE xmdl_t.xmdl045, #取出價格
       xmdl046 LIKE xmdl_t.xmdl046, #價差比
       xmdl047 LIKE xmdl_t.xmdl047, #已開發票數量
       xmdl048 LIKE xmdl_t.xmdl048, #發票編號
       xmdl049 LIKE xmdl_t.xmdl049, #發票號碼
       xmdl050 LIKE xmdl_t.xmdl050, #理由碼
       xmdl051 LIKE xmdl_t.xmdl051, #備註
       xmdl052 LIKE xmdl_t.xmdl052, #庫存管理特徵
       xmdl053 LIKE xmdl_t.xmdl053, #主帳套暫估數量
       xmdl054 LIKE xmdl_t.xmdl054, #帳套二暫估數量
       xmdl055 LIKE xmdl_t.xmdl055, #帳套三暫估數量
       xmdl081 LIKE xmdl_t.xmdl081, #簽退數量(簽收、簽退單使用)
       xmdl082 LIKE xmdl_t.xmdl082, #簽退參考數量(簽收、簽退單使用)
       xmdl083 LIKE xmdl_t.xmdl083, #簽退計價數量(簽收、簽退單使用)
       xmdl084 LIKE xmdl_t.xmdl084, #簽退理由碼(簽收、簽退單使用)
       xmdl085 LIKE xmdl_t.xmdl085, #訂單開立據點
       xmdl086 LIKE xmdl_t.xmdl086, #訂單多角性質
       xmdl087 LIKE xmdl_t.xmdl087, #需自立應收否
       xmdl088 LIKE xmdl_t.xmdl088, #多角流程編號
       xmdl089 LIKE xmdl_t.xmdl089, #QC單號
       xmdl090 LIKE xmdl_t.xmdl090, #判定項次
       xmdl091 LIKE xmdl_t.xmdl091, #判定結果
       xmdl092 LIKE xmdl_t.xmdl092, #借貨還量數量
       xmdl093 LIKE xmdl_t.xmdl093, #借貨還量參考數量
       xmdl200 LIKE xmdl_t.xmdl200, #銷售通路
       xmdl201 LIKE xmdl_t.xmdl201, #產品組編碼
       xmdl202 LIKE xmdl_t.xmdl202, #銷售範圍編碼
       xmdl203 LIKE xmdl_t.xmdl203, #銷售辦公室
       xmdl204 LIKE xmdl_t.xmdl204, #出貨包裝單位
       xmdl205 LIKE xmdl_t.xmdl205, #出貨包裝數量
       xmdl206 LIKE xmdl_t.xmdl206, #簽退包裝數量
       xmdl207 LIKE xmdl_t.xmdl207, #庫存鎖定等級
       xmdl208 LIKE xmdl_t.xmdl208, #標準價
       xmdl209 LIKE xmdl_t.xmdl209, #促銷價
       xmdl210 LIKE xmdl_t.xmdl210, #交易價
       xmdl211 LIKE xmdl_t.xmdl211, #折價金額
       xmdl212 LIKE xmdl_t.xmdl212, #銷售組織
       xmdl213 LIKE xmdl_t.xmdl213, #銷售人員
       xmdl214 LIKE xmdl_t.xmdl214, #銷售部門
       xmdl215 LIKE xmdl_t.xmdl215, #合約編號
       xmdl216 LIKE xmdl_t.xmdl216, #經營方式
       xmdl217 LIKE xmdl_t.xmdl217, #結算類型
       xmdl218 LIKE xmdl_t.xmdl218, #結算方式
       xmdl219 LIKE xmdl_t.xmdl219, #交易類型
       xmdl220 LIKE xmdl_t.xmdl220, #寄銷已核銷數量
       xmdl222 LIKE xmdl_t.xmdl222, #地區編號
       xmdl223 LIKE xmdl_t.xmdl223, #縣市編號
       xmdl224 LIKE xmdl_t.xmdl224, #省區編號
       xmdl225 LIKE xmdl_t.xmdl225, #區域編號
       xmdl226 LIKE xmdl_t.xmdl226, #商品條碼
       xmdlunit LIKE xmdl_t.xmdlunit, #應用組織
       xmdlorga LIKE xmdl_t.xmdlorga, #帳務組織
       xmdl056 LIKE xmdl_t.xmdl056, #檢驗合格量
       xmdl094 LIKE xmdl_t.xmdl094, #來源單號(銷退)
       xmdl095 LIKE xmdl_t.xmdl095, #項次(銷退)
       xmdl227 LIKE xmdl_t.xmdl227, #現金折扣單號
       xmdl228 LIKE xmdl_t.xmdl228, #現金折扣單項次
       xmdl057 LIKE xmdl_t.xmdl057, #有效日期
       xmdl058 LIKE xmdl_t.xmdl058, #製造日期
       xmdl096 LIKE xmdl_t.xmdl096, #來源項次
       xmdl059 LIKE xmdl_t.xmdl059, #客戶退貨量
       xmdl060 LIKE xmdl_t.xmdl060  #放行狀態
       END RECORD

   #161128-00061#3-----modify--end----------
   DEFINE l_success     LIKE type_t.chr1
   DEFINE l_xrca001     LIKE xrca_t.xrca001
   DEFINE l_ooba002     LIKE ooba_t.ooba002
   DEFINE l_xrcadocno   LIKE xrca_t.xrcadocno
   DEFINE l_xrca        RECORD
          xrca005       LIKE xrca_t.xrca005,
          xrca006       LIKE xrca_t.xrca006,
          xrca007       LIKE xrca_t.xrca007,
          xrca008       LIKE xrca_t.xrca008,
          xrca009       LIKE xrca_t.xrca009,
          xrca010       LIKE xrca_t.xrca010,
          xrca011       LIKE xrca_t.xrca011,
          xrca012       LIKE xrca_t.xrca012,
          xrca013       LIKE xrca_t.xrca013,
          xrca014       LIKE xrca_t.xrca014,
          xrca015       LIKE xrca_t.xrca015,
          xrca046       LIKE xrca_t.xrca046,
          xrca058       LIKE xrca_t.xrca058,
          xrca061       LIKE xrca_t.xrca061,
          xrca100       LIKE xrca_t.xrca100,
          xrca101       LIKE xrca_t.xrca101,
          xrca121       LIKE xrca_t.xrca121,
          xrca131       LIKE xrca_t.xrca131
                        END RECORD
DEFINE r_xrca           RECORD
          xrca103          LIKE xrca_t.xrca103,
          xrca104          LIKE xrca_t.xrca104,
          xrca108          LIKE xrca_t.xrca108,
          xrca113          LIKE xrca_t.xrca113,
          xrca114          LIKE xrca_t.xrca114,
          xrca118          LIKE xrca_t.xrca118,
          xrca123          LIKE xrca_t.xrca123,
          xrca128          LIKE xrca_t.xrca124,
          xrca124          LIKE xrca_t.xrca128,
          xrca133          LIKE xrca_t.xrca133,
          xrca134          LIKE xrca_t.xrca134,
          xrca138          LIKE xrca_t.xrca138
                         END RECORD
   DEFINE l_oodbl004     LIKE oodbl_t.oodbl004
   DEFINE l_oodb011      LIKE oodb_t.oodb011
   DEFINE l_prog         LIKE gzza_t.gzza001
   DEFINE l_cnt          LIKE xrcb_t.xrcbseq   #151015-00006#1 Mod type_t.chr1 --> xrcb_t.xrcbseq
   DEFINE l_s            LIKE type_t.chr1
   DEFINE l_xrca034      LIKE xrca_t.xrca034
   DEFINE l_xrca035      LIKE xrca_t.xrca035
   DEFINE l_xrca036      LIKE xrca_t.xrca036
   DEFINE l_xrcb005      LIKE xrcb_t.xrcb005
   DEFINE l_xrcb103      LIKE xrcb_t.xrcb103
   DEFINE l_xrcb105      LIKE xrcb_t.xrcb105
   DEFINE l_oodb005      LIKE oodb_t.oodb005
   DEFINE l_xmdlnum      LIKE xmdl_t.xmdl038
   DEFINE l_xrcd009      LIKE xrcd_t.xrcd009
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_oodb006      LIKE oodb_t.oodb006
   DEFINE l_start_no     LIKE xrca_t.xrcadocno   #20150201  BY zhangwei
   DEFINE l_end_no       LIKE xrca_t.xrcadocno   #20150201  BY zhangwei
   DEFINE l_end_no_t     LIKE xrca_t.xrcadocno   #20150201  BY zhangwei
#   DEFINE l_amount       LIKE type_t.num5        #20150201  BY zhangwei    #170102-00002#1 mark
   DEFINE l_amount       LIKE xmdl_t.xmdl022                                #170102-00002#1 add
   DEFINE l_doc_success  LIKE type_t.num5        #20150201  BY zhangwei
   DEFINE l_tot_success  LIKE type_t.num5        #20150201  BY zhangwei
   DEFINE li_idx         LIKE type_t.num5        #20150201  BY zhangwei
   DEFINE l_xrcb002      LIKE xrcb_t.xrcb002     #20150201  BY zhangwei
   DEFINE l_xrcb003      LIKE xrcb_t.xrcb003     #20150201  BY zhangwei
   DEFINE l_xrcb007      LIKE xrcb_t.xrcb007     #20150201  BY zhangwei
   DEFINE l_dfin0030     LIKE type_t.chr1        #20150201  BY zhangwei  
   #151125-00006#1----add--s
   DEFINE  l_slip_success   LIKE type_t.num5
   DEFINE  l_conf_success   LIKE type_t.num5
   DEFINE  l_dfin0031       LIKE type_t.chr1
   DEFINE  l_dfin0032       LIKE type_t.chr1
   DEFINE  l_gl_slip        LIKE ooba_t.ooba002 
   #151125-00006#1----add--e
   #160906-00017#1 add--s
   DEFINE l_ooef016  LIKE ooef_t.ooef016  #主幣別編號
   DEFINE l_ooef017  LIKE ooef_t.ooef017  #所屬法人
   #160906-00017#1 add--e
   #151008-00009#8--s
   DEFINE ls_js             STRING
   DEFINE lc_param          RECORD
          xrcasite          LIKE xrca_t.xrcasite,     
          xrcald            LIKE xrca_t.xrcald,       
          xrcacomp          LIKE xrca_t.xrcacomp,     
          xrcadocno         LIKE xrca_t.xrcadocno,    
          xrcadocdt         LIKE xrca_t.xrcadocdt,    
          xrca001           LIKE xrca_t.xrca001,      
          xrca003           LIKE xrca_t.xrca003,      
          xrca004           LIKE xrca_t.xrca004,      
          xrca005           LIKE xrca_t.xrca005,      
          xrca058           LIKE xrca_t.xrca058,      
          xrca100           LIKE xrca_t.xrca100,      
          xrca101           LIKE xrca_t.xrca101,      
          xrca121           LIKE xrca_t.xrca121,      
          xrca131           LIKE xrca_t.xrca131,      
          xrcbseq           LIKE xrcb_t.xrcbseq,      
          xrcb002           LIKE xrcb_t.xrcb002,    
          xrcb003           LIKE xrcb_t.xrcb003,    
          xrcb004           LIKE xrcb_t.xrcb004,   
          xrcb008           LIKE xrcb_t.xrcb008,    
          xrcb009           LIKE xrcb_t.xrcb009,    
          xrcb010           LIKE xrcb_t.xrcb010,      
          xrcb011           LIKE xrcb_t.xrcb011,      
          xrcb012           LIKE xrcb_t.xrcb012,      
          xrcb015           LIKE xrcb_t.xrcb015,      
          xrcb016           LIKE xrcb_t.xrcb016,      
          xrcb021           LIKE xrcb_t.xrcb021,
          xrcb024           LIKE xrcb_t.xrcb024,      
          xrcb033           LIKE xrcb_t.xrcb033,      
          xrcb034           LIKE xrcb_t.xrcb034,      
          xrcb035           LIKE xrcb_t.xrcb035,      
          xrcb036           LIKE xrcb_t.xrcb036,      
          xrcb037           LIKE xrcb_t.xrcb037,      
          xrcb038           LIKE xrcb_t.xrcb038,      
          xrcb039           LIKE xrcb_t.xrcb039,      
          xrcb040           LIKE xrcb_t.xrcb040,      
          xrcb041           LIKE xrcb_t.xrcb041,      
          xrcb042           LIKE xrcb_t.xrcb042,      
          xrcb043           LIKE xrcb_t.xrcb043,      
          xrcb044           LIKE xrcb_t.xrcb044,      
          xrcb045           LIKE xrcb_t.xrcb045,      
          xrcb046           LIKE xrcb_t.xrcb046,      
          xrcb047           LIKE xrcb_t.xrcb047,      
          xrcb051           LIKE xrcb_t.xrcb051,      
          xrcb103           LIKE xrcb_t.xrcb103,      
          xrcb113           LIKE xrcb_t.xrcb113,      
          xrcb123           LIKE xrcb_t.xrcb123,      
          xrcb133           LIKE xrcb_t.xrcb133,
          type1             LIKE type_t.chr1       #異動類型(xreq003)          
                        END RECORD
   #151008-00009#8--e  
   DEFINE l_xrcb103_sum      LIKE xrcb_t.xrcb103  #170711-00047#1---add
   DEFINE l_xmdk082          LIKE xmdk_t.xmdk082  #180326-00027#1--add
   #180416-00030#1 add-s
   DEFINE l_round_type  LIKE ooaa_t.ooaa002 
   DEFINE l_ooaj003     LIKE ooaj_t.ooaj003   
   DEFINE l_ooaj004     LIKE ooaj_t.ooaj004  
   DEFINE l_ooaj005     LIKE ooaj_t.ooaj005  
   DEFINE l_ooaj006     LIKE ooaj_t.ooaj006  
   DEFINE l_ooaj007     LIKE ooaj_t.ooaj007  
   #180416-00030#1 add-e
   DEFINE l_xrcacomp    LIKE xrca_t.xrcacomp #180928-00002#1 add
   DEFINE l_xmdk031     LIKE xmdk_t.xmdk031  #180928-00002#1 add 
   DEFINE l_date        LIKE xrca_t.xrcadocdt #180727-00024#2 add
   #180705-00083#3 add -s
   DEFINE l_xrcb        RECORD
       xrcb053          LIKE xrcb_t.xrcb053,
       xrcb054          LIKE xrcb_t.xrcb054,
       xrcb051          LIKE xrcb_t.xrcb051,
       xrcb010          LIKE xrcb_t.xrcb010,
       xrcb011          LIKE xrcb_t.xrcb011,
       xrcb024          LIKE xrcb_t.xrcb024,
       xrcb036          LIKE xrcb_t.xrcb036,
       xrcb012          LIKE xrcb_t.xrcb012,
       xrcb033          LIKE xrcb_t.xrcb033,
       xrcb034          LIKE xrcb_t.xrcb034,
       xrcb035          LIKE xrcb_t.xrcb035,
       xrcb015          LIKE xrcb_t.xrcb015,
       xrcb016          LIKE xrcb_t.xrcb016
                        END RECORD
   DEFINE l_xrcb2       RECORD
       xrcb037          LIKE xrcb_t.xrcb037, 
       xrcb038          LIKE xrcb_t.xrcb038,
       xrcb039          LIKE xrcb_t.xrcb039, 
       xrcb040          LIKE xrcb_t.xrcb040,
       xrcb041          LIKE xrcb_t.xrcb041, 
       xrcb042          LIKE xrcb_t.xrcb042,
       xrcb043          LIKE xrcb_t.xrcb043, 
       xrcb044          LIKE xrcb_t.xrcb044,
       xrcb045          LIKE xrcb_t.xrcb045,     
       xrcb046          LIKE xrcb_t.xrcb046            
                        END RECORD 
   #180705-00083#3 add -e
   DEFINE l_pmaa004       LIKE pmaa_t.pmaa004  #181227-00033#1 add
   DEFINE l_num           LIKE xrcb_t.xrcb007  #180821-00038#10 add
   DEFINE l_isag103_sum   LIKE isag_t.isag103  #180821-00038#10 add
   DEFINE l_imaf111       LIKE imaf_t.imaf111  #190812-00010#5 add 
   DEFINE l_kind          STRING #190812-00010#5 add 
   DEFINE l_type          LIKE type_t.chr5     #190305-00001#3 add
   DEFINE l_xrcb035       LIKE xrcb_t.xrcb035  #191030-00020#1 add
   DEFINE l_imaa004       LIKE imaa_t.imaa004 #200317-00037#1 add
   #190318-00028#1   add-S
   DEFINE l_oobl002       LIKE oobl_t.oobl002  #单别对应的作业编号
   DEFINE l_gzzz002       LIKE gzzz_t.gzzz002  #作业对应的程式编号
   DEFINE l_success_1     LIKE type_t.num5     
   #190318-00028#1   add-E
   DEFINE l_glab005       LIKE glab_t.glab005  #201023-00028#22 add
 
   
   #STEP1.依照匯總條件將出貨單資料匯總、排序
   #STEP2.將資料插入xrca_t
   #STEP3.將出貨單資料插入xrcb_t、xrcd_t
   #STEP4.将单身金额回写至单头
   #STEP5.產生多帳期資料
   
   CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s
  #20150201#1 By zhangwei Mark ---(S)---
  #CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-1002') RETURNING l_flag
  #
  #CASE
  #   WHEN g_master.b_comb2 = '1'
  #      LET l_str   = "xmdldocno"
  #      LET l_orders= "xmdldocno"
  #   WHEN g_master.b_comb2 = '2'
  #      LET l_str   = "xmdk007||xmdk008||xmdk016"
  #      LET l_orders= "xmdk007,xmdk008,xmdk016"
  #      IF cl_null(g_master.xrca008) AND l_flag != '3' THEN
  #         LET l_str   = l_str,   "||xmdk010"
  #         LET l_orders= l_orders,",xmdk010"
  #      END IF
  #      IF g_master.b_comb1 = '1' THEN
  #         LET l_str   = l_str,   "||xmdk017"
  #         LET l_orders= l_orders,",xmdk017"
  #      END IF
  #   WHEN g_master.b_comb2 = '3'
  #      LET l_str   = "xmdk007||xmdk008||xmdk016||xmdk003"
  #      LET l_orders= "xmdk007,xmdk008,xmdk016,xmdk003"
  #      IF cl_null(g_master.xrca008) AND l_flag != '3' THEN
  #         LET l_str   = l_str,   "||xmdk010"
  #         LET l_orders= l_orders,",xmdk010"
  #      END IF
  #     IF g_master.b_comb1 = '1' THEN
  #        LET l_str   = l_str,   "||xmdk017"
  #        LET l_orders= l_orders,",xmdk017"
  #     END IF
  #   WHEN g_master.b_comb2 = '4'
  #      LET l_str   = "xmdk007||xmdk008||xmdk016||xmdk004"
  #      LET l_orders= "xmdk007,xmdk008,xmdk016,xmdk004"
  #      IF cl_null(g_master.xrca008) AND l_flag != '3' THEN
  #         LET l_str   = l_str,   "||xmdk010"
  #         LET l_orders= l_orders,",xmdk010"
  #      END IF
  #      IF g_master.b_comb1 = '1' THEN
  #         LET l_str   = l_str,   "||xmdk017"
  #         LET l_orders= l_orders,",xmdk017"
  #      END IF
  #END CASE
  #LET l_str = l_str,"||CASE WHEN xmdk000 = 6 THEN 2 ELSE 1 END"
  #LET l_orders= l_orders,",CASE WHEN xmdk000 = 6 THEN 2 ELSE 1 END"
  #
  #LET l_sql = "SELECT ",l_str,",xmdldocno,xmdlseq,xrcb007 FROM axrp131_tmp01",
  #            " ORDER BY ",l_orders
  #PREPARE axrp130_ar_prep FROM l_sql
  #DECLARE axrp130_ar_curs CURSOR FOR axrp130_ar_prep
  #20150201#1 By zhangwei Mark ---(E)---

   #20150201#1   By zhangwei Add ---(S)---
   CALL s_fin_get_doc_para(g_master.xrcald,g_glaa.glaacomp,g_master.xrcadocno,'D-FIN-0030') RETURNING l_dfin0030
   LET l_sql = "SELECT xmdkdocno,xmdkent FROM xmdk_t WHERE xmdkent = ? AND xmdkdocno = ? FOR UPDATE"
   LET l_sql = cl_sql_forupd(l_sql)                #轉換不同資料庫語法
   LET l_sql = cl_sql_add_mask(l_sql)              #遮蔽特定資料
   DECLARE axrp131_cl CURSOR FROM l_sql            # LOCK CURSOR

   CASE
      WHEN l_s = 1
       LET l_sql = "SELECT xmdl022 - xmdl038 - xmdl053 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"' AND xmdldocno = ? AND xmdlseq = ?"   #160920-00011#1 Add xmdl047   #161102-00034#1 Del xmdl047
      WHEN l_s = 2
       LET l_sql = "SELECT xmdl022 - xmdl039 - xmdl054 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"' AND xmdldocno = ? AND xmdlseq = ?"   #160920-00011#1 Add xmdl047   #161102-00034#1 Del xmdl047
      WHEN l_s = 3
       LET l_sql = "SELECT xmdl022 - xmdl040 - xmdl055 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"' AND xmdldocno = ? AND xmdlseq = ?"   #160920-00011#1 Add xmdl047   #161102-00034#1 Del xmdl047
   END CASE
   PREPARE axrp131_amount FROM l_sql

   LET l_sql = "SELECT xrcb002,xrcb003,xrcb007 FROM xrcb_t WHERE xrcbent = '",g_enterprise,"' AND xrcbld = '",g_master.xrcald,"' AND xrcbdocno = ?"
   PREPARE axrp131_bak_prep FROM l_sql
   DECLARE axrp131_bak_curs CURSOR FOR axrp131_bak_prep

   #20150201#1   By zhangwei Add ---(E)---
   
   #170413-00024#1 add s--- 
   LET l_sql = " SELECT xmda003,xmda002 FROM xmda_t WHERE xmdaent = ",g_enterprise," AND xmdadocno = ?"
   PREPARE axrp131_xmda_prep FROM l_sql
   #170413-00024#1 add e---
   
   #180827-00015#1 add s---
   LET l_sql = " SELECT xmda033 FROM xmda_t WHERE xmdaent = ",g_enterprise," AND xmdadocno = ?"
   PREPARE axrp131_xmda_prep2 FROM l_sql   
   #180827-00015#1 add e---   
   
   #200317-00037#1 add s---
   LET l_sql = " SELECT imaa004 ",
               "   FROM imaa_t ",
               "  WHERE imaaent = ",g_enterprise," ",
               "    AND imaa001=? "
   PREPARE selimaa_p FROM l_sql   
   #200317-00037#1 add e---   

  #LET g_success = 'Y'   #20150201#1 By zhangwei Mark
   LET l_doc_success = TRUE   #20150201#1 By zhangwei Add
   LET l_tot_success = TRUE   #20150201#1 By zhangwei Add
   LET l_start_no = NULL   #20150201#1 By zhangwei Add
   LET l_end_no = NULL   #20150201#1 By zhangwei Add
   INITIALIZE g_xrca TO NULL
   INITIALIZE g_xrcb TO NULL

  #20150201#1 By zhangwei Mark ---(S)---
  #FOREACH axrp131_ar_curs INTO l_order,l_xmdldocno,l_xmdlseq,l_xrcb007
  #   IF SQLCA.sqlcode THEN
  #      INITIALIZE g_errparam TO NULL
  #      LET g_errparam.extend = 'foreach:'
  #      LET g_errparam.code   = SQLCA.sqlcode
  #      LET g_errparam.popup  = TRUE
  #      CALL cl_err()
  #      LET g_success = 'N'
  #      EXIT FOREACH
  #   END IF
  #20150201#1 By zhangwei Mark ---(E)---
  
      #20150201#1   By zhangwei Add ---(S)---
   FOR li_idx = 1 TO g_xmdk_d.getLength()

      CALL s_transaction_begin()  #每一筆資料單獨走一次事物

      OPEN axrp131_cl USING g_enterprise,g_xmdk_d[li_idx].xmdldocno
      IF STATUS THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "OPEN xmdk_cl:"   #20150201 ~~~
         LET g_errparam.code   =  STATUS 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()

         CLOSE axrp131_cl
         CALL s_transaction_end('N','0')
         CONTINUE FOR
      END IF

      LET l_amount = 0
      EXECUTE axrp131_amount USING g_xmdk_d[li_idx].xmdldocno,g_xmdk_d[li_idx].xmdlseq INTO l_amount
      IF cl_null(l_amount) THEN LET l_amount = 0 END IF
      IF l_amount = 0 THEN
         LET g_errparam.extend = "OPEN xmdk_cl:"   #20150201 ~~~
         LET g_errparam.code   =  STATUS 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()

         CALL s_transaction_end('N','0')
         CONTINUE FOR
      END IF
      #20150201#1   By zhangwei Add ---(S)---
      #161128-00061#3-----modify--begin----------
      #SELECT * INTO l_xmdk.* 
      SELECT xmdkent,xmdksite,xmdkunit,xmdkdocno,xmdkdocdt,xmdk000,xmdk001,xmdk002,xmdk003,xmdk004,
             xmdk005,xmdk006,xmdk007,xmdk008,xmdk009,xmdk010,xmdk011,xmdk012,xmdk013,xmdk014,xmdk015,
             xmdk016,xmdk017,xmdk018,xmdk019,xmdk020,xmdk021,xmdk022,xmdk023,xmdk024,xmdk025,xmdk026,
             xmdk027,xmdk028,xmdk029,xmdk030,xmdk031,xmdk032,xmdk033,xmdk034,xmdk035,xmdk036,xmdk037,
             xmdk038,xmdk039,xmdk040,xmdk041,xmdk042,xmdk043,xmdk044,xmdk045,xmdk051,xmdk052,xmdk053,
             xmdk054,xmdk055,xmdk081,xmdk082,xmdk083,xmdk084,xmdk200,xmdk201,xmdk202,xmdk203,xmdk204,
             xmdk205,xmdk206,xmdk207,xmdk208,xmdk209,xmdk210,xmdk211,xmdk212,xmdk213,xmdk214,xmdkownid,
             xmdkowndp,xmdkcrtid,xmdkcrtdp,xmdkcrtdt,xmdkmodid,xmdkmoddt,xmdkcnfid,xmdkcnfdt,xmdkpstid,
             xmdkpstdt,xmdkstus,xmdk085,xmdk086,xmdk046,xmdk087,xmdk047,xmdk088,xmdk089 INTO l_xmdk.* 
      #161128-00061#3-----modify--end----------
      FROM xmdk_t WHERE xmdkent = g_enterprise AND xmdkdocno = g_xmdk_d[li_idx].xmdldocno
      #161128-00061#3-----modify--begin----------
      #SELECT * INTO l_xmdl.* 
      SELECT xmdlent,xmdlsite,xmdldocno,xmdlseq,xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,
             xmdl006,xmdl007,xmdl008,xmdl009,xmdl010,xmdl011,xmdl012,xmdl013,xmdl014,xmdl015,
             xmdl016,xmdl017,xmdl018,xmdl019,xmdl020,xmdl021,xmdl022,xmdl023,xmdl024,xmdl025,
             xmdl026,xmdl027,xmdl028,xmdl029,xmdl030,xmdl031,xmdl032,xmdl033,xmdl034,xmdl035,
             xmdl036,xmdl037,xmdl038,xmdl039,xmdl040,xmdl041,xmdl042,xmdl043,xmdl044,xmdl045,
             xmdl046,xmdl047,xmdl048,xmdl049,xmdl050,xmdl051,xmdl052,xmdl053,xmdl054,xmdl055,
             xmdl081,xmdl082,xmdl083,xmdl084,xmdl085,xmdl086,xmdl087,xmdl088,xmdl089,xmdl090,
             xmdl091,xmdl092,xmdl093,xmdl200,xmdl201,xmdl202,xmdl203,xmdl204,xmdl205,xmdl206,
             xmdl207,xmdl208,xmdl209,xmdl210,xmdl211,xmdl212,xmdl213,xmdl214,xmdl215,xmdl216,
             xmdl217,xmdl218,xmdl219,xmdl220,xmdl222,xmdl223,xmdl224,xmdl225,xmdl226,xmdlunit,
             xmdlorga,xmdl056,xmdl094,xmdl095,xmdl227,xmdl228,xmdl057,xmdl058,xmdl096,xmdl059,xmdl060 INTO l_xmdl.*
      #161128-00061#3-----modify--end----------      
      FROM xmdl_t WHERE xmdlent = g_enterprise AND xmdldocno = g_xmdk_d[li_idx].xmdldocno AND xmdlseq = g_xmdk_d[li_idx].xmdlseq

     #--170421-00052#1 mark start--
     #IF g_master.b_comb2 = '1' AND cl_null(g_master.xrcadocdt) THEN
     #   LET g_master.xrcadocdt = l_xmdk.xmdkdocdt
     #END IF
     #--170421-00052#1 mark end--
     
     #171205-00006#1 -s 171212 mark by 08172
#     #--170421-00052#1 add start--
#      IF g_master.b_comb2 = '1' THEN
#         LET g_master.xrcadocdt = l_xmdk.xmdkdocdt
#      END IF
#     #--170421-00052#1 add end--
     #171205-00006#1 -e 171212 mark by 08172
     
      #180727-00024#2 add-s
      IF cl_null(g_master.xrcadocdt) THEN
         #180928-00039#1 add-s
         IF g_master.xmdk042='2' AND l_xmdk.xmdk000<>'6' THEN  #外销出货 日期给结关日期
            LET l_date= l_xmdk.xmdk032 
         ELSE
         #180928-00039#1 add-e
            LET l_date= l_xmdk.xmdk001  
         END IF #180928-00039#1 ADD
      ELSE
         LET l_date= g_master.xrcadocdt
      END IF
      #180727-00024#2 add-e     
      
      #200716-00011#1 add(s)      
      LET l_oodb011 = ''
      IF NOT cl_null(g_master.xrca011) THEN
         CALL s_tax_chk(g_glaa.glaacomp,g_master.xrca011)
              RETURNING l_success,l_oodbl004,l_xrca.xrca013,l_xrca.xrca012,l_oodb011     
         IF l_oodb011 = '1' AND g_master.xrca011 <> g_xrca.xrca011 THEN
            LET l_order_t = l_order_t,g_master.xrca011
         END IF
      ELSE
         CALL s_tax_chk(g_glaa.glaacomp,l_xmdk.xmdk012)
              RETURNING l_success,l_oodbl004,l_xrca.xrca013,l_xrca.xrca012,l_oodb011
         IF l_oodb011 = '1' AND l_xmdk.xmdk012 <> g_xrca.xrca011 THEN
            LET l_order_t = l_order_t,l_xmdk.xmdk012
         END IF
      END IF
      #200716-00011#1 add(e)
      
      IF cl_null(l_order_t) OR l_order_t <> g_xmdk_d[li_idx].order THEN
         #CALL s_aooi200_fin_gen_docno(g_master.xrcald,g_glaa.glaa024,g_glaa.glaa003,g_master.xrcadocno,g_master.xrcadocdt,'axrt320') #180727-00024#2 mark
         CALL s_aooi200_fin_gen_docno(g_master.xrcald,g_glaa.glaa024,g_glaa.glaa003,g_master.xrcadocno,l_date,'axrt320') #180727-00024#2 add            
            RETURNING l_success,l_xrcadocno
            IF l_success = FALSE OR l_success = 'N' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = g_master.xrcadocno
               LET g_errparam.code   = 'aap-00187'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
              #LET g_success = 'N'         #20150201#1 By zhangwei Mark
               LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
            END IF
         IF l_xmdk.xmdk000 = 6 THEN
            LET l_prog = '21'
            LET l_xrca001 = '02'
         ELSE
            LET l_prog = '11'
            LET l_xrca001 = '01'
         END IF

         IF NOT cl_null(g_xrca.xrcadocno) THEN   #前一筆應收單據單身完全產生,繼續產生直接沖帳、多帳期，回寫應收單據單頭金額
            SELECT ABS(SUM(xrcb103 * xrcb022)),ABS(SUM(xrcb104 * xrcb022)),ABS(SUM(xrcb113 * xrcb022)),ABS(SUM(xrcb114 * xrcb022)),
                   ABS(SUM(xrcb123 * xrcb022)),ABS(SUM(xrcb124 * xrcb022)),ABS(SUM(xrcb133 * xrcb022)),ABS(SUM(xrcb134 * xrcb022))  
              INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114, 
                   g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134     
              FROM xrcb_t
             WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald AND xrcbdocno = g_xrca.xrcadocno
            IF cl_null(g_xrca.xrca103) THEN LET g_xrca.xrca103 = 0 END IF 
            IF cl_null(g_xrca.xrca104) THEN LET g_xrca.xrca104 = 0 END IF 
            IF cl_null(g_xrca.xrca113) THEN LET g_xrca.xrca113 = 0 END IF 
            IF cl_null(g_xrca.xrca114) THEN LET g_xrca.xrca114 = 0 END IF
            IF cl_null(g_xrca.xrca123) THEN LET g_xrca.xrca123 = 0 END IF 
            IF cl_null(g_xrca.xrca124) THEN LET g_xrca.xrca124 = 0 END IF
            IF cl_null(g_xrca.xrca133) THEN LET g_xrca.xrca133 = 0 END IF 
            IF cl_null(g_xrca.xrca134) THEN LET g_xrca.xrca134 = 0 END IF
            UPDATE xrca_t SET (xrca103,xrca104,xrca113,xrca114,xrca123,xrca124,xrca133,xrca134) = (g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134) 
             WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
            SELECT COUNT(DISTINCT xrcb002) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise
               AND xrcbdocno = g_xrca.xrcadocno AND xrcbld = g_xrca.xrcald
            IF l_count > 1 THEN
               UPDATE xrca_t SET xrca018 = ''
                WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
            END IF

            #產生多帳期
            CALL s_axrt300_installments(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_success
            IF l_success = FALSE OR l_success = 'N' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = g_master.xrcadocno
               LET g_errparam.code   = 'aap-00092'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
              #LET g_success = 'N'         #20150201#1 By zhangwei Mark
               LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
            END IF
            
            #171018-00034#1----add--end
            IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' THEN
               CALL s_pre_voucher_ins('AR','R10',g_xrca.xrcald,g_xrca.xrcadocno,g_xrca.xrcadocdt,'1') RETURNING l_success
               IF NOT l_success THEN
                  LET l_doc_success = FALSE
               END IF
            END IF
            #171018-00034#1----add--str
            
            #立即審核
         END IF

         INITIALIZE g_xrca TO NULL
         INITIALIZE g_xrcb TO NULL #171204-00010#1 add By 10043 
         
         LET g_xrca.xrcaent   = g_enterprise
         LET g_xrca.xrcaownid = g_user
         LET g_xrca.xrcaowndp = g_dept
         LET g_xrca.xrcacrtid = g_user
         LET g_xrca.xrcacrtdp = g_dept
         #LET g_xrca.xrcacrtdt = g_today           #170901-00012#1   2017/12/06 By 09773 mark
         LET g_xrca.xrcacrtdt = cl_get_current()   #170901-00012#1   2017/12/06 By 09773 mod
         LET g_xrca.xrcastus  = 'N'
         LET g_xrca.xrcacomp  = g_glaa.glaacomp
         LET g_xrca.xrcald    = g_master.xrcald
         LET g_xrca.xrcadocno = l_xrcadocno
         #LET g_xrca.xrcadocdt = g_master.xrcadocdt   #180727-00024#2 mark 
         LET g_xrca.xrcadocdt = l_date   #180727-00024#2 add
         LET g_xrca.xrca001   = l_xrca001
         LET g_xrca.xrcasite  = g_master.xrcasite
         LET g_xrca.xrca003   = g_user
#         LET g_xrca.xrca004   = l_xmdk.xmdk008  #200415-00064#6 mark
         LET g_xrca.xrca004   = l_xmdk.xmdk007  #200415-00064#6 add
         CALL axrp131_xrca004_ref(l_xmdk.xmdk016) RETURNING l_xrca.*
#         LET g_xrca.xrca005   = l_xrca.xrca005  #200415-00064#6 mark
         LET g_xrca.xrca005   = l_xmdk.xmdk008  #200415-00064#6 add
         LET g_xrca.xrca006   = l_xrca.xrca006
         IF NOT cl_null(g_master.xrca007) THEN
            LET g_xrca.xrca007 = g_master.xrca007
         ELSE
            #170426-00060#1 add s---  
            #账款类别取值顺序：單別默認 > 來源單 >對象設定檔  
            CALL s_aooi200_fin_get_doc_default(g_master.xrcasite,'2',g_master.xrcadocno,'xrca007',g_xrca.xrca007,g_master.xrcald) RETURNING g_xrca.xrca007                                                   
            #单别抓取不到预设时，取来源单
            IF cl_null(g_xrca.xrca007) THEN            
               LET g_xrca.xrca007   = l_xrca.xrca007
            END IF 
            #170426-00060#1 add e---
            #LET g_xrca.xrca007   = l_xrca.xrca007 #170426-00060#1 mark
         END IF

         SELECT glab005 INTO l_xrca035 FROM glab_t 
          WHERE glabld = g_master.xrcald 
            AND glabent = g_enterprise
            AND glab002 = g_xrca.xrca007   # 帳款類別
            AND glab001 = '13'             # 應收帳務類型科目設定
            AND glab003 = '8304_02'
#        #180326-00027#1----mark---str
#         SELECT glab005 INTO l_xrca036 FROM glab_t 
#          WHERE glabld = g_master.xrcald 
#            AND glabent = g_enterprise
#            AND glab002 = g_xrca.xrca007   # 帳款類別
#            AND glab001 = '13'             # 應收帳務類型科目設定
#            AND glab003 = '8304_21'   #160816-00014#1 Mod 8304_28 ---> 8304_21
#         #180326-00027#1----mark---end   
         #180326-00027#1----add---str
         IF g_xrca.xrca001 = '02' AND l_prog = '21'  THEN
           SELECT xmdk082 INTO l_xmdk082
             FROM xmdk_t
            WHERE xmdkent = g_enterprise
              AND xmdkdocno = l_xmdl.xmdldocno
           IF l_xmdk082 = '4' THEN
              SELECT glab005 INTO l_xrca036 FROM glab_t 
               WHERE glabld = g_master.xrcald 
                 AND glabent = g_enterprise
                 AND glab002 = g_xrca.xrca007   # 帳款類別
                 AND glab001 = '13'             # 應收帳務類型科目設定
                 AND glab003 = '8304_05'   
           ELSE
              SELECT glab005 INTO l_xrca036 FROM glab_t 
               WHERE glabld = g_master.xrcald 
                 AND glabent = g_enterprise
                 AND glab002 = g_xrca.xrca007   # 帳款類別
                 AND glab001 = '13'             # 應收帳務類型科目設定
                 AND glab003 = '8304_04'      
           END IF      
         ELSE
            SELECT glab005 INTO l_xrca036 FROM glab_t 
             WHERE glabld = g_master.xrcald 
               AND glabent = g_enterprise
               AND glab002 = g_xrca.xrca007   # 帳款類別
               AND glab001 = '13'             # 應收帳務類型科目設定
               AND glab003 = '8304_21'   
         END IF
         #180326-00027#1----add---str 
         SELECT glab005 INTO l_xrcd009 FROM glab_t 
          WHERE glabld = g_master.xrcald 
            AND glabent = g_enterprise
            AND glab002 = g_xrca.xrca007   # 帳款類別
            AND glab001 = '13'             # 應收帳務類型科目設定
            AND glab003 = '8304_03'   #160816-00014#1 Mod 8304_27 ---> 8304_03

         SELECT ooeg004 INTO l_xrca034 FROM ooeg_t WHERE ooegent = g_enterprise AND ooeg001 = l_xrca.xrca015  

         IF NOT cl_null(g_master.xrca008) THEN
            LET g_xrca.xrca008 = g_master.xrca008
         ELSE
            #170426-00060#1 add s---    
            CALL s_aooi200_fin_get_doc_default(g_master.xrcasite,'2',g_master.xrcadocno,'xrca008',g_xrca.xrca008,g_master.xrcald) RETURNING g_xrca.xrca008                                                   
            #单别抓取不到预设时，取来源单
            IF cl_null(g_xrca.xrca008) THEN            
               LET g_xrca.xrca008   = l_xmdk.xmdk010
            END IF 
            #170426-00060#1 add e---   
            #LET g_xrca.xrca008 = l_xmdk.xmdk010  #170426-00060#1 mark
         END IF

         #應收日期/票據到期日
         #160921-00018#1 Mark ---(S)---
        #CALL s_fin_date_ar_receivable(g_xrca.xrcasite,g_xrca.xrca004,g_xrca.xrca008,g_xrca.xrcadocdt,
        #  g_xrca.xrcadocdt,g_xrca.xrcadocdt,'') RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010
         #160921-00018#1 Mark ---(E)---
         #160921-00018#1 Add  ---(S)---
         CALL s_fin_date_ar_receivable(g_xrca.xrcasite,g_xrca.xrca004,g_xrca.xrca008,l_xmdk.xmdkdocdt,
           g_xrca.xrcadocdt,g_xrca.xrcadocdt,l_xmdk.xmdk001) RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010
         #160921-00018#1 Add  ---(E)---
   
         LET g_xrca.xrca011 = l_xmdk.xmdk012
         IF NOT cl_null(g_master.xrca011) THEN
            LET g_xrca.xrca011 = g_master.xrca011
         END IF

         CALL s_tax_chk(g_glaa.glaacomp,g_xrca.xrca011)
            RETURNING l_success,l_oodbl004,l_xrca.xrca013,l_xrca.xrca012,l_oodb011
       # IF l_success = 'N' THEN LET g_success = 'N' END IF
         LET g_xrca.xrca012   = l_xrca.xrca012
         LET g_xrca.xrca013   = l_xrca.xrca013
         LET g_xrca.xrca014   = l_xmdk.xmdk003
         LET g_xrca.xrca015   = l_xmdk.xmdk004
         LET g_xrca.xrca016   = l_prog
         LET g_xrca.xrca017   = 0
         LET g_xrca.xrca018   = l_xmdk.xmdkdocno
         LET g_xrca.xrca019   = ''
         LET g_xrca.xrca020   = 'N'
         LET g_xrca.xrca021   = ''
         LET g_xrca.xrca022   = ''
#         LET g_xrca.xrca023   = ''  #200415-00064#6 mark
         LET g_xrca.xrca023   = l_xmdk.xmdk202  #200415-00064#6 add
         LET g_xrca.xrca024   = ''
         LET g_xrca.xrca025   = ''
         LET g_xrca.xrca026   = ''
         LET g_xrca.xrca028   = ''
         LET g_xrca.xrca029   = ''
         LET g_xrca.xrca030   = 0
         LET g_xrca.xrca031   = 0
         LET g_xrca.xrca032   = 0
         LET g_xrca.xrca033   = ''
         LET g_xrca.xrca034   = l_xrca034
         LET g_xrca.xrca035   = l_xrca035
         LET g_xrca.xrca036   = l_xrca036
         CALL s_aooi200_fin_get_slip(g_master.xrcadocno) RETURNING l_success,l_ooba002
         CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0030') RETURNING g_xrca.xrca037
         IF cl_null(g_xrca.xrca037) THEN LET g_xrca.xrca037   = 'N' END IF
         LET g_xrca.xrca038   = ''
         LET g_xrca.xrca039   = 0
         LET g_xrca.xrca040   = 'N'
         LET g_xrca.xrca041   = ''
         LET g_xrca.xrca042   = ''
         LET g_xrca.xrca043   = ''
         LET g_xrca.xrca044   = 0
         LET g_xrca.xrca045   = ''
         LET g_xrca.xrca046   = l_xrca.xrca046
         LET g_xrca.xrca047   = ''
         LET g_xrca.xrca048   = ''
         LET g_xrca.xrca049   = ''
         LET g_xrca.xrca050   = ''
         LET g_xrca.xrca051   = ''
         LET g_xrca.xrca052   = 0
         LET g_xrca.xrca053   = ''
         LET g_xrca.xrca054   = ''
         LET g_xrca.xrca055   = ''
         LET g_xrca.xrca056   = ''
         #LET g_xrca.xrca057   = g_xmdk_d[li_idx].xmdk047 #160802-00007#1 Mod  #181227-00033#1 mark
         #181227-00033#1 add-s
         LET l_pmaa004=''
         SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t 
          WHERE pmaaent=g_enterprise AND pmaa001=g_xrca.xrca004
         IF l_pmaa004='2' OR l_pmaa004='4' THEN
            LET g_xrca.xrca057   = g_xmdk_d[li_idx].xmdk047
         ELSE 
            LET g_xrca.xrca057   = g_xrca.xrca004        
         END IF 
         #181227-00033#1 add-e
         #180928-00002#1 mod s---#帳款單頭銷售分類由對象預設的銷售分類帶入
         #LET g_xrca.xrca058   = l_xrca.xrca058
         #检查是否抛转据点，若没则抓取pmabsite=ALL的相关栏位资料
         LET l_cnt = 0
         LET l_xrcacomp = NULL
         SELECT COUNT(*) INTO l_cnt FROM pmab_t WHERE pmabent = g_enterprise AND pmabsite = g_xrca.xrcacomp AND pmab001 = g_xrca.xrca004
         IF l_cnt = 0 THEN 
            LET l_xrcacomp = "ALL" 
         ELSE
            LET l_xrcacomp = g_xrca.xrcacomp   
         END IF        
         SELECT pmab089 INTO g_xrca.xrca058 FROM pmab_t
          WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004          
         #180928-00002#1 mod e---
         LET g_xrca.xrca059   = ''
         LET g_xrca.xrca060   = 1
         LET g_xrca.xrca061   = l_xrca.xrca061
         LET g_xrca.xrca062   = '1'
         LET g_xrca.xrca063   = ''
         LET g_xrca.xrca100   = l_xmdk.xmdk016
         IF g_master.b_comb1 = 1 THEN
            LET g_xrca.xrca101 = l_xmdk.xmdk017
         ELSE
            LET g_xrca.xrca101 = l_xrca.xrca101
         END IF
         LET g_xrca.xrca103   = 0
         LET g_xrca.xrca104   = 0
         LET g_xrca.xrca106   = 0
         LET g_xrca.xrca107   = 0
         LET g_xrca.xrca108   = 0
         LET g_xrca.xrca113   = 0
         LET g_xrca.xrca114   = 0
         LET g_xrca.xrca116   = 0
         LET g_xrca.xrca117   = 0
         LET g_xrca.xrca118   = 0
         LET g_xrca.xrca120   = g_glaa.glaa016
         LET g_xrca.xrca121   = l_xrca.xrca121
         LET g_xrca.xrca123   = 0
         LET g_xrca.xrca124   = 0
         LET g_xrca.xrca126   = 0
         LET g_xrca.xrca127   = 0
         LET g_xrca.xrca128   = 0
         LET g_xrca.xrca130   = g_glaa.glaa020
         LET g_xrca.xrca131   = l_xrca.xrca131
         LET g_xrca.xrca133   = 0
         LET g_xrca.xrca134   = 0
         LET g_xrca.xrca136   = 0
         LET g_xrca.xrca137   = 0
         LET g_xrca.xrca138   = 0
         
         #161128-00061#3-----modify--begin----------
         #INSERT INTO xrca_t VALUES (g_xrca.*)
         INSERT INTO xrca_t (xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,xrcamodid,xrcamoddt,
                             xrcacnfid,xrcacnfdt,xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,xrcadocno,
                             xrcadocdt,xrca001,xrcasite,xrca003,xrca004,xrca005,xrca006,xrca007,xrca008,
                             xrca009,xrca010,xrca011,xrca012,xrca013,xrca014,xrca015,xrca016,xrca017,
                             xrca018,xrca019,xrca020,xrca021,xrca022,xrca023,xrca024,xrca025,xrca026,
                             xrca028,xrca029,xrca030,xrca031,xrca032,xrca033,xrca034,xrca035,xrca036,
                             xrca037,xrca038,xrca039,xrca040,xrca041,xrca042,xrca043,xrca044,xrca045,
                             xrca046,xrca047,xrca048,xrca049,xrca050,xrca051,xrca052,xrca053,xrca054,
                             xrca055,xrca056,xrca057,xrca058,xrca059,xrca060,xrca061,xrca062,xrca063,
                             xrca064,xrca065,xrca066,xrca100,xrca101,xrca103,xrca104,xrca106,xrca107,
                             xrca108,xrca113,xrca114,xrca116,xrca117,xrca118,xrca120,xrca121,xrca123,
                             xrca124,xrca126,xrca127,xrca128,xrca130,xrca131,xrca133,xrca134,xrca136,
                             xrca137,xrca138)
          VALUES (g_xrca.xrcaent,g_xrca.xrcaownid,g_xrca.xrcaowndp,g_xrca.xrcacrtid,g_xrca.xrcacrtdp,g_xrca.xrcacrtdt,g_xrca.xrcamodid,g_xrca.xrcamoddt,
                  g_xrca.xrcacnfid,g_xrca.xrcacnfdt,g_xrca.xrcapstid,g_xrca.xrcapstdt,g_xrca.xrcastus,g_xrca.xrcacomp,g_xrca.xrcald,g_xrca.xrcadocno,
                  g_xrca.xrcadocdt,g_xrca.xrca001,g_xrca.xrcasite,g_xrca.xrca003,g_xrca.xrca004,g_xrca.xrca005,g_xrca.xrca006,g_xrca.xrca007,g_xrca.xrca008,
                  g_xrca.xrca009,g_xrca.xrca010,g_xrca.xrca011,g_xrca.xrca012,g_xrca.xrca013,g_xrca.xrca014,g_xrca.xrca015,g_xrca.xrca016,g_xrca.xrca017,
                  g_xrca.xrca018,g_xrca.xrca019,g_xrca.xrca020,g_xrca.xrca021,g_xrca.xrca022,g_xrca.xrca023,g_xrca.xrca024,g_xrca.xrca025,g_xrca.xrca026,
                  g_xrca.xrca028,g_xrca.xrca029,g_xrca.xrca030,g_xrca.xrca031,g_xrca.xrca032,g_xrca.xrca033,g_xrca.xrca034,g_xrca.xrca035,g_xrca.xrca036,
                  g_xrca.xrca037,g_xrca.xrca038,g_xrca.xrca039,g_xrca.xrca040,g_xrca.xrca041,g_xrca.xrca042,g_xrca.xrca043,g_xrca.xrca044,g_xrca.xrca045,
                  g_xrca.xrca046,g_xrca.xrca047,g_xrca.xrca048,g_xrca.xrca049,g_xrca.xrca050,g_xrca.xrca051,g_xrca.xrca052,g_xrca.xrca053,g_xrca.xrca054,
                  g_xrca.xrca055,g_xrca.xrca056,g_xrca.xrca057,g_xrca.xrca058,g_xrca.xrca059,g_xrca.xrca060,g_xrca.xrca061,g_xrca.xrca062,g_xrca.xrca063,
                  g_xrca.xrca064,g_xrca.xrca065,g_xrca.xrca066,g_xrca.xrca100,g_xrca.xrca101,g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca106,g_xrca.xrca107,
                  g_xrca.xrca108,g_xrca.xrca113,g_xrca.xrca114,g_xrca.xrca116,g_xrca.xrca117,g_xrca.xrca118,g_xrca.xrca120,g_xrca.xrca121,g_xrca.xrca123,
                  g_xrca.xrca124,g_xrca.xrca126,g_xrca.xrca127,g_xrca.xrca128,g_xrca.xrca130,g_xrca.xrca131,g_xrca.xrca133,g_xrca.xrca134,g_xrca.xrca136,
                  g_xrca.xrca137,g_xrca.xrca138)
         #161128-00061#3-----modify--end----------
         IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] <> 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = g_master.xrcadocno
            LET g_errparam.code   = 'aap-00187'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
           #LET g_success = 'N'         #20150201#1 By zhangwei Mark
            LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
         END IF
         #210114-00016#1---add---str
         INSERT INTO axrp131_tmp02 (xrcadocno) VALUES (g_xrca.xrcadocno)  
         #210114-00016#1---add---end
         LET g_xrcb.xrcbseq = 0

      END IF

     #150828-00001#2 Mark ---(S)---
     #SELECT imaal003 INTO l_xrcb005 FROM imaal_t
     # WHERE imaalent = g_enterprise AND imaal002 = g_lang
     #   AND imaal001 = l_xmdl.xmdl008
     #150828-00001#2 Mark ---(E)---
      #170531-00070#1--add--end
      
      #180416-00030#1 add-s
      #金额舍入类型
      LET l_round_type = cl_get_para(g_enterprise,'','E-COM-0006')
      #本币金额取位
      SELECT ooaj003,ooaj004,ooaj005,ooaj006,ooaj007
        INTO l_ooaj003,l_ooaj004,l_ooaj005,l_ooaj006,l_ooaj007
        FROM ooaj_t
       WHERE ooajent = g_enterprise
         AND ooaj001 = (SELECT glaa026 FROM glaa_t WHERE glaaent=g_enterprise AND glaald=g_xrca.xrcald)
         AND ooaj002 = (SELECT glaa001 FROM glaa_t WHERE glaaent=g_enterprise AND glaald=g_xrca.xrcald) 
      #180416-00030#1 add-s
      
      CALL s_axrt300_get_xrcb005(l_xmdl.xmdl008) RETURNING l_xrcb005   #150828-00001#2 Add

      LET g_xrcb.xrcbent = g_enterprise
      LET g_xrcb.xrcbld  = g_master.xrcald
      LET g_xrcb.xrcbdocno = g_xrca.xrcadocno
      LET g_xrcb.xrcbseq = g_xrcb.xrcbseq + 1
      LET g_xrcb.xrcbsite= g_master.xrcasite
      LET g_xrcb.xrcborga=l_xmdk.xmdksite
      LET g_xrcb.xrcb001 = l_prog
      LET g_xrcb.xrcb002 = l_xmdl.xmdldocno
      LET g_xrcb.xrcb003 = l_xmdl.xmdlseq
      LET g_xrcb.xrcb004 = l_xmdl.xmdl008
      LET g_xrcb.xrcb005 = l_xrcb005
      
      #200317-00037#1 add s---
      LET l_imaa004 = NULL
      EXECUTE selimaa_p USING g_xrcb.xrcb004 INTO l_imaa004
      IF l_imaa004 = 'E' THEN #费用类料件
         LET g_xrcb.xrcb005 = l_xmdl.xmdl051
      END IF
      #200317-00037#1 add e---     
      
      LET g_xrcb.xrcb006 = l_xmdl.xmdl021   #160614-00016#1 Mod xmdl017 --> xmdl021 
      LET g_xrcb.xrcb007 = g_xmdk_d[li_idx].xrcb007
      #180821-00038#10 add s---
      #CALL s_axrt300_xmdl_get_xrcb007(g_master.xrcald,l_xmdl.xmdldocno,l_xmdl.xmdlseq,'') RETURNING l_num,g_success  #190122-00041#1 mark
      CALL s_axrt300_xmdl_get_xrcb007(g_master.xrcald,l_xmdl.xmdldocno,l_xmdl.xmdlseq,'',g_master.xrcadocdt) RETURNING l_num,g_success  #190122-00041#1 add
      IF l_num > g_xmdk_d[li_idx].xrcb007 THEN
         LET g_xrcb.xrcb007 = g_xmdk_d[li_idx].xrcb007
      ELSE
         LET g_xrcb.xrcb007 = l_num
      END IF      
      #180821-00038#10 add e---
      LET g_xrcb.xrcb008 = l_xmdl.xmdl003
      LET g_xrcb.xrcb009 = l_xmdl.xmdl004
      LET g_xrcb.xrcblegl= g_xrca.xrcacomp
      LET g_xrcb.xrcb010 = g_xrca.xrca015 
      LET g_xrcb.xrcb011 = g_xrca.xrca034
      #LET g_xrcb.xrcb012 = ''    #180109-00028#1 mark
      #180109-00028#1 add-s
      SELECT imaa009 INTO g_xrcb.xrcb012 FROM imaa_t WHERE imaaent = g_enterprise
       AND imaa001 = g_xrcb.xrcb004
      #180109-00028#1 add-e
      LET g_xrcb.xrcb011 = g_xrca.xrca034   
      LET g_xrcb.xrcb013 = ''
      LET g_xrcb.xrcb014 = ''
      #180109-00028#1 mark-s
#      LET g_xrcb.xrcb015 = ''   
#      LET g_xrcb.xrcb016 = ''
      #180109-00028#1 mark-e
      #180109-00028#1 add-s
      LET g_xrcb.xrcb015 = l_xmdl.xmdl030  
      LET g_xrcb.xrcb016 = l_xmdl.xmdl031
      #180109-00028#1 add-e
      LET g_xrcb.xrcb017 = ''
      LET g_xrcb.xrcb018 = ''
      LET g_xrcb.xrcb019 = ''
      
      LET g_xrcb.xrcb020 = l_xmdl.xmdl025
      
      IF NOT cl_null(g_master.xrca011) THEN
         LET g_xrcb.xrcb020 = g_master.xrca011
      END IF
      #170420-00074#1 mark-----s
      #IF l_xmdk.xmdk082 = '4' THEN
      #   CALL s_fin_dept_reasons_with_ld_get_account(l_xmdk.xmdk004,'310',l_xmdl.xmdl050,g_xrca.xrcald,'@2@11',g_xrca.xrcadocdt)
      #        RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
      #   IF cl_null(g_xrcb.xrcb021) THEN
      #      CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_04') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
      #   END IF
      #END IF
      #170420-00074#1 mark-----e
      #170420-00074#1-----s
      LET g_xrcb.xrcb021 = '' #171204-00010#1 add by 10043
      IF NOT cl_null(l_xmdk.xmdk082) THEN   #
         IF l_xmdk.xmdk084 = '1' THEN
         ELSE
            #190305-00001#3   add-S
            IF g_xrcb.xrcb001 = '21' THEN
               #当agli161有区分销售分类时(维护*是没有区分销售分类的)，若有出货单/销退单来源，取來源單上的銷售分類(可為空)(xmdk031)-->帳單頭銷售分類(可為空)(对象預設的銷售分類)
               LET l_xmdk031 = NULL 
               SELECT xmdk031 INTO l_xmdk031 
                FROM xmdk_t 
               WHERE xmdkent = g_enterprise AND xmdkdocno = l_xmdl.xmdldocno
               IF cl_null(l_xmdk031) THEN 
                  LET l_xmdk031 = g_xrca.xrca058
               END IF   
               IF NOT cl_null(g_xrcb.xrcb004) THEN
                  #销售分群aimm213
                  LET l_imaf111 = NULL
                  SELECT imaf111 INTO l_imaf111 
                   FROM imaf_t 
                   WHERE imafent = g_enterprise AND imaf001 = g_xrcb.xrcb004
                     AND imafsite = (SELECT glaacomp FROM glaa_t WHERE glaaent=g_enterprise AND glaald=g_xrcb.xrcbld)
                  IF NOT cl_null(l_imaf111) THEN
                     LET l_kind = l_xmdk031,"@",l_imaf111
                  ELSE 
                     LET l_kind = l_xmdk031            
                  END IF
               END IF
               #销退方式
               LET l_type = ''
               IF l_xmdk.xmdk082 = '1' THEN LET l_type = '33' END IF   #销退退回->取成本及收入类销退科目
               IF l_xmdk.xmdk082 = '4' THEN LET l_type = '34' END IF   #金额折让->取成本及收入类金额折让科目
               CALL s_get_item_acc(g_xrca.xrcald,l_type,g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl.xmdl014)
                     RETURNING g_sub_success,g_xrcb.xrcb021
            END IF
            IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
            #190305-00001#3   add-E
               CASE
                  WHEN l_xmdk.xmdk082 = '4'
                     CALL s_fin_dept_reasons_with_ld_get_account(l_xmdk.xmdk004,'310',l_xmdl.xmdl050,g_xrca.xrcald,'@2@11',g_xrca.xrcadocdt)
                          RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
                     IF cl_null(g_xrcb.xrcb021) THEN
                        CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_05') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
                     END IF
                  OTHERWISE
                     CALL s_fin_dept_reasons_with_ld_get_account(l_xmdk.xmdk004,'310',l_xmdl.xmdl050,g_xrca.xrcald,'@2@11',g_xrca.xrcadocdt)
                          RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
                     IF cl_null(g_xrcb.xrcb021) THEN
                        CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_04') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
                     END IF
               END CASE
            END IF   #190305-00001#3 add
         END IF  
      END IF  
      #170420-00074#1-----e
      #150807-00010#1
      IF cl_null(g_xrcb.xrcb021) THEN  #150807-00010#1
         #171013-00004#3--mod--s--xul
         #CALL s_axrt300_item_acc(g_xrca.xrcald,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrca.xrca036,g_xrcb.xrcb004)   #160120-00011#3 add g_xrcb.xrcbdocno,g_xrcb.xrcbseq lujh
         #   RETURNING g_xrcb.xrcb021
         #180928-00002#1 add s---
         #l_xmdk031值对应的是agli161中的glcc012
         #当agli161有区分销售分类时(维护*是没有区分销售分类的)，若有出货单/销退单来源，取來源單上的銷售分類(可為空)(xmdk031)-->帳單頭銷售分類(可為空)(对象預設的銷售分類)
         LET l_xmdk031 = NULL 
         SELECT xmdk031 INTO l_xmdk031 FROM xmdk_t WHERE xmdkent = g_enterprise AND xmdkdocno = l_xmdl.xmdldocno
         IF cl_null(l_xmdk031) THEN 
            LET l_xmdk031 = g_xrca.xrca058
         END IF         
         #180928-00002#1 add e---
         IF NOT cl_null(g_xrcb.xrcb004) THEN
            #190812-00010#5 add s---#销售分群aimm213
            LET l_imaf111 = NULL
            SELECT imaf111 INTO l_imaf111 FROM imaf_t 
             WHERE imafent = g_enterprise AND imaf001 = g_xrcb.xrcb004
               AND imafsite = (SELECT glaacomp FROM glaa_t WHERE glaaent=g_enterprise AND glaald=g_xrcb.xrcbld)
            IF NOT cl_null(l_imaf111) THEN
               LET l_kind = l_xmdk031,"@",l_imaf111
            ELSE 
               LET l_kind = l_xmdk031            
            END IF             
            #190812-00010#5 add e--- 
            #190305-00001#3   add-S
            IF g_xrcb.xrcb001 = '21' THEN
               #销退方式
               LET l_type = ''
               IF l_xmdk.xmdk082 = '1' THEN LET l_type = '33' END IF   #销退退回->取成本及收入类销退科目
               IF l_xmdk.xmdk082 = '4' THEN LET l_type = '34' END IF   #金额折让->取成本及收入类金额折让科目
               CALL s_get_item_acc(g_xrca.xrcald,l_type,g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl.xmdl014)
                     RETURNING g_sub_success,g_xrcb.xrcb021
            END IF
            IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
            #190305-00001#3   add-E            
               IF l_xmdl.xmdl007 = '9' THEN
                  #CALL s_get_item_acc(g_xrca.xrcald,'30',g_xrcb.xrcb004,l_xmdk031,g_xrcb.xrcb034,'',l_xmdl.xmdl014)     #180928-00002#1 mod g_xrca.xrca058-->l_xmdk031 #190812-00010#5 mark
                  CALL s_get_item_acc(g_xrca.xrcald,'30',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl.xmdl014)  #190812-00010#5 add 
                   RETURNING g_sub_success,g_xrcb.xrcb021 
               ELSE
                  #CALL s_get_item_acc(g_xrca.xrcald,'4',g_xrcb.xrcb004,l_xmdk031,g_xrcb.xrcb034,'',l_xmdl.xmdl014)      #180928-00002#1 mod g_xrca.xrca058-->l_xmdk031 #190812-00010#5 mark
                  CALL s_get_item_acc(g_xrca.xrcald,'4',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl.xmdl014) 
                  #190812-00010#5 add
                   RETURNING g_sub_success,g_xrcb.xrcb021 
               END IF 
            END IF   #190305-00001#3 add            
         END IF 
         IF cl_null(g_xrcb.xrcb021) THEN
            LET g_xrcb.xrcb021 = g_xrca.xrca036
         END IF 
         #171013-00004#3--mod--e--xul         
      END IF                           #150807-00010#1
      IF l_prog = '11' THEN LET g_xrcb.xrcb022 = 1 ELSE LET g_xrcb.xrcb022 = -1 END IF
      LET g_xrcb.xrcb024 = ''
      LET g_xrcb.xrcb023 = 'N'
      LET g_xrcb.xrcb025 = ''
      LET g_xrcb.xrcb026 = ''
      LET g_xrcb.xrcb027 = l_xmdl.xmdl048
      LET g_xrcb.xrcb028 = l_xmdl.xmdl049
      LET g_xrcb.xrcb029 = g_xrca.xrca035
      LET g_xrcb.xrcb030 = 0
      LET g_xrcb.xrcb031 = l_xmdk.xmdk010
      LET g_xrcb.xrcb034 = l_xmdk.xmdk030   #161025-00017#1
      LET g_xrcb.xrcb015 = l_xmdl.xmdl030   #160520-00008#1 Add
      IF cl_null(g_xrcb.xrcb031) THEN
         LET g_xrcb.xrcb031 = g_xrca.xrca008
      END IF
      LET g_xrcb.xrcb051 = g_xrca.xrca014  
      #170413-00024#1 add s---
      IF g_master.b_comb2 <> '3' THEN #非人员汇总方式
         IF NOT cl_null(l_xmdl.xmdl003) AND NOT cl_null(l_xmdl.xmdl004) THEN #订单单号，项次
            EXECUTE axrp131_xmda_prep USING l_xmdl.xmdl003 INTO g_xrcb.xrcb010,g_xrcb.xrcb051
         END IF
      END IF   
      #170413-00024#1 add e---      
      LET g_xrcb.xrcb100 = g_xrca.xrca100
      #IF NOT cl_null(g_xrcb.xrcb020) THEN   #180221-00030#1 mark
      IF NOT cl_null(l_xmdl.xmdl025) THEN   #180221-00030#1 mod
         #CALL s_tax_chk(g_glaa.glaacomp,g_xrcb.xrcb020) #180221-00030#1 mark
         CALL s_tax_chk(g_glaa.glaacomp,l_xmdl.xmdl025) #180221-00030#1 mod
            RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
        #IF l_oodb005 = 'Y' THEN
        #   CALL s_tax_chk(g_glaa.glaacomp,g_master.xrca011)
        #      RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
        #   IF l_oodb005 = 'N' THEN
        #      LET l_xmdl.xmdl024 = l_xmdl.xmdl024 / (1 + l_oodb006/100)
        #   END IF
        #END IF
      END IF

      LET g_xrcb.xrcb107 = l_xmdl.xmdl024   #160816-00014#1 Add
      
 
      IF g_sfin2012 = '1' THEN   #立帳不含稅
         #若來源單單價含稅則需要換算為不含稅的單價
         IF l_oodb005 = 'Y' THEN
            LET l_xmdl.xmdl024 = l_xmdl.xmdl024 / (1 + l_oodb006/100)
         END IF
      END IF
      CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,l_xmdl.xmdl024,1) RETURNING g_sub_success,g_errno,l_xmdl.xmdl024
      LET g_xrcb.xrcb101 = l_xmdl.xmdl024  #交易原币单价
      LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrcb.xrcb020  
 

      #180416-00030#1 mark-s
#      CALL s_axrt300_exrate(g_glaa.glaa002,g_xrca.xrcadocdt,g_xrca.xrca100,g_glaa.glaa001,g_xrcb.xrcb101,g_xrca.xrca101,g_glaa.glaacomp)
#         RETURNING l_success,g_xrcb.xrcb111
      #180416-00030#1 mark-e
 
      #180416-00030#1 add-s
      #CALL s_num_round(l_round_type,g_xrcb.xrcb101,l_ooaj003) RETURNING g_xrcb.xrcb101  #180625-00055#1 mark
      LET g_xrcb.xrcb111=g_xrcb.xrcb101 * g_xrca.xrca101
      CALL s_num_round(l_round_type,g_xrcb.xrcb111,l_ooaj003) RETURNING g_xrcb.xrcb111
      #180416-00030#1 add-e
      #201023-00028#22 add -s
      #优先取aisi070
      LET l_glab005 = NULL
      SELECT glab005 INTO l_glab005
        FROM glab_t
       WHERE glabent = g_enterprise
         AND glabld = g_master.xrcald
         AND glab001 = '14'
         AND glab002 = '2'  #销项
         AND glab003 = g_xrcb.xrcb020
      IF NOT cl_null(l_glab005) THEN
         LET l_xrcd009 = l_glab005
      END IF
      #201023-00028#22 add -e
      CALL s_tax_ins(g_xrca.xrcadocno,g_xrcb.xrcbseq,0,g_glaa.glaacomp,
                     l_xmdl.xmdl024 * g_xrcb.xrcb007,g_xrcb.xrcb020,                     
                     g_xrcb.xrcb007,g_xrcb.xrcb100,g_xrca.xrca101,g_xrca.xrcald,g_xrca.xrca121,g_xrca.xrca131)
         RETURNING g_xrcb.xrcb103,g_xrcb.xrcb104,g_xrcb.xrcb105,
                   g_xrcb.xrcb113,g_xrcb.xrcb114,g_xrcb.xrcb115,
                   g_xrcb.xrcb123,g_xrcb.xrcb124,g_xrcb.xrcb125,
                   g_xrcb.xrcb133,g_xrcb.xrcb134,g_xrcb.xrcb135
 
      IF g_sfin2012 = '1' THEN   #立帳不含稅   
#190503-00010#1---mark---str--
#暫估金額不採用出貨金額-已立帳金額的原因為:若是立帳時有價差,立帳金額可能遠超過出貨金額,相減後暫估金額就變成負數了.
#這裡的暫估金額僅能以出貨單價格暫估數量做預設
#         #170711-00047#1----add-----str
#         #         為了避免尾差問題,建議採倒扣方式計算
#         #用以下判斷式判斷是否為部分暫估當
#         # 主帳套已立帳數量(xmdl038) > 0 且 計價數量(xmdl022) <> 主帳套已立帳數量(xmdl038) 時
#         #暫估未稅金額 = 出貨未稅金額(xmdl027) - 交易原幣未稅金額(xrcb103)
##         #170808-00010#1---mark----str
##         SELECT SUM(xrcb103) INTO l_xrcb103_sum
##         FROM xrcb_t
##         WHERE xrcbent = g_xrcb.xrcbent
##         AND xrcbld = g_xrcb.xrcbld
##         AND xrcbsite = g_xrcb.xrcbsite
##         AND xrcborga = g_xrcb.xrcborga
##         AND xrcb002 = g_xrcb.xrcb002
##         AND xrcb003 = g_xrcb.xrcb003
##         #170808-00010#1---mark----end
#         #170808-00010#1---add----str
#         LET l_xrcb103_sum = 0 #181012-00009#1 add
#         SELECT SUM(xrcb103) INTO l_xrcb103_sum
#         FROM xrcb_t,xrca_t
#         WHERE xrcbent = xrcaent
#         AND xrcbdocno = xrcadocno
#         AND xrcbld = xrcald
#         AND xrcbent = g_xrcb.xrcbent
#         AND xrcbld = g_xrcb.xrcbld
#         #AND xrcbsite = g_xrcb.xrcbsite #181012-00009#1 mark
#         #AND xrcborga = g_xrcb.xrcborga #181012-00009#1 mark
#         AND xrcb002 = g_xrcb.xrcb002
#         AND xrcb003 = g_xrcb.xrcb003
#         AND xrcastus <> 'X'
#         #181012-00009#1 add s---
#         IF cl_null(l_xrcb103_sum) THEN 
#            LET l_xrcb103_sum = 0 
#         END IF
#         #181012-00009#1 add e---
#         #180821-00038#1 add s---
#         SELECT SUM(isag103) INTO l_isag103_sum 
#            FROM isaf_t,isag_t 
#           WHERE isafent = isagent AND isafdocno = isagdocno 
#             AND isafcomp = isagcomp AND isag002 = g_xrcb.xrcb002 AND isag003 = g_xrcb.xrcb003  
#             AND isafstus <> 'X'
#         IF cl_null(l_isag103_sum) THEN 
#            LET l_isag103_sum = 0 
#         END IF             
#         #180821-00038#1 add e---
#         #170808-00010#1---add----end
#         IF l_xmdl.xmdl038 > 0 AND l_xmdl.xmdl022 <> l_xmdl.xmdl038 + l_xmdl.xmdl047 THEN #180821-00038#1 add  + l_xmdl.xmdl047
#            LET g_xrcb.xrcb103 = l_xmdl.xmdl027 - l_xrcb103_sum - l_isag103_sum #180821-00038#1 add l_isag103_sum
#            LET g_xrcb.xrcb104 = 0
#            LET g_xrcb.xrcb105 = l_xmdl.xmdl027 - l_xrcb103_sum - l_isag103_sum #180821-00038#1 add l_isag103_sum
#            LET g_xrcb.xrcb113 = (l_xmdl.xmdl027 - l_xrcb103_sum - l_isag103_sum) * g_xrca.xrca101 #180821-00038#1 add l_isag103_sum
#            LET g_xrcb.xrcb114 = 0
#            LET g_xrcb.xrcb115 = (l_xmdl.xmdl027 - l_xrcb103_sum - l_isag103_sum) * g_xrca.xrca101 #180821-00038#1 add l_isag103_sum
#         ELSE
#         #170711-00047#1----add-----str
#            #180221-00030#1 mark--s
##            LET g_xrcb.xrcb103 = l_xmdl.xmdl027
##            LET g_xrcb.xrcb104 = 0
##            LET g_xrcb.xrcb105 = l_xmdl.xmdl027
##            LET g_xrcb.xrcb113 = l_xmdl.xmdl027 * g_xrca.xrca101
##            LET g_xrcb.xrcb114 = 0
##            LET g_xrcb.xrcb115 = l_xmdl.xmdl027 * g_xrca.xrca101
#            #180221-00030#1 mark--e
#         END IF #170711-00047#1----add
#190503-00010#1---mark---end--         
         
         #160906-00017#1 add--s
         #170603-00022#1--mod--str--
#         SELECT ooef016,ooef017 INTO l_ooef016,l_ooef017
#           FROM ooef_t 
#          WHERE ooef001 = g_glaa.glaacomp
#            AND ooefent = g_enterprise
#         LET g_xrcb.xrcb103 = s_curr_round(l_ooef017,l_ooef016,g_xrcb.xrcb103,2)
#         LET g_xrcb.xrcb105 = s_curr_round(l_ooef017,l_ooef016,g_xrcb.xrcb105,2)
#         LET g_xrcb.xrcb113 = s_curr_round(l_ooef017,l_ooef016,g_xrcb.xrcb113,2)
#         LET g_xrcb.xrcb115 = s_curr_round(l_ooef017,l_ooef016,g_xrcb.xrcb115,2)
         #200918-00057#1 add(s)
         IF l_num = l_xmdl.xmdl022 THEN #如果可暫估數量 = 計價數量，就將出貨單的原幣金額 = 暫估單的原幣金額
            LET g_xrcb.xrcb103 = l_xmdl.xmdl027
            LET g_xrcb.xrcb105 = g_xrcb.xrcb103
            LET g_xrcb.xrcb113 = l_xmdl.xmdl027 * g_xrca.xrca101
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb113,2) RETURNING l_success,g_errno,g_xrcb.xrcb113            
            LET g_xrcb.xrcb115 = g_xrcb.xrcb113
            #因為尾差,會與來源單據金額不符,故當暫估數量與計價數量相同,重新更新相關金額
            UPDATE xrcd_t SET xrcd103 = g_xrcb.xrcb103,
                              xrcd104 = g_xrcb.xrcb104,
                              xrcd105 = g_xrcb.xrcb105,
                              xrcd113 = g_xrcb.xrcb113,
                              xrcd114 = g_xrcb.xrcb114,
                              xrcd115 = g_xrcb.xrcb115
             WHERE xrcdent   = g_enterprise
               AND xrcdld    = g_xrca.xrcald
               AND xrcddocno = g_xrca.xrcadocno
               AND xrcdseq   = g_xrcb.xrcbseq
               AND xrcdseq2  = 0
         ELSE
         #200918-00057#1 add(e)
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,g_xrcb.xrcb103,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb103
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,g_xrcb.xrcb105,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb105
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb113,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb113
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb115,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb115
            #170603-00022#1--mod--end
            #160906-00017#1 add--e
            UPDATE xrcd_t SET xrcd103 = g_xrcb.xrcb103,
                              xrcd104 = g_xrcb.xrcb104,
                              xrcd105 = g_xrcb.xrcb105,
                              xrcd113 = g_xrcb.xrcb113,
                              xrcd114 = g_xrcb.xrcb114,
                              xrcd115 = g_xrcb.xrcb115
             WHERE xrcdent = g_enterprise
               AND xrcddocno = g_xrca.xrcadocno
               AND xrcdld = g_xrca.xrcald
               AND xrcdseq = g_xrcb.xrcbseq
         END IF  #200918-00057#1 add
      #170603-00022#1--add--str--
      ELSE
         #191224-00028#1 add(s)
         IF l_num = l_xmdl.xmdl022 THEN #如果可暫估數量 = 計價數量，就將出貨單的原幣金額 = 暫估單的原幣金額
            LET g_xrcb.xrcb103 = l_xmdl.xmdl027
            LET g_xrcb.xrcb104 = l_xmdl.xmdl029
            LET g_xrcb.xrcb105 = l_xmdl.xmdl028
            LET g_xrcb.xrcb115 = (l_xmdl.xmdl027+l_xmdl.xmdl029)*g_xrca.xrca101
            LET g_xrcb.xrcb114 = l_xmdl.xmdl029 * g_xrca.xrca101
            #先各自取位之後再做加減，避免因為小數位造成尾差
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb114,2) RETURNING l_success,g_errno,g_xrcb.xrcb114
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb115,2) RETURNING l_success,g_errno,g_xrcb.xrcb115            
            LET g_xrcb.xrcb113 = g_xrcb.xrcb115-g_xrcb.xrcb114
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb113,2) RETURNING l_success,g_errno,g_xrcb.xrcb113
            #因為尾差,會與來源單據金額不符,故當暫估數量與計價數量相同,重新更新相關金額
            UPDATE xrcd_t SET xrcd103 = g_xrcb.xrcb103,
                              xrcd104 = g_xrcb.xrcb104,
                              xrcd105 = g_xrcb.xrcb105,
                              xrcd113 = g_xrcb.xrcb113,
                              xrcd114 = g_xrcb.xrcb114,
                              xrcd115 = g_xrcb.xrcb115
             WHERE xrcdent   = g_enterprise
               AND xrcdld    = g_xrca.xrcald
               AND xrcddocno = g_xrca.xrcadocno
               AND xrcdseq   = g_xrcb.xrcbseq
               AND xrcdseq2  = 0
         ELSE
         #191224-00028#1 add(e)
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,g_xrcb.xrcb103,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb103
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,g_xrcb.xrcb104,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb104
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,g_xrcb.xrcb105,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb105
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb113,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb113
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb114,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb114
            CALL s_curr_round_ld('1',g_xrca.xrcald,g_glaa.glaa001,g_xrcb.xrcb115,2) 
            RETURNING l_success,g_errno,g_xrcb.xrcb115
         END IF #191224-00028#1 add(s)   
      #170603-00022#1--add--end
      END IF
      
      #190905-00010#1 mark(s)
#      UPDATE xrcd_t SET xrcd009 = l_xrcd009
#       WHERE xrcdent = g_enterprise
#        AND xrcd009 IS NULL       #160816-00014#1 Mark   #190118-00038#1 remark
#         AND xrcddocno = g_xrca.xrcadocno
#         AND xrcdld = g_xrca.xrcald
      #190905-00010#1 mark(e)
         
      CALL s_tax_chk(g_glaa.glaacomp,g_xrcb.xrcb020)  
         RETURNING l_success,l_oodbl004,l_oodb005,l_xrca.xrca012,l_oodb011
      IF l_oodb005 = 'Y' THEN
         LET g_xrcb.xrcb113 = g_xrcb.xrcb115 - g_xrcb.xrcb114
         LET g_xrcb.xrcb123 = g_xrcb.xrcb125 - g_xrcb.xrcb124
         LET g_xrcb.xrcb133 = g_xrcb.xrcb135 - g_xrcb.xrcb134
      ELSE
         LET g_xrcb.xrcb115 = g_xrcb.xrcb113 + g_xrcb.xrcb114
         LET g_xrcb.xrcb125 = g_xrcb.xrcb123 + g_xrcb.xrcb124
         LET g_xrcb.xrcb135 = g_xrcb.xrcb133 + g_xrcb.xrcb134
      END IF
      
      LET g_xrcb.xrcb106 = 0
      LET g_xrcb.xrcb116 = 0
      LET g_xrcb.xrcb117 = 0
      LET g_xrcb.xrcb118 = g_xrcb.xrcb113
      LET g_xrcb.xrcb119 = g_xrcb.xrcb115
      LET g_xrcb.xrcb126 = 0
      LET g_xrcb.xrcb136 = 0
      LET g_xrcb.xrcb102 = g_xrca.xrca101   #160830-00047#1 Add

     #150515-00013#3 Add  ---(S)---
      IF g_xrca.xrca100 = g_glaa.glaa001 THEN
         LET g_xrcb.xrcb113 = g_xrcb.xrcb103
         LET g_xrcb.xrcb114 = g_xrcb.xrcb104
         LET g_xrcb.xrcb115 = g_xrcb.xrcb105
         UPDATE xrcd_t SET xrcd113 = xrcd103,
                           xrcd114 = xrcd104,
                           xrcd115 = xrcd105
          WHERE xrcdent = g_enterprise
            AND xrcddocno = g_xrca.xrcadocno
            AND xrcdld = g_xrca.xrcald
      END IF
     #150515-00013#3 Add  ---(E)---
      
      #180705-00083#3 add -s
      #业务人员，业务部门
      IF cl_null(g_xrcb.xrcb051) THEN
         LET g_xrcb.xrcb051 = g_xrca.xrca014
      END IF
      IF cl_null(g_xrcb.xrcb010) THEN
         LET g_xrcb.xrcb010 = g_xrca.xrca015
      END IF
      #固定核算项默认值
      INITIALIZE l_xrcb.* TO NULL
      LET l_xrcb.xrcb053 = g_xrcb.xrcb053
      LET l_xrcb.xrcb054 = g_xrcb.xrcb054
      LET l_xrcb.xrcb051 = g_xrcb.xrcb051
      LET l_xrcb.xrcb010 = g_xrcb.xrcb010
      LET l_xrcb.xrcb011 = g_xrcb.xrcb011
      LET l_xrcb.xrcb024 = g_xrcb.xrcb024
      LET l_xrcb.xrcb036 = g_xrcb.xrcb036 
      LET l_xrcb.xrcb012 = g_xrcb.xrcb012
      LET l_xrcb.xrcb033 = g_xrcb.xrcb033
      LET l_xrcb.xrcb034 = g_xrcb.xrcb034
      LET l_xrcb.xrcb035 = g_xrcb.xrcb035
      LET l_xrcb.xrcb015 = g_xrcb.xrcb015
      LET l_xrcb.xrcb016 = g_xrcb.xrcb016
      
      CALL s_axrp133_get_accitem(g_xrcb.xrcbld,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb.*)
         RETURNING g_xrcb.xrcb053,g_xrcb.xrcb054,g_xrcb.xrcb051,g_xrcb.xrcb010,g_xrcb.xrcb011,
                   g_xrcb.xrcb024,g_xrcb.xrcb036,g_xrcb.xrcb012,g_xrcb.xrcb033,g_xrcb.xrcb034,
                   g_xrcb.xrcb035,g_xrcb.xrcb015,g_xrcb.xrcb016
      #180705-00083#3 add -e 
      #191227-00043#1 add(s) 
      #如果agli051跟axmm200都有維護則以agli051為優先
      IF cl_null(g_xrcb.xrcb036) THEN
         LET g_xrcb.xrcb036 = g_xrca.xrca006  
      END IF
      #191227-00043#1 add(e)
      #191030-00020#1 add(s)
      IF cl_null(g_xrcb.xrcb035) THEN
      #如果aimm200 跟agli051都有維護的話，就先抓agli051的
         SELECT imaa126 INTO l_xrcb035 FROM imaa_t 
          WHERE imaaent = g_enterprise
            AND imaa001 = g_xrcb.xrcb004
         LET g_xrcb.xrcb035 = l_xrcb035
      END IF
      #191030-00020#1 add(e)
      #190423-00042#8 add_S
      IF NOT cl_null(l_xmdl.xmdl030) AND NOT cl_null(l_xmdl.xmdl031) THEN       
         LET g_xrcb.xrcb015 = l_xmdl.xmdl030  
         LET g_xrcb.xrcb016 = l_xmdl.xmdl031
      END IF          
      #190423-00042#8 add_E      
      #161102-00015#2 --s add
      IF cl_null(g_xrcb.xrcb010) THEN LET g_xrcb.xrcb010 = " " END IF #業務部門
      IF cl_null(g_xrcb.xrcb011) THEN LET g_xrcb.xrcb011 = " " END IF #責任中心
      IF cl_null(g_xrcb.xrcb012) THEN LET g_xrcb.xrcb012 = " " END IF #產品類別
      IF cl_null(g_xrcb.xrcb015) THEN LET g_xrcb.xrcb015 = " " END IF #專案編號
      IF cl_null(g_xrcb.xrcb016) THEN LET g_xrcb.xrcb016 = " " END IF #WBS編號
      IF cl_null(g_xrcb.xrcb024) THEN LET g_xrcb.xrcb024 = " " END IF #區域
      IF cl_null(g_xrcb.xrcb031) THEN LET g_xrcb.xrcb031 = " " END IF #收款條件編號
      IF cl_null(g_xrcb.xrcb033) THEN LET g_xrcb.xrcb033 = " " END IF #經營方式
      IF cl_null(g_xrcb.xrcb034) THEN LET g_xrcb.xrcb034 = " " END IF #通路
      IF cl_null(g_xrcb.xrcb035) THEN LET g_xrcb.xrcb035 = " " END IF #品牌
      IF cl_null(g_xrcb.xrcb036) THEN LET g_xrcb.xrcb036 = " " END IF #客群
      IF cl_null(g_xrcb.xrcb037) THEN LET g_xrcb.xrcb037 = " " END IF #自由核算項一
      IF cl_null(g_xrcb.xrcb038) THEN LET g_xrcb.xrcb038 = " " END IF #自由核算項二
      IF cl_null(g_xrcb.xrcb039) THEN LET g_xrcb.xrcb039 = " " END IF #自由核算項三
      IF cl_null(g_xrcb.xrcb040) THEN LET g_xrcb.xrcb040 = " " END IF #自由核算項四
      IF cl_null(g_xrcb.xrcb041) THEN LET g_xrcb.xrcb041 = " " END IF #自由核算項五
      IF cl_null(g_xrcb.xrcb042) THEN LET g_xrcb.xrcb042 = " " END IF #自由核算項六
      IF cl_null(g_xrcb.xrcb043) THEN LET g_xrcb.xrcb043 = " " END IF #自由核算項七
      IF cl_null(g_xrcb.xrcb044) THEN LET g_xrcb.xrcb044 = " " END IF #自由核算項八
      IF cl_null(g_xrcb.xrcb045) THEN LET g_xrcb.xrcb045 = " " END IF #自由核算項九
      IF cl_null(g_xrcb.xrcb046) THEN LET g_xrcb.xrcb046 = " " END IF #自由核算項十
      IF cl_null(g_xrcb.xrcb051) THEN LET g_xrcb.xrcb051 = " " END IF #業務人員
      IF cl_null(g_xrcb.xrcb053) THEN LET g_xrcb.xrcb053 = " " END IF #帳款對象
      IF cl_null(g_xrcb.xrcb054) THEN LET g_xrcb.xrcb054 = " " END IF #收款對象
      #161102-00015#2 --e add
      LET g_xrcb.xrcb053 = g_xrca.xrca004        #180803-00011#1 add
      LET g_xrcb.xrcb054 = g_xrca.xrca005        #180803-00011#1 add
      EXECUTE axrp131_xmda_prep2 USING l_xmdl.xmdl003 INTO g_xrcb.xrcb048 #180827-00015#1 add  
      #161128-00061#3-----modify--begin----------
      #INSERT INTO xrcb_t VALUES (g_xrcb.*)
      INSERT INTO xrcb_t (xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,
                          xrcb005,xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,
                          xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,
                          xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,
                          xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,
                          xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,
                          xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,
                          xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,
                          xrcb134,xrcb135,xrcb136,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,
                          xrcb059,xrcb060,xrcb107)
       VALUES (g_xrcb.xrcbent,g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrcb.xrcbsite,g_xrcb.xrcborga,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003,g_xrcb.xrcb004,
               g_xrcb.xrcb005,g_xrcb.xrcb006,g_xrcb.xrcb007,g_xrcb.xrcb008,g_xrcb.xrcb009,g_xrcb.xrcblegl,g_xrcb.xrcb010,g_xrcb.xrcb011,g_xrcb.xrcb012,g_xrcb.xrcb013,
               g_xrcb.xrcb014,g_xrcb.xrcb015,g_xrcb.xrcb016,g_xrcb.xrcb017,g_xrcb.xrcb018,g_xrcb.xrcb019,g_xrcb.xrcb020,g_xrcb.xrcb021,g_xrcb.xrcb022,g_xrcb.xrcb023,
               g_xrcb.xrcb024,g_xrcb.xrcb025,g_xrcb.xrcb026,g_xrcb.xrcb027,g_xrcb.xrcb028,g_xrcb.xrcb029,g_xrcb.xrcb030,g_xrcb.xrcb031,g_xrcb.xrcb032,g_xrcb.xrcb033,
               g_xrcb.xrcb034,g_xrcb.xrcb035,g_xrcb.xrcb036,g_xrcb.xrcb037,g_xrcb.xrcb038,g_xrcb.xrcb039,g_xrcb.xrcb040,g_xrcb.xrcb041,g_xrcb.xrcb042,g_xrcb.xrcb043,
               g_xrcb.xrcb044,g_xrcb.xrcb045,g_xrcb.xrcb046,g_xrcb.xrcb047,g_xrcb.xrcb048,g_xrcb.xrcb049,g_xrcb.xrcb050,g_xrcb.xrcb051,g_xrcb.xrcb100,g_xrcb.xrcb101,
               g_xrcb.xrcb102,g_xrcb.xrcb103,g_xrcb.xrcb104,g_xrcb.xrcb105,g_xrcb.xrcb106,g_xrcb.xrcb111,g_xrcb.xrcb113,g_xrcb.xrcb114,g_xrcb.xrcb115,g_xrcb.xrcb116,
               g_xrcb.xrcb117,g_xrcb.xrcb118,g_xrcb.xrcb119,g_xrcb.xrcb121,g_xrcb.xrcb123,g_xrcb.xrcb124,g_xrcb.xrcb125,g_xrcb.xrcb126,g_xrcb.xrcb131,g_xrcb.xrcb133,
               g_xrcb.xrcb134,g_xrcb.xrcb135,g_xrcb.xrcb136,g_xrcb.xrcb052,g_xrcb.xrcb053,g_xrcb.xrcb054,g_xrcb.xrcb055,g_xrcb.xrcb056,g_xrcb.xrcb057,g_xrcb.xrcb058,
               g_xrcb.xrcb059,g_xrcb.xrcb060,g_xrcb.xrcb107)
      #161128-00061#3-----modify--end----------
      IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] <> 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = g_master.xrcadocno
         LET g_errparam.code   = 'aap-00187'
         LET g_errparam.popup  = TRUE
         CALL cl_err()
        #LET g_success = 'N'         #20150201#1 By zhangwei Mark
         LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
      END IF
      #180705-00083#3 add -s
      #自由核算项默认值
      IF l_doc_success THEN
         INITIALIZE l_xrcb2.* TO NULL
         LET l_xrcb2.xrcb037= g_xrcb.xrcb037
         LET l_xrcb2.xrcb038= g_xrcb.xrcb038
         LET l_xrcb2.xrcb039= g_xrcb.xrcb039
         LET l_xrcb2.xrcb040= g_xrcb.xrcb040
         LET l_xrcb2.xrcb041= g_xrcb.xrcb041
         LET l_xrcb2.xrcb042= g_xrcb.xrcb042
         LET l_xrcb2.xrcb043= g_xrcb.xrcb043
         LET l_xrcb2.xrcb044= g_xrcb.xrcb044
         LET l_xrcb2.xrcb045= g_xrcb.xrcb045
         LET l_xrcb2.xrcb046= g_xrcb.xrcb046
         CALL s_axrp133_get_accitem_free('axrt320',g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb2.*)
      END IF
      #180705-00083#3 add -e
      LET l_xrcb103 = l_xrcb103 - g_xrcb.xrcb103
      LET l_xrcb105 = l_xrcb105 - g_xrcb.xrcb105
      #151008-00009#8--s
      LET lc_param.xrcasite  = g_xrca.xrcasite
      LET lc_param.xrcald    = g_xrca.xrcald
      LET lc_param.xrcacomp  = g_xrca.xrcacomp
      LET lc_param.xrcadocno = g_xrca.xrcadocno
      LET lc_param.xrcadocdt = g_xrca.xrcadocdt
      LET lc_param.xrca001   = g_xrca.xrca001
      LET lc_param.xrca003   = g_xrca.xrca003
      LET lc_param.xrca004   = g_xrca.xrca004
      LET lc_param.xrca005   = g_xrca.xrca005
      LET lc_param.xrca058   = g_xrca.xrca058
      LET lc_param.xrca100   = g_xrca.xrca100
      LET lc_param.xrca101   = g_xrca.xrca101
      LET lc_param.xrca121   = g_xrca.xrca121
      LET lc_param.xrca131   = g_xrca.xrca131
      LET lc_param.xrcbseq   = g_xrcb.xrcbseq
      LET lc_param.xrcb002   = g_xrcb.xrcb002
      LET lc_param.xrcb003   = g_xrcb.xrcb003
      LET lc_param.xrcb004   = g_xrcb.xrcb004
      LET lc_param.xrcb008   = g_xrcb.xrcb008
      LET lc_param.xrcb009   = g_xrcb.xrcb009
      LET lc_param.xrcb010   = g_xrcb.xrcb010
      LET lc_param.xrcb011   = g_xrcb.xrcb011
      LET lc_param.xrcb012   = g_xrcb.xrcb012
      LET lc_param.xrcb015   = g_xrcb.xrcb015
      LET lc_param.xrcb016   = g_xrcb.xrcb016
      LET lc_param.xrcb021   = g_xrcb.xrcb021
      LET lc_param.xrcb024   = g_xrcb.xrcb024
      LET lc_param.xrcb033   = g_xrcb.xrcb033
      LET lc_param.xrcb034   = g_xrcb.xrcb034
      LET lc_param.xrcb035   = g_xrcb.xrcb035
      LET lc_param.xrcb036   = g_xrcb.xrcb036
      LET lc_param.xrcb037   = g_xrcb.xrcb037
      LET lc_param.xrcb038   = g_xrcb.xrcb038
      LET lc_param.xrcb039   = g_xrcb.xrcb039
      LET lc_param.xrcb040   = g_xrcb.xrcb040
      LET lc_param.xrcb041   = g_xrcb.xrcb041
      LET lc_param.xrcb042   = g_xrcb.xrcb042
      LET lc_param.xrcb043   = g_xrcb.xrcb043
      LET lc_param.xrcb044   = g_xrcb.xrcb044
      LET lc_param.xrcb045   = g_xrcb.xrcb045
      LET lc_param.xrcb046   = g_xrcb.xrcb046
      LET lc_param.xrcb047   = g_xrcb.xrcb047
      LET lc_param.xrcb051   = g_xrcb.xrcb051
      LET lc_param.xrcb103   = g_xrcb.xrcb103
      LET lc_param.xrcb113   = g_xrcb.xrcb113
      LET lc_param.xrcb123   = g_xrcb.xrcb123
      LET lc_param.xrcb133   = g_xrcb.xrcb133     
      LET lc_param.type1     = '1'
      LET ls_js = util.JSON.stringify(lc_param)       
      #寫入遞延檔
      CALL s_axrt470_ins_deferred(ls_js) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET l_doc_success = FALSE
      END IF
      #151008-00009#8--e      
      CASE
         WHEN l_s = '1'
            SELECT xmdl053 INTO l_xmdlnum FROM xmdl_t
             WHERE xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003
               AND xmdlent = g_enterprise
               
            IF cl_null(l_xmdlnum) THEN LET l_xmdlnum=0 END IF
            UPDATE xmdl_t SET xmdl053 = l_xmdlnum + g_xrcb.xrcb007
             WHERE xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003
               AND xmdlent = g_enterprise
         WHEN l_s = '2'
            SELECT xmdl054 INTO l_xmdlnum FROM xmdl_t
             WHERE xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003
               AND xmdlent = g_enterprise
               
            IF cl_null(l_xmdlnum) THEN LET l_xmdlnum=0 END IF
            UPDATE xmdl_t SET xmdl054 = l_xmdlnum + g_xrcb.xrcb007
             WHERE xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003
               AND xmdlent = g_enterprise
         WHEN l_s = '3'
            SELECT xmdl055 INTO l_xmdlnum FROM xmdl_t
             WHERE xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003
               AND xmdlent = g_enterprise
               
            IF cl_null(l_xmdlnum) THEN LET l_xmdlnum=0 END IF
            UPDATE xmdl_t SET xmdl055 = l_xmdlnum + g_xrcb.xrcb007
             WHERE xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003
               AND xmdlent = g_enterprise
      END CASE
      LET l_order_t = g_xmdk_d[li_idx].order   #20150201#1 By zhangwei Mod l_order --->g_xmdk_d[li_idx].order
      
#      #210114-00016#1---mark----str---移到for外面产生
#      #151125-00006#1---add---s  执行立即审核功能
#      LET l_conf_success = NULL
#      CALL s_aooi200_fin_get_slip(g_xrca.xrcadocno) RETURNING l_slip_success,l_ooba002
#      CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0031') RETURNING l_dfin0031
#  
#      IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN 
#         #190318-00028#1   add-S
#         #根据单别捞取对应的作业，azzi850检核单别所属的所有作业
#         LET l_sql = ''
#         LET l_oobl002 = ''
#         LET l_success_1 = TRUE
#         LET l_sql = " SELECT DISTINCT oobl002 ",
#                     "   FROM oobl_t ",
#                     "  WHERE ooblent = ",g_enterprise,
#                     "    AND oobl001 = '",l_ooba002,"' "
#                     
#         PREPARE axrp131_sel_oobl002_pr FROM l_sql
#         DECLARE axrp131_sel_oobl002_cur CURSOR FOR axrp131_sel_oobl002_pr 
#         FOREACH axrp131_sel_oobl002_cur INTO l_oobl002
#              
#            #捞取作业对应的程式编号
#            LET l_gzzz002 = ''
#            SELECT gzzz002 INTO l_gzzz002
#              FROM gzzz_t 
#             WHERE gzzz001 = l_oobl002
#            
#            LET g_prog = l_oobl002
#            LET g_code = l_gzzz002 
#            
#            #捞取作业&程式后，需重取权限
#            IF NOT cl_auth_user_init() THEN
#            END IF
#
#            IF NOT cl_auth_chk_act("confirmed") THEN   
#               LET l_success_1 = FALSE
#            END IF
#             
#         END FOREACH
#         
#         #任一作业无权限，则执行失败，报错
#         IF l_success_1 THEN
#       
#            
#            CALL s_axrp133_immediately_conf(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_conf_success
#         END IF
#         
#         LET g_prog = 'axrp131'
#         LET g_code = 'axrp131'        
#         #190318-00028#1   add-E
#        #CALL s_axrp133_immediately_conf(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_conf_success #190318-00028#1 mark
#      END IF 
#      
#      #151125-00006#1---add---e
#
#      #20150201#1 By zhangwei Add ---(S)---
#      #IF l_doc_success THEN  #151125-00006#1 mark by aiqq
#      IF l_doc_success AND ( (not cl_null(l_conf_success) AND l_conf_success) OR cl_null(l_conf_success) ) THEN    #151125-00006#1 add by aiqq  
#         IF cl_null(l_start_no) THEN
#            LET l_start_no = g_xrca.xrcadocno
#         END IF
#         LET l_end_no = g_xrca.xrcadocno
#         CLOSE axrp131_cl
#         CALL s_transaction_end('Y',1)
#      ELSE
#         LET l_tot_success = FALSE
#         CLOSE axrp131_cl
#         CALL s_transaction_end('N',1)
#      END IF
#      
#      #151125-00006#1---add---s  #执行立即抛砖总账传票
#      CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
#      CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-2002') RETURNING l_gl_slip
#      IF l_doc_success THEN
#         IF NOT cl_null(l_gl_slip) THEN 
#            IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN           
#                   CALL s_axrp133_immediately_gen(g_xrca.xrcald,g_xrca.xrcadocno,g_xrca.xrcasite,g_xrca.xrcadocdt,l_gl_slip)
#            END IF 
#          ELSE
#            INITIALIZE g_errparam TO NULL 
#            LET g_errparam.extend = "" 
#            LET g_errparam.code   = "axr-00987" 
#            LET g_errparam.popup  = TRUE 
#            CALL cl_err()
#         END IF
#       END IF 
#      #151125-00006#1---add---e
#      #210114-00016#1---mark----end
      LET l_doc_success = TRUE
      #20150201#1 By zhangwei Add ---(E)---

   END FOR   #20150201#1 BY zhangwei Mod FOREACH ---> FOR  
   
   #210114-00016#1---add----str
   #210120-00023#1----add---str
   IF NOT cl_null(g_xrca.xrcadocno) THEN
      SELECT ABS(SUM(xrcb103 * xrcb022)),ABS(SUM(xrcb104 * xrcb022)),ABS(SUM(xrcb113 * xrcb022)),ABS(SUM(xrcb114 * xrcb022)),
                   ABS(SUM(xrcb123 * xrcb022)),ABS(SUM(xrcb124 * xrcb022)),ABS(SUM(xrcb133 * xrcb022)),ABS(SUM(xrcb134 * xrcb022))  
        INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114, 
                   g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134     
        FROM xrcb_t
       WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald AND xrcbdocno = g_xrca.xrcadocno
        IF cl_null(g_xrca.xrca103) THEN LET g_xrca.xrca103 = 0 END IF 
        IF cl_null(g_xrca.xrca104) THEN LET g_xrca.xrca104 = 0 END IF 
        IF cl_null(g_xrca.xrca113) THEN LET g_xrca.xrca113 = 0 END IF 
        IF cl_null(g_xrca.xrca114) THEN LET g_xrca.xrca114 = 0 END IF
        IF cl_null(g_xrca.xrca123) THEN LET g_xrca.xrca123 = 0 END IF 
        IF cl_null(g_xrca.xrca124) THEN LET g_xrca.xrca124 = 0 END IF
        IF cl_null(g_xrca.xrca133) THEN LET g_xrca.xrca133 = 0 END IF 
        IF cl_null(g_xrca.xrca134) THEN LET g_xrca.xrca134 = 0 END IF
        UPDATE xrca_t SET (xrca103,xrca104,xrca113,xrca114,xrca123,xrca124,xrca133,xrca134) = (g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134) 
         WHERE xrcaent = g_enterprise 
           AND xrcald = g_xrca.xrcald 
           AND xrcadocno = g_xrca.xrcadocno
   
   END IF
   #210120-00023#1----add---end
   
   #最后一笔产生多账期
   CALL s_axrt300_installments(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_success 
   IF l_success = FALSE OR l_success = 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = g_master.xrcadocno
      LET g_errparam.code   = 'aap-00187'
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET l_doc_success = FALSE   
   END IF
   
   LET l_conf_success = NULL
      CALL s_aooi200_fin_get_slip(g_xrca.xrcadocno) RETURNING l_slip_success,l_ooba002
      CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0031') RETURNING l_dfin0031
  
   IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN 
      
         #根据单别捞取对应的作业，azzi850检核单别所属的所有作业
         LET l_sql = ''
         LET l_oobl002 = ''
         LET l_success_1 = TRUE
         LET l_sql = " SELECT DISTINCT oobl002 ",
                     "   FROM oobl_t ",
                     "  WHERE ooblent = ",g_enterprise,
                     "    AND oobl001 = '",l_ooba002,"' "
                     
         PREPARE axrp131_sel_oobl002_pr FROM l_sql
         DECLARE axrp131_sel_oobl002_cur CURSOR FOR axrp131_sel_oobl002_pr 
         FOREACH axrp131_sel_oobl002_cur INTO l_oobl002
              
            #捞取作业对应的程式编号
            LET l_gzzz002 = ''
            SELECT gzzz002 INTO l_gzzz002
              FROM gzzz_t 
             WHERE gzzz001 = l_oobl002
            
            LET g_prog = l_oobl002
            LET g_code = l_gzzz002 
            
            #捞取作业&程式后，需重取权限
            IF NOT cl_auth_user_init() THEN
            END IF

            IF NOT cl_auth_chk_act("confirmed") THEN   
               LET l_success_1 = FALSE
            END IF
             
         END FOREACH
         
         #任一作业无权限，则执行失败，报错
         IF l_success_1 THEN
            SELECT COUNT(*) INTO l_num
            FROM axrp131_tmp02
            LET l_sql = " SELECT DISTINCT xrcadocno ",
                                    "   FROM axrp131_tmp02 "
                                   
            PREPARE axrp131_sel_tmp02_pr FROM l_sql
            DECLARE axrp131_sel_tmp02_cur CURSOR FOR axrp131_sel_tmp02_pr 
            LET l_xrcadocno = ''  
            FOREACH axrp131_sel_tmp02_cur INTO l_xrcadocno
            
               CALL s_axrp133_immediately_conf(g_xrca.xrcald,l_xrcadocno) RETURNING l_conf_success
               IF (NOT cl_null(l_conf_success) AND l_conf_success) OR cl_null(l_conf_success) THEN 

               ELSE
                  LET l_doc_success = FALSE 
               END IF
      
               #  #执行立即抛砖总账传票
               CALL s_fin_get_doc_para(g_xrca.xrcald,l_xrcadocno,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
               CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-2002') RETURNING l_gl_slip
               IF l_doc_success THEN
                  IF NOT cl_null(l_gl_slip) THEN 
                     IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN           
                            CALL s_axrp133_immediately_gen(g_xrca.xrcald,l_xrcadocno,g_xrca.xrcasite,g_xrca.xrcadocdt,l_gl_slip)
                     END IF 
                   ELSE
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "axr-00987" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                  END IF
                END IF 
                LET l_xrcadocno = ''                
            END FOREACH           
         END IF
         
         LET g_prog = 'axrp131'
         LET g_code = 'axrp131'    
   END IF
   #210114-00016#1---add----end
      


   #因為是換成了FOREACH中單筆資料走事物,所以最後一筆的產生多帳期會寫彈頭失敗的話,需要删除已经commit的資料
   IF l_doc_success THEN   #20150201#1 By zhangwei Add
      CALL s_transaction_begin()  #20150201#1   By zhangwei Add
      LET l_cnt = 0 
      SELECT COUNT(*) INTO l_cnt FROM xrcb_t
       WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald AND xrcbdocno = g_xrca.xrcadocno 
      IF l_cnt > 0 THEN  
         SELECT ABS(SUM(xrcb103 * xrcb022)),ABS(SUM(xrcb104 * xrcb022)),ABS(SUM(xrcb113 * xrcb022)),ABS(SUM(xrcb114 * xrcb022)),
                ABS(SUM(xrcb123 * xrcb022)),ABS(SUM(xrcb124 * xrcb022)),ABS(SUM(xrcb133 * xrcb022)),ABS(SUM(xrcb134 * xrcb022))  
           INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114, 
                g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134     
           FROM xrcb_t
          WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald AND xrcbdocno = g_xrca.xrcadocno
         IF cl_null(g_xrca.xrca103) THEN LET g_xrca.xrca103 = 0 END IF 
         IF cl_null(g_xrca.xrca104) THEN LET g_xrca.xrca104 = 0 END IF 
         IF cl_null(g_xrca.xrca113) THEN LET g_xrca.xrca113 = 0 END IF 
         IF cl_null(g_xrca.xrca114) THEN LET g_xrca.xrca114 = 0 END IF
         IF cl_null(g_xrca.xrca123) THEN LET g_xrca.xrca123 = 0 END IF 
         IF cl_null(g_xrca.xrca124) THEN LET g_xrca.xrca124 = 0 END IF
         IF cl_null(g_xrca.xrca133) THEN LET g_xrca.xrca133 = 0 END IF 
         IF cl_null(g_xrca.xrca134) THEN LET g_xrca.xrca134 = 0 END IF
         UPDATE xrca_t SET (xrca103,xrca104,xrca113,xrca114,xrca123,xrca124,xrca133,xrca134) = (g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134) 
          WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
         IF SQLCA.SQLCODE THEN
           #LET g_success = 'N'         #20150201#1 By zhangwei Mark
            LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
         END IF
         SELECT COUNT(DISTINCT xrcb002) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise
            AND xrcbdocno = g_xrca.xrcadocno AND xrcbld = g_xrca.xrcald
         IF l_count > 1 THEN
            UPDATE xrca_t SET xrca018 = ''
             WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
         END IF
         CALL s_axrt300_installments(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_success 
         IF l_success = FALSE OR l_success = 'N' THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = g_master.xrcadocno
            LET g_errparam.code   = 'aap-00187'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
           #LET g_success = 'N'         #20150201#1 By zhangwei Mark
            LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
         END IF
       # IF g_conditions.check3 = 'Y' THEN
       #    CALL s_axrt300_confirm(g_master.xrcald,g_xrca.xrcadocno) RETURNING l_success
       #    IF l_success = 'N' THEN LET g_success = 'N' END IF
       #    UPDATE xrca_t SET xrcastus = 'Y'
       #     WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
       #    IF SQLCA.SQLCODE THEN LEt g_success = 'N' END IF
       # END IF
         #20150201#1 By zhangwei Add ---(S)---
         IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' THEN
            CALL s_pre_voucher_ins('AR','R10',g_glaa.glaald,g_xrca.xrcadocno,g_xrca.xrcadocdt,'1') RETURNING l_success
            IF NOT l_success THEN
               LET l_doc_success = FALSE
            END IF
         END IF
         IF NOT l_doc_success THEN

            IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' THEN
               CALL s_pre_voucher_del('AR','R10',g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_success
            END IF

            FOREACH axrp131_bak_curs USING g_xrca.xrcadocno INTO l_xrcb002,l_xrcb003,l_xrcb007
               CASE
                  WHEN l_s = '1'
                     UPDATE xmdl_t SET xmdl053 = xmdl053 - l_xrcb007
                      WHERE xmdldocno = l_xrcb002
                        AND xmdlseq = l_xrcb003
                        AND xmdlent = g_enterprise
                  WHEN l_s = '2'
                     UPDATE xmdl_t SET xmdl054 = xmdl054 - l_xrcb007
                      WHERE xmdldocno = l_xrcb002
                        AND xmdlseq = l_xrcb003
                        AND xmdlent = g_enterprise
                  WHEN l_s = '3'
                     UPDATE xmdl_t SET xmdl055 = xmdl055 - l_xrcb007
                      WHERE xmdldocno = l_xrcb002
                        AND xmdlseq = l_xrcb003
                        AND xmdlent = g_enterprise
               END CASE
            END FOREACH
            DELETE FROM xrca_t WHERE xrcadocno = g_xrca.xrcadocno AND xrcaent = g_enterprise
            DELETE FROM xrcb_t WHERE xrcbdocno = g_xrca.xrcadocno AND xrcbent = g_enterprise
            DELETE FROM xrcd_t WHERE xrcddocno = g_xrca.xrcadocno AND xrcdent = g_enterprise
            DELETE FROM xrce_t WHERE xrcedocno = g_xrca.xrcadocno AND xrceent = g_enterprise
            DELETE FROM xrde_t WHERE xrdedocno = g_xrca.xrcadocno AND xrdeent = g_enterprise
            DELETE FROM xrcf_t WHERE xrcfdocno = g_xrca.xrcadocno AND xrcfent = g_enterprise
         END IF
         #CALL s_transaction_end('Y',1)  #180109-00029#1 mark
         CALL s_transaction_end('Y',0)  #180109-00029#1 add 不提供讯息提示
         #20150201#1 By zhangwei Add ---(E)---
      END IF
   END IF   #20150201#1 By zhangwei Add

 

  #20150201#1 By zhangwei Mark ---(S)---
  #IF g_success = 'N' THEN
  #   CALL s_transaction_end('N',1)
  #   CALL cl_err_collect_show()
  #   RETURN
  #ELSE
  #   CALL s_transaction_end('Y',1)
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.code = 'asf-00251'
  #   LET g_errparam.replace[1] = l_start_no
  #   LET g_errparam.replace[2] = l_end_no
  #   LET g_errparam.extend = ''
  #   LET g_errparam.popup = TRUE
  #   CALL cl_err()
  #
  #   CALL cl_err_collect_show()
  #   CALL s_transaction_end('Y',1)
  #END IF
  #20150201#1 By zhangwei Mark ---(E)---
  #20150201#1 By zhangwei Add ---(S)---
   IF NOT cl_null(l_start_no) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00251'
      LET g_errparam.replace[1] = l_start_no
      LET g_errparam.replace[2] = l_end_no
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF
   
   LET g_strno = l_start_no  #200302-00005#10 add
   LET g_endno = l_end_no    #200302-00005#10 add
   
   IF l_tot_success AND NOT cl_null(l_start_no) THEN #全部資料都正確
      CALL cl_err_collect_show()
   ELSE
      CALL cl_err_collect_show()
   END IF
  #20150201#1 By zhangwei Add ---(E)---

END FUNCTION

################################################################################
# Descriptions...: sub產生的數據集轉換
# Memo...........: DSCNJ,DSCTP,DSCTC --> ('DSCNJ','DSCTP','DSCTC')
# Usage..........: CALL axrp131_get_ooef001_wc(p_wc)
#                  RETURNING r_wc
# Input parameter: p_wc           sub产生的数据集
# Return code....: r_wc           SQ可用的数据集
# Date & Author..: 2014/10/13 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp131_get_ooef001_wc(p_wc)
   DEFINE p_wc       STRING
   DEFINE r_wc       STRING
   DEFINE tok        base.StringTokenizer
   DEFINE l_str      STRING

   LET tok = base.StringTokenizer.create(p_wc,",")
   WHILE tok.hasMoreTokens()
      IF cl_null(l_str) THEN
         LET l_str = tok.nextToken()
      ELSE
         LET l_str = l_str,"','",tok.nextToken()
      END IF      
   END WHILE   
   LET r_wc = "('",l_str,"')"
   
   RETURN r_wc

END FUNCTION
################################################################################
# Descriptions...: 依據客戶編號獲取默認值
# Memo...........:
# Usage..........: CALL axrp131_xrca004_ref()
#                  RETURNING r_xrca.*
# Input parameter: 
# Return code....: r_xrca         返回默认值
# Date & Author..: 2014/10/13 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp131_xrca004_ref(p_xrca100)
DEFINE p_xrca100      LIKE xrca_t.xrca100
DEFINE l_site         LIKE xrca_t.xrcasite
DEFINE l_ooba002      LIKE ooba_t.ooba002
DEFINE l_success      LIKE type_t.num5
DEFINE l_pmab085      LIKE pmab_t.pmab085
DEFINE l_oodbl004     LIKE oodbl_t.oodbl004
DEFINE l_oodb011      LIKE oodb_t.oodb011
#DEFINE l_ooib         RECORD LIKE ooib_t.* #161128-00061#3--mark
DEFINE r_xrca         RECORD
          xrca005     LIKE xrca_t.xrca005,
          xrca006     LIKE xrca_t.xrca006,
          xrca007     LIKE xrca_t.xrca007,
          xrca008     LIKE xrca_t.xrca008,
          xrca009     LIKE xrca_t.xrca009,
          xrca010     LIKE xrca_t.xrca010,
          xrca011     LIKE xrca_t.xrca011,
          xrca012     LIKE xrca_t.xrca012,
          xrca013     LIKE xrca_t.xrca013,
          xrca014     LIKE xrca_t.xrca014,
          xrca015     LIKE xrca_t.xrca015,
          xrca046     LIKE xrca_t.xrca046,
          xrca058     LIKE xrca_t.xrca058,
          xrca061     LIKE xrca_t.xrca061,
          xrca100     LIKE xrca_t.xrca100,
          xrca101     LIKE xrca_t.xrca101,
          xrca121     LIKE xrca_t.xrca121,
          xrca131     LIKE xrca_t.xrca131
                      END RECORD
#150518-00044#5
DEFINE ls_js         STRING
DEFINE lc_param      RECORD
         apca004     LIKE apca_t.apca004,
         sfin2009    LIKE type_t.chr1     #151012-00014#1 add lujh
                 END RECORD
#150518-00044#5
DEFINE l_cnt      LIKE type_t.num5      #160505-00005#1
DEFINE l_xrcacomp LIKE xrca_t.xrcacomp  #160505-00005#1

   #新增/修改帳款對象後,依帳款對象更新客戶慣用資料
   
   ################################################
   #      STEP1-7 欄位取用原則:
   #      依帳務人員所屬 site  取出該客戶的相關欄位
   #      若取不到時再取 xrcacomp =pmabsite  為條件取  
   ################################################  

   #160505-00005#1# add--str--
   #检查是否抛转据点，若没则抓取pmabsite=ALL的相关栏位资料
   LET l_cnt = 0
   LET l_xrcacomp = NULL
   SELECT COUNT(*) INTO l_cnt FROM pmab_t WHERE pmabent = g_enterprise AND pmabsite = g_xrca.xrcacomp AND pmab001 = g_xrca.xrca004
   IF l_cnt = 0 THEN 
      LET l_xrcacomp = "ALL" 
   ELSE
      LET l_xrcacomp = g_xrca.xrcacomp   
   END IF
   #160505-00005#1# add--end--

   SELECT DISTINCT ooag004 INTO l_site
     FROM ooag_t
    WHERE ooag001 = g_user AND ooagstus ='Y' 
      AND ooagent = g_enterprise #160905-00007#3 add
   
   #STEP1.獲取交易對象簡稱
   
   #STEP2.帶出主要應收條件
   SELECT pmab087 INTO r_xrca.xrca008 FROM pmab_t
    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp

   #STEP3.帳款類別
   SELECT pmab105 INTO r_xrca.xrca007 FROM pmab_t
    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp
   
   #STEP4.業務人員/業務部門
   SELECT pmab081 INTO r_xrca.xrca014 FROM pmab_t
       WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp
   SELECT ooag003 INTO r_xrca.xrca015 FROM ooag_t
    WHERE ooagent = g_enterprise AND ooag001 = r_xrca.xrca014
   
   #STEP5.稅別/含稅否/稅率
   SELECT pmab084 INTO r_xrca.xrca011 FROM pmab_t
    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004   #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp
   CALL s_tax_chk(g_glaa.glaacomp,r_xrca.xrca011) RETURNING l_success,l_oodbl004,r_xrca.xrca013,r_xrca.xrca012,l_oodb011
   
   #STEP6.慣用幣別/匯率
   LET r_xrca.xrca100 = p_xrca100
   IF cl_null(r_xrca.xrca100) THEN
      LET r_xrca.xrca100 = g_glaa.glaa001
   END IF
   ##計算各個本位筆匯率
   #CALL s_axrt300_get_exrate(g_xrca.xrcadocdt,g_xrca.xrcald,g_xrca.xrcacomp,r_xrca.xrca100)    #150518-00044#5--Mark
   #   RETURNING l_success,r_xrca.xrca101,r_xrca.xrca121,r_xrca.xrca131                         #150518-00044#5--Mark
   
   #150518-00044#5--(S)
   LET lc_param.apca004 = g_xrca.xrca004  
   LET lc_param.sfin2009 = g_master.b_comb1     #汇率基准   #151012-00014#1 add lujh
   LET ls_js = util.JSON.stringify(lc_param)
   CALL s_fin_get_curr_rate(g_xrca.xrcacomp,g_xrca.xrcald,g_xrca.xrcadocdt,r_xrca.xrca100,ls_js)
      RETURNING r_xrca.xrca101,r_xrca.xrca121,r_xrca.xrca131
   #150518-00044#5--(E)
   
   #STEP7.預開發票日
   SELECT pmab083 INTO l_pmab085 FROM pmab_t
    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp

   IF NOT cl_null(l_pmab085) THEN
      IF l_pmab085 = '30' THEN
         #月結彙總開立發票
         IF MONTH(g_xrca.xrcadocdt) = 12 THEN
            #立帳日期為12月份,則依照條件開立發票日為12月31號
            LET r_xrca.xrca061 = MDY(12,31,YEAR(g_xrca.xrcadocdt))
         ELSE
            #立帳日期的下一個月減一天
            LET r_xrca.xrca061 = MDY(MONTH(g_xrca.xrcadocdt) + 1,1,YEAR(g_xrca.xrcadocdt)) - 1
         END IF
      ELSE
         LET r_xrca.xrca061 = g_xrca.xrcadocdt
      END IF
   END IF

   #SETP8.收款客戶   
   SELECT pmac002 INTO r_xrca.xrca005 FROM pmac_t
    WHERE pmacent = g_enterprise AND pmac001 = g_xrca.xrca004 
      AND pmac003 = '1' AND pmac004 = 'Y' AND pmacstus = 'Y'
   IF SQLCA.sqlcode = 100 THEN
      LET r_xrca.xrca005 = g_xrca.xrca004
   END IF
      
   #SETP9.關係人   
   #SELECT pmaa047 INTO r_xrca.xrca046 FROM pmaa_t #191227-00043#1 mark
   SELECT pmaa047,pmaa090 INTO r_xrca.xrca046,r_xrca.xrca006 FROM pmaa_t #191227-00043#1 add
    WHERE pmaaent = g_enterprise AND pmaa001 = g_xrca.xrca004     

   #SETP10.慣用銷售分類取
   SELECT pmab089 INTO r_xrca.xrca058 FROM pmab_t
    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# l_site--->l_xrcacomp
    
   #191227-00043#1 mark(s)
   #SETP11.客戶分類
   #SELECT pmab090 INTO r_xrca.xrca006 FROM pmab_t
   # WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# l_site--->l_xrcacomp
   #191227-00043#1 mark(e)
   RETURN r_xrca.*

END FUNCTION

#end add-point
 
{</section>}
 
