#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="axrp132.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0143(2020-11-23 15:37:16), PR版次:0143(2021-04-26 11:28:37)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000516
#+ Filename...: axrp132
#+ Description: 發票批次立帳作業
#+ Creator....: 01727(2014-10-13 10:29:12)
#+ Modifier...: 08172 -SD/PR- 08172
 
{</section>}
 
{<section id="axrp132.global" type="s" >}
#應用 p01 樣板自動產生(Version:23)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#20150201#1                   By zhangwei 為了規避多用戶並行執行程序導致出貨/銷退單重複拋磚應收,對拋轉邏輯進行修改：
#                                         取得符合條件的資料集後,在FOREACH中每一筆資料單獨走一次事物
#                                         在事物中,先將取得的出貨/銷退單鎖住,然後再進行拋轉前的欄位複製
#                                         最後再插入應收表之前，再次判斷出貨單/銷退單的可用性
#                                         在拋轉應收結束後無論成功否放開出貨單/銷退單資料
#                                         最後將失敗的資料和成功的資料用資料匯總報錯出來
#150316-00013#1               By 01727    直接沖帳段可用金額的取得,需要再扣除已沖帳未審核的金額
#150515-00013#3               By 01727    檢查， 若為本位幣立帳者，本幣金額=原幣金額， 本幣不要重算s_tax
#150603-00046#1               By Reanna   增加aist310呼叫接收的變數
#150518-00039#4               By albireo  增加aisp320呼叫階收的參數
#150807-00010#1   2015/08/10  By Belle    若為axmt600的金額折讓xrcb021取理由碼的會科
#1508170001       2015/08/17  By Belle    Kris:axsrp132  折襄單時, 應取銷貨退回的會科
#150904-00006#3   150907      By albireo  商用發票號碼欄位帶入
#150918-00001#7   150922      By albireo  商用發票號碼有值的時候代表是外銷 把單頭發票號碼也用商用發票號碼取代
#150828-00001#2   2015/10/23  By 01727    axrt3* 的程式 xrcb005 存品名加規格, 中間以 '/' 區間
#151013-00019#7   2015/10/28  By Reanna   銷退方式改1&4都要先用理由碼取會科
#150615-00017#2   2015/10/30  By 01727    對帳單已立應收帳款單的判斷, 取對帳單主檔的"應收單號"判斷。
#151125-00006#1   2015/12/05  By 06862    生成后單據后立即審核，立即拋轉傳票
#151214-00018#1   2015/12/14  By 01727    AXR 應取 aist310 單身形成不再重計稅額
#151130-00015#3   2015/12/29  By 01727    訂金沖銷依aoos020 參數 S-FIN-2020  是否依單核銷訂金 則只能沖同一張訂單之訂金
#160125-00005#4   2016/01/27  By 01727    axrp132/ axrp133 取消以單頭稅別為 group 的條件,若依單據彙總則取單據稅別, 
#                                         其他彙總條件則 xrca 單頭稅別帶交易對象慣用稅別
#151231-00010#9   2016/03/04  By 02599    增加控制组权限控管
#150518-00046#5   2016/03/09  By Jessy    增加aisp340呼叫接收的程式段
#160317-00018#1   2016/03/18  By 01727    1.axrp132转axrt300,axrt300单身的来源组织应该取aist310单身的来源组织，目前是取的法人
#                                         2.多账期xrcc,发票号码没有抓进来(isat004)
#                                         3.未回写aist310 应收单号
#160120-00011#3   2016/03/23  By 02114    1.取用 s_get_item_acc時, 須增加補足可傳入的參數值 
#                                         (1). AXR:取用s_get_item_acc時, 須增加補足可傳入的參數值 
#                                         p_kind   採購分群  :  取單頭的 【銷售分類xrca058】 
#                                         p_trade  交易通路  :  傳入渠道, 取單身的【渠道xrcb034】 
#                                         p_site   營運據點  :  不變 #                  
#                                         p_ware   倉庫別    :  取來源單號的庫別欄位, 即出貨/銷退單的【庫別xmdl014】;  無對應來源單號者，則以空白傳入。
#160318-00005#51  2016/03/23  By 07959    將重複內容的錯誤訊息置換為公用錯誤訊息
#160325-00023#1   2016/03/29  By Hans     單別流程-預設單別修改 根據aooi210設置之流程修改單別合理性
#160318-00025#42  2016/04/25  By pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160505-00005#1   2016/05/06  By 01531    取法人據點之交易對象檔,若取不到法人據點時, 取 據點代碼='ALL'
#160511-00016#1   2016/05/11  By 01531    生成的单据单身冲暂估否为空
#160415-00010#1   2016/05/18  By albireo  有在發票歷程檔中有效發票才撈出的控制
#160426-00013#1   2016/05/30  By Reanna   增加訂金發票流程
#160620-00010#3   2016/06/21  By 06821    對帳來源若選2.雜項發票,應收單別開立應為axrt330,QBE單號開窗條件組入,自動沖銷選項皆不勾選
#151008-00009#8   2016/06/23  By 03538    有設定對應的遞延類型,則要產生遞延收入檔,並且影響分錄底稿
#160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01
#160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01
#160810-00015#1   2016/08/10  By 01727    应该在写入单身xrcb之前给xrcb023赋值,然后在产生xrcb资料之后产生多帐期
#160810-00043#1   2016/08/15  By 01727    在整批复制xrcd资料是,要给账套栏位复制
#160731-00372#1   2016/08/16  By 07900    客户开窗不要开供应商
#160811-00009#4   2016/08/19  By 01531    账务中心/法人/账套权限控管
#160830-00047#1   2016/08/30  BY 01727    axrp13*抛转应收单据没有给单身xrcb102默认值
#160826-00004#1   2016/09/01  By 00768    事务中有进行临时表的drop等异动导致事务破坏，导致数据的异常
#160905-00007#3   2016/09/05  By zhujing  调整系统中无ENT的SQL条件增加ent
#160909-00084#1   2016/09/12  By 01727    将146主机修改的内容追回产中
#160914-00013#1   2016/09/20  By 01727    匯率選項預設為:依原單匯率, 並隱藏
#160920-00004#1   2016/09/21  By 01727    axrp132自动产生到axrt300的冲暂估信息明细有多笔，通过整批删除/整批产生就OK了
#160913-00017#7   2016/09/22  By 07900    AXR模组调整交易客商开窗
#160802-00007#1   2016/09/26  By 01727    一次性交易對象識別碼(pmaa004=2)功能應用
#160912-00034#1   2016/09/28  By 02114    aist310转应收到axrt300时项目编号、WBS没有生成
#160921-00018#1   2016/10/10  By 01727    计算应收款日和票到期日日期使用错误
#160920-00013#1   2016/10/11  By 08171    1.新增對帳來源 5.雜項待抵SCC 9715
#                                         2.發票類型則為 aisi030 進銷項為4:銷項折讓證明單資料
#                                         3.應收帳款串查為 axrt341
#                                         axrp132 當對帳來源為 5.雜項待抵時產生到 axrt341,xrca001 為 29,其他維持原對應關係
#161014-00046#1   2016/10/17  By Reanna   處理銷退單依照不同銷退方式抓取axri011的會科
#161021-00050#2   2016/10/24  By 08729    處理組織開窗
#161025-00017#1   2016/10/26  By 01531    出货单axmt540的销售渠道xmdk030需带入应收单身的渠道xrcb034 
#160922-00055#2   2016/11/08  By 06821    aist310整單操作產生應收帳款時,請將對帳來源作為 axrp132 對帳來源預設值
#161110-00009#1   2016/11/18  By 01727    axrp132抛转至axrt310时,来源记录12
#161117-00043#1   2016/11/18  By 01727    執行axrp132時,產生axrt300,其發票號碼的欄位帶的是aist310商用發票的值
#161118-00026#1   2016/11/22  By 01727    1.若透過 aist310 整單操作呼叫 axrp132 時,單別開窗無資料問題處理
#                                         2.對帳來源為 1.出貨發票時,整單操作呼叫 axrp132 時自動沖銷選項的訂金待抵不可自動打勾. 應開放人為決定
#                                         3.若 aist310 為出貨發票時, 單身對應的 27待抵單 若有微調金額,請以微調後的金額作為產生 axrt300 的直接沖帳金額
#161111-00049#6   2016/11/24  By 01727    控制组权限修改
#161114-00028#1   2016/11/30  By 01727    新增单身时,每次科目赋值之前都需要清空科目编号的值
#161128-00061#3   2016/12/01  by 02481    标准程式定义采用宣告模式,弃用.*写法
#161205-00014#1   2016/12/05  By Reanna   axrt300的商用發票號碼應放aist310上的商用發票號碼
#161219-00031#1   2016/12/19  By 02114    没有发票号码时,就用IV号（商业发票)
#170112-00010#1   2017/01/12  By 02114    axrp132不同ent下有相同单据,产生到axrt330时会把所有ent下的单据都产生到axrt330单身
#170222-00007#1   2017/02/22  By 02599    当整张应收账款单产生完，再产生冲暂估资料
#170225-00002#1   2017/03/02  By 02599    修改产生应收账款单的事务时机，程式优化
#170301-00023#11  2017/03/08  By 09256    "為因應行業包，g_prog整批調整加上'*'
#170306-00026#1   2017/03/09  By 07900    通过axrp132产生到axrt300资料不正确。
#                                         1.第二单头的【销售分类】未带出；
#                                         2.第二单头的【其他本位币】页签的本币未带出，后面金额也不正确
#161102-00015#2   2017/03/14  By 06821    未啟用的核算項要放一個空白存檔
#170307-00079#1   2017/03/16  By Reanna   4.原收款條件取對象檔，更改為取對帳單aist310單頭，單身收款條件取單頭，不同收款條件者，GROUP分開立帳
#170313-00054#1   2017/03/21  By 01531    通过axrp132抛到axrt300的单据审核报错
#170310-00028#1   170325      By albireo  銷退單身科目應與單頭有相同的判斷邏輯
#170321-00125#1   2017/03/25  By 01531    2.當 xrca016 為 12:銷項發票 時,並未回寫 axmt500 的應收帳款(xmdb007),主帳套立帳未稅金額(xmdb008),主帳套立帳含稅金額(xmdb009) 
#170406-00069#1   2017/04/06  By 01531    根据S-FIN-2022参数来回写axmt500资料
#170413-00030#2   170413      By albireo  複製的XRCD需先取aisi070科目後再判斷是否為空用axri011抓取
#160908-00003#3   2017/04/18  By Reanna   開放出貨單已確認未過帳可開立發票，但不可產生立帳單(須待出貨過帳才可立帳)
#170418-00005#1   2017/04/20  By 05795    客戶對帳單已轉應收后，在转需管控
#170419-00022#1   170419      By albireo  彙總條件為1依單號時,立帳日直接抓原單對帳單日期
#170503-00044#1   2017/05/05  By 01531    axrp132发票立账优化（五芳斋单号c170502-017#1回收产品）
#170525-00086#1   170531      By albireo  判斷產的不是axrt341  axrt340時的21銷退單,取收入科目時用料件取用科目
#170601-00039#1   2017/05/02  By 02114    aist310汇总产生应收单时,只会回写第一笔aist310的应收单号栏位
#170605-00061#1   2017/06/07  By Reanna   因為簽收單狀態只有Y沒有S，所以要調整SQL的where條件，不然只要是簽收單的aist310都無法立帳
#170601-00037#1   2017/06/22  By Sabrina  彙總方式若選"4：業務部門"則抓資料時要控卡isaf004 is not null 
#170627-00002#1   170627      By albireo  增加對出貨單單身lock的動作
#170630-00049#1   170703      By albireo  g_isaf_d重複執行未清空造成可以重複拋轉;若大資料時,僅有其他加項減項的單據拋轉帳款,
#                                         也需在新增前控制是否對帳單已有帳款單
#170522-00024#1   170705      By 06821    畫面增加選項: 跨期未暫估者可立帳 ,預設為 Y  2.跨期未暫估者可立帳 Y :  來源對帳單日期 小於等於單據日期 ; N : 入庫/倉退來源單 已立暫估量pmdt066 >0  且 其扣帳日期 之月份<> 立帳日期
#170712-00047#1   170712      By 06821    延續#170522-00024#1 調整, 當來源單號扣帳日期與執行批次單據日期為相同年月, 則不須檢核是否為暫估可立帳,  符合條件則可執行拋轉
#170706-00034#1   17/07/24    By 09232    aist310对账单 “整单操作” 转订金应收作业 打开axrp132 批次抛砖作业，当已抛砖过得资料不可再二次抛砖。
#170426-00060#1   2017/07/25  By 01531    根據aooi200單別預設账款类别
#170718-00043#1   2017/07/27  By 09232    将元件s_control_get_customer_sql_pmab('4',g_site,g_user,g_dept,'',g_xrca_m.xrcacomp) 第一个参数4改为2
#170325-00043#1   2017/08/11  By 01531    1.當 aist310 單身來源類型為 16:沖其他應收暫估 時,產生至 axrt330 單身同來源類類型(19)並自動新增 xrcf_t 中
#                                         2.當 aist310 單身來源類型為 26:其他待抵暫估   時,產生至 axrt341 單身同來源類類型(29)並自動新增 xrcf_t 中
#170825-00043#1   2017/09/07  By 09771    通过aisp320, axrp132:  isaf066 商用發票號碼 必須轉到到AR  商用發票號碼xrca021
#170811-00036#1   2017/09/11  By 01531    產生沖暫估資訊的元件s_axrp130_ins_xrcf在sub中呼叫s_axrp130_create_tmp(),CREATE TEMP TABLE的語法,會造成問題後續有事務問題
#                                         将CALL s_axrp130_create_tmp()写入主作业中。
#170814-00012#34  2017/09/13  By 10044    開窗q_ooeg001_4與q_ooeg001 內容相同,整批修改
#170913-00066#1   2017/09/25  By 05795    当QBE没有设置条件的时候，需要提示
#170713-00063#21  2017/09/26  By 10042    修改校驗帶值出現的錯誤訊息(v_oocq)
#171005-00012#2   2017/10/06  By 06821    AR單據拋轉自由核算項預帶設定值(agli043)
#170916-00004#1   2017/10/12  By 09505    S-FIN-2012 :不含稅立暫估不應出現在這兒,按要求mark掉
#171013-00025#1   2017/10/13  By 06821    aist310 發票拋轉至axrt300應收時, 出口報單號碼應一併帶入
#171102-00016#1   2017/11/08  By 07900    axrp132应增加管控：未过账的销退单和出货单皆不允许进行立账
#170413-00024#2   2017/11/16  By 01531    axrt300的單身xrcb010業務部門取值：axrp132  非依【业务人员汇总】时，則單身部門取值時，
#                                         有訂單時xrcb 單身取出貨單對應訂單上業務人員及部門，無訂單時取出貨單上的人員及部門。
#171212-00027#1   2017/12/15  By 09773    1、汇总条件=1依开票单号时，P作业中立账日期非必填，当立账日期为空时，生成账款单单据日期以aist310单据日期为准；否则以P作业中立账日期为准；
#                                         2、汇总条件<>1时，P作业中立账日期必填，生成账款单单据日期以P作业中立账日期为准
#180105-00048#1   2018/01/08  By 05795    如果出货单有项目编号，走aist310-axrp132-axrt300时，项目编号不会自动带出
#180109-00024#1   2018/01/09  By 00537    调整判断参数的顺序，先判断是否抛总账，再检查总账单别是否设定了
#180109-00028#1   2018/01/10  By 09232    将axmt500专案编号和WBS编号带到axr应收账款作业的核算项页签专案编号和WBS编号栏位中
#171013-00004#3   2018/03/05  By 07900    将 s_axrt300_item_acc 替换成 s_get_item_acc，原有逻辑不变.
#180130-00001#1   2018/03/13  By 01531    7.axrt300由aist310订金发票通过axrp132生成的单据，单头来源作业类型与参考单号不匹配，来源类型是订单，参照单号是aist310的单号（正常出货发票生成的axrt300单头来源类型是12销项发票）
#171229-00043#2   2018/03/16  By 07900    全AP AR 帳務單對帳單,只要選取單頭的收付款條件有用到入庫或出貨扣帳日選項且單身有入庫出貨等來源單據,
#                                         一重新登打完單身離開時詢問是否重新推算應付款日與到期日與重新展算多帳期
#180329-00029#1   2018/05/16  By 09773     1.畫面增加批次立帳作業增加"單價為0是否立帳"的選項欄位
#                                          2.程式添加對批次作業的過濾
#180509-00055#2   2018/05/22  By 10043    整批調整 s_aooi210_get_check_sql 傳參值
#180529-00058#1   2018/05/30  By 05795    纠正#170418-00005#1单子的一个错误
#180529-00020#1   2018/06/13  By 09232    请去掉axrp132自动冲销选项中“预收待抵”
#180531-00020#2   2018/06/20  By 01531    1.axrp132画面增加radio，1.依發票金額立帳 2.依對帳金額立帳,默认1;当防伪税控=Y时显示，隐藏checkbox檢核須已登錄發票,反之增加的radio不显示
#180718-00016#1   2018/07/18  By 10983    axrp132抛转时，对单身xrcb053，xrcb054进行赋值。
#180723-00059#1   2018/07/24  By 05634    4:待抵銷退,產生到axrt340,依照發票資訊(isat)給單頭發票號碼(xrca066),多發票則給予"MULTI"
#180531-00020#8   2018/07/25  By 01531    防伪税控：抓取xrcb资料时要排除作废
#180731-00006#1   2018/08/01  By 09232    商用發票號碼回寫機制調整:2.由axrp132匯整產生axrt300,axrp132 拆單group by條件加上 商用編號isaf066.
#180808-00070#1   2018/08/10  By 06189    透過axrp132產生axrt310時,回寫訂單的含稅金額應為原幣而非本幣.
#180731-00017#33  2018/08/16  By 11387    修改日期格式
#180919-00058#1   2018/09/20  By 05795    当为isaf056 = 2 得时候 如果isaf011(发票号码)为空则取isag014  如果不为空则取isaf011
#180823-00036#1   2018/09/28  by 08172    1.通过aist310整单操作-转应收，开启axrp132时，若对账来源为4/5待抵性质，自动冲销选项应灰掉
#                                         2.通过aist310整单操作-转应收，开启axrp132时，预设立账日期为对账日期
#180928-00002#1   2018/09/29  By 01531    銷貨收入科目抓取agli161時,銷售分類帶入條件的預設如下:
#                                         帳款單頭銷售分類(可為空),維持由對象預設的銷售分類(可為空)帶入.
#                                         單身取銷貨收入科目抓取agli161時,銷售分類抓取順序:
#                                         1.有來源單據:取來源單上的銷售分類(可為空)-->帳單頭銷售分類(可為空)
#                                         2.雜項(無來源單據):帳單頭銷售分類(可為空)
#180705-00083#1   2018/10/10  by 08172    1.单身其他信息页签账款对象,收款对象,业务人员,业务部门为空时给单头
#                                         2.依账款科目+收入科目+税额科目所启用的固定核算项并集，取该固定核算项在agli051的设定值为默认值
#                                         3.依账款科目+收入科目+税额科目所启用的自由核算项并集，取该自由核算项在agli043的设定值为默认值
#181001-00015#88  2018/10/30  by 08172    修正ent
#181227-00033#1   2018/12/28  By 09232    判断账款对象的“法人类型” 如果是“一次性交易对象或员工” xrca057给xmdk047的值否则给xrca004
#180509-00055#2   2018/05/22  By 10043    整批調整 s_aooi210_get_check_sql 傳參值
#190103-00017#1   2019/01/03  By 05016    過欄位/執行時 控卡無維護會計週期參照表 
#180821-00038#10  2019/01/14  By 01531    畫面日期為空時，agli100存在年度期別時，執行報錯agl-00211;
#                                         产生axrt300单身本币单价未取位
##190131-00004#1  2019/02/11  By 05795    检查出货单是不是立暂估了但是暂估单没有审核
#180920-00015#3   2091/02/25  By 11384    對帳單產生至帳款單時,單身來源類型為19,29時, 則品名應帶入到AR帳款單身的品名.
#190423-00042#8   2019/05/24  By 11384    当单身来源项目编号/WBS编号有值时,将isag022/isag023帶入xrcb015/xrcb016
#190812-00010#5   2019/09/11  By 01531    axrp13 * 抓取收入科目時取 agli161 若有設銷售分群時, 以銷售分群取科目
#190930-00018#1   2019/09/30  By 05795    #已出货尚未开立销项发票者,处理模式2:计入一般应收,不可执行axrp132
#190305-00001#3   2019/10/24  By 10500    若【来源作业类型】=21.销退单 则【收入科目xrcb021】根据仓退类型优先抓取agli161【仓退/销货退回科目glcc023】【进货金额折让/金额折让科目glccc024】栏位值
#190729-00018#1   2019/11/18  by 08172    重新整理报错逻辑
#190808-00007#1   2019/12/04  by 08172    自动冲销选项全部默认为N然后隐藏隐藏自动冲销选项
#190423-00042#32  2019/12/09  By 01531    aist310单身19:其他加項+或29:其他加項-整单操作[转应收作业]axrp132时需考虑有维护时应将项案编号isag022及WBS编号isag023 更新到对应的项案编号xrcb015及WBS编号xrcb016
#191227-00043#1   2019/12/30  By 08729    將客戶分類由axmm200帶出，但如果agli051有維護則為優先
#191030-00020#1   2020/01/03  By 08729    將品牌分類由aimm200帶出，但如果agli051有維護則為優先
#180827-00015#1   2020/01/03  By 01531    AR有開一個xrcb048的[客戶訂購單號], 但在產生時, 沒有給值進來應自動帶入訂單號
#200111-00003#1   2020/01/16  By 11234    修正axrp132抛转立账单发票日抓成了对账单中的单据日期的问题
#200302-00023#1   2020/03/09  By 13656    应收单别和账款类别在选择后带出说明
#200302-00005#10  2020/03/16  By 13132    整批调整批次完成后串查功能
#200331-00017#1   2020/03/31  By 05795    账款单直接冲账单号带得有误
#200317-00037#1   2020/04/03  By 01531    出货单将费用性料件的【备注】xmdl051生成至品名规格xrcb005
#190318-00028#6   2020/04/22  By 10500    在直接审核(D-FIN-0031='Y')前加上对权限的判断
#200527-00024#1   2020/05/28  By 08729    因應T100稅控己改版處理 所以將180531-00020修改段mark
#200601-00017#1   2020/06/01  By 05795    项目编号需要和对账单一样
#200528-00023#1   2020/06/01  By 05488    稅控相關邏輯修改
#200605-00094#1   2020/06/29  By 13656    创建未建立的临时表
#200902-00059#1   2020/09/09  By 08729    根據出貨單上的銷售分類回寫到單頭(如果單身多筆出貨單的銷售分類都不同就不回寫)
#201023-00028#3   2020/11/23  by 08172    增加货票同行否，出货发票+货票同行Y时抛转axrt330
#201023-00028#5   2020/11/23  by 08172    货票同行时，产生axrt330，单身额外新增一笔金额为其余单身未税金额合计的29.其他减项资料
#201208-00025#1   2020/12/08  By 11234    修改对账单转预收时订金期别未赋值的问题
#200710-00084#8   2021/01/20  By 10043    1.對帳單3:訂金發票，若單身有不同訂單+期別，依其拆分拋轉立帳單。參考AP此張單:180531-00021
#                                         2.S-FIN-1003參數,不影響axrp132對isaf001=3:訂金發票的立帳拋轉
#210222-00016#2   2021/03/03  By 13656    1.axrt310审核增加检核:已存在出货单应收立账单(应收单号****),避免后续冲账异常,请确认是否仍需审核.如果Y,仍可审核;N(默认)就不可审核通过
#                                         2.axrp137/axrp132批处理增加管控:已存在订单出货之开票申请单(对账单号****)或应收立账单(应收单号****),是否继续生成单据
#201223-00032#1   2021/01/21  By 11234    axrp132生成至axrt340时，按照对应的xmdk084生成到xrca060中     
#210309-00026#1   2021/04/02  by 08172    增加合同或订单开票相关处理
#210301-00010#1   2021/04/21  by 08172    依出货认列发出商品，且签收认列收入为Y时，对账单单身存在立账单时，不可重复产生立账单
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
GLOBALS "../../../com/sub/4gl/s_apmm101.inc"    #170306-00026#1 ADD xul 
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
        progflag         LIKE gzza_t.gzza001, #150518-00046#5 add 傳入程式代號
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
   b_style LIKE type_t.chr500, 
   l_isaf001 LIKE type_t.chr1, 
   l_isaf073 LIKE type_t.chr1, 
   xrcadocno LIKE xrca_t.xrcadocno, 
   xrcadocno_desc LIKE oobxl_t.oobxl003, 
   xrca007 LIKE xrca_t.xrca007, 
   xrca007_desc LIKE oocql_t.oocql004, 
   xrcadocdt LIKE xrca_t.xrcadocdt, 
   b_check1 LIKE type_t.chr500, 
   b_check4 LIKE type_t.chr500, 
   b_check2 LIKE type_t.chr500, 
   b_check5 LIKE type_t.chr500, 
   b_check6 LIKE type_t.chr500, 
   l_chkisat LIKE type_t.chr1, 
   l_chk LIKE type_t.chr500, 
   l_price LIKE type_t.chr500, 
   l_chkisch LIKE type_t.chr1, 
   b_comb2 LIKE type_t.chr500, 
   b_comb1 LIKE type_t.chr500, 
   isafdocno LIKE isaf_t.isafdocno, 
   fflabel_desc LIKE type_t.chr80, 
   isaf002 LIKE isaf_t.isaf002, 
   isaf010 LIKE isaf_t.isaf010, 
   isaf003 LIKE isaf_t.isaf003, 
   isaf011 LIKE isaf_t.isaf011, 
   isaf055 LIKE isaf_t.isaf055, 
   isaf014 LIKE isaf_t.isaf014, 
   isaf004 LIKE isaf_t.isaf004, 
   isaf016 LIKE isaf_t.isaf016, 
   isaf057 LIKE isaf_t.isaf057, 
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
TYPE type_isaf_d        RECORD
        order              LIKE type_t.chr200,
        isafdocno          LIKE isaf_t.isafdocno,
        isafcomp           LIKE isaf_t.isafcomp,
        isagseq            LIKE isag_t.isagseq
                        END RECORD
DEFINE g_isaf_d DYNAMIC ARRAY OF type_isaf_d
#20150201#1 By zhangwei Add ---(E)---
DEFINE g_ref_fields     DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars       DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields     DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
#161128-00061#3-----modify--begin----------
#DEFINE g_glaa           RECORD LIKE glaa_t.*
#DEFINE g_xrca           RECORD LIKE xrca_t.*
#DEFINE g_xrcb           RECORD LIKE xrcb_t.*
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
DEFINE g_sql_ctrl       STRING              #151231-00010#9 add
DEFINE g_progflag       LIKE gzza_t.gzza001 #150518-00046#5 程式代號
#160426-00013#1 add ------
DEFINE g_sfin2022       LIKE type_t.chr10
DEFINE g_end_prog       LIKE gzza_t.gzza001
#160426-00013#1 add end---
DEFINE g_date_null      LIKE type_t.chr1   #171212-00027#1  add
DEFINE g_sfin2007       LIKE apca_t.apcadocdt  #171212-00027#1  add
DEFINE g_isao006        LIKE isao_t.isao006  #180531-00020#2 add
#180731-00017#34 -s  add by 11387
DEFINE ld_date_b          LIKE type_t.dat
DEFINE ld_date_e          LIKE type_t.dat
#180731-00017#34 -e  add by 11387
#200528-00023#1---add---start---
DEFINE g_esys0739           LIKE type_t.chr1   
DEFINE g_ooef011            LIKE ooef_t.ooef011
#200528-00023#1---add---end---     
DEFINE g_sfin9029       LIKE type_t.chr1  #201023-00028#3 add
DEFINE g_isao022        LIKE isao_t.isao022  #210309-00026#1 add
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="axrp132.main" type="s" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   DEFINE l_ooef017         LIKE ooef_t.ooef017  #190930-00018#1---add
   #end add-point 
  
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("axr","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   #test json ---
   #LET g_argv[01] = "{\"xrcasite\":\"DSCTP\",\"xrcald\":\"02\",\"l_isaf001\":\"1\",\"xrcadocno\":\"30B\",\"xrca007\":\"AR01\",\"xrcadocdt\":\"2016-07-22\",\"b_check1\":\"N\",\"b_check4\":\"N\",\"b_check2\":\"N\",\"b_check5\":\"N\",\"b_check3\":\"N\",\"b_check6\":\"N\",\"b_comb1\":\"1\",\"b_comb2\":\"1\",\"wc\":\" isafdocno = 'CTP-V01-201607000001'\"}"
   #LET g_bgjob = "Y" 
   #test json ---
   
   #200710-00084#8 mark ---s 移至process,因訂金立帳不受此參數影響
   #190930-00018#1---add----str
   ##SELECT DISTINCT ooef017 INTO l_ooef017  #200528-00023#1 mark
   #SELECT DISTINCT ooef017,ooef011          #200528-00023#1 add
   #  INTO l_ooef017,g_ooef011               #200528-00023#1 add
   #  FROM ooef_t 
   # WHERE ooefent = g_enterprise 
   #   AND ooef001 = g_site 
   #
   #IF cl_get_para(g_enterprise,l_ooef017,'S-FIN-1003') = '2' THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'axr-93239'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()    
   #   CALL cl_ap_exitprogram("0")
   #END IF
   ##190930-00018#1---add----end
   #200710-00084#8 mark ---e
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      CALL s_def_pay_cre_tmp() RETURNING g_sub_success #PGS(D)-10043-add
      #end add-point
      CALL axrp132_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_axrp132 WITH FORM cl_ap_formpath("axr",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL axrp132_init()
 
      #進入選單 Menu (="N")
      CALL axrp132_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_axrp132
   END IF
 
   #add-point:作業離開前 name="main.exit"
 
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="axrp132.init" type="s" >}
#+ 初始化作業
PRIVATE FUNCTION axrp132_init()
 
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
   CALL s_axrp130_create_tmp()  #170811-00036#1 add
   CALL s_voucher_cre_ar_tmp_table() RETURNING l_success
   CALL s_def_pay_cre_tmp() RETURNING l_success  #200605-00094#1 add
   #151125-00006#1---add---s
   CALL s_pre_voucher_cre_tmp_table() RETURNING l_success 
   CALL s_fin_continue_no_tmp() 
   #151125-00006#1---add---e
   CALL cl_set_combo_scc('b_comb1','9951')    #151012-00014#1 add lujh
   #151231-00010#9--add--str--
   LET g_sql_ctrl = NULL
   CALL s_control_get_customer_sql('2',g_site,g_user,g_dept,'') RETURNING g_sub_success,g_sql_ctrl
   #151231-00010#9--add--end
#   CALL cl_set_combo_scc('l_isaf001','9715') #160426-00013#1  #210309-00026#1 mark

   #170419-00022#1-----s
   #CALL cl_set_comp_required('xrcadocdt',TRUE)  #171212-00027#1 mark
   #170419-00022#1-----e
   CALL cl_set_comp_required("xrcadocdt", FALSE)  #171212-00027#1  mod
   #200528-00023#1---add---start---
   #啟用防偽稅控API
   LET g_esys0739 = 'N'
   CALL cl_get_para(g_enterprise,'','E-SYS-0739') RETURNING g_esys0739        
   IF cl_null(g_esys0739) THEN LET g_esys0739 = 'N' END IF
   
   #防偽稅控接口開立否               
   SELECT isao006 
     INTO g_isao006 
     FROM isao_t 
    WHERE isaoent = g_enterprise AND isaosite = g_site
   IF cl_null(g_isao006) THEN LET g_isao006 = 'N' END IF
   
   CALL cl_set_comp_visible("l_chkisch",FALSE)        #選擇要立帳的來源資料  
   #200528-00023#1---add---end---
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="axrp132.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION axrp132_ui_dialog()
 
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
   DEFINE l_s               LIKE type_t.num5
   
   #150210-00011(1)--20150330--add--
   DEFINE  l_flag1          LIKE type_t.chr1       
   DEFINE  l_errno          LIKE type_t.chr100
   #150210-00011(1)--20150330--add--
   DEFINE  l_ooba002        LIKE type_t.chr10     #151209-00023#1 add lujh
   DEFINE l_where           STRING                #160325-00023#1
   #170522-00024#1 --s add
   DEFINE l_yy         LIKE type_t.chr10
   DEFINE l_mm         LIKE type_t.chr10
   #170522-00024#1 --e add
   DEFINE l_str         STRING     #180329-00029#1 add
   DEFINE l_sfin9029    LIKE type_t.chr1  #210301-00010#1 add
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   INITIALIZE g_master.* TO NULL
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.xrcasite,g_master.xrcald,g_master.b_style,g_master.l_isaf001,g_master.l_isaf073,g_master.xrcadocno,g_master.xrca007,g_master.xrcadocdt,g_master.b_check1,g_master.b_check4,g_master.b_check2,g_master.b_check5,g_master.b_check6,g_master.l_chkisat,g_master.l_chk,g_master.l_price, 
             g_master.l_chkisch,g_master.b_comb2,g_master.b_comb1 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               CALL axrp132_def()
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
                        LET g_master.xrcasite = ''
                        LET g_master.xrcald = ''
                        LET g_master.xrcasite_desc = ''
                        LET g_master.xrcald_desc = ''
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
                  #200527-00024#1 mark(s)
                  ##180531-00020#2 add s---
                  ##aisi090 防伪税控=Y时，l_chkisch显示，l_chkisat隐藏 
                  #SELECT isao006 INTO g_isao006 FROM isao_t WHERE isaoent = g_enterprise AND isaosite = g_master.xrcasite 
                  #IF g_isao006 = 'Y' THEN 
                  #   LET g_master.l_chkisat = "N"
                  #   CALL cl_set_comp_visible("l_chkisat",FALSE)
                  #   CALL cl_set_comp_visible("l_chkisch",TRUE)
                  #ELSE
                  #   LET g_master.l_chkisat = "Y"
                  #   CALL cl_set_comp_visible("l_chkisat",TRUE)
                  #   CALL cl_set_comp_visible("l_chkisch",FALSE)   
                  #END IF
                  ##180531-00020#2 add e---
                  #200527-00024#1 mark(e)
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
                  #201023-00028#3 add -s
                  LET g_master.xrcadocno = ''
                  DISPLAY BY NAME g_master.xrcadocno
                  #是否走签收流程
                  CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9029') RETURNING g_sfin9029
                  IF g_master.l_isaf001 = '1' AND g_sfin9029 = 'Y' THEN
                     CALL cl_set_comp_visible("l_isaf073",TRUE)
                  ELSE
                     CALL cl_set_comp_visible("l_isaf073",FALSE)
                     LET g_master.l_isaf073 = 'N'
                  END IF
                  CASE g_master.l_isaf001
                     #210309-00026#1 add -s
                     WHEN '0' #0:合同发票
                        LET g_end_prog = 'axrt311'
                     #210309-00026#1 add-e
                     WHEN '1' #1:出貨發票
                        IF g_master.l_isaf073 = 'Y' THEN
                           LET g_end_prog = 'axrt330'
                        ELSE
                           LET g_end_prog = 'axrt300'
                        END IF
                     WHEN '2' #1:雜項發票
                        LET g_end_prog = 'axrt330'
                     WHEN '3' #3:訂金發票
                        LET g_sfin2022 = cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2022')
                        IF g_sfin2022 = '01' THEN
                           #01:認列收入
                           LET g_end_prog = 'axrt300'
                        ELSE
                           #02:認列預收
                           LET g_end_prog = 'axrt310'
                        END IF
                     WHEN '4' #4:待抵銷退
                        LET g_end_prog = 'axrt340'
                     WHEN '5' #5:雜項待抵          
                        LET g_end_prog = 'axrt341' 
                  END CASE
                  #201023-00028#3 add -e
                  #210309-00026#1 add -s
                  #允许合同或订单开票
                  SELECT isao022 INTO g_isao022
                    FROM isao_t 
                   WHERE isaoent = g_enterprise AND isaosite = g_glaa.glaacomp
                  IF cl_null(g_isao022) THEN LET g_isao022 = 'N' END IF
                  IF g_isao022 = 'N' THEN
                     CALL cl_set_combo_scc_part('l_isaf001','9715','1,2,3,4,5,6,7')
                  ELSE
                     CALL cl_set_combo_scc('l_isaf001','9715')
                  END IF
                  #210309-00026#1 add -e
               END IF #190103-00017#1 add                  
            ELSE
               LET g_master.xrcasite_desc = ''
            END IF
            
            #161128-00061#3-----modify--begin----------
            #SELECT * INTO g_glaa.*
           #190103-00017#1---s--- mark       
           #  SELECT glaaent,glaaownid,glaaowndp,glaacrtid,glaacrtdp,glaacrtdt,glaamodid,glaamoddt,glaastus,glaald,
           #         glaacomp,glaa001,glaa002,glaa003,glaa004,glaa005,glaa006,glaa007,glaa008,glaa009,glaa010,glaa011,
           #         glaa012,glaa013,glaa014,glaa015,glaa016,glaa017,glaa018,glaa019,glaa020,glaa021,glaa022,glaa023,
           #         glaa024,glaa025,glaa026,glaa100,glaa101,glaa102,glaa103,glaa111,glaa112,glaa113,glaa120,glaa121,
           #         glaa122,glaa027,glaa130,glaa131,glaa132,glaa133,glaa134,glaa135,glaa136,glaa137,glaa138,glaa139,
           #         glaa140,glaa123,glaa124,glaa028 INTO g_glaa.* 
           # #161128-00061#3-----modify--end----------
           #190103-00017#1 ---e---
           # FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
            DISPLAY BY NAME g_master.xrcasite,g_master.xrcasite_desc
            DISPLAY BY NAME g_master.xrcald,g_master.xrcald_desc
            #161111-00049#6 Add  ---(S)---
            #CALL s_control_get_customer_sql_pmab('4',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl #170718-00043#1 mark
            CALL s_control_get_customer_sql_pmab('2',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl #170718-00043#1 add
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
                  #161111-00049#6 Add  ---(S)---
                  #CALL s_control_get_customer_sql_pmab('4',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl #170718-00043#1 mark
                  CALL s_control_get_customer_sql_pmab('2',g_site,g_user,g_dept,'',g_glaa.glaacomp) RETURNING g_sub_success,g_sql_ctrl #170718-00043#1 add
                  #161111-00049#6 Add  ---(E)---
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
                  #201023-00028#3 add -s
                  LET g_master.xrcadocno = ''
                  DISPLAY BY NAME g_master.xrcadocno
                  #是否走签收流程
                  CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9029') RETURNING g_sfin9029
                  IF g_master.l_isaf001 = '1' AND g_sfin9029 = 'Y' THEN
                     CALL cl_set_comp_visible("l_isaf073",TRUE)
                  ELSE
                     CALL cl_set_comp_visible("l_isaf073",FALSE)
                     LET g_master.l_isaf073 = 'N'
                     LET g_master.xrcadocno = ''
                     DISPLAY BY NAME g_master.xrcadocno
                  END IF
                  CASE g_master.l_isaf001
                     #210309-00026#1 add -s
                     WHEN '0' #0:合同发票
                        LET g_end_prog = 'axrt311'
                     #210309-00026#1 add-e
                     WHEN '1' #1:出貨發票
                        IF g_master.l_isaf073 = 'Y' THEN
                           LET g_end_prog = 'axrt330'
                        ELSE
                           LET g_end_prog = 'axrt300'
                        END IF
                     WHEN '2' #1:雜項發票
                        LET g_end_prog = 'axrt330'
                     WHEN '3' #3:訂金發票
                        LET g_sfin2022 = cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2022')
                        IF g_sfin2022 = '01' THEN
                           #01:認列收入
                           LET g_end_prog = 'axrt300'
                        ELSE
                           #02:認列預收
                           LET g_end_prog = 'axrt310'
                        END IF
                     WHEN '4' #4:待抵銷退
                        LET g_end_prog = 'axrt340'
                     WHEN '5' #5:雜項待抵          
                        LET g_end_prog = 'axrt341' 
                  END CASE
                  #201023-00028#3 add -e
                  #210309-00026#1 add -s
                  #允许合同或订单开票
                  SELECT isao022 INTO g_isao022
                    FROM isao_t 
                   WHERE isaoent = g_enterprise AND isaosite = g_glaa.glaacomp
                  IF cl_null(g_isao022) THEN LET g_isao022 = 'N' END IF
                  IF g_isao022 = 'N' THEN
                     CALL cl_set_combo_scc_part('l_isaf001','9715','1,2,3,4,5,6,7')
                  ELSE
                     CALL cl_set_combo_scc('l_isaf001','9715')
                  END IF
                  #210309-00026#1 add -e
               END IF #190103-00017#1 add
            ELSE
               LET g_master.xrcald_desc = ''
            END IF
            #161128-00061#3-----modify--begin----------
            #190103-00017#1 ---s---
            ##SELECT * INTO g_glaa.* 
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
         BEFORE FIELD b_style
            #add-point:BEFORE FIELD b_style name="input.b.b_style"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_style
            
            #add-point:AFTER FIELD b_style name="input.a.b_style"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_style
            #add-point:ON CHANGE b_style name="input.g.b_style"
            IF NOT cl_null(g_master.b_style) THEN
               #IF g_master.b_style = 'axrt340' THEN #160920-00013#1 mark
               IF g_master.b_style = 'axrt340' OR g_master.b_style = 'axrt341' THEN #160920-00013#1 add
                  LET g_master.b_check1 = 'N'
                  LET g_master.b_check2 = 'N'
                  #LET g_master.b_check3 = 'N'  #180529-00020#1 mark
                  LET g_master.b_check4 = 'N'
                  LET g_master.b_check5 = 'N'
                  LET g_master.b_check6 = 'N'
                  CALL cl_set_comp_entry('b_check1,b_check2,b_check3,b_check4,b_check5,b_check6',FALSE)
               ELSE
#                  LET g_master.b_check1 = 'Y'  #190808-00007#1 mark
                  CALL cl_set_comp_entry('b_check1,b_check2,b_check3,b_check4,b_check5,b_check6',TRUE)
               END IF
               LET g_master.xrcadocno = ''
               DISPLAY BY NAME g_master.xrcadocno
            END IF
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_isaf001
            #add-point:BEFORE FIELD l_isaf001 name="input.b.l_isaf001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD l_isaf001
            
            #add-point:AFTER FIELD l_isaf001 name="input.a.l_isaf001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_isaf001
            #add-point:ON CHANGE l_isaf001 name="input.g.l_isaf001"
            #160426-00013#1 add ------
            IF NOT cl_null(g_master.l_isaf001) THEN
               #IF g_master.l_isaf001 MATCHES '[34]' THEN #3:訂金發票/4:待抵銷退            #160620-00010#3 mark
               #IF g_master.l_isaf001 MATCHES '[234]' THEN #2:雜項發票/3:訂金發票/4:待抵銷退  #160620-00010#3 add
#               IF g_master.l_isaf001 MATCHES '[2345]' THEN #2:雜項發票/3:訂金發票/4:待抵銷退/5:雜項代抵  #160920-00013#1 add  #210309-00026#1 mark
               IF g_master.l_isaf001 MATCHES '[02345]' THEN #0:合同发票/2:雜項發票/3:訂金發票/4:待抵銷退/5:雜項代抵  #210309-00026#1 add
                  LET g_master.b_check1 = 'N'
                  LET g_master.b_check2 = 'N'
                  #LET g_master.b_check3 = 'N'  #180529-00020#1 mark
                  LET g_master.b_check4 = 'N'
                  LET g_master.b_check5 = 'N'
                  LET g_master.b_check6 = 'N'
                  CALL cl_set_comp_entry('b_check1,b_check2,b_check3,b_check4,b_check5,b_check6',FALSE)
                  #160620-00010#3 --s add
                  IF g_master.l_isaf001 = '2' THEN
                     CALL cl_set_comp_entry('b_check1,b_check2,b_check3,b_check4,b_check5,b_check6',TRUE)
                  END IF
                  #160620-00010#3 --e add
               ELSE
#                  LET g_master.b_check1 = 'Y'  #190808-00007#1 mark
                  CALL cl_set_comp_entry('b_check1,b_check2,b_check3,b_check4,b_check5,b_check6',TRUE)
               END IF
               LET g_master.xrcadocno = ''
               DISPLAY BY NAME g_master.xrcadocno
               #201023-00028#3 add -s
               #是否走签收流程
               CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9029') RETURNING g_sfin9029
               IF g_master.l_isaf001 = '1' AND g_sfin9029 = 'Y' THEN
                  CALL cl_set_comp_visible("l_isaf073",TRUE)
               ELSE
                  CALL cl_set_comp_visible("l_isaf073",FALSE)
                  LET g_master.l_isaf073 = 'N'
               END IF
               #201023-00028#3 add -e
               CASE g_master.l_isaf001
                  #210309-00026#1 add -s
                  WHEN '0' #0:合同发票
                     LET g_end_prog = 'axrt311'
                  #210309-00026#1 add-e
                  WHEN '1' #1:出貨發票
                     #201023-00028#3 add -s
                     IF g_master.l_isaf073 = 'Y' THEN
                        LET g_end_prog = 'axrt330'
                     ELSE
                     #201023-00028#3 add -e
                        LET g_end_prog = 'axrt300'
                     END IF  #201023-00028#3 add 
                  #160620-00010#3 --s add
                  WHEN '2' #1:雜項發票
                     LET g_end_prog = 'axrt330'
                  #160620-00010#3 --e add
                  WHEN '3' #3:訂金發票
                     LET g_sfin2022 = cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2022')
                     IF g_sfin2022 = '01' THEN
                        #01:認列收入
                        LET g_end_prog = 'axrt300'
                     ELSE
                        #02:認列預收
                        LET g_end_prog = 'axrt310'
                     END IF
                  WHEN '4' #4:待抵銷退
                     LET g_end_prog = 'axrt340'
                  WHEN '5' #5:雜項待抵           #160920-00013#1 add
                     LET g_end_prog = 'axrt341' #160920-00013#1 add
               END CASE
            END IF
            #160426-00013#1 add end---
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_isaf073
            #add-point:BEFORE FIELD l_isaf073 name="input.b.l_isaf073"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD l_isaf073
            
            #add-point:AFTER FIELD l_isaf073 name="input.a.l_isaf073"
            #201023-00028#3 add -s
            IF g_master.l_isaf001 = '1' THEN
               IF g_master.l_isaf073 = 'Y' THEN
                  LET g_end_prog = 'axrt330'
               ELSE
                  LET g_end_prog = 'axrt300'
               END IF
            END IF
            #201023-00028#3 add -e
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_isaf073
            #add-point:ON CHANGE l_isaf073 name="input.g.l_isaf073"
            #201023-00028#3 add -s
            IF NOT cl_null(g_master.l_isaf073) THEN
               LET g_master.xrcadocno = ''
               DISPLAY BY NAME g_master.xrcadocno
            END IF
            #201023-00028#3 add -e
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrcadocno
            
            #add-point:AFTER FIELD xrcadocno name="input.a.xrcadocno"
            IF NOT cl_null(g_master.xrcadocno) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_glaa.glaa024
               LET g_chkparam.arg2 = g_master.xrcadocno
              #IF NOT s_aooi200_fin_chk_slip(g_glaa.glaald,g_glaa.glaa024,g_master.xrcadocno,g_master.b_style) THEN #160426-00013#1 mark
               IF NOT s_aooi200_fin_chk_slip(g_glaa.glaald,g_glaa.glaa024,g_master.xrcadocno,g_end_prog) THEN       #160426-00013#1
                  LET g_master.xrcadocno = ''
                  NEXT FIELD CURRENT
               END IF
               #170426-00060#1 add s---  
               #aooi200单别抓取预设账款类别  
               CALL s_aooi200_fin_get_doc_default(g_master.xrcasite,'2',g_master.xrcadocno,'xrca007',g_xrca.xrca007,g_master.xrcald) RETURNING g_master.xrca007                                                   
               IF NOT cl_null(g_master.xrca007) THEN            
                  DISPLAY g_master.xrca007 TO xrca007
               END IF               
               #170426-00060#1 add e---     
            END IF
            CALL axrp132_get_xrcadocno_desc()   #200302-00023#1 add
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrcadocno
            #add-point:BEFORE FIELD xrcadocno name="input.b.xrcadocno"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcadocno
            #add-point:ON CHANGE xrcadocno name="input.g.xrcadocno"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD xrca007
            
            #add-point:AFTER FIELD xrca007 name="input.a.xrca007"
            IF NOT cl_null(g_master.xrca007) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = g_master.xrca007
               #160318-00025#42  2016/04/25  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
              #LET g_chkparam.err_str[1] = "aoo-00200:sub-01302|axri012|",cl_get_progname("axri012",g_lang,"2"),"|:EXEPROGaxri012"  #170713-00063#21 mark
               #160318-00025#42  2016/04/25  by pengxin  add(E)
               
               #170713-00063#21 -S add
               LET g_chkparam.err_str[1] = "aoo-00200:sub-01302|",cl_get_progname("axri010",g_lang,"2"),"|:EXEPROGaxri010"
               LET g_chkparam.err_str[2] = "aoo-00199:sub-01303|axri010|",cl_get_progname("axri010",g_lang,"2"),"|:EXEPROGaxri010"
               #170713-00063#21 -E add
               
               IF NOT cl_chk_exist("v_oocq002_3111") THEN
                  LET g_master.xrca007 = ''
                  NEXT FIELD CURRENT
               END IF
            END IF
            #200302-00023#1 --s add  
            CALL s_desc_get_acc_desc('3111',g_master.xrca007) RETURNING g_master.xrca007_desc
            DISPLAY BY NAME g_master.xrca007_desc
            #200302-00023#1 --e add  
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD xrca007
            #add-point:BEFORE FIELD xrca007 name="input.b.xrca007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrca007
            #add-point:ON CHANGE xrca007 name="input.g.xrca007"
           
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
            LET  g_master_o.xrcadocdt =  g_master.xrcadocdt #190103-00017#1
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE xrcadocdt
            #add-point:ON CHANGE xrcadocdt name="input.g.xrcadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_check1
            #add-point:BEFORE FIELD b_check1 name="input.b.b_check1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_check1
            
            #add-point:AFTER FIELD b_check1 name="input.a.b_check1"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_check1
            #add-point:ON CHANGE b_check1 name="input.g.b_check1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_check4
            #add-point:BEFORE FIELD b_check4 name="input.b.b_check4"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_check4
            
            #add-point:AFTER FIELD b_check4 name="input.a.b_check4"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_check4
            #add-point:ON CHANGE b_check4 name="input.g.b_check4"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_check2
            #add-point:BEFORE FIELD b_check2 name="input.b.b_check2"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_check2
            
            #add-point:AFTER FIELD b_check2 name="input.a.b_check2"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_check2
            #add-point:ON CHANGE b_check2 name="input.g.b_check2"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_check5
            #add-point:BEFORE FIELD b_check5 name="input.b.b_check5"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_check5
            
            #add-point:AFTER FIELD b_check5 name="input.a.b_check5"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_check5
            #add-point:ON CHANGE b_check5 name="input.g.b_check5"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD b_check6
            #add-point:BEFORE FIELD b_check6 name="input.b.b_check6"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD b_check6
            
            #add-point:AFTER FIELD b_check6 name="input.a.b_check6"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE b_check6
            #add-point:ON CHANGE b_check6 name="input.g.b_check6"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_chkisat
            #add-point:BEFORE FIELD l_chkisat name="input.b.l_chkisat"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD l_chkisat
            
            #add-point:AFTER FIELD l_chkisat name="input.a.l_chkisat"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_chkisat
            #add-point:ON CHANGE l_chkisat name="input.g.l_chkisat"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_chk
            #add-point:BEFORE FIELD l_chk name="input.b.l_chk"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD l_chk
            
            #add-point:AFTER FIELD l_chk name="input.a.l_chk"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_chk
            #add-point:ON CHANGE l_chk name="input.g.l_chk"
            
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
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_chkisch
            #add-point:BEFORE FIELD l_chkisch name="input.b.l_chkisch"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD l_chkisch
            
            #add-point:AFTER FIELD l_chkisch name="input.a.l_chkisch"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_chkisch
            #add-point:ON CHANGE l_chkisch name="input.g.l_chkisch"
            
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
            #170419-00022#1 mark-----s 
            #IF NOT cl_null(g_master.b_comb2) THEN  #2015/01/23
            #   IF g_master.b_comb2 = '1' THEN
            #      CALL cl_set_comp_required('xrcadocdt',FALSE)
            #   ELSE
            #      CALL cl_set_comp_required('xrcadocdt',TRUE)
            #   END IF
            #END IF
            ##170419-00022#1 mark-----e
            #171212-00027#1 add--s
            #汇总条件=1立账日期非必填
            IF g_master.b_comb2 = '1' THEN
               CALL cl_set_comp_required("xrcadocdt", FALSE)
            ELSE
               #汇总条件<>1时，P作业中立账日期必填
               CALL cl_set_comp_required("xrcadocdt", TRUE)   
            END IF
            #171212-00027#1 add--e
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
            CALL axrp132_get_ooef001_wc(ls_wc) RETURNING ls_wc  
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_master.xrcald             #給予default值
#160811-00009#4 mod s---               
#               IF NOT cl_null(ls_wc) AND ls_wc <> '(\'\')' THEN
#                  LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN ",ls_wc,""
#               ELSE
#                  LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y')"
#               END IF
               LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN ",ls_wc,""
#160811-00009#4 mod e---
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
 
 
         #Ctrlp:input.c.b_style
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_style
            #add-point:ON ACTION controlp INFIELD b_style name="input.c.b_style"
            
            #END add-point
 
 
         #Ctrlp:input.c.l_isaf001
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD l_isaf001
            #add-point:ON ACTION controlp INFIELD l_isaf001 name="input.c.l_isaf001"
            
            #END add-point
 
 
         #Ctrlp:input.c.l_isaf073
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD l_isaf073
            #add-point:ON ACTION controlp INFIELD l_isaf073 name="input.c.l_isaf073"
            
            #END add-point
 
 
         #Ctrlp:input.c.xrcadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD xrcadocno
            #add-point:ON ACTION controlp INFIELD xrcadocno name="input.c.xrcadocno"
            #應收單別
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_master.xrcadocno
            SELECT ooef004 INTO l_ooef004 from ooef_t where ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp
            LET g_qryparam.arg1 = g_glaa.glaa024
            #LET g_qryparam.arg2 = g_master.b_style  #160426-00013#1 mark
            LET g_qryparam.arg2 = g_end_prog         #160426-00013#1
            CALL q_ooba002_1()
            LET g_master.xrcadocno = g_qryparam.return1
            DISPLAY g_master.xrcadocno TO xrcadocno
            CALL axrp132_get_xrcadocno_desc()   #200302-00023#1 add   
            NEXT FIELD xrcadocno
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
            #200302-00023#1 --s add  
            CALL s_desc_get_acc_desc('3111',g_master.xrca007) RETURNING g_master.xrca007_desc
            DISPLAY BY NAME g_master.xrca007_desc
            #200302-00023#1 --e add 
            NEXT FIELD xrca007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.xrcadocdt
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD xrcadocdt
            #add-point:ON ACTION controlp INFIELD xrcadocdt name="input.c.xrcadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_check1
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_check1
            #add-point:ON ACTION controlp INFIELD b_check1 name="input.c.b_check1"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_check4
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_check4
            #add-point:ON ACTION controlp INFIELD b_check4 name="input.c.b_check4"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_check2
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_check2
            #add-point:ON ACTION controlp INFIELD b_check2 name="input.c.b_check2"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_check5
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_check5
            #add-point:ON ACTION controlp INFIELD b_check5 name="input.c.b_check5"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_check6
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_check6
            #add-point:ON ACTION controlp INFIELD b_check6 name="input.c.b_check6"
            
            #END add-point
 
 
         #Ctrlp:input.c.l_chkisat
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD l_chkisat
            #add-point:ON ACTION controlp INFIELD l_chkisat name="input.c.l_chkisat"
            
            #END add-point
 
 
         #Ctrlp:input.c.l_chk
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD l_chk
            #add-point:ON ACTION controlp INFIELD l_chk name="input.c.l_chk"
            
            #END add-point
 
 
         #Ctrlp:input.c.l_price
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD l_price
            #add-point:ON ACTION controlp INFIELD l_price name="input.c.l_price"
            
            #END add-point
 
 
         #Ctrlp:input.c.l_chkisch
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD l_chkisch
            #add-point:ON ACTION controlp INFIELD l_chkisch name="input.c.l_chkisch"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_comb2
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_comb2
            #add-point:ON ACTION controlp INFIELD b_comb2 name="input.c.b_comb2"
            
            #END add-point
 
 
         #Ctrlp:input.c.b_comb1
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD b_comb1
            #add-point:ON ACTION controlp INFIELD b_comb1 name="input.c.b_comb1"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON isafdocno,isaf002,isaf010,isaf003,isaf011,isaf055,isaf014,isaf004,isaf016,isaf057
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.isafdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD isafdocno
            #add-point:ON ACTION controlp INFIELD isafdocno name="construct.c.isafdocno"
            #開票單號
            #開窗c段
            #取得aooi210所設置之前置單別的合理性where 條件
            #CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','','isafdocno') RETURNING g_sub_success,l_where   #160325-00023#1 #180509-00055#2 mark    
            CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','aist310','isafdocno') RETURNING g_sub_success,l_where  #180509-00055#2 add 
            CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9029') RETURNING l_sfin9029  #210301-00010#1 add              
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #160426-00013#1 mark ------
            #IF g_master.b_style = 'axrt300' THEN
            #   LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf056 = '1' ",   #151209-00023#1 remove isafstus = 'Y' AND lujh
            #  #150615-00017#2 Add  ---(S)---
            #   "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
            #   "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ",
            #   "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"
            #  #150615-00017#2 Add  ---(E)---
            #ELSE
            #   LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf056 = '2' ",   #151209-00023#1 remove isafstus = 'Y' AND lujh
            #  #150615-00017#2 Add  ---(S)---
            #   "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
            #   "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ",
            #   "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"
            #  #150615-00017#2 Add  ---(E)---
            #END IF
            #160426-00013#1 mark end---
            IF cl_null(g_master.xrcadocdt) THEN LET g_master.xrcadocdt = g_today END IF #180821-00038#10 add
            #160426-00013#1 add ------
            CASE
               #WHEN g_end_prog = 'axrt300' AND g_master.l_isaf001 = '1' #170301-00023#11 mark    
#               WHEN g_end_prog MATCHES 'axrt300*' AND g_master.l_isaf001 = '1' #170301-00023#11 add  #201023-00028#3 mark
               WHEN (g_end_prog MATCHES 'axrt300*' OR (g_end_prog MATCHES 'axrt330*' AND g_master.l_isaf073 = 'Y')) AND g_master.l_isaf001 = '1'  #201023-00028#3 add
                  LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf001 <> '3' AND isaf056 = '1' "
                  #201023-00028#3 add -s
                  IF g_end_prog MATCHES 'axrt330*' THEN
                     LET g_qryparam.where = g_qryparam.where , 
                     "   AND isaf073 = 'Y' ",
                     "   AND NOT EXISTS (SELECT 1 FROM xrca_t WHERE xrcaent = ",g_enterprise,
                     "                      AND xrca001 = '19' AND xrca016 = '12' AND xrca018 = isafdocno",
                     "                      AND xrcastus <> 'X')"  
                  ELSE
                  #201023-00028#3 add -e
                  #180531-00020#2 mod s---
                  #"   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
                  #"                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ",
                  #"                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"
                  #IF g_isao006 <> 'Y' THEN #200527-00024#1 mark    
                     #210301-00010#1 add -s
                     IF l_sfin9029 = 'Y' THEN
                        LET g_qryparam.where = g_qryparam.where , 
                                               "   AND (isaf073 = 'N' OR isaf073 IS NULL) ", 
                                               "   AND NOT EXISTS (SELECT 1 ",
                                               "                     FROM isag_t ",
                                               "                    WHERE isagent = ",g_enterprise,
                                               "                      AND isagcomp = isafcomp ",
                                               "                      AND isagdocno = isafdocno ",
                                               "                      AND EXISTS (SELECT 1 ",
                                               "                                    FROM xrca_t,xrcb_t ",
                                               "                                   WHERE xrcaent = xrcbent AND xrcaent = ",g_enterprise,
                                               "                                     AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '12' ", 
                                               "                                     AND xrcastus <> 'X' AND xrcb002 = isag002 AND xrcb003 = isag003))" 
                     ELSE
                     #210301-00010#1 add -e
                        LET g_qryparam.where = g_qryparam.where , 
                        "   AND (isaf073 = 'N' OR isaf073 IS NULL) ",  #201023-00028#3 add
                        "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
#                        "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ", #190930-00018#1---mark
                        "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 IN ('17','12') ", #190930-00018#1---add
                        "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"   
                     END IF  #210301-00010#1 add
                  #END IF  #200527-00024#1 mark   
                  #180531-00020#2 mod e---  
                  END IF   #201023-00028#3 add                    
               #160620-00010#3 --s add
               #WHEN g_end_prog = 'axrt330' #170301-00023#11 mark    
               WHEN g_end_prog MATCHES 'axrt330*' #170301-00023#11 add
                  LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf001 = '2' AND isaf056 = '1' "
                  #180531-00020#2 add s---
                  #IF g_isao006 <> 'Y' THEN #200527-00024#1 mark    
                     LET g_qryparam.where = g_qryparam.where , 
                  #180531-00020#2 add e---                       
                     "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
                     "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '19' ",
                     "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"  
                  #END IF  #180531-00020#2 add #200527-00024#1 mark 
               #160620-00010#3 --e add
               #WHEN g_end_prog = 'axrt300' AND g_master.l_isaf001 = '3' #170301-00023#11 mark    
               WHEN g_end_prog MATCHES 'axrt300*' AND g_master.l_isaf001 = '3' #170301-00023#11 add
                  LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf001 = '3' AND isaf056 = '1' "
                  #180531-00020#2 add s--- 
                  #IF g_isao006 <> 'Y' THEN #200527-00024#1 mark    
                     LET g_qryparam.where = g_qryparam.where , 
                  #180531-00020#2 add e---                     
                     "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
#                     "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ",  #190930-00018#1---mark
                     "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 IN ('17','12') ",   #190930-00018#1---add
                     "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"
                  #END IF  #180531-00020#2 add  #200527-00024#1 mark    
               #WHEN g_end_prog = 'axrt310' #170301-00023#11 mark    
               WHEN g_end_prog MATCHES 'axrt310*' #170301-00023#11 add
                  LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf001 = '3' AND isaf056 = '1' "
                  #180531-00020#2 add s--- 
                  #IF g_isao006 <> 'Y' THEN #200527-00024#1 mark    
                     LET g_qryparam.where = g_qryparam.where , 
                  #180531-00020#2 add e---                   
                     "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
                     "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '11' ",
                     "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"
                  #END IF  #180531-00020#2 add  #200527-00024#1 mark   
               #210309-00026#1 add -s
               WHEN g_end_prog MATCHES 'axrt311*' 
                  LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf001 = '0' AND isaf056 IN ('1','2') ",                
                                         " AND NOT EXISTS (SELECT 1 ",
                                         "                   FROM xrca_t,xrcb_t ",
                                         "                  WHERE xrcaent = xrcbent AND xrcaent = ",g_enterprise,
                                         "                    AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 IN ('110','210') ",
                                         "                    AND xrcastus <> 'X' AND xrcb049 = isafdocno) "
               #210309-00026#1 add -e
               #WHEN g_end_prog = 'axrt340' #170301-00023#11 mark    
               WHEN g_end_prog MATCHES 'axrt340*' #170301-00023#11 add
                  #LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf056 = '2' ", #160920-00013#1 mark
                  LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf001 ='4' AND isaf056 = '2' " #160920-00013#1 add
                  #180531-00020#2 add s---
                  #IF g_isao006 <> 'Y' THEN #200527-00024#1 mark   
                     #210301-00010#1 add -s
                     IF l_sfin9029 = 'Y' THEN
                        LET g_qryparam.where = g_qryparam.where , 
                                               "   AND NOT EXISTS (SELECT 1 ",
                                               "                     FROM isag_t ",
                                               "                    WHERE isagent = ",g_enterprise,
                                               "                      AND isagcomp = isafcomp ",
                                               "                      AND isagdocno = isafdocno ",
                                               "                      AND EXISTS (SELECT 1 ",
                                               "                                    FROM xrca_t,xrcb_t ",
                                               "                                   WHERE xrcaent = xrcbent AND xrcaent = ",g_enterprise,
                                               "                                     AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '22' ", 
                                               "                                     AND xrcastus <> 'X' AND xrcb002 = isag002 AND xrcb003 = isag003))" 
                     ELSE
                     #210301-00010#1 add -e
                        LET g_qryparam.where = g_qryparam.where , 
                  #180531-00020#2 add e---                   
                        "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
                        #"                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ",#170706-00034#1 mark
                        "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '22' ",#170706-00034#1 add 应收销退待抵账款性质为22
                        "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"
                     END IF  #210301-00010#1 add
                  #END IF  #180531-00020#2 add #200527-00024#1 mark   
               #160920-00013#1 --s add
               #WHEN g_end_prog = 'axrt341' #170301-00023#11 mark    
               WHEN g_end_prog MATCHES 'axrt341*' #170301-00023#11 add
                  LET g_qryparam.where = " isafcomp = '",g_glaa.glaacomp,"' AND isaf001 = '5' AND isaf056 = '2' "
                  #180531-00020#2 add s---
                  #IF g_isao006 <> 'Y' THEN #200527-00024#1 mark   
                     LET g_qryparam.where = g_qryparam.where , 
                  #180531-00020#2 add e---                    
                     "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
                     #"                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ",  #170706-00034#1 mark
                     "                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '29' ",  #170706-00034#1 add  杂项销退待抵账款性质为29
                     "                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"
                  #END IF #180531-00020#2 add #200527-00024#1 mark    
               #160920-00013#1 --e add
            END CASE
            #160426-00013#1 add end---
            #151209-00023#1--add--str--lujh
            LET l_ooba002 = ''
            LET l_ooba002 = cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-1003')
            IF l_ooba002 <> '3' THEN
               LET g_qryparam.where = g_qryparam.where," AND isafstus = 'Y' "
            ELSE
               LET g_qryparam.where = g_qryparam.where," AND isafstus = 'S' "
            END IF
            #151209-00023#1--add--str--lujh
            #IF g_isao006 <> 'Y' THEN #180531-00020#2 add 防伪税控可多次开票多次立账，回写isaf035为MULTI #200527-00024#1 mark     
               CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s
               CASE
                  WHEN l_s = 1
                     LET g_qryparam.where = g_qryparam.where," AND isaf035 IS NULL"
                  WHEN l_s = 2
                     LET g_qryparam.where = g_qryparam.where," AND isaf048 IS NULL"
                  WHEN l_s = 3
                     LET g_qryparam.where = g_qryparam.where," AND isaf049 IS NULL"
               END CASE 
            #END IF  #180531-00020#2 add  #200527-00024#1 mark
            
            #180329-00029#1 add--s
            IF g_master.l_price = 'N'  THEN
               LET l_str = " AND isag101 <> 0 "
            ELSE
               LET l_str = " AND 1 = 1 "
            END IF
            #180329-00029#1 add--e
            #LET g_qryparam.where = g_qryparam.where," AND isafdocdt BETWEEN '",g_pdate_s,"' AND '",g_pdate_e,"'"  #150210-00011(1)--20150330--add-- #170522-00024#1 mark
            #170522-00024#1 --s add
            #跨期未暫估者可立帳 Y :  來源對帳單日期 小於等於單據日期 ; N : 出貨/銷退來源單 已立暫估量xmdl053 >0  且 其扣帳日期 之月份<> 立帳日期
            IF g_master.l_isaf001 MATCHES '[14]' AND g_master.l_chk = 'N' THEN
               LET l_yy = YEAR(g_master.xrcadocdt)
               LET l_mm = MONTH(g_master.xrcadocdt)                   
               LET g_qryparam.where = g_qryparam.where,
                                      " AND isafdocno IN ( SELECT isafdocno FROM isaf_t,isag_t WHERE isafent = ",g_enterprise," AND isagent = isafent AND isagcomp = isafcomp AND isagdocno = isafdocno ",
                                      l_str,  #180329-00029#1 add
                                      " AND ((isag001 NOT IN ('11','21') AND isafdocdt <= '",g_master.xrcadocdt,"') ",
                                      "  OR (isag001 IN ('11','21') AND isag002 IN ( SELECT DISTINCT xmdkdocno FROM xmdk_t,xmdl_t ",
                                      "                                              WHERE xmdkent = ",g_enterprise," AND xmdkent = xmdlent AND xmdkdocno = xmdldocno ", 
                                      #"                                                AND xmdkent = isafent AND xmdkdocno = isag002 AND xmdlseq = isag003 AND xmdl053 <> 0 ", #170712-00047#1 mark
                                      "                                                AND xmdkent = isafent AND xmdkdocno = isag002 AND xmdlseq = isag003  ",                  #170712-00047#1 add
                                      #"                                                AND ((TO_CHAR(xmdk001,'YYYY') = '",l_yy,"' ",                                           #170712-00047#1 mark
                                      "                                                AND ((xmdl053 <> 0 AND ((TO_CHAR(xmdk001,'YYYY') = ",l_yy," ",                           #170712-00047#1 add
                                      "                                                                      AND TO_CHAR(xmdk001,'MM') <> ",l_mm,") ",
                                      #"                                                                      OR TO_CHAR(xmdk001,'YYYY') <> '",l_yy,"'))))) "                   #170712-00047#1 mark
                                      "                                                                      OR TO_CHAR(xmdk001,'YYYY') <> ",l_yy,"))",                         #170712-00047#1 add
                                      "                                                 OR (TO_CHAR(xmdk001,'YYYY') = ",l_yy," AND TO_CHAR(xmdk001,'MM') = ",l_mm,")) ",    #170712-00047#1 add
                                      "                                                                      )))) "                                                             #170712-00047#1 add                                   
            ELSE
               LET g_qryparam.where = g_qryparam.where," AND isafdocdt <= '",g_master.xrcadocdt,"' " 
               #180329-00029#1 add--s
               IF g_master.l_price = 'N'  THEN
                  LET g_qryparam.where = g_qryparam.where," AND isafdocno IN ( SELECT isafdocno FROM isaf_t,isag_t WHERE isafent = ",g_enterprise," ",
                  " AND isagent = isafent AND isagcomp = isafcomp AND isagdocno = isafdocno AND isag101 <> 0 )"   
               END IF
               #180329-00029#1 add--e
            END IF          
            #170522-00024#1 --e add             
            #151231-00010#9--add--str--
            IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
               LET g_qryparam.where = g_qryparam.where," AND EXISTS (SELECT 1 FROM pmaa_t ",
                                                       "              WHERE pmaaent = ",g_enterprise,
                                                       "                AND ",g_sql_ctrl,
                                                       "                AND pmaaent = isafent",
                                                       "                AND pmaa001 = isaf002 )"
            END IF
            #151231-00010#9--add--end
            #160415-00010#1-----s
            IF g_master.l_chkisat = 'Y' THEN
               LET g_qryparam.where = g_qryparam.where," AND EXISTS(SELECT 1 FROM isat_t",
                                                       "             WHERE isatent = isafent",
                                                       "               AND isatcomp = isafcomp",
                                                       "               AND isatdocno = isafdocno",
                                                       "               AND isat025 IN ('11','21')",
                                                       "           )"
            END IF
            #160415-00010#1-----e
            #160908-00003#3 add ------
            #開放出貨單已確認未過帳可開立發票，但不可產生立帳單(須待出貨過帳才可立帳)
            LET g_qryparam.where = g_qryparam.where,
                #"AND (NOT EXISTS (SELECT * FROM xmdk_t WHERE xmdkent = ",g_enterprise," AND xmdkstus <> 'S'", #170605-00061#1 mark
                #170605-00061#1 add ------
                "AND (NOT EXISTS (SELECT * FROM xmdk_t WHERE xmdkent = ",g_enterprise,
               #"                AND ((xmdk000 IN ('1', '2', '3') AND xmdkstus NOT IN ('Y','S') AND xmdk002 = '1') OR", #171102-00016#1 xul mark  
                "                AND ((xmdk000 IN ('1', '2', '3') AND xmdkstus <> 'S' AND xmdk002 = '1') OR", #171102-00016#1 xul add
                "                     (xmdk000 = '4' AND xmdkstus <> 'Y' AND xmdk002 = '3') OR",
                "                     (xmdk000 = '6' AND xmdkstus <> 'S' AND xmdk082 IN (SELECT gzcb002 FROM gzcb_t WHERE gzcb001='2088' AND gzcb003='Y'))",
                "                    )",
                #170605-00061#1 add end---
                "                AND xmdkdocno IN (SELECT DISTINCT isag002 FROM isag_t WHERE isagent = ",g_enterprise,
               #"                AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001='11'))", #171102-00016#1 xul mark  
                "                AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001 IN ('11','21')))", #171102-00016#1 xul add
                "     OR EXISTS (SELECT 1 FROM isag_t WHERE isagent = ",g_enterprise,
               #"                   AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001<>'11')) " #171102-00016#1 xul mark 
                "                   AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001 NOT IN ('11','21'))) " #171102-00016#1 xul add 
                
            #160908-00003#3 add end---
            LET g_qryparam.where = g_qryparam.where," AND ",l_where #160325-00023#1
            #200427-00029#1---mark---start---
            ##180531-00020#2 add s---
            #IF g_isao006 = 'Y' THEN 
            #   IF g_master.l_chkisch = '1' THEN 
            #      LET g_qryparam.where = g_qryparam.where," AND isch007 > xrcb007 "
            #   ELSE
            #      LET g_qryparam.where = g_qryparam.where," AND isag004 > xrcb007 "
            #   END IF                                     
            #   CALL q_isafdocno_01()
            #ELSE
            #   CALL q_isafdocno()
            #END IF 
            ##180531-00020#2 add e---
            #200427-00029#1---mark---end---
            CALL q_isafdocno()     #200427-00029#1 add
            #CALL q_isafdocno()#180531-00020#2 mark
            DISPLAY g_qryparam.return1 TO isafdocno
            NEXT FIELD isafdocno
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isafdocno
            #add-point:BEFORE FIELD isafdocno name="construct.b.isafdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isafdocno
            
            #add-point:AFTER FIELD isafdocno name="construct.a.isafdocno"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.isaf002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD isaf002
            #add-point:ON ACTION controlp INFIELD isaf002 name="construct.c.isaf002"
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
            #160913-00017#7--ADD(S)--
            LET g_qryparam.arg1="('2','3')"
            CALL q_pmaa001_1()
            #160913-00017#7--ADD(E)--
            DISPLAY g_qryparam.return1 TO isaf002
            NEXT FIELD isaf002
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf002
            #add-point:BEFORE FIELD isaf002 name="construct.b.isaf002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf002
            
            #add-point:AFTER FIELD isaf002 name="construct.a.isaf002"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf010
            #add-point:BEFORE FIELD isaf010 name="construct.b.isaf010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf010
            
            #add-point:AFTER FIELD isaf010 name="construct.a.isaf010"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.isaf010
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD isaf010
            #add-point:ON ACTION controlp INFIELD isaf010 name="construct.c.isaf010"
            
            #END add-point
 
 
         #Ctrlp:construct.c.isaf003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD isaf003
            #add-point:ON ACTION controlp INFIELD isaf003 name="construct.c.isaf003"
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
            #160913-00017#7--ADD(S)--
            LET g_qryparam.arg1="('2','3')"
            CALL q_pmaa001_1()
            #160913-00017#7--ADD(E)--
            DISPLAY g_qryparam.return1 TO isaf003  #顯示到畫面上
            NEXT FIELD isaf003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf003
            #add-point:BEFORE FIELD isaf003 name="construct.b.isaf003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf003
            
            #add-point:AFTER FIELD isaf003 name="construct.a.isaf003"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf011
            #add-point:BEFORE FIELD isaf011 name="construct.b.isaf011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf011
            
            #add-point:AFTER FIELD isaf011 name="construct.a.isaf011"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.isaf011
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD isaf011
            #add-point:ON ACTION controlp INFIELD isaf011 name="construct.c.isaf011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf055
            #add-point:BEFORE FIELD isaf055 name="construct.b.isaf055"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf055
            
            #add-point:AFTER FIELD isaf055 name="construct.a.isaf055"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.isaf055
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD isaf055
            #add-point:ON ACTION controlp INFIELD isaf055 name="construct.c.isaf055"
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
            #160913-00017#7--ADD(S)--
            LET g_qryparam.arg1="('2','3')"
            CALL q_pmaa001_1()
            #160913-00017#7--ADD(E)--
            DISPLAY g_qryparam.return1 TO isaf055      #顯示到畫面上

            NEXT FIELD isaf055                         #返回原欄位

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf014
            #add-point:BEFORE FIELD isaf014 name="construct.b.isaf014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf014
            
            #add-point:AFTER FIELD isaf014 name="construct.a.isaf014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.isaf014
         #應用 a03 樣板自動產生(Version:3)
#此ctrlp無內容         ON ACTION controlp INFIELD isaf014
            #add-point:ON ACTION controlp INFIELD isaf014 name="construct.c.isaf014"
            
            #END add-point
 
 
         #Ctrlp:construct.c.isaf004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD isaf004
            #add-point:ON ACTION controlp INFIELD isaf004 name="construct.c.isaf004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #CALL q_ooef001()                       #呼叫開窗  #161021-00050#2 mark
            #CALL q_ooeg001_4()                                #161021-00050#2 add         #170814-00012#34  170913 By 10044 mark
            CALL q_ooeg001()                                                               #170814-00012#34  170913 By 10044 add  
            DISPLAY g_qryparam.return1 TO isaf004  #顯示到畫面上
            NEXT FIELD isaf004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf004
            #add-point:BEFORE FIELD isaf004 name="construct.b.isaf004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf004
            
            #add-point:AFTER FIELD isaf004 name="construct.a.isaf004"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.isaf016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD isaf016
            #add-point:ON ACTION controlp INFIELD isaf016 name="construct.c.isaf016"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO isaf016  #顯示到畫面上
            NEXT FIELD isaf016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf016
            #add-point:BEFORE FIELD isaf016 name="construct.b.isaf016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf016
            
            #add-point:AFTER FIELD isaf016 name="construct.a.isaf016"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD isaf057
            #add-point:BEFORE FIELD isaf057 name="construct.b.isaf057"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:3)
         AFTER FIELD isaf057
            
            #add-point:AFTER FIELD isaf057 name="construct.a.isaf057"
            
            #END add-point
                        #應用 a77 樣板自動產生(Version:2)
            CALL FGL_DIALOG_GETBUFFER() RETURNING lp_str
            IF NOT cl_null(lp_str) THEN
               LET lp_str = cl_ap_code_fuzzyquery(lp_str)   #模糊查詢功能
               CALL FGL_DIALOG_SETBUFFER(lp_str)
            END IF
 
 
 
 
         #Ctrlp:construct.c.isaf057
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD isaf057
            #add-point:ON ACTION controlp INFIELD isaf057 name="construct.c.isaf057"
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO isaf057  #顯示到畫面上

            NEXT FIELD isaf057                     #返回原欄位

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
            CALL axrp132_get_buffer(l_dialog)
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
            CALL axrp132_def()
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
         CALL axrp132_init()
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
      IF INT_FLAG = FALSE THEN 
         IF cl_null(g_master.xrcadocdt) THEN LET g_master.xrcadocdt = g_today END IF #180821-00038#10 add     
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
      #170913-00066#1---add---str
      IF NOT INT_FLAG THEN
         IF g_master.wc = ' 1=1' THEN
            IF NOT cl_ask_confirm('axr-01083') THEN
               CONTINUE WHILE
            END IF
         END IF
      END IF
      #170913-00066#1---add---end

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
                 CALL axrp132_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = axrp132_transfer_argv(ls_js)
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
 
{<section id="axrp132.transfer_argv" type="s" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION axrp132_transfer_argv(ls_js)
 
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
 
{<section id="axrp132.process" type="s" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION axrp132_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_gzzd005         LIKE gzzd_t.gzzd005
   #150518-00039#4-----s
   DEFINE l_gettran    type_master
   DEFINE l_bgjob      LIKE type_t.chr1
   #150518-00039#4-----e
   
   #200302-00005#10 add s---
   DEFINE lc_param_link  RECORD
          prog           STRING,
          param          DYNAMIC ARRAY OF STRING,
          default_wc     STRING,
          deputy         STRING
          END RECORD 
   DEFINE l_confmsg      STRING
   #200302-00005#10 add e---
   DEFINE l_cnt LIKE type_t.num10 #200710-00084#8 add
   #210222-00016#2 --s add
   DEFINE l_sql1       STRING
   DEFINE l_isafdocno LIKE isaf_t.isafdocno
   DEFINE l_isag002   LIKE isag_t.isag002
   DEFINE l_xrcadocno LIKE xrca_t.xrcadocno
   DEFINE l_sql2      STRING
   DEFINE l_gzze003   LIKE gzze_t.gzze003
   DEFINE l_msg1      STRING
   DEFINE l_wc2       STRING
   DEFINE l_wc3       STRING
   #210222-00016#2 --e add
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   LET g_progflag = lc_param.progflag  #150518-00046#5 add
   IF cl_null(g_progflag) THEN LET g_progflag = 'axrp132' END IF #160317-00018#1 Add
   DISPLAY 'ls_js:',ls_js

   #150518-00039#4-----s
   CALL util.JSON.parse(ls_js,l_gettran)

   IF NOT cl_null(l_gettran.xrcasite) THEN
      DISPLAY 'l_getran.xrcasite:',l_gettran.xrcasite
      DISPLAY 'ls_js:',ls_js
      LET g_master.* = l_gettran.*
      SELECT isao006 INTO g_isao006 FROM isao_t WHERE isaoent = g_enterprise AND isaosite = g_master.xrcasite #180531-00020#2
      CALL s_fin_create_account_center_tmp()
      CALL s_voucher_cre_ar_tmp_table() RETURNING g_sub_success 
      
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
      CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','') 
               RETURNING g_sub_success,g_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
                         g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
      #160426-00013#1-s
      CASE g_master.l_isaf001
         #210309-00026#1 add -s
         WHEN '0' #0:合同发票
            LET g_end_prog = 'axrt311'
         #210309-00026#1 add-e
         WHEN '1' #1:出貨發票
            LET g_end_prog = 'axrt300'
         WHEN '2' #2:雜項發票           #160620-00010#3 add
            LET g_end_prog = 'axrt330' #160620-00010#3 add
         WHEN '3' #3:訂金發票
            LET g_sfin2022 = cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2022')
            IF g_sfin2022 = '01' THEN
               #01:認列收入
               LET g_end_prog = 'axrt300'
            ELSE
               #02:認列預收
               LET g_end_prog = 'axrt310'
            END IF
         WHEN '4' #4:待抵銷退
            LET g_end_prog = 'axrt340'
         WHEN '5' #5:雜項待抵           #160920-00013#1 add
            LET g_end_prog = 'axrt341' #160920-00013#1 add
      END CASE
      #160426-00013#1-e
   END IF
   #150518-00039#4-----e 
   
   #200710-00084#8 add ---s   
   IF g_master.l_isaf001<>'3' AND cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-1003') = '2' THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axr-93239'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()    
      RETURN
   END IF
   #200710-00084#8 add ---e   
   
    
   #執行步驟:
   #STEP1.取得符合條件的出貨單據
   #STEP2.產生應收單據
   LET li_count = 2
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      CALL cl_progress_bar_no_window(li_count)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE axrp132_process_cs CURSOR FROM ls_sql
#  FOREACH axrp132_process_cs INTO
   #add-point:process段process name="process.process"
   #210222-00016#2 --s add
   IF g_master.l_isaf001 = '3' THEN
      LET l_sql1 = "SELECT isafdocno FROM isaf_t",
                  " WHERE isafent = ",g_enterprise,
                  "   AND ",g_master.wc 
      PREPARE axrp132_pb FROM l_sql1        
      DECLARE axrp132_cur CURSOR FOR axrp132_pb
      FOREACH axrp132_cur INTO l_isafdocno
         #ait310  
         LET l_isag002 = NULL
         SELECT b.isag002 INTO l_isag002
           FROM isag_t b
           LEFT JOIN isaf_t a ON a.isafent = b.isagent AND a.isafcomp = b.isagcomp AND a.isafdocno = b.isagdocno
          WHERE b.isagent = g_enterprise
         	AND b.isagcomp = g_glaa.glaacomp
         	AND b.isagdocno = l_isafdocno 
         	AND a.isafstus <> 'X'
         	
         IF NOT cl_null(l_isag002) THEN
            IF cl_null(l_wc2) THEN
               LET l_wc2 = l_wc2 CLIPPED,l_isafdocno
            ELSE
               LET l_wc2 = l_wc2 CLIPPED,",",l_isafdocno
            END IF 
         END IF
         
         #axrt300
         LET l_xrcadocno = NULL
         SELECT b.xrcbdocno INTO l_xrcadocno
            FROM xrcb_t b
            LEFT JOIN xrca_t a ON a.xrcaent = b.xrcbent AND a.xrcald = b.xrcbld AND a.xrcadocno = b.xrcbdocno	
           WHERE b.xrcbent = g_enterprise
         	 AND b.xrcbld = g_master.xrcald
         	 AND b.xrcb002 = l_isag002
         	 AND a.xrca001 IN ('12','17')
         	 AND a.xrcastus <> 'X'
            
         IF cl_null(l_wc3) THEN
            LET l_wc3 = l_wc3 CLIPPED,l_xrcadocno
         ELSE
            LET l_wc3 = l_wc3 CLIPPED,",",l_xrcadocno
         END IF
         
      END FOREACH
      IF NOT cl_null(l_wc2) OR NOT cl_null(l_wc3) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axr-00415'
         LET l_sql2 = "SELECT gzze003 FROM gzze_t ",
                    " WHERE gzze001 = ? AND gzze002 = ?"
         DECLARE axrp132_err CURSOR FROM l_sql2
         OPEN axrp132_err USING g_errparam.code,g_dlang
         FETCH axrp132_err INTO l_gzze003
         LET l_msg1 = cl_str_replace(l_gzze003,'%1',l_wc2)
         LET l_msg1 = cl_str_replace(l_msg1,'%2',l_wc3)
         IF NOT cl_ask_confirm(l_msg1) THEN
            RETURN  
         END IF 
      END IF  
   END IF
   #210222-00016#2 --e add
   
   CALL cl_err_collect_init()
   LET g_success    = 'Y'
   LET g_totsuccess = 'Y'
   
   IF g_bgjob <> "Y"  THEN
      SELECT gzzd005 INTO l_gzzd005 FROM gzzd_t
       WHERE gzzd001 = 'axrp132' AND gzzd002 = g_lang AND gzzdstus = 'Y' AND gzzd003 = 'step1'
      CALL cl_progress_no_window_ing(l_gzzd005)
   END IF
   
   CALL axrp132_get_data()
   IF g_success = 'N' THEN
      CALL cl_err_collect_show()

      DROP TABLE axrp132_tmp01         #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01 #ODI-ORA#
      #清空進度條
      IF g_bgjob <> "Y" AND cl_null(l_gettran.xrcasite) THEN
         DISPLAY '' ,0 TO stagenow,stagecomplete
      END IF

      DROP TABLE axrp131_tmp01    #160727-00019#5   2016/07/28  By 08734    将axrp131_xmdk_tmp ——> axrp131_tmp01 #ODI-ORA#
      RETURN
   END IF
   
   CALL s_axrt300_create_tmp()
    
   CALL s_transaction_begin()
   
   IF g_bgjob <> "Y" THEN
      SELECT gzzd005 INTO l_gzzd005 FROM gzzd_t
       WHERE gzzd001 = 'axrp132' AND gzzd002 = g_lang AND gzzdstus = 'Y' AND gzzd003 = 'step2'
      CALL cl_progress_no_window_ing(l_gzzd005)
   END IF
   
   CALL axrp132_get_ar()
   #200710-00084#8 add ---s
   LET l_cnt=0
   SELECT COUNT(1) INTO l_cnt FROM axrp132_tmp02
   IF l_cnt>0 THEN #有混合單據
      CALL axrp132_get_ar2()
   END IF   
   IF NOT cl_null(g_strno) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00251'
      LET g_errparam.replace[1] = g_strno
      LET g_errparam.replace[2] = g_endno
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()   
   END IF
   CALL cl_err_collect_show()
   #200710-00084#8 add ---e  

   DROP TABLE axrp132_tmp01            #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01 #ODI-ORA#
   
   IF g_success = 'N' THEN
      IF g_bgjob <> "Y" THEN
         #清空進度條
         DISPLAY '' ,0 TO stagenow,stagecomplete
      END IF
      RETURN
   END IF
   
   #200302-00005#10 add s---
   IF NOT cl_null(g_strno) AND NOT cl_null(g_endno)THEN
      LET l_confmsg = cl_getmsg('aap-01186',g_lang),cl_getmsg('aap-01217',g_lang),cl_getmsg('aap-01187',g_lang)
      IF cl_ask_confirm(l_confmsg)THEN
         INITIALIZE lc_param_link.* TO NULL 
         LET lc_param_link.prog = g_end_prog
         LET lc_param_link.default_wc = "xrcadocno BETWEEN '",g_strno CLIPPED,"' ",
                                    " AND '",g_endno CLIPPED,"' "
         CALL cl_cmdrun(util.JSON.stringify(lc_param_link))
      END IF
   END IF
   #200302-00005#10 add e---
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
 
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL axrp132_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="axrp132.get_buffer" type="s" >}
PRIVATE FUNCTION axrp132_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.xrcasite = p_dialog.getFieldBuffer('xrcasite')
   LET g_master.xrcald = p_dialog.getFieldBuffer('xrcald')
   LET g_master.b_style = p_dialog.getFieldBuffer('b_style')
   LET g_master.l_isaf001 = p_dialog.getFieldBuffer('l_isaf001')
   LET g_master.l_isaf073 = p_dialog.getFieldBuffer('l_isaf073')
   LET g_master.xrcadocno = p_dialog.getFieldBuffer('xrcadocno')
   LET g_master.xrca007 = p_dialog.getFieldBuffer('xrca007')
   LET g_master.xrcadocdt = p_dialog.getFieldBuffer('xrcadocdt')
   LET g_master.b_check1 = p_dialog.getFieldBuffer('b_check1')
   LET g_master.b_check4 = p_dialog.getFieldBuffer('b_check4')
   LET g_master.b_check2 = p_dialog.getFieldBuffer('b_check2')
   LET g_master.b_check5 = p_dialog.getFieldBuffer('b_check5')
   LET g_master.b_check6 = p_dialog.getFieldBuffer('b_check6')
   LET g_master.l_chkisat = p_dialog.getFieldBuffer('l_chkisat')
   LET g_master.l_chk = p_dialog.getFieldBuffer('l_chk')
   LET g_master.l_price = p_dialog.getFieldBuffer('l_price')
   LET g_master.l_chkisch = p_dialog.getFieldBuffer('l_chkisch')
   LET g_master.b_comb2 = p_dialog.getFieldBuffer('b_comb2')
   LET g_master.b_comb1 = p_dialog.getFieldBuffer('b_comb1')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="axrp132.msgcentre_notify" type="s" >}
PRIVATE FUNCTION axrp132_msgcentre_notify()
 
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
 
{<section id="axrp132.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 給帳務中心、帳套賦默認值
# Memo...........:
# Usage..........: CALL axrp132_def()
#                  RETURNING ---
# Input parameter: ---
# Return code....: ---
# Date & Author..: 2014/10/09 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_def()
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
   
   LET g_master.l_price = 'Y'  #180329-00029#1 add
   #150603-00046#1 add ------
   IF NOT cl_null(g_argv[1]) AND NOT cl_null(g_argv[2]) THEN
      LET g_master.xrcasite  = g_argv[1]
      LET g_master.isafdocno = g_argv[2]
      #160922-00055#2 --s add
      IF NOT cl_null(g_argv[3]) THEN
         LET g_master.l_isaf001 = g_argv[3]
         DISPLAY BY NAME g_master.l_isaf001
         #180823-00036#1 add -s
         IF g_master.l_isaf001 MATCHES '[45]' THEN 
            CALL cl_set_comp_entry('b_check1,b_check2,b_check3,b_check4,b_check5,b_check6',FALSE)
         ELSE
            CALL cl_set_comp_entry('b_check1,b_check2,b_check3,b_check4,b_check5,b_check6',TRUE)
         END IF
         #180823-00036#1 add -e
      END IF
      #160922-00055#2 --e add
      LET g_master.l_isaf073 = g_argv[4]  #201023-00028#3 add
      LET g_master.wc = "isafdocno='",g_master.isafdocno,"'" 
      DISPLAY g_master.isafdocno TO isafdocno
      #該帳務中心與帳別無法勾稽到,以登入人員g_user取得預設帳別/法人
      CALL s_fin_orga_get_comp_ld(g_master.xrcasite) RETURNING l_success,g_errno,l_xrcacomp,g_master.xrcald   
      #若取不出資料,則不預設帳別
      IF NOT l_success THEN
         LET g_master.xrcald   = ''
      END IF
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
      
      #180823-00036#1 add -s
      SELECT isafdocdt INTO g_master.xrcadocdt
        FROM isaf_t
       WHERE isafent = g_enterprise
         AND isafcomp = l_xrcacomp
         AND isafdocno = g_master.isafdocno
      DISPLAY BY NAME g_master.xrcadocdt
      #180823-00036#1 add -e 
   ELSE
   #150603-00046#1 add end---
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
      END IF
   END IF #150603-00046#1

   IF cl_null(g_master.xrcadocdt) THEN LET g_master.xrcadocdt = g_today END IF

   IF cl_null(g_master.b_style)  THEN LET g_master.b_style = 'axrt300'  END IF
   #IF cl_null(g_master.b_comb1)  THEN LET g_master.b_comb1 = '1'  END IF    #151012-00014#1 mark lujh
   #160914-00013#1 Mark ---(S)---
  ##151012-00014#1--add--str--lujh
  #CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2009') RETURNING l_sfin2009   
  #IF l_sfin2009 = '1' THEN LET g_master.b_comb1 = '2' END IF
  #IF l_sfin2009 = '2' THEN LET g_master.b_comb1 = '3' END IF
  ##151012-00014#1--add--end--lujh
   #160914-00013#1 Mark ---(E)---
   IF cl_null(g_master.b_comb1)  THEN LET g_master.b_comb1 = '1'  END IF   #160914-00013#1 Add
   CALL cl_set_comp_visible("lbl_comb1,b_comb1",FALSE)   #160914-00013#1 Add
   #200527-00024#1 mark(s)
   ##180531-00020#2 add s---
   ##aisi090 防伪税控=Y时，l_chkisch显示，l_chkisat隐藏 
   #LET g_master.l_chkisat = 'Y'   
   #SELECT isao006 INTO g_isao006 FROM isao_t WHERE isaoent = g_enterprise AND isaosite = g_master.xrcasite 
   #IF g_isao006 = 'Y' THEN 
   #   LET g_master.l_chkisat = "N"
   #   CALL cl_set_comp_visible("l_chkisat",FALSE)
   #   CALL cl_set_comp_visible("l_chkisch",TRUE)
   #ELSE
   #   LET g_master.l_chkisat = "Y"
   #   CALL cl_set_comp_visible("l_chkisat",TRUE)
   #   CALL cl_set_comp_visible("l_chkisch",FALSE)   
   #END IF
   ##180531-00020#2 add e---
   #200527-00024#1 mark(e)
   #200527-00024#1 add(s)
   #都先預設用不啟用防偽稅控的選項
   LET g_master.l_chkisat = "Y"
   CALL cl_set_comp_visible("l_chkisat",TRUE)
   CALL cl_set_comp_visible("l_chkisch",FALSE)    
   #200527-00024#1 add(e)
   IF cl_null(g_master.b_comb2)  THEN LET g_master.b_comb2 = '1'  END IF
  #IF cl_null(g_master.b_check1) THEN LET g_master.b_check1 = 'Y' END IF   #161118-00026#1 Mark   
  #161118-00026#1 Add  ---(S)---
#   IF cl_null(g_master.b_check1) AND cl_null(g_argv[1]) THEN LET g_master.b_check1 = 'Y' ELSE LET g_master.b_check1 = 'N' END IF  #190808-00007#1 mark
   IF cl_null(g_master.b_check1) THEN LET g_master.b_check1 = 'N' END IF  #190808-00007#1 add
  #161118-00026#1 Add  ---(E)---
   IF cl_null(g_master.b_check2) THEN LET g_master.b_check2 = 'N' END IF
   #IF cl_null(g_master.b_check3) THEN LET g_master.b_check3 = 'N' END IF   #180529-00020#1 mark
   IF cl_null(g_master.b_check4) THEN LET g_master.b_check4 = 'N' END IF
   IF cl_null(g_master.b_check5) THEN LET g_master.b_check5 = 'N' END IF
   IF cl_null(g_master.b_check6) THEN LET g_master.b_check6 = 'N' END IF
   DISPLAY BY NAME g_master.xrcadocdt,g_master.b_style,g_master.b_comb1,g_master.b_comb2,
                   #g_master.b_check1,g_master.b_check2,g_master.b_check3,    #180529-00020#1 mark
                   g_master.b_check1,g_master.b_check2,    #180529-00020#1 add
                   g_master.b_check4,g_master.b_check5,g_master.b_check6

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

   #150210-00011(1)--20150330--add--
   CALL s_get_accdate(g_glaa.glaa003,g_master.xrcadocdt,'','') 
   RETURNING l_flag1,l_errno,g_glav002,g_glav005,g_sdate_s,g_sdate_e,
             g_glav006,g_pdate_s,g_pdate_e,g_glav007,g_wdate_s,g_wdate_e
   #150210-00011(1)--20150330--add--
   
   #LET g_master.l_chkisat = 'Y'   #160415-00010#1 add  #180531-00020#2 mark
   LET g_master.l_chkisch = '1'   #180531-00020#2 add 
   LET g_master.l_chk = 'Y'       #170522-00024#1 add
   DISPLAY BY NAME g_master.l_chk #170522-00024#1 add
   
   #210309-00026#1 add -s
   #允许合同或订单开票
   SELECT isao022 INTO g_isao022
     FROM isao_t 
    WHERE isaoent = g_enterprise AND isaosite = g_glaa.glaacomp
   IF cl_null(g_isao022) THEN LET g_isao022 = 'N' END IF
   IF g_isao022 = 'N' THEN
      CALL cl_set_combo_scc_part('l_isaf001','9715','1,2,3,4,5,6,7')
   ELSE
      CALL cl_set_combo_scc('l_isaf001','9715')
   END IF
   #210309-00026#1 add -e
   #160426-00013#1 add ------
   #預設對帳來源=1:出貨發票
   IF cl_null(g_master.l_isaf001) THEN
      LET g_master.l_isaf001 = '1'
      LET g_end_prog = 'axrt300'
      DISPLAY BY NAME g_master.l_isaf001
   END IF
   #160426-00013#1 add end---
   #201023-00028#3 add -s
   #是否走签收流程
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9029') RETURNING g_sfin9029
   #货票同行默认N
   IF cl_null(g_master.l_isaf073) THEN
      LET g_master.l_isaf073 = 'N'
   END IF
   IF g_master.l_isaf001 = '1' AND g_sfin9029 = 'Y' THEN
      CALL cl_set_comp_visible("l_isaf073",TRUE)
   ELSE
      CALL cl_set_comp_visible("l_isaf073",FALSE)
   END IF
   #201023-00028#3 add -e
   #161118-00026#1 Add  ---(S)---
   CASE g_master.l_isaf001
      #210309-00026#1 add -s
      WHEN '0' #0:合同发票
         LET g_end_prog = 'axrt311'
      #210309-00026#1 add-e
      WHEN '1' #1:出貨發票
         #201023-00028#3 add -s
         IF g_master.l_isaf073 = 'Y' THEN
            LET g_end_prog = 'axrt330'
         ELSE
         #201023-00028#3 add -e
            LET g_end_prog = 'axrt300'
         END IF  #201023-00028#3 add
      #160620-00010#3 --s add
      WHEN '2' #1:雜項發票
         LET g_end_prog = 'axrt330'
      #160620-00010#3 --e add
      WHEN '3' #3:訂金發票
         LET g_sfin2022 = cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2022')
         IF g_sfin2022 = '01' THEN
            #01:認列收入
            LET g_end_prog = 'axrt300'
         ELSE
            #02:認列預收
            LET g_end_prog = 'axrt310'
         END IF
      WHEN '4' #4:待抵銷退
         LET g_end_prog = 'axrt340'
      WHEN '5' #5:雜項待抵
         LET g_end_prog = 'axrt341'
   END CASE
   DISPLAY BY NAME g_master.l_isaf001
   #161118-00026#1 Add  ---(E)---
   LET g_master_o.xrcasite  = g_master.xrcasite    #190103-00017#1           
   LET g_master_o.xrcald    = g_master.xrcald      #190103-00017#1           
   LET g_master_o.xrcadocdt = g_master.xrcadocdt   #190103-00017#1   
END FUNCTION

################################################################################
# Descriptions...: 建立臨時表
# Memo...........:
# Usage..........: CALL axrp132_create_tmp()
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: 2014/10/17 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_create_tmp()
   DEFINE r_success         LIKE type_t.chr1

   LET r_success = 'Y'


   DROP TABLE axrp132_tmp01;                #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01 #ODI-ORA#
   CREATE TEMP TABLE axrp132_tmp01 (        #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01
      isagdocno      LIKE isag_t.isagdocno,
      isagcomp       LIKE isag_t.isagcomp,
      isagseq        LIKE isag_t.isagseq,
      isaf002        LIKE isaf_t.isaf002,
      isaf003        LIKE isaf_t.isaf003,
      isaf055        LIKE isaf_t.isaf055,
      isaf016        LIKE isaf_t.isaf016,
      isaf100        LIKE isaf_t.isaf100,
      isaf058        LIKE isaf_t.isaf058,
      isaf057        LIKE isaf_t.isaf057,
      isaf004        LIKE isaf_t.isaf004,
      isaf067        LIKE isaf_t.isaf067,   #160802-00007#1 Add
      isaf066        LIKE isaf_t.isaf066    #180731-00006#1 add      
   );

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = 'N'  #160826-00004#1 add
      RETURN r_success
   END IF

   #160826-00004#1--add

   DROP TABLE axrp132_detail #ODI-ORA#
   SELECT * FROM xrcd_t
    WHERE xrcdent   = 1
      AND xrcddocno = 'x'
      AND xrcdseq   = 0
   INTO TEMP axrp132_detail
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create axrp132_detail'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = 'N'
      RETURN r_success
   END IF
   #160826-00004#1--add
   
   #200710-00084#8 add ---s
   DROP TABLE axrp132_tmp02; 
   CREATE TEMP TABLE axrp132_tmp02 (  
      isagdocno      LIKE isag_t.isagdocno, #開票單號
      isagcomp       LIKE isag_t.isagcomp,  #法人
      isagseq        LIKE isag_t.isagseq,   #項次
      isag001        LIKE isag_t.isag001,   #來源類型
      isag002        LIKE isag_t.isag002,   #來源單號
      isag003        LIKE isag_t.isag003,   #來源項次
      isag004        LIKE isag_t.isag004,   #發票數量
      isag011        LIKE isag_t.isag011,   #期別
      isag103        LIKE isag_t.isag103,   #原幣未稅金額
      isag105        LIKE isag_t.isag105,   #原幣稅後金額
      isaf002        LIKE isaf_t.isaf002,   #發票客戶
      isaf003        LIKE isaf_t.isaf003,   #帳款客戶
      isaf004        LIKE isaf_t.isaf004,   #業務組織
      isaf016        LIKE isaf_t.isaf016,   #稅別
      isaf055        LIKE isaf_t.isaf055,   #收款客戶
      isaf057        LIKE isaf_t.isaf057,   #業務人員
      isaf058        LIKE isaf_t.isaf058,   #收款條件
      isaf066        LIKE isaf_t.isaf066,   #商業發票號碼(IV no.)
      isaf067        LIKE isaf_t.isaf067,   #一次性交易對象
      isaf100        LIKE isaf_t.isaf100    #幣別      
   );

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create axrp132_tmp02'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = 'N'
      RETURN r_success
   END IF   
   #200710-00084#8 add ---e
   
   
      
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 獲取符合條件的出貨單據資料
# Memo...........:
# Usage..........: CALL axrp132_get_data()
#                  RETURNING ---
# Input parameter: ---
# Return code....: ---
# Date & Author..: 2014/10/09 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_get_data()
   DEFINE l_success     LIKE type_t.chr1
   DEFINE l_count       LIKE type_t.num5
   DEFINE ls_wc         STRING
   DEFINE ls_wc2        STRING
   DEFINE ls_wc3        STRING                #151209-00023#1 add lujh
   DEFINE l_ooba002     LIKE type_t.chr10     #151209-00023#1 add lujh
   DEFINE l_origin_str  STRING
   DEFINE l_isaf        RECORD
         isagdocno      LIKE isag_t.isagdocno,
         isagcomp       LIKE isag_t.isagcomp,
         isagseq        LIKE isag_t.isagseq,
         isaf002        LIKE isaf_t.isaf002,
         isaf003        LIKE isaf_t.isaf003,
         isaf055        LIKE isaf_t.isaf055,
         isaf016        LIKE isaf_t.isaf016,
         isaf100        LIKE isaf_t.isaf100,
         isaf058        LIKE isaf_t.isaf058,
         isaf057        LIKE isaf_t.isaf057,
         isaf004        LIKE isaf_t.isaf004,
         isaf067        LIKE isaf_t.isaf067   #160802-00007#1 Add
                        END RECORD
   DEFINE l_s           LIKE type_t.chr1
   DEFINE l_sql         STRING
   DEFINE l_str         STRING
   DEFINE l_orders      STRING
   DEFINE l_ac          LIKE type_t.num5
   DEFINE l_flag         LIKE type_t.chr1
   DEFINE l_where       STRING     #160325-00023#1
   DEFINE l_cnt1        LIKE type_t.num5   #170418-00005#1---add   
   #171212-00027#1 add--s
   DEFINE l_isafdocdt   LIKE isaf_t.isafdocdt   
   DEFINE li_idx        LIKE type_t.num10       
   DEFINE l_comp        LIKE ooef_t.ooef001
   #171212-00027#1 add--e   
   DEFINE l_docno LIKE isag_t.isagdocno  #200710-00084#8 add
   DEFINE l_seq   LIKE isag_t.isagseq    #200710-00084#8 add
   
   IF cl_null(g_master.wc) THEN LET g_master.wc = " 1=1" END IF
   
   CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s

   CALL axrp132_create_tmp() RETURNING l_success   #170503-00044#1 add
   
   #171212-00027#1 add--s
   #抓当前据点的法人
   SELECT ooef017 INTO l_comp
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_master.xrcasite
      AND ooefstus = 'Y'
      
   CALL cl_get_para(g_enterprise,l_comp,'S-FIN-2007') RETURNING g_sfin2007
   LET g_date_null = 'N'   #畫面原先的日期不是空的
   IF cl_null(g_master.xrcadocdt) THEN 
      LET g_master.xrcadocdt= g_today
      LET g_date_null = 'Y'  #畫面原先的日期是空的
   END IF
   IF NOT cl_null(g_sfin2007) THEN
      IF g_master.xrcadocdt <= g_sfin2007 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aap-00110'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN
      END IF
   END IF
   #171212-00027#1 add--e
   
  #150615-00017#2 Mark ---(S)---
  #CASE
  #   WHEN l_s = 1
  #      LET ls_wc = " isaf035 IS NULL"
  #   WHEN l_s = 2
  #      LET ls_wc = " isaf048 IS NULL"
  #   WHEN l_s = 3
  #      LET ls_wc = " isaf049 IS NULL"
  #END CASE
   LET ls_wc = " 1=1"     #151214-00018#1   Add
  #150615-00017#2 Mark ---(E)---

  #150615-00017#2 Mark ---(S)---  對帳單根據帳套所屬法人限定範圍,無需用到帳務中心下屬組織Tree
  #CALL s_fin_account_center_sons_query('3',g_master.xrcasite,g_today,'')
  #CALL s_fin_account_center_sons_str()RETURNING l_origin_str
  #IF cl_null(l_origin_str) THEN LET l_origin_str = g_master.xrcasite END IF
  #CALL axrp132_get_ooef001_wc(l_origin_str)RETURNING l_origin_str
  #150615-00017#2 Mark ---(E)---

   LET g_success = 'Y'
   DELETE FROM axrp132_tmp01   #170630-00049#1

   # 可立帳數量:
   # 如果是从发票开立那只产生应收，也要根据发票对应的出货单＋项次的出货数量－已立非暂估立账数量 (amt_a)，
   # 然后根据该数量和发票开立数量(amt_b)比较，
   # 如果amt_a小于amt_b，则amt_a产生AR,如果大于则按amt_b立AR
   # 即比较发票可开立数量和出货单可开立数量比较，使用较小的一个数量立应收
   #160426-00013#1 mark ------
   #IF g_master.b_style = 'axrt300' THEN
   #   LET ls_wc2 = " AND isaf056 = '1'"
   #ELSE
   #   LET ls_wc2 = " AND isaf056 = '2'"
   #END IF
   #160426-00013#1 mark end---
   #160426-00013#1 add ------
   CASE
      #WHEN g_end_prog = 'axrt300' AND g_master.l_isaf001 = '1' #170301-00023#11 mark    
      WHEN g_end_prog MATCHES 'axrt300*' AND g_master.l_isaf001 = '1' #170301-00023#11 add
#         LET ls_wc2 = " AND isaf001 <> '3' AND isaf056 = '1'"  #201023-00028#5 mark
         LET ls_wc2 = " AND isaf001 <> '3' AND isaf056 = '1' AND (isaf073 = 'N' OR isaf073 IS NULL)"  #201023-00028#5 add
      #WHEN g_end_prog = 'axrt330'                            #160620-00010#3 add #170301-00023#11 mark    
      WHEN g_end_prog MATCHES 'axrt330*' #170301-00023#11 add
         #201023-00028#5 add -s
         IF g_master.l_isaf073 = 'Y' THEN
            LET ls_wc2 = " AND isaf001 <> '3' AND isaf056 = '1' AND isaf073 = 'Y'"
         ELSE
         #201023-00028#5 add -e         
            LET ls_wc2 = " AND isaf001 = '2' AND isaf056 = '1'" #160620-00010#3 add  
         END IF  #201023-00028#5 add
      #WHEN g_end_prog = 'axrt310' OR (g_end_prog = 'axrt300' AND g_master.l_isaf001 = '3') #170301-00023#11 mark    
      WHEN g_end_prog MATCHES 'axrt310*' OR (g_end_prog MATCHES 'axrt300*' AND g_master.l_isaf001 = '3') #170301-00023#11 add
         LET ls_wc2 = " AND isaf001 = '3' AND isaf056 = '1'"
      #210309-00026#1 add -s
      WHEN g_end_prog MATCHES 'axrt311*'  
         LET ls_wc2 = " AND isaf001 = '0' AND isaf056 IN ('1','2')"
      #210309-00026#1 add -e
      #WHEN g_end_prog = 'axrt340' #170301-00023#11 mark    
      WHEN g_end_prog MATCHES 'axrt340*' #170301-00023#11 add
         LET ls_wc2 = " AND isaf056 = '2'"
      #WHEN g_end_prog = 'axrt341'           #160920-00013#1 add #170301-00023#11 mark    
      WHEN g_end_prog MATCHES 'axrt341*' #170301-00023#11 add
         LET ls_wc2 = " AND isaf056 = '2'"  #160920-00013#1 add
   END CASE
   #160426-00013#1 add end---
   
   #151209-00023#1--add--str--lujh
   LET l_ooba002 = ''
   LET l_ooba002 = cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-1003')
   IF l_ooba002 <> '3' THEN 
      LET ls_wc3 = " AND isafstus = 'Y' "
   ELSE
      LET ls_wc3 = " AND isafstus = 'S' "
   END IF
   #151209-00023#1--add--str--lujh
   #200527-00024#1 mark(e)
   #都先走的跟一般對帳單立帳一樣
   ##180531-00020#2 add s--
   #IF g_isao006 = "Y" THEN  
   #   LET g_sql = "INSERT INTO axrp132_tmp01 ",      
   #               "SELECT isagdocno,isagcomp,isagseq,isaf002,isaf003,isaf055,isaf016,isaf100,isaf058,isaf057,isaf004,isaf067,isaf066 ", #180731-00006#1  add(isaf066)   
   #               "  FROM ( SELECT isagdocno,isagseq,isag001,isag002,isag003,isag004,",
   #               "        isaf002,isaf003,isaf055,isaf016,isaf100,isaf058,isaf057,isaf004,isaf067, ",
   #               "        isafdocno,isafdocdt,isaf035,isafstus,isaf056,isaf001,isafcomp,isafent,",
   #               "        isagcomp,isagent,isaf066,",#180731-00006#1 add(isaf066)
   #               "        isag101,",      #200427-00029#1 add
   #               #"          (SELECT SUM(isch007) FROM isch_t WHERE ischent = 99 AND ischdocno = isagdocno AND ischseq = isagseq) isch007,",  #181001-00015#88 mark
   #               "          (SELECT SUM(isch007) FROM isch_t WHERE ischent = ",g_enterprise," AND ischdocno = isagdocno AND ischseq = isagseq) isch007,",  #181001-00015#88 add
   #               #"          (SELECT NVL(SUM(xrcb007),0) FROM xrcb_t WHERE xrcbent = 99 AND xrcb049 = isagdocno AND xrcb050 = isagseq) xrcb007     ",    #180531-00020#8 mark         
   #               #"          (SELECT NVL(SUM(xrcb007),0) FROM xrcb_t,xrca_t WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcbld = xrcald AND xrcastus <> 'X' AND xrcbent = 99 AND xrcb049 = isagdocno AND xrcb050 = isagseq) xrcb007     ",    #180531-00020#8 add #181001-00015#88 mark
   #               "          (SELECT NVL(SUM(xrcb007),0) FROM xrcb_t,xrca_t WHERE xrcaent = xrcbent AND xrcadocno = xrcbdocno AND xrcbld = xrcald AND xrcastus <> 'X' AND xrcbent = ",g_enterprise," AND xrcb049 = isagdocno AND xrcb050 = isagseq) xrcb007     ",    #181001-00015#88 add
   #               "          FROM isaf_t LEFT OUTER JOIN isag_t ON isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno ",
   #               "        )",
   #               " WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno AND ",ls_wc,
   #               "   AND isafent = ",g_enterprise,    
   #               "   AND ",g_master.wc,
   #               "   AND isafcomp = '",g_glaa.glaacomp,"' ",ls_wc2,ls_wc3     
   #   IF g_isao006 = 'Y' THEN 
   #      IF g_master.l_chkisch = '1' THEN 
   #         LET g_sql = g_sql," AND isch007 > xrcb007 "
   #      ELSE
   #         LET g_sql = g_sql," AND isag004 > xrcb007 "
   #      END IF
   #   END IF
   #   
   #ELSE
   ##180531-00020#2 add e--
      
   #200527-00024#1 mark(e)
   LET g_sql = "INSERT INTO axrp132_tmp01 ",      #170503-00044#1 add 
               "SELECT isagdocno,isagcomp,isagseq,isaf002,isaf003,isaf055,isaf016,isaf100,isaf058,isaf057,isaf004,isaf067,isaf066 ",   #160802-00007#1 Add isaf067   #180731-00006#1 add(isaf066)
               "  FROM isaf_t,isag_t",
               " WHERE isafent = isagent AND isafcomp = isagcomp AND isafdocno = isagdocno AND ",ls_wc,
               "   AND isafent = ",g_enterprise,    #170112-00010#1 add lujh
               "   AND ",g_master.wc,
               "   AND isafcomp = '",g_glaa.glaacomp,"' ",ls_wc2,ls_wc3,     #151209-00023#1 add ls_wc3 lujh
               "   AND isaf035 IS NULL ",    #170706-00034#1 ADD
               #170706-00034#1 add(s)
               "   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t ",
               " WHERE xrcaent=xrcbent  AND xrcadocno=xrcbdocno AND xrcald=xrcbld ",
               "   AND xrcastus<>'X' AND xrcaent= ",g_enterprise," AND xrcb049=isafdocno AND xrcald= '",g_master.xrcald, "')"
               #170706-00034#1 add(e)  
   #END IF   #180531-00020#2 add #200527-00024#1 mark
               
               #170706-00034#1 mark(e)
                 #150615-00017#2 Add  ---(S)---
                 #"   AND NOT EXISTS (SELECT 1 FROM xrca_t,xrcb_t WHERE xrcaent = '",g_enterprise,"' AND xrcaent = xrcbent ",
                 #"                      AND xrcadocno = xrcbdocno AND xrcald = xrcbld AND xrca001 = '17' ",
                 #"                      AND xrcastus <> 'X' AND xrcb049 = isafdocno)"   
                 #150615-00017#2 Add  ---(E)---
               #170706-00034#1 mark(e)
              
               #"   AND isafdocdt BETWEEN '",g_pdate_s,"' AND '",g_pdate_e,"'"    #150210-00011(1)--20150330--add-- #170522-00024#1 mark
#               " ORDER BY isafdocdt,isafdocno,isagseq"    #151231-00010#9 mark
   #160325-00023#1 ---s---
   
   #170522-00024#1 --s add
   #跨期未暫估者可立帳 Y :  來源對帳單日期 小於等於單據日期 ; N : 出貨/銷退來源單 已立暫估量xmdl053 >0  且 其扣帳日期 之月份<> 立帳日期
   IF (g_master.l_isaf001 NOT MATCHES '[14]' AND g_master.l_chk = 'N') OR g_master.l_chk = 'Y' THEN
      #LET g_sql = g_sql," AND isafdocdt <= '",g_master.xrcadocdt,"' "  #180329-00029#1 mark 
      #180731-00017#33 -s  mark by 11387
#      LET g_sql = g_sql," AND isafdocdt <=  to_date('",g_master.xrcadocdt,"','YY-MM-DD') "  #180329-00029#1 mod  
      #180731-00017#33 -e  mark by 11387
      #180731-00017#33 -s  add by 11387
      LET g_sql = g_sql," AND isafdocdt <=  ? "    
      #180731-00017#33 -e  add by 11387     
   END IF          
   #170522-00024#1 --e add     
   
   #180329-00029#1 add--s
   IF g_master.l_price = 'N'  THEN
      LET g_sql = g_sql," AND isag101 <> 0 " 
   END IF
   #180329-00029#1 add--e
   
   #170601-00037#1---add---start---
   IF g_master.b_comb2 = '4' THEN
      LET g_sql = g_sql, " AND isaf004 IS NOT NULL"            
   END IF
   #170601-00037#1---add---end---
   #CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','','isagdocno') RETURNING g_sub_success,l_where #180509-00055#2 mark
   CALL s_aooi210_get_check_sql(g_master.xrcasite,'',g_master.xrcadocno,'4','aist310','isagdocno') RETURNING g_sub_success,l_where #180509-00055#2 add
   LET g_sql = g_sql CLIPPED," AND ",l_where 
   #160325-00023#1 ---e---
   
   #151231-00010#9--add--str--
   IF NOT cl_null(g_sql_ctrl) AND NOT g_sql_ctrl = ' 1=1'  THEN
      LET g_sql = g_sql,"   AND EXISTS (SELECT 1 FROM pmaa_t ",
                        "                WHERE pmaaent = ",g_enterprise,
                        "                  AND ",g_sql_ctrl,
                        "                  AND pmaaent = isafent ",
                        "                  AND pmaa001 = isaf003 )"
   END IF
   #160415-00010#1-----s
   IF g_master.l_chkisat = 'Y' THEN
      LET g_sql = g_sql," AND EXISTS(",
                                     " SELECT 1 FROM isat_t          ",
                                     "  WHERE isatent = isafent ",
                                     "    AND isatcomp = isafcomp    ",
                                     "    AND isatdocno = isafdocno  ",
                                     "    AND isat025 IN ('11','21') ",
                                    ")"
   END IF
   #160415-00010#1-----e
   #160908-00003#3 add ------
   #開放出貨單已確認未過帳可開立發票，但不可產生立帳單(須待出貨過帳才可立帳)
   LET g_sql = g_sql,
       #"AND (NOT EXISTS (SELECT * FROM xmdk_t WHERE xmdkent = ",g_enterprise," AND xmdkstus <> 'S'", #170605-00061#1 mark
       #170605-00061#1 add ------
       "AND (NOT EXISTS (SELECT * FROM xmdk_t WHERE xmdkent = ",g_enterprise,
      #"                AND ((xmdk000 IN ('1', '2', '3') AND xmdkstus NOT IN ('Y','S') AND xmdk002 = '1') OR", #171102-00016#1 xul mark 
       "                AND ((xmdk000 IN ('1', '2', '3') AND xmdkstus <> 'S' AND xmdk002 = '1') OR", #171102-00016#1 xul add 
       "                     (xmdk000 = '4' AND xmdkstus <> 'Y' AND xmdk002 = '3') OR",
       "                     (xmdk000 = '6' AND xmdkstus <> 'S' AND xmdk082 IN (SELECT gzcb002 FROM gzcb_t WHERE gzcb001='2088' AND gzcb003='Y'))",
       "                    )",
       #170605-00061#1 add end---
       "                AND xmdkdocno IN (SELECT DISTINCT isag002 FROM isag_t WHERE isagent = ",g_enterprise,
      #"                AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001='11'))", #171102-00016#1 xul mark 
       "                AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001 IN ('11','21')))", #171102-00016#1 xul add
       "     OR EXISTS (SELECT 1 FROM isag_t WHERE isagent = ",g_enterprise,
      #"                   AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001<>'11'))" #171102-00016#1 xul mark 
       "                   AND isagcomp=isafcomp AND isagdocno=isafdocno AND isag001 NOT IN ('11','21')))"#171102-00016#1 xul add
   #160908-00003#3 add end---
   #180731-00006#1 add-s
   LET  g_sql = g_sql," GROUP BY isagdocno,isagcomp,isagseq,isaf002,isaf003,isaf055,",
                      " isaf016,isaf100,isaf058,isaf057,isaf004,isaf067,isaf066 "
   #180731-00006#1 add-e   
 
   #LET g_sql = g_sql," ORDER BY isafdocdt,isafdocno,isagseq"  #180731-00006#1 mark select中没有这些字段
   #151231-00010#9--add--end
   PREPARE axrp132_prep FROM g_sql
   #170503-00044#1--add--str
   #180731-00017#33 -s  add by 11387   
   IF (g_master.l_isaf001 NOT MATCHES '[14]' AND g_master.l_chk = 'N') OR g_master.l_chk = 'Y' THEN
      EXECUTE axrp132_prep USING g_master.xrcadocdt
   ELSE
      EXECUTE axrp132_prep
   END IF
   #180731-00017#33 -e  add by 11387
   
   IF SQLCA.SQLCODE THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'ins axrp132_tmp01'
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup  = TRUE
      CALL cl_err()
      LET l_success = 'N' 
   END IF
    #170503-00044#1--add--end
 #170503-00044#1 mark s---   
#   DECLARE axrp132_curs CURSOR FOR axrp132_prep
#   CALL axrp132_create_tmp() RETURNING l_success 
 #170503-00044#1 mark e---
   #160826-00004#1 add--s
   IF l_success = 'N' THEN
      LET g_success = 'N'
      RETURN
   END IF
   #160826-00004#1 add--e
   #170503-00044#1 mark s---
#   FOREACH axrp132_curs INTO l_isaf.*
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.extend = 'foreach:'
#         LET g_errparam.code   = SQLCA.sqlcode
#         LET g_errparam.popup  = TRUE
#         CALL cl_err()
#         LET g_success = 'N'
#         EXIT FOREACH
#      END IF
#      INSERT INTO axrp132_tmp01 VALUES (l_isaf.*)         #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01
#   END FOREACH
   #170503-00044#1 mark e---
   
   IF g_success = 'Y' THEN
      SELECT COUNT(*) INTO l_count FROM axrp132_tmp01     #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01
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
   
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-1002') RETURNING l_flag  #170307-00079#1
   
  #20150201#1 By zhangwei Add  ---(S)---
  #LET l_str   = "isaf002||isaf003||isaf055||isaf016||isaf100"   #160125-00005#4 Mark
  #LET l_orders= "isaf002,isaf003,isaf055,isaf016,isaf100"       #160125-00005#4 Mark
  #LET l_str   = "isaf002||isaf003||isaf055||isaf100"            #160125-00005#4 Add #170307-00079#1 mark
  #LET l_orders= "isaf002,isaf003,isaf055,isaf100"               #160125-00005#4 Add #170307-00079#1 mark
   LET l_str   = "isaf002||isaf003||isaf055||isaf100||isaf058"   #170307-00079#1
   LET l_orders= "isaf002,isaf003,isaf055,isaf100,isaf058"       #170307-00079#1
   #160802-00007#1 Add  ---(S)---
   IF g_master.b_comb2 <> '1' THEN
      #180731-00006#1 mark-s
#      LET l_str   = l_str,   "||isaf067"   
#      LET l_orders= l_orders,",isaf067"
      #180731-00006#1 mark-e
      #180731-00006#1 add-s
      LET l_str   = l_str,   "||isaf067||isaf066"   
      LET l_orders= l_orders,",isaf067,isaf066"
      #180731-00006#1 add-e
   END IF
   #160802-00007#1 Add  ---(E)---
   CASE
      WHEN g_master.b_comb2 = '1'
         LET l_str   = "isagdocno docno"
         LET l_orders= "docno"
      WHEN g_master.b_comb2 = '3'
         LET l_str    = l_str,   "||isaf057"
         LET l_orders = l_orders,",isaf057"
         IF l_flag != 3 THEN
            LET l_str   = l_str,   "||isaf058"
            LET l_orders= l_orders,",isaf058"
         END IF
      WHEN g_master.b_comb2 = '4'
         LET l_str   = l_str,   "||isaf004"
         LET l_orders= l_orders,",isaf004"
   END CASE
   


   #200710-00084#8 mark ---s
   #LET l_sql = "SELECT ",l_str,",isagdocno,isagcomp,isagseq FROM axrp132_tmp01",         #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01
   #           #" ORDER BY isagdocno,isagseq,",l_orders    #170307-00079#1 mark
   #            " ORDER BY ",l_orders,",isagdocno,isagseq" #170307-00079#1
   #200710-00084#8 mark ---e

   #200710-00084#8 add ---s
   LET l_sql = " INSERT INTO axrp132_tmp02 ",
               " SELECT isagdocno,isagcomp,isagseq,isag001,isag002,",                 
               "        isag003,isag004,isag011,isag103,isag105,   ",
               "        isaf002,isaf003,isaf004,isaf016,isaf055,   ",  
               "        isaf057,isaf058,isaf066,isaf067,isaf100    ",
               "   FROM isaf_t,isag_t ",
               "  WHERE isafent = isagent AND isafent = ",g_enterprise,
               "    AND isafcomp = isagcomp AND isafdocno = isagdocno ",
               "    AND isagdocno = ? AND isagseq = ? "
   PREPARE ins_axrp132_tmp02 FROM l_sql        
   
   #若來源單據單身僅有一張訂單+期別或僅有加減項則依原匯總方式產生
   #混合單據先寫入axrp132_tmp02
   IF g_master.l_isaf001 = '3' THEN
      LET l_sql = " SELECT DISTINCT t51.isagdocno,t51.isagseq ",
                  "   FROM axrp132_tmp01 t51 ",
                  "  WHERE (((SELECT COUNT(DISTINCT isag_t.isag002) ",
                  "             FROM isag_t ",
                  "            WHERE isag_t.isagent = ",g_enterprise, 
                  "              AND isag_t.isagdocno = t51.isagdocno AND isag_t.isag002 IS NOT NULL) > 1 ", --多張訂單
                  "                    OR (SELECT COUNT( DISTINCT isag_t.isag011) FROM isag_t ",
                  "                          WHERE isag_t.isagent = ",g_enterprise," AND isag_t.isagdocno = t51.isagdocno AND isag_t.isag011 IS NOT NULL) > 1 ) ", --多個期別
                  #"                             OR ((SELECT COUNT(isag_t.isagseq) FROM isag_t WHERE isag_t.isagent = ",g_enterprise, --或無訂單只有加減項
                  #"                                     AND isag_t.isagdocno = t51.isagdocno AND isag_t.isag001 = '10') = 0) ",	
                  "           ) "        
      PREPARE mix_docno_pre FROM l_sql
      DECLARE mix_docno_cs CURSOR FOR mix_docno_pre
      FOREACH mix_docno_cs INTO l_docno,l_seq
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.extend = 'sel axrp132_tmp01'         
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET g_success = 'N'
            EXIT FOREACH
         END IF
         
         EXECUTE ins_axrp132_tmp02 USING l_docno,l_seq
      
      END FOREACH
      
   END IF
      
   LET l_sql = "SELECT ",l_str,",isagdocno,isagcomp,isagseq FROM axrp132_tmp01 t51 ",
               " WHERE NOT EXISTS (SELECT 1 FROM axrp132_tmp02 t52 ",
               "                    WHERE t51.isagdocno = t52.isagdocno ",
               "                      AND t51.isagseq = t52.isagseq) ",   
               " ORDER BY ",l_orders,",isagdocno,isagseq "               
   #200710-00084#8 add ---e
   PREPARE axrp132_ar_prep FROM l_sql
   DECLARE axrp132_ar_curs CURSOR FOR axrp132_ar_prep
   CALL g_isaf_d.clear()    #170630-00049#1
   LET l_ac = 1
   FOREACH axrp132_ar_curs INTO g_isaf_d[l_ac].*
      #IF g_isao006 <> 'Y' THEN #180531-00020#2 add #200527-00024#1 mark
         #170418-00005#1----add----str
         LET l_cnt1 = 0
         SELECT count(*) INTO l_cnt1
         FROM xrca_t
         WHERE xrcaent= g_enterprise
         AND xrcald = g_master.xrcald
         AND xrca018 = g_isaf_d[l_ac].isafdocno
#         ANd xrcastis <> 'X'   #180529-00058#1---mark
         AND xrcastus <> 'X'   #180529-00058#1---add
         IF l_cnt1 > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = g_isaf_d[l_ac].isafdocno
            LET g_errparam.code   = 'ais-00086'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET g_success = 'N'  
         END IF
         #170418-00005#1----add----end
      #END IF #180531-00020#2 add  #200527-00024#1 mark
      LET l_ac = l_ac + 1
   END FOREACH 
   CALL g_isaf_d.deleteElement(l_ac)
   LET l_ac = l_ac - 1
  #20150201#1 By zhangwei Add  ---(E)---

END FUNCTION

################################################################################
# Descriptions...: 產生應收單據
# Memo...........:
# Usage..........: CALL axrp132_get_ar()
#                  RETURNING ---
# Input parameter: ---
# Return code....: ---
# Date & Author..: 2014/10/09 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_get_ar()
   DEFINE l_sql         STRING
   DEFINE l_str         STRING
   DEFINE l_orders      STRING
  #DEFINE l_order       LIKE type_t.chr200   #20150201#1 By zhangwei Mark
   DEFINE l_order_t     LIKE type_t.chr200
   #161128-00061#3-----modify--begin----------
   #DEFINE l_isaf        RECORD LIKE isaf_t.*
   #DEFINE l_isag        RECORD LIKE isag_t.*
   DEFINE l_isaf RECORD  #銷項發票主檔
       isafent LIKE isaf_t.isafent, #企業編碼
       isafsite LIKE isaf_t.isafsite, #帳務組織
       isafcomp LIKE isaf_t.isafcomp, #法人
       isafdocno LIKE isaf_t.isafdocno, #開票單號
       isafdocdt LIKE isaf_t.isafdocdt, #輸入日期
       isaf001 LIKE isaf_t.isaf001, #發票來源
       isaf002 LIKE isaf_t.isaf002, #發票客戶
       isaf003 LIKE isaf_t.isaf003, #帳款客戶
       isaf004 LIKE isaf_t.isaf004, #業務組織
       isaf005 LIKE isaf_t.isaf005, #開票人員
       isaf006 LIKE isaf_t.isaf006, #開票部門
       isaf007 LIKE isaf_t.isaf007, #扣帳日期
       isaf008 LIKE isaf_t.isaf008, #發票類型
       isaf009 LIKE isaf_t.isaf009, #電子發票否
       isaf010 LIKE isaf_t.isaf010, #發票編號
       isaf011 LIKE isaf_t.isaf011, #發票號碼
       isaf012 LIKE isaf_t.isaf012, #發票檢查碼
       isaf013 LIKE isaf_t.isaf013, #發票防偽隨機碼
       isaf014 LIKE isaf_t.isaf014, #發票日期
       isaf015 LIKE isaf_t.isaf015, #發票時間
       isaf016 LIKE isaf_t.isaf016, #稅別
       isaf017 LIKE isaf_t.isaf017, #含稅否
       isaf018 LIKE isaf_t.isaf018, #稅率
       isaf019 LIKE isaf_t.isaf019, #申報格式
       isaf020 LIKE isaf_t.isaf020, #發票號碼迄號
       isaf021 LIKE isaf_t.isaf021, #購貨方名稱
       isaf022 LIKE isaf_t.isaf022, #購貨方統一編號
       isaf023 LIKE isaf_t.isaf023, #購貨方地址
       isaf024 LIKE isaf_t.isaf024, #購貨方電話
       isaf025 LIKE isaf_t.isaf025, #購貨方開戶銀行
       isaf026 LIKE isaf_t.isaf026, #購貨方帳戶編碼
       isaf027 LIKE isaf_t.isaf027, #銷貨方名稱
       isaf028 LIKE isaf_t.isaf028, #銷方統一編號
       isaf029 LIKE isaf_t.isaf029, #銷貨方地址
       isaf030 LIKE isaf_t.isaf030, #銷貨方電話
       isaf031 LIKE isaf_t.isaf031, #銷貨方開戶銀行
       isaf032 LIKE isaf_t.isaf032, #銷貨方帳號
       isaf033 LIKE isaf_t.isaf033, #POS機號
       isaf034 LIKE isaf_t.isaf034, #POS單號
       isaf035 LIKE isaf_t.isaf035, #應收單號
       isaf036 LIKE isaf_t.isaf036, #發票異動狀態
       isaf037 LIKE isaf_t.isaf037, #異動理由碼
       isaf038 LIKE isaf_t.isaf038, #異動備註
       isaf039 LIKE isaf_t.isaf039, #異動日期
       isaf040 LIKE isaf_t.isaf040, #異動時間
       isaf041 LIKE isaf_t.isaf041, #異動人員
       isaf042 LIKE isaf_t.isaf042, #專案作廢核准文號
       isaf043 LIKE isaf_t.isaf043, #通關方式註記
       isaf044 LIKE isaf_t.isaf044, #列印次數
       isaf045 LIKE isaf_t.isaf045, #支付工具卡號1
       isaf046 LIKE isaf_t.isaf046, #支付工具卡號2
       isaf047 LIKE isaf_t.isaf047, #支付工具卡號3
       isaf048 LIKE isaf_t.isaf048, #輔助帳二應收單號
       isaf049 LIKE isaf_t.isaf049, #輔助帳三應收單號
       isaf050 LIKE isaf_t.isaf050, #產生方式
       isaf051 LIKE isaf_t.isaf051, #發票簿號
       isaf052 LIKE isaf_t.isaf052, #發票簿號對應的營運據點
       isaf053 LIKE isaf_t.isaf053, #發票聯數
       isaf054 LIKE isaf_t.isaf054, #課稅別
       isaf055 LIKE isaf_t.isaf055, #收款客戶
       isaf056 LIKE isaf_t.isaf056, #發票性質
       isaf057 LIKE isaf_t.isaf057, #業務人員
       isaf058 LIKE isaf_t.isaf058, #收款條件
       isaf100 LIKE isaf_t.isaf100, #幣別
       isaf101 LIKE isaf_t.isaf101, #匯率
       isaf103 LIKE isaf_t.isaf103, #發票原幣未稅金額
       isaf104 LIKE isaf_t.isaf104, #發票原幣稅額
       isaf105 LIKE isaf_t.isaf105, #發票原幣含稅金額
       isaf106 LIKE isaf_t.isaf106, #發票原幣留抵稅額
       isaf107 LIKE isaf_t.isaf107, #發票原幣已折金額
       isaf108 LIKE isaf_t.isaf108, #發票原幣已折稅額
       isaf113 LIKE isaf_t.isaf113, #發票本幣未稅金額
       isaf114 LIKE isaf_t.isaf114, #發票本幣稅額
       isaf115 LIKE isaf_t.isaf115, #發票本幣含稅金額
       isaf116 LIKE isaf_t.isaf116, #發票本幣留抵稅額
       isaf117 LIKE isaf_t.isaf117, #發票本幣已折金額
       isaf118 LIKE isaf_t.isaf118, #發票本幣已折稅額
       isaf119 LIKE isaf_t.isaf119, #帳款應稅金額
       isaf120 LIKE isaf_t.isaf120, #帳款零稅金額
       isaf121 LIKE isaf_t.isaf121, #帳款免稅金額
       isaf122 LIKE isaf_t.isaf122, #禮券已開發票金額
       isaf123 LIKE isaf_t.isaf123, #禮券已開發票稅額
       isaf124 LIKE isaf_t.isaf124, #已開發票留抵稅額
       isaf201 LIKE isaf_t.isaf201, #愛心碼
       isaf202 LIKE isaf_t.isaf202, #載具類別號碼
       isaf203 LIKE isaf_t.isaf203, #載具顯碼 ID
       isaf204 LIKE isaf_t.isaf204, #載具隱碼 ID
       isaf205 LIKE isaf_t.isaf205, #電子發票匯出狀態
       isaf206 LIKE isaf_t.isaf206, #電子發票匯出序號
       isaf207 LIKE isaf_t.isaf207, #電子發票領取方式
       isaf208 LIKE isaf_t.isaf208, #申報年度
       isaf209 LIKE isaf_t.isaf209, #申報月份
       isaf210 LIKE isaf_t.isaf210, #申報據點
       isafstus LIKE isaf_t.isafstus, #狀態碼
       isafownid LIKE isaf_t.isafownid, #資料所有者
       isafowndp LIKE isaf_t.isafowndp, #資料所有部門
       isafcrtid LIKE isaf_t.isafcrtid, #資料建立者
       isafcrtdp LIKE isaf_t.isafcrtdp, #資料建立部門
       isafcrtdt LIKE isaf_t.isafcrtdt, #資料創建日
       isafmodid LIKE isaf_t.isafmodid, #資料修改者
       isafmoddt LIKE isaf_t.isafmoddt, #最近修改日
       isafcnfid LIKE isaf_t.isafcnfid, #資料確認者
       isafcnfdt LIKE isaf_t.isafcnfdt, #資料確認日
       isaf059 LIKE isaf_t.isaf059, #適用零稅率規定
       isaf060 LIKE isaf_t.isaf060, #通關方式
       isaf061 LIKE isaf_t.isaf061, #非經海關證明文件名稱
       isaf062 LIKE isaf_t.isaf062, #非經海關證明文件號碼
       isaf063 LIKE isaf_t.isaf063, #經由海關出口報單類別
       isaf064 LIKE isaf_t.isaf064, #出口報單號碼
       isaf065 LIKE isaf_t.isaf065, #輸出或結匯日期
       isaf066 LIKE isaf_t.isaf066, #商業發票號碼(IV no.)
       isaf067 LIKE isaf_t.isaf067  #一次性交易對象
       END RECORD
   DEFINE l_isag RECORD  #銷項發票來源明細檔
       isagent LIKE isag_t.isagent, #企業編號
       isagcomp LIKE isag_t.isagcomp, #法人
       isagdocno LIKE isag_t.isagdocno, #開票單號
       isagseq LIKE isag_t.isagseq, #項次
       isagorga LIKE isag_t.isagorga, #來源組織
       isag001 LIKE isag_t.isag001, #來源類型
       isag002 LIKE isag_t.isag002, #來源單號
       isag003 LIKE isag_t.isag003, #來源項次
       isag004 LIKE isag_t.isag004, #發票數量
       isag005 LIKE isag_t.isag005, #發票單位
       isag006 LIKE isag_t.isag006, #稅別
       isag007 LIKE isag_t.isag007, #含稅否
       isag008 LIKE isag_t.isag008, #稅率
       isag009 LIKE isag_t.isag009, #料號
       isag010 LIKE isag_t.isag010, #品名
       isag011 LIKE isag_t.isag011, #期別
       isag012 LIKE isag_t.isag012, #收款條件
       isag013 LIKE isag_t.isag013, #原始發票編號
       isag014 LIKE isag_t.isag014, #原始發票號碼
       isag015 LIKE isag_t.isag015, #正負值
       isag016 LIKE isag_t.isag016, #客戶料號
       isag017 LIKE isag_t.isag017, #客戶品名
       isag101 LIKE isag_t.isag101, #原幣單價
       isag103 LIKE isag_t.isag103, #原幣未稅金額
       isag104 LIKE isag_t.isag104, #原幣稅額
       isag105 LIKE isag_t.isag105, #原幣稅後金額
       isag106 LIKE isag_t.isag106, #訂金發票已被攤未稅額
       isag113 LIKE isag_t.isag113, #本幣未稅金額
       isag114 LIKE isag_t.isag114, #本幣稅額
       isag115 LIKE isag_t.isag115, #本幣稅後金額
       isag116 LIKE isag_t.isag116, #原幣已收金額
       isag117 LIKE isag_t.isag117, #本幣已收金額
       isag126 LIKE isag_t.isag126, #輔助帳二原幣已收金額　
       isag127 LIKE isag_t.isag127, #輔助帳二本幣已收金額　
       isag128 LIKE isag_t.isag128, #輔助帳二應收單號
       isag136 LIKE isag_t.isag136, #輔助帳三原幣已收金額　
       isag137 LIKE isag_t.isag137, #輔助帳二本幣已收金額　
       isag138 LIKE isag_t.isag138, #輔助帳三應收單號
       isag018 LIKE isag_t.isag018 #訂金已開發票
       ,isag022 LIKE isag_t.isag022, #項目編號   #190423-00042#8 add
       isag023 LIKE isag_t.isag023  #WBS編號   #190423-00042#8 add    
       END RECORD

   #161128-00061#3-----modify--end----------
   #DEFINE l_success     LIKE type_t.chr1    #160511-00016#1 
   DEFINE l_xrca001     LIKE xrca_t.xrca001
   DEFINE l_slip        LIKE xrca_t.xrcadocno
   DEFINE l_xrcadocno   LIKE xrca_t.xrcadocno
  #DEFINE l_isafdocno   LIKE isaf_t.isafdocno   #20150201#1 By zhangwei Mark
  #DEFINE l_isafcomp    LIKE isaf_t.isafcomp   #20150201#1 By zhangwei Mark
  #DEFINE l_isagseq     LIKE isag_t.isagseq   #20150201#1 By zhangwei Mark
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
   DEFINE l_cnt          LIKE xrcb_t.xrcbseq
   DEFINE l_s            LIKE type_t.chr1
   DEFINE l_xrca034      LIKE xrca_t.xrca034
   DEFINE l_xrca035      LIKE xrca_t.xrca035
   DEFINE l_xrca036      LIKE xrca_t.xrca036
   DEFINE l_xrcb005      LIKE xrcb_t.xrcb005
   DEFINE l_xrcb103      LIKE xrcb_t.xrcb103
   DEFINE l_xrcb105      LIKE xrcb_t.xrcb105
   DEFINE l_oodb005      LIKE oodb_t.oodb005
   DEFINE l_flag         LIKE type_t.chr1
   DEFINE l_xmdk000      LIKE xmdk_t.xmdk000
   DEFINE l_xmdl003      LIKE xmdl_t.xmdl003
   DEFINE l_xmdl004      LIKE xmdl_t.xmdl004
   DEFINE l_xrcb022      LIKE xrcb_t.xrcb022
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_xmdlnum      LIKE xmdl_t.xmdl038
   DEFINE l_xrcd009      LIKE xrcd_t.xrcd009
   DEFINE l_ooba002      LIKE ooba_t.ooba002
   DEFINE l_sfin2012     LIKE type_t.chr1
   DEFINE l_start_no     LIKE xrca_t.xrcadocno   #20150201  BY zhangwei
   DEFINE l_end_no       LIKE xrca_t.xrcadocno   #20150201  BY zhangwei
   DEFINE l_end_no_t     LIKE xrca_t.xrcadocno   #20150201  BY zhangwei
  #DEFINE l_amount       LIKE type_t.num5        #20150201  BY zhangwei #150605 mark By Reanna
   DEFINE l_amount       LIKE xmdl_t.xmdl022     #150605    By Reanna
   DEFINE l_doc_success  LIKE type_t.num5        #20150201  BY zhangwei  
   DEFINE l_tot_success  LIKE type_t.num5        #20150201  BY zhangwei
   DEFINE li_idx         LIKE type_t.num5        #20150201  BY zhangwei
   DEFINE l_xrcb002      LIKE xrcb_t.xrcb002     #20150201  BY zhangwei
   DEFINE l_xrcb003      LIKE xrcb_t.xrcb003     #20150201  BY zhangwei
   DEFINE l_xrcb007      LIKE xrcb_t.xrcb007     #20150201  BY zhangwei
   DEFINE l_dfin0030     LIKE type_t.chr1        #20150201  BY zhangwei
   DEFINE l_xmdk004      LIKE xmdk_t.xmdk004     #150807-00010#1
   DEFINE l_xmdk082      LIKE xmdk_t.xmdk082     #150807-00010#1
   DEFINE l_xmdl050      LIKE xmdl_t.xmdl050     #150807-00010#1
   #151125-00006#1----add--s
   DEFINE  l_slip_success   LIKE type_t.num5
   DEFINE  l_conf_success   LIKE type_t.num5
   DEFINE  l_dfin0031       LIKE type_t.chr1
   DEFINE  l_dfin0032       LIKE type_t.chr1
   DEFINE  l_gl_slip        LIKE ooba_t.ooba002 
   #151125-00006#1----add--e
   #151130-00015#3 Add  ---(S)---
   DEFINE la_param          RECORD
          prog              STRING,
          param             DYNAMIC ARRAY OF STRING,
          p_style           LIKE type_t.chr10,       #類型 axrt300 axrt340
          p_check           STRING,                  #160426-00013#1 add,
          p_isafdocno       LIKE isaf_t.isafdocno    #160426-00013#1
                            END RECORD
   DEFINE ls_js             STRING
   #151130-00015#3 Add  ---(E)---
   #151008-00009#8--s
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
   DEFINE l_rmaa005         LIKE rmaa_t.rmaa005 #150518-00046#5 add
   DEFINE l_success         LIKE type_t.num5    #160511-00016#1 add
   DEFINE l_glab003         LIKE glab_t.glab003 #170225-00002#1 add
   #170306-00026#1--add--s--xul
   DEFINE l_controlno     LIKE ooha_t.ooha001
   #170306-00026#1--add--e--xul
   DEFINE l_xmdb001       LIKE xmdb_t.xmdb001   #170321-00125#1  
   #170503-00044#1--add--str--
   DEFINE l_oodb004         LIKE oodb_t.oodb004      
   DEFINE l_isafdocno_t     LIKE isaf_t.isafdocno    
   DEFINE l_xrcb034         LIKE xrcb_t.xrcb034 
   #170503-00044#1--add--end--      
   #170522-00024#1 --s add
   DEFINE l_xmdl053     LIKE xmdl_t.xmdl053
   DEFINE l_yy          LIKE type_t.chr10
   DEFINE l_mm          LIKE type_t.chr10
   #170522-00024#1 --e add    
   DEFINE l_xmdk001     LIKE xmdk_t.xmdk001 #170712-00047#1 add
   #170413-00024#2 add s---
   DEFINE l_xmdk003     LIKE xmdk_t.xmdk003
   DEFINE l_xmdk004_1   LIKE xmdk_t.xmdk004
   #170413-00024#2 add e---
   #180105-00048#1---add---str
   DEFINE l_xmdk030     LIKE xmdk_t.xmdk030
   DEFINE l_xmdl030     LIKE xmdl_t.xmdl030
   DEFINE l_xmdl031     LIKE xmdl_t.xmdl031
   #180105-00048#1---add---end
   #171013-00004#3--add--s--xul
   DEFINE l_xmdl014     LIKE xmdl_t.xmdl014
   DEFINE l_xmdl007     LIKE xmdl_t.xmdl007 
   #171013-00004#3--add--e--xul
   DEFINE l_ooib027     LIKE ooib_t.ooib027  #171229-00043#2 add 
   #180531-00020#2 add s---
   DEFINE l_isch007_sum  LIKE isch_t.isch007  
   DEFINE l_xrcb007_sum  LIKE xrcb_t.xrcb007 #对账单对应的立账数量
   DEFINE l_isag004      LIKE isag_t.isag004  
   DEFINE l_amounta      LIKE xmdl_t.xmdl022
   DEFINE l_amountb      LIKE xmdl_t.xmdl022     
   DEFINE l_xrcb113      LIKE xrcb_t.xrcb113
   DEFINE l_xrcb         RECORD
                         xrcb103  LIKE xrcb_t.xrcb103,
                         xrcb104  LIKE xrcb_t.xrcb104,
                         xrcb105  LIKE xrcb_t.xrcb105,      
                         xrcb113  LIKE xrcb_t.xrcb113,
                         xrcb114  LIKE xrcb_t.xrcb114,
                         xrcb115  LIKE xrcb_t.xrcb115                       
                         END RECORD
   DEFINE l_isch         RECORD  
                         isch113  LIKE isch_t.isch113,
                         isch114  LIKE isch_t.isch114,
                         isch115  LIKE isch_t.isch115                       
                         END RECORD  
   DEFINE l_flag1        LIKE type_t.num5 
   DEFINE l_isaf035      LIKE isaf_t.isaf035
   DEFINE l_isaf048      LIKE isaf_t.isaf048
   DEFINE l_isaf049      LIKE isaf_t.isaf049
   DEFINE l_xmdl038      LIKE xmdl_t.xmdl038
   #180531-00020#2 add e---
   DEFINE l_xmdk031      LIKE xmdk_t.xmdk031  #180928-00002#1 add 
   #180705-00083#1 add -s
   DEFINE l_xrcb2       RECORD
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
   DEFINE l_xrcb3       RECORD
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
   #180705-00083#1 add -e
   DEFINE l_pmaa004       LIKE pmaa_t.pmaa004  #181227-00033#1 add
   DEFINE l_imaf111       LIKE imaf_t.imaf111  #190812-00010#5 add 
   DEFINE l_kind          STRING #190812-00010#5 add 
   DEFINE l_type          LIKE type_t.chr5     #190305-00001#3 add
   DEFINE l_sfin9025      LIKE type_t.chr1     #190423-00042#32 add 
   DEFINE l_xrcb035       LIKE xrcb_t.xrcb035  #191030-00020#1 add
   DEFINE l_xmdl051       LIKE xmdl_t.xmdl051  #200317-00037#1 add
   DEFINE l_imaa004       LIKE imaa_t.imaa004  #200317-00037#1 add
   #190318-00028#6   add-S
   DEFINE l_oobl002       LIKE oobl_t.oobl002  #单别对应的作业编号
   DEFINE l_gzzz002       LIKE gzzz_t.gzzz002  #作业对应的程式编号
   DEFINE l_success_1     LIKE type_t.num5     
   #190318-00028#6   add-E
   #200902-00059#1 add(s)
   DEFINE l_xrca058       LIKE xrca_t.xrca058
   DEFINE l_xmdk031_cnt   LIKE type_t.num5
   #200902-00059#1 add(e)
   #201023-00028#5 add -s
   DEFINE l_xrcbseq       LIKE xrcb_t.xrcbseq
   DEFINE l_xrcb123       LIKE xrcb_t.xrcb123
   DEFINE l_xrcb133       LIKE xrcb_t.xrcb133
   DEFINE l_oodb002       LIKE oodb_t.oodb002
   DEFINE l_xrcd103       LIKE xrcd_t.xrcd103
   DEFINE l_xrcd104       LIKE xrcd_t.xrcd104
   DEFINE l_xrcd105       LIKE xrcd_t.xrcd105
   DEFINE l_xrcd113       LIKE xrcd_t.xrcd113
   DEFINE l_xrcd114       LIKE xrcd_t.xrcd114
   DEFINE l_xrcd115       LIKE xrcd_t.xrcd115
   DEFINE l_xrcd123       LIKE xrcd_t.xrcd123
   DEFINE l_xrcd124       LIKE xrcd_t.xrcd124
   DEFINE l_xrcd125       LIKE xrcd_t.xrcd125
   DEFINE l_xrcd133       LIKE xrcd_t.xrcd133
   DEFINE l_xrcd134       LIKE xrcd_t.xrcd134
   DEFINE l_xrcd135       LIKE xrcd_t.xrcd135
   #201023-00028#5 add -e
   DEFINE r_success       LIKE type_t.num5 #200710-00084#8 add
   DEFINE l_xmdk084       LIKE xmdk_t.xmdk084  #201223-00032#1 add
   #210301-00010#1 add -s
   DEFINE l_sfin9029      LIKE type_t.chr1  
   DEFINE l_cnt1          LIKE type_t.num5
   #210301-00010#1 add -e
   
   #STEP1.依照匯總條件將出貨單資料匯總、排序
   #STEP2.將資料插入xrca_t
   #STEP3.將出貨單資料插入xrcb_t、xrcd_t
   #STEP4.将单身金额回写至单头
   #STEP5.產生多帳期資料

   CALL s_fin_get_doc_para(g_master.xrcald,g_glaa.glaacomp,g_master.xrcadocno,'D-FIN-0030') RETURNING l_dfin0030
   CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-1002') RETURNING l_flag
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9029') RETURNING l_sfin9029  #210301-00010#1 add    

  #20150201#1 By zhangwdei Mark ---(S)---
  #LET l_str   = "isaf002||isaf003||isaf055||isaf016||isaf100"
  #LET l_orders= "isaf002,isaf003,isaf055,isaf016,isaf100"
  #CASE
  #   WHEN g_master.b_comb2 = '1'
  #      LET l_str   = "isagdocno docno"
  #      LET l_orders= "docno"
  #   WHEN g_master.b_comb2 = '3'
  #      LET l_str   = l_str,   "||isaf057"
  #      LET l_orders= l_orders,",isaf057"
  #      IF l_flag != 3 THEN
  #         LET l_str   = l_str,   "||isaf058"
  #         LET l_orders= l_orders,",isaf058"
  #      END IF
  #   WHEN g_master.b_comb2 = '4'
  #      LET l_str   = l_str,   "||isaf004"
  #      LET l_orders= l_orders,",isaf004"
  #END CASE
  #
  #LET l_sql = "SELECT ",l_str,",isagdocno,isagcomp,isagseq FROM axrp132_tmp01",      #160727-00019#5   2016/07/28  By 08734    将axrp132_isaf_tmp ——> axrp132_tmp01
  #            " ORDER BY isagdocno,isagseq,",l_orders
  #PREPARE axrp132_ar_prep FROM l_sql
  #DECLARE axrp132_ar_curs CURSOR FOR axrp132_ar_prep
  #20150201#1 By zhangwei Mark ---(E)---

   #20150201#1   By zhangwei Add ---(S)---
   LET l_sql = "SELECT xmdkdocno,xmdkent FROM xmdk_t WHERE xmdkent = ? AND xmdkdocno = ? FOR UPDATE"
   LET l_sql = cl_sql_forupd(l_sql)                #轉換不同資料庫語法
   LET l_sql = cl_sql_add_mask(l_sql)              #遮蔽特定資料
   DECLARE axrp133_cl CURSOR FROM l_sql            # LOCK CURSOR

   CASE
      WHEN l_s = 1
       LET l_sql = "SELECT xmdl022 - xmdl038,xmdl038 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"' AND xmdldocno = ? AND xmdlseq = ?" #180531-00020#2 add xmdl038
      WHEN l_s = 2
       LET l_sql = "SELECT xmdl022 - xmdl039,xmdl039 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"' AND xmdldocno = ? AND xmdlseq = ?" #180531-00020#2 add xmdl039
      WHEN l_s = 3
       LET l_sql = "SELECT xmdl022 - xmdl040,xmdl040 FROM xmdl_t WHERE xmdlent = '",g_enterprise,"' AND xmdldocno = ? AND xmdlseq = ?" #180531-00020#2 add xmdl040
   END CASE
   PREPARE axrp133_amount FROM l_sql
   
   #170627-00002#1-----s
   LET l_sql = "SELECT xmdldocno,xmdlseq FROM xmdl_t WHERE xmdlent = ",g_enterprise," AND xmdldocno = ? AND xmdlseq = ? FOR UPDATE"
   LET l_sql = cl_sql_forupd(l_sql)                #轉換不同資料庫語法
   LET l_sql = cl_sql_add_mask(l_sql)              #遮蔽特定資料
   DECLARE axrp133_xmdlcl CURSOR FROM l_sql

   #170627-00002#1-----e

   LET l_sql = "SELECT xrcb002,xrcb003,xrcb007 FROM xrcb_t WHERE xrcbent = '",g_enterprise,"' AND xrcbld = '",g_master.xrcald,"' AND xrcbdocno = ?"
   PREPARE axrp132_bak_prep FROM l_sql
   DECLARE axrp132_bak_curs CURSOR FOR axrp132_bak_prep
   
   #180827-00015# add s---
   LET l_sql = " SELECT xmda033 FROM xmda_t WHERE xmdaent = ",g_enterprise," AND xmdadocno = ? "
   PREPARE sel_xmda033_1 FROM l_sql
   
   LET l_sql = " SELECT xmda033 FROM xmda_t WHERE  xmdaent = ",g_enterprise,
               "    AND xmdadocno IN (SELECT xmdk006 FROM xmdk_t WHERE xmdkent = ",g_enterprise," AND xmdkdocno = ? )"
   PREPARE sel_xmda033_2 FROM l_sql
   #180827-00015# add e---         
   
   #200317-00037#1 add s---
   LET l_sql = " SELECT imaa004 ",
               "   FROM imaa_t ",
               "  WHERE imaaent = ",g_enterprise," ",
               "    AND imaa001=? "
   PREPARE selimaa_p FROM l_sql   
   #200317-00037#1 add e---     

   #20150201#1   By zhangwei Add ---(E)---
  

   #170522-00024#1 --s add 取得已立暫估量
   LET l_yy = YEAR(g_master.xrcadocdt)
   LET l_mm = MONTH(g_master.xrcadocdt)      
   #LET l_sql = " SELECT xmdl053 ",          #170712-00047#1 mark
   LET l_sql = " SELECT xmdl053,xmdk001 ",   #170712-00047#1 add xmdk001
               "   FROM xmdk_t,xmdl_t",
               "  WHERE xmdkent = ",g_enterprise," AND xmdkdocno = ? AND xmdlseq =  ? ",
               "    AND xmdkent = xmdlent AND xmdkdocno = xmdldocno ", 
               #180731-00017#33 -s  mark by 11387
#               "    AND ((TO_CHAR(xmdk001,'YYYY') = '",l_yy,"' ",
#               "        AND TO_CHAR(xmdk001,'MM') <> '",l_mm,"') ",
#               "     OR TO_CHAR(xmdk001,'YYYY') <> '",l_yy,"') " 
               #180731-00017#33 -e  mark by 11387
               #180731-00017#33 -s  add by 11387
               "    AND (xmdk001 > ? OR xmdk001 < ?) " 
               #180731-00017#33 -e  add by 11387                 
   PREPARE axrp132_get_xmdl053_p FROM l_sql   
   #170522-00024#1 --e add  

   #180531-00020#2 add s---
   #开票数量
   LET l_sql = " SELECT SUM(isch007) FROM isch_t,isag_t ",
               "  WHERE ischent = isagent AND ischdocno = isagdocno ",
               "  AND ischseq = isagseq AND ischent = ",g_enterprise,
               "  AND isagdocno = ? AND isagseq = ? "
   PREPARE axrp132_get_isch007_p FROM l_sql 

   #對應到該對帳單已立帳數量
   LET l_sql = " SELECT SUM(xrcb007) FROM xrcb_t,xrca_t ",
               " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno ",
               "   AND xrcbent = ",g_enterprise," AND xrcald = ? ",
               "   AND xrcb049 = ? AND xrcb050 = ? AND xrcastus <> 'X' "
   PREPARE axrp132_get_xrcb007_p FROM l_sql 
   
   #手动AR已立帳數量
   LET l_sql = " SELECT SUM(xrcb007) FROM xrcb_t,xrca_t ",
               " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno ",
               "   AND xrcbent = ",g_enterprise," AND xrcald = ? ",
               "   AND xrcb002 = ? AND xrcb003 = ? AND xrcb049 IS NULL AND xrcb050 IS NULL AND xrcastus <> 'X' "
   PREPARE axrp132_get_xrcb0071_p FROM l_sql    
   
   #發票數量 isag004
   LET l_sql = " SELECT SUM(isag004) FROM isag_t ",
               " WHERE isagent = ",g_enterprise," AND isagcomp = ? ",
               "   AND isagdocno = ? AND isagseq = ?"
   PREPARE axrp132_get_isag004_p FROM l_sql   

   #开票单isch 本幣未稅/本幣稅額/本幣含稅
   LET l_sql = " SELECT SUM(isch113),SUM(isch114),SUM(isch115) FROM isch_t,isag_t ",
               "  WHERE ischent = isagent AND ischdocno = isagdocno ",
               "  AND ischseq = isagseq AND ischent = ",g_enterprise,
               "  AND isagdocno = ? AND isagseq = ? "
   PREPARE axrp132_get_ischsum_p FROM l_sql            
   
   #該對帳單已立帳的xrcb 本幣未稅/本幣稅額/本幣含稅
   LET l_sql = " SELECT SUM(xrcb103),SUM(xrcb104),SUM(xrcb105),SUM(xrcb113),SUM(xrcb114),SUM(xrcb115) FROM xrcb_t,xrca_t ",
               " WHERE xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno ",
               "   AND xrcbent = ",g_enterprise," AND xrcald = ? ",
               "   AND xrcb049 = ? AND xrcb050 = ? AND xrcastus <> 'X' "
   PREPARE axrp132_get_xrcbsum_p FROM l_sql 
   
   #180531-00020#2 add e---

   #170503-00044#1--add--str--
   LET l_sql = "INSERT INTO xrcd_t(",
               "            xrcdent,xrcdcomp,xrcdld,xrcdsite,xrcddocno,xrcdseq,",
               "            xrcdseq2,xrcdorga,xrcd001,xrcd002,xrcd003,xrcd004,",
               "            xrcd005,xrcd006,xrcd007,xrcd008,xrcd009,xrcd010,",
               "            xrcd100,xrcd101,xrcd102,xrcd103,xrcd104,xrcd105,",
               "            xrcd106,xrcd112,xrcd113,xrcd114,xrcd115,xrcd116,",
               "            xrcd117,xrcd118,xrcd121,xrcd124,xrcd131,xrcd134,",
               "            xrcd123,xrcd125,xrcd133,xrcd135,",
               "            xrcdud001,xrcdud002,xrcdud003,xrcdud004,xrcdud005,xrcdud006,",
               "            xrcdud007,xrcdud008,xrcdud009,xrcdud010,xrcdud011,xrcdud012,",
               "            xrcdud013,xrcdud014,xrcdud015,xrcdud016,xrcdud017,xrcdud018,",
               "            xrcdud019,xrcdud020,xrcdud021,xrcdud022,xrcdud023,xrcdud024,",
               "            xrcdud025,xrcdud026,xrcdud027,xrcdud028,xrcdud029,xrcdud030, ",
               "            xrcd011,xrcd012,xrcd013 ) ",
               "SELECT xrcdent,xrcdcomp,?,xrcdsite,?,?,",
#               "       xrcdseq2,xrcdorga,'axrt300',xrcd002,xrcd003,xrcd004,",  #201023-00028#5 mark
               "       xrcdseq2,xrcdorga,?,xrcd002,xrcd003,xrcd004,",  #201023-00028#5 add
               "       xrcd005,xrcd006,xrcd007,xrcd008,?,xrcd010,",
               "       xrcd100,xrcd101,xrcd102,xrcd103,xrcd104,xrcd105,",
               "       xrcd106,xrcd112,xrcd113,xrcd114,xrcd115,xrcd116,",
               "       xrcd117,xrcd118,xrcd121,xrcd124,xrcd131,xrcd134,",
               "       xrcd123,xrcd125,xrcd133,xrcd135,",
               "       xrcdud001,xrcdud002,xrcdud003,xrcdud004,xrcdud005,xrcdud006,",
               "       xrcdud007,xrcdud008,xrcdud009,xrcdud010,xrcdud011,xrcdud012,",
               "       xrcdud013,xrcdud014,xrcdud015,xrcdud016,xrcdud017,xrcdud018,",
               "       xrcdud019,xrcdud020,xrcdud021,xrcdud022,xrcdud023,xrcdud024,",
               "       xrcdud025,xrcdud026,xrcdud027,xrcdud028,xrcdud029,xrcdud030, ",
               "       xrcd011,xrcd012,xrcd013 ",
               "  FROM xrcd_t ",
               " WHERE xrcdent = ",g_enterprise,
               "   AND xrcddocno = ? ",
               "   AND xrcdseq = ? "
   PREPARE s_axrp132_xrcd_pre FROM l_sql
   #170503-00044#1--add--end--
   
  #LET g_success = 'Y'        #20150201#1 By zhangwei Mark
   LET l_doc_success = TRUE   #20150201#1 By zhangwei Add  
   LET l_tot_success = TRUE   #20150201#1 By zhangwei Add
   LET l_start_no = NULL      #20150201#1 By zhangwei Add
   LET l_end_no = NULL        #20150201#1 By zhangwei Add
   INITIALIZE g_xrca TO NULL
   INITIALIZE g_xrcb TO NULL

  #20150201#1 By zhangwei Mark ---(S)---
  #FOREACH axrp132_ar_curs INTO l_order,,l_isafcomp,l_isagseq
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
  
  
   #170225-00002#1--add--str--
   #程式优化
   #抓取对账单单头资料
   LET l_sql="SELECT isafent,isafsite,isafcomp,isafdocno,isafdocdt,isaf001,isaf002,isaf003,isaf004,",
             "       isaf005,isaf006,isaf007,isaf008,isaf009,isaf010,isaf011,isaf012,isaf013,isaf014,",
             "       isaf015,isaf016,isaf017,isaf018,isaf019,isaf020,isaf021,isaf022,isaf023,isaf024,",
             "       isaf025,isaf026,isaf027,isaf028,isaf029,isaf030,isaf031,isaf032,isaf033,isaf034,",
             "       isaf035,isaf036,isaf037,isaf038,isaf039,isaf040,isaf041,isaf042,isaf043,isaf044,",
             "       isaf045,isaf046,isaf047,isaf048,isaf049,isaf050,isaf051,isaf052,isaf053,isaf054,",
             "       isaf055,isaf056,isaf057,isaf058,isaf100,isaf101,isaf103,isaf104,isaf105,isaf106,",
             "       isaf107,isaf108,isaf113,isaf114,isaf115,isaf116,isaf117,isaf118,isaf119,isaf120,",
             "       isaf121,isaf122,isaf123,isaf124,isaf201,isaf202,isaf203,isaf204,isaf205,isaf206,",
             "       isaf207,isaf208,isaf209,isaf210,isafstus,isafownid,isafowndp,isafcrtid,isafcrtdp,",
             "       isafcrtdt,isafmodid,isafmoddt,isafcnfid,isafcnfdt,isaf059,isaf060,isaf061,isaf062,",
             "       isaf063,isaf064,isaf065,isaf066,isaf067 ",
             "  FROM isaf_t ",
             " WHERE isafent = ",g_enterprise," AND isafdocno =? AND isafcomp = ?"
   PREPARE axrp132_sel_isaf_pr FROM l_sql
  
   #抓取对账单单身资料
   LET l_sql="SELECT isagent,isagcomp,isagdocno,isagseq,isagorga,isag001,isag002,isag003,isag004,isag005,isag006,",
             "       isag007,isag008,isag009,isag010,isag011,isag012,isag013,isag014,isag015,isag016,isag017,",
             "       isag101,isag103,isag104,isag105,isag106,isag113,isag114,isag115,isag116,isag117,isag126,",
#             "       isag127,isag128,isag136,isag137,isag138,isag018 ",      #190423-00042#8 mark
             "       isag127,isag128,isag136,isag137,isag138,isag018,isag022,isag023 ",      #190423-00042#8 add
             "  FROM isag_t ",
             " WHERE isagent = ",g_enterprise," AND isagdocno = ? AND isagcomp = ? AND isagseq = ?"
   PREPARE axrp132_sel_isag_pr FROM l_sql
   
   #抓取应收账款金额
   LET l_sql="SELECT ABS(SUM(xrcb103 * xrcb022)),ABS(SUM(xrcb104 * xrcb022)),ABS(SUM(xrcb113 * xrcb022)),ABS(SUM(xrcb114 * xrcb022)),",
             "       ABS(SUM(xrcb123 * xrcb022)),ABS(SUM(xrcb124 * xrcb022)),ABS(SUM(xrcb133 * xrcb022)),ABS(SUM(xrcb134 * xrcb022)) ",                   
             "  FROM xrcb_t",
             " WHERE xrcbent = ",g_enterprise," AND xrcbld = ? AND xrcbdocno = ?"
   PREPARE axrp132_sel_xrcb_pr FROM l_sql
   
   #抓取科目
   LET l_sql="SELECT glab005 FROM glab_t ", 
             " WHERE glabld = '",g_master.xrcald,"'",
             "   AND glabent = ",g_enterprise,
             "   AND glab002 = ? ",            # 帳款類別
             "   AND glab001 = '13' ",        # 應收帳務類型科目設定
             "   AND glab003 = ?"
   PREPARE axrp132_sel_glab_pr FROM l_sql
   
   #抓取订单单号和项次
#170413-00024#2 mod s--
#   LET l_sql="SELECT xmdl003,xmdl004,xmdl030,xmdl031,xmdl050,xmdl038 FROM xmdl_t ",  
#             "WHERE xmdlent = ",g_enterprise,
#             "  AND xmdlseq = ?",
#             "  AND xmdldocno = ?"
   #180109-00028#1 add-s
   IF g_master.l_isaf001 = '3' THEN
      LET l_sql="SELECT xmda002,xmda003,xmdcdocno,xmdcseq,xmdc036,xmdc037,xmdc049,'',xmda023,xmdc036,xmdc037,xmdc050 ",  #180105-00048#1---mod  add-->,xmdk030,xmdl030,xmdl031 #200317-00037#1 add xmdc050
             " FROM xmda_t LEFT OUTER JOIN xmdc_t ON xmdaent = xmdcent AND xmdadocno = xmdcdocno  ",  
             "WHERE xmdcent = ",g_enterprise,
             "  AND xmdcseq = ?",
             "  AND xmdcdocno = ?"
   ELSE
   #180109-00028#1 add-e
      LET l_sql="SELECT xmdk003,xmdk004,xmdl003,xmdl004,xmdl030,xmdl031,xmdl050,xmdl038,xmdk030,xmdl030,xmdl031,xmdl051 ",  #180105-00048#1---mod  add-->,xmdk030,xmdl030,xmdl031 #200317-00037#1 add xmdl051
             " FROM xmdk_t LEFT OUTER JOIN xmdl_t ON xmdkent = xmdlent AND xmdkdocno = xmdldocno  ",  
             "WHERE xmdlent = ",g_enterprise,
             "  AND xmdlseq = ?",
             "  AND xmdldocno = ?"   
   END IF #180109-00028#1 add
#170413-00024#2 mod e---             
   PREPARE axrp132_sel_xmdl_pr FROM l_sql
   #170225-00002#1--add--end
   
   #170413-00024#2 add s---
   LET l_sql="SELECT xmda003,xmda002 FROM xmda_t ",
             "WHERE xmdaent = ",g_enterprise,
             "  AND xmdadocno = ?"           
   PREPARE axrp132_sel_xmda_pr FROM l_sql   
   #170413-00024#2 add e---
  
  #20150201#1   By zhangwei Add ---(S)---
   FOR li_idx = 1 TO g_isaf_d.getLength()
#      CALL s_transaction_begin()  #每一筆資料單獨走一次事物 #170225-00002#1 mark
      LET l_doc_success = TRUE  #190729-00018#1 add
      #IF g_progflag = 'aisp340' THEN  #150518-00046#5 add #170301-00023#11 mark    
      IF g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add
         OPEN axrp133_cl USING g_enterprise,g_isaf_d[li_idx].isafdocno
         IF STATUS THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "OPEN isaf_cl:"   #20150201 ~~~
            LET g_errparam.code   =  STATUS 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         
            CLOSE axrp133_cl
#            CALL s_transaction_end('N','0') #170225-00002#1 mark
            LET l_doc_success = FALSE  #190729-00018#1 add
            CONTINUE FOR
         END IF
      END IF    #150518-00046#5 add
      #210301-00010#1 add -s
      IF l_sfin9029 = 'Y' THEN
         #是否已立账
         LET l_cnt1 = 0
         SELECT COUNT(1) INTO l_cnt1
           FROM xrca_t,xrcb_t
          WHERE xrcaent = xrcbent AND xrcbent = g_enterprise
            AND xrcadocno = xrcbdocno
            AND xrcald = xrcbld
            AND xrca001 IN ('12','22')
            AND xrcb049 IS NULL
            AND xrcastus <> 'X'
            AND EXISTS (SELECT 1
                          FROM isag_t
                         WHERE isagent = g_enterprise
                           AND isagcomp = g_glaa.glaacomp
                           AND isagdocno = g_isaf_d[li_idx].isafdocno
                           AND isag002 = xrcb002
                           AND isag003 = xrcb003)
         IF cl_null(l_cnt1) THEN LET l_cnt1 = 0 END IF
         #不可重复立账
         IF l_cnt1 <> 0 THEN
            IF g_isaf_d[li_idx].isafdocno <> l_isafdocno_t OR cl_null(l_isafdocno_t) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ais-00593'
               LET g_errparam.extend = g_isaf_d[li_idx].isafdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
            END IF
            CLOSE axrp133_cl
            LET l_doc_success = FALSE  
            LET l_isafdocno_t = g_isaf_d[li_idx].isafdocno
            CONTINUE FOR
         END IF
      END IF
      #210301-00010#1 add -e
#170225-00002#1--mod--str--
#程式优化
#      #161128-00061#3-----modify--begin----------
#      #SELECT * INTO l_isaf.* 
#      SELECT isafent,isafsite,isafcomp,isafdocno,isafdocdt,isaf001,isaf002,isaf003,isaf004,
#             isaf005,isaf006,isaf007,isaf008,isaf009,isaf010,isaf011,isaf012,isaf013,isaf014,
#             isaf015,isaf016,isaf017,isaf018,isaf019,isaf020,isaf021,isaf022,isaf023,isaf024,
#             isaf025,isaf026,isaf027,isaf028,isaf029,isaf030,isaf031,isaf032,isaf033,isaf034,
#             isaf035,isaf036,isaf037,isaf038,isaf039,isaf040,isaf041,isaf042,isaf043,isaf044,
#             isaf045,isaf046,isaf047,isaf048,isaf049,isaf050,isaf051,isaf052,isaf053,isaf054,
#             isaf055,isaf056,isaf057,isaf058,isaf100,isaf101,isaf103,isaf104,isaf105,isaf106,
#             isaf107,isaf108,isaf113,isaf114,isaf115,isaf116,isaf117,isaf118,isaf119,isaf120,
#             isaf121,isaf122,isaf123,isaf124,isaf201,isaf202,isaf203,isaf204,isaf205,isaf206,
#             isaf207,isaf208,isaf209,isaf210,isafstus,isafownid,isafowndp,isafcrtid,isafcrtdp,
#             isafcrtdt,isafmodid,isafmoddt,isafcnfid,isafcnfdt,isaf059,isaf060,isaf061,isaf062,
#             isaf063,isaf064,isaf065,isaf066,isaf067 INTO l_isaf.* 
#      #161128-00061#3-----modify--end----------
#      FROM isaf_t WHERE isafent = g_enterprise AND isafdocno = g_isaf_d[li_idx].isafdocno AND isafcomp = g_isaf_d[li_idx].isafcomp   #20150201#1 By zhangwei Mod  ---> g_isaf_d[li_idx].isafdocno  l_isafcomp ---> g_isaf_d[li_idx].isafcomp
#      
#      #161128-00061#3-----modify--begin----------
#      #SELECT * INTO l_isag.* 
#      SELECT isagent,isagcomp,isagdocno,isagseq,isagorga,isag001,isag002,isag003,isag004,isag005,isag006,
#             isag007,isag008,isag009,isag010,isag011,isag012,isag013,isag014,isag015,isag016,isag017,
#             isag101,isag103,isag104,isag105,isag106,isag113,isag114,isag115,isag116,isag117,isag126,
#             isag127,isag128,isag136,isag137,isag138,isag018 INTO l_isag.* 
#      #161128-00061#3-----modify--end----------
#      FROM isag_t WHERE isagent = g_enterprise AND isagdocno = g_isaf_d[li_idx].isafdocno AND isagcomp = g_isaf_d[li_idx].isafcomp AND isagseq = g_isaf_d[li_idx].isagseq   #20150201#1 By zhangwei Mod  ---> g_isaf_d[li_idx].isafdocno  l_isafcomp ---> g_isaf_d[li_idx].isafcomp l_isagseq ---> 
      #程式优化
      #抓取对账单单头资料
      EXECUTE axrp132_sel_isaf_pr USING g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isafcomp INTO l_isaf.* 
      #抓取对账单单身资料
      EXECUTE axrp132_sel_isag_pr USING g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isafcomp,g_isaf_d[li_idx].isagseq INTO l_isag.* 
#170225-00002#1--mod--end

      ##170419-00022#1 mark-----s
      #IF g_master.b_comb2 = '1' AND cl_null(g_master.xrcadocdt) THEN
      #   LET g_master.xrcadocdt = l_isaf.isafdocdt
      #END IF
      ##170419-00022#1 mark-----e

      #170419-00022#1-----s
      IF g_master.b_comb2 = '1' THEN
         IF g_date_null = 'Y' THEN   #171212-00027#1 add  
            LET g_master.xrcadocdt = l_isaf.isafdocdt
         END IF   #171212-00027#1 add
      END IF
      #170419-00022#1-----e
      
      IF (l_isag.isag001 = '11' OR l_isag.isag001 = '21') THEN
         #170522-00024#1 --s add
         #跨期未暫估者可立帳 Y :  來源對帳單日期 小於等於單據日期 ; N : 出貨/銷退來源單 已立暫估量xmdl053 >0  且 其扣帳日期 之月份<> 立帳日期
         IF g_master.l_isaf001 MATCHES '[14]' AND g_master.l_chk = 'N' THEN
            LET l_xmdl053 = 0
            LET l_xmdk001 = '' #170712-00047#1 add
            #EXECUTE axrp132_get_xmdl053_p USING l_isag.isag002,l_isag.isag003 INTO l_xmdl053           #170712-00047#1 mark
            #180731-00017#33 -s  mark by 11387 
#            EXECUTE axrp132_get_xmdl053_p USING l_isag.isag002,l_isag.isag003 INTO l_xmdl053,l_xmdk001  #170712-00047#1 add
            #180731-00017#33 -e  mark by 11387
            #180731-00017#33 -s  add by 11387
            LET ld_date_b = s_date_get_first_date(g_master.xrcadocdt)
            LET ld_date_e = s_date_get_last_date(g_master.xrcadocdt)
            EXECUTE axrp132_get_xmdl053_p USING l_isag.isag002,l_isag.isag003,ld_date_e,ld_date_b INTO l_xmdl053,l_xmdk001  #170712-00047#1 add
            #180731-00017#33 -e  add by 11387                       
            IF cl_null(l_xmdl053) THEN LET l_xmdl053 = 0 END IF
            IF l_xmdl053 = 0 THEN
               IF NOT(l_yy = YEAR(l_xmdk001) AND l_mm = MONTH(l_xmdk001)) THEN  #170712-00047#1 add
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'aap-00643'    
                  LET g_errparam.extend = l_isag.isag002,"#",l_isag.isag003
                  LET g_errparam.popup = TRUE
                  CALL cl_err()  
                  LET l_doc_success = FALSE  #190729-00018#1 add     
                  CONTINUE FOR
               END IF #170712-00047#1 add
            END IF          
         END IF          
         #170522-00024#1 --e add   
         
         #190131-00004#1---add---str
         #检查出货单是不是立暂估了但是暂估单没有审核
         LET l_count = 0
         SELECT COUNT(1) INTO l_count
           FROM xrca_t,xrcb_t 
          WHERE xrcaent = g_enterprise
            AND xrcaent = xrcbent
            AND xrcadocno = xrcbdocno 
            AND xrcald = xrcbld
            AND xrca001 IN ('01','02')
            AND xrcastus = 'N' 
            AND xrcb002 = l_isag.isag002
            AND xrcb003 = l_isag.isag003
         IF l_count > 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'axr-93219'    
            LET g_errparam.extend = l_isag.isag002,"#",l_isag.isag003
            LET g_errparam.popup = TRUE
            CALL cl_err()           
            LET l_doc_success = FALSE  #190729-00018#1 add
            CONTINUE FOR
         END IF
         #190131-00004#1---add---end         
      
         LET l_amount = 0
         EXECUTE axrp133_amount USING l_isag.isag002,l_isag.isag003 INTO l_amount,l_xmdl038  #180531-00020#1 add l_xmdl038
         IF cl_null(l_amount) THEN LET l_amount = 0 END IF
         IF l_amount = 0 THEN
            #190729-00018#1 mark -s
#            LET g_errparam.extend = "OPEN isaf_cl:"   #20150201 ~~~
#            LET g_errparam.code   =  STATUS 
            #190729-00018#1 mark -e
            #190729-00018#1 add -s
            LET g_errparam.extend = l_isag.isag002,"#",l_isag.isag003
            LET g_errparam.code   =  'axr-00329' 
            #190729-00018#1 add -e
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
#            CALL s_transaction_end('N','0') #170225-00002#1 mark
            LET l_doc_success = FALSE  #190729-00018#1 add
            CONTINUE FOR
         END IF
         #170627-00002#1-----s
         OPEN axrp133_xmdlcl USING l_isag.isag002,l_isag.isag003
         IF STATUS THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = "OPEN axrp133_xmdlcl:"   
            LET g_errparam.code   =  SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            CLOSE axrp133_xmdlcl
            LET l_doc_success = FALSE  
            CONTINUE FOR
         END IF
         #170627-00002#1-----e
      END IF
      #20150201#1   By zhangwei Add ---(S)---
      
      #160426-00013#1-s
      #若來源類型為27:其他待抵單，則直接產生到直接沖帳去
      IF l_isag.isag001 = '27' THEN
         CONTINUE FOR
      END IF
      #160426-00013#1-e
      
      DISPLAY "g_end_prog:",g_end_prog
      IF cl_null(l_order_t) OR l_order_t <> g_isaf_d[li_idx].order THEN   #20150201#1 By zhangwei Mod l_order ---> g_isaf_d[li_idx].order
       #  SELECT * INTO l_isaf.* FROM isaf_t WHERE isafent = g_enterprise AND isafdocno = g_isaf_d[li_idx].isafdocno AND isafcomp = g_isaf_d[li_idx].isafcomp   #170503-00044#1 add 170825-00043#1  2017/09/07 by 09771  mark            
  #170825-00043#1  2017/09/07 by 09771 ---s    
         SELECT    isafent,isafsite,isafcomp,isafdocno,isafdocdt,
                  isaf001, isaf002, isaf003,  isaf004,  isaf005,
                  isaf006, isaf007, isaf008,  isaf009,  isaf010,
                  isaf011, isaf012, isaf013,  isaf014,  isaf015,
                  isaf016, isaf017, isaf018,  isaf019,  isaf020,
                  isaf021, isaf022, isaf023,  isaf024,  isaf025,
                  isaf026, isaf027, isaf028,  isaf029,  isaf030,
                  isaf031, isaf032, isaf033,  isaf034,  isaf035,
                  isaf036, isaf037, isaf038,  isaf039,  isaf040,
                  isaf041, isaf042, isaf043,  isaf044,  isaf045,
                  isaf046, isaf047, isaf048,  isaf049,  isaf050,
                  isaf051, isaf052, isaf053,  isaf054,  isaf055,
                  isaf056, isaf057, isaf058,  isaf100,  isaf101,
                  isaf103, isaf104, isaf105,  isaf106,  isaf107,
                  isaf108, isaf113, isaf114,  isaf115,  isaf116,
                  isaf117, isaf118, isaf119,  isaf120,  isaf121,
                  isaf122, isaf123, isaf124,  isaf201,  isaf202,
                  isaf203, isaf204, isaf205,  isaf206,  isaf207,
                  isaf208, isaf209, isaf210, isafstus,isafownid,
                  isafowndp,isafcrtid,isafcrtdp,isafcrtdt,isafmodid,
                  isafmoddt,isafcnfid,isafcnfdt,isaf059,isaf060,
                  isaf061,isaf062,isaf063,isaf064,isaf065,
                  isaf066,isaf067
                  
          INTO    l_isaf.isafent, l_isaf.isafsite,l_isaf.isafcomp, l_isaf.isafdocno,l_isaf.isafdocdt,
                  l_isaf.isaf001, l_isaf.isaf002, l_isaf.isaf003,  l_isaf.isaf004,  l_isaf.isaf005,
                  l_isaf.isaf006, l_isaf.isaf007, l_isaf.isaf008,  l_isaf.isaf009,  l_isaf.isaf010,
                  l_isaf.isaf011, l_isaf.isaf012, l_isaf.isaf013,  l_isaf.isaf014,  l_isaf.isaf015,
                  l_isaf.isaf016, l_isaf.isaf017, l_isaf.isaf018,  l_isaf.isaf019,  l_isaf.isaf020,
                  l_isaf.isaf021, l_isaf.isaf022, l_isaf.isaf023,  l_isaf.isaf024,  l_isaf.isaf025,
                  l_isaf.isaf026, l_isaf.isaf027, l_isaf.isaf028,  l_isaf.isaf029,  l_isaf.isaf030,
                  l_isaf.isaf031, l_isaf.isaf032, l_isaf.isaf033,  l_isaf.isaf034,  l_isaf.isaf035,
                  l_isaf.isaf036, l_isaf.isaf037, l_isaf.isaf038,  l_isaf.isaf039,  l_isaf.isaf040,
                  l_isaf.isaf041, l_isaf.isaf042, l_isaf.isaf043,  l_isaf.isaf044,  l_isaf.isaf045,
                  l_isaf.isaf046, l_isaf.isaf047, l_isaf.isaf048,  l_isaf.isaf049,  l_isaf.isaf050,
                  l_isaf.isaf051, l_isaf.isaf052, l_isaf.isaf053,  l_isaf.isaf054,  l_isaf.isaf055,
                  l_isaf.isaf056, l_isaf.isaf057, l_isaf.isaf058,  l_isaf.isaf100,  l_isaf.isaf101,
                  l_isaf.isaf103, l_isaf.isaf104, l_isaf.isaf105,  l_isaf.isaf106,  l_isaf.isaf107,
                  l_isaf.isaf108, l_isaf.isaf113, l_isaf.isaf114,  l_isaf.isaf115,  l_isaf.isaf116,
                  l_isaf.isaf117, l_isaf.isaf118, l_isaf.isaf119,  l_isaf.isaf120,  l_isaf.isaf121,
                  l_isaf.isaf122, l_isaf.isaf123, l_isaf.isaf124,  l_isaf.isaf201,  l_isaf.isaf202,
                  l_isaf.isaf203, l_isaf.isaf204, l_isaf.isaf205,  l_isaf.isaf206,  l_isaf.isaf207,
                  l_isaf.isaf208, l_isaf.isaf209, l_isaf.isaf210, l_isaf.isafstus,  l_isaf.isafownid,
                  l_isaf.isafowndp,l_isaf.isafcrtid,l_isaf.isafcrtdp,l_isaf.isafcrtdt,l_isaf.isafmodid,
                  l_isaf.isafmoddt,l_isaf.isafcnfid,l_isaf.isafcnfdt,l_isaf.isaf059,l_isaf.isaf060,
                  l_isaf.isaf061,l_isaf.isaf062,l_isaf.isaf063,l_isaf.isaf064,l_isaf.isaf065,
                  l_isaf.isaf066,l_isaf.isaf067
                  
          FROM   isaf_t   WHERE isafent = g_enterprise AND isafdocno = g_isaf_d[li_idx].isafdocno AND isafcomp = g_isaf_d[li_idx].isafcomp  
          
        #170825-00043#1  2017/09/07 by 09771-----e






         #CALL s_aooi200_fin_gen_docno(g_master.xrcald,g_glaa.glaa024,g_glaa.glaa003,g_master.xrcadocno,g_master.xrcadocdt,g_master.b_style) #160426-00013#1 mark
#170225-00002#1--mark--str--
#移到产生多账期等资料下面
#         CALL s_aooi200_fin_gen_docno(g_master.xrcald,g_glaa.glaa024,g_glaa.glaa003,g_master.xrcadocno,g_master.xrcadocdt,g_end_prog)        #160426-00013#1
#              RETURNING l_success,l_xrcadocno
#         IF l_success = FALSE OR l_success = 'N' THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.extend = g_master.xrcadocno
#            LET g_errparam.code   = 'aap-00187'
#            LET g_errparam.popup  = TRUE
#            CALL cl_err()
#            #LET g_success = 'N'        #20150201#1 By zhangwei Mark
#            LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
#         END IF
#         #IF g_master.b_style = 'axrt300' THEN LET l_xrca001 = '17' ELSE LET l_xrca001 = '22' END IF #160426-00013#1 mark
#         #160426-00013#1 add ------
#         CASE
#            WHEN g_end_prog = 'axrt300'
#               LET l_xrca001 = '17' #17:發票應收單
#            WHEN g_end_prog = 'axrt330'             #160620-00010#3 add
#               LET l_xrca001 = '19' #19:其他應收單   #160620-00010#3 add
#            WHEN g_end_prog = 'axrt310'
#               LET l_xrca001 = '11' #11:訂金預收單
#            WHEN g_end_prog = 'axrt340'
#               LET l_xrca001 = '22' #22:銷退待抵單
#            WHEN g_end_prog = 'axrt341'             #160920-00013#1 add
#               LET l_xrca001 = '29' #29:其他扣抵單   #160920-00013#1 add
#         END CASE
#170225-00002#1--mark--end
         #160426-00013#1 add end---

         IF NOT cl_null(g_xrca.xrcadocno) THEN   #前一筆應收單據單身完全產生,繼續產生直接沖帳、多帳期，回寫應收單據單頭金額
            
            #170225-00002#1--add--str---
            #当有冲暂估时，才产生冲暂估资料
            LET l_cnt = 0
            SELECT COUNT(1) INTO l_cnt FROM xrcb_t
             WHERE xrcbent=g_enterprise AND xrcbld=g_xrca.xrcald
               AND xrcbdocno=g_xrca.xrcadocno AND xrcb023 = 'Y'
            IF l_cnt > 0 THEN
            #170225-00002#1--add--end
               #170222-00007#1--add--str--
               #当整张应收账款单产生完，再产生冲暂估资料
               CALL s_axrp130_ins_xrcf(g_xrca.xrcald,g_xrca.xrcadocno,'','0') RETURNING l_success
               IF NOT l_success THEN
                  LET l_doc_success = FALSE  
               END IF
               #170222-00007#1--add--end
            END IF #170225-00002#1 add
            
            #170225-00002#1--mod--str--
            #程式优化
#            SELECT ABS(SUM(xrcb103 * xrcb022)),ABS(SUM(xrcb104 * xrcb022)),ABS(SUM(xrcb113 * xrcb022)),ABS(SUM(xrcb114 * xrcb022)),
#                   ABS(SUM(xrcb123 * xrcb022)),ABS(SUM(xrcb124 * xrcb022)),ABS(SUM(xrcb133 * xrcb022)),ABS(SUM(xrcb134 * xrcb022))  
#              INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114, 
#                   g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134     
#              FROM xrcb_t
#             WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald AND xrcbdocno = g_xrca.xrcadocno
            #抓取应收账款金额
            EXECUTE axrp132_sel_xrcb_pr USING g_xrca.xrcald,g_xrca.xrcadocno
                                        INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,
                                             g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134 
            #170225-00002#1--mod--end
            IF cl_null(g_xrca.xrca103) THEN LET g_xrca.xrca103 = 0 END IF 
            IF cl_null(g_xrca.xrca104) THEN LET g_xrca.xrca104 = 0 END IF 
            IF cl_null(g_xrca.xrca113) THEN LET g_xrca.xrca113 = 0 END IF 
            IF cl_null(g_xrca.xrca114) THEN LET g_xrca.xrca114 = 0 END IF
            IF cl_null(g_xrca.xrca123) THEN LET g_xrca.xrca123 = 0 END IF 
            IF cl_null(g_xrca.xrca124) THEN LET g_xrca.xrca124 = 0 END IF
            IF cl_null(g_xrca.xrca133) THEN LET g_xrca.xrca133 = 0 END IF 
            IF cl_null(g_xrca.xrca134) THEN LET g_xrca.xrca134 = 0 END IF
            #回寫單頭金額
            UPDATE xrca_t SET (xrca103,xrca104,xrca113,xrca114,xrca123,xrca124,xrca133,xrca134) = (g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134) 
             WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
            #190729-00018#1 add -s
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd xrca_t:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
            END IF
            #190729-00018#1 add -e
            #單身如果有多筆發票則更新單頭發票號碼為'MULTI'
            LET l_count = 0
            SELECT COUNT(DISTINCT xrcb027||xrcb028) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise
               AND xrcbdocno = g_xrca.xrcadocno AND xrcbld = g_xrca.xrcald
            IF cl_null(l_count) THEN LET l_count = 0 END IF
            IF l_count > 1 THEN
               UPDATE xrca_t SET xrca066 = 'MULTI'
                WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd xrca_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF
            #如果單身資料多來源/多單據則令單頭來源類型、來源單號為空
            LET l_count = 0
            CASE
               WHEN l_s = 1
                  SELECT COUNT(DISTINCT isafdocno) INTO l_count FROM isaf_t WHERE isafent = g_enterprise
                     AND isaf035 = g_xrca.xrcadocno
               WHEN l_s = 2
                  SELECT COUNT(DISTINCT isafdocno) INTO l_count FROM isaf_t WHERE isafent = g_enterprise
                     AND isaf048 = g_xrca.xrcadocno
               WHEN l_s = 3
                  SELECT COUNT(DISTINCT isafdocno) INTO l_count FROM isaf_t WHERE isafent = g_enterprise
                     AND isaf049 = g_xrca.xrcadocno
            END CASE
            IF cl_null(l_count) THEN LET l_count = 0 END IF
            IF l_count > 1 THEN
               UPDATE xrca_t SET xrca018 = ''
                WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd xrca_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF
            
            #LET l_count = 0
            #SELECT COUNT(DISTINCT xrcb001) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise
            #   AND xrcbdocno = g_xrca.xrcadocno AND xrcbld = g_xrca.xrcald
            #   AND xrcb001 NOT IN ('19','29')
            #IF cl_null(l_count) THEN LET l_count = 0 END IF
            #IF l_count > 1 THEN
            #   UPDATE xrca_t SET xrca016 = ''
            #    WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
            #END IF
             #產生直接沖帳
            #151130-00015#3 Mod  ---(S)---
            #CALL axrp132_ins_xrce()
            #LET la_param.p_style = g_master.b_style #160426-00013#1 mark
            LET la_param.p_style = g_end_prog        #160426-00013#1
            #LET la_param.p_check = g_master.b_check1,g_master.b_check2,g_master.b_check3,g_master.b_check4,g_master.b_check5,g_master.b_check6   #180529-00020#1 mark
            LET la_param.p_check = g_master.b_check1,g_master.b_check2,'N',g_master.b_check4,g_master.b_check5,g_master.b_check6   #180529-00020#1 add
#            LET la_param.p_isafdocno = g_isaf_d[li_idx].isafdocno   #160426-00013#1  #200331-00017#1---mark--因为g_isaf_d[li_idx].isafdocno已经是下一笔得单据了，所以会把冲账单号带错
            LET la_param.p_isafdocno = l_isafdocno_t   #200331-00017#1---add 
            LET ls_js = util.JSON.stringify(la_param)
            CALL s_axrp133_ins_xrce(g_xrca.xrcadocno,g_xrca.xrcald,ls_js)
           #151130-00015#3 Mod  ---(E)---

            #產生多帳期
            CALL s_axrt300_installments(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_success
#            IF l_success = FALSE OR l_success = 'N' THEN  #190729-00018#1 mark
            IF NOT l_success THEN  #190729-00018#1 add
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = g_master.xrcadocno
               LET g_errparam.code   = 'aap-00092'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
              #LET g_success = 'N'         #20150201#1 By zhangwei Mark
               LET l_doc_success = FALSE   #20150201#1 By zhangwei Add  
            END IF

            #20150201#1 By zhangwei Add ---(S)---
            IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' THEN
               CALL s_pre_voucher_ins('AR','R10',g_glaa.glaald,g_xrca.xrcadocno,g_xrca.xrcadocdt,'1') RETURNING l_success
               IF NOT l_success THEN
                  LET l_doc_success = FALSE
               END IF
            END IF
            #20150201#1 By zhangwei Add ---(E)---
            #200902-00059#1 add(s)
            LET l_xmdk031_cnt = 0
            SELECT COUNT(DISTINCT xmdk031) INTO l_xmdk031_cnt 
              FROM xmdk_t WHERE xmdkent = g_enterprise
               AND xmdkdocno IN (SELECT xrcb002 
                                  FROM xrcb_t 
                                 WHERE xrcbdocno = g_xrca.xrcadocno AND xrcbent = g_enterprise 
                                   AND xrcbld = g_xrca.xrcald
                                 ) 
            IF cl_null(l_xmdk031_cnt) THEN LET l_xmdk031_cnt = 0 END IF
            IF l_xmdk031_cnt = '1' THEN   
               SELECT DISTINCT xmdk031 INTO l_xmdk031 
                 FROM xmdk_t WHERE xmdkent = g_enterprise
                  AND xmdkdocno IN (SELECT xrcb002 
                                     FROM xrcb_t 
                                    WHERE xrcbdocno = g_xrca.xrcadocno AND xrcbent = g_enterprise 
                                      AND xrcbld = g_xrca.xrcald
                                    )             
               SELECT xrca058 INTO l_xrca058 FROM xrca_t WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
               IF l_xrca058 <> l_xmdk031 THEN
                  UPDATE xrca_t SET xrca058 = l_xmdk031
                   WHERE xrcaent = g_enterprise
                     AND xrcald = g_xrca.xrcald
                     AND xrcadocno = g_xrca.xrcadocno
               END IF
            END IF              
            #200902-00059#1 add(e)
            #151125-00006#1---add---s  执行立即审核功能
            CALL s_aooi200_fin_get_slip(g_xrca.xrcadocno) RETURNING l_slip_success,l_ooba002
            CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0031') RETURNING l_dfin0031
  
            IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN 
               #190318-00028#6   add-S
               #根据单别捞取对应的作业，azzi850检核单别所属的所有作业
               LET l_sql = ''
               LET l_oobl002 = ''
               LET l_success_1 = TRUE
               LET l_sql = " SELECT DISTINCT oobl002 ",
                           "   FROM oobl_t ",
                           "  WHERE ooblent = ",g_enterprise,
                           "    AND oobl001 = '",l_ooba002,"' "
                           
               PREPARE axrp132_sel_oobl002_pr FROM l_sql
               DECLARE axrp132_sel_oobl002_cur CURSOR FOR axrp132_sel_oobl002_pr 
               FOREACH axrp132_sel_oobl002_cur INTO l_oobl002
                    
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
                  CALL s_axrp133_immediately_conf(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_conf_success
                  IF NOT l_conf_success THEN 
                     LET l_doc_success = FALSE  
                  END IF 
               END IF
               
               LET g_prog = 'axrp132'
               LET g_code = 'axrp132'        
               #190318-00028#6   add-E
               #190318-00028#6   mark-S
              #CALL s_axrp133_immediately_conf(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_conf_success 
              #IF NOT l_conf_success THEN 
              #   LET l_doc_success = FALSE  
              #END IF
               #190318-00028#6   mark-E               
            END IF 
            #151125-00006#1---add---e

            #20150201#1 By zhangwei Add ---(S)---
            IF l_doc_success THEN  
           #IF l_doc_success AND ( (not cl_null(l_conf_success) AND l_conf_success) OR cl_null(l_conf_success) ) THEN    #151125-00006#1 add by aiqq
               IF cl_null(l_start_no) THEN
                  LET l_start_no = g_xrca.xrcadocno
               END IF
               LET l_end_no = g_xrca.xrcadocno
               CLOSE axrp133_cl
               #170627-00002#1-----s
               CLOSE axrp133_xmdlcl
               #170627-00002#1-----e
               CALL s_transaction_end('Y',1)  
            ELSE
               LET l_tot_success = FALSE
               CLOSE axrp133_cl
               #170627-00002#1-----s
               CLOSE axrp133_xmdlcl
               #170627-00002#1-----e
               CALL s_transaction_end('N',1)
            END IF
      
            #151125-00006#1---add---s  #执行立即抛砖总账传票
            CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
            CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-2002') RETURNING l_gl_slip
            IF l_doc_success THEN  
               IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN      #180109-00024#1 add
                  IF NOT cl_null(l_gl_slip) THEN 
#                 IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN   #180109-00024#1 mark
                     CALL s_axrp133_immediately_gen(g_xrca.xrcald,g_xrca.xrcadocno,g_xrca.xrcasite,g_xrca.xrcadocdt,l_gl_slip)
#                 END IF                                                          #180109-00024#1 mark
                  ELSE
                    INITIALIZE g_errparam TO NULL 
                    LET g_errparam.extend = "" 
                    LET g_errparam.code   = "axr-00987" 
                    LET g_errparam.popup  = TRUE 
                    CALL cl_err()
                  END IF
               END IF                                                             #180109-00024#1 add
            END IF 
            #151125-00006#1---add---e
      
            LET l_doc_success = TRUE  
            #20150201#1 By zhangwei Add ---(E)---

         END IF
         
         #170225-00002#1--add--str--
         CALL s_transaction_begin()  #每产生一筆应收账款資料單獨走一次事物
         CALL s_aooi200_fin_gen_docno(g_master.xrcald,g_glaa.glaa024,g_glaa.glaa003,g_master.xrcadocno,g_master.xrcadocdt,g_end_prog)        #160426-00013#1
              RETURNING l_success,l_xrcadocno
#         IF l_success = FALSE OR l_success = 'N' THEN  #190729-00018#1 mark
         IF NOT l_success THEN  #190729-00018#1 add
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = g_master.xrcadocno
            LET g_errparam.code   = 'aap-00187'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE   
         END IF
        
         CASE
            #WHEN g_end_prog = 'axrt300' #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt300*' #170301-00023#11 add
               LET l_xrca001 = '17' #17:發票應收單
            #WHEN g_end_prog = 'axrt330'           #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt330*' #170301-00023#11 add
               LET l_xrca001 = '19' #19:其他應收單 
            #WHEN g_end_prog = 'axrt310' #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt310*' #170301-00023#11 add
               LET l_xrca001 = '11' #11:訂金預收單
            #210309-00026#1 add -s
            WHEN g_end_prog MATCHES 'axrt311*'
               IF l_isaf.isaf056 = '1' THEN
                  LET l_xrca001 = '110'  #110:合同应收单
               ELSE
                  LET l_xrca001 = '210'  #110:合同待抵单
               END IF
            #210309-00026#1 add -e
            #WHEN g_end_prog = 'axrt340' #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt340*' #170301-00023#11 add
               LET l_xrca001 = '22' #22:銷退待抵單
            #WHEN g_end_prog = 'axrt341'         #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt341*' #170301-00023#11 add
               LET l_xrca001 = '29' #29:其他扣抵單 
         END CASE
         #170225-00002#1--add--end

         INITIALIZE g_xrca TO NULL
         LET g_xrca.xrcaent   = g_enterprise
         LET g_xrca.xrcaownid = g_user
         LET g_xrca.xrcaowndp = g_dept
         LET g_xrca.xrcacrtid = g_user
         LET g_xrca.xrcacrtdp = g_dept
         LET g_xrca.xrcacrtdt = cl_get_current()   #albireo 150716  g_today >>>> cl_get_current()

         LET g_xrca.xrcastus  = 'N'
         LET g_xrca.xrcacomp  = g_glaa.glaacomp  
         LET g_xrca.xrcald    = g_master.xrcald
         LET g_xrca.xrcadocno = l_xrcadocno
         LET g_xrca.xrcadocdt = g_master.xrcadocdt 
         LET g_xrca.xrca001   = l_xrca001
         LET g_xrca.xrcasite  = g_master.xrcasite 
         LET g_xrca.xrca003   = g_user             
         LET g_xrca.xrca004   = l_isaf.isaf003
         CALL axrp132_xrca004_ref(l_isaf.isaf100) RETURNING l_xrca.*
         LET g_xrca.xrca005   = l_isaf.isaf055
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

         #170225-00002#1--mod--str--
         #程式优化
#         SELECT glab005 INTO l_xrca035 FROM glab_t 
#          WHERE glabld = g_master.xrcald 
#            AND glabent = g_enterprise
#            AND glab002 = g_xrca.xrca007   # 帳款類別
#            AND glab001 = '13'             # 應收帳務類型科目設定
#            AND glab003 = '8304_01'
         LET l_glab003 = '8304_01'
         EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO l_xrca035
         #160909-00084#1 Add  ---(S)---
#         IF l_isaf.isaf001 = '3' AND g_sfin2022 = '02' THEN  #210309-00026#1 mark  
         IF (l_isaf.isaf001 = '3' AND g_sfin2022 = '02') OR l_isaf.isaf001 = '0' THEN  #210309-00026#1 add
#            SELECT glab005 INTO l_xrca036 FROM glab_t 
#             WHERE glabld = g_master.xrcald 
#               AND glabent = g_enterprise
#               AND glab002 = g_xrca.xrca007   # 帳款類別
#               AND glab001 = '13'             # 應收帳務類型科目設定
#               AND glab003 = '8304_22'
            LET l_glab003 = '8304_22'
            EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO l_xrca036
         ELSE
         #160909-00084#1 Add  ---(E)---
#            SELECT glab005 INTO l_xrca036 FROM glab_t 
#             WHERE glabld = g_master.xrcald 
#               AND glabent = g_enterprise
#               AND glab002 = g_xrca.xrca007   # 帳款類別
#               AND glab001 = '13'             # 應收帳務類型科目設定
#               AND glab003 = '8304_21'
            LET l_glab003 = '8304_21'
            EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO l_xrca036
         #170225-00002#1--mod--end
         END IF   #160909-00084#1 Add
         #1508170001--Kris:axrp132  折襄單時, 應取銷貨退回的會科
         #IF g_master.b_style = 'axrt340' THEN  #160426-00013#1 mark
         #IF g_end_prog = 'axrt340' THEN         #160426-00013#1 #170301-00023#11 mark    
         IF g_end_prog MATCHES 'axrt340*' THEN #170301-00023#11 add
            #161014-00046#1 -s
            LET l_xmdk082 = ''
            SELECT xmdk082,xmdk031,xmdk004,xmdk030        #170503-00044#1 add xmdk031,xmdk004,xmdk030
              INTO l_xmdk082,g_xrca.xrca058,l_xmdk004,l_xrcb034     #170503-00044#1 add g_xrca.xrca058,l_xmdk004,l_xrcb034                       
              FROM xmdk_t
             WHERE xmdkent   = g_enterprise
               AND xmdkdocno = l_isag.isag002
            CASE
               WHEN l_xmdk082 = '4' #axmt600銷退方式=4:銷貨折讓(純金額折價)時抓axri011的帳款折讓科目
                  CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_05') RETURNING g_sub_success,l_xrca036,g_errno
               OTHERWISE  #其他銷退方式都抓銷貨退回科目
            #161014-00046#1 -e
                  CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_04') RETURNING g_sub_success,l_xrca036,g_errno
            END CASE  #161014-00046#1
         END IF
         #160920-00013#1 --s  add
         #IF g_end_prog = 'axrt341' THEN           #170301-00023#11 mark    
         IF g_end_prog MATCHES 'axrt341*' THEN #170301-00023#11 add
            #CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_29') RETURNING g_sub_success,l_xrca036,g_errno
            #170225-00002#1--mod--str--
#            SELECT glab005 INTO l_xrca036 FROM glab_t 
#             WHERE glabld = g_master.xrcald 
#               AND glabent = g_enterprise
#               AND glab002 = g_xrca.xrca007   # 帳款類別
#               AND glab001 = '13'             # 應收帳務類型科目設定
#               AND glab003 = '8304_05'
            LET l_glab003 = '8304_05'
            EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO l_xrca036
            #170225-00002#1--mod--end
         END IF
         #160920-00013#1 --e  add
         #170225-00002#1--mod--str--
#         SELECT glab005 INTO l_xrcd009 FROM glab_t 
#          WHERE glabld = g_master.xrcald 
#            AND glabent = g_enterprise
#            AND glab002 = g_xrca.xrca007   # 帳款類別
#            AND glab001 = '13'             # 應收帳務類型科目設定
#            AND glab003 = '8304_29'
#170503-00044#1 mark s---
#         LET l_glab003 = '8304_29'
#         EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO l_xrcd009
#170503-00044#1 mark e---
         #170225-00002#1--mod--end
         
         SELECT ooeg004 INTO l_xrca034 FROM ooeg_t WHERE ooegent = g_enterprise AND ooeg001 = l_xrca.xrca015
         
         #收款條件
         #LET g_xrca.xrca008 = l_isag.isag012 #170307-00079#1 mark
         LET g_xrca.xrca008 = l_isaf.isaf058  #170307-00079#1
         
         #應收日期/票據到期日
         #160921-00018#1 Mark ---(S)---
        #CALL s_fin_date_ar_receivable(g_xrca.xrcasite,g_xrca.xrca004,g_xrca.xrca008,g_xrca.xrcadocdt,
        #  g_xrca.xrcadocdt,g_xrca.xrcadocdt,'') RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010
         #160921-00018#1 Mark ---(E)---
         #160921-00018#1 Add  ---(S)---
         CALL s_fin_date_ar_receivable(g_xrca.xrcasite,g_xrca.xrca004,g_xrca.xrca008,g_xrca.xrcadocdt,
           #l_isaf.isafdocdt,g_xrca.xrcadocdt,g_xrca.xrcadocdt) RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010  #200111-00003#1 mark
           l_isaf.isaf014,g_xrca.xrcadocdt,g_xrca.xrcadocdt) RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010     #200111-00003#1 add
         #160921-00018#1 Add  ---(E)---
         
         IF g_master.b_comb2 = '1' THEN   #160125-00005#4 Add
            LET g_xrca.xrca011   = l_isaf.isaf016
        #160125-00005#4 Add  ---(S)---
         ELSE
            LET g_xrca.xrca011 = l_xrca.xrca011
         END IF
        #160125-00005#4 Add  ---(E)---

        #170503-00044#1--add--str--
        #210309-00026#1 add -s
        #axrt311销项税取aisi070中glab007
        IF g_end_prog MATCHES 'axrt311*' THEN
           SELECT glab007 INTO l_xrcd009
             FROM glab_t
            WHERE glabent = g_enterprise
              AND glabld = g_master.xrcald
              AND glab001 = '14'
              AND glab002 = '2'
              AND glab003 = g_xrca.xrca011
        ELSE
        #210309-00026#1 add -e
           SELECT glab005 INTO l_xrcd009
             FROM glab_t
            WHERE glabent = g_enterprise
              AND glabld = g_master.xrcald
              AND glab001 = '14'
              AND glab002 = '2'
              AND glab003 = g_xrca.xrca011
        END IF  #210309-00026#1 add
        IF cl_null(l_xrcd009) THEN 
           LET l_glab003 = '8304_29'
           EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO l_xrcd009
        END IF
        #170503-00044#1--add--end--
        

         #170503-00044#1--mark--str--
         #CALL s_tax_chk(g_glaa.glaacomp,g_xrca.xrca011)
         #   RETURNING l_success,l_oodbl004,l_xrca.xrca013,l_xrca.xrca012,l_oodb011
         #170503-00044#1--mark--end--
            
         #170503-00044#1--add--str--
         SELECT oodb004 INTO l_oodb004
            FROM oodb_t
           WHERE oodb002  = g_xrca.xrca011  AND oodbent  = g_enterprise
             AND oodb001  = (SELECT ooef019 
                               FROM ooef_t 
                              WHERE ooefent = g_enterprise
                                AND ooef001 = g_glaa.glaacomp )
            
             
             
         IF l_oodb004 = '1' THEN
            SELECT oodb005,oodb006
              INTO l_xrca.xrca013,l_xrca.xrca012
              FROM oodb_t LEFT OUTER JOIN oodbl_t
                                       ON oodbl003 = g_dlang
                                      AND oodbl002 = oodb002
                                      AND oodbl001 = oodb001
                                      AND oodblent = oodbent
             WHERE oodbent = g_enterprise
               AND oodb001 = (SELECT ooef019
                                FROM ooef_t 
                               WHERE ooefent = g_enterprise
                                 AND ooef001 = g_glaa.glaacomp )
               AND oodb002 = g_xrca.xrca011
               AND oodb003 = 'T01'
         ELSE
            SELECT oodb005,oodb006
              INTO l_xrca.xrca013,l_xrca.xrca012
              FROM oodb_t LEFT OUTER JOIN oodbl_t
                                       ON oodbl003 = g_dlang
                                      AND oodbl002 = oodb002
                                      AND oodbl001 = oodb001
                                      AND oodblent = oodbent
             WHERE oodbent  = g_enterprise
               AND oodb001  = (SELECT ooef019
                                 FROM ooef_t 
                                WHERE ooefent = g_enterprise
                                  AND ooef001 = g_glaa.glaacomp )
               AND oodb002  = g_xrca.xrca011
         END IF  
         #170503-00044#1--add--end--            

         LET g_xrca.xrca012   = l_xrca.xrca012
         LET g_xrca.xrca013   = l_xrca.xrca013
         CASE
            WHEN g_master.b_comb2 = '1'
               LET g_xrca.xrca014   = l_isaf.isaf057
               LET g_xrca.xrca015   = l_isaf.isaf004
            WHEN g_master.b_comb2 = '2'
               LET g_xrca.xrca014   = l_xrca.xrca014
               LET g_xrca.xrca015   = l_xrca.xrca015
            WHEN g_master.b_comb2 = '3'
               LET g_xrca.xrca014   = l_xrca.xrca014
               LET g_xrca.xrca015   = ''
            WHEN g_master.b_comb2 = '4'
               LET g_xrca.xrca014   = l_xrca.xrca014
               LET g_xrca.xrca015   = ''
         END CASE
         #160426-00013#1 mark ------
         #IF g_master.b_style = 'axrt300' THEN
         #   LET g_xrca.xrca016   = '12'
         #ELSE
         #   LET g_xrca.xrca016   = '22'
         #END IF
         #160426-00013#1 mark end---
         #160426-00013#1 add ------
         CASE
            #WHEN g_end_prog = 'axrt300' #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt300*' #170301-00023#11 add
#               IF l_isaf.isaf001 = '3' THEN #訂金發票   #180130-00001#1 mark
#                  LET g_xrca.xrca016 = '10'            #180130-00001#1 mark
#               ELSE
                  LET g_xrca.xrca016 = '12'
#               END IF                                  #180130-00001#1 mark
            #WHEN g_end_prog = 'axrt330'    #160620-00010#3 add #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt330*' #170301-00023#11 add
               LET g_xrca.xrca016 = '12'   #160620-00010#3 add 12:銷項發票
            #WHEN g_end_prog = 'axrt310' #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt310*' #170301-00023#11 add
               LET g_xrca.xrca016 = '12'   #161110-00009#1 Mod 10 --> 12
            #210309-00026#1 add -s
            WHEN g_end_prog MATCHES 'axrt311*'
               LET g_xrca.xrca016 = '12'
            #210309-00026#1 add -e
            #WHEN g_end_prog = 'axrt340' #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt340*' #170301-00023#11 add
               LET g_xrca.xrca016 = '22'
            #WHEN g_end_prog = 'axrt341'  #160920-00013#1 add #170301-00023#11 mark    
            WHEN g_end_prog MATCHES 'axrt341*' #170301-00023#11 add
               LET g_xrca.xrca016 = '29' #160920-00013#1 add
         END CASE
         #160426-00013#1 add end---
         LET g_xrca.xrca017   = 0
         IF g_master.b_comb2 = '1' THEN
            LET g_xrca.xrca018   = l_isaf.isafdocno
         ELSE
            LET g_xrca.xrca018   = ''
         END IF
         LET g_xrca.xrca019   = ''
         LET g_xrca.xrca020   = 'N'
         #LET g_xrca.xrca021   = ''
         #150904-00006#3-----s
         #商用發票號碼
         #LET g_xrca.xrca021 = l_isaf.isaf011   #161117-00043#1 Mod isaf066 --> isaf011 #161205-00014#1 mark
         LET g_xrca.xrca021 = l_isaf.isaf066    #161205-00014#1 add
         #150904-00006#3-----e
         #LET g_xrca.xrca022   = ''            #171013-00025#1 mark
         LET g_xrca.xrca022   = l_isaf.isaf064 #171013-00025#1 add
         LET g_xrca.xrca023   = l_isaf.isaf002
         LET g_xrca.xrca024   = ''
         LET g_xrca.xrca025   = l_isaf.isaf021
         LET g_xrca.xrca026   = ''
         LET g_xrca.xrca028   = l_isaf.isaf008
         LET g_xrca.xrca029   = l_isaf.isaf101
         LET g_xrca.xrca030   = 0
         LET g_xrca.xrca031   = 0
         LET g_xrca.xrca032   = 0
#         LET g_xrca.xrca033   = '' #180105-00048#1---mark
         #180105-00048#1---add---str
         SELECT DISTINCT xmdl030 INTO g_xrca.xrca033
           FROM xmdl_t
          WHERE xmdlent = g_enterprise
            AND xmdldocno = l_isag.isag002

         IF cl_null(g_xrca.xrca033) THEN
            LET g_xrca.xrca033   = ''
         END IF         
         #180105-00048#1---add---end
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
         #170916-00004#1 By 09505 mark  --(S)--
#         CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-2012') RETURNING l_sfin2012
#         IF l_sfin2012 <> 1 THEN
         #170916-00004#1 By 09505 mark  --(E)--
            SELECT ooib025 INTO g_xrca.xrca054 FROM ooib_t WHERE ooibent = g_enterprise
               AND ooib002 = g_xrca.xrca008
         
#         END IF             #170916-00004#1 By 09505 mark 
         
         
         LET g_xrca.xrca055   = ''
         LET g_xrca.xrca056   = ''
         LET g_xrca.xrca057   = ''

         #170503-00044#1--mark--str--
         #SELECT xmdk031 INTO g_xrca.xrca058 FROM xmdk_t WHERE xmdkdocno = l_isag.isag002
         #   AND xmdkent = g_enterprise
         #170503-00044#1--mark--end--
       
         #150518-00046#5 --s add
         #IF g_progflag = 'aisp340' THEN #170301-00023#11 mark    
         IF g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add
            SELECT rmaa005 INTO l_rmaa005
              FROM rmaa_t
             WHERE rmaaent = g_enterprise
               AND rmaadocno IN (SELECT DISTINCT rmdb001 FROM rmda_t,rmdb_t
                                  WHERE rmdaent = g_enterprise
                                    AND rmdadocno =  l_isag.isag002
                                    AND rmdbseq =  l_isag.isag003
                                    AND rmdaent = rmdbent 
                                    AND rmdadocno = rmdbdocno
                                    AND rmdastus = 'S')
                                    
            SELECT xmdk031 INTO g_xrca.xrca058 FROM xmdk_t 
             WHERE xmdkent = g_enterprise AND xmdkdocno = l_rmaa005                      

            IF cl_null(g_xrca.xrca058) THEN
               SELECT pmab089 INTO g_xrca.xrca058 
                 FROM pmab_t
                WHERE pmabent = g_enterprise
                  AND pmabsite = l_isaf.isafsite
                  AND pmab001 = l_isaf.isaf003
                  AND pmabstus = 'Y'
            END IF
         END IF
         #150518-00046#5 --e add
         #170306-00026#1--add--s--xul
         #若销售分类为空，根据客户默认带出
         IF cl_null(g_xrca.xrca058) THEN
            CALL s_control_get_group('2',g_user,g_dept) RETURNING l_success,l_controlno
            CALL s_apmm101_default_pmab('2',l_controlno,g_site,l_isaf.isaf003) RETURNING g_pmab.*
            LET g_xrca.xrca058 = g_pmab.pmab039
         END IF
         #170306-00026#1--add--e--xul
         LET g_xrca.xrca059   = ''
         #LET g_xrca.xrca060   = 2  #201223-00032#1 mark
         #201223-00032#1 add(s)
         IF g_end_prog MATCHES 'axrt340*' THEN
            SELECT xmdk084 INTO l_xmdk084                      
              FROM xmdk_t
             WHERE xmdkent = g_enterprise
               AND xmdkdocno = l_isag.isag002
            LET g_xrca.xrca060 = l_xmdk084
         ELSE
            LET g_xrca.xrca060 = 2
         END IF
         #201223-00032#1 add(e)
         LET g_xrca.xrca061   = l_xrca.xrca061
         LET g_xrca.xrca062   = '1'
         LET g_xrca.xrca063   = ''
         #201208-00025#1 add(s)
         IF NOT cl_null(l_isag.isag011) AND g_end_prog MATCHES 'axrt310*' THEN
            LET g_xrca.xrca064 = l_isag.isag011
         END IF
         #201208-00025#1 add(e)
         LET g_xrca.xrca065   = l_isaf.isaf010
         #150918-00001#7-----s
         #IF NOT cl_null(g_xrca.xrca021)THEN   #161219-00031#1 mark lujh
         IF cl_null(l_isaf.isaf011) THEN       #161219-00031#1 add lujh
            LET g_xrca.xrca066   = g_xrca.xrca021
         ELSE
            LET g_xrca.xrca065   = l_isaf.isaf010   #161219-00031#1 add lujh
            LET g_xrca.xrca066   = l_isaf.isaf011
         END IF
         #150918-00001#7-----e
         #180723-00059#1---add---str--
         IF cl_null(l_isaf.isaf011) AND l_isaf.isaf056 = '2' THEN
            LET l_cnt = 0
            SELECT COUNT(1) INTO l_cnt
              FROM isat_t
             WHERE isatent = g_enterprise AND isatcomp = g_glaa.glaacomp AND isatdocno = l_isaf.isafdocno
             GROUP BY isat003,isat004
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
            IF l_cnt = 1 THEN
               SELECT isat003,isat004 INTO g_xrca.xrca065,g_xrca.xrca066
                 FROM isat_t
                WHERE isatent = g_enterprise AND isatcomp = g_glaa.glaacomp AND isatdocno = l_isaf.isafdocno
                GROUP BY isat003,isat004
            ELSE
               IF l_cnt > 1 THEN
                  LET g_xrca.xrca066 = "MULTI"
               END IF
            END IF
         END IF
         #180723-00059#1---add---end--
         LET g_xrca.xrca100   = l_isaf.isaf100
         IF g_master.b_comb1 = 1 THEN
            LET g_xrca.xrca101 = l_isaf.isaf101
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
         #LET g_xrca.xrca057   = l_isaf.isaf067   #160802-00007#1 Add  #181227-00033#1 mark
         #181227-00033#1 add-s
         LET l_pmaa004=''
         SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t 
          WHERE pmaaent=g_enterprise AND pmaa001=g_xrca.xrca004
         IF l_pmaa004='2' OR l_pmaa004='4' THEN
            LET g_xrca.xrca057   = l_isaf.isaf067
         ELSE 
            LET g_xrca.xrca057   = g_xrca.xrca004        
         END IF 
         #181227-00033#1 add-e
         
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

         LET g_xrcb.xrcbseq = 0

      END IF
      
      #170225-00002#1--mod--str--
      #程式优化
      #抓取订单单号和项次
#      SELECT xmdl003,xmdl004 INTO l_xmdl003,l_xmdl004 FROM xmdl_t
#       WHERE xmdldocno = l_isag.isag002
#         AND xmdlseq = l_isag.isag003
#         AND xmdlent = g_enterprise
      #200601-00017#1--add---str
      LET g_xrcb.xrcb015 = ''
      LET g_xrcb.xrcb016 = ''
      LET l_xmdl030 = ''
      #200601-00017#1--add---end
      EXECUTE axrp132_sel_xmdl_pr USING l_isag.isag003,l_isag.isag002 
                                  #INTO l_xmdl003,l_xmdl004,g_xrcb.xrcb015,g_xrcb.xrcb016,l_xmdl050,l_xmdlnum #170413-00024#2 mark
                                  INTO l_xmdk003,l_xmdk004_1,l_xmdl003,l_xmdl004,g_xrcb.xrcb015,g_xrcb.xrcb016,l_xmdl050,l_xmdlnum,l_xmdk030,l_xmdl030,l_xmdl031,l_xmdl051  #170413-00024#2 add    #180105-00048#1---mod  add-->,l_xmdk030,l_xmdl030,l_xmdl031  #200317-00037#1 add l_xmdl051
      #170225-00002#1--mod--end
      #170413-00024#2 add s---
      IF g_master.b_comb2 <> '3' THEN #非人员汇总方式
         LET g_xrcb.xrcb010 = l_xmdk004_1 #出貨單部門
         LET g_xrcb.xrcb051 = l_xmdk003 #出貨單人員
         IF NOT cl_null(l_xmdl003) AND NOT cl_null(l_xmdl004) THEN  #訂單單號，訂單項次
            EXECUTE axrp132_sel_xmda_pr USING l_xmdl003 INTO g_xrcb.xrcb010,g_xrcb.xrcb051 
         END IF
      ELSE
         LET g_xrcb.xrcb010 = l_isaf.isaf004
         LET g_xrcb.xrcb051 = l_isaf.isaf057        
      END IF   
      #170413-00024#2 add e---      
      LET g_xrcb.xrcbent = g_enterprise    
      LET g_xrcb.xrcbld  = g_master.xrcald 
      LET g_xrcb.xrcbdocno = g_xrca.xrcadocno
      LET g_xrcb.xrcbseq = g_xrcb.xrcbseq + 1
      LET g_xrcb.xrcbsite= g_master.xrcasite 
      LET g_xrcb.xrcborga= l_isaf.isafcomp   #160317-00018#1 Mark
      LET g_xrcb.xrcborga= l_isag.isagorga   #160317-00018#1 Add
      #170325-00043#1 mod s---
      LET g_xrcb.xrcb001 = l_isag.isag001
      CASE l_isag.isag001
         WHEN '16'  #16:沖其他應收暫估 
            LET g_xrcb.xrcb001 = '19'
         WHEN '26'  #26:其他待抵暫估 
            LET g_xrcb.xrcb001 = '29'            
      END CASE      
      #170325-00043#1 mod e---
      #150518-00046#5 --s add
      #IF g_progflag = 'aisp340' THEN #170301-00023#11 mark    
      IF g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add
         LET g_xrcb.xrcb001 = "1D"
      END IF
      #150518-00046#5 --e add

      LET g_xrcb.xrcb002 = l_isag.isag002
      LET g_xrcb.xrcb003 = l_isag.isag003
      LET g_xrcb.xrcb004 = l_isag.isag009
     #LET g_xrcb.xrcb005 = l_isag.isag010                                   #150828-00001#2 Mark
#180920-00015#3 add_S     
      IF l_isag.isag001 = '19' OR l_isag.isag001 = '29' THEN
         LET g_xrcb.xrcb005 = l_isag.isag010
      ELSE
         CALL s_axrt300_get_xrcb005(g_xrcb.xrcb004) RETURNING g_xrcb.xrcb005
      END IF
#180920-00015#3 add_E   

      #200317-00037#1 add s---
      LET l_imaa004 = NULL
      EXECUTE selimaa_p USING g_xrcb.xrcb004 INTO l_imaa004
      IF l_imaa004 = 'E' THEN #费用类料件
         LET g_xrcb.xrcb005 = l_xmdl051
      END IF
      #200317-00037#1 add e---
      
#      CALL s_axrt300_get_xrcb005(g_xrcb.xrcb004) RETURNING g_xrcb.xrcb005   #150828-00001#2 Add  #180920-00015#3 mark     
      #161110-00009#1 Add  ---(S)---
      IF cl_null(g_xrcb.xrcb005) THEN 
         LET g_xrcb.xrcb005 = l_isag.isag010
      END IF
      #161110-00009#1 Add  ---(E)---
      LET g_xrcb.xrcb006 = l_isag.isag005
      LET g_xrcb.xrcb007 = l_isag.isag004
      LET g_xrcb.xrcb008 = l_xmdl003
      LET g_xrcb.xrcb009 = l_xmdl004
      
      #150518-00046#5 --s add
      #IF g_progflag = 'aisp340' THEN #170301-00023#11 mark    
      IF g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add 
         SELECT rmdb001,rmdb002 INTO g_xrcb.xrcb008,g_xrcb.xrcb009 
           FROM rmda_t,rmdb_t
          WHERE rmdaent = g_enterprise
            AND rmdadocno =  l_isag.isag002
            AND rmdbseq =  l_isag.isag003
            AND rmdaent = rmdbent 
            AND rmdadocno = rmdbdocno
            AND rmdastus = 'S'
      END IF
      #150518-00046#5 --e add
      
      LET g_xrcb.xrcblegl= g_xrca.xrcacomp
      #LET g_xrcb.xrcb010 = l_isaf.isaf004 #170413-00024#2 mark
      LET g_xrcb.xrcb011 = g_xrca.xrca034
      SELECT imaa009 INTO g_xrcb.xrcb012 FROM imaa_t WHERE imaaent = g_enterprise
       AND imaa001 = g_xrcb.xrcb004
      LET g_xrcb.xrcb013 = '' 
      LET g_xrcb.xrcb014 = ''
#      LET g_xrcb.xrcb015 = '' #180105-00048#1----mark
#      LET g_xrcb.xrcb016 = '' #180105-00048#1----mark
      #180105-00048#1----add----str
      IF cl_null(l_xmdl030) THEN
         #LET g_xrcb.xrcb015 = '' #190423-00042#32 mark
         #190423-00042#32 add s---
         IF l_isag.isag001 = '19' OR l_isag.isag001 = '29' THEN 
            LET g_xrcb.xrcb015 = l_isag.isag022 
         END IF 
         #190423-00042#32 add e---
      ELSE
         LET g_xrcb.xrcb015 = l_xmdl030
      END IF
      IF cl_null(l_xmdl031) THEN
         #LET g_xrcb.xrcb016 = '' #190423-00042#32 mark
         #190423-00042#32 add s---
         IF l_isag.isag001 = '19' OR l_isag.isag001 = '29' THEN 
            LET g_xrcb.xrcb016 = l_isag.isag023 
         END IF 
         #190423-00042#32 add e---
      ELSE
         LET g_xrcb.xrcb016 = l_xmdl031
      END IF
      #180105-00048#1----add----end  
      #160912-00034#1--add--str--lujh
#170225-00002#1--mark--str--
#      SELECT xmdl030,xmdl031 
#        INTO g_xrcb.xrcb015,g_xrcb.xrcb016
#        FROM xmdl_t
#       WHERE xmdlent = g_enterprise
#         AND xmdldocno = g_xrcb.xrcb002
#         AND xmdlseq = g_xrcb.xrcb003
#170225-00002#1--mark--end
      #160912-00034#1--add--end--lujh
      LET g_xrcb.xrcb017 = ''
      LET g_xrcb.xrcb018 = ''
      LET g_xrcb.xrcb019 = ''
      LET g_xrcb.xrcb020 = l_isag.isag006
      LET g_xrcb.xrcb021 = ''   #161114-00028#1 Add
      #1508170001--Kris:axrp132  折襄單時, 應取銷貨退回的會科
      #IF g_master.b_style = 'axrt340' THEN  #160426-00013#1 mark
      #IF g_end_prog = 'axrt340' THEN         #160426-00013#1   #170301-00023#11 mark    
      IF g_end_prog MATCHES 'axrt340*' THEN #170301-00023#11 add
         #CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_04') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno    #170310-00028#1 mark
         #170310-00028#1-----s 
            LET l_xmdk082 = ''
            SELECT xmdk082 INTO l_xmdk082
              FROM xmdk_t
             WHERE xmdkent   = g_enterprise
               AND xmdkdocno = l_isag.isag002
            #190305-00001#3   add-S
            IF g_xrcb.xrcb001 = '21' THEN
               CALL axrp132_get_xrcb021(g_xrcb.xrcbld,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003,g_xrcb.xrcb004,g_xrcb.xrcb034,l_xmdk082)
                  RETURNING g_sub_success,g_xrcb.xrcb021
            END IF
            IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
            #190305-00001#3   add-E
               CASE
                  WHEN l_xmdk082 = '4' #axmt600銷退方式=4:銷貨折讓(純金額折價)時抓axri011的帳款折讓科目
                     CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_05') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
                  OTHERWISE  #其他銷退方式都抓銷貨退回科目
                     CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_04') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
               END CASE 
            END IF   #190305-00001#3 add            
         #170310-00028#1-----e
      END IF
      #160920-00013#1 --s  add
      #IF g_end_prog = 'axrt341' THEN           #170301-00023#11 mark    
      IF g_end_prog MATCHES 'axrt341*' THEN #170301-00023#11 add
         #CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_29') RETURNING g_sub_success,l_xrca036,g_errno
         #170225-00002#1--mod--str--
#         SELECT glab005 INTO l_xrca036 FROM glab_t 
#          WHERE glabld = g_master.xrcald 
#            AND glabent = g_enterprise
#            AND glab002 = g_xrca.xrca007   # 帳款類別
#            AND glab001 = '13'             # 應收帳務類型科目設定
#            AND glab003 = '8304_05'
         LET l_glab003 = '8304_05'
         EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO l_xrca036
         #170225-00002#1--mod--end
      END IF
      #160920-00013#1 --e  add
      #150807-00010#1 --(S)
      IF g_xrcb.xrcb001 = '21' THEN
         LET l_xmdk082 = ''
         #170503-00044#1--mark--str--
         #SELECT xmdk004,xmdk082
         #  INTO l_xmdk004,l_xmdk082
         #  FROM xmdk_t
         # WHERE xmdkent   = g_enterprise
         #   AND xmdkdocno = g_xrcb.xrcb002
         #170503-00044#1--mark--end--            
        #IF l_xmdk082 = '4' THEN                    #151013-00019#7 mark
         IF l_xmdk082 = '1' OR l_xmdk082 = '4' THEN #151013-00019#7
#170225-00002#1--mark--str--
#            SELECT xmdl050 INTO l_xmdl050
#              FROM xmdl_t
#             WHERE xmdlent = g_enterprise
#               AND xmdldocno = g_xrcb.xrcb002 AND xmdlseq = g_xrcb.xrcb003
#170225-00002#1--mark--end
            #190305-00001#3   add-S
            IF g_xrcb.xrcb001 = '21' THEN
               CALL axrp132_get_xrcb021(g_xrcb.xrcbld,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003,g_xrcb.xrcb004,g_xrcb.xrcb034,l_xmdk082)
                  RETURNING g_sub_success,g_xrcb.xrcb021
            END IF
            IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
            #190305-00001#3   add-E
               CALL s_fin_dept_reasons_with_ld_get_account(l_xmdk004,'310',l_xmdl050,g_xrca.xrcald,'@2@11',g_xrca.xrcadocdt)
                    RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
            END IF   #190305-00001#3 add
         END IF
         
         #170525-00086#1-----s
         IF g_end_prog NOT MATCHES 'axrt341*' 
            AND g_end_prog NOT MATCHES 'axrt340*' THEN
            #171013-00004#3--mod--s--xul
            #CALL s_axrt300_item_acc(g_xrca.xrcald,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrca.xrca036,g_xrcb.xrcb004)   #160120-00011#3 add g_xrcb.xrcbdocno,g_xrcb.xrcbseq lujh
            #   RETURNING g_xrcb.xrcb021            
            SELECT xmdl014,xmdl007 INTO l_xmdl014,l_xmdl007  
              FROM xmdl_t
             WHERE xmdlent = g_enterprise
               AND xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003              
            IF NOT cl_null(g_xrcb.xrcb004) THEN            
               #180928-00002#1 add s--- #订单/出货单/销退单取來源單上的銷售分類
               LET l_xmdk031 = NULL
               IF g_xrcb.xrcb001 = '10' OR g_xrcb.xrcb001 = '11' OR g_xrcb.xrcb001 = '21' THEN 
                  IF g_xrcb.xrcb001 = '10' THEN 
                     SELECT xmda034 INTO l_xmdk031 FROM xmda_t WHERE xmdaent = g_enterprise AND xmdadocno = g_xrcb.xrcb002
                  END IF
                  IF g_xrcb.xrcb001 = '11' OR g_xrcb.xrcb001 = '21' THEN 
                     SELECT xmdk031 INTO l_xmdk031 FROM xmdk_t WHERE xmdkent = g_enterprise AND xmdkdocno = g_xrcb.xrcb002
                  END IF                      
               END IF   
               IF cl_null(l_xmdk031) THEN 
                  LET l_xmdk031 = g_xrca.xrca058  
               END IF                  
               #180928-00002#1 add e---    
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
                  LET l_xmdk082 = ''
                  SELECT xmdk082 INTO l_xmdk082
                    FROM xmdk_t
                   WHERE xmdkent   = g_enterprise
                     AND xmdkdocno = l_isag.isag002
                  LET l_type = ''
                  IF l_xmdk082 = '1' THEN LET l_type = '33' END IF   #销退退回->取成本及收入类销退科目
                  IF l_xmdk082 = '4' THEN LET l_type = '34' END IF   #金额折让->取成本及收入类金额折让科目
                  CALL s_get_item_acc(g_xrca.xrcald,l_type,g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)
                        RETURNING g_sub_success,g_xrcb.xrcb021
               END IF
               IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
               #190305-00001#3   add-E               
                  IF l_xmdl007 = '9' THEN
                     #CALL s_get_item_acc(g_xrca.xrcald,'30',g_xrcb.xrcb004,l_xmdk031,g_xrcb.xrcb034,'',l_xmdl014)   #180928-00002#1 mod g_xrca.xrca058 --> l_xmdk031  #190812-00010#5 mark
                     CALL s_get_item_acc(g_xrca.xrcald,'30',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)       #190812-00010#5 add                  
                      RETURNING g_sub_success,g_xrcb.xrcb021 
                  ELSE
                     #CALL s_get_item_acc(g_xrca.xrcald,'4',g_xrcb.xrcb004,l_xmdk031,g_xrcb.xrcb034,'',l_xmdl014)    #180928-00002#1 mod g_xrca.xrca058 --> l_xmdk031 #190812-00010#5 mark
                     CALL s_get_item_acc(g_xrca.xrcald,'4',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)        #190812-00010#5 add
                     #190812-00010#5 add 
                      RETURNING g_sub_success,g_xrcb.xrcb021 
                  END IF
               END IF   #190305-00001#3 add                  
            END IF 
            IF cl_null(g_xrcb.xrcb021) THEN
               LET g_xrcb.xrcb021 = g_xrca.xrca036
            END IF 
            #171013-00004#3--mod--s--xul            
         END IF
         #170525-00086#1-----e
         
         IF cl_null(g_xrcb.xrcb021) THEN
            #CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_04') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno   #170310-00028#1 mark
            #170310-00028#1-----s 
            LET l_xmdk082 = ''
            SELECT xmdk082 INTO l_xmdk082
              FROM xmdk_t
             WHERE xmdkent   = g_enterprise
               AND xmdkdocno = l_isag.isag002
            #190305-00001#3   add-S
            IF g_xrcb.xrcb001 = '21' THEN
               CALL axrp132_get_xrcb021(g_xrcb.xrcbld,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003,g_xrcb.xrcb004,g_xrcb.xrcb034,l_xmdk082)
                  RETURNING g_sub_success,g_xrcb.xrcb021
            END IF
            IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
            #190305-00001#3   add-E
               CASE
                  WHEN l_xmdk082 = '4' #axmt600銷退方式=4:銷貨折讓(純金額折價)時抓axri011的帳款折讓科目
                     CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_05') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
                  OTHERWISE  #其他銷退方式都抓銷貨退回科目
                     CALL s_fin_get_account(g_xrca.xrcald,'13',g_xrca.xrca007,'8304_04') RETURNING g_sub_success,g_xrcb.xrcb021,g_errno
               END CASE
               #170310-00028#1-----e
            END IF   #190305-00001#3 add
         END IF
      END IF
      #150807-00010#1 --(E)
      IF cl_null(g_xrcb.xrcb021) THEN  #150807-00010#1 
         #171013-00004#3--mod--s--xul
         #CALL s_axrt300_item_acc(g_xrca.xrcald,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrca.xrca036,g_xrcb.xrcb004)   #160120-00011#3 add g_xrcb.xrcbdocno,g_xrcb.xrcbseq lujh
         #   RETURNING g_xrcb.xrcb021            
         SELECT xmdl014,xmdl007 INTO l_xmdl014,l_xmdl007  
           FROM xmdl_t
          WHERE xmdlent = g_enterprise
            AND xmdldocno = g_xrcb.xrcb002
            AND xmdlseq = g_xrcb.xrcb003
         IF NOT cl_null(g_xrcb.xrcb004) THEN         
            #180928-00002#1 add s--- #订单/出货单/销退单取來源單上的銷售分類
            LET l_xmdk031 = NULL
            IF g_xrcb.xrcb001 = '10' OR g_xrcb.xrcb001 = '11' OR g_xrcb.xrcb001 = '21' THEN 
               IF g_xrcb.xrcb001 = '10' THEN 
                  SELECT xmda034 INTO l_xmdk031 FROM xmda_t WHERE xmdaent = g_enterprise AND xmdadocno = g_xrcb.xrcb002
               END IF
               IF g_xrcb.xrcb001 = '11' OR g_xrcb.xrcb001 = '21' THEN 
                  SELECT xmdk031 INTO l_xmdk031 FROM xmdk_t WHERE xmdkent = g_enterprise AND xmdkdocno = g_xrcb.xrcb002
               END IF                      
            END IF   
            IF cl_null(l_xmdk031) THEN 
               LET l_xmdk031 = g_xrca.xrca058  
            END IF                  
            #180928-00002#1 add e---    
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
               LET l_xmdk082 = ''
               SELECT xmdk082 INTO l_xmdk082
                 FROM xmdk_t
                WHERE xmdkent   = g_enterprise
                  AND xmdkdocno = l_isag.isag002
               LET l_type = ''
               IF l_xmdk082 = '1' THEN LET l_type = '33' END IF   #销退退回->取成本及收入类销退科目
               IF l_xmdk082 = '4' THEN LET l_type = '34' END IF   #金额折让->取成本及收入类金额折让科目
               CALL s_get_item_acc(g_xrca.xrcald,l_type,g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)
                     RETURNING g_sub_success,g_xrcb.xrcb021
            END IF
            IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
            #190305-00001#3   add-E             
               IF l_xmdl007 = '9' THEN
                  #CALL s_get_item_acc(g_xrca.xrcald,'30',g_xrcb.xrcb004,l_xmdk031,g_xrcb.xrcb034,'',l_xmdl014)   #180928-00002#1 mod g_xrca.xrca058 --> l_xmdk031 #190812-00010#5 mark
                  CALL s_get_item_acc(g_xrca.xrcald,'30',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)   #190812-00010#5 add                
                   RETURNING l_success,g_xrcb.xrcb021 
               ELSE
                  #CALL s_get_item_acc(g_xrca.xrcald,'4',g_xrcb.xrcb004,l_xmdk031,g_xrcb.xrcb034,'',l_xmdl014)    #180928-00002#1 mod g_xrca.xrca058 --> l_xmdk031 #190812-00010#5 mark
                   CALL s_get_item_acc(g_xrca.xrcald,'4',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)   #190812-00010#5 add 
                   RETURNING g_sub_success,g_xrcb.xrcb021 
               END IF 
            END IF   #190305-00001#3 add               
         END IF 
         IF cl_null(g_xrcb.xrcb021) THEN
            LET g_xrcb.xrcb021 = g_xrca.xrca036
         END IF 
         #171013-00004#3--mod--s--xul 
      END IF
      #160909-00084#1 Add  ---(S)---
#      IF l_isaf.isaf001 = '3' AND g_sfin2022 = '02' THEN  #210309-00026#1 mark  
      IF (l_isaf.isaf001 = '3' AND g_sfin2022 = '02') OR l_isaf.isaf001 = '0' THEN  #210309-00026#1 add  
         #170225-00002#1--mod--str--
#         SELECT glab005 INTO g_xrcb.xrcb021 FROM glab_t 
#          WHERE glabld = g_master.xrcald 
#            AND glabent = g_enterprise
#            AND glab002 = g_xrca.xrca007   # 帳款類別
#            AND glab001 = '13'             # 應收帳務類型科目設定
#            AND glab003 = '8304_22'
         LET l_glab003 = '8304_22'
         #190305-00001#3   add-S
         IF g_xrcb.xrcb001 = '21' THEN
            #销退方式
            LET l_xmdk082 = ''
            SELECT xmdk082 INTO l_xmdk082
              FROM xmdk_t
             WHERE xmdkent   = g_enterprise
               AND xmdkdocno = l_isag.isag002
            CALL axrp132_get_xrcb021(g_xrcb.xrcbld,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003,g_xrcb.xrcb004,g_xrcb.xrcb034,l_xmdk082)
               RETURNING g_sub_success,g_xrcb.xrcb021
         END IF
         IF (cl_null(g_xrcb.xrcb021) AND g_xrcb.xrcb001 = '21') OR g_xrcb.xrcb001 <> '21' THEN 
         #190305-00001#3   add-E
            EXECUTE axrp132_sel_glab_pr USING g_xrca.xrca007,l_glab003 INTO g_xrcb.xrcb021
            #170225-00002#1--mod--end
         END IF   #190305-00001#3 add
      END IF
      #160909-00084#1 Add  ---(E)---            #150807-00010#1 
      LET g_xrcb.xrcb022 = l_isag.isag015
      LET g_xrcb.xrcb024 = ''
      LET g_xrcb.xrcb025 = ''
      LET g_xrcb.xrcb026 = ''

      #albireo 151005-----s
      #kris:不論內外銷  銷退單身發票與aist310單身相同   
      #                出貨與單頭同
      IF l_isaf.isaf056 = '2' THEN
         IF cl_null(l_isaf.isaf011) THEN       #180919-00058#1---add
            LET g_xrcb.xrcb027 = l_isag.isag013
            LET g_xrcb.xrcb028 = l_isag.isag014
         #180919-00058#1---add--str
         ElSE
            LET g_xrcb.xrcb027 = l_isaf.isaf010
            LET g_xrcb.xrcb028 = l_isaf.isaf011
         END IF
         #180919-00058#1---add--end          
      ELSE
         LET g_xrcb.xrcb027 = l_isaf.isaf010
         LET g_xrcb.xrcb028 = l_isaf.isaf011
      END IF
      #albireo 151005-----e
      LET g_xrcb.xrcb029 = g_xrca.xrca035
      LET g_xrcb.xrcb030 = 0
      #LET g_xrcb.xrcb031 = l_isag.isag012 #170307-00079#1 mark
      #150518-00046#5 --s add
      #IF g_progflag = 'aisp340' THEN #170301-00023#11 mark    
      IF g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add
         #RMA單號
         SELECT rmdb001 INTO g_xrcb.xrcb048 
           FROM rmda_t,rmdb_t
            WHERE rmdaent = g_enterprise 
              AND rmdadocno = g_xrcb.xrcb002 
              AND rmdbseq   = g_xrcb.xrcb003
              AND rmda007   = g_xrca.xrca004
              AND rmda008   = g_xrca.xrca004
              AND rmdaent = rmdbent 
              AND rmdadocno = rmdbdocno 
      END IF
      #150518-00046#5 --e add
      LET g_xrcb.xrcb049 = l_isag.isagdocno
      LET g_xrcb.xrcb050 = l_isag.isagseq
      #收款條件
      #IF cl_null(g_xrcb.xrcb031) THEN #170307-00079#1 mark
         LET g_xrcb.xrcb031 = g_xrca.xrca008
      #END IF #170307-00079#1 mark
      #LET g_xrcb.xrcb051 = l_isaf.isaf057 #170413-00024#2 mark
      LET g_xrcb.xrcb100 = g_xrca.xrca100
      LET g_xrcb.xrcb101 = l_isag.isag101
      #170503-00044#1--mark--str
      #LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrcb.xrcb020
      #CALL s_axrt300_exrate(g_glaa.glaa002,g_xrca.xrcadocdt,g_xrca.xrca100,g_glaa.glaa001,g_xrcb.xrcb101,g_xrca.xrca101,g_glaa.glaacomp)
      #   RETURNING l_success,g_xrcb.xrcb111
      #170503-00044#1--mark--end
      LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101    #170503-00044#1 add  
      CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111   #180821-00038#10   
     #IF l_success = 'N' THEN LET g_success = 'N' END IF
     #151214-00018#1 Mark ---(S)---
     #CALL s_tax_ins(g_xrca.xrcadocno,g_xrcb.xrcbseq,0,g_glaa.glaacomp,
     #               g_xrcb.xrcb101 * g_xrcb.xrcb007,g_xrcb.xrcb020,
     #               g_xrcb.xrcb007,g_xrcb.xrcb100,g_xrca.xrca101,g_xrca.xrcald,g_xrca.xrca121,g_xrca.xrca131)
     #   RETURNING g_xrcb.xrcb103,g_xrcb.xrcb104,g_xrcb.xrcb105,
     #             g_xrcb.xrcb113,g_xrcb.xrcb114,g_xrcb.xrcb115,
     #             g_xrcb.xrcb123,g_xrcb.xrcb124,g_xrcb.xrcb125,
     #             g_xrcb.xrcb133,g_xrcb.xrcb134,g_xrcb.xrcb135
     #151214-00018#1 Mark ---(E)---
     #151214-00018#1 Add  ---(S)---


      #DROP TABLE axrp132_detail #ODI-ORA#
#170503-00044#1 mark s---      
#      DELETE FROM axrp132_detail  #160826-00004#1 mod
#
#      INSERT INTO axrp132_detail  #160826-00004#1 add
#      SELECT * FROM xrcd_t WHERE xrcdent = g_enterprise
#         AND xrcddocno = l_isag.isagdocno
#         AND xrcdseq = l_isag.isagseq
#      #INTO TEMP axrp132_detail #160826-00004#1 mark
#
#      UPDATE axrp132_detail SET xrcddocno = g_xrca.xrcadocno,xrcdseq = g_xrcb.xrcbseq,
#                                xrcdld = g_xrca.xrcald   #160810-00043#1 Add
#
#      INSERT INTO xrcd_t SELECT * FROM axrp132_detail
#170503-00044#1 mark e---      
      #200527-00024#1 mark(s)
      ##180531-00020#2 add s---
      #IF g_isao006 = 'Y' THEN 
      #   #防伪税控前端资料获取 s------------------------------------------
      #   #开票数量
      #   LET l_isch007_sum = 0 
      #   EXECUTE axrp132_get_isch007_p USING g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq INTO l_isch007_sum
      #   IF cl_null(l_isch007_sum) THEN LET l_isch007_sum = 0 END IF   
      #     
      #   #對應到該對帳單已立帳數量 
      #   LET l_xrcb007_sum = 0
      #   EXECUTE axrp132_get_xrcb007_p USING g_xrcb.xrcbld,g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq INTO l_xrcb007_sum
      #   IF cl_null(l_xrcb007_sum) THEN LET l_xrcb007_sum = 0 END IF   
      #
      #   
      #   #对账數量 isag004
      #   LET l_isag004 = 0
      #   EXECUTE axrp132_get_isag004_p USING g_isaf_d[li_idx].isafcomp,g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq INTO l_isag004
      #   IF cl_null(l_isag004) THEN LET l_isag004 = 0 END IF
      # 
      #   LET g_xrcb.xrcb101 = l_isag.isag101  #原幣單價=isag_t上的發票單價
      #   
      #   
      #   IF g_xrcb.xrcb001 = '11' OR g_xrcb.xrcb001 = '21' THEN #出货/销退 
      #      #可立账数量：出貨計價數量(xmdl022)-已立帳數量(xmdl038)=l_amount 
      #      LET l_amounta =  l_amount                    
      #   ELSE
      #      #可立账数量:isag004
      #      LET l_amounta = l_isag004  
      #   END IF            
      #   #防伪税控前端资料获取 e------------------------------------------
      #   
      #   ###########依發票金額立帳#################
      #   IF g_master.l_chkisch = '1' THEN 
      #    ##可立账数量A>=开票数量--s-----------------------------------------------------            
      #      #可立账数量A>=开票数量            
      #      IF l_amounta >= l_isch007_sum - l_xrcb007_sum THEN
      #         #l_amountb此次可立账的数量
      #         LET l_amountb = l_isch007_sum - l_xrcb007_sum 
      #         LET g_xrcb.xrcb007 = l_amountb
      #         #對應到該對帳單已立帳數量=0 AND 開票數量SUM(isch007)=對帳數量(isag004)时，
      #         #原幣單價/原幣未稅/原幣稅額/原幣含稅/本幣未稅/本幣稅額/本幣含稅=皆由isag_t帶入
      #         #本币单价重新计算
      #         IF l_xrcb007_sum = 0 AND l_isch007_sum = l_isag004 THEN
      #            LET g_xrcb.xrcb101 = l_isag.isag101   #原币单价
      #            LET g_xrcb.xrcb103 = l_isag.isag103   #原币未税金额
      #            LET g_xrcb.xrcb104 = l_isag.isag104   #原币税额
      #            LET g_xrcb.xrcb105 = l_isag.isag105   #原币含税金额
      #            LET g_xrcb.xrcb113 = l_isag.isag113   #本币未税金额
      #            LET g_xrcb.xrcb114 = l_isag.isag114   #本币税额
      #            LET g_xrcb.xrcb115 = l_isag.isag115   #本币含税金额
      #            LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101 #本币单价
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111
      #            IF g_glaa.glaa015 = 'Y' THEN
      #               IF g_glaa.glaa017 = '1' THEN
      #                  LET g_xrcb.xrcb123 = g_xrcb.xrcb103 * g_xrca.xrca121  #本位币二未税金额  
      #                  LET g_xrcb.xrcb124 = g_xrcb.xrcb104 * g_xrca.xrca121  #本位币二税额
      #                  LET g_xrcb.xrcb125 = g_xrcb.xrcb105 * g_xrca.xrca121  #本位幣二含稅金額
      #               ELSE
      #                  LET g_xrcb.xrcb123 = g_xrcb.xrcb113 * g_xrca.xrca121  
      #                  LET g_xrcb.xrcb124 = g_xrcb.xrcb114 * g_xrca.xrca121
      #                  LET g_xrcb.xrcb125 = g_xrcb.xrcb115 * g_xrca.xrca121
      #               END IF
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb123,2) RETURNING g_success,g_errno,g_xrcb.xrcb123
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb124,2) RETURNING g_success,g_errno,g_xrcb.xrcb124
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb125,2) RETURNING g_success,g_errno,g_xrcb.xrcb125                     
      #            END IF
      #            IF g_glaa.glaa019 = 'Y' THEN
      #               IF g_glaa.glaa021 = '1' THEN
      #                  LET g_xrcb.xrcb133 = g_xrcb.xrcb103 * g_xrca.xrca131  #本位幣三未稅金額   
      #                  LET g_xrcb.xrcb134 = g_xrcb.xrcb104 * g_xrca.xrca131  #本位幣三税额  
      #                  LET g_xrcb.xrcb135 = g_xrcb.xrcb105 * g_xrca.xrca131  #本位幣三含税金额  
      #               ELSE
      #                  LET g_xrcb.xrcb133 = g_xrcb.xrcb113 * g_xrca.xrca131   
      #                  LET g_xrcb.xrcb134 = g_xrcb.xrcb114 * g_xrca.xrca131   
      #                  LET g_xrcb.xrcb135 = g_xrcb.xrcb115 * g_xrca.xrca131    
      #               END IF
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb133,2) RETURNING g_success,g_errno,g_xrcb.xrcb133
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb134,2) RETURNING g_success,g_errno,g_xrcb.xrcb134
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb135,2) RETURNING g_success,g_errno,g_xrcb.xrcb135                     
      #            END IF
      #
      #            #交易税明细xrcd，直接抓取对账单xrcd资料                  
      #            EXECUTE s_axrp132_xrcd_pre USING g_xrca.xrcald,g_xrca.xrcadocno,
      #                                             g_xrcb.xrcbseq,l_xrcd009,
      #                                             g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq  
      #            #190729-00018#1 add -s
      #            IF SQLCA.SQLCODE THEN
      #               INITIALIZE g_errparam TO NULL
      #               LET g_errparam.extend = 'ins xrcd_t:'
      #               LET g_errparam.code   = SQLCA.SQLCODE
      #               LET g_errparam.popup  = TRUE
      #               CALL cl_err()
      #               LET l_doc_success = FALSE
      #            END IF
      #            #190729-00018#1 add -e                                                   
      #         ELSE
      #            LET g_xrcb.xrcb101 = l_isag.isag101   #原币单价
      #            LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101 #本币单价
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_sub_success,g_errno,g_xrcb.xrcb111 
      #            CALL s_tax_ins(g_xrca.xrcadocno,g_xrcb.xrcbseq,0,g_glaa.glaacomp,
      #                           g_xrcb.xrcb101 * g_xrcb.xrcb007,g_xrcb.xrcb020,      
      #                           g_xrcb.xrcb007,g_xrcb.xrcb100,g_xrca.xrca101,g_xrca.xrcald,g_xrca.xrca121,g_xrca.xrca131)
      #               RETURNING g_xrcb.xrcb103,g_xrcb.xrcb104,g_xrcb.xrcb105, #原幣未稅/原幣稅額/原幣含稅金额
      #                         l_xrcb113,l_xrcb113,l_xrcb113,
      #                         l_xrcb113,l_xrcb113,l_xrcb113,
      #                         l_xrcb113,l_xrcb113,l_xrcb113
      #            #本幣未稅/本幣稅額/本幣含稅金额用isch-xrcb金额
      #            EXECUTE axrp132_get_ischsum_p USING g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq 
      #               INTO l_isch.isch113,l_isch.isch114,l_isch.isch115
      #            IF cl_null(l_isch.isch113) THEN LET l_isch.isch113 = 0 END IF
      #            IF cl_null(l_isch.isch114) THEN LET l_isch.isch114 = 0 END IF
      #            IF cl_null(l_isch.isch115) THEN LET l_isch.isch115 = 0 END IF
      #            EXECUTE axrp132_get_xrcbsum_p USING g_xrcb.xrcbld,g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq 
      #               INTO l_xrcb.xrcb103,l_xrcb.xrcb104,l_xrcb.xrcb105,
      #                    l_xrcb.xrcb113,l_xrcb.xrcb114,l_xrcb.xrcb115 
      #            IF cl_null(l_xrcb.xrcb113) THEN LET l_xrcb.xrcb113 = 0 END IF
      #            IF cl_null(l_xrcb.xrcb114) THEN LET l_xrcb.xrcb114 = 0 END IF
      #            IF cl_null(l_xrcb.xrcb115) THEN LET l_xrcb.xrcb115 = 0 END IF
      #            IF cl_null(l_xrcb.xrcb103) THEN LET l_xrcb.xrcb103 = 0 END IF
      #            IF cl_null(l_xrcb.xrcb104) THEN LET l_xrcb.xrcb104 = 0 END IF
      #            IF cl_null(l_xrcb.xrcb105) THEN LET l_xrcb.xrcb105 = 0 END IF                      
      #            LET g_xrcb.xrcb113 = l_isch.isch113 - l_xrcb.xrcb113
      #            LET g_xrcb.xrcb114 = l_isch.isch114 - l_xrcb.xrcb114
      #            LET g_xrcb.xrcb115 = l_isch.isch115 - l_xrcb.xrcb115
      #
      #            #最后一次立账时，倒算
      #            #此次可立账数量+xrcb已立账数量=对账单数量
      #            IF l_amountb + l_xrcb007_sum = l_isag004 THEN
      #               #判断是否有差异
      #               #原币未税金额
      #               LET l_flag = TRUE
      #               IF l_isag.isag103 <> g_xrcb.xrcb103 + l_xrcb.xrcb103 THEN 
      #                  LET l_flag = FALSE  #FALSE表示要更新xrcd金额
      #                  LET g_xrcb.xrcb103 = l_isag.isag103 - l_xrcb.xrcb103
      #               END IF
      #               #原币税额
      #               IF l_isag.isag104 <> g_xrcb.xrcb104 + l_xrcb.xrcb104 THEN
      #                  LET l_flag = FALSE                     
      #                  LET g_xrcb.xrcb104 = l_isag.isag104 - l_xrcb.xrcb104
      #               END IF 
      #               #原币含税金额
      #               IF l_isag.isag105 <> g_xrcb.xrcb105 + l_xrcb.xrcb105 THEN
      #                  LET l_flag = FALSE                     
      #                  LET g_xrcb.xrcb105 = l_isag.isag105 - l_xrcb.xrcb105
      #               END IF
      #               #本币未税金额
      #               IF l_isag.isag113 <> g_xrcb.xrcb113 + l_xrcb.xrcb113 THEN 
      #                  LET l_flag = FALSE
      #                  LET g_xrcb.xrcb113 = l_isag.isag113 - l_xrcb.xrcb113                     
      #               END IF
      #               #本币税额
      #               IF l_isag.isag114 <> g_xrcb.xrcb114 + l_xrcb.xrcb114 THEN 
      #                  LET l_flag = FALSE
      #                  LET g_xrcb.xrcb114 = l_isag.isag114 - l_xrcb.xrcb114
      #               END IF 
      #               #本币含税金额
      #               IF l_isag.isag115 <> g_xrcb.xrcb115 + l_xrcb.xrcb115 THEN
      #                  LET l_flag = FALSE                      
      #                  LET g_xrcb.xrcb115 = l_isag.isag115 - l_xrcb.xrcb115
      #               END IF                        
      #            END IF
      #            IF g_glaa.glaa015 = 'Y' THEN
      #               IF g_glaa.glaa017 = '1' THEN
      #                  LET g_xrcb.xrcb123 = g_xrcb.xrcb103 * g_xrca.xrca121  #本位币二未税金额  
      #                  LET g_xrcb.xrcb124 = g_xrcb.xrcb104 * g_xrca.xrca121  #本位币二税额
      #                  LET g_xrcb.xrcb125 = g_xrcb.xrcb105 * g_xrca.xrca121  #本位幣二含稅金額
      #               ELSE
      #                  LET g_xrcb.xrcb123 = g_xrcb.xrcb113 * g_xrca.xrca121  
      #                  LET g_xrcb.xrcb124 = g_xrcb.xrcb114 * g_xrca.xrca121
      #                  LET g_xrcb.xrcb125 = g_xrcb.xrcb115 * g_xrca.xrca121
      #               END IF
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb123,2) RETURNING g_success,g_errno,g_xrcb.xrcb123
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb124,2) RETURNING g_success,g_errno,g_xrcb.xrcb124
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb125,2) RETURNING g_success,g_errno,g_xrcb.xrcb125                     
      #            END IF
      #            IF g_glaa.glaa019 = 'Y' THEN
      #               IF g_glaa.glaa021 = '1' THEN
      #                  LET g_xrcb.xrcb133 = g_xrcb.xrcb103 * g_xrca.xrca131  #本位幣三未稅金額   
      #                  LET g_xrcb.xrcb134 = g_xrcb.xrcb104 * g_xrca.xrca131  #本位幣三税额  
      #                  LET g_xrcb.xrcb135 = g_xrcb.xrcb105 * g_xrca.xrca131  #本位幣三含税金额 
      #               ELSE
      #                  LET g_xrcb.xrcb133 = g_xrcb.xrcb113 * g_xrca.xrca131   
      #                  LET g_xrcb.xrcb134 = g_xrcb.xrcb114 * g_xrca.xrca131   
      #                  LET g_xrcb.xrcb135 = g_xrcb.xrcb115 * g_xrca.xrca131                           
      #               END IF
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb133,2) RETURNING g_success,g_errno,g_xrcb.xrcb133
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb134,2) RETURNING g_success,g_errno,g_xrcb.xrcb134   
      #               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb135,2) RETURNING g_success,g_errno,g_xrcb.xrcb135                     
      #            END IF
      #
      #            IF l_flag = FALSE THEN 
      #               UPDATE xrcd_t SET 
      #                 xrcd103 = g_xrcb.xrcb103,
      #                 xrcd104 = g_xrcb.xrcb104,
      #                 xrcd105 = g_xrcb.xrcb105,                      
      #                 xrcd113 = g_xrcb.xrcb113,
      #                 xrcd114 = g_xrcb.xrcb114,
      #                 xrcd115 = g_xrcb.xrcb115,
      #                 xrcd123 = g_xrcb.xrcb123, 
      #                 xrcd125 = g_xrcb.xrcb125,
      #                 xrcd124 = g_xrcb.xrcb124,
      #                 xrcd133 = g_xrcb.xrcb133,
      #                 xrcd135 = g_xrcb.xrcb135,
      #                 xrcd134 = g_xrcb.xrcb134                                         
      #               WHERE xrcdent = g_enterprise AND xrcddocno = g_xrca.xrcadocno AND xrcdld = g_xrcb.xrcbld 
      #                 AND xrcdseq = g_xrcb.xrcbseq
      #               IF SQLCA.sqlcode THEN
      #                  INITIALIZE g_errparam TO NULL 
      #                  LET g_errparam.extend = "update xrcd_t" 
      #                  LET g_errparam.code   = SQLCA.sqlcode 
      #                  LET g_errparam.popup  = FALSE 
      #                  CALL cl_err()
      #                  LET l_doc_success = FALSE  
      #               END IF                            
      #            END IF                   
      #         END IF
      #      ##可立账数量A>=开票数量--e-----------------------------------------------------               
      #      ELSE
      #      ##可立账数量A <开票数量--s----------------------------------------------------- 
      #         #因為考量同一對帳單號+項次,依發票立帳與依對帳立帳都採用,或是人工直接於AR立帳
      #         LET l_amountb = l_amounta
      #         LET g_xrcb.xrcb007 = l_amountb
      #         IF l_isch007_sum - l_xrcb007_sum > 0 THEN 
      #            LET g_xrcb.xrcb101 = l_isag.isag101 #原币单价
      #            LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101 #本币单价
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111
      #            CALL s_tax_ins(g_xrca.xrcadocno,g_xrcb.xrcbseq,0,g_glaa.glaacomp,
      #                           g_xrcb.xrcb101 * g_xrcb.xrcb007,g_xrcb.xrcb020,      
      #                           g_xrcb.xrcb007,g_xrcb.xrcb100,g_xrca.xrca101,g_xrca.xrcald,g_xrca.xrca121,g_xrca.xrca131)
      #               RETURNING g_xrcb.xrcb103,g_xrcb.xrcb104,g_xrcb.xrcb105, #原幣未稅/原幣稅額/原幣含稅金额
      #                         g_xrcb.xrcb113,g_xrcb.xrcb114,g_xrcb.xrcb115,
      #                         g_xrcb.xrcb123,g_xrcb.xrcb124,g_xrcb.xrcb125,
      #                         g_xrcb.xrcb133,g_xrcb.xrcb134,g_xrcb.xrcb135                  
      #         END IF 
      #      ##可立账数量A <开票数量--e-----------------------------------------------------                
      #      END IF               
      #   ELSE
      #      ###########依對帳金額立帳#################                  
      #      ##可立账数量A>=开票数量--s-----------------------------------------------------            
      #      #可立账数量A>=开票数量            
      #      IF l_amounta >= l_isch007_sum - l_xrcb007_sum THEN
      #         #l_amountb此次可立账的数量
      #         LET l_amountb = l_isch007_sum - l_xrcb007_sum 
      #         LET g_xrcb.xrcb007 = l_amountb
      #         #原幣單價/原幣未稅/原幣稅額/原幣含稅/本幣未稅/本幣稅額/本幣含稅=皆由isag_t帶入
      #         #本币单价重新计算
      #         LET g_xrcb.xrcb101 = l_isag.isag101   #原币单价
      #         LET g_xrcb.xrcb103 = l_isag.isag103   #原币未税金额
      #         LET g_xrcb.xrcb104 = l_isag.isag104   #原币税额
      #         LET g_xrcb.xrcb105 = l_isag.isag105   #原币含税金额
      #         LET g_xrcb.xrcb113 = l_isag.isag113   #本币未税金额
      #         LET g_xrcb.xrcb114 = l_isag.isag114   #本币税额
      #         LET g_xrcb.xrcb115 = l_isag.isag115   #本币含税金额
      #         LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101 #本币单价
      #         CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111
      #         IF g_glaa.glaa015 = 'Y' THEN
      #            IF g_glaa.glaa017 = '1' THEN
      #               LET g_xrcb.xrcb123 = g_xrcb.xrcb103 * g_xrca.xrca121  #本位币二未税金额  
      #               LET g_xrcb.xrcb124 = g_xrcb.xrcb104 * g_xrca.xrca121  #本位币二税额
      #               LET g_xrcb.xrcb125 = g_xrcb.xrcb105 * g_xrca.xrca121  #本位幣二含稅金額
      #            ELSE
      #               LET g_xrcb.xrcb123 = g_xrcb.xrcb113 * g_xrca.xrca121  
      #               LET g_xrcb.xrcb124 = g_xrcb.xrcb114 * g_xrca.xrca121
      #               LET g_xrcb.xrcb125 = g_xrcb.xrcb115 * g_xrca.xrca121
      #            END IF
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb123,2) RETURNING g_success,g_errno,g_xrcb.xrcb123
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb124,2) RETURNING g_success,g_errno,g_xrcb.xrcb124
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa016,g_xrcb.xrcb125,2) RETURNING g_success,g_errno,g_xrcb.xrcb125                  
      #         END IF
      #         IF g_glaa.glaa019 = 'Y' THEN
      #            IF g_glaa.glaa021 = '1' THEN
      #               LET g_xrcb.xrcb133 = g_xrcb.xrcb103 * g_xrca.xrca131  #本位幣三未稅金額   
      #               LET g_xrcb.xrcb134 = g_xrcb.xrcb104 * g_xrca.xrca131  #本位幣三税额  
      #               LET g_xrcb.xrcb135 = g_xrcb.xrcb105 * g_xrca.xrca131  #本位幣三含税金额  
      #            ELSE
      #               LET g_xrcb.xrcb133 = g_xrcb.xrcb113 * g_xrca.xrca131   
      #               LET g_xrcb.xrcb134 = g_xrcb.xrcb114 * g_xrca.xrca131   
      #               LET g_xrcb.xrcb135 = g_xrcb.xrcb115 * g_xrca.xrca131                      
      #            END IF
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb133,2) RETURNING g_success,g_errno,g_xrcb.xrcb133
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb134,2) RETURNING g_success,g_errno,g_xrcb.xrcb134
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa020,g_xrcb.xrcb135,2) RETURNING g_success,g_errno,g_xrcb.xrcb135                  
      #         END IF
      #
      #
      #         #交易税明细xrcd，直接抓取对账单xrcd资料                  
      #         EXECUTE s_axrp132_xrcd_pre USING g_xrca.xrcald,g_xrca.xrcadocno,
      #                                          g_xrcb.xrcbseq,l_xrcd009,
      #                                          g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq 
      #         #190729-00018#1 add -s
      #         IF SQLCA.SQLCODE THEN
      #            INITIALIZE g_errparam TO NULL
      #            LET g_errparam.extend = 'ins xrcd_t:'
      #            LET g_errparam.code   = SQLCA.SQLCODE
      #            LET g_errparam.popup  = TRUE
      #            CALL cl_err()
      #            LET l_doc_success = FALSE
      #         END IF
      #         #190729-00018#1 add -e                                                
      #      ##可立账数量A>=开票数量--e-----------------------------------------------------               
      #      ELSE
      #      ##可立账数量A <开票数量--s----------------------------------------------------- 
      #         #因為考量同一對帳單號+項次,依發票立帳與依對帳立帳都採用,或是人工直接於AR立帳
      #         LET l_amountb = l_amounta
      #         LET g_xrcb.xrcb007 = l_amountb
      #         IF l_isch007_sum - l_xrcb007_sum > 0 THEN 
      #            LET g_xrcb.xrcb101 = l_isag.isag101 #原币单价
      #            LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101 #本币单价
      #            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111
      #            CALL s_tax_ins(g_xrca.xrcadocno,g_xrcb.xrcbseq,0,g_glaa.glaacomp,
      #                           g_xrcb.xrcb101 * g_xrcb.xrcb007,g_xrcb.xrcb020,      
      #                           g_xrcb.xrcb007,g_xrcb.xrcb100,g_xrca.xrca101,g_xrca.xrcald,g_xrca.xrca121,g_xrca.xrca131)
      #               RETURNING g_xrcb.xrcb103,g_xrcb.xrcb104,g_xrcb.xrcb105, #原幣未稅/原幣稅額/原幣含稅金额
      #                         g_xrcb.xrcb113,g_xrcb.xrcb114,g_xrcb.xrcb115,
      #                         g_xrcb.xrcb123,g_xrcb.xrcb124,g_xrcb.xrcb125,
      #                         g_xrcb.xrcb133,g_xrcb.xrcb134,g_xrcb.xrcb135                  
      #         END IF   
      #      ##可立账数量A <开票数量--e-----------------------------------------------------      
      #      END IF
      #   END IF
      #END IF
      ##180531-00020#2 add e---
      #200527-00024#1 mark(e)      
      #IF g_isao006 <> 'Y' THEN #180531-00020#2 add #200527-00024#1 mark
         #170503-00044#1 add s---
         EXECUTE s_axrp132_xrcd_pre USING g_xrca.xrcald,g_xrca.xrcadocno,
#                                          g_xrcb.xrcbseq,l_xrcd009,  #201023-00028#5 mark
                                          g_xrcb.xrcbseq,g_end_prog,l_xrcd009,  #201023-00028#5 add
                                          g_isaf_d[li_idx].isafdocno,g_isaf_d[li_idx].isagseq
         #190729-00018#1 add -s
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'ins xrcd_t:'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
         END IF
         #190729-00018#1 add -e
         #170503-00044#1 add e---                                 
         LET g_xrcb.xrcb103 = l_isag.isag103
         LET g_xrcb.xrcb104 = l_isag.isag104
         LET g_xrcb.xrcb105 = l_isag.isag105
         LET g_xrcb.xrcb113 = l_isag.isag113
         LET g_xrcb.xrcb114 = l_isag.isag114
         LET g_xrcb.xrcb115 = l_isag.isag115
         IF g_glaa.glaa015 = 'Y' THEN
            IF g_glaa.glaa017 = '1' THEN
               LET g_xrcb.xrcb123 = g_xrcb.xrcb103 * g_xrca.xrca121
               LET g_xrcb.xrcb124 = g_xrcb.xrcb104 * g_xrca.xrca121
               LET g_xrcb.xrcb125 = g_xrcb.xrcb105 * g_xrca.xrca121
            ELSE
               LET g_xrcb.xrcb123 = g_xrcb.xrcb113 * g_xrca.xrca121
               LET g_xrcb.xrcb124 = g_xrcb.xrcb114 * g_xrca.xrca121
               LET g_xrcb.xrcb125 = g_xrcb.xrcb115 * g_xrca.xrca121
            END IF
         END IF
         IF g_glaa.glaa019 = 'Y' THEN
            IF g_glaa.glaa021 = '1' THEN
               LET g_xrcb.xrcb133 = g_xrcb.xrcb103 * g_xrca.xrca131   #170306-00026#1 mod g_xrca.xrca121 -> g_xrca.xrca131
               LET g_xrcb.xrcb134 = g_xrcb.xrcb104 * g_xrca.xrca131   #170306-00026#1 mod g_xrca.xrca121 -> g_xrca.xrca131
               LET g_xrcb.xrcb135 = g_xrcb.xrcb105 * g_xrca.xrca131   #170306-00026#1 mod g_xrca.xrca121 -> g_xrca.xrca131
            ELSE
               LET g_xrcb.xrcb133 = g_xrcb.xrcb113 * g_xrca.xrca131   #170306-00026#1 mod g_xrca.xrca121 -> g_xrca.xrca131
               LET g_xrcb.xrcb134 = g_xrcb.xrcb114 * g_xrca.xrca131   #170306-00026#1 mod g_xrca.xrca121 -> g_xrca.xrca131
               LET g_xrcb.xrcb135 = g_xrcb.xrcb115 * g_xrca.xrca131   #170306-00026#1 mod g_xrca.xrca121 -> g_xrca.xrca131
            END IF
         END IF

     #151214-00018#1 Add  ---(E)---  
      #170413-00030#2 -----s
#170503-00044#1--mark--str--      
#      UPDATE xrcd_t SET xrcd009 = (SELECT glab005 FROM glab_t  WHERE glabent = xrcdent  AND glabld = xrcdld AND glab001 = '14'
#                                      AND glab002 = '2'  AND glab003 = xrcd002)
#       WHERE xrcdent = g_enterprise
#         AND xrcddocno = g_xrca.xrcadocno
#         AND xrcdld = g_xrca.xrcald
#      #170413-00030#2 -----e
#      UPDATE xrcd_t SET xrcd009 = l_xrcd009
#       WHERE xrcd009 IS NULL
#         AND xrcdent = g_enterprise
#         AND xrcddocno = g_xrca.xrcadocno
#         AND xrcdld = g_xrca.xrcald
#      CALL s_tax_chk(g_glaa.glaacomp,g_xrcb.xrcb020)
#         RETURNING l_success,l_oodbl004,l_oodb005,l_xrca.xrca012,l_oodb011
#      IF l_oodb005 = 'Y' THEN
#170503-00044#1--mark--str--
         IF g_xrca.xrca013 = 'Y' THEN  #170503-00044#1 add
            LET g_xrcb.xrcb113 = g_xrcb.xrcb115 - g_xrcb.xrcb114
            LET g_xrcb.xrcb123 = g_xrcb.xrcb125 - g_xrcb.xrcb124
            LET g_xrcb.xrcb133 = g_xrcb.xrcb135 - g_xrcb.xrcb134
         ELSE
            LET g_xrcb.xrcb115 = g_xrcb.xrcb113 + g_xrcb.xrcb114
            LET g_xrcb.xrcb125 = g_xrcb.xrcb123 + g_xrcb.xrcb124
            LET g_xrcb.xrcb135 = g_xrcb.xrcb133 + g_xrcb.xrcb134
         END IF
      #END IF #180531-00020#2 add #200527-00024#1 mark   
      LET g_xrcb.xrcb106 = 0
      LET g_xrcb.xrcb116 = 0
      LET g_xrcb.xrcb117 = 0
      LET g_xrcb.xrcb118 = g_xrcb.xrcb113
      LET g_xrcb.xrcb119 = g_xrcb.xrcb115
      LET g_xrcb.xrcb126 = 0
      LET g_xrcb.xrcb136 = 0
      LET g_xrcb.xrcb102 = g_xrca.xrca101   #160830-00047#1 Add

#170503-00044#1--mark--str--
#      #150515-00013#3 Add  ---(S)---
#      IF g_xrca.xrca100 = g_glaa.glaa001 THEN
#         LET g_xrcb.xrcb113 = g_xrcb.xrcb103
#         LET g_xrcb.xrcb114 = g_xrcb.xrcb104
#         LET g_xrcb.xrcb115 = g_xrcb.xrcb105
#         UPDATE xrcd_t SET xrcd113 = xrcd103,
#                           xrcd114 = xrcd104,
#                           xrcd115 = xrcd105
#          WHERE xrcdent = g_enterprise
#            AND xrcddocno = g_xrca.xrcadocno
#            AND xrcdld = g_xrca.xrcald
#      END IF
#      #150515-00013#3 Add  ---(E)---
#170503-00044#1--mark--end--
      
     #160810-00015#1 Add  ---(S)---
      #判斷有無暫估
      CALL s_axrp130_estimate_chk(g_xrcb.xrcbld,g_xrca.xrcadocdt,g_xrca.xrca004,g_xrca.xrca100,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003) RETURNING l_success
      IF NOT l_success THEN      
         LET g_xrcb.xrcb023 = 'N'
      ELSE
         LET g_xrcb.xrcb023 = 'Y'
      END IF
     #160810-00015#1 Add  ---(E)---

     #161025-00017#1 add s---
     IF g_xrcb.xrcb001 = '21' OR g_xrcb.xrcb001 = '11' THEN #销退单，出货单
#170503-00044#1--mark--str--     
#        SELECT xmdk030 INTO g_xrcb.xrcb034
#          FROM xmdk_t
#         WHERE xmdkent   = g_enterprise
#           AND xmdkdocno = g_xrcb.xrcb002     
#170503-00044#1--mark--end--
#         LET g_xrcb.xrcb034 = l_xrcb034          #170503-00044#1 add  #180105-00048#1---mark
         #180105-00048#1----add----str
         IF cl_null(l_xmdk030) THEN
            LET g_xrcb.xrcb034 = ''
         ELSE
            LET g_xrcb.xrcb034 = l_xmdk030  
         END IF
         #180105-00048#1----add----end         
     END IF
     IF g_xrcb.xrcb001 = '10' THEN  #订单
        SELECT xmda023 INTO g_xrcb.xrcb034
          FROM xmda_t
         WHERE xmdaent   = g_enterprise
           AND xmdadocno = g_xrcb.xrcb002     
     END IF
     #161025-00017#1 add e---

     #LET g_xrcb.xrcb023 = 'N'   #151008-00009#8 mark   #160426-00013#1
      #180718-00016#1----s
      LET g_xrcb.xrcb053=g_xrca.xrca004
      LET g_xrcb.xrcb054=g_xrca.xrca005
      #180718-00016#1----e   
      #180705-00083#1 add -s
      #账款对象，收款对象
      #业务人员，业务部门
      IF cl_null(g_xrcb.xrcb051) THEN
         LET g_xrcb.xrcb051 = g_xrca.xrca014
      END IF
      IF cl_null(g_xrcb.xrcb010) THEN
         LET g_xrcb.xrcb010 = g_xrca.xrca015
      END IF
      #固定核算项默认值
      INITIALIZE l_xrcb2.* TO NULL
      LET l_xrcb2.xrcb053 = g_xrcb.xrcb053
      LET l_xrcb2.xrcb054 = g_xrcb.xrcb054
      LET l_xrcb2.xrcb051 = g_xrcb.xrcb051
      LET l_xrcb2.xrcb010 = g_xrcb.xrcb010
      LET l_xrcb2.xrcb011 = g_xrcb.xrcb011
      LET l_xrcb2.xrcb024 = g_xrcb.xrcb024
      LET l_xrcb2.xrcb036 = g_xrcb.xrcb036 
      LET l_xrcb2.xrcb012 = g_xrcb.xrcb012
      LET l_xrcb2.xrcb033 = g_xrcb.xrcb033
      LET l_xrcb2.xrcb034 = g_xrcb.xrcb034
      LET l_xrcb2.xrcb035 = g_xrcb.xrcb035
      LET l_xrcb2.xrcb015 = g_xrcb.xrcb015
      LET l_xrcb2.xrcb016 = g_xrcb.xrcb016
      
      CALL s_axrp133_get_accitem(g_xrcb.xrcbld,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb2.*)
         RETURNING g_xrcb.xrcb053,g_xrcb.xrcb054,g_xrcb.xrcb051,g_xrcb.xrcb010,g_xrcb.xrcb011,
                   g_xrcb.xrcb024,g_xrcb.xrcb036,g_xrcb.xrcb012,g_xrcb.xrcb033,g_xrcb.xrcb034,
                   g_xrcb.xrcb035,g_xrcb.xrcb015,g_xrcb.xrcb016
      #180705-00083#1 add -e   
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
      #190423-00042#32 add s---
      CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9025') RETURNING l_sfin9025
      IF cl_null(l_sfin9025) THEN 
         LET l_sfin9025 = 'N'
      END IF
      IF l_sfin9025 = 'Y' THEN 
         IF cl_null(g_xrcb.xrcb015) THEN LET g_xrcb.xrcb015 = l_xrcb2.xrcb015 END IF
         IF cl_null(g_xrcb.xrcb016) THEN LET g_xrcb.xrcb016 = l_xrcb2.xrcb016 END IF
      END IF
      #190423-00042#32 add e---
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
      #190423-00042#8 add_S
      IF NOT cl_null(l_isag.isag022) AND NOT cl_null(l_isag.isag023) THEN
         LET g_xrcb.xrcb015 = l_isag.isag022
         LET g_xrcb.xrcb016 = l_isag.isag023  
      END IF         
      #190423-00042#8 add_E
      #180827-00015#1 add s---
      IF g_xrcb.xrcb001 = '10' OR g_xrcb.xrcb001 = '11' OR g_xrcb.xrcb001 = '21' THEN 
         IF g_xrcb.xrcb001 = '10' THEN 
            EXECUTE sel_xmda033_1 USING g_xrcb.xrcb002 INTO g_xrcb.xrcb048
         END IF
         IF g_xrcb.xrcb001 = '11' OR g_xrcb.xrcb001 = '21' THEN              
            EXECUTE sel_xmda033_2 USING g_xrcb.xrcb002 INTO g_xrcb.xrcb048
         END IF                      
      END IF 
      #180827-00015#1 add e---
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
      
      #171005-00012#2 --s add   
      IF l_doc_success THEN
#         CALL axrp132_get_accitem(l_xrcd009)  #180705-00083#1 mark
         #180705-00083#1 add -s
         #自由核算项默认值
         INITIALIZE l_xrcb3.* TO NULL
         LET l_xrcb3.xrcb037= g_xrcb.xrcb037
         LET l_xrcb3.xrcb038= g_xrcb.xrcb038
         LET l_xrcb3.xrcb039= g_xrcb.xrcb039
         LET l_xrcb3.xrcb040= g_xrcb.xrcb040
         LET l_xrcb3.xrcb041= g_xrcb.xrcb041
         LET l_xrcb3.xrcb042= g_xrcb.xrcb042
         LET l_xrcb3.xrcb043= g_xrcb.xrcb043
         LET l_xrcb3.xrcb044= g_xrcb.xrcb044
         LET l_xrcb3.xrcb045= g_xrcb.xrcb045
         LET l_xrcb3.xrcb046= g_xrcb.xrcb046
         CALL s_axrp133_get_accitem_free(g_end_prog,g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb3.*)
         #180705-00083#1 add -e            
      END IF
      #171005-00012#2 --e add
      
     #160920-00004#1 Add  ---(S)---
#170222-00007#1--mark--str--
#      DELETE FROM xrcf_t WHERE xrcfent = g_enterprise AND xrcfdocno = g_xrcb.xrcbdocno AND xrcfld = g_xrcb.xrcbld
#      CALL s_axrp130_ins_xrcf(g_xrcb.xrcbld,g_xrcb.xrcbdocno,'','0') RETURNING l_success 
#170222-00007#1--mark--end
     #160920-00004#1 Add  ---(E)---  
     #151008-00009#8 remark--(S)
      #160426-00013#1 mark ------
      #160511-00016#1 mod--str--
      #CALL s_axrp130_ins_xrcf(g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,'Y') RETURNING g_xrcb.xrcb023
     #CALL s_axrp130_ins_xrcf(g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,'0') RETURNING l_success   #160920-00004#1 Mark
     #160810-00015#1 Mark ---(S)---
     # IF l_success THEN
     #     LET g_xrcb.xrcb023 = 'Y'
     # ELSE
     #     LET g_xrcb.xrcb023 = 'N'
     # END IF
     # #151008-00009#8--s
     # #判斷有無暫估
     # CALL s_axrp130_estimate_chk(g_xrcb.xrcbld,g_xrca.xrcadocdt,g_xrca.xrca004,g_xrca.xrca100,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003) RETURNING l_success
     # IF NOT l_success THEN      
     #    LET g_xrcb.xrcb023 = 'N'
     # END IF
     # #151008-00009#8--e
     # #160511-00016#1 mod--end--
     # UPDATE xrcb_t SET xrcb023 = g_xrcb.xrcb023
     #  WHERE xrcbent = g_enterprise
     #    AND xrcbld = g_xrcb.xrcbld
     #    AND xrcbdocno = g_xrcb.xrcbdocno
     #    AND xrcbseq = g_xrcb.xrcbseq
     #160810-00015#1 Mark ---(E)---
      #160426-00013#1 mark end---
     #151008-00009#8 remark--(E)
     #151008-00009#8 mark--(S)     
     ##160426-00013#1 add ------
     ##先判斷有無暫估，有再沖，若沖完再update
     #CALL s_axrp130_estimate_chk(g_xrcb.xrcbld,g_xrca.xrcadocdt,g_xrca.xrca004,g_xrca.xrca100,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003) RETURNING l_success
     #IF l_success THEN
     #   CALL s_axrp130_ins_xrcf(g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,'0') RETURNING l_success
     #   IF l_success THEN
     #      LET g_xrcb.xrcb023 = 'Y'
     #      UPDATE xrcb_t SET xrcb023 = g_xrcb.xrcb023
     #       WHERE xrcbent = g_enterprise
     #         AND xrcbld = g_xrcb.xrcbld
     #         AND xrcbdocno = g_xrcb.xrcbdocno
     #         AND xrcbseq = g_xrcb.xrcbseq
     #   END IF
     #END IF
     ##160426-00013#1 add end---
     #151008-00009#8 mark--(E)
      
      LET l_xrcb103 = l_xrcb103 - g_xrcb.xrcb103
      LET l_xrcb105 = l_xrcb105 - g_xrcb.xrcb105
      
      #151008-00009#8--s
      #有作沖暫估時,不處理遞延寫入;因為在立暫估的時候已經處理
      IF g_xrcb.xrcb023 = 'N' AND g_glaa.glaa139 = 'Y' THEN   #170503-00044#1 add AND g_glaa.glaa139 = 'Y'
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
      END IF
      #151008-00009#8--e
     
      
      CASE
         WHEN l_s = '1'
            #IF l_isaf.isafdocno <> l_isafdocno_t OR cl_null(l_isafdocno_t) THEN    #170503-00044#1 add   #170601-00039#1 mark lujh
            IF g_isaf_d[li_idx].isafdocno <> l_isafdocno_t OR cl_null(l_isafdocno_t) THEN    #170601-00039#1 add lujh
               #170630-00049#1-----s
               #IF g_isao006 <> 'Y' THEN #180531-00020#2 add #200527-00024#1 mark
               LET l_count = NULL
               #201023-00028#5 add -s
               IF g_master.l_isaf073 = 'Y' THEN
                  SELECT COUNT(1) INTO l_count FROM xrca_t
                   WHERE xrcaent = g_enterprise
                     AND xrcald  = g_xrca.xrcald
                     AND xrcadocno <> g_xrca.xrcadocno
                     AND xrca001 = '19'
                     AND xrca016 = '12'
                     AND xrca018 = g_isaf_d[li_idx].isafdocno
                     AND xrcastus <> 'X' 
               ELSE
               #201023-00028#5 add -e
                  SELECT COUNT(1) INTO l_count FROM xrcb_t,xrca_t
                   WHERE xrcaent = xrcbent
                     AND xrcald  = xrcbld
                     AND xrcadocno = xrcbdocno
                     AND xrcaent = g_enterprise
                     AND xrcald  = g_xrca.xrcald
                     AND xrcadocno <> g_xrca.xrcadocno
                     AND xrca001 = '17'
                     AND xrcastus <> 'X' 
                     AND xrcb049 = g_isaf_d[li_idx].isafdocno
               END IF  #201023-00028#5 add
               IF cl_null(l_count)THEN LET l_count = 0 END IF
               IF l_count > 0 THEN
                  LET l_doc_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_isaf_d[li_idx].isafdocno
                  LET g_errparam.code   = 'axr-01071'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF  
               #END IF  #180531-00020#2 add #200527-00024#1 mark               
               #170630-00049#1-----e
               #200527-00024#1 mark(s)
               ##180531-00020#2 add s---
               #IF g_isao006 <> 'Y' THEN 
               #   LET l_isaf035 = g_xrca.xrcadocno
               #ELSE
               #   LET l_isaf035 ='MULTI'
               #END IF               
               ##180531-00020#2 add e---
               #200527-00024#1 mark(s)
               LET l_isaf035 = g_xrca.xrcadocno #200527-00024#1 add 因為只會產生一筆帳款單
               #UPDATE isaf_t SET isaf035 = g_xrca.xrcadocno #180531-00020#2 mark
               UPDATE isaf_t SET isaf035 = l_isaf035        #180531-00020#2 add   
               #WHERE isafdocno=l_isaf.isafdocno              #170601-00039#1 mark lujh
               WHERE isafdocno=g_isaf_d[li_idx].isafdocno     #170601-00039#1 add lujh
                #AND isafcomp= g_xrca.xrcacomp   #160317-00018#1 Mark
                 AND isafcomp= l_isaf.isafcomp   #160317-00018#1 Add
                 AND isafent = g_enterprise
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd isaf_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF   #170503-00044#1 add      
               
            #IF NOT g_progflag = 'aisp340' THEN #150518-00046#5 add   #170301-00023#11 mark    
#            IF NOT g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add  #201023-00028#5 mark
            IF NOT g_progflag MATCHES 'aisp340*' AND g_master.l_isaf073 <> 'Y'THEN #201023-00028#5 add
#170225-00002#1--mark--str--
#               SELECT xmdl038 INTO l_xmdlnum FROM xmdl_t
#                WHERE xmdldocno = g_xrcb.xrcb002
#                  AND xmdlseq = g_xrcb.xrcb003
#                  AND xmdlent = g_enterprise
#170225-00002#1--mark--end  
               #170503-00044#1--mark--str--  
               #IF cl_null(l_xmdlnum) THEN LET l_xmdlnum=0 END IF
               #UPDATE xmdl_t SET xmdl038 = l_xmdlnum + g_xrcb.xrcb007
               #170503-00044#1--mark--end--
               UPDATE xmdl_t SET xmdl038 = COALESCE(xmdl038,0) + g_xrcb.xrcb007  #170503-00044#1 add  
                WHERE xmdldocno = g_xrcb.xrcb002
                  AND xmdlseq = g_xrcb.xrcb003
                  AND xmdlent = g_enterprise
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd xmdl_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF #150518-00046#5 add
            
         WHEN l_s = '2'
            #IF l_isaf.isafdocno <> l_isafdocno_t OR cl_null(l_isafdocno_t) THEN    #170503-00044#1 add   #170601-00039#1 mark lujh
            IF g_isaf_d[li_idx].isafdocno <> l_isafdocno_t OR cl_null(l_isafdocno_t) THEN    #170601-00039#1 add lujh
               #170630-00049#1-----s
               #IF g_isao006 <> 'Y' THEN #180531-00020#2 add #200527-00024#1 mark
               LET l_count = NULL
               #201023-00028#5 add -s
               IF g_master.l_isaf073 = 'Y' THEN
                  SELECT COUNT(1) INTO l_count FROM xrca_t
                   WHERE xrcaent = g_enterprise
                     AND xrcald  = g_xrca.xrcald
                     AND xrcadocno <> g_xrca.xrcadocno
                     AND xrca001 = '19'
                     AND xrca016 = '12'
                     AND xrca018 = g_isaf_d[li_idx].isafdocno
                     AND xrcastus <> 'X' 
               ELSE
               #201023-00028#5 add -e
                  SELECT COUNT(1) INTO l_count FROM xrcb_t,xrca_t
                   WHERE xrcaent = xrcbent
                     AND xrcald  = xrcbld
                     AND xrcadocno = xrcbdocno
                     AND xrcaent = g_enterprise
                     AND xrcald  = g_xrca.xrcald
                     AND xrcadocno <> g_xrca.xrcadocno
                     AND xrca001 = '17'
                     AND xrcastus <> 'X' 
                     AND xrcb049 = g_isaf_d[li_idx].isafdocno
               END IF  #201023-00028#5 add
               IF cl_null(l_count)THEN LET l_count = 0 END IF
               IF l_count > 0 THEN
                  LET l_doc_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_isaf_d[li_idx].isafdocno
                  LET g_errparam.code   = 'axr-01071'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF 
               #END IF #180531-00020#2 add  #200527-00024#1 mark               
               #170630-00049#1-----e
               #200527-00024#1 mark(s)
               ##180531-00020#2 add s---
               #IF g_isao006 <> 'Y' THEN 
               #   LET l_isaf048 = g_xrca.xrcadocno
               #ELSE
               #   LET l_isaf048 ='MULTI'
               #END IF               
               ##180531-00020#2 add e---
               #200527-00024#1 mark(e)
               LET l_isaf048 = g_xrca.xrcadocno #200527-00024#1 add
               #UPDATE isaf_t SET isaf048 = g_xrca.xrcadocno #180531-00020#2 mark
               UPDATE isaf_t SET isaf048 = l_isaf048        #180531-00020#2 add                
               #WHERE isafdocno=l_isaf.isafdocno              #170601-00039#1 mark lujh
               WHERE isafdocno=g_isaf_d[li_idx].isafdocno     #170601-00039#1 add lujh
                #AND isafcomp= g_xrca.xrcacomp   #160317-00018#1 Mark
                 AND isafcomp= l_isaf.isafcomp   #160317-00018#1 Add
                 AND isafent = g_enterprise
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd isaf_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF   #170503-00044#1 add              
             
            #IF NOT g_progflag = 'aisp340' THEN #150518-00046#5 add   #170301-00023#11 mark    
#            IF NOT g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add  #201023-00028#5 mark
            IF NOT g_progflag MATCHES 'aisp340*' AND g_master.l_isaf073 <> 'Y'THEN #201023-00028#5 add
#170503-00044#1--mark--str--            
#               SELECT xmdl039 INTO l_xmdlnum FROM xmdl_t
#                WHERE xmdldocno = g_xrcb.xrcb002
#                  AND xmdlseq = g_xrcb.xrcb003
#                  AND xmdlent = g_enterprise
#                  
#               IF cl_null(l_xmdlnum) THEN LET l_xmdlnum=0 END IF
#               UPDATE xmdl_t SET xmdl039 = l_xmdlnum + g_xrcb.xrcb007
#170503-00044#1--mark--end--
               UPDATE xmdl_t SET xmdl040 = COALESCE(xmdl040,0) + g_xrcb.xrcb007  #170503-00044#1 add
               WHERE xmdldocno = g_xrcb.xrcb002
                 AND xmdlseq = g_xrcb.xrcb003
                 AND xmdlent = g_enterprise
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd xmdl_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF #150518-00046#5 add
            
         WHEN l_s = '3'
            #IF l_isaf.isafdocno <> l_isafdocno_t OR cl_null(l_isafdocno_t) THEN    #170503-00044#1 add   #170601-00039#1 mark lujh
            IF g_isaf_d[li_idx].isafdocno <> l_isafdocno_t OR cl_null(l_isafdocno_t) THEN    #170601-00039#1 add lujh
               #170630-00049#1-----s
               #IF g_isao006 <> 'Y' THEN #180531-00020#2 add #200527-00024#1 mark
               LET l_count = NULL
               #201023-00028#5 add -s
               IF g_master.l_isaf073 = 'Y' THEN
                  SELECT COUNT(1) INTO l_count FROM xrca_t
                   WHERE xrcaent = g_enterprise
                     AND xrcald  = g_xrca.xrcald
                     AND xrcadocno <> g_xrca.xrcadocno
                     AND xrca001 = '19'
                     AND xrca016 = '12'
                     AND xrca018 = g_isaf_d[li_idx].isafdocno
                     AND xrcastus <> 'X' 
               ELSE
               #201023-00028#5 add -e
                  SELECT COUNT(1) INTO l_count FROM xrcb_t,xrca_t
                   WHERE xrcaent = xrcbent
                     AND xrcald  = xrcbld
                     AND xrcadocno = xrcbdocno
                     AND xrcaent = g_enterprise
                     AND xrcald  = g_xrca.xrcald
                     AND xrcadocno <> g_xrca.xrcadocno
                     AND xrca001 = '17'
                     AND xrcastus <> 'X' 
                     AND xrcb049 = g_isaf_d[li_idx].isafdocno
               END IF  #201023-00028#5 add
               IF cl_null(l_count)THEN LET l_count = 0 END IF
               IF l_count > 0 THEN
                  LET l_doc_success = FALSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_isaf_d[li_idx].isafdocno
                  LET g_errparam.code   = 'axr-01071'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               END IF    
               #END IF#180531-00020#2 add #200527-00024#1 mark                 
               #170630-00049#1-----e
               #200527-00024#1 mark(s)
               ##180531-00020#2 add s---
               #IF g_isao006 <> 'Y' THEN 
               #   LET l_isaf049 = g_xrca.xrcadocno
               #ELSE
               #   LET l_isaf049 ='MULTI'
               #END IF               
               ##180531-00020#2 add e---
               #200527-00024#1 mark(e)
               LET l_isaf049 = g_xrca.xrcadocno #200527-00024#1 add
               #UPDATE isaf_t SET isaf049 = g_xrca.xrcadocno  #180531-00020#2 mark
               UPDATE isaf_t SET isaf049 = l_isaf049         #180531-00020#2 add
               #WHERE isafdocno=l_isaf.isafdocno              #170601-00039#1 mark lujh
               WHERE isafdocno=g_isaf_d[li_idx].isafdocno     #170601-00039#1 add lujh
                #AND isafcomp= g_xrca.xrcacomp   #160317-00018#1 Mark
                 AND isafcomp= l_isaf.isafcomp   #160317-00018#1 Add
                 AND isafent = g_enterprise
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd isaf_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF   #170503-00044#1 add
            
            #IF NOT g_progflag = 'aisp340' THEN #150518-00046#5 add  #170301-00023#11 mark    
#            IF NOT g_progflag MATCHES 'aisp340*' THEN #170301-00023#11 add  #201023-00028#5 mark
            IF NOT g_progflag MATCHES 'aisp340*' AND g_master.l_isaf073 <> 'Y'THEN #201023-00028#5 add
               #170503-00044#1--mark--str--
               #SELECT xmdl040 INTO l_xmdlnum FROM xmdl_t
               # WHERE xmdldocno = g_xrcb.xrcb002
               #   AND xmdlseq = g_xrcb.xrcb003
               #   AND xmdlent = g_enterprise
               #   
               #IF cl_null(l_xmdlnum) THEN LET l_xmdlnum=0 END IF
               #UPDATE xmdl_t SET xmdl040 = l_xmdlnum + g_xrcb.xrcb007
               #170503-00044#1--mark--end--
               UPDATE xmdl_t SET xmdl040 = COALESCE(xmdl040,0) + g_xrcb.xrcb007  #170503-00044#1 add
                WHERE xmdldocno = g_xrcb.xrcb002
                  AND xmdlseq = g_xrcb.xrcb003
                  AND xmdlent = g_enterprise
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd xmdl_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF #150518-00046#5 add
      END CASE
      
      LET l_order_t = g_isaf_d[li_idx].order   #20150201#1 By zhangwei Mod l_order ---> g_isaf_d[li_idx].order
      #LET l_isafdocno_t = l_isaf.isafdocno     #170503-00044#1 add     #170601-00039#1 mark lujh
      LET l_isafdocno_t = g_isaf_d[li_idx].isafdocno    #170601-00039#1 add lujh
   END FOR   #20150201#1 BY zhangwei Mod FOREACH ---> FOR

   #因為是換成了FOREACH中單筆資料走事物,所以最後一筆的產生多帳期會寫彈頭失敗的話,需要删除已经commit的資料
   LET l_cnt = 0 
   SELECT COUNT(*) INTO l_cnt FROM xrcb_t
    WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald AND xrcbdocno = g_xrca.xrcadocno 
   IF l_cnt > 0 THEN 
      #201023-00028#5 add -s
      #货票同行时，只有税金立账，未税金额需通过其他减项方式扣除
      IF g_master.l_isaf073 = 'Y' THEN
         #项次
         LET l_xrcbseq = NULL
         SELECT MAX(xrcbseq)+1 INTO l_xrcbseq
           FROM xrcb_t
          WHERE xrcbent = g_enterprise
            AND xrcbld = g_xrca.xrcald
            AND xrcbdocno = g_xrca.xrcadocno
         #税前金额
         LET l_xrcb103 = NULL
         LET l_xrcb113 = NULL
         LET l_xrcb123 = NULL
         LET l_xrcb133 = NULL
         SELECT SUM(xrcb103*xrcb022),SUM(xrcb113*xrcb022),SUM(xrcb123*xrcb022),SUM(xrcb133*xrcb022) 
           INTO l_xrcb103,l_xrcb113,l_xrcb123,l_xrcb133
           FROM xrcb_t
          WHERE xrcbent = g_enterprise
            AND xrcbld = g_xrca.xrcald
            AND xrcbdocno = g_xrca.xrcadocno
         IF cl_null(l_xrcb103) THEN LET l_xrcb103 = 0 END IF
         IF cl_null(l_xrcb113) THEN LET l_xrcb113 = 0 END IF
         IF cl_null(l_xrcb123) THEN LET l_xrcb123 = 0 END IF
         IF cl_null(l_xrcb133) THEN LET l_xrcb133 = 0 END IF
         
         #税别-aooi610第一笔0%税别(应税+正常税率)
         LET l_oodb002 = NULL
         SELECT oodb002 INTO l_oodb002
           FROM (SELECT oodb002
                   FROM oodb_t
                  WHERE oodbent = g_enterprise
                    AND oodb001 = (SELECT ooef019 
                                     FROM ooef_t 
                                    WHERE ooefent = g_enterprise
                                      AND ooef001 = g_glaa.glaacomp)
                    AND oodb003 = 'T01' #增值税
                    AND oodb008 = '1'   #应税
                    AND oodb011 = '1'   #正常税率
                    AND oodb005 = g_xrca.xrca013  #含稅否需与单头一致
                    AND oodb006 = 0
                    AND oodbstus = 'Y'
                  ORDER BY oodb002)
          WHERE rownum = 1
         IF cl_null(l_oodb002) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = ''
            LET g_errparam.code   = 'axr-93266'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
         END IF
         #新增一笔其他减项
         LET l_sql = " INSERT INTO xrcb_t (xrcbent,xrcbld,xrcbdocno,xrcbseq,xrcbsite,xrcborga,xrcb001,xrcb002,xrcb003,xrcb004,",
                     "                     xrcb005,xrcb006,xrcb007,xrcb008,xrcb009,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,  ",
                     "                     xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,xrcb020,xrcb021,xrcb022,xrcb023,   ",
                     "                     xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,   ",
                     "                     xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,   ",
                     "                     xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,xrcb101,   ",
                     "                     xrcb102,xrcb103,xrcb104,xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,xrcb115,xrcb116,   ",
                     "                     xrcb117,xrcb118,xrcb119,xrcb121,xrcb123,xrcb124,xrcb125,xrcb126,xrcb131,xrcb133,   ",
                     "                     xrcb134,xrcb135,xrcb136,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,   ",
                     "                     xrcb059,xrcb060,xrcb107) ",
                     "              SELECT xrcbent,xrcbld,xrcbdocno,",l_xrcbseq,",xrcbsite,xrcborga,'29','','',NULL,",
                     "                     '',xrcb006,1,'',NULL,xrcblegl,xrcb010,xrcb011,xrcb012,xrcb013,  ",
                     "                     xrcb014,xrcb015,xrcb016,xrcb017,xrcb018,xrcb019,'",l_oodb002,"',xrcb021,-1,xrcb023,   ",
                     "                     xrcb024,xrcb025,xrcb026,xrcb027,xrcb028,xrcb029,xrcb030,xrcb031,xrcb032,xrcb033,   ",
                     "                     xrcb034,xrcb035,xrcb036,xrcb037,xrcb038,xrcb039,xrcb040,xrcb041,xrcb042,xrcb043,   ",
                     "                     xrcb044,xrcb045,xrcb046,xrcb047,xrcb048,xrcb049,xrcb050,xrcb051,xrcb100,",l_xrcb103,",   ",
                     "                     xrcb102,",l_xrcb103,",0,",l_xrcb103,",0,",l_xrcb113,",",l_xrcb113,",0,",l_xrcb113,",0,   ",
                     "                     0,",l_xrcb113,",",l_xrcb113,",xrcb121,",l_xrcb123,",0,",l_xrcb123,",0,xrcb131,",l_xrcb133,",   ",
                     "                     0,",l_xrcb133,",0,xrcb052,xrcb053,xrcb054,xrcb055,xrcb056,xrcb057,xrcb058,   ",
                     "                     xrcb059,xrcb060,0 ",
                     "                FROM xrcb_t ",
                     "               WHERE xrcbent = ",g_enterprise,
                     "                 AND xrcbld = '",g_xrca.xrcald,"' ",
                     "                 AND xrcbdocno = '",g_xrca.xrcadocno,"' ",
                     "                 AND xrcb001 IN ('11') ",
                     "                 AND rownum = 1 "
         PREPARE axrp132_ins_xrcb_p FROM l_sql
         EXECUTE axrp132_ins_xrcb_p 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'ins xrcb_t:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
            END IF
         #交易税
         CALL s_tax_ins(g_xrca.xrcadocno,l_xrcbseq,0,g_glaa.glaacomp,l_xrcb103,l_oodb002,1,g_xrca.xrca100,g_xrca.xrca101,g_xrca.xrcald,g_xrca.xrca121,g_xrca.xrca131)
            RETURNING l_xrcd103,l_xrcd104,l_xrcd105,l_xrcd113,l_xrcd114,l_xrcd115,
                      l_xrcd123,l_xrcd124,l_xrcd125,l_xrcd133,l_xrcd134,l_xrcd135
         UPDATE xrcd_t
            SET xrcd009 = l_xrcd009
          WHERE xrcdent = g_enterprise
            AND xrcdld = g_xrca.xrcald
            AND xrcddocno = g_xrca.xrcadocno
            AND xrcdseq = l_xrcbseq
      END IF
      #201023-00028#5 add -e
      #170225-00002#1--add--str---
      #当有冲暂估时，才产生冲暂估资料
      LET l_cnt = 0
      SELECT COUNT(1) INTO l_cnt FROM xrcb_t
       WHERE xrcbent=g_enterprise AND xrcbld=g_xrca.xrcald
         AND xrcbdocno=g_xrca.xrcadocno AND xrcb023 = 'Y'
      IF l_cnt > 0 THEN
      #170225-00002#1--add--end
         #170222-00007#1--add--str--
         DELETE FROM xrcf_t WHERE xrcfent=g_enterprise AND xrcfld=g_xrca.xrcald AND xrcfdocno=g_xrca.xrcadocno 
         #当整张应收账款单产生完，再产生冲暂估资料
         CALL s_axrp130_ins_xrcf(g_xrca.xrcald,g_xrca.xrcadocno,'','0') RETURNING l_success
         IF NOT l_success THEN
            LET l_doc_success = FALSE
         END IF
         #170222-00007#1--add--end
      END IF #170225-00002#1 add
      
      #170225-00002#1--mod--str--
      #程式优化
#      SELECT ABS(SUM(xrcb103 * xrcb022)),ABS(SUM(xrcb104 * xrcb022)),ABS(SUM(xrcb113 * xrcb022)),ABS(SUM(xrcb114 * xrcb022)),
#             ABS(SUM(xrcb123 * xrcb022)),ABS(SUM(xrcb124 * xrcb022)),ABS(SUM(xrcb133 * xrcb022)),ABS(SUM(xrcb134 * xrcb022))  
#        INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114, 
#             g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134     
#        FROM xrcb_t
#       WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald AND xrcbdocno = g_xrca.xrcadocno
      #抓取应收账款金额
      EXECUTE axrp132_sel_xrcb_pr USING g_xrca.xrcald,g_xrca.xrcadocno
                                  INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,
                                       g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134 
      #170225-00002#1--mod--end
      
      IF cl_null(g_xrca.xrca103) THEN LET g_xrca.xrca103 = 0 END IF 
      IF cl_null(g_xrca.xrca104) THEN LET g_xrca.xrca104 = 0 END IF 
      IF cl_null(g_xrca.xrca113) THEN LET g_xrca.xrca113 = 0 END IF 
      IF cl_null(g_xrca.xrca114) THEN LET g_xrca.xrca114 = 0 END IF
      IF cl_null(g_xrca.xrca123) THEN LET g_xrca.xrca123 = 0 END IF 
      IF cl_null(g_xrca.xrca124) THEN LET g_xrca.xrca124 = 0 END IF
      IF cl_null(g_xrca.xrca133) THEN LET g_xrca.xrca133 = 0 END IF 
      IF cl_null(g_xrca.xrca134) THEN LET g_xrca.xrca134 = 0 END IF
      #回寫單頭金額
      UPDATE xrca_t SET (xrca103,xrca104,xrca113,xrca114,xrca123,xrca124,xrca133,xrca134) = (g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134) 
       WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
      IF SQLCA.SQLCODE THEN
        #LET g_success = 'N'         #20150201#1 By zhangwei Mark
         LET l_doc_success = FALSE   #20150201#1 By zhangwei Add
      END IF
      #171229-00043#2--add--s--xul
      #多基准日时取用原则 
      #以单身出货单的最小或最大扣账日为基准日推算 应收款日       
      LET l_xmdk001 = ''
      LET l_ooib027 = ''
      SELECT ooib027 INTO l_ooib027 FROM ooib_t WHERE ooibent = g_enterprise AND ooib002 =  g_xrca.xrca008   #收款条件  
      IF l_ooib027 = '1' THEN     
         SELECT MIN(xmdk001) 
           INTO l_xmdk001       
           FROM xmdk_t,xrcb_t
          WHERE xmdkent = xrcbent 
            AND xmdkdocno = xrcb002
            AND xmdkent = g_enterprise
            AND xrcb001 = '11'   #出货单 
            AND xrcbld =  g_xrca.xrcald
            AND xrcbdocno = g_xrca.xrcadocno
      ELSE    
         SELECT MAX(xmdk001) 
           INTO l_xmdk001       
           FROM xmdk_t,xrcb_t
          WHERE xmdkent = xrcbent 
            AND xmdkdocno = xrcb002
            AND xmdkent = g_enterprise
            AND xrcb001 = '11'   #出货单 
            AND xrcbld =  g_xrca.xrcald
            AND xrcbdocno = g_xrca.xrcadocno
      END IF       
         
      CALL s_fin_date_ar_receivable(g_xrca.xrcasite,g_xrca.xrca004,g_xrca.xrca008,g_xrca.xrcadocdt,
           #l_isaf.isafdocdt,g_xrca.xrcadocdt,l_xmdk001) RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010  #200111-00003#1 mark
           l_isaf.isaf014,g_xrca.xrcadocdt,l_xmdk001) RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010     #200111-00003#1 add
           
      UPDATE xrca_t SET (xrca009,xrca010) = (g_xrca.xrca009,g_xrca.xrca010) 
       WHERE xrcaent = g_enterprise 
         AND xrcald = g_xrca.xrcald 
         AND xrcadocno = g_xrca.xrcadocno
      IF SQLCA.SQLCODE THEN
         LET l_doc_success = FALSE   
      END IF                      
      #171229-00043#2--add--e--xul
      #170321-00125#1 add s---
      #更新作法: xrcb001 為 10 (訂單) +
      #xrcb002 + xrcb003 對應到  isag002 + isag003
      #取得 isag011(訂單期別) 後對應到 xmdb001 為條件   
      IF (g_sfin2022 = '01' AND g_xrca.xrca016 = '10') OR (g_sfin2022 = '02' AND g_xrca.xrca016 = '12') THEN    #170406-00069#1 add  
         #IF g_xrca.xrca016 = '10' THEN #10:订金发票 #170406-00069#1 mark
            IF g_xrcb.xrcb001 = '10' THEN  #订单
               SELECT isag011 INTO l_xmdb001 FROM isag_t WHERE isagent = g_enterprise AND isagdocno = g_xrcb.xrcb049 AND isag002 = g_xrcb.xrcb002 AND isag003 = g_xrcb.xrcb003
               UPDATE xmdb_t SET xmdb007 = g_xrca.xrcadocno,
                                 xmdb008 = g_xrca.xrca113,
                                 #xmdb009 = g_xrca.xrca113+g_xrca.xrca114 #mark by 01689 #180808-00070#1
                                 xmdb009 = g_xrca.xrca103+g_xrca.xrca104 #add by 01689 #180808-00070#1
                WHERE xmdbent = g_enterprise AND xmdb001 = l_xmdb001 AND xmdbdocno = l_isag.isag002
               #190729-00018#1 add -s
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd xmdb_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
               END IF
               #190729-00018#1 add -e
            END IF
         #END IF #170406-00069#1 mark          
      END IF #170406-00069#1 add 
      
      #170321-00125#1 add e---      
      
      LET l_count = 0
      #單身如果有多筆發票則更新單頭發票號碼為'MULTI'
      SELECT COUNT(DISTINCT xrcb027||xrcb028) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise
         AND xrcbdocno = g_xrca.xrcadocno AND xrcbld = g_xrca.xrcald
      IF cl_null(l_count) THEN LET l_count = 0 END IF
      IF l_count > 1 THEN
         UPDATE xrca_t SET xrca066 = 'MULTI'
          WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
         #190729-00018#1 add -s
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd xrca_t:'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
         END IF
         #190729-00018#1 add -e
      END IF
      #如果單身資料多來源/多單據則令單頭來源類型、來源單號為空
      LET l_count = 0
      CASE
         WHEN l_s = 1
            SELECT COUNT(DISTINCT isafdocno) INTO l_count FROM isaf_t WHERE isafent = g_enterprise
               AND isaf035 = g_xrca.xrcadocno
         WHEN l_s = 2
            SELECT COUNT(DISTINCT isafdocno) INTO l_count FROM isaf_t WHERE isafent = g_enterprise
               AND isaf048 = g_xrca.xrcadocno
         WHEN l_s = 3
            SELECT COUNT(DISTINCT isafdocno) INTO l_count FROM isaf_t WHERE isafent = g_enterprise
               AND isaf049 = g_xrca.xrcadocno
      END CASE
      IF cl_null(l_count) THEN LET l_count = 0 END IF
      IF l_count > 1 THEN
         UPDATE xrca_t SET xrca018 = ''
          WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
         #190729-00018#1 add -s
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd xrca_t:'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
         END IF
         #190729-00018#1 add -e
      END IF
     #LET l_count = 0
     #SELECT COUNT(DISTINCT xrcb001) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise
     #   AND xrcbdocno = g_xrca.xrcadocno AND xrcbld = g_xrca.xrcald
     #   AND xrcb001 NOT IN ('19','29')
     #IF cl_null(l_count) THEN LET l_count = 0 END IF
     #IF l_count > 1 THEN
     #   UPDATE xrca_t SET xrca016 = ''
     #    WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
     #END IF
     #151130-00015#3 Mod  ---(S)---
     #CALL axrp132_ins_xrce()
      #LET la_param.p_style = g_master.b_style #160426-00013#1 mark
      LET la_param.p_style = g_end_prog        #160426-00013#1
      #LET la_param.p_check = g_master.b_check1,g_master.b_check2,g_master.b_check3,g_master.b_check4,g_master.b_check5,g_master.b_check6  #180529-00020#1 mark
      LET la_param.p_check = g_master.b_check1,g_master.b_check2,'N',g_master.b_check4,g_master.b_check5,g_master.b_check6  #180529-00020#1 add
      LET la_param.p_isafdocno = g_isaf_d[li_idx-1].isafdocno   #160426-00013#1
      LET ls_js = util.JSON.stringify(la_param)
      CALL s_axrp133_ins_xrce(g_xrca.xrcadocno,g_xrca.xrcald,ls_js)
     #151130-00015#3 Mod  ---(E)---
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
   END IF
   IF NOT cl_null(g_xrca.xrcadocno) THEN  #190729-00018#1 add
      #20150201#1 By zhangwei Add ---(S)---
      IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' THEN
         CALL s_pre_voucher_ins('AR','R10',g_glaa.glaald,g_xrca.xrcadocno,g_xrca.xrcadocdt,'1') RETURNING l_success
         IF NOT l_success THEN
            LET l_doc_success = FALSE
         END IF
      END IF
      #20150201#1 By zhangwei Add ---(E)---
      #200902-00059#1 add(s)
      LET l_xmdk031_cnt = 0
      SELECT COUNT(DISTINCT xmdk031) INTO l_xmdk031_cnt 
        FROM xmdk_t WHERE xmdkent = g_enterprise
         AND xmdkdocno IN (SELECT xrcb002 
                            FROM xrcb_t 
                           WHERE xrcbdocno = g_xrca.xrcadocno AND xrcbent = g_enterprise 
                             AND xrcbld = g_xrca.xrcald
                           ) 
      IF cl_null(l_xmdk031_cnt) THEN LET l_xmdk031_cnt = 0 END IF
      IF l_xmdk031_cnt = '1' THEN   
         SELECT DISTINCT xmdk031 INTO l_xmdk031 
           FROM xmdk_t WHERE xmdkent = g_enterprise
            AND xmdkdocno IN (SELECT xrcb002 
                               FROM xrcb_t 
                              WHERE xrcbdocno = g_xrca.xrcadocno AND xrcbent = g_enterprise 
                                AND xrcbld = g_xrca.xrcald
                              )             
         SELECT xrca058 INTO l_xrca058 FROM xrca_t WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
         IF l_xrca058 <> l_xmdk031 THEN
            UPDATE xrca_t SET xrca058 = l_xmdk031
             WHERE xrcaent = g_enterprise
               AND xrcald = g_xrca.xrcald
               AND xrcadocno = g_xrca.xrcadocno
         END IF
      END IF              
      #200902-00059#1 add(e)
      #151125-00006#1---add---s  执行立即审核功能
      CALL s_aooi200_fin_get_slip(g_xrca.xrcadocno) RETURNING l_slip_success,l_ooba002
      CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0031') RETURNING l_dfin0031
      
      IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN 
         #190318-00028#6   add-S
         #根据单别捞取对应的作业，azzi850检核单别所属的所有作业
         LET l_sql = ''
         LET l_oobl002 = ''
         LET l_success_1 = TRUE
         LET l_sql = " SELECT DISTINCT oobl002 ",
                     "   FROM oobl_t ",
                     "  WHERE ooblent = ",g_enterprise,
                     "    AND oobl001 = '",l_ooba002,"' "
                     
         PREPARE axrp132_sel_oobl002_pr_1 FROM l_sql
         DECLARE axrp132_sel_oobl002_cur_1 CURSOR FOR axrp132_sel_oobl002_pr_1
         FOREACH axrp132_sel_oobl002_cur_1 INTO l_oobl002
              
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
            CALL s_axrp133_immediately_conf(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_conf_success
            IF NOT l_conf_success THEN 
               LET l_doc_success = FALSE  
            END IF 
         END IF
         
         LET g_prog = 'axrp132'
         LET g_code = 'axrp132'        
         #190318-00028#6   add-E
         #190318-00028#6   mark-S
        #CALL s_axrp133_immediately_conf(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_conf_success 
        #IF NOT l_conf_success THEN 
        #   LET l_doc_success = FALSE
        #END IF 
         #190318-00028#6   mark-E
      END IF 
      #151125-00006#1---add---e
   END IF  #190729-00018#1 add
   
   #20150201#1 By zhangwei Add ---(S)---
   IF l_doc_success THEN  
  #IF l_doc_success AND ( (not cl_null(l_conf_success) AND l_conf_success) OR cl_null(l_conf_success) ) THEN    #151125-00006#1 add by aiqq
      IF cl_null(l_start_no) THEN
         LET l_start_no = g_xrca.xrcadocno
      END IF
      LET l_end_no = g_xrca.xrcadocno
      CLOSE axrp133_cl
      CALL s_transaction_end('Y',1)
   ELSE
      LET l_tot_success = FALSE
      CLOSE axrp133_cl
      CALL s_transaction_end('N',1)
   END IF
   
   #151125-00006#1---add---s  #执行立即抛砖总账传票
   CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
   CALL s_fin_get_doc_para(g_xrca.xrcald,g_xrca.xrcacomp,l_ooba002,'D-FIN-2002') RETURNING l_gl_slip
   IF l_doc_success THEN
      IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN              #180109-00024#1 add
         IF NOT cl_null(l_gl_slip) THEN 
#           IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN        #180109-00024#1 mark   
            CALL s_axrp133_immediately_gen(g_xrca.xrcald,g_xrca.xrcadocno,g_xrca.xrcasite,g_xrca.xrcadocdt,l_gl_slip)
#           END IF                                                               #180109-00024#1 mark
          ELSE
            INITIALIZE g_errparam TO NULL 
            #190729-00018#1 mark -s
#            LET g_errparam.extend = "" 
#            LET g_errparam.code   = "axr-00987"  
            #190729-00018#1 mark -e
            #190729-00018#1 add -s
            LET g_errparam.extend = l_ooba002
            LET g_errparam.code   = "axr-93242"  
            #190729-00018#1 add -e
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF
      END IF                                                                     #180109-00024#1 add
   END IF 
   #151125-00006#1---add---e
      
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
   #200710-00084#8 mark ---s 移至process
   #IF NOT cl_null(l_start_no) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'asf-00251'
   #   LET g_errparam.replace[1] = l_start_no
   #   LET g_errparam.replace[2] = l_end_no
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #END IF
   #200710-00084#8 mark ---e
   
   LET g_strno = l_start_no  #200302-00005#10 add
   LET g_endno = l_end_no    #200302-00005#10 add
   #200710-00084#8 mark ---s
   #IF l_tot_success AND NOT cl_null(l_start_no) THEN #全部資料都正確
   #   CALL cl_err_collect_show()
   #ELSE
   #   CALL cl_err_collect_show()
   #END IF
   #200710-00084#8 mark ---e
  #20150201#1 By zhangwei Add ---(E)---
   
END FUNCTION

################################################################################
# Descriptions...: sub產生的數據集轉換
# Memo...........: DSCNJ,DSCTP,DSCTC --> ('DSCNJ','DSCTP','DSCTC')
# Usage..........: CALL axrp132_get_ooef001_wc(p_wc)
#                  RETURNING r_wc
# Input parameter: p_wc           sub产生的数据集
# Return code....: r_wc           SQ可用的数据集
# Date & Author..: 2014/10/17 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_get_ooef001_wc(p_wc)
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
# Descriptions...: 產生直接沖帳資料
# Memo...........:
# Usage..........: CALL axrp132_ins_xrce()
#                  RETURNING ---
# Input parameter: 
# Return code....: 
# Date & Author..: 2014/10/17 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_ins_xrce()
 # DEFINE l_count             LIKE type_t.num5
 # DEFINE l_seq               LIKE type_t.num5
 # DEFINE l_xrccdocno         LIKE xrcc_t.xrccdocno
 # DEFINE l_xrccseq           LIKE xrcc_t.xrccseq
 # DEFINE l_xrcc001           LIKE xrcc_t.xrcc001
 # DEFINE l_xrca060           LIKE xrca_t.xrca060
 # DEFINE l_xrca103           LIKE xrca_t.xrca103
 # DEFINE l_xrca113           LIKE xrca_t.xrca113
 # DEFINE l_xrca              RECORD LIKE xrca_t.*
 # DEFINE l_xrcb              RECORD LIKE xrcb_t.*
 # DEFINE l_xrcc              RECORD LIKE xrcc_t.*
 # DEFINE l_xrce              RECORD LIKE xrce_t.*
 # DEFINE l_sql               STRING
 # DEFINE ls_wc               STRING
 # DEFINE l_wc1               STRING
 # DEFINE l_ooef014           LIKE ooef_t.ooef014
 # DEFINE l_ooaj004           LIKE ooaj_t.ooaj004
 # DEFINE l_xrca100           LIKE xrca_t.xrca100
 # DEFINE l_success           LIKE type_t.num5
 # DEFINE l_errno             LIKE type_t.chr10
 # #150316-00013#1 By 01727 Add  ---(S)---
 # DEFINE l_glaacomp          LIKE glaa_t.glaacomp
 # DEFINE l_sfin1002          LIKE type_t.chr1
 # DEFINE l_xrce109           LIKE xrce_t.xrce109
 # DEFINE l_xrce119           LIKE xrce_t.xrce119
 # DEFINE l_xrce129           LIKE xrce_t.xrce129
 # DEFINE l_xrce139           LIKE xrce_t.xrce139
 # #150316-00013#1 By 01727 Add  ---(E)---
 #    
 # #151130-00015#3 Mark  ---(S)---
 # #函數作廢,改用CALL s_axrp133_ins_xrce(p_xrcadocno,p_xrcald,ls_js)
 # #151130-00015#3 Mark  ---(E)---
 #
 # SELECT ooef014 INTO l_ooef014 FROM ooef_t
 #  WHERE ooefent = g_enterprise AND ooef001 = g_glaa.glaacomp
 #    
 # #1.取基础币种的金额精度--若有传入p_amount时,返回的是金额,非汇率
 # CALL s_curr_sel_ooaj004(l_ooef014,g_glaa.glaa001)
 #      RETURNING l_ooaj004
 #
 # #STEP1:若發票單身有"27:其他待抵單"則先沖銷其他待抵單
 # #STEP2:依據"自動沖銷"的勾選項,彙整待抵單
 #
 # #勾選訂金待抵:自動沖同一帳款客戶,同一收款客戶 帳款單性質=21 之訂金待抵
 # #勾選銷退待抵:自動沖同一帳款客戶,同一收款客戶 帳款單性質=22 之銷退待抵
 # #勾選預收待抵:自動沖同一帳款客戶,同一收款客戶 帳款單性質=23 之预收待抵
 # #勾選其他待抵:自動沖同一帳款客戶,同一收款客戶 帳款單性質=29 之其他扣抵
 # #勾選溢收待抵:自動沖同一帳款客戶,同一收款客戶 帳款單性質=24 之溢收待抵
 # #勾選押金待抵:自動沖同一帳款客戶,同一收款客戶 帳款單性質=25 之押金待抵
 #
 # IF g_master.b_style = 'axrt340' THEN RETURN END IF
 #
 # #150316-00013#1 By 01727 Add  ---(S)---
 # SELECT glaacomp INTO l_glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_master.xrcald
 # CALL cl_get_para(g_enterprise,l_glaacomp,'S-FIN-1002') RETURNING l_sfin1002
 # #150316-00013#1 By 01727 Add  ---(E)---
 #
 # LET ls_wc = " xrca004 = '",g_xrca.xrca004,"' AND xrca005 = '",g_xrca.xrca005,"' "
 # LET l_count = 0
 # IF g_master.b_check1 = 'Y' THEN
 #    IF NOT cl_null(l_wc1) THEN LET l_wc1 = l_wc1,"','" END IF
 #    LET l_wc1 = l_wc1,"21"
 # ELSE
 #    LET l_count = l_count + 1
 # END IF
 #
 # IF g_master.b_check2 = 'Y' THEN
 #    IF NOT cl_null(l_wc1) THEN LET l_wc1 = l_wc1,"','" END IF
 #    LET l_wc1 = l_wc1,"22"
 # ELSE
 #    LET l_count = l_count + 1
 # END IF
 # IF g_master.b_check3 = 'Y' THEN
 #    IF NOT cl_null(l_wc1) THEN LET l_wc1 = l_wc1,"','" END IF
 #    LET l_wc1 = l_wc1,"23"
 # ELSE
 #    LET l_count = l_count + 1
 # END IF
 # IF g_master.b_check4 = 'Y' THEN
 #    IF NOT cl_null(l_wc1) THEN LET l_wc1 = l_wc1,"','" END IF
 #    LET l_wc1 = l_wc1,"29"
 # ELSE
 #    LET l_count = l_count + 1
 # END IF
 # IF g_master.b_check5 = 'Y' THEN
 #    IF NOT cl_null(l_wc1) THEN LET l_wc1 = l_wc1,"','" END IF
 #    LET l_wc1 = l_wc1,"24"
 # ELSE
 #    LET l_count = l_count + 1
 # END IF
 # IF g_master.b_check6 = 'Y' THEN
 #    IF NOT cl_null(l_wc1) THEN LET l_wc1 = l_wc1,"','" END IF
 #    LET l_wc1 = l_wc1,"25"
 # ELSE
 #    LET l_count = l_count + 1
 # END IF
 # IF l_count < 6 THEN LET ls_wc = ls_wc," AND xrca001 IN ('",l_wc1,"')" ELSE RETURN END IF
 #
 # LET l_sql = "(SELECT xrccdocno,xrccseq,xrcc001,1 flag,xrcadocdt,CASE WHEN xrca100 = '",g_xrca.xrca100,"' THEN 1 ELSE 2 END flag1 FROM xrcc_t,xrca_t       ",
 #             " WHERE xrccld = '",g_master.xrcald,"'                                               ",
 #             "   AND xrcc108 - xrcc109 > 0                                                        ",
 #             "   AND xrccent = xrcaent AND xrccdocno = xrcadocno AND xrccld = xrcald              ",
 #             "   AND EXISTS (SELECT 1 FROM isag_t WHERE isagent = '",g_enterprise,"'              ",
 #             "                  AND isag001 = '26' AND isagcomp = '",g_xrca.xrcacomp,"'           ",
 #             "                  AND isag002 = xrccdocno AND isag003 = xrccseq                     ",
 #             "                  AND isagdocno IN ( SELECT DISTINCT xrcb002 FROM xrcb_t            ",
 #             "                                      WHERE xrcbent = '",g_enterprise,"'            ",
 #             "                                        AND xrcbdocno = '",g_xrca.xrcadocno,"'      ",
 #             "                                        AND xrcbld = '",g_xrca.xrcald,"'          ))"
 #
 # LET l_sql = l_sql," UNION "
 #
 # LET l_sql = l_sql,"SELECT xrccdocno,xrccseq,xrcc001,2 flag,xrcadocdt,CASE WHEN xrca100 = '",g_xrca.xrca100,"' THEN 1 ELSE 2 END flag1 FROM xrcc_t,xrca_t  ",
 #             " WHERE xrccent = xrcaent AND xrccdocno = xrcadocno AND xrccld = xrcald              ",
 #             "   AND xrccld = '",g_master.xrcald,"'                                               ",
 #             "   AND xrcc108 - xrcc109 > 0                                                        ",
 #             "   AND xrcadocdt <= '",g_master.xrcadocdt,"'                                        ",
 #             "   AND ",ls_wc,") ORDER BY flag ASC,flag1 ASC,xrcadocdt"
 # PREPARE axrp132_xrce_prep FROM l_sql
 # DECLARE axrp132_xrce_curs CURSOR FOR axrp132_xrce_prep
 #
 # LET l_xrce.xrceseq = 0
 # LET l_xrca103 = g_xrca.xrca103 + g_xrca.xrca104
 # LET l_xrca113 = g_xrca.xrca113 + g_xrca.xrca114
 #
 # FOREACH axrp132_xrce_curs INTO l_xrccdocno,l_xrccseq,l_xrcc001
 #    IF l_xrca103 = 0 THEN EXIT FOREACH END IF
 #    SELECT * INTO l_xrca.* FROM xrca_t WHERE xrcaent = g_enterprise
 #       AND xrcadocno = l_xrccdocno AND xrcald = g_master.xrcald
 #    SELECT * INTO l_xrcb.* FROM xrcb_t WHERE xrcbent = g_enterprise
 #       AND xrcbdocno = l_xrccdocno AND xrcbseq = l_xrccseq AND xrcbld = g_master.xrcald
 #    SELECT * INTO l_xrcc.* FROM xrcc_t WHERE xrccent = g_enterprise
 #       AND xrccdocno = l_xrccdocno AND xrccseq = l_xrccseq AND xrcc001 = l_xrcc001 AND xrccld = g_master.xrcald
 #
 #    #150316-00013#1 By 01727 Add  ---(S)---
 #    #待抵單的可用餘額=xrcc108 - xrcc109 - 已沖帳但未確認金額
 #    #即等同於 xrcc108 - SUM(xrce109)
 #    LET l_xrce109 = 0    LET l_xrce119 = 0   LET l_xrce129 = 0   LET l_xrce139 = 0
 #    IF l_sfin1002 = '1' THEN
 #       SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139)
 #         INTO l_xrce109,l_xrce119,l_xrce129,l_xrce139
 #         FROM xrce_t
 #        WHERE xrceent = g_enterprise       AND xrceld  = g_master.xrcald
 #          AND xrce003 = l_xrcc.xrccdocno   AND xrce004 = l_xrcc.xrccseq
 #    ELSE
 #       SELECT SUM(xrce109),SUM(xrce119),SUM(xrce129),SUM(xrce139)
 #         INTO l_xrce109,l_xrce119,l_xrce129,l_xrce139
 #         FROM xrce_t
 #        WHERE xrceent = g_enterprise       AND xrceld  = g_master.xrcald
 #          AND xrce003 = l_xrcc.xrccdocno   AND xrce004 = l_xrcc.xrccseq
 #          AND xrce005 = l_xrcc.xrcc001
 #    END IF
 #    IF cl_null(l_xrce109) THEN LET l_xrce109 = 0 END IF
 #    IF cl_null(l_xrce119) THEN LET l_xrce119 = 0 END IF
 #    IF cl_null(l_xrce129) THEN LET l_xrce129 = 0 END IF
 #    IF cl_null(l_xrce139) THEN LET l_xrce139 = 0 END IF
 #    LET l_xrcc.xrcc109 = l_xrce109
 #    LET l_xrcc.xrcc119 = l_xrce119
 #    LET l_xrcc.xrcc129 = l_xrce129
 #    LET l_xrcc.xrcc139 = l_xrce139
 #    #150615-00017#2 Add  ---(S)---
 #    IF l_xrcc.xrcc108 - l_xrcc.xrcc109 = 0 THEN
 #       CONTINUE FOREACH
 #    END IF
 #    #150615-00017#2 Add  ---(E)---
 #    #150316-00013#1 By 01727 Add  ---(E)---
 #    LET l_xrce.xrceent = g_enterprise
 #    LET l_xrce.xrcecomp= g_glaa.glaacomp
 #    LET l_xrce.xrceld  = g_master.xrcald
 #    LET l_xrce.xrcedocno=g_xrca.xrcadocno
 #    LET l_xrce.xrceseq = l_xrce.xrceseq + 1
 #    LET l_xrce.xrcelegl= l_xrcc.xrcclegl
 #    LET l_xrce.xrcesite= l_xrcc.xrccsite
 #    LET l_xrce.xrceorga= l_xrcc.xrcclegl
 #    LET l_xrce.xrce001 = 'axrt340'
 #    LET l_xrce.xrce002 = '31'
 #    LET l_xrce.xrce003 = l_xrcc.xrccdocno
 #    LET l_xrce.xrce004 = l_xrccseq
 #    LET l_xrce.xrce005 = l_xrcc.xrcc001
 #    LET l_xrce.xrce006 = ''
 #    LET l_xrce.xrce008 = l_xrcc.xrccdocno
 #    LET l_xrce.xrce009 = ''
 #    LET l_xrce.xrce010 = ''
 #    LET l_xrce.xrce011 = ''
 #    LET l_xrce.xrce012 = ''
 #    LET l_xrce.xrce013 = ''
 #    LET l_xrce.xrce014 = ''
 #    LET l_xrce.xrce015 = 'D'
 #    LET l_xrce.xrce016 = l_xrca.xrca035
 #    LET l_xrce.xrce017 = l_xrca.xrca014
 #    LET l_xrce.xrce018 = l_xrcb.xrcb010
 #    LET l_xrce.xrce019 = l_xrcb.xrcb011
 #    LET l_xrce.xrce020 = l_xrcb.xrcb012
 #    LET l_xrce.xrce021 = l_xrcb.xrcb017
 #    LET l_xrce.xrce022 = l_xrcb.xrcb015
 #    LET l_xrce.xrce023 = l_xrcb.xrcb016
 #    LET l_xrce.xrce024 = l_xrcb.xrcb002
 #    LET l_xrce.xrce025 = l_xrcb.xrcb003
 #    LET l_xrce.xrce026 = ''
 #   #150316-00013#1 By 01727 Mark ---(S)---
 #   #SELECT xrca060 INTO l_xrca060 FROM xrca_t
 #   # WHERE xrcald = g_master.xrcald
 #   #   AND xrca019 = l_xrce.xrce003
 #   #150316-00013#1 By 01727 Mark ---(S)---
 #   #150316-00013#1 By 01727 Add  ---(S)---
 #    SELECT xrca060 INTO l_xrca060 FROM xrca_t
 #     WHERE xrcald = g_master.xrcald
 #       AND xrcadocno = l_xrce.xrce003
 #       AND xrcaent = g_enterprise
 #   #150316-00013#1 By 01727 Add  ---(S)---
 #    IF l_xrca060 = '2' THEN
 #       LET l_xrce.xrce027 = 'Y'
 #    ELSE
 #       LET l_xrce.xrce027 = 'N'
 #    END IF
 #    LET l_xrce.xrce028 = ''
 #    LET l_xrce.xrce029 = ''
 #    LET l_xrce.xrce030 = ''
 #    LET l_xrce.xrce035 = ''
 #    LET l_xrce.xrce036 = ''
 #    LET l_xrce.xrce037 = ''
 #    LET l_xrce.xrce038 = ''
 #    LET l_xrce.xrce104 = 0
 #    LET l_xrce.xrce114 = 0
 #    LET l_xrce.xrce124 = 0
 #    LET l_xrce.xrce134 = 0
 #    LET l_xrce.xrce100 = l_xrcc.xrcc100
 #    LET l_xrce.xrce101 = l_xrcc.xrcc102
 #    LET l_xrce.xrce120 = l_xrcc.xrcc120
 #    LET l_xrce.xrce121 = l_xrcc.xrcc122
 #    LET l_xrce.xrce130 = l_xrcc.xrcc130
 #    LET l_xrce.xrce131 = l_xrcc.xrcc132
 #
 #    IF g_xrca.xrca100 = l_xrca.xrca100 THEN
 #       IF l_xrca103 > l_xrcc.xrcc108 - l_xrcc.xrcc109 THEN
 #          LET l_xrce.xrce007 = l_xrcc.xrcc108 - l_xrcc.xrcc109
 #          LET l_xrce.xrce109 = l_xrcc.xrcc108 - l_xrcc.xrcc109
 #          LET l_xrce.xrce119 = l_xrcc.xrcc118 - l_xrcc.xrcc119
 #          LET l_xrce.xrce129 = l_xrcc.xrcc128 - l_xrcc.xrcc129
 #          LET l_xrce.xrce139 = l_xrcc.xrcc138 - l_xrcc.xrcc139
 #          LET l_xrca103 = l_xrca103 - l_xrcc.xrcc108 - l_xrcc.xrcc109
 #          LET l_xrca113 = l_xrca113 - l_xrcc.xrcc118 - l_xrcc.xrcc119
 #       ELSE
 #          LET l_xrce.xrce007 = l_xrca103
 #          LET l_xrce.xrce109 = l_xrca103
 #          LET l_xrce.xrce119 = l_xrca103 * l_xrcc.xrcc101
 #          LET l_xrce.xrce129 = l_xrca103 * l_xrcc.xrcc121
 #          LET l_xrce.xrce139 = l_xrca103 * l_xrcc.xrcc131
 #          LET l_xrca103 = 0
 #          LET l_xrca113 = l_xrca113 - l_xrca103 * l_xrcc.xrcc101
 #          IF l_xrca113 < 0 THEN LET l_xrca113 = 0 END IF
 #       END IF
 #    ELSE
 #       IF l_xrca113 > l_xrcc.xrcc118 - l_xrcc.xrcc119 THEN
 #          LET l_xrce.xrce007 = l_xrcc.xrcc108 - l_xrcc.xrcc109
 #          LET l_xrce.xrce109 = l_xrcc.xrcc108 - l_xrcc.xrcc109
 #          LET l_xrce.xrce119 = l_xrcc.xrcc118 - l_xrcc.xrcc119
 #          LET l_xrce.xrce129 = l_xrcc.xrcc128 - l_xrcc.xrcc129
 #          LET l_xrce.xrce139 = l_xrcc.xrcc138 - l_xrcc.xrcc139
 #          LET l_xrca113 = l_xrca113 - l_xrcc.xrcc118 - l_xrcc.xrcc119
 #          LET l_xrca103 = l_xrca113 / g_xrca.xrca101
 #       ELSE
 #          LET l_xrce.xrce007 = l_xrca113 / l_xrcc.xrcc101
 #          LET l_xrce.xrce007 = s_num_round('1',l_xrce.xrce007,l_ooaj004)
 #          LET l_xrce.xrce109 = l_xrce.xrce007
 #          LET l_xrce.xrce119 = l_xrca113
 #          LET l_xrce.xrce129 = l_xrce.xrce109 * l_xrcc.xrcc121
 #          LET l_xrce.xrce139 = l_xrce.xrce109 * l_xrcc.xrcc131
 #          LET l_xrca113 = 0
 #          LET l_xrca103 = 0
 #       END IF
 #    END IF
 #
 #    INSERT INTO xrce_t VALUES (l_xrce.*)
 #    IF SQLCA.sqlcode THEN
 #       LET g_success = 'N' RETURN
 #    END IF
 #
 # END FOREACH
 #
 # LET l_xrce.xrce109 = 0
 # LET l_xrce.xrce119 = 0
 # LET l_xrce.xrce129 = 0
 # LET l_xrce.xrce139 = 0
 #
 ##150316-00013#1 By 01727 Mark ---(S)---
 ##SELECT SUM(xrce119 * CASE WHEN xrce015 = 'D' THEN 1 ELSE -1 END)
 ##  INTO l_xrce.xrce119 FROM xrce_t WHERE xrceent = g_enterprise
 ##   AND xrcedocno = g_xrca.xrcadocno AND xrceld = g_xrca.xrcald
 ##IF cl_null(l_xrce.xrce119) THEN LET l_xrce.xrce119 = 0 END IF
 ##CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,l_xrce.xrce119 / g_xrca.xrca101,2)
 ##   RETURNING l_success,l_errno,l_xrce.xrce109
 ##
 ##IF g_glaa.glaa015 = 'Y' THEN
 ##   IF g_glaa.glaa017 = '1' THEN
 ##      LET l_xrce.xrce129 = l_xrce.xrce109 * g_xrca.xrca121
 ##   ELSE
 ##      LET l_xrce.xrce129 = l_xrce.xrce119 * g_xrca.xrca121
 ##   END IF
 ##END IF
 ##IF g_glaa.glaa019 = 'Y' THEN
 ##   IF g_glaa.glaa021 = '1' THEN
 ##      LET l_xrce.xrce139 = l_xrce.xrce109 * g_xrca.xrca131
 ##   ELSE
 ##      LET l_xrce.xrce139 = l_xrce.xrce119 * g_xrca.xrca131
 ##   END IF
 ##END IF
 ##UPDATE xrca_t SET xrca107 = l_xrce.xrce109,
 ##                  xrca117 = l_xrce.xrce119,
 ##                  xrca127 = l_xrce.xrce129,
 ##                  xrca137 = l_xrce.xrce139
 ## WHERE xrcaent = g_enterprise
 ##   AND xrcadocno = g_xrca.xrcadocno
 ##   AND xrcald = g_xrca.xrcald
 ##150316-00013#1 By 01727 Mark ---(E)---
 ##150316-00013#1 By 01727 Add  ---(S)---
 ##非應稅折抵存入xrca107
 # SELECT SUM(xrce119 * CASE WHEN xrce015 = 'D' THEN 1 ELSE -1 END)
 #   INTO l_xrce.xrce119 FROM xrce_t WHERE xrceent = g_enterprise
 #    AND xrcedocno = g_xrca.xrcadocno AND xrceld = g_xrca.xrcald
 #    AND xrce027 = 'N'
 # IF cl_null(l_xrce.xrce119) THEN LET l_xrce.xrce119 = 0 END IF
 # CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,l_xrce.xrce119 / g_xrca.xrca101,2)
 #    RETURNING l_success,l_errno,l_xrce.xrce109
 # 
 # IF g_glaa.glaa015 = 'Y' THEN
 #    IF g_glaa.glaa017 = '1' THEN
 #       LET l_xrce.xrce129 = l_xrce.xrce109 * g_xrca.xrca121
 #    ELSE
 #       LET l_xrce.xrce129 = l_xrce.xrce119 * g_xrca.xrca121
 #    END IF
 # END IF
 # IF g_glaa.glaa019 = 'Y' THEN
 #    IF g_glaa.glaa021 = '1' THEN
 #       LET l_xrce.xrce139 = l_xrce.xrce109 * g_xrca.xrca131
 #    ELSE
 #       LET l_xrce.xrce139 = l_xrce.xrce119 * g_xrca.xrca131
 #    END IF
 # END IF
 # UPDATE xrca_t SET xrca107 = l_xrce.xrce109,
 #                   xrca117 = l_xrce.xrce119,
 #                   xrca127 = l_xrce.xrce129,
 #                   xrca137 = l_xrce.xrce139
 #  WHERE xrcaent = g_enterprise
 #    AND xrcadocno = g_xrca.xrcadocno
 #    AND xrcald = g_xrca.xrcald
 ##應稅折抵存入xrca106
 # LET l_xrce.xrce109 = 0
 # LET l_xrce.xrce119 = 0
 # LET l_xrce.xrce129 = 0
 # LET l_xrce.xrce139 = 0
 # SELECT SUM(xrce119 * CASE WHEN xrce015 = 'D' THEN 1 ELSE -1 END)
 #   INTO l_xrce.xrce119 FROM xrce_t WHERE xrceent = g_enterprise
 #    AND xrcedocno = g_xrca.xrcadocno AND xrceld = g_xrca.xrcald
 #    AND xrce027 = 'Y'
 # IF cl_null(l_xrce.xrce119) THEN LET l_xrce.xrce119 = 0 END IF
 # CALL s_curr_round_ld('1',g_xrca.xrcald,g_xrca.xrca100,l_xrce.xrce119 / g_xrca.xrca101,2)
 #    RETURNING l_success,l_errno,l_xrce.xrce109
 # 
 # IF g_glaa.glaa015 = 'Y' THEN
 #    IF g_glaa.glaa017 = '1' THEN
 #       LET l_xrce.xrce129 = l_xrce.xrce109 * g_xrca.xrca121
 #    ELSE
 #       LET l_xrce.xrce129 = l_xrce.xrce119 * g_xrca.xrca121
 #    END IF
 # END IF
 # IF g_glaa.glaa019 = 'Y' THEN
 #    IF g_glaa.glaa021 = '1' THEN
 #       LET l_xrce.xrce139 = l_xrce.xrce109 * g_xrca.xrca131
 #    ELSE
 #       LET l_xrce.xrce139 = l_xrce.xrce119 * g_xrca.xrca131
 #    END IF
 # END IF
 # UPDATE xrca_t SET xrca106 = l_xrce.xrce109,
 #                   xrca116 = l_xrce.xrce119,
 #                   xrca126 = l_xrce.xrce129,
 #                   xrca136 = l_xrce.xrce139
 #  WHERE xrcaent = g_enterprise
 #    AND xrcadocno = g_xrca.xrcadocno
 #    AND xrcald = g_xrca.xrcald
 ##150316-00013#1 By 01727 Add  ---(E)---
 #
END FUNCTION
################################################################################
# Descriptions...: 依據客戶編號獲取默認值
# Memo...........:
# Usage..........: CALL axrp132_xrca004_ref()
#                  RETURNING r_xrca.*
# Input parameter: 
# Return code....: r_xrca         返回默认值
# Date & Author..: 2014/10/17 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_xrca004_ref(p_isaf100)
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
DEFINE p_isaf100     LIKE isaf_t.isaf100
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
         
   #170503-00044#1--add--str--   
   #SELECT DISTINCT ooag004 INTO l_site
   #  FROM ooag_t
   # WHERE ooag001 = g_user AND ooagstus ='Y' 
   #   AND ooagent = g_enterprise #160905-00007#3 add
   #170503-00044#1--add--str--   
      
   #170503-00044#1--add--str--   
   SELECT pmab087,pmab105,pmab081,pmab084,pmab083,pmab089,pmab090 
     INTO r_xrca.xrca008,r_xrca.xrca007,r_xrca.xrca014,
          r_xrca.xrca011,l_pmab085,r_xrca.xrca058,r_xrca.xrca006     
     FROM pmab_t
    WHERE pmabent = g_enterprise 
      AND pmabsite = l_xrcacomp 
      AND pmab001 = g_xrca.xrca004  
   #170503-00044#1--add--end--       
   
   #STEP1.獲取交易對象簡稱

#170503-00044#1--mark--str--
#   #STEP2.帶出主要應收條件
#   SELECT pmab087 INTO r_xrca.xrca008 FROM pmab_t
#    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp
#
#   #STEP3.帳款類別
#   SELECT pmab105 INTO r_xrca.xrca007 FROM pmab_t
#    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp
#   
#   #STEP4.業務人員/業務部門
#   SELECT pmab081 INTO r_xrca.xrca014 FROM pmab_t
#    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp
#170503-00044#1--mark--end--   
   SELECT ooag003 INTO r_xrca.xrca015 FROM ooag_t
    WHERE ooagent = g_enterprise AND ooag001 = r_xrca.xrca014

#170503-00044#1--mark--str--    
#   #STEP5.稅別/含稅否/稅率
#   SELECT pmab084 INTO r_xrca.xrca011 FROM pmab_t
#    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp  
#   IF NOT cl_null(r_xrca.xrca011) THEN
#      CALL s_tax_chk(g_glaa.glaacomp,r_xrca.xrca011)
#         RETURNING l_success,l_oodbl004,r_xrca.xrca013,r_xrca.xrca012,l_oodb011
#   END IF
#170503-00044#1--mark--end-- 

   #STEP6.慣用幣別/匯率
   LET r_xrca.xrca100 = p_isaf100
  #LET r_xrca.xrca100 = g_glaa.glaa001
   #計算各個本位筆匯率
   
  #CALL s_axrt300_get_exrate(g_xrca.xrcadocdt,g_xrca.xrcald,g_xrca.xrcacomp,r_xrca.xrca100)
  #   RETURNING l_success,r_xrca.xrca101,r_xrca.xrca121,r_xrca.xrca131
   #150518-00044#5--(S)
   LET lc_param.apca004 = g_xrca.xrca004
   #LET lc_param.sfin2009 = g_master.b_comb1     #汇率基准   #151012-00014#1 add lujh #170313-00054#1 mark
   LET ls_js = util.JSON.stringify(lc_param)
   #150518-00044#5--(E)
   CALL s_fin_get_curr_rate(g_xrca.xrcacomp,g_xrca.xrcald,g_xrca.xrcadocdt,r_xrca.xrca100,ls_js)    #150518-00044#5
      RETURNING r_xrca.xrca101,r_xrca.xrca121,r_xrca.xrca131
#170503-00044#1--mark--str--
#   #STEP7.預開發票日
#   SELECT pmab083 INTO l_pmab085 FROM pmab_t
#    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# g_xrca.xrcacomp--->l_xrcacomp
#170503-00044#1--mark--end--

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
   SELECT pmaa047,pmaa090 INTO r_xrca.xrca046,r_xrca.xrca006 FROM pmaa_t#191227-00043#1 add
    WHERE pmaaent = g_enterprise AND pmaa001 = g_xrca.xrca004    
    
#170503-00044#1--mark--str--
#   #SETP10.慣用銷售分類取
#   SELECT pmab089 INTO r_xrca.xrca058 FROM pmab_t
#    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004 #160505-00005#1# l_site--->l_xrcacomp
#   
#   #SETP11.客戶分類
#   SELECT pmab090 INTO r_xrca.xrca006 FROM pmab_t
#    WHERE pmabent = g_enterprise AND pmabsite = l_xrcacomp AND pmab001 = g_xrca.xrca004    #160505-00005#1# l_site--->l_xrcacomp
#170503-00044#1--mark--end--
   RETURN r_xrca.*

END FUNCTION

################################################################################
# Descriptions...: 取得默認會計科目
# Memo...........:
# Usage..........: CALL axrp131_get_glab(p_glabld,p_glab001,p_glab002,p_glab003)
#                  RETURNING r_glab005
# Input parameter: p_glabld       帳套
#                : p_glab001      設定類型
#                : p_glab002      分類碼
#                : p_glab003      分類碼值
# Return code....: r_glab005      會計科目
# Date & Author..: 2014/10/17 By zhangweib
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp131_get_glab(p_glabld,p_glab001,p_glab002,p_glab003)
   DEFINE p_glabld         LIKE glab_t.glabld
   DEFINE p_glab001        LIKE glab_t.glab001
   DEFINE p_glab002        LIKE glab_t.glab002
   DEFINE p_glab003        LIKE glab_t.glab003
   
   DEFINE r_glab005        LIKE glab_t.glab005

   SELECT glab005 INTO r_glab005 FROM glab_t
    WHERE glabent = g_enterprise AND glabld = p_glabld AND glab001 = p_glab001 AND glab002 = p_glab002 AND glab003 = p_glab003

   RETURN r_glab005

END FUNCTION

################################################################################
# Descriptions...: 取得自由核算項設定
# Memo...........: #171005-00012#2
# Usage..........: CALL axrp132_get_accitem(p_xrcd009)
# Date & Author..: 171006 By 06821
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_get_accitem(p_xrcd009)
DEFINE p_xrcd009       LIKE xrcd_t.xrcd009
DEFINE l_free_m        RECORD
       free_item_1     LIKE nmbt_t.nmbt034, 
       free_item_2     LIKE nmbt_t.nmbt035,
       free_item_3     LIKE nmbt_t.nmbt036, 
       free_item_4     LIKE nmbt_t.nmbt037,
       free_item_5     LIKE nmbt_t.nmbt038, 
       free_item_6     LIKE nmbt_t.nmbt039,
       free_item_7     LIKE nmbt_t.nmbt040, 
       free_item_8     LIKE nmbt_t.nmbt041,
       free_item_9     LIKE nmbt_t.nmbt042,     
       free_item_10    LIKE nmbt_t.nmbt043            
                       END RECORD

DEFINE l_field_m       RECORD
       field1          LIKE type_t.chr10, 
       field2          LIKE type_t.chr10,
       field3          LIKE type_t.chr10, 
       field4          LIKE type_t.chr10,
       field5          LIKE type_t.chr10, 
       field6          LIKE type_t.chr10,
       field7          LIKE type_t.chr10, 
       field8          LIKE type_t.chr10,
       field9          LIKE type_t.chr10,     
       field10         LIKE type_t.chr10            
                       END RECORD

   #自由核算項傳入科目取用順序 帳款科目 -> 收入科目 -> 稅額科目
   #1.帳款科目---------------------------------------------
   LET l_free_m.free_item_1 = g_xrcb.xrcb037
   LET l_free_m.free_item_2 = g_xrcb.xrcb038
   LET l_free_m.free_item_3 = g_xrcb.xrcb039
   LET l_free_m.free_item_4 = g_xrcb.xrcb040
   LET l_free_m.free_item_5 = g_xrcb.xrcb041
   LET l_free_m.free_item_6 = g_xrcb.xrcb042
   LET l_free_m.free_item_7 = g_xrcb.xrcb043
   LET l_free_m.free_item_8 = g_xrcb.xrcb044
   LET l_free_m.free_item_9 = g_xrcb.xrcb045
   LET l_free_m.free_item_10 = g_xrcb.xrcb046
   
   LET l_field_m.field1 = 'xrcb037'
   LET l_field_m.field2 = 'xrcb038'
   LET l_field_m.field3 = 'xrcb039'
   LET l_field_m.field4 = 'xrcb040'
   LET l_field_m.field5 = 'xrcb041'
   LET l_field_m.field6 = 'xrcb042'
   LET l_field_m.field7 = 'xrcb043'
   LET l_field_m.field8 = 'xrcb044'
   LET l_field_m.field9 = 'xrcb045'
   LET l_field_m.field10 = 'xrcb046'                 
   
   CALL s_account_item_free(g_xrcb.xrcbld,g_xrcb.xrcb029,g_end_prog,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,'',l_free_m.*,l_field_m.*)
   RETURNING g_xrcb.xrcb037,g_xrcb.xrcb038,g_xrcb.xrcb039,g_xrcb.xrcb040,
             g_xrcb.xrcb041,g_xrcb.xrcb042,g_xrcb.xrcb043,g_xrcb.xrcb044,
             g_xrcb.xrcb045,g_xrcb.xrcb046   
             
   #2.收入科目---------------------------------------------
   LET l_free_m.free_item_1 = g_xrcb.xrcb037
   LET l_free_m.free_item_2 = g_xrcb.xrcb038
   LET l_free_m.free_item_3 = g_xrcb.xrcb039
   LET l_free_m.free_item_4 = g_xrcb.xrcb040
   LET l_free_m.free_item_5 = g_xrcb.xrcb041
   LET l_free_m.free_item_6 = g_xrcb.xrcb042
   LET l_free_m.free_item_7 = g_xrcb.xrcb043
   LET l_free_m.free_item_8 = g_xrcb.xrcb044
   LET l_free_m.free_item_9 = g_xrcb.xrcb045
   LET l_free_m.free_item_10 = g_xrcb.xrcb046
   
   LET l_field_m.field1 = 'xrcb037'
   LET l_field_m.field2 = 'xrcb038'
   LET l_field_m.field3 = 'xrcb039'
   LET l_field_m.field4 = 'xrcb040'
   LET l_field_m.field5 = 'xrcb041'
   LET l_field_m.field6 = 'xrcb042'
   LET l_field_m.field7 = 'xrcb043'
   LET l_field_m.field8 = 'xrcb044'
   LET l_field_m.field9 = 'xrcb045'
   LET l_field_m.field10 = 'xrcb046'                 
   
   CALL s_account_item_free(g_xrcb.xrcbld,g_xrcb.xrcb021,g_end_prog,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,'',l_free_m.*,l_field_m.*)
   RETURNING g_xrcb.xrcb037,g_xrcb.xrcb038,g_xrcb.xrcb039,g_xrcb.xrcb040,
             g_xrcb.xrcb041,g_xrcb.xrcb042,g_xrcb.xrcb043,g_xrcb.xrcb044,
             g_xrcb.xrcb045,g_xrcb.xrcb046     
   
   #3.稅額科目---------------------------------------------
   LET l_free_m.free_item_1 = g_xrcb.xrcb037
   LET l_free_m.free_item_2 = g_xrcb.xrcb038
   LET l_free_m.free_item_3 = g_xrcb.xrcb039
   LET l_free_m.free_item_4 = g_xrcb.xrcb040
   LET l_free_m.free_item_5 = g_xrcb.xrcb041
   LET l_free_m.free_item_6 = g_xrcb.xrcb042
   LET l_free_m.free_item_7 = g_xrcb.xrcb043
   LET l_free_m.free_item_8 = g_xrcb.xrcb044
   LET l_free_m.free_item_9 = g_xrcb.xrcb045
   LET l_free_m.free_item_10 = g_xrcb.xrcb046
   
   LET l_field_m.field1 = 'xrcb037'
   LET l_field_m.field2 = 'xrcb038'
   LET l_field_m.field3 = 'xrcb039'
   LET l_field_m.field4 = 'xrcb040'
   LET l_field_m.field5 = 'xrcb041'
   LET l_field_m.field6 = 'xrcb042'
   LET l_field_m.field7 = 'xrcb043'
   LET l_field_m.field8 = 'xrcb044'
   LET l_field_m.field9 = 'xrcb045'
   LET l_field_m.field10 = 'xrcb046'                 
   
   CALL s_account_item_free(g_xrcb.xrcbld,p_xrcd009,g_end_prog,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,'',l_free_m.*,l_field_m.*)
   RETURNING g_xrcb.xrcb037,g_xrcb.xrcb038,g_xrcb.xrcb039,g_xrcb.xrcb040,
             g_xrcb.xrcb041,g_xrcb.xrcb042,g_xrcb.xrcb043,g_xrcb.xrcb044,
             g_xrcb.xrcb045,g_xrcb.xrcb046     
             
   #更新核算項
   UPDATE xrcb_t SET xrcb037 = g_xrcb.xrcb037,xrcb038 = g_xrcb.xrcb038,xrcb039 = g_xrcb.xrcb039,
                     xrcb040 = g_xrcb.xrcb040,xrcb041 = g_xrcb.xrcb041,xrcb042 = g_xrcb.xrcb042,
                     xrcb043 = g_xrcb.xrcb043,xrcb044 = g_xrcb.xrcb044,xrcb045 = g_xrcb.xrcb045,
                     xrcb046 = g_xrcb.xrcb046
    WHERE xrcbent = g_enterprise AND xrcbld = g_xrcb.xrcbld 
      AND xrcbdocno = g_xrcb.xrcbdocno AND xrcbseq = g_xrcb.xrcbseq
         
          
END FUNCTION

################################################################################
# Descriptions...: 获取agli161科目编号
# Memo...........:
# Usage..........: CALL axrp132_get_xrcb021(p_xrcbld,p_xrcb001,p_xrcb002,p_xrcb003,p_xrcb004,p_xrcb034,p_xmdk082)
#                  RETURNING r_success,r_xrcb021
# Input parameter: p_xrcbld       帐套
#                : p_xrcb001      来源类型
#                : p_xrcb002      来源单号
#                : p_xrcb003      来源项次
#                : p_xrcb004      产品编号
#                : p_xrcb034      通路
#                : p_xmdk082      销退方式
# Return code....: r_success      成功否
#                : r_xrcb021      成本科目
# Date & Author..: 2019/10/24 By 10500   #190305-00001#3
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_get_xrcb021(p_xrcbld,p_xrcb001,p_xrcb002,p_xrcb003,p_xrcb004,p_xrcb034,p_xmdk082)
DEFINE p_xrcbld      LIKE xrcb_t.xrcbld
DEFINE p_xrcb001     LIKE xrcb_t.xrcb001
DEFINE p_xrcb002     LIKE xrcb_t.xrcb002
DEFINE p_xrcb003     LIKE xrcb_t.xrcb003
DEFINE p_xrcb004     LIKE xrcb_t.xrcb004
DEFINE p_xrcb034     LIKE xrcb_t.xrcb034
DEFINE p_xmdk082     LIKE xmdk_t.xmdk082
DEFINE r_success     LIKE type_t.num5
DEFINE r_xrcb021     LIKE xrcb_t.xrcb021
DEFINE l_sql         STRING
DEFINE l_xmdl014     LIKE xmdl_t.xmdl014   #库位 
DEFINE l_xmdk031     LIKE xmdk_t.xmdk031   #销售分类
DEFINE l_imaf111     LIKE imaf_t.imaf111   #销售分群
DEFINE l_kind        STRING                #销售/采购分群
DEFINE l_pmds100     LIKE pmds_t.pmds100   #仓退方式
DEFINE l_type        LIKE type_t.chr5      #科目类型


    
   SELECT xmdl014 INTO l_xmdl014  
     FROM xmdl_t
    WHERE xmdlent   = g_enterprise
      AND xmdldocno = p_xrcb002
      AND xmdlseq   = p_xrcb003              
   IF NOT cl_null(p_xrcb004) THEN            
      #订单/出货单/销退单取來源單上的銷售分類
      LET l_xmdk031 = NULL
      IF p_xrcb001 = '10' OR p_xrcb001 = '11' OR p_xrcb001 = '21' THEN 
         IF p_xrcb001 = '10' THEN 
            SELECT xmda034 INTO l_xmdk031 FROM xmda_t WHERE xmdaent = g_enterprise AND xmdadocno = p_xrcb002
         END IF
         IF p_xrcb001 = '11' OR p_xrcb001 = '21' THEN 
            SELECT xmdk031 INTO l_xmdk031 FROM xmdk_t WHERE xmdkent = g_enterprise AND xmdkdocno = p_xrcb002
         END IF                      
      END IF   
      IF cl_null(l_xmdk031) THEN 
         LET l_xmdk031 = g_xrca.xrca058  
      END IF        
      #销售分群aimm213
      LET l_imaf111 = NULL
      SELECT imaf111 INTO l_imaf111 
        FROM imaf_t 
       WHERE imafent = g_enterprise AND imaf001 = p_xrcb004
         AND imafsite = (SELECT glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_xrcbld) 
      IF NOT cl_null(l_imaf111) THEN
         LET l_kind = l_xmdk031,"@",l_imaf111
      ELSE 
         LET l_kind = l_xmdk031            
      END IF
   END IF               
   #销退方式
   LET l_type = ''
   IF p_xmdk082 = '1' THEN LET l_type = '33' END IF   #销退退回->取成本及收入类销退科目
   IF p_xmdk082 = '4' THEN LET l_type = '34' END IF   #金额折让->取成本及收入类金额折让科目
   CALL s_get_item_acc(g_xrca.xrcald,l_type,p_xrcb004,l_kind,p_xrcb034,'',l_xmdl014)
         RETURNING r_success,r_xrcb021

   
   RETURN r_success,r_xrcb021


END FUNCTION

################################################################################
# Descriptions...: 獲取應收賬款單號碼說明
# Memo...........:
# Usage..........: CALL axrp132_get_xrcadocno_desc()
# Date & Author..: 2020/3/9 By 13656
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_get_xrcadocno_desc()
   DEFINE l_slip     LIKE oobx_t.oobx001
   DEFINE l_oobxl003 LIKE oobxl_t.oobxl003

   INITIALIZE g_ref_fields TO NULL
   CALL s_aooi200_fin_get_slip_desc(g_master.xrcadocno) RETURNING l_oobxl003          

   LET g_master.xrcadocno_desc = l_oobxl003
   DISPLAY BY NAME g_master.xrcadocno_desc 
END FUNCTION

################################################################################
# Descriptions...: 訂金發票立帳(混合單據)
# Memo...........: #200710-00084#8 add
# Usage..........: CALL axrp132_get_ar2()
# Date & Author..: 2021/01/20 By 10043
# Modify.........:
################################################################################
PRIVATE FUNCTION axrp132_get_ar2()
DEFINE l_sql          STRING
DEFINE l_s            LIKE type_t.num5
DEFINE l_isagdocno    LIKE isag_t.isagdocno
DEFINE l_isagcomp     LIKE isag_t.isagcomp
DEFINE l_isag002      LIKE isag_t.isag002
DEFINE l_isag011      LIKE isag_t.isag011
DEFINE l_cal_isag103  LIKE isag_t.isag103
DEFINE l_cal_isag105  LIKE isag_t.isag105
DEFINE l_doc_success  LIKE type_t.num5
DEFINE l_success      LIKE type_t.num5
DEFINE l_conf_success LIKE type_t.num5
DEFINE l_first        LIKE type_t.chr1 #是否第一筆立帳單

DEFINE l_xrcadocno    LIKE xrca_t.xrcadocno
DEFINE l_xrca001      LIKE xrca_t.xrca001
DEFINE l_xrca058      LIKE xrca_t.xrca058
DEFINE l_xrcb035      LIKE xrcb_t.xrcb035
DEFINE l_xrcb103      LIKE xrcb_t.xrcb103
DEFINE l_xrcb105      LIKE xrcb_t.xrcb105
DEFINE l_sum_xrcb103  LIKE xrcb_t.xrcb103
DEFINE l_sum_xrcb105  LIKE xrcb_t.xrcb105
                      
DEFINE l_glab001      LIKE glab_t.glab001
DEFINE l_glab002      LIKE glab_t.glab002
DEFINE l_glab003      LIKE glab_t.glab003
                      
DEFINE l_ooef019      LIKE ooef_t.ooef019
                      
DEFINE l_ooba002      LIKE ooba_t.ooba002 #單別
                      
DEFINE l_ooib027      LIKE ooib_t.ooib027
                      
DEFINE l_oodb004      LIKE oodb_t.oodb004
                      
DEFINE l_controlno    LIKE ooha_t.ooha001
                      
DEFINE l_pmaa004      LIKE pmaa_t.pmaa004
DEFINE l_imaa004      LIKE imaa_t.imaa004
                      
DEFINE l_sfin9025     LIKE type_t.chr1
DEFINE l_dfin0030     LIKE type_t.chr1
DEFINE l_dfin0031     LIKE type_t.chr1
DEFINE l_dfin0032     LIKE type_t.chr1
DEFINE l_gl_slip      LIKE ooba_t.ooba002
                      
DEFINE l_xrcd009      LIKE xrcd_t.xrcd009
                  
DEFINE l_imaf111      LIKE imaf_t.imaf111   #销售分群
DEFINE l_kind         STRING                #销售/采购分群
                      
DEFINE l_cnt          LIKE type_t.num10
DEFINE l_cnt29        LIKE type_t.num10
DEFINE l_xmdk031_cnt  LIKE type_t.num10

DEFINE l_oobl002      LIKE oobl_t.oobl002  #单别对应的作业编号
DEFINE l_gzzz002      LIKE gzzz_t.gzzz002  #作业对应的程式编号
DEFINE l_success_1    LIKE type_t.num5
                       
DEFINE l_start_no     LIKE xrca_t.xrcadocno
DEFINE l_end_no       LIKE xrca_t.xrcadocno

DEFINE ls_js          STRING
DEFINE lc_param RECORD
   xrcasite  LIKE xrca_t.xrcasite,     
   xrcald    LIKE xrca_t.xrcald,       
   xrcacomp  LIKE xrca_t.xrcacomp,     
   xrcadocno LIKE xrca_t.xrcadocno,    
   xrcadocdt LIKE xrca_t.xrcadocdt,    
   xrca001   LIKE xrca_t.xrca001,      
   xrca003   LIKE xrca_t.xrca003,   
   xrca004   LIKE xrca_t.xrca004,      
   xrca005   LIKE xrca_t.xrca005,      
   xrca058   LIKE xrca_t.xrca058,      
   xrca100   LIKE xrca_t.xrca100,      
   xrca101   LIKE xrca_t.xrca101,      
   xrca121   LIKE xrca_t.xrca121,      
   xrca131   LIKE xrca_t.xrca131,      
   xrcbseq   LIKE xrcb_t.xrcbseq,      
   xrcb002   LIKE xrcb_t.xrcb002,    
   xrcb003   LIKE xrcb_t.xrcb003,    
   xrcb004   LIKE xrcb_t.xrcb004,   
   xrcb008   LIKE xrcb_t.xrcb008,    
   xrcb009   LIKE xrcb_t.xrcb009,    
   xrcb010   LIKE xrcb_t.xrcb010,      
   xrcb011   LIKE xrcb_t.xrcb011,      
   xrcb012   LIKE xrcb_t.xrcb012,      
   xrcb015   LIKE xrcb_t.xrcb015,      
   xrcb016   LIKE xrcb_t.xrcb016,      
   xrcb021   LIKE xrcb_t.xrcb021,
   xrcb024   LIKE xrcb_t.xrcb024,      
   xrcb033   LIKE xrcb_t.xrcb033,      
   xrcb034   LIKE xrcb_t.xrcb034,      
   xrcb035   LIKE xrcb_t.xrcb035,      
   xrcb036   LIKE xrcb_t.xrcb036,      
   xrcb037   LIKE xrcb_t.xrcb037,      
   xrcb038   LIKE xrcb_t.xrcb038,      
   xrcb039   LIKE xrcb_t.xrcb039,      
   xrcb040   LIKE xrcb_t.xrcb040,      
   xrcb041   LIKE xrcb_t.xrcb041,      
   xrcb042   LIKE xrcb_t.xrcb042,      
   xrcb043   LIKE xrcb_t.xrcb043,      
   xrcb044   LIKE xrcb_t.xrcb044,      
   xrcb045   LIKE xrcb_t.xrcb045,      
   xrcb046   LIKE xrcb_t.xrcb046,      
   xrcb047   LIKE xrcb_t.xrcb047,      
   xrcb051   LIKE xrcb_t.xrcb051,      
   xrcb103   LIKE xrcb_t.xrcb103,      
   xrcb113   LIKE xrcb_t.xrcb113,      
   xrcb123   LIKE xrcb_t.xrcb123,      
   xrcb133   LIKE xrcb_t.xrcb133,
   type1     LIKE type_t.chr1 #異動類型(xreq003)          
   END RECORD

DEFINE la_param RECORD
   prog        STRING,
   param       DYNAMIC ARRAY OF STRING,
   p_style     LIKE type_t.chr10,    
   p_check     STRING,                
   p_isafdocno LIKE isaf_t.isafdocno
   END RECORD

#訂單單身明細
DEFINE l_xmdk001     LIKE xmdk_t.xmdk001
DEFINE l_xmdk003     LIKE xmdk_t.xmdk003
DEFINE l_xmdk004_1   LIKE xmdk_t.xmdk004
DEFINE l_xmdk030     LIKE xmdk_t.xmdk030
DEFINE l_xmdk031     LIKE xmdk_t.xmdk031 #销售分类
DEFINE l_xmdl003     LIKE xmdl_t.xmdl003
DEFINE l_xmdl004     LIKE xmdl_t.xmdl004
DEFINE l_xmdl007     LIKE xmdl_t.xmdl007 #库位 
DEFINE l_xmdl014     LIKE xmdl_t.xmdl014
DEFINE l_xmdl030     LIKE xmdl_t.xmdl030
DEFINE l_xmdl031     LIKE xmdl_t.xmdl031
DEFINE l_xmdl050     LIKE xmdl_t.xmdl050
DEFINE l_xmdl051     LIKE xmdl_t.xmdl051
DEFINE l_xmdlnum     LIKE xmdl_t.xmdl038

#銷項發票主檔
DEFINE l_isaf RECORD  
    isafent LIKE isaf_t.isafent, #企業編碼
    isafsite LIKE isaf_t.isafsite, #帳務組織
    isafcomp LIKE isaf_t.isafcomp, #法人
    isafdocno LIKE isaf_t.isafdocno, #開票單號
    isafdocdt LIKE isaf_t.isafdocdt, #輸入日期
    isaf001 LIKE isaf_t.isaf001, #發票來源
    isaf002 LIKE isaf_t.isaf002, #發票客戶
    isaf003 LIKE isaf_t.isaf003, #帳款客戶
    isaf004 LIKE isaf_t.isaf004, #業務組織
    isaf005 LIKE isaf_t.isaf005, #開票人員
    isaf006 LIKE isaf_t.isaf006, #開票部門
    isaf007 LIKE isaf_t.isaf007, #扣帳日期
    isaf008 LIKE isaf_t.isaf008, #發票類型
    isaf009 LIKE isaf_t.isaf009, #電子發票否
    isaf010 LIKE isaf_t.isaf010, #發票編號
    isaf011 LIKE isaf_t.isaf011, #發票號碼
    isaf012 LIKE isaf_t.isaf012, #發票檢查碼
    isaf013 LIKE isaf_t.isaf013, #發票防偽隨機碼
    isaf014 LIKE isaf_t.isaf014, #發票日期
    isaf015 LIKE isaf_t.isaf015, #發票時間
    isaf016 LIKE isaf_t.isaf016, #稅別
    isaf017 LIKE isaf_t.isaf017, #含稅否
    isaf018 LIKE isaf_t.isaf018, #稅率
    isaf019 LIKE isaf_t.isaf019, #申報格式
    isaf020 LIKE isaf_t.isaf020, #發票號碼迄號
    isaf021 LIKE isaf_t.isaf021, #購貨方名稱
    isaf022 LIKE isaf_t.isaf022, #購貨方統一編號
    isaf023 LIKE isaf_t.isaf023, #購貨方地址
    isaf024 LIKE isaf_t.isaf024, #購貨方電話
    isaf025 LIKE isaf_t.isaf025, #購貨方開戶銀行
    isaf026 LIKE isaf_t.isaf026, #購貨方帳戶編碼
    isaf027 LIKE isaf_t.isaf027, #銷貨方名稱
    isaf028 LIKE isaf_t.isaf028, #銷方統一編號
    isaf029 LIKE isaf_t.isaf029, #銷貨方地址
    isaf030 LIKE isaf_t.isaf030, #銷貨方電話
    isaf031 LIKE isaf_t.isaf031, #銷貨方開戶銀行
    isaf032 LIKE isaf_t.isaf032, #銷貨方帳號
    isaf033 LIKE isaf_t.isaf033, #POS機號
    isaf034 LIKE isaf_t.isaf034, #POS單號
    isaf035 LIKE isaf_t.isaf035, #應收單號
    isaf036 LIKE isaf_t.isaf036, #發票異動狀態
    isaf037 LIKE isaf_t.isaf037, #異動理由碼
    isaf038 LIKE isaf_t.isaf038, #異動備註
    isaf039 LIKE isaf_t.isaf039, #異動日期
    isaf040 LIKE isaf_t.isaf040, #異動時間
    isaf041 LIKE isaf_t.isaf041, #異動人員
    isaf042 LIKE isaf_t.isaf042, #專案作廢核准文號
    isaf043 LIKE isaf_t.isaf043, #通關方式註記
    isaf044 LIKE isaf_t.isaf044, #列印次數
    isaf045 LIKE isaf_t.isaf045, #支付工具卡號1
    isaf046 LIKE isaf_t.isaf046, #支付工具卡號2
    isaf047 LIKE isaf_t.isaf047, #支付工具卡號3
    isaf048 LIKE isaf_t.isaf048, #輔助帳二應收單號
    isaf049 LIKE isaf_t.isaf049, #輔助帳三應收單號
    isaf050 LIKE isaf_t.isaf050, #產生方式
    isaf051 LIKE isaf_t.isaf051, #發票簿號
    isaf052 LIKE isaf_t.isaf052, #發票簿號對應的營運據點
    isaf053 LIKE isaf_t.isaf053, #發票聯數
    isaf054 LIKE isaf_t.isaf054, #課稅別
    isaf055 LIKE isaf_t.isaf055, #收款客戶
    isaf056 LIKE isaf_t.isaf056, #發票性質
    isaf057 LIKE isaf_t.isaf057, #業務人員
    isaf058 LIKE isaf_t.isaf058, #收款條件
    isaf100 LIKE isaf_t.isaf100, #幣別
    isaf101 LIKE isaf_t.isaf101, #匯率
    isaf103 LIKE isaf_t.isaf103, #發票原幣未稅金額
    isaf104 LIKE isaf_t.isaf104, #發票原幣稅額
    isaf105 LIKE isaf_t.isaf105, #發票原幣含稅金額
    isaf106 LIKE isaf_t.isaf106, #發票原幣留抵稅額
    isaf107 LIKE isaf_t.isaf107, #發票原幣已折金額
    isaf108 LIKE isaf_t.isaf108, #發票原幣已折稅額
    isaf113 LIKE isaf_t.isaf113, #發票本幣未稅金額
    isaf114 LIKE isaf_t.isaf114, #發票本幣稅額
    isaf115 LIKE isaf_t.isaf115, #發票本幣含稅金額
    isaf116 LIKE isaf_t.isaf116, #發票本幣留抵稅額
    isaf117 LIKE isaf_t.isaf117, #發票本幣已折金額
    isaf118 LIKE isaf_t.isaf118, #發票本幣已折稅額
    isaf119 LIKE isaf_t.isaf119, #帳款應稅金額
    isaf120 LIKE isaf_t.isaf120, #帳款零稅金額
    isaf121 LIKE isaf_t.isaf121, #帳款免稅金額
    isaf122 LIKE isaf_t.isaf122, #禮券已開發票金額
    isaf123 LIKE isaf_t.isaf123, #禮券已開發票稅額
    isaf124 LIKE isaf_t.isaf124, #已開發票留抵稅額
    isaf201 LIKE isaf_t.isaf201, #愛心碼
    isaf202 LIKE isaf_t.isaf202, #載具類別號碼
    isaf203 LIKE isaf_t.isaf203, #載具顯碼 ID
    isaf204 LIKE isaf_t.isaf204, #載具隱碼 ID
    isaf205 LIKE isaf_t.isaf205, #電子發票匯出狀態
    isaf206 LIKE isaf_t.isaf206, #電子發票匯出序號
    isaf207 LIKE isaf_t.isaf207, #電子發票領取方式
    isaf208 LIKE isaf_t.isaf208, #申報年度
    isaf209 LIKE isaf_t.isaf209, #申報月份
    isaf210 LIKE isaf_t.isaf210, #申報據點
    isafstus LIKE isaf_t.isafstus, #狀態碼
    isafownid LIKE isaf_t.isafownid, #資料所有者
    isafowndp LIKE isaf_t.isafowndp, #資料所有部門
    isafcrtid LIKE isaf_t.isafcrtid, #資料建立者
    isafcrtdp LIKE isaf_t.isafcrtdp, #資料建立部門
    isafcrtdt LIKE isaf_t.isafcrtdt, #資料創建日
    isafmodid LIKE isaf_t.isafmodid, #資料修改者
    isafmoddt LIKE isaf_t.isafmoddt, #最近修改日
    isafcnfid LIKE isaf_t.isafcnfid, #資料確認者
    isafcnfdt LIKE isaf_t.isafcnfdt, #資料確認日
    isaf059 LIKE isaf_t.isaf059, #適用零稅率規定
    isaf060 LIKE isaf_t.isaf060, #通關方式
    isaf061 LIKE isaf_t.isaf061, #非經海關證明文件名稱
    isaf062 LIKE isaf_t.isaf062, #非經海關證明文件號碼
    isaf063 LIKE isaf_t.isaf063, #經由海關出口報單類別
    isaf064 LIKE isaf_t.isaf064, #出口報單號碼
    isaf065 LIKE isaf_t.isaf065, #輸出或結匯日期
    isaf066 LIKE isaf_t.isaf066, #商業發票號碼(IV no.)
    isaf067 LIKE isaf_t.isaf067  #一次性交易對象
    END RECORD
    
#銷項發票來源明細檔
DEFINE l_isag RECORD  
    isagent LIKE isag_t.isagent, #企業編號
    isagcomp LIKE isag_t.isagcomp, #法人
    isagdocno LIKE isag_t.isagdocno, #開票單號
    isagseq LIKE isag_t.isagseq, #項次
    isagorga LIKE isag_t.isagorga, #來源組織
    isag001 LIKE isag_t.isag001, #來源類型
    isag002 LIKE isag_t.isag002, #來源單號
    isag003 LIKE isag_t.isag003, #來源項次
    isag004 LIKE isag_t.isag004, #發票數量
    isag005 LIKE isag_t.isag005, #發票單位
    isag006 LIKE isag_t.isag006, #稅別
    isag007 LIKE isag_t.isag007, #含稅否
    isag008 LIKE isag_t.isag008, #稅率
    isag009 LIKE isag_t.isag009, #料號
    isag010 LIKE isag_t.isag010, #品名
    isag011 LIKE isag_t.isag011, #期別
    isag012 LIKE isag_t.isag012, #收款條件
    isag013 LIKE isag_t.isag013, #原始發票編號
    isag014 LIKE isag_t.isag014, #原始發票號碼
    isag015 LIKE isag_t.isag015, #正負值
    isag016 LIKE isag_t.isag016, #客戶料號
    isag017 LIKE isag_t.isag017, #客戶品名
    isag101 LIKE isag_t.isag101, #原幣單價
    isag103 LIKE isag_t.isag103, #原幣未稅金額
    isag104 LIKE isag_t.isag104, #原幣稅額
    isag105 LIKE isag_t.isag105, #原幣稅後金額
    isag106 LIKE isag_t.isag106, #訂金發票已被攤未稅額
    isag113 LIKE isag_t.isag113, #本幣未稅金額
    isag114 LIKE isag_t.isag114, #本幣稅額
    isag115 LIKE isag_t.isag115, #本幣稅後金額
    isag116 LIKE isag_t.isag116, #原幣已收金額
    isag117 LIKE isag_t.isag117, #本幣已收金額
    isag126 LIKE isag_t.isag126, #輔助帳二原幣已收金額　
    isag127 LIKE isag_t.isag127, #輔助帳二本幣已收金額　
    isag128 LIKE isag_t.isag128, #輔助帳二應收單號
    isag136 LIKE isag_t.isag136, #輔助帳三原幣已收金額　
    isag137 LIKE isag_t.isag137, #輔助帳二本幣已收金額　
    isag138 LIKE isag_t.isag138, #輔助帳三應收單號
    isag018 LIKE isag_t.isag018 #訂金已開發票
    ,isag022 LIKE isag_t.isag022, #項目編號
    isag023 LIKE isag_t.isag023  #WBS編號
    END RECORD

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
DEFINE l_tmp RECORD
   isagdocno   LIKE isag_t.isagdocno,
   isagseq     LIKE isag_t.isagseq,
   isag004     LIKE isag_t.isag004,
   isag103     LIKE isag_t.isag103,
   isag105     LIKE isag_t.isag105
   END RECORD
   
#固定核算項
DEFINE l_xrcb2 RECORD
   xrcb053 LIKE xrcb_t.xrcb053,
   xrcb054 LIKE xrcb_t.xrcb054,
   xrcb051 LIKE xrcb_t.xrcb051,
   xrcb010 LIKE xrcb_t.xrcb010,
   xrcb011 LIKE xrcb_t.xrcb011,
   xrcb024 LIKE xrcb_t.xrcb024,
   xrcb036 LIKE xrcb_t.xrcb036,
   xrcb012 LIKE xrcb_t.xrcb012,
   xrcb033 LIKE xrcb_t.xrcb033,
   xrcb034 LIKE xrcb_t.xrcb034,
   xrcb035 LIKE xrcb_t.xrcb035,
   xrcb015 LIKE xrcb_t.xrcb015,
   xrcb016 LIKE xrcb_t.xrcb016
   END RECORD
#自由核算項
DEFINE l_xrcb3 RECORD
   xrcb037 LIKE xrcb_t.xrcb037, 
   xrcb038 LIKE xrcb_t.xrcb038,
   xrcb039 LIKE xrcb_t.xrcb039, 
   xrcb040 LIKE xrcb_t.xrcb040,
   xrcb041 LIKE xrcb_t.xrcb041, 
   xrcb042 LIKE xrcb_t.xrcb042,
   xrcb043 LIKE xrcb_t.xrcb043, 
   xrcb044 LIKE xrcb_t.xrcb044,
   xrcb045 LIKE xrcb_t.xrcb045,     
   xrcb046 LIKE xrcb_t.xrcb046            
   END RECORD   
   
   #帳套
   CALL s_axrt300_sel_ld(g_master.xrcald) RETURNING l_success,l_s
   #取得單別
   LET l_ooba002 = NULL
   CALL s_aooi200_fin_get_slip(g_master.xrcadocno) RETURNING l_success,l_ooba002
   #分錄傳票產生否
   LET l_dfin0030 = NULL
   CALL s_fin_get_doc_para(g_master.xrcald,g_glaa.glaacomp,l_ooba002,'D-FIN-0030') RETURNING l_dfin0030
   IF cl_null(l_dfin0030) THEN LET l_dfin0030 = 'N' END IF   
   #立即確認否
   LET l_dfin0031 = NULL
   CALL s_fin_get_doc_para(g_master.xrcald,g_glaa.glaacomp,l_ooba002,'D-FIN-0031') RETURNING l_dfin0031
   IF cl_null(l_dfin0031) THEN LET l_dfin0031 = 'N' END IF   
   #是否直接拋轉憑證
   LET l_dfin0032 = NULL
   CALL s_fin_get_doc_para(g_master.xrcald,g_glaa.glaacomp,l_ooba002,'D-FIN-0032') RETURNING l_dfin0032
   IF cl_null(l_dfin0032) THEN LET l_dfin0032 = 'N' END IF   
   #傳票單別
   LET l_gl_slip = NULL
   CALL s_fin_get_doc_para(g_master.xrcald,g_glaa.glaacomp,l_ooba002,'D-FIN-2002') RETURNING l_gl_slip   
   #出貨應收流程依項目進行帳務管理
   LET l_sfin9025 = NULL
   CALL cl_get_para(g_enterprise,g_glaa.glaacomp,'S-FIN-9025') RETURNING l_sfin9025
   IF cl_null(l_sfin9025) THEN LET l_sfin9025 = 'N' END IF
   #稅區
   LET l_ooef019 = NULL
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t 
    WHERE ooefent = g_enterprise
      AND ooef001 = g_glaa.glaacomp
      AND ooefstus = 'Y'

   #取aist310單號
   LET l_sql = " SELECT DISTINCT isagdocno,isagcomp FROM axrp132_tmp02 "
   PREPARE axrp132_p FROM l_sql
   DECLARE axrp132_c CURSOR WITH HOLD FOR axrp132_p
   #取aist310單身的來源單號&期別
   LET l_sql = " SELECT DISTINCT isag002,isag011 ",
               "   FROM axrp132_tmp02 ",
               "  WHERE isagdocno = ? AND isag001 = '10' ",
               "  ORDER BY isag002,isag011 "
   PREPARE axrp132_p2 FROM l_sql
   DECLARE axrp132_c2 CURSOR FOR axrp132_p2
   #aist310單身訂單資料
   LET l_sql = " SELECT isagdocno,isagseq ",
               "   FROM axrp132_tmp02 ",
               "  WHERE isagdocno = ? AND isag002 = ? AND isag011 = ? ",
               "    AND isag001 = '10' ",
               "  ORDER BY isagseq "
   PREPARE axrp132_p3 FROM l_sql
   DECLARE axrp132_c3 CURSOR FOR axrp132_p3
   #aist310單身加項資料
   LET l_sql = " SELECT isagdocno,isagseq",
               "   FROM axrp132_tmp02 ",
               "  WHERE isagdocno = ? AND isag001 = '19' ",
               "  ORDER BY isagseq "
   PREPARE axrp132_p4 FROM l_sql
   DECLARE axrp132_c4 CURSOR FOR axrp132_p4
   #aist310單身減項,原幣未稅/含稅金額
   LET l_sql = " SELECT isagseq,isag103,isag105,isag004 ",
               "   FROM axrp132_tmp02 ",
               "  WHERE isagdocno = ? AND isag001 = '29' ",
               "  ORDER BY isagseq"
   PREPARE axrp132_p5 FROM l_sql   
   DECLARE axrp132_c5 CURSOR FOR axrp132_p5
   #該aist310產生的axrt310單號&單身"SUM(正負值*原幣未稅金額)"&單身"SUM(正負值*原幣含稅金額)"
   LET l_sql = " SELECT xrcadocno,SUM(xrcb022*xrcb103),SUM(xrcb022*xrcb105)",
               "   FROM xrca_t ",
               "   LEFT JOIN xrcb_t ON xrcaent = xrcbent AND xrcald = xrcbld AND xrcadocno = xrcbdocno ",
               "  WHERE xrcaent = ",g_enterprise," AND xrca018 = ? ",
               "  GROUP BY xrcadocno ",
               "  ORDER BY xrcadocno "
   PREPARE axrp132_p6 FROM l_sql
   DECLARE axrp132_c6 CURSOR FOR axrp132_p6 

   #該aist310產生的aapt310單號
   LET l_sql = " SELECT DISTINCT xrcadocno",
               "   FROM xrca_t ",
               "  WHERE xrcaent = ",g_enterprise," AND xrca018 = ? ",
               "  ORDER BY xrcadocno "
   PREPARE axrp132_p7 FROM l_sql
   DECLARE axrp132_c7 CURSOR FOR axrp132_p7
   
   #該aist310產生的axrt310單頭資料
   LET l_sql = " SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,   ", 
               "        xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,xrcacnfdt, ",
               "        xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,      ",
               "        xrcadocno,xrcadocdt,xrca001,xrcasite,xrca003,      ",
               "        xrca004,xrca005,xrca006,xrca007,xrca008,           ",
               "        xrca009,xrca010,xrca011,xrca012,xrca013,           ",
               "        xrca014,xrca015,xrca016,xrca017,xrca018,           ",
               "        xrca019,xrca020,xrca021,xrca022,xrca023,           ",
               "        xrca024,xrca025,xrca026,xrca028,xrca029,           ",
               "        xrca030,xrca031,xrca032,xrca033,xrca034,           ",
               "        xrca035,xrca036,xrca037,xrca038,xrca039,           ",
               "        xrca040,xrca041,xrca042,xrca043,xrca044,           ",
               "        xrca045,xrca046,xrca047,xrca048,xrca049,           ",
               "        xrca050,xrca051,xrca052,xrca053,xrca054,           ",
               "        xrca055,xrca056,xrca057,xrca058,xrca059,           ",
               "        xrca060,xrca061,xrca062,xrca063,xrca064,           ",
               "        xrca065,xrca066,xrca100,xrca101,xrca103,           ",
               "        xrca104,xrca106,xrca107,xrca108,xrca113,           ",
               "        xrca114,xrca116,xrca117,xrca118,xrca120,           ",
               "        xrca121,xrca123,xrca124,xrca126,xrca127,           ",
               "        xrca128,xrca130,xrca131,xrca133,xrca134,           ",
               "        xrca136,xrca137,xrca138                            ",
               "   FROM xrca_t ",
               "  WHERE xrcaent = ",g_enterprise,
               "    AND xrcald = ? ",
               "    AND xrcadocno = ? "
   PREPARE sel_xrca_pre FROM l_sql     
   
   #抓取對帳單單頭資料
   LET l_sql="SELECT isafent,isafsite,isafcomp,isafdocno,isafdocdt,isaf001,isaf002,isaf003,isaf004,",
             "       isaf005,isaf006,isaf007,isaf008,isaf009,isaf010,isaf011,isaf012,isaf013,isaf014,",
             "       isaf015,isaf016,isaf017,isaf018,isaf019,isaf020,isaf021,isaf022,isaf023,isaf024,",
             "       isaf025,isaf026,isaf027,isaf028,isaf029,isaf030,isaf031,isaf032,isaf033,isaf034,",
             "       isaf035,isaf036,isaf037,isaf038,isaf039,isaf040,isaf041,isaf042,isaf043,isaf044,",
             "       isaf045,isaf046,isaf047,isaf048,isaf049,isaf050,isaf051,isaf052,isaf053,isaf054,",
             "       isaf055,isaf056,isaf057,isaf058,isaf100,isaf101,isaf103,isaf104,isaf105,isaf106,",
             "       isaf107,isaf108,isaf113,isaf114,isaf115,isaf116,isaf117,isaf118,isaf119,isaf120,",
             "       isaf121,isaf122,isaf123,isaf124,isaf201,isaf202,isaf203,isaf204,isaf205,isaf206,",
             "       isaf207,isaf208,isaf209,isaf210,isafstus,isafownid,isafowndp,isafcrtid,isafcrtdp,",
             "       isafcrtdt,isafmodid,isafmoddt,isafcnfid,isafcnfdt,isaf059,isaf060,isaf061,isaf062,",
             "       isaf063,isaf064,isaf065,isaf066,isaf067 ",
             "  FROM isaf_t ",
             " WHERE isafent = ",g_enterprise," AND isafdocno =? AND isafcomp = ?"
   PREPARE axrp132_sel_isaf_pr2 FROM l_sql
  
   #抓取對帳單單身資料
   LET l_sql="SELECT isagent,isagcomp,isagdocno,isagseq,isagorga,isag001,isag002,isag003,isag004,isag005,isag006,",
             "       isag007,isag008,isag009,isag010,isag011,isag012,isag013,isag014,isag015,isag016,isag017,",
             "       isag101,isag103,isag104,isag105,isag106,isag113,isag114,isag115,isag116,isag117,isag126,",
             "       isag127,isag128,isag136,isag137,isag138,isag018,isag022,isag023 ",
             "  FROM isag_t ",
             " WHERE isagent = ",g_enterprise," AND isagdocno = ? AND isagcomp = ? AND isagseq = ?"
   PREPARE axrp132_sel_isag_pr2 FROM l_sql
   
   #抓取科目.axri011
   LET l_sql="SELECT glab005 FROM glab_t ", 
             " WHERE glabent = ",g_enterprise,
             "   AND glabld = '",g_master.xrcald,"'",
             "   AND glab001 = ? ",
             "   AND glab002 = ? ",          
             "   AND glab003 = ? "
   PREPARE axrp132_sel_glab_pr2 FROM l_sql   
   
   #責任中心
   LET l_sql = " SELECT ooeg004 FROM ooeg_t ",
               "  WHERE ooegent = ",g_enterprise,
               "    AND ooeg001 = ? ",
               "    AND ooegstus = 'Y'"                    
   PREPARE sel_ooeg004 FROM l_sql
   
   #課稅原則
   LET l_sql = " SELECT oodb004 ",              
               "   FROM oodb_t ",
               "  WHERE oodbent  = ",g_enterprise,
               "    AND oodb001  = '",l_ooef019,"'",
               "    AND oodb002  = ? ",               
               "    AND oodbstus = 'Y'"
   PREPARE sel_oodb004 FROM l_sql

   #含稅否/稅率
   LET l_sql = " SELECT oodb005,oodb006 ",
               "   FROM oodb_t ",
               "  WHERE oodbent = ",g_enterprise,
               "    AND oodb001  = '",l_ooef019,"'",
               "    AND oodb002 = ? ",
               "    AND oodbstus = 'Y'"
   PREPARE sel_oodb005 FROM l_sql
   
   LET l_sql = l_sql CLIPPED," AND oodb003 = 'T01'"
   PREPARE sel_oodb003_t01 FROM l_sql
   
   #專案編號
   LET l_sql = " SELECT DISTINCT xmdl030 ", 
               "   FROM xmdl_t ",
               "  WHERE xmdlent = ",g_enterprise,
               "    AND xmdldocno = ? " 
   PREPARE sel_xmdl030 FROM l_sql   
   
   #多帳期設定
   LET l_sql = " SELECT ooib025 FROM ooib_t ",
               "  WHERE ooibent = ",g_enterprise,
               "    AND ooib002 = ? ", 
               "    AND ooibstus = 'Y'"
   PREPARE sel_ooib025 FROM l_sql
   
   #銷售分類
   CALL s_control_get_group('2',g_user,g_dept) RETURNING l_success,l_controlno   

   #交易對象識別碼
   LET l_sql = " SELECT pmaa004 FROM pmaa_t ",
               "  WHERE pmaaent = ",g_enterprise,
               "    AND pmaa001 = ? ",
               "    AND pmaastus = 'Y'"
   PREPARE sel_pmaa004 FROM l_sql
   
   #項次
   LET l_sql = " SELECT MAX(xrcbseq)+1 ",
               "   FROM xrcb_t ",
               "  WHERE xrcbent = ",g_enterprise,
               "    AND xrcbld = ? ",
               "    AND xrcbdocno = ? "
   PREPARE sel_max_xrcbseq FROM l_sql   

   #料件類別/產品分類
   LET l_sql = " SELECT imaa004,imaa009 ",
               "   FROM imaa_t ",
               "  WHERE imaaent = ",g_enterprise,
               "    AND imaa001= ? ",
               "    AND imaastus = 'Y'"
   PREPARE selimaa_p2 FROM l_sql
   
   #訂單單身明細
   LET l_sql= "SELECT xmda002,xmda003,xmdcdocno,xmdcseq,xmdc036,",
              "       xmdc037,xmdc049,'',xmda023,xmdc036,",
              "       xmdc037,xmdc050 ",
              "  FROM xmda_t ",
              "  LEFT OUTER JOIN xmdc_t ON xmdaent = xmdcent AND xmdadocno = xmdcdocno  ",  
              " WHERE xmdcent = ",g_enterprise,
              "   AND xmdcdocno = ? ",          
              "   AND xmdcseq = ? "          
   PREPARE axrp132_sel_xmdl_pr2 FROM l_sql 

   #客戶訂購單號
   LET l_sql = " SELECT xmda033 FROM xmda_t WHERE xmdaent = ",g_enterprise," AND xmdadocno = ? "
   PREPARE sel_xmda033 FROM l_sql

   LET l_sql = "INSERT INTO xrcd_t(",
               "            xrcdent,xrcdcomp,xrcdld,xrcdsite,xrcddocno,xrcdseq,",
               "            xrcdseq2,xrcdorga,xrcd001,xrcd002,xrcd003,xrcd004,",
               "            xrcd005,xrcd006,xrcd007,xrcd008,xrcd009,xrcd010,",
               "            xrcd100,xrcd101,xrcd102,xrcd103,xrcd104,xrcd105,",
               "            xrcd106,xrcd112,xrcd113,xrcd114,xrcd115,xrcd116,",
               "            xrcd117,xrcd118,xrcd121,xrcd124,xrcd131,xrcd134,",
               "            xrcd123,xrcd125,xrcd133,xrcd135,",
               "            xrcdud001,xrcdud002,xrcdud003,xrcdud004,xrcdud005,xrcdud006,",
               "            xrcdud007,xrcdud008,xrcdud009,xrcdud010,xrcdud011,xrcdud012,",
               "            xrcdud013,xrcdud014,xrcdud015,xrcdud016,xrcdud017,xrcdud018,",
               "            xrcdud019,xrcdud020,xrcdud021,xrcdud022,xrcdud023,xrcdud024,",
               "            xrcdud025,xrcdud026,xrcdud027,xrcdud028,xrcdud029,xrcdud030,",
               "            xrcd011,xrcd012,xrcd013 ) ",
               "SELECT xrcdent,xrcdcomp,?,xrcdsite,?,?,",
               "       xrcdseq2,xrcdorga,?,xrcd002,xrcd003,xrcd004,",
               "       xrcd005,xrcd006,xrcd007,xrcd008,?,xrcd010,",
               "       xrcd100,xrcd101,xrcd102,xrcd103,xrcd104,xrcd105,",
               "       xrcd106,xrcd112,xrcd113,xrcd114,xrcd115,xrcd116,",
               "       xrcd117,xrcd118,xrcd121,xrcd124,xrcd131,xrcd134,",
               "       xrcd123,xrcd125,xrcd133,xrcd135,",
               "       xrcdud001,xrcdud002,xrcdud003,xrcdud004,xrcdud005,xrcdud006,",
               "       xrcdud007,xrcdud008,xrcdud009,xrcdud010,xrcdud011,xrcdud012,",
               "       xrcdud013,xrcdud014,xrcdud015,xrcdud016,xrcdud017,xrcdud018,",
               "       xrcdud019,xrcdud020,xrcdud021,xrcdud022,xrcdud023,xrcdud024,",
               "       xrcdud025,xrcdud026,xrcdud027,xrcdud028,xrcdud029,xrcdud030, ",
               "       xrcd011,xrcd012,xrcd013 ",
               "  FROM xrcd_t ",
               " WHERE xrcdent = ",g_enterprise,
               "   AND xrcddocno = ? ",
               "   AND xrcdseq = ? "
   PREPARE s_axrp132_xrcd_pre2 FROM l_sql
   
   #抓取应收账款金额
   LET l_sql="SELECT ABS(SUM(xrcb103 * xrcb022)),ABS(SUM(xrcb104 * xrcb022)),ABS(SUM(xrcb113 * xrcb022)),ABS(SUM(xrcb114 * xrcb022)),",
             "       ABS(SUM(xrcb123 * xrcb022)),ABS(SUM(xrcb124 * xrcb022)),ABS(SUM(xrcb133 * xrcb022)),ABS(SUM(xrcb134 * xrcb022)) ",                   
             "  FROM xrcb_t",
             " WHERE xrcbent = ",g_enterprise," AND xrcbld = ? AND xrcbdocno = ?"
   PREPARE axrp132_sel_xrcb_pr2 FROM l_sql   
   
   
   --STEP1:找出有混合單據的對帳單(axrp132_c)
   --STEP2:依據單身來源單號+期別拆分立帳單(axrp132_c2)
   ------2.1: l_first記錄是否第一筆立帳單,是:將對帳單的其他加項寫入

   CASE 
      WHEN g_end_prog MATCHES 'axrt300*'
         LET l_xrca001 = '17' #17:發票應收單
      WHEN g_end_prog MATCHES 'axrt310*'
         LET l_xrca001 = '11' #11:訂金預收單
   END CASE

   
   FOREACH axrp132_c INTO l_isagdocno,l_isagcomp
   
      INITIALIZE l_isaf.* TO NULL
      INITIALIZE l_isag.* TO NULL
      LET l_first = 'Y' #紀錄是不是第一筆產生的立帳單
      
      #抓取對帳單單頭资料
      EXECUTE axrp132_sel_isaf_pr2 USING l_isagdocno,l_isagcomp INTO l_isaf.*
      IF g_master.b_comb2 = '1' AND g_date_null = 'Y' THEN
         LET g_master.xrcadocdt = l_isaf.isafdocdt
      END IF   
      
      LET l_doc_success = TRUE
      CALL s_transaction_begin()
      FOREACH axrp132_c2 USING l_isagdocno INTO l_isag002,l_isag011
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.extend = 'foreach axrp132_c2'         
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
            EXIT FOREACH
         END IF
         
         #寫入立帳單單頭
         INITIALIZE g_xrca.* TO NULL         
         LET g_xrca.xrcaent   = g_enterprise
         LET g_xrca.xrcaownid = g_user
         LET g_xrca.xrcaowndp = g_dept
         LET g_xrca.xrcacrtid = g_user
         LET g_xrca.xrcacrtdp = g_dept
         LET g_xrca.xrcacrtdt = cl_get_current()
         LET g_xrca.xrcastus  = 'N'
         LET g_xrca.xrcacomp  = g_glaa.glaacomp  
         LET g_xrca.xrcald    = g_master.xrcald
         CALL s_aooi200_fin_gen_docno(g_master.xrcald,g_glaa.glaa024,g_glaa.glaa003,g_master.xrcadocno,g_master.xrcadocdt,g_end_prog)
              RETURNING l_doc_success,g_xrca.xrcadocno
         IF NOT l_doc_success THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = g_master.xrcadocno
            LET g_errparam.code   = 'aap-00187'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            EXIT FOREACH        
         END IF
         LET g_xrca.xrcadocdt = g_master.xrcadocdt 
         LET g_xrca.xrca001   = l_xrca001
         LET g_xrca.xrcasite  = g_master.xrcasite 
         LET g_xrca.xrca003   = g_user             
         LET g_xrca.xrca004   = l_isaf.isaf003
         CALL axrp132_xrca004_ref(l_isaf.isaf100) RETURNING l_xrca.*
         LET g_xrca.xrca005   = l_isaf.isaf055
         LET g_xrca.xrca006   = l_xrca.xrca006
         IF NOT cl_null(g_master.xrca007) THEN
            LET g_xrca.xrca007 = g_master.xrca007
         ELSE  
            #账款类别取值顺序：單別默認 > 來源單 >對象設定檔  
            CALL s_aooi200_fin_get_doc_default(g_master.xrcasite,'2',g_master.xrcadocno,'xrca007',g_xrca.xrca007,g_master.xrcald) RETURNING g_xrca.xrca007                                                   
            #单别抓取不到预设时，取来源单
            IF cl_null(g_xrca.xrca007) THEN            
               LET g_xrca.xrca007   = l_xrca.xrca007
            END IF
         END IF
                  
         #收款條件
         LET g_xrca.xrca008 = l_isaf.isaf058
         
         #應收日期/票據到期日
         CALL s_fin_date_ar_receivable(g_xrca.xrcasite,g_xrca.xrca004,g_xrca.xrca008,g_xrca.xrcadocdt,
              l_isaf.isaf014,g_xrca.xrcadocdt,g_xrca.xrcadocdt) RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010
         
         IF g_master.b_comb2 = '1' THEN
            LET g_xrca.xrca011   = l_isaf.isaf016
         ELSE
            LET g_xrca.xrca011 = l_xrca.xrca011
         END IF

         
         LET l_xrcd009 = NULL
         LET l_glab001 = '14'
         LET l_glab002 = '2'
         LET l_glab003 = g_xrca.xrca011
         EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO l_xrcd009
        
        IF cl_null(l_xrcd009) THEN 
           LET l_glab001 = '13'
           LET l_glab002 = g_xrca.xrca007
           LET l_glab003 = '8304_29'
           EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO l_xrcd009
        END IF
        
        LET l_oodb004 = NULL
        EXECUTE sel_oodb004 USING g_xrca.xrca011 INTO l_oodb004   
        
        #含稅否/稅率
        IF l_oodb004 = '1' THEN
          EXECUTE sel_oodb003_t01 USING g_xrca.xrca011 INTO g_xrca.xrca013,g_xrca.xrca012
        ELSE
          EXECUTE sel_oodb005 USING g_xrca.xrca011 INTO g_xrca.xrca013,g_xrca.xrca012
        END IF

        #人員編號/部門編號
        CASE g_master.b_comb2
           WHEN '1'
              LET g_xrca.xrca014 = l_isaf.isaf057
              LET g_xrca.xrca015 = l_isaf.isaf004
           WHEN '2'
              LET g_xrca.xrca014 = l_xrca.xrca014
              LET g_xrca.xrca015 = l_xrca.xrca015
           WHEN '3'
              LET g_xrca.xrca014 = l_xrca.xrca014
              LET g_xrca.xrca015 = g_null
           WHEN '4'
              LET g_xrca.xrca014 = l_xrca.xrca014
              LET g_xrca.xrca015 = g_null
        END CASE
        
        #來源作業類型
        LET g_xrca.xrca016 = '12' #銷項發票
        #產生方式
        LET g_xrca.xrca017 = 0 
        #來源參考單號        
        LET g_xrca.xrca018 = l_isagdocno
        LET g_xrca.xrca019 = g_null
        LET g_xrca.xrca020 = 'N'
        #商用發票號碼
        LET g_xrca.xrca021 = l_isaf.isaf066
        #出口報單號碼
        LET g_xrca.xrca022 = l_isaf.isaf064
        #發票客戶編號        
        LET g_xrca.xrca023 = l_isaf.isaf002
        LET g_xrca.xrca024 = g_null
        #發票客戶全名        
        LET g_xrca.xrca025 = l_isaf.isaf021 
        LET g_xrca.xrca026 = g_null
        #發票類型            
        LET g_xrca.xrca028 = l_isaf.isaf008
        #發票匯率            
        LET g_xrca.xrca029 = l_isaf.isaf101
        LET g_xrca.xrca030 = 0
        LET g_xrca.xrca031 = 0
        LET g_xrca.xrca032 = 0
        #專案編號
        EXECUTE sel_xmdl030 USING l_isag002 INTO g_xrca.xrca033
        #責任中心
        EXECUTE sel_ooeg004 USING l_xrca.xrca015 INTO g_xrca.xrca034        
        
        #科目
        LET l_glab001 = '13'
        LET l_glab002 = g_xrca.xrca007
        LET l_glab003 = '8304_01'
        EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO g_xrca.xrca035
        IF l_isaf.isaf001 = '3' AND g_sfin2022 = '02' THEN
           LET l_glab003 = '8304_22'
           EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO g_xrca.xrca036
        ELSE
           LET l_glab003 = '8304_21'
           EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO g_xrca.xrca036
        END IF        
        
        #分錄傳票產生否
        LET g_xrca.xrca037 = l_dfin0030
        LET g_xrca.xrca038 = g_null
        LET g_xrca.xrca039 = 0
        LET g_xrca.xrca040 = 'N'
        LET g_xrca.xrca041 = g_null
        LET g_xrca.xrca042 = g_null
        LET g_xrca.xrca043 = g_null
        LET g_xrca.xrca044 = 0
        LET g_xrca.xrca045 = g_null
        #關係人否            
        LET g_xrca.xrca046 = l_xrca.xrca046
        LET g_xrca.xrca047 = g_null
        LET g_xrca.xrca048 = g_null
        LET g_xrca.xrca049 = g_null
        LET g_xrca.xrca050 = g_null
        LET g_xrca.xrca051 = g_null
        LET g_xrca.xrca052 = 0
        LET g_xrca.xrca053 = g_null
        #多帳期設定
        EXECUTE sel_ooib025 USING g_xrca.xrca008 INTO g_xrca.xrca054        
        LET g_xrca.xrca055 = g_null
        LET g_xrca.xrca056 = g_null
        LET g_xrca.xrca057 = g_null
         
        #銷售分類
        CALL s_apmm101_default_pmab('2',l_controlno,g_site,l_isaf.isaf003) RETURNING g_pmab.*
        LET g_xrca.xrca058 = g_pmab.pmab039
            
        LET g_xrca.xrca059 = g_null
        #發票開立原則
        LET g_xrca.xrca060 = '2'
        #預計開立發票日期
        LET g_xrca.xrca061 = l_xrca.xrca061
        #多角性質
        LET g_xrca.xrca062 = '1'
        LET g_xrca.xrca063 = g_null
        #訂金序次
        LET g_xrca.xrca064 = l_isag011
        #發票編號
        LET g_xrca.xrca065   = l_isaf.isaf010
        #發票號碼
        IF cl_null(l_isaf.isaf011) THEN     
           LET g_xrca.xrca066   = g_xrca.xrca021
        ELSE
           LET g_xrca.xrca066   = l_isaf.isaf011
        END IF
        #交易原幣別
        LET g_xrca.xrca100   = l_isaf.isaf100
        IF g_master.b_comb1 = '1' THEN
           LET g_xrca.xrca101 = l_isaf.isaf101
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
        #交易對象識別碼
        LET l_pmaa004 = NULL
        EXECUTE sel_pmaa004 USING g_xrca.xrca004 INTO l_pmaa004   
        IF l_pmaa004 MATCHES '[24]' THEN
           LET g_xrca.xrca057   = l_isaf.isaf067
        ELSE 
           LET g_xrca.xrca057   = g_xrca.xrca004        
        END IF
         
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

         IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] <> 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = g_master.xrcadocno
            LET g_errparam.code   = 'aap-00187'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
            EXIT FOREACH
         END IF

         #單身處理(訂單)
         INITIALIZE l_tmp.* TO NULL
         FOREACH axrp132_c3 USING l_isagdocno,l_isag002,l_isag011 INTO l_tmp.isagdocno,l_tmp.isagseq

            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = " foreach axrp132_c3 "
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
               EXIT FOREACH
            END IF            
            
            #抓取對帳單單身資料
            INITIALIZE l_isag.* TO NULL            
            EXECUTE axrp132_sel_isag_pr2 USING l_tmp.isagdocno,g_xrca.xrcacomp,l_tmp.isagseq INTO l_isag.*
            
            INITIALIZE g_xrcb.* TO NULL           
            LET g_xrcb.xrcbent = g_enterprise    
            LET g_xrcb.xrcbld  = g_master.xrcald 
            LET g_xrcb.xrcbdocno = g_xrca.xrcadocno            
            EXECUTE sel_max_xrcbseq USING g_xrcb.xrcbld,g_xrcb.xrcbdocno INTO g_xrcb.xrcbseq
            IF cl_null(g_xrcb.xrcbseq) THEN LET g_xrcb.xrcbseq = 1 END IF            
            LET g_xrcb.xrcbsite= g_master.xrcasite 
            LET g_xrcb.xrcborga= l_isaf.isafcomp
            LET g_xrcb.xrcborga= l_isag.isagorga
            LET g_xrcb.xrcb001 = l_isag.isag001        
            LET g_xrcb.xrcb002 = l_isag.isag002
            LET g_xrcb.xrcb003 = l_isag.isag003
            LET g_xrcb.xrcb004 = l_isag.isag009
            
            #訂單單身明細
            EXECUTE axrp132_sel_xmdl_pr2 USING l_isag.isag002,l_isag.isag003      
               INTO l_xmdk003,l_xmdk004_1,l_xmdl003,l_xmdl004,g_xrcb.xrcb015,g_xrcb.xrcb016,
                    l_xmdl050,l_xmdlnum,l_xmdk030,l_xmdl030,l_xmdl031,l_xmdl051            
            
            #品名規格
            CALL s_axrt300_get_xrcb005(g_xrcb.xrcb004) RETURNING g_xrcb.xrcb005
            LET l_imaa004 = NULL
            EXECUTE selimaa_p2 USING g_xrcb.xrcb004 INTO l_imaa004,g_xrcb.xrcb012
            IF l_imaa004 = 'E' THEN #費用類料件
               LET g_xrcb.xrcb005 = l_xmdl051
            END IF
            IF cl_null(g_xrcb.xrcb005) THEN 
               LET g_xrcb.xrcb005 = l_isag.isag010
            END IF

            LET g_xrcb.xrcb006 = l_isag.isag005
            LET g_xrcb.xrcb007 = l_isag.isag004
            LET g_xrcb.xrcb008 = l_xmdl003
            LET g_xrcb.xrcb009 = l_xmdl004          
            LET g_xrcb.xrcblegl= g_xrca.xrcacomp
            LET g_xrcb.xrcb011 = g_xrca.xrca034
            LET g_xrcb.xrcb013 = g_null
            LET g_xrcb.xrcb014 = g_null
            
            LET g_xrcb.xrcb010 = l_xmdk004_1 #出貨單部門
            LET g_xrcb.xrcb051 = l_xmdk003 #出貨單人員
            IF NOT cl_null(l_xmdl003) AND NOT cl_null(l_xmdl004) THEN  #訂單單號，訂單項次
               EXECUTE axrp132_sel_xmda_pr USING l_xmdl003 INTO g_xrcb.xrcb010,g_xrcb.xrcb051 
            END IF
            IF NOT cl_null(l_xmdl030) THEN
               LET g_xrcb.xrcb015 = l_xmdl030
            END IF            
            IF NOT cl_null(l_xmdl031) THEN
               LET g_xrcb.xrcb016 = l_xmdl031
            END IF
            
            LET g_xrcb.xrcb017 = g_null
            LET g_xrcb.xrcb018 = g_null
            LET g_xrcb.xrcb019 = g_null
            LET g_xrcb.xrcb020 = l_isag.isag006
            
            LET l_xmdl014 = NULL LET l_xmdl007 = NULL
            SELECT xmdl014,xmdl007 INTO l_xmdl014,l_xmdl007  
              FROM xmdl_t
             WHERE xmdlent = g_enterprise
               AND xmdldocno = g_xrcb.xrcb002
               AND xmdlseq = g_xrcb.xrcb003
            IF NOT cl_null(g_xrcb.xrcb004) THEN         
               #订单取來源單上的銷售分類
               LET l_xmdk031 = NULL
               SELECT xmda034 INTO l_xmdk031 FROM xmda_t WHERE xmdaent = g_enterprise AND xmdadocno = g_xrcb.xrcb002  
               IF cl_null(l_xmdk031) THEN 
                  LET l_xmdk031 = g_xrca.xrca058  
               END IF
               LET l_imaf111 = NULL
               SELECT imaf111 INTO l_imaf111 FROM imaf_t 
                WHERE imafent = g_enterprise AND imaf001 = g_xrcb.xrcb004
                  AND imafsite = (SELECT glaacomp FROM glaa_t WHERE glaaent=g_enterprise AND glaald=g_xrcb.xrcbld) 
               IF NOT cl_null(l_imaf111) THEN
                  LET l_kind = l_xmdk031,"@",l_imaf111
               ELSE 
                  LET l_kind = l_xmdk031            
               END IF          
               IF l_xmdl007 = '9' THEN
                  CALL s_get_item_acc(g_xrca.xrcald,'30',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)
                   RETURNING l_success,g_xrcb.xrcb021 
               ELSE
                   CALL s_get_item_acc(g_xrca.xrcald,'4',g_xrcb.xrcb004,l_kind,g_xrcb.xrcb034,'',l_xmdl014)
                   RETURNING g_sub_success,g_xrcb.xrcb021 
               END IF              
            END IF 
            IF cl_null(g_xrcb.xrcb021) THEN
               LET g_xrcb.xrcb021 = g_xrca.xrca036
            END IF
                        
            IF l_isaf.isaf001 = '3' AND g_sfin2022 = '02' THEN
               LET l_glab001 = '13'
               LET l_glab002 = g_xrca.xrca007               
               LET l_glab003 = '8304_22'
               EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO g_xrcb.xrcb021
            END IF
            
            LET g_xrcb.xrcb022 = l_isag.isag015
            LET g_xrcb.xrcb024 = g_null
            LET g_xrcb.xrcb025 = g_null
            LET g_xrcb.xrcb026 = g_null            
            LET g_xrcb.xrcb027 = l_isaf.isaf010
            LET g_xrcb.xrcb028 = l_isaf.isaf011            
            LET g_xrcb.xrcb029 = g_xrca.xrca035
            LET g_xrcb.xrcb030 = 0
            LET g_xrcb.xrcb049 = l_isag.isagdocno
            LET g_xrcb.xrcb050 = l_isag.isagseq
            #收款條件
            LET g_xrcb.xrcb031 = g_xrca.xrca008            
            LET g_xrcb.xrcb100 = g_xrca.xrca100
            LET g_xrcb.xrcb101 = l_isag.isag101
            LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101
            CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111
            EXECUTE s_axrp132_xrcd_pre2 USING g_xrca.xrcald,g_xrca.xrcadocno,g_xrcb.xrcbseq,g_end_prog,l_xrcd009,
                                              l_isag.isagdocno,l_isag.isagseq
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'ins xrcd_t:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
               EXIT FOREACH
            END IF
                                        
            LET g_xrcb.xrcb103 = l_isag.isag103
            LET g_xrcb.xrcb104 = l_isag.isag104
            LET g_xrcb.xrcb105 = l_isag.isag105
            LET g_xrcb.xrcb113 = l_isag.isag113
            LET g_xrcb.xrcb114 = l_isag.isag114
            LET g_xrcb.xrcb115 = l_isag.isag115
            IF g_glaa.glaa015 = 'Y' THEN
               IF g_glaa.glaa017 = '1' THEN
                  LET g_xrcb.xrcb123 = g_xrcb.xrcb103 * g_xrca.xrca121
                  LET g_xrcb.xrcb124 = g_xrcb.xrcb104 * g_xrca.xrca121
                  LET g_xrcb.xrcb125 = g_xrcb.xrcb105 * g_xrca.xrca121
               ELSE
                  LET g_xrcb.xrcb123 = g_xrcb.xrcb113 * g_xrca.xrca121
                  LET g_xrcb.xrcb124 = g_xrcb.xrcb114 * g_xrca.xrca121
                  LET g_xrcb.xrcb125 = g_xrcb.xrcb115 * g_xrca.xrca121
               END IF
            END IF
            IF g_glaa.glaa019 = 'Y' THEN
               IF g_glaa.glaa021 = '1' THEN
                  LET g_xrcb.xrcb133 = g_xrcb.xrcb103 * g_xrca.xrca131
                  LET g_xrcb.xrcb134 = g_xrcb.xrcb104 * g_xrca.xrca131
                  LET g_xrcb.xrcb135 = g_xrcb.xrcb105 * g_xrca.xrca131
               ELSE                                                    
                  LET g_xrcb.xrcb133 = g_xrcb.xrcb113 * g_xrca.xrca131
                  LET g_xrcb.xrcb134 = g_xrcb.xrcb114 * g_xrca.xrca131
                  LET g_xrcb.xrcb135 = g_xrcb.xrcb115 * g_xrca.xrca131
               END IF
            END IF
                        
            IF g_xrca.xrca013 = 'Y' THEN
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
            LET g_xrcb.xrcb102 = g_xrca.xrca101 
                        
            CALL s_axrp130_estimate_chk(g_xrcb.xrcbld,g_xrca.xrcadocdt,g_xrca.xrca004,g_xrca.xrca100,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003) RETURNING l_success
            IF NOT l_success THEN      
               LET g_xrcb.xrcb023 = 'N'
            ELSE
               LET g_xrcb.xrcb023 = 'Y'
            END IF

            SELECT xmda023 INTO g_xrcb.xrcb034
              FROM xmda_t
             WHERE xmdaent   = g_enterprise
               AND xmdadocno = g_xrcb.xrcb002

            LET g_xrcb.xrcb053=g_xrca.xrca004
            LET g_xrcb.xrcb054=g_xrca.xrca005
            
            #账款对象，收款对象
            #业务人员，业务部门
            IF cl_null(g_xrcb.xrcb051) THEN
               LET g_xrcb.xrcb051 = g_xrca.xrca014
            END IF
            IF cl_null(g_xrcb.xrcb010) THEN
               LET g_xrcb.xrcb010 = g_xrca.xrca015
            END IF
            #固定核算项默认值
            INITIALIZE l_xrcb2.* TO NULL
            LET l_xrcb2.xrcb053 = g_xrcb.xrcb053
            LET l_xrcb2.xrcb054 = g_xrcb.xrcb054
            LET l_xrcb2.xrcb051 = g_xrcb.xrcb051
            LET l_xrcb2.xrcb010 = g_xrcb.xrcb010
            LET l_xrcb2.xrcb011 = g_xrcb.xrcb011
            LET l_xrcb2.xrcb024 = g_xrcb.xrcb024
            LET l_xrcb2.xrcb036 = g_xrcb.xrcb036 
            LET l_xrcb2.xrcb012 = g_xrcb.xrcb012
            LET l_xrcb2.xrcb033 = g_xrcb.xrcb033
            LET l_xrcb2.xrcb034 = g_xrcb.xrcb034
            LET l_xrcb2.xrcb035 = g_xrcb.xrcb035
            LET l_xrcb2.xrcb015 = g_xrcb.xrcb015
            LET l_xrcb2.xrcb016 = g_xrcb.xrcb016
            
            CALL s_axrp133_get_accitem(g_xrcb.xrcbld,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb2.*)
               RETURNING g_xrcb.xrcb053,g_xrcb.xrcb054,g_xrcb.xrcb051,g_xrcb.xrcb010,g_xrcb.xrcb011,
                         g_xrcb.xrcb024,g_xrcb.xrcb036,g_xrcb.xrcb012,g_xrcb.xrcb033,g_xrcb.xrcb034,
                         g_xrcb.xrcb035,g_xrcb.xrcb015,g_xrcb.xrcb016           
            #如果agli051跟axmm200都有維護則以agli051為優先
            IF cl_null(g_xrcb.xrcb036) THEN
               LET g_xrcb.xrcb036 = g_xrca.xrca006  
            END IF            
            IF cl_null(g_xrcb.xrcb035) THEN
            #如果aimm200 跟agli051都有維護的話，就先抓agli051的
               SELECT imaa126 INTO l_xrcb035 FROM imaa_t 
                WHERE imaaent = g_enterprise
                  AND imaa001 = g_xrcb.xrcb004
               LET g_xrcb.xrcb035 = l_xrcb035
            END IF

            IF l_sfin9025 = 'Y' THEN 
               IF cl_null(g_xrcb.xrcb015) THEN LET g_xrcb.xrcb015 = l_xrcb2.xrcb015 END IF
               IF cl_null(g_xrcb.xrcb016) THEN LET g_xrcb.xrcb016 = l_xrcb2.xrcb016 END IF
            END IF
            
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
            
            IF NOT cl_null(l_isag.isag022) AND NOT cl_null(l_isag.isag023) THEN
               LET g_xrcb.xrcb015 = l_isag.isag022
               LET g_xrcb.xrcb016 = l_isag.isag023  
            END IF         
                        
            EXECUTE sel_xmda033 USING g_xrcb.xrcb002 INTO g_xrcb.xrcb048                                     
            
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
            
            IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] <> 1 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = g_master.xrcadocno
               LET g_errparam.code   = 'aap-00187'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
               EXIT FOREACH
            END IF
                        
            #自由核算项默认值
            INITIALIZE l_xrcb3.* TO NULL
            LET l_xrcb3.xrcb037= g_xrcb.xrcb037
            LET l_xrcb3.xrcb038= g_xrcb.xrcb038
            LET l_xrcb3.xrcb039= g_xrcb.xrcb039
            LET l_xrcb3.xrcb040= g_xrcb.xrcb040
            LET l_xrcb3.xrcb041= g_xrcb.xrcb041
            LET l_xrcb3.xrcb042= g_xrcb.xrcb042
            LET l_xrcb3.xrcb043= g_xrcb.xrcb043
            LET l_xrcb3.xrcb044= g_xrcb.xrcb044
            LET l_xrcb3.xrcb045= g_xrcb.xrcb045
            LET l_xrcb3.xrcb046= g_xrcb.xrcb046
            CALL s_axrp133_get_accitem_free(g_end_prog,g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb3.*)  
                        
            #有作沖暫估時,不處理遞延寫入;因為在立暫估的時候已經處理
            IF g_xrcb.xrcb023 = 'N' AND g_glaa.glaa139 = 'Y' THEN
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
                  EXIT FOREACH
               END IF
            END IF            
         END FOREACH
         
         IF NOT l_doc_success THEN
            EXIT FOREACH
         END IF

         IF l_first = 'Y' THEN #若為aapt110第一筆單身資料,寫入加項&發票資訊
            INITIALIZE l_tmp.* TO NULL
            FOREACH axrp132_c4 USING l_isagdocno INTO l_tmp.isagdocno,l_tmp.isagseq

               #抓取對帳單單身資料
               INITIALIZE l_isag.* TO NULL            
               EXECUTE axrp132_sel_isag_pr2 USING l_tmp.isagdocno,g_xrca.xrcacomp,l_tmp.isagseq INTO l_isag.*
               
               INITIALIZE g_xrcb.* TO NULL           
               LET g_xrcb.xrcbent = g_enterprise    
               LET g_xrcb.xrcbld  = g_master.xrcald 
               LET g_xrcb.xrcbdocno = g_xrca.xrcadocno            
               EXECUTE sel_max_xrcbseq USING g_xrcb.xrcbld,g_xrcb.xrcbdocno INTO g_xrcb.xrcbseq
               IF cl_null(g_xrcb.xrcbseq) THEN LET g_xrcb.xrcbseq = 1 END IF            
               LET g_xrcb.xrcbsite= g_master.xrcasite 
               LET g_xrcb.xrcborga= l_isaf.isafcomp
               LET g_xrcb.xrcborga= l_isag.isagorga
               LET g_xrcb.xrcb001 = l_isag.isag001        
               LET g_xrcb.xrcb002 = l_isag.isag002
               LET g_xrcb.xrcb003 = l_isag.isag003
               LET g_xrcb.xrcb004 = l_isag.isag009
               
               #訂單單身明細
               EXECUTE axrp132_sel_xmdl_pr2 USING l_isag.isag002,l_isag.isag003      
                  INTO l_xmdk003,l_xmdk004_1,l_xmdl003,l_xmdl004,g_xrcb.xrcb015,g_xrcb.xrcb016,
                       l_xmdl050,l_xmdlnum,l_xmdk030,l_xmdl030,l_xmdl031,l_xmdl051            
               
               LET g_xrcb.xrcb005 = l_isag.isag010
               #品名規格
               LET l_imaa004 = NULL
               EXECUTE selimaa_p2 USING g_xrcb.xrcb004 INTO l_imaa004,g_xrcb.xrcb012
               IF l_imaa004 = 'E' AND NOT cl_null(l_xmdl051) THEN #費用類料件
                  LET g_xrcb.xrcb005 = l_xmdl051
               END IF
               LET g_xrcb.xrcb006 = l_isag.isag005
               LET g_xrcb.xrcb007 = l_isag.isag004
               LET g_xrcb.xrcb008 = l_xmdl003
               LET g_xrcb.xrcb009 = l_xmdl004      
               LET g_xrcb.xrcblegl= g_xrca.xrcacomp
               LET g_xrcb.xrcb011 = g_xrca.xrca034
               LET g_xrcb.xrcb013 = '' 
               LET g_xrcb.xrcb014 = ''
               IF cl_null(l_xmdl030) THEN
                  LET g_xrcb.xrcb015 = l_isag.isag022 
               ELSE
                  LET g_xrcb.xrcb015 = l_xmdl030
               END IF
               IF cl_null(l_xmdl031) THEN
                  LET g_xrcb.xrcb016 = l_isag.isag023
               ELSE
                  LET g_xrcb.xrcb016 = l_xmdl031
               END IF
               LET g_xrcb.xrcb017 = g_null
               LET g_xrcb.xrcb018 = g_null
               LET g_xrcb.xrcb019 = g_null
               LET g_xrcb.xrcb020 = l_isag.isag006
               LET g_xrcb.xrcb021 = g_xrca.xrca036

               IF l_isaf.isaf001 = '3' AND g_sfin2022 = '02' THEN
                  LET l_glab001 = '13'
                  LET l_glab002 = g_xrca.xrca007               
                  LET l_glab003 = '8304_22'
                  EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO g_xrcb.xrcb021
               END IF               
               LET g_xrcb.xrcb022 = l_isag.isag015
               LET g_xrcb.xrcb024 = g_null
               LET g_xrcb.xrcb025 = g_null
               LET g_xrcb.xrcb026 = g_null
               LET g_xrcb.xrcb027 = l_isaf.isaf010
               LET g_xrcb.xrcb028 = l_isaf.isaf011
               LET g_xrcb.xrcb029 = g_xrca.xrca035
               LET g_xrcb.xrcb030 = 0
               LET g_xrcb.xrcb049 = l_isag.isagdocno
               LET g_xrcb.xrcb050 = l_isag.isagseq              
               LET g_xrcb.xrcb031 = g_xrca.xrca008 #收款條件               
               LET g_xrcb.xrcb100 = g_xrca.xrca100
               LET g_xrcb.xrcb101 = l_isag.isag101
               LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101
               CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111
               EXECUTE s_axrp132_xrcd_pre2 USING g_xrca.xrcald,g_xrca.xrcadocno,g_xrcb.xrcbseq,g_end_prog,l_xrcd009,
                                                 l_isag.isagdocno,l_isag.isagseq
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'ins xrcd_t:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
                  EXIT FOREACH
               END IF                               
               LET g_xrcb.xrcb103 = l_isag.isag103
               LET g_xrcb.xrcb104 = l_isag.isag104
               LET g_xrcb.xrcb105 = l_isag.isag105
               LET g_xrcb.xrcb113 = l_isag.isag113
               LET g_xrcb.xrcb114 = l_isag.isag114
               LET g_xrcb.xrcb115 = l_isag.isag115
               IF g_glaa.glaa015 = 'Y' THEN
                  IF g_glaa.glaa017 = '1' THEN
                     LET g_xrcb.xrcb123 = g_xrcb.xrcb103 * g_xrca.xrca121
                     LET g_xrcb.xrcb124 = g_xrcb.xrcb104 * g_xrca.xrca121
                     LET g_xrcb.xrcb125 = g_xrcb.xrcb105 * g_xrca.xrca121
                  ELSE
                     LET g_xrcb.xrcb123 = g_xrcb.xrcb113 * g_xrca.xrca121
                     LET g_xrcb.xrcb124 = g_xrcb.xrcb114 * g_xrca.xrca121
                     LET g_xrcb.xrcb125 = g_xrcb.xrcb115 * g_xrca.xrca121
                  END IF
               END IF
               IF g_glaa.glaa019 = 'Y' THEN
                  IF g_glaa.glaa021 = '1' THEN
                     LET g_xrcb.xrcb133 = g_xrcb.xrcb103 * g_xrca.xrca131
                     LET g_xrcb.xrcb134 = g_xrcb.xrcb104 * g_xrca.xrca131
                     LET g_xrcb.xrcb135 = g_xrcb.xrcb105 * g_xrca.xrca131
                  ELSE                                                    
                     LET g_xrcb.xrcb133 = g_xrcb.xrcb113 * g_xrca.xrca131
                     LET g_xrcb.xrcb134 = g_xrcb.xrcb114 * g_xrca.xrca131
                     LET g_xrcb.xrcb135 = g_xrcb.xrcb115 * g_xrca.xrca131
                  END IF
               END IF
                           
               IF g_xrca.xrca013 = 'Y' THEN
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
               LET g_xrcb.xrcb102 = g_xrca.xrca101 
               
               #判斷有無暫估
               CALL s_axrp130_estimate_chk(g_xrcb.xrcbld,g_xrca.xrcadocdt,g_xrca.xrca004,g_xrca.xrca100,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003) RETURNING l_success
               IF NOT l_success THEN      
                  LET g_xrcb.xrcb023 = 'N'
               ELSE
                  LET g_xrcb.xrcb023 = 'Y'
               END IF                          
               LET g_xrcb.xrcb053=g_xrca.xrca004
               LET g_xrcb.xrcb054=g_xrca.xrca005
               
               #账款对象，收款对象
               #业务人员，业务部门
               IF cl_null(g_xrcb.xrcb051) THEN
                  LET g_xrcb.xrcb051 = g_xrca.xrca014
               END IF
               IF cl_null(g_xrcb.xrcb010) THEN
                  LET g_xrcb.xrcb010 = g_xrca.xrca015
               END IF
               #固定核算项默认值
               INITIALIZE l_xrcb2.* TO NULL
               LET l_xrcb2.xrcb053 = g_xrcb.xrcb053
               LET l_xrcb2.xrcb054 = g_xrcb.xrcb054
               LET l_xrcb2.xrcb051 = g_xrcb.xrcb051
               LET l_xrcb2.xrcb010 = g_xrcb.xrcb010
               LET l_xrcb2.xrcb011 = g_xrcb.xrcb011
               LET l_xrcb2.xrcb024 = g_xrcb.xrcb024
               LET l_xrcb2.xrcb036 = g_xrcb.xrcb036 
               LET l_xrcb2.xrcb012 = g_xrcb.xrcb012
               LET l_xrcb2.xrcb033 = g_xrcb.xrcb033
               LET l_xrcb2.xrcb034 = g_xrcb.xrcb034
               LET l_xrcb2.xrcb035 = g_xrcb.xrcb035
               LET l_xrcb2.xrcb015 = g_xrcb.xrcb015
               LET l_xrcb2.xrcb016 = g_xrcb.xrcb016
               
               CALL s_axrp133_get_accitem(g_xrcb.xrcbld,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb2.*)
                  RETURNING g_xrcb.xrcb053,g_xrcb.xrcb054,g_xrcb.xrcb051,g_xrcb.xrcb010,g_xrcb.xrcb011,
                            g_xrcb.xrcb024,g_xrcb.xrcb036,g_xrcb.xrcb012,g_xrcb.xrcb033,g_xrcb.xrcb034,
                            g_xrcb.xrcb035,g_xrcb.xrcb015,g_xrcb.xrcb016
               IF cl_null(g_xrcb.xrcb036) THEN
                  LET g_xrcb.xrcb036 = g_xrca.xrca006  
               END IF
               IF cl_null(g_xrcb.xrcb035) THEN
               #如果aimm200 跟agli051都有維護的話，就先抓agli051的
                  SELECT imaa126 INTO l_xrcb035 FROM imaa_t 
                   WHERE imaaent = g_enterprise
                     AND imaa001 = g_xrcb.xrcb004
                  LET g_xrcb.xrcb035 = l_xrcb035
               END IF
               IF l_sfin9025 = 'Y' THEN 
                  IF cl_null(g_xrcb.xrcb015) THEN LET g_xrcb.xrcb015 = l_xrcb2.xrcb015 END IF
                  IF cl_null(g_xrcb.xrcb016) THEN LET g_xrcb.xrcb016 = l_xrcb2.xrcb016 END IF
               END IF
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
               IF NOT cl_null(l_isag.isag022) AND NOT cl_null(l_isag.isag023) THEN
                  LET g_xrcb.xrcb015 = l_isag.isag022
                  LET g_xrcb.xrcb016 = l_isag.isag023  
               END IF
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
               IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] <> 1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_master.xrcadocno
                  LET g_errparam.code   = 'aap-00187'
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
                  EXIT FOREACH
               END IF
               
               #自由核算项默认值
               INITIALIZE l_xrcb3.* TO NULL
               LET l_xrcb3.xrcb037= g_xrcb.xrcb037
               LET l_xrcb3.xrcb038= g_xrcb.xrcb038
               LET l_xrcb3.xrcb039= g_xrcb.xrcb039
               LET l_xrcb3.xrcb040= g_xrcb.xrcb040
               LET l_xrcb3.xrcb041= g_xrcb.xrcb041
               LET l_xrcb3.xrcb042= g_xrcb.xrcb042
               LET l_xrcb3.xrcb043= g_xrcb.xrcb043
               LET l_xrcb3.xrcb044= g_xrcb.xrcb044
               LET l_xrcb3.xrcb045= g_xrcb.xrcb045
               LET l_xrcb3.xrcb046= g_xrcb.xrcb046
               CALL s_axrp133_get_accitem_free(g_end_prog,g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb3.*)
               
               #有作沖暫估時,不處理遞延寫入;因為在立暫估的時候已經處理
               IF g_xrcb.xrcb023 = 'N' AND g_glaa.glaa139 = 'Y' THEN
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
                     EXIT FOREACH
                  END IF
               END IF            
            END FOREACH #其他加項寫入立帳單身     

         END IF
         LET l_first = 'N'

         IF NOT l_doc_success THEN
            EXIT FOREACH
         END IF

      END FOREACH
      
      IF NOT l_doc_success THEN
         EXIT FOREACH
      END IF      
      
      #處理aist310減項:依aist310單身項次逐筆寫入
      LET l_cnt29 = 0
      SELECT COUNT(1) INTO l_cnt29
        FROM axrp132_tmp02
       WHERE isagdocno = l_isagdocno AND isag001 = '29'
      IF l_cnt29 > 0 THEN
         #取axrp132_tmp02中減項的項次和原幣含稅金額
         INITIALIZE l_tmp.* TO NULL
         FOREACH axrp132_c5 USING l_isagdocno INTO l_tmp.isagseq,l_tmp.isag103,l_tmp.isag105,l_tmp.isag004
         
            #抓取對帳單單身資料
            INITIALIZE l_isag.* TO NULL            
            EXECUTE axrp132_sel_isag_pr2 USING l_isagdocno,g_xrca.xrcacomp,l_tmp.isagseq INTO l_isag.*
            
            LET l_cal_isag103 = l_tmp.isag103
            LET l_cal_isag105 = l_tmp.isag105
            
            #取用此aist310單產的axrt310單&本幣含稅合計
            FOREACH axrp132_c6 USING l_isagdocno INTO l_xrcadocno,l_sum_xrcb103,l_sum_xrcb105
               INITIALIZE g_xrca TO NULL
               EXECUTE sel_xrca_pre USING g_master.xrcald,l_xrcadocno INTO g_xrca.*
               
               IF l_sum_xrcb105 > 0 AND l_cal_isag105 > 0 THEN #寫入減項資訊
               
                  #抓取對帳單單身資料
                  INITIALIZE l_isag.* TO NULL            
                  EXECUTE axrp132_sel_isag_pr2 USING l_isagdocno,g_xrca.xrcacomp,l_tmp.isagseq INTO l_isag.*
                  
                  INITIALIZE g_xrcb.* TO NULL           
                  LET g_xrcb.xrcbent = g_enterprise    
                  LET g_xrcb.xrcbld  = g_master.xrcald 
                  LET g_xrcb.xrcbdocno = l_xrcadocno       
                  EXECUTE sel_max_xrcbseq USING g_xrcb.xrcbld,l_xrcadocno INTO g_xrcb.xrcbseq
                  IF cl_null(g_xrcb.xrcbseq) THEN LET g_xrcb.xrcbseq = 1 END IF            
                  LET g_xrcb.xrcbsite= g_master.xrcasite 
                  LET g_xrcb.xrcborga= l_isaf.isafcomp
                  LET g_xrcb.xrcborga= l_isag.isagorga
                  LET g_xrcb.xrcb001 = l_isag.isag001        
                  LET g_xrcb.xrcb002 = l_isag.isag002
                  LET g_xrcb.xrcb003 = l_isag.isag003
                  LET g_xrcb.xrcb004 = l_isag.isag009
                  
                  LET l_xrcd009 = NULL
                  LET l_glab001 = '14'
                  LET l_glab002 = '2'
                  LET l_glab003 = g_xrca.xrca011
                  EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO l_xrcd009
                  
                  #訂單單身明細
                  EXECUTE axrp132_sel_xmdl_pr2 USING l_isag.isag002,l_isag.isag003      
                     INTO l_xmdk003,l_xmdk004_1,l_xmdl003,l_xmdl004,g_xrcb.xrcb015,g_xrcb.xrcb016,
                          l_xmdl050,l_xmdlnum,l_xmdk030,l_xmdl030,l_xmdl031,l_xmdl051            
                  
                  LET g_xrcb.xrcb005 = l_isag.isag010
                  #品名規格
                  LET l_imaa004 = NULL
                  EXECUTE selimaa_p2 USING g_xrcb.xrcb004 INTO l_imaa004,g_xrcb.xrcb012
                  IF l_imaa004 = 'E' AND NOT cl_null(l_xmdl051) THEN #費用類料件
                     LET g_xrcb.xrcb005 = l_xmdl051
                  END IF
                  LET g_xrcb.xrcb006 = l_isag.isag005
                  
                  IF l_sum_xrcb105 > l_cal_isag105 AND l_cal_isag105 = l_tmp.isag105 THEN
                     LET g_xrcb.xrcb007 = l_tmp.isag004 #預設值
                  ELSE
                     LET g_xrcb.xrcb007 = 1   #數量給1
                  END IF                  
                  LET g_xrcb.xrcb008 = l_xmdl003
                  LET g_xrcb.xrcb009 = l_xmdl004      
                  LET g_xrcb.xrcblegl= g_xrca.xrcacomp
                  LET g_xrcb.xrcb011 = g_xrca.xrca034
                  LET g_xrcb.xrcb013 = g_null 
                  LET g_xrcb.xrcb014 = g_null
                  IF cl_null(l_xmdl030) THEN
                     LET g_xrcb.xrcb015 = l_isag.isag022 
                  ELSE
                     LET g_xrcb.xrcb015 = l_xmdl030
                  END IF
                  IF cl_null(l_xmdl031) THEN
                     LET g_xrcb.xrcb016 = l_isag.isag023
                  ELSE
                     LET g_xrcb.xrcb016 = l_xmdl031
                  END IF
                  LET g_xrcb.xrcb017 = g_null
                  LET g_xrcb.xrcb018 = g_null
                  LET g_xrcb.xrcb019 = g_null
                  LET g_xrcb.xrcb020 = l_isag.isag006
                  LET g_xrcb.xrcb021 = g_xrca.xrca036
                  
                  IF l_isaf.isaf001 = '3' AND g_sfin2022 = '02' THEN
                     LET l_glab001 = '13'
                     LET l_glab002 = g_xrca.xrca007               
                     LET l_glab003 = '8304_22'
                     EXECUTE axrp132_sel_glab_pr2 USING l_glab001,l_glab002,l_glab003 INTO g_xrcb.xrcb021
                  END IF               
                  LET g_xrcb.xrcb022 = l_isag.isag015
                  LET g_xrcb.xrcb024 = g_null
                  LET g_xrcb.xrcb025 = g_null
                  LET g_xrcb.xrcb026 = g_null
                  LET g_xrcb.xrcb027 = l_isaf.isaf010
                  LET g_xrcb.xrcb028 = l_isaf.isaf011
                  LET g_xrcb.xrcb029 = g_xrca.xrca035
                  LET g_xrcb.xrcb030 = 0
                  LET g_xrcb.xrcb049 = l_isag.isagdocno
                  LET g_xrcb.xrcb050 = l_isag.isagseq              
                  LET g_xrcb.xrcb031 = g_xrca.xrca008 #收款條件               
                  LET g_xrcb.xrcb100 = g_xrca.xrca100
                  LET g_xrcb.xrcb101 = l_isag.isag101
                  EXECUTE s_axrp132_xrcd_pre2 USING g_xrca.xrcald,g_xrca.xrcadocno,g_xrcb.xrcbseq,g_end_prog,l_xrcd009,
                                                    l_isag.isagdocno,l_isag.isagseq
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = 'ins xrcd_t:'
                     LET g_errparam.code   = SQLCA.SQLCODE
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     LET l_doc_success = FALSE
                     EXIT FOREACH
                  END IF
                  
                  IF l_sum_xrcb105 > l_cal_isag105 AND l_cal_isag105 = l_tmp.isag105 THEN
                     LET l_xrcb105 = g_xrcb.xrcb007 * g_xrcb.xrcb101
                     CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,l_xrcb105,2) RETURNING g_success,g_errno,l_xrcb105
                  ELSE
                     IF g_xrca.xrca013 = 'Y' THEN #含稅
                        IF l_sum_xrcb105 > l_cal_isag105 THEN
                           LET l_xrcb105 = l_cal_isag105
                        ELSE
                           LET l_xrcb105 = l_sum_xrcb105
                        END IF
                     ELSE #不含稅
                        IF l_sum_xrcb105 > l_cal_isag105 THEN
                           LET l_xrcb105 = l_cal_isag103
                        ELSE
                           LET l_xrcb105 = l_sum_xrcb103
                        END IF
                     END IF                     
                  END IF                  
                  CALL s_tax_ins2(g_xrcb.xrcbdocno,g_xrcb.xrcbseq,'0',g_xrcb.xrcborga,l_xrcb105,  
                                  g_xrcb.xrcb020,g_xrcb.xrcb007,g_xrcb.xrcb100,g_xrca.xrca101,g_xrcb.xrcbld,g_xrca.xrca121,g_xrca.xrca131)
                       RETURNING g_xrcb.xrcb103,g_xrcb.xrcb104,g_xrcb.xrcb105,
                                 g_xrcb.xrcb113,g_xrcb.xrcb114,g_xrcb.xrcb115,
                                 g_xrcb.xrcb123,g_xrcb.xrcb124,g_xrcb.xrcb125,
                                 g_xrcb.xrcb133,g_xrcb.xrcb134,g_xrcb.xrcb135
                                 
                  LET g_xrcb.xrcb121 = g_xrca.xrca121
                  LET g_xrcb.xrcb131 = g_xrca.xrca131        
                  #減項有拆單的時候,依含稅否給予拆分後的含/未稅金額                  
                  IF l_sum_xrcb105 < l_cal_isag105 OR l_cal_isag105 <> l_tmp.isag105 THEN 
                     IF g_xrca.xrca013 = 'Y' THEN #含稅
                        LET g_xrcb.xrcb101 = g_xrcb.xrcb105
                     ELSE
                        LET g_xrcb.xrcb101 = g_xrcb.xrcb103
                     END IF
                  END IF                    
                                    
                  IF l_sum_xrcb105 > l_cal_isag105 AND l_cal_isag105 = l_tmp.isag105 THEN
                     IF g_xrca.xrca100 <> g_glaa.glaa001 THEN                   
                        IF g_xrca.xrca013 = 'Y' THEN
                           LET g_xrcb.xrcb111 = g_xrcb.xrcb115 / g_xrcb.xrcb007
                        ELSE
                           LET g_xrcb.xrcb111 = g_xrcb.xrcb113 / g_xrcb.xrcb007
                        END IF
                     ELSE
                        LET g_xrcb.xrcb111 = g_xrcb.xrcb101
                     END IF
                  ELSE
                     LET g_xrcb.xrcb111 = g_xrcb.xrcb101 * g_xrca.xrca101     #本幣單價   
                  END IF
                  CALL s_curr_round_ld("1",g_xrcb.xrcbld,g_glaa.glaa001,g_xrcb.xrcb111,1) RETURNING g_success,g_errno,g_xrcb.xrcb111
                                   
                  IF g_glaa.glaa015 = 'Y' THEN
                     IF g_glaa.glaa017 = '1' THEN
                        LET g_xrcb.xrcb123 = g_xrcb.xrcb103 * g_xrca.xrca121
                        LET g_xrcb.xrcb124 = g_xrcb.xrcb104 * g_xrca.xrca121
                        LET g_xrcb.xrcb125 = g_xrcb.xrcb105 * g_xrca.xrca121
                     ELSE
                        LET g_xrcb.xrcb123 = g_xrcb.xrcb113 * g_xrca.xrca121
                        LET g_xrcb.xrcb124 = g_xrcb.xrcb114 * g_xrca.xrca121
                        LET g_xrcb.xrcb125 = g_xrcb.xrcb115 * g_xrca.xrca121
                     END IF
                  END IF
                  IF g_glaa.glaa019 = 'Y' THEN
                     IF g_glaa.glaa021 = '1' THEN
                        LET g_xrcb.xrcb133 = g_xrcb.xrcb103 * g_xrca.xrca131
                        LET g_xrcb.xrcb134 = g_xrcb.xrcb104 * g_xrca.xrca131
                        LET g_xrcb.xrcb135 = g_xrcb.xrcb105 * g_xrca.xrca131
                     ELSE                                                    
                        LET g_xrcb.xrcb133 = g_xrcb.xrcb113 * g_xrca.xrca131
                        LET g_xrcb.xrcb134 = g_xrcb.xrcb114 * g_xrca.xrca131
                        LET g_xrcb.xrcb135 = g_xrcb.xrcb115 * g_xrca.xrca131
                     END IF
                  END IF
                                   
                  LET g_xrcb.xrcb106 = 0
                  LET g_xrcb.xrcb116 = 0
                  LET g_xrcb.xrcb117 = 0
                  LET g_xrcb.xrcb118 = g_xrcb.xrcb113
                  LET g_xrcb.xrcb119 = g_xrcb.xrcb115
                  LET g_xrcb.xrcb126 = 0
                  LET g_xrcb.xrcb136 = 0
                  LET g_xrcb.xrcb102 = g_xrca.xrca101 
                  
                  LET g_xrcb.xrcb023 = 'N'
                  IF l_sum_xrcb105 > l_cal_isag105 THEN
                     #判斷有無暫估
                     CALL s_axrp130_estimate_chk(g_xrcb.xrcbld,g_xrca.xrcadocdt,g_xrca.xrca004,g_xrca.xrca100,g_xrcb.xrcb001,g_xrcb.xrcb002,g_xrcb.xrcb003) RETURNING l_success
                     IF NOT l_success THEN      
                        LET g_xrcb.xrcb023 = 'N'
                     ELSE
                        LET g_xrcb.xrcb023 = 'Y'
                     END IF
                  END IF                     
                  LET g_xrcb.xrcb053=g_xrca.xrca004
                  LET g_xrcb.xrcb054=g_xrca.xrca005
                  
                  #账款对象，收款对象
                  #业务人员，业务部门
                  IF cl_null(g_xrcb.xrcb051) THEN
                     LET g_xrcb.xrcb051 = g_xrca.xrca014
                  END IF
                  IF cl_null(g_xrcb.xrcb010) THEN
                     LET g_xrcb.xrcb010 = g_xrca.xrca015
                  END IF
                  #固定核算项默认值
                  INITIALIZE l_xrcb2.* TO NULL
                  LET l_xrcb2.xrcb053 = g_xrcb.xrcb053
                  LET l_xrcb2.xrcb054 = g_xrcb.xrcb054
                  LET l_xrcb2.xrcb051 = g_xrcb.xrcb051
                  LET l_xrcb2.xrcb010 = g_xrcb.xrcb010
                  LET l_xrcb2.xrcb011 = g_xrcb.xrcb011
                  LET l_xrcb2.xrcb024 = g_xrcb.xrcb024
                  LET l_xrcb2.xrcb036 = g_xrcb.xrcb036 
                  LET l_xrcb2.xrcb012 = g_xrcb.xrcb012
                  LET l_xrcb2.xrcb033 = g_xrcb.xrcb033
                  LET l_xrcb2.xrcb034 = g_xrcb.xrcb034
                  LET l_xrcb2.xrcb035 = g_xrcb.xrcb035
                  LET l_xrcb2.xrcb015 = g_xrcb.xrcb015
                  LET l_xrcb2.xrcb016 = g_xrcb.xrcb016
                  
                  CALL s_axrp133_get_accitem(g_xrcb.xrcbld,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb2.*)
                     RETURNING g_xrcb.xrcb053,g_xrcb.xrcb054,g_xrcb.xrcb051,g_xrcb.xrcb010,g_xrcb.xrcb011,
                               g_xrcb.xrcb024,g_xrcb.xrcb036,g_xrcb.xrcb012,g_xrcb.xrcb033,g_xrcb.xrcb034,
                               g_xrcb.xrcb035,g_xrcb.xrcb015,g_xrcb.xrcb016
                  IF cl_null(g_xrcb.xrcb036) THEN
                     LET g_xrcb.xrcb036 = g_xrca.xrca006  
                  END IF
                  IF cl_null(g_xrcb.xrcb035) THEN
                  #如果aimm200 跟agli051都有維護的話，就先抓agli051的
                     SELECT imaa126 INTO l_xrcb035 FROM imaa_t 
                      WHERE imaaent = g_enterprise
                        AND imaa001 = g_xrcb.xrcb004
                     LET g_xrcb.xrcb035 = l_xrcb035
                  END IF
                  IF l_sfin9025 = 'Y' THEN 
                     IF cl_null(g_xrcb.xrcb015) THEN LET g_xrcb.xrcb015 = l_xrcb2.xrcb015 END IF
                     IF cl_null(g_xrcb.xrcb016) THEN LET g_xrcb.xrcb016 = l_xrcb2.xrcb016 END IF
                  END IF
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
                  IF NOT cl_null(l_isag.isag022) AND NOT cl_null(l_isag.isag023) THEN
                     LET g_xrcb.xrcb015 = l_isag.isag022
                     LET g_xrcb.xrcb016 = l_isag.isag023  
                  END IF
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
                  IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] <> 1 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_master.xrcadocno
                     LET g_errparam.code   = 'aap-00187'
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     LET l_doc_success = FALSE
                     EXIT FOREACH
                  END IF
                  
                  #自由核算项默认值
                  INITIALIZE l_xrcb3.* TO NULL
                  LET l_xrcb3.xrcb037= g_xrcb.xrcb037
                  LET l_xrcb3.xrcb038= g_xrcb.xrcb038
                  LET l_xrcb3.xrcb039= g_xrcb.xrcb039
                  LET l_xrcb3.xrcb040= g_xrcb.xrcb040
                  LET l_xrcb3.xrcb041= g_xrcb.xrcb041
                  LET l_xrcb3.xrcb042= g_xrcb.xrcb042
                  LET l_xrcb3.xrcb043= g_xrcb.xrcb043
                  LET l_xrcb3.xrcb044= g_xrcb.xrcb044
                  LET l_xrcb3.xrcb045= g_xrcb.xrcb045
                  LET l_xrcb3.xrcb046= g_xrcb.xrcb046
                  CALL s_axrp133_get_accitem_free(g_end_prog,g_xrcb.xrcbld,g_xrcb.xrcbdocno,g_xrcb.xrcbseq,g_xrcb.xrcb029,g_xrcb.xrcb021,l_xrcd009,l_xrcb3.*)
                  
                  #有作沖暫估時,不處理遞延寫入;因為在立暫估的時候已經處理
                  IF g_xrcb.xrcb023 = 'N' AND g_glaa.glaa139 = 'Y' THEN
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
                        EXIT FOREACH
                     END IF
                  END IF            
               
                  #直接把金額寫入該筆減項資訊
                  IF l_sum_xrcb105 > l_cal_isag105 THEN
                     LET l_cal_isag103 = 0
                     LET l_cal_isag105 = 0
                  ELSE #分次寫入該筆減項資訊
                     LET l_cal_isag105 = l_cal_isag105 - l_sum_xrcb105
                     LET l_cal_isag103 = l_cal_isag103 - l_sum_xrcb103
                  END IF

                  IF NOT l_doc_success THEN
                     EXIT FOREACH
                  END IF

               END IF
            END FOREACH
            
            IF NOT l_doc_success THEN
               EXIT FOREACH
            END IF
            
         END FOREACH      
      END IF
      
      IF NOT l_doc_success THEN         
         EXIT FOREACH
      END IF
      
      #所有axrt310資訊寫完以後再個別處理單頭(取用此aist310單產的axrt310單&本幣含稅合計)
      FOREACH axrp132_c7 USING l_isagdocno INTO l_xrcadocno
         INITIALIZE g_xrca.* TO NULL
         EXECUTE sel_xrca_pre USING g_master.xrcald,l_xrcadocno INTO g_xrca.*
      
         ###產生直接沖帳、多帳期，回寫應收單據單頭金額###            

         #当有冲暂估时，才产生冲暂估资料
         LET l_cnt = 0
         SELECT COUNT(1) INTO l_cnt FROM xrcb_t
          WHERE xrcbent = g_enterprise AND xrcbld = g_xrca.xrcald
            AND xrcbdocno = g_xrca.xrcadocno AND xrcb023 = 'Y'
         IF l_cnt > 0 THEN
            #当整张应收账款单产生完，再产生冲暂估资料
            CALL s_axrp130_ins_xrcf(g_xrca.xrcald,g_xrca.xrcadocno,'','0') RETURNING l_success
            IF NOT l_success THEN
               LET l_doc_success = FALSE  
            END IF
         END IF
            
         #抓取应收账款金额
         EXECUTE axrp132_sel_xrcb_pr2 USING g_xrca.xrcald,g_xrca.xrcadocno
                                       INTO g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,
                                            g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134 
         IF cl_null(g_xrca.xrca103) THEN LET g_xrca.xrca103 = 0 END IF 
         IF cl_null(g_xrca.xrca104) THEN LET g_xrca.xrca104 = 0 END IF 
         IF cl_null(g_xrca.xrca113) THEN LET g_xrca.xrca113 = 0 END IF 
         IF cl_null(g_xrca.xrca114) THEN LET g_xrca.xrca114 = 0 END IF
         IF cl_null(g_xrca.xrca123) THEN LET g_xrca.xrca123 = 0 END IF 
         IF cl_null(g_xrca.xrca124) THEN LET g_xrca.xrca124 = 0 END IF
         IF cl_null(g_xrca.xrca133) THEN LET g_xrca.xrca133 = 0 END IF 
         IF cl_null(g_xrca.xrca134) THEN LET g_xrca.xrca134 = 0 END IF
         #回寫單頭金額
         UPDATE xrca_t SET (xrca103,xrca104,xrca113,xrca114,xrca123,xrca124,xrca133,xrca134) = (g_xrca.xrca103,g_xrca.xrca104,g_xrca.xrca113,g_xrca.xrca114,g_xrca.xrca123,g_xrca.xrca124,g_xrca.xrca133,g_xrca.xrca134) 
          WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = 'upd xrca_t:'
            LET g_errparam.code   = SQLCA.SQLCODE
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
            EXIT FOREACH
         END IF
         
         #多基准日时取用原则 
         #以单身出货单的最小或最大扣账日为基准日推算 应收款日       
         LET l_xmdk001 = ''
         LET l_ooib027 = ''
         SELECT ooib027 INTO l_ooib027 FROM ooib_t WHERE ooibent = g_enterprise AND ooib002 =  g_xrca.xrca008   #收款条件  
         IF l_ooib027 = '1' THEN     
            SELECT MIN(xmdk001) INTO l_xmdk001       
              FROM xmdk_t,xrcb_t
             WHERE xmdkent = xrcbent 
               AND xmdkdocno = xrcb002
               AND xmdkent = g_enterprise
               AND xrcb001 = '11'   #出货单 
               AND xrcbld =  g_xrca.xrcald
               AND xrcbdocno = g_xrca.xrcadocno
         ELSE    
            SELECT MAX(xmdk001) INTO l_xmdk001       
              FROM xmdk_t,xrcb_t
             WHERE xmdkent = xrcbent 
               AND xmdkdocno = xrcb002
               AND xmdkent = g_enterprise
               AND xrcb001 = '11'   #出货单 
               AND xrcbld =  g_xrca.xrcald
               AND xrcbdocno = g_xrca.xrcadocno
         END IF       
         
         CALL s_fin_date_ar_receivable(g_xrca.xrcasite,g_xrca.xrca004,g_xrca.xrca008,g_xrca.xrcadocdt,
              l_isaf.isaf014,g_xrca.xrcadocdt,l_xmdk001) RETURNING l_success,g_xrca.xrca009,g_xrca.xrca010
              
         UPDATE xrca_t SET (xrca009,xrca010) = (g_xrca.xrca009,g_xrca.xrca010) 
          WHERE xrcaent = g_enterprise 
            AND xrcald = g_xrca.xrcald 
            AND xrcadocno = g_xrca.xrcadocno
         IF SQLCA.SQLCODE THEN
            LET l_doc_success = FALSE
            EXIT FOREACH            
         END IF                    
         
         #更新作法: xrcb001 為 10 (訂單) +
         #xrcb002 + xrcb003 對應到  isag002 + isag003
         #取得 isag011(訂單期別)後對應到 xmdb001 為條件   
         IF (g_sfin2022 = '01' AND g_xrca.xrca016 = '10') OR (g_sfin2022 = '02' AND g_xrca.xrca016 = '12') THEN
            UPDATE xmdb_t SET xmdb007 = g_xrca.xrcadocno,
                              xmdb008 = g_xrca.xrca113,                               
                              xmdb009 = g_xrca.xrca103+g_xrca.xrca104
             WHERE xmdbent = g_enterprise AND xmdb001 = g_xrca.xrca064 AND xmdbdocno = l_isag.isag002
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd xmdb_t:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
               EXIT FOREACH
            END IF         
         END IF
                          
         #單身如果有多筆發票則更新單頭發票號碼為'MULTI'
         LET l_cnt = 0
         SELECT COUNT(DISTINCT xrcb027||xrcb028) INTO l_cnt FROM xrcb_t WHERE xrcbent = g_enterprise
            AND xrcbdocno = g_xrca.xrcadocno AND xrcbld = g_xrca.xrcald
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt > 1 THEN
            UPDATE xrca_t SET xrca066 = 'MULTI'
             WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd xrca_t:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
               EXIT FOREACH
            END IF
         END IF
                           
         #如果單身資料多來源/多單據則令單頭來源類型、來源單號為空
         LET l_cnt = 0
         CASE
            WHEN l_s = 1
               SELECT COUNT(DISTINCT isafdocno) INTO l_cnt FROM isaf_t WHERE isafent = g_enterprise
                  AND isaf035 = g_xrca.xrcadocno
                  
               #來源訂單會依單號+期別拆分產生立帳單,因此回寫應收單號為MULTI
               UPDATE isaf_t SET isaf035 = 'MULTI'
                WHERE isafent = g_enterprise
                  AND isafdocno=l_isagdocno    
                  AND isafcomp= l_isagcomp
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd isaf035:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
                  EXIT FOREACH
               END IF
                  
            WHEN l_s = 2
               SELECT COUNT(DISTINCT isafdocno) INTO l_cnt FROM isaf_t WHERE isafent = g_enterprise
                  AND isaf048 = g_xrca.xrcadocno
                  
               #來源訂單會依單號+期別拆分產生立帳單,因此回寫應收單號為MULTI
               UPDATE isaf_t SET isaf048 = 'MULTI'
                WHERE isafent = g_enterprise
                  AND isafdocno=l_isagdocno    
                  AND isafcomp= l_isagcomp
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd isaf048:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
                  EXIT FOREACH
               END IF
                  
            WHEN l_s = 3
               SELECT COUNT(DISTINCT isafdocno) INTO l_cnt FROM isaf_t WHERE isafent = g_enterprise
                  AND isaf049 = g_xrca.xrcadocno
               #來源訂單會依單號+期別拆分產生立帳單,因此回寫應收單號為MULTI
               UPDATE isaf_t SET isaf049 = 'MULTI'
                WHERE isafent = g_enterprise
                  AND isafdocno=l_isagdocno    
                  AND isafcomp= l_isagcomp
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = 'upd isaf049:'
                  LET g_errparam.code   = SQLCA.SQLCODE
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET l_doc_success = FALSE
                  EXIT FOREACH
               END IF
         END CASE
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         IF l_cnt > 1 THEN
            UPDATE xrca_t SET xrca018 = NULL
             WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = 'upd xrca_t:'
               LET g_errparam.code   = SQLCA.SQLCODE
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET l_doc_success = FALSE
               EXIT FOREACH
            END IF
         END IF
          
         #產生直接沖帳
         LET la_param.p_style = g_end_prog
         LET la_param.p_check = g_master.b_check1,g_master.b_check2,'N',g_master.b_check4,g_master.b_check5,g_master.b_check6
         LET la_param.p_isafdocno = l_isagdocno
         LET ls_js = util.JSON.stringify(la_param)
         CALL s_axrp133_ins_xrce(g_xrca.xrcadocno,g_xrca.xrcald,ls_js)
          
         #產生多帳期
         CALL s_axrt300_installments(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_success
         IF NOT l_success THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.extend = g_master.xrcadocno
            LET g_errparam.code   = 'aap-00092'
            LET g_errparam.popup  = TRUE
            CALL cl_err()
            LET l_doc_success = FALSE
            EXIT FOREACH
         END IF        
          
         IF g_glaa.glaa121 = 'Y' AND l_dfin0030 = 'Y' THEN
            CALL s_pre_voucher_ins('AR','R10',g_glaa.glaald,g_xrca.xrcadocno,g_xrca.xrcadocdt,'1') RETURNING l_success
            IF NOT l_success THEN
               LET l_doc_success = FALSE
               EXIT FOREACH
            END IF
         END IF
          
         LET l_xmdk031_cnt = 0
         SELECT COUNT(DISTINCT xmdk031) INTO l_xmdk031_cnt 
           FROM xmdk_t WHERE xmdkent = g_enterprise
            AND xmdkdocno IN (SELECT xrcb002 
                               FROM xrcb_t 
                              WHERE xrcbdocno = g_xrca.xrcadocno AND xrcbent = g_enterprise 
                                AND xrcbld = g_xrca.xrcald
                              ) 
         IF cl_null(l_xmdk031_cnt) THEN LET l_xmdk031_cnt = 0 END IF
         IF l_xmdk031_cnt = '1' THEN   
            SELECT DISTINCT xmdk031 INTO l_xmdk031 
              FROM xmdk_t WHERE xmdkent = g_enterprise
               AND xmdkdocno IN (SELECT xrcb002 
                                  FROM xrcb_t 
                                 WHERE xrcbdocno = g_xrca.xrcadocno AND xrcbent = g_enterprise 
                                   AND xrcbld = g_xrca.xrcald
                                 )             
            SELECT xrca058 INTO l_xrca058 FROM xrca_t WHERE xrcaent = g_enterprise AND xrcald = g_xrca.xrcald AND xrcadocno = g_xrca.xrcadocno
            IF l_xrca058 <> l_xmdk031 THEN
               UPDATE xrca_t SET xrca058 = l_xmdk031
                WHERE xrcaent = g_enterprise
                  AND xrcald = g_xrca.xrcald
                  AND xrcadocno = g_xrca.xrcadocno
            END IF
         END IF              
          
         #执行立即审核功能
         IF NOT cl_null(l_dfin0031) AND l_dfin0031 MATCHES '[Yy]' THEN
            #根据单别捞取对应的作业，azzi850检核单别所属的所有作业
            LET l_sql = ''
            LET l_oobl002 = ''
            LET l_success_1 = TRUE
            LET l_sql = " SELECT DISTINCT oobl002 ",
                        "   FROM oobl_t ",
                        "  WHERE ooblent = ",g_enterprise,
                        "    AND oobl001 = '",l_ooba002,"' "                           
            PREPARE axrp132_sel_oobl002_pr2 FROM l_sql
            DECLARE axrp132_sel_oobl002_cur2 CURSOR FOR axrp132_sel_oobl002_pr2
            FOREACH axrp132_sel_oobl002_cur2 INTO l_oobl002                   
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
               CALL s_axrp133_immediately_conf(g_xrca.xrcald,g_xrca.xrcadocno) RETURNING l_conf_success
               IF NOT l_conf_success THEN 
                  LET l_doc_success = FALSE
                  EXIT FOREACH
               END IF 
            END IF
            
            LET g_prog = 'axrp132'
            LET g_code = 'axrp132'              
         END IF          
          
         #执行立即抛砖总账传票
         IF l_doc_success THEN  
            IF NOT cl_null(l_dfin0032) AND l_dfin0032 MATCHES '[Yy]' THEN
               IF NOT cl_null(l_gl_slip) THEN
                  CALL s_axrp133_immediately_gen(g_xrca.xrcald,g_xrca.xrcadocno,g_xrca.xrcasite,g_xrca.xrcadocdt,l_gl_slip)
               ELSE
                 INITIALIZE g_errparam TO NULL 
                 LET g_errparam.extend = "" 
                 LET g_errparam.code   = "axr-00987" 
                 LET g_errparam.popup  = TRUE 
                 CALL cl_err()
               END IF
            END IF                                                       
         END IF
         
         IF cl_null(g_strno) THEN
            LET g_strno = l_xrcadocno
         END IF
         LET g_endno = l_xrcadocno
            
      END FOREACH
      
      IF l_doc_success THEN
         CALL s_transaction_end('Y',0)
      ELSE
         CALL s_transaction_end('N',0)
      END IF      
      
   END FOREACH

END FUNCTION

#end add-point
 
{</section>}
 
