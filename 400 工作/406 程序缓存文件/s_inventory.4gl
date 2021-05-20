#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_inventory.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0166(1900-01-01 00:00:00), PR版次:0166(2021-05-10 16:28:40)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000732
#+ Filename...: s_inventory
#+ Description: 新增庫存明細檔
#+ Creator....: 01258(2013-08-15 17:22:19)
#+ Modifier...: 00000 -SD/PR- 00272
 
{</section>}
 
{<section id="s_inventory.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150722  by wuxj   非流通行业参考单位给值,参考数量用传入参数给值 
#160105-00007#1  2016/01/04  By tsungyung 訊息提示優化(sub-00144 > sub-01296)
#160115-00013#1  2016/03/29  By lixiang   寫入inag時，inag033基礎單位數量欄位用基礎單位與庫存單位和數量進行換算寫入
#160321-00016#18 2016/03/29  By Jessy     將重複內容的錯誤訊息置換為公用錯誤訊息
#160408-00035#1  2016/04/14  By shiun     修改s_inventory_check_inan及s_inventory_upd_inan
#160420-00022#1  2016/04/21  By xujing    非负库存才可校验制造批序号数量
#160422-00006#1  2016/04/22  By Dido      檢核該月以前是否還有庫存,若無庫存則提示控管
#160429-00012#1  2016/04/29  By Dido      增加允許負庫存否(inaa014)如為 N 才檢核該月以前庫存問題
#160408-00035#8  2016/05/04  By xianghui  检查库存时需加上訂單/工單中的備置量-备置已冲销量的数量
#160511-00014#1  2016/05/11  By lixh      报错传参调整
#160411-00029#1  2016/05/16  By Sarah     當入庫數量為0時,不需要檢查有沒有對應的製造批序號
#160523-00009#4  2016/05/26  By geza      更新inad的来源单号来源项次来源项序
#160512-00004#1  2016/06/20  By 04441     inai012製造日期改為NO USE，相關程式沒用到的mark，有用到的改抓inae010
#160812-00010#1  2016/08/12  By lixh      inaj028  统一给值当前料号
#160919-00013#1  2016/10/06  By shiun     所有會檢查sub-00633訊息的段落前都增加判斷,若料號料件類別(imaa004)=E.費用/軟體時,不做檢查直接RETURN
#160927-00024#1  2016/10/11  By 04441     imaf058=0時不做備置
#161107-00034#1  2016/11/07  By lixh      INSERT INTO inap_t,库存管理特征传入NULL,默认给空格
#161108-00045#1  2016/11/07  By lixh      s_inventory_check_inag008()根据参数D-BAS-0070做判断
#161007-00012#1  2016/11/11  By dorislai  過帳時，如為雜收(aint302)，不需轉換為結算庫位，也不需要產生另一張雜收單；如為雜發(aint301)，照原本流程 【#161007-00012#2一起改掉】
#160822-00001#1  2016/11/11  By 02040     調整訂單/工單抓取已備置數量
#161007-00012#2  2016/11/16  By dorislai  aint330.aint340.aint350，過帳時，若撥入倉為VMI倉，直接寫入庫位，不需轉換結算庫位，也不需產生另一張雜收；如撥出庫位為VMI庫位，同雜發寫入相對應VMI結算倉資料，並產生VMI存貨庫位之雜發單
#161116-00015#1  2016/11/16  By lixh      1.調整庫存量檢核依單據扣帳當日，原本是當月
#.........................................2.過帳還原段，PUBLIC FUNCTION s_inventory_check_inag008 檢查負庫存的地方也需加上控卡邏輯
#.........................................3.修正SELECT SUM(inaj004*inaj011*inaj013) INTO l_chkqty的計算inaj裡面用的换算率是inaj046/inaj047 而不能用inaj013
#161124-00006#1  2016/11/24  By zhujing   s_inventory_ins_inaj、s_inventory_check_inag008判斷庫存是否足夠，調整為逐筆取位，直接在SQL中進行取位
#161125-00056#1  2016/11/25  By lixh      s_aooi250_take_decimals() 报错
#161130-00028#1  2016/11/30  By zhujing   161124-00006调整的程式代码遗失,此单补上遗失代码
#161006-00018#28 2016/11/30  By lixh      自动新增仓储批,INSERT INTO inag_t inag021给默认值0
#161202-00031#1  2016/12/05  By 02295     库存过账、过账还原时检查是否有负库存
#161212-00017#1  2016/12/13  By 02295     小数取位调整
#161124-00048#15 2016/12/19  By zhujing   .*整批调整
#170105-00048#1  2017/01/06  By wuxja     批号为空格的情况
#170104-00031#1  2017/01/11  By lixh      單據過帳還原時，刪除inaj_t後，判斷inaj_t不存在時，一併刪除inag_t
#170110-00041#1  2017/01/11  By wuxja     检查在捡量时应根据对应的仓储批库存管理特征等判断，若有值则组入条件，没值就抓所有的！
#170116-00032#1  2017/01/16  By lixh      inaj_t没有对应资料且inag008 = 0才会删除inag_t 资料(完善#170104-00031#1)
#170120-00021#1  2017/01/20  By ywtsai    檢查庫存量時，來源(在撿量)資料須增加判斷儲位與批號
#170102-00004#1  2017/01/22  By lixh      過賬段在撿量檢核沒有扣除自身在撿量，造成在撿量計算重讀
#170124-00009#1  2017/01/24  By ywtsai    過帳在取得在撿量統計檔(inan_t)在撿量與庫存比較時，須扣除本身發料單在撿量
#160726-00020#19 2017/02/07  By 08992     將module變數改為global變數
#170209-00027#1  2017/02/13  By lixh      l_inaj011_qty为null 给值0
#170113-00018#1  2017/02/13  By lixh      失效的料件应该要能够进行报废和报废品的调拨处理
#                                         aint310、aint311、aint330、aint340在过账的时候不应该控卡有效日期是否失效
#170221-00057#1  2017/02/22  By 02295     不允许负库存的时候,库存检查第一段检查从当前单据日期往前的数据异动量总和做比较,第二段检查当前日期往后至月末是否会导致后续单据负库存(第二段已在前面处理)
#170301-00030#9  2017/03/23  By 09257     g_prog整批調整
#170303-00054#1  2017/03/03  By 04441     检核制造批序号库存量
#170308-00016#1  2017/03/03  By 04441     制造批序号相關防呆
#170324-00052#1  2017/03/24  By lixh      批號唯一且inag庫存=0，來源單號為該單號的删除对的inad_t资料
#170216-00011#1  2017/03/27  By lixh      批序號不可以重複且inag008 = 0 删除对应的inae_t/inai_t 的资料
#170328-00042#1  2017/03/29  By catmoon47 無庫存的回傳值錯誤
#170330-00069#1  2017/04/14  By lixh      aint301产生VMI单据时，单身检验合格量=申请数量
#170414-00023#1  2017/05/11  By lixh      盘点过账不需要考虑库位是否冻结
#170511-00027#1  2017/05/11  By lixh      SQL遺漏ent與site关联条件
#170515-00070#1  2017/05/16  By lixh      捞取品名规格栏位补上ENT条件
#170518-00055#1  2017/05/23  By 04441     修正#170102-00004#1
#170516-00005#1  2017/05/26  By fionchen  1.過帳段在撿量檢核沒有扣除自身在撿量，造成在撿量計算重覆
#                                         2.若出貨單據,選擇不考慮在撿量,也還是需撿核備置量
#170602-00036#1  2017/06/02  By fionchen  調整#170516-00005#1,若項次為空時,應該預設值0
#170425-00065#1  2017/06/09  By lixh      ainp880盘点过账，不需要控卡库位是否冻结
#170609-00006#1  2017/06/13  By ouhz      调整axmt600销退方式为4-销货折让(纯金额折价)时，inal014值应该为0
#170601-00056#1  2017/06/13  By lixh      避免单别没有D-BAS-0070参数考虑了在捡量
#170622-00011#1  2017/06/22  By 02295     inaj037成本中心当没有值的时候再根据部门去aooi125抓成本中心
#170618-00265#1  2017/06/23  By fionchen  撿核備置在撿時,若為過帳還原時依據inaj紀錄的庫存單位進行過帳還原
#170618-00421#1  2017/07/05  By 08734     在删除inag表之前进行判断库位是不是结算仓
#170718-00011#1  2017/07/24  By lixh      删除inag_t资料一并删除inai_t资料(完善#170104-00031#1)
#170802-00050#1  2017/08/04  By Mandy     sub-00633 異常排除,get_inap_pre和get_inan008_pre1 SQL調整
#170810-00054#1  2017/08/16  By Mandy     SQL筆誤,導致當庫位為空時,get_inag008_pre3和get_inag008_pre4 的SQL異常只有AND 條件,沒有SELECT ...
#170724-00041#4  2017/08/22  by sakura    s_inventory_check_inan()增加參數'p_imafsite',流通傳ALL,製造傳g_site或null
#                                         其function內有呼叫跟imaf_t有關的元件,均需改成傳p_imafsite的方式,而非g_site
#170808-00058#1  2017/08/31  By lixiang   入項單據過帳還原時，如果批號有值，檢查料號+產品特徵+批號是否存在inaj_t裡，如果不存在，刪除inad_t
#170816-00007#1  2017/09/13  by 02159     調整公用元件錯誤訊息,顯示更明確的資訊內容
#170914-00004#1  2017/09/19  By 05426     s_inventory_check_inan()传入参数为空时，组sql语句导致运行报错-201
#171005-00008#1  2017/10/12  By 09042     添加条件：判斷若異動的庫位為VMI存貨庫位且不为采购收货入库时則自動將本次異動的庫位換成對應的VMI結算庫位
#170828-00031#1  2017/10/25  By 04441     s_inventory_check_inag008()增加軟備置檢查
#171108-00043#1  2017/11/09  By 05423     1.撥出庫位為vmi庫位、撥入庫位為vmi庫位，則直接異動vmi存貨庫位資料，不需產生其他單據
#                                         2.撥出庫位為vmi庫位、撥入庫位為一般庫位，則異動寫入vmi結算庫，並產生vmi存貨庫之雜發單
#                                         3.撥出庫位為一般庫位、撥入庫位為vmi庫位，則異動寫入vmi結算庫，並產生vmi存貨庫之雜收單
#171113-00003#1  2017/11/16  By 02294     庫存過帳lock問題調整
#171114-00014#1  2017/11/23  By 05423     杂收单杂收到VMI仓时，也应当收入结算仓，并产生一张存货仓的杂收单
#171120-00043#1  2017/11/27  By 04441     調整s_inventory_ins_inap的寫
#171124-00033#1  2017/12/03  By 05423     修正#170828-00031#1中对备置量检查的判断错误
#171219-00022#21 2017/12/25  By 09042     延續171113-00003，call ainp001的程式段要移至各主程式
#170829-00018#60 2017/12/29  By 06137     完工入庫-流程優化 
#                                         1.s_ainp950 產生 inqb_t 與inqc_t 的資料時
#                                           庫位欄位 如果 在rtdx044 還取不到值, 再取該門店的預設庫位
#                                         2.調整inqc_t 取rtdx044時的料件使用變數
#                                         3.調整 s_inventory_upd_inag 中 取inaa_t 的資料時
#                                           在流通傳入ALL給p_imafsite 時,不應該直接用p_imafsite取inaa_t(集團級) 的資料
#170619-00049#2  2017/01/08  By 08992     增加判斷若是續拋的資料，檢查在撿量/備置量/庫存量時不把批號加入條件中  
#171214-00016#1  2017/01/17  By 01534     效能優化
#180117-00045#1  2018/01/18  By 08525     调整当库存单位设置小数位数保留0位，舍入方式为4舍6入5成双时，检查库存量存在错误问题
#180117-00047#1  2018/01/18  By 05426     inag033基础单位库存数量应该是用库存单位数量*库存单位和基础单位转换率计算然后再加上原有库存数量，并非用库存单位数量加本次异动数量
#180129-00009#1  2018/01/29  By 04441     s_inventory_check_inag008()增加判斷出庫才做在揀備置檢查
#180130-00042#1  2018/01/31  By 04441     增加判斷傳入的單據是否存在，出貨單來源訂單的備置明細(xmdr_t)以及發料單來源工單的備置明細(sfbb_t)並加以排除。
#180313-00040#1  2018/03/14  By 00593     出貨單有多筆單身,若剛好有相同料、產品特徵、庫存單位、庫、儲、批、庫存管理特徵的資料出現,單據過帳時第二筆以後的單身會報庫存不足的錯誤(因為在揀量計算的問題)
#180316-00018#1  2018/03/16  By 04441     修正180130-00042
#180327-00045#1  2018/03/28  By 06021     调整订单取货模式：供应商直送，出货单取消过账时报sub-00633错误问题
#180419-00065#1  2018/04/24  By 04441     增加錯誤訊息的資訊
#180424-00044#1  2018/04/24  By 04441     增加錯誤訊息的資訊s_inventory_check_inas()
#170105-00057#4  2018/05/21  By 06137     多角走中斷時，銷退需加判斷已續拋的量才可銷退，拋轉時不中斷，但要自動配對出貨單號
#180531-00057#1  2018/06/01  By 05599     需把5202行IF段落的inai006批號條件拿掉，因若為多角續拋是不需要考量批號條件
#180627-00049#1  2018/06/28  By 10130     修正#180313-00040（IF NOT cl_null(p_inag007) THEN   #庫存管理特徵）==>改为（IF NOT cl_null(p_inag003）
#171218-00024#2  2018/07/18  By 07024     增加銷售正拋時，應檢查最終站的庫存是否足夠(製造批序號相同)
#180726-00008#1  2018/08/06  by 09767     修正VMI结算库的成本结算否的给值
#180807-00049#1  2018/08/09  by 10130     修正报错库存不足的时候提示是哪个料件
#180907-00046#1  2018/09/10  By 10983     判断取替代料号inag008时，增加条件inag010=Y
#180913-00008#1  2018/09/13  By 07423     出庫單據過帳時,檢核庫存是否足夠時,不論單據設定是否檢核在撿,都只需檢核庫存-備置的庫存量是否足夠
#180921-00007#1  2018/09/21  By 05423     一阶段调拨单若拨入拨出皆为VMI仓，库存异动VMI结算否给值应当=0.非VMI结算
#181015-00054#1  2018/10/15  By 10983     将180907-00046#1mark，重修修改工单展备料判断替代料的逻辑
#181019-00026#1  2018/10/19  By 02111     PREPARE get_qty4_p FROM l_sql 要將所有數量加總。
#181001-00015#84 2018/10/31  By 10046     修正SQL無ENT條件
#181115-00019#1  2018/11/16  by 09767     修正azzi920里面的sub-00633的错误信息提示,需将说明参数传入
#181127-00047#1  2018/11/28  By 10042     修正axmt540單身二筆項次同料號時，在單據確認時在揀量檢查會檢查不到
#181218-00064#1  2018/12/24  By 10042     仿照181127-00047#1改法，將下列程式編號的情況也考慮進去:aint301,aint310,aint311,aint330,aint340,aint350,aint360,apmt520,asft310,asrt310
#181221-00031#1  2019/01/07  By 02295     如果是VMI流程,此处应检查库存库产生的inaj_t,而不是结算库存的inaj_t
#190103-00023#1  2019/01/09  By 02111     aint170 不產生雜收雜發單並且不抓結算庫位。
#190115-00027#1  2019/01/16  by 09767     控卡单据日期小于等于关账日期
#190105-00002#1  2019/01/25  By 00272     VMI業務使用一階段收貨入庫apmt530，存貨倉和結算倉都寫入了庫存數，存貨倉一筆、結算倉一筆，這是不對的。 應僅有存貨倉有一筆才對。
#190117-00033#1  2019/02/11  By 00272     一張出貨單同料號,使用訂單備置和在揀量功能,庫存充足,卻報sub-00633!
#181207-00043#1  2019/03/14  By 01534     产生inap_t资料时，inap005(产品特征)为NULL时，默认给空格，避免关联inag_t时捞不到资料	
#190328-00061#1  2019/04/10  By 10983     apmp120还原时，结算仓不考虑是否为负库存.
#190417-00053#1  2019/04/25  By 06021     修正190111-00036#1，调整出货单单身出同订单+项次+仓储批，报sub-00633错误问题
#190522-00022#1  2019/05/23  By 02159     調整aint311單身相同料號+項次+倉儲批，扣帳報sub-00633錯誤問題
#190606-00023#1  2019/06/19  By 10983     多角正抛首站，出货单过账不检查库存，但要产生对应的inaj档。
#190621-00019#1  2019/06/21  By 02295     变更VMI结算的条件中排除掉单据性质=aint170的情况
#190722-00026#1  2019/07/22  By 07423     修正#190606-00023#1,銷售多角正拋首站需檢核最終站庫存量
#190723-00031#1  2019/07/26  By 01996     判断如果是aint300一阶段调拨过账调用,则新增inag016时 给传入的p_inag007,而inag015和inag017直接=g_today
#190812-00011#1  2019/08/22  By 08734     修正asft335生成完工入库单并自动审核过账后写入异动作业编号错误的问题
#190819-00023#1  2019/08/23  By 10500     修正aint170执行变更库存单位时,应不进行数量换算的问题
#190924-00001#1  2019/09/25  By 10983     两个VMI存货仓之间调拨，不需要清空储位
#191008-00007#1  2019/10/08  By 10983     调整备置量取值逻辑（一张出货单，出货两个订单，且料号相同的情况）
#190807-00028#1  2019/10/23  By 10042     過帳效能優化
#191028-00071#1  2019/10/30  By 01996     料件设置硬备置时,需要检查当前库储批的库存数量
#191106-00013#1  2019/11/06  By 00593     先將190807-00028還原,否則aint170確認過帳後，製造批序號沒有被變更
#191021-00037#1  2019/11/15  By 00272     s_inventory_check_inan()內l_inan010 計算錯誤,造成料件為軟備置時,當出庫單據考慮在揀量(D-BAS-0070)設"Y"時,未能正常控卡住
#191107-00048#1  2019/11/20  By 10983     若勾选单一单位库存单位变更，检查在捡量则用多单位的逻辑。
#191203-00030#1  2019/12/04  By 01996     放大s_inventory_upd_inag的变量 p_seq1,p_seq2 到num10
#191113-00052#1  2019/12/04  By 01534     aint170 變更單位更新inai_t/新增inal_t 放在aint170主程式處理
#191226-00033#1  2019/12/27  By 00272     #191008-00007#1 調整的l_sql7 sfdcent誤筆,導致:工單備置後,發料不會沖銷,會提示庫存不足(sub-00633)異常
#200116-00014#1  2020/01/16  By 00272     :料件為軟備置,訂單備置時:只會指定到要備置的料號和產品特徵==>以庫存總量管制,出庫單據若指定了庫存管理特徵,卻無法[確認]
#200117-00035#1  2020/01/21  By 10983     多角销售逆抛 中断点 有实体库存（DSCNJ-DSCTP）， 出货单过账还原时，DSCNJ采购收货入库的库存，更新时未区分批号造成异常。
#200206-00012#1  2020/02/07  By 06978     更新在揀量時，於更新失敗錯誤訊息增加顯示料、倉、儲、批與數量資訊
#200302-00017#1  2020/03/16  By 11234     修改对账单过账后，料件写入库存交易明细档数量和单位错误的问题
#200317-00046#1  2020/03/18  By 00272     s_inventory_get_inan010_2()計算的在揀量,未考量到情境"庫/儲/批/庫存管理特徵"皆為空時,導致在揀量重覆計算(Ex:運用在asfq001)
#200401-00049#1  2020/04/07  By 01996     s_inventory_check_inag008 排除费用性料件
#191112-00047#1  2020/05/14  by 11515     s_inventory_ins_inaj：当异动数量为0时，不检核库存是否充足
#200528-00047#1  2020/05/28  by 05423     修正笔误
#200616-00037#1  2020/06/16  By 06978     修正s_inventory_check_inag008中SQL語法CASE少給WHEN的錯誤
#200609-00036#1  2020/06/23  By 01996     调拨单取消过账时,抓取入库仓库应该是 indd022
#200624-00009#1  2020/06/28  By 01996     调拨单仓库为VMI存货仓时,需要判断是否扣账还原/扣账,再决定抓取拨入仓/拨出仓 来判断是否更新结算仓
#200814-00021#1  2020/08/14  By 06978     修正多角續拋出貨單檢查在撿量時，計算要判斷批號條件避免無法審核
#200831-00076#1  2020/09/01  By 06978     修正s_inventory_ins_inaj()中檢查庫存不足時報錯訊息由ain-00245改為ain-00270
#200919-00001#1  2020/09/28  By 10983     退料产生的批号有效日期也参考制造日期，给值空格。
#201027-00022#1  2020/11/02  By 10983     當庫存還原檢查不足時，應讓r_success = FALSE，不可在繼續往下走到呼叫MES段落
#210303-00058#1  2021/03/04  By 06978     修正扣帳時，僅需判斷備置量，但因g_stutflag為NULL造成誤判在撿量問題
#210324-00031#1  2021/03/24  By 05423     修正软备置的备置、在拣检核时，由于库存抓的是指定库储批，导致库存量不够扣的问题
#200926-00024#1  2021/04/08  By 13423     不允许重复&必须有批号或批号不控管时，需判斷若有inad資料也需較刪除
#210329-00022#1  2021/05/10  By 00171     asft350 ［確認]時，產生asft314 效能優化
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util     #171113-00003#1 add
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_inventory.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_inventory.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#160512-00004#1-s modify
#DEFINE g_inventory_inag  DYNAMIC ARRAY OF RECORD #数组变量
#    inag001    LIKE inag_t.inag001,
#    imaal003   LIKE imaal_t.imaal003,
#    imaal004   LIKE imaal_t.imaal004,
#    inag002    LIKE inag_t.inag002,
#    inag003    LIKE inag_t.inag003,
#    inag004    LIKE inag_t.inag004,
#    inag005    LIKE inag_t.inag005,
#    inag006    LIKE inag_t.inag006,
#    inag007    LIKE inag_t.inag007,
#    inag018    LIKE inag_t.inag018,
#    inag022    LIKE inag_t.inag022,
#    inag017    LIKE inag_t.inag017
#                     END RECORD
GLOBALS #160726-00020#19 add
 TYPE type_g_inventory_inag RECORD
    inag001    LIKE inag_t.inag001,
    imaal003   LIKE imaal_t.imaal003,
    imaal004   LIKE imaal_t.imaal004,
    inag002    LIKE inag_t.inag002,
    inag003    LIKE inag_t.inag003,
    inag004    LIKE inag_t.inag004,
    inag005    LIKE inag_t.inag005,
    inag006    LIKE inag_t.inag006,
    inag007    LIKE inag_t.inag007,
    inag022    LIKE inag_t.inag022,
    inag017    LIKE inag_t.inag017,
    inae010    LIKE inae_t.inae010,
    inae011    LIKE inae_t.inae011
                     END RECORD
DEFINE g_inventory_inag  DYNAMIC ARRAY OF type_g_inventory_inag
DEFINE g_prog2 LIKE type_t.chr20   #170425-00065#1 add
DEFINE g_stutflag  LIKE type_t.chr1      #1.扣帳 2.扣帳還原                  #170618-00265#1 add
DEFINE g_stuttype  LIKE type_t.chr2      ##异动类型  -1:出库, 0:报废, 2:盘点  #170618-00265#1 add
DEFINE g_aic_continue       LIKE type_t.num5       #判斷多角是否續拋          #170619-00049#2 add
DEFINE g_aic_direct         LIKE type_t.num5       #判斷是否為多角正拋，且為起始站的單據 #171218-00024#2-add
#191106-00013#1 -s mark
##190807-00028#1 -S add
#DEFINE g_pre_trigger1    LIKE type_t.chr1
#DEFINE g_pre_trigger2    LIKE type_t.chr1
#DEFINE g_pre_trigger3    LIKE type_t.chr1
##190807-00028#1 -E add
#191106-00013#1 -e mark
END GLOBALS #160726-00020#19 add
#160512-00004#1-e modify
#170816-00007#1 by 02159 add(S)
DEFINE g_colname_1   STRING   
DEFINE g_comment_1   STRING       
DEFINE g_msg         STRING   #錯誤訊息
#170816-00007#1 by 02159 add(E)
#end add-point
 
{</section>}
 
{<section id="s_inventory.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_inventory.other_function" readonly="Y" type="s" >}
################################################################################
# Descriptions...: 获取营运据点+料件编号的库存数量(账面库存)
# Memo...........: 加总所有产品特征、库存管理特征、仓储批的库存数量，不同单位间换算后的加总
#                : 若以后还有需求获取营运据点+料件编号+......的库存数量，可以增加元件s_inventory_get_inag008_2(...)
# Usage..........: CALL s_inventory_get_inag008(p_site,p_item,p_unit)
#                  RETURNING r_qty
# Input parameter: p_site    营运据点
#                : p_item    料件编号
#                : p_unit    需返回的数量的单位
# Return code....: r_success 处理状态TRUE/FALSE
#                  r_qty     库存数量
# Date & Author..: 2013/12/19 By zhangllc
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_get_inag008(p_site,p_item,p_unit)
DEFINE p_site     LIKE inag_t.inagsite
DEFINE p_item     LIKE inag_t.inag001
DEFINE p_unit     LIKE inag_t.inag007
DEFINE r_success  LIKE type_t.num5
DEFINE r_qty      LIKE inag_t.inag008
DEFINE l_sql      STRING
DEFINE l_inag007  LIKE inag_t.inag007  #库存单位
DEFINE l_inag008  LIKE inag_t.inag008  #库存数量
DEFINE l_rate     LIKE inaj_t.inaj014  #单位换算率
DEFINE l_success  LIKE type_t.num5
DEFINE l_inag0081 LIKE inag_t.inag008  #add--2015/01/08 By shiun

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_qty = 0
   
   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_site) OR cl_null(p_item) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success,r_qty
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_site) THEN
      CALL s_azzi902_get_gzzd("ainq120","lbl_inagsite") RETURNING g_colname_1,g_comment_1   #营运据点 
      LET g_msg = g_colname_1   
   END IF
   IF cl_null(p_item) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件编号
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
      RETURN r_success,r_qty
   END IF   
   #170816-00007#1 by 02159 add(E)   
   
   #若单位为空，则默认为料件的据点库存单位
   IF cl_null(p_unit) THEN
      SELECT imaf053 INTO p_unit
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = p_site
         AND imaf001 = p_item
      IF SQLCA.sqlcode OR cl_null(p_unit) THEN
         #获取不到目标单位,请查询[料件据点库存资料维护作业aimm212]！
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aim-00192'
         LET g_errparam.extend = p_item    #add by wuxj
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_qty
      END IF
   END IF

   LET l_sql = " SELECT inag007,inag008 FROM inag_t ",
               "  WHERE inagent = ",g_enterprise,
               "    AND inagsite= '",p_site,"' ",
               "    AND inag001 = '",p_item,"' "  #180907-00046#1 mod        #181015-00054#1 mod
#               "    AND inag010 = 'Y' "            #180907-00046#1 add         #181015-00054#1 mark
   PREPARE s_inventory_get_inag008_p FROM l_sql
   DECLARE s_inventory_get_inag008_c CURSOR FOR s_inventory_get_inag008_p
   FOREACH s_inventory_get_inag008_c INTO l_inag007,l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      IF p_unit = l_inag007 THEN
         LET r_qty = r_qty + l_inag008
      ELSE
         #modify--2015/01/08 By shiun--(E)
#         CALL s_aimi190_get_convert(p_item,l_inag007,p_unit) RETURNING l_success,l_rate
#         IF NOT l_success THEN
#            #错误，需返回错误，数值需继续计算，参考用，调用程序有些可能不需要多精确，但需要有个参考值
#            LET r_success = FALSE
#            LET l_rate = 1
#         END IF
#         LET r_qty = r_qty + l_inag008 * l_rate
         CALL s_aooi250_convert_qty(p_item,l_inag007,p_unit,l_inag008)
              RETURNING l_success,l_inag0081
         IF l_success THEN
            LET l_inag008 = l_inag0081
         END IF
         LET r_qty = r_qty + l_inag008
         #modify--2015/01/08 By shiun--(E)
      END IF
   END FOREACH
               
   RETURN r_success,r_qty
END FUNCTION

################################################################################
# Descriptions...: 获取据点+料号+产品特征+库位+储位+批号+库存管理特征+库存单位的所有库存量
# Memo...........: 库存使用单一单位,只抓存储为库存单位的库存量
#                  库存不使用单一单位的，抓存储为指定库存单位的库存量
#                  指定库储批或库存特征不为空，取该料+料件特征对应库储批的库存可用量（inag008换算成发料单位数量）
#                  指定库储批或库存特征为空，取该料+料件特征所有库储批的库存可用量合计
# Usage..........: CALL s_inventory_get_inag008_2(p_inagsite,p_inag001,p_inag002,p_inag004,p_inag005,p_inag006,p_inag003,p_unit)
#                  RETURNING r_qty
# Input parameter: p_inagsite   营运据点
#                : p_inag001    料件编号
#                : p_inag002    产品特征
#                : p_inag004    库位
#                : p_inag005    储位
#                : p_inag006    批号
#                : p_inag003    库存管理特征
#                : p_unit       需返回的数量的单位
# Return code....: r_success 处理状态TRUE/FALSE
#                  r_qty     库存数量
# Date & Author..: 2014/08/19 By ming  
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_get_inag008_2(p_inagsite,p_inag001,p_inag002,p_inag004,p_inag005,p_inag006,p_inag003,p_unit)
   DEFINE p_inagsite    LIKE inag_t.inagsite #营运据点
   DEFINE p_inag001     LIKE inag_t.inag001  #料件编号
   DEFINE p_inag002     LIKE inag_t.inag002  #产品特征
   DEFINE p_inag004     LIKE inag_t.inag004  #库位
   DEFINE p_inag005     LIKE inag_t.inag005  #储位
   DEFINE p_inag006     LIKE inag_t.inag006  #批号
   DEFINE p_inag003     LIKE inag_t.inag003  #库存管理特征
   DEFINE p_unit        LIKE inag_t.inag007  #需返回的数量的单位
   DEFINE r_success     LIKE type_t.num5 
   DEFINE r_qty         LIKE inag_t.inag008
   DEFINE l_sql         STRING
   DEFINE l_inag007     LIKE inag_t.inag007  #库存单位
   DEFINE l_inag008     LIKE inag_t.inag008  #库存数量
   DEFINE l_rate        LIKE inaj_t.inaj014  #单位换算率
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_imaf053     LIKE imaf_t.imaf053  #库存单位
   DEFINE l_imaf054     LIKE imaf_t.imaf054  #库存多单位否
   DEFINE l_inag0081 LIKE inag_t.inag008  #add--2015/01/08 By shiun
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_qty = 0
   
   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_inagsite) OR cl_null(p_inag001) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'     #傳入值為空(錯誤)
   #   LET g_errparam.EXTEND = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   LET r_success = FALSE
   #   RETURN r_success,r_qty
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inagsite) THEN
      CALL s_azzi902_get_gzzd("ainq120","lbl_inagsite") RETURNING g_colname_1,g_comment_1   #营运据点
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_inag001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件编号
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
      RETURN r_success,r_qty
   END IF   
   #170816-00007#1 by 02159 add(E)

   IF cl_null(p_inag002) THEN  #产品特征
      LET p_inag002 = ' '
   END IF

   #检查料件是否使用多单位，及库存单位
   SELECT imaf053,imaf054 INTO l_imaf053,l_imaf054
     FROM imaf_t
    WHERE imafent = g_enterprise AND imafsite = p_inagsite AND imaf001 = p_inag001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.EXTEND = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF
   IF l_imaf054='N' AND cl_null(l_imaf053) THEN
      #缺少库存单位,请查询[集团预设料件据点库存资料维护作业aimm202]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00203'
      LET g_errparam.EXTEND = p_inag001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE 
      RETURN r_success,r_qty
   END IF

   #若目标单位为空，则默认为料件的据点库存单位
   IF cl_null(p_unit) THEN
      LET p_unit = l_imaf053
   END IF

   IF cl_null(p_unit) THEN
      #获取不到目标单位,请查询[料件据点库存资料维护作业aimm212]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00192'
      LET g_errparam.EXTEND = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF

   #若非多单位，则只获取库存单位的量，折算成目的单位
   #若多单位，则所有单位的量均获取，折算成目的单位
   LET l_sql = " SELECT inag007,inag008 FROM inag_t ",
               "  WHERE inagent = ",g_enterprise,
               "    AND inagsite= '",p_inagsite,"' ", #营运据点
               "    AND inag001 = '",p_inag001,"' ",  #料件编号
               "    AND inag002 = '",p_inag002,"' "    #产品特征         #181015-00054#1 mod
#               "    AND inag010 = 'Y' "            #180907-00046#1 add   #181015-00054#1 mark
   IF NOT cl_null(p_inag004) THEN
      LET l_sql = l_sql CLIPPED,"    AND inag004 = '",p_inag004,"' "   #库位 
   END IF
   IF NOT cl_null(p_inag005) THEN
      LET l_sql = l_sql CLIPPED,"    AND inag005 = '",p_inag005,"' "   #储位
   END IF
   IF NOT cl_null(p_inag006) THEN
      LET l_sql = l_sql CLIPPED,"    AND inag006 = '",p_inag006,"' "   #批号
   END IF
   IF NOT cl_null(p_inag003) THEN
      LET l_sql = l_sql CLIPPED,"    AND inag003 = '",p_inag003,"' "   #库存管理特征
   END IF

   IF l_imaf054 = 'Y' THEN   #库存使用多单位 
      #多單位的時候不可限制單一單位，否則會找不到資料 
      #LET l_sql = l_sql CLIPPED," AND inag007='",p_unit,"' "   #单位=目的单位
   ELSE  #库存使用单一单位
      LET l_sql = l_sql CLIPPED," AND inag007='",l_imaf053,"' "   #单位=库存单位
   END IF

   PREPARE s_inventory_get_inag008_2_p FROM l_sql
   DECLARE s_inventory_get_inag008_2_c CURSOR FOR s_inventory_get_inag008_2_p

   FOREACH s_inventory_get_inag008_2_c INTO l_inag007,l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      IF p_unit = l_inag007 THEN
         LET r_qty = r_qty + l_inag008
      ELSE
         #modify--2015/01/08 By shiun--(S)
#         CALL s_aimi190_get_convert(p_inag001,l_inag007,p_unit) RETURNING l_success,l_rate
#         IF NOT l_success THEN
#            #错误，需返回错误，数值需继续计算，参考用，调用程序有些可能不需要多精确，但需要有个参考值
#            LET r_success = FALSE
#            LET l_rate = 1 
#         END IF
#         LET r_qty = r_qty + l_inag008 * l_rate
         #modify--2015/01/08 By shiun--(E)
         CALL s_aooi250_convert_qty(p_inag001,l_inag007,p_unit,l_inag008)
              RETURNING l_success,l_inag0081
         IF l_success THEN
            LET l_inag008 = l_inag0081
         END IF
         LET r_qty = r_qty + l_inag008
      END IF
   END FOREACH

   RETURN r_success,r_qty
END FUNCTION
################################################################################
# Descriptions...: 获取据点+料号+产品特征+库位+储位+批号+库存管理特征+库存单位的所有库存量
# Memo...........: 库存使用单一单位,只抓存储为库存单位的库存量
#                  库存不使用单一单位的，抓存储为指定库存单位的库存量
# Usage..........: CALL s_inventory_get_inag008_3(p_inagsite,p_inag001,p_inag002,p_inag004,p_inag005,p_inag006,p_inag003,p_unit)
#                  RETURNING r_success,r_qty
# Input parameter: p_inagsite   营运据点
#                : p_inag001    料件编号
#                : p_inag002    产品特征
#                : p_inag004    库位
#                : p_inag005    储位
#                : p_inag006    批号
#                : p_inag003    库存管理特征
#                : p_unit       需返回的数量的单位
# Return code....: r_success 处理状态TRUE/FALSE
#                  r_qty     库存数量
# Date & Author..: 2014/01/21 By zhangllc
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_get_inag008_3(p_inagsite,p_inag001,p_inag002,p_inag004,p_inag005,p_inag006,p_inag003,p_unit)
DEFINE p_inagsite    LIKE inag_t.inagsite #营运据点
DEFINE p_inag001     LIKE inag_t.inag001  #料件编号
DEFINE p_inag002     LIKE inag_t.inag002  #产品特征
DEFINE p_inag004     LIKE inag_t.inag004  #库位
DEFINE p_inag005     LIKE inag_t.inag005  #储位
DEFINE p_inag006     LIKE inag_t.inag006  #批号
DEFINE p_inag003     LIKE inag_t.inag003  #库存管理特征
DEFINE p_unit        LIKE inag_t.inag007  #需返回的数量的单位
DEFINE r_success     LIKE type_t.num5
DEFINE r_qty         LIKE inag_t.inag008
DEFINE l_sql         STRING
DEFINE l_inag007     LIKE inag_t.inag007  #库存单位
DEFINE l_inag008     LIKE inag_t.inag008  #库存数量
DEFINE l_rate        LIKE inaj_t.inaj014  #单位换算率
DEFINE l_success     LIKE type_t.num5
DEFINE l_imaf053     LIKE imaf_t.imaf053  #库存单位
DEFINE l_imaf054     LIKE imaf_t.imaf054  #库存多单位否
DEFINE l_inag0081 LIKE inag_t.inag008  #add--2015/01/08 By shiun

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_qty = 0
   
   #170816-00007#1 by 02159 mark(S)   
   #IF cl_null(p_inagsite) OR cl_null(p_inag001) OR cl_null(p_inag004) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   LET r_success = FALSE
   #   RETURN r_success,r_qty
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inagsite) THEN
      CALL s_azzi902_get_gzzd("ainq120","lbl_inagsite") RETURNING g_colname_1,g_comment_1   #营运据点
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_inag001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件编号
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
         LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_inag004) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag004") RETURNING g_colname_1,g_comment_1   #库位
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
      RETURN r_success,r_qty
   END IF   
   #170816-00007#1 by 02159 add(E)   
   
   IF cl_null(p_inag002) THEN  #产品特征
      LET p_inag002 = ' '
   END IF
   IF cl_null(p_inag005) THEN  #储位
      LET p_inag005 = ' '
   END IF
   IF cl_null(p_inag006) THEN  #批号
      LET p_inag006 = ' '
   END IF
   IF cl_null(p_inag003) THEN  #库存管理特征
      LET p_inag003 = ' '
   END IF
   
   #检查料件是否使用多单位，及库存单位
   SELECT imaf053,imaf054 INTO l_imaf053,l_imaf054
     FROM imaf_t
    WHERE imafent = g_enterprise AND imafsite = p_inagsite AND imaf001 = p_inag001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF
   IF l_imaf054='N' AND cl_null(l_imaf053) THEN
      #缺少库存单位,请查询[集团预设料件据点库存资料维护作业aimm202]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00203'
      LET g_errparam.extend = p_inag001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF
   
   #若目标单位为空，则默认为料件的据点库存单位
   IF cl_null(p_unit) THEN
      LET p_unit = l_imaf053 
   END IF
   
   IF cl_null(p_unit) THEN
      #获取不到目标单位,请查询[料件据点库存资料维护作业aimm212]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00192'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF

   #若非多单位，则只获取库存单位的量，折算成目的单位
   #若多单位，则所有单位的量均获取，折算成目的单位
   LET l_sql = " SELECT inag007,inag008 FROM inag_t ",
               "  WHERE inagent = ",g_enterprise,
               "    AND inagsite= '",p_inagsite,"' ", #营运据点
               "    AND inag001 = '",p_inag001,"' ",  #料件编号
               "    AND inag002 = '",p_inag002,"' ",  #产品特征
               "    AND inag004 = '",p_inag004,"' ",  #库位
               "    AND inag005 = '",p_inag005,"' ",  #储位
               "    AND inag006 = '",p_inag006,"' ",  #批号
               "    AND inag003 = '",p_inag003,"' "  #库存管理特征          #181015-00054#1 mod
#               "    AND inag010 = 'Y' "            #180907-00046#1 add     #181015-00054#1 mark
   IF l_imaf054 = 'Y' THEN   #库存使用多单位
      LET l_sql = l_sql CLIPPED," AND inag007='",p_unit,"' "   #单位=目的单位
   ELSE  #库存使用单一单位
      LET l_sql = l_sql CLIPPED," AND inag007='",l_imaf053,"' "   #单位=库存单位
   END IF
   PREPARE s_inventory_get_inag008_3_p FROM l_sql
   DECLARE s_inventory_get_inag008_3_c CURSOR FOR s_inventory_get_inag008_3_p
   FOREACH s_inventory_get_inag008_3_c INTO l_inag007,l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      IF p_unit = l_inag007 THEN
         LET r_qty = r_qty + l_inag008
      ELSE
         #modify--2015/01/08 By shiun--(S)
#         CALL s_aimi190_get_convert(p_inag001,l_inag007,p_unit) RETURNING l_success,l_rate
#         IF NOT l_success THEN
#            #错误，需返回错误，数值需继续计算，参考用，调用程序有些可能不需要多精确，但需要有个参考值
#            LET r_success = FALSE
#            LET l_rate = 1
#         END IF
#         LET r_qty = r_qty + l_inag008 * l_rate
         CALL s_aooi250_convert_qty(p_inag001,l_inag007,p_unit,l_inag008)
              RETURNING l_success,l_inag0081
         IF l_success THEN
            LET l_inag008 = l_inag0081
         END IF
         LET r_qty = r_qty + l_inag008
         #modify--2015/01/08 By shiun--(E)
      END IF
   END FOREACH
               
   RETURN r_success,r_qty
   
END FUNCTION
# # # ################################################################################
# # # # Descriptions...: 检核库存量是否足够
# # # # Memo...........:
# # # # Usage..........: CALL s_inventory_check_inag008(p_type,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_qty,p_docno,p_seq1,p_seq2,p_inag007,p_imafsite)
# # # #                       RETURNING r_success,r_flag
# # # # Input parameter: 1.p_type      LIKE type_t.chr2     异动类型  -1:出库 0:报废 2:盘点
# # # #                  2.p_inag001   LIKE inag_t.inag001  料件编号                  
# # # #                  3.p_inag002   LIKE inag_t.inag002  产品特征
# # # #                  4.p_inag003   LIKE inag_t.inag003  库存管理特征
# # # #                  5.p_inag004   LIKE inag_t.inag004  库位
# # # #                  6.p_inag005   LIKE inag_t.inag005  储位
# # # #                  7.p_inag006   LIKE inag_t.inag006  批号
# # # #                  8.p_qty       LIKE inag_t.inag008  异动数量
# # # #                  9.p_docno     LIKE type_t.chr20    单据编号    
# # # #                  10.p_seq1     LIKE type_t.num5     项次
# # # #                  11.p_seq2     LIKE type_t.num5     项序 
# # # #                  12.p_inag007  LIKE inag_t.inag007  单位
# # # #                  13.p_imafsite LIKE imaf_t.imafsite 營運據點(流通作業一律傳入ALL,製造傳入g_site或‘’)
# # # # Return code....: 1.r_success   处理状态TRUE/FALSE
# # # #                  2.r_flag      1:库存足够 0:库存不足 2:庫存-在揀量後庫存不足
# # # # Date & Author..: 13/07/09 By wuxja
# # # # Modify.........: 13/12/13 By wuxja   新增参数p_inag007及相关逻辑
# # # # Modify.........: 14/09/26 By pomelo  增加p_site參數,用來區分製造的程式,還是流通的程式
# # # # Modify.........: 15/02/13 By 04441   將p_site改為p_imafsite,只有當抓取imaf_t時,imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
# # # # Modify.........: 15/03/23 By earl    當p_type=-1(出庫)
# # #                                        利用單號判斷該單據性質='aint330'、'aint340'(調撥單)，且indc009='Y'時，不呼叫s_inventory_unit做數量轉換
# # # ################################################################################
PUBLIC FUNCTION s_inventory_check_inag008(p_type,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_qty,p_docno,p_seq1,p_seq2,p_inag007,p_imafsite)
DEFINE p_inag001      LIKE inag_t.inag001   #料件编号
DEFINE p_inag002      LIKE inag_t.inag002   #产品特征
DEFINE p_inag003      LIKE inag_t.inag003   #库存管理特征
DEFINE p_inag004      LIKE inag_t.inag004   #库位
DEFINE p_inag005      LIKE inag_t.inag005   #储位
DEFINE p_inag006      LIKE inag_t.inag006   #批号
DEFINE p_type         LIKE type_t.chr2      #异动类型  -1:出库, 0:报废, 2:盘点
DEFINE p_qty          LIKE inag_t.inag008   #异动数量
DEFINE p_docno        LIKE type_t.chr20     #单据编号
DEFINE p_seq1         LIKE type_t.num5      #项次
DEFINE p_seq2         LIKE type_t.num5      #项序  
DEFINE p_inag007      LIKE inag_t.inag007   #单位
DEFINE p_imafsite     LIKE imaf_t.imafsite  #營運據點(流通作業一律傳入ALL, 製造傳入g_site 或‘’)
DEFINE r_success      LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE r_flag         LIKE type_t.num5      #1:库存足够, 0:库存不足
DEFINE l_inag008      LIKE inag_t.inag008
DEFINE l_inag021      LIKE inag_t.inag021
DEFINE l_n            LIKE type_t.num5
DEFINE l_success      LIKE type_t.num5
DEFINE l_rate         LIKE inaj_t.inaj014
DEFINE l_inaa014      LIKE inaa_t.inaa014
#150323---earl---mod---s
DEFINE l_slip         LIKE oobx_t.oobx001
DEFINE l_oobx004      LIKE oobx_t.oobx004
DEFINE l_indc009      LIKE indc_t.indc009
#150323---earl---mod---e
DEFINE l_inaj045      LIKE inaj_t.inaj045   #150724 by pengu add
#150606 pengu add
DEFINE l_sql1         STRING
DEFINE l_sql2         STRING
DEFINE l_sql3         STRING
DEFINE l_sql3_1       STRING   #180313-00040#1 add
DEFINE l_n1           LIKE type_t.num5
DEFINE l_n2           LIKE type_t.num5
#150606 pengu end
#161108-00045#1-S
DEFINE l_para         LIKE type_t.chr80    #單據別參數
#161108-00045#1-E
#161124-00048#15 mod-S
#DEFINE l_inaj       RECORD LIKE inaj_t.*  #161116-00015#1
DEFINE l_inaj RECORD  #庫存交易明細檔
       inajent LIKE inaj_t.inajent, #企業編號
       inajsite LIKE inaj_t.inajsite, #營運據點
       inaj001 LIKE inaj_t.inaj001, #單據編號
       inaj002 LIKE inaj_t.inaj002, #項次
       inaj003 LIKE inaj_t.inaj003, #項序
       inaj004 LIKE inaj_t.inaj004, #出入庫碼
       inaj005 LIKE inaj_t.inaj005, #料件編號
       inaj006 LIKE inaj_t.inaj006, #產品特徵
       inaj007 LIKE inaj_t.inaj007, #庫存管理特徵
       inaj008 LIKE inaj_t.inaj008, #庫位編號
       inaj009 LIKE inaj_t.inaj009, #儲位編號
       inaj010 LIKE inaj_t.inaj010, #批號
       inaj011 LIKE inaj_t.inaj011, #交易數量
       inaj012 LIKE inaj_t.inaj012, #交易單位
       inaj013 LIKE inaj_t.inaj013, #交易單位與庫存單位換算率
       inaj014 LIKE inaj_t.inaj014, #交易單位與料件基本單位換算率
       inaj015 LIKE inaj_t.inaj015, #異動單據性質
       inaj016 LIKE inaj_t.inaj016, #理由碼
       inaj017 LIKE inaj_t.inaj017, #異動部門編號
       inaj018 LIKE inaj_t.inaj018, #異動供應商/客戶編號
       inaj019 LIKE inaj_t.inaj019, #備註
       inaj020 LIKE inaj_t.inaj020, #工單單號
       inaj021 LIKE inaj_t.inaj021, #多角序號
       inaj022 LIKE inaj_t.inaj022, #單據扣帳日期
       inaj023 LIKE inaj_t.inaj023, #實際執行扣帳日期
       inaj024 LIKE inaj_t.inaj024, #資料產生時間
       inaj025 LIKE inaj_t.inaj025, #異動資料產生者
       inaj026 LIKE inaj_t.inaj026, #參考單位
       inaj027 LIKE inaj_t.inaj027, #參考數量
       inaj028 LIKE inaj_t.inaj028, #成本料號
       inaj036 LIKE inaj_t.inaj036, #庫存異動類型
       inaj029 LIKE inaj_t.inaj029, #交易單位與成本單位換算率
       inaj030 LIKE inaj_t.inaj030, #VMI交易結算否
       inaj031 LIKE inaj_t.inaj031, #VMI對應入庫/倉退單號
       inaj032 LIKE inaj_t.inaj032, #VMI對應入庫/倉退項次
       inaj033 LIKE inaj_t.inaj033, #VMI對應雜發/雜收單號
       inaj034 LIKE inaj_t.inaj034, #VMI對應雜發/雜收項次
       inaj035 LIKE inaj_t.inaj035, #異動作業編號
       inaj037 LIKE inaj_t.inaj037, #成本中心
       inaj038 LIKE inaj_t.inaj038, #專案編號
       inaj039 LIKE inaj_t.inaj039, #WBS編號
       inaj040 LIKE inaj_t.inaj040, #重複性生產-計畫編號
       inaj041 LIKE inaj_t.inaj041, #重複性生產-生產料號
       inaj042 LIKE inaj_t.inaj042, #重複性生產-生產料號BOM特性
       inaj043 LIKE inaj_t.inaj043, #重複性生產-生產料號產品特徵
       inaj044 LIKE inaj_t.inaj044, #來源單號
       inaj200 LIKE inaj_t.inaj200, #內部結算否
       inaj201 LIKE inaj_t.inaj201, #業務類型
       inaj202 LIKE inaj_t.inaj202, #內部交易類型
       inaj203 LIKE inaj_t.inaj203, #幣別
       inaj204 LIKE inaj_t.inaj204, #稅別
       inaj205 LIKE inaj_t.inaj205, #內部結算未稅金額
       inaj206 LIKE inaj_t.inaj206, #內部結算含稅金額
       inaj207 LIKE inaj_t.inaj207, #交易所屬法人
       inaj208 LIKE inaj_t.inaj208, #內部交易對象組織
       inaj209 LIKE inaj_t.inaj209, #內部交易對象法人
       inaj045 LIKE inaj_t.inaj045, #異動時庫存單位
       inaj046 LIKE inaj_t.inaj046, #交易單位與庫存單位換算分子
       inaj047 LIKE inaj_t.inaj047, #交易單位與庫存單位換算分母
       inaj048 LIKE inaj_t.inaj048, #交易單位與料件基本單位換算分子
       inaj049 LIKE inaj_t.inaj049, #交易單位與料件基本單位換算分母
       inaj050 LIKE inaj_t.inaj050, #交易單位與成本單位換算分子
       inaj051 LIKE inaj_t.inaj051, #交易單位與成本單位換算分母
       inaj210 LIKE inaj_t.inaj210, #單據單價
       inaj211 LIKE inaj_t.inaj211  #品類
END RECORD
#161124-00048#15 mod-E
DEFINE l_chkqty       LIKE inaj_t.inaj011   #161116-00015#1
DEFINE l_qty3         LIKE inaj_t.inaj011   #161124-00006#1 add
DEFINE l_qty3_1       LIKE inaj_t.inaj011   #180313-00040#1 add
DEFINE l_qty4         LIKE inaj_t.inaj011   #180130-00042#1
DEFINE l_sql          STRING                #161202-00031#1
DEFINE l_cnt          LIKE type_t.num10     #161202-00031#1
DEFINE l_edate        LIKE inaj_t.inaj022   #161202-00031#1 
DEFINE l_docno_from   LIKE inap_t.inap001   #訂單單號/工單單號   #170516-00005#1 add
DEFINE l_seq_from     LIKE inap_t.inap002   #訂單項次/工單項次   #170516-00005#1 add
DEFINE l_flag         LIKE type_t.num5                          #170516-00005#1 add
DEFINE l_extend       STRING                #180419-00065#1
DEFINE l_inaa018      LIKE type_t.num5      #190328-00061#1---add
DEFINE l_imaf058      LIKE imaf_t.imaf058   #191028-00071#1 add

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_flag = 1
   LET l_qty3 = 0              #PGS(D)-013130 meno add  #赋初值
   #171218-00024#2-s-add
   #判斷是否要做s_inventory_check_inag008的檢查
   #TRUE:表示為續拋，不需進行庫存檢查
   #FALSE:表示非續拋，需進行原先的庫存檢查
   IF g_aic_continue THEN
      RETURN r_success,r_flag
   END IF 
   #171218-00024#2-e-add
   
   #210303-00058#1 add---start---
   IF cl_null(g_stutflag) AND p_type = -1 THEN
      LET g_stutflag = 1
   END IF
   #210303-00058#1 add---end---

   #检查：料件编号不可为空
   IF cl_null(p_inag001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00123'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,''
   END IF 
   
   #检查：库位不可为空
   IF cl_null(p_inag004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00126'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,''
   END IF 

   #检查：产品特征,库存管理特征,储位和批号为空，则给空格
   IF cl_null(p_inag002) THEN LET p_inag002 = ' ' END IF 
   IF cl_null(p_inag003) THEN LET p_inag003 = ' ' END IF
   IF cl_null(p_inag005) THEN LET p_inag005 = ' ' END IF 
   IF cl_null(p_inag006) THEN LET p_inag006 = ' ' END IF 
   IF cl_null(p_imafsite) THEN LET p_imafsite = g_site END IF
   
   #180419-00065#1-s
   INITIALIZE g_errparam TO NULL
   LET g_errparam.replace[1] = p_inag001
   LET g_errparam.replace[2] = p_inag002
   LET g_errparam.replace[3] = p_inag003
   LET g_errparam.replace[4] = p_inag004
   LET g_errparam.replace[5] = p_inag005
   LET g_errparam.replace[6] = p_inag006
   LET g_errparam.replace[7] = p_docno
   LET g_errparam.replace[8] = p_seq1
   LET g_errparam.replace[9] = p_seq2
   LET l_extend = cl_getmsg('ain-00968',g_lang)
  #LET l_extend = cl_err_replace_msg(l_extend)  #180424-00044#1 mark cl_getmsg()裡面已經call過了
   #180419-00065#1-e
   
   #检查是否允许负库存
   LET l_inaa014 = ''
   SELECT inaa014 INTO l_inaa014
     FROM inaa_t
    WHERE inaaent = g_enterprise
      AND inaasite = g_site
      AND inaa001 = p_inag004
   IF l_inaa014 = 'Y' THEN 
      RETURN r_success,r_flag
   END IF        

   #150323---earl---mod---s
   
   #190328-00061#1---add---s
   SELECT COUNT(1) INTO l_inaa018 
     FROM inaa_t
    WHERE inaaent = g_enterprise
      AND inaasite = g_site
      AND inaa018 = p_inag004 
   IF l_inaa018 > 0 THEN
      RETURN r_success,r_flag
   END IF
   #190328-00061#1---add---e   
   
   #200401-00049#1 add(s)
   IF s_inventory_imaa004_chk(p_inag001) THEN
      RETURN r_success,r_flag
   END IF
   #200401-00049#1 add(e)
   
   WHILE TRUE
      #當p_type=-1(出庫)
      IF p_type = -1 THEN
         #取單別
         CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
         #取得作業代號
         LET l_oobx004 = ''
         CALL s_fin_get_oobx004('','',l_slip) RETURNING l_oobx004
         
         #單據性質='aint330'、'aint340'(調撥單)
         IF l_oobx004 = 'aint330' OR
            l_oobx004 = 'aint340' THEN
         
            LET l_indc009 = ''
            SELECT indc009 INTO l_indc009
              FROM indc_t
             WHERE indcent = g_enterprise
               AND indcdocno = p_docno
               
            #indc009='Y'時，則不呼叫s_inventory_unit做數量轉換
            IF l_indc009 = 'Y' THEN
               EXIT WHILE
            END IF
         END IF
      END IF

     #-----150724 by pengu add
      #若是過帳還原時依據inaj紀錄的庫存單位進行過帳還原
      LET l_inaj045 = NULL 
      SELECT inaj045 INTO l_inaj045 FROM inaj_t
       WHERE inajent = g_enterprise AND inajsite = p_imafsite
         AND inaj001 = p_docno AND inaj002 = p_seq1 AND inaj003 = p_seq2
         #PGS(D)-10167 -S-
         #AND inaj004 = p_type * -1
         AND inaj004 = CAST(p_type AS int) * -1
         #PGS(D)-10167 -E-
      IF NOT cl_null(l_inaj045) THEN 
         CALL s_aooi250_convert_qty(p_inag001,p_inag007,l_inaj045,p_qty)
              RETURNING r_success,p_qty
         IF NOT r_success THEN
            RETURN r_success,''
         END IF
         LET p_inag007 = l_inaj045
      END IF 
     #-----150724 by pengu end
     
      IF g_prog <> 'aint170' THEN   #190819-00023#1 add
         IF cl_null (l_inaj045) THEN   #150724 by penu add #inaj045為NULL代表是過帳所以須依據料見多單位設置進行扣帳
            #-----150106 by 04441 modify start
            #若料件設置為單一單位庫存管理時，將異動數量換算成料件庫存單位的數量
            CALL s_inventory_unit(g_site,p_inag001,p_inag007,p_qty,p_imafsite)
                 RETURNING r_success,p_inag007,p_qty
            IF NOT r_success THEN
               RETURN r_success,''
            END IF
            #-----150106 by 04441 modify end
         END IF   #150724 by pengu add
      END IF                        #190819-00023#1 add
      EXIT WHILE
   END WHILE
   #150323---earl---mod---e
   #170619-00049#2-s add  
   IF g_aic_continue THEN
      #检查是否已存在于库存明细档中
      LET l_n = 0
      SELECT COUNT(1) INTO l_n FROM inag_t
       WHERE inagent = g_enterprise AND inagsite = g_site
         AND inag001 = p_inag001    AND inag002 = p_inag002
         AND inag003 = p_inag003    AND inag004 = p_inag004
         AND inag005 = p_inag005   
         AND inag007 = p_inag007
   ELSE
   #170619-00049#2-e add
      #检查是否已存在于库存明细档中
      LET l_n = 0
      SELECT COUNT(1) INTO l_n FROM inag_t
       WHERE inagent = g_enterprise AND inagsite = g_site
         AND inag001 = p_inag001    AND inag002 = p_inag002
         AND inag003 = p_inag003    AND inag004 = p_inag004
         AND inag005 = p_inag005    AND inag006 = p_inag006
         AND inag007 = p_inag007
   END IF  #170619-00049#2 add
   IF l_n = 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00142'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
      LET r_success = FALSE #170328-00042#1 remark
      LET r_flag = 0        #170328-00042#1 add
      RETURN r_success,r_flag
   END IF
   #161116-00015#1-S
   IF p_type = -1 AND l_inaa014 = 'N' THEN
      #161124-00048#15 mod-S
#      SELECT * INTO l_inaj.* FROM inaj_t
      SELECT inajent,inajsite,inaj001,inaj002,inaj003,
             inaj004,inaj005,inaj006,inaj007,inaj008,
             inaj009,inaj010,inaj011,inaj012,inaj013,
             inaj014,inaj015,inaj016,inaj017,inaj018,
             inaj019,inaj020,inaj021,inaj022,inaj023,
             inaj024,inaj025,inaj026,inaj027,inaj028,
             inaj036,inaj029,inaj030,inaj031,inaj032,
             inaj033,inaj034,inaj035,inaj037,inaj038,
             inaj039,inaj040,inaj041,inaj042,inaj043,
             inaj044,inaj200,inaj201,inaj202,inaj203,
             inaj204,inaj205,inaj206,inaj207,inaj208,
             inaj209,inaj045,inaj046,inaj047,inaj048,
             inaj049,inaj050,inaj051,inaj210,inaj211 
        INTO l_inaj.* 
        FROM inaj_t
      #161124-00048#15 mod-E
       WHERE inajent = g_enterprise AND inajsite = p_imafsite
         AND inaj001 = p_docno AND inaj002 = p_seq1 AND inaj003 = p_seq2
         #PGS(D)-10167 -S-
         #AND inaj004 = p_type * -1
         AND inaj004 = CAST(p_type AS int) * -1
         #PGS(D)-10167 -E-
      #181221-00031#1---add---s
      #如果是VMI流程,此处应检查库存库产生的inaj_t,而不是结算库存的inaj_t
      IF NOT cl_null(l_inaj.inaj033) THEN
         SELECT inajent,inajsite,inaj001,inaj002,inaj003,
                inaj004,inaj005,inaj006,inaj007,inaj008,
                inaj009,inaj010,inaj011,inaj012,inaj013,
                inaj014,inaj015,inaj016,inaj017,inaj018,
                inaj019,inaj020,inaj021,inaj022,inaj023,
                inaj024,inaj025,inaj026,inaj027,inaj028,
                inaj036,inaj029,inaj030,inaj031,inaj032,
                inaj033,inaj034,inaj035,inaj037,inaj038,
                inaj039,inaj040,inaj041,inaj042,inaj043,
                inaj044,inaj200,inaj201,inaj202,inaj203,
                inaj204,inaj205,inaj206,inaj207,inaj208,
                inaj209,inaj045,inaj046,inaj047,inaj048,
                inaj049,inaj050,inaj051,inaj210,inaj211
           INTO l_inaj.*
           FROM inaj_t
          WHERE inajent = g_enterprise AND inajsite = p_imafsite
            AND inaj001 = l_inaj.inaj033 AND inaj002 = l_inaj.inaj002 AND inaj003 = p_seq2
            #PGS(D)-10167 -S-
            #AND inaj004 = p_type * -1
            AND inaj004 = CAST(p_type AS int) * -1
            #PGS(D)-10167 -E-
      END IF
      #181221-00031#1---add---e
      
      #170619-00049#2-s add  
      IF g_aic_continue THEN
         SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
#180117-00045#1 mark -s         
#                    WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0 
#                                                     THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
#                                                     ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
#                                                END )
#180117-00045#1 mark -e
#180117-00045#1 add -s
                     WHEN a.ooca004 = '2'  THEN (CASE WHEN a.ooca002<>0 
                                                      THEN
                                                      #PGS(D)-10167 -S-
                                                      #( CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0
                                                      ( CASE WHEN MOD( ROUND( COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),CAST((2 / POWER(10,a.ooca002)) AS numeric))=0
                                                      #PGS(D)-10167 -E-                                                      
                                                             THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
                                                             ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
                                                        END )
                                                        ELSE 
                                                        round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                                                        END )                                               
#180117-00045#1 add -e   
                    WHEN a.ooca004 = '3'  THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                    WHEN a.ooca004 = '4'  THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,a.ooca002))/power(10,a.ooca002) 
               END)) INTO l_chkqty
           FROM inaj_t
             LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = l_inaj.inaj045  #161130-00028#1 add    
          WHERE inajent = g_enterprise
            AND inajsite = l_inaj.inajsite
            AND inaj005 = l_inaj.inaj005
            AND inaj006 = l_inaj.inaj006
            AND inaj007 = l_inaj.inaj007
            AND inaj008 = l_inaj.inaj008
            AND inaj009 = l_inaj.inaj009
            AND inaj022 <= l_inaj.inaj022  
            AND inaj045 = l_inaj.inaj045
      ELSE
      #170619-00049#2-e add
         #170221-00057#1---add---s     
         SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
#180117-00045#1 mark -s
#                          WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0 
#                                                           THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
#                                                           ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
#                                                      END )
#180117-00045#1 mark -e
#180117-00045#1 add -s
                          WHEN a.ooca004 = '2'  THEN (CASE WHEN a.ooca002<>0 
                                                         THEN
                                                            #PGS(D)-10167 -S-
                                                            #(CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0
                                                            (CASE WHEN MOD( ROUND( COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),CAST((2 / POWER(10,a.ooca002))AS numeric))=0
                                                            #PGS(D)-10167 -E-                                             
                                                               THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
                                                               ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
                                                            END )
                                                        ELSE 
                                                        round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                                                        END )                                                   
#180117-00045#1 add -e  
                          WHEN a.ooca004 = '3'  THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                          WHEN a.ooca004 = '4'  THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,a.ooca002))/power(10,a.ooca002) 
                     END)) INTO l_chkqty
           FROM inaj_t
             LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = l_inaj.inaj045  #161130-00028#1 add    
          WHERE inajent = g_enterprise
            AND inajsite = l_inaj.inajsite
            AND inaj005 = l_inaj.inaj005
            AND inaj006 = l_inaj.inaj006
            AND inaj007 = l_inaj.inaj007
            AND inaj008 = l_inaj.inaj008
            AND inaj009 = l_inaj.inaj009
            AND inaj010 = l_inaj.inaj010
            AND inaj022 <= l_inaj.inaj022  
            AND inaj045 = l_inaj.inaj045
      END IF #170619-00049#2 add            
      IF cl_null(l_chkqty) THEN LET l_chkqty = 0 END IF
      IF NOT cl_null(l_inaj045) AND NOT cl_null(l_inaj.inaj011) AND NOT cl_null(l_inaj.inaj046) AND NOT cl_null(l_inaj.inaj047) THEN 
         CALL s_aooi250_take_decimals(l_inaj.inaj045,(l_inaj.inaj011*l_inaj.inaj046/l_inaj.inaj047)) RETURNING l_success,l_qty3     
      END IF  
      IF l_chkqty - l_qty3 < 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "ain-00245"
        #LET g_errparam.extend = g_inaj.inaj005  #180419-00065#1 mark
         LET g_errparam.extend = l_extend        #180419-00065#1
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         LET r_flag = 0 
         RETURN r_success,r_flag
      END IF       
      #170221-00057#1---add---e         
#161202-00031#1---mod---s      
#      
#      #161124-00006#1 mod-S      
##      SELECT SUM(inaj004*inaj011*inaj046/inaj047) INTO l_chkqty
#      SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
#                       WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0 
#                                                        THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
#                                                        ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
#                                                   END )
#                       WHEN a.ooca004 = '3'  THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
#                       WHEN a.ooca004 = '4'  THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,a.ooca002))/power(10,a.ooca002) 
#                  END)) INTO l_chkqty
#        FROM inaj_t
#          LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = l_inaj.inaj045  #161130-00028#1 add
##        FROM inaj_t
#      #161124-00006#1 mod-E      
#       WHERE inajent = g_enterprise
#         AND inajsite = l_inaj.inajsite
#         AND inaj005 = l_inaj.inaj005
#         AND inaj006 = l_inaj.inaj006
#         AND inaj007 = l_inaj.inaj007
#         AND inaj008 = l_inaj.inaj008
#         AND inaj009 = l_inaj.inaj009
#         AND inaj010 = l_inaj.inaj010
#         AND inaj022 <= l_inaj.inaj022  
#         AND inaj045 = l_inaj.inaj045  #161130-00028#1 add
#      IF cl_null(l_chkqty) THEN LET l_chkqty = 0 END IF
#      #161124-00006#1 mod-S      
##      IF l_chkqty - (l_inaj.inaj011*l_inaj.inaj046/l_inaj.inaj047) < 0 THEN
##      IF NOT cl_null(l_inaj045) AND NOT cl_null(g_inaj.inaj011) AND NOT cl_null(g_inaj.inaj046) AND NOT cl_null(g_inaj.inaj047) THEN  #161125-00056#1   #161130-00028#1 mod
#      IF NOT cl_null(l_inaj045) AND NOT cl_null(l_inaj.inaj011) AND NOT cl_null(l_inaj.inaj046) AND NOT cl_null(l_inaj.inaj047) THEN  #161130-00028#1 mod
##         CALL s_aooi250_take_decimals(l_inaj045,(g_inaj.inaj011*g_inaj.inaj046/g_inaj.inaj047)) RETURNING l_success,l_qty3      #161130-00028#1 mod
#         CALL s_aooi250_take_decimals(l_inaj.inaj045,(l_inaj.inaj011*l_inaj.inaj046/l_inaj.inaj047)) RETURNING l_success,l_qty3       #161130-00028#1 mod
#      END IF  #161125-00056#1
#      IF l_chkqty - l_qty3 < 0 THEN
#      #161124-00006#1 mod-E   
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = "ain-00245"
#         LET g_errparam.extend = g_inaj.inaj005
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success = FALSE
#         LET r_flag = 0 
#         RETURN r_success,r_flag
#      END IF 
      IF NOT cl_null(l_inaj045) AND NOT cl_null(l_inaj.inaj011) AND NOT cl_null(l_inaj.inaj046) AND NOT cl_null(l_inaj.inaj047) THEN  
         CALL s_aooi250_take_decimals(l_inaj.inaj045,(l_inaj.inaj011*l_inaj.inaj046/l_inaj.inaj047)) RETURNING l_success,l_qty3      
      END IF
      LET l_edate = s_date_get_last_date(l_inaj.inaj022) 
      #161212-00017#1---mod---s      
      #LET l_sql = " SELECT COUNT(1) FROM (", 
      #            " SELECT DISTINCT a.inaj022,",
      #            "        NVL((SELECT SUM((CASE WHEN d.ooca004 = '1' THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002)",
      #            "                              WHEN d.ooca004 = '2' THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002),(2/power(10,d.ooca002)))=0", 
      #            "                                                               THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002) ",
      #            "                                                               ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002)-(inaj004*1/power(10,d.ooca002))",
      #            "                                                          END )",
      #            "                              WHEN d.ooca004 = '3' THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002)",
      #            "                              WHEN d.ooca004 = '4' THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,d.ooca002))/power(10,d.ooca002) ",
      #            "                          END)) ",
      LET l_sql = " SELECT COUNT(1) FROM (", 
                  " SELECT DISTINCT a.inaj022,",
                  #"        NVL((SELECT SUM((CASE WHEN d.ooca004 = '1' THEN round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002)", #PGS(D)-13130 meno mark
                  "        coalesce((SELECT SUM((CASE WHEN d.ooca004 = '1' THEN ROUND( ROUND( COALESCE(inaj004*inaj011*inaj046/   inaj047,0),6),d.ooca002)",   #PGS(D)-13130 meno add #使用coalesce替换nvl
                  #"                              WHEN d.ooca004 = '2' THEN (CASE WHEN MOD(round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002),(2/power(10,d.ooca002)))=0",  #180117-00045#1 mark
                  #180117-00045#1 add -s
                  #PGS(D)-10167 -S-
                  #"                              WHEN d.ooca004 = '2' THEN (CASE d.ooca002<>0 THEN",      #200616-00037#1 mark
                  "                              WHEN d.ooca004 = '2' THEN (CASE WHEN d.ooca002<>0 THEN",  #200616-00037#1 add                  
                  #"                                                           (CASE WHEN MOD(round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002),(2/power(10,d.ooca002)))=0", 
                  "                                                           (CASE WHEN MOD( ROUND(round( COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002),CAST((2 / POWER(10,d.ooca002))AS numeric))=0",
                  #PGS(D)-10167 -E-                  #180117-00045#1 add -e
                  "                                                               THEN round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002) ",
                  "                                                               ELSE round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002)-(inaj004*1/power(10,d.ooca002))",
                  "                                                          END )",
                  "                                                        ELSE round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002) END )", #180117-00045#1 add
                  "                              WHEN d.ooca004 = '3' THEN trunc(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002)",
                  "                              WHEN d.ooca004 = '4' THEN ceil(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6)*power(10,d.ooca002))/power(10,d.ooca002) ",
                 #"                          END)) ",     #170619-00049#2 mark               
      #161212-00017#1---mod---e  
                  "                          END)) "      #170619-00049#2 add
     #170619-00049#2-s add  
     IF g_aic_continue THEN
        LET l_sql = l_sql,"               FROM inaj_t b",                  
                          "               LEFT OUTER JOIN ooca_t d ON d.oocaent = inajent AND d.ooca001 = '",l_inaj.inaj045,"'",                 
                          "              WHERE a.inaj005 = b.inaj005 ",
                          "                AND a.inajent = b.inajent ",    
                          "                AND a.inajsite = b.inajsite ",  
                          "                AND a.inaj006 = b.inaj006 ",
                          "                AND a.inaj007 = b.inaj007 ",
                          "                AND a.inaj008 = b.inaj008 ",
                          "                AND a.inaj009 = b.inaj009 ",
                          "                AND a.inaj045 = b.inaj045 ",
                          "                AND b.inaj022 <= a.inaj022),0) aa",
                          "   FROM inaj_t a",
                          "   WHERE a.inajent = ",g_enterprise,"",
                          "     AND a.inajsite = '",l_inaj.inajsite,"'",
                          "     AND a.inaj005 = '",l_inaj.inaj005,"'",
                          "     AND a.inaj006 = '",l_inaj.inaj006,"'",
                          "     AND a.inaj007 = '",l_inaj.inaj007,"'",
                          "     AND a.inaj008 = '",l_inaj.inaj008,"'",
                          "     AND a.inaj009 = '",l_inaj.inaj009,"'",   
                          "     AND a.inaj045 = '",l_inaj.inaj045,"'",
                          #"     AND a.inaj022 BETWEEN '",l_inaj.inaj022,"' AND '",l_edate,"' ",  #PGS(D)-12133 memo mark
                          "     AND a.inaj022 BETWEEN ? AND ? ",  #PGS(D)-12133 memo add
                          #PGS(D)-10167 -S-
                          #" )",
                          " ) t51 ",
                          #PGS(D)-10167 -E-
                          " WHERE aa < ",l_qty3
     ELSE
        LET l_sql = l_sql,"               FROM inaj_t b",
     #170619-00049#2-e add                  
                         #"               FROM inaj_t b",                  #170619-00049#2 mark
                          "               LEFT OUTER JOIN ooca_t d ON d.oocaent = inajent AND d.ooca001 = '",l_inaj.inaj045,"'",                 
                          "              WHERE a.inaj005 = b.inaj005 ",
                          "                AND a.inajent = b.inajent ",    #170511-00027#1 add
                          "                AND a.inajsite = b.inajsite ",  #170511-00027#1 add
                          "                AND a.inaj006 = b.inaj006 ",
                          "                AND a.inaj007 = b.inaj007 ",
                          "                AND a.inaj008 = b.inaj008 ",
                          "                AND a.inaj009 = b.inaj009 ",
                          "                AND a.inaj010 = b.inaj010 ",
                          "                AND a.inaj045 = b.inaj045 ",
                          "                AND b.inaj022 <= a.inaj022),0) aa",
                          "   FROM inaj_t a",
                          "   WHERE a.inajent = ",g_enterprise,"",
                          "     AND a.inajsite = '",l_inaj.inajsite,"'",
                          "     AND a.inaj005 = '",l_inaj.inaj005,"'",
                          "     AND a.inaj006 = '",l_inaj.inaj006,"'",
                          "     AND a.inaj007 = '",l_inaj.inaj007,"'",
                          "     AND a.inaj008 = '",l_inaj.inaj008,"'",
                          "     AND a.inaj009 = '",l_inaj.inaj009,"'",
                          "     AND a.inaj010 = '",l_inaj.inaj010,"'",   
                          "     AND a.inaj045 = '",l_inaj.inaj045,"'",
                          #"     AND a.inaj022 BETWEEN '",l_inaj.inaj022,"' AND '",l_edate,"' ",  #PGS(D)-12133 memo mark
                          "     AND a.inaj022 BETWEEN ? AND ? ",  #PGS(D)-12133 memo add
                          #PGS(D)-10167 -S-
                          #" )",
                          " ) t51 ",
                          #PGS(D)-10167 -E-
                          " WHERE aa < ",l_qty3
      END IF        #170619-00049#2 add                
      LET l_cnt = 0
      PREPARE inag008_chk_p FROM l_sql
      #EXECUTE inag008_chk_p INTO l_cnt #PGS(D)-12133 memo mark
      EXECUTE inag008_chk_p USING l_inaj.inaj022,l_edate INTO l_cnt   #PGS(D)-12133 memo add
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "ain-00245"
        #LET g_errparam.extend = g_inaj.inaj005  #180419-00065#1 mark
         LET g_errparam.extend = l_extend        #180419-00065#1
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         LET r_flag = 0 
         RETURN r_success,r_flag
      END IF       
#161202-00031#1---mod---e      
   END IF   
   #161116-00015#1-E
#150605 pengu add
IF p_type = '-1' THEN  #180129-00009#1
#檢查庫存量-在揀量-備置量後是否足夠庫存  #160408-00035#1連備置一起考慮
   #有沒有在揀量明細資料
   LET l_n = 0 
   SELECT COUNT(1) INTO l_n FROM inap_t 
    WHERE inapent = g_enterprise  AND inapsite = g_site
      #PGS(D)-10167 -S-
      #AND inap001 = p_docno       AND inap002 = p_seq1
      AND inap001 = p_docno       AND inap002 = CAST(p_seq1 AS CHAR)
      #PGS(D)-10167 -E-
      
   IF cl_null(l_n) THEN　LET l_n = 0 END IF    

   #161108-00045#1-s
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   IF l_success THEN
      #D-BAS-0070：出库单据考虑在拣量
      LET l_para = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0070')
   END IF
   #161108-00045#1-e
   
   #180130-00042#1-s
   #l_qty4：備置量
   LET l_qty4 = 0
  #LET l_sql = " SELECT xmdr008 FROM xmdr_t,xmdl_t ",            #180316-00018#1 mark
   #LET l_sql = " SELECT (xmdr008-xmdr009) FROM xmdr_t,xmdl_t ",  #180316-00018#1 #181019-00026#1 mark
   #191028-00071#1 add(s)
   SELECT imaf058 INTO l_imaf058
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imaf001 = p_inag001
      AND imafsite = g_site
   IF l_imaf058 <> '2' OR cl_null(l_imaf058) THEN  
   #191028-00071#1 add(e)   
      #181019-00026#1 add start -----
      LET l_sql = " SELECT SUM(qty4) FROM (", 
                  " SELECT (xmdr008-xmdr009) qty4 FROM xmdr_t,xmdl_t ",
      #181019-00026#1 add end   -----
                  "  WHERE xmdlent = ",g_enterprise," AND xmdlsite = '",g_site,"' AND xmdldocno = '",p_docno,"' AND xmdlseq = ",p_seq1," ",
                  "    AND xmdlent = xmdrent AND xmdlsite = xmdrsite AND xmdl003 = xmdrdocno AND xmdl004 = xmdrseq AND xmdl005 = xmdrseq1 AND xmdl006 = xmdrseq2 ",
                  "  UNION ",
                 #" SELECT sfbb008 FROM sfbb_t,sfdc_t ",            #180316-00018#1 mark
                  #" SELECT (sfbb008-sfbb009) FROM sfbb_t,sfdc_t ",  #180316-00018#1 #181019-00026#1 mark
                  " SELECT (sfbb008-sfbb009) qty4 FROM sfbb_t,sfdc_t ",  #181019-00026#1 add
                  "  WHERE sfdcent = ",g_enterprise," AND sfdcsite = '",g_site,"' AND sfdcdocno = '",p_docno,"' AND sfdcseq = ",p_seq1," ",
                  "    AND sfdcent = sfbbent AND sfdcsite = sfbbsite AND sfdc001 = sfbbdocno AND sfdc002 = sfbbseq AND sfdc003 = sfbbseq1 ", #181019-00026#1 add ,
                  #PGS(D)-10167 -S-
                  #" )" #181019-00026#1 add
                  " ) t51 "
                  #PGS(D)-10167 -E-
   #191028-00071#1 add(s)
   ELSE
      LET l_sql = " SELECT SUM(qty4) FROM (", 
                  " SELECT (xmdr008-xmdr009) qty4 FROM xmdr_t,xmdl_t ",
      #181019-00026#1 add end   -----
                  "  WHERE xmdlent = ",g_enterprise," AND xmdlsite = '",g_site,"' AND xmdldocno = '",p_docno,"' AND xmdlseq = ",p_seq1," ",
                  "    AND xmdlent = xmdrent AND xmdlsite = xmdrsite AND xmdl003 = xmdrdocno AND xmdl004 = xmdrseq AND xmdl005 = xmdrseq1 AND xmdl006 = xmdrseq2 ",
                  "    AND xmdr001 = '",p_inag001,"' AND xmdr002 = '",p_inag002,"' AND xmdr003 = '",p_inag003,"' AND xmdr004 = '",p_inag004,"'",
                  "    AND xmdr005 = '",p_inag005,"' AND xmdr006 = '",p_inag006,"' AND xmdr007 = '",p_inag007,"'",
                  "  UNION ",
                 #" SELECT sfbb008 FROM sfbb_t,sfdc_t ",            #180316-00018#1 mark
                  #" SELECT (sfbb008-sfbb009) FROM sfbb_t,sfdc_t ",  #180316-00018#1 #181019-00026#1 mark
                  " SELECT (sfbb008-sfbb009) qty4 FROM sfbb_t,sfdc_t ",  #181019-00026#1 add
                  "  WHERE sfdcent = ",g_enterprise," AND sfdcsite = '",g_site,"' AND sfdcdocno = '",p_docno,"' AND sfdcseq = ",p_seq1," ",
                  "    AND sfdcent = sfbbent AND sfdcsite = sfbbsite AND sfdc001 = sfbbdocno AND sfdc002 = sfbbseq AND sfdc003 = sfbbseq1 ", #181019-00026#1 add ,
                  "    AND sfbb001 = '",p_inag001,"' AND sfbb002 = '",p_inag002,"' AND sfbb003 = '",p_inag003,"' AND sfbb004 = '",p_inag004,"'",
                  #"    AND sfbb005 = '",p_inag005,"' AND sfbb006 = '",p_inag006,"' AND sfbb007 = '",p_inag007,"'" #PGS(D)-13130 meno mark
                  "    AND sfbb005 = '",p_inag005,"' AND sfbb006 = '",p_inag006,"' AND sfbb007 = '",p_inag007,"' ) t51 " #PGS(D)-13130 meno add
   END IF
   #191028-00071#1 add(e)
   PREPARE get_qty4_p FROM l_sql
   EXECUTE get_qty4_p INTO l_qty4
   IF cl_null(l_qty4) THEN LET l_qty4 = 0 END IF
   #180130-00042#1-e
   #170828-00031#1-s
   #l_qty3：在揀量
   LET l_qty3 = 0
   SELECT SUM(inap013) INTO l_qty3 FROM inap_t
    WHERE inapent = g_enterprise AND inapsite = g_site
      #PGS(D)-10167 -S-
      #AND inap001 = p_docno AND inap002 = p_seq1 AND inap003 = p_seq2
      AND inap001 = p_docno AND inap002 = CAST(p_seq1 AS CHAR) AND inap003 = CAST(p_seq2 AS CHAR)
      #PGS(D)-10167 -E-
   IF cl_null(l_qty3) THEN LET l_qty3 = 0 END IF
   
  #180313-00040#1-s add
  #同一張單據跑第二筆項次的過帳時,l_qty3的在揀量並沒有將項次1的在揀量扣除,造成判斷時在揀量虛增,
  #這邊將同一張單據前面項次跟現在這筆相同的料、產品特徵、庫存單位、庫、儲、批、庫存管理特徵的在揀量加回
  #l_qty3_1：同一張單據小於本次過帳項次的相同料、產品特徵、庫存單位、庫、儲、批、庫存管理特徵的在揀量 
   LET l_qty3_1 = 0
   LET l_sql3_1 = "SELECT SUM(inap013) FROM inap_t",
                  " WHERE inapent = ",g_enterprise," AND inapsite = '",g_site,"'",
                  #PGS(D)-10167 -S-
                  #"   AND inap001 = '",p_docno,"'    AND inap002 < ",p_seq1,
                  "   AND inap001 = '",p_docno,"'    AND inap002 < '",p_seq1,"'",
                  #PGS(D)-10167 -E-
                  "   AND inap004 = '",p_inag001,"'  AND inap005 = '",p_inag002,"'",
                  "   AND inap012 = '",p_inag007,"'"
   IF NOT cl_null(p_inag004) THEN   #庫位
      LET l_sql3_1 = l_sql3_1," AND inap007 = '",p_inag004,"'"
   END IF
   IF NOT cl_null(p_inag005) THEN   #儲位
      LET l_sql3_1 = l_sql3_1," AND inap008 = '",p_inag005,"'"
   END IF
   IF NOT cl_null(p_inag006) THEN   #批號
      LET l_sql3_1 = l_sql3_1," AND inap009 = '",p_inag006,"'"
   END IF
   #IF NOT cl_null(p_inag007) THEN   #庫存管理特徵  #180627-00049#1 mark
   IF NOT cl_null(p_inag003) THEN   #庫存管理特徵   #180627-00049#1 add
      LET l_sql3_1 = l_sql3_1," AND inap006 = '",p_inag003,"'"
   END IF   
   PREPARE inap013_chk_p FROM l_sql3_1
   EXECUTE inap013_chk_p INTO l_qty3_1
   IF cl_null(l_qty3_1) THEN LET l_qty3_1 = 0 END IF

  #180313-00040#1-e add
   LET l_sql1 = " SELECT SUM(inag008) FROM inag_t ",
                "  WHERE inagent = ",g_enterprise," AND inagsite = '",g_site,"' ",
                "    AND inag001 = '",p_inag001,"' AND inag002 = '",p_inag002,"' ",
                "    AND inag007 = '",p_inag007,"' AND inag008 > 0 "
   LET l_inag008 = 0
   PREPARE inag008_chk_p1 FROM l_sql1
   EXECUTE inag008_chk_p1 INTO l_inag008
   IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
   LET l_sql2 = " SELECT SUM(inan010) FROM inan_t ",
                "  WHERE inanent = ",g_enterprise," AND inansite = '",g_site,"' ",
                "    AND inan001 = '",p_inag001,"' AND inan002 = '",p_inag002,"' ",
                "    AND inan007 = '",p_inag007,"' "
#   IF l_para = 'N' OR p_type = '-1' THEN  #出库单据不考虑在拣量    #171124-00033#1 mark
#   IF l_para = 'N' AND p_type = '-1' THEN #171124-00033#1 mod  #原先写法会导致l_para='N'(不考虑在拣量)或出库单据的都只考虑备置量  #180129-00009#1 mark
  #IF l_para = 'N' OR (cl_null(l_para) AND p_type ='-1')THEN  #180129-00009#1  #180327-00045#1 add #考虑订单供应商直送，出货单取消过账，收货入库单取消过账取消审核作废情况   #180913-00008#1 mark
   IF l_para = 'N' OR (cl_null(l_para) AND p_type ='-1') OR (g_stutflag = 1) THEN   #180913-00008#1 add #過帳段只考慮備置量,不需考慮在撿量
      LET l_sql2 = l_sql2," AND inan000 = '2' "  #只考虑备置量
      LET l_qty3 = 0
      LET l_qty3_1 = 0   #180913-00008#1 add
   END IF
   LET l_sql3 = l_sql2," AND inan004 = ' ' AND inan005 = ' ' AND inan006 = ' ' AND inan003 = ' ' "
   LET l_inag021 = 0
   PREPARE inag008_chk_p2 FROM l_sql3
   EXECUTE inag008_chk_p2 INTO l_inag021
   IF cl_null(l_inag021) THEN LET l_inag021 = 0 END IF
  #IF (l_inag008-l_inag021+l_qty3-p_qty) < 0 THEN  #180130-00042#1 mark
  #IF (l_inag008-l_inag021+l_qty3+l_qty4-p_qty) < 0 THEN  #180130-00042#1           #180313-00040#1 mark
   IF (l_inag008-l_inag021+l_qty3+l_qty3_1+l_qty4-p_qty) < 0 THEN  #180130-00042#1  #180313-00040#1 mod
      LET r_flag = 2
      RETURN r_success,r_flag
   END IF
   #庫
   IF NOT cl_null(p_inag004) THEN
      LET l_sql1 = l_sql1," AND inag004 = '",p_inag004,"' "
      LET l_inag008 = 0
      PREPARE inag008_chk_p3 FROM l_sql1
      EXECUTE inag008_chk_p3 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      LET l_sql2 = l_sql2," AND inan004 = '",p_inag004,"' "
      LET l_sql3 = l_sql2," AND inan005 = ' ' AND inan006 = ' ' AND inan003 = ' ' "
      LET l_inag021 = 0
      PREPARE inag008_chk_p4 FROM l_sql3
      EXECUTE inag008_chk_p4 INTO l_inag021
      IF cl_null(l_inag021) THEN LET l_inag021 = 0 END IF
     #IF (l_inag008-l_inag021+l_qty3-p_qty) < 0 THEN  #180130-00042#1 mark
     #IF (l_inag008-l_inag021+l_qty3+l_qty4-p_qty) < 0 THEN  #180130-00042#1           #180313-00040#1 mark
      IF (l_inag008-l_inag021+l_qty3+l_qty3_1+l_qty4-p_qty) < 0 THEN  #180130-00042#1  #180313-00040#1 mod
         LET r_flag = 2
         RETURN r_success,r_flag
      END IF
   END IF
   #庫+儲
   IF NOT cl_null(p_inag005) THEN
      LET l_sql1 = l_sql1," AND inag005 = '",p_inag005,"' "
      LET l_inag008 = 0
      PREPARE inag008_chk_p5 FROM l_sql1
      EXECUTE inag008_chk_p5 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      LET l_sql2 = l_sql2," AND inan005 = '",p_inag005,"' "
      LET l_sql3 = l_sql2," AND inan006 = ' ' AND inan003 = ' ' "
      LET l_inag021 = 0
      PREPARE inag008_chk_p6 FROM l_sql3
      EXECUTE inag008_chk_p6 INTO l_inag021
      IF cl_null(l_inag021) THEN LET l_inag021 = 0 END IF
     #IF (l_inag008-l_inag021+l_qty3-p_qty) < 0 THEN  #180130-00042#1 mark
     #IF (l_inag008-l_inag021+l_qty3+l_qty4-p_qty) < 0 THEN  #180130-00042#1           #180313-00040#1 mark
      IF (l_inag008-l_inag021+l_qty3+l_qty3_1+l_qty4-p_qty) < 0 THEN  #180130-00042#1  #180313-00040#1 mod
         LET r_flag = 2
         RETURN r_success,r_flag
      END IF
   END IF
   #170619-00049#2-s add  
   IF NOT g_aic_continue THEN
      #庫+儲+批
      IF NOT cl_null(p_inag006) THEN
         LET l_sql1 = l_sql1," AND inag006 = '",p_inag006,"' "
         LET l_inag008 = 0
         PREPARE inag008_chk_p7 FROM l_sql1
         EXECUTE inag008_chk_p7 INTO l_inag008
         IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
         LET l_sql2 = l_sql2," AND inan006 = '",p_inag006,"' "
         LET l_sql3 = l_sql2," AND inan003 = ' ' "
         LET l_inag021 = 0
         PREPARE inag008_chk_p8 FROM l_sql3
         EXECUTE inag008_chk_p8 INTO l_inag021
         IF cl_null(l_inag021) THEN LET l_inag021 = 0 END IF
        #IF (l_inag008-l_inag021+l_qty3-p_qty) < 0 THEN  #180130-00042#1 mark
        #IF (l_inag008-l_inag021+l_qty3+l_qty4-p_qty) < 0 THEN  #180130-00042#1           #180313-00040#1 mark
         IF (l_inag008-l_inag021+l_qty3+l_qty3_1+l_qty4-p_qty) < 0 THEN  #180130-00042#1  #180313-00040#1 mod
            LET r_flag = 2
            RETURN r_success,r_flag
         END IF
      END IF
   END IF #170619-00049#2 add   
   #庫+儲+批+庫存管理特徵
   IF NOT cl_null(p_inag003) THEN
      LET l_sql1 = l_sql1," AND inag003 = '",p_inag003,"' "
      LET l_inag008 = 0
      PREPARE inag008_chk_p9 FROM l_sql1
      EXECUTE inag008_chk_p9 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      LET l_sql2 = l_sql2," AND inan003 = '",p_inag003,"' "
      LET l_inag021 = 0
      PREPARE inag008_chk_p10 FROM l_sql2
      EXECUTE inag008_chk_p10 INTO l_inag021
      IF cl_null(l_inag021) THEN LET l_inag021 = 0 END IF
     #IF (l_inag008-l_inag021+l_qty3-p_qty) < 0 THEN  #180130-00042#1 mark
     #IF (l_inag008-l_inag021+l_qty3+l_qty4-p_qty) < 0 THEN  #180130-00042#1           #180313-00040#1 mark
      IF (l_inag008-l_inag021+l_qty3+l_qty3_1+l_qty4-p_qty) < 0 THEN  #180130-00042#1  #180313-00040#1 mod
         LET r_flag = 2
         RETURN r_success,r_flag
      END IF
   END IF
   #170828-00031#1-e
END IF  #180129-00009#1
#170828-00031#1-s mark
#   #有沒有在揀量 & 備置量 統計資料
#   LET l_n1 = 0 
#   IF l_para = 'Y'  THEN   #161108-00045#1  #出库单据考虑在拣量
#      SELECT COUNT(1) INTO l_n1 FROM inan_t 
#       WHERE inanent = g_enterprise  AND inansite = g_site
##        AND inan000 = '1'   #160408-00035#1 mark
#         AND inan001 = p_inag001     AND inan002 = p_inag002 
#         AND inan004 = p_inag004
#         AND inan005 = p_inag005     AND inan006 = p_inag006 AND inan003 = p_inag003   #170120-00021#1 add
#         AND inan007 = p_inag007
#         AND inan010 > 0  #150723 by 04441 add
#      IF cl_null(l_n1) THEN LET l_n1 = 0 END IF         
#     
#      #IF l_n = 0 AND l_n1 > 0 THEN   #160408-00035#7 mark
#      IF l_n1 > 0 THEN    #160408-00035#7
#         #檢查庫位的總庫存量-在揀量-備置量是否還有庫存  #160408-00035#1連備置一起考慮
#         LET l_n2 = 0 
#         SELECT COUNT(1) INTO l_n2 FROM inan_t 
#          WHERE inanent = g_enterprise  AND inansite = g_site
#            AND inan001 = p_inag001     AND inan002 = p_inag002
#            AND inan004 = p_inag004
#            AND inan005 = p_inag005     AND inan006 = p_inag006 AND inan003 = p_inag003   #170120-00021#1 add
#            AND inan007 = p_inag007
##           AND inan010 > (SELECT SUM(inag008) - p_qty FROM inag_t  #160408-00035#1 mark
#            #AND inan010 > (SELECT SUM(inag008) FROM inag_t          #160408-00035#1 mod     #170124-00009#1 mark
#            #170124-00009#1 add---start---
#            AND inan010 - (SELECT SUM(inap013) FROM inap_t
#                            WHERE inapent = g_enterprise  AND inapsite = g_site
#                             #AND inap001 = p_doc         AND inap004 = p_inag001     #170516-00005#1 mark
#                              AND inap001 = p_docno       AND inap004 = p_inag001     #170516-00005#1 add
#                              AND inap005 = p_inag002     AND inap007 = p_inag004
#                              AND inap012 = p_inag007) > (SELECT SUM(inag008) FROM inag_t
#            #170124-00009#1 add---end---
#                            WHERE inagent = g_enterprise  AND inagsite = g_site
#                              AND inag001 = p_inag001     AND inag002 = p_inag002
#                              AND inag004 = p_inag004
#                              AND inag007 = p_inag007     AND inag008 > 0)
#         IF cl_null(l_n2) THEN LET l_n2 = 0 END IF 
#         IF l_n2 > 0 THEN 
#            LET r_flag = 2
#            RETURN r_success,r_flag
#         END IF
#         #161108-00045#1-S
#      ELSE
#         #只考虑备置量
#         SELECT COUNT(1) INTO l_n1 FROM inan_t 
#          WHERE inanent = g_enterprise  AND inansite = g_site
#            AND inan000 = '2'   
#            AND inan001 = p_inag001     AND inan002 = p_inag002 
#            AND inan004 = p_inag004
#            AND inan005 = p_inag005     AND inan006 = p_inag006 AND inan003 = p_inag003   #170120-00021#1 add
#            AND inan007 = p_inag007
#            AND inan010 > 0 
#         IF cl_null(l_n1) THEN LET l_n1 = 0 END IF         
#        
#         IF l_n1 > 0 THEN    
#            #檢查庫位的總庫存量-備置量是否還有庫存  
#            LET l_n2 = 0 
#            SELECT COUNT(1) INTO l_n2 FROM inan_t 
#             WHERE inanent = g_enterprise  AND inansite = g_site
#               AND inan001 = p_inag001     AND inan002 = p_inag002
#               AND inan004 = p_inag004
#               AND inan005 = p_inag005     AND inan006 = p_inag006 AND inan003 = p_inag003  #170120-00021#1 add
#               AND inan007 = p_inag007
#               AND inan000 = '2'   
#               #AND inan010 > (SELECT SUM(inag008) FROM inag_t         #170124-00009#1 mark
#               #170124-00009#1 add---start---
#               AND inan010 - (SELECT SUM(inap013) FROM inap_t
#                               WHERE inapent = g_enterprise  AND inapsite = g_site
#                                #AND inap001 = p_doc         AND inap004 = p_inag001   #170516-00005#1 mark
#                                 AND inap001 = p_docno       AND inap004 = p_inag001   #170516-00005#1 add
#                                 AND inap005 = p_inag002     AND inap007 = p_inag004
#                                 AND inap012 = p_inag007) > (SELECT SUM(inag008) FROM inag_t
#               #170124-00009#1 add---end---
#                               WHERE inagent = g_enterprise  AND inagsite = g_site
#                                 AND inag001 = p_inag001     AND inag002 = p_inag002
#                                 AND inag004 = p_inag004
#                                 AND inag007 = p_inag007     AND inag008 > 0)
#            IF cl_null(l_n2) THEN LET l_n2 = 0 END IF 
#            IF l_n2 > 0 THEN 
#               LET r_flag = 2
#               RETURN r_success,r_flag
#            END IF
#         END IF    
#      END IF 
#      #161108-00045#1-E
#      #檢查庫位+儲位的總庫存量-在揀量-備置量是否還有庫存  #160408-00035#1連備置一起考慮
#      IF NOT cl_null (p_inag005) THEN  
#         LET l_n2 = 0 
#         SELECT COUNT(1) INTO l_n2 FROM inan_t 
#          WHERE inanent = g_enterprise  AND inansite = g_site
#            AND inan001 = p_inag001     AND inan002 = p_inag002
#            AND inan004 = p_inag004     AND inan005 = p_inag005 
#            AND inan006 = p_inag006     AND inan003 = p_inag003                         #170120-00021#1 add
#            AND inan007 = p_inag007
##           AND inan010 > (SELECT SUM(inag008) - p_qty FROM inag_t  #160408-00035#1 mark
#            #AND inan010 > (SELECT SUM(inag008) FROM inag_t          #160408-00035#1 mod   #170124-00009#1 mark
#            #170124-00009#1 add---start---
#            AND inan010 - (SELECT SUM(inap013) FROM inap_t
#                            WHERE inapent = g_enterprise AND inagsite = g_site
#                             #AND inap001 = p_doc        AND inap004 = p_inag001     #170516-00005#1 mark
#                              AND inap001 = p_docno      AND inap004 = p_inag001     #170516-00005#1 add
#                              AND inap005 = p_inag002    AND inap007 = p_inag004
#                              AND inap008 = p_inag005    AND inap012 = p_inag007)
#                         > (SELECT SUM(inag008) FROM inag_t
#            #170124-00009#1 add---end---
#                            WHERE inagent = g_enterprise  AND inagsite = g_site
#                              AND inag001 = p_inag001     AND inag002 = p_inag002
#                              AND inag004 = p_inag004     AND inag005 = p_inag005
#                              AND inag007 = p_inag007     AND inag008 > 0)
#         IF cl_null(l_n2) THEN LET l_n2 = 0 END IF 
#         IF l_n2 > 0 THEN 
#            LET r_flag = 2
#            RETURN r_success,r_flag
#         END IF 
#      END IF           
#           
#      #檢查庫位+儲位+批號的總庫存量-在揀量-備置量是否還有庫存  #160408-00035#1連備置一起考慮
#      IF NOT cl_null (p_inag006) THEN  
#         LET l_n2 = 0 
#         SELECT COUNT(1)  INTO l_n2  FROM inan_t 
#          WHERE inanent = g_enterprise  AND inansite = g_site
#            AND inan001 = p_inag001     AND inan002 = p_inag002
#            AND inan004 = p_inag004     AND inan005 = p_inag005
#            AND inan006 = p_inag006
#            AND inan003 = p_inag003       #170120-00021#1 add            
#            AND inan007 = p_inag007
##           AND inan010 > (SELECT SUM(inag008) - p_qty FROM inag_t  #160408-00035#1 mark
#            #AND inan010 > (SELECT SUM(inag008) FROM inag_t          #160408-00035#1 mod    #170124-00009#1 mark
#            #170124-00009#1 add---start---
#            AND inan010 - (SELECT SUM(inap013) FROM inap_t
#                            WHERE inapent = g_enterprise  AND inapsite = g_site
#                             #AND inap001 = p_doc         AND inap004 = p_inag001   #170516-00005#1 mark
#                              AND inap001 = p_docno       AND inap004 = p_inag001   #170516-00005#1 add
#                              AND inap005 = p_inag002     AND inap007 = p_inag004
#                              AND inap008 = p_inag005     AND inap009 = p_inag006
#                              AND inap012 = p_inag007)
#                        > (SELECT SUM(inag008) FROM inag_t
#            #170124-00009#1 add---end---
#                            WHERE inagent = g_enterprise  AND inagsite = g_site
#                              AND inag001 = p_inag001     AND inag002 = p_inag002
#                              AND inag004 = p_inag004     AND inag005 = p_inag005
#                              AND inag006 = p_inag006
#                              AND inag007 = p_inag007     AND inag008 > 0)
#         IF cl_null(l_n2) THEN LET l_n2 = 0 END IF 
#         IF l_n2 > 0 THEN 
#            LET r_flag = 2
#            RETURN r_success,r_flag
#         END IF     
#      END IF
#    
#      #檢查庫位+儲位+批號+庫存管理特徵的總庫存量-在揀量-備置量是否還有庫存  #160408-00035#1連備置一起考慮
#      IF NOT cl_null (p_inag003) THEN  
#         LET l_n2 = 0 
#         SELECT COUNT(1) INTO l_n2  FROM inan_t 
#          WHERE inanent = g_enterprise  AND inansite = g_site
#            AND inan001 = p_inag001     AND inan002 = p_inag002
#            AND inan004 = p_inag004     AND inan005 = p_inag005
#            AND inan006 = p_inag006     AND inan003 = p_inag003              
#            AND inan007 = p_inag007
##           AND inan010 > (SELECT SUM(inag008) - p_qty FROM inag_t  #160408-00035#1 mark
#            #AND inan010 > (SELECT SUM(inag008) FROM inag_t          #160408-00035#1 mod    #170124-00009#1 mark
#            #170124-00009#1 add---start---
#            AND inan010 - (SELECT SUM(inap013) FROM inap_t
#                            WHERE inapent = g_enterprise  AND inapsite = g_site
#                             #AND inap001 = p_doc         AND inap004 = p_inag001    #170516-00005#1 mark
#                              AND inap001 = p_docno       AND inap004 = p_inag001    #170516-00005#1 add
#                              AND inap005 = p_inag002     AND inap007 = p_inag004
#                              AND inap008 = p_inag005     AND inap009 = p_inag006
#                              AND inap006 = p_inag003     AND inap012 = p_inag007)
#                        > (SELECT SUM(inag008) FROM inag_t
#            #170124-00009#1 add---end---
#                            WHERE inagent = g_enterprise  AND inagsite = g_site
#                              AND inag001 = p_inag001     AND inag002 = p_inag002
#                              AND inag004 = p_inag004     AND inag005 = p_inag005
#                              #AND inag06 = p_inag006      AND inag03 = p_inag003               #170124-00009#1 mark
#                              AND inag006 = p_inag006     AND inag003 = p_inag003               #170124-00009#1 add
#                              AND inag007 = p_inag007     AND inag008 > 0)
#         IF cl_null(l_n2) THEN LET l_n2 = 0 END IF 
#         IF l_n2 > 0 THEN 
#            LET r_flag = 2
#            RETURN r_success,r_flag
#         END IF 
#      END IF
#   #170516-00005#1 add --(S)--
#   ELSE
#      #若單別設定不需撿核在撿量也需撿核備置量
#      #若是發料單或是出貨單須扣除本身單據的備置量,因此須查到來源單據
#      IF g_prog[1,6]='asft31' THEN
#         SELECT sfdc001,sfdc002
#           INTO l_docno_from,l_seq_from         
#           FROM sfdc_t
#          WHERE sfdcent = g_enterprise AND sfdcsite = g_site
#            AND sfdcdocno = p_docno AND sfdcseq = p_seq1
#      END IF
#      IF g_prog[1,3]='axm' THEN
#         SELECT xmdl003,xmdl004
#           INTO l_docno_from,l_seq_from         
#           FROM xmdl_t
#          WHERE xmdlent = g_enterprise AND xmdlsite = g_site
#            AND xmdldocno = p_docno AND xmdlseq = p_seq1
#      END IF
#      IF cl_null(l_docno_from) THEN LET l_docno_from = ' ' END IF
#     #IF cl_null(l_seq_from) THEN LET l_seq_from = ' ' END IF   #170602-00036#1 mark
#      IF cl_null(l_seq_from) THEN LET l_seq_from = 0 END IF     #170602-00036#1 add
#      #170724-00041#4 by sakura mark(S)
#      #CALL s_inventory_check_inan(g_site,p_inag001,p_inag002,
#      #                                  p_inag003,p_inag004,p_inag005,p_inag006,
#      #                                  p_inag007,p_qty,
#      #                                  p_docno,p_seq1,'0',l_docno_from,l_seq_from) RETURNING l_success,l_flag
#      #170724-00041#4 by sakura mark(E)
#      #170724-00041#4 by sakura add(S)
#      #增加傳入參數p_imafsite
#      CALL s_inventory_check_inan(g_site,p_inag001,p_inag002,
#                                        p_inag003,p_inag004,p_inag005,p_inag006,
#                                        p_inag007,p_qty,
#                                        p_docno,p_seq1,'0',l_docno_from,l_seq_from,p_imafsite) RETURNING l_success,l_flag
#      #170724-00041#4 by sakura add(E)                                        
#      IF NOT l_success OR l_flag = 0 THEN   #庫存量不足
#         LET r_flag = 0
#         LET r_success = FALSE
#         RETURN r_success,r_flag
#      END IF   
#   #170516-00005#1 add --(E)--   
#   END IF           
##150605 pengu end
#170828-00031#1-e mark
   #170619-00049#2-s add  
   IF g_aic_continue THEN
      #检查库存量足够否
      LET l_inag008 = ''
      LET l_inag021 = ''
      SELECT inag008,inag021 INTO l_inag008,l_inag021
        FROM inag_t
       WHERE inagent = g_enterprise  AND inagsite = g_site
         AND inag001 = p_inag001     AND inag002 = p_inag002
         AND inag003 = p_inag003     AND inag004 = p_inag004
         AND inag005 = p_inag005     
         AND inag007 = p_inag007
   ELSE
   #170619-00049#2-e add
      #检查库存量足够否
      LET l_inag008 = ''
      LET l_inag021 = ''
      SELECT inag008,inag021 INTO l_inag008,l_inag021
        FROM inag_t
       WHERE inagent = g_enterprise  AND inagsite = g_site
         AND inag001 = p_inag001     AND inag002 = p_inag002
         AND inag003 = p_inag003     AND inag004 = p_inag004
         AND inag005 = p_inag005     AND inag006 = p_inag006
         AND inag007 = p_inag007
   END IF   #170619-00049#2 add
   IF p_type = '0' OR (p_type = '2' AND p_qty < 0) THEN 
      IF p_qty < 0 THEN 
         LET p_qty = p_qty * (-1)
      END IF 
      IF p_qty <= l_inag008 THEN 
         LET r_success = TRUE
         LET r_flag = 1
         RETURN r_success,r_flag
      END IF 
      IF p_qty > l_inag008 THEN 
         LET r_success = TRUE
         LET r_flag = 0
         RETURN r_success,r_flag
      END IF
   END IF 
   IF p_type = '-1' THEN
      IF p_qty <= l_inag008 - l_inag021 THEN
         LET r_success = TRUE
         LET r_flag = 1
         RETURN r_success,r_flag
      END IF
      IF p_qty > l_inag008 - l_inag021 THEN
         LET r_success = TRUE
         LET r_flag = 0
         RETURN r_success,r_flag
      END IF
   END IF 
      
   RETURN r_success,r_flag
END FUNCTION
# # # ################################################################################
# # # # Descriptions...: 检核参考单位/包装库存量
# # # # Memo...........:
# # # # Usage..........: CALL s_inventory_check_inah009(p_type,p_inah001,p_inah002,p_inah003,p_inah004,p_inah005,p_inah006,p_inah007,p_inah008,p_qty,p_docno,p_seq1,p_seq2)
# # # #                       RETURNING r_success,r_flag
# # # # Input parameter: 1.p_type    LIKE type_t.chr2    异动类型  -1:出库, 0:报废, 2:盘点
# # # #                  2.p_inah001 LIKE inah_t.inah001 料件编号
# # # #                  3.p_inah002 LIKE inah_t.inah002 产品特征
# # # #                  4.p_inah003 LIKE inah_t.inah003 库存管理特征
# # # #                  5.p_inah004 LIKE inah_t.inah004 库位
# # # #                  6.p_inah005 LIKE inah_t.inah005 储位
# # # #                  7.p_inah006 LIKE inah_t.inah006 批号
# # # #                  8.p_inah007 LIKE inah_t.inah007 参考单位/包装编号
# # # #                  9.p_inah008 LIKE inah_t.inah008 库存类型  1:参考单位，2：包装编号
# # # #                  10.p_qty    LIKE inah_t.inah008 异动数量
# # # #                  11.p_docno  LIKE type_t.chr20   单据编号    
# # # #                  12.p_seq1   LIKE type_t.num5    项次
# # # #                  13.p_seq2   LIKE type_t.num5    项序   
# # # # Return code....: 1.r_success 处理状态TRUE/FALSE
# # # #                  2.r_flag    1:库存足够, 0:库存不足
# # # # Date & Author..: 13/07/10 By wuxja
# # # # Modify.........:
# # # ################################################################################
PUBLIC FUNCTION s_inventory_check_inah009(p_type,p_inah001,p_inah002,p_inah003,p_inah004,p_inah005,p_inah006,p_inah007,p_inah008,p_qty,p_docno,p_seq1,p_seq2)
DEFINE p_inah001      LIKE inah_t.inah001   #料件编号
DEFINE p_inah002      LIKE inah_t.inah002   #产品特征
DEFINE p_inah003      LIKE inah_t.inah003   #库存管理特征
DEFINE p_inah004      LIKE inah_t.inah004   #库位
DEFINE p_inah005      LIKE inah_t.inah005   #储位
DEFINE p_inah006      LIKE inah_t.inah006   #批号
DEFINE p_inah007      LIKE inah_t.inah007   #参考单位/包装编号
DEFINE p_inah008      LIKE inah_t.inah008   #库存类型  1:参考单位，2：包装编号
DEFINE p_type         LIKE type_t.chr2      #异动类型  -1:出库, 0:报废, 2:盘点
DEFINE p_qty          LIKE inah_t.inah009   #异动数量
DEFINE p_docno        LIKE type_t.chr20     #单据编号
DEFINE p_seq1         LIKE type_t.num5      #项次
DEFINE p_seq2         LIKE type_t.num5      #项序   
DEFINE r_success      LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE r_flag         LIKE type_t.num5      #1:库存足够, 0:库存不足
DEFINE l_inah009      LIKE inah_t.inah009 
DEFINE l_n            LIKE type_t.num5


   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_flag = 1
   
   #检查：料件编号不可为空
   IF cl_null(p_inah001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00123'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,''
   END IF 

   #检查：库位不可为空
   IF cl_null(p_inah004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00126'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,''
   END IF 
   
   #检查：参考单位/包装编号不可为空
   IF cl_null(p_inah007) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00128'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,''
   END IF 

   #检查：产品特征,库存管理特征,储位和批号为空，则给空格
   IF cl_null(p_inah002) THEN LET p_inah002 = ' ' END IF 
   IF cl_null(p_inah003) THEN LET p_inah003 = ' ' END IF
   IF cl_null(p_inah005) THEN LET p_inah005 = ' ' END IF 
   IF cl_null(p_inah006) THEN LET p_inah006 = ' ' END IF 
   
   #检查是否允许负库存
   
   #检查是否已存在于参考单位/包装库存明细档中
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM inah_t
    WHERE inah001 = p_inah001
      AND inah002 = p_inah002
      AND inah003 = p_inah003
      AND inah004 = p_inah004
      AND inah005 = p_inah005
      AND inah006 = p_inah006
      AND inah007 = p_inah007
      AND inahent = g_enterprise
      AND inahsite = g_site
   IF l_n = 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00146'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
      RETURN r_success,r_flag
   END IF
   
   #检查库存量足够否
   LET l_inah009 = ''
   SELECT inah009 INTO l_inah009
     FROM inah_t
    WHERE inah001 = p_inah001
      AND inah002 = p_inah002
      AND inah003 = p_inah003
      AND inah004 = p_inah004
      AND inah005 = p_inah005
      AND inah006 = p_inah006
      AND inah007 = p_inah007
      AND inahent = g_enterprise
      AND inahsite = g_site
   IF p_type = '0' OR p_type = '-1' OR (p_type = '2' AND p_qty < 0) THEN 
      IF p_qty < 0 THEN 
         LET p_qty = p_qty * (-1)
      END IF 
      IF p_qty <= l_inah009 THEN 
         LET r_success = TRUE
         LET r_flag = 1
         RETURN r_success,r_flag
      END IF 
      IF p_qty > l_inah009 THEN 
         LET r_success = TRUE
         LET r_flag = 0
         RETURN r_success,r_flag
      END IF
   END IF

   RETURN r_success,r_flag
END FUNCTION
################################################################################
# Descriptions...: 获取据点+料号+产品特征+库位+储位+批号+库存管理特征+库存单位的在揀量
# Memo...........: 库存使用单一单位,只抓存储为库存单位的库存量
#                  库存不使用单一单位的，抓存储为指定库存单位的库存量
#                  指定库储批或库存特征不为空，取该料+料件特征对应库储批的在拣量（inan010换算成发料单位数量）
#                  指定库储批或库存特征为空，取该料+料件特征所有库储批的在拣量合计
# Usage..........: CALL s_inventory_get_inan010_2(p_inansite,p_inan001,p_inan002,p_inan004,p_inan005,p_inan006,p_inan003,p_unit)
#                  RETURNING r_qty
# Input parameter: p_inansite   营运据点
#                : p_inan001    料件编号
#                : p_inan002    产品特征
#                : p_inan004    库位
#                : p_inan005    储位
#                : p_inan006    批号
#                : p_inan003    库存管理特征
#                : p_unit       需返回的数量的单位
# Return code....: r_success 处理状态TRUE/FALSE
#                  r_qty     在揀量 
# Date & Author..: 2014/08/19 By ming  
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_get_inan010_2(p_inansite,p_inan001,p_inan002,p_inan004,p_inan005,p_inan006,p_inan003,p_unit)
   DEFINE p_inansite    LIKE inag_t.inagsite #营运据点
   DEFINE p_inan001     LIKE inag_t.inag001  #料件编号
   DEFINE p_inan002     LIKE inag_t.inag002  #产品特征
   DEFINE p_inan004     LIKE inag_t.inag004  #库位
   DEFINE p_inan005     LIKE inag_t.inag005  #储位
   DEFINE p_inan006     LIKE inag_t.inag006  #批号
   DEFINE p_inan003     LIKE inag_t.inag003  #库存管理特征
   DEFINE p_unit        LIKE inag_t.inag007  #需返回的数量的单位
   DEFINE r_success     LIKE type_t.num5 
   DEFINE r_qty         LIKE inag_t.inag008
   DEFINE l_sql         STRING
   DEFINE l_inan007     LIKE inag_t.inag007  #库存单位
   DEFINE l_inan010     LIKE inag_t.inag008  #在揀量  
   DEFINE l_rate        LIKE inaj_t.inaj014  #单位换算率
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_imaf053     LIKE imaf_t.imaf053  #库存单位
   DEFINE l_imaf054     LIKE imaf_t.imaf054  #库存多单位否
   DEFINE l_inan0101    LIKE inag_t.inag008  #add--2015/01/08 By Shiun

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_qty = 0
   
   #200317-00046#1---add----str---
   IF cl_null(p_inan004) THEN
       LET p_inan004 = ' '
   END IF
   IF cl_null(p_inan005) THEN
       LET p_inan005 = ' '
   END IF
   IF cl_null(p_inan006) THEN
       LET p_inan006 = ' '
   END IF
   IF cl_null(p_inan003) THEN
       LET p_inan003 = ' '
   END IF
   #200317-00046#1---add----end---

   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_inansite) OR cl_null(p_inan001) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'     #傳入值為空 
   #   LET g_errparam.EXTEND = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   LET r_success = FALSE
   #   RETURN r_success,r_qty
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inansite) THEN
      CALL s_azzi902_get_gzzd("ainq120","lbl_inagsite") RETURNING g_colname_1,g_comment_1   #營運據點
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_inan001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件编号
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
      RETURN r_success,r_qty
   END IF   
   #170816-00007#1 by 02159 add(E)

   IF cl_null(p_inan002) THEN  #产品特征
      LET p_inan002 = ' '
   END IF

   #检查料件是否使用多单位，及库存单位
   SELECT imaf053,imaf054 INTO l_imaf053,l_imaf054
     FROM imaf_t
    WHERE imafent = g_enterprise 
      AND imafsite = p_inansite 
      AND imaf001 = p_inan001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.EXTEND = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF
   IF l_imaf054='N' AND cl_null(l_imaf053) THEN
      #缺少库存单位,请查询[集团预设料件据点库存资料维护作业aimm202]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00203'
      LET g_errparam.EXTEND = p_inan001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE 
      RETURN r_success,r_qty
   END IF

   #若目标单位为空，则默认为料件的据点库存单位
   IF cl_null(p_unit) THEN
      LET p_unit = l_imaf053
   END IF

   IF cl_null(p_unit) THEN
      #获取不到目标单位,请查询[料件据点库存资料维护作业aimm212]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00192'
      LET g_errparam.EXTEND = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF

   #若非多单位，则只获取库存单位的量，折算成目的单位
   #若多单位，则所有单位的量均获取，折算成目的单位
   LET l_sql = " SELECT inan007,inan010 FROM inan_t ",
               "  WHERE inanent = ",g_enterprise,
               "    AND inansite= '",p_inansite,"' ", #营运据点
               "    AND inan001 = '",p_inan001,"' ",  #料件编号
               "    AND inan002 = '",p_inan002,"' "   #产品特征
   #200317-00046#1--add----str----
   IF cl_null(p_inan004) AND cl_null(p_inan005) AND cl_null(p_inan006) AND cl_null(p_inan003) THEN
       #庫/儲/批/庫存管理特徵皆為空時
       LET l_sql = l_sql CLIPPED,
                   " AND inan004 = ' ' ",
                   " AND inan005 = ' ' ",
                   " AND inan006 = ' ' ",
                   " AND inan003 = ' ' "
   ELSE
   #200317-00046#1--add----end----
       IF NOT cl_null(p_inan004) THEN
          LET l_sql = l_sql CLIPPED,"    AND inan004 = '",p_inan004,"' "   #库位 
       END IF
       IF NOT cl_null(p_inan005) THEN
          LET l_sql = l_sql CLIPPED,"    AND inan005 = '",p_inan005,"' "   #储位
       END IF
       IF NOT cl_null(p_inan006) THEN
          LET l_sql = l_sql CLIPPED,"    AND inan006 = '",p_inan006,"' "   #批号
       END IF
       IF NOT cl_null(p_inan003) THEN
          LET l_sql = l_sql CLIPPED,"    AND inan003 = '",p_inan003,"' "   #库存管理特征
       END IF
   END IF #200317-00046#1 add

   IF l_imaf054 = 'Y' THEN   #库存使用多单位
      LET l_sql = l_sql CLIPPED," AND inan007='",p_unit,"' "   #单位=目的单位
   ELSE  #库存使用单一单位
      LET l_sql = l_sql CLIPPED," AND inan007='",l_imaf053,"' "   #单位=库存单位
   END IF

   PREPARE s_inventory_get_inan010_2_p FROM l_sql
   DECLARE s_inventory_get_inan010_2_c CURSOR FOR s_inventory_get_inan010_2_p

   FOREACH s_inventory_get_inan010_2_c INTO l_inan007,l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
      IF p_unit = l_inan007 THEN
         LET r_qty = r_qty + l_inan010
      ELSE
         #modify--2015/01/08 By shiun--(S)
#         CALL s_aimi190_get_convert(p_inan001,l_inan007,p_unit) RETURNING l_success,l_rate
#         IF NOT l_success THEN
#            #错误，需返回错误，数值需继续计算，参考用，调用程序有些可能不需要多精确，但需要有个参考值
#            LET r_success = FALSE
#            LET l_rate = 1 
#         END IF
#         LET r_qty = r_qty + l_inan010 * l_rate
         CALL s_aooi250_convert_qty(p_inan001,l_inan007,p_unit,l_inan010)
              RETURNING l_success,l_inan0101
         IF l_success THEN
            LET l_inan010 = l_inan0101
         END IF
         LET r_qty = r_qty + l_inan010
         #modify--2015/01/08 By shiun--(E)
      END IF
   END FOREACH

   RETURN r_success,r_qty
END FUNCTION

################################################################################
# Descriptions...: 获取据点+料号+产品特征+库位+储位+批号+库存管理特征+库存单位的在揀量
# Memo...........: 库存使用单一单位,只抓存储为库存单位的库存量
#                  库存不使用单一单位的，抓存储为指定库存单位的库存量
#                  无论指定库储批或库存特征是否为空，均取该料+料件特征+传入的库储批+库存管理特征的在揀量（inan010换算成p_unit的数量）
# Usage..........: CALL s_inventory_get_inan010_3(p_inansite,p_inan001,p_inan002,p_inan004,p_inan005,p_inan006,p_inan003,p_unit)
#                  RETURNING r_success,r_qty
# Input parameter: p_inansite   营运据点
#                : p_inan001    料件编号
#                : p_inan002    产品特征
#                : p_inan004    库位
#                : p_inan005    储位
#                : p_inan006    批号
#                : p_inan003    库存管理特征
#                : p_unit       需返回的数量的单位
# Return code....: r_success 处理状态TRUE/FALSE
#                  r_qty     在揀量 
# Date & Author..: 2014/11/24 By zhangllc  
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_get_inan010_3(p_inansite,p_inan001,p_inan002,p_inan004,p_inan005,p_inan006,p_inan003,p_unit)
   DEFINE p_inansite    LIKE inan_t.inansite #营运据点
   DEFINE p_inan001     LIKE inan_t.inan001  #料件编号
   DEFINE p_inan002     LIKE inan_t.inan002  #产品特征
   DEFINE p_inan004     LIKE inan_t.inan004  #库位
   DEFINE p_inan005     LIKE inan_t.inan005  #储位
   DEFINE p_inan006     LIKE inan_t.inan006  #批号
   DEFINE p_inan003     LIKE inan_t.inan003  #库存管理特征
   DEFINE p_unit        LIKE inan_t.inan007  #需返回的数量的单位
   DEFINE r_success     LIKE type_t.num5 
   DEFINE r_qty         LIKE inan_t.inan010
   DEFINE l_sql         STRING
   DEFINE l_inan007     LIKE inan_t.inan007  #库存单位
   DEFINE l_inan010     LIKE inan_t.inan010  #在揀量  
   DEFINE l_rate        LIKE inaj_t.inaj014  #单位换算率
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_imaf053     LIKE imaf_t.imaf053  #库存单位
   DEFINE l_imaf054     LIKE imaf_t.imaf054  #库存多单位否
   DEFINE l_inan0101    LIKE inan_t.inan010  #add--2015/01/08 By Shiun

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_qty = 0
   
   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_inansite) OR cl_null(p_inan001) OR cl_null(p_inan004) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00001'     #傳入值為空 
   #   LET g_errparam.EXTEND = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #
   #   LET r_success = FALSE
   #   RETURN r_success,r_qty
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inansite) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inagsite") RETURNING g_colname_1,g_comment_1   #营运据点
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_inan001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件编号
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_inan004) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag004") RETURNING g_colname_1,g_comment_1   #库位
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
      RETURN r_success,r_qty
   END IF   
   #170816-00007#1 by 02159 add(E)   

   IF cl_null(p_inan002) THEN  #产品特征
      LET p_inan002 = ' '
   END IF
   IF cl_null(p_inan005) THEN  #储位
      LET p_inan005 = ' '
   END IF
   IF cl_null(p_inan006) THEN  #批号
      LET p_inan006 = ' '
   END IF
   IF cl_null(p_inan003) THEN  #库存管理特征
      LET p_inan003 = ' '
   END IF
   

   #检查料件是否使用多单位，及库存单位
   SELECT imaf053,imaf054 INTO l_imaf053,l_imaf054
     FROM imaf_t
    WHERE imafent = g_enterprise 
      AND imafsite = p_inansite 
      AND imaf001 = p_inan001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.EXTEND = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF
   IF l_imaf054='N' AND cl_null(l_imaf053) THEN
      #缺少库存单位,请查询[集团预设料件据点库存资料维护作业aimm202]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00203'
      LET g_errparam.EXTEND = p_inan001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE 
      RETURN r_success,r_qty
   END IF

   #若目标单位为空，则默认为料件的据点库存单位
   IF cl_null(p_unit) THEN
      LET p_unit = l_imaf053
   END IF

   IF cl_null(p_unit) THEN
      #获取不到目标单位,请查询[料件据点库存资料维护作业aimm212]！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aim-00192'
      LET g_errparam.EXTEND = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_qty
   END IF

   #若非多单位，则只获取库存单位的量，折算成目的单位
   #若多单位，则所有单位的量均获取，折算成目的单位
   LET l_sql = " SELECT inan007,inan010 FROM inan_t ",
               "  WHERE inanent = ",g_enterprise,
               "    AND inansite= '",p_inansite,"' ", #营运据点
               "    AND inan001 = '",p_inan001,"' ",  #料件编号
               "    AND inan002 = '",p_inan002,"' ",  #产品特征
               "    AND inan004 = '",p_inan004,"' ",  #库位
               "    AND inan005 = '",p_inan005,"' ",  #储位
               "    AND inan006 = '",p_inan006,"' ",  #批号
               "    AND inan003 = '",p_inan003,"' "   #库存管理特征

   IF l_imaf054 = 'Y' THEN   #库存使用多单位
      LET l_sql = l_sql CLIPPED," AND inan007='",p_unit,"' "   #单位=目的单位
   ELSE  #库存使用单一单位
      LET l_sql = l_sql CLIPPED," AND inan007='",l_imaf053,"' "   #单位=库存单位
   END IF

   PREPARE s_inventory_get_inan010_3_p FROM l_sql
   DECLARE s_inventory_get_inan010_3_c CURSOR FOR s_inventory_get_inan010_3_p
   FOREACH s_inventory_get_inan010_3_c INTO l_inan007,l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
      IF p_unit = l_inan007 THEN
         LET r_qty = r_qty + l_inan010
      ELSE
         #modify--2015/01/08 By shiun--(S)
#         CALL s_aimi190_get_convert(p_inan001,l_inan007,p_unit) RETURNING l_success,l_rate
#         IF NOT l_success THEN
#            #错误，需返回错误，数值需继续计算，参考用，调用程序有些可能不需要多精确，但需要有个参考值
#            LET r_success = FALSE
#            LET l_rate = 1 
#         END IF
#         LET r_qty = r_qty + l_inan010 * l_rate
         CALL s_aooi250_convert_qty(p_inan001,l_inan007,p_unit,l_inan010)
              RETURNING l_success,l_inan0101
         IF l_success THEN
            LET l_inan010 = l_inan0101
         END IF
         LET r_qty = r_qty + l_inan010
         #modify--2015/01/08 By shiun--(E)
      END IF
   END FOREACH

   RETURN r_success,r_qty
END FUNCTION
# # # # ################################################################################
# # # # # Descriptions...: 检核制造批序号库存量
# # # # # Memo...........:
# # # # # Usage..........: CALL s_inventory_check_inai010(p_type,p_inai001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,p_inai007,p_inai008,p_qty,p_inai009,p_flag)
# # # # #                       RETURNING r_success,r_flag
# # # # # Input parameter: 1.p_type    LIKE type_t.chr2    异动类型   -1:出库, 0:报废, 2:盘点
# # # # #                  2.p_inai001 LIKE inai_t.inai001 料件编号
# # # # #                  3.p_inai002 LIKE inai_t.inai002 产品特征
# # # # #                  4.p_inai003 LIKE inai_t.inai003 库存管理特征
# # # # #                  5.p_inai004 LIKE inai_t.inai004 库位
# # # # #                  6.p_inai005 LIKE inai_t.inai005 储位
# # # # #                  7.p_inai006 LIKE inai_t.inai006 批号
# # # # #                  8.p_inai007 LIKE inai_t.inai007 制造批号
# # # # #                  9.p_inai008 LIKE inai_t.inai008 制造序号
# # # # #                 10.p_qty     LIKE inai_t.inai010 异动数量  
# # # # #                 11.p_inai009 LIKE inai_t.inai009 庫存單位
# # # # #                 12.p_flag    LIKE type_t.chr1    1.扣帳 2.扣帳還原   
# # # # # Return code....: 1.r_success 处理状态TRUE/FALSE
# # # # #                  2.r_flag    1:库存足够, 0:库存不足
# # # # # Date & Author..: 13/07/10 By wuxja
# # # # # Modify.........: 15/04/17 By lixh 增加p_flag 1.扣帳 2.扣帳還原 
# # # # ################################################################################
PUBLIC FUNCTION s_inventory_check_inai010(p_type,p_inai001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,p_inai007,p_inai008,p_qty,p_inai009,p_flag)
DEFINE p_inai001      LIKE inai_t.inai001   #料件编号
DEFINE p_inai002      LIKE inai_t.inai002   #产品特征
DEFINE p_inai003      LIKE inai_t.inai003   #库存管理特征
DEFINE p_inai004      LIKE inai_t.inai004   #库位
DEFINE p_inai005      LIKE inai_t.inai005   #储位
DEFINE p_inai006      LIKE inai_t.inai006   #批号
DEFINE p_inai007      LIKE inai_t.inai007   #参考单位/包装编号
DEFINE p_inai008      LIKE inai_t.inai008   #库存类型  1:参考单位，2：包装编号
DEFINE p_type         LIKE type_t.chr2      #异动类型  -1:出库, 0:报废, 2:盘点
DEFINE p_qty          LIKE inai_t.inai010   #异动数量  
DEFINE p_inai009      LIKE inai_t.inai009   #异动数量  
DEFINE p_flag         LIKE type_t.chr1      #1.扣帳 2.扣帳還原
DEFINE r_success      LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE r_flag         LIKE type_t.num5      #1:库存足够, 0:库存不足
DEFINE l_inai010      LIKE inai_t.inai010
DEFINE l_n            LIKE type_t.num5
DEFINE l_inaa014      LIKE inaa_t.inaa014    #160420-00022#1 add  

   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_flag = 1
   
   #检查：料件编号不可为空
   IF cl_null(p_inai001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00123'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,''
   END IF 
   
   #检查：库位不可为空
   IF cl_null(p_inai004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00126'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,''
   END IF 

   #检查：产品特征,库存管理特征,储位和批号,制造批序号为空，则给空格
   IF cl_null(p_inai002) THEN LET p_inai002 = ' ' END IF 
   IF cl_null(p_inai003) THEN LET p_inai003 = ' ' END IF
   IF cl_null(p_inai005) THEN LET p_inai005 = ' ' END IF 
   IF cl_null(p_inai006) THEN LET p_inai006 = ' ' END IF 
   IF cl_null(p_inai007) THEN LET p_inai007 = ' ' END IF 
   IF cl_null(p_inai008) THEN LET p_inai008 = ' ' END IF 
   
   #检查是否允许负库存
   #160420-00022#1 add(s)
   LET l_inaa014 = ''
   SELECT inaa014 INTO l_inaa014
     FROM inaa_t
    WHERE inaaent = g_enterprise
      AND inaasite = g_site
      AND inaa001 = p_inai004
   IF l_inaa014 = 'Y' THEN 
      RETURN r_success,r_flag
   END IF    
   #160420-00022#1 add(e)
   
   #171218-00024#2-s-add
   #多角續拋不作此檢查
   IF g_aic_continue THEN
      RETURN r_success,r_flag
   END IF
   #171218-00024#2-e-add
   
   #检查是否已存在于制造批序号库存明细档中
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM inai_t
    WHERE inai001 = p_inai001
      AND inai002 = p_inai002
      AND inai003 = p_inai003
      AND inai004 = p_inai004
      AND inai005 = p_inai005
      AND inai006 = p_inai006
      AND inai007 = p_inai007
      AND inai008 = p_inai008
      AND inai009 = p_inai009
      AND inaient = g_enterprise
      AND inaisite = g_site
   IF l_n = 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00147'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
      RETURN r_success,r_flag
   END IF   
     
   #检查库存量足够否
   LET l_inai010 = ''
   SELECT inai010 INTO l_inai010
     FROM inai_t
    WHERE inai001 = p_inai001
      AND inai002 = p_inai002
      AND inai003 = p_inai003
      AND inai004 = p_inai004
      AND inai005 = p_inai005
      AND inai006 = p_inai006
      AND inai007 = p_inai007
      AND inai008 = p_inai008
      AND inai009 = p_inai009
      AND inaient = g_enterprise
      AND inaisite = g_site
   #IF p_type = '0' OR p_type = '-1' OR (p_type = '2' AND p_qty < 0) THEN 
   IF p_type = '0' OR p_type = '-1' OR (p_type = '2' AND p_qty < 0 AND p_flag = '1') 
      OR (p_type = '2' AND p_qty > 0 AND p_flag = '2') THEN   #add by lixh 20150417
      IF p_qty < 0 THEN 
         LET p_qty = p_qty * (-1)
      END IF 
      IF p_qty <= l_inai010 THEN 
         LET r_success = TRUE
         LET r_flag = 1
         RETURN r_success,r_flag
      END IF 
      IF p_qty > l_inai010 THEN 
         LET r_success = TRUE
         LET r_flag = 0
         RETURN r_success,r_flag
      END IF
   END IF

   RETURN r_success,r_flag
END FUNCTION
##################################################################################
# Descriptions...: 收集需要新增[T:庫存明細檔]的資料
# Memo...........:
# Usage..........: CALL s_inventory_ins_inag_collect (p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007,p_inag022,p_inag017,p_inae010,p_inae011,p_imafsite)
# Input parameter: 1.p_inag001   料件编号
#                : 2.p_inag002   产品特征
#                : 3.p_inag003   库存管理特征
#                : 4.p_inag004   库位
#                : 5.p_inag005   储位
#                : 6.p_inag006   批号
#                : 7.p_inag007   单位
#                : 8.p_inag022   备注
#                : 9.p_inag017   第一次入库日期
#                :10.p_inae010   製造日期
#                :11.p_inae011   有效日期
#                :12.p_imafsite  營運據點(流通作業一律傳入ALL,製造傳入g_site或‘’)
# Return code....: 
# Date & Author..: 13/11/14 By wuxja
# Modify.........: 13/12/12 By wuxja   新增参数p_inag007及相关逻辑
# Modify.........: 14/09/26 By pomelo  增加p_site參數 用來區分製造的程式 還是流通的程式
# Modify.........: 15/02/13 By 04441   將p_site改為p_imafsite,只有當抓取imaf_t時,imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
# Modify.........: 15/08/20 By Lori    增加判斷是否為聯營/租賃/費用商品不扣庫存
# Modify.........: 160512-00004 04441  移除p_inag018(NoUse)，新增傳入參數p_inae010製造日期、p_inae011有效日期
##################################################################################
PUBLIC FUNCTION s_inventory_ins_inag_collect(p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007,p_inag022,p_inag017,p_inae010,p_inae011,p_imafsite)
DEFINE p_inag001    LIKE inag_t.inag001
DEFINE p_inag002    LIKE inag_t.inag002
DEFINE p_inag003    LIKE inag_t.inag003
DEFINE p_inag004    LIKE inag_t.inag004
DEFINE p_inag005    LIKE inag_t.inag005
DEFINE p_inag006    LIKE inag_t.inag006
DEFINE p_inag007	  LIKE inag_t.inag007
#DEFINE p_inag018    LIKE inag_t.inag018  #160512-00004#1 mark
DEFINE p_inag022    LIKE inag_t.inag022
DEFINE p_inag017    LIKE inag_t.inag017
DEFINE p_inae010    LIKE inae_t.inae010  #160512-00004#1
DEFINE p_inae011    LIKE inae_t.inae011  #160512-00004#1
DEFINE p_imafsite   LIKE imaf_t.imafsite
DEFINE l_n          LIKE type_t.num5
DEFINE l_m          LIKE type_t.num5
DEFINE l_i          LIKE type_t.num5
DEFINE l_imaf053    LIKE imaf_t.imaf053
DEFINE l_imaf054    LIKE imaf_t.imaf054

   WHENEVER ERROR CONTINUE
   
   #检查：料件编号不可为空
   IF cl_null(p_inag001) THEN RETURN END IF
   
   #检查：库位不可为空
   IF cl_null(p_inag004) THEN RETURN END IF
   
   #检查：产品特征,库存管理特征,储位和批号为空，则给空格
   IF cl_null(p_inag002) THEN LET p_inag002 = ' ' END IF
   IF cl_null(p_inag003) THEN LET p_inag003 = ' ' END IF
   IF cl_null(p_inag005) THEN LET p_inag005 = ' ' END IF
   IF cl_null(p_inag006) THEN LET p_inag006 = ' ' END IF
   
   #150819-00029 150820 by lori add---(S)
   IF s_inventory_chk_prod(p_inag001,p_imafsite) THEN
      RETURN
   END IF
   #150819-00029 150820 by lori add---(E)
   
   #----------14/09/26 By pomelo modify(s)
   IF cl_null(p_imafsite) THEN
      LET p_imafsite = g_site
   END IF
   
   #當p_site = 'ALL' 的時候，表示為流通程式，所以在抓取imaf的資料，imafsite = 'ALL'
   LET l_imaf053 = ''
   LET l_imaf054 = ''
   CASE p_imafsite
      WHEN 'ALL'
         SELECT imaf054 INTO l_imaf054
           FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = p_imafsite
            AND imaf001 = p_inag001
         #抓此料號的庫存單位
         SELECT imaa104 INTO l_imaf053
           FROM imaa_t
          WHERE imaaent = g_enterprise
            AND imaa001 = p_inag001
      OTHERWISE
         #根据料号抓取库存多单位imaf054
         SELECT imaf053,imaf054 INTO l_imaf053,l_imaf054
           FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = g_site
            AND imaf001 = p_inag001
   END CASE
   #----------14/09/26 By pomelo modify(e)
   
   #检查是否已存在于库存明细档中
   LET l_n = 0
   IF l_imaf054 = 'N' THEN
      IF cl_null(l_imaf053) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = "sub-00476"
         LET g_errparam.extend = p_inag001
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN
      END IF
      #170105-00057#4 Mark By 06137  180521(S)
      ##170619-00049#2-s add  
      #IF g_aic_continue THEN
      #   SELECT COUNT(1) INTO l_n
      #     FROM inag_t
      #    WHERE inag001 = p_inag001
      #      AND inag002 = p_inag002
      #      AND inag003 = p_inag003
      #      AND inag004 = p_inag004
      #      AND inag005 = p_inag005
      #      AND inag007 = l_imaf053
      #      AND inagent = g_enterprise
      #      AND inagsite = g_site      
      #ELSE 
      ##170619-00049#2-e add
      #170105-00057#4 Mark By 06137  180521(E)      
         SELECT COUNT(1) INTO l_n
           FROM inag_t
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag006 = p_inag006
            AND inag007 = l_imaf053
            AND inagent = g_enterprise
            AND inagsite = g_site
      #END IF   #170619-00049#2 add  #170105-00057#4 Mark By 06137  180521     
   ELSE
      #170105-00057#4 Mark By 06137  180521(S)
      ##170619-00049#2-s add  
      #IF g_aic_continue THEN
      #   SELECT COUNT(1) INTO l_n
      #     FROM inag_t
      #    WHERE inag001 = p_inag001
      #      AND inag002 = p_inag002
      #      AND inag003 = p_inag003
      #      AND inag004 = p_inag004
      #      AND inag005 = p_inag005
      #      AND inag007 = p_inag007
      #      AND inagent = g_enterprise
      #      AND inagsite = g_site      
      #ELSE
      ##170619-00049#2-e add
      #170105-00057#4 Mark By 06137  180521(E)      
         SELECT COUNT(1) INTO l_n
           FROM inag_t
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag006 = p_inag006
            AND inag007 = p_inag007
            AND inagent = g_enterprise
            AND inagsite = g_site
      #END IF  #170619-00049#2 add    #170105-00057#4 Mark By 06137  180521     
   END IF
   
   IF l_n > 0 THEN
      RETURN
   END IF
   
   LET l_i = g_inventory_inag.getLength()+1
   LET g_inventory_inag[l_i].inag001 = p_inag001
   LET g_inventory_inag[l_i].inag002 = p_inag002
   LET g_inventory_inag[l_i].inag003 = p_inag003
   LET g_inventory_inag[l_i].inag004 = p_inag004
   LET g_inventory_inag[l_i].inag005 = p_inag005  
   LET g_inventory_inag[l_i].inag006 = p_inag006
  #LET g_inventory_inag[l_i].inag018 = p_inag018  #160512-00004#1 mark
   LET g_inventory_inag[l_i].inag022 = p_inag022
   LET g_inventory_inag[l_i].inag017 = p_inag017
   LET g_inventory_inag[l_i].inae010 = p_inae010  #160512-00004#1
   LET g_inventory_inag[l_i].inae011 = p_inae011  #160512-00004#1
   
   IF l_imaf054 = 'N' THEN
      LET g_inventory_inag[l_i].inag007 = l_imaf053
   ELSE
      LET g_inventory_inag[l_i].inag007 = p_inag007
   END IF
   #170105-00057#4 Mark By 06137  180521(S)
   ##170619-00049#2-s add  
   #IF g_aic_continue THEN
   #   FOR l_m = 1 TO l_i - 1
   #       IF g_inventory_inag[l_m].inag001 = g_inventory_inag[l_i].inag001 AND 
   #          g_inventory_inag[l_m].inag002 = g_inventory_inag[l_i].inag002 AND
   #          g_inventory_inag[l_m].inag003 = g_inventory_inag[l_i].inag003 AND
   #          g_inventory_inag[l_m].inag004 = g_inventory_inag[l_i].inag004 AND
   #          g_inventory_inag[l_m].inag005 = g_inventory_inag[l_i].inag005 AND
   #          g_inventory_inag[l_m].inag007 = g_inventory_inag[l_i].inag007 THEN
   #          CALL g_inventory_inag.deleteElement(l_i) 
   #          RETURN
   #       END IF
   #   END FOR   
   #ELSE
   ##170619-00049#2-e add     
   #170105-00057#4 Mark By 06137  180521(E)
      FOR l_m = 1 TO l_i - 1
          IF g_inventory_inag[l_m].inag001 = g_inventory_inag[l_i].inag001 AND 
             g_inventory_inag[l_m].inag002 = g_inventory_inag[l_i].inag002 AND
             g_inventory_inag[l_m].inag003 = g_inventory_inag[l_i].inag003 AND
             g_inventory_inag[l_m].inag004 = g_inventory_inag[l_i].inag004 AND
             g_inventory_inag[l_m].inag005 = g_inventory_inag[l_i].inag005 AND
             g_inventory_inag[l_m].inag006 = g_inventory_inag[l_i].inag006 AND 
             g_inventory_inag[l_m].inag007 = g_inventory_inag[l_i].inag007 THEN
             CALL g_inventory_inag.deleteElement(l_i) 
             RETURN
          END IF
      END FOR       
   #END IF #170619-00049#2 add   #170105-00057#4 Mark By 06137  180521  
   SELECT imaal003,imaal004
     INTO g_inventory_inag[l_i].imaal003,g_inventory_inag[l_i].imaal004
     FROM imaal_t
    WHERE imaal001 = g_inventory_inag[l_i].inag001
      AND imaal002 = g_lang 
      AND imaalent = g_enterprise    #170515-00070#1 add      
   
   RETURN
END FUNCTION
################################################################################
# Descriptions...: 若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
#                  若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
# Memo...........:
# Usage..........: CALL s_inventory_unit(p_site,p_item,p_unit,p_qty,p_imafsite)
#                  RETURNING r_success,r_unit,r_qty
# Input parameter: p_site      營運據點
#                : p_item      料件編號
#                : p_unit      交易單位
#                : p_qty       數量
#                : p_imafsite  營運據點 (流通傳ALL/製造傳g_site或'')
# Return code....: r_success   處理狀態
#                : r_unit      庫存單位
#                : r_qty       庫存數量
# Date & Author..: 14/03/18 By 04441
# Modify.........: 14/09/26 By pomelo  增加p_site1參數 用來區分製造還是流通的程式
# Modify.........: 15/02/13 By 04441   將p_site1改為p_imafsite,只有當抓取imaf_t時,imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
################################################################################
PUBLIC FUNCTION s_inventory_unit(p_site,p_item,p_unit,p_qty,p_imafsite)
DEFINE p_site       LIKE inap_t.inapsite
DEFINE p_item       LIKE imaf_t.imaf001
DEFINE p_unit       LIKE imaf_t.imaf053
DEFINE p_qty        LIKE inap_t.inap011
DEFINE p_imafsite   LIKE imaf_t.imafsite
DEFINE r_success    LIKE type_t.num5
DEFINE r_unit       LIKE imaf_t.imaf053
DEFINE r_qty        LIKE imaf_t.imaf023
DEFINE l_imaf053    LIKE imaf_t.imaf053  #據點庫存單位
DEFINE l_imaf054    LIKE imaf_t.imaf054  #庫存多單位


   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_unit = ''
   LET r_qty = ''

   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_item) OR cl_null(p_unit) OR cl_null(p_qty) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success,r_unit,r_qty
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_item) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1  #料件編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_unit) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq200","lbl_xmdp015") RETURNING g_colname_1,g_comment_1   #交易單位
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_qty) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq100","lbl_inag008") RETURNING g_colname_1,g_comment_1   #數量
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
      RETURN r_success,r_unit,r_qty
   END IF   
   #170816-00007#1 by 02159 add(E)   

   IF cl_null(p_site) THEN LET p_site = g_site END IF
   IF cl_null(p_imafsite) THEN LET p_imafsite = g_site END IF
   
   #當p_imafsite = 'ALL' 的時候，表示為流通程式
   LET l_imaf053 = ''
   LET l_imaf054 = ''
   CASE p_imafsite
      WHEN 'ALL'
         SELECT imaf054 INTO l_imaf054
           FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = p_imafsite
            AND imaf001 = p_item
         #抓此料號的庫存單位
         SELECT imaa104 INTO l_imaf053
           FROM imaa_t
          WHERE imaaent = g_enterprise
            AND imaa001 = p_item
      OTHERWISE
         SELECT imaf053,imaf054
           INTO l_imaf053,l_imaf054
           FROM imaf_t
          WHERE imafent = g_enterprise
            AND imafsite = p_site
            AND imaf001 = p_item
   END CASE
   
   #此料件不存在對應的據點庫存單位！
   IF cl_null(l_imaf053) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00476'
      LET g_errparam.extend = p_item
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_unit,r_qty
   END IF      
   
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   IF l_imaf054 = 'Y' THEN
      LET r_unit = p_unit
      LET r_qty = p_qty
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   ELSE
      LET r_unit = l_imaf053
      CALL s_aooi250_convert_qty(p_item,p_unit,r_unit,p_qty)
           RETURNING r_success,r_qty
   END IF
  
   RETURN r_success,r_unit,r_qty
   
END FUNCTION
################################################################################
# Descriptions...: 开窗维护并新增inag_t
# Memo...........: 在调用此元件之前先要调用s_inventory_ins_inag_collect元件收集资料insert
# Usage..........: CALL s_inventory_ins_inag(p_imafsite)
#                  RETURNING r_success
# Input parameter: p_imafsite 營運據點(流通作業一律傳入ALL,製造傳入g_site或‘’)
# Return code....: r_success  处理状态TRUE/FALSE
# Date & Author..: 13/11/14 By wuxja
# Modify.........: 14/09/03 By pengu 1.在insert inag_t時改成不要開窗詢問
#                                    2.判斷料件批號是否存在基本資料檔中，若不存在則自動insert
# Modify.........: 14/09/18 By 04441   add VMI
# Modify.........: 14/09/26 By pomelo  增加p_site參數 用來區分製造的程式 還是流通的程式
# Modify.........: 15/02/13 By 04441   將p_site改為p_imafsite,只有當抓取imaf_t時
#                                      imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
################################################################################
PUBLIC FUNCTION s_inventory_ins_inag(p_imafsite)
DEFINE p_imafsite   LIKE imaf_t.imafsite
DEFINE r_success    LIKE type_t.num5      #处理状态TRUE/FALSE
#160512-00004#1-s modify
#DEFINE l_inag  DYNAMIC ARRAY OF RECORD  #数组变量
#    inag001    LIKE inag_t.inag001,
#    imaal003   LIKE imaal_t.imaal003,
#    imaal004   LIKE imaal_t.imaal004,
#    inag002    LIKE inag_t.inag002,
#    inag003    LIKE inag_t.inag003,
#    inag004    LIKE inag_t.inag004,
#    inag005    LIKE inag_t.inag005,
#    inag006    LIKE inag_t.inag006,
#    inag007    LIKE inag_t.inag007,
#    inag018    LIKE inag_t.inag018,
#    inag022    LIKE inag_t.inag022,
#    inag017    LIKE inag_t.inag017
#           END RECORD
DEFINE l_inag  DYNAMIC ARRAY OF type_g_inventory_inag
#160512-00004#1-e modify
#DEFINE l_ac         LIKE type_t.num5
#DEFINE lwin_curr    ui.Window
#DEFINE lfrm_curr    ui.Form
#DEFINE ls_path      STRING
DEFINE l_i          LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5
#161124-00048#15 mod-S
#DEFINE l_inag1 RECORD LIKE inag_t.*
#DEFINE l_inag2 RECORD LIKE inag_t.*
DEFINE l_inag1 RECORD  #庫存明細檔
       inagent LIKE inag_t.inagent, #企业编号
       inagsite LIKE inag_t.inagsite, #营运据点
       inag001 LIKE inag_t.inag001, #料件编号
       inag002 LIKE inag_t.inag002, #产品特征
       inag003 LIKE inag_t.inag003, #库存管理特征
       inag004 LIKE inag_t.inag004, #库位编号
       inag005 LIKE inag_t.inag005, #储位编号
       inag006 LIKE inag_t.inag006, #批号
       inag007 LIKE inag_t.inag007, #库存单位
       inag008 LIKE inag_t.inag008, #账面库存数量
       inag009 LIKE inag_t.inag009, #实际库存数量
       inag010 LIKE inag_t.inag010, #库存可用否
       inag011 LIKE inag_t.inag011, #MRP可用否
       inag012 LIKE inag_t.inag012, #成本库否
       inag013 LIKE inag_t.inag013, #拣货优先序
       inag014 LIKE inag_t.inag014, #最近一次盘点日期
       inag015 LIKE inag_t.inag015, #最后异动日期
       inag016 LIKE inag_t.inag016, #呆滞日期
       inag017 LIKE inag_t.inag017, #第一次入库日期
       inag018 LIKE inag_t.inag018, #No Use
       inag019 LIKE inag_t.inag019, #留置否
       inag020 LIKE inag_t.inag020, #留置原因
       inag021 LIKE inag_t.inag021, #备置数量
       inag022 LIKE inag_t.inag022, #No Use
       inag023 LIKE inag_t.inag023, #Tag二进位码
       inag024 LIKE inag_t.inag024, #参考单位
       inag025 LIKE inag_t.inag025, #参考数量
       inag026 LIKE inag_t.inag026, #最近一次检验日期
       inag027 LIKE inag_t.inag027, #下次检验日期
       inag028 LIKE inag_t.inag028, #留置日期
       inag029 LIKE inag_t.inag029, #留置人员
       inag030 LIKE inag_t.inag030, #留置部门
       inag031 LIKE inag_t.inag031, #留置单号
       inag032 LIKE inag_t.inag032, #基础单位
       inag033 LIKE inag_t.inag033  #基础单位数量
END RECORD
DEFINE l_inag2 RECORD  #庫存明細檔
       inagent LIKE inag_t.inagent, #企业编号
       inagsite LIKE inag_t.inagsite, #营运据点
       inag001 LIKE inag_t.inag001, #料件编号
       inag002 LIKE inag_t.inag002, #产品特征
       inag003 LIKE inag_t.inag003, #库存管理特征
       inag004 LIKE inag_t.inag004, #库位编号
       inag005 LIKE inag_t.inag005, #储位编号
       inag006 LIKE inag_t.inag006, #批号
       inag007 LIKE inag_t.inag007, #库存单位
       inag008 LIKE inag_t.inag008, #账面库存数量
       inag009 LIKE inag_t.inag009, #实际库存数量
       inag010 LIKE inag_t.inag010, #库存可用否
       inag011 LIKE inag_t.inag011, #MRP可用否
       inag012 LIKE inag_t.inag012, #成本库否
       inag013 LIKE inag_t.inag013, #拣货优先序
       inag014 LIKE inag_t.inag014, #最近一次盘点日期
       inag015 LIKE inag_t.inag015, #最后异动日期
       inag016 LIKE inag_t.inag016, #呆滞日期
       inag017 LIKE inag_t.inag017, #第一次入库日期
       inag018 LIKE inag_t.inag018, #No Use
       inag019 LIKE inag_t.inag019, #留置否
       inag020 LIKE inag_t.inag020, #留置原因
       inag021 LIKE inag_t.inag021, #备置数量
       inag022 LIKE inag_t.inag022, #No Use
       inag023 LIKE inag_t.inag023, #Tag二进位码
       inag024 LIKE inag_t.inag024, #参考单位
       inag025 LIKE inag_t.inag025, #参考数量
       inag026 LIKE inag_t.inag026, #最近一次检验日期
       inag027 LIKE inag_t.inag027, #下次检验日期
       inag028 LIKE inag_t.inag028, #留置日期
       inag029 LIKE inag_t.inag029, #留置人员
       inag030 LIKE inag_t.inag030, #留置部门
       inag031 LIKE inag_t.inag031, #留置单号
       inag032 LIKE inag_t.inag032, #基础单位
       inag033 LIKE inag_t.inag033  #基础单位数量
END RECORD
#161124-00048#15 mod-E
DEFINE l_inaa  RECORD
    inaa001    LIKE inaa_t.inaa001,
    inaa006    LIKE inaa_t.inaa006,
    inaa007    LIKE inaa_t.inaa007,
    inaa008    LIKE inaa_t.inaa008,
    inaa009    LIKE inaa_t.inaa009,
    inaa010    LIKE inaa_t.inaa010,
    inaa013    LIKE inaa_t.inaa013,
    inaa017    LIKE inaa_t.inaa017,
    inaa018    LIKE inaa_t.inaa018
           END RECORD
DEFINE l_imaf153    LIKE imaf_t.imaf153  #150427-00001#6 150615 By pomelo add
DEFINE l_success    LIKE type_t.num5     #160115-00013#1 add


   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE

   IF g_inventory_inag.getLength() = 0 THEN
      RETURN r_success
   END IF
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      CALL g_inventory_inag.clear()
      LET r_success = FALSE
      RETURN r_success
   END IF
  
   #----------14/09/26 By pomelo add(s)
   IF cl_null(p_imafsite) THEN
      LET p_imafsite = g_site
   END IF
   #----------14/09/26 By pomelo add(e)
   IF cl_null(g_prog2) THEN LET g_prog2 = ' ' END IF  #170425-00065#1 add
#------140903 by pengu mark
#   OPEN WINDOW w_s_inventory_ins_inag  WITH FORM cl_ap_formpath("sub","s_inventory_s01")
#   #瀏覽頁簽資料初始化
#   CALL cl_ui_init()
#   LET lwin_curr = ui.Window.getCurrent()
#   LET lfrm_curr = lwin_curr.getForm()
#   LET ls_path = os.Path.join(os.Path.join(FGL_GETENV("ERP"),"cfg"),"4tb")
#   LET ls_path = os.Path.join(ls_path,"toolbar_lib.4tb")
#   CALL lfrm_curr.loadToolBar(ls_path)
#------140903 by pengu mark
   
   FOR l_i = 1 TO g_inventory_inag.getLength()
      LET l_inag[l_i].* = g_inventory_inag[l_i].*
   END FOR
   
#------140903 by pengu mark
#   WHILE TRUE
# 
#      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
#   
#         INPUT ARRAY l_inag FROM s_detail.*
#                ATTRIBUTE(COUNT = g_inventory_inag.getLength(),MAXCOUNT = g_inventory_inag.getLength(),WITHOUT DEFAULTS,
#                        INSERT ROW = TRUE,
#                        DELETE ROW = FALSE,
#                        APPEND ROW = TRUE)
#               
#         BEFORE ROW 
#            LET l_ac = ARR_CURR()
#            CALL cl_set_comp_entry("inag001,inag002,inag003,inag004,inag005,inag006,inag007,inag017",FALSE)
#            #NEXT FIELD inag007
#            
#        AFTER FIELD inag007
#           IF NOT cl_null(l_inag[l_ac].inag007) THEN 
#              SELECT COUNT(1) INTO l_n FROM ooca_t WHERE oocaent = g_enterprise AND ooca001 = l_inag[l_ac].inag007
#              IF l_n = 0 THEN 
#                 CALL cl_err(l_inag[l_ac].inag007,'sub-00131',1)
#                 NEXT FIELD inag007
#              END IF
#              IF NOT cl_null(g_inventory_inag[l_ac].inag007) AND l_inag[l_ac].inag007 != g_inventory_inag[l_ac].inag007 THEN         
#                 SELECT COUNT(1) INTO l_n FROM imad_t WHERE imadent = g_enterprise AND imad001 = l_inag[l_ac].inag001
#                    AND ((imad002 = l_inag[l_ac].inag007 AND imad004 = g_inventory_inag[l_ac].inag007) OR (imad002 = g_inventory_inag[l_ac].inag007 AND imad004 = l_inag[l_ac].inag007))
#                 IF l_n = 0 THEN 
#                    CALL cl_err(l_inag[l_ac].inag007,'sub-00132',1)
#                    NEXT FIELD inag007
#                 END IF
#              END IF 
#           END IF 
#              
#         ON ACTION controlp INFIELD inag007
#            INITIALIZE g_qryparam.* TO NULL
#            LET g_qryparam.state = 'i'
#            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.default1 = l_inag[l_ac].inag007
#            CALL q_ooca001_1()
#            LET l_inag[l_ac].inag007 = g_qryparam.return1
#            DISPLAY l_inag[l_ac].inag007 TO inag007
#            NEXT FIELD inag007
#            
#       END INPUT 
#
#       ON ACTION accept
#          ACCEPT DIALOG
#   
#       ON ACTION cancel      #在dialog button (放棄)
#            LET g_action_choice=""
#            LET INT_FLAG = TRUE
#            EXIT DIALOG    
#              
#       ON ACTION exit
#          LET g_action_choice="exit"
#          LET INT_FLAG = TRUE
#          EXIT DIALOG
#   
#       ON ACTION close
#          LET g_action_choice="exit"
#          LET INT_FLAG = TRUE
#          EXIT DIALOG
#     END DIALOG
# 
#     IF INT_FLAG THEN 
#        LET INT_FLAG = FALSE
#        CLOSE WINDOW w_s_inventory_ins_inag 
#        CALL g_inventory_inag.clear()
#        LET r_success = FALSE
#        RETURN r_success
#     END IF 
#  
#     EXIT WHILE
#  END WHILE
#------140903 by pengu mark
   
   #不在画面上栏位资讯
   INITIALIZE l_inag1 TO NULL
   LET l_inag1.inagent = g_enterprise
   LET l_inag1.inagsite = g_site
   LET l_inag1.inag008 = 0
   LET l_inag1.inag009 = 0
   LET l_inag1.inag014 = ''
   LET l_inag1.inag019 = 'N'
   LET l_inag1.inag020 = ''
   LET l_inag1.inag021 = 0
   LET l_inag1.inag025 = 0
   LET l_inag1.inag033 = 0
   
   #画面上栏位及相关栏位资讯  
   FOR l_i = 1 TO l_inag.getLength()
      LET l_inag1.inag001 = l_inag[l_i].inag001
      LET l_inag1.inag002 = l_inag[l_i].inag002 
      LET l_inag1.inag003 = l_inag[l_i].inag003 
      LET l_inag1.inag004 = l_inag[l_i].inag004 
      LET l_inag1.inag005 = l_inag[l_i].inag005 
      LET l_inag1.inag006 = l_inag[l_i].inag006 
     #LET l_inag1.inag018 = l_inag[l_i].inag018  #160512-00004#1 mark
      LET l_inag1.inag022 = l_inag[l_i].inag022 
      #190723-00031#1 add(s)
      IF g_prog MATCHES 'aint330' THEN
         LET l_inag1.inag017 = g_today
         LET l_inag1.inag015 = g_today
         LET l_inag1.inag016 = l_inag[l_i].inag017
      ELSE
      #190723-00031#1 add(e)
         LET l_inag1.inag017 = l_inag[l_i].inag017
         LET l_inag1.inag015 = l_inag[l_i].inag017
         LET l_inag1.inag016 = l_inag[l_i].inag017
      END IF            #190723-00031#1 add
      LET l_inag1.inag007 = l_inag[l_i].inag007
      
      #by wuxja 150317 add
      #1.检核库位是否存在该据点的库位基本资料中,若不存在则不允许
      LET l_n = 0
      SELECT COUNT(1) INTO l_n
        FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaasite = g_site
         AND inaa001 = l_inag1.inag004
      IF l_n = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00670'
         LET g_errparam.extend = l_inag1.inag004
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         CONTINUE FOR
      END IF
      #by wuxja 150317 end
      
      INITIALIZE l_inaa.* TO NULL
      SELECT inaa001,inaa006,inaa007,inaa008,inaa009,inaa010,inaa013,inaa017,inaa018
        INTO l_inaa.inaa001,l_inaa.inaa006,l_inaa.inaa007,l_inaa.inaa008,l_inaa.inaa009,
             l_inaa.inaa010,l_inaa.inaa013,l_inaa.inaa017,l_inaa.inaa018
        FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaasite = g_site
         AND inaa001 = l_inag1.inag004
      
      LET l_inag1.inag012 = l_inaa.inaa010
      
      #by wuxja 150317 add
      #2.检核若库位要做储位管理时,若储位是空白或null时也不允许
      IF cl_null(l_inaa.inaa001) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00670'
         LET g_errparam.extend = l_inag1.inag004
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         CONTINUE FOR
      END IF
      IF l_inaa.inaa007 != '5' THEN
         #儲位的值可能是一個空白,用cl_null判斷會跑進去,要改用IS NULL
         #IF cl_null(l_inag1.inag005) THEN   #15/05/08 mark by Sarah           
         IF l_inag1.inag005 IS NULL THEN     #15/05/08  add by Sarah
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00671'
            LET g_errparam.extend = l_inag1.inag004
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            CONTINUE FOR
         END IF
      END IF
      #by wuxja 150317 end
      
      #160324-00016#1-s
      #判斷inaa017(存貨凍結否)=Y時,並彈訊息提示不做庫存異動直接RETURN
      #IF l_inaa.inaa017 = 'Y' THEN  #170414-00023#1 mark
      #IF l_inaa.inaa017 = 'Y' AND g_prog <> 'aint930' THEN   #170414-00023#1 add     #170425-00065#1 mark  
      IF l_inaa.inaa017 = 'Y' AND g_prog <> 'aint930' AND g_prog2 <> 'ainp880' THEN   #170425-00065#1 add  
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00757'
         LET g_errparam.extend = l_inag1.inag004
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         CONTINUE FOR
      END IF
      #160324-00016#1-e
      
      #by wuxja 150624  add   begin
      #储位管理为人工指定的，又不在inab里面的储位,需先新增inab资料
      #储位管理为不使用储位管理时，又不在inab里的，改抓inaa资料
      LET l_n = 0
      SELECT COUNT(1) INTO l_n
        FROM inab_t 
       WHERE inabent = g_enterprise
         AND inabsite = g_site
         AND inab001 = l_inag1.inag004
         AND inab002 = l_inag1.inag005
      IF l_n = 0 AND l_inaa.inaa007 = '5' THEN
         LET l_inag1.inag013 = l_inaa.inaa006
         LET l_inag1.inag010 = l_inaa.inaa008
         LET l_inag1.inag011 = l_inaa.inaa009
         LET l_inag1.inag023 = l_inaa.inaa013
      ELSE
         IF l_n = 0 THEN
            IF NOT s_aini002_ins_inab(g_site,l_inag1.inag004,l_inag1.inag005) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ain-00282'
               LET g_errparam.extend = l_inag1.inag004,"/",l_inag1.inag005
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               CONTINUE FOR
            END IF
         END IF
         SELECT inab005,inab006,inab007,inab008
           INTO l_inag1.inag013,l_inag1.inag010,l_inag1.inag011,l_inag1.inag023
           FROM inab_t
          WHERE inab001 = l_inag1.inag004
            AND inab002 = l_inag1.inag005
            AND inabent = g_enterprise
            AND inabsite = g_site
      END IF
      #by wuxja 20150624 end
      
      #----------14/09/26 By pomelo modify(s)
      #當p_site = 'ALL' 的時候，表示為流通程式，所以在抓取imaf的資料，imafsite = 'ALL'
      IF p_imafsite = 'ALL' THEN
         SELECT imaf015 INTO l_inag1.inag024
           FROM imaf_t 
          WHERE imafent = g_enterprise
            AND imafsite = p_imafsite
            AND imaf001 = l_inag[l_i].inag001
         SELECT imaa104 INTO l_inag1.inag007
           FROM imaa_t
          WHERE imaaent = g_enterprise
            AND imaa001 = l_inag[l_i].inag001
      END IF
      #----------14/09/26 By pomelo modify(e)
      #----------150722 By wuxj begin
      IF p_imafsite != 'ALL' THEN
         SELECT imaf015 INTO l_inag1.inag024
           FROM imaf_t 
          WHERE imafent = g_enterprise
            AND imafsite = g_site
            AND imaf001 = l_inag[l_i].inag001
      END IF
      #----------150722 By wuxj end
      
      SELECT imaa006 INTO l_inag1.inag032
        FROM imaa_t
       WHERE imaaent = g_enterprise
         AND imaa001 = l_inag1.inag001
      
      #160115-00013#1--add---begin---   
      IF NOT cl_null(l_inag1.inag032) THEN
         CALL s_aooi250_convert_qty(l_inag1.inag001,l_inag1.inag007,l_inag1.inag032,l_inag1.inag008)
              RETURNING l_success,l_inag1.inag033
      END IF
      #160115-00013#1--add---end--- 
      
      #----140903 by pengu add
      #判斷批號否存在料件批號檔中，若不存在則需insert料件批號資料
     #IF NOT cl_null(l_inag1.inag006) THEN   #170105-00048#1 mark 批号为空格的情况
      IF l_inag1.inag006 IS NOT NULL THEN    #170105-00048#1 add  批号为空格的情况
         #160512-00004#1-s modify
         #IF cl_null(l_inag1.inag018) THEN
         #   #CALL s_aini010_calculate_effdt(g_site,l_inag1.inag001,l_inag1.inag002,l_inag1.inag006,l_inag1.inag018)      #160126-00003#1 20160127 mark by beckxie
         #   CALL s_aini010_calculate_effdt(p_imafsite,l_inag1.inag001,l_inag1.inag002,l_inag1.inag006,l_inag1.inag018)   #160126-00003#1 20160127  add by beckxie
         #        RETURNING l_inag1.inag018
        # IF cl_null(g_inventory_inag[l_i].inae011) THEN      #200919-00001#1---mark
         IF cl_null(g_inventory_inag[l_i].inae011) AND g_prog NOT MATCHES 'asft32*' THEN       #200919-00001#1---add---s
            CALL s_aini010_calculate_effdt(p_imafsite,l_inag1.inag001,l_inag1.inag002,l_inag1.inag006,g_inventory_inag[l_i].inae011)   #160126-00003#1 20160127  add by beckxie
                 RETURNING g_inventory_inag[l_i].inae011
         #160512-00004#1-e modify
         END IF
         #150427-00001#6 150615 By pomelo mark(S)
         #IF NOT s_aini010_ins_inad(g_site,l_inag1.inag001,l_inag1.inag002,l_inag1.inag006,'','','','','','',l_inag1.inag018,l_inag1.inag022) THEN
         #150427-00001#6 150615 By pomelo mark(E)
         #150427-00001#6 150615 By pomelo add(S)
         LET l_imaf153 = ''
         IF p_imafsite = 'ALL' THEN
            SELECT imaf153 INTO l_imaf153
              FROM imaf_t
             WHERE imafent = g_enterprise
               AND imafsite = g_site
               AND imaf001 = l_inag1.inag001
         END IF
         #160512-00004#1-s modify
         #IF NOT s_aini010_ins_inad(g_site,l_inag1.inag001,l_inag1.inag002,l_inag1.inag006,'','','','','',l_imaf153,l_inag1.inag018,l_inag1.inag022) THEN
         IF NOT s_aini010_ins_inad(g_site,l_inag1.inag001,l_inag1.inag002,l_inag1.inag006,g_inventory_inag[l_i].inae010,'','','','',l_imaf153,g_inventory_inag[l_i].inae011,l_inag1.inag022) THEN
         #160512-00004#1-e modify
         #150427-00001#6 150615 By pomelo add(E)
            #by wuxja 150317
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'ain-00283'
            LET g_errparam.extend = "ins inad_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            CONTINUE FOR
            #by wuxj 150317
         END IF
      END IF
      #----140903 by pengu add
      IF cl_null(l_inag1.inag021) THEN LET l_inag1.inag021 = 0 END IF   #161006-00018#28
      #161124-00048#15 mod-S
#      INSERT INTO inag_t VALUES(l_inag1.*)
      INSERT INTO inag_t(inagent,inagsite,inag001,inag002,inag003,
                         inag004,inag005,inag006,inag007,inag008,
                         inag009,inag010,inag011,inag012,inag013,
                         inag014,inag015,inag016,inag017,inag018,
                         inag019,inag020,inag021,inag022,inag023,
                         inag024,inag025,inag026,inag027,inag028,
                         inag029,inag030,inag031,inag032,inag033)
                  VALUES(l_inag1.*)
      #161124-00048#15 mod-S
      IF SQLCA.sqlcode  THEN
         #by wuxja 150317
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins inag_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         CONTINUE FOR
         #by wuxj 150317
      #-----140918 by 04441 add start
      #判斷若本次新增的是VMI存貨庫位時，則自動也新增一筆對應的VMI結算庫位的inag資料
      ELSE
         LET l_inag2.* = l_inag1.*
         #LET l_inag2.inag012 = l_inaa.inaa010           #180726-00008#1 mark
         LET l_inag2.inag004 = l_inaa.inaa018
         IF NOT cl_null(l_inag2.inag004) THEN
            LET l_inag2.inag005 = ' '
            LET l_inag2.inag013 = ''
            LET l_inag2.inag010 = ''
            LET l_inag2.inag011 = ''
            LET l_inag2.inag023 = ''
            LET l_n = 0 
            SELECT COUNT(1) INTO l_n
              FROM inag_t
             WHERE inagent = g_enterprise
               AND inagsite = g_site
               AND inag001 = l_inag2.inag001
               AND inag002 = l_inag2.inag002
               AND inag003 = l_inag2.inag003
               AND inag004 = l_inag2.inag004
               AND inag005 = l_inag2.inag005
               AND inag006 = l_inag2.inag006
               AND inag007 = l_inag2.inag007 
            IF cl_null(l_n) THEN LET l_n = 0 END IF 
            IF l_n = 0 THEN
               INITIALIZE l_inaa.* TO NULL
               SELECT inaa006,inaa007,inaa008,inaa009,inaa013,inaa010    #180726-00008#1 add ',inaa010'
                 INTO l_inaa.inaa006,l_inaa.inaa007,l_inaa.inaa008,l_inaa.inaa009,l_inaa.inaa013,l_inag2.inag012   #180726-00008#1 add ',l_inag2.inag012'
                 FROM inaa_t
                WHERE inaaent = g_enterprise
                  AND inaasite = g_site
                  AND inaa001 = l_inag2.inag004
               #by wuxja 150624  add   begin
               #储位管理为人工指定的，又不在inab里面的储位,需先新增inab资料
               #储位管理为不使用储位管理时，又不在inab里的，改抓inaa资料
               LET l_n = 0
               SELECT COUNT(1) INTO l_n
                 FROM inab_t 
                WHERE inabent = g_enterprise
                  AND inabsite = g_site
                  AND inab001 = l_inag2.inag004
                  AND inab002 = l_inag2.inag005
               IF l_n = 0 AND l_inaa.inaa007 = '5' THEN        
                  LET l_inag2.inag013 = l_inaa.inaa006
                  LET l_inag2.inag010 = l_inaa.inaa008
                  LET l_inag2.inag011 = l_inaa.inaa009
                  LET l_inag2.inag023 = l_inaa.inaa013
               ELSE
                  IF l_n = 0 THEN
                     IF NOT s_aini002_ins_inab(g_site,l_inag2.inag004,l_inag2.inag005) THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ain-00282'
                        LET g_errparam.extend = l_inag2.inag004,"/",l_inag2.inag005
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET r_success = FALSE
                        CONTINUE FOR
                     END IF
                  END IF
                  SELECT inab005,inab006,inab007,inab008
                    INTO l_inag2.inag013,l_inag2.inag010,l_inag2.inag011,l_inag2.inag023
                    FROM inab_t
                   WHERE inab001 = l_inag2.inag004
                     AND inab002 = l_inag2.inag005
                     AND inabent = g_enterprise
                     AND inabsite = g_site
               END IF
               #by wuxja 20150624 end
               IF cl_null(l_inag2.inag021) THEN LET l_inag2.inag021 = 0 END IF   #161006-00018#28
               #161124-00048#15 mod-S
#               INSERT INTO inag_t VALUES(l_inag2.*)
               INSERT INTO inag_t(inagent,inagsite,inag001,inag002,inag003,
                                  inag004,inag005,inag006,inag007,inag008,
                                  inag009,inag010,inag011,inag012,inag013,
                                  inag014,inag015,inag016,inag017,inag018,
                                  inag019,inag020,inag021,inag022,inag023,
                                  inag024,inag025,inag026,inag027,inag028,
                                  inag029,inag030,inag031,inag032,inag033)
                           VALUES(l_inag2.*)
               #161124-00048#15 mod-S
               IF SQLCA.sqlcode THEN
                  #by wuxja 150317
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "ins inag_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  CONTINUE FOR
                  #by wuxj 150317
               END IF
            END IF   
         END IF
      #-----140918 by 04441 add end
      END IF
   END FOR
   
   #CLOSE WINDOW w_s_inventory_ins_inag     #140903 by pengu mark
   CALL g_inventory_inag.clear()
   RETURN r_success
END FUNCTION
# # ################################################################################
# # # Descriptions...: 更新[T:庫存明細檔]的資料
# # # Memo...........:
# # # Usage..........: CALL s_inventory_upd_inag(p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_type,p_qty,p_date,p_docno,p_seq1,p_seq2,p_inag007,p_inag025,p_flag,p_imafsite)
# # #                       RETURNING r_success
# # # Input parameter: 1.p_inag001   LIKE inag_t.inag001  料件编号
# # #                  2.p_inag002   LIKE inag_t.inag002  产品特征
# # #                  3.p_inag003   LIKE inag_t.inag003  库存管理特征
# # #                  4.p_inag004   LIKE inag_t.inag004  库位
# # #                  5.p_inag005   LIKE inag_t.inag005  储位
# # #                  6.p_inag006   LIKE inag_t.inag006  批号
# # #                  7.p_type      LIKE type_t.chr2     异动类型  1:入库 -1:出库 0:报废 2:盘点
# # #                  8.p_qty       LIKE inag_t.inag008  异动数量
# # #                  9.p_date      LIKE inag_t.inag015  异动日期
# # #                  10.p_docno    LIKE type_t.chr20    单据编号    
# # #                  11.p_seq1     LIKE type_t.num5     项次
# # #                  12.p_seq2     LIKE type_t.num5     项序   
# # #                  13.p_inag007  LIKE inag_t.inag007  单位
# # #                  14.p_inag025  LIKE inag_t.inag025  参考数量
# # #                  15.p_flag     LIKE type_t.chr1     1.扣帳 2.扣帳還原
# # #                  16.p_imafsite LIKE imaf_t.imafsite 營運據點 (流通作業一律傳入ALL,製造傳入g_site或‘’)
# # # Return code....: r_success     处理状态TRUE/FALSE
# # # Date & Author..: 13/07/09 By wuxja
# # # Modify.........: 13/12/13 By wuxja   增加p_inag007,p_inag025参数及相关逻辑,增加更新制造批序号库存明细档资料
# # # Modify.........: 14/09/13 By pengu   調整批號有效日期控管的問題
# # # Modify.........: 14/09/18 By 04441   add VMI
# # # Modify.........: 14/09/26 By pomelo  增加p_flag,p_site參數
# # # Modify.........: 15/02/13 By 04441   將p_site改為p_imafsite,只有當抓取imaf_t時,imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
# # # Modify.........: 15/03/23 By earl    當p_type=-1(出庫)&p_flag=1(過帳) 或 p_type=1(入庫)&p_flag=2(過帳還原)，
# # #                                      利用單號判斷該單據性質='aint330'、'aint340'(調撥單)，且indc009='Y'時，不呼叫s_inventory_unit做數量轉換
# # # Modify.........: 15/07/30 By wuxja   更新料件对应的库存状况
# # # Modify.........: 15/08/20 By Lori    增加判斷是否為聯營/租賃/費用商品不扣庫存
# # ################################################################################
PUBLIC FUNCTION s_inventory_upd_inag(p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_type,p_qty,p_date,p_docno,p_seq1,p_seq2,p_inag007,p_inag025,p_flag,p_imafsite)
DEFINE p_inag001      LIKE inag_t.inag001   #料件编号
DEFINE p_inag002      LIKE inag_t.inag002   #产品特征
DEFINE p_inag003      LIKE inag_t.inag003   #库存管理特征
DEFINE p_inag004      LIKE inag_t.inag004   #库位
DEFINE p_inag005      LIKE inag_t.inag005   #储位
DEFINE p_inag006      LIKE inag_t.inag006   #批号
DEFINE p_type         LIKE type_t.chr2      #异动类型  1:入库, -1:出库, 0:报废, 2:盘点
DEFINE p_qty          LIKE inag_t.inag008   #异动数量
DEFINE p_date         LIKE inag_t.inag015   #异动日期
DEFINE p_docno        LIKE type_t.chr20     #单据编号
#DEFINE p_seq1         LIKE type_t.num5     #项次    #191203-00030#1 mark
#DEFINE p_seq2         LIKE type_t.num5     #项序    #191203-00030#1 mark
DEFINE p_seq1         LIKE type_t.num10     #项次    #191203-00030#1 add
DEFINE p_seq2         LIKE type_t.num10     #项序    #191203-00030#1 add
DEFINE p_inag007      LIKE inag_t.inag007   #单位
DEFINE p_inag025      LIKE inag_t.inag025   #参考数量
DEFINE p_flag         LIKE type_t.chr1      #1.扣帳  2.扣帳還原
DEFINE p_imafsite     LIKE imaf_t.imafsite  #營運據點 (流通作業一律傳入ALL, 製造傳入g_site 或‘’)
DEFINE r_success      LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE l_n            LIKE type_t.num5
DEFINE l_imaf061      LIKE imaf_t.imaf061
DEFINE l_imaf071      LIKE imaf_t.imaf071
DEFINE l_imaf081      LIKE imaf_t.imaf081
DEFINE l_inad011      LIKE inad_t.inad011
DEFINE l_inag019      LIKE inag_t.inag019
DEFINE l_success      LIKE type_t.num5 
DEFINE l_flag         LIKE type_t.num5
DEFINE l_rate         LIKE inaj_t.inaj014
DEFINE l_inaa018      LIKE inaa_t.inaa018  #結算庫位
DEFINE l_slip         LIKE oobx_t.oobx001
DEFINE l_oobx003      LIKE oobx_t.oobx003
DEFINE l_ooba002      LIKE ooba_t.ooba002
DEFINE l_oobx004      LIKE oobx_t.oobx004  #150323---earl---add
DEFINE l_indc009      LIKE indc_t.indc009  #150323---earl---add
DEFINE l_inaj045      LIKE inaj_t.inaj045  #150724 by pengu add
DEFINE l_imai031      LIKE imai_t.imai031  #150730 by wuxja add
DEFINE l_imai032      LIKE imai_t.imai032  #150730 by wuxja add
DEFINE l_inaa014      LIKE inaa_t.inaa014  #160120-00024 by wuxja add
DEFINE l_inaa017      LIKE inaa_t.inaa017  #160324-00016#1
DEFINE l_chk          LIKE type_t.num5     #161007-00012#2-add
DEFINE l_type         LIKE type_t.num5     #161007-00012#2-add 
DEFINE l_ooac004      LIKE ooac_t.ooac004  #170324-00052#1-add
DEFINE l_ooac002      LIKE ooac_t.ooac002  #170324-00052#1-add
DEFINE l_inag008      LIKE inag_t.inag008  #170324-00052#1-add
#171113-00003#1--add--s
DEFINE la_param     RECORD
          prog        STRING,
          actionid    STRING,
          background   LIKE type_t.chr1,
          param       DYNAMIC ARRAY OF STRING
                   END RECORD
DEFINE ls_js          STRING                   
#171113-00003#1--add--e
DEFINE l_stock_out    LIKE indd_t.indd022   #171114-00014#1 add
DEFINE l_stock_in     LIKE indd_t.indd022   #171114-00014#1 add
DEFINE l_site         LIKE indc_t.indc005   #171114-00014#1 add
DEFINE l_extend       STRING                #180419-00065#1
DEFINE l_inag008_chk  LIKE type_t.num5      #判斷是否要做s_inventory_check_inag008的檢查 #171218-00024#2-add
DEFINE l_isag005      LIKE isag_t.isag005   #200302-00017#1 add

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查：料件编号不可为空
   IF cl_null(p_inag001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00123'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   #检查：库位不可为空
   IF cl_null(p_inag004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00126'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：产品特征,库存管理特征,储位和批号为空，则给空格
   IF cl_null(p_inag002) THEN LET p_inag002 = ' ' END IF
   IF cl_null(p_inag003) THEN LET p_inag003 = ' ' END IF
   IF cl_null(p_inag005) THEN LET p_inag005 = ' ' END IF
   IF cl_null(p_inag006) THEN LET p_inag006 = ' ' END IF
   IF cl_null(p_imafsite) THEN LET p_imafsite = g_site END IF
   IF cl_null(g_prog2) THEN LET g_prog2 = ' ' END IF  #170425-00065#1 add
   
   #180419-00065#1-s
   INITIALIZE g_errparam TO NULL
   LET g_errparam.replace[1] = p_inag001
   LET g_errparam.replace[2] = p_inag002
   LET g_errparam.replace[3] = p_inag003
   LET g_errparam.replace[4] = p_inag004
   LET g_errparam.replace[5] = p_inag005
   LET g_errparam.replace[6] = p_inag006
   LET g_errparam.replace[7] = p_docno
   LET g_errparam.replace[8] = p_seq1
   LET g_errparam.replace[9] = p_seq2
   LET l_extend = cl_getmsg('ain-00968',g_lang)
  #LET l_extend = cl_err_replace_msg(l_extend)  #180424-00044#1 mark cl_getmsg()裡面已經call過了
   #180419-00065#1-e
   
   LET l_inaa014 = ''
   LET l_inaa017 = ''
   LET l_inaa018 = ''
   #170829-00018#60 Add By 06137  171229(S)
   IF p_imafsite = 'ALL' THEN
      SELECT inaa014,inaa017,inaa018
        INTO l_inaa014,l_inaa017,l_inaa018
        FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaasite = g_site
         AND inaa001 = p_inag004   
   ELSE
   #170829-00018#60 Add By 06137  171229(E)
      SELECT inaa014,inaa017,inaa018
        INTO l_inaa014,l_inaa017,l_inaa018
        FROM inaa_t
       WHERE inaaent = g_enterprise
         AND inaasite = p_imafsite
         AND inaa001 = p_inag004
   END IF #170829-00018#60 Add By 06137  171229   
   
   #160324-00016#1-s
   #判斷inaa017(存貨凍結否)=Y時,並彈訊息提示不做庫存異動直接RETURN
   #IF l_inaa017 = 'Y' THEN   #170414-00023#1 mark
   #IF l_inaa017 = 'Y' AND g_prog <> 'aint930' THEN  #170414-00023#1 add    #170425-00065#1 mark
   IF l_inaa017 = 'Y' AND g_prog <> 'aint930' AND g_prog2 <> 'ainp880' THEN  #170425-00065#1 add 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00757'
     #LET g_errparam.extend = p_inag004  #180419-00065#1 mark
      LET g_errparam.extend = l_extend   #180419-00065#1
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   #160324-00016#1-e
   
   #160120-00024 by wuxja add --begin
   #允许负库存的情况下，出库的也要新增inag
   IF p_type = -1 THEN
      IF l_inaa014 = 'Y' THEN
         #160512-00004#1-s modify
         ##                                 料件编号  产品特征  库存管理特征    库位
         #CALL s_inventory_ins_inag_collect(p_inag001,p_inag002,p_inag003,p_inag004,     
         ##                                 储位           批号 有效日期   备注
         #                                  p_inag005,p_inag006,'',         '',
         ##                                 第一次入库日期  单位    營運據點
         #                                  p_date,       p_inag007,p_imafsite)
         #                                 料件编号  产品特征  库存管理特征  库位     储位     批号
         CALL s_inventory_ins_inag_collect(p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,
         #                                 单位      备注     第一次入库日期 製造日期 有效日期 營運據點

                                           p_inag007,''       ,p_date   ,''       ,''       ,p_imafsite)
         #160512-00004#1-e modify
         #有新的仓/储/批等时,要开窗维护,以便新增仓库明细资料
         CALL s_inventory_ins_inag(p_imafsite) RETURNING l_success
         IF NOT l_success THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
   END IF
   #160120-00024 by wuxja add --end
   
   #150819-00029 150820 by lori add---(S)
   IF s_inventory_chk_prod(p_inag001,p_imafsite) THEN
      RETURN r_success
   END IF
   #150819-00029 150820 by lori add---(E)
   
   #-----140930 by 04441 add start
   IF NOT s_inventory_check_vmi(p_docno,g_site) AND p_flag = '2' THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   #-----140930 by 04441 add end
   
   #170308-00016#1-s
   LET l_imaf061 = ''
   LET l_imaf071 = ''
   LET l_imaf081 = ''
   SELECT imaf061,imaf071,imaf081
     INTO l_imaf061,l_imaf071,l_imaf081
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = p_imafsite
      AND imaf001 = p_inag001
   #170308-00016#1-e

   #150323---earl---mod---s
   WHILE TRUE
      #當p_type=-1(出庫)&p_flag=1(過帳) 或 p_type=1(入庫)&p_flag=2(過帳還原)
      IF (p_type = -1 AND p_flag = 1) OR
         (p_type = 1 AND p_flag = 2) THEN
          
         #取單別
         CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
         #取得作業代號
         LET l_oobx004 = ''
         CALL s_fin_get_oobx004('','',l_slip) RETURNING l_oobx004
         
         #單據性質='aint330'、'aint340'(調撥單)
         IF l_oobx004 = 'aint330' OR
            l_oobx004 = 'aint340' THEN
         
            LET l_indc009 = ''
            SELECT indc009 INTO l_indc009
              FROM indc_t
             WHERE indcent = g_enterprise
               AND indcdocno = p_docno
               
            #indc009='Y'時，則不呼叫s_inventory_unit做數量轉換
            IF l_indc009 = 'Y' THEN
               EXIT WHILE
            END IF
         END IF
      END IF
      
      #200302-00017#1 add(s)
      LET l_isag005 = ''
      SELECT isag005 INTO l_isag005 FROM isag_t
       WHERE isagent = g_enterprise
         AND isagcomp = (SELECT ooef017 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 =p_imafsite)
         AND isag002 = p_docno
         AND isag003 = p_seq1
      #200302-00017#1 add(e)
      
     #-----150724 by pengu add
      #若是過帳還原時依據inaj紀錄的庫存單位進行過帳還原
       LET l_inaj045 = NULL 
       IF p_flag = 2 THEN 
          SELECT inaj045 INTO l_inaj045 FROM inaj_t WHERE inajent = g_enterprise AND inajsite = p_imafsite
                 AND inaj001 = p_docno AND inaj002 = p_seq1 AND inaj003 = p_seq2
                 #PGS(D)-10167 -S-
                 #AND inaj004 = p_type * -1
                 AND inaj004 = CAST(p_type AS int) * -1
                 #PGS(D)-10167 -E-
          IF NOT cl_null(l_inaj045) THEN 
             #200302-00017#1 add(s)
             IF g_prog = 'aist310' AND NOT cl_null(l_isag005) THEN
                CALL s_aooi250_convert_qty(p_inag001,l_isag005,l_inaj045,p_qty)
                     RETURNING r_success,p_qty
             ELSE
             #200302-00017#1 add(e)
             CALL s_aooi250_convert_qty(p_inag001,p_inag007,l_inaj045,p_qty)
                  RETURNING r_success,p_qty
             END IF  #200302-00017#1 add
             IF NOT r_success THEN
                RETURN r_success
             END IF
             LET p_inag007 = l_inaj045
          END IF 
       END IF    
     #-----150724 by pengu end
     IF g_prog <> 'aint170' THEN   #190819-00023#1 add
        IF cl_null (l_inaj045) THEN   #150724 by penu add #inaj045為NULL代表是過帳所以須依據料見多單位設置進行扣帳
         #-----150106 by 04441 modify start 
           #200302-00017#1 add(s)
           IF g_prog = 'aist310' AND NOT cl_null(l_isag005) THEN
              CALL s_inventory_unit(g_site,p_inag001,l_isag005,p_qty,p_imafsite)
                   RETURNING r_success,p_inag007,p_qty
           ELSE
           #200302-00017#1 add(e)
           #若料件設置為單一單位庫存管理時，將異動數量換算成料件庫存單位的數量
           CALL s_inventory_unit(g_site,p_inag001,p_inag007,p_qty,p_imafsite)
                RETURNING r_success,p_inag007,p_qty
           END IF  #200302-00017#1 add  
           IF NOT r_success THEN
              RETURN r_success
           END IF                    
        END IF    #150724 by pengu add
     END IF                        #190819-00023#1 add
      #170308-00016#1-s
      #LET l_imaf061 = ''
      #LET l_imaf071 = ''
      #LET l_imaf081 = ''
      #SELECT imaf061,imaf071,imaf081
      #  INTO l_imaf061,l_imaf071,l_imaf081
      #  FROM imaf_t
      # WHERE imafent = g_enterprise
      #   AND imafsite = p_imafsite
      #   AND imaf001 = p_inag001
      #170308-00016#1-e
      #-----150106 by 04441 modify end
      
      EXIT WHILE
   END WHILE
   #150323---earl---mod---e
   #170619-00049#2-s add  
   #检查是否已存在于库存明细档中
   IF g_aic_continue THEN
      LET l_n = 0
      SELECT COUNT(1) INTO l_n
        FROM inag_t
       WHERE inag001 = p_inag001
         AND inag002 = p_inag002
         AND inag003 = p_inag003
         AND inag004 = p_inag004
         AND inag005 = p_inag005
         AND inag006 = p_inag006
         AND inagent = g_enterprise
         AND inagsite = g_site
      IF l_n = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00142'  #180419-00065#1 remark
         LET g_errparam.extend = l_extend   #180419-00065#1
         #180419-00065#1-s mark
         #LET g_errparam.code = 'sub-00637'
         #LET g_errparam.replace[1] = p_inag001
         #LET g_errparam.replace[2] = p_inag002
         #LET g_errparam.replace[3] = p_inag003
         #LET g_errparam.replace[4] = p_inag004
         #LET g_errparam.replace[5] = p_inag005
         #LET g_errparam.replace[6] = p_inag006
         #180419-00065#1-e mark
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   ELSE 
   #170619-00049#2-e add 
      #检查是否已存在于库存明细档中   
      LET l_n = 0
      SELECT COUNT(1) INTO l_n
        FROM inag_t
       WHERE inag001 = p_inag001
         AND inag002 = p_inag002
         AND inag003 = p_inag003
         AND inag004 = p_inag004
         AND inag005 = p_inag005
         AND inag006 = p_inag006
         AND inag007 = p_inag007
         AND inagent = g_enterprise
         AND inagsite = g_site
      IF l_n = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00142'  #180419-00065#1 remark
         LET g_errparam.extend = l_extend   #180419-00065#1
         #180419-00065#1-s mark
         #LET g_errparam.code = 'sub-00637'
         #LET g_errparam.replace[1] = p_inag001
         #LET g_errparam.replace[2] = p_inag002
         #LET g_errparam.replace[3] = p_inag003
         #LET g_errparam.replace[4] = p_inag004
         #LET g_errparam.replace[5] = p_inag005
         #LET g_errparam.replace[6] = p_inag006
         #LET g_errparam.replace[7] = p_inag007
         #180419-00065#1-e mark
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF 
   END IF   #170619-00049#2 add  
   #出库過帳且料号做批号时效控管时，需检核料件批號基本資料的有效日期是否大於庫存異動日期
   #抓取單據參數判斷是否檢核料件有效期
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   LET l_ooba002 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-BAS-0086')
   IF cl_null(l_ooba002) THEN
      LET l_ooba002 = 'N'
   END IF
   
   IF p_type = '-1' AND p_flag = '1' AND l_ooba002 = 'Y' THEN
      IF l_imaf061 != '2' THEN 
         LET l_n = 0
         SELECT COUNT(1) INTO l_n
           FROM inad_t
          WHERE inad001 = p_inag001
            AND inad002 = p_inag002 
            AND inad003 = p_inag006  #140913 by pengu add
            AND inadent = g_enterprise
            AND inadsite = g_site
         IF l_n > 0 THEN
            LET l_inad011 = ''
            SELECT inad011 INTO l_inad011
              FROM inad_t
             WHERE inad001 = p_inag001
               AND inad002 = p_inag002 
               AND inad003 = p_inag006  #140913 by pengu add
               AND inadent = g_enterprise
               AND inadsite = g_site
#            IF g_prog <> 'aint330' AND g_prog <> 'aint340' AND g_prog <> 'aint310' AND g_prog <> 'aint311' THEN   #170301-00030#9 by 09257 --mark
            IF g_prog NOT MATCHES 'aint330*' AND g_prog NOT MATCHES 'aint340*' AND g_prog NOT MATCHES 'aint310*' AND g_prog NOT MATCHES 'aint311*' THEN   #170301-00030#9 by 09257 --add  
               IF l_inad011 < p_date THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'sub-00143'
                  LET g_errparam.popup = TRUE
                  LET g_errparam.extend = l_extend   #180419-00065#1
                  #180419-00065#1-s mark
                  #LET g_errparam.extend = p_inag001
                  #IF p_seq1 IS NOT NULL THEN
                  #   LET g_errparam.extend = g_errparam.extend,"|",p_seq1
                  #END IF
                  #IF p_seq2 IS NOT NULL THEN
                  #   LET g_errparam.extend = g_errparam.extend,"|",p_seq2
                  #END IF  
                  #180419-00065#1-e mark
                  CALL cl_err()
                  LET r_success = FALSE
                  RETURN r_success
               END IF 
            END IF  #170113-00018#1  
         END IF
      END IF
   END IF 
   #170619-00049#2-s add  
   IF g_aic_continue THEN
      LET l_inag019 = ''
      SELECT inag019 INTO l_inag019
        FROM inag_t
       WHERE inag001 = p_inag001
         AND inag002 = p_inag002
         AND inag003 = p_inag003
         AND inag004 = p_inag004
         AND inag005 = p_inag005
         AND inag007 = p_inag007
         AND inagent = g_enterprise
         AND inagsite = g_site
   ELSE
   #170619-00049#2-e add   
      #若库存量已被留置，则不允许过账
      LET l_inag019 = ''
      SELECT inag019 INTO l_inag019
        FROM inag_t
       WHERE inag001 = p_inag001
         AND inag002 = p_inag002
         AND inag003 = p_inag003
         AND inag004 = p_inag004
         AND inag005 = p_inag005
         AND inag006 = p_inag006
         AND inag007 = p_inag007
         AND inagent = g_enterprise
         AND inagsite = g_site
   END IF #170619-00049#2 add   
   IF l_inag019 = 'Y' THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00144'  #160105-00007#1 mark  #180419-00065#1 remark
     #LET g_errparam.code = 'sub-01296'  #160105-00007#1 add  #180419-00065#1 mark
      LET g_errparam.extend = l_extend   #180419-00065#1
      LET g_errparam.popup = TRUE
      #180419-00065#1-s mark
      ##160105-00007#1 --- add start ---
      #LET g_errparam.replace[1] = p_inag001
      #LET g_errparam.replace[2] = p_inag002
      #LET g_errparam.replace[3] = p_inag004
      #LET g_errparam.replace[4] = p_inag003
      ##160105-00007#1 --- add end   ---      
      #180419-00065#1-e mark
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #判斷是否要做s_inventory_check_inag008的檢查
   #TRUE:表示為續拋/正拋，不需在更新時檢查庫存
   #FALSE:表示非續拋/正拋，需在更新時先檢查庫存
   IF g_aic_continue OR g_aic_direct THEN
      LET l_inag008_chk = TRUE 
   ELSE
      LET l_inag008_chk = FALSE
   END IF
   #171218-00024#2-e-add
   
   #检查库存量是否足够
   IF NOT l_inag008_chk THEN #171218-00024#2-add
      IF p_type = '-1' OR p_type = '0' OR (p_type = '2' AND p_qty < 0) THEN
         LET g_stutflag = p_flag      #170618-00265#1 add
         LET g_stuttype = p_type      #170618-00265#1 add
         
         CALL s_inventory_check_inag008(p_type,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_qty,p_docno,p_seq1,p_seq2,p_inag007,p_imafsite)
              RETURNING l_success,l_flag    
         #201027-00022#1---add---s
         IF NOT l_success THEN 
            LET r_success = FALSE
            RETURN r_success
         END IF
         #201027-00022#1---add---e
         #add--160919-00013#1 By shiun--(S)
         IF s_inventory_imaa004_chk(p_inag001) THEN
            LET r_success = TRUE
            RETURN r_success
         END IF
         #add--160919-00013#1 By shiun--(E)
         IF NOT (l_success = 1 AND l_flag = 1) THEN
            INITIALIZE g_errparam TO NULL
            #150605 pengu modify
            IF l_flag = 2 THEN 
              LET g_errparam.replace[1] = p_seq1     #160511-00014#1  #180419-00065#1 mark   #181115-00019#1 remark
              LET g_errparam.replace[2] = p_inag001  #160511-00014#1  #180419-00065#1 mark   #181115-00019#1 remark
               LET g_errparam.code = 'sub-00633'
            ELSE
               LET g_errparam.code = 'sub-00145'
            END IF
           #150605 pengu end
           #LET g_errparam.extend = p_inag001  #180419-00065#1 mark
            LET g_errparam.extend = l_extend   #180419-00065#1
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF 
   END IF #171218-00024#2-add
   
   #-----140918 by 04441 add start
   #161007-00012#2-s-add
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   LET l_oobx003 = ''
   SELECT oobx003 INTO l_oobx003
     FROM oobx_t
    WHERE oobxent = g_enterprise
      AND oobx001 = l_slip

   #過帳：出庫倉為VMI倉，需更新結算倉的數量要更新；入庫倉，反之
   #171114-00014#1 mark-S 出库入库都要考虑结算仓
#   IF (l_oobx003 = 'aint330' AND p_type = '1') OR (l_oobx003 = 'aint340' AND p_type = '1') 
#      OR (l_oobx003 = 'aint350' AND p_type = '1')  OR (l_oobx003 = 'aint302') THEN
#      LET l_chk = FALSE
#   ELSE
#      LET l_chk = TRUE
#   END IF
#   #依p_flag判斷過帳/取消過帳。因過帳還原時，出庫的p_type變成1，需用p_flag，將l_chk顛倒過來
#   IF l_oobx003 ='aint330' OR l_oobx003='aint340' OR l_oobx003='aint350' THEN 
#      IF p_flag = '2' THEN
#         IF l_chk THEN
#            LET l_chk = FALSE  
#         ELSE
#            LET l_chk = TRUE
#         END IF
#      END IF
#   END IF
#   #161007-00012#2-e-add
   #171114-00014#1 mark-E  
   #171114-00014#1 add-S
   IF l_oobx003 = 'aint330' OR l_oobx003 = 'aint340' OR l_oobx003 = 'aint350' OR l_oobx003 = 'aint302' THEN
      IF p_type = '1' OR (p_type = '1' AND p_flag = '2') THEN #如果是过账时的入库或过帐还原时的出库
         LET l_stock_out = NULL
         LET l_stock_in = p_inag004
         LET l_site = NULL
         CASE l_oobx003
            WHEN 'aint302'
               IF s_aint320_vmi_type(p_imafsite,l_stock_in) = '1' THEN   #VMI存货仓
                  LET l_chk = TRUE
               ELSE
                  LET l_chk = FALSE
               END IF
            OTHERWISE
               IF p_flag = '1' THEN   #200624-00009#1 add
                  SELECT indc005,indd022 INTO l_site,l_stock_out FROM indc_t,indd_t
                   WHERE indcent = g_enterprise AND indcdocno = p_docno
                     AND inddent = indcent
                     AND indddocno = indcdocno
                     AND inddseq = p_seq1
               #200624-00009#1 add(s)
               ELSE
                  SELECT indc005,indd032 INTO l_site,l_stock_out FROM indc_t,indd_t
                   WHERE indcent = g_enterprise AND indcdocno = p_docno
                     AND inddent = indcent
                     AND indddocno = indcdocno
                     AND inddseq = p_seq1 
               END IF
               #200624-00009#1 add(e)
               IF s_aint320_vmi_type(l_site,l_stock_out) <> s_aint320_vmi_type(p_imafsite,l_stock_in) THEN
                  LET l_chk = TRUE
               ELSE 
                  LET l_chk = FALSE
               END IF
         END CASE
      ELSE
         LET l_stock_out = p_inag004
         LET l_stock_in = NULL
         LET l_site = NULL
         CASE l_oobx003
            WHEN 'aint302'
               IF s_aint320_vmi_type(p_imafsite,l_stock_out) = '1' THEN   #VMI存货仓
                  LET l_chk = TRUE
               ELSE
                  LET l_chk = FALSE
               END IF
            OTHERWISE
#               SELECT indc006,indd032 INTO l_site,l_stock_in FROM indc_t,indd_t  #200609-00036#1 mark
               IF p_flag = '2' THEN   #200624-00009#1 add  
                  SELECT indc005,indd022 INTO l_site,l_stock_in FROM indc_t,indd_t   #200609-00036#1 add
                   WHERE indcent = g_enterprise AND indcdocno = p_docno
                     AND inddent = indcent
                     AND indddocno = indcdocno
                     AND inddseq = p_seq1
                #200624-00009#1 add(s)
               ELSE
                  SELECT indc005,indd032 INTO l_site,l_stock_in FROM indc_t,indd_t   
                   WHERE indcent = g_enterprise AND indcdocno = p_docno
                     AND inddent = indcent
                     AND indddocno = indcdocno
                     AND inddseq = p_seq1
               END IF
               #200624-00009#1 add(e)
               IF s_aint320_vmi_type(p_imafsite,l_stock_out) <> s_aint320_vmi_type(l_site,l_stock_in) THEN
                  LET l_chk = TRUE
               ELSE 
                  LET l_chk = FALSE
               END IF
         END CASE
      END IF
   ELSE
      LET l_chk = TRUE
   END IF
   #171114-00014#1 add-E
   #更新库存量，异动日期，盘点日期
   IF NOT s_inventory_upd_inag_count(p_type,p_qty,p_date,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007,p_inag025) THEN
      LET r_success = FALSE
      RETURN r_success
   ELSE
   #判斷若本次異動是VMI存貨庫位中發料/收料時，且對應的異動的單據性質不是採購入庫單與倉退單時，
   #除了對原本的料、產品特徵、庫位、儲位、批號、庫存管理特徵更新庫存量外，須同步更新VMI結算庫位的庫存量
   #若本次異動對發料則VMI結算庫位也是做發料，反之則是做收料
      #161007-00012#2-s-mark 移至外圈
      #CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
      #LET l_oobx003 = ''
      #SELECT oobx003 INTO l_oobx003
      #  FROM oobx_t
      # WHERE oobxent = g_enterprise
      #   AND oobx001 = l_slip
      #161007-00012#2-e-mark
      IF l_chk THEN  #161007-00012#2-s-add
        #IF NOT cl_null(l_inaa018) AND (l_oobx003 <> 'apmt570' AND l_oobx003 <> 'apmt580' ) THEN                           #190105-00002#1 mark
        #IF NOT cl_null(l_inaa018) AND (l_oobx003 <> 'apmt570' AND l_oobx003 <> 'apmt580' AND l_oobx003 <> 'apmt530') THEN #190105-00002#1 add #190621-00019#1 amrk
         IF NOT cl_null(l_inaa018) AND (l_oobx003 <> 'apmt570' AND l_oobx003 <> 'apmt580' AND l_oobx003 <> 'apmt530' AND l_oobx003 <> 'aint170') THEN #190621-00019#1   
            IF NOT s_inventory_upd_inag_count(p_type,p_qty,p_date,p_inag001,p_inag002,p_inag003,l_inaa018,' ',p_inag006,p_inag007,p_inag025) THEN
               LET r_success = FALSE
            END IF
         END IF
      END IF #161007-00012#2-e-add
   END IF
   #-----140918 by 04441 add end
   
   #過帳時依據單據別參數判斷是否更新呆滯日期
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   LET l_ooba002 = cl_get_doc_para(g_enterprise,g_site,l_slip,'D-MFG-0010')
   IF p_flag ='1' AND l_ooba002 = 'Y' THEN
      #170619-00049#2-s add  
      IF g_aic_continue THEN
         UPDATE inag_t
            SET inag016 = p_date
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003 
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag007 = p_inag007
            AND inagent = g_enterprise
            AND inagsite = g_site
      ELSE 
      #170619-00049#2-e add       
         UPDATE inag_t
            SET inag016 = p_date
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003 
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag006 = p_inag006
            AND inag007 = p_inag007
            AND inagent = g_enterprise
            AND inagsite = g_site
      END IF   #170619-00049#2 add 
      #171113-00003#1--mark--s
      ##150730 by wuxja   add  --begin--
      ##更新料号对应的库存状况资料
      #UPDATE imai_t SET imai037 = p_date
      # WHERE imaient = g_enterprise AND imaisite = p_imafsite
      #   AND imai001 = p_inag001
      ##150730 by wuxja   add  --end--
      #171113-00003#1--mark--e
   END IF
   
   #171113-00003#1--mark--s
   ##150730 by wuxja   add  --begin--
   ##更新料号对应的库存状况资料
   #SELECT imai031,imai032 INTO l_imai031,l_imai032 FROM imai_t
   # WHERE imaient = g_enterprise AND imaisite = p_imafsite
   #   AND imai001 = p_inag001
   #IF p_type = '1' OR p_type = '2' THEN
   #   IF cl_null(l_imai032) THEN
   #      UPDATE imai_t SET imai032 = p_date,
   #                        imai034 = p_date,
   #                        imai036 = p_date
   #       WHERE imaient = g_enterprise AND imaisite = p_imafsite
   #         AND imai001 = p_inag001
   #   ELSE
   #      UPDATE imai_t SET imai034 = p_date,
   #                        imai036 = p_date
   #       WHERE imaient = g_enterprise AND imaisite = p_imafsite
   #         AND imai001 = p_inag001
   #   END IF
   #END IF
   #IF p_type = '-1' OR p_type = '0' THEN
   #   IF cl_null(l_imai031) THEN
   #      UPDATE imai_t SET imai031 = p_date,
   #                        imai033 = p_date,
   #                        imai036 = p_date
   #       WHERE imaient = g_enterprise AND imaisite = p_imafsite
   #         AND imai001 = p_inag001
   #   ELSE
   #      UPDATE imai_t SET imai033 = p_date,
   #                        imai036 = p_date
   #       WHERE imaient = g_enterprise AND imaisite = p_imafsite
   #         AND imai001 = p_inag001
   #   END IF
   #END IF
   ##150730 by wuxja   add  --end--
   #171113-00003#1--mark--e
   #171113-00003#1--add---s
   IF NOT s_inventory_ins_inbr(p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_type,p_qty,p_date,p_docno,p_seq1,p_seq2,p_inag007,p_imafsite,'') THEN
      LET r_success = FALSE
      RETURN r_success
   END IF 
   #171113-00003#1--add---e
   #170619-00049#2-s add  
   IF g_aic_continue THEN
      SELECT inag008 INTO l_inag008 FROM inag_t
       WHERE inag001 = p_inag001
         AND inag002 = p_inag002
         AND inag003 = p_inag003 
         AND inag004 = p_inag004
         AND inag005 = p_inag005
         AND inag007 = p_inag007
         AND inagent = g_enterprise
         AND inagsite = p_imafsite
   ELSE
   #170619-00049#2-e add
      #170324-00052#1-S
      SELECT inag008 INTO l_inag008 FROM inag_t
       WHERE inag001 = p_inag001
         AND inag002 = p_inag002
         AND inag003 = p_inag003 
         AND inag004 = p_inag004
         AND inag005 = p_inag005
         AND inag006 = p_inag006
         AND inag007 = p_inag007
         AND inagent = g_enterprise
         AND inagsite = p_imafsite
   END IF #170619-00049#2 add      
   IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF    
   IF l_inag008 = 0 THEN   
      CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_ooac002
      CALL cl_get_doc_para(g_enterprise,p_imafsite,l_ooac002,'D-MFG-0012') RETURNING l_ooac004 
      SELECT imaf061 INTO l_imaf061 FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = p_imafsite
         AND imaf001 = p_inag001
#     IF l_ooac004 = 'N' AND l_imaf061 = '1' THEN   #不允许重复&必须有批号    #200926-00024#1  -mark
      IF l_ooac004 = 'N' AND l_imaf061 != '2' THEN   #不允许重复&必须有批号或批号不控管    #200926-00024#1  -add
         DELETE FROM inad_t 
          WHERE inadent = g_enterprise
            AND inad001 = p_inag001
            AND inadsite = p_imafsite
            AND inad002 = p_inag002
            AND inad003 = p_inag006
            AND inad006 = p_docno
            AND inad007 = p_seq1
            AND inad008 = p_seq2         
      END IF 
      
   END IF 
   #170324-00052#1-E
   
   IF l_imaf071 != '2' OR l_imaf081 != '2' THEN 
      IF (l_imaf071 = '' OR l_imaf071 = '3' OR l_imaf071 = '2') AND
         (l_imaf081 = '' OR l_imaf081 = '3' OR l_imaf081 = '2') THEN
         LET l_n = 0
         SELECT COUNT(1) INTO l_n
           FROM inao_t
          WHERE inaoent = g_enterprise
         #   AND inaosite = g_site    #mark by lixh 20151210
            AND inaodocno = p_docno
            AND inaoseq = p_seq1
            AND inaoseq1 = p_seq2
            AND inao000 = '2'
         #170808-00058#1--mark--s
         #程式中不能直接return,会导致此段下面的程序段逻辑走不到
         #IF l_n = 0 THEN
         #   RETURN r_success     
         #END IF
         #170808-00058#1--mark--e
      END IF
      IF p_qty <> 0 AND l_n > 0  THEN  #160411-00029#1 add  #170808-00058#1 add
#         IF NOT s_inventory_upd_inai(p_docno,p_seq1,p_seq2,p_type,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007) THEN
         IF g_prog <> 'aint170' THEN  #191113-00052#1 add
            IF NOT s_inventory_upd_inai(p_docno,p_seq1,p_seq2,p_type,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007,p_flag) THEN #add by lixh 20150417
               LET r_success = FALSE
               RETURN r_success
            END IF
         END IF   #191113-00052#1 add  
      END IF  #160411-00029#1 add
   END IF
   
   #170808-00058#1---add---s
   #入項單據過帳還原時，如果批號有值，檢查料號+產品特徵+批號是否存在inaj_t裡，如果不存在，刪除inad_t
   IF p_type = '-1' AND p_flag = '2' THEN
      IF NOT cl_null(p_inag006) THEN
         LET l_n = 0
         SELECT COUNT(1) INTO l_n FROM inaj_t WHERE inajent = g_enterprise AND inaj005 = p_inag001 AND inaj006 = p_inag002 AND inaj010 = p_inag006 AND inaj001<>p_docno
         IF l_n = 0 OR cl_null(l_n) THEN 
            DELETE FROM inad_t 
             WHERE inadent = g_enterprise
               AND inad001 = p_inag001
               AND inadsite = p_imafsite
               AND inad002 = p_inag002
               AND inad003 = p_inag006
         END IF
      END IF
   END IF
   #170808-00058#1---add---e
   
   #171219-00022#21 mark(s)
   #171113-00003#1--add---s
   #背景执行ainp001,更新imai_t,inad_t程式段移至這邊處理，抓取indr_t所有資料進行更新
   #INITIALIZE la_param.* TO NULL
   #LET la_param.prog     = 'ainp001'
   #LET la_param.param[1] = ''
   #LET la_param.param[2] = p_imafsite
   #LET la_param.param[3] = p_docno
   #LET la_param.param[4] = p_seq1
   #LET la_param.param[5] = p_seq2
   #LET la_param.background = 'Y'
   #LET ls_js = util.JSON.stringify(la_param) 
   #CALL cl_cmdrun(ls_js)
   #171113-00003#1--add---e
   #171219-00022#21 mark(e)
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 計算帳面庫存數量,實際庫存數量,參考數量,基礎單位數量
# Memo...........:
# Usage..........: CALL s_inventory_upd_inag_count(p_type,p_qty,p_date,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007,p_inag025)
#                  RETURNING r_success
# Input parameter: 
# Return code....: TRUE OR FALSE
# Date & Author..: 14/10/20 By 04441
# Modify.........: 15/07/22 By wuxj     增加参数p_inag025
################################################################################
PUBLIC FUNCTION s_inventory_upd_inag_count(p_type,p_qty,p_date,p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_inag007,p_inag025)
DEFINE p_type     LIKE type_t.chr2     #异动类型  1:入库, -1:出库, 0:报废, 2:盘点
DEFINE p_qty      LIKE inag_t.inag008  #异动数量
DEFINE p_date     LIKE inag_t.inag015  #异动日期
DEFINE p_inag001  LIKE inag_t.inag001  #料件编号
DEFINE p_inag002  LIKE inag_t.inag002  #产品特征
DEFINE p_inag003  LIKE inag_t.inag003  #库存管理特征
DEFINE p_inag004  LIKE inag_t.inag004  #库位
DEFINE p_inag005  LIKE inag_t.inag005  #储位
DEFINE p_inag006  LIKE inag_t.inag006  #批号
DEFINE p_inag007  LIKE inag_t.inag007  #单位
DEFINE p_inag025  LIKE inag_t.inag025  #参考数量
DEFINE r_success  LIKE type_t.num5
DEFINE l_inag  RECORD
    inag008       LIKE inag_t.inag008,
    inag009       LIKE inag_t.inag009,
    inag024       LIKE inag_t.inag024,
    inag025       LIKE inag_t.inag025,
    inag032       LIKE inag_t.inag032,
    inag033       LIKE inag_t.inag033
              END RECORD
DEFINE l_success  LIKE type_t.num5
DEFINE l_qty      LIKE inag_t.inag008
DEFINE l_inag025  LIKE inag_t.inag025

   LET r_success = TRUE
   
   INITIALIZE l_inag.* TO NULL
   SELECT inag008,inag009,inag024,inag032
     INTO l_inag.inag008,l_inag.inag009,
          l_inag.inag024,l_inag.inag032
     FROM inag_t 
    WHERE inag001 = p_inag001
      AND inag002 = p_inag002
      AND inag003 = p_inag003 
      AND inag004 = p_inag004
      AND inag005 = p_inag005
      AND inag006 = p_inag006
      AND inag007 = p_inag007
      AND inagent = g_enterprise
      AND inagsite = g_site
   
   IF p_type = '1' OR p_type = '2' THEN
      LET l_qty = p_qty
      LET l_inag025 = p_inag025      #150722 by wuxj  add
   END IF
   IF p_type = '-1' OR p_type = '0' THEN
      LET l_qty = - p_qty
      LET l_inag025 = - p_inag025      #150722 by wuxj  add
   END IF

  #150722 by wuxj  mark
  #IF NOT cl_null(l_inag.inag024) THEN
  #   CALL s_aooi250_convert_qty(p_inag001,p_inag007,l_inag.inag024,l_inag.inag009)
  #        RETURNING l_success,l_inag.inag025
  #END IF
  #150722 by wuxj  mark
   IF NOT cl_null(l_inag.inag032) THEN
     #CALL s_aooi250_convert_qty(p_inag001,p_inag007,l_inag.inag032,l_inag.inag009)  #160309-00007 by 04441 mark
      CALL s_aooi250_convert_qty(p_inag001,p_inag007,l_inag.inag032,l_qty)           #160309-00007 by 04441 add
           RETURNING l_success,l_inag.inag033
   END IF

   IF p_type = '1' OR p_type = '-1' OR p_type = '0' THEN 
      #170619-00049#2-s add  
      IF g_aic_continue THEN
         UPDATE inag_t
            SET inag008 = (inag008+l_qty),
                inag009 = (inag009+l_qty),
                inag015 = p_date,
               #inag025 = l_inag.inag025,           #150722 by wuxj mark
                inag025 = inag025 + l_inag025,      #150722 by wuxj add
               #inag033 = inag008                   #160309-00007 by 04441 mark
                #inag033 = (inag008+l_inag.inag033)  #160309-00007 by 04441 add     #180117-00047#1 mark
                inag033 = (inag033+l_inag.inag033)   #180117-00047#1 add
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003 
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag006 = p_inag006                  #200117-00035#1---add
            AND inag007 = p_inag007
            AND inagent = g_enterprise
            AND inagsite = g_site         
      ELSE
      #170619-00049#2-e add      
         UPDATE inag_t
            SET inag008 = (inag008+l_qty),
                inag009 = (inag009+l_qty),
                inag015 = p_date,
               #inag025 = l_inag.inag025,           #150722 by wuxj mark
                inag025 = inag025 + l_inag025,      #150722 by wuxj add
               #inag033 = inag008                   #160309-00007 by 04441 mark
                #inag033 = (inag008+l_inag.inag033)  #160309-00007 by 04441 add     #180117-00047#1 mark
                inag033 = (inag033+l_inag.inag033)   #180117-00047#1 add
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003 
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag006 = p_inag006
            AND inag007 = p_inag007
            AND inagent = g_enterprise
            AND inagsite = g_site
      END IF  #170619-00049#2 add    
   END IF
   IF p_type = '2' THEN
      #170619-00049#2-s add  
      IF g_aic_continue THEN
         UPDATE inag_t
            SET inag008 = (inag008+l_qty),
                inag009 = (inag009+l_qty),
                inag015 = p_date,
                inag014 = p_date,
               #inag025 = l_inag.inag025,           #150722 by wuxj mark
                inag025 = inag025 + l_inag025,      #150722 by wuxj add
               #inag033 = inag008                   #160309-00007 by 04441 mark
                #inag033 = (inag008+l_inag.inag033)  #160309-00007 by 04441 add     #180117-00047#1 mark
                inag033 = (inag033+l_inag.inag033)   #180117-00047#1 add
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003 
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag006 = p_inag006                  #200117-00035#1---add
            AND inag007 = p_inag007
            AND inagent = g_enterprise
            AND inagsite = g_site      
      ELSE
      #170619-00049#2-e add
         UPDATE inag_t
            SET inag008 = (inag008+l_qty),
                inag009 = (inag009+l_qty),
                inag015 = p_date,
                inag014 = p_date,
               #inag025 = l_inag.inag025,           #150722 by wuxj mark
                inag025 = inag025 + l_inag025,      #150722 by wuxj add
               #inag033 = inag008                   #160309-00007 by 04441 mark
                #inag033 = (inag008+l_inag.inag033)  #160309-00007 by 04441 add     #180117-00047#1 mark
                inag033 = (inag033+l_inag.inag033)   #180117-00047#1 add
          WHERE inag001 = p_inag001
            AND inag002 = p_inag002
            AND inag003 = p_inag003 
            AND inag004 = p_inag004
            AND inag005 = p_inag005
            AND inag006 = p_inag006
            AND inag007 = p_inag007
            AND inagent = g_enterprise
            AND inagsite = g_site
      END IF      #170619-00049#2 add
   END IF  
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "upd inag_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   #20150730 by wuxj
   #更新料件的库存状况栏位
   
   END IF
   
   RETURN r_success
   
END FUNCTION
# # ################################################################################
# # # Descriptions...: 新增参考单位/包装库存明细档
# # # Memo...........:
# # # Usage..........: CALL s_inventory_ins_inah(p_inah001,p_inah002,p_inah003,p_inah004,p_inah005,,p_inah006,p_inah007,p_inah008)
# # #                       RETURNING r_success
# # # Input parameter: 1.p_inah001 LIKE inah_t.inah001 料件编号
# # #                  2.p_inah002 LIKE inah_t.inah002 产品特征
# # #                  3.p_inah003 LIKE inah_t.inah003 库存管理特征
# # #                  4.p_inah004 LIKE inah_t.inah004 库位
# # #                  5.p_inah005 LIKE inah_t.inah005 储位
# # #                  6.p_inah006 LIKE inah_t.inah006 批号
# # #                  7.p_inah007 LIKE inah_t.inah007 参考单位/包装编号
# # #                  8.p_inah008 LIKE inah_t.inah008 类型
# # # Return code....: r_success   处理状态TRUE/FALSE
# # # Date & Author..: 13/06/27 By wuxja
# # # Modify.........:
# # ################################################################################
PUBLIC FUNCTION s_inventory_ins_inah(p_inah001,p_inah002,p_inah003,p_inah004,p_inah005,p_inah006,p_inah007,p_inah008)
DEFINE p_inah001    LIKE inah_t.inah001   #料件编号
DEFINE p_inah002    LIKE inah_t.inah002   #产品特征
DEFINE p_inah003    LIKE inah_t.inah003   #库存管理特征
DEFINE p_inah004    LIKE inah_t.inah004   #库位
DEFINE p_inah005    LIKE inah_t.inah005   #储位
DEFINE p_inah006    LIKE inah_t.inah006   #批号
DEFINE p_inah007    LIKE inah_t.inah007   #参考单位/包装编号
DEFINE p_inah008    LIKE inah_t.inah008   #类型
DEFINE r_success    LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE l_n          LIKE type_t.num5
#161124-00048#15 mod-S
#DEFINE l_inah       RECORD LIKE inah_t.*
DEFINE l_inah RECORD  #參考單位/庫存包裝明細檔
       inahent LIKE inah_t.inahent, #企业编号
       inahsite LIKE inah_t.inahsite, #营运据点
       inah001 LIKE inah_t.inah001, #料件编号
       inah002 LIKE inah_t.inah002, #产品特征
       inah003 LIKE inah_t.inah003, #库存管理特征
       inah004 LIKE inah_t.inah004, #库位编号
       inah005 LIKE inah_t.inah005, #储位编号
       inah006 LIKE inah_t.inah006, #批号
       inah007 LIKE inah_t.inah007, #参考单位/包装编号
       inah008 LIKE inah_t.inah008, #库存类型
       inah009 LIKE inah_t.inah009, #账面库存数量
       inah010 LIKE inah_t.inah010, #实际库存数量
       inah011 LIKE inah_t.inah011  #Tag二进位码
END RECORD
#161124-00048#15 mod-E


   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查：料件编号不可为空
   IF cl_null(p_inah001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00123'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：库位不可为空
   IF cl_null(p_inah004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00126'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：参考单位/包装编号不可为空
   IF cl_null(p_inah007) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00128'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 

   #检查：产品特征,库存管理特征,储位和批号为空，则给空格
   IF cl_null(p_inah002) THEN LET p_inah002 = ' ' END IF 
   IF cl_null(p_inah003) THEN LET p_inah003 = ' ' END IF
   IF cl_null(p_inah005) THEN LET p_inah005 = ' ' END IF 
   IF cl_null(p_inah006) THEN LET p_inah006 = ' ' END IF 
  
   #检查是否已存在于参考单位/包装库存明细档中
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM inah_t
    WHERE inah001 = p_inah001
      AND inah002 = p_inah002
      AND inah003 = p_inah003
      AND inah004 = p_inah004
      AND inah005 = p_inah005
      AND inah006 = p_inah006
      AND inah007 = p_inah007
      AND inahent = g_enterprise
      AND inahsite = g_site
   IF l_n > 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00129'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
      RETURN r_success
   END IF   
   
   #新增时栏位给值
   INITIALIZE l_inah TO NULL
   LET l_inah.inahent = g_enterprise
   LET l_inah.inahsite= g_site
   LET l_inah.inah001 = p_inah001
   LET l_inah.inah002 = p_inah002
   LET l_inah.inah003 = p_inah003
   LET l_inah.inah004 = p_inah004
   LET l_inah.inah005 = p_inah005
   LET l_inah.inah006 = p_inah006
   LET l_inah.inah007 = p_inah007
   LET l_inah.inah008 = p_inah008
   LET l_inah.inah009 = 0
   LET l_inah.inah010 = 0
   SELECT inab008 INTO l_inah.inah011
     FROM inab_t
    WHERE inab001 = p_inah004
      AND inab002 = p_inah005
      AND inabent = g_enterprise
      AND inabsite = g_site
   #161124-00048#15 mod-S
#   INSERT INTO inah_t VALUES(l_inah.*)
   INSERT INTO inah_t(inahent,inahsite,inah001,inah002,inah003,
                      inah004,inah005,inah006,inah007,inah008,
                      inah009,inah010,inah011)
               VALUES(l_inah.*)
   #161124-00048#15 mod-E
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins inah_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION
# # ################################################################################
# # # Descriptions...: 更新参考单位/包装库存明细的資料
# # # Memo...........:
# # # Usage..........: CALL s_inventory_upd_inah(p_inah001,p_inah002,p_inah003,p_inah004,p_inah005,p_inah006,p_inah007,p_inah008,p_type,p_qty,p_docno,p_seq1,p_seq2)
# # #                       RETURNING r_success
# # # Input parameter: 1.p_inah001 LIKE inah_t.inah001 料件编号
# # #                  2.p_inah002 LIKE inah_t.inah002 产品特征
# # #                  3.p_inah003 LIKE inah_t.inah003 库存管理特征
# # #                  4.p_inah004 LIKE inah_t.inah004 库位
# # #                  5.p_inah005 LIKE inah_t.inah005 储位
# # #                  6.p_inah006 LIKE inah_t.inah006 批号
# # #                  7.p_inah007 LIKE inah_t.inah007 参考单位/包装编号
# # #                  8.p_inah008 LIKE inah_t.inah008 库存类型  1:参考单位，2：包装编号
# # #                  9.p_type    LIKE type_t.chr2    异动类型  1:入库, -1:出库, 0:报废, 2:盘点
# # #                  10.p_qty    LIKE inah_t.inah009 异动数量
# # #                  11.p_docno  LIKE type_t.chr20   单据编号    
# # #                  12.p_seq1   LIKE type_t.num5    项次
# # #                  13.p_seq2   LIKE type_t.num5    项序   
# # # Return code....: r_success   处理状态TRUE/FALSE
# # # Date & Author..: 13/07/10 By wuxja
# # # Modify.........:
# # ################################################################################
PUBLIC FUNCTION s_inventory_upd_inah(p_inah001,p_inah002,p_inah003,p_inah004,p_inah005,p_inah006,p_inah007,p_inah008,p_type,p_qty,p_docno,p_seq1,p_seq2)
DEFINE p_inah001      LIKE inah_t.inah001   #料件编号
DEFINE p_inah002      LIKE inah_t.inah002   #产品特征
DEFINE p_inah003      LIKE inah_t.inah003   #库存管理特征
DEFINE p_inah004      LIKE inah_t.inah004   #库位
DEFINE p_inah005      LIKE inah_t.inah005   #储位
DEFINE p_inah006      LIKE inah_t.inah006   #批号
DEFINE p_inah007      LIKE inah_t.inah007   #参考单位/包装编号
DEFINE p_inah008      LIKE inah_t.inah008   #库存类型  1:参考单位，2：包装编号
DEFINE p_type         LIKE type_t.chr2      #异动类型  1:入库, -1:出库, 0:报废, 2:盘点
DEFINE p_qty          LIKE inah_t.inah009   #异动数量
DEFINE p_docno        LIKE type_t.chr20     #单据编号
DEFINE p_seq1         LIKE type_t.num5      #项次
DEFINE p_seq2         LIKE type_t.num5      #项序   
DEFINE r_success      LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE l_n            LIKE type_t.num5
DEFINE r_success1     LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE r_flag1        LIKE type_t.num5      #1:库存足够, 0:库存不足
DEFINE l_inah009      LIKE inah_t.inah009
DEFINE l_inah010      LIKE inah_t.inah010
DEFINE l_extend       STRING                #180419-00065#1

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查：料件编号不可为空
   IF cl_null(p_inah001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00123'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：库位不可为空
   IF cl_null(p_inah004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00126'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：参考单位/包装编号不可为空
   IF cl_null(p_inah007) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00128'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 

   #检查：产品特征,库存管理特征,储位和批号为空，则给空格
   IF cl_null(p_inah002) THEN LET p_inah002 = ' ' END IF 
   IF cl_null(p_inah003) THEN LET p_inah003 = ' ' END IF
   IF cl_null(p_inah005) THEN LET p_inah005 = ' ' END IF 
   IF cl_null(p_inah006) THEN LET p_inah006 = ' ' END IF 
   
   #180419-00065#1-s
   INITIALIZE g_errparam TO NULL
   LET g_errparam.replace[1] = p_inah001
   LET g_errparam.replace[2] = p_inah002
   LET g_errparam.replace[3] = p_inah003
   LET g_errparam.replace[4] = p_inah004
   LET g_errparam.replace[5] = p_inah005
   LET g_errparam.replace[6] = p_inah006
   LET g_errparam.replace[7] = p_docno
   LET g_errparam.replace[8] = p_seq1
   LET g_errparam.replace[9] = p_seq2
   LET l_extend = cl_getmsg('ain-00968',g_lang)
  #LET l_extend = cl_err_replace_msg(l_extend)  #180424-00044#1 mark cl_getmsg()裡面已經call過了
   #180419-00065#1-e
   
   #检查是否已存在于参考单位/包装库存明细档中
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM inah_t
    WHERE inah001 = p_inah001
      AND inah002 = p_inah002
      AND inah003 = p_inah003
      AND inah004 = p_inah004
      AND inah005 = p_inah005
      AND inah006 = p_inah006
      AND inah007 = p_inah007
      AND inahent = g_enterprise
      AND inahsite = g_site
   IF l_n = 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00146'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查库存量足够否判断
   IF p_type = '-1' OR p_type = '0' OR (p_type = '2' AND p_qty < 0) THEN
      CALL s_inventory_check_inah009(p_type,p_inah001,p_inah002,p_inah003,p_inah004,p_inah005,p_inah006,p_inah007,p_inah008,p_qty,p_docno,p_seq1,p_seq2)
           RETURNING r_success1,r_flag1
      IF NOT (r_success1 = 1 AND r_flag1 = 1) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00145'
        #LET g_errparam.extend = p_inah001  #180419-00065#1 mark
         LET g_errparam.extend = l_extend   #180419-00065#1
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   #更新库存量
   LET l_inah009 = ''
   LET l_inah010 = ''
   SELECT inah009,inah010
     INTO l_inah009,l_inah010
     FROM inah_t 
    WHERE inah001 = p_inah001
      AND inah002 = p_inah002
      AND inah003 = p_inah003 
      AND inah004 = p_inah004
      AND inah005 = p_inah005
      AND inah006 = p_inah006
      AND inah007 = p_inah007
      AND inahent = g_enterprise
      AND inahsite = g_site
   IF p_type = '1' OR p_type = '2'THEN 
      LET l_inah009 = l_inah009 + p_qty
      LET l_inah010 = l_inah010 + p_qty
   END IF 
   IF p_type = '-1' OR p_type = '0' THEN 
      LET l_inah009 = l_inah009 - p_qty
      LET l_inah010 = l_inah010 - p_qty
   END IF 

   UPDATE inah_t
      SET inah009 = l_inah009,
          inah010 = l_inah010
    WHERE inah001 = p_inah001
      AND inah002 = p_inah002
      AND inah003 = p_inah003 
      AND inah004 = p_inah004
      AND inah005 = p_inah005
      AND inah006 = p_inah006
      AND inah007 = p_inah007
      AND inahent = g_enterprise
      AND inahsite = g_site
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "upd inah_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION
# # ################################################################################
# # # Descriptions...: 新增制造批序号库存明细档
# # # Memo...........:
# # # Usage..........: CALL s_inventory_ins_inai(p_inai001,p_inai002,p_inai003,p_inai004,p_inai005,,p_inai006,p_inai007,p_inai008,p_inai012,p_inai009)
# # #                       RETURNING r_success
# # # Input parameter: 1.p_inai001 LIKE inai_t.inai001 料件编号
# # #                  2.p_inai002 LIKE inai_t.inai002 产品特征
# # #                  3.p_inai003 LIKE inai_t.inai003 库存管理特征
# # #                  4.p_inai004 LIKE inai_t.inai004 库位
# # #                  5.p_inai005 LIKE inai_t.inai005 储位
# # #                  6.p_inai006 LIKE inai_t.inai006 批号
# # #                  7.p_inai007 LIKE inai_t.inai007 制造批号
# # #                  8.p_inai008 LIKE inai_t.inai008 制造序号
# # #                  9.p_inai012 LIKE inai_t.inai012 制造日期
# # #                  9.p_inai009 LIKE inai_t.inai009 庫存單位
# # # Return code....: r_success   处理状态TRUE/FALSE
# # # Date & Author..: 13/06/27 By wuxja
# # # Modify.........:
# # ################################################################################
PUBLIC FUNCTION s_inventory_ins_inai(p_inai001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,p_inai007,p_inai008,p_inai012,p_inai009)
DEFINE p_inai001    LIKE inai_t.inai001   #料件编号
DEFINE p_inai002    LIKE inai_t.inai002   #产品特征
DEFINE p_inai003    LIKE inai_t.inai003   #库存管理特征
DEFINE p_inai004    LIKE inai_t.inai004   #库位
DEFINE p_inai005    LIKE inai_t.inai005   #储位
DEFINE p_inai006    LIKE inai_t.inai006   #批号
DEFINE p_inai007    LIKE inai_t.inai007   #制造批号
DEFINE p_inai008    LIKE inai_t.inai008   #制造序号
DEFINE p_inai012    LIKE inai_t.inai012   #制造日期
DEFINE p_inai009    LIKE inai_t.inai009   #庫存單位
DEFINE r_success    LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE l_n          LIKE type_t.num5
#161124-00048#15 mod-S
#DEFINE l_inai       RECORD LIKE inai_t.*
DEFINE l_inai RECORD  #製造批序號庫存明細檔
       inaient LIKE inai_t.inaient, #企业编号
       inaisite LIKE inai_t.inaisite, #营运据点
       inai001 LIKE inai_t.inai001, #料件编号
       inai002 LIKE inai_t.inai002, #产品特征
       inai003 LIKE inai_t.inai003, #库存管理特征
       inai004 LIKE inai_t.inai004, #库位编号
       inai005 LIKE inai_t.inai005, #储位编号
       inai006 LIKE inai_t.inai006, #批号
       inai007 LIKE inai_t.inai007, #制造批号
       inai008 LIKE inai_t.inai008, #制造序号
       inai009 LIKE inai_t.inai009, #库存单位
       inai010 LIKE inai_t.inai010, #账面基础单位库存数量
       inai011 LIKE inai_t.inai011, #实际基础单位库存数量
       inai012 LIKE inai_t.inai012, #NO USE
       inai013 LIKE inai_t.inai013, #Tag二进位码
       inai014 LIKE inai_t.inai014  #基础单位
END RECORD
#161124-00048#15 mod-E


   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查：料件编号不可为空
   IF cl_null(p_inai001) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00123'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：库位不可为空
   IF cl_null(p_inai004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00126'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF 

   #检查：产品特征,库存管理特征,储位和批号,制造批序号为空，则给空格
   IF cl_null(p_inai002) THEN LET p_inai002 = ' ' END IF 
   IF cl_null(p_inai003) THEN LET p_inai003 = ' ' END IF
   IF cl_null(p_inai005) THEN LET p_inai005 = ' ' END IF 
   IF cl_null(p_inai006) THEN LET p_inai006 = ' ' END IF 
   IF cl_null(p_inai007) THEN LET p_inai007 = ' ' END IF 
   IF cl_null(p_inai008) THEN LET p_inai008 = ' ' END IF 
  
   #检查是否已存在于参考单位/包装库存明细档中
   LET l_n = 0
   SELECT COUNT(1) INTO l_n
     FROM inai_t
    WHERE inai001 = p_inai001
      AND inai002 = p_inai002
      AND inai003 = p_inai003
      AND inai004 = p_inai004
      AND inai005 = p_inai005
      AND inai006 = p_inai006
      AND inai007 = p_inai007
      AND inai008 = p_inai008
      AND inai009 = p_inai009
      AND inaient = g_enterprise
      AND inaisite = g_site
   IF l_n > 0 THEN
#      INITIALIZE g_errparam TO NULL
#      LET g_errparam.code = 'sub-00130'
#      LET g_errparam.popup = TRUE
#      CALL cl_err()
#      LET r_success = FALSE
      RETURN r_success
   END IF   
   
   #新增时栏位给值
   INITIALIZE l_inai TO NULL
   LET l_inai.inaient = g_enterprise
   LET l_inai.inaisite= g_site
   LET l_inai.inai001 = p_inai001
   LET l_inai.inai002 = p_inai002
   LET l_inai.inai003 = p_inai003
   LET l_inai.inai004 = p_inai004
   LET l_inai.inai005 = p_inai005
   LET l_inai.inai006 = p_inai006
   LET l_inai.inai007 = p_inai007
   LET l_inai.inai008 = p_inai008
#   LET l_inai.inai012 = p_inai012  #160512-00004#1 by 04441 mark
   LET l_inai.inai009 = p_inai009
   LET l_inai.inai010 = 0
   LET l_inai.inai011 = 0
   SELECT imaa006 INTO l_inai.inai014
    #FROM inai_t   #181001-00015#84 mark
     FROM imaa_t   #181001-00015#84 add
    WHERE imaaent = g_enterprise
      AND imaa001 = p_inai001
   SELECT inab008 INTO l_inai.inai013
     FROM inab_t
    WHERE inab001 = p_inai004
    AND inab002 = p_inai005
    AND inabent = g_enterprise
    AND inabsite = g_site
   
   #161124-00048#15 mod-S
#   INSERT INTO inai_t VALUES(l_inai.*)
   INSERT INTO inai_t(inaient,inaisite,inai001,inai002,inai003,
                      inai004,inai005,inai006,inai007,inai008,
                      inai009,inai010,inai011,inai012,inai013,
                      inai014)
               VALUES(l_inai.*)
   #161124-00048#15 mod-E
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins inai_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 更新制造批序号库存明细数量
# Memo...........:
# Usage..........: CALL s_inventory_upd_inai(p_docno,p_seq,p_seq1,p_type,p_inai001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,p_inai009,p_flag)
#                  RETURNING r_success
# Input parameter: 1.p_docno   LIKE type_t.chr20   单据编号  
#                  2.p_seq     LIKE type_t.num5    项次
#                  3.p_seq1    LIKE type_t.num5    项序
#                  4.p_type    LIKE type_t.chr2    异动类型  1:入库, -1:出库, 0:报废, 2:盘点 
#                  5.p_inai001 LIKE inai_t.inai001 料件編號
#                  6.p_inai002 LIKE inai_t.inai002 產品特徵
#                  7.p_inai003 LIKE inai_t.inai003 庫存管理特徵
#                  8.p_inai004 LIKE inai_t.inai004 庫位編號
#                  9.p_inai005 LIKE inai_t.inai005 儲位編號
#                 10.p_inai006 LIKE inai_t.inai006 批號    
#                 11.p_inai009 LIKE inai_t.inai009 庫存單位
#                 12.p_flag    LIKE type_t.chr1    1.扣帳 2.扣帳還原
# Return code....: r_success   LIKE type_t.num5
# Date & Author..: 13/12/13 By wuxja
# Modify.........: 15/04/17 By lixh 增加p_flag 區分過賬&過賬還原
################################################################################
PUBLIC FUNCTION s_inventory_upd_inai(p_docno,p_seq,p_seq1,p_type,p_inai001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,p_inai009,p_flag)
DEFINE p_docno        LIKE type_t.chr20     #单据编号  
DEFINE p_seq          LIKE type_t.num5      #项次
DEFINE p_seq1         LIKE type_t.num5      #项序
DEFINE p_type         LIKE type_t.chr2      #异动类型  1:入库, -1:出库, 0:报废, 2:盘点
DEFINE p_inai001      LIKE inai_t.inai001   #料件編號
DEFINE p_inai002      LIKE inai_t.inai002   #產品特徵
DEFINE p_inai003      LIKE inai_t.inai003   #庫存管理特徵
DEFINE p_inai004      LIKE inai_t.inai004   #庫位編號
DEFINE p_inai005      LIKE inai_t.inai005   #儲位編號
DEFINE p_inai006      LIKE inai_t.inai006   #批號    
DEFINE p_inai009      LIKE inai_t.inai009   #庫存單位
DEFINE p_flag         LIKE type_t.chr1      #1.扣帳 2.扣帳還原
DEFINE r_success      LIKE type_t.num5
DEFINE r_success1     LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE r_flag1        LIKE type_t.num5      #1:库存足够, 0:库存不足
DEFINE l_flag         LIKE type_t.chr1
DEFINE l_n            LIKE type_t.num5
#161124-00048#15 mod-S
#DEFINE l_inao         RECORD LIKE inao_t.*
DEFINE l_inao RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企业编号
       inaosite LIKE inao_t.inaosite, #营运据点
       inaodocno LIKE inao_t.inaodocno, #单号
       inaoseq LIKE inao_t.inaoseq, #项次
       inaoseq1 LIKE inao_t.inaoseq1, #项序
       inaoseq2 LIKE inao_t.inaoseq2, #序号
       inao000 LIKE inao_t.inao000, #数据类型
       inao001 LIKE inao_t.inao001, #料件编号
       inao002 LIKE inao_t.inao002, #产品特征
       inao003 LIKE inao_t.inao003, #库存管理特征
       inao004 LIKE inao_t.inao004, #包装容器编号
       inao005 LIKE inao_t.inao005, #库位
       inao006 LIKE inao_t.inao006, #储位
       inao007 LIKE inao_t.inao007, #批号
       inao008 LIKE inao_t.inao008, #制造批号
       inao009 LIKE inao_t.inao009, #制造序号
       inao010 LIKE inao_t.inao010, #制造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #数量
       inao013 LIKE inao_t.inao013, #出入库码
       inao014 LIKE inao_t.inao014, #库存单位
       inao020 LIKE inao_t.inao020, #检验合格量
       inao021 LIKE inao_t.inao021, #已入库/出货/签收量
       inao022 LIKE inao_t.inao022, #已验退/签退量
       inao023 LIKE inao_t.inao023, #已仓退/销退量
       inao024 LIKE inao_t.inao024, #已转QC量
       inao025 LIKE inao_t.inao025  #已退品量
END RECORD
#161124-00048#15 mod-E
DEFINE l_inai010      LIKE inai_t.inai010
DEFINE l_inai011      LIKE inai_t.inai011
DEFINE l_sql          STRING
DEFINE l_m            LIKE type_t.num5
DEFINE l_k            LIKE type_t.num5
DEFINE l_imaf074      LIKE imaf_t.imaf074   #170216-00011#1 add 
DEFINE l_imaf084      LIKE imaf_t.imaf084   #170216-00011#1 add
DEFINE l_extend_1     STRING                #180419-00065#1
DEFINE l_extend_2     STRING                #180419-00065#1
#171218-00024#2-s-add
DEFINE l_xmdk044    LIKE xmdk_t.xmdk044  #多角編號
DEFINE l_site_o     LIKE inao_t.inaosite #營運據點
DEFINE l_site       LIKE inao_t.inaosite #營運據點
DEFINE l_inai004    LIKE inai_t.inai004  #庫位
DEFINE l_inai005    LIKE inai_t.inai005  #儲位
DEFINE l_direct_chk LIKE type_t.num5     #記錄是否正拋
DEFINE l_aic      RECORD
          icab003   LIKE icab_t.icab003,
          icac007   LIKE icac_t.icac007,
          icad004   LIKE icad_t.icad004,
          icad005   LIKE icad_t.icad005
       END RECORD
#171218-00024#2-e-add

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查：单据编号不可为空
   IF cl_null(p_docno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF 

   #检查：项次项序不可为空
   IF cl_null(p_seq) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   IF cl_null(p_seq1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查：异动类型不可为空
   IF cl_null(p_type) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：料件編號不可为空
   IF cl_null(p_inai001) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：產品特徵不可为NULL
   IF p_inai002 IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF 
   
   #检查：庫存管理特徵不可为NULL
   IF p_inai003 IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #检查：庫位不可为空
   IF cl_null(p_inai004) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF   
   
   #检查：儲位不可为NULL
   IF p_inai005 IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF    
   
   #检查：批號不可为NULL
   IF p_inai006 IS NULL THEN
      LET r_success = FALSE
      RETURN r_success
   END IF    
   
   #检查：庫存單位不可为空
   IF cl_null(p_inai009) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #171218-00024#2-s-add
   LET l_site_o = ''
   #取得多角編號
   LET l_xmdk044 = ''
   IF p_type = '-1' THEN
      #出庫
      SELECT xmdk044 INTO l_xmdk044
        FROM xmdk_t
       WHERE xmdkent = g_enterprise
         AND xmdkdocno = p_docno
   ELSE
      #入庫
      SELECT pmds053 INTO l_xmdk044
        FROM pmds_t
       WHERE pmdsent = g_enterprise
         AND pmdsdocno = p_docno
   END IF
   #判斷是否正拋
   LET l_site = ''
   LET l_inai004 = ''
   LET l_inai005 = ''
   LET l_direct_chk = FALSE
   INITIALIZE l_aic.* TO NULL
   IF NOT cl_null(l_xmdk044) THEN
      #取得最終站的aici100相關資料設定
      CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING l_direct_chk,l_aic.*
      LET l_site = l_aic.icab003
      LET l_inai004 = l_aic.icad004
      LET l_inai005 = l_aic.icad005
   END IF   
   #171218-00024#2-e-add
   
   #180419-00065#1-s
   INITIALIZE g_errparam TO NULL
   LET g_errparam.replace[1] = p_inai001
   LET g_errparam.replace[2] = p_inai002
   LET g_errparam.replace[3] = p_inai003
   LET g_errparam.replace[4] = p_inai004
   LET g_errparam.replace[5] = p_inai005
   LET g_errparam.replace[6] = p_inai006
   LET g_errparam.replace[7] = p_docno
   LET g_errparam.replace[8] = p_seq
   LET g_errparam.replace[9] = p_seq1
   LET l_extend_1 = cl_getmsg('ain-00968',g_lang)
  #LET l_extend_1 = cl_err_replace_msg(l_extend_1)  #180424-00044#1 mark cl_getmsg()裡面已經call過了
   #180419-00065#1-e
   #161124-00048#15 mod-S
#   LET l_sql = " SELECT * FROM inao_t ",
   #170308-00016#1-s
   #LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,",
   #            "        inaoseq2,inao000,inao001,inao002,inao003,",
   #            "        inao004,inao005,inao006,inao007,inao008,",
   #            "        inao009,inao010,inao011,inao012,inao013,",
   #            "        inao014,inao020,inao021,inao022,inao023,",
   #            "        inao024,inao025 ",
   LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000, ",
               "        COALESCE(inao001,' '),COALESCE(inao002,' '),COALESCE(inao003,' '),inao004, ",
               "        COALESCE(inao005,' '),COALESCE(inao006,' '),COALESCE(inao007,' '),inao008, ",
               "        inao009,inao010,inao011,inao012,inao013,inao014, ",
               "        inao020,inao021,inao022,inao023,inao024,inao025 ",
   #170308-00016#1-e
               "   FROM inao_t ",
   #161124-00048#15 mod-E
               "  WHERE inaoent = '",g_enterprise,"' ",
              #"    AND inaosite = '",g_site,"' ",  #mark by lixh 20151210
              #190807-00028#1 -S mark
#191106-00013#1 -s mark還原  
               "    AND inaodocno = '",p_docno,"' ",
              #"    AND inaoseq = '",p_seq,"' ",    #171214-00016#1 mark
              #"    AND inaoseq1 = '",p_seq1,"' ",  #171214-00016#1 mark
               "    AND inaoseq = ",p_seq,          #171214-00016#1 add
               "    AND inaoseq1 = ",p_seq1,        #171214-00016#1 add
#191106-00013#1 -e mark還原
              #190807-00028#1 -E mark
#191106-00013#1 -s mark
#             #190807-00028#1 -S add
#              "    AND inaodocno = ? ",
#              "    AND inaoseq = ? ",
#              "    AND inaoseq1 = ? ",
#             #190807-00028#1 -E add
#191106-00013#1 -e mark
               "    AND inao000 = '2' "
   #add by wuxja 2014/6/4
   LET l_m = 0
   SELECT COUNT(1) INTO l_m
     FROM inao_t
    WHERE inaoent = g_enterprise
     #AND inaosite = g_site  #mark by lixh 20151210
      AND inaodocno = p_docno
      AND inaoseq = p_seq
      AND inaoseq1 = p_seq1
      AND inao000 = '2'
      AND inao013 = 1
   LET l_k = 0
   SELECT COUNT(1) INTO l_k
     FROM inao_t
    WHERE inaoent = g_enterprise
     #AND inaosite = g_site  #mark by lixh 20151210
      AND inaodocno = p_docno
      AND inaoseq = p_seq
      AND inaoseq1 = p_seq1
      AND inao000 = '2'
      AND inao013 = -1   
   IF l_m > 0 AND l_k > 0 THEN
     #IF p_type = '1' OR p_type = '2' THEN
      IF p_type = '1' THEN
         LET l_sql = l_sql," AND inao013 = 1"
      END IF
     
      IF p_type = '-1' OR p_type = '0' THEN
         LET l_sql = l_sql," AND inao013 = -1"
      END IF
   END IF
   #end 
#  IF cl_null(g_pre_trigger1) THEN  #190807-00028#1 add   #191106-00013#1 mark
      PREPARE inai_upd_pre FROM l_sql
      DECLARE inai_upd_cs CURSOR FOR inai_upd_pre
#191106-00013#1 -s mark
#  #190807-00028#1 -S add
#     LET g_pre_trigger1 = 'Y'
#  END IF
#  #190807-00028#1 -E add
#191106-00013#1 -e mark
   LET l_flag = 'N'
   FOREACH inai_upd_cs INTO l_inao.*                            #190807-00028#1 mark   #191106-00013#1 mark還原
  #FOREACH inai_upd_cs USING p_docno,p_seq,p_seq1 INTO l_inao.*  #190807-00028#1 add   #191106-00013#1 mark
      LET l_flag = 'Y'      #可以抓到资料
      #180419-00065#1-s
      INITIALIZE g_errparam TO NULL
      LET g_errparam.replace[1] = l_inao.inao001
      LET g_errparam.replace[2] = l_inao.inao002
      LET g_errparam.replace[3] = l_inao.inao003
      LET g_errparam.replace[4] = l_inao.inao005
      LET g_errparam.replace[5] = l_inao.inao006
      LET g_errparam.replace[6] = l_inao.inao007
      LET g_errparam.replace[7] = l_inao.inaodocno
      LET g_errparam.replace[8] = l_inao.inaoseq
      LET g_errparam.replace[9] = l_inao.inaoseq1
      LET g_errparam.replace[10]= l_inao.inaoseq2
      LET l_extend_2 = cl_getmsg('ain-00968',g_lang)
     #LET l_extend_2 = cl_err_replace_msg(l_extend_2)  #180424-00044#1 mark cl_getmsg()裡面已經call過了
      #180419-00065#1-e
      #170619-00049#2-s add  
      IF g_aic_continue THEN
         #检查是否已存在于制造批序号库存明细档中,不存在则新增,存在则更新
         LET l_n = 0
         SELECT COUNT(1) INTO l_n
           FROM inai_t
          WHERE inai001 = l_inao.inao001
            AND inai002 = p_inai002
            AND inai003 = p_inai003
            AND inai004 = p_inai004
            AND inai005 = p_inai005
            AND inai007 = l_inao.inao008
            AND inai008 = l_inao.inao009
            AND inai009 = p_inai009
            AND inaient = g_enterprise
            AND inaisite = g_site
      ELSE
      #170619-00049#2-e add
         #检查是否已存在于制造批序号库存明细档中,不存在则新增,存在则更新
         LET l_n = 0
         SELECT COUNT(1) INTO l_n
           FROM inai_t
          WHERE inai001 = l_inao.inao001
            AND inai002 = p_inai002
            AND inai003 = p_inai003
            AND inai004 = p_inai004
            AND inai005 = p_inai005
            AND inai006 = p_inai006
            AND inai007 = l_inao.inao008
            AND inai008 = l_inao.inao009
            AND inai009 = p_inai009
            AND inaient = g_enterprise
            AND inaisite = g_site
      END IF #170619-00049#2 add      
      IF l_n = 0 THEN
         IF NOT s_inventory_ins_inai(l_inao.inao001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,l_inao.inao008,l_inao.inao009,l_inao.inao010,p_inai009) THEN
            LET r_success = FALSE
            RETURN r_success
         END IF    
      END IF  
      #检查库存量足够否判断
     #IF p_type = '-1' OR p_type = '0' OR (p_type = '2' AND l_inao.inao012 < 0) THEN   #181124-00005#1 mark
      IF (p_type = '-1' AND l_inao.inao012 > 0) OR p_type = '0' OR (p_type = '2' AND l_inao.inao012 < 0) THEN   #181124-00005#1 add   #數量大於0的才檢核庫存是否足夠
         #171218-00024#2-s-add
         IF l_direct_chk THEN
            LET l_site_o = g_site #備份營運據點
            LET g_site = l_site   #營運據點換成最終站
            CALL s_inventory_check_inai010(p_type,l_inao.inao001,p_inai002,p_inai003,l_inai004,l_inai005,p_inai006,l_inao.inao008,l_inao.inao009,l_inao.inao012,p_inai009,p_flag)
                 RETURNING r_success1,r_flag1
            LET g_site = l_site_o #還原營運據點 
         ELSE
         #171218-00024#2-e-add
           #CALL s_inventory_check_inai010(p_type,l_inao.inao001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,l_inao.inao008,l_inao.inao009,l_inao.inao012,p_inai009) 
            CALL s_inventory_check_inai010(p_type,l_inao.inao001,p_inai002,p_inai003,p_inai004,p_inai005,p_inai006,l_inao.inao008,l_inao.inao009,l_inao.inao012,p_inai009,p_flag)   #add by lixh 20150417
                 RETURNING r_success1,r_flag1
         END IF #171218-00024#2-add
         IF NOT (r_success1 = 1 AND r_flag1 = 1) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00145'
           #LET g_errparam.extend = l_inao.inao001  #180419-00065#1 mark
            LET g_errparam.extend = l_extend_2      #180419-00065#1
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF
      #170619-00049#2-s add  
      IF g_aic_continue THEN
         #更新库存量
         LET l_inai010 = ''
         LET l_inai011 = ''
         SELECT inai010,inai011
           INTO l_inai010,l_inai011
           FROM inai_t 
          WHERE inai001 = l_inao.inao001
            AND inai002 = p_inai002
            AND inai003 = p_inai003
            AND inai004 = p_inai004
            AND inai005 = p_inai005
            AND inai007 = l_inao.inao008
            AND inai008 = l_inao.inao009
            AND inai009 = p_inai009
            AND inaisite = g_site
            AND inaient = g_enterprise      
      ELSE      
      #170619-00049#2-e add
         #更新库存量
         LET l_inai010 = ''
         LET l_inai011 = ''
         SELECT inai010,inai011
           INTO l_inai010,l_inai011
           FROM inai_t 
          WHERE inai001 = l_inao.inao001
            AND inai002 = p_inai002
            AND inai003 = p_inai003
            AND inai004 = p_inai004
            AND inai005 = p_inai005
            AND inai006 = p_inai006
            AND inai007 = l_inao.inao008
            AND inai008 = l_inao.inao009
            AND inai009 = p_inai009
            AND inaisite = g_site
            AND inaient = g_enterprise
      END IF  #170619-00049#2 add  
     #IF p_type = '1' OR p_type = '2' THEN 
      IF p_type = '1' OR (p_type = '2' AND p_flag = '1') THEN  #add by lixh 20150417
         LET l_inai010 = l_inai010 + l_inao.inao012
         LET l_inai011 = l_inai011 + l_inao.inao012
      END IF 
      IF p_type = '-1' OR p_type = '0' THEN 
         LET l_inai010 = l_inai010 - l_inao.inao012
         LET l_inai011 = l_inai011 - l_inao.inao012
      END IF 
      #add by lixh 20150417
      IF p_type = '2' AND p_flag = '2' THEN
         LET l_inai010 = l_inai010 - l_inao.inao012
         LET l_inai011 = l_inai011 - l_inao.inao012         
      END IF
      #add by lixh 20150417
      #170619-00049#2-s add  
      IF g_aic_continue THEN
         UPDATE inai_t
            SET inai010 = l_inai010,
                inai011 = l_inai011
          WHERE inai001 = l_inao.inao001
            AND inai002 = p_inai002
            AND inai003 = p_inai003
            AND inai004 = p_inai004
            AND inai005 = p_inai005
           #AND inai006 = p_inai006 #180531-00057#1 mark
            AND inai007 = l_inao.inao008
            AND inai008 = l_inao.inao009
            AND inai009 = p_inai009
            AND inaisite = g_site
            AND inaient = g_enterprise      
      ELSE
      #170619-00049#2-e add  
         UPDATE inai_t
            SET inai010 = l_inai010,
                inai011 = l_inai011
          WHERE inai001 = l_inao.inao001
            AND inai002 = p_inai002
            AND inai003 = p_inai003
            AND inai004 = p_inai004
            AND inai005 = p_inai005
            AND inai006 = p_inai006
            AND inai007 = l_inao.inao008
            AND inai008 = l_inao.inao009
            AND inai009 = p_inai009
            AND inaisite = g_site
            AND inaient = g_enterprise
      END IF    #170619-00049#2 add    
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "upd inai_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      #170216-00011#1-S
      SELECT imaf074,imaf084 INTO l_imaf074,l_imaf084 FROM imaf_t 
       WHERE imafent = g_enterprise
         AND imafsite = g_site
         AND imaf001 = l_inao.inao001
      IF l_imaf074 = '1' OR l_imaf084 = '1' THEN  
         IF l_inai010 = 0 THEN
            DELETE FROM inae_t 
             WHERE inaeent = g_enterprise
               AND inae001 = l_inao.inao001
               AND inaesite = g_site
               AND inae002 = p_inai002
               AND inae003 = l_inao.inao008
               AND inae004 = l_inao.inao009
               AND inae005 = p_docno
               AND inae006 = p_seq
               AND inae007 = p_seq1
            #170619-00049#2-s add  
            IF g_aic_continue THEN
               DELETE FROM inai_t     
                WHERE inai001 = l_inao.inao001
                  AND inai002 = p_inai002
                  AND inai003 = p_inai003
                  AND inai004 = p_inai004
                  AND inai005 = p_inai005
                  AND inai007 = l_inao.inao008
                  AND inai008 = l_inao.inao009
                  AND inai009 = p_inai009
                  AND inaisite = g_site
                  AND inaient = g_enterprise                        
            ELSE
            #170619-00049#2-e add             
               DELETE FROM inai_t     
                WHERE inai001 = l_inao.inao001
                  AND inai002 = p_inai002
                  AND inai003 = p_inai003
                  AND inai004 = p_inai004
                  AND inai005 = p_inai005
                  AND inai006 = p_inai006
                  AND inai007 = l_inao.inao008
                  AND inai008 = l_inao.inao009
                  AND inai009 = p_inai009
                  AND inaisite = g_site
                  AND inaient = g_enterprise 
            END IF #170619-00049#2 add                  
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "del inai_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success
            END IF             
         END IF 
      END IF       
      #170216-00011#1-E
   END FOREACH
   IF l_flag = 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00305'
      LET g_errparam.popup = TRUE
      LET g_errparam.extend = l_extend_1      #180419-00065#1
      #180419-00065#1-s mark
      #LET g_errparam.extend = p_docno
      #IF p_seq IS NOT NULL THEN
      #   LET g_errparam.extend = g_errparam.extend,"|",p_seq
      #END IF
      #IF p_seq1 IS NOT NULL THEN
      #   LET g_errparam.extend = g_errparam.extend,"|",p_seq1
      #END IF  
      #180419-00065#1-e mark
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 新增库存交易异动明细
# Memo...........:
# Usage..........: CALL s_inventory_ins_inaj(p_imafsite)
#                  RETURNING r_success
# Input parameter: p_imafsite  營運據點(流通作業一律傳入ALL,製造傳入g_site或‘’)
# Return code....: r_success   成功与否TRUE OR FALSE
# Date & Author..: 13/12/16 By wuxja
# Modify.........: 14/09/19 By 04441   add VMI
# Modify.........: 14/09/26 By pomelo  增加p_site參數 用來區分製造的程式，還是流通的程式
# Modify.........: 15/02/13 By 04441   將p_site改為p_imafsite,只有當抓取imaf_t時,
#                                      imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
# Modify.........: 15/03/23 By earl    1.單一庫存單位時，用料號抓取庫存單位放到inaj045
#                                      2.多庫存單位時，inaj012放到inaj045
#                                      3.調撥單撥出時，若xmdc009='Y'時，inaj012放到inaj045
#                                      4.inaj013 = inaj012和inaj045的轉換率
#                                      5.給予新欄位(inaj046~inaj051)的值。(ps.用數量=1呼叫s_aimi190_get_convert1() RETURNING r_success,分母,分子)
# Modify.........: 15/08/20 By Lori    增加判斷是否為聯營/租賃/費用商品不扣庫存
################################################################################
PUBLIC FUNCTION s_inventory_ins_inaj(p_imafsite)
DEFINE p_imafsite     LIKE imaf_t.imafsite
DEFINE r_success      LIKE type_t.num5
DEFINE l_docdt        LIKE type_t.dat
DEFINE l_imaf054      LIKE imaf_t.imaf054
DEFINE l_imaf053      LIKE imaf_t.imaf053
DEFINE l_imaf071      LIKE imaf_t.imaf071
DEFINE l_imaf081      LIKE imaf_t.imaf081
DEFINE l_imaa006      LIKE imaa_t.imaa006
DEFINE l_imag014      LIKE imag_t.imag014   #成本單位
DEFINE l_success      LIKE type_t.num5
DEFINE l_rate         LIKE inaj_t.inaj014 
DEFINE l_sql          STRING
#161124-00048#15 mod-S
#DEFINE l_inao         RECORD LIKE inao_t.*
#DEFINE l_inal         RECORD LIKE inal_t.*
DEFINE l_inao RECORD  #製造批序號庫存異動明細檔
       inaoent LIKE inao_t.inaoent, #企业编号
       inaosite LIKE inao_t.inaosite, #营运据点
       inaodocno LIKE inao_t.inaodocno, #单号
       inaoseq LIKE inao_t.inaoseq, #项次
       inaoseq1 LIKE inao_t.inaoseq1, #项序
       inaoseq2 LIKE inao_t.inaoseq2, #序号
       inao000 LIKE inao_t.inao000, #数据类型
       inao001 LIKE inao_t.inao001, #料件编号
       inao002 LIKE inao_t.inao002, #产品特征
       inao003 LIKE inao_t.inao003, #库存管理特征
       inao004 LIKE inao_t.inao004, #包装容器编号
       inao005 LIKE inao_t.inao005, #库位
       inao006 LIKE inao_t.inao006, #储位
       inao007 LIKE inao_t.inao007, #批号
       inao008 LIKE inao_t.inao008, #制造批号
       inao009 LIKE inao_t.inao009, #制造序号
       inao010 LIKE inao_t.inao010, #制造日期
       inao011 LIKE inao_t.inao011, #有效日期
       inao012 LIKE inao_t.inao012, #数量
       inao013 LIKE inao_t.inao013, #出入库码
       inao014 LIKE inao_t.inao014, #库存单位
       inao020 LIKE inao_t.inao020, #检验合格量
       inao021 LIKE inao_t.inao021, #已入库/出货/签收量
       inao022 LIKE inao_t.inao022, #已验退/签退量
       inao023 LIKE inao_t.inao023, #已仓退/销退量
       inao024 LIKE inao_t.inao024, #已转QC量
       inao025 LIKE inao_t.inao025  #已退品量
END RECORD
DEFINE l_inal RECORD  #製造批序號庫存交易明細檔
       inalent LIKE inal_t.inalent, #企业编号
       inalsite LIKE inal_t.inalsite, #营运据点
       inal001 LIKE inal_t.inal001, #单据编号
       inal002 LIKE inal_t.inal002, #项次
       inal003 LIKE inal_t.inal003, #项序
       inal004 LIKE inal_t.inal004, #序号
       inal005 LIKE inal_t.inal005, #出入库码
       inal006 LIKE inal_t.inal006, #料件编号
       inal007 LIKE inal_t.inal007, #产品特征
       inal008 LIKE inal_t.inal008, #库存管理特征
       inal009 LIKE inal_t.inal009, #库位编号
       inal010 LIKE inal_t.inal010, #储位编号
       inal011 LIKE inal_t.inal011, #批号
       inal012 LIKE inal_t.inal012, #制造批号
       inal013 LIKE inal_t.inal013, #制造序号
       inal014 LIKE inal_t.inal014, #交易数量
       inal015 LIKE inal_t.inal015, #异动指令编号
       inal016 LIKE inal_t.inal016, #单据扣账日期
       inal017 LIKE inal_t.inal017, #实际运行扣账日期
       inal018 LIKE inal_t.inal018  #库存异动类型
END RECORD
#161124-00048#15 mod-E
DEFINE l_slip         LIKE oobx_t.oobx001
DEFINE l_inaa018      LIKE inaa_t.inaa018   #結算庫位
DEFINE l_inaj008      LIKE inaj_t.inaj008   #備份庫位編號
DEFINE l_inaj009      LIKE inaj_t.inaj009   #備份儲位編號
DEFINE l_inaj030      LIKE inaj_t.inaj030   #備份VMI交易結算否
#add--2015/01/29 By shiun--根據單據性質給予抓取的單號欄位--(S)
DEFINE l_inaj015      LIKE inaj_t.inaj015  
DEFINE l_prog_sign    STRING   
DEFINE l_inaj044_sql  STRING
#add--2015/01/29 By shiun--根據單據性質給予抓取的單號欄位--(E)
DEFINE l_cnt          LIKE type_t.num5      #160812-00014#1
DEFINE l_oobx004      LIKE oobx_t.oobx004
DEFINE l_indc009      LIKE indc_t.indc009
DEFINE l_qty1         LIKE imad_t.imad003
DEFINE l_qty2         LIKE imad_t.imad005
DEFINE l_chkqty       LIKE inaj_t.inaj011   #160422-00006
#DEFINE l_chkdate      LIKE inaj_t.inaj022   #160422-00006    #161116-00015#1 mark
DEFINE l_inaa014      LIKE inaa_t.inaa014   #160429-00012
DEFINE l_inad006      LIKE inad_t.inad006   #add by geza 20160526  #160523-00009#4
DEFINE l_chk          LIKE type_t.num5      #161007-00012#2-add
DEFINE l_qty3         LIKE inaj_t.inaj011   #161130-00028#1 add
DEFINE l_edate        LIKE inaj_t.inaj022   #161202-00031#1
DEFINE l_log          STRING                #170308-00016#1
DEFINE l_xmdk082      LIKE xmdk_t.xmdk082   #170609-00006#1 add
DEFINE l_stock_out    LIKE indd_t.indd022   #171108-00043#1 add
DEFINE l_stock_in     LIKE indd_t.indd022   #171108-00043#1 add
DEFINE l_site         LIKE indc_t.indc005   #171108-00043#1 add
#171113-00003#1--add--s
DEFINE la_param        RECORD
          prog         STRING,
          actionid     STRING,
          background   LIKE type_t.chr1,
          param        DYNAMIC ARRAY OF STRING
                   END RECORD
DEFINE ls_js          STRING                              
#171113-00003#1--add--e
DEFINE l_extend       STRING                #180419-00065#1
#190722-00026#1 add --(S)--
DEFINE l_xmdk044      LIKE xmdk_t.xmdk044  #多角編號
DEFINE l_site_o       LIKE inaj_t.inajsite #營運據點
DEFINE l_site_aic     LIKE inaj_t.inajsite #營運據點
DEFINE l_inaj008_aic  LIKE inaj_t.inaj008  #庫位
DEFINE l_inaj009_aic  LIKE inaj_t.inaj009  #儲位
DEFINE l_direct_chk   LIKE type_t.num5     #記錄是否正拋
DEFINE l_aic      RECORD
          icab003     LIKE icab_t.icab003, #營運據點
          icac007     LIKE icac_t.icac007, #出貨單單別
          icad004     LIKE icad_t.icad004, #庫位
          icad005     LIKE icad_t.icad005  #儲位
       END RECORD
#190722-00026#1 add --(E)--

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #检查:应在事物中的
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   #150819-00029 150820 by lori add---(S)
   IF s_inventory_chk_prod(g_inaj.inaj005,p_imafsite) THEN
      RETURN r_success
   END IF
   #150819-00029 150820 by lori add---(E)
   
   IF cl_null(g_inaj.inajent) THEN LET g_inaj.inajent = g_enterprise END IF
   IF cl_null(g_inaj.inajsite) THEN LET g_inaj.inajsite = g_site END IF
   #判斷產品特徵,庫存管理特徵,庫位編號,儲位編號,批號等欄位若為NULL時，則預設一個空白
   IF cl_null(g_inaj.inaj006) THEN LET g_inaj.inaj006 = ' ' END IF
   IF cl_null(g_inaj.inaj007) THEN LET g_inaj.inaj007 = ' ' END IF
   IF cl_null(g_inaj.inaj008) THEN LET g_inaj.inaj008 = ' ' END IF
   IF cl_null(g_inaj.inaj009) THEN LET g_inaj.inaj009 = ' ' END IF
   IF cl_null(g_inaj.inaj010) THEN LET g_inaj.inaj010 = ' ' END IF
   #將VMI結算否預設為'0:非VMI結算'-----170919 04441 add
   IF cl_null(g_inaj.inaj030) THEN LET g_inaj.inaj030 = '0' END IF
   #----------14/09/26 By pomelo add
   IF cl_null(p_imafsite) THEN LET p_imafsite = g_site END IF
   
   #180419-00065#1-s
   INITIALIZE g_errparam TO NULL
   LET g_errparam.replace[1] = g_inaj.inaj005
   LET g_errparam.replace[2] = g_inaj.inaj006
   LET g_errparam.replace[3] = g_inaj.inaj007
   LET g_errparam.replace[4] = g_inaj.inaj008
   LET g_errparam.replace[5] = g_inaj.inaj009
   LET g_errparam.replace[6] = g_inaj.inaj010
   LET g_errparam.replace[7] = g_inaj.inaj001
   LET g_errparam.replace[8] = g_inaj.inaj002
   LET g_errparam.replace[9] = g_inaj.inaj003
   LET g_errparam.replace[10] = '0'             #190722-00026#1 add
   LET l_extend = cl_getmsg('ain-00968',g_lang)
  #LET l_extend = cl_err_replace_msg(l_extend)  #180424-00044#1 mark cl_getmsg()裡面已經call過了
   #180419-00065#1-e
   
   #190722-00026#1 add --(S)--
   LET l_direct_chk = FALSE
   IF NOT cl_null(g_inaj.inaj001) THEN
      LET l_site_o = ''
      #取得多角編號
      LET l_xmdk044 = ''
      IF g_inaj.inaj004 = -1 THEN
         #出庫
         SELECT xmdk044 INTO l_xmdk044
           FROM xmdk_t
          WHERE xmdkent = g_enterprise
            AND xmdkdocno = g_inaj.inaj001
      ELSE
         #入庫
         SELECT pmds053 INTO l_xmdk044
           FROM pmds_t
          WHERE pmdsent = g_enterprise
            AND pmdsdocno = g_inaj.inaj001
      END IF
      #判斷是否正拋
      LET l_site_aic = ''
      LET l_inaj008_aic = ''
      LET l_inaj009_aic = ''
      INITIALIZE l_aic.* TO NULL
      IF NOT cl_null(l_xmdk044) THEN
         #取得最終站的aici100相關資料設定
         CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING l_direct_chk,l_aic.*
         LET l_site_aic = l_aic.icab003
         LET l_inaj008_aic = l_aic.icad004
         LET l_inaj009_aic = l_aic.icad005
         IF cl_null(l_inaj008_aic) THEN LET l_inaj008_aic = ' ' END IF
         IF cl_null(l_inaj009_aic) THEN LET l_inaj009_aic = ' ' END IF
         IF l_direct_chk THEN
            LET g_errparam.replace[4] = l_inaj008_aic
            LET g_errparam.replace[5] = l_inaj009_aic
            LET l_extend = cl_getmsg('ain-00968',g_lang)
            LET l_extend = cl_getmsg('lib-00114',g_lang),l_site_aic,"，",cl_getmsg('ain-00968',g_lang)
         END IF
      END IF   
   END IF   
   #190722-00026#1 add --(S)--
   
   #出入库码值需为1或者-1，1代表入库，-1代表出库
   IF g_inaj.inaj004 != 1 AND g_inaj.inaj004 != -1 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00480'
      LET g_errparam.extend = g_inaj.inaj004
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #单据扣帐日期不可小于关账日期
   CALL cl_get_para(g_enterprise,g_site,'S-MFG-0031') RETURNING l_docdt
   #IF g_inaj.inaj022 < l_docdt THEN     #190115-00027#1 mark
   IF g_inaj.inaj022 <= l_docdt THEN     #190115-00027#1 mod
      INITIALIZE g_errparam TO NULL
      #LET g_errparam.code = 'sub-00306'  #190115-00027#1 mark
      LET g_errparam.code = 'sub-01525'   #190115-00027#1 mod
      LET g_errparam.extend = g_inaj.inaj022
      LET g_errparam.replace[1] = g_site     #190115-00027#1 add  
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
  
   #----------14/09/26 By pomelo modify(s)
   #當p_site = 'ALL' 的時候，表示為流通程式，所以在抓取imaf的資料，imafsite = 'ALL'
   #异动明细资料预设值 
   #計算交易單位與庫存單位的換算率
   LET l_imaf053 = ''
   LET l_imaf054 = ''
   CASE p_imafsite
      WHEN 'ALL'
         SELECT imaf054
           INTO l_imaf054
           FROM imaf_t
          WHERE imafent = g_inaj.inajent
            AND imafsite = p_imafsite
            AND imaf001 = g_inaj.inaj005
         #抓此料號的庫存單位
         SELECT imaa104 INTO l_imaf053
           FROM imaa_t
          WHERE imaaent = g_enterprise
            AND imaa001 = g_inaj.inaj005
      OTHERWISE
         SELECT imaf053,imaf054
           INTO l_imaf053,l_imaf054
           FROM imaf_t
          WHERE imafent = g_inaj.inajent
            AND imafsite = g_inaj.inajsite
            AND imaf001 = g_inaj.inaj005
   END CASE
   #----------14/09/26 By pomelo modify(e)
   
   IF l_imaf054 = 'N' THEN
      IF cl_null(l_imaf053) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aim-00203'
        #LET g_errparam.extend = g_inaj.inaj005  #180419-00065#1 mark
         LET g_errparam.extend = l_extend        #180419-00065#1
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF

      #150323---earl---mark--s
#      CALL s_aimi190_get_convert(g_inaj.inaj005,g_inaj.inaj012,l_imaf053)
#           RETURNING l_success,l_rate
#      IF l_success THEN
#         LET g_inaj.inaj013 = l_rate
#      ELSE
#         LET r_success = FALSE
#         RETURN r_success
#      END IF
      #150323---earl---mark--e

      #150323---earl---add--s
      WHILE TRUE
         IF g_inaj.inaj004 = -1 THEN
            #取單別
            CALL s_aooi200_get_slip(g_inaj.inaj001) RETURNING l_success,l_slip
            #取得作業代號
            LET l_oobx004 = ''
            CALL s_fin_get_oobx004('','',l_slip) RETURNING l_oobx004
            
            #單據性質='aint330'、'aint340'(調撥單)
            IF l_oobx004 = 'aint330' OR
               l_oobx004 = 'aint340' THEN
               
               #調撥單撥出時，若xmdc009='Y'時，inaj012放到inaj045
               LET l_indc009 = ''
               SELECT indc009 INTO l_indc009
                 FROM indc_t
                WHERE indcent = g_enterprise
                  AND indcdocno = g_inaj.inaj001
      
               
               IF l_indc009 = 'Y' THEN
                  LET g_inaj.inaj013 = 1
                  LET g_inaj.inaj045 = g_inaj.inaj012
                  LET g_inaj.inaj046 = 1   #交易單位與庫存單位換算分子
                  LET g_inaj.inaj047 = 1   #交易單位與庫存單位換算分母
                  EXIT WHILE
               END IF
            END IF
         END IF
            
         #單一庫存單位時，用料號抓取庫存單位放到inaj045
         LET g_inaj.inaj045 = l_imaf053
         #190819-00023#1   add-S
         IF g_prog = 'aint170' AND g_inaj.inaj004 = '-1' THEN
            LET g_inaj.inaj045 = g_inaj.inaj012
         END IF
         #190819-00023#1   add-E
         
         CALL s_aimi190_get_convert(g_inaj.inaj005,g_inaj.inaj012,g_inaj.inaj045)
              RETURNING l_success,l_rate
         IF l_success THEN
            LET g_inaj.inaj013 = l_rate
         ELSE
            LET r_success = FALSE
            RETURN r_success
         END IF

         CALL s_aimi190_get_convert1(g_inaj.inaj005,g_inaj.inaj012,g_inaj.inaj045) RETURNING r_success,l_qty1,l_qty2
         IF NOT r_success THEN
            RETURN r_success
         END IF
         
         LET g_inaj.inaj046 = l_qty2  #交易單位與庫存單位換算分子
         LET g_inaj.inaj047 = l_qty1  #交易單位與庫存單位換算分母

         EXIT WHILE
      END WHILE
      #150323---earl---add--e
   ELSE
      LET g_inaj.inaj013 = 1
      
      #150323---earl---add--s      
      #多庫存單位時，inaj012放到inaj045
      LET g_inaj.inaj045 = g_inaj.inaj012
      LET g_inaj.inaj046 = 1   #交易單位與庫存單位換算分子
      LET g_inaj.inaj047 = 1   #交易單位與庫存單位換算分母
      #150323---earl---add--e      
   END IF

   #IF YEAR(g_inaj.inaj022) != YEAR(g_inaj.inaj023) OR MONTH(g_inaj.inaj022) != MONTH(g_inaj.inaj023) THEN  #跨月  #160812-00010#1   #161116-00015#1 mark
   
     #-160429-00012-add- 
      SELECT inaa014 INTO l_inaa014
        FROM inaa_t
       WHERE inaaent = g_inaj.inajent
         AND inaasite = g_inaj.inajsite 
         AND inaa001 = g_inaj.inaj008
      IF cl_null(l_inaa014) THEN LET l_inaa014 = 'N' END IF
     #-160429-00012-end- 
     
     #-160422-00006-add- 
     #IF g_inaj.inaj004 = -1 THEN                       #160429-00012 mark
     #IF g_inaj.inaj004 = -1 AND l_inaa014 = 'N' THEN   #160429-00012        #171218-00024#2-mark
      IF g_inaj.inaj004 = -1 AND l_inaa014 = 'N' AND NOT g_aic_continue THEN #171218-00024#2-add              #190606-00023#1---mark   #190722-00026#1 remark
     #IF g_inaj.inaj004 = -1 AND l_inaa014 = 'N' AND NOT g_aic_continue  AND NOT g_aic_direct THEN           #190606-00023#1---add     #190722-00026#1 mark      
         #171218-00024#2-s-mark
         ##170619-00049#2-s add
         #IF g_aic_continue THEN
         #   LET l_chkqty = 0
         #   SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
         #                    WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0 
         #                                                     THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
         #                                                     ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
         #                                                 END )
         #                    WHEN a.ooca004 = '3'  THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
         #                    WHEN a.ooca004 = '4'  THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,a.ooca002))/power(10,a.ooca002) 
         #               END)) INTO l_chkqty
         #     FROM inaj_t 
         #       LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = g_inaj.inaj045 
         #    WHERE inajent = g_inaj.inajent
         #      AND inajsite = g_inaj.inajsite
         #      AND inaj005 = g_inaj.inaj005
         #      AND inaj006 = g_inaj.inaj006
         #      AND inaj007 = g_inaj.inaj007
         #      AND inaj008 = g_inaj.inaj008
         #      AND inaj009 = g_inaj.inaj009
         #      AND inaj022 <= g_inaj.inaj022   
         #      AND inaj045 = g_inaj.inaj045
         #ELSE
         ##170619-00049#2-e add  
         #171218-00024#2-e-mark         
            #170221-00057#1---add---s
            LET l_chkqty = 0
         #190722-00026#1 add --(S)-- 
         #若為多角正拋則檢核最終站庫存量,因此據點(site),庫位(inaj008),儲位(inaj009)都是最終站的資料
         IF g_aic_direct AND l_direct_chk THEN
            SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                             #PGS(D)-10167 -S-
                             #WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0
                             WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD( ROUND( COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),CAST((2 / POWER(10,a.ooca002))AS numeric))=0
                             #PGS(D)-10167 -E-                             
                                                              THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
                                                              ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
                                                          END )
                             WHEN a.ooca004 = '3'  THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                             WHEN a.ooca004 = '4'  THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,a.ooca002))/power(10,a.ooca002) 
                        END)) INTO l_chkqty
              FROM inaj_t 
                LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = g_inaj.inaj045 
             WHERE inajent = g_inaj.inajent
               AND inajsite = l_site_aic
               AND inaj005 = g_inaj.inaj005
               AND inaj006 = g_inaj.inaj006
               AND inaj007 = g_inaj.inaj007
               AND inaj008 = l_inaj008_aic
               AND inaj009 = l_inaj009_aic
               AND inaj010 = g_inaj.inaj010
               AND inaj022 <= g_inaj.inaj022   
               AND inaj045 = g_inaj.inaj045      
         ELSE           
         #190722-00026#1 add --(E)--
            SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                             #PGS(D)-10167 -S-
                             #WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0
                             WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD( ROUND( COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),CAST((2 / POWER(10,a.ooca002))AS numeric))=0
                             #PGS(D)-10167 -E-                             
                                                              THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
                                                              ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
                                                          END )
                             WHEN a.ooca004 = '3'  THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
                             WHEN a.ooca004 = '4'  THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,a.ooca002))/power(10,a.ooca002) 
                        END)) INTO l_chkqty
              FROM inaj_t 
                LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = g_inaj.inaj045 
             WHERE inajent = g_inaj.inajent
               AND inajsite = g_inaj.inajsite
               AND inaj005 = g_inaj.inaj005
               AND inaj006 = g_inaj.inaj006
               AND inaj007 = g_inaj.inaj007
               AND inaj008 = g_inaj.inaj008
               AND inaj009 = g_inaj.inaj009
               AND inaj010 = g_inaj.inaj010
               AND inaj022 <= g_inaj.inaj022   
               AND inaj045 = g_inaj.inaj045 
         END IF #170619-00049#2 add #171218-00024#2-mark   #190722-00026#1 remark               
         IF cl_null(l_chkqty) THEN LET l_chkqty = 0 END IF
         CALL s_aooi250_take_decimals(g_inaj.inaj045,(g_inaj.inaj011*g_inaj.inaj046/g_inaj.inaj047)) RETURNING l_success,l_qty3
      #   IF l_chkqty < l_qty3 THEN  #191112-00047#1 mark
          IF l_chkqty < l_qty3 AND l_qty3 > 0 THEN  #191112-00047#1 add
            INITIALIZE g_errparam TO NULL
            #LET g_errparam.code = "ain-00245"      #200831-00076#1 mark
            LET g_errparam.code = "ain-00270"       #200831-00076#1 add
           #LET g_errparam.extend = g_inaj.inaj005  #180419-00065#1 mark
            LET g_errparam.extend = l_extend        #180419-00065#1
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF      
         #170221-00057#1---add---e
#161202-00031#1---mod---s            
#         #CALL s_date_get_last_date(g_inaj.inaj022) RETURNING l_chkdate   #161116-00015#1 mark
#         LET l_chkqty = 0
#         #SELECT SUM(inaj004*inaj011*inaj013) INTO l_chkqty          #161116-00015#1 mark
#         #161130-00028#1 mod-S
##         SELECT SUM(inaj004*inaj011*inaj046/inaj047) INTO l_chkqty   #161116-00015#1 
#         SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
#                          WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002),(2/power(10,a.ooca002)))=0 
#                                                           THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002) 
#                                                           ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)-(inaj004*1/power(10,a.ooca002))
#                                                      END )
#                          WHEN a.ooca004 = '3'  THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),a.ooca002)
#                          WHEN a.ooca004 = '4'  THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,a.ooca002))/power(10,a.ooca002) 
#                     END)) INTO l_chkqty
#         #161130-00028#1 mod-E
#           FROM inaj_t 
#             #161130-00028#1 add-S
#             LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = g_inaj.inaj045 
#             #161130-00028#1 add-E
#          WHERE inajent = g_inaj.inajent
#            AND inajsite = g_inaj.inajsite
#            AND inaj005 = g_inaj.inaj005
#            AND inaj006 = g_inaj.inaj006
#            AND inaj007 = g_inaj.inaj007
#            AND inaj008 = g_inaj.inaj008
#            AND inaj009 = g_inaj.inaj009
#            AND inaj010 = g_inaj.inaj010
#            #AND inaj022 <= l_chkdate       #161116-00015#1 mark
#            AND inaj022 <= g_inaj.inaj022   #161116-00015#1 
#            AND inaj045 = g_inaj.inaj045    #161130-00028#1 add
#         IF cl_null(l_chkqty) THEN LET l_chkqty = 0 END IF
#         #IF l_chkqty < (g_inaj.inaj011*g_inaj.inaj013) THEN               #161116-00015#1  mark
##         IF l_chkqty < (g_inaj.inaj011*g_inaj.inaj046/g_inaj.inaj047) THEN #161116-00015#1 
#         CALL s_aooi250_take_decimals(g_inaj.inaj045,(g_inaj.inaj011*g_inaj.inaj046/g_inaj.inaj047)) RETURNING l_success,l_qty3
#         IF l_chkqty < l_qty3 THEN #161130-00028#1 mod
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = "ain-00245"
#            LET g_errparam.extend = g_inaj.inaj005
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            LET r_success = FALSE
#            RETURN r_success
#         END IF 
         
         IF NOT cl_null(g_inaj.inaj045) AND NOT cl_null(g_inaj.inaj011) AND NOT cl_null(g_inaj.inaj046) AND NOT cl_null(g_inaj.inaj047) THEN  
            CALL s_aooi250_take_decimals(g_inaj.inaj045,(g_inaj.inaj011*g_inaj.inaj046/g_inaj.inaj047)) RETURNING l_success,l_qty3      
         END IF
         LET l_edate = s_date_get_last_date(g_inaj.inaj022)     
         #161212-00017#1---mod---s      
         #LET l_sql = " SELECT COUNT(1) FROM (", 
         #            " SELECT DISTINCT a.inaj022,",
         #            "        NVL((SELECT SUM((CASE WHEN d.ooca004 = '1' THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002)",
         #            "                              WHEN d.ooca004 = '2' THEN (CASE WHEN MOD(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002),(2/power(10,d.ooca002)))=0", 
         #            "                                                               THEN round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002) ",
         #            "                                                               ELSE round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002)-(inaj004*1/power(10,d.ooca002))",
         #            "                                                          END )",
         #            "                              WHEN d.ooca004 = '3' THEN trunc(COALESCE(inaj004*inaj011*inaj046/inaj047,0),d.ooca002)",
         #            "                              WHEN d.ooca004 = '4' THEN ceil(COALESCE(inaj004*inaj011*inaj046/inaj047,0)*power(10,d.ooca002))/power(10,d.ooca002) ",
         #            "                          END)) ",
#        IF cl_null(g_pre_trigger2) THEN  #190807-00028#1 add  #191106-00013#1 mark
            LET l_sql = " SELECT COUNT(1) FROM (", 
                        " SELECT DISTINCT a.inaj022,",
                        #"        NVL((SELECT SUM((CASE WHEN d.ooca004 = '1' THEN round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002)", #PGS(D)-13130 meno mark
                        "        coalesce((SELECT SUM((CASE WHEN d.ooca004 = '1' THEN ROUND( ROUND( COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002)",#PGS(D)-13130 meno add
                        #PGS(D)-10167 -S-
                        #"                              WHEN d.ooca004 = '2' THEN (CASE WHEN MOD(round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002),(2/power(10,d.ooca002)))=0",
                        "                              WHEN d.ooca004 = '2' THEN (CASE WHEN MOD( ROUND(round( COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002),CAST((2 / POWER(10,d.ooca002))AS numeric))=0",
                        #PGS(D)-10167 -E-                        
                        "                                                               THEN round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002) ",
                        "                                                               ELSE round(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002)-(inaj004*1/power(10,d.ooca002))",                        "                                                          END )",
                        "                              WHEN d.ooca004 = '3' THEN trunc(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6),d.ooca002)",
                        "                              WHEN d.ooca004 = '4' THEN ceil(round(COALESCE(inaj004*inaj011*inaj046/inaj047,0),6)*power(10,d.ooca002))/power(10,d.ooca002) ",
                       #"                          END)) ",   #170619-00049#2 mark
                        "                          END)) "    #170619-00049#2 add                  
            #171218-00024#2-s-mark
            ##170619-00049#2-s add  
            #IF g_aic_continue THEN
            #   LET l_sql = l_sql,"               FROM inaj_t b",   
            #                     "               LEFT OUTER JOIN ooca_t d ON d.oocaent = inajent AND d.ooca001 = '",g_inaj.inaj045,"'",                 
            #                     "              WHERE a.inaj005 = b.inaj005 ",
            #                     "                AND a.inajent = b.inajent ",     
            #                     "                AND a.inajsite = b.inajsite ",   
            #                     "                AND a.inaj006 = b.inaj006 ",
            #                     "                AND a.inaj007 = b.inaj007 ",
            #                     "                AND a.inaj008 = b.inaj008 ",
            #                     "                AND a.inaj009 = b.inaj009 ",
            #                     "                AND a.inaj045 = b.inaj045 ",
            #                     "                AND b.inaj022 <= a.inaj022),0) aa",
            #                     "   FROM inaj_t a",
            #                     "   WHERE a.inajent = ",g_enterprise,"",
            #                     "     AND a.inajsite = '",g_inaj.inajsite,"'",
            #                     "     AND a.inaj005 = '",g_inaj.inaj005,"'",
            #                     "     AND a.inaj006 = '",g_inaj.inaj006,"'",
            #                     "     AND a.inaj007 = '",g_inaj.inaj007,"'",
            #                     "     AND a.inaj008 = '",g_inaj.inaj008,"'",
            #                     "     AND a.inaj009 = '",g_inaj.inaj009,"'",                         
            #                     "     AND inaj045 = '",g_inaj.inaj045,"'",
            #                     "     AND a.inaj022 BETWEEN '",g_inaj.inaj022,"' AND '",l_edate,"' ",  
            #                     " )",
            #                     " WHERE aa < ",l_qty3
            #ELSE
            #171218-00024#2-e-mark
            #190722-00026#1 add --(S)-- 
            #若為多角正拋則檢核最終站庫存量,因此據點(site),庫位(inaj008),儲位(inaj009)都是最終站的資料
            IF g_aic_direct AND l_direct_chk THEN
               LET l_sql = l_sql,"               FROM inaj_t b",
                                 "               LEFT OUTER JOIN ooca_t d ON d.oocaent = inajent AND d.ooca001 = '",g_inaj.inaj045,"'",  #190807-00028#1 mark  #191106-00013#1 mark還原
                                #"               LEFT OUTER JOIN ooca_t d ON d.oocaent = inajent AND d.ooca001 = ? ",                     #190807-00028#1 add  #191106-00013#1 mark
                                 "              WHERE a.inaj005 = b.inaj005 ",
                                 "                AND a.inajent = b.inajent ",      
                                 "                AND a.inajsite = b.inajsite ",     
                                 "                AND a.inaj006 = b.inaj006 ",
                                 "                AND a.inaj007 = b.inaj007 ",
                                 "                AND a.inaj008 = b.inaj008 ",
                                 "                AND a.inaj009 = b.inaj009 ",
                                 "                AND a.inaj010 = b.inaj010 ",
                                 "                AND a.inaj045 = b.inaj045 ",
                                 "                AND b.inaj022 <= a.inaj022),0) aa",
                                 "   FROM inaj_t a",
                                 "   WHERE a.inajent = ",g_enterprise,"",
                                 #190807-00028#1 -S mark
#191106-00013#1 -s mark還原
                                 "     AND a.inajsite = '",l_site_aic,"'",
                                 "     AND a.inaj005 = '",g_inaj.inaj005,"'",
                                 "     AND a.inaj006 = '",g_inaj.inaj006,"'",
                                 "     AND a.inaj007 = '",g_inaj.inaj007,"'",
                                 "     AND a.inaj008 = '",l_inaj008_aic,"'",
                                 "     AND a.inaj009 = '",l_inaj009_aic,"'",
                                 "     AND a.inaj010 = '",g_inaj.inaj010,"'",                           
                                 "     AND inaj045 = '",g_inaj.inaj045,"'",
                                 #"     AND a.inaj022 BETWEEN '",g_inaj.inaj022,"' AND '",l_edate,"' ",#PGS(D)-12133 memo mark
                                 "     AND a.inaj022 BETWEEN ? AND ? ",  #PGS(D)-12133 memo add
                                 #" )",        #PGS(D)-13130 meno mark
                                 " ) t51 ",    #PGS(D)-13130 meno add
                                 " WHERE aa < ",l_qty3
#191106-00013#1 -e mark還原
                                 #190807-00028#1 -E mark
#191106-00013#1 -s mark
#                                #190807-00028#1 -S add
#                                "     AND a.inajsite = ? ",
#                                "     AND a.inaj005 = ? ",
#                                "     AND a.inaj006 = ? ",
#                                "     AND a.inaj007 = ? ",
#                                "     AND a.inaj008 = ? ",
#                                "     AND a.inaj009 = ? ",
#                                "     AND a.inaj010 = ? ",
#                                "     AND a.inaj045 = ? ",
#                                "     AND a.inaj022 BETWEEN ? AND ? ",
#                                " )",
#                                " WHERE aa < ? "
#                                #190807-00028#1 -E add
#191106-00013#1 -e mark
            ELSE
            #190722-00026#1 add --(E)--    
               LET l_sql = l_sql,"               FROM inaj_t b",
            #170619-00049#2-e add                  
                                #"               FROM inaj_t b",   #170619-00049#2 add
                                 "               LEFT OUTER JOIN ooca_t d ON d.oocaent = inajent AND d.ooca001 = '",g_inaj.inaj045,"'",  #190807-00028#1 mark  #191106-00013#1 mark還原
                                #"               LEFT OUTER JOIN ooca_t d ON d.oocaent = inajent AND d.ooca001 = ? ",                     #190807-00028#1 add  #191106-00013#1 mark
                                 "              WHERE a.inaj005 = b.inaj005 ",
                                 "                AND a.inajent = b.inajent ",     #170511-00027#1 add 
                                 "                AND a.inajsite = b.inajsite ",   #170511-00027#1 add  
                                 "                AND a.inaj006 = b.inaj006 ",
                                 "                AND a.inaj007 = b.inaj007 ",
                                 "                AND a.inaj008 = b.inaj008 ",
                                 "                AND a.inaj009 = b.inaj009 ",
                                 "                AND a.inaj010 = b.inaj010 ",
                                 "                AND a.inaj045 = b.inaj045 ",
                                 "                AND b.inaj022 <= a.inaj022),0) aa",
                                 "   FROM inaj_t a",
                                 "   WHERE a.inajent = ",g_enterprise,"",
                                 #190807-00028#1 -S mark
#191106-00013#1 -s mark還原
                                 "     AND a.inajsite = '",g_inaj.inajsite,"'",
                                 "     AND a.inaj005 = '",g_inaj.inaj005,"'",
                                 "     AND a.inaj006 = '",g_inaj.inaj006,"'",
                                 "     AND a.inaj007 = '",g_inaj.inaj007,"'",
                                 "     AND a.inaj008 = '",g_inaj.inaj008,"'",
                                 "     AND a.inaj009 = '",g_inaj.inaj009,"'",
                                 "     AND a.inaj010 = '",g_inaj.inaj010,"'",                           
                                 "     AND inaj045 = '",g_inaj.inaj045,"'",
                                 #"     AND a.inaj022 BETWEEN '",g_inaj.inaj022,"' AND '",l_edate,"' ",#PGS(D)-12133 memo mark
                                 "     AND a.inaj022 BETWEEN ? AND ? ",  #PGS(D)-12133 memo add  
                                 #" )",      #PGS(D)-13130 meno mark
                                 " ) t51 ",  #PGS(D)-13130 meno add                                 
                                 " WHERE aa < ",l_qty3
#191106-00013#1 -e mark還原
                                 #190807-00028#1 -E mark
#191106-00013#1 -s mark
#                                #190807-00028#1 -S add
#                                "     AND a.inajsite = ? ",
#                                "     AND a.inaj005 = ? ",
#                                "     AND a.inaj006 = ? ",
#                                "     AND a.inaj007 = ? ",
#                                "     AND a.inaj008 = ? ",
#                                "     AND a.inaj009 = ? ",
#                                "     AND a.inaj010 = ? ",
#                                "     AND a.inaj045 = ? ",
#                                "     AND a.inaj022 BETWEEN ? AND ? ",
#                                " )",
#                                " WHERE aa < ? "
#                                #190807-00028#1 -E add
#191106-00013#1 -e mark
            END IF        #170619-00049#2 add #171218-00024#2-mark   #190722-00026#1 remark                       
#        END IF  #190807-00028#1 add   #191106-00013#1 mark
         #161212-00017#1---mod---e                           
         LET l_cnt = 0
#        IF cl_null(g_pre_trigger2) THEN  #190807-00028#1 add  #191106-00013#1 mark
            PREPARE inaj011_chk_p FROM l_sql
#191106-00013#1 -s mark
#        #190807-00028#1 -S add
#           LET g_pre_trigger2 = 'Y'
#        END IF
#        #190807-00028#1 -E add
#191106-00013#1 -e mark
         #EXECUTE inaj011_chk_p INTO l_cnt   #PGS(D)-12133 memo mark
         EXECUTE inaj011_chk_p USING g_inaj.inaj022,l_edate INTO l_cnt   #PGS(D)-12133 memo add
#191106-00013#1 -s mark
#        #190807-00028#1 -S add
#        USING g_inaj.inaj045,g_inaj.inajsite,g_inaj.inaj005,g_inaj.inaj006,g_inaj.inaj007,g_inaj.inaj008,
#              g_inaj.inaj009,g_inaj.inaj010,g_inaj.inaj045,g_inaj.inaj022,l_edate,l_qty3
#        #190807-00028#1 -E add
#191106-00013#1 -e mark
    #     IF l_cnt > 0 THEN  #191112-00047#1 mark 
         IF l_cnt > 0 AND l_qty3 > 0 THEN #191112-00047#1add
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "ain-00245"
           #LET g_errparam.extend = g_inaj.inaj005  #180419-00065#1 mark
            LET g_errparam.extend = l_extend        #180419-00065#1
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF       
#161202-00031#1---mod---e            
      END IF
   #END IF #160812-00010#1  #161116-00015#1 mark 
  #-160422-00006-end-
  
   #計算交易單位與基礎單位的換算率
   LET l_imaa006 = ''
   SELECT imaa006 INTO l_imaa006
     FROM imaa_t
    WHERE imaaent = g_inaj.inajent
      AND imaa001 = g_inaj.inaj005
   IF cl_null(l_imaa006) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "aim-00194"
     #LET g_errparam.extend = g_inaj.inaj005  #180419-00065#1 mark
      LET g_errparam.extend = l_extend        #180419-00065#1
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   CALL s_aimi190_get_convert(g_inaj.inaj005,g_inaj.inaj012,l_imaa006)
        RETURNING l_success,l_rate
   IF l_success THEN
      LET g_inaj.inaj014 = l_rate
   ELSE
      LET r_success = FALSE
      RETURN r_success
   END IF

#150323---earl---add--s
   CALL s_aimi190_get_convert1(g_inaj.inaj005,g_inaj.inaj012,l_imaa006) RETURNING r_success,l_qty1,l_qty2
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   LET g_inaj.inaj048 = l_qty2   #交易單位與料件基本單位換算分子
   LET g_inaj.inaj049 = l_qty1   #交易單位與料件基本單位換算分母
#150323---earl---add--e

   #計算交易單位與成本單位的換算率，和抓取成本料號
   LET l_imag014 = ''
   #151214-00014#1 20151216 s983961--MOD(S)   
   #SELECT imag013,imag014
   #  INTO g_inaj.inaj028,l_imag014
   #  FROM imag_t
   # WHERE imagent = g_inaj.inajent
   #   AND imagsite = g_inaj.inajsite
   #   AND imag001 = g_inaj.inaj005
   CASE p_imafsite
      WHEN 'ALL'
#160812-00010#1-s   mark   
#         SELECT imag013,imag014
#           INTO g_inaj.inaj028,l_imag014
#160812-00010#1-e   mark
#160812-00010#1-s
         SELECT imag014
           INTO l_imag014
#160812-00010#1-s
           FROM imag_t
          WHERE imagent = g_inaj.inajent
            AND imagsite = p_imafsite
            AND imag001 = g_inaj.inaj005
      OTHERWISE
         SELECT imag014
           INTO l_imag014
           FROM imag_t
          WHERE imagent = g_inaj.inajent
            AND imagsite = g_inaj.inajsite
            AND imag001 = g_inaj.inaj005
   END CASE
   LET g_inaj.inaj028 = g_inaj.inaj005  #160812-00010#1 
   #151214-00014#1 20151216 s983961--MOD(E)
   IF cl_null(l_imag014) THEN
      LET g_inaj.inaj029 = 1
   ELSE     
      CALL s_aimi190_get_convert(g_inaj.inaj005,g_inaj.inaj012,l_imag014)
           RETURNING l_success,l_rate
      IF l_success THEN
         LET g_inaj.inaj029 = l_rate
      ELSE
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF   

#150323---earl---add--s
   IF cl_null(l_imag014) THEN
      LET g_inaj.inaj050 = 1   #交易單位與成本單位換算分子
      LET g_inaj.inaj051 = 1   #交易單位與成本單位換算分母
   ELSE
      CALL s_aimi190_get_convert1(g_inaj.inaj005,g_inaj.inaj012,l_imag014) RETURNING r_success,l_qty1,l_qty2
      IF NOT r_success THEN
         RETURN r_success
      END IF
      
      LET g_inaj.inaj050 = l_qty2   #交易單位與成本單位換算分子
      LET g_inaj.inaj051 = l_qty1   #交易單位與成本單位換算分母
   END IF
#150323---earl---add--e

   LET g_inaj.inaj023 = cl_get_today()
   LET g_inaj.inaj024 = cl_get_time()
   LET g_inaj.inaj025 = g_user
   #LET g_inaj.inaj035 = g_prog #190812-00011#1 mark
  
   #抓取單據性質
   CALL s_aooi200_get_slip(g_inaj.inaj001) RETURNING l_success,l_slip
   SELECT oobx003,oobx004 INTO g_inaj.inaj015,g_inaj.inaj035   #190812-00011#1 add oobx004
     FROM oobx_t
    WHERE oobx001 = l_slip
      AND oobxent = g_enterprise
   #190812-00011#1 add(s)   
   IF cl_null(g_inaj.inaj035) OR g_inaj.inaj035 = 'MULTI' THEN
      LET g_inaj.inaj035 = g_prog
   END IF
   #190812-00011#1 add(e)

#160812-00014#1-s
#   #modify--2015/01/29 By Shiun--(S)
#   INITIALIZE l_inaj015,l_prog_sign,l_inaj044_sql TO NULL
#   CASE g_inaj.inaj015
#      WHEN 'asft340'
#         LET l_inaj015 = 'sfec001'
#      WHEN 'asrt340'
#         LET l_inaj015 = 'sfec018'
#      WHEN 'apmt520'
#         LET l_inaj015 = 'pmdt001'
#      WHEN 'apmt570'
#         LET l_inaj015 = 'pmdt001'
#      WHEN 'apmt580'
#         LET l_inaj015 = 'pmdt001'
#      WHEN 'aint330'
#         LET l_inaj015 = 'indd101'
#      WHEN 'apmt862'
#            LET l_inaj015 = 'pmdt001'
#      WHEN 'apmt863'
#            LET l_inaj015 = 'pmdt001'
#      WHEN 'apmt864'                        #add by yangxf
#            LET l_inaj015 = 'pmdt001'       #add by yangxf
#      WHEN 'apmt880'
#            LET l_inaj015 = 'pmdt001'
#      WHEN 'apmt890'
#            LET l_inaj015 = 'pmdt001'
#      WHEN 'aint510'
#            LET l_inaj015 = 'indd101'
#      WHEN 'aint520'
#            LET l_inaj015 = 'indf101'
#   END CASE
#
#   IF cl_null(l_inaj015) THEN
#      LET l_prog_sign = g_inaj.inaj015
#      LET l_prog_sign = l_prog_sign.substring(1,6)
#      CASE l_prog_sign
#         WHEN 'aint30'
#            LET l_inaj015 = 'inbb017'
#         WHEN 'asft31'
#            LET l_inaj015 = 'sfdc001'
#         WHEN 'asft32'
#            LET l_inaj015 = 'sfdc001'
#         WHEN 'asrt31'
#            LET l_inaj015 = 'sfdc004'
#         WHEN 'asrt32'
#            LET l_inaj015 = 'sfdc004'
#         WHEN 'adbt54'
#            LET l_inaj015 = 'xmdl003'
#         WHEN 'adbt58'
#            LET l_inaj015 = 'xmdl003'
#         WHEN 'adbt59'
#            LET l_inaj015 = 'xmdl003'
#         
#         OTHERWISE
#            LET l_prog_sign = g_inaj.inaj015
#            LET l_prog_sign = l_prog_sign.substring(1,5)
#            CASE l_prog_sign
#               WHEN 'axmt5'
#               LET l_inaj015 = 'xmdl003'
#               WHEN 'axmt6'
#               LET l_inaj015 = 'xmdl003'
#               WHEN 'adbt6'
#                  LET l_inaj015 = 'xmdl003'
#            END CASE
#      END CASE
#   END IF
#   
#   CASE l_inaj015
#      WHEN 'inbb017'
#         LET l_inaj044_sql = " SELECT inbb017 ",
#                             "   FROM inbb_t ",
#                             "  WHERE inbbent = '",g_enterprise,"'",
#                             "    AND inbbdocno ='",g_inaj.inaj001,"'",
#                             "    AND inbbseq = '",g_inaj.inaj002,"'"
#      
#      WHEN 'indd101'
#         LET l_inaj044_sql = " SELECT indd101 ",
#                             "   FROM indd_t ",
#                             "  WHERE inddent = '",g_enterprise,"'",
#                             "    AND indddocno ='",g_inaj.inaj001,"'",
#                             "    AND inddseq = '",g_inaj.inaj002,"'"
#      WHEN 'indf101'
#         LET l_inaj044_sql = " SELECT indf101 ",
#                             "   FROM indf_t ",
#                             "  WHERE indfent = '",g_enterprise,"'",
#                             "    AND indfdocno ='",g_inaj.inaj001,"'",
#                             "    AND indfseq = '",g_inaj.inaj002,"'"
#      WHEN 'pmdt001'
#         LET l_inaj044_sql = " SELECT pmdt001 ",
#                             "   FROM pmdt_t ",
#                             "  WHERE pmdtent = '",g_enterprise,"'",
#                             "    AND pmdtdocno ='",g_inaj.inaj001,"'",
#                             "    AND pmdtseq = '",g_inaj.inaj002,"'"
#      WHEN 'sfdc001'
#         LET l_inaj044_sql = " SELECT sfdc001 ",
#                             "   FROM sfdc_t ",
#                             "  WHERE sfdcent = '",g_enterprise,"'",
#                             "    AND sfdcdocno ='",g_inaj.inaj001,"'",
#                             "    AND sfdcseq = '",g_inaj.inaj002,"'"
#      WHEN 'sfdc004'
#         LET l_inaj044_sql = " SELECT sfdc004 ",
#                             "   FROM sfdc_t ",
#                             "  WHERE sfdcent = '",g_enterprise,"'",
#                             "    AND sfdcdocno ='",g_inaj.inaj001,"'",
#                             "    AND sfdcseq = '",g_inaj.inaj002,"'",
#                             "    AND sfecseq1 = '",g_inaj.inaj003,"'"
#      WHEN 'sfec001'
#         LET l_inaj044_sql = " SELECT sfec001 ",
#                             "   FROM sfec_t ",
#                             "  WHERE sfecent = '",g_enterprise,"'",
#                             "    AND sfecdocno ='",g_inaj.inaj001,"'",
#                             "    AND sfecseq = '",g_inaj.inaj002,"'",
#                             "    AND sfecseq1 = '",g_inaj.inaj003,"'"
#      WHEN 'sfec018'
#         LET l_inaj044_sql = " SELECT sfec018 ",
#                             "   FROM sfec_t ",
#                             "  WHERE sfecent = '",g_enterprise,"'",
#                             "    AND sfecdocno ='",g_inaj.inaj001,"'",
#                             "    AND sfecseq = '",g_inaj.inaj002,"'"
#      WHEN 'xmdl003'
#         LET l_inaj044_sql = " SELECT xmdl003 ",
#                             "   FROM xmdl_t ",
#                             "  WHERE xmdlent = '",g_enterprise,"'",
#                             "    AND xmdldocno ='",g_inaj.inaj001,"'",
#                             "    AND xmdlseq = '",g_inaj.inaj002,"'"
#   END CASE
#   PREPARE get_inaj044_pre FROM l_inaj044_sql
#   EXECUTE get_inaj044_pre INTO g_inaj.inaj044
#   #modify--2015/01/29 By Shiun--(E)
#160812-00014#1-e

   #抓取庫存異動類型
   IF cl_null(g_inaj.inaj036) THEN
      SELECT gzcb015 INTO g_inaj.inaj036
        FROM gzcb_t
       WHERE gzcb001 = 24
         AND gzcb002 = g_inaj.inaj015  
   END IF
  
   #内部交易对象法人
   IF cl_null(g_inaj.inaj209) THEN
      SELECT ooef017 INTO g_inaj.inaj209
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_inaj.inajsite
   END IF
     
   #判断料号是否做制造批序号管理
   #IF NOT cl_null(g_inaj.inaj017) THEN   #170622-00011#1 mark
   IF NOT cl_null(g_inaj.inaj017) AND cl_null(g_inaj.inaj037) THEN   #170622-00011#1 add
      SELECT ooeg004 INTO g_inaj.inaj037
        FROM ooeg_t
       WHERE ooegent = g_inaj.inajent
         AND ooeg001 = g_inaj.inaj017
   END IF 
  
#---140904 by pengu add
   IF cl_null(g_inaj.inaj203) THEN
      SELECT ooef016 INTO g_inaj.inaj203
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_inaj.inajsite
   END IF
#---140904 by pengu end

#-----170919 04441 add start
#判斷若異動的庫位為VMI存貨庫位且不是採購入庫/倉退時則自動將本次異動的庫位換成對應的VMI結算庫位
   LET l_inaa018 = ''
   SELECT inaa018 INTO l_inaa018
     FROM inaa_t
    WHERE inaaent = g_enterprise
      AND inaasite = g_inaj.inajsite
      AND inaa001 = g_inaj.inaj008
   #161007-00012#2-s-add
   #171108-00043#1 mark-S
#   IF (g_inaj.inaj015 = 'aint330' AND g_inaj.inaj004 = '1') OR (g_inaj.inaj015 = 'aint340' AND g_inaj.inaj004 = '1') 
#      OR (g_inaj.inaj015 = 'aint350' AND g_inaj.inaj004 = '1')  OR (g_inaj.inaj015 = 'aint302') THEN
#      LET l_chk = FALSE
#      LET g_inaj.inaj033 = ''
#      LET g_inaj.inaj034 = ''
      #171108-00043#1 mark-E
      #171108-00043#1 add-S 如果是调拨拨入单，则判断来源目的是否都为VMI仓，如果皆为VMI仓，则不需拨入至结算仓，否则拨入结算仓，同时产生杂收单
   IF (g_inaj.inaj015 = 'aint330') OR (g_inaj.inaj015 = 'aint340')
      OR (g_inaj.inaj015 = 'aint170') #190103-00023#1 add    
      OR (g_inaj.inaj015 = 'aint350')  OR (g_inaj.inaj015 = 'aint302') THEN
      IF g_inaj.inaj004 = '1' THEN
         LET l_stock_out = NULL
         LET l_stock_in = g_inaj.inaj008
         LET l_site = NULL
         CASE g_inaj.inaj015
            WHEN 'aint302'
               #171114-00014#1 mark-S
#               LET l_chk = FALSE
#               LET g_inaj.inaj033 = '' 
#               LET g_inaj.inaj034 = ''
               #171114-00014#1 mark-E  
               #171114-00014#1 add-S
               IF s_aint320_vmi_type(g_inaj.inajsite,l_stock_in) = '1' THEN   #VMI存货仓
                  LET l_chk = TRUE
               ELSE
                  LET l_chk = FALSE
                  LET g_inaj.inaj033 = ''
                  LET g_inaj.inaj034 = ''
               END IF
               #171114-00014#1 add-E        
            OTHERWISE
               SELECT indc005,indd022 INTO l_site,l_stock_out FROM indc_t,indd_t
                WHERE indcent = g_enterprise AND indcdocno = g_inaj.inaj001
                  AND inddent = indcent
                  AND indddocno = indcdocno
                  AND inddseq = g_inaj.inaj002
               IF s_aint320_vmi_type(l_site,l_stock_out) <> s_aint320_vmi_type(g_inaj.inajsite,l_stock_in) THEN
                  LET l_chk = TRUE
               ELSE 
                  LET l_chk = FALSE
                  LET g_inaj.inaj033 = ''
                  LET g_inaj.inaj034 = ''
               END IF            
         END CASE
      ELSE
         LET l_stock_out = g_inaj.inaj008
         LET l_stock_in = NULL
         LET l_site = NULL
         CASE g_inaj.inaj015
            WHEN 'aint302'
               #171114-00014#1 mark-S
#               LET l_chk = FALSE
#               LET g_inaj.inaj033 = '' 
#               LET g_inaj.inaj034 = ''
               #171114-00014#1 mark-E  
               #171114-00014#1 add-S
               IF s_aint320_vmi_type(g_inaj.inajsite,l_stock_out) = '1' THEN   #VMI存货仓
                  LET l_chk = TRUE
               ELSE
                  LET l_chk = FALSE
                  LET g_inaj.inaj033 = ''
                  LET g_inaj.inaj034 = ''
               END IF
               #171114-00014#1 add-E          
            OTHERWISE
               SELECT indc006,indd032 INTO l_site,l_stock_in FROM indc_t,indd_t
                WHERE indcent = g_enterprise AND indcdocno = g_inaj.inaj001
                  AND inddent = indcent
                  AND indddocno = indcdocno
                  AND inddseq = g_inaj.inaj002
               IF s_aint320_vmi_type(g_inaj.inajsite,l_stock_out) <> s_aint320_vmi_type(l_site,l_stock_in) THEN
                  LET l_chk = TRUE
               ELSE 
                  LET l_chk = FALSE
                  LET g_inaj.inaj033 = ''
                  LET g_inaj.inaj034 = ''
               END IF            
         END CASE
      END IF
      #171108-00043#1 add-E
   ELSE
      LET l_chk = TRUE
   END IF
   #161007-00012#2-e-add      
   #IF NOT cl_null(l_inaa018) AND ( g_inaj.inaj015 <> 'apmt570' AND g_inaj.inaj015 <> 'apmt580' AND g_inaj.inaj015 <> 'apmt530') THEN  #171005-00008#1 mod 添加g_inaj.inaj015 <> 'apmt530'的条件 #190103-00023#1 mark
   IF NOT cl_null(l_inaa018) AND ( g_inaj.inaj015 <> 'apmt570' AND g_inaj.inaj015 <> 'apmt580' AND g_inaj.inaj015 <> 'apmt530' AND g_inaj.inaj015 <> 'aint170') THEN #190103-00023#1 add 
      LET l_inaj008 = g_inaj.inaj008
      LET l_inaj009 = g_inaj.inaj009
      LET l_inaj030 = g_inaj.inaj030
      #將庫位換成VMI存貨庫位所對應的VMI結算庫位(aini001的設置)
      IF l_chk THEN  #161007-00012#2-add
         LET g_inaj.inaj008 = l_inaa018
         LET g_inaj.inaj009 = ' '     #190924-00001#1---add
      END IF  #161007-00012#2-add   
      #將儲位改成一個空白
      #LET g_inaj.inaj009 = ' '     #190924-00001#1---mark
      #將VMI結算否改成'1:VMI未結算'
      IF l_chk = TRUE THEN #180921-00007#1 add
         LET g_inaj.inaj030 = '1'
      #180921-00007#1 add-S
      ELSE
         LET g_inaj.inaj030 = '0'
      END IF
      #180921-00007#1 add-E
      #add by geza 20160526  #160523-00009#4(S)
      #判断如果inad对应的批号里面如果来源单号为NULL,更新inad_t来源单号=inaj001，来源项次=inaj002，来源项序=inaj003，来源作业=inaj035
      INITIALIZE l_inad006 TO NULL
      SELECT inad006 INTO l_inad006
        FROM inad_t
       WHERE inadent = g_enterprise
         AND inad001 = g_inaj.inaj005
         AND inadsite = g_inaj.inajsite
         AND inad003 = g_inaj.inaj010
      IF l_inad006 IS NULL THEN
         #171113-00003#1--mark---s
         #UPDATE inad_t 
         #   SET inad006 = g_inaj.inaj001,
         #       inad007 = g_inaj.inaj002,
         #       inad008 = g_inaj.inaj003,
         #       inad013 = g_inaj.inaj035
         # WHERE inadent = g_enterprise
         #   AND inad001 = g_inaj.inaj005
         #   AND inadsite = g_inaj.inajsite
         #   AND inad003 = g_inaj.inaj010
         #   AND inad006 IS NULL
         #IF SQLCA.sqlcode  THEN
         #   INITIALIZE g_errparam TO NULL
         #   LET g_errparam.code = SQLCA.sqlcode
         #   LET g_errparam.extend = "upd inad_t"
         #   LET g_errparam.popup = TRUE
         #   CALL cl_err()
         #   LET r_success = FALSE
         #   RETURN r_success
         #END IF  
         #171113-00003#1--mark---e         
      END IF
      #add by geza 20160526  #160523-00009#4(E)
      #161124-00048#15 mod-S
#      INSERT INTO inaj_t VALUES(g_inaj.*)
      ####
      INSERT INTO inaj_t(inajent,inajsite,inaj001,inaj002,inaj003,
                         inaj004,inaj005,inaj006,inaj007,inaj008,
                         inaj009,inaj010,inaj011,inaj012,inaj013,
                         inaj014,inaj015,inaj016,inaj017,inaj018,
                         inaj019,inaj020,inaj021,inaj022,inaj023,
                         inaj024,inaj025,inaj026,inaj027,inaj028,
                         inaj036,inaj029,inaj030,inaj031,inaj032,
                         inaj033,inaj034,inaj035,inaj037,inaj038,
                         inaj039,inaj040,inaj041,inaj042,inaj043,
                         inaj044,inaj200,inaj201,inaj202,inaj203,
                         inaj204,inaj205,inaj206,inaj207,inaj208,
                         inaj209,inaj045,inaj046,inaj047,inaj048,
                         inaj049,inaj050,inaj051,inaj210,inaj211)
                  VALUES(g_inaj.inajent,g_inaj.inajsite,g_inaj.inaj001,g_inaj.inaj002,g_inaj.inaj003,
                         g_inaj.inaj004,g_inaj.inaj005,g_inaj.inaj006,g_inaj.inaj007,g_inaj.inaj008,
                         g_inaj.inaj009,g_inaj.inaj010,g_inaj.inaj011,g_inaj.inaj012,g_inaj.inaj013,
                         g_inaj.inaj014,g_inaj.inaj015,g_inaj.inaj016,g_inaj.inaj017,g_inaj.inaj018,
                         g_inaj.inaj019,g_inaj.inaj020,g_inaj.inaj021,g_inaj.inaj022,g_inaj.inaj023,
                         g_inaj.inaj024,g_inaj.inaj025,g_inaj.inaj026,g_inaj.inaj027,g_inaj.inaj028,
                         g_inaj.inaj036,g_inaj.inaj029,g_inaj.inaj030,g_inaj.inaj031,g_inaj.inaj032,
                         g_inaj.inaj033,g_inaj.inaj034,g_inaj.inaj035,g_inaj.inaj037,g_inaj.inaj038,
                         g_inaj.inaj039,g_inaj.inaj040,g_inaj.inaj041,g_inaj.inaj042,g_inaj.inaj043,
                         g_inaj.inaj044,g_inaj.inaj200,g_inaj.inaj201,g_inaj.inaj202,g_inaj.inaj203,
                         g_inaj.inaj204,g_inaj.inaj205,g_inaj.inaj206,g_inaj.inaj207,g_inaj.inaj208,
                         g_inaj.inaj209,g_inaj.inaj045,g_inaj.inaj046,g_inaj.inaj047,g_inaj.inaj048,
                         g_inaj.inaj049,g_inaj.inaj050,g_inaj.inaj051,g_inaj.inaj210,g_inaj.inaj211)
      #161124-00048#15 mod-E
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins inaj_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      
      #实时成本运算功能,若当前设置非"实时成本模式"时,返回TRUE
      CALL s_cost_realtime_cal()
           RETURNING l_success
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
      
      LET g_inaj.inaj008 = l_inaj008
      LET g_inaj.inaj009 = l_inaj009
      LET g_inaj.inaj030 = l_inaj030
      IF l_chk THEN  #161007-00012#2-add
         IF NOT s_inventory_ins_inba() THEN
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF  #161007-00012#2-add
   ELSE
#-----170919 04441 add end
      #add by geza 20160526  #160523-00009#4(S)
      #判断如果inad对应的批号里面如果来源单号为NULL,更新inad_t来源单号=inaj001，来源项次=inaj002，来源项序=inaj003，来源作业=inaj035
      INITIALIZE l_inad006 TO NULL
      
      SELECT DISTINCT inad006 INTO l_inad006  #PGS(D)-01534 add DISTINCT
        FROM inad_t
       WHERE inadent = g_enterprise
         AND inad001 = g_inaj.inaj005
         AND inadsite = g_inaj.inajsite
         AND inad003 = g_inaj.inaj010
#PGS(D)-01534-S add
#PGS(D)-01534-E add
      IF l_inad006 IS NULL THEN
         #171113-00003#1--mark---s
         #UPDATE inad_t 
         #   SET inad006 = g_inaj.inaj001,
         #       inad007 = g_inaj.inaj002,
         #       inad008 = g_inaj.inaj003,
         #       inad013 = g_inaj.inaj035
         # WHERE inadent = g_enterprise
         #   AND inad001 = g_inaj.inaj005
         #   AND inadsite = g_inaj.inajsite
         #   AND inad003 = g_inaj.inaj010
         #   AND inad006 IS NULL
         #IF SQLCA.sqlcode  THEN
         #   INITIALIZE g_errparam TO NULL
         #   LET g_errparam.code = SQLCA.sqlcode
         #   LET g_errparam.extend = "upd inad_t"
         #   LET g_errparam.popup = TRUE
         #   CALL cl_err()
         #   LET r_success = FALSE
         #   RETURN r_success
         #END IF   
         #171113-00003#1--mark---e
         #171113-00003#1--add---s
         IF NOT s_inventory_ins_inbr(g_inaj.inaj005,g_inaj.inaj006,g_inaj.inaj007,g_inaj.inaj008,g_inaj.inaj009,g_inaj.inaj010,
                                     g_inaj.inaj004,g_inaj.inaj011,g_inaj.inaj022,g_inaj.inaj001,g_inaj.inaj002,g_inaj.inaj003,
                                     g_inaj.inaj012,g_inaj.inajsite,g_inaj.inaj035) THEN
            LET r_success = FALSE
            RETURN r_success
         END IF 
         #171113-00003#1--add---e
      END IF
      #add by geza 20160526  #160523-00009#4(E)
      #161124-00048#15 mod-S
#      INSERT INTO inaj_t VALUES(g_inaj.*)
      ####
      INSERT INTO inaj_t(inajent,inajsite,inaj001,inaj002,inaj003,
                         inaj004,inaj005,inaj006,inaj007,inaj008,
                         inaj009,inaj010,inaj011,inaj012,inaj013,
                         inaj014,inaj015,inaj016,inaj017,inaj018,
                         inaj019,inaj020,inaj021,inaj022,inaj023,
                         inaj024,inaj025,inaj026,inaj027,inaj028,
                         inaj036,inaj029,inaj030,inaj031,inaj032,
                         inaj033,inaj034,inaj035,inaj037,inaj038,
                         inaj039,inaj040,inaj041,inaj042,inaj043,
                         inaj044,inaj200,inaj201,inaj202,inaj203,
                         inaj204,inaj205,inaj206,inaj207,inaj208,
                         inaj209,inaj045,inaj046,inaj047,inaj048,
                         inaj049,inaj050,inaj051,inaj210,inaj211)
                  VALUES(g_inaj.inajent,g_inaj.inajsite,g_inaj.inaj001,g_inaj.inaj002,g_inaj.inaj003,
                         g_inaj.inaj004,g_inaj.inaj005,g_inaj.inaj006,g_inaj.inaj007,g_inaj.inaj008,
                         g_inaj.inaj009,g_inaj.inaj010,g_inaj.inaj011,g_inaj.inaj012,g_inaj.inaj013,
                         g_inaj.inaj014,g_inaj.inaj015,g_inaj.inaj016,g_inaj.inaj017,g_inaj.inaj018,
                         g_inaj.inaj019,g_inaj.inaj020,g_inaj.inaj021,g_inaj.inaj022,g_inaj.inaj023,
                         g_inaj.inaj024,g_inaj.inaj025,g_inaj.inaj026,g_inaj.inaj027,g_inaj.inaj028,
                         g_inaj.inaj036,g_inaj.inaj029,g_inaj.inaj030,g_inaj.inaj031,g_inaj.inaj032,
                         g_inaj.inaj033,g_inaj.inaj034,g_inaj.inaj035,g_inaj.inaj037,g_inaj.inaj038,
                         g_inaj.inaj039,g_inaj.inaj040,g_inaj.inaj041,g_inaj.inaj042,g_inaj.inaj043,
                         g_inaj.inaj044,g_inaj.inaj200,g_inaj.inaj201,g_inaj.inaj202,g_inaj.inaj203,
                         g_inaj.inaj204,g_inaj.inaj205,g_inaj.inaj206,g_inaj.inaj207,g_inaj.inaj208,
                         g_inaj.inaj209,g_inaj.inaj045,g_inaj.inaj046,g_inaj.inaj047,g_inaj.inaj048,
                         g_inaj.inaj049,g_inaj.inaj050,g_inaj.inaj051,g_inaj.inaj210,g_inaj.inaj211)
      #161124-00048#15 mod-E
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins inaj_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF 
      
      #实时成本运算功能,若当前设置非"实时成本模式"时,返回TRUE
      CALL s_cost_realtime_cal()
           RETURNING l_success
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      END IF      
   END IF
  
   #----------14/09/26 By pomelo modify(s)
   #當p_site = 'ALL' 的時候，表示為流通程式，所以在抓取imaf的資料，imafsite = 'ALL'
   LET l_imaf071 = ''
   LET l_imaf081 = ''
   CASE p_imafsite
      WHEN 'ALL'
         SELECT imaf071,imaf081
           INTO l_imaf071,l_imaf081
           FROM imaf_t
          WHERE imafent = g_inaj.inajent
            AND imafsite = p_imafsite
            AND imaf001 = g_inaj.inaj005
      OTHERWISE
         #判断料号是否做制造批序号管理
         SELECT imaf071,imaf081
           INTO l_imaf071,l_imaf081
           FROM imaf_t
          WHERE imafent = g_inaj.inajent
            AND imafsite = g_inaj.inajsite
            AND imaf001 = g_inaj.inaj005
   END CASE
   #----------14/09/26 By pomelo modify(e)
   
   IF g_prog <> 'aint170' THEN  #191113-00052#1 add
   IF l_imaf071 != '2' OR l_imaf081 != '2' THEN
      #160812-00014#1-s
      LET l_cnt = 0
      SELECT COUNT(1) INTO l_cnt
        FROM inao_t
       WHERE inaoent = g_inaj.inajent
         AND inaodocno = g_inaj.inaj001
         AND inaoseq = g_inaj.inaj002
         AND inaoseq1 = g_inaj.inaj003
         AND inao013 = g_inaj.inaj004
      IF l_cnt > 0 THEN
      #160812-00014#1-e
     #161124-00048#15 mod-S
#   LET l_sql = " SELECT * FROM inao_t ",
   #170308-00016#1-s
   #LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,",
   #            "        inaoseq2,inao000,inao001,inao002,inao003,",
   #            "        inao004,inao005,inao006,inao007,inao008,",
   #            "        inao009,inao010,inao011,inao012,inao013,",
   #            "        inao014,inao020,inao021,inao022,inao023,",
   #            "        inao024,inao025 ",
#  IF cl_null(g_pre_trigger3) THEN  #190807-00028#1 add  #191106-00013#1 mark
      LET l_sql = " SELECT inaoent,inaosite,inaodocno,inaoseq,inaoseq1,inaoseq2,inao000, ",
                  "        COALESCE(inao001,' '),COALESCE(inao002,' '),COALESCE(inao003,' '),inao004, ",
                  "        COALESCE(inao005,' '),COALESCE(inao006,' '),COALESCE(inao007,' '),inao008, ",
                  "        inao009,inao010,inao011,inao012,inao013,inao014, ",
                  "        inao020,inao021,inao022,inao023,inao024,inao025 ",
      #170308-00016#1-e
                  "   FROM inao_t ",
      #161124-00048#15 mod-E
                  "  WHERE inaoent   = '",g_inaj.inajent,"' ",  #190807-00028#1 mark  #191106-00013#1 mark還原
                 #    "    AND inaosite  = '",g_inaj.inajsite,"' ",  #mark by lixh 20151210
                  #190807-00028#1 -S mark
#191106-00013#1 -s mark還原
                  "    AND inaodocno = '",g_inaj.inaj001,"' ",
                  "    AND inaoseq   = '",g_inaj.inaj002,"' ",
                  "    AND inaoseq1  = '",g_inaj.inaj003,"' ",
                  "    AND inao013   = '",g_inaj.inaj004,"' ",
#191106-00013#1 -s mark還原
                  #190807-00028#1 -E mark
#191106-00013#1 -s mark
#                 #190807-00028#1 -S add
#                 "  WHERE inaoent   = ? ",
#                 "    AND inaodocno = ? ",
#                 "    AND inaoseq   = ? ",
#                 "    AND inaoseq1  = ? ",
#                 "    AND inao013   = ? ",
#                 #190807-00028#1 -E add
#191106-00013#1 -e mark
                  "    AND inao000 = '2' "
#  END IF  #190807-00028#1 add  #191106-00013#1 mark
#     IF cl_null(g_pre_trigger3) THEN  #190807-00028#1 add  #191106-00013#1 mark
         PREPARE inal_ins_pre FROM l_sql
         DECLARE inal_ins_cs CURSOR FOR inal_ins_pre
#191106-00013#1 -s mark
#     #190807-00028#1 -S add
#        LET g_pre_trigger3 = 'Y'
#     END IF
#     #190807-00028#1 -E add
#191106-00013#1 -e mark
      FOREACH inal_ins_cs INTO l_inao.*  #190807-00028#1 mark   #191106-00013#1 mark還原
#191106-00013#1 -s mark
#     #190807-00028#1 -S add
#     FOREACH inal_ins_cs USING g_inaj.inajent,g_inaj.inaj001,g_inaj.inaj002,g_inaj.inaj003,g_inaj.inaj004
#        INTO l_inao.*
#     #190807-00028#1 -E add
#191106-00013#1 -e mark
         LET l_inal.inalent  = l_inao.inaoent
         LET l_inal.inalsite = l_inao.inaosite
         LET l_inal.inal001  = l_inao.inaodocno
         LET l_inal.inal002  = l_inao.inaoseq
         LET l_inal.inal003  = l_inao.inaoseq1
         LET l_inal.inal004  = l_inao.inaoseq2
         LET l_inal.inal005  = l_inao.inao013
         LET l_inal.inal006  = l_inao.inao001
         LET l_inal.inal007  = l_inao.inao002
         LET l_inal.inal008  = l_inao.inao003
         LET l_inal.inal009  = l_inao.inao005
         LET l_inal.inal010  = l_inao.inao006
         LET l_inal.inal011  = l_inao.inao007
         LET l_inal.inal012  = l_inao.inao008
         LET l_inal.inal013  = l_inao.inao009
         #170609-00006#1----add---begin-----
         SELECT xmdk082 INTO l_xmdk082 FROM xmdk_t
           WHERE xmdkent = g_enterprise
             AND xmdkdocno = l_inao.inaodocno
             AND xmdk000 = '6'
         IF l_xmdk082 = '4' THEN
          LET l_inal.inal014  =  0
         ELSE 
         #170609-00006#1----add---end------
           LET l_inal.inal014  = l_inao.inao012
         END IF #170609-00006#1 add
         
         LET l_inal.inal015  = g_inaj.inaj015
         LET l_inal.inal016  = g_inaj.inaj022
         LET l_inal.inal017  = g_inaj.inaj023
         LET l_inal.inal018  = g_inaj.inaj036     
         #170308-00016#1-s
         LET l_log = NULL
         IF l_inal.inal006 <> g_inaj.inaj005 THEN
            LET l_log = "- inal006: ",l_inal.inal006,"<> inaj005: ",g_inaj.inaj005
         END IF
         IF l_inal.inal007 <> g_inaj.inaj006 THEN
            LET l_log = "- inal007: ",l_inal.inal007,"<> inaj006: ",g_inaj.inaj006
         END IF
         IF l_inal.inal008 <> g_inaj.inaj007 THEN
            LET l_log = "- inal008: ",l_inal.inal008,"<> inaj007: ",g_inaj.inaj007
         END IF
         IF l_inal.inal009 <> g_inaj.inaj008 THEN
            LET l_log = "- inal009: ",l_inal.inal009,"<> inaj008: ",g_inaj.inaj008
         END IF
         IF l_inal.inal010 <> g_inaj.inaj009 THEN
            LET l_log = "- inal010: ",l_inal.inal010,"<> inaj009: ",g_inaj.inaj009
         END IF
         IF l_inal.inal011 <> g_inaj.inaj010 THEN
            LET l_log = "- inal011: ",l_inal.inal011,"<> inaj010: ",g_inaj.inaj010
         END IF
         IF l_log IS NOT NULL THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00776'
            LET g_errparam.replace[1] = g_inaj.inaj001
            LET g_errparam.replace[2] = g_inaj.inaj002
            LET g_errparam.replace[3] = g_inaj.inaj003
            LET g_errparam.extend = l_log
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
         #170308-00016#1-e
         
         #161124-00048#15 mod-S
#         INSERT INTO inal_t VALUES(l_inal.*)
         INSERT INTO inal_t(inalent,inalsite,inal001,inal002,inal003,
                            inal004,inal005,inal006,inal007,inal008,
                            inal009,inal010,inal011,inal012,inal013,
                            inal014,inal015,inal016,inal017,inal018)
                     VALUES(l_inal.*)
         #161124-00048#15 mod-E
         IF SQLCA.sqlcode  THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins inal_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF 
         INITIALIZE l_inal.* TO NULL
      END FOREACH
      END IF  #160812-00014#1
   END IF
   END IF #191113-00052#1 add
   #171219-00022#21 mark(s)
   #171113-00003#1--add---s
   #背景执行ainp001,更新imai_t,inad_t程式段移至這邊處理，抓取indr_t所有資料進行更新
   #INITIALIZE la_param.* TO NULL
   #LET la_param.prog     = 'ainp001'
   #LET la_param.param[1] = ''
   #LET la_param.param[2] = p_imafsite
   #LET la_param.param[3] = g_inaj.inaj001
   #LET la_param.param[4] = g_inaj.inaj002
   #LET la_param.param[5] = g_inaj.inaj003
   #LET la_param.background = 'Y'
   #LET ls_js = util.JSON.stringify(la_param)
   #CALL cl_cmdrun(ls_js)
   #171113-00003#1--add---e
   #171219-00022#21 mark(e)
  
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: 庫存單據過帳還原時刪除對應的庫存交易異動明細
# Memo...........:
# Usage..........: CALL s_inventory_del_inaj(p_docno,p_site)
#                  RETURNING r_success
# Input parameter: p_docno     單據編號
#                : p_site      營運據點
# Return code....: r_success   處理狀態
# Date & Author..: 14/09/18 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_del_inaj(p_docno,p_site)
DEFINE p_docno      LIKE inaj_t.inaj001
DEFINE p_site       LIKE inaj_t.inajsite
DEFINE r_success    LIKE type_t.num5
DEFINE l_inaj033    LIKE inaj_t.inaj033
DEFINE l_inbamoddt  LIKE inba_t.inbamoddt
#170104-00031#1-S
DEFINE l_sql        STRING
DEFINE l_cnt        LIKE type_t.num10
DEFINE l_inaj005    LIKE inaj_t.inaj005
DEFINE l_inaj006    LIKE inaj_t.inaj006
DEFINE l_inaj007    LIKE inaj_t.inaj007
DEFINE l_inaj008    LIKE inaj_t.inaj008
DEFINE l_inaj009    LIKE inaj_t.inaj009
DEFINE l_inaj010    LIKE inaj_t.inaj010
DEFINE l_inaj045    LIKE inaj_t.inaj045
#170104-00031#1-E
DEFINE l_inag008    LIKE inag_t.inag008 #170116-00032#1
DEFINE lc_para_data LIKE type_t.chr80  #170618-00421#1 add
DEFINE l_n          LIKE type_t.num10  #170618-00421#1 add


   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #檢查傳入的單據編號是否有值，若沒有則顯示錯誤訊息並不允許往下執行，並回傳失敗
   IF cl_null(p_docno) THEN
      INITIALIZE g_errparam TO NULL
      #LET g_errparam.code = 'sub-00351'#160321-00016#18 mark
      LET g_errparam.code = 'sub-00228' #160321-00016#18 add
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF cl_null(p_site) THEN
      LET p_site = g_site
   END IF

   #若傳入的單據編號對應的inaj_t中有對應的VMI結算資料時即inaj030='1:VMI位結算'時，
   #針對所有對應的雜收發單據的狀態更新為作廢
   LET l_inbamoddt = cl_get_current()
   LET l_inaj033 = ''
   DECLARE s_inventory_del_inaj_cur CURSOR FOR
      #SELECT inaj033 FROM inaj_t              #170104-00031#1 mark
      SELECT DISTINCT inaj033,inaj005,inaj006,inaj007,inaj008,inaj009,inaj010,inaj045 FROM inaj_t   #170104-00031#1
       WHERE inajent  = g_enterprise
         AND inajsite = p_site
         AND inaj001  = p_docno
   #FOREACH s_inventory_del_inaj_cur INTO l_inaj033   #170104-00031#1 mark
   FOREACH s_inventory_del_inaj_cur INTO l_inaj033,l_inaj005,l_inaj006,l_inaj007,l_inaj008,l_inaj009,l_inaj010,l_inaj045 #170104-00031#1 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sel inaj_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
   
      UPDATE inba_t
         SET inbamodid = g_user,
             inbamoddt = l_inbamoddt,
             inbacnfid = '',
             #PGS(D)-10167 -S-
             #inbacnfdt = '',
             inbacnfdt = null,
             #PGS(D)-10167 -E-
             inbastus  = 'X' 
       WHERE inbaent = g_enterprise
         AND inbadocno = l_inaj033

      #170116-00032#1-S
      LET l_inag008 = 0
      SELECT inag008 INTO l_inag008 FROM inag_t
       WHERE inagent = g_enterprise
         AND inagsite = g_site
         AND inag001 = l_inaj005
         AND inag002 = l_inaj006
         AND inag003 = l_inaj007
         AND inag004 = l_inaj008
         AND inag005 = l_inaj009
         AND inag006 = l_inaj010
         AND inag007 = l_inaj045  
      IF cl_null(l_inag008) THEN  LET l_inag008 = 0 END IF    
      IF l_inag008 = 0 THEN
      #170116-00032#1-E            
         #170104-00031#1-S      
         LET l_cnt = 0      
         SELECT COUNT(1) INTO l_cnt FROM inaj_t 
          WHERE inajent = g_enterprise
            AND inajsite = g_site
            AND inaj005 = l_inaj005
            AND inaj006 = l_inaj006
            AND inaj007 = l_inaj007
            AND inaj008 = l_inaj008
            AND inaj009 = l_inaj009
            AND inaj010 = l_inaj010
            AND inaj045 = l_inaj045
           # AND inaj001 <> l_inaj033  #排除本张单据    #170116-00032#1
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF   
         IF l_cnt = 0 THEN
            #170618-00421#1 add(S)
            LET lc_para_data=''
            LET l_n=0
            LET lc_para_data = cl_get_para(g_enterprise,g_site,'S-BAS-0044')
            SELECT COUNT(1) INTO l_n  FROM inac_t WHERE inacent = g_enterprise AND inacsite = g_site AND inac003 = lc_para_data AND inac001=l_inaj008
            IF l_n = 0 THEN
            #170618-00421#1 add(E)
               #刪除對應的庫存明細
               DELETE FROM inag_t 
                WHERE inagent = g_enterprise
                  AND inagsite = g_site
                  AND inag001 = l_inaj005
                  AND inag002 = l_inaj006
                  AND inag003 = l_inaj007
                  AND inag004 = l_inaj008
                  AND inag005 = l_inaj009
                  AND inag006 = l_inaj010
                  AND inag007 = l_inaj045      
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "del2 inag_t:"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
               
              #170718-00011#1-S add
               DELETE FROM inai_t 
                WHERE inaient = g_enterprise
                  AND inaisite = g_site
                  AND inai001 = l_inaj005
                  AND inai002 = l_inaj006
                  AND inai003 = l_inaj007
                  AND inai004 = l_inaj008
                  AND inai005 = l_inaj009
                  AND inai006 = l_inaj010
                  AND inai009 = l_inaj045
              #170718-00011#1-E add
               
            END IF #170618-00421#1 add               
         END IF
         #170104-00031#1-E
      END IF   #170116-00032#1
      DELETE FROM inaj_t
       WHERE inajent  = g_enterprise
         AND inajsite = p_site
         AND inaj001  = l_inaj033
      #add by lixh 20150827
      #刪除inaj_t資料的同時刪除對應的inal_t
      DELETE FROM inal_t
       WHERE inalent = g_enterprise
         AND inalsite = p_site
         AND inal001 = l_inaj033
      #add by lixh 20150827
      LET l_inaj033 = ''
   END FOREACH
   
   #170104-00031#1-S
   LET l_sql = " SELECT DISTINCT inaj005,inaj006,inaj007,inaj008,inaj009,inaj010,inaj045 FROM inaj_t ",
               "  WHERE inajent = ",g_enterprise,
               "    AND inajsite = '",g_site,"'",
               "    AND inaj001 = '",p_docno,"'"
   PREPARE s_inventory_inaj_pre FROM l_sql
   DECLARE s_inventory_inaj_cur CURSOR FOR s_inventory_inaj_pre
   FOREACH s_inventory_inaj_cur INTO l_inaj005,l_inaj006,l_inaj007,l_inaj008,l_inaj009,l_inaj010,l_inaj045   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "s_inventory_inaj_cur:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF 
      #170116-00032#1-S
      LET l_inag008 = 0
      SELECT inag008 INTO l_inag008 FROM inag_t
          WHERE inagent = g_enterprise
            AND inagsite = g_site
            AND inag001 = l_inaj005
            AND inag002 = l_inaj006
            AND inag003 = l_inaj007
            AND inag004 = l_inaj008
            AND inag005 = l_inaj009
            AND inag006 = l_inaj010
            AND inag007 = l_inaj045  
      IF cl_null(l_inag008) THEN  LET l_inag008 = 0 END IF    
      IF l_inag008 = 0 THEN
      #170116-00032#1-E          
         LET l_cnt = 0  
         SELECT COUNT(1) INTO l_cnt FROM inaj_t 
          WHERE inajent = g_enterprise
            AND inajsite = g_site
            AND inaj005 = l_inaj005
            AND inaj006 = l_inaj006
            AND inaj007 = l_inaj007
            AND inaj008 = l_inaj008
            AND inaj009 = l_inaj009
            AND inaj010 = l_inaj010
            AND inaj045 = l_inaj045
            AND inaj001 <> p_docno  #排除本张单据
         IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF   
         IF l_cnt = 0 THEN
            #170618-00421#1 add(S)
            LET lc_para_data=''
            LET l_n=0
            LET lc_para_data = cl_get_para(g_enterprise,g_site,'S-BAS-0044')
            SELECT COUNT(1) INTO l_n  FROM inac_t WHERE inacent = g_enterprise AND inacsite = g_site AND inac003 = lc_para_data AND inac001=l_inaj008
            IF l_n = 0 THEN
            #170618-00421#1 add(E)
               #刪除對應的庫存明細
               DELETE FROM inag_t 
                WHERE inagent = g_enterprise
                  AND inagsite = g_site
                  AND inag001 = l_inaj005
                  AND inag002 = l_inaj006
                  AND inag003 = l_inaj007
                  AND inag004 = l_inaj008
                  AND inag005 = l_inaj009
                  AND inag006 = l_inaj010
                  AND inag007 = l_inaj045      
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "del inag_t:"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
                  EXIT FOREACH
               END IF
              #170718-00011#1-S add
               DELETE FROM inai_t 
                WHERE inaient = g_enterprise
                  AND inaisite = g_site
                  AND inai001 = l_inaj005
                  AND inai002 = l_inaj006
                  AND inai003 = l_inaj007
                  AND inai004 = l_inaj008
                  AND inai005 = l_inaj009
                  AND inai006 = l_inaj010
                  AND inai009 = l_inaj045
              #170718-00011#1-E add               
            END IF  #170618-00421#1 add             
         END IF  #170116-00032#1         
      END IF
   END FOREACH
   #170104-00031#1-E

   #刪除庫存交易明細資料
   DELETE FROM inaj_t
    WHERE inajent  = g_enterprise
      AND inajsite = p_site
      AND inaj001  = p_docno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del inaj_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   #add by lixh 20150827
   #刪除inaj_t資料的同時刪除對應的inal_t
   DELETE FROM inal_t
    WHERE inalent = g_enterprise
      AND inalsite = p_site
      AND inal001 = p_docno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del inaj_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF      
   #add by lixh 20150827   

   RETURN r_success

END FUNCTION
################################################################################
# Descriptions...: 更新庫存在揀量或備置量
# Memo...........:
# Usage..........: CALL s_inventory_upd_inan(p_type,p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_imafsite)
#                  RETURNING r_success
# Input parameter: p_type      類型(3:在揀量增加/-3:在揀量減少/2:備置量增加/-2:備置量減少)
#                : p_site      營運據點
#                : p_item      料件編號
#                : p_inan002   產品特徵
#                : p_inan003   庫存管理特徵
#                : p_inan004   庫位
#                : p_inan005   儲位
#                : p_inan006   批號
#                : p_unit      交易單位
#                : p_qty       在揀數量
#                : p_docno     單據編號
#                : p_seq       項次
#                : p_seq1      項序
#                : p_imafsite  營運據點(流通傳ALL/製造傳g_site或'')
# Return code....: r_success   處理狀態
# Date & Author..: 14/03/18 By 04441
# Modify.........: 14/09/26 By pomelo  增加p_site1參數 用來區分製造還是流通的程式
# Modify.........: 15/02/13 By 04441   將p_site1改為p_imafsite,只有當抓取imaf_t時,imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
# Modify.........: 15/06/04 By 04441   在揀量參數調整為'3'和'-3'
################################################################################
PUBLIC FUNCTION s_inventory_upd_inan(p_type,p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_imafsite)
DEFINE p_type       LIKE type_t.chr2
DEFINE p_site       LIKE inan_t.inansite
DEFINE p_item       LIKE inan_t.inan001
DEFINE p_inan002    LIKE inan_t.inan002
DEFINE p_inan003    LIKE inan_t.inan003
DEFINE p_inan004    LIKE inan_t.inan004
DEFINE p_inan005    LIKE inan_t.inan005
DEFINE p_inan006    LIKE inan_t.inan006
DEFINE p_unit       LIKE inan_t.inan007
DEFINE p_qty        LIKE inan_t.inan010
DEFINE p_docno      LIKE inap_t.inap001
#DEFINE p_seq        LIKE inap_t.inap002  #PGS(D)-01534 mark
#DEFINE p_seq1       LIKE inap_t.inap003  #PGS(D)-01534 mark
DEFINE p_seq        LIKE inaj_t.inaj002   #PGS(D)-01534 add
DEFINE p_seq1       LIKE inaj_t.inaj003   #PGS(D)-01534 add
DEFINE p_imafsite   LIKE imaf_t.imafsite
DEFINE r_success    LIKE type_t.num5
DEFINE l_sql        STRING
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_inan000    LIKE inan_t.inan000  #庫存類型(1在揀量/2備置量)
DEFINE l_imaf058    LIKE imaf_t.imaf058  #存貨備置策略
DEFINE l_unit       LIKE inan_t.inan007  #庫存單位
DEFINE l_qty        LIKE inan_t.inan010  #庫存數量
DEFINE l_para       LIKE type_t.chr80    #單據別參數
DEFINE l_slip       LIKE oobx_t.oobx001  #單別
DEFINE l_success    LIKE type_t.num5


   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #檢核事物
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #170816-00007#1 by 02159 mark(S)
   ##檢核料料件編號、交易单位是否有值若沒有值則不允許往下執行
   #IF cl_null(p_type) OR cl_null(p_item) OR cl_null(p_unit) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #檢核料料件編號、交易单位是否有值若沒有值則不允許往下執行
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_type) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inagsite") RETURNING g_colname_1,g_comment_1  #類型
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_item) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件編號
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_unit) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq200","lbl_xmdp015") RETURNING g_colname_1,g_comment_1   #交易單位
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
   #170816-00007#1 by 02159 add(E)   
   
   #150604 by 04441 add start
   IF p_type <> '3' AND p_type <> '-3' AND
      p_type <> '2' AND p_type <> '-2' THEN
      RETURN r_success
   END IF
   IF p_type = '3' THEN LET p_type = '1' END IF
   IF p_type = '-3' THEN LET p_type = '-1' END IF
   #150604 by 04441 add end
   
   IF cl_null(p_inan002) THEN LET p_inan002 = ' ' END IF
   IF cl_null(p_inan003) THEN LET p_inan003 = ' ' END IF
   IF cl_null(p_inan004) THEN LET p_inan004 = ' ' END IF
   IF cl_null(p_inan005) THEN LET p_inan005 = ' ' END IF
   IF cl_null(p_inan006) THEN LET p_inan006 = ' ' END IF
   IF cl_null(p_site) THEN LET p_site = g_site END IF
   IF cl_null(p_imafsite) THEN LET p_imafsite = g_site END IF
   
#150604 by 04441 mark start
#   IF p_type = '1' THEN  #在揀量增加
#      #依據傳入單據編號判斷單據別參數是否要作在揀量檢核
#      CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
#      IF l_success THEN
#         LET l_para = cl_get_doc_para(g_enterprise,p_site,l_slip,'D-BAS-0070')
#         IF (l_para = 'N' OR cl_null(l_para)) THEN
#            RETURN r_success
#         END IF
#      END IF
#   END IF
#150604 by 04441 mark end
   
   CASE 
      WHEN p_type = '1' OR p_type = '-1'
         #庫存類型=1在揀量
         LET l_inan000 = '1'
      WHEN p_type = '2' OR p_type = '-2'
         #庫存類型=2備置量
         LET l_inan000 = '2'
      OTHERWISE EXIT CASE
   END CASE
   
   #160927-00024#1-s
   #依據傳入料號檢核料件進銷存據點檔的存貨備置策略
   #若不為'1.軟備置'或'2.硬備置'則不須往下執行
   IF l_inan000 = '2' THEN
      LET l_imaf058 = ''
      SELECT imaf058 INTO l_imaf058
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite = p_site
         AND imaf001 = p_item
      #需求等候模式
      IF l_imaf058 MATCHES '[03]' THEN
         RETURN r_success
      END IF
   END IF
   #160927-00024#1-e
   
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   CALL s_inventory_unit(p_site,p_item,p_unit,p_qty,p_imafsite)
        RETURNING r_success,l_unit,l_qty
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   CASE 
      WHEN p_type = '1' OR p_type = '2'
         #增加
         LET l_qty = l_qty
      WHEN p_type = '-1' OR p_type = '-2'
         #減少
         LET l_qty = - l_qty
      OTHERWISE EXIT CASE
   END CASE
   
   LET l_sql = " SELECT COUNT(1) FROM inan_t ",
               "  WHERE inanent  = ",g_enterprise,
               "    AND inansite = '",p_site,"' ",
               "    AND inan000  = '",l_inan000,"' ",
               "    AND inan001  = '",p_item,"' ",
               "    AND inan002  = '",p_inan002,"' ",
               "    AND inan003  = '",p_inan003,"' ",
               "    AND inan004  = ? ",
               "    AND inan005  = ? ",
               "    AND inan006  = ? ",
               "    AND inan007  = '",l_unit,"' "
   PREPARE s_inventory_upd_inan_count_pre FROM l_sql
   
   LET l_sql = " INSERT INTO inan_t ",
               " (inanent,inansite,inan000,inan001,inan002,inan003, ",
               "  inan004,inan005 ,inan006,inan007,inan010) ",
               " values(?,?,?,?,?, ?,?,?,?,?, ?) "
   PREPARE s_inventory_upd_inan_insert_pre FROM l_sql
   
   LET l_sql = " UPDATE inan_t SET inan010 = inan010 + ? ",
               "  WHERE inanent  = ",g_enterprise,
               "    AND inansite = '",p_site,"' ",
               "    AND inan000  = '",l_inan000,"' ",
               "    AND inan001  = '",p_item,"' ",
               "    AND inan002  = '",p_inan002,"' ",
               "    AND inan003  = '",p_inan003,"' ",
               "    AND inan004  = ? ",
               "    AND inan005  = ? ",
               "    AND inan006  = ? ",
               "    AND inan007  = '",l_unit,"' "
   PREPARE s_inventory_upd_inan_update_pre FROM l_sql
   
   LET l_cnt = 0
   EXECUTE s_inventory_upd_inan_count_pre USING ' ',' ',' ' INTO l_cnt
   #檢查傳入的營運據點、料件、產品特徵、庫存管理特徵是否有對應的inan_t資料
   #若沒有則自動新增對應的inan_t資料
   IF l_cnt = 0 OR cl_null(l_cnt) THEN
      EXECUTE s_inventory_upd_inan_insert_pre USING
         g_enterprise,p_site,l_inan000,p_item,p_inan002,
         p_inan003,' ',' ',' ',l_unit,l_qty
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'execute s_inventory_upd_inan_insert_pre'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   #依據傳入參數，更新那一筆inan_t，異動的數量為p_qty
   ELSE
      EXECUTE s_inventory_upd_inan_update_pre USING l_qty,' ',' ',' '
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         #LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre'        #200206-00012#1 mark
         LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre,item_no:',p_item,',Product Feature:',p_inan002,   #200206-00012#1 add
                                 ',Qty:',l_qty                                                                              #200206-00012#1 add
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   
   IF NOT cl_null(p_inan004) THEN
      LET l_cnt = 0
      EXECUTE s_inventory_upd_inan_count_pre USING p_inan004,' ',' ' INTO l_cnt
      #依據傳入參數的庫位，新增一筆inan_t
      IF l_cnt = 0 OR cl_null(l_cnt) THEN
         EXECUTE s_inventory_upd_inan_insert_pre USING
            g_enterprise,p_site,l_inan000,p_item,p_inan002,
            p_inan003,p_inan004,' ',' ',l_unit,l_qty
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_inventory_upd_inan_count_pre'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      #依據傳入參數的庫位，更新單純for庫位的那一筆inan_t，異動的數量為p_qty
      ELSE
         EXECUTE s_inventory_upd_inan_update_pre USING l_qty,p_inan004,' ',' '
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            #LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre'          #200206-00012#1 mark
            LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre,Item_no:',p_item,',Product Feature:',p_inan002,    #200206-00012#1 add
                                    ',Warehouse:',p_inan004,',Qty:',l_qty                                                       #200206-00012#1 add
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END IF
   
   IF NOT cl_null(p_inan005) THEN
      LET l_cnt = 0
      EXECUTE s_inventory_upd_inan_count_pre USING p_inan004,p_inan005,' ' INTO l_cnt
      #若傳入參數的儲位也有值時，則需再多新增for庫位這一筆inan_t
      IF l_cnt = 0 OR cl_null(l_cnt) THEN
         EXECUTE s_inventory_upd_inan_insert_pre USING
            g_enterprise,p_site,l_inan000,p_item,p_inan002,
            p_inan003,p_inan004,p_inan005,' ',l_unit,l_qty
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_inventory_upd_inan_insert_pre'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      #若傳入參數的儲位也有值時，則需再多更新庫位+儲位這一筆inan_t，異動的是量為p_qty
      ELSE
         EXECUTE s_inventory_upd_inan_update_pre USING l_qty,p_inan004,p_inan005,' '
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            #LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre'           #200206-00012#1 mark
            LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre,Item_no:',p_item,',Product Feature:',p_inan002,   #200206-00012#1 add
                                    ',Warehouse:',p_inan004,',Location:',p_inan005,',Qty:',l_qty                               #200206-00012#1 add
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END IF
   
   IF NOT cl_null(p_inan006) THEN
      LET l_cnt = 0
      EXECUTE s_inventory_upd_inan_count_pre USING p_inan004,p_inan005,p_inan006 INTO l_cnt
      #若傳入參數的儲位和批號都有值時，則需再多新增for庫位+儲位這一筆inan_t
      IF l_cnt = 0 OR cl_null(l_cnt) THEN
         EXECUTE s_inventory_upd_inan_insert_pre USING
            g_enterprise,p_site,l_inan000,p_item,p_inan002,
            p_inan003,p_inan004,p_inan005,p_inan006,l_unit,l_qty
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'execute s_inventory_upd_inan_insert_pre'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      #若傳入參數的批號也有值時，則需再多更新庫位+儲位+批號這一筆inan_t，異動量為p_qty
      ELSE
         EXECUTE s_inventory_upd_inan_update_pre USING l_qty,p_inan004,p_inan005,p_inan006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            #LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre'       #200206-00012#1 mark
            LET g_errparam.extend = 'execute s_inventory_upd_inan_update_pre,Item_no:',p_item,',Product Feature:',p_inan002,    #200206-00012#1 add
                                     ',Warehouse:',p_inan004,',Location:',p_inan005,',LotNo:',p_inan006,',Qty:',l_qty           #200206-00012#1 add
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF
   END IF
   
   RETURN r_success   

END FUNCTION
################################################################################
# Descriptions...: 新增庫存在揀量異動明細應用元件
# Memo...........:
# Usage..........: CALL s_inventory_ins_inap(p_type,p_site,p_docno,p_seq,p_seq1,p_inap004,p_inap005,p_inap006,p_inap007,p_inap008,p_inap009,p_inap010,p_qty,p_docdt,p_user,p_dept,p_imafsite)
#                  RETURNING r_success
# Input parameter: p_type      異動類型(1:在揀量增加/-1:在揀量減少)
#                : p_site      營運據點
#                : p_docno     單據編號
#                : p_seq       項次
#                : p_seq1      項序
#                : p_inap004   料件編號
#                : p_inap005   產品特徵
#                : p_inap006   庫存管理特徵
#                : p_inap007   庫位
#                : p_inap008   儲位
#                : p_inap009   批號
#                : p_inap010   交易單位
#                : p_qty       數量
#                : p_docdt     單據日期
#                : p_user      人員
#                : p_dept      部門
#                : p_imafsite  營運據點 (流通傳ALL/製造傳g_site或'')
# Return code....: r_success   處理狀態
# Date & Author..: 14/03/18 By 04441
# Modify.........: 14/09/26 By pomelo  增加p_site1參數 用來區分製造還是流通的程式
# Modify.........: 15/02/13 By 04441   將p_site1改為p_imafsite,只有當抓取imaf_t時,imafsite的過濾條件是p_imafsite,其他table的site條件都改成g_site
# Modify.........: 15/06/04 By 04441   add call s_inventory_upd_inan()
# Modify.........: 15/08/20 By Lori    增加判斷是否為聯營/租賃/費用商品不扣庫存
################################################################################
PUBLIC FUNCTION s_inventory_ins_inap(p_type,p_site,p_docno,p_seq,p_seq1,p_inap004,p_inap005,p_inap006,p_inap007,p_inap008,p_inap009,p_inap010,p_qty,p_docdt,p_user,p_dept,p_imafsite)
DEFINE p_type       LIKE type_t.chr2
DEFINE p_site       LIKE inap_t.inapsite
DEFINE p_docno      LIKE inap_t.inap001
DEFINE p_seq        LIKE inap_t.inap002
DEFINE p_seq1       LIKE inap_t.inap003
DEFINE p_inap004    LIKE inap_t.inap004
DEFINE p_inap005    LIKE inap_t.inap005
DEFINE p_inap006    LIKE inap_t.inap006
DEFINE p_inap007    LIKE inap_t.inap007
DEFINE p_inap008    LIKE inap_t.inap008
DEFINE p_inap009    LIKE inap_t.inap009
DEFINE p_inap010    LIKE inap_t.inap010
DEFINE p_qty        LIKE inap_t.inap011
DEFINE p_docdt      LIKE inap_t.inap015
DEFINE p_user       LIKE inap_t.inap017
DEFINE p_dept       LIKE inap_t.inap018
DEFINE p_imafsite   LIKE imaf_t.imafsite
DEFINE r_success    LIKE type_t.num5
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE oobx_t.oobx001  #單別
DEFINE l_para       LIKE type_t.chr80    #單據別參數
DEFINE l_oobx003    LIKE oobx_t.oobx003  #單據性質
DEFINE l_inap012    LIKE inap_t.inap012  #庫存單位
DEFINE l_inap013    LIKE inap_t.inap013  #在揀量
DEFINE l_cnt        LIKE type_t.num5
DEFINE l_inap  RECORD
    inap004    LIKE inap_t.inap004,
    inap005    LIKE inap_t.inap005,
    inap006    LIKE inap_t.inap006,
    inap007    LIKE inap_t.inap007,
    inap008    LIKE inap_t.inap008,
    inap009    LIKE inap_t.inap009,
    inap012    LIKE inap_t.inap012,
    inap013    LIKE inap_t.inap013
           END RECORD
#DEFINE l_imaf058    LIKE imaf_t.imaf058  #存貨備置策略  #150624 by 04441 add  #160927-00024#1


   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
   
   #檢核事物
   IF NOT s_transaction_chk('Y',1) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   #170816-00007#1 by 02159 mark(S)
   #檢核料件編號、庫位、單據編號、項次、項序是否有值若沒有值則不允許往下執行
   #IF cl_null(p_docno) OR cl_null(p_seq) OR cl_null(p_inap004) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #檢核料件編號、庫位、單據編號、項次、項序是否有值若沒有值則不允許往下執行
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_docno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inap001") RETURNING g_colname_1,g_comment_1  #單據編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_seq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inap002") RETURNING g_colname_1,g_comment_1   #項次
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_inap004) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件編號
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
   #170816-00007#1 by 02159 add(E)   

   #150819-00029 150820 by lori add---(S)
   IF s_inventory_chk_prod(p_inap004,p_imafsite) THEN
      RETURN r_success
   END IF
   #150819-00029 150820 by lori add---(E)   
   
   IF cl_null(p_seq1) THEN LET p_seq1 = '0' END IF
   IF cl_null(p_site) THEN LET p_site = g_site END IF
   IF cl_null(p_imafsite) THEN LET p_imafsite = g_site END IF
   IF cl_null(p_inap006) THEN LET p_inap006 = ' ' END IF #161107-00034#1
   IF cl_null(p_inap007) THEN LET p_inap007 = ' ' END IF
   IF cl_null(p_inap008) THEN LET p_inap008 = ' ' END IF
   IF cl_null(p_inap009) THEN LET p_inap009 = ' ' END IF
   IF cl_null(p_inap005) THEN LET p_inap005 = ' ' END IF #181207-00043#1 add	
   
#160927-00024#1-s
#   #150624 by 04441 add start
#   #依據傳入料號檢核料件進銷存據點檔的存貨備置策略
#   #為需求等候模式則不做在揀量
#   LET l_imaf058 = ''
#   SELECT imaf058 INTO l_imaf058
#     FROM imaf_t
#    WHERE imafent = g_enterprise
#      AND imafsite = p_site
#      AND imaf001 = p_inap004
#   IF l_imaf058 MATCHES '[03]' THEN
#      RETURN r_success
#   END IF
#   #150624 by 04441 add end
#160927-00024#1-e
   
   #依據傳入單據編號判斷單據別參數是否要作在揀量檢核
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
#160908-00028#1-s
#   IF l_success THEN
#      LET l_para = cl_get_doc_para(g_enterprise,p_site,l_slip,'D-BAS-0070')
#      IF (l_para = 'N' OR cl_null(l_para)) AND p_type = '1' THEN
#         RETURN r_success
#      END IF
#   END IF
#160908-00028#1-e
   
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM inap_t
    WHERE inapent = g_enterprise
      AND inapsite = p_site
      AND inap001 = p_docno
      AND inap002 = p_seq
      AND inap003 = p_seq1
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   
#171120-00043#1-s mark
#   IF p_type = '-1' THEN
#      IF l_cnt = 0 THEN
#         RETURN r_success
#      ELSE
#171120-00043#1-e mark
   IF l_cnt > 0 THEN  #171120-00043#1
         INITIALIZE l_inap.* TO NULL
         SELECT inap004,inap005,inap006,inap007,inap008,inap009,inap012,inap013
           INTO l_inap.inap004,l_inap.inap005,l_inap.inap006,l_inap.inap007,
                l_inap.inap008,l_inap.inap009,l_inap.inap012,l_inap.inap013
           FROM inap_t
          WHERE inapent = g_enterprise
            AND inapsite = p_site
            AND inap001 = p_docno
            AND inap002 = p_seq
            AND inap003 = p_seq1
#      END IF  #171120-00043#1 mark
      
      #在揀量減少
      IF NOT s_inventory_upd_inan('-3',p_site,l_inap.inap004,l_inap.inap005,l_inap.inap006,
                                  l_inap.inap007,l_inap.inap008,l_inap.inap009,l_inap.inap012,
                                  l_inap.inap013,p_docno,p_seq,p_seq1,p_imafsite) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
#   END IF  #171120-00043#1 mark
   
#   IF l_cnt > 0 THEN  #171120-00043#1 mark
      DELETE FROM inap_t
       WHERE inapent = g_enterprise
         AND inapsite = p_site
         AND inap001 = p_docno
         AND inap002 = p_seq
         AND inap003 = p_seq1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del inap_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   
   IF p_type = '1' THEN
      #異動命令=傳入單據編的單別對應的單據性質
      LET l_oobx003 = ''
      SELECT oobx003 INTO l_oobx003
        FROM oobx_t
       WHERE oobxent = g_enterprise
         AND oobx001 = l_slip
      
      #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
      #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
      CALL s_inventory_unit(p_site,p_inap004,p_inap010,p_qty,p_imafsite)
           RETURNING r_success,l_inap.inap012,l_inap.inap013
      IF NOT r_success THEN
         RETURN r_success
      END IF
      
      INSERT INTO inap_t(inapent,inapsite,inap001,inap002,inap003,
                         inap004,inap005,inap006,inap007,inap008,
                         inap009,inap010,inap011,inap012,inap013,
                         inap014,inap015,inap016,inap017,inap018)
             VALUES(g_enterprise,p_site,p_docno,p_seq,p_seq1,
                    p_inap004,p_inap005,p_inap006,p_inap007,p_inap008,
                    p_inap009,p_inap010,p_qty,l_inap.inap012,l_inap.inap013,
                    l_oobx003,p_docdt,g_today,p_user,p_dept)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins inap_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      #在揀量增加
      IF NOT s_inventory_upd_inan('3',p_site,p_inap004,p_inap005,p_inap006,p_inap007,p_inap008,p_inap009,
                                  l_inap.inap012,l_inap.inap013,p_docno,p_seq,p_seq1,p_imafsite) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   RETURN r_success   

END FUNCTION
################################################################################
# Descriptions...: 檢核庫存在揀量和備置量應用元件
# Memo...........:
# Usage..........: CALL s_inventory_check_inan(p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_docno_from,p_seq_from,p_imafsite)
#                  RETURNING r_success,r_flag
# Input parameter: p_site      營運據點
#                : p_item      料件編號
#                : p_inan002   產品特徵
#                : p_inan003   庫存管理特徵
#                : p_inan004   庫位
#                : p_inan005   儲位
#                : p_inan006   批號
#                : p_unit      交易單位
#                : p_qty       數量
#                : p_docno     單據編號
#                : p_seq       項次
#                : p_seq1      項序
#                : p_docno_from 訂單單號/工單單號   #160408-00035#8
#                : p_seq_from   訂單項次/工單項次   #160408-00035#8
#                : p_imafsite   營運據點(流通作業一律傳入ALL,製造傳入g_site或‘’) #170724-00041#4
# Return code....: r_success   處理狀態
#                : r_flag      庫存量足夠否(1:庫存足夠/0:庫存不足)
# Date & Author..: 14/03/19 By 04441
# Modify.........: 160408-00035#8 16/05/04 By xianghui 增加兩個參數用來抓取訂單/工單中的備置量-备置已冲销量
# Modify.........: 170724-00041#4 17/08/22 by sakura   增加一個參數p_imafsite營運據點,流通作業一律傳入ALL,製造傳入g_site或‘’
################################################################################
PUBLIC FUNCTION s_inventory_check_inan(p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_docno_from,p_seq_from,p_imafsite)
DEFINE p_site       LIKE inan_t.inansite
DEFINE p_item       LIKE inan_t.inan001
DEFINE p_inan002    LIKE inan_t.inan002
DEFINE p_inan003    LIKE inan_t.inan003
DEFINE p_inan004    LIKE inan_t.inan004
DEFINE p_inan005    LIKE inan_t.inan005
DEFINE p_inan006    LIKE inan_t.inan006
DEFINE p_unit       LIKE inan_t.inan007
DEFINE p_qty        LIKE inan_t.inan010
DEFINE p_docno      LIKE inap_t.inap001
#DEFINE p_seq        LIKE inap_t.inap002  #PGS(D)-01534 mark
#DEFINE p_seq1       LIKE inap_t.inap003  #PGS(D)-01534 mark
DEFINE p_seq        LIKE inaj_t.inaj002   #PGS(D)-01534 add
DEFINE p_seq1       LIKE inaj_t.inaj003   #PGS(D)-01534 add
DEFINE p_docno_from LIKE inap_t.inap001    #訂單單號/工單單號   #160408-00035#8
DEFINE p_seq_from   LIKE inap_t.inap002    #訂單項次/工單項次   #160408-00035#8
DEFINE p_imafsite   LIKE imaf_t.imafsite   #流通作業一律傳入ALL,製造傳入g_site或null   #170724-00041#4
DEFINE r_success    LIKE type_t.num5
DEFINE r_flag       LIKE type_t.num5
DEFINE l_sql1       STRING
DEFINE l_sql2       STRING
DEFINE l_sql3       STRING
DEFINE l_sql4       STRING 
DEFINE l_sql5       STRING               #160408-00035#8
DEFINE l_sql6       STRING               #160408-00035#8
DEFINE l_sql7       STRING               #160408-00035#8
DEFINE l_sql8       STRING               #160408-00035#8
DEFINE l_sql9       STRING               #170516-00005#1 add
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE ooba_t.ooba002  #單別
DEFINE l_para       LIKE type_t.chr80    #單據別參數
DEFINE l_inaa014    LIKE inaa_t.inaa014  #允許負庫存否
DEFINE l_unit       LIKE inan_t.inan007  #庫存單位
DEFINE l_qty        LIKE inan_t.inan010  #庫存數量
DEFINE l_inap011    LIKE inap_t.inap011  #已確認的量
DEFINE l_inag008    LIKE inag_t.inag008  #庫存量
#210324-00031#1 add-S
DEFINE l_inag008_sum LIKE inag_t.inag008  #不考虑库储批之后，库存量的总和
DEFINE l_sql10       STRING               #抓当前料号所有库储批的总和
DEFINE l_inan010_x   LIKE inan_t.inan010  #获取指定库储批对应的在拣+备置量
DEFINE l_sql11       STRING               #抓当前库储批的在拣+备置量总和
#210324-00031#1 add-E
DEFINE l_inan010    LIKE inan_t.inan010  #在揀量+備置量
#DEFINE l_imaf058    LIKE imaf_t.imaf058  #存貨備置策略  #150624 by 04441 add  #160927-00024#1
DEFINE l_qty1       LIKE inan_t.inan010  #備置量-备置已冲销量 #160408-00035#8
#170102-00004#1-S
DEFINE l_inaj011       LIKE inaj_t.inaj011
DEFINE l_inaj012       LIKE inaj_t.inaj012
DEFINE l_inaj011_qty   LIKE inaj_t.inaj011
#170102-00004#1-E
DEFINE l_inap010       LIKE inap_t.inap010   #交易單位         #170516-00005#1 add   
DEFINE l_inap011_qty   LIKE inap_t.inap011                     #170516-00005#1 add
DEFINE l_inaj045       LIKE inaj_t.inaj045                     #170618-00265#1 add
DEFINE l_xmdl018_sum   LIKE xmdl_t.xmdl018  #181127-00047#1 add
DEFINE l_indc102       LIKE indc_t.indc102  #181218-00064#1 add
DEFINE l_extend        STRING               #190722-00026#1 add
DEFINE l_imaf058       LIKE imaf_t.imaf058  #存貨備置策略 #191021-00037#1 add
DEFINE l_indc009       LIKE indc_t.indc009  #191107-00048#1---add
DEFINE l_inan003_wc    LIKE inan_t.inan003  #庫存管理特徵條件 #200116-00014#1 add
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_flag = ''
   
   #191021-00037#1---add----str---
   SELECT imaf058 INTO l_imaf058
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite = p_site
      AND imaf001 = p_item
   #191021-00037#1---add----end---

   #170816-00007#1 by 02159 mark(S)
   ##參數檢核
   #IF cl_null(p_item) OR cl_null(p_unit) THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success,r_flag
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_item) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_unit) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq200","lbl_xmdp015") RETURNING g_colname_1,g_comment_1   #交易單位
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
      RETURN r_success,r_flag
   END IF   
   #170816-00007#1 by 02159 add(E) 

   IF cl_null(p_inan002) THEN LET p_inan002 = ' ' END IF
   IF cl_null(p_inan003) THEN LET p_inan003 = ' ' END IF
   IF cl_null(p_inan004) THEN LET p_inan005 = ' ' END IF
   IF cl_null(p_inan005) THEN LET p_inan005 = ' ' END IF
   IF cl_null(p_inan006) THEN LET p_inan006 = ' ' END IF
   #若p_site沒有值時預設g_site
   IF cl_null(p_site) THEN LET p_site = g_site END IF
   #170914-00004#1 add---------s--------
   IF cl_null(p_docno_from) THEN LET p_docno_from=' ' END IF
   IF cl_null(p_seq_from) THEN LET p_seq_from = 0 END IF
   #170914-00004#1 add----------e-------
   
   #190722-00026#1 add --(S)--
   INITIALIZE g_errparam TO NULL
   LET g_errparam.replace[1] = p_item           #料號
   LET g_errparam.replace[2] = p_inan002        #產品特徵
   LET g_errparam.replace[3] = p_inan003        #庫存管理特徵
   LET g_errparam.replace[4] = p_inan004        #庫位
   LET g_errparam.replace[5] = p_inan005        #儲位
   LET g_errparam.replace[6] = p_inan006        #批號
   LET g_errparam.replace[7] = p_docno          #單據編號
   LET g_errparam.replace[8] = p_seq            #項次
   LET g_errparam.replace[9] = p_seq1           #項序
   LET g_errparam.replace[10] = '0'             #分批序
   LET l_extend = cl_getmsg('ain-00968',g_lang)
   LET l_extend = cl_getmsg('lib-00114',g_lang),p_site,',',l_extend
   #190722-00026#1 add --(E)--
#160927-00024#1-s
#   #150624 by 04441 add start
#   #依據傳入料號檢核料件進銷存據點檔的存貨備置策略
#   #為需求等候模式則不做在揀量
#   LET l_imaf058 = ''
#   SELECT imaf058 INTO l_imaf058
#     FROM imaf_t
#    WHERE imafent = g_enterprise
#      AND imafsite = p_site
#      AND imaf001 = p_item
#   IF l_imaf058 MATCHES '[03]' THEN
#      RETURN r_success,r_flag
#   END IF
#   #150624 by 04441 add end
#160927-00024#1-e
 #210329-00022#1 add---str---
 IF g_prog = 'asft350' THEN #因為asft350 程式已判斷過為參數"Y" 才會走s_asft310_confirm_chk()才會進至此，不需重複抓耗效能
     LET l_para = 'Y'
 ELSE
 #210329-00022#1 add---end---
  #依據傳入單據編號判斷單據別參數是否要作在揀量檢核
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   IF l_success THEN
      LET l_para = cl_get_doc_para(g_enterprise,p_site,l_slip,'D-BAS-0070')
      #mark--160408-00035#1 By shiun--(S)
#      IF (l_para = 'N' OR cl_null(l_para)) THEN
#         LET r_flag = 1
#         
#         RETURN r_success,r_flag
#      END IF
      #mark--160408-00035#1 By shiun--(E)
   END IF
 END IF #210329-00022#1 add
   
   #若庫位允許負庫存時則不須檢核庫存量是否足夠
    LET l_inaa014 = ''
    SELECT inaa014 INTO l_inaa014
      FROM inaa_t
     WHERE inaaent = g_enterprise
       AND inaasite = p_site
       AND inaa001 = p_inan004
    IF l_inaa014 = 'Y' THEN 
       LET r_flag = 1
       RETURN r_success,r_flag
    END IF     
   #181127-00047#1 -S add

  #來源是出貨單/無訂單出貨單，把數量換成整張單同料號、同庫儲批的加總量
   IF g_code MATCHES 'axmt540*' THEN
      SELECT SUM(xmdl018)
        INTO l_xmdl018_sum
        FROM xmdl_t
       WHERE xmdlent = g_enterprise
         AND xmdldocno = p_docno
         AND xmdl008 = p_item
         AND COALESCE(xmdl009,' ') = COALESCE(p_inan002,' ')
         AND xmdl014 = p_inan004
         AND COALESCE(xmdl015,' ') = COALESCE(p_inan005,' ')
         AND COALESCE(xmdl016,' ') = COALESCE(p_inan006,' ')
         AND COALESCE(xmdl052,' ') = COALESCE(p_inan003,' ')  #181218-00064#1 add
         AND xmdlseq <> p_seq
      IF NOT cl_null(l_xmdl018_sum) THEN
         LET p_qty = p_qty + l_xmdl018_sum
      END IF
   END IF   
   #181127-00047#1 -E add  
   #181218-00064#1 -S add
   #來源是雜項庫存發料單，把數量換成整張單同料號、同庫儲批的加總量
   IF g_prog MATCHES 'aint301*' THEN
      SELECT SUM(inbb011)
        INTO l_xmdl018_sum
        FROM inbb_t
       WHERE inbbent = g_enterprise
         AND inbbdocno = p_docno
         AND inbb001 = p_item
         AND COALESCE(inbb002,' ') = COALESCE(p_inan002,' ')
         AND inbb007 = p_inan004
         AND COALESCE(inbb008,' ') = COALESCE(p_inan005,' ')
         AND COALESCE(inbb009,' ') = COALESCE(p_inan006,' ')
         AND COALESCE(inbb003,' ') = COALESCE(p_inan003,' ')
         #PGS(D)-13130 memo -S-
         AND inbbseq <> p_seq
         #PGS(D)-13130 memo -E-      
      IF NOT cl_null(l_xmdl018_sum) THEN
         LET p_qty = p_qty + l_xmdl018_sum
      END IF
   END IF
   #來源是庫存報廢申請單/庫存報廢除帳單，把數量換成整張單同料號、同庫儲批的加總量
   IF g_prog MATCHES 'aint310*' OR g_prog MATCHES 'aint311*' THEN
      SELECT SUM(inbj009)
        INTO l_xmdl018_sum
        FROM inbj_t
       WHERE inbjent = g_enterprise
         AND inbjdocno = p_docno
         AND inbj001 = p_item
         AND COALESCE(inbj002,' ') = COALESCE(p_inan002,' ')
         AND inbj005 = p_inan004
         AND COALESCE(inbj006,' ') = COALESCE(p_inan005,' ')
         AND COALESCE(inbj007,' ') = COALESCE(p_inan006,' ')
         AND COALESCE(inbj003,' ') = COALESCE(p_inan003,' ')
         #PGS(D)-13130 memo -S-
         AND inbjseq <> p_seq
         #PGS(D)-13130 memo -E-
      IF NOT cl_null(l_xmdl018_sum) THEN
         LET p_qty = p_qty + l_xmdl018_sum
      END IF
   END IF
   #來源是一階段調撥單/兩階段調撥單，把數量換成整張單同料號、同庫儲批的加總量
   IF g_prog MATCHES 'aint330*' OR g_prog MATCHES 'aint340*' THEN
      SELECT indc102
        INTO l_indc102
        FROM indc_t
       WHERE indcent = g_enterprise
         AND indcdocno = p_docno
      #若檢驗方式為2:撥出方檢驗時，在揀量檢查中所用到的數量是indd103
      IF l_indc102 = '2' THEN
         SELECT SUM(indd103)
           INTO l_xmdl018_sum
           FROM indd_t
          WHERE inddent = g_enterprise
            AND indddocno = p_docno
            AND indd002 = p_item
            AND COALESCE(indd004,' ') = COALESCE(p_inan002,' ')
            AND indd022 = p_inan004
            AND COALESCE(indd023,' ') = COALESCE(p_inan005,' ')
            AND COALESCE(indd024,' ') = COALESCE(p_inan006,' ')
            AND COALESCE(indd102,' ') = COALESCE(p_inan003,' ')
            #PGS(D)-13130 memo -S-
            AND inddseq <> p_seq
            #PGS(D)-13130 memo -e-
      ELSE
         SELECT SUM(indd021)
           INTO l_xmdl018_sum
           FROM indd_t
          WHERE inddent = g_enterprise
            AND indddocno = p_docno
            AND indd002 = p_item
            AND COALESCE(indd004,' ') = COALESCE(p_inan002,' ')
            AND indd022 = p_inan004
            AND COALESCE(indd023,' ') = COALESCE(p_inan005,' ')
            AND COALESCE(indd024,' ') = COALESCE(p_inan006,' ')
            AND COALESCE(indd102,' ') = COALESCE(p_inan003,' ')
            #PGS(D)-13130 memo -S-
            AND inddseq <> p_seq
            #PGS(D)-13130 memo -E-      
      END IF
      IF NOT cl_null(l_xmdl018_sum) THEN
         LET p_qty = p_qty + l_xmdl018_sum
      END IF
   END IF
   #來源是發料單，把數量換成整張單同料號、同庫儲批的加總量
   IF g_prog MATCHES 'asft311*' OR g_prog MATCHES 'asft312*' OR g_prog MATCHES 'asft313*' OR
      g_prog MATCHES 'asft314*' OR g_prog MATCHES 'asrt310*' THEN
      SELECT SUM(sfdd007)
        INTO l_xmdl018_sum
        FROM sfdd_t
       WHERE sfddent = g_enterprise
         AND sfdddocno = p_docno
         AND sfdd001 = p_item
         AND COALESCE(sfdd013,' ') = COALESCE(p_inan002,' ')
         AND sfdd003 = p_inan004
         AND COALESCE(sfdd004,' ') = COALESCE(p_inan005,' ')
         AND COALESCE(sfdd005,' ') = COALESCE(p_inan006,' ')
         AND COALESCE(sfdd010,' ') = COALESCE(p_inan003,' ')
         #PGS(D)-13130 memo -S-
         AND sfddseq <> p_seq
         #PGS(D)-13130 memo -E-
      IF NOT cl_null(l_xmdl018_sum) THEN
         LET p_qty = p_qty + l_xmdl018_sum
      END IF
   END IF
   #181218-00064#1 -E add
   
   #191107-00048#1---add---s
   IF g_prog MATCHES 'aint330*' THEN
      SELECT indc009 INTO l_indc009 FROM indc_t 
       WHERE indcent = g_enterprise
         AND indcdocno = p_docno
   END IF
   IF l_indc009 ='Y' THEN
      LET l_unit = p_unit
#      LET l_qty = p_unit   #200528-00047#1 mark
      LET l_qty = p_qty    #200528-00047#1 mod
   ELSE
   #191107-00048---add---e    
      #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
      #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
     #CALL s_inventory_unit(p_site,p_item,p_unit,p_qty,p_site)       #170724-00041#4 by sakura mark
      CALL s_inventory_unit(p_site,p_item,p_unit,p_qty,p_imafsite)   #170724-00041#4 by sakura add
           RETURNING r_success,l_unit,l_qty
      IF NOT r_success THEN
         RETURN r_success,r_flag
      END IF
   END IF #191107-00048#1---add
   #170618-00265#1 add --(S)--
   #若是過帳還原時依據inaj紀錄的庫存單位進行過帳還原
   LET l_inaj045 = NULL
   IF cl_null(g_stutflag) THEN LET g_stutflag = '1' END IF
   IF cl_null(g_stuttype) THEN LET g_stuttype = '1' END IF
   IF g_stutflag = '2' THEN 
      SELECT inaj045 INTO l_inaj045 FROM inaj_t WHERE inajent = g_enterprise AND inajsite = p_site
         AND inaj001 = p_docno AND inaj002 = p_seq AND inaj003 = p_seq1
         AND inaj004 = g_stuttype * -1
      IF NOT cl_null(l_inaj045) THEN 
         CALL s_aooi250_convert_qty(p_item,l_unit,l_inaj045,l_qty)
              RETURNING r_success,l_qty
         IF NOT r_success THEN
            RETURN r_success
         END IF
         LET l_unit = l_inaj045
      END IF 
      LET g_stutflag = null
      LET g_stuttype = null
   END IF    
   #170618-00265#1 add --(E)--
   
   #170102-00004#1-S
   #在撿量的判斷要扣除自身在撿量，再判斷庫存是否足夠
   
   #170102-00004#1-E
   
   #LET l_inap011 = ''
   #SELECT SUM(inap011) INTO l_inap011
   #  FROM inap_t
   # WHERE inapent = g_enterprise
   #   AND inapsite = p_site
   #   AND inap001 = p_docno
   #IF cl_null(l_inap011) THEN LET l_inap011 = 0 END IF
   #191008-00007#1---mark---s
   #160408-00035#8---add---begin
   #抓取訂單或工單備置量-已備置量
#   LET l_sql5 = " SELECT SUM(xmdr008-xmdr009) ",
#                "   FROM xmdr_t ",
#                "  WHERE xmdrent = '",g_enterprise,"'",
#                "    AND xmdrdocno = '",p_docno_from,"'",
#               #"    AND xmdrseq = ",p_seq_from, #190117-00033#1 mark
#                "    AND xmdr001 = '",p_item,"'",
#                "    AND xmdr002 = '",p_inan002,"'",
#                "    AND xmdr003 = '",p_inan003,"'",
#                "    AND xmdr007 = '",l_unit,"'"
#   LET l_sql7 = " SELECT SUM(sfbb008-sfbb009) ",
#                "   FROM sfbb_t ",
#                "  WHERE sfbbent = '",g_enterprise,"'",
#                "    AND sfbbdocno = '",p_docno_from,"'",
#               #"    AND sfbbseq = ",p_seq_from, #190117-00033#1 mark
#                "    AND sfbb001 = '",p_item,"'",
#                "    AND sfbb002 = '",p_inan002,"'",
#                "    AND sfbb003 = '",p_inan003,"'",
#                "    AND sfbb007 = '",l_unit,"'"                
#   #160408-00035#8---add---end
   #191008-00007#1---mark---e
   #200116-00014#1-add---str---
   LET l_inan003_wc = ' '
   IF NOT cl_null(l_imaf058) AND l_imaf058 = '2' THEN
       #2:硬備置 
       LET l_inan003_wc = p_inan003
   END IF
   #200116-00014#1-add---end---   
   #191008-00007#1---add---s
   #抓取訂單或工單備置量-已備置量
   LET l_sql5 = " SELECT SUM(xmdr008-xmdr009) ",
                "   FROM xmdr_t,xmdl_t ",
                "  WHERE xmdlent = xmdrent ",
                "    AND xmdl003 = xmdrdocno ",
                "    AND xmdl004 = xmdrseq ",
                "    AND xmdl005 = xmdrseq1 ",
                "    AND xmdl006 = xmdrseq2 ",
                "    AND xmdrent = '",g_enterprise,"'",
                "    AND xmdldocno = '",p_docno,"'",
                "    AND xmdr001 = '",p_item,"'",
                "    AND xmdr002 = '",p_inan002,"'",
               #"    AND xmdr003 = '",p_inan003,"'",     #200116-00014#1 mark
                "    AND xmdr003 = '",l_inan003_wc,"'",  #200116-00014#1 add 庫存管理特徵
                "    AND xmdr007 = '",l_unit,"'"
   LET l_sql7 = " SELECT SUM(sfbb008-sfbb009) ",
                "   FROM sfbb_t,sfdc_t  ",
               #"  WHERE sfbbent = sfbcent ", #191226-00033#1 mark
                "  WHERE sfbbent = sfdcent ", #191226-00033#1 add
                "    AND sfbbdocno = sfdc001 ",
                "    AND sfbbseq = sfdc002 ",
                "    AND sfbbseq1 = sfdc003 ",
                "    AND sfbbent = '",g_enterprise,"'",
                "    AND sfdcdocno = '",p_docno,"'",
                "    AND sfbb001 = '",p_item,"'",
                "    AND sfbb002 = '",p_inan002,"'",
               #"    AND sfbb003 = '",p_inan003,"'",    #200116-00014#1 mark
                "    AND sfbb003 = '",l_inan003_wc,"'", #200116-00014#1 add 庫存管理特徵
                "    AND sfbb007 = '",l_unit,"'" 
   #191008-00007#1---add---e
   
   #170102-00004#1-S
   LET l_sql8 = " SELECT inaj011,inaj012 FROM inaj_t ",
                "  WHERE inajent = ",g_enterprise,
                "    AND inajsite = '",p_site,"'",
                "    AND inaj001 = '",p_docno,"'",  #單號
                #"    AND inaj002 = '",p_seq,"'",    #項次   #171214-00016#1 mark
                #"    AND inaj003 = '",p_seq1,"'",   #項序   #171214-00016#1 mark
                "    AND inaj002 = ? ",    #項次     #171214-00016#1 add
                "    AND inaj003 = ? ",   #項序      #171214-00016#1 add
                #PGS(D)-13130 memo -S-
                #"    AND inaj004 = '-1' "           #出庫'
                "    AND inaj004 = -1 "           #出庫                
                #PGS(D)-13130 memo -E-
                
   PREPARE get_inaj_pre FROM l_sql8     
   #170102-00004#1-E
   
   #170516-00005#1 add --(S)--
   #在撿量的判斷要扣除自身在撿量，再判斷庫存是否足夠
  #LET l_sql9 = " SELECT inap012,inap013 FROM inap_t ",      #170802-00050#1 mark
   LET l_sql9 = " SELECT inap012,SUM(inap013) FROM inap_t ", #170802-00050#1 add
                "  WHERE inapent = ",g_enterprise,
                "    AND inapsite = '",p_site,"'",
                "    AND inap001 = '",p_docno,"'",  #單號
               # "    AND inap002 = '",p_seq,"'"     #項次  #171214-00016#1 mark
               #"    AND inap002 = ",p_seq           #項次  #171214-00016#1 add #PGS(D)-01534 mark
                "   AND cast(inap002 as int) = ",p_seq  #PGS(D)-01534 add
               ,"  GROUP BY inap012"                         #170802-00050#1 add               
   PREPARE get_inap_pre FROM l_sql9             
   #170516-00005#1 add --(E)--
   
   #抓庫存量
   LET l_sql1 = " SELECT SUM(inag008) FROM inag_t ",
                "  WHERE inagent  = ",g_enterprise,
                "    AND inagsite = '",p_site,"' ",
                "    AND inag001  = '",p_item,"' ",
                "    AND inag002  = '",p_inan002,"' ",
               #"    AND inag003  = '",p_inan003,"' ",     #170110-00041#1 mark
                "    AND inag007  = '",l_unit,"' "
   LET l_sql10 = l_sql1    #210324-00031#1 add
   #170110-00041#1 add  --begin--
   IF NOT cl_null(p_inan003) THEN
      LET l_sql1 = l_sql1," AND inag003 = '",p_inan003,"' "
   END IF
   IF NOT cl_null(p_inan004) THEN
      LET l_sql1 = l_sql1," AND inag004 = '",p_inan004,"' "
   END IF
   IF NOT cl_null(p_inan005) THEN
      LET l_sql1 = l_sql1," AND inag005 = '",p_inan005,"' "
   END IF
   IF NOT cl_null(p_inan006) THEN
      IF NOT g_aic_continue THEN        #170619-00049#2 add
         LET l_sql1 = l_sql1," AND inag006 = '",p_inan006,"' "
      END IF                                            #170619-00049#2 add
   END IF
   #170110-00041#1 add  --end--
   
   #依據傳入的料件、產品特徵、庫存管理特徵、單位、庫位、儲位、批號抓取
  #LET l_sql2 = " SELECT SUM(inan010) FROM inan_t ", #170802-00050#1 mark
   #181127-00047#1 -S mark
   #LET l_sql2 = " SELECT     inan010  FROM inan_t ", #170802-00050#1 add inan_t是庫存在揀量統計檔,故不需要再SUM
   #             "  WHERE inanent  = ",g_enterprise,
   #181127-00047#1 -E mark
   #181127-00047#1 -S add
   #D-BAS-0070參數設定為Y，要將在揀量及備置量加起來
   IF l_para = 'Y' THEN
      LET l_sql2 = " SELECT SUM(inan010) FROM inan_t "
   ELSE
      LET l_sql2 = " SELECT     inan010  FROM inan_t "
   END IF
   LET l_sql2 = l_sql2,"  WHERE inanent  = ",g_enterprise,
   #181127-00047#1 -E add
                "    AND inansite = '",p_site,"' ",
#                "    AND inan000 = '1' ",   #mark--160408-00035#1 By shiun
                "    AND inan001  = '",p_item,"' ",
                "    AND inan002  = '",p_inan002,"' ",
               #"    AND inan003  = '",p_inan003,"' ",  #170110-00041#1 mark
                "    AND inan007  = '",l_unit,"' "
   #191021-00037#1---add---str---
   #在計算l_inan010時,需區分inan000(1:在揀,2:備置) 的抓法
   #1:在揀,需給庫/儲/批/庫存管理特徵條件
   #2:該顆料是imaf058:1:軟備置或2:硬備置的抓法,需區分
   #軟備置:不需給庫/儲/批/庫存管理特徵條件,一律給一個空白
   #硬備置:需給庫/儲/批/庫存管理特徵條件
   #
   #inan000:1:在揀==>需有庫存管理特徵/庫/儲/批的條件 
   LET l_sql2 = l_sql2," AND (( inan000 = '1' "
   #191021-00037#1---add---end---
                
   #170110-00041#1 add  --begin--
  #IF NOT cl_null(p_inan003) THEN                               #170802-00050#1 mark
      LET l_sql2 = l_sql2," AND inan003 = '",p_inan003,"' "
  #END IF                                                       #170802-00050#1 mark
  #IF NOT cl_null(p_inan004) THEN                               #170802-00050#1 mark
      LET l_sql2 = l_sql2," AND inan004 = '",p_inan004,"' "
  #END IF                                                       #170802-00050#1 mark
  #IF NOT cl_null(p_inan005) THEN                               #170802-00050#1 mark
      LET l_sql2 = l_sql2," AND inan005 = '",p_inan005,"' "
  #END IF                                                       #170802-00050#1 mark
  IF NOT g_aic_continue THEN        #170619-00049#2 add
  #IF NOT cl_null(p_inan006) THEN                               #170802-00050#1 mark
     LET l_sql2 = l_sql2," AND inan006 = '",p_inan006,"' "
  #END IF                                                       #170802-00050#1 mark
  END IF                                            #170619-00049#2 add
   #170110-00041#1 add  --end--
   
   #210324-00031#1 add-S
   #仅获取在拣资料
   LET l_sql11 = l_sql2,"))" 
   PREPARE get_pick_inan010_pre FROM l_sql11
   LET l_inan010_x = 0
   EXECUTE get_pick_inan010_pre INTO l_inan010_x
   IF cl_null(l_inan010_x) THEN LET l_inan010_x = 0 END IF
   #210324-00031#1 add-E
   
   #inan000:2:備置
   LET l_sql2 = l_sql2, " ) OR ( inan000 = '2' "
   IF l_imaf058 = '2' THEN
       #2:硬備置 
       LET l_sql2 = l_sql2,
                    " AND inan003 = '",p_inan003,"' ",   #庫存管理特徵
                    " AND inan004 = '",p_inan004,"' ",   #庫
                    " AND inan005 = '",p_inan005,"' "    #儲
       IF NOT g_aic_continue THEN
           LET l_sql2 = l_sql2,
                    " AND inan006 = '",p_inan006,"' "    #批
       END IF
   ELSE
       #1:軟備置 
       LET l_sql2 = l_sql2,
                    " AND inan003 = ' ' ",               #庫存管理特徵
                    " AND inan004 = ' ' ",               #庫
                    " AND inan005 = ' ' ",               #儲
                    " AND inan006 = ' ' "                #批
   END IF
   LET l_sql2 = l_sql2, " )) "
   #191021-00037#1---add---end---
                
   #add--160408-00035#1 By shiun--(S)
   #IF l_para = 'N' THEN  #參數為N表示只考慮備置,故增加過濾只抓inan000='2'的資料   #170601-00056#1 mark
   IF l_para = 'N' OR l_para IS NULL THEN      #170601-00056#1 add  #避免单别没有D-BAS-0070参数考虑了在捡量
      LET l_sql2 = l_sql2 CLIPPED," AND inan000 = '2' "
   END IF
   #add--160408-00035#1 By shiun--(E)
   PREPARE get_inag008_pre1 FROM l_sql1
   LET l_inag008 = ''
   EXECUTE get_inag008_pre1  INTO l_inag008
   IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
   
   #210324-00031#1 add-S
   #获取当前料号所有库储批的库存总和
   PREPARE get_inag008_sum_pre FROM l_sql10
   LET l_inag008_sum = 0
   EXECUTE get_inag008_sum_pre INTO l_inag008_sum
   IF cl_null(l_inag008_sum) THEN LET l_inag008 = 0 END IF
   #210324-00031#1 add-E
 
   #LET l_sql3 = l_sql2," AND inan004  = ' ' AND inan005 = ' ' AND inan006 = ' ' "   #170102-00004#1 mark
   #PREPARE get_inan008_pre1 FROM l_sql3  #170518-00055#1 mark
   PREPARE get_inan008_pre1 FROM l_sql2  #170518-00055#1
   LET l_inan010 = ''
   EXECUTE get_inan008_pre1 INTO l_inan010
   IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF

   #160408-00035#8---add---begin
  #LET l_sql6 = l_sql5," AND xmdr004  = ' ' AND xmdr005 = ' ' AND xmdr006 = ' ' "  #160822-00001#1 mark
  #PREPARE get_qty1_pre1 FROM l_sql6        #160822-00001#1 mark
   PREPARE get_qty1_pre1 FROM l_sql5        #160822-00001#1 add
   LET l_qty1 = ''
   EXECUTE get_qty1_pre1 INTO l_qty1
   IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
   IF l_qty1 = 0 THEN 
     #LET l_sql8 = l_sql7," AND sfbb004  = ' ' AND sfbb005 = ' ' AND sfbb006 = ' ' "  #160822-00001#1 mark
     #PREPARE get_qty1_pre12 FROM l_sql8              #160822-00001#1 mark                      
      PREPARE get_qty1_pre12 FROM l_sql7              #160822-00001#1 add                      
      LET l_qty1 = ''
      EXECUTE get_qty1_pre12 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
   END IF
   #160831-00005#1-s
   #IF l_para = 'Y' THEN  #參數為Y表示考慮在揀
   #    #加回去的數量 = 備置量 + (出貨量-備置量=在揀量)
   #    LET l_qty1 = l_qty1 + (l_qty - l_qty1)
   #END IF   
   #160831-00005#1-e
   #160408-00035#8---add---end
   #IF (l_inag008 + l_inap011 - l_inan010 - p_qty) < 0 THEN
   #IF (l_inag008 - l_inan010 - l_qty) < 0 THEN           #160408-00035#8
   #add--160919-00013#1 By shiun--(S)
   IF s_inventory_imaa004_chk(p_item) THEN
      RETURN r_success,r_flag
   END IF
   #add--160919-00013#1 By shiun--(E)  
   
   #170102-00004#1-S
   LET l_inaj011 = 0
   LET l_inaj012 = ''
   #EXECUTE get_inaj_pre INTO l_inaj011,l_inaj012  #171214-00016#1 mark
   EXECUTE get_inaj_pre USING p_seq,p_seq1 INTO l_inaj011,l_inaj012  #171214-00016#1 add
   IF cl_null(l_inaj011) THEN LET l_inaj011 = 0 END IF
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   IF NOT cl_null(l_inaj012) THEN
     #CALL s_inventory_unit(p_site,p_item,l_inaj012,l_inaj011,p_site)       #170724-00041#4 by sakura mark
      CALL s_inventory_unit(p_site,p_item,l_inaj012,l_inaj011,p_imafsite)   #170724-00041#4 by sakura add
           RETURNING r_success,l_unit,l_inaj011_qty          
   END IF          
   #170102-00004#1-E
   IF cl_null(l_inaj011_qty) THEN LET l_inaj011_qty = 0 END IF #170209-00027#1
   
   #170516-00005#1 add --(S)--
   #單據本身的在撿量
   LET l_inap010 = ''
   LET l_inap011 = 0
   EXECUTE get_inap_pre INTO l_inap010,l_inap011
   IF cl_null(l_inap011) THEN LET l_inap011 = 0 END IF
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   IF NOT cl_null(l_inap010) THEN
     #CALL s_inventory_unit(p_site,p_item,l_inap010,l_inap011,p_site)       #170724-00041#4 by sakura mark
      CALL s_inventory_unit(p_site,p_item,l_inap010,l_inap011,p_imafsite)   #170724-00041#4 by sakura add
           RETURNING r_success,l_unit,l_inap011_qty          
   END IF          
   
   IF cl_null(l_inap011_qty) THEN LET l_inap011_qty = 0 END IF

   IF l_para = 'Y' THEN
      LET l_inaj011_qty = l_inaj011_qty + l_inap011_qty
   END IF
   #170516-00005#1 add --(E)--
   #210324-00031#1 mark-S
#   #IF (l_inag008 + l_qty1 - l_inan010 - l_qty) < 0 THEN   #160408-00035#8    #170102-00004#1 mark
#   IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     #170102-00004#1
   #210324-00031#1 mark-E
   #210324-00031#1 add-S
   #如果是软备置，则检查：1.传入库储批的库存量 - 在拣量(扣除本身) - 需求量 >0 2.传入料号的所有库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
   #如果是硬备置，则检查：传入库储批的库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
   IF (l_imaf058 = '1' AND ((l_inag008 + l_inaj011_qty - l_inan010_x - l_qty < 0) OR (l_inag008_sum + l_qty1 + l_inaj011_qty - l_inan010 - l_qty < 0))) 
   OR (l_imaf058 <> '1' AND (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0) THEN
   #210324-00031#1 add-E
      LET r_flag = 0
      INITIALIZE g_errparam TO NULL
      IF l_para = 'Y' THEN                   #170516-00005#1 add
         LET g_errparam.code = 'sub-00633'      #sub-00445->sub-00633 mod zhangllc
      #170516-00005#1 add --(S)--
      ELSE
         LET g_errparam.code = 'sub-01447'
      END IF
      #170516-00005#1 add --(E)--
     #LET g_errparam.extend = p_item    #180807-00049#1   #190722-00026#1 mark
      LET g_errparam.extend = l_extend                    #190722-00026#1 add
      LET g_errparam.replace[1] = p_seq      #add zhangllc
      LET g_errparam.replace[2] = p_item     #add zhangllc
      LET g_errparam.popup = TRUE
      IF g_prog <> 'asft310_01' THEN   #170602-00036#1 add
         CALL cl_err()
      END IF                           #170602-00036#1 add   
      RETURN r_success,r_flag
   END IF

   #若單據申請時只有指定到庫位時，那抓取庫存量時
   #需SUM該庫位底下所有儲位、批號的總庫存量
   IF NOT cl_null(p_inan004) THEN
      LET l_sql4 = l_sql1," AND inag004 = '",p_inan004,"' "
      PREPARE get_inag008_pre2 FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre2 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      #170619-00049#2-s add
      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = ' ' "
      ELSE
      #170619-00049#2-e add
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = ' ' AND inan006 = ' ' "
      END IF #170619-00049#2 add   
      PREPARE get_inan008_pre2 FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre2 INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
      
      #160408-00035#8---add---begin
     #LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = ' ' AND xmdr006 = ' ' " #160822-00001#1 mark
      LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"'"                                      #160822-00001#1 add
      PREPARE get_qty1_pre2 FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre2 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN 
        #LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = ' ' AND sfbb006 = ' ' "  #160822-00001#1 mark
         LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"'"                                       #160822-00001#1 add
         PREPARE get_qty1_pre22 FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre22 INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF 
      #160831-00005#1-s
      #IF l_para = 'Y' THEN  #參數為Y表示考慮在揀
      #    #加回去的數量 = 備置量 + (出貨量-備置量=在揀量)
      #    LET l_qty1 = l_qty1 + (l_qty - l_qty1)
      #END IF       
      #160831-00005#1-e
      #160408-00035#8---add---end      
      
      #IF (l_inag008 + l_inap011 - l_inan010 - p_qty) < 0 THEN
      #IF (l_inag008 - l_inan010 - l_qty) < 0 THEN            #160408-00035#8
      #add--160919-00013#1 By shiun--(S)
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
      #add--160919-00013#1 By shiun--(E)
      #210324-00031#1 mark-S
#      #IF (l_inag008 + l_qty1 - l_inan010 - l_qty) < 0 THEN   #160408-00035#8  #170102-00004#1 mark
#      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     #170102-00004#1
      #210324-00031#1 mark-E
      #210324-00031#1 add-S
      #如果是软备置，则检查：1.传入库储批的库存量 - 在拣量(扣除本身) - 需求量 >0 2.传入料号的所有库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
      #如果是硬备置，则检查：传入库储批的库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
      IF (l_imaf058 = '1' AND ((l_inag008 + l_inaj011_qty - l_inan010_x - l_qty < 0) OR (l_inag008_sum + l_qty1 + l_inaj011_qty - l_inan010 - l_qty < 0))) 
      OR (l_imaf058 <> '1' AND (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0) THEN
      #210324-00031#1 add-E
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   #170516-00005#1 add
            LET g_errparam.code = 'sub-00633'      #sub-00445->sub-00633 mod zhangllc
         #170516-00005#1 add --(S)--
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF
         #170516-00005#1 add --(E)--   
        #LET g_errparam.extend = p_item    #180807-00049#1   #190722-00026#1 mark
         LET g_errparam.extend = l_extend                    #190722-00026#1 add
         LET g_errparam.replace[1] = p_seq      #add zhangllc
         LET g_errparam.replace[2] = p_item     #add zhangllc
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   #170602-00036#1 add
            CALL cl_err()
         END IF                           #170602-00036#1 add
         RETURN r_success,r_flag
      END IF
   END IF
   
   #若單據申請時只有指定到庫位、儲位時
   #那抓取庫存量時需SUM該庫位與儲位底下所有批號的總庫存量
   IF NOT cl_null(p_inan005) THEN
     #LET l_sql4 = l_sql4," AND inag005 = '",p_inan005,"' " #170810-00054#1 mark
      LET l_sql4 = l_sql1," AND inag005 = '",p_inan005,"' " #170810-00054#1 add
      PREPARE get_inag008_pre3 FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre3 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      #170619-00049#2-s add
      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' "
      ELSE
      #170619-00049#2-e add
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' AND inan006 = ' ' "
      END IF #170619-00049#2 add   
      PREPARE get_inan008_pre3 FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre3 INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF

      #160408-00035#8---add---begin
     #LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"' AND xmdr006 = ' ' "  #160822-00001#1 mark
      LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"'"                     #160822-00001#1 add
      PREPARE get_qty1_pre3 FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre3 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN 
        #LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' AND sfbb006 = ' ' " #160822-00001#1 mark
         LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' "                   #160822-00001#1 add
         PREPARE get_qty1_pre32 FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre32 INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF        
      #160831-00005#1-s
      #IF l_para = 'Y' THEN  #參數為Y表示考慮在揀
      #    #加回去的數量 = 備置量 + (出貨量-備置量=在揀量)
      #    LET l_qty1 = l_qty1 + (l_qty - l_qty1)
      #END IF      
      #160831-00005#1-e
      #160408-00035#8---add---end

      #IF (l_inag008 + l_inap011 - l_inan010 - p_qty) < 0 THEN
      #IF (l_inag008 - l_inan010 - l_qty) < 0 THEN           #160408-00035#8
      #add--160919-00013#1 By shiun--(S)
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
      #add--160919-00013#1 By shiun--(E)
      #210324-00031#1 mark-S
#      #IF (l_inag008 + l_qty1 - l_inan010 - l_qty) < 0 THEN   #160408-00035#8  #170102-00004#1 mark
#      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     #170102-00004#1
      #210324-00031#1 mark-E
      #210324-00031#1 add-S
      #如果是软备置，则检查：1.传入库储批的库存量 - 在拣量(扣除本身) - 需求量 >0 2.传入料号的所有库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
      #如果是硬备置，则检查：传入库储批的库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
      IF (l_imaf058 = '1' AND ((l_inag008 + l_inaj011_qty - l_inan010_x - l_qty < 0) OR (l_inag008_sum + l_qty1 + l_inaj011_qty - l_inan010 - l_qty < 0))) 
      OR (l_imaf058 <> '1' AND (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0) THEN
      #210324-00031#1 add-E
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   #170516-00005#1 add
            LET g_errparam.code = 'sub-00633'      #sub-00445->sub-00633 mod zhangllc
         #170516-00005#1 add --(S)--
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF
         #170516-00005#1 add --(E)--   
        #LET g_errparam.extend = p_item    #180807-00049#1   #190722-00026#1 mark
         LET g_errparam.extend = l_extend                    #190722-00026#1 add
         LET g_errparam.replace[1] = p_seq      #add zhangllc
         LET g_errparam.replace[2] = p_item     #add zhangllc
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   #170602-00036#1 add
            CALL cl_err()
         END IF                           #170602-00036#1 add   
         RETURN r_success,r_flag
      END IF
   END IF
   
   #若單據申請時指定到庫位，儲位、批號時，那抓取庫存量時
   #需直接抓該庫位、儲位、批號的庫存量
   IF NOT cl_null(p_inan006) THEN
     #LET l_sql4 = l_sql4," AND inag006 = '",p_inan006,"' "   #170810-00054#1 mark      
      IF NOT g_aic_continue THEN                              #170619-00049#2 add
         LET l_sql4 = l_sql1," AND inag006 = '",p_inan006,"' "   #170810-00054#1 add
      END IF                                                  #170619-00049#2 add
      PREPARE get_inag008_pre4 FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre4 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
      #170619-00049#2-s add
      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' "      
      ELSE
      #170619-00049#2-e add
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' AND inan006 = '",p_inan006,"' "
      END IF                                                  #170619-00049#2 add   
      PREPARE get_inan008_pre4 FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre4 INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
      
      #160408-00035#8---add---begin
      #170619-00049#2-s add
      IF g_aic_continue THEN
         LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"' "      
      ELSE
      #170619-00049#2-e add      
         LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"' AND xmdr006 = '",p_inan006,"' "
      END IF                                                  #170619-00049#2 add      
      PREPARE get_qty1_pre4 FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre4 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN 
         #170619-00049#2-s add
         IF g_aic_continue THEN         
            LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' "           
         ELSE
         #170619-00049#2-e add
            LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' AND sfbb006 = '",p_inan006,"' "
         END IF                                                  #170619-00049#2 add         
         PREPARE get_qty1_pre42 FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre42 INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF   
      #160831-00005#1-s
      #IF l_para = 'Y' THEN  #參數為Y表示考慮在揀
      #    #加回去的數量 = 備置量 + (出貨量-備置量=在揀量)
      #    LET l_qty1 = l_qty1 + (l_qty - l_qty1)
      #END IF      
      #160831-00005#1-e
      #160408-00035#8---add---end
      
      #IF (l_inag008 + l_inap011 - l_inan010 - p_qty) < 0 THEN
      #IF (l_inag008 - l_inan010 - l_qty) < 0 THEN            #160408-00035#8
      #add--160919-00013#1 By shiun--(S)
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
      #add--160919-00013#1 By shiun--(E)
      #210324-00031#1 mark-S
#      #IF (l_inag008 + l_qty1 - l_inan010 - l_qty) < 0 THEN   #160408-00035#8  #170102-00004#1 mark
#      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     #170102-00004#1
      #210324-00031#1 mark-E
      #210324-00031#1 add-S
      #如果是软备置，则检查：1.传入库储批的库存量 - 在拣量(扣除本身) - 需求量 >0 2.传入料号的所有库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
      #如果是硬备置，则检查：传入库储批的库存量 - 所有在拣备置量(扣除本身) - 需求量 > 0
      IF (l_imaf058 = '1' AND ((l_inag008 + l_inaj011_qty - l_inan010_x - l_qty < 0) OR (l_inag008_sum + l_qty1 + l_inaj011_qty - l_inan010 - l_qty < 0))) 
      OR (l_imaf058 <> '1' AND (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0) THEN
      #210324-00031#1 add-E
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   #170516-00005#1 add
            LET g_errparam.code = 'sub-00633'      #sub-00445->sub-00633 mod zhangllc
         #170516-00005#1 add --(S)--
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF
         #170516-00005#1 add --(E)--  
        #LET g_errparam.extend = p_item    #180807-00049#1   #190722-00026#1 mark
         LET g_errparam.extend = l_extend                    #190722-00026#1 add        
         LET g_errparam.replace[1] = p_seq      #add zhangllc
         LET g_errparam.replace[2] = p_item     #add zhangllc
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   #170602-00036#1 add
            CALL cl_err()
         END IF                           #170602-00036#1 add
         RETURN r_success,r_flag
      END IF
   END IF
   
   #170303-00054#1-s
   IF NOT s_inventory_chk_inao(p_docno,p_seq,p_seq1) THEN
      LET r_flag = 0
      RETURN r_success,r_flag
   END IF
   #170303-00054#1-e

   LET r_flag = 1
   RETURN r_success,r_flag

END FUNCTION

################################################################################
# Descriptions...: 新增庫存需求等候明細黨
# Memo...........:
# Usage..........: CALL s_inventory_ins_inas(p_site,p_docno,p_seq,p_seq1,p_seq2,p_inas009,p_inas010,p_inas013,p_inas014,p_docdt,p_inas016,p_inas017)
#                       RETURNING r_success
# Input parameter: 1.p_site     LIKE inas_t.inassite  營運據點
#                  2.p_docno    LIKE inas_t.inas001   單據編號
#                  3.p_seq      LIKE inas_t.inas002   單據項次
#                  4.p_seq1     LIKE inas_t.inas003   單據項序
#                  5.p_seq2     LIKE inas_t.inas004   單據分批序
#                  6.p_inas009  LIKE inas_t.inas009   料件編號
#                  7.p_inas010  LIKE inas_t.inas010   產品特徵
#                  8.p_inas013  LIKE inas_t.inas013   交易單位
#                  9.p_inas014  LIKE inas_t.inas014   原始需求數量
#                  10.p_docdt   LIKE inas_t.inas015   需求日期
#                  11.p_inas016 LIKE inas_t.inas016   負責人員    
#                  12.p_inas017 LIKE inas_t.inas017   負責部門 
# Return code....: r_success    处理状态TRUE/FALSE
# Date & Author..: 14/07/31 By xianghui
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_ins_inas(p_site,p_docno,p_seq,p_seq1,p_seq2,p_inas009,p_inas010,p_inas013,p_inas014,p_docdt,p_inas016,p_inas017)
DEFINE p_site     LIKE inas_t.inassite,
       p_docno    LIKE inas_t.inas001,
       p_seq      LIKE inas_t.inas002,
       p_seq1     LIKE inas_t.inas003,
       p_seq2     LIKE inas_t.inas004,
       p_inas009  LIKE inas_t.inas009,
       p_inas010  LIKE inas_t.inas010,
       p_inas013  LIKE inas_t.inas013,
       p_inas014  LIKE inas_t.inas014,
       p_docdt    LIKE inas_t.inas015,
       p_inas016  LIKE inas_t.inas016,
       p_inas017  LIKE inas_t.inas017,
       r_success  LIKE type_t.num5
DEFINE l_imaf058  LIKE imaf_t.imaf058
DEFINE l_imaa006  LIKE imaa_t.imaa006
DEFINE l_success  LIKE type_t.num5
DEFINE l_ooba002  LIKE ooba_t.ooba002
DEFINE l_rate     LIKE inaj_t.inaj014
DEFINE l_inas     RECORD 
       inasent  LIKE inas_t.inasent, 
       inassite LIKE inas_t.inassite,
       inas001  LIKE inas_t.inas001, 
       inas002  LIKE inas_t.inas002, 
       inas003  LIKE inas_t.inas003, 
       inas004  LIKE inas_t.inas004, 
       inas005  DATETIME YEAR TO SECOND, 
       inas006  DATETIME YEAR TO SECOND, 
       inas007  LIKE inas_t.inas007, 
       inas008  LIKE inas_t.inas008, 
       inas009  LIKE inas_t.inas009, 
       inas010  LIKE inas_t.inas010, 
       inas011  LIKE inas_t.inas011, 
       inas012  LIKE inas_t.inas012, 
       inas013  LIKE inas_t.inas013, 
       inas014  LIKE inas_t.inas014, 
       inas015  LIKE inas_t.inas015, 
       inas016  LIKE inas_t.inas016, 
       inas017  LIKE inas_t.inas017 
      END RECORD
      
      
   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_inas009) OR cl_null(p_docno) OR
   #   cl_null(p_seq) OR cl_null(p_seq1) OR cl_null(p_seq2) THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   RETURN r_success  
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inas009) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas009") RETURNING g_colname_1,g_comment_1   #料件編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_docno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas001") RETURNING g_colname_1,g_comment_1   #需求單號
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas002") RETURNING g_colname_1,g_comment_1   #項次
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas003") RETURNING g_colname_1,g_comment_1   #項序
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq2) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq200","lbl_inas004") RETURNING g_colname_1,g_comment_1   #分批序
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
   #170816-00007#1 by 02159 add(E)  
   
   IF cl_null(p_site) THEN
      LET p_site = g_site
   END IF
   
   SELECT imaf058 INTO l_imaf058 
     FROM imaf_t 
    WHERE imafent = g_enterprise 
      AND imafsite = p_site 
      AND imaf001 = p_inas009
   IF l_imaf058 <> '3' OR l_imaf058 IS NULL THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00602'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success       
   END IF
   
   LET l_inas.inasent = g_enterprise
   LET l_inas.inassite = p_site
   LET l_inas.inas001 = p_docno
   LET l_inas.inas002 = p_seq
   LET l_inas.inas003 = p_seq1
   LET l_inas.inas004 = p_seq2
   LET l_inas.inas005 = cl_get_current()
   LET l_inas.inas006 = l_inas.inas005
   
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_ooba002
   SELECT oobx003 INTO l_inas.inas007
     FROM oobx_t
    WHERE oobxent = g_enterprise
      AND oobx001 = l_ooba002   
      
   LET l_inas.inas008 = g_prog
   LET l_inas.inas009 = p_inas009
   LET l_inas.inas010 = p_inas010
   LET l_inas.inas011 = p_inas014
   
   SELECT imaa006 INTO l_imaa006
     FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = p_inas009   
   #modify--2015/01/08 By shiun--(S)
#   CALL s_aimi190_get_convert(p_inas009,p_inas013,l_imaa006) RETURNING l_success,l_rate
#   LET l_inas.inas012 = p_inas014 * l_rate
   CALL s_aooi250_convert_qty(p_inas009,p_inas013,l_imaa006,p_inas014)
        RETURNING l_success,l_inas.inas012
   #modify--2015/01/08 By shiun--(E)
   LET l_inas.inas013 = p_inas013
   LET l_inas.inas014 = p_inas014
   LET l_inas.inas015 = p_docdt
   LET l_inas.inas016 = p_inas016
   LET l_inas.inas017 = p_inas017
   
   INSERT INTO inas_t(inasent,inassite,inas001,inas002,inas003,inas004,inas005,inas006,inas007,inas008,
                      inas009, inas010,inas011,inas012,inas013,inas014,inas015,inas016,inas017)  
              VALUES (l_inas.*)
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "inas_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 更新庫存需求等候排隊數量
# Memo...........:
# Usage..........: CALL s_inventory_upd_inas(p_site,p_docno,p_seq,p_seq1,p_seq2,p_inas009,p_inas010,p_inas013,p_inas014,p_type)
#                       RETURNING r_success
# Input parameter: 1.p_site     LIKE inas_t.inassite  營運據點
#                  2.p_docno    LIKE inas_t.inas001   單據編號
#                  3.p_seq      LIKE inas_t.inas002   單據項次
#                  4.p_seq1     LIKE inas_t.inas003   單據項序
#                  5.p_seq2     LIKE inas_t.inas004   單據分批序
#                  6.p_inas009  LIKE inas_t.inas009   料件編號
#                  7.p_inas010  LIKE inas_t.inas010   產品特徵
#                  8.p_inas013  LIKE inas_t.inas013   交易單位
#                  9.p_inas014  LIKE inas_t.inas014   原始需求數量
#                  10.p_type    LIKE type_t.chr2      1(增加排隊數量，通常用在過帳還原)、-1(減少排隊需求數量，通常用在庫存過帳)
# Return code....: r_success    处理状态TRUE/FALSE
# Date & Author..: 14/07/31 By xianghui
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_upd_inas(p_site,p_docno,p_seq,p_seq1,p_seq2,p_inas009,p_inas010,p_inas013,p_inas014,p_type)
DEFINE p_site      LIKE inas_t.inassite,
       p_docno     LIKE inas_t.inas001,
       p_seq       LIKE inas_t.inas002,
       p_seq1      LIKE inas_t.inas003,
       p_seq2      LIKE inas_t.inas004,
       p_inas009   LIKE inas_t.inas009,
       p_inas010   LIKE inas_t.inas010,
       p_inas013   LIKE inas_t.inas013,
       p_inas014   LIKE inas_t.inas014,
       p_type      LIKE type_t.chr2,
       r_success   LIKE type_t.num5
DEFINE l_imaf058   LIKE imaf_t.imaf058,
       l_cnt       LIKE type_t.num5,
       l_sql       STRING,
       l_imaa006   LIKE imaa_t.imaa006,
       l_success   LIKE type_t.num5,
       l_rate      LIKE inaj_t.inaj014,
       l_inas011   LIKE inas_t.inas011,
       l_inas011_1 LIKE inas_t.inas011,
       l_inas012   LIKE inas_t.inas012       
       
   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_inas009) OR cl_null(p_docno) OR
   #   cl_null(p_seq) OR cl_null(p_seq1) OR cl_null(p_seq2) THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   RETURN r_success  
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inas009) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas009") RETURNING g_colname_1,g_comment_1   #料件編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_docno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas001") RETURNING g_colname_1,g_comment_1   #需求單號
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas002") RETURNING g_colname_1,g_comment_1   #項次
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas003") RETURNING g_colname_1,g_comment_1   #項序
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq2) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq200","lbl_inas004") RETURNING g_colname_1,g_comment_1   #分批序
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
   #170816-00007#1 by 02159 add(E)  
   
   IF cl_null(p_site) THEN
      LET p_site = g_site
   END IF
   
   SELECT imaf058 INTO l_imaf058 
     FROM imaf_t 
    WHERE imafent = g_enterprise 
      AND imafsite = p_site 
      AND imaf001 = p_inas009
   IF l_imaf058 <> '3' OR l_imaf058 IS NULL THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00602'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success       
   END IF

   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt
     FROM inas_t
    WHERE inasent = g_enterprise
      AND inassite = p_site
      AND inas001 = p_docno
      AND inas002 = p_seq
      AND inas003 = p_seq1
      AND inas004 = p_seq2
   IF l_cnt = 0 THEN 
      LET l_sql = "SELECT inarent,inarsite,inar001,inar002,inar003,inar004,inar005,inar006,inar007,inar008,inar009,",
                  "       inar010,0,0,inar011,inar012,inar013,inar014,inar015 ",
                  "  FROM inar_t ",
                  " WHERE inarent = '",g_enterprise,"'",
                  "   AND inarsite = '",p_site,"'",
                  "   AND inar001 = '",p_docno,"'",
                 #171214-00016#1-S mark
                  #"   AND inar002 = '",p_seq,"'",
                  #"   AND inar003 = '",p_seq1,"'",
                  #"   AND inar004 = '",p_seq2,"'"
                 #171214-00016#1-E mark 
                 #171214-00016#1-S add
                  "   AND inar002 = ",p_seq,
                  "   AND inar003 = ",p_seq1,
                  "   AND inar004 = ",p_seq2                
                 #171214-00016#1-E add
      LET l_sql = "INSERT INTO inas_t(inasent,inassite,inas001,inas002,inas003,inas004,inas005,inas006,inas007,inas008,inas009,",
                  "  inas010,inas011,inas012,inas013,inas014,inas015,inas016,inas017) ",l_sql
      PREPARE ins_inas FROM l_sql
      EXECUTE ins_inas 
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins inas_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF      
   END IF
   
   LET l_inas011 = p_inas014
   
   SELECT imaa006 INTO l_imaa006
     FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = p_inas009
   #modify--2015/01/08 By shiun--(S)      
#   CALL s_aimi190_get_convert(p_inas009,p_inas013,l_imaa006) RETURNING l_success,l_rate
#   LET l_inas012 = p_inas014 * l_rate 
   CALL s_aooi250_convert_qty(p_inas009,p_inas013,l_imaa006,p_inas014)
        RETURNING l_success,l_inas012
   #modify--2015/01/08 By shiun--(E)

   IF p_type = '1' THEN 
      UPDATE inas_t 
         SET inas011 = inas011 + l_inas011,
             inas012 = inas012 + l_inas012
       WHERE inasent = g_enterprise
         AND inassite = p_site
         AND inas001 = p_docno
         AND inas002 = p_seq
         AND inas003 = p_seq1
         AND inas004 = p_seq2 
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "upd inas_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF         
   END IF
   IF p_type = '-1' THEN 
      UPDATE inas_t 
         SET inas011 = inas011 - l_inas011,
             inas012 = inas012 - l_inas012
       WHERE inasent = g_enterprise
         AND inassite = p_site
         AND inas001 = p_docno
         AND inas002 = p_seq
         AND inas003 = p_seq1
         AND inas004 = p_seq2
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "upd inas_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF           
   END IF 

   SELECT inas011 INTO l_inas011_1
     FROM inas_t
    WHERE inasent = g_enterprise
      AND inassite = p_site
      AND inas001 = p_docno
      AND inas002 = p_seq
      AND inas003 = p_seq1
      AND inas004 = p_seq2 
   IF l_inas011_1 <= 0 THEN 
     DELETE FROM inar_t
      WHERE inarent = g_enterprise
        AND inarsite = p_site
        AND inar001 = p_docno
        AND inar002 = p_seq
        AND inar003 = p_seq1
        AND inar004 = p_seq2 
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del inar_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF          
      LET l_sql = "SELECT inasent,inassite,inas001,inas002,inas003,inas004,inas005,inas006,inas007,inas008,inas009,",
                  "       inas010,inas013,inas014,inas015,inas016,inas017 ",
                  "  FROM inas_t ",
                  " WHERE inasent = '",g_enterprise,"'",
                  "   AND inassite = '",p_site,"'",
                  "   AND inas001 = '",p_docno,"'",
                #171214-00016#1-S mark  
                  #"   AND inas002 = '",p_seq,"'",
                  #"   AND inas003 = '",p_seq1,"'",
                  #"   AND inas004 = '",p_seq2,"'"
                #171214-00016#1-E mark 
                #171214-00016#1-S add 
                  "   AND inas002 = ",p_seq,
                  "   AND inas003 = ",p_seq1,
                  "   AND inas004 = ",p_seq2
                #171214-00016#1-E add                 
      LET l_sql = "INSERT INTO inar_t(inarent,inarsite,inar001,inar002,inar003,inar004,inar005,inar006,inar007,inar008,inar009,",
                  "  inar010,inar011,inar012,inar013,inar014,inar015) ",l_sql
      PREPARE ins_inar FROM l_sql
      EXECUTE ins_inar
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins inar_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF       

      DELETE FROM inas_t 
       WHERE inasent = g_enterprise
         AND inassite = p_site
         AND inas001 = p_docno
         AND inas002 = p_seq
         AND inas003 = p_seq1
         AND inas004 = p_seq2  
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del inas_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success
      END IF       
   END IF
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 刪除庫存需求等候明細檔
# Memo...........:
# Usage..........: CALL s_inventory_del_inas(p_site,p_inas001,p_inas002,p_inas003,p_inas004)
#                  RETURNING r_success
# Input parameter: p_site         營運據點(空值時給g_site)
#                : p_inas001      單號
#                : p_inas002      項次
#                : p_inas003      項序(無項序時須傳0)
#                : p_inas004      分批序(無分批序時須傳0)
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2015/01/15 By stellar
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_del_inas(p_site,p_inas001,p_inas002,p_inas003,p_inas004)
DEFINE p_site               LIKE inas_t.inassite
DEFINE p_inas001            LIKE inas_t.inas001
DEFINE p_inas002            LIKE inas_t.inas002
DEFINE p_inas003            LIKE inas_t.inas003
DEFINE p_inas004            LIKE inas_t.inas004
DEFINE r_success            LIKE type_t.num5
DEFINE l_inas009            LIKE inas_t.inas009
DEFINE l_imaf058            LIKE imaf_t.imaf058

   WHENEVER ERROR CONTINUE
   
   LET r_success = TRUE
  
   IF cl_null(p_inas001) OR cl_null(p_inas002) OR cl_null(p_inas003) OR cl_null(p_inas004) THEN
      LET r_success = FALSE
      
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00643'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = p_inas001
      LET g_errparam.replace[2] = p_inas002
      LET g_errparam.replace[3] = p_inas003
      LET g_errparam.replace[4] = p_inas004
      CALL cl_err()
      
      RETURN r_success
   END IF
   
   IF cl_null(p_site) THEN
      LET p_site = g_site
   END IF
   
   #檢查料件的存貨備置策略是否為3.需求等候模式，不是的話不往下執行
   LET l_inas009 = ''
   SELECT inas009 INTO l_inas009
     FROM inas_t
    WHERE inasent = g_enterprise
      AND inassite= p_site
      AND inas001 = p_inas001
      AND inas002 = p_inas002
      AND inas003 = p_inas003
      AND inas004 = p_inas004
   LET l_imaf058 = ''
   SELECT imaf058 INTO l_imaf058
     FROM imaf_t
    WHERE imafent = g_enterprise
      AND imafsite= p_site
      AND imaf001 = l_inas009
   IF l_imaf058 = '3' THEN
      #刪除庫存需求等候明細檔(inas_t)
      DELETE FROM inas_t
       WHERE inasent = g_enterprise
         AND inassite= p_site
         AND inas001 = p_inas001
         AND inas002 = p_inas002
         AND inas003 = p_inas003
         AND inas004 = p_inas004
      IF SQLCA.sqlcode THEN
         LET r_success = FALSE
      
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00644'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.sqlerr = SQLCA.sqlcode
         CALL cl_err()
         
         RETURN r_success
      END IF
      
      #刪除庫存需求等候歷史明細檔(inar_t)
      DELETE FROM inar_t
       WHERE inarent = g_enterprise
         AND inarsite= p_site
         AND inar001 = p_inas001
         AND inar002 = p_inas002
         AND inar003 = p_inas003
         AND inar004 = p_inas004
      IF SQLCA.sqlcode THEN
         LET r_success = FALSE
      
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00645'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.sqlerr = SQLCA.sqlcode
         CALL cl_err()
         
         RETURN r_success
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 檢查目前需求單排隊的順序需求量是否有足夠庫存
# Memo...........:
# Usage..........: CALL s_inventory_check_inas(p_site,p_docno,p_seq,p_seq1,p_seq2,p_inas009,p_inas010,p_inas013,p_inas011)
#                       RETURNING r_success
# Input parameter: 1.p_site     LIKE inas_t.inassite  營運據點
#                  2.p_docno    LIKE inas_t.inas001   單據編號
#                  3.p_seq      LIKE inas_t.inas002   單據項次
#                  4.p_seq1     LIKE inas_t.inas003   單據項序
#                  5.p_seq2     LIKE inas_t.inas004   單據分批序
#                  6.p_inas009  LIKE inas_t.inas009   料件編號
#                  7.p_inas010  LIKE inas_t.inas010   產品特徵
#                  8.p_inas013  LIKE inas_t.inas013   交易單位
#                  9.p_inas011  LIKE inas_t.inas011   異動數量
# Return code....: r_success    处理状态TRUE/FALSE
# Date & Author..: 14/07/31 By xianghui
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_check_inas(p_site,p_docno,p_seq,p_seq1,p_seq2,p_inas009,p_inas010,p_inas013,p_inas011)
DEFINE p_site         LIKE inas_t.inassite
DEFINE p_docno        LIKE inas_t.inas001
DEFINE p_seq          LIKE inas_t.inas002
DEFINE p_seq1         LIKE inas_t.inas003
DEFINE p_seq2         LIKE inas_t.inas004
DEFINE p_inas009      LIKE inas_t.inas009
DEFINE p_inas010      LIKE inas_t.inas010
DEFINE p_inas013      LIKE inas_t.inas013
DEFINE p_inas011      LIKE inas_t.inas011
DEFINE r_success      LIKE type_t.num5
DEFINE l_imaf058      LIKE imaf_t.imaf058
DEFINE l_inag033_sum  LIKE inag_t.inag033
DEFINE l_inas012_sum  LIKE inas_t.inas012
DEFINE l_inas006      LIKE inas_t.inas006
DEFINE l_imaa006      LIKE imaa_t.imaa006
DEFINE l_success      LIKE type_t.num5
DEFINE l_rate         LIKE inaj_t.inaj014
DEFINE l_inas011      LIKE inas_t.inas011
DEFINE l_msg          STRING                #180424-00044#1
DEFINE l_extend       STRING                #180424-00044#1
       
   WHENEVER ERROR CONTINUE
   LET r_success = FALSE
   
   IF cl_null(p_site) THEN
      LET p_site = g_site
   END IF
   
   #170816-00007#1 by 02159 mark(S)
   #IF cl_null(p_inas009) OR cl_null(p_docno) OR
   #   cl_null(p_seq) OR cl_null(p_seq1) OR cl_null(p_seq2) THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-00280'
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   RETURN r_success  
   #END IF
   #170816-00007#1 by 02159 mark(E)
   
   #170816-00007#1 by 02159 add(S)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_inas009) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas009") RETURNING g_colname_1,g_comment_1   #料件編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_docno) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas001") RETURNING g_colname_1,g_comment_1   #需求單號
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas002") RETURNING g_colname_1,g_comment_1   #項次
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq1) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas003") RETURNING g_colname_1,g_comment_1   #項序
      IF g_msg IS NULL THEN
         LET g_msg = g_colname_1
      ELSE
	 LET g_msg = g_msg,",",g_colname_1
      END IF
   END IF
   IF cl_null(p_seq2) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aini110","lbl_inas004") RETURNING g_colname_1,g_comment_1   #分批序
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
   #170816-00007#1 by 02159 add(E)  
   
   #180424-00044#1-s
   INITIALIZE g_errparam TO NULL
   LET l_msg = cl_getmsg('axc-00318',g_lang)
   LET g_errparam.replace[1] = p_docno
   LET g_errparam.replace[2] = p_seq
   LET g_errparam.replace[3] = p_seq1
   LET g_errparam.replace[4] = p_seq2
   LET l_extend = cl_getmsg('axm-00219',g_lang)
   LET l_extend = l_msg,p_inas009,"+",l_extend
   #180424-00044#1-e
   
   SELECT imaf058 INTO l_imaf058 
     FROM imaf_t 
    WHERE imafent = g_enterprise 
      AND imafsite = p_site 
      AND imaf001 = p_inas009
   IF l_imaf058 <> '3' OR l_imaf058 IS NULL THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00602'
      LET g_errparam.extend = l_extend  #180424-00044#1
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success       
   END IF 

   SELECT SUM(inag033) INTO l_inag033_sum
     FROM inag_t
    WHERE inagent = g_enterprise
      AND inagsite = p_site
      AND inag001 = p_inas009
      AND inag002 = p_inas010
      AND inag010 <> 'N'
   IF cL_null(l_inag033_sum) THEN 
      LET l_inag033_sum = 0
   END IF
   
   SELECT inas006 INTO l_inas006 
     FROM inas_t 
    WHERE inasent = g_enterprise
      AND inassite = p_site
      AND inas001 = p_docno
      AND inas002 = p_seq
      AND inas003 = p_seq1
      AND inas004 = p_seq2  
      
   SELECT sum(inas012) INTO l_inas012_sum
     FROM inas_t
    WHERE inasent = g_enterprise
      AND inassite = p_site
      AND inas009 = p_inas009
      AND inas010 = p_inas010   
      AND inas006 < l_inas006 
      #AND NOT EXISTS (SELECT * FROM inas_t 
      #                 WHERE inasent = g_enterprise
      #                   AND inassite = p_site
      #                   AND inas001 = p_docno
      #                   AND inas002 = p_seq
      #                   AND inas003 = p_seq1
      #                   AND inas004 = p_seq2 )    
   IF cL_null(l_inas012_sum) THEN 
      LET l_inas012_sum = 0
   END IF   

   SELECT imaa006 INTO l_imaa006
     FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = p_inas009   
   #modify--2015/01/08 By shiun--(S)
#   CALL s_aimi190_get_convert(p_inas009,p_inas013,l_imaa006) RETURNING l_success,l_rate
#   LET l_inas011 = p_inas011 * l_rate
   CALL s_aooi250_convert_qty(p_inas009,p_inas013,l_imaa006,p_inas011)
        RETURNING l_success,l_inas011
   #modify--2015/01/08 By shiun--(E)
   IF l_inag033_sum < l_inas012_sum + l_inas011 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00603'
      LET g_errparam.extend = l_extend  #180424-00044#1
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success 
   END IF
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 庫存單據過帳還原時檢核是否已經有對應的已結算的VMI交易
# Memo...........:
# Usage..........: CALL s_inventory_check_vmi(p_docno,p_site)
#                  RETURNING r_success
# Input parameter: p_docno     單據編號
#                : p_site      營運據點
# Return code....: r_success   處理狀態
# Date & Author..: 14/09/18 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_check_vmi(p_docno,p_site)
DEFINE p_docno      LIKE inaj_t.inaj001
DEFINE p_site       LIKE inaj_t.inajsite
DEFINE r_success    LIKE type_t.num5
DEFINE l_cnt        LIKE type_t.num5


   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   #檢查傳入的單據編號是否有值，若沒有則顯示錯誤訊息並不允許往下執行，並回傳失敗
   IF cl_null(p_docno) THEN
      INITIALIZE g_errparam TO NULL
      #LET g_errparam.code = 'sub-00351'#160321-00016#18 mark
      LET g_errparam.code = 'sub-00228' #160321-00016#18 add
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   IF cl_null(p_site) THEN
      LET p_site = g_site
   END IF

   #依據傳入的單據編號檢核所有對應的inaj_t資料，看是否已經有inaj030='2:VMI已結算'的資料
   LET l_cnt = 0
   SELECT COUNT(1) INTO l_cnt FROM inaj_t
    WHERE inajent  = g_enterprise
      AND inajsite = p_site
      AND inaj001  = p_docno
      AND inaj030 = '2'
   #只要有及顯示錯誤訊息告知對應的VMI交易已經結算不可以過帳還原，必回傳失敗
   IF l_cnt <> 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00621'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 判斷若異動的庫位為VMI存貨庫位且不是採購入庫/倉退時則需自動產生雜收發單
#                  且自動insert一筆雜收發單的inaj資料
# Memo...........:
# Usage..........: CALL s_inventory_ins_inba()
#                  RETURNING r_success
# Input parameter: no
# Return code....: TRUE OR FALSE
# Date & Author..: 14/09/19 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_ins_inba()
DEFINE r_success    LIKE type_t.num5
DEFINE l_inba  RECORD                  #雜項庫存異動單頭檔
    inbaent    LIKE inba_t.inbaent,    #企業編號
    inbasite   LIKE inba_t.inbasite,   #營運據點
    inbadocno  LIKE inba_t.inbadocno,  #單據編號
    inbadocdt  LIKE inba_t.inbadocdt,  #輸入日期
    inba001    LIKE inba_t.inba001,    #單據類別
    inba002    LIKE inba_t.inba002,    #扣帳日期
    inba003    LIKE inba_t.inba003,    #申請人員
    inba004    LIKE inba_t.inba004,    #申請部門
    inba005    LIKE inba_t.inba005,    #來源資料類型
    inba006    LIKE inba_t.inba006,    #來源單號
    inba007    LIKE inba_t.inba007,    #理由碼
    inba008    LIKE inba_t.inba008,    #備註
    inbaownid  LIKE inba_t.inbaownid,  #資料所有者
    inbaowndp  LIKE inba_t.inbaowndp,  #資料所屬部門
    inbacrtid  LIKE inba_t.inbacrtid,  #資料建立者
    inbacrtdp  LIKE inba_t.inbacrtdp,  #資料建立部門
    inbacrtdt  LIKE inba_t.inbacrtdt,  #資料創建日
    inbacnfid  LIKE inba_t.inbacnfid,  #資料確認者
    inbacnfdt  LIKE inba_t.inbacnfdt,  #資料確認日
    inbapstid  LIKE inba_t.inbapstid,  #資料過帳者
    inbapstdt  LIKE inba_t.inbapstdt,  #資料過帳日
    inbastus   LIKE inba_t.inbastus    #狀態碼
           END RECORD
DEFINE l_inbb  RECORD                  #雜項庫存異動申請明細檔
    inbbent	   LIKE inbb_t.inbbent,	   #企業編號		
    inbbsite	LIKE inbb_t.inbbsite,   #營運據點		
    inbbdocno	LIKE inbb_t.inbbdocno,	#單據編號	
    inbbseq	   LIKE inbb_t.inbbseq,	   #項次			
    inbb001	   LIKE inbb_t.inbb001,	   #料件編號		
    inbb002	   LIKE inbb_t.inbb002,	   #產品特徵		
    inbb003	   LIKE inbb_t.inbb003,	   #庫存管理特徵	
    inbb007	   LIKE inbb_t.inbb007,	   #庫位			
    inbb008	   LIKE inbb_t.inbb008,	   #限定儲位		
    inbb009	   LIKE inbb_t.inbb009,	   #限定批號		
    inbb010	   LIKE inbb_t.inbb010,	   #交易單位		
    inbb011	   LIKE inbb_t.inbb011,	   #申請數量		
    inbb012	   LIKE inbb_t.inbb012,	   #實際異動數量	
    inbb013	   LIKE inbb_t.inbb013,	   #參考單位		
    inbb014	   LIKE inbb_t.inbb014,	   #參考單位申請數量
    inbb015	   LIKE inbb_t.inbb015,	   #參考單位實際數量
    inbb016	   LIKE inbb_t.inbb016,	   #理由碼		
    inbb017	   LIKE inbb_t.inbb017,	   #來源單號	
    inbb018	   LIKE inbb_t.inbb018,    #檢驗否
    inbb019	   LIKE inbb_t.inbb019     #170330-00069#1 add    
           END RECORD
DEFINE l_inbc  RECORD
    inbcent    LIKE inbc_t.inbcent,
    inbcsite   LIKE inbc_t.inbcsite,
    inbcdocno  LIKE inbc_t.inbcdocno,
    inbcseq    LIKE inbc_t.inbcseq,
    inbcseq1   LIKE inbc_t.inbcseq1,
    inbc001    LIKE inbc_t.inbc001,
    inbc002    LIKE inbc_t.inbc002,
    inbc003    LIKE inbc_t.inbc003,
    inbc005    LIKE inbc_t.inbc005,
    inbc006    LIKE inbc_t.inbc006,
    inbc007    LIKE inbc_t.inbc007,
    inbc009    LIKE inbc_t.inbc009,
    inbc010    LIKE inbc_t.inbc010,
    inbc011    LIKE inbc_t.inbc011,
    inbc015    LIKE inbc_t.inbc015  
           END RECORD
DEFINE l_success    LIKE type_t.num5
DEFINE l_inaj001    LIKE inaj_t.inaj001  #備份
DEFINE l_inaj002    LIKE inaj_t.inaj002  #備份
DEFINE l_inaj003    LIKE inaj_t.inaj003  #備份
DEFINE l_inaj015    LIKE inaj_t.inaj015  #備份
DEFINE l_inaj030    LIKE inaj_t.inaj030  #備份
DEFINE l_slip     LIKE ooba_t.ooba002


   LET r_success = TRUE

   LET l_inba.inbadocno = ''
   SELECT inbadocno INTO l_inba.inbadocno
     FROM inba_t
    WHERE inbaent = g_inaj.inajent
      AND inba006 = g_inaj.inaj001
      AND inbastus = 'S'
   IF cl_null (l_inba.inbadocno) THEN   
      INITIALIZE l_inba.* TO NULL
      LET l_inba.inbaent   = g_inaj.inajent
      LET l_inba.inbasite  = g_inaj.inajsite
      LET l_inba.inbadocdt = g_today
      #依據據點參數設置的VMI對應雜收、雜發單別產生雜收發單資料
      IF g_inaj.inaj004 = '1' THEN  #入庫
         LET l_inba.inba001 = '2'   #雜收
         CALL cl_get_para(g_inaj.inajent,g_inaj.inajsite,'S-BAS-0045')
              RETURNING l_slip
         CALL s_aooi200_gen_docno(g_inaj.inajsite,l_slip,g_today,'aint302')
              RETURNING l_success,l_inba.inbadocno
      ELSE                          #出庫
         LET l_inba.inba001 = '1'   #雜發
         CALL cl_get_para(g_inaj.inajent,g_inaj.inajsite,'S-BAS-0046')
              RETURNING l_slip
         CALL s_aooi200_gen_docno(g_inaj.inajsite,l_slip,g_today,'aint301')
              RETURNING l_success,l_inba.inbadocno
      END IF
      IF NOT l_success THEN
         LET r_success = FALSE
         RETURN r_success
      END IF
      LET l_inba.inba002   = g_inaj.inaj022
      LET l_inba.inba003   = g_user
      LET l_inba.inba004   = g_dept
      LET l_inba.inba005   = '3'             #資料來源=VMI轉入
      LET l_inba.inba006   = g_inaj.inaj001  #來源單號=異動單據編號
      LET l_inba.inba007   = g_inaj.inaj016
      CALL s_aooi360_sel('6',l_inba.inbadocno,'','','','','','','','','','4')  #備註
           RETURNING l_success,l_inba.inba008
      LET l_inba.inbaownid = g_user
      LET l_inba.inbaowndp = g_dept
      LET l_inba.inbacrtid = g_user
      LET l_inba.inbacrtdp = g_dept
      LET l_inba.inbacrtdt = cl_get_current()
      LET l_inba.inbacnfid = g_user
      LET l_inba.inbacnfdt = cl_get_current()
      LET l_inba.inbapstid = g_user
      LET l_inba.inbapstdt = cl_get_current()
      LET l_inba.inbastus  = 'S'             #已經確認過帳狀態
      INSERT INTO inba_t(inbaent,inbasite,inbadocno,inbadocdt,inba001,
                         inba002,inba003,inba004,inba005,inba006,inba008,
                         inbaownid,inbaowndp,inbacrtid,inbacrtdp,inbacrtdt,
                         inbacnfid,inbacnfdt,inbapstid,inbapstdt,inbastus)
             VALUES(l_inba.inbaent,l_inba.inbasite,l_inba.inbadocno,l_inba.inbadocdt,l_inba.inba001,
                    l_inba.inba002,l_inba.inba003,l_inba.inba004,l_inba.inba005,l_inba.inba006,l_inba.inba008,
                    l_inba.inbaownid,l_inba.inbaowndp,l_inba.inbacrtid,l_inba.inbacrtdp,l_inba.inbacrtdt,
                    l_inba.inbacnfid,l_inba.inbacnfdt,l_inba.inbapstid,l_inba.inbapstdt,l_inba.inbastus)
      IF SQLCA.sqlcode  THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins inba_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   INITIALIZE l_inbb.* TO NULL
   SELECT MAX(inbbseq)+1 INTO l_inbb.inbbseq
     FROM inbb_t
    WHERE inbbent = g_inaj.inajent
      AND inbbdocno = l_inba.inbadocno
   IF cl_null(l_inbb.inbbseq) THEN
      LET l_inbb.inbbseq = '1'
   END IF
   LET l_inbb.inbbent	= g_inaj.inajent
   LET l_inbb.inbbsite	= g_inaj.inajsite
   LET l_inbb.inbbdocno	= l_inba.inbadocno
   LET l_inbb.inbb001	= g_inaj.inaj005
   LET l_inbb.inbb002	= g_inaj.inaj006
   LET l_inbb.inbb003	= g_inaj.inaj007
   LET l_inbb.inbb007	= g_inaj.inaj008
   LET l_inbb.inbb008	= g_inaj.inaj009
   LET l_inbb.inbb009	= g_inaj.inaj010
   LET l_inbb.inbb010	= g_inaj.inaj012
   LET l_inbb.inbb011	= g_inaj.inaj011
   LET l_inbb.inbb012	= g_inaj.inaj011
   LET l_inbb.inbb013	= g_inaj.inaj026
   LET l_inbb.inbb014	= g_inaj.inaj027
   LET l_inbb.inbb015	= g_inaj.inaj027
   LET l_inbb.inbb016	= g_inaj.inaj016
   LET l_inbb.inbb017	= g_inaj.inaj001
   LET l_inbb.inbb018	= 'N'
   LET l_inbb.inbb019   = l_inbb.inbb011   #170330-00069#1 add
   INSERT INTO inbb_t(inbbent,inbbsite,inbbdocno,inbbseq,
                      inbb001,inbb002,inbb003,inbb007,inbb008,
                      inbb009,inbb010,inbb011,inbb012,inbb013,
                      inbb014,inbb015,inbb016,inbb017,inbb018,inbb019)  #170330-00069#1 add inbb019 
          VALUES(l_inbb.inbbent,l_inbb.inbbsite,l_inbb.inbbdocno,l_inbb.inbbseq,
                 l_inbb.inbb001,l_inbb.inbb002,l_inbb.inbb003,l_inbb.inbb007,l_inbb.inbb008,
                 l_inbb.inbb009,l_inbb.inbb010,l_inbb.inbb011,l_inbb.inbb012,l_inbb.inbb013,
                 l_inbb.inbb014,l_inbb.inbb015,l_inbb.inbb016,l_inbb.inbb017,l_inbb.inbb018,l_inbb.inbb019)  #170330-00069#1 add inbb019 
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins inbb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   INITIALIZE l_inbc.* TO NULL
   SELECT MAX(inbcseq1)+1 INTO l_inbc.inbcseq1
     FROM inbc_t
    WHERE inbcent = g_inaj.inajent
      AND inbcdocno = l_inba.inbadocno
      AND inbcseq = l_inbb.inbbseq
   IF cl_null(l_inbc.inbcseq1) THEN
      LET l_inbc.inbcseq1 = '1'
   END IF
   LET l_inbc.inbcent	= g_inaj.inajent
   LET l_inbc.inbcsite	= g_inaj.inajsite
   LET l_inbc.inbcdocno	= l_inba.inbadocno
   LET l_inbc.inbcseq	= l_inbb.inbbseq
   LET l_inbc.inbc001	= g_inaj.inaj005
   LET l_inbc.inbc002	= g_inaj.inaj006
   LET l_inbc.inbc003	= g_inaj.inaj007
   LET l_inbc.inbc005	= g_inaj.inaj008
   LET l_inbc.inbc006	= g_inaj.inaj009
   LET l_inbc.inbc007	= g_inaj.inaj010
   LET l_inbc.inbc009	= g_inaj.inaj012
   LET l_inbc.inbc010	= g_inaj.inaj011
   LET l_inbc.inbc011	= g_inaj.inaj026
   LET l_inbc.inbc015	= g_inaj.inaj027
   
   INSERT INTO inbc_t(inbcent,inbcsite,inbcdocno,inbcseq,inbcseq1,
                      inbc001,inbc002,inbc003,inbc005,inbc006,
                      inbc007,inbc009,inbc010,inbc011,inbc015)
          VALUES(l_inbc.inbcent,l_inbc.inbcsite,l_inbc.inbcdocno,l_inbc.inbcseq,l_inbc.inbcseq1,
                 l_inbc.inbc001,l_inbc.inbc002,l_inbc.inbc003,l_inbc.inbc005,l_inbc.inbc006,
                 l_inbc.inbc007,l_inbc.inbc009,l_inbc.inbc010,l_inbc.inbc011,l_inbc.inbc015)
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins inbc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   #將產生的雜收發單號與項次更新到步驟1所產生的VMI結算庫位對應的inaj的inaj033與inaj034欄位上
   UPDATE inaj_t
      SET inaj033 = l_inba.inbadocno,
          inaj034 = l_inbb.inbbseq
    WHERE inajent = g_inaj.inajent
      AND inajsite = g_inaj.inajsite
      AND inaj001 = g_inaj.inaj001
      AND inaj002 = g_inaj.inaj002
      AND inaj003 = g_inaj.inaj003
      AND inaj004 = g_inaj.inaj004
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "upd inaj_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   LET l_inaj001 = g_inaj.inaj001
   LET l_inaj002 = g_inaj.inaj002
   LET l_inaj003 = g_inaj.inaj003
   LET l_inaj015 = g_inaj.inaj015
   LET l_inaj030 = g_inaj.inaj030
   LET g_inaj.inaj001 = l_inba.inbadocno
   LET g_inaj.inaj002 = l_inbb.inbbseq
   LET g_inaj.inaj003 = l_inbc.inbcseq1
   #將異動作業與單據性質更新為雜收發單
   IF g_inaj.inaj004 = '1' THEN  #入庫
      LET g_inaj.inaj015 = 'aint302'
   ELSE                          #出庫
      LET g_inaj.inaj015 = 'aint301'
   END IF
   #將VMI結算否改成'0:非VMI結算'
   LET g_inaj.inaj030 = '0'
   
   #161124-00048#15 mod-S
#      INSERT INTO inaj_t VALUES(g_inaj.*)
      ####
      INSERT INTO inaj_t(inajent,inajsite,inaj001,inaj002,inaj003,
                         inaj004,inaj005,inaj006,inaj007,inaj008,
                         inaj009,inaj010,inaj011,inaj012,inaj013,
                         inaj014,inaj015,inaj016,inaj017,inaj018,
                         inaj019,inaj020,inaj021,inaj022,inaj023,
                         inaj024,inaj025,inaj026,inaj027,inaj028,
                         inaj036,inaj029,inaj030,inaj031,inaj032,
                         inaj033,inaj034,inaj035,inaj037,inaj038,
                         inaj039,inaj040,inaj041,inaj042,inaj043,
                         inaj044,inaj200,inaj201,inaj202,inaj203,
                         inaj204,inaj205,inaj206,inaj207,inaj208,
                         inaj209,inaj045,inaj046,inaj047,inaj048,
                         inaj049,inaj050,inaj051,inaj210,inaj211)
                  VALUES(g_inaj.inajent,g_inaj.inajsite,g_inaj.inaj001,g_inaj.inaj002,g_inaj.inaj003,
                         g_inaj.inaj004,g_inaj.inaj005,g_inaj.inaj006,g_inaj.inaj007,g_inaj.inaj008,
                         g_inaj.inaj009,g_inaj.inaj010,g_inaj.inaj011,g_inaj.inaj012,g_inaj.inaj013,
                         g_inaj.inaj014,g_inaj.inaj015,g_inaj.inaj016,g_inaj.inaj017,g_inaj.inaj018,
                         g_inaj.inaj019,g_inaj.inaj020,g_inaj.inaj021,g_inaj.inaj022,g_inaj.inaj023,
                         g_inaj.inaj024,g_inaj.inaj025,g_inaj.inaj026,g_inaj.inaj027,g_inaj.inaj028,
                         g_inaj.inaj036,g_inaj.inaj029,g_inaj.inaj030,g_inaj.inaj031,g_inaj.inaj032,
                         g_inaj.inaj033,g_inaj.inaj034,g_inaj.inaj035,g_inaj.inaj037,g_inaj.inaj038,
                         g_inaj.inaj039,g_inaj.inaj040,g_inaj.inaj041,g_inaj.inaj042,g_inaj.inaj043,
                         g_inaj.inaj044,g_inaj.inaj200,g_inaj.inaj201,g_inaj.inaj202,g_inaj.inaj203,
                         g_inaj.inaj204,g_inaj.inaj205,g_inaj.inaj206,g_inaj.inaj207,g_inaj.inaj208,
                         g_inaj.inaj209,g_inaj.inaj045,g_inaj.inaj046,g_inaj.inaj047,g_inaj.inaj048,
                         g_inaj.inaj049,g_inaj.inaj050,g_inaj.inaj051,g_inaj.inaj210,g_inaj.inaj211)
      #161124-00048#15 mod-E
   IF SQLCA.sqlcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins inaj_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
  #实时成本运算功能,若当前设置非"实时成本模式"时,返回TRUE
  CALL s_cost_realtime_cal()
       RETURNING l_success
  IF NOT l_success THEN
     LET r_success = FALSE
  END IF   
   
   LET g_inaj.inaj001 = l_inaj001
   LET g_inaj.inaj002 = l_inaj002
   LET g_inaj.inaj003 = l_inaj003
   LET g_inaj.inaj015 = l_inaj015
   LET g_inaj.inaj030 = l_inaj030

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 判斷料件/商品是否為聯營/租賃或費用商品,若符合後續不做庫存扣帳
# Memo...........:
# Usage..........: CALL s_inventory_chk_prod(p_prod_id,p_org_id)
#                  RETURNING r_success
# Input parameter: p_prod_id      料件/商品編號
#                : p_org_id       組織編號
# Return code....: r_success      判斷結果, TURE-後續不做庫存扣帳, FALSE-後續要進行庫存扣帳
# Date & Author..: 2015/08/20 By Lori
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_chk_prod(p_prod_id,p_org_id)
   DEFINE p_prod_id   LIKE imaa_t.imaa001
   DEFINE p_org_id    LIKE ooef_t.ooef001
   DEFINE r_success   LIKE type_t.num5
   DEFINE l_site      LIKE ooef_t.ooef001   
   DEFINE l_rtdx003   LIKE rtdx_t.rtdx003   
   DEFINE l_imaa004   LIKE imaa_t.imaa004   

   WHENEVER ERROR CONTINUE
   
   LET r_success = ''
   LET l_site = ''
   LET l_rtdx003 = ''
   LET l_imaa004 = ''

   IF cl_null(p_org_id) OR p_org_id = 'ALL' THEN
      LET l_site = g_site
   ELSE
      LET l_site = p_org_id
   END IF

   SELECT imaa004 INTO l_imaa004
    FROM imaa_t
   WHERE imaaent = g_enterprise
     AND imaa001 = p_prod_id

   SELECT rtdx003 INTO l_rtdx003
     FROM rtdx_t
    WHERE rtdxent = g_enterprise
      AND rtdxsite = l_site
      AND rtdx001 = p_prod_id

   IF l_imaa004 = 'E' OR l_rtdx003 MATCHES "[45]" THEN
      LET r_success = TRUE
   ELSE
      LET r_success = FALSE
   END IF

   RETURN r_success 
END FUNCTION

################################################################################
# Descriptions...: 判斷料號料件類別(imaa004)是否為E.費用/軟體
# Memo...........: 160919-00013#1
# Usage..........: CALL s_inventory_imaa004_chk(p_item)
#                  RETURNING r_success
# Input parameter: p_item     料件編號
# Return code....: r_success  TRUE/FALSE
# Date & Author..: 2016/10/07 By shiun
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_imaa004_chk(p_item)
   DEFINE p_item     LIKE imaa_t.imaa001
   DEFINE r_success  LIKE type_t.num5
   DEFINE l_imaa004  LIKE imaa_t.imaa004
   
   LET r_success = FALSE
   
   LET l_imaa004 = ''
   SELECT imaa004 INTO l_imaa004
     FROM imaa_t
    WHERE imaaent = g_enterprise
      AND imaa001 = p_item
   
   IF l_imaa004 = 'E' THEN
      LET r_success = TRUE
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 制造批序号库存量
# Memo...........:
# Usage..........: CALL s_inventory_chk_inao(p_inaodocno,p_inaoseq,p_inaoseq1)
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: #170303-00054#1 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_chk_inao(p_inaodocno,p_inaoseq,p_inaoseq1)
DEFINE p_inaodocno  LIKE inao_t.inaodocno
DEFINE p_inaoseq    LIKE inao_t.inaoseq
DEFINE p_inaoseq1   LIKE inao_t.inaoseq1
DEFINE r_success    LIKE type_t.num5
DEFINE l_inao  RECORD
    inaosite   LIKE inao_t.inaosite,  #營運據點
    inao001    LIKE inao_t.inao001,   #料件編號
    inao002    LIKE inao_t.inao002,   #產品特徵
    inao003    LIKE inao_t.inao003,   #庫存管理特徵
    inao005    LIKE inao_t.inao005,   #庫位
    inao006    LIKE inao_t.inao006,   #儲位
    inao007    LIKE inao_t.inao007,   #批號
    inao008    LIKE inao_t.inao008,   #製造批號
    inao009    LIKE inao_t.inao009,   #製造序號
    inao012    LIKE inao_t.inao012,   #數量
    inao014    LIKE inao_t.inao014    #庫存單位
           END RECORD
DEFINE l_inai010    LIKE inai_t.inai010
DEFINE l_inao012    LIKE inao_t.inao012
#171218-00024#2-s-add
DEFINE l_xmdk044    LIKE xmdk_t.xmdk044  #多角編號
DEFINE l_site       LIKE inao_t.inaosite #營運據點
DEFINE l_inao005    LIKE inao_t.inao005  #庫位
DEFINE l_inao006    LIKE inao_t.inao006  #儲位
DEFINE l_direct_chk LIKE type_t.num5    #記錄是否正拋
DEFINE l_aic      RECORD
          icab003   LIKE icab_t.icab003,
          icac007   LIKE icac_t.icac007,
          icad004   LIKE icad_t.icad004,
          icad005   LIKE icad_t.icad005
       END RECORD
#171218-00024#2-e-add

   LET r_success = TRUE
   
   #171218-00024#2-s-add
   #取得多角編號
   LET l_xmdk044 = ''
   SELECT xmdk044 INTO l_xmdk044
     FROM xmdk_t
    WHERE xmdkent = g_enterprise
      AND xmdkdocno = p_inaodocno
   #判斷是否正拋
   LET l_direct_chk = FALSE
   INITIALIZE l_aic.* TO NULL
   IF NOT cl_null(l_xmdk044) THEN
      #取得最終站的aici100相關資料設定
      CALL s_aic_carry_direct_chk(l_xmdk044) RETURNING l_direct_chk,l_aic.*
   END IF
   #171218-00024#2-e-add
   DECLARE sel_inao_cur CURSOR FOR
      SELECT inao001,inao002,inao003,inao005,inao006,inao007,inao008,inao009,inao012,inao014,inaosite
        FROM inao_t
       WHERE inaodocno = p_inaodocno
         AND inaoseq = p_inaoseq
        #AND inaoseq1 = p_inaoseq1
         AND inao000 = '2'
         AND inao013 = '-1'
         AND inaoent = g_enterprise
   FOREACH sel_inao_cur
      INTO l_inao.inao001,l_inao.inao002,l_inao.inao003,l_inao.inao005,l_inao.inao006,
           l_inao.inao007,l_inao.inao008,l_inao.inao009,l_inao.inao012,l_inao.inao014,
           l_inao.inaosite
      
      #171218-00024#2-s-add
      IF l_direct_chk THEN
         #若為正拋，應檢查最終站製造批序號庫存是否足夠
         LET l_site = l_aic.icab003     #營運據點
         LET l_inao005 = l_aic.icad004  #庫位
         LET l_inao006 = l_aic.icad005  #儲位
      ELSE         
         LET l_site = l_inao.inaosite   #營運據點
         LET l_inao005 = l_inao.inao005 #庫位 
         LET l_inao006 = l_inao.inao006 #儲位    
      END IF
      #171218-00024#2-e-add
      
      LET l_inai010 = 0
      SELECT inai010 INTO l_inai010
        FROM inai_t
       WHERE inai001 = l_inao.inao001
         AND inai002 = l_inao.inao002
         AND inai003 = l_inao.inao003
        #AND inai004 = l_inao.inao005   #171218-00024#2-mark
        #AND inai005 = l_inao.inao006   #171218-00024#2-mark
         AND inai004 = l_inao005        #171218-00024#2-add
         AND inai005 = l_inao006        #171218-00024#2-add
         AND inai006 = l_inao.inao007
         AND inai007 = l_inao.inao008
         AND COALESCE(inai008,' ') = COALESCE(l_inao.inao009,' ')
         AND inai009 = l_inao.inao014
        #AND inaisite = l_inao.inaosite #171218-00024#2-mark
         AND inaisite = l_site          #171218-00024#2-add
         AND inaient = g_enterprise
      IF cl_null(l_inai010) THEN LET l_inai010 = 0 END IF
      
      LET l_inao012 = 0
      SELECT SUM(inao012) INTO l_inao012
        FROM inao_t
       WHERE inao001 = l_inao.inao001
         AND inao002 = l_inao.inao002
         AND inao003 = l_inao.inao003
         AND inao005 = l_inao.inao005
         AND inao006 = l_inao.inao006
         AND inao007 = l_inao.inao007
         AND inao008 = l_inao.inao008
         AND inao009 = l_inao.inao009
         AND inao013 = '-1'
         AND inao014 = l_inao.inao014
         AND inao000 = '2'
         AND inaosite = l_inao.inaosite
         AND inaoent = g_enterprise
         AND NOT EXISTS (SELECT 1 FROM inal_t
                          WHERE inalent = inaoent
                            AND inalsite = inaosite
                            AND inal001 = inaodocno
                            AND inal002 = inaoseq
                            AND inal003 = inaoseq1
                            AND inal004 = inaoseq2
                            AND inal005 = inao013)
      IF cl_null(l_inao012) THEN LET l_inao012 = 0 END IF
      
      IF l_inai010-l_inao012 < 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00775'
         LET g_errparam.replace[1] = l_inao.inao001
         LET g_errparam.replace[2] = l_inao.inao002
         LET g_errparam.replace[3] = l_inao.inao003
         LET g_errparam.replace[4] = l_inao.inao005
         LET g_errparam.replace[5] = l_inao.inao006
         LET g_errparam.replace[6] = l_inao.inao007
         LET g_errparam.replace[7] = l_inao.inao008
         LET g_errparam.replace[8] = l_inao.inao009
         LET g_errparam.replace[9] = l_inao.inao014
         LET g_errparam.extend = p_inaodocno,"|",p_inaoseq,"|",p_inaoseq1
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 單據作廢或刪除時同步刪除製造批序號庫存異動明細檔
# Memo...........:
# Usage..........: CALL s_inventory_del_inao(p_inaodocno)
#                  RETURNING r_success
# Input parameter: 
# Return code....: 
# Date & Author..: #170303-00054#1 By 04441
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_del_inao(p_inaodocno)
DEFINE p_inaodocno  LIKE inao_t.inaodocno
DEFINE r_success    LIKE type_t.num5

   LET r_success = TRUE
   
   IF cl_null(p_inaodocno) THEN
      RETURN r_success
   END IF
   
   DELETE FROM inao_t
    WHERE inaoent = g_enterprise
      AND inaodocno = p_inaodocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "DELETE FORM inao_t",SQLERRMESSAGE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   RETURN r_success
END FUNCTION
# # ################################################################################
# # # Descriptions...: 写入inbr_t[库存异动暂存档]资料
# # # Memo...........:
# # # Usage..........: CALL s_inventory_ins_inbr(p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_type,p_qty,p_date,p_docno,p_seq1,p_seq2,p_inag007,p_imafsite,p_inaj035)
# # #                       RETURNING r_success
# # # Input parameter: 1.p_inag001   LIKE inag_t.inag001  料件编号
# # #                  2.p_inag002   LIKE inag_t.inag002  产品特征
# # #                  3.p_inag003   LIKE inag_t.inag003  库存管理特征
# # #                  4.p_inag004   LIKE inag_t.inag004  库位
# # #                  5.p_inag005   LIKE inag_t.inag005  储位
# # #                  6.p_inag006   LIKE inag_t.inag006  批号
# # #                  7.p_type      LIKE type_t.chr2     异动类型  1:入库 -1:出库 0:报废 2:盘点
# # #                  8.p_qty       LIKE inag_t.inag008  异动数量
# # #                  9.p_date      LIKE inag_t.inag015  异动日期
# # #                  10.p_docno    LIKE type_t.chr20    单据编号    
# # #                  11.p_seq1     LIKE type_t.num5     项次
# # #                  12.p_seq2     LIKE type_t.num5     项序   
# # #                  13.p_inag007  LIKE inag_t.inag007  单位
# # #                  14.p_imafsite LIKE imaf_t.imafsite 營運據點 (流通作業一律傳入ALL,製造傳入g_site或‘’)
# # #                  15.p_inaj035  LIKE inaj_t.inaj035  异动作业编号
# # # Return code....: r_success     处理状态TRUE/FALSE
# # # Date & Author..: #171113-00003#1 add
# # ################################################################################
PUBLIC FUNCTION s_inventory_ins_inbr(p_inag001,p_inag002,p_inag003,p_inag004,p_inag005,p_inag006,p_type,p_qty,p_date,p_docno,p_seq1,p_seq2,p_inag007,p_imafsite,p_inaj035)
DEFINE p_inag001      LIKE inag_t.inag001   #料件编号
DEFINE p_inag002      LIKE inag_t.inag002   #产品特征
DEFINE p_inag003      LIKE inag_t.inag003   #库存管理特征
DEFINE p_inag004      LIKE inag_t.inag004   #库位
DEFINE p_inag005      LIKE inag_t.inag005   #储位
DEFINE p_inag006      LIKE inag_t.inag006   #批号
DEFINE p_type         LIKE type_t.chr2      #异动类型  1:入库, -1:出库, 0:报废, 2:盘点
DEFINE p_qty          LIKE inag_t.inag008   #异动数量
DEFINE p_date         LIKE inag_t.inag015   #异动日期
DEFINE p_docno        LIKE type_t.chr20     #单据编号
DEFINE p_seq1         LIKE type_t.num5      #项次
DEFINE p_seq2         LIKE type_t.num5      #项序 
DEFINE p_inag007      LIKE inag_t.inag007   #单位
DEFINE p_imafsite     LIKE imaf_t.imafsite  #營運據點 (流通作業一律傳入ALL, 製造傳入g_site 或‘’)
DEFINE p_inaj035      LIKE inaj_t.inaj035   #异动作业编号
DEFINE r_success      LIKE type_t.num5      #处理状态TRUE/FALSE
DEFINE l_n            LIKE type_t.num5
DEFINE l_inbrcrtdt    DATETIME YEAR TO SECOND

    LET r_success = TRUE
    LET l_n = 0
    
    IF cl_null(p_imafsite) THEN
       LET p_imafsite = g_site
    END IF
    
    SELECT COUNT(1) INTO l_n FROM inbr_t
       WHERE inbrent = g_enterprise AND inbrsite = p_imafsite AND inbr001 = p_type
         AND inbr011 = p_docno AND inbr012 = p_seq1 AND inbr013 = p_seq2
    IF l_n = 0 OR cl_null(l_n) THEN
       LET l_inbrcrtdt = cl_get_current()
       INSERT INTO inbr_t(inbrent,inbrsite,inbr001,inbr002,inbr003,inbr004,inbr005,inbr006,inbr007,inbr008,
                          inbr009,inbr010,inbr011,inbr012,inbr013,inbr014,inbrcrtid,inbrcrtdt)
          VALUES(g_enterprise,p_imafsite,p_type,p_inag001,p_inag002,p_inag004,p_inag005,p_inag006,p_inag003,p_inag007,
                 p_qty,p_date,p_docno,p_seq1,p_seq2,p_inaj035,g_user,l_inbrcrtdt)                
       IF SQLCA.SQLCODE THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = "ins inbr_t"
          LET g_errparam.code = SQLCA.SQLCODE 
          LET g_errparam.popup = TRUE 
          CALL cl_err()
          LET r_success = FALSE
          RETURN r_success
       END IF   
    END IF
    RETURN r_success
    
END FUNCTION
################################################################################
# Descriptions...: 檢核庫存在揀量和備置量應用元件
# Memo...........:
# Usage..........: CALL s_inventory_check_inan_axmt540(p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_docno_from,p_seq_from,p_imafsite)
#                  RETURNING r_success,r_flag
# Input parameter: p_site      營運據點
#                : p_item      料件編號
#                : p_inan002   產品特徵
#                : p_inan003   庫存管理特徵
#                : p_inan004   庫位
#                : p_inan005   儲位
#                : p_inan006   批號
#                : p_unit      交易單位
#                : p_qty       數量
#                : p_docno     單據編號
#                : p_seq       項次
#                : p_seq1      項序
#                : p_docno_from 訂單單號/工單單號   
#                : p_seq_from   訂單項次/工單項次   
#                : p_imafsite   營運據點(流通作業一律傳入ALL,製造傳入g_site或‘’) 
# Return code....: r_success   處理狀態
#                : r_flag      庫存量足夠否(1:庫存足夠/0:庫存不足)
# Date & Author..: 19/04/25 By 06021
# Modify.........: #190417-00053#1 add
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_check_inan_axmt540(p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_docno_from,p_seq_from,p_imafsite)
DEFINE p_site       LIKE inan_t.inansite
DEFINE p_item       LIKE inan_t.inan001
DEFINE p_inan002    LIKE inan_t.inan002
DEFINE p_inan003    LIKE inan_t.inan003
DEFINE p_inan004    LIKE inan_t.inan004
DEFINE p_inan005    LIKE inan_t.inan005
DEFINE p_inan006    LIKE inan_t.inan006
DEFINE p_unit       LIKE inan_t.inan007
DEFINE p_qty        LIKE inan_t.inan010
DEFINE p_docno      LIKE inap_t.inap001
DEFINE p_seq        LIKE inap_t.inap002
#DEFINE p_seq1       LIKE inap_t.inap003   #PGS(D)-01534 mark
DEFINE p_seq1       LIKE inaj_t.inaj003    #PGS(D)-01534 add
DEFINE p_docno_from LIKE inap_t.inap001    #訂單單號/工單單號   
#DEFINE p_seq_from   LIKE inap_t.inap002    #訂單項次/工單項次   #PGS(D)-01534 mark 
DEFINE p_seq_from   LIKE inaj_t.inaj002    #訂單項次/工單項次    #PGS(D)-01534 add 
DEFINE p_imafsite   LIKE imaf_t.imafsite   #流通作業一律傳入ALL,製造傳入g_site或null   
DEFINE r_success    LIKE type_t.num5
DEFINE r_flag       LIKE type_t.num5
DEFINE l_sql1       STRING
DEFINE l_sql2       STRING
DEFINE l_sql3       STRING
DEFINE l_sql4       STRING 
DEFINE l_sql5       STRING               
DEFINE l_sql6       STRING              
DEFINE l_sql7       STRING               
DEFINE l_sql8       STRING               
DEFINE l_sql9       STRING               
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE ooba_t.ooba002  #單別
DEFINE l_para       LIKE type_t.chr80    #單據別參數
DEFINE l_inaa014    LIKE inaa_t.inaa014  #允許負庫存否
DEFINE l_unit       LIKE inan_t.inan007  #庫存單位
DEFINE l_qty        LIKE inan_t.inan010  #庫存數量
DEFINE l_inap011    LIKE inap_t.inap011  #已確認的量
DEFINE l_inag008    LIKE inag_t.inag008  #庫存量
DEFINE l_inan010    LIKE inan_t.inan010  #在揀量+備置量 
DEFINE l_qty1       LIKE inan_t.inan010  #備置量-备置已冲销量 
DEFINE l_inaj011       LIKE inaj_t.inaj011
DEFINE l_inaj012       LIKE inaj_t.inaj012
DEFINE l_inaj011_qty   LIKE inaj_t.inaj011
DEFINE l_inap010       LIKE inap_t.inap010   #交易單位           
DEFINE l_inap011_qty   LIKE inap_t.inap011                     
DEFINE l_inaj045       LIKE inaj_t.inaj045                     
DEFINE l_xmdl018_sum   LIKE xmdl_t.xmdl018  
DEFINE l_indc102       LIKE indc_t.indc102  

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_flag = ''   
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_item) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_unit) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq200","lbl_xmdp015") RETURNING g_colname_1,g_comment_1   #交易單位
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
      RETURN r_success,r_flag
   END IF   

   IF cl_null(p_inan002) THEN LET p_inan002 = ' ' END IF
   IF cl_null(p_inan003) THEN LET p_inan003 = ' ' END IF
   IF cl_null(p_inan004) THEN LET p_inan005 = ' ' END IF
   IF cl_null(p_inan005) THEN LET p_inan005 = ' ' END IF
   IF cl_null(p_inan006) THEN LET p_inan006 = ' ' END IF
   #若p_site沒有值時預設g_site
   IF cl_null(p_site) THEN LET p_site = g_site END IF
  
   IF cl_null(p_docno_from) THEN LET p_docno_from=' ' END IF
   IF cl_null(p_seq_from) THEN LET p_seq_from = 0 END IF

   #依據傳入單據編號判斷單據別參數是否要作在揀量檢核
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   IF l_success THEN
      LET l_para = cl_get_doc_para(g_enterprise,p_site,l_slip,'D-BAS-0070')
   END IF
   
   #若庫位允許負庫存時則不須檢核庫存量是否足夠
    LET l_inaa014 = ''
    SELECT inaa014 INTO l_inaa014
      FROM inaa_t
     WHERE inaaent = g_enterprise
       AND inaasite = p_site
       AND inaa001 = p_inan004
    IF l_inaa014 = 'Y' THEN 
       LET r_flag = 1
       RETURN r_success,r_flag
    END IF     
  
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   CALL s_inventory_unit(p_site,p_item,p_unit,p_qty,p_imafsite)   
        RETURNING r_success,l_unit,l_qty
   IF NOT r_success THEN
      RETURN r_success,r_flag
   END IF

   #若是過帳還原時依據inaj紀錄的庫存單位進行過帳還原
   LET l_inaj045 = NULL
   IF cl_null(g_stutflag) THEN LET g_stutflag = '1' END IF
   IF cl_null(g_stuttype) THEN LET g_stuttype = '1' END IF
   IF g_stutflag = '2' THEN 
      SELECT inaj045 INTO l_inaj045 FROM inaj_t WHERE inajent = g_enterprise AND inajsite = p_site
         AND inaj001 = p_docno AND inaj002 = p_seq AND inaj003 = p_seq1
         AND inaj004 = g_stuttype * -1
      IF NOT cl_null(l_inaj045) THEN 
         CALL s_aooi250_convert_qty(p_item,l_unit,l_inaj045,l_qty)
              RETURNING r_success,l_qty
         IF NOT r_success THEN
            RETURN r_success
         END IF
         LET l_unit = l_inaj045
      END IF 
      LET g_stutflag = null
      LET g_stuttype = null
   END IF    
  
   #抓取訂單或工單備置量-已備置量
   LET l_sql5 = " SELECT SUM(xmdr008-xmdr009) ",
                "   FROM xmdr_t ",
                "  WHERE xmdrent = '",g_enterprise,"'",
                "    AND xmdrdocno = '",p_docno_from,"'",              
                "    AND xmdr001 = '",p_item,"'",
                "    AND xmdr002 = '",p_inan002,"'",
                "    AND xmdr003 = '",p_inan003,"'",
                "    AND xmdr007 = '",l_unit,"'"
   LET l_sql7 = " SELECT SUM(sfbb008-sfbb009) ",
                "   FROM sfbb_t ",
                "  WHERE sfbbent = '",g_enterprise,"'",
                "    AND sfbbdocno = '",p_docno_from,"'",
              
                "    AND sfbb001 = '",p_item,"'",
                "    AND sfbb002 = '",p_inan002,"'",
                "    AND sfbb003 = '",p_inan003,"'",
                "    AND sfbb007 = '",l_unit,"'"                

   LET l_sql8 = " SELECT inaj011,inaj012 FROM inaj_t ",
                "  WHERE inajent = ",g_enterprise,
                "    AND inajsite = '",p_site,"'",
                "    AND inaj001 = '",p_docno,"'",  #單號             
                "    AND inaj002 = ? ",    #項次     
                "    AND inaj003 = ? ",   #項序      
                "    AND inaj004 = '-1' "           #出庫
   PREPARE get_inaj_pre_axmt540 FROM l_sql8     

   #在撿量的判斷要扣除自身在撿量，再判斷庫存是否足夠
  
   LET l_sql9 = " SELECT inap012,SUM(inap013) FROM inap_t ", 
                "  WHERE inapent = ",g_enterprise,
                "    AND inapsite = '",p_site,"'",
                "    AND inap001 = '",p_docno,"'",  #單號
                #"    AND inap002 = ",p_seq           #項次   #PGS(D)-01534 mark
                "   AND cast(inap002 as int) = ",p_seq  #PGS(D)-01534 add
               ,"  GROUP BY inap012"                                     
   PREPARE get_inap_pre_axmt540 FROM l_sql9             
   
   #抓庫存量
   LET l_sql1 = " SELECT SUM(inag008) FROM inag_t ",
                "  WHERE inagent  = ",g_enterprise,
                "    AND inagsite = '",p_site,"' ",
                "    AND inag001  = '",p_item,"' ",
                "    AND inag002  = '",p_inan002,"' ",               
                "    AND inag007  = '",l_unit,"' "

   IF NOT cl_null(p_inan003) THEN
      LET l_sql1 = l_sql1," AND inag003 = '",p_inan003,"' "
   END IF
   IF NOT cl_null(p_inan004) THEN
      LET l_sql1 = l_sql1," AND inag004 = '",p_inan004,"' "
   END IF
   IF NOT cl_null(p_inan005) THEN
      LET l_sql1 = l_sql1," AND inag005 = '",p_inan005,"' "
   END IF
   IF NOT cl_null(p_inan006) THEN
      IF NOT g_aic_continue THEN       
         LET l_sql1 = l_sql1," AND inag006 = '",p_inan006,"' "
      END IF                                           
   END IF
   
   #D-BAS-0070參數設定為Y，要將在揀量及備置量加起來
   IF l_para = 'Y' THEN
      LET l_sql2 = " SELECT SUM(inan010) FROM inan_t "
   ELSE
      LET l_sql2 = " SELECT     inan010  FROM inan_t "
   END IF
   LET l_sql2 = l_sql2,"  WHERE inanent  = ",g_enterprise,   
                "    AND inansite = '",p_site,"' ",              
                "    AND inan001  = '",p_item,"' ",
                "    AND inan002  = '",p_inan002,"' ",              
                "    AND inan007  = '",l_unit,"' "
                
      LET l_sql2 = l_sql2," AND inan003 = '",p_inan003,"' "  
      LET l_sql2 = l_sql2," AND inan004 = '",p_inan004,"' "  
      LET l_sql2 = l_sql2," AND inan005 = '",p_inan005,"' "
  #IF NOT g_aic_continue THEN        #200814-00021#1 mark
     LET l_sql2 = l_sql2," AND inan006 = '",p_inan006,"' "                                                   
  #END IF                            #200814-00021#1 mark
   
   IF l_para = 'N' OR l_para IS NULL THEN        #避免单别没有D-BAS-0070参数考虑了在捡量
      LET l_sql2 = l_sql2 CLIPPED," AND inan000 = '2' "
   END IF
  
   PREPARE get_inag008_pre1_axmt540 FROM l_sql1
   LET l_inag008 = ''
   EXECUTE get_inag008_pre1_axmt540  INTO l_inag008
   IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
 
   PREPARE get_inan008_pre1_axmt540 FROM l_sql2  
   LET l_inan010 = ''
   EXECUTE get_inan008_pre1_axmt540 INTO l_inan010
   IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF

   PREPARE get_qty1_pre1_axmt540 FROM l_sql5        
   LET l_qty1 = ''
   EXECUTE get_qty1_pre1_axmt540 INTO l_qty1
   IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
   IF l_qty1 = 0 THEN 
                 
      PREPARE get_qty1_pre12_axmt540 FROM l_sql7                               
      LET l_qty1 = ''
      EXECUTE get_qty1_pre12_axmt540 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
   END IF

   IF s_inventory_imaa004_chk(p_item) THEN
      RETURN r_success,r_flag
   END IF

   LET l_inaj011 = 0
   LET l_inaj012 = ''

   EXECUTE get_inaj_pre_axmt540 USING p_seq,p_seq1 INTO l_inaj011,l_inaj012  
   IF cl_null(l_inaj011) THEN LET l_inaj011 = 0 END IF
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   IF NOT cl_null(l_inaj012) THEN  
      CALL s_inventory_unit(p_site,p_item,l_inaj012,l_inaj011,p_imafsite)   
           RETURNING r_success,l_unit,l_inaj011_qty          
   END IF          
  
   IF cl_null(l_inaj011_qty) THEN LET l_inaj011_qty = 0 END IF 
   #單據本身的在撿量
   LET l_inap010 = ''
   LET l_inap011 = 0
   EXECUTE get_inap_pre_axmt540 INTO l_inap010,l_inap011
   IF cl_null(l_inap011) THEN LET l_inap011 = 0 END IF
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   IF NOT cl_null(l_inap010) THEN     
      CALL s_inventory_unit(p_site,p_item,l_inap010,l_inap011,p_imafsite)   
           RETURNING r_success,l_unit,l_inap011_qty          
   END IF          
   
   IF cl_null(l_inap011_qty) THEN LET l_inap011_qty = 0 END IF

   IF l_para = 'Y' THEN
      LET l_inaj011_qty = l_inaj011_qty + l_inap011_qty
   END IF
  
   IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN    
      LET r_flag = 0
      INITIALIZE g_errparam TO NULL
      IF l_para = 'Y' THEN                   
         LET g_errparam.code = 'sub-00633'        
      ELSE
         LET g_errparam.code = 'sub-01447'
      END IF
     
      LET g_errparam.extend = p_item    
      LET g_errparam.replace[1] = p_seq      
      LET g_errparam.replace[2] = p_item     
      LET g_errparam.popup = TRUE
      IF g_prog <> 'asft310_01' THEN   
         CALL cl_err()
      END IF                           
      RETURN r_success,r_flag
   END IF

   #若單據申請時只有指定到庫位時，那抓取庫存量時
   #需SUM該庫位底下所有儲位、批號的總庫存量
   IF NOT cl_null(p_inan004) THEN
      LET l_sql4 = l_sql1," AND inag004 = '",p_inan004,"' "
      PREPARE get_inag008_pre2_axmt540 FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre2_axmt540 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF

      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = ' ' "
      ELSE    
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = ' ' AND inan006 = ' ' "
      END IF   
      PREPARE get_inan008_pre2_axmt540 FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre2_axmt540 INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
        
      LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"'"                                     
      PREPARE get_qty1_pre2_axmt540 FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre2_axmt540 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN       
         LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"'"                                       
         PREPARE get_qty1_pre22_axmt540 FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre22_axmt540 INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF 
      
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
     
      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   
            LET g_errparam.code = 'sub-00633'      
        
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF
         LET g_errparam.extend = p_item    
         LET g_errparam.replace[1] = p_seq      
         LET g_errparam.replace[2] = p_item     
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   
            CALL cl_err()
         END IF                           
         RETURN r_success,r_flag
      END IF
   END IF
   
   #若單據申請時只有指定到庫位、儲位時
   #那抓取庫存量時需SUM該庫位與儲位底下所有批號的總庫存量
   IF NOT cl_null(p_inan005) THEN
      LET l_sql4 = l_sql1," AND inag005 = '",p_inan005,"' " 
      PREPARE get_inag008_pre3_axmt540 FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre3_axmt540 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF

      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' "
      ELSE
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' AND inan006 = ' ' "
      END IF 
      PREPARE get_inan008_pre3_axmt540 FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre3_axmt540 INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
    
      LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"'"                    
      PREPARE get_qty1_pre3_axmt540 FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre3_axmt540 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN 
       
         LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' "         
         PREPARE get_qty1_pre32_axmt540 FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre32_axmt540 INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF        
     
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
      
      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   
            LET g_errparam.code = 'sub-00633'            
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF 
         LET g_errparam.extend = p_item    
         LET g_errparam.replace[1] = p_seq      
         LET g_errparam.replace[2] = p_item     
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   
            CALL cl_err()
         END IF                            
         RETURN r_success,r_flag
      END IF
   END IF
   
   #若單據申請時指定到庫位，儲位、批號時，那抓取庫存量時
   #需直接抓該庫位、儲位、批號的庫存量
   IF NOT cl_null(p_inan006) THEN      
      IF NOT g_aic_continue THEN                             
         LET l_sql4 = l_sql1," AND inag006 = '",p_inan006,"' "  
      END IF                                                  
      PREPARE get_inag008_pre4_axmt540 FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre4_axmt540 INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF

      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' "      
      ELSE
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' AND inan006 = '",p_inan006,"' "
      END IF                                                   
      PREPARE get_inan008_pre4_axmt540 FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre4_axmt540 INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
      
      IF g_aic_continue THEN
         LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"' "      
      ELSE   
         LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"' AND xmdr006 = '",p_inan006,"' "
      END IF                                                        
      PREPARE get_qty1_pre4_axmt540 FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre4_axmt540 INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN 
         IF g_aic_continue THEN         
            LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' "           
         ELSE
            LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' AND sfbb006 = '",p_inan006,"' "
         END IF                                                          
         PREPARE get_qty1_pre42_axmt540 FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre42_axmt540 INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF   
  
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
    
      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   
            LET g_errparam.code = 'sub-00633'           
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF 
         LET g_errparam.extend = p_item         
         LET g_errparam.replace[1] = p_seq     
         LET g_errparam.replace[2] = p_item    
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   
            CALL cl_err()
         END IF                           
         RETURN r_success,r_flag
      END IF
   END IF
   
   IF NOT s_inventory_chk_inao(p_docno,p_seq,p_seq1) THEN
      LET r_flag = 0
      RETURN r_success,r_flag
   END IF

   LET r_flag = 1
   RETURN r_success,r_flag
END FUNCTION

################################################################################
# Descriptions...: 檢核庫存在揀量和備置量應用元件(FOR 依項次檢查)
# Memo...........:
# Usage..........: CALL s_inventory_check_inan_seq(p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_docno_from,p_seq_from,p_imafsite)
#                  RETURNING r_success,r_flag
# Input parameter: p_site      營運據點
#                : p_item      料件編號
#                : p_inan002   產品特徵
#                : p_inan003   庫存管理特徵
#                : p_inan004   庫位
#                : p_inan005   儲位
#                : p_inan006   批號
#                : p_unit      交易單位
#                : p_qty       數量
#                : p_docno     單據編號
#                : p_seq       項次
#                : p_seq1      項序
#                : p_docno_from 訂單單號/工單單號   
#                : p_seq_from   訂單項次/工單項次   
#                : p_imafsite   營運據點(流通作業一律傳入ALL,製造傳入g_site或‘’) 
# Return code....: r_success   處理狀態
#                : r_flag      庫存量足夠否(1:庫存足夠/0:庫存不足)
# Date & Author..: 19/04/25 By 02159
# Modify.........: #190522-00022#1 add
# Modify.........:
################################################################################
PUBLIC FUNCTION s_inventory_check_inan_seq(p_site,p_item,p_inan002,p_inan003,p_inan004,p_inan005,p_inan006,p_unit,p_qty,p_docno,p_seq,p_seq1,p_docno_from,p_seq_from,p_imafsite)
DEFINE p_site       LIKE inan_t.inansite
DEFINE p_item       LIKE inan_t.inan001
DEFINE p_inan002    LIKE inan_t.inan002
DEFINE p_inan003    LIKE inan_t.inan003
DEFINE p_inan004    LIKE inan_t.inan004
DEFINE p_inan005    LIKE inan_t.inan005
DEFINE p_inan006    LIKE inan_t.inan006
DEFINE p_unit       LIKE inan_t.inan007
DEFINE p_qty        LIKE inan_t.inan010
DEFINE p_docno      LIKE inap_t.inap001
#DEFINE p_seq        LIKE inap_t.inap002  #PGS(D)-01534 mark
#DEFINE p_seq1       LIKE inap_t.inap003  #PGS(D)-01534 mark
DEFINE p_seq        LIKE inaj_t.inaj002   #PGS(D)-01534 add
DEFINE p_seq1       LIKE inaj_t.inaj003   #PGS(D)-01534 add
DEFINE p_docno_from LIKE inap_t.inap001    #訂單單號/工單單號   
#DEFINE p_seq_from   LIKE inap_t.inap002    #訂單項次/工單項次   #PGS(D)-01534 mark 
DEFINE p_seq_from   LIKE inaj_t.inaj002    #訂單項次/工單項次    #PGS(D)-01534 add
DEFINE p_imafsite   LIKE imaf_t.imafsite   #流通作業一律傳入ALL,製造傳入g_site或null   
DEFINE r_success    LIKE type_t.num5
DEFINE r_flag       LIKE type_t.num5
DEFINE l_sql1       STRING
DEFINE l_sql2       STRING
DEFINE l_sql3       STRING
DEFINE l_sql4       STRING 
DEFINE l_sql5       STRING               
DEFINE l_sql6       STRING              
DEFINE l_sql7       STRING               
DEFINE l_sql8       STRING               
DEFINE l_sql9       STRING               
DEFINE l_success    LIKE type_t.num5
DEFINE l_slip       LIKE ooba_t.ooba002  #單別
DEFINE l_para       LIKE type_t.chr80    #單據別參數
DEFINE l_inaa014    LIKE inaa_t.inaa014  #允許負庫存否
DEFINE l_unit       LIKE inan_t.inan007  #庫存單位
DEFINE l_qty        LIKE inan_t.inan010  #庫存數量
DEFINE l_inap011    LIKE inap_t.inap011  #已確認的量
DEFINE l_inag008    LIKE inag_t.inag008  #庫存量
DEFINE l_inan010    LIKE inan_t.inan010  #在揀量+備置量 
DEFINE l_qty1       LIKE inan_t.inan010  #備置量-备置已冲销量 
DEFINE l_inaj011       LIKE inaj_t.inaj011
DEFINE l_inaj012       LIKE inaj_t.inaj012
DEFINE l_inaj011_qty   LIKE inaj_t.inaj011
DEFINE l_inap010       LIKE inap_t.inap010   #交易單位           
DEFINE l_inap011_qty   LIKE inap_t.inap011                     
DEFINE l_inaj045       LIKE inaj_t.inaj045                     
DEFINE l_xmdl018_sum   LIKE xmdl_t.xmdl018  
DEFINE l_indc102       LIKE indc_t.indc102  

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_flag = ''   
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_item) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("ainq120","lbl_inag001") RETURNING g_colname_1,g_comment_1   #料件編號
      LET g_msg = g_colname_1
   END IF
   IF cl_null(p_unit) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("aicq200","lbl_xmdp015") RETURNING g_colname_1,g_comment_1   #交易單位
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
      RETURN r_success,r_flag
   END IF   

   IF cl_null(p_inan002) THEN LET p_inan002 = ' ' END IF
   IF cl_null(p_inan003) THEN LET p_inan003 = ' ' END IF
   IF cl_null(p_inan004) THEN LET p_inan005 = ' ' END IF
   IF cl_null(p_inan005) THEN LET p_inan005 = ' ' END IF
   IF cl_null(p_inan006) THEN LET p_inan006 = ' ' END IF
   #若p_site沒有值時預設g_site
   IF cl_null(p_site) THEN LET p_site = g_site END IF
  
   IF cl_null(p_docno_from) THEN LET p_docno_from=' ' END IF
   IF cl_null(p_seq_from) THEN LET p_seq_from = 0 END IF

   #依據傳入單據編號判斷單據別參數是否要作在揀量檢核
   CALL s_aooi200_get_slip(p_docno) RETURNING l_success,l_slip
   IF l_success THEN
      LET l_para = cl_get_doc_para(g_enterprise,p_site,l_slip,'D-BAS-0070')
   END IF
   
   #若庫位允許負庫存時則不須檢核庫存量是否足夠
    LET l_inaa014 = ''
    SELECT inaa014 INTO l_inaa014
      FROM inaa_t
     WHERE inaaent = g_enterprise
       AND inaasite = p_site
       AND inaa001 = p_inan004
    IF l_inaa014 = 'Y' THEN 
       LET r_flag = 1
       RETURN r_success,r_flag
    END IF     
  
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   CALL s_inventory_unit(p_site,p_item,p_unit,p_qty,p_imafsite)   
        RETURNING r_success,l_unit,l_qty
   IF NOT r_success THEN
      RETURN r_success,r_flag
   END IF

   #若是過帳還原時依據inaj紀錄的庫存單位進行過帳還原
   LET l_inaj045 = NULL
   IF cl_null(g_stutflag) THEN LET g_stutflag = '1' END IF
   IF cl_null(g_stuttype) THEN LET g_stuttype = '1' END IF
   IF g_stutflag = '2' THEN 
      SELECT inaj045 INTO l_inaj045 FROM inaj_t WHERE inajent = g_enterprise AND inajsite = p_site
         AND inaj001 = p_docno AND inaj002 = p_seq AND inaj003 = p_seq1
         AND inaj004 = g_stuttype * -1
      IF NOT cl_null(l_inaj045) THEN 
         CALL s_aooi250_convert_qty(p_item,l_unit,l_inaj045,l_qty)
              RETURNING r_success,l_qty
         IF NOT r_success THEN
            RETURN r_success
         END IF
         LET l_unit = l_inaj045
      END IF 
      LET g_stutflag = null
      LET g_stuttype = null
   END IF    
  
   #抓取訂單或工單備置量-已備置量
   LET l_sql5 = " SELECT SUM(xmdr008-xmdr009) ",
                "   FROM xmdr_t ",
                "  WHERE xmdrent = '",g_enterprise,"'",
                "    AND xmdrdocno = '",p_docno_from,"'",              
                "    AND xmdr001 = '",p_item,"'",
                "    AND xmdr002 = '",p_inan002,"'",
                "    AND xmdr003 = '",p_inan003,"'",
                "    AND xmdr007 = '",l_unit,"'"
   LET l_sql7 = " SELECT SUM(sfbb008-sfbb009) ",
                "   FROM sfbb_t ",
                "  WHERE sfbbent = '",g_enterprise,"'",
                "    AND sfbbdocno = '",p_docno_from,"'",
              
                "    AND sfbb001 = '",p_item,"'",
                "    AND sfbb002 = '",p_inan002,"'",
                "    AND sfbb003 = '",p_inan003,"'",
                "    AND sfbb007 = '",l_unit,"'"                

   LET l_sql8 = " SELECT inaj011,inaj012 FROM inaj_t ",
                "  WHERE inajent = ",g_enterprise,
                "    AND inajsite = '",p_site,"'",
                "    AND inaj001 = '",p_docno,"'",  #單號             
                "    AND inaj002 = ? ",    #項次     
                "    AND inaj003 = ? ",   #項序      
                "    AND inaj004 = '-1' "           #出庫
   PREPARE get_inaj_pre_seq FROM l_sql8     

   #在撿量的判斷要扣除自身在撿量，再判斷庫存是否足夠
  
   LET l_sql9 = " SELECT inap012,SUM(inap013) FROM inap_t ", 
                "  WHERE inapent = ",g_enterprise,
                "    AND inapsite = '",p_site,"'",
                "    AND inap001 = '",p_docno,"'",  #單號              
                #"    AND inap002 = ",p_seq           #項次  #PGS(D)-01534 mark
                "   AND cast(inap002 as int) = ",p_seq        #PGS(D)-01534 add
               ,"  GROUP BY inap012"                                     
   PREPARE get_inap_pre_seq FROM l_sql9             
   
   #抓庫存量
   LET l_sql1 = " SELECT SUM(inag008) FROM inag_t ",
                "  WHERE inagent  = ",g_enterprise,
                "    AND inagsite = '",p_site,"' ",
                "    AND inag001  = '",p_item,"' ",
                "    AND inag002  = '",p_inan002,"' ",               
                "    AND inag007  = '",l_unit,"' "

   IF NOT cl_null(p_inan003) THEN
      LET l_sql1 = l_sql1," AND inag003 = '",p_inan003,"' "
   END IF
   IF NOT cl_null(p_inan004) THEN
      LET l_sql1 = l_sql1," AND inag004 = '",p_inan004,"' "
   END IF
   IF NOT cl_null(p_inan005) THEN
      LET l_sql1 = l_sql1," AND inag005 = '",p_inan005,"' "
   END IF
   IF NOT cl_null(p_inan006) THEN
      IF NOT g_aic_continue THEN       
         LET l_sql1 = l_sql1," AND inag006 = '",p_inan006,"' "
      END IF                                           
   END IF
   
   #D-BAS-0070參數設定為Y，要將在揀量及備置量加起來
   IF l_para = 'Y' THEN
      LET l_sql2 = " SELECT SUM(inan010) FROM inan_t "
   ELSE
      LET l_sql2 = " SELECT     inan010  FROM inan_t "
   END IF
   LET l_sql2 = l_sql2,"  WHERE inanent  = ",g_enterprise,   
                "    AND inansite = '",p_site,"' ",              
                "    AND inan001  = '",p_item,"' ",
                "    AND inan002  = '",p_inan002,"' ",              
                "    AND inan007  = '",l_unit,"' "
                
      LET l_sql2 = l_sql2," AND inan003 = '",p_inan003,"' "  
      LET l_sql2 = l_sql2," AND inan004 = '",p_inan004,"' "  
      LET l_sql2 = l_sql2," AND inan005 = '",p_inan005,"' "
  IF NOT g_aic_continue THEN        
     LET l_sql2 = l_sql2," AND inan006 = '",p_inan006,"' "                                                   
  END IF                                          
   
   IF l_para = 'N' OR l_para IS NULL THEN        #避免单别没有D-BAS-0070参数考虑了在捡量
      LET l_sql2 = l_sql2 CLIPPED," AND inan000 = '2' "
   END IF
  
   PREPARE get_inag008_pre1_seq FROM l_sql1
   LET l_inag008 = ''
   EXECUTE get_inag008_pre1_seq  INTO l_inag008
   IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF
 
   PREPARE get_inan008_pre1_seq FROM l_sql2  
   LET l_inan010 = ''
   EXECUTE get_inan008_pre1_seq INTO l_inan010
   IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF

   PREPARE get_qty1_pre1_seq FROM l_sql5        
   LET l_qty1 = ''
   EXECUTE get_qty1_pre1_seq INTO l_qty1
   IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
   IF l_qty1 = 0 THEN 
                 
      PREPARE get_qty1_pre12_seq FROM l_sql7                               
      LET l_qty1 = ''
      EXECUTE get_qty1_pre12_seq INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
   END IF

   IF s_inventory_imaa004_chk(p_item) THEN
      RETURN r_success,r_flag
   END IF

   LET l_inaj011 = 0
   LET l_inaj012 = ''

   EXECUTE get_inaj_pre_seq USING p_seq,p_seq1 INTO l_inaj011,l_inaj012  
   IF cl_null(l_inaj011) THEN LET l_inaj011 = 0 END IF
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   IF NOT cl_null(l_inaj012) THEN  
      CALL s_inventory_unit(p_site,p_item,l_inaj012,l_inaj011,p_imafsite)   
           RETURNING r_success,l_unit,l_inaj011_qty          
   END IF          
  
   IF cl_null(l_inaj011_qty) THEN LET l_inaj011_qty = 0 END IF 
   #單據本身的在撿量
   LET l_inap010 = ''
   LET l_inap011 = 0
   EXECUTE get_inap_pre_seq INTO l_inap010,l_inap011
   IF cl_null(l_inap011) THEN LET l_inap011 = 0 END IF
   #若料號據點進銷存檔設置維多單位管理時，則庫存單位等於交易單位
   #若料號據點進銷存檔設置做單一單位管理時，則庫存單位等於料號據點進銷存檔設置的庫存單位
   IF NOT cl_null(l_inap010) THEN     
      CALL s_inventory_unit(p_site,p_item,l_inap010,l_inap011,p_imafsite)   
           RETURNING r_success,l_unit,l_inap011_qty          
   END IF          
   
   IF cl_null(l_inap011_qty) THEN LET l_inap011_qty = 0 END IF

   IF l_para = 'Y' THEN
      LET l_inaj011_qty = l_inaj011_qty + l_inap011_qty
   END IF
  
   IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN    
      LET r_flag = 0
      INITIALIZE g_errparam TO NULL
      IF l_para = 'Y' THEN                   
         LET g_errparam.code = 'sub-00633'        
      ELSE
         LET g_errparam.code = 'sub-01447'
      END IF
     
      LET g_errparam.extend = p_item    
      LET g_errparam.replace[1] = p_seq      
      LET g_errparam.replace[2] = p_item     
      LET g_errparam.popup = TRUE
      IF g_prog <> 'asft310_01' THEN   
         CALL cl_err()
      END IF                           
      RETURN r_success,r_flag
   END IF

   #若單據申請時只有指定到庫位時，那抓取庫存量時
   #需SUM該庫位底下所有儲位、批號的總庫存量
   IF NOT cl_null(p_inan004) THEN
      LET l_sql4 = l_sql1," AND inag004 = '",p_inan004,"' "
      PREPARE get_inag008_pre2_seq FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre2_seq INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF

      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = ' ' "
      ELSE    
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = ' ' AND inan006 = ' ' "
      END IF   
      PREPARE get_inan008_pre2_seq FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre2_seq INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
        
      LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"'"                                     
      PREPARE get_qty1_pre2_seq FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre2_seq INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN       
         LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"'"                                       
         PREPARE get_qty1_pre22_seq FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre22_seq INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF 
      
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
     
      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   
            LET g_errparam.code = 'sub-00633'      
        
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF
         LET g_errparam.extend = p_item    
         LET g_errparam.replace[1] = p_seq      
         LET g_errparam.replace[2] = p_item     
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   
            CALL cl_err()
         END IF                           
         RETURN r_success,r_flag
      END IF
   END IF
   
   #若單據申請時只有指定到庫位、儲位時
   #那抓取庫存量時需SUM該庫位與儲位底下所有批號的總庫存量
   IF NOT cl_null(p_inan005) THEN
      LET l_sql4 = l_sql1," AND inag005 = '",p_inan005,"' " 
      PREPARE get_inag008_pre3_seq FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre3_seq INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF

      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' "
      ELSE
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' AND inan006 = ' ' "
      END IF 
      PREPARE get_inan008_pre3_seq FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre3_seq INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
    
      LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"'"                    
      PREPARE get_qty1_pre3_seq FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre3_seq INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN 
       
         LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' "         
         PREPARE get_qty1_pre32_seq FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre32_seq INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF        
     
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
      
      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   
            LET g_errparam.code = 'sub-00633'            
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF 
         LET g_errparam.extend = p_item    
         LET g_errparam.replace[1] = p_seq      
         LET g_errparam.replace[2] = p_item     
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   
            CALL cl_err()
         END IF                            
         RETURN r_success,r_flag
      END IF
   END IF
   
   #若單據申請時指定到庫位，儲位、批號時，那抓取庫存量時
   #需直接抓該庫位、儲位、批號的庫存量
   IF NOT cl_null(p_inan006) THEN      
      IF NOT g_aic_continue THEN                             
         LET l_sql4 = l_sql1," AND inag006 = '",p_inan006,"' "  
      END IF                                                  
      PREPARE get_inag008_pre4_seq FROM l_sql4
      LET l_inag008 = ''
      EXECUTE get_inag008_pre4_seq INTO l_inag008
      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF

      IF g_aic_continue THEN
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' "      
      ELSE
         LET l_sql3 = l_sql2," AND inan004  = '",p_inan004,"' AND inan005 = '",p_inan005,"' AND inan006 = '",p_inan006,"' "
      END IF                                                   
      PREPARE get_inan008_pre4_seq FROM l_sql3
      LET l_inan010 = ''
      EXECUTE get_inan008_pre4_seq INTO l_inan010
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
      
      IF g_aic_continue THEN
         LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"' "      
      ELSE   
         LET l_sql6 = l_sql5," AND xmdr004  = '",p_inan004,"' AND xmdr005 = '",p_inan005,"' AND xmdr006 = '",p_inan006,"' "
      END IF                                                        
      PREPARE get_qty1_pre4_seq FROM l_sql6
      LET l_qty1 = ''
      EXECUTE get_qty1_pre4_seq INTO l_qty1
      IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF
      IF l_qty1 = 0 THEN 
         IF g_aic_continue THEN         
            LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' "           
         ELSE
            LET l_sql8 = l_sql7," AND sfbb004  = '",p_inan004,"' AND sfbb005 = '",p_inan005,"' AND sfbb006 = '",p_inan006,"' "
         END IF                                                          
         PREPARE get_qty1_pre42_seq FROM l_sql8
         LET l_qty1 = ''
         EXECUTE get_qty1_pre42_seq INTO l_qty1
         IF cl_null(l_qty1) THEN LET l_qty1 = 0 END IF   
      END IF   
  
      IF s_inventory_imaa004_chk(p_item) THEN
         RETURN r_success,r_flag
      END IF
    
      IF (l_inag008 + l_qty1 + l_inaj011_qty - l_inan010 - l_qty) < 0 THEN     
         LET r_flag = 0
         INITIALIZE g_errparam TO NULL
         IF l_para = 'Y' THEN                   
            LET g_errparam.code = 'sub-00633'           
         ELSE
            LET g_errparam.code = 'sub-01447'
         END IF 
         LET g_errparam.extend = p_item         
         LET g_errparam.replace[1] = p_seq     
         LET g_errparam.replace[2] = p_item    
         LET g_errparam.popup = TRUE
         IF g_prog <> 'asft310_01' THEN   
            CALL cl_err()
         END IF                           
         RETURN r_success,r_flag
      END IF
   END IF
   
   IF NOT s_inventory_chk_inao(p_docno,p_seq,p_seq1) THEN
      LET r_flag = 0
      RETURN r_success,r_flag
   END IF

   LET r_flag = 1
   RETURN r_success,r_flag
END FUNCTION

 
{</section>}
 
